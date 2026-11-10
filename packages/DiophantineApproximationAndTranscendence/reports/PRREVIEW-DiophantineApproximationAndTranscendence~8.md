# Review of DiophantineApproximationAndTranscendence (pull request #1906 at aad433c)

**Verdict:** needs changes

Two findings, both P3; none blocks. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — §§3.3 and 3.6 restate pinned Tau Ceti results as targets without naming them

This is the class of the previous review's R01, in two sections outside its sample.

**Location.**
- README lines 2173, 2175, 2177, 2179, 2183 and 2189 (§3.3).
- README lines 2315–2327 (§3.6, "Derivative interpolation for the Waldschmidt measure").
- README line 94: its list of consumed files has no entry for §3.3 or §3.6.
- Pull-request description: "the README names the pinned declaration and file at each such statement".

**Claim.**
- Each README passage below states, as its own target, a result or carrier that the pinned Tau Ceti already has. The declaration is not named at the passage.
- Lines 2183 and 2195 write `l^k` and `|l|^(−r)`. The section fixes the logarithm as λ (line 2161); `l` is the binder name of the pinned declaration and is not defined in the README.

**Witness.** Opened at Tau Ceti 2fd255d. Paths are relative to `TauCeti/NumberTheory/Transcendental/`. All names resolve in a scratch `#check` file.

| README line | Pinned declaration (file:line) |
| --- | --- |
| 2173, E19 Lem. 4.27(i) | `TauCeti.exists_norm_schneider_auxiliary_le_exp_rpow` (`GelfondSchneider/AnalyticBound.lean:256`): the same L, D₁, D₂ and the bound exp(c₄L^(3/2) log L − L²) for u, v ≤ cL |
| 2175, Lem. 4.27(ii) | `TauCeti.exists_house_schneider_value_le_exp_rpow` (`GelfondSchneider/SchneiderAuxiliary.lean:491`) |
| 2177, Lem. 4.27(iii) | `TauCeti.isIntegral_intCast_pow_mul_schneider_value` (same file, line 154) and `TauCeti.exists_abs_pow_schneider_exponent_le_exp_rpow` (line 521) |
| 2179, Thm. 4.21 | `TauCeti.transcendental_rpow` (`GelfondSchneider/Theorem.lean:210`); the README names it only at line 2197 |
| 2183 | `RingHom.iteratedDeriv_gelfond_auxiliary_natCast` (`GelfondSchneider/GelfondAuxiliary.lean:122`) |
| 2189 | `RingHom.exists_iteratedDeriv_gelfond_auxiliary_ne_zero` (same file, line 152), which also gives r < q² |
| 2315–2327 | `TauCeti.waldschmidtLinearForm`, `waldschmidtPoint`, `waldschmidtFunction`, `waldschmidtEntry` and `iteratedDeriv_waldschmidtFunction` (`Waldschmidt/Interpolation/Data.lean`); `TauCeti.rank_waldschmidtInterpolationMatrix_le` (`Waldschmidt/Interpolation/Matrix.lean:191`), whose bound is the README's L_d = binom(T₀+d,d)(2T₁+1); the denominator and size bounds of the delta polynomials in `BakerDelta.lean` |

**Repair.**
- At lines 2173–2189, write "This is Tau Ceti's `X` (`file`)" as §§1.1–1.2 now do. At line 2179, name `TauCeti.transcendental_rpow` at the statement.
- At lines 2315–2327, consume the pinned interpolation carriers, the derivative identity, the rank bound and the delta-polynomial bounds by name. Keep as targets only what the pin lacks: the parameter choice, the arithmetic and analytic estimates of the determinant, and the assembly.
- Replace `l` by λ at lines 2183 and 2195.
- Add the files to line 94: `GelfondSchneider/{AnalyticBound,SchneiderAuxiliary,GelfondAuxiliary,Theorem}.lean`, `Waldschmidt/Interpolation/{Data,Matrix}.lean` and `BakerDelta.lean`.
- Optionally, lines 1881–1882 ("At K=ℚ the sup-height product bound is √det(AAᵀ)/gcd(maximal minors)") can name `Matrix.exists_linearIndependent_mulVec_eq_zero_prod_norm_le` (`TauCeti/NumberTheory/Height/Arakelov/BombieriVaaler.lean:161`). It is a special case of the target, so this is not required.

## R02 (P3) — The description's list of kept definitions omits `formSystemHeight`

**Location.** Pull-request description, under "Suggested.lean": "Definitions it keeps: 16 abbreviations of Tau Ceti carriers … `ePowerSeries`, `eFun`, `SchanuelConjecture`, `SolvesSystem` and `IsMahlerRegularPoint`; a named instance …".

**Claim.** The list is presented as complete, and the head has one more definition. The description also does not mention that `parametric_subspace_theorem` now carries EF13's explicit threshold.

**Witness.** `Suggested.lean` line 482: `def formSystemHeight (F : Finset (Fin n → K)) : ℝ`, used at line 500.

**Repair.** Add to the list: "`formSystemHeight`, the height H_L of EF13 (2.12), which `parametric_subspace_theorem` needs for the threshold C₀ = max(H_L^(1/R), n^(1/δ))".

## Verified sound

**The previous review (r7 at ae218ce), finding by finding.**

| r7 finding | Status at aad433c |
| --- | --- |
| R01, unnamed pinned statements in §§0.5, 1.1, 1.2 | Repaired. Lines 434, 436, 483, 508–520, 537 and 568 name the declaration and file. Line 508 attributes 48b to the pin and 6b to E19. Line 92 says "(§1.1)". Line 94 lists the files. Lines 560 and 576 also name their declarations. |
| R02, explicit threshold | Repaired. `formSystemHeight` (line 482) has a real body. The theorem holds for every Q ≥ max(H_L^(1/R), n^(1/δ)) with real R ≥ #F. README line 1994 matches. |
| R03, names that do not resolve | Repaired. Line 105 says the Mathlib lemmas are module-private; `LindemannWeierstrass.exp_polynomial_approx` is indeed `public` (`AnalyticalPart.lean:169`). Line 99 has `ZSpan.setFinite_inter`. The eleven own names are prose. |
| R04, W00 Lemma 9.10 | Repaired: "Definitions 9.9–9.10 and Lemma 9.11, pp. 272–273" (W00 lines 13812, 13853, 13861; printed pages 272–273). |
| R04, ESS02 "Corollary 11.3" | Unchanged, correctly. That finding was mistaken: ESS02 line 1302 is Corollary 11.3, printed p. 835. The locator at README line 1049 is right. |
| R04, P22 Prop. 3.2.12 | Repaired. Lines 674–676 use the sum of the partial degrees (P22 lines 4979–4987) and name the one-variable pins. |

**Gate, dependency check and builds.**
- My rerun of the gate reports every rule at 0, OK.
- Dependency check: `depcheck: 236 roadmaps, 2280 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, 46 ``declaration uses `sorry` `` warnings and nothing else.
- Elaborated signatures: I compared the 72 types of `signatures.md` with the README. `formSystemHeight` keeps `[NumberField K]`. The one lead (`IsTwistedData` without `[NumberField K]`) is harmless, since `Place K` exists for any field.
- One-tactic probe: every `sorry` replaced by `first | rfl | trivial | simp | norm_num | infer_instance | positivity | decide`, each with `done`. All 46 theorems fail, so there is no padding.
- `Completed/HeightsAndUnits/Suggested.lean`, which imports this module, elaborates against this head with 0 errors. No other file uses `parametric_subspace_theorem` or `formSystemHeight`.
- The pull request changes nothing outside the folder.

**Headline theorems.** The 46 stated theorems and the 18 `#check` pins cover the README's headlines. The module docstring names the four that are not statable (effectivity, Picard–Vessiot comparisons, subgroups of Gₐⁿ × Gₘⁿ, the twisted height on ℚ̄ⁿ).

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**
- A scan of 374 qualified library names in the README finds every one declared at the pins, apart from this roadmap's own prose targets and the external files of "Implementation sources". Every `TauCeti/…lean` path in the README exists.
- I read the statements of 30 declarations named since the last head against their README sentences. Among them:
  - `TauCeti.mahlerMeasure_eq_absMulHeight₁_pow`, the two Comparison bounds and `house_eq_numberField_house`;
  - `inv_card_le_simultaneousExponent` (includes n = 0), `card_le_linearFormExponent`, `natCast_le_mahlerExponent` and `algebraicApproximationExponent_le_mahlerExponent` (no hypothesis on ξ);
  - `Real.abs_sub_convergent_le` and `Polynomial.norm_eval_homogenize_le_mahlerMeasure_mul_norm_div_sub`;
  - `minpoly.pow_dvd_iff` (separable x), `Polynomial.l1Norm_hasseDeriv_le` (`NormOneClass`), `exists_hasseDeriv_aeval_ne_mul_of_dvd` (0 ≤ ε < 1/2) and `norm_eval_hasseDeriv_le_pow_of_norm_sub_le_one`;
  - the `weightedIndex` lemmas `_smul_weight`, `_toMvPolynomial`, `_le_sum_degreeOf`, `min_…_le_add` and `…_le_…_hasseDeriv_add`;
  - `Polynomial.prod_supNorm_le_two_pow_mul_supNorm_prod` and `Polynomial.logHeight_add_logHeight_le_logHeight_mul_add` (factor `finrank ℚ K · natDegree`);
  - `Polynomial.sum_mul_hermiteIntegral_of_sum_mul_exp_eq_zero`;
  - `TauCeti.height2` (value 0 at the zero tuple, as the §2.6 Check says).
- No pin proves Hermite–Lindemann, `Transcendental ℚ Real.pi` or the complex Gelfond–Schneider theorem.

**Cross-roadmap citations and ownership.**
- `citations.md`'s 7 leads are this file's own namespaced names (`Transcendence.`, `GelfondSchneider.`, `Baker.`, `SchanuelConjecture.`).
- `overlaps.md` reports no dropped id and no other pull request changing this folder.
- `roadmaps grep` finds `formSystemHeight` only in this roadmap. SubspaceTheorem (main) cites `parametric_subspace_theorem` by name only, and the name is unchanged.
- No supplier is an open pull request.

**Sources: the seeded sample.** I read every line below myself.
- **§§0.1–0.3.** Statements recomputed (table). Pins as above.
- **§2.2.** E19-ch7: Thm. 7.9 and Lem. 7.10 p. 146 (lines 347, 351), Lem. 7.11 p. 147 (line 382), Thm. 7.8 p. 144, Lem. 7.6 p. 142.
- **§2.4.** ESS02: Thm. 2.1 (lines 356–362), (6.3) (line 738), (11.19)–(11.20) (lines 1275–1293), Cor. 11.3 p. 835 (line 1302).
- **§2.5 (changed).** EF13 (2.10)–(2.12) p. 9 (lines 332–350) and Thm. 2.1 with (2.17)–(2.18) p. 10 (lines 405–416): real R ≥ r, H_L over n-element subsets, C₀ = max(H_L^(1/R), n^(1/δ)).
- **§2.6.** EF13 Prop. 12.1 p. 49 (lines 2124–2149): m, N ≥ 2, grid size N/ε, weight ≤ 2mε. E96 Lem. 23 preprint p. 64 (lines 2992–3006), which `sharp_roths_lemma` matches clause for clause; Lem. 24 and (7.5) p. 64.
- **§3.3.** E19-ch4: Thm. 4.16, Cor. 4.17 and 4.18 p. 73; Thm. 4.21 p. 76; Lem. 4.22 p. 77; Lem. 4.23 and Exercise 4.5 p. 79; Lem. 4.24, 4.26 and 4.27 p. 80; the completion p. 82. The README's "every embedding" in Lem. 4.27(ii) follows from (i) and (ii).
- **§3.7.** E19-ch5: Thm. 5.16 p. 101 (lines 580–586) and Exercise 5.9(i) p. 106 (lines 741–745).
- **§4.3.** E19-ch5: Lem. 5.9 p. 91, Thm. 5.12 p. 94, Thm. 5.13 p. 97. BG96: §2 p. 68, (8) p. 70, Lem. 1 p. 71, (12) p. 72.
- **§4.4.** E19-ch5: Thm. 5.14 p. 98, Thm. 5.15 p. 99.
- **§4.5.** E19-ch5: Thm. 5.17 p. 101, Cor. 5.3 p. 86. BG96 as above.
- **§5.3.** B08: §4.4 and Def. 4.4.1 p. 20 (lines 777–791), Thm. 4.4.2 and 4.4.3 p. 20, Thm. 5.1.2 p. 21, Lem. 5.2.1 p. 22, Prop. 5.3.1 p. 23.
- **§5.5.** AF17: (1.1) p. 2, Thm. 1.1 p. 3 (0 < |α| < ρ, as in `nishioka`), Thm. 1.4 and Cor. 1.5 pp. 3–4, Thm. 1.7 and Cor. 1.8 p. 5, Prop. 2.1 p. 8, Lem. 2.2 p. 10, Thm. 3.1 and Lem. 3.2 p. 10, Lem. 4.1–4.2 pp. 16–18. AF22: Thm. 1.1 p. 2 and the definition of a regular point (line 54).
- **§5.6.** Waldschmidt, periods: Thm. 17 and (18) p. 443, the specialization p. 444. BT: Thm. 1.2.5, Cor. 1.2.6 and 1.2.7 p. 4, Cor. 1.2.15 p. 6.
- **§5.7.** Waldschmidt, periods, §7.1 p. 455. BT §1.2.

### Adversarial table

| Statement | Instances tried | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `primitiveMinpoly`, `naiveHeight` | (1+2√3)/5; √2; 2/3 | 25x²−10x−11, H = 25; X²−2, H = 2 against Weil height √2; 3X−2, H = 3 | Checks hold | none |
| §0.3 central binomial | k = 0, 2, 5 | 1 = 1; 2√3 = 3.46 ≤ 4 but 2·3 = 6 > 4; 10√6 = 24.5 ≤ 32 | holds | none |
| §0.3 Northcott Check | d = 1, B = 1 | rationals of height ≤ 1: {−1, 0, 1} | holds | none |
| §0.3 small conjugates | coordinates ≤ 2/3 | modulus ≤ 2√2/3 = 0.943 < 1, so the norm is 0 | holds | none |
| §0.3 size bound | z of degree d | den·z integral gives \|z\| ≥ den⁻ᵈ house^(1−d) | holds | none |
| `schmidt_normForm` | K = ℚ, n = 1; ℚ(i), (1, i); ℚ(√2), (1, √2) | only L = ⊥, so `h` holds and ξ = c; a²+b² = c finite; L = K real, `h` fails (Pell) | matches Thm. 7.13 | none |
| `formSystemHeight` | (X, X+2Y) at 3, (X, Y) elsewhere; (2X, Y) everywhere | minors 1, 2, −1: H_L = 2·max(1, ½, 1) = 2, Δ_L = \|2\|₃ = 1; minors ±2: H_L = 1 = Δ_L | Checks hold; Δ_L ≤ H_L | none |
| `parametric_subspace_theorem` | R ≥ #F ≥ n ≥ 2; coordinate forms, c = 0 | 3R ≥ 6, log 6 = 1.79 > 1, both logarithms positive; H_L = 1, C₀ = n^(1/δ), Q^(−δ) ≤ 1/n leaves x = 0 | matches EF13 Thm. 2.1 on K-points | none |
| `absolutePerturbedUnitEquation` | budget 4n against 5n | (11.19) needs n·h(z) < ½q₀⁻¹; with 4n the left side is ≥ q₀⁻¹ | the 5n form is the one proved | none (source issue) |
| `card_nondegenerate_solutions_le`, `ncard_zeros_…` | n = 1; a = (1, 1, −2), α = (1, 3, 2) | ≤ 1 solution; zeros m ∈ {0, 1} | hold | none |
| §2.6 grid count | s = 0; B < 1 | a = 0, b = ⌊s/B⌋ ≥ s, s < b+1 | holds | none |
| §2.6 grid jet | X(X−1)(X+1), B = 1; X³, B = ½; 𝔽₂, X²−X | order-one jet at 0 is −1; order 3 ≤ 6 gives 1; all values 0 with only order 0 allowed | holds; char 0 needed | none |
| §2.6 rectangular grid | (X₀³−X₀)X₁², B = (1, ½) | d = (1, 2) ≤ (3, 4), value (3·0−1)·1 = −1 | holds | none |
| §2.6 weight lemma | m = 1, N = 2, d = 4, ε = ½ | k ≤ 1; ¼ < (2−½)·½ = ¾ | holds | none |
| §2.6 H₂ product bound | (1, 2, 2), p = 1; general | 3 ≤ 5; ∏(\|b_p\|²+\|b_q\|²) ≥ \|b_p\|^(2N−4)·Σ\|b_q\|² | holds | none |
| `sharp_roths_lemma` | against E96 Lem. 23 | ratio 2m²/Θ, exponent (3m²/Θ)^m, weak ≥, index < mΘ | matches | none |
| §3.3 Schwarz bound | \|aᵢ\| ≤ R, T ≥ 3R | \|z−aᵢ\| ≤ 2R, \|w−aᵢ\| ≥ 2T/3, ratio 3R/T | holds | none |
| §3.3 parameters | L = 2dM², D₁ = (2d)²M³, D₂ = 2dM | D₁D₂ = 8d³M⁴ = 2dL²; D₁ = √(2d)·L^(3/2) | hold | R01 (pin) |
| `transcendental_exp_mul` | l = πi, β = −iα; l = 2πi, β = ½ | e^(πα), with β rational iff α ∈ ℚi; exp(πi) = −1, β rational, excluded | holds | none |
| `transcendental_exp_of_isAlgebraic`, `transcendental_pi` | α = 0 | exp 0 = 1, excluded by `h0`; neither is at the pins | new headlines | none |
| `yu` | Θ = p; ℚ | (p^f)^(−e) with base N𝔭; factor p−1, d = f = 1 | form matches Yu §0.1 text | constant not verifiable |
| §3.7 LTE | a = 4, b = 2, p = 2; a = 2, b = 2 | 5²−1 = 24, v₂ = 3 = 2+1; 3²−1 = 8, v₂ = 3 > 2 | 4 ∣ a needed | none |
| §3.7 one factor | a = 4, p = 3; a = 3, p = 2 | v₃ = 1+v₃(b), c = ⅓; even b: v₂ = v₂(b)+2, c = ¼ | holds | none |
| §3.7 `yu_rat` constant | B ≥ 1 | log max(B, 3) ≤ 2 log(eB): at B = 1, 1.0986 ≤ 2 | C = 2Φ log p suffices | none |
| §4.3 three-root identity | coefficients of X and Y | X: 0; Y: α₁α₂−α₁α₃+α₂α₃−α₁α₂+α₁α₃−α₂α₃ = 0 | holds | none |
| §4.3 monic reduction, λ | G(a₀x, y) | yᵈa₀^(d−1)f(x/y) = a₀^(d−1)F(x, y); x/y = (θ₀−λθ₂)/(1−λ) | hold | none |
| §§4.3, 4.5 exponent bounds | x ≤ a + b log x | log x ≤ log(2b) + x/(2b) − 1 gives x ≤ 2a + 2b(log(2b) − 1); at a = b = C/log 2 this is (2C/log 2)·log(2C/log 2) | hold | none |
| §4.5 box | S = ∅ | U_∅ = {±1}, no x + y = 1; count 2(2⌊B⌋+1)^#S | holds | none |
| `finite_thueMahler` | F = X²(X−Y)(X+Y) | not squarefree, excluded; the README target (three distinct zeros) reduces to (x−y)+(x+y) = 2x | consistent | none |
| `baker_superelliptic`, `schinzel_tijdeman` | n = 0 | b = f(x): 0 ≤ bound | hold trivially at the boundary | none |
| `tijdeman_gap` | S = ∅; S = {2}, 1 < 2 | vacuous; C ≈ 1.1·10⁶, 2e^(−C) ≤ 1 | holds | none |
| §5.3 iterates | recurrence; T = 1−X, M = 1; T = M = 1 | T^(m+1)B′ₘ = TP′ₘ − mT′Pₘ; P₂ = (1+1)/2 = 1; P₂ = ½, qₛ = s! | definition and Checks agree | none |
| `galochkin_chudnovsky` | G over ℚ̄(z), f rational | (G − G^σ)f = 0 and independence force G over ℚ(z) | matches B08 4.4.2 with 4.4.3 | none |
| `IsMahlerRegularPoint` | A = (1−2z)⁻¹, α = 2^(−½), q = 2, 3; A = 0; 0×0 | α² = ½ a pole; 2^(−3^ℓ/2) ≠ ½; det not a unit; det = 1 | Checks hold | none |
| §5.5 continuation | f = 1/(1−2z), A = (1−2z²)/(1−2z), α = ¾ | A(z)f(z²) = f(z); f(¾) = −2; Taylor terms (3/2)^m; orbit 9/16, 81/256 avoids ½ and ±2^(−½) | regular point outside the Taylor disc | none |
| `nishioka` | hypothesis \|α\| < ρ | AF17 Thm. 1.1 assumes 0 < \|α\| < ρ | matches | none |
| §5.5 Mahler Checks | f = z; Fredholm | z^q·z − z·z^q = 0; f(z) = f(z²) + z, det = 1 | hold | none |
| §5.6 Ramanujan | coefficient of q | θE₂ = −24q; (1−48q−1−240q)/12 = −24q | holds | none |
| §5.6 Siegel count | d = 2; d = 4; M = ⌊d⁴/24⌋ | N = 15, M = 7, 7/8; N = 70, M = 35 ≥ 2.67; ratio d⁴/(10d³) = d/10 | Checks hold | none |
| §5.6 operator | w^[k] | θ(θ−1)⋯(θ−k+1) = q^k(d/dq)^k, so Q∘Φ = (12q)^k(P∘Φ)^(k) | holds | none |
| `nesterenko`, `algebraicIndependent_pi_exp_pi` | τ = i | (e^(−2π), 3/π, E₄(i), 0): the first three independent | holds | none |
| §5.6 Lie derivative | D(t) = 1; D(t) = t; D′ = t∂ₜ | L_D(t dt) = dt; 2t dt; D(t) − dt([D, D′]) = 1 − 1 = 0 | Checks agree | none |
| `ax_schanuel` | k = 0; F = ℂ(t, eᵗ) | C = F forces n = 0; 1+1 ≤ 2 | holds | none |
| `ax_schanuel_powerSeries`, `ax_lindemann_weierstrass` | f = (z); trdeg ℂ(f) = 1 | 2 ≤ trdeg ℂ[z, eᶻ]; trdeg(exp f) ≥ n+1−1 = n | hold | none |
| §5.6 character Checks | H = {(u, u²)}, z = (2, −1) | χ = u²·u⁻² = 1 | holds | none |
| §5.7 Checks | (log 2, log 4); n = 1 | ℚ-dependent, excluded; Hermite–Lindemann | hold | none |

## Not verifiable

- **E95** (Evertse 1995), **Kirby**, **Fonseca**, **Nishioka**, **Nesterenko–Philippon**, **Tzanakis–de Weger**, **KW26**, **Soundararajan–Petrow**, **Yu 1990**: not in the worker's cache and not fetched this round. Their locators in §§2.6, 3.3, 3.7, 4.5, 5.5 and 5.6 are unchecked. The statements they support were recomputed where the table shows it.
- **Yu 1994 constant Φ**: the form of the bound is confirmed by the previous review's reading of the Numdam text; the displayed formula for Φ is missing from that extraction.
- **LMN95** and **Matveev 2000**: paywalled or not opened. The Matveev constant agrees with E19-ch5 Thm. 5.4 at κ = 1: (e/2)n^4.5·30^(n+3).

## Source issues

- **Gap** in ESS02 at §11, (11.19), printed p. 834: the source bounds n·h(z) by n·exp(−(5n)^(3n))(1+4n log n), although (6.3) and Theorem 2.1 assume only the (4n)^(3n) budget; it should assume the (5n) budget, under which (11.19) holds; affects a stated result.
- **Misprint** in ESS02 at §12, first paragraph, printed p. 835: the source refers to "Corollary 11.2" for the count of subspaces covering the small solutions; it should be Corollary 11.3, since 11.2 is a lemma; affects nothing.
