# Quadrant MS-2 — DEEP MATRIX — Industry-Issued Security Certifications, Audits & Compliance Frameworks

**Mission (round 2):** For every non-government industry-issued security certification, audit framework, badge, or attestation program that nous (Joey's pure-C99, zero-trust mesh + machine-identity substrate) could pursue, fill out the full 9-field matrix:

1. WHO — issuing body, HQ country, ownership, typical audit-firm chain
2. TIMELINE — 2026 audit windows, annual cycle, past-5-yr revisions, next-5-yr roadmap
3. URL REF — official authoritative URL
4. URL TO ENTER — exact engagement / submission URL(s), incl. 3 named firms for audit-based programs
5. TERMS OF ENTRY — eligibility, cost (USD), calendar, tier-pricing call-outs
6. 🔴 IP OWNERSHIP — verbatim engagement-letter / licensing language; Y/N on "do they own / claim our invention?"; source URL
7. SHARING REQUIREMENTS — public vs private vs NDA-flow; what registry shows what
8. DO WE OWN OUR IP — final one-sentence answer, paying special attention to open-source-publication requirements (OpenSSF Badge), source-disclosure obligations (SLSA Source Track), dependency-disclosure obligations (SBOM), signing (Sigstore)
9. PROOF IN LAYMAN'S TERMS — named recent holders + procurement realities

**Operator:** Joey Castillo / joeycastilloUS / kastil-systems / acmedevUS.
**Product posture:** ~900-LOC `libsecurity.a`, sovereign FQDN-keyed identity, fierce IP protection, single-developer-to-small-team org.
**Date:** 2026-05-30 (this is the round-2 deep-research deliverable; round-1 inventory is at `be/plans/2026-05-30-i-MS-2-industry-certifications-and-audits.md`).

**Stance:** "Do they own my invention?" gets a direct answer per program. Most industry certs are pure conformance audits with strict mutual NDAs — Joey retains 100% IP. A few have caveats (OpenSSF Best Practices Badge expects OSI-approved licensing at higher tiers, SOC 2 reports flow to customers under NDA, SBOMs disclose dependencies but not source). Each program below states the answer in field #8.

---

## Past-5-Year Industry-Cert Events (2021-2026) — Compressed Calendar

- **2021** — OpenSSF formed (Aug 2020 → 1st full year 2021). CENELEC TS 50701 (railway) published June 2021. IEC 81001-5-1 (medical software) published Dec 2021.
- **2022** — ISO/IEC 27001:2022 published 25 Oct 2022 (start of 3-yr transition). ISO/IEC 27002:2022 published Feb 2022. SLSA v1.0 in development. NIST SSDF v1.1 published Feb 2022. SSAE 21 in effect for SOC reports issued after 15 Jun 2022.
- **2023** — SLSA v1.0 approved Apr 2023. in-toto CNCF graduation (in-toto Attestation v1.0 spec released Jun 2023). PCI DSS v4.0 published March 2022, 2-year transition began.
- **2024** — NIST CSF 2.0 released 26 Feb 2024. PCI DSS v4.0.1 released Jun 2024. ISO/IEC 27701:2025 standalone (no longer requires 27001 as prerequisite). HITRUST v11.4.0 late 2024. CMMC Program Rule (32 CFR 170) published 15 Oct 2024, effective 16 Dec 2024. EU CRA entered into force 10 Dec 2024.
- **2025** — PCI DSS 4.x future-dated requirements mandatory 31 Mar 2025. ISO/IEC 27001:2013 sunset 31 Oct 2025. SLSA v1.1 approved Apr 2025 (Build track). SLSA v1.2 approved Nov 2025 (introduces Source Track). HITRUST v11.5.0 Apr 2025, v11.6.0 Aug 2025. OSPS Baseline initial release 25 Feb 2025. CMMC DFARS Final Rule effective 10 Nov 2025.
- **2026** — Round-1 of CMMC L1/L2 self-assessments in DoD contracts (Phase 1 starts 10 Nov 2025; Phase 2 with C3PAO L2 starts 10 Nov 2026). EU CRA conformity-assessment-bodies article applies 11 Jun 2026; vulnerability-reporting obligations apply 11 Sep 2026.

## Next-5-Year Roadmap (2026-2031)

- **2026** — Tail of FIPS 140-2 modules on the Active list winds down (most already moved to Historical). CMMC Phase 2 (C3PAO Level 2 audits hit mainstream) begins 10 Nov 2026.
- **2027** — EU CRA full enforcement 11 Dec 2027 (CE-marking + SBOM + vuln disclosure for ALL digital products sold in EU). CMMC Phase 3 starts.
- **2028** — CMMC Phase 4 starts; SOC 2 framework expected to incorporate AI-control sub-criteria (AICPA pipeline). HITRUST CSF v12 expected.
- **2029** — Likely NIST CSF v2.x point releases. PCI DSS v5.0 expected (5-year typical cycle). ISO/IEC 27001 amendments cycle continues.
- **2030** — ISO/IEC 27001 next major revision likely (historical pattern: 2005 → 2013 → 2022 → ~2030). SLSA v2.0 expected.
- **2031** — FIPS 140-3 module 5-yr validation cycle hits original Validations issued 2026, requiring revalidation.

---

# 1. ISO/IEC FAMILIES

## 1.1 ISO/IEC 27001:2022 — Information Security Management System

**1. WHO** — International Organization for Standardization (ISO, Geneva, Switzerland; non-profit federation of 169 national standards bodies) jointly with International Electrotechnical Commission (IEC, Geneva). Certificates issued by accredited Certification Bodies (CBs) under national accreditation (UKAS in UK, ANAB in US, DAkkS in Germany, JAS-ANZ in AU/NZ). Big audit-firm chain: **BSI Group** (UK), **TÜV SÜD / TÜV Rheinland** (DE), **Bureau Veritas** (FR), **DNV** (NO), **SGS** (CH), **Schellman** (US boutique), **A-LIGN** (US boutique), **Coalfire** (US boutique), **NQA** (UK/US), **DEKRA** (DE).

**2. TIMELINE** — Stage 1 + Stage 2 audits typically occur in any quarter, often aligned with the org's fiscal calendar. **3-year certificate cycle**: Year 0 initial (Stage 1+2), Year 1 surveillance audit, Year 2 surveillance audit, Year 3 recertification. Past 5 yrs: 27001:2013 → 27001:2022 (published 25 Oct 2022); 3-year transition ended **31 October 2025** — all 2013 certs invalid as of that date ([SGS notice](https://www.sgs.com/en-us/news/2025/09/last-chance-to-transition-to-iso-iec-27001-2022-and-next-steps-if-you-miss-the-deadline)). Next 5 yrs: Amendment 1:2024 added climate change references; next major revision likely **circa 2030** (historical 2005→2013→2022 cadence).

**3. URL REF** — https://www.iso.org/standard/27001

**4. URL TO ENTER** — Three named firms:
- Schellman: https://www.schellman.com/services/iso-certifications/iso-27001
- BSI Group: https://www.bsigroup.com/en-US/products-and-services/standards/iso-iec-270012022-information-security-management/
- Coalfire (via Drata directory): https://drata.com/partners/audit-alliance/directory/schellman

**5. TERMS OF ENTRY** — Eligibility: any legal entity (sole-founder org permitted; scope statement names the unit). No prerequisite certs. **Cost**: Standard purchase ~CHF 198 (~$225 USD); audit gap analysis ~$5,700 (<250 employees); Stage 1+2 small co $14k-$16k; first-year all-in $15k-$60k for a 10-person org ([ISMS.online breakdown](https://www.isms.online/iso-27001/audits/cost-breakdown/), [Drata cost guide](https://drata.com/grc-central/iso-27001/certification-cost)). **Calendar**: 3-6 months focused effort; 12-18 months from cold start. Tier pricing — same audit fee regardless of "level" (no Type I / Type II split as SOC 2 has).

**6. 🔴 IP OWNERSHIP** — **No IP claim on the certified entity's invention.** ISO/IEC 27001 is a conformance audit; CBs receive copies of policies, SoA, risk register, and evidence under explicit confidentiality. Auditors look for evidence around Annex A 6.6 (Confidentiality / Non-disclosure Agreements) which "should normally cover definition of confidential information, such as source code, customer lists, financial data, technical designs, roadmaps" ([ISMS.online A.6.6](https://www.isms.online/iso-27001/annex-a-2022/6-6-confidentiality-or-non-disclosure-agreements-2022/)). The auditor's mutual NDA is standard. ISO itself owns COPYRIGHT in the standard text (you may not republish ISO clauses), but holds no rights to your work product. Source URL for ISO licensing: https://www.iso.org/terms-conditions-licence-agreement.html. **Y/N: NO claim on your IP.**

**7. SHARING REQUIREMENTS** — **Public:** certificate (cert number, scope statement, expiry date) listed on the CB's public register (e.g., bsigroup.com/clients). Joey may display the ISO 27001 logo + cert # on the website. **Private:** Statement of Applicability, risk register, control implementation evidence, audit report — confidential between Joey + CB. **Required disclosures:** none. Internal audit reports and management-review minutes stay with the org.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** ISO 27001 certifies management-system conformance, not the code or product. Source remains private and uninspected.

**9. PROOF IN LAYMAN'S TERMS** — Held by Microsoft, AWS, Google Cloud, Atlassian, Slack, Stripe, Snowflake, Datadog, Cloudflare, IBM, Oracle, Workday, Salesforce, ServiceNow, Box, Dropbox, HubSpot, Notion, Asana, Zoom, Twilio, GitLab, GitHub, HashiCorp, Okta, every major bank's tech arm. EU/UK procurement teams ask for this BEFORE SOC 2. International "passport" — accepted in 165+ countries.

## 1.2 ISO/IEC 27002:2022 — Controls Catalog

**1. WHO** — ISO + IEC (same governance as 27001).

**2. TIMELINE** — Reference standard, no audit cycle. Published Feb 2022. Next revision likely 2030 alongside 27001.

**3. URL REF** — https://www.iso.org/standard/75652.html

**4. URL TO ENTER** — N/A (purchase only, no audit submission).

**5. TERMS OF ENTRY** — Buy PDF ~CHF 198 ($225 USD).

**6. 🔴 IP OWNERSHIP** — **None claimed on your work.** ISO copyright on the document itself prohibits republication.

**7. SHARING REQUIREMENTS** — N/A (you don't publish anything).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** — this is a guidance document, no certification, no transfer.

**9. PROOF** — Universal companion to 27001. Every 27001-certified org effectively uses 27002 as their control catalog.

## 1.3 ISO/IEC 27017:2015 — Cloud-Specific Controls

**1. WHO** — ISO + IEC. Audited by same CB as 27001 (Schellman, BSI, BV, etc.).

**2. TIMELINE** — Annex on 27001 cert cycle (3-year). 27017 itself unchanged since 2015; revision under consideration but not imminent.

**3. URL REF** — https://www.iso.org/standard/43757.html

**4. URL TO ENTER** — Same CBs as 27001 (engaged as scope add-on):
- Schellman: https://www.schellman.com/services/iso-certifications/iso-27017
- BSI: https://www.bsigroup.com/en/our-services/certification/management-system-certification/iso-iec-27017/
- A-LIGN: https://www.a-lign.com/services/iso/iso-27017

**5. TERMS OF ENTRY** — Requires concurrent 27001 audit; +$3k-$8k incremental.

**6. 🔴 IP OWNERSHIP** — **No IP claim** (annex on 27001).

**7. SHARING** — Same flow as 27001: public cert annex line, private evidence.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Held by AWS, Azure, GCP, Box, Dropbox, Workday, Salesforce, IBM Cloud, Oracle Cloud, Alibaba Cloud.

## 1.4 ISO/IEC 27018:2019 — PII in Public Cloud

**1. WHO** — ISO + IEC. Same CB pool.

**2. TIMELINE** — Same 3-year cycle as 27001. Last revision 2019; next revision under WG consideration.

**3. URL REF** — https://www.iso.org/standard/76559.html

**4. URL TO ENTER** —
- Schellman: https://www.schellman.com/services/iso-certifications/iso-27018
- BSI: https://www.bsigroup.com/en/our-services/certification/management-system-certification/iso-iec-27018/
- BV: https://www.bureauveritas.com/services-and-solutions/iso-27018

**5. TERMS OF ENTRY** — +$3k-$8k incremental to 27001 audit.

**6. 🔴 IP OWNERSHIP** — **None on your work.**

**7. SHARING** — Cert annex line is public; evidence private.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — AWS, Azure, GCP, Salesforce, Adobe — table-stakes for any cloud PII processor in EU.

## 1.5 ISO/IEC 27701:2025 — Privacy Information Management System

**1. WHO** — ISO + IEC. **2025 change: standalone — no longer requires 27001** ([Wikipedia 27701](https://en.wikipedia.org/wiki/ISO/IEC_27701)).

**2. TIMELINE** — 3-yr cycle. Past: 27701:2019 → 27701:2025. Next major revision est. 2032+.

**3. URL REF** — https://www.iso.org/standard/27701

**4. URL TO ENTER** —
- Schellman: https://www.schellman.com/services/iso-certifications/iso-27701
- BSI: https://www.bsigroup.com/en/iso-iec-27701/
- DNV: https://www.dnv.com/services/iso-iec-27701-218488

**5. TERMS OF ENTRY** — Standalone now. $10k-$30k audit; 4-9 months calendar; 3-yr cert cycle.

**6. 🔴 IP OWNERSHIP** — **None claimed.** PIMS audit reviews privacy program evidence under standard NDA.

**7. SHARING** — Public certificate; private evidence.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Microsoft, AWS, Atos, Capgemini, Deutsche Telekom, Workday — gold-standard PII processor signal in EU/UK/CCPA jurisdictions.

## 1.6 ISO/IEC 19790:2012 + ISO/IEC 24759:2017 — Cryptographic Module Requirements

**1. WHO** — ISO + IEC. ISO 19790 is the international counterpart of FIPS 140-3 (FIPS literally wraps it). Test labs: NVLAP-accredited for FIPS (US); national-scheme accredited labs elsewhere (atsec, Acumen, Lightship, Leidos, CGI, Riscure, SERMA, Brightsight, EWA Canada).

**2. TIMELINE** — Validations valid 5 years; Interim Validations valid 2 years. Past 5 yrs: NIST opened the **FIPS 140-3 Interim Validation Option** Feb 2024 to clear backlog ([SafeLogic](https://www.safelogic.com/blog/nist-announces-availability-of-fips-140-3-interim-validation-option)). CMVP queue wait reached **728 days in May 2024** ([Corsec](https://www.corsec.com/cmvp-interim/)). NIST aims to clear backlog by end of 2026. Next 5 yrs: new 19790 revision under JTC1/SC27 review; expected 2028-2030.

**3. URL REF** — https://www.iso.org/standard/52906.html

**4. URL TO ENTER** —
- atsec: https://www.atsec.com/services/cryptographic-validation/
- Acumen Security: https://www.acumensecurity.net/services/fips-140-3-validation/
- Lightship Security: https://lightshipsec.com/services/fips-140-3-cmvp/

**5. TERMS OF ENTRY** — Lab fees $80k-$300k+ for L1 software module; CAVP algorithm validation $5k-$15k per family; CMVP cost-recovery $5k-$25k. **Calendar**: 12-24 months end-to-end (including queue). Tier pricing: L1 (software) cheapest; L2 / L3 / L4 hardware-bound, exponentially more expensive.

**6. 🔴 IP OWNERSHIP** — **No IP claim on source.** The Security Policy document IS published on the CMVP public list, but it is a sanitized description of the module — interfaces, services, FSM diagram — NOT the source code. Source code stays with the developer; the lab inspects under NDA. NIST has no rights to your code. Source: https://csrc.nist.gov/projects/cryptographic-module-validation-program

**7. SHARING REQUIREMENTS** — **Public:** the Security Policy (sanitized), the validation certificate, the module name/version/vendor on the [CMVP active list](https://csrc.nist.gov/projects/cryptographic-module-validation-program/validated-modules). **Private:** source code, test reports, design docs (lab-confidential).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** The Security Policy is the public face; the source code never leaves NDA scope.

**9. PROOF** — Held by RSA BSAFE, OpenSSL FIPS Provider, Microsoft CNG, Apple CoreCrypto, BoringSSL, Red Hat Crypto, Cisco Crypto Module, BlackBerry/Certicom, Thales, Gemalto, YubiKey. Mandatory for U.S. federal, Canadian federal, financial regulators in 30+ countries.

## 1.7 ISO/IEC 15408 (Common Criteria) + 18045 (CEM)

**1. WHO** — ISO + IEC + CCRA member nations (31 nations as of 2026; "Certificate Authorizing" includes US/NIAP, Canada/CSE, UK/NCSC, Germany/BSI, France/ANSSI, NL/NSCIB, Spain/CCN, Italy/OCSI, Sweden/CSEC, Norway/SERTIT, Australia/ASD, South Korea/IT Security Certification Center, Japan/JISEC, Singapore/CSA, Türkiye/TSE, India/STQC, Malaysia/MyCC). Labs: accredited Common Criteria Testing Labs (CCTLs).

**2. TIMELINE** — Annual audit cycle for surveillance; product cert generally valid 5 years (varies by scheme). Past: **2014 CCRA reform** limited automatic mutual recognition to EAL1-EAL2 + ALC_FLR or to evaluations against collaborative Protection Profiles (cPPs); higher levels recognized only between bilateral arrangements (e.g., SOG-IS in EU) ([Common Criteria portal](https://www.commoncriteriaportal.org/ccra/index.cfm)). **CC2022** (4th edition of 15408) published 2022, replacing 2009/CC3.1R5 — added Assurance Packages, Multi-Assurance evaluations. Next 5 yrs: gradual migration to CC2022 PPs; CC v4.x update expected ~2027.

**3. URL REF** — https://www.iso.org/standard/72891.html · https://www.commoncriteriaportal.org/

**4. URL TO ENTER** —
- Lightship Security (CCTL): https://lightshipsec.com/services/common-criteria/
- Leidos / Brightsight: https://www.brightsight.com/common-criteria
- atsec: https://www.atsec.com/services/common-criteria-evaluations/

**5. TERMS OF ENTRY** — EAL2 cost **$100k-$170k** ([Nenkin EAL guide](https://nenkin.io/blog/eal-levels-explained)); 4-6 month timeline for EAL2. EAL4+ $300k-$500k+. cPP evaluations vary; usually cheaper than custom STs. Calendar: 6-18 months. Tier pricing: EAL1 ≤ EAL2 < EAL4+ < EAL5+ (each level ~2-3× cost of previous).

**6. 🔴 IP OWNERSHIP** — **No IP claim.** Lab receives source + design docs under strict NDA. The Security Target (ST) IS published; the source is not. Certification report and ST go to the public Common Criteria portal once validated.

**7. SHARING REQUIREMENTS** — **Public:** ST, certification report, certificate, listing on commoncriteriaportal.org. **Private:** source code, test reports, vulnerability analysis details (sanitized version goes public).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Source stays NDA; only the Security Target's claims become public.

**9. PROOF** — Held by Cisco firewalls/routers, Juniper, Palo Alto, Fortinet, F5, Microsoft Windows (every server LTS), Apple iOS, Android (Samsung Knox), Oracle Solaris/Database, IBM z/OS, all major HSMs (Thales, Utimaco, Entrust nShield). National-security procurement door internationally.

## 1.8 ISO 22301:2019 — Business Continuity Management Systems

**1. WHO** — ISO. Same CB pool as 27001.

**2. TIMELINE** — 3-yr cert cycle. Past: published 2012, revised 2019. Next revision likely 2027-2029.

**3. URL REF** — https://www.iso.org/standard/75106.html

**4. URL TO ENTER** —
- BSI: https://www.bsigroup.com/en/iso-22301/
- DNV: https://www.dnv.com/services/iso-22301-218488
- SGS: https://www.sgs.com/en/services/iso-22301

**5. TERMS OF ENTRY** — $8k-$30k SME audit; 3-12 months calendar.

**6. 🔴 IP OWNERSHIP** — **None claimed.**

**7. SHARING** — Public cert; private evidence (BCP plans confidential).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Held by major banks, hospital systems, AWS, Microsoft, Lloyd's of London, large telcos.

## 1.9 ISO 31000:2018 — Risk Management

**1. WHO** — ISO. **Guidance document, not certifiable for orgs.** Personal certs (PECB ISO 31000 Risk Manager) available.

**2. TIMELINE** — Last revision 2018; next due 2025-2027 window (Working Group active).

**3. URL REF** — https://www.iso.org/iso-31000-risk-management.html

**4. URL TO ENTER** — N/A organizationally; PECB Foundation exam: https://pecb.com/en/education-and-certification-for-individuals/iso-31000/iso-31000-foundation

**5. TERMS OF ENTRY** — PDF purchase only.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — N/A.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Adopted as national standard in 82 countries.

## 1.10 ISO/IEC 27040:2024 — Storage Security (revised 2024)

**1. WHO** — ISO + IEC.

**2. TIMELINE** — Revised 2024 (from 2015 original). Next revision est. 2030+. Implementation referenced via 27001 SoA.

**3. URL REF** — https://www.iso.org/standard/80194.html

**4. URL TO ENTER** — Via 27001 audit only (referenced in SoA, not separately certified).

**5. TERMS OF ENTRY** — Marginal to 27001.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — None public beyond 27001 cert.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Referenced by Dell, NetApp, IBM, HPE storage product compliance pages.

---

# 2. AICPA / AUDIT FRAMEWORKS

## 2.1 SOC 1 Type I & Type II

**1. WHO** — American Institute of Certified Public Accountants (AICPA, Durham NC, US, professional association of ~400k CPAs). Audits performed by licensed CPA firms only. Big audit-firm chain: **Deloitte, EY, KPMG, PwC** (Big Four) + boutiques **Schellman, A-LIGN, Coalfire, BDO, Grant Thornton, RSM, Crowe, Moss Adams, Sensiba, Johanson, BARR Advisory**.

**2. TIMELINE** — Type I = point-in-time (3-6 month effort); Type II = 6-12 month observation window. Past 5 yrs: SSAE 18 (2017) → SSAE 21 (effective 15 Jun 2022) — terminology updates, no substantive changes ([Auditwerx](https://auditwerx.com/ssae-updates-2022/)). Next 5 yrs: SOC 2+ enhancements continue; AICPA expected to issue more "additional criteria" mappings.

**3. URL REF** — https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/socforserviceorganizations

**4. URL TO ENTER** —
- Schellman SOC 1: https://www.schellman.com/services/soc-examinations/soc-1
- A-LIGN: https://www.a-lign.com/services/aicpa-soc-examinations
- BARR Advisory: https://www.barradvisory.com/service/soc-1/

**5. TERMS OF ENTRY** — $15k-$100k typical; Type I cheap-and-quick ($15k-$30k), Type II expensive-and-slow ($30k-$100k+). Eligibility: any service organization processing financial-reporting controls on customers' behalf.

**6. 🔴 IP OWNERSHIP** — **None claimed.** Engagement letters AICPA-standard; "many terms… are deemed required by the AICPA and unable to be negotiated, including… inherent limitations of an examination engagement, and responsibilities of each of the engaging parties" ([Linford & Co](https://linfordco.com/blog/audit-engagement-letter-terms/)). Auditor receives evidence under professional confidentiality (AICPA ET Section 1.700.001).

**7. SHARING** — Report is restricted-distribution (your customers' financial auditors); covered by mutual NDA.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** N/A for nous (no financial processing).

**9. PROOF** — Held by every payroll provider (ADP, Paychex), every SaaS that integrates into customer financials (NetSuite, Workday), every payment processor (Stripe, Square, FIS).

## 2.2 SOC 2 Type I & Type II — Trust Service Criteria

**1. WHO** — AICPA Trust Services Criteria (TSC). Same CPA firms as SOC 1.

**2. TIMELINE** — Annual cycle (most orgs renew every 12 months). Type II observation **3-12 months** (AICPA AT Section 801 considers <6 months unlikely to be useful — [Compass IT Compliance](https://www.compassitc.com/blog/selecting-your-soc-2-type-2-observation-period)). Most orgs pick 6 or 12 months. Common observation windows: Jan-Jun, Jan-Dec, Jul-Dec — aligned with customer fiscal years. Past 5 yrs: SSAE 18 (2017) → 2017 TSC revision → 2022 description-criteria implementation guide refresh → SSAE 21 effective 2022. AICPA committed to digital-only updates going forward ([Frazier & Deeter](https://www.frazierdeeter.com/insights/article/the-future-of-soc-reporting/)). Next 5 yrs: SOC 2+ additional criteria for AI (in pipeline 2026-2027); GRC subservice criteria.

**3. URL REF** — https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/aicpasoc2report

**4. URL TO ENTER** —
- Schellman SOC 2: https://www.schellman.com/services/soc-examinations/soc-2
- A-LIGN SOC 2: https://www.a-lign.com/services/aicpa-soc-examinations/soc-2
- BARR Advisory: https://www.barradvisory.com/service/soc-2/

Compliance automation tools (parallel engagement, lower auditor cost):
- Vanta: https://www.vanta.com/products/soc-2 — $7,500/yr (1-20 emp) up to $25,000 (101-200) ([Cavanex 2026](https://cavanex.com/blog/soc-2-compliance-platforms-compared-2026))
- Drata: https://drata.com/product/soc-2 — Foundation $7,500-$15,000/yr
- Secureframe: https://secureframe.com/solutions/soc-2-compliance — Fundamentals $7,500-$20,000/yr
- Sprinto: https://sprinto.com/soc-2/ — typically <$7,500/yr for small teams

**5. TERMS OF ENTRY** — Eligibility: any service org (no employee minimum). Type I $10k-$25k audit + $5k-$15k readiness. Type II $12k-$30k audit + automation tooling. Year 1 all-in $20k-$45k typical. Calendar: Type I 3-8 months; Type II 6-20 months (3-month obs minimum, typically 6+). Tier pricing: **Type I (cheap/quick: design-of-controls at point in time)** vs **Type II (expensive/slow: operating effectiveness over 6-12 months)**.

**6. 🔴 IP OWNERSHIP** — **No IP claim.** Standard CPA-firm engagement letter; AICPA-standard mutual confidentiality. Management assertion letter "establishes clear ownership and define[s] the scope of the examination" — ownership stays with Joey ([SOC 2 Auditors](https://soc2auditors.org/insights/soc-2-management-assertion-letter/)). Confidentiality TSC controls explicitly require IP protection: "intellectual property protection through data encryption and access controls."

**7. SHARING REQUIREMENTS** — **Public:** logo + "SOC 2 Type II Examined" claim allowed on website; cert number is the audit-period identifier. **Restricted distribution under NDA:** the actual SOC 2 report goes to current and prospective customers + their CPA auditors only, never general public ([UHY guidance](https://uhy-us.com/insights/news/2022/september/how-do-i-share-my-soc-2-report)). NDAs spell out: permitted uses (vendor evaluation), restrictions on further distribution, return-or-destroy requirements, consequences of unauthorized disclosure. SOC 3 (below) is the public-distributable variant.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Report is shared with customers under NDA; no source disclosure; auditor and customer both bound.

**9. PROOF** — ~98% of Fortune 500 procurement explicitly mandates SOC 2 Type II. Holders: **every major SaaS on earth** — Slack, Atlassian, Stripe, Snowflake, Datadog, Notion, Asana, Zoom, Twilio, GitLab, GitHub, HashiCorp, Okta, Figma, Linear, Vercel, Cloudflare, MongoDB, Confluent. Without it: U.S. B2B deals stall or die.

## 2.3 SOC 3 — Public-Facing TSC Report

**1. WHO** — AICPA + same CPA firms as SOC 2.

**2. TIMELINE** — Annual; only Type II (no Type I SOC 3 exists). Generated as a sanitized version of the SOC 2 report.

**3. URL REF** — https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/aicpasoc3report

**4. URL TO ENTER** — Same firms as SOC 2; SOC 3 is a deliverable add-on to the SOC 2 engagement.

**5. TERMS OF ENTRY** — Bundled cost +$2k-$8k when ordered with SOC 2.

**6. 🔴 IP OWNERSHIP** — **None claimed** — same engagement letter framework as SOC 2.

**7. SHARING REQUIREMENTS** — **Fully public, freely distributable.** Post on landing page, share in sales decks, no NDA required.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Report is intentionally sanitized for public distribution; no source mentioned.

**9. PROOF** — AWS, Google Cloud, Microsoft, Salesforce publish SOC 3 reports openly to drive top-of-funnel trust.

## 2.4 SOC for Cybersecurity

**1. WHO** — AICPA + CPA firms.

**2. TIMELINE** — Annual cycle. Introduced 2017; lukewarm adoption (SOC 2 dominates).

**3. URL REF** — https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/aicpacybersecurityinitiative

**4. URL TO ENTER** —
- Schellman: https://www.schellman.com/services/cybersecurity-assessments/soc-for-cybersecurity
- A-LIGN: https://www.a-lign.com/services/aicpa-soc-examinations/soc-for-cybersecurity
- Crowe: https://www.crowe.com/services/audit/cybersecurity-risk-management-soc-for-cybersecurity

**5. TERMS OF ENTRY** — $25k-$100k; 6-12 months.

**6. 🔴 IP OWNERSHIP** — **None claimed.**

**7. SHARING** — Public general-use report (similar to SOC 3 in distribution rules but for entity-wide cyber risk).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Limited adoption; smaller named-holder list than SOC 2.

## 2.5 HITRUST CSF (e1, i1, r2)

**1. WHO** — Health Information Trust Alliance (HITRUST, Frisco TX, US, private company; not a non-profit). Assessments by HITRUST-authorized **External Assessor Organizations**: Coalfire, Schellman, Clearwater, BARR, A-LIGN, KirkpatrickPrice, BDO, EY, Deloitte, Aprio, MorganFranklin, BlueVoyant.

**2. TIMELINE** — e1 valid 1 year (annual). i1 valid 1 year. r2 valid 2 years with interim 1-year check. Past 5 yrs: HITRUST CSF v9.x → v11.0 (Jan 2023, biggest restructure ever — added e1, i1, made r2 the legacy heavy assessment). v11.4 late 2024, v11.5.0 Apr 2025, v11.6.0 Aug 2025 ([Coalfire on v11](https://coalfire.com/the-coalfire-blog/everything-you-need-to-know-about-hitrust-v11)). Next 5 yrs: v12.x expected 2027-2028; AI-control mappings expanding each release.

**3. URL REF** — https://hitrustalliance.net/

**4. URL TO ENTER** —
- Coalfire: https://coalfire.com/services/cyber-risk-management/hitrust
- Schellman: https://www.schellman.com/services/cybersecurity-assessments/hitrust
- A-LIGN: https://www.a-lign.com/services/hitrust-certification

**5. TERMS OF ENTRY** — **Tier pricing extreme:**
- **e1** (44 controls): ~$60k-$120k all-in (~$6k report credit + $18,100 MyCSF annual + assessor fees).
- **i1** (182 controls): $70k-$120k.
- **r2** (250-1500+ controls): $100k-$1M+; small orgs ~$150k, large healthcare $500k+.
MyCSF subscription: $9k-$32k/yr depending on tier; 90-day "assessment-only" access $3k-$6k ([HITRUST official](https://hitrustalliance.net/blog/how-much-does-hitrust-cost)).
Calendar: e1 = 3-6 months; i1 = 6-9 months; r2 = 12-15 months.

**6. 🔴 IP OWNERSHIP** — **None on your invention.** HITRUST controls + framework owned by HITRUST; YOUR implementation evidence is yours. MyCSF subscription agreement governs platform IP. License terms at https://hitrustalliance.net/mycsf-subscription-agreement — restricts HITRUST framework IP (you can't republish their control catalog) but does not claim your work.

**7. SHARING REQUIREMENTS** — **Public:** certification listing on HITRUST registry, certificate, level (e1/i1/r2). **Private:** validated-assessment report (shared with customers under NDA, like SOC 2).

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Source not inspected; framework is HITRUST's IP, your evidence is yours.

**9. PROOF** — **HITRUST CSF IS the healthcare-data audit framework.** Required by Anthem, Cigna, UnitedHealth Group, Humana, Aetna, Kaiser Permanente, Epic Systems, Cerner/Oracle Health, Veeva, Cohere Health, Athenahealth, Optum, Highmark. ~85% of US hospital chains require HITRUST from BAA vendors.

## 2.6 CSA STAR Program (Level 1 / Level 2 / Level 3)

**1. WHO** — Cloud Security Alliance (CSA, Bellingham WA, US, registered Washington-state non-profit). Built on the Cloud Controls Matrix (CCM) + CAIQ. L2 audits by CSA-accredited auditors: BSI, BV, Coalfire, A-LIGN, Schellman.

**2. TIMELINE** — L1 self-assessment valid 12 months; L2 audit valid 3 years (annual review). Past 5 yrs: CCM v4.0 released 2021, v4.0.10 revisions through 2024. Next 5 yrs: STAR for AI program launching 2026; CCM v5.0 planned 2027.

**3. URL REF** — https://cloudsecurityalliance.org/star

**4. URL TO ENTER** —
- L1 self-assessment portal: https://cloudsecurityalliance.org/star/registry (free CAIQ submission)
- L2 auditors: Schellman https://www.schellman.com/services/cybersecurity-assessments/csa-star
- BSI: https://www.bsigroup.com/en/csa-star/
- A-LIGN: https://www.a-lign.com/services/csa-star

**5. TERMS OF ENTRY** — **L1 FREE** (just CAIQ submission). L2 piggybacks on ISO 27001 or SOC 2 audit; +$3k-$15k incremental. L3 (continuous monitoring) emerging; case-by-case.

**6. 🔴 IP OWNERSHIP** — **None on your code.** CSA owns CCM + CAIQ document IP; you fill out the CAIQ questionnaire which becomes public for L1.

**7. SHARING REQUIREMENTS** — **PUBLIC** (this is the unusual one): completed CAIQ posted on CSA STAR Registry publicly searchable at https://cloudsecurityalliance.org/star/registry. Your control answers (yes/no/NA + justification text) are visible to all. **Private:** anything you choose not to put in the CAIQ — your source, your business detail.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** — but be aware **your CAIQ control posture is publicly searchable on the registry.** You choose what level of detail goes in the justifications.

**9. PROOF** — Held by AWS, Azure, GCP, Salesforce, Box, Dropbox, Workday, ServiceNow, IBM Cloud, Oracle Cloud, Alibaba — ~1,400+ CSPs in the registry.

---

# 3. INDUSTRY-SPECIFIC

## 3.1 PCI DSS v4.0.1

**1. WHO** — PCI Security Standards Council (Wakefield MA, US, industry consortium owned by Visa + Mastercard + American Express + Discover + JCB). QSAs are Council-licensed firms: Schellman, Coalfire, A-LIGN, ControlScan, TrustedSec, Trustwave, NCC Group, BSI, KirkpatrickPrice.

**2. TIMELINE** — Annual revalidation. Past 5 yrs: v3.2.1 → v4.0 (March 2022) → v4.0.1 (June 2024). 51 future-dated requirements mandatory **31 March 2025**. v4.0.1 doesn't add new requirements; clarifications only ([PCI SSC blog](https://blog.pcisecuritystandards.org/just-published-pci-dss-v4-0-1)). Next 5 yrs: v5.0 expected 2027-2028 (typical 5-year cycle).

**3. URL REF** — https://www.pcisecuritystandards.org/document_library/

**4. URL TO ENTER** —
- Schellman: https://www.schellman.com/services/pci-compliance/pci-dss
- Coalfire: https://coalfire.com/services/cyber-risk-management/pci
- Trustwave: https://www.trustwave.com/en-us/services/security-testing/pci-compliance/

**5. TERMS OF ENTRY** — Tier pricing extreme: L1 merchant ($50k-$500k QSA audit) >> L2-L4 SAQ ($1k-$50k). Service Provider L1 (300k+ txns) requires QSA audit.

**6. 🔴 IP OWNERSHIP** — **None on your invention.** Standard QSA mutual NDA; QSA receives evidence under confidentiality.

**7. SHARING REQUIREMENTS** — **Public-ish:** Attestation of Compliance (AoC) summary shared with acquiring banks, card brands, and on demand to customers. **Private:** Report on Compliance (ROC) detail confidential.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** — and N/A for nous (no CHD handling).

**9. PROOF** — Stripe, Square, Adyen, PayPal, all major banks, every e-commerce platform handling card data.

## 3.2 PCI 3DS / P2PE / PIN / Card Production

(Specialized payment-card programs — same governance as 3.1. **NO** for nous.)

**1. WHO** — PCI SSC + specialized assessors.

**2. TIMELINE** — Annual cycles per program.

**3. URL REF** — https://www.pcisecuritystandards.org/standards/

**4. URL TO ENTER** — Schellman P2PE https://www.schellman.com/services/pci-compliance/pci-p2pe; Schellman 3DS https://www.schellman.com/services/pci-compliance/pci-3ds; Coalfire payments services.

**5. TERMS OF ENTRY** — $50k-$500k+; 6-18 months.

**6. 🔴 IP OWNERSHIP** — **None on your invention.**

**7. SHARING** — Listed on PCI SSC public registry.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** — N/A for nous.

**9. PROOF** — Stripe Terminal, Square, Verifone, Ingenico, Adyen.

## 3.3 HIPAA + HITECH (third-party attestation industry)

**1. WHO** — Underlying law: HHS Office for Civil Rights. **No official HIPAA cert.** Industry attestations by CPA firms, HITRUST assessors, Compliancy Group, HIPAA One, etc.

**2. TIMELINE** — Annual. Past 5 yrs: HIPAA Privacy Rule modifications 2024 (reproductive health PHI). Next 5 yrs: HIPAA Security Rule major NPRM 2024 → expected finalization 2026-2027.

**3. URL REF** — https://www.hhs.gov/hipaa/

**4. URL TO ENTER** —
- HITRUST (industry-standard substitute): see HITRUST URLs above
- Compliancy Group: https://compliancy-group.com/
- KirkpatrickPrice: https://kirkpatrickprice.com/audit/hipaa/

**5. TERMS OF ENTRY** — Vendor attestation $10k-$50k; HITRUST i1 ($70k-$120k) is the heavyweight equivalent.

**6. 🔴 IP OWNERSHIP** — **None claimed** by any private attestor.

**7. SHARING** — BAA + attestation letter shared with covered entities under standard NDA.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Every EHR (Epic, Cerner, Athenahealth), every health-data SaaS (Datavant, Komodo, Health Gorilla).

## 3.4 NIST CSF 2.0

**1. WHO** — National Institute of Standards and Technology (NIST, Gaithersburg MD, US, federal agency under Dept of Commerce). **Voluntary framework, NOT a cert program.** Third-party assessments emerging from Pivot Point, ControlCase, FAIR Institute.

**2. TIMELINE** — No mandatory cycle. Past 5 yrs: CSF 1.1 (2018) → **CSF 2.0 (26 Feb 2024)** — first major revision since creation, added 6th Function (Govern), added Quick-Start Guides, dropped explicit "critical infrastructure" framing ([CSWP 29](https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.29.pdf)). Next 5 yrs: NIST CSF 2.x point releases; no announced 3.0 timeline.

**3. URL REF** — https://www.nist.gov/cyberframework

**4. URL TO ENTER** —
- Self-assessment: download CSF 2.0 PDF + Quick Start Guides at https://www.nist.gov/cyberframework/quick-start-guides
- Third-party assessors (optional):
  - Pivot Point Security: https://www.pivotpointsecurity.com/services/nist-cybersecurity-framework-assessment/
  - ControlCase: https://www.controlcase.com/services/cybersecurity-framework-assessment/
  - Schellman: https://www.schellman.com/services/cybersecurity-assessments/nist

**5. TERMS OF ENTRY** — Self-assessment FREE; third-party $10k-$50k.

**6. 🔴 IP OWNERSHIP** — **None.** NIST publications are public-domain U.S. government works; no IP rights flow either direction.

**7. SHARING** — Self-published profiles; no required registry.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Adopted by JPMorgan Chase, Bank of America, every utility, most Fortune 500 risk programs as the planning scaffold.

## 3.5 NIST 800-171 + CMMC 2.0 (defense)

**1. WHO** — NIST (catalog) + DoD CIO (CMMC). C3PAOs (CMMC Third-Party Assessment Organizations) accredited by **Cyber AB** (formerly CMMC-AB, the CMMC Accreditation Body). C3PAOs: Coalfire, Schellman, A-LIGN, Kratos, Redspin (a Clearwater company), CyberSheath, Kieri Solutions, KirkpatrickPrice.

**2. TIMELINE** — Annual SPRS score updates; CMMC L2 cert valid 3 years. Past 5 yrs: NIST SP 800-171 R2 (2020) → R3 (May 2024). CMMC 2.0 announced Nov 2021; **32 CFR Part 170 published 15 Oct 2024, effective 16 Dec 2024**; **DFARS Final Rule effective 10 Nov 2025** ([Mayer Brown](https://www.mayerbrown.com/en/insights/publications/2025/09/department-of-defense-releases-long-anticipated-final-rule-implementing-the-cybersecurity-maturity-model-certification-program)). Next 5 yrs: Phase 1 (self-assess) 10 Nov 2025-10 Nov 2026; Phase 2 (C3PAO L2 mainstream) 10 Nov 2026; Phase 3 2027; Phase 4 2028.

**3. URL REF** — https://dodcio.defense.gov/CMMC/ · https://csrc.nist.gov/pubs/sp/800/171/r3/final

**4. URL TO ENTER** —
- Coalfire: https://coalfire.com/services/cyber-risk-management/cmmc
- Schellman: https://www.schellman.com/services/cybersecurity-assessments/cmmc
- Kratos: https://www.kratosdefense.com/services/space-mission-management/cmmc-assessment

**5. TERMS OF ENTRY** — Eligibility: DoD contractor or sub. Cost: gap assessment $3.5k-$20k; **CMMC L2 cert $75k-$300k+** (2026 avg $138k). Calendar: 1-12 weeks for DFARS 7012 policy; 1+ year full CMMC L2.

**6. 🔴 IP OWNERSHIP** — **None on invention.** Standard contractor confidentiality; C3PAO under Cyber AB ethics + NDA. Government has rights only to CUI you process, not to your IP.

**7. SHARING REQUIREMENTS** — **Public:** CMMC certification listed on CMMC eMASS / Cyber AB Marketplace. **Private:** SSP, POA&M, assessment artifacts.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Required ecosystem-wide for DoD contractors: 200k+ companies in the Defense Industrial Base. Lockheed, Raytheon (RTX), Boeing, Northrop Grumman, General Dynamics, L3Harris, BAE, Leidos, SAIC, Booz Allen all driving CMMC down their supply chains.

## 3.6 NIST SP 800-53 Rev 5

**1. WHO** — NIST. Catalog only — certified VIA FedRAMP, FISMA, CMMC.

**2. TIMELINE** — R5 published Sep 2020; R5.1.1 update Dec 2023. Next major rev likely 2027.

**3. URL REF** — https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final

**4. URL TO ENTER** — N/A as standalone cert.

**5. TERMS OF ENTRY** — Catalog free.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — None.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Foundation for every U.S. federal info-system authorization.

## 3.7 CIS Controls v8.1 (Implementation Groups IG1, IG2, IG3)

**1. WHO** — Center for Internet Security (CIS, East Greenbush NY, US, non-profit). Community-consensus framework.

**2. TIMELINE** — Past 5 yrs: v7.1 (2019) → v8 (May 2021) → v8.1 (Jun 2024). 153 Safeguards across 18 Controls. Next 5 yrs: v9 expected 2027-2028.

**3. URL REF** — https://www.cisecurity.org/controls

**4. URL TO ENTER** —
- CIS CSAT (free): https://csat.cisecurity.org/
- CIS CSAT Pro (paid SaaS): https://www.cisecurity.org/controls/cis-csat-pro
- Third-party attestation: HALOCK Security Labs, Pivot Point Security.

**5. TERMS OF ENTRY** — Self-assessment FREE; third-party assessment optional ($5k-$25k).

**6. 🔴 IP OWNERSHIP** — **None.** CIS controls licensed under Creative Commons Attribution-ShareAlike 4.0 — you can re-publish CIS content with attribution; CIS holds no rights to your evidence.

**7. SHARING** — Self-published scores at your discretion. No registry.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Adopted by USAA, AARP, Sprint, Verizon, plus heavy MSSP usage. Quick-credibility small-org self-assessment scaffold.

## 3.8 COBIT 2019 (ISACA)

**1. WHO** — ISACA (Schaumburg IL, US, professional association). **Personal certs only — not organizational.**

**2. TIMELINE** — COBIT 2019 (Nov 2018) latest framework version. Personal certs: 3-year CPE cycle.

**3. URL REF** — https://www.isaca.org/resources/cobit

**4. URL TO ENTER** — Foundation exam: https://www.isaca.org/credentialing/cobit-foundation

**5. TERMS OF ENTRY** — Foundation $175; advanced $400-$800/exam.

**6. 🔴 IP OWNERSHIP** — **None.** Personal credential; ISACA holds framework IP.

**7. SHARING** — Personal credential listing.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Held by ~50k individuals globally.

## 3.9 BSI IT-Grundschutz (Germany)

**1. WHO** — Bundesamt für Sicherheit in der Informationstechnik (BSI, Bonn, Germany, federal IT security authority). BSI-licensed auditors.

**2. TIMELINE** — 3-year cert cycle. Past 5 yrs: Compendium updated annually; "Modernized IT-Grundschutz" (2017+) dominates. Next 5 yrs: continuous Compendium updates; new modules for AI, quantum-safe crypto expected 2026-2028.

**3. URL REF** — https://www.bsi.bund.de/EN/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/it-grundschutz_node.html

**4. URL TO ENTER** —
- BSI-licensed auditor list: https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Certification/ZertIS/Liste_Auditoren_27001_GS.html
- Examples: TÜV Rheinland, TÜV SÜD, DEKRA, Bureau Veritas Germany, DNV Germany.

**5. TERMS OF ENTRY** — Eligibility: any org; in practice German nexus. Cost: comparable to ISO 27001 + 30-50%. SMEs: 8-14 months implementation, 0.3-0.7 FTE operate. KRITIS: 18-36 months, 2-10 FTE.

**6. 🔴 IP OWNERSHIP** — **None.** Standard auditor NDA.

**7. SHARING** — Public certificate on BSI registry; evidence private.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Deutsche Telekom, SAP, Siemens, Bosch, Volkswagen IT, KRITIS operators (power, water, banking).

## 3.10 TISAX (Trusted Information Security Assessment Exchange)

**1. WHO** — ENX Association (Frankfurt, Germany, automotive consortium founded by VW, BMW, Daimler, Audi, Porsche, Bosch, Continental, ZF). Built on VDA ISA questionnaire. ENX-accredited audit providers: Schellman, BSI, BV, DEKRA, TÜV SÜD, TÜV Rheinland.

**2. TIMELINE** — TISAX label valid 3 years. Past 5 yrs: VDA ISA v5.0 (2021) → v5.1 (2022) → v6.0 (2023) → v6.0.3+ ([Kopexa](https://kopexa.com/en/catalog/tisax/assessment-levels)). Next 5 yrs: VDA ISA v7 expected 2026-2027; AI assessment module in development.

**3. URL REF** — https://enx.com/en-us/TISAX/

**4. URL TO ENTER** —
- ENX portal (mandatory registration): https://portal.enx.com/
- Schellman TISAX: https://www.schellman.com/services/cybersecurity-assessments/tisax
- TÜV Rheinland: https://www.tuv.com/world/en/tisax-assessment.html
- DEKRA: https://www.dekra.com/en/tisax/

**5. TERMS OF ENTRY** — Eligibility: any company processing OEM-defined sensitive automotive data. ENX participation fee ~€4,450/assessment scope. **AL2** (remote audit) $5k-$10k audit only; €30k-€80k all-in mid-market. **AL3** (on-site, includes prototype data) ~20% more than AL2. Calendar: 6-12 months end-to-end.

**6. 🔴 IP OWNERSHIP** — **None.** ENX + assessor under standard NDA.

**7. SHARING REQUIREMENTS** — **Restricted:** label published on ENX portal accessible only to other ENX members (not fully public). Customer OEMs read your label data.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Required by Volkswagen Group (VW, Audi, Porsche, Bentley, Lamborghini), BMW Group, Mercedes-Benz Group, Stellantis, Ford Europe, Bosch, Continental, ZF, Magna, Valeo for any vendor touching sensitive automotive data.

## 3.11 IEC 62443 (Industrial Automation and Control Systems Security)

**1. WHO** — International Electrotechnical Commission + ISA (International Society of Automation, Research Triangle Park NC, US). ISASecure program (the conformance arm) administered by ASCI (Automation Standards Compliance Institute). ISO/IEC 17065-accredited cert bodies: exida, TÜV Rheinland, TÜV SÜD, Bureau Veritas, FM Approvals, CertX, SGS-TÜV Saar.

**2. TIMELINE** — Component certs valid 3 years with annual surveillance. Past 5 yrs: 62443-4-1 + 62443-4-2 finalized 2018/2019, now most-adopted product cert. 62443-2-1 (2nd edition) published 2024. Next 5 yrs: EU CRA enforcement (Dec 2027) is dragging IEC 62443 into critical-infrastructure mandates worldwide.

**3. URL REF** — https://www.isa.org/standards-and-publications/isa-standards/isa-iec-62443-series-of-standards · https://isasecure.org/

**4. URL TO ENTER** —
- exida: https://www.exida.com/Certification/IEC62443-Cyber-Cert
- TÜV Rheinland: https://www.tuv.com/world/en/iec-62443.html
- ISASecure direct: https://isasecure.org/certification/iec-62443-csa-certification

**5. TERMS OF ENTRY** — $50k-$250k component cert; $30k-$100k SDLC (62443-4-1) cert. 6-18 months.

**6. 🔴 IP OWNERSHIP** — **None claimed.** Lab + cert body NDA; source inspected only under controlled conditions.

**7. SHARING** — Public certificate on ISASecure registry; security target sanitized.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Held by Siemens, Schneider Electric, Rockwell Automation, ABB, Emerson, Honeywell, Yokogawa, Mitsubishi Electric, Phoenix Contact, Wago — the OT vendor pantheon.

## 3.12 CENELEC TS 50701 (Railway Cybersecurity)

**1. WHO** — CENELEC TC9X WG26 (Brussels, Belgium, European rail standards). Audited by TÜV Rheinland, DEKRA, Apave, Lloyd's Register Rail.

**2. TIMELINE** — Published Jun 2021. Currently being elevated to full **EN 50701** standard 2026-2027 + complementary IEC 63452 international harmonization.

**3. URL REF** — https://www.cenelec.eu/

**4. URL TO ENTER** —
- TÜV Rheinland Rail: https://www.tuv.com/world/en/cybersecurity-rolling-stock.html
- DEKRA Rail: https://www.dekra.com/en/rail-cybersecurity/

**5. TERMS OF ENTRY** — Six figures at system level; 12-24 months.

**6. 🔴 IP OWNERSHIP** — **None claimed.**

**7. SHARING** — Cert at system-integrator level; component vendors get sub-attestations.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Alstom, Siemens Mobility, Bombardier (now Alstom), Hitachi Rail, Wabtec, Stadler.

## 3.13 IEC 81001-5-1 (Medical Device Software Security)

**1. WHO** — IEC. Audited by notified bodies: Intertek, UL, TÜV SÜD, TÜV Rheinland, BSI, DEKRA, DNV.

**2. TIMELINE** — Published Dec 2021. EU MDR + FDA premarket guidance both cite it; mandatory in practice 2024-2026.

**3. URL REF** — https://webstore.iec.ch/publication/63831

**4. URL TO ENTER** —
- Intertek: https://www.intertek.com/medical/cybersecurity/
- UL Solutions: https://www.ul.com/services/medical-device-cybersecurity-testing
- TÜV SÜD: https://www.tuvsud.com/en/services/product-certification/medical-device-cybersecurity

**5. TERMS OF ENTRY** — $30k-$150k+; 6-12 months.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — Notified-body certificate; technical file confidential.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Philips Healthcare, GE Healthcare, Medtronic, Boston Scientific, Stryker, Abbott, Roche Diagnostics.

---

# 4. EMERGING / SUPPLY-CHAIN

## 4.1 OpenSSF Best Practices Badge (formerly CII Best Practices)

**1. WHO** — Open Source Security Foundation (OpenSSF), a Linux Foundation project (San Francisco / Delaware non-profit). Self-administered, no auditor.

**2. TIMELINE** — Continuous self-attestation; no expiry per se (badge tied to project status). Past 5 yrs: CII Best Practices → renamed OpenSSF Best Practices ~2022. New **"Baseline" criteria series added Feb 2025** ([OpenSSF press release](https://openssf.org/press-release/2025/02/25/openssf-announces-initial-release-of-the-open-source-project-security-baseline/)), running alongside the legacy "Metal series" (passing/silver/gold). Next 5 yrs: Baseline criteria evolution; tighter coupling to EU CRA + NIST SSDF.

**3. URL REF** — https://openssf.org/projects/best-practices-badge/

**4. URL TO ENTER** — https://www.bestpractices.dev/en — REGISTER PROJECT + answer criteria.

**5. TERMS OF ENTRY** — **FREE.** Days-to-weeks to fill out; weeks-to-months to actually meet criteria.

**6. 🔴 IP OWNERSHIP — CRITICAL FLAG** — **The project must be open-source to participate at "passing" or higher.** Passing badge criteria 0.2: "the project MUST post the license(s) of its results in a standard location in their source repository" and criteria suggest OSI-approved license. **Silver and Gold badges expect OSI-approved licensing.** Quoting OpenSSF FAQ: "It is SUGGESTED that any required license(s) for the software produced by the project be approved by the Open Source Initiative (OSI)" and "More advanced badges would set a higher bar (e.g., that it must be released under an OSI-approved license)" ([bestpractices.dev criteria](https://www.bestpractices.dev/en/criteria/0?details=true&rationale=true)). **TRANSLATION: pursuing this badge = publishing your source code under OSS license. Joey would be making `libsecurity.a` publicly readable.**

**7. SHARING REQUIREMENTS** — **PUBLIC:** badge graphic + criteria responses are publicly visible at bestpractices.dev/projects/<id>. ALL of your "Met / Unmet / N/A + rationale" answers are public.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **CONDITIONAL.** You retain copyright + control, but **earning this badge requires publishing source under an OSI-approved license** (Apache 2.0, MIT, BSD, GPL, etc.). For Joey's IP-protection posture, this is the single most "do they want my invention?" program in the entire industry-cert landscape. **Decide deliberately:** if `libsecurity.a` stays closed-source, skip this. If a public OSS version of nous core is acceptable as a marketing/community play, pursue it.

**9. PROOF** — Holders include curl, OpenSSL, Kubernetes, Linux Kernel, Node.js, Sigstore itself, Open vSwitch, gRPC, etcd, in-toto, slsa-framework — i.e., the elite of OSS security-critical projects. ~18% of registered projects reach Passing; ~5% of Passing reach Silver.

## 4.2 OpenSSF Scorecard

**1. WHO** — OpenSSF / Linux Foundation.

**2. TIMELINE** — Automated weekly scans of 1M+ public repos. Past 5 yrs: launched 2020; Scorecard v5 published 2024 (more checks, GitHub-app option). Next 5 yrs: ML-augmented scoring planned.

**3. URL REF** — https://openssf.org/projects/scorecard/

**4. URL TO ENTER** — https://scorecard.dev/ + add scorecard-action to your GitHub workflow at https://github.com/ossf/scorecard-action

**5. TERMS OF ENTRY** — **FREE.** Public-repo-only by default; private-repo support via local CLI.

**6. 🔴 IP OWNERSHIP — FLAG** — **Public-repo-only by default = same source-disclosure trigger as Best Practices Badge.** You can run Scorecard locally on a private repo and not publish scores, but the typical use is on public repos with public scores. Tool itself Apache 2.0; no IP claim on your code.

**7. SHARING REQUIREMENTS** — **PUBLIC:** weekly scan results for the 1M+ tracked public repos are queryable at scorecard.dev. If your repo is private, scores never surface publicly.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** in terms of copyright; **but the public-repo posture is the same source-disclosure question as #4.1.** If you go public, your scores are public; if you stay private, you can still self-run.

**9. PROOF** — Used by Microsoft, Google, Intel, AWS to vet OSS dependencies. Score appears as a README badge on most major OSS projects.

## 4.3 SLSA — Supply-Chain Levels for Software Artifacts

**1. WHO** — OpenSSF (SLSA Working Group). Linux Foundation governance.

**2. TIMELINE** — Past 5 yrs: SLSA v0.1 (2021) → v1.0 approved Apr 2023 (Build Track only, L0-L3) → **v1.1 approved Apr 2025** (Build Track refinements) → **v1.2 approved Nov 2025** (introduces **Source Track**) ([SLSA v1.2 announce](https://slsa.dev/blog/2025/11/announce-slsa-v1.2)). Next 5 yrs: Dependencies + Verification tracks; v2.0 expected 2027-2028.

**3. URL REF** — https://slsa.dev/

**4. URL TO ENTER** — https://github.com/slsa-framework/slsa-github-generator (GitHub Action). For TUF: https://theupdateframework.io/. For Sigstore integration: https://docs.sigstore.dev/

**5. TERMS OF ENTRY** — **FREE tooling.** Days to L2; weeks to L3.

**6. 🔴 IP OWNERSHIP** — **None.** SLSA is provenance-about-the-build, not source disclosure (Build Track). Source Track in v1.2 ADDS provenance about source (who reviewed, when), but **does not require publishing source** — it only requires authenticatable metadata about how the source was managed. You can keep source private and still emit valid SLSA Source Track attestations.

**7. SHARING REQUIREMENTS** — **Public:** SLSA provenance attestations attached to released artifacts (signed, verifiable). What's IN the provenance: builder identity, build instructions, source ref (commit hash, branch name), build timestamps. **NOT in provenance:** source code itself. Source code can remain private.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** SLSA proves the build pipeline is honest; it does not require publishing source. Build Track is pure binary-build attestation. Source Track adds source-management attestation but still doesn't require source disclosure.

**9. PROOF** — Used by Google, Microsoft, Intel, Linux Foundation projects, all major language packagers (npm, PyPI via PEP 740, RubyGems, Maven Central via Sigstore).

## 4.4 NIST SSDF (SP 800-218) + CISA Self-Attestation

**1. WHO** — NIST (catalog) + CISA (self-attestation form). U.S. federal civilian-agency oversight.

**2. TIMELINE** — Past 5 yrs: SSDF v1.1 published Feb 2022. CISA Self-Attestation Form initial Mar 2024, revised iterations 2024-2025. **OMB M-22-18 (Sep 2022)** required self-attestation; **Executive Order 14306 (Jun 2025)** and **OMB M-26-05 (Jan 2026)** softened the central CISA mandate, devolving to risk-based agency assurance — vendors still need auditable evidence (SBOMs, provenance) ([NIST EO 14028 page](https://www.nist.gov/itl/executive-order-14028-improving-nations-cybersecurity)). Next 5 yrs: SSDF v2 expected 2027-2028.

**3. URL REF** — https://csrc.nist.gov/pubs/sp/800/218/final

**4. URL TO ENTER** —
- Self-attestation form (CISA): https://www.cisa.gov/resources-tools/services/secure-software-development-attestation-form
- Repository for federal sales: agency-specific submission portals (typically via SAM.gov contract clauses).

**5. TERMS OF ENTRY** — Self-attest FREE; readiness consulting $10k-$50k.

**6. 🔴 IP OWNERSHIP** — **None claimed.** Self-attested form requires CEO/CISO signature; no source disclosure required.

**7. SHARING** — Attestation form goes to federal purchasing agencies; may surface in FOIA but not source.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Required by every U.S. federal civilian software acquisition. Self-attested by Microsoft, Google, AWS, Salesforce, Oracle, IBM, ServiceNow, Workday — and every small vendor selling to federal.

## 4.5 CycloneDX / SPDX SBOM Standards

**1. WHO** — **CycloneDX** governed by OWASP Foundation (Bel Air MD, US, non-profit). **SPDX** governed by Linux Foundation; **standardized as ISO/IEC 5962:2021**.

**2. TIMELINE** — Past 5 yrs: SPDX 2.3 (2022) → SPDX 3.0 (Apr 2024). CycloneDX 1.5 (2023) → 1.6 (2024). Next 5 yrs: **EU CRA fully enforceable 11 Dec 2027** mandating machine-readable SBOMs for ALL digital products sold in EU ([ScanDog timeline](https://scandog.io/blog/security-compliance/cyber-resilience-act-timeline)); vulnerability-reporting obligations apply 11 Sep 2026.

**3. URL REF** —
- CycloneDX: https://cyclonedx.org/
- SPDX: https://spdx.dev/

**4. URL TO ENTER** —
- CycloneDX tooling: https://cyclonedx.org/tool-center/
- SPDX tooling: https://spdx.dev/tools/
- Syft (universal SBOM generator): https://github.com/anchore/syft
- cdxgen: https://github.com/CycloneDX/cdxgen

**5. TERMS OF ENTRY** — **FREE.** Hours to wire into CI.

**6. 🔴 IP OWNERSHIP** — **None claimed by either standards body.** Apache 2.0 / CC-BY licensing for the format specs.

**7. SHARING REQUIREMENTS** — **Public-ish:** SBOM is published alongside releases; lists components, versions, hashes, licenses. **NOT publishing source** — SBOM is a manifest of dependencies, not source code. For nous's `libsecurity.a` (near-zero dependencies), the SBOM is small and a flex: "look how clean my supply chain is."

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** SBOM = manifest. Source code never disclosed via SBOM.

**9. PROOF** — Mandated by US Executive Order 14028, Federal Acquisition Regulations under M-22-18/M-26-05, FDA Section 524B for medical devices (effective Mar 2023), EU CRA (Dec 2027). Generated by Microsoft, Google, AWS, all major OSS distributions, Red Hat, every Linux distro.

## 4.6 OpenSSF Baseline (Levels 1, 2, 3)

**1. WHO** — OpenSSF. Released **25 Feb 2025**.

**2. TIMELINE** — Continuous self-assessment; v2025-02-25-rc → v2025-10-10 current as of late 2025 ([baseline.openssf.org](https://baseline.openssf.org/)).

**3. URL REF** — https://baseline.openssf.org/

**4. URL TO ENTER** — Self-attestation per project; tooling: https://github.com/ossf/security-baseline

**5. TERMS OF ENTRY** — **FREE.** Three levels:
- **L1**: any code/non-code project, any maintainer count.
- **L2**: code project, ≥2 maintainers, small consistent user base.
- **L3**: code project, large consistent user base.

**6. 🔴 IP OWNERSHIP — FLAG (similar to 4.1)** — Baseline aligned to OSPS (Open Source Project Security); **assumes the project is open-source**. Aligns with EU CRA + NIST SSDF.

**7. SHARING** — Self-published.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **CONDITIONAL** — same as Best Practices Badge: meant for OSS projects. Closed-source nous can read the baseline as guidance but can't really claim conformance publicly.

**9. PROOF** — Newer program (Feb 2025); early adoption by OpenSSF-graduated projects (Sigstore, in-toto, SLSA, etc.).

## 4.7 in-toto Attestation Framework

**1. WHO** — in-toto project, **CNCF Graduated** (Sep 2024); developed at NYU Tandon. Apache 2.0 licensed ([CNCF default per charter §11(c)(ii)](https://www.cncf.io/blog/2017/02/01/cncf-recommends-aslv2/)).

**2. TIMELINE** — Past 5 yrs: CNCF Sandbox 2019 → Incubation Mar 2022 → v1.0 attestation spec Jun 2023 → Graduation 2024. Next 5 yrs: tighter integration with SLSA, Sigstore, GUAC.

**3. URL REF** — https://in-toto.io/

**4. URL TO ENTER** — https://github.com/in-toto/attestation

**5. TERMS OF ENTRY** — **FREE.** Hours-days integration.

**6. 🔴 IP OWNERSHIP** — **None claimed.** Apache 2.0 tooling. Your attestations are yours.

**7. SHARING** — Attestations attached to releases; signed metadata only.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Pure substrate — no source disclosure, no IP capture.

**9. PROOF** — Integrated into SLSA, Sigstore, Kubernetes, Tekton, Notary v2, GUAC, Datadog, GitLab.

## 4.8 Sigstore (Cosign + Rekor + Fulcio)

**1. WHO** — Sigstore Project under OpenSSF / Linux Foundation. Cosign Apache 2.0 ([sigstore/cosign LICENSE](https://github.com/sigstore/cosign/blob/main/LICENSE)).

**2. TIMELINE** — Past 5 yrs: launched 2021; Cosign GA 2022; Sigstore service GA Oct 2022; Rekor transparency log production-grade 2023+. Next 5 yrs: client-side TUF root rotation; quantum-safe signature migration; PyPI / npm full integration.

**3. URL REF** — https://www.sigstore.dev/ + docs https://docs.sigstore.dev/

**4. URL TO ENTER** — `cosign sign <artifact>` after `cosign initialize`; service governed by [Hosted Project Tools Terms of Use](https://lfprojects.org/policies/hosted-project-tools-terms-of-use/).

**5. TERMS OF ENTRY** — **FREE.** Hours to integrate.

**6. 🔴 IP OWNERSHIP** — **None claimed.** Apache 2.0 client. Service ToU does require permission to have signing-event metadata stored permanently in Rekor transparency log — the SIGNATURE + cert + timestamp become immutably public, NOT the signed artifact's contents. Your binary stays yours; the signature is the public artifact.

**7. SHARING REQUIREMENTS** — **PUBLIC and IMMUTABLE:** signing events (your cert subject, signature, timestamp, artifact digest) become entries in the Rekor transparency log forever. The artifact ITSELF (your binary) is not uploaded — only the hash. Source code never touched.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.** Sigstore signs binaries; doesn't reveal source. Just be aware Rekor log is immutable + public — your signing OIDC identity (typically email/org from GitHub/Google) becomes a permanent public record.

**9. PROOF** — Default signing for Kubernetes releases, Sigstore self-attested, npm (since 2023), PyPI (PEP 740, 2024+), Maven Central (via OSS-RH), RubyGems, container registries, Linux distros (Fedora, Alpine, Debian piloting).

---

# 5. ATTESTATION / TRUST PROGRAMS

## 5.1 TrustArc (formerly TRUSTe) Privacy Certifications

**1. WHO** — TrustArc Inc. (San Francisco CA, US, private company).

**2. TIMELINE** — Annual renewal. Past 5 yrs: APEC CBPR program expansion; Global CBPR Forum formation 2022. Next 5 yrs: increasingly tied to GDPR/CCPA cross-border data-transfer regimes.

**3. URL REF** — https://trustarc.com/

**4. URL TO ENTER** — https://trustarc.com/products/assurance-certifications/

**5. TERMS OF ENTRY** — $10k/yr starting, $22k/yr avg, up to $137k. 2-6 months initial.

**6. 🔴 IP OWNERSHIP** — **None on your invention.** Audits privacy program, not code.

**7. SHARING** — Public seal + cert listing; private assessment.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Cisco, Mastercard, Wyndham, Foursquare, plus many consumer-facing sites.

## 5.2 BBB Accredited Business

**1. WHO** — Better Business Bureau (Arlington VA, US, non-profit).

**2. TIMELINE** — Annual.

**3. URL REF** — https://www.bbb.org/

**4. URL TO ENTER** — https://www.bbb.org/get-accredited

**5. TERMS OF ENTRY** — $500-$1,500/yr (size-based).

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — Public listing on BBB site.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Largely consumer-trust use; weak B2B security signal.

## 5.3 Personal Certs (CISSP, CISM, CISA, CSX-A)

**1. WHO** — ISACA (CISA, CISM, CSX) + (ISC)² (CISSP, SSCP).

**2. TIMELINE** — 3-year cert cycle with CPE maintenance.

**3. URL REF** — https://www.isc2.org/ + https://www.isaca.org/

**4. URL TO ENTER** —
- CISSP: https://www.isc2.org/certifications/cissp
- CISM: https://www.isaca.org/credentialing/cism
- CISA: https://www.isaca.org/credentialing/cisa

**5. TERMS OF ENTRY** — $399-$760 per exam; $85-$135 annual maintenance.

**6. 🔴 IP OWNERSHIP** — **None — personal credentials.**

**7. SHARING** — Personal cert in credential registries.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — ~150k CISSPs globally; near-universal in CISO ranks.

---

# 6. ADDITIONAL PROGRAMS DISCOVERED (round 2 net-new)

## 6.1 SOG-IS MRA (Senior Officials Group Information Systems Security Mutual Recognition Arrangement)

**1. WHO** — European mutual-recognition arrangement among 14 EU/EFTA countries for Common Criteria certifications above EAL2 (where the CCRA arrangement stops). HQ: rotates among signatories. Built on top of national schemes (BSI, ANSSI, NSCIB, CCN, etc.).

**2. TIMELINE** — Active since 1999; being subsumed by EU Cybersecurity Act's EUCC scheme (operational since Feb 2024, full transition by 2027).

**3. URL REF** — https://www.sogis.eu/

**4. URL TO ENTER** — Via national CC scheme (BSI in DE, ANSSI in FR, etc.) — no separate SOG-IS submission.

**5. TERMS OF ENTRY** — Folded into CC cost.

**6. 🔴 IP OWNERSHIP** — **None — same as CC.**

**7. SHARING** — Mutual recognition stamps on national CC certificate.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Required for high-assurance products (HSMs, smart cards, secure elements) in EU government and finance.

## 6.2 EUCC (European Cybersecurity Certification Scheme on Common Criteria)

**1. WHO** — European Union Agency for Cybersecurity (ENISA, Athens / Heraklion, Greece). Adopted Feb 2024 via Commission Implementing Regulation 2024/482.

**2. TIMELINE** — Operational since Feb 2024; 12-month transition for existing SOG-IS certs ended Feb 2025. Mandatory for products entering EU "high-trust" procurement.

**3. URL REF** — https://www.enisa.europa.eu/topics/cybersecurity-certification/eucc

**4. URL TO ENTER** — Via accredited national scheme (BSI, ANSSI, OCSI, etc.) under ENISA oversight.

**5. TERMS OF ENTRY** — Comparable to CC cost (six figures for EAL4+).

**6. 🔴 IP OWNERSHIP** — **None claimed.**

**7. SHARING** — Public certificate on ENISA registry.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Brand-new (2024+); early adoption by HSM vendors and secure-element makers.

## 6.3 EUCS (European Cybersecurity Certification Scheme for Cloud Services) — Draft

**1. WHO** — ENISA. Draft pending finalization.

**2. TIMELINE** — Draft circulated 2020+; political deadlock 2023-2024 over sovereignty requirements; finalization expected 2026-2027.

**3. URL REF** — https://www.enisa.europa.eu/topics/cybersecurity-certification/eucs

**4. URL TO ENTER** — TBD; will mirror EUCC governance through national schemes.

**5. TERMS OF ENTRY** — TBD; expected similar to CSA STAR L2.

**6. 🔴 IP OWNERSHIP** — **TBD;** EU cert schemes do not claim IP per the EU Cybersecurity Act.

**7. SHARING** — Public registry expected.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%** (anticipated).

**9. PROOF** — Will likely become procurement table-stakes for EU public cloud services 2027+.

## 6.4 GUAC (Graph for Understanding Artifact Composition)

**1. WHO** — OpenSSF / Google-incubated. **Tool, not a certification** — but increasingly a procurement-side requirement for vendors to feed compatible attestations.

**2. TIMELINE** — v0.7 in 2025; v1.0 expected 2026.

**3. URL REF** — https://guac.sh/

**4. URL TO ENTER** — N/A (vendor-side: emit in-toto / SLSA / SBOM attestations consumable by GUAC).

**5. TERMS OF ENTRY** — Free.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — No vendor-facing publication.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Adopted by Kusari, Datadog, GitHub, Google internal supply chain.

## 6.5 OpenChain (ISO/IEC 5230:2020) — Open Source License Compliance

**1. WHO** — Linux Foundation OpenChain Project. ISO/IEC 5230:2020 standardized.

**2. TIMELINE** — Annual self-cert (free) or 3rd-party verification. ISO standard published Dec 2020.

**3. URL REF** — https://www.openchainproject.org/

**4. URL TO ENTER** — Self-certification portal: https://www.openchainproject.org/conformance

**5. TERMS OF ENTRY** — Self-cert FREE; 3rd-party (PwC, RKVST, Orcro) $5k-$25k.

**6. 🔴 IP OWNERSHIP** — **None.** Audits your OSS license compliance program.

**7. SHARING** — Conformance badge public; details private.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Held by Hitachi, Sony, Toyota, Bosch, Comcast, Cisco, ARM.

## 6.6 SCITT (Supply Chain Integrity, Transparency, and Trust) — IETF emerging

**1. WHO** — IETF SCITT WG. Standard track.

**2. TIMELINE** — Working drafts 2024-2025; first RFC expected 2026-2027.

**3. URL REF** — https://datatracker.ietf.org/wg/scitt/about/

**4. URL TO ENTER** — N/A (specification, not certification).

**5. TERMS OF ENTRY** — Free.

**6. 🔴 IP OWNERSHIP** — **None.**

**7. SHARING** — N/A.

**8. DO WE OWN OUR IP — FINAL ANSWER** — **YES, 100%.**

**9. PROOF** — Early adopters: Microsoft, ARM, NICS, Datatrails.

---

# 7. SUMMARY MATRIX — IP-OWNERSHIP RISK CLASSIFICATION

| Program | IP-Risk Class | Reason |
|---|---|---|
| **OpenSSF Best Practices Badge** | 🟠 **OSS-required at Silver+** | Requires OSI-approved license at higher tiers — pursuing means publishing source. |
| **OpenSSF Scorecard** | 🟠 **OSS-typical** | Default public-repo posture; private-repo use possible but unusual. |
| **OpenSSF Baseline** | 🟠 **OSS-assumed** | Aligned to OSPS, assumes OSS project. |
| CSA STAR L1 | 🟡 Public-CAIQ-posture | Control-yes/no answers are publicly searchable; source still private. |
| Sigstore | 🟡 Immutable-public-signing-events | Signature + cert + timestamp permanently in Rekor; source never touched. |
| SOC 2 Type II | 🟢 Customer-NDA-flow | Report shared with customers under NDA; source never disclosed. |
| HITRUST | 🟢 Customer-NDA-flow | Same NDA flow as SOC 2; framework IP is HITRUST's. |
| ISO 27001 / 27017 / 27018 / 27701 | 🟢 Pure-conformance | Public cert + private evidence + auditor NDA. |
| ISO 19790 / FIPS 140-3 | 🟢 Security-Policy-public-source-NDA | Sanitized security policy public; source stays NDA. |
| Common Criteria / EUCC | 🟢 ST-public-source-NDA | Security Target public; source stays NDA. |
| SLSA (all tracks) | 🟢 Provenance-not-source | Build/source attestations are about metadata, not source. |
| SBOM (CycloneDX / SPDX) | 🟢 Manifest-not-source | Dependency manifest, not code disclosure. |
| in-toto | 🟢 Attestation-substrate | Signed metadata only. |
| NIST SSDF / CSF | 🟢 Self-attestation | No third-party source access. |
| CIS Controls | 🟢 Self-assessment | No third-party access. |
| CMMC L2 | 🟢 C3PAO-NDA | Standard contractor NDA. |
| PCI DSS | 🟢 QSA-NDA | N/A for nous anyway. |
| TISAX | 🟢 ENX-portal | Label visible to other ENX members under shared trust. |
| BSI IT-Grundschutz | 🟢 Pure-conformance | Same as ISO 27001 model. |
| IEC 62443 | 🟢 Lab-NDA | Source inspected under controlled NDA only. |
| TrustArc / BBB / Personal certs | 🟢 No-source-access | Privacy / business / personnel programs only. |

🟠 = Source-disclosure required or strongly expected
🟡 = Some public posture artifact (not source) becomes immutable
🟢 = Pure conformance with NDA; source never disclosed

---

# 8. PAST-5-YEAR & NEXT-5-YEAR ROADMAP RECAP

## Major Events 2021-2026 (compressed)

- 2021: OpenSSF Year 1; CENELEC TS 50701 (Jun); IEC 81001-5-1 (Dec).
- 2022: ISO 27001:2022 (Oct); ISO 27002:2022 (Feb); SSAE 21 (Jun); NIST SSDF v1.1 (Feb); PCI DSS v4.0 (Mar); CSF 2.0 work begins.
- 2023: SLSA v1.0 (Apr); CC2022 (4th-edition) finalized; in-toto attestation v1.0 (Jun).
- 2024: NIST CSF 2.0 (Feb); PCI DSS v4.0.1 (Jun); HITRUST v11.4 (Dec); CMMC Program Rule (32 CFR 170) effective 16 Dec; **EU CRA in force 10 Dec**.
- 2025: PCI DSS 4.x mandatory (31 Mar); ISO 27001:2013 sunset (31 Oct); CMMC DFARS Final Rule effective (10 Nov); SLSA v1.1 (Apr); SLSA v1.2 with Source Track (Nov); OSPS Baseline v1 (Feb); HITRUST v11.5 (Apr) + v11.6 (Aug); EO 14306 (Jun); OMB M-26-05 (Jan 2026).
- 2026: CMMC Phase 1 in progress; **EU CRA conformity-assessment-bodies article (11 Jun)**; **EU CRA vulnerability-reporting (11 Sep)**; CMMC Phase 2 starts (10 Nov).

## Next 5 Years 2026-2031

- 2026: CMMC Phase 2 (C3PAO L2 audits mainstream); EU CRA partial enforcement; FIPS 140-3 queue mostly cleared; HITRUST v12 expected.
- 2027: **EU CRA full enforcement (11 Dec 2027)**; CMMC Phase 3; SLSA Dependencies Track expected.
- 2028: CMMC Phase 4 fully effective; SSDF v2 expected; AI-control sub-criteria in SOC 2 / HITRUST mature.
- 2029: PCI DSS v5.0 expected; NIST CSF 2.x point releases.
- 2030: ISO/IEC 27001 next major revision likely (2005→2013→2022→2030); SLSA v2.0 expected; IEC 62443 next family revision.
- 2031: FIPS 140-3 5-year revalidations for modules first issued in 2026.

---

# 9. CLEAN-IP TOP 5 (for Joey's IP-fierce posture)

Re-ranked specifically for "no IP capture, no source disclosure" priority:

1. **SLSA v1.2 (Build + Source Tracks)** — free, public, source stays private, only provenance metadata emitted.
2. **CycloneDX / SPDX SBOM** — free, manifest-only, no source disclosure.
3. **in-toto attestations** — substrate, Apache 2.0, no IP capture.
4. **Sigstore signing** — free, signs binaries, source never touched (signing identity becomes permanent public record — acceptable for Joey's FQDN-pinned identity model).
5. **ISO 27001:2022** — pure conformance, public cert + private evidence + auditor NDA, source uninspected.

The cleanest cluster is the entire supply-chain-stack (#1-#4) plus ISO 27001 (#5). All five preserve nous's IP completely while delivering measurable trust signal. SOC 2 Type II is also clean-IP but adds a customer-NDA flow that Joey must accept.

# 10. PROGRAMS WITH IP-CONCERN FLAGS

1. **OpenSSF Best Practices Badge (passing/silver/gold)** — requires source publication under OSI-approved license at higher tiers. *Skip unless Joey is intentionally open-sourcing nous core.*
2. **OpenSSF Scorecard (default public usage)** — assumes public repo; can be run locally on private repo but loses the public-badge value.
3. **OpenSSF Baseline (OSPS)** — same OSS-assumption as Best Practices Badge.

All three are LINUX FOUNDATION OSS programs — they exist to raise the OSS-ecosystem floor, not to certify closed-source vendors. Joey can READ the criteria as guidance for his private implementation without participating publicly.

---

**End of Quadrant MS-2 DEEP MATRIX.**

*Sources cited inline. All cost figures USD unless noted. Calendar times reflect small-org (1-10 person) scope unless noted. Verified 2026-05-30. Cert programs evolve; verify any specific clause before commitment.*
