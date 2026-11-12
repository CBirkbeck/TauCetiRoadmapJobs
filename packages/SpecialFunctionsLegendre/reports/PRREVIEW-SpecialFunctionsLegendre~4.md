# Review of SpecialFunctionsLegendre (pull request #2121 at 84b0c9f)

**Verdict:** needs changes

## R01 (P3) — 7.3: the reason given for `m ≤ n` in 14.17.7 is false when `l ≠ n`

- **Location:** README 7.3, lines 806–807: "for `m > n`, `𝖯^m_n = 0` by 14.7.16, so both integrals vanish, while the printed right side of 14.17.7 is `(−1)^m/(l + ½) ≠ 0`".
- **Claim:** for every `m > n`, both integrals of 14.17.6–14.17.7 vanish. This is the previous report's R05 repair text, applied verbatim, and that text was wrong.
- **Witness:** the integrand of 14.17.7 is `𝖯^m_l 𝖯^{−m}_n`, which does not contain `𝖯^m_n`. At `(l, m, n) = (3, 2, 1)`: `𝖯²₃ = 15x(1 − x²)`, `𝖯⁻²₁ = (1 − x)(2 + x)/(6(1 + x))`, so the integral is `−4`, while the printed side is `0`.
- **Repair:** "(for `m > n`, `𝖯^m_n = 0` by 14.7.16: at `l = n` both integrals vanish while the printed right side of 14.17.7 is `(−1)^m/(l + ½) ≠ 0`, and at `l ≠ n` 14.17.7 fails as well, `∫₋₁¹ 𝖯²₃ 𝖯⁻²₁ dx = −4` at `(l, m, n) = (3, 2, 1)`)". Tested: `(1, 2, 1)` gives `0` against `2/3`, and `(3, 2, 1)` gives `−4` against `0`.

## R02 (P3) — 11.3: the change-of-variables step names none of its inputs

- **Location:** README 11.3, lines 1137–1138: "*Needs:* Layers 1, 4, 7–8; RiemannianGeometry R8.2 (completeness at `m = 2`); Tau Ceti harmonic polynomials and `MvPolynomial.laplacian_eval_euclidean`; Mathlib `fourierBasis`, `HilbertBasis`."
- **Claim:** these inputs cover the new completeness route, which carries `sin θ dθ dφ` to "the Riemannian volume of the round metric" (lines 1118–1121).
- **Witness:** that measure is Tau Ceti's `TauCeti.riemannianVolume` (`Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`, defined chartwise) of `TauCeti.sphereRoundMetric` (`…/Sphere/Basic.lean:61`). Neither appears in the *Needs:* line, the Tau Ceti contract or the Dependencies, and no change-of-variables theorem is named.
- **Repair:** change the *Needs:* line to "… Tau Ceti harmonic polynomials, `MvPolynomial.laplacian_eval_euclidean`, `TauCeti.sphereRoundMetric`, `TauCeti.riemannianVolume` and `TauCeti.setIntegral_riemannianVolume_of_subset`; Mathlib `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`, `fourierBasis`, `HilbertBasis`.". List the three Tau Ceti names under From Tau Ceti, and their two files under Dependencies.

## R03 (P3) — the description's headline count is that of an earlier head

Previous review R06, not repaired.

- **Location:** description, Build: "`Suggested.lean` compiles at the pins of main with `sorry` as the only warning (41 headlines)".
- **Claim:** `Suggested.lean` states 41 headline theorems.
- **Witness:** at this head, `lake env lean` gives 42 warnings, all "declaration uses `sorry`", and the file declares 42 theorems.
- **Repair:** "… with `sorry` as the only warning (42 headline theorems)".

## R04 (P3) — the description omits the new supplier and the 14.20.10 correction

- **Location:** description, Dependencies (SpecialFunctionsHypergeometric, SpecialFunctionsEiLiErfIncompleteGamma), and "The roadmap states corrected forms of these DLMF statements".
- **Claim:** the description lists every supplier and every corrected DLMF statement.
- **Witness:** README lines 257–264 add "From RiemannianGeometry: R8.2 …, its completeness clause at `m = 2`", which 11.3 consumes. Lines 1027–1030 restrict 14.20.10 to `0 ≤ θ < π`, against DLMF's printed `0 ≤ θ ≤ π`.
- **Repair:** add to Dependencies "- RiemannianGeometry (on main) supplies R8.2, the density of the restricted harmonic polynomials in `L²(S²)`; 11.3 deduces from it the completeness of the `Y_{l,m}` in `(θ, φ)`." Add to the list of corrections "- the range of 14.20.10, `0 ≤ θ < π` (the series diverges at `θ = π`)."

## Previous findings

- R01 — repaired: 9.1, lines 933–938, "let `Q₁ ≤ Q₂` on `I` (so `q₁ ≤ q₂` on a subinterval of `(−1, 1)` and `q₂ ≤ q₁` on a subinterval of `(1, ∞)`)", with the conical function `P_{−½+2i}` as a negative example.
- R02 — repaired: 10.2, lines 1027–1030, "14.20.10 for `0 ≤ θ < π` (DLMF prints `0 ≤ θ ≤ π`, …)", and the positivity of `𝖯_{−½+iτ}(cos θ)` for `0 ≤ θ < π`.
- R03 — repaired: 9.2, lines 949–952, "those on `𝖰^μ_ν` assume `ν ≥ −½` (DLMF's count fails at `(ν, μ) = (−2.3, 0.2)` …); those on `𝑸^μ_ν` are for all real `ν`".
- R04 — repaired: the contract "From RiemannianGeometry" (lines 257–264), Scope lines 121–124, 11.3 lines 1116–1121 and *Needs:* line 1137. The table row and the Stone–Weierstrass names are deleted. The new *Needs:* line omits the volume inputs: R02.
- R05 — repaired, with a false clause: lines 806–807, "for `m > n`, `𝖯^m_n = 0` by 14.7.16, so both integrals vanish", which is the previous report's own repair text: R01.
- R06 — not repaired: the description still says "(41 headlines)": R03.

## Verified sound

Values were computed with mpmath (`legenp`/`legenq`, types 2 and 3, 25–30 digits) and adaptive quadrature. Entries are left side / right side unless marked otherwise.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 9.1 comparison theorem, `(1, ∞)`, `Q₁ ≤ Q₂` | `q₁ = −1.25` (`ν = −½+i`), `q₂ = −4.25` (`ν = −½+2i`) | consecutive zeros of `y₁`: `6.0666379`, `139.3077083`; `y₂` vanishes at `8.0961006`, `38.7962890` | holds | — |
| 9.1 README negative example | `P_{−½+2i}`, `q₁ = −17/4`; `P₀ = 1` | `ν(ν+1) = −4.25`; zeros `1.8325356356`, `8.0961005698`, the only sign changes on `(1, 11)`; `P₀` has none | holds | — |
| 9.1 comparison theorem, `(−1, 1)`, `q₁ ≤ q₂` | `y₁ = 𝖯₂` (`q₁ = 6`), `y₂ = 𝖯₃` (`q₂ = 12`) | zeros of `𝖯₂`: `±0.5773503`; `𝖯₃(0) = 0` lies between them | holds | — |
| 9.2 `𝖰` restricted to `ν ≥ −½` | `(ν, μ) = (−2.3, 0.2)` | zeros `−0.99995314`, `−0.01354461`, `0.99981997`; `N₀ = 0`, so 3 exceeds `N₀ + 2` | restriction needed | — |
| 9.2 `𝖰` count and parity, `ν ≥ −½` | `(−0.4, 0.2)`, `(2.6, 0.3)` | 1 zero, `N₀ = 0`, cosines `0.309`, `0.809` (odd); 4 zeros, `N₀ = 3`, cosines `−0.309`, `0.588` (even) | holds | — |
| 10.2 14.20.10 for `0 ≤ θ < π` | `τ = 1`, `θ = 3` | partial sum (`N = 2·10⁴`) `15.79568745`; `𝖯_{−½+i}(cos 3) = 15.79568745` | holds | — |
| 10.2 14.20.10 at `θ = π` excluded | `τ = 1`; `x → −1+` | partial sums `15.31`, `32.24` at `N = 10², 10⁴`; `𝖯_{−½+i}(−1 + 10⁻⁶) = 49.66`; term at `k = 50`: `0.0720 ≥ 0.00633` | exclusion right | — |
| 7.3 14.17.7 with `m ≤ n` (`integral_ferrersP_mul_ferrersP` row) | `(2, 1, 2)`, `(3, 1, 2)`, `(2, 2, 3)` | `−0.4 = (−1)¹/2.5`; `0` / `0`; `0` / `0` | holds | — |
| 7.3 14.17.7 at `m > n` | `(1, 2, 1)`, `(3, 2, 1)` | `0` against `2/3`; `−4` against `0` | parenthetical false at `l ≠ n` | R01 |
| 11.3 `sphericalHarmonic_hilbertBasis` via R8.2 | Jacobian of `(θ, φ) ↦ (sin θ cos φ, sin θ sin φ, cos θ)` at `(1, 0.5)`; dimensions up to degree `L` | `‖∂_θ × ∂_φ‖ = 0.8414709848 = sin 1`; `Σ_{l≤L}(2l+1) = 1, 4, 9, 16 = dim P_L + dim P_{L−1}` | holds; inputs unnamed | R02 |
| RiemannianGeometry R8.2 contract at `m = 2` | its Check `X₃` on `S²` | `λ = 2 = l(l+1)` at `l = 1`, matching 14.30.11 for `Y_{1,0} ∝ cos θ` | holds | — |

The rows for untouched statements stand as in the previous review, of `b65de58`.

- Sources: DLMF Release 1.2.8 (2026-09-15) was read at §14.17(iii) (14.17.6–14.17.9 and their only hypothesis, "l, m, n = 0, 1, 2, …"). The seeded targets 9.1, 10.2 and 11.3 fall in the changed text and were rechecked against 14.9.5, 14.9.11, §14.16, 14.8.3 and 14.20.10. The other seeded targets are untouched.
- Library at the pins: Tau Ceti `MvPolynomial.harmonicSphereRestriction` (`Analysis/MvPolynomial/Sphere.lean:115`, real-linear into `C(sphere, ℝ)`) and `TauCeti.sphereRoundMetric` (`Geometry/Manifold/Riemannian/Sphere/Basic.lean:61`) were opened, as were `TauCeti.riemannianVolume` (`…/VolumeDensity/Volume.lean:82`) and Mathlib `integral_image_eq_integral_abs_det_fderiv_smul` (`MeasureTheory/Function/Jacobian.lean:1214`).
- Cross-roadmap citations: RiemannianGeometry R8.1–R8.2 on main (README lines 669–690 and 3760–3861) was resolved. Its completeness clause, its real coefficients and its Stone–Weierstrass input match the new contract. No open pull request revises RiemannianGeometry.
- Overlap check: read RiemannianGeometry R8 (main), QuantumFoundations 9.3 (open) and PositiveMass 1.2 (main), all of which consume R8.2. `L²(S²)` completeness is owned by RiemannianGeometry R8.2, and `Y_{l,m}` in `(θ, φ)` by this roadmap. SpecialFunctionsHypergeometric, SpecialFunctionsBessel and SpecialFunctionsConfluent are unchanged since the previous review.
- Gate rerun at `84b0c9f`: every check `0`, OK.
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration (`lake env lean`): 42 warnings, all "declaration uses `sorry`", and nothing else. `Suggested.lean` is unchanged since `b65de58`.
- Description: checked against this head. Nothing outside the folder changed.

## Not verifiable

- Hobson (1931, pp. 386–389, 399–401), cited in 9.1: no open copy was fetched. The repaired comparison theorem was checked by computation instead.

## Source issues

- **Error** in DLMF 1.2.8 at 14.17.7, §14.17(iii): the source states the integral of `𝖯^m_l 𝖯^{−m}_n` for all `l, m, n ∈ ℕ`; it should require `m ≤ n` (at `(1, 2, 1)` the integral is `0`, not `2/3`; at `(3, 2, 1)` it is `−4`, not `0`); affects a stated result.
