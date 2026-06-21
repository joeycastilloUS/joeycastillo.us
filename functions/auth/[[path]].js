// CONFIDENTIAL - TRADE SECRET - Property of Joseph M. Castillo - All rights reserved
//
// Operator-identity auth proxy. joeycastillo.us IS Joey's identity (FQDN = identity),
// so "Log in with Discord" lives under joeycastillo.us/auth/* — a pretty, on-brand URL —
// and is forwarded to the yosemite-conditions edge, which holds the client_secret and
// does the OAuth token exchange. Cookies (yc_sess, yc_oauth_state) and 302 redirects
// pass straight through; CORS lets the operator's sites read /auth/me with credentials.
//
// One identity provider, many sites. Add a site by adding its origin to ALLOW.
const EDGE = "https://discord-edge-d5vc4tye3a-uw.a.run.app";  // dedicated Discord jacket (acmedevUS/discord-edge)
const ALLOW = ["https://yosemite.camp", "https://joeycastillo.us"];

export async function onRequest(context) {
  const req = context.request;
  const url = new URL(req.url);
  const origin = req.headers.get("Origin") || "";
  function cors(h) {
    if (ALLOW.includes(origin)) {
      h.set("Access-Control-Allow-Origin", origin);
      h.set("Access-Control-Allow-Credentials", "true");
      h.set("Vary", "Origin");
    }
    return h;
  }
  if (req.method === "OPTIONS") {
    const h = new Headers();
    h.set("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
    h.set("Access-Control-Allow-Headers", "Content-Type");
    return new Response(null, { status: 204, headers: cors(h) });
  }
  // forward path+query to the edge; preserve method, headers (incl. Cookie), body
  const target = EDGE + url.pathname + url.search;
  const init = { method: req.method, headers: req.headers, redirect: "manual" };
  if (req.method !== "GET" && req.method !== "HEAD") init.body = await req.arrayBuffer();
  const resp = await fetch(target, init);
  // copy status + headers (Set-Cookie, Location preserved), then layer CORS
  const out = new Response(resp.body, resp);
  cors(out.headers);
  return out;
}
