# Review of PrismaticCohomologyPartIV (pull request #1080 at 32d1a4e)

**Verdict:** needs changes

Incremental re-review of the 132 lines changed since 385c7a4, and the first check of the pull request's title and description against the head. Three P3 findings: two sentences of the description that the head contradicts, and one of the eight new consumer sentences that omits four consumers. The gate passes.

## R01 (P3) — The description says the Lean file states definitions and theorems; it declares nothing

**Location:** pull request description, third paragraph: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** at this head `TauCetiRoadmap/PrismaticCohomologyPartIV/Suggested.lean` has no declaration at all; the sentence leads a reader to expect stated headline theorems.

**Witness:** `Suggested.lean` lines 41–43 are an empty namespace; `README.md` line 150: "`Suggested.lean` contains no theorem declarations"; the worker's change summary: "Lean declarations: 0 removed, 0 added".

**Repair:** replace the clause by: "`Suggested.lean` declares nothing: no headline theorem of Layer 8 is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each group of headlines with the carriers it lacks; every target is in the README."

## R02 (P3) — The description's validation sentence reports a `sorry` warning the build does not emit

**Location:** pull request description, "Validation: the targeted Lake build succeeds with `sorry` as the only warning; README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero".

**Claim:** the file contains no `sorry`, so the build has no warning; the sentence describes an earlier head.

**Witness:** `lake env lean TauCetiRoadmap/PrismaticCohomologyPartIV/Suggested.lean` at 32d1a4e: exit 0, empty output; `grep -c sorry` on the file: 0.

**Repair:** write "Validation: the targeted Lake build succeeds with no warning (the file declares nothing); README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero".

## R03 (P3) — The consumer sentence of §8.7 omits four consumers that the `*Needs:*` lines name

**Location:** `TauCetiRoadmap/PrismaticCohomologyPartIV/README.md` line 419: "the envelopes of §§8.11–8.12 and 8.36, the sites of §§8.18, 8.20 and 8.30, and §§8.41 and 8.58 consume them."

**Claim:** the other seven sentences this change adds (lines 295, 647, 961, 1034, 1306, 1415, 1554) list exactly the sections whose `*Needs:*` lines cite the group; this one leaves out §§8.15, 8.24, 8.51 and 8.52.

**Witness:** line 621 (§8.15) "*Needs:* §§8.14, 8.9, 8.2"; line 780 (§8.24) "…8.18, 8.7, 8.20…"; line 1194 (§8.51) "…§8.49, §8.7, §8.48…"; line 1225 (§8.52) "§§8.46–8.47, 8.7, 8.21".

**Repair:** "…; the envelopes of §§8.11–8.12 and 8.36, the perfect log prisms of §8.15, the sites of §§8.18, 8.20 and 8.30, and §§8.24, 8.41, 8.51, 8.52 and 8.58 consume them." (Checked against all `*Needs:*` lines: consumers of §8.7 are 8.11, 8.24, 8.36, 8.51, 8.52; of §8.8: 8.11, 8.30, 8.36; of §8.9: 8.12, 8.15, 8.18, 8.20, 8.30; of §8.10: 8.41, 8.58.)

## Previous findings

- R01 — repaired: all 20 places read as plain text, e.g. line 55 "**Relative cotangent criterion.**", line 1641 "inverting the prism ideal before p-completion", line 1762 "the saturated monoid of §8.76a"; a scan for one-letter code spans inside words or before ". " finds only variables.
- R02 — repaired: the nine links are plain citations, e.g. line 160 "*Needs:* PrismaticCohomologyPartIII §6.1, PrismaticCohomologyPartIII §7.7, … PrismaticCohomology §0.65"; no `README.md#` fragment remains in the file.
- R03 — repaired: line 158 "pp.39–42", line 167 "pp.84–86", line 213 "BMS2 Lemma 4.7, p.19 of the arXiv version", line 1097 "CK, §6.7; Proposition 6.8 and its diagram, pp. 66–67".

## Verified sound

| Statement (changed passage) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.6 reworded (line 407), fraction formula | `m′ = m`; `p = 2`, `A = ℤ_2`, `M = ℕ`, `δ_log(n) = (3ⁿ−1)/2`, element `−1` | `(δ−δ)/(1+pδ) = 0 = δ_log(1)`; `δ_log(−1) = (0−1)/(1+2) = −1/3`, `1+2·(−1/3) = 3⁻¹` | law holds on `M^gp`; same statement as K1 Prop. 2.16 | none |
| §8.6 (3) "factors uniquely" | `N = M` | extension ring `A ⊗_{ℤ_(p)[M]} ℤ_(p)[M] = A`, factorisation is the map itself | equals the former "universal among" | none |
| §8.11 reworded (line 525) | `J = IB`, surjection already exact, `B` a prelog prism | identity is universal; `M_{B′} = M_B` integral | hypotheses (orientable base, both monoids integral) as K1 Prop. 3.6 | none |
| §8.18 reworded (line 649) | `M_A`, `M_X` trivial | objects reduce to bounded prisms over `A` with `Spf(B/IB) → X`; `B ⊗^L_A A/I = B/IB` as `I` is invertible and `B` is `I`-torsion-free | three data, covers and both sheaves as K1 Def. 4.1 | none |
| §8.41 reworded (line 1081) | completion ideals; `r = 0` | `φ(ξ) = [p]_q ≡ μ^{p−1}` mod `p`, so `(p, μ)` and `(p, φ(ξ))` have one radical; `r = 0`: `t_0 = π`, torus chart | both displayed isomorphisms unchanged | none |
| §8.43 reworded (line 15) | trivial pre-log structures; cover versus map | pushout condition is empty, leaving `B ⊗^L_A A/p` discrete and Tor amplitude `[−1, 0]`: BMS2's notion; cover = faithfully flat variant | agrees with KY Definition 4 (lines 153–159, p.4) | none |
| §8.63 reworded (line 1417) | `Y′ = Spa(R, R^+)`; `P` trivial | `Ô_Y(Y′) = R^♯`; trivial chart gives `M_Y = Ô_Y^×`, an ordinary diamond | chart must factor through `Ô^+_Y` and induce `P^a ≅ M_Y`, as KY Def. 7.3–7.4 | none |
| §8.66 reworded (line 1495) | `f` strict; `g = id`; n-th root cover | strict: `×^sat = ×`, so the test is quasi-pro-étaleness; `g = id`: cancellation is trivial; root cover: Kummer-étale, not strict | one-way cancellation kept, as KY lines 2877–2894 | none |
| Consumer sentences at lines 295, 647, 961, 1034, 1306, 1415, 1554 | every `*Needs:*` line of the README | consumers computed: {8.3–8.6, 8.8 \| 8.15, 8.33}; {8.20, 8.21, 8.23, 8.24, 8.24a, 8.26, 8.33, 8.46}; {8.40 \| 8.41}; {8.58, 8.79}; {8.62, 8.63, 8.67, 8.68, 8.72}; {8.66, 8.67, 8.69, 8.71, 8.74}; {8.74} | each equals the sentence | none |
| Consumer sentence at line 419 | same | computed {8.11, 8.12, 8.15, 8.18, 8.20, 8.24, 8.30, 8.36, 8.41, 8.51, 8.52, 8.58}; sentence has eight of the twelve | incomplete | R03 |

Rows for untouched statements stand as in the previous review, of `385c7a4`.

- Change since 385c7a4: three commits, README only (71 insertions, 61 deletions); `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it: empty).
- Headings: nine sub-headings became bold `**§8.n …**` paragraph ids under eight renamed group headings (8.1, 8.7, 8.18, 8.27–8.29, 8.36, 8.40, 8.59, 8.63, 8.70); every id §8.0–§8.79 still exists and every `*Needs:*` reference resolves (gate `target-ids=0`, `layer-ids=0`, `dropped=0`). No layer added, removed or reordered.
- Source locators checked against the text for the changed passages: 7 (K1 Prop. 2.16 lines 457–468 p.11; Prop. 3.6 lines 632–638 p.15; Def. 4.1 lines 809–825 p.19; Thm. 8.1 and Rem. 8.3 lines 1957–1967 p.45; KY Definition 4 lines 153–160 p.4; Defs. 7.3–7.4 and Conv. 7.5 lines 2782–2800; lines 2877–2894). The seeded sample falls in changed text at §§8.7, 8.11–8.13 and 8.18 only; the other sampled sections are unchanged since 385c7a4.
- Cross-roadmap citations in changed text resolved: CohomologyComparisons §4.6 "Log prismatic comparison boundary" (its README line 817, *Needs* at 928 naming §§8.1–8.29, 8.35, 8.41–8.42, 8.56, 8.69) and §6.1 (line 1097, *Needs* at 1137 naming §8.60), at its open head; the nine de-linked citations name the same sections as before.
- Library declarations opened: `TauCeti.IsProP`, `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean` line 31 at the pin (named in the description).
- Description checked against the head: summary block, title, ownership and consumer sentences agree with README lines 11, 144 and 1902; the two contradicted sentences are R01 and R02. The worker's citation lead `AInf.cohomology_finiteness_from_periods` is a supplier's name (AInfCohomology §AI.5.2), as in the previous review.
- Gate at 32d1a4e: every check 0, "OK" (re-run this round, and `gate.md`). Dependency check: `depcheck: 247 roadmaps, 2246 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Elaboration of `Suggested.lean`: exit 0, no output. `#check` and one-tactic probes: nothing to probe, the file declares nothing.
- Headlines: unchanged; none statable at the pins, each group named in the module docstring with its missing carrier.

Overlap check: read PrismaticCohomologyPartII, PrismaticCohomology, PrismaticCohomologyPartIII, CohomologyComparisons, CrystallineCohomology, AInfCohomology, PerfectoidSpaces, DiamondsAndVStacks, EnhancedDerivedSheaves (through `scratch/overlaps.md`, the previous review's ownership search and the citations resolved above); nothing shared; `overlaps.md` lists no dropped id, no second copy and no other pull request changing this roadmap.

Source independence: changed passages only; 7 passages compared with 2 sources (K1, KY), none shared beyond formulas and standard names (the seven rewordings restructure each statement); largest share K1, about 117 of about 290 locators (KY about 114); contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- KYcorr (Inoue–Koshikawa–Yao, Corrigendum, Adv. Math. 503 (2026) 111223): not readable legally (as in the previous review); the de-backticked page locators at §§8.71–8.75 were checked for form only.
- The items of the previous review's list (Kato89, OgusDraft, Tsuji, Nakayama II, Huber Cor. 3.2.3, SW Lemma 17.1.8, KL, HK94 printed folios) are untouched by this change and stand as recorded there.

## Source issues

- none (new this round; the nine entries of the previous review stand)

## For the human reviewers

- **Not tested.** The previous report carries no arrangement comparison and this round does not repeat it. Fact: §§8.1–8.13, 8.18–8.42 run in the order of K1 §§2–8 (`README.md` lines 293–1097); the `*Needs:*` lines force that order.
- **Licence.** KYcorr, cited for §§8.71–8.75 (`README.md` lines 1586–1661), could not be read: the author copy refuses the sources service and the DOI resolves to a paywalled page.
- **Licence.** OgusDraft (a 2006 draft, cited at `README.md` line 425) and CN21 (an author version, line 1938) are unpublished copies; neither was reachable or classified this round.
