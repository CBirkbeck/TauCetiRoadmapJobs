# PKG-AnalyticStacks

Package written from the accepted design (`packages/AnalyticStacks/design/README.md`, `design/plan.json`, review `REV-DESIGN-AnalyticStacks~2`, accepted with five P3 notes, conditional on `gap:nuclear-hom-criterion`). Files written: `packages/AnalyticStacks/README.md`, `packages/AnalyticStacks/Suggested.lean`, `packages/AnalyticStacks/metadata.toml` (`topic = "math.AG"`, the form of the roadmap folders on main), `packages/AnalyticStacks/sources.toml` (locators and `cited_for` updated, no new work). `design/plan.json`: its `gaps` list already holds the one needed gap and is unchanged.

All 60 targets, their API lists, the 180 Checks and the Examples of the design are kept (60 `**Checks.**` lists, none below three bullets, 186 Check bullets in all, no section with fewer than the design; eight layers, each ending with `### Examples` and `### Dependencies`; the heading structure is the design's, heading for heading). Checks were added where a statement needed a witness or a library comparison.

## Repairs after the worker's checks

The worker's checks on the earlier draft found two problems. Both are repaired, and one further inconsistency found in the audit is fixed.

- **TeX-only syntax (`tex=430`).** The count was of TeX-only `_{…}` and `^{…}` outside code spans in the earlier README; the three quoted lines were its first hits, the Conventions paragraphs "Light condensed objects", "Indexing" and "Signs and normalisations" (the blanks in the quotation are code spans, which the scanner blanks). It was not a copied passage. The README in place writes these subscripts and superscripts as `_(…)` and `^(…)`, 382 occurrences, the notation the roadmaps on main use outside code spans (BordismFormalGroups has 220 such occurrences). I checked the result: no `_{`, `^{` or TeX macro is left outside code; every README line has balanced parentheses; the headings agree with the design's except that 3.6 now reads `ℚ_(p,■)`; the README has no internal `](#…)` links to update. The gate's `tex` count is 0. To rule out copied text as well, I compared the README with all 27 cached source extractions by word 8-grams. The only runs of 11 or more shared words are bibliography titles, author lists, formula fragments and the one-line definition of a Fredholm analytic ring (12 words). None is longer than 16 words.
- **Undeclared gap `light-measure-site-comparison`.** The README named this gap in the SolidAnalyticRings contract, as the condition of SolidAnalyticRings §7.4. It is SolidAnalyticRings' own gap: SolidAnalyticRings declares it at its head, against VStackSheavesAndLisseCategories VS2.2, in its own supplier contract, and its §7.4 *Needs:* line cites it. This roadmap uses SolidAnalyticRings §7.4 only in two comparison Checks, the (ℚ_p, ℤ_p)_■[S] Check of 2.11 and the `ZSolidAnalytification` Check of 3.4. No *Needs:* line names §7.4: 0 of 60, and those that cite SolidAnalyticRings at all cite §§1.5, 2.3 and 7.1–7.3 only. So the package does not need the site comparison itself. Declaring the gap in `design/plan.json` would announce SolidAnalyticRings' request on VStackSheavesAndLisseCategories a second time, and it would make this roadmap's acceptance conditional on something no target of it uses. Instead, the contract now describes in prose what §7.4 proves and the site comparison it rests on, without the `gap:` token, and adds that §7.4 enters only those Checks and no target. `design/plan.json` is unchanged: its `gaps` list holds `nuclear-hom-criterion` only, which is the only `gap:` slug the README now names.
- **Wrong Check reference in the VStackSheavesAndLisseCategories contract.** It said VS2.2 was consumed through "the comparison Checks of 2.9 and 3.4". Section 2.9 does not mention VS2.2; the Check is in 2.11. The contract now says 2.11 and 3.4.

## Headline theorems

| Headline (README) | Status | Lean name, or what is missing at the pins |
| --- | --- | --- |
| Liu–Zheng restricted-diagonal theorem, 0.3(1) (LZ12b Theorem 4.27; SixFF Theorem 4.8) | **stated** | `TauCetiRoadmap.AnalyticStacks.restrictedDiagonalMap_isEquivalence_hoFunctor`, with the definitions `bisimplex`, `compactificationBisimplex`, `restrictedDiagonal`, `restrictedDiagonalMap` on Mathlib's `SSet`, internal Hom, `MonoidalClosed.pre` and `SSet.hoFunctor` |
| Liu–Zheng gluing of restricted multisimplicial nerves, 0.3(2) (LZ12b Theorem 5.4) | not statable | pullback squares in a quasicategory, needed for the nerves `C^cart_{E_1,…,E_k}`; Mathlib's quasicategories carry no limits |
| Construction principle, 0.5 (HM Proposition 3.3.3) | not statable | `Cat∞`, `CAlg(Cat∞)`, ∞-operads, the symmetric monoidal ∞-category `Corr(C, E)` |
| Extension to sheaves, 0.6 (HM Theorem 3.4.11) | not statable | the same, plus ∞-topoi of sheaves of anima |
| Künneth !-descent and the ∞-topos of D-stacks, 0.12–0.13 | not statable | `Pr^L` with Lurie's tensor product, left exact localizations of ∞-topoi |
| Quasi-coherent six-functor formalism on `AnStk(C₀)`, 3.3 | not statable | light condensed animated rings, analytic rings, the !-able class, localization at !-equivalences |
| Realization of algebraic stacks, 3.8 | not statable | the ∞-topos of algebraic stacks in the !-topology and its quasi-coherent ∞-categories |
| Classifying-stack duality for locally profinite groups, 4.2 | not statable | the ∞-topos of light condensed anima, `D(−, Λ)` as a six-functor formalism, suave objects, the derived ∞-category of smooth representations |
| Solid Serre duality `f^!1 ≅ det(L_f)[n]`, 6.6 | not statable | solid Huber rings, the analytic cotangent complex, `f^!` on their module ∞-categories, determinants |
| Stacky Cartier duality, 7.6 | not statable | kernel categories of Künneth formalisms, bialgebras in linear presentable ∞-categories, ring stacks, transmutation |

The missing carriers were confirmed at the pins by grep over the pinned Mathlib and Tau Ceti trees: `SixFunctor`, `AnalyticRing`, `∞-topos`/`InfinityTopos`, `suave`, `Descendable`, `CondensedRing` have zero hits in both; Mathlib's `Presentable` files are locally presentable 1-categories; Mathlib's quasicategory files (`Quasicategory/Basic`, `StrictBicategory`, `TwoTruncated`, `InnerFibration`) define no limits. The design review named six headlines (0.6, 3.3, 3.8, 4.2, 6.6, 7.6) and judged none statable; 0.3(1) is a deep theorem of Layer 0 that turns out to be statable on Mathlib's simplicial sets with four short definitions, so it is stated (a statable headline left out would be a defect).

## Suggested.lean

The statement quantifies over every bisimplicial set `X : SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u` and every quasicategory `Q`, and asserts that `SSet.hoFunctor` sends precomposition with `restrictedDiagonalMap X` to an equivalence `h Fun(δ*₂∇X, Q) → h Fun(δ*₂X, Q)`. Quantified over all quasicategories (including `Fun(K, Q)`), this is the categorical-equivalence property of SixFF Theorem 4.8, by the Yoneda lemma in `SSet.QCat.bicategory`; no notion of categorical equivalence is defined in the file, so the file does not duplicate BordismFormalGroups F6.5 (owner of categorical equivalences, consumed through EnhancedDerivedSheaves E0.2). The source of `restrictedDiagonalMap X` is `n ↦ Hom(Δ^{n,n}, X)`, the diagonal by the Yoneda lemma, as LZ12b itself identifies it before Theorem 4.27. The orientation of `Cpt_n` is the source's (vertices `(i, j)` with `i ≤ j`, LZ12b line 1054; the condition in the definition is `α a ≤ β b`). In the scratch file of the `#check` pass, two proved examples check the orientation at `n = 1` on `compactificationBisimplex` itself, at bidegree `([0], [0])`. A point of that type exists whose underlying pair is `(const 0, const 1)`. No point has underlying pair `(const 1, const 0)`: the defining predicate at the vertices `0, 0` would give `1 ≤ 0`. Both elaborate without error. They are not in `Suggested.lean`.

**Elaboration.** `lake env lean <absolute path of packages/AnalyticStacks/Suggested.lean>`, run from the content checkout at the pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf: exit 0. The output is exactly one message, `Suggested.lean:102:8: warning: declaration uses `sorry`` (the theorem), so the count of `sorry` warnings is 1. There is no other message. I re-ran it after the README repairs; the file itself is unchanged. Imports: the single line `import Mathlib`. No `set_option`, no `lemma`, no sorry'd data: the four definitions have real bodies, and their functor laws are discharged by the default `aesop_cat` proofs.

**`#check` pass.** I re-ran the pass this round. One scratch file held a copy of the file's declarations, `#check @` lines for all five and the two orientation examples, and I elaborated it once with `lake env lean` from the content checkout: exit 0, with the one `sorry` warning of the theorem. I compared each elaborated type with its README statement in 0.3:

- `bisimplex : SimplexCategory ⥤ SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u`.
- `compactificationBisimplex`: same type.
- `restrictedDiagonal : (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u) → SSet`.
- `restrictedDiagonalMap X : bisimplex.op ⋙ yoneda.obj X ⟶ restrictedDiagonal X`.
- `restrictedDiagonalMap_isEquivalence_hoFunctor : ∀ X (Q : SSet) [Q.Quasicategory], (SSet.hoFunctor.map ((MonoidalClosed.pre (restrictedDiagonalMap X)).app Q)).toFunctor.IsEquivalence`.

The universe is the single `u` of the file (the `#check` output prints it as `u_1`). The file has no `variable` block, so every binder is in the declaration's own signature and none can be lost; in particular `[Q.Quasicategory]` is in the theorem's type. The types match the README, and nothing changed. Every library name the README cites was also checked at the pins. A second scratch file of `#check @` lines resolved all 28 Mathlib names (exit 0, no error), `AbstractMeasure.amiceTransformEquiv` among them, at Mathlib `NumberTheory/Padics/Measure/AmiceTransform.lean:157`. The three Tau Ceti names are at their files: `TauCeti.Huber.Pair` at `RingTheory/Huber/Pair.lean:138`, `TauCeti.ValuationSpectrum.spa` at `AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101` and `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` at `AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271`. `Algebra.CotangentComplex` is not a Mathlib name. The README cites it as the target of DerivedModuleAlgebra §0.4, whose README gives it that signature.

## Corrections to the design and the review

- **F01** (0.3), applied: Cpt_n is spanned by the vertices with 0 ≤ i ≤ j ≤ n, as LZ12b line 1054 says. I added a Check that pins the orientation (Cpt₁ omits (1, 0); it has four of the six (1, 0)-bisimplices).
- **F02** (0.5, third Check), corrected differently. The suggested repair is false. It claims that the Cartesian formalism `Fun(X, Ani)` satisfies (b), with `S × ∏_n T_n ≅ ∏_n (S × T_n)`. In fact `∏_n (S × T_n) = S^ℕ × ∏_n T_n`, so the map is the diagonal of S. For S with two points and every T_n = ∗, the left side has 2 elements and the right side 2^ℵ₀. The failure already happens for p = ({1, 2} → ∗): the projection map S × p_*∗ → p_*(p*S × ∗) is S → S × S, with image of size 2 out of 4. So (b) fails there too, and that Check would again refute a hypothesis that does not hold. A genuine instance where (a) and (b) hold but (c) fails needs an exotic D₀, and none is in the sources: HM Lemma 3.3.4 and SixFF Remark 4.2 explain why (c) is usually automatic. The section therefore has these Checks instead:
  - (c) for a non-monomorphism j = f = ({1, 2} → ∗) over finite sets: both sides are ⊕_{m,n} S_{mn}, by HM Lemma 3.3.4 and additivity.
  - Infinite fibres are excluded by the hypotheses, as the conclusion requires: SixFF Construction 4.3 would force f_♮ ≅ f_* on I ∩ P. Accordingly (b) fails for `Fun(X, D(Λ))`: the identity matrix lies in ∏_n ⊕_m Λ but not in ⊕_m ∏_n Λ. The Cartesian variant also fails (b), with the diagonal witness above.

  I also corrected the second Check: its square "j: 𝔾_m → 𝔸¹, p: ℙ¹ → ∗" was not a cospan, and it is now j with f: ℙ¹ × 𝔸¹ → 𝔸¹. The plan.json test `conditionCNeeded` keeps the design's wording, because only the `gaps` list of plan.json may change. The README is authoritative.
- **F03** (2.7(7), 2.8(3)), applied: "preserves non-empty colimits (Man22 Proposition 2.9.6(ii), Man22 line 4946), that is, all colimits as a functor to analytic rings over ℤ_■". I added a negative-control Check to 2.7: the initial ring ℤ goes to ℤ_■, while the initial analytic ring is ℤ^cond. The plan.json statement of 2.7 is unchanged, for the same reason.
- **F04** (How to read the build), applied with every *Needs:* line checked. Layer 5 uses only Layer 2. Layers 4, 6 and 7 use Layers 0–3. The only further edges are that Layer 6 uses Layer 5 and Layer 7 uses 4.1 and 6.4. The paragraph also said "the properness of qcqs maps of schemes", but 1.3 proves that they are prim; it now says "primness".
- **F05** (4.5, third Check), applied: the proof route breaks for a non-Fredholm C₀. CS22 Example 9.6 (CS22 line 3612, verified) is not a failure of descent. The plan.json test `fredholmNeeded` is unchanged.
- **Citation fixes found in the sweep:**
  - 0.3's *Needs:* cited "EnhancedDerivedSheaves E0.5 (categorical equivalences)". E0.5 is "Coherent nerves, Cat∞ and Spaces". Categorical equivalences are E0.2, supplied there by BordismFormalGroups F6.5. Fixed in 0.3, the EnhancedDerivedSheaves contract, the Scope and the Layer 0 Dependencies.
  - The Mathlib contract said "the solid spectrum of 2.8"; it is defined in 2.10 (RCSolid Definition 7.2.7). Fixed.
- **Wording:**
  - 0.1, third Check: "right cancellation is not right cancellation in the other variable" became a precise statement.
  - 0.3, k = 2 Check: "the map of nerves is not full" became "the edges in the image are invertible, so it is not an equivalence as soon as E₀ has a non-invertible map".
  - 2.7, second Check: the informal "Σ pⁿTⁿ = Σ 1" became the computation b_n − T·b_{n+1} = 0.
  - The Downstream consumers and "Left to other roadmaps" bullets were made definite and timeless: "outside this roadmap", "consumes", "is its own".

## Added content (with the reason)

- **0.3:**
  - The four definitions of the Lean statement in prose, with their API list:
    - `bisimplex` represents bisimplices;
    - Cpt_n is the union of the Δ^k ⊠ Δ^{n−k} (LZ12b line 1057);
    - the restricted diagonal of Cpt_n is the nerve of the poset Cpt(n) (LZ12b Example 4.28);
    - the map is a bijection on vertices.
  - Two Checks: the edges Check (the map is neither injective nor surjective on edges in general), and the orientation Check.
- **Scope and ownership:**
  - Concrete six-functor formalisms: DiamondSixOperations Layers S0–S4, and VStackSheavesAndLisseCategories VS1.1 (`KernelCategory`), VS3.1 (`SolidKernelCategory`) and VS4.2. None is consumed.
  - SchemeAndStackFoundations §5.5, the classical normal cone and deformation to the normal cone.
  - DerivedDeRhamCohomology §§1.14–1.16, the Rees description on derived categories.
  - Mathlib's object part of Stone duality (`PrespectralSpace.opensEquiv`, `OrderIso.lowerSetSupIrred`).
  - Tau Ceti's `TauCeti.Huber.Pair` and `TauCeti.ValuationSpectrum.spa`, the carriers behind AdicSpaces §§2.1–2.2.
- **1.6:** a Check against DerivedDeRhamCohomology §1.16. Its grading is the negative of the weight here: F^i in degree −i with deg t = 1, against Fil^n in weight n with t of weight −1. This is the convention witness recomputed in the supplier that uses the same object.
- **6.5:** a Check against SchemeAndStackFoundations §5.5. The two constructions agree for regular immersions. For the non-regular A = k[ε]/(ε²) → k, the derived normal cone has π₀ = k[u] and π₁ ≠ 0, while the classical one is k[u]/(u²).
- **Supplier contracts:**
  - Mathlib: `SSet.hoFunctor` (HomotopyCat.lean:609), `CategoryTheory.MonoidalClosed.pre` (Monoidal/Closed/Basic.lean:242), `SSet.QCat.bicategory` (Quasicategory/StrictBicategory.lean:66), `PrespectralSpace.opensEquiv` (Spectral/Prespectral.lean:111), `OrderIso.lowerSetSupIrred` (Order/Birkhoff.lean:149).
  - Tau Ceti: `TauCeti.Huber.Pair` (RingTheory/Huber/Pair.lean:138) and `TauCeti.ValuationSpectrum.spa` (AdicSpace/Spa/Basic.lean:101). I quoted its definition at the pin: it is the continuous valuations bounded by 1 on A⁺, with no Huber hypothesis.
  - EnhancedDerivedSheaves E0.2.
  - DerivedDeRhamCohomology §§1.14–1.16.
  - SchemeAndStackFoundations §5.5.

## What the README could not support; notions moved down

Nothing. Every cited text is in the manifest as `certified`, and all locators added this round were read in the cached extractions: SixFF line 937 (Construction 4.3), LZ12b lines 1052–1059, 1884–1895 and 107–118, Man22 line 4946, HM lines 1909–1985 and 4911–4947, CS22 line 3612. No `needs-references.toml` was written.

No notion was moved down from a later roadmap. The roadmaps named in Downstream consumers (MotivesAndAlgebraicCyclesPartII, AutomorphicBundlesPartII, HigherHidaAndColemanTheory, LocallyAnalyticRepresentationsOfLocalGroups) and RationalAnalyticPrismatization are consumers only. None of them appears in a *Needs:* line or in a supplier contract.

## Duplication sweep

**Removals: none.** No target of this roadmap is stated by Mathlib or Tau Ceti at the pins, by a roadmap on main, or by an open roadmap pull request, as the same object. Kept variants, each with the clause that distinguishes it in Scope and ownership:

| Variant here | Neighbour |
| --- | --- |
| 1.6: the ∞-categorical, animated, stacky Rees and graded/filtered equivalences | DerivedDeRhamCohomology §1.16, the same at the level of Mathlib's `DerivedCategory`, over a ring |
| 6.5: the derived deformation to the normal cone over 𝔸¹/𝔾_m for animated and analytic pairs | SchemeAndStackFoundations §5.5, the classical construction by blow-up |
| 0.7–0.10: kernels, suave and prim maps for an arbitrary formalism | VStackSheavesAndLisseCategories VS1.1 and VS3.1, and DiamondSixOperations S4, which give the concrete v-stack instances |
| 4.2: light condensed anima | VStackSheavesAndLisseCategories VS4.2, for v-stacks |
| 2.2: analytic rings over arbitrary light condensed animated rings | SolidAnalyticRings §7.1, solid spectral structures only |
| 2.10: the duality of categories between spectral spaces and bounded distributive lattices, which is not at the pins | Mathlib's object part (`PrespectralSpace.opensEquiv`, Birkhoff) |

**Ownership by object.** I ran `roadmaps grep -i --readme-only` over main (084e191) and the 367 open roadmap pull-request heads (index of 2026-10-26T04:06:08Z), and the same patterns over every `packages/*/README.md` and `packages/*/design/README.md` of the board. Patterns and results:

- "restricted nerve|multisimplicial|gluing restricted": only mentions, in EnhancedDerivedSheaves, Orbifolds, GeneralAlgebraicKTheory, StableHomotopyKTheory and FunctionFieldArithmeticPartII. None states the theorems.
- "six-functor formalism|three-functor formalism": mentions only (AdicSpacesPartIV, PerfectoidSpaces, HabiroCohomologyFoundations, CompletedCohomologyPartII, AdicSpacesPartIIPartII as a non-goal, MotivesAndAlgebraicCyclesPartII as a consumer).
- "category of correspondences": no match.
- "suave|cohomologically smooth": DiamondSixOperations, AdicCoefficientsAndComparisons, VectorBundlesAndIsocrystals and IgusaVarieties, all concrete étale notions.
- "kernel category": VStackSheavesAndLisseCategories, concrete.
- "smashing spectrum|idempotent algebra": SolidAnalyticRings, RefinedTraceMethods and ChromaticHomotopyTheory use idempotent algebras in specific settings. ExoticMonoidalStructuresAndAbstractAutomorphicity, later in the order, uses idempotent algebras in a representation-theoretic sense. None defines the smashing spectrum.
- "analytic ring": Kedlaya's rings (PadicDifferentialEquationsAndRigidCohomology), complex-analytic ring sheaves (ComplexComparisonPartII), relative Γ rings (PhiGammaModulesAndIwasawaCohomology §4.1), and VS2.2 (κ-condensed, cited).
- "Betti stack|Betti realization": the Betti realization of motives only.
- "Fredholm analytic": no match.
- "nuclear": RefinedTraceMethods §4.3 (cited).
- "Stone duality|bounded distributive lattice": no match.
- "deformation to the normal cone": SchemeAndStackFoundations §5.5 (cited), EtaleDualityAndPerverseSheaves (Verdier specialization) and VStackSheavesAndLisseCategories.
- "Cartier dual": classical finite flat duality (FiniteFlatGroupsAndIntegralPadicHodgeTheory and others; Tau Ceti `cartierDuality`, cited).
- "bialgebra", "Fourier–Mukai", "transmutation", "light condensed anima", "ℓ^temp": no object of Layer 7 elsewhere.
- "Rees": classical Rees modules (DeformationAndDerivedPatchingAlgebra Part II) and DerivedDeRhamCohomology §1.16 (cited).

I re-ran the decisive patterns this round, against main b2cca1d and the 367 heads of the index of 2026-10-26T04:44:42Z. The patterns were restricted nerve, six-functor formalism, category of correspondences, suave or cohomologically smooth, analytic stack, smashing spectrum, Fredholm analytic or Fredholm ring, Betti stack, Stone duality or bounded distributive lattice, light condensed anima, Serre duality, transmutation and nuclear module. Their owners are those above. Five patterns again match nothing: category of correspondences, smashing spectrum, Fredholm analytic, Betti stack and Stone duality. "Analytic stack" occurs only as a mention in four roadmaps:

- InverseGaloisAndArithmeticFundamentalGroups, for the complex-analytic stack of G-covers;
- VStackSheavesAndLisseCategories, for the VS2.2 analytic spectra of integer-solid rings (cited);
- SolidAnalyticRings, in its bibliography;
- HabiroCohomologyFoundations, in a remark.

None of these defines analytic stacks. A Python scan of the board's `packages/*/README.md` and `packages/*/design/README.md` for analytic stacks, six-functor formalisms, Betti stacks, Fredholm analytic rings, restricted multisimplicial nerves and the smashing spectrum found only mentions and consumers. MotivesAndAlgebraicCyclesPartII uses the abstract extension theorem; AutomorphicBundlesPartII asks for an analytic-stacks owner; the rest are complex-analytic quotient stacks and non-goals. This roadmap owns everything it plans. The grep over the open heads covered every sibling checkout the brief lists.

## Citations resolved this round

| Roadmap | Copy checked | Sections confirmed |
| --- | --- | --- |
| EnhancedDerivedSheaves | main | E0.2–E0.8, E2.6–E2.7, E3.1–E3.4, E4.1, E5:abstract.1–5, E5:presentability.1–4 (with the tensor product and module base change in .2), E5:descent, E5:animation.1 and .4, E5:cotangent-export.1–2, §§0.1–0.3, E1.3, E1.8 |
| DerivedModuleAlgebra | main | §§0.4 (`Algebra.CotangentComplex`), 0.6, 0.12, 0.13, 0.14, 0.K.1, 1.E.0 |
| SchemeAndStackFoundations | main | §§1.15, 1.18–1.22, 2.18, 5.5 |
| AdicSpaces | main | §§2.1, 2.2, 3.1 |
| AdicSpacesPartII | main | §§R0.16, R1.1 |
| BordismFormalGroups | main | F6.5 (categorical equivalences, defined through rigidification) |
| DerivedDeRhamCohomology | head 83d00dd | §§1.14–1.16, 1.18–1.19; conventions quoted at its lines 655–830 |
| SolidAnalyticRings | head 5d395ae | §§1.5, 2.1–2.4, 7.1–7.4, and the Checks of §7.3 that the Checks of 2.6–2.8 match; its own supplier contract for VStackSheavesAndLisseCategories declares the light-measure-site-comparison gap, and its §7.4 *Needs:* line cites it (see the repairs above) |
| RefinedTraceMethods | head 9dd2691 | §§4.1–4.3 |
| SmoothRepresentationsOfLocalGroups | head 1383569 | SR.0.1, SR.0.2, SR.0d.1, SR.0d.2, SR.1.1 |
| LocallyAnalyticDistributions | head 3a4526a | §1.1 and Conventions 5 |
| VStackSheavesAndLisseCategories | head 0ca8db7 | VS1.1, VS2.2 (`SolidECoefficients`, `ZSolidAnalytification`), VS3.1, VS4.2 |
| DiamondSixOperations | head ac2b810 | Layers S0–S4 (S4: ℓ-cohomologically smooth maps of small v-stacks) |

The heads were re-confirmed from the index of 2026-10-26T04:44:42Z: all seven are unchanged.

Further notes on these citations:

- **SmoothRepresentationsOfLocalGroups.** Its Conventions line 179 gives δ_B(diag(p, 1)) = p⁻¹.
- **RefinedTraceMethods.** §4.3 "Nuclear objects", at the head's line 1596, defines nuclearity by trace-class maps from compact objects and states MW Theorem 2.4. It still has no Hom criterion, so `gap:nuclear-hom-criterion` stands.
- **Declared gap.** `gap:nuclear-hom-criterion` (supplier RefinedTraceMethods, section §4.3) has the same slug in plan.json and in the README contract.
- **Resolver.** I re-ran `roadmaps resolve` on the repaired README this round, against main b2cca1d and the 367 heads. It found no cross-roadmap citation and no Lean name found nowhere. Its pass over Lean names outside TauCetiRoadmap did not run on this host, so every Mathlib and Tau Ceti name in the README was checked by hand at the pins (file and line above): `SSet.Quasicategory`, `CategoryTheory.Bicategory`, `.Adjunction`, `.Equivalence`, `CategoryTheory.Pseudofunctor`, `CategoryTheory.Span.SpanBicat`, the three `MorphismProperty` names, `LightProfinite`, `LightCondensed`, `LightCondMod`, `LightCondAb`, `Locale`, `SpectralSpace`, `KaehlerDifferential`, the four `AlgebraicGeometry` classes, `AbstractMeasure.amiceTransformEquiv`, `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, and the new names. The pins are Mathlib 6b7abb3c and Tau Ceti a91d3aaf, read from the checkout's `.lake/packages` (`git log -1` confirmed both).

## Dependency check

    tauceti-roadmap … gate --depcheck packages/AnalyticStacks/README.md --name AnalyticStacks --order merge-order/ORDER.txt --movable
    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

I re-ran it from the board checkout after the README repairs: exit 0, with the output line above. There is no UPWARD, CYCLE, `moved:` or `NOT IN ORDER` line. AnalyticStacks is at line 224 of the merge order, right after RefinedTraceMethods (line 223). Every supplier is earlier:

- SchemeAndStackFoundations, line 2.
- DerivedDeRhamCohomology, line 20.
- SmoothRepresentationsOfLocalGroups, line 25.
- LocallyAnalyticDistributions, line 76.
- VStackSheavesAndLisseCategories, line 146.
- SolidAnalyticRings, line 147.
- RefinedTraceMethods, line 223.
- EnhancedDerivedSheaves, DerivedModuleAlgebra, AdicSpaces, AdicSpacesPartII and BordismFormalGroups, all on main.

I also ran the worker's own text gates on the package folder, its `scan_folder` with the configured options, the package lane's gap-reference check and the manifest validation. Results:

    gate AnalyticStacks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 OK

- Gap references: none undeclared.
- Manifest: no problems.
- Source-material scan of the folder: no problems.
- The board's file checks on the deliverables: no local path, valid TOML and JSON, no long fence.
- Count: 60 targets, 5 Lean declarations, 27 sources.

## Adversarial pass

One row per statement written or changed. Values are computed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `bisimplex` | n = 0; n = 1 at (p, q) = (0, 0) and (1, 0); θ = δ⁰: [0] → [1] | Δ^{0,0}(p, q) has one element for every (p, q), so it is terminal. Δ^{1,1}(0, 0) has 4 elements, the vertices (i, j). Δ^{1,1}(1, 0) has 3·2 = 6. θ postcomposes both coordinates, and identity and composition hold by `aesop_cat` | represents (n, n)-bisimplices, matching LZ12b Notation 4.1 | none |
| `compactificationBisimplex` | n = 0, 1; (p, q) = (0, 0), (1, 0), (1, 1); the transposed model | Cpt₀ = Δ^{0,0}. Cpt₁(0, 0): 3 of 4, omitting (1, 0); a scratch Lean example confirms that (0, 1) satisfies the predicate and (1, 0) does not. Cpt₁(1, 0): 4 of 6. Cpt₁(1, 1): 5 of 9 (α = c₀: 3; α = id or c₁: β = c₁ only). The transposed condition α ≥ β omits (0, 1) instead | matches LZ12b line 1054 (F01) | Check added |
| `restrictedDiagonal` | X = ∗; X = Cpt₁ | Hom(Cpt_n, ∗) = ∗, so the result is Δ⁰. For X = Cpt₁: 3 vertices, edges the composable pairs, and the nerve of the 3-chain Cpt(1) = [2] (LZ12b Example 4.28) | correct | API bullet added |
| `restrictedDiagonalMap` | vertices; edges for X = Cpt₁; two Δ^{1,1} glued along their boundary | On vertices it is a bijection X(0, 0) → X(0, 0), since Cpt₀ = Δ^{0,0}. For X = Cpt₁ the identity edge of δ*₂∇ would need the preimage (id, id), but α(1) = 1 > β(0) = 0, so it is not surjective on edges. Two squares with the same boundary have equal images, so it is not injective | not an isomorphism, as expected | Check added; an earlier draft claim of non-injectivity for X = Δ^{1,1} was false (there (α, β) is recovered from (α(0), β, α, β(1))) and was replaced before writing |
| `restrictedDiagonalMap_isEquivalence_hoFunctor` | X = ∗; X = Cpt₁; Q = Δ⁰; Q = N(C) | X = ∗: the identity of Δ⁰. X = Cpt₁: δ*₂Cpt₁ has the 3 vertices, 2 nondegenerate edges (c₀, id) and (id, c₁), and no 2-simplex (it would need max α = 1 ≤ min β = 0), so it is the spine Δ¹ ∪_{Δ⁰} Δ¹. δ*₂∇Cpt₁ = Δ², and the map is the spine inclusion, which is inner anodyne, a categorical equivalence; its homotopy categories are the free category on two composable arrows and [2]. Q = Δ⁰: both homotopy categories are points. Q = N(C): it reduces to Fun(h δ*₂∇X, C) ≃ Fun(h δ*₂X, C) | true on every instance; the hypothesis `[Q.Quasicategory]` is in the signature | none |
| 0.3 text (1): the "equivalently" clause | Q and Fun(K, Q) | `ihom B (ihom K Q) ≅ ihom K (ihom B Q)`, so the homotopy-level statement for all quasicategories gives representable equivalences in `SSet.QCat.bicategory`, hence equivalences | the two forms are equivalent | none |
| 0.3 Check, k = 2 with E₁ = E₂ the isomorphisms | E₀ = all maps, f non-invertible | Image edges are composites of isomorphisms, hence invertible, so f is not in the essential image | conclusion fails without factorization | rewording |
| 0.1 Check 3 | g the zero section Spec ℤ → 𝔸¹; Δ: 𝔸¹ → 𝔸² | f∘g = id is smooth. g is a closed immersion of codimension 1, not flat, so not smooth. Δ is cut out by T₁ − T₂, again codimension 1 and not smooth | right cancellation fails for the smooth maps, which are not a setup | rewording |
| 0.5 Check 2 | j: 𝔾_m → 𝔸¹, f: ℙ¹ × 𝔸¹ → 𝔸¹ | the pullback is ℙ¹ × 𝔾_m; j is a monomorphism, so j*j_♮ = id and SixFF Remark 4.2 applies | (c) holds | the cospan was corrected |
| 0.5 Check 3 (new) | finite sets; j = f = ({1, 2} → ∗); S = δ_{11}Λ | both sides are ⊕_{m,n} S_{mn}, so Λ = Λ; S is a sum of 4 exterior products | (c) holds for a non-monomorphism | added |
| 0.5 Check 4 (F02) | Fun(X, D(Λ)), M = ⊕_ℕ Λ, p = (ℕ → ∗); Fun(X, Ani), S = {a, b}, T = ∗, p = ({1, 2} → ∗) | The identity matrix (δ_{mn}) lies in ∏_n ⊕_m Λ, but each element of ⊕_m ∏_n Λ has finitely many nonzero rows. S → S × S has image 2 of 4. The review's claimed iso S × ∏_n T_n ≅ ∏_n (S × T_n) has 2 elements on the left and 2^ℵ₀ on the right | (b) fails in both formalisms; the review's repair is false | replaced |
| 2.7(7), 2.8(3) (F03) | empty diagram; coproducts of ℤ_■-algebras | ℤ ↦ ℤ_■, but the initial analytic ring is ℤ^cond. ℤ[ℕ ∪ {∞}](∗) = ⊕ℤ lacks the all-one vector of its solidification ℤ × ∏ℤ, so it is not solid and there is no map ℤ_■ → ℤ^cond. B ⊔ C = B ⊗_{ℤ^cond} C = B ⊗_{ℤ_■} C, since ℤ_■ ⊗_{ℤ^cond} ℤ_■ = ℤ_■ | "non-empty colimits" is true; "all colimits" is false | text changed, Check added |
| 2.7 Check 2 | p = 2, 3; T = p⁻¹ and T = p | b_n = pⁿ: pⁿ − p⁻¹pⁿ⁺¹ = 0 (8 − 8 = 0 at p = 2, n = 3). For T = p, 1 − pσ* has the convergent inverse Σ pᵏσ*ᵏ | matches SolidAnalyticRings §7.3, line 782 | rewording |
| 4.5 Check 3 (F05) | CS22 Example 9.6 | V is the polynomial-growth sequences, with T acting by (1, 2, 3, …). It is the cone of 1 − f with f^N trace-class, hence dualizable. It is not discrete, so not perfect, since perfect objects are the compact discrete ones (CS22 Definition 9.7) | the route of 4.5 fails without Fredholmness | text changed |
| 1.6 Check (new) | step filtration of R; t = 1; t = 0 | Here weight n holds Fil^n = R for n ≤ 0, and t^k (k ≥ 0) has weight −k. In DerivedDeRhamCohomology §1.16, degree k holds F^{−k} = R. So the gradings are negatives. t = 1 gives R in both, and t = 0 gives gr⁰ = R | witness agrees after the sign | added |
| 6.5 Check (new) | A = ℤ[x] → ℤ (regular); A = k[ε]/ε² → k (not regular), char k = 2 and ≠ 2 | Regular case: I/I² = ℤx̄ and Sym = ℤ[u] = ⊕(xⁿ)/(xⁿ⁺¹). Non-regular case: L_{A/k} = [Ae → A dε], with e ↦ 2ε dε. After ⊗_A k the differential is 0 in every characteristic, so L_{k/A} = k[1] ⊕ k[2]. Sym_k(k ⊕ k[1]) has π₀ = k[u], π₁ = k[u]·v, and Sym^{≥2} of k[1] vanishes. The classical cone is k ⊕ kε = k[u]/(u²) | agree exactly for regular immersions | added |
| How to read the build (F04) | every *Needs:* line of Layers 4–7 | Layer 5: only 2.2, 2.3 and Layer 5. Layer 6: 5.2, 1.5, 1.6, 3.x, 2.x, 0.x, and no 4.x or 7.x. Layer 7: 4.1 (7.4), 6.4 (7.5, 7.7), and no 5.x. Layer 4: no 5.x–7.x | paragraph exact | rewritten |
| Mathlib contract: `PrespectralSpace.opensEquiv`, `OrderIso.lowerSetSupIrred` | read at the pin | `Opens X ≃o Order.Ideal (CompactOpens X)` at line 111; `α ≃o LowerSet {a // SupIrred a}` under `[OrderBot α]`, a finite distributive lattice, at line 149; Mathlib has no category of spectral spaces | object part only | added |
| Tau Ceti contract: `spa` | read at the pin | `cont A ∩ {v | ∀ a ∈ A⁺, v a ≤ 1}`, for any subring A⁺ of a topological ring, with no Huber hypothesis; a discrete ring is Huber with A₀ = A and I = 0 | as stated | added |
| Scope: SchemeAndStackFoundations §5.5 | read on main, line 6768 | the normal cone is Spec_X(⊕ Iⁿ/Iⁿ⁺¹); the normal bundle is Spec Sym(I/I²) for regular immersions; the deformation is Bl_{X×∞}(Y × ℙ¹) minus a strict transform | classical, scheme-level | added |
| Scope: EnhancedDerivedSheaves E0.2 against E0.5 | headings at main lines 191 and 242 | E0.2 holds categorical equivalences (from BordismFormalGroups F6.5); E0.5 holds coherent nerves, Cat∞ and spaces | the design's citation was wrong | fixed |
| Docstring claims of missing carriers | grep at the pins, re-run this round | 0 files in Mathlib and Tau Ceti for each of `SixFunctor`, `AnalyticRing`, `InfinityTopos`, `∞-topos`, `suave`, `Descendable`, `CondensedRing`, `LightCondRing`, `Corr(`. The Mathlib quasicategory files (Basic, InnerFibration, Nerve, StrictBicategory, StrictSegal, TwoTruncated, TwoTruncatedQuasicategory) mention limits only as `Limits.IsTerminal` of a simplicial set, never as limits inside a quasicategory | not statable | none |
| SolidAnalyticRings contract: the use of §7.4 (repair) | all 60 *Needs:* lines; every README line naming §7.4 | *Needs:* lines naming SolidAnalyticRings §7.4: 0 of 60; those naming SolidAnalyticRings at all cite §§1.5, 2.3 and 7.1–7.3. Lines naming §7.4: the contract, Scope (comparison Checks only), the 2.11 Check on (ℚ_p, ℤ_p)_■[S], the 3.4 Check on `ZSolidAnalytification`, and the Dependencies of Layers 2 and 3, the latter marked "comparison Check only". The gap is declared by SolidAnalyticRings at its head, in its own VStackSheavesAndLisseCategories contract | the site comparison is SolidAnalyticRings' requirement, not this roadmap's | `gap:` token replaced by prose; plan.json unchanged |
| VStackSheavesAndLisseCategories contract: "Checks of 2.9 and 3.4" (repair) | the README lines of 2.9 and 2.11 | 2.9: 0 mentions of VS2.2, `SolidECoefficients` or `ZSolidAnalytification`. 2.11: 1, the (ℚ_p, ℤ_p)_■[S] Check. 3.4: 1, the `ZSolidAnalytification` Check | the reference was off by one section | 2.9 → 2.11 |
| Convention (2), witness ι₀^!1 = t⁻¹ℤ[−1] (re-checked) | graded resolution of ℤ = ℤ[t]/t with wt(t) = −1 | 0 → ℤ[t]·e → ℤ[t] → ℤ with e ↦ t forces wt(e) = −1. The dual generator e^∨ of Hom(ℤ[t]·e, ℤ[t]) has weight +1. Ext¹ = ℤ[t]e^∨/t·e^∨ = ℤ·e^∨, of weight +1 = wt(t⁻¹), in cohomological degree 1, that is homological degree −1 | a weight-one line in homological degree −1, as stated | none |
| Convention (4), δ(diag(p, 1)) = p⁻¹ (re-checked) | B ⊆ GL₂(ℚ_p) upper triangular, K = B ∩ GL₂(ℤ_p) | conjugation by g = diag(p, 1) sends (1 x; 0 1) to (1 px; 0 1), so gKg⁻¹ ∩ N = pℤ_p inside K ∩ N = ℤ_p. The generalised index [gKg⁻¹ : K] = [gKg⁻¹ : gKg⁻¹ ∩ K] / [K : gKg⁻¹ ∩ K] = 1/p | p⁻¹, agreeing with SmoothRepresentationsOfLocalGroups | none |
| Convention (1), f_!1 for 𝔸¹_ℤ (re-checked) | ℤ[T] → ℤ((T⁻¹)) | the map is injective with cokernel T⁻¹ℤ[[T⁻¹]]. The fibre of an injective map is its cokernel shifted to π₋₁, that is T⁻¹ℤ[[T⁻¹]][−1] | as stated | none |
| 0.5 Check 4, (b) for p = (ℕ → ∗) (re-checked) | M = ⊕_ℕ Λ | M ⊗ p_*Λ = ⊕_m ∏_n Λ. Its image in ∏_n ⊕_m Λ consists of matrices with finitely many nonzero rows. The identity matrix (δ_mn) lies in the target, since each column e_n is finitely supported, but has infinitely many nonzero rows | (b) fails, as the Check says | none |

## Sources

All 27 manifest entries are `certified`, with no local path. Changes:

- Locators added: LZ12b (Theorem 0.1, Notation 4.1, Definition 4.26, Theorem 4.27, Example 4.28, Theorem 5.4), SixFF (Construction 4.3), Man22 (Proposition 2.9.6(i)–(ii)).
- `cited_for` corrected to the sections that actually cite the work, for LZ12b, GvG24 (2.10, not 2.8), Mao21 (6.5, not 6.4), ABFJ22 (0.13, 3.3), Mat16 (0.12, 1.2, 1.4, 5.3) and Gest.

Nothing was fetched, and there is no missing text. Every one of the 27 manifest ids is cited in the README, and the README cites no work outside the manifest.

**Locator check.** I matched every README citation of the form "<id> <Theorem/Definition/…> <number>, <id> line N" against the cached extraction: 314 pairs. In 306, line N lies within three lines of the cited item's heading. The other 8 point into the body of a longer item, and I read each one: LZ12b line 1057 (Notation 4.1, which begins at 1052); HM line 4937 (Example 5.3.22, from 4928); ALRS lines 1860, 1871 and 1893 (§2.9 and Remark 2.9.1, from 1857 and 1866, with Remark 2.9.2 starting at 1900); RCSolid line 3189 (inside the proof of Proposition 5.4.15, from 3181); RCSolid line 4471 (Remark 6.4.1, from 4465); RCSolid line 4750 (§6.5, from 4745). All 469 `<id> line N` references lie within their extractions.

## Untrusted text

No fetched or repository text contained instructions. Nothing suspicious to quote.
