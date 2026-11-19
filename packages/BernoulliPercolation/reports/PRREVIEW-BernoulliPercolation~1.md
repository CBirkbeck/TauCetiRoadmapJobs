# Review of BernoulliPercolation (pull request #2567 at 893c935)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on its degenerate cases (`d = 0, 1, 2`, `n = 0, 1, 2`, `p ∈ {0, 1}`, natural-number subtraction at `d = 0`) and every constant of the Peierls route was recomputed (`9/160` at `p = 4/5`, `m = 7` at `p = 7/10`, the bound `n ≥ 2k + 4`, the cycle counts); all thirteen locators into Duminil-Copin's notes agree with the text. There is one small correction (the countability hypothesis of Harris's inequality is not needed) and two format notes, none blocking. For the humans: the eighteen locators into Grimmett's book could not be read (the author's server presents a broken certificate chain), so the wording and arrangement comparison was made against Duminil-Copin's notes only.

## C01 — Harris's inequality 3.1 holds for every index type, so `[Countable ι]` restricts the statement without being needed for its truth

Sections 2.1 and 2.2 are stated for an arbitrary type `ι`, and 3.1 (line 263) for a countable one, justified by "the setting of the sources and of every use in Layer 6" (line 271). A later consumer with an uncountable index set would have to redo the reduction. The general case follows from the countable one in a few lines: a measurable subset `S` of `Set ι` depends on a countable set `J` of coordinates, so `S` is the preimage of `S' = {s ∩ J : s ∈ S}` under `s ↦ s ∩ J`; `S'` is again an upper set (if `t ⊇ s ∩ J` with `t ⊆ J`, then `t ∪ (s \ J) ⊇ s` lies in `S` and restricts to `t`); and the image of `setBer(u, p)` under restriction to `J` is `setBer(u ∩ J, p)` by `MeasureTheory.Measure.infinitePi_map_restrict'`, which the supplier contracts already list. Taking `J` common to `S` and `T` reduces the inequality to the countable case.

Either would do: drop `[Countable ι]` from `setBernoulli_mul_le_of_isUpperSet` and add this reduction as the last step of the route, or keep the hypothesis and replace the justifying sentence by one saying that the general case reduces to the countable one in this way.

## N01 — 1.1, 1.2 and 1.5 carry no source locator

The lattice, the model and translation invariance are in Duminil-Copin's notes at the Notation paragraph of p. 1, the second paragraph of p. 2, and the sentence after the definition of `p_c` on p. 2 together with Lemma 2.8, p. 11; citing them would give each section of Layer 1 a locator.

## N02 — the last Check of 6.2 reports a random experiment

"Random tests with random edges inside the box `[−3, 3]²` … 3000 samples" (lines 487–490) cannot be recomputed by a reader, unlike the three Checks before it. It would read better as a remark after the Checks, or replaced by one more explicit configuration (for instance an L-shaped cluster of three vertices with its dual cycle of length 8).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `latticeGraph` | `d = 0, 1, 2`; `(0,0)` vs `(1,1)` | `d = 0`: empty sum `0 ≠ 1`, no edge; `(1,1)`: ℓ¹ distance 2, not adjacent; 4 neighbours of origin | sound | none |
| 1.2 `bondPercolation` | `p = 0, 1, 1/3`; non-lattice pair | `setBer(u,0) = dirac ∅`, `setBer(u,1) = dirac u` at the pin; one edge mass `1/3`; pair `{(0,0),(1,1)}` mass 0 by a.e. subset | sound | none |
| 1.3 `percolationProb`, `criticalProb` | `d = 0, 1`; `p = 0, 1`; inf variant | `d = 0`: θ ≡ 0, sup `= 1`, `sInf ∅ = 0`; `d = 1`: θ = 0 on `[0,1)`, θ(1) = 1, `p_c = 1`; set contains 0 | sound | none |
| 1.4 measurability | finite `V`; uncountable `V` | finite: both events empty; uncountable: empty graph and a path through vertices outside any countable set of pairs agree on those pairs, differ on the event | sound | none |
| 1.5 translation invariance | `x = (1,0)`, half-line configuration | cluster of `(1,0)` infinite, cluster of `0` is `{0}`: events differ, laws agree by reindexing the product | sound | none |
| 2.1 coupling | one coordinate, `i ∈ u`, `i ∉ u`, `p = 0, 1/3, 1` | volume of `[0,p)` is `p`; `i ∉ u`: point mass at false `= Ber(False,False,p)`; `p = 0`: empty set a.s. | sound | none |
| 2.2 monotone in `p` | `S = {i₀ ∈ s}`, complement, `i₀ ∉ u`; 3-element `ι` | `p`; `1 − p` (decreasing, not upper); `0`; number of upper sets of a 3-set is 20 | sound | none |
| 2.3 mono and phases | `d = 0, 1`; `p = p_c` | `p < p_c`: some `q > p` with θ(q) = 0, so θ(p) ≤ 0; `p > p_c`: `p` not in the set; θ(p_c(1)) = 1, θ(p_c(0)) = 0 | sound | none |
| 3.1 Harris | `ι = u = {a,b}`, `p = 1/2`; `p ∈ {0,1}`; increasing vs decreasing; uncountable `ι` | `3/4 · 1/2 = 3/8 ≤ 1/2`; `1/4 = 1/4`; `1/4 > 0` for a decreasing `T`; weights: `|s|+|t| = |s∩t|+|s∪t|`; holds for all `ι` by reduction | sound | C01 |
| 4.1 zero–one law | `d = 0, 1, 2`; finite-edge event | `d = 0`: event empty, value 0; `d = 1`: 0 for `p < 1`, 1 at `p = 1`; origin isolated on `ℤ²`: `(1−p)⁴ ∈ (0,1)` | sound | none |
| 4.2 iff with θ | `d = 0`; `d = 1`, `p = 1`; both directions | `d = 0`: `0 = 1` false, `0 < 0` false; `d = 1, p = 1`: `1 = 1`, `0 < 1`; θ = 0 gives a countable union of null sets | sound | none |
| 5.1 path counts | `ℤ²` `n ≤ 6`, `ℤ` , `ℤ³` `n ≤ 4`; `d = 0`; `n = 0, 1, 2` in second statement | `4,12,36,100,284,780 ≤ 4,12,36,108,324,972`; `ℤ`: `2 = 2`; `6,30,150,726 ≤ 6,30,150,750`; `d = 0, n = 0`: 1 > 0 (excluded by `n ≥ 1`); second, `n = 0`: `1 ≤ 1`; `d = 0, n = 1`: `0 ≤ 0⁰ = 1` | sound | none |
| 5.2 lower bound | `d = 0, 1, 2` | `d = 0`: `−p < 1` always, θ ≡ 0, `−1 ≤ 1`; `d = 1`: `p < 1`, `1 ≤ p_c(1) = 1`; `d = 2`: `1/3 ≤ p_c(2)`; bound `2d(2d−1)^(n−1)pⁿ → 0` | sound | none |
| 6.1 `closedDualGraph`, `rayEdges`, `Surrounds` | empty graph, full lattice, both values of `i`, two 4-cycles | `i = 0`: crosses vertical edge `v`–`v+(0,1)`; `i = 1`: horizontal; empty ↦ lattice, lattice ↦ no edge; square at origin: 1 ray edge; square at `(1,0)`: 2 | sound | none |
| 6.2 duality | clusters `{0}`, `{0,(1,0)}`, non-lattice edge `0–(5,5)` | 4-cycle, 1 ray edge; 6-cycle uses `k = 1` only; component `{0,(5,5)}` still enclosed by the 4-cycle; boundary degrees 0, 2 or 4 | sound | none |
| 6.3 Peierls | `p = 4/5, 7/10, 2/3`; `n = 2k+4`; cycle counts | `q⁴/(9(1−q)(1−q²)) = 9/160` at `q = 3/5`; `0.9¹⁶/0.171 > 1`, `0.9¹⁸/0.171 < 1` so `m = 7`; `q = 1` diverges; `n·p_n/2 = 2,6,28,140,744,4116`; area sums `1,4,22` | sound | none |
| 6.4 dimensions, upper bound | `d = 0, 1, 2`; `d = d'` | `d = 0`: `0 ≤ θ`; `p_c(1) = p_c(0) = 1 > 2/3` (so `d ≥ 2` needed); θ_d(p) = 0 ⇒ θ₂(p) = 0 ⇒ `p ≤ 2/3`; `Real.sSup_le` needs `0 ≤ 2/3` | sound | none |

- Source locators checked against the text: 13 of 31 (all of Duminil-Copin's: pp. 2, 3, 5, 6, 11; Propositions 2.1, 2.3, Corollary 2.2, Lemma 2.8, Corollary 2.9, Theorem 1.1); 18 into Grimmett not readable.
- Library declarations opened at the pin: 38, among them `ProbabilityTheory.setBernoulli` (`Mathlib/Probability/Distributions/SetBernoulli.lean:44`), `setBernoulli_ae_subset` (:76, countable), `setBernoulli_singleton` (:106), `fkg` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`), `measure_zero_or_one_of_measurableSet_limsup_atTop` (`Mathlib/Probability/Independence/ZeroOne.lean:290`), `Integrable.tendsto_eLpNorm_condExp` (`Mathlib/Probability/Martingale/Convergence.lean:415`), `infinitePi_map_restrict'` (`Mathlib/Probability/ProductMeasure.lean:412`), `measure_iUnion_null` (an alias, `Mathlib/MeasureTheory/OuterMeasure/Basic.lean:120`), `TauCeti.Probability.tailProcess` (`TauCeti/Probability/Process/Tail/Basic.lean:47`), `ergodic_shift_infinitePi_const` (`TauCeti/Probability/Ergodic/BernoulliShift.lean:63`); every file named in the supplier contracts is the right one.
- Cross-roadmap citations resolved: 2 (DimerModelsAndLozengeTilings 4.1 and 4.3, on main, cited as a boundary and not as a supplier).
- Duplication by object: no percolation, Harris inequality, monotone coupling of `setBernoulli` or count of self-avoiding walks in the pinned Mathlib or Tau Ceti, on main, or at any open head; ConstructiveFieldTheoryPhi4 3.3 is FKG for Gibbs measures on `ℝ^V`, a different object.

Overlap check: read ConstructiveFieldTheoryPhi4, SpanningTreesAndShortestPaths, DimerModelsAndLozengeTilings, PoissonApproximation, HamiltonianCycles (and BooleanFunctionAnalysis); nothing shared. DimerModelsAndLozengeTilings 4.3 owns tail triviality of identically distributed products `ν^{⊗I}`; 4.1 here is one event under a product with two different factors, proved from Mathlib's law directly.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 17 `sorry` warnings and nothing else; the elaborated types of all 24 declarations agree with the README statements, no binder lost. One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `norm_num`, `exact?`): none of the 17 theorems closes. All headline theorems of the Summary are stated.

Source independence: 13 passages compared with 1 source (Duminil-Copin's notes), none shared; largest share Grimmett, 18 of 31 locators, text and table of contents not readable; contents compared with Duminil-Copin's notes (§1, 2.1, 2.2, 2.5): independent (their §1 is split into Layers 1, 5 and 6 and placed around Layers 2–4; Layer 6 after Layer 3 is forced by the use of 3.1 in 6.3).

Research link: The coupling, Harris's inequality and the zero–one law are the tools that Harris (1960) and Kesten (1980, `p_c(2) = 1/2`) and the uniqueness, sharpness and Russo–Seymour–Welsh theory build on; rests on the README's references and Duminil-Copin's notes, §§3–4.

## Not verifiable

- Grimmett, *Probability on Graphs*, second edition: all 18 locators (display (3.1), inequalities (3.5) and (3.6), Theorems 3.2, 3.10, 3.12, 3.27, Section 3.4, Exercises 4.2 and 5.8, pp. 40–44, 53, 83, 90, 130). The author's page at Cambridge presents an incomplete certificate chain and was not fetched; the publisher's page is not open. Of the sampled targets, 1.3, 5.1 and 6.4 have no other locator; their mathematics was checked directly.
- The constant `2/3` as a consequence of Grimmett's Theorems 3.12 and 3.10: not read; the route of 6.3 is self-contained and was recomputed.

## Source issues

- **Misprint** in DuminilCopin2018 at proof of Corollary 2.2, p. 5: the source says the chain of inequalities ends with the probability of the event at parameter p; it should be at the larger parameter p′; affects nothing.
- **Misprint** in DuminilCopin2018 at proof of Lemma 2.8, p. 11: the source says approximation by events on finitely many edges is Exercise 10; it should be Exercise 1 (p. 4), Exercise 10 being about increasing events generating the σ-algebra; affects nothing.

## For the human reviewers

- **Not tested.** Grimmett's book has the largest share of the locators (18 of 31); its text and table of contents could not be read, so wording and arrangement were compared with Duminil-Copin's notes only.
- **Licence.** DuminilCopin2018 is an unpublished set of lecture notes (version of October 7, 2018), read from the author's page at IHÉS; it is cited for locators only, nothing is reused.
