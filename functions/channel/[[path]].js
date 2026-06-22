// CONFIDENTIAL - TRADE SECRET - Property of Joseph M. Castillo - All rights reserved
//
// Channel proxy — joeycastillo.us/channel/* -> discord-edge. Carries the yc_sess
// cookie so the edge can gate the (private) family-chat read on a valid session.
// Same shape as the /auth proxy.
const EDGE = "https://discord-edge-d5vc4tye3a-uw.a.run.app";
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
  const target = EDGE + url.pathname + url.search;
  const init = { method: req.method, headers: req.headers, redirect: "manual" };
  if (req.method !== "GET" && req.method !== "HEAD") init.body = await req.arrayBuffer();
  const resp = await fetch(target, init);
  const out = new Response(resp.body, resp);
  cors(out.headers);
  return out;
}
