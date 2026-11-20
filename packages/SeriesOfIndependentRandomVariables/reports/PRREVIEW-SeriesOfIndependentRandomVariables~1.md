# Review of SeriesOfIndependentRandomVariables (pull request #2686 at e87d7fb)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check, route or source locator was found false. All ten theorems were tested on degenerate instances (`n = 0`, negative levels, vanishing or negative norming constants, non-integrable summands, a non-measurable limit) and both maximal inequalities were re-enumerated exactly; every Durrett, Moshayedi and Itô–Nisio locator was read at its page. There are two small corrections (a neighbouring use of Lévy's inequality on main that the scope does not name; two results that carry an attribution but no locator) and one format note, none blocking. Two points are left to the human reviewers.

## C01 — The scope does not name NoncommutativeIntegration §6.2, which already uses Lévy's inequality for symmetric sums

A reader of "Scope and ownership" is told which neighbouring roadmaps touch these results (StochasticCalculus §1.5, MathematicalStatisticsAsymptotic §1.2, MarkovDecisionProcesses §6.1) and will conclude that no roadmap on main mentions Lévy's inequalities. One does: `TauCetiRoadmap/NoncommutativeIntegration/README.md`, §6.2 (line 1109), proves Kahane's inequality "through Lévy's reflection inequality `P(max_k‖S_k‖>t)≤2P(‖S_n‖>t)`" for sign sums `∑ ε_k x_k` in a Banach space, citing Ledoux–Talagrand, Proposition 2.3, and carries a Check of it at line 1121. It is a step of a route there, not a named target, and neither statement contains the other (there: Banach-valued coefficients, Rademacher signs; here in 2.2: real summands, arbitrary symmetric laws, the one-sided form as well), so 2.2 keeps its owner.

One sentence under "Left to other roadmaps" would settle it, for example: NoncommutativeIntegration §6.2 uses Lévy's inequality for Rademacher sums with coefficients in a Banach space as a step towards Kahane's inequality; 2.2 is the real-valued statement for arbitrary independent symmetric summands and is not used there.

## C02 — Lévy's inequalities in the generality of 2.2, and the Marcinkiewicz–Zygmund law for `0 < p < 1`, have an attribution but no locator

An implementer who wants to compare the statement of 2.2 or the `p < 1` half of 4.2 with a printed one has nowhere to look. In 2.2 (line 149) the only locator is Durrett, Theorem 5.2.7, p. 278, which the README itself says covers the first inequality only, for identically distributed summands, `a > 0` and `≥`; the absolute-value inequality and the non-identically-distributed case rest on "P. Lévy, 1937". In 4.2 (line 359) the case `0 < p < 1` rests on "Marcinkiewicz and Zygmund, 1937". Both statements are correct as written (the routes given prove them; see the table kept with this review), so this does not touch a result.

A locator for each would close it. Candidates I have not opened, to be checked before they are cited: Ledoux–Talagrand, *Probability in Banach Spaces*, Proposition 2.3 (the one NoncommutativeIntegration §6.2 cites for Lévy's inequalities); for the full range `0 < p < 2` with the converse, a text that states the law as an equivalence, such as Kallenberg, *Foundations of Modern Probability*, or Chow–Teicher, *Probability Theory*, in their chapters on the strong law.

## N01 — The enumeration Checks of 2.1 and 2.2 cannot be recomputed as written

"Exact enumeration over 3000 random families … (45000 cases) finds no violation" (line 130) and its twin in 2.2 (line 162) describe a run on an unspecified random sample, so a reader can confirm neither the sample nor the count. Would a fixed, small family do instead, for instance all laws uniform on a two-point subset of `{−2, …, 2}` for `n ≤ 3`, or simply the worked instances that already follow each of them? (An independent exact enumeration, 27000 cases for 2.1 with `c` at, below and far below the minimum, and 9000 for 2.2, also found no violation.)

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Kronecker's lemma | `b n = n`, `x n = (−1)^n √n`, `n = 10³, 10⁶`; `b n = n − 3`; non-monotone `b`; `x = 1` | ratio `−0.016188`, `−0.00050038`; with `n − 3`: `−0.00050038`; non-monotone at `n = 1001`: `250000/1001 = 249.75`; `x = 1`: ratio `1` | Checks true; junk `x/0 = 0` at one index harmless | none |
| 2.1 Lévy–Ottaviani | `n = 0`; `a < 0`; `c < 0`; `c = 100, n = 0, a = −1`; dependent pair `Y, −Y`; 27000 enumerated cases | `n = 0`: `c·0 ≤ P`; `a < 0`: `c ≤ 0` so LHS `≤ 0`; dependent: `1/4` vs `0`; enumeration: 0 violations | true for all real `a, c`, all `n` | none |
| 2.2 Lévy, symmetric summands | `n = 0`; `a < 0`; signs `n = 2, a = 1/2`; asymmetric `{1, −3}`, `n = 3`; 9000 enumerated cases | `n = 0`: `0 ≤ 2P`; signs: `1/2 = 2·1/4`; asymmetric: `1/2 > 2·1/8`; enumeration: 0 violations of either inequality | true; constant 2 attained | C02 (locator) |
| 3.1 two-series | centred signs `±1/(i+1)`; Cauchy without `MemLp 2` | variances sum `π²/6`; Cauchy: Mathlib mean `0`, variance `(∞).toReal = 0`, `P(|X| > 1) = 1/2`, diverges | `MemLp 2` needed and present in Lean | none |
| 3.2 three-series | `c = 0`; `X = ±c`; `±1/(i+1)` at `c = 1/2, 1`; necessity bound `|φ| ≤ 1 − t²σ²/3` | `c = 0`: first series `∑ 1 = ∞`; `truncate`: mean `0`, var `c²`; Mathlib `truncation` on `(−c, c]`: `c/2`, `c²/4`; sums `(1, 0, π²/6 − 1)` and `(0, 0, π²/6)`; remainder `≤ t²σ²/6` for `|t| ≤ 1/K` | iff holds for every `c > 0`; `0 < c` in Lean | none |
| 3.3 in probability | non-measurable `g`; dependent typewriter sequence | outer-measure triangle inequality gives `μ{g ≠ h} = 0` for the a.s. limit `h`; typewriter: `P(Sₙ ≠ 0) = 2^(−k)`, values 0 and 1 infinitely often everywhere | true without measurability of `g`; independence needed | none |
| 3.3 in distribution | route step `|1 − φ(2t)| ≤ |1 − φ(t)| + √(2|1 − φ(t)|)`; limit on another space | follows from `|φ(t+s) − φ(t)|² ≤ 2(1 − Re φ(s))`; Lean `TendstoInDistribution … (fun _ ↦ μ) μ'` matches the pin's structure | route closes; statement matches README | none |
| 3.4 random signs | `a i = 1/(i+1)`, `1/√(i+1)`, `(−1)^i`; level `c = 1` | `∑ a² = π²/6`, `∞`, `∞`; `P(|a ε| > 1) = 1{|a| > 1}`, truncated variance `a²` once `|a| ≤ 1` | iff true; `HasLaw` supplies a.e. measurability | none |
| 4.1 Kolmogorov's strong law | `b i = 0` or `< 0` at finitely many `i`; `Var = (i+1)^(2β)`, `b n = n`; all `X i = Y` | junk `Var/0 = 0` at finitely many indices; series finite iff `2β − 2 < −1`; dependent: averages `= Y` | true as written; independence needed | none |
| 4.2 Marcinkiewicz–Zygmund | `X = 1` at `p = 1/2, 1, 3/2`; Cauchy at `p = 1/2`; normal at `p = 2`; `n = 0` | `1/n → 0`; `1`; `n^(1/3) → ∞`; `E|X|^(1/2) = 1/cos(π/4) = 1.41421`; `Sₙ/√n ~ N(0,1)`; `0/0^(1/p) = 0` | both directions true for `0 < p < 2`; centring only for `p ≥ 1` | C02 (locator) |
| Scope, neighbouring roadmaps | NoncommutativeIntegration §6.2 | Banach-valued Rademacher sums there, real symmetric summands here; neither contains the other | no second owner | C01 |

- Source locators checked against the text: 25 of 25 (Durrett 14: lines 4369, 4410, 4419, 4439, 4526, 4552, 4715, 4722, 4744, 4755, 7557, 13500, printed pages 84–91, 150–151, 278; Moshayedi 6: lines 6642, 6665, 6692, 6714, 6754, 6774; Itô–Nisio 5: lines 103, 114 and the proof on pp. 38–39).
- Library declarations opened at the pins: 20 in Mathlib (among them `Probability/BorelCantelli.lean:51` and `:70`, `Probability/StrongLaw.lean:82` and `:598`, `MeasureTheory/Function/ConvergenceInMeasure.lean:57`, `:219`, `:266`, `MeasureTheory/Function/ConvergenceInDistribution.lean:64` and `:175`, `MeasureTheory/Measure/IntegralCharFun.lean:96`, `Probability/Moments/Variance.lean:424`, `Probability/Martingale/Convergence.lean:195`, `Algebra/BigOperators/Module.lean:60`) and 3 in Tau Ceti (`TauCeti/Probability/Distributions/Rademacher/Basic.lean:31`, `:192`, `:197`), plus `TauCeti/Probability/StrongLaw.lean`; all exist and say what the README says.
- Duplication by object: no Kronecker lemma, Lévy–Ottaviani or Lévy inequality, two- or three-series theorem, or Marcinkiewicz–Zygmund strong law in the pinned Mathlib or Tau Ceti (the Tau Ceti `Marcinkiewicz` files are the interpolation theorem).
- Cross-roadmap citations resolved on main: 3 of 3 (StochasticCalculus §1.5, line 1041, the inequality as quoted; MathematicalStatisticsAsymptotic §1.2 and `tendstoInDistribution_sum_of_lindeberg`, `Suggested.lean` line 122; MarkovDecisionProcesses §6.1, line 595).
- Dependency check: `depcheck: 191 roadmaps, 2120 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else; no `set_option`, no sorry'd data, imports `Mathlib` and one existing Tau Ceti module. The thirteen elaborated types were compared with the README statements: all agree; `partialSum` does not carry `[MeasurableSpace Ω]`, which its body does not need.
- One-tactic probe (`rfl`, `simp`, `simp_all`, `simp_all` after unfolding `partialSum`, `positivity`, `infer_instance`): closes none of the ten theorems.
- Headline theorems (three-series, random signs, Lévy's equivalence in both forms, Marcinkiewicz–Zygmund, and the five supporting results) are all stated; the pull request's title and description agree with the head.

Overlap check: read LawOfTheIteratedLogarithm, MartingaleCentralLimitTheorem, LocalLimitTheorems, MathematicalStatisticsHigherOrderAndResampling, RandomWalkFluctuationTheory, MathematicalStatisticsAsymptotic, DysonBrownianMotion, StochasticCalculus; nothing shared (LawOfTheIteratedLogarithm's scope says that it does not treat the Lévy–Ottaviani inequality, Lévy's inequalities, Kronecker's lemma or Kolmogorov's strong law; RandomWalkFluctuationTheory §1.2 owns the exact reflection identity for the simple walk on `ℤ`, a different statement from 2.2).

Source independence: 14 passages compared with 3 sources, none shared; largest share Durrett, 14 of 25 locators; contents compared with Durrett §2.5: independent (the roadmap opens with Kronecker's lemma, takes its maximal inequalities from an exercise and from Chapter 5, and adds Lévy's equivalence theorem and the random-sign criterion, which that section does not have; the order Layer 1, 3 → Layer 4 and 2.1 → 3.3 is forced by the `*Needs:*` lines of 4.1, 4.2 and 3.3).

Research link: Lévy's equivalence theorem (3.3) is the real case of Itô–Nisio 1968, Theorem 3.1, the starting point for sums in Banach spaces (source read); NoncommutativeIntegration §6.2 on main uses Lévy's inequality towards Kahane's inequality; the three-series and Marcinkiewicz–Zygmund theorems are attributed in the README to Kolmogorov–Khinchin 1925–1928 and Marcinkiewicz–Zygmund 1937.

## Not verifiable

- The primary papers named in the References without a locator (Lévy 1937, Ottaviani 1939, Marcinkiewicz–Zygmund 1937, Kolmogorov–Khinchin, Rademacher 1922) were not opened: the README cites no page of them.
- The exact sample behind the enumeration Checks of 2.1 and 2.2 (3000 and 1500 random families) cannot be reproduced; an independent enumeration agrees.

## Source issues

- **Error** in Moshayedi at Proposition 8.17, p. 124: the source says centred variables with `∑ Var(wₙ)/n² < ∞` have averages tending to 0 almost surely, with no independence assumed; it should be assumed that the variables are independent (one fair sign repeated is a counterexample); affects a stated result.
- **Gap** in Moshayedi at Lemma 8.13, proof, p. 123: the source says the characteristic-function bound, proved for a variable bounded by `k` and `|t| ≤ 1/k`, applies to the centred variables, which are bounded by `2k`; it should be applied for `|t| ≤ 1/(2k)`; affects the proof.
- **Misprint** in Moshayedi at Lemma 8.13, proof, p. 123: the source says the case to exclude is that the series of the variables is infinite; it should be that the series of their variances is infinite; affects nothing.
- **Misprint** in Moshayedi at Theorem 8.14, proof, p. 123: the source says the necessity of conditions (ii) and (iii) follows from a "lemma 14.8"; it should be Lemma 8.13; affects nothing.

## For the human reviewers

- **Scope.** The subject is classical graduate-textbook probability (1920s–1960s); 14 of 25 locators are to Durrett's textbook, 6 to lecture notes on arXiv (Moshayedi, arXiv:2010.16280v1), 5 to one refereed article (Itô–Nisio 1968). Whether this is within the project's scope is yours to decide.
- **Licence.** Durrett's text was read from the author's page; its title page (Durrett line 9) says all rights are reserved. It is cited by locator only and no passage is reproduced in the roadmap.
