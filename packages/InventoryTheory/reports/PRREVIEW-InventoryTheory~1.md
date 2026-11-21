# Review of InventoryTheory (pull request #2932 at 0df58d7)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the README and of `Suggested.lean` was recomputed (the six headline theorems, the proofs of Scarf's lemma and theorem, the exchange argument of 5.1) and every numerical Check was reproduced in exact arithmetic; nothing false was found. There are three small corrections (a wrong gloss of Mathlib's `IsMinOn`, a description that does not say RiskMeasures is still an open pull request, a miscounted Check) and three format notes, none blocking. For the humans: the locators into Gallego's lecture notes (1.1, 1.2, 5.1) could not be read, and the roadmap's sources are lecture notes and one author-page paper.

## C01 — Mathlib's `IsMinOn f s y` does not include `y ∈ s`

The Conventions say (line 67) "`IsMinOn f s y` is Mathlib's: `y ∈ s` and `f y ≤ f z` for every `z ∈ s`". At the pin, `IsMinOn` is `IsMinFilter f (𝓟 s) a`, that is, only `f a ≤ f x` for `x ∈ s`; the docstring beside it says membership is not assumed (`Mathlib/Order/Filter/Extr.lean`, line 112). An implementer who trusts the gloss will read the hypothesis of 4.1, `IsMinOn (…) (Ici x) (π n x)`, as containing admissibility, and will drop membership hypotheses in the API around 1.1 and 4.1.

No stated result is affected: 1.1 carries `0 < T` separately, 2.2, 3.2 and 3.3 minimize over `univ`, and 4.1 assumes `x ≤ π n x` separately. The smallest change is to the sentence: "`IsMinOn f s y` is Mathlib's: `f y ≤ f z` for every `z ∈ s`; it does not include `y ∈ s`, which is stated separately where it is needed."

## C02 — The description does not say that RiskMeasures is not on main

The description says "No dependency on any open roadmap", and of RiskMeasures that "it is cited in 1.2 and not restated". RiskMeasures is the roadmap of open pull request #2895; main has no such folder. Section 1.2 and the Summary derive the newsvendor rule from its 4.1 (`isLeast_averageValueAtRisk`), so that derivation has a source only once #2895 merges with 4.1 under that number. I checked the citation against the head of #2895: the hypotheses (negative part integrable, `0 < t < 1`) and the interval from `−μ.upperQuantile t` to `−μ.quantile t` are as 1.2 uses them.

The description would be right as: "No target depends on an open roadmap. The non-target 1.2 cites RiskMeasures 4.1, which is not on main (open pull request #2895)."

## C03 — The last Check of 5.1 counts horizons 1 to 3, not "every horizon `n ≤ 3`"

The Check (line 538) says "For every horizon `n ≤ 3` … (3504 instances)". The count is `48 + 384 + 3072 = 3504` for `n = 1, 2, 3`; with `n = 0` (six further, trivial, instances) it would be 3510. Write "for `1 ≤ n ≤ 3`". The result itself reproduces: on all 3504 instances the least cost over integer plans equals the least cost over zero-inventory plans.

## N01 — Time words

Line 37, "the general theory of quantiles that Tau Ceti now provides": drop "now" (the Scope section already says "the pinned Tau Ceti provides"). Lines 309 and 360, "The proof below is complete and is proved here", reads as a remark on other texts; "The route below is a complete proof" says the same.

## N02 — Five Checks report computer experiments

The Checks at 1.2 (9156 cases), 2.2 and 3.3 (seven laws, nine settings, four periods), 4.1 (153 rules) and 5.1 (3504 instances) describe computations a reader cannot evaluate from the text. I reran all of them and they hold with the stated counts (9156 cases, 781 with a nondegenerate interval; 252 recursion stages; 3504 instances). They would be more useful with one representative instance each written out, as the neighbouring Checks do.

## N03 — The primary papers are named but not listed

Scarf (1960) and Wagner and Whitin (1958) appear in 3.3 and 5.1 only through the secondary texts, and the References list neither. Adding their bibliographic entries (without locators, if the texts were not read) would let a reader find the original statements.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `isMinOn_eoqCost_iff` | `(K,h,rate,ρ)=(100,5,200,0.2)`, `(100,5,500,0.5)`; identity `αT+K/T−2√(αK)` | `T*=0.5`, cost `400`; `T*=0.4`, cost `500`; square `(√(αT)−√(K/T))²`, zero iff `αT²=K` | true; Lean equals README | none |
| 1.1 stock path Check | rise 800 to `t=0.1`, fall 200 to `0.5` | peak 80, average 40 `= rate(1−ρ)T/2` | true | none |
| 1.2 newsvendor (not a target) | `D=±1`, `b=h=1`; uniform on `{0,1,2,3}`, `(b,h)=(3,1),(2,1)`; 9156 laws and pairs | `[−1,1]`, cost 1; `[2,3]`, cost `3/2`; `{2}`, cost `5/4`; 9156 agree, 781 nondegenerate | true; identity `G=h(y+t⁻¹E(D−y)⁺)−hm` rederived | none |
| 1.2 quantile reversal | Tau Ceti `quantile_map_affine_neg`, `a=0`, `b=−1`, `u=t` | `ν.quantile t=−μ.upperQuantile(1−t)`; upper likewise | matches the pin (`Affine.lean` 317, 337) | none |
| 2.1 recursion and regularity | `c=p=2`; `c=h=0`; `(c,p,h)=(−2,−1,3)`; demand `0,1,3` | `G0=1.8` on `(−∞,0]`; `G0=0` on `[3,∞)`; `G1=y−3.6` for `y≤0` (`−23.6,−13.6,−3.6`) | Checks true; attainment of the `sInf` argued for `K≥0` | none |
| 2.2 `baseStock_inventoryValue` | demand `0,1,3`: `(c,p,h)=(1,3,1)` and `(0,2,1)`; all `K=0` settings, 7 laws, 4 periods | minimizers `[0,1]`, `{1}`, `{1}`; least values `1.3, 2.6, 3.9`; `V(n+1)x=G(max S x)−cx` at all test points | true | none |
| 3.1 `KConvex` | `a=0`; downward and upward step; `−|x|`; Russo's form; `V1` for constant demand 2 | forces `K≥0`; down step passes, up step `K>K/2` fails; `0≤−M+K/2` fails; forms agree after `×(b+z)/b`; `V1(0)=5>4` | definition is the right-end convention of Feinberg–Lewis 6.6 | none |
| 3.2 `kConvex_reorderPoint` | `g=r(·−2)`, `K=5`; `max(|x|−1,0)`, `K=0`; `x²+K[x≤0]`; `exp`; 252 stages, every minimizer (one stage has minimizers `{2,4}`) | `S=2`, `s=1/3`, `g s=5`; `s=−1`; infimum 0 not attained; no minimizer; four conclusions hold | true; proof cases rechecked (`b=(y−x)/(S−x)∈(0,1]`) | none |
| 3.3 `scarf_inventoryValue` | constant demand 2, `(K,c,p,h)=(5,0,3,1)`; demand `0/4`; 7 laws × 9 settings × 4 periods | `G1`: `S=4`, `G1 4=2`, `s=4/3`; `V2=10.84` on `[−4,−1]`, `8.46, 8.12, 7.78`; formula and `K`-convexity hold at all 252 stages | true; four cases of the `K`-convexity of `H` rechecked | none |
| 4.1 `inventoryValue_le_orderingRuleCost` | never-order and `(s,S)` rule, one and two periods; inadmissible `π 0 10=2`; 153 threshold rules, 4 laws, 6 settings | costs `6` and `5`; `7, 10, 18` with `V2 0=7`; cost `0<V1 10=8`; `(s,S)` cost `=V`, all rules `≥V` (214560 comparisons) | true | none |
| 5.1 `exists_isProductionPlan_zeroInventoryOrdering` | demands `3,1,1,5` data; `h₁=I²`; `g=x²`; demands `−1,2`; `n=0`; 3504 instances | least cost 7 at the three plans (all 8 zero-inventory plans: 36,31,26,7,27,7,7,8); `3<4`; `2<4`; `1<11`; empty plan; all agree | true; exchange step lowers the count of nonzero coordinates | C03 |
| Conventions, `IsMinOn` | Mathlib definition at the pin | `IsMinFilter f (𝓟 s) a`; no membership | gloss wrong, no statement affected | C01 |
| Layer examples | Layer 1 (level `1/2`, `[0,1]`), Layer 4 (`7, 10, 18`), Layer 5 (`15`, `13`) | recomputed as stated | true | none |

- Source locators checked against the text: 17 of 26 (Russo2A 10, FeinbergLewis 7); the 9 into Gallego's notes were not readable.
- Library declarations opened at the pin: 14 in Mathlib (`Order/Filter/Extr.lean` 112; `Topology/Order/Compact.lean` 313; `Topology/Semicontinuity/Basic.lean` 77, 237; `MeasureTheory/Integral/Bochner/Basic.lean` 239, 474, 670, 737; `MeasureTheory/Integral/Lebesgue/Basic.lean` 86; `Analysis/Convex/Jensen.lean` 397; `Analysis/Convex/Function.lean` 228; `Analysis/Real/Sqrt.lean` 177, 208; `Probability/CDF.lean` 56) and 4 in Tau Ceti (`Probability/Quantile.lean` 164, 448; `Probability/Distributions/Affine.lean` 317, 337). All exist with the stated content.
- Cross-roadmap citations resolved: 3 (MarkovDecisionProcesses 2.1 and its Examples on main; StandardDistributions 7.2 on main; RiskMeasures 4.1 at the head of #2895).
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/InventoryTheory/Suggested.lean`: six `sorry` warnings, nothing else. The 17 elaborated signatures were compared with the README statements: no binder lost, same generality.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`): none of the six theorems closes. No padding.
- Headline theorems (1.1, 2.2, 3.2, 3.3, 4.1, 5.1): all six stated; no sorry'd data, no `set_option`, single `import Mathlib`.
- The pull request changes nothing outside the roadmap folder; the automatic checks all passed.

Overlap check: read RiskMeasures, MarkovDecisionProcesses, OptimalControlAndHamiltonJacobi, StandardDistributions; nothing shared (the minimizer interval of 1.2 is owned by RiskMeasures 4.1 and cited, the quantiles by StandardDistributions 7.2 and Tau Ceti; a search of all open and main roadmaps for `K`-convexity, the newsvendor, the economic order quantity, base-stock levels and lot sizing finds this roadmap only).

Source independence: 15 passages compared with 2 sources (Russo2A, FeinbergLewis), none shared beyond one attributed clause of about a dozen words, mostly formula, from Lemma 6.7(2) (FeinbergLewis line 919); largest share Russo2A, 10 of 26 locators; contents compared with Russo2A (model, Proposition 1, §1, §1.1, §2): independent, the roadmap's five layers do not map onto them. Gallego's notes (9 locators) could not be read: neither wording nor contents compared.

Research link: Layer 3 is Scarf's (1960) optimality of `(s, S)` rules via `K`-convexity, which Feinberg and Lewis (2017) extend to Markov decision processes with weakly continuous transitions and discounted and average costs (FeinbergLewis lines 41, 907–920, 982–987); Layer 5 is the Wagner–Whitin (1958) property as README 5.1 gives it.

## Not verifiable

- The locators into Gallego's IEOR 4000 notes in 1.1, 1.2 and 5.1 (Lecture 2 §1 and §1.1; Lecture 7 §1; Lecture 4 §2.1, §2.3 Theorem 4, §2.3.1 and its table): the sources service does not accept the Columbia course page as an author's page and finds no other legal copy. The mathematics of the three sections was verified independently, including the least cost 7 of the four-period example.
- That the textbook proofs Feinberg–Lewis refer to for Lemma 6.7(2) cover the lower semicontinuous case: not read; the README's own proof of 3.2 was checked instead and is complete.

## Source issues

- **Gap** in Russo2A at Lemma 1, proof and footnote 1, p. 3: the source says the convexity of the minimum over levels above `x` follows from its listed convexity rules; it should be proved by partial minimization, which that list does not contain; affects the proof.
- **Gap** in Russo2A at Lemma 1, coercivity, p. 3: the source says the lower bound holds from `p > c` and `h > 0`; it should also assume a nonnegative unit cost and a demand of finite mean, both used silently; affects the proof.

## For the human reviewers

- **Scope.** The cited sources are two sets of course lecture notes (Gallego; Russo, which describe themselves as lightly edited scribe notes, Russo2A lines 12–13) and an author-page version of one paper (FeinbergLewis). The classical papers (Scarf 1960, Wagner–Whitin 1958) are named second-hand only.
- **Not tested.** Gallego's notes carry 9 of the README's 26 locators (sections 1.1, 1.2, 5.1); wording and arrangement were not compared with them.
- **Licence.** The Columbia course page the README gives for Gallego's notes could not be classified as the author's own page by the sources service; a human should confirm it is.
- **Licence.** FeinbergLewis is cited in its author-page version of 20 March 2017; whether its numbering agrees with a journal version was not checked.
