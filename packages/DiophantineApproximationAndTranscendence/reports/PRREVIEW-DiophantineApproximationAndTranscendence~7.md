# Review of DiophantineApproximationAndTranscendence (pull request #1906 at ae218ce)

**Verdict:** needs changes

All four findings are P3; none blocks. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — §§0.5, 1.1 and 1.2 still restate pinned Tau Ceti results as targets without naming them

This is the previous review's R03, only partly repaired.

**Location.**
- README lines 434–436 (§0.5), 483 and 508–520 (§1.1), 537 and 568 (§1.2).
- Line 92 lists `TauCeti.thue_approximation_real` under "(§1.6)", but its statement is §1.1 line 520.
- Line 94's list of consumed files omits the files below.

**Claim.**
- Each sentence below states, as something to prove, a result that the pinned Tau Ceti proves. The README never names the pinned declaration at the sentence.
- The rule of lines 90 and 94 ("each is named at its statement below") is not met for these.
- Line 508 cites E19, ch. 6, Lem. 6.10 for the constant C₁ = (48b·max(1, house α))^(d(1+1/ε)). The source gives 6b, and README line 743 attributes 6b to that same lemma. The 48b comes from the pinned declaration.

**Witness.** Opened at Tau Ceti 2fd255d; paths are relative to `TauCeti/NumberTheory/DiophantineApproximation/` unless shown in full.

| README line | Pinned declaration (file:line) |
| --- | --- |
| 434 | `Real.one_div_lt_abs_sub_convergent` (`ContinuedFractions.lean:161`), same strict bound |
| 436, first equality | `TauCeti.irrationalityExponent_eq_one_add_limsup` (`ContinuedFractions.lean:252`) |
| 483 | `IsAlgebraic.inv_le_norm_ratCast_sub` (`Liouville.lean:98`), the same bound with the Mahler measure of `primitiveMinpoly` |
| 508 | `TauCeti.exists_thue_auxiliary_polynomials` (`Thue/Auxiliary.lean:189`): the same degree, divisibility and length bound, with 48b. E19-ch6 lines 482–485 give 6b. |
| 514 | `TauCeti.exists_hasseDeriv_aeval_ne_mul_of_natDegree_le` (`Thue/Nonvanishing.lean:141`): k + d(r−1) ≤ 2N, hence k ≤ d(2εr+1) |
| 516 | `TauCeti.norm_eval_le_pow_of_hasseDeriv_sub_eq_mul` (`Thue/AnalyticBound.lean:92`), the same C₂ |
| 518 | `TauCeti.thue_gap_principle` (`Thue/GapPrinciple.lean:91`), with existential C and λ |
| 520 | `TauCeti.thue_approximation` and `TauCeti.thue_approximation_real` (`Thue/GapPrinciple.lean:237, 253`), for degree ≥ 2 and complex α |
| 537 | `MvPolynomial.eval_add_eq_finsum_hasseDeriv` (`TauCeti/RingTheory/MvPolynomial/HasseDeriv/Taylor.lean:105`) |
| 568 | `MvPolynomial.hasseDeriv_mul` (same file, line 68) |

**Repair.**
- At each line above, write "This is Tau Ceti's `X` (`file`)".
- At line 518, keep the explicit ε, C and λ as the target, and cite `TauCeti.thue_gap_principle` as the qualitative form.
- At line 520, say that the pin covers complex α of degree ≥ 2.
- At line 508, attribute 48b to the pin. Keep "E19, ch. 6, Lem. 6.10 and its proof, pp. 118–119" for the construction. The source gap is recorded below.
- Change line 92's "(§1.6)" for `thue_approximation_real` to "(§1.1)".
- Add these files to line 94: `Liouville.lean`, `ContinuedFractions.lean`, `Thue/{Auxiliary,Nonvanishing,AnalyticBound,GapPrinciple}.lean` and `TauCeti/RingTheory/MvPolynomial/HasseDeriv/Taylor.lean`.
- Optionally, lines 560 and 576 ("prove …") can name `MvPolynomial.weightedIndex_rename` and `MvPolynomial.le_weightedIndex_iff` (`WeightedIndex.lean:370, 117`).

## R02 (P3) — `parametric_subspace_theorem` drops EF13's explicit threshold although it is statable

**Location.**
- `Suggested.lean` lines 483–491: "`∃ (Q₀ : ℝ) (T : Finset …), … ∀ Q, Q₀ ≤ Q → ∃ V ∈ T, …`".
- README line 1990: "the typed K-rational target quantifies over a threshold".

**Claim.**
- The statement is weaker than the theorem the source proves for K-points.
- EF13 Thm. 2.1 covers every Q ≥ C₀ := max(H_L^(1/R), n^(1/δ)). Its restriction to K-points is the Lean statement with that explicit Q₀.
- H_L needs only README §2.5's `formSystemHeight`. That is a simple definition with a real body on Tau Ceti's `absoluteProjectiveTupleHeight`, so the explicit form is statable at the pins.

**Witness.** EF13 lines 405–416 (Thm. 2.1, (2.17)–(2.18), p. 10) give C₀ = max(H_L^{1/R}, n^{1/δ}). Lines 422–427 (Thm. 2.2) even treat the range 1 ≤ Q < C₀ for K-points.

**Repair.**
- Define `formSystemHeight L` in `Suggested.lean` with a real body. It is `TauCeti.absoluteProjectiveTupleHeight` of the minors `det (Matrix.of fun i j ↦ (e i : Fin n → K) j)`. The index e runs over the injections of `Fin n` into the finite set of distinct forms. Indexing by injections rather than by n-subsets repeats minors up to sign, which leaves every local maximum unchanged.
- State the theorem for every `Q ≥ max (formSystemHeight L ^ (1 / R : ℝ)) (n ^ (1 / δ))`.
- Update README line 1990 to match.
- Tested on the coordinate forms over ℚ with c = 0. All minors are ±1, so H_L = 1 and C₀ = n^(1/δ). For Q ≥ C₀ the bound Δ_L^{1/n}Q^{−δ} ≤ 1/n < 1 admits only x = 0, consistent with the theorem.

## R03 (P3) — Library and own names in the README that do not resolve as cited

**Location and witness.**
- **Lines 78, 105 and 2072.** These lines cite `LindemannWeierstrass.exp_polynomial_approx_aux`, `LindemannWeierstrass.P` and `P_eq_integral_exp_mul_eval` as "the exported analytic estimate".
  - At Mathlib 1b1ccf4, `Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean` is a `module` file whose declarations sit in a plain `noncomputable section` (lines 1–30), with no `public section`.
  - A scratch file with `import Mathlib` reports `Unknown identifier` for all three. They are module-private.
- **Line 99.** The README cites `ZLattice.setFinite_inter`. The pinned declaration is `ZSpan.setFinite_inter` (`Mathlib/Algebra/Module/ZLattice/Basic.lean:330`, inside `namespace ZSpan`). `ZLattice.setFinite_inter` does not exist.
- **Own names in backticks that `Suggested.lean` does not declare.** None of these is declared anywhere at the pins either:
  - `Finsupp.mulHeight_smul_eq_mulHeight` (line 621);
  - `IsEFunction.add`, `IsEFunction.shift`, `IsEFunction.differentiable` and `IsEFunction.hasSum` (line 2946);
  - `IsGFunction.add` and `IsGFunction.mul` (line 2959);
  - `GalochkinCondition.ne_zero` (line 3031);
  - `IsMahlerFunction.add`, `IsMahlerFunction.mul` and `IsMahlerFunction.expand` (line 3253);
  - `IsMahlerRegularPoint.pow` (line 3265).

  The house rule is: "An API bullet carries a backticked Lean name only when that declaration exists in `Suggested.lean`".

**Repair.**
- Drop the Mathlib `LindemannWeierstrass.*` contract at lines 78, 105 and 2072. §3.1 already consumes Tau Ceti's `Polynomial.hermiteIntegral_eq_sumIDeriv` and `Polynomial.norm_hermiteIntegral_le`, which both resolve. Alternatively, say the Mathlib lemmas are module-private and reachable only with `import all`.
- At line 99, write `ZSpan.setFinite_inter`.
- Write the eleven own names in prose without backticks. They are API targets, not headlines; declaring them in `Suggested.lean` would be padding.

## R04 (P3) — Locator slips in the seeded sample

**Location, witness and repair.**
- **Line 2323 (§3.6)**, "(W00 §9.2.1, (9.1)–(9.10), Lemmas 9.10–9.11.)".
  - W00 has Definition 9.9 (line 13812), Definition 9.10 (line 13853) and Lemma 9.11 (line 13861). There is no Lemma 9.10.
  - Repair: "W00 §9.2.1, Definitions 9.9–9.10 and Lemma 9.11".
- **Line 1049 (§2.4)**, "(ESS02 §§7–8, Lemma 11.2 and Corollary 11.3, pp.824–835.)".
  - ESS02 has no Corollary 11.3. The count q₀(16n³q₀)^r is (11.20), which follows Lemma 11.2 on pp. 833–834 (ESS02 lines 1240, 1288–1293).
  - Repair: "ESS02 §§7–8 and §11, Lemma 11.2 and (11.14)–(11.20), pp. 824–835".
- **Line 676 (§1.3)**, "h(f)+h(g)≤h(fg)+D deg(fg)log 2. (P22, Prop. 3.2.12, pp. 84-85.)".
  - P22 Prop. 3.2.12 (P22 lines 4982–4987) has the exponent deg_{x₁}(f)+⋯+deg_{xₙ}(f), the sum of the partial degrees. This can exceed the total degree in several variables, so the source does not support deg(fg) as written.
  - Repair: replace deg(fg) by Σⱼ degreeOf j (fg), or restrict the statement to one variable.

## Verified sound

**The previous review (r6 at 2a00bda), finding by finding.**

| r6 finding | Status at ae218ce |
| --- | --- |
| R01, LMN floor log Aᵢ ≥ 1 | Repaired. `Suggested.lean` lines 674–677 use `max (Real.log …) 1`; README line 2514 does the same and cites LMN95 Cor. 2 at D = 1. The Check at line 2539 recomputes ≈ −11792 against ≈ −8174. |
| R02, three restated exponent bounds | Repaired. They are deleted and pinned by `#check` at lines 96–98. README lines 2800, 2862 and 2876 say "is Tau Ceti's …". |
| R03, unnamed pinned statements | Partly repaired. All 22 rows of the r6 table are now named at their lines (298, 302, 313, 325, 329, 335, 341, 347–357, 361, 455, 737–759, 765–787, 993, 1169, 1222, 1811–1826, 2733, 2780–2792, 2822, 2830, 2858). The remainder is R01 above. |
| R04, locators | Repaired at lines 899, 901, 743, 2904, 2970, 1936 and 1964. |
| R05, the `depends-on` block | Repaired. The description has no generated block and no supplier list. |

**Gate, dependency check and builds.**
- My rerun of the gate reports every rule at 0, OK.
- Dependency check: `depcheck: 234 roadmaps, 2273 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, with 46 ``declaration uses `sorry` `` warnings and nothing else.
- A scratch file with `#check @` for all 71 declarations elaborates with 0 errors. I compared the elaborated types with the README statements. `[NumberField K]` and `[NeZero n]` are present where needed (`padic_*`, `sharp_roths_lemma`, `parametric_subspace_theorem`, `subspace_theorem_for_systems`, `schmidt_normForm`). The `IsTwistedData` lead is harmless: `Place K` exists for any field.
- One-tactic probe: every `sorry` was replaced by `first | rfl | norm_num | simp | infer_instance | trivial | decide | aesop | positivity`, each with `done`. All 46 theorems fail, so there is no padding.
- `Completed/HeightsAndUnits/Suggested.lean` imports this module. A scratch copy elaborates against this head's olean with 0 errors and 70 sorry warnings.
- The pull request changes nothing outside the folder.

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**
- A namespace-aware scan of all 933 backticked README names finds only the names of R03 missing.
- A `#check` file of 105 consumed pinned declarations elaborates.
- I compared these signatures with the README sentence at each:
  - `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume` and its lower bound (symmetry and interior hypotheses as README line 124);
  - `Matrix.exists_ne_zero_int_abs_sum_mul_le` and `Matrix.det_gram_le_prod_norm_sq`;
  - `TauCeti.finite_setOf_naiveHeight_le`, with count d(2⌊B⌋₊+1)^(d+1), and `finite_setOf_isIntegral_house_le`;
  - `NumberField.exists_ne_zero_int_vec_abs_le_of_house_le` ((3NA)^(dM/(N−dM)));
  - the Dirichlet theorems (exponents −n/m and −card κ);
  - `TauCeti.weightedIndex_le_of_logHeight_le` (σ⁻¹(h + 4n r₀ D)), `exists_roth_auxiliary_polynomial` (2d ≤ exp(ε²n/2), 12b), `exists_roth_hasseDeriv` and `neg_sum_mul_log_den_le_log_abs_eval`;
  - `LinearRecurrence.exists_eq_sum_eval_mul_pow` (char 0, split);
  - the gap pins `max_pow_mul_rpow_neg_le_abs_pow_sub_pow` (real a, b > 0), `max_le_of_pow_ne_pow`, `finite_setOf_pow_sub_pow_eq` and `mul_rpow_neg_le_sub_of_mem_factoredNumbers`;
  - the Thue pins `exists_mem_boundedDivisors_…` (θ₁ ≠ θ₀ only) and `max_abs_le_of_eval_homogenize_eq`, whose h_T equals README line 2822 with c₁(u) = rΣ‖log u_j‖;
  - `exists_dvd_and_eq_mul_pow_three_…` (a, b ∣ 36, the 18 elements of A);
  - `bijOn_num_num_den_of_add_eq_one`, `mulHeight₁_sUnits_rat` and `deltaL_pos` (IsUnit only);
  - `Polynomial.mulHeight_mul_le` (N = min deg + 1), `Matrix.mulHeight_mul_le` (`[Nonempty n]`) and `MvPolynomial.logHeight_det_hasseDeriv_le`;
  - `TauCeti.deltaL` and `twistedHeight`, both built on `normAbs`, so Δ_L^{1/n} is consistently normalized;
  - `Height.hasFiniteMulSupport_iSup_nonarchAbsVal` is private, as line 636 says.
- 52 Tau Ceti API names from the bullets (`TauCeti.twistedHeight_pos`, `…IsDFinite.add`, `…auxValue_ne_zero`, `Submodule.one_le_subspaceHeight`, …) resolve.
- No pin proves Hermite–Lindemann, `Transcendental ℚ Real.pi` or complex Gelfond–Schneider. Those headlines are new.
- The 16 abbreviations of Tau Ceti carriers are kept because SubspaceTheorem and HeightsAndUnits on main import them under these names; deleting them would break main.

**Cross-roadmap citations and ownership.**
- All suppliers are on main: ReductiveGroups, GlobalNumberFields (Completed), AlgebraicCurves, ContourIntegration (Completed), DifferentialGeometry and EffectiveBounds (Completed).
- `citations.md`'s 7 leads are this file's own `Transcendence.`/`GelfondSchneider.`/`Baker.`/`SchanuelConjecture.` names.
- `overlaps.md` reports no dropped id.
- EffectiveDiophantineMethods consumes §§0.1–0.3, 3.6 (`matveev`), 3.7 (`yu_rat`, `yuOneFactorBound`, `yuValuationAdapter`) and 4.1–4.5, and owns none of them.
- ArithmeticInterpolationDeterminants consumes the Tau Ceti Hasse Wronskian and cites §1.7. It owns no Wronskian degree or multiplicity bound.
- ArithmeticDynamics cites §2.4 for "the simple-root case" of Skolem–Mahler–Lech, which matches `skolem_mahler_lech_simple`.
- No declaration reuses another roadmap's fully qualified name.

**Sources: the seeded sample.** I read every line below myself.
- **§0.0.** E19-ch2: Cor. 2.6 p. 20 (strict, line 305), Lem. 2.8 pp. 23–24, Thm. 2.9 p. 24 (2ⁿ/n!·d/vol ≤ ∏λ ≤ 2ⁿd/vol), Ex. 2.11 p. 31.
- **§0.1.** E19-ch3 p. 41 (F_α, H, the example 25X²−10X−11 with H = 25), Ex. 3.1 p. 41, Lem. 3.6 and 3.7 p. 42; E19-ch6 p. 108; Bugeaud Def. 2.1 p. 4.
- **§0.2.** E19-ch6 Thm. 6.1 p. 108 (M with a₀, the binomial and √(d+1) remark); Wu Lem. 2.2 p. 3, Lem. 2.5 and Def. 2.7 p. 4, Lem. 3.1 p. 5, Lem. 3.3, Prop. 3.1 and Thm. 3.4 p. 6; Smyth (2) p. 322, §1 p. 323, §3 p. 324; Yang pp. 1 and 4 (read from a scratch manifest copy; the roadmap's manifest is unchanged).
- **§0.3.** E19-ch1 Thm. 1.7(ii) p. 5; P22 Lem. 3.2.8–3.2.9 p. 83; E19-ch3 Lem. 3.19 and Thm. 3.20 p. 52, Ex. 3.6 p. 58, Ex. 3.7 p. 60; Wu Lem. 3.5–3.6 p. 7.
- **§0.4.** E19-ch1 Thms. 1.1, 1.3, 1.4 pp. 1–3 and Lem. 1.9 p. 6; E19-ch2 Cor. 2.7 p. 21, Ex. 2.6 p. 22, Thm. 2.22 p. 34.
- **§0.5.** Bugeaud Defs. 1.1, 1.2, 2.1, 2.2 and Thm. 2.5, pp. 1–6; E19-ch1 Ex. 1.7 pp. 8–9.
- **§1.2.** P22 Lem. 2.6.1 p. 68, Def. 2.6.2 p. 69 (example q/k), Ex. 2.19 p. 72, §3.4.6 p. 92, §3.4.7 p. 93, Ex. 3.6 p. 95, Lem. 3.4.3 p. 90.
- **§1.3.** P22 Def. 3.2.1 and Lem. 3.2.2 p. 80 (H_P absolute), Ex. 3.3 p. 85, Lem. 3.2.10 p. 84, §3.5.2 p. 98. The exception is R04.
- **§1.7.** E96 Lem. 26, preprint p. 68 (Lems. 23–24 p. 64, Lem. 25 p. 67).
- **§2.2.** E19-ch7 Thm. 7.9 and Lem. 7.10 p. 146, Lem. 7.11 p. 147, Thm. 7.13 p. 149, which matches `schmidt_normForm` clause for clause.
- **§2.3.** E19-ch8 Thm. 8.6 p. 161, Thm. 8.7 p. 162, Thm. 8.8 p. 164, Thm. 8.10 p. 165 (square-free, n ≥ 3, gcd = 1), Thm. 8.12 p. 167, §8.3 p. 168, Thm. 8.14 and Lems. 8.15–8.16 p. 170.
- **§2.4.** ESS02 Thm. 1.1 p. 808 (exp((6n)^{3n}(r+1))), Thm. 1.2 pp. 812–813 (n ≥ 3, (1.18)), Thm. 2.1 p. 815 (exp((5n)^{3n}(r+1)) subspaces; h is the affine height (2.3)–(2.4)), Lem. 3.1 pp. 815–816, §11 pp. 832–834; E19-ch8 Thm. 8.17 p. 172, Thm. 8.18 p. 174. The exception is R04.
- **§3.6.** W00 Thm. 9.1 pp. 251–252 (every hypothesis of `waldschmidt_measure`), Prop. 9.18 p. 286 (C(m) = 2^{m+25}m^{3m+9}), and §§9.2.1–9.3.4 with Prop. 9.13, Lems. 9.14–9.15, Prop. 9.16, Lem. 9.17, Thm. 9.19 and Cor. 9.20; E19-ch5 Thm. 5.2 and Cor. 5.3 p. 86, Thm. 5.4 p. 87 (C′ = (e/2)m^{4.5}30^{m+3}∏max(1, log H)), Ex. 5.4 p. 104; BMS06 Thm. 9.4 p. 16 (both constants) and Lem. 13.1 pp. 39–40 (the condition on log Aᵢ). The exception is R04.
- **§4.4.** E19-ch5 Thm. 5.14 and (5.8) pp. 98–99, Thm. 5.15 p. 99; BEG13 (2.4), (2.6) and (2.7) p. 4 with ĥ (p. 4). At K = ℚ and S = {∞} (s = 1, d = 1, D_K = P_S = Q_S = 1) these give exactly the bounds of `baker_superelliptic` and `schinzel_tijdeman`.
- **§5.2.** B08 §3.1 p. 11, §3.2 and Prop. 3.2.1 p. 12, Thm. 3.4.1 and Cor. 3.4.2 p. 14 with the proof on p. 15, §4.1 p. 18; Fischler–Rivoal Def. 1 p. 1 (C^{n+1}, 1 ≤ dₙ ≤ D^{n+1}, matching `IsEFunction`) and p. 2 (G-functions); B06 Thms. 1.1–1.3 p. 2 and Cor. 2.2 p. 3.
- **Outside the sample.** EF13 Thm. 2.1 p. 10 (R02) and Thm. 3.1 with (3.1)–(3.10), pp. 12–14, which `subspace_theorem_for_systems` matches clause for clause; E19-ch6 Lem. 6.10 pp. 118–119 (R01).

### Adversarial table

| Statement | Instances tried | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `natDegree_add_derivative_orders_le` | ℤ: (1,X,X²); (1,1); ℤ/4ℤ: (C 2); ℓ=0 | W=1: 0+3 ≤ 3 (equality); W=0 is excluded (0+1 ≤ 0 would fail); 0+0 ≤ 0; W=1: 0 ≤ 0 | holds; `hg` needed | none |
| `sum_multiplicity_lower_bounds_le_natDegree` | ℚ, span(1,X³), f=X³ at 0; ℓ=0; 𝔽₂, span(1,X²) | 4−2 = 2 = natDegree 3X²; V=0 forces S=∅, 0 ≤ 0; bound 1 but W=0, excluded by `CharZero` | holds | none |
| §1.4 height form (line 729) | m=0; m=r₁+1 | det 1, 0 ≤ 0; log m! ≤ m·r₁ and 1+4·log 2 = 3.77 < 4 | holds | none |
| `transcendental_tsum_inv_pow_three_pow` | b=2 | partial sum p/q with q = 2^{3^n}; error ≈ 2q⁻³ ≤ q^{−2.5}, infinitely often | Roth applies | none |
| `subspace_theorem` | x=0 | ‖0‖^{−δ} = 0, LHS 0 ≤ 0; 0 lies in every V | consistent | none |
| `subspace_theorem_general_position` | r=n+1, δ=1, x=0 | ‖0‖⁰ = 1, LHS 0 ≤ C | consistent | none |
| `padic_subspace_theorem(_general_position)` | S=∅ | `Option ∅` = {∞}: Thms. 7.1 and 7.4 | matches E19 8.7 and 8.8 | none |
| `finite_approximation_bounded_degree` | d=0; d=1, κ=2.5 | primitive irreducible constants: none, empty set; Roth | holds | none |
| `schmidt_normForm` | n=0; ℚ(√2), α=(1,√2) | M=0, N(0)=0 ≠ c, empty; L=K real quadratic, h fails (Pell) | matches Thm. 7.13 | none |
| `finite_thueMahler` | F=0; F=XY(X+Y), S={2} | `Squarefree 0` is false, excluded; z is determined by \|F\| > 0 | holds | none |
| `finite_nondegenerate_solutions` | n=0 | the empty sum 0 ≠ 1: no solutions | holds | none |
| `card_nondegenerate_solutions_le` | n=1 | at most 1 solution ≤ e^{216(r+1)} | holds | none |
| `skolem_mahler_lech_simple` | order 0; u(h+2)=−u(h) | charPoly 1 forces u=0, excluded; ratio −1, excluded by `IsNondegenerate` | holds | none |
| `ncard_zeros_simple_recurrence_le` | a=(1,1,−2), α=(1,3,2) | zeros m ∈ {0,1}: 2 ≤ e^{18⁹} | holds | none |
| `absolutePerturbedUnitEquation` | budget 5n against ESS02's 4n | (11.19) needs exp(−(5n)^{3n})(1+4n log n) < ½q₀⁻¹; with 4n the left side is ≥ q₀⁻¹ | the 5n form is the one proved | none (source issue) |
| `parametric_subspace_theorem` | coordinate forms, c=0, ℚ | H_L = 1, C₀ = n^{1/δ}; Q^{−δ} ≤ 1/n leaves only x=0 | consistent; weaker than EF13 | R02 |
| `sharp_roths_lemma` | m=4, Θ=½, d=(64³,64²,64,1) | ratio 64 = 2m²/Θ; exponent 96⁴; elementary bound 8·64^{−1/8} = 4.76 > 2 | Checks consistent | none |
| `subspace_theorem_for_systems` | ℚ, X₁−√2X₂, X₂, d=(−2−ε,0) | A_∞=1, D=2, R=2; \|p−θq\| ≤ max(\|p\|,\|q\|)^{−1−ε} | matches EF13 (3.7)–(3.10) | none |
| `transcendental_exp_of_isAlgebraic` | α=1; α=0 | e; exp 0 = 1, excluded by `h0` | holds | none |
| `transcendental_pi` | — | not at the pins (grep) | new headline | none |
| `transcendental_exp_mul` | l=2πi, β=−i/2; β=½ | e^π; exp(πi) = −1 algebraic, β rational, excluded | holds | none |
| `schneiderLang` | n=d₀=d₁=1; n=1, d₀=0, d₁=2 | Hermite–Lindemann; Gelfond–Schneider | matches W00 Cor. 4.2 | none |
| `linearIndependent_cons_one_…` | n=0; l=(log 2, log 3) | (1) independent; Baker | holds | none |
| `waldschmidt_measure` | hypotheses against W00 Thm. 9.1 | the A, E*, B conditions, cases (i)–(ii) and C(m) of Prop. 9.18 coincide | matches | none |
| `baker_lower_bound` | m=0 | \|γ\| ≥ (H_naive+1)⁻¹ ≥ (2^D B^D + 1)⁻¹ ≥ (eB)^{−(D+2)} | holds | none |
| `matveev` | n=1, ℚ, α=1+1/N | log\|Λ\| ≈ −log N against −C₁·log N·log(e\|b\|) | holds | none |
| `laurent_mignotte_nesterenko` | (2,3,1,1); (2,4,3,1) | bracket 21: −24.34·441·1.0986 = −11792 ≤ log\|log(2/3)\| = −0.90; −14878 ≤ log log 2 = −0.37 | holds; R01 of r6 repaired | none |
| `yu` | p=2, ℚ | factor p^f − 1 = 1; B = max(\|b\|, 3) | form matches Yu §0.1 text | constant not verifiable |
| `SchanuelConjecture` consequences | x=(1,πi); x=(1,2) | trdeg ℚ(πi, e) ≥ 2; trdeg 1 < 2, so independence is needed | match E19 §4.3 | none |
| `pow_sub_pow_eq_finite` | a=3, b=2, k=1 | (1,1), (2,3); C₁ = 1+(e/2)2^{4.5}30⁵·log 3·1 | holds | none |
| `tijdeman_gap` | S=∅; S={2,3}, 8<9 | only 1 is S-composed, vacuous; 1 ≥ 9(e log 9/log 2)^{−C} | holds | none |
| `baker_superelliptic` | y² = x³+1 at (2,3) | log 3 ≤ (12)^{4096·81} | BEG13 (2.6) at ℚ | none |
| `schinzel_tijdeman` | n=0, 1, 2 | the bound ≥ 40⁸⁰ | trivial | none |
| `tijdeman_catalan` | 3²−2³ | x^m = 9, y^n = 8 ≤ C | holds | none |
| `IsEFunction` / `IsGFunction` | aₙ=n−1; a_{2k}=(2k)!/k!; aₙ=1/n! | E ((z−1)eᶻ); house ≈ (4k/e)^k fails; dₙ = n! fails D^{n+1} | match FR Def. 1 | none |
| `andre_eFunction_equation` | eᶻ; a=0 | m=1, q₀=−z: z f′ − z f = 0; m=0 | holds | none |
| `siegel_shidlovskii` / `beukers_refined_…` | non-minimal T | ξT(ξ) ≠ 0 implies the reduced denominator is nonzero at ξ | B06 Thms. 1.1 and 1.3 apply | none |
| `galochkin_chudnovsky` | (1, −log(1−z)), T=1−z | the values 1, log(1−p/q) are ℚ-independent | consistent | none |
| `IsMahlerRegularPoint`, `nishioka` | A=(1−2z)⁻¹, α=2^{−1/2}, q=2 and q=3 | α² = ½ is a pole; 2^{−3^ℓ/2} ≠ ½ for every ℓ | Checks hold; convention-free | none |
| `nesterenko`, `algebraicIndependent_pi_exp_pi` | τ=i | E₆(i)=0, E₂(i)=3/π, q=e^{−2π} | holds | none |
| `ax_schanuel` | k=0 | C=F: `hlin` forces n=0, and 0 ≤ trdeg | holds | none |
| `ax_schanuel_powerSeries` / `ax_lindemann_weierstrass` | f=(z) | trdeg ℂ[z, eᶻ] = 2 ≥ 2 | holds | none |
| §0.0 Checks | ℤ², [−4,4]×[−1,1] | 16·¼·1 = 4 = 2²; λ₁²·16 = 1 < 2 | hold | none |
| §2.8 Check (ℚ(i), W=K(1,i)) | covolume | (2⁻¹·4^{1/2})·(√2)² = 2 | holds | none |
| §5.6 Siegel Check, d=2 | N=C(6,4) | N=15, M=7, N−M=8, exponent 7/8 | holds | none |
| §1.1 line 508 | E19 Lem. 6.10 | E19 bounds the coefficients by (6bM)^{…}; the length needs (m+1) ≤ 2^{dr}, which gives 12b ≤ 48b | 48b is true but is the pin's constant | R01 |
| §1.3 line 676 | f = g = x₁+x₂ over ℚ | deg(fg) = 2 while Σⱼ degreeOf j (fg) = 4; P22's exponent is 4·log 2 | the source supports only Σ degreeOf | R04 |

## Not verifiable

- **LMN95** (J. Number Theory, paywalled): not read. Its Corollaire 2 hypothesis is confirmed through BMS06 lines 2067–2083.
- **Yu 1994 constant Φ.** The Numdam text (lines 42–68) confirms h₁ ≤ ⋯ ≤ hₙ, B = max(|bⱼ|, 3), h′ = max(hₙ, 1), the principal branch and the factor p^f − 1. The displayed formula for Φ is missing from the extraction.
- **Matveev 2000** (Izvestiya) and **BG06** (CUP): not opened; the Matveev constant agrees with the standard statement. **Schmidt 1967, Bombieri–Vaaler, Kirby, Nishioka, Nesterenko–Philippon and Roy–Thunder**: outside the sample, not opened.
- **Evertse survey §2 p. 4** (line 881): not in the cache, not fetched.

## Source issues

- **Gap** in ESS02 at §11, (11.19), printed p. 834: the source bounds n·h(z) by n·exp(−(5n)^{3n})(1+4n log n), although (6.3) and Thm. 2.1 assume h(z) ≤ n⁻¹exp(−(4n)^{3n})(1+h(x)); it should assume the (5n) budget, under which (11.19) holds; affects a stated result.
- **Gap** in E19-ch6 at Lemma 6.10, proof, printed p. 119: the source bounds the coefficient maximum by C₁ʳ with C₁ = (6b·max(1, house α))^{d(1+1/ε)} and then claims the same for the length ‖P‖; it should include the factor m+1 ≤ 2^{dr}, giving 12b; affects a stated result.
- **Gap** in E19-ch5 at Exercise 5.4, printed p. 104: the source states the LMN bound with log H(aᵢ) for all positive rationals ≠ 1; it should use log Aᵢ = max(log H(aᵢ), 1) (LMN95 Cor. 2 at D = 1); affects a stated result.
