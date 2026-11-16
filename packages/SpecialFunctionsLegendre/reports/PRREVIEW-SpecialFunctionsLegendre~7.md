# Review of SpecialFunctionsLegendre (pull request #2121 at acc2223)

**Verdict:** needs changes

## R01 (P1) — the Funk–Hecke formula is false for `θ₀` outside `(0, π)`

- **Location:** `TauCetiRoadmap/SpecialFunctionsLegendre/README.md` 3.4, lines 731–732: "For `f : ℝ → ℂ` continuous on `[−1, 1]`, `l : ℕ`, `m : ℤ` with `|m| ≤ l`, and real `θ₀, φ₀`"; `Suggested.lean` lines 254–259, `integral_funkHecke_sphericalHarmonic` (`(θ₀ phi₀ : ℝ)`, no hypothesis); README 3.1, line 663.
- **Claim:** the formula holds for every real `θ₀`.
- **Witness:** `f(t) = t`, `l = m = 1`, `θ₀ = −π/2`, `φ₀ = 0.3`: the left side is `1.38257 + 0.42768 i`, the right side `(4π/3) Y_{1,1}(θ₀, φ₀) = −1.38257 − 0.42768 i`. `𝖯¹₁(cos θ₀) = −|sin θ₀|`, while the kernel has `sin θ₀`.
- **Repair:** in 3.4 write "real `φ₀` and `0 < θ₀ < π`", and in the Lean statement replace `(θ₀ phi₀ : ℝ)` by `{θ₀ : ℝ} (hθ₀ : 0 < θ₀) (hθ₀' : θ₀ < π) (phi₀ : ℝ)` (at `θ₀ = π/2` both sides are `−1.38257 − 0.42768 i`; at `θ₀ = π`, `m = 0` the Lean right side is the junk `ferrersP l 0 (−1) = 0`). In 3.1 state the Check as "`Y_{1,1}(θ, φ) = −(3/(8π))^{1/2} sin θ e^{iφ}` for `0 ≤ θ ≤ π`" and add the negative control "for `sin θ < 0` the definition gives `−(3/(8π))^{1/2} |sin θ| e^{iφ}`, which is not the value of the harmonic at the point `(sin θ cos φ, sin θ sin φ, cos θ)`".

## R02 (P2) — the addition theorem and Herglotz's generating function are claimed for all real `θ`

- **Location:** README 2.5, lines 625–626: "the identity for all real `θ₁, θ₂, φ`, both sides being polynomials in `cos θ₁, sin θ₁, cos θ₂, sin θ₂, cos φ`"; README 3.2, lines 676–677: "for all real `t`, `r`, `θ`, `φ` and complex `λ ≠ 0`".
- **Claim:** 14.18.2 extends to all real `θ₁, θ₂`, and 14.30.8_5 holds for all real `θ`.
- **Witness:** `n = 1`, `θ₁ = −π/2`, `θ₂ = π/2`, `φ = 0`: the left side is `P₁(−1) = −1`; the right side is `0 + 2(−1) 𝖯^{−1}_1(0) 𝖯^1_1(0) = 2(−1)(½)(−1) = +1`. `𝖯^m_n(cos θ)` is `|sin θ|^m` times a polynomial, not a polynomial in `sin θ`.
- **Repair:** in 2.5: "the identity for `0 ≤ θ₁, θ₂ ≤ π` and real `φ` (there `𝖯^{±m}_n(cos θ)` is `(sin θ)^m` times a polynomial in `cos θ`, so both sides are polynomials in `cos θ₁, sin θ₁, cos θ₂, sin θ₂, cos φ`)". In 3.2: "for all real `t`, `r`, `φ`, `0 ≤ θ ≤ π` (DLMF's range for 14.30.1) and complex `λ ≠ 0`"; at `θ = −π/2` the coefficient of `t λ` is `+½ r e^{iφ}` on the left and `−½ r e^{iφ}` on the right.

## R03 (P2) — 14.17.9 needs `m ≤ n`

- **Location:** README 2.4, lines 594–598: "14.17.6–14.17.7 for `m ≤ n` (…), 14.17.8 for `m > 0` and 14.17.9 for `l > 0`".
- **Claim:** `∫₋₁¹ 𝖯^l_n 𝖯^{−m}_n (1 − x²)⁻¹ dx = (−1)^l δ_{l,m}/l` for all `l, m, n : ℕ` with `l > 0`.
- **Witness:** `(l, m, n) = (2, 2, 1)`: `𝖯²₁ = 0` (14.7.16), so the integral is `0`, against `(−1)²/2 = ½`. At `(1, 2, 1)` the integrand is `−(2 + x)(1 − x)^{1/2}/(6 (1 + x)^{3/2})`, not integrable at `−1`.
- **Repair:** "14.17.8 for `m > 0`, and 14.17.9 for `l > 0` and `m ≤ n` (for `m > n` it fails: at `(l, m, n) = (2, 2, 1)` the integral is `0`, not `½`, since `𝖯²₁ = 0`, and at `(1, 2, 1)` it diverges at `x = −1`)". At `(1, 1, 2)` the integral is `∫₋₁¹ −(3/2) x² dx = −1 = (−1)¹/1`. Add 14.17.9 to the description's list of corrected DLMF statements.

## R04 (P2) — Sturm's comparison theorem has a second owner among the open roadmaps

- **Location:** README Scope, lines 122–124, and 6.1, lines 1007–1012: "the zeros of a nontrivial real solution are simple and isolated; … Sturm's comparison theorem: let `Q₁ ≤ Q₂` on `I` …".
- **Claim:** this roadmap owns the comparison theorem and the simplicity of zeros for `(p y′)′ + Q y = 0`, `p = |1 − x²|`.
- **Witness:** SpecialFunctionsBessel (open, new roadmap), `TauCetiRoadmap/SpecialFunctionsBessel/README.md` lines 134–138, owns the same two statements for every `p > 0` of class `C¹` on an open interval; SpecialFunctionsConfluent line 202 consumes them from it.
- **Repair:** in 6.1 keep the separation theorem and the continuity of the zero count, and replace the first and third bullets by "the simplicity and isolation of the zeros and Sturm's comparison theorem are SpecialFunctionsBessel's auxiliary Sturm comparison (its Scope and ownership), applied with `p = |1 − x²|` and `Q = ±q`"; move both from "Auxiliary results owned here" to "What it does not own", add the contract under `## Exact supplier contracts` and the *Needs:* entry of 6.1, and name SpecialFunctionsBessel in the description's dependencies. (If the general statement is to live here instead, SpecialFunctionsBessel must cite 6.1; one of the two, not both.)

## R05 (P3) — 1.3 cites Whittaker–Watson §15·13 for the associated equation

- **Location:** README 1.3, line 415: "**The equation** (Olver, Ch. 5 (12.02), p. 169; Whittaker–Watson §15·13, p. 304; Lebedev (7.12.1), p. 192; …".
- **Claim:** §15·13, p. 304, states the associated Legendre equation.
- **Witness:** §15·13 (p. 304) has Legendre's equation of degree `n` only, with no order; the equation with the term `m²/(1 − z²)` first appears in §15·5, p. 324 (read in the 1920 third edition, whose sections and pages agree with every other locator checked).
- **Repair:** "Whittaker–Watson §15·5, p. 324 (and §15·13, p. 304, at `μ = 0`)".

## R06 (P3) — the Summary says which sources the order follows

- **Location:** README lines 8–13: "Its organization follows the structure of the subject rather than any one text. After the definitions and the equation, the integer degree comes first, as in Whittaker–Watson and Lebedev: … as in Olver's treatment".
- **Claim:** the order of the layers is presented as that of named sources, and the first sentence answers a question a later reader has not asked.
- **Witness:** the planning principle "a roadmap does not say it follows a source", and the house rule that the text is timeless; the layer order is already justified by the dependencies in "How to read the build".
- **Repair:** "After the definitions and the equation, the integer degree comes first: the polynomials, their contour and Laplace integrals, orthogonality and the addition theorem lead directly to the spherical harmonics and the Funk–Hecke formula. The local theory at the origin and at the singular points then yields the Wronskians and the connection formulas, and these carry the zeros, the second-kind recurrences, the integral representations from Schläfli's loop integrals, and the expansions."

## R07 (P3) — the module docstring names no headline that is not statable

- **Location:** `Suggested.lean` lines 16–19: "This file states the headline theorems of the roadmap … one or more per layer, as a check that the conventions of `README.md` can be stated. … the statements here are a selection of them."
- **Claim:** the docstring accounts for the headlines the file does not state.
- **Witness:** README 8.1, lines 1216–1217: "The contour is described in the text and is not given a Lean definition"; the description lists Schläfli's loop integrals for `P_ν` and `Q_ν` among the results beyond DLMF.
- **Repair:** add to the docstring: "Not statable here: Schläfli's loop integrals for `P_ν` and `Q_ν` of general degree (8.1), whose integrand is continued along a closed contour around `1` and `z` (a figure-eight around `±1` for `Q_ν`); the file states the form of `Q_ν` collapsed onto `[−1, 1]` and the circle integral for `Pₙ`."

## Previous findings

- R01 of the review of `ba0e38a` (the description's list omits §14.2(iii)): repaired. The description now has "the recessiveness statements of §14.2(iii) and §14.21(ii): a solution is recessive at `1` only for `Re μ > 0` or `μ = 0` …".
- R02 of that review (the description says Tau Ceti has no spherical harmonic): repaired. The description now has "their restrictions to the sphere (`MvPolynomial.sphereEval`, `MvPolynomial.harmonicSphereRestriction`)" and "or the spherical harmonics `Y_{l,m}(θ, φ)` in spherical coordinates".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definitions, Checks | `(ν, μ) = (0.3, 0.4)`; `x = 0.25`, `z = 1.5 + 0.7i`, `2` | `𝖯 = 0.5148944337`, `𝖰 = −0.9930177857`, `P = 0.9901291610 + 0.0152491041i`, `𝑸 = 0.3551867693`, `Q = 0.0997310496 + 0.3069406095i` | agree with the README | — |
| `𝐅` (local copy) | uniqueness of the continuation | entire in `b` fixes all `b` for `Re c > 0`; entire in `c` then fixes all `c`; text identical to the supplier's `Suggested.lean` lines 51–70 | determined | — |
| 1.2 `olverLegendreQ_neg_order` | `z = −0.5 + 0.5i` (side `Re z < 0`) | both `−0.7085331091 − 0.4968230273i` | holds | — |
| 1.2 `ferrersP_conj`, `differentiable_ferrersP_degree` | base `(1 + z)/(1 − z)` on `D` | Möbius image of `D` is `slitPlane`, so `cpow` commutes with conjugation; `𝐅` entire in parameters | holds | — |
| 1.3 equation, exponents, Abel (sample) | `p = 1 − z²` | `𝒲′ = 2z 𝒲/(1 − z²)`, so `(1 − z²)𝒲` constant; exponents `±½μ`, `±½μ`, `{ν + 1, −ν}`; span constant is a ratio of two Abel constants | holds | R05 (locator) |
| 1.4 `ferrersP_recurrence_14_10_3` | `(0.3, 0.4, 0.25)` | left side `0.0` at 30 digits | holds | — |
| 1.4 `hasDerivAt_ferrersP` | `(0.3, 0.4)`, `z = 0.3 + 0.2i` | both `0.5953623227 + 0.0500884664i` | holds | — |
| 1.5 `ferrersP_neg_nat_order` | `(ν, m) = (2, 1)`, `(0.3, 2)`, `(0, 1)`, `(1, 2)` at `z = 0.3 + 0.2i` | `0.9158144672 + 0.5306751721i` both; `−0.1512868590 + 0.0666352931i` both; `0 = 0` at the two zeros of `(ν − m + 1)_{2m}` | holds for every `ν` | — |
| 1.6 `generalizedLegendre_solution` (sample) | `(0.37, 0.6, −0.45)`, `z = 0.3 + 0.2i`; `μ₁ = μ₂` | residual `3·10⁻³²`; Riemann symbol gives `c = 1 − μ₁`, `c − a − b = μ₂`; `w = 2^{−μ} 𝖯^μ_ν` by Euler | holds | — |
| 2.1 polynomials (sample), `ferrersP_nat_eq_shiftedLegendre` | Mathlib `shiftedLegendre` coefficients `(−1)ᵏ C(n,k) C(n+k,n)` | equals `F(−n, n + 1; 1; y)`, so the value at `(1 − z)/2` is `Pₙ(z)`; `𝖯¹₁ = −(1 − x²)^{1/2}`, `P²₂ = 3(x² − 1)` | holds | — |
| 2.2 `legP_eq_circleIntegral` | `n = 2`, `z = 0` | Cauchy and Rodrigues: `2πi · 2⁻² · (d²/dt²)(t² − 1)²/2! = 2πi · (−½)` | holds | — |
| 2.3 generating functions (sample), `hasSum_ferrersP_nat_mul_pow` | complex `|h| < 1`; `(x, h) = (0, −2)` in 14.7.21 | base `(1 − he^{iθ})(1 − he^{−iθ})`, both factors in the right half-plane; corrected side `−0.4472136`, printed `+0.4472136` | holds | — |
| 2.4 `integral_ferrersP_mul_ferrersP` | `(l, m, n) = (2, 1, 2)`; `l < m ≤ n` | `∫ 9x²(1 − x²) = 12/5 = 3!/(1!·5/2)`; `𝖯^m_l = 0` and `l ≠ n` give `0 = 0` | holds | — |
| 2.4 14.17.9 | `(2, 2, 1)`, `(1, 2, 1)`, `(1, 1, 2)` | `0` against `½`; divergent; `−1 = −1` | false for `m > n` | R03 |
| 2.5 `ferrersP_addition` (sample), 14.18.6 | `n = 1`; argument `= 1` at `θ₁ = θ₂`, `φ = 0` | terms `m = ±1` each `½ s₁s₂ cos φ`; junk `ferrersP n 0 1 = 0⁰·1 = 1 = Pₙ(1)`; `(x − y)(1 + 3xy)` both sides | holds | — |
| 2.5 Extensions | `n = 1`, `(θ₁, θ₂, φ) = (−π/2, π/2, 0)` | left `−1`, right `+1` | false | R02 |
| 3.1 `sphericalHarmonic` (sample) | `Y_{1,±1}`, `θ = −π/2` | `Y_{1,1} = −(3/(8π))^{1/2} sin θ e^{iφ}` on `[0, π]`; `Y_{1,−1} = −conj Y_{1,1}`; at `−π/2` the definition has `|sin θ|` | Check needs its range | R01 |
| 3.2 `integral_sphericalHarmonic_mul`, `ferrersP_eq_sum_sphericalHarmonic` | `(1,0,1,0)`; `l = 1` | `(3/4π)·2π·(2/3) = 1`; `(4π/3) ∑ conj Y Y = cos θ₁ cos θ₂ + sin θ₁ sin θ₂ cos(φ₁ − φ₂)` for `0 < θ < π` | holds | — |
| 3.3 `sphericalHarmonic_hilbertBasis` | index `(l, j) ↦ m = j − l`; `p_{2,0}` | `j ∈ {0, …, 2l}` gives `m ∈ {−l, …, l}`; `Δ(2X₂² − X₀² − X₁²) = 4 − 2 − 2 = 0`; `finrank = 2l + 1` at the pin | holds | — |
| 3.4 `integral_funkHecke_sphericalHarmonic` | `f = t`, `l = m = 1`, `θ₀ = ±π/2`, `φ₀ = 0.3` | `θ₀ = π/2`: both `−1.38257 − 0.42768i`; `θ₀ = −π/2`: left `+1.38257 + 0.42768i`, right `−1.38257 − 0.42768i` | false off `(0, π)` | R01 |
| 4.1 `ferrersP_zero` (sample) | `(0.3, 0.4)`; `(2, 0)` | both `0.3645255054`; `π^{1/2}/(Γ(2)Γ(−½)) = −½` | holds | — |
| 4.2 `ferrersP_eq_ferrersW`, `ferrersQ_eq_div_sin` | `(0.3, 0.4)`, `z = 0.3 + 0.2i`; `(−1, 0, 0)` | `0.5405554005 + 0.1231571930i` both; `−0.9755273046 + 0.1187843401i` both; junk `0 ≠ 1` at the excluded point | hold with their hypotheses | — |
| 4.3 15.9.17 (`regularizedGaussHypergeometric_eq_associatedLegendreP`) | `(a, c) = (0.3, 1.2)`, `z = 0.5`, `−2 + i`, `3 − 2i`, `1.5 + 0.01i`; `(0.3 + 0.2i, 0.7, 0.2 + 3i)` | `1.2428208655`; `0.8488746390 + 0.0628519813i`; `0.7995290576 − 0.4842954070i`; `1.2190888427 + 0.7675400941i`; `0.3895269499 + 0.0051995802i`, both sides each time | holds on the stated region | — |
| 4.3 14.3.18 region | `z = ±0.5 + 0.5i` | `Re z > 0`: both `0.7903257192 + 0.4270796559i`; `Re z < 0`: `0.8131104837 + 0.5702530921i` against `0.8100565018 + 0.3883558146i` | as the README says | — |
| 4.4 `ferrersP_neg_half_cos` | `θ = 1` | both `1.0663342456` (modulus `sin ½`) | holds | — |
| 4.5 `ferrersP_isEquivalent_one` | `𝐅(ν + 1, −ν; 1 − μ; 0) = 1/Γ(1 − μ)` | nonzero exactly for `μ ∉ {1, 2, …}`; `((1 + x)/(1 − x))^{μ/2} ∼ (2/(1 − x))^{μ/2}` | holds | — |
| 5.1 `wronskian_ferrersP_ferrersQ` (sample) | `(0.3, 0.4, 0.2)`; `(1, 0)`; `ν = 0`, `μ = i` | `0.8502847912 = Γ(1.7)/Γ(0.9)`; `x𝖰₁′ − 𝖰₁ = 1/(1 − x²)`; `|𝖯^{−i}_0/𝖯^{i}_0|` constant | holds | — |
| 5.2 `ferrersQ_connection_14_9_2` | `(0.3, 0.4)`, `z = 0.3 + 0.2i` | both `0.3372274084 + 0.1470562702i` | holds | — |
| 5.2 `olverLegendreQ_whipple` | `(0.3, 0.4, 2)`; `(0.3 + i, −0.7 + 0.4i, 1.3)` | both `0.3551867693`; both `0.4157918595 − 1.0288674681i` | holds | — |
| 5.3 `tendsto_associatedLegendreP_cut`, `tendsto_olverLegendreQ_cut` | `(0.3, 0.4)`, `x = 0.25`, `−0.6`, `ε = 10⁻¹²` | `0.4165583471 ∓ 0.3026473546i` against `e^{∓0.2πi} 𝖯`; `−0.3609475357 ∓ 1.3624881777i` and `−1.3091479004 ∓ 0.8156663113i` against the right sides | hold | — |
| 6.1 Sturm theory (sample) | `P_{−½+2i}` on `(1, ∞)`; `𝖰₁`; Picone | zeros `1.8325356356`, `8.0961005697` and `q = −17/4`; `𝖰₁(±0.83356) = 0`; equality case forces `Q₁ = Q₂` and proportionality | statements hold | R04 (owner) |
| 6.2 `ferrersP_zero_count` (sample) | `(ν, μ) = (2.5, −0.7)`, `(0.3, 0)`, `(−0.5, −0.2)`, `(3.3, −3.6)`, `(4.2, −1.2)`, `(6.3, −2.9)` | sign changes `2, 1, 0, 0, 3, 4`; `⌈ν + μ⌉⁺ = 2, 1, 0, 0, 3, 4` | holds | — |
| 6.2 `ferrersP_zero_count_add_one` | `(0.25, 0.75)`, `(3.3, 1.3)`, `(2.2, 0.7)`, `(5.1, 2.9)`, `(7.05, 0.95)`, `(4.5, 0.5001)` | sign changes `1, 3, 3, 4, 8, 5`; `⌈ν − μ⌉⁺ + 1 = 1, 3, 3, 4, 8, 5` | holds | — |
| 6.2 the full rule for `𝖯^μ_ν` | 43 further pairs, 36 of them random in `[−0.37, 6.03] × [−2.99, 4.51]`; `(2.5, 1)` by `𝖯_ν′` | all 44 counts equal the rule; `𝖰` at `(−2.3, 0.2)` changes sign at `−0.99995`, `−0.01354`, `0.99982` | holds | — |
| 7.1 recurrences of the second kind (sample) | `ν = 0`, `x = 2` | `2𝑸₂ − 6𝑸₁ + 𝑸₀ = 0.0211838 − 0.5916737 + 0.5493061 = −0.0211838` | Check right | — |
| 7.2 `ferrersQ_nat` (sample) | `n = 2, 3`, `x = 0.3` | `W₁ = 1.5 − 1.05 = 0.45`; `n = 3`: both `0.3232754181` | holds | — |
| 7.3 `deriv_ferrersP_order_zero` | `(0.3, 0.25)` | both `−0.4584920844`; `ψ(−ν) − π cot νπ = ψ(ν + 1)` | holds | — |
| 7.4 `associatedLegendreP_continuedFraction`, 14.14.3 | `(0.3, 0.4, 1.5)`; `(−1.7, 2.3, 3)`; `(5/8, −11/8, 2)` | `0.3451611876` both, printed side `0.8127207083`; `−0.7102358731` both; `x₃ = 0`, `P^{11/8}_{5/8}(2) = 0`, convergent `0`; 14.14.3: both `−0.0337444499` | hold | — |
| 8.1 `associatedLegendreQ_zero_eq_integral` | `ν = 0.3`, `z = −0.5 + 0.5i`; `ν = −0.5 + i`, `z = −2 + 0.1i` | both `−0.6564679064 − 0.4428106443i`; both `−19.2024022 + 7.2317576i` | holds on `U` | R07 (docstring) |
| 8.2 Laplace, `ferrersP_cos_eq_integral` (sample) | `ν = 0.3`, `z = 1.5 + 0.7i`, `0.2 + 0.9i`, `−1.5 + 0.7i`; `(ν, μ, θ) = (0.3, 0.4, 1.1)`, `(0.3 + i, −0.6 + 0.5i, 1.1)` | `1.1012506194 + 0.1120969073i` and `0.8771506287 + 0.2363704391i` both; off `Re z > 0` they differ; `0.6466482990` both; `1.1232798837 + 0.1103156772i` both | holds | — |
| 8.3 `olverLegendreQ_nat_eq_integral` | `n = 2`, `z = −0.5 + 0.5i` | both `0.0941316316 + 0.0301902963i` | holds on `U` | — |
| 9.1 `integral_cpow_mul_ferrersP`, Abelian estimate (sample) | `(0.7, −0.4, 0.6)`; `(1, 0, 1)`; `σ → ∞` | both `0.5740952867`; `1/3`; left `∼ σ^{−μ−1}` with `g(1) = 1/Γ(μ + 1)`, right `(σ/2)^{−μ−1}/2^{μ+1}` | holds | — |
| 9.2 `integral_ferrersQ_mul_ferrersP_mul` | `(2, 1, 2)`, `(3, 2, 2)`, `(4, 1, 2)` | `−1/10 + 1/10 = 0`; `−1/60 − 1/21 + 9/140 = 0`; outside the range `−7/36` | holds | — |
| 10.1 `ferrersP_cos_eq_fourier` | `(0.3, −0.2, 1)`; `μ = −½` | sum `0.8713053051` equals `𝖯 π^{1/2}/(2^{μ+1} sin^μ θ)`, with `𝖯 = 0.8859548489`; one term gives 14.5.12 | holds | — |
| 10.3 `hasSum_ferrersP_dougall` (sample) | `(0.3, 0.5, 0.2)`; contour bound | both `0.8959259862`; terms `O(n^{−3/2−μ})`; `|F| ≤ (C/c) e^{−(π−θ)|Im ν|}` on `C_N` | holds | — |
| 10.4 `hasSum_heine` | `z₁ = −1.5 + i`, `z₂ = 0.3 − 0.4i` (`2.166 < 3.811`); `(1.1, 1.2)` | sum to `n = 60`: `−0.3461538462 − 0.2692307692i = 1/(z₁ − z₂)`; ratio `1.19577` outside the ellipse | holds | — |
| 11.1 `hasSum_olverLegendreQ_toroidal` | `μ = 0.3 + 0.2i`, `ξ = 0.8`, `φ = 1.3` | both `1.1450163312 − 0.0426746093i` | holds | — |
| 11.2 `conicalQHat_eq`, `conicalQHat_eq_cut` | `(μ, τ, x) = (0.3, 1.1, 0.4)` | definition, 14.20.3 and the corrected 14.23.7 all `0.3432632457`; imaginary part of the cut form `10⁻²²` | hold | — |
| 11.3 Gegenbauer Checks | `λ = ½`, `1` | `C^{(1/2)}_n = F(n + 1, −n; 1; ·) = Pₙ`; `2F(3, −1; 3/2; ½ − ½x) = 2x` | hold | — |

- DLMF locators checked against the text of Release 1.2.8 (§§14.2, 14.5, 14.7, 14.10, 14.12, 14.16, 14.17, 14.18, 14.29, 14.30): about 80 equation or paragraph locators, each for its number and printed conditions and, for the sampled targets, its formula; all as cited. The README's stated departures from DLMF (14.12.4, §14.16, 14.17.7, §14.2(iii)) are as it says.
- Whittaker–Watson: the section-and-page locators of Chapter XV (20 sections) checked against the OCR text of the 1920 third edition, which has the same section numbers; the pages agree, to within one page for seven sections whose page break the OCR does not fix. One locator names the wrong section (R05).
- Library declarations opened at the pins (10): Mathlib `Polynomial.shiftedLegendre` (`RingTheory/Polynomial/ShiftedLegendre.lean:40`), `Complex.digamma` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:48`); Tau Ceti `legendreK` (`EllipticIntegral/Legendre.lean:95`), `sphereEval`, `harmonicSphereRestriction` (`Analysis/MvPolynomial/Sphere.lean:49, 115`), `finrank_harmonicSubmodule_add_two` (`RingTheory/MvPolynomial/Harmonic.lean:359`), `classicalResidueTheorem_circle` (`Analysis/Contour/Residue/Theorem.lean:349`), `riemannianVolume`, `setIntegral_riemannianVolume_of_subset` (`VolumeDensity/Volume.lean:82, 124`), `sphereRoundMetric` (`Sphere/Basic.lean:61`). Neither pin has a Ferrers, associated Legendre or `Y_{l,m}` declaration. All 51 `#check` lines elaborate.
- Cross-roadmap citations resolved on main (`2b9ce21`): SpecialFunctionsHypergeometric Conventions, 1.3, 1.4, Layer 2, 3.1, 3.4, 4.2, 4.3, 5.1–5.5, 6.1, Layer 7, 9.1 and its Downstream assignment of 15.9.16–15.9.23 (lines 136–138); SpecialFunctionsEiLiErfIncompleteGamma 4.1 and `contFrac` (its `Suggested.lean` line 298, identical); RiemannianGeometry R8.2 (line 4869); AsymptoticExpansions (line 1551). AutomorphicSpectralTheory §§0.35–0.38 resolved at its open head (lines 646–699).
- Gate rerun at `acc2223`: every check `0`, OK (the worker's run also has `build=0`). Dependency check: `depcheck: 253 roadmaps, 2396 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Nothing outside the folder changes.
- Elaboration (`lake env lean`): 45 warnings, all "declaration uses `sorry`", no error. Elaborated types of the 61 declarations read beside the README statements: no binder lost; `(n − m)!`, `(n − s)!` are natural subtractions under `m ≤ n`, `s < n`. One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on a scratch copy: 0 of 45 theorems close.
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsStruve, SpecialFunctionsGamma, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsConfluent (open), SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsParabolicCylinder (main), and by object QuantumFoundations 9.3, LaguerreJacobi, AutomorphicSpectralTheory; Sturm's comparison theorem is shared with SpecialFunctionsBessel, owner SpecialFunctionsBessel (R04); `Q_{s−1}(t)` on `t > 1` is AutomorphicSpectralTheory §0.35's and its continuation is this roadmap's, with the agreement a target of 8.3; the Gegenbauer polynomials are LaguerreJacobi's and are not defined here; nothing else shared.
- Source independence: 7 passages compared with 1 source (DLMF §14.2(iii), §14.7(ii), §14.16(ii), §14.16(iii), §14.17(i), §14.29, §14.30(iv)), none shared beyond runs of at most 6 words inside a statement the mathematics forces; largest share DLMF Chapter 14, about 443 of 571 locator mentions; contents compared with DLMF Chapter 14: independent (Layer 1 draws on §§14.2, 14.3, 14.6, 14.10, 14.21, 14.29; Layers 2–3 on §§14.7, 14.12, 14.17, 14.18, 14.30; no run of layers follows the section order). The texts of Olver, Lebedev, Temme, Andrews–Askey–Roy, Atkinson–Han, Kristensson, Magnus–Oberhettinger–Soni and Beals–Wong could not be read, so the wording was not compared with them.

## Not verifiable

- Olver (1974/1997), Lebedev (1965), Temme (1996), Andrews–Askey–Roy (1999), Beals–Wong (2010): no legal copy found by the sources service; their page, equation and theorem locators (among them Beals–Wong Thm 3.3.3 and Temme Thm 4.4 in 6.1, Olver Thm 12.1 in 5.1, Lebedev (7.6.6)–(7.6.8) in 4.1) were not checked.
- Atkinson–Han (2012), Kristensson (2010), Magnus–Oberhettinger–Soni (1966): the citations resolve only to paywalled pages; locators not checked.
- Whittaker–Watson, fourth edition (1927): not readable; its locators were checked in the third edition only.
- The DLMF erratum versions the README cites (1.0.1, 1.0.16, 1.0.25, 1.0.28, 1.1.5): only 1.0.22 (§14.2(iii)) and 1.1.3 (14.5.3–14.5.4) were seen in the text read.
- The description's account of the two local reviews and of the check of "every book locator against the printed page": no record of them is available to this review.

## Source issues

- **Error** in DLMF 1.2.8 at equation 14.17.9, §14.17(iii): the source says the integral of `𝖯^l_n 𝖯^{−m}_n/(1 − x²)` over `(−1, 1)` is `(−1)^l δ_{l,m}/l` for all nonnegative integers with `l > 0`; it should be restricted to `m ≤ n`, since at `l = m > n` the integral is `0` and at `l ≤ n < m` it diverges; affects a stated result.

## For the human reviewers

- Licence: README "Prior formalization" (lines 1607–1637) names `lean-DLMF` (Apache-2.0) as source material for every layer and maps each layer to its files; `Suggested.lean` shares declaration names with it (for example `ferrersP_zero_count`), with different statements.
- Licence: DLMF pages were read from `dlmf.nist.gov`, a host the sources service has in no licence class; they were fetched as an institutional copy.
