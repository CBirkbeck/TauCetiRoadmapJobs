# Review of SpecialFunctionsBessel (pull request #1987 at 8e37c64)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the statement on the zeros of the cross-product of derivatives (10.6, DLMF 10.21.49 with 10.21.52) is false at `ν = 0`, where the indexing is off by one; the error is DLMF's and is carried over. The eight findings of the previous review are repaired in the README (one of them only in the description). There are five small corrections and no format note. Two matters are left to the human reviewers: the six books could not be read, and the relation to the author's `lean-DLMF`.

## R01 (P2) — 10.6: at `ν = 0` the `m`th positive zero of the cross-product 10.21.49 does not have the expansion 10.21.50 with the coefficients 10.21.52

An implementer who states 10.6 as written proves a false asymptotic at `ν = 0`: the expansion is off by `π/(λ − 1)`, not by a small remainder. The sentence is in 10.6 (README line 1572): "for `ν ≥ 0` and `λ > 1`: the `m`th positive zeros of the cross-products 10.21.48 and 10.21.49 have the expansions 10.21.50 with the coefficients 10.21.51 and 10.21.52". In 10.21.52, `α = (m − 1)π/(λ − 1)`.

Since `J′₀ = −J₁` and `Y′₀ = −Y₁`, the function 10.21.49 at `ν = 0` is the function 10.21.48 at `ν = 1`, whose `m`th positive zero has `α = mπ/(λ − 1)` by 10.21.51 (and at `μ = 4` the `p`, `q`, `r` of 10.21.51 equal those of 10.21.52 at `μ = 0`). Computed at `λ = 2`: for `ν = 0` the positive zeros of 10.21.49 are `3.196578`, `6.312350`, `9.444465`, and 10.21.50 with 10.21.52 gives `3.197081`, `6.312355`, `9.444465` at `m = 2, 3, 4`, so the formula's `m` is the `(m − 1)`th zero. For `ν > 0` there is one more zero near the origin and the count is right: at `ν = 0.05` the zeros are `0.033989`, `3.196795`; at `ν = 0.3`, `0.203867`, `3.204373`, `6.316035` against `3.204694`, `6.316038` at `m = 2, 3`; at `ν = 1`, `0.677336`, `3.282471` against `3.281477` at `m = 2`. The same holds at `λ = 1.5`. The route explains it: the phase `φ_ν` of 6.4 has `φ′_ν < 0` on `(0, ν)`, so `φ_ν(λx) − φ_ν(x)` returns to `0` once when `ν > 0` and never when `ν = 0`.

The smallest change: state 10.21.49 with 10.21.52 for `ν > 0`, and add that at `ν = 0` the cross-product 10.21.49 is 10.21.48 at order `1`, so its `m`th positive zero has `α = mπ/(λ − 1)` with the coefficients 10.21.51 at `μ = 4`. The values above at `ν = 0` and `ν = 0.3`, `λ = 2`, would make a Check and a negative control.

## C01 — 8.1: 10.16.3–10.16.4 are SpecialFunctionsParabolicCylinder 9.6 solved for `J_{±1/4}`, `J_{±3/4}`, and 8.1 does not say so

8.1 lists "the parabolic cylinder forms 10.16.3–10.16.4 for `z = x > 0`, through `W(0, ±2x^{1/2})` and its derivative" as targets, with only the roadmap's name in the *Needs* line. SpecialFunctionsParabolicCylinder on main already owns the same two identities in the other direction: its 9.6 (README lines 1238–1245) states DLMF 12.14.13–12.14.14, `W(0, ±x) = 2^{−5/4} √(πx) (J_{−1/4}(x²/4) ∓ J_{1/4}(x²/4))` and the derivative forms, for `x > 0`. Putting `x ↦ 2x^{1/2}` and subtracting gives 10.16.3 exactly; at `x = 1.7` both give `J_{1/4}(1.7) = 0.5383636501`.

A sentence would settle it: "10.16.3–10.16.4 follow from SpecialFunctionsParabolicCylinder 9.6 (12.14.13–12.14.14) at `x ↦ 2x^{1/2}` by adding and subtracting the two signs", with "SpecialFunctionsParabolicCylinder 9.6" in the *Needs* line.

## C02 — 8.2: DLMF 9.12.23 is a Cauchy principal value for `Gi`, and neither `Gi` nor the principal value is named

8.2 owns "DLMF 9.12.22–9.12.23, the Scorer integrals of `K_{1/3}`". 9.12.22 is an ordinary integral for `Hi(−z)`, `|ph z| < π/3`; 9.12.23 gives `Gi(x)` for `x > 0` as a principal value, the denominator `ζ² − t²` vanishing at `t = ζ`. The supplier contract (README lines 401–404) names `TauCeti.scorerHi` but not `TauCeti.scorerGi`, and the Conventions define improper and Bochner integrals only. As written, 9.12.23 has no carrier and no meaning for its integral.

Add `TauCeti.scorerGi` to the list consumed from SpecialFunctionsAiry (its Conventions, README line 142), and say in 8.2 that 9.12.23 is the limit of the integral over `(0, ζ − ε) ∪ (ζ + ε, ∞)` as `ε → 0+`.

## C03 — "Beyond this roadmap": the Legendre-function formulas are not assigned to the Legendre roadmap by that roadmap

The item on formulas through other functions says (README line 1850) "They belong to the Struve, confluent hypergeometric and Legendre roadmaps". SpecialFunctionsLegendre, at the head of its open pull request, does not take them: its Downstream consumers (README lines 1594–1595) give DLMF 10.22.66, 10.22.71, 10.22.72 and 10.43.22 to "a roadmap that consumes this one and SpecialFunctionsBessel", and it does not mention 10.54.4–10.54.5. A reader who follows the pointer finds no owner.

Say instead that the formulas through Legendre functions (10.22.66, 10.22.71–10.22.72, 10.43.22, 10.54.4–10.54.5) belong to a roadmap that consumes SpecialFunctionsLegendre and this one.

## C04 — The description still asks to merge after eight pull requests that are all merged

The description says "**Merge after #1857, #1801, #1924, #1928, #1126, #925, #117 and #2089.**" and repeats "Depends on #…" for each. All eight roadmaps (AsymptoticExpansions, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsAiry, AnalyticNumberTheoryPartI, AutomorphicSpectralTheory, LaguerreJacobi, SpecialFunctionsHypergeometric) are on main with the sections cited, and main's history carries those eight numbers.

The text that would be right: "All eight suppliers are on main; this pull request depends on no open pull request", with the eight "Depends on" lines removed.

## C05 — Two roadmaps on main cite this roadmap by section numbers of an earlier head, and the README carries no map

`TauCetiRoadmap/SpecialFunctionsAiry/README.md` lines 1634–1639 cite "its 4.3", "its 3.1" and "its 11.1" (here 8.1, 5.1 and 8.2), and `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` line 1131 cites "8.2" (here 11.2) and does not name Gauss's sum, now consumed from its 4.2. The description states this and gives the full map, which I checked against the headings of the earlier head (for example former 4.3 "Relations to other functions", former 8.2 "Integrals over `(0, ∞)`"). After the merge the description is no longer beside the text, and a reader of those two roadmaps lands in Gegenbauer's addition theorem and in the Airy relations.

Either a short map in this README (a table headed "Former numbering", with at least `3.1 → 5.1`, `4.3 → 8.1`, `8.2 → 11.2`, `11.1 → 8.2`) or a revision of the two downstream paragraphs once this is merged would close it; the choice is the author's.

## Questions for the author

- 10.6, third cross-product (10.21.53): is the integer `m₀` ever nonzero? At `ν = 0, 0.3, 1, 2` and `λ = 1.5, 2` the `m`th positive zero already matches 10.21.50 with 10.21.54 (for example `ν = 1`, `λ = 2`: zeros `1.958511`, `4.857022`, `7.941288` against `1.874947`, `4.856921`, `7.941285`). I did not find a proof either way, so the statement with `m₀` is the safe one; if `m₀ = 0` always, the statement can say so.

## Verified sound

Values recomputed with mpmath (20 to 70 digits). "0" means below `10⁻¹⁵`. The Lean-shaped definitions (`deriv` in the order at integers, the entire series for the spherical functions) were coded separately and agree with mpmath's functions.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| Definitions of `besselY`, `besselK` (10.2.3–10.2.4, 10.27.4–10.27.5) | `ν = 0, 1, −2, 3, 0.3, 0.2 + 0.5i`; `z = 0.7 + 1.1i, −1 + 0.3i, 1.3` | `deriv` and quotient forms | mpmath `Y_ν`, `K_ν` | differences `< 10⁻²⁵` |
| 1.3 (sampled): `I_ν`, `K_ν`, 10.25–10.27 | `K_{1/2}(1 + 2i)`; `K_0(1)`, `I_0(1)`; DLMF 10.25.1–3, 10.27.1–11 read | `0.4210244382`, `1.2660658778` | README's values | agree; locators present |
| 1.6 (sampled), `hankelH2_neg`, 10.11.9, 10.34 | `ν = 0.3, 2, 0.2 + 0.5i`; `z = 1 + 2i, −1 + 0.3i`; control `z = 1 − i` | `H⁽²⁾_ν(−z) + e^{νπi} H⁽¹⁾_ν(z)` | `0`; control `4.007` | holds; hypothesis needed |
| `besselK_eq_hankelH1` (10.27.8) | `z = 2, 1.5i, 1 − 2i, −1 − 0.5i`; controls `z = −1.2`, `−1 + 0.5i` | `K_ν(z) − ½πi e^{νπi/2} H⁽¹⁾_ν(iz)` | `0`; controls `8.34`, `7.18` | holds on `ph z ≤ π/2` only, as DLMF states |
| 1.6 example, `Y_0(−x)` on the cut | `x = 1` | `Y_0(−1)` | `Y_0(1) + 2i J_0(1)` | difference `0` |
| `besselJ_mul_deriv_besselY_sub`, `besselI_mul_besselK_add`, `besselY_sub_one_add_besselY_add_one`, `besselY_ode` | `ν = 0.3, 0, −2, 0.2 + 0.5i`; `z = 0.7 − 1.1i` | each side | each side | differences `< 10⁻¹⁵` |
| 2.1 (sampled), 10.8.1–3, 10.31.1–3 | `Y_0(1)`, `K_0(1)`; DLMF text of 10.8.1, 10.8.3 read | `0.0882569642`, `0.4210244382` | README's values | agree |
| `tendsto_besselY_div_cpow` | `z = 10⁻⁷(1 + i)`; `ν = ½, 2, 0.3 + i` | `−0.56418958`, `−0.31830989`, `−0.046297 + 0.160703i` | `−Γ(ν)/π`: same to 4–8 digits | agrees |
| 3.1 (sampled), 10.47.3–10.47.11, `sphericalBesselJ_eq_besselJ`, `sphericalBesselJ_ode` | `n = 0, 1, 3`; `z = −1 + 0.5i, 0.3 − 2i` | five entire-series definitions | `(π/(2z))^{1/2}` times `J, Y, I, I, K` | differences `< 10⁻¹⁹`; `𝗃₁(1) = 0.3011686789` |
| 4.1 (sampled), `hasSum_besselJ_generating`, `hasSum_besselJ_sq` | `z = 1.2 − 0.7i`, `t = 0.4 + 0.9i` | bilateral sum | `e^{z(t − 1/t)/2}`; `1` | differences `0` |
| 4.3 (sampled), `hasSum_besselJ_gegenbauer` | `(ν, u, v, α) = (1, 2, 1, π/3)`, `(−½, 1.2 + 0.4i, 0.3 − 2i, 0.7 + 0.3i)`, `(−2.5, 1.5, 0.7, 0.4)` | 50 terms | `𝐅(ν + 1)(−w²/4)`; first `0.3345262388` | differences `< 10⁻¹⁶` |
| `hasSum_hankelH1_gegenbauer`, `hasSum_cexp_gegenbauer` | `(0.7, 2 + i, 0.5 + 0.4i, 0.9)`, `(0.3 + 0.6i, 1 − 3i, −1.5 + 0.2i, 0.5 + 0.2i)`; `(½, 1 + i, 0.4 + 0.3i)`, `(−1.5 + 0.2i, 2, 1.1)` | 60–70 terms | closed forms | differences `< 10⁻¹⁹`; `C_4^{(1/2)}(0.3) = 0.0729375` |
| 4.5 (sampled), `tendsto_convs_besselJ`, 10.33.1 | `(ν, z) = (−5, 1 + i)`, `(0.2 + i, −2 + 0.5i)`, `(0, 1)` | 80th convergent; `−5.92922 + 6.07206i` at the first | `J_ν/J_{ν−1}`, `I_ν/I_{ν−1}` | differences `< 10⁻¹⁸` |
| 5.4 Lambert's fractions (repair) | `n = 0`, `z = 1`; `n = 2`, `z = −1.3 + 0.4i` | `0.3579073841`, 4th convergent `0.3579072533`; `0.3130352855`, `0.3130352046` | README's values | agree; 60th convergent differs by `0` |
| 5.1, `besselJ_int_eq_integral`, `besselY_eq_schlafli`, `besselK_eq_integral`, `besselK_ofReal_eq_positiveAxisBesselK` | `n = −3`; `ν = 0.3, 2, 0.3 + 0.2i`; `z = 1.2 + 0.5i`; `x = 1.3` | integrals | `J`, `Y`, `K` | differences `< 10⁻¹⁵` |
| 5.3 (sampled), `besselJ_sq_add_besselY_sq`; 10.32.13, 10.32.17 read | same `ν`, `z` | `J² + Y²` | Nicholson's integral | differences `< 10⁻¹⁵`; conditions `\|ph z\| < π/2` as in DLMF |
| `isBigO_hankelH1_sub_sum`, `isBigO_besselK_sub_sum` | `ν = 0.3 + 0.4i`, `N = 3`; `\|z\| = 40, 400` at `ph z = π/2, ±0.95π, 0` | scaled remainders `0.094`, `0.097`, `0.098`, `0.58`; `K`: `0.15`–`0.16` | `\|a_3(ν)\|(2/π)^{1/2} = 0.098` | bounded |
| 6.3 paths (repair) | `ℓ = 1`: `z = −1 − i` horizontal ray; `z = −i`; `z = 1` vertical ray | `3π/4`; `π/2`; `π/2` | bounds `π`; `χ(1) = π/2`; `1` | agree; negative control holds; `χ(2) = 2` |
| `besselModulus_besselPhase`, `besselDerivModulus_besselDerivPhase` | `(ν, x) = (1.5, 4)`, `(½, 3)`, `(2, 1)`, `(0, 2)` | `J − M cos θ`, `J′ − N cos φ` and the sine forms | `0` | `< 10⁻¹⁵`; `θ_0(2) = 1.1573972372` |
| `norm_besselJ_le_one` | `ν ∈ {0, 0.1, ½, 1, 3}`, 401 points of `[−20, 20]`; `J_{1/2}(−π/2)` | maximum `1.0`; `0.6366i` | `1` | holds |
| 7.1 (sampled), `kelvin_ode`, `hasSum_kelvinBer` | `ν = 0.6`, `x = 1.4`; `ν = 0.3, −1.5, −2`, `x = 1.7` | residual of 10.61.3; series minus `ber_ν` | `0` | `< 10⁻²⁴`; `ber 1 = 0.9843817812`, `bei 1 = 0.2495660400` |
| 7.2, 10.63.2–10.63.4 (repair) | `(ber, bei)`, `ν = 1`, `x = 1`; `(ker, kei)`, `0.7`, `1.1`; `(bei, −ber)`, `0.4`, `2`; `(kei, −ker)`, `1.3`, `0.8` | `√2 f′_ν`: `−0.6741055576`, `0.2717851554`, `0.5996713758`, `0.3039377340` | both right sides: the same | agree; old form gives `0.5891615984` |
| `kelvinModulus_kelvinPhase`, `kelvinKModulus_kelvinKPhase` | `ν = ½`, `x = √2`; `ν = 1`, `x = 1.5`; `ker`: `ν = ½, 0, 1.7` | `θ_{1/2}(√2) = 1.5086751752`; `φ_{1/2}(√2) = −3π/8 − 1` exactly | closed form `1.5086751752`; quadrature `−2.17813` | agree (quadrature to `10⁻⁴`) |
| `besselJ_eq_kummer` | `ν = 0.3, −0.2 + 0.7i, −1.25`; `z = −0.5 + 0.8i` | `J_ν(z)` | Kummer form | differences `< 10⁻¹⁵` |
| 8.2 (sampled), `airyAi_eq_besselK`, 9.8.9–9.8.12 | `z = 1`, `1.5e^{0.6πi}`, `0.7e^{−0.3πi}`, `2e^{0.66πi}`; `x = −1.7` | local `airyAi`; `Ai = M sin θ`, `Ai′ = N sin φ` | mpmath `Ai`; `K_{1/3}` form; Bessel phases | differences `< 10⁻¹⁵`; see C02 |
| 8.3 and 8.1 (repair) | 12.7.10 at `z = 1.2e^{0.4πi}`; 10.39.3–4 at `z = 1.3e^{0.8πi}` | `0.9984159474 − 0.7136292986i` | the same | agree |
| 9.1 (sampled), `isBigO_besselI_debye` | `ν = 10, 40, 160`; `z = 10⁻⁶, 0.01, 1, 30, 10⁴`; `N = 1, 2` | scaled remainders, `N = 1`: `−0.0833, −0.0832, 0.0146, 0.0042, 1.2×10⁻⁵` | bounded in `ν` and `z` | holds; `U₂` from the recursion agrees; `I_{10}(10) = 21.8917`, leading term `21.8649` |
| `isBigO_besselI_debye_atTop`, `isBigO_besselK_debye_atTop` | `(ν, ℓ) = (1, 2), (0.4, 1), (3, 3)`; `z = 10, 100, 1000` | `I`: `0.0732, 0.0710, 0.0704`; `0.361, 0.317, 0.313` | `K`: `0.0601, 0.0695, 0.0702`; `−0.272, −0.308, −0.312` | bounded |
| 10.1 (sampled), `besselJZero_spec`; DLMF §10.21(i), §10.42 read | `j_{0,1}`, `j_{1,1}`, `y_{0,1}`, `j′_{0,2}`; `I_{−3/2}`, `I_{−5/2}` | `2.4048255577`, `3.8317059702`, `0.8935769663`, `3.8317059702` | zero of `I_{−3/2}` at `1.19968`; `I_{−5/2} > 0` | agree |
| `besselJZero_interlace`, `besselJZero_succ_sub_besselJZero`, 10.3 | gaps minus `π`: `ν = 0, 1, ½, −0.3, −0.7, −2.5, −0.8` | `−0.0263, +0.0423, 0, −0.0223, +0.0583, +0.3505, +0.1174` | sign of `\|ν\| − ½` | agree; `Δ³ j_{1,1} = 0.0183415704`, `Δ³ j_{0,1} = −0.0142405266` |
| `hasProd_besselJ`, `isBigO_besselJZero_mcmahon`, Rayleigh sums | `ν = 0.4`, `z = 1 + 0.5i`, 2000 factors; `ν = 2`, `m = 5, 20, 80` | residual `5.6×10⁻⁵`; scaled `−3.19, −3.17, −3.16` | `σ_2(1)`: `0.00520833290` against `1/192` | tail only; bounded |
| 10.6 (sampled) | `ν = 0, 0.05, 0.3, 1, 2`; `λ = 1.5, 2`; all three cross-products | zeros found by sign changes | 10.21.50 with 10.21.51, 52, 54 | 10.21.48 and 10.21.53 agree; 10.21.49 fails at `ν = 0`: R01 |
| 10.7 (sampled), `integral_besselJ_mul_besselJZero`, `tendsto_sum_fourierBessel` | `ν = −0.3, −0.7, −0.8`; `f = 1` and a step at `½`, `ν = 0`, `x = ½`, `N = 50, 200` | diagonal `0.1683472086`; sums `1.0117, 0.9971`; `0.4957, 0.4989` | `½ J′_ν(j)²` `= 0.1683472086`; `1`; `½` | agree; conditions as DLMF 10.23.18–20 |
| 10.8 (sampled) | `ν = 1`, `A = B = 1`; `ν = 0`, `A = −1`, `B = 1` | `∫₀¹ t J_1(λ₁t)² dt = 0.1347570620` | norm formula `0.1347570620`; without the factor `0.1580585886`; imaginary zero `1.6082794717` | agrees; interlacing follows from the partial fractions of 10.4 |
| `tendsto_integral_besselJ_mul_besselJ` (10.22.64) | `(μ, n, a, b) = (½, 1, 2, 1)`, `(½, 1, 1, 1)`, `(0, 0, 2, 1)`, `(0, 0, 1, 2)` | `0.3093592168`, `−0.5`, `0.5`, `0` | `0.3093592168`, `(−1)¹/2`, `1/a`, `0` | agree |
| 10.22.57 (repair) | `(μ, ν, λ, a) = (1, 1, 1, 1)`, `(0, 1, 1, 1)`, `(0.3, 0.9, 1.6, 1.3)`, `(1.5, −0.5, 0.8, 2)` | integral to `T = 400`: `0.49920`, `0.636618`, `1.201007`, `−0.09341` | `0.5`, `2/π`, `1.201013`, `−0.09506` | agree up to the tail `O(T^{−λ})` |
| `integral_cpow_mul_besselK`, `hasSum_planeWave`, `tendsto_integral_besselJ`, Bickley | `ν = 0.3 + 0.2i`, `μ = 1.5`; `z = 1 + i`, `α = 0.4 + 0.3i`; `ν = −½` | differences `10⁻²²`, `3×10⁻²¹`; Fresnel value `1` | `Ki₁(1) = 0.3282864782` both ways | agree |
| 11.3, 10.22.74 at `A = 0`, 10.22.75 | `(a, b, c) = (3, 2, 1)`, `ν = ½`; `ν = 0`, `b = 2`, `c = 1`, `a = ½, 4` | `(2/π)^{3/2} 6^{−1/2} π/8 = 0.0814337520` | README's value; `∓(−A)^{−1/2}/(2π) = −0.2485, +0.0621` | agree; see Source issues |
| 8.1, 10.16.3 against 12.14.13 | `x = 1.7` | `J_{1/4}(1.7) = 0.5383636501` | `W` form `0.5383636501` | agree: C01 |

- Source locators checked against the text: 33 DLMF sections of Chapters 9, 10 and 12 fetched (Release 1.2.8); every equation range cited for the 15 sampled targets is present, and the conditions of 10.10.1–2, 10.11.5, 10.11.9, 10.12.1, 10.17.15, 10.21(i), 10.21.48–54, 10.27.8, 10.32.9, 10.32.13, 10.32.17, 10.33.1, 10.34.7, 10.41.3, 10.41.12, 10.42, 10.47.1–11, 10.61.1, 10.61.5, 9.6.1–2, 9.6.15, 9.8.9–12, 9.12.22–23, 9.13.2, 9.13.4 and the real-argument bounds of §§10.17(iii), 10.40(ii) were read.
- Library declarations opened at the pins: `Mathlib/Analysis/SpecialFunctions/Bessel.lean` lines 55–123 (`Complex.besselJ` and 12 theorems), `TauCeti/Analysis/SpecialFunctions/BesselI.lean` lines 81–315, `TauCeti/Analysis/ODE/Wronskian.lean` line 31, `TauCeti/Analysis/Contour/Residue/Basic.lean` line 80. No pinned declaration of `Y_ν`, `K_ν`, the Hankel, spherical or Kelvin functions, Gegenbauer polynomials or Sturm comparison for differential equations; none of the 50 targets is proved at the pins.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §§1.5, 4.2–4.3, 5.4–5.5, 8.1–8.2, 8.6, 10.1–10.4, 11.1–11.4; AnalyticNumberTheoryPartI §§2.1a, 3.23b; AutomorphicSpectralTheory §0.25; LaguerreJacobi §§6.1–6.2; SpecialFunctionsAiry 1.4, 1.7, 4.1, 8.3, 9.3; SpecialFunctionsParabolicCylinder Conventions; SpecialFunctionsEiLiErfIncompleteGamma §4.1; SpecialFunctionsHypergeometric 1.2–1.4, 4.2. The three local copies in `Suggested.lean` (`positiveAxisBesselK`, `airyAi`, `gegenbauerC`) equal the suppliers' definitions.
- Dependency check: `depcheck: 220 roadmaps, 2377 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder. The automatic checks all passed.
- Elaboration of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 50 warnings, all `declaration uses 'sorry'`, no error. One-tactic probe (`rfl`, `simp`, `norm_num` on each of the 50 theorems, on a copy): none closes. Elaborated signatures compared with the README: no lost binder, generality equal.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsStruve, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsGeneralizedHypergeometric (open), SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsParabolicCylinder (main); one shared object: the `a = 0` relation between `W(0, ±x)` and `J_{±1/4}`, `J_{±3/4}`, owner SpecialFunctionsParabolicCylinder 9.6 (C01). 10.39.6–10.39.8, 9.6.21–9.6.24, 12.7.14 are SpecialFunctionsConfluent's; 10.22.2, 10.43.2 SpecialFunctionsStruve's; Sturm comparison is this roadmap's, cited from here by SpecialFunctionsConfluent and SpecialFunctionsLegendre.

Source independence: 23 passages compared with 1 source (DLMF Chapters 9, 10, 12), none shared beyond the 12-word stock phrase on first-neglected-term bounds in 6.3; largest share DLMF, about 725 of 990 locators; contents compared with DLMF Chapter 10: independent (only Layer 3 ↔ §§10.47–10.53 and Layer 7 ↔ §§10.61–10.71 coincide; the other nine layers each draw on both halves of the chapter). The six books could not be read.

Research link: 10.3 states the Lorch–Szegő higher monotonicity of zero differences (Andrews–Askey–Roy 1999, Theorem 4.15.1); 6.3 and 9.1 rest on Olver's (1974) error-bound theory; the `K`-Bessel kernels of AnalyticNumberTheoryPartI and AutomorphicSpectralTheory and the open Struve, confluent and Legendre roadmaps consume it. Rests on the README's sources and the cited roadmaps.

## Previous findings

- R01 (7.2, Kelvin derivative recurrence): repaired. "`√2 f′_ν = f_{ν+1} + g_{ν+1} + (ν√2/x) f_ν = −f_{ν−1} − g_{ν−1} − (ν√2/x) f_ν` (10.63.2)"; recomputed for all four pairs.
- R02 (6.3, paths of variation): repaired. "for `0 ≤ ph z ≤ π`, `L(z)` is the radial ray `t = zs`" and the horizontal ray below the axis, with the limit `R → ∞`; the variations and the rotated paths for `K` recomputed.
- R03 (5.4, 10.54.4–10.54.5): repaired. "DLMF 10.54.1–10.54.3 and 10.56.1–10.56.5", and the two formulas are in both exclusion lists (see C03 for where they are sent).
- R04 (LaguerreJacobi ids): repaired. "LaguerreJacobi §§6.1–6.2"; both sections are on main.
- R05 (10.55.1): repaired. Lambert's fractions are stated with their hypotheses and two Checks.
- R06 (sectors of 8.1, 8.3): repaired. "for `z` in the slit plane" and "for `|ph z| < π/2`".
- R07 (renumbering): partly. The description now names the two roadmaps on main and gives the map; the README has none (C05).
- R08 (10.22.57): repaired. It is a target of 11.2 with Gauss's sum from SpecialFunctionsHypergeometric 4.2.

## Not verifiable

- Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson: the sources service found no legal copy (Wiley answered HTTP 403, the Cambridge pages are not open, nothing for the other three). No page, equation or theorem locator into them was checked, which covers the book locators of all 15 sampled targets, among them Temme Theorem 9.3, Beals–Wong Theorem 7.2.1, Andrews–Askey–Roy Theorem 4.15.1, Lebedev (5.14.9)–(5.14.10) and Temme Exercise 9.5 for 10.8.
- DLMF §10.23: the sources service returned the section's figure, not its text. The conditions of 10.23.1–10.23.21 were read from the public page through a converted rendering, and 10.23.3, 10.23.8, 10.23.9 were also checked by computation.
- `check_roadmap_topics.py` (description) was not run.

## Source issues

- **Error** in DLMF-Bessel at §10.21(x), 10.21.49 with 10.21.52, Release 1.2.8: the source says the `m`th positive zero of the cross-product of derivatives has `α = (m − 1)π/(λ − 1)` for all `ν ≥ 0`; it should restrict this to `ν > 0`, the zero at `ν = 0` being the `(m − 1)`th; affects a stated result.
- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv): the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, since at `A = 0`, `ν = ½` the value is half the `A > 0` limit; affects a stated result.
- **Error** in DLMF-Bessel at §10.17(iv), the sentence before 10.17.15: the source says the paths of variation must have `|ℑt|` changing monotonically; it should require `ℑt` itself to be monotonic, since no path from the lower half-plane to `+i∞` meets the stated condition; affects a stated result.

## For the human reviewers

- **Not tested.** Wording, page locators and arrangement were compared with DLMF only. The six books the README cites (Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson) could not be read legally, so parts 1 and 2 of the copyright check were not run against them.
- **Licence.** The README (`## Prior formalization`) and the description name the author's `lean-DLMF` (Apache-2.0, `github.com/bjbraams/lean-DLMF`) as source material; `Suggested.lean` was not compared with that repository.
