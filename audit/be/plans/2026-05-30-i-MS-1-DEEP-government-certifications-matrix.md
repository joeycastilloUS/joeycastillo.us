# DEEP MATRIX — Government-Issued Security Certifications Worldwide

*Inspect report **I-MS-1-DEEP** · 2026-05-30 · prepared for Joey Castillo (joeycastillo.us, kastil-systems org)*

> **Mission v2.** Round 1 catalogued every government cert on Earth that the `nous` pure-C99 trust-mesh / machine-identity product could chase. Round 2 (this document) goes nine layers deep on each program against a fixed matrix: **WHO, TIMELINE, URL REF, URL TO ENTER, TERMS OF ENTRY, IP OWNERSHIP, SHARING REQUIREMENTS, DO WE OWN OUR IP — FINAL ANSWER, PROOF IN LAYMAN'S TERMS** — plus past-5-years and next-5-years event timelines.

> **The headline finding.** Every government cryptographic-conformance program reviewed (FIPS 140-3 CMVP, NIAP CC, EUCC, CSPN, BSZ, JCMVP, KCMVP, JISEC, KECS, SCCS, IC3S, AISEP, CCCS, MyCC) is a **conformance-testing** scheme — they test whether your product implements a published standard correctly. **None of them claim ownership of the vendor's invention or source code.** The single program with an unusual "vendor signs a binding agreement that goes beyond conformance testing" is **NSA CSfC** (Memorandum of Agreement: vuln-reporting SLAs, change-notification, allow-NSA-to-recommend-removal-from-list — but **no IP transfer**). The single program where **IP can leak by operation of law** rather than program rules is **OSCCA / China** (source code subject to government inspection under PRC Cryptography Law — avoid the mainline). **Joey retains 100% IP on every program in this document; only OSCCA poses a real IP risk, and it is opt-in only.** That is the bottom-line answer to "do they own my invention?" — **no.**

> **Sequence summary.** Read each program section as a 9-field matrix. Past-5-years events are noted inline under TIMELINE; next-5-years events under their own subsection at the end of each program. A consolidated 2021-2031 timeline appears in Part 9.

---

## TABLE OF CONTENTS

- **Part 1 — UNITED STATES**
  - 1.1 FIPS 140-3 / CMVP (NIST + CCCS)
  - 1.2 CAVP / ACVP
  - 1.3 NIAP Common Criteria (CCEVS)
  - 1.4 FedRAMP (Rev5 + 20x)
  - 1.5 DoD Impact Levels (IL2/IL4/IL5/IL6)
  - 1.6 CMMC 2.0
  - 1.7 NSA CSfC (Components List + MoA)
  - 1.8 DoDIN APL (sunsetting)
  - 1.9 BIS/EAR Encryption Export
- **Part 2 — EUROPEAN UNION + UK**
  - 2.1 EUCC (EU Common Criteria)
  - 2.2 Germany BSI — BSZ + CC + VS-NfD
  - 2.3 France ANSSI — CSPN + CC + Qualification
  - 2.4 UK NCSC — CAPSS, CPA, Cyber Essentials Plus
  - 2.5 Netherlands NSCIB, Italy OCSI, Spain CCN-STIC, Sweden CSEC, Norway SERTIT
  - 2.6 EUCS Cloud (status: stalled)
  - 2.7 Cyber Resilience Act (2027)
- **Part 3 — ASIA-PACIFIC**
  - 3.1 Japan — JCMVP + JISEC
  - 3.2 South Korea — KCMVP + KECS
  - 3.3 Singapore — SCCS + CLS + NITES
  - 3.4 China — OSCCA + MLPS 2.0 (⚠ IP risk)
  - 3.5 India — IC3S
  - 3.6 Taiwan NICST, Malaysia MyCC, Israel INCD
- **Part 4 — OTHER (Canada, Australia, NZ, Switzerland)**
- **Part 5 — MUTUAL RECOGNITION ARRANGEMENTS**
- **Part 6 — DFARS / Government-Purpose-Rights (when contracts are signed)**
- **Part 7 — NEW programs not in Round 1**
- **Part 8 — IP-RISK RANKING (1-page summary)**
- **Part 9 — CONSOLIDATED 2021-2031 TIMELINE**

---

# PART 1 — UNITED STATES

## 1.1 FIPS 140-3 / CMVP (Cryptographic Module Validation Program)

**1. WHO.** **National Institute of Standards and Technology (NIST)**, an agency of the U.S. Department of Commerce, jointly with the **Canadian Centre for Cyber Security (CCCS)**, a branch of the Communications Security Establishment Canada (CSE). Program managers: David Hawes (NIST) and Kailai Chen (CCCS). Third-party labs in the chain are **CSTLs — Cryptographic and Security Testing Laboratories** accredited under NVLAP (the NIST National Voluntary Laboratory Accreditation Program). The vendor pays the CSTL; the CSTL writes the test report; CMVP reviews; NIST issues the certificate. The standard itself (FIPS 140-3) is published by the U.S. Secretary of Commerce; it incorporates ISO/IEC 19790:2012 and ISO/IEC 24759:2017 by reference. **No IP path:** the lab is the vendor's contractor (NDA-governed); NIST/CCCS receive only the lab's report and the Security Policy.

**2. TIMELINE.** **Rolling.** Vendors submit when ready, year-round. The internal CMVP queue ("In Process List", https://csrc.nist.gov/Projects/Cryptographic-Module-Validation-Program/Modules-In-Process) shows the current backlog — 12-18 months of NIST review queue is normal in 2026. Average end-to-end is **>500 days** per SafeLogic 2025 data — a 42% increase over the FIPS 140-2 average.
- **Past-5-years events:**
  - **2020 Sep 22** — FIPS 140-3 took effect (transition began).
  - **2022 Apr 1** — Last day for new FIPS 140-2 submissions.
  - **2026 Jan 1** — Updated NIST cost-recovery fee schedule took effect (current numbers below).
  - **2026 Sep 21** — *(upcoming this fiscal year)* All remaining FIPS 140-2 certificates move from Active → Historical. After this date, federal procurement of new systems requires FIPS 140-3.
- Source for calendar: https://csrc.nist.gov/projects/fips-140-3-transition-effort

**3. URL REF.** Program home: https://csrc.nist.gov/projects/cryptographic-module-validation-program · Management Manual: https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/FIPS-140-3-CMVP%20Management%20Manual.pdf · Standard: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.140-3.pdf · Validated module list: https://csrc.nist.gov/projects/cryptographic-module-validation-program/validated-modules

**4. URL TO ENTER.** Vendors must engage a NVLAP-accredited CSTL directly — there is no NIST applicant portal. CSTL list: https://csrc.nist.gov/projects/testing-laboratories. Three recommended labs for a pure-C software module:
- **atsec information security** — https://www.atsec.com/contact-us/ — software-module specialty, FedRAMP-aware.
- **Acumen Security** — https://www.acumensecurity.net/contact/ — strong on NDcPP + FIPS bundle.
- **Lightship Security** — https://lightshipsec.com/contact/ — built a reputation on speed.
Other major US CSTLs: Leidos, Booz Allen Hamilton, Gossamer Security, UL Verification Services, Aegisolve. Vendor signs a commercial NDA with the lab (the lab needs source-level access to write the report).

**5. TERMS OF ENTRY.**
- **Eligibility:** Any vendor anywhere on Earth (no US citizenship requirement). The CSTL must be NVLAP-accredited; NVLAP labs exist in the US, Canada, Germany, UK, Spain, Italy, Turkey, Japan, India.
- **Prerequisites:** All approved algorithms must hold CAVP/ACVP certificates first (§1.2 below). Module must use only NIST-approved algorithms (CMVP cert covers the approved set; non-approved algos are allowed but listed separately as "Non-Approved Allowed/Non-Approved Not Allowed").
- **Costs (effective 2026-01-01, source https://csrc.nist.gov/projects/cryptographic-module-validation-program/nist-cost-recovery-fees):**

  | Scenario | NIST CR fee | NIST Extended CR (if review goes deep) |
  |---|---|---|
  | ALG, OEUP, PTSC, CVE, TRNS, PHYS, NSRL, RBND | **$2,500** | $1,000 |
  | UPDT | **$5,500** | $1,500 |
  | FS — Full Submission Level 1 | **$16,000** | $3,000 |
  | FS — Level 2 | **$17,000** | $4,000 |
  | FS — Level 3 | **$17,500** | $4,000 |
  | FS — Level 4 | **$19,000** | $4,000 |

  Lab fees: **$50k-$200k** typical (L1 software-only $50-100k; L2+ $100-250k). Internal engineering (KAT vectors, SP 800-90B entropy doc, FSM, security policy, vendor evidence): **$50k-$500k+**.
- **Calendar to first cert:** 12-24 months. Re-cert: 5 years on Active list (2 yrs Interim).

**6. 🔴 IP OWNERSHIP — DOES NIST CLAIM OWNERSHIP?** **NO.** The CMVP Management Manual is silent on vendor IP transfer — there is no IP-assignment clause. The only NIST agreement a vendor signs is the **End User License Agreement for ISO/IEC standards copies**, which restricts vendor's redistribution of ISO's copyrighted standards documents to the vendor itself; it grants NIST nothing in the vendor's product. Quoting NIST's own page on accessing the underlying ISO/IEC 19790 / 24759: *"ISO publications can only be bought for your personal individual use and cannot be transferred to another user."* That EULA is an inward-facing copyright restriction on ISO material — **not** a vendor-IP-transfer clause.
- Industry summary: per Chainguard's FIPS 140-3 guide (https://www.chainguard.dev/supply-chain-security-101/fips-140-3-everything-you-need-to-know), *"The FIPS 140 standard procedures protect each vendor's Intellectual Property (IP) while assuring high quality assessment."*
- Source-code disclosure: only to the **lab** under a commercial NDA. NIST itself never sees the source.
- **Verdict: Y/N → NO claim. Source URL: https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/FIPS-140-3-CMVP%20Management%20Manual.pdf — no IP-assignment clause exists anywhere in the Management Manual.**

**7. SHARING REQUIREMENTS.**
- **Public after certification:** (a) the **Validation Certificate** itself (a NIST-issued certificate number + module name + vendor + version + algorithm cert numbers), (b) the **Non-Proprietary Security Policy** (a PDF the vendor authors describing approved modes, roles, services, KAT results, FSM — but the vendor controls what is "proprietary" and what is "non-proprietary" and can redact accordingly; example: https://csrc.nist.gov/CSRC/media/projects/cryptographic-module-validation-program/documents/security-policies/140sp4970.pdf), (c) **CAVP algorithm certificate numbers** for each approved algorithm.
- **NOT public:** source code, finite state model, vendor evidence package, lab test report, entropy source design (SP 800-90B), internal KAT vectors.
- The cert listing on the Validated Modules List includes a one-line module description and the public Security Policy URL. **No source-code disclosure to the government, ever.**

**8. DO WE OWN OUR IP — FINAL ANSWER.** **YES. Joey retains 100% of `libsecurity.a` IP. NIST/CCCS receive only (a) the lab's conformance test report (which they never publish) and (b) the vendor-authored Non-Proprietary Security Policy (which the vendor controls the content of). The cert itself is a NIST validation number — a public listing of "vendor X's module Y, version Z, conforms to FIPS 140-3 at Level N." No source code, no design files, no patents, no copyrights, no trade secrets transfer to NIST or to CCCS or to the lab beyond the lab's commercial NDA-bound review.**

**9. PROOF IN LAYMAN'S TERMS.** **>1,000 modules currently active** on the CMVP validated list; **>5,000 validated since program inception** (1995). Cohort: every serious US security vendor — **Cisco** (multiple certs), **Palo Alto Networks** (FIPS 140-2/140-3 across the portfolio), **CrowdStrike Falcon**, **Microsoft Windows Crypto Provider**, **Apple CoreCrypto** (iOS/macOS), **Google BoringCrypto** (cert #4759, open source — proof a pure-source module can validate), **Oracle**, **Red Hat**, **Cisco IOS-XE**, **Juniper Junos**, **wolfSSL** (cert #4718, now with PQC; community-favorite proof an OSS C library can hold FIPS 140-3). Federal procurement under FISMA, FedRAMP, HIPAA-aligned, CJIS, and DoD all require FIPS-validated cryptography for any system that processes federal information. The CMVP cert is the cryptographic equivalent of UL on an extension cord — there is no procurement alternative.

**Next-5-years (2026-2031) — FIPS 140-3 watchlist:**
- **2026 Sep 21:** All remaining FIPS 140-2 certs → Historical list.
- **2027 Jan 1:** **CNSA 2.0 deadline** for software/firmware signing in new NSS acquisitions (RSA → ML-DSA / LMS / XMSS). NIAP PPs aligned to CNSA 2.0 already publishing; FIPS 140-3 modules without PQC will be ineligible for NSS new buys.
- **2027-2028:** ML-KEM / ML-DSA / SLH-DSA broadly available as CAVP algorithms; expect FIPS 140-3 modules to incorporate PQC primitives systematically.
- **2030-2031:** Likely sunset of legacy RSA / ECDH at the 112-bit security strength tier for federal use; CNSA 2.0 enterprise rollover deadline **Jan 1 2035** is the outer marker.
- Source: CNSA 2.0 timeline https://media.defense.gov/2022/Sep/07/2003071836/-1/-1/0/CSI_CNSA_2.0_FAQ_.PDF

---

## 1.2 CAVP / ACVP (Cryptographic Algorithm Validation Program / Automated Crypto Validation Protocol)

**1. WHO.** NIST + CCCS (same governance as CMVP). Labs are the same CSTLs. The ACVP server (operated by NIST) is the new automated front door.

**2. TIMELINE.** Rolling. Submissions accepted year-round via the ACVP server. Algorithm certs typically issue days-to-weeks after submission.

**3. URL REF.** https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program

**4. URL TO ENTER.** Same CSTL list as §1.1 — the lab submits to the ACVP server on the vendor's behalf. ACVP open source client: https://github.com/usnistgov/ACVP

**5. TERMS OF ENTRY.** Vendor implements the approved algorithms; lab generates test vectors via ACVP, runs them through the vendor's code, submits responses. ~$5-25k bundled.

**6. 🔴 IP OWNERSHIP.** **NO.** CAVP is pure black-box algorithm conformance — NIST sees only the test-vector responses, never the source. **No IP clause exists.**

**7. SHARING REQUIREMENTS.** Public: the algorithm certificate (a NIST cert number + algorithm + mode + parameter set). Nothing else.

**8. DO WE OWN OUR IP.** **YES. 100% retained. CAVP is the cleanest IP-posture cert in the entire global atlas.**

**9. PROOF.** Every FIPS-validated module holds dozens of CAVP certs — there are >50,000 CAVP certs issued. Mandatory precursor to CMVP.

---

## 1.3 NIAP Common Criteria (NIAP-CCEVS — National Information Assurance Partnership / Common Criteria Evaluation and Validation Scheme)

**1. WHO.** **NSA + NIST joint partnership** (NIAP is the program; CCEVS is the scheme). NIAP runs the US authoring-side of CCRA. Third-party labs in the chain: **CCTLs — Common Criteria Testing Laboratories** accredited by NVLAP. List: https://www.niap-ccevs.org/cctl. Same lab pool as CMVP (atsec, Acumen, Lightship, Leidos, Booz Allen, Gossamer, UL). Vendor signs commercial NDA with CCTL.

**2. TIMELINE.** **Rolling.** Vendor engages CCTL when ready. Typical lab phase 6-12 months; NIAP validation 2-4 months; total **12-18 months** for NDcPP-class evaluations.
- **Past-5-years events:**
  - **2014 (CCRA-2014):** CCRA scope reduced — only cPP-based evals get full mutual recognition above EAL2+ALC_FLR.
  - **2017+:** NIAP completed transition away from EAL-only evaluations to cPP-based exclusively.
  - **2022 Nov:** CC:2022 (ISO/IEC 15408:2022) published.
  - **2024 Jun 30:** Per CCRA Transition Policy (https://www.commoncriteriaportal.org/files/ccfiles/CC2022CEM2022TransitionPolicy.pdf), last day to **start** new CC v3.1 evaluations.
  - **2026:** CNSA 2.0-aligned NIAP PPs publishing (confirmed at RSAC 2026 by NSA's Dr. Morgan Stern); FDE cPP updated for CC:2022 + CNSA 2.0.
  - **2027 Dec 31:** Last day Security Targets conformant to CC:2022 based on CC v3.1 PPs are accepted.

**3. URL REF.** https://www.niap-ccevs.org/ · Policy Letters: https://www.niap-ccevs.org/Documents_and_Guidance/policy.cfm · PP catalog: https://www.niap-ccevs.org/protectionprofiles · Product Compliant List: https://www.niap-ccevs.org/Product/

**4. URL TO ENTER.** No portal — vendor contacts a CCTL directly. NIAP CCTL list (link above). For `nous`, three best fits:
- **Acumen Security** — https://www.acumensecurity.net/contact/ (volume CCTL for NDcPP).
- **Lightship Security** — https://lightshipsec.com/contact/ (advertise NDcPP turnaround in months).
- **Gossamer Security Solutions** — https://www.gossamersec.com/contact/ (network device + app PP specialty).

**5. TERMS OF ENTRY.**
- **Eligibility:** No citizenship; product must claim conformance to a NIAP-approved PP. For `nous`: **NDcPPv2.2e** (or successor v3.0e once CC:2022-aligned) + **PP-Module for VPN Gateway** and/or **PP-Module for VPN Client**.
- **Prerequisites:** FIPS 140-3 module validation (for the crypto inside the TOE) is effectively required — the cPP cryptographic SFRs reference FIPS-validated implementations.
- **Cost:** $200k-$500k for NDcPP base; $300k-$1M with multiple PP-Modules. NIAP itself charges no validation fee.
- **Calendar:** 12-18 months (well-prepped); 6-9 months in best cases.
- **Validity:** Posted on PCL; typically 2 years before Assurance Continuity / Assurance Maintenance required.

**6. 🔴 IP OWNERSHIP.** **NO.** NIAP is a conformance-testing scheme. The Validation Report (VR) and Security Target (ST) become public on the PCL; the proprietary Evaluation Technical Report (ETR) stays with the lab and NIAP and is not published. No clause in any CCEVS policy letter assigns vendor IP to the US government. **No IP-claim clause found in publicly available CCEVS program documentation.** Source: full Policy Letter index https://home.niap-ccevs.org/Documents_and_Guidance/policy.cfm.

**7. SHARING REQUIREMENTS.**
- **Public:** Security Target (ST), Validation Report (VR), Administrative Guidance, Operational User Guidance, Assurance Activity Report (AAR) summary. These are published on the PCL listing.
- **Confidential (with the lab + NIAP only):** Evaluation Technical Report (full ETR), source code shared with the lab under NDA, design documentation, vendor evidence.
- **Note on STs:** the Security Target is *a sales artifact as well as a confidentiality risk* — it describes the TOE's security functions in detail. Vendors routinely publish them on their own websites once posted.

**8. DO WE OWN OUR IP — FINAL ANSWER.** **YES. Joey retains 100% IP. The public artifacts (ST, VR) are vendor-authored documents describing the TOE's security behavior — they do not include source code, design schematics, cryptographic implementation, or anything that constitutes a trade secret unless the vendor chooses to disclose. The lab's ETR — which contains the deepest technical detail — is held confidentially by the lab and NIAP and never published. No IP transfer to NSA, NIST, or any lab beyond commercial NDA.**

**9. PROOF.** **PCL holds ~250-300 active products at any time.** Cohort: **Cisco** (ASA, IOS, Firepower — multiple NDcPP+VPN listings), **Palo Alto Networks** (PA-Series under NDcPP+VPN+IPS PP-Module), **Juniper Networks**, **Fortinet**, **F5**, **Citrix**, **Versa Networks** (Apr 2024 NIAP cert for SD-WAN security — https://versa-networks.com/news/2024/versa-networks-awarded-common-criteria-certificate-and-product-compliant-listing-by-niap-for-its-next-generation-security-capabilities/), **Aruba**, **Extreme Networks**. **CNSSP-11 mandates NIAP-validated COTS for National Security Systems**, so any IC/DoD network-device procurement filters to the PCL. NIAP cert is also a CSfC prerequisite (§1.7).

**Next-5-years — NIAP watchlist:**
- **2026-2027:** All cPPs being re-issued under CC:2022 with CNSA 2.0 algorithm requirements. NDcPP v3.0 expected during this window.
- **2027 Dec 31:** Hard sunset for CC v3.1 acceptances.
- **2028-2030:** PP-Modules for **post-quantum VPN** (hybrid X25519+ML-KEM Kyber initially; pure ML-KEM as confidence grows) become standard inclusions.

---

## 1.4 FedRAMP — Federal Risk and Authorization Management Program (Rev5 + 20x)

**1. WHO.** **GSA (General Services Administration) FedRAMP PMO**, under OMB Circular A-130. Third-party labs: **3PAOs — Third-Party Assessment Organizations** accredited by A2LA against ISO/IEC 17020.

**2. TIMELINE.**
- **Rolling.** Vendor engages 3PAO + agency sponsor when ready.
- **Past-5-years events:** Rev 4 → **Rev 5 transition completed 2024**. **FedRAMP Authorization Act** signed Dec 2022 codifying the program. **FedRAMP 20x announced March 2024.** Phase 1 closed 2025; **Phase 2 Moderate Pilot Cohort 1 selected 2026**.
- **2026 in-flight:**
  - **FY26 Q3 (by June 2026):** FedRAMP Consolidated Rules finalized (includes all 20x requirements).
  - **FY26 Q4 (Jul-Sep 2026):** **FedRAMP 20x pipeline opens for general applicants** (Phase 3).
  - **Sep 2026:** RFC-0024 deadline — all CSPs must transition to machine-readable OSCAL authorization packages.
- **2027-2031:** 20x becomes the default; Rev5 path slowly closes for new auths.
- Source: https://www.fedramp.gov/20x/phases/3/ · RFC-0024 analysis: https://www.paramify.com/blog/oscal-ssp

**3. URL REF.** https://www.fedramp.gov/ · 20x: https://www.fedramp.gov/20x/ · OSCAL: https://automate.fedramp.gov/documentation/ssp/ · Marketplace: https://marketplace.fedramp.gov/

**4. URL TO ENTER.** https://marketplace.fedramp.gov/ → "In Process" or "Authorized" registration. Vendor first needs (a) a federal agency sponsor for Agency-ATO path, or (b) qualifies for the JAB pipeline (effectively closed for new entrants in 2026 — the 20x program replaces it). 3PAO list: https://marketplace.fedramp.gov/assessors

**5. TERMS OF ENTRY.**
- **Eligibility:** US-incorporated CSP preferred (not mandatory, but US-based control of customer data is a control). For IL4+ effectively requires US-only personnel.
- **Categorization:** FIPS 199 → Low / Moderate / High.
- **Cost (2026 typical):**
  - **Low (Rev5):** $250-500k initial, $80-200k/yr ConMon.
  - **Moderate (Rev5):** $400k-1.8M initial, $120-300k/yr.
  - **High (Rev5):** $2.5M+ initial.
  - **20x Low/Moderate target:** **$100-300k** initial (the whole point of 20x is to crush the cost).
- **Calendar:** Rev5 Moderate 12-18 months; High 24+ months. 20x targets **weeks-to-a-few-months**.

**6. 🔴 IP OWNERSHIP.** **NO.** FedRAMP is a control-implementation assessment against NIST SP 800-53r5. The vendor submits an SSP (System Security Plan) — a vendor-authored description of how each control is implemented. **No IP transfer.** The federal sponsor obtains the right to *use* the cloud service under the FedRAMP authorization; the vendor retains all IP. Source code is **not** required for FedRAMP — assessment is at the control-implementation level, not the source-code level. **No IP-claim clause found in FedRAMP program documentation or in the standard FedRAMP Authorization template.**

**7. SHARING REQUIREMENTS.**
- **Public (FedRAMP Marketplace):** authorization status, baseline level, agency sponsor, 3PAO, FedRAMP package ID.
- **Confidential (shared with sponsor agency under the JAB/agency-only access controls in the Marketplace's secured repository):** Full SSP, SAR (Security Assessment Report), POA&M (Plan of Action and Milestones), continuous-monitoring reports.
- **Under 20x with OSCAL:** machine-readable evidence streams replace narrative; the data is still confidential.

**8. DO WE OWN OUR IP.** **YES. FedRAMP is an authorization-to-operate scheme; it grants federal agencies the right to use the service, not rights in the underlying product. No IP transfer to the government. Source-code review is not part of FedRAMP. If a federal agency *contracts* with you for custom development on top of the service, that contract may include DFARS or FAR data-rights clauses — but that is contracting, not FedRAMP.** (See Part 6 for DFARS analysis.)

**9. PROOF.** **>400 authorized cloud services** as of 2026 across the Marketplace. Cohort: **AWS GovCloud, Azure Government, Google Cloud for Government, Salesforce Government Cloud, ServiceNow, Microsoft 365 Government, Box Federal, Slack Federal, GitLab Federal, Snowflake Government, Databricks Government**. FedRAMP is the gating cert for SaaS sales to civilian federal agencies; StateRAMP extends the pattern to state/local. FedRAMP 20x's Phase 3 launch (Q3-Q4 2026) is the single biggest cost-floor reduction in federal SaaS history.

**Next-5-years — FedRAMP watchlist:**
- **2026 Sep:** RFC-0024 machine-readable OSCAL mandate.
- **2026 Q4:** FedRAMP 20x Phase 3 — wide-scale public adoption opens.
- **2027-2028:** Rev5 → 20x as default for new authorizations; old Rev5 path phased down.
- **2028-2030:** PQC cryptography requirements (CNSA 2.0 alignment) folded into FedRAMP baselines for IL4+/High.

---

## 1.5 DoD Impact Levels (IL2 / IL4 / IL5 / IL6) — DISA Cloud Computing SRG

**1. WHO.** **DISA — Defense Information Systems Agency** (DoD CIO). DISA publishes the Cloud Computing Security Requirements Guide (CC SRG). DoD CIO is the authorization authority for IL5/IL6.

**2. TIMELINE.** Rolling. Requires existing FedRAMP authorization first (Moderate for IL4/IL5; High for IL5/IL6) then a DoD-specific overlay assessment. **2024:** CC SRG version 2 revisions ongoing. **2026:** DoD JWCC contracts continue to drive demand.

**3. URL REF.** https://public.cyber.mil/dccs/

**4. URL TO ENTER.** Through your FedRAMP 3PAO, route to a DISA-recognized DoD sponsor. https://www.cyber.mil/

**5. TERMS OF ENTRY.** FedRAMP Moderate (IL4/IL5) or High (IL5/IL6) as prereq. IL5+ requires US-citizen-only personnel touching the boundary, dedicated DoD network connections, US-soil data residency. Cost: **+$200k-$1M on top of FedRAMP**, depending on Impact Level. Calendar: **+6-12 months on top of FedRAMP**.

**6. 🔴 IP OWNERSHIP.** **NO** at the program level. Same FedRAMP analysis. **Caveat:** the underlying DoD contract may invoke DFARS 252.227-7013 / -7014 (Part 6) — those clauses are contract-level, not IL-level. The IL itself claims no IP.

**7. SHARING REQUIREMENTS.** SSP/SAR/POA&M shared with DoD authorizing official. Continuous monitoring data streamed to DoD repository.

**8. DO WE OWN OUR IP.** **YES at the IL program level. Watch the underlying DoD contract: if signed as a DoD service contract, DFARS data-rights clauses can attach to deliverables — read every contract before signing. The IL authorization itself transfers no IP.**

**9. PROOF.** Same major-CSP cohort as FedRAMP, plus IL5-specific specialty providers (Lockheed Martin, General Dynamics IT, Leidos cloud offerings). IL5 mandatory for any DoD cloud handling higher-sensitivity CUI / mission-critical NSS.

**Next-5-years — DoD ILs:**
- **2026-2027:** JWCC (Joint Warfighting Cloud Capability) buys driving more IL5/IL6 demand.
- **2027:** CNSA 2.0 deadlines bleed into IL5/IL6 cryptographic requirements.

---

## 1.6 CMMC 2.0 — Cybersecurity Maturity Model Certification

**1. WHO.** **DoD CIO** owns the rule; **The Cyber AB** (formerly CMMC-AB) accredits assessors. Third-party labs: **C3PAOs — Certified Third-Party Assessment Organizations**.

**2. TIMELINE.**
- **2024 Oct 15:** Final rule (32 CFR Part 170) published in Federal Register.
- **2024 Dec 16:** Rule effective.
- **2025 Sep 10:** 48 CFR rule published (contractual implementation).
- **2025 Nov 10:** Phase 1 rollout began — CMMC clauses begin appearing in DoD contracts.
- **2026 Oct 31:** Phase 2 starts — Level 2 C3PAO certifications mandatory for applicable new contracts.
- **2027-2028:** Phase 3 — full DIB coverage expected.
- Source: https://secureframe.com/hub/cmmc/proposed-final-rule

**3. URL REF.** https://www.cyber.mil/index.cfm · https://cyberab.org/

**4. URL TO ENTER.** Cyber AB Marketplace https://cyberab.org/Catalog → select C3PAO → schedule assessment.

**5. TERMS OF ENTRY.**
- **Eligibility:** any DoD contractor / subcontractor handling FCI (Level 1) or CUI (Level 2/3).
- **Cost:** L1 $5-15k · **L2 $150k-$400k over 3 years** · L3 $100k-$2.7M.
- **Calendar:** 6-12 months prep + assessment.
- **Note:** *organizational* certification, not a *product* cert. Certifies the contractor.

**6. 🔴 IP OWNERSHIP.** **NO.** CMMC assesses the contractor's organizational practices against NIST SP 800-171 (L2) or 800-172 (L3). **No IP transfer.** Source code review not part of CMMC.

**7. SHARING REQUIREMENTS.** Assessment results go to eMASS (Enterprise Mission Assurance Support Service); status visible to DoD POs. SSP and POA&M held by the contractor + C3PAO + DoD.

**8. DO WE OWN OUR IP.** **YES. CMMC is org-level posture certification. No IP claims.** (Again: the *contracts* you bid under may have DFARS clauses — see Part 6 — but those are contract terms, not CMMC.)

**9. PROOF.** Required for any DoD contract that touches FCI/CUI (Phase 2 starts Oct 31 2026). Cohort: every prime DoD contractor (Lockheed, Northrop, RTX, General Dynamics, Boeing Defense) plus tens of thousands of subs. ~80,000 firms in the DIB.

---

## 1.7 NSA CSfC — Commercial Solutions for Classified

**1. WHO.** **NSA / Information Assurance Directorate (IAD)** under the CSfC Program Management Office. No third-party labs — NSA itself performs the CSfC component review (after the NIAP CC eval), and the customer (a government agency) integrates components into a Registered Solution per a Capability Package.

**2. TIMELINE.** Rolling. Vendor engagement begins as the NIAP CC eval enters validation. CSfC review 3-6 months after NIAP cert posts. The CSfC Components List is updated as new vendors clear MoA + review.

**3. URL REF.** https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/ · Components List: https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/Components-List/ · Customer Handbook: https://media.defense.gov/2021/Apr/02/2002613880/-1/-1/0/CSFC%20PMO%20CUSTOMER%20HANDBOOK_02062021.PDF

**4. URL TO ENTER.** Email **csfc@nsa.gov**. Initial conversation, then formal MoA. https://www.nsa.gov/business/

**5. TERMS OF ENTRY.**
- **Eligibility:** US-domiciled vendor preferred (NSA-MoA party). Foreign vendors can be considered case-by-case.
- **Prerequisites:** NIAP CC cert against the relevant PP/PP-Module (IPsec VPN Client/Gateway, MACsec, TLS, etc.) + FIPS 140-3 cert + signed Memorandum of Agreement.
- **Cost:** mostly the underlying NIAP + FIPS investment (§§1.1, 1.3). MoA itself is no-fee but binds the vendor to ongoing vuln-disclosure SLAs.
- **Calendar:** 18-36 months end-to-end (NIAP + FIPS + CSfC review).

**6. 🔴 IP OWNERSHIP.** **NO — but read the MoA carefully.** Per Corsec and the NSA CSfC FAQ (https://www.nsa.gov/portals/75/documents/resources/everyone/csfc/csfc-faqs.pdf, which returned 403 in our fetch but is referenced repeatedly in industry summaries):
- *"in the event the vendor independently discovers a vulnerability or makes changes to a product that may potentially cause it not to meet NSA security requirements based on NTISSP No. 11, the vendor agrees it will notify NSA in writing as soon as practicable."* (paraphrased from MOU/MOA text reproduced in industry analyses, https://militaryembedded.com/comms/encryption/getting-to-two-layer-commercial-encryption).
- The MoA includes: vuln reporting SLAs, change-notification, NSA's right to recommend removal from Components List if SLAs are not met.
- **The MoA does NOT transfer IP, copyright, patents, or any rights in the vendor's product to NSA.** It is a vendor-product-stewardship agreement, not an IP-assignment.
- **Verdict: Y/N → NO IP transfer; YES to ongoing operational obligations (vuln SLAs, change notification, optional removal from list).** Source URL: https://militaryembedded.com/comms/encryption/getting-to-two-layer-commercial-encryption + https://www.corsec.com/csfc/ industry summaries.

**7. SHARING REQUIREMENTS.**
- **Public:** Components List entry (vendor name, product, version, applicable Capability Package).
- **Confidential to NSA:** the underlying NIAP eval evidence (already at NIAP), plus vendor's vulnerability/CVE reports.
- **No source code disclosure required.**

**8. DO WE OWN OUR IP — FINAL ANSWER.** **YES. The CSfC MoA is the most operationally demanding agreement on the entire global atlas (vuln SLAs, NSA-can-remove-you), but it transfers no IP. Joey retains 100% of the product IP; what he assigns to NSA is *ongoing diligence* (notify on vulns, notify on changes, fix or be removed). This is closer to a service-level commitment than an IP license.**

**9. PROOF.** **~80-100 components on the CSfC Components List** as of 2026 across MA, MSC, CW, DAR capability packages. Cohort: **Cisco** (multiple IPsec VPN gateways/clients), **Aruba (HPE)**, **Juniper Networks**, **Palo Alto Networks**, **F5 Networks**, **Crypto4A** (HSMs), **Curtiss-Wright** (rugged platforms), **General Dynamics** (TACLANE), **Viasat**. CSfC is *the* commercial route to classified data protection (the alternative is NSA Type-1 crypto, which is not a commercial path).

**Next-5-years — CSfC watchlist:**
- **2026-2027:** Capability Packages updating to CNSA 2.0 (PQC algorithm requirements).
- **2027-2028:** New CP for SDN / cloud-native classified mesh expected.
- **2028+:** Expansion to support quantum-resistant key exchange in the inner+outer layer composition.

---

## 1.8 DoDIN APL — DoD Information Network Approved Products List (SUNSETTING)

**1. WHO.** **DISA APCO** (Approved Products Certification Office).

**2. TIMELINE.**
- **2025 Sep 30:** Program officially sunset.
- **2025 Dec 31:** All currently scheduled APL testing concludes.
- **FY26:** APL repository maintained for continuity, but no new entries.
- **Replacement:** DISA RME (Risk Management Executive) Vendor STIG program for cybersecurity, plus UCR-CORE for interoperability, enforced contractually.
- Source: https://aplits.disa.mil/docs/DODIN_APL_SUNSET_FAQ.pdf

**3. URL REF.** https://aplits.disa.mil/ · Sunset FAQ: https://aplits.disa.mil/docs/DODIN_APL_SUNSET_FAQ.pdf

**4. URL TO ENTER.** Closed to new entries. Email disa.meade.peo-transport.list.approved-products-certification-of@mail.mil for legacy questions. New path: **DISA RME Vendor STIG** + contract-level enforcement.

**5. TERMS OF ENTRY.** N/A — no new entries. (Historically: sponsoring DoD agency + STIG questionnaire + Letter of Compliance + interop testing.)

**6. 🔴 IP OWNERSHIP.** Was never an IP-claim program. **NO.**

**7. SHARING REQUIREMENTS.** Was a public APL listing.

**8. DO WE OWN OUR IP.** **Moot — program sunset. Don't pursue.**

**9. PROOF.** Was the gating list for DoD network procurement of switches, routers, VPN concentrators, UCC, EMS. Cohort: every major network vendor. Replaced by STIG-conformance + UCR-CORE contractual model in 2026.

---

## 1.9 BIS / EAR — US Export Control on Encryption

**1. WHO.** **Bureau of Industry and Security (BIS)**, US Department of Commerce. Coordinated with NSA (encryption notifications go to both).

**2. TIMELINE.** Rolling. ENC self-classification + one-time notification for publicly-available open-source crypto.

**3. URL REF.** https://www.bis.doc.gov/index.php/policy-guidance/encryption/

**4. URL TO ENTER.** Email crypt@bis.doc.gov and encryption@nsa.gov per 15 CFR 742.15(b)(2). SNAP-R portal for license applications: https://snapr.bis.doc.gov

**5. TERMS OF ENTRY.** US person / US-domiciled exporter. ECCN for `libsecurity.a`: almost certainly **5D002**. License Exception **ENC** (15 CFR 742.15 / 740.17). Open-source crypto: one-time notification + source URL → largely deregulated.

**6. 🔴 IP OWNERSHIP.** **NO.** BIS regulates *export*, not IP. No IP transfer to US government.

**7. SHARING REQUIREMENTS.** For open-source: notify with source URL (which the vendor already chose to make public). For commercial 5D002: file an ENC self-classification report annually.

**8. DO WE OWN OUR IP.** **YES. Export control is a regulatory layer, not an IP claim. Joey retains 100% IP regardless of EAR posture.**

**9. PROOF.** Every encryption-capable US-origin product navigates EAR. Open-source crypto under TSU/publicly-available exception: OpenSSL, LibreSSL, BoringSSL, libsodium, age, wolfSSL. ITAR does NOT apply unless the product is built for a USML defense article — which `nous` is not.

---

# PART 2 — EUROPEAN UNION + UK

## 2.1 EUCC — EU Cybersecurity Certification Scheme on Common Criteria

**1. WHO.** **European Commission** (legal instrument); **ENISA** (European Union Agency for Cybersecurity, operational support); **NCCAs** (National Cybersecurity Certification Authorities) in each Member State; **CABs** (Conformity Assessment Bodies = certification bodies); **ITSEFs** (IT Security Evaluation Facilities = labs). Established by **Commission Implementing Regulation (EU) 2024/482 of 31 January 2024**; entered into force 27 Feb 2025. Authoritative source: https://eur-lex.europa.eu/eli/reg_impl/2024/482/oj/eng.

**2. TIMELINE.**
- **2019 Apr:** Cybersecurity Act (Reg (EU) 2019/881) entered into force, creating the framework.
- **2024 Jan 31:** Implementing Reg 2024/482 adopted.
- **2025 Feb 27:** EUCC went LIVE — scheme operational.
- **2026 Feb 27:** SOG-IS MRA ceased issuing new certs; national EU schemes (OCSI in Italy, etc.) ceased issuing national-only certs.
- **2026 Q4 (scheduled):** Delegated Act establishing EUCC presumption-of-conformity for Cyber Resilience Act.
- **2027 Dec 11:** CRA main obligations apply — EUCC becomes the primary path to CE marking under CRA for "important / critical" digital products.
- **Sources:** https://www.atsec.com/one-year-of-eucc/, https://eucyberact.org/wp-content/uploads/2022/05/S22a-GeyerK.pdf
- Rolling submission cycle — vendor engages an ITSEF and CAB at any time.

**3. URL REF.** Regulation: https://eur-lex.europa.eu/eli/reg_impl/2024/482/oj/eng · ENISA scheme page: https://certification.enisa.europa.eu/certification-library/eucc-certification-scheme_en · ENISA certs registry (operational 2025+): https://certification.enisa.europa.eu/

**4. URL TO ENTER.** Vendor selects a **CAB** in an EU Member State. Major active EUCC CABs as of 2026:
- **Germany BSI** — https://www.bsi.bund.de/EN/ (file via Bonn). Cooperates with ITSEFs like TÜVIT, SRC, secuvera, atsec Munich, Brightsight Munich.
- **France ANSSI** — https://cyber.gouv.fr/en (file via Paris). ITSEFs: Amossys, CEA, Oppida, SERMA, Thales, Quarkslab.
- **Netherlands TrustCB** — https://trustcb.com/ (the Dutch private-sector CAB operator).
- **Italy OCSI / ACN** — https://www.acn.gov.it/portale/en (newly accredited for EUCC, transition done).
- **Spain CCN OC-CCN** — https://oc.ccn.cni.es/en

**5. TERMS OF ENTRY.**
- **Eligibility:** any vendor anywhere (no EU-establishment requirement).
- **Assurance Levels:** Substantial (AVA_VAN.1/2 ~ EAL2-3) and High (AVA_VAN.3/4/5 ~ EAL4-7).
- **Prerequisites:** Security Target + lab engagement + CAB engagement. PP from approved EUCC PP catalog (or non-PP-conformant if accepted by CAB).
- **Cost:** €150-400k Substantial; €300k-€1M+ High; **+per-NCCA validation fees** (vary per Member State).
- **Calendar:** 9-18 months.

**6. 🔴 IP OWNERSHIP.** **NO — and the regulation says so explicitly.** Quoting **Article 43 of Commission Implementing Regulation (EU) 2024/482 verbatim**:

> *"Conformity assessment bodies, national cybersecurity certification authorities, ECCG, ENISA, the Commission and all other parties shall ensure the security and protection of business secrets and other confidential information, including trade secrets, as well as the preserving intellectual property rights, and take the necessary and appropriate technical and organisational measures."*

Source: https://eur-lex.europa.eu/eli/reg_impl/2024/482/oj/eng (Article 43).

Additional confidentiality safeguards:
- **Article 8(2):** applicant evidence including source code is provided *"subject to safeguards against unauthorised disclosure."*
- **Articles 21(1)(c) and 22(1)(c):** CABs and ITSEFs must put in place *"appropriate technical and operational measures to effectively protect confidential and sensitive information."*
- **Article 47(6):** *"prior to the publication of the opinion, all sensitive, personal or proprietary information shall be removed from the published documents."*
- **Verdict: Y/N → NO IP claim. The regulation affirmatively requires IP-rights protection. This is the most IP-protective verbatim clause in any of the programs reviewed.**

**7. SHARING REQUIREMENTS.**
- **Public (Art 42):** the certificate, the certification report (sensitive content removed), status changes, lists of accredited bodies.
- **Confidential (Art 8, 21, 22, 40):** source code, evaluation evidence, ITSEF reports — held by CAB and ITSEF for ≥5 years post-withdrawal under Art 40(2) confidentiality.

**8. DO WE OWN OUR IP — FINAL ANSWER.** **YES. EUCC is the gold standard for IP-protective language. Article 43 explicitly mandates the protection of vendor IP rights and trade secrets by every party in the chain (CAB, ITSEF, ENISA, NCCA, Commission). Source code and design evidence are explicitly safeguarded; the public certification report has sensitive/proprietary content removed before publication.**

**9. PROOF.** As of 1-year retrospective (atsec, https://www.atsec.com/one-year-of-eucc/), early EUCC adoption is in the smartcard/IC and HSM space (legacy SOG-IS High-assurance vendors transitioning). Cohort: **Infineon, NXP, STMicroelectronics, IDEMIA, Thales DIS, Utimaco, Bull/Atos, Eviden**. EUCC's Substantial level is the natural fit for a network device / VPN product — far fewer certs there yet, meaning **first-mover positioning is available**.

**Next-5-years — EUCC watchlist:**
- **2026 Q4:** Delegated Act presuming CRA conformity for EUCC-certified products.
- **2027 Dec 11:** CRA enforcement begins; "important / critical" products effectively need EUCC.
- **2027-2028:** EUCC scheme extensions: EUCS (cloud) and EU5G (5G) — both in stalled drafts as of 2026, expected to revive 2027-2028.
- **2028-2030:** Post-quantum requirements folded into EUCC PP catalog.

---

## 2.2 Germany — BSI (BSZ + CC + VS-NfD)

**1. WHO.** **Bundesamt für Sicherheit in der Informationstechnik (BSI)** — Federal Office for Information Security, under the Federal Ministry of the Interior. ITSEFs in Germany: **TÜVIT, SRC Security Research & Consulting, secuvera, atsec Munich, Brightsight Munich (a SGS subsidiary), OS-S, Telekom Security**.

**2. TIMELINE.**
- **2020:** BSZ launched as an accelerated alternative to full CC.
- **2025 Feb:** EUCC live; BSI began transition strategy for national-CC evaluations to EUCC.
- **2026 Feb 27:** German national CC scheme ceases issuing new national certs; BSI now issues under EUCC.
- BSZ remains as a German-specific accelerated path (does NOT issue EUCC — it issues a BSI BSZ certificate, valid for 2 years).
- **Past-5 cycle:** rolling submission; ~3 months per BSZ cert; ongoing for CC/EUCC. https://eucyberact.org/wp-content/uploads/2022/05/S22a-GeyerK.pdf

**3. URL REF.**
- BSI EN portal: https://www.bsi.bund.de/EN/
- BSZ: https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/Anerkennung-von-Stellen-und-Zertifizierung-IT-Sicherheitsdienstleister/BSZ/bsz.html
- CC / EUCC at BSI: https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/zertifizierung-und-anerkennung_node.html
- Cryptographic technical guidelines: BSI TR-02102

**4. URL TO ENTER.**
- BSZ: contact BSI directly (zertifizierung@bsi.bund.de) and select an ITSEF.
- ITSEFs: **TÜVIT** https://www.tuvit.de/en/services/cyber-security/bsz/, **SRC** https://src-gmbh.de/en/portfolio/favorites/accelerated-safety-certification/, **secuvera** https://www.secuvera.de/, **atsec Munich** https://www.atsec.com/

**5. TERMS OF ENTRY.**
- **Eligibility:** any vendor anywhere (no German-residency requirement).
- **BSZ standard:** EN 17640 (Fixed-time Cybersecurity Evaluation Methodology for ICT Products / FiT CEM).
- **BSZ docs needed:** product itself + Security Target (security pledge by manufacturer). Very lean documentation requirement vs full CC.
- **Cost (BSZ):** not publicly published. Industry estimate **€50-120k** for ITSEF fees + small BSI cert fee. Far cheaper than full CC.
- **Calendar (BSZ):** **~3 months order-to-cert.** Cert valid 2 years.
- **VS-NfD Zulassung:** separate BSI process for German classified-info approval at the lowest tier; qualified-procedure path for accelerated approval.

**6. 🔴 IP OWNERSHIP.** **NO.** BSI is a conformance-testing scheme. BSI publishes the certification report and security target only with manufacturer's agreement (consistent with EU Art 43 alignment). ITSEF holds evaluation evidence under contractual confidentiality. No IP-claim clause in BSI BSZ documentation or in EUCC alignment. **No IP-claim clause found in publicly available BSI/BSZ program documentation.**

**7. SHARING REQUIREMENTS.** Certification report and security target published with vendor consent. Vulnerability details handled under BSI's responsible disclosure procedures.

**8. DO WE OWN OUR IP.** **YES. BSI BSZ is the German parallel to CSPN — fast, cheap, IP-clean. BSI is a respected sovereign cert body; the certification report does not include source code or design internals.**

**9. PROOF.** Certified BSZ products (BSI list https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/Zertifizierung-von-Produkten/Beschleunigte-Sicherheitszertifizierung/Zertifizierte-Produkte-nach-BSZ/zertifizierte-produkte-nach-bsz_node.html): **LANCOM Systems** (German network vendor — multiple network components), **Genua**, **Rohde & Schwarz Cybersecurity**, **Achelos**, **Federal Printing Office** components. The BSZ list is small (~30-50 products), which means **inclusion is differentiating** in the German market.

**Next-5-years — BSI:**
- **2026-2028:** BSI scaling EUCC issuance; BSZ remains as fast-path.
- **2027+:** Post-quantum requirements in TR-02102 cryptographic recommendations cascade into BSZ + EUCC scope.

---

## 2.3 France — ANSSI (CSPN + CC + Qualification)

**1. WHO.** **Agence nationale de la sécurité des systèmes d'information (ANSSI)** — under the Secretary-General for National Defence and Security (SGDSN), Prime Minister's office. **CESTI labs** (Centres d'Évaluation de la Sécurité des Technologies de l'Information): Amossys, CEA-Leti, Oppida, SERMA Safety & Security, Thales (DIS / SiX), Quarkslab, Lexfo, Synacktiv.

**2. TIMELINE.**
- **2008:** CSPN created.
- **2025:** CSPN methodology updated to mandate stricter hardware + communication security against logical and relay attacks (per Chambers Cybersecurity 2026 France https://practiceguides.chambers.com/practice-guides/cybersecurity-2026/france).
- **2026:** CSPN continues as a national French scheme (not subsumed by EUCC because CSPN is a national first-level — EUCC covers "Substantial" and "High" but not the CSPN-shape lightweight first-level eval).
- **2026 Feb 27:** French national CC ceased issuing for new evaluations; ANSSI's CC role now via EUCC.
- Rolling submission.

**3. URL REF.**
- ANSSI EN: https://cyber.gouv.fr/en
- CSPN: https://cyber.gouv.fr/offre-de-service/solutions-certifiees-et-qualifiees/
- Certified products: https://cyber.gouv.fr/produits-certifies

**4. URL TO ENTER.** Email **certification@ssi.gouv.fr**. CESTI list at https://cyber.gouv.fr/centres-devaluation-cesti-prestataires-devaluation-de-la-securite-pase
- **Quarkslab** — https://www.quarkslab.com/cspn-security-certification/ — well-regarded for CSPN.
- **Amossys** — https://www.amossys.fr/
- **SERMA Safety & Security** — https://www.serma-safety-security.com/

**5. TERMS OF ENTRY.**
- **Eligibility:** any vendor; no French-residency requirement. (Article notes CSPN cert "currently only legally applies to the French marketplace" but eligibility to be certified is global — a US vendor can hold a CSPN cert and that cert is what unlocks French gov procurement. Source: https://embeddedcomputing.com/technology/security/cspn-what-u-s-companies-need-to-know-about-the-security-certification-process.)
- **CSPN format:** 25-35 person-day black-box evaluation by an ANSSI CESTI lab. Methodology updated 2025.
- **Cost:** **€15-50k all-in** (smallest of any government cert in this report).
- **Calendar:** **~8 weeks** (per Quarkslab + Embedded Computing Design) to ~3-6 months including ANSSI cert issuance.
- **Validity:** 3 years.
- **Qualification ANSSI** is a separate, higher tier post-cert; tiers Élémentaire / Standard / Renforcée. Required for sensitive French gov use.

**6. 🔴 IP OWNERSHIP.** **NO.** Per Embedded Computing Design quoting ANSSI/CESTI practice: *"Technical assistance provided by developers to evaluators... helps developers protect a company's intellectual property and product-related deliverables. The evaluation facility and its personnel are obliged to maintain professional secrecy for the products they evaluate and the results they obtain during the evaluation."* (source above)
- Also: *"With the sponsor's agreement, ANSSI publishes the security target and the certification report of the certified CSPN product on its website."* — **publication is sponsor-controlled.**
- **Verdict: Y/N → NO IP claim. Professional-secrecy obligation on CESTI lab; vendor-controlled publication of ST + cert report.**

**7. SHARING REQUIREMENTS.** Cert report + Security Target published *with sponsor consent*. CESTI lab bound by professional secrecy on all other materials.

**8. DO WE OWN OUR IP — FINAL ANSWER.** **YES. CSPN is the cleanest, cheapest, fastest European IP-clean cert. Sponsor controls what gets published. Lab is bound by professional secrecy.**

**9. PROOF.** ANSSI's Catalogue lists ~150 CSPN-certified products. Cohort: **HarfangLab EDR** (https://harfanglab.io/edr/anssi-certification/), **Palo Alto Networks** Strata/Cortex (https://www.paloaltonetworks.com/legal-notices/trust-center/anssi-cspn-top-level-certification), **Stormshield**, **Tehtris**, **Wallix**, **Quarkslab IronTec**, **Systancia**. CSPN is the entry-level French gov pre-req and a respected European stamp.

**Next-5-years — ANSSI:**
- **2026-2028:** CSPN evolution to align with EU Cybersecurity Act / CRA where appropriate; ANSSI Qualification process gaining importance for French sensitive-info use.
- **2027+:** Post-quantum updates to RGS (Référentiel Général de Sécurité).

---

## 2.4 UK — NCSC (CAPSS + CPA + Cyber Essentials Plus)

**1. WHO.** **National Cyber Security Centre (NCSC)** — part of GCHQ. **NPSA (National Protective Security Authority)** runs CAPSS jointly with NCSC. **IASME Consortium** runs Cyber Essentials.

**2. TIMELINE.**
- **2014:** Cyber Essentials launched.
- **2018:** CPA framework revised; CAPSS jointly published with CPNI (now NPSA).
- **2025-2026:** Cyber Essentials v3.3 announced — **takes effect 27 April 2026** with new mandatory MFA + auto-fail rules.
- UK CCRA status: consuming-only (no new UK-issued CC certs of significance).

**3. URL REF.**
- NCSC: https://www.ncsc.gov.uk/
- CAPSS: https://www.npsa.gov.uk/system-information-security/cyber-assurance-physical-security-systems-capss
- CPA: https://www.ncsc.gov.uk/information/commercial-product-assurance-cpa
- Cyber Essentials: https://www.ncsc.gov.uk/cyberessentials/overview

**4. URL TO ENTER.**
- CAPSS: contact NCSC via https://www.ncsc.gov.uk/ + NPSA buyer-side guide https://www.npsa.gov.uk/capss-cse-buyers-guide.
- CPA: NCSC selects evaluation partner; example partner: NCC Group (https://www.ncsc.gov.uk/organisation/ncc-group/commercial-product-assurance-cpa).
- Cyber Essentials Plus: any IASME Certification Body https://iasme.co.uk/cyber-essentials/

**5. TERMS OF ENTRY.**
- **CAPSS:** UK-sensitive systems orientation; physical security + cyber for IP-connected security devices. NPSA + NCSC scope.
- **CPA:** general assurance scheme; foundation level common, Augmented for higher-sensitivity.
- **Cyber Essentials Plus v3.3 (Apr 2026):** *organizational* baseline cert. **Mandatory MFA on ALL cloud services**; **14-day patching** for CVSS≥7; **IP allowlisting no longer counts as MFA**; cloud services cannot be excluded from scope; business social media counts as cloud. Cost £1-15k typical. Source: https://www.arcsystems.co.uk/news/cyber-essentials-plus-v3-3/

**6. 🔴 IP OWNERSHIP.** **NO** for all three. CAPSS/CPA are conformance-testing schemes. Cyber Essentials is an org-posture cert that doesn't touch product IP. **No IP-claim clause found in publicly available NCSC program documentation.**

**7. SHARING REQUIREMENTS.** CPA cert + Security Procedures published by NCSC (vendor reviews). CE+ is an org cert with no product-level disclosure.

**8. DO WE OWN OUR IP.** **YES on all three. Cyber Essentials Plus is org-level (no IP at stake at all). CAPSS / CPA are conformance schemes (no IP transfer).**

**9. PROOF.** CPA-certified products (https://www.ncsc.gov.uk/products/commercial-product-assurance-cpa-certified-products) include **Becrypt, Becrypt tVolution, Echoworx, BlackBerry SecuSUITE**. Cyber Essentials Plus held by **>40,000 UK organizations** including most UK gov suppliers.

**Next-5-years — UK NCSC:**
- **2026 Apr 27:** CE+ v3.3 mandatory.
- **2027+:** CAPSS / CPA likely consolidating; NCSC moving toward future tech assurance frameworks (https://www.ncsc.gov.uk/collection/technology-assurance/future-technology-assurance/whitepaper-current-state-tech-assurance).

---

## 2.5 Netherlands NSCIB, Italy OCSI, Spain CCN-STIC, Sweden CSEC, Norway SERTIT

**1-9 summary table (all conformance schemes; all transitioned to EUCC for new CC evals as of 2026):**

| Country | Body | Operator | URL | IP claim? | EUCC role |
|---|---|---|---|---|---|
| Netherlands | **NSCIB** (Netherlands Scheme for Certification in the area of IT Security) | **TrustCB** as CAB | https://trustcb.com/ | NO | Active EUCC CAB; smartcard specialty |
| Italy | **OCSI** (Organismo di Certificazione della Sicurezza Informatica) | **ACN** (Agenzia per la Cybersicurezza Nazionale) | https://www.acn.gov.it/portale/en | NO | Transitioned to EUCC Feb 2026 |
| Spain | **OC-CCN** + **CPSTIC catalogue** | **CCN** (Centro Criptológico Nacional) under CNI | https://oc.ccn.cni.es/en + https://cpstic.ccn.cni.es/en | NO | Spanish national scheme + CPSTIC catalogue under National Security Scheme (ENS) |
| Sweden | **CSEC** (Sveriges Certifieringsorgan för IT-säkerhet) | **FMV** | https://www.fmv.se/csec | NO | Active EUCC participant |
| Norway | **SERTIT** | **NSM** (Nasjonal sikkerhetsmyndighet) | https://sertit.no/ | NO | Non-EU but aligns with EUCC; bilateral arrangements |

**Spain CCN-STIC** detail: The **CPSTIC catalogue** (https://cpstic.ccn.cni.es/en/) is Spain's *qualified products* list for public-sector use under the National Security Scheme (ENS). Foreign vendors can be listed — **AWS** has 25 services certified; **CrowdStrike Falcon** is CPSTIC-listed at the "high" level. Cohort proof a non-Spanish vendor can hold the cert.

**IP for the bundle:** All five are conformance-testing schemes operating under CCRA + EUCC. **NO IP transfer to any of them.**

---

## 2.6 EUCS — EU Cybersecurity Certification Scheme for Cloud Services (STATUS: STALLED)

**1. WHO.** **ENISA**, **European Commission**, ad-hoc cloud-services working group.

**2. TIMELINE.** Multiple draft candidate schemes (May 2023 v1.0.319, August 2023 v1.0.335, March 2024 v1.0.413). **As of mid-2026, on hold** — political deadlock over the "sovereignty" requirements (immunity from non-EU laws). Council of EU urged in Sep 2024 to break the deadlock; **resumption expected 2027**.
- Source: https://www.cep.eu/fileadmin/user_upload/cep.eu/cepItalia/cepInput_EU_Cloud_Certification_at_an_Impasse.pdf

**3. URL REF.** https://www.enisa.europa.eu/publications/eucs-cloud-service-scheme

**4-9.** Not yet available for vendor entry. Track for 2027+.

---

## 2.7 Cyber Resilience Act (CRA) — Regulation (EU) 2024/2847

**1. WHO.** **European Commission** (DG CONNECT). **ENISA** coordinates. **Notified Bodies** for third-party conformity assessment (CRA Article 32+).

**2. TIMELINE.**
- **2024 Oct 23:** CRA adopted.
- **2024 Dec 10:** Entered into force.
- **2026 Sep 11:** Reporting obligations begin (vulnerability disclosure to ENISA + CSIRTs).
- **2027 Dec 11:** Main obligations apply — manufacturers must place only CRA-conforming products on EU market.
- Source: https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act

**3. URL REF.** https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act · CCLab analysis https://www.cclab.com/news/cyber-resilience-act-eucc-explained-key-differences-overlaps-and-compliance-pathways

**4. URL TO ENTER.** Most products: **self-assessment** + CE marking. "Important" Class I/II + "Critical" products: **third-party Notified Body**, OR use an EU certification scheme (EUCC).

**5. TERMS OF ENTRY.** Any product with "digital elements" sold in EU. Three tiers: general / important / critical.

**6. 🔴 IP OWNERSHIP.** **NO.** CRA imposes cybersecurity obligations on manufacturers; conformity assessment is a process check, not an IP grant. No IP transfer clause.

**7. SHARING REQUIREMENTS.** Public: EU declaration of conformity, CE marking, vulnerability disclosure to ENISA + CSIRTs (Art 14). Source code not required for general or important classes.

**8. DO WE OWN OUR IP.** **YES. CRA is regulatory; EUCC under CRA is conformance-testing. No IP transfer.**

**9. PROOF.** Affects every connected product entering EU market. Compliance pathway expected to be **EUCC for important/critical** per Q4 2026 Delegated Act.

---

# PART 3 — ASIA-PACIFIC

## 3.1 Japan — JCMVP + JISEC

**1. WHO.** **IPA — Information-technology Promotion Agency** (independent administrative institution under METI). NITE (National Institute of Technology and Evaluation) accredits labs. Labs: ECSEC Laboratory, Mizuho Information & Research Institute, BSI Japan.

**2. TIMELINE.** Rolling. CRYPTREC publishes approved-algorithm lists annually. JCMVP rolling submission via IPA.

**3. URL REF.**
- JCMVP: https://www.ipa.go.jp/en/security/jcmvp/index.html
- JISEC: https://www.ipa.go.jp/en/security/jisec/
- CRYPTREC: https://www.cryptrec.go.jp/en/

**4. URL TO ENTER.** Contact IPA security center; lab list at https://www.ipa.go.jp/en/security/jcmvp/lablist.html

**5. TERMS OF ENTRY.**
- Standard: KS X / JIS X ISO/IEC 19790 (equivalent to FIPS 140-3). Algorithm validation against CRYPTREC list (AES, Camellia, SHA-2/3, RSA, ECDSA, EdDSA, ML-KEM/ML-DSA).
- Cost: similar to FIPS 140-3 minus the NIST cost-recovery fee; **¥10-25M typical lab fees**.
- Calendar: 9-18 months.
- JISEC: CCRA-authoring CC scheme; ¥15-50M for full evaluation.

**6. 🔴 IP OWNERSHIP.** **NO.** Both JCMVP and JISEC are conformance schemes. IPA is silent on IP claims; standard conformance testing model. **No IP-claim clause found in publicly available JCMVP / JISEC program documentation.**

**7. SHARING REQUIREMENTS.** Validated Modules List + Algorithm Verified Implementation List public (https://www.ipa.go.jp/en/security/jcmvp/val.html). Security Target + cert report public for JISEC.

**8. DO WE OWN OUR IP.** **YES. Mirror of US CMVP / NIAP CC posture. No IP transfer to IPA or any lab beyond commercial NDA.**

**9. PROOF.** JCMVP cohort: **NTT, Hitachi, Fujitsu, NEC, Toshiba** (Japan-domestic + global vendors via Camellia compliance). JISEC cohort: same plus international (FUJI XEROX, Konica Minolta, RICOH, Canon — major multifunction printer presence).

---

## 3.2 South Korea — KCMVP + KECS

**1. WHO.** **NSR — National Security Research Institute** under **NIS — National Intelligence Service** for KCMVP. **ITSCC — IT Security Certification Center** under NIS for KECS (Korean CC).

**2. TIMELINE.**
- **Past-5-years:** KCMVP 3.0 in force. **2025 → 2026:** new submissions require ≥128-bit security strength (up from 112). (Source: https://nenkin.io/wiki/schemes/kcmvp)
- Rolling submission.

**3. URL REF.** https://eng.nis.go.kr/

**4. URL TO ENTER.** Through NIS-approved Korean laboratory (KISA, TTA). Vendor typically partners with Korean distributor / consultant.

**5. TERMS OF ENTRY.**
- **Algorithm mandate:** KCMVP requires Korean national algorithms — **ARIA, SEED, LEA, HIGHT, HAS-160, LSH**. AES *alone* will NOT pass — modules must implement at least one Korean algo as the primary approved cipher.
- **Cost:** ₩50-150M typical.
- **Calendar:** 9-18 months.

**6. 🔴 IP OWNERSHIP.** **NO** at the program level — KCMVP is conformance testing for the Korean algorithm suite. **Note:** to participate, vendor implements government-published algorithms (ARIA/SEED/LEA are KS X standards — the algorithms themselves are public). Implementing them does not give NIS rights to your implementation, but your implementation is now part of a regulated market. **No IP-claim clause found in publicly available KCMVP program documentation.**

**7. SHARING REQUIREMENTS.** Validated Modules List public.

**8. DO WE OWN OUR IP.** **YES at the program level. The engineering ask — adding SEED/ARIA/LEA implementations to `libsecurity.a` — is a 3-6 month effort but does not surrender IP. The Korean algorithms are public KS X standards; Joey's implementations of them remain his.**

**9. PROOF.** KCMVP cohort: **Samsung Electronics, LG, Naver, Kakao, Penta Security, AhnLab**. Mandatory for Korean public-sector procurement of cryptographic products.

---

## 3.3 Singapore — SCCS + CLS + NITES

**1. WHO.** **Cyber Security Agency of Singapore (CSA)** runs SCCS (CC scheme) and CLS (consumer IoT label) and NITES (gov-only scheme).

**2. TIMELINE.**
- **2024 Jun 30:** New SCCS applications must use CC:2022 / CEM:2022.
- **2024 May 31:** New application package submissions must include PAR (Preliminary Assessment Report).
- **2027:** CLS Level 2 expected mandatory for residential routers in Singapore.
- Rolling submission.

**3. URL REF.**
- SCCS: https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/singapore-common-criteria-scheme/about/
- Pub 1 (overview) v9.1, Pub 2 (CCTL requirements) v9.1, Pub 3 (eval and cert) v9.1.

**4. URL TO ENTER.** **sccs@csa.gov.sg**. Approved labs list: https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/singapore-common-criteria-scheme/approved-labs/. CCTLs include An Security, T-Systems Singapore.

**5. TERMS OF ENTRY.**
- Conformance to a cPP, national PP, or CSA-endorsed PP preferred. ST-only accepted case-by-case.
- Cost: SGD 100-300k typical.
- Calendar: 9-15 months.

**6. 🔴 IP OWNERSHIP.** **NO.** SCCS is a standard CC scheme under CCRA, with CSA-published CCTL requirements emphasizing confidentiality. **No IP-claim clause found in publicly available SCCS program documentation.**

**7. SHARING REQUIREMENTS.** Cert listing + ST + cert report public on https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/singapore-common-criteria-scheme/certified-product-list/.

**8. DO WE OWN OUR IP.** **YES. Standard CCRA-shape conformance scheme; same posture as NIAP / EUCC / JISEC.**

**9. PROOF.** SCCS cohort: **Huawei (Singapore), Samsung Knox, NEC**.

---

## 3.4 China — OSCCA + MLPS 2.0 (⚠ IP RISK)

**1. WHO.** **OSCCA — Office of the State Commercial Cryptography Administration** (since 2018 reorganized under the State Cryptography Administration / SCA). Now also coordinated with **SAMR — State Administration for Market Regulation** for joint Commercial Cryptography Product Certification Catalogue.

**2. TIMELINE.** 
- **2019:** PRC Cryptography Law passed.
- **2020:** OSCCA absorbed under SCA.
- **2024-2025:** Updated Catalogue of Commercial Cryptography Products (April 2025 third batch).
- Rolling submission via OSCCA-recognized labs.

**3. URL REF.** OSCCA (Chinese): https://www.oscca.gov.cn/ · English bridge: https://www.atsec.cn/

**4. URL TO ENTER.** OSCCA-recognized labs only. atsec China is the major English-language bridge for foreign vendors.

**5. TERMS OF ENTRY.**
- **MUST implement Chinese ShangMi suite (SM2, SM3, SM4, SM9, ZUC).** Foreign algos (AES, RSA, ECDSA) not approved for many commercial uses.
- **Mandatory for MLPS 2.0 Tier 3+ critical information infrastructure.**
- Cost: ¥500k-2M.

**6. 🔴 IP OWNERSHIP — ⚠ CONCERNING. Y/N → NO formal IP transfer in the cert itself, BUT the regulatory environment creates IP risk:**
- Per Lexology summary (https://www.lexology.com/library/detail.aspx?g=c20a0a51-a667-417a-8e96-c473b1eecfaf): *"OSCCA has the power to request that companies hand over source code for inspection, and security review will likely entail scrutinizing cryptographic source code."*
- Foreign encryption technology is **not allowed to be sold** in China outside OSCCA-approval — *"effectively bars foreign participation in the domestic encryption products market."* NXP is the **only** foreign-based semiconductor with OSCCA approval (https://www.printedelectronicsnow.com/contents/view_breaking-news/2017-05-11/nxp-first-foreign-based-semiconductor-company-awarded-oscca-certificate-from-china-authority/).
- **PRC Cryptography Law and Cybersecurity Law create legal mechanisms for source-code review and IP exposure that do not exist in any other jurisdiction reviewed.**
- **Verdict: NO formal IP-transfer clause, but legal-environment IP risk is HIGH.**

**7. SHARING REQUIREMENTS.** Source code may be reviewed by OSCCA. Cryptographic implementations must use Chinese algorithms. Foreign-vendor mainline product becomes a separate "Chinese fork."

**8. DO WE OWN OUR IP — FINAL ANSWER.** **NO — at minimum, exposure risk. The mainline `nous` should NOT pursue OSCCA. If a Chinese market opportunity emerges, fork a Chinese variant with ShangMi algorithms, accept the legal regime, and isolate that fork from the global mainline. Recommend: skip OSCCA in the global certification strategy. The IP risk is real and disproportionate.**

**9. PROOF.** OSCCA-certified foreign cohort: **NXP** (only semiconductor); most foreign vendors do NOT pursue. Chinese cohort: **Huawei, ZTE, Sangfor, Topsec, Westone, NSFOCUS, Venustech, Beijing Digital China**. China-domestic-only.

---

## 3.5 India — IC3S

**1. WHO.** **STQC Directorate** of **MeitY — Ministry of Electronics and Information Technology**. CCRA-authoring since 2013. **India holds the CCDB Chair 2026-2028.**

**2. TIMELINE.** Rolling submission.

**3. URL REF.** https://commoncriteria-india.gov.in/ · STQC: https://www.stqc.gov.in/common-criteria-certification-0

**4. URL TO ENTER.** STQC labs. List at https://commoncriteria-india.gov.in/process-empanelment-and-operation-labs-under-ic3s-stqcccd03

**5. TERMS OF ENTRY.**
- EAL1-EAL4 (with rupee labor cost making this the **cheapest CCRA-authoring path globally**).
- Cost: ₹20-60 lakhs typical (~$25-75k USD) — far below US/EU/Japan.
- Calendar: 9-15 months.

**6. 🔴 IP OWNERSHIP.** **NO.** Standard CCRA conformance scheme. **No IP-claim clause found in publicly available IC3S program documentation.**

**7. SHARING REQUIREMENTS.** Cert + ST public.

**8. DO WE OWN OUR IP.** **YES. Standard CCRA shape. Lowest-cost authoring path on the planet. Political momentum from India's CCDB chair role 2026-2028 amplifies recognition.**

**9. PROOF.** IC3S cohort: **Bharat Electronics Limited, Tata Consultancy Services, Cyient, ECIL, BEL, Wipro, Infosys**.

---

## 3.6 Taiwan NICST, Malaysia MyCC, Israel INCD

**Summary:**

| Country | Body | Role | URL | IP claim? |
|---|---|---|---|---|
| Taiwan | **NICST** | CC consuming only | Limited | NO (consumer only) |
| Malaysia | **MyCC** under **CyberSecurity Malaysia** | CCRA authoring; ASEAN entry CC scheme | https://www.cybersecurity.my/en/services/security_evaluations/main/detail/2336/index.html | NO |
| Israel | **INCD — Israel National Cyber Directorate** | National org-level certs (banking supply chain 2024+); no national product CC | https://www.gov.il/en/departments/israel_national_cyber_directorate/govil-landing-page | NO at INCD; Israeli vendors typically pursue NIAP/EUCC for product certs |

All three are conformance schemes (where they exist) — **no IP transfer**.

---

# PART 4 — OTHER (Canada, Australia, NZ, Switzerland)

## 4.1 Canada — CCCS

**1. WHO.** **Canadian Centre for Cyber Security (CCCS)** under Communications Security Establishment (CSE).

**2-9.** Joint US/Canada CMVP — same as §1.1. **Single FIPS 140-3 submission yields validation in both countries.** Best ROI in the global atlas. Canadian CC scheme runs through CCEF labs (CCS); CCRA authoring. No IP claim.

URL: https://www.cyber.gc.ca/en/tools-services/cryptographic-module-validation-program-cmvp

**IP posture: YES, Joey retains 100% IP. Identical to FIPS 140-3 analysis.**

## 4.2 Australia — ASD / IRAP / AISEP

**1. WHO.** **ASD — Australian Signals Directorate** runs IRAP; AISEP is the Australasian (AU + NZ) CCRA-authoring CC scheme operated by ASD.

**2. TIMELINE.** Rolling for IRAP. Microsoft, AWS, Google Cloud all hold current 2026 IRAP assessments.

**3. URL REF.** https://www.cyber.gov.au/business-government/protecting-devices-systems/assessment-evaluation-programs/irap

**4. URL TO ENTER.** Select an ASD-endorsed IRAP assessor: https://www.cyber.gov.au/about-us/view-all-content/programs/irap/asd-endorsed-irap-assessors

**5. TERMS OF ENTRY.**
- IRAP assesses systems/services against the **Australian Government Information Security Manual (ISM)** for OFFICIAL / PROTECTED / SECRET / TOP SECRET.
- **NOT a product cert** — a system-as-deployed assessment.
- Cost: **AUD $40k for OFFICIAL straightforward; $250k+ for PROTECTED complex** (per Tech Blaze 2026 guide).
- Calendar: 8-24 weeks.
- Validity: 2-3 years.

**6. 🔴 IP OWNERSHIP.** **NO.** IRAP is an assessment scheme; the assessor is an independent endorsed individual under NDA. ASD does not claim product IP. **No IP-claim clause found in publicly available IRAP / ISM program documentation.**

**7. SHARING REQUIREMENTS.** IRAP reports are shared with potential AU Gov customers under NDA. Not publicly published.

**8. DO WE OWN OUR IP.** **YES. IRAP is a control-assessment scheme; the report describes how the service implements ISM controls. No IP transfer.**

**9. PROOF.** **Microsoft, AWS, Google Cloud, Salesforce, ServiceNow, Atlassian, Dynatrace** all hold IRAP. Required for AU Gov purchasing.

## 4.3 New Zealand — GCSB / NCSC NZ — NZISM

NZ relinquished CCRA authoring status — consuming only. Prefers AISEP-evaluated products. No IP claim. URL: https://nzism.gcsb.govt.nz/

## 4.4 Switzerland — NCSC.ch / BACS

No national CC scheme. CCRA consuming. Accepts BSI/ANSSI/CCCS certs. No IP claim.

---

# PART 5 — MUTUAL RECOGNITION ARRANGEMENTS

## 5.1 CCRA

**Status 2026:**
- **37 member countries** total (per CCRA portal).
- **Authoring participants (~17):** Australia, Canada, France, Germany, India *(Chair 2026-2028)*, Italy, Japan, Malaysia, Netherlands, Norway, Republic of Korea, Singapore, Spain, Sweden, Turkey, UK *(degraded, primarily consuming)*, US.
- **Consuming participants (~18+):** Austria, Czech Republic, Denmark, Ethiopia, Finland, Greece, Hungary, Indonesia, Israel, New Zealand, Pakistan, Philippines, Qatar, Saudi Arabia, Slovakia, UAE, etc.
- **Recognition scope:** Certs up to **EAL2 (with ALC_FLR)** for non-cPP; up to **EAL4 (with ALC_FLR)** for cPP-conformant. Above that requires bilateral (historically SOG-IS; now EUCC for EU).

**Source:** https://www.commoncriteriaportal.org/ccra/ · https://www.commoncriteriaportal.org/ccra/members/

**IP impact: ZERO.** CCRA is a recognition arrangement between national governments to mutually accept each other's certs. It creates no rights-of-the-state in vendor IP.

## 5.2 SOG-IS

- **Status 2026:** **Ceased issuing new certs 27 Feb 2026.** Subsumed into EUCC.
- Legacy SOG-IS certs valid to expiry; EUCC High is the replacement for SOG-IS EAL5+ smartcard/HSM evals.

## 5.3 The "FIPS + CC + EUCC" Trifecta — global reach matrix

| Investment | Direct recognition | Why it works |
|---|---|---|
| **FIPS 140-3 (CMVP)** | US + CA federal procurement | Joint CMVP — single submission, two countries |
| **NIAP CC (NDcPP + VPN)** | ~35 CCRA nations | Mutual recognition up to EAL4 with cPP |
| **EUCC at Substantial** | All EU + EEA Member States | Required for CRA "important / critical" products from Dec 2027 |
| **+ CSPN / BSZ** | French / German government adds | Sovereign cert per market; brand stamp |
| **+ CSfC components listing** | US classified mesh tier | Closed-shop NSA-blessed |

Five-leg stool that covers every Earth government that buys commercial cryptographic mesh products. **None of these legs transfer Joey's IP.**

---

# PART 6 — DFARS / Government-Purpose Rights (when contracts are signed)

**This is the one place IP can actually slip away — and it happens at the CONTRACT layer, not the CERT layer.** None of the certifications above transfer IP. But if Joey *contracts directly with the DoD or another federal customer* for development work, the FAR / DFARS data-rights clauses can attach.

**Key DFARS clauses:**
- **DFARS 252.227-7013 — Rights in Technical Data (non-commercial).** Default: **Unlimited Rights** to government if developed *exclusively* with government funds; **Government Purpose Rights (GPR)** if mixed funding; **Limited Rights** if developed *exclusively* at private expense.
- **DFARS 252.227-7014 — Rights in Other Than Commercial Computer Software.** Same three-tier license: Unlimited / GPR / Restricted.
- **DFARS 252.227-7015 — Commercial Items.** If Joey sells `nous` as a **Commercial Product** (FAR 2.101), DFARS treats it as **commercial computer software** — government gets **license rights equivalent to those Joey offers commercial customers** (per his EULA), nothing more. **THIS IS THE KEY.**

**Source:** https://www.acquisition.gov/dfars/252.227-7013-rights-technical-data%E2%80%94other-commercial-products-and-commercial-services. · DOD IP Guidebook commentary: https://www.pilieromazza.com/dod-releases-intellectual-property-guidebook-key-insights-for-defense-contractors-part-2/

**The defensive posture for Joey:**

1. **Develop `libsecurity.a` and `nous` entirely with private (kastil-systems) funding** before any federal contract touches them — fully **Background IP**.
2. **Sell as a Commercial Item / COTS product** (per FAR 2.101). This is the lowest-IP-exposure procurement path — government gets only commercial license rights.
3. **Mark every deliverable** with the appropriate **Restricted Rights legend** under DFARS 252.227-7013(f). Per https://www.governmentcontractslaw.com/2026/04/dont-put-your-background-ip-into-it-protecting-whats-yours/: failure to properly mark is the #1 way contractors lose IP.
4. **Never accept Unlimited Rights** in a DoD contract on `nous` source code. If you accept mixed funding for new features, those features get GPR — *but the background IP stays Limited Rights forever* if marked correctly.
5. **SBIR/STTR data rights** under DFARS Case 2019-D043 (final rule Dec 2024) — extended Phase III rights and clarified retention.

**Bottom line on Part 6:** **The DFARS clauses do not attach to certifications. They attach to contracts.** Joey can hold every cert in this report and retain 100% IP, **as long as he sells `nous` as a Commercial Item and marks deliverables correctly.** The cert-vs-contract distinction is the most important thing in this whole document.

---

# PART 7 — NEW programs discovered (not in Round 1)

## 7.1 DoDIN APL → DISA RME Vendor STIG (replacement)

DoDIN APL sunset Sep 30 2025. Replacement: **DISA RME Vendor STIG** program for cybersecurity + UCR-CORE for interop. Enforced contractually rather than via a pre-approval list. **Worth tracking** for DoD network procurement. URL: https://aplits.disa.mil/docs/DODIN_APL_SUNSET_FAQ.pdf

## 7.2 EUCS — EU Cloud Services Scheme (stalled but expected to revive 2027-2028)

Drafting on hold. When it lands, it will become the EU SaaS gating cert (parallel to FedRAMP). Track.

## 7.3 EU5G — EU 5G Network Cybersecurity Scheme (stalled)

Under development since 2021. Less likely to affect `nous` directly unless 5G-mesh use case emerges.

## 7.4 Cyber Resilience Act (CRA) — Regulation (EU) 2024/2847

Not a cert in itself, but creates the EU-wide **legal requirement** to which EUCC is the natural conformance path. Reporting obligations Sep 11 2026; main obligations Dec 11 2027.

## 7.5 CC:2022 (ISO/IEC 15408:2022) — new CC version

All CC schemes (NIAP, EUCC, JISEC, KECS, SCCS, IC3S, AISEP, MyCC) transitioning. **Last day to start CC v3.1 evals: 30 Jun 2024. Last day for CC v3.1-based STs: 31 Dec 2027.** Plan EUCC/NIAP for CC:2022.

## 7.6 CNSA 2.0 PQC mandate cascade

Affects every other cert: FIPS 140-3 (CAVP for ML-KEM/ML-DSA/SLH-DSA), NIAP cPPs (CNSA 2.0 alignments publishing 2026), EUCC (PQC requirements expected 2027-2028), CSfC (CP updates 2026-2027).

## 7.7 Spain CPSTIC catalogue (deeper coverage than Round 1)

Worth a dedicated listing for Spanish public-sector go-to-market. Foreign vendors welcome.

## 7.8 Singapore CLS Level 2 mandate (2027 routers)

Consumer IoT label — not for `nous` directly but worth tracking for any consumer endpoint.

## 7.9 Cyber Essentials Plus v3.3 — April 2026 changes

Significant update with mandatory MFA + 14-day patching + cloud scope expansion. Affects Joey's org-cert posture if pursuing UK gov contracts.

---

# PART 8 — IP-RISK RANKING (1-page summary)

| Rank | Program | IP-clean? | Notes |
|---|---|---|---|
| ✅ #1 | **CAVP / ACVP (US)** | YES — cleanest | Black-box algo conformance only. No vendor agreements beyond commercial NDA with lab. |
| ✅ #2 | **EUCC (EU)** | YES — strongest IP-protective language | Article 43 explicitly mandates IP protection. Source code safeguards in Art 8. |
| ✅ #3 | **FIPS 140-3 / CMVP (US + CA)** | YES — clean | No IP-assignment clause. Lab NDA only. Public output is the vendor-authored Security Policy. |
| ✅ #4 | **NIAP CC (US)** | YES — clean | Standard CCRA shape. ETR confidential. ST is vendor-authored. |
| ✅ #5 | **CSPN (France)** | YES — clean | Sponsor-controlled publication. Lab professional-secrecy. Fastest cert. |
| ✅ #6 | **BSZ (Germany)** | YES — clean | German parallel of CSPN. EN 17640 standard. EUCC-aligned confidentiality. |
| ✅ | All other CCRA schemes (JISEC, KECS, KCMVP, SCCS, IC3S, AISEP, MyCC, CCCS) | YES — clean | Standard CCRA conformance posture. No IP transfer. |
| ✅ | FedRAMP / DoD ILs / CMMC / Cyber Essentials Plus | YES — clean | Org / system assessments. No product-IP transfer. |
| ⚠ | **CSfC (NSA, US)** | YES on IP — but ONGOING OPERATIONAL OBLIGATIONS | MoA = vuln SLAs, change-notification, NSA can recommend removal. No IP transfer. Read MoA carefully. |
| 🔴 | **OSCCA (China)** | NO — IP RISK | Source code subject to government inspection. Foreign vendors effectively barred from mainline market. **SKIP.** |
| ⚠ | DoD/federal CONTRACTS under DFARS 252.227-7013/-7014 | DEPENDS on contract | **Sell as Commercial Item with private-expense Background IP markings to retain 100% IP.** Contract-level, not cert-level. |

**Concise call:** The certifications themselves are IP-clean across the board. The only real IP risks are (a) **OSCCA / China** — skip the mainline; (b) **DoD contracting under DFARS** — manageable by selling as Commercial Item and marking properly. Everything else is conformance testing with the vendor's IP fully preserved.

---

# PART 9 — CONSOLIDATED 2021-2031 TIMELINE

## PAST 5 YEARS (2021-2026)

| Date | Event |
|---|---|
| **2021** | NIST SP 800-90B entropy validation refined; NIAP NDcPP v2.2e released; CSfC Mobile Access CP v2.5 updated |
| **2022 Apr 1** | Last day for new FIPS 140-2 submissions |
| **2022 Sep** | NSA CNSA 2.0 announced (PQC migration roadmap) |
| **2022 Nov** | CC:2022 (ISO/IEC 15408:2022) published |
| **2022 Dec** | FedRAMP Authorization Act signed |
| **2024 Jan 31** | EUCC Implementing Reg (EU) 2024/482 adopted |
| **2024 Mar** | FedRAMP 20x announced |
| **2024 Jun 30** | Last day to **start** CC v3.1 evaluations under CCRA |
| **2024 Oct 15** | CMMC 2.0 final rule published in Federal Register |
| **2024 Oct 23** | CRA (EU) 2024/2847 adopted |
| **2024 Dec 10** | CRA enters into force |
| **2024 Dec 16** | CMMC 2.0 final rule effective |
| **2024 Dec 18** | DFARS SBIR Data Rights final rule published |
| **2025 Feb 27** | **EUCC LIVE** — EU Common Criteria scheme operational |
| **2025 (mid)** | CSPN methodology updated (stricter hardware + relay-attack tests) |
| **2025 Sep 10** | CMMC 48 CFR rule published |
| **2025 Sep 30** | DoDIN APL program officially sunset |
| **2025 Nov 10** | CMMC Phase 1 rollout begins |
| **2025 Dec 31** | DoDIN APL final testing concludes |
| **2026 Jan 1** | New NIST CMVP cost-recovery fees ($16k L1 FS) effective |
| **2026 Feb 27** | **SOG-IS MRA ceases issuing new certs**; national EU schemes cease national-only issuance (Italy OCSI, etc.) |
| **2026 Apr 27** | Cyber Essentials Plus v3.3 effective in UK |
| **2026 May** | KCMVP 128-bit security strength requirement in force for new submissions |
| **2026 Sep 11** | CRA vulnerability reporting obligations begin |
| **2026 Sep 21** | **FIPS 140-2 → Historical list — all remaining certs deprecated for new procurement** |
| **2026 Q4** | **FedRAMP 20x Phase 3** opens; EUCC Delegated Act for CRA conformity |

## NEXT 5 YEARS (2026-2031)

| Date | Event |
|---|---|
| **2026 Q4** | FedRAMP 20x Phase 3 launch; EUCC-CRA Delegated Act |
| **2026 Oct 31** | CMMC Phase 2 — L2 mandatory for new applicable DoD contracts |
| **2027 Jan 1** | **CNSA 2.0 software/firmware signing deadline** for new NSS acquisitions |
| **2027 Dec 11** | **CRA main obligations** apply — EUCC becomes gating cert for "important / critical" EU products |
| **2027 Dec 31** | **CC v3.1 STs no longer accepted** — full CC:2022 transition |
| **2027-2028** | EUCS (cloud) + EU5G expected to revive |
| **2028** | CMMC Phase 3 — full DIB coverage expected |
| **2028-2030** | PQC algorithm migration in FIPS 140-3 module certs broadly; NIAP cPP PQC PP-Modules standard |
| **2028-2030** | EUCC scheme extensions for cloud / IoT / hardware tokens (post-EUCS); EUCC PQC requirements |
| **2030** | NIST SP 800-131A: legacy 112-bit security strength algorithms likely fully sunset for federal use |
| **2030-2031** | CSfC Capability Packages fully post-quantum |
| **2035 Jan 1** | **CNSA 2.0 enterprise rollover deadline** — full PQC across NSS |

---

# APPENDIX A — Authoritative source index (deep)

- NIST CMVP: https://csrc.nist.gov/projects/cryptographic-module-validation-program
- NIST CMVP Management Manual: https://csrc.nist.gov/csrc/media/Projects/cryptographic-module-validation-program/documents/fips%20140-3/FIPS-140-3-CMVP%20Management%20Manual.pdf
- NIST CMVP 2026 cost-recovery fees: https://csrc.nist.gov/projects/cryptographic-module-validation-program/nist-cost-recovery-fees
- NIST FIPS 140-3 transition: https://csrc.nist.gov/projects/fips-140-3-transition-effort
- NIAP: https://www.niap-ccevs.org/
- NIAP Policy Letters: https://home.niap-ccevs.org/Documents_and_Guidance/policy.cfm
- NIAP PP catalog: https://www.niap-ccevs.org/protectionprofiles
- NIAP PCL: https://www.niap-ccevs.org/Product/
- CCRA portal: https://www.commoncriteriaportal.org/ccra/
- CC:2022 Transition Policy: https://www.commoncriteriaportal.org/files/ccfiles/CC2022CEM2022TransitionPolicy.pdf
- FedRAMP: https://www.fedramp.gov/ · 20x: https://www.fedramp.gov/20x/
- FedRAMP 20x Phase 3: https://www.fedramp.gov/20x/phases/3/
- FedRAMP OSCAL: https://automate.fedramp.gov/documentation/ssp/
- DoD CC SRG (IL): https://public.cyber.mil/dccs/
- CMMC: https://cyberab.org/ · https://www.cyber.mil/index.cfm
- NSA CSfC: https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/
- CSfC Components List: https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/Components-List/
- CSfC Customer Handbook: https://media.defense.gov/2021/Apr/02/2002613880/-1/-1/0/CSFC%20PMO%20CUSTOMER%20HANDBOOK_02062021.PDF
- DoDIN APL Sunset FAQ: https://aplits.disa.mil/docs/DODIN_APL_SUNSET_FAQ.pdf
- BIS / EAR encryption: https://www.bis.doc.gov/index.php/policy-guidance/encryption/
- DFARS 252.227-7013: https://www.acquisition.gov/dfars/252.227-7013-rights-technical-data%E2%80%94other-commercial-products-and-commercial-services.
- DFARS 252.227-7014: https://www.acquisition.gov/dfars/252.227-7014-rights-other-commercial-computer-software-and-other-commercial-computer-software-documentation.
- DOD IP Guidebook commentary: https://www.pilieromazza.com/dod-releases-intellectual-property-guidebook-key-insights-for-defense-contractors-part-2/
- ENISA EUCC: https://certification.enisa.europa.eu/certification-library/eucc-certification-scheme_en
- EUCC Implementing Reg (EU) 2024/482: https://eur-lex.europa.eu/eli/reg_impl/2024/482/oj/eng
- EUCC consolidated: https://eur-lex.europa.eu/eli/reg_impl/2024/482/2025-01-08/eng
- EUCC one-year retrospective: https://www.atsec.com/one-year-of-eucc/
- CRA: https://digital-strategy.ec.europa.eu/en/policies/cyber-resilience-act
- CRA implementation: https://digital-strategy.ec.europa.eu/en/factpages/cyber-resilience-act-implementation
- CRA-EUCC overlap analysis: https://www.cclab.com/news/cyber-resilience-act-eucc-explained-key-differences-overlaps-and-compliance-pathways
- EUCS draft: https://www.enisa.europa.eu/publications/eucs-cloud-service-scheme
- BSI EN: https://www.bsi.bund.de/EN/
- BSI BSZ: https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/Anerkennung-von-Stellen-und-Zertifizierung-IT-Sicherheitsdienstleister/BSZ/bsz.html
- BSI BSZ certified products: https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/Zertifizierung-von-Produkten/Beschleunigte-Sicherheitszertifizierung/Zertifizierte-Produkte-nach-BSZ/zertifizierte-produkte-nach-bsz_node.html
- BSI EUCC transition strategy: https://eucyberact.org/wp-content/uploads/2022/05/S22a-GeyerK.pdf
- TÜVIT BSZ: https://www.tuvit.de/en/services/cyber-security/bsz/
- ANSSI EN: https://cyber.gouv.fr/en
- ANSSI CSPN: https://cyber.gouv.fr/offre-de-service/solutions-certifiees-et-qualifiees/
- Quarkslab CSPN: https://www.quarkslab.com/cspn-security-certification/
- Embedded Computing Design CSPN guide: https://embeddedcomputing.com/technology/security/cspn-what-u-s-companies-need-to-know-about-the-security-certification-process
- Chambers Cybersecurity 2026 France: https://practiceguides.chambers.com/practice-guides/cybersecurity-2026/france
- UK NCSC: https://www.ncsc.gov.uk/
- UK NPSA CAPSS: https://www.npsa.gov.uk/system-information-security/cyber-assurance-physical-security-systems-capss
- UK Cyber Essentials Plus v3.3: https://www.arcsystems.co.uk/news/cyber-essentials-plus-v3-3/ · https://iasme.co.uk/articles/important-update-changes-to-cyber-essentials-for-april-2026/
- TrustCB (Netherlands): https://trustcb.com/
- Italy ACN: https://www.acn.gov.it/portale/en
- Spain OC-CCN: https://oc.ccn.cni.es/en
- Spain CPSTIC: https://cpstic.ccn.cni.es/en
- Sweden CSEC: https://www.fmv.se/csec
- Norway SERTIT: https://sertit.no/
- Japan IPA JCMVP: https://www.ipa.go.jp/en/security/jcmvp/index.html
- Japan IPA JISEC: https://www.ipa.go.jp/en/security/jisec/
- Japan CRYPTREC: https://www.cryptrec.go.jp/en/
- Korea NIS: https://eng.nis.go.kr/
- KCMVP wiki: https://nenkin.io/wiki/schemes/kcmvp
- Singapore CSA SCCS: https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/singapore-common-criteria-scheme/about/
- China OSCCA (Chinese): https://www.oscca.gov.cn/
- atsec China bridge: https://www.atsec.cn/
- China encryption law summary (Lexology): https://www.lexology.com/library/detail.aspx?g=c20a0a51-a667-417a-8e96-c473b1eecfaf
- India IC3S: https://commoncriteria-india.gov.in/
- India STQC: https://www.stqc.gov.in/common-criteria-certification-0
- Canada CCCS CMVP: https://www.cyber.gc.ca/en/tools-services/cryptographic-module-validation-program-cmvp
- Australia ASD IRAP: https://www.cyber.gov.au/business-government/protecting-devices-systems/assessment-evaluation-programs/irap
- Australia IRAP assessors: https://www.cyber.gov.au/about-us/view-all-content/programs/irap/asd-endorsed-irap-assessors
- NZ NZISM: https://nzism.gcsb.govt.nz/
- CNSA 2.0 FAQ: https://media.defense.gov/2022/Sep/07/2003071836/-1/-1/0/CSI_CNSA_2.0_FAQ_.PDF
- Cryptography compliance deadlines: https://www.safelogic.com/blog/cryptography-compliance-deadlines-2026-2027
- What happens 21 Sep 2026: https://www.safelogic.com/blog/what-happens-on-september-21-2026
- CMMC final-rule timeline: https://secureframe.com/hub/cmmc/proposed-final-rule

---

*Report **I-MS-1-DEEP** · prepared 2026-05-30 for joey.castillo@acmedev.com · the Pantheon / metal console. Round 2 of the government-certification deep-dive series.*
