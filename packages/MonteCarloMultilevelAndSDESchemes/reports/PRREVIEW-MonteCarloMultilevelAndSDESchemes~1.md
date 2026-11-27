# Review of MonteCarloMultilevelAndSDESchemes (pull request #3236 at 5b3eb8e)

**Verdict:** needs changes

**Summary.** Needs changes: two prose targets are false as written. The several-noise Milstein target of §4.2 states strong order one with no hypothesis on the coefficients, and the stability equivalence for the exact solution in §5.1 fails for the initial value 0. All 22 statements of `Suggested.lean` survived the adversarial pass and none closes with one tactic. There are four small corrections and two format notes, none blocking. For the human reviewers: the wording and arrangement could not be compared with four of the six sources (Kloeden–Platen, with the largest share of locators, among them), and five Lean names agree with the author's own public formalisation.

## R01 (P2) — The several-noise target of §4.2 asserts strong order one for every scalar equation driven by m Brownian motions, with no hypothesis on the coefficients

The bullet "Several noises (no Lean name)" (README line 385) reads "For a scalar equation driven by m Brownian motions, the scheme with the double integrals … has strong order one". The Scope section makes every prose target of the layers part of the completion criterion, so an implementer is asked to prove this sentence, and it is false as it stands. The only standing hypothesis is the Conventions' "C² (Layer 4)".

Take m = 1, a(x) = −x³, b = 1. The coefficients are smooth and the equation has a global solution with finite moments. Since b is constant, the scheme is Euler–Maruyama (the Check of §4.1, line 370). For this equation the mean-square error of Euler–Maruyama at a fixed time T tends to infinity as the step tends to 0: Hutzenthaler–Jentzen–Kloeden, arXiv:0905.0273v3, Theorem 1 with β = 3, α = 2 (statement at lines 237–262 of the cached text, the example (1.1)–(1.2) at lines 55–62, the conclusion (1.6) at lines 114–119). So there is no bound K h.

The Sources line of §4.2 already points at the conditions (3.19)–(3.23) of the cited theorem; they are not carried into the bullet. The smallest change is to state hypotheses in the bullet itself: those of the cited theorem in the roadmap's own words, or the m-noise analogue of the scalar target above it (a and each bⱼ are C², Lipschitz, with bounded second derivatives, and each `b_{j₁} ∂ₓ b_{j₂}` is Lipschitz), with the same conclusion "for every T there is K with … ≤ K h for every h > 0 and every n with n h ≤ T". I could not read Kloeden–Platen, so I cannot say which of the two the locator supports.

## R02 (P2) — The equivalence "E u(t)² → 0 if and only if r + σ²/2 < 0" in §5.1 fails for u₀ = 0

In the bullet "The equation (no Lean name)" (README lines 431–433), the formula `E u(t)² = e^((2r + σ²)t) u₀²` gives E u(t)² = 0 for every t when u₀ = 0, whatever the sign of r + σ²/2 (r = 1, σ = 0, u₀ = 0: the left side holds, the right side does not). The discrete counterpart in §5.2 carries x ≠ 0 for exactly this reason. Add "for u₀ ≠ 0" to the bullet.

## C01 — The proof route of the local error in §4.1 goes through a remainder set whose coefficient functions need a third derivative of g

The route (README lines 361–363) is "§3.3 with the remainder set of the Milstein set". For m = 1 that set contains (0,1,1), whose coefficient is L⁰(g g′) and involves (g g′)″ = 3 g′ g″ + g g‴; and the Milstein truncation of §3.3 assumes `b ∂ₓ b` is C². The target assumes only that g is C², so g g′ is C¹ and neither exists. The statement itself is true under its hypotheses (I checked it directly: the drift error has L² norm O(h^(3/2)), and the integrand g(X_s) − g(x₀) − g′g(x₀) W_s has L² norm O(s)). A route that fits the hypotheses: the hierarchical set {v, (0), (1)}, whose remainder set is {(0,0), (1,0), (0,1), (1,1)} and needs only f and g in C², then compare the (1,1) remainder integral of g g′(X) with g g′(x₀) I_(1,1)[1], using that g g′ is locally Lipschitz with a derivative of linear growth.

## C02 — Two locators into Caflisch point at the sample mean, not at what the subsections state

In §1.1 (line 91) "[C, (2.4)–(2.6), p. 4]" is the Monte Carlo sum, its almost sure convergence and the unbiasedness of the mean. Neither the sample variance nor the variance of the sample mean is there. The variance v/R of the sample mean is C (2.13)–(2.15), p. 6 (C lines 193–205). In §1.2 (line 116) the strong law is (2.5), p. 4 (C lines 145–147); (2.4) is the definition of the sum.

## C03 — Two Checks refer to a file `notes.md` that is not in the folder

The Checks of §2.3 (line 226) and §5.2 (line 462) end "(notes.md)". The folder holds `README.md`, `Suggested.lean` and `metadata.toml`, so a reader cannot find the computation. Remove the pointer, or give the numbers in the Check as the other simulation Checks do.

## C04 — The Lean statements of §2.2 and of the deterministic form of §2.3 mention none of the roadmap's objects

`multilevel_cost_ge_and_optimal` and `exists_multilevel_sampleBudget` are statements about real sequences V, C, N alone. Both are true and neither is trivial, but as acceptance tests they do not touch `multilevelEstimator`. For §2.3 the estimator form `exists_multilevelEstimator` already does. For §2.2 you could either say in the docstring that `∑ V l / N l` is the variance of `multilevelEstimator` by §2.1, or state the lower bound for that variance directly. This is an offer; the deterministic forms can stay.

## N01 — TeX-style subscripts stand outside code spans

`_{…}` appears in running text at lines 179, 186, 252, 254, 282–293, 310, 334–336, 345 and 357 (for example `Σ_{l ≤ L} V l / N l`, `I_{(j,j)}[1]_t`, `u_{n+1}`). Put each formula in a code span or write it in Unicode.

## N02 — A few phrases date the text

"the open roadmap ImportanceSamplingAndVarianceReduction" (line 29) will be wrong once it merges; name the roadmap without "open". "This repairs the definition of a strong solution in the lean-NASC source" (lines 76–77) and "the Conventions above repair it" (line 577) narrate a history; the Conventions can simply say that the drift integral is a Lebesgue integral.

## Questions for the author

- [G] Theorem 2.1: the copy on the author's page labels the complexity theorem "Theorem 1" (G lines 259 and 1389), on the pages you cite (264–265). Is "Theorem 2.1" the label in the printed Acta Numerica article? I could not read the publisher's version.
- §2.4 cites [LPS, Lemma 8.46] for the constant (1 + √2)² and [LPS, Lemma 8.47] for the cost at order one half. Do those lemmas state the bound for a general Lipschitz functional, or for a functional of the terminal value only? I could not read the book.
- §1.1: the sample variance with divisor R − 1 is the U-statistic with kernel (x − y)²/2 of MathematicalStatisticsFoundations §2.4, which proves unbiasedness for i.i.d. samples. Your hypothesis (pairwise independent, common mean and variance) is weaker, so this is no duplication; would a one-clause pointer in Scope help readers?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `integral_sampleVariance` | R = 2 Bernoulli(½); sample (1,2,6); R = 1 | E Σ(Z−x̄)² = Rv − R·v/R = (R−1)v; ¼ vs ⅛ with divisor R; 14/2 = 7; junk 0 | true | none |
| 1.2 `tendsto_sampleVariance_ae` | Rademacher; independent N(0, r+1) | s² = R/(R−1)(1 − x̄²) → 1; ΣZ²/R² → ½ so s² ~ R/2 → ∞ | true; control valid | C02 (locator) |
| 1.3 studentized mean | R = 0, 1 junk; s_R = 0 | junk only on events of probability → 0; IdentDistrib gives measurability | true | none |
| 1.3 coverage | q < 0; q = 0; variance 0; q = 1.96 | limit 0 = N(∅); P(x̄ = μ) → N({0}) = 0; constant sequence covers with prob. 1; mass 0.950004 | true | none |
| 2.1 mean and MSE | L = 0; deterministic D; N l = 0 | Σ(m l − m(l−1)) = m L; Var = ΣV l/N l by pairwise independence; N = 0 loses a mean term | true | none |
| 2.2 optimal allocation | V = (4,1), C = (1,4); equal allocation | S = 4, cost 16/ε², N = (8,2)/ε²; ΣV/N = ε²; equal: 5·5 = 25/ε² | true | C04 |
| 2.3 deterministic form | negative c₂, c₃; c₁ = 0; α = ¼, β = γ = 1 | ceiling cost Σ 2^(γl) ~ ε^(−γ/α) ≤ regime iff α ≥ ½min(β,γ); control: 2^L > ε⁻⁴ | true | C03, question on label |
| 2.3 estimator form | bias l = m l − z | MSE = (m L − z)² + ΣV/N by 2.1 | true | none |
| 2.4 bias and second moments | c·h < 0; φ = id, S_l = S + √(c h_l) | ofReal = 0 forces S = S_l a.e., both sides 0; bound attained with K = 1 | true | none |
| 2.4 cost at order ½ | level 0; φ(S₀) ∉ L² | l ≥ 1: V ≤ K²c(1+√2)²2^(−l), 5.828 < 6; level 0: finite variance or Mathlib's 0 | true | question on LPS |
| 3.1 predicate, existence, uniqueness | α = [], [0], [j+1]; t = 0; raw filtration | I₍₀₎[1] = t, I₍ⱼ₎[1] = Wʲ; J 0 = 0; progressive version by limsup of left dyadic steps | true | none |
| 3.1 zero mean | [0,0], [j+1,0], [0,j+1], g = 1 | t²/2 ≠ 0 excluded; ∫E K_s ds = 0 by Fubini; E K_s² ≤ C²s | true | none |
| 3.1 repeated index | Stratonovich variant | ((Wʲ)² − t)/2 vs (Wʲ)²/2, differ by t/2; E I₍₁,₂₎² = t²/2 | true | none |
| 3.2 operators, coefficients, sets | f = x, f = x²; a = x, b = 1; m = 1 sets | f₍₀,₁₎ = L⁰b = 0 vs reversed L¹a = 1; L⁰x² = 2ax + Σb²; remainder of Milstein set has 5 elements | true | none |
| 3.3 `itoTaylor_expansion` | A = {v}; X = W, f = x², A = {v,(0),(1)}; m = 0 | Itô's formula; W² = t + 0 + (W² − t); v ∈ A always so f is C² | true | none |
| 3.3 `itoTaylor_milstein` | coefficients of milsteinSet for f = x | a, bⱼ, b_{j₁}∂ₓb_{j₂}; inner integration j₁, outer j₂, matches L^{j₁}b_{j₂} | true | none |
| 4.1 local error | f = x/2, g = 0.8x; g only C² | leading constant 0.512²/6 + 0.16 = 0.2037 vs simulated 0.206; route needs g‴ | statement true; route does not fit | C01 |
| 4.2 scalar strong order one | n = 0; h > T; g = 0 | error 0; no n ≥ 1 admissible; (1+Ch)E e² + Ch³ recursion gives K h | true | none |
| 4.2 several noises (prose) | m = 1, a = −x³, b = 1 | Milstein = Euler; mean-square error → ∞ (HJK Theorem 1, β = 3, α = 2) | false as written | R01 |
| 4.3 Clark–Cameron | N = 0; h = 0; left endpoint | E(W_s − ½W_h)² = h/4, per step h²/4; left endpoint h²/2 | true | none |
| 5.1 amplification, second moments | h = 0; σ = 0, θ = 0, 1; r = −8, σ = 3, θ = 0, h = ¼ | R = 1; (1+rh)², (1−rh)⁻²; 1 + 2.25 = 3.25 | true | none |
| 5.1 the equation (prose) | u₀ = 0, r = 1, σ = 0 | E u(t)² = 0 → 0 while r + σ²/2 = 1 > 0 | false for u₀ = 0 | R02 |
| 5.2 stability and regimes | r = −8, σ = 3; θ = ½, r = 4, h = ½ | 7/64; R = 0.94, 1.0816, 0.5625, 0.3611; denominator 0 gives junk 0 < 1 | true | C03 |

- Source locators checked against the text: 9 in [G] (estimator p. 261, (2.1)–(2.3) p. 264, (1.1) p. 262, the complexity theorem pp. 264–265, §5.1 p. 287 three times, §§5.2–5.3, §§2.7 and 3.5) and 3 in [C] (two do not fit, C02); [KP, Theorem 10.3.5] confirmed as the Milstein strong-order theorem through G line 1728.
- Library declarations opened at the pin: `TauCeti.integral_finiteMean_sub_sq` (TauCeti/Probability/Moments/SampleMean.lean:111), `IsBrownianReal` (Mathlib/Probability/BrownianMotion/Basic.lean:302); the ten `#check` pins elaborate. No sample variance in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved: 15 (StochasticCalculus Conventions, §§1.3, 3.2, 5.1, 6.4, 9.1, 9.4, 9.6; MathematicalStatisticsFoundations §§5.2, 8.4, 8.5, 9.1; MathematicalStatisticsHigherOrderAndResampling §4.5; MarkovChainsAndRenewal §2.4; ImportanceSamplingAndVarianceReduction §1.2 at its open head). The six local copies are identical to StochasticCalculus's definitions.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`. No change outside the folder.
- Elaboration of `Suggested.lean`: `sorry` warnings only (22). One-tactic probe (`rfl`, `simp`, `intros; trivial`) on a probe copy of the file: none of the 22 theorems closes. Elaborated types compared with the README for all 42 declarations: `multilevelEstimator` and `milsteinScheme` drop only the unused `[MeasurableSpace Ω]`; no hypothesis is lost.
- Description read against the head: the counts (22 theorems, 12 owned definitions), the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d), the imports and the suppliers agree.

Overlap check: read ImportanceSamplingAndVarianceReduction, QuasiMonteCarloSparseGridsAndTractability, StochasticCalculus; the variance of the crude estimate is owned by ImportanceSamplingAndVarianceReduction §1.2 and cited here as its case q = p; Euler–Maruyama and the solution notion are StochasticCalculus's (§§9.1, 9.6) and cited; nothing else shared.

Source independence: 8 passages compared with 2 sources ([G], [C]), none shared; largest share KP, 24 of 64 locators; contents not compared with KP, whose text and section list could not be read; against [G] (12 locators) the layers are independent (Layer 2 takes the estimator and its error before the allocation, [G] the reverse).

Research link: Layer 2 is the complexity theorem of Giles (2008, 2015) with the allocation and the Lipschitz-payoff parameters; Layers 3–4 are the Itô–Taylor calculus and Milstein order of Kloeden–Platen (1992), which Giles's Milstein multilevel method uses (G line 1728); rests on the README and [G].

## Not verifiable

- [KP] Kloeden–Platen (Springer 1992): paywalled, no legal copy; all 24 locators unchecked except Theorem 10.3.5 as above.
- [LPS] Lord–Powell–Shardlow (CUP 2014): the publisher's page is in no licence class; all 15 locators unchecked.
- [AG] Asmussen–Glynn (Springer 2007): paywalled; all 7 locators unchecked.
- [DKS] Dick–Kuo–Sloan, Acta Numerica 2013: the publisher's page is in no licence class and no author copy was found at the address tried; Theorem 2.1, p. 138 unchecked.
- [G] the printed theorem label (the author's copy reads "Theorem 1").

Automatic checks set aside as false positives: the rule that a section comment in the Lean file must have a declaration under it flags the last section, which holds the ten `#check` pins of library declarations and is meant to hold nothing else.

## Source issues

- **Misprint** in G at §5.1, p. 287: the source says the step on level ℓ is h₀ times M to the power ℓ; it should be h₀ times M to the power −ℓ, as its own examples 4^(−ℓ) h₀ and 2^(−ℓ) h₀ on p. 288 show; affects nothing.

## For the human reviewers

- Not tested: Kloeden–Platen has the largest share of the locators (24 of 64) and neither its text nor its section list could be read; wording and arrangement of Layers 3–4 were not compared with it. The same holds for Lord–Powell–Shardlow (15) and Asmussen–Glynn (7).
- Licence: `Suggested.lean` shares five declaration names (`sampleVariance`, `exists_multilevel_sampleBudget`, `exists_itoTaylor_local_remainder_bound`, `exists_milstein_strong_error_bound`, `theta_meanSquare_stability`) with github.com/bjbraams/lean-NASC at 8efdbf7 (NASC/MonteCarlo.lean, NASC/StochasticEquations.lean), the pull request author's own repository, declared Apache-2.0 in the README.
- Scope: the subject is numerical analysis of stochastic differential equations and Monte Carlo; the sources are refereed surveys and monographs. The simulation Checks report numerical experiments whose code is not in the folder.
