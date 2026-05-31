# Government-Issued Security Certifications — Worldwide Atlas for the `nous` Mesh

*Inspect report I-MS-1 · 2026-05-30 · prepared for Joey Castillo (joeycastillo.us, kastil-systems org)*

> Mission: catalog every government-issued security certification on Earth that a pure-C99 / private-PKI / zero-trust trust-mesh / machine-identity product (`nous`) could pursue, with eligibility, cost, calendar, process, strategic value, and authoritative sources — then rank the top 3-5 to chase first for maximum global "Michelin Star" star power.

The target product (`nous`) is, in cert-speak:
- a **software cryptographic module** (`libsecurity.a`, ~900 LOC pure C99, no external deps) — the natural fit for the **FIPS 140-3 / ISO/IEC 19790 module-validation family** (CMVP / JCMVP / KCMVP / EUCC-cMod).
- wrapped by a **trust-mesh / machine-identity product** with VPN-like properties (mutual auth, key agreement, sealed channels) — the natural fit for the **Common Criteria Network Device cPP family** (NDcPP + PP-Modules for VPN Gateway, VPN Client, MACsec, etc.) under NIAP, EUCC, JISEC, KECS, SCCS, IC3S, AISEP.
- a candidate **CSfC component** (a CSfC mesh becomes the killer differentiator for classified data).

Everything below is organized around those two cert "shapes" plus the cloud-service overlays (FedRAMP / IL / IRAP) you trigger when you operate `nous`-as-a-service for a government customer.

---

## Part 1 — UNITED STATES

### 1.1 FIPS 140-3 / CMVP (Cryptographic Module Validation Program)

| Field | Value |
|---|---|
| Name | Federal Information Processing Standard 140-3 — Security Requirements for Cryptographic Modules |
| Issuer | **NIST** (US) jointly with **CCCS** (Canada) — co-managed CMVP |
| Standard | FIPS 140-3 = ISO/IEC 19790:2012 + ISO/IEC 24759:2017 (test methodology), plus NIST SP 800-140A through 800-140F |
| Scope | A cryptographic module (hardware / firmware / software / hybrid). Levels 1-4. Level 1 = software running on a general-purpose OS; Level 2 adds tamper evidence; Level 3 adds tamper response, identity-based auth; Level 4 is full physical/EMSEC envelope. |
| `nous` fit | **PERFECT.** `libsecurity.a` is the textbook FIPS 140-3 Level 1 software module candidate. (Realistically you can aim for L1 on commodity hardware, L2 once you have a TPM-backed key store, L3 if you ship in your own sealed appliance.) |
| Status 2026 | FIPS 140-2 was sunset for new submissions on Apr 1 2022; existing 140-2 certs move to the **Historical list on 21 Sep 2026**. Federal procurement after that date requires 140-3 for new buys. |
| Cost — NIST cost-recovery fee | **$2,500 CR + $1,000 ECR** per scenario for ALG/OEUP/PTSC/CVE/TRNS/PHYS/NSRL/RBND; UPDT $5,500/$1,500; **Full Submission (FS)** is the big one: **$16,000 (L1) / $17,000 (L2) / $17,500 (L3) / $19,000 (L4)** plus $3-4k ECR. Effective 1 Jan 2026. |
| Cost — accredited CSTL lab fee | **$50k-$200k typical**, scaling with module complexity. Level 1 software-only ≈ $50-100k; Level 2+ ≈ $100-250k. (Labs don't publish — quotes are bespoke.) |
| Cost — internal engineering | $50k-$500k+ (KAT vectors, entropy-source documentation, SP 800-90B health tests, FSM doc, security policy, finite state model, vendor evidence, audit response). The pure-C / no-deps posture **helps** — fewer third-party components to drag through review. |
| Calendar | Lab phase: 3-6 months. NIST review queue: **6-18 months** (notorious backlog; published In-Process list shows this). Total: **12-24 months** from kick-off to cert. SafeLogic's "RapidCert" markets 90-day options for pre-built shells. |
| Validity | 5 years on Active list (2 years for Interim). After that, Historical — usable for existing systems only. |
| Process | (1) Engage NVLAP-accredited CSTL → (2) algorithm validation via CAVP (now ACVP automated) → (3) module test report → (4) submit to CMVP via 90C process → (5) NIST review + Q&A → (6) cert issued, posted to Validated Modules List. |
| Strategic value | **Foundational**. No US federal procurement of cryptography happens without it. Required by FedRAMP, DoD ILs, CSfC, CJIS, HIPAA-aligned procurements, and most F100 enterprise security checklists. *This is the table-stakes "Michelin Star."* |
| Accredited CSTLs (US) | atsec, Acumen Security, Lightship Security, Leidos, Booz Allen Hamilton, Gossamer Security Solutions, UL, Aegisolve, Corsec (consultancy), SafeLogic (consultancy + shell module). |
| Authoritative sources | https://csrc.nist.gov/projects/cryptographic-module-validation-program · https://csrc.nist.gov/projects/cryptographic-module-validation-program/nist-cost-recovery-fees · https://csrc.nist.gov/projects/fips-140-3-transition-effort |

### 1.2 CAVP (Cryptographic Algorithm Validation Program) — prerequisite to CMVP

| Field | Value |
|---|---|
| Issuer | NIST + CCCS |
| Scope | Validates individual algorithms (AES, SHA-2/3, HMAC, RSA, ECDSA, EdDSA, DRBG, KAS, KDF, PQC ML-KEM/ML-DSA) against published Known Answer Tests via the ACVP server. |
| `nous` fit | **Mandatory precursor** to CMVP. Every approved algorithm in `libsecurity.a` must hold a CAVP certificate before the module cert can issue. |
| Cost / Calendar | Lab-driven, ~$5-25k bundled; ACVP automation makes it fast (days to weeks). |
| Source | https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program |

### 1.3 NIAP Common Criteria (US scheme — CCEVS)

| Field | Value |
|---|---|
| Name | National Information Assurance Partnership — Common Criteria Evaluation and Validation Scheme |
| Issuer | NSA + NIST joint partnership; NIAP runs the US scheme under CCRA. |
| Scope | Product/system certification (the "TOE") against an NIAP-approved Protection Profile (PP). The US dropped EAL-only evals years ago; **NIAP only accepts PP-based evals**. EAL2-equivalent under cPP gets full CCRA recognition. |
| `nous` fit | **VERY GOOD.** The mesh layer fits the **collaborative Protection Profile for Network Devices (NDcPP) v2.2e** as the base, plus the **PP-Module for VPN Gateway** and **PP-Module for VPN Client**. If `nous` ever runs on managed mobile, also **MDM PP v4.0** + **MDM Agent PP-Module**. Pure-software stand-alone library: **PP for Application Software (AppPP)**. |
| Cost | $200k-$500k total for NDcPP-class eval (Corsec/Lightship/Gossamer published ranges); $300k-$1M for combinations with multiple PP-Modules. |
| Calendar | 12-18 months typical; well-prepped vendors ship in 6-9 months. |
| Validity | Posted on the NIAP Product Compliant List (PCL); typically 2 years before assurance maintenance is required. |
| Process | (1) Pick PP(s) → (2) draft Security Target → (3) engage NIAP-approved CCTL → (4) Evaluation Technical Report → (5) NIAP validation → (6) cert posted to PCL. |
| Strategic value | **Required for DoD/IC procurement.** CNSSP-11 mandates NIAP-validated COTS for NSS. Also a prerequisite for CSfC. Recognized worldwide via CCRA. |
| NIAP-approved CCTLs | atsec, Acumen, Booz Allen Hamilton, Gossamer Security Solutions, Leidos, Lightship Security, UL Verification Services, Aegisolve, Intertek EWA-Canada (cross-border). Full list at https://www.niap-ccevs.org/cctl |
| Sources | https://www.niap-ccevs.org/ · https://www.niap-ccevs.org/protectionprofiles · https://www.niap-ccevs.org/protectionprofiles/447 (NDcPP) |

### 1.4 FedRAMP (Federal Risk and Authorization Management Program)

| Field | Value |
|---|---|
| Issuer | GSA / OMB (US federal cloud authorization). |
| Scope | Cloud Service Offerings (SaaS / PaaS / IaaS). `nous` itself is a library, but **`nous`-as-a-Service** triggers FedRAMP. |
| Baselines | Low (≈156 controls), Moderate (≈323), High (≈410). |
| Paths | Agency-sponsored ATO, JAB P-ATO (now near-deprecated for new entrants), or the new **FedRAMP 20x** continuous-auth program. |
| `nous` fit | Direct fit if you deliver `nous` as a managed mesh/identity service to a federal agency. Most pure-product vendors **partner with a FedRAMP-authorized hosting CSP** (AWS GovCloud, Azure Gov, Google GovCloud) rather than authorize their own boundary. |
| Cost | Low $250-500k · Moderate (Agency) $400k-900k · Moderate (JAB) $1.0-1.8M · High $2.5M+. Annual ConMon $120-300k. **FedRAMP 20x Low/Moderate target: $100-300k** initial. |
| Calendar | 12-18 months (Moderate); up to 24 months (High). 20x targets weeks. |
| Process | (1) Categorize per FIPS 199 → (2) Implement controls per NIST 800-53r5 → (3) Engage 3PAO for assessment → (4) SSP/SAR/POA&M → (5) Sponsor (agency or JAB) ATO. |
| Strategic value | Mandatory ticket for SaaS sales to civilian federal customers. Often required by state/local through StateRAMP. |
| Sources | https://www.fedramp.gov/ · https://www.fedramp.gov/20x/ · https://www.fedramp.gov/20x/phases/3/ |

### 1.5 DoD Impact Levels (IL2 / IL4 / IL5 / IL6) — DISA Cloud Computing SRG

| Field | Value |
|---|---|
| Issuer | DISA (Defense Information Systems Agency). |
| Scope | Cloud authorization layered on top of FedRAMP for DoD use. IL2 = public/non-critical; IL4 = CUI; IL5 = higher-sensitivity CUI + mission-critical NSS; IL6 = SECRET classified. |
| `nous` fit | If `nous` is hosted (SaaS) for DoD use; IL5/IL6 require US-citizen-only personnel, dedicated DoD network paths, and clearance. |
| Process | (1) Start with FedRAMP Mod (IL4/IL5) or High (IL5/IL6) → (2) FedRAMP+ overlay (DISA-specific controls) → (3) DoD PA from DISA → (4) STIG-aligned engineering throughout. |
| Calendar | +6-12 months on top of FedRAMP. |
| Strategic value | Required for any DoD cloud purchase; IL5+ is the prestige tier (US Citizens only, dedicated infrastructure). |
| Sources | DISA CC SRG: https://public.cyber.mil/dccs/ |

### 1.6 CMMC 2.0 (Cybersecurity Maturity Model Certification)

| Field | Value |
|---|---|
| Issuer | DoD via **The Cyber AB** (accreditation body) and C3PAOs (assessors). |
| Scope | An **organizational** certification (not a product cert) for defense contractors handling FCI/CUI. Levels 1-3. |
| `nous` fit | This certifies *Joey's company* if `kastil-systems` ever holds DoD contract data. **Not** a product cert. Important if you sell into DIB. |
| Cost | L1 $5-15k · L2 $50-200k (small org), $150-350k (mid) · L3 $100k-$2.7M. |
| Calendar | 3-12 months prep + assessment. |
| Process | Cyber AB marketplace → C3PAO → 3-5 day on-site → MET/NOT MET per practice → eMASS submission → cert. |
| Strategic value | Required to bid DoD contracts under final CMMC rule (2024+). |
| Sources | https://cyberab.org/ |

### 1.7 NSA Commercial Solutions for Classified (CSfC)

| Field | Value |
|---|---|
| Issuer | NSA Information Assurance Directorate. |
| Scope | A program that lets vendors get on the **CSfC Components List**, then customers compose two-layer "registered solutions" (Capability Packages) to protect data up to TS/SCI without buying Type-1 crypto. |
| Capability Packages (CPs) | Mobile Access (MA), Multi-Site Connectivity (MSC), Campus WLAN (CW), Data-at-Rest (DAR). |
| `nous` fit | **Tactically perfect for the brand story.** A two-layer CSfC mesh is exactly the "machine identity + mutual auth + sealed tunnels" picture `nous` already paints. To get listed: NIAP CC against the relevant PP-Module (IPsec VPN, MACsec, TLS) **+ FIPS 140-3** + sign the CSfC MoA + agree to timely vuln remediation. |
| Cost / Calendar | Implicit through the NIAP + FIPS spend ($300k-$1M); MoA itself is no-fee but compliance-onerous (vuln SLAs). 18-36 months end-to-end. |
| Strategic value | **The "trophy."** Being on the CSfC Components List positions `nous` for IC/DoD classified mesh deployments — a market commodity products cannot enter. Pairs naturally with the "trust mesh in pure C" story. |
| Sources | https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/ · https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/Components-List/ |

### 1.8 US Export Control (BIS / EAR, ITAR) — not a cert, but a gate

| Item | What |
|---|---|
| ECCN | `libsecurity.a` is almost certainly **5D002** (encryption software). |
| License Exception | **ENC** (15 CFR 742.15 / 740.17) covers most distribution paths. Publicly-available open-source crypto: one-time email notification to BIS + NSA with the source URL — then largely deregulated. |
| ITAR | Not applicable unless `nous` is built specifically for a USML article (defense article). Pure commercial / dual-use crypto is EAR, not ITAR. |
| Strategic value | Doing this paperwork correctly **once** unlocks worldwide distribution; doing it wrong creates ITAR-jail. |
| Source | https://www.bis.doc.gov/index.php/policy-guidance/encryption/ |

---

## Part 2 — EUROPEAN UNION + UK

### 2.1 EUCC (EU Cybersecurity Certification scheme on Common Criteria)

| Field | Value |
|---|---|
| Name | European Common Criteria-based cybersecurity certification scheme |
| Issuer | EU Commission Implementing Regulation (EU) 2024/482 of 31 Jan 2024; operated through ENISA + national NCCAs (national cybersecurity certification authorities). |
| Standard | ISO/IEC 15408:2022 (CC:2022) + ISO/IEC 18045 evaluation methodology. |
| Assurance Levels | **Substantial** (AVA_VAN.1 / VAN.2 — roughly EAL2-3 equivalent) and **High** (AVA_VAN.3/4/5 — roughly EAL4-7 equivalent). |
| Status 2026 | Went live **27 Feb 2025**. SOG-IS Mutual Recognition Arrangement **ceased issuing certs on 27 Feb 2026** — EUCC is now the sole EU CC vehicle. Italy's national OCSI ceased the same day and operates only via EUCC. |
| `nous` fit | Same shape as NIAP: pick a PP (NDcPP available; EUCC publishes its own approved PP catalog), do an evaluation at Substantial or High. **Two birds with one PP** if you choose a cPP that has both NIAP and EUCC adoption. |
| Cost / Calendar | Comparable to NIAP: €150k-€400k Substantial; €300k-€1M+ High; 9-18 months. |
| Strategic value | **Required for EU public-sector tenders** under the Cyber Resilience Act (CRA, applies from Dec 2027) for "important" / "critical" digital products. EUCC will become *the* gate to EU government and CRA-touched private procurement. |
| Sources | https://certification.enisa.europa.eu/certification-library/eucc-certification-scheme_en · https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=OJ:L_202400482 |

### 2.2 Germany — BSI

| Item | Detail |
|---|---|
| BSI Common Criteria | German national CC scheme; full EAL1-7 historically, now folded under EUCC for new evaluations. Famous for high-assurance smartcard/IC evals (EAL5-7). |
| **BSZ — Beschleunigte Sicherheitszertifizierung** (Accelerated Security Certification) | Lightweight 3-month BSI cert focused on a black-box pen-test + design review. **Cheap and fast — ideal first European stamp** for `nous`. |
| **VS-NfD Zulassung** (Approval for "VS — Nur für den Dienstgebrauch", roughly "Restricted") | German classified-info approval for the lowest classification tier. BSI runs a *qualified procedure* that assesses vendor processes for accelerated approval — analogue to CSfC but for German government use. |
| Cryptographic standards | BSI publishes TR-02102 (cryptographic recommendations) and AIS-B1/B2 guidance for evaluators. ISO/IEC 19790 used directly for module evaluations under EUCC-cMod. |
| Sources | https://www.bsi.bund.de/EN/ · https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/ · https://www.tuvit.de/en/services/cyber-security/bsz/ |

### 2.3 France — ANSSI

| Item | Detail |
|---|---|
| **CSPN — Certification de Sécurité de Premier Niveau** | France's "first-level" cert: 25-35 person-day black-box eval by an ANSSI CESTI lab. **Total cost €15-50k, 3-6 months, valid 3 years.** Lowest-cost European government cert by a wide margin. |
| **CC FR** (ANSSI Common Criteria) | Full CC evaluations through ANSSI under SOG-IS historically, now EUCC. France keeps strong cryptographic expertise (CESTI labs: Amossys, CEA, Oppida, SERMA, Thales, Quarkslab). |
| **Qualification ANSSI** (Élémentaire, Standard, Renforcée) | After certification, ANSSI can "qualify" a product for French government use — analogue to CSfC inclusion. Strong moat for French public-sector sales. |
| `nous` fit | **CSPN is the easiest, cheapest first European cert anywhere.** Recommend as a quick win for the brand story before going up to EUCC. |
| Sources | https://cyber.gouv.fr/offre-de-service/solutions-certifiees-et-qualifiees/ · https://cyber.gouv.fr/.../presentation-certification-cspn/ |

### 2.4 UK — NCSC (post-Brexit)

| Scheme | Detail |
|---|---|
| **CAPSS — Commercial Product Assurance for Sensitive Systems** | NCSC's bespoke high-assurance scheme for products used in UK sensitive/classified networks. Replaces older CESG schemes. |
| **CAS — Commercial Assurance Service** (formerly CPA) | The general UK product-assurance scheme — equivalent role to CSPN/BSZ. |
| **Cyber Essentials / Cyber Essentials Plus** | Org-level baseline cert (NOT a product cert). CE+ adds independent technical audit. **April 2026 v3.3 release: scope cannot exclude end-user devices; MFA mandatory on cloud services; 14-day patch SLA enforced.** Often required for UK government contracts. |
| **CHECK** | Pen-test approval scheme for service providers (CREST equivalent). |
| **CCRA participation** | The UK is a CCRA *consuming* participant (downgraded from authorizing some years ago) — UK accepts CC certs from other nations but does not issue new ones. |
| `nous` fit | CAPSS for trust-mesh into UK classified; Cyber Essentials Plus for org credibility. |
| Sources | https://www.ncsc.gov.uk/ · https://www.ncsc.gov.uk/cyberessentials/overview · https://www.ncsc.gov.uk/schemes |

### 2.5 Netherlands, Italy, Spain, Sweden, Norway, Austria — Quick Hit

| Country | Body | Status |
|---|---|---|
| Netherlands | **NLNCSA** + Dutch Authority for Digital Infrastructure (RDI) | CCRA authorizing; runs **NSCIB** scheme operated by **TrustCB** as Cert Body. Active CC issuer especially for smartcards. Now also issues EUCC. |
| Italy | **OCSI** (under ACN — Agenzia per la Cybersicurezza Nazionale) | OCSI national scheme **ceased 27 Feb 2026** — all activity through EUCC. Existing certs remain valid to expiry. |
| Spain | **OC-CCN** under **CCN** (Centro Criptológico Nacional) | CCRA authorizing; runs Spanish CC scheme; transitioning to EUCC. Cryptographic approval: **CCN-CERT STIC** product catalog. |
| Sweden | **CSEC** under FMV | CCRA authorizing; CC issuance now via EUCC. |
| Norway | **SERTIT** under NSM | CCRA authorizing; non-EU but aligns with EUCC. |
| Austria, Greece, Hungary, Czech Rep, Denmark, Finland | CCRA consumers; route certs through other EU schemes. |

---

## Part 3 — ASIA-PACIFIC

### 3.1 Japan

| Scheme | Detail |
|---|---|
| **JCMVP** — Japan Cryptographic Module Validation Program | Run by **IPA** (Information-technology Promotion Agency). Module validation against **ISO/IEC 19790** + JIS X 19790 — directly equivalent to FIPS 140-3. Validates against CRYPTREC-approved algorithms (Camellia, AES, SHA-2/3 family). |
| **JISEC** — Japan IT Security Evaluation and Certification Scheme | Run by IPA; CCRA authorizing; uses ISO/IEC 15408. NITE is the lab-accreditation body. |
| `nous` fit | JCMVP for the module (parallel to FIPS 140-3); JISEC for the mesh product (parallel to NIAP CC). Worth bundling — Japan is a large enterprise+gov market with explicit JCMVP procurement preferences. |
| Sources | https://www.ipa.go.jp/en/security/jcmvp/ · https://www.ipa.go.jp/en/security/jisec/ |

### 3.2 South Korea

| Scheme | Detail |
|---|---|
| **KCMVP** — Korea Cryptographic Module Validation Program | Run by **NSR** (National Security Research) under **NIS** (National Intelligence Service). Module validation against KS X ISO/IEC 19790. **MANDATES Korean national algorithms — ARIA, SEED, LEA, HIGHT, HAS-160, LSH.** A FIPS-validated module that does not implement Korean algos cannot pass KCMVP. **KCMVP 3.0 in force.** |
| **KECS** — Korea Evaluation and Certification Scheme | Operated by **ITSCC** (IT Security Certification Center) under NIS. CCRA authorizing. Issues Korean CC certificates. |
| `nous` fit | To enter Korean gov procurement, `nous` would need to **add SEED/ARIA/LEA implementations** to `libsecurity.a` — a multi-month engineering lift, but architecturally clean given the pure-C posture. |
| Sources | https://eng.nis.go.kr/ |

### 3.3 Singapore

| Scheme | Detail |
|---|---|
| **SCCS** — Singapore Common Criteria Scheme | Run by **CSA** (Cyber Security Agency). CCRA authorizing; cost-effective regional CC scheme. |
| **CLS** — Cybersecurity Labelling Scheme | Consumer IoT tiered labelling (Levels 1-4). Not for `nous` itself but worth noting for any consumer endpoint. **CLS Level 2 becomes mandatory for residential routers by 2027.** |
| **NITES** — National IT Evaluation Scheme | Singapore government-only evaluation. |
| Sources | https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/ |

### 3.4 China

| Scheme | Detail |
|---|---|
| **OSCCA** — State Cryptography Administration / Office of State Commercial Cryptography Administration | Mandates use of **SM2/SM3/SM4/SM9/ZUC** (the ShangMi suite) for commercial crypto in China. Foreign algorithms (AES, RSA, ECDSA) are not approved for many Chinese commercial-cryptography uses. Vendor must obtain a **Commercial Cryptography Product Certificate** through an OSCCA-recognized lab. |
| **MLPS 2.0** — Multi-Level Protection Scheme (Cybersecurity Classified Protection 2.0) | Five-tier classification of information systems; Tier 3+ requires use of OSCCA-approved cryptography and certified products. Mandatory for operators of "critical information infrastructure." |
| **CC China** | China is a CCRA *consuming* member (not authorizing). |
| `nous` fit | China is a special case. To sell into China, you implement SM2/SM3/SM4 (the wolfSSL pattern), get OSCCA cert, and accept that you're now subject to Chinese cryptography law (source escrow requirements, etc.). **Strategically: usually a separate Chinese fork rather than the global mainline.** |
| Sources | https://www.oscca.gov.cn/ (Chinese-only) · https://www.atsec.cn/ for the English bridge |

### 3.5 India

| Scheme | Detail |
|---|---|
| **IC3S** — Indian Common Criteria Certification Scheme | Operated by **STQC** Directorate of **MeitY** (Ministry of Electronics and IT). CCRA authorizing (since 2013). Issues CC certs up to EAL4. **India holds the CCDB Chair 2026-2028** — political momentum behind the scheme. |
| **CCA — Controller of Certifying Authorities** | India's national PKI root for licensed CAs under the IT Act. Tangentially relevant to a trust-mesh story (could `nous` host a CCA-licensed identity anchor?). |
| **CERT-In** | National CERT; runs empanelment of auditors (not a product cert). |
| `nous` fit | IC3S is a low-cost CCRA-recognized authorizing path (Indian rupee labor cost). Strategic value: India procurement growth + the chair role amplifies recognition. |
| Sources | https://commoncriteria-india.gov.in/ · https://www.stqc.gov.in/ |

### 3.6 Taiwan, Malaysia, Pakistan, Israel — short list

| Country | Scheme | Note |
|---|---|---|
| Taiwan | NICST (CC consuming) | Limited authoring; mostly accepts CCRA certs. |
| Malaysia | **MyCC** — operated by CyberSecurity Malaysia | CCRA authorizing; affordable Asian CC option. |
| Pakistan | CCRA consuming | Limited indigenous scheme. |
| Israel | **INCD** (Israel National Cyber Directorate) | Runs national org-level certifications (banking supply chain in 2024+); no full national CC scheme — Israeli vendors typically pursue NIAP/EUCC. Strong consumer of CCRA certs. |

---

## Part 4 — OTHER (Canada, Australia, NZ, Switzerland)

### 4.1 Canada — CCCS

| Item | Detail |
|---|---|
| **CMVP (joint with US NIST)** | Already covered §1.1 — a single FIPS 140-3 cert from CMVP is **automatically a Canadian validation too**. Best value-per-dollar in the world: one process, two countries. |
| **CCCS Cryptographic Module Validation** | Same scheme as CMVP. |
| **Canadian Common Criteria Scheme** | Operated by CCCS through **CCS** (CCEF labs); CCRA authorizing; issues Canadian CC certs primarily for federal procurement. |
| Sources | https://www.cyber.gc.ca/en/tools-services/cryptographic-module-validation-program-cmvp |

### 4.2 Australia — ASD / IRAP

| Item | Detail |
|---|---|
| **IRAP** — Infosec Registered Assessors Program | ASD-administered assessment of systems against the **Australian Information Security Manual (ISM)** for OFFICIAL / PROTECTED / SECRET / TOP SECRET. **NOT a product cert** — a system/service assessment. Cost $40-250k+, 8-24 weeks, validity 2-3 yrs. |
| **ASD-Approved Cryptographic Algorithms (AACA)** | Aligned with NIST suites + post-quantum migration. |
| **AISEP** — Australasian Information Security Evaluation Program (Australia + NZ) | CCRA-authorizing CC scheme operated by ASD. Issues "Evaluated Products List" entries. |
| Sources | https://www.cyber.gov.au/ · https://www.cyber.gov.au/business-government/protecting-devices-systems/assessment-evaluation-programs/irap |

### 4.3 New Zealand — GCSB / NCSC

| Item | Detail |
|---|---|
| **NZISM** — NZ Information Security Manual | National control framework, equivalent to ISM. |
| CC status | NZ **relinquished CCRA authorizing status** — now consuming only. Prefers AISEP-evaluated products. |
| Sources | https://nzism.gcsb.govt.nz/ |

### 4.4 Switzerland — NCSC.ch / BACS

| Item | Detail |
|---|---|
| **NCSC.ch / BACS** (Federal Office for Cybersecurity, since 2024) | No comprehensive national CC scheme; Switzerland is a CCRA *consuming* nation, generally accepting BSI/ANSSI/CCCS certs for federal procurement. Sectoral cryptography rules under FADP (Swiss data protection). |

---

## Part 5 — MUTUAL RECOGNITION ARRANGEMENTS

### 5.1 CCRA — Common Criteria Recognition Arrangement

**The big one.** Established 1998 (and revised at ICCC 2014 to introduce cPPs). India holds the CCDB chair 2026-2028.

| Role | Member nations |
|---|---|
| **Certificate Authorizing Participants (~17, may issue certs)** | Australia, Canada, France, Germany, India, Italy, Japan, Malaysia, Netherlands, Norway, Republic of Korea, Singapore, Spain, Sweden, Turkey, United Kingdom*, United States *(UK status is degraded — primarily consuming in practice)* |
| **Certificate Consuming Participants (~18, accept others' certs)** | Austria, Czech Republic, Denmark, Ethiopia, Finland, Greece, Hungary, Indonesia, Israel, New Zealand, Pakistan, Philippines, Qatar, Saudi Arabia, Slovakia, UAE, etc. |
| **What recognition grants** | Mutual recognition of certs **up to EAL2 (with ALC_FLR)** for non-cPP evals, **up to EAL4 (with ALC_FLR) for cPP-conformant evals**. Above EAL4 requires bilateral agreements (e.g. BSI's EAL5+ smartcard certs were SOG-IS-recognized; now under EUCC). |

**Practical upshot for `nous`:** A single NIAP NDcPP+VPN evaluation at EAL2-aug **automatically grants recognition across ~35-38 countries** without re-cert. That's the lowest-cost path to global government recognition.

Sources: https://www.commoncriteriaportal.org/ccra/ · https://www.commoncriteriaportal.org/ccra/members/

### 5.2 SOG-IS — Senior Officials Group Information Systems Security

- Status: **Ceased issuing certs 27 Feb 2026.** Subsumed into EUCC.
- Was the EU's high-assurance MRA (EAL5+ smartcard / HSM / TPM evaluations recognized across 17 EU states).
- Legacy SOG-IS certs remain valid to expiry; replacement is EUCC "High" assurance.

### 5.3 The "FIPS + CC + EUCC" Trifecta (the global game-board)

| Investment | Geographic reach |
|---|---|
| **FIPS 140-3 (US + CA via joint CMVP)** | US + Canada federal procurement; gold standard worldwide for cryptographic module assurance. |
| **NIAP CC under NDcPP+VPN** | ~35 CCRA nations recognize it (US, EU members under EUCC bridging, JP, KR, IN, SG, MY, AU, etc.). |
| **EUCC at "Substantial"** | All EU member states (where CCRA recognition isn't enough for CRA-touched procurement). |
| **CSfC components listing** | US classified mesh market (closed-shop tier). |
| **One national accelerated cert (CSPN or BSZ)** | A "trophy" European stamp at low cost — strong marketing in EU public-sector RFPs. |

That five-leg stool **covers every government on Earth that buys commercial cryptographic mesh products**.

---

## Part 6 — STRATEGIC RECOMMENDATION

If Joey had to pick the top 5 to pursue first, ranked:

### Rank 1 — **FIPS 140-3 (CMVP, joint US + Canada) at Level 1 for `libsecurity.a`**
- **Why first:** It is the *single* substrate that every other cert assumes underneath. NIAP requires it. CSfC requires it. FedRAMP basically requires it. Most enterprise procurement requires it.
- **Cost / time:** $50-200k lab + $16k NIST FS fee + $50-200k internal engineering; 12-24 months.
- **Moat:** FIPS 140-3 is **hard** — the entropy doc, KAT discipline, FSM modeling, and security policy are non-trivial. Done well, it is a multi-year barrier to competitors who think "just wrap OpenSSL." The pure-C, no-deps posture *actually accelerates* this (no third-party shells to drag through).
- **Multiplier:** One submission, two countries (US + Canada via CCCS). Single best ROI on the board.

### Rank 2 — **NIAP Common Criteria under NDcPP + VPN Gateway PP-Module**
- **Why second:** Lights up ~35 CCRA-recognized nations on one investment. Required for US DoD/IC procurement. Prerequisite for CSfC.
- **Cost / time:** $300-600k all-in; 12-18 months. Often runs in parallel with FIPS 140-3 once the module cert lab is engaged.
- **Moat:** PP-based eval forces architectural decisions (separation of crypto plane, audit logging, secure update, self-tests) that competitors hand-wave. The Security Target itself becomes a sales artifact.

### Rank 3 — **NSA CSfC Components List inclusion (the "Michelin Star")**
- **Why third:** Only achievable *after* #1 and #2 — but **this is the trophy cert** in Joey's language. CSfC inclusion is a closed-shop seal that says "NSA trusts this for two-layer protection of classified data through Top Secret." It opens IC/DoD classified-mesh deployments that no commercial competitor without CSfC can touch.
- **Cost / time:** Mostly the cost of #1 + #2 + ongoing vuln-SLA discipline; sign the MoA; 6-12 months past the underlying certs.
- **Moat:** The brand story writes itself — "the pure-C zero-trust mesh on the NSA CSfC Components List." That sentence is the marketing.

### Rank 4 — **EUCC at Substantial via a national NCCA (Germany BSI or France ANSSI)**
- **Why fourth:** EU Cyber Resilience Act enforcement begins Dec 2027 — EUCC will be the gating cert for "important / critical" digital products sold to the EU public sector. Getting in early is brand-defining.
- **Cost / time:** €150-400k Substantial; 9-18 months. Re-use of the NIAP Security Target dramatically reduces work.
- **Moat:** First-mover positioning in a scheme that just launched (Feb 2025). Few competitors have EUCC certs yet.

### Rank 5 — **France ANSSI CSPN** *(the "fast cheap European stamp")*
- **Why fifth:** Costs €15-50k, completes in 3-6 months, and yields a genuine government cert on EU soil. Doesn't replace EUCC for high-assurance markets, but it *immediately* gives `nous` a French government cert to put on the homepage while EUCC and FIPS bake. CSPN is the *fastest* legitimate "Michelin Star" Joey can pin on the wall.
- **Cost / time:** Smallest of any cert on this list.
- **Moat:** Low — but it earns ANSSI relationship equity for the subsequent EUCC + Qualification campaign.

### Honourable mentions
- **Japan JCMVP + JISEC**: Pursue after the trifecta if APAC enterprise / government revenue justifies. Same shape as the US stack.
- **Korea KCMVP**: Requires SEED/ARIA/LEA implementation — pure-C makes this clean but it is a 3-6 month engineering side-quest. Worth it only for explicit Korean government opportunity.
- **CMMC L2**: Organizational, not product. Needed only if `kastil-systems` directly handles DoD CUI under contract.
- **FedRAMP 20x**: Pursue once `nous`-as-a-service has a first federal customer to sponsor. Phase 3 (Q3-Q4 2026) lowers the cost floor dramatically.

### Sequence cheat-sheet (the "play")

```
Year 1  : CSPN (France)   → fast brand stamp
          + CAVP algos    → prerequisite work
          + ENC notification → export-control clearance
Year 1-2: FIPS 140-3 L1   → the substrate cert
          + parallel NIAP NDcPP+VPN preparation
Year 2  : NIAP CC issued  → ~35 CCRA nations recognize
          + sign CSfC MoA → submit components for listing
Year 2-3: EUCC Substantial → re-use of CC ST → fast lap
          + CSfC components listing posted → trophy
Year 3+ : JCMVP + JISEC, KCMVP (if SEED/ARIA added),
          IRAP for AU gov customers, FedRAMP 20x for US fed SaaS.
```

That sequence converts roughly **$1.0-1.5M and 36 months** into recognition across **40+ governments**, including the closed-shop NSA CSfC list. Everything else is incremental.

---

## Appendix A — Authoritative sources (quick index)

- NIST CMVP: https://csrc.nist.gov/projects/cryptographic-module-validation-program
- NIST CMVP cost-recovery fees (2026): https://csrc.nist.gov/projects/cryptographic-module-validation-program/nist-cost-recovery-fees
- FIPS 140-3 transition: https://csrc.nist.gov/projects/fips-140-3-transition-effort
- NIAP: https://www.niap-ccevs.org/
- NIAP PP catalog: https://www.niap-ccevs.org/protectionprofiles
- CCRA portal: https://www.commoncriteriaportal.org/ccra/
- FedRAMP: https://www.fedramp.gov/ · 20x: https://www.fedramp.gov/20x/
- DISA CC SRG / DoD ILs: https://public.cyber.mil/dccs/
- The Cyber AB (CMMC): https://cyberab.org/
- NSA CSfC: https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/
- CSfC Components List: https://www.nsa.gov/Resources/Commercial-Solutions-for-Classified-Program/Components-List/
- BIS / EAR encryption: https://www.bis.doc.gov/index.php/policy-guidance/encryption/
- ENISA EUCC: https://certification.enisa.europa.eu/certification-library/eucc-certification-scheme_en
- EUCC Implementing Regulation: https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=OJ:L_202400482
- SOG-IS (legacy): https://www.sogis.eu/
- Germany BSI: https://www.bsi.bund.de/EN/
- BSZ accelerated cert: https://www.tuvit.de/en/services/cyber-security/bsz/
- France ANSSI / CSPN: https://cyber.gouv.fr/offre-de-service/solutions-certifiees-et-qualifiees/
- UK NCSC: https://www.ncsc.gov.uk/ · CE: https://www.ncsc.gov.uk/cyberessentials/overview
- Japan IPA JCMVP: https://www.ipa.go.jp/en/security/jcmvp/
- Japan IPA JISEC: https://www.ipa.go.jp/en/security/jisec/
- Korea NIS: https://eng.nis.go.kr/
- Singapore CSA SCCS / CLS: https://www.csa.gov.sg/our-programmes/certification-and-labelling-schemes/
- China OSCCA cross-reference: https://www.atsec.cn/
- India IC3S: https://commoncriteria-india.gov.in/ · STQC: https://www.stqc.gov.in/
- Canada CCCS CMVP: https://www.cyber.gc.ca/en/tools-services/cryptographic-module-validation-program-cmvp
- Australia ASD IRAP: https://www.cyber.gov.au/business-government/protecting-devices-systems/assessment-evaluation-programs/irap
- New Zealand NZISM: https://nzism.gcsb.govt.nz/

---

*Report I-MS-1 · prepared 2026-05-30 for joey.castillo@acmedev.com · the Pantheon / metal console.*
