# Review of ArithmeticDirichletSeriesPartII (pull request #3027 at 71bbefa)

**Verdict:** needs changes

**Summary.** This folder has not changed since the previous review (of `4a2d22f`), so its one finding still stands. The overview names Landau's theorem (§0.1b) as a theorem the roadmap proves, next to §0.1a and §2.2a. `Suggested.lean` states those two but not Landau's theorem, and its docstring does not say why, although the theorem can be stated at the pins: a probe statement elaborates against them. The four small corrections and the format note of the previous review are also unrepaired and are repeated below. They do not block. Nothing is left for a human to decide.

## R01 (P2) — Landau's theorem is a headline of the overview but is absent from `Suggested.lean`, although it can be stated at the pins

This is unrepaired from the previous review. The overview (lines 40–45) says that the roadmap "also proves the rule for the transform of a derivative … and Landau's theorem … For complex coefficients … it proves smoothed and interval forms of Wiener–Ikehara". `Suggested.lean` states the first and last items of that sentence (`hasLaplace_deriv_of_primitive`, `hasLaplace_deriv`, `wienerIkehara_smoothed`, `wienerIkehara_interval`). Its module docstring says the file states the headline theorems and that all of them can be stated at the pins (line 8), and it lists §0.1a and §2.2a (lines 14–17). Neither §0.1b nor Landau's name appears anywhere in the file. So the acceptance test does not cover a theorem the overview promises. Two roadmaps of this pull request, PositivityOfDirichletSeriesWithKernels (§6.3, its line 215) and GeneralizedRiemannHypothesisFromWindowBounds (Layer 1, its lines 455 and 497), take this section as the owner of the theorem.

Every carrier the theorem needs exists. `HasLaplace` is declared in the file, and `AnalyticOnNhd`, `Metric.ball` and `Integrable` are in Mathlib. I appended the statement below, unchanged from the previous review, to a copy of the file at this head. It elaborates against the pinned Mathlib and Tau Ceti with only the `sorry` warning, and its elaborated type matches §0.1b (lines 264–268) clause by clause. The smallest repair is to add it to the Layer 0 section, under a name of the author's choosing, and to name §0.1b in the module docstring next to §0.1a:

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

## C01 — §4.1a does not mention Mathlib's `LSeries_eq_mul_integral`, which proves its Mellin identity under a growth hypothesis

Mathlib has `LSeries f s = s * ∫ t in Ioi 1, (∑ k ∈ Icc 1 ⌊t⌋₊, f k) * t ^ (-(s + 1))` (`LSeries_eq_mul_integral` and its primed and `_of_nonneg` variants, `Mathlib/NumberTheory/LSeries/SumCoeff.lean`, lines 140, 155 and 164). It assumes partial sums `O(n^r)` with `0 ≤ r < Re s` and asserts no integrability. Neither §4.1a (lines 989–1031) nor the Mathlib supplier contracts mention it. §4.1a is strictly more general. Take `c n = n^(−1/2)/log² n` at `s = 1/2`: the series converges absolutely, since `∑ 1/(n log² n) < ∞`, but the partial sums are about `2√N/log² N`, which is not `O(N^r)` for any `r < 1/2`. A clause in §4.1a and a bullet under *From Mathlib* would say this, and would let an implementer use the lemma where its growth hypothesis holds.

## C02 — The overview's statement of Landau's theorem needs the abscissa to be finite

At lines 41–42 the overview says the Laplace integral of a function that is nonnegative for large argument "is singular at the real point of its abscissa of convergence". For `g(u) = e^(−u²)` the transform is entire and the abscissa is `−∞`. For `g(u) = e^(u²)` the abscissa is `+∞`. In neither case is there a real point. §0.1b (line 269) correctly says "when the abscissa … is finite". Adding "when that abscissa is finite" to the overview makes the two agree.

## C03 — §4.1a lists Landau's theorem as a prerequisite, but it uses only the change of variables `y = eᵗ`

The *Needs:* line of §4.1a (line 1016) and line 88 of the build diagram make §4.1a depend on §0.1b. The proof sketch takes from §0.1b only the substitution `∫_1^∞ G(y) y^(−s−1) dy = ∫₀^∞ G(e^u) e^(−su) du`, which does not use Landau's theorem. Mathlib states that substitution as `MeasureTheory.integral_comp_exp_Ioi` and `MeasureTheory.integrableOn_comp_exp_Ioi` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`, lines 1157 and 1164). Naming either the substitution or these declarations in the *Needs:* line would spare an implementer of §4.1a from waiting for Landau's theorem.

## C04 — Two citations give only a chapter

§4.1a cites only "Montgomery and Vaughan (2007), chapter 1" (line 1018), and §0.1b cites "Ingham (1932), chapter V" (line 294; reference at line 1576). A reader cannot find the statement relied on. A theorem or page number, as given for Lemma 15.1 in the same sentence, would fix this.

## N01 — §0.1b could name the Tau Ceti declaration of the Dirichlet-series case

Line 271 refers to Completed/ArithmeticDirichletSeries §8.1 for the Dirichlet-series case. Tau Ceti proves it as `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean`, line 296), which could be named there.

## Questions for the author

- §4.1a's *Source* paragraph says that the form at a single point of absolute convergence is derived from §4.1, not taken from Montgomery–Vaughan's chapter 1. Does that chapter state the identity on `Re s > max(0, σ_c)` under ordinary convergence? If so, §4.1a is narrower than its source, and the description's "stated in the generality of its source" does not cover it; a clause saying so would help. What stopped me: the book has no legal open copy (the DOI resolves only to the publisher's paywalled page).

## Previous findings

- R01 — not repaired: `Suggested.lean`, lines 8 and 14–17: "All headline theorems below are statable at these pins. … Layer 0 also states the rule for the transform of a derivative (README §0.1a), and Layer 2 the smoothed and interval forms …"; there is no §0.1b statement.
- C01 — not repaired: §4.1a and *From Mathlib* still do not mention `LSeries_eq_mul_integral`.
- C02 — not repaired: overview line 42: "argument is singular at the real point of its abscissa of convergence, with its Mellin form."
- C03 — not repaired: line 1016: "*Needs:* §§0.1, 0.1b, 4.1; Mathlib `LSeriesHasSum`, `summable_norm_iff`; Tau Ceti `TauCeti.summatory`."
- C04 — not repaired: line 1018: "Montgomery and Vaughan (2007), chapter 1"; line 294: "Ingham (1932), chapter V".
- N01 — not repaired: line 271: "For a Dirichlet series with nonnegative coefficients this is Completed/ArithmeticDirichletSeries §8.1."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §0.1b Landau (R01), hypotheses ⇒ conclusion | `g = e^(2u)`, `A = 3`, `H = 1/(s−2)`, `r = 1` | `A′ = 2.5`: `∫₀^∞ e^(−0.5t) dt = 2`; `G = 1/(s−2)` on `Re s > 2.5`, equals `F` on `Re s > 3` | holds |
| §0.1b, `g` negative before `u₀` | `g = 1 − 2·1_(0,1)`, `u₀ = 1` | `F = (2e^(−s) − 1)/s`; at `A = 0` numerator → `1`, a pole, hypothesis fails; at `A = 1`, `r = 1/2`, `A′ = 1/2`: `∫ e^(−t/2)|g| = 2` | consistent |
| §0.1b `u₀ ≥ 0` versus the probe's free `u₀` | `u₀ = −1` | a.e. on `Ioi (−1)` implies a.e. on `Ioi 0`, i.e. the case `u₀ = 0` | same generality |
| §0.1b in Lean (R01) | probe appended to a copy of the file | 20 `sorry` warnings (19 in the file, 1 in the probe), nothing else; `#check` type matches lines 264–268 | statable |
| `Suggested.lean` docstring (R01) | search for §0.1b and Landau | 0 occurrences; §0.1a and §2.2a named at lines 14–17 | headline missing |
| Overview sentence (C02) | `g = e^(−u²)`; `g = e^(u²)` | abscissa `−∞`, transform entire; abscissa `+∞` | needs "finite" |
| §4.1a against Mathlib (C01) | `c n = n^(−1/2)/log² n`, `s = 1/2` | `∑|c n|n^(−1/2) = ∑ 1/(n log² n) < ∞`; partial sums `≍ 2√N/log² N`, not `O(N^r)`, `r < 1/2` | §4.1a strictly more general |
| §4.1a transform | `c 3 = 2` only, `Re s > 0` | `F = 2·3^(−s)`; `α = 2` on `[log 3, ∞)`: `2·3^(−s)/s`; Mellin `∫₃^∞ 2y^(−s−1) dy = 2·3^(−s)/s` | holds |
| §4.1a dependency (C03) | `integral_comp_exp_Ioi` with `a = 0` | `∫_{Ioi 0} eˣ G(eˣ) = ∫_{Ioi 1} G(y)`; with `G(y)y^(−s−1)` the integrand becomes `G(e^u)e^(−su)` | needs only the substitution |

The rows of the previous review for untouched statements (§0.1a, §0.1b proof sketch, §§2.2a, 3.2, 4.1–4.5, 5.1) stand as in that review, of `4a2d22f`.

- The folder is unchanged since `4a2d22f`: no line differs in `README.md` or `Suggested.lean`. Against `main` it has 119 insertions and 10 deletions, and the head keeps all 6 layers of the merge base, every item and every id.
- Library declarations opened at the pins: `LSeries_eq_mul_integral` (`Mathlib/NumberTheory/LSeries/SumCoeff.lean:140`, also 155 and 164), `MeasureTheory.integral_comp_exp_Ioi` and `integrableOn_comp_exp_Ioi` (`Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1157`, 1164), and `TauCeti.LSeries.landau` (`TauCeti/NumberTheory/LSeries/Landau.lean:296`). The pins are the same as at `4a2d22f`.
- Cross-roadmap citations resolved: Completed/ArithmeticDirichletSeries §8.1 (on main, line 322). Its consumers at this head are PositivityOfDirichletSeriesWithKernels (§§6.3, 6.4, 6.9) and GeneralizedRiemannHypothesisFromWindowBounds (Layer 1), which cite §§0.1b and 4.1a.
- Elaboration: `lake env lean` of `Suggested.lean` gives 19 `sorry` warnings and nothing else. The probe of R01 adds one more `sorry` warning.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`, with no upward line and no cycle.
- Gate rerun: every check passes except the edits-outside-folder check (set aside below). Excluding this pull request's own folders, `git diff origin/main...HEAD` lists no file.
- Overlap check: read LiCoefficientsArithmeticFormula, SamplingAndDiscreteFourierAnalysis, ZerosOfLFunctions, SpecialFunctionsGamma, AnalyticNumberTheoryPartIII, TauberianBoundaryConvergence and ProbabilisticAndMetricNumberTheoryPartII. Their changes since `4a2d22f` add no owner of the Laplace form of Landau's theorem or of §4.1a. Nothing is shared.

Source independence: changed passages only. The folder is unchanged since `4a2d22f`, so no passage was compared again. The previous comparison stands: 12 passages compared with 4 texts, none shared; largest share delange1954, 24 of about 116 locators. The arrangement was not compared, since no layer was added, removed or reordered.

Research link: Delange's Tauberian theorem for poles of integer order (Delange 1954) underlies counts with higher-order poles, such as Wood's totally real abelian counts (Wood 2019, §7) and the Markoff–Hurwitz counts of Gamburd–Magee–Ronan 2019. §0.1b is Landau's 1905 theorem, used for one-sided bounds on prime sums (Ingham 1932; Montgomery–Vaughan 2007). This rests on the README's statement of purpose and on Landau 1905 as read in the previous review.

## Not verifiable

- Montgomery–Vaughan (2007), Lemma 15.1 (§0.1b) and chapter 1 (§4.1a): no legal open copy; the DOI resolves only to the publisher's paywalled page.
- Ingham (1932), chapter V (§0.1b): no legal open copy was found.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder flagged 115 files when run without the list of this pull request's own folders. Every one of them lies in a folder this pull request adds or revises, each with its own review, so none is an edit outside the pull request.

## Source issues

- none

## For the human reviewers

- none
