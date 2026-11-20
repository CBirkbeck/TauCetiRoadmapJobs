# Review of StiefelPolarRetraction (pull request #2815 at 6e228cc)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the scope section says the quintic Newton–Schulz step "converges only on `(0, 1]`", which is false (it converges on all of `(0, √(7/3))`), and the reason given for excluding it is therefore not the right one. Every stated target of Layers 1–5 was recomputed by hand and numerically and holds, with its constants, and `Suggested.lean` elaborates with `sorry` as its only warning. There are one small correction and two format notes, none blocking. R.-C. Li's report could not be read from a legal place, so its locators are unverified; that and its hosting are left to the human reviewers.

## R01 (P2) — The quintic Newton–Schulz map converges on `(0, √(7/3))`, not "only on `(0, 1]`", so the stated reason for leaving it out is false.

In the paragraph "Outside the scope" of `TauCetiRoadmap/StiefelPolarRetraction/README.md` (lines 576–578): "the quintic Newton–Schulz step, which converges only on `(0, 1]` (SpectralSteepestDescent 4.2) while the singular values of `X + Z` are at least `1`, so that it needs a normalization". A reader concludes that the quintic cannot be applied at `X + Z` at all, and that SpectralSteepestDescent 4.2 says so; neither is true.

With `q(t) = (15t − 10t³ + 3t⁵)/8` one has `q(t) − t = t (3t² − 7)(t² − 1)/8` and `1 − q(t) = (1 − t)³ (3t² + 9t + 8)/8`. So for `1 < t < √(7/3) ≈ 1.5275`, `1 < q(t) < t`, and the orbit decreases to the only fixed point in `[1, t)`, which is `1`. Numerically the orbit of `1.5` is `1.441406, 1.292472, 1.077067, 1.001211, 1.000000, …`. SpectralSteepestDescent 4.2 states convergence for `s ∈ (0, 1]` and makes no claim that it fails elsewhere. Hence for `‖Z‖_op < √(4/3)` the quintic iterates of `X + Z` do converge to `R` without normalization.

What does separate the quintic from the cubic here is the side from which it converges: `q(t) > 1` for `t > 1`, so every quintic iterate of `X + Z` with `Z ≠ 0` has operator norm above `1` and lies outside `B`, where nothing is assumed of `f`; the cubic maps `[1, √3)` into `(0, 1]` (4.1). The smallest repair is to replace the clause, for instance by: "the quintic Newton–Schulz step, which SpectralSteepestDescent 4.2 treats on `(0, 1]`; at `X + Z` it maps singular values above `1` to values above `1`, so its iterates leave `B`".

## C01 — "2.9 in its sectioned numbering" names a numbering that SpectralSubspacePerturbation does not have on main.

In the scope section (lines 556–557) and in the supplier contract for SpectralSubspacePerturbation (line 654) the Sylvester bound is cited as "SSP-B09, which is 2.9 in its sectioned numbering". On main that roadmap's README has only the id `SSP-B09` (the interval/exterior Sylvester bound, in Part B); the number 2.9 appears only in the open revision of that roadmap, in a table row "2.9–2.10 (`B09`–`B10`)". A reader of main who looks for 2.9 finds nothing. The citation by `SSP-B09` is valid in both states, so either drop the parenthesis, or keep it and name that revision in the pull request's description next to the two suppliers it already lists.

## N01 — In the scope section, "gradient descent with `η K ≤ 1`" (line 555) uses FirstOrderOptimization's `K` for the smoothness constant, while everywhere else in this README `K` is the number of iterates; "with `η` times the smoothness constant at most `1`" would avoid the clash.

## N02 — In "From Mathlib", `Matrix.IsHermitian.eigenvalues` is listed on the line of `Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean` (line 598); it is declared in `Mathlib/Analysis/Matrix/Spectrum.lean`.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `(X+Z)ᵀ(X+Z) = 1 + ZᵀZ`, polar factor | expansion; `X=e₁`, `Z=−X` (non-tangent); Boumal2023 lines 7781, 7803 | cross terms cancel by tangency; non-tangent: `0` vs `2`; source has both formulas | holds | none |
| 1.2 `norm_polar_sub_le` | 400 random `n ≤ 5`, `p ≤ n`, scales 0.01–5; `s = 1, 0.1, 0.01` | identity error `1.3e−13`; max ratio `1.00000`; `0.5858`, `0.99627`, `0.99996` | holds | none |
| 1.3 `norm_polar_sub_sub_le` | same sample; `s = 1, 0.1, 0.01`; `p = 0` | max ratios `1.00000` (Frobenius), `1.00000` (operator); `0.4142`, `0.99751`, `0.99998`; `p=0`: `0 ≤ 0` | holds | none |
| 2.1 `map_polarFactor_sub_le_of_finrank_eq` | 3000 random real and complex pairs, Frobenius, operator, nuclear norms; rotation by 0.6; `finrank = 0` | max lhs/rhs `1.00000`; `0.83586`, `0.59104` both sides; rank 0: `0 ≤ 0·0` | holds, attained | none |
| 2.2 `map_polarFactor_sub_le_of_finrank_lt` | same sample, `m > n`; `(1,0)ᵀ`, `(1,1)ᵀ` | max lhs/rhs `0.65703`; square constant alone fails, ratio `1.02785`; `0.7654 ≤ 1.5355` | holds; extra term needed | none |
| 2.3 `frobenius_polarFactor_sub_le` | same sample | max lhs/rhs `0.88632`; constant `1.0892` in the example | holds | none |
| 2.4 one-sided form | Weyl bound substituted in 2.1; `A=1`, `Ã=−1` | `σ̃ₙ ≥ σₙ − ‖A−Ã‖` gives denominator `2σₙ − ‖A−Ã‖ > 0`; control: `2 = 2σₙ`, denominator `0` | holds | none |
| 2.5 Stiefel instance | `σₙ, σ̃ₙ ≥ 1` in 2.1–2.3; `t = 0.5, 1, 3` | constants `1`, `2`, `√2`; `0.6498, 1.0824, 1.6538` against `0.7071, 1.4142, 4.2426` | holds | none |
| Layer 2 route (Sylvester) | derivation of `C`; Tau Ceti gap hypothesis | `Σ₁X + XΣ̃₁ = U₁ᴴ(A−Ã)Ṽ − Vᴴ(A−Ã)ᴴŨ₁`; spectra in `[σₙ, σ₁]` and `≤ −σ̃ₙ`, gap `σₙ+σ̃ₙ` | matches the library statement | none |
| 3.1 `polar_pullback_le` | route recomputed; `L<0`; `n=0` or `p=0`; `f=−⟪e₁,·⟫`, `s=0.1`; 60 random quadratic costs | `L<0` forces `B` a point; excess `0.004963` vs `0.005`; no violation in 60 runs | holds | none |
| 3.2 `sum_sq_norm_rgrad_le` | README example; 60 random costs, `η=1/(L+G)`, 60 steps | `f(X₁)=−0.7071`, `‖grad₁‖²=0.5`, `f(X₂)=−0.9856`, sum `1.5 ≤ 2`; all runs satisfy descent and sum | holds | none |
| 4.1 Newton–Schulz at `X+Z` | `g(1)=1`, `g(√3)=0`; `e₁` identity at `t=2`; `X=e₁`, `Z=e₂` | `e₁(2)=2` both sides; `0.2929 ≤ 0.4665`; `e₂=0.1161`; limit ratio `0.8038` | holds | none |
| 4.2 `ns_pullback_le` | chain `Σe₁² ≤ c²Σs⁸ ≤ c²‖Z‖_op⁴‖Z‖_F⁴`; `m=0` | needs `G ≥ 0`, true since `0 ∈ B`; `m=0`: norm `√(1+‖Z‖²) > 1` | holds | none |
| 5.1 `ns_defect_le` | identity expanded; 3000 random `Y`, `W` at the hypotheses' limits; `Y=√10 e₁`; README example | `1−(ΨA)ᵀΨA = E²(3+E)/4`; max lhs/rhs `0.99502`, max norm `1.000000`; `121.5` vs `81`; `107/186624 ≤ 144/186624` | holds | none |
| 5.2 `ns_iterates_feasible` | induction recomputed; 60 runs × 200 steps at `3η(L+G)=1`; `η=3` | `q² ≤ 4ζ⁴` iff `ζ² ≤ 1/4`; max defect / bound `0.0094`; `η=3`: `ΨA = −A/8` | holds | none |
| 5.3 `sum_sq_norm_skew_le` | constants recomputed; 60 runs | `L+2c₀ ≤ (73/64)L + (9/8)G`; `q/(1−q) ≤ 2/7`; all runs: sum `≤ 2(f(Y₀)−f(Y_K))/η` | holds | none |
| 5.4 `sq_norm_skew_mul_transpose_le` | 500 random; `X=e₁,G₀=e₂`; `n=p=2` | ratio range `[0.50000, 1.00000]`; `1/2` vs `1`; `1/2` both | holds, both ends attained | none |
| Scope, quintic sentence (R01) | orbit of `1.5`; factorisation of `q(t)−t` | `1.441406, 1.292472, 1.077067, 1.001211, 1.0`; `q(1.2)=1.02312 > 1` | false as written | R01 |

- Source locators checked against the text: Boumal2023 5 of 5 (lines 3079, 3110, 7781, 7803, 7856); BoumalAbsilCartis2019 4 of 4 (lines 276, 305, 344, 1202–1218); SuHuang2026 8 of 8 (lines 209, 240–256, 280, 286–295, 340, 491–507, 719, 1777); Li1994 0 of 8.
- Library declarations opened at the pins: `LinearMap.polarFactor` (`Polar/Finite.lean:55`), `LinearMap.polarIsometry` (`Polar/Isometry.lean:96`), `Units.polarUnitary` (`ContinuousFunctionalCalculus/Polar.lean:131`), `UnitarilyInvariantSeminorm` (`Basic.lean:271`), `frobenius` (`Frobenius.lean:109`), the Sylvester bound (`Sylvester/Basic.lean:265`), `End.PointIntervalExteriorGap` (`PointSpectrum.lean:679`), `abs_singularValues_sub_singularValues_le` (`EckartYoung.lean:106`), `LinearMap.singularValues` (`SingularValues.lean:95`), `Matrix.l2_opNorm_def` (`CStarAlgebra/Matrix.lean:196`), `Matrix.toEuclideanLin` (`PiL2.lean:1219`), `Convex.norm_image_sub_le_of_norm_fderiv_le` (`MeanValue.lean:500`), `Matrix.IsHermitian.eigenvalues` (`Matrix/Spectrum.lean:67`), `instContinuousFunctionalCalculus` (`HermitianFunctionalCalculus.lean:98`).
- Cross-roadmap citations resolved: SpectralSteepestDescent 1.3, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 5.1, 6.1 at its open head; ManifoldOptimization O0.3, O2.2, O2.4, O4.1 at its open head; FirstOrderOptimization 2.1; PolarDecomposition PD-B11–B16, PD-B40–B43 and SpectralSubspacePerturbation SSP-B09 on main. The three copied definitions agree character for character with SpectralSteepestDescent's.
- Duplication by object: no perturbation bound for the polar factor and no Newton–Schulz statement in the pinned Tau Ceti or Mathlib; in the roadmaps only SpectralSteepestDescent and ManifoldOptimization touch the objects, both cited.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 12 `sorry` warnings, nothing else. The 20 elaborated signatures were compared with the README statements; nothing differs.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `constructor <;> simp`): 0 of 12 theorems close.
- Overlap check: read SpectralSteepestDescent, ManifoldOptimization, FirstOrderOptimization, Majorization, SpectralSubspacePerturbation, PolarDecomposition; nothing shared (the polar factor, odd steps and descent lemma are SpectralSteepestDescent's, the Stiefel manifold and the rate given a pullback constant ManifoldOptimization's, and this roadmap cites both).

Source independence: 8 passages compared with 3 sources (Boumal2023, BoumalAbsilCartis2019, SuHuang2026), none shared; largest share Li1994, 8 of 22 locators, whose text and contents could not be read; contents compared with Boumal2023: independent.

Research link: Layer 3 makes explicit the pullback constant of Boumal–Absil–Cartis (2019), Lemma 4, for the polar retraction; Layer 2 states R.-C. Li's bounds (1994/1995); Layer 5 analyses the iteration of Su–Huang (2026) with a fixed step. Rests on the README's scope section and on BoumalAbsilCartis2019 and SuHuang2026 as read.

## Not verifiable

- Li1994 (R.-C. Li, UCB/CSD-94-852; SIAM J. Matrix Anal. Appl. 16 (1995)): Lemma 1, (12)–(20), Theorems 1–3, Remarks 1–2, pp. 3–6, cited in 2.1–2.4. The report's host is in no licence class of the sources service and the journal version is behind a paywall. The four statements were checked by recomputing the route and numerically; that the constants and equation numbers are Li's was not.

## Source issues

- **Error** in SuHuang2026 at §7, (70), p. 33: the source says the defect after one Newton–Schulz step is strictly below the squared defect whenever the defect is below 1; it should be non-strict, or exclude the case of orthonormal columns, where both sides are 0; affects nothing.

## For the human reviewers

- Licence: Li's report UCB/CSD-94-852 is cited from the Berkeley EECS technical-report pages, a host the sources service places in no licence class; its text was not read (README, References).
- Not tested: Li1994 has the largest share of the locators (8 of 22); wording and arrangement were not compared with it. Sections 2.1–2.4 cite its Theorems 1, 2, 3 and Remark 2 in that order.
- Scope: the main source of Layer 5, Su–Huang arXiv:2608.22774v1 (August 2026), is an unrefereed preprint; the README says of 3.1, 4.2 and 5.3 that no source states them.
