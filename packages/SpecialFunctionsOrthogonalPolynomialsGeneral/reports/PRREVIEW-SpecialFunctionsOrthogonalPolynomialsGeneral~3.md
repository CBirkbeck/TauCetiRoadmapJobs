# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at ab9f5aa)

**Verdict:** needs changes

## R01 (P3) — ClassicalArithmeticCompletion §6.21 is cited by Lean names it does not have, and the gate fails

**Location:** `TauCetiRoadmap/SpecialFunctionsOrthogonalPolynomialsGeneral/README.md` lines 240–241: "`shiftedHankelDet a n = det (a_(i+j+1))_{i,j<n}` … and `shiftedHankelDet_monic_basis`, the invariance …"; also lines 111, 166, 742, 754, 758–759; `Suggested.lean` lines 17, 437–445; the description's Dependencies paragraph.
**Claim:** ClassicalArithmeticCompletion §6.21 describes `D_n(a)` and its invariance under a monic change of basis in prose only. Neither `shiftedHankelDet` nor `shiftedHankelDet_monic_basis` exists outside this pull request. The gate fails `readme-ids-missing` on the second name.
**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` on main, line 12093 (`D_n(a)=det H_n(a)`) and line 12104 (an unnamed invariance bullet). `roadmaps grep shiftedHankelDet` finds only #2192. Gate output: `readme-ids-missing: shiftedHankelDet_monic_basis`.
**Repair:** README:
- Write "ClassicalArithmeticCompletion §6.21's `D_n(a) = det (a_(i+j+1))_{i,j<n}`" for `shiftedHankelDet` (lines 111, 166, 240, 742, 758).
- Write "the invariance of `D_n` under a monic change of basis (ClassicalArithmeticCompletion §6.21)" for `shiftedHankelDet_monic_basis` (lines 241, 754, 759).

Lean: delete `shiftedHankelDet` and its docstring sentence (line 17), and set `def hankelDet (m : ℕ → ℝ) (n : ℕ) : ℝ := (Matrix.of fun i j : Fin n => m (i + j)).det`. This elaborates on a copy of the file, and `hankelDet m 0 = 1` closes by `simp [hankelDet]`.

Description: replace "(`shiftedHankelDet`, with entries `a_(i+j+1)`)" with "(`D_n(a) = det(a_(i+j+1))`)". Delete "`Suggested.lean` carries a local copy of `shiftedHankelDet`." Change "the 32 definitions" to "the 31 definitions".

## R02 (P2) — The weight criterion of 10.1 does not exclude `π = 0`

**Location:** README.md lines 978–980: "if `w ≥ 0` is differentiable on an open interval `(a, b)` …, with `(π w)′ = τ w` there, `x^k π(x) w(x) → 0` at both ends …, then that measure is semi-classical for `(π, τ)`."
**Claim:** `IsSemiclassical μ π τ` requires `π ≠ 0`. Every hypothesis of the bullet holds for `π = τ = 0`, so its conclusion is false there.
**Witness:** `π = τ = 0`, `w = 1` on `(−1, 1)`: `(πw)′ = 0 = τw`, and `xᵏ π w = 0`. Lebesgue measure on `[−1, 1]` is an orthogonality measure, but `IsSemiclassical μ 0 0` asserts `0 ≠ 0` (`Suggested.lean` line 570).
**Repair:** "- weights: if `π ≠ 0` and `w ≥ 0` is differentiable on an open interval `(a, b)` …". Add the Check: "`π = τ = 0` satisfies `(πw)′ = τw` for every `w`, and the hypothesis `π ≠ 0` excludes it."

## R03 (P2) — The auxiliary support bound of 8.4 needs `M ≥ 0`

**Location:** README.md lines 837–838: "a finite measure `ν` with `∫ x^{2k} dν ≤ C M^{2k}` for all `k` is concentrated on `[−M, M]`"; the same statement in the Scope table, line 99.
**Claim:** For `M < 0`, `M^{2k} = |M|^{2k}`, so the hypothesis can hold while `[−M, M]` is empty.
**Witness:** `M = −1`, `C = 1`, `ν = δ₀`: `∫ x^{2k} dδ₀ = 0^{2k} ≤ 1 = C M^{2k}` for every `k ≥ 0`, but `[−M, M] = [1, −1] = ∅` and `δ₀(∅) = 0 ≠ 1`.
**Repair:** In both places: "a finite measure `ν` and `M ≥ 0` with `∫ x^{2k} dν ≤ C M^{2k}` for all `k` …". 8.4 applies the bound with `M = A + 2B ≥ 0`, so the change costs nothing.

## R04 (P3) — Claims still without a locator (R07 of the previous review, partly repaired)

**Location:** README.md 4.3 line 558 (`integral_poissonKernel_mul`); 8.1 lines 784–791; the auxiliary of 8.2 (line 810, Scope line 97); 8.4 lines 837–842; 9.1 lines 894–903 (zero interlacing, `associated_roots_mem_Ioo`); 10.1 line 972 (`structure_relation`); 10.2 lines 1004–1005.
**Claim:** None of these claims has a theorem or page locator. 4.3 cites 18.2.41, which only defines `P_z`. 10.1 cites 18.2.44, which is DLMF's definition of semi-classical and does not derive the relation from the Pearson equation. The 8.2 auxiliary appears only inside a route parenthesis.
**Witness:** DLMF182 lines 2861–2865 (18.2.41: definition and convergence only) and 2937–2973 (18.2.44 as definition). Simon1998 line 2349 (Proposition 5.7, p. 52) states the reality and interlacing that 9.1 needs.
**Repair:**
- 9.1: "the zeros of `p_n^{(1)}` are real and interlace with those of `p_{n+1}` (Simon (1998), Proposition 5.7, p. 52; his `Q_N` is a multiple of `p_{N−1}^{(1)}`)". For `associated_roots_mem_Ioo`: "(`k = 1` is Simon (1998), Proposition 5.7; general `k` follows by the same min–max argument)".
- 10.2: add "(DLMF §18.2(xii))" at the Bernoulli bullet.
- 8.2: state the auxiliary as a bullet with its hypotheses.
- 4.3, 8.1, the 8.2 auxiliary, the first two bullets of 8.4, and `structure_relation`: give a theorem-and-page locator read against a legal text.

## R05 (P3) — The Checks of 3.3 leave the sign of `B_n` untested

**Location:** README.md lines 464–465: "Legendre: `A_n = (2n + 1)/(n + 1)`, `B_n = 0`, `C_n = n/(n + 1)`. Hermite `He_n`: `A_n = 1`, `B_n = 0`, `C_n = n`."
**Claim:** The coefficients `A_n`, `B_n`, `C_n` have two Checks, both with `B_n = 0`. A wrong sign in `B_n = −a_n⁻¹ b_n` (18.2.11_3) passes both, and the definition lacks a third, discriminating Check.
**Witness:** Laguerre at `α = ½`, computed by 18.2.9 from the monic system: `(A₁, B₁, C₁) = (−½, 7/4, ¾)`, matching DLMF189 lines 235–238 (Table 18.9.1). The opposite sign gives `B₁ = −7/4`.
**Repair:** Add the Check: "Laguerre `L_n^{(α)}` (weight `x^α e^{−x}` on `(0, ∞)`): `A_n = −1/(n + 1)`, `B_n = (2n + α + 1)/(n + 1)`, `C_n = (n + α)/(n + 1)` (DLMF Table 18.9.1). At `α = ½`, `n = 1` this is `(−½, 7/4, ¾)`; the opposite sign in `B_n = −a_n⁻¹ b_n` would give `B₁ = −7/4`."

## R06 (P3) — Mathlib pull-request numbers in the README (R10 of the previous review, not repaired)

**Location:** README.md lines 1103–1105: "Mathlib pull requests that are prior art: #38496 (an algebraic Favard theorem for a linear functional), #38485 (Hankel determinants through J-fractions), and #39498 (umbral operators …)."
**Claim:** The README may not cite pull requests by number. The repair removed only the words "Closed, unmerged".
**Witness:** The previous review's R10 asked for the paragraph to be deleted. The description's Overlaps paragraph already records the three numbers and their status.
**Repair:** Delete lines 1103–1105.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 forward and backward differences (sample): `bwdDiff_iter_eq_sum`, `fwdDiff_descPochhammer`, `bwdDiff_ascPochhammer`, `sum_range_mul_fwdDiff` | `n = 1, 2`; general `k`; `x²` | `f(x) − 2f(x−h) + f(x−2h)` both; `[x]_k((x+1) − (x−k)) = (k+1)[x]_k`; `∇x² = 2x−1`, `Δx² = 2x+1`; DLMF181 lines 146–160 | holds | none |
| 1.2 `imCentralDiff_natDegree_leadingCoeff`, `imCentralDiff_map_real` | `x`, `x²`, `x³`, `1` | `1`, `2x`, `3x² − 1/4`, `0`; DLMF181 line 165 | holds | none |
| 2.1 orthogonality measures (sample): `isOrthogonalityMeasure_withDensity`, `_sum_dirac` | finite support; uncountable `X`; Cauchy | finite support forces `μ(ℝ) = 0`, contradicting `∫_s w > 0`; `n = 0` summability forces countable `X`; `x²` not integrable; DLMF182 lines 169–171, 320–322, 368–374 | holds | none |
| 2.2 `monic_monic`, `pairing_monic_eq_zero`, `eq_monic`, `eval_monic_eq_zero_of_mem_support` | Lebesgue; `δ₀ + δ₁` | `X² − 1/3`, `X³ − 3X/5`; `X² − X` vanishes at `0, 1`; Gram–Schmidt without division gives `X² − 2/3`, integral `−2/3` | holds | none |
| 3.2 `X_mul_eq_recurrence`, `recB_eq_coeff`, `sum_recB`, `recA_mul_recC_pos` | weight `eˣ` on `[0, 1]` | `b₀ = 0.5819767069 = −k̃₁/k₁`; DLMF182 line 983 still prints `+` (Release 1.2.8, line 3106) | corrected sign holds | none |
| 3.3 first form (sample) | Legendre; Laguerre `α = ½`, `n = 1…4` | formulas = DLMF182 lines 802–811, 846–850, 1056–1062; `(A,B,C)_n = (−1/(n+1), (2n+3/2)/(n+1), (n+½)/(n+1))` = DLMF189 lines 235–238 | holds; Checks blind to `B_n` sign | R05 |
| 3.4 monic and orthonormal forms (sample): `monic_eq_monicThreeTerm`, `X_mul_orthonormal`, `orthonormal_eq_gramSchmidtNormed` | `eˣ` on `[0, 1]` | DLMF182 lines 1101–1107, 1138–1149, 1188–1190, 1218–1266 match at `n + 1`; `α₁ = 0.4848434409`, `β₁ = 0.0793264058` by Gram–Schmidt and 18.2.30 | holds | none |
| 3.5 `charpoly_jacobiMatrix` | `n = 0, 1, 2, 3` | `1`; `X − b₀`; `(X−b₀)(X−b₁) − a₀c₁`; last-row expansion `(X−b₂)D₂ − a₁c₂D₁`; entries = DLMF182 line 1742 | holds | none |
| 4.1 Christoffel–Darboux (sample): `cdKernel_eq`, `cdKernel_self` | monic Legendre `n = 3`, `(0.3, −0.7)`; Legendre `n = 1` | `−91887/320000` both sides, exact; `(1 + 3xy)/2` both; DLMF182 lines 1397, 1502 | holds | none |
| 4.3 Poisson kernel (sample): `integral_poissonKernel_mul` | Mehler `(0.3, −0.7, 0.4)`; `z = 0` | `0.9342031102` by series and closed form; `k₀δ_{m0}` both; DLMF182 lines 2828–2865 define `P_z` only | holds; no locator | R04 |
| 5.1 `zeros_spec`, `zeros_mem_Ioo` | Lebesgue `n = 2`; `a > b` | `±1/√3`; `a > b` forces `μ = 0`, excluded; DLMF182 lines 1729–1730 | holds | none |
| 5.2 Gauss quadrature and Christoffel numbers (sample): `gauss_quadrature`, `christoffelNumber_eq` | `eˣ` on `[0, 1]`, `n = 4` | weights `0.2069535164, 0.4811710822, 0.6261768039, 0.4039804260` by `1/K₃` and 18.2.37, sum `1.7182818285`; `x⁷`: `0.3054900369` both; `x⁸`: `0.2743242` vs `0.2743615` | holds; DLMF35 lines 753–755, 844–849 | none |
| 5.3 `zeros_interlace`, `exists_zero_between` | Legendre `P₂`, `P₃` | `−0.7746 < −0.5774 < 0 < 0.5774 < 0.7746`; DLMF182 lines 1731–1732 state both claims | holds | none |
| 5.4 Jacobi matrix and zeros (sample) | Lebesgue `n = 2` | `J₂ = ((0, 1/√3), (1/√3, 0))`, eigenvalues `±1/√3` = roots of `X² − 1/3`; DLMF182 lines 1740–1762 | holds | none |
| 5.5 `discr_eq_prod`, `discr_pos` | `He₂…He₅`; `n = 0, 1` | `4, 108, 27648, 86400000 = ∏ jʲ`; `discr_C`, `discr_of_degree_eq_one` give `1 = c⁰`; universal identity specialises to every field | holds | none |
| 5.6 `isOrthogonal_kernelPolynomial`, `kernelPolynomial_mul_sub` | Lebesgue + `δ₁`, `y = 1`; `y = 0` | the density kills the atom and leaves infinite support, `p_n(1) ≠ 0`; `q₁(·; 0) = ½`, degree `0`; DLMF182 lines 1550, 1596, 1667–1668 | holds | none |
| 6.1 `monic_even_odd`, `monic_even_odd_two_sq_sub_one` | Lebesgue, `n = 1` | `r₁ = X − 1/3`, `s₁ = X − 3/5`; `R₁ = t + 1/3`, `S₁ = t − 1/5` give `X² − 1/3`, `X³ − 3X/5`; DLMF182 lines 1904–1987 | holds | none |
| 7.1 Hankel determinants (sample): `hankelDet_pos`, `normSq_monic_eq`, `eval_monic_eq_det`, `alpha_beta_eq_hankel` | `eˣ` on `[0, 1]`; `δ₀ + δ₁` | `h = 1.7182818285, 0.1363051216, 0.0091483494`; 18.2.29 at `0.37`: `0.02123648016` both; `Δ = 2, 1, 0`; DLMF182 lines 2163, 2194, 2225, 2257–2265 | holds | R01 |
| 8.1 functional of a recurrence (sample) | `α = 0`, `β = 1/4`; `n = 1` | semicircle moments `1, 1/4, 1/8`: `L(p₂²) = 1/16 = β₁β₂`; one node `α₀`, weight `1` | holds; no locator | R04 |
| 8.2 `favard` (sample) | four formula pairs; `β₀` | DLMF182 lines 2015–2026 list the pairs as in README; lines 727–728 cite Szegő §3.2, Chihara p. 21; `β₀` unused by `monicThreeTerm` | holds; auxiliary unstated | R04 |
| 8.3 `exists_measure_iff_hankelDet_pos` | `m = 0`; two points | `Δ₁ = 0` and only `μ = 0` fits (both sides false); `Δ₃ = 0`; Simon1998 lines 162–163 (Theorem 1, p. 4) | holds | none |
| 8.4 uniqueness (sample): `favard_bounded`, `eq_smul_of_monic_eq` | `β = 1/4`; `M = −1`, `ν = δ₀` | Gershgorin `|λ| ≤ A + 2B = 1`; DLMF182 lines 2027–2028; auxiliary hypothesis holds, `[1, −1] = ∅` | Lean holds; auxiliary false | R03, R04 |
| 8.5 completeness (sample): `hasSum_orthonormal_expansion` | real `q_n`, `𝕜 = ℂ` | coefficient `∫ q_n f = ⟨g_n, f⟩`; DLMF182 lines 2030–2104; Tau Ceti `PolynomialCompleteness.lean` 165, `WeightedOrthogonalBasis.lean` 193, 225 | holds | none |
| 9.1 associated and corecursive (sample): `aeval_associated`, `associated_roots_mem_Ioo` | `eˣ`, `z = 2 + i/2`, `n = 0…3` | `1`, `1.5151565591 + 0.5i`, `1.9594318163 + 1.5088367876i`, `2.0888262172 + 3.2120185151i` both sides; Casoratian `W_n = β_nW_{n−1}`, `W₁ = β₁` | holds; locators partial | R04 |
| 9.2 `convs'_jFraction` | `eˣ`, `z = 2 + i/2`, `n + 1 = 4` | `0.6389990416 − 0.2410064077i` by Mathlib `convs'` tail evaluation and by `p₃^{(1)}/p₄`; DLMF182 line 2520 | holds | none |
| 9.3 `markov` | `eˣ`, `z = 2 + i/2`; Lebesgue `z = 2` | limit `0.6389985876 − 0.2410064428i`; `F₁ = ½`, `F₂ = 6/11`, limit `0.5493061443`; `resolvent a x = (x − a)⁻¹` | holds | none |
| 10.1 structure relations (sample): `structure_relation`, `lowering_raising` | Laguerre `α = ½`; Freud `e^{−x⁴}`; `π = τ = 0` | `x p₄′ = 4p₄ + 18p₃`; `p₅′ = 5p₄ + 0.7553715733p₂ = 5p₄ + 4β₃β₄β₅p₂`; weight bullet fails at `π = 0` | Lean holds; bullet false | R02, R04 |
| 10.2 `isSheffer_iff`, `isSheffer_bernoulli`, `not_isOrthogonal_bernoulli` | `B₀…B₄` | forced `α = ½`, `β = 1/12, 1/6, 1/4`; constant `−1/24` vs `B₄(0) = −1/30`; DLMF182 lines 2994–3032, 3067–3070 | holds | R04 |
| 10.3 `sqrt_weight_mul_abs_le`, `_of_antitoneOn` | `eˣ`, `(1+x)²`, `√(x+0.1)`, `n = 1…5`; Laguerre `n = 1…8` | maximum at `b` in 15 of 15 cases; `max e^{−x/2}|L_n| = 1.000`; DLMF182 lines 3093–3101, DLMF1814 lines 192–196, 392–396 | holds | none |

- Previous review: R01, R03, R04, R05, R06, R08 and R09 are repaired (README 1029–1034, 839, 565–568, 297, 356–357, 375–376, 945–949; `Suggested.lean` 532–536, 395, 508–515, 626–646; `moment` deleted). R02 is repaired in substance (README 37–39, 109–113) but uses names the supplier lacks (R01 here). R07 is partly repaired (R04 here) and R10 is not repaired (R06 here).
- Source locators checked against the text: DLMF181 §18.1(i); DLMF182 (Release 1.2.8) 18.2.1–18.2.46 and the statements of §18.2(iv) Remarks, (vi), (viii), (x), (xii); DLMF35 3.5.18, 3.5.20_1; DLMF1814 18.14.3_5, 18.14.8; DLMF189 Table 18.9.1; Simon1998 Theorem 1, (2.8)–(2.11), Propositions 5.6–5.7.
- Library declarations opened at the pins:
  - Mathlib: `Resultant/Basic.lean` 401, 934–1014; `ForwardDiff.lean` 137, 165, 260, 275; `Pochhammer.lean` 130, 347; `BigOperators/Module.lean` 60; `Substitution.lean` 567, 589; `BernoulliPolynomials.lean` 256; `Analysis/Matrix/Spectrum.lean` 157, 161; `Gershgorin.lean` 30; `Prokhorov.lean` 530; `ResolventTransform.lean` 108; `GramSchmidtOrtho.lean` 238; `ContinuedFractions/Basic.lean` 308–339; `Determinant/Basic.lean` 779; `Algebra/Polynomial/Sequence.lean` 199; `Probability/Moments/Basic.lean` 56; Chebyshev `Orthogonality.lean` 50.
  - Tau Ceti: `PolynomialCompleteness.lean` 51, 165; `WeightedOrthogonalBasis.lean` 193, 225; `Determinacy.lean` 246; `WeakConvergence.lean` 65, 139; `Hermite/GeneratingFunction.lean` 80; `Gaussian/Hermite/Basis.lean` 138.
  - No general orthogonal-polynomial, Favard, Gauss-quadrature, tridiagonal or Sheffer declaration exists at either pin.
- Cross-roadmap citations resolved: ClassicalArithmeticCompletion §6.21 (main, line 12091) exists but names no declaration (R01). RandomMatrices §8.2 (main, line 1160) owns the weight case, which this roadmap cites and generalises. `roadmaps grep` was run across the 434 open heads for Hankel, Favard, Christoffel, Jacobi matrix, Sheffer, kernel polynomial, backward difference and orthogonal polynomial: no second owner.
- Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsAppell (open) and OrthogonalL2Bases, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric (main). Nothing is shared: LaguerreJacobi line 74 and OrthogonalL2Bases line 118 exclude the general theory. By object: the Hankel determinant is owned by ClassicalArithmeticCompletion §6.21 and the weight-case orthonormal polynomials by RandomMatrices §8.2, and both are cited.
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Gate rerun at ab9f5aa: `readme-ids-missing=1` (`shiftedHankelDet_monic_basis`, R01), every other check `0`, `FAIL`.
- Elaboration of `Suggested.lean`: 63 `sorry` warnings and nothing else. The file has no section `variable`s; the `#check @` output of all 95 declarations matches the README statements, R01 aside. One-tactic probe on a copy (`rfl`, `simp`, `grind`, `norm_num`, `aesop`, `infer_instance`): none of the 63 theorems closes, and `exact?` closes none of the four Layer 1 lemmas.
- Description: "63 theorems, with the 32 definitions" matches the head (63 theorems, 30 `def`s, 2 structures). Its Dependencies paragraph names `shiftedHankelDet` (R01).

## Not verifiable

- Szegő, *Orthogonal Polynomials* (§§3.2–3.4, Theorem 7.2): no legal copy found. Theorem 7.2 was read only as DLMF §18.2(xii) reports it.
- Chihara, *An Introduction to Orthogonal Polynomials* (p. 21; Ch. III, Theorem 4.3): no legal copy found.
- Andrews, Askey and Roy, Theorems 5.4.2–5.4.3: no legal copy found; read only as DLMF §18.2(vi) cites them.
- Rota, Kahaner and Odlyzko (1973): the DOI resolves only to a paywalled page.
- Ismail (2009) and Gautschi (2004): not read; cited only through DLMF or as background.
- The 6.1 Check for `(1 − x²)^{0.3}(1 + x²)` was not recomputed. For `e^{−x⁴}`, both sides have moments `½Γ(k/2 + ¼)`.

## Source issues

- **Misprint** in DLMF (Release 1.2.8) at 18.2.11_1, §18.2(iv): the source gives the partial sum of `b_j` up to `n` as `+k̃_{n+1}/k_{n+1}`; it should be the negative of that, by telescoping 18.2.11 with `k̃₀ = 0`; affects a stated result.
- **Misprint** in DLMF (Release 1.2.8) at §18.2(iv), Remarks: the source spells "relation" as "realtion" in the sentence on Favard's theorem; it should read "relation"; affects nothing.
