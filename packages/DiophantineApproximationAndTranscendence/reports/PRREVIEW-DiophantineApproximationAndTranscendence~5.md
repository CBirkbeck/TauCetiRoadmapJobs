# Review of DiophantineApproximationAndTranscendence (pull request #1906 at 9a8800e)

**Verdict:** needs changes

The head restores `README.md` and `Suggested.lean` to main outside §1.4. The folder therefore again holds main's text, and main's text fails the gate. R04–R07 concern the §1.4 amendment; R01–R03 and R08–R13 are already on main. They are reported because the gate fails on them and they are defects of this folder. On main (71c8f21) the gate gives the same counts in every rule except `readme-ids-missing`: 9 on main, 12 here. Head 449f041 of this same pull request had repaired every inherited item (gate OK, previous review accepted). Restoring those repairs, or landing them first in a separate pull request against main, are both ways to clear them.

## R01 (P1) — §§0.3, 3.1–3.5 and 5.7 take their inputs from LinearFormsInLogarithms, which this project never cites

**Location.** Already on main.
- README lines 54–57, 68–75, 116–142, 397, 2121–2129, 2218–2224, 2268–2274, §§3.4–3.5, and the §5.7 Checks (3948, 3951): 61 mentions in all.
- `Suggested.lean`: lines 23–38 (`SignatureModel`), 341, 2258, 2541 and 2579–2582.
- Line 397 reads: "Supplied by LinearFormsInLogarithms §§3.1–3.2 / Liouville's inequality; Sizes (an open TauCetiRoadmap pull request by …)".

**Claim.** LinearFormsInLogarithms is on the project's list of roadmaps never cited as suppliers. It reached main in 61985897 (2026-11-09), and the list was updated after that and still names it. From this roadmap's side, these inputs routed through it therefore have no owner: Hermite–Lindemann, transcendence of `e` and `π`, complex Gelfond–Schneider, Schneider–Lang, Baker, the Cartesian Schwarz lemma, both Thue–Siegel lemmas and W00 Prop. 4.10.

The wording "(an open TauCetiRoadmap pull request by …)" is now also false. It is process narrative, and it names a person. The same holds for the heading at line 116 and for `Suggested.lean` line 2541 ("to be replaced by the import once that roadmap is merged").

**Witness.** The gate's `dropped` rule fails with 71 hits, at lines 32, 54–57, 70, 71, 75, 105 and 120–138 and later.

**Repair.**
1. Delete every LinearFormsInLogarithms citation, the table at lines 116–142, the provider-compatibility paragraph at lines 68–75 and `SignatureModel`.
2. For each consumed statement, cite the pinned Tau Ceti proof where one exists:
   - `TauCeti.linearIndependent_exp` and `TauCeti.algebraicIndependent_exp` (`TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.lean:53`, `:85`) for Hermite–Lindemann, `e` and `π`;
   - `TauCeti.transcendental_rpow` (`TauCeti/NumberTheory/Transcendental/GelfondSchneider/Theorem.lean:210`) for the real Gelfond–Schneider case.
3. State every other input as a target of §§3.3–3.5 with its locator: W00 Prop. 4.7, Lem. 4.11–4.12, Prop. 4.10 and Cor. 4.2; E19 Thm. 4.16 and Thm. 4.19.
4. Rewrite the §5.7 Checks against §3.2's own targets.

Head 449f041 made exactly this repair, with gate `dropped` = 0.

## R02 (P2) — Two suppliers are not on main

**Location.** Already on main. README lines 30, 32, 44, 61, 108, 152–184 and 3726. Line 152 reads: "Supplied by GeometryOfNumbersAndQuadraticArithmetic §1.2 / Successive minima."

**Claim.** This roadmap is on main, so it consumes only main, Mathlib and Tau Ceti. DerivedDeRhamCohomology and GeometryOfNumbersAndQuadraticArithmetic are open pull requests. The generated `depends-on` block of the description lists both as "merge first", but a roadmap on main never waits for a supplier. The block reflects these README citations and clears with them.

**Witness.** Dependency check on this head:
`UPWARD: DiophantineApproximationAndTranscendence (on main) -> DerivedDeRhamCohomology (#22) at README lines [32, 61, 3726]`
`UPWARD: DiophantineApproximationAndTranscendence (on main) -> GeometryOfNumbersAndQuadraticArithmetic (#55) at README lines [30, 44, 108, 152, 169, 184]`
Neither folder exists on main.

**Repair.**
- §0.0: point the contracts at pinned Tau Ceti:
  - `ZLattice.successiveMin` (`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean:111`);
  - `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume` and `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measure` (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean:610`, `:717`);
  - `Matrix.det_gram_le_prod_norm_sq` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:115`).
- State the linear-forms theorem as a §0.0 target derived from Mathlib's `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (`Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:92`).
- §5.6: state the differential on `exteriorPower F n (KaehlerDifferential C F)` as a target, with its elementary-form, square-zero and Leibniz laws.

## R03 (P2) — `relativePluckerPoint` is sorry'd data

**Location.** Already on main. `Suggested.lean` lines 90–93: "Projectivization.mk K (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K)) (by sorry)".

**Claim.** This `def` has `sorry` in its body, and every §2.5 subspace-height statement mentions it.

**Witness.**
- Gate `sorry-data`, line 90.
- Pinned Tau Ceti has the same carrier with its nonvanishing proved: `Submodule.relativePluckerPoint` (`TauCeti/LinearAlgebra/Projectivization/Plucker.lean:116`).
- It also has `TauCeti.plucker` (`TauCeti/LinearAlgebra/ExteriorPower/Plucker.lean:104`) and `Submodule.relativeSubspaceHeight` (`TauCeti/NumberTheory/Height/Subspace/Basic.lean:83`).

**Repair.** Delete the local `plucker`, `relativePluckerPoint` and `relativeSubspaceHeight`, state the §2.5 theorems on the Tau Ceti carriers, and list them under "From Tau Ceti".

## R04 (P3) — §1.4 adds three gate failures (`readme-ids-missing`)

**Location.**
- README line 777: "`Polynomial.hasseWronskian_map` with Mathlib's `Polynomial.eq_rootMultiplicity_map`".
- README line 779: "Mathlib's `Polynomial.count_roots` with `Polynomial.card_roots'`".

**Claim.** The gate reads a dotted name under one of `Suggested.lean`'s namespaces (here `Polynomial`) as a claim that the file declares it, and `Suggested.lean` never mentions these three. They are the only gate failures this pull request introduces. The other nine hits of the rule are already on main, for example `Height.mulHeight_zero` and `Finsupp.logHeight_eq_log_mulHeight` in §1.3. All twelve are genuine Mathlib declarations: the three new ones are at `Mathlib/Algebra/Polynomial/Roots.lean:78`, `:97` and `:940`.

**Witness.** The gate on main reports `readme-ids-missing` = 9. At this head it reports 12, the three new ones being `Polynomial.card_roots'`, `Polynomial.count_roots` and `Polynomial.eq_rootMultiplicity_map`.

**Repair.** The following was tested with the gate's own `readme_identifiers_missing` on scratch copies, and it reaches 0:
1. Write five names as "lemma `x` of namespace `N`": `eq_rootMultiplicity_map`, `count_roots` and `card_roots'` of `Polynomial`; `hasFiniteMulSupport_iSup_nonarchAbsVal` (which is private) and `mulHeight₁_eq_mulHeight` of `Height`.
2. Pin the other seven with `#check @…` beside the existing pins:
   - `Finsupp.logHeight_eq_log_mulHeight`;
   - `Height.mulHeight_comp_equiv`, `_comp_le`, `_fun_mul_eq`, `_linearMap_apply_le`, `_sumElim_zero_eq` and `_zero`.

   All seven elaborate at the pin.

Mentioning the names in a docstring does not work for `card_roots'`: the rule's word-boundary test fails after the prime.

## R05 (P3) — §1.4 still restates the multivariable Wronskian layer that pinned Tau Ceti proves, and admits examples about a Tau Ceti declaration

**Location.** §1.4:
- README line 791, "Define `MvPolynomial.genWronskian` as follows", with its API;
- line 818, the P22 Thm. 3.3.7 criterion;
- line 822, the P22 Lem. 3.3.9 product identity;
- line 832, the §3.4.5 partial-degree bound.

`Suggested.lean`:
- line 810: the local `genWronskian`;
- lines 818 and 841: `genWronskian_eq_zero_of_not_linearIndependent` and `linearIndependent_iff_exists_genWronskian_ne_zero`, restated with `sorry`;
- lines 651, 658, 660 and 663: four admitted examples about `Polynomial.hasseWronskian`;
- lines 823, 831, 834 and 837: four admitted examples about `genWronskian`.

**Claim.** The pull request repaired the one-variable half of the first review's R05, consuming Tau Ceti's `Polynomial.hasseWronskian`. The multivariable half, in the same section, is still restated, although the pin proves all of it. The four `hasseWronskian` examples now admit facts about a Tau Ceti declaration.

**Witness.** In `TauCeti/RingTheory/MvPolynomial/HasseDeriv/Wronskian.lean`:
- `MvPolynomial.genWronskian` (`:86`);
- `genWronskian_fin_zero`, `genWronskian_fin_one`, `map_genWronskian` and `genWronskian_single_toMvPolynomial` (`:97`, `:104`, `:110`, `:127`);
- `genWronskian_eq_zero_of_not_linearIndependent` (`:137`);
- `det_hasseDeriv_sum_mul_toMvPolynomial` (`:153`), which is Lem. 3.3.9;
- `linearIndependent_iff_exists_genWronskian_ne_zero` (`:234`), which is Thm. 3.3.7.

`MvPolynomial.degreeOf_genWronskian_le` (`…/HasseDeriv/DegreeBound.lean:58`) is the line-832 bound.

**Repair.**
1. List these declarations under "From Tau Ceti" with the one-variable API, and turn the "Define" and "Prove" sentences at lines 791, 818, 822 and 832 into citations.
2. Delete the local `genWronskian`, the two restated theorems and the eight admitted examples. The README keeps the Checks.
3. Cite `MvPolynomial.degreeOf_genWronskian_le` with `genWronskian_single_toMvPolynomial` for the coarse bound `natDegree W(g) ≤ ℓd` at line 775.

## R06 (P3) — The degree estimate is stated only over fields

**Location.** README line 775: "Prove `natDegree_add_derivative_orders_le`: for a field K, …". `Suggested.lean` line 863: `{K : Type*} [Field K]`.

**Claim.** The derivation the README gives works over every commutative ring. It uses only that the k-th Hasse derivative lowers `natDegree` by k or vanishes, and that `natDegree` of a product is at most the sum. A nonzero Leibniz term then forces `σ(j) ≤ deg gⱼ` for every j. Auxiliary polynomials in this roadmap live over ℤ, so the field version costs consumers a detour through ℚ.

**Witness.**
- Over ℤ, `g = (1, X, X²)` gives the unitriangular `W = 1` and `0 + 3 ≤ 0 + 1 + 2`, a case the stated theorem does not cover.
- The two library inputs are over semirings: `Polynomial.hasseDeriv_eq_zero_of_lt_natDegree` and `Polynomial.natDegree_hasseDeriv_le` (`Mathlib/Algebra/Polynomial/HasseDeriv.lean:90`, `:180`).

**Repair.** State it for `{R : Type*} [CommRing R]` and `g : Fin ℓ → R[X]`, and say "for a commutative ring R" in the README. That signature elaborates at the pins (checked on a scratch file). The multiplicity bound keeps its field.

## R07 (P3) — The closing sentence of §1.4 defers to an unnamed "application"

**Location.** README line 789: "The choice of a bivariate specialization and the rank argument for an auxiliary matrix belong to the application, and the characteristic-p comparisons between ordinary and Hasse jets are not part of this section."

**Claim.** "The application" is defined nowhere in the README, and the sentence names no owner. Scope statements belong under `## Scope and ownership` and name roadmaps; a reader of §1.4 cannot tell what is meant.

**Witness.** No section of the README mentions a bivariate specialization, an auxiliary-matrix rank argument or Hasse jets in characteristic p.

**Repair.** Delete the sentence. Alternatively, move it to `## Scope and ownership`, name the owning roadmap and section, and add that owner to the description's merge-order paragraph if it is still an open pull request.

## R08 (P3) — 296 TeX constructions outside code spans

**Location.** Already on main. For example line 242 `N_{ℚ/ℚ}`, line 553 `∑_{i=0}^{natDegree P}`, line 592 `x^{m−d}`, and line 609 `Ind_{a,r}`.

**Witness.** Gate `tex` = 296; none of the hits is in the lines this pull request adds.

**Repair.** Write the expressions in Unicode with parentheses (`N_(ℚ/ℚ)`, `x^(m−d)`) or put them in code spans.

## R09 (P3) — `Suggested.lean` is an API catalogue, not the acceptance test

**Location.** Already on main.
- The module docstring (lines 6–21): "This file suggests definitions and theorem signatures statable against the pinned APIs, with discriminating examples. It is not exhaustive."
- 171 `example`s, 168 of them admitted.
- The name catalogues at lines 3732 and 3784.
- Local copies of pinned carriers and restatements of pinned theorems.

**Claim.** Admitted examples test nothing, and name catalogues are not allowed. The docstring neither says that the file states the headlines nor names the headlines that cannot be stated. Pinned declarations are restated instead of cited.

**Witness.**
- Gate `sorry-examples` = 168. The one-tactic probe also closes four of them outright, at lines 2138, 2245, 2382 and 3582.
- Local definitions with pinned counterparts:
  - `primitiveMinpoly` (line 129; `TauCeti/FieldTheory/Minpoly/Primitive.lean:92`);
  - `mahlerMeasure` (184; `TauCeti/NumberTheory/Height/MahlerMeasure.lean:66`);
  - `house` (206; `TauCeti/NumberTheory/Height/House.lean:106`);
  - `irrationalityExponent` (410; `…/DiophantineApproximation/Exponent.lean:46`);
  - `BadlyApproximable` (515; `…/BadlyApproximable.lean:62`);
  - `l1Norm` (613; `TauCeti/Analysis/Polynomial/L1Norm.lean:52`);
  - `weightedIndex` (745; `TauCeti/RingTheory/MvPolynomial/WeightedIndex.lean:83`);
  - `InGeneralPosition` (1035; `TauCeti/LinearAlgebra/LinearIndependent/GeneralPosition.lean:39`);
  - `twistedHeight` (1525; `TauCeti/NumberTheory/Height/Twisted/Basic.lean:182`);
  - `IsDFinite` (2969; `TauCeti/RingTheory/PowerSeries/DFinite.lean:80`).
- Restated theorems:
  - `roth` (942) is `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg` (`…/Roth/Theorem.lean:175`), which needs no `Irrational α`;
  - `not_liouvilleWith_of_isAlgebraic` (957) is `IsAlgebraic.not_liouvilleWith` (`:281`);
  - `thue_equation_finite` (975) is `MvPolynomial.IsHomogeneous.finite_setOf_eval_eq_of_three_le_card_roots` (`…/Roth/BinaryForm.lean:323`), with identical hypotheses;
  - `linearIndependent_exp` (2364) and `transcendental_rpow` (2454) are the Tau Ceti theorems of R01.

**Repair.**
1. Delete the admitted examples (the README keeps them as Checks) and the two catalogues.
2. Replace the local carriers by the Tau Ceti ones, and the restated theorems by `#check` pins.
3. Rewrite the docstring in the required form, naming each headline that cannot be stated and what it lacks.

The `Suggested.lean` of head 449f041 is a tested model: 49 headline theorems, 14 pins, gate OK.

## R10 (P3) — Statement hygiene (3 hits)

**Location.** Already on main.
- Line 2750: `sUnits_rat_mulEquiv` concludes `Nonempty (… ≃* …)`.
- Lines 3267 and 3447: `siegel_shidlovskii` and `nishioka` have `letI` in their signatures.

**Witness.** Gate `statement-hygiene`. Pinned Tau Ceti has the isomorphism as data: `TauCeti.sUnitsRatMulEquiv` (`TauCeti/NumberTheory/NumberField/SUnits/Rat/Structure.lean:196`).

**Repair.** Delete `sUnits_rat_mulEquiv` and cite `TauCeti.sUnitsRatMulEquiv` under "From Tau Ceti". Replace each `letI` with an instance binder or a named instance.

## R11 (P3) — §5.7 restates §3.8's conditional theorems

**Location.** Already on main.
- `Suggested.lean` line 2409 (`SchanuelConjecture.algebraicIndependent_exp_one_pi`) against line 3723 (`algebraicIndependent_e_pi_of_schanuel`).
- Line 2413 (`SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs`) against line 3727 (`logarithmsConjecture_of_schanuel`).
- README §5.7 (lines 3940–3976) against §3.8 (lines 2770–2790).

**Claim.** Each conditional theorem is stated twice, and the §5.7 Checks repeat §3.8's. §5.7 itself says to "use §3.8's theorem through the namespace abbreviation".

**Witness.** Unfolded, `LogarithmsAlgebraicIndependenceConjecture` is §3.8's second statement once `mem_algebraicLogs` is applied. Similarly, `Real.exp 1` against `Complex.exp 1` is the only difference in the e–π pair.

**Repair.** Delete the §5.7 restatements and the repeated Checks. §5.7 keeps `LogarithmsAlgebraicIndependenceConjecture` and cites §3.8.

## R12 (P3) — Seven references in §§4.3–4.5 point to labels that are never defined

**Location.** Already on main; §§4.4–4.5 are in the sample. The labels and their lines:
- `unit-exponent-house-bound` (2883);
- `unit-equation-exponent-bound` (2887);
- `bounded-divisor-representatives` (2897);
- `thue-equation-monic-reduction` (2905);
- `thue-equation-effective-bound` (2913, 2965);
- `exponent-height-bound-for-finitely-generated-groups` (2955);
- `gyory-equation-exponent-bound` (2959, 2965).

**Witness.** A search of the README finds each label only where it is used. No "Prove <label>:" sentence defines any of them.

**Repair.** Label each referenced statement where it is stated ("Prove unit-equation-exponent-bound: …", as §3.7 does for `yuValuationAdapter`), or replace the reference by the statement's own words. The intended targets:
- the κ(u) statement of §4.1 (E19 Lem. 5.9);
- the first statement of §4.3;
- `boundedDivisors` (Tau Ceti `TauCeti.NumberField.Units.boundedDivisors`, `…/Units/Balanced.lean:180`);
- the monic reduction of §4.3;
- the effective Thue statement of §4.3;
- the S-logarithm statement at line 2953;
- the Győry bound at line 2955.

## R13 (P3) — Locator slips found in the sample

**Location, witness and repair.** All already on main. The page offsets used are confirmed by the page footers in the cached texts: E19 ch. 1 = PDF − 2, ch. 2 = PDF + 10, ch. 5 = PDF + 84, ch. 8 = PDF + 154; P22 = PDF − 6; Bugeaud and Wu = PDF.
- **Line 411.** "(E19, ch. 1, Thm. 1.1, Thm. 1.3, pp. 2-3": Thm. 1.1 is on p. 1 (E19-ch1 line 17, footer "1" at line 30) and Thm. 1.3 on p. 2 (line 55). Repair: "Thm. 1.1, p. 1; Thm. 1.3, p. 2".
- **Line 444.** "Bugeaud, §1, Def. 1.2, p. 3": Def. 1.2 is on p. 2 (Bugeaud line 50; page 2 is lines 32–68). Repair: p. 2.
- **Line 980.** "Lem. 8.5, p. 161": Lem. 8.5 is on p. 160 (E19-ch8 line 160, footer "160" at line 181), as line 978 already says. Repair: p. 160.
- **Line 377 (§0.3).** The central-binomial bound `binom(k,⌊k/2⌋)√(k+1) ≤ 2ᵏ` cites "Wu, §3, Lem. 3.5, p. 7". But Wu Lem. 3.5 (Wu line 317) is the product inequality `2^(−d)∏ℓ∞(fⱼ) ≤ ℓ∞(f) ≤ 2^d∏ℓ∞(fⱼ)`; the bound is P22 Lem. 3.2.9, p. 83 (P22 line 4863), which §1.3 line 744 already cites. Repair: cite P22 Lem. 3.2.9, p. 83.
- **Line 620 (§1.2).** "P22, §3.4.7, Exercise 3.6, pp. 93-94": §3.4.7 is on p. 93 (P22 line 5451), but Exercise 3.6 is on p. 95 (P22 line 5519, PDF 101). Repair: "§3.4.7, p. 93; Exercise 3.6, p. 95".
- **Line 184 (§0.0).** The linear-forms theorem assumes `∏bᵢ ≥ |det A|` and stresses "the determinant-equality boundary", but E19 Cor. 2.6 (E19-ch2 lines 303–307) assumes the strict `A₁⋯Aₙ > |det|`. Repair: derive the closed form from Mathlib's `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (compact convex body, `≤`; `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:92`) and cite it next to Cor. 2.6.
- **Line 1096 (§2.4, `closedFormRecurrence`).** "(E19, ch. 8, §8.4, pp. 173–175": the closed form is E19 Thm. 8.17, stated on p. 172 (E19-ch8 line 569, footer "172" at line 589) with its proof ending on p. 173. Pages 174–175 hold Skolem–Mahler–Lech (Thm. 8.18, line 643). Repair: "E19, ch. 8, Thm. 8.17, pp. 172–173".
- **Line 1196 (§2.4).** The covering of the solutions of `Σaᵢxᵢ = 0` by finitely many proper subspaces of the hyperplane cites Thm. 8.13 (p. 168, finiteness of non-degenerate solutions). E19 states the covering itself as Lem. 8.15, p. 170 (E19-ch8 line 496), for Γ ⊆ ℚ*. Repair: add "Lem. 8.15, p. 170".
- **Lines 2955 and 2959 (§4.5).** "(Yu's theorem for algebraic numbers)" has no locator. E19 only mentions such a generalization of Thm. 5.16 (E19-ch5 line 636, p. 103). Repair: cite §3.7's `yu` and Yu 1994, Theorem 1′, p. 246 (Yu 1994 line 145).
- **Line 3349 (§5.5 Check).** "For A=(1 − 2z)⁻¹, α=2^{−1/2} is not regular" omits q. For q = 3, `α^(3^ℓ) = 2^(−3^ℓ/2)` is never 1/2, so α is regular; the Lean example at line 3368 fixes q = 2. Repair: add "for q = 2".

## Verified sound

**Previous findings.** The previous review (at 449f041) accepted with no findings, so there is nothing to check finding by finding at that level. This head undoes the repairs that the first three reviews asked for and the fourth verified, so here is where the first review's findings (which read this same main text plus an earlier §1.4) now stand:
- **Back again as R01, R02, R03, R08, R10, R11, R12 and R13:** the first review's R01, R02, R03, the main part of R04, R10, R11, R12 and R13.
- **Back again as R09:** its R09.
- **§1.4 part of its R04: repaired.** The gate shows `latex` = 0 and `prnum` = 0, and the `pull/1905` link and the Mathlib-PR sentence are gone.
- **Its R05: partly repaired.** The one-variable API is consumed from Tau Ceti: README lines 103 and 762, and the ten `#check` pins at `Suggested.lean` 639–648; the two restated theorems and the local definition are deleted. The multivariable half is still restated (R05 here).
- **Its R06: repaired.** Two theorems remain, at `Suggested.lean` 863 and 873. Each has a docstring, both are in the Layer 1 section (after line 574, before the Layer 2 header at 1021), and both are named in README lines 775 and 779.
- **Its R07: repaired.** Line 777 says "over every field", and `[CharZero K]` is kept only on the summed bound.
- **Its R08: repaired.** Lines 775, 777 and 779 now say "Derived here" and name the inputs.

**Gate, dependency check and builds.**
- My rerun of the gate on this head has the same counts as the worker's: `tex` 296, `sorry-data` 1, `sorry-examples` 168, `statement-hygiene` 3, `dropped` 71, `readme-ids-missing` 12, `depcheck` 2, every other rule 0.
- The same gate run on main (71c8f21) differs only in `readme-ids-missing` (9). The detail-by-detail diff shows that the three new hits are the only new failures.
- Dependency check: `depcheck: 234 roadmaps, 2275 edges, 2 problem(s)`, the two UPWARD lines quoted in R02.
- `lake env lean` on `Suggested.lean`: exit 0, 445 ``declaration uses `sorry` `` warnings, 0 errors, no other warning. Every `#check` resolves.
- A scratch copy of `Completed/HeightsAndUnits/Suggested.lean`, which imports this module, elaborates against this head with 0 errors and 70 `sorry` warnings. The worker's targeted build covers `SubspaceTheorem`.
- Neither importer uses any of the deleted names: a search for `hasseWronskian` and `WronskianBounds` outside this folder finds nothing. No roadmap on main or at an open head cites §1.4, the deleted names or `WronskianBounds`.

**Signatures and the one-tactic probe.**
- `#check @` of the two new theorems:
  - `natDegree_add_derivative_orders_le : ∀ {K} [Field K] {ℓ} (g : Fin ℓ → K[X]), hasseWronskian g ≠ 0 → natDegree + ∑ k ≤ ∑ j natDegree (g j)`;
  - `sum_multiplicity_lower_bounds_le_natDegree : ∀ {K} [Field K] [CharZero K] {ℓ} V (b : Basis (Fin ℓ) K V) S (f : K → V), (∀ a ∈ S, f a ≠ 0) → ∑ (rootMultiplicity a (f a) + 1 − ℓ) ≤ natDegree (hasseWronskian b)`.

  Both match README lines 775 and 779; no binder is lost.
- Probe: in five chunks of about 90 (under Lean's error limit), every `sorry` in a scratch copy was replaced by `first | rfl | norm_num | simp | infer_instance | trivial`. No theorem closes, so there is no theorem-level padding. Only four admitted examples close (R09).

**Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d).**
- Tau Ceti `Polynomial.hasseWronskian` API (`TauCeti/RingTheory/Polynomial/HasseWronskian.lean:73–235`): `_fin_zero` (83), `_fin_one` (88), `_fin_two` (93, equal to `(g 0).wronskian (g 1)`), `prod_factorial_mul_hasseWronskian` (101), `_comp_perm` (111, sign), `_map` (120), `_update_add_smul` (129), `_eq_zero_of_not_linearIndependent` (140, `[IsDomain R]`), `_ne_zero_of_linearIndependent` (196, `[Field K] [CharZero K]`) and `linearIndependent_iff_hasseWronskian_ne_zero` (235). These are exactly the ten names and hypotheses of the README contract at line 103.
- The multivariable layer cited in R05, and `degreeOf_genWronskian_le_sum` (`DegreeBound.lean:48`).
- Mathlib:
  - `Polynomial.natDegree_wronskian_lt_add` (`Mathlib/RingTheory/Polynomial/Wronskian.lean:111`, hypothesis `wronskian a b ≠ 0`), which is the ℓ = 2 Check;
  - `Polynomial.count_roots`, `card_roots'` and `eq_rootMultiplicity_map` (`Roots.lean:97`, `:78`, `:940`; the last needs `Function.Injective f`).
- Mathlib has no lemma summing root multiplicities at distinct points (searched `Mathlib/Algebra/Polynomial` and Tau Ceti for `∑ … rootMultiplicity`), so the README's route through `count_roots` and `card_roots'` is the right one.
- The pinned carriers and theorems listed in R03, R09 and R10, each opened at the line given.

**Ownership.**
- No open roadmap states the Wronskian degree or multiplicity bounds. ArithmeticInterpolationDeterminants, the closest by vocabulary, consumes Tau Ceti's `Polynomial.hasseWronskian` (its README lines 117–120 and 333–334). It states only the Hasse root-count bound `k·#S ≤ D`, not a Wronskian bound.
- `overlaps.md` lists no other pull request changing this folder and no dropped id, and §1.4's heading is unchanged.
- No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap.

**Sources: the seeded sample.** All fifteen sections were read against their texts; 127 locator lines in all. I read 0.0, 0.1, 0.3, 0.6 and 1.2 line by line myself. For the other ten, a helper located the passages, and I read the lines I rely on, quoted in this report. 101 of the 108 helper rows match number and page.
- **0.0.** E19-ch2 Cor. 2.6 line 303 p. 20 (strict; R13), Lem. 2.8 line 409 p. 23, Thm. 2.9 line 439 p. 24 (`2ⁿ/n!·d(L)/vol C ≤ ∏λᵢ ≤ 2ⁿ·d(L)/vol C`), Ex. 2.11 line 655 p. 31.
- **0.1.** E19-ch3 lines 65–76 p. 41: `F_α` with `a₀ > 0` and gcd 1, `H(α)`, and the example `25X² − 10X − 11`, `H = 25`. Ex. 3.1 line 77 p. 41; Lem. 3.7 line 122 p. 42. E19 ch. 6 Thm. 6.1 line 20 p. 107, with the primitive minimal polynomial and `M(α)` in its proof, lines 26–34 p. 108.
- **0.3.**
  - E19-ch1 Thm. 1.7 line 132 p. 5; Wu Thm. 3.4 line 305 p. 6 (count `d(2⌈(2H)^d⌉+1)^(d+1)`); Wu Lem. 3.5–3.6 lines 317, 328 p. 7.
  - E19-ch3 Ex. 3.6 line 794 p. 58 (`H(α) ≤ (2·house α)^d`), Ex. 3.7 line 833 p. 60, Lem. 3.19 line 568 p. 52, Thm. 3.20 lines 579–593 p. 52 (`N > dM > 0`, bound `(3NA)^(dM/(N−dM))`).
- **0.6.** E19-ch2 Ex. 2.6 line 363 p. 22; Littlewood conjecture lines 384–393 pp. 22–23; Ex. 2.7 line 394 p. 23.
- **1.2.** P22 Lem. 2.6.1 line 3886 p. 68, normalisation (2.6.1) line 3965 p. 69, Def. 2.6.2 line 3969 p. 69, Ex. 2.6.3 line 3974, Ex. 2.19 line 4182 p. 72, §3.4.6 line 5395 p. 92 (archimedean factor `2^(r₁+…+rₙ)`, none at finite places, line 5423), §3.4.7 line 5451 p. 93, index lower bound line 5468 p. 94.
- **1.3.** P22 Def. 3.2.1 line 4585 p. 80, Lem. 3.2.2 line 4597 p. 80, Lem. 3.2.8–3.2.10 lines 4840, 4863, 4872 pp. 83–84, Prop. 3.2.12 line 4982 p. 84, Ex. 3.3 line 5050 p. 85, Lem. 3.4.3 line 5316 p. 90. Its absolute heights times `[K:ℚ]` give the README's relative form.
- **1.4.** P22 Def. 3.3.1 line 5061 p. 85, Lem. 3.3.2 line 5071 p. 86, Prop. 3.3.3 line 5080 p. 86, Remark 3.3.6 line 5137 p. 87. P22 assumes `F ⊆ ℂ` with ordinary derivatives; the Hasse normalisation and arbitrary characteristic-zero fields come from the Tau Ceti API.
- **2.2.** E19-ch7 Thm. 7.9 line 347 p. 146 (`n < d`, ℚ-independent `αᵢ`, Galois group `S_d`), Lem. 7.10–7.11 lines 351 and 382, and Thm. 7.13 p. 149.
- **2.4.**
  - ESS02 Thm. 2.1 lines 356–362 p. 815: count `exp((5n)^(3n)(r+1))`, and budget (2.10) `exp(−(4n)^(3n))` at line 354. The README's `(5n)` budget is the stronger hypothesis, consistent with (11.19).
  - ESS02 Thm. 1.1 p. 808, Thm. 1.2 pp. 812–813, Lem. 3.1 p. 815.
  - E19-ch8 Thm. 8.13 line 447 p. 168, Thm. 8.17 line 569 p. 172, Thm. 8.18 line 643 p. 174.
- **2.8.** EF13 Thm. 3.1 lines 564–575 pp. 13–14 (`C₁ = max((H*)^(1/3RD), n^(n/ε))`, at most `10⁹2^(2n)n¹⁴ε⁻³log(3ε⁻¹RD)log(ε⁻¹log 3RD)` subspaces over K), Thm. 2.1 p. 10, Thm. 2.3 p. 12, Lem. 5.1 p. 23, Thm. 8.1 p. 34, Lem. 13.1 p. 50, Thm. 16.1 p. 71, Prop. 17.5 p. 81. ES02 (author preprint, fetched into a scratch manifest) Lem. 21.1 line 4578 p. 97 matches the README; the README drops the source's cardinality bound (21.2), which is weaker and allowed.
- **3.7.** E19-ch5 Thm. 5.16 p. 101 and Ex. 5.9(i) p. 106; Yu 1994 §0.1 pp. 241–242 and Theorem 1′ line 145 p. 246; Yu 1990 (fetched into a scratch manifest) Lem. 1.4 line 187 p. 23.
- **3.8.** E19-ch4 Schanuel lines 435–437 p. 75; Ex. 4.4 line 438 p. 75, which the README's "pairwise distinct" Check answers.
- **4.4.** E19-ch5 Thm. 5.14 p. 98, Thm. 5.15 line 532 p. 99; BEG13 Thms. 2.1–2.3 lines 129–141 p. 4.
- **4.5.** E19-ch5 Thm. 5.17 line 594 pp. 101–102, Lem. 5.9 p. 91, Thm. 5.18 line 632 p. 103; BG96 Lem. 1 and (12) pp. 71–72; Tzanakis–de Weger §1 p. 223 and §§5–6 pp. 230–233.
- **5.3.** B08 Def. 4.4.1 line 789 p. 20, Thm. 4.4.3 line 802 p. 20, Lem. 5.2.1 line 849 p. 22, Thm. 5.1.2 and Prop. 5.3.1 pp. 21–24.
- **5.7.** BT Conj. 1.2.1 line 96 p. 3; Waldschmidt, periods, Conjecture 43 lines 1019–1023 p. 455.

### Adversarial table

| Statement | Instances tried | Values (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `natDegree_add_derivative_orders_le` | ℚ: `(1, X, X²)`; `(X, 1)`; `(X², 1)`; `(1, 1)`; ℓ = 0 | `W = 1`: 0 + 3 ≤ 3, equality; `W = −1`: 0 + 1 ≤ 1; `W = −2X`: 1 + 1 ≤ 2; `W = 0`: 0 + 1 ≤ 0 fails, so `hg` is needed; empty `W = 1`: 0 ≤ 0 | holds; `hg` necessary | none |
| same, characteristic 2 | 𝔽₂: `(X, X²)`; `(1, X²)` | `D¹X² = 2X = 0`, `W = −X² = X²`: 2 + 1 ≤ 1 + 2, equality; `W = 0` excluded | holds in characteristic 2 | none |
| same, over ℤ | `(1, X, X²)` in ℤ[X] | `W = 1`, 0 + 3 ≤ 3, but `[Field K]` excludes ℤ | holds, but outside the stated field | R06 |
| §1.4 coarse bound | `deg gⱼ ≤ d`, `W = 0` | `natDegree 0 = 0 ≤ ℓd`; for `W ≠ 0`, `≤ ℓd − ℓ(ℓ−1)/2` | holds | cite pin (R05) |
| §1.4 divisibility over every field | 𝔽₂, `V = span(1, X²)`, `f = X²`, a = 0; 𝔽₃, `V = span(1, X³)`, `f = X³`; ℚ, `V = span(X², (X−1)²)`, `f = X²` | exponent (2+1)−2 = 1, `X ∣ 0`; `W = det[[1, X³],[0, 3X²]] = 0`, exponent 2, `X² ∣ 0`; `W = 2X(X−1)`, exponent 1, `X ∣ W` | holds; no characteristic hypothesis needed | none |
| §1.4 basis invariance | `c = (b₀ + b₁, b₁)`; `c = (2b₀, b₁)` | `W(c) = W(b)` by `_update_add_smul`; `W(c) = 2W(b)`: same multiplicities | holds | none |
| `sum_multiplicity_lower_bounds_le_natDegree` | ℚ, `V = span(1, X^m)`, `S = {0}`, `f = X^m`; `V = span(X², (X−1)²)`, `S = {0, 1}`; ℓ = 0; `S = ∅` | (m+1)−2 = m−1 = natDegree(mX^(m−1)); excesses 1 + 1 = 2 = natDegree(2X(X−1)); `V = ⊥` forces `S = ∅`, 0 ≤ natDegree 1 = 0; 0 ≤ natDegree | holds with equality in two cases | none |
| same, characteristic 2 | 𝔽₂, `V = span(1, X²)`, `f = X²` | bound (2+1)−2 = 1, `W = 0` with natDegree 0 | `[CharZero K]` necessary | none |
| §1.4 Checks | `W(1, X, X²)`; classical; `W(X, 2X)`; `W(1, X)`; ℤ/4ℤ `C 2`; ℚ×ℚ `(1, 0)`; ℓ = 2 | 1; det[[1,X,X²],[0,1,2X],[0,0,2]] = 2; 2X − 2X = 0; 1; 2·2 = 0 but `W = 2`; (0,1)·(1,0) = 0 but `W = (1,0)`; matches `natDegree_wronskian_lt_add` via `_fin_two` | all hold | none |
| §0.0 Minkowski bounds | ℤ², `B = [−4,4]×[−1,1]`; ℤ^d with the cross-polytope | λ = (1/4, 1), vol 16: 16·1/4 = 4 = 2²·1, lower bound 2 ≤ 4, `λ₁²` gives 1 < 2; 2^d/d!·1 = lower bound, equality | Checks hold | none |
| §0.0 linear forms | `A = I₂`, `b = (1, 1)` | `∏b = 1 = |det A|`: `z = (1, 0)` works, but Cor. 2.6 needs `>` | true; locator too weak | R13 |
| §0.0 Gram | rows (1,0), (1,1) | det Gram = det[[1,1],[1,2]] = 1 ≤ 1·2 | holds | none |
| §0.1 `primitiveMinpoly`, `naiveHeight` | 2/3; (1+2√3)/5; 1/2 | 3X − 2; sum 2/5, product −11/25, giving 25X² − 10X − 11 and H = 25; `minpoly ℤ (1/2) = 0 ≠ 2X − 1` | match E19-ch3 lines 72–76 | none |
| §0.3 count | d = 1, B = 1; d = 0; B < 1 | {−1, 0, 1}: 3 ≤ 1·3² = 9; empty, bound 0; empty since H ≥ 1 | holds | none |
| §0.3 central binomial | k = 0, 2, 5 | 1 ≤ 1; 2√3 = 3.46 ≤ 4 (and 6 > 4 without the root); 10√6 = 24.5 ≤ 32 | holds | R13 (locator) |
| §0.3 Ex. 3.6(ii), Ex. 3.7(i) | √2; 1+√2; z = 1/2; z = (1−√5)/2 | H = 2 ≤ (2√2)² = 8; H = 2 ≤ (2(1+√2))² = 23.3; 1/2 ≥ 1/2; 0.618 ≥ house⁻¹ = 0.618 | hold, two equalities | none |
| §0.3 Thm. 3.20 | K = ℚ, M = 1, N = 2, a = (1, 1), A = 1 | exponent 1/(2−1) = 1, bound 6; x = (1, −1) | holds | none |
| §0.6 | q = 1/2; √2 | even y gives `‖yq‖ = 0`, product 0 < ε; y = 1, 5, 12 give 0.414, 0.355, 0.353 ≥ 1/(2√2) = 0.354 roughly | consistent with Ex. 2.7 | none |
| §1.2 Checks | `Ind_((0,0),(3,3))(x₀³ − x₁²)`; `Ind_((0,0),(1,2))(x₀x₁)`; `∂^(2,0)(x₀³x₁)`; `∂^(2)(x₀²)`; `(x−β)^m` | min(3/3, 2/3) = 2/3 (P22 Ex. 2.6.3: q/k); 1 + 1/2 = 3/2; 3x₀x₁; 1 against 2; m/r | hold | none |
| §1.2 `Ind(P) ≤ Ind(DᵈP) + Σdⱼ/rⱼ` | `P = x³` at 0, r = 1, d = 1 | 3 ≤ 2 + 1; true over any ring (binomial zeros only raise the right side) | holds | none |
| §1.3 Lem. 3.2.8, 3.2.10 | r = (2, 2); f = g = X + 1 | 2·2 = 4 ≤ C(4,2) = 6; 1·1 ≤ 2²·2 | hold | none |
| §2.2 | K = ℚ(2^(1/3)), n = 2; K = ℚ(√2), M = 𝓞 | `x³ + 2y³ = c` finite (Thue); `x² − 2y² = 1` infinite, the n = d obstruction | consistent with Thm. 7.9 and Thm. 7.13 | none |
| §2.4 Checks | Fibonacci; `u(h+2) = −u(h)`; `(X−1)²`; `x₁ − x₂ = 0` in ⟨2⟩ | ratio −φ² ≈ −2.618 is not a root of unity; ±i with ratio −1; `u = a + bh` has at most one zero; (2^k, 2^k) is infinite, so n ≥ 3 is needed | hold | none |
| §2.4 perturbed unit equation | ESS02 (2.10) against README | budget `exp(−(4n)^(3n))` in the source, `exp(−(5n)^(3n))` here (stronger hypothesis); count `exp((5n)^(3n)(r+1))` in both | consistent | none |
| §2.8 ES02 Lem. 21.1 | q = 1, γ = 1/2 | J = {1/2}, any y > 0 satisfies `(1/2)Y ≤ y` | consistent | none |
| §3.7 lifting the exponent | p = 3, a = 3, b = 3; p = 2, a = 4, b = 4 | v₃(4³ − 1) = v₃(63) = 2 = 1 + 1; v₂(5⁴ − 1) = v₂(624) = 4 = 2 + 2 | holds | none |
| §3.7 adapter | Θ = p in a degree-ef extension | `adicAbv` gives `(p^f)^(−e)`, ℚ_p modulus `p^(−1)` | as the Check says | none |
| §3.8 | x = (0); x = 1; x = (1, √2); x = (1, πi) | single (0) is pairwise distinct but trdeg ℚ(0,1) = 0 < 1; trdeg ℚ(e) = 1; Lindemann–Weierstrass gives 2; trdeg ℚ(πi, e) ≥ 2 so e and π are independent | hold | none |
| §4.4 reduction | x = 4; x = −1; x = 0, 3 | y = 2, au³ = 8, bv³ = 1, 8 − 2 = 6; au³ = −2, bv³ = −4, −2 + 8 = 6; y = 0 with v = 1, b = −3; 18² = 324 equations | consistent | R12 (labels) |
| §4.4 BEG13 at K = ℚ, S = {∞} | BEG13 lines 129–141 | s = d = |D_K| = P_S = 1: `(6N)^(14n³N³)e^(8n²N³ĥ)`, `(4N)^(2¹²N⁴)e^(50N⁴ĥ)`, `(10N²)^(40N)e^(11Nĥ)` | match the README | none |
| §4.5 S-unit triples | S = {2, 3}, 9/8 − 1/8 = 1; S = ∅; box with B = 1, \|S\| = 1 | u = 9, v = −1, w = 8, coprime, max exponent 3; U_∅ = {±1} gives sums 2, 0, −2, so no solution; 2·3 = 6 elements | hold | R12, R13 |
| §5.3 iterates | T = 1 − X, M = 1; T = M = 1; T = 1, M = 0 | P₁ = 1, P₂ = (1 + 1)/2 = 1, P₃ = (1 + 2)/3 = 1; P₂ = 1/2; P_(m+1) = 0 | Checks hold | none |
| §5.3 `GalochkinCondition` | `T = 1, M = 1`; `T = 0` | q_s = s!, not ≤ C^s; excluded by T ≠ 0 | negative Checks hold | none |
| §5.7 Checks | z = (1, 2); log 2, log 4; log 2, log 3 | trdeg ℚ(e, e²) = 1 < 2; log 4 = 2 log 2; ℚ-independent by unique factorisation | hold | R11 (duplicate) |
| `roth` (headline) | against the pinned `IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg`; rational α = 1/2, κ = 3 | identical set; the pin has no `Irrational α`; for α = 1/2 the set {ξ : \|ξ − 1/2\| ≤ H(ξ)⁻³} is finite | restates the pin | R09 |
| `thue_equation_finite` (headline) | against the pin; F = x³ + 2y³, m = 1 | identical hypotheses; solutions (1, 0), (−1, 1) | restates the pin | R09 |
| `subspace_theorem` (headline) | x = 0; forms `X₁ − √2X₂`, `X₂` | 0 ≤ C·0 holds and 0 lies in every V; Roth approximations lie on finitely many lines | consistent | none |

## Not verifiable

- **Yu 1994 constants.** The numdam text layer has no displayed formulas, so the explicit Φ (`22000·(9.5(n+1)d/√log p)^(2(n+1))…`) of README line 2729 and of the §3.7 rational form was not compared with the source. The prose of §0.1 (lines 30–78) and the Theorem 1′ label (line 145, p. 246) were checked.
- **LMN95, Matveev, BG06, Bombieri–Vaaler, Nishioka, Schmidt 1967, Schmidt small points, Nesterenko–Philippon.** These are paywalled or were not opened. None is a sampled locator.

## Source issues

- **Misprint** in E19-ch5 at Corollary 5.5, printed p. 88: the source prints the exponent of `e·max(m,n)` as positive `C₁`; it should be `−C₁`, as the proof on the same page uses; affects nothing.
- **Gap** in ESS02 at §11, (11.19), p. 834: the source works with the budget `exp(−(5n)^(3n))` while (2.10) of Theorem 2.1 assumes `exp(−(4n)^(3n))`; it should assume the 5n budget or justify 4n; affects a stated result.
- **Misprint** in E19-ch8 at §8.3, p. 169: the source quotes the ESS bound as `exp((6n)^(4n)(r+1))`; it should be `exp((6n)^(3n)(r+1))` as in ESS02 Thm. 1.1; affects nothing.
