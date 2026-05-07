// Cloudflare Pages Function: proxy joeycastillo.us/airbyte-migration/parity-live/*
// to the airbyte-parity Cloud Run service. Attaches a Google identity token
// generated from a service-account JSON key (CF env var GCP_SA_KEY).
//
// Auth chain:
//   1. Browser must have cookie airbyte_gate_token=<expected-hash> (set by
//      gate.js after the password matches). Without it -> 401.
//   2. Function generates a Google ID token via signed JWT exchange.
//   3. Proxies request to Cloud Run with Authorization: Bearer <id-token>.
//
// Read-only by design: only GET/POST forwarding; no mutating Cloud Run calls
// from this proxy beyond what the dashboard endpoints already support.

const CLOUD_RUN = "https://airbyte-parity-d5vc4tye3a-uc.a.run.app";
const REQUIRED_GATE_HASH = "1b7deda8eab377461e0a83e1484ce8177f5de16374992d0ce783fa1630eb8faa";

export async function onRequest(context) {
  const { request, env, params } = context;

  // 1. Gate check.
  const cookie = request.headers.get("cookie") || "";
  const m = /(?:^|;\s*)airbyte_gate_token=([0-9a-f]{64})/.exec(cookie);
  if (!m || m[1] !== REQUIRED_GATE_HASH) {
    return new Response(
      "Unauthorized -- enter password at /airbyte-migration/\n\n(received cookie: " +
      (cookie ? cookie.substring(0, 200) : "<none>") + ")",
      {
        status: 401,
        headers: { "cache-control": "no-store, no-cache, must-revalidate" },
      });
  }

  if (!env.GCP_SA_KEY) {
    return new Response("Server misconfig: GCP_SA_KEY not set", { status: 500 });
  }

  // 2. Build the upstream URL.
  // Catchall param 'path' is an array of path segments, or undefined for index.
  const path = (params.path && params.path.length > 0) ? "/" + params.path.join("/") : "/dashboard";
  const url = new URL(request.url);
  const upstream = CLOUD_RUN + path + url.search;

  // 3. Generate Google ID token.
  let idToken;
  try {
    idToken = await getIdToken(env.GCP_SA_KEY, CLOUD_RUN);
  } catch (e) {
    return new Response("Auth token generation failed: " + e.message, { status: 502 });
  }

  // 4. Proxy through.
  const headers = new Headers();
  headers.set("Authorization", "Bearer " + idToken);
  // Pass content-type for POSTs (e.g. /tick).
  const ct = request.headers.get("content-type");
  if (ct) headers.set("content-type", ct);

  const upstreamReq = new Request(upstream, {
    method: request.method,
    headers,
    body: request.method !== "GET" && request.method !== "HEAD" ? request.body : undefined,
  });

  const resp = await fetch(upstreamReq);
  const respHeaders = new Headers(resp.headers);
  respHeaders.delete("set-cookie");

  // The dashboard HTML's JS does fetch('/dashboard/data'), fetch('/dashboard/stream/...'),
  // etc. on absolute paths. Hosted under /airbyte-migration/parity-live/, those
  // hit Cloudflare's root, not our proxy. Rewrite HTML responses so the JS
  // calls the proxied path instead.
  const ct = (respHeaders.get("content-type") || "").toLowerCase();
  if (ct.includes("text/html")) {
    let body = await resp.text();
    // Order matters: rewrite the more-specific paths first to avoid double-prefixing.
    body = body
      .replaceAll("'/dashboard/", "'/airbyte-migration/parity-live/dashboard/")
      .replaceAll('"/dashboard/', '"/airbyte-migration/parity-live/dashboard/')
      .replaceAll("`/dashboard/", "`/airbyte-migration/parity-live/dashboard/")
      .replaceAll("'/parity/", "'/airbyte-migration/parity-live/parity/")
      .replaceAll('"/parity/', '"/airbyte-migration/parity-live/parity/')
      .replaceAll("`/parity/", "`/airbyte-migration/parity-live/parity/")
      .replaceAll("'/tick", "'/airbyte-migration/parity-live/tick")
      .replaceAll('"/tick', '"/airbyte-migration/parity-live/tick')
      .replaceAll("`/tick", "`/airbyte-migration/parity-live/tick");
    respHeaders.set("content-length", String(new TextEncoder().encode(body).length));
    respHeaders.delete("content-encoding"); // we returned plain text
    return new Response(body, {
      status: resp.status,
      statusText: resp.statusText,
      headers: respHeaders,
    });
  }

  // JSON / non-HTML responses pass through unmodified.
  return new Response(resp.body, {
    status: resp.status,
    statusText: resp.statusText,
    headers: respHeaders,
  });
}

// ----------------------------------------------------------------------
// Google ID token generation via service-account JWT exchange.
// Cached per-CF-instance for ~50 minutes (tokens last 60).
// ----------------------------------------------------------------------

let cachedToken = null;
let cachedTokenExp = 0;

async function getIdToken(saKeyJson, audience) {
  const now = Math.floor(Date.now() / 1000);
  if (cachedToken && cachedTokenExp > now + 60) return cachedToken;

  const sa = JSON.parse(saKeyJson);
  const header = { alg: "RS256", typ: "JWT", kid: sa.private_key_id };
  const claim = {
    iss: sa.client_email,
    sub: sa.client_email,
    aud: "https://oauth2.googleapis.com/token",
    iat: now,
    exp: now + 3600,
    target_audience: audience,
  };
  const unsigned = b64url(JSON.stringify(header)) + "." + b64url(JSON.stringify(claim));
  const signature = await signRS256(unsigned, sa.private_key);
  const jwt = unsigned + "." + signature;

  // Exchange JWT for ID token via Google's token endpoint.
  const body = new URLSearchParams({
    grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
    assertion: jwt,
  });
  const resp = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "content-type": "application/x-www-form-urlencoded" },
    body,
  });
  if (!resp.ok) {
    const text = await resp.text();
    throw new Error("token exchange " + resp.status + ": " + text.slice(0, 200));
  }
  const data = await resp.json();
  cachedToken = data.id_token;
  cachedTokenExp = now + 3000; // 50 min
  return cachedToken;
}

function b64url(str) {
  const bytes = typeof str === "string"
    ? new TextEncoder().encode(str)
    : new Uint8Array(str);
  let s = btoa(String.fromCharCode.apply(null, bytes));
  return s.replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

async function signRS256(data, pemKey) {
  const cleanPem = pemKey
    .replace(/-----BEGIN PRIVATE KEY-----/, "")
    .replace(/-----END PRIVATE KEY-----/, "")
    .replace(/\s+/g, "");
  const der = Uint8Array.from(atob(cleanPem), c => c.charCodeAt(0));
  const key = await crypto.subtle.importKey(
    "pkcs8",
    der,
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["sign"]
  );
  const sig = await crypto.subtle.sign(
    { name: "RSASSA-PKCS1-v1_5" },
    key,
    new TextEncoder().encode(data)
  );
  return b64url(sig);
}
