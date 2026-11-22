# Review of EvidenceLowerBound (pull request #2988 at 2f93844)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: the third Check of 2.3 says that `p ≪ q` is needed for the equivalence "`L_k = log p(Z)` iff `q` is the posterior", but in the instance it gives both sides are false, and the equivalence in fact holds under the hypotheses of 2.1 alone; what the instance refutes is the strict increase. Every other statement, Check and locator I tested came out as written. There are three small corrections (the two Jensen lemmas named in 2.1 and 2.3 need a closed set and do not apply to `log` on the open half-line; the "identity of 1.3" is two steps beyond the Mathlib lemma it is attributed to; positivity alone does not repair the source's convergence claim) and one format note. Nothing blocks beyond the one finding; three facts are left for the human reviewers.

## R01 (P2) — The Check of 2.3 that `p ≪ q` "is needed for the equivalence" exhibits an instance where the equivalence holds, and the equivalence holds without `p ≪ q`

A reader takes from this Check that the first item of 2.3 fails without `p ≪ q`, and an implementer carries that hypothesis into the equality case believing it is used. In the Check (third Check of 2.3, line 268) `q = δ₀`, `p = δ₀ + δ₁`: `w(0) = 1`, `L_k = 0` for every `k ≥ 1`, `log p(Z) = log 2`, and the posterior is `(1/2, 1/2) ≠ q`. So "`L_k = log p(Z)`" is false and "`q` is the posterior" is false: the "if and only if" of the first item is true here. The item holds in general under `q ≪ p` and `log w ∈ L¹(q)` only: if `L_k = log p(Z)`, the chain `L_k ≤ log ∫ w dq ≤ log p(Z)` of 2.1 forces `∫ w dq = p(Z)`, and `∫ w dq = p(Z) − (p.singularPart q)(Z)` (the identity 2.1 already uses) then gives `p ≪ q`; the converse direction has `p ≪ q` built in. What the instance does refute is the second item (`q` is not the posterior, yet `L_k = 0` is constant, not strictly increasing) and step 1 of the route (the weight is constant, yet `q` is not the posterior).

The smallest change: relabel the Check, for example "`p ≪ q` is needed for the strict increase, and for step 1 of the route: with `q = δ₀` and `p = δ₀ + δ₁` the weight is constant and `q` is not the posterior, but `L_k = 0` for every `k`; the equivalence of the first item still holds, both of its sides being false." The first item would also be true, and stronger, stated under the hypotheses of 2.1 alone; that is offered, not required.

## C01 — The two Jensen lemmas named in the routes of 2.1 and 2.3 require a closed convex set, and `log` is concave only on the open half-line

An implementer who follows step 2 of 2.1 or step 2 of 2.3 as written cannot apply the named lemmas. At the pin, `ConcaveOn.le_map_integral` (`Mathlib/Analysis/Convex/Integral.lean`, line 205) and `StrictConcaveOn.ae_eq_const_or_lt_map_average` (same file, line 294) both take `hsc : IsClosed s`; `strictConcaveOn_log_Ioi` is on `Set.Ioi 0`, which is not closed, and Lean's `Real.log` is not concave on `Set.Ici 0`: at the points `0` and `1/2` the midpoint value is `log(1/4) ≈ −1.386`, below the chord value `(1/2) log(1/2) ≈ −0.347`. The supplier contract (line 685) describes the first lemma as "Jensen for a probability measure" without that hypothesis.

Both steps go through with the tangent line instead, which 2.1 already lists: with `c = E M_k > 0`, `Real.log_le_sub_one_of_pos` at `M_k / c` gives `log M_k ≤ log c + M_k / c − 1`, and integrating gives `L_k ≤ log c`; for the equality case of 2.3, `Real.log_lt_sub_one_of_pos` makes the nonnegative difference vanish only where `M_k = c`. Naming that route, or adding "for a closed convex set" to the contract and saying how the open half-line is handled, would make the text match the library.

## C02 — "The identity of 1.3" is called the library's, but its `elbo` form is two almost-everywhere identities beyond the Mathlib lemma

The routes of 3.3 and 5.1 call `elbo p r = log p(Z) − KL(r ‖ posterior)` "the library's" and "not a target" (1.3, lines 137–141; 5.1, line 568), so an implementer looks for a declaration and finds none in that form. `MeasureTheory.integral_llr_tilted_right` (`Mathlib/MeasureTheory/Measure/LogLikelihoodRatio.lean`, line 238) is a statement about `∫ llr r (q.tilted f) dr`. To reach `elbo`, which integrates `log (p.rnDeriv r)`, one still needs that the posterior equals `q.tilted (log w)` (this uses `w > 0` `q`-a.e.) and that `log (dp/dr) = log w − llr r q` `r`-almost everywhere (from `p = q.withDensity w`, `r ≪ q` and `dq/dr = (dr/dq)⁻¹` `r`-a.e.). Both are true and short; I checked them. A sentence in 1.3 saying that the identity follows from the Mathlib lemma by these two steps, which the routes of 3.3 and 5.1 include, would remove the gap between "the library's" and what the library states.

## C03 — In 2.2, "positivity of the weight must be added" can be read as sufficient, and it is not

The paragraph on the source's part 3 (2.2, lines 212–215) says that for bounded weights positivity must be added. Positivity and boundedness together still do not give convergence: take `w = exp(−T)` with `P_q(T > t) = 1/log t` for `t ≥ e`. Then `0 < w ≤ 1`, and `log M_k ≤ −min_{i<k} T_i` with `E min_{i<k} T_i = e + ∫_e^∞ (log t)^(−k) dt = ∞` for every `k`, so `L_k = −∞` for every `k` while `p(Z) ∈ (0, 1]`. Writing "positivity must be added, and it is still not enough without some integrability of `log w`" would be exact, and it strengthens the case for the hypotheses 2.2 chooses.

## N01 — Two layer titles in `Suggested.lean` differ from the README

The section comments for Layers 1 and 3 read "the evidence, the posterior and the two bounds" and "the augmented view of the importance-weighted bound"; the README has "importance weights, the posterior and the two bounds" and "the augmented proposal". One wording for each would let a reader match the two files by title.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 copied weight and estimates | `n = 0`, `n = 1`, `f = 1` | `n = 0`: `0⁻¹·0 = 0`; `n = 1`: `w(ω 0)`; all three definitions identical to the supplier's text | holds | none |
| 1.2 Bayes with a density | uniform prior on `{0,1}`, `ℓ z 1 = 1/4, 3/4`; `μ = 0`; `m(x) = 0` or `∞` | joint `(1/8, 3/8)`, evidence `1/2`, posterior `(1/4, 3/4)`; `η x = 0` when `m ∈ {0, ∞}`; rectangle masses agree | holds | none |
| 1.3 `elbo`, `iwElbo`, identity | running example; `k = 0`; `q = p` | `L_1 = (1/2)log(3/4)`, `L_2 = (1/4)log(3/4)`; `k = 0` gives `0 > log(1/2)`; `log(dp/dr) = log w − llr r q` | holds | C02 |
| 2.1 monotone, `≤ log p(Z)` | running example `k ≤ 4`; `w = (0,2)`; `w = exp(−4ⁿ)`; `q = δ₀, p = δ₀+δ₁` | `−0.1438 < −0.0719 < −0.0465 < −0.0341 < 0`; junk `L_1 = (1/2)log 2 > 0`, `L_2 = (1/4)log 2`; `Σ 2^(n−1) = ∞` | holds | C01 |
| 2.2 convergence | `q = δ₀, p = δ₀+δ₁`; `w = (3/2)ⁿ/2` on `ℕ`; Fatou step | `L_k = 0 ≠ log 2`; `Σ 2^(−(n+1)) (3/2)ⁿ/2 = 1`; `E D_k = L_k − ∫ log w dq`, liminf `≥ log p(Z) − ∫ log w dq` | holds | C03 |
| 2.3 equality, strict increase | `p = 3q`; `q = δ₀, p = δ₀+δ₁`; `k = 1`; `m < k` exchange | `L_k = log 3`; both sides of the iff false, `L_k ≡ 0` not strict; `∫ w dq = p(Z)` forces `p ≪ q` | theorem holds; Check mislabelled | R01 |
| 3.1 `iwJoint` is the selection law | running example `n = 1`; `n = 0`; all weights `0` | masses `1/4, 1/8, 3/8, 1/4` both ways; `n = 0` density `1` on `w > 0`; both sides `0` | holds | none |
| 3.2 gap is a relative entropy | running example `n = 1`; `n = 0` | reference `(1/8,1/8,3/8,3/8)`; KL `= (1/4)log 2 + (1/4)log(2/3) = 0.07192 = −L_2`; mass `1` | holds | none |
| 3.3 two gaps | running example `n = 1`; `n = 0` | `ρ_1 = (3/8, 5/8)`; `0.03810 + 0.03382 = 0.07192`; `elbo p ρ_1 = −0.0381`, between `−0.0719` and `0` | holds | none |
| 3.4 SNIS mean and bias | `t = 1_{1}`, `n = 1`; `n = 0`; convention of `tvDist` | mean `(0 + 3/4 + 3/4 + 1)/4 = 5/8`; bias `1/8 ≤ √((1/2)log(4/3)) = 0.379`; `tvDist = ∫│1 − dμ/dν│dν` | holds | none |
| 3.5 convergence of the selected law | running example; `q` the posterior | `0.0381 ≤ 0.0719`; constant weight gives density `1`, `ρ_n = q`, divergence `0` | holds | none |
| 4.1 greedy step | `W = log 3`, `q = δ₁`; `p' = δ₀`; grid `a/12` | laws `(1/3, 2/3)`; aggregate `(1/4, 3/4)`; `11/16 > 2/3`; `p' = δ₀` gives `1/2 < 2/3`; hypothesis iff `x³(1−x) ≥ 8/81`, only `a = 8, 9` | holds | none |
| 4.2 adding a layer | `W = log 3, b = log 2, c = 0`; index types of `transposeParams` | joint weights `1, 1, 2, 6`; hidden law `(3/10, 7/10)`; biases kept in place give `(1/5, 4/5)`; `θ'` law `(1/4, 3/4)` | holds | none |
| 5.1 global maxima | `f = (1,3), (1,1)`; `ρ = δ₀, q = δ₁`; `f = (0,1)`; atoms of `ρ`-mass `0` | `F = log 4`, `(1/2)log 12`, `log 2`; junk `0 > log(1/2)`; `(1/2)log 2 > 0`; `F − Q = log 4 − (3/4)log 3` twice | holds | C02 |

- Source locators checked against the text: 21, in five sources (Burda–Grosse–Salakhutdinov eqs. (8)–(10), Theorem 1, Appendix A; Domke–Sheldon Theorems 1–2, Algorithm 1, eqs. (6)–(8), Lemma 4, p. 4 remark; Kingma–Welling eqs. (1)–(3); Hinton–Osindero–Teh §3, §4 steps, eqs. (7)–(9), footnote 4; Neal–Hinton §2, eqs. (2)–(3), Lemmas 1–2, Theorems 1–2); all at the stated pages.
- Library declarations opened at the pins: 31 (30 Mathlib, 1 Tau Ceti), each in the file the supplier contracts name; statements read for `posterior`, `ae_eq_posterior_of_compProd_eq`, `posterior_eq_withDensity`, `integral_llr_tilted_right`, `toReal_klDiv_of_measure_eq`, `klDiv_compProd_eq_add`, `tvDist_eq_integral_abs_rnDeriv_of_ac`, `rnDeriv_pos'`, `strong_law_ae`, `iIndepFun_infinitePi`, the two Jensen lemmas, `etvDist_sq_le_two_mul_klDiv`.
- Cross-roadmap citations resolved: 9 (ImportanceSamplingAndVarianceReduction 1.1, 2.1 and its scope sentence; RestrictedBoltzmannMachines 1.1, 1.2 and its scope sentence; QuantumOptimization 1.1; SimulatedAnnealing 3.1; MathematicalStatisticsSemiparametric 7.1, 7.2; DenoisingDiffusion 1.1 and Layer 4). The 17 copied definitions agree with their owners' text after whitespace normalisation.
- Automatic checks: all passed. Dependency check: 133 roadmaps, 1473 edges, 0 problems; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 12 `sorry` warnings and nothing else. Elaborated types compared with the README statements: the only binders dropped are `DecidableEq` and `MeasurableSingletonClass` instances on copied definitions whose types do not mention them; no hypothesis of a theorem is lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a copy: none of the 12 theorems closes.
- Headline theorems (README summary): the importance-weighted bounds (2.1–2.3), the augmented view (3.1–3.5), the greedy step (4.1–4.2), the free-energy maxima (5.1), with Bayes' formula 1.2; all stated in `Suggested.lean`, none through a stand-in.

Overlap check: read RestrictedBoltzmannMachines, ImportanceSamplingAndVarianceReduction, PACBayesBounds, HiddenMarkovModels, HypothesisTestingExponents, MathematicalStatisticsSemiparametric, MathematicalStatisticsNonparametric, DenoisingDiffusion; shared objects are cited, not owned twice: weight and estimates (ImportanceSamplingAndVarianceReduction), machines (RestrictedBoltzmannMachines), EM objects and EM monotonicity (MathematicalStatisticsSemiparametric), Gaussian relative entropy and the diffusion bound (DenoisingDiffusion); nothing else shared.

Source independence: 14 passages compared with 5 sources, none shared; largest share DomkeSheldon2018, 5 of 16 locators in the layers; contents compared with DomkeSheldon2018 (its sections 1–7 and appendix A.1–A.3): independent, Layer 3 draws on its section 3.1 and appendix A.2 only and the other layers on other sources.

Research link: Layer 2 is Theorem 1 of Burda–Grosse–Salakhutdinov (2016); Layer 3 is the augmented-proposal analysis of Domke–Sheldon (2018); Layer 4 is the greedy guarantee of Hinton–Osindero–Teh (2006); Layer 5 is Theorem 2 of Neal–Hinton (1998). Rests on the README's references and the four texts read.

## Not verifiable

- none

## Source issues

- **Error** in BurdaGrosseSalakhutdinov2016 at Theorem 1, p. 4 (restated as part 3 of Appendix A, p. 10): the source says that a bounded weight makes the bounds converge to the log-evidence; it should be assumed also that the weight is positive almost surely with enough integrability of its logarithm, since otherwise every bound can be `−∞`; affects a stated result.
- **Gap** in BurdaGrosseSalakhutdinov2016 at Appendix A, part 3, p. 10: the source says that almost sure convergence of the averaged weights gives convergence of the expected logarithms; it should be supported by a domination or Fatou argument for the logarithm, which is unbounded below; affects the proof.

## For the human reviewers

- **Scope.** The subject is the theory of variational inference in machine learning; the five sources are two conference papers (ICLR 2016, NeurIPS 2018), an ICLR 2014 paper, a Neural Computation article and a book chapter (README References).
- **Scope.** Several targets have no source stating them and are marked "proved here": 1.2, 2.2 under its hypotheses, 2.3, the bias bound of 3.4, 3.5, the exact form of 4.1–4.2, the converse in 5.1 (README lines 100, 222, 249, 407, 426, 475, 585).
- **Licence.** The README cites Neal–Hinton from a preprint on Neal's page (README line 776); I read the same 14-page preprint from Hinton's page, where the page numbers agree. Hinton–Osindero–Teh is likewise read from Hinton's page.
