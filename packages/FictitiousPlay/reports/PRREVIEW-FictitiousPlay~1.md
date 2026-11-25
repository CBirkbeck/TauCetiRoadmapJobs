# Review of FictitiousPlay (pull request #3133 at 3b0b403)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed by hand at degenerate parameters, the routes of 1.1–3.3 (including the induction and constants of Robinson's theorem and the summation argument of 3.3) were re-derived step by step, the numerical Checks that could be rerun were reproduced with exact arithmetic, and five of the six open sources were read at their locators. There are two small corrections and one format note, none blocking. Left for the human reviewers: the kind of sources the roadmap rests on (lecture notes and arXiv expositions for locators, the refereed primaries cited without locators) and the mention of a 2026 preprint in the scope section.

## C01 — The bimatrix equilibrium condition is the two-player case of the supplier's `IsNash` (its 3.1), not of `Matrix.exists_mixedNash` (its 2.1)

The Conventions say that Nash equilibria appear unfolded "in the shape of RegretMinimizationAndEquilibria's `Matrix.exists_mixedNash`" (line 76), and the supplier contract cites only 2.1 for it (lines 600–603). That statement is about one matrix `M`: its second inequality is `payoff M a b ≤ payoff M a y`, the saddle condition of the zero-sum game. The condition used in 1.1 and 3.3, with a second matrix `B` and `payoff B x y' ≤ payoff B x y`, is not an instance of it; it is the two-player case of `IsNash` in that roadmap's 3.1 (whose last Check says that `IsNash` reduces to the condition of `Matrix.exists_mixedNash` only for zero-sum games). A reader who follows the citation finds the saddle form of 2.2 and nothing for 1.1. Citing 3.1 `IsNash` for the bimatrix condition, and keeping `Matrix.exists_mixedNash` for the orientation and for the saddle form of 2.2, would make both pointers land.

## C02 — Levin's mis-coordination example has prior weights `(1/2, 0)` for one player and `(0, 1/2)` for the other

In 1.3 (line 172) the example is cited "with prior weights `(1/2, 0)`". Levin's table (his notes, p. 5; its text, line 153) starts player one at `(1/2, 0)` and player two at `(0, 1/2)`; with the same weights for both the first pair would not be a miscoordination. Writing both vectors removes the ambiguity.

## N01 — The route of 3.3 uses the numerical bound `Σ_{t≥1} (t + 1)⁻² < 1`, which summability alone does not give

The `*Needs:*` line of 3.3 lists `Real.summable_one_div_nat_pow`; the constant `4c` needs the value of the tail to be below `1` (for instance from `(t + 1)⁻² ≤ 1/t − 1/(t + 1)`). Any finite bound serves the argument, so either say "a finite constant" or name the telescoping comparison.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 existence (`exists_isFictitiousPlay`) | `t = 0` counts; one-action types | counts at `0` are the zero vector, every action maximizes; recursion uses rounds `< t` only | true | none |
| 1.1 limits are Nash (`isNash_of_tendsto_empiricalMix`) | coordination path; `t = 0` junk | mixtures `(⌈t/2⌉, ⌊t/2⌋)/t → (1/2, 1/2)`, a Nash pair of the identity game; `empiricalMix i 0 = 0` irrelevant to the limit | true | none |
| 1.2 absorbing (`isFictitiousPlay_absorbing`) | `t = 0`; `A = B = [[1,1],[1,0]]` at `(0,0)`; prisoner's dilemma | at `s = 0` counts `0`, column `j 0` of `A` strictly maximal at `i 0`; non-strict: `A·(1,0) = (1,1)`, row `1` admissible | true; strictness used | none |
| 1.3 nonnegative regret (`exists_zero_le_regret`) | `T = 0`; coordination path | `E 0 = R 0 = 0`; `E (T+1) ≥ E T + A (i T)(j T)`; regret equals `(A·count j T) a − Σ A (i s)(j s)` | true | none |
| 1.3 coordination (`coordination_regret`) | `T = 0, 1, 2, 3`; general `T` | column counts `(⌊t/2⌋, ⌈t/2⌉)`, row `(⌈t/2⌉, ⌊t/2⌋)`; regret vs `0`: `0, 0, 1, 1` = `⌊T/2⌋`; vs `1`: `⌈T/2⌉` | true | none |
| 2.1 Robinson (`robinson_vectorSystem`) | `[[3]]`; `A = 0`; `A = 0` with `V 0 = c`, `U 0 = 0`; `t = 0` | `D ≡ 0`; `D ≡ 0`, `T = 0` works; `D ≡ c` so no uniform `T` without `init`; `D 0 = 0 ≤ 0` | true; first axiom used | none |
| 2.1 route (R1)–(R6) | re-derived | `t·min V ≤ X·V t = U t·Y − U 0·Y + X·V 0 ≤ t·max U`; `D(s+τ) = D′τ + D s`; `4αt* + εt/2 ≤ εt` iff `t ≥ 8αt*/ε` | each step holds | none |
| 2.2 zero-sum (`tendsto_fictitiousPlay_zeroSum`) | `[[2,0],[0,1]]`; `[[1],[0]]`; `t = 0`; RPS and Daskalakis's matrix at `t = 20000` | value `2/3` at `(1/3,2/3)`; value `1`; both bounds `0` at `t = 0`; gaps `0.0094`, `0.0231` | true | none |
| 3.1 Shapley (`shapley_not_tendsto`) | all off-diagonal starts to round 22; start `(0,0)` | 96 sequences, 0 diagonal pairs; diagonal start cycles `2,1,0` with equal counts; payoffs sum `1` off diagonal; `2/3 < 1` | true; `i 0 ≠ j 0` used | none |
| 3.1 matrices | Levin's table entry by entry | row payoff `1` at `(R,S),(S,P),(P,R)`; column at `(R,P),(S,R),(P,S)`; `shapleyCol = shapleyRowᵀ` | agree | none |
| 3.2 dominance (`eventually_eq_of_dominanceSolvable`) | README example; `K = 0`; `K = 1` | `ρ = (1,1,3)`, `σ = (2,3,0)` satisfy the hypotheses; 22 sequences, all at `(2,1)` from round 5; `K = 0` forces singletons | true | none |
| 3.3 potential (`tendsto_gap_of_weightedPotential`) | coordination path, odd `T`; `w₁ = 0` example; identity re-derived | sum `(T+1)/T²`; column gap `0.16, 0.13202, 0.13571, 0.13518` at `10²…10⁵`; `(t+1)²(f(t+1) − f t) = t·g t + p t − f t` | true; `w₁ > 0` used | none |
| 3.3 route constants | re-derived | `t/(t+1)² ≥ 1/(4t)`; Lipschitz constant `3c`; step `12c/(t+1) ≤ C/t`; tail sum `≥ η²/(C+η)` | holds | N01 |
| Nash convention (Conventions) | supplier 2.1 and 3.1 opened | `Matrix.exists_mixedNash`: `payoff M a b ≤ payoff M a y` (one matrix); bimatrix form is `IsNash` for two players | pointer misses | C01 |
| 1.3 attribution | Levin p. 5 | weights `(1/2, 0)` and `(0, 1/2)` | incomplete | C02 |

- Source locators checked against the text: 22 of 24 (Levin 7, Cloud–Wang–Kerr 6, Daskalakis 5, Li et al. 2, Dán 1, and the Shapley run lengths `1, 1, 3, 5, 8, 13, 20, 30, 45, 67, 99, 146` recomputed); the 2 into Berger's working paper not read.
- Library declarations opened at the pin: 18 Mathlib names of the supplier contracts, each elaborated with `#check` and its cited file confirmed (for example `Convexity.StdSimplex.range_toFun_comp_weights`, `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean` line 111; `Real.summable_one_div_nat_pow`, `Mathlib/Analysis/PSeries.lean` line 330). No game-theoretic object beyond `IsSaddlePointOn` and Sion's theorem in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: RegretMinimizationAndEquilibria Conventions, 1.1, 2.1, 2.2, 3.3 on main; `simplex` and `regret` agree with its `Suggested.lean` (lines 33, 50) and `Matrix.payoff`, `Matrix.exists_mixedNash` are declared there (lines 184, 193).
- Signature pass: `#check @name` read for all 19 declarations; the binders the definitions drop (`[Nonempty]`, `[Fintype]` on `playCount`, `empiricalMix`, `regret`, `IsFictitiousPlay`) are not used by them, and every theorem keeps `[Fintype]`, `[Nonempty]` (and `[DecidableEq]` where `playCount` occurs). README and Lean generality agree for all 10 theorems.
- One-tactic probe (`simp`, `aesop`, `decide` on the existence, Robinson, coordination and Shapley statements): none closes. All ten headline theorems of the README are stated; none is declared not statable.
- Automatic checks: all passed. Targeted build of the module: success, `sorry` the only warning. Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`. No change outside the folder.

Overlap check: read ApproximateNashEquilibria, PotentialGamesAndPriceOfAnarchy, RegretMinimizationAndEquilibria; nothing shared (the first lists learning dynamics as not treated, the second lists weighted potential games as outside its scope, the third owns the simplex, payoff, regret and value, which this roadmap copies or writes out and does not own). Each copy of `simplex` is in its roadmap's own namespace.

Source independence: 9 passages compared with 4 sources (Levin, Cloud–Wang–Kerr, Daskalakis, Li et al.), none shared; largest share Levin, 7 of 24 locators; contents compared with Levin's notes (one unsectioned part on fictitious play): independent (Levin's lemma on payoffs follows his Shapley statement, here 1.3 precedes 3.1 because 3.1 needs it; Layers 2, 3.2, 3.3 have no counterpart there). Berger's working paper could not be read.

Research link: Layer 2 is Robinson (1951); 3.1 Shapley (1964); 3.2 Nachbar (1990); 3.3 Monderer–Shapley (1996). The rate question (Karlin 1959; Daskalakis–Pan 2014) continues it. Rests on the README's references and scope and on Li et al., §3.6.

## Not verifiable

- Berger, *Brown's original fictitious play*, Definition 3 (pp. 5–6) and §2.2 (p. 6), cited in 3.3: the working paper's host is not one the sources service can classify and the journal version is paywalled; looked in the cache, at the EconWPA address and at the DOI.
- Robinson (1951), Shapley (1964), Nachbar (1990), Monderer–Shapley (1996), Brown (1951): cited without locators and not read; the statements attributed to them were checked only through Levin, Daskalakis, Cloud–Wang–Kerr, Dán and Li et al.
- The Checks over all 6561 and 4096 small games (1.2, 1.3), the nine-matrix check of (R0)–(R4) and the grid check of 3.1 were not rerun; the theorems they illustrate were re-derived.

## Source issues

- **Misprint** in Cloud–Wang–Kerr arXiv:2212.09941v1 at Appendix B, proof of Lemma 4, p. 23: the source says the bound holds from `8at*/ε` on at the start and from `16at*/ε` at the end; it should be `16at*/ε` in both places, as its inequality `8at* + εt/2 ≤ εt` requires; affects nothing.
- **Misprint** in Cloud–Wang–Kerr arXiv:2212.09941v1 at Appendix B, proof of Lemma 4, Case 1, p. 23: the source says Lemma 3 bounds `max V − min V` at the end of the block; it should be `max V − min U`, the quantity of Lemma 3 and of display (3); affects nothing.
- **Misprint** in Cloud–Wang–Kerr arXiv:2212.09941v1 at Appendix B, proof of Lemma 4, Case 2, p. 23: the source says `min U(θt*) ≥ aθt*`; it should be `min U(θt*) ≥ min U(0) − aθt*`, combined with `max V(0) = min U(0)`; affects nothing.
- **Misprint** in Levin, *Learning in Games*, at the reference list, item [14], p. 10: the source says Robinson's paper appeared in the Annals of Mathematical Statistics; it should be the Annals of Mathematics 54 (1951) 296–301; affects nothing.
- **Gap** in Levin, *Learning in Games*, at the proof of Shapley's non-convergence, p. 8: the source says the realized payoffs always sum to `1`; it should first show that play never reaches a diagonal pair, which holds only for off-diagonal starts; affects the proof.

## For the human reviewers

- Scope: the locators are into lecture notes and slides (Levin, Daskalakis, Dán) and two arXiv texts; the refereed primaries (Robinson 1951, Shapley 1964, Nachbar 1990, Monderer–Shapley 1996) are cited without locators and were not read. The routes of 3.2 and 3.3 are the author's own.
- Licence: `TauCetiRoadmap/FictitiousPlay/README.md` lines 554–557 mention a 2026 preprint by title with the label "Google Research, cogentic_research_papers"; I could not locate or classify it. The README says nothing rests on it.
- Licence: Berger's working paper is cited from an archive host whose status I could not classify; its two locators were not checked.
- The description states that the roadmap was drafted and reviewed by AI agents, with the author taking responsibility for the content.
