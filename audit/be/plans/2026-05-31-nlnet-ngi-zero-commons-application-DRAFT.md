<!-- CONFIDENTIAL DRAFT - For Joey's review before submission - NOT YET PUBLIC -->

# NLnet NGI Zero Commons Fund — Application DRAFT
# For: kastil-systems / Joey Castillo (joeycastillo.us)
# Deadline: 2026-06-01 12:00 CEST  (~30 hours from publish)
# Submission URL: https://nlnet.nl/propose/

**Status:** DRAFT. Joey reviews → copy-edits → paste into NLnet portal at
`https://nlnet.nl/propose/` → submit before noon CEST Sunday.

**License commitment:** Apache-2.0 (OSI-approved, permissive, compatible
with downstream commercial use including kastil-systems's sovereign work).
Per NLnet terms only the FUNDED SCOPE must be OSS — the operator's private
key, the sovereign trust-root tools as deployed, and Joey's commercial
Pantheon platform remain proprietary. We're releasing the substrate
primitives, not the operator's instance.

---

## 1. Project name

**Sealed-IDS Mesh Membership — operator-signed trust-substrate for offline, FQDN-keyed zero-trust networks**

## 2. Abstract (≤150 words)

Sealed-IDS Mesh Membership is a pure-C99 cryptographic substrate for
operator-sovereign mesh networks: every node's membership is vouched for
by a single Ed25519 operator keypair (compiled-in trust root); the
operator-signed roster file is verified at boot by every node before any
peer traffic is accepted. The protocol enforces three trust guarantees
inside a single signature: anti-rollback (monotonic `signed_at`), 30-day
expiry (mandatory re-signing), and CRL-style revocation (signed
removed-node list). It runs on five live cloud VMs today as the trust
layer of an end-to-end zero-trust mesh. No frameworks, no cloud
lock-in, no third-party identity. The funded work releases the protocol
spec, the C99 reference verifier, the signing tools, and the
adversarial test suite as Apache-2.0 OSS — so the broader NGI ecosystem
can build operator-signed zero-trust networks without reinventing them.

## 3. Previous NLnet grantee?

No.

## 4. Requested amount

**€50,000** over 6 months.

Breakdown:
- €18,000 — Documentation + protocol spec extraction + reference-implementation cleanup (3 weeks FTE)
- €12,000 — Adversarial test suite + fuzz harness expansion + CI integration (2 weeks FTE)
- €10,000 — Cross-platform porting validation (Linux/macOS/Windows/embedded) + audit-prep documentation (2 weeks FTE)
- €6,000 — Community engagement: published artifact, IETF/RWC submission, three demo deployments documented (1 week FTE)
- €4,000 — Independent code-review contracting (single auditor pass on the released substrate)

## 5. Project topic (the meat — ~400 words)

Modern zero-trust mesh deployments depend on heavyweight identity
infrastructure: Kubernetes service meshes (Istio + SPIRE), HashiCorp
Vault + Consul, or proprietary platforms (Tailscale ACL, Cloudflare
Zero Trust). For most field deployments — IoT, edge compute, sovereign
operator networks, air-gapped industrial systems — those stacks are
overkill, network-dependent, and centralized on third-party identity.

Sealed-IDS Mesh Membership is the minimal viable substrate: a single
operator's Ed25519 keypair vouches for every node in the network, via a
single sealed roster file replicated to each node. Every node
independently verifies the signature against its compiled-in trust
root before accepting any peer traffic. No DNS dependency, no central
auth service, no Bayh-Dole-style ownership entanglement. The protocol
file format is 200 lines of spec, the reference verifier is 380 lines
of C99, and the signing tools are sub-100-LOC each.

Three trust guarantees ride inside the single Ed25519 signature, with
zero protocol churn:

1. **MH-1 anti-rollback** — every roster carries a `signed_at` timestamp;
   every node stores a `.seen` sidecar with the last-accepted value;
   any roster with an older timestamp is REJECTED. Defeats the
   "attacker presents a validly-signed older roster to roll the mesh
   back" attack.

2. **MH-2 expiry** — every roster carries a `valid_until` timestamp
   (default 30 days from signing). Expired rosters are REJECTED. Forces
   the operator to re-sign regularly, preserving the freshness signal.

3. **MH-3 revocation** — the roster may carry signed `revoked: <node>`
   triples; revoked nodes' triples are purged from every peer's local
   store at load time. CRL-style revocation without an OCSP server.

The reference implementation is currently deployed across 5 production
GCE VMs (4 primes + 2 relays across us-east4, us-west4, asia-southeast1,
asia-east2-b, us-west2). 616 assertions run on every commit via the
unified `make test` gate. The wire-protocol parser survives 100,000-
iteration fuzz with a 91% reject rate and zero crashes. The signing
tools and the verifier each have full unit + adversarial coverage
(30 + 27 assertions respectively).

The funded work formalizes the protocol spec, ships the reference
verifier and signing tools as Apache-2.0, documents the cross-platform
porting story, and engages the NGI community (IETF draft submission,
RWC contributed talk, three demo deployments).

## 6. Website

https://joeycastillo.us (operator surface, currently gated;
public-facing project page goes live as a funded deliverable).

The pure-C C99 source — under kastil-systems/nous + kastil-systems/a-d-d
— moves to a public OSS repo on grant approval. Specs +
documentation deliverables ship to a project page at sealed-ids.org
or similar (domain registered at grant start).

## 7. Tasks / work plan

| Phase | Weeks | Deliverable |
|---|---|---|
| 1. Documentation | 1-2 | Protocol spec extracted from a-d-d/nous/comms/skill/mesh/ → standalone RFC-style spec document; cross-platform porting guide; security model writeup |
| 2. Reference release | 3-4 | mesh_roster.c (verifier) + tool/operator-keygen + tool/mesh-roster-build + tool/operator-sign-node packaged as standalone Apache-2.0 repository; check.h test harness; full unit + adversarial test suite (≥100 assertions) |
| 3. Adversarial expansion | 5-6 | Wire-protocol fuzz harness extended (200k+ iter); per-attack negative tests (replay / rollback / tamper / wrong-key / truncation / bit-flip / over-length / expired-roster / forged-signature) |
| 4. Cross-platform | 7-8 | CI matrix: Linux (Ubuntu, Debian, Alpine), macOS (x86, ARM), Windows (MinGW + MSVC), embedded targets (ARM Cortex-M3 + RISC-V) |
| 5. Audit-prep | 9-10 | FIPS 140-3 Cryptographic Algorithm Validation Program (CAVP) submission package for the bundled ed25519 + SHA-256 + AES-256-GCM primitives (engineering work; CAVP fee not included in this grant) |
| 6. Community | 11-12 | Public release announcement; submit IETF I-D draft for the MESHROSTER1 binary format; submit a contributed talk to Real World Crypto 2027; document three reference deployments |
| 7. Independent code-review | 13-14 | Engage a single boutique cryptography auditor (Trail of Bits / Cure53 / NCC Group equivalent at the sub-€4k tier) for a focused review of the released substrate |

## 8. Compare with existing/historical efforts

| Project | What it does | Why Sealed-IDS Mesh Membership is different |
|---|---|---|
| **Nebula (Slack/DefinedNetworks)** | WireGuard-based overlay mesh with PKI | Same operator-CA model — Sealed-IDS adopts Nebula's trust shape but ships in 380 LOC of pure C99 vs Nebula's ~50k LOC Go runtime with WireGuard kernel module dependency. Targets minimal-substrate deployments Nebula can't reach (embedded, sub-MB binaries, no kernel-module requirement). |
| **WireGuard** | Kernel-level mesh VPN | Different layer — WireGuard is the transport; Sealed-IDS Mesh Membership is the identity layer. Could ride on top of WireGuard if operator chose. |
| **SPIFFE/SPIRE (CNCF)** | Workload identity for k8s/cloud | SPIRE requires a central control plane and a complex deployment. Sealed-IDS is decentralized by design — every node verifies the operator-signed roster independently. No central server. |
| **Tailscale** | Mesh VPN with cloud control plane | Tailscale's identity is Google/GitHub/SSO third-party. Sealed-IDS's identity is the operator's own Ed25519 key. No third party. |
| **Magic Wormhole** | Code-based pairing | Different problem — wormhole is short-lived pairing, Sealed-IDS is long-lived membership. |
| **TUF (Update Framework)** | Software update freshness/expiry | Direct architectural ancestor — Sealed-IDS adopts TUF's freshness + expiry pattern (MH-1 + MH-2) and applies it to mesh membership instead of package updates. Credits + references TUF in the released spec. |

## 9. Significant technical challenges

1. **The "format defined twice" risk.** The wire format (MESHROSTER1)
   is defined separately by the writer (`tool/mesh-roster-build`) and
   the reader (`mesh_roster.c`). We caught + fixed this in 2026-05-30
   by extracting a shared header (`security/mesh_roster_format.h` —
   single source of truth). The funded work will lock this in
   permanently with a structured ABI test.

2. **Clock-skew across geographic deployments.** MH-1 freshness +
   MH-2 expiry both depend on wall-clock time across all nodes. For a
   30-day TTL with nodes spread across 4 continents, a 24-hour clock
   skew is meaningless; for a 1-hour TTL, it would be catastrophic.
   Funded work documents the boundary and provides clock-skew test
   tooling.

3. **Operator key rotation.** The current substrate assumes a single
   long-lived operator key. Rotating it requires re-signing every
   node's cert + redistributing the new roster, which is a flag-day
   procedure. Funded work designs + documents a grace-window dual-key
   approach (MH-5 in our roadmap) so rotation can happen without a
   flag day. Implementation is out of grant scope; the spec is in.

4. **Post-quantum migration.** The current substrate uses Ed25519. NIST
   PQC standards (Dilithium / ML-DSA) are mature enough to add as a
   parallel signature now. Funded work documents the migration story:
   field "alg" added to the format, dual-sig during transition, full
   PQC after a multi-year migration window. Reference implementation
   for ML-DSA parallel signing is out of grant scope (a follow-on NGI
   Zero application would fund it).

## 10. Inspiring projects

- **curl** (Daniel Stenberg) — the gold standard for "single-maintainer
  pure-C foundational software." Sealed-IDS aspires to the same
  longevity-per-LOC ratio.
- **WireGuard** (Jason Donenfeld) — proof that a minimal substrate can
  displace heavyweight predecessors when the simplicity itself becomes
  the security argument.
- **The Update Framework (TUF)** — direct ancestor of our MH-1 + MH-2
  freshness/expiry pattern.
- **Sigstore** (Linux Foundation) — for the "transparent signature
  log" pattern; future Sealed-IDS work may add a Rekor-style public
  log for roster history.

## 11. Project plan / milestones

| Month | Milestone | Public artifact |
|---|---|---|
| M1 | Specification document + project website live | sealed-ids.org/spec/v1 (or NLnet-hosted) |
| M2 | Reference verifier + signing tools published as Apache-2.0 GitHub repo | github.com/kastil-systems/sealed-ids (or similar) |
| M3 | Adversarial test suite + fuzz harness extended; 200k-iter green | Same repo |
| M4 | Cross-platform CI matrix (Linux + macOS + Windows + 2 embedded targets) green | Same repo |
| M5 | CAVP submission package + boutique audit engaged | Audit report (under NDA with auditor; summary published with permission) |
| M6 | IETF I-D draft submitted; RWC talk submission filed; release announcement | datatracker.ietf.org/doc/draft-castillo-sealedids-meshroster |

## 12. Team / execution

**Joey Castillo** (joeycastillo.us) — sole-founder, 40 years
software architect (POS / hospitality / land+sea+air enterprise scale
production with billions of hours of combined uptime). Designed and
shipped the reference implementation across 5 production VMs. Will
execute the full work plan; no team to grow during the grant period.
Sovereign tech-stack discipline (pure-C99, no frameworks, no
third-party identity) is the entire value proposition — adding
contributors during grant period would dilute the discipline.

## 13. Other commitments / funding

kastil-systems is sole-founder (Joey Castillo). No other current
funding or grants. Pursuing NSF SBIR Phase I (US federal, opens
2026-06-02) in parallel — non-conflicting (NSF SBIR is for the
sovereign commercial platform Pantheon; this NLnet grant is for the
OSS-released substrate). Pursuing Sovereign Tech Fund (Germany)
on rolling basis for follow-on substrate work.

No employer affiliations or other obligations during the grant
period.

## 14. License chosen for funded work

**Apache License 2.0** (https://opensource.org/license/apache-2-0)

OSI-approved + FSF-listed permissive license. Compatible with both
public-sector / NGI use and downstream commercial integration.
Contains an explicit patent grant — appropriate for cryptographic
substrate where defensive patent posture matters.

## 15. Commitment to publish

I commit to publishing all funded deliverables (spec, reference
implementation, test suite, audit summary, IETF draft, release
announcement) under the Apache-2.0 license at a public GitHub repository
during the grant period. Source repository public-readable from
project start. All deliverables and roadmap public at the project
website. Quarterly progress reports public per standard NLnet
practice.

---

## Notes for Joey before submitting

1. **NLnet may ask for clarification on the funded-scope boundary.**
   Be ready to explain: the OSS release covers `mesh_roster.{c,h}` +
   `mesh-roster-build` + `operator-keygen` + `operator-sign-node` +
   `check.h` + the test suite. It does NOT cover your operator's
   private key, the deployed prime/relay binaries, or the Pantheon
   commercial platform.

2. **The €50k ask is calibrated for a sole-founder 6-month engagement.**
   NLnet NGI Zero Commons grants range €5k-€50k+ in the Commons Fund
   round, so this sits at the high end of the standard window. If
   they push back on size, you can scope to €30k by dropping phase 7
   (independent audit) and phase 5 (CAVP package — punt to a later
   round).

3. **The "no team" framing is intentional and a STRENGTH for NLnet.**
   NLnet specifically funds maintainer-led OSS work. Sole-founder is
   their target demographic. (Counter-example: a request that needs
   to hire 3 people to deliver a 6-month project would get pushback.)

4. **Submit at https://nlnet.nl/propose/** — the form is short, takes
   ~30-45 min if you paste from this draft.

5. **Cycle awareness:** NGI Zero Commons closes June 1, 2026 12:00
   CEST. Next round opens ~Q3 2026. Apply this round.
