# Review of PolicyGradientMethods (pull request #2565 at 7a5357d)

**Verdict:** needs changes

**Summary.** Needs changes, for two sentences of the README that are false as written; each is repaired by adding a few words, and no theorem and no line of `Suggested.lean` has to change. In 2.1 the remark on the least constant `C` fails for a weight vector `μ` with a negative entry, which that section allows and its own Check uses; in 3.1 the softmax table is called a policy for every `θ`, which fails when the action type is empty. All eight headline statements survived the degenerate-case and sign checks, every source locator was confirmed in the open texts, and the suppliers resolve on main. There is one format note (a suggested Check) and nothing blocking is left to a human.

## R01 (P2) — In 2.1, "when `μ` has full support, the least such `C` is `max_s d^{π'}_ρ(s) / μ(s)`" is false for a `μ` with a negative entry, which the section allows.

A reader takes the sentence (README 2.1, line 182) as the description of the admissible constants at the generality of the theorem, where `μ : S → ℝ` is arbitrary (the Conventions say a statement assumes `0 ≤ μ` only when it says so, and the theorem is stated and proved for `C < 0` too). The third Check of the same section is a counterexample: one state, `ρ = 1`, `γ = 0`, `μ = −1`, so `d^{π'}_ρ = 1` and the hypothesis reads `1 ≤ −C`. The quotient `d/μ` is `−1`, but `C = −2` is also admissible (`1 ≤ 2`), and so is every `C ≤ −1`: there is no least `C`, and `−1` is the largest. With entries of both signs the admissible set is an interval or empty, and the maximum of the quotients is again not its least element (two states, `d = (1, 1)`, `μ = (1, −1)`: the conditions are `C ≥ 1` and `C ≤ −1`, no `C` at all, while the formula gives `1`).

The smallest repair: replace "when `μ` has full support" by "when `μ s > 0` for every `s`". Then `d ≤ C μ` is `C ≥ d(s)/μ(s)` for all `s` and the sentence is true. The corresponding sentence of 3.2 is already correct, because `μ ≥ 0` is assumed there and makes `d^{π_θ}_μ ≥ 0`.

## R02 (P2) — In 3.1, `softmax θ` is "a policy for every `θ`" only when the action type is nonempty, and the Conventions do not assume that.

The Conventions (line 50) ask only that `S` and `A` be finite with decidable equality, and `Suggested.lean` has `[Fintype A]` without `[Nonempty A]`. For `A` empty and `S` nonempty, `softmax θ` is the empty table, whose row sums are `0`, so `IsPolicy (softmax θ)` is false; the sentence at line 230 and the routes of 3.2 and 4.1–4.3, which use it, then start from a false premise. (MarkovDecisionProcesses, whose conventions this roadmap cites, assumes `[Nonempty A]`.)

No Lean statement is affected, which I checked one by one for `A` empty: in `fderiv_objective_softmax` both sides are `0` (`P^π = 0`, `r^π = 0`, the objective is constant `0`, the double sum is empty); `fisher_mulVec_advantage` and `softmax_npgStep` are equalities of functions on an empty type; `lojasiewicz_softmax` has no `d : S → A`; and the three statements with an `IsPolicy` hypothesis are vacuous. So the smallest repair is in the prose: add "nonempty" to `A` in the Conventions, or write "a policy for every `θ` when `A` is nonempty" in 3.1.

## N01 — A suggested Check for 4.1: the step is `θ + η A/(1 − γ)` only up to a constant per state.

The first Check of 4.1 computes `F† ∇V = (1/2, −1/2) = A^π` at `θ = 0`, where the two happen to agree. At `θ = (t, 0)` on the same bandit, `F = σ(1 − σ) [[1, −1], [−1, 1]]`, `F† = [[1, −1], [−1, 1]] / (4σ(1 − σ))`, `∇V = σ(1 − σ)(1, −1)`, so `F† ∇V = (1/2, −1/2)` for every `t`, while `A^π = (1 − σ(t), −σ(t))`. The difference `σ(t) − 1/2` is constant in the action, as the proof of `softmax_npgStep` says; a definition of the step as `θ + η A^π/(1 − γ)` would differ from `npgStep` in `θ` and agree in the policy. Adding this value would separate the two.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 value, Q, advantage, visitation | 1 state 2 actions rewards (1,0), uniform; alternating chain; `π = 1/γ` | `V = 1/(2(1−γ))`, `A = (1/2, −1/2)`; `d = (1/(1+γ), γ/(1+γ))`, mass 1; `1 − γP = 0`, inverse 0 | agrees with all five Checks | none |
| 1.2 `fderiv_objective` | derivative of `(1 − γP^θ)⁻¹ r^θ` in direction `h`; `γ = 0` | `(1−γP)⁻¹(r^h + γP^h V)`, entry `Σ_a h Q`; `γ = 0`: gradient `μ s · reward s a`; bandit `(1, 0) = Q ≠ A` | true | none |
| 2.1 `gradientDomination` | `C > 0`, `C = 0`, `C < 0`; bandit with `C = μ = −1`; `ρ = −1` | `C<0`: `μ ≤ 0`, `Cμ ≤ C d^π_μ/(1−γ)`; bandit: gap 1/2, bound `(−1)(−1/2) = 1/2`; `ρ = −1`: left 1, right 0 | true for every real `C`; `ρ ≥ 0` needed | none |
| 2.1 remark on least `C` | `μ = −1`, `d = 1`; `d = (1,1)`, `μ = (1,−1)` | admissible `C ≤ −1`, formula gives `−1` (the largest); second case: no `C`, formula gives 1 | false | R01 |
| 3.1 `fderiv_objective_softmax` | bandit `θ = (t, 0)`, `γ = 0`; `A` empty | `V = σ(t)`, gradient `(σ(1−σ), −σ(1−σ))`, row sum 0; `A` empty: both sides 0 | true | none |
| 3.1 "softmax is a policy" | `A` empty, `S` nonempty | row sum `0 ≠ 1` | false in this case | R02 |
| 3.2 `lojasiewicz_softmax` | `C > 0`, `C = 0`, `C < 0`; bandit `t = −5`; `μ = −1, C = −1`; `ρ = −1, C = 0` | bandit: `σ(1−σ) ≤ √2 σ(1−σ)`; `t=−5`: gap 0.9933, right 0.0094; `μ<0`: `0 > −0.3536`; `ρ<0`: `1/4 > 0` | true; both sign hypotheses needed | none |
| 4.1 `fisher_mulVec_advantage` | block at `(s, b)` | `d(s) π(b)(w(s,b) − Σ_a π(a) w(s,a))`, `w = A/(1−γ)` has `π`-mean 0, gives `d π A/(1−γ)` | true for every `μ` | none |
| 4.1 `softmax_npgStep` | bandit `θ = 0` and `θ = (t,0)`; state with `d = 0`; `μ = (1, −1)` | `F† = [[1,−1],[−1,1]]`, new policy `0.7311` at `η = 1`; general `t`: `F†∇V = (1/2,−1/2)`; unvisited: `(0.1192, 0.8808)` vs unchanged; indefinite `F`: pseudoinverse 0 | true; `d > 0` and `μ ≥ 0` needed | N01 |
| 4.2 `mwStep_improvement` | bandit `η = 1`, `η = −1`; `π` without full support | `log Z = log cosh(1/2) = 0.1201`, gain `0.2311`; `η=−1`: `−0.1201 > −0.2311`; zero entries stay zero, KL term unaffected | true; `η > 0` needed | none |
| 4.3 `npg_rate` | `T = 0`; 3-state MDP `γ = 0.95`, `η = 2`; rewards ×100, `η = 0.02`; `ρ = 100 e₀`; `ρ = (3, −2)` | `T=0`: right side 0, left 1/2; optimum 18.05, gap 6.7682 ≤ 400.35; scaled 676.82 > 434.66; 676.82 > 400.35; `5/2 > 1.693` | true; each hypothesis needed | none |
| 4.3 Hedge remark | sign of exponent | Hedge of RegretMinimizationAndEquilibria 1.2 plays `∝ exp(+η Σ_{k<t} u k)`; iterates `∝ exp(η Σ_{k<t} A_k/(1−γ))` from uniform | same sign and start | none |
| Lean vs README, all 24 | elaborated types | `1 − ↑γ` is real subtraction in all 8 theorems; `transMatrix`, `meanReward` omit unused `DecidableEq` only | generality equal | none |

- Source locators checked against the text: 17 of 17 (AKLM2021 lines 514, 527, 568, 590, 773, 941, 949, 959, 978, 2676, 3159; MXSS2020 lines 277, 558, 1977–1979; Kakade2001 line 100; SMSM1999 line 120); the arXiv v5 numbering given in the References also confirmed.
- Library declarations opened at the pins: 13 (`hasFDerivAt_ringInverse` Mul.lean:645, `Matrix.linftyOpNormedRing` Normed.lean:419, `Matrix.linftyOpNormedAlgebra` :427, `NormedRing.inverse_one_sub` Units.lean:97, `HasFDerivAt.comp` Comp.lean:103, `ConcaveOn.le_map_sum` Jensen.lean:72, `strictConcaveOn_log_Ioi` SpecificFunctions/Basic.lean:66, `Real.log_nonpos` Log/Basic.lean:222, `Finset.sum_mul_sq_le_sq_mul_sq` Ring/Finset.lean:171, `Matrix.covariancePseudoInverse` CovariancePseudoInverse.lean:44, `…_of_not_posSemidef` :55, `Matrix.isMoorePenroseInverse_covariancePseudoInverse` :117, `logisticNormalChart` LogisticNormal/Basic.lean:45).
- Cross-roadmap citations resolved on main: MarkovDecisionProcesses Conventions (the `MDP` structure, body identical field by field), 1.2 (`policyMatrix`, `value_eq_inverse`), 3.1, 3.3 (`occupancy_real_singleton`, `performanceDifference`); MathematicalStatisticsFoundations 4.3; RegretMinimizationAndEquilibria 1.2 (`hedge`). The same ids exist at the head of the open revision of these three roadmaps.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. All three roadmap suppliers are on main.
- Elaboration: `Suggested.lean` elaborates with eight `declaration uses sorry` warnings and nothing else; no `set_option`, no sorried data, imports as required. The worker's automatic checks all passed.
- One-tactic probe: none of the eight theorems closes with `rfl`, `simp`, `simp_all` or `infer_instance`; no padding.
- Headline theorems (README summary): direct and softmax policy gradient, gradient domination, Łojasiewicz, compatibility, natural gradient as multiplicative weights, improvement lemma, rate. All eight are stated in `Suggested.lean`; none is declared not statable.
- The text of the pull request: the title and description agree with the head (a new roadmap, 16 definitions, 8 theorems, three roadmap suppliers on main, the stated imports).

Overlap check: read MarkovDecisionProcesses (main and its open revision), RegretMinimizationAndEquilibria, MultiArmedBandits, OnlineConvexOptimization, StatisticalLearningTheory; nothing shared. MarkovDecisionProcesses lists policy-gradient methods as out of its scope and owns the MDP, value, occupancy measure and performance difference, which are cited here; Hedge is owned by RegretMinimizationAndEquilibria 1.2 and cited; StatisticalLearningTheory names policy gradient and natural policy gradient as beyond itself. No pinned library file states a softmax policy, a policy gradient or a Fisher matrix of a policy.

Source independence: 11 passages compared with 4 sources, none shared; largest share AKLM2021, 12 of 17 locators; contents compared with AKLM2021: independent (Layers 1, 2, 4 draw on its Sections 3, 4.1 and 5.3 in that order, which the Needs lines force, 3.1 needing 1.2 and 4.1 needing 3.1; its Sections 4.2, 5.1, 5.2 and 6 have no counterpart, and 3.2 is from MXSS2020).

Research link: The headline targets are the exact-gradient results of Agarwal, Kakade, Lee and Mahajan (2021) and the Łojasiewicz inequality of Mei, Xiao, Szepesvári and Schuurmans (2020), which those papers use for the rates of projected and softmax gradient ascent that the README's scope names as not treated; rests on the README and on both texts.

## Not verifiable

- The README's statement that the repository rl-theory-in-lean contains no policy-gradient material: the repository was not opened.
- The description's numerical tests on random MDPs were not rerun (no numerical library on the worker); the printed values of every Check were recomputed by hand or in plain Python instead.

## Source issues

- **Error** in AKLM2021 at Lemma 15, printed page 21: the source says the pseudoinverse update adds exactly the advantage times `η/(1 − γ)` to the parameter; it should be that this holds up to a constant per state, at reachable states, as its own proof in Appendix C.3 concedes; affects nothing.
- **Gap** in MXSS2020 at Lemma 8 as restated in the appendix, printed pages 27–28, step (271): the source says the comparison policy is an arbitrary optimal policy with `a*(s)` a most likely action; it should be a deterministic optimal policy, as in the main-text statement, since the step replaces `a*(s)` by an average over the policy; affects nothing.

## For the human reviewers

- Scope: the subject is optimization theory for reinforcement learning (tagged math.OC); the four sources are refereed (J. Mach. Learn. Res. 2021, ICML 2020, NeurIPS 1999 and 2001). Whether this is within the project's scope is yours to decide.
- Licence: `Suggested.lean` was not compared with the public repositories the description names (rl-theory-in-lean, lean4-mlir); the description says neither was used.
