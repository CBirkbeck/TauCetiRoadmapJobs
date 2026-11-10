# Review of DiophantineApproximationAndTranscendence (pull request #1906 at 00256b0)

**Verdict:** accepted

This is an incremental re-review of the 101 README lines changed since aad433c. Only `README.md` changed; `Suggested.lean` is byte-identical to aad433c. Both previous findings are repaired. Every pinned declaration the new text names exists at Tau Ceti 2fd255d and states what the README says it states. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. This report has no findings. Two remarks on untouched text are listed under "Verified sound" and do not block acceptance.

## Previous findings

- R01 — repaired: the README now names a pinned declaration at each listed passage. Examples: line 2175 names `TauCeti.exists_norm_schneider_auxiliary_le_exp_rpow`, line 2341 `TauCeti.rank_waldschmidtInterpolationMatrix_le`, and line 2185 now reads "R_η^(k)(t)=λ^k". Line 94 lists the GelfondSchneider, Waldschmidt/Interpolation and BakerDelta files.
- R02 — repaired: the description now lists "`formSystemHeight`, the height H_L of EF13 (2.12), which `parametric_subspace_theorem` needs for the threshold C₀ = max(H_L^(1/R), n^(1/δ))". It also states the explicit EF13 threshold.

## Verified sound

### The repaired passages against the pin

I elaborated a scratch file with `#check @name` for all 48 Tau Ceti declarations that the change names, importing the 15 modules that declare them: 0 errors. I then read each elaborated type against its README sentence. In the table, "≡" means the README sentence and the pinned statement agree, and the third column records where the pin is more general.

| README line | Pinned declaration (Tau Ceti 2fd255d, file:line) | Comparison |
| --- | --- | --- |
| 1884 (§2.8, K=ℚ) | `Matrix.exists_linearIndependent_mulVec_eq_zero_prod_norm_le`, `NumberTheory/Height/Arakelov/BombieriVaaler.lean:161` | ≡: rows ℚ-independent; #ι−p primitive, ℤ-independent kernel vectors; ∏ sup norms ≤ √det(AAᵀ)/minorGcd |
| 2127 (Lem. 4.12(i)) | `TauCeti.LindemannWeierstrass.algebraMap_auxValue_eq_sum_hermiteIntegral`, `Lindemann/AuxValue.lean:225` | ≡, with S = supp x |
| 2131 (Lem. 4.12(ii)) | `…auxValue_galConj`, `AuxValue.lean:84` | ≡ in the stated form auxValue (galConj τ x) l p (τγ) = τ(auxValue x l p γ), for every x |
| 2133 (Lem. 4.13) | `…eval_iterate_derivative_auxPoly_self` (`AuxPoly.lean:96`), `…_self_of_lt` (:109), `…_of_ne` (:118), `…isIntegral_eval_iterate_derivative_auxPoly_div` (:187) | ≡ for the value (l^|S|∏(γ−γ′))^p and the vanishing for j < p−1 at γ and j < p elsewhere. The pin assumes only CharZero for the integrality for j ≥ p, at every z with lz integral, with no primality of p |
| 2135 (Lem. 4.14) | `…isIntegral_auxValue` (`AuxValue.lean:121`), `…auxValue_ne_zero` (:137) | ≡; the pin's bound is \|N(δ_γ·A_γ)\| < p with p prime and l ≠ 0 (see remark 2) |
| 2137 (Lem. 4.15) | `…norm_auxValue_le` (`AuxValue.lean:238`), `…eventually_norm_auxValue_lt_one` (:264) | the explicit bound (Σ‖δ_γ′‖)·R·e^R·(l(2R+1))^(tp)/(p−1)! is the README's |
| 2141 (Thm. 4.11) | `…expEval_ne_zero_of_forall_galConj_eq` (`Lindemann/Galois.lean:109`), `…expEval_injective` (:129) | ≡ (NumberField, IsGalois ℚ K, any `Algebra K ℂ`) |
| 2145, 2153 | `TauCeti.linearIndependent_exp` (`Lindemann/Theorem.lean:53`), `TauCeti.algebraicIndependent_exp` (:85) | ≡ (ℚ̄ = `integralClosure ℚ ℂ`, `LinearIndependent ℕ`) |
| 2167 (Lem. 4.23) | `TauCeti.card_lt_of_sum_eval_mul_exp_eq_zero` (`Analysis/SpecialFunctions/Exp/ExponentialPolynomial.lean:91`), `…finite_setOf_…` (:154) | ≡: nonempty index set, injective exponents, nonzero pₖ, card < Σ(deg+1) |
| 2169 (Lem. 4.24) | `AnalyticOnNhd.exists_eq_prod_pow_smul` (`Analysis/Analytic/ExtractZeros.lean:86`) | ≡, analytic on a neighbourhood of any U, multiplicities k ≤ `analyticOrderAt` |
| 2171 (Lem. 4.26) | `TauCeti.norm_le_mul_three_mul_div_pow` (`Analysis/Complex/Schwarz.lean:96`), `TauCeti.norm_le_mul_prod_div_pow` (:50) | ≡ with centre c; needs 3R ≤ T but not R > 0 |
| 2175 (Lem. 4.27(i)) | `TauCeti.exists_norm_schneider_auxiliary_le_exp_rpow` (`GelfondSchneider/AnalyticBound.lean:256`) | ≡: complex coefficients, 0 ≤ u, v ≤ cL, every c; the exponent is `(3 / 2 : ℝ)` (source read at line 268) |
| 2177 (Lem. 4.27(ii)) | `TauCeti.exists_house_schneider_value_le_exp_rpow` (`GelfondSchneider/SchneiderAuxiliary.lean:491`) | house bound; it implies the README's bound at every embedding |
| 2179 (Lem. 4.27(iii)) | `TauCeti.isIntegral_intCast_pow_mul_schneider_value` (:154), `TauCeti.exists_abs_pow_schneider_exponent_le_exp_rpow` (:521) | ≡: exponent D₁+2BD₂ and \|m\|^(D₁+2cLD₂) ≤ exp(c₆L^(3/2)) |
| 2181 (Thm. 4.21) | `TauCeti.transcendental_rpow` (`GelfondSchneider/Theorem.lean:210`) | ≡ (`Irrational β`) |
| 2185 | `RingHom.iteratedDeriv_gelfond_auxiliary_natCast` (`GelfondSchneider/GelfondAuxiliary.lean:122`) | ≡, with a, b running from 1 to q as in line 2163's R_η |
| 2189 | `TauCeti.analyticOrderAt_sum_mul_cexp_lt_card` (`ExponentialPolynomial.lean:199`), `TauCeti.exists_lt_card_iteratedDeriv_sum_mul_cexp_ne_zero` (:184) | ≡; the order is < N |
| 2191 | `RingHom.exists_iteratedDeriv_gelfond_auxiliary_ne_zero` (`GelfondAuxiliary.lean:152`), `TauCeti.exists_gelfond_value_ne_zero` (:75) | needs λ ≠ 0 and β ∉ ℚ, as line 2163 assumes for Gelfond; any nonempty T ⊂ ℕ; adds r < q² |
| 2317–2351 (§3.6) | `TauCeti.waldschmidtLinearForm` (`Waldschmidt/Interpolation/Data.lean:107`), `waldschmidtNormalize` (:119), `add_sum_mul_eq_neg_mul_waldschmidtLinearForm` (:136), `waldschmidtPoint` (:153), `waldschmidtFunction` (:237), `waldschmidtEntry` (:253), `iteratedDeriv_waldschmidtFunction` (:290), `waldschmidtOperatorEntry` (:336, `→ₗ[K] … →ₗ[K]`, bilinear), `…_eq_sum_hasseDeriv` (:360), `sum_mul_iteratedDeriv_waldschmidtFunction` (:394), the two `span_image_…` lemmas (:415, :441); `waldschmidtInterpolationMatrix` (`Matrix.lean:71`), `rank_waldschmidtInterpolationMatrix_le` (:191); `TauCeti.lcm_pow_mul_eval_hasseDeriv_multichoose_X_add_one_pow_mem_range_intCast` (`BakerDelta.lean:169`), `TauCeti.abs_eval_hasseDeriv_multichoose_X_add_one_pow_le` (:225) | Λ = b₀ + Σ b_(k+1)λ_k − λ_m and s·y = (s_mβ₀, s_j + s_mβ_j) match the README's indexing. The subspace vector is `Fin.snoc (b ∘ succ) (−1)` = (β₁,…,β_(m−1),−1). The first span lemma concerns columns (σ varies), the second rows (τ varies). The rank bound is `choose (T₀+d) d · #T`. `Matrix.lean` says only the upper bound is proved, as the README states. Δ(X;k) = `Ring.multichoose (X+1) k` |

The supplier contract at line 94 lists every file named above. Every path exists at 2fd255d, and the 15 object files are built.

### Pinned results the README still leaves unnamed

- Remark 1 (untouched text, line 2165, E19 Exercise 4.5): Tau Ceti already proves this as `TauCeti.exists_finset_deriv_eq_zero` (`TauCeti/Analysis/Calculus/LocalExtr/Rolle.lean:51`), and line 2165 does not name it. The description's list of the §3.3 targets that remain therefore omits it.
- Remark 2 (untouched wording, line 2135): "l clears its exponents" must be read with line 2133's l ≥ 1. The pin assumes l ≠ 0, and at l = 0 auxValue vanishes.
- No other statement of §§3.2, 3.3 or 3.6 is pinned. I searched `TauCeti/NumberTheory/Transcendental/` and found none of these: Hermite–Lindemann, transcendence of π or of nonzero algebraic logarithms, the KW26 Siegel construction for η, the c₂ and c₃ bounds, the complex or principal-branch Gelfond–Schneider theorem, Corollaries 4.17–4.18, the rank of L_d being attained, the determinant bounds. `AlgebraicLogs.lean` has only membership lemmas.

### Gate, dependency check, build

- Gate rerun at 00256b0: every rule 0, OK. The worker's gate, which includes the targeted build, also reports OK.
- Dependency check: `depcheck: 230 roadmaps, 2153 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, 46 ``declaration uses `sorry` `` warnings and nothing else.
- `Suggested.lean` is unchanged since aad433c. The r8 one-tactic probe, which closed none of the 46 theorems, and the r8 signature comparison therefore still apply. The single `signatures.md` lead is `IsTwistedData` without `[NumberField K]`. It is harmless, because `Place K` exists for any field.
- `git diff --stat origin/main...HEAD` outside the folder: empty.

### Ownership and citations

- `overlaps.md`: no open pull request changes this folder, and no id is dropped.
- `citations.md`: the 7 leads are this roadmap's own prose names (`Transcendence.`, `GelfondSchneider.`, `Baker.`, `SchanuelConjecture.`). They are unchanged since r8.
- No id was renumbered. `roadmaps grep` for `siegelKernelBasis`, `waldschmidtInterpolation…` and "§3.[236]" citations finds:
  - EffectiveDiophantineMethods §3.6 (matveev);
  - HeightsRationalPointsAndObstructions and SubspaceTheorem citing §2.8;
  - Completed/HeightsAndUnits README line 336 and Suggested.lean line 272, which treat the K = ℚ case of `siegelKernelBasis` as an adapter.

  All of these still resolve. The new §2.8 sentence agrees with HeightsAndUnits: its sup-norm Bombieri–Vaaler statement is the pinned `Matrix.exists_…` lemma.
- Every newly named supplier is Tau Ceti at the pin. No roadmap supplier was added.

### Sources: the seeded sample where it meets the change

I read each line myself.

- **§3.2**, E19-ch4 (printed page = PDF page + 62): Thm. 4.8 and Cor. 4.10, p. 67 (lines 154, 164); Thm. 4.11, p. 68 (line 197); Lem. 4.12, p. 71 (lines 306–337); Lem. 4.13–4.15, p. 72 (lines 342–374); Exercise 4.3, p. 73 (line 377). The p > \|bB\| condition (line 373) and A = l^t∏(γ₁−γ_k) (line 365) match line 2135.
- **§3.3**, E19-ch4: Lem. 4.23 and Exercise 4.5, p. 79 (lines 581–583); Lem. 4.24 and 4.26, p. 80 (lines 620, 632); Lem. 4.27 (i)–(iii), pp. 80–81 (lines 650–662); Thm. 4.21, pp. 76 and 82. W00 Lem. 2.4, p. 37, PDF 57 (W00 lines 2279–2298).
- **§3.6**, W00:
  - Def. 9.9, p. 272 (line 13812): the entries use δ_(S₀♯)(t;σ,κ) and monomials.
  - Def. 9.10, p. 273 (line 13853): Δ in the homogeneous rational case.
  - Δ(z;τ) = (z+1)⋯(z+τ)/τ! (line 10908).
  - δ_b(z;a) has degree a (line 13603).
  - Lemma 9.11(a), p. 273 (lines 13861–13881): total degree ≤ T₀, length, and the denominator ν(S₀♯)^τ₀. Part (b) ends on p. 274. The README's "pp. 272–273" gives where the lemma begins, which is acceptable.
- **§2.8**: BG06 and Bombieri–Vaaler are not in the cache (see "Not verifiable"). The locator is unchanged.
- The other sampled sections (0.5, 0.6, 1.1, 1.4, 1.7, 2.2, 2.3, 3.4, 3.8, 4.4, 4.5, 5.7) are untouched since r8. They were not re-read in this incremental review. The README flags no locator as unverified.

### Adversarial table: changed statements (computed this round)

| Statement | Instances tried | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §2.8 K=ℚ Bombieri–Vaaler (1884) | A=(2 2); A=(1 1 0); p=0 rows | √8/2 = 1.414 vs ‖(1,−1)‖ = 1; √2/1 vs 1·1 with 3−1 = 2 vectors; det of the empty Gram matrix = 1 = gcd, standard basis 1 ≤ 1 | holds; the README Check "(2,2) gives √2" agrees | none |
| Lem. 4.12(i) (2127) | K=ℂ, x=[0]−[2πi], f=1 | Σδ(e^γ′−1) = (1−1)−(1−1) = 0; −Σδ·sumIDeriv(1)(γ′) = −(1−1) = 0 | both sides 0 | none |
| `auxValue_galConj` (2131) | ℚ(√2), x=[√2]+[−√2], l=p=1 | τ(auxValue x 1 1 √2) = τ(−2√2−2) = 2√2−2; auxValue x 1 1 (−√2) = −(1+(1−2√2)) = 2√2−2 | equal | none |
| Lem. 4.13 (2133) | S={0,1}, l=1, p=2, γ=0: f = X³−2X²+X | f′(0) = 1 = (−1)² = A₀²; f(0) = f(1) = f′(1) = 0; f″(0)/2 = −2, f″(1)/2 = 1, f‴/2 = 3 | all clauses hold, j = p included | none |
| Lem. 4.14 (2135) | x=[0] over ℚ, l=1; l=0 | auxValue = −1 ≠ 0 for every prime p > 1; at l=0, auxPoly = 0, auxValue = 0, A₀ = 0 | holds for l ≥ 1; the pin has l ≠ 0 | remark 2 |
| Lem. 4.15 (2137) | K=ℂ, x=[0]−[2πi], R=2π | 4π·e^(2π)·(l(4π+1))^(2p)/(p−1)! → 0 | eventually < 1 | none |
| Thm. 4.11 (2141) | ℚ(√2), x=[√2]+[−√2] | expEval = 2cosh√2 = 4.355 ≠ 0 | holds | none |
| Thm. 4.8, Cor. 4.10 (2145, 2153) | u=(0,1); (1,1); (1,√2); (1,2) | 1 and e independent; not injective, excluded; e and e^√2 algebraically independent; 2u₁ = u₂ and e² = (e)², excluded | hold | none |
| Lem. 4.23 (2167) | X²−1, γ=0; (1,−1), γ=(0,1); r=0 | 2 zeros ≤ 3−1; 1 zero of 1−eˣ ≤ 2−1; the empty sum vanishes everywhere | sharp; r ≥ 1 needed (pin: `s.Nonempty`) | none |
| Lem. 4.24 (2169) | f=z², a=0, k=2; k=3 | g = 1; k = 3 > order 2 fails the hypothesis | holds | none |
| Lem. 4.26 (2171) | f=zᵏ, R=1, T=3 and 6; f=z in the product form | sup ≤ 1 vs 3ᵏ·1ᵏ and 6ᵏ(½)ᵏ = 3ᵏ; \|z\| ≤ T·\|z\|/T, equality | holds | none |
| Lem. 4.27 parameters (2175–2179) | d=1, M=1, c=2 | L=2, D₁=4, D₂=2, D₁D₂ = 8 = 2dL², √2·2^1.5 = 4; D₁+2cLD₂ = 20 and c₆L^1.5 = 5√2·2.828·log m = 20 log m | m^20 ≤ m^20 (tight); the exponent 3/2 is real | none |
| Thm. 4.21 (2181) | α=2, β=√2; α=4, β=½; α=1 | transcendental; 4^½ = 2 with β ∈ ℚ, excluded; 1^β = 1, excluded | holds | none |
| R_η derivative (2185) | q=1, η=1 | ((1+β)λ)^k e^((1+β)λt) = λ^k(1+β)^k α^t γ^t | holds | none |
| exponential-sum order (2189) | c=(1,−1), ρ=(0,1) at 0 and 2πi; N=1 | order 1 < 2 at both points; order 0 < 1 | holds | none |
| first nonvanishing derivative (2191) | q=1, η=1, n=0 | R never vanishes: r = 0 < q² = 1 | holds; n ≥ q² cannot satisfy the hypothesis | none |
| c₃ bound (2197) | notation | \|λ\|^(−r), with λ fixed at line 2163 | consistent | none |
| `waldschmidtNormalize` (2329) | m=1, c₀=2, c₁=4 | β₀ = −½; −4(−½ − λ₁) = 2+4λ₁ | holds | none |
| `waldschmidtPoint`, exponent (2333) | m=2, s=(s₁,s₂) | s·y = (s₂β₀, s₁+s₂β₁); z₀+λ₁z₁ = λ₁s₁ + s₂(Λ+λ₂) | factor α₁^(ts₁)α₂^(ts₂)e^(ts₂Λ) | none |
| `waldschmidtEntry`, §3.6 Checks | σ=0, F=1, s=0; σ=1, F=z₀ | 1·α⁰ = 1; ts₂β₀+1 | both Checks hold | none |
| rank bound (2341) | m=2, d=1, V = K(β₁,−1), T₀=2, T₁=1 | the grid lies on the z₀-axis; L₁ = 3·3 = 9 of 18 rows; d = m gives every row | holds | none |
| Baker Δ (2347–2351) | k=2, l=1, m=1, x=0; m=0, x=n=1 | Δ′(0) = 3/2 ∉ ℤ, 2·3/2 = 3 ∈ ℤ; Δ(1;2) = 3 ≤ 2⁴ | hold; the lcm factor is needed | none |
| waldschmidtInterpolationData (2353) | δ_b(·;a); Δ(b_m·;k) | degree a, positive leading coefficient; degree k, leading coefficient b_mᵏ/k! ≠ 0 | both are `Polynomial.Sequence`s; the target matches W00 Lemma 9.11(a) | none |

### Adversarial table: rows carried from the r8 report (statements unchanged since aad433c)

Each row below is cited from the r8 report. The r8 rows "§3.3 parameters" and "§3.3 Schwarz bound" are replaced by the rows above.

| Statement | Instances tried | Values (left / right) | Result |
| --- | --- | --- | --- |
| §0.1 `primitiveMinpoly`, `naiveHeight` | (1+2√3)/5; √2; 2/3 | 25x²−10x−11, H = 25; X²−2, H = 2; 3X−2, H = 3 | holds (r8) |
| §0.3 central binomial | k = 0, 2, 5 | 1 = 1; 3.46 ≤ 4; 24.5 ≤ 32 | holds (r8) |
| §0.3 Northcott, small conjugates, size | d = 1, B = 1; coordinates ≤ 2/3 | {−1, 0, 1}; modulus 0.943 < 1 | holds (r8) |
| `schmidt_normForm` | ℚ, n=1; ℚ(i); ℚ(√2) | trivial; a²+b² = c finite; Pell excluded | holds (r8) |
| `formSystemHeight`, `parametric_subspace_theorem` | minors 1, 2, −1; R ≥ #F ≥ n ≥ 2 | H_L = 2, Δ_L = 1; log 6 > 1 | holds (r8) |
| `absolutePerturbedUnitEquation` | 4n against 5n | the 5n form is the one proved | holds; ESS02 gap (r8) |
| unit-equation counts | n = 1; (1,1,−2), (1,3,2) | ≤ 1 solution; zeros {0, 1} | holds (r8) |
| §2.6 grid lemmas, weight, H₂ bound, `sharp_roths_lemma` | as in r8 | e.g. ¼ < ¾; 3 ≤ 5; matches E96 Lem. 23 | holds (r8) |
| `transcendental_exp_mul` | λ=πi, β=−iα; λ=2πi, β=½ | e^(πα); exp(πi) = −1, β rational excluded | holds (r8) |
| `transcendental_exp_of_isAlgebraic`, `transcendental_pi` | α = 0 | exp 0 = 1 excluded | holds (r8) |
| `yu`, §3.7 LTE, `yu_rat` | Θ = p; a=4, b=2, p=2; B = 1 | v₂ = 3; 1.0986 ≤ 2 | holds (r8) |
| §4.3 identities, exponent bounds | three roots; x ≤ a + b log x | 0 = 0; x ≤ 2a + 2b(log 2b − 1) | holds (r8) |
| §4.5 box, `finite_thueMahler`, `baker_superelliptic`, `tijdeman_gap` | S = ∅; non-squarefree F; n = 0 | {±1}; excluded; 0 ≤ bound | holds (r8) |
| §5.3 iterates, `galochkin_chudnovsky` | T=1−X, M=1 | P₂ = 1; G over ℚ(z) | holds (r8) |
| `IsMahlerRegularPoint`, §5.5 continuation, `nishioka` | A=(1−2z)⁻¹, α=2^(−½), ¾ | pole at ½; f(¾) = −2 | holds (r8) |
| §5.6 Ramanujan, Siegel count, operator, `nesterenko` | coefficient of q; d = 2, 4; τ = i | −24q; 7/8, 35 ≥ 2.67 | holds (r8) |
| §5.6 Lie derivative, `ax_schanuel` and variants, characters | D(t)=1; k=0; H = {(u,u²)} | dt; n = 0; χ = 1 | holds (r8) |
| §5.7 Checks | (log 2, log 4); n = 1 | dependent, excluded | holds (r8) |

## Not verifiable

- **BG06** (Bombieri–Gubler) and **Bombieri–Vaaler 1983**, for the §2.8 locators at line 1886: not in the worker's cache. The locator is unchanged, and the K = ℚ statement was checked against the pinned declaration instead.
- **KW26** and **Soundararajan–Petrow**, for the §3.3 Gelfond locators at lines 2185–2197: not in the cache. The statements at lines 2185, 2189 and 2191 were checked against the pinned declarations, and the λ notation against line 2163.
- **Zhao, Basic.lean** (lines 2145 and 2153): an external Lean file, not opened.
- The r8 list stands for untouched text: E95, Kirby, Fonseca, Nishioka, Nesterenko–Philippon, Tzanakis–de Weger, Yu 1990 and 1994 constants, LMN95, Matveev 2000.

## Source issues

- **Misprint** in E19-ch4 at Lemma 4.13, (4.15), printed p. 72: the source says the congruence f₁^(j)(γ_m) ≡ 0 (mod p) holds for j > p, so j = p falls under neither (4.14) nor (4.15); it should be j ≥ p, which its proof gives (j!/(p−1)! is divisible by p) and Lemma 4.14 needs; affects nothing.
