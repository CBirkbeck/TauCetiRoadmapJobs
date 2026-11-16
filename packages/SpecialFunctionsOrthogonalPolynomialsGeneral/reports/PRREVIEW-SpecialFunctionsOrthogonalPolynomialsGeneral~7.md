# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at 94e88bc)

**Verdict:** needs changes

## Previous findings

The previous review (of acaee4a) accepted with no finding; the three repairs it recorded are still in place at this head: §§7.1, 7.4 and 10.4 keep "Simon (1998), Proposition 5.7, p. 52", "Proposition 1.5, p. 6" and "Magnus (1995), §3, p. 8" (all three now checked against the texts); §7.1 keeps "induction on `min(m, n)`" and §7.2 the tail bound `R^{−j−2} ∫ x^{2j+2} dν_n`; §10.3 cites DLMF §18.2(xii) for `not_isOrthogonal_bernoulli`.

## R01 (P2) — §1.3: the diagonal conjugation is false when `a_{k−1}` and `c_k` are negative

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/README.md` lines 326–328: "when `a_{k−1} c_k > 0` it is conjugate by a positive diagonal matrix to the symmetric matrix with off-diagonal entries `√(a_{k−1} c_k)`".

**Claim:** Conjugation by a positive diagonal `D` keeps the sign of each off-diagonal entry (`(D⁻¹JD)_{k−1,k} = a_{k−1} d_k/d_{k−1}`), so the statement fails whenever some `a_{k−1} < 0`; this is the case of Laguerre's `L_n` in the Check of §3.2 (`A_n = −1/(n+1)`, so `a_n < 0`, `c_n < 0`).

**Witness:** `n = 2`, `b = 0`, `a₀ = c₁ = −1`: `J₂ = ((0, −1), (−1, 0))`, `a₀c₁ = 1 > 0`; every positive-diagonal conjugate has `(0,1)` entry `−d₁/d₀ < 0`, never `√(a₀c₁) = 1`.

**Repair:** Replace by: "when `a_{k−1} c_k > 0` for `1 ≤ k < n` it is conjugate by an invertible real diagonal matrix `D`, `d_k/d_{k−1} = sgn(a_{k−1}) √(c_k/a_{k−1})`, to the symmetric matrix with off-diagonal entries `√(a_{k−1} c_k)`; `D` can be taken positive exactly when every `a_{k−1} > 0`". On the witness `D = diag(1, −1)` gives `((0, 1), (1, 0))`. Add the witness as a Check of §1.3.

## R02 (P3) — gate: `empty-sections` fails

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/Suggested.lean` line 785: "`/-! ## Suppliers cited in `README.md` -/`".

**Claim:** The gate rule "no `/-! ## ... -/` section header in Suggested.lean without a declaration under it" fails: only `#check` lines follow this header. No acceptance while the gate fails.

**Witness:** Gate at 94e88bc: `empty-sections=1 … FAIL`, "line 785: Suppliers cited in `README.md`"; lines 787–855 are 69 `#check` commands and no declaration.

**Repair:** Replace line 785 by the line comment `-- Suppliers cited in README.md` (no `/-! ## -/` header), keeping the `#check` block.

## R03 (P3) — three definitions that no theorem of `Suggested.lean` uses

**Location:** `Suggested.lean` line 168 `def subNextCoeff`, line 416 `def gaussMeasure`, line 704 `def imCentralDiffFun`.

**Claim:** `Suggested.lean` keeps a definition only when a headline statement needs it. None of the 71 theorems mentions these three.

**Witness:** In `Suggested.lean` each of `subNextCoeff`, `gaussMeasure`, `imCentralDiffFun` occurs once, in its own `def`; every other `def`/`structure` (28) occurs in at least one theorem statement.

**Repair:** Delete the three definitions from `Suggested.lean`. In the README (lines 147, 163, 425, 745, 754, 806, 1151, 1211, 1214) keep the objects in prose with their formulas (`k̃̃_n`, `Σ_i w_i δ_{x_i}`, `(f(z + i/2) − f(z − i/2))/i`) and no backticked Lean name.

## R04 (P3) — "every conclusion the README attaches to it" does not hold for four names

**Location:** README lines 80–81 and the module docstring of `Suggested.lean` (lines 15–16): "`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the README attaches to it".

**Claim:** Four Lean names follow conclusions in the README that the Lean statement does not contain, so README and Lean differ in generality at those names.

**Witness:** §8.1 `hasSum_orthonormal_expansion`: no `Σ_n h_n |λ_n|² = ‖f‖²`, orthonormal system only. §5.6 `discr_pos`: no product formula. §10.2 `imCentralDiff_natDegree_leadingCoeff`: no `δ_xⁿ p = n!·lc`. §3.3 `X_mul_orthonormal`: no `q₀`, `q₁`.

**Repair:** In each of the four places move the backticked name so that it directly follows the conclusion the Lean states (§8.1: after "`f = Σ_n λ_n p_n` in `L²(μ)`", for the orthonormal system; §5.6: after "`> 0`", with the product formula attributed to `discr_eq_prod` and `zeros_spec`; §10.2: after the degree and leading-coefficient clause; §3.3: after the recurrence at `n + 1`), leaving the remaining conclusions as prose targets.

## R05 (P3) — §5.7 cites only a statement without proof for the monotonic-weight bound

**Location:** README lines 838–839: "(`sqrt_weight_mul_abs_le`; DLMF §18.2(xii), where it is credited to Szegő)".

**Claim:** DLMF states the bound in one sentence, without proof, and refers to the primary source; the roadmap states it also on `(−∞, b]` and `[a, ∞)` and gives no route. A headline theorem needs the locator of the text that proves it.

**Witness:** DLMF §18.2(xii), paragraph on monotonic weight functions: the statement for `[a, b]` with `b < ∞` ends with a reference to Szegő (1975), Theorem 7.2; the README's References do not list Szegő.

**Repair:** Cite "G. Szegő, *Orthogonal Polynomials*, 4th ed., AMS Colloquium Publications 23, 1975, Theorem 7.2" with its printed page at the claim, add it to References, confirm there that the theorem allows an infinite left (right) endpoint, and add a one-sentence route to §5.7.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `monicThreeTerm` | `α=0, β=¼`, n=2,3; `β_k=k`, n=2 | `X²−¼ = U₂/4`, `X³−X/2 = U₃/8`; `X²−1 = He₂` | holds; DLMF 18.2.11_5 agrees | none |
| 1.2 Casoratian, `corecursive` | n=1, n=2 symbolic | n=1: `β₁`; n=2: `β₂(p₁(X−α₁) − p₂) = β₁β₂`; `corecursive 2 = X−α₁` | holds; DLMF 18.2.31–32, Simon (2.8)–(2.11) agree | none |
| 1.3 `charpoly_jacobiMatrix`; symmetrization | n=3 `a=(1,2,3)`, `c=(0,5,7)`; n=2 `a₀=c₁=−1` | `X³−19X` both sides; positive `D` gives entry `−d₁/d₀`, not `1` | charpoly holds; symmetrization fails | R01 |
| 1.4 `conts_jFraction` | n=0,1,2 from Mathlib's `conts` recurrence | `(0,1)`, `(1, z−α₀)`, `(z−α₁, (z−α₀)(z−α₁)−β₁)` | holds | none |
| 2.1 `IsOrthogonalityMeasure`, `pairing_self_pos` | `δ₀+δ₁`, `q=X(X−1)`; Cauchy; uncountable `X` in `sum_dirac` | pairing `0`; `x²` not integrable; summable positive weights force `X` countable | definition excludes both; no junk case | none |
| 2.2 `monic` | `δ₀+δ₁`, n=1,2; division-by-zero junk | `X−½`; `X²−½−(X−½) = X²−X`; monic for every `μ` since correction has degree `<n` | holds | none |
| 2.3 constants, `orthonormal` | Legendre `P₂`; Lebesgue n=0,1 | `h₂=2/5`, `k₂=3/2`, `k̃̃₂=−½`; `1/√2`, `√(3/2)X` | holds; DLMF 18.2.5–7 agree | none |
| 2.4 Hankel | Gaussian; `δ₀+δ₁`; `eˣ` on `[0,1]`, n=3, x=0.37 | `Δ₃=2`; `Δ₂=1`, `Δ₃=0`; det/`Δ₃` = `0.0212364801576` = `p₃(0.37)`; `h` = 1.718281828, 0.1363051216, 0.009148349372 | holds | none |
| 2.5 least squares | Lebesgue, `f=|x|`, n=2 | `S₂=3/16+15x²/16`; error `2/3−21/32 = 1/96`; `q=x²`: `1/15` | holds | none |
| 3.1 `sum_recB`, `recB_eq_coeff` | `eˣ` on `[0,1]`, monic, n=0; telescoping | `b₀ = 0.5819767069`, `k̃₁ = −0.5819767069`; sum `= k̃₀/k₀ − k̃_{n+1}/k_{n+1}` | minus sign holds; DLMF 18.2.11_1 prints plus | none |
| 3.2 first form | Laguerre `α=½`, n=1 | `(A,B,C) = (−½, 7/4, ¾)`; `C_n = (A_n/A_{n−1})h_n/h_{n−1}` | holds | none |
| 3.5 `alpha_beta_eq_hankel` | `eˣ` on `[0,1]`; n=0 | `α₁ = 0.4848434409`, `β₁ = 0.0793264058` from determinants and from recurrence; `α₀ = m₁/m₀` with `Δ′₀=0` | holds | none |
| 4.1 `cdKernel_eq` | Legendre monic n=3, (0.3, −0.7); n=0; `P_n`, n=1 | `−0.287146875` both; `k₀²/h₀` both; `(1+3xy)/2`, ratio `1` vs `9/4` | holds | none |
| 4.3 `inv_cdKernel_self_le` | Lebesgue n=1, y=1 | `K₁(1,1)=2`; `∫((1+3x)/4)² = ½`; `(1+x)/2` gives `2/3` | holds | none |
| 5.2 zeros as eigenvalues | Gaussian n=3; Lebesgue n=2 | `J₃`: `X³−3X = He₃`; `±1/√3` | holds | none |
| 5.3 `gauss_quadrature`, `christoffelNumber_eq`, `moment_eq_jacobiMatrix_pow` | `eˣ`, n=4; Lebesgue N=2 | weights `0.20695352, 0.48117108, 0.62617680, 0.40398043 = 1/K₃`; `x⁷`: 0.30549003693 both; `x⁸`: 0.27432415 vs 0.27436153; `(J₂⁴)₀₀=1/9` vs `1/5` | holds; fails at degree `2n` as stated | none |
| 5.5 `markov_stieltjes` | `eˣ`, n=4, j=2 | `0.6881246 ≤ 1.0013814 ≤ 1.3143014`; `√x` sums 1.3108325, 1.2646133, 1.2569626, 1.2560501 → 1.2556301 | holds | none |
| 5.6 `discr_eq_prod`, `discr_pos` | n=0,1 at Mathlib's `discr`; `Heₙ`, n=2..5 | `discr (C c) = 1 = c⁰`; degree 1: `1`; `4, 108, 27648, 86400000` | holds, no junk at `2n−2` | none |
| 5.7 `sqrt_weight_mul_abs_le` | `eˣ` on `[0,1]`, n=1; `(1+x)^β`; jump of `w` at `x` | `0.58198` at 0, `0.68921` at 1; `2^{β/2}` at 1; `w(x) ≤ w(x+)` keeps the bound | holds on these; proof locator missing | R05 |
| 6.1 `isOrthogonal_kernelPolynomial` | Lebesgue, y=0 (side condition dropped) | `q₁(·;0) = ½`, degree 0 | hypothesis needed, present | none |
| 6.2 `monic_comp_neg` | Lebesgue n=3; `eˣ` on `[−1,1]` | `X³−3X/5` odd; `α₀ = coth 1 − 1 = 0.3130352855` | holds; evenness needed | none |
| 6.3 `monic_even_odd` | Lebesgue; density under `t=x²`; leading coefficient under `2x²−1` | image `t^{−½}dt`, mean `⅓`, `r₁(X²)=X²−⅓`; factor `2·1/(2√t)`; `2ⁿ` | holds | none |
| 7.1 functional | `α=0, β=¼` | `L(p₂²) = 1/8 − 1/8 + 1/16 = 1/16 = β₁β₂` | holds; Simon Prop. 5.7 p. 52, (5.37) p. 56 agree | none |
| 7.2 `favard` | `α_n=n, β_n=n+1`; tail inequality at `|x|=R` | `1, 2, 6, 24, 120`; `Rʲ = R^{2j+2}/R^{j+2}` | holds; DLMF §18.2(viii) agrees | none |
| 7.3 Hamburger | Gaussian; `δ₀+δ₁`; n=0 | `Δ₃=2`; `Δ₃=0`; `Δ₀=1>0` both directions | holds; Simon Theorem 1, p. 4 agrees | none |
| 7.4 `favard_bounded` | `α=β=1`, `A=B=1`; `M=0` in the auxiliary | moments `1,1,2,4,9,21 ≤ 3ᵏ`, support `[−1,3]`; `ν(|x|≥ε) ≤ 0` | holds; Simon Prop. 1.5, p. 6 agrees | none |
| 8.1 expansion | Lebesgue, `f=|x|` | `λ₀=½`, `λ₂=5/8`, Parseval total `2/3` | holds; Lean omits Parseval | R04 |
| 8.2 `integral_poissonKernel_mul` | Mehler at (0.3, −0.7, 0.4); atom at a zero of `p_m` | `0.9342031102` both; integrand `0` either way where `p_m(y)=0` | holds, `tsum` junk harmless | none |
| 9.1 `aeval_associated` | `eˣ`, `z=2+i/2`, n=2,3; n=0 | `1.959431816+1.508836788i`, `2.088826217+3.212018515i` both sides; `μ₀⁻¹μ₀=1` | holds; DLMF 18.2.33 agrees | none |
| 9.2 `convs'_jFraction` | Lebesgue z=2; `eˣ` n=3 | `F₁=½`, `F₂=6/11`; `F₄ = 0.6389990416−0.2410064077i` | holds; DLMF 18.2.35–36 agree | none |
| 9.3 `markov` | `eˣ`, `z=2+i/2`; Lebesgue z=2 | limit `0.6389985876−0.2410064428i`; `½ log 3 = 0.5493` | holds | none |
| 10.1 differences | `(x)_{k+1}`; `x²`; parts formula from `Δ(fg)` | `(x)_k((x+k)−(x−1)) = (k+1)(x)_k`; `∇x²=2x−1`, `Δx²=2x+1` | holds | none |
| 10.3 `isSheffer_iff`, Bernoulli | `B₀..B₄`; converse with `f=Σp_n(0)tⁿ/n!` | `α=½`, `β=1/12, 1/6, 1/4`; constant `−1/24` vs `B₄(0)=−1/30`; `f(0)=p₀(0)=1` | holds; DLMF 18.2.45–46 agree | none |
| 10.4 `structure_relation`, `lowering_raising` | Freud `e^{−x⁴}`, n=5; Laguerre `α=½`, n=4; `d=0` truncation; Jacobi | `4β₃β₄β₅ = 0.7553716`; `(n+α)n = 18`; `deg τ ≥ 1` forced when `d=0`; `R, S` of degree `≤ max(d−1, s−1)`; `τ = b−a−(a+b+2)x` | holds; Magnus p. 8 agrees | none |

- Source locators checked against the text: 40 DLMF equations and subsections (Release 1.2.8), 7 of Simon (arXiv version), 1 of Magnus (arXiv version); all agree with the README.
- Seeded sample: 15 targets; for each, the DLMF, Simon and Magnus locators were read and the statements recomputed; their book locators are under Not verifiable.
- Library declarations opened at the pin: `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934,938,943,956` (`discr`, `discr_C`, degree 1 and 2), `Mathlib/MeasureTheory/Measure/Support.lean:59`, `Mathlib/Algebra/BigOperators/Module.lean:60`; all 69 `#check`s resolve.
- Cross-roadmap citations resolved on main: ClassicalArithmeticCompletion §6.21 (shifted `D_n`, `D₀ = 1`, monic change of basis) and RandomMatrices §8.2; no outside-folder change.
- Gate: fails on `empty-sections` only (R02); every other scanner and the targeted build pass.
- Elaboration: `lake env lean` on `Suggested.lean` gives 71 `sorry` warnings and nothing else. The file has no `variable` line, so no declaration can lose a binder; the 102 elaborated signatures were compared with the README (differences: R04).
- One-tactic probe (`simp`, `rfl`, `exact?`) on a scratch copy: 0 of 71 theorems close; no padding found.
- Dependency check: `depcheck: 252 roadmaps, 2394 edges, 0 problem(s)`; no UPWARD or CYCLE line. Pull-request text: counts (71 theorems, 31 definitions, 7 Tau Ceti modules), the ten layers, suppliers and exclusions agree with the head.

Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsGeneralizedHypergeometric, OrthogonalL2Bases, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric; nothing shared: named families stay with LaguerreJacobi, `L²` completeness with OrthogonalL2Bases (which excludes Gram–Schmidt and Favard), the Hankel determinant with ClassicalArithmeticCompletion §6.21, and the weight-case orthonormal polynomials with RandomMatrices §8.2, which the README cites and compares in §3.3.

Source independence: 10 passages compared with 3 sources (DLMF, Simon, Magnus), none shared; largest share DLMF, 53 of 174 locators; contents compared with DLMF §18.2(i)–(xii): independent (Layer 1 has no counterpart, §18.2(ii) is Layer 10, §18.2(ix) is inside Layer 2, kernel polynomials move from §18.2(v) to Layer 6; the order of Layers 3–5 is forced by their *Needs* lines). The five books (Chihara, Gautschi, Ismail, Andrews–Askey–Roy, Schmüdgen) and Koekoek–Lesky–Swarttouw could not be read, so wording and contents were not compared with them.

## Not verifiable

- Chihara (1978), all locators (sampled: 1.1, 1.2, 1.4, 2.1, 2.3, 5.3, 6.2, 7.1–7.3, 9.2): no legal text found by the sources service.
- Gautschi (2004), all locators (sampled: 1.1, 1.2, 5.2, 5.3, 6.2, 7.1, 9.2): publisher page refused access; no open copy.
- Ismail (2005), all locators (sampled: 1.3, 5.3, 7.1, 7.2, 10.3): publisher page only; no open copy.
- Andrews–Askey–Roy (1999), all locators (sampled: 2.1, 5.3, 9.2): publisher page only; no open copy.
- Schmüdgen (2017), all locators (sampled: 1.1, 3.1, 6.2, 7.1–7.3): no legal text found.
- Koekoek–Lesky–Swarttouw (2010), (1.16.1)–(1.16.3), p. 26: paywalled.
- Szegő (1975), Theorem 7.2, the primary source of §5.7: not cited by the README and not read (R05).

## Source issues

- **Error** in DLMF at (18.2.11_1), §18.2(iv), Release 1.2.8: the source says the sum of `b_j` for `j ≤ n` equals `k̃_{n+1}/k_{n+1}`; it should be `−k̃_{n+1}/k_{n+1}`, by telescoping its own (18.2.11) with `k̃₀ = 0`; affects a stated result.

## For the human reviewers

- **Licence.** README lines 1349–1385 name `lean-DLMF` (github.com/bjbraams/lean-DLMF, stated as Apache-2.0, directory `DLMF/OrthogonalPolynomials/`) as prior formalization by the pull request's author; the declarations of `Suggested.lean` were not compared with that repository.
- **Not tested.** Wording and arrangement were compared with DLMF, Simon and Magnus only; the five cited books and Koekoek–Lesky–Swarttouw had no legally readable text, so parts 1 and 2 of the copyright check were not run against them.
