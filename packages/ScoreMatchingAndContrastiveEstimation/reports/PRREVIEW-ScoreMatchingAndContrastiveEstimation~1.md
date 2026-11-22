# Review of ScoreMatchingAndContrastiveEstimation (pull request #3003 at 7131e42)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, route and Check of the four layers was recomputed (the Gaussian, quartic and non-normalisable models of Layer 1, the three-point sample of 2.1, the two-site and one-site ratio-matching examples, the two-point laws of 4.1) and agrees with the text; every locator into the three sources was read at its page; `Suggested.lean` elaborates with `sorry` as the only warning and none of its seven theorems closes with one tactic. There are two small corrections and one format note, none blocking. Two points are left to the human reviewers (the scope, and the copies the sources were read from).

## C01 — The scope paragraph says the optimal discriminator is not treated and names no owner, while 4.1 at `ν = 1` and GenerativeAdversarialObjectives 1.2 state the same theorem on their common ground

A reader of "Scope and ownership" (lines 462–466) learns that adversarial objectives "with the optimal discriminator between two probability laws" are not treated here, and that the classifier of 4.1 "is such a discriminator", but not who owns that theorem. The open roadmap GenerativeAdversarialObjectives states it in its 1.2: for probability measures `P`, `Q`, the loss `∫ −log D dP + ∫ −log(1 − D) dQ` has infimum `log 4 − 2 JSD(P, Q)`, attained exactly when `P` and `Q` are mutually absolutely continuous, by `D = dP/d(P + Q)`. For `ν = 1`, probability densities `pd`, `pn` with `pn > 0` and `D = e^f/(e^f + pn)`, `nceLoss` is that loss, `nceOptimalLoss` is that infimum, and the attainment clause of 4.1 (`pd > 0` almost everywhere where `pn > 0`) is the mutual absolute continuity there. Neither statement contains the other: 4.1 has a weight `ν` and unnormalised densities, 1.2 there has measures without densities and the Jensen–Shannon form. That roadmap's own scope names noise-contrastive estimation as not treated.

The smallest change: in the last paragraph of the scope, name GenerativeAdversarialObjectives 1.2 as the owner of the optimal discriminator and of the Jensen–Shannon value for two probability laws, and keep the clause that follows, which already says how 4.1 differs. The description's list of boundaries would name it as well.

## C02 — The second Check of 4.1 can be read as saying that the optimal loss is `0`

In the Check "Attainment can fail under the support hypothesis" (lines 402–404), with `pd = (1, 0)`, `pn = (½, ½)`, `ν = 1`, the sentence "The point `1` contributes `½ log(1 + 2e^(f₁)) > 0` for every real `f₁` and the optimum `0`" means that the point `1` contributes `0` to the optimum. Read as "the optimum is `0`" it is false: the point `0` contributes `log(3/2) + ½ log 3 ≈ 0.955` to `nceOptimalLoss`. Writing "contributes `½ log(1 + 2e^(f₁)) > 0` to the loss for every real `f₁` and `0` to the optimum, whose value `log(3/2) + ½ log 3` comes from the point `0`" removes the ambiguity.

## N01 — "checked exactly for `N = 3`" in the Curie–Weiss Check of 3.1 reports a verification, not a value

In the Check of 3.1 on the Curie–Weiss law (line 278) the parenthesis says that something was checked and gives nothing a reader can recompute; the `N = 2` value that follows (`1/(1 + e^β) = 1/4`) already does that job. Drop the parenthesis or give the `N = 3` value. In line 243 `ratioTransform Px ·  i` has a doubled space.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 the two objectives | standard normal `p`; `logq = −M(x−μ)²/2`; `logq = x²/2` | `½E((1−M)X + Mμ)² = ((M−1)² + M²μ²)/2`; `½E(2X)² = 2`; `E(1 + X²/2) = 3/2` | agrees with Checks | none |
| 1.2 Hyvärinen's identity | Gaussian model; `x²/2`; quartic; `n = 0`; `ψ = sin(e^(x²))` | `−M + M²(1+μ²)/2 + ½ = ((M−1)²+M²μ²)/2`; `3/2 + ½ = 2`; Stein `E[Xψ] = E[ψ′]`; `0 = 0`; `φ·2|x|e^(x²)|cos|` not integrable | true; each route step has its hypothesis | none |
| 1.2 route, step 3 | hypotheses of the Mathlib integration by parts with `f = p`, `g = ψᵢ` | needs `f′v·g`, `f·g′v`, `f·g` integrable: bounded by `p(‖ψ‖²+‖s‖²)/2`, hypothesis, `p(1+‖ψ‖²)/2` | all three supplied | none |
| 1.3 identification | `logq = −(x²−7)/2`; `logq = e^(x²)`; `p ∝ exp(−x²+sin e^(x²))`, `logq = 0`; `p = 1`, `logq = 0`; `n = 0` | `0`; integrand `≥ φ·4x²e^(2x²)`, junk `0`, not constant; `p s²` not integrable; `∫e^logq = ∞`; both sides true | both directions true; moment hypotheses needed | none |
| 1.3 lemma (zero gradient a.e. ⇒ constant) | route read against Mathlib's `intervalIntegral.integral_eq_sub_of_hasDerivAt` | needs derivative on the whole interval and interval integrability only; derivative `= 0` a.e. | route complete | none |
| 2.1 closed form | sample `{0,1,3}`, `F = (x, −x²/2)`; one-point law at `2`; `m = 0` | `A = [[1,−4/3],[−4/3,10/3]]`, `det = 14/9`, `θ̂ = (6/7, 9/14)`, mean `4/3`, variance `14/9`, min `−9/28`; `θᵀAθ = 0`, value `−s`; trivial | agrees; positive definiteness needed | none |
| 3.1 ratio-matching identity | two sites with zeros, uniform and three random `Q`; `Px = (1,−1)`; `Q = 0`; `ι` empty | objective `1/4`, loss `1/2`, `c = −1/4` for every `Q`; differences `0` and `−1/2`; `1/4` vs `0 − 1/4`; `0 = 0 + 0` | true; both hypotheses needed | none |
| 3.1 route | `B − 2C` per site | `ρ² + (1−ρ)² − 2(1−ρ) = 2ρ² − 1`; `c = A/2 − (|ι|/2)ΣPx = 3/4 − 1 = −1/4` | agrees with Check | none |
| 3.1 Checks on suppliers | RBM `W = log 3`; Curie–Weiss `N = 2`, `e^β = 3`; flip ratio | `Q = (2,4)`, transforms `1/3`, `2/3`; `−4sM + 4 = −4s(M−s)`, `σ(−β) = 1/4`; `exp(−2xᵢ(Mx)ᵢ − 2bᵢxᵢ)` | agree with RestrictedBoltzmannMachines 1.3, CurieWeissModel conventions, source (18) | none |
| 3.2 identification | two-site law with a zero; `Px = 2Q/ΣQ`; `ι` empty | objective `1/4 > 0` (positive for random `Q`); objective `0` with `ΣPx = 2`; `Px = 1 = Q/ΣQ` | both directions true; normalisation needed | none |
| 3.3 consistency | `Θ` a point; `Θ = [0,∞)`, `Q θ = (1, exp(θe^(−θ)))`; hypotheses of MathematicalStatisticsAsymptotic 5.1 | `θe^(−θ) → 0`, so `J θ → J 0`; `hbdd`: `|loss − J| ≤ |ι|·2`; `hmax` with `R = 0`; variance `≤ 1/(4T)` | route supplies each hypothesis of 5.1 | none |
| 4.1 NCE theorem | `pd=(½,½)`, `pn=(1,0)`; `pd=(1,0)`, `pn=(½,½)`; `ν = 0`; one point `pd=1`, `pn=2`; `a = 0` | min `½log3 + log(3/2) = 0.9548` at `e^(f₀) = ½`, `f₁` free; point `1`: `½log(1+2e^(f₁)) > 0` vs `0`; all `0`; `log3 + 2log(3/2) = 1.9095 < 3`, derivative `2(eᵗ−1)/(eᵗ+2)`; `b log((eᵗ+b)/b) > 0` | true; see C02 for wording | C02 |
| 4.1 pointwise identity | expand `(a+b)·KL(α‖β)` | `a[log((eᵗ+b)/eᵗ) − log((a+b)/a)] + b[log((eᵗ+b)/b) − log((a+b)/b)]` | identity holds | none |
| Scope: DenoisingDiffusion 3.3 | its `J_ESM` against 1.1 | `E‖f(Y) − ∇log p(Y)‖²` there, `½∫p‖·‖²` here: factor `2` | as stated | none |
| Scope: relative Fisher information | `h = p/q`, `μ = q dx` | `‖∇h‖²/h · q = p‖∇log p − ∇logq‖²` | as stated | none |
| Scope: optimal discriminator | 4.1 at `ν = 1`, probability densities, against GenerativeAdversarialObjectives 1.2 | same loss, same infimum, same attainment criterion on the common ground | owner not named | C01 |

- Source locators checked against the text: 24 (Hyvärinen 2005: equations (1)–(4), Theorems 1–2, Corollary 3, footnotes 1–2, Section 3.1.1, Appendices A–B, pp. 696–699 and 706–708; Hyvärinen 2007: equations (12)–(18), Theorems 1–2, Section 4.1 with (29)–(34), Appendices A–B, pp. 2502–2503, 2506, 2508–2510; Gutmann–Hyvärinen 2012: equations (3)–(11), Theorems 1–2, Appendix A.2, Lemma 10, pp. 310–312, 342–344). All agree.
- Library declarations checked at the pinned Mathlib: 26 named in the README, all present; five opened for their hypotheses (`Mathlib/Analysis/Calculus/LineDeriv/IntegrationByParts.lean:226`, `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:171`, `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1148`, `Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean:112`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean:590`). No score-matching, ratio-matching or noise-contrastive statement exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 12 (MathematicalStatisticsAsymptotic 1.1 and 5.1, with `TendstoInProbability` identical to `TauCetiRoadmap/MathematicalStatisticsAsymptotic/Suggested.lean` lines 99–101 and the contract of 5.1 identical to lines 634–642; DenoisingDiffusion 3.3; ScoreBasedDiffusion 2.3; MathematicalStatisticsFoundations 4.3; RandomMatrices 2.5; SteinsMethodForNormalApproximation; RestrictedBoltzmannMachines 1.3; CurieWeissModel 1.1; DiscriminantAnalysisAndLogisticRegression 3.3; LogConcaveFunctionalInequalities 1.3; DifferentialEntropyAndEntropyPower 2.1).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. RestrictedBoltzmannMachines and CurieWeissModel are open new roadmaps and enter Checks only.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/ScoreMatchingAndContrastiveEstimation/Suggested.lean`: seven `sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the seven theorems closes.
- Signatures: the elaborated types of all 20 declarations were compared with the README; the binders that `flipAt`, `ratioTransform` and `empiricalFreq` do not carry (`Fintype ι`, `DecidableEq ι`) are ones their types do not use; no hypothesis is lost.
- Headline theorems (1.2, 1.3, 2.1, 3.1, 3.2, 3.3, 4.1): all seven are stated in `Suggested.lean` at the README's generality; the 13 definitions have real bodies; single `import Mathlib`, no `set_option`.
- Change outside the folder: none.

Overlap check: read DifferentialEntropyAndEntropyPower, DiffusionReverseStepKLBound, ScoreBasedDiffusion, DiscriminantAnalysisAndLogisticRegression, RestrictedBoltzmannMachines, MathematicalStatisticsSemiparametric, DenoisingDiffusion, MathematicalStatisticsAsymptotic (the third list is empty), and GenerativeAdversarialObjectives found by search; the Fisher information of a density: DifferentialEntropyAndEntropyPower 2.1 (here only an integral in a hypothesis); the explicit objective for a Gaussian-smoothed law: DenoisingDiffusion 3.3 (1.1 here is for a general density, with the factor ½); `TendstoInProbability`: MathematicalStatisticsAsymptotic 1.1 (copied); the optimal discriminator of two probability laws: GenerativeAdversarialObjectives 1.2 (C01). The implicit form of score matching, ratio matching and noise-contrastive estimation have no other owner on main or in an open pull request.

Source independence: 11 passages compared with 3 sources (the statements and routes of 1.2, 1.3, 2.1, 3.1, 3.2, 3.3, 4.1, the definition of 1.1, the parametric remark of 4.1 and two docstrings), none shared beyond the three quoted words of footnote 1; largest share Hyvärinen 2005 and Hyvärinen 2007, 7 of 17 locators each; contents compared with both: independent (Layer 1 ↔ 2005 §2; Layer 2 ↔ 2007 §4.1 and Layer 3 ↔ 2007 §2, in the reverse order, with 2007 §3 left out; the routes of 1.2, 1.3, 3.2 and 4.1 are not the sources').

Research link: Layers 1–4 state, with exact hypotheses, the population theorems of Hyvärinen 2005 (score matching), Hyvärinen 2007 (ratio matching, exponential families) and Gutmann–Hyvärinen 2012 (noise-contrastive estimation); DenoisingDiffusion 3.3 and ScoreBasedDiffusion 2.3 build on the explicit objective of Hyvärinen 2005. Rests on the README's references and the three texts read.

## Not verifiable

- none: all three sources were read. The algebra of Hyvärinen 2007, Appendix A, was read for its locator and pages only; the identity of 3.1 was verified by recomputing the README's own route and its Checks.

## Source issues

- **Gap** in Hyvarinen2005 at Theorem 1 with footnote 1, p. 697, proof Appendix A, pp. 707–708: the source says a differentiable density, finite second moments of both scores and decay of the density times the model score justify the partial integration; it should also assume the density times each second derivative of the log-model integrable, which the other conditions do not imply; affects a stated result.
- **Gap** in Hyvarinen2005 at Theorem 2, p. 698, proof Appendix B, p. 708: the source says a vanishing objective makes the two scores equal and hence the log-densities differ by a constant; it should pass from equality almost everywhere to everywhere, which needs an argument for differentiable functions with gradient zero almost everywhere; affects the proof.
- **Gap** in Hyvarinen2007 at Theorem 2, second part, p. 2503, proof Appendix B, p. 2510: the source says consistency follows from the law of large numbers and uniqueness of the minimiser; it should assume uniform convergence over the parameter space and a well-separated minimum, for instance compactness and continuity; affects a stated result.
- **Gap** in GutmannHyvarinen2012 at Theorem 1, p. 311, proof Appendix A.2, pp. 342–343: the source says the objective is maximal at the logarithm of the data density, by a second-order expansion; it should require the data density positive where the noise is (the logarithm is otherwise not real-valued) and argue globally; affects a stated result.

## For the human reviewers

- **Scope.** The subject is estimation of unnormalised statistical models (`metadata.toml`: math.ST); the three sources are refereed articles (JMLR 2005 and 2012, CSDA 2007). Whether this lies in the project's scope is yours to decide.
- **Licence.** The three texts were read from A. Hyvärinen's own page at cs.helsinki.fi, since the sources service has no licence class for jmlr.org; the README records the JMLR articles as open access at jmlr.org.
- **Reuse.** The description states that the roadmap was drafted and reviewed with AI agents and that no outside formalization was used; no public formalization of these statements was found in the pinned libraries.
