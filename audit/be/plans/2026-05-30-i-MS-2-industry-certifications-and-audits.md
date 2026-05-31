# Quadrant MS-2 — Industry-Issued Security Certifications, Audits & Compliance Frameworks

**Mission:** Catalog every non-government, industry-issued security certification, audit standard, and compliance framework that nous — a pure-C99, private-PKI / machine-identity / zero-trust mesh built by a private operator with a ~900 LOC `libsecurity.a` — could pursue. Assess fit, cost, calendar time, process, and strategic value. Close with a ranked top-3-to-5 to pursue first.

**Operator context:** Joey Castillo / joeycastilloUS / kastil-systems / acmedevUS. Small org / solo founder. Roll-your-own discipline. The product is a trust substrate, not a hosted SaaS — but it WILL ship into orgs that need to satisfy enterprise procurement. The certifications below are the rules of THAT game.

**Date:** 2026-05-30

---

## Table of Contents

1. ISO/IEC Families (ISMS, controls, cloud, privacy, crypto modules, Common Criteria, BCM, risk)
2. AICPA / Audit Frameworks (SOC 1, SOC 2, SOC 3, SOC for Cybersecurity, HITRUST, CSA STAR)
3. Industry-Specific (PCI family, HIPAA, NIST CSF/800-171/800-53, CIS, COBIT, BSI IT-Grundschutz, TISAX, IEC 62443, TS 50701, IEC 81001-5-1)
4. Emerging / Supply-Chain (OpenSSF Badge & Scorecard, SLSA, SSDF, SBOM standards, in-toto, Sigstore)
5. Attestation / Trust Programs (TrustArc, BBB, ISACA, ISC2)
6. Closing Recommendation — top 3-5 to pursue first

---

# 1. ISO/IEC FAMILIES

## 1.1 ISO/IEC 27001:2022 — Information Security Management System (ISMS)

1. **Name + issuer:** ISO/IEC 27001:2022 — Information Security Management Systems — Requirements. Joint standard of ISO + IEC. Certification issued by accredited Certification Bodies (BSI, TÜV, BV, DNV, NQA, Schellman, etc.) under national accreditation (UKAS, ANAB, DAkkS).
2. **What it certifies:** An ORGANIZATION's management system for information security — not the product. Covers governance, risk, controls operation, continual improvement. Annex A is now 93 controls in 4 themes (Organizational, People, Physical, Technological) — down from 114 in 2013, with 11 new controls (threat intelligence, cloud services, ICT readiness for BC, physical security monitoring, configuration management, info deletion, data masking, DLP, monitoring activities, web filtering, secure coding).
3. **Eligibility for nous:** **YES** — well-fitted, and likely the single most strategic cert for a tiny vendor selling internationally. The certification covers Joey's *operation* of kastil-systems / acmedevUS / joeycastilloUS as a security-engineering shop. Sole-founder orgs absolutely can certify (scope statement just names "the design, development, and operation of nous trust substrate at acmedevUS"). The 2013→2022 transition is **mandatory**: 2013 certificates expired 2025-10-31; all new certs are 2022.
4. **Self-attestation vs third-party audit:** **Third-party audit ONLY.** No self-attestation pathway. Must use an accredited CB.
5. **Cost (USD):**
   - Gap analysis: ~$5,700 (<250 employees)
   - Stage 1 + Stage 2 audit (small co): $14,000–$16,000 combined; budget $15,000 as a typical package number
   - Internal audit (annual): $5,000–$15,000
   - First-year all-in for a 10-person SaaS: **$15,000–$60,000** (audit + gap + consultant + pentest)
6. **Calendar time:** 3-6 months focused effort (small org); 12-18 months realistic if starting from zero. **3-year certificate cycle**: surveillance audits years 1 & 2 (~half the cost of initial), full recertification year 3.
7. **Process steps:** Gap analysis → ISMS scoping → risk assessment + treatment plan → policy/SoA build → control implementation → internal audit + management review → Stage 1 audit (documentation review) → remediation → Stage 2 audit (effectiveness review) → certificate issuance.
8. **Strategic value:** GLOBAL passport. Required/expected in EU, UK, APAC for any enterprise sale. Pairs with SOC 2 to form the "trust trifecta" foundation. ISO 27001 is what European GDPR auditors and APAC enterprises ASK for first.
9. **Sources:** [ISMS.online cost breakdown](https://www.isms.online/iso-27001/audits/cost-breakdown/) · [Secureframe](https://secureframe.com/hub/iso-27001/certification-cost) · [StrongDM 2026 cost](https://www.strongdm.com/blog/iso-27001-certification-cost) · [Drata cost guide](https://drata.com/grc-central/iso-27001/certification-cost)

## 1.2 ISO/IEC 27002:2022 — Controls Catalog

1. **Name + issuer:** ISO/IEC 27002:2022 — Information security controls (code of practice). ISO/IEC.
2. **What it certifies:** **Nothing.** 27002 is the *implementation guidance* for the controls listed in 27001 Annex A. You don't certify TO 27002; you USE it to implement 27001's Annex A.
3. **Eligibility for nous:** **N/A as a certification.** Reference document — required reading for the 27001 effort.
4. **Self-attestation vs third-party audit:** Neither — guidance document.
5. **Cost:** ~CHF 198 to buy the PDF from ISO.
6. **Calendar time:** N/A.
7. **Process steps:** Read it. Apply it.
8. **Strategic value:** Foundational reference; mandatory companion when pursuing 27001.
9. **Sources:** ISO catalog.

## 1.3 ISO/IEC 27017:2015 — Cloud-Specific Controls

1. **Name + issuer:** ISO/IEC 27017 — Code of practice for information security controls based on ISO/IEC 27002 for cloud services. ISO/IEC.
2. **What it certifies:** Extends 27002 with cloud-specific guidance. Applies 37 existing 27002 controls to cloud contexts + adds 7 cloud-only controls (CLD.6.3.1 shared roles, CLD.8.1.5 customer asset removal, CLD.9.5.x segregation/virtualization, CLD.12.x admin ops/monitoring, CLD.13.1.4 networking alignment).
3. **Eligibility for nous:** **Conditional YES** — nous itself is an on-prem / endpoint substrate, NOT a cloud service, so 27017 doesn't directly apply to the product. BUT if Joey ever runs a hosted control plane, escrow service, or mesh discovery service ("nous-cloud"), this is the standard for that surface. Also a check-the-box for procurement teams who insist on it regardless of the product shape.
4. **Self-attestation vs third-party audit:** Not a standalone certification — Annex statement appended to ISO 27001 certificate by the same CB.
5. **Cost:** Adds ~10-25% to ISO 27001 audit cost (scope-dependent). Maybe $3,000-$8,000 incremental.
6. **Calendar time:** Coincident with 27001 audit cycle.
7. **Process steps:** Implement the additional cloud controls → declare in SoA → CB tests during the 27001 audit → certificate annex states conformance.
8. **Strategic value:** Cloud-procurement table stakes when the product touches a hosted surface. Skippable until nous has a cloud component.
9. **Sources:** [ISO 27017 standard page](https://www.iso.org/standard/43757.html) · [Aikido 27017/27018 explainer](https://www.aikido.dev/learn/compliance/compliance-frameworks/iso-27017-27018) · [ISMS.online 27017](https://www.isms.online/iso-27017/)

## 1.4 ISO/IEC 27018:2019 — PII in Public Cloud

1. **Name + issuer:** ISO/IEC 27018 — Code of practice for protection of personally identifiable information (PII) in public clouds acting as PII processors. ISO/IEC.
2. **What it certifies:** A public-cloud processor's handling of PII against ~25 additional controls beyond 27001/27002. GDPR-aligned.
3. **Eligibility for nous:** **NO direct fit.** nous is identity substrate — it issues machine identities, not PII processing. Could become relevant if a customer feature stores end-user PII. Skip for now.
4. **Self-attestation vs third-party audit:** Same as 27017 — Annex on the 27001 certificate.
5. **Cost:** ~$3,000-$8,000 incremental to 27001.
6. **Calendar time:** Coincident with 27001 cycle.
7. **Process steps:** Same flow as 27017.
8. **Strategic value:** GDPR-region procurement signal. Defer until nous touches PII.
9. **Sources:** [Aikido 27017/27018](https://www.aikido.dev/learn/compliance/compliance-frameworks/iso-27017-27018) · [Certiget guide](https://certiget.eu/en/guides/cloud-data-security-the-role-of-iso-27017-and-iso-27018-standards)

## 1.5 ISO/IEC 27040:2024 — Storage Security

1. **Name + issuer:** ISO/IEC 27040 — Storage security techniques. ISO/IEC.
2. **What it certifies:** Guidance standard covering media handling, encryption at rest, secure deletion, sanitization, evidence logging.
3. **Eligibility for nous:** **Reference only.** Useful when nous mediates secrets stored at rest (vault repos, sealed IDS). Not a typical certification target for a tiny vendor.
4. **Self-attestation vs third-party audit:** Guidance — not certifiable on its own. Audited via 27001 SoA inclusion.
5. **Cost:** Marginal to 27001.
6. **Calendar time:** Within 27001 cycle.
7. **Process steps:** Implement in SoA → audit.
8. **Strategic value:** Niche. Cite in design docs to show due diligence on storage primitives.
9. **Sources:** [ISMS.online 27040](https://www.isms.online/iso-27040/)

## 1.6 ISO/IEC 27701:2025 — Privacy Information Management System (PIMS)

1. **Name + issuer:** ISO/IEC 27701:2025 — Privacy information management systems — Requirements and guidance. ISO/IEC.
2. **What it certifies:** A Privacy Information Management System (PIMS). **Major 2025 change:** 27701 is now a STANDALONE standard — no longer requires 27001 as a prerequisite. PII controllers AND processors can certify.
3. **Eligibility for nous:** **Conditional YES** if nous processes PII (probably not at the substrate level; potentially yes for an operator console that holds user accounts). Strong signal in EU/UK markets.
4. **Self-attestation vs third-party audit:** Third-party. Same accredited-CB model as 27001.
5. **Cost:** $10,000-$30,000 incremental to 27001 — or standalone now post-2025 standardization.
6. **Calendar time:** 4-9 months.
7. **Process steps:** Standard ISMS lifecycle scoped to privacy.
8. **Strategic value:** GDPR/DPDP/CCPA alignment. Defer until nous touches personal data.
9. **Sources:** [ISO 27701:2025](https://www.iso.org/standard/27701) · [Glocert PIMS guide](https://www.glocertinternational.com/resources/guides/what-is-iso-27701/) · [Wikipedia ISO/IEC 27701](https://en.wikipedia.org/wiki/ISO/IEC_27701)

## 1.7 ISO/IEC 19790:2012 + ISO/IEC 24759:2017 — Cryptographic Module Requirements (= FIPS 140-3 substrate)

1. **Name + issuer:** ISO/IEC 19790:2012 *Security requirements for cryptographic modules* and ISO/IEC 24759:2017 *Test requirements*. ISO/IEC.
2. **What it certifies:** A cryptographic module's design and testing. FIPS 140-3 is **literally a wrapper around 19790 + 24759** — the U.S. CMVP validates against ISO 19790 with U.S.-allowed annex modifications. Certifying against 19790 = certifying against FIPS 140-3 substantively.
3. **Eligibility for nous:** **YES — this is THE certification for `libsecurity.a`.** Per Joey's quadrant MS-1 (government certs) this also lives there as FIPS 140-3 Level 1 (software-only module). Industry-side, ISO 19790 acts as the international-recognition complement: countries that don't accept FIPS but DO accept ISO 19790 (much of EU, parts of APAC) need the ISO label. CMVP validations are increasingly cross-recognized via the SOG-IS MRA and the CCRA.
4. **Self-attestation vs third-party audit:** Third-party only — NVLAP-accredited cryptographic-testing lab (atsec, Acumen, Lightship, CGI, etc.).
5. **Cost (USD):** Lab fees $80,000-$300,000+ for Level 1 software module; NIST CMVP cost-recovery review fees ($5k-$25k); $200,000+ all-in is typical. Algorithmic Validation (CAVP) is a prerequisite and runs $5k-$15k per algorithm family.
6. **Calendar time:** **12-24 months** end-to-end; CMVP review queue alone has historically been 12+ months. Modules valid 5 years from validation date (2 years for Interim Validations).
7. **Process steps:** Algorithm implementations → CAVP testing → security policy authoring → lab gap analysis → formal lab test → submission to CMVP → CMVP review + Q&A loop → validation certificate issued → listed on CMVP active modules.
8. **Strategic value:** **MASSIVE** — for any product whose value proposition IS cryptography, FIPS 140-3 / ISO 19790 is the recognized seal of "the math is real and a lab proved it." Required for U.S. federal, Canadian federal, financial regulators in 30+ countries, healthcare in some jurisdictions. Without it, you're talking; with it, you're shipping.
9. **Sources:** [NIST CMVP](https://csrc.nist.gov/projects/cryptographic-module-validation-program) · [FIPS 140-3 references](https://csrc.nist.gov/projects/cryptographic-module-validation-program/fips-140-3-standards) · [Wikipedia FIPS 140](https://en.wikipedia.org/wiki/FIPS_140) · [Chainguard FIPS 140-3 guide](https://www.chainguard.dev/supply-chain-security-101/fips-140-3-everything-you-need-to-know)

FIPS 140-3 levels (since this maps 1:1 to ISO 19790):
- **L1**: at-least-one FIPS-approved algorithm, no physical security. SOFTWARE MODULES are L1. <— nous's target.
- **L2**: tamper-evident seals/coatings, role-based auth.
- **L3**: identity-based auth, EFP (environmental failure protection), physical tamper response.
- **L4**: complete envelope, EFP + fault-injection protection, ruggedized container.

## 1.8 ISO/IEC 15408 (Common Criteria) + ISO/IEC 18045 (CEM)

1. **Name + issuer:** ISO/IEC 15408 — Evaluation criteria for IT security (Common Criteria). ISO/IEC 18045 — Common Evaluation Methodology (CEM). ISO/IEC + the Common Criteria Recognition Arrangement (CCRA) member nations.
2. **What it certifies:** A PRODUCT (the Target of Evaluation, ToE), evaluated against a Protection Profile (PP) or custom Security Target (ST), to an Evaluation Assurance Level (EAL1-EAL7) or equivalent CC2022 Assurance Package.
3. **Eligibility for nous:** **YES, BUT EXPENSIVE.** Common Criteria is *the* international product-security cert. nous's libsecurity.a + handshake / mesh substrate maps naturally to a "Key Management Module" or "Trusted Channel" Protection Profile. Realistic target: **EAL2 or EAL2+** (commercial-grade independently tested). EAL4+ is the typical commercial ceiling; military targets EAL5-7.
4. **Self-attestation vs third-party audit:** Third-party only — accredited Common Criteria Testing Laboratory (CCTL). U.S. scheme = NIAP; UK = CESG; Germany = BSI; etc.
5. **Cost (USD):** EAL2: ~$100k-$250k. EAL4+: hundreds of thousands; for moderately complex products easily $300k-$500k+. For a tiny product, lower end achievable.
6. **Calendar time:** EAL2: 6-12 months. EAL4+: 8-18 months. Some labs report 4 months for EAL4+ on well-prepared products.
7. **Process steps:** Choose PP or write ST → lab kick-off → ALC (lifecycle) + AGD (guidance) + ADV (design) evidence prep → ATE (testing) → AVA (vulnerability analysis) → certificate report → scheme certifies → CCRA mutual recognition (up to EAL2 / cPP-only for full mutual recognition since 2014 CCRA reform).
8. **Strategic value:** International product-level seal. Required for many national-security and defense procurements outside the U.S. (where FIPS dominates). Pairs naturally with FIPS 140-3 for nous — FIPS for the crypto module, CC for the trust-substrate product around it.
9. **Sources:** [ISO 15408-1:2022](https://www.iso.org/standard/72891.html) · [Wikipedia Common Criteria](https://en.wikipedia.org/wiki/Common_Criteria) · [Konfirmity 15408 glossary](https://www.konfirmity.com/glossary/iso-15408) · [Nemko CC guide](https://www.nemko.com/blog/implementing-the-common-criteria-for-cyber-security-evaluation-of-it-products-gl)

## 1.9 ISO 22301:2019 — Business Continuity Management Systems

1. **Name + issuer:** ISO 22301 — Security and resilience — Business continuity management systems. ISO.
2. **What it certifies:** A BCMS — the org's ability to plan for, respond to, and recover from disruptive incidents.
3. **Eligibility for nous:** **Optional** — nice signal for enterprise customers who care about vendor resilience. Probably overkill for a solo-founder substrate vendor until revenue grows.
4. **Self-attestation vs third-party audit:** Third-party.
5. **Cost (USD):** $8,000-$30,000 for SMEs (audit $10k-$30k + implementation effort).
6. **Calendar time:** 3-12 months (3-6 if existing continuity practices, 6-12 from scratch). 3-year cert cycle with surveillance audits.
7. **Process steps:** Business impact analysis → continuity strategy → plan documentation → exercise/test → internal audit → Stage 1 → Stage 2 → certificate.
8. **Strategic value:** Useful add-on for ISO 27001 multi-cert package. Not a deal-maker on its own.
9. **Sources:** [ISO 22301](https://www.iso.org/standard/75106.html) · [NovelVista 22301 cost 2026](https://www.novelvista.com/blogs/quality-management/iso-22301-certification-cost) · [Glocert guide](https://www.glocertinternational.com/resources/guides/what-is-iso-22301/)

## 1.10 ISO 31000:2018 — Risk Management

1. **Name + issuer:** ISO 31000 — Risk management — Guidelines. ISO.
2. **What it certifies:** **Nothing.** Guidance standard — not intended for certification.
3. **Eligibility for nous:** Reference only. Cite in risk methodology.
4. **Self-attestation vs third-party audit:** N/A (individuals can get PECB/G31000 personal certs).
5. **Cost:** PDF purchase only.
6. **Calendar time:** N/A.
7. **Process steps:** Use as reference for your risk-management framework.
8. **Strategic value:** Adopted as national standard in 82 countries. Cite for credibility; don't try to "certify" the org against it.
9. **Sources:** [Wikipedia ISO 31000](https://en.wikipedia.org/wiki/ISO_31000) · [PECB 31000](https://pecb.com/en/whitepaper/iso-31000-risk-management-principles-and-guidelines)

---

# 2. AICPA / AUDIT FRAMEWORKS

## 2.1 SOC 1 Type I & Type II (AICPA SSAE 18 / ISAE 3402)

1. **Name + issuer:** Service Organization Controls 1 — Report on Controls at a Service Organization Relevant to User Entities' Internal Control over Financial Reporting. AICPA, performed by licensed CPA firms.
2. **What it certifies:** Internal Controls over Financial Reporting (ICFR) at a service organization that processes financial transactions on customers' behalf.
3. **Eligibility for nous:** **NO.** nous doesn't process financial data. SOC 1 is the wrong tool.
4. **Self-attestation vs third-party audit:** Third-party (licensed CPA firm).
5. **Cost:** $15k-$100k typical.
6. **Calendar time:** Type I: 3-6 months. Type II: 6+ months observation window.
7. **Process steps:** Scope → control design → Type I audit (design at a point in time) → operate controls 3-12 months → Type II audit (operating effectiveness).
8. **Strategic value:** Required only if you handle customer financial-reporting controls. Skip for nous.
9. **Sources:** [RSI AICPA audits explainer](https://blog.rsisecurity.com/understanding-aicpa-audits/)

## 2.2 SOC 2 Type I & Type II — Trust Service Criteria

1. **Name + issuer:** SOC 2 — Report on Controls at a Service Organization Relevant to Security, Availability, Processing Integrity, Confidentiality, and Privacy. AICPA Trust Services Criteria (TSC); CPA firm audit.
2. **What it certifies:** A service organization's controls against the five TSC (Security is mandatory; the other four are scope-elective). Restricted-distribution report (NDA).
3. **Eligibility for nous:** **YES — absolute table stakes for U.S. enterprise sales.** Even though nous is a substrate (not a pure SaaS), customers will treat the company shipping it as a "service organization" for vendor due diligence. Scope around Joey's operations + any hosted services. Security TSC only (start there); add Availability / Confidentiality once needed.
4. **Self-attestation vs third-party audit:** Third-party — must be a licensed CPA firm. SOC 2 reports are NDA-protected; SOC 3 (below) is the public-facing variant.
5. **Cost (USD):**
   - Type I: $10,000-$25,000 audit + $5,000-$15,000 readiness
   - Type II: $12,000-$30,000 audit + readiness + $8k-$30k/yr automation tooling (Vanta, Drata, Secureframe, Sprinto)
   - **Typical startup all-in Year 1: $20,000-$45,000.** Some sources cite $10k-$430k range across the spectrum (180-firm survey).
6. **Calendar time:** Type I: 3-8 months. Type II: 6-20 months (3-month observation minimum, often 6-12). Realistic: **~9 months zero-to-Type II.** Annual report thereafter.
7. **Process steps:** Gap assessment (2-3 wks) → policy creation (2-4 wks) → control implementation (4-8 wks) → observation period (12-16 wks) → audit (4-6 wks) → report.
8. **Strategic value:** **CRITICAL.** ~70-85% of enterprise RFPs ask for SOC 2; **98% of Fortune 500 procurement mandates SOC 2 Type II specifically.** Not having one actively kills U.S. B2B deals. THIS is the first-move cert.
9. **Sources:** [A-LIGN SOC 2 guide](https://www.a-lign.com/articles/what-is-soc-2-complete-guide) · [Thoropass cost guide](https://www.thoropass.com/blog/soc-2-audit-cost-a-guide) · [DSALTA Type 1 vs 2](https://www.dsalta.com/resources/soc-2/soc-2-type-1-vs-type-2-timeline-cost-guide) · [SOC 2 Auditors 2026 cost](https://soc2auditors.org/soc-2-audit-cost/) · [Koop Fortune 500 SOC 2](https://www.koop.ai/blog/fortune-500-soc-2-compliance)

## 2.3 SOC 3 — Public-Facing Version of SOC 2

1. **Name + issuer:** SOC 3 — General Use Report. AICPA / CPA firm.
2. **What it certifies:** Same TSC as SOC 2, but the report is sanitized and freely distributable. Type II only — no SOC 3 Type I.
3. **Eligibility for nous:** **YES — cheap add-on once SOC 2 is done.** Lets nous put a "SOC 3" badge on the public site without exposing internal control details.
4. **Self-attestation vs third-party audit:** Third-party — issued together with or after the SOC 2 report by the same CPA firm.
5. **Cost:** Minimal incremental cost ($2k-$8k) when bundled with SOC 2.
6. **Calendar time:** Same as SOC 2.
7. **Process steps:** Complete SOC 2 → request SOC 3 generation from the same auditor → public posting.
8. **Strategic value:** Marketing artifact. Posted on landing page. Drives top-of-funnel trust.
9. **Sources:** [Drata SOC 3](https://drata.com/learn/soc-2/vs-soc-3) · [Brightdefense SOC 1/2/3](https://www.brightdefense.com/resources/soc-1-vs-soc-2-vs-soc-3/)

## 2.4 SOC for Cybersecurity

1. **Name + issuer:** AICPA SOC for Cybersecurity — Description Criteria + Trust Services Criteria. CPA firm.
2. **What it certifies:** An ENTIRE entity's cybersecurity risk management program — not just one service. Broader scope than SOC 2; entity-wide.
3. **Eligibility for nous:** **Possible BUT not currently in demand.** SOC for Cybersecurity hasn't achieved the same market pull as SOC 2 — most enterprises still ask for SOC 2 specifically.
4. **Self-attestation vs third-party audit:** Third-party CPA firm.
5. **Cost:** Comparable to SOC 2 range; $25k-$100k+.
6. **Calendar time:** 6-12 months.
7. **Process steps:** Similar to SOC 2 but broader scope including governance, risk management framework.
8. **Strategic value:** Niche. SOC 2 wins the procurement battle. Skip unless a specific customer asks for it by name.
9. **Sources:** AICPA SOC for Cybersecurity (https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/aicpacybersecurityinitiative.html — well-known canonical page)

## 2.5 HITRUST CSF — i1 & r2 Assessments

1. **Name + issuer:** HITRUST CSF — Health Information Trust Alliance Common Security Framework. Privately governed; certifications issued via HITRUST-authorized External Assessor firms.
2. **What it certifies:** An entity's information security program against the HITRUST CSF — a harmonized control framework that includes HIPAA, NIST, ISO 27001, PCI, GDPR, and more. Three assessment tiers: **e1** (essential — 44 controls), **i1** (intermediate — 182 controls), **r2** (risk-based — 250-1500+ controls tailored to scope).
3. **Eligibility for nous:** **Conditional — only if pursuing healthcare market.** HITRUST is THE gold standard for U.S. healthcare vendor trust. If nous targets hospitals, EHRs, telehealth, payers, HITRUST is the door. Otherwise overkill.
4. **Self-attestation vs third-party audit:** Third-party (HITRUST External Assessor). The MyCSF SaaS tool is required.
5. **Cost (USD):**
   - **i1:** $70,000-$120,000 all-in. Report credit ~$7k + assessor fees + MyCSF subscription ($18,100/yr typical).
   - **r2:** $100,000-$1,000,000+; small orgs ~$150k, large healthcare $500k+. Report credit up to ~$9k.
6. **Calendar time:** **i1:** 6-9 months; certificate valid 1 year. **r2:** 12-15 months; certificate valid 2 years (interim assessment at 1 year).
7. **Process steps:** Scope → MyCSF subscription → readiness assessment → policy/control work → validated assessment by External Assessor → HITRUST QA review → certificate.
8. **Strategic value:** **Critical for healthcare vertical; overkill for everyone else.** If nous chases the EHR / payer / pharma supply-chain market, HITRUST is mandatory.
9. **Sources:** [Sprinto HITRUST cost 2026](https://sprinto.com/blog/hitrust-certification-cost/) · [HITRUST official pricing](https://hitrustalliance.net/blog/how-much-does-hitrust-cost) · [Accorian HITRUST cost](https://www.accorian.com/what-is-the-cost-of-hitrust-certification/) · [ComplyJet 2026 HITRUST](https://www.complyjet.com/blog/hitrust-certification)

## 2.6 CSA STAR — Cloud Security Alliance Security Trust Assurance & Risk

1. **Name + issuer:** CSA STAR Program. Cloud Security Alliance (industry consortium). Built on the Cloud Controls Matrix (CCM) + Consensus Assessments Initiative Questionnaire (CAIQ).
2. **What it certifies:** A Cloud Service Provider's posture, across three levels:
   - **Level 1 — Self-Assessment:** CAIQ submitted to public registry. FREE submission; internal-time only.
   - **Level 2 — Third-Party Audit:** ISO 27001-aligned or SOC 2-aligned assessment by a CSA-accredited body.
   - **Level 3 — Continuous Auditing:** real-time monitoring + continuous certification (still emerging; few orgs at L3).
3. **Eligibility for nous:** **Conditional YES** if/when nous has a cloud service. Level 1 is FREE and high-signal — submit a CAIQ whether or not you have a cloud product, as a transparency artifact.
4. **Self-attestation vs third-party audit:** L1 self-assessment; L2/L3 third-party.
5. **Cost:**
   - L1: $0 (CAIQ submission)
   - L2: typically piggybacks on ISO 27001 audit; incremental $3k-$15k. (Audit-only $3k-$5k for small employee counts per some sources.)
   - L3: emerging; case-by-case.
6. **Calendar time:** L1: hours-days. L2: coincident with ISO 27001 cycle (3-6 months added prep).
7. **Process steps:** Complete CAIQ → submit to STAR registry → for L2: engage CSA-accredited CB → undergo audit → registry entry upgraded to L2.
8. **Strategic value:** Free credibility for any cloud-adjacent product. L2 piggybacking on ISO 27001 is one of the cheapest "trust trifecta" upgrades available.
9. **Sources:** [CSA STAR official](https://cloudsecurityalliance.org/star) · [Hyperproof CSA STAR](https://hyperproof.io/csa-star/) · [Atlant L1 vs L2](https://atlantsecurity.com/blog/csa-star-level-1-vs-level-2-key-differences) · [Linford STAR guide](https://linfordco.com/blog/csa-star-program-guide/)

---

# 3. INDUSTRY-SPECIFIC

## 3.1 PCI DSS v4.0 / v4.0.1

1. **Name + issuer:** Payment Card Industry Data Security Standard v4.0 (effective March 2024; v4.0.1 update). PCI Security Standards Council (Visa, Mastercard, Amex, Discover, JCB).
2. **What it certifies:** Any entity that stores, processes, or transmits cardholder data (CHD) or sensitive authentication data (SAD).
3. **Eligibility for nous:** **NO direct fit.** nous doesn't touch CHD. Would only apply if a deployment of nous gets pulled into a customer's PCI scope as a connected system — and then it's the customer's audit, not nous's.
4. **Self-attestation vs third-party audit:**
   - Merchant L1 (>6M txns/yr) — QSA on-site audit (ROC).
   - Merchant L2-L4 — Self-Assessment Questionnaire (SAQ) types (A, A-EP, B, C, C-VT, D, P2PE).
   - Service Providers L1 (>300k txns) — QSA audit; L2 — SAQ-D-SP.
5. **Cost (USD):** L1 QSA $50,000-$500,000+. L2-3 SAQ + ASV scans $5k-$50k. L4 simple $1k-$10k.
6. **Calendar time:** L1: 6-12 months initial; annual revalidation. SAQ: weeks-to-months.
7. **Process steps:** Scope (segment to minimize) → SAQ or ROC → ASV quarterly scans → penetration test → submit Attestation of Compliance (AoC).
8. **Strategic value:** Payments-vertical mandatory; irrelevant outside.
9. **Sources:** [PCI SSC merchants](https://www.pcisecuritystandards.org/merchants/) · [SecureTrust PCI DSS](https://www.securetrust.com/blog/pci-dss-compliance) · [Strictly v4.0.1 checklist](https://strictlyzero.com/announcements/payments-announcements/pci-compliance-checklist-2026-the-merchants-guide-to-dss-4-0-1/)

## 3.2 PCI 3DS, PCI P2PE, PCI PIN, PCI Card Production

1. **Name + issuer:** PCI Security Standards Council ecosystem.
2. **What it certifies:**
   - **PCI 3DS Core Security Standard** — entities providing 3DS Server (3DSS), Directory Server (DS), or Access Control Server (ACS) functions.
   - **PCI P2PE** — encryption from point-of-interaction device through to a solution provider's secure decryption environment. Two roles: P2PE Solution Provider, P2PE Component Provider.
   - **PCI PIN Security** — secure management/processing/transmission of PIN data at ATMs and POS.
   - **PCI Card Production** — physical and logical security for payment card manufacturing.
3. **Eligibility for nous:** **NO.** All specialized to payment-card ecosystems.
4. **Self-attestation vs third-party audit:** Third-party (specialized QSA designations — 3DS Assessor, P2PE Assessor, PIN Assessor, Card Production Assessor).
5. **Cost:** Tens to hundreds of thousands depending on scope.
6. **Calendar time:** 6-18 months per program.
7. **Process steps:** Engage specialized QSA → gap → remediation → on-site assessment → ROC → AoC.
8. **Strategic value:** Payment-vertical only. Skip for nous.
9. **Sources:** [PCI P2PE](https://www.pcisecuritystandards.org/assessors_and_solutions/point_to_point_encryption_solutions/) · [Schellman 3DS](https://www.schellman.com/services/pci-compliance/pci-3ds) · [Schellman P2PE](https://www.schellman.com/services/pci-compliance/pci-p2pe)

## 3.3 HIPAA + HITECH

1. **Name + issuer:** Health Insurance Portability and Accountability Act (1996) + Health Information Technology for Economic and Clinical Health Act (2009). Enforced by HHS Office for Civil Rights (OCR). U.S. regulatory, BUT the audit ecosystem around it is industry-driven.
2. **What it certifies:** **Nothing official.** HHS/OCR does NOT recognize private "HIPAA certifications." Vendors instead get third-party HIPAA attestations from CPA firms, HITRUST assessors, or specialized HIPAA assessors (Compliancy Group, etc.). Business Associate Agreement (BAA) is the legal hook for vendors handling PHI.
3. **Eligibility for nous:** **Conditional** — only if a customer puts nous in a PHI-handling path. Then a BAA + a third-party attestation (HITRUST is the industry-recognized substitute) is the play.
4. **Self-attestation vs third-party audit:** OCR audits ARE government; the industry-supplied attestations are third-party CPA / HITRUST / specialty firms.
5. **Cost:** Vendor attestation $10k-$50k; HITRUST (above) is the heavyweight equivalent.
6. **Calendar time:** 3-6 months.
7. **Process steps:** Risk analysis (required) → controls implementation → BAA execution with covered entities → optional third-party attestation.
8. **Strategic value:** Healthcare-vertical only. Use HITRUST CSF as the cert vehicle when scaling into healthcare.
9. **Sources:** [Atlas Systems HIPAA third-party](https://www.atlassystems.com/blog/hipaa-third-party-compliance-requirements) · [TrustCloud HIPAA 2026](https://www.trustcloud.ai/hipaa/hipaa-third-party-assessment/) · [CompliancePoint vendor HIPAA](https://www.compliancepoint.com/healthcare/is-my-vendor-really-hipaa-compliant/)

## 3.4 NIST CSF 2.0 (Cybersecurity Framework)

1. **Name + issuer:** NIST CSF 2.0 (Feb 26, 2024). National Institute of Standards and Technology. Voluntary.
2. **What it certifies:** **Nothing formal.** CSF is a self-rated framework — 6 Functions (Govern, Identify, Protect, Detect, Respond, Recover) × 22 Categories × 106 Subcategories. Four Implementation Tiers (Partial → Risk-Informed → Repeatable → Adaptive). Tiers are NOT a maturity ladder per CSF 2.0 — they're risk-tolerance choices.
3. **Eligibility for nous:** **YES — use it as the organizing scaffold for every other cert.** Mapping nous's controls into CSF 2.0 categories produces a single coherent narrative that crosses ISO 27001, SOC 2, and government frameworks.
4. **Self-attestation vs third-party audit:** Primarily self-assessment; third-party CSF assessments are emerging from firms like Pivot Point Security and the FAIR Institute.
5. **Cost:** Self-assessment FREE; third-party assessment $10k-$50k.
6. **Calendar time:** Self-assessment: weeks. Third-party: 2-4 months.
7. **Process steps:** Build Current Profile → define Target Profile → gap analysis → prioritized action plan → repeat annually.
8. **Strategic value:** Universal common language. Self-assess as a planning artifact; don't bother with third-party assessment unless a specific customer asks.
9. **Sources:** [NIST CSF 2.0 PDF](https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.29.pdf) · [CSF Tools](https://csf.tools/reference/nist-cybersecurity-framework/v2-0/) · [NIST Quick Start Guides](https://www.nist.gov/cyberframework/quick-start-guides)

## 3.5 NIST 800-171 + CMMC 2.0 (defense contractor)

1. **Name + issuer:** NIST SP 800-171 — Protecting Controlled Unclassified Information (CUI) in Nonfederal Systems. CMMC 2.0 = DoD's certification overlay on top. DFARS 252.204-7012 is the contract clause that mandates 800-171; 252.204-7020/-7021 mandate CMMC.
2. **What it certifies:** 110 security controls across 14 families for any entity handling CUI for the DoD. CMMC adds three Levels (L1 self-attestation / L2 third-party C3PAO / L3 government assessment).
3. **Eligibility for nous:** **YES — strategic if defense customers are in scope.** A pure-C trust mesh fits naturally into DoD supply chains hungry for sovereign, no-vendor-lock-in tech.
4. **Self-attestation vs third-party audit:** 800-171 self-attestation via SPRS score; CMMC L1 self-attest, L2 C3PAO audit, L3 DIBCAC.
5. **Cost (USD):** Small contractor gap assessment $3,500-$20,000. **CMMC L2 certification: $75,000-$300,000+** for 2026 small businesses (avg $138,000).
6. **Calendar time:** 1-12 weeks for DFARS 7012 policy; 1+ year for full CMMC L2 conformance.
7. **Process steps:** SSP + POA&M → SPRS score → CMMC L2 readiness → C3PAO assessment → certification.
8. **Strategic value:** Door-opener for DoD primes. Defer until first defense pipeline opens; then move fast.
9. **Sources:** [DFARS 252.204-7012](https://www.acquisition.gov/dfars/252.204-7012-safeguarding-covered-defense-information-and-cyber-incident-reporting.) · [IBSS NIST 800-171 cost 2026](https://ibsscorp.com/nist-sp-800-171-assessment-cost-what-defense-contractors-pay-in-2026/) · [CyberSheath DFARS impact](https://cybersheath.com/resources/blog/understanding-the-impact-of-dfars-252-204-7012-nist-sp-800-171-and-cmmc-on-defense-contractors/)

## 3.6 NIST SP 800-53 Rev 5

1. **Name + issuer:** NIST SP 800-53 Rev 5 — Security and Privacy Controls for Information Systems and Organizations. NIST.
2. **What it certifies:** **Nothing on its own.** It's the control catalog (1,000+ controls in 20 families) referenced by FedRAMP, FISMA, and many private frameworks. Baselines defined in 800-53B: Low (149), Moderate (287), High (370 controls).
3. **Eligibility for nous:** **Reference catalog** — map nous controls to 800-53 as preparation for any U.S.-government-adjacent work. Not certified TO; certified VIA FedRAMP (separate quadrant — government).
4. **Self-attestation vs third-party audit:** Via overlying programs (FedRAMP, FISMA, CMMC).
5. **Cost:** Catalog itself is free (NIST publication).
6. **Calendar time:** N/A for the catalog.
7. **Process steps:** Categorize system → select baseline → tailor → implement → assess → authorize → monitor.
8. **Strategic value:** **Universal control-language foundation.** Map once, use everywhere.
9. **Sources:** [NIST SP 800-53 Rev 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final) · [NIST SP 800-53B baselines](https://csrc.nist.gov/pubs/sp/800/53/b/upd1/final) · [SecurityScientist baselines](https://www.securityscientist.net/blog/nist-800-53-baselines-explained/)

## 3.7 CIS Controls v8.1 — Implementation Groups IG1, IG2, IG3

1. **Name + issuer:** Center for Internet Security (CIS). Industry-consensus framework. v8.1 has 18 Controls + 153 Safeguards.
2. **What it certifies:** Self-assessed maturity by Implementation Group:
   - **IG1** (Essential cyber hygiene) — 56 safeguards. Small orgs.
   - **IG2** — IG1 + 74 safeguards (130 total). Mid-size with sensitive data.
   - **IG3** — IG2 + 23 safeguards (153 total). High-stakes orgs.
3. **Eligibility for nous:** **YES as a self-assessment scaffold.** Map to IG2 as the realistic target for a security-product vendor.
4. **Self-attestation vs third-party audit:** Self-assessment via CIS CSAT (Controls Self-Assessment Tool); third-party assessment available but not required.
5. **Cost:** Free (CSAT Pro is paid; basic CSAT is free).
6. **Calendar time:** Weeks for assessment.
7. **Process steps:** Run CSAT → score → prioritize remediation → re-assess.
8. **Strategic value:** Quick-win self-assessment publishable as a trust artifact. Pairs naturally with NIST CSF mapping.
9. **Sources:** [CIS Controls Implementation Groups](https://www.cisecurity.org/controls/implementation-groups) · [CIS IG Guide v8.1](https://www.cisecurity.org/insights/white-papers/guide-implementation-groups-ig-cis-critical-security-controls-v8-1)

## 3.8 COBIT 2019

1. **Name + issuer:** Control Objectives for Information and Related Technologies 2019. ISACA.
2. **What it certifies:** Personal certificates (Foundation, Design & Implementation, Assessor) — NOT an organizational certification. 40 governance/management objectives.
3. **Eligibility for nous:** **Reference framework only.** Personal certs ($175 Foundation exam + $135-185 ISACA membership) are useful for Joey or contractors but don't certify the company.
4. **Self-attestation vs third-party audit:** N/A organizationally.
5. **Cost:** Foundation $175; advanced $400-$800/exam.
6. **Calendar time:** Self-study weeks.
7. **Process steps:** Study → exam.
8. **Strategic value:** Personal-credential signal; weak organizational signal.
9. **Sources:** [ISACA COBIT](https://www.isaca.org/resources/cobit) · [COBIT Foundation](https://www.isaca.org/credentialing/cobit-foundation)

## 3.9 BSI IT-Grundschutz (Germany)

1. **Name + issuer:** Bundesamt für Sicherheit in der Informationstechnik (BSI), Germany. National framework with international relevance.
2. **What it certifies:** Three levels — Basic, Standard, Core protection. The Standard certification is "ISO 27001 on the basis of IT-Grundschutz," accepted as ISO 27001 + extensive German-spec extensions. 100+ Compendium modules.
3. **Eligibility for nous:** **YES if pursuing German market** — particularly public sector / KRITIS (critical infrastructure). Strong differentiator for any EU sale.
4. **Self-attestation vs third-party audit:** Third-party (BSI-licensed auditor).
5. **Cost:** Not publicly disclosed; comparable-to-larger than ISO 27001. Implementation effort:
   - SMEs (10-50 ppl): 8-14 months build, 0.3-0.7 FTE operate
   - Mid (50-500): 14-24 months, 1-2 FTE operate
   - KRITIS: 18-36 months, 2-10 FTE
6. **Calendar time:** 3-12 months for cert audit after build.
7. **Process steps:** Adopt BSI standards (200-1/-2/-3) → use Compendium modules → audit by BSI-licensed auditor → certificate (3-year cycle).
8. **Strategic value:** German enterprise + public-sector key. Adds heavy weight to a "trust mesh" pitch in the EU.
9. **Sources:** [BSI IT-Grundschutz EN](https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/it-grundschutz_node.html) · [BSI ISO 27001 on IT-Grundschutz](https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Zertifizierung-und-Anerkennung/Zertifizierung-von-Managementsystemen/ISO-27001-Basis-IT-Grundschutz/iso-27001-basis-it-grundschutz.html) · [VistaInfoSec BSI](https://vistainfosec.com/compliance/germany/bsi-it-grundschutz/)

## 3.10 TISAX (Trusted Information Security Assessment Exchange)

1. **Name + issuer:** ENX Association (automotive industry). Built on VDA ISA questionnaire derived from ISO 27001.
2. **What it certifies:** Automotive supply-chain information security at three Assessment Levels:
   - **AL1** — self-assessment (no published label)
   - **AL2** — remote audit by accredited provider (most common)
   - **AL3** — on-site audit (highest)
3. **Eligibility for nous:** **YES if automotive OEM/Tier1 customers** appear. Required by VW, BMW, Daimler, etc. for any vendor touching sensitive automotive data.
4. **Self-attestation vs third-party audit:** AL1 self; AL2/AL3 third-party (ENX-accredited).
5. **Cost (USD):**
   - AL1: a few thousand (internal time + ENX registration)
   - AL2: $5,000-$10,000 audit only; €30k-€80k typical mid-market all-in including consulting
   - AL3: ~20% more than AL2
6. **Calendar time:** 6-12 months end-to-end.
7. **Process steps:** ENX registration → scope definition → VDA ISA self-assessment → external audit (remote AL2 / on-site AL3) → publish label on ENX portal (valid 3 years).
8. **Strategic value:** Automotive vertical exclusive. Pursue when first OEM pipeline opens.
9. **Sources:** [StrikeGraph TISAX levels](https://www.strikegraph.com/blog/everything-you-need-to-know-about-tisax-levels) · [Kopexa AL1/2/3](https://kopexa.com/en/catalog/tisax/assessment-levels) · [Secureframe TISAX](https://secureframe.com/blog/tisax)

## 3.11 IEC 62443 (Industrial Automation and Control Systems Security)

1. **Name + issuer:** International Electrotechnical Commission + ISA (International Society of Automation). Multi-part standard family. The product-level series (62443-4-1 secure development lifecycle + 62443-4-2 component security requirements) is increasingly mandatory for OT vendors.
2. **What it certifies:** Both organizations (62443-4-1 SDLC) and PRODUCTS (62443-4-2 component certifications) for industrial control systems. Security Levels (SL) 1-4 mirror increasing capability against threat severity. Accredited labs include exida (under ANSI ISO 17065/17025), TÜV, Bureau Veritas.
3. **Eligibility for nous:** **YES — STRONG FIT.** OT/ICS vendors badly need identity + zero-trust primitives. nous as a "Component Security" credential could directly enable industrial integrations (utility SCADA, building automation, manufacturing). 62443-4-1 (SDLC) is also achievable as a process certification for kastil-systems.
4. **Self-attestation vs third-party audit:** Third-party (accredited cert body like exida).
5. **Cost:** Not publicly disclosed; comparable to Common Criteria. Realistically $50k-$250k for product cert + $30k-$100k for SDLC cert.
6. **Calendar time:** 6-18 months.
7. **Process steps:** Choose target (process 4-1 or product 4-2) → engage cert body → gap → development-process or product-test → certification report → public listing.
8. **Strategic value:** **The OT/critical-infrastructure ticket.** EU's NIS2 + CRA + U.S. CISA all leaning hard on 62443 as the OT baseline. Pairs with ISO 27001 nicely.
9. **Sources:** [ISA/IEC 62443 program](https://www.isa.org/certification/certificate-programs/isa-iec-62443-cybersecurity-certificate-program) · [ISA 62443 standards](https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards) · [exida IEC 62443 cert](https://www.exida.com/Certification/IEC62443-Cyber-Cert)

## 3.12 CENELEC TS 50701 (Railway Cybersecurity)

1. **Name + issuer:** CENELEC TC9X WG26 (European railway). Published June 2021. Derived from IEC 62443.
2. **What it certifies:** Railway-system cybersecurity (rolling stock, signaling, command/control).
3. **Eligibility for nous:** **Niche YES** if railway customers appear. nous would be a "trust component" of a TS 50701-compliant subsystem; full TS 50701 certification is at the system integrator level.
4. **Self-attestation vs third-party audit:** Third-party (e.g., TÜV Rheinland, DEKRA).
5. **Cost:** Six figures typical at the system level.
6. **Calendar time:** 12-24 months.
7. **Process steps:** Risk assessment per TS 50701 → security controls per 62443 → integration testing → independent assessment.
8. **Strategic value:** Rail-vertical only. Defer.
9. **Sources:** [RazorSecure TS 50701](https://www.razorsecure.com/post/rail-cybersecurity-ts50701) · [Shieldworkz deep dive](https://shieldworkz.com/blogs/a-deep-dive-into-cenelec-ts-50701-for-railway-cybersecurity)

## 3.13 IEC 81001-5-1 (Medical Device Software Security)

1. **Name + issuer:** International Electrotechnical Commission (2021). Adaptation of IEC 62443-4-1 for healthcare software.
2. **What it certifies:** Medical-device-software SDLC security. Complements IEC 62304. Increasingly cited by FDA premarket cybersecurity guidance.
3. **Eligibility for nous:** **Conditional** — if nous embeds inside medical-device firmware. Otherwise, the device OEM holds the cert.
4. **Self-attestation vs third-party audit:** Third-party (notified body / Intertek / UL / TÜV).
5. **Cost:** $30k-$150k+.
6. **Calendar time:** 6-12 months.
7. **Process steps:** Implement SDLC per the standard → notified-body assessment → certificate.
8. **Strategic value:** Medical device vertical. Defer.
9. **Sources:** [Intertek IEC 81001-5-1](https://www.intertek.com/blog/2025/03-11-iec-81001-5-1/) · [qtec IEC 81001-5-1](https://www.qtec-group.com/en/cybersecurity-connected-medical-devices-iec-81001-5-1/)

---

# 4. EMERGING / SUPPLY-CHAIN

## 4.1 OpenSSF Best Practices Badge (formerly CII Best Practices Badge)

1. **Name + issuer:** Open Source Security Foundation (Linux Foundation). Self-administered through bestpractices.dev.
2. **What it certifies:** An open-source project's adherence to security best practices. Three levels:
   - **Passing** — 67 criteria
   - **Silver** — 55 additional criteria
   - **Gold** — 23 additional criteria
3. **Eligibility for nous:** **YES — if nous (or libsecurity.a) is open-sourced.** Free, self-attested, immediately credible badge in OSS ecosystems. Pursue Passing first; Silver as nous matures.
4. **Self-attestation vs third-party audit:** Self-attestation with public criteria-by-criteria justification (publicly auditable).
5. **Cost:** **FREE.**
6. **Calendar time:** Days to weeks to fill out the criteria; weeks-to-months to actually meet them.
7. **Process steps:** Register project on bestpractices.dev → answer each criterion (Met / Unmet / N/A with rationale) → publish.
8. **Strategic value:** Cheap, fast, public-facing. Only ~18% of registered projects reach Passing; ~5% of Passing reach Silver. Silver is a genuine differentiator.
9. **Sources:** [OpenSSF Best Practices](https://openssf.org/projects/best-practices-badge/) · [bestpractices.dev](https://www.bestpractices.dev/en) · [GitHub repo](https://github.com/coreinfrastructure/best-practices-badge)

## 4.2 OpenSSF Scorecard

1. **Name + issuer:** OpenSSF (open-source automated security health metric).
2. **What it certifies:** Automated score 0-10 across 18+ checks (Branch Protection, Code Review, Dangerous Workflow, Pinned Dependencies, Signed Releases, SAST, Token Permissions, etc.). Scans 1M+ repos weekly.
3. **Eligibility for nous:** **YES** — automatic and FREE if the repo is public. Run scorecard locally to fix gaps before publishing.
4. **Self-attestation vs third-party audit:** Automated assessment.
5. **Cost:** Free.
6. **Calendar time:** Minutes for the scan; iterative work to raise score.
7. **Process steps:** Enable in GitHub Actions → consume score in README badge → improve.
8. **Strategic value:** Quick credibility for OSS-style consumers. Pairs with Best Practices Badge.
9. **Sources:** [OpenSSF Scorecard](https://openssf.org/projects/scorecard/) · [ossf/scorecard GitHub](https://github.com/ossf/scorecard) · [securityscorecards.dev](https://securityscorecards.dev/)

## 4.3 SLSA — Supply-Chain Levels for Software Artifacts

1. **Name + issuer:** OpenSSF (governed by SLSA Working Group). Current stable: v1.0; v1.1 in development.
2. **What it certifies:** Build-pipeline integrity tracks. Build Track Levels 0-3 in v1.0 (L4 deferred from v0.1):
   - **L0** — no provenance
   - **L1** — provenance exists (may be unsigned)
   - **L2** — hosted build platform generates and signs provenance
   - **L3** — hardened, isolated build platform with authenticated signed provenance
3. **Eligibility for nous:** **YES — high value, low cost.** If nous publishes binaries (metal.exe, libsecurity.a), SLSA L2 is achievable in days with GitHub Actions + Sigstore. L3 with reusable workflows. Provenance attestations are becoming procurement table stakes.
4. **Self-attestation vs third-party audit:** Self-claimed; provenance is independently verifiable (cryptographic — that's the point).
5. **Cost:** Free tooling (GitHub Actions, slsa-github-generator, Sigstore). Engineering time only.
6. **Calendar time:** Days to L2; weeks to L3.
7. **Process steps:** Move build to GitHub Actions (hosted) → adopt slsa-github-generator → publish signed provenance alongside release → optionally store in Rekor.
8. **Strategic value:** **RISING STAR.** OMB M-22-18 (now M-26-05 evolution) pushed SBOM + provenance into federal procurement; enterprise security buyers asking for it next. Cheap moat.
9. **Sources:** [slsa.dev](https://slsa.dev/) · [SLSA v1.0 spec](https://slsa.dev/spec/v1.0/) · [SLSA levels](https://slsa.dev/spec/v1.0/levels) · [What's new in v1.0](https://slsa.dev/spec/v1.0/whats-new)

## 4.4 NIST SSDF (Secure Software Development Framework) — SP 800-218

1. **Name + issuer:** NIST. Published Feb 2022. CISA published a Self-Attestation Form (March 2024) for federal software suppliers.
2. **What it certifies:** Software-producer process adherence to four practice families: Prepare the Organization (PO), Protect the Software (PS), Produce Well-Secured Software (PW), Respond to Vulnerabilities (RV).
3. **Eligibility for nous:** **YES — required for any U.S. federal sale.** OMB M-22-18 (Sept 2022) required attestations for federal software suppliers. Executive Order 14306 (June 2025) and OMB M-26-05 (Jan 2026) softened the central CISA mandate but agency-led risk-based assurance now substitutes — vendors still need auditable conformance evidence (SBOMs being a key artifact).
4. **Self-attestation vs third-party audit:** Self-attestation (CEO/CISO signature) — but evidence (SBOMs, build provenance) is what auditors now ask for.
5. **Cost:** Self-attest is free; readiness consulting $10k-$50k.
6. **Calendar time:** 1-3 months readiness.
7. **Process steps:** Map current SDLC to SSDF practices → close gaps → sign attestation → maintain evidence.
8. **Strategic value:** Federal-sales requirement. Pairs perfectly with SLSA + SBOM.
9. **Sources:** [NIST SP 800-218](https://csrc.nist.gov/pubs/sp/800/218/final) · [CISA SSDF resource](https://www.cisa.gov/resources-tools/resources/nist-sp-800-218-secure-software-development-framework-v11-recommendations-mitigating-risk-software) · [Crowell on attestation form](https://www.crowell.com/en/insights/client-alerts/cisa-releases-draft-secure-software-development-self-attestation-form) · [Linford SSDF](https://linfordco.com/blog/secure-software-development-attestation-form-ssdf/)

## 4.5 CycloneDX / SPDX SBOM Standards

1. **Name + issuer:** **CycloneDX** — OWASP (security-focused). **SPDX** — Linux Foundation (license-focused). Both ISO/IEC ratified as international standards (SPDX = ISO/IEC 5962:2021; CycloneDX = ISO/IEC 5965 in progress).
2. **What it certifies:** Machine-readable Software Bill of Materials — components, versions, dependencies, hashes, licenses, vulnerabilities.
3. **Eligibility for nous:** **YES — generate and publish SBOMs for every release.** Standard format. EO 14028 (still in effect) mandates SBOMs for federal software; EU CRA (Cyber Resilience Act, fully enforceable Dec 2027) mandates SBOMs for ALL digital products sold in the EU.
4. **Self-attestation vs third-party audit:** Self-generated; consumed by vulnerability scanners and procurement.
5. **Cost:** Free tooling (CycloneDX CLI, syft, spdx-tools). Engineering time.
6. **Calendar time:** Hours to wire into CI.
7. **Process steps:** Add SBOM generator step to build → sign with Cosign → attach to release artifacts.
8. **Strategic value:** **TABLE STAKES SOON.** EU CRA in particular makes this non-negotiable. NTIA minimum elements: Supplier, Component, Version, Unique ID, Dependency, Author, Timestamp; CISA 2025 draft adds Hash, License, Tool Name, Generation Context.
9. **Sources:** [NIST EO 14028 SBOM](https://www.nist.gov/itl/executive-order-14028-improving-nations-cybersecurity/software-security-supply-chains-software-1) · [SBOM Generator EO 14028](https://sbomgenerator.com/compliance/us-executive-order) · [OpenSSF on CRA + SBOM](https://openssf.org/blog/2025/10/22/sboms-in-the-era-of-the-cra-toward-a-unified-and-actionable-framework/)

## 4.6 in-toto Attestation Framework

1. **Name + issuer:** in-toto project (CNCF Incubating). Specification for cryptographically signed metadata about supply chain steps.
2. **What it certifies:** Each step of a supply chain (build, test, sign, publish). The SUBJECT (what was produced) + the PREDICATE (claims about it).
3. **Eligibility for nous:** **YES** — adopt as the attestation envelope for everything (SLSA Provenance, SBOM, test results) the build pipeline emits.
4. **Self-attestation vs third-party audit:** Cryptographically signed claims; verifiable independently.
5. **Cost:** Free.
6. **Calendar time:** Hours-days to integrate.
7. **Process steps:** Define attestation predicates → sign with Sigstore → publish.
8. **Strategic value:** Substrate of modern supply-chain integrity. Mostly invisible to procurement directly but underpins SLSA + signed SBOMs.
9. **Sources:** [in-toto attestation framework GitHub](https://github.com/in-toto/attestation) · [SLSA + in-toto](https://slsa.dev/blog/2023/05/in-toto-and-slsa) · [Mikael Barbero deep dive](https://mikael.barbero.tech/blog/post/2023-12-28-slsa-and-in-toto/)

## 4.7 Sigstore (Cosign + Rekor + Fulcio)

1. **Name + issuer:** Sigstore Project (OpenSSF/Linux Foundation). Public-good keyless signing infrastructure.
2. **What it certifies:** Artifact authenticity + transparency. Cosign signs; Fulcio issues short-lived OIDC-bound certs; Rekor records the signing event in an immutable transparency log.
3. **Eligibility for nous:** **YES — mandatory for any release pipeline.** Free. Container ecosystem standard; spreading to binaries (Python wheels via PyPI, npm, Java/Maven).
4. **Self-attestation vs third-party audit:** Cryptographically self-attested with public transparency.
5. **Cost:** Free.
6. **Calendar time:** Hours to integrate.
7. **Process steps:** `cosign sign` → Fulcio cert → Rekor log → `cosign verify` for consumers.
8. **Strategic value:** Modern signing standard. Necessary for SLSA L2+. Trust-mesh substrate value alignment is high (Sigstore IS a trust mesh of sorts).
9. **Sources:** [Sigstore docs](https://docs.sigstore.dev/cosign/signing/overview/) · [Sigstore quickstart](https://docs.sigstore.dev/quickstart/quickstart-cosign/) · [Sigstore security](https://docs.sigstore.dev/about/security/)

---

# 5. ATTESTATION / TRUST PROGRAMS

## 5.1 TrustArc (TRUSTe) Privacy Certifications

1. **Name + issuer:** TrustArc, Inc. (private). Multiple programs: Enterprise Privacy Certification, Data Collection Certification, APEC CBPR / PRP Certifications.
2. **What it certifies:** Privacy program compliance against a composite framework (GDPR, ISO 27001, CCPA, LGPD, PIPEDA, PIPL).
3. **Eligibility for nous:** **Defer.** TrustArc is consumer-data heavy. nous is identity substrate. Revisit if a consumer-facing surface ships.
4. **Self-attestation vs third-party audit:** Third-party (TrustArc).
5. **Cost (USD):** **$10,000/yr starting**, ~$22,000/yr average per market data, up to $137,000.
6. **Calendar time:** 2-6 months initial; annual ongoing.
7. **Process steps:** Privacy assessment → policy validation → certification → annual review.
8. **Strategic value:** Recognized in consumer-privacy contexts. Skip for now.
9. **Sources:** [TrustArc certifications](https://trustarc.com/products/assurance-certifications/) · [G2 TrustArc pricing](https://www.g2.com/products/trustarc/pricing) · [Wikipedia TrustArc](https://en.wikipedia.org/wiki/TrustArc)

## 5.2 BBB Accredited Business

1. **Name + issuer:** Better Business Bureau.
2. **What it certifies:** Business ethics, transparency, complaint handling. Not security per se but a baseline trust signal.
3. **Eligibility for nous:** **Optional low-bar.** $500-$1,500/yr for a small business.
4. **Self-attestation vs third-party audit:** BBB application + ongoing complaint monitoring.
5. **Cost:** $500-$1,500/yr based on employee count.
6. **Calendar time:** Weeks to apply.
7. **Process steps:** Apply → meet 8 BBB standards → annual fee.
8. **Strategic value:** Consumer signal. Marginal for B2B security tooling.
9. **Sources:** BBB national site (bbb.org).

## 5.3 ISACA Cybersecurity Audit Certificate (CSX-A) + Personal Certs (CISA, CISM, CISSP)

1. **Name + issuer:** ISACA (CISA, CISM, CSX) and (ISC)² (CISSP, SSCP). All PERSONAL certs.
2. **What it certifies:** Individual professional competence — NOT the organization.
3. **Eligibility for nous:** **Personnel signal.** Joey or any teammate holding CISSP/CISA adds credibility to auditor conversations + procurement RFPs.
4. **Self-attestation vs third-party audit:** Exam + experience verification.
5. **Cost:** CISSP exam $749; CISM $760; CISA $760; CSX-A $399. Annual maintenance ~$85-$135.
6. **Calendar time:** Months of study; 5-year cycle CPE.
7. **Process steps:** Study → exam → endorsement.
8. **Strategic value:** Personal credibility, modest org-level signal.
9. **Sources:** ISACA + (ISC)² official sites.

---

# 6. CLOSING RECOMMENDATION

## Decision Filters Applied

Joey is one operator with a substrate product, not a hosted SaaS, building toward enterprise + government adoption. Optimization function: **maximum trust signal per dollar + per month spent**, with strong avoidance of certifications that don't fit the product shape (avoid: PCI, HIPAA-direct, automotive/rail/medical unless customers appear).

Four classes of value:
1. **Universal procurement table stakes** (must-have to sell anywhere) → SOC 2 + ISO 27001
2. **Product-truth certifications** (prove the math/code is real) → FIPS 140-3 / ISO 19790; Common Criteria
3. **Cheap / fast moats** (high signal per dollar) → SLSA + SBOM + Sigstore + OpenSSF Badge
4. **Vertical-specific** (defer until first customer in that vertical) → HITRUST (healthcare), TISAX (auto), IEC 62443 (industrial), CMMC L2 (defense), BSI IT-Grundschutz (Germany)

## TOP 5 to Pursue First — Ranked

### #1 — Supply-Chain Stack: OpenSSF Best Practices Badge + Scorecard + SLSA L2 + SBOM (CycloneDX) + Sigstore

**Why first:** Total cost = $0. Total calendar time = days-to-weeks. Output = 5+ public trust badges, signed releases, machine-verifiable provenance, published SBOMs. Pure engineering work, no auditors, no waiting on third parties. Lowest-effort path to a credible public-facing security posture.

**Pursue now.** This is the cheapest moat in the entire industry and aligns perfectly with "roll your own, bare metal, pure C99" — Sigstore signs the binary, SLSA proves how it was built, SBOM lists every dependency (which for libsecurity.a is approximately zero, which is a flex), Scorecard scores public hygiene, Badge ties it together. Do this MONTH ONE.

**Expected output in 30-60 days:** OpenSSF Passing badge live; OpenSSF Scorecard ≥7/10; SLSA Build L2 (achievable in GitHub Actions); SBOMs auto-generated per release in CycloneDX + SPDX; every release signed via Cosign and logged to Rekor.

### #2 — SOC 2 Type II (Security TSC, U.S. trust trifecta cornerstone)

**Why second:** ~70-85% of enterprise RFPs require it; 98% of Fortune 500 procurement mandates Type II specifically. Without it, U.S. B2B deals stall or die outright. Cost ~$20k-$45k Year 1; ~9 months zero-to-Type-II. Scope to Security TSC only initially.

**Pursue Q3 2026.** Use Vanta / Drata / Secureframe / Sprinto for automation (saves auditor + readiness time). Pair with auto-generated SOC 3 for public-facing badge. This is the U.S. enterprise-sales unlock.

### #3 — ISO/IEC 27001:2022 (international trust trifecta cornerstone)

**Why third:** Global passport. Required/expected in EU/UK/APAC; for any international sale, it's what gets asked for. ~$15k-$60k Year 1, 3-6 months focused. **Bundle with CSA STAR Level 1 (free CAIQ submission) + plan to upgrade to STAR L2 in Year 2** when CSA STAR + 27001 audits can share evidence.

**Pursue Q1-Q2 2027** (after SOC 2 maturity gives the audit muscle). Same auditor team can often dual-deliver SOC 2 + ISO 27001 efficiently. Together with SOC 2, this is the international "trust trifecta" base.

### #4 — FIPS 140-3 / ISO 19790 Level 1 for libsecurity.a (product-truth cert)

**Why fourth:** nous's entire value proposition rests on cryptography. The single most credible third-party validation of cryptographic correctness IS FIPS 140-3 / ISO 19790. Required for U.S. federal + Canadian federal + many financial-services + global regulated industries. International recognition via ISO 19790 covers markets that don't accept FIPS. Software-only Level 1 is achievable.

**Pursue 2027** when budget allows ($150k-$250k). This is the heavy lift but the deepest moat — once libsecurity.a is FIPS 140-3 validated, the marketing line writes itself: "the only sub-1000-LOC FIPS-validated crypto module on earth."

**Tactical sequencing:** Start with CAVP (Algorithmic Validation) FIRST — much cheaper, gates the FIPS 140-3 process anyway, and produces published NIST-listed algorithm validations that read as immediate credibility. Then engage a lab (atsec, Acumen, Lightship) for the module validation.

### #5 — NIST SSDF Self-Attestation + NIST CSF 2.0 Self-Mapping (foundation scaffolding)

**Why fifth:** Both are FREE (self-attestation + self-assessment). NIST CSF 2.0 mapping gives you a single coherent control narrative that maps cleanly into SOC 2, ISO 27001, CMMC, FedRAMP, and everything else. NIST SSDF attestation is required for federal sales and signals SDLC maturity to enterprise security buyers. Pairs with the Supply-Chain stack from #1 (SBOM + provenance ARE the auditable evidence for SSDF).

**Pursue continuously starting now.** This is documentation work that turns existing engineering practice into procurement-ready artifacts.

## What to DEFER (and the trigger to revisit)

| Cert | Trigger to pursue |
|---|---|
| HITRUST (e1 → i1 → r2) | First serious healthcare-vertical customer (hospital, EHR, payer) appears |
| TISAX AL2 | First automotive OEM / Tier 1 supplier engagement |
| CMMC L2 | First defense prime / DoD pipeline opens; budget $75k-$300k |
| IEC 62443-4-1 / 4-2 | First industrial / OT customer appears |
| BSI IT-Grundschutz | First serious German federal / KRITIS pipeline |
| ISO 27017 / 27018 / 27701 | nous adds cloud or PII-handling surface |
| Common Criteria (CC EAL2+) | Customer specifically asks; international defense pipeline appears |
| PCI family | Never, unless nous explicitly enters payments |
| TrustArc | Never for substrate; revisit only if consumer-facing surface |

## The Moat Combination (long-term target)

**5-year trust stack for nous:**

```
PUBLIC LAYER (free + immediate)
  OpenSSF Best Practices Silver
  OpenSSF Scorecard 9+
  SLSA Build Level 3
  CycloneDX + SPDX SBOMs every release
  Sigstore signed + Rekor logged
  NIST CSF 2.0 mapped (public profile)

ENTERPRISE LAYER (Year 1-2)
  SOC 2 Type II (annual)
  SOC 3 public report
  ISO/IEC 27001:2022 (3-year cycle)
  ISO/IEC 27002 controls mapped
  CSA STAR Level 1 → 2
  CIS Controls IG2 attestation
  NIST SSDF self-attestation

PRODUCT-TRUTH LAYER (Year 2-3)
  FIPS 140-3 / ISO 19790 L1 validated module
  CAVP algorithm validations (each curve, AEAD, KDF)
  Common Criteria EAL2 (or higher) for nous core

VERTICAL UNLOCKS (Year 3-5, customer-driven)
  HITRUST i1 (healthcare)
  CMMC L2 (defense)
  IEC 62443-4-2 (OT/industrial)
  TISAX AL2 (automotive)
  BSI IT-Grundschutz (Germany)
```

This stack is the "best, most highly approved security on earth" claim — defensible because every layer is third-party-validated by a different recognized authority, no single point of trust failure.

## One More Strategic Note

Joey's quote-30 — "Over time we will use different AI models for different tasks within different tildes" — has a direct analog in certifications: **don't pursue one mega-certification; assemble a portfolio.** The "trust trifecta" framing (SOC 2 + ISO 27001 + ISO 27017/18) is the canonical example. Best-in-class would be a "trust constellation" — supply-chain stack + SOC 2 + ISO 27001 + FIPS 140-3 + CC, each issued by a different authority, each verifiable independently. That's the asymmetric trust profile that says "no single auditor / regulator / government owns my legitimacy."

The pure-C99, no-dependency posture of libsecurity.a is itself the highest-credibility starting point any certifier could ask for. The certs aren't there to validate the code — Joey already knows it's right. The certs are there to translate that rightness into the legal artifacts that procurement teams need to write checks.

---

**End of Quadrant MS-2 report.**

*Sources cited inline above. All cost figures USD unless noted; calendar times assume reasonable preparation and small-org scope unless noted otherwise. Costs current as of May 2026; cert programs evolve — verify before commitment.*
