<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/130#issuecomment-6329353507 -->
Red team round 1 pass a (codex) of 8932cf5

Verdict: needs_changes

1. **F01** (P1) The support criterion silently includes rank zero

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:572` — “`f ∈ positiveSubring g ↔`”; also the example at line 863.

   **Claim:** The generated subring equals the cone-supported Laurent polynomials, and contains the multiplier monomial.

   **Witness:** At g=0 the generating set is empty, so positiveSubring is the integer constants. The monomial t has coneValue=1 but is not constant. The section's unused `Fact (0 < g)` is absent from both types.

   **Exact repair text:** Add an explicit `[Fact (0 < g)]` binder to `mem_positiveSubring` and to the positive-multiplier test (or `include` that instance). Add the negative control: “At rank zero, `positiveSubring 0` contains only integer constants; `t 0` satisfies the cone inequality but does not belong.” Keep the positive-rank theorem at its existing generality.

2. **F02** (P1) The advertised Grothendieck-ring import does not exist at the pin

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:24` — “`import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal`”; `packages/ClassicalGroupsPartII/README.md:142`.

   **Claim:** This module supplies the SplitK0 ring and functoriality declarations.

   **Witness:** At Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the file is `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean`; `Monoidal.lean` is absent. The README links instead pin the older `f7904748` revision.

   **Exact repair text:** Replace the import with `import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic`. Update every affected declaration link to `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean` at the actual Tau Ceti pin and check the declaration signatures there. Use the current Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a` for Mathlib links.

3. **F03** (P1) Headline signatures depend on admitted data and new heavy carriers

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:136` — “`def coordinateHopfAlgebra … := by sorry`”; also lines 239, 303, 431, 543 and 622.

   **Claim:** The file provides usable signatures for algebraic representations, rational character equivalence and tensor-character equivalence.

   **Witness:** `RatRep` and `repRing` depend on the admitted coordinate Hopf algebra; standard/primitive/irreducible objects, scalar extension and the two headline equivalences are also admitted data. Even elementary `centralDegree`, `coverWeight`, Weyl maps and `exteriorCharacter` have admitted bodies.

   **Exact repair text:** “The GSp coordinate Hopf algebra, its representation category and representation-theoretic equivalences are README targets until their carriers exist at the pins. Suggested.lean retains only real-bodied lattice, monomial, Weyl-action, cone and elementary-character definitions, and theorem statements over those definitions.” Remove every admitted `def`/`instance` and every declaration depending on one; implement the light definitions directly. State the full and positive invariant presentation headlines as existence theorems with generator equations over these real carriers, rather than admitted equivalence definitions. This preserves the easy algebraic headlines while removing forced representation headlines.

4. **F04** (P3) All 58 examples are admitted

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:672` — “`example … := by sorry`”; the entire test block ends at line 909.

   **Claim:** The tests check the roadmap's definitions.

   **Witness:** All 58 `example` declarations contain `sorry`; there are zero proved examples. Several also use admitted proof arguments inside their types.

   **Exact repair text:** Keep at most two proved, discriminating examples per retained real-bodied definition. Prove the easy lattice, monomial and cone examples. Turn each boundary test requiring an unavailable carrier into a named theorem target in the README; omit its Lean statement until its carriers exist. Do not retain any admitted `example` or any `sorry` inside a retained definition's proof fields.

5. **F05** (P3) The Lean file violates the required declaration format

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:1` — “`import Mathlib.Algebra.Algebra.Rat`”; lines 42, 47 and 64.

   **Claim:** This is the package's permitted Suggested.lean form.

   **Witness:** There are eleven individual Mathlib imports, `set_option autoImplicit false`, namespace `TauCeti.GSpCharacter`, 65 `lemma` declarations, and many declarations without mathematical docstrings. Layer comments do not have the required `## Layer` form.

   **Exact repair text:** Replace all Mathlib imports by `import Mathlib`; delete the option; use `namespace TauCetiRoadmap.ClassicalGroupsPartII`; spell retained results `theorem`; document each retained declaration. Begin the module docstring with “ClassicalGroupsPartII: representative target signatures”, identify README.md as authoritative, and label layers `/-! ## Layer CG.k: <title> -/` in README order. Align the README's suggested names with the retained names.

6. **F06** (P1) Claimed supplier contracts are absent from their cited sections

   **Location:** `packages/ClassicalGroupsPartII/README.md:1248` — “the minimal coefficient-generated subcomodule of a vector and its flat base-change compatibility”; also line 1250.

   **Claim:** ReductiveGroups Layer 1 supplies that construction and category-instance glue; Layer 3 supplies fully faithful representation pullback and its kernel-trivial essential image.

   **Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:176`–225 lists its actual Layer 1 targets; lines 234–247 list Layer 3. Neither states the generated-vector/base-change theorem or representation-descent equivalence. No matching declared gap exists in this package.

   **Exact repair text:** Under `## Exact supplier contracts`, register separate minimal gaps with ReductiveGroups as supplier and matching `design/plan.json` slugs: “For a finite-dimensional right comodule M over a commutative Hopf algebra H over a field F and v∈M, construct the least subcomodule containing v and prove that its extension to every field K/F is the least subcomodule containing 1⊗v.” And: “For a faithfully flat quotient of affine finite-type group schemes G→Q over a field with finite central kernel N, pullback identifies finite rational Q-representations with the full subcategory of finite rational G-representations on which N acts trivially.” Resolve the category-instance requirements separately against native instances or precise targets; do not present them as already stated by Layer 1.

7. **F07** (P2) The package replans classification already owned by ReductiveGroups

   **Location:** `packages/ClassicalGroupsPartII/README.md:688` — “Highest-weight classification over Q and its extensions”; proof at lines 705–707; formal-character construction at lines 795–821.

   **Claim:** Completeness over arbitrary characteristic-zero fields, scalar endomorphisms, absolute simplicity, base change and the general formal-character rules are new work here.

   **Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:1733`–1746 owns rational scalar extension, weight decomposition and formal characters. Lines 1769–1782 explicitly own simple classification, absolute simplicity, End=k and arbitrary-field base change for split reductive groups.

   **Exact repair text:** “Consume ReductiveGroups §10A for rational scalar extension and torus formal characters, and §10B for split highest-weight classification, absolute simplicity, scalar endomorphisms and field extension. Here identify its character lattice with X_g, compare its simple object of weight (m,u) with the explicit primitive-tensor Cartan model, and transport these supplied results.” Replace the independent completeness/descent proof plan by this comparison. Retain the GSp-specific primitive construction and integral invariant-ring presentations.

8. **F08** (P2) Exterior comodules are already available at the current pin

   **Location:** `packages/ClassicalGroupsPartII/README.md:485` — “Consume the generic tensor/exterior comodule operations from ReductiveGroups Layer 1”; also line 1248 and `Suggested.lean:263`.

   **Claim:** The exterior coaction and its point-action compatibility still require the named supplier interface.

   **Witness:** `TauCeti/Algebra/Coalgebra/Comodule/ExteriorAlgebra/Power.lean:73` defines `TauCeti.Comodule.exteriorPower`; line 110 defines `Hom.exteriorPowerMap`; line 166 proves `baseChange_subtype_endOfPoint_ιMulti`, including nonreduced test algebras.

   **Exact repair text:** “Construct exteriorStandard by bundling `TauCeti.Comodule.exteriorPower K O_g(K) V k` in FGComoduleCat. Reuse `TauCeti.Comodule.Hom.exteriorPowerMap` and `TauCeti.Comodule.baseChange_subtype_endOfPoint_ιMulti` from `TauCeti/Algebra/Coalgebra/Comodule/ExteriorAlgebra/Power.lean`.” Remove these supplied pieces from the Layer 1 request; state only remaining boundary/comparison obligations as new targets.

9. **F09** (P1) Split root data are used before reductivity is established

   **Location:** `packages/ClassicalGroupsPartII/README.md:288` — “Record the root/coroot pairing in the ReductiveGroups split-pair interface”; lines 297, 322 and 368.

   **Claim:** The diagonal-torus and Weyl-group blocks precede the central-cover block, which establishes split connected reductivity while depending on both earlier blocks.

   **Witness:** ReductiveGroups Layer 7's root-datum interface (`TauCetiRoadmap/ReductiveGroups/README.md:627`–647) is for reductive groups. This package only proves GSp reductive at line 368, whose prerequisites at line 373 include the torus and Weyl blocks.

   **Exact repair text:** Split the cover block. Immediately after the coordinate presentation, prove the central isogeny, its kernel and fppf quotient, and connected reductivity, using only the coordinate presentation, Sp and the generic isogeny results. Then construct the maximal torus, Borel and root datum, followed by the Weyl action. Put weight-parity and representation descent after these. Remove torus/Weyl prerequisites from the early isogeny/reductivity target.

10. **F10** (P3) The Hom base-change citation points to different statements

   **Location:** `packages/ClassicalGroupsPartII/README.md:631` — “Chapter 22 §a, Theorem 22.2 and complements 22.3–22.6”.

   **Claim:** This locator supports the canonical Hom comparison, weight comparison and reflection of object isomorphisms proved before classification.

   **Witness:** `milne line 19291` begins highest-weight classification; `milne line 19313` is semisimple descent. The exact Hom comparison and infinite-field isomorphism reflection are Exercise 4-4(a,b), `milne line 4281`; invariant base change is Corollary 4.34, line 4256.

   **Exact repair text:** Replace this block's source with “Milne, Algebraic Groups, second edition, Chapter 4 §i, Corollary 4.34, printed p.96, and Exercise 4-4(a,b), printed p.97; obtain weight-space base change by applying invariant base change after a torus-character twist.” Keep §22 for the later classification statements.

11. **F11** (P3) Several Checks cannot distinguish the wrong construction

   **Location:** `packages/ClassicalGroupsPartII/README.md:577` — “κ_2((2v)∧(2w))=4κ_2(v∧w)”; also lines 940, 997 and 1115.

   **Claim:** These Checks discriminate the twisted contraction and the specified invariant-ring isomorphisms.

   **Witness:** Zero contraction passes the scalar-homogeneity test. Any algebra equivalence passes unique-preimage and unit tests; replacing the polynomial variable by F₁+1 still passes those tests. `Suggested.lean:770`–776 adds an independent multiplier-action assertion, which also permits zero contraction.

   **Exact repair text:** Replace the contraction Check with “For g≥2, κ₂(e₁∧f₁)=1 in ν and κ₂(f₁∧e₁)=−1; the scalar 2 acts on this nonzero image by 4.” Replace the tautological equivalence Checks with coefficient-sensitive tests, for example: “At g=1 the inverse image of the single orbit sum z²+(t/z)² is X₁²−2T; the constant orbit 1 has coefficient one.” Include proved examples when these use retained real-bodied definitions; otherwise register named README theorem targets.

12. **F12** (P3) Retained definitions and theorem names lack README contracts and Checks

   **Location:** `packages/ClassicalGroupsPartII/Suggested.lean:75` — “`def simpleRoot`”; lines 79 and 570 define `RootLE` and `coneValue`; `packages/ClassicalGroupsPartII/README.md:119`–122 promises named APIs and three tests per definition.

   **Claim:** Every suggested declaration has its README counterpart and every definition has at least three discriminating Checks.

   **Witness:** Eighty of the 175 named Lean declarations have no exact name in the README, including `RootLE`, `simpleRoot`, `coneValue`, `rationalHighestWeightClassification` and `integralTensorGeneration`. `RootLE` has no dedicated positive/negative test, and its central-degree restriction is untested.

   **Exact repair text:** Register every retained Lean name in its README target and remove names for deleted prototypes. For `RootLE`, add: “RootLE μ μ; RootLE 0 αᵢ but not RootLE αᵢ 0; RootLE μ λ implies equal central degrees, so neither 0 nor e_t is below the other.” Give the definition's exact nonnegative-simple-root formula and source locator. Give `simpleRoot` and `coneValue` their own three discriminating Checks, with at most two proved examples per retained definition and the remaining boundary obligation as a named README target.

13. **F13** (P3) The three cited sources have no source manifest

   **Location:** `packages/ClassicalGroupsPartII/README.md:1268` — “References”; the package has no `sources.toml`.

   **Claim:** The source citations meet the required recorded-source contract.

   **Witness:** The tracked package consists of README.md, Suggested.lean, metadata.toml and review.json. None records the source IDs, retrieval metadata or locator-to-target mappings required by the sources schema. All three texts were legally readable during this pass.

   **Exact repair text:** Create `packages/ClassicalGroupsPartII/sources.toml` with schema `tauceti-roadmap-sources/v1` and entries `yu`, `milne`, `sternberg`, recording the cited versions, exact locators, target mappings, legal URLs and service-produced retrieval metadata. Include the corrected Milne Chapter 4 locators from R10. Use the source service to populate hashes and fetch status; do not copy source text into the package.

## Verified sound

Read all 1,290 README lines and all 911 Suggested.lean lines: **233 declarations** (87 definitions, 8 abbreviations, 15 instances, 65 lemmas, 58 examples); **26 target blocks**, all 136 named API/Check bullets and all 160 bold entries. **58 README Checks** were examined against their corresponding Lean examples; none is proved in the package. The positive-rank mathematical assertions of those Checks survive the boundary calculations, subject to the discriminating-test findings above.

Checked **23 distinct advertised pinned library interfaces** by declaration and hypotheses. The exception is the stale module path in R02; its declarations still exist in the relocated module. Kernel flatness/Noetherianity, finite-free matrix coefficients, finite weight support, matching tensor universes and the SplitK0 additive/monoidal prerequisites were inspected.

Checked **11 unique supplier-section contracts** against ReductiveGroups, ClassicalGroups and LieHighestWeight on main. The package has **zero citations to the seven listed open sibling roadmaps**; their supplied heads were searched for the relevant objects. No reciprocal dependency on ClassicalGroupsPartII was found. The package diff is confined to its folder (README.md, Suggested.lean, metadata.toml and review.json).

Verified **11 distinct cited locator units across 3 works**, plus the two replacement locators for R10. Evidence: Yu's cone at `yu line 3736`, character-ring statements at `yu line 3761` and primitive generators at `yu line 3766`; Milne's split classification and extensions at `milne line 19291`, `milne line 19304`, `milne line 19308`, `milne line 19313`, `milne line 19317`, central-isogeny weights at `milne line 19367`, and semisimplicity at `milne line 19813` and `milne line 19859`; Sternberg's Cartan construction at `sternberg line 5024` and contraction at `sternberg line 5043`. The source's incorrect lower binomial index at `sternberg line 5054` was not copied: the package uses k−2 and its rank-two dimension agrees with `sternberg line 5143`.

Exact integer calculations checked ranks 0–3: 780 lattice/parity cases, 2,150 flip/degree/cone cases, 4,030 permutation-conjugacy cases, 780 support-normal-form cases, 18 exterior-character cases and 84 exterior-basis commutator cases. The last calculation gives [κ,L]=(g−k) with κ(e_i∧f_i)=+1. These finite checks supplement the algebraic arguments; they do not prove the general theorems.

The requested dependency command returned:

```text
depcheck: 8 roadmaps, 48 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. R09 concerns an internal target ordering that this roadmap-level check does not detect. No ownership is moved to a later roadmap by the proposed repairs.

The adversarial target table records both mathematical checks and associated repairs. “Pass” means the stated mathematics at the README hypotheses survives the indicated cases, not that its Lean proof exists.

| Statement / README line | Instances tried | Result | Change |
|---|---|---|---|
| Coordinate presentation, 191 | g=1; scalar 2; multiplier 1; zero test algebra | GL₂ determinant, scalar multiplier 4 and Sp fibre agree | R02–R03 |
| Weight lattice, 240 | g=0,1,2; m=−1; u=0,±e_i | Pullback parity and scalar degree agree | R03, R12 |
| Diagonal torus, 280 | g=1, t=6,z=2; t=1; scalar c | diag(2,3), Sp fibre, scalar c² agree | R09 |
| Reciprocal Weyl action, 316 | g=0–3; negative exponents; ordinary inversion control | Relations and degree preserved; ordinary inversion differs | R03 |
| Central cover, 360 | g=1,2; diag(I,2I) over Q; μ₂; odd/even degrees | Q-point lifting fails as acknowledged; fppf/parity statements hold | R06, R09 |
| Representation ring, 426 | zero object; tensor unit; direct sum | SplitK0 formulas agree with native API | R02–R03, R06 |
| Standard representation, 467 | g=1,2; degree 0 and >2g exterior powers | Matrix convention and weights agree | R03, R08 |
| Multiplier line, 506 | m=−1,0,1; g=1 | Inverse twist and determinant convention agree | R03 |
| Primitive powers, 539 | k=0,1,2; e₁∧f₁; scalar 2 | Correct ν twist and contraction sign | R03, R11 |
| Primitive decomposition, 583 | g=1,2,3; k=1 and k=g | Dimensions 2,5,14 and signed correction agree | R03 |
| Hom/weight base change, 611 | zero/unit objects; Q→Q,C; infinite K not embedding in C | Hom comparison and invertible-locus argument hold | R06, R10 |
| Rational model, 650 | zero weight; fundamental weight; m=−1; g=1 | Cartan tensor construction and twists agree | R06–R07 |
| Classification, 688 | g=1; negative determinant powers; arbitrary char-zero extensions | No missing field hypothesis in intended theorem | R07 |
| Scalar-extension ring, 713 | Q→Q,C; unit and simple classes | Ring equivalence is compatible; category equivalence is correctly not claimed | R03, R07 |
| Formal character, 795 | zero/unit; V; ν⁻¹; zero test algebra | Integral coefficients, trace and augmentation agree | R03, R07 |
| Injectivity, 842 | two distinct determinant twists; maximal supported weight | Triangularity argument works without total ordering | R03 |
| Exterior polynomials, 866 | k=−1,0,1,2,2g,2g+1; g=1–3 | F₁=E₁; F₂=x₁x₂+t at g=2 | R03 |
| Full invariant presentation, 911 | g=0,1,2; odd orbit coefficient; zero orbit | Integral recurrence and triangular generator change hold | R03, R11 |
| Primitive characters, 946 | g=1,2; all variables 1 | Correct dimensions and ν correction | R03 |
| Rational character equivalence, 968 | GL₂; unit; ν⁻¹ | Stated generator map agrees with Yu | R03 |
| Positive subring, 1048 | g=0,1,2; t,t⁻¹,z⁻¹,t/z; negative coefficient | Positive-rank support criterion holds; typed rank-zero theorem fails | R01 |
| Positive invariant presentation, 1086 | g=1,2; orbit coefficient 1; t⁻¹ excluded | No division and no negative t exponents required | R03, R11 |
| Tensor constituent subring, 1121 | d=0,2; g=1; ring generated by V alone | ν is a constituent but is not polynomial in V alone | R03 |
| Occurrence criterion, 1157 | m=−1,0,1; u=0,1; d=0,1,2; g=1,2 | m≥0 and exact central degree are necessary and sufficient | R03 |
| Tensor character equivalence, 1180 | unit; ν; P₁; ν⁻¹ | Positive polynomial ring agrees with the constituent span | R03 |
| Integral generation/localization, 1216 | negative twists; k=1; rank one | Clearing ν denominators and zero negative exterior term agree | R03 |

Characteristic 2/3, nonsplit groups and inseparable coefficient-field extensions do not satisfy the standing representation hypotheses; no semisimplicity conclusion was inferred there. The Laurent calculations use integral coefficients and do not average by the Weyl order. Empty support and the zero module give zero characters; the zero coefficient field is excluded by `Field`, while the permitted zero test algebra causes no multiplier-uniqueness counterexample.

The declaration ledger below uses lexical context codes: `A` = universes u,v, no section variables; `B` = universes u,v and section variables `{K : Type u} [Field K] [CharZero K] {g : ℕ} [Fact (0 < g)]`, with no `include`. Each declaration also has its written local binders. Unused section assumptions disappear from admitted theorem types; R01 records the false consequence. Case codes refer to the target-table tests: `W` = lattice/torus/Weyl boundaries; `R` = zero/unit representations, g=1,2, negative twists and field extension; `C` = exterior/character/invariant cases; `P` = positive-cone/tensor-occurrence boundaries. `D` means admitted data or proof fields; `H` means the intended statement depends on those data; `E` means an admitted example. The full written signatures and instance contexts are also preserved in the scratch declaration table.

| Declaration / Lean line | Layer; context | Cases | Result | Change |
|---|---|---|---|---|
| `rankOnePositive`, 51 | CG.0; A | W | D | R03 |
| `rankTwoPositive`, 52 | CG.0; A | W | D | R03 |
| `Weight`, 56 | CG.0; A | W | Pass | R05/R12 |
| `multiplierWeight`, 58 | CG.0; A | W | Pass | R05/R12 |
| `standardWeight`, 60 | CG.0; A | W | Pass | R05/R12 |
| `centralDegree`, 62 | CG.0; A | W | D | R03 |
| `centralDegree_apply`, 64 | CG.0; A | W | H | R03 |
| `DominantWeight`, 67 | CG.0; A | W | Pass | R05/R12 |
| `coverWeight`, 70 | CG.0; A | W | D | R03 |
| `coverWeight_apply`, 72 | CG.0; A | W | H | R03 |
| `simpleRoot`, 75 | CG.0; A | W | Pass | R05/R12 |
| `RootLE`, 79 | CG.0; A | W | Pass | R05/R12 |
| `Laurent`, 82 | CG.0; A | W | Pass | R05/R12 |
| `monomial`, 84 | CG.0; A | W | Pass | R05/R12 |
| `t`, 87 | CG.0; A | W | Pass | R05/R12 |
| `tInv`, 89 | CG.0; A | W | Pass | R05/R12 |
| `z`, 91 | CG.0; A | W | Pass | R05/R12 |
| `pairedZ`, 93 | CG.0; A | W | Pass | R05/R12 |
| `permWeight`, 96 | CG.0; A | W | D | R03 |
| `flipWeight`, 98 | CG.0; A | W | D | R03 |
| `permWeight_apply`, 100 | CG.0; A | W | H | R03 |
| `flipWeight_apply`, 103 | CG.0; A | W | H | R03 |
| `permLaurent`, 106 | CG.0; A | W | D | R03 |
| `flipLaurent`, 108 | CG.0; A | W | D | R03 |
| `permLaurent_monomial`, 110 | CG.0; A | W | H | R03 |
| `flipLaurent_monomial`, 113 | CG.0; A | W | H | R03 |
| `flipLaurent_involutive`, 116 | CG.0; A | W | H | R03 |
| `flipLaurent_commute`, 119 | CG.0; A | W | H | R03 |
| `permLaurent_flip`, 122 | CG.0; A | W | H | R03 |
| `centralDegree_weyl`, 125 | CG.0; A | W | H | R03 |
| `invariantSubring`, 129 | CG.0; A | W | D | R03 |
| `mem_invariantSubring`, 131 | CG.0; A | W | H | R03 |
| `coordinateHopfAlgebra`, 136 | CG.0; A | W | D | R03 |
| `matrixEntry`, 142 | CG.0; B | W | D | R03 |
| `multiplierCoordinate`, 145 | CG.0; B | W | D | R03 |
| `pointsEquiv`, 148 | CG.0; B | W | D | R03 |
| `coordinateHopfAlgebra_rank_one`, 155 | CG.0; B | W | D | R03 |
| `torusRestriction`, 158 | CG.0; B | W | D | R03 |
| `torusMatrix`, 161 | CG.0; B | W | D | R03 |
| `torusRestriction_matrixEntry`, 168 | CG.0; B | W | H | R03 |
| `torusRestriction_multiplier`, 171 | CG.0; B | W | H | R03 |
| `diagonalMatrix`, 175 | CG.0; B | W | D | R03 |
| `centralCover`, 181 | CG.0; B | W | D | R03 |
| `centralCover_entry`, 186 | CG.0; B | W | H | R03 |
| `centralCover_point_lift`, 192 | CG.0; B | W | H | R03 |
| `centralCover_weight_parity`, 201 | CG.0; B | W | H | R03 |
| `RatRep`, 206 | CG.1; B | R | H | R03 |
| `weightSpace`, 209 | CG.1; B | R | H | R03 |
| `ratRepEssentiallySmall`, 215 | CG.1; B | R | D | R03 |
| `ratRepMonoidalPreadditive`, 218 | CG.1; B | R | D | R03 |
| `ratRepLinear`, 221 | CG.1; B | R | D | R03 |
| `ratRepHomFinite`, 223 | CG.1; B | R | D | R03 |
| `repRing`, 225 | CG.1; B | R | H | R03 |
| `classOf`, 228 | CG.1; B | R | H | R03 |
| `classOf_tensor`, 230 | CG.1; B | R | H | R03 |
| `dimension`, 233 | CG.1; B | R | D | R03 |
| `dimension_classOf`, 236 | CG.1; B | R | H | R03 |
| `standard`, 239 | CG.1; B | R | D | R03 |
| `standardCoordinates`, 242 | CG.1; B | R | D | R03 |
| `unitTensorCoordinates`, 245 | CG.1; B | R | D | R03 |
| `standard_finrank`, 247 | CG.1; B | R | H | R03 |
| `standard_coaction`, 249 | CG.1; B | R | H | R03 |
| `standard_point_action`, 255 | CG.1; B | R | H | R03 |
| `exteriorStandard`, 263 | CG.1; B | R | D | R03 |
| `exteriorCoordinates`, 266 | CG.1; B | R | D | R03 |
| `tensorStandard`, 269 | CG.1; B | R | D | R03 |
| `tensorStandard_zero`, 272 | CG.1; B | R | H | R03 |
| `tensorStandard_succ`, 274 | CG.1; B | R | H | R03 |
| `multiplier`, 277 | CG.1; B | R | D | R03 |
| `multiplierCoordinates`, 280 | CG.1; B | R | D | R03 |
| `multiplier_coaction`, 282 | CG.1; B | R | H | R03 |
| `multiplier_tensor`, 288 | CG.1; B | R | H | R03 |
| `multiplierClass`, 291 | CG.1; B | R | D | R03 |
| `multiplierClass_coe`, 294 | CG.1; B | R | H | R03 |
| `multiplierClass_inv_coe`, 297 | CG.1; B | R | H | R03 |
| `contraction`, 300 | CG.1; B | R | D | R03 |
| `primitive`, 303 | CG.1; B | R | D | R03 |
| `primitiveInclusion`, 306 | CG.1; B | R | D | R03 |
| `primitiveInclusion_kernel`, 309 | CG.1; B | R | H | R03 |
| `alternatingForm`, 314 | CG.1; B | R | D | R03 |
| `alternatingForm_coordinates`, 316 | CG.1; B | R | H | R03 |
| `wedgeTwo`, 322 | CG.1; B | R | H | R03 |
| `multiplierTwoTarget`, 325 | CG.1; B | R | D | R03 |
| `contraction_pair`, 328 | CG.1; B | R | H | R03 |
| `Simple`, 332 | CG.1; B | R | H | R03 |
| `IsSummand`, 335 | CG.1; B | R | H | R03 |
| `fundamentalIndex`, 338 | CG.1; B | R | D | R03 |
| `fundamentalWeight`, 340 | CG.1; B | R | D | R03 |
| `zeroWeight`, 343 | CG.1; B | R | D | R03 |
| `twistWeight`, 345 | CG.1; B | R | D | R03 |
| `primitiveExteriorDecomposition`, 348 | CG.1; B | R | H | R03 |
| `scalarExtend`, 363 | CG.1; B | R | D | R03 |
| `coordinateBaseChange`, 367 | CG.1; B | R | D | R03 |
| `scalarExtendCoordinates`, 371 | CG.1; B | R | D | R03 |
| `scalarExtend_coaction`, 375 | CG.1; B | R | H | R03 |
| `scalarExtend_map`, 383 | CG.1; B | R | H | R03 |
| `baseChange`, 388 | CG.1; B | R | H | R03 |
| `baseChangeAdditive`, 391 | CG.1; B | R | D | R03 |
| `baseChangeMonoidal`, 393 | CG.1; B | R | D | R03 |
| `baseChangeBraided`, 395 | CG.1; B | R | D | R03 |
| `baseChangeCoordinates`, 397 | CG.1; B | R | H | R03 |
| `scalarExtendAdditive`, 400 | CG.1; B | R | D | R03 |
| `scalarExtendMonoidal`, 403 | CG.1; B | R | D | R03 |
| `scalarExtendBraided`, 406 | CG.1; B | R | D | R03 |
| `homBaseChange`, 409 | CG.1; B | R | D | R03 |
| `homBaseChange_tmul`, 414 | CG.1; B | R | H | R03 |
| `scalarExtend_reflectsIso`, 418 | CG.1; B | R | H | R03 |
| `homAndWeightBaseChange`, 422 | CG.1; B | R | H | R03 |
| `irreducible`, 431 | CG.1; B | R | D | R03 |
| `irreducible_zero`, 434 | CG.1; B | R | H | R03 |
| `irreducible_multiplier_twist`, 437 | CG.1; B | R | H | R03 |
| `rationalHighestWeightClassification`, 441 | CG.1; B | R | H | R03 |
| `scalarExtensionRingEquiv`, 455 | CG.1; B | R | D | R03 |
| `scalarExtensionRingEquiv_classOf`, 458 | CG.1; B | R | H | R03 |
| `formalCharacter`, 463 | CG.2; B | C | D | R03 |
| `formalCharacter_coeff`, 465 | CG.2; B | C | H | R03 |
| `restrictionCharacter`, 469 | CG.2; B | C | D | R03 |
| `restrictionCharacter_classOf`, 472 | CG.2; B | C | H | R03 |
| `evaluateLaurent`, 475 | CG.2; B | C | D | R03 |
| `evaluateLaurent_monomial`, 478 | CG.2; B | C | H | R03 |
| `torusPoint`, 483 | CG.2; B | C | D | R03 |
| `torusPoint_matrix`, 486 | CG.2; B | C | H | R03 |
| `tensorScalarFree`, 490 | CG.2; B | C | D | R03 |
| `tensorScalarFinite`, 493 | CG.2; B | C | D | R03 |
| `formalCharacter_evaluate`, 496 | CG.2; B | C | H | R03 |
| `characterInjective`, 501 | CG.2; B | C | H | R03 |
| `exteriorCharacter`, 503 | CG.2; B | C | D | R03 |
| `fundamentalCharacter`, 505 | CG.2; B | C | H | R03 |
| `pairSum`, 508 | CG.2; B | C | H | R03 |
| `exteriorCharacter_generating`, 510 | CG.2; B | C | H | R03 |
| `fundamentalCharacter_invariant`, 514 | CG.2; B | C | H | R03 |
| `MultLaurent`, 517 | CG.2; B | C | H | R03 |
| `coeffT`, 519 | CG.2; B | C | H | R03 |
| `coeffTInv`, 521 | CG.2; B | C | H | R03 |
| `coefficientIntoInvariant`, 523 | CG.2; B | C | D | R03 |
| `invariantCoeffAlgebra`, 525 | CG.2; B | C | H | R03 |
| `fullInvariantEquiv`, 528 | CG.2; B | C | D | R03 |
| `fullInvariantEquiv_variable`, 531 | CG.2; B | C | H | R03 |
| `fullInvariantEquiv_multiplier`, 534 | CG.2; B | C | H | R03 |
| `primitiveCharacterIdentity`, 538 | CG.2; B | C | H | R03 |
| `rationalCharacterEquiv`, 543 | CG.2; B | C | D | R03 |
| `rationalCharacterEquiv_classOf`, 546 | CG.2; B | C | H | R03 |
| `fundamentalInvariant`, 549 | CG.2; B | C | H | R03 |
| `multiplierInvariant`, 552 | CG.2; B | C | D | R03 |
| `inverseMultiplierInvariant`, 554 | CG.2; B | C | D | R03 |
| `rationalCharacterEquiv_fundamental`, 556 | CG.2; B | C | H | R03 |
| `positiveSubring`, 564 | CG.3; B | P | H | R03 |
| `positiveInvariantSubring`, 567 | CG.3; B | P | H | R03 |
| `coneValue`, 570 | CG.3; B | P | H | R03 |
| `mem_positiveSubring`, 572 | CG.3; B | P | False at g=0 | R01 |
| `positiveSubring_weyl_stable`, 576 | CG.3; B | P | H | R03 |
| `positiveInvariantEquiv`, 580 | CG.3; B | P | D | R03 |
| `positiveInvariantEquiv_multiplier`, 583 | CG.3; B | P | H | R03 |
| `positiveInvariantEquiv_variable`, 586 | CG.3; B | P | H | R03 |
| `TensorConstituent`, 590 | CG.3; B | P | H | R03 |
| `tensorConstituentSubring`, 593 | CG.3; B | P | H | R03 |
| `mem_tensorConstituentSubring`, 597 | CG.3; B | P | H | R03 |
| `tensorConstituentSubring_tensor`, 601 | CG.3; B | P | H | R03 |
| `tensorConstituentCriterion`, 605 | CG.3; B | P | H | R03 |
| `tensorMultiplier`, 609 | CG.3; B | P | D | R03 |
| `tensorPrimitive`, 613 | CG.3; B | P | D | R03 |
| `positiveMultiplier`, 616 | CG.3; B | P | D | R03 |
| `positiveFundamental`, 619 | CG.3; B | P | D | R03 |
| `tensorCharacterEquiv`, 622 | CG.3; B | P | D | R03 |
| `tensorCharacterEquiv_coe`, 626 | CG.3; B | P | H | R03 |
| `tensorCharacterEquiv_generators`, 630 | CG.3; B | P | H | R03 |
| `tensorGenerator`, 634 | CG.3; B | P | H | R03 |
| `exteriorClass`, 640 | CG.3; B | P | H | R03 |
| `integralTensorGeneration`, 643 | CG.3; B | P | H | R03 |
| `scalarPoint`, 658 | Checks; B | P | D | R03 |
| `scalarPoint_matrix`, 660 | Checks; B | P | H | R03 |
| `multiplierOneIdeal`, 664 | Checks; B | P | D | R03 |
| `multiplierOneIdeal_toIdeal`, 667 | Checks; B | P | H | R03 |
| `coordinate.test_rank_one`, 672 | Checks; B | W | E | R04 |
| `coordinate.test_multiplier_one`, 677 | Checks; B | W | E | R04 |
| `coordinate.test_scalar`, 681 | Checks; B | W | E | R04 |
| `weight.test_multiplier_degree`, 685 | Checks; B | W | E | R04 |
| `weight.test_negative_twist`, 689 | Checks; B | W | E | R04 |
| `weight.test_parity`, 693 | Checks; B | W | E | R04 |
| `torus.test_rank_one`, 697 | Checks; B | W | E | R04 |
| `torus.test_symplectic_fibre`, 703 | Checks; B | W | E | R04 |
| `torus.test_scalar`, 708 | Checks; B | W | E | R04 |
| `weyl.test_reciprocal`, 712 | Checks; B | W | E | R04 |
| `weyl.test_multiplier`, 716 | Checks; B | W | E | R04 |
| `weyl.test_standard_character`, 722 | Checks; B | W | E | R04 |
| `weyl.test_wrong_inversion`, 725 | Checks; B | W | E | R04 |
| `ring.test_unit`, 729 | Checks; B | R | E | R04 |
| `ring.test_zero`, 732 | Checks; B | R | E | R04 |
| `ring.test_biproduct`, 735 | Checks; B | R | E | R04 |
| `standard.test_rank_one`, 738 | Checks; B | R | E | R04 |
| `standard.test_exterior_zero`, 745 | Checks; B | R | E | R04 |
| `standard.test_torus_weights`, 749 | Checks; B | R | E | R04 |
| `multiplier.test_zero`, 754 | Checks; B | R | E | R04 |
| `multiplier.test_rank_one`, 757 | Checks; B | R | E | R04 |
| `multiplier.test_negative`, 760 | Checks; B | R | E | R04 |
| `primitive.test_zero`, 764 | Checks; B | R | E | R04 |
| `primitive.test_rank_two`, 768 | Checks; B | R | E | R04 |
| `primitive.test_twist`, 771 | Checks; B | R | E; nondiscriminating | R04/R11 |
| `irreducible.test_standard`, 779 | Checks; B | R | E | R04 |
| `irreducible.test_multiplier_inverse`, 782 | Checks; B | R | E | R04 |
| `symmetricStandard`, 785 | Checks; B | P | D | R03 |
| `symmetricCoordinates`, 788 | Checks; B | P | D | R03 |
| `irreducible.test_rank_one`, 793 | Checks; B | R | E | R04 |
| `baseChange.test_identity`, 798 | Checks; B | R | E | R04 |
| `baseChange.test_standard`, 801 | Checks; B | R | E | R04 |
| `baseChange.test_simple`, 805 | Checks; B | R | E | R04 |
| `character.test_unit`, 809 | Checks; B | C | E | R04 |
| `character.test_standard`, 813 | Checks; B | C | E | R04 |
| `character.test_multiplier_inverse`, 816 | Checks; B | C | E | R04 |
| `character.test_dimension`, 821 | Checks; B | C | E | R04 |
| `exterior.test_negative`, 825 | Checks; B | C | E | R04 |
| `exterior.test_first`, 828 | Checks; B | C | E | R04 |
| `exterior.test_rank_two`, 832 | Checks; B | C | E | R04 |
| `exterior.test_top`, 836 | Checks; B | C | E | R04 |
| `fullInvariant.test_rank_one`, 839 | Checks; B | C | E | R04 |
| `fullInvariant.test_rank_two`, 843 | Checks; B | C | E | R04 |
| `fullInvariant.test_integral`, 847 | Checks; B | C | E; nondiscriminating | R04/R11 |
| `characterEquiv.test_rank_one`, 851 | Checks; B | C | E | R04 |
| `characterEquiv.test_unit`, 856 | Checks; B | C | E; nondiscriminating | R04/R11 |
| `characterEquiv.test_inverse_multiplier`, 859 | Checks; B | C | E | R04 |
| `positive.test_multiplier`, 863 | Checks; B | P | False at g=0 | R01 |
| `positive.test_inverse_multiplier`, 866 | Checks; B | P | E | R04 |
| `positive.test_signed_coefficients`, 869 | Checks; B | P | E | R04 |
| `positive.test_boundary`, 872 | Checks; B | P | E | R04 |
| `positiveInvariant.test_rank_one`, 876 | Checks; B | P | E | R04 |
| `positiveInvariant.test_inverse_excluded`, 880 | Checks; B | P | E | R04 |
| `positiveInvariant.test_constant`, 884 | Checks; B | P | E; nondiscriminating | R04/R11 |
| `tensorSubring.test_degree_zero`, 887 | Checks; B | P | E | R04 |
| `tensorSubring.test_rank_one_multiplier`, 892 | Checks; B | P | E | R04 |
| `tensorSubring.test_standard_only`, 896 | Checks; B | P | E | R04 |
| `tensorCharacter.test_rank_one`, 900 | Checks; B | P | E | R04 |
| `tensorCharacter.test_inverse_multiplier`, 906 | Checks; B | P | E | R04 |
| `tensorCharacter.test_boundary`, 909 | Checks; B | P | E | R04 |

## Not verifiable

- Lean elaboration, inferred universes and fully elaborated signatures were not executed: this pass prohibits Lean builds. The missing import is established directly from the pinned file tree. The rank-zero failure follows from the written types and Lean's unused-section-variable rule; it is not represented as an executed `#check`.
- The admitted data definitions do not specify certified constructions. Claims depending on them were checked against the README's intended mathematics, not certified as theorems about an implemented Hopf algebra or representation category.
- The absent supplier interfaces in R06 cannot be certified as imports from current supplier sections. Declaring precise gaps or adding properly owned targets remains repair work.
- No source was inaccessible. No source request or waiver is needed for the three cited works.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8932cf55069fc33549d48b0582625608ce18532e", "job": "RT-ClassicalGroupsPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
