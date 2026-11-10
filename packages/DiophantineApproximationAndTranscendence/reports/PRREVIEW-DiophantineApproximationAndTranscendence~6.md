# Review of DiophantineApproximationAndTranscendence (pull request #1906 at 2a00bda)

**Verdict:** needs changes

## R01 (P2) — `laurent_mignotte_nesterenko` drops the floor log Aᵢ ≥ 1 of the two-logarithm theorem

**Location.**
- `Suggested.lean` lines 657–668: `let H₁ : ℝ := max a₁.num.natAbs a₁.den`, and so on, with the bound `(-24.34) * (max (…) 21) ^ 2 * Real.log H₁ * Real.log H₂ ≤ Real.log |Λ|`.
- README line 2512 states the same bound with log H(a₁)·log H(a₂). The construction at lines 2514–2530 promises to reach "the displayed constant 24.34" for all positive rationals ≠ 1.

**Claim.** The statement covers every pair of positive rationals ≠ 1, including aᵢ ∈ {2, 1/2}, where log H(aᵢ) = log 2 ≈ 0.693 < 1. Laurent–Mignotte–Nesterenko's Corollary 2 requires log Aᵢ ≥ max(h(αᵢ), |log αᵢ|/D, 1/D). At D = 1 this forces log Aᵢ ≥ 1. With log A₁ = 0.693 instead of 1, the right side becomes less negative: at a fixed max term the factor drops from 1 to 0.693. The statement is therefore stronger than the theorem the README cites, and nothing in the planned route proves the stronger constant. The cited E19 Exercise 5.4 states the bound this way (a source gap, listed below).

**Witness.**
- BMS06 lines 2066–2075 (pp. 39–40) restate LMN95 Corollaire 2 with the hypothesis log Aᵢ ≥ max{h(αᵢ), |log αᵢ|/D, 1/D}.
- Take a₁ = 2, a₂ = 3 with moderate bᵢ, so the max term is 21. The claimed bound is −24.34·441·0.693·1.099 ≈ −8173. LMN with log A₁ = 1 gives only ≈ −11796.

**Repair.**
- In `Suggested.lean` and at README line 2512, replace log H(aᵢ) by log Aᵢ := max(log H(aᵢ), 1). This applies in b′ = |b₁|/log A₂ + |b₂|/log A₁ and in the factor log A₁·log A₂. In Lean, `let A₁ : ℝ := max (Real.log H₁) 1`, and likewise for A₂.
- Cite LMN95 Cor. 2 at D = 1 beside E19 Ex. 5.4.
- Alternatively, add the hypotheses `3 ≤ H₁` and `3 ≤ H₂` (log 3 ≈ 1.0986 ≥ 1).
- Checked on the instance above: with the repair, a₁ = 2, a₂ = 3 give log A = (1, 1.0986). Both values meet max(h, |log a|, 1).
- Add a Check: for a₁ = 2 the bound uses log A₁ = 1, not log 2.

## R02 (P3) — `Suggested.lean` restates three exponent bounds that pinned Tau Ceti already proves

**Location.**
- `Suggested.lean` restates three theorems:
  - `unitEquation_exponent_bound` (lines 753–769);
  - `sUnitEquation_exponent_bound` (lines 815–825);
  - `gyoryEquation_exponent_bound` (lines 835–857).
- README lines 2797, 2859 and 2873 say "Prove `…`" for each of them.
- The description says: "The headline theorems that Tau Ceti proves are not restated".

**Claim.** All three keep the linear-forms lower bound `hLB` as a hypothesis, so each is the conditional bound that the pin already proves. They differ from the pin only in small ways:
- a supremum over j instead of a bound for each j;
- the bound for y, which follows by symmetry;
- every natural p instead of primes. At a composite p, `padicValRat` is bounded by the valuations at its prime factors.
- stronger hypotheses: `0 < C` instead of `0 ≤ C`, and `1 ≤ rank K`.

Nothing beyond the pin is tested.

**Witness.** At Tau Ceti 2fd255d:
- `TauCeti.NumberField.Units.max_abs_le_of_mul_add_mul_eq_one` (`TauCeti/NumberTheory/UnitEquation/ExponentBound.lean:124`): the same `hLB`, κ, A and B₀, with a bound for each j.
- `TauCeti.abs_padicValRat_le_of_add_eq_one` (`TauCeti/NumberTheory/UnitEquation/RatSUnit.lean:222`): the same `hLB` and the same bound max(1, (2C/log 2)·log(2C/log 2)). The pin assumes p prime; the bound for y follows by symmetry.
- `TauCeti.NumberField.SUnit.max_abs_le_of_mul_add_mul_eq_one` (`TauCeti/NumberTheory/UnitEquation/FinitelyGenerated.lean:150`): any M bounding the houses and |a|_v, |b|_v for v ∈ S. It contains the README's M as a special case.

**Repair.**
- Delete the three theorems from `Suggested.lean` and pin the three declarations with `#check @…` beside lines 76–90.
- List them under "From Tau Ceti". In §§4.3 and 4.5, write "is Tau Ceti's `…`" instead of "Prove".
- The unconditional forms, with C supplied by §§3.6–3.7, remain README targets.

## R03 (P3) — The README still states as targets many results the pin proves, without naming them

**Location.** The "Prove …" and "obtain …" sentences of §§0.3, 0.4, 0.6, 1.5, 1.6, 2.4, 2.5, 2.8 and 4.1–4.5. Lines 92 and 300 contradict each other: line 92 says `TauCeti.finite_setOf_absMulHeight₁_le` is pinned, while line 300 says "prove `finite_setOf_absMulHeight₁_le`". The description says: "whatever pinned Tau Ceti already defines or proves is consumed instead of being specified a second time".

**Claim.** The README's blanket sentence at line 90 covers only the files it names. A reader cannot tell which targets are done, and the duplication rule asks for the pinned name and file at each such statement. STATUS.md itself reports Layers 0 and 1 done.

**Witness.** Each declaration below was opened at Tau Ceti 2fd255d and compared with the README sentence.

| README line | Statement | Pinned declaration |
| --- | --- | --- |
| 296 | count d(2⌊B⌋₊+1)^(d+1) | `TauCeti.finite_setOf_naiveHeight_le` (`NumberTheory/Height/Counting.lean:52`), same count |
| 300 | bounded-degree Northcott | `TauCeti.finite_setOf_absMulHeight₁_le` (`NumberTheory/Height/Absolute.lean:187`) |
| 311 | binom(k,⌊k/2⌋)√(k+1) ≤ 2ᵏ | `Nat.choose_middle_mul_sqrt_le_two_pow` (`TauCeti/Data/Nat/Choose/Central.lean:60`) |
| 323 | H(x) ≤ (2 house x)ᵈ | `TauCeti.naiveHeight_le_two_mul_house_pow` (`NumberTheory/Height/House.lean:375`) |
| 327 | algebraic integers of bounded house, with count | `TauCeti.finite_setOf_isIntegral_house_le` (`Counting.lean:80`), same count |
| 333 | ‖z‖ ≥ den⁻ᵈ house^(1−d) | `TauCeti.inv_norm_le_natDenominator_pow_mul_house_pow` (`House.lean:483`) |
| 339 | Siegel, (3NA)^(dM/(N−dM)) | `NumberField.exists_ne_zero_int_vec_abs_le_of_house_le` (`NumberTheory/NumberField/SiegelsLemma.lean:151`) |
| 345–355 | Dirichlet forms | `Matrix.dirichlet_linearForms`, `…_infinite`, `simultaneous_dirichlet`, `dirichlet_linearForm_infinite` (`DiophantineApproximation/Dirichlet.lean:127, 145, 186, 207`) |
| 359 | Kronecker | `TauCeti.kronecker_approximation` (`DiophantineApproximation/Kronecker.lean:87`) |
| 453 | y‖yα‖‖yβ‖ ≤ 1 infinitely often | `Real.infinite_setOf_mul_le_one` (`Dirichlet.lean:258`) |
| 735, 741, 749, 757 | Roth's lemma, auxiliary polynomial, derivative selection, den lower bound | `TauCeti.weightedIndex_le_of_logHeight_le` (`Roth/IndexEstimate.lean:338`), `TauCeti.exists_roth_auxiliary_polynomial` (`Roth/Auxiliary.lean:220`), `TauCeti.exists_roth_hasseDeriv` (`Roth/DerivativeSelection.lean:56`), `TauCeti.neg_sum_mul_log_den_le_log_abs_eval` (`Roth/ValueBounds.lean:94`) |
| 763–785 | Roth, Thue–Roth, Thue equations ("prove thue_equation_finite") | the §1.6 pins of line 92, not named in §1.6 |
| 991 | closedFormRecurrence | `LinearRecurrence.exists_eq_sum_eval_mul_pow` (`Algebra/LinearRecurrence/ClosedForm.lean:141`), over any char-0 field with split charPoly |
| 1167 | `deltaL_pos` | `TauCeti.deltaL_pos` (`Height/Twisted/Determinant.lean:71`), needing only `IsUnit (L v)` |
| 1220 | `finite_subspaceHeight_le` | `Submodule.finite_subspaceHeight_le` (`Height/Arakelov/Subspace/Basic.lean:440`) |
| 1809–1822 | extraction through towers | `LinearIndependent.card_le_finrank_mul`, `TauCeti.exists_linearIndependent_comp_of_lt_finrank_span`, `TauCeti.exists_linearIndependent_comp_finrank_mul` (`LinearAlgebra/LinearIndependent/Extraction/Basic.lean:49, 68, 106`) |
| 2730 | S-unit membership and height | `TauCeti.mem_sUnits_rat_iff_num_den`, `…_eq_sign_mul_prod`, `TauCeti.mulHeight₁_sUnits_rat` (`NumberField/SUnits/Rat/Structure.lean:71, 229, 257`) |
| 2777–2779, 2787 | conditional a^m−b^n and gap bounds | `TauCeti.max_le_of_pow_ne_pow`, `TauCeti.finite_setOf_pow_sub_pow_eq`, `TauCeti.mul_rpow_neg_le_sub_of_mem_factoredNumbers` (`ExponentialEquation/Gap.lean:104, 144, 162`) |
| §4.3 effective Thue bound | max(\|a₀x\|,\|y\|) ≤ \|m′\|^(1/d)e^(h_T) | `TauCeti.NumberField.Units.max_abs_le_of_eval_homogenize_eq` (`UnitEquation/Thue.lean:250`) |
| §4.4 first paragraph | y³ = 2x(x−3) | `TauCeti.finite_setOf_pow_three_eq_two_mul_mul_sub_three` (`SuperellipticEquation/WorkedExamples.lean`) |
| 2855 | solutions ↔ coprime triples | `TauCeti.bijOn_num_num_den_of_add_eq_one` (`UnitEquation/RatSUnit.lean:76`) |

**Repair.** In each listed sentence, replace "Prove"/"obtain" by "This is Tau Ceti's `X` (`file`)", and add those files to the Tau Ceti supplier paragraph. Keep the Checks. The unconditional forms of §§4.2–4.5 stay targets and cite the conditional pins as their inputs.

## R04 (P3) — Locator slips in the sample

**Location, witness and repair.** Each item below was read at its source line.
- **Line 897** "(E19, ch. 7, Corollary 7.2, p. 139)": the vanishing-form remark is the unlabelled paragraph before (7.3), E19-ch7 lines 67–73, p. 139. Cor. 7.2 is Roth's theorem (line 52, p. 138). Repair: "E19, ch. 7, remark before (7.3), p. 139".
- **Line 899** "(E19, ch. 7, Lem. 7.3, p. 140; …)": the three-form example is "Example (7.5)", E19-ch7 lines 93–144, p. 140. Lem. 7.3 is the two-form lemma (line 75, p. 139). Repair: "E19, ch. 7, Example (7.5), p. 140".
- **Line 741** "Take C=12b max(1,house α) … (P22, Thm. 2.6.5, pp. 70-72; E19, ch. 6, Lem. 6.10, p. 119)": neither source states this constant.
  - P22 Thm 2.6.5(iii) gives H(P) ≤ (4H(α))^(r₁+⋯+rₙ) (P22 line 4052).
  - E19 Lem. 6.10 is the one-variable Thue construction with C₁ = (6b·max(1, house α))^(d(1+ε⁻¹)) (E19-ch6 lines 426, 482–485).
  - The constant 12b·max(1, house α) is that of `TauCeti.exists_roth_auxiliary_polynomial`. Repair: cite it (see R03).
- **Lines 2901 and 2967** "(B08, §3.1, Prop. 3.2.1, pp. 11-12)": Prop. 3.2.1 is in §3.2 "Ring structure" (B08 lines 441–443, p. 12), and §3.1 is the definition on p. 11. Repair: "B08, §3.1, p. 11; §3.2, Prop. 3.2.1, p. 12".
- **Lines 1934–1935** "(EF13 §11 …, Lemmas 11.3–11.5, pp.44–47)": Lemma 11.3 begins on p. 43 (EF13 line 1876; p. 44 begins at line 1878). Repair: pp. 43–47.
- **Lines 1961–1962** "(EF13 §13 …, Proposition 13.6 and its proof, pp.50–58)": the proof ends on p. 59 (EF13 line 2733; p. 60 begins at line 2734). Repair: pp. 50–59.

## R05 (P3) — The description's `depends-on` block names suppliers that the head no longer cites

**Location.** The `depends-on` block of the description lists "#868 DerivedDeRhamCohomology" and "#851 GeometryOfNumbersAndQuadraticArithmetic" as suppliers that "merge first".

**Witness.** A search of README and `Suggested.lean` finds no mention of either roadmap. The dependency check reports 0 problems, with no edge to either.

**Repair.** Regenerate the block, or delete it, so that it lists no supplier.

## Verified sound

**Previous review (r5 at 9a8800e), finding by finding.**

| r5 finding | Status at this head |
| --- | --- |
| R01 LinearFormsInLogarithms supplier | Repaired. 0 mentions; gate `dropped` 0. §3.2 derives Hermite–Lindemann and π from `TauCeti.linearIndependent_exp` (lines 92, 2141, 2143); §§3.3–3.5 targets carry W00/E19 locators. |
| R02 suppliers not on main | Repaired. 0 mentions; §0.0 cites the `ZLattice`/MinkowskiSecond/LinearForms/Hadamard pins (lines 47–55); §5.6 owns the de Rham differential (lines 38, 94). |
| R03 sorry'd `relativePluckerPoint` | Repaired. `sorry-data` 0; `Submodule.relativePluckerPoint` is cited at lines 52 and 90. |
| R04 `readme-ids-missing` | Repaired. 0; lines 701–705 write "lemma `x` of namespace `Polynomial`". |
| R05 multivariable Wronskian restated | Repaired. The contract is at line 88 and §1.4 cites it at lines 715 and 725; `Suggested.lean` lines 174–200 pin 27 names, and there is no local `genWronskian` and no admitted example. |
| R06 field-only degree bound | Repaired. Line 701 says "commutative ring R"; `Suggested.lean` line 209 has `[CommRing R]`. |
| R07 "the application" | Repaired. The sentence is gone. |
| R08 TeX | Repaired. Gate `tex` 0. |
| R09 API catalogue | Repaired. 49 theorems and 0 examples; the docstring has the required form (lines 37–70); 15 headline pins. R02 above is a new instance of the same kind, not listed in r5. |
| R10 statement hygiene | Repaired. 0; `TauCeti.sUnitsRatMulEquiv` is cited (line 2730); the named instance `instAlgebraRatFuncAdjoin` is at line 900. |
| R11 §5.7 restatements | Repaired. §5.7 (lines 3856–3871) cites §3.8 and states no Lean duplicate. |
| R12 undefined labels | Repaired. None of the seven labels occurs. |
| R13 locator slips | Repaired. Lines 345, 378, 554, 873, 311, 130, 991, 977, 2873 and 3267 now carry the corrected locators. |

**Gate, dependency check and builds.**
- My rerun of the gate reports every rule at 0, OK.
- Dependency check: `depcheck: 234 roadmaps, 2273 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, 49 ``declaration uses `sorry` `` warnings and nothing else.
- A scratch copy with `#check @` for all 74 declarations elaborates with 0 errors. I compared each headline's elaborated type with its README statement; the rows of the adversarial table record the comparisons, and the only mismatches are those of R01 and R02.
- The one lead in `signatures.md`, `IsTwistedData` without `[NumberField K]`, is harmless. It is a `Prop` structure whose fields need only `Place K`, and its sole consumer `parametric_subspace_theorem` carries `[NumberField K]`.
- One-tactic probe: every `sorry` was replaced by `first | (rfl; done) | (norm_num; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (decide; done) | (aesop; done)`. All 49 theorems fail, so there is no theorem-level padding.
- `Completed/HeightsAndUnits/Suggested.lean` imports this module but is outside the worker's targeted build. A scratch copy elaborates against this head's olean with 0 errors and 70 sorry warnings. The olean contains the new §1.4 theorem and none of the dropped names.
- 285 declarations were dropped from `Suggested.lean`. Main roadmaps cite nine of them that the README no longer names (SubspaceTheorem README, e.g. `weightedIndex_mul`, `eval_add_eq_finsum_hasseDeriv`). All nine exist at the Tau Ceti pin, so the citations still resolve.
- `citations.md`'s 7 leads are this file's own `Transcendence.`/`GelfondSchneider.`/`Baker.`/`SchanuelConjecture.` declarations, all present: false positives.
- `overlaps.md` reports no dropped id. Section headings are identical to main's except the removed "From other open roadmap pull requests" and the new "Degree and multiplicity estimates" subheading.

**Sources (seeded sample).** A helper located the passages for §§1.5, 1.7, 2.1, 2.3, 2.6, 2.8, 3.8, 4.1, 5.1 and 5.2: about 100 locators, 87 exact matches. I read every line quoted in R04 and the following myself:
- P22 lines 4047–4052, 5302, 5527–6127 (§3.5 headings: §3.5.2 p. 98, §3.5.3 p. 99) and 5745.
- E19-ch7 lines 39, 52, 67–79, 93–96, 255–265 (Thm 7.8 p. 144) and 459–474 (Thm 7.13 p. 149).
- E19-ch8 lines 225–248 (Thm 8.7 p. 162), 293–302 (Thm 8.8, r_p ≥ n, primitive x, exponent r∞−n−ε) and 335–349 (Thm 8.10).
- E19-ch2 lines 184, 363, 384–398 and 403 (Ex. 2.7 in §2.2, p. 23).
- E19-ch5: Cor. 5.3 p. 86, Cor. 5.5 p. 88, Lem. 5.9 p. 91, Thm 5.12 p. 94, Thm 5.16 p. 101, Thm 5.17 p. 101, Ex. 5.4 p. 104 (lines 681–693), Ex. 5.9 p. 106.
- E19-ch6 lines 426–430 and 480–486; EF13 lines 1876, 1916, 2505, 2516 and 2733; B08 lines 388 and 441–443; E96 lines 3153–3168; E95 line 1268.
- W00 lines 6151–6159: Cor. 4.2 matches `schneiderLang`, with h ≤ d₀ coordinates and x ∈ ℚ̄ⁿ.
- BMS06 lines 2066–2089.

The previous review covered §§0.1, 0.3, 0.6, 1.4 and 4.5 line by line, and those locators are unchanged. I re-read §0.6 (Ex. 2.6/2.7) and the §4.5 E19-ch5 labels.

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**
- Everything cited in R02 and R03, at the lines given.
- `TauCeti.algebraicLogs` and `mem_algebraicLogs` (`Transcendental/AlgebraicLogs.lean:59, 78`).
- `TauCeti.linearIndependent_exp` and `algebraicIndependent_exp` (`Lindemann/Theorem.lean:53, 85`) and `TauCeti.transcendental_rpow` (`GelfondSchneider/Theorem.lean:210`). Neither library has complex Gelfond–Schneider, Hermite–Lindemann or `Transcendental ℚ π`, so those three headlines are new.
- Mathlib `EisensteinSeries.E2` (`E2/Defs.lean:61`, normalised by 1/(2ζ(2))) and `ModularForm.E₄`/`E₆` (`EisensteinSeries/Basic.lean:47–54`, normalised). With both normalised, `nesterenko` states Nesterenko's theorem as published.
- The pinned Roth, Thue and binary-form theorems, which elaborate through the 15 `#check` lines.

**Ownership.**
- EffectiveDiophantineMethods, the closest open roadmap, cites this roadmap's §3.6 `matveev` and §§0.1–0.3 (its README lines 36, 1002 and 1616) rather than owning them.
- The §1.4 amendment has no other owner; r5 compared it with ArithmeticInterpolationDeterminants, which consumes the Tau Ceti Hasse Wronskian.
- No declaration of `Suggested.lean` has the fully qualified name of another roadmap's declaration.

### Adversarial table

| Statement | Instances tried | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `natDegree_add_derivative_orders_le` | ℤ: (1,X,X²); (1,1); ℤ/4ℤ: (C 2); ℓ=0 | W=1: 0+3 ≤ 3, equality; W=0 is excluded (0+1 ≤ 0 would fail); W=2: 0+0 ≤ 0; W=1: 0 ≤ 0 | holds; `hg` needed | none |
| `sum_multiplicity_lower_bounds_le_natDegree` | ℚ, V=span(1,X³), f=X³ at 0; 𝔽₂, V=span(1,X²) | (3+1)−2 = 2 = natDegree(3X²), equality; bound 1 but W=0, which `[CharZero K]` excludes | holds | none |
| §1.4 divisibility | 𝔽₃, V=span(1,X³), f=X³ | W = 3X² = 0, exponent 2, X² ∣ 0 | holds in char p | none |
| `subspace_theorem` | n=2, forms X₁, X₂; x=0 | \|x₁x₂\| ≥ 1 off the axes forces ‖x‖ ≤ C^(1/δ); ‖0‖^(−δ) = 0, 0 ≤ 0, 0 ∈ V | consistent | none |
| `subspace_theorem_general_position` | forms X₁, X₂, X₁+X₂ (r=3, n=2) | all values nonzero gives product ≥ ‖x‖, so ‖x‖ ≤ C‖x‖^(1−δ) is bounded | consistent | none |
| `padic_subspace_theorem(_general_position)` | S=∅ | `Option ∅` = {none}: reduces to Thms 7.1 and 7.4 (primitive x) | consistent with Thms 8.7, 8.8 | none |
| `finite_approximation_bounded_degree` | d=0; d=1, α=√2, κ=2.5; κ=2 | empty set; Roth gives finitely many; at κ=d+1=2 the convergents give infinitely many | κ > d+1 necessary | none |
| `schmidt_normForm` | ℚ(√2), α=(1,√2); ℚ(i), α=(1,i); n=0 | μ=1, L=K real quadratic, so h fails (Pell); L imaginary quadratic, so h holds, x²+y²=c finite; M=0, norm 0 ≠ c, empty | matches Thm 7.13 | none |
| `finite_thueMahler` | F=XY(X+Y), S={2}; deg 2 F=XY | (1,1)→2, (1,−2)→2, finitely many; (1,2ᵏ) infinite, so n ≥ 3 needed | holds | none |
| `finite_nondegenerate_solutions` | ℚ, Γ=⟨2⟩, α=(1,1); n=1 | 2ᵃ+2ᵇ=1 only for a=b=−1; unique x₁=α₁⁻¹ | holds | none |
| `card_nondegenerate_solutions_le` | n=1, r=0 | ≤ e⁶ ≈ 403 against at most 1 solution | holds | none |
| `skolem_mahler_lech_simple` | Fibonacci; u(h+2)=−u(h) | zeros {0}; (0,1,0,−1,…) has infinitely many zeros, excluded by `IsNondegenerate` | holds | none |
| `ncard_zeros_simple_recurrence_le` | a=(1,1,−2), α=(1,3,2) | 1+3ᵐ−2·2ᵐ = 0 at m=0,1; m=2 gives 2; m=−1 gives 1/3: 2 zeros ≤ e^(18⁹) | holds | none |
| `absolutePerturbedUnitEquation` | n=2, Γ trivial | h(z) ≈ 0 forces roots of unity with z₁+z₂=1: (ζ₆, ζ₆⁻¹) and conjugate, 2 lines | holds | none |
| `IsTwistedData`, `parametric_subspace_theorem` | K=ℚ, n=2, coordinate forms, c=0 | H_Q = H, Δ=1; H(x) ≤ Q^(−δ) < 1 leaves only x=0 ∈ V; R=2 | consistent with EF13 Thm 2.1 | none |
| `sharp_roths_lemma` | m=4, Θ=1/2, d=(64³,64²,64,1) | ratio 64 = 2m²/Θ; exponent (3m²/Θ)^m = 96⁴; threshold mΘ = 2; weak ≥ as in E96 Lem. 23 | matches the README Checks | none |
| `subspace_theorem_for_systems` | n=2, K=ℚ, X₁−√2X₂, X₂, d=(−2−ε,0) | A=1; \|p−θq\| ≤ max^(−1−ε), \|q\| ≤ max: Roth's approximations | consistent | none |
| `transcendental_exp_of_isAlgebraic` | α=1; α=0 | e transcendental; exp 0 = 1, excluded by `h0` | holds | none |
| `transcendental_exp_mul` | l=iπ, β=−i; β=1/2 | e^π transcendental; exp(iπ/2) = i algebraic, excluded by `hβq` | holds | none |
| `schneiderLang` | n=d₀=d₁=1; d₁=0 | y or eʸ transcendental (Hermite–Lindemann); n < d₀+d₁ fails for y=1 | matches W00 Cor. 4.2 | none |
| `linearIndependent_cons_one_of_linearIndependent_rat` | l=(log 2, log 3); l=(iπ) | Baker; 1, iπ are ℚ̄-independent | holds | none |
| `waldschmidt_measure` | m=1, β₀=0, β₁=1, l=log 2 | Λ = 0.693 against exp(−2²⁶·D³·…) | holds | none |
| `baker_lower_bound` | m=0 | \|γ\| ≥ (eB)^(−C) is Liouville's inequality | holds | none |
| `matveev` | n=1, K=ℚ, α=2, b=1 | log\|Λ\| = −0.367; RHS = −C₁(1,1)·0.693 ≈ −7.6·10⁵ | holds | none |
| `laurent_mignotte_nesterenko` | a=(2,3); b=(485,306) | log\|Λ\| = −6.89 against −8173; LMN's hypothesis log A₁ ≥ 1 fails at H=2 | overclaim | R01 |
| `pow_sub_pow_eq_finite` | a=3, b=2, k=1 | (1,1), (2,3); bound ≈ 2·8.2·10⁸/log 2 | holds | none |
| `tijdeman_gap` | S={2,3}, 8<9; S=∅ | 1 ≥ 9·(8.62)^(−8.2·10⁸); with S=∅ only 1 is S-composed, so the statement is vacuous | holds | none |
| `unitEquation_exponent_bound` | against the pin | same κ, A, B₀; sup over j of the pinned per-j bound | restates the pin | R02 |
| `sUnitEquation_exponent_bound` | S={2,3}: 9 − 8 = 1 | p=2, b=1, ε=−1: \|−4\|₂ = 1/4 forces C ≥ log 4; bound 4·log 4 = 5.55 ≥ 3 | holds; restates the pin | R02 |
| `gyoryEquation_exponent_bound` | against the pin | the pin allows any M ≥ the houses and v-values | restates the pin | R02 |
| `baker_superelliptic` | y² = x³+1 | solutions (2,±3): log 2 ≤ 12^(4096·81) | holds | none |
| `schinzel_tijdeman` | y^n = x²−1 at (3,2) | n=3 ≤ 40⁸⁰·e^(22 log 1) | holds | none |
| `tijdeman_catalan` | 3²−2³ = 1 | x^m=9, y^n=8 ≤ C=9 | holds | none |
| `SchanuelConjecture` consequences | x=(1,πi); x=(1,2) | trdeg ℚ(e,πi) ≥ 2; trdeg 1 < 2, so independence is needed | match E19 §4.3 | none |
| `IsEFunction` / `IsGFunction` | aₙ=1; aₙ=n−1; aₙ=n!; aₙ=1/n!; aₙ=1/n | E; E ((z−1)eᶻ); fails size; fails denominator; G with dₙ = lcm(1..n) ≤ 3ⁿ | Checks hold | none |
| `andre_eFunction_equation` | f=eᶻ | m=1, q₀=−z: z·f′ − z·f = 0, deg q₀ = 1 ≤ m | holds | none |
| `siegel_shidlovskii` | f=(eᶻ, e²ᶻ), ξ=1 | trdeg_ℂ(z) = 1 = trdeg ℚ(e, e²) | equality | none |
| `beukers_refined_siegel_shidlovskii` | n=1, f=eᶻ, P=X | P(e) ≠ 0 makes the hypothesis false; P=0 gives Q=0 | consistent | none |
| `galochkin_chudnovsky` | f=(1, −log(1−z)), T=1−z, M=[[0,0],[1,0]] | ℚ-independence of 1, log(1−p/q) | consistent | none |
| `IsMahlerRegularPoint`, `nishioka` | f=Σz^(2ⁿ): (f,1) = [[1,z],[0,1]]·(f(z²),1); α=1/2 | det 1, no poles; trdeg 1 gives f(1/2) transcendental | consistent with `transcendental_fredholm` | none |
| `nesterenko`, `algebraicIndependent_pi_exp_pi` | τ=i | E₆(i)=0, E₂(i)=3/π, so q=e^(−2π), E₂ and E₄ are independent: π, e^π | normalisations checked | none |
| `ax_schanuel` | k=1, x=z, y=eᶻ | trdeg ≥ 1+1 = 2 | holds | none |
| `ax_schanuel_powerSeries` / `ax_lindemann_weierstrass` | f=(z); f=(z, √2z) | trdeg ℂ[z,eᶻ] = 2 ≥ 2; eᶻ and e^(√2z) algebraically independent | hold | none |
| §2.6 grid lemma | s=0; B<1; X³−X at B=1; 𝔽₂: X²−X | 0 < (2a+1)(b+1); a=0, b ≥ s; derivative at 0 is −1; only order 0 is allowed and fails | holds; char 0 needed | none |
| §2.6 weight bound | m=1, N=2, d=4, ε=1/2 | w(e) = 1/4 < (2−1/N)mε = 3/4 < 1 | holds | none |
| §2.6 height Checks | H₂(2,4,4); H₂(1,2,2) against H₂(1,2)² | 3; 3 < 5 | holds | none |
| §5.2 Laplace Check | f=eᵗ | ℒ(tf) = 1/(x−1)²; ℒ(f′) = x/(x−1)−1 = 1/(x−1) | holds | none |
| §5.1 minimal equations | (z−1)eᶻ | (z−1)f′ − zf = 0; order 1; apparent at 1 | holds | none |
| §3.8 Checks | x=(0); x=(iπ) | trdeg ℚ(0,1) = 0 < 1; trdeg ℚ(iπ,−1) = 1 | holds | none |

## Not verifiable

- **LMN95** (J. Number Theory, paywalled): not read. The hypothesis in R01 comes from BMS06's open restatement of its Corollaire 2 (BMS06 lines 2066–2089).
- **Evertse survey §2 p. 4** (README line 879): the arXiv text is not in the cache. I did not fetch it.
- **Matveev, Yu 1994 constants, Kirby, Nishioka LNM, Nesterenko–Philippon, Schmidt 1967, Bombieri–Vaaler, BG06**: not opened. None is in the seeded sample; the previous review records the same for Yu's constants.
- **Fischler–Rivoal**: the cached arXiv text gives Def. 1 on p. 1, as cited. I did not compare its version with the published paper.

## Source issues

- **Gap** in E19-ch5 at Exercise 5.4, printed p. 104: the source states the Laurent–Mignotte–Nesterenko bound with log H(aᵢ) for all positive rationals ≠ 1; it should use log Aᵢ = max(log H(aᵢ), 1) (LMN95 Cor. 2 at D = 1), or assume H(aᵢ) ≥ 3; affects a stated result.
- **Misprint** in E96 at the proof of Lemma 25, preprint p. 67: the source gives the degree of ∏_{|j|≤a}(X−j)^(b+1) as (2a+1)(2b+1); it should be (2a+1)(b+1), which still exceeds s; affects nothing.
