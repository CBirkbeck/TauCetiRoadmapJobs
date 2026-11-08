# Review of ImaginaryQuadraticClassNumber (pull request #1914 at 1513bb4)

**Verdict:** needs changes

This pull request revises the roadmap on main, and the whole folder was reviewed again (the folder changed by 269 lines since bcfb44a). The gate passes and `Suggested.lean` elaborates with six `sorry` warnings and nothing else. All six findings are P3 and none blocks. Four of them come from the "Already in the pinned Tau Ceti" repair being incomplete: the pin proves more of H1–H2 than the list names, and two citations are now stale. The other two are cross-roadmap bookkeeping: R04, unnamed downstream owners, and R05, deleted Lean names that EffectiveClassNumbers still cites.

## Previous review (bcfb44a), finding by finding

| id | status at 1513bb4 | evidence |
|---|---|---|
| R01 (P1) supply cycle | repaired | line 17: "H2.3–H2.4 state and prove the classical ineffective form of Siegel's theorem … Their effective forms are not stated here." `Suggested.lean` lines 34–58 are identical to main lines 56–75. AnalyticNumberTheoryPartI takes only H2.2 from this roadmap, so the cycle is gone. The wording that remains is R04 below. |
| R02 (P2) two owners of the effective statements | repaired | No effective statement is left in the folder. AnalyticNumberTheoryPartI §0.9 and EffectiveClassNumbers §§4.8–4.9 own the effective forms. |
| R03 (P2) `cmTau` sorry'd data | repaired | `Suggested.lean` has no `def`; gate `sorry-data=0`. |
| R04 (P2) certified procedures | repaired | H1.3 (line 52) now cites the pinned reduced-form count. H3.5 (line 143) says the quartic is solved "by an algebraic descent … with no effective height bound, interval reduction". |
| R05 (P3) PR numbers and process text | repaired | gate `prnum=0`; line 9 now cites `QuadraticAlgebra.isField_iff_not_isSquare_discr`. |
| R06 (P3) padding | repaired | Six theorems, no definitions; the thirteen orders are stated as `pic_eq_one_iff_discr_mem`. Deleting the padding dropped two names that EffectiveClassNumbers cites: R05 below. |
| R07 (P3) pinned results planned as targets | partly | Lines 19–30 now list 66 pinned declarations. The pin proves more of H1.1–H1.3, H2.2–H2.3 and H3.4 than the list names: R01–R03 below. |
| R08 (P3) effectivity overclaim | repaired | The claim and its two sources are gone; Davenport is cited by Chapters 6 and 21. |
| R09 (P3) broken link | repaired | `../../Completed/NumberFieldArithmetic/README.md` resolves on main. |

## R01 (P3) — H1.1–H1.3 still set as targets what the pin already proves

Location: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md`
- line 40: "Construct the two complex embeddings for d<0, identify conjugation, and prove the signature is(0,1) … Prove K_d≃_Q K_e iff d=e"
- line 44: "Supply explicit coordinate ring equivalences … Supply the prime-factorization and norm interfaces"
- line 46: "Specialize the native Dedekind equivalences"
- line 54: "prove the principal form corresponds to the trivial class, that composition of classes is the group law of Pic"

Claim: these are written as targets ("Construct", "Prove", "Supply"), but each is a theorem at the pins. The "Already in the pinned Tau Ceti" list (lines 19–30) names none of them, so this is the defect of the previous R07, left in place for H1. This roadmap's own STATUS.md on main already reports H1.1 as largely done, with the same declarations.

Witness: Mathlib `QuadraticAlgebra.Rat.nonempty_algEquiv_iff` (`Mathlib/Algebra/QuadraticAlgebra/Rat.lean:48`). Tau Ceti `QuadraticAlgebra.ringHom_eq_or_eq_conjugate` (`NumberField/Quadratic/ComplexEmbedding.lean:165`), `QuadraticAlgebra.ringOfIntegersEquiv` (`Model.lean:121`), `isPrime_and_natCast_mem_iff_of_mod_four_ne_one` (`PrimeDecomposition.lean:183`), `posDefProperClassToPic_mk_mul_of_united` (`BinaryQuadraticForm/Ideal/Composition.lean:192`).

Repair: add H1.1–H1.3 bullets to the list. Every name below was elaborated at the pins; Tau Ceti paths are under `TauCeti/NumberTheory/`.
- H1.1:
  - Mathlib `QuadraticAlgebra.Rat.nonempty_algEquiv_iff`: for squarefree d and e, ℚ(√d) ≅ ℚ(√e) iff d = e.
  - Mathlib `QuadraticAlgebra.nonempty_algEquiv_iff` (`Discriminant.lean:161`): with b = b′ = 0 over ℚ, the two algebras are isomorphic iff a = u²a′. This is the ℚ×/(ℚ×)² criterion.
  - `NumberField.nonempty_algEquiv_iff_of_squarefree` (`NumberField/Quadratic/Radicand.lean:65`) and `NumberField.existsUnique_neg_squarefree_algEquiv` (`Radicand.lean:105`).
  - `QuadraticAlgebra.complexEmbedding`, `ringHom_eq_or_eq_conjugate`, `isConj_complexEmbedding` and `nrComplexPlaces_eq_one` (`ComplexEmbedding.lean`, lines 72, 165, 176, 198).
- H1.2:
  - In `NumberField/Quadratic/Model.lean`: `QuadraticAlgebra.ringOfIntegersEquiv` (121), `ringOfIntegersEquivHalf` (259), `isIntegral_iff_of_mod_four_ne_one` (159), `norm_ringOfIntegersEquiv_symm` (173), `complexEmbedding_ringOfIntegersEquiv_symm` (186) and `discr_eq_four_mul_of_mod_four_ne_one` (193), with their `_eq_one` and `Half` companions.
  - In `PrimeDecomposition.lean`: `QuadraticAlgebra.isPrime_and_natCast_mem_iff_of_mod_four_ne_one` (183) and `span_natCast_integralSqrt_sub_sq_eq_iff` (219).
  - `QuadraticAlgebra.natCard_classGroup_eq_classNumber_of_mod_four_ne_one` and `classNumber_eq_one_iff_isPrincipalIdealRing_of_mod_four_ne_one` (`NumberField/Quadratic/ClassNumber.lean`, lines 63 and 84), with their companions.
  - `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid` (`NumberField/ClassNumber/RingEquiv.lean:143`).
- H1.3, all in the namespace `TauCeti.BinaryQuadraticForm`: `picClass_principalForm` (`Ideal/Composition.lean:176`), `posDefProperClassToPic_mk_mul_of_united` (192), `exists_posDefProperClassToPic_mul_posDefProperClassToPic_eq` (206), `picClass_reflected` (`Ideal/Reflection.lean:146`) and `posDefProperClassToPic_mk_eq_inv_of_eq_reflected` (231).

Then rewrite each "Construct/Prove/Supply" sentence as "What remains here is …", naming only what these declarations do not cover. On a reading of their headers, that is:
- H1.1: the values of the model equivalences on the generator, and their naturality under composition, inverse and conjugation of the embedding.
- H1.2: the exceptional unit generators in model coordinates.
- H1.3: the comparison with the embeddings and CM points, and naturality under a change of oriented basis.

## R02 (P3) — H2.2 and H2.3 set as targets what the pin already proves

Location: `README.md`
- line 78: "What remains here is the real form of the formula: prove that the continued value L(1,χ_D) is real and positive for every negative fundamental D"
- line 82: "The product ζ(s)L(s,χ)L(s,ψ)L(s,χψ) has nonnegative Dirichlet coefficients; prove this prime by prime … pole residues"
- line 84: "Treat equality of the two characters separately"

Claim: positivity of L(1,χ) for every nontrivial quadratic χ is pinned. So are the four-factor coefficient positivity, the pole orders and residues in both the simple-pole and double-pole (equal-character) cases, and Landau's theorem. The list names none of them, and H2.2's only "remaining" item is already proved.

Witness: Tau Ceti `DirichletCharacter.LFunction_apply_one_pos` (`LSeries/Quadratic/Character.lean:88`: `0 < LFunction χ 1` for quadratic `χ ≠ 1`), `zetaMulPairCoeffs_nonneg` (`LSeries/Quadratic/Pair/Basic.lean:138`), `meromorphicOrderAt_pair_eq_neg_two` and `residue_pair_mul_of_mul_eq_one` (`Pair/Residue.lean:110, 141`).

Repair:
- Add an H2.2–H2.3 bullet to the list naming the following, all in the namespace `DirichletCharacter`:
  - `LFunction_apply_one_pos` and `LFunction_pos_of_one_le` (`Character.lean:100`);
  - `zetaMulPairCoeffs_nonneg` and `LSeriesHasSum_zetaMulPairCoeffs` (`Pair/Basic.lean:150`);
  - `meromorphicOrderAt_pair_eq_neg_one` and `meromorphicOrderAt_pair_eq_neg_two` (`Pair/Residue.lean:96, 110`);
  - `residue_pair_mul_of_mul_ne_one` and `residue_pair_mul_of_mul_eq_one` (`Pair/Residue.lean:124, 141`).

  Add `TauCeti.LSeries.landau` (`LSeries/Landau.lean:296`) to the same bullet.
- H2.2's remaining item becomes the specialisation to χ_D (through `fundamentalDiscriminantChar_isQuadratic` and `ringHomComp_fundamentalDiscriminantChar_discr_ne_one`) and the export of L(1,χ_D) = 2πh/(w√|D|) and h ≥ √|D|·L(1,χ_D)/π.
- In H2.3, keep as targets the Mellin/contour estimates, the zero-free alternative and the conductor comparison. The pinned product uses `χ.mul ψ` at level lcm(M,N), which is imprimitive there, so "after removal of imprimitive Euler factors" still needs a target.

## R03 (P3) — H3.4's level-two exclusion cites a bound that does not cover D ≡ 0 mod 4

Location: `README.md` line 133: "the certified numerical consequences |g0(τ)|<1 for Im τ≥√31/2 … For D≤−31 and2 not inert, the nonzero integer norm x of H3.3 is a product of twelfth powers of such values at τ_D"

Claim: for D ≡ 0 mod 4, |x|^(1/12) = |g₀(τ_D)·g_(1/2,b)(τ_D)|, with b = 1/2 when D ≡ 0 mod 8 and b = 0 when D ≡ 4 mod 8 (shin2010 (19), lines 895–911). The bound on the second factor exceeds 1, so the cited |g₀| < 1 and the level-three estimate do not give |x| < 1 in this branch. The pinned estimate that does is not cited.

Witness: at A = e^(−π√31), the bound on |g_(1/2,b)| alone is A^(−1/24)e^(2√A/(1−A)) = 2.073; the product bound is 0.965 (shin2010 lines 1176–1196). Pinned: `TauCeti.ModularForm.norm_siegelFunction_zero_half_mul_lt_one` (`ModularForms/SiegelFunction/ClassNumberOne.lean:167`).

Repair:
- Add `norm_siegelFunction_zero_half_mul_lt_one`, `level_two_bound_lt_one` (line 58) and `level_three_bound_lt_one` (line 97) to the H3.4 bullet (line 28).
- In line 133, state the identity branch by branch:
  - D ≡ 1 mod 8: x^(1/12) = |g₀(τ_D)|, bounded by `norm_siegelFunction_zero_half_lt_one`;
  - D ≡ 0 mod 8: x^(1/12) = |g₀ g_(1/2,1/2)(τ_D)|, bounded by `norm_siegelFunction_zero_half_mul_lt_one`;
  - D ≡ 4 mod 8: x^(1/12) = |g₀ g_(1/2,0)(τ_D)|, bounded by `norm_siegelFunction_zero_half_mul_lt_one`.

## R04 (P3) — The effective forms' owners are not named, and AnalyticNumberTheoryPartI is said to consume H2.4

Location: `README.md` line 17: "a headline of the first part of the analytic number theory roadmaps; … the effective-finiteness layer of this roadmap's Part II on effective class numbers. Both … consume the class-number formula of H2.2 and the statements of H2.4"

Claim: there are three problems.
- Two cross-roadmap references give neither a roadmap name nor a section.
- "Both … consume … the statements of H2.4" is false for AnalyticNumberTheoryPartI.
- The README has no Downstream consumers section, although at least six open roadmaps cite its H-sections.

Witness: AnalyticNumberTheoryPartI at its head, README line 70: "Nothing from H2.3–H2.4 is consumed"; line 14: it "takes nothing from H2.3–H2.4". EffectiveClassNumbers at ba3ce95, README lines 1011–1027 (§§4.8–4.9).

Repair:
- Replace the two sentences with: "Their effective forms are AnalyticNumberTheoryPartI §0.9 (L(1,χ) ≥ c/log q, derived there from the uniform exclusion of Landau–Siegel zeros, §0.34) and EffectiveClassNumbers §§4.8–4.9 (h(D) ≥ (c₀/π)√|D|/log|D| with computable cutoffs, and the effective form of `imaginary_classNumber_lower_bound`). Both are downstream consumers."
- Add `## Downstream consumers` before References, with one bullet per consumer:
  - AnalyticNumberTheoryPartI: H2.2 only.
  - EffectiveClassNumbers: H1.1–H1.3, H2.1–H2.2, the statements of H2.4, and H3.1.
  - ComplexMultiplicationAndExplicitReciprocity and ArithmeticStatisticsPartVII: H3.1.
  - OrthogonalTamagawaAndLatticeMass: H1.4 and H2.2.
  - EulerSystemsAndKolyvaginSystems: H1.4.
  - GrossZagierAndArithmeticHeights: H1.2 and H1.4.
  - EllipticModularityEffectiveComparisons: H1.1–H1.4, H3.2 and H3.5–H3.6.

Tested: I ran the dependency check on a scratch copy with both edits. It printed `depcheck: 237 roadmaps, 2433 edges, 0 problem(s)`, the same as at this head, so naming the two roadmaps creates no supplier edge.

## R05 (P3) — Two Lean names deleted here are still cited by EffectiveClassNumbers

Location: `Suggested.lean` on main declared `exists_negative_squarefree_presentation` (line 44) and `classNumber_congr` (line 51). At this head both are deleted, and the README records no replacement.

Claim: an id this pull request drops is cited by another roadmap, with no old → new mapping. Those citations break when this merges.

Witness: EffectiveClassNumbers README at ba3ce95, line 98: "H1.1 supplies `exists_negative_squarefree_presentation` … H1.2 supplies … class-number transports (`classNumber_congr`)". Lines 35 and 175 cite the first name.

Repair: record one line per name in the H1.1 and H1.2 bullets of the list:
- the former target exists_negative_squarefree_presentation is now `NumberField.exists_minpoly_eq_X_sq_sub_C_and_adjoin_eq_top_of_isTotallyComplex` (the same statement with the existentials reordered);
- the former classNumber_congr is now `RingEquiv.classNumber_eq` (apply it to `e.toRingEquiv`).

Alternatively, change EffectiveClassNumbers lines 35, 98 and 175 to the pinned names first, and give that merge order in this pull request's description.

## R06 (P3) — Locator and consistency slips

Location and witness:
- (a) Line 24: "in the namespace `TauCeti.GlobalNumberFields.NumberFieldOrder`, `intAddMulOrder`". `#check @TauCeti.GlobalNumberFields.NumberFieldOrder.intAddMulOrder` gives "Unknown constant". The declaration is at `NumberField/Global/Orders/IntAddMulOrder.lean:86`, inside `namespace TauCeti.GlobalNumberFields` (line 66). The other thirteen names in that bullet are in `NumberFieldOrder`.
- (b) Line 178 says "The cubic coefficient computation and every cited CM comparison remain targets above". Line 145 says the computation is the pinned `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff`.
- (c) Line 178 cites "(19)–(20)" for H3.3's claims that x is nonzero, real and integral, generates H_K, and divides 2¹². These equations sit inside the proof of shin2010 Theorem 4.6 (line 849, pp. 13–14: K ≠ ℚ(√−3), ℚ(i) and 2 not inert), which is the stated result.
- (d) Line 13 links to `#layer-11-the-eichler–selberg-trace-formula-level-one`. GitHub drops the en dash from heading anchors, so the anchor of ModularForms README line 1204 is `#layer-11-the-eichlerselberg-trace-formula-level-one`.

Repair:
- (a) Write "`TauCeti.GlobalNumberFields.intAddMulOrder` (the order ℤ+f𝓞_K) and, in the namespace `TauCeti.GlobalNumberFields.NumberFieldOrder`, …".
- (b) Write "The cubic coefficient computation is the pinned `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff`; every cited CM comparison remains a target above".
- (c) Add "Theorem 4.6" to the Shin locators.
- (d) Use the anchor without the dash.

## Verified sound

**Gate and build.** I re-ran the gate on this head. It printed `set_option=0 … prnum=0 sorry-data=0 … depcheck=0 … stray-files=0 … OK`, matching the worker's line, which also has `build=0`. `lake env lean TauCetiRoadmap/ImaginaryQuadraticClassNumber/Suggested.lean` at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9) gives six `declaration uses sorry` warnings (lines 34, 44, 54, 68, 78, 90), no error, in 6 s. The worker's signature listing has two extra entries (a `class number` at line 65 and "Unknown identifier …number"). Both come from the extraction tool misreading the docstring words "class number one"; neither is in the file.

**Dependency check.** `depcheck: 237 roadmaps, 2433 edges, 0 problem(s)`. ImaginaryQuadraticClassNumber is on main and not in ORDER.txt. Its suppliers are all on main: GlobalNumberFields and NumberFieldArithmetic (Completed), ClassFieldTheory, ModularForms, ModularCurves, EllipticCurves and ArithmeticDirichletSeries (Completed). The README cites no open roadmap.

**Signatures.** I ran `#check @` on all six declarations and compared each with its README statement:
- `quadratic_LFunction_siegel` quantifies ∃c > 0 before every q, `[NeZero q]` and χ, with `IsPrimitive`, `IsQuadratic` and `χ ≠ 1`.
- In both class-number bounds, ∃c (or ∃C) precedes ∀L.
- The three H3.6 theorems carry `[NumberField.IsTotallyComplex K]` and `finrank ℚ K = 2` explicitly.

No binder is lost, and the generality matches the README.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | exact?`. All six failed (`exact?` could not close the goal), in 2 min 24 s. There is no padding. The forward direction of the class-number-one theorem is not at the pin: the only pinned results are the easy half `TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants` and the range −51 < D, `classNumber_eq_one_iff_of_neg_fifty_one_lt_discr`. Neither pin has Siegel's theorem on L(1,χ); Mathlib's "Siegel" files are Siegel's lemma, Riemann–Siegel and Thue–Siegel–Roth.

**Seeded sample: "Already in the pinned Tau Ceti".** I elaborated with `#check @` all 66 declarations named in lines 21–30 (plus the three named in line 9 and `TauCeti.heegnerGamma` in line 145). Twelve pinned modules whose object files were missing were built first with `lake build <module>`. Each has the hypotheses and conclusion the README gives. Some examples:
- units 4, 6, 2 by `discr K = -4, -3`, otherwise 2;
- `classNumber_eq_card_units_mul_LFunction_one`: h = w·√|D|·L(1,χ_D)/(2π);
- `card_pic_intAddMulOrder_eq_one_iff`: the four (D,f) cases, with `discr K % 8 = 1` (emod, so −7 qualifies);
- `norm_siegelFunction_le_of_le_half` assumes only `r 0 ≤ 1/2`, which is weaker than the README's 0 < a ≤ 1/2;
- `mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq`: the six values;
- `heegnerNumbers = {1,2,3,7,11,19,43,67,163}` and `heegnerDiscriminants = {3,4,7,8,11,19,43,67,163}`, both `Finset ℕ`;
- `PosDefProperClass` is restricted to primitive forms (`BinaryQuadraticForm/Content.lean:329`).

The one wrong locator is R06(a). I also elaborated the further pinned declarations named in R01–R03, about 30 in all.

**Cross-roadmap citations resolved.**
- On main (7e2fae4):
  - GlobalNumberFields Layer 11 (Completed README line 571; the anchor `#layer-11-orders-and-picard-groups` matches);
  - ClassFieldTheory Layers 10–13 (README lines 1552, 1683, 1724, 1799);
  - ModularForms Layer 11 (line 1204);
  - ZerosOfLFunctions excludes Siegel's theorem (lines 82–83), so there is no second owner there.
- At open heads:
  - AnalyticNumberTheoryPartI: lines 14, 68–70, 288–297, 830 and 3173 agree with the restored ineffective H2.3–H2.4, apart from R04.
  - EffectiveClassNumbers (ba3ce95): lines 22, 98 and 1011–1027 consume H2.4's statements and prove the effective forms.
- `roadmaps grep` over main and all 471 open heads:
  - for the dropped names: only EffectiveClassNumbers (R05);
  - for owners of Siegel's theorem and of the class-number-one theorem: no second owner; AnalyticNumberTheoryPartI's effective §0.9 is acknowledged on both sides;
  - the section ids of this roadmap (H1.1–H3.6) are all kept. They are cited by EffectiveClassNumbers, ComplexMultiplicationAndExplicitReciprocity, GrossZagierAndArithmeticHeights, EulerSystemsAndKolyvaginSystems, EllipticModularityEffectiveComparisons, OrthogonalTamagawaAndLatticeMass, ArithmeticStatisticsPartVII and others.
- The ClassFieldTheory targets the README routes through (Hilbert, ray and ring class fields) are partly delivered at the pin (`TauCeti.ClassFieldTheory.ringClassArtinEquiv`, `rayClassArtinEquiv`, `finrank_rayClassField`, `isArithFrobAt_ringClassArtinEquiv_picClass`) under that roadmap's ownership. Citing the roadmap is correct.

**Sources.** shin2010 (arXiv 1009.2253v6; PDF page = printed page):
- Lemma 4.1 (line 699, p. 12): g₀g₁g₂ = 2ζ₈ and γ₂ = (g^12+16)/g^4.
- Theorem 4.6 (line 849, pp. 13–14).
- (19)–(20) (lines 895–917, p. 14), including x | 2¹² (line 920).
- Theorem 4.8 (line 957, p. 15): 2 inert and 3 unramified, which matches the H3.3 hypotheses.
- Table 1 (lines 1114–1118, p. 17).
- Lemma 5.1 (line 1121, p. 17): 0 < a ≤ 1/2 and 0 < b < 1.
- Theorem 5.2 (lines 1159–1242, pp. 18–19): the −31 and −51 thresholds and D ≡ 21 mod 24.

**Adversarial table.**

| # | statement | instances | values computed | result / change |
|---|---|---|---|---|
| 1 | `quadratic_LFunction_siegel` (Lean 34) | q = 1, 2; χ₋₃; χ₋₄; χ₅ (even); ε = 0.1 | q ≤ 2: only χ = 1, which `χ ≠ 1` excludes. Bounds on c: L(1,χ₋₃) = π/(3√3) = 0.6046 gives c ≤ 0.675; L(1,χ₋₄) = 0.7854 gives c ≤ 0.902; L(1,χ₅) = 2 log φ/√5 = 0.4304 gives c ≤ 0.506 | True; the Check on line 171 holds (c ≤ 0.6046·3^ε). Primitivity is not needed for truth (the imprimitive factor ≥ ∏(1−1/p)); a note, not a finding |
| 2 | `imaginary_classNumber_lower_bound` (Lean 44) | D = −3, −4, −163; ε = 0.1, 0.25; ε ≥ 1/2 | c ≤ 3^(ε−1/2) = 0.644; c ≤ 4^(ε−1/2) = 0.574; 163^(ε−1/2) = 0.130 (ε = 0.1) and 0.280 (ε = 0.25); for ε ≥ 1/2 the exponent is ≤ 0 | Consistent with line 171; ∃c precedes ∀L |
| 3 | `imaginary_discr_bounded_of_classNumber_le` (Lean 54) | B = 0, 1; ε = 1/4 | h ≥ 1, so B = 0 is vacuous; B = 1 forces C ≥ 163; C_B = (B/c)⁴ from c·\|D\|^(1/4) ≤ B | True; matches line 172 |
| 4 | `classNumber_eq_one_iff_discr_mem` (Lean 68) | D = −43, −20, −15, −23 | h(−43) = 1 by the pinned easy half; h = 2, 2, 3 for the others (−20 from `classNumber_neg_twenty_eq_two`); none of 20, 15, 23 is in the set | Consistent |
| 5 | `classNumber_eq_one_iff_negative_squarefree_mem` (Lean 78) | d = −1, −3, −5, and θ = 2i (d = −4) | ℚ(i): 1 ∈ set; √−3 ∈ 𝓞: 3 ∈ set; ℚ(√−5): h = 2, 5 ∉ set; d = −4 is excluded by `Squarefree` (without it the iff fails, since 4 ∉ set and h = 1) | `Squarefree` is needed; `hgen` is implied by degree 2 (note only) |
| 6 | `pic_eq_one_iff_discr_mem` (Lean 90) | (D,f) = (−3,2), (−3,3), (−4,2), (−7,2), (−8,2), (−11,2), (−4,4) | #Pic·[unit index] = h·∏p^(v−1)(p−χ(p)): 3/3 = 1, 3/3 = 1, 2/2 = 1, 1/1 = 1, 2, 3, 4/2 = 2 | −12, −27, −16 and −28 are added; −32, −44, −64 (and the maximal −20) are excluded |
| 7 | H1.2 units (pinned) | D = −4, −3, −20 | 4, 6, 2 | Matches line 44 and Check 166 |
| 8 | H1.3 reduced-form count (pinned) | n = 20, 44, 12 | (1,0,5), (2,2,3) give 2; (1,0,11), (3,±2,4) give 3 ((2,2,6) is imprimitive); (1,0,3) gives 1 ((2,2,2) is imprimitive) | Agrees with h(−20) = 2 and with Check 170 (−44 gives 3, −12 gives 1) |
| 9 | H2.1 splitting (pinned) | χ₋₄(2), χ₋₇(2), χ₋₁₁(2), χ₋₈(−1) | 0, 1 (−7 ≡ 1 mod 8), −1 (−11 ≡ 5 mod 8), sign(−8) = −1 | Consistent with the inert/split hypotheses of H3.3–H3.4 |
| 10 | H2.2 formula (pinned; R02) | D = −3, −4, −7 | L = 2πh/(w√\|D\|) = 0.6046, 0.7854, π/√7 = 1.1874 | Check 171 is correct |
| 11 | H2.3 four-factor product (pinned; R02) | χ₋₄, χ₋₃ at p = 2; ψ = χ | Factor at 2: (1−2^(−s))⁻¹(1+2^(−s))⁻¹ = (1−4^(−s))⁻¹, coefficients ≥ 0; for ψ = χ, χ·χ is principal, so the order is −2 | "Treat equality separately" is the pinned double pole |
| 12 | H3.2 display vs pinned g₀ | r = (0, 1/2) | −e^(πiτ/6)·e^(−πi/2)·2·∏(1+qⁿ)² = 2i·e^(πiτ/6)∏(1+qⁿ)² = 2i(η(2τ)/η(τ))² | Agrees with `siegelFunction_zero_half_eq_eta` |
| 13 | g₀g₁g₂ = 2ζ₈ | τ = i√2, through the pinned eta quotients | 1.414214 + 1.414214i = 2e^(2πi/8) | Agrees |
| 14 | H3.3, (19)–(20) | D = −8 (x = g₀¹²g₂¹² at i√2); D = −7 (x = g₀¹² at (3+i√7)/2) | x = −64.000 and (256−x)³/x² = 8000 = j(√−2); x = −1.000 and (x+16)³/x = −3375 | Formulas hold and x divides 2¹² |
| 15 | H3.4 level two (R03) | A = e^(−π√31) = 2.53·10⁻⁸ | Bound for \|g₀\|: 0.466; for \|g_(1/2,b)\|: 2.073; for the product: 0.9653 | Only the product bound closes D ≡ 0 mod 4 |
| 16 | H3.4 level three | A = e^(−π√51) = 1.80·10⁻¹⁰; D ≡ 21 mod 24 in (−51, −7] | √3·A^(1/36)·e^((2A+4A^(1/3))/(1−A)) = 0.9309; the only candidate, −27, is not fundamental | Consistent |
| 17 | H3.5 quartic and γ (pinned) | the six points; u = −2, 3 | `heegnerGamma`: (−1,0) → −96, (0,0) → 0, (1,2) → −32, (1,−2) → −5280, (2,6) → −960, (2,−6) → −640320; at u = −2, 3 the right side is 28, 168 (not squares) | Matches line 147 |
| 18 | Check 169 | X³−2; X³+2X²+4X+2 | (0,0,−2) gives u = y = 0, γ = 0 and X³−16. For (2,4,2), u = −1, y = 0, γ = −96; directly, Σα⁴ = 0, e₂(α⁴) = 16·Σα⁻⁴ = 16·6 = 96, ∏α⁴ = 16, so X³+96X−16 | True |
| 19 | H3.6 six values of γ₂ | τ_D = (3+i√\|D\|)/2, γ₂ = (g₀¹²+16)/g₀⁴ | −32.000, −96.000, −960.00, −5280.0, −640320.0 for D = −11, −19, −43, −67, −163 | Matches shin2010 line 1117 |
| 20 | H3.1 τ_D polynomial | D = −7, −8 | X²−3X+4 (B = −3, C = (9−D)/4); X²+2 (B = 0) | Matches line 102 |
| 21 | Right action (line 32) | pinned `siegelFunction_apply_add_one` | g_r(τ+1) = e^(πi/6)·g_(r₀, r₀+r₁)(τ), i.e. r·[[1,1],[0,1]] | The row vector acts on the right |
| 22 | Radicand ↔ discriminant (line 7) | d = −1, −2, −3, −7, −163 | D = −4, −8, −3, −7, −163 | Matches |
| 23 | H1.1 isomorphisms (R01) | d = −1 vs −4 | Mathlib criterion with b = 0: 4·(−4) = 2²·4·(−1), so isomorphic; the squarefree criterion excludes −4 | Consistent with Check 165 |

## Not verifiable

- I did not read these, and none has a manifest entry (`sources.toml` records only shin2010 and stark1969):
  - H. Davenport, *Multiplicative Number Theory*, Chapters 6 and 21. It is a book with no legal open copy. The chapter numbers match the standard edition's table of contents, and Siegel's theorem as stated agrees with the pinned Tau Ceti docstrings that cite the same chapter.
  - D. A. Cox, *Primes of the Form x²+ny²*, Theorems 7.7 and 7.24 and §12. It is a book; the same theorem numbers are cited by the pinned `PicEquivalence.lean` and `Quadratic/ClassNumberOne.lean`.
  - H. M. Stark, *A complete determination of the complex quadratic fields of class number one* (1967): the previous round found no open PDF on Project Euclid. I did not retry, because this review edits no manifest.
- stark1969 is settled as uncertified (paywalled) and is cited by its locator only.
- Ownership against the open pull requests was checked by `roadmaps grep` over all 471 heads for the headline objects and the dropped names. I read the heads of AnalyticNumberTheoryPartI and EffectiveClassNumbers in full where they cite this roadmap. I did not read the other citing roadmaps beyond the cited lines.

## Source issues

- none
