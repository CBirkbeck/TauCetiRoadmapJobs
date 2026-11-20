# Review of SpecialFunctionsMathieu (pull request #2538 at ef3be59)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the integral identity DLMF 28.28.11 for `Mc^{(3)}_n`, as stated in 8.5 and in `integral_exp_mul_mathieuCe`, is false on part of the region that its hypothesis 28.28.10 allows, because the hypothesis sees only `cosh z` and `Mc^{(3)}_n` is neither even nor `2πi`-periodic. The three findings of the previous review are repaired, every numerical Check I recomputed agrees with the README, and the file elaborates with `sorry` as its only warning. There are three small corrections and one format note, none blocking; a licence point and the unread books are left to the human reviewers.

## R01 (P2) — The identity `∫₀^∞ e^{2ih cosh z cosh t} ce_n(it, h²) dt = ½πi iⁿ ce_n(0, h²) Mc^{(3)}_n(z, h)` fails on part of the region 28.28.10 allows

In 8.5 (`TauCetiRoadmap/SpecialFunctionsMathieu/README.md`, lines 1541–1544) the identities 28.28.11–28.28.14 and the integer-order form are stated "under 28.28.10", and `integral_exp_mul_mathieuCe` (`Suggested.lean`, lines 682–688) takes exactly `0 < arg (h (cosh z ± 1)) < π` as its hypotheses. An implementer is asked to prove a false statement, and a consumer could apply the identity at points where it does not hold.

For `h > 0` each of the four hypotheses says the same thing, `Im cosh z > 0`, that is `sinh(Re z) sin(Im z) > 0`. This region has many components (`Re z > 0`, `2kπ < Im z < (2k+1)π`, and `Re z < 0`, `(2k−1)π < Im z < 2kπ`) and is invariant under `z ↦ −z` and `z ↦ z + 2πi`, and the left side depends on `z` through `cosh z` only. The right side does not: `Mc^{(3)}_n(·, h) = α Ce_n + β Fe_n` with `β ≠ 0` (if `β = 0` then `Mc^{(3)}_n(x)/α` would be real on `ℝ`, against its behaviour `H^{(1)}_n(2h cosh x)`), `Ce_n` is even and `Fe_n` is odd, so `Mc^{(3)}_n(−z) − Mc^{(3)}_n(z) = −2β Fe_n(z)`. The statement at `z₀` and at `−z₀` therefore forces `Fe_n(z₀, h²) = 0`. At the README's own test point `n = 0`, `h = 1`, `z₀ = 1 + 0.5i`: `Im cosh z₀ = Im cosh(−z₀) = 0.56342`, and the odd solution of the modified equation with `a = a₀(1)`, slope `1` at `0`, is `1.02304 − 0.29316 i` at `z₀`, not `0`. So the statement is false at `z₀` or at `−z₀`. The same holds for `z₀ + 2πi`, by the remark of 8.4 that `Mc^{(2)}_0` is not `2πi`-periodic.

On the component `Re z > 0`, `0 < Im z < π` the identity is the right one: both sides solve the modified equation, are recessive as `Re z → +∞`, and their leading terms agree (both are `ce_n(0, h²) e^{iX} e^{iπ/4} (π/(2X))^{1/2}` with `X = 2h cosh z`), which is also what confirms `iⁿ` against DLMF's `e^{inπ}`. The smallest repair: in 8.5 state 28.28.11–28.28.14 and the integer-order bullet "for `Re z > 0` and `0 < Im z < π`" (which implies 28.28.10), and in Lean replace `hz₁ … hz₄` by `0 < z.re`, `0 < z.im`, `z.im < π`. DLMF has the same gap; it is listed under Source issues.

## C01 — `fe_n(·, 0)` and `ge_n(·, 0)` for `n ≥ 1` are `sin nz`, `cos nz` in the README and `0` in `Suggested.lean`

Conventions (README line 243) says "At `q = 0` the values are those of DLMF 28.5.7: `fe_0 = z`, `fe_n = sin nz`, `ge_n = cos nz`", with `C_n(0) = S_n(0) = 0`. `mathieuFe n q z` is `mathieuFeC n q * (z * mathieuCe n q z + mathieuFeF n q z)` with no case for `q = 0` (`Suggested.lean`, lines 505–510), so `mathieuFe n 0 = 0` and `mathieuGe n 0 = 0` for `n ≥ 1`. No stated theorem is affected (`0` and `sinh nz` both solve the modified equation in `isModifiedMathieuSolution_modifiedMathieu`), but the two files define different functions under one name, and only the README's is continuous at `q = 0`, as 4.3 proves. Add the case `q = 0` to the two Lean bodies (`z`, `sin (n z)`, `cos (n z)`), or say in Conventions that the values at `q = 0` are limits and not part of the definition.

## C02 — The expansion theorem of 6.1 and the exceptional set of 7.4 are statable with the file's definitions and are not stated

The module docstring says the remaining prose targets "are statable with the definitions below and are left to the README". Two of them are results the overview names and a whole layer or section is built for: the Hilbert basis and uniform expansion of 6.1 (statable with `IsHillSolution`, `hillPeriodicEigenvalue`, `hillAntiperiodicEigenvalue`), and "the exceptional set is closed, discrete and disjoint from `ℝ`" of 7.4 (statable with `mathieuWI`). Layer 6 has no Lean statement at all. Would the author state these two, or say in the docstring why they are not acceptance tests?

## C03 — In the sketch of 7.4 the discriminant that is "nonzero on `ℝ`" belongs to a polynomial defined only near `q₀`

The sketch (lines 1336–1341) builds `P(a, q)` from "the finitely many others, near a given `q₀`" and then uses that "its discriminant is holomorphic and nonzero on `ℝ`". For a non-real `q₀` a polynomial defined near `q₀` has no values on `ℝ`, so the step does not exclude a discriminant vanishing identically near `q₀`. Taking `P` on the whole disc `|q| < R` makes it work: by the Rouché step the number of roots with `Re a` below the chosen bound is constant on the disc, the discriminant is holomorphic there and nonzero on its real points, hence not identically zero. One clause ("for `|q| < R`" in place of "near a given `q₀`") repairs the sentence.

## N01 — Three lines exceed 100 characters

`Suggested.lean` line 38 (182 characters, in the module docstring) and line 696, and README line 351.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Wronskian, values (`hillWI_mul_deriv_hillWII_sub`) | `Q = −2cos 2x`, `λ = 1.5`; DLMF 28.29.1–5 read | `w_I(π) = −1.5637429712`, same as Mathieu `w_I(π;1.5,1)` | agrees | none |
| 1.3 half-period identities, `mathieuWI_pi_neg` | `q = 0`; DLMF 28.2.7–13, 28.2.16 read | `cos πs − 1 = −2 sin²(πs/2)`; `w_I′(π) = −s sin πs` both sides | agrees | none |
| 1.4 conformal Laplacian, separation, algebraic forms | chain rule; rank-one data | `ΔF = −4q·abs(sinh w)²F`; 28.2.2 after dividing by 4; `λ = ±2ih`, `μ = −½` | agrees | none |
| 2.3 `tendsto_det_one_add_of_summable`, Hill's formula | empty minor; `q = 0`; `(1.5, 1)`, `(3, 1)` | `∑_s ∏_{i∈s} r_i = ∏(1 + r_i)`; `w_I(π) = −1.5637429712`, `0.5133105431` | agrees | none |
| Layer 2 Example, pole of `D` at `0` | `b₂(q) = 0`; `q*` | zero of `w_II(π/2; 0, q)` at `7.5796903737`; `w_I′(π/2; 0, q*) = 1.5·10⁻⁸` | repaired | none |
| 2.4 `ince_theorem` | complex `q ≠ 0`; DLMF §28.5(i) read | Casoratian `A₂B₄ − A₄B₂ = 0` and rows `m = 1` give `2q A₀ B₂ = 0` | sound | none |
| 3.2 `deriv_hillDiscriminant`, growth, bands | `Q = 0`; variation of constants | integrand `sin(πs)/s`; `Δ′ = −π sin(πs)/s` both sides; form discriminant `Δ² − 4` | agrees | none |
| 3.3 interlacing, gaps, zeros | `Q = 0`; `q = 1`; `Q = −2cos(2x + π/4)` | `0,4,4`, `1,1`; `ν₁ = 0.0139746`, `τ₁ = 1.8587335`; `Δ(−0.0602) = −2.4016643`, product `−0.8596687` | agrees | none |
| 3.4 `mathieuA`, `mathieuB`, `hillEigenvalue_mathieu` | `q = 0`, `q = 1` | roots `0,4,16`; `1,9`; `a₀ = −0.4551386041`, `b₁ = −0.1102488170`, `a₁ = 1.8591080725` | agrees | none |
| 3.5 `mathieuLambda`, 7.2 `tendsto_mathieuLambda_one` | `ν = 0.5, 1.5, 2.5, 0.999, 1.001`; `q = 0` | `−0.3072853506`, `2.5371800871`, `6.3484471759`, `−0.1102499881`, `1.8591111753`; indices `0, 1` for `ν²` | agrees | none |
| 4.1 normalization, zeros, 28.2.34 | `q = 1`; `q = 0` counts | `ce₀(0,1) = 0.3848278293`, `ce₁(0,1) = 0.8565984656`, `se₁′(0,1) = 0.6864418975`; `n` zeros each | agrees | none |
| 4.3 `mathieuFeC_odd_neg`, `C₀` | `q = ±0.5, ±1.5`; `q → 0` | `C₁(−0.5) = −0.4941874 = −S₁(0.5)`; `C₁(−1.5) = −1.3580174`; `C₀ = 14.2939, 56.6066, 282.8503`; `2√2/q` | agrees | none |
| Conventions, `mathieuFe`, `mathieuGe` at `q = 0` | `n ≥ 1` | README `sin nz`, `cos nz`; Lean `0·(…) = 0` | differ | C01 |
| 4.4 `mathieuMeRaw`, `integral_mathieuMe_mul_neg`, `mathieuCeNu_im_eq_zero` | Floquet multiplier; `ν = ±n` | `w(π) = e^{iπν}`, `w′(π) = c e^{iπν}`; `2∫₀^π ce² = π`; `(−√2 i)²(−se²) = 2se²` | agrees | none |
| 5.1 `whittakerHill_of_ince`, 5.2 | substitution; `p = 1`; DLMF 28.31.16–24 read | coefficient `η − (p+1)ξ cos 2z − ξ² sin² 2z/4`; residual `(η − 1 − ξ) cos z`; `hc¹₁(z, −ξ) = hs¹₁(π/2 − z, ξ)` | agrees | none |
| 6.1 expansion theorem, 6.4 | DLMF 28.30, 28.19 read; `ν = 0` | hypotheses on `f` imply DLMF's; `me_{2n}` = `√2 ce_{2n}`, `−√2 i se_{2n}` complete for period `π` | agrees | C02 |
| 6.2 nonvanishing of `A^{2m}_0` | moment argument | `cos²` injective on `[0, π/2]`, polynomials in it dense; `ce_{2m}(π/2) ≠ 0` from `w_I′(π/2) = 0` | sound | none |
| 7.1 `exists_analyticAt_mathieuA_zero` | `q = 0.1` | `−0.005 + 5.46875·10⁻⁶ − 1.2587·10⁻⁸ = −0.0049945438`; `F⁗(0) = 24·7/128` | agrees | none |
| 7.3 `tendsto_mathieuTail_mathieuA_zero` | `q = 0.5, 2`, 40 levels; recurrence | `−2T = −0.1217655449 = a₀(0.5)`; `−1.5139568851 = a₀(2)`; printed form `−0.0608827725` | agrees | none |
| 7.4 exceptional values | sketch read | local `P` has no real points for non-real `q₀`; on `abs(q) < R` it has | sketch gap | C03 |
| 7.5 sum rules | Gershgorin step; tails at `q = 1` | `6M > 4 + 5·abs(q)`; `tr A_t = ∑(2n)² − q²/(2M)`; tail `1/(8·60) = 0.00208` | agrees | none |
| 8.1 `modifiedMathieuM`, `isModifiedMathieuSolution_modifiedMathieu` | `n = 0` for `Se`, `Ge`; `h ≤ 0`; `ν = −n` | `Se₀ = 0`; `Ge₀ = c·w_I(iz; 0, q)`; either branch a solution; `H⁽¹⁾_{−n} = (−1)ⁿ H⁽¹⁾_n` | sound | none |
| 8.2 `tendsto_norm_modifiedMathieuM_three` | `h = √2`; DLMF §28.20(iii) read | `abs(H⁽¹⁾_ν(2h cosh x)) ≈ (πh cosh x)^{−1/2}`; `(π√2)^{−1/2} = 0.474425` | agrees | none |
| 8.3 joining factors | DLMF 28.22.1–14 read | denominators `A^{2m}_0`, `A^{2m+1}_1`, `B^{2m+1}_1`, `B^{2m+2}_2`, those of 6.2 | agrees | none |
| 8.4 `not_summable_besselJ_series` | `ν = ½`, `q = 1`, `z = i`; DLMF 28.23 read | term ratio per 3 steps: asymptotic `40.2·(6/9)^{1.5} = 21.9`, `40.2·(9/12)^{1.5} = 26.1`; README `21`, `26` | agrees | none |
| 8.5 `integral_exp_mul_mathieuCe` | `z₀ = 1 + 0.5i`, `−z₀`, `n = 0`, `h = 1` | `Im cosh(±z₀) = 0.56342`; odd solution at `z₀`: `1.02304 − 0.29316i ≠ 0`; leading terms agree on `Re z > 0`, `0 < Im z < π` | false off that component | R01 |
| 8.5 corrected 28.28.16 | `n = 0`, `y = 0`, `h → 0`; `y ↦ π − y`, `y ↦ −y` | left `(π/2) J₀(2h)/√2 > 0`; right `+K ce₀(0)`, `K > 0`; odd and even as required | agrees | none |
| `besselJLog`, `differentiable_besselJLog` | Mathlib body of `besselJ` | `(e^L/2)^μ · exp(μ(L − log e^L)) = exp(μ(L − log 2))` | sound | none |

- Earlier findings: R01 (pole of `D` at `0`) repaired, "exactly when `w_I(π; 0, q) ≠ 1`" (line 701); R02 (gap sketch) repaired, "`|Δ| = |w_I(π) + 1/w_I(π)| ≥ 2`" (line 796); R03 (two owners) repaired, Pincherle and the Hilbert–Schmidt kernels are now supplier contracts. Earlier corrections: unused definitions, unused periodicity, the Puiseux bullet and the namespace repaired; targets given by DLMF number alone partly (5.2, 6.4, 28.28.17 now written out; 8.3 and 28.28.24–49 still by number); unstated statable targets carried as C02.
- Source locators checked against the text: 12 DLMF sections read online (28.2, 28.5, 28.6, 28.12, 28.19, 28.20, 28.22, 28.23, 28.28, 28.29, 28.30, 28.31), covering the DLMF locators of all fifteen sampled targets; no book could be read.
- Library declarations opened at the pin: `InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane` (`Mathlib/Analysis/InnerProductSpace/Laplacian.lean:231`); the 34 `#check` lines elaborate; no Floquet, Hill or Mathieu-function declaration, `besselY` or Hankel function exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §§10.2–10.4; SpecialFunctionsBessel Conventions, 1.2, 1.3, 1.6, 4.1, 4.2, 6.1, 6.2, 10.1, its Sturm comparison (README line 134) and its consumer entry; SpecialFunctionsEiLiErfIncompleteGamma §4.1; AutomorphicSpectralTheory §0.8; OperatorTheory/UnboundedOperators §4.8. The local `besselY`, `hankelH1`, `hankelH2` have the bodies of SpecialFunctionsBessel's `Suggested.lean`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 46 warnings, all `declaration uses sorry`, and no error. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 46 theorems closes. Each elaborated signature was compared with its README statement; no binder is lost.
- Dependency check: `depcheck: 187 roadmaps, 2142 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder. Its description agrees with the head (four suppliers, 46 theorems, eight layers).
- Numerical values recomputed with a fourth-order Runge–Kutta integrator and bisection: the Checks of 1.1, 1.2, Layer 2 Example, 3.3, 3.4, 3.5, 4.1, 4.3, 7.1–7.3.

Overlap check: read SpecialFunctionsHeun, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsBessel, and searched every roadmap for Floquet theory, Hill's equation and Mathieu functions; nothing shared. Sturm comparison: owner SpecialFunctionsBessel (cited); Pincherle's theorem: owner SpecialFunctionsEiLiErfIncompleteGamma §4.1 (cited); Hilbert–Schmidt kernels: owner AutomorphicSpectralTheory §0.8 (cited). SpecialFunctionsHeun names Mathieu's equation only as an example of a confluent Heun equation.

Source independence: 9 passages compared with 1 source (DLMF: Ince's theorem, the sign rule after 28.5.7, §28.12(i), the hypotheses of 28.19 and of 28.30, the validity sentences of 28.23, §28.20(iii), the conditions of 28.29(i), the index conditions of 28.31.22–24), none shared beyond formulas and two short attributed quotations; largest share DLMF, 212 of 292 source mentions; contents compared with DLMF Chapter 28: independent (Layer 1 draws on 28.2, 28.20, 28.29; Layer 3 on 28.2, 28.12, 28.29; Layer 6 on 28.10, 28.11, 28.19, 28.30; Layer 5 is 28.31 placed before them); the eight books could not be read.

Research link: Hill's discriminant, bands and gaps (Layer 3) are the spectral theory of periodic Schrödinger operators as in Levitan–Sargsjan 1991 and Kato 1995; the Mathieu and modified Mathieu functions are DLMF Chapter 28 and separate the Helmholtz equation in elliptic coordinates (Whittaker–Watson 1927). Rests on the README's sources and on DLMF as read.

## Not verifiable

- Whittaker–Watson, Levitan–Sargsjan, Kato, Hale–Koçak, Arnold, Courant–Hilbert, Temme, Kristensson: no legal copy found (publisher pages paywalled or not open); their section and page locators in 1.1, 1.3, 1.4, 2.1, 2.3–2.5, 3.1–3.4, 4.1–4.4, 6.1–6.3, 7.1, 7.3, 7.4 were not checked.
- DLMF was read through a text rendering of the pages, which loses radicals and stacked fractions; the place of `C_{2n}(h²)` in 28.28.16 (numerator or denominator) was not confirmed from the page. DLMF 28.4, 28.7, 28.9–28.11, 28.14, 28.15, 28.24, 28.25 were not opened.
- Not recomputed: the values of `M^{(3)}_0` in 8.1, the term sizes in 8.4, the quadrature values of the two Examples of Layer 8, the sums of 7.5, the exceptional values of 7.4.

Automatic checks set aside as false positives: the report of a section heading of `Suggested.lean` with no declaration under it; the heading stands over the `#check` lines that pin the library declarations the README names, which the form allows.

## Source issues

- **Gap** in DLMF at 28.28.10–28.28.14, as read online on 2026-11-20: the source says the integrals equal multiples of `M^{(3)}_ν(z, h)` whenever the phases of `h(cosh z ± 1)` lie in `(0, π)`; it should also restrict `z` to `Re z > 0`, `0 < Im z < π`, since the condition is invariant under `z ↦ −z` and `M^{(3)}_ν` is not; affects a stated result.
- **Error** in DLMF at §28.20(iii): the source says the solutions of 28.20.2 are asymptotic to the square root of ζ times an exponential; it should be `ζ^{−1/2} e^{±2ihζ}`, as the rank-one exponent `μ = −½` gives; affects a stated result.
- **Error** in DLMF at 28.5.6, second relation: the source says `C_{2m+1}(−q)` equals `S_{2m+1}(q)`; it should be `−S_{2m+1}(q)` under the sign rule stated after 28.5.7 (`C₁(−0.5) = −0.49419`, `S₁(0.5) = 0.49419`); affects a stated result.
- **Gap** in DLMF at 28.5.5 with 28.5.7: the source normalizes `C_n² ∫ f_n² = π` with no restriction while giving `fe₀(z, 0) = z`; it should exclude `n = 0`, `q = 0`, where `f₀ = 0`; affects a stated result.
- **Misprint** in DLMF at 28.6.16 read at `n = 0`: the source says the empty head leaves `a = −q²/(4 − a − ⋯)`; it should be `−2q²/(4 − a − ⋯)` (`−0.12177` against `−0.06088` at `q = 0.5`); affects a stated result.
- **Error** in DLMF at 28.23.3 and 28.23.5 (validity sentences, covering 28.23.2–28.23.5): the source says the `j = 1` series hold for all `z`; it should require `|cosh z| > 1` (resp. `|sinh z| > 1`) when `ν ∉ ℤ`; affects a stated result.
- **Misprint** in DLMF at 28.28.11: the source says the factor is `e^{iνπ}`; it should be `e^{iνπ/2}`, as in 28.28.12 and as the leading terms of both sides at large `Re z` require; affects a stated result.
- **Error** in DLMF at 28.28.16: the source prints an overall minus sign and assigns the lower sign to `π ≤ y ≤ 2π`; it should have no minus sign (at `n = 0`, `y = 0`, small `h` the left side is positive) and the lower sign on `−π ≤ y ≤ 0`; affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's `lean-DLMF` (Apache-2.0) and that "reused code carries attribution"; I did not compare `Suggested.lean` with that repository.
- **Not tested.** The eight cited books could not be read, so wording and locators were compared with DLMF only; DLMF has the largest share of the locators (212 of 292 mentions) and was read.
- **Scope.** The roadmap states corrected forms of seven DLMF formulas (Conventions, "Corrections to DLMF"), and this review adds an eighth gap (28.28.10); whether to report them to NIST is not the roadmap's matter.
