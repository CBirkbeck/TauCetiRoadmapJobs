<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1421#issuecomment-6393873528 -->
Review (claude) of ca7c513

Verdict: rejected

1. **F01** (P1) Alias of EffectiveBoundsPartII (for the maintainer)

   - **Location.** `packages/EffectiveBoundsCompactModels/README.md` line 60: "The unspecified constants of EB.5/asymptotic-small-model and EB.5/discriminant-count-bound are replaced here by explicit sufficient constants, using the preceding exact bounds." The title on line 1 is "compact models, Part II", and no roadmap of that name exists.
   - **Claim.** The package says it is a separate numerical continuation that owns the explicit threshold, the uniform model theorem and the real-cutoff field estimate.
   - **Witness.**
     1. `packages/EffectiveBoundsPartII/design/README.md` line 61 says that the source-item name `EffectiveBoundsCompactModels` refers to the arithmetic scope of that Part II.
     2. `packages/EffectiveBoundsCompactModels/design/README.md` line 1 has the same title as that design, "Effective arithmetic bounds and geometry of numbers, Part II".
     3. Design nodes CM.0/canonical-measure … CM.5/field-count (27 nodes) map one to one onto EB.0/measure-normalization … EB.5/discriminant-count-bound (26 nodes). The package's own report deletes 23 of them as duplicates.
     4. Each of the four surviving targets is an EB.5 target with numbers:
        - §0.1 is the `centralBinomialRank_size` / `centralBinomialRank_log` API of EB.5/central-binomial-choice. That API already has n(r+1) ≤ M ≤ 4n(r+1) and an eventual 5 ≤ r ≤ 3 log n.
        - §1.2 is EB.5/asymptotic-small-model.
        - §2.2 is EB.5/components-to-classes, which already restricts to exact degree n and |disc| ≤ H, together with steps 2–3 of EB.5/discriminant-count-bound.
        - §2.3 is EB.5/discriminant-count-bound.
     5. The submitted EffectiveBoundsPartII package (board head 06884a9) states `exists_logarithmic_small_models` in its Suggested.lean. `uniformModel` implies it with Q = 65535: 3 ≤ 16 ≤ 40 ≤ Q < n.
     6. Of the constants, only "r ≤ 3 log n" comes from the source (COUVEIGNES20 line 416). The source leaves Q as "some large enough real number" (COUVEIGNES20 lines 382–384). The constants 16, 40 and 65536 are the package's own derivation.
     7. README lines 244–432 restate 23 Check blocks for EffectiveBoundsPartII's own objects.
     8. `roadmaps grep --fixed EffectiveBoundsCompactModels` finds no match on main or in any open roadmap pull request. Among the board packages, only the merge order and EffectiveBoundsPartII's design (the alias sentence above) name it.
   - **Padding and duplication audit of the 8 Lean declarations.**
     - The two headlines restate supplier headlines (EffectiveBoundsPartII §5.2 and §5.6) at a stronger, unsourced constant.
     - `IsCompactModel` duplicates the core of EffectiveBoundsPartII's `HasBoundedModel`: integral point, vanishing equations, nonzero Jacobian at the point, generation. That gives two predicates for one object in two Suggested.lean files.
     - `EmbeddedField`, `embeddedFieldNumberField`, `BoundedFields`, `fieldIsoSetoid` and `numberFieldCount` restate ArithmeticStatisticsPartI Layer 0 (see R02).
     - None of the 8 closes in one tactic (probe below). Each is a silent restatement of a supplier's object, so all of it is covered by this finding and R02.
   - **Repair (maintainer).**
     - Reject the package and remove `EffectiveBoundsCompactModels` from the merge order.
     - If explicit constants are wanted, add them to EffectiveBoundsPartII §5.1, §5.2 and §5.6, either as the statements with Q = 65536 or as Checks.
     - Drop this package's two gaps. EffectiveBoundsPartII already carries the Bézout contract (R03).
     - Tested on the refuting instance: at n = 65536 the values r = 12, M = 2704156, log H₀ ≈ 631.825 ≤ 40(log n)² ≈ 4919.839 and log(finite bound) ≈ 1.597·10¹¹ ≤ 2000n(log n)⁴ ≈ 1.983·10¹² all hold. The strengthened EffectiveBoundsPartII statements are therefore consistent with that roadmap's own route.

2. **F02** (P2) gap:bounded-field-class-interface is compound, partly provided by Mathlib, refused by its supplier, and also built locally

   - **Location.** README line 62: "Provide the native quotient … with invariant degree and absolute discriminant, inclusive real sublevels, Hermite finiteness, and compatibility of residue-field component classes with these sublevels." Line 13 says the quotient "is an EffectiveBoundsPartII EB.5 interface". Suggested.lean lines 55–78 define it.
   - **Claim.** EffectiveBoundsPartII EB.5 must supply the isomorphism-class quotient.
   - **Witness.**
     - *Compound.* The gap asks for five things: the quotient, invariance, sublevels, finiteness and compatibility.
     - *Already provided.* Hermite finiteness on exactly this subtype is Mathlib `NumberField.finite_of_discr_bdd` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:494`). Discriminant invariance is `NumberField.discr_eq_discr_of_algEquiv` (`…/Discriminant/Defs.lean:50`).
     - *Supplier disowns it.* The EffectiveBoundsPartII package README (head 06884a9, line 15) assigns the quotient to ArithmeticStatisticsPartI Layer 0, "Number fields ordered by discriminant" (`NumberFieldFamily.Embedded`, `isoSetoid`, `isoFamily`, `isoDegree`, at its README line 1302). Its plan's `gaps` list contains only `isolated-affine-bezout`.
     - *Ordering.* ArithmeticStatisticsPartI is line 124 of the merge order, later than both EffectiveBoundsPartII (100) and this roadmap (101). The README never names ArithmeticStatisticsPartI.
     - *Built locally anyway.* This package defines the same carrier itself (`fieldIsoSetoid`, `numberFieldCount`) while declaring it missing from its supplier.
   - **Repair.**
     - The maintainer decides who owns the carrier: move ArithmeticStatisticsPartI Layer 0's quotient down into EffectiveBoundsPartII Layer 5, or move that layer earlier.
     - Then restate the needs as one sentence: "the quotient of finite-dimensional intermediate fields of `AlgebraicClosure ℚ` by ℚ-algebra isomorphism, with degree and absolute discriminant descending to it".
     - Drop finiteness and invariance from the gap and cite the two Mathlib declarations instead.
     - Test case: with the corrected wording, the case N₂(4) = 2 (discriminants −3 and −4) is still computable without the dropped clauses.

3. **F03** (P2) gap:isolated-intersection-lengths asks for what the consumed supplier target already supplies

   - **Location.** README line 70: "What SchemeAndStackFoundations must provide (gap:isolated-intersection-lengths): … the sum of their local intersection lengths is at most the product of their degrees …". The same gap appears in the §2.2 *Needs* and the Layer 2 Dependencies.
   - **Claim.** This roadmap needs its own Bézout contract.
   - **Witness.**
     - README line 60 already consumes "EB.5/components-to-classes for the component-to-isomorphism-class surjection and the dʳ multiplicity bound".
     - EffectiveBoundsPartII's plan at head 06884a9 declares `gap:isolated-affine-bezout` to SchemeAndStackFoundations 5.12, with the same content.
     - So two slugs announce one request to one supplier section.
   - **Repair.**
     - Delete the gap from `design/plan.json` `gaps` and delete README lines 70–72.
     - In §2.2 *Needs* and the Layer 2 Dependencies, replace "SchemeAndStackFoundations §5.12 and its isolated-intersection-lengths contract" with nothing; EB.5/components-to-classes stays.
     - Test case: (X²−2)(X²−3) has 4 geometric points ≤ 4¹ = 4, and that bound arrives through EB.5/components-to-classes.

4. **F04** (P3) Worked example "Explicit compact model bound" has a wrong value

   - **Location.** README line 389: "For ℚ, r=1,d=5, E=x,κ=0 has coefficient height 1, J=1, and H₀=5^(5/2)√6·2⁵>1."
   - **Claim.** The displayed value of H₀ is 5^(5/2)√6·2⁵.
   - **Witness.** The README's own formula (line 23) gives (n²d(r+1))^d = (1·5·2)⁵ = 10⁵. So H₀ = 5^(5/2)√6·10⁵ ≈ 1.3693·10⁷, not ≈ 4381.78. The conclusion H₀ > 1 still holds.
   - **Repair.** Replace "2⁵" with "10⁵" (H₀ ≈ 1.369·10⁷). Recomputed: 55.9017·2.44949·10⁵ = 13693063.9.

5. **F05** (P3) Wrong section for `jacobian_etale_algebra`

   - **Location.** README lines 9, 68 and 141 cite "SchemeAndStackFoundations §0.9, `jacobian_etale_algebra`".
   - **Witness.** On main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` specifies `jacobian_etale_algebra` at line 900, inside "### 0.10 Geometrically unibranch local rings and schemes" (line 878). §0.9 (line 848) covers limits and Noetherian approximation. The EffectiveBoundsPartII package cites §0.10.
   - **Repair.** Change "§0.9" to "§0.10" in all three places.

6. **F06** (P3) Supplier labels EB.k/slug are not section labels in the supplier package

   - **Location.** About 30 citations, for example line 98 "EffectiveBoundsPartII EB.5/central-binomial-choice", and the gap section field "EB.5/components-to-classes and EB.5/discriminant-count-bound".
   - **Witness.** The EffectiveBoundsPartII package README (head 06884a9) numbers its targets §0.1–§5.6. The string "EB." appears in it 0 times. The labels resolve only as node ids of that roadmap's design `plan.json`.
   - **Repair.** This becomes moot once R01 is settled. Otherwise use the supplier's section numbers: EB.4/jacobian-open → §4.1, EB.4/explicit-small-model → §4.2, EB.5/central-binomial-choice → §5.1, EB.5/asymptotic-small-model → §5.2, EB.5/bounded-equation-systems → §5.3, EB.5/coefficient-box → §5.4, EB.5/components-to-classes → §5.5, EB.5/discriminant-count-bound → §5.6.

7. **F07** (P3) sources.toml entry is stale

   - **Location.** `packages/EffectiveBoundsCompactModels/sources.toml` lines 12 and 20: locator "Propositions 1–2; Theorems 1–2; Sections 2–4, pp. 487–496" and `cited_for = ["Layers 0–5"]`.
   - **Witness.** The README has only Layers 0–2. Proposition 1 and §2 are cited only in the worked examples of EffectiveBoundsPartII objects.
   - **Repair.** Set `cited_for = ["0.1", "0.2", "1.1", "1.2", "2.1", "2.2", "2.3"]`. Narrow the locator to "Theorems 1–2; Proposition 2; §3 p. 492; §4, pp. 487–496".

8. **F08** (P3) The §1.1 locator does not cover the integral tuple

   - **Location.** README §1.1, line 126, cites only "Proposition 2, p.495, COUVEIGNES20 line 354".
   - **Witness.** The statement of Proposition 2 (COUVEIGNES20 lines 354–380) mentions neither the tuple κ, nor its integrality, nor generation. Integrality comes from the construction κⱼ = Σ uᵢⱼαᵢ (line 207, §3 p. 492). Generation comes from well-poisedness making the evaluation a closed immersion (line 249).
   - **Repair.** Add "§3, p.492, COUVEIGNES20 line 207 and line 249" to the §1.1 locator.

The package is an alias of EffectiveBoundsPartII: same single source, same two endpoint theorems (Couveignes, Theorems 1–2), and a design whose 27 nodes mirror EffectiveBoundsPartII EB.0–EB.5 one for one. Packaging deleted 23 of them as duplicates. What remains is the EB.5 headlines of EffectiveBoundsPartII with explicit constants filled in, and no source states those constants. A human has to decide whether to retire the name or fold the constants into EffectiveBoundsPartII (R01). Apart from that, the mathematics checks out: every numerical inequality and Check I recomputed holds, except one worked-example value (R04). The Lean file elaborates with only the two `sorry` warnings.

Findings: 8 in total; 3 blocking (1 P1, 2 P2) and 5 P3.

## Adversarial table

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| H₀ convention (line 23) | n=1,r=1,d=5,δ=1 | ℓ=5, M=6, (n²d(r+1))^d=10⁵; H₀≈1.369·10⁷; worked example says ·2⁵ (≈4381.78) | Formula sound; example wrong | R04 |
| Floor convention | F=5/2; F=0 | B=2 gives 5 values, rounding up gives 7; F=0 gives only 0 | Pass | none |
| Jacobian convention | (x−a,y−b) and swapped | det 1 and −1, same open set | Pass | none |
| δ, houses (line 17) | ℚ(i), family (1,2i) | δ=2, δ²=4, houses (1,2), index 2 | Pass | none |
| §0.1 least parameter | n=0,1,2,3,14,15,65536 | r=1,1,2,3,4,5,12; choose(22,11)=705432<786432; choose(24,12)=2704156≥851968 (both also checked by `decide`/`norm_num` in Lean) | Pass | none |
| §0.1 inequalities | n=65536; sweep of 246 values in [2¹⁶, 2⁶⁰] | 12≤33.271; 2704156<3407872≤11629080; ℓ/(2n)=20.131≤88.723; log M=14.810≤33.271; log156=5.050≤22.181; sweep: 0 failures (also log H₀≤40L², 2r≤40L) | Pass | none |
| §0.1 route | t=⌈log₂65536⌉+1=17 | C₁₇=choose(34,17)/18=129644790≥65536; 17≤33.27; C₄=14 forces r≥5 for n≥15 | Pass | none |
| §0.2 exponent 40 | n=65536, δ=1,2 | log H₀=631.825 vs 4919.839; 648.461 vs 5227.329; route 36L²+1.5L=4444.49 | Pass | none |
| §1.1 `IsCompactModel` | (x²+1,i) in ℚ(i); (x,0) in ℚ(i); (x²,0) in ℚ; r=0 | (value, J, generated degree)=(0,2i,2) passes; (0,1,1) fails generation; (0,0,1) fails Jacobian; r=0: det of empty matrix=1, adjoin ∅=⊥, equal to ⊤ only for ℚ | Pass; each clause excludes a wrong model | none |
| §1.2 `uniformModel` | ℚ(ζ_{2¹⁷}) (degree φ(2¹⁷)=65536); implication to EffectiveBoundsPartII §5.2 | hypothesis can be met; r pinned to the least parameter; Q=65535 gives the supplier statement | True, but a restatement | R01 |
| `EmbeddedField` | ℚ, ℚ(i), whole closure | degrees 1, 2, infinite (excluded despite junk finrank 0) | Pass | none |
| `embeddedFieldNumberField` | compared with Mathlib's Hermite statement | the same `@NumberField.mk _ _ inferInstance K.prop` as `Discriminant/Basic.lean:497` | Pass (needed carrier) | none |
| `BoundedFields` | ℚ(i) at H=3,4; n=0; H<0 | 4>3 excluded, 4≤4 included; empty; empty | Pass | R02 (ownership) |
| `fieldIsoSetoid` | ℚ(√2) vs ℚ(√3); conjugate cubic copies | discriminants 8≠12, so unrelated; three copies give one class | Pass | R02 (ownership) |
| `numberFieldCount` | N₁(1), N₂(3), N₂(4) | 1; 1 (only −3; 1/#Aut weighting gives 1/2); 2 | Pass | R02 (ownership) |
| §2.2 cover | x²−1; (x²−2)(x²−3); (xy,x(y−1)) | 2 components → 1 class; 2 classes; det=x on the line x=0, so 0 components | Pass | none |
| §2.3 `fieldCount` | n=65536, H=1,2; n≥2, H=1; real versus integer H | log bound 1.5967·10¹¹ ≤ 1.9829·10¹² ≤ 6.497·10¹³; extra log F=0.004692; 48nL²log3+3L²=4.251·10⁸ ≤ 80nL⁴=7.931·10¹⁰; N_n(1)=0; N_n(H)=N_n(⌊H⌋) and the right side is monotone | True, but a restatement | R01 |
| Worked example "Finite-index discriminant identity" | ℚ(i), κ=2i, d=1 | det(AA*)=det[[5,−3],[−3,5]]=16; 16/4=4=det(BBᵀ) | Pass | none |
| Worked example "Relation covolume bound" | ℚ(i), κ=2i, d=1 | C=4·1·2·4=32; D₀=2·32²=2048; bound 1024 ≥ 1 | Pass | none |
| Worked example "Truncated short relations" | (n,r,d)=(3,2,5) | M=21, ℓ=18, k=16, codimension 2 | Pass | none |
| Worked example "Short first-half integers" | n=3, 4 | m=2, 3; exponents 3/(2·2)=3/4 and 4/(2·2)=1 | Pass | none |
| gap: isolated lengths | (X²−2)(X²−3) | 4 points ≤ 4 | Sound but duplicated | R03 |

## Verified sound

- **Principles.**
  - No computational algorithm, no copied passage, no `set_option`, no sorry'd data.
  - One `import Mathlib`; `theorem` throughout; no process words (scanned for 14 patterns: 0 hits).
- **Dependency check.** The required command printed `depcheck: 48 roadmaps, 539 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Sources (all 7 sampled targets).** Checked against COUVEIGNES20, read in full (lines 1–496):
  - 0.1 → line 409 (equation (1), p. 495) supports the parameter choice and r ≤ 3 log n "for n large enough". The threshold is the package's own.
  - 0.2 → line 354 (Proposition 2, p. 495) and line 421 (p. 496): the formula matches.
  - 1.1 → line 354; see R08.
  - 1.2 → line 20 (Theorem 1, p. 487).
  - 2.1 → line 35 (Theorem 2, p. 488): unweighted classes.
  - 2.2 → line 425 (p. 496): the coefficient count and the several-fields remark.
  - 2.3 → lines 35 and 425.
  - Hypotheses match the source except for the explicit constants, which the README marks as its own refinement (R01).
- **Pinned declarations.** 22 declarations opened at Mathlib 6b7abb3c and Tau Ceti a91d3aaf; all exist where cited:
  - `NumberField.rootDiscr` (`Discriminant/Basic.lean:77`), `discr_eq_basisMatrix_det_sq` (:49), `mixedEmbedding.covolume_integerLattice` (:124, value 2^(−s)·√|disc|), `finite_of_discr_bdd` (:494).
  - `house` (`House.lean:38`), `house_mul_le` (:51), `one_le_house_of_isIntegral` (:93).
  - `restrictTotalDegree` (`RingTheory/MvPolynomial/Basic.lean:164`), `mem_restrictTotalDegree` (:174), `aeval` (`Algebra/MvPolynomial/Eval.lean:572`), `pderiv` (`PDeriv.lean:61`).
  - `Module.Dual` (`Dual/Defs.lean:61`), `LinearMap.dualMap` (:116), `eq_zero_of_eval_zero_at_prod_finset` (`Nullstellensatz.lean:62`), `covolume_div_covolume_eq_relIndex'` (`ZLattice/Covolume.lean:170`), `discr_eq_discr_of_algEquiv` (`Discriminant/Defs.lean:50`).
  - Tau Ceti `ZLattice.covolume_sq_eq_det_gram` (`TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`) and `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` (`TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:172`).
  - The Tau Ceti count has no degree restriction and an H-exponent growing with n, so it does not imply `fieldCount` uniformly in n.
- **Cross-roadmap citations resolved.**
  - Completed EffectiveBounds (main).
  - SchemeAndStackFoundations §5.12 (main, line 7336), and §0.10 (R05).
  - GenericDoublePointInterpolation §§0.1, 0.3, 1.3, 1.4, 5.1–5.3 (open head: lines 242, 325, 448, 518, 1506, 1540, 1594).
  - GeometryOfNumbersAndQuadraticArithmetic §§0.1.2, 0.3.3, 1.1, 1.2.7, 1.5.21 (open head).
  - ArithmeticStatisticsPartIV §3.1 (open head, line 66) and ArithmeticStatisticsPartV §3.28 (open head, line 1784).
  - EffectiveBoundsPartII design EB ids (board main) and its package (board head 06884a9; see R06).
- **Ownership.** `roadmaps grep` over main and all 352 open heads for "Couveignes", "small models", "compact model", "Jacobian-open" and "(log n)^3". The compact-model theorems appear only in EffectiveBoundsPartII. ArithmeticStatisticsPartV §3.28 states the Schmidt and Lemke Oliver–Thorne bounds, whose constants depend on n. No Suggested.lean declares a fully qualified name in `TauCetiRoadmap.EffectiveBoundsCompactModels`.
- **Lean elaboration.**
  - `lake env lean` on `packages/EffectiveBoundsCompactModels/Suggested.lean` from the content checkout exited 0 with exactly two warnings, both "declaration uses `sorry`" (lines 38 and 82).
  - A scratch copy with `#check @name` for all 8 declarations shows every binder is kept: K with its `Field`/`NumberField` instances in `IsCompactModel` and `uniformModel`; n and real H in `BoundedFields`, `fieldIsoSetoid`, `numberFieldCount` and `fieldCount`; the hypotheses `65536 ≤ n` and `1 ≤ H`. The elaborated types match the README statements, and no binder had to change.
  - One-tactic probes: `simp` leaves the goal open on both theorems, and `positivity` does not apply. No declaration is one-tactic padding; the duplication audit is in R01 and R02.
- **Gap declarations.** Both slugs match between `design/plan.json` and the README; both suppliers are named and earlier in the order. Defects are in R02 and R03.

## Not verifiable

- The printed glyph behind ">" in the source extraction (for example lines 121, 124 and 172) could not be seen. Text extraction appears to map ⩾ to ">". The README uses the inclusive reading, which is the mathematically correct one.
- Fulton's chapter numbering (used under Source issues) was checked against a library table of contents for the first edition, not the book itself. The second edition keeps the chapter structure.
- The EffectiveBoundsPartII package is not in the brief's sibling checkouts. I read it from its board pull-request head 06884a9 through a read-only API call.

## Source issues

- **Misprint** in COUVEIGNES20 at §4, printed p. 496 (line 430): the source cites chapter 13 of Fulton's *Intersection Theory* to bound the isolated points by the intersection number; it should cite chapter 12 (the refined Bézout theorem, §12.3); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ca7c513", "job": "REV-PKG-EffectiveBoundsCompactModels", "model": "opus", "worker": "fable-rev90"} -->
