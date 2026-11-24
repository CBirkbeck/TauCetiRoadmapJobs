# Review of ArithmeticDirichletSeriesPartII (pull request #3027 at 4a2d22f)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 129 changed lines since `592bdb1`. The change adds §0.1b (Landau's theorem for Laplace integrals of functions of one sign, with its Mellin form) and §4.1a (the counting-function transform for coefficients of any sign), and adjusts the overview, the Conventions, the Layer 0 and Layer 4 introductions, the Dependencies and the scope. I recomputed both statements, every new Check and the proof sketch of §0.1b, and they are correct. Landau's locators match the 1905 paper (p. 548, pp. 547–548, pp. 536–537). One finding blocks: the overview now lists Landau's theorem alongside §0.1a and §2.2a as theorems the roadmap proves, and `Suggested.lean` states the other two, but not this one, although it can be stated at the pins. There are four small corrections and one format note. Nothing is left for a human to decide.

## R01 (P2) — Landau's theorem is now a headline of the overview but is absent from `Suggested.lean`, although it is statable at the pins

The overview (lines 40–45) now says that the roadmap "also proves the rule for the transform of a derivative … and Landau's theorem … For complex coefficients … it proves smoothed and interval forms of Wiener–Ikehara". `Suggested.lean` states the other two items of that sentence (`hasLaplace_deriv_of_primitive`, `hasLaplace_deriv`, `wienerIkehara_smoothed`, `wienerIkehara_interval`), and its module docstring (lines 8 and 15) says it states all the headline theorems and lists those items. The new theorem is in neither the file nor the docstring, so the acceptance test no longer covers what the overview promises. Two roadmaps of the same pull request, PositivityOfDirichletSeriesWithKernels §6.3 and GeneralizedRiemannHypothesisFromWindowBounds Layer 1, rely on §0.1b as the owner of this theorem.

Every carrier the theorem needs exists: `HasLaplace` is already declared in the file, and `AnalyticOnNhd`, `Metric.ball` and `Integrable` come from Mathlib. The statement below, appended to a copy of the file, elaborates against the pinned Mathlib and Tau Ceti with only the `sorry` warning. The smallest repair is to add it to the Layer 0 section, under a name of the author's choosing, and to name it in the module docstring next to §0.1a:

```lean
theorem hasLaplace_landau {g : ℝ → ℝ} {F H : ℂ → ℂ} {A r u₀ : ℝ}
    (hg : ∀ᵐ u ∂(volume.restrict (Ioi u₀)), 0 ≤ g u)
    (hF : ∀ s : ℂ, A < s.re → HasLaplace (fun t ↦ (g t : ℂ)) s (F s))
    (hr : 0 < r) (hH : AnalyticOnNhd ℂ H (Metric.ball (A : ℂ) r))
    (hFH : ∀ s ∈ Metric.ball (A : ℂ) r, A < s.re → F s = H s) :
    ∃ A' < A, Integrable (fun t : ℝ ↦ Real.exp (-A' * t) * g t) (volume.restrict (Ioi 0)) ∧
      ∃ G : ℂ → ℂ, AnalyticOnNhd ℂ G {s : ℂ | A' < s.re} ∧
        (∀ s : ℂ, A' < s.re → HasLaplace (fun t ↦ (g t : ℂ)) s (G s)) ∧
        ∀ s : ℂ, A < s.re → G s = F s := by
  sorry
```

## C01 — §4.1a does not mention Mathlib's `LSeries_eq_mul_integral`, which proves its Mellin identity under stronger hypotheses

An implementer of §4.1a should know that Mathlib already has the identity `LSeries f s = s * ∫ t in Ioi 1, (∑ k ∈ Icc 1 ⌊t⌋₊, f k) * t ^ (-(s + 1))` (`LSeries_eq_mul_integral` and its primed variant, `Mathlib/NumberTheory/LSeries/SumCoeff.lean`, lines 140 and 155). §4.1a (lines 989–1020) and the Mathlib supplier contracts do not mention it.

Mathlib's version is not a duplicate. It needs partial sums `O(n^r)` with `0 ≤ r < Re s`, and it does not assert integrability. §4.1a needs only absolute convergence at `s`, and it asserts integrability. For example, take `c n = n^(σ₀−1)/log² n` at `s = σ₀ > 0`. The series converges absolutely, since `∑ 1/(n log² n) < ∞`. But the partial sums are about `n^σ₀/(σ₀ log² n)`, which is not `O(n^r)` for any `r < σ₀`. So §4.1a applies there and Mathlib's lemma does not.

Would one clause in §4.1a and a bullet under *From Mathlib* say this? Mathlib's lemma could then also be named as the route on the region where its growth hypothesis holds.

## C02 — The overview's statement of Landau's theorem needs the abscissa to be finite

At lines 41–42 the overview says the Laplace integral of a function that is nonnegative for large argument "is singular at the real point of its abscissa of convergence". For `g = 1` on `(0, 1)` and `0` after, the transform `(1 − e^(−s))/s` is entire and the abscissa is `−∞`. For `g(u) = e^(u²)` it is `+∞`. In neither case is there a real point. §0.1b (line 269) correctly says "when the abscissa … is finite". Adding "when that abscissa is finite" to the overview makes the two agree.

## C03 — §4.1a lists Landau's theorem as a prerequisite, but it uses only the change of variables `y = eᵗ`

The *Needs:* line of §4.1a (line 1016) and the new line of the build diagram (line 88) make §4.1a depend on all of §0.1b. Its proof sketch uses only the substitution `∫_1^∞ G(y) y^(−s−1) dy = ∫₀^∞ G(e^u) e^(−su) du`, which is stated with the Mellin form of §0.1b and does not need Landau's theorem. An implementer of §4.1a would think they have to wait for Landau's theorem. Would "the substitution `y = eᵗ` stated with §0.1b's Mellin form" in the *Needs:* line, or Mathlib's one-sided change of variables `MeasureTheory.integral_comp_exp_Ioi` and `MeasureTheory.integrableOn_comp_exp_Ioi` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`, lines 1157 and 1164), describe the dependency exactly?

## C04 — Two of the new citations give only a chapter

§4.1a's only source is "Montgomery and Vaughan (2007), chapter 1" (line 1018), and §0.1b cites "Ingham (1932), chapter V" (line 294 and line 1576). A reader cannot find the statement relied on without a theorem or page number. Giving it, as is done for Lemma 15.1 in the same sentence, would fix this.

## N01 — §0.1b could name the Tau Ceti declaration of the Dirichlet-series case

Line 271 refers to "Completed/ArithmeticDirichletSeries §8.1" for the Dirichlet-series case. Tau Ceti proves it as `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean`, line 296). Naming the declaration and linking the roadmap path, as the README does elsewhere for the parent, would help a reader.

## Questions for the author

- §4.1a's *Source* paragraph says that the form at a single point of absolute convergence is derived from §4.1. Does Montgomery–Vaughan's chapter 1 state the identity on `Re s > max(0, σ_c)` under ordinary convergence? If so, §4.1a is narrower than its source, and the description's "stated in the generality of its source" does not apply to it; a clause saying so would help. I could not check this: the book has no legal open copy (the DOI resolves only to the publisher's paywalled page).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §0.1b Landau's theorem, hypotheses ⇒ conclusion | `g = e^(−u)`, `A = 0`, `H = 1/(s+1)`, `r = 1` | conclusion asks `A′ < 0`; `A′ = −1/2` gives `∫ e^(−u/2) < ∞`; value `1/(s+1)` matches | holds |
| §0.1b degenerate | `g = 0`; `g = e^u` with `A = 2` and with `A = 1` | `g = 0`: any `A′`. `A = 2`: `A′ = 1.5` integrable. `A = 1`: no `H` near the pole, hypothesis fails | consistent |
| §0.1b sign hypothesis | `g = sin u`, `A = 0`, `H = 1/(1+s²)`, `r = 1` | hypotheses hold except the sign; no `A′ < 0`, since `|sin u|e^(−A′u)` is not integrable | sign needed, as the Check says |
| §0.1b proof sketch radii | `A = 0`, `r = 1`, `a = 0.4` | disc radius `r − (a − A) = 0.6 > 0.4`; admissible `b ∈ (2a − A − r, A) = (−0.2, 0)` | consistent |
| §0.1b proof sketch, interchange | `∑_k (a−b)^k/k! ∫ u^k g e^(−au)` | on `(0,u₀]`: `∫|g|e^(−bu) < ∞`; on `(u₀,∞)`: Tonelli gives `∫ g e^(−bu)` | correct; matches Landau p. 548 route |
| §0.1b Mellin form | `G = 1`; `G = y^(−2)` | `∫_1^∞ y^(−s−1) = 1/s = ℒ[1]`; `∫_1^∞ y^(−s−3) = 1/(s+2) = ℒ[e^(−2u)]` | correct |
| §0.1b Checks 1–3 | `g = 1`; `sin u`; `G = 1` | `1/s` exactly on `Re s > 0`; `1/(1+s²)` analytic at `0`, `HasLaplace` only on `Re s > 0`; `1/s` | all true |
| §4.1a transform | `c 1 = −1`; `c 2 = i`; `c = (−1)^(n+1)`, `Re s > 1` | `−1/s = F/s`; `i2^(−s)/s = F/s`; `s⁻¹∑_{k odd}(k^(−s)−(k+1)^(−s)) = F/s` | all three Checks true |
| §4.1a integrability | general `c`, `σ = Re s > 0` | `∫₀^∞ e^(−σt)∑_{n≤eᵗ}|c n| dt = ∑|c n| n^(−σ)/σ < ∞` | absolute convergence holds |
| §4.1a `Re s > 0` needed | `c 1 = 1`, `s = 0` | series sums to `1`; `α = 1` has no transform at `0` | hypothesis necessary |
| §4.1a vs Mathlib (C01) | `c n = n^(σ₀−1)/log²n`, `s = σ₀` | §4.1a applies; partial sums `≍ n^σ₀/log²n`, not `O(n^r)`, `r < σ₀` | §4.1a strictly more general |
| §4.1a decomposition | `c = c₁ − c₂ + i(c₃ − c₄)` | each `c_j ≤ |c|`; `S_c` additive; §4.1 per part | route sound |
| Overview sentence (C02) | `g = 1_(0,1)`; `g = e^(u²)` | abscissa `−∞` (transform entire); `+∞` | needs "finite" |
| §0.1b in Lean (R01) | probe statement after the file | elaborates; only the `sorry` warning | statable |
| §0.1a headline | `f = e^(−t)`, `s = 0` | `ℒ[f'](0) = −1`; `0·1 − f(0) = −1` | untouched, consistent |
| §3.2 Delange | `α = e^(at)t`, `F = 1/(s−a)²`, `k = 1`, `A = 1` | ratio `α/(e^(at)t) = 1`; `A/k! = 1` | untouched, consistent |
| §4.1 bridge (relied on by §4.1a) | `c 1 = 1` only | `α = 1` on `[0,∞)`, transform `1/s = F/s` | consistent |
| §4.2 | `c ≡ 1`, `F = ζ`, `k = 0`, `A = 1` | `⌊X⌋/X → 1 = A/0!` | consistent |
| §4.3 | `c n = n`, `a = 2`, `A = 1` | `⌊X⌋(⌊X⌋+1)/(2X²) → 1/2 = A/(a·0!)` | consistent |
| §4.4 | divisor sum, `c 1` changed by `5` | extra `5/(X log X) → 0` | consistent |
| §4.5 | `d = τ + 1` (`τ` the divisor function), `b = 1` (`l = 0 < k = 1`) | extra `⌊X⌋/(X log X) → 0`; limit stays `1` | consistent |
| §5.1 | `ζ⁴`, `k = 3` | leading constant `1/3! = 1/6` | consistent |
| §2.2a smoothed | `f ≡ 1`, `A = 1`, continuous `ψ` with compact support | `x⁻¹∑ψ(n/x)` is a Riemann sum `→ ∫₀^∞ ψ` | consistent |

- Source locators checked against the text: Landau 1905 (GDZ scan, recognised by OCR): §2 begins on p. 534 and the Dirichlet-series theorem is on pp. 536–537; §4 begins on p. 544, the Mellin-form theorem is on p. 548 and its proof on pp. 547–548. Delange 1954: p. 213 standing hypotheses and footnote 1 (relied on by §4.1), and Theorem III, §5.2.1, starting p. 235.
- Library declarations opened at the pins: `DifferentiableOn.hasFPowerSeriesOnBall` (`Mathlib/Analysis/Complex/CauchyIntegral.lean:716`), `MeasureTheory.lintegral_tsum` (`Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:362`), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Mathlib/Analysis/Calculus/ParametricIntegral.lean:569`), `summable_norm_iff` (`Mathlib/Analysis/Normed/Module/FiniteDimension.lean:605`), `LSeries_eq_mul_integral` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean:140`), and `TauCeti.summatory` (`TauCeti/Order/Northcott/Basic.lean:103`). The last takes weights in any additive commutative monoid, so the complex sum of §4.1a is defined. Also `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`), which is the Dirichlet-series case only; the Laplace form is in neither library.
- Cross-roadmap citations resolved: Completed/ArithmeticDirichletSeries §8.1 (Landau's theorem for nonnegative Dirichlet series). Consumers in the same pull request: PositivityOfDirichletSeriesWithKernels §6.3 and GeneralizedRiemannHypothesisFromWindowBounds Layer 1 cite §0.1b as the owner and do not plan the theorem again.
- Record: the head keeps all 6 layers of the README at the merge base and every item in them. The 10 deleted lines are each replaced by an extended version of the same sentence. Two sections are added; no id is dropped or reused.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`. There is no line pointing upward and no cycle.
- Elaboration: `lake env lean` of `Suggested.lean` gives only `sorry` warnings. The file is unchanged by this pull request, and the elaborated signatures show no lost binder. The probe file of R01 elaborates with only `sorry` warnings.
- Duplication audit: §0.1b's Laplace form is not in Mathlib or Tau Ceti, and Tau Ceti has only the Dirichlet-series case. §4.1a strengthens Mathlib's `LSeries_eq_mul_integral` (C01).
- Overlap check: read LiCoefficientsArithmeticFormula, SamplingAndDiscreteFourierAnalysis, ZerosOfLFunctions, SpecialFunctionsGamma, AnalyticNumberTheoryPartIII, TauberianBoundaryConvergence and ProbabilisticAndMetricNumberTheoryPartII. SpecialFunctionsGamma's "Landau's theorem" is a different statement, and AnalyticNumberTheoryPartIII has Landau's logarithmic-derivative lemma, not this theorem. ProbabilisticAndMetricNumberTheoryPartII §2.5 (later in the merge order, and a consumer of §0.1) owns the two-sided Laplace–Mellin adapter. §0.1b's one-sided substitution is a remark used to carry Landau's theorem across, not a second owner. Nothing shared.

Source independence: changed passages only; 12 changed passages compared with 4 texts (Landau 1905, Delange 1954, Mathlib `SumCoeff.lean` docstrings, Tau Ceti `Landau.lean` docstring), none shared. §0.1b's proof sketch handles `(0, u₀]` separately, whereas Landau first reduces to the case where the integral starts at the point from which `φ ≥ 0`. It is neither a translation nor a clause-by-clause paraphrase. Largest share delange1954: Delange's name stands at 24 of about 116 page, line, theorem and chapter locators, more than any other source. Arrangement not compared: the change adds sections, not layers.

Research link: Delange's Tauberian theorem for poles of integer order (Delange 1954) underlies counts with higher-order poles, such as Wood's totally real abelian counts (Wood 2019, §7) and the Markoff–Hurwitz counts of Gamburd–Magee–Ronan 2019. §0.1b is Landau's 1905 theorem, used for one-sided bounds on prime sums (Ingham 1932; Montgomery–Vaughan 2007). This rests on the README's statement of purpose and on Landau 1905, which I read.

## Not verifiable

- Montgomery–Vaughan (2007), Lemma 15.1 (§0.1b) and chapter 1 (§4.1a): no legal open copy; the DOI resolves only to the publisher's paywalled page.
- Ingham (1932), chapter V (§0.1b): no legal open copy was found.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder exists so that a pull request changes no roadmap it does not declare. Run without the list of this pull request's own folders, it flags the files of the other roadmap folders that this pull request adds or revises. Those folders belong to this pull request and each has a review of its own, so their edits are not outside it.

## Source issues

- none

## For the human reviewers

- none
