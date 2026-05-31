# MS MASTER TABLE — console-renderable

*Synthesized from MS-1..4 DEEP files · 2026-05-31 · prepared for Joey Castillo (joeycastillo.us, kastil-systems org)*

**Total opportunities: ~201 unique rows** (GOV 48, INDUSTRY 53, COMPETITION 61, GRANT 39). Source bundles (e.g. Netherlands/Italy/Spain/Sweden/Norway summary row in MS-1) split into individual rows where actionable.

**Companion HTML:** `2026-05-31-MS-MASTER-TABLE-all-opportunities.html` (sortable, filterable, color-coded; OPEN THAT FIRST).

```
═══════════════════════════════════════════════════════════════════════════════════════════════════
🔥 URGENT (next 30 days from 2026-05-31)
═══════════════════════════════════════════════════════════════════════════════════════════════════

  · 2026-06-01 12:00 CEST  NLnet NGI Zero Commons Fund (€5-50k+; 🟠 OSS)
  · 2026-06-02             NSF SBIR Project Pitch window opens ($305k; 🟡 20yr SBIR + Bayh-Dole)
  · 2026-06-08             TechCrunch Disrupt Battlefield 200 (FREE; 🟠 ToS perpetual license)
  · 2026-06-10             Innovate UK Cyber Scale closes (£300k; ⚫ UK entity required)
  · 2026-06-19             Black Hat Europe Arsenal CFP closes (FREE; 🔴 OSS-as-entry)
  · 2026-06-19 to 21       Google CTF 2026 (FREE; 🔴 CTF public-writeup norm)
  · 2026-08-05 to 06       Black Hat USA Arsenal event Las Vegas (🔴 OSS-as-entry)
```

═══════════════════════════════════════════════════════════════════════════════════════════════════
QUADRANT: GOVERNMENT CERTIFICATIONS (48 programs)
═══════════════════════════════════════════════════════════════════════════════════════════════════
```
  # │ Name                       │ WHO                       │ Deadline/Next    │ Cost      │ IP │ Own │ Proof
────┼────────────────────────────┼───────────────────────────┼──────────────────┼───────────┼────┼─────┼────────────────────────────────
  1 │ FIPS 140-3 / CMVP          │ NIST + CCCS (US+CA)       │ rolling          │ $50-500k  │ 🟢 │ Y   │ Cisco/Palo/Crowdstrike all hold
  2 │ CAVP / ACVP                │ NIST + CCCS               │ rolling          │ $5-25k    │ 🟢 │ Y   │ >50k certs; FIPS precursor
  3 │ NIAP CC (CCEVS)            │ NSA + NIST (US)           │ CCv3.1 end 27-12 │ $200k-$1M │ 🟢 │ Y   │ ~250 active; CNSSP-11 mandates
  4 │ FedRAMP (Rev5 + 20x)       │ GSA FedRAMP PMO (US)      │ 20x Phase 3 Q4-26│ $100k-$2.5M│ 🟢 │ Y   │ >400 services; AWS/Azure/GCP
  5 │ DoD Impact Levels IL2-6    │ DISA + DoD CIO            │ rolling          │ +$200k-$1M│ 🟢 │ Y   │ AWS/Azure/GCP Gov + Lockheed
  6 │ CMMC 2.0                   │ DoD CIO + Cyber AB        │ Phase 2 Oct 31 26│ $5k-$2.7M │ 🟢 │ Y   │ ~80k DIB firms required
  7 │ NSA CSfC                   │ NSA / IAD                 │ rolling          │ NIAP+FIPS │ 🟡 │ Y*  │ ~80-100 components; Cisco/Aruba (MoA op-obl)
  8 │ DoDIN APL (SUNSET)         │ DISA APCO                 │ sunset 25-09-30  │ —         │ ⚫ │ —   │ Replaced by DISA RME STIG
  9 │ BIS / EAR Encryption Exp.  │ BIS (US Dept of Commerce) │ rolling          │ nominal   │ 🟢 │ Y   │ OpenSSL/LibreSSL/wolfSSL
 10 │ EUCC                       │ EU Comm + ENISA + NCCAs   │ LIVE; CRA Dec 27 │ €150k-€1M │ 🟢 │ Y   │ Art 43 explicit IP protection
 11 │ Germany BSI BSZ+CC+VS-NfD  │ BSI (DE)                  │ rolling; BSZ 3mo │ €50-120k  │ 🟢 │ Y   │ LANCOM/Genua/R&S/Achelos
 12 │ France ANSSI CSPN          │ ANSSI (FR)                │ rolling          │ €15-50k   │ 🟢 │ Y   │ HarfangLab/Palo/Stormshield (8wk)
 13 │ UK NCSC CAPSS              │ NCSC + NPSA (UK)          │ rolling          │ £50-200k  │ 🟢 │ Y   │ Becrypt/BlackBerry SecuSUITE
 14 │ UK NCSC CPA                │ NCSC (UK)                 │ rolling          │ £30-150k  │ 🟢 │ Y   │ Echoworx/BlackBerry
 15 │ UK Cyber Essentials Plus   │ NCSC + IASME (UK)         │ v3.3 Apr 27 2026 │ £1-15k    │ 🟢 │ Y   │ >40k UK orgs (MFA mandatory)
 16 │ Netherlands NSCIB/TrustCB  │ TrustCB (NL)              │ rolling EUCC     │ €150k-€1M │ 🟢 │ Y   │ Smartcard specialty
 17 │ Italy OCSI / ACN           │ ACN (IT)                  │ EUCC since Feb26 │ €150k+    │ 🟢 │ Y   │ Italian national + EUCC
 18 │ Spain CCN-STIC / CPSTIC    │ CCN under CNI (ES)        │ rolling; ENS-req │ varies    │ 🟢 │ Y   │ AWS 25 svcs; CrowdStrike high
 19 │ Sweden CSEC / FMV          │ FMV (SE)                  │ rolling          │ €100k+    │ 🟢 │ Y   │ Active EUCC participant
 20 │ Norway SERTIT / NSM        │ NSM (NO)                  │ rolling          │ €100k+    │ 🟢 │ Y   │ Non-EU; bilateral
 21 │ EUCS Cloud (STALLED)       │ ENISA + EU Comm           │ resumption 2027  │ —         │ ⚫ │ —   │ Stalled - sovereignty deadlock
 22 │ EU Cyber Resilience Act    │ EU Comm DG CONNECT        │ main obl Dec 27  │ varies    │ 🟢 │ Y   │ Every EU-market digital prod
 23 │ Japan JCMVP                │ IPA / NITE (JP)           │ rolling          │ ¥10-25M   │ 🟢 │ Y   │ NTT/Hitachi/Fujitsu/NEC
 24 │ Japan JISEC (CC)           │ IPA (JP)                  │ rolling; CCRA    │ ¥15-50M   │ 🟢 │ Y   │ Fuji Xerox/Konica/Ricoh/Canon
 25 │ South Korea KCMVP          │ NSR / NIS (KR)            │ 128-bit min 2026 │ ₩50-150M  │ 🟢 │ Y*  │ Samsung/LG/Naver (KR algos req'd)
 26 │ South Korea KECS (CC)      │ ITSCC under NIS (KR)      │ rolling          │ ₩100M+    │ 🟢 │ Y   │ Korean CC scheme
 27 │ Singapore SCCS             │ CSA (SG)                  │ CC:2022 Jun 24+  │ SGD 100k+ │ 🟢 │ Y   │ Huawei SG/Samsung Knox/NEC
 28 │ Singapore CLS (IoT label)  │ CSA (SG)                  │ L2 mand 2027     │ nominal   │ 🟢 │ Y   │ Consumer IoT focus
 29 │ Singapore NITES            │ CSA (SG)                  │ gov-only         │ —         │ 🟢 │ Y   │ SG gov-only scheme
 30 │ China OSCCA + MLPS 2.0     │ OSCCA / SCA + SAMR (CN)   │ rolling          │ ¥500k-2M  │ 🔴 │ N   │ NXP only foreign; SKIP mainline
 31 │ India IC3S                 │ STQC / MeitY (IN)         │ rolling; Chair 26│ ₹20-60L   │ 🟢 │ Y   │ BEL/TCS/Cyient — CHEAPEST CCRA
 32 │ Taiwan NICST               │ NICST (TW)                │ consuming only   │ —         │ 🟢 │ Y   │ Recognition only
 33 │ Malaysia MyCC              │ CyberSecurity Malaysia    │ rolling          │ RM 50-150k│ 🟢 │ Y   │ ASEAN entry CC scheme
 34 │ Israel INCD                │ INCD (IL)                 │ org-level certs  │ varies    │ 🟢 │ Y   │ IL vendors use NIAP/EUCC product
 35 │ Canada CCCS (CMVP joint)   │ CCCS / CSE (CA)           │ rolling joint US │ in FIPS   │ 🟢 │ Y   │ Single sub = US+CA — BEST ROI
 36 │ Australia ASD IRAP         │ ASD (AU)                  │ rolling 2-3yr    │ AUD$40-250k│ 🟢 │ Y   │ MS/AWS/GCP/Salesforce/SNow
 37 │ Australia AISEP (CC)       │ ASD (AU)                  │ rolling; AU+NZ   │ $200k+    │ 🟢 │ Y   │ AU/NZ CC scheme
 38 │ NZ GCSB/NCSC — NZISM       │ GCSB (NZ)                 │ consuming only   │ —         │ 🟢 │ Y   │ Prefers AISEP-evaluated
 39 │ Switzerland NCSC.ch / BACS │ BACS (CH)                 │ consuming only   │ —         │ 🟢 │ Y   │ Accepts BSI/ANSSI/CCCS
 40 │ CCRA (mutual recognition)  │ 37 member nations         │ India chairs 26-28│ —        │ 🟢 │ Y   │ Recognizes up to EAL4 cPP
 41 │ SOG-IS MRA                 │ EU/EFTA (14 nations)      │ ceased 26-02-27  │ —         │ 🟢 │ Y   │ Subsumed by EUCC
 42 │ DFARS data-rights (contract)│ DoD (US)                 │ per-contract     │ —         │ 🟡 │ Y*  │ Sell as Commercial Item to keep IP
 43 │ DISA RME Vendor STIG       │ DISA RME                  │ active 2026      │ contract  │ 🟢 │ Y   │ Replaces DoDIN APL contractually
 44 │ EU5G cyber scheme          │ ENISA                     │ STALLED          │ —         │ ⚫ │ —   │ Draft only
 45 │ StateRAMP (US state/local) │ StateRAMP                 │ rolling          │ $150-500k │ 🟢 │ Y   │ Extends FedRAMP for states
 46 │ CC:2022 transition         │ all CCRA schemes          │ STs end 27-12-31 │ —         │ 🟢 │ Y   │ Plan NIAP/EUCC for CC:2022
 47 │ CNSA 2.0 PQC cascade       │ NSA (US)                  │ 2027 sign; 2035  │ absorbed  │ 🟢 │ Y   │ Affects FIPS/NIAP/EUCC/CSfC
 48 │ Türkiye TSE CCRA           │ TSE (TR)                  │ rolling          │ varies    │ 🟢 │ Y   │ Türkiye CC authoring
```

═══════════════════════════════════════════════════════════════════════════════════════════════════
QUADRANT: INDUSTRY CERTIFICATIONS, AUDITS, ATTESTATIONS (53 programs)
═══════════════════════════════════════════════════════════════════════════════════════════════════
```
  # │ Name                       │ WHO                       │ Deadline/Next    │ Cost      │ IP │ Own │ Proof
────┼────────────────────────────┼───────────────────────────┼──────────────────┼───────────┼────┼─────┼────────────────────────────────
 49 │ ISO/IEC 27001:2022 ISMS    │ ISO + IEC (CH)            │ 3-yr; 2013 sunset│ $15-60k Y1│ 🟢 │ Y   │ Microsoft/AWS/Google/Atlassian
 50 │ ISO/IEC 27002:2022         │ ISO + IEC                 │ ref doc          │ $225 PDF  │ 🟢 │ Y   │ Universal companion
 51 │ ISO/IEC 27017:2015 Cloud   │ ISO + IEC                 │ annex 3-yr       │ +$3-8k    │ 🟢 │ Y   │ AWS/Azure/GCP/Box/Dropbox
 52 │ ISO/IEC 27018:2019 PII     │ ISO + IEC                 │ annex 3-yr       │ +$3-8k    │ 🟢 │ Y   │ AWS/Azure/GCP/Salesforce/Adobe
 53 │ ISO/IEC 27701:2025 PIMS    │ ISO + IEC                 │ standalone now   │ $10-30k   │ 🟢 │ Y   │ MS/AWS/Atos/Capgemini/DT
 54 │ ISO 19790 + 24759 Crypto   │ ISO + IEC                 │ 5-yr; queue ~728d│ $80-300k+ │ 🟢 │ Y   │ RSA BSAFE/OpenSSL/MS CNG/Apple
 55 │ ISO 15408 (CC) + 18045     │ ISO + IEC + CCRA          │ CC2022 in flight │ $100-500k+│ 🟢 │ Y   │ Cisco/Juniper/MS Win/Apple iOS
 56 │ ISO 22301:2019 BCM         │ ISO                       │ 3-yr; rev 27-29  │ $8-30k    │ 🟢 │ Y   │ Banks/hospitals/AWS/MS
 57 │ ISO 31000:2018 Risk Mgmt   │ ISO                       │ personal cert    │ exam fee  │ 🟢 │ Y   │ 82 countries adopted
 58 │ ISO 27040:2024 Storage Sec │ ISO + IEC                 │ ref via 27001    │ marginal  │ 🟢 │ Y   │ Dell/NetApp/IBM/HPE
 59 │ SOC 1 Type I & II          │ AICPA (US)                │ annual cycle     │ $15-100k  │ 🟢 │ Y   │ ADP/Paychex/NetSuite/Workday
 60 │ SOC 2 Type I & II          │ AICPA (US)                │ annual; AI 27+   │ $20-45k Y1│ 🟢 │ Y   │ ~98% F500 require — Slack/Stripe
 61 │ SOC 3 (public TSC)         │ AICPA (US)                │ annual Type II   │ +$2-8k    │ 🟢 │ Y   │ AWS/GCP/MS/Salesforce publish
 62 │ SOC for Cybersecurity      │ AICPA (US)                │ annual           │ $25-100k  │ 🟢 │ Y   │ Limited adoption
 63 │ HITRUST CSF (e1/i1/r2)     │ HITRUST Alliance (US)     │ annual; v11.6    │ $60k-$1M+ │ 🟢 │ Y   │ Anthem/Cigna/UHG/Kaiser/Epic
 64 │ CSA STAR L1/L2/L3          │ Cloud Security Alliance   │ L1 free; L2 3yr  │ L1 FREE   │ 🟡 │ Y*  │ ~1,400 CSPs (CAIQ public!)
 65 │ PCI DSS v4.0.1             │ PCI SSC (US)              │ annual; v5 ~28   │ $1k-$500k │ 🟢 │ Y   │ Stripe/Square/Adyen/PayPal
 66 │ PCI 3DS/P2PE/PIN           │ PCI SSC                   │ annual           │ $50-500k+ │ 🟢 │ Y   │ Stripe Terminal/Verifone
 67 │ HIPAA + HITECH attestation │ HHS OCR + industry        │ annual           │ $10-50k   │ 🟢 │ Y   │ Epic/Cerner/Athenahealth
 68 │ NIST CSF 2.0               │ NIST (US)                 │ voluntary; 2.0   │ FREE-$50k │ 🟢 │ Y   │ JPM/BoA/utilities/F500
 69 │ NIST 800-171 + CMMC 2.0    │ NIST + DoD CIO            │ Phase 2 Nov 26   │ $3.5k-300k│ 🟢 │ Y   │ ~200k DIB; Lockheed/RTX/Boeing
 70 │ NIST SP 800-53 R5          │ NIST (US)                 │ R5.1.1 Dec 23    │ free      │ 🟢 │ Y   │ Foundation for all fed auth
 71 │ CIS Controls v8.1 IG1/2/3  │ Center for Internet Sec   │ v8.1 Jun 24      │ FREE-$25k │ 🟢 │ Y   │ USAA/AARP/Sprint/Verizon
 72 │ COBIT 2019 (ISACA)         │ ISACA (US)                │ 3-yr CPE         │ $175-800  │ 🟢 │ Y   │ ~50k individuals globally
 73 │ BSI IT-Grundschutz         │ BSI (DE)                  │ 3-yr cycle       │ 27001+30% │ 🟢 │ Y   │ DT/SAP/Siemens/Bosch/VW IT
 74 │ TISAX                      │ ENX Association (DE auto) │ 3-yr label       │ €30-80k AL2│ 🟢 │ Y   │ VW/BMW/Mercedes/Stellantis/Ford
 75 │ IEC 62443 (IACS)           │ IEC + ISA + ASCI          │ 3-yr; surv ann   │ $30-250k  │ 🟢 │ Y   │ Siemens/Schneider/Rockwell/ABB
 76 │ CENELEC TS 50701 (Rail)    │ CENELEC TC9X WG26 (BE)    │ EN 50701 26-27   │ six figs  │ 🟢 │ Y   │ Alstom/Siemens Mobility/Hitachi
 77 │ IEC 81001-5-1 (Med SW Sec) │ IEC                       │ mandatory 24-26  │ $30-150k+ │ 🟢 │ Y   │ Philips/GE/Medtronic/Boston Sci
 78 │ OpenSSF Best Practices Bdg │ OpenSSF / Linux Foundation│ continuous       │ FREE      │ 🟠 │ Y*  │ curl/OpenSSL/k8s — OSS req'd Silver+
 79 │ OpenSSF Scorecard          │ OpenSSF / LF              │ weekly autoscan  │ FREE      │ 🟠 │ Y*  │ MS/Google/Intel/AWS use to vet OSS
 80 │ SLSA Build + Source Tracks │ OpenSSF                   │ v1.2 Nov 2025    │ FREE      │ 🟢 │ Y   │ Google/MS/Intel/LF projects
 81 │ NIST SSDF + CISA attest    │ NIST + CISA               │ SSDF v2 27-28    │ FREE-$50k │ 🟢 │ Y   │ MS/Google/AWS/Salesforce/Oracle
 82 │ CycloneDX / SPDX SBOM      │ OWASP + LF (ISO 5962)     │ CRA enforce 12-27│ FREE      │ 🟢 │ Y   │ EO 14028; FDA 524B; EU CRA
 83 │ OpenSSF Baseline L1/2/3    │ OpenSSF                   │ v1 Feb 2025      │ FREE      │ 🟠 │ Y*  │ Sigstore/in-toto/SLSA early
 84 │ in-toto Attestation        │ CNCF Graduated (NYU)      │ v1.0 Jun 23      │ FREE      │ 🟢 │ Y   │ SLSA/Sigstore/k8s/Tekton/GUAC
 85 │ Sigstore (Cosign/Rekor)    │ Sigstore / OpenSSF / LF   │ GA Oct 2022      │ FREE      │ 🟡 │ Y*  │ k8s/npm/PyPI/Maven/RubyGems (Rekor immutable)
 86 │ TrustArc Privacy           │ TrustArc Inc (US)         │ annual renew     │ $10-137k  │ 🟢 │ Y   │ Cisco/Mastercard/Wyndham
 87 │ BBB Accredited Business    │ Better Business Bureau    │ annual           │ $0.5-1.5k │ 🟢 │ Y   │ Consumer-trust; weak B2B
 88 │ CISSP (ISC²)               │ (ISC)²                    │ 3-yr + CPE       │ $760      │ 🟢 │ Y   │ ~150k CISSPs; near-univ CISO
 89 │ CISM / CISA / CSX-A (ISACA)│ ISACA                     │ 3-yr + CPE       │ $399-760  │ 🟢 │ Y   │ Auditor/Manager track
 90 │ GUAC (graph artifact comp.)│ OpenSSF / Google          │ v1.0 expected 26 │ FREE      │ 🟢 │ Y   │ Kusari/Datadog/GitHub/Google
 91 │ OpenChain (ISO 5230)       │ LF OpenChain Project      │ annual           │ FREE-$25k │ 🟢 │ Y   │ Hitachi/Sony/Toyota/Bosch/Cisco
 92 │ SCITT (IETF)               │ IETF SCITT WG             │ RFC 26-27        │ FREE      │ 🟢 │ Y   │ MS/ARM/NICS/Datatrails early
 93 │ ISO 42001 AI Mgmt          │ ISO + IEC                 │ Dec 23+; rising  │ $15-50k   │ 🟢 │ Y   │ Microsoft/Anthropic early
 94 │ NIST AI RMF                │ NIST (US)                 │ v1.0 Jan 23      │ FREE      │ 🟢 │ Y   │ F500 AI risk programs
 95 │ FedRAMP Tailored low-impact│ GSA                       │ simplified       │ $100-300k │ 🟢 │ Y   │ Low-impact SaaS path
 96 │ SSAE 18/21 SOC framework   │ AICPA                     │ SSAE 21 Jun 22+  │ in SOC fee│ 🟢 │ Y   │ Underlying SOC standard
 97 │ UL 2900 connected products │ UL Solutions (US)         │ per device fam   │ $30-150k  │ 🟢 │ Y   │ Med/network/auto segments
 98 │ ETSI EN 303 645 Cons IoT   │ ETSI (EU)                 │ CRA-aligned      │ $10-50k   │ 🟢 │ Y   │ EU IoT baseline; CE-adjacent
 99 │ StateRAMP (industry-side)  │ StateRAMP                 │ annual ConMon    │ $150-500k │ 🟢 │ Y   │ Extends FedRAMP state/local
100 │ OWASP ASVS                 │ OWASP                     │ v4.0.3; v5 dev   │ FREE      │ 🟢 │ Y   │ Most pen-test firms use
101 │ CREST (UK pen-test accred) │ CREST (UK)                │ 3-yr cycle       │ £5-25k    │ 🟢 │ Y   │ UK/global pen-test firms
```

═══════════════════════════════════════════════════════════════════════════════════════════════════
QUADRANT: COMPETITIONS, PRIZES, AWARDS (61 programs)
═══════════════════════════════════════════════════════════════════════════════════════════════════
```
  # │ Name                       │ WHO                       │ Deadline/Next    │ Cost      │ IP │ Own │ Proof
────┼────────────────────────────┼───────────────────────────┼──────────────────┼───────────┼────┼─────┼────────────────────────────────
102 │ RSAC Innovation Sandbox    │ RSAC LLC (Crosspoint Cap) │ subs Oct/Nov 26  │ FREE+$5MSAFE│ 🟠 │ Y*  │ Wiz→$32B Google; Talon→$625M PAN
103 │ RSAC Launch Pad            │ RSAC LLC                  │ annual           │ FREE      │ 🟠 │ Y*  │ Same RSAC cohort visibility
104 │ TC Disrupt Battlefield 200 │ TechCrunch (Yahoo/Apollo) │ 🔥 June 8 2026   │ FREE      │ 🟠 │ Y*  │ 1,500+ alumni; $29B raised
105 │ Y Combinator S26/W27       │ YC Management LLC         │ rolling/2x yr    │ $500k/7%  │ 🟠 │ Y*  │ Airbnb/Stripe/Doordash/Coinbase
106 │ Pwn2Own Berlin (all eds)   │ Trend Micro ZDI           │ Berlin May 27    │ reg fee   │ 🔴 │ N   │ Berlin 2026: $1.298M/47 0-days
107 │ NIST PQC (algo submission) │ NIST Comp Sec Div         │ R3 sigs May 26+  │ FREE      │ 🔴 │ N   │ Kyber/Dilithium/SPHINCS+/Falcon
108 │ NIST IR 8214C Threshold    │ NIST MPTC                 │ subs into 2027   │ FREE      │ 🟡 │ Y*  │ First formal threshold call
109 │ EFF Awards (Pioneer)       │ EFF                       │ noms summer 26   │ FREE      │ 🟢 │ Y   │ Swartz/TimBL/Snowden journos/Zimmermann
110 │ Pwnie Awards (BH/DC)       │ Pwnie Committee           │ noms May-Jun 26  │ FREE      │ 🟢 │ Y   │ Kaminsky/Schneier/Hutchins
111 │ SANS Difference Makers     │ SANS Institute (US)       │ noms summer 26   │ FREE      │ 🟢 │ Y   │ Mandiant FLARE/Volatility
112 │ ISC2 Global Achievement    │ ISC2                      │ noms Apr 27; Oct 26│ FREE    │ 🟢 │ Y   │ ~150k CISSP; Mid-Career fits Joey
113 │ Levchin Prize (RWC)        │ RWC / IACR                │ at RWC 2027 Mar  │ —         │ 🟢 │ Y   │ Let's Encrypt; Diffie-Hellman 50th
114 │ USENIX Sec Distinguished   │ USENIX                    │ Sec'27 deadlines │ FREE      │ 🟢 │ Y   │ Tor/Signal/Heartbleed/Spectre
115 │ IEEE S&P Distinguished     │ IEEE Computer Soc TC      │ S&P 2027 May     │ conf fees │ 🟠 │ Y*  │ Distinguished alumni 1000+ cites
116 │ NDSS Distinguished Paper   │ Internet Society          │ NDSS 2027 CFP    │ conf fees │ 🟠 │ Y*  │ Bro/Zeek; Sybil defenses
117 │ IACR Crypto/Eurocrypt/Asia │ IACR                      │ rotating annual  │ conf fees │ 🟠 │ Y*  │ Diffie/Hellman/RSA lineage
118 │ Real World Crypto talk     │ IACR / RWC                │ CFP Dec 2026     │ FREE      │ 🟢 │ Y   │ Best eng-crypto audience
119 │ ACM CCS Best Paper         │ ACM SIGSAC                │ annual cycles    │ conf fees │ 🟠 │ Y*  │ Spectre 2018; Meltdown 2018
120 │ Black Hat Arsenal USA/EU   │ Black Hat (Informa)       │ USA Aug 5-6 26   │ FREE      │ 🔴 │ Y*  │ BloodHound→$33M; Mimikatz
121 │ DEF CON CTF (BBoB)         │ Benev Bureau of Birds     │ DC34 May 22-24   │ FREE      │ 🔴 │ N   │ PPP/DEFKOR00T/Mayhem (CGC 2016)
122 │ Plaid CTF (PPP/CMU)        │ Plaid Parliament Pwning   │ annual spring    │ FREE      │ 🔴 │ N   │ CMU academic network
123 │ Google CTF 2026            │ Google                    │ 🔥 Jun 19-21 26  │ FREE      │ 🔴 │ N   │ Google recruiter visibility
124 │ HITCON CTF (Taiwan)        │ HITCON                    │ quals summer     │ FREE      │ 🔴 │ N   │ APAC credibility
125 │ UCSB iCTF                  │ UCSB (NSF-sponsored)      │ annual spring    │ FREE      │ 🔴 │ N   │ DARPA/NSF network
126 │ Hack the Pentagon / DoD VDP│ DoD CDAO + H1/Synack/BC   │ continuous       │ bounty    │ 🔴 │ N   │ >2,100 bugs across 40+ bounties
127 │ NSA Codebreaker Challenge  │ NSA                       │ Sep 2026 opens   │ FREE (.edu)│ 🟡 │ N/A │ GA Tech 5x; Joey ineligible
128 │ Hack-A-Sat AFRL+Aerospace  │ AFRL + Aerospace Village  │ monitor DC34     │ FREE      │ 🟡 │ Y*  │ Solar Wine/Poland Can/mHACKeroni
129 │ CSAW ESC NYU Embedded Sec  │ NYU CCS + global partners │ annual Nov       │ FREE      │ 🔴 │ N   │ Blue Team full disclosure
130 │ picoCTF CMU CyLab          │ CMU CyLab                 │ Mar 2027 14th    │ FREE stud │ 🟢 │ Y   │ 250k+ alumni; HS/college funnel
131 │ HackTheBox Business CTF    │ Hack The Box (GR)         │ annual May       │ varies    │ 🟢 │ Y   │ Corp teams MS/Lockheed
132 │ TryHackMe                  │ TryHackMe (UK)            │ continuous       │ varies    │ 🟢 │ Y   │ Lower prestige; training
133 │ SC Awards (CyberRisk Alli) │ CyberRisk Alliance        │ summer 26 opens  │ $400-625  │ 🟠 │ Y   │ 33 categories; mid-tier
134 │ Cybersecurity Excellence   │ Cybersecurity Insiders    │ summer 26 opens  │ entry fee │ 🟠 │ Y*  │ 500+ winners since inception
135 │ Fortress Cyber (BIG)       │ Business Intelligence Grp │ annual           │ $949      │ 🟠 │ Y   │ Foundever 2025
136 │ Tech Ascension Awards      │ Tech Ascension            │ annual           │ $550      │ 🟠 │ Y   │ Lowest prestige trade
137 │ OpenSSF Alpha-Omega grant  │ LF OpenSSF + 8 partners   │ continuous       │ $150-900k │ 🔴 │ Y*  │ OpenJS $580k; Eclipse $800k (OSS)
138 │ OWASP Project Awards       │ OWASP Foundation          │ continuous       │ FREE+donate│ 🟡 │ Y*  │ ZAP/Top 10/Dependency-Track
139 │ Linux Foundation HoF       │ Linux Foundation          │ honorary         │ —         │ 🟢 │ Y   │ LF ecosystem contributors
140 │ FSF Free Software Awards   │ Free Software Foundation  │ noms Nov 2026    │ FREE      │ 🟢 │ Y*  │ Kuhn/Sandler/SFC (FSF-free req)
141 │ XPRIZE (no cyber active)   │ XPRIZE Foundation         │ no 2026 cyber    │ —         │ 🟡 │ N/A │ Quantum/Healthspan active
142 │ Build-with-Gemini XPRIZE   │ Google + XPRIZE           │ 5 categories     │ FREE      │ 🟠 │ Y*  │ Indirect for nous
143 │ Marconi Prize              │ Marconi Society           │ annual fall      │ —         │ 🟢 │ Y   │ 2026 Calderbank Duke
144 │ ACM Turing Award           │ ACM                       │ annual           │ —         │ 🟢 │ Y   │ Diffie/Hellman; RSA; "Nobel of CS"
145 │ Gödel Prize                │ EATCS + ACM SIGACT        │ annual           │ ~$5k      │ 🟢 │ Y   │ Theoretical-CS-impact
146 │ DARPA AIxCC (CLOSED)       │ DARPA + ARPA-H + AI labs  │ pattern reference│ multi-$M  │ 🔴 │ N   │ Team Atlanta $4M; Trail of Bits $3M
147 │ DARPA Cyber Grand Challenge│ DARPA                     │ historical 2016  │ multi-$M  │ 🔴 │ N   │ Mayhem $2M 2016
148 │ Underhanded C (DORMANT)    │ volunteer organizers      │ dormant          │ FREE      │ 🟢 │ Y   │ Joey-shaped if revived
149 │ Cybertech Global Tel Aviv  │ Cybertech Israel          │ Jan 2027         │ varies    │ 🟡 │ Y   │ IL VCs $8.27B cyber 2025
150 │ Singapore CSA SME / Cyber  │ CSA Singapore             │ per call         │ —         │ 🟡 │ Y*  │ pQCee post-quantum PKI funded
151 │ Japan IPA / JC-STAR        │ IPA Japan                 │ annual           │ varies    │ 🟡 │ Y   │ APAC procurement door
152 │ UK Cyber Startup Award     │ NCSC + Plexal             │ Infosec EU Jun 2 │ FREE      │ 🟡 │ Y   │ NCSC accelerator alumni
153 │ Intl Cyber Challenge (ICC) │ ENISA-coordinated         │ annual           │ FREE      │ 🟡 │ N/A │ EU youth talent funnel (<25)
154 │ ENISA Cyber Skills Conf    │ ENISA                     │ Nov 4-5 26 Larnaca│ FREE     │ 🟡 │ Y   │ EU recognition forum
155 │ Notable Capital Rising Cyb │ Notable Capital           │ late spring 2027 │ FREE      │ 🟡 │ Y   │ 30 most-promising private startups
156 │ Cyber Investing Summit     │ Cyber Investing Summit    │ annual           │ varies    │ 🟡 │ Y   │ Investor + CISO intro
157 │ Cyber Innovation Awards    │ cyberinnovationawards.com │ annual           │ entry fee │ 🟠 │ Y   │ 2026 Vigilance Security
158 │ Cyber Defense Awards       │ cyberdefenseawards.com    │ annual (14 yrs)  │ entry fee │ 🟠 │ Y   │ Mid-tier badge
159 │ Cybersecurity Awards (GRA) │ globalrecognitionawards   │ annual           │ entry fee │ 🟠 │ Y   │ Lowest prestige
160 │ Pwn2Own ICS / SCADA at S4  │ Trend Micro ZDI           │ S4x27 Jan 2027   │ reg       │ 🔴 │ N   │ ~27 zero-days/$150k+
161 │ Pwn2Own Auto Tokyo         │ Trend Micro ZDI           │ Jan 2027         │ reg       │ 🔴 │ N   │ Tesla $500k + car
162 │ Pwn2Own Ireland (mobile)   │ Trend Micro ZDI           │ Oct 2026         │ reg       │ 🔴 │ N   │ $1M+ purses
```

═══════════════════════════════════════════════════════════════════════════════════════════════════
QUADRANT: GRANTS & FREE MONEY (39 programs)
═══════════════════════════════════════════════════════════════════════════════════════════════════
```
  # │ Name                       │ WHO                       │ Deadline/Next    │ Cost      │ IP │ Own │ Proof
────┼────────────────────────────┼───────────────────────────┼──────────────────┼───────────┼────┼─────┼────────────────────────────────
163 │ NLnet NGI Zero Commons     │ Stichting NLnet + EC      │ 🔥 2026-06-01    │ €5-50k+   │ 🟠 │ Y*  │ Mar 26: 44 proj; Apr 26: 57; curl/LinuxBoot
164 │ NLnet NGI Zero Core/Entrust│ NLnet                     │ rolling 2-mo     │ €50-150k  │ 🟠 │ Y*  │ Security focus Entrust subfund
165 │ Sovereign Tech Agency DE   │ STA (SPRIND/BMWK) + EC    │ rolling 3-6mo    │ €50k-€1M+ │ 🟠 │ Y*  │ GNOME €1M; KDE €1.29M; Rustls €1.44M
166 │ NSF SBIR Phase I/II Cyber  │ NSF TIP                   │ 🔥 Pitch Jun 2 26│ $305k/$1.25M│ 🟡 │ Y   │ Trail of Bits/ForAllSecure/Galois
167 │ NSF SaTC 2.0               │ NSF CISE+MPS+SBE+EHR      │ next Jan 2027    │ up to $1.2M│ 🟡 │ Y*  │ ~75/yr; CMU/MIT/Stanford
168 │ NSF EAGER/Convergence Acc. │ NSF                       │ rolling concept  │ $400k-$5M │ 🟡 │ Y   │ Convergence Accelerator cohorts
169 │ NIST SBIR                  │ NIST                      │ annual NOFO Q1   │ ~$400k    │ 🟡 │ Y   │ NIST SBIR cohorts
170 │ DOE CESER                  │ DOE                       │ per-FOA          │ up $3M    │ 🟡 │ Y   │ Schweitzer/GE Vernova/INL
171 │ DHS S&T SVIP (OTA)         │ DHS S&T                   │ topic calls qtr  │ up $2M    │ 🟡 │ Y*  │ Hyperledger/Spruce/Mavennet
172 │ AFRL / ARL / ONR LRBAA     │ DoD service labs          │ rolling thru 27  │ $0.5-10M  │ 🟡 │ Y*  │ AFRL Agile Cyber Tech 3 $950M
173 │ DARPA I2O BAA (HARDEN/ING) │ DARPA I2O                 │ rolling          │ $0.5-15M  │ 🟢 │ Y   │ HARDEN $5-15M/team; AIxCC alumni
174 │ OpenSSF Alpha-Omega        │ LF OpenSSF + 8 partners   │ rolling +$12.5M  │ $150-900k │ 🟠 │ Y*  │ OpenJS/Eclipse/Ruby/Rust cohort
175 │ OTF Internet Freedom Fund  │ Open Tech Fund (USAGM)    │ rolling concept  │ $10-900k  │ 🟠 │ Y*  │ Signal/Tor/OONI/Briar/Tails
176 │ GitHub Secure OSS Fund     │ GitHub (Microsoft)        │ Sep 2026 cohort  │ $10k+10k Az│ 🟠 │ Y*  │ 2025: $1.25M / 125 projects
177 │ Mozilla MTF / Fellowship   │ Mozilla Foundation        │ periodic         │ $50k     │ 🟠 │ Y*  │ MOSS funded TLS / Tor
178 │ NGI Sargasso (EU↔US/CA)    │ EC + ESF consortium       │ OC5 H2 2026      │ up €100k  │ 🟠 │ Y*  │ Transatlantic NGI funding
179 │ NGI TrustChain             │ EC consortium             │ OC3+ late 26     │ up €200k  │ 🟠 │ Y*  │ Trust-infra third-party funding
180 │ Sloan OSS in Science       │ Sloan Foundation          │ LOI rolling      │ up $750k  │ 🟠 │ Y*  │ University OSPO collabs
181 │ Knight News Challenge      │ Knight Foundation         │ periodic         │ varies    │ 🟠 │ Y*  │ GPL software + CC docs req
182 │ Vinnova AI+Cyber (SE)      │ Vinnova                   │ annual April     │ 1-10M SEK │ 🟠 │ Y*  │ SE entity required
183 │ Horizon Europe Cluster 3   │ EU Comm DG HOME + ECCC    │ 🔥 Sep 15/Nov 5 26│ €2-10M  │ 🟡 │ Y*  │ 20+ consortia avg €5-7M/call
184 │ EIC Accelerator            │ European Innov Council    │ 2-mo evals       │ €2.5M+€10M│ 🔴 │ N   │ EU entity + equity dilution
185 │ MACH37 / DataTribe         │ VC-style accelerators     │ cohorts          │ $50-100k/5%│ 🔴 │ N   │ Cyber accelerator equity
186 │ BIRD Cyber (US-Israel)     │ BIRD Foundation           │ annual; 2026 $7.5M│ up $1.5M │ 🔴 │ Y*  │ 30% rev royalty up to 150% (US+IL)
187 │ EU EDF Cyber               │ EU Commission             │ annual           │ varies    │ ⚫ │ N   │ EU-only
188 │ Singapore CSA CCDF         │ CSA Singapore             │ Apr-May 26 closed│ up S$1M   │ ⚫ │ N   │ IP must move to SG; pQCee funded
189 │ Israel IIA R&D             │ IIA                       │ rolling          │ 20-50% R&D│ ⚫ │ N   │ IL-registered only
190 │ Innovate UK Cyber Scale    │ UKRI / Innovate UK        │ 🔥 closes Jun 10 │ up £300k  │ ⚫ │ N   │ UK-registered required
191 │ Ford Foundation BUILD      │ Ford Foundation           │ invitation only  │ multi-yr  │ 🟢 │ Y   │ CC BY 4.0 docs; code unconstrained
192 │ Schmidt Sciences Trust AI  │ Schmidt Sciences          │ 2026 program     │ up $5M+   │ 🟡 │ Y*  │ University-PI typical
193 │ Sloan Better Sw for Sci    │ Sloan Foundation          │ LOI rolling      │ up $750k  │ 🟠 │ Y*  │ OSS + university PI
194 │ NSF Strategic Breakthrough │ NSF (2026 reauth)         │ FY27 first call  │ $30M pool │ 🟡 │ Y   │ NEW for SBIR-II grads
195 │ EU Sovereign Tech Fund     │ OpenForum Europe + EC     │ proposal stage   │ EU-scale  │ 🟠 │ Y*  │ Expansion of German STF model
196 │ ARDC (Amateur Radio DC)    │ ARDC private foundation   │ rolling Feb prio │ $50-500k  │ 🟢 │ Y   │ Mesh/digital comms infra
197 │ Anthropic Responsible Scal.│ Anthropic                 │ continuous       │ $25-250k  │ 🟡 │ Y   │ AI-safety research
198 │ OpenAI Cyber Grant         │ OpenAI                    │ continuous       │ $10-100k  │ 🟡 │ Y   │ Defensive cyber + AI
199 │ LF Public Health / LF Res. │ Linux Foundation          │ periodic         │ varies    │ 🟠 │ Y*  │ LF ecosystem research
200 │ Bloomberg Tech Lab         │ Bloomberg                 │ invitation       │ varies    │ 🟡 │ Y   │ Track for future fit
201 │ Apple Security Research Dv │ Apple                     │ Fall 2026 window │ device    │ 🟡 │ Y*  │ iOS research device program
```

═══════════════════════════════════════════════════════════════════════════════════════════════════
LEGEND
═══════════════════════════════════════════════════════════════════════════════════════════════════

IP traffic-light:
  🟢 = no IP claim, no publication, conformance-only
  🟡 = retains IP + funder/gov gets non-commercial license (Bayh-Dole etc)
  🟠 = retains IP but project must be OSS-published OR mild publication req
  🔴 = IP transfer, AI-training language, equity-bearing pretending not to be
  ⚫ = geographically/structurally walled (need foreign entity to apply)

Own IP?
  Y    = full retention
  Y*   = retains underlying IP but with caveat (OSS scope / customer-NDA / etc.)
  N    = IP transfers OR fundamentally requires giving up exclusive use
  N/A  = not applicable / ineligible

Dash (—) = field genuinely empty / unknown in source. Not "N/A".

═══════════════════════════════════════════════════════════════════════════════════════════════════
TOP-5 🟢 GREENS (enter freely)
═══════════════════════════════════════════════════════════════════════════════════════════════════

  #2   CAVP / ACVP — cleanest cert on earth; pure algo conformance, FIPS precursor
  #1   FIPS 140-3 / CMVP (joint US+CA) — single submission, two governments
  #10  EUCC — Article 43 verbatim mandates IP-rights protection
  #166 NSF SBIR Project Pitch (June 2 window) — 20-yr SBIR data rights, Bayh-Dole
  #109 EFF Awards — pure recognition, perfect ethos fit, zero contract

═══════════════════════════════════════════════════════════════════════════════════════════════════
TOP-3 🔴 REDS (avoid until ready)
═══════════════════════════════════════════════════════════════════════════════════════════════════

  #30  China OSCCA / MLPS — PRC Cryptography Law allows source-code inspection
  #107 NIST PQC (algorithm submission) — algorithm becomes public-domain forever
  #106 Pwn2Own (all editions, as contestant) — exploits + IP become Sponsor property

═══════════════════════════════════════════════════════════════════════════════════════════════════
END OF MASTER TABLE
═══════════════════════════════════════════════════════════════════════════════════════════════════

Companion HTML (sortable, color-coded, ctrl-F friendly):
  C:\audit-of-all\be\plans\2026-05-31-MS-MASTER-TABLE-all-opportunities.html
