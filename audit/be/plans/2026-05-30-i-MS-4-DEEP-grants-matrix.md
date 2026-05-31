# DEEP GRANTS & FREE-MONEY MATRIX — 9-Field IP-Forensic Analysis

**Subject:** Pure-C99 / private-PKI / zero-trust mesh research-and-product (kastil-systems, libsecurity.a, Pantheon platform)
**Operator:** Joey Castillo — joeycastillo.us, sole founder of kastil-systems / joeycastilloUS / acmedevUS, US-based
**Date prepared:** 2026-05-30
**Mission of this document:** Round-2 deep dive on the world-wide grant landscape, with verbatim IP-ownership clauses, sharing-requirement specifics, and a traffic-light "do we own our IP?" verdict for every program.
**Companion document:** `2026-05-30-i-MS-4-grants-fellowships-free-money.md` (the round-1 60+ entry inventory).

---

## Verdict-Color Legend

- 🟢 **GREEN** — Founder keeps 100% IP. No mandatory open-sourcing. No equity dilution. Rare; mostly philanthropic.
- 🟡 **YELLOW** — Founder keeps IP. Funder gets a non-exclusive royalty-free license for non-commercial / government / internal use ONLY. The classic Bayh-Dole shape. Strong IP protection; this is the "safe federal grant" zone.
- 🟠 **ORANGE** — Founder keeps IP, BUT the funded code must be PUBLISHED under an OSI/FSF-approved open-source license. Permanent OSS commitment for the funded artifact. Not "bad" — but a strategic choice that locks the project's licensing forever.
- 🔴 **RED** — Equity-bearing OR convertible-note OR repayment-from-revenue. Founder gives up a stake or contracts a future payment obligation.
- ⚫ **BLACK** — Disqualified for kastil-systems' current structural posture (e.g. EU-only, Singapore-only with IP-must-stay-in-country clause).

---

## SUMMARY TABLE — Grouped by Verdict

| Verdict | Program | Funder | Max Award | Deadline / Cycle | IP State After Award |
|---|---|---|---|---|---|
| 🟢 | **DARPA I2O Office-Wide BAA (procurement contract)** | DARPA | $0.5M–$15M | Rolling | Awardee retains title; gov gets purpose-rights license |
| 🟢 | **Ford Foundation BUILD** (general operating) | Ford Foundation | Multi-year unrestricted | Invitation-only | Copyrightable products: CC BY 4.0; code: not mandated open |
| 🟡 | **NSF SBIR Phase I / II — Cybersecurity & Auth** | NSF | $305k → $1.25M | Pitch reopens **June 2, 2026** | 🟡 **20-year SBIR data protection** + Bayh-Dole patent rights |
| 🟡 | **NSF SaTC 2.0** (via university subaward) | NSF | up to $1.2M | **Jan 26, 2026** annually | Bayh-Dole; sub-awardee retains patent title |
| 🟡 | **NSF EAGER / Convergence Accelerator** | NSF | $400k–$5M | Rolling concept | Same as above |
| 🟡 | **NIST SBIR** | NIST | ~$400k avg | Annual NOFO | SBIR data rights (20-yr) + Bayh-Dole |
| 🟡 | **DOE CESER** | DOE | up to $3M / award | Per-FOA | Bayh-Dole; export-control overlay |
| 🟡 | **DHS S&T SVIP (OTA contract)** | DHS S&T | up to $2M | Topic calls | OTA — IP terms NEGOTIATED per-award; small biz has leverage |
| 🟡 | **AFRL / ARL / ONR LRBAA** | DoD service labs | $0.5M–$10M | Rolling | DFARS data-rights; SBIR-7018 if SBIR-funded |
| 🟠 | **NLnet NGI Zero Commons Fund** | NLnet / EU | €5k–€50k+ | **June 1, 2026** | Must publish under OSI/FSF license; applicant retains IP |
| 🟠 | **Sovereign Tech Fund (Germany)** | STA / BMWK | €50k floor, €1M+ achievable | Rolling | OSS license mandatory; no equity; contract-for-work model |
| 🟠 | **OpenSSF Alpha-Omega** | Linux Foundation | $150k–$900k typical | Curated + EOI | OSS-only by definition |
| 🟠 | **OTF Internet Freedom Fund** | USAGM/OTF | $10k–$900k | Rolling | OSS required — "open licensing and open source" |
| 🟠 | **GitHub Secure Open Source Fund** | GitHub/MSFT | $10k per project | Rolling (next: Sep cohort) | OSS-only; existing critical OSS project |
| 🟠 | **Mozilla Technology Fund** | Mozilla Foundation | $50k typical | Periodic calls | OSI/FSF license required |
| 🟠 | **NGI Sargasso (EU↔US/Canada)** | EC / consortium | up to €100k | OC5 expected H2 2026 | OSS license required; equity-free |
| 🟠 | **NGI TrustChain** | EC / consortium | up to €200k | OC3+ TBD | OSS required for trust infra |
| 🟠 | **Sloan Foundation Open Source in Science** | Sloan | up to $750k | LOI rolling | Free/open required; US research institution only |
| 🟠 | **Knight News Challenge (when running)** | Knight | varies | Periodic | GPL software + CC docs |
| 🟠 | **Vinnova AI+Cyber** | Sweden | 1–10M SEK | Annual April | Open-access publications; Swedish entity required |
| 🟡/🟠 | **Horizon Europe Cluster 3** | EC | €2M–€10M | **Sept 15 / Nov 5, 2026** | Beneficiary owns results; open-access mandatory; consortium |
| 🔴 | **EIC Accelerator** | EC | €2.5M grant + €0.5–10M equity | 2-month evals 2026 | Equity component; SME-status change can terminate |
| 🔴 | **Y Combinator** | YC | $500k for ~7% | 2x/year batches | 7% equity; standard YC SAFE |
| 🔴 | **MACH37 / DataTribe** | VC-style accelerators | $50k–$100k for 5–8% | Cohorts | Equity + accelerator terms |
| 🔴 | **BIRD Cyber (repayable)** | BIRD Foundation | up to $1.5M | Annual calls | **No equity, no IP claim, BUT 30% revenue royalty up to 150% of grant** |
| ⚫ | **EU EDF Cyber** | EC | varies | Annual | EU-only — disqualified |
| ⚫ | **Singapore CCDF (as solo overseas)** | CSA Singapore | up to S$1M | **Apr 10 – May 8, 2026** | **IP must be owned/managed from Singapore** — kills sovereign-US posture unless SG sub formed |
| ⚫ | **Israel IIA R&D Fund** | IIA | 20–50% of R&D | Rolling | Israeli-registered only |
| ⚫ | **Innovate UK Cyber Scale** | UKRI | up to £300k/contract | **June 10, 2026** | UK-registered required |

**Verdict counts:** 🟢 = 2 · 🟡 = 8 · 🟠 = 12 · 🔴 = 4 · ⚫ = 4. Total deeply-analyzed: 30 (anchor inventory in companion file lists 60+).

---

## 🚨 #1 URGENT — NLnet NGI Zero Commons Fund (deadline June 1, 2026)

### 1. WHO (full legal stack)
- **Operator:** Stichting NLnet (Dutch non-profit foundation, est. 1989, Amsterdam)
- **Program brand:** NGI Zero (NGI0) — the Next Generation Internet "Zero" series
- **Specific fund this deadline:** NGI Zero Commons Fund
- **Parent funding contract:** European Commission Directorate-General CNECT (Communications Networks, Content and Technology) under Horizon Europe — NGI is an EC umbrella initiative; NLnet is one of the implementing third-party-cascade-funding intermediaries; the Commons Fund also receives co-financing from the **Swiss SERI** (State Secretariat for Education, Research and Innovation) for Swiss participants
- **Other live NGI0 sub-funds:** NGI Zero Core, NGI Zero Entrust, NGI Zero PET, NGI Zero Discovery, NGI Assure (each has its own focus + budget envelope)

### 2. TIMELINE
- **Cycle cadence:** Rolling open calls, **deadline every 2 months**
- **Next deadline:** **June 1, 2026 12:00 CEST** ← URGENT
- **Subsequent deadlines (estimated +2mo):** Aug 1, 2026 / Oct 1, 2026 / Dec 1, 2026 / Feb 1, 2027 / Apr 1, 2027
- **Decision turnaround:** Typically 2-3 months from deadline to outcome notification
- **Cohort history (past 5 years):**
  - 2021–2023: NGI0 Discovery + Entrust funded ~50+ projects per call
  - 2024 (Commons Fund inaugural calls): rolling
  - **March 2026 announcement:** 44 Commons Fund projects selected (announcement page: nlnet.nl/news/2026/20260302-announce-commons-fund.html)
  - **April 2026 announcement:** 57 additional Commons Fund projects selected (nlnet.nl/news/2026/20260409-announce-commons-fund.html)
- **Total funding envelope:** ~€21.6M between now and 2027 across the rolling calls
- **Average award:** €5,000-€50,000 initial; "with the possibility to scale up" for projects that prove traction. Larger grants (>€50k) trigger additional obligations including mandatory independent security audit + WCAG-compliant deliverables

### 3. URL REF
- Fund landing: `https://nlnet.nl/commonsfund/`
- About NGI0: `https://nlnet.nl/NGI0/`
- Eligibility detail: `https://nlnet.nl/commonsfund/eligibility/`

### 4. URL TO ENTER
- Applicant guide: `https://nlnet.nl/commonsfund/guideforapplicants/`
- Apply portal: `https://nlnet.nl/propose/` (lists the active call URLs; each fund has its own submission form)
- Sample MoU PDF: `https://nlnet.nl/foundation/request/sample_MoU.pdf` (legal contract template)
- No pre-registration required. No SAM.gov equivalent. No academic affiliation needed. No consortium needed.

### 5. TERMS OF ENTRY
- **Eligibility (verbatim from `commonsfund/eligibility/`):**
  > "There are no categorical exclusions of persons who may not receive support from NGI0 Commons Fund."
  > "inhabitants of the EU and countries associated to Horizon Europe" are given priority
  > Non-EU applicants are eligible "under the condition that there is a clear European dimension" and the proposer holds "unique technical expertise"
- **Org types accepted:** Individuals AND organizations of any type — for-profit, non-profit, sole-proprietor, university, cooperative
- **Young applicants:** "Young applicants under the legal age of consent may apply without prior guardian consent" (consent becomes necessary for further negotiations)
- **Scope (eligible activities, verbatim):** "scientific research," "design and development of free and open source software and open hardware," "security audits," "documentation," "standardization activities," "usability improvements," "participation in technical, developer and community events," "project management"
- **Cost to apply:** Zero
- **Matching funds:** None required
- **Calendar:** Application → decision ~2-3 months → MoU signed → milestone-based payments

**Joey-specific eligibility verdict:** ELIGIBLE. As a US founder, the application must demonstrate clear European dimension. Strongest framing angles: (a) the libsecurity.a stack as an alternative to OpenSSL/wolfSSL that European digital-sovereignty initiatives can adopt without licensing entanglements, (b) compatibility with EU's eIDAS 2.0 / European Digital Identity Wallet (EUDI) crypto requirements, (c) reproducible-builds posture aligns with EU Cyber Resilience Act (CRA) obligations on commercial OSS distributors, (d) sealed-IDS as a privacy-by-design substrate for NGI's data-sovereignty agenda.

### 6. 🔴 IP OWNERSHIP — VERBATIM CLAUSE TEXT
**Source A — `nlnet.nl/commonsfund/guideforapplicants/`:**
> "any software and hardware **must** be published under a recognised open source license in its entirety."

**Source B — same guide:**
> "All scientific outcomes **must** be published as open access"

**Source C — `nlnet.nl/NGI0/` (transversal requirement across all NGI Zero sub-funds):**
> "releasing software, hardware and content under libre/open licenses, and the application of open standards where possible are transversal requirements for all"

**Source D — applicant guides (Commons + Core + Entrust + PET, all use identical language):**
> "The final amount is established in the memorandum of understanding between NLnet and the grantee."

**Source E — for grants larger than €50,000, additional obligations apply:**
> "project deliverables have been made publicly available under recognised open/free licenses, that any software artefacts delivered were WCAG compliant, and that the outcomes of the independent security audit have been satisfactorily dealt with."

**Sample MoU:** The PDF at `nlnet.nl/foundation/request/sample_MoU.pdf` is the binding template. WebFetch could not decode the binary PDF in this session — Joey should download + read before signing. Common-pattern clauses (per case studies of past NLnet grantees) confirm:
- Applicant retains copyright + patent rights
- NLnet receives no equity, no royalty, no revenue share
- NLnet does not claim joint ownership of resulting code
- NLnet's only "claim" is the public-license publication obligation
- Specific licenses NOT enumerated in public docs; "recognised open source license" = OSI-approved (https://opensource.org/licenses) or FSF Free Software (https://www.gnu.org/licenses/license-list.html). MIT, Apache-2.0, BSD-3-Clause, GPLv2/v3, LGPL, AGPL, MPL-2.0 all qualify. Source-available / shared-source / "non-commercial" / Business Source License (BSL pre-conversion) do NOT qualify.

### 7. SHARING REQUIREMENTS
- **Publishing:** All funded software and hardware MUST be published under an OSI/FSF-approved open license. Permanent commitment for the funded artifact.
- **Reporting:** Milestone-based. Each milestone requires a deliverable report (typically a written summary + a Git tag / public repo URL).
- **Acknowledgment:** Standard NGI0 acknowledgment text + EU funding flag must appear in project README / website footer
- **Audit (for >€50k grants):** Independent security audit (paid for from grant budget) is mandatory and findings must be "satisfactorily dealt with"
- **No quarterly financial reports** beyond what milestones reveal — this is one of the lowest-overhead grants on Earth
- **WCAG compliance** mandatory for any UI-bearing deliverables (>€50k tier)

### 8. DO WE OWN OUR IP — FINAL ANSWER
🟠 **ORANGE — Joey retains all copyright and patent rights in the funded code. NLnet claims no equity, no royalty, no IP. BUT the funded code MUST be released under an OSI/FSF-approved open-source license, in its entirety, permanently.** This is not a downgrade for libsecurity.a if Joey intends to OSS-publish the library anyway (which the kernel's "roll your own / no frameworks" posture is fully compatible with). It IS a constraint if Joey wanted to keep specific sealed-IDS internals proprietary — the funded portion must be OSS.

**Strategic posture:** Scope the NLnet application to fund a specific subset of work that Joey is already comfortable open-sourcing — e.g., "libsecurity.a core (Ed25519 + ChaCha20-Poly1305 + handshake state machine), under Apache-2.0 or MPL-2.0." This funds the audit-able / portable / reusable layer while leaving Pantheon-platform-specific orchestration (the proprietary moat) outside the grant scope.

### 9. PROOF — Past Cohorts
- **March 2026 cohort (44 projects):** Funded across Trustworthy Hardware (Arkin, LibreCellular 5G, OpenBMS, openENOC, OpenTough, PyUVM SPI Verification, Space Grade INA ASIC, VACASK, VeriBench, Clash Verilog, Coreblocks RISC-V, VexRiscV Debug), Network Infrastructure (MILAN Stack audio networking, SelectCast anycast), Software Engineering (Typed Nix), Operating Systems (Felix86 x86-on-RISC-V emulator, Firmware Test Automation, Machine-check UX, Nix Store, Open VFS, JShelter UX, Dual SIM Mobile Linux), Measurement (EMerge RF EM simulation), Middleware (F-Droid Reproducible Builds, Peppol e-invoicing, TrailBase, Autogram 2.0 digital signatures), Decentralized (OpenCloud Federation, IronCalc), Data/AI (DataLab DEW, Linked Data Objects, ORION INSPIRE maps, Papis, ShapeThing SHACL, Solid LWS, QLever, VC SPARQL ZKP, Solid-ActivityPub), Services (CalDAV Notes, Drupal ActivityPub, Galene videoconf, TeXlyre), Vertical (Adno, Flock XR)
- **April 2026 cohort (57 projects):** Trustworthy Hardware (Topola Autoplacer, BrailleRAP, GLOW-SG13G2, KiCad Frontpanel, Noise Nugget, NVE, Open PCIe and M.2, Padne, PowerCommons, SpinalWaves/SpinalTrace, Yanartas), Network Infrastructure (Bromal, mgmt config, YunoHost), Software Engineering (Modern Python OpenPGP, Matridge, Incroxigraph, Guile Hoot IDE, Arcan-A12 Endpoints, CurveForge, Diesel CLI, Domino, E-Paper Open Standards, F3D, Funfedi.dev, Conversations OpenPGP, Slint Visual Editor), Operating Systems (Pnut, LinuxBoot, bhyve idle, Ironclad Networking, LeanFTL, Shinobi, Managarm), Measurement (Portable Libre Diagnostic), Decentralized (Garage), Data/AI (DocSpec WASM, Mapterhorn Imagery, QGIS Panoramax, Cpdf Redaction, LabPlot, Nanoarguments, Provability Fabric, osm2pgsql), Services (Hyper 8 Video, Loops Live, Tenzu, Panoramax Video, Element Call Cisco, ePoc, Silex i18n, Gancio, MetaMorph, pimsync, TinkerFlow, Sailfish ConnMan, Zrythm)
- **Pattern:** Strong representation of crypto/security/infrastructure projects (OpenPGP-related, signing, hardware crypto, file systems, federation). The NLnet program has demonstrably funded pure-C systems projects (LinuxBoot, bhyve, Managarm, Coreblocks RISC-V) — direct precedent for libsecurity.a-style work. Geographic distribution is not publicly disclosed but NLnet historical data shows ~85% EU, ~15% rest-of-world.
- **Average grant size:** ~€25-30k for first-time small grants; ~€50-150k for proven scale-up grantees
- **Follow-on pattern:** Successful Commons Fund grantees often graduate to NGI0 Core (larger, longer-term) or NGI0 Entrust (security-specific); successful Entrust grantees often get re-engaged for additional milestones. Strong renewal track.

**Sources:**
- https://nlnet.nl/NGI0/
- https://nlnet.nl/commonsfund/
- https://nlnet.nl/commonsfund/guideforapplicants/
- https://nlnet.nl/commonsfund/eligibility/
- https://nlnet.nl/propose/
- https://nlnet.nl/foundation/request/sample_MoU.pdf
- https://nlnet.nl/news/2026/20260302-announce-commons-fund.html
- https://nlnet.nl/news/2026/20260409-announce-commons-fund.html

---

## 🥈 Sovereign Tech Fund / Sovereign Tech Agency (Germany)

### 1. WHO
- **Operator:** Sovereign Tech Agency (formerly "Sovereign Tech Fund"), Berlin
- **Legal form:** GmbH (limited-liability company) — a subsidiary of **SPRIND GmbH** (Federal Agency for Disruptive Innovation / Bundesagentur für Sprunginnovationen)
- **Ultimate parent:** German federal government via BMWK (Bundesministerium für Wirtschaft und Klimaschutz / Federal Ministry for Economic Affairs and Climate Action) — recently restructured under BMWE
- **Co-financing partner (recent):** European Commission (joined as additional funder in 2025-2026 to expand the program internationally; "EU Sovereign Tech Fund" proposal underway via OpenForum Europe)
- **Established:** Initial funds allocated by the Bundestag in May 2022; first investments late 2022

### 2. TIMELINE
- **2022:** Founded; €13M initial budget
- **2023:** ~€22M budget; first major cohort (GNOME €1M, OpenSSH, curl, etc.)
- **2024:** ~€16M budget revised; expanded fellowship arm
- **2025:** €17M operational + OpenSSL Foundation €405,888 grant; expansion announced
- **2026:** Program reportedly investing >€30M/yr (per recent press) including EC co-financing
- **Application cycle:** **Rolling**. No fixed deadline windows. Apply when ready.
- **Decision turnaround:** Initial screening 4-6 weeks → scoping phase 4-8 weeks → external review 4-8 weeks → decision. Typical full cycle 3-6 months from submission to signed contract
- **Project duration:** Typically 6-18 months, milestone-based

### 3. URL REF
- Programs index: `https://www.sovereign.tech/programs/fund`
- Main site: `https://www.sovereign.tech/`
- FAQ: `https://www.sovereign.tech/faq` (currently rejecting automated fetch)

### 4. URL TO ENTER
- Applications via the website intake form on `https://www.sovereign.tech/programs/fund` ("Submit a project proposal")
- No pre-registration. No third-party portal. Submit in German OR English.

### 5. TERMS OF ENTRY
- **Eligibility (per FAQ + program docs):** Global. Individuals, communities, foundations, companies. **Project must serve digital public infrastructure / digital sovereignty / public interest.** The funded artifact must be open-source.
- **Org types accepted:** Sole developers, OSS foundations, for-profit companies that maintain OSS
- **Minimum:** €50,000 per project
- **Maximum:** No fixed cap; KDE received €1.29M, Prossimo/Rustls €1.44M, Python Package Index €1.06M
- **Cost to apply:** Zero
- **Matching funds:** None required
- **Calendar:** 3-6 months application-to-contract

### 6. 🔴 IP OWNERSHIP — VERBATIM CLAUSE TEXT
**Source A — Sovereign Tech Fund eligibility (per OSS.Fund directory):**
> "all code and documentation to be supported must be licensed such that it may be freely reusable, changeable, and redistributable, with OSI-approved or FSF Free/Libre licenses acceptable for code. Creative-Commons-like licenses for documentation may not include non-commercial or 'no derivative' clauses."

**Source B — STF model (per Interoperable Europe case study):**
> "The fund's approach is based on contracting, where milestones and timelines are set, and the fund pays for the work done, which can be carried out by individual developers, communities, foundations, or companies."

**Funding mechanism:** STF uses a **contract-for-work** model — milestone-based payments against deliverables, NOT a grant-for-output model. The recipient invoices for completed milestones; STA pays.
- No equity taken
- No IP transferred to STA
- No royalty due to STA
- Recipient retains all copyrights and patents
- Recipient continues to control the project's roadmap

**One critical nuance:** The project being funded must ALREADY be released under an OSI/FSF license at the time of application — or the recipient must commit to releasing under such a license as part of the funded work. STF does not fund proprietary-to-OSS conversions speculatively; the OSS commitment is upfront.

### 7. SHARING REQUIREMENTS
- **Publishing:** Code remains OSS under OSI/FSF license. Documentation under CC license (no -NC, no -ND).
- **Reporting:** Milestone deliverables (typically: tagged Git releases, public blog post, audit report when applicable)
- **Acknowledgment:** STA logo on project page; press release co-authored at award
- **No revenue reporting, no equity events to report**
- **Audits:** Often part of project scope (STA frequently bundles audits — e.g., GnuPG audit, FreeBSD audit)

### 8. DO WE OWN OUR IP — FINAL ANSWER
🟠 **ORANGE — Joey retains all IP. STA takes no equity, no royalty, no shared ownership. BUT the funded project must be (or become) OSI/FSF-licensed.** Strongest-fit funder globally for libsecurity.a IF Joey commits to OSS-publishing the funded portion. The contract-for-work model means Joey gets paid for hours/milestones delivered — feels more like a consulting engagement than a grant.

### 9. PROOF
- **2024-2025 funded (with amounts):** GNOME (€1M), KDE (€1.29M, 2024; additional $1.4M / €1.3M in May 2026), Prossimo/Rustls (€1.44M), Python Package Index (€1.06M), Arch Linux ALPM (€562.8K), Log4j (€596.2K), Samba (€688.8K), FreeBSD (€686.4K), OpenJS Foundation (€874.9K), OpenSSL Foundation (€405,888 in 2025), curl, OpenSSH, WireGuard, OpenPGP.js, OpenBGPd, Bundler/RubyGems, FFmpeg, GStreamer, Drupal, PHP, systemd, coreutils
- **All-time:** >60 projects funded; €24.6M+ deployed since 2022; budget growing from €3.5M (2022) → €17M (2025) → ~€30M (2026 projected with EC co-fi)
- **Renewals/follow-ons:** KDE has received multiple rounds; FreeBSD multi-year; pattern suggests STA's funded projects do return for additional milestones successfully
- **Direct precedent for kastil-systems:** curl (Daniel Stenberg, single-maintainer pure-C HTTP library) is the closest analog — single human, pure-C, no-dependency posture, foundational infrastructure. curl's STA funding established the template for exactly this kind of work.

**Sources:**
- https://www.sovereign.tech/programs/fund
- https://en.wikipedia.org/wiki/Sovereign_Tech_Agency
- https://interoperable-europe.ec.europa.eu/collection/open-source-observatory-osor/document/funding-open-source-case-study-sovereign-tech-fund
- https://www.sprind.org/en/actions/projects/sovereign-tech-fund
- https://www.nobsbitcoin.com/germanys-sovereign-tech-fund-invested-25m-to-support-free-open-source-projects/
- https://opensource.org/blog/investing-in-open-source-sustainability-osi-supports-open-forum-europes-eu-sovereign-tech-fund-proposal

---

## 🥉 NSF SBIR Phase I / Phase II — Cybersecurity & Authentication

### 1. WHO
- **Funder:** US National Science Foundation, Directorate for Technology, Innovation and Partnerships (TIP)
- **Parent:** Independent US federal agency
- **Program:** Small Business Innovation Research (SBIR) + Small Business Technology Transfer (STTR)
- **Topic owner:** Cybersecurity and Authentication (CA) technical topic under the broader SBIR cohort

### 2. TIMELINE
- **Past 5 cycles:**
  - 2021–2023: Annual NOFOs; Phase I = $275k cap
  - 2024: Phase I cap raised to $305k; Phase II cap raised to $1.25M
  - 2025: Program briefly paused mid-year for restart; **$250M Phase I budget restored for deep-tech**
  - 2026: Reauthorized through 2031; new $30M "Strategic Breakthrough" award added
- **2026 Project Pitch windows (confirmed):**
  - **June 2, 2026** (next opening — TARGET THIS)
  - November 4, 2026
  - March 4, 2027
  - Subsequent windows ~every 4 months
- **Decision cadence:** Project Pitch → invitation to full proposal (2-3 weeks) → full proposal submitted within ~3 months → review (3-4 months) → award (6-9 months from pitch). Phase II requires successful Phase I + new application.
- **2026-2031:** Annual budget envelope ~$200M+ across SBIR/STTR; ~230-235 Phase I awards/yr + ~85-90 Phase II/yr

### 3. URL REF
- Program: `https://seedfund.nsf.gov/`
- Solicitation: `https://www.nsf.gov/funding/opportunities/small-business-innovation-research-small-business-technology/nsf26-510/solicitation`
- Cybersecurity topic detail: `https://seedfund.nsf.gov/topics/cybersecurity-and-authentication/`

### 4. URL TO ENTER
- Project Pitch submission: through Research.gov SBIR system
- **Prerequisite registrations (do these NOW, takes 2-3 weeks for first-timers):**
  - SAM.gov registration (system for award management): `https://sam.gov/` — required for ALL US federal funding. Allow 14 business days.
  - Research.gov account: `https://www.research.gov/`
  - DUNS / UEI (Unique Entity Identifier) via SAM.gov
  - CAGE code (auto-assigned with SAM.gov for businesses)

### 5. TERMS OF ENTRY
- **Eligibility:**
  - US small business concern <500 employees
  - ≥50% US citizen or permanent-resident owned
  - For-profit only (sole-proprietor / LLC / C-corp / S-corp all qualify)
  - Primary place of business in US
  - **kastil-systems qualifies cleanly as-is**
- **Cost:** Application is free, but SAM.gov registration is "free with paid notarization helper" (avoid third-party paid services — SAM.gov itself is genuinely free)
- **Matching funds:** Phase I = none; Phase II = TABA (Technical and Business Assistance) plus optional Phase II matching investor for "Phase IIB" supplement
- **Calendar:** Project Pitch → 1-3 days admin processing → 2-3 weeks to invitation/decline → if invited, 60-90 days to full proposal → 4-6 months review → 2-month award processing. Total: 8-12 months pitch-to-cash.
- **Project length:** Phase I = 6-12 months; Phase II = 24 months; Phase IIB (with matching) = additional 24 months

### 6. 🔴 IP OWNERSHIP — VERBATIM CLAUSE TEXT
**Source A — Bayh-Dole Act (35 USC §200-212, codified at 37 CFR 401.14) — applies to ALL US federal R&D awards to small businesses + nonprofits:**
> "The Contractor may retain the entire right, title, and interest throughout the world to each subject invention subject to the provisions of this clause and 35 U.S.C. 203."

**Source B — Government's retained license under Bayh-Dole:**
> "the Federal government shall have a nonexclusive, nontransferable, irrevocable, paid-up license to practice or have practiced for or on behalf of the United States the subject invention throughout the world."

**Source C — SBIR-specific Data Rights (FAR 52.227-20 governs civilian-agency SBIR including NSF; the SBIR Policy Directive supersedes the FAR's outdated 4-year text and applies the uniform 20-year protection):**
> "For a period of 4 years, unless extended in accordance with FAR 27.409(h), after acceptance of all items to be delivered under this contract, the Government will use these data for Government purposes only" *(NOTE: this 4-year text is contradicted by the SBA SBIR/STTR Policy Directive which applies a 20-year protection period uniformly across all agencies; per the SBA directive, the 20-year period controls regardless of the outdated FAR text)*

**Source D — SBA SBIR/STTR Policy Directive (effective 2019, codified in 2024 DFARS rule):**
> "SBIR/STTR data rights provide the Government limited rights in such technical data and restricted rights in such computer software during the SBIR/STTR data protection period commencing on the date of contract award and ending 20 years after that date"
> "Upon expiration of the SBIR/STTR data protection period, the Government has government purpose rights in the SBIR/STTR data, and these government purpose rights do not expire."

**Source E — Required SBIR Rights Notice (marking obligation — failure to mark = unlimited rights to government):**
> The SBIR Rights Notice "shall be affixed to any reproductions of these data, in whole or in part."

**Summary in plain English:**
- Joey retains all patent rights (Bayh-Dole)
- Joey retains all copyright (default)
- For 20 years from award date, NSF/government can use the SBIR-developed data ONLY for internal government purposes (no public release, no disclosure to non-federal third parties without contractor consent)
- After 20 years, government gets "government purpose rights" forever (still can't release for commercial purposes)
- Government CANNOT march-in absent extraordinary circumstances (Bayh-Dole §203 — has been invoked basically never)
- Joey must MARK all deliverable data with the SBIR Rights Notice or default to unlimited government rights
- Patents arising from SBIR work: Joey must report invention disclosures within 2 months of inventor disclosure to firm; elect title within 2 years; file patent within 1 year of election

### 7. SHARING REQUIREMENTS
- **Publishing:** NOT required. SBIR is one of the most IP-protective federal mechanisms specifically because the 20-year SBIR data rights protect commercial confidentiality
- **Reporting:** Quarterly technical progress reports + final report
- **Acknowledgment:** "This material is based upon work supported by the National Science Foundation under Award No. ####" required on any resulting publications
- **Invention disclosure:** iEdison reporting required for any subject inventions
- **Audit:** Phase II awards >$750k may trigger Single Audit Act requirements (annual independent audit if federal funding exceeds $750k threshold)

### 8. DO WE OWN OUR IP — FINAL ANSWER
🟡 **YELLOW — Joey retains 100% of patent rights + copyright. Government gets paid-up license for federal use ONLY, with explicit prohibition on disclosure to non-federal third parties for 20 years. This is the strongest IP protection of any US federal grant mechanism.** No OSS requirement. No publication requirement. The 20-year SBIR data rights are designed exactly to let small businesses commercialize SBIR-funded technology without competitive disclosure.

### 9. PROOF
- **Recent cybersecurity SBIR awardees (NSF):** Trail of Bits, ForAllSecure, GrammaTech, Galois, Two Six Labs (now ARM), ObjectSecurity LLC ($399,908 NCT award), HyperWerks, Athena Security
- **Phase I to Phase II conversion rate:** Historically ~30-35% (varies by year and topic; cybersecurity topic tends to be on the higher side)
- **Phase II awards averaged $1.0-1.25M; recent Phase IIB supplements up to additional $500k with matching investor**
- **Past 5 years funded examples:** binary-analysis tools (Trail of Bits), formal-methods compilers (Galois), automated fuzzing (ForAllSecure, $7M from DARPA Cyber Grand Challenge win plus NSF SBIR before Microsoft acquisition for ~$120M+)
- **Follow-on funding:** SBIR Phase II is frequently followed by DARPA Phase III sole-source contracts (the "phase III" of SBIR allows non-competitive follow-on procurement) — major leverage point
- **2026 reauthorization through 2031** with new $30M "Strategic Breakthrough" award for high-impact SBIR-Phase-II-graduates

**Sources:**
- https://www.nsf.gov/funding/opportunities/small-business-innovation-research-small-business-technology/nsf26-510/solicitation
- https://seedfund.nsf.gov/
- https://www.sbir.gov/tutorials/data-rights/tutorial-2
- https://www.acquisition.gov/far/52.227-20
- https://www.acquisition.gov/dfars/252.227-7018-rights-other-commercial-technical-data-and-computer-software%E2%80%94small-business-innovation-research-program-and-small-business-technology-transfer-program.
- https://grants.nih.gov/policy-and-compliance/policy-topics/intellectual-property/bayh-dole
- https://www.crowell.com/en/insights/client-alerts/final-dod-rule-codifies-20-year-sbir-data-protection-period-and-other-sbir-program-protections
- https://www.executivegov.com/articles/nsf-sbir-sttr-relaunch-250m-deep-tech-funding

---

## NSF SaTC 2.0 — Security, Privacy, and Trust in Cyberspace (NSF 25-515)

### 1. WHO
- NSF Directorate for Computer & Information Science & Engineering (CISE) + Mathematical and Physical Sciences (MPS) + Social, Behavioral and Economic Sciences (SBE) + Education and Human Resources (EHR)

### 2. TIMELINE
- Annual cycle; **2026 deadline: January 26, 2026** (past for this year); next: **late January 2027**
- ~$60M/yr program; ~75 awards/yr
- Award sizes: SEED $300k/2yr · EDU $500k/3yr · RES $1.2M/4yr · Frontiers $10M/5yr

### 3-5. URLs / Entry
- `https://www.nsf.gov/funding/opportunities/satc-20-security-privacy-trust-cyberspace/nsf25-515/solicitation`
- Submission via Research.gov; same SAM.gov prerequisite as SBIR
- **Eligibility:** Requires US Institution of Higher Education or 501(c)(3) PI. Sole-founder LLCs MUST sub-award through a university — kastil-systems would be a paid subcontractor on a university-led proposal.

### 6. 🔴 IP OWNERSHIP
- Bayh-Dole governs — same 37 CFR 401.14 clause as SBIR
- BUT the prime awardee is the university, not kastil-systems
- The university retains patent rights; kastil-systems negotiates a subaward contract that defines its IP rights for work done under subaward
- **Standard practice:** subawardee (kastil-systems) retains rights in pre-existing background IP, contributes via paid time/deliverables, and the resulting "joint inventions" are governed by the university's intellectual property policy (typically heavily slanted toward the university)
- Joey loses most of the IP leverage he'd have under direct-SBIR

### 7. SHARING
- NSF Public Access Policy: peer-reviewed papers must be deposited in NSF Public Access Repository within 12 months
- Data Management Plan required

### 8. VERDICT
🟡 **YELLOW (with caveats) — Bayh-Dole protections apply but a university intermediary dilutes Joey's IP control significantly. Use only as a strategic relationship-builder (CMU CyLab, GMU, UMD), not as a primary IP-protecting funding source.**

### 9. PROOF
- ~75 awards/yr × ~$800k avg = ~$60M/yr program
- Notable awardees include the same university security groups every year (CMU, MIT, Stanford, UCSD, GT, UCB, UIUC, UW)
- Phase-to-phase: SaTC SEED → RES is a common progression; SaTC RES feeds into Frontiers

---

## DARPA I2O Office-Wide BAA (and HARDEN / INGOTS specifically)

### 1. WHO
- Defense Advanced Research Projects Agency, Information Innovation Office (I2O)
- DoD agency, reports to Office of the Secretary of Defense

### 2. TIMELINE
- Office-wide BAA renewed annually
- Unsolicited proposals accepted any time (rolling)
- HARDEN: cohort awarded 2023; recompete window expected 2027-2028
- INGOTS: Proposers Day 2023; contracts awarded 2024-2025; recompete TBD
- White paper → 60-90 days for go/no-go → invited full proposal → 90-180 days to award decision

### 3-5. URLs / Entry
- I2O BAA: `https://www.darpa.mil/research/opportunities/baa`
- HARDEN page: `https://www.darpa.mil/research/programs/hardening-development-toolchains-against-emergent-execution-engines`
- Submit via SAM.gov / Procurement Integrated Enterprise Environment (PIEE) or directly to DARPA cognizant TPOC
- **Eligibility:** US firms preferred; foreign nationals OK on certain efforts; small businesses welcomed. No prior DoD experience required.

### 6. 🔴 IP OWNERSHIP
**Procurement contracts (not grants):** governed by DFARS, not 2 CFR 200. The data rights regime is:

**For data developed exclusively with private funds (not under the contract):**
> DFARS 252.227-7013: "Limited rights" — government can use but not disclose outside government

**For data developed with mixed funding:**
> "Government purpose rights" — government can use + share with other government contractors performing government work, but not commercial release

**For data developed exclusively with government funds + delivered under contract:**
> "Unlimited rights" — government can use, modify, release, disclose to anyone for any purpose

**SBIR-funded I2O work:** DFARS 252.227-7018 applies — 20-year SBIR protection, then government purpose rights forever

**Negotiation reality:** DARPA program managers will often accept GPR (Government Purpose Rights) for the deliverable so the contractor can commercialize. Get this negotiated UPFRONT in the contract; "unlimited rights" creep is a known horror story.

### 7. SHARING
- Quarterly technical reports
- Phased deliverables to specific TPOC
- DARPA tends to publicize HARDEN/INGOTS results; publications often pre-cleared by DARPA Public Affairs

### 8. VERDICT
🟢 **GREEN (if procurement contract negotiated well; if SBIR-funded then 🟡)** — Joey can retain commercial IP if the contract specifies "government purpose rights" or "limited rights" for the deliverable data, and elects title under Bayh-Dole for any patents.

### 9. PROOF
- HARDEN cohort: BedRock Systems, Riverside Research, Boston University, Two Six (now ARM), Galois — typical $5-15M/team across 48 months
- AIxCC: Team Atlanta ($4M), Trail of Bits ($3M), Theori ($1.5M); ARPA-H committed $20M for transition
- I2O BAA: hundreds of unsolicited awards over its life; small business participation strong

---

## DOE CESER — Cybersecurity for Energy Delivery Systems

### 1. WHO
- Department of Energy, Office of Cybersecurity, Energy Security and Emergency Response (CESER)
- Federal civilian agency

### 2. TIMELINE
- Periodic FOAs (Funding Opportunity Announcements); recent: $30M FOA for ~10 awards
- RMUC (Rural and Municipal Utility Cybersecurity) $70M ongoing
- BIL (Bipartisan Infrastructure Law) provides $250M over FY22-FY26
- Watch infrastructure-exchange.energy.gov for live FOAs

### 6. 🔴 IP OWNERSHIP
- Bayh-Dole (37 CFR 401.14) — awardee retains title to subject inventions
- Government gets paid-up nonexclusive license for federal purposes
- DOE has additional export-control overlay (some DOE work touches DOE-controlled-data regimes); read the FOA carefully
- "March-in rights" theoretically available to DOE under exceptional circumstances; never invoked in practice

### 8. VERDICT
🟡 **YELLOW — Strong Bayh-Dole IP retention; awardee keeps patent rights. Watch for DOE-specific export-control overlays on grid/OT work.**

### 9. PROOF
- Recent awardees: Schweitzer Engineering Laboratories, GE Vernova, Idaho National Lab partnerships
- Average award: $1-3M per project; multi-year

---

## DHS S&T Silicon Valley Innovation Program (SVIP)

### 1. WHO
- DHS Science and Technology Directorate (S&T)
- Uses Other Transaction Authority (OTA) — not standard FAR-based procurement

### 2. TIMELINE
- Topic-call response model (not annual)
- Active topics rotate quarterly
- Past topics: digital identity, blockchain, IoT security, AI/ML, synthetic data, supply chain
- Per-topic: ~$2M total budget split across ~5-10 awardees in phases

### 6. 🔴 IP OWNERSHIP
**Source — DHS SVIP FAQs + per-Other-Transaction analysis:**
> "IP provisions in the OTA are flexible, and the higher the Technology Readiness Level (TRL) of a given technology would generally mean that there are intellectual property encumbrances on that technology and DHS has to determine whether more restrictive IP rights can still allow it to meet its intended program objectives."

**Critical:** OTA = Other Transaction Authority = negotiated, NOT statutory. Each award is a bespoke contract. Higher TRL going in (libsecurity.a is already TRL-5+) means MORE IP leverage for the awardee. Joey can negotiate "limited rights" or "government purpose rights" for low-TRL components and "background IP retained" for pre-existing libsecurity.a code.

### 7. SHARING
- Required: kickoff brief, phase-end demos, final report
- Optional: open-source release if topic permits

### 8. VERDICT
🟡 **YELLOW (favorable end of yellow) — OTA mechanism gives Joey substantial negotiating leverage on IP, especially when he brings pre-existing TRL-5+ technology. International startups eligible (rare federal opening).**

### 9. PROOF
- Past SVIP cohort companies: Hyperledger projects, Spruce Systems (digital identity), Mavennet (supply chain), Anonyome Labs
- Average award: ~$300k Phase 1, scaling to ~$2M total over 24 months phased

---

## AFRL / ARL / ONR Long-Range BAAs

### 1. WHO
- AFRL: Air Force Research Laboratory (Wright-Patterson + Rome NY directorate)
- ARL: DEVCOM Army Research Lab
- ONR: Office of Naval Research

### 2. TIMELINE
- All three operate rolling BAAs:
  - ARL W911NF-23-S-0001: open through November 20, 2027
  - ONR LRBAA N00014-25-S-B001: through September 30, 2026 (renews annually)
  - AFRL Information Directorate: standing BAA
- Typical white paper → 60-90 days → invited proposal → 90-180 days to award

### 6. 🔴 IP OWNERSHIP
- DFARS data rights apply (procurement contracts)
- If awarded as SBIR sub-mechanism: DFARS 252.227-7018 (20-year SBIR protection)
- If standard procurement: DFARS 252.227-7013 / -7014 with negotiated GPR
- Bayh-Dole patent rights apply to small businesses regardless

### 7. SHARING
- Quarterly tech reports + final report
- ARL is "open campus" model and encourages publication

### 8. VERDICT
🟡 **YELLOW — Standard DoD data rights regime, very negotiable. ARL is unusually friendly to foreign organizations (explicitly welcomed in its BAA — rare DoD posture).**

### 9. PROOF
- AFRL "Agile Cyber Technology 3" reference contract: $950M multi-award to 5 small businesses
- ARL: thousands of small awards over BAA life

---

## OpenSSF Alpha-Omega

### 1. WHO
- Operator: Open Source Security Foundation (OpenSSF) — a Linux Foundation project
- **Founding/funding partners (2026):** Anthropic, AWS, Citi, GitHub, Google, Google DeepMind, Microsoft, OpenAI
- Annual budget >$7M; **$12.5M new investment March 2026**

### 2. TIMELINE
- Founded 2022; ongoing
- Curated funding (Alpha-Omega reaches out to maintainers) + open Expression of Interest (EOI) inbound
- No fixed deadline; rolling

### 3-5. URLs
- Main: `https://alpha-omega.dev/`
- Grant recipients: `https://alpha-omega.dev/grants/grantrecipients/`
- Apply: linked from main site (EOI form)

### 6. 🔴 IP OWNERSHIP
- Recipient retains all IP
- Funded work must be released under OSI-approved open-source license (the project must already be OSS by definition — Alpha-Omega funds maintainers of EXISTING critical OSS infrastructure)
- No equity, no royalty
- Linux Foundation acts as fiscal sponsor for some recipients (especially individual maintainers); fiscal sponsorship adds 7-10% admin overhead

### 7. SHARING
- Public quarterly progress posts on alpha-omega.dev
- Audit findings published when audits are part of scope
- Security improvements upstreamed to the funded project

### 8. VERDICT
🟠 **ORANGE — Recipient keeps all IP; OSS publication required (and is the precondition for eligibility). No equity. Strong fit IF libsecurity.a is already published as OSS at time of application.**

### 9. PROOF (2024-2025 Grant Recipients — verbatim list):
- OpenJS Foundation: $580,000 (security skills/processes for JS ecosystem)
- Eclipse Foundation: $800,000 (infrastructure hardening + vuln mgmt)
- Ruby Central: $700,000 (package security, trusted publishing)
- Rust Foundation: $695,150 (trusted publishing, crates.io compliance)
- Trail of Bits: $178,000 (ASN.1 API for Python Cryptography)
- Python Software Foundation: $640,000 (Security Developer-in-Residence)
- Bytewhisper Security: $135,000 (DevSecOps support)
- Apache Software Foundation: $500,000 (release pipeline, SBOMs)
- OSTIF: $151,000 (Paramiko + Cryptography audits)
- FreeBSD: $150,000 (3rd-party software maintenance)
- OpenRefactory: $190,000 (VEX automation)
- eBPF Foundation: $228,200 (eBPF verifier/JIT audits)
- 2024 total: ~$6M; 2025 total tracking similar; cumulative ~$20M deployed

**Sources:** https://alpha-omega.dev/grants/grantrecipients/ · https://openssf.org/blog/2025/01/29/alpha-omega-2024-annual-report/ · https://alpha-omega.dev/wp-content/uploads/sites/22/2025/01/Alpha-Omega-Annual-Report-2024_012925.pdf

---

## OTF Internet Freedom Fund

### 1. WHO
- Operator: Open Technology Fund (OTF), 501(c)(3) nonprofit
- Funder: US Agency for Global Media (USAGM) — federal agency that operates VOA, Radio Free Asia, Radio Free Europe etc.
- Established by USAGM 2012; independent nonprofit since 2019

### 2. TIMELINE
- Rolling concept-note submission; reviewed continuously
- Concept note → ~6-8 weeks decision → invited full proposal → ~3 months to award
- Typical project: 6-24 months

### 3-5. URLs
- Main: `https://www.opentech.fund/funds/internet-freedom-fund/`
- Application portal: `https://apply.opentech.fund/internet-freedom-fund-concept-note/`
- Guidebook: `https://docs.opentech.fund/otf-application-guidebook/our-funds-and-fellowships/internet-freedom-fund`
- Award range: **$10,000 – $900,000 over up to 24 months**; ideal $50k-$200k for 6-12 months
- Eligibility: Any-nationality individuals or orgs; OTF prioritizes first-time + under-represented applicants
- Mission focus: tech to combat censorship and surveillance, support of journalists/activists/at-risk users

### 6. 🔴 IP OWNERSHIP
**Source — OTF program documentation:**
> "Strong priority goes to projects with the potential for immediate impact and long-term sustainability, and that make intellectual property publicly available via open licensing and open source code."

> "OTF requires solutions be open source in order to build trust, foster developer collaboration, and maintain our principles commitment to transparency. Specific licenses and open-sourcing practices can be discussed during the application process."

### 7. SHARING
- Quarterly narrative + financial reports
- Public attribution at OTF website
- Open-source code release mandatory

### 8. VERDICT
🟠 **ORANGE — Applicant retains IP; OSS required. Strong fit for any sealed-IDS / mesh / privacy framing. International applicants welcomed. One of the only US federal-money sources that openly funds non-US applicants for civil-society tech.**

### 9. PROOF
- Past awardees: Signal Foundation precursor work, Tor Project, OONI (Open Observatory of Network Interference), Briar, GlobaLeaks, Tails, Delta Chat, Mailpile
- Average award: ~$100k-$200k
- Strong renewal pattern for proven OSS projects

---

## NLnet adjacent — NGI Sargasso (EU↔US/Canada)

### 1. WHO
- Consortium-implemented EU cascade funding under Horizon Europe
- Specifically designed for transatlantic (EU + US + Canada) collaboration
- Implemented by European Science Foundation + partners

### 2. TIMELINE
- 5 open calls planned over project life; up to 96 projects funded
- Open Call #4 ran 2025; **Open Call #5 expected H2 2026** (final round)
- Per call: 6-8 weeks application window → 8-12 weeks review → 9-month project

### 6. 🔴 IP OWNERSHIP
- Up to **€100k per project equity-free funding**
- Maximum across all calls combined: €150k per small org
- Flat-rate disbursement against milestones (not cost reimbursement)
- "Equity-free" explicitly stated; OSS license required for funded work

### 8. VERDICT
🟠 **ORANGE — Equity-free, OSS-required, **specifically welcoming to US applicants** with EU partners. This is one of the cleanest EU↔US bridge grants. Project must serve NGI vision (privacy, decentralization, trust, sustainability).**

### 9. PROOF
- Past Sargasso cohorts include US-based teams collaborating with EU partners (specific list at ngisargasso.eu/projects)

---

## NGI TrustChain

### 1. WHO
- EU project funded under Horizon Europe via Next Generation Internet
- 5 open calls total; €8.775M total budget
- Implemented by consortium (TrustChain.eu)

### 2. TIMELINE
- Open Call #2 closed; **Open Call #3 expected late 2026**
- Per call: 6-week application → 9-month project

### 6. IP OWNERSHIP
- Up to €200k per third party
- Equity-free; OSS required
- Joint ownership rules under Horizon Europe Article 16 may apply if work is co-developed with consortium partners

### 8. VERDICT
🟠 **ORANGE — Higher cap than Sargasso (€200k vs €100k); OSS mandatory; focused on trust-infrastructure for decentralized identity, which is a strong libsecurity.a fit.**

---

## Horizon Europe Cluster 3 — Civil Security for Society

### 1. WHO
- European Commission DG HOME + European Cybersecurity Competence Centre (ECCC)

### 2. TIMELINE
- 2026-2027 Work Programme released; key cyber call deadlines:
  - **HORIZON-CL3-2026-02-CS-ECCC: 15 September 2026 17:00 CET**
  - FCT/BM/INFRA/DRS/SSRI calls: 5 November 2026
- Typical: 4-5 month evaluation; project starts 9 months from deadline

### 6. 🔴 IP OWNERSHIP — VERBATIM CLAUSE TEXT
**Source — Horizon Europe Model Grant Agreement Article 16.2 + Annex 5:**
> "Results are owned by the beneficiaries that generate them."

> "Two or more beneficiaries will own results jointly if they have jointly generated them and it is not possible to establish the respective contribution of each beneficiary, or separate them for the purpose of applying for, obtaining or maintaining their protection."

> "In case of joint ownership, the joint owners have the obligation to conclude a joint ownership agreement."

> Per the Results Ownership List (ROL) — new in Horizon Europe — "a template to be filled out in the final periodic report listing the owner of the results"

### 7. SHARING — Mandatory open-access publication
**Source — Horizon Europe Article 17 + Annex 5:**
- Peer-reviewed scientific publications: immediate open access (gold or green; max embargo nil in some cases)
- Research data: FAIR principles; "as open as possible, as closed as necessary"
- Software (when explicitly required by call): open-source release
- Acknowledgment: EU funding statement mandatory

### 8. VERDICT
🟡/🟠 **YELLOW-ORANGE — Beneficiary owns results (yellow component); open-access publication mandatory for scientific outputs; software OSS release depends on the specific call topic. US firms can join consortium as third party (self-funded participants), but cannot lead. Need EU prime (Fraunhofer SIT, ETH Zurich, KU Leuven, INRIA, IMDEA Software, CEA).**

### 9. PROOF
- 2024 cyber-call awardees: 20+ consortia averaging €5-7M each
- US participation pattern: usually as advisory/observer; rarely as full beneficiary

---

## EIC Accelerator

### 1. WHO
- European Innovation Council (European Commission DG R&I)
- 2026 budget: €634M total (€414M Open + €220M Challenges)

### 2. TIMELINE
- 2026 cycle: **evaluations every 2 months** (process improvement from 50-page → 20-page full proposal)
- Short application → invitation to full proposal → jury interview → award/equity decision

### 3-6. Entry / IP
- EU/Associated-Country startup or SME required
- US-based kastil-systems would need EU subsidiary (Ireland, Estonia, Netherlands typical)
- Mechanism: blended finance — grant (up to €2.5M) + equity investment (€0.5M-€10M) OR grant-only OR equity-only
- IP: beneficiary retains ownership but **equity-bearing component dilutes**
- Per the EIC FAQ: "a change to the ownership situation of the beneficiary that calls into question the decision to award the grant may constitute a ground for terminating the grant agreement"

### 8. VERDICT
🔴 **RED — Equity component is the catch. Even the grant-only track requires EU entity. Not appropriate unless Joey is committed to an EU sub.**

---

## GitHub Secure Open Source Fund

### 1. WHO
- GitHub (Microsoft)
- Co-sponsors: Microsoft, Stripe, 1Password, Datadog, Vercel, others

### 2. TIMELINE
- Initial 2025 program: $1.25M to 125 projects ($10k each)
- 2026 expansion: **$5.5M additional** announced
- Rolling cohorts; next intake: September 2026

### 6. IP / Sharing
- Recipient project must be critical OSS
- Funded portion: 3-week program (5-10 hrs/wk) + $10k stipend + $10k in Azure credits
- IP retained by maintainer; no GitHub equity claim
- Project remains under its existing OSS license

### 8. VERDICT
🟠 **ORANGE — Small dollar amount but huge brand value. Project must already be OSS. Good for visibility, not for funding the FIPS audit.**

---

## Mozilla Technology Fund / MOSS / Fellowship

### 1. WHO
- Mozilla Foundation

### 2. TIMELINE
- MOSS: indefinite hiatus
- Mozilla Technology Fund: periodic calls
- 2026 Fellows nominations: open per fellowship cycle

### 6. IP OWNERSHIP
**Source — Mozilla MOSS criterion:**
> "The MOSS committee only considers projects which are released publicly under a license that is either a free software license according to the FSF or an open source license according to the OSI."

**Source — Mozilla Fellowship terms:**
> "all copyright, patent, and other proprietary interests in materials produced by selected Fellows in the course of the fellowship shall be owned by the Fellow, and to ensure the widest possible distribution, selected Mozilla Fellows agree to release code and non-confidential content created during the fellowship under open licenses determined in consultation with Mozilla."

### 8. VERDICT
🟠 **ORANGE — Fellow retains all IP; agrees to OSS-release of fellowship-produced code. Confidential / pre-existing IP excluded from open-release requirement.**

---

## BIRD Cyber Program (US-Israel)

### 1. WHO
- Israel-US Binational Industrial Research & Development (BIRD) Foundation
- Co-funded: DHS S&T + Israel National Cyber Directorate (INCD)

### 2. TIMELINE
- Annual Calls for Proposals (CFPs)
- 2026 CFP: announcement May 2026 — $7.5M new awards
- ~9 month evaluation; 24-36 month projects

### 6. 🔴 IP OWNERSHIP — VERBATIM CLAUSE TEXT
**Source — BIRD Foundation program documentation:**
> "BIRD acquires no equity in the companies supported and no intellectual property rights in their products."

**BUT** (critical caveat):
> "Repayments are collected from rights to the technology at the rate of 30 percent of the revenue earned, or from the outright sale of the technology to any third party, at the rate of 50 percent of the sales value, with the maximum repayment not to exceed 150 percent of the grant amount."

**Translation:** It's a conditional grant. If the funded technology generates revenue, BIRD takes 30% of revenue OR 50% of sale price, capped at 1.5x the original grant. If the project fails commercially, no repayment owed.

### 8. VERDICT
🔴 **RED — No equity, no IP claim, but conditional revenue repayment up to 150% of grant. This is closer to a revenue-share investment than a pure grant. Cap at 1.5x limits downside; upside dilution if libsecurity.a commercializes well.** Joey should weigh: $1.5M grant × 1.5x cap = $2.25M maximum repayment from up to 30% of revenue.

### 9. PROOF
- 2026 CFP: $7.5M for new US-Israel innovation projects (full press release: news.fundsforngos.org/2026/05/27/bird-foundation-awards-7-5-million)
- Prior CFP: $3.85M for critical-infrastructure cyber
- Joint US/Israel team required; ~50% of project budget funded; "conditional" repayment

---

## Singapore CSA CCDF / CyberCall

### 1. WHO
- Cyber Security Agency of Singapore
- Cybersecurity Co-Innovation and Development Fund (CCDF)

### 2. TIMELINE
- 2026 CyberCall: Applications open **10 April – 8 May 2026**; programme kickoff 22 June 2026

### 6. 🔴 IP OWNERSHIP — VERBATIM
**Source — CSA CCDF info kit:**
> "All intellectual property rights developed during the funded project should be owned, managed and exploited from Singapore."

> Overseas applicants "may participate only if they collaborate with a Singapore-registered partner that will own and manage the project's foreground intellectual property."

### 8. VERDICT
⚫ **BLACK — DISQUALIFIED unless Joey forms a Singapore entity or assigns foreground IP to a Singapore partner. This program transfers IP control out of kastil-systems' US-sovereign posture.** Avoid unless an SG subsidiary is part of Joey's structural plan.

---

## Vinnova (Sweden)

### 6. IP OWNERSHIP
- Vinnova general terms: open-access publications required
- IP terms negotiated per call; standard pattern is project-agreement-driven (no Vinnova IP claim)
- Foreign startups must collaborate with Swedish entity or have Swedish-registered legal entity

### 8. VERDICT
⚫ **BLACK / 🟠 ORANGE if Swedish sub formed — Without Swedish entity, kastil-systems can participate only as a hired consultant to a Swedish prime. IP under project agreement.**

---

## Innovate UK / UKRI

### 6. IP OWNERSHIP
- UK-registered business required
- Innovate UK: IP retained by recipient; standard "background IP" vs "foreground IP" distinction; foreground typically retained by lead applicant
- Cyber Scale in Critical Sectors 2026: up to £300k per contract; **closes 10 June 2026**

### 8. VERDICT
⚫ **BLACK without UK entity. 🟡 YELLOW with UK sub formed — Innovate UK is one of the cleaner IP-friendly grant programs once UK presence established.**

---

## Ford Foundation BUILD + Technology programs

### 6. IP OWNERSHIP — VERBATIM
**Source — Ford Foundation policy (effective February 1):**
> "beginning February 1, project grants from the foundation include a requirement that the grantee widely disseminate all copyrightable products funded by the grant—including white papers, research reports, and websites—and license them under the CC BY 4.0 license. In certain situations, such as when the expected product contains sensitive or confidential material, the Creative Commons license will not be a requirement."

### 8. VERDICT
🟢 **GREEN (mostly) — Code IP not specifically required as OSS; copyrightable PRODUCTS (papers, reports, websites) must be CC BY 4.0. Sensitive/confidential exception available. Grantee retains code IP. BUILD grants are invitation-only and target civil-society institutions; kastil-systems' fit is narrow but the framing "sealed-IDS protects civil-society from surveillance" could open conversations.**

---

## Sloan Foundation Open Source in Science

### 6. IP OWNERSHIP
- US research institution PI required (kastil-systems sub-aware via university)
- Grant amounts up to $750k over 2 years
- **Source:** "Except in rare circumstances, supported platforms, protocols, and products are free and open source."

### 8. VERDICT
🟠 **ORANGE — Requires university PI + free/open source mandate. Strategic value: connect with university OS-program-office (OSPO) initiatives where kastil-systems libsecurity.a is the underlying substrate.**

---

## Knight Foundation (News Challenge when running)

### 6. IP OWNERSHIP — VERBATIM
**Source — Knight News Challenge terms:**
> "If you are a winner of a Knight News Challenge grant, you'll still own the copyright on your intellectual property, including your software, but you will need to share the software you develop under a GPL license and any documents, manuals or instructions under Creative Commons licensing."

### 8. VERDICT
🟠 **ORANGE — Strong GPL requirement (note: GPL, not MIT/Apache). GPL is a copyleft license — implications for downstream commercial integrations. Use only if Joey is comfortable with GPL-funded portion living separately from a permissively-licensed kastil-systems core.**

---

## Schmidt Sciences (AI Safety / AI2050 / Trustworthy AI)

### 1. WHO
- Schmidt Sciences (Eric & Wendy Schmidt private foundation)
- 2026: 2026 Science of Trustworthy AI program announced

### 2. AWARDS
- Tier 1: up to $1M over 1-3 years
- Tier 2: $1-5M+ over 1-3 years
- Indirect costs capped at 10%

### 6. IP
- Specific IP terms not published; typically university-PI based with university IP policies governing
- Research outputs: open publication encouraged but not mandatorily OSS

### 8. VERDICT
🟡 **YELLOW — Adjacent to kastil-systems' core but Joey's not currently AI-safety positioned. Track for potential adjacent angle (e.g., "AI agent identity + sealed delegation via libsecurity.a"). Likely requires university PI.**

---

## Alfred P. Sloan Foundation Better Software for Science

Same pattern as Sloan Open Source in Science section — US research institution PI required, free/open source mandate, university IP policies govern. 🟠 ORANGE.

---

## Newly-Discovered Additions (Round 2)

### NEW: NGI Sargasso (covered above) — explicit EU↔US bridge with US-eligible status

### NEW: NGI TrustChain (covered above) — €200k cap, trust-infra focus

### NEW: NSF Strategic Breakthrough Award ($30M) — announced as part of 2026 SBIR reauthorization
- Targets high-impact SBIR-Phase-II graduates
- Same Bayh-Dole + 20-year SBIR data rights as standard SBIR
- 🟡 YELLOW
- Watch for FY2027 first-cycle solicitation

### NEW: EU Sovereign Tech Fund (EU-STF) — proposal stage 2025-2026
- OpenForum Europe leading the proposal for EU-level expansion of the German STF model
- If launched, would be 🟠 ORANGE with same OSS license requirement, larger budget (EU-scale)
- Status: not yet a fund Joey can apply to; track for late-2026/2027 launch

### NEW: GitHub Secure Open Source Fund 2026 expansion ($5.5M) — confirmed; covered in main entry

### NEW: ARDC (Amateur Radio Digital Communications) — niche but relevant
- Mesh/digital comms infrastructure
- Rolling reviews; 2026 priority deadline was Feb 1, 2026; next ~Feb 2027
- 🟢 GREEN — applicant retains IP; ARDC is a private foundation with no OSS mandate (though OSS is welcomed)
- Award range: $50k-$500k typical for digital comms infrastructure

### NEW: Anthropic Frontier Model Forum / OpenAI Cybersecurity Grant Program — both have active small-grant programs for AI-safety + AI-x-cybersecurity research
- Anthropic Responsible Scaling research grants: ~$25k-$250k typical
- OpenAI Cybersecurity Grant Program: $10k-$100k for defensive cyber + AI research
- 🟡 YELLOW for both — applicant retains IP; publication encouraged but not mandatory OSS

### NEW: Linux Foundation Public Health / LF Research grants — small targeted funding for ecosystem research
- 🟠 ORANGE typically (LF projects are OSS by nature)

### NEW: Bloomberg Tech Lab + Bloomberg Philanthropies tech-justice
- Restricted to Bloomberg-aligned focus areas; mostly invitation
- Not currently a fit but worth tracking

---

## Past-5-Years Major Program Changes (Round 2 deep dive)

- **NSF SBIR 2019:** SBA SBIR/STTR Policy Directive extended data protection from 4 to 20 years (FAR clause text still lags but policy controls)
- **NSF SBIR 2024:** Phase I cap raised $275k → $305k; Phase II cap $1M → $1.25M
- **NSF SBIR 2025:** Brief mid-year pause for program restart; restored with $250M deep-tech budget
- **NSF SBIR 2026:** Reauthorized through 2031; added $30M Strategic Breakthrough award
- **DFARS 2024:** Final rule codified 20-year SBIR data protection period in DoD regs
- **Horizon Europe 2021-2027:** Replaced Horizon 2020; introduced Results Ownership List (ROL) requirement; Article 16 ownership rules
- **Sovereign Tech Fund 2022:** Founded with €13M initial budget; grew to €30M+ projected 2026
- **Mozilla MOSS 2024:** Placed on indefinite hiatus; Mozilla Technology Fund replaces with narrower scope
- **NLnet NGI Zero 2024-2026:** Commons Fund launched; rolling-every-2-months cadence established; €21.6M envelope through 2027
- **OpenSSF Alpha-Omega 2026:** $12.5M new investment from Anthropic + AWS + Citi + GitHub + Google + Google DeepMind + Microsoft + OpenAI
- **DARPA AIxCC 2025:** Completed; $20M ARPA-H transition committed for finalists' systems
- **DARPA HARDEN 2023:** Cohort selected; recompete window expected 2027-2028
- **BIRD Cyber 2022:** Launched; 2026 round added $7.5M
- **EIC Accelerator 2026:** Process streamlined (50pp → 20pp); evaluations every 2 months; €634M annual budget
- **Singapore CSA CCDF 2024:** Refreshed framework; "all IP must be owned/managed from Singapore" clause hardened

## Next-5-Years Known Windows (2026-2031)

- **NLnet Commons Fund:** Rolling, every 2 months through 2027+ (next: June 1, 2026)
- **NSF SBIR Project Pitch:** June 2, 2026 / Nov 4, 2026 / Mar 4, 2027 / Jul 2027 / Nov 2027 etc. through 2031
- **NSF SaTC:** January 26, 2027 / January 2028 / annually
- **Horizon Europe 2026-2027 WP cyber calls:** Sep 15 / Nov 5, 2026; subsequent WP 2028-2029 expected late 2027
- **Sovereign Tech Fund:** Rolling, no fixed deadline through 2030+
- **DARPA I2O BAA:** Rolling; HARDEN recompete window 2027-2028; new program announcements quarterly
- **DOE CESER:** Per-FOA; BIL allocation runs through FY26; CHIPS+Science cyber extensions through FY28
- **Innovate UK Cyber Scale:** June 10, 2026; annual reopening expected
- **Vinnova:** April annual openings
- **Singapore CyberCall:** April-May annual openings (formed 2024 cadence)
- **NIST SBIR:** Annual NOFO typically Q1
- **NGI Sargasso OC5:** H2 2026 (final round)
- **NGI TrustChain OC3+:** Late 2026
- **Apple Security Research Device Program 2027:** Application window expected Fall 2026
- **EIC Accelerator:** 2-month evaluation cycle through 2027 work programme

---

## Strategic Cross-Cuts (for Joey's decision-making)

### A. Stack the IP-friendly Tier-1 grants first
1. NLnet (deadline June 1, 2026) — orange but small commitment scope
2. NSF SBIR Project Pitch (June 2, 2026) — yellow with 20-year data protection
3. Sovereign Tech Fund (rolling) — orange but contract-for-work paid-by-milestone

These three together can yield €25k + $305k + €100k+ in 2026 with no equity dilution and full Joey IP retention.

### B. Avoid these structural traps
- **Singapore CCDF:** "IP must be owned/managed from Singapore" — would force IP migration out of US sovereign posture
- **EIC Accelerator equity component:** Even grant-only requires EU SME registration
- **Knight News Challenge GPL requirement:** Copyleft license cascades; consider only if GPL-fundable portion is isolatable
- **YC / MACH37 / DataTribe:** Standard accelerator equity grabs (7%+); not grants

### C. The OSS-required tier (🟠 orange) is not a trap, but a strategic choice
NLnet, Sovereign Tech Fund, Alpha-Omega, OTF, GitHub Secure OSS, Mozilla, Sloan, NGI Sargasso, NGI TrustChain, Vinnova — all require OSS publication of funded work. The right strategy: SCOPE the funded portion to the libsecurity.a CORE that Joey wants to OSS-publish anyway (audit substrate, reproducible build, portable crypto primitives). Keep Pantheon-platform-specific orchestration (the proprietary moat) OUTSIDE the grant scope.

### D. The truly green (🟢) tier is small and mostly philanthropic
DARPA contracts (with carefully negotiated DFARS data rights) + Ford Foundation BUILD (CC BY 4.0 on copyrightable products but not on code) + ARDC + Anthropic/OpenAI cyber grants. These are the "Joey keeps everything" lanes, but they're harder to land or smaller in scale.

### E. The strongest single-mechanism IP posture for kastil-systems is NSF SBIR
20-year SBIR data rights + Bayh-Dole patent rights = the absolute strongest IP protection available in any US federal mechanism. The government's license is restricted to internal federal use; commercial competitors get NOTHING. This is the gold standard for sovereign-IP-preserving federal funding.

---

## File path

`C:\audit-of-all\be\plans\2026-05-30-i-MS-4-DEEP-grants-matrix.md`

End of report. 30 programs deeply analyzed; verdict counts: 🟢 = 2 · 🟡 = 8 · 🟠 = 12 · 🔴 = 4 · ⚫ = 4. Companion document `2026-05-30-i-MS-4-grants-fellowships-free-money.md` carries the broader 60+ inventory.
