# Michelin-Star Quadrant 3 — Competitions, Prizes, Recognitions, Awards (Worldwide)

> Deep research for Joey Castillo (joeycastillo.us / kastil-systems).
> Target product: a private-PKI / machine-identity / zero-trust mesh built in pure C99
> with no external dependencies (libsecurity.a ~900 LOC). "Know the rules and know the game."

**Date:** 2026-05-30
**Author:** metal console research agent
**Scope:** every meaningful competition, prize, sandbox, sponsored challenge, or recognition channel a
security/cryptography/zero-trust product (or its sole founder) can enter for credibility, prize money,
government attention, or "star power."

---

## How to read this report

Each entry is normalized to **8 fields**:

1. **Name + organizer**
2. **What it is** (CTF / awards / standardization / sandbox / prize)
3. **Prize/recognition value** (cash, exposure, RFP qualification, etc.)
4. **Eligibility for nous / Joey** (sole founder, private repo, pure C, no public release yet) — Y/N + caveats
5. **Application / entry process**
6. **Calendar** (2026 dates + when 2026 cycle opens)
7. **Strategic value**
8. **Sources** (current official URL + most recent winners list)

Closing section ranks the **top 5 to enter first**.

---

# I. ATTACK-SIDE COMPETITIONS

These are the "your product is the target" world. Winning = your product survived. Getting popped = free pen-test + a roadmap.

## 1.1 Pwn2Own Berlin (Trend Micro / Zero Day Initiative)
1. **Organizer:** Trend Micro ZDI, held at OffensiveCon, Berlin.
2. **What:** Live exploitation contest. Researchers register against a published target list; full RCE / sandbox escape / EoP within 30 min = cash + the device.
3. **Prize:** $1M+ pool in 2026; e.g., Hyper-V guest-to-host $250K, VMware ESXi $150K. Day-one 2026 paid $523K. ([Pwn2Own Berlin 2026 rules](https://www.zerodayinitiative.com/Pwn2OwnBerlin2026Rules.html), [Day-one writeup](https://securityaffairs.com/192183/hacking/pwn2own-berlin-2026-day-one-523000-paid-out-ai-products-fall.html))
4. **Eligibility for nous:** Y as a **vendor that submits its own product to be a target**. ZDI accepts target nominations and increasingly hosts new categories (AI Database, Coding Agents, Local Inference were added in 2026). nous would need to propose a new category ("private-PKI mesh" or "zero-trust identity broker") with a meaningful cash incentive — historically expensive and aspirational. Contestants can't be a Trend Micro affiliate. ([Berlin 2026 announcement](https://www.thezdi.com/blog/2026/3/11/announcing-pwn2own-berlin-for-2026))
5. **Process:** Vendor sponsorship channel through ZDI (target proposal + funded prize); contestant channel is registration questionnaire + per-target case form, closed early May for the May contest.
6. **Calendar:** Berlin 2026 happened May 14–16 (registration closed May 7). Berlin 2027 announcement typically March 2027. Tokyo (Pwn2Own Automotive) runs in January. Pwn2Own Ireland runs in October.
7. **Strategic value:** Single biggest credibility lever in offensive security. Being a sponsored target = "we're confident enough to put $250K on the table." Even being a non-prizewinning target generates extensive media coverage. Submit nous to a **future Berlin cycle** once it has a public stable release; the categories Trend Micro is bullish on (AI, identity, agentic systems) align with nous's "machine identity for agent meshes" angle.
8. **Sources:** [Pwn2Own Wikipedia](https://en.wikipedia.org/wiki/Pwn2Own), [Berlin 2026 rules](https://www.zerodayinitiative.com/Pwn2OwnBerlin2026Rules.html), [Day-one results](https://securityaffairs.com/192183/hacking/pwn2own-berlin-2026-day-one-523000-paid-out-ai-products-fall.html), [Cybernews $1.3M wrap](https://cybernews.com/security/pwn2own-berlin-hackathon-awards/)

## 1.2 Pwn2Own Automotive (Trend Micro / VicOne)
1. **Organizer:** Trend Micro ZDI with VicOne, Tokyo, January, Automotive World event.
2. **What:** Same format, EV-stack focus.
3. **Prize:** $3M+ pool in 2026. Tesla category up to $500K plus the car. ([SecurityWeek $3M](https://www.securityweek.com/over-3-million-in-prizes-offered-at-pwn2own-automotive-2026/), [Auto 2026 rules](https://www.zerodayinitiative.com/Pwn2OwnAuto2026Rules.html))
4. **Eligibility for nous:** Indirect today; direct if nous targets EV charger / IVI identity. The Open Charge Alliance and EV-charger categories are areas where machine-identity mesh would be a credible vendor sponsorship.
5. **Process:** Vendor target proposal via ZDI; contestant registration similar to Berlin.
6. **Calendar:** Tokyo January 2027 cycle opens autumn 2026.
7. **Strategic value:** Strategic alignment with The AI Pantheon's silicon/runtime ambitions. EV-charger mesh = high-leverage early customer (auto OEMs, charging networks).
8. **Sources:** [VicOne Auto 2026](https://vicone.com/blog/pwn2own-automotive-2026-gears-up-rules-targets-and-whats-new)

## 1.3 Pwn2Own ICS / SCADA (Trend Micro at S4)
1. **Organizer:** Trend Micro ZDI at the S4 conference, Miami Beach (January).
2. **What:** ICS/SCADA RCE / sandbox-escape contest.
3. **Prize:** Recent edition disclosed 27 zero-days for ~$150K+. ([Trend Micro ZDI 2025 review](https://www.trendmicro.com/en_us/zero-day-initiative/pwn2own.html))
4. **Eligibility:** Indirect (nous isn't ICS) — but identity-broker layer for OT networks is a credible angle for a future category sponsorship.
5. **Process:** ZDI target nomination cycle each autumn.
6. **Calendar:** S4x27 January 2027.
7. **Strategic value:** Government OT/ICS attention. Aerospace + critical infrastructure RFPs.
8. **Sources:** [S4 Pwn2Own](https://s4xevents.com/pwn2own/)

## 1.4 DEF CON CTF (Benevolent Bureau of Birds, 2026–)
1. **Organizer:** Benevolent Bureau of Birds (took over from Nautilus Institute starting DC34).
2. **What:** The world's most prestigious attack-defense CTF. Quals online, finals in Las Vegas.
3. **Prize:** Honor + black badge (lifetime free DEF CON). Prestige > cash.
4. **Eligibility for nous:** Joey could attempt to **enter** as a small team (open quals are anyone-can-play). nous as a product is not the target.
5. **Process:** Open quals registration via CTFtime.
6. **Calendar:** DC34 quals **May 22–24, 2026**. Finals August 2026 at DEF CON, Las Vegas. ([CTFtime DC2026 quals](https://ctftime.org/event/3205/))
7. **Strategic value:** Top-5 finish = inner-circle credibility with the world's best offensive researchers. Even quals participation associates the nous brand with serious players.
8. **Sources:** [DEF CON CTF archive](https://defcon.org/html/links/dc-ctf.html), [Nautilus historical](https://nautilus.institute/)

## 1.5 Plaid CTF (CMU's PPP)
1. **Organizer:** Plaid Parliament of Pwning, Carnegie Mellon.
2. **What:** Jeopardy CTF run by one of the most decorated college teams. Annual one-weekend competition.
3. **Prize:** Cash + invite to participate, academic prestige.
4. **Eligibility:** Open globally. Solo registration possible but team-of-3+ is realistic.
5. **Process:** PPP announces date + registration. ([pwning.net](https://pwning.net/), [PlaidCTF site](https://plaidctf.com/))
6. **Calendar:** Annual, typically spring.
7. **Strategic value:** CMU / academic network door-opener. CMU also runs picoCTF and CyLab, both adjacent to NSF/DoD funding.
8. **Sources:** [PPP](https://pwning.net/), [Plaid CTF](https://plaidctf.com/)

## 1.6 Google CTF 2026
1. **Organizer:** Google.
2. **What:** Quals + finals (Hackceler8). One of the most polished, broad-appeal CTFs.
3. **Prize:** Cash for top teams + Hackceler8 invitations.
4. **Eligibility:** Open registration. ([CTFtime Google CTF 2026](https://ctftime.org/event/3222/))
5. **Process:** Open registration on ctftime.org.
6. **Calendar:** **June 19–21, 2026** (Friday 18:00 UTC – Sunday 18:00 UTC).
7. **Strategic value:** Google brand association; recruiter visibility; community SEO.
8. **Sources:** [CTFtime listing](https://ctftime.org/event/3222/), [google-ctf GitHub](https://github.com/google/google-ctf)

## 1.7 HITCON CTF (Taiwan)
1. **Organizer:** HITCON, Taiwan.
2. **What:** Top-tier Asian jeopardy + finals CTF.
3. **Prize:** Cash + travel to Taipei for finals.
4. **Eligibility:** Open globally.
5. **Process:** ctftime registration. Quals each summer.
6. **Calendar:** Quals typically July–August; finals November in Taipei.
7. **Strategic value:** APAC credibility; bridge into Taiwan / Korea / Japan markets.
8. **Sources:** Aggregated via [ctftime.org/ctfs](https://ctftime.org/ctfs)

## 1.8 UCSB iCTF
1. **Organizer:** UCSB Shellphish, sponsored by NSF AI Institute ACTION.
2. **What:** Long-running international academic attack-defense exercise.
3. **Prize:** Academic prestige.
4. **Eligibility:** Academic teams predominantly; open registration.
5. **Process:** Register via ictf.cs.ucsb.edu.
6. **Calendar:** **March 9–13, 2026** (already happened); next cycle spring 2027.
7. **Strategic value:** Tight DARPA / NSF connection through ACTION institute.
8. **Sources:** [iCTF site](https://ictf.cs.ucsb.edu/), [UCSB iCTF X](https://x.com/ucsbictf)

## 1.9 CSAW (NYU CCS) — CTF + Embedded Security Challenge (ESC)
1. **Organizer:** NYU Center for Cyber Security plus 4 global academic partners.
2. **What:** Multiple events. **ESC** is the oldest hardware security competition in the world (18 yrs); Blue Team designs, Red Teams attack.
3. **Prize:** Cash + finals trips to NYU.
4. **Eligibility for nous:** ESC is research-oriented — nous as a "Blue Team submission" (the system to defend) is plausible if Joey wants to publicize the architecture and let students attack it. Risk: full-source disclosure required, which conflicts with private-repo posture.
5. **Process:** Apply via csaw.io each spring.
6. **Calendar:** Finals annually each November.
7. **Strategic value:** Free pen-testing from world's best embedded students + a stamp from NYU.
8. **Sources:** [CSAW](https://www.csaw.io/), [ESC](https://www.csaw.io/esc)

## 1.10 Hack-A-Sat (AFRL + DEF CON Aerospace Village)
1. **Organizer:** Air Force Research Laboratory + Aerospace Village.
2. **What:** Satellite security CTF. Past editions used on-orbit satellite (Moonlighter, CubeSat).
3. **Prize:** $50K to winners in past editions.
4. **Eligibility:** Open teams; US-friendly. Government-sponsored = direct attention from AFRL / Space Force / NRO. ([Hack-A-Sat AFRL](https://afresearchlab.com/technology/hack-a-sat/))
5. **Process:** Watch hack-a-sat.com / Aerospace Village CFP each spring.
6. **Calendar:** Cadence has slipped; no firm 2026 announcement yet — check DEF CON 34 Aerospace Village schedule.
7. **Strategic value:** Front door to the **aerospace play** for sealed-IDS / FQDN identity in space. AFRL connection.
8. **Sources:** [AFRL Hack-A-Sat](https://afresearchlab.com/technology/hack-a-sat/), [Cromulence partner](https://www.cromulence.com/hack-a-sat)

## 1.11 picoCTF (CMU / CyLab Security Academy)
1. **Organizer:** Carnegie Mellon CyLab.
2. **What:** Education-focused CTF (middle school → college).
3. **Prize:** $500–$2,000 per category, campus visit.
4. **Eligibility:** Students. Not directly for Joey, but is the **pipeline** for hires + interns.
5. **Process:** picoctf.org registration.
6. **Calendar:** 13th annual ran **March 9–19, 2026**.
7. **Strategic value:** Talent funnel. Sponsoring a future picoCTF problem is a low-cost goodwill move.
8. **Sources:** [picoCTF 2026 announcement](https://www.cylab.cmu.edu/news/2026/02/26-picoctf.html)

## 1.12 HackTheBox Business CTF / Global Cyber Skills Benchmark
1. **Organizer:** Hack The Box (Greece-based, global).
2. **What:** Corporate team benchmark CTF, May 2026 ran as "Project Nightfall" with AI-augmented hybrid mode.
3. **Prize:** $20K services package + dedicated labs + AI red-team certs + trophy.
4. **Eligibility:** Corporate teams. nous's team of 2 wouldn't be competitive but participation = goodwill + community signal.
5. **Process:** ctf.hackthebox.com event registration.
6. **Calendar:** Annual May "Global Cyber Skills Benchmark"; corporate-security mini-CTFs roughly monthly.
7. **Strategic value:** Visibility in enterprise security community.
8. **Sources:** [Global Cyber Skills Benchmark 2026](https://www.hackthebox.com/events/global-cyber-skills-benchmark-2026), [Corporate Security CTF April 2026](https://ctf.hackthebox.com/event/details/corporate-security-ctf-april-2026-3279)

## 1.13 TryHackMe
1. **Organizer:** TryHackMe.
2. **What:** Continuous CTF / training platform + occasional competitions.
3. **Prize:** Subscriptions, leaderboard glory.
4. **Eligibility:** Open. Lower prestige than HtB / DEF CON.
5. **Process:** tryhackme.com.
6. **Calendar:** Continuous.
7. **Strategic value:** Recruiting + training signal; not a top-tier credibility lever.
8. **Sources:** tryhackme.com

---

# II. ARCHITECTURE / DEFENSE / STANDARDIZATION COMPETITIONS

These are where the **substrate** of nous's claims (Ed25519 by FQDN, sealed-IDS, threshold sigs) becomes officially recognized.

## 2.1 NIST Post-Quantum Cryptography — Additional Digital Signatures, Round 3 (the live game)
1. **Organizer:** NIST Computer Security Division.
2. **What:** Multi-round open competition. **Round 3 of Additional Digital Signatures** announced May 14, 2026, narrowing to 9 candidates: FAEST, HAWK, MAYO, MQOM, QR-UOV, SDitH, SNOVA, SQIsign, UOV. Round 3 will run ~2 years.
3. **Prize:** Standardization (FIPS), eternal credibility (Diffie-Hellman / RSA / AES level). No cash.
4. **Eligibility for nous:** Only **submission teams** with serious novel signature schemes can enter. Round 1 ship is closed; next opportunity is **future NIST calls** (e.g. follow-on lightweight, post-quantum KEM round 5 if announced). Even tracking + adopting Round-3 algorithms in nous becomes a marketing line: "nous tracks NIST PQC Round 3 — ML-DSA, SLH-DSA, FN-DSA already supported; QR-UOV experimental." ([NIST PQC project](https://csrc.nist.gov/projects/post-quantum-cryptography/post-quantum-cryptography-standardization), [Additional Digital Signatures](https://csrc.nist.gov/projects/pqc-dig-sig), [Round 3 advance](https://thequantuminsider.com/2026/05/21/nist-advances-nine-post-quantum-signature-algorithms-to-third-round/))
5. **Process:** NIST publishes formal calls in the Federal Register; ~9-month submission windows.
6. **Calendar:** Round 3 runs ~2026–2028. Next signature round if any: 2029-ish. Standardization status reports (NISTIR 8545 etc.) come out continuously.
7. **Strategic value:** "We implement what NIST is standardizing" is the **frontier-association** marketing move. Submitting to the next call (e.g., new lightweight or threshold round) puts nous in citations + slide decks indefinitely.
8. **Sources:** [NIST PQC home](https://www.nist.gov/pqc), [Round 4 NISTIR 8545](https://csrc.nist.gov/pubs/ir/8545/final), [Wikipedia](https://en.wikipedia.org/wiki/NIST_Post-Quantum_Cryptography_Standardization)

## 2.2 NIST Threshold Cryptography — Multi-Party Threshold Schemes (MPTS / NIST IR 8214C)
1. **Organizer:** NIST Multi-Party Threshold Cryptography (MPTC) Project.
2. **What:** First Call for Multi-Party Threshold Schemes — NISTIR 8214C — finalized 2026-Jan-20.
3. **Prize:** Standardization recognition. No cash.
4. **Eligibility for nous:** **HIGH.** This is a wide-open call **right now** for threshold signatures, threshold PKE/KEM, threshold ciphers/hashing, FHE, and ZKP. Submission package = technical spec + open-source reference impl + experimental evaluation + patent statement.
5. **Process:** Submit "Preview" writeup before formal package. Preview Writeup deadline was 2026-May-18 — but **future preview windows** open; formal Threshold Call submission window typically extends a year+.
6. **Calendar:** MPTS 2026 workshop happened January 26–29. Preview phase ongoing. ([MPTS 2026 event](https://csrc.nist.gov/events/2026/mpts2026))
7. **Strategic value:** **Highest aspirational lever** for a small-team, pure-C99 shop. Submitting a threshold scheme implementation puts nous in NIST's reference repository, which becomes a permanent citation source. Even a non-winning submission = "named in NIST IR 8214C reference materials."
8. **Sources:** [MPTC project](https://csrc.nist.gov/projects/threshold-cryptography), [Submissions page](https://csrc.nist.gov/Projects/threshold-cryptography/tcall-1), [News](https://csrc.nist.gov/news/2026/nist-and-multi-party-threshold-schemes)

## 2.3 NIST Lightweight Cryptography (CLOSED — ASCON won)
1. **Organizer:** NIST.
2. **What:** Standardization process for lightweight AEAD / hash / XOF.
3. **Status:** **Closed.** ASCON-AEAD128 / Ascon-Hash256 / Ascon-XOF128 / Ascon-CXOF128 finalized as SP 800-232, **published August 13, 2025**. ([Help Net Security ASCON](https://www.helpnetsecurity.com/2025/08/13/nist-lightweight-cryptography-standard/))
4. **Eligibility for nous:** Adopt ASCON in libsecurity.a as the lightweight option — marketing line: "nous ships SP 800-232 ASCON for constrained device class."
5. **Process:** N/A (process closed).
6. **Calendar:** No announced successor competition.
7. **Strategic value:** Free credibility line by implementation; no entry possible.
8. **Sources:** [Lightweight Crypto news](https://csrc.nist.gov/Projects/lightweight-cryptography/news), [SP 800-232](https://www.helpnetsecurity.com/2025/08/13/nist-lightweight-cryptography-standard/)

## 2.4 DARPA AI Cyber Challenge (AIxCC) — CLOSED
1. **Organizer:** DARPA + ARPA-H + Anthropic / Google / Microsoft / OpenAI.
2. **What:** 2-year competition: build a Cyber Reasoning System that finds + patches OSS bugs with LLMs.
3. **Prize:** Final results August 2025 — **$4M / $3M / $1.5M** to Team Atlanta (Georgia Tech + Samsung + KAIST + POSTECH), Trail of Bits, Theori. ([Final results page](https://aicyberchallenge.com/finals-winners-announcement/), [Georgia Tech writeup](https://scp.cc.gatech.edu/external-news/georgia-tech-makes-history-wins-darpa-challenge))
4. **Eligibility for nous:** **MISSED** the 2024–2025 cycle. **Watch for AIxCC follow-on or DARPA next-gen autonomous defense challenge.** DARPA challenges historically recur every 3–5 years.
5. **Process:** N/A until next announcement.
6. **Calendar:** No announced successor. Monitor [DARPA Challenges](https://www.darpa.mil/research/challenges).
7. **Strategic value:** Trail of Bits parlayed AIxCC into 2nd-place + sustained DOD pipeline. Future DARPA challenge in this space = top priority to enter.
8. **Sources:** [AIxCC](https://aicyberchallenge.com/), [MeriTalk writeup](https://www.meritalk.com/articles/darpa-announces-winners-of-ai-cyber-challenge/)

## 2.5 DARPA Cyber Grand Challenge (HISTORICAL)
1. **Organizer:** DARPA.
2. **What:** 2016 autonomous CTF — Mayhem won $2M.
3. **Status:** Closed. Tools / datasets curated by MIT Lincoln Lab and remain useful as benchmarks. ([MIT Lincoln CGC datasets](https://www.ll.mit.edu/r-d/datasets/cyber-grand-challenge-datasets))
4. **Eligibility for nous:** N/A.
5. **Strategic value:** Citation history. Watch for new DARPA program.
6. **Sources:** [DARPA CGC page](https://www.darpa.mil/research/programs/cyber-grand-challenge)

## 2.6 The Underhanded C Contest
1. **Organizer:** Scott Craver (Binghamton).
2. **What:** Submit malicious C code that looks like innocent mistake — defensive-mindset signaling.
3. **Status:** **Dormant since 2015.** No 2026 cycle. ([Wikipedia](https://en.wikipedia.org/wiki/Underhanded_C_Contest))
4. **Strategic value:** If revived, Joey-shaped event (pure C, cryptography-adjacent, defensive). Worth a watch — submit aggressively if reanimated.
5. **Sources:** [underhanded-c.org](https://www.underhanded-c.org/)

---

# III. INDUSTRY AWARDS / RECOGNITIONS

## 3.1 RSA Conference Innovation Sandbox (RSAC)
1. **Organizer:** RSA Conference.
2. **What:** Annual "10 most innovative cybersecurity startups" competition. Live pitch on Monday of RSAC week in San Francisco. Famous for launching companies.
3. **Prize:** Each Top-10 Finalist gets a **$5M uncapped SAFE** (massive — new in 2026). Winner is named "Most Innovative Startup." Past finalists have raised $18.1B+ collectively. 2026 winner: **Geordie AI** (AI-agent identity & governance — directly adjacent to nous). ([Geordie AI announcement](https://www.rsaconference.com/library/press-release/2026-isb-winner))
4. **Eligibility for nous:** **Y** — but startup must have <$10M revenue in prior year, founded/active per RSAC rules, have a "compelling cybersecurity story." Solo-founder / private repo is fine. Submissions opened **October 14, 2025**; deadline was **November 14, 2025 5pm PT** for 2026. ([RSAC ISB how-it-works](https://www.rsaconference.com/usa/programs/innovation-sandbox/how-it-works))
5. **Process:** Online submission form via rsaconference.com. Independent judging panel selects 10.
6. **Calendar:** **2027 cycle submissions open ~October 13, 2026.** Live competition Monday of RSAC 2027 (late April / early May 2027).
7. **Strategic value:** **TIER-1.** Single most consequential US cybersecurity startup award. The Geordie AI 2026 win is the template — nous's mesh + identity story competes directly. With Joey's 40-year resume + pure-C / no-deps differentiation, this is the **highest-ROI award to chase**.
8. **Sources:** [Innovation Sandbox](https://www.rsaconference.com/usa/programs/innovation-sandbox), [VentureBeat profile](https://venturebeat.com/technology/rsacs-innovation-sandbox-is-where-cybersecuritys-next-giants-are-born), [Press release submissions open](https://www.rsaconference.com/library/press-release/rsac-conference-set-to-open-annual-isb-and-lp-contest)

## 3.2 RSAC Launch Pad (sister track)
1. **Organizer:** RSAC.
2. **What:** Sister track to Innovation Sandbox for ultra-early startups.
3. **Prize:** Exposure on stage, investor introductions, no SAFE.
4. **Eligibility:** Earlier-stage than Innovation Sandbox.
5. **Process / calendar:** Same window as Innovation Sandbox (October–November submissions).
6. **Strategic value:** Backup channel if Innovation Sandbox judges punt nous as too early.
7. **Sources:** Same as ISB above.

## 3.3 Black Hat Pwnie Awards
1. **Organizer:** Pwnie Awards committee (volunteer, presented at DEF CON since 2024).
2. **What:** "Oscars of infosec." Categories rotate yearly. Recent: **Best Privilege Escalation, Best Cryptographic Attack, Most Innovative Research, Best Defense (intermittent), Lifetime Achievement, Most Epic Fail, Lamest Vendor Response.** ([Wikipedia](https://en.wikipedia.org/wiki/Pwnie_Awards))
3. **Prize:** Trophy + lifelong status.
4. **Eligibility for nous:** Joey/nous could be nominated for **Best Defense** (revival category) or **Most Innovative Research** if a public design paper drops; or for shipping a clever crypto primitive in **Best Cryptographic Attack** (rare for defenders).
5. **Process:** Public nominations via pwnies.com (typically open May–June for August presentation). Anyone can submit. Committee + past winners vote.
6. **Calendar:** Nominations open ~May, finalists at SummerCon, awards at DEF CON Saturday.
7. **Strategic value:** Single-night Hollywood moment in front of every offensive researcher in the world. Self-nominate the **nous pure-C architecture writeup** in Best Defense for 2026 / 2027 — costs nothing.
8. **Sources:** [Pwnie X](https://x.com/pwnieawards), [pwnienoms](https://www.pwnienoms.live/), [Wikipedia](https://en.wikipedia.org/wiki/Pwnie_Awards), [2025 nominees announcement](https://www.darkreading.com/cyberattacks-data-breaches/pwnie-award-highlights-sony-epic-fail-and-more)

## 3.4 Levchin Prize for Real-World Cryptography
1. **Organizer:** Real World Crypto Symposium / IACR steering committee.
2. **What:** Two awards/year for sustained real-world impact. 2026 honored Diffie-Hellman authors (50th anniversary) + Tamarin Prover team.
3. **Prize:** Trophy + $10,000 USD cash. Presented at RWC.
4. **Eligibility for nous:** Aspirational. Awarded for **sustained, demonstrable real-world deployment impact** (TLS, Let's Encrypt, Signal, Tamarin Prover). nous would need years of production usage before being plausible.
5. **Process:** Steering committee selects; no formal application.
6. **Calendar:** Announced at RWC in March. RWC 2027 likely January/March 2027.
7. **Strategic value:** Long-shot career-capstone prize. Build toward it.
8. **Sources:** [Levchin Prize page](https://rwc.iacr.org/LevchinPrize/), [Winners list](https://rwc.iacr.org/LevchinPrize/winners.html), [2026 winner announcement](https://inf.ethz.ch/news-and-events/spotlights/infk-news-channel/2026/03/levchin-prize.html)

## 3.5 EFF Award (formerly EFF Pioneer Award)
1. **Organizer:** Electronic Frontier Foundation.
2. **What:** Annual award (40-year history) recognizing technical / social / legal / academic / cultural contributions to digital empowerment. The "Barlow statuette."
3. **Prize:** Statuette + EFF community recognition.
4. **Eligibility for nous:** **Y on principle** — pure-C, sovereign-identity, decentralized mesh fits the EFF ethos perfectly. Past winners include Aaron Swartz, Tor Project, Signal team, etc.
5. **Process:** Open public nominations annually. ([EFF Awards](https://www.eff.org/awards/past-winners))
6. **Calendar:** Annual ceremony in fall, San Francisco. Nominations typically open spring–summer.
7. **Strategic value:** **High symbolic value** — instantly positions Joey as a peer of free-software / privacy heroes. Strong sovereignty + privacy + open-source / non-vendor-lock story = exactly what EFF rewards.
8. **Sources:** [EFF Pioneer Awards](https://www.eff.org/sh/homepage-feature/pioneer-awards), [Past winners](https://www.eff.org/awards/past-winners)

## 3.6 Free Software Foundation Awards (LibrePlanet)
1. **Organizer:** Free Software Foundation.
2. **What:** Three categories: (a) Projects of Social Benefit, (b) Advancement of Free Software, (c) Outstanding New Contributor.
3. **Prize:** Recognition at LibrePlanet; movement-aligned credibility.
4. **Eligibility for nous:** Depends on license posture. FSF awards **only free-software (GPL-spirit) projects**. If nous publishes under GPL-3 or LGPL with full source, it qualifies for category (a). If nous stays proprietary, FSF will not consider it.
5. **Process:** Public nominations open each November (deadline late November), announced at LibrePlanet in March.
6. **Calendar:** Nominations open ~November 2026 for 2027 awards.
7. **Strategic value:** Movement legitimacy and "this is not vendor lock-in" signal. Requires license alignment.
8. **Sources:** [FSF Awards](https://www.fsf.org/awards), [LibrePlanet wiki](https://libreplanet.org/wiki/FSF_Free_Software_Awards)

## 3.7 SC Awards (SC Media / CyberRisk Alliance)
1. **Organizer:** SC Media (CyberRisk Alliance).
2. **What:** 33 categories across Excellence Awards + Trust Awards.
3. **Prize:** Recognition + SC Media coverage; winners announced at RSA Conference.
4. **Eligibility for nous:** Y; Excellence Awards cover "Best Emerging Technology," "Best Customer Service," "Best Identity & Access Management," "Best Encryption" — direct fits.
5. **Process:** Online submission via cyberriskalliance.com/sc-awards; entry fees typical.
6. **Calendar:** 2026 winners announced at RSAC 2026. **2027 cycle opens late summer 2026.** ([2026 finalists](https://www.scworld.com/news/2026-excellence-awards-finalists-announced-winners-revealed-at-rsa-conference))
7. **Strategic value:** Trade-press SEO + customer-trust badge.
8. **Sources:** [SC Awards](https://www.scworld.com/sc-awards), [2026 winners](https://www.cyberriskalliance.com/sc-awards)

## 3.8 Cybersecurity Excellence Awards (Cybersecurity Insiders)
1. **Organizer:** Cybersecurity Insiders.
2. **What:** 500+ winners across 100+ categories since inception. Gold/Silver/Bronze per category.
3. **Prize:** Badge + listing.
4. **Eligibility:** Open with entry fee.
5. **Process:** Online submission.
6. **Calendar:** Annual; 2026 winners announced spring 2026. ([2026 example winner](https://www.morningstar.com/news/business-wire/20260407978692/cloud-range-wins-gold-in-2026-cybersecurity-excellence-awards-for-cyber-readiness-and-validation))
7. **Strategic value:** Easy "as featured in" badge; less prestige than SC or Fortress.
8. **Sources:** [Cybersecurity Excellence Awards](https://cybersecurity-excellence-awards.com/)

## 3.9 Fortress Cyber Security Awards (Business Intelligence Group)
1. **Organizer:** Business Intelligence Group.
2. **What:** Broad B2B cybersecurity awards across data protection / network defense / leadership / innovation.
3. **Eligibility:** Open with entry fee.
4. **Strategic value:** Mid-tier trade badge.
5. **Sources:** [Fortress award](https://www.bintelligence.com/awards/fortress-cybersecurity-award), [BIG cybersecurity awards roundup](https://www.bintelligence.com/blog/top-10-cybersecurity-awards-programs-for-2026)

## 3.10 Tech Ascension Cybersecurity Awards
1. **Organizer:** Tech Ascension.
2. **What:** Categories across cybersecurity, AI, fintech, etc.
3. **Eligibility:** Open. **$550/entry.**
4. **Strategic value:** Lowest-prestige of the trade awards; only enter if every other badge is in pocket.
5. **Sources:** [Tech Ascension award categories](https://www.techascensionawards.com/award-categories)

## 3.11 ISC2 Global Achievement Awards (incl. Harold F. Tipton Lifetime Achievement)
1. **Organizer:** ISC2 (the CISSP body).
2. **What:** Lifetime Achievement (named for Tipton), Mid-Career, Rising Star, Organization, etc.
3. **Eligibility for nous:** Y on principle for Mid-Career or Rising Star. Lifetime is multi-decade veterans.
4. **Process:** Public nominations open ~March–April annually.
5. **Calendar:** Nominations close mid-April. Ceremony at ISC2 Security Congress (Denver, Oct 26–28, 2026).
6. **Strategic value:** Reach the certified-professional community (massive ISC2 audience). Joey's 40+ years easily warrants Mid-Career.
7. **Sources:** [ISC2 Awards](https://www.isc2.org/about/award-programs), [2025 winners](https://www.isc2.org/Insights/2025/09/2025-isc2-global-achievement-awards-lifetime-achievement)

## 3.12 SANS Difference Makers Awards
1. **Organizer:** SANS Institute.
2. **What:** Annual community awards for cybersecurity individuals + teams. Categories include "Cybersecurity Innovator," "Lifetime Achievement," etc.
3. **Eligibility:** Open public nomination (anyone can nominate anyone).
4. **Process:** Free nomination form; community + committee winners. ([SANS DMA](https://www.sans.org/about/awards/difference-makers))
5. **Calendar:** Annual; nominations typically open summer.
6. **Strategic value:** SANS audience = hands-on technical defender pipeline.
7. **Sources:** [SANS Difference Makers](https://www.sans.org/about/awards/difference-makers), [Past winners](https://www.sans.org/about/awards/difference-makers/past-winners)

---

# IV. OPEN-SOURCE + COMMUNITY

## 4.1 OpenSSF / Alpha-Omega ($12.5M Linux Foundation security fund)
1. **Organizer:** OpenSSF + Alpha-Omega (Linux Foundation).
2. **What:** Not exactly an award — but a $12.5M grant pool announced March 2026 from Anthropic, AWS, GitHub, Google, Google DeepMind, Microsoft, OpenAI to fund OSS security tooling & maintainers.
3. **Prize:** Direct funding for projects building security-critical OSS.
4. **Eligibility for nous:** **Y if open-sourced** with OSS licensing. Target use: fund **independent audit** of libsecurity.a or fund development of "machine identity for OSS supply chain."
5. **Process:** Apply through OpenSSF programs; Alpha-Omega has rolling application cycle.
6. **Calendar:** Continuous; new pool announced March 17, 2026.
7. **Strategic value:** Significant grant + endorsement by every major foundation model lab simultaneously. ([LF announcement](https://www.linuxfoundation.org/press/linux-foundation-announces-12.5-million-in-grant-funding-from-leading-organizations-to-advance-open-source-security))
8. **Sources:** [OpenSSF press release](https://openssf.org/press-release/2026/03/17/linux-foundation-announces-12-5-million-in-grant-funding-from-leading-organizations-to-advance-open-source-security/), [Help Net Security](https://www.helpnetsecurity.com/2026/03/17/linux-foundation-12-5-million-grants/)

## 4.2 OWASP Project Awards
1. **Organizer:** OWASP Foundation.
2. **What:** Project Spotlight + Project Awards recognize standout OWASP-affiliated projects.
3. **Eligibility:** Project must be an OWASP project (incubator → flagship pipeline).
4. **Strategic value:** OWASP's brand carries weight in web/AppSec circles. Less aligned with nous's machine-identity focus, but **OWASP Top 10 for LLMs / Agents** is a strong adjacency — propose nous as a defensive primitive.
5. **Sources:** owasp.org

## 4.3 Linux Foundation Hall of Fame
1. **Organizer:** Linux Foundation.
2. **What:** Recognition of significant Linux/OSS contributors. Honorary.
3. **Eligibility:** Multi-year ecosystem contribution.
4. **Strategic value:** Long-term.
5. **Sources:** linuxfoundation.org

## 4.4 Mozilla MOSS / Secure Open Source Fund — **HIATUS**
1. **Status:** Mozilla MOSS / SOS Fund **on indefinite hiatus** as of post-2020 restructuring. ([Mozilla MOSS page](https://www.mozilla.org/en-US/moss/secure-open-source/))
2. **Alternative:** Mozilla Technology Fund (current active program).
3. **Sources:** [Mozilla MOSS](https://www.mozilla.org/en-US/moss/)

---

# V. XPRIZE + LARGE PURSE PRIZES

## 5.1 XPRIZE — Cybersecurity (no active competition)
1. **Status:** XPRIZE has **no active cybersecurity competition in 2026**. Active competitions: Quantum Applications ($5M), Healthspan ($101M), Wildfire ($11M), Water Scarcity ($119M), Build-with-Gemini ($2M general AI hackathon). ([XPRIZE competitions](https://www.xprize.org/competitions))
2. **Strategic value:** Monitor for future announcement; XPRIZE pursue prizes have cycle averaging 5–7 years for new domain launches.
3. **Sources:** [XPRIZE Grand Challenges](https://www.xprize.org/competitions)

## 5.2 Build-with-Gemini XPRIZE ($2M)
1. **What:** Google-backed hackathon, 5 categories (Education, Entrepreneurship, Small Business Services, Money, Professional Services).
2. **Eligibility for nous:** Indirect; would need a "machine-identity for AI" framing.
3. **Calendar / Sources:** [Build-with-Gemini XPRIZE](https://www.geminixprize.com/)

## 5.3 Marconi Prize (Marconi Society)
1. **What:** $100K prize + Marconi Fellow title for lifetime achievement in communications/IT.
2. **2026 winner:** Robert Calderbank (Duke) — voiceband modems + space-time coding + quantum error correction. ([Press release](https://marconisociety.org/press/robert-calderbank-2026-marconi-prize/))
3. **Eligibility for nous:** Aspirational; lifetime-achievement bar.
4. **Strategic value:** Long-shot future recognition.
5. **Sources:** [Marconi Prize](https://marconisociety.org/marconi-prize/)

## 5.4 ACM Turing Award
1. **What:** $1M prize; "Nobel of computing." Awarded for fundamental contributions.
2. **Crypto past winners:** Diffie + Hellman (2015), Goldwasser + Micali (2012), Rivest + Shamir + Adleman (2002).
3. **Eligibility for nous:** Aspirational, decades-out.
4. **Sources:** acm.org/turing-award

## 5.5 Gödel Prize
1. **What:** Theoretical CS prize, EATCS + ACM SIGACT, ~$5K.
2. **Eligibility for nous:** Only if Joey publishes a theoretical CS paper of lasting impact. Not directly addressable.
3. **Sources:** sigact.org/prizes/godel.html

---

# VI. ACADEMIC + RESEARCH PAPERS

These are awards attached to peer-reviewed papers at the top security venues.

## 6.1 IEEE Symposium on Security & Privacy ("Oakland") — Distinguished Paper + Test of Time
1. **Organizer:** IEEE Computer Society TC on Security & Privacy.
2. **What:** Flagship security conference. Distinguished Paper Awards each year; **Test-of-Time Award** for papers 10–12 years old with lasting impact.
3. **Eligibility for nous:** Publish a paper on nous architecture (sealed-IDS, FQDN identity, 900-LOC libsecurity) at S&P. Single-author papers are accepted.
4. **Process:** Submit to S&P each cycle (multiple rolling deadlines).
5. **Calendar:** **S&P 2026 May 18–21, 2026, Hilton SF Union Square.** ([SP 2026 program](https://sp2026.ieee-security.org/program.html)) S&P 2027 cycle currently open.
6. **Strategic value:** Top-3 venue. Distinguished Paper = career-defining for academic credibility.
7. **Sources:** [SP 2026](https://sp2026.ieee-security.org/program.html), [TC awards](https://www.ieee-security.org/TC/Awards.html), [Test of Time](https://www.ieee-security.org/TC/SP2022/awards.html)

## 6.2 USENIX Security Symposium — Distinguished Paper + Distinguished Artifact + Internet Defense Prize
1. **Organizer:** USENIX.
2. **What:** Top-3 venue. **Internet Defense Prize** ($100K from Meta historically). Distinguished Artifact track.
3. **Eligibility for nous:** Y. Submit paper + artifact (open-source code). Single-author OK.
4. **Process:** USENIX Sec '26 had artifact CFP. ([USENIX Sec 26 artifacts](https://www.usenix.org/conference/usenixsecurity26/call-for-artifacts))
5. **Calendar:** USENIX Security '26 conference summer 2026. '27 cycle: deadlines typically late 2026 / early 2027.
6. **Strategic value:** Top venue + cash prize attached if Internet Defense Prize active.
7. **Sources:** [USENIX Sec '26](https://www.usenix.org/conference/usenixsecurity26), [Sec artifacts CFP](https://www.usenix.org/conference/usenixsecurity26/call-for-artifacts), [ETH Comsec awards page](https://comsec.ethz.ch/awards-at-usenix-security/)

## 6.3 NDSS Symposium — Distinguished Paper + Distinguished Artifact + Best Posters
1. **Organizer:** Internet Society (NDSS).
2. **What:** Top-4 venue. Distinguished Artifact awards. Best Technical + Presentation Poster awards.
3. **Eligibility:** Open paper submission.
4. **Process:** Multiple CFPs (main + posters + artifacts + co-located workshops PRISM, USEC, FutureG, LAST-X).
5. **Calendar:** NDSS 2026 cycle closed. NDSS 2027 cycle opens summer 2026.
6. **Strategic value:** Strong academic credibility + crypto/systems community.
7. **Sources:** [NDSS 2026 site](https://www.ndss-symposium.org/ndss2026/), [Posters CFP](https://www.ndss-symposium.org/ndss2026/submissions/call-for-posters/), [Artifacts CFP](https://www.ndss-symposium.org/ndss2026/submissions/call-for-artifacts/)

## 6.4 ACM CCS — Best Paper + Awards
1. **Organizer:** ACM SIGSAC.
2. **What:** Top-3 security venue. Best Paper Award (recent + decade-old retrospective).
3. **Eligibility:** Open paper submission.
4. **Calendar:** CCS 2026 cycle open; check sigsac.org/ccs.
5. **Sources:** [CCS best paper history](https://www.sigsac.org/ccs/CCS_awards/ccs-bestpaper.html)

## 6.5 IACR (CRYPTO / EUROCRYPT / ASIACRYPT) Best Paper + Test of Time
1. **Organizer:** International Association for Cryptologic Research.
2. **What:** Best Paper at each event; **IACR Test of Time Award** at each (15-year retrospective).
3. **Eligibility for nous:** Submit a paper on a novel cryptographic protocol / engineering result (e.g., a sealed-IDS construction or a threshold signature engineering paper).
4. **Calendar:** **Eurocrypt 2026 May 10–14 (Rome); Crypto 2026 August (Santa Barbara); Asiacrypt 2026 December 7–11 (Hong Kong).**
5. **Strategic value:** Cryptography prestige tier.
6. **Sources:** [Eurocrypt 2026 CFP](https://eurocrypt.iacr.org/2026/callforpapers.php), [Crypto 2026 CFP](https://crypto.iacr.org/2026/callforpapers.php), [Asiacrypt 2026](https://asiacrypt.iacr.org/2026/), [IACR Test of Time](https://www.iacr.org/testoftime/nomination.html)

## 6.6 Real World Crypto (RWC) Talks
1. **Organizer:** IACR.
2. **What:** Contributed talks (no formal paper) selected by light-touch committee. **No awards** at RWC itself except the Levchin Prize (separately announced).
3. **Calendar:** **RWC 2026 Taipei, March 9–11, 2026.** RWC 2027 venue TBD.
4. **Strategic value:** Most engineering-relevant cryptography audience in the world. **Joey should submit a contributed talk on nous's architecture for RWC 2027.** Free, high-signal, brings nous to the eyes of every shipped-cryptography engineer.
5. **Sources:** [RWC 2026](https://rwc.iacr.org/2026/), [Call for Contributed Talks 2026](https://realworldcrypto.iacr.org/2026/contributed.php)

---

# VII. NATIONAL DEFENSE / GOVERNMENT CHALLENGES

## 7.1 NSA Codebreaker Challenge
1. **Organizer:** National Security Agency.
2. **What:** Annual reverse-engineering / cryptanalysis CTF for US college students. Georgia Tech has won 5 years running.
3. **Prize:** Honor + NSA hiring pipeline.
4. **Eligibility for nous:** US-college-student-restricted; Joey not eligible as a competitor. **Sponsorship / problem-setting angle** is the relevant move — nous could donate a real-world reverse-engineering challenge for the 2026 cycle.
5. **Calendar:** Most recent edition ran **September 24, 2025 – January 14, 2026**. 2026–2027 cycle opens September 2026.
6. **Strategic value:** Direct NSA visibility if nous becomes a sponsoring problem-source.
7. **Sources:** [NSA Codebreaker](https://nsa-codebreaker.org/home), [Georgia Tech 5x champ](https://www.gatech.edu/news/2026/01/15/georgia-tech-wins-fifth-straight-nsa-codebreaker-challenge)

## 7.2 Hack the Pentagon / Hack the Army / Air Force / etc. (DOD Bug Bounty programs)
1. **Organizer:** DOD Chief Digital and AI Office (CDAO) Directorate for Digital Services + HackerOne / Synack / Bugcrowd.
2. **What:** Continuous + scheduled bug bounty programs against DOD assets. Now expanded to hardware + physical systems. ([CDAO Hack the Pentagon site](https://www.ai.mil/about/organization/dds/hack-the-pentagon/), [DOD website launch](https://www.infosecurity-magazine.com/news/us-website-hack-pentagon-bug-bounty/))
3. **Prize:** Per-bug cash bounties. >2,100 bugs found across 40+ bounties since 2016.
4. **Eligibility for nous:** **Two angles.** (a) As a hacker — Joey participates and earns cash. (b) As a vendor — pitch nous as the protective layer DOD bug-bounties against (high-cred sponsorship channel via CDAO partnership). Vendor channel = use Hack the Pentagon to publicly stress-test nous on DOD assets.
5. **Process:** Continuous via HackerOne; specific programs (e.g., Hack the Pentagon 3.0 Facility Control Systems) recruit researchers per program.
6. **Calendar:** Ongoing.
7. **Strategic value:** Direct DOD pipeline. Even a single Hack-the-Pentagon disclosure earns "verified by DOD-sanctioned program."
8. **Sources:** [Bugcrowd HtP glossary](https://www.bugcrowd.com/glossary/hack-the-pentagon/), [HackerOne HtP](https://www.hackerone.com/events/hack-the-pentagon), [USDS Hacking the Pentagon](https://www.usds.gov/projects/hack-the-pentagon)

## 7.3 NSF CyberAICorps (formerly Scholarship for Service)
1. **Organizer:** NSF + OPM + CISA.
2. **What:** $25K/yr + tuition scholarships in exchange for federal-sector service. Renamed to CyberAICorps in 2026.
3. **Eligibility:** Students. Strategic relevance: talent pipeline.
4. **Calendar:** FY26 target April 3, 2026; FY27 deadline July 21, 2026. ([CyberAI SFS](https://www.nsf.gov/funding/opportunities/cyberai-sfs-cyberaicorps-scholarship-service/nsf26-503/solicitation))
5. **Strategic value:** Recruiting funnel for interns who can lawfully work on federal pilots.
6. **Sources:** [NSF 26-503](https://www.nsf.gov/funding/opportunities/cyberai-sfs-cyberaicorps-scholarship-service/nsf26-503/solicitation), [CISA SFS](https://www.cisa.gov/careers/students-recent-graduates-employment-opportunities/cybercorps-scholarship-service)

## 7.4 Cyber 9/12 Strategy Challenge (Atlantic Council)
1. **Organizer:** Atlantic Council Cyber Statecraft Initiative.
2. **What:** Student strategy/policy competition — write briefs for a fictional cyber crisis.
3. **Eligibility:** Students. Not directly nous-relevant; strategic value as a future judge / mentor slot for Joey.
4. **Calendar:** 2026 editions ran in Austin (Jan 31–Feb 1), Paris (Jan 28–30), Washington DC (Mar 7–8). ([Strauss Center 2026](https://www.strausscenter.org/events/2026-cyber-9-12-strategy-challenge/), [Atlantic Council](https://www.atlanticcouncil.org/programs/cyber-statecraft-initiative/cyber-912/))
5. **Sources:** [Cyber 9/12 main](https://www.atlanticcouncil.org/programs/cyber-statecraft-initiative/cyber-912/)

---

# VIII. INTERNATIONAL (NON-US)

## 8.1 ENISA Cybersecurity Skills Conference + ECSF
1. **Organizer:** European Union Agency for Cybersecurity.
2. **What:** Annual conference + framework, less competition than recognition forum.
3. **Calendar:** 4th European Cybersecurity Skills Conference **November 4–5, 2026, Larnaca, Cyprus.** ([ENISA event](https://www.enisa.europa.eu/events/european-cybersecurity-skills-conference-2026))
4. **Strategic value:** EU public-sector visibility; aligns with the proposed "EU attestation of cybersecurity skills."
5. **Sources:** [ENISA Skills Conf 2026](https://www.enisa.europa.eu/events/european-cybersecurity-skills-conference-2026), [European Cybersecurity Month Awards](https://www.enisa.europa.eu/topics/cyber-hygiene/european-cybersecurity-month/european-cybersecurity-month-awards)

## 8.2 Cybertech Global Tel Aviv (Israel)
1. **Organizer:** Cybertech Israel.
2. **What:** Largest non-US cybersecurity industry event. Startups pitch + networking. Israeli ecosystem strongly favors sovereign / defense-grade / military-pedigree products.
3. **Eligibility:** Any global startup.
4. **Calendar:** Cybertech Global Tel Aviv 2026 was **January 26–28, 2026 (Expo Tel Aviv).** 2027 cycle: late January 2027.
5. **Strategic value:** **Highest-density crypto/security buyer audience worldwide.** Israeli VCs raised $8.27B for cyber in 2025. Joey-style sovereign-identity story aligns with Israeli market.
6. **Sources:** [Cybertech Israel](https://www.cybertechisrael.com/), [2026 brochure](https://www.cybertechisrael.com/sites/cybertlv2022/files/2025-05/brochure%20global%20tlv%202026%20new.pdf)

## 8.3 Singapore CSA — SME Cybersecurity Excellence Award
1. **Organizer:** CSA (Cyber Security Agency Singapore) + ATC (Association of Trade and Commerce).
2. **What:** Recognition for SMEs implementing strong cybersecurity. Requires Cyber Essentials certification.
3. **Eligibility for nous:** Indirect; would require Singapore SME presence. Strategic if nous opens an APAC entity.
4. **Sources:** [ATC SME CS Excellence](https://atc.sg/cyber-security-excellence-award-singapore-business-sme.php), [CSA launch](https://www.csa.gov.sg/news-events/press-releases/csa-launches-the-sme-cybersecurity-excellence-award-to-recognize-singapore-business-commitment-to-cybersecurity/)

## 8.4 Japan IPA / JC-STAR
1. **Organizer:** Information-technology Promotion Agency, Japan.
2. **What:** Japan Cyber STAR product labelling (mutual-recognition framework with Singapore CLS). Not an award; a certification program.
3. **Eligibility:** Product certification rather than award.
4. **Strategic value:** Get nous JC-STAR labelled = APAC procurement door-opener.
5. **Sources:** [IPA Japan](https://www.ipa.go.jp/en/security/index.html), [JC-STAR](https://www.ipa.go.jp/en/security/jc-star/index.html)

## 8.5 UK Cyber Startup Award 2026 + NCSC for Startups
1. **Organizer:** Infosecurity Europe + UK Cyber Flywheel (award); NCSC + Plexal (accelerator).
2. **What:** New 2026 startup pitch competition + ongoing NCSC accelerator (70+ alumni, £550M+ raised).
3. **Eligibility:** Early-stage cyber businesses with live products.
4. **Calendar:** Pitch June 2, 2026. NCSC for Startups: rolling cohorts.
5. **Strategic value:** UK government + GCHQ-adjacent pipeline.
6. **Sources:** [Infosecurity Europe Cyber Startup Programme](https://www.infosecurityeurope.com/en-gb/visit/cyber-startup-programme.html), [NCSC for Startups](https://www.ncsc.gov.uk/section/ncsc-for-startups/overview)

## 8.6 International Cybersecurity Challenge (ENISA-coordinated)
1. **Organizer:** Continental teams (US, EU, Asia, LatAm, Africa, Oceania).
2. **What:** International CTF-style team competition.
3. **Eligibility:** Under-25.
4. **Strategic value:** Talent funnel only.
5. **Sources:** [ICC Wikipedia](https://en.wikipedia.org/wiki/International_Cybersecurity_Challenge)

---

# IX. VENTURE / STARTUP COMPETITIONS

## 9.1 TechCrunch Disrupt Startup Battlefield 200
1. **Organizer:** TechCrunch.
2. **What:** Apply → 200 selected → top 20 pitch on stage at Disrupt → winner gets **$100,000 + Battlefield Cup** + massive TechCrunch coverage.
3. **Eligibility for nous:** Y. Recent batches included AIM, HACKERverse, Mill Pond, Polygraf AI (all security/AI-security).
4. **Process:** Online application. **2026 application deadline extended to June 8, 2026.** ([Application extension](https://techcrunch.com/2026/05/28/startup-battlefield-200-application-deadline-extended-to-june-8-after-overwhelming-demand/))
5. **Calendar:** Disrupt 2026 fall, San Francisco. **Apply by June 8.**
6. **Strategic value:** Top-tier startup-stage exposure; TechCrunch coverage feed-forward into investor introductions.
7. **Sources:** [Startup Battlefield](https://techcrunch.com/startup-battlefield/), [What we're looking for](https://techcrunch.com/2026/05/26/what-were-looking-for-in-startup-battlefield-2026-and-how-to-apply-in-time-for-the-may-27-deadline/), [9 top cyber from prior batch](https://techcrunch.com/2025/12/26/the-9-top-cybersecurity-startups-from-disrupt-startup-battlefield/)

## 9.2 Y Combinator (Summer 2026 / S26)
1. **Organizer:** Y Combinator.
2. **What:** Premier US accelerator. $500K standard deal.
3. **Eligibility for nous:** Y. W26 had several security startups. S26 batch July–September 2026, San Francisco. Late applications still accepted.
4. **Process:** ycombinator.com/apply.
5. **Calendar:** **S26 in-batch July–Sep 2026.** Winter 2027 applications open August 2026.
6. **Strategic value:** Top accelerator; founder network; investor day demo.
7. **Sources:** [YC Apply](https://www.ycombinator.com/apply), [W26 batch overview](https://startground.com/yc-w26-startups/)

## 9.3 Notable Capital — Rising in Cyber 2026
1. **Organizer:** Notable Capital + 150 CISO voting panel.
2. **What:** Annual "30 most promising private cybersecurity startups" list.
3. **Eligibility:** Private cybersecurity company. CISO peer-voted.
4. **Calendar:** 2026 cycle complete; 2027 cycle late spring 2027.
5. **Strategic value:** Direct CISO-network exposure — same audience that signs procurement contracts.
6. **Sources:** [Notable Capital Rising in Cyber](https://www.prnewswire.com/news-releases/notable-capital-unveils-rising-in-cyber-2026-302769101.html)

## 9.4 Cyber Investing Summit (Investor's Choice)
1. **Organizer:** Cyber Investing Summit.
2. **What:** Annual investor + CISO summit, includes pitch sessions.
3. **Strategic value:** Mid-tier. Useful introduction channel.
4. **Sources:** [Cyber Investing Summit](https://cyberinvestingsummit.com/)

## 9.5 Cyber Innovation Awards — "Most Promising Cybersecurity Startup"
1. **Organizer:** cyberinnovationawards.com.
2. **What:** Trade award for startups. 2026 winner Vigilance Security.
3. **Eligibility:** Open with entry fee.
4. **Strategic value:** Trade badge.
5. **Sources:** [Cyber Innovation Awards 2026](https://cyberinnovationawards.com/awards/2026/most-promising)

## 9.6 Black Hat Arsenal (Open-Source Tool Demo)
1. **Organizer:** Black Hat.
2. **What:** Open-source tool showcase at Black Hat USA / Europe / Asia / SecTor. NOT an award per se — but presenting at Arsenal is a recognition channel of its own.
3. **Eligibility:** Open-source tools only (paid product pitches prohibited).
4. **Process:** Submit via Arsenal CFP. ([USA 2026 Arsenal CFP](https://usa-arsenal-cfp.blackhat.com/))
5. **Calendar:** **USA 2026 Arsenal CFP closed March 16, 2026; notifications April 15, 2026; event Las Vegas Aug 5–6, 2026.** **Europe 2026 CFP opens April 24, 2026, closes June 19, 2026.** SecTor 2026 Toronto Oct 6–8.
6. **Strategic value:** Joey demos libsecurity.a + nous CLI at Arsenal → instant credibility with offensive + defensive operators. Free.
7. **Sources:** [Black Hat Arsenal](https://blackhat.com/html/arsenal.html), [USA 2026 Arsenal CFP](https://usa-arsenal-cfp.blackhat.com/), [Europe 2026 Arsenal CFP](https://europe-arsenal-cfp.blackhat.com/), [SecTor 2026 Arsenal CFP](https://sector-arsenal-cfp.blackhat.com/)

---

# CLOSING RECOMMENDATION — Top 5 to enter first

Ranked by ROI for a sole-founder pure-C99 zero-trust mesh, **calibrated** to what's actually in motion in 2026.

## 1. RSA Conference Innovation Sandbox 2027 — submit October–November 2026 (TIER-1 MUST)

**Why first:** Single highest-leverage cybersecurity startup award on Earth. 10 finalists each get **$5M uncapped SAFE** (new 2026 sweetener). Past finalists collectively raised $18.1B. The **2026 winner Geordie AI** is an "AI agent identity & governance" platform — Joey's competition is shaped exactly like nous (identity for agentic systems). Joey's pure-C / no-deps / sovereign-FQDN story is differentiated from every YC-pattern AI-wrapped competitor. Application costs nothing but a thoughtful submission.

**What to do:** Watch [rsaconference.com](https://www.rsaconference.com/usa/programs/innovation-sandbox) and the [official press wire](https://www.rsaconference.com/library/press-release/rsac-conference-set-to-open-annual-isb-and-lp-contest) — submissions open ~October 13, 2026; deadline ~November 14, 2026 5pm PT. Email RSAC.InnovationSandbox@Info.RSAConference.com to confirm 2027 dates the moment the cycle opens.

## 2. NIST Multi-Party Threshold Cryptography Call (NIST IR 8214C) — submit Preview Writeup ASAP, full package on rolling deadline (FRONTIER-ASSOCIATION TIER-1)

**Why second:** Open call **right now** for threshold signatures / threshold KEMs / FHE / ZKP implementations. NIST publishes submission packages in a permanent reference repository — even non-finalist submissions become a forever-citation. nous's sealed-IDS + machine-identity story can ride threshold cryptography natively. Submitting puts Joey's name in NISTIR documents alongside Diffie/Hellman lineage figures.

**What to do:** Read [NIST IR 8214C](https://csrc.nist.gov/Projects/threshold-cryptography/tcall-1) and prep a Preview Writeup. Even if package isn't ready, the Preview window communicates intent and gets feedback from the NIST team. Aim for a threshold-signature implementation in pure C99 — a natural fit for libsecurity.a.

## 3. Black Hat Arsenal — submit to Europe 2026 (CFP opens April 24, closes June 19, 2026) (LOW-COST, HIGH-SIGNAL)

**Why third:** Free, immediate, every offensive + defensive operator on Earth walks past your table. Joey demos `metal` CLI + libsecurity.a end-to-end with sealed-IDS handshake on a laptop — guaranteed crowd because pure-C primitives + zero-deps + FQDN-identity is unicorn-rare in 2026's enterprise booth-spam ecosystem. Pipe it into Pwnie / EFF Award nomination momentum.

**What to do:** Submit via [Europe Arsenal CFP](https://europe-arsenal-cfp.blackhat.com/) before June 19, 2026. Also queue the **Black Hat USA 2027 Arsenal CFP** for January 2027.

## 4. TechCrunch Disrupt Startup Battlefield 200 — apply by June 8, 2026 (IMMEDIATE)

**Why fourth:** Application deadline 9 days from today (extended). $100K prize + TechCrunch coverage + investor introductions. Recent batches had heavy cybersecurity representation. nous's sovereign-identity-for-AI-agents pitch hits TechCrunch's editorial sweet spot for 2026.

**What to do:** Submit at [Startup Battlefield 200 application](https://techcrunch.com/startup-battlefield/) immediately. Single founder OK; private repo OK. Frame nous as "sovereign machine identity for agentic AI — pure C99, no Kubernetes, no auth provider."

## 5. EFF Award — open public nomination summer 2026 (BRAND TIER-1, ETHOS FIT)

**Why fifth:** Joey's pure-C + sovereign-FQDN + no-vendor-lock posture is **what EFF awards**. The EFF Award (Barlow statuette) puts Joey peer-to-peer with Tor / Signal / Aaron Swartz. Self-nominate; nomination is free; needs only an articulation of "metal as a sovereignty mechanism for individual operators." This is the **soul-of-the-product award.**

**What to do:** When 2027 nominations open (typically May–July 2026), submit via [eff.org/awards](https://www.eff.org/awards). Pair with at least one published artifact — the kernel CLAUDE.md, an architecture writeup, a public talk.

## Honorable mentions (queue but don't lead with)

- **Pwnie Awards** (self-nominate Best Defense — free, August DEF CON moment)
- **SC Awards 2027** (mid-tier badge; cycle opens late summer 2026)
- **ISC2 Global Achievement** (Joey's 40-year resume makes Mid-Career a strong case; nominations close mid-April 2027)
- **SANS Difference Makers** (free, open public nomination, builds defender-community recognition)
- **OpenSSF / Alpha-Omega grant pool** (if + when nous open-sources — direct funding from $12.5M LF pool)
- **RWC 2027 contributed talk** (best engineering-cryptography audience in the world; talk submission open December 2026)

## Aspirational (multi-year)

- **Levchin Prize** (after years of demonstrable real-world deployment)
- **Marconi Prize** (lifetime communications/IT achievement)
- **ACM Turing Award** (decades-out, but path: Diffie/Hellman precedent for crypto pioneers)
- **NIST Post-Quantum Round 5+** (whenever NIST opens next signature/KEM round)

---

## Calendar quick-look (next 12 months)

| Month | Action |
|---|---|
| **Jun 8, 2026** | TechCrunch Disrupt Startup Battlefield 200 application deadline |
| **Jun 19, 2026** | Black Hat Europe 2026 Arsenal CFP closes |
| **Jun 19–21, 2026** | Google CTF 2026 |
| **Summer 2026** | SANS Difference Makers nominations / Pwnie nominations / EFF Award nominations open |
| **Aug 5–6, 2026** | Black Hat USA 2026 Arsenal (Las Vegas) |
| **Aug 2026** | DEF CON 34 CTF Finals + Pwnie Awards Saturday |
| **Sep 2026** | NSA Codebreaker Challenge 2026–2027 cycle opens |
| **Oct 6–8, 2026** | SecTor 2026 Arsenal (Toronto) |
| **Oct 13, 2026 (est.)** | RSAC 2027 Innovation Sandbox submissions open |
| **Oct 26–28, 2026** | ISC2 Security Congress Denver (Global Achievement Awards) |
| **Nov 4–5, 2026** | ENISA European Cybersecurity Skills Conference (Cyprus) |
| **Nov 6, 2026** | Marconi Awards Gala (San Francisco) |
| **Nov 14, 2026 (est.)** | RSAC 2027 Innovation Sandbox deadline |
| **Jan 2027** | Pwn2Own Automotive Tokyo |
| **Jan 26–28, 2027 (est.)** | Cybertech Global Tel Aviv 2027 |
| **Mar 2027** | RWC 2027 |
| **Apr 2027** | RSAC 2027 Innovation Sandbox stage |
| **May 2027** | Pwn2Own Berlin 2027 |

---

*Compiled by metal console research agent for Joey Castillo. Pure-C sovereignty deserves the Michelin Star — know the rules and know the game.*
