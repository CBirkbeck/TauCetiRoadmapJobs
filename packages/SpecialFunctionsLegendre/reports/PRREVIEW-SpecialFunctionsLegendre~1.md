# Review of SpecialFunctionsLegendre (pull request #2121 at 9585279)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/SpecialFunctionsLegendre/README.md` and `TauCetiRoadmap/SpecialFunctionsLegendre/Suggested.lean`. DLMF citations were checked against Release 1.2.8 (2026-09-15), the release the README names. Every number below was computed independently, in double precision, from the definitions in `Suggested.lean`: complex Γ, the regularized ₂F₁ with its 1−z and 1/z connection formulas, tanh–sinh quadrature, and RK4 continuation of the Legendre equation. No identity was taken from DLMF for this.

## R01 (P1) — 14.7.21 is false for h < −1 with the printed right side

- **Location:** README 4.3, lines 532–536: "14.7.19–14.7.22 with the conditions printed (… `|h| > 1` in 14.7.21; … `|h| > x + (x² − 1)^{1/2}` in 14.7.21), and their complex forms … as `HasSum`". Conventions line 183 makes every power principal.
- **Claim:** `∑ₙ 𝖯ₙ(x) h^{−n−1} = (1 − 2xh + h²)^{−1/2}` for `|h| > 1`.
- **Witness:** at `x = 0`, `h = −2` the sum is `−0.4472135955 = −1/√5`, but the printed right side is `+1/√5`. At `x = 0.3`, `h = −2.5` the sum is `−0.338061701891` and the printed side is `+0.338061701891`. Expanding gives the left side as `h⁻¹(1 − 2x/h + h⁻²)^{−1/2}`, which has the sign of `h` for real `h`.
- **Repair:** state 14.7.21, its `x > 1` form and its complex form of §14.21(iii) with right side `h⁻¹ (1 − 2x h⁻¹ + h⁻²)^{−1/2}` (principal power). This equals the printed side for `h > 1`. Add the Check `(x, h) = (0, −2)`: the value is `−1/√5`. The corrected form agrees with the sum at `(0, −2)`, `(0.3, −2.5)`, `(0.3, 2.5)` and `(0.3, 1.5 + 1.2i)`. The Lean target `hasSum_ferrersP_nat_mul_pow` (14.7.19) is not affected.

## R02 (P2) — 14.18.8 is claimed at x = 1, where the series diverges

- **Location:** README 8.3, line 810: "the zonal harmonic series 14.18.8 for `ν ∉ ℤ` and `x ∈ (−1, 1]`".
- **Witness:** at `x = 1` the left side `𝖯_ν(−1)` has a logarithmic singularity, and every `𝖯ₙ(1) = 1`. The series `(sin νπ/π) ∑ (2n+1)/((ν−n)(ν+n+1))` therefore diverges. At `ν = 0.3` the partial sums are `−1.876` (N = 10²), `−3.058` (10³), `−4.243` (10⁴) and `−5.429` (10⁵).
- **Repair:** "for `ν ∉ ℤ` and `−1 < x < 1`, as `HasSum`". Optionally add "and at `x = −1` as the limit of the partial sums", which is Dougall's case `x = 1`, `μ = 0`. The closed endpoint is `x = −1`, not `x = 1`. Inside the interval the terms are `O(n^{−3/2})`, so absolute convergence holds.

## R03 (P2) — the Legendre function of the second kind on (1, ∞) has a second owner, earlier in the order

- **Location:** README Scope and ownership (lines 54–137) and 7.2 never mention AutomorphicSpectralTheory.
- **Witness:** AutomorphicSpectralTheory §0.35, at its open head, is earlier in the merge order (line 96, against line 402 here). It says "Define `legendre_q` … `Q_{s−1}(t)=∫₀∞(t+√(t²−1)cosh u)^(−s)du`" for `t > 1`, `Re s > 0`, with its ₂F₁ form, its equation and the integer case. §0.36 and §0.38 give its asymptotics as `t ↘ 1` and `t → ∞`. These are this roadmap's `associatedLegendreQ (s−1) 0` and 14.8.9 and 14.8.15 at `μ = 0`. Both definitions give `Q₀(3) = ½ ln 2 = 0.34657359028`.
- **Repair:** add a Scope clause along these lines: "AutomorphicSpectralTheory §0.35–§0.38 defines `Q_{s−1}(t)` for `t > 1`, `Re s > 0` by Heine's integral; `associatedLegendreQ ν μ` is its continuation to all `ν, μ` and to `U`." Add to 7.2 the comparison target `associatedLegendreQ (s − 1) 0 t = Q_{s−1}(t)` of AutomorphicSpectralTheory §0.35 for `t > 1`, `Re s > 0`. This is 14.12.6 at `μ = 0`, already a target here.

## R04 (P2) — the L² completeness in 11.3 restates RiemannianGeometry R8.2 at m = 2

- **Location:** README 11.3, lines 999–1005 (`sphericalHarmonic_hilbertBasis`, proved by Stone–Weierstrass); the auxiliary table, line 114; Scope, lines 122–125: "it neither consumes nor restates RiemannianGeometry R8.2".
- **Witness:** RiemannianGeometry README on main, R8.2 (line 1452): "Establish orthogonality, completeness and the comparison of the polynomial and Hilbert spectral bases" on every `Sᵐ`. At `m = 2`, with 11.3's basis `p_{l,m}` of each `H_l`, this is the completeness of the `Y_{l,m}`. QuantumFoundations 9.3 and PositiveMass 1.2 both cite R8 for exactly this completeness.
- **Repair:** add "From RiemannianGeometry: R8.2 (case m = 2)" to Exact supplier contracts and to the Layer 11 *Needs:* line. Cut the completeness bullet down to two inputs: the basis `p_{l,m}` of each restricted `H_l` (first bullet of 11.3) together with R8.2, and the change of variables to `(θ, φ)` with weight `sin θ`. Delete the Stone–Weierstrass row of the auxiliary table and its sketch. Keep the headline `sphericalHarmonic_hilbertBasis` as it is.

## R05 (P2) — the conical pair statement drops DLMF's standing assumption μ ≥ 0

- **Location:** README 10.2, lines 907–909: "for `−1 < x < 1` and `τ > 0`, `𝖯^{−μ}_{−½+iτ}(x)` and `𝖯^{−μ}_{−½+iτ}(−x)` are real, independent and form a numerically satisfactory pair in the sense of 5.1". The order `μ` is unrestricted there, and line 910 allows "real `μ, τ`".
- **Witness:** DLMF §14.20 assumes `μ ≥ 0` throughout (cached text lines 91–92). At `μ = −½`, `τ = 1`, the ratio `𝖯^{1/2}_{−½+i}(cos θ)/𝖯^{1/2}_{−½+i}(−cos θ) = cosh θ / cosh(π − θ)` (14.5.11) tends to `1/cosh π = 0.08627`, not to 0. Numerically it is `0.086275` at `θ = 10⁻⁴`. So in the sense of 5.1 neither function is recessive. At `μ = +½` the same ratio is `8.7·10⁻⁶`.
- **Repair:** add "`μ ≥ 0`" to the pair statement. Also write the exception of 14.20.3 (line 918, "except at `μ ∈ {½, 3/2, …}`, `τ = 0`") as "except at `τ = 0`, `μ ∈ ½ + ℤ`". That is what the Lean hypothesis `τ ≠ 0 ∨ Real.cos (μ * π) ≠ 0` of `conicalQHat_eq` encodes. The identities themselves hold for negative `μ` and `τ` (table below).

## R06 (P2) — headlines that can be stated at the pins are missing from `Suggested.lean`

- **Location:** `Suggested.lean` lines 368–374 states only `ferrersP_zero_count`, which is the case `μ ≤ 0`. That is DLMF's case (a), which the roadmap does not change.
- **Claim:** the README (lines 857–875) and the description put the corrected zero counts of §14.16 forward as the roadmap's own results.
- **Witness:** the case DLMF leaves out, `n = m` with `δ_ν ≤ δ_μ`, can be stated with the same carriers as `ferrersP_zero_count`. Each of `(¼, ¾)`, `(0.3, 0.3)`, `(1.6, 1.6)`, `(1.2, 1.7)` and `(2.2, 2.9)` has exactly one zero, with `N₀ = 0`. Layer 6.1 (14.11.1, 14.11.4) has no statement in the file either; its Layer 6 section header reads "continued fractions" only.
- **Repair:** add the `N₀ + 1` theorem. Its hypotheses are `ν, μ ∉ ℤ`, `0 < μ`, `⌊μ⌋ ≤ ⌊ν⌋` and `Int.fract ν ≤ Int.fract μ`, and its conclusion is that the zero set in `Ioo (-1) 1` is finite with `ncard = (⌈ν − μ⌉).toNat + 1`. Add 14.11.4 for `ν ∉ ℤ`: `deriv (fun μ => ferrersP ν μ x) 0 = (digamma (−ν) − π cot(νπ)) ferrersP ν 0 x + ferrersQ ν 0 x` on `(−1, 1)`.

## R07 (P3) — the push gate fails: `tex`, 23 hits

- **Location:** README lines 306–319, 382–383, 418–419 and 1011–1012.
- **Witness:** the gate reports `tex=23 … FAIL`, the only failing check (rerun on this head). Inline code spans that wrap across a line break expose `^{…}`, `_{…}` and `∑_{m=−1}^{1}` to the per-line scanner.
- **Repair:** keep each inline code span on one line, starting the span on a new line where needed, or move the long formulas into indented code blocks. Then rerun the gate.

## R08 (P3) — the Sturm targets of 9.1 have no locator and no exact statements

- **Location:** README 9.1, lines 844–849: "Sturm's comparison theorem; and, for a family of solutions depending continuously on a real parameter with a fixed endpoint behaviour, the number of zeros … changes only when a zero enters or leaves through an endpoint."
- **Witness:** 9.1 has no source. The comparison theorem's hypotheses (which `q₁ ≤ q₂`, which zeros) are not given, and "fixed endpoint behaviour" is not defined. The Abelian estimate of 7.3 (auxiliary table, line 113) has no locator either.
- **Repair:** state the comparison theorem with its hypotheses (`q₁ ≤ q₂` on `I`; between two consecutive zeros of a nontrivial solution for `q₁` lies a zero of every solution for `q₂`). Define the endpoint condition, for example the leading term at `x → 1−` fixed by 14.8.1. Cite a locator for each, for example Hobson (1931, pp. 386–388), which DLMF names for §14.16(ii). Give the Abelian estimate a textbook locator.

## R09 (P3) — 14.2.4: the README says (−1, 1), the Lean says D

- **Location:** README 5.1, line 577: "14.2.3–14.2.11 on `(−1, 1)`, respectively `(1, ∞)`, … (`wronskian_ferrersP_ferrersQ`)". The Lean statement (lines 252–257) quantifies over `z` with `1 − z, 1 + z ∈ slitPlane`.
- **Witness:** the Lean statement is the stronger one, and it is true. At `(ν, μ, z) = (0.7 − 0.2i, 0.35 + 0.4i, 0.4 + 0.3i)` both sides are `1.35903689 + 0.08009636i`.
- **Repair:** "14.2.3–14.2.6 on `D` (on `(−1, 1)` by restriction), 14.2.7–14.2.11 on `(1, ∞)` and on `U`".

## R10 (P3) — form of `Suggested.lean`

- **(a)** `wronskian_mul_one_sub_sq_eq_const` (lines 162–171) is about arbitrary `f, g : ℂ → ℂ` and names none of the roadmap's objects. The README files it as an auxiliary result (table, line 109). **Repair:** delete it from `Suggested.lean`; the README keeps it in 1.3.
- **(b)** Five Lean names never appear in the README: `eulerIntegral`, `IsEulerContinuation`, `legP`, `cfIndex` and `sphereMeasure`. **Repair:** name them in Conventions or Exact supplier contracts, one clause each:
  - `eulerIntegral` and `IsEulerContinuation`: the supplier's `𝐅`, copied locally;
  - `legP`: `Pₙ(z)`;
  - `cfIndex`: the index of the convergent read from a terminating fraction;
  - `sphereMeasure`: `sin θ dθ dφ` on `(0, π) × (0, 2π)`.

## R11 (P3) — inputs already at the Tau Ceti pin are not cited, and a *Needs* line is incomplete

- **Dougall's expansion (8.3, lines 814–823):** the proof integrates the meromorphic `F(ν)/(ν − ν₀)` around the circles `C_N`, but the contracts offer only "the residue theorem for rational functions" (line 266). Tau Ceti has `TauCeti.Contour.classicalResidueTheorem_circle` (`TauCeti/Analysis/Contour/Residue/Theorem.lean:349`).
- **Laplace's equation for `ρ^l Y_{l,m}` (11.3, line 997):** this is Tau Ceti's `MvPolynomial.laplacian_eval_euclidean` and `MvPolynomial.harmonicOnNhd_eval_euclidean_iff` (`TauCeti/Analysis/MvPolynomial/Laplacian.lean:43, 58`).
- **10.3 *Needs:* line (line 957):** it lists "Layers 1–5, 8.2", but 14.20.9 comes from 14.12.1 (7.1) and 14.19.4–14.19.5 are integral representations of the same kind. The Dependencies line (961) already says "Layers 1–5, 7–8".
- **Repair:** add the three Tau Ceti declarations to "From Tau Ceti" and to the *Needs:* lines of 8.3 and 11.3, and add Layer 7 to the *Needs:* line of 10.3.

## R12 (P3) — README shape: Examples sections and Checks

- **Witness:** Layers 2, 3, 5, 6, 7, 8, 9, 10 and 11 end without `### Examples`. `ferrersW₁` and `ferrersW₂` are definitions (Conventions, 1.1) but have one Check between them (3.4, `w₂(1, 0, x) = x`).
- **Repair:** add `### Examples` to each of those layers. Give `ferrersW₁` and `ferrersW₂` three Checks each, for example:
  - the value at `z = 0` (and the derivative at `0` for `w₂`) from 14.3.13–14.3.14;
  - the parities `w₁(−z) = w₁(z)` and `w₂(−z) = −w₂(z)`;
  - the junk value `0` at `ν + μ = −1`, against `𝖯_{−1}(0) = 1`.

## R13 (P3) — locators and references

- **(a)** README 1.2, line 326, cites "the last paragraph of §14.24" for holomorphy in the parameters. That is the penultimate paragraph (DLMF §14.24 cached text lines 188–190); the last paragraph is about `z → −1` from the left.
- **(b)** References, lines 1114–1115, title Volkmer (2021) "Convergence of the Fourier series of Legendre functions". DLMF's bibliography lists H. Volkmer (2021), "Fourier series representation of Ferrers function 𝖯".
- **Repair:** correct both.

## R14 (P3) — the description overstates the §14.27 correction

- **Location:** the description says: "The roadmap states corrected forms of the DLMF statements recorded in the errata note: … the left-cut zero rule of §14.27."
- **What the head shows:** §14.27 is under Beyond (README lines 1057–1059). The README only records that rule (a) fails at `ν = 1`, `μ = −½` and states no corrected rule. The failure itself is confirmed: `P^{−1/2}_1(x) = ((x−1)/(x+1))^{1/4}(1 + 2x)/(3Γ(3/2))` has no zero on `(−∞, −1)`.
- **Repair:** reword the description to "records an error in the left-cut zero rule of §14.27", or state the corrected rule in a layer.

## Verified sound

**Gate and dependency check.**
- I reran the gate on 9585279. All checks other than `tex` are 0, including `build`, `imports`, `readme-ids-missing` and `depcheck`.
- Dependency check: `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`; there is no UPWARD or CYCLE line.
- SpecialFunctionsHypergeometric is an open new-roadmap pull request, named in the description's depends-on block. It is not in the merge order yet, so it is placed before this roadmap; that is not a finding.
- There are no edits outside the folder; `metadata.toml` is a roadmap file.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives 41 warnings, all "declaration uses `sorry`", and nothing else.
- The file has no `variable` block, so no section binder can be lost. I compared all 57 elaborated signatures (`#check @…` on a scratch copy) with the README statements; none differs.
- One-tactic probe: I replaced each of the 41 `sorry`s with `first | rfl | (simp; done) | (norm_num; done) | sorry`. All 41 still fell through to `sorry`, so nothing is padding by that test.
- The local `𝐅` (`eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric`) is identical, line for line, to SpecialFunctionsHypergeometric's `Suggested.lean` at its head. The namespace differs, so no fully qualified names clash. It determines `𝐅` uniquely on the cut plane: it is entire in `b` and in `c`, and equals Euler's integral on a nonempty strip.

**Locator sample: all 15 targets read on the DLMF 1.2.8 pages.**

| Target | What was checked on the DLMF page |
|---|---|
| 1.1 | 14.3.1, 14.3.6, 14.3.7, 14.3.10, 14.3.12–14.3.14 (cached text lines 111, 344, 392, 492, 604–675), against all seven Lean definitions. |
| 1.2 | §14.2(ii) reality (lines 188–192) and the V1.0.5 erratum on `Q^μ_ν`; 14.9.5, 14.9.11, 14.9.14. Only the paragraph locator is off (R13). |
| 2.2 | 14.10.3, 14.10.4, 14.10.6 (lines 99, 131, 188) against the Lean statements and the README Checks. |
| 4.1 | 14.5.5–14.5.30 with the V1.0.16 sign erratum on 14.5.14, and K, E of §19.2(ii) (line 734). |
| 4.2 | 14.6.1–14.6.8: `m = 0, 1, …`, then `m ≥ 1`; the V1.0.28 erratum on 14.6.6. |
| 4.4 | 14.8.1–14.8.16 with their conditions; the V1.1.5 errata on 14.8.3 and 14.8.9; `Re μ > 0` for 14.8.4–14.8.6 (line 189); the `x → −1+` note (lines 285–287). |
| 5.1 | 14.2.3–14.2.11; exponents with the V1.0.22 erratum; the recessive statements. DLMF's "`Re μ ≥ 0`" fails at `Re μ = 0`, as the README says. |
| 5.3 | 14.23.1–14.23.7 (lines 56–267). |
| 6.1 | 14.11.1–14.11.5, the forms after 14.11.5, and Hobson §132 as DLMF's note gives it. |
| 7.2 | 14.12.4–14.12.14 and 14.25.1–14.25.2 with their conditions; the README's second hypothesis on 14.12.4 is needed. |
| 9.1 | No DLMF counterpart (R08). |
| 9.2 | §14.16 (lines 109–187); the three corrections confirmed numerically. |
| 10.2 | 14.20.1–14.20.10: 14.20.2 at `−μ` and 14.20.3; "exists except `μ = ½, 3/2, …`, `τ = 0`" under `μ ≥ 0`. |
| 10.3 | 14.29.1, and the Babister remark (lines 75–76). |
| 11.2 | 14.30.8, 14.30.8_5 (√(4π) form, read from the MathML), 14.30.9; the V1.0.25 erratum on 14.30.4. |

All seven DLMF version numbers the README attaches to corrections (1.0.1, 1.0.16, 1.0.22, 1.0.25, 1.0.28, 1.1.3, 1.1.5) match the errata blocks on the pages.

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**
- Mathlib, `Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean`:
  - `Polynomial.shiftedLegendre` (line 40). It is `∑ (−1)ᵏ C(n,k) C(n+k,n) Xᵏ = Pₙ(1 − 2X)`, so `legP n z = Pₙ(z)`.
  - `factorial_mul_shiftedLegendre_eq` (46), `coeff_shiftedLegendre` (84), `shiftedLegendre_eval_symm` (110).
- Mathlib, Gamma and digamma:
  - `Gamma/Beta.lean`: `Complex.Gamma_mul_Gamma_one_sub` (398), `Complex.Gamma_ne_zero` (427), `Complex.differentiable_one_div_Gamma` (543), `Complex.Gamma_mul_Gamma_add_half` (580), `Complex.betaIntegral` (60).
  - `Complex.Gamma_add_one` (`Gamma/Basic.lean:312`), `Complex.digamma` (`Gamma/Digamma.lean:48`), `Real.eulerMascheroniConstant` (`Harmonic/EulerMascheroni.lean:131`).
- Mathlib, analysis and continued fractions:
  - `Polynomial.iterate_derivative_mul` (`Polynomial/Derivative.lean:307`).
  - `DifferentiableOn.analyticOnNhd` (`Complex/CauchyIntegral.lean:729`), `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analytic/Uniqueness.lean:224`), `IsOpen.is_const_of_deriv_eq_zero` (`Calculus/MeanValue.lean:767`).
  - `tendsto_tsum_of_dominated_convergence` (`Normed/Group/Tannery.lean:46`), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`ParametricIntervalIntegral.lean:99`), `fourierBasis` (`Fourier/AddCircle.lean:410`), `InnerProductSpace.instLaplacian` (`InnerProductSpace/Laplacian.lean:138`).
  - `GenContFract.convs` (`ContinuedFractions/Basic.lean:320`).
- Tau Ceti:
  - `TauCeti.Real.legendreK` and `legendreEc` (`EllipticIntegral/Legendre.lean:95, 98`). The modulus convention is `∫(1 − k² sin²θ)^{−1/2}` (line 79), which matches the README's "modulus, not parameter".
  - `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric` (`EllipticIntegral/Hypergeometric.lean:134, 142`).
  - `MvPolynomial.harmonicSubmodule` (`RingTheory/MvPolynomial/Harmonic.lean:210`), `homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow` (327), `finrank_harmonicSubmodule_add_two` (359). For 3 variables the last gives `2(e + 2) + 1`.
  - `MvPolynomial.sphereEval` (`Analysis/MvPolynomial/Sphere.lean:49`).
- Neither pin has a Ferrers function, an associated Legendre function of non-integer degree or order, a spherical harmonic or a Gegenbauer function: no hit for `ferrers`, `associatedLegendre`, `sphericalHarmonic`, `gegenbauer` or "Legendre function".

**Cross-roadmap citations resolved.**
- SpecialFunctionsHypergeometric, at its open head:
  - Conventions (`Complex.regularizedGaussHypergeometric`, `Complex.gaussHypergeometric`).
  - 1.3, including 15.2.3_5. Its `F`-form and this README's `𝐅`-form agree, since `F(…; n+2; z) = (n+1)! 𝐅`.
  - 1.4 (holomorphy, conjugation, identity principle); 2.1–2.2 (15.5.1–15.5.21); 3.1 (15.10.1); 3.4 (15.11.1, 15.11.8).
  - 4.2 (Gauss's sum 15.4.20); 4.3 (circle of convergence); 5.1 (15.8.1, 15.2.3); 5.2 (15.8.8–15.8.12); 5.3–5.4 (15.10.11–15.10.36); 5.5.
  - 6.1 (15.6.1); 7.1–7.3 (15.8.13–15.8.30, 15.4.26–15.4.30); 9.1 (15.9.7, `shiftedLegendre_eval_eq_ordinaryHypergeometric`).
  - Its Downstream section assigns 15.9.16–15.9.23 to this roadmap.
- SpecialFunctionsEiLiErfIncompleteGamma (main), 4.1: `contFrac`, minimality, the reduction-of-order criterion, Pincherle's theorem with value `−f(1)/f(0)`, and termination.
- RiemannianGeometry R8 and R8.2 (main, and at the revision head).
- AsymptoticExpansions on main (line 1550) leaves 2.10.33–2.10.36 to the special-function roadmaps.
- SpecialFunctionsBessel, at its head (lines 189–193): its list of Chapter 10 formulas left to a roadmap consuming this one matches this README's Downstream section.

**Ownership against open pull requests** was checked with `roadmaps grep` over the objects themselves (Ferrers, associated Legendre, spherical harmonic, conical, toroidal, Mehler, Dougall, Heine). This found R03 and R04.
- QuantumFoundations 9.3 owns the angular-momentum operators on `L²(S²)` and their spectra. This roadmap's 14.30.11–14.30.13 are pointwise eigen-equations of the explicit `Y_{l,m}`, so there is no conflict.
- `overlaps.md` (no dropped ids) was confirmed.

**Termination of the continued fraction (6.2).** In the terminating case, the recurrence `h_{k−1} = y_k h_k + x_{k+1} h_{k+1}` with `h_k = P^{−μ−k}_ν(x)/s^k` and `s = √(x²−1)/2` gives `h_{−1} = B_M h_{M−1}`. Hence `hP : P^{1−μ}_ν(x) ≠ 0` forces the denominator `B_M ≠ 0`, as the Lean statement asserts.

### Adversarial table

Values are given as left side / right side, or as the quantity computed. "README" marks the README's own value where it states one.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `ferrersP` (14.3.1), 1.1 Checks | `𝖯^{1/2}_{0.3}(cos 1)`; `𝖯^{0.4}_{0.3}(0.25)`; `𝖯^0_1(0.3+0.2i)` | 0.605997010362 / closed form 0.605997010362; 0.514894433658 (README 0.51489 44336 58); 0.3+0.2i | holds | — |
| `ferrersQ` (14.3.12), 1.1 Checks | `𝖰^0_0(0.5)`; `𝖰^1_0(0.3)`, `𝖰^1_0(−0.6)`; `𝖰^{0.4}_{0.3}(0.25)` | 0.549306144334 = ½ ln 3; −1.04828483672, −1.25 = −(1−x²)^{−1/2}; −0.993017785692 (README) | holds | — |
| `associatedLegendreP` (14.3.6) | `P^{1/2}_{0.3}(cosh 1)`; `P^{0.4}_{0.3}(1.5+0.7i)` | 0.984366026347 both; 0.990129160991+0.015249104129i (README) | holds | — |
| `olverLegendreQ` (14.3.7), branch | `𝑸^0_0(3)`; `𝑸^1_0(2i)`; `𝑸^1_0(−10⁻⁶+2i)` against the principal `(z²−1)^{−1/2}`; `𝑸^{0.4}_{0.3}(2)` | 0.34657359028 = ½ ln 2; −0.4472135955i; −0.44721i against +0.44721i; 0.355186769329 (README) | holds; the principal root is discontinuous at 2i | — |
| `associatedLegendreQ` (14.3.10) | `Q^0_1(2)`; `Q^{0.4}_{0.3}(2)`; `(ν, μ) = (−0.6, −0.4)` | 0.0986122886681 = ln 3 − 1; 0.0997310496112+0.306940609534i (README); junk 0 | holds | — |
| `differentiable_ferrersP_degree` | Cauchy–Riemann in ν at `(μ, z, ν) = (0.35+0.4i, 0.4+0.3i, 0.7−0.2i)` | ∂_{Re ν} = ∂_{Im ν}/i = −0.954373201+0.150303163i | holds | — |
| `ferrersP_conj` | same point | 0.395887831471−0.0746426733907i both | holds | — |
| `olverLegendreQ_neg_order` | `(0.3, ±0.4, −1.5+0.8i)`, a point of `U` with `Re z < 0` | −0.410652971574+0.0657549191513i both | holds | — |
| `ferrersP_legendreEquation`, `olverLegendreQ_legendreEquation` | real and complex points; `z = 2`, `z = −1.5+0.8i` | residuals 9·10⁻⁹, 1.4·10⁻⁸; 7.6·10⁻⁸, 6.9·10⁻⁸ (finite-difference noise) | holds | — |
| `wronskian_mul_one_sub_sq_eq_const` | symbolic | `((1−z²)W)′ = −2zW + 2zW = 0`, using the equation | true, not a headline | R10 |
| `ferrersP_neg_nat_order` (14.9.3 form) | ν ∈ {0.37, 1, 0, −1, 2.5+0.3i}, m ∈ {1, 2}, z = 0.2+0.1i | equal throughout (for example 3.86721275037+0.437897953822i at ν = 2.5+0.3i, m = 2); 0 = 0 at the Pochhammer zeros | holds | — |
| 1.4 Checks (14.9.3, 14.3.15) | `𝖯^{−1}_2(0.3)`; `P^{−0.4}_{0.3}(2)` | 0.143090880213 = −𝖯^1_2/6 = x√(1−x²)/2; 1.01402040115 by 14.3.15 and by 14.3.9 (README) | holds | — |
| `ferrersP_recurrence_14_10_3` | `(0.3, 0.4, 0.25)`; complex `(0.7−0.2i, 0.35+0.4i, 0.4+0.3i)` | residual −3.4·10⁻¹⁵; 4.4·10⁻¹⁶ | holds | — |
| `hasDerivAt_ferrersP` (14.10.4) | complex point | 0.997580940956+0.201207685314i / 0.997580940983+0.201207685278i | holds | — |
| `ferrersP_zero` (14.5.1) | `(0.3, 0.4)`; `(0.7−0.2i, 0.35+0.4i)`; `(−1.3, 2.2)` | 0.364525505405 both (README); −0.031383158013−0.263034678288i both; −0.0865273216194 both | holds | — |
| `ferrersP_eq_ferrersW` (14.3.11) | `(0.3, 0.4, 0.25)`, complex point, `(1, 0, 0.3)`; excluded point `(−1, 0, 0)` | equal; at the excluded point `𝖯 = 1`, `w₁ = w₂ = 0` | holds; the hypothesis is needed | — |
| `ferrersQ_eq_div_sin` (14.3.2) | three points, including `(−1.2, 0.5, −0.3)` | equal (1.24075892594 at the last) | holds | — |
| `regularizedGaussHypergeometric_eq_associatedLegendreP` (15.9.17) | `(0.3, 1.2, 0.5)`; complex z = 0.3+0.6i, −0.7+0.2i, 0.8−0.5i | 1.24282086548 both (README); equal at all three | holds | — |
| `ferrersP_neg_half_cos` (14.5.21), 14.5.27 | θ = 1; ξ = 1 | 1.06633424558 both; 1.11448003641 both (README) | holds | — |
| `ferrersP_nat_eq_shiftedLegendre` (14.7.1) | n = 0…4 and n = 12, x = 0.3 | equal (−0.181002179662 at n = 12) | holds | — |
| `ferrersQ_nat` (14.7.2–14.7.3) | n = 0…4, x = 0.3 | equal; 𝖰₂(0.3) = −0.562974655534 = 14.5.29 (README); W₁ = 0.45 | holds | — |
| `hasSum_ferrersP_nat_mul_pow` (14.7.19) | `(0.3, h = 0.5)`; `h = 0.6e^{2.3i}` | 1.02597835209 = 0.95^{−1/2}; 0.834922586863+0.204817877999i both | holds | — |
| 14.7.21 (README 4.3) | `(x, h) = (0, −2)`, `(0.3, −2.5)`, `(0.3, 2.5)` | −0.4472135955 / printed +0.4472135955; −0.33806 / +0.33806; equal for h > 0 | fails for h < −1 | R01 |
| `ferrersP_isEquivalent_one` (14.8.1) | `(0.3, 0.4)`, `(0.3, −1.6)`, `(1.1, 2.5)` at x = 1 − 10⁻⁶ | ratios 0.99999957, 1.0000003, 1.0000001 | holds | — |
| 14.8.3 Check | ν = 0.3, x = 1 − 10⁻⁵ | 𝖰_ν − ½ ln(2/(1−x)) = −0.408040; −γ − ψ(1.3) = −0.408024776035 (README) | holds | — |
| `wronskian_ferrersP_ferrersQ` (14.2.4) | `(0.3, 0.4, 0.2)`; complex point on D | 0.850284791 = Γ(1.7)/Γ(0.9) (README); 1.35903689+0.08009636i both | holds | R09 |
| `ferrersQ_connection_14_9_2` | four points, including μ = 2 and ν = −2.4 | equal (≈ 0 at μ = 2) | holds | — |
| `olverLegendreQ_whipple` (14.9.16) | `(0.3, 0.4, 2)`; complex (ν, μ), x = 1.3 | 0.355186769329 both; 0.470339772393+0.140821368994i both | holds | — |
| `tendsto_associatedLegendreP_cut` (14.23.1) | `(0.3, 0.4, 0.25)`, ε = 10⁻⁶ | 0.416558708−0.302646858i against e^{−0.2πi}𝖯 = 0.416558347−0.302647355i, an O(ε) gap | holds | — |
| `tendsto_olverLegendreQ_cut` (14.23.2) | ODE continuation from z = 2 via 2 ± i; real and complex (ν, μ) | −0.360947536 ∓ 1.36248818i, equal to the Lean right sides | holds | — |
| `associatedLegendreP_continuedFraction` (14.14.1 corrected) | `(0.3, 0.4, 1.5)`, `(1.7, −0.6, 3)`, `(−0.2, 1.3, 1.2)`; `(5/8, −11/8, 2)` | fraction 0.345161187629 = corrected side, printed side 0.81272070827 (README); same pattern at the other two; conv₃ = 0 with B₃ = 15/32, P^{11/8}_{5/8}(2) = −7·10⁻¹⁷, nested division 0.613636 = 27/44 | holds | — |
| Large-order estimate (minimality, 6.2) | k = 5, 20, 60 at `(0.3, 0.4, 2)` | 1.0290, 1.0090, 1.0032, tending to 1; large-degree estimate 0.99899, 0.99968, 0.99989 | holds | — |
| 14.14.3 | `(0.3, 0.4, 1.5)`; `(1.2, −0.7, 2.5)` | −0.0337444499303 both (README); 0.116363075112 both | holds | — |
| `ferrersP_cos_eq_integral` (14.12.1) | `(0.3, 0.2, θ = 1)`; `(1.3+0.4i, −0.7+0.1i, θ = 2)` | equal to 9 digits | holds | — |
| `olverLegendreQ_nat_eq_integral` (14.12.13) | n = 0, z = 3; n = 2, z = −1.5+0.7i; n = 3, z = 0.2+0.4i | 0.34657359 both; 0.000487074−0.017624178i both; 0.020429216+0.016951170i both | holds | — |
| `integral_cpow_mul_ferrersP` (14.17.5) | `(0.7, −0.4, 0.6)`; complex `(0.3+0.2i, 0.5, −0.6+0.3i)` | 0.574095286 / 0.574095287 (README); 1.0515543−1.1986380i / 1.0515547−1.1986378i | holds | — |
| `integral_ferrersP_mul_ferrersP` (14.17.6) | (l, m, n) = (2,1,2), (3,1,3), (1,2,3), (2,1,4) | 2.4 = 12/5; 3.4285714; 0; 0 | holds | — |
| `integral_ferrersQ_mul_ferrersP_mul` (14.17.17) | in range (2,1,2), (3,2,2), (2,2,3), (3,1,3); outside (4,1,2) | about 10⁻¹⁰ each; −0.194444444 = −7/36 (README) | holds | — |
| Adams coefficients (7.4) | (m, n) = (1, 2) | A(0..3) = 1, 1, 3/2, 5/2, giving c₀ = 3/5 and c₁ = 2/5 | holds | — |
| `ferrersP_cos_eq_fourier` (14.13.1) | `(0.3, −0.2, 1)`; `(0.3, 0.3, 1)` (conditional); `(1.1+0.2i, −0.6, 2.2)` | 0.88595484 (N = 2·10⁵) against 0.885954849 (README); averaged partial sums 0.7899305 against 0.7899317; equal | holds | — |
| `ferrersP_addition` (14.18.2) | n = 3, θ = (0.7, 1.9), φ = 0.8; also θ₁ + θ₂ = 4.2 | −0.252222484 both; −0.176929684 both | holds (DLMF's θ₁ + θ₂ < π is not needed for integer n) | — |
| `hasSum_ferrersP_dougall` (14.18.9) | `(0.3, 0.5, 0.2)`; `(0.3+0.4i, 0, −0.6)`; `(2.7, 1.25, 0.5)` | 0.89592599 / 0.895925986 (README); 0.4598041−0.8617199i both; 0.090493808 both | holds | — |
| 14.18.8 at x = 1 (README 8.3) | ν = 0.3 | partial sums −1.876, −3.058, −4.243, −5.429 at N = 10²…10⁵ | diverges | R02 |
| `hasSum_heine` (14.28.2) | z₁ = 2.5+0.5i, z₂ = 0.4−0.3i | 0.41584158−0.15841584i both | holds | — |
| `ferrersP_zero_count` (μ ≤ 0) | (2.5, −0.3), (−0.4, −0.05), (3, −2.5), (−½, 0), (1, −1), (2, −2), (½, −½) | zero counts 3, 0, 1, 0, 0, 0, 0; `⌈ν+μ⌉.toNat` gives the same | holds | — |
| 9.2 corrections | (¼,¾), (0.3,0.3), (1.6,1.6), (1.2,1.7), (2.2,2.9); (3.3,1.3); (2.7,1.3); (0.3,2.5); (0.3,1.5); (2.6,1); (3.3,2); 𝖰 at (−0.369,−0.206); P at (0.184,−0.088); 𝑸^{1/2}_{−3/2} | 1 zero each, N₀ = 0; 3; 2; 1; 0; 2; 2; minimum 2.24 > 0; minimum 0.4075 on (1, 10⁷); ≡ 0 | README corrections hold; DLMF's statements fail | R06 |
| `hasSum_olverLegendreQ_toroidal` (14.19.6) | (μ, ξ, φ) = (0.3, 0.8, 1.1); (−0.2+0.3i, 1.5, 2.5) | 1.335060409 both; 0.7581442002−0.0897431436i both | holds | — |
| 14.19.3 Check | (ν, μ) = (½, 0), ξ = 0.7 | 1.08952705 for all three expressions | holds | — |
| `conicalQHat_eq` (14.20.3) | (μ, τ, x) = (0.3, 1.1, 0.4), (0.7, 0.4, −0.3), (−0.6, 0.8, 0.2), (0.3, −1.1, 0.4), (1.2, 0, 0.3), (−0.3, −0.5, 0.6) | 0.3432632457 both (README), 1.22279441, 0.4109892143, −3.683343657, 2.27350404, 2.4669082, each on both sides | holds for all real μ, τ under the Lean hypothesis | R05 (prose only) |
| `conicalQHat_eq_cut` (14.23.7 corrected) | four points as above | corrected side equals 𝖰̂ (imaginary part about 10⁻¹¹); printed side 0.1172071991−0.1613218698i at (0.3, 1.1, 0.4) (README) | holds | — |
| Conical pair (10.2) | μ = −½, τ = 1, θ = 10⁻⁴ | ratio 0.086275 → 1/cosh π = 0.086267; at μ = ½ the ratio is 8.7·10⁻⁶ | fails for μ < 0 | R05 |
| 14.20.9, 14.20.7 | (τ, θ) = (1, 2); (μ, τ) = (0.6, 0.9) | 3.130976523 against quadrature 3.13097647 (README 3.13097 65197 5); ratio 0.9999941 | holds | — |
| `generalizedLegendre_solution` (14.29.1) | (0.37, 0.6, −0.45), z = 0.3+0.2i | residual 1.5·10⁻⁸ against abs(w) = 0.24 | holds | — |
| `integral_sphericalHarmonic_mul` (14.30.8) | (2,1,2,1), (2,−1,2,−1), (3,−2,3,−2), (2,1,3,1) | 1, 1, 1, 8·10⁻¹¹ | holds | — |
| `ferrersP_eq_sum_sphericalHarmonic` (14.30.9) | l = 1, 3; (θ₁, φ₁, θ₂, φ₂) = (0.7, 0.3, 2.1, 1.9) | −0.4023652997 both; 0.4406927729 both | holds | — |
| `sphericalHarmonic` Checks, Herglotz 14.30.8_5 | Y₀₀, Y₁₁, Y₁,₋₁; (t, r, θ, φ, λ) = (0.7, 0.9, 1.1, 0.5, 0.8+0.3i) | Y₀₀ = 0.282094791774; Y₁₁ = −√(3/8π) sin θ e^{iφ}; Y₁,₋₁ = −conj Y₁₁; Herglotz both sides 1.28163061−0.588281115i | holds | — |
| 14.3.17, 14.3.18, 14.3.19 regions (3.3) | 14.3.17 at z = 1.5 ± 10⁻⁹i, 0.3+0.5i, −0.4−0.7i, −2+0.3i; 14.3.18 at −0.5+0.5i and 1.3+0.4i; 14.3.19 at 2 and −1.5+0.8i | 14.3.17 equal, limits from both sides agree (0.8695535724); 14.3.18: 0.813110483704+0.570253092087i against 0.810056501843+0.388355814619i (README), equal at 1.3+0.4i; 14.3.19 equal | README regions correct | — |
| 14.12.4 second hypothesis (7.2) | (ν, μ) = (−1.5, 0.2) | growth exponent abs(Re(ν+½)) − Re μ − ½ = 0.3 > 0 while DLMF's conditions hold | README correct | — |
| `sphericalHarmonic_hilbertBasis` | statement read against R8.2 | true; also stated on main | holds | R04 |

## Not verifiable

None of these texts was opened. The sampled locators all point to DLMF, which was read in full; the books and papers below are cited for background or through DLMF's own notes.
- Olver, *Asymptotics and Special Functions* (1974): a book, not opened.
- Erdélyi et al., *Higher Transcendental Functions* I (1953): not opened.
- Hobson (1931): §132 (for 14.11.4) and pp. 386–401 (for §14.16) match the locators in DLMF's notes, but the text itself was not read.
- Adams (1878), *Proc. Roy. Soc.* 27: not opened. The linearization coefficients were checked only at (m, n) = (1, 2), and through 14.17.17 at five (l, m, n).
- Dunster (1991), Volkmer (2021), Andrews–Askey–Roy (1999): not opened. The title of Volkmer (2021) was compared with DLMF's bibliography page only.
- The README's claims in Beyond about 14.15.23 and 14.20.17–14.20.18 were not checked; they are outside the targets.

## Source issues

- **Error** in DLMF 1.2.8 at 14.7.21, §14.7(iv): the source says the sum of 𝖯ₙ(x)h^{−n−1} equals (1 − 2xh + h²)^{−1/2} for abs(h) > 1; it should be h^{−1}(1 − 2x/h + h^{−2})^{−1/2}, which differs in sign when h < −1 (x = 0, h = −2: −1/√5); affects a stated result.
- **Error** in DLMF 1.2.8 at 14.12.4, §14.12(ii): the source gives the integral for P^{−μ}_ν under ν + μ ≠ −1, −2, … and Re(μ − ν) > 0 only; it should also require Re(μ + ν) > −1, since at (ν, μ) = (−1.5, 0.2) the integrand grows like e^{0.3t}; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.14.1, §14.14: the source equates the fraction with ½(x² − 1)^{1/2} P^μ_ν/P^{μ−1}_ν; it should be ½(x² − 1)^{1/2}(ν + μ)(ν − μ + 1) P^{−μ}_ν/P^{1−μ}_ν (at (0.3, 0.4, 1.5): 0.34516 against 0.81272); affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.16(ii): the source's two lists of conditions cover neither n = m with δ_ν ≤ δ_μ (μ > 0, ν, μ ∉ ℤ); the N₀ + 1 list should read n ≥ m (𝖯^{3/4}_{1/4} has one zero, at x = 0); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(ii): the source states the parity rule for the zeros of 𝖰^μ_ν for every real μ; it fails for μ < 0, since at (ν, μ) = (−0.369, −0.206) both cosines are positive but 𝖰^μ_ν > 0 on (−1, 1); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(iii), condition (b): the source omits μ > 0; at (ν, μ) = (0, −½), P^{−1/2}_0(cosh ξ) = (2/(π sinh ξ))^{1/2}·2 sinh(ξ/2) has no zero on (1, ∞), though (b) predicts one; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.23.7, §14.23: the source's second factor is e^{−3μπi/2}; it should be e^{μπi/2} (at (μ, τ, x) = (0.3, 1.1, 0.4) the printed side is 0.11721 − 0.16132i, and 𝖰̂ is 0.34326); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.27, condition (a): the source predicts exactly one zero of P^μ_ν(x ± i0) on (−∞, −1) at ν = 1, μ = −½; it should predict none, because P^{−1/2}_1(x) = ((x − 1)/(x + 1))^{1/4}(1 + 2x)/(3Γ(3/2)) does not vanish there; affects a stated result.
- **Error** in DLMF 1.2.8 at §14.2(iii): the source calls 𝖯^{−μ}_ν(±x) recessive at ±1 whenever Re μ ≥ 0; it should require Re μ > 0 or μ = 0, since at ν = 0, μ = i the ratio of 𝖯^{∓i}_0 has modulus 1; affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.21(iii): the source lists 14.3.18 among the formulas that extend to complex z without naming the branch of its 𝐅; it should say that with the principal 𝐅 it holds for Re z > 0 only (at z = −0.5 + 0.5i: 0.81311 + 0.57025i against 0.81006 + 0.38836i); affects a stated result.
