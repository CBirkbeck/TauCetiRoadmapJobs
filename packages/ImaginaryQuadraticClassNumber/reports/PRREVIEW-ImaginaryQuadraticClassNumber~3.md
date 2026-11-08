# Review of ImaginaryQuadraticClassNumber (pull request #1914 at b14c5bb)

**Verdict:** needs changes

This is an incremental re-review: 69 lines of `README.md` changed since 1513bb4, and `Suggested.lean` is unchanged. All six previous findings are repaired. The gate passes, `Suggested.lean` elaborates with six `sorry` warnings and nothing else, and the dependency check reports no problem. The four findings below are all P3 and none blocks. Each sits in text this change adds, and three of them come from the repairs themselves.

## R01 (P3) — H2.3 leaves as remaining work a conductor comparison that pinned Mathlib already proves

Location: `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md` line 85: "What remains here is: … the conductor comparison for a product of primitive quadratic characters, that is, the L-function of `χ.mul ψ` equals that of the primitive character inducing it times the finitely many Euler factors … and that conductor divides lcm(M,N)".

Claim: every part of this item is a pinned Mathlib theorem:
- `χ.mul ψ` is induced from its primitive character (`changeLevel_primitiveCharacter`);
- that character's conductor divides the level (`conductor_dvd_level`);
- the L-function of an induced character is that of the inducing character times ∏_(p|N)(1−χ′(p)p^(−s)), and the factors at primes dividing the conductor equal 1 (`LFunction_changeLevel`).

Line 19 says pinned statements are consumed by name, not restated as targets. The previous review's R02 recommended keeping this item as a target. That recommendation was wrong, and this finding corrects it.

Witness: a scratch file at the pins proves the item's displayed identity for s ≠ 1:

    LFunction (χ.mul ψ) s = LFunction (χ.mul ψ).primitiveCharacter s * ∏ p ∈ (M.lcm N).primeFactors, (1 - (χ.mul ψ).primitiveCharacter p * p ^ (-s))

The proof is two tactics: `conv_lhs => rw [← changeLevel_primitiveCharacter (χ.mul ψ)]`, then `exact LFunction_changeLevel _ _ (Or.inr hs)`.

Repair:
- Delete the conductor comparison from the "What remains here" list of line 85.
- Add to the H2.3 bullet (line 27) these Mathlib declarations:
  - `DirichletCharacter.primitive_mul` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:424`, the primitive character of `χ.mul ψ`) with `primitive_mul_isPrimitive` (line 432);
  - `conductor_dvd_level` (line 250) and `changeLevel_primitiveCharacter` (line 309);
  - `LFunction_changeLevel` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:149`).
- After "which is imprimitive there in general", add: "Mathlib's `changeLevel_primitiveCharacter` and `LFunction_changeLevel` give L(s,χ.mul ψ)=L(s,χ′)·∏_(p|lcm(M,N))(1−χ′(p)p^(−s)) for s≠1, with χ′=`primitive_mul χ ψ` of conductor dividing lcm(M,N) (`conductor_dvd_level`)."

Tested on χ₋₄ (level 4) times χ₋₄ induced at level 12:
- the product is principal mod 12, so χ′ is trivial of conductor 1;
- the formula gives ζ(s)(1−2^(−s))(1−3^(−s)), which is the L-function of the principal character mod 12.

On χ₋₄ times χ₈: χ′ = χ₋₈ has conductor 8 = lcm(4,8), so no factor is added.

## R02 (P3) — The AnticyclotomicLocalUnits consumer line omits that roadmap's declared gap on H2.3

Location: `README.md` line 191: "AnticyclotomicLocalUnits: H1.3 and H2.1–H2.2."

Claim: AnticyclotomicLocalUnits declares a supplier gap on this roadmap's H2.3, and its *Needs:* line cites H2.1–H2.3. The new consumer line mentions neither. The rewritten "What remains" list of H2.3 (line 85) does not mention the requested bound either. So the one contract another roadmap places on H2.3 does not appear in this README.

Witness: AnticyclotomicLocalUnits (open pull request #1692, head edf0493):
- `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md` line 138: "What ImaginaryQuadraticClassNumber must provide (gap:quadratic-class-number-upper-bound): Extend H2.3 by the uniform upper estimate h(d)≤sqrt(|d|)(2+log|d|)/π…";
- line 646: "ImaginaryQuadraticClassNumber H1.3, H2.1–H2.3 (gap:…)";
- board `packages/AnticyclotomicLocalUnits/design/plan.json` declares the same slug, with supplier ImaginaryQuadraticClassNumber and section H2.3.

Repair:
- Line 191: "AnticyclotomicLocalUnits: H1.3, H2.1–H2.2, and the class-number upper bound of H2.3 that it requests (gap:quadratic-class-number-upper-bound)."
- In H2.3, state the bound as a target:
  - "Prove L(1,χ)≤2+log q for every nonprincipal primitive quadratic χ of conductor q≥3, by partial summation: the sum of χ(n)/n over n≤q is at most 1+log q, and the tail beyond q is at most 1 because the partial sums of χ are bounded by q."
  - "With H2.2 and w_D=2, this gives h(D)≤√|D|(2+log|D|)/π for every negative fundamental D≠−3,−4, in particular for D≡1 mod 8."

Tested:
- D=−7: h=1 ≤ 3.32;
- D=−15: h=2 ≤ 5.80;
- D=−23: L(1,χ₋₂₃) = 2π·3/(2√23) = 1.965 ≤ 2+log 23 = 5.135, and h=3 ≤ 7.84.

## R03 (P3) — The ModularForms Layer 11 anchor breaks when the open ModularForms revision merges

Location: `README.md` line 13: "[ModularForms Layer11](../ModularForms/README.md#layer-11-the-eichlerselberg-trace-formula-level-one)".

Claim: the repaired anchor matches main, where the heading (ModularForms README line 1204) is "Layer 11: the Eichler–Selberg trace formula (level one)". An open revision of ModularForms renames that heading, so the link breaks when it merges. The citation disambiguates the Hurwitz class number and is not a supplier citation, so the severity is P3.

Witness: ModularForms (open pull request #1706, head 75cafd5), `TauCetiRoadmap/ModularForms/README.md` line 1459: "## Layer 11: the Eichler–Selberg trace formula at level one". Its anchor is `#layer-11-the-eichlerselberg-trace-formula-at-level-one`.

Repair: drop the fragment and write "[ModularForms Layer 11](../ModularForms/README.md)". The layer is numbered 11 both on main and at that head, so the citation holds whichever merges first and adds no dependency on the revision. Line 53's unlinked "ModularForms Layer11" is unaffected.

## R04 (P3) — Two attribution slips in the new H1.2 citations

Location and witness:
- (a) Line 47: "is Mathlib `NumberField.classNumber_eq_one_iff` and `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid`". The second declaration is Tau Ceti (`TauCeti/NumberTheory/NumberField/ClassNumber/RingEquiv.lean:143`). Mathlib has only the PID form (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:75`). Line 22 attributes both correctly.
- (b) Line 45: "The ideal transport along these equivalences … are the pinned `map_ringOfIntegersEquiv_symm_span`, …". Line 22 likewise gives that declaration as "(ideal transport)". It covers only the equivalence for d ≢ 1 mod 4. The companion for d ≡ 1 mod 4, `QuadraticAlgebra.map_ringOfIntegersEquivHalf_symm_span` (`TauCeti/NumberTheory/NumberField/Quadratic/PrimeDecomposition.lean:251`), is not named.

Repair:
- (a) Write "is Mathlib `NumberField.classNumber_eq_one_iff` and Tau Ceti `NumberField.classNumber_eq_one_iff_uniqueFactorizationMonoid`".
- (b) Add `map_ringOfIntegersEquivHalf_symm_span` next to `map_ringOfIntegersEquiv_symm_span` in lines 22 and 45.

## Previous findings

- R01 — repaired: lines 21–23 now list the H1.1–H1.3 natives (`existsUnique_neg_squarefree_algEquiv`, `complexEmbedding`, `ringOfIntegersEquivHalf`, `isPrime_and_natCast_mem_iff_of_mod_four_eq_one`, `posDefProperClassToPic_mk_mul_of_united`, …). Lines 41, 45, 47 and 57 begin "What remains here is …" and keep only the naturality, generators, −20 comparison and lattice comparison.
- R02 — repaired: lines 26–27 cite `LFunction_apply_one_pos`, `zetaMulPairCoeffs_nonneg`, both pole orders and both residue formulas, and H2.2 keeps only the χ_D specialization (line 81). R01 corrects the retained conductor item; the suggested `TauCeti.LSeries.landau` citation is omitted, but no target restates it.
- R03 — repaired: line 29 cites `level_two_bound_lt_one`, `level_three_bound_lt_one` and `norm_siegelFunction_zero_half_mul_lt_one`. Lines 136–142 give the three branches D≡1, 0, 4 mod 8 with the product bound for D≡0 mod 4, matching shin2010 lines 895–911 and 1170–1196.
- R04 — repaired: line 17: "AnalyticNumberTheoryPartI §0.9 states L(1,χ)≥c/log q … (AnalyticNumberTheoryPartI §0.34); it consumes only the class-number formula of H2.2 … EffectiveClassNumbers §§4.8–4.9". Lines 186–207 add Downstream consumers; R02 above concerns one line of it.
- R05 — repaired: line 21: "other roadmaps cite this statement as exists_negative_squarefree_presentation". Line 22: "other roadmaps cite the class-number transport as classNumber_congr, which is `RingEquiv.classNumber_eq` applied to the underlying ring isomorphism".
- R06 — repaired: (a) line 24 now begins "`TauCeti.GlobalNumberFields.intAddMulOrder` … and, in the namespace `…NumberFieldOrder`"; (b) and (c) are fixed in line 211 ("Theorem 4.6, pp.13–14 … (19)–(20)"; "The cubic coefficient computation is the pinned `TauCeti.tschirnhausPolynomial_X_pow_four_eq_iff`"); (d) the anchor of line 13 is dash-free (R03 above).

## Verified sound

**Gate.** I re-ran the gate on b14c5bb. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate line also has `build=0`. `git diff --stat origin/main...HEAD` lists no file outside the folder.

**Elaboration.** `lake env lean TauCetiRoadmap/ImaginaryQuadraticClassNumber/Suggested.lean` gives six `declaration uses sorry` warnings (lines 34, 44, 54, 68, 78, 90) and nothing else. `Suggested.lean` is unchanged since 1513bb4, so the signature comparison and the one-tactic padding probe of the previous report carry over:
- six theorems, no definition, no binder lost;
- all six failed `first | (simp; done) | rfl | infer_instance | exact?`.

The worker's seventh "declaration" (`number`, line 65) is the extraction tool misreading the docstring words "class number one".

**Dependency check.** `tauceti-roadmap … gate --depcheck … --movable` printed `depcheck: 238 roadmaps, 2354 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. Line 17 and the consumer list name later roadmaps only as consumers, so they add no supplier edge.

**Seeded sample: "Already in the pinned Mathlib and Tau Ceti".** I elaborated with `#check @` at the pins (Mathlib and Tau Ceti of `lake-manifest.json`) all 78 declarations that the changed bullets (lines 21–24, 26, 27, 29) and the changed sections H1.1–H1.3, H2.2–H2.3 and H3.4 name. The module `DirichletCharacter/LFunction/Bounds` was built first. Each statement has the hypotheses and conclusion the README gives, with the exceptions in R04. Examples:
- `QuadraticAlgebra.nonempty_algEquiv_iff`: `IsRegular 2`; discr a b = u²·discr a′ b′ and 2 ∣ b − u b′. With b = b′ = 0 this is a = u²a′.
- `complexEmbedding_comp_smulOmegaEquiv_of_neg`: u < 0 gives `complexEmbedding hd ∘ starAlgEquiv`. This supports H1.1's σ(θ) = −η case.
- `eq_one_or_neg_one_of_isTotallyComplex`: needs discr ≠ −4, −3.
- `isPrime_and_natCast_mem_iff_of_mod_four_eq_one`: P = (p) with no root of r²−r−(d−1)/4 mod p, or P = (p, halfGen − r).
- `posDefProperClassToPic_mk_mul_of_united`: f = (a,B,a′C), g = (a′,B,aC), h = (aa′,B,C), exactly as line 23 says.
- `reflected` is ⟨a, −b, c⟩ (`BinaryQuadraticForm/Reflection.lean:30`).
- `LFunction_pos_of_one_le`: quadratic, χ ≠ 1, real s ≥ 1, `0 < LFunction χ s` in the complex order.
- `zetaMulPairCoeffs_nonneg`: only `IsQuadratic` on both characters. `LSeriesHasSum_zetaMulPairCoeffs`: Re s > 1, fourth factor `χ.mul ψ`.
- `residue_pair_mul_of_mul_eq_one`: the residue is a derivative of the regularized product.
- `LFunction_inv_conj`: needs s ≠ 1 ∨ χ ≠ 1.
- `norm_LFunction_le_level_mul_norm_div_re`: χ ≠ 1 and 0 < Re s.
- `level_two_bound_lt_one` and `level_three_bound_lt_one`: exactly the displayed inequalities.
- `norm_siegelFunction_zero_half_mul_lt_one`: every r with r 0 = 1/2.

No `sorry` occurs in `SiegelFunction/ClassNumberOne.lean`, `LFunction/Bounds.lean` or `Ideal/Composition.lean`. I also elaborated the seven Mathlib declarations of R01.

**Sources.** shin2010 (arXiv 1009.2253v6):
- Theorem 4.6 is at line 849 (p. 13) and its proof at lines 853–931 (p. 14).
- (19) is at lines 895–912: x = g₀¹²g_(1/2,1/2)¹², g₀¹²g_(1/2,0)¹² or g₀¹² for D ≡ 0, 4 mod 8 and 1 mod 8.
- (20) is at line 917.
- Theorem 5.2(i) is at line 1161, with its proof at lines 1170–1200: the same three |·|^(1/12) branches and the product bound for D ≡ 0 mod 4.

These match lines 136–142 and the locators of lines 136 and 211.

**Cross-roadmap citations resolved** (open heads from `roadmaps show` and `roadmaps grep`, index 2026-11-08):
- AnalyticNumberTheoryPartI (979e68c): §0.9 "Siegel's theorem" (README line 280, `quadratic_LFunction_one_lower_bound`, derived from §0.34) and §0.34 "Uniform exclusion of Landau–Siegel zeros" (line 864). Line 71 says "Nothing from H2.3–H2.4 is consumed". This matches this README's line 17 and line 190.
- EffectiveClassNumbers (9553391):
  - §4.8 (line 1007): h(K) ≥ (c₀/π)√d/log d with computable cutoffs, built on H2.1–H2.2;
  - §4.9 (line 1023): compares with H2.4;
  - line 98: consumes H1.1–H1.3, H2.1–H2.2, the statements of H2.4 and H3.1, and still cites `exists_negative_squarefree_presentation` and `classNumber_congr`, which lines 21–22 now map.
- The other 18 consumer lines match their roadmaps' citations:
  - AbelianSchemesAndArithmeticModuliPartII: H3.6 (lines 90, 524, 3212);
  - AdelicImagesAndModularCurves: H3.6 thirteen orders (line 360);
  - ArithmeticStatisticsPartVII: H3.1;
  - BianchiModularForms: H1.4, H3.1 and H3.6;
  - CMRankZeroConverse: H3.1;
  - ComplexMultiplicationAndExplicitReciprocity: H3.1;
  - EllipticCurveModularityPartII: H3.6;
  - EllipticCurvePeriodsAndModularParametrizations: H1.4 and H3.1;
  - EllipticModularityEffectiveComparisons: H1.1–H1.4, H3.2 and H3.5–H3.6;
  - ErdosProgressionPowers: H3.1;
  - EulerSystemsAndKolyvaginSystems: H1.4;
  - ExplicitNumberFields: H2.2 (#1944);
  - GrossZagierAndArithmeticHeights: H1.2–H1.4 and H3.1;
  - HeegnerPointEulerSystems: H1.4;
  - HilbertModularSurfaces: H1.3–H1.4 and H2.2;
  - NoncommutativeAndEquivariantIwasawa: H3.1–H3.2;
  - OrthogonalTamagawaAndLatticeMass: H1.4 and H2.2;
  - AnticyclotomicLocalUnits: see R02.
- Two roadmaps name this one without being consumers: CircleMethodThreePrimes lists it under "Not owned here" and takes Siegel–Walfisz from AnalyticNumberTheoryPartI §0.32, and QuadraticCharactersAndReduction (line 14) says it "is not a supplier". No roadmap on main cites this one.
- ModularForms on main, line 1204: the anchor of line 13 resolves there (R03 for the open revision).
- The overlap file lists no other open pull request that changes this roadmap and no dropped id of this roadmap. `roadmaps resolve` found no unresolved citation or Lean name.

**Ownership.** No new object is introduced. The changed text only re-attributes existing statements to pinned declarations, and none of the new statements belongs to another roadmap.

**Remark on the H2.2 specialization (line 81).** It composes three pinned results: `fundamentalDiscriminantChar_isQuadratic`, `MulChar.IsQuadratic.comp` and `LFunction_apply_one_pos`. The result is a statement about this roadmap's χ_D and h(D), not a restatement of a general library theorem, so it is kept. R01 differs: there the remaining item is the general theorem itself.

**Adversarial table.** Rows marked "carried" are the previous report's rows (PRREVIEW-ImaginaryQuadraticClassNumber~2) for statements this change leaves untouched. The other rows are recomputed for the changed statements.

| # | statement | instances | values computed | result |
|---|---|---|---|---|
| 1 | `quadratic_LFunction_siegel` (carried, row 1) | q ≤ 2; χ₋₃, χ₋₄, χ₅ | only χ = 1 at q ≤ 2; c ≤ 0.675, 0.902, 0.506 at ε = 0.1 | true; Lean unchanged |
| 2 | `imaginary_classNumber_lower_bound` (carried, row 2) | D = −3, −4, −163 | c ≤ 0.644, 0.574, 0.130 at ε = 0.1 | consistent; ∃c before ∀L |
| 3 | `imaginary_discr_bounded_of_classNumber_le` (carried, row 3) | B = 0, 1 | B = 0 vacuous; B = 1 forces C ≥ 163 | true |
| 4 | `classNumber_eq_one_iff_discr_mem` (carried, row 4) | D = −43, −20, −15, −23 | h = 1, 2, 2, 3 | consistent |
| 5 | `classNumber_eq_one_iff_negative_squarefree_mem` (carried, row 5) | d = −1, −3, −5, −4 | 1 ∈ set, 3 ∈ set, h(−5) = 2; d = −4 excluded by `Squarefree` | `Squarefree` needed |
| 6 | `pic_eq_one_iff_discr_mem` (carried, row 6) | (D,f) = (−3,2), (−3,3), (−4,2), (−7,2), (−11,2), (−4,4) | Pic orders 1, 1, 1, 1, 3, 2 | the 13 values exact |
| 7 | H1.1 naturality (changed, line 41) | d = −1, σ = conjugation on ℚ(i); d = −2 | ι(σ(i)) = ι(−i) = −i = conj(ι(i)); ι_K(√−2) = 1.4142i = complexEmbedding(ω); the u = −1 case is `…_of_neg`, which composes with `starAlgEquiv` | correct: σ(θ) = −η gives ι_L∘σ = conj∘ι_K |
| 8 | H1.1 isomorphism criterion (changed, line 41) | (−20,−5); (−1,−2); (−1,−4) | −80 = 2²·(−20), so isomorphic; −4 = u²(−8) needs u² = 1/2, so not isomorphic; −16 = 2²·(−4), so isomorphic, with −4 excluded by `Squarefree` | matches both Mathlib criteria |
| 9 | H1.2 exceptional generators (changed, line 45) | i; ζ = (1+√−3)/2 | i² = −1, i⁴ = 1: order 4. ζ²−ζ+1 = 0, ζ² = (−1+√−3)/2, ζ³ = −1: order 6. Norm by `norm_ringOfIntegersEquivHalf_symm` at d = −3, z = (0,1): 0+0−(−1)·1 = 1 | correct |
| 10 | H1.2 coordinate formulas (changed, line 45) | d = −5, z = 1+√−5; d = −7, z = (1+√−7)/2 | N = 1+5 = 6, Tr = 2, D = −20; N = 0+0−(−2) = 2 = (1+7)/4, Tr = 1, D = −7 | correct |
| 11 | H1.2 prime factorization (changed, line 45) | d = −5 at p = 2, 3, 11; d = −7 at p = 2 | 2: r = 1, 2 ∣ −20, ramified; 3: r = 1 (1+5 = 6), split; 11: −5 ≡ 6 is a nonsquare mod 11, inert; −7 at 2: r(r−1)+2 ≡ 0 for r = 0, 1, split, 2 ∤ 7 | matches the pinned criteria and χ_D |
| 12 | H1.2 −20 comparison (changed, line 47) | QuadraticAlgebra ℚ (−20) 0 vs ℚ(√−5) | discr ratio 4 = 2²; reduced forms of −20: (1,0,5), (2,2,3), so h = 2 | correct |
| 13 | H1.3 group law (changed, line 55) | n = 20, 23 | n = 20: (2,2,3)·(3,2,2) gives (6,2,1) ~ (1,0,5); (2,−2,3) ~ (2,2,3), order 2. n = 23: (2,3,4)² gives (4,3,2) ~ (2,1,3), and (2,3,4) ~ (2,−1,3) = reflected (2,1,3), so order 3 = h(−23) | consistent with the pinned laws |
| 14 | H1.3 reduced-form count (carried, row 8) | n = 20, 44, 12 | 2, 3, 1 | consistent |
| 15 | H2.1 splitting (carried, row 9) | χ₋₄(2), χ₋₇(2), χ₋₁₁(2), χ₋₈(−1) | 0, 1, −1, −1 | consistent |
| 16 | H2.2 specialization (changed, line 81) | D = −3, −4, −7 | L(1,χ_D) = 0.6046, 0.7854, 1.1874 > 0; h = w√\|D\|L/(2π) = 1.000 at D = −7 | correct |
| 17 | H2.3 four-factor product (changed, line 85) | χ₋₄, χ₋₃ at p = 2 and 5; χ = ψ = χ₋₄ | (1−4^(−s))⁻¹ and (1−p^(−2s))⁻² have coefficients ≥ 0; χ₋₄·χ₋₄ is principal mod 4, so order −2 | matches the pinned statements |
| 18 | H2.3 pinned bound and symmetry (changed, line 85) | χ₋₄ (N = 4) at s = 1, 2, 1/2 | ‖L‖ = 0.785, 0.916 (Catalan), 0.668, all ≤ 4·‖s‖/Re s = 4; real coefficients, so L(s̄) = conj L(s) | consistent |
| 19 | H2.3 conductor comparison (changed, line 85) | χ₋₄·χ₈; χ₋₄ · (χ₋₄ at level 12) | χ′ = χ₋₈ with conductor 8 = lcm, no extra factor; the trivial character at conductor 1 gives ζ(s)(1−2^(−s))(1−3^(−s)) | true, but pinned: R01 |
| 20 | H3.2 phases and g₀g₁g₂ (carried, rows 12–13) | r = (0,1/2); τ = i√2 | 2i(η(2τ)/η(τ))²; 1.414214 + 1.414214i = 2ζ₈ | agrees |
| 21 | H3.3 (19)–(20) (carried, row 14) | D = −8, −7 | x = −64, j = 8000; x = −1, j = −3375 | holds |
| 22 | H3.4 level-two branches (changed, lines 136–142) | A = e^(−π√31) = 2.532·10⁻⁸; D = −40 (≡ 0 mod 8) | bound on \|g₀\| 0.46557; on \|g_(1/2,b)\| 2.07329; product 0.96526. At D = −40 (A = 2.35·10⁻⁹) the product bound is 0.87403 | the branches match shin2010 (19); only the product bound closes D ≡ 0 mod 4 |
| 23 | Check, line 178 (new) | same A | 0.466, 2.07, 0.965 | correct |
| 24 | H3.4 level three (carried, row 16) | A = e^(−π√51) = 1.805·10⁻¹⁰ | 0.93087; −27 is not fundamental | consistent |
| 25 | H3.5 quartic, γ, Check 179 (carried, rows 17–18) | the six points; X³−2; X³+2X²+4X+2 | γ = −96, 0, −32, −5280, −960, −640320; X³−16; X³+96X−16 | true |
| 26 | H3.6 values of γ₂ (carried, row 19) | D = −11, −19, −43, −67, −163 | −32, −96, −960, −5280, −640320 | matches shin2010 line 1117 |
| 27 | H3.1 τ_D, right action, radicand map (carried, rows 20–22) | D = −7, −8; g_r(τ+1); d = −1, −2, −3 | X²−3X+4, X²+2; r·[[1,1],[0,1]]; D = −4, −8, −3 | matches |
| 28 | Line 17 and the consumer list (changed) | 20 consumers against their heads | 19 lines match the cited sections; AnticyclotomicLocalUnits cites H2.1–H2.3 plus a gap | R02 |
| 29 | Line 13 anchor (changed) | main vs #1706 head | `…-trace-formula-level-one` vs `…-trace-formula-at-level-one` | R03 |

## Not verifiable

- H. Davenport, *Multiplicative Number Theory*, Chapters 6 and 21, is settled as uncertified (davenport1980) and is cited by locator only. D. A. Cox, *Primes of the Form x²+ny²*, Theorems 7.7 and 7.24 and §12, is a book with no manifest entry; I did not read it this round. The changed text cites neither for a new claim.
- H. M. Stark (1967, Michigan Math. J.) was not read; stark1969 is settled as uncertified. Neither locator changed in this round.
- I checked ownership against the open pull requests with `roadmaps grep` over all 464 heads for this roadmap's name and the changed objects. I read AnalyticNumberTheoryPartI, EffectiveClassNumbers, AnticyclotomicLocalUnits, CircleMethodThreePrimes, QuadraticCharactersAndReduction, AdelicImagesAndModularCurves and ExplicitNumberFields at the cited lines; the other consumers only at the lines the grep returned.

## Source issues

- none
