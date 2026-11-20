# Review of SpecialFunctionsMathieu (pull request #2538 at c287391)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the target of 1.4 that classifies the point at infinity of the algebraic form DLMF 28.2.2 as an irregular singularity is false at `q = 0`, which Layer 1 allows, and its "rank one" is not the situation AsymptoticExpansions §10.4 treats. The finding and the three small corrections of the previous review are repaired, the numerical Checks I recomputed agree, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one format note and no small correction; a licence point and the unread books are left to the human reviewers.

## R01 (P2) — At `q = 0` the point at infinity of DLMF 28.2.2 is a regular singularity, so the classification target of 1.4 lacks the hypothesis `q ≠ 0`

The last "Prove" bullet of 1.4 (`TauCetiRoadmap/SpecialFunctionsMathieu/README.md`, lines 355–356) reads "DLMF 28.2.2 has regular singularities at `0` and `1` with exponents `0` and `½` (AsymptoticExpansions §10.3) and an irregular singularity of rank one at `∞`", and Conventions makes `a`, `q` arbitrary complex numbers in Layers 1–2. An implementer is asked to prove the statement for every `q`, and it fails for `q = 0`.

Write 28.2.2 as `u″ + p u′ + r u = 0` with `p = (1 − 2ζ)/(2ζ(1 − ζ))` and `r = (a − 2q + 4qζ)/(4ζ(1 − ζ))`. As `ζ → ∞`, `ζ p → 1` and `ζ² r = −qζ − a/4 + O(1)`. For `q = 0` both limits are finite, so `∞` is a regular singular point, with indicial equation `ρ² = a/4` for `u ∼ ζ^{−ρ}`: the exponents are `±√a/2`, as `u = cos(√a z)`, `ζ = sin² z` shows. For `q ≠ 0`, `ζ² r` is unbounded and the point is irregular. DLMF's sentence after 28.2.2 has the same gap (it says "irregular singular point" with no condition, and no rank).

The words "of rank one" need care as well. In the expansion `p = ∑ f_s ζ^{−s}`, `r = ∑ g_s ζ^{−s}` one has `f₀ = g₀ = 0` and `g₁ = −q`, so the point has rank one in the sense of DLMF §2.7(ii) only through `g₁`, and the characteristic equation `λ² + f₀λ + g₀ = 0` has the double root `0`. AsymptoticExpansions §10.4 assumes `λ₁ ≠ λ₂`, so it gives nothing here; the solutions behave like exponentials of `±2(qζ)^{1/2}`, not of a multiple of `ζ`. (For 28.20.2, which 8.2 treats, `g₀ = 4q` and the roots `±2ih` are distinct, as the supplier contract says.)

The smallest change: state the bullet as "for `q ≠ 0` an irregular singular point at `∞`, and for `q = 0` a regular one with exponents `±√a/2`", and either drop "of rank one" or say in which sense it is meant (DLMF §2.7(ii), with coincident characteristic roots, outside AsymptoticExpansions §10.4). The case `q = 0`, `u = cos(√a z)`, would serve as a Check. The module docstring of `Suggested.lean` (lines 25–27) refers to the same classification and needs no change beyond agreeing with the bullet.

## N01 — A pointer in "Scope and ownership" still says the layers are below

Line 1445 says "The numbers are those of the layers below"; the section now follows the layers, so "above".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 basic solutions, `analyticOnNhd_mathieuWI` | `q = 0`; `(1.5, 1)`, `(3, 1)`; DLMF 28.2.5–6 read | `cos √a z`; `w_I(π) = −1.5637429712`, `0.5133105431` by RK4 | agrees | none |
| 1.3 `mathieuWI_pi_neg`, half-period identities | `q = 0`, `s = √a` | `cos πs − 1 = −2 sin²(πs/2)`; `−s sin πs = 2 cos(πs/2)(−s sin(πs/2))` | agrees | none |
| 1.4 conformal Laplacian, separation, Helmholtz | chain rule; `a = n²`, `q = 0` | `ΔF = −2q(cosh 2ξ − cos 2η)F = −4q·abs(sinh w)²F`; `Δf = −(4q/c²) f = −k² f` | agrees | none |
| 1.4 algebraic forms (three theorems) | `ζ = sin² z`, `cos z`, `cosh z` | `w″ = 4ζ(1−ζ)u″ + 2(1−2ζ)u′`; `(1−ζ²)u″ − ζu′`; `(ζ²−1)u″ + ζu′` | agrees | none |
| 1.4 singular points of 28.2.2 | `q = 0`; `q ≠ 0`; DLMF 28.2(i) read | `q = 0`: `ζp → 1`, `ζ²r → −a/4`, exponents `±√a/2`; `q ≠ 0`: `f₀ = g₀ = 0`, `g₁ = −q` | false at `q = 0` | R01 |
| 2.1 `exists_hillFloquet_iff` and bullets | `Q = 0`; least period `nπ`, `n ≥ 3`; DLMF 28.29(ii) read | `Δ = 2 cos π√λ`; `M + M⁻¹ = Δ·I`; `ρⁿ = 1`, `ρ ≠ ±1` forces all solutions `nπ`-periodic | agrees | none |
| 2.2 `exists_mathieuFloquet_iff` | double roots; `q = 0` recurrence | `sin πν = 0` iff `ν ∈ ℤ`; finitely supported solutions at `q = 0` | agrees | none |
| 2.3 `tendsto_det_one_add_of_summable`, `tendsto_mathieuHillDet` | empty minor; `(1.5, 1)` with `N = 10⁵` | `∑_s ∏ r_i = ∏(1 + r_i)`; `D = 1.4559059222`; formula gives `−1.5637429712` | agrees | none |
| Layer 2 Example | zeros in `q` at `a = 0` | `w_II(π/2; 0, q) = 0` at `7.5796903737`; `w_I′(π/2; 0, q) = 0` near `21.3` and at `69.4283782910` | agrees | none |
| 2.4 `ince_theorem` | two independent `2π`-periodic solutions | `M² = I`, `det M = 1` give `M = ±I`; multipliers `1` and `−1` have product `−1 ≠ 1` | sound | none |
| 2.5 stability | `q = 0`, `a = 1`, `0`; `(1.5, 1)`; DLMF 28.17 read | bounded with `abs(w_I(π)) = 1`; `w = z`; `1.5637 > 1` | agrees | none |
| 3.1 Sturm–Liouville problems, `nthLeast` | `V = 0`, Dirichlet; `{n²}` | `sin((m+1)πx/L)` has `m` zeros; `nthLeast {n²} 2 = 4` | agrees | none |
| 3.2 `hillDiscriminant_growth`, `deriv_hillDiscriminant`, `hillDiscriminant_band` | `Q = 0`; DLMF 28.29.15 read | both sides `−π sin(πs)/s`; `Δ″(4) = −π²/8`; `Δ(−1) = 2 cosh π = 23.1839` | agrees | none |
| 3.3 `hill_eigenvalues`, `hill_interlacing`, `hill_gaps`, `hill_zeros` | `Q = 0`; index maps in Lean | `0,1,1,4,4`; `ν_k = τ_k = k²` in `{1}`, `{4}`; `τ₀ = λ₀ = 0`; `cos(2x − φ)`: 2 zeros | agrees | none |
| 3.4 `mathieuA`, `mathieuB`, `mathieuA_odd_neg`, `hillEigenvalue_mathieu` | `q = 1`, `q = 0`; index `(n − 1)/2` | `a₀ = −0.4551386041`, `b₁ = −0.1102488170`, `a₁ = 1.8591080725`; `n = 2 → 0`, `n = 4 → 1` | agrees | none |
| 3.5 `mathieuLambda` | `q = 0`, `ν = 0.3, 1.7, 2.3`; `q = 1`, `ν = 0.5` | root set `0.09, 2.89, 5.29`; indices `0, 1, 2`; `λ_{0.5}(1) = −0.3072853506` | agrees | none |
| 4.1 `integral_mathieuCe_sq`, `integral_mathieuCe_mul`, `mathieuCe_even_neg`, `ncard_zeros_mathieuCe_even` | `q = 0` | `∫ ½ = π`; zeros of `cos 2nz`, `sin(2n+1)z`, `cos(2n+1)z`, `sin(2n+2)z` in `(0, π/2)`: `n` each; sign `(−1)ⁿ` at `π/2` | agrees | none |
| 4.2 `hasSum_mathieuCe_even`, `hasSum_mathieuSe_even` | recurrence; `q = 0`; DLMF 28.4 read | `A₂/A₀ = a/q`; ratio `−q/(4m²)`; `2·(1/√2)² = 1` | agrees | none |
| 4.3 `mathieuFe`, `mathieuGe`, `mathieuFeC_odd_neg` | `q = 0`, `n = 0`; periodicity of `f_n` | `t₀(0) = √2`, `f₀ = 0`, `fe₀ = z`; `w_II(π)/t_n = π(−1)ⁿ ce_n(0)`; `fe_n′(0) = C_n/t_n > 0` | agrees | none |
| 4.4 `mathieuMe`, `integral_mathieuMe_mul_neg`, `mathieuCeNu_im_eq_zero` | multiplier; `ν = ±n`; DLMF 28.12 read | `s = i sin πν / w_II(π)`; raw`(−x)` = conj raw`(x)`; `(−√2 i)²(−se²) = 2 se²` | agrees | none |
| 4.5 `mathieuCoeff` | first order in `q`; `ν = −n`; DLMF 28.14 read | `−q/(4(ν+1))`, `−q/(4(1−ν))`; `−q/6`, `−q/2` at `½`; `∫₀^π sin kx cos jx = 0` for `k − j` even | agrees | none |
| 5.1 `whittakerHill_of_ince`, Ince polynomials | `p = 1`; `ξ = 0`; DLMF 28.31 read | residuals `(η − 1 − ξ) cos z`, `(η − 1 + ξ) sin z`; off-diagonal product `(p/2 − ℓ)(p/2 + ℓ + 1)ξ² > 0` | agrees | none |
| 5.2 paraboloidal wave functions | `p = 1`, `m = 0` | `hc¹₁(z, −ξ) = e^{ξ cos 2z/4} cos z = hs¹₁(π/2 − z, ξ)` | agrees | none |
| 6.1 `hill_expansion` | `Q = 0`, `t = 1`; hypothesis on `g` off `[0, 2π]`; DLMF 28.30 read | card `{0, 1, 1} = 3 = 1 + 2`; on `[0, 2π]` the Lean hypotheses give DLMF's | agrees | none |
| 6.2 integral equations, nonvanishing | moment argument; DLMF 28.10 read | odd powers of `cos t` dense among functions vanishing at `π/2`; `sin t cos t P(cos² t)` at both ends | sound | none |
| 7.1 `exists_analyticAt_mathieuA_zero` | Taylor coefficients; `q = −1` | `F″(0) = −1`, `F⁗(0) = 24·7/128`; `a₁ − b₁ = −1.9693568895` | agrees | none |
| 7.2 `mathieuA_lt_mathieuB_lt`, `tendsto_mathieuLambda_one` | `q < 0` from the symmetries; bands at `q = 1` | `a₀ < a₁ < b₁ < b₂ < a₂`; least root → `b₁`, second root → `a₁` | agrees | none |
| 7.3 `tendsto_mathieuTail_mathieuA_zero` | recurrence; `q = 0.5`, 40 levels | `T_m = q²/(4m² − a − T_{m+1})`, `a = −2T₁`; `a₀ = −0.1217655449 = −2T`; printed form `−0.0608827725` | agrees | none |
| 7.4 `mathieuExceptionalSet_closed_discrete` | real `q`; DLMF 28.7 read | real roots simple; DLMF prints `±1.4688 i`, `2.0886`; discriminant on the disc `abs(q) < R` nonzero at real points | agrees | none |
| 7.5 four sum rules | order `q`, `q²`; tails at `q = 1` | `−½ + 5/12 + 1/12 = 0`; `a₁ = 1 + q + ⋯`; tail `1/(8·60) = 0.00208`; `6M > 4 + 5·abs(q)` | agrees | none |
| 8.1 `isModifiedMathieuSolution_modifiedMathieu`, `modifiedMathieuM` | `h ≤ 0`; `n = 0`; `q = 0`; `ν = −n` | junk branch `0` solves; `Se₀ = 0`; `Fe₀(z, 0) = z`; `λ_{−n} = b_n`; `a_n(−h²) > −2h²` for `Ie_n` | sound | none |
| 8.2 `tendsto_norm_modifiedMathieuM_three` | `h = √2`; DLMF 28.20 read | `abs(H⁽¹⁾_ν(X)) ∼ (2/(πX))^{1/2}`; `(π√2)^{−1/2} = 0.47443`; `μ = −λ/(2λ) = −½` | agrees | none |
| 8.4 `not_summable_besselJ_series`, `differentiable_besselJLog` | `n → −∞`; Mathlib body of `besselJ` | term size `abs(cosh z)^{−2·abs(n)}` times a power of `abs(n)`; `(e^L/2)^μ e^{μ(L − log e^L)} = e^{μ(L − log 2)}` | agrees | none |
| 8.5 `integral_exp_mul_mathieuCe` | large `Re z`; region | both sides `ce_n(0) e^{iX} e^{iπ/4} (π/(2X))^{1/2}`; `iⁿ e^{−inπ/2} = 1`; `Im cosh z = sinh x sin y > 0` | agrees | none |

- Earlier findings, all repaired: R01 (region of 28.28.11), "for `Re z > 0` and `0 < Im z < π`" in 8.5 and `hz₁`–`hz₃` in Lean; C01 (`fe_n`, `ge_n` at `q = 0`), `mathieuFe`, `mathieuGe` now have the case `q = 0`; C02, `hill_expansion` and `mathieuExceptionalSet_closed_discrete` are stated; C03, the sketch of 7.4 now takes `P` "holomorphic for `|q| < R`".
- Source locators checked against the text: 12 DLMF sections read online (28.2, 28.4, 28.6, 28.7, 28.10, 28.12, 28.14, 28.17, 28.20, 28.29, 28.30, 28.31 in part), covering the DLMF locators of the fifteen sampled targets; no book could be read.
- Library declarations opened at the pin: `Complex.besselJ` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean:55`), `InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane` (`Mathlib/Analysis/InnerProductSpace/Laplacian.lean:231`), `TauCeti.Polynomial.exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball` (its type, with `d.factorial ∣ n`); the 34 `#check` lines elaborate. No Floquet, Hill, Mathieu-function, `besselY` or Hankel declaration exists at the pins.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §§10.2–10.4; SpecialFunctionsBessel 1.2, 1.3, 1.6, 4.1, 4.2, 6.1, 6.2, 10.1, its Sturm comparison and its consumer entry (the same headings exist at the head of its open revision); SpecialFunctionsEiLiErfIncompleteGamma §4.1; AutomorphicSpectralTheory §0.8; OperatorTheory/UnboundedOperators §4.8. The local `besselY`, `hankelH1`, `hankelH2` have the bodies of SpecialFunctionsBessel's `Suggested.lean`, under this roadmap's namespace.
- Elaboration: `lake env lean` on `Suggested.lean` gives 48 warnings, all `declaration uses sorry`, and no error. One-tactic probe (`first | rfl | simp | infer_instance`) on a copy: none of the 48 theorems closes. Each signature was read against its README statement; every hypothesis is an explicit binder and none is lost.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder; its description agrees with the head (four suppliers, 48 theorems, eight layers, the eight corrections to DLMF).
- Recomputed with a fourth-order Runge–Kutta integrator and bisection: the values of 1.2, 2.3, the Layer 2 Example, 3.4, 3.5, 7.3 named in the table.

Overlap check: read SpecialFunctionsLegendre, SpecialFunctionsHeun, SpecialFunctionsConfluent, SpecialFunctionsBessel, and searched every roadmap for Floquet theory, Hill's equation, Mathieu functions and infinite determinants; nothing shared. Sturm comparison: owner SpecialFunctionsBessel (cited); Pincherle's theorem: owner SpecialFunctionsEiLiErfIncompleteGamma §4.1 (cited); Hilbert–Schmidt kernels: owner AutomorphicSpectralTheory §0.8 (cited). SpecialFunctionsHeun names Mathieu's equation only as an example of a confluent Heun equation.

Source independence: 9 passages compared with 1 source (DLMF: the sentence after 28.2.2, §28.7 on branch points, §28.29(ii), §28.12(i), §28.17, the hypotheses of 28.30, the existence text of §28.31(ii), the convergence sentence of 28.14, §28.20(iii)), none shared beyond formulas; DLMF was read through a text rendering, so wording was compared statement by statement, not word by word; largest share DLMF, 213 of 293 source mentions; contents compared with DLMF Chapter 28: independent (Layer 1 draws on 28.2, 28.20, 28.29; Layer 3 on 28.2, 28.12, 28.29; Layer 5 is 28.31 placed before 28.10–28.11; Layer 7 on 28.6, 28.7, 28.15); the eight books could not be read.

Research link: Hill's discriminant, bands and gaps (Layer 3) are the spectral theory of periodic Schrödinger operators as in Levitan–Sargsjan 1991 and Kato 1995; the Mathieu and modified Mathieu functions are DLMF Chapter 28 and separate the Helmholtz equation in elliptic coordinates (Whittaker–Watson 1927). Rests on the README's sources and on DLMF as read.

## Not verifiable

- Whittaker–Watson, Levitan–Sargsjan, Kato, Hale–Koçak, Arnold, Courant–Hilbert, Temme, Kristensson: no legal copy found (the publishers' pages are paywalled); their section and page locators in 1.1–1.4, 2.1, 2.3–2.5, 3.1–3.4, 4.1–4.4, 6.1–6.3, 7.1, 7.3, 7.4 were not checked.
- DLMF was read through a text rendering that loses radicals and nested fractions; the layout of 28.6.16–28.6.19 and of 28.4.24–28.4.27 was not confirmed from the page. DLMF 28.5, 28.15, 28.19, 28.22–28.25 and 28.28 were not reopened in this round; the previous review read them.
- Not recomputed: the quadrature values of the two Examples of Layer 8, the values of `M^{(3)}_0` in 8.1, the term sizes in 8.4, the values of `C_n`, `S_n` in 4.3, the Check of 3.3 for the translated `Q`.

Automatic checks set aside as false positives: the report of a section heading of `Suggested.lean` with no declaration under it; the heading stands over the `#check` lines that pin the library declarations the README names, which the form allows.

## Source issues

- **Gap** in DLMF at §28.2(i), the sentence after 28.2.2, as read online on 2026-11-20: the source says the equation has an irregular singular point at infinity, with no condition; it should require `q ≠ 0`, since for `q = 0` infinity is a regular singular point with exponents `±√a/2`; affects a stated result.
- **Error** in DLMF at §28.20(iii): the source says the solutions of 28.20.2 are asymptotic to the square root of ζ times an exponential; it should be `ζ^{−1/2} e^{±2ihζ}`, as the rank-one exponent `μ = −½` gives; affects a stated result.
- **Misprint** in DLMF at 28.6.16 read at `n = 0`: the source says the empty head leaves `a = −q²/(4 − a − ⋯)`; it should be `−2q²/(4 − a − ⋯)` (`−0.12177` against `−0.06088` at `q = 0.5`); affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's `lean-DLMF` (Apache-2.0) and that "reused code carries attribution"; I did not compare `Suggested.lean` with that repository.
- **Not tested.** The eight cited books could not be read, so wording and locators were compared with DLMF only; DLMF has the largest share of the locators (213 of 293 mentions) and was read through a text rendering.
- **Scope.** The roadmap states corrected forms of eight DLMF formulas (Conventions, "Corrections to DLMF"), and this review adds a gap at §28.2(i); whether to report them to NIST is not the roadmap's matter.
