# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at 147d18f)

**Verdict:** needs changes

## R01 (P2) — The weight case is already owned by RandomMatrices §8.2 on main, and is handed back to it

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/README.md` lines 102–105 and 889–890: "3.2 and 4.1 here prove them for the polynomials of every orthogonality measure, and RandomMatrices 8.2 can consume them."
**Claim:** A roadmap on main already owns the Gram–Schmidt orthonormal polynomials of a weight with finite moments, their three-term recurrence, Christoffel–Darboux and the reproducing and projection identities. An open roadmap cites main; it does not offer itself to main as supplier.
**Witness:** `TauCetiRoadmap/RandomMatrices/README.md` lines 1162–1170 on main (§8.2): Gram–Schmidt of the monomials in `L²(w)`, "prove their three-term recurrence", "Prove Christoffel–Darboux … the reproducing and projection identities".
**Repair:** In Scope, replace the two "can consume/can take" sentences by: "RandomMatrices §8.2 owns these statements for the orthonormal polynomials of a weight with all moments finite; 3.4, 4.1 and 4.2 here are the statements for every orthogonality measure and every standardization." Add to 3.4 the comparison target: for `μ = w dx`, `orthonormal μ n` is the `n`-th Gram–Schmidt orthonormal polynomial of RandomMatrices §8.2. Delete the RandomMatrices bullet of Downstream consumers.

## R02 (P3) — Gate failure `tex`: a code span broken across two lines

**Location:** README.md lines 586–587: "`(m, n) = (1, 2), (0, 3),` / `(2, 4)`; the `q_n(·; 1)` are multiples of the Jacobi polynomials `P_n^{(1,0)}`."
**Claim:** The span `` `(m, n) = … (2, 4)` `` wraps over the line end, so the scanner pairs the backticks of line 587 wrongly and reads `P_n^{(1,0)}` as bare TeX. The gate fails (`tex=1`).
**Witness:** Gate at 147d18f: "tex (1) — line 587: (2, 4) q_n(·; 1) P_n^{(1,0)}".
**Repair:** Keep the span on one line: "`∫ q_m q_n (1 − x) dx = 0` for `(m, n) = (1, 2), (0, 3), (2, 4)`;" then a new line for the rest.

## R03 (P3) — The module docstring says the Tau Ceti inputs are not at the pins; they are

**Location:** `Suggested.lean` lines 10–14: "Tau Ceti `main` has the completeness of polynomial systems … which are not at the pins; the statements here use only Mathlib."
**Claim:** The three files exist at the pinned Tau Ceti. The Layer section comments are `### Layer k`, where the form asks for `## Layer k`.
**Witness:** Pinned Tau Ceti (2fd255d): `TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean` line 165, `TauCeti/Probability/Moments/Determinacy.lean` line 246, `TauCeti/RingTheory/Polynomial/Hermite/GeneratingFunction.lean` line 80.
**Repair:** "Tau Ceti at the pin has … (same three files); the headline statements need only Mathlib carriers, so the file imports only Mathlib." Write the README's "At Tau Ceti `main`" as "At the pinned Tau Ceti". Change the ten `/-! ### Layer` comments to `/-! ## Layer`.

## R04 (P3) — Padding in `Suggested.lean`: four declarations close in one line

**Location:** `Suggested.lean` lines 47 (`bwdDiff_eq_fwdDiff`), 76 (`eval_imCentralDiff`), 180 (`pairing_eq_ite`), 520 (`corecursive_succ`).
**Claim:** Each restates a definition or is a one-line consequence of it; `pairing_eq_ite` is the field `pairing_eq_zero` of `IsOrthogonal` plus `normSq` unfolded, and does not use a measure hypothesis.
**Witness:** On a probe copy: `simp [bwdDiff, fwdDiff]`; `simp [imCentralDiff, imCentralDiffFun, div_eq_inv_mul]`; `split_ifs with h <;> simp_all [normSq, hp.pairing_eq_zero]`; `induction n using Nat.twoStepInduction <;> simp_all [corecursive, monicThreeTerm]` each close the goal.
**Repair:** Delete the four from `Suggested.lean`. The README keeps the statements, with the four names un-backticked.

## R05 (P3) — `monic_monic` holds without its two hypotheses

**Location:** `Suggested.lean` lines 151–154; README.md lines 315–317: "For `μ` with finite moments and `(n : ℕ∞) < μ.support.encard`: `monic μ n` is monic of degree `n`".
**Claim:** `monic μ n = Xⁿ − Σ_{k<n} c_k · monic μ k` is monic of degree `n` for every `μ` and `n`, by strong induction; neither `hint` nor `hn` is used.
**Witness:** `μ = 0`, `n = 1`: `pairing 0 _ _ = 0`, so `monic 0 1 = X − C (0/0) * 1 = X`, monic of degree 1, while `(1 : ℕ∞) < (0 : Measure ℝ).support.encard = 0` is false.
**Repair:** State `theorem monic_monic (μ : Measure ℝ) (n : ℕ) : (monic μ n).Monic ∧ (monic μ n).natDegree = n`, and move the bullet in 2.2 above "For `μ` with finite moments and …".

## R06 (P3) — 18.2.23: the README assumes `μ` concentrated on `[−1, 1]`, the Lean statement does not

**Location:** README.md line 602: "DLMF 18.2.23, measure form: for `μ` concentrated on `[−1, 1]`, `monic μ (2n) = r_n(2X² − 1)`"; `Suggested.lean` lines 425–432.
**Claim:** `monic_even_odd_Icc` carries only `hμ` and `heven`. The statement is true without the support hypothesis, so the README is narrower than the Lean.
**Witness:** Standard Gaussian, `n = 1`: `∫ (2x² − 1) dμ = 1`, so `r = (X − 1)/2`, `r(2X² − 1) = X² − 1 = monic μ 2`; the support is `ℝ`.
**Repair:** README: "DLMF 18.2.23, measure form: for every even orthogonality measure `μ`, …"; keep the sentence on `μ = w(x) dx` on `(−1, 1)` as the DLMF case.

## R07 (P3) — The Check of 9.1 uses DLMF's index, not the section's

**Location:** README.md lines 760–761: "both sides of 18.2.33 agree for `n = 1, …, 4` (`n = 3`: `1.959431816 + 1.508836788 i`)".
**Claim:** Line 753 states 18.2.33 as `p_n^{(1)}(z) = μ₀⁻¹ ∫ (p_{n+1}(z) − p_{n+1}(x))/(z − x) dμ`. With that indexing `n = 3` has another value; the printed one is `p₂^{(1)}(z)`.
**Witness:** Weight `eˣ` on `[0, 1]`, `z = 2 + i/2`, recomputed from the moments: `p₂^{(1)}(z) = 1.9594318163 + 1.5088367876 i`, `p₃^{(1)}(z) = 2.0888262172 + 3.2120185151 i` (both sides).
**Repair:** "(`n = 2`: `1.959431816 + 1.508836788 i`; `n = 3`: `2.088826217 + 3.212018515 i`)", for `n = 0, …, 3`.

## R08 (P3) — 10.1 cites DLMF 18.2.42–18.2.43 for a different statement, and DLMF's "semi-classical" for a different definition

**Location:** README.md lines 811–813: "DLMF 18.2.42–18.2.43, the lowering and raising forms: there are polynomials `R_n`, `S_n`, … with `π p′_{n+1} = R_n p_{n+1} + S_n p_n`".
**Claim:** DLMF 18.2.42–18.2.43 have an `n`-dependent `π_n` and constants `λ_n`, `μ_n` on `p_{n∓1}`; the target has a fixed `π` and polynomial `S_n`. DLMF calls a system semi-classical when 18.2.44 holds with `s`, `t` independent of `n`; the README defines it by the Pearson equation.
**Witness:** DLMF §18.2(xii), 18.2.42: `π_n(x) p′_n(x) + A_n(x) p_n(x) = λ_n p_{n−1}(x)`; then "If `A_n`, `B_n` are polynomials of degree independent of `n`, and `π_n` is … independent of `n`" before 18.2.44.
**Repair:** In 10.1: "the fixed-`π` form of DLMF 18.2.42–18.2.43, with polynomial coefficients on `p_n` and `p_{n±1}` (DLMF normalizes the second coefficient to a constant by letting `π_n` depend on `n`)". In Conventions: "`IsSemiclassical` is the Pearson-equation definition; it implies DLMF's (18.2.44 with `t = d − 1`, `s = max(deg τ, d − 1)`); the converse is under Beyond."

## R09 (P3) — The boundary sentence leaves out a statement of §18.2(xii)

**Location:** README.md lines 116–118: "this roadmap owns every statement of DLMF §§18.1–18.2 about general orthogonal polynomials, except 18.2.39–18.2.40 …, M. Riesz's completeness theorem, Meixner's classification and the `q`-notation."
**Claim:** DLMF §18.2(xii) also states that the Euler polynomials `E_n` are Sheffer and not orthogonal. It is neither a target of 10.2 nor under Beyond; the pinned Mathlib and Tau Ceti have no Euler polynomials.
**Witness:** DLMF §18.2(xii), Sheffer Polynomials, last paragraph: `B_n(x)` and `E_n(x)` "are examples of Sheffer polynomials which are not OP's". README: no occurrence of "Euler".
**Repair:** Add to Beyond and to the boundary sentence: "the Euler polynomials as a Sheffer system that is not orthogonal (§18.2(xii)), which needs the Euler polynomials of DLMF §24.2".

## R10 (P3) — Routes use inputs the `*Needs:*` lines and contracts do not list

**Location:** README.md line 769: "The partial denominators are nonzero off `[a, b]` because all zeros of `p_k^{(1)}` lie in `(a, b)`"; line 707 "Gershgorin"; line 788 "(Weierstrass)".
**Claim:** `convs'` divides from the tail, so the denominators are ratios of the `k`-th associated polynomials for every `k ≤ n`, not of the first ones. Gershgorin and Weierstrass are used and not listed.
**Witness:** `n = 2`: the innermost denominator is `z − α₂`; `α₂` is a zero of neither `p₁^{(1)} = X − α₁` nor `p₂^{(1)} = (X − α₁)(X − α₂) − β₂`.
**Repair:** 9.2: "… because the zeros of `monicThreeTerm (α ∘ (· + k)) (β ∘ (· + k)) j`, `k + j ≤ n + 1`, are eigenvalues of a principal submatrix of the symmetric `J_{n+1}`, hence lie between its extreme eigenvalues, in `(a, b)`", as a target of 9.1. Add Mathlib `eigenvalue_mem_ball` to 8.4 and `polynomialFunctions.topologicalClosure` to 9.3, and both to the Mathlib contracts.

## R11 (P3) — Fewer than three Checks per definition; no `### Examples`; Layers 6 and 7 have no subsections

**Location:** README.md, every `**Checks.**` list (for example line 438: "`n = 2`: `charpoly = (X − b₀)(X − b₁) − a₀ c₁`"), and the end of every layer.
**Claim:** 1.2, 2.3, 3.1, 3.3–3.5, 4.1–4.3, 5.1, 5.3–5.6, 8.1–8.5, 9.1 and 9.2 have one Check each; none says which wrong definition it excludes. No layer has `### Examples`.
**Witness:** The Check of 3.5 holds for the transposed matrix (`a_i` at `(i + 1, i)`, `c_i` at `(i − 1, i)`): its characteristic polynomial for `n = 2` is the same.
**Repair:** Bring each definition to three Checks, one a non-example or a wrong-model test. For 3.5 add "`n = 2`: `J₂ (p₀, p₁)ᵀ = x (p₀, p₁)ᵀ − a₁ p₂ e₁`, which fails for the transpose unless `c₁ = a₀`". Add `### Examples` to each layer and `### 6.1`, `### 7.1` headings.

## R12 (P3) — Theorems without a locator

**Location:** README.md 8.1 (lines 655–663), 8.3 (line 691: "For `m : ℕ → ℝ`: `Δ_n(m) > 0` for every `n` iff …"), 8.4 first two bullets, 5.2 (Gauss quadrature and `w_i = 1/K_{n−1}`), 9.1 Casoratian bullet, 10.2 ("the converse follows Rota, Kahaner and Odlyzko").
**Claim:** These targets carry no theorem or page locator; "Chihara, Chapter II" (line 682) is a chapter.
**Witness:** 8.3 cites no source; DLMF §18.2 does not state Hamburger's theorem, and the References list no text for the moment problem.
**Repair:** Give each a theorem-number locator read against the text (Chihara for the functional of 8.1, Favard and Hamburger; Szegő §3.4 for quadrature and the Christoffel numbers; the theorem of Rota–Kahaner–Odlyzko used in 10.2).

## R13 (P3) — Eleven declarations have no docstring; one docstring claims more than its statement

**Location:** `Suggested.lean` lines 47, 76, 147, 151, 156, 184, 219, 228, 346, 367, 445; lines 339–340: "The zeros are real, simple, and inside the convex hull of the support".
**Claim:** `bwdDiff_eq_fwdDiff`, `eval_imCentralDiff`, `pairing_self_pos`, `monic_monic`, `pairing_monic_eq_zero`, `orthonormal_spec`, `beta`, `monicThreeTerm_monic`, `zeros_mem_Ioo`, `discr_pos`, `hankelDet_pos` have no docstring. `zeros_spec` does not state the location.
**Witness:** Line 219: `def beta (μ : Measure ℝ) (n : ℕ) : ℝ :=` follows the body of `alpha` with no comment; `zeros_spec` concludes `StrictMono … ∧ (∀ i, eval … = 0) ∧ monic μ n = ∏ …`.
**Repair:** Add a one-line mathematical docstring to each kept declaration; write the docstring of `zeros_spec` as "The zeros are real and simple (DLMF 18.2.19)".

## R14 (P3) — The description's count of `Suggested.lean`

**Location:** Pull-request description: "It states 64 headline theorems and definitions covering every layer." and "(64 headlines)".
**Claim:** The head has 64 sorried theorems and 32 definitions, 96 declarations.
**Witness:** `Suggested.lean` at 147d18f: 64 lines beginning `theorem`, 32 beginning `def` or `structure`; elaboration gives 64 `sorry` warnings.
**Repair:** "It states 64 theorems, with the 32 definitions they need, covering every layer."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `fwdDiff_descPochhammer`, `bwdDiff_ascPochhammer` | `k = 1`; general `k` | `Δ(x² − x) = 2x = 2[x]₁`; `∇(x² + x) = 2x`; factor `(x + 1) − (x − k) = k + 1` | holds over any commutative ring | none |
| 1.1 `sum_range_mul_fwdDiff` | general `N` | summand of LHS + RHS sum = `f(x+1)g(x+1) − f(x)g(x)`, telescopes | holds | none |
| 1.2 `imCentralDiff` | `x`, `x²`, `x³` | `1`, `2x`, `3x² + 2i²/8 = 3x² − 1/4`; DLMF §18.1(i) has `(f(x + i/2) − f(x − i/2))/i` | holds | none |
| 2.1 `IsOrthogonalityMeasure`, `pairing_self_pos` | `δ₀ + δ₁`, `q = X(X − 1)`; a.c. weight; counting weights | pairing `0` on the 2-point support; DLMF 18.2.1_5, 18.2.4, 18.2.4_5 match | holds; the non-example is excluded by infinite support | none |
| 2.2 `monic` | Lebesgue on `[−1, 1]`; `δ₀ + δ₁`; `μ = 0` | `X² − 1/3`, `X³ − 3X/5`; `X − 1/2`, `X² − X`; `monic 0 1 = X` | holds; hypotheses of `monic_monic` unused | R05 |
| 2.3 constants and standardizations | Legendre `P₂` | `h₂ = 2/5`, `k₂ = 3/2`, `k̃₂ = 0`, `k̃̃₂ = −1/2`; DLMF 18.2.5–18.2.7 match | holds | R04 (`pairing_eq_ite`) |
| 3.1 `monicThreeTerm` | `α = 0`, `β = 1/4` | `p₁ = X = U₁/2`, `p_{n+1} = X p_n − p_{n−1}/4` is `U_{n+1} = 2X U_n − U_{n−1}` scaled | holds | none |
| 3.2 `X_mul_eq_recurrence`, `recB_eq_coeff`, `sum_recB` | coefficients of `xⁿ⁺¹`, `xⁿ`, `xⁿ⁻¹`; weight `eˣ` on `[0, 1]` | `b_n = k̃_n/k_n − k̃_{n+1}/k_{n+1}`; `b₀ = 0.581976706869`, `k̃₁ = −0.581976706869` | corrected sign confirmed; DLMF 18.2.11_1 has `+` | none |
| 3.3 first form | Legendre; coefficient of `xⁿ⁻¹` | `A_n = (2n+1)/(n+1)`, `C_n = n/(n+1)`; `k̃̃_{n+1} = A_n k̃̃_n + B_n k̃_n − C_n k_{n−1}` as DLMF 18.2.9 | holds | none |
| 3.4 monic and orthonormal forms | Lebesgue on `[−1, 1]` (exact) | `β₁…β₄ = 1/3, 4/15, 9/35, 16/63 = n²/(4n² − 1)`; `h₁ = h₀β₁` gives `q₁` of 18.2.11_8 | holds | R01 |
| 3.5 `charpoly_jacobiMatrix` | `n = 0, 1, 2`; expansion along last row | `1`; `X − b₀`; `(X − b₀)(X − b₁) − a₀c₁`; `D_{n+2} = (X − b_{n+1})D_{n+1} − a_n c_{n+1} D_n` | holds; `β₀ = a₀c₀` unused | R11 |
| 4.1 `cdKernel_eq`, `cdKernel_self` | Legendre monic, `n = 3`, `x = 0.3`, `y = −0.7` (exact rationals) | both sides `−0.287146875` | holds | none |
| 4.3 `integral_poissonKernel_mul` | Fubini under `hsum`; points with `p_m(y) = 0` | series absolutely summable a.e. where `p_m(y) ≠ 0`; termwise integral `z^m p_m(x)` | holds | none |
| 5.1 `zeros_spec`, `zeros_mem_Ioo` | Lebesgue on `[−1, 1]`, `n = 2`; `n = 0` | `±1/√3`; empty product `1 = monic μ 0` | holds | R13 |
| 5.2 `gauss_quadrature`, `christoffelNumber_eq` | `eˣ` on `[0, 1]`, `n = 4`; `n = 0` | weights `0.20695351, 0.48117108, 0.62617680, 0.40398042`, sum `1.7182818285`; `x⁷`: `0.30549003693` both; `x⁸`: `0.274324` vs `0.274362` | holds; fails in degree `2n` as stated | none |
| 5.4 Jacobi eigenvalues | Lebesgue on `[−1, 1]`, `n = 2` | `((0, 1/√3), (1/√3, 0))`, eigenvalues `±1/√3`; `charpoly_eq` at Mathlib `Analysis/Matrix/Spectrum.lean` line 157 | holds | none |
| 5.5 `discr_eq_prod`, `discr_pos` | `n = 0`, `1`; `He₂…He₅` | `discr (C c) = 1 = c⁰` (`discr_C`), degree 1 gives `1`; `4, 108, 27648, 86400000 = ∏ jʲ` | holds, junk exponent `2·0 − 2 = 0` harmless | none |
| 5.6 kernel polynomials | Legendre, `y = 1`; `y` an atom at the endpoint | `∫ q_m q_n (1 − x) dx = 0` since `(y − x) q_m` vanishes at `y`, degree `≤ n`; `p_n(y) ≠ 0` | holds; 18.2.14–18.2.17 match DLMF | R02 |
| 6 `monic_even_odd`, `monic_even_odd_Icc` | Gaussian, `n = 1`; `He_{2n}` | `r(2X² − 1) = X² − 1`; `He_{2n}(x) = 2⁻ⁿ(−4)ⁿ n! L_n^{(−1/2)}(x²/2)` | holds without the support hypothesis | R06 |
| 7 Hankel formulas | Gaussian `Δ₃`; `eˣ` on `[0, 1]` | `Δ₃ = 2`; `h = 1.718281828459, 0.136305121589, 0.009148349371`; 18.2.29 at `0.37`: `0.02123648015763` both; `k̃₂ = −Δ′₂/Δ₂ = −1.0668201477` | holds | none |
| 8.1 functional of a recurrence | `α = 0`, `β = 1/4` | `L(p₂²) = β₁β₂ = 1/16`, semicircle law of mass 1 | holds | R12 |
| 8.2 `favard`, 8.4 `favard_bounded` | `β = 1/4`; `B = 0`; `A < 0` | Gershgorin radius `|α_k| + √β_k + √β_{k+1} ≤ A + 2B = 1`; `B = 0` or `A < 0` contradict the hypotheses | holds | R10 |
| 8.3 Hamburger | `n = 0`; Gaussian moments; finite support | `Δ₀ = 1`; Gaussian `Δ₃ = 2`; `N` points give `Δ_{N+1} = 0` | both directions hold | R12 |
| 8.5 `hasSum_orthonormal_expansion` | Tau Ceti hypotheses | pinned `orthogonal_span_range_bareNormalizedLp_eq_bot` asks `∃ a > 0, Integrable (exp (a·|x|))`, as the target | holds | R03 |
| 9.1 `corecursive_succ`, `aeval_associated` | `n = 0, 1`; `eˣ`, `z = 2 + i/2` | `1`; `z − α₁`; Casoratian `n = 2`: `0.0053241262` both | holds | R04, R07 |
| 9.2 `jFraction`, `convs'_jFraction` | `convs' 0, 1, 2`; `eˣ`, `z = 2 + i/2` | `0`, `1/(z − α₀)`, `p₁^{(1)}/p₂`; `F₄ = 0.6389990416 − 0.2410064077 i` by fraction, ratio and quadrature sum | holds | R10 |
| 9.3 `markov` | `eˣ`, `z = 2 + i/2`; Lebesgue, `z = 2` | limit `0.6389985876 − 0.2410064428 i`; `½ log 3`; Mathlib `resolvent a r = (r − a)⁻¹`, so the sign `−` is right | holds | R10 |
| 10.1 `structure_relation`, `lowering_raising` | `s = 0`; Laguerre `α = 1/2`; Freud | `s ≥ 1` forced (`τ` constant gives `π = 0`); `x p′₄ = 4p₄ + 18p₃`; `4β₅β₄β₃ = 0.755372` | holds; index range never empty wrongly | R08 |
| 10.2 `isSheffer_iff`, Bernoulli | `B₀…B₄` | `α_n = 1/2`, `β = 1/12, 1/6, 1/4`; constant term `−1/24 ≠ B₄(0) = −1/30` | holds | R09 |
| 10.3 `sqrt_weight_mul_abs_le` | `n = 0`; value of `w` at a jump | `√w(x)·|c| ≤ √w(b)·|c|`; DLMF §18.2(xii) states it with Szegő, Theorem 7.2 | consistent with DLMF | none |

- Source locators checked against the text: DLMF §18.1(i) and every equation 18.2.1–18.2.46 the README cites (Release 1.2.8); one misprint confirmed (18.2.11_1), one mismatch (R08).
- Library declarations opened at the pins, among them `Polynomial.discr` and `discr_C` at `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` lines 934, 938; `resolventTransform` at `Mathlib/MeasureTheory/Measure/ResolventTransform.lean` line 108; `Measure.support` at `Mathlib/MeasureTheory/Measure/Support.lean` line 59; the Tau Ceti contracts of 8.4, 8.5 and 10.2.
- Cross-roadmap citations resolved: RandomMatrices §8.2 (main, R01), OrthogonalL2Bases (completed; excludes Gram–Schmidt, Favard and recurrences, no overlap), LaguerreJacobi (open; excludes the general theory, no overlap).
- Ownership by object against main and the open pull requests (Favard, Hamburger, Hankel determinants, Gauss quadrature, Christoffel–Darboux, Jacobi matrix, Sheffer, J-fraction, backward difference): only R01. No pinned Mathlib or Tau Ceti file states any of them.
- Dependency check: "depcheck: 207 roadmaps, 1914 edges, 0 problem(s)"; no UPWARD or CYCLE line.
- Gate at 147d18f: FAIL on `tex=1` (R02); every other check 0, build 0.
- Elaboration of `Suggested.lean`: 64 `sorry` warnings and nothing else. One-tactic probe on 14 theorems: 4 close (R04), 10 do not.
- Numerical Checks recomputed from exact moments (80-digit decimals, exact rationals for Legendre): 3.2, 4.1, 5.2, 7, 9.1, 9.2, 9.3, 10.1 agree with the README except the index in R07.

## Not verifiable

- Szegő, *Orthogonal Polynomials* (§3.3, §7.2, Theorem 7.2): no legal copy found; the statement of Theorem 7.2 was read only as DLMF §18.2(xii) reports it.
- Chihara, *An Introduction to Orthogonal Polynomials* (Chapter II, the route of 8.2): no legal copy found.
- Rota, Kahaner and Odlyzko (the converse in 10.2): the DOI resolves only to a paywalled page.
- Ismail, Theorem 4.7.12; Andrews–Askey–Roy, Chapter 5; Gautschi: not read; cited only under Beyond or References.
- The status of Mathlib pull requests #38496, #38485 and #39498 (README, Prior formalization): not checked.
- The three numerical Checks of 10.3 and the Check of 6 for `e^{−x⁴}` and `(1 − x²)^{0.3}(1 + x²)`: not recomputed.

## Source issues

- **Misprint** in DLMF (Release 1.2.8) at 18.2.11_1, §18.2(iv): the source says the sum of `b_j` for `j = 0, …, n` equals `k̃_{n+1}/k_{n+1}`; it should be `−k̃_{n+1}/k_{n+1}`, by telescoping 18.2.11 with `k̃₀ = 0`; affects a stated result.
