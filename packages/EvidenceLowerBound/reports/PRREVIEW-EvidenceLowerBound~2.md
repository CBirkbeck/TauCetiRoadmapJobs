# Review of EvidenceLowerBound (pull request #2988 at aa1187c)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding and the three small corrections of the previous review are all repaired at this head (2.3 now states the equivalence under the hypotheses of 2.1 alone and its Check is relabelled; the Jensen steps of 2.1 and 2.3 use the tangent line; the identity of 1.3 is spelled out; 2.2 says positivity is not sufficient), and the whole roadmap was recomputed: every statement, Check and locator I tested came out as written. There are no small corrections and no format notes. Three facts are left for the human reviewers (the subject area, the targets proved here without a source statement, and two preprints read from an author's page).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 copied weight and estimates | `n = 0`, `n = 1`, `f = 1`; text against the owner | `n = 0`: `0⁻¹·0 = 0`; `n = 1`: `w(ω 0)`; three definitions identical to the owner's after whitespace | holds | none |
| 1.2 Bayes with a density | uniform prior on `{0,1}`, `ℓ z 1 = 1/4, 3/4`; `μ = 0`; `m(x) ∈ {0, ∞}` | joint `(1/8, 3/8)`, evidence `1/2`, posterior `(1/4, 3/4)`; `κ ∘ₘ μ = 0` makes it vacuous; `η x = 0` on the null set | holds | none |
| 1.3 `elbo`, `iwElbo`, the identity | running example; `k = 0`; `q = p`; steps (i), (ii) | `L_1 = −0.14384 = (1/2)log(3/4)`, `L_2 = −0.07192`; `k = 0`: `0 > log(1/2)`; `q.tilted(log w) = p/p(Z)`; `KL = log p(Z) − elbo` | holds | none |
| 2.1 monotone, `≤ log p(Z)` | running example `k ≤ 5`; `w = (0,2)`; `w = exp(−4ⁿ)`; `q = δ₀, p = δ₀+δ₁` | `−0.1438 < −0.0719 < −0.0465 < −0.0341 < −0.0269 < 0`; junk `L_1 = (1/2)log 2 > 0`, `L_2 = (1/4)log 2`; `Σ 2^(n−1) = ∞`; `L_k = 0 < log 2` | holds | none |
| 2.2 convergence | `w = (0,2)`; `w = exp(−T)`, `P(T>t) = 1/log t`; `w = (3/2)ⁿ/2`; Fatou step | `P(M_k = 0) = 2^(−k)`; `E min T = e + ∫_e^∞ (log t)^(−k) dt = ∞`; `Σ 2^(−(n+1))(3/2)ⁿ/2 = 1`; `E D_k = L_k − ∫ log w dq` | holds | none |
| 2.3 equality, strict increase | `p = 3q`; `q = (1/4,3/4), p = (1/8,3/8)`; `q = δ₀, p = δ₀+δ₁`; `w = (0,4)`; `{0,1,2}` example | `L_k = log 3`; `log(1/2)` both sides; both sides of the iff false, `L_k ≡ 0`; junk `L_1 = L_2 = log 2 = log p(Z)`, `q ≠ δ₁`; `c = p(Z)` forces singular part `0` | holds | none |
| 3.1 `iwJoint` is the selection law | running example `n = 1`; `n = 0`; all weights `0` | masses `1/4, 1/8, 3/8, 1/4` both ways; `n = 0` density `1` on `w > 0`; `w/0 = 0` and `ofReal(0/0) = 0` | holds | none |
| 3.2 gap is a relative entropy | running example `n = 1`; `n = 0`; mass | reference `(1/8,1/8,3/8,3/8)`; KL `= 0.0719205 = −L_2 = (1/4)log(4/3)`; mass `= P(some weight > 0) = 1` | holds | none |
| 3.3 two gaps | running example `n = 1`; `n = 0`; general `Z` | `ρ_1 = (3/8, 5/8)`; `0.0380984 + 0.0338221 = 0.0719205`; `elbo p ρ_1 = −0.03810 ∈ [−0.07192, 0]`; density of `ρ_n` w.r.t. `q` at most `n + 1` | holds | none |
| 3.4 SNIS mean and bias | `t = 1_{1}`, `n = 1`; `n = 0`; convention of `tvDist` | mean `(0 + 3/4 + 3/4 + 1)/4 = 5/8`; bias `1/8 ≤ 0.3793 = √((1/2)log(4/3))`; pin: `tvDist μ ν = ∫ │1 − dμ/dν│ dν`, range `[0, 2]` | holds | none |
| 3.5 convergence of the selected law | running example; `q` the posterior | `0.03810 ≤ 0.07192`; constant weight gives density `1`, `ρ_n = q`, divergence `0` | holds | none |
| 4.1 greedy step | `W = log 3`, `q = δ₁`; `p' = δ₀`; grid `a/12` | laws `(1/3, 2/3)`; aggregate `(1/4, 3/4)`; `2187/2048 > 1`; `11/16 > 2/3`; `p' = δ₀`: `1/2 < 2/3`; hypothesis iff `x³(1−x) ≥ 8/81`: `a = 8, 9` only | holds | none |
| 4.2 adding a layer | `W = log 3, b = log 2, c = 0`; index types of `transposeParams`; `θ'` bias `log 3` | joint weights `1, 1, 2, 6`; hidden law `(3/10, 7/10)` = transposed visible law; biases in place give `(1/5, 4/5)`; `θ'` law `(1/4, 3/4)` | holds | none |
| 5.1 global maxima | `f = (1,3), (1,1)`; `ρ = δ₀, q = δ₁`; `f = (0,1)`; `ρ = 0`; M-step identity | `F = log 4`, `(1/2)log 12`, `log 2`; junk `0 > log(1/2)`; `(1/2)log 2 > 0`; no `q ≪ 0`; `F − Q = log 4 − (3/4)log 3` twice | holds | none |

- Previous review, finding by finding: R01 repaired (2.3, "The equivalence does not assume `p ≪ q`", and the Check now reads "needed for the strict increase, and for step 1, but not for the equivalence"; the Lean signature drops `p ≪ q` from the equivalence); C01 repaired (2.1 step 2 and 2.3 step 2 use `Real.log_le_sub_one_of_pos` and `Real.log_lt_sub_one_of_pos`; the contract says the integral Jensen lemmas need a closed set and are not used); C02 repaired (1.3 gives steps (i) and (ii)); C03 repaired (2.2: "positivity and boundedness together are still not sufficient", with the example); N01 repaired (layer titles agree).
- Source locators checked against the text: 21 in five sources, all at the stated pages (BurdaGrosseSalakhutdinov2016 lines 172, 201–203, 552–637; DomkeSheldon2018 lines 161–171, 174–179, 191, 199, 217–220, 931–941, 1020, 1063; KingmaWelling2014 lines 65, 110–121; HintonOsinderoTeh2006 lines 262, 403, 446–466, 474–482, 499–507, 535; NealHinton1998 lines 93, 135–139, 147, 154, 175, 188, 203–214).
- Library declarations opened at the pins: 42 Mathlib names, each found in the file the supplier contracts give, and 1 Tau Ceti (`TauCeti/InformationTheory/KullbackLeibler/Pinsker.lean`, line 149); statements read for `ae_eq_posterior_of_compProd_eq` (line 113), `posterior_eq_withDensity` (line 287, in the `CountableOrCountablyGenerated` section), `integral_llr_tilted_right` (line 238), `klDiv` (line 56), `klDiv_compProd_eq_add` (line 203), `tvDist_eq_integral_abs_rnDeriv_of_ac` (line 121), the two integral Jensen lemmas (`IsClosed s`).
- Cross-roadmap citations resolved at the suppliers' present text: ImportanceSamplingAndVarianceReduction 1.1, 2.1 (`integral_mul_isWeight` with finite `p`, σ-finite `q`, `f ∈ L¹(p)`) and its scope sentence on bias bounds; RestrictedBoltzmannMachines 1.1, 1.2 (`jointLaw_eq_compProd`, both halves), its standard example and scope sentence; QuantumOptimization 1.1; SimulatedAnnealing 3.1; MathematicalStatisticsSemiparametric 7.1, 7.2 (`emQ`, `IsEMStep`, `emQ_sub_le_obsLogLikelihood_sub`, `obsLogLikelihood_le_of_isEMStep`); DenoisingDiffusion 1.1 and Layer 4. The 17 copied definitions are identical to their owners' after whitespace normalisation.
- Automatic checks: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/EvidenceLowerBound/Suggested.lean`: 12 `sorry` warnings and nothing else. Elaborated types compared with the README statements: the binders dropped are instance arguments (`DecidableEq`, `MeasurableSingletonClass`, `Fintype`) on copied definitions whose types do not mention them; no hypothesis of a theorem is lost, and 2.3 has `q ≪ p` and integrability outside and `p ≪ q` only before the strict increase, as in the README.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a copy: none of the 12 theorems closes.
- Headline theorems (README summary): the importance-weighted bounds (2.1–2.3), the augmented view (3.1–3.5), the greedy step (4.1–4.2), the global maxima of the free energy (5.1), with Bayes' formula 1.2; all stated in `Suggested.lean`, none through a stand-in. The pull request's title and description agree with this head (hypotheses of 2.3, the Jensen and tangent-line suppliers, the counts 12 and 21, the 17 copies).

Overlap check: read RestrictedBoltzmannMachines, ImportanceSamplingAndVarianceReduction, PACBayesBounds, HiddenMarkovModels, HypothesisTestingExponents, MathematicalStatisticsSemiparametric, MathematicalStatisticsNonparametric, DenoisingDiffusion; shared objects are cited, not owned twice: weight and estimates (owner ImportanceSamplingAndVarianceReduction), machines and conditional kernels (owner RestrictedBoltzmannMachines), EM objects, EM identity and EM monotonicity (owner MathematicalStatisticsSemiparametric), Gaussian relative entropy and the diffusion bound (owner DenoisingDiffusion), the Donsker–Varadhan formula and Pinsker (Tau Ceti); Baum's inequality of HiddenMarkovModels is a different model and is not restated; nothing else shared. This roadmap owns the importance-weighted bounds, the augmented proposal, the greedy bound and the joint maxima of the free energy: no roadmap on main or open states them.

Source independence: 15 passages compared with 5 sources, none shared; largest share DomkeSheldon2018, 5 of 16 locators in the layers; contents compared with DomkeSheldon2018 (its sections 1–7 and appendix A.1–A.3): independent, Layer 3 draws on its section 3.1 and appendix A.2 only and the other layers on other sources.

Research link: Layer 2 is Theorem 1 of Burda–Grosse–Salakhutdinov (2016); Layer 3 is the augmented-proposal analysis of Domke–Sheldon (2018); Layer 4 is the greedy guarantee of Hinton–Osindero–Teh (2006); Layer 5 is the global part of Theorem 2 of Neal–Hinton (1998). Rests on the README's references and the five texts read.

## Not verifiable

- none

## Source issues

- **Error** in BurdaGrosseSalakhutdinov2016 at Theorem 1, p. 4 (restated as part 3 of Appendix A, p. 10): the source says that a bounded weight makes the bounds converge to the log-evidence; it should be assumed also that the weight is positive almost surely with enough integrability of its logarithm, since otherwise every bound can be `−∞`; affects a stated result.
- **Gap** in BurdaGrosseSalakhutdinov2016 at Appendix A, part 3, p. 10: the source says that almost sure convergence of the averaged weights gives convergence of the expected logarithms; it should be supported by a domination or Fatou argument for the logarithm, which is unbounded below; affects the proof.

## For the human reviewers

- **Scope.** The subject is the theory of variational inference in machine learning; the five sources are three conference papers (ICLR 2014, ICLR 2016, NeurIPS 2018), a Neural Computation article and a book chapter (README References).
- **Scope.** Several targets have no source stating them and are marked "proved here": 1.2, 2.2 under its hypotheses, 2.3, the bias bound of 3.4, 3.5, the exact form of 4.1–4.2, the converse in 5.1 (README lines 100, 246, 276, 456, 474, 523, 636).
- **Licence.** Hinton–Osindero–Teh and Neal–Hinton are read from preprints on an author's page (README lines 835–840 cite Neal's page for the latter; the text I read is the same 14-page preprint from Hinton's page, read by OCR).
