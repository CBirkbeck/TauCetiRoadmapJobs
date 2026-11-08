# Review of DiophantineApproximationAndTranscendence (pull request #1906 at aba3def)

**Verdict:** needs changes

This pull request changes only README §1.4 (lines 758–852) and adds the `WronskianBounds` block at the end of `Suggested.lean`. R04–R08 concern that change. The other findings are already on main, but they are gate failures or principle violations in the folder, and a full review has to report them. Each one says whether it is new or already on main.

## R01 (P1) — §§3.2–3.5 and §5.7 depend on a supplier the project has dropped

**Location.** README lines 32, 54–57, 68–75, 103 and 114–140 (the table "From other open roadmap pull requests"), §3.2 (the Hermite–Lindemann, π and `algebraicLogs` items), §3.4 (six "Supplied by LinearFormsInLogarithms" items), the opening of §3.5, the §5.7 Checks, and `Suggested.lean` lines 24–40 (`SignatureModel`). Quote: "the polydisc estimates are supplied by LinearFormsInLogarithms Layers 0–1". Already on main.

**Claim.** LinearFormsInLogarithms is on the project's dropped-names list, and this project never accepts it as a supplier. Every statement routed through it therefore has no owner: the Cartesian Schwarz lemma, both Thue–Siegel lemmas, W00 Proposition 4.10, the exponential-polynomial independence result, Hermite–Lindemann, transcendence of π, complex Gelfond–Schneider, Schneider–Lang and Baker.

**Witness.** The gate's `dropped` rule has 71 hits, at lines 32, 54, 55, 56, 57, 70, 71, 75, 103, 118–127 and later. The roadmap is not on main. The pull request description also lists it as a merge-first dependency.

**Repair.** Delete every LinearFormsInLogarithms citation, the "From other open roadmap pull requests" table, the "Provider import compatibility" paragraph and `SignatureModel`. Then, for each consumed statement, do one of two things:
- Cite the pinned Tau Ceti declaration that already proves it. `TauCeti.linearIndependent_exp` and `TauCeti.algebraicIndependent_exp` (`TauCeti/NumberTheory/Transcendental/Lindemann/Theorem.lean:53` and `:85`) cover Hermite–Lindemann, e and π. `TauCeti.transcendental_rpow` (`TauCeti/NumberTheory/Transcendental/GelfondSchneider/Theorem.lean:210`) covers the real Gelfond–Schneider case.
- Otherwise state it as a target of §§3.3–3.5 with its source locator (W00 Prop. 4.7, Lem. 4.11, Lem. 4.12, Prop. 4.10; E19 Thm. 4.16, Thm. 4.19).

The §5.7 Checks should then compare with §3.2's own targets.

## R02 (P2) — Two suppliers are not on main

**Location.** README lines 30, 32, 44–46, 53, 59–63, 106, 150, 167, 182, 192 and 3789. Already on main.

**Claim.** This roadmap is on main, so it may consume only main, Mathlib and Tau Ceti. DerivedDeRhamCohomology and GeometryOfNumbersAndQuadraticArithmetic are still open pull requests.

**Witness.** The depcheck reports `UPWARD: … -> DerivedDeRhamCohomology (#22) at README lines [32, 61, 3789]` and `UPWARD: … -> GeometryOfNumbersAndQuadraticArithmetic (#73) at README lines [30, 44, 106, 150, 167, 182]`.

**Repair.**
- **GeometryOfNumbersAndQuadraticArithmetic.** Point these contracts at pinned Tau Ceti instead:
  - `ZLattice.successiveMin`, `ZLattice.successiveMin_isLeast` and `ZLattice.exists_basis_gauge_eq_successiveMin` (`TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean:111`, `:447`, `:529`);
  - `ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume` and `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measure` (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean:610`, `:717`);
  - `Matrix.det_gram_le_prod_norm_sq` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:115`).

  State the closed linear-forms theorem as a §0.0 target derived from Mathlib's `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`.
- **DerivedDeRhamCohomology.** For §5.6, state as a target the ordinary differential on `exteriorPower F n (KaehlerDifferential C F)`, with its elementary-form, square-zero and Leibniz laws.
- **Alternative.** Hold this pull request until both suppliers merge; the depcheck then passes.

## R03 (P2) — `relativePluckerPoint` has `sorry` in its body

**Location.** `Suggested.lean` lines 90–93: "Projectivization.mk K (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K)) (by sorry)". Already on main.

**Claim.** This is a `def` whose body contains `sorry` (gate `sorry-data`). `relativeSubspaceHeight` and every §2.5 subspace-height theorem mention it.

**Witness.** The gate reports sorry-data at line 90. The admitted goal is true, so it can be proved rather than assumed: the Plücker vector of a basis is nonzero, and in rank 0 it is the empty minor 1.

**Repair.** Either:
- prove the nonvanishing in place (a basis is linearly independent, so its wedge is nonzero), or
- drop the `Projectivization` carrier and define `relativeSubspaceHeight T := Height.mulHeight (plucker fun i ↦ (Module.finBasis K T i : ι → K))`. Basis independence then stays the content of `relativeSubspaceHeight_span_range`.

## R04 (P3) — LaTeX, TeX syntax and pull-request links in the README

**Location.**
- New in this pull request: the `\[ … \]` displays at lines 788–790, 803–805 and 817–820; the link to `pull/1905` at line 842; the Mathlib PR #42046 sentence at lines 849–852 ("Follow its API where it overlaps").
- Already on main: 299 TeX hits, for example line 240 `N_{ℚ/ℚ}`, line 551 `∑_{i=0}^{natDegree P}`, line 590 `x^{m−d}`.

**Claim.** This pull request introduces the gate's `latex` failures (3) and its `prnum` failure (1). The gate's `tex` count is 299.

**Witness.** Gate: latex at lines 788, 803 and 817; prnum at line 849.

**Repair.**
- Write the three displays as code spans: `natDegree W(g) + ℓ(ℓ−1)/2 ≤ Σ_j natDegree g_j`, `(X − a)^((m+1) − ℓ) ∣ W(b)` and `Σ_{a∈S} ((mult_a f_a + 1) − ℓ) ≤ natDegree W(b)`.
- Cite "ArithmeticInterpolationDeterminants §I0" by name, without the URL.
- Delete the Mathlib-PR sentence: it defers to unmerged upstream work.
- Put the older TeX inside code spans.

## R05 (P3) — §1.4 restates the Hasse–Wronskian API that pinned Tau Ceti already has

**Location.** README lines 763–781; `Suggested.lean` lines 637–640 and 659–661; the "§1.4:" entry of the name list (line 3795).

**Claim.** The API bullets, the vanishing implication and the characteristic-zero criterion are presented as this roadmap's targets, but pinned Tau Ceti already proves all of them. `Suggested.lean` restates two of them as `sorry` theorems, and its name list calls the Tau Ceti names "proposed names … not declarations in this file".

**Witness.** `Polynomial.hasseWronskian_eq_zero_of_not_linearIndependent` is at `TauCeti/RingTheory/Polynomial/HasseWronskian.lean:140` and `Polynomial.linearIndependent_iff_hasseWronskian_ne_zero` at `:235`. In a scratch probe, each restated theorem closes with that one term.

**Repair.**
- Move these declarations into "From Tau Ceti" by name: `hasseWronskian` (`:73`), `_fin_zero`, `_fin_one`, `_fin_two`, `prod_factorial_mul_hasseWronskian`, `_comp_perm`, `_map`, `_update_add_smul`, `_eq_zero_of_not_linearIndependent`, `_ne_zero_of_linearIndependent` and the criterion.
- Delete the two restated theorems and the Tau Ceti names in the §1.4 name-list entry.
- Keep the §1.4 Checks only as Checks of the consumed object.

## R06 (P3) — The new `WronskianBounds` block: padding and form

**Location.** `Suggested.lean` lines 3884–3950.

**Claim.**
- (a) Padding:
  - `rootMultiplicity_map` closes with one `rw`.
  - `natDegree_le_common_cap` and `natDegree_add_derivative_orders_le_common_cap` are a boundary form and a corollary.
  - `rootMultiplicity_eq_of_basis_change` is an invariance lemma.
  - The closing `example` is admitted.
- (b) Seven of the eight theorems have no docstring.
- (c) None of the eight names appears in the README.
- (d) The block sits after Layer 5, outside the Layer 1 section.

**Witness.** In a scratch probe, `rw [hasseWronskian_map, ← eq_rootMultiplicity_map σ.injective]` closes `rootMultiplicity_map` (`Mathlib/Algebra/Polynomial/Roots.lean:940`). Searching the README for each of the eight names finds nothing.

**Repair.**
- Delete `rootMultiplicity_map`, the two common-cap forms, `rootMultiplicity_eq_of_basis_change` and the example; the README keeps them as targets and Checks.
- Keep at most the general degree estimate and the summed multiplicity bound.
- Give each kept theorem a docstring, place it in the Layer 1 section, and name it in README §1.4.

## R07 (P3) — Characteristic zero is not needed for the divisibility, basis change or map statements

**Location.**
- `Suggested.lean`: the `[CharZero K]` binder of `root_pow_dvd_of_mem_space`, `rootMultiplicity_eq_of_basis_change` and `rootMultiplicity_map`.
- README line 799 ("with `K` of characteristic zero") and lines 808–810 ("use … the existing characteristic-zero Wronskian criterion").

**Claim.** These three statements hold over every field, and the divisibility argument needs no characteristic assumption.

**Witness.**
- `(X−a)^m ∣ f` gives `(X−a)^(m−k) ∣ Dᵏf` in every characteristic, by the Hasse Leibniz rule.
- `W(c) = det P · W(b)` for any change of basis `P`.
- Example over 𝔽₂: take V = span(1, X²), f = X², a = 0. The exponent is (2+1)−2 = 1 and W(b) = 0, and X ∣ 0.

**Repair.** Remove `[CharZero K]` from those three statements. In the README, keep characteristic zero only for `rootMultiplicity_lower_bound` and the summed bound, which do need it: in the same 𝔽₂ example the bound is 1 > rootMultiplicity 0 0 = 0.

## R08 (P3) — The new estimates have no source locator

**Location.** README lines 826–831: "P22 §3.3 supplies the determinant, nonvanishing, and basis-change machinery."

**Claim.** P22 §3.3 (printed pp. 85–89) contains Definitions 3.3.1, 3.3.4 and 3.3.5, Lemma 3.3.2, Proposition 3.3.3, Remark 3.3.6, Theorem 3.3.7, Lemmas 3.3.8–3.3.9 and Exercise 3.5. It has no basis-change statement, no degree estimate and no multiplicity estimate, so the two new bounds have no locator.

**Witness.** P22 line 5054 (start of §3.3) to line 5289 (end of Exercise 3.5) contains none of these statements.

**Repair.** Either cite a legal source for each estimate, or say that each is derived here and cite exactly what the derivation uses:
- P22 Def. 3.3.1 and Prop. 3.3.3 (pp. 85–86);
- Tau Ceti `Polynomial.hasseWronskian_update_add_smul` (`HasseWronskian.lean:129`);
- Mathlib `Polynomial.natDegree_wronskian_lt_add` (`Mathlib/RingTheory/Polynomial/Wronskian.lean:111`), which is the ℓ = 2 case of the degree estimate; add it as a Check.

## R09 (P3) — Admitted examples and name catalogues in `Suggested.lean`

**Location.**
- 172 `example`s, 169 of them admitted (gate `sorry-examples`). One of them, at line 3944, is new.
- The comment blocks "The construction targets specified …" (lines 3699–3749) and "The following proposed names belong to those contracts" (lines 3751–3878).

**Claim.** An admitted example tests nothing, and catalogues of names are not allowed in `Suggested.lean`. With 366 declarations, the file is an API catalogue rather than the roadmap's acceptance test.

**Witness.** Gate `sorry-examples` = 169, for example `example : primitiveMinpoly (((2 : ℚ) / 3 : ℚ) : ℝ) = C 3 * X - C 2 := by sorry` at line 152.

**Repair.** Delete the admitted examples (the README keeps them as Checks) and both name-catalogue comments. Then prune the file to the headline theorems and the definitions they need.

## R10 (P3) — Statement hygiene (3 hits)

**Location.** Line 2719: `sUnits_rat_mulEquiv` concludes `Nonempty (… ≃* …)`. Lines 3236 and 3416: `siegel_shidlovskii` and `nishioka` have `letI` in their signatures. Already on main.

**Witness.** Gate `statement-hygiene`. Pinned Tau Ceti already defines this isomorphism as data: `TauCeti.sUnitsRatMulEquiv` (`TauCeti/NumberTheory/NumberField/SUnits/Rat/Structure.lean:196`).

**Repair.** Delete `sUnits_rat_mulEquiv` and cite `TauCeti.sUnitsRatMulEquiv` under "From Tau Ceti" for §4.1. Replace each `letI` with an instance binder or a named instance.

## R11 (P3) — §5.7 restates §3.8's conditional theorems

**Location.**
- `Suggested.lean` line 2378, `Transcendence.SchanuelConjecture.algebraicIndependent_exp_one_pi`, against line 3692, `algebraicIndependent_e_pi_of_schanuel`.
- Line 2382, `SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs`, against line 3696, `logarithmsConjecture_of_schanuel`.
- README §5.7 (lines 4005–4036) against §3.8 (lines 2835–2850).

Already on main.

**Claim.** Each conditional theorem appears twice; the e–π pair differs only in using `Real.exp 1` instead of `exp 1 : ℂ`. The §5.7 Checks repeat those of §3.8, although §5.7 itself says to "use §3.8's theorem through the namespace abbreviation".

**Witness.** Unfolded, `LogarithmsAlgebraicIndependenceConjecture` says: for every ℓ with each `exp ℓᵢ` algebraic, `LinearIndependent ℚ ℓ → AlgebraicIndependent ℚ ℓ`. This is §3.8's statement once `mem_algebraicLogs` is applied.

**Repair.** Delete the §5.7 restatements and the repeated Checks. §5.7 keeps the definition `LogarithmsAlgebraicIndependenceConjecture` and cites §3.8 for the consequences.

## R12 (P3) — §4.3 refers to labels that are never defined

**Location.** README line 2946 ("κ := 2(d − 1)κ(u) (unit-exponent-house-bound)"), line 2950 (`unit-equation-exponent-bound`), line 2960 (`bounded-divisor-representatives`) and line 2968 (`thue-equation-monic-reduction`). Already on main.

**Claim.** These kebab-case labels are defined nowhere in the README.

**Witness.** A search finds each label exactly once: at the place where it is used.

**Repair.** Replace each label with the statement it means:
- `unit-exponent-house-bound`: the κ(u) statement in §4.1 (E19 Lem. 5.9);
- `unit-equation-exponent-bound`: the first statement of §4.3;
- `bounded-divisor-representatives`: `boundedDivisors` in §4.1;
- `thue-equation-monic-reduction`: the monic-reduction statement in §4.3.

## R13 (P3) — Locator and Check slips found in the sample

**Location, witness and repair.**
- **README line 409.** It cites "(E19, ch. 1, Thm. 1.1, Thm. 1.3, pp. 2-3". Theorem 1.1 is on p. 1 (E19 ch. 1, line 17, with the page footer "1" at line 30). Repair: "Thm. 1.1, p. 1; Thm. 1.3, p. 2".
- **README line 1043.** It cites "Lem. 8.5, p. 161". Lemma 8.5 is on p. 160 (E19 ch. 8, line 160, between the footers 159 and 160), which line 1041 already gets right. Repair: p. 160.
- **README line 442.** It cites "Bugeaud, §1, Def. 1.2, p. 3". Definition 1.2 is on p. 2 (Bugeaud line 50). Repair: p. 2.
- **§5.5 Check "For A=(1 − 2z)⁻¹, α=2^{−1/2} is not regular".** This omits q. For q = 3, α^(3^ℓ) = 2^(−3^ℓ/2) is never 1/2, so α is regular. The Lean example (line 3337) fixes q = 2. Repair: add "for q = 2".

## Verified sound

**Gate, rerun on this head.** Every rule passes except: latex 3, tex 299, prnum 1 (R04); sorry-data 1 (R03); sorry-examples 169 (R09); statement-hygiene 3 (R10); dropped 71 (R01); depcheck 2 (R02); readme-ids-missing 9. Build: 0 failures.

The 9 readme-ids-missing hits are false positives. Each is a Mathlib declaration at the pin, written in the README as Mathlib's:
- `Height.mulHeight_zero` (`Mathlib/NumberTheory/Height/Basic.lean:240`)
- `Height.mulHeight_comp_equiv` (`:252`)
- `Finsupp.logHeight_eq_log_mulHeight` (`:296`, declared with `_root_`)
- `Height.hasFiniteMulSupport_iSup_nonarchAbsVal` (`:310`; it is private, as README line 698 says)
- `Height.mulHeight_comp_le` (`:365`)
- `Height.mulHeight_sumElim_zero_eq` (`:390`)
- `Height.mulHeight₁_eq_mulHeight` (`:551`)
- `Height.mulHeight_fun_mul_eq` (`:699`)
- `Height.mulHeight_linearMap_apply_le` (`Mathlib/NumberTheory/Height/MvPolynomial.lean:122`)

**Depcheck output.**
```
UPWARD: DiophantineApproximationAndTranscendence (on main) -> DerivedDeRhamCohomology (#22) at README lines [32, 61, 3789]
UPWARD: DiophantineApproximationAndTranscendence (on main) -> GeometryOfNumbersAndQuadraticArithmetic (#73) at README lines [30, 44, 106, 150, 167, 182]
depcheck: 245 roadmaps, 2479 edges, 2 problem(s)
```
LinearFormsInLogarithms does not appear among the depcheck edges; the gate's `dropped` rule reports it instead (R01).

**Elaboration.** `lake env lean` on `Suggested.lean` takes 24 s. It produces 454 `sorry` warnings and `#check` output, and no other message.

**Signatures.** I added `#check @…` for the eight new declarations to a copy of the file and compared the elaborated types with the README. All eight carry their binders explicitly (`[Field K]`, and `[CharZero K]` where stated); none is lost. The 8 declarations flagged in `signatures.md` (`localWeight`, `weight`, `weightRatio`, `compoundForms`, `compoundVectors`, `compoundDerivativeCoeff`, `IsTwistedData`, `systemExponents`) drop `[NumberField K]`. I read the bodies at lines 1690–1716 and 1868: they use only `Place K` and field operations, which need `[Field K]` alone.

**Headline theorems.** These are stated in `Suggested.lean`: `roth` (911), `roth_lower_bound` (915), `roth_lower_bound_of_isAlgebraic` (920), `thue_equation_finite` (944), `subspace_theorem` (1065), `subspace_theorem_general_position` (1074), the p-adic versions (1089, 1101), `absolutePerturbedUnitEquation` (1327), `skolem_mahler_lech_simple` (1407), `sharp_roths_lemma` (1955), `algebraicIndependent_exp` (2336), the Schanuel consequences (2378, 2382), `siegel_shidlovskii`, `nishioka` (3405) and `ax_schanuel` (3624). I found no statable headline missing.

**Library declarations opened at the pins.**
- Tau Ceti `RingTheory/Polynomial/HasseWronskian.lean`, lines 73, 83, 88, 93, 101, 111, 120, 129, 140, 154, 196 and 235.
- Mathlib `Algebra/Polynomial/Roots.lean:940`; `RingTheory/Polynomial/Wronskian.lean:85` and `:111`.
- Tau Ceti `Algebra/Module/ZLattice/SuccessiveMinima.lean`, lines 111, 447 and 529; `NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`, lines 610 and 717; `Analysis/InnerProductSpace/Gram/Hadamard.lean:115`.
- Tau Ceti `NumberTheory/Transcendental/Lindemann/Theorem.lean`, lines 53 and 85; `GelfondSchneider/Theorem.lean:210`; `NumberField/SUnits/Rat/Structure.lean:196`.
- Mathlib `NumberTheory/Height/Basic.lean`, the nine lines listed above.

**Ownership of the new §1.4 bounds.** Neither pinned library has a natural-degree or root-multiplicity bound for an ℓ-term Wronskian. Mathlib has only the two-term `natDegree_wronskian_lt_add`. ArithmeticInterpolationDeterminants §I0 (the head of its open pull request) consumes this roadmap's §1.4 Wronskians "without another height or Wronskian" and owns the characteristic-p jet comparisons. So the two roadmaps do not both own these bounds.

**Cross-roadmap citations resolved on main.**
- GlobalNumberFields Layer 0 (Completed, line 241).
- IntegralLattices target 0A (line 509) and Layer 2 (line 767). The overlap tool flagged "Layer 0A" as defined only by the open revision of IntegralLattices; that is a false positive, since main has 0A.
- EffectiveBounds Layer 0 (line 94).
- AlgebraicCurves Layer 9 (line 1099).
- ContourIntegration Layers 2 and 3 (lines 158 and 184).
- ReductiveGroups Layers 0, 3 and 4 (lines 129, 234 and 432).
- DifferentialGeometry form and de Rham layers (lines 268 and 782).

The two upward suppliers (R02) and the dropped supplier (R01) are open pull requests. Ownership against the open roadmap pull requests was checked with `roadmaps show` for ArithmeticInterpolationDeterminants and LinearFormsInLogarithms only.

**Sampled locators confirmed.**
- P22: Def. 3.3.1 p. 85; Lem. 3.3.2 and Prop. 3.3.3 p. 86; Remark 3.3.6 and Thm. 3.3.7 p. 87; Lem. 3.3.8 p. 88; Lem. 3.3.9 pp. 88–89; Exercise 3.5 p. 89; (3.16) p. 91; §3.4.6 pp. 92–93; Lem. 3.4.8 p. 94; Exercise 3.7 p. 95.
- E19 ch. 2: Cor. 2.6 p. 20; Cor. 2.7 p. 21; Exercise 2.6 p. 22; Lem. 2.8 pp. 23–24; Thm. 2.9 p. 24; Exercise 2.11 p. 31; Cor. 2.21 p. 33; Thm. 2.22 p. 34.
- E19 ch. 3: Exercise 3.1 p. 41; Lem. 3.6–3.7 p. 42; house p. 52; Lem. 3.19 p. 52; Thm. 3.20 pp. 52–53. E19 ch. 6: Thm. 6.1 p. 107 (proof p. 108).
- E19 ch. 7: Thm. 7.1, Cor. 7.2 p. 138; Lem. 7.3 p. 139; Thm. 7.4 p. 140; Lem. 7.5 p. 141; Lem. 7.6 p. 142; Thm. 7.7 p. 143; Thm. 7.8 p. 144; Thm. 7.9 p. 146; Lem. 7.11 p. 147; Thm. 7.13 p. 149; Thm. 7.14 p. 151.
- E19 ch. 8: Thm. 8.6 p. 161; Thm. 8.7 p. 162; Thm. 8.8 and Lem. 8.9 p. 164; Thm. 8.10 and Lem. 8.11 p. 165; Thm. 8.12 p. 167; Thm. 8.13 p. 168; Thm. 8.14, Lem. 8.15 and Lem. 8.16 pp. 170–171; Thm. 8.18 p. 174.
- E19 ch. 4: Thm. 4.8, Cor. 4.9 and Cor. 4.10 p. 67; Thm. 4.11 p. 68; Lem. 4.12 p. 71; Lem. 4.13–4.15 p. 72; Schanuel and Exercise 4.4 p. 75. E19 ch. 5: Thm. 5.12 p. 94; Thm. 5.13 p. 97.
- ESS02: Thm. 1.1 p. 808; Thm. 1.2 pp. 812–813; Thm. 2.1 p. 815; Lem. 3.1 pp. 815–816; Prop. 11.1, (11.19) and Cor. 11.3 pp. 832–834.
- Others: W00 Lem. 4.8 p. 123 (PDF 143), including the single-polynomial refinement 3^p and (3/R)^p in Step 2.4 (pp. 124–126); Smyth (2) p. 322; Wu Lem. 2.2 p. 3, Lem. 2.5 p. 4, Lem. 3.1 p. 5, Lem. 3.3, Prop. 3.1 and Thm. 3.4 p. 6, Lem. 3.5–3.6 p. 7; Bugeaud Def. 2.1 p. 4, Def. 2.2 p. 5, Thm. 2.5 p. 6; BT Conjecture 1.2.1 and Example 1.2.2 p. 3; Waldschmidt, periods, §7.1 p. 455; AF17 (1.1) and regular points p. 2.

**Statements that go beyond their source and are still true.**
- §0.0's linear-forms theorem with `≥`: E19 Cor. 2.6 assumes strict `>`, but its proof uses "determinant ⩽ 1" (E19 ch. 2, line 313).
- §0.3 Siegel with A ≥ 1: E19 Thm. 3.20 assumes A > 1. The case A = 1 follows by a limit, because only finitely many integer vectors are involved.
- §0.4 Dirichlet with n ≥ 1: E19 Thm. 1.4 assumes n > 1. For n = 1, the box |x−αy| ≤ 1/Q, |y| ≤ Q has area 4.
- §2.4 uses ESS02's budget with 5n: this is what (11.19) actually uses (see Source issues).

### Adversarial table

| Statement | Instance | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `natDegree_add_derivative_orders_le` | g = (1, X, …, X^(ℓ−1)) over ℚ | W = 1 (upper unitriangular, D^l X^l = 1): 0 + ℓ(ℓ−1)/2 ≤ ℓ(ℓ−1)/2 | holds, sharp | none |
| same | g = (1, X^m), m ≥ 1 | W = m X^(m−1): (m−1) + 1 ≤ 0 + m | holds, equality | none |
| same | ℓ = 0 | W = 1: 0 + 0 ≤ 0 | holds | none |
| `natDegree_le_common_cap` | g = (X², X²+1), d = 2 | W = X²·2X − 2X(X²+1) = −2X: 1 ≤ 4 | holds | none |
| same | 𝔽₂, g = (1, X²), d = 2 | W = 0: 0 ≤ 4 | holds (zero W allowed) | none |
| `root_pow_dvd_of_mem_space` | V = span(1, X³) over ℚ, f = X³, a = 0 | exponent (3+1)−2 = 2; W = 3X² | holds, equality | none |
| same, without `CharZero` | 𝔽₂, V = span(1, X²), f = X², a = 0 | exponent 1; W(b) = 0; X ∣ 0 | holds | R07 |
| `rootMultiplicity_lower_bound` | 𝔽₂, same data | (2+1)−2 = 1 against rootMultiplicity 0 0 = 0 | fails, so `CharZero` is needed | none |
| same | ℚ, V = span(1, X, X²), f = X², a = 0 | (2+1)−3 = 0 ≤ mult₀(W = 1) = 0 | holds | none |
| `rootMultiplicity_eq_of_basis_change` | ℚ, b = (1, X²), c = (1+X², X²) | W(b) = 2X; W(c) = (1+X²)·2X − 2X·X² = 2X; both multiplicities 1 | holds | R07 (no `CharZero` needed) |
| `rootMultiplicity_map` | σ: ℚ → ℝ, g = (1, X²), a = 0 | both sides mult₀(2X) = 1; closes by one `rw` | holds | R06 |
| `sum_multiplicity_lower_bounds_le_natDegree` | V = span(1, X³), S = {0, 1}, f₀ = X³, f₁ = X³−1 | (4−2) + (2−2) = 2 ≤ natDegree(3X²) = 2 | holds, equality | none |
| same | S = ∅ | 0 ≤ natDegree W | holds | none |
| example W(1, X^m) | m = 1; m = 3 | W = 1, mult₀ = 0 = 1−1; W = 3X², mult₀ = 2 | holds | R06 (admitted) |
| §1.4 Checks | W(1, X, X²) over ℚ | [[1,X,X²],[0,1,2X],[0,0,1]] has det 1; the classical determinant is 1·1·2 = 2 | holds | none |
| same | ℤ/4ℤ, singleton (2) | 2·2 = 0 so the family is dependent; W = 2 ≠ 0 | holds | none |
| §0.0 minima | ℤ², B = [−2,2]×[−1,1] | (1,0) ∈ λB iff λ ≥ 1/2; (0,1) iff λ ≥ 1: λ = (1/2, 1) | holds | none |
| §0.0 Minkowski II | ℤ², B = [−4,4]×[−1,1] | vol 16 · (1/4)·1 = 4 = 2²; 16·(1/4)² = 1 < 2 = 2²/2! | holds | none |
| §0.0 Gram | rows (1,0), (1,1) | det 1; Gram [[1,1],[1,2]] has det 1; ∏‖v‖² = 2 | holds | none |
| §0.1 `primitiveMinpoly` | x = (1+2√3)/5 | (5x−1)² = 12 ⇒ 25x²−10x−11 = 0, gcd 1; H = 25 | holds | none |
| §0.1 `naiveHeight` vs Weil | √2 | H_naive = 2; M = 2, H_abs = 2^(1/2) = √2 | holds | none |
| §0.2 Mahler / house | 1/2, φ, (1−√5)/2 | M(1/2) = 2·1 = 2; M(φ) = φ·1 = φ; house((1−√5)/2) = φ | holds | none |
| §0.2 `prod_infinitePlace_comap_pow_mult` | ℚ(2^(1/3))/ℚ | m = 1 + 2 = 3 = [L:ℚ], with 2 places | holds | none |
| §0.2 `absMulHeight₁_eq` | √2 in ℚ(√2), ℚ(√2, i) | 2^(1/2) = 4^(1/4) = √2 | holds | none |
| §0.3 central binomial | k = 2, 5 | 2√3 ≈ 3.46 ≤ 4, but 2·3 = 6 > 4; 10√6 ≈ 24.5 ≤ 32 | holds | none |
| §0.3 Northcott count | d = 1, B = 1 | set {−1, 0, 1} (3 elements) ≤ 1·3² = 9 | holds | none |
| §2.1 general position | rows (1,√2,√3), (1,−√2,√3), (1,−√2,−√3) | det = 2√6 + 2√6 = 4√6; swapping rows 2 and 3 gives −4√6 (line 1067) | holds | none |
| §2.1 Lem. 7.6 constant | Minkowski with Q | ‖x‖ ≤ nQ ⇒ \|L\| ≤ \|αₙ\|Q^(1−n) ≤ \|αₙ\|n^(n−1)‖x‖^(1−n) | holds | none |
| §2.1 Thm. 7.7 with dependent α | α = (1, √2, 1+√2) | reduces to 2 variables, with exponent −1−δ′ > −2−δ | holds (no independence needed; E19 has none) | none |
| §2.4 affine height | (1/3, 1/3); z_k | log H(3,1,1) = log 3; h_aff(z_k) = log(2^k+1), projective height 0 | holds | none |
| §2.4 budget | n = 2 | 4n: (1+8 log 2)e^(−8⁶) ≈ 6.5 q₀⁻¹ > q₀⁻¹/2; 5n: 6.5e^(−10⁶) < e^(−262144)/2 | README right, ESS02 has a gap | Source issues |
| §2.4 n ≥ 3 | Γ = ⟨2⟩, x₁ − x₂ = 0 | (2^k, 2^k) fill the 1-dimensional hyperplane | holds | none |
| §2.4 `IsNondegenerate` | coefficients ![−1, 0] | charPoly X² + 1, roots ±i, ratio −1 of order 2 | degenerate, as stated | none |
| §2.6 H₂ | (2,4,4); (1,2,2) | 6·(1/2) = 3; 3 ≤ H₂(1,2)² = 5 | holds | none |
| §2.6 grid jet | P = (X₀³−X₀)X₁², d = (1,2) | (3·0 − 1)·1 = −1; 1 ≤ 3, 2 ≤ 4 | holds | none |
| §2.7 jet formula | f = y² − y, d = 2, a = 1, κ = 1 | γ = 1 term: 1·(−1)·1 = −1 = ∂F/∂X₀(1,1) | holds; E95 printed range fails | Source issues |
| §3.2 `auxPoly` | S = {0,1}, l = 1, p = 2, γ = 0 | X(X−1)² = X³ − 2X² + X; degree tp − 1 = 3 | holds | none |
| §3.2 `auxValue` | single 0 1 | f^(p−1)(0) = l^p ⇒ −l^p | holds | none |
| §3.4 `mDeriv` | z₀²z₁³, σ = (2,3) | 2!·3! = 12; Taylor coefficient 1 | holds | none |
| §3.8 Schanuel ⇒ e, π | (1, iπ) | trdeg ℚ(iπ, e) ≥ 2 | holds | R11 (stated twice) |
| §5.5 continuation | f = 1/(1−2z), α = 3/4 | value −2; terms (3/2)^m not summable | holds | none |
| §5.5 regular point | A = (1−2z)⁻¹, α = 2^(−1/2) | q = 2: α² = 1/2 is a pole; q = 3: never 1/2 | depends on q | R13 |
| `roth_lower_bound_of_isAlgebraic` | α = 1/3 | \|ξ−1/3\| ≥ 1/(3H(ξ)) ≥ cH^(−κ) for κ > 2 | holds | none |
| `subspace_theorem` | x = 0 | ‖x‖^(−δ) = 0 in Lean, 0 ≤ 0; 0 lies in any V, and T = {⊥} works | holds | none |
| `finite_zeros_simple_exponential_polynomial` | m = 1 | g₀θ₀^h ≠ 0, so the zero set is empty | holds | none |

## Not verifiable

- **E95 at journal pp. 221–222.** I read only the author's preprint (p. 8). The correspondence with the journal pages is not checked.
- **Not opened in this review:** EF13, ES02, E96, Yang, B08, B06, AF22, Nishioka (LNM 1631, paywalled), Matveev, LMN95, BG06, Yu 1990/1994, BEG13, Tzanakis–de Weger, Kirby, Fonseca, Philippon and Roy–Thunder. No sampled target relies only on these.
- **§2.6–§2.7 targets citing E96 and EF13.** I checked their Checks by computation, not their locators.

## Source issues

- **Gap** in ESS02 at §11, (11.19), p. 834: the source says the perturbation hypothesis (6.3), with factor exp(−(4n)^(3n)), yields the small-solution bound (11.19), which uses exp(−(5n)^(3n)); with 4n the sum exceeds q₀(n)⁻¹, and (11.7) gives only ≤; it should assume the budget n⁻¹exp(−(5n)^(3n))(1+h(x)) in (6.3) and Theorem 2.1; affects a stated result.
- **Error** in E95 at §1, preprint p. 8: the source says each derivative F_i of the multihomogenization is a combination of affine derivatives f_k with k_hj ≤ i_hj; it should allow affine orders increased by i_h0, since Euler's identity trades each X_h0-derivative for Y-derivatives (F = Y²−X₀Y: ∂F/∂X₀(1,1) = −1, f(1) = 0); affects the proof.
- **Misprint** in Wu at §2, Lemma 2.5, p. 4: the source says the height is independent of the choice of coordinates, but its proof shows independence of the number field; it should say independent of the number field containing the coordinates; affects nothing.
