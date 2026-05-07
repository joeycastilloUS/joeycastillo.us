// Bare /airbyte-migration/parity-live -> proxy to /dashboard.
// Delegates to the catchall handler; just imports + re-exports onRequest.
export { onRequest } from "./[[path]].js";
