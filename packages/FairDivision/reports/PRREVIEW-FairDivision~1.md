# Review of FairDivision (pull request #2929 at cb98077)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed (the cake theorems without positivity or normalisation, the weak hunger condition, the three EF1 theorems including players of value zero, existence, uniqueness and the Talmud form of the garment-consistent division with each hypothesis counterexample), every numerical Check reproduces, and `Suggested.lean` elaborates with `sorry` as its only warning. There are one small correction and one format note, neither blocking. Three of the four sources (Su; Caragiannis et al.; the Handbook chapter) could not be read from a place the project accepts, so their locators are unverified; that and the status of the cited copies are left to the human reviewers.

## C01 — "Constrained equal losses from the half-claims" does not describe the upper half of the Talmud rule

A reader who takes the Summary's last headline at its word (lines 30–32), and the matching phrases in 5.1 (line 388–389, and the Check at lines 396–398) and in the Check of 5.3 (line 450), applies the constrained-equal-losses rule to the half-claims; that rule cannot distribute an estate above half the total claim, and for claims `(2, 4, 6)` "losses `(1, 1, 1)` from the half-claims `(1, 2, 3)`" reads as `(0, 1, 2)`, not the `(1, 3, 5)` the Check states. The definition in 5.1 and the Lean `IsTalmudAllocation` are exact (`x i = d i − min (d i / 2) l`), so no stated result is touched: the loss is taken from the full claim and is the constrained equal award of the half-claims, equivalently every claimant receives its half-claim plus constrained equal losses of the half-claims on `E − (∑ d)/2`. Recomputed: `(2, 4, 6)`, `E = 9` gives `l = 1`, losses `(1, 1, 1)`, awards `(1, 3, 5)`; `(1, 3)`, `E = 3` gives `l = 1/2`, awards `(1/2, 5/2)`.

The smallest change is the wording, for example in the Summary "and otherwise each claimant loses, from its full claim, a constrained equal award of the half-claims", and in the two Checks "losses `(1, 1, 1)`, each at most the half-claim, from the claims `(2, 4, 6)`". The shorthand is inherited from the source (see Source issues).

## N01 — A Mathlib declaration is listed in the supplier contracts that no route uses

`Metric.isCompact_of_isClosed_isBounded` (line 517) appears in no `*Needs:*` line; 1.1 obtains compactness of `simplex (Fin (n + 1))` from `Convexity.StdSimplex.compactSpace` and the closed embedding. Either drop it from the contracts or name it in 1.1 as the alternative route.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `cutPoint`, `piece` | `x = (1/4, 3/4)`; `(1/2, 0, 1/2)`; wrap-around successor | cut points `0, 1/4, 1`; pieces `[0,1/4)`, `[1/4,1)`; middle piece `[1/2,1/2) = ∅`; wrapped last piece `[1/4, 0) = ∅` | agrees | none |
| 1.1 continuity of `t ↦ μ [0, t)` | unit mass at `1/2`; density `1/t` | jump `0 → 1` after `1/2`; `μ[0,t) = ∞` for `t > 0`, `0` at `0`; right limit at `t<1` is `μ[0,t] = μ[0,t)` | true under both hypotheses | none |
| 2.1 `exists_proportional_intervals` | `n = 0`; two unit masses at `1/2`; two densities `1/t`; zero measure | equality; only one piece holds the atom; `μ[c,1) = −ln c < ∞ = μ[0,1)/2`; `0 ≤ 0` | true; both hypotheses needed | none |
| 2.1 route | step with `r` players | taker gets `1/r`; others keep `≥ (r−1)/r`, then `≥ 1/(r−1)` of it, so `≥ 1/r` | sound, empty pieces allowed | none |
| 3.1 `exists_envyFree_of_closed_hungry` | `n = 0`; both prefer piece 0 always; preference switching at `x 0 = 1/2`; identical preferences | simplex `{(1)}`, `π = id`; hunger fails at `(0,1)`; set `{x 0 > 1/2}` not closed; conclusion is a common point (KKM) | true; hypotheses needed | none |
| 3.1 route against TopologicalCombinatorics 1.3 | `IsSpernerLabelling` there: `x (lab x) ≠ 0`; closeness `≤ 1` per coordinate | labels with `y k > 0` are Sperner; `y p / N` within `1/N`; closed sets pass the limit | supplier states exactly what is used | none |
| 3.2 `exists_envyFree_intervals` | two uniform measures on `[1/2,1)`, cut `(3/4,1/4)`; argmax hungry without positivity | both pieces worth `1/2`; empty argmax piece forces max `0`, so a positive-length piece is argmax | true | none |
| 3.2 grid Check | densities `(2,1,0)`, `(0,1,2)`, `(1,0,2)`, `N = 3, 6, 12, 24`, owners `2x₀+x₁ mod 3` | fully labelled cells `3, 1, 7, 23`; largest envy `1, 1/3, 1/3, 1/6`; bounds `16/N = 16/3, 8/3, 4/3, 2/3` | reproduces | none |
| 3.2 envy bound | two close points | cut points differ `≤ n/N`; piece values `≤ 2ω`; envy `≤ 4ω(n/N)` | correct | none |
| 4.1 `IsEF1`, `IsParetoOptimal` | one good both value 1; two goods to one player; no goods; no players | envy removed by deleting the good; `1 > 0` after deleting either; vacuous; no allocation | definitions as intended | none |
| 4.2 `exists_isEF1_of_monotone` | one good valued `−1` by two players; cycle swap; new good to unenvied player | holder: `0 > −1`, envied bundle empty, not EF1; swap keeps family, values rise; `u j (B_i) ≤ u j (B_j)` | true; monotonicity needed | none |
| 4.3 `exists_isEF1_balanced` | three goods valued 1, two players; negative good | sizes `2, 1`, EF1; all to one: `2 > 0`, not EF1; `−1` example fails | true | none |
| 4.4 `exists_isEF1_isParetoOptimal` | values `1,1` vs `2,2`; exhaustive two-stage selection, values in `{0,1,2}` (2 players ≤ 4 goods, 3 players 3 goods), `{0,1}` (3 players 4 goods) | max sum gives both to player 1, envy `1 > 0` after deletion; product `2` splits; 73666 selected allocations, 0 failures | true; value-0 cases of the route check | none |
| 5.1 `garmentShare` | `(1/2, 1, 1)`; claim 1 against 3, `t = 0, 1/2, …, 4` | `1/4`, other `3/4`; `0, 1/4, 1/2, 1/2, 1/2, 1/2, 1/2, 3/4, 1`; slopes `0, 1/2, 1` | agrees | none |
| 5.1 `IsTalmudAllocation` | `(1,3)`, `E=2`; `(2,4,6)`, `E=9`; `(1,2)`, `E=1`; `(1,3)`, `E=1, 3` | `(1/2,3/2)`; `(1,3,5)`; `(1/2,1/2)` vs proportional `(1/3,2/3)`; `(1/2,1/2)` vs CEL `(0,1)`; `(1/2,5/2)` vs CEA `(1,2)` | agrees | C01 (wording) |
| 5.2 `existsUnique_isDivision_isGarmentConsistent` | `(1,1)`, `E=−1`; `(−1,2)`, `E=0`; `(1,1)`, `E=3`; empty and one-element `ι`; 20000 random problems | `(−1/2,−1/2)` consistent, not a division; forced award `−1/2 ∉ [0,−1]`; no division; unique; Talmud allocation always a consistent division | true; each hypothesis needed | none |
| 5.3 iff | `l < 0` cases; `(1,1)`, `E=−1`; `(1,1)`, `E=3`; `(−1,2)`, `E=0` | `l<0` forces sum `< 0` or `E > ∑d`; Talmud `(−1/2,−1/2)`; `(3/2,3/2)`; `(−1/2,1/2)` | true under hypotheses, false without | none |
| Scope: KKM relation | closed sets `C_k`, `pref x = {k : x ∈ C_k}` | hunger at `x` is `x ∈ C_k` for some `k` in the support of `x`, the covering condition | as stated | none |

- Source locators checked against the text: 11 of 11 into KarlinPeres2017 (lines 8748, 8763, 8805, 8858, 8911, 8934, 8956, 8998, 9008, 9043, with printed pages 194–201); 0 of 10 into the other three sources (not readable).
- Library declarations opened at the pin: 21 Mathlib declarations of the contracts, each at the file the README names (for example `Convexity.StdSimplex.range_toFun_comp_weights`, `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean` line 111; `MeasureTheory.tendsto_measure_iInter_atTop`, `Mathlib/MeasureTheory/Measure/Continuity.lean` line 223; `Finite.exists_infinite_fiber`, `Mathlib/Data/Fintype/Pigeonhole.lean` line 87). No fair-division, Sperner or envy-freeness declaration exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 4 of 4. RegretMinimizationAndEquilibria 1.1 `simplex` on main (identical body); TopologicalCombinatorics 1.1 and 1.3 at its open head (`simplexGrid`, `IsSpernerLabelling`, `exists_close_bijective_labels`, with the fair-division consumer named in its downstream section); KakutaniFixedPointAndContinuousGames 4.1 at its open head (KKM in a real normed space, from Brouwer).
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/FairDivision/Suggested.lean`, 8 `sorry` warnings and nothing else; the elaborated types of all 18 declarations compared with the README statements, no binder lost, nothing changed.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`) on a copy: none of the 8 theorems closes; no padding. All headline theorems of the README are stated; none is declared not statable.
- The automatic checks all passed on this head; none was set aside.
- Pull request text read against the head: 8 theorems, 10 definitions, the single import, the suppliers and the open dependency on TopologicalCombinatorics all agree.

Overlap check: read TopologicalCombinatorics, HousingMarketsAndAssignmentGames, GeneralEquilibriumTheory, RegretMinimizationAndEquilibria (and CooperativeGames, KakutaniFixedPointAndContinuousGames for the Talmud rule and KKM); Sperner's lemma with owners is owned by TopologicalCombinatorics and consumed here; `simplex` is owned by RegretMinimizationAndEquilibria and copied; `IsParetoOptimal` of GeneralEquilibriumTheory is a different object (commodity allocations with endowments) under another namespace; envy-free prices of HousingMarketsAndAssignmentGames are a different object; CooperativeGames excludes the nucleolus; nothing shared.

Source independence: 10 passages compared with 1 source (KarlinPeres2017), none shared beyond formulas; largest share KarlinPeres2017, 11 of 21 locators; contents compared with KarlinPeres2017 Chapter 11 (§11.1 with §11.1.1, §11.2): independent (Layers 1–3 divide §11.1 by dependency with 3.1 taken from elsewhere, Layer 4 has no counterpart, Layer 5 restates §11.2 per problem). Su, Caragiannis et al. and the Handbook chapter could not be read, so no wording was compared with them.

Research link: Layer 4 states the EF1 existence results of Lipton–Markakis–Mossel–Saberi (2004) and of Caragiannis–Kurokawa–Moulin–Procaccia–Shah–Wang (2019, maximum Nash welfare); Layer 3 is the Simmons–Su Sperner argument (Su 1999); Layer 5 is the Aumann–Maschler Talmud rule. Rests on the README's references and KarlinPeres2017 Chapter 11.

## Not verifiable

- 3.1, Su §3 (theorem p. 6, proof pp. 6–7) and §4 (pp. 7–8), including the description of Su's hunger condition: the copy on the author's page was refused by the sources service (the address names no author) and no open-repository copy was found.
- 4.1, 4.2 (§1.3), 4.3 (§3, p. 12:7), 4.4 (Definition 3.1, Theorem 3.2, pp. 12:7–12:9), Caragiannis et al., including footnote 1 on the empty bundle: publisher page closed; the addresses tried on an author's page do not exist.
- 4.2, Bouveret–Chevaleyre–Maudet Theorem 12.8 and its proof sketch (p. 301): publisher page in no licence class; the cited copy is on an editor's page, not a chapter author's.
- The mathematics of 3.1 and 4.1–4.4 was verified independently of these texts (table above); only the locators and the comparison of wording are open.

## Source issues

- **Misprint** in KarlinPeres2017 at Theorem 11.2.3, second bullet, printed page 201: the source says that for assets above half the total claim the rule is constrained equal losses applied to the half-claims with the full assets; it should be each half-claim plus constrained equal losses of the half-claims on the assets minus half the total claim, as its own explicit formula gives; affects nothing.

## For the human reviewers

- **Scope.** The cake layers rest on a textbook (KarlinPeres2017, Chapter 11) and an expository Monthly article (Su 1999); Layer 4 on ACM TEAC 2019 and a CUP handbook chapter; Aumann–Maschler is named without a locator (README lines 583–586).
- **Licence.** The Handbook chapter is cited from a copy of the whole book on an editor's page (README lines 578–582), not a chapter author's; the sources service did not accept it. Whether that copy is a legal place is yours to settle.
- **Not tested.** Wording and locators were compared only with KarlinPeres2017 (largest share, 11 of 21 locators, read in full for Chapter 11); Su, Caragiannis et al. and the Handbook chapter were not read.
