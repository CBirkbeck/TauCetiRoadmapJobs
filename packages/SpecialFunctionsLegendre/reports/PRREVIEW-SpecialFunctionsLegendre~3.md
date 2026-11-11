# Review of SpecialFunctionsLegendre (pull request #2121 at b65de58)

**Verdict:** needs changes

## R01 (P1) — Sturm's comparison theorem is false on subintervals of (1, ∞)

- **Location:** README 9.1, lines 922–929: "for `((1 − x²) y′)′ + q(x) y = 0` on an open subinterval `I` of `(−1, 1)` or of `(1, ∞)` … let `q₁ ≤ q₂` on `I` … Then `y₂` has a zero in `(a, b)`".
- **Claim:** with `q₁ ≤ q₂`, every real solution for `q₂` vanishes between consecutive zeros of a solution for `q₁`, on `(1, ∞)` as on `(−1, 1)`.
- **Witness:** on `(1, ∞)`, `q₁ = ν(ν + 1) = −4.25` at `ν = −½ + 2i` and `q₂ = 0`: `P_{−½+2i}` has consecutive zeros `1.8325356`, `8.0961006`, while `y₂ = P₀ = 1` never vanishes.
- **Repair:** write the equation as `(p y′)′ + Q y = 0` with `p = |1 − x²|`, `Q = q` on `(−1, 1)` and `Q = −q` on `(1, ∞)`, and assume `Q₁ ≤ Q₂`; on subintervals of `(1, ∞)` the hypothesis reads `q₂ ≤ q₁`. Tested: `q₂ = −4.25 ≤ q₁ = −1.25`, and `P_{−½+2i}` vanishes at `8.0961`, `38.7963`, between the consecutive zeros `6.0666`, `139.3077` of `P_{−½+i}`.

## R02 (P2) — 14.20.10 is claimed at θ = π, where the series diverges

- **Location:** README 10.2, lines 1014–1015: "14.20.10 for `0 ≤ θ ≤ π`, with the positivity of `𝖯_{−½+iτ}(cos θ)` stated after it".
- **Claim:** the series 14.20.10 converges to `𝖯_{−½+iτ}(cos θ)` at `θ = π`.
- **Witness:** at `θ = π` the `k`-th term is at least `((2k − 1)!!/(2k)!!)² ∼ 1/(πk)`; at `τ = 1` the partial sums are `15.31`, `32.24`, `49.23` at `N = 10², 10⁴, 10⁶`, and `𝖯_ν(x) → +∞` as `x → −1+`.
- **Repair:** "14.20.10 for `0 ≤ θ < π`, with the positivity of `𝖯_{−½+iτ}(cos θ)` for `0 ≤ θ < π`". Tested: at `θ = 3`, `τ = 1` the partial sums reach `15.795687 = 𝖯_{−½+i}(cos 3)`.

## R03 (P2) — the restriction to ν ≥ −½ is a loss for 𝖰 and excludes the 𝑸 clause

- **Location:** README 9.2, line 940: "DLMF §14.16 for real `ν ≥ −½` and real `μ` (the restriction to `ν ≥ −½` is no loss by 14.9.5 and 14.9.11)"; line 960: "at most one when `ν < −1`".
- **Claim:** every statement of 9.2 extends from `ν ≥ −½` to all real `ν` by 14.9.5 and 14.9.11.
- **Witness:** 14.9.5 and 14.9.11 are symmetries of `𝖯` and `P` only. `𝖰^{0.2}_{−2.3}` has three zeros, `−0.99995314`, `−0.01354461`, `0.99981997`, while `N₀ = 0`, so `k = 3`; the `𝑸` clause for `ν < −1` lies outside `ν ≥ −½`.
- **Repair:** "for real `μ`; the statements on `𝖯^μ_ν` and `P^μ_ν` are for `ν ≥ −½`, which is no loss by 14.9.5 and 14.9.11; those on `𝖰^μ_ν` assume `ν ≥ −½` (DLMF's count fails at `(ν, μ) = (−2.3, 0.2)`, three zeros against `N₀ = 0`); those on `𝑸^μ_ν` are for all real `ν`".

## R04 (P2) — the L² completeness in 11.3 restates RiemannianGeometry R8.2 at m = 2

Previous review R04, not repaired.

- **Location:** README Scope, lines 124–127: "11.3 proves it by the elementary route, Stone–Weierstrass and the harmonic decomposition, which works on every sphere"; auxiliary table, line 114; 11.3, lines 1101–1105.
- **Claim:** the density of polynomial restrictions in `L²(S²)` and the completeness of the harmonic decomposition are this roadmap's own targets.
- **Witness:** RiemannianGeometry on main, R8.2 (README line 3840): "Establish orthogonality, completeness …", *Needs:* Stone–Weierstrass "for the density of restricted polynomials", on every `Sᵐ`. QuantumFoundations 9.3 consumes R8.2 for the same. Another proof route keeps one owner.
- **Repair:** add "From RiemannianGeometry: R8.2 (completeness of the harmonic decomposition of `L²(Sᵐ)`, case `m = 2`)" to Exact supplier contracts and the Layer 11 *Needs:* line; reduce the completeness bullet to the basis `p_{l,m}` of each `H_l` plus the change of variables to `(θ, φ)` with weight `sin θ`; delete the auxiliary-table row "The `L²` density of the polynomials restricted to `S²`"; keep `sphericalHarmonic_hilbertBasis`.

## R05 (P3) — 7.3: "both functions vanish" is false for 14.17.7

- **Location:** README 7.3, lines 800–802: "14.17.6–14.17.7 for `m ≤ n` (for `m > n` both functions vanish by 14.7.16, and the printed right side does not)".
- **Claim:** for `m > n` both factors of the integrands of 14.17.6–14.17.7 vanish.
- **Witness:** at `(l, m, n) = (1, 2, 1)` in 14.17.7, `𝖯²₁ = 0` but `𝖯⁻²₁(0.3) = 0.20641026`; the integral is `0`, the printed right side `(−1)^m/(l + ½) = 2/3`.
- **Repair:** "(for `m > n`, `𝖯^m_n = 0` by 14.7.16, so both integrals vanish, while the printed right side of 14.17.7 is `(−1)^m/(l + ½) ≠ 0`)".

## R06 (P3) — the description's headline count is that of an earlier head

- **Location:** description, Build: "`Suggested.lean` compiles at the pins of main with `sorry` as the only warning (41 headlines)".
- **Claim:** `Suggested.lean` states 41 theorems.
- **Witness:** the head declares 42 theorems (elaboration: 42 warnings, all "declaration uses `sorry`"): `wronskian_mul_one_sub_sq_eq_const` was deleted, `deriv_ferrersP_order_zero` and `ferrersP_zero_count_add_one` were added.
- **Repair:** "… with `sorry` as the only warning (42 headline theorems)".

## Previous findings

- R01 — repaired: 4.3, lines 575–580, "14.7.21, its form for `x > 1` and its complex form have the right side `h⁻¹ (1 − 2x h⁻¹ + h⁻²)^{−1/2}`", with the Check `(0, −2) ↦ −5^{−1/2}` (line 583).
- R02 — repaired: 8.3, lines 878–881, "for `ν ∉ ℤ` and `−1 < x < 1`, as `HasSum` …, and at `x = −1` as the limit of the partial sums".
- R03 — repaired: Scope, lines 133–137 ("An object defined elsewhere: AutomorphicSpectralTheory (§§0.35–0.38 …)"), and the comparison target in 7.2, lines 782–784.
- R04 — not repaired: lines 123–127 now say the statement "overlaps the completeness clause of RiemannianGeometry R8.2 on `S²`" and keep the Stone–Weierstrass route; raised again as R04.
- R05 — repaired: 10.2, lines 1000–1004, "`τ > 0` and `μ ≥ 0` (DLMF's standing assumption in §14.20)", and the exception "except at `τ = 0`, `μ ∈ ½ + ℤ`" (lines 1012–1013).
- R06 — repaired: `ferrersP_zero_count_add_one` (`Suggested.lean` line 375) and `deriv_ferrersP_order_zero` (line 282).
- R07 — repaired: the gate passes, `tex=0`.
- R08 — partly repaired: 9.1 now states the comparison theorem with hypotheses and cites Hobson (1931, pp. 386–389, 399–401), the union of DLMF's notes to §14.16(ii)–(iii); the auxiliary table gives the Abelian estimate a full proof (line 113). The new comparison statement is false on `(1, ∞)`: R01.
- R09 — repaired: line 625, "14.2.3–14.2.6 on `D` (on `(−1, 1)` by restriction) and 14.2.7–14.2.11 on `(1, ∞)` and on `U`".
- R10 — repaired: `wronskian_mul_one_sub_sq_eq_const` deleted; the five local names are in Conventions, lines 165–170.
- R11 — repaired: lines 265–276 (`laplacian_eval_euclidean`, `harmonicOnNhd_eval_euclidean_iff`, `classicalResidueTheorem_circle`), *Needs:* lines 905–906 and 1121–1122; the 10.3 *Needs:* line is "Layers 1–5, 7, 8.2" (line 1052).
- R12 — repaired: `### Examples` in all eleven layers; `ferrersW₁`, `ferrersW₂` have three tests each plus the junk value (lines 517–523).
- R13 — repaired: line 348, "the penultimate paragraph of §14.24"; lines 1225–1226, "Fourier series representation of Ferrers function `𝖯`".
- R14 — repaired: the description now says "It also records, without stating a corrected rule, an error in the left-cut zero rule of §14.27".

## Verified sound

Adversarial table. Values were computed this round in 20–40 digits with mpmath from a transcription of the Lean definitions (principal powers, `Γ = 0` at poles, `a/0 = 0`). That transcription agrees with mpmath's own `legenp`/`legenq` to `10⁻¹⁷`. Entries are left side / right side unless marked otherwise.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 seed · `differentiable_ferrersP_degree` | Cauchy–Riemann in `ν` at `(μ, z, ν) = (0.35+0.4i, 0.4+0.3i, 0.7−0.2i)` | `∂_{Re ν} = ∂_{Im ν}/i = −0.954373200896+0.150303162877i` | holds | — |
| 1.2 seed · `ferrersP_conj` | same point | `0.395887831471−0.0746426733907i` both | holds | — |
| 1.2 seed · `olverLegendreQ_neg_order` | `(0.3, ±0.4, −1.5+0.8i)`, `Re z < 0` | `−0.410652971574+0.0657549191513i` both | holds | — |
| `ferrersP_legendreEquation` | `(0.3+0.1i, 0.4, 0.5+0.2i)` | residual `2·10⁻²²`, `|w| = 0.65` | holds | — |
| `olverLegendreQ_legendreEquation` | `(0.3, 0.4, −1.5+0.8i)` | residual `5·10⁻¹⁷`, `|w| = 0.42` | holds | — |
| 1.4 seed · `ferrersP_neg_nat_order` | `(ν, m) = (2.5+0.3i, 2), (1, 2), (−1, 1)`, `z = 0.2+0.1i` | `3.86721275037+0.437897953822i` both; `0 = 0`; `0 = 0` (Pochhammer zeros) | holds | — |
| 1.4 seed · Check 14.3.15 against 14.3.9 | `(0.3, 0.4, 2)` | `1.01402040115` both | holds | — |
| 2.1 seed · `ferrersP_recurrence_14_10_3` | `(0.7−0.2i, 0.35+0.4i, 0.4+0.3i)` | residual `3·10⁻²¹` | holds | — |
| 2.2 seed · `hasDerivAt_ferrersP` | same point | `0.997580940983+0.201207685278i` both | holds | — |
| 3.1 seed · `ferrersP_zero` | `(0.3, 0.4)`; `(0.7−0.2i, 0.35+0.4i)` | `0.364525505405` both; `−0.031383158013−0.263034678288i` both | holds | — |
| 3.2 seed · `ferrersP_eq_ferrersW` | `(0.3, 0.4, 0.25+0.3i)`; excluded `(−1, 0, 0)` | `0.506756667176+0.178308697292i` both; `1` against `0` | holds; hypothesis needed | — |
| 3.2 seed · `ferrersQ_eq_div_sin` | `(0.3, 0.4, 0.25)`; `(−1.2, 0.5, −0.3)` | `−0.993017785692` both; `1.24075892594` both | holds | — |
| 3.4 Checks `ferrersW₁`, `ferrersW₂` | `(0.3, 0.4)`; parity at `±(0.3+0.2i)` | `w₁(0) = 0.802936417424`, `w₂′(0) = 0.674160616552`, each = closed form; parity residuals `0` | holds | — |
| `regularizedGaussHypergeometric_eq_associatedLegendreP` | `(a, c, z) = (0.3, 1.2, 0.5)`, `(0.3, 1.2, −0.7+0.2i)`, `(0.2+0.1i, 0.4−0.3i, 0.8−0.5i)` | `1.24282086548`; `0.974189557722+0.0244596734606i`; `0.785324649994−0.57226763482i`; each both sides | holds | — |
| 4.1 seed · `ferrersP_neg_half_cos` | `θ = 1` | `1.06633424558` both (`K` from `ellipk(sin²½)`) | holds | — |
| `ferrersP_nat_eq_shiftedLegendre` | `n = 5`, `z = 0.3+0.4i` | `1.56758625+0.119615i` both | holds | — |
| `ferrersQ_nat` | `n = 3`, `x = 0.3` | `0.323275418059` both | holds | — |
| `hasSum_ferrersP_nat_mul_pow` | `(0.3, h = 0.6e^{2.3i})` | `0.834922586863+0.204817877999i` both | holds | — |
| 14.7.21 as corrected (4.3) | `(x, h) = (0, −2), (0.3, −2.5), (0.3, 2.5), (0.3, 1.5+1.2i)`; `z = 1.5+0.5i`, `h = 4e^{2i}, −3.2−0.4i` | sums `−0.4472135955`, `−0.3380617019`, `0.4170288281`, `0.4641341779−0.3400987768i`, `−0.1499653043−0.1558876090i`, `−0.2130178931+0.0355360998i` = corrected side | holds | — |
| 4.4 seed · `ferrersP_isEquivalent_one` | `(0.3, −1.6)`, `(1.1, 2.5)`, `(0.3+0.5i, 0.4−0.2i)`, `x = 1 − 10⁻¹⁰` | ratios `1.00000000003`, `1.00000000001`, `0.99999999996−5·10⁻¹¹i` | holds | — |
| 4.4 seed · Check 14.8.3 | `ν = 0.3`, `x = 1 − 10⁻¹²` | `−0.408024776038` against `−γ − ψ(1.3) = −0.408024776035` | holds | — |
| 5.1 seed · `wronskian_ferrersP_ferrersQ` | `(0.3, 0.4, 0.2)`; `(0.3+0.2i, 0.4−0.1i, 0.3+0.5i)` | `0.850284791201` both; `0.895572976018+0.213295550167i` both | holds | — |
| 5.1 seed · recessive pairs at `Re μ = 0` | `ν = 0`, `μ = i`, `x = 0.9, 0.999, 0.999999` | `|𝖯^{−i}_0(x)/𝖯^{−i}_0(−x)| = 1.0` each | README statement holds | — |
| 5.2 seed · `ferrersQ_connection_14_9_2` | `(0.3, 0.4, 0.25+0.1i)`, `(0.3, 2, 0.25)`, `(−2.4, 0.7, −0.5)` | `0.306515563341+0.0727316437045i` both; `≈ 10⁻²²` both; `0.1250882716` both | holds | — |
| 5.2 seed · `olverLegendreQ_whipple` | `(0.3, 0.4, 2)`; `(0.3+0.2i, −0.4+0.1i, 1.3)` | `0.355186769329` both; `0.786370538212−0.174915367123i` both | holds | — |
| `tendsto_associatedLegendreP_cut` | `(0.3, 0.4, 0.25)`, `ε = 10⁻¹²` | `0.416558347139 ∓ 0.302647354591i` against `e^{∓0.2πi}𝖯`, gap `6·10⁻¹³` | holds | — |
| `tendsto_olverLegendreQ_cut` | `(0.3, 0.4, 0.25)`; `(0.3+0.2i, 0.6−0.3i, 0.25)`, `ε = 10⁻¹²` | `−0.360947535666 ∓ 1.36248817766i`; `−0.35106190732−1.71888582912i` (upper); gaps `≤ 1.5·10⁻¹²` | holds | — |
| `deriv_ferrersP_order_zero` | `(ν, x) = (0.3, 0.25)`; `(−0.4+0.3i, −0.6)` | `−0.458492084378` both (README Example); `−1.116764548−0.0375619955688i` both | holds | — |
| 6.1 form for `P` after 14.11.5 | `(ν, x) = (0.3, 2)` | `0.119566642742` both | holds | — |
| `associatedLegendreP_continuedFraction` | `(0.3, 0.4, 1.5)`, `(1.7, −0.6, 3)`, `(5/8, −11/8, 2)` | convergent 300: `0.345161187629`, `4.94683097713` = corrected side (printed `0.81272070827`, `4.92883063234`); third case `cfIndex` 3, value `0`, denominator `15/32` | holds | — |
| 14.14.3 | `(0.3, 0.4, 1.5)` | `−0.0337444499303` both | holds | — |
| 6.2 large-degree estimate | `(0.3, 0.4, 1.5)`, `k = 5, 20, 60` | ratios `0.99778895`, `0.99930022`, `0.99975194`; quadratic form `0.584543836526` both | holds | — |
| `ferrersP_cos_eq_integral` | `(0.3, 0.2, θ = 1)` | `0.847471201044` against quadrature `0.84747120073`; gap falls `3·10⁻⁸ → 3·10⁻¹⁰` under refinement | holds | — |
| `olverLegendreQ_nat_eq_integral` | `n = 2`, `z = −1.5+0.7i` | `0.000487074304349−0.0176241779605i` both | holds | — |
| 7.2 comparison with AutomorphicSpectralTheory §0.35 | `(s, t) = (1.5+0.7i, 2), (0.4, 3), (1, 3)` | `0.0824856889915−0.193691354083i`, `1.82978024735`, `0.34657359028`, each = Heine integral | holds | — |
| 7.3 seed · `integral_cpow_mul_ferrersP` | `(0.7, −0.4, 0.6)` | `0.574095286706` both | holds | — |
| 7.3 seed · `integral_ferrersP_mul_ferrersP` | `(l, m, n) = (2, 1, 2), (3, 1, 1), (3, 2, 3)` | `2.4` both; `3·10⁻²⁵` / `0`; `34.2857142857` both | holds | — |
| 7.3 seed · 14.17.7 at `m > n` | `(1, 2, 1)` | integral `0`; `𝖯⁻²₁(0.3) = 0.20641026`; printed side `2/3` | restriction right, wording wrong | R05 |
| `integral_ferrersQ_mul_ferrersP_mul` | `(2, 1, 2)`, `(3, 2, 2)`; outside `(4, 1, 2)` | `5·10⁻²⁷`, `6·10⁻²⁶`; `−0.1944444444 = −7/36` | holds | — |
| `ferrersP_cos_eq_fourier` | `(0.3, −0.2, 1)`, `N = 10⁴, 10⁵, 10⁶` | `0.871304930`, `0.871305285`, `0.871305304` against `0.871305305` | holds | — |
| 8.2 seed · `ferrersP_addition` | `n = 3`, `(θ₁, θ₂, φ) = (0.7, 1.9, 0.8)` | `−0.252222483937` both | holds | — |
| 8.3 seed · `hasSum_ferrersP_dougall` | `(0.3, 0.5, 0.2)`, `N = 10³, 10⁵, 10⁶` (terms by 14.5.12) | `3.4790792667`, `3.4790795695`, `3.4790795694` against `3.4790795694` | holds | — |
| 8.3 seed · 14.18.8 | `ν = 0.3`; `x = 0.4, −1, 1`; `N ≤ 2·10⁵` | `0.57625124 = 𝖯_ν(−0.4)`; `1.0000013 → 1`; `−3.057, −4.243, −5.429, −5.786`, divergent | holds as stated | — |
| 8.3 seed · `hasSum_heine` | `z₁ = 2.5+0.5i`, `z₂ = 0.4−0.3i` | `0.415841584158−0.158415841584i` both | holds | — |
| 9.1 comparison theorem | `(1, ∞)`: `q₁ = −4.25`, `q₂ = 0` | zeros of `P_{−½+2i}`: `1.8325356`, `8.0961006`; `y₂ = 1` | fails | R01 |
| 9.2 seed · `ferrersP_zero_count` | `(2.5, −0.3), (3, −2.5), (−0.4, −0.05), (4.7, −1.2)` | counts `3, 1, 0, 4` = `⌈ν + μ⌉` | holds | — |
| 9.2 seed · `ferrersP_zero_count_add_one` | `(3.3, 1.3), (0.25, 0.75), (2.3, 0.5), (1.2, 1.7), (2.6, 2.9), (5.4, 2.4), (0.3, 0.3)` | counts `3, 1, 3, 1, 1, 4, 1` = `⌈ν − μ⌉ + 1` | holds | — |
| 9.2 integer order `μ = m ≥ 1` | `(2.5, 1), (2.5, 2), (3.3, 2), (0.3, 1), (4.2, 3), (1.6, 1), (5.7, 2)` | counts `2, 1, 2, 0, 2, 1, 4` = `N₀` | holds | — |
| 9.2 corrections for `P`, `𝖰` | `P` at `(0.184, −0.088)`; `𝖰` at `(−0.369, −0.206)` | min of `P` on `(1, 10⁷)`: `0.552`; min of `𝖰`: `2.17`, both cosines positive | README corrections hold | — |
| 9.2 restriction `ν ≥ −½` | `𝖰^{0.2}_{−2.3}` | zeros `−0.99995314`, `−0.01354461`, `0.99981997`; `N₀ = 0` | "no loss" fails | R03 |
| `hasSum_olverLegendreQ_toroidal` | `(μ, ξ, φ) = (0.3, 0.8, 1.1)` | `1.3350604086` both | holds | — |
| 10.2 seed · `conicalQHat_eq` | `(0.3, 1.1, 0.4), (−0.6, 0.8, 0.2), (1.2, 0, 0.3), (0.3, −1.1, 0.4)` | `0.343263245652`, `0.410989214326`, `2.27350404033`, `−3.68334365721`, each both sides | holds | — |
| 10.2 seed · `conicalQHat_eq_cut` | `(0.3, 1.1, 0.4)`, `ε = 10⁻¹²` | corrected side `0.343263245652` = `𝖰̂`; printed side `0.117207199064−0.16132186974i` | holds | — |
| 10.2 seed · conical pair at `μ < 0` | `μ = −½`, `τ = 1` | ratio `cosh θ/cosh(π − θ)` by 14.5.11, limit `1/cosh π = 0.0862667 ≠ 0` | `μ ≥ 0` needed, now stated | — |
| 10.2 seed · 14.20.10 | `τ = 1`; `θ = 3`, `θ = π` | `θ = 3`: `15.795687` both; `θ = π`: partial sums `15.31, 32.24, 49.23` at `N = 10², 10⁴, 10⁶` | fails at `θ = π` | R02 |
| 14.20.9, Example 14.5.12 | `(τ, θ) = (1, 2)`; `(1.3, 0.9)` | `3.13097651976` both; `1.00955674368` both | holds | — |
| `generalizedLegendre_solution` | `(0.37, 0.6, −0.45)`, `z = 0.3+0.2i` | residual `2·10⁻²²`, `|w| = 0.24` | holds | — |
| `integral_sphericalHarmonic_mul` | `(2, 1, 2, 1), (2, 1, 3, 1), (1, −1, 1, −1), (2, −2, 2, 2)` | `1.0`, `3·10⁻²⁸`, `1.0`, `0` (`φ`-integral) | holds | — |
| `ferrersP_eq_sum_sphericalHarmonic` | `l = 1, 2, 3` at `(0.7, 0.3, 2.1, 1.9)` | `−0.402365299699`, `−0.257153248398`, `0.440692772899`, each both sides | holds | — |
| `sphericalHarmonic` Check `Y_{1,1}` | `(θ, φ) = (1, 0.5)` | `−0.255133700347−0.139380175743i` both | holds | — |
| `sphericalHarmonic_hilbertBasis` | read against RiemannianGeometry R8.2 | orthonormality above; density and completeness are R8.2's | true, duplicated | R04 |

- Locators: DLMF Release 1.2.8 (2026-09-15) read at the equation for §§14.2, 14.3, 14.5, 14.8–14.14, 14.16–14.18, 14.20, 14.21, 14.23, 14.24, 14.28, 14.30 and 15.4.30. All fifteen seeded targets match their locators, hypotheses and printed forms, except R01, R02, R03 and R05. The README's "as corrected in DLMF" versions match DLMF's errata list for 14.5.14 (1.0.16), §14.2(iii) (1.0.22), 14.30.4 (1.0.25), 14.6.6 (1.0.28), 14.5.3–14.5.4 and 14.13.1–14.13.2 (1.1.3), and 14.8.3, 14.8.9 (1.1.5).
- Mathlib at the pin: 23 cited names resolved, among them `Complex.Gamma_mul_Gamma_one_sub` (`Gamma/Beta.lean:398`), `Complex.Gamma_mul_Gamma_add_half` (`:580`), `tendsto_tsum_of_dominated_convergence` (`Normed/Group/Tannery.lean:46`) and `Polynomial.coeff_shiftedLegendre` (`RingTheory/Polynomial/ShiftedLegendre.lean:84`). Neither pin defines a Ferrers function, an associated Legendre function or `Y_{l,m}`.
- Tau Ceti at the pin: 12 cited names opened, among them `harmonicSubmodule` (`RingTheory/MvPolynomial/Harmonic.lean:210`), `laplacian_eval_euclidean` (`Analysis/MvPolynomial/Laplacian.lean:43`), `classicalResidueTheorem_circle` (`Analysis/Contour/Residue/Theorem.lean:349`, meromorphic on a closed disc) and `legendreK` (`EllipticIntegral/Legendre.lean:95`).
- Cross-roadmap citations: SpecialFunctionsHypergeometric, now on main, resolved for its Conventions, 1.3 (15.2.3_5), 1.4, Layer 2, 3.1, 3.4, 4.2, 4.3, 5.1–5.5, 6.1 (15.6.1), Layer 7 (15.4.26–15.4.30, 15.8.13–15.8.30), 9.1 (`shiftedLegendre_eval_eq_ordinaryHypergeometric`) and its Downstream assignment of 15.9.16–15.9.23. The local `𝐅` copy is identical to its `Suggested.lean` lines 51–71.
- Also resolved: SpecialFunctionsEiLiErfIncompleteGamma 4.1 and `contFrac` (identical to its `Suggested.lean` line 298); AutomorphicSpectralTheory §§0.35–0.38 at its open head (merge order 96 against 408); RiemannianGeometry R8.2 on main.
- Ownership and overlaps: `overlaps.md` lists no other pull request changing this roadmap and no dropped ids. A grep of all open heads for these objects finds QuantumFoundations 9.3 (operator spectra, consumes R8.2), AutomorphicSpectralTheory §0.35 (cited) and SpecialFunctionsBessel (defers the Legendre formulas). No `Suggested.lean` elsewhere declares these fully qualified names.
- Gate rerun at `b65de58`: every check `0`, OK. Dependency check: `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration (`lake env lean`): 42 warnings, all "declaration uses `sorry`", nothing else. `#check @name` on all 58 declarations: no `variable` or `include` block, no lost binder, and each type matches its README statement. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `decide`, `fun_prop`): 0 of 42 close.

## Not verifiable

- Hobson (1931), Olver (1974), Erdélyi et al. (1953), Adams (1878), Dunster (1991), Volkmer (2021) and Andrews–Askey–Roy (1999) were not opened, because no open copy was fetched. The Hobson locators agree with DLMF's notes to §§14.3, 14.11 and 14.16.
- "14.19.2 … as corrected in DLMF 1.0.1": the errata entry (DLMFerrata line 2235, an OCR of a two-column page) cannot be placed among Versions 1.0.1–1.0.4.
- 14.17.10–14.17.16 and 14.17.18–14.17.20 were not recomputed, and neither were the Beyond remarks on 14.15.23, 14.20.17–14.20.18 and §14.27.

## Source issues

- **Error** in DLMF 1.2.8 at 14.20.10, §14.20(v): the source gives the expansion for 0 ≤ θ ≤ π; at θ = π the left side is infinite and the series diverges (τ = 1: partial sums 15.3, 32.2, 49.2); it should be 0 ≤ θ < π; affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.16(i)–(ii): the source assumes ν ≥ −½ only for 𝖯 and P, but its zero count for 𝖰 needs it: 𝖰^{0.2}_{−2.3} has three zeros while max(⌈ν − |μ|⌉, 0) = 0; it should assume ν ≥ −½ for 𝖰 as well; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.7.21, §14.7(iv): the source equates the sum of 𝖯ₙ(x)h^{−n−1} with (1 − 2xh + h²)^{−1/2} for abs(h) > 1; it should be h^{−1}(1 − 2x/h + h^{−2})^{−1/2}, which differs in sign for h < −1 (x = 0, h = −2: −1/√5); affects a stated result.
- **Error** in DLMF 1.2.8 at 14.12.4, §14.12(ii): the source requires only Re(μ − ν) > 0 and ν + μ ∉ {−1, −2, …}; it should also require Re(μ + ν) > −1, since the integrand grows like e^{0.3t} at (ν, μ) = (−1.5, 0.2); affects a stated result.
- **Error** in DLMF 1.2.8 at 14.14.1, §14.14: the source's left side is ½(x² − 1)^{1/2}P^μ_ν/P^{μ−1}_ν; it should be ½(x² − 1)^{1/2}(ν + μ)(ν − μ + 1)P^{−μ}_ν/P^{1−μ}_ν (at (0.3, 0.4, 1.5): fraction 0.34516, printed 0.81272); affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.16(ii): the source's N₀ + 1 case (a) requires n > m, so neither list covers n = m with δ_ν ≤ δ_μ; it should read n ≥ m (𝖯^{3/4}_{1/4} and 𝖯^{0.3}_{0.3} each have one zero, N₀ = 0); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(ii): the source states the parity rule for the zeros of 𝖰^μ_ν for every real μ; it fails for μ < 0, since at (ν, μ) = (−0.369, −0.206) both cosines are positive and 𝖰^μ_ν ≥ 2.17 on (−1, 1); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(iii), condition (b): the source omits μ > 0; at (ν, μ) = (0.184, −0.088) it predicts one zero, but P^μ_ν ≥ 0.552 on (1, 10⁷) and has none; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.23.7, §14.23: the source's second factor is e^{−3μπi/2}; it should be e^{μπi/2} (at (μ, τ, x) = (0.3, 1.1, 0.4) the printed side is 0.11721 − 0.16132i, and 𝖰̂ is 0.34326); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.2(iii): the source calls 𝖯^{−μ}_ν(±x) recessive at ±1 whenever Re μ ≥ 0; it should require Re μ > 0 or μ = 0, since at ν = 0, μ = i the ratio has modulus 1; affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.21(iii): the source extends 14.3.18 to the cut plane without naming the branch of its 𝐅; with the principal 𝐅 it holds only for Re z > 0 (at z = −0.5 + 0.5i: 0.81311 + 0.57025i against 0.81006 + 0.38836i); affects a stated result.
