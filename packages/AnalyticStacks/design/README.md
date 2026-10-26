# Roadmap: analytic stacks and their six-functor formalisms

**Summary.** This roadmap builds the abstract calculus of three- and six-functor formalisms (correspondences, the construction principle of Liu–Zheng and Mann, the extension of a formalism from a site to its sheaves, the bicategory of kernels, suave, prim, étale and proper maps, exceptional descent), and then the geometry of light analytic rings of Clausen and Scholze in the account of Rodríguez Camargo: analytic animated rings over light condensed animated rings, their colimits, induced structures and smashing localizations, solid structures on discrete rings, solid Huber rings and their rational localizations, the !-able class of maps of affinoid analytic stacks with its quasi-coherent six-functor formalism, and the ∞-topos AnStk(C₀) of analytic stacks for an essentially small category C₀ of affinoids. On top of this it proves descent and properness for schemes, formal completions and graded and filtered quasi-coherent sheaves on algebraic stacks in the !-topology, realizes algebraic stacks, light condensed anima and classifying stacks of locally profinite groups as analytic stacks, develops nuclear modules over solid ℚ_p-algebras and Fredholm analytic rings, the cotangent complex of analytic rings, and Serre duality for locally solid smooth maps of solid Huber rings, whose dualizing complex is the determinant of the cotangent complex placed in homological degree equal to the relative dimension. The last layer proves Cartier duality for commutative monoid objects in Künneth six-functor formalisms and its instances for lattices and tori, for formal and divided-power additive groups, for overconvergent and analytic vector groups, for the locally analytic p-adic integers through the Amice transform, and for transmuted vector bundles and their gerbes. The end theorems are the extension theorem (0.6), the quasi-coherent six-functor formalism on AnStk(C₀) (3.3), the realization of algebraic stacks (3.8), the classifying-stack duality (4.2), solid Serre duality (6.6) and stacky Cartier duality (7.6).

## Scope and ownership

This roadmap owns the abstract theory of three- and six-functor formalisms at the generality of geometric setups on ∞-categories (Layer 0), the quasi-coherent formalism of algebraic stacks in the !-topology (Layer 1), light analytic animated rings and solid Huber rings over ℤ (Layer 2), analytic stacks and their quasi-coherent formalism (Layer 3), Betti stacks, classifying stacks, nuclear modules over solid ℚ_p-algebras and Fredholm analytic rings (Layer 4), the cotangent complex of analytic rings (Layer 5), solid smoothness and Serre duality (Layer 6), and Cartier duality in six-functor formalisms (Layer 7). No roadmap on main, in an open roadmap pull request or on the board plans any of these objects; the closest neighbours keep their scope and supply this one as follows.

- **Higher categories.** Quasicategories, Cat∞, coCartesian fibrations, presentable categories and Lurie's tensor product, symmetric monoidal ∞-categories and ∞-operads, algebras and modules, monoidal localizations, sheaves of spaces, descendable algebras, animated rings and the cotangent complex of discrete animated rings are stated by EnhancedDerivedSheaves (E0.3–E0.8, E2.6–E2.7, E3.1–E3.4, E5:abstract.1–5, E5:presentability.1–4, E5:descent, E5:animation.1 and .4, E5:cotangent-export.1–2). The ∞-category of correspondences, the multisimplicial nerve theorems of Liu–Zheng and everything built on them are owned here, because no supplier states them and every consumer of six functors needs them. The bicategory of kernels is built here as a Mathlib bicategory (the homotopy 2-category of the kernel ∞-category); no (∞,2)-categorical statement is used anywhere in this roadmap.
- **Light solid coefficients.** The light solid abelian groups D(SolidAb_light), the derived light condensed category D(Ab_light) and their tensor products are SolidAnalyticRings §1.5; the Hℤ-linear comparison is its §2.3; spectral analytic structures, completed scalar extension and the summability structures (R, R⁺)_■, (R[T], π₀R)_■ and R[T]_■ of discrete animated Huber pairs are its §§7.1–7.3, with the integer-linear comparison of §7.4. Layer 2 defines analytic animated rings over arbitrary light condensed animated rings (not only solid ones) and identifies, through SolidAnalyticRings §2.3, its solid analytic rings with the completed Hℤ-linear structures of SolidAnalyticRings §7.1; the coefficient structures of discrete Huber pairs are imported from SolidAnalyticRings §7.3, and only their geometry (localization kernels, free modules, Zariski and analytic descent) is planned here.
- **κ-condensed analytic rings.** VStackSheavesAndLisseCategories VS2.2 owns analytic measures over cutoff-condensed rings, the solid nonarchimedean coefficients E_■ for finite E/ℚ_p in that setting, and the Zariski gluing of the integer-solid spectra AnSpec(A, Mod_Zsolid(A)). This roadmap works in the light setting; the comparisons are Checks through SolidAnalyticRings §7.4.
- **Nuclear objects.** Trace-class maps and nuclear objects of compactly generated presentably symmetric monoidal stable ∞-categories with compact unit are RefinedTraceMethods §4.3. Layer 4 applies them to D(A) for solid ℚ_p-algebras A and owns the closure, countable-limit and descent statements specific to that case.
- **Algebra, schemes and stacks.** The classical cotangent complex, its universal property, the smooth and regular-quotient computations and exterior powers are DerivedModuleAlgebra §§0.4, 0.6, 0.12–0.14, Koszul complexes its §0.K.1, perfect complexes its §1.E.0. Stacks in groupoids, quotient stacks, [𝔸¹/𝔾_m] and abelian quasi-coherent sheaves on stacks are SchemeAndStackFoundations §§1.15, 1.18–1.22; derived quasi-coherent complexes on schemes are its §2.18.
- **Huber pairs and rigid spaces.** Huber pairs, Spa and rational subsets are AdicSpaces §§2.1–2.2, rational localization §3.1; smooth and étale morphisms of adic spaces and rigid-analytic spaces are AdicSpacesPartII §§R0.16 and R1.1.
- **Representations.** Locally profinite groups, smooth representations, the derived smooth category and Haar measures with the modulus are SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.2, SR.0d.1–SR.0d.2 and SR.1.1. The Amice transform of locally analytic distributions is LocallyAnalyticDistributions §1.1; the Amice transform of bounded measures is in Mathlib.

Left to other roadmaps:

- Gelfand rings and Gelfand stacks, bounded affinoid ℚ_p-algebras, the Fredholm property of Gelfand rings, derived Berkovich spaces, analytic de Rham stacks and prismatization are RationalAnalyticPrismatization's.
- Gestalten of Scholze and Stefanich, with their n-affine, n-proper and n-étale maps and the transmutation of a six-functor formalism into Gestalten (Gest Lectures VI–IX), are a separate theory and belong to a roadmap of their own placed after this one. Layer 7 uses only the 1-suave and 1-étale maps of commutative algebras in presentable linear categories, defined there directly.
- Liquid and gaseous analytic rings and complex-analytic geometry: the definitions of Layer 2 cover them, but their theory is not planned.
- Analytic stacks over the category of all analytic rings: AnStk(C₀) is built only for essentially small C₀, as the sources do.

## Conventions

**Higher categories.** An ∞-category is a quasicategory in the sense of Mathlib's `SSet.Quasicategory`, with the coherent model, mapping anima and functor ∞-categories supplied by EnhancedDerivedSheaves E0. Cat∞ is the ∞-category of small ∞-categories, Pr^L the ∞-category of presentable ∞-categories and colimit-preserving functors with Lurie's tensor product, and Pr^L_V = Mod_V(Pr^L) for a presentably symmetric monoidal V. Every functor between stable ∞-categories is exact and every tensor product, pullback, pushforward, limit and colimit is the derived (∞-categorical) one. A 2-category is a Mathlib `CategoryTheory.Bicategory`; adjunctions in it are `CategoryTheory.Bicategory.Adjunction`.

**Light condensed objects.** Fix a universe u and the essentially small category of u-small light profinite sets (Mathlib's `LightProfinite` with its `CategoryTheory.EssentiallySmall` instance), with finite jointly surjective covers. For an ∞-category C with countable limits, Cond(C) is the ∞-category of C-valued hypersheaves on this site; CondAni = Cond(Ani) and CondRing = Cond(Ring), where Ring is the ∞-category of animated commutative rings of EnhancedDerivedSheaves E5:animation.1. D(ℤ^cond) is the enhanced unbounded derived ∞-category D(Ab_light) of light condensed abelian groups of SolidAnalyticRings §1.5, and D(ℤ_■) = D(SolidAb_light). For A▷ ∈ CondRing, D(A▷) = Mod_{θA▷}(D(ℤ^cond)) with θ the sheafified comparison of EnhancedDerivedSheaves E5:animation.4.

**Indexing.** Homological indexing: π_i M = H^{−i}(M), M[1] is the suspension, and "in homological degree d" means M[d] for M static. Thus ℤ[T][1] has π₁ = ℤ[T] and π₀ = 0, and ℤ[−1] has π₋₁ = ℤ. Connective means π_i = 0 for i < 0.

**Kernels.** For a three-functor formalism D on (C, E) and S ∈ C, the 1-morphisms Y → X of the kernel bicategory over S are the objects of D(X ×_S Y), and the composite of M: Y → X and N: Z → Y is M ⋆ N = π₁₃!(π₁₂*M ⊗ π₂₃*N) on X ×_S Y ×_S Z; the identity of X is Δ!1. An object M ∈ D(X) is read as the 1-morphism X → S. Witness: for the formalism on finite sets with D(X) = Fun(X, D(Λ)) and X = Y = Z = {1, 2} over a point, the kernels are 2×2 matrices of Λ-modules and ⋆ is matrix multiplication with ⊕ and ⊗; the identity kernel is the diagonal matrix with entries Λ.

**Signs and normalisations.** (1) The relative dualizing complex of ℤ_■ → ℤ[T]_■ is ℤ[T][1]; that of the zero section ℤ[T] → ℤ is Hom_{ℤ[T]}(ℤ, ℤ[T]) ≅ ℤ[−1]; for 𝔸¹_ℤ → Spec ℤ, f_!1 is the fibre of ℤ[T] → ℤ((T⁻¹)), that is T⁻¹ℤ[[T⁻¹]][−1]. (2) Graded objects: D(B𝔾_m) is graded modules, the coordinate t of 𝔸¹ has weight −1, filtrations are decreasing and the Rees module of Fil^•M is ⊕_n Fil^n M · t^{−n}. Witness: for the zero section ι₀ of 𝔸¹/𝔾_m → B𝔾_m, ι₀^!1 = Hom_{ℤ[t]}(ℤ, ℤ[t]) = t^{−1}ℤ[−1], a weight-one line in homological degree −1. (3) Determinants: for a finite projective module V of rank n, det V = ∧ⁿV in degree 0, and for f locally solid smooth of relative dimension n, f^!1 ≅ det(L_f)[n], the identification being canonical up to a sign ±1 depending only on n. (4) The modulus of a locally profinite group is δ(g) = [gKg⁻¹ : K] for an open pro-p subgroup K, with the generalised index; for the upper triangular Borel of GL₂(ℚ_p), δ(diag(p, 1)) = p⁻¹, agreeing with SmoothRepresentationsOfLocalGroups (Conventions, "Measures and modulus"). (5) The exponential pairing of Ĝ_a and G_a^♯ is exp(XT) = Σ_n Xⁿ Tⁿ/n!, sending the dual basis vector of Xⁿ to Tⁿ/n!; the Amice transform sends the Dirac distribution δ_a to (1 + T)^a, as in LocallyAnalyticDistributions (Conventions 5).

**Sizes.** A map of presheaves Y → X on C is ℵ₁-compact if every base change to a representable is a countable colimit of representables. Analytic stacks are formed relative to a chosen essentially small full subcategory C₀ of affinoid analytic stacks over a base, stable under finite limits and finite coproducts; every statement about AnStk(C₀) is uniform in C₀.

## Exact supplier contracts

### From Mathlib

The pin is 6b7abb3c7686292736be2955bd3eb9ebf63b456a. The following declarations are consumed, each read at the pin.

- `SSet.Quasicategory` (Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41), the inner-horn-filling class; it is the carrier of ∞-categories through EnhancedDerivedSheaves E0.
- `CategoryTheory.Bicategory` (Mathlib/CategoryTheory/Bicategory/Basic.lean:61), `CategoryTheory.Bicategory.Adjunction` (Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89, unit, counit and the two zigzag identities), `CategoryTheory.Bicategory.Equivalence` (same file, line 242) and `CategoryTheory.Pseudofunctor` (Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57). The kernel bicategory of 0.7 is an instance of the first, suave and prim objects are defined by the second, and base change of kernels is a pseudofunctor. These declarations carry no stability or presentability.
- `CategoryTheory.Span.SpanBicat` (Mathlib/CategoryTheory/Bicategory/Span/Basic.lean:151, its `CategoryTheory.Bicategory` instance at line 364): the bicategory of spans of an ordinary category with left legs in Wₗ and right legs in Wᵣ, with non-invertible 2-morphisms. It is used only in the comparison Check of 0.2 for ordinary categories.
- `CategoryTheory.MorphismProperty.IsStableUnderBaseChange` (Mathlib/CategoryTheory/MorphismProperty/Limits.lean:107), `CategoryTheory.MorphismProperty.diagonal` (same file, line 796) and `CategoryTheory.MorphismProperty.IsMultiplicative` (Mathlib/CategoryTheory/MorphismProperty/Composition.lean:202): the 1-categorical shadows of the axioms of a geometric setup, used in the Checks of 0.1.
- `LightProfinite` (Mathlib/Topology/Category/LightProfinite/Basic.lean:42) with its `CategoryTheory.EssentiallySmall` instance (line 403), `LightCondensed` (Mathlib/Condensed/Light/Basic.lean:28), `LightCondMod` and `LightCondAb` (Mathlib/Condensed/Light/Module.lean:42, 85): the site and the ordinary sheaf categories; their enhanced derived categories come from SolidAnalyticRings §1.5.
- `Locale` (Mathlib/Topology/Category/Locale.lean:25, the opposite of the category of frames) and `SpectralSpace` (Mathlib/Topology/Spectral/Basic.lean:38): the smashing spectrum of 2.5 is a locale and the solid spectrum of 2.8 is a spectral space. Mathlib states neither Stone duality for bounded distributive lattices nor any smashing spectrum.
- `KaehlerDifferential` (Mathlib/RingTheory/Kaehler/Basic.lean:148), `AlgebraicGeometry.Smooth` (Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59), `AlgebraicGeometry.SmoothOfRelativeDimension` (same file, line 127), `AlgebraicGeometry.IsProper` (Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41) and `AlgebraicGeometry.IsSeparated` (Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:43): the classical smooth, proper and separated morphisms of schemes used in 3.4 and 6.6.
- `AbstractMeasure.amiceTransformEquiv` (Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157): the ℤ_p-linear equivalence between bounded ℤ_p-valued measures on ℤ_p and ℤ_p[[X]]; the unbounded (locally analytic) transform is LocallyAnalyticDistributions §1.1.

### From Tau Ceti

The pin is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` (TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271) is the anti-equivalence of finite locally free commutative affine group schemes over a commutative ring R with itself given by linear duality of Hopf algebras. It is used in a Check of 7.2 only.

### From TauCetiRoadmap.EnhancedDerivedSheaves

E0.3–E0.8 (functor ∞-categories, localizations, limits, colimits and stability, Cat∞ and spaces, coCartesian fibrations and straightening, accessibility and presentability), E2.6–E2.7 (hypercovers, sheaves of spaces and hypercompletion), E3.1–E3.4 (Kan extensions, adjoint functor theorems and accessible localizations, compact generation, mates), E5:abstract.1–5 (symmetric monoidal ∞-categories and ∞-operads, algebras and modules with bar scalar extension, monoidal localizations, stable monoidal structures, Barr–Beck–Lurie), E5:presentability.1–4 (compact objects and Ind, Pr^L with Lurie's tensor product and module base change, Verdier quotients, dualizable categories), E5:descent (descendable algebras, their index and module descent), E5:animation.1 and .4 (animated rings and their comparison θ with connective commutative algebras), E5:cotangent-export.1–2 (square-zero extensions, derivations, the cotangent complex of animated rings and animated exterior powers), E4.1 (derived complete sheaves and the completion reflector), §§0.1–0.3 and E1.3 (enhanced derived sheaf categories on small ringed sites) and E1.8 (enhanced quasi-coherent derived sheaves). Nothing beyond the stated sections is assumed.

### From TauCetiRoadmap.DerivedModuleAlgebra

§0.4 (the cotangent complex `Algebra.CotangentComplex` of a ring map), §0.6 (its universal property), §0.12 (the smooth computation L ≃ Ω¹[0]), §0.13 (regular quotients: L ≃ I/I²[1]), §0.14 (derived exterior powers), §0.K.1 (Koszul complexes of finite sequences and their regular-sequence resolutions) and §1.E.0 (perfect complexes and finite models).

### From TauCetiRoadmap.SchemeAndStackFoundations

§1.15 (𝔾_m-torsors and line bundles), §§1.18–1.22 (stacks in groupoids, algebraic stacks, quotient stacks, [𝔸¹/𝔾_m] and abelian quasi-coherent modules on stacks, with comodules on classifying stacks) and §2.18 (derived categories of quasi-coherent complexes on schemes). Layer 1 compares its derived categories with these on hearts.

### From TauCetiRoadmap.AdicSpaces and TauCetiRoadmap.AdicSpacesPartII

AdicSpaces §2.1 (Huber pairs and Spa), §2.2 (rational subsets) and §3.1 (rational localization of a Huber pair), applied in particular to Huber pairs with the discrete topology. AdicSpacesPartII §R0.16 (flat, smooth and étale morphisms of adic spaces) and §R1.1 (affinoid subdomains and rigid-analytic spaces).

### From TauCetiRoadmap.SolidAnalyticRings

§1.5 (light solid abelian groups, the enhanced D(Ab_light) and D(SolidAb_light), solid tensor product and free solid modules ℤ_■[S] ≅ lim ℤ[S_n]), §§2.1–2.4 (the spectral homotopy structure, solidification, the Hℤ-linear comparison and the free solid generator), §7.1 (uncompleted and completed spectral analytic structures), §7.2 (complete tensor and completed scalar extension), §7.3 (summability structures and the coefficient structures (R, R⁺)_■, (R[T], π₀R)_■ and R[T]_■ of discrete animated Huber pairs, tested on ring generators of R⁺) and §7.4 (integer-linear measures and the common-presentation comparison with VStackSheavesAndLisseCategories VS2.2, conditional on its gap:light-measure-site-comparison).

### From TauCetiRoadmap.RefinedTraceMethods

§4.1 (dualizable presentable stable categories), §4.2 (trace-class morphisms and their functoriality) and §4.3 (nuclear and basic nuclear objects of a compactly generated presentably symmetric monoidal stable C with compact unit: closure under colimits and tensor products, ω₁-compact nuclear objects are basic nuclear, preservation by symmetric monoidal colimit-preserving functors).

What RefinedTraceMethods must provide (gap:nuclear-hom-criterion): for C as in §4.3 and X ∈ C, X is nuclear in the sense of §4.3 (every map P → X from a compact P is trace-class) if and only if for every compact P the natural map (P^∨ ⊗ X)(1) → Hom(P, X) of mapping spectra is an equivalence (CS22 Definition 8.5, CS22 line 3157). The supplying section is §4.3, "Nuclear objects"; it states the first criterion and the closure theorem of MW Theorem 2.4 but not this equivalence, which Layer 4 uses to apply ABLB Appendix A and Bosco's Theorem A.17, both phrased with the second criterion.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.0.1 (locally profinite groups and smoothness), SR.0.2 (the abelian category of smooth representations), SR.0d.1–SR.0d.2 (the Grothendieck property, the derived smooth category and derived invariants with their enhancement) and SR.1.1 (Haar measures and the modulus δ).

### From TauCetiRoadmap.LocallyAnalyticDistributions

§1.1 (the Amice transform of locally analytic distributions on ℤ_p, identifying them topologically with functions on the open unit disc), with its normalisation δ_a ↦ (1 + T)^a.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

VS2.2 (analytic measures, `SolidECoefficients`, `ZSolidAnalytification`), consumed only through the comparison Checks of 2.9 and 3.4 and through SolidAnalyticRings §7.4.

## How to read the build

Layer 0 is pure higher category theory: correspondences, three- and six-functor formalisms, the construction and extension theorems, the kernel bicategory and the suave/prim calculus, and the abstract ∞-topos obtained from a Künneth formalism by inverting !-equivalences. Layer 1 applies it to animated rings with all maps !-able, giving algebraic stacks in the !-topology, the properness of qcqs maps of schemes, formal completions and the graded and filtered descriptions. Layer 2 builds analytic rings, their colimits, invariance and smashing localizations, solid structures on discrete rings and solid Huber rings with their solid spectra. Layer 3 equips affinoid analytic stacks with the !-able class, builds AnStk(C₀) and its formalism, and treats the instances (schemes and discrete adic spaces, solid Huber stacks, ℚ_{p,■}-stacks) and the realization of algebraic stacks. Layer 4 adds Betti stacks, classifying stacks, nuclear modules and Fredholm rings; Layer 5 the cotangent complex; Layer 6 solid finite presentation, smoothness and Serre duality; Layer 7 Cartier duality. Layers 4–7 depend on 3 and are mutually independent except that 6 uses 5 and 7 uses 4.1 and 1.4.

## Layer 0: Abstract six-functor formalisms

### 0.1 Geometric setups

Define a geometric setup as a pair (C, E) of an ∞-category C and a class E of morphisms of C such that E contains every equivalence, E is closed under composition, every pullback of a morphism of E along an arbitrary morphism of C exists and lies in E, and the diagonal Y → Y ×_X Y of every f: Y → X in E lies in E. Equivalently, C_E ⊆ C is a wide subcategory stable under base change, admitting fibre products preserved by the inclusion (HM Definition 2.1.1 and Lemma 2.1.5, HM line 877; RCSolid Definition 6.1.1 and Remark 6.1.2, RCSolid line 3567). A morphism of geometric setups (C, E) → (D, F) is a functor carrying E into F and preserving pullbacks along E. For S ∈ C the slice ((C_E)/S, all) is a geometric setup in which every morphism is admissible, called full.

The API consists of the following facts.

- Right cancellation: if g: Z → Y and f: Y → X are morphisms of C with f and f∘g in E, then g ∈ E, by writing g as the graph Z → Z ×_X Y followed by the projection (RCSolid Lemma 6.1.3, RCSolid line 3585).
- Base change of setups: for S′ → S, pullback induces a morphism of setups ((C_E)/S, all) → ((C_E)/S′, all).
- (C, equivalences) is a geometric setup for every C, and (C, all) is one exactly when C has fibre products.
- If (C, E) is a setup and E′ ⊆ E is a further class containing the equivalences, stable under composition, base change and diagonals, then (C, E′) is a setup; in particular E ∩ E′ is.

*Needs:* EnhancedDerivedSheaves E0.4 (pullbacks in ∞-categories).

**Checks.**

- For C the category of sets and E the surjections, E contains the bijections and is stable under composition and pullback, but for X = {a, b} the diagonal X → X × X is not surjective. So (Sets, surjections) is not a setup; dropping the diagonal axiom would admit it, and the kernel calculus of 0.7 would fail for it.
- For C the category of schemes and E the open immersions, the diagonal of an open immersion is an isomorphism, and (Sch, open immersions) is a setup; in Mathlib terms the class is `CategoryTheory.MorphismProperty.IsStableUnderBaseChange` and `CategoryTheory.MorphismProperty.IsMultiplicative`, and its `CategoryTheory.MorphismProperty.diagonal` contains it.
- Right cancellation is not right cancellation in the other variable: for X = Spec ℤ, Y = Spec ℤ[T] and Z = Spec ℤ with g the zero section and E the smooth morphisms, f: Y → X and f∘g = id are smooth while g is not; this class is not a geometric setup, because the diagonal of 𝔸¹ → Spec ℤ is not smooth.

### 0.2 The symmetric monoidal ∞-category of correspondences

Construct, for a geometric setup (C, E), the ∞-category Corr(C, E): its n-simplices are the functors from the poset Σ_n = {(i, j) : 0 ≤ i ≤ j ≤ n} to C that send vertical edges into E and every square to a pullback square (HM Definitions 2.2.1–2.2.10 and Proposition 2.2.9, HM line 990; SixFF Definition/Proposition 3.2, SixFF line 563). Prove that it is an ∞-category whose objects are those of C, whose mapping anima from X to Y is the ∞-groupoid of spans X ← W → Y with W → Y in E, and in which composition is given by the fibre product of spans. When C has finite products, construct the ∞-operad Corr(C, E)^⊗ whose multimorphisms are spans with the product in C, prove that it is a symmetric monoidal ∞-category when C has finite limits, with tensor product X × Y on objects (HM Definition 2.3.2 and Proposition 2.3.3, HM line 1234; SixFF Definition 2.3, SixFF line 486), and prove that the construction is functorial in morphisms of geometric setups (HM Proposition 2.3.5, HM line 1292). For C with finite limits and E = all, prove that Corr(C) is closed symmetric monoidal with internal Hom(X, Y) = X × Y, so that every object is self-dual, with evaluation and coevaluation the spans X × X ← X → ∗ and ∗ ← X → X × X (HM Proposition 2.4.1 and Corollary 2.4.2, HM line 1376).

A proof route: realize Corr(C, E) as the restricted nerve of 0.3 (the bisimplicial set Corr(C, E)^{contra,co} followed by the diagonal δ*₊), use the equivalence of 0.3 to show that it is a quasicategory with the stated mapping anima, and obtain the operad structure by applying the same construction to the geometric setup (C^{×′}, E^×) of tuples, as in SixFF Definition/Proposition 3.11 (SixFF line 767).

*Needs:* 0.1; 0.3; EnhancedDerivedSheaves E0.3 (functor ∞-categories, full subcategories); EnhancedDerivedSheaves E5:abstract.1 (∞-operads, symmetric monoidal ∞-categories).

The API consists of the following facts.

- The functor C^op → Corr(C, E) sending f: Y → X to the span X ← Y = Y, and the functor C_E → Corr(C, E) sending g: Y → X to Y = Y → X; both are the identity on objects, the first is symmetric monoidal for the coCartesian structure on C^op and the second for the Cartesian structure on C_E (HM Proposition 2.3.7, HM line 1314).
- Every span X ← W → Y is the composite of W → Y (from C_E) after X ← W (from C^op), and this factorization is unique up to contractible choice.
- A morphism of geometric setups induces a symmetric monoidal functor of correspondence ∞-categories compatible with the two functors above.
- For (C, all) with finite limits, the self-duality of objects gives an equivalence Corr(C)^op ≃ Corr(C) that is the identity on objects and reverses spans.

**Checks.**

- For C an ordinary category with pullbacks, the homotopy category of Corr(C, E) has as morphisms X → Y the isomorphism classes of spans X ← W → Y with W → Y in E and composes by pullback; it is the category obtained from Mathlib's `CategoryTheory.Span.SpanBicat` (with Wₗ all morphisms and Wᵣ = E) by identifying isomorphic 1-morphisms. Keeping non-invertible maps of spans as 2-morphisms would give a different (non-groupoidal) mapping object.
- For E the equivalences, Corr(C, E) ≃ C^op: every span with invertible right leg is a pullback map.
- For C the category of finite sets and E = all, the composite of the spans {1} ← {1, 2} → {1} with itself has apex {1, 2} ×_{1} {1, 2} of cardinality 4, not 2: composition is the fibre product, not the union of apexes.

### 0.3 Restricted multisimplicial nerves

State and prove the two gluing theorems of Liu and Zheng. (1) For every bisimplicial set X, the map from the diagonal δ*₂X (n-simplices: maps from the (n, n)-bisimplex) to δ*₂∇X (n-simplices: maps from the sub-bisimplicial set Cpt_n of the (n, n)-bisimplex spanned by the vertices (i, j) with i ≥ j), induced by restriction, is a categorical equivalence of simplicial sets (LZ12b Theorem 4.27, LZ12b line 1887; SixFF Theorem 4.8, SixFF line 1071). (2) Let C be an ∞-category admitting pullbacks and E₀, E₁, …, E_k (k ≥ 2) classes of morphisms containing the identities such that E₁, E₂ ⊆ E₀, E₀ is stable under composition, E₁ and E₂ are admissible (contain the identities, are stable under pullback and satisfy p∘q ∈ E_i iff q ∈ E_i for p ∈ E_i), every morphism of E₀ factors as p∘q with p ∈ E₁ and q ∈ E₂, and E₃, …, E_k are stable under pullback along E₁. Then the natural map δ*_k C^{cart}_{E₁,E₂,E₃,…,E_k} → δ*_{k−1} C^{cart}_{E₀,E₃,…,E_k} of restricted multisimplicial nerves is a categorical equivalence, and the same holds for the variants that take opposites in directions L ⊆ {3, …, k} (LZ12b Theorem 5.4 and Theorem 0.1, LZ12b line 110; SixFF Theorem 4.10, SixFF line 1097).

A proof route: follow LZ12b §§4–5, using the inner anodyne and categorical equivalence calculus of simplicial sets and the comparison of multisimplicial nerves by cofinality of cartesian grids.

*Needs:* EnhancedDerivedSheaves E0.3; EnhancedDerivedSheaves E0.5 (categorical equivalences and the coherent model); EnhancedDerivedSheaves E3.1 (cofinality); Mathlib `SSet.Quasicategory`.

**Checks.**

- For X the constant bisimplicial set on a point, both δ*₂X and δ*₂∇X are the point Δ⁰, and the map is the identity.
- For k = 2, E₀ the separated finite type maps of qcqs schemes, E₁ the proper maps and E₂ the open immersions, the factorization hypothesis is Nagata compactification and the admissibility of E₁ and E₂ is right cancellation for proper maps and open immersions; for E₁ = E₂ = identities the factorization hypothesis fails for every non-identity map, and the map of nerves is not full.
- The admissibility hypothesis cannot be dropped: surjections of finite sets are stable under pullback and composition, but for p: ∗ ⊔ ∗ → ∗ (surjective) and q: ∗ → ∗ ⊔ ∗ (not surjective) the composite p∘q is the identity, so the class is not admissible.

### 0.4 Three- and six-functor formalisms

Define a three-functor formalism on a geometric setup (C, E) as a lax symmetric monoidal functor D: Corr(C, E) → Cat∞, equivalently a map of ∞-operads Corr(C, E)^⊗ → Cat∞^× (HM Definition 3.1.1, HM line 1633; SixFF Definition 2.4, SixFF line 509; RCSolid Definition 6.1.4, RCSolid line 3688). It is stable or presentable if it factors through stable ∞-categories with exact functors, or through Pr^L with Lurie's tensor product. Extract the pullback f* = D(X ← Y = Y), the exceptional pushforward f_! = D(Y = Y → X) for f ∈ E, and the tensor product ⊗ on D(X) as exterior product followed by diagonal pullback (HM Definition 3.1.4, HM line 1651). Define a six-functor formalism as a three-functor formalism in which every D(X) is closed, every f* has a right adjoint f_*, and every f_! for f ∈ E has a right adjoint f^! (HM Definition 3.2.1, HM line 1806; SixFF Definition 2.5, SixFF line 535). Define morphisms of three-functor formalisms on (C, E) as symmetric monoidal natural transformations of lax symmetric monoidal functors.

The API consists of the following facts.

- Base change: for a pullback square with f ∈ E and arbitrary g, the canonical map g* f_! ≅ f′_! g′* is an equivalence; f* is symmetric monoidal; projection formula M ⊗ f_!N ≅ f_!(f*M ⊗ N) (HM Proposition 3.1.8, HM line 1734).
- In a six-functor formalism: (g∘f)_* ≅ g_* f_* and (g∘f)^! ≅ f^! g^!; f^! Hom(M, N) ≅ Hom(f*M, f^!N); f_* Hom(f*M, N) ≅ Hom(M, f_*N); exceptional base change g′_* f′^! ≅ f^! g_* (HM Proposition 3.2.2, HM line 1824).
- A presentable three-functor formalism on a setup with final object ∗ factors through D(∗)-linear presentable categories Pr^L_{D(∗)} (RCSolid Remark 6.1.5, RCSolid line 3691; HM Lemma 3.1.9, HM line 1789).
- Restriction along a morphism of setups (C′, E′) → (C, E) carries three-functor formalisms to three-functor formalisms, and restriction to a slice ((C_E)/S, all) gives D_S.

*Needs:* 0.2; EnhancedDerivedSheaves E5:abstract.1; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:presentability.2 (Pr^L and its tensor product); EnhancedDerivedSheaves E3.2 (adjoints).

**Checks.**

- For C the category of finite sets, E = all and D(X) = Fun(X, D(Λ)) = ∏_X D(Λ) with f* restriction along f, f_! is summation over fibres; for f: {1, 2} → {1}, f_!(M₁, M₂) = M₁ ⊕ M₂ = f_*(M₁, M₂), and the projection formula reads N ⊗ (M₁ ⊕ M₂) ≅ (N ⊗ M₁) ⊕ (N ⊗ M₂).
- The constant functor X ↦ D(Λ) sending every span to the identity, with ⊗ as lax structure, is a (degenerate) three-functor formalism with f* = f_! = id; so the axioms do not force D(∅) = 0, which is a sheaf condition (0.6), while the finite-set formalism has D(∅) = ∗ (the empty product).
- Declaring f_! = f_* for every continuous map of locally compact Hausdorff spaces does not define a three-functor formalism: for j: (0, 1) → [0, 1] and the inclusion i of the point 0, i* j_* ℤ = ℤ while j′_* i′* ℤ = 0 for the empty fibre product, so base change fails.

### 0.5 The construction principle

Let (C, E) be a geometric setup with C admitting pullbacks, and let I, P ⊆ E be a suitable decomposition: I and P contain the identities and are stable under composition and pullback, every f ∈ E factors as p∘j with j ∈ I and p ∈ P, I and P are right cancellative, and every morphism of I ∩ P is n-truncated for some n ≥ −2 (HM Definition 3.3.2, HM line 1911; SixFF Lecture IV, assumption (1), SixFF line 901). Let D₀: C^op → CAlg(Cat∞) be given such that (a) for j ∈ I, j* has a left adjoint j_♮ satisfying base change along all maps of C and the projection formula; (b) for p ∈ P, p* has a right adjoint p_* satisfying base change and the projection formula; (c) for every pullback square with j ∈ I and p ∈ P, the canonical map j_♮ p′_* → p_* j′_♮ is an equivalence. Prove that D₀ extends to a three-functor formalism D on (C, E), canonically, such that j_! = j_♮ for j ∈ I and p_! = p_* for p ∈ P; if D₀ takes values in CAlg(Pr^L), so does D (HM Proposition 3.3.3, HM line 1924; Man22 Proposition A.5.10, Man22 line 12675; SixFF Theorem 4.6, SixFF line 1016).

A proof route: by 0.3(1) it suffices to give a map out of the restricted nerve δ*Corr(C, E)^{contra,co}; by 0.3(2) applied to E₀ = E, E₁ = P, E₂ = I it suffices to give a map out of δ*Corr(C, I, P)^{contra,co,co}. Start from the composite δ*Corr(C, I, P)^{contra,contra,contra} → C^op → CAlg(Cat∞), pass to left adjoints in the I-direction using (a) and to right adjoints in the P-direction using (b) and (c), through the subcategories of Fun(Δ^k, Cat∞) consisting of left (or right) adjoint ladders whose squares are adjointable. The symmetric monoidal structure is handled by the same construction for (C^{×′}, E^×) (SixFF line 1020 to SixFF line 1132; HM Remark 1.2.1, HM line 293).

*Needs:* 0.2; 0.3; 0.4; EnhancedDerivedSheaves E3.4 (mates and adjointable squares); EnhancedDerivedSheaves E0.7 (straightening); EnhancedDerivedSheaves E5:abstract.1.

The API consists of the following facts.

- Condition (c) holds automatically for objects of the form f′*N ⊗ j′*N′ (HM Lemma 3.3.4, HM line 1976), and holds for all objects when j is a monomorphism (SixFF Remark 4.2, SixFF line 918).
- In the resulting formalism j_! is fully faithful when j ∈ I is a monomorphism (HM Remark 3.3.6, HM line 2042).
- If D₀ factors through D₀′ via a natural transformation satisfying (a)–(c) compatibly, the extensions are related by a morphism of three-functor formalisms.

**Checks.**

- For C = finite sets, E = P = all and I = identities, the extension of X ↦ Fun(X, D(Λ)) recovers the formalism of the first Check of 0.4, with f_! = f_* the fibrewise sum.
- For qcqs schemes with I the open immersions and P the proper maps, condition (c) for the open immersion j: 𝔾_m → 𝔸¹ and the proper map p: ℙ¹ → ∗ is the statement that j_♮ commutes with p_*, which holds since j is a monomorphism (SixFF Remark 4.2).
- Condition (c) is not automatic: on the category of sets with I = P = all and D₀(X) = Fun(X, D(Λ)), conditions (a) and (b) hold with f_♮ the fibrewise sum and f_* the fibrewise product, but for j = p = (ℕ → ∗) the map j_♮ p′_* → p_* j′_♮ is ⊕_m ∏_n Λ → ∏_n ⊕_m Λ, which misses the identity matrix; so no formalism with j_! = j_♮ and p_! = p_* exists, as the principle would force f_♮ ≅ f_* on I ∩ P.

### 0.6 Extension to sheaves

Let (C, E) be a geometric setup with C a subcanonical site, and call a six-functor formalism D on (C, E) sheafy if D*: C^op → Cat∞ satisfies descent (HM Definition 3.4.1, HM line 2057; RCSolid Definition 6.2.9, RCSolid line 3912). Prove: if D is a sheafy presentable six-functor formalism, there is a minimal class E′ of morphisms of Shv(C) such that (C, E) → (Shv(C), E′) is a morphism of geometric setups and D extends uniquely to a six-functor formalism on (Shv(C), E′), and E′ is local on the target (f ∈ E′ when every base change to an object of C is), local on the source and target for covers of universal !-descent, tame (every f: Y → X in E′ with X ∈ C is !-locally on the source in E) and stable under disjoint unions when the inclusions X → X ⊔ Y lie in E (HM Theorem 3.4.11 and Lemma 3.4.13, HM line 2258, HM line 2329; SixFF Theorem 5.19, SixFF line 1576; RCSolid Theorem 6.2.11, RCSolid line 3924). The same holds for hypersheaves when C is hypersubcanonical. Define universal ∗-descent and universal !-descent of a morphism by the Čech nerve and pullback functors (RCSolid Definition 6.1.6, RCSolid line 3767), and the D-topology generated by subcanonical covers of universal ∗- and !-descent.

A proof route: enlarge E in three steps, each by left Kan extension of D along the Yoneda embedding: to disjoint unions (Man22 Proposition A.5.12), to maps that become admissible after precomposition with a cover of universal !-descent (Man22 Proposition A.5.14), and to maps whose base changes to representables are admissible; iterate countably and take the union (SixFF line 1579 to SixFF line 1600).

*Needs:* 0.4; EnhancedDerivedSheaves E2.6–E2.7 (sheaves and hypersheaves of spaces); EnhancedDerivedSheaves E3.1 (Kan extensions); EnhancedDerivedSheaves E5:presentability.2 (limits in Pr^L).

**Checks.**

- The inclusion C → Shv(C) is a morphism of setups: E ⊆ E′, and on objects of C the extended D agrees with the given one (D* of a sheaf is the right Kan extension, so D*(colim X_i) = lim D*(X_i)).
- For the trivial topology and an infinite family X_i → X of maps in E, the disjoint union ⊔_i X_i → X is a presheaf map outside C that lies in E′ by stability under disjoint unions, with D(⊔ X_i) = ∏ D(X_i).
- For C the finite sets with jointly surjective covers and D(X) = Fun(X, D(Λ)), descent along a surjection Y → X is the statement that a family of objects over the fibres with descent data is a family over X, which holds since D turns finite coproducts into products; this formalism is sheafy. The constant three-functor formalism X ↦ D(Λ) of 0.4 is not sheafy: the empty family covers ∅, forcing D(∅) to be the terminal ∞-category, whereas the constant formalism has D(∅) = D(Λ).

### 0.7 The bicategory of kernels

Construct, for a three-functor formalism D on (C, E) and S ∈ C, the bicategory hK_{D,S} (a Mathlib `CategoryTheory.Bicategory`): objects are the morphisms X → S in E; the category of 1-morphisms from Y to X is the homotopy category hD(X ×_S Y); horizontal composition is the convolution M ⋆ N = π₁₃!(π₁₂*M ⊗ π₂₃*N); the identity of X is Δ!1; the associator and unitors come from base change and the projection formula of 0.4 (HM Definition 4.1.3, HM line 2836; RCSolid Definition 6.2.1, RCSolid line 3795; SixFF line 1255 to SixFF line 1280). Construct the pseudofunctor Φ from the homotopy 2-category of Corr((C_E)/S) (the span X ← Z → Y going to (g, f)!1 ∈ D(Y ×_S X)) and the pseudofunctor Ψ = Fun_S(S, −): hK_{D,S} → hCat∞ sending X to D(X) and M: Y → X to π₁!(M ⊗ π₂*−), with Ψ∘Φ the homotopy shadow of D (HM Proposition 4.1.5, HM line 2876; RCSolid Remark 6.2.3 and Notation 6.2.4, RCSolid line 3823). The homotopy 2-category of the (∞,2)-category of HM Definition 4.1.3 is this bicategory; only it is used.

The API consists of the following facts.

- Self-duality: an equivalence of bicategories hK_{D,S}^op ≃ hK_{D,S} that is the identity on objects and reads M ∈ D(X ×_S Y) as a 1-morphism in either direction (HM Proposition 4.1.4, HM line 2867).
- For f: Y → X over S, the 1-morphisms f_! = Φ(Y = Y → X) and f* = Φ(X ← Y = Y) are mutually dual, and Ψ sends them to f_! and f* (RCSolid Notation 6.2.4, RCSolid line 3841).
- Functoriality: a morphism α: D → D′ of three-functor formalisms induces a pseudofunctor hK_{D,S} → hK_{D′,S} that is the identity on objects (HM Proposition 4.2.1(i), HM line 2924); a morphism g: S′ → S induces a pseudofunctor g*: hK_{D,S} → hK_{D,S′} by base change (HM Theorem 4.2.4 at the level of homotopy 2-categories, HM line 3073), which is conservative on 1-morphisms when g is of universal ∗-descent (HM Proposition 4.3.1, HM line 3193).
- If D is presentable and Künneth over S, that is D(Y) ⊗_{D(S)} D(X) ≃ D(Y ×_S X) for all X, Y ∈ (C_E)/S, then Ψ is 2-fully faithful into the homotopy 2-category of D(S)-linear presentable ∞-categories: D(X ×_S Y) → Fun^L_{D(S)}(D(Y), D(X)) is an equivalence (RCSolid Lemma 6.3.6, RCSolid line 4117; RC26a Proposition 2.1.9, RC26a line 382).

*Needs:* 0.4; Mathlib `CategoryTheory.Bicategory`; Mathlib `CategoryTheory.Pseudofunctor`; Mathlib `CategoryTheory.Bicategory.Equivalence`; EnhancedDerivedSheaves E5:presentability.2 (module base change and dualizable linear categories).

**Checks.**

- For S = ∗ and C the one-point category with D(∗) = D(Λ), hK has one object, its endomorphism category is hD(Λ) and composition is ⊗_Λ with unit Λ; this is the delooping of the monoidal category hD(Λ).
- For the finite-set formalism with S = ∗, X = Y = {1, 2}, the convolution of kernels is matrix multiplication and the identity kernel is the diagonal matrix with entries Λ; convolution with the identity kernel returns every kernel.
- Replacing π₁₃! by π₁₃* in the convolution changes nothing for finite sets but breaks the compatibility with Ψ in general: in the solid formalism of 3.4 over S = Spec k, for X = 𝔸¹_k and M = N = O_X read as 1-morphisms S → X and X → S, the convolution N ⋆ M is π_!O = T⁻¹k[[T⁻¹]][−1] by the convention witness, while π_*O = k[T]; only the first agrees with Ψ(N)∘Ψ(M) applied to k.

### 0.8 Suave and prim objects

For a three-functor formalism D on (C, E), a morphism f: X → S in E and M ∈ D(X), define M to be f-suave if M, read as a 1-morphism X → S in hK_{D,S}, is a left adjoint in the sense of `CategoryTheory.Bicategory.Adjunction`, with right adjoint its suave dual SD_f(M) ∈ D(X); and f-prim if M is a right adjoint, with left adjoint its prim dual PD_f(M) (HM Definition 4.4.1, HM line 3225; SixFF Definition 6.1, SixFF line 1667; RCSolid Definition 6.2.5, RCSolid line 3859).

The API consists of the following facts.

- For f = id_S, M is suave iff M is prim iff M is dualizable in D(S), and SD_{id}(M) = PD_{id}(M) = M^∨ (HM Example 4.4.3, HM line 3258; SixFF Proposition 6.14, SixFF line 1828).
- In a six-functor formalism, put D_f(M) = Hom(M, f^!1) and let p₁, p₂: X ×_S X → X be the projections. Then M is f-suave iff the natural map p₁*M ⊗ p₂*D_f(M) → Hom(p₂*M, p₁^!M) is an equivalence (it suffices to check this on global sections after applying Δ^!), and then SD_f(M) = D_f(M) and SD_f(M) ⊗ f* ≅ Hom(M, f^!) as functors D(S) → D(X), compatibly with every base change S′ → S (SixFF Propositions 6.5–6.6, SixFF line 1697, SixFF line 1718; HM Lemmas 4.4.5–4.4.6, HM line 3288, HM line 3309; RCSolid Proposition 6.2.6, RCSolid line 3869).
- Dually, M is f-prim iff f_*Hom(M, −) is computed by f_!(PD_f(M) ⊗ −), compatibly with base change (SixFF Propositions 6.8–6.9, SixFF line 1749, SixFF line 1770).
- Suave and prim objects are stable under base change along S′ → S, under tensoring with dualizable objects of D(X), under retracts and finite colimits in the stable case, and the suave dual of a suave object is suave with suave dual M (HM Lemmas 4.4.8–4.4.19, HM line 3339 to HM line 3478; SixFF Proposition 6.17, SixFF line 1854).
- A pseudofunctor induced by a morphism of formalisms or by base change preserves suave and prim objects and their duals.

*Needs:* 0.7; Mathlib `CategoryTheory.Bicategory.Adjunction`.

**Checks.**

- For f = id_S and D(S) = D(Λ), the unit 1 is suave and prim with dual 1, and ⊕_ℕ Λ is neither (it is not dualizable in D(Λ)).
- The zero object is suave and prim for every f, with zero duals.
- For the finite-set formalism and f: {1, 2} → ∗, kernels X → S are rows and kernels S → X are columns of Λ-modules. The row M = (Λ, 0) is f-suave with right adjoint the column (Λ, 0)ᵀ: the counit is the identity of the 1×1 product Λ, and the unit is the projection of the identity matrix diag(Λ, Λ) onto the column-times-row product diag(Λ, 0); the zigzag composites are identities. The row (Λ^{⊕ℕ}, 0) is not f-suave, since a right adjoint would have to be the column of duals and Λ^{⊕ℕ} has none.

### 0.9 Suave, prim and cohomologically smooth maps

Define f: X → S in E to be D-suave if 1_X is f-suave, with dualizing complex ω_f = SD_f(1); D-prim if 1_X is f-prim, with codualizing complex δ_f = PD_f(1); D-smooth if it is D-suave with ω_f invertible (HM Definition 4.5.1, HM line 3505; RCSolid Definition 6.2.7, RCSolid line 3885). Define, after SixFF Definition 5.1 (SixFF line 1152), f to be cohomologically smooth if f^! exists, f^!(1) ⊗ f*(−) → f^!(−) is an equivalence, f^!(1) is invertible, and both properties and the base change map g′*f^!(1) → f′^!(1) hold after every base change; prove that cohomologically smooth is equivalent to D-smooth (HM Remark 4.5.2, HM line 3517). Prove the trace criterion: if every morphism of C lies in E and Y is final, f: X → Y is cohomologically smooth iff there is an invertible L ∈ D(X) with maps α: Δ!1_X → p₂*L and β: f_!L → 1_Y whose two composites (displayed in SixFF Theorem 5.5) are identities (SixFF Theorem 5.5, SixFF line 1195, with SixFF Lemma 5.6, SixFF line 1234).

The API consists of the following facts.

- D-suave and D-prim maps are stable under base change and composition, contain the equivalences, and ω and δ are compatible with base change and composition: ω_{g∘f} ≅ ω_f ⊗ f*ω_g (HM Lemmas 4.5.4–4.5.5, HM line 3536, HM line 3544).
- Locality: D-suaveness and D-primness are local on the target for covers of universal ∗-descent (HM Lemma 4.5.6, HM line 3558); a suave (resp. prim) cover g: X′ → X with f∘g suave (resp. prim) forces f suave (resp. prim) (HM Lemmas 4.5.7–4.5.8, HM line 3569, HM line 3572).
- For a D-prim map f: Y → X such that π₂*: D(Y ×_X Y) → D(Y) is conservative, an object P ∈ D(Y) is f-suave iff f_!P ∈ D(X) is dualizable (HM Lemma 4.5.10, HM line 3598). For D-suave f, ω_f ⊗ f* ≅ f^!; for D-prim f, f_!(δ_f ⊗ −) ≅ f_* (HM Corollary 4.5.11, HM line 3605).
- Every morphism of I in the construction principle 0.5 is cohomologically smooth with ω = 1, and every morphism of P is prim with δ = 1 (SixFF Remark 5.4, SixFF line 1177).

*Needs:* 0.8; 0.5; 0.6 (for universal descent).

**Checks.**

- The identity of S is D-smooth with ω = 1.
- For the finite-set formalism, every f is suave and prim with ω_f = δ_f = 1, because f_! = f_* is both adjoint to f*.
- For the formalism on light condensed anima of 4.1 with Λ = 𝔽_p and G = ℤ_p, the map ∗/ℤ_p → ∗ is D-smooth with ω = 𝔽_p[1], since ℤ_p is torsionfree pro-p of 𝔽_p-cohomological dimension 1 (HM Example 5.3.22, HM line 4937); so ω is invertible but not 1, and D-smooth does not mean trivial dualizing complex. For Λ = ℚ the same group gives ω = ℚ in degree 0 (HM Example 5.3.21).

### 0.10 Étale, proper, open and closed maps

For a six-functor formalism D on (C, E) and a truncated f: Y → X in E, define f to be D-étale if f is D-suave and Δ_f is D-étale or an equivalence, and D-proper if f is D-prim and Δ_f is D-proper or an equivalence, by induction on truncatedness (HM Definition 4.6.1, HM line 3731; SixFF Definitions 6.10 and 6.12, SixFF line 1786, SixFF line 1810; RCSolid Definition 6.2.14, RCSolid line 3954). Define f ∈ E to be an open map if it is D-étale and a monomorphism, and a closed map if it is D-proper and a monomorphism (RCSolid Definition 6.2.16, RCSolid line 3970).

The API consists of the following facts.

- D-étale and D-proper maps are stable under base change and composition, satisfy right cancellation, are local on the target for universal ∗-descent and local on the source for étale (resp. proper) covers (HM Lemma 4.6.3, HM line 3740).
- For D-étale f there is a natural equivalence f^! ≅ f*, and for D-proper f a natural equivalence f_! ≅ f_* (HM Lemma 4.6.4, HM line 3783; SixFF Propositions 6.11 and 6.13, SixFF line 1791, SixFF line 1813).
- For an open map f, f* is an open immersion of presentably symmetric monoidal stable ∞-categories (2.5) with f_! = f_♮ fully faithful; for a closed map f, f* is a closed immersion with f_! = f_*; both classes satisfy two-out-of-three on the left and base change, and D(X′) ⊗_{D(X)} D(Y) ≃ D(Y ×_X X′) for open and closed f (RCSolid Proposition 6.2.17, RCSolid line 3979).

*Needs:* 0.9; the last bullet of the API uses the open and closed immersions of presentably symmetric monoidal stable ∞-categories, which this layer defines in that bullet's own terms (fully faithful f_♮ or f_* with projection formula) and 2.5 develops.

**Checks.**

- An equivalence is étale, proper, open and closed.
- In the finite-set formalism every map is étale and proper (f^! = f* and f_! = f_* hold since f_! = f_* is two-sided adjoint), and the injections are exactly the open and closed maps.
- Zariski open immersions need not be open maps: in the algebraic formalism of 1.1 (I = equivalences, P = all), j: Spec ℤ[1/p] → Spec ℤ is affine, hence D-prim with j_! = j_*, and a monomorphism, hence a closed map; it is not D-étale, since j* = ℤ[1/p] ⊗ − does not preserve products and so has no left adjoint: (∏_n ℤ/pⁿ)[1/p] ≠ 0 (the image of (1, 1, 1, …) is nonzero) while ∏_n (ℤ/pⁿ)[1/p] = 0.

### 0.11 Exceptional descent

Prove, for a six-functor formalism D whose ∞-categories have countable limits and colimits and f: Y → X in E with Čech nerve f_n: Yⁿ → X: (i) if f is D-suave, then f^! is conservative iff the natural map colim_{[n]∈Δ^op} f_{n!} f_n^! 1 → 1 is an equivalence, in which case f is of universal ∗- and !-descent (suave descent); (ii) if D is stable, f is D-prim and f_*1 is a descendable algebra in D(X), then f is of universal ∗- and !-descent (prim or descendable descent) (HM Lemmas 4.7.1 and 4.7.4, HM line 3826, HM line 3858; HM Corollary 4.7.5, HM line 3890; RCSolid Proposition 6.2.8, RCSolid line 3899).

A proof route: for (i), suaveness makes f^! ≅ ω_f ⊗ f*, so descent reduces to Barr–Beck–Lurie for the comonad f*f_♮ with f_♮ = f_!(ω_f ⊗ −); for (ii), primness makes f_* linear and descendability gives the pro-constancy of the Amitsur tower, hence descent by EnhancedDerivedSheaves E5:descent.

*Needs:* 0.9; EnhancedDerivedSheaves E5:descent; EnhancedDerivedSheaves E5:abstract.5 (monadicity).

**Checks.**

- For f the fold map X ⊔ X → X (both summands mapping by the identity), f is étale and proper and has a section, and the colimit condition holds since the Čech nerve is split.
- For the affine formalism of 1.1 and f: Spec B → Spec A with B = A × A, f_*1 = A × A is descendable of index 1 (A is a retract), so f is a !-cover.
- For f: Spec ℚ → Spec ℤ in 1.1, f is prim with f_*1 = ℚ not descendable over ℤ (𝔽_p ⊗ ℚ = 0 with 𝔽_p ≠ 0, so base change is not conservative), and descent fails.

### 0.12 Künneth formalisms and !-descent

Call a presentable six-functor formalism D on (C, E), with C having finite limits, Künneth if D: C^op → CAlg(Pr^L) preserves pushouts, i.e. D(Y ×_X Z) ≃ D(Y) ⊗_{D(X)} D(Z). Prove that for a Künneth formalism and a family {Y_i → X} of maps in E with Čech nerve Y_• of ⊔ Y_i → X in presheaves, the following are equivalent: (a) the family has universal ∗- and !-descent; (b) D(X) → Tot D^!(Y_•) is an equivalence; (c) colim_{Δ^op} D_!(Y_•) → D(X) is an equivalence in Pr^L_{D(X)}; (d) Pr^L_{D(X)} → Tot Pr^L_{D(Y_•)} is an equivalence of ∞-categories, the transitions being base change along D(X) → D(Y_•); (e) the functor in (d) is fully faithful (RCSolid Proposition 6.3.7, RCSolid line 4146, a case of SixFF Theorem 5.12, SixFF line 1439). If moreover every unit 1_X is compact, every family of !-descent has a finite subfamily of !-descent (RCSolid Lemma 6.3.10, RCSolid line 4244). Define the !-topology as generated by the families of (a) that are subcanonical (RCSolid Definition 6.3.9, RCSolid line 4237).

A proof route: under Künneth every D(Y_i) is self-dual in Pr^L_{D(X)} with lower ! dual to upper ∗, so pullback Pr^L_{D(X)} → Pr^L_{D(Y)} has a two-sided adjoint (forgetful); then (b)⇔(c) by passing to right adjoints, (c)⇒(d) by the unit and counit computations, (e)⇒(a) by base change of linear categories (RCSolid line 4164 to RCSolid line 4236). For the finite subfamily, write 1_X as a colimit of objects pushed forward along finite subfamilies and use compactness and the coidempotence of the Čech conerve.

*Needs:* 0.4; 0.7 (self-duality in the Künneth case); EnhancedDerivedSheaves E5:presentability.2 (module categories in Pr^L and their limits); EnhancedDerivedSheaves E5:presentability.4 (dualizable linear categories).

**Checks.**

- For the affine formalism of 1.1, A → B is a !-cover iff B is descendable over A (Mat16 Proposition 3.20, Mat16 line 948, with (b)); for ℤ → ℤ[1/p] × ℤ_p this holds, since the fracture square ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p exhibits ℤ as a finite limit of modules over the factors.
- The empty family covers X iff D(X) = 0.
- A family of open immersions covering only part of the underlying space fails (b): for ℤ → ℤ[1/p], 𝔽_p ⊗ ℤ[1/p] = 0, so D(ℤ) → D(ℤ[1/p]) is not conservative.

### 0.13 !-equivalences and the ∞-topos of D-stacks

Let C be a small ∞-category with finite limits, finite coproducts and a final object, (C, E) a geometric setup with ∗ → ∗ ⊔ ∗ in E, and D a Künneth presentable six-functor formalism on (C, E) satisfying RCSolid Hypothesis 6.3.11 (D*-descent along a cone implies that representables send it to a limit; RCSolid line 4283). Extend D_! by left Kan extension to presheaves on C_E. Define a map f: Y → X of presheaves on C_E to be a !-equivalence if every pullback of every iterated diagonal of f is sent to an equivalence by D_!, and define gShv(C_E) ⊆ P(C_E) as the full subcategory of presheaves inverting every ℵ₁-compact !-equivalence, and gShv(C) ⊆ Shv(C) as the sheaves whose restriction to C_E inverts !-equivalences (RCSolid Definitions 6.3.13 and 6.3.16, RCSolid line 4295, RCSolid line 4338). Prove: (1) for a family of !-descent, the image subpresheaf X′ ⊆ X is a !-equivalence onto X, and every !-equivalence is ∞-connective for the !-topology, so that hypersheaves ⊆ gShv ⊆ sheaves (RCSolid Lemma 6.3.14, RCSolid line 4299); (2) gShv(C_E) is an ∞-topos, a cotopological left exact accessible localization of Shv(C_E) (RCSolid Corollary 6.3.15, RCSolid line 4330; ABFJ22 Theorem 4.3.3, ABFJ22 line 85); (3) D* inverts !-equivalences (RCSolid Proposition 6.3.18, RCSolid line 4358); (4) D extends uniquely to a six-functor formalism on (gShv(C), E′) with E′ satisfying the conclusions of 0.6 (RCSolid Corollary 6.3.19, RCSolid line 4364); (5) a left exact functor F: D → P(C) from a site with fibre products sending covers to !-covers extends to a left exact colimit-preserving functor of sheaf topoi, which descends to a cotopological localization T of Shv(D) once ∞-connective maps inverted in T go to !-equivalences; and a left exact morphism of geometric setups with Künneth restricted formalism induces a left exact colimit-preserving functor gShv(C₁) → gShv(C) (RCSolid Lemmas 6.3.20–6.3.21, RCSolid line 4370, RCSolid line 4381). (6) A sub-prestack of full subcategories F ⊆ D* that is a sheaf for the !-topology and is fully faithful along !-hypercovers inverts every !-equivalence (ABLB Lemma 4.2.11 and its proof, ABLB line 2235 to ABLB line 2252, with Man22 Proposition A.3.21).

A proof route: (2) applies ABFJ22 Theorem 4.3.3 to the class of ℵ₁-compact !-equivalences, which is stable under base change and diagonals by definition; (3) reduces to affine X and writes D(X) = colim D(Y_i) in Pr^L_{D(X)}, whose dual is the limit of the D(Y_i) along pullbacks by 0.7; (6) combines the sheaf property with the hypercover criterion Man22 Proposition A.3.21 (ABLB Remark 4.2.5, ABLB line 2162).

*Needs:* 0.6; 0.12; 0.7; EnhancedDerivedSheaves E2.6–E2.7; EnhancedDerivedSheaves E3.2 (accessible localizations); EnhancedDerivedSheaves E5:presentability.2.

**Checks.**

- The identity is a !-equivalence and the empty presheaf maps to X by a !-equivalence iff D(X) = 0.
- For the affine formalism of 1.1, the image of Spec(ℤ × ℤ) → Spec ℤ is all of Spec ℤ, and the map is a !-equivalence by (1), the family being descendable.
- A map of presheaves inducing an equivalence on D_! but not on its diagonal is not a !-equivalence: the omission of the diagonal condition was the error corrected in ABLB footnote 26 (ABLB line 2175), and without it the class is not stable under diagonals and ABFJ22 Theorem 4.3.3 does not apply.

### Examples

The finite-set formalism X ↦ Fun(X, D(Λ)) with E = all is a Künneth six-functor formalism in which every map is suave, prim, étale and proper; its kernels are matrices of Λ-modules. The affine quasi-coherent formalism of 1.1 is Künneth, and its !-covers are the descendable maps.

### Dependencies

Mathlib `SSet.Quasicategory`, `CategoryTheory.Bicategory`, `CategoryTheory.Bicategory.Adjunction`, `CategoryTheory.Bicategory.Equivalence`, `CategoryTheory.Pseudofunctor`, `CategoryTheory.Span.SpanBicat`, `CategoryTheory.MorphismProperty.IsStableUnderBaseChange`, `CategoryTheory.MorphismProperty.diagonal`, `CategoryTheory.MorphismProperty.IsMultiplicative`; EnhancedDerivedSheaves E0.3–E0.7, E2.6–E2.7, E3.1–E3.4, E5:abstract.1–5, E5:presentability.2 and .4, E5:descent; 1.1 and 4.1 appear in Checks only.

## Layer 1: Quasi-coherent six functors on algebraic stacks

### 1.1 The affine quasi-coherent formalism

Let Sch^aff = Ring^op be the ∞-category of affine derived schemes (animated commutative rings), with E = P = all morphisms and I = equivalences. Prove that R ↦ D(R) = Mod_R(D(ℤ)) and R ↦ D^cond(R) = Mod_R(D(ℤ^cond)) = D(R) ⊗_{D(ℤ)} D(ℤ^cond) satisfy the hypotheses of 0.5 and so define presentable Künneth six-functor formalisms on (Sch^aff, all) with f_! = f_* for every map, together with a morphism of formalisms D → D^cond (RCSolid §6.4, RCSolid line 4457 to RCSolid line 4464). Prove the duality formula D^cond = Fun_{D(ℤ)}(D_!, D(ℤ^cond)) for the left Kan extensions D_! and D^cond_! = D_! ⊗_{D(ℤ)} D(ℤ^cond) to presheaves (RCSolid Remark 6.4.1, RCSolid line 4465).

A proof route: condition (b) of 0.5 for p: Spec B → Spec A is the projection formula and base change for the forgetful functor Mod_B → Mod_A, both formal for module categories over commutative algebras (Lurie's HA Theorem 4.8.4.6 in the form of EnhancedDerivedSheaves E5:presentability.2); (a) and (c) are vacuous for I = equivalences. Künneth is Mod_{B ⊗_A C} ≃ Mod_B ⊗_{Mod_A} Mod_C.

*Needs:* 0.5; 0.12; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:presentability.2; SolidAnalyticRings §1.5 (D(ℤ^cond)); EnhancedDerivedSheaves E5:animation.4 (θ).

The API consists of the following facts.

- Every map is D-prim with δ = 1, and f^! = Hom_A(B, −) for f: Spec B → Spec A.
- A map Spec B → Spec A is D-suave iff B is a dualizable (perfect) A-module (0.9 with HM Lemma 4.5.10); it is then cohomologically smooth iff ω = Hom_A(B, A) is an invertible B-module.
- The morphism D → D^cond is symmetric monoidal on each object, fully faithful with image the discrete objects (RCSolid Remark 5.4.2, RCSolid line 4473), and commutes with all six operations along maps of affines.

**Checks.**

- For f: Spec ℤ[T]/(T²) → Spec ℤ, B is free of rank 2, f is suave and ω = Hom_ℤ(B, ℤ) is generated as a B-module by the functional dual to T, so ω ≅ B is invertible and f is cohomologically smooth in this formalism. For B = ℤ[x, y]/(x², xy, y²), free of rank 3, f is suave but ω = Hom_ℤ(B, ℤ) needs the two generators dual to x and y, so ω is not invertible and f is not D-smooth.
- For f: Spec ℤ[T] → Spec ℤ, B is not perfect over ℤ and f is not suave in this formalism, although it is in the solid one (6.3): the choice of coefficients decides suaveness.
- For the zero ring, D(0) = 0 and the unique map Spec 0 → Spec ℤ is suave with ω = 0.

### 1.2 The !-topology and algebraic stacks

Prove that a finite family {A → B_i} of maps of animated rings is a !-cover for D (equivalently for D^cond) iff A → ∏_i B_i is descendable (RCSolid Remark 6.4.2, RCSolid line 4490; 0.12 with Mat16 Proposition 3.20, Mat16 line 948), and that a map of presheaves on Sch^aff is a !-equivalence for D iff it is one for D^cond (RCSolid line 4492 to RCSolid line 4500). Define AlgStk = gShv(Sch^aff) of 0.13, the algebraic stacks of the !-topology (RCSolid line 4482; the name is the source's and differs from the classical notion). Prove: (1) an ω₁-compact faithfully flat map of animated rings is descendable of index at most 2 (RCSolid Lemma 6.4.3, RCSolid line 4508; Mat16 Proposition 3.31, Mat16 line 1134); (2) every ω₁-compact faithfully flat hypercover A → A_• has |Spec A_•| → Spec A a !-equivalence (RCSolid Proposition 6.4.5, RCSolid line 4519), so that there are left exact colimit-preserving functors from accessible ω₁-fpqc hypersheaves to AlgStk (RCSolid Corollary 6.4.6, RCSolid line 4562); (3) for a !-hypercover A → B_•, |Spec B_•| → Spec A is a homeomorphism of underlying spaces (RCSolid Lemma 6.4.8, RCSolid line 4598, with BHL17 Theorem 1.10, BHL17 line 134); (4) every derived scheme X, as a functor on discrete animated rings, satisfies !-descent and inverts !-equivalences, giving a fully faithful embedding Sch ⊆ AlgStk (RCSolid Proposition 6.4.9, RCSolid line 4614).

A proof route: (1) the cofibre Q of A → B is a countable filtered colimit of finite free modules by Lazard, so Q ⊗ Q has projective dimension at most 1 and Q ⊗ Q[−2] → A vanishes; (2) reduce by Man22 Proposition A.3.21 to full faithfulness of D(A) → Tot D^!(A_•), proved by a connectivity estimate on the simplicial object Hom_A(A_n, M) and coskeletal approximation; (3) idempotent algebras of Zariski opens descend along descendable maps and are recognized by BHL17 Theorem 1.10; (4) reduce by (3) and Zariski descent to the affine case, where the !-topology is subcanonical by 0.13 and Hypothesis 6.3.11.

*Needs:* 1.1; 0.12; 0.13; EnhancedDerivedSheaves E5:descent; SchemeAndStackFoundations §2.18 (derived quasi-coherent complexes on schemes).

The API consists of the following facts.

- AlgStk is an ∞-topos, D* extends to it with D(colim X_i) = lim D(X_i), and the formalism D extends to (AlgStk, E′) by 0.13(4).
- Descendable maps compose and are stable under base change, so !-covers form a pretopology.
- For a scheme X, D(X) is the ∞-category of quasi-coherent complexes of SchemeAndStackFoundations §2.18 (the limit over affine opens).

**Checks.**

- ℤ → ℤ[1/p] × ℤ_p is descendable (the fracture square exhibits ℤ as a finite limit of the factors), so it is a !-cover; ℤ → ℚ is not, since 𝔽_p ⊗ ℚ = 0.
- For a field k and a finite extension k → l, l is a finite free k-module, so the map is faithfully flat and ω₁-compact, descendable of index 1 (k is a retract of l).
- The empty family covers Spec A only for A = 0.

### 1.3 Schemes are prim

Prove that every qcqs morphism of schemes f: Y → X is !-able for D and D^cond, D-prim, with a trivialization δ_f ≅ 1 of its codualizing complex (RCSolid Proposition 6.4.7, RCSolid line 4568).

A proof route: affine maps are prim with δ = 1 by 1.1; quasi-compact separated maps are reduced to affine ones by a finite affine cover, which is prim and descendable (Zariski descent, 0.11(ii)); qcqs maps are reduced to the separated case by a cover with affine diagonal; the trivialization of δ_f is glued from the affine ones through HM Lemma 4.6.4 applied to the diagonal.

*Needs:* 1.2; 0.9; 0.10; 0.11.

**Checks.**

- For the open immersion j: 𝔸¹ ∖ {0} → 𝔸¹, j is affine, so prim with j_! = j_* in this formalism (not the extension by zero of the étale formalism).
- For ℙ¹_ℤ → Spec ℤ, f_! = f_* sends O to ℤ (global sections of O_{ℙ¹}), and δ ≅ 1.
- The trivialization δ_f ≅ 1 does not say ω_f exists: ℙ¹ → Spec ℤ is not D-suave in the algebraic formalism, its suaveness being a statement about the solid formalism (6.6).

### 1.4 Formal completions

For a scheme X and a locally closed subset C ⊆ |X|, define the formal completion X^∧_C ⊆ X as the substack of maps Spec A → X whose image lies in C (RCSolid Definition 6.4.10, RCSolid line 4641). Prove: (1) for X = Spec A and Z = V(f₁, …, f_n) with π₀A ⊇ I = (f₁, …, f_n), colim_k Spec(A/^L(f₁^k, …, f_n^k)) → X^∧_Z is an equivalence of algebraic stacks (RCSolid Proposition 6.4.12, RCSolid line 4650); (2) for A → B surjective on π₀ with kernel I finitely generated by f₁, …, f_n, Spec B → X^∧_Z is a !-epimorphism iff A/^L(f) → B is descendable, which holds for A and B static (RCSolid Lemma 6.4.13 and Corollary 6.4.14, RCSolid line 4687, RCSolid line 4695; Mat16 Proposition 3.34, Mat16 line 1174); (3) for Z locally cut out by finitely generated ideals, j: X^∧_Z → X is !-able and an open map in the sense of 0.10 (j^! = j* and j_! is the fully faithful left adjoint of j*), the right adjoint j_*: D(X^∧_Z) → D(X) is fully faithful with essential image the derived I-complete quasi-coherent sheaves, and Z → X^∧_Z is a suave cover for Z = Spec A/^L(f) (RCSolid Lemma 6.4.15, RCSolid line 4702); (4) the formal completion f: 𝔸̂¹_ℤ → Spec ℤ at zero is D-suave with f^!ℤ ≅ O[1] (RCSolid Lemma 6.4.16, RCSolid line 4736).

A proof route: (1) reduce to one generator and the universal case colim_n Spec ℤ[X]/Xⁿ → 𝔸̂¹, and prove the diagonal is an equivalence through the pro-equivalence of the square-zero extensions ℤ[X, Y]/^L(Xⁿ, Yⁿ, X − Y) → ℤ[X]/Xⁿ; (3) the projections Z ×_{X^∧} Z = Spec(A/^L f ⊕ (A/^L f)[1]) → Z are suave by 1.1 (a perfect module), so Z → X^∧ is a suave cover (HM Lemma 4.5.7), j is suave with invertible diagonal hence étale and an immersion; the image of j_! is computed by derived Nakayama; (4) compute ι^!ℤ = Hom_{ℤ[T]}(ℤ, ℤ[T]) = ℤ[−1] for the zero section ι and use ι^!f^! = id.

*Needs:* 1.2; 1.3; 0.9; 0.10; EnhancedDerivedSheaves E4.1 (derived complete modules).

**Checks.**

- For U ⊆ X open, X^∧_U = U (RCSolid Example 6.4.11, RCSolid line 4647).
- For A = ℤ and Z = V(p), D(X^∧_Z) is derived p-complete ℤ-modules; ℤ_p lies in it and ℚ_p does not (its derived p-completion is 0).
- f^!ℤ ≅ O[1] has π₁ = O(𝔸̂¹) = ℤ[[T]] and π₀ = 0; the shift has the sign of a relative dimension one, opposite to the zero section's ι^!ℤ = ℤ[−1].

### 1.5 Classifying stacks of flat affine groups

Let A be a static ring and G = Spec R a flat affine group scheme over A, R a Hopf algebra flat over A whose counit R → A has finite Tor amplitude. Let BG ∈ AlgStk be the geometric realization of the bar construction and e: Spec A → BG the quotient map. Prove that D(BG) = Tot D(R^{⊗•}) carries a t-structure making e* t-exact, that D(BG)♡ is the abelian category of right R-comodules in A-modules and D(BG) the ∞-category of R-comodules in D(A), that eventually coconnective objects form the bounded-below derived ∞-category of the heart, and that D(BG) is its left completion (RC26a Lemma 2.2.5, RC26a line 583, stated for static analytic rings; the trivial analytic structure gives the algebraic case). If R is ω₁-compact over A, e is a !-cover and BG is !-able over A; if moreover the trivial comodule is a direct summand of R (G linearly reductive, e.g. diagonalizable), e is descendable (RC26a Lemma 3.1.2, RC26a line 1486).

A proof route: e is prim, so e* and e_* are D(A)-linear and e* is conservative as e is an epimorphism; comonadicity identifies D(BG) with comodules over the comonad e*e_* = R ⊗_A −; flatness and finite Tor amplitude make the cosimplicial diagram restrict to bounded-below objects.

*Needs:* 1.2; 0.11; EnhancedDerivedSheaves E5:abstract.5 (Barr–Beck–Lurie); SchemeAndStackFoundations §1.22 (comodules as abelian quasi-coherent sheaves on BG).

**Checks.**

- For G = 𝔾_m, R = A[T^{±1}] and D(B𝔾_m)♡ is ℤ-graded A-modules (a comodule is a grading by the exponent of T); this agrees with SchemeAndStackFoundations §1.22 on hearts.
- For G trivial, BG = Spec A and comodules over A are A-modules.
- For G = 𝔾_a over 𝔽_p, R = 𝔽_p[T] with Δ(T) = T ⊗ 1 + 1 ⊗ T. A comodule map φ: R → 𝔽_p to the trivial comodule satisfies φ(T) ⊗ 1 + φ(1) ⊗ T = φ(T) ⊗ 1, so φ(1) = 0 and the unit 𝔽_p → R has no comodule retraction: the summand criterion fails. Since R is countable and flat, e is nevertheless a !-cover by 1.2(1)–(2), descendable of index at most 2.

### 1.6 Graded and filtered modules

Prove symmetric monoidal equivalences, natural in the base animated ring R: D(B𝔾_m,R) ≃ Gr(D(R)) = Fun(ℤ^disc, D(R)) with Day convolution, and D(𝔸¹_R/𝔾_m) ≃ Fil(D(R)) = Fun((ℤ, ≤)^op, D(R)) with Day convolution, where 𝔾_m acts on 𝔸¹ by scaling and the coordinate t has weight −1; the second is D(𝔸¹/𝔾_m) = Mod_{R[t]}(D(B𝔾_m)) (Mou Theorems 4.1 and 1.1, Mou line 168, Mou line 26; RCSolid Remark 7.7.6, RCSolid line 5936). Prove that pullback along 𝔸¹ → 𝔸¹/𝔾_m is the Rees module ⊕_n Fil^n M t^{−n} (RCSolid Example 7.7.8, RCSolid line 5947), that pullback along 0: B𝔾_m → 𝔸¹/𝔾_m is the associated graded and pullback along 1: Spec R → 𝔸¹/𝔾_m the underlying object colim Fil^n M, and that D(𝔸̂¹_R/𝔾_m) is the full subcategory of complete filtered objects (lim_n Fil^n M = 0) (ALRS Remark 2.9.1 and the preceding paragraph, ALRS line 1860 to ALRS line 1866). The same equivalences hold after base change along D(R) → V for any presentable stable symmetric monoidal D(R)-linear V.

A proof route: Mou's proofs over the sphere apply to a connective commutative base by base change in Pr^L (EnhancedDerivedSheaves E5:presentability.2); for completeness, 𝔸̂¹/𝔾_m ⊆ 𝔸¹/𝔾_m is the formal completion along the closed substack B𝔾_m, so 1.4(3) identifies its quasi-coherent sheaves with derived t-complete Rees modules, which are the complete filtrations.

*Needs:* 1.4; 1.5; EnhancedDerivedSheaves E5:presentability.2; SchemeAndStackFoundations §1.21 ([𝔸¹/𝔾_m]).

**Checks.**

- The structure sheaf of 𝔸¹/𝔾_m is the filtration Fil^n = R for n ≤ 0 and 0 for n > 0, with Rees module R[t] (the coordinate t of weight −1 corresponds to the inclusions Fil^{n+1} ⊆ Fil^n); a weight +1 coordinate would give the increasing filtration instead.
- ι₀^!1 = Hom_{R[t]}(R, R[t]) = t^{−1}R[−1] is the weight-one line in homological degree −1 (RCSolid line 5902), the witness of the Conventions.
- The filtration Fil^n = ℤ for all n (constant, transition identities) is not complete: lim Fil^n = ℤ ≠ 0, so it is not in D(𝔸̂¹/𝔾_m); the p-adic filtration Fil^n = pⁿℤ_p is complete.

### 1.7 The formal line as a classifying stack, and shearing

Let G_a[−1] = Spec ℤ ×_{𝔸¹} Spec ℤ = Spec(ℤ ⊗^L_{ℤ[T]} ℤ) = Spec ℤ[ε₁], with ε₁ in homological degree 1 and ε₁² = 0, a group object of AlgStk under composition of loops. Prove that the zero section Spec ℤ → 𝔸̂¹ is a !-epimorphism, hence 𝔸̂¹ ≃ BG_a[−1] in AlgStk, and that this is 𝔾_m-equivariant: 𝔸̂¹/𝔾_m ≃ BG_a[−1]/𝔾_m with ε₁ of weight −1 (ALRS Remark 2.9.1, ALRS line 1893 to ALRS line 1899, stated over ℚ_{p,■}; the general base uses 1.4(2)–(3)). Prove, for V a presentable stable symmetric monoidal QCoh(ℚ)-linear ∞-category, that D(BG_a[−1]/𝔾_m) ⊗ V is equivalent to graded objects M = ⊕_n M_n of V with differentials d_n: M_n → M_{n−1}[1], d∘d = 0 with higher coherences, through the shearing M_n ↦ M_n[n]; that the Beilinson t-structure (M connective iff ⊕ M_n[n] connective) is a t-structure; and that its heart is the symmetric monoidal category of chain complexes in V♡ (ALRS Remark 2.9.2, ALRS line 1900; BZSV §6.3, BZSV line 5593).

A proof route: the zero section is a !-epimorphism by 1.4(2), so 𝔸̂¹ is the colimit of its Čech nerve, whose terms are G_a[−1]^n because 𝔸̂¹ → 𝔸¹ is a monomorphism; over ℚ the free animated algebra on ε₁ is exterior and its graded comodules shear to modules over a polynomial algebra on a weight-one degree-zero class, whence the description and the heart (BZSV §6.3 for shearing; the Beilinson t-structure as in ALRS Remark 2.9.2).

*Needs:* 1.4; 1.5; 1.6; EnhancedDerivedSheaves E5:abstract.4 (stable monoidal structures).

**Checks.**

- π₀ and π₁ of ℤ ⊗^L_{ℤ[T]} ℤ are both ℤ (Koszul resolution of ℤ by T), so G_a[−1] is not Spec ℤ; π₂ = 0 since ε₁² = 0 (exterior, not divided-power, in degree 1).
- A graded object concentrated in weight 0 with d = 0 is in the Beilinson heart iff M₀ is static; a static object in weight 1 is in the heart only after the shear places it in homological degree 1, i.e. it corresponds to M₁[1].
- The ℚ-linearity hypothesis of the source is kept for the graded description and the heart; over a general base the statement used is the complete-filtered description of 1.6, which for V = D(𝔽_p) still identifies D(𝔸̂¹/𝔾_m) ⊗ V with complete filtered objects of V.

### Examples

Graded modules on B𝔾_m, filtered modules on 𝔸¹/𝔾_m and complete filtered modules on 𝔸̂¹/𝔾_m; the p-adic completion of ℤ as the formal completion of Spec ℤ along V(p); comodules on B𝔾_m as graded modules.

### Dependencies

0.5, 0.9–0.13; EnhancedDerivedSheaves E4.1, E5:abstract.2, .4, .5, E5:presentability.2, E5:descent, E5:animation.4; SolidAnalyticRings §1.5; SchemeAndStackFoundations §§1.21–1.22, 2.18.

## Layer 2: Light analytic rings

### 2.1 Light condensed animated rings and their modules

Define, for an ∞-category C with countable limits, Cond(C) as the full subcategory of functors T from (light profinite sets)^op to C with T(∅) final, T(S₁ ⊔ S₂) ≃ T(S₁) × T(S₂), and T(S) ≃ Tot T(S_•) for every hypercover S_• → S (RCSolid Definition 4.0.1, RCSolid line 1392). Put CondAni = Cond(Ani) and CondRing = Cond(Ring) (RCSolid Example 4.0.2, RCSolid line 1408). For A▷ ∈ CondRing define D(A▷) = Mod_{θA▷}(D(ℤ^cond)), a presentable stable symmetric monoidal ∞-category with compact projective generators A▷[S] = A▷ ⊗ ℤ[S] for light profinite S, and A▷-linear internal Hom RHom_{A▷}(−, −).

The API consists of the following facts.

- Cond(C) is presentable when C is, limits are computed sectionwise, and evaluation at the point has a fully faithful left adjoint (discrete objects).
- A discrete animated ring R gives the discrete condensed ring R^cond, and D(R^cond) = D(R) ⊗_{D(ℤ)} D(ℤ^cond) (RCSolid Remark 5.4.2, RCSolid line 4471).
- For a map A▷ → B▷, base change B▷ ⊗_{A▷} − and restriction form an adjunction, with the projection formula; RHom_{A▷}(A▷[S], M) = RHom_ℤ(ℤ[S], M) (RCSolid Remark 4.1.2, RCSolid line 1457).

*Needs:* Mathlib `LightProfinite`; Mathlib `LightCondensed`; EnhancedDerivedSheaves E2.6–E2.7; EnhancedDerivedSheaves E5:animation.1; EnhancedDerivedSheaves E5:animation.4; EnhancedDerivedSheaves E5:abstract.2; SolidAnalyticRings §1.5.

**Checks.**

- T(∅) is the final object: a presheaf with T(∅) = ℤ (nonzero) as a condensed abelian group is excluded, and so is any value not sending ∅ to 0 in D(ℤ^cond).
- For S = {1, 2}, T(S) = T(∗) × T(∗); the free module ℤ[{1, 2}] is ℤ², and ℤ[∅] = 0.
- For the convergent sequence ℕ ∪ {∞}, π₀ of ℤ[ℕ ∪ {∞}] at the point is ⊕_{ℕ∪{∞}} ℤ, which lacks the all-one vector; its solidification ℤ × ∏_ℕ ℤ (SolidAnalyticRings §1.5) contains it, so D(A▷) for A▷ = ℤ^cond is not the solid category.

### 2.2 Analytic rings

Define an uncompleted analytic ring as a pair A = (A▷, D(A)) of A▷ ∈ CondRing and a full subcategory D(A) ⊆ D(A▷) that is closed under all limits and colimits, satisfies RHom_ℤ(C, M) ∈ D(A) for every C ∈ D(ℤ^cond) and M ∈ D(A), and whose left adjoint A ⊗_{A▷} − preserves connective objects; it is an analytic ring if moreover A▷ ∈ D(A) (RCSolid Definition 4.1.1, RCSolid line 1431; CSAnal Definition 12.1 and Proposition 12.20, CSAnal line 3015, CSAnal line 3320, in the κ-condensed setting). A morphism A → B is a map A▷ → B▷ whose restriction carries D(B) into D(A). Write A[T] = A ⊗_{A▷} A▷[T], AnRing^un and AnRing.

The API consists of the following facts.

- The trivial structure A▷^cond = (A▷, D(A▷)) gives a fully faithful functor CondRing → AnRing^un, left adjoint to (A ↦ A▷) (RCSolid Lemma 4.1.5, RCSolid line 1480).
- D(A) has a unique symmetric monoidal structure ⊗_A making A ⊗_{A▷} − symmetric monoidal, and for A → B the base change factors as B ⊗_A −: D(A) → D(B), left adjoint to restriction (RCSolid Proposition 4.1.6, RCSolid line 1491; SolidAnalyticRings §7.2 in the spectral setting).
- For an analytic ring A, A[∗] is compact projective in D(A) with endomorphisms A▷(∗), giving a fully faithful symmetric monoidal D(A▷(∗)) → D(A) onto the discrete A-modules (RCSolid Remark 4.1.7, RCSolid line 1522).
- M ∈ D(A▷) lies in D(A) iff every π_i M does, and D(A) inherits a t-structure (RCSolid Proposition 4.1.8, RCSolid line 1533).
- D(A) is compactly generated by the A[S], S light profinite, and its unit is compact.

*Needs:* 2.1; EnhancedDerivedSheaves E3.2 (adjoint functor theorem, accessible localizations); EnhancedDerivedSheaves E5:abstract.3 (monoidal localizations).

**Checks.**

- ℤ^cond = (ℤ, D(ℤ^cond)) and ℤ_■ = (ℤ, D(ℤ_■)) are analytic rings; ℤ_■[S] = lim_n ℤ[S_n] (SolidAnalyticRings §1.5).
- D(A) = {0} is an uncompleted analytic ring structure on every A▷, and an analytic ring only for A▷ = 0.
- The full subcategory of perfect A▷-modules is not closed under countable direct sums, so it is not an analytic ring structure; nor is the subcategory of discrete objects of D(ℤ^cond), which is closed under colimits but not under the limit ∏_ℕ ℤ.

### 2.3 Colimits, induced structures and completion

Prove: (1) for an uncompleted analytic ring A and an A▷-algebra B▷, the induced structure B▷_{A/} with D(B▷_{A/}) the B▷-modules whose underlying A▷-module is A-complete is an uncompleted analytic ring, equal to the pushout A ⊗_{A▷^cond} B▷^cond, and D(B▷_{A/}) = Mod_{B▷}(D(A)) (RCSolid Lemma 4.1.9, RCSolid line 1558); (2) the intersection of a family of uncompleted analytic ring structures on A▷ is one and is their colimit over A▷ (RCSolid Lemma 4.1.10, RCSolid line 1585); (3) AnRing^un has small colimits, computed on underlying condensed rings with the completeness condition restricted from each term (RCSolid Proposition 4.1.11, RCSolid line 1599); (4) AnRing is closed under sifted colimits in AnRing^un, with B[S] = colim A_i[S] (RCSolid Corollary 4.1.12, RCSolid line 1619); (5) for every analytic ring A and light profinite S with a C_p-action and fixed points S₀, A[S₀]^{tC_p} → A[S]^{tC_p} is an equivalence (RCSolid Lemma 4.3.1, RCSolid line 1861), and Frobenius A▷ → A▷/p is a map of analytic rings A → A/p (RCSolid Theorem 4.3.2, RCSolid line 1888); (6) for an uncompleted analytic ring A, completed symmetric powers make the A-completion A⊗_{A▷}A▷ an animated ring, so that the inclusion AnRing → AnRing^un has a left adjoint A ↦ A^∼ with D(A^∼) = D(A) and A^∼▷ = A[∗] (RCSolid Proposition 4.2.6, Corollary 4.2.7 and Theorem 4.1.13, RCSolid line 1795, RCSolid line 1850, RCSolid line 1636); (7) D: AnRing → CAlg(Pr^L_{D(ℤ^cond)}) preserves all small colimits; in particular D(B ⊗_A C) ≃ D(B) ⊗_{D(A)} D(C) (RCSolid Proposition 4.1.14, RCSolid line 1664).

A proof route: (1)–(4) from the description of mapping anima of analytic rings as full subanima of mapping anima of condensed rings; (5) from the vanishing of Tate constructions of free modules on free C_p-sets, which in the light setting needs no assumption; (6) by the monadic adjunction between connective modules and animated rings (RCSolid Proposition 4.2.4) and the invariance of completed symmetric powers under completion-equivalences, using (5) for p-primary pieces; (7) for sifted colimits by HA Corollary 4.8.5.14 inside Pr^L_{D(ℤ^cond)}, and for pushouts by factoring A → B as induced structure followed by a localization and using that D(A) → D(B) is then a symmetric monoidal localization at a tensor ideal.

*Needs:* 2.2; EnhancedDerivedSheaves E5:animation.1 (the monadic description of animated rings); EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:presentability.2.

**Checks.**

- (ℤ[T], ℤ)_■ = ℤ[T]_{ℤ_■/}, the structure induced from ℤ_■, has free modules ℤ_■[S] ⊗ ℤ[T] = (∏ℤ)[T] for infinite S, a polynomial ring over a product, not a product of polynomial rings.
- The pushout of ℤ_■ ← ℤ^cond → ℚ^cond is ℚ_{ℤ_■/}, whose complete modules are solid ℚ-modules; ℚ_p with its p-adic topology is one, ℚ_p ⊗ ℤ[ℕ ∪ {∞}] is not.
- For the coproduct ℤ_■ ⊔ ℤ_■ = ℤ_■ ⊗_ℤ ℤ_■ = ℤ_■ (ℤ^cond → ℤ_■ is idempotent), D(ℤ_■) ⊗_{D(ℤ^cond)} D(ℤ_■) = D(ℤ_■), an instance of (7).

### 2.4 Invariance of analytic ring structures

Prove: (1) for A▷ ∈ CondRing, uncompleted analytic ring structures on A▷ correspond bijectively to full subcategories C of the abelian category of π₀A▷-modules that are closed under limits, colimits and extensions, presentable, closed under all higher derived products, and closed under Ext^i_ℤ(ℤ[S], −) for light profinite S, via D(A) ↦ D(A) ∩ D♡(A▷) and C ↦ complexes with homotopy in C (RCSolid Theorem 4.4.1 and Proposition 4.4.2, RCSolid line 1898, RCSolid line 1912; CSAnal Proposition 12.19, CSAnal line 3304); (2) if π₀A▷ → π₀B▷ is an isomorphism, A ↦ B▷_{A/} is a bijection of uncompleted analytic ring structures (RCSolid Corollary 4.4.4, RCSolid line 1961); (3) the same holds if the kernel of π₀A▷ → π₀B▷ is nilpotent (RCSolid Proposition 4.4.5, RCSolid line 1968); (4) a map A▷ → B▷ is a map of analytic rings A → B as soon as the square of π₀ of the free modules on S → A▷ commutes (RCSolid Proposition 4.5.1, RCSolid line 2004).

*Needs:* 2.2; 2.3.

**Checks.**

- For A▷ = ℤ[ε]/ε² (discrete) and B▷ = ℤ, the solid structure on ℤ corresponds to the structure on ℤ[ε]/ε² of modules whose underlying abelian group is solid, by (3).
- The category of all π₀A▷-modules corresponds to the trivial structure, and {0} to the zero structure.
- The subcategory of torsion abelian groups is closed under colimits and extensions but not under products (∏_n ℤ/n is not torsion), so it gives no analytic ring structure on ℤ.

### 2.5 Idempotent algebras, the smashing spectrum and immersions

For C ∈ CAlg(Pr^L_st), define an idempotent algebra as a map μ: 1 → A with A ⊗ μ: A → A ⊗ A an equivalence, and the smashing spectrum Sm(C) as the opposite of the poset of idempotent algebras (RCSolid Definition 5.1.1, RCSolid line 2212). Prove that Sm(C) is a locale (a `Locale` in Mathlib's sense, up to universe size) whose closed subsets are idempotent algebras, with intersection A ⊗ A′, union A ×_{A⊗A′} A′ and arbitrary intersections colimits (RCSolid Proposition 5.1.2, RCSolid line 2237; CS22 Proposition 5.3, CS22 line 1924). Define a map f: Spec C → Spec E in CAlg(Pr^L_st)^op to be a closed immersion if f* has a colimit-preserving fully faithful right adjoint satisfying the projection formula, and an open immersion if f* has a fully faithful left adjoint satisfying the projection formula (RCSolid Definition 5.1.3, RCSolid line 2252), and prove that closed immersions are E → Mod_A(E) and open immersions E → E/Mod_A(E) for a unique idempotent A (RCSolid Proposition 5.1.4, RCSolid line 2268; CS22 Proposition 6.5, CS22 line 2543), with the explicit six functors of RCSolid Remark 5.1.5 (RCSolid line 2274). Prove that open covers (open immersions whose open subsets cover Sm(C)) form a Grothendieck topology for which C ↦ C is a sheaf (RCSolid Theorem 5.1.6, RCSolid line 2292; CS22 Theorem 6.7, CS22 line 2588). Prove, for an object A with maps m: A ⊗ A → A and μ: 1 → A with m∘(μ ⊗ id) = id, that the localization of C away from Hom(A, −) is computed by the transfinite iterate of F = Hom(fib(1 → A), −) when A is idempotent or Hom(A, −) preserves sequential colimits (RCSolid Lemma 4.6.1 and Proposition 4.6.2, RCSolid line 2040, RCSolid line 2091).

*Needs:* EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:presentability.3 (Verdier quotients); Mathlib `Locale`.

The API consists of the following facts.

- An object M is an A-module iff M → A ⊗ M is an equivalence iff Hom(A, M) → M is; the mapping anima between idempotent algebras are empty or contractible (RCSolid line 2226 to RCSolid line 2234).
- Open and closed immersions are stable under base change in CAlg(Pr^L_st) and under composition, and the base change of the open complement of A along C → C′ is the open complement of C′ ⊗ A.
- For a dualizable idempotent A, A and fib(1 → A) are complementary and 1 ≅ A × fib(1 → A) (RCSolid Lemma 7.6.6, RCSolid line 5741).

**Checks.**

- In D(R) for a ring R and f ∈ R, R[1/f] is idempotent; its closed subset has Mod_{R[1/f]} = D(R[1/f]) and its open complement is the derived f-complete modules (RCSolid Example 4.6.3, RCSolid line 2105).
- 0 and 1 are idempotent and give the empty and the whole closed subsets; R[T] is not an idempotent R-algebra, since R[T] ⊗_R R[T] = R[T, T′] ≠ R[T].
- For C = D(ℤ), the union of the closed subsets of ℤ[1/2] and ℤ[1/3] is fib(ℤ[1/2] ⊕ ℤ[1/3] → ℤ[1/6]) with the map (a, b) ↦ a − b, which is onto (1/6 = 1/2 − 1/3) with kernel the pairs (a, a), a ∈ ℤ[1/2] ∩ ℤ[1/3] = ℤ. So the union is the unit ℤ: the two closed subsets cover Sm(D(ℤ)), matching Spec ℤ = D(2) ∪ D(3) under the identification of Zariski opens with closed subsets of 2.7(10).

### 2.6 Comparison with spectral analytic structures

Prove that, for A▷ ∈ CondRing whose underlying condensed abelian group is solid, the Hℤ-linear comparison of SolidAnalyticRings §2.3 identifies analytic ring structures A over ℤ_■ on A▷ (those with ℤ_■ → A a map of analytic rings) with completed spectral analytic structures of SolidAnalyticRings §7.1 on the connective commutative algebra θA▷ ∈ Sp_■, compatibly with free complete modules, complete tensor products and completed scalar extension (SolidAnalyticRings §7.2), and that under this identification the coefficient structures (R, R⁺)_■, (R[T], π₀R)_■ and R[T]_■ of SolidAnalyticRings §7.3 are the analytic rings (R, R⁺)_■ of 2.7 and 2.8.

A proof route: SolidAnalyticRings §2.3 identifies Hℤ-modules in Sp_■ with D(SolidAb_light) symmetric monoidally, so Mod_{θA▷}(Sp_■) = Mod_{A▷}(D(ℤ_■)) ⊆ D(A▷), and the closure conditions correspond (Hom-closure under arbitrary A-modules versus under D(ℤ^cond), using RCSolid Remark 4.1.2); the test objects of SolidAnalyticRings §7.3 correspond to the T-solidity tests of RCSolid Definition 5.2.1.

*Needs:* 2.2; 2.3; SolidAnalyticRings §2.3; SolidAnalyticRings §7.1; SolidAnalyticRings §7.2; SolidAnalyticRings §7.3.

**Checks.**

- For A▷ = ℤ and the solid structure, both sides give D(ℤ_■) with unit ℤ.
- For A▷ = ℤ[T] with the induced structure (ℤ[T], ℤ)_■, the spectral side is SolidAnalyticRings §7.3 with F = ∅.
- An analytic ring not over ℤ_■, such as ℤ^cond itself, has no spectral counterpart in Sp_■: its complete modules include ℤ[ℕ ∪ {∞}], which is not solid.

### 2.7 Solid structures on discrete rings

Prove: (1) ℤ((T⁻¹)) = ℤ[[T⁻¹]][T] is an idempotent (ℤ[T], ℤ)_■-algebra, D(ℤ[T]_■) is the open complement of its closed subset in D((ℤ[T], ℤ)_■), with the semi-orthogonal decomposition and j*j_* = RHom(fib(ℤ[T] → ℤ((T⁻¹))), −) (RCSolid Proposition 5.2.2, RCSolid line 2419); (2) D(ℤ[T]_■) is an analytic ring structure on ℤ[T] with ℤ[T]_■[S] = lim_n ℤ[T][S_n] (RCSolid Theorem 5.2.3, RCSolid line 2434); (3) for variables T₁, …, T_n, ℤ[T₁]_■ ⊗_{ℤ_■} … ⊗_{ℤ_■} ℤ[T_n]_■ = ℤ[T₁, …, T_n]_■ (RCSolid Proposition 5.3.3, RCSolid line 2477); (4) for R of finite type over ℤ, R_■ (complete modules: r-solid for all r ∈ R, RCSolid Definition 5.3.1, RCSolid line 2466) is induced from ℤ[T₁, …, T_n]_■ along any surjection, R_■[S] = lim_n R[S_n], D(R_■) is the derived category of its heart, ⊗_{R_■} is the left derived functor of its abelian tensor, ∏_ℕ R is flat, the abelian category is Ind of finitely presented solid modules, and integral maps of finitely generated algebras give A_{R_■/} = A_■ (RCSolid Theorem 5.3.2, Corollary 5.3.4, Proposition 5.3.7 and Corollary 5.3.9, RCSolid line 2471, RCSolid line 2517, RCSolid line 2594, RCSolid line 2633; SixFF Theorem 9.6, SixFF line 3179); (5) for R of finite type and I ⊆ R an ideal, the I-adic completion R̂_I is an idempotent R_■-algebra with R̂_I ⊗_{R_■} R̂_J = R̂_{I+J}, and the solid tensor product of connective derived I-complete modules is derived I-complete (RCSolid Proposition 5.3.12, RCSolid line 2772); (6) R[T]_■ ⊗_{R_■} − = RHom_R(R((T⁻¹))/T R[T], −) for R of finite type (RCSolid Lemma 5.3.13, RCSolid line 2935); (7) for a commutative ring R, R_■ = colim_{B ⊆ R} B_■ over finitely generated subalgebras, the structure whose complete modules are r-solid for every r, and for animated R the structure induced from π₀(R)_■ by 2.4(2); then R is R_■-complete, (−)_■: Ring → AnRing is fully faithful and preserves colimits, and R_■ is tested on any set of ring generators (RCSolid Definition 5.4.7, Remarks 5.4.8–5.4.9 and Proposition 5.4.11, RCSolid line 3097, RCSolid line 3105, RCSolid line 3132); (8) the maps ℤ[T]_{ℤ_■/} → ℤ[T]_■ and ℤ[T]_{ℤ_■/} → ℤ[T^{±1}]_{ℤ[T⁻¹]_■/} are open immersions with complementary idempotent algebras ℤ((T⁻¹)) and ℤ[[T]] (RCSolid Lemma 5.4.13, RCSolid line 3168); (9) open immersions of locales are stable under base change of analytic rings, R_■ → R[1/f]_■ is an open immersion, a basic Zariski cover {R_■ → R[1/f_i]_■} is an open cover of Sm(D(R_■)), and so is every finite affine Zariski cover (RCSolid Lemmas 5.4.12 and 5.4.14, Proposition 5.4.15 and Theorem 5.4.16, RCSolid line 3157, RCSolid line 3174, RCSolid line 3181, RCSolid line 3203); (10) for a scheme X, U ↦ D(O_X(U)_■) on affine opens is a sheaf, defining D_■(X), with a surjection of locales Sm(D_■(X)) → |X| (RCSolid Corollary 5.4.17, RCSolid line 3212), and for D(X) quasi-coherent complexes the analogous surjection onto |X|^op, under which the open complement of a closed Z with quasi-compact complement is the derived complete sheaves on X^∧_Z (RCSolid Corollary 5.4.4 and Proposition 5.4.6, RCSolid line 3024, RCSolid line 3060).

A proof route: (1)–(2) from the short exact sequence 0 → ℤ[[q]][T] → ℤ[[q]][T] → ℤ((T⁻¹)) → 0 (multiplication by 1 − Tq) and the computation RHom(ℤ((T⁻¹)), ℤ[T]) = 0; (3)–(4) by the tensor computations of RCSolid §5.3 and pseudocoherence of R over a polynomial ring; (8) part one is (1), part two follows from the analogous sequence for T⁻¹ (multiplication by 1 − T⁻¹q on ℤ[[q]][T^{±1}] with cokernel ℤ[[T]]) — the source leaves it to the reader (RCSolid line 3172) and it is a target here; (9) R[1/f]_■ = R_■ ⊗_{ℤ[T]_■} ℤ[T^{±1}]_■ and ∩_i R[[f_i]] = 0 when the f_i generate the unit ideal, by mapping ℤ[[T]] → R[[X₁, …, X_n]] with T ↦ Σ a_i X_i.

*Needs:* 2.2–2.6; SolidAnalyticRings §1.5; SolidAnalyticRings §7.3; EnhancedDerivedSheaves E4.1; SchemeAndStackFoundations §2.18.

**Checks.**

- RHom_{(ℤ[T],ℤ)_■}(ℤ[[q]][T], ℤ[T]) = ℤ[T]((q))/qℤ[T][[q]] and 1 − Tq is invertible on ℤ[T][[q]], so j*j_*ℤ[T] = ℤ[T]: the discrete ring is ℤ[T]_■-complete (RCSolid line 2428).
- Topological ℚ_p with T acting by p⁻¹ is (ℤ[T], ℤ)_■-complete but not ℤ[T]_■-complete: the null sequence pⁿ has Σ pⁿ T^n "= Σ 1", divergent, and is killed by 1 − Tσ*; with T acting by p the module is ℤ[T]_■-complete. This agrees with the corresponding Check of SolidAnalyticRings §7.3.
- For R = ℚ (not of finite type), R_■[S] is colim over finitely generated B ⊆ ℚ of lim_n B[S_n], not lim_n ℚ[S_n] (SixFF Warning 9.11, SixFF line 3259); the "ultrasolid" structure with lim_n ℚ[S_n] is a different analytic ring.

### 2.8 Discrete Huber pairs and descent on their adic spectra

An animated discrete Huber pair is (R, R⁺) with R a discrete animated ring and R⁺ ⊆ π₀R an integrally closed subring (RCSolid Definition 5.5.1, RCSolid line 3236). Prove: (1) the ∞-category of discrete Huber pairs has colimits (integral closure of the image in the second factor) and compact generators the finite colimits of (ℤ[T], ℤ) and (ℤ[T], ℤ[T]) (RCSolid Lemma 5.5.2, RCSolid line 3240); (2) for a solid animated ring A and a set S → π₀A(∗), (A, S)_■ is the completion of the structure of solid modules that are s-solid for s ∈ S, and (R, S)_■ = (R, R⁺[S])_■ with R⁺[S] the integral closure of the subring generated by S (RCSolid Definition 5.5.4 and Lemma 5.5.5, RCSolid line 3265, RCSolid line 3269; SixFF Theorem 9.8, SixFF line 3222); (3) (R, R⁺) ↦ (R, R⁺)_■ is fully faithful and colimit preserving (RCSolid Proposition 5.5.6, RCSolid line 3284; Man22 Proposition 2.9.6, Man22 line 4944; SixFF Theorem 9.10, SixFF line 3256); (4) for (R, R⁺) with R static, Spa(R, R⁺) is the adic spectrum of AdicSpaces §2.1 for the discrete topology, its rational subsets are those of AdicSpaces §2.2 and correspond to rational localizations (RCSolid Definition 5.6.1 and Proposition 5.6.4, RCSolid line 3333, RCSolid line 3377), the structure presheaves O and O⁺ are sheaves on rational subsets (RCSolid Proposition 5.6.6, RCSolid line 3407), every rational cover is refined by a standard one (RCSolid Lemma 5.6.7, RCSolid line 3422), and U ↦ D((O(U), O⁺(U))_■) is a sheaf of presentably symmetric monoidal stable ∞-categories on finite disjoint unions of rational subsets (RCSolid Theorem 5.6.8, RCSolid line 3426; SixFF Theorem 9.15, SixFF line 3369), so that a classical rational localization is a composite of a closed and an open localization of analytic rings.

*Needs:* 2.7; AdicSpaces §2.1; AdicSpaces §2.2; AdicSpaces §3.1; SolidAnalyticRings §7.3.

**Checks.**

- (ℤ[T], ℤ[T])_■ = ℤ[T]_■ and (ℤ[T], ℤ)_■ = ℤ[T]_{ℤ_■/}; mapping spaces out of them are R and R ×_{π₀R} R⁺ (RCSolid line 3254 to RCSolid line 3256).
- (ℤ[T], ℤ[T]) is compact but not projective: for A = ℤ[T]/Tⁿ the functor (R, R⁺) ↦ R⁺ does not commute with the geometric realization computing the pushout (RCSolid Remark 5.5.3, RCSolid line 3258).
- For R = 𝔽₂[ε]/ε² and R⁺ the constant subring 𝔽₂, the element εT ∈ R[T] is integral over R⁺ ((εT)² = 0), so (R[T], R⁺)_■ already tests εT; treating 𝔽₂ as integrally closed in R[T] would be wrong (this matches the corresponding Check of SolidAnalyticRings §7.3).

### 2.9 Solid Huber rings

Define a solid pre-analytic Huber pair (A▷, S) as a solid animated ring with a map of anima S → A▷(∗), the analytic ring (A▷, S)_■ as the completion of the structure of solid modules that are s-solid for s ∈ π₀S, the ring of solid elements A⁺ = G_{a,■}(A) ⊆ A▷(∗) for G_{a,■} = AnSpec ℤ[T]_■, and a solid Huber ring as an analytic ring A over ℤ_■ with (A▷, A⁺)_■ → A an isomorphism (RCSolid Definition 7.1.1, RCSolid line 4779). Define the topologically nilpotent elements A°° as those a with ℤ[T] → A extending to ℤ[[T]] (RCSolid Definition 7.1.6, RCSolid line 4841) and the solid Tate algebra A[T₁, …, T_n]_■ = A ⊗_{ℤ_■} ℤ[T₁, …, T_n]_■ (RCSolid Definition 7.1.9, RCSolid line 4857).

The API consists of the following facts.

- G_{a,■} is a ring stack, so A⁺ is an animated subring of A▷(∗) (RCSolid Remark 7.1.2, RCSolid line 4797), and A°° ⊆ A⁺ is an A⁺-submodule (RCSolid Lemma 7.1.7, RCSolid line 4844).
- Discrete Huber pairs and complete Huber pairs embed fully faithfully into solid Huber rings via (A, A⁺) ↦ (A, A⁺)_■ (RCSolid Example 7.1.4, RCSolid line 4805; Man22 Proposition 2.9.6; And21 Proposition 3.34, And21 line 1569).
- The inclusion of solid Huber rings into analytic rings over ℤ_■ has the right adjoint A ↦ (A▷, A⁺)_■, so solid Huber rings are closed under colimits; Sym_{ℤ_■}ℤ_■[S] is compact projective, ℤ[T]_■ and ℤ[[T]] are compact and not projective, and these generate (RCSolid Proposition 7.1.5, RCSolid line 4813).
- For (R, R⁺) discrete, A[T]_■ = (R[T], R⁺[T])_■; for R I-adically complete with the induced structure, A[T]_■ = (R[T]^∧_I, ℤ[T])_■; for a Tate Huber pair, A[T]_■ is the classical Tate algebra (A⟨T⟩, A⁺⟨T⟩)_■ (RCSolid Example 7.1.10, RCSolid line 4860).

*Needs:* 2.7; 2.8; AdicSpaces §2.1.

**Checks.**

- For A = ℤ_■, A⁺ = ℤ and A°° = 0; for A = (ℤ_p, ℤ_p)_■, A⁺ = ℤ_p and A°° = pℤ_p.
- For A = ℤ[T]_{ℤ_■/} = (ℤ[T], ℤ)_■, T ∉ A⁺, and the map (A▷, A⁺)_■ → A is the identity, so A is a solid Huber ring with A⁺ = ℤ.
- Sym_{ℤ_■}ℤ_■[S] for infinite S is a solid Huber ring that is compact but not of solid finite type in the sense of 6.1, showing that compactness is the wrong finiteness notion (RCSolid line 5455).

### 2.10 Rational localizations and the solid spectrum

Prove Stone duality for spectral spaces: the category of spectral spaces and spectral maps is dual to the category of bounded distributive lattices, by taking quasi-compact open subsets (GvG24 Theorems 5.38 and 6.4, GvG24 line 7209 to GvG24 line 7215; RCSolid Theorem 5.1.13, RCSolid line 2340). For a solid Huber ring A and f₁, …, f_n, g generating the unit ideal, define the standard rational localization A⟨f/g⟩_■ = A[1/g] ⊗_{A[T₁,…,T_n]} A[T₁, …, T_n]_■ (T_i ↦ f_i/g), and rational localizations as finite composites (RCSolid Definition 7.2.1, RCSolid line 4912). Prove that rational localizations are open immersions of analytic rings, stable under base change and composition, with compact complementary idempotent algebras, and are compact A-algebras (RCSolid Lemmas 7.2.3–7.2.6, RCSolid line 4945 to RCSolid line 4985). Define the solid spectrum Spec_■(A) as the spectral space whose lattice of quasi-compact opens is the sublattice of Sm(D(A)) generated by rational localizations (RCSolid Definition 7.2.7, RCSolid line 4991). Prove that it commutes with filtered colimits (RCSolid Lemma 7.2.9, RCSolid line 5013), is insensitive to nilpotent kernels on π₀ (RCSolid Lemma 7.2.10, RCSolid line 5034), that the standard rational localizations A⟨f/f_i⟩ for f₁, …, f_n generating the unit ideal cover Spec_■(A) (RCSolid Lemma 7.2.15, RCSolid line 5155), that for a discrete Huber pair there is a surjection Spa(A, A⁺)^mod → Spec_■((A, A⁺)_■), and that for a sheafy Tate Huber pair Spec_■((A, A⁺)_■) ≅ Spa(A, A⁺) identifying rational subsets, with D satisfying analytic descent (RCSolid Proposition 7.2.12, RCSolid line 5082; And21 Theorem 4.1, And21 line 1596).

*Needs:* 2.5; 2.9; 2.8; Mathlib `SpectralSpace`; AdicSpaces §2.2; AdicSpaces §3.1.

**Checks.**

- For a discrete field k, the standard rational localizations of k_■ are k_■ itself (g ≠ 0, every element of k already being solid) or 0 (g = 0, f a unit), so Spec_■(k_■) is a point; for ℤ_■ the localizations ℤ_■ → ℤ[1/n]_■ are rational, and Spec_■(ℤ_■) maps onto |Spec ℤ| by a quotient map (RCSolid Example 7.3.4(1), RCSolid line 5204), so it is not a point.
- For A = ℤ[T]_■, the rational subsets {|T| ≤ 1} (all of Spec_■) and {|1| ≤ |T|} = Spec_■ ℤ[T^{±1}]_■ are open; the latter is a rational localization T ↦ unit, while the classical localization (ℤ[T], ℤ) → (ℤ[T^{±1}], ℤ) is not an open immersion of analytic rings (RCSolid line 5248).
- A lattice that is not distributive, such as the five-element diamond M₃, is not the lattice of quasi-compact opens of any spectral space, consistent with Stone duality requiring distributivity.

### 2.11 Nonarchimedean fields

For a complete nonarchimedean field E over ℚ_p with ring of integers O_E, define E_■ = (E, O_E)_■, a solid Huber ring by 2.9. Prove that ℚ_{p,■} = (ℚ_p, ℤ_p)_■ is the structure on ℚ_p induced from ℤ_■: ℤ_p is an idempotent ℤ_■-algebra (RCSolid line 1309), ℤ_{p,■}[S] = lim ℤ_p[S_i] = ℤ_p ⊗_{ℤ_■} ℤ_■[S] (CSCond Examples 7.3(ii), CSCond line 1685), and for x ∈ ℤ_p the base change ℤ_p ⊗_{(ℤ[T],ℤ)_■} ℤ((T⁻¹)) along T ↦ x is ℤ_p[[q]]/(1 − xq) = 0, so every induced module is x-solid, that the induced structures on animated ℚ_{p,■}-algebras are closed under colimits and base change (2.3(1), (7)), and that for an affinoid algebra A over E (a quotient of E⟨T₁, …, T_n⟩) the analytic ring (A, A°)_■ is the base change of E_■ along the solid Tate algebra presentation (RCSolid Example 7.1.10).

*Needs:* 2.3; 2.9; 2.10; AdicSpacesPartII §R1.1.

**Checks.**

- Completed direct sums: for countable sets I, J, (⊕̂_I ℚ_p) ⊗_{ℚ_{p,■}} (⊕̂_J ℚ_p) = ⊕̂_{I×J} ℚ_p, where ⊕̂ denotes the p-adically completed sum with p inverted (RCSolid Example 3.5.4, RCSolid line 1336).
- (ℚ_p, ℤ_p)_■[S] = (ℤ_p ⊗ ℤ_■[S])[1/p] = (∏_ℕ ℤ_p)[1/p] for infinite S, the sequences with uniformly bounded denominators; the full product ∏_ℕ ℚ_p is not a free complete module. This matches SolidAnalyticRings §7.4 and, on common light presentations, VStackSheavesAndLisseCategories VS2.2 `SolidECoefficients` for finite E/ℚ_p.
- The discrete field ℚ_p with the structure ℚ_{p,■}^{disc} = (ℚ_p, ℤ)_■ on the discrete condensed ring is a different analytic ring: its underlying condensed ring lacks the null sequence pⁿ, which lies in the topological ℚ_p.

### Examples

ℤ_■, (ℤ[T], ℤ)_■ ⊆ ℤ[T]_■ with complement ℤ((T⁻¹)), R_■ for a finitely generated ℤ-algebra with R_■[S] = lim R[S_n], ℤ_p and its formal completions, ℚ_{p,■} and its affinoid algebras, solid Tate algebras.

### Dependencies

Layer 0 (for nothing beyond notation); Mathlib `LightProfinite`, `LightCondensed`, `Locale`, `SpectralSpace`; EnhancedDerivedSheaves E2.6–E2.7, E3.2, E4.1, E5:abstract.2–3, E5:presentability.2–3, E5:animation.1, .4; SolidAnalyticRings §§1.5, 2.3, 7.1–7.4; AdicSpaces §§2.1–2.2, 3.1; AdicSpacesPartII §R1.1; SchemeAndStackFoundations §2.18.

## Layer 3: Analytic stacks and the quasi-coherent six-functor formalism

### 3.1 The !-able class of affinoid analytic stacks

Let AnStk^aff = AnRing^op, with AnSpec A the object of A. For f: AnSpec B → AnSpec A define: f ∈ P if B = B▷_{A/} has the induced structure; f ∈ I if f*: D(A) → D(B) is an open immersion in the sense of 2.5; f ∈ E (f is !-able) if B▷_{A/} → B is an open immersion (RCSolid Definition 6.3.2, RCSolid line 4025). Prove that I, P and E are geometric setups on AnStk^aff, that every f ∈ E is p∘j with j ∈ I and p ∈ P, that every morphism of I is a monomorphism, that j* has a fully faithful left adjoint j_♮ satisfying the projection formula and base change, that p* has a right adjoint p_* satisfying the projection formula and base change, and that j_♮ p′_* ≅ p_* j′_♮ for every pullback square with j ∈ I and p ∈ P (RCSolid Lemma 6.3.3, RCSolid line 4034).

*Needs:* 2.3; 2.5; 0.1.

The API consists of the following facts.

- I ∩ P consists of the equivalences composed with idempotent maps with induced structure, all monomorphisms, so the decomposition (I, P) is suitable in the sense of 0.5.
- Rational localizations of solid Huber rings (2.10) and Zariski localizations R_■ → R[1/f]_■ (2.7(9)) lie in I; every map with induced structure lies in P; ℤ_■ → ℤ[T]_■ lies in E.
- E is right cancellative and contains the diagonal of every map of analytic rings, since B ⊗_A B → B always has the induced structure.

**Checks.**

- ℤ_■ → ℤ[T]_■ factors as ℤ_■ → (ℤ[T], ℤ)_■ (in P) → ℤ[T]_■ (in I, complement ℤ((T⁻¹))).
- ℤ_■ → ℤ_{p,■} has the induced structure (2.11), so it is in P, and since ℤ_p is an idempotent ℤ_■-algebra it is moreover a closed immersion; ℤ_■ → ℚ_{p,■} is a composite of two maps in P, hence in P ⊆ E.
- (ℤ[T], ℤ)_■ → ℤ[T]_■ is in I (complement ℤ((T⁻¹)), 2.7(1)) and not in P: the structure on ℤ[T] induced from (ℤ[T], ℤ)_■ is (ℤ[T], ℤ)_■ itself, for which ℤ((T⁻¹)) is complete, whereas ℤ((T⁻¹)) is a nonzero module over the complementary idempotent algebra and so is not ℤ[T]_■-complete.

### 3.2 The quasi-coherent formalism on affinoids

Prove that A ↦ D(A) extends to a presentable Künneth six-functor formalism on (AnStk^aff, E) with j_! = j_♮ for j ∈ I and p_! = p_* for p ∈ P (RCSolid Corollary 6.3.4, RCSolid line 4101), by 0.5 and 3.1, Künneth being 2.3(7). Prove that for a map f: A → B of analytic rings with trivial structures, f is D-suave iff B is dualizable as a condensed A▷-module (RCSolid Lemma 6.3.5, RCSolid line 4111; HM Lemma 4.5.10), that the kernel bicategory embeds 2-fully faithfully into D(S)-linear presentable categories (0.7 with RCSolid Lemma 6.3.6), that the !-covers are characterized by 0.12, and that Hypothesis 6.3.11 holds: if D(A₋₁) ≃ lim D*(A_i) along a cone then Map(B, A₋₁) ≃ lim Map(B, A_i) for every analytic ring B (RCSolid Lemma 6.3.22, RCSolid line 4418). Prove that for an analytic ring A and B with induced structure, A → B is a !-cover iff B is descendable in D(A).

*Needs:* 3.1; 0.5; 0.7; 0.9; 0.12; 2.3.

**Checks.**

- For f: ℤ^cond → ℤ[T]/(T²)^cond (trivial structures), B is free of rank 2 over ℤ^cond, so f is suave with ω = Hom_ℤ(B, ℤ) ≅ B, matching 1.1.
- For f: ℤ^cond → ℤ[T]^cond, ℤ[T] is not dualizable in D(ℤ^cond), so f is not suave; for ℤ_■ → ℤ[T]_■ it is (6.3).
- For the empty family, !-descent holds only for the zero ring, and ℤ_■ → ℤ_■ × ℤ_■ is a !-cover (split, descendable of index 1).

### 3.3 Analytic stacks

Fix a base S ∈ AnStk^aff and an essentially small full subcategory C₀ ⊆ AnStk^aff_{/S} closed under finite limits and finite coproducts, and let E₀ = E ∩ C₀. Define AnStk(C₀) = gShv(C₀) of 0.13: the presheaves of anima on C₀ inverting every ℵ₁-compact !-equivalence of presheaves on C₀,E₀ (RCSolid Definitions 6.3.13, 6.3.16 and 6.3.23, RCSolid line 4295, RCSolid line 4338, RCSolid line 4435; ABLB Definition 4.2.1, ABLB line 2109). Prove that AnStk(C₀) is an ∞-topos, a cotopological left exact localization of !-sheaves containing !-hypersheaves (0.13(1)–(2)); that D* extends to a sheaf on AnStk(C₀) and D extends uniquely to a six-functor formalism on (AnStk(C₀), E′) with E′ local on the target, local on source and target for !-covers, tame and stable under disjoint unions (0.13(3)–(4)); that descendable maps A → B with induced structure are !-covers; that a family {A → B_i} of !-able maps is a !-cover iff it is of universal ∗- and !-descent and finitely many members suffice (ABLB Remark 4.2.2, ABLB line 2118; 0.12); that a left exact functor from a site whose covers go to !-covers induces a morphism of topoi into AnStk(C₀) under the hypotheses of 0.13(5) (ABLB Remark 4.2.5, ABLB line 2162); that inclusions C₀ ⊆ C₁ of admissible subcategories induce left exact colimit-preserving functors AnStk(C₀) → AnStk(C₁) (RCSolid Lemma 6.3.21); and that a sub-prestack of full subcategories of D* that is a !-sheaf and fully faithful along !-hypercovers extends to a sheaf on AnStk(C₀) (0.13(6)).

*Needs:* 3.2; 0.13; 0.6.

The API consists of the following facts.

- AnSpec: C₀ → AnStk(C₀) is fully faithful (the !-topology is subcanonical by Hypothesis 6.3.11), preserves finite limits, and D(AnSpec A) = D(A).
- Open and closed maps of 0.10 between analytic stacks: an open immersion is an étale monomorphism, j_! = j_♮ fully faithful; D(X) → D(U) is an open immersion of presentably symmetric monoidal categories.
- The formalism is Künneth over every affinoid base in the sense of 0.12 for !-able maps (RC26a Lemma 2.1.10, RC26a line 406).

**Checks.**

- The empty analytic stack has D = 0, and the empty family is a !-cover of AnSpec A only for A = 0.
- For C₀ the spectra AnSpec(ℤ_■ⁿ) of finite products (equivalent to the category of finite sets, since ring maps ℤᵐ → ℤⁿ are maps of sets n → m), the !-covers include the decompositions into points, so a sheaf is determined by its value at AnSpec ℤ_■ and AnStk(C₀) ≃ Ani, with D(K) = Fun(K, D(ℤ_■)) for an anima K and D(⊔_n AnSpec ℤ_■) = D(ℤ_■)ⁿ.
- The ℵ₁-compactness restriction matters only set-theoretically: the class of all !-equivalences is not known to be generated by a set, so AnStk(C₀) for C₀ all analytic rings is not constructed (RCSolid Warning 6.3.24, RCSolid line 4445).

### 3.4 Schemes and discrete adic spaces

Prove that the solid formalism X ↦ D_■(X) on derived schemes almost of finite type over ℤ (globalizing R ↦ D(R_■) by 2.7(10)) is a six-functor formalism with P the proper maps, I the open immersions and E the separated maps (SixFF Theorem 9.7, SixFF line 3208), and more generally that X ↦ D_■(X) on discrete adic spaces satisfies descent on Spa(A, A⁺) and upgrades to a six-functor formalism in which Spa(A, A′⁺) ↪ Spa(A, A⁺) for A′⁺ the integral closure of a finitely generated A⁺-algebra is cohomologically étale with j_! = j_♮, maps Spa(B, B⁺) → Spa(A, A⁺) with B⁺ the integral closure of the image of A⁺ have f_! = f_*, and open immersions of schemes give cohomologically étale maps of the associated adic spaces (SixFF Theorem 9.15, SixFF line 3369; RCSolid Theorem 5.6.8, RCSolid line 3426). Prove that this formalism is the restriction of the formalism of 3.3 along the functor sending a discrete adic space to the analytic stack glued from the (A, A⁺)_■ (RCSolid Example 7.3.4(4), RCSolid line 5235). Prove that for a proper map f: X → Y of derived schemes, f_* takes pseudocoherent objects of D_qc(X) to pseudocoherent objects of D_qc(Y), coherent to coherent, and, if f has finite Tor-dimension, perfect to perfect, through the comparison of discrete and solid pushforwards (SixFF Theorem 9.18, SixFF line 3444). Prove that the discrete quasi-coherent complexes form a full subcategory of D_■(X) preserved by pullback, tensor and proper pushforward (RCSolid Remark 4.1.7 and Remark 5.4.2), and that for a closed subscheme Z = V(I) with quasi-compact open complement U the open immersion j: U_■ → X_■ and the complementary closed localization give the triangles j_!j* → id → i_*i* and i_*i^! → id → j_*j*, where on an affine open Spec R the functor i_*i* is base change along the idempotent R_■-algebra R̂_I of 2.7(5) (RCSolid Proposition 5.4.15 and its proof, RCSolid line 3189; Proposition 5.3.12).

A proof route: Zariski descent of D(R_■) (2.7(9)–(10)) globalizes; Nagata compactification gives the decomposition (I, P) and 0.5 applies; for finiteness, write f_* = f_! and reduce by gluing and closed immersions into affine space to 𝔸¹_Y → Y, where f_! of a pseudocoherent object is computed by the fibre of ℤ[T] → ℤ((T⁻¹)) and is pseudocoherent.

*Needs:* 3.3; 2.7; 2.8; 0.5; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsSeparated`; SchemeAndStackFoundations §2.18 (pseudocoherent and perfect complexes).

**Checks.**

- For 𝔸¹_ℤ → Spec ℤ, f_!1 = fib(ℤ[T] → ℤ((T⁻¹))) = T⁻¹ℤ[[T⁻¹]][−1], computed by the compactification through Spa(ℤ[T], ℤ) (SixFF line 3430 to SixFF line 3433); its π₋₁ is T⁻¹ℤ[[T⁻¹]], a product of copies of ℤ, which is not a discrete module, so f_! does not preserve discrete objects for non-proper f.
- For the coefficient ring A = ℤ/p^s and X → Spec A proper, f_* of a discrete coherent sheaf is discrete coherent (here computed by ordinary coherent cohomology), the form used by the consumers working over Artinian bases.
- On affines of discrete rings, the induced structure (A, ℤ)_■ has complete modules the condensed A-modules with solid underlying abelian group, which is VStackSheavesAndLisseCategories VS2.2 `ZSolidAnalytification` on common light presentations (through SolidAnalyticRings §7.4); A_■ is strictly smaller for A ≠ ℤ of finite type (it adds a-solidity for a ∈ A).

### 3.5 Solid Huber stacks and solid adic spaces

Let Aff^Hub ⊆ AnStk^aff_{/ℤ_■} be an essentially small full subcategory of spectra of solid Huber rings closed under finite limits and coproducts (for instance the κ-compact ones for a regular uncountable κ), and define the solid Huber stacks SolHubStk = AnStk(Aff^Hub) (RCSolid Definition 7.3.1, RCSolid line 5180). Define the solid adic topology on Aff^Hub by rational covers jointly surjective on solid spectra, the underlying solid spectrum |X|_■ of a sheaf X, open immersions X_U ⊆ X for U ⊆ |X|_■ open, and solid adic spaces as sheaves with an open cover by affinoids (RCSolid Definition 7.3.2, RCSolid line 5185). Construct the functors from schemes (X ↦ X_■, via Zariski localizations being rational), from I-adic formal schemes over an I-adically complete A (via I-adic completion with induced structure), from sheafy Tate adic spaces (via 2.10), in particular from rigid-analytic spaces over a complete nonarchimedean field (AdicSpacesPartII §R1.1), and from discrete adic spaces to SolHubStk (RCSolid Example 7.3.4, RCSolid line 5203).

*Needs:* 3.3; 2.9; 2.10; AdicSpacesPartII §R1.1.

The API consists of the following facts.

- A rational cover of solid Huber rings is a !-cover, so the solid adic topology is coarser than the !-topology and solid adic spaces embed in SolHubStk.
- |−|_■ sends rational covers to open covers and AnSpec(A) to Spec_■(A); for X_■ of a scheme X there is a quotient map |X_■|_■ → |X|.
- For a rigid space Y over K, D(Y) on the associated solid adic space is the analytic-descent glueing of D((A, A°)_■) over affinoids (And21 Theorem 4.1).

**Checks.**

- For the closed unit disc over ℚ_p, the associated solid Huber ring is ℚ_p⟨T⟩_■ = ℚ_{p,■} ⊗_{ℤ_■} ℤ[T]_■, and its solid spectrum is Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩).
- The discrete adic space Spa(ℤ[T], ℤ) ⊇ Spa(ℤ[T^{±1}], ℤ) gives a map of solid Huber stacks that is not an open immersion of solid adic spaces, while Spa(ℤ[T], ℤ[T]) ⊇ {|T| ≥ 1} is one.
- The empty solid adic space has empty solid spectrum and D = 0.

### 3.6 Analytic stacks over ℚ_{p,■}

For an essentially small C₀ of affinoid analytic stacks over AnSpec ℚ_{p,■} closed under finite limits and coproducts, consisting of spectra of animated ℚ_{p,■}-algebras with induced structure, the analytic stacks AnStk(C₀) of 3.3 are the setting of analytic stacks over ℚ_{p,■}; every map in C₀ is in P, so all maps of affinoids are !-able and prim with f_! = f_*. Prove that colimits and base change in C₀ are computed on underlying algebras (2.3(1), (7)) and that the inclusion of C₀ into all analytic rings over ℚ_{p,■} with a larger admissible C₁ induces AnStk(C₀) → AnStk(C₁) (3.3).

*Needs:* 3.3; 2.11.

**Checks.**

- For C₀ the spectra of finite products of ℚ_{p,■}, AnStk(C₀) ≃ Ani with D(K) = Fun(K, D(ℚ_{p,■})), as in 3.3.
- ℚ_{p,■} → ℚ_{p,■} × ℚ_{p,■} is a !-cover. The solid Tate algebra ℚ_p⟨T⟩_■ = ℚ_{p,■} ⊗_{ℤ_■} ℤ[T]_■ is not induced from ℚ_{p,■} (T is solidified), so it lies in no C₀ of induced structures: ℚ_{p,■}-stacks and solid Huber stacks are formed over different sites.
- For S light profinite, the ring C^lc(S, ℚ_p) = C(S, ℤ) ⊗ ℚ_p of locally constant functions (the solid tensor with the discrete free module C(S, ℤ)) with the induced structure gives AnSpec C^lc(S, ℚ_p), the Betti stack of S over ℚ_{p,■} (4.1); the Banach algebra of continuous functions S → ℚ_p is a different ring.

### 3.7 Quasi-coherent formalisms with analytic coefficients

For an analytic ring A, prove that R ↦ D_A(R) = Mod_R(D(A)) on affine schemes over A▷(∗) is a Künneth six-functor formalism with f_! = f_*, with D_A! = D_! ⊗_{D(A▷(∗))} D(A), and, when D(A) is compactly generated (as for A = ℤ_■), D_A = Fun_{D(ℤ)}(D_!, D(A)) = D* ⊗_{D(A▷(∗))} D(A) (RCSolid Remark 6.4.1, RCSolid line 4471 to RCSolid line 4474). Prove that a map of prestacks on affine schemes is a !-equivalence for D iff for D^cond (RCSolid Remark 6.4.2, RCSolid line 4492), and that the realization of the next target is compatible with base change along A.

*Needs:* 1.1; 1.2; 2.2; EnhancedDerivedSheaves E5:presentability.2; EnhancedDerivedSheaves E5:presentability.4.

**Checks.**

- For A = ℤ^cond, D_A = D^cond of 1.1.
- For A = ℤ_■ and R = ℤ[T], D_A(ℤ[T]) = Mod_{ℤ[T]}(D(ℤ_■)) = D((ℤ[T], ℤ)_■), the induced structure, not D(ℤ[T]_■).
- For A = 0, D_A = 0 on every affine scheme.

### 3.8 Realization of algebraic stacks

Construct the left exact colimit-preserving functor (−)^cond: AlgStk → AnStk(C₀), for any C₀ containing the spectra of the trivial structures R^cond of the animated rings considered, sending Spec R to AnSpec R^cond (RCSolid (6.4.1) and Corollary 6.4.6, RCSolid line 4480, RCSolid line 4562; ALRS Remark 2.9.1, ALRS line 1866), the left adjoint in a morphism of ∞-topoi. Prove that for X ∈ AlgStk, D(X^cond) = Fun_{QCoh(ℤ)}(QCoh^!(X), D(ℤ^cond)), with QCoh^!(X) the !-sheaves, that QCoh(X) = Fun_{QCoh(ℤ)}(QCoh^!(X), QCoh(ℤ)), that for X !-able over a base ring D(X^cond) = QCoh(X) ⊗_{QCoh(ℤ)} D(ℤ^cond), and that QCoh(−) → D((−)^cond) is a morphism of six-functor formalisms on (AlgStk, E′) (ALRS Remark 2.9.1, ALRS line 1871 to ALRS line 1883). Deduce, for every analytic stack Y, the equivalences D(B𝔾_m^cond × Y) ≃ graded objects of D(Y), D((𝔸¹/𝔾_m)^cond × Y) ≃ filtered objects, D((𝔸̂¹/𝔾_m)^cond × Y) ≃ complete filtered objects, and for Y over ℚ the shearing description of 1.7 (ALRS Remarks 2.9.1–2.9.2), using Künneth and 1.6–1.7.

*Needs:* 1.2; 1.6; 1.7; 3.3; 3.7; 0.13(5).

**Checks.**

- For X = Spec R, D(X^cond) = D(R) ⊗_{D(ℤ)} D(ℤ^cond) = Mod_R(D(ℤ^cond)).
- For X = B𝔾_m and Y = AnSpec ℤ_■, D is graded solid abelian groups; the weight of the coordinate t of 𝔸¹ is −1 as in the Conventions.
- For X not !-able the tensor formula can fail while the Fun formula holds by definition; for the formal completion 𝔸̂¹ (which is !-able by 1.4) both give derived T-complete modules tensored with D(ℤ^cond).

### Examples

AnSpec ℤ_■ and its rational opens; the solidification X_■ of a separated scheme of finite type; the solid adic space of the closed disc over ℚ_p; B𝔾_m^cond × Y with graded modules.

### Dependencies

Layers 0–2; Mathlib `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsSeparated`; AdicSpacesPartII §R1.1; SchemeAndStackFoundations §2.18; EnhancedDerivedSheaves E5:presentability.2 and .4; SolidAnalyticRings §7.4 and VStackSheavesAndLisseCategories VS2.2 (comparison Check only).

## Layer 4: Betti stacks, classifying stacks, nuclear modules and Fredholm rings

### 4.1 Betti stacks

Construct the Betti realization (−)^Betti: CondAni → AnStk: a surjection S′ → S of light profinite sets gives a faithfully flat ω₁-compact map C(S, ℤ) → C(S′, ℤ) of rings of locally constant functions, so S ↦ Spec C(S, ℤ) sends hypercovers to ω₁-fpqc hypercovers and induces, through 1.2(2) and the realization 3.8, a left exact colimit-preserving functor CondAni = HypShv(light profinite) → AlgStk → AnStk(C₀), the left adjoint in a morphism of ∞-topoi (RCSolid §6.5, RCSolid line 4750 to RCSolid line 4758). Prove that composing with algebraic quasi-coherent sheaves recovers the six-functor formalism of light condensed anima with ℤ-coefficients, and composing with D gives its D(ℤ^cond)-linear base change (RCSolid line 4759 to RCSolid line 4765; the κ-condensed formalism is HM Proposition 3.5.22, HM line 2691, and its light analogue is the target here). Prove that over ℚ_{p,■} the base change (−)^Betti × AnSpec ℚ_{p,■} sends a light profinite S to AnSpec C^lc(S, ℚ_p) with the induced structure, and that D satisfies descent along hypercovers of light profinite sets in this form (ABLB Lemma 4.2.9 and its proof, ABLB line 2214 to ABLB line 2225).

*Needs:* 1.2; 3.8; 3.6; 0.13(5); EnhancedDerivedSheaves E2.6–E2.7.

The API consists of the following facts.

- (−)^Betti preserves colimits and finite limits; its right adjoint sends X to the condensed anima S ↦ X(AnSpec C(S, ℤ)^cond).
- For a light profinite S, D(S^Betti) = Mod_{C(S, ℤ)}(D(ℤ^cond)), and over ℚ_{p,■}, D = Mod_{C^lc(S, ℚ_p)}(D(ℚ_{p,■})).
- A map of light condensed anima that is fine for the condensed-anima formalism (representable in profinite sets locally, of locally finite cohomological dimension) is sent to a !-able map, and the formalisms are related by a morphism of six-functor formalisms.

**Checks.**

- ∗^Betti = AnSpec ℤ^cond and ∅^Betti = ∅.
- For S = {1, 2}, S^Betti = AnSpec(ℤ × ℤ) = ∗ ⊔ ∗.
- For S = ℕ ∪ {∞}, C(S, ℤ) is the ring of eventually constant sequences, free of countable rank (Nöbeling), not the ring ∏_ℕ ℤ; over ℚ_{p,■} the sequence (pⁿ) is continuous S → ℚ_p but not locally constant, so it is not a function on S^Betti × AnSpec ℚ_{p,■}.

### 4.2 Classifying stacks of locally profinite groups

Let Λ be a commutative ring and G a second-countable locally profinite group (so G is a light condensed group), with cohomological dimension cd_Λ defined through smooth Λ-representations (HM Definition 5.2.1, HM line 4479), and ∗/G the classifying stack in light condensed anima. Prove the light analogues of: (1) a t-exact equivalence between the left completion of the derived ∞-category of smooth Λ-representations of G (SmoothRepresentationsOfLocalGroups SR.0d.1–SR.0d.2) and D(∗/G, Λ), natural in continuous homomorphisms (HM Proposition 5.1.12, HM line 4386); (2) if G has locally finite Λ-cohomological dimension, then ∗/H → ∗/G is fine for every closed subgroup H, ∗/G is Λ-suave iff G is locally Λ-Poincaré, i.e. some open profinite subgroup K has f_*: D(∗/K, Λ) → D(Λ) preserving dualizable objects (HM Definition 5.3.17 and Proposition 5.3.19, HM line 4875, HM line 4885); (3) if Λ is a ℤ[1/p]-algebra and G is locally pro-p, G is locally Λ-Poincaré of cohomological dimension 0 and ω_{∗/G} is Λ in degree 0 with G acting through the modulus δ(g) = [gKg⁻¹ : K] (HM Example 5.3.21, HM line 4911); (4) if Λ is a ℤ/pⁿ-algebra and G a p-adic Lie group of dimension d, G is locally Λ-Poincaré with ω = Λ[d] twisted by the character d_G = det(Ad)·|det(Ad)|_p (HM Example 5.3.22, HM line 4928). Prove that the same statements hold for (∗/G)^Betti × AnSpec ℚ_{p,■} → AnSpec ℚ_{p,■} in the quasi-coherent formalism with Λ = ℚ_p: it is !-able, cohomologically smooth, with ω the unit object of D(ℚ_{p,■}) in degree 0 on which G acts through δ, for G locally pro-p.

A proof route: (1)–(4) follow HM §§5.1–5.3 verbatim with light profinite sets in place of κ-small ones, G being metrizable; the transfer to ℚ_{p,■} uses the morphism of six-functor formalisms of 4.1 and 3.7 (D(X^Betti × AnSpec ℚ_{p,■}) = D(X, ℚ_p) ⊗_{D(ℚ_p)} D(ℚ_{p,■}) by Künneth) and the pseudofunctor it induces on kernel bicategories (0.7), which preserves suave objects and dualizing complexes (HM Lemma 5.3.20, HM line 4900, for the change of coefficients).

*Needs:* 4.1; 3.7; 0.7; 0.9; SmoothRepresentationsOfLocalGroups SR.0.1; SmoothRepresentationsOfLocalGroups SR.0.2; SmoothRepresentationsOfLocalGroups SR.0d.1; SmoothRepresentationsOfLocalGroups SR.0d.2; SmoothRepresentationsOfLocalGroups SR.1.1.

**Checks.**

- For the upper triangular Borel B of GL₂(ℚ_p) and Λ = ℚ_p, δ(diag(p, 1)) = [gKg⁻¹ : K] = p⁻¹ for K = B(ℤ_p), since conjugation sends N(ℤ_p) to N(pℤ_p); this equals SmoothRepresentationsOfLocalGroups' δ_B(diag(p, 1)) = p⁻¹. The inverse convention would give p.
- For G finite of order invertible in Λ, ∗/G → ∗ is étale and proper with ω = 1 and f_! = f_* the invariants; for G = ℤ/p and Λ = 𝔽_p, cd = ∞ and ∗/G → ∗ is not fine, so not !-able in this formalism.
- For G = ℤ_p and Λ = 𝔽_p, ω = 𝔽_p[1] (dimension one, trivial character since ℤ_p is abelian), as in the Check of 0.9; for a free pro-p group on an infinite set, cd_{𝔽_p} = 1 but G is not 𝔽_p-Poincaré, so ∗/G is not suave (HM Example 5.3.18, HM line 4882).

### 4.3 Nuclear modules over solid ℚ_p-algebras

For a solid ℚ_p-algebra A (an animated ℚ_{p,■}-algebra with the induced structure), D(A) is compactly generated with compact unit (2.2), and Nuc(A) ⊆ D(A) denotes the nuclear objects of RefinedTraceMethods §4.3, equivalently (gap:nuclear-hom-criterion) the M with Hom_A(P, A) ⊗_A M → Hom_A(P, M) an equivalence for every compact P (ABLB Definition A.0.4, ABLB line 6767; CS22 Definition 8.5, CS22 line 3157). Call A nuclear if its underlying solid ℚ_p-module is. Prove: (1) Nuc(A) is closed under colimits and tensor products, its ω₁-compact objects are the basic nuclear ones, and B ⊗_A − preserves nuclear and basic nuclear objects (ABLB Lemma A.0.6, ABLB line 6781; CS22 Theorem 8.6, CS22 line 3168; RefinedTraceMethods §4.3); (2) if A is nuclear, M ∈ D(A) is nuclear iff it is nuclear as a solid ℚ_p-module iff every π_i M is, Nuc(A) is closed under countable limits and generated by the Hom_A(A[S], A), and Hom_A(M, −) preserves Nuc(A) for ω₁-compact M (ABLB Lemmas A.0.7–A.0.9, ABLB line 6789 to ABLB line 6798; Bos23 Theorem A.17, Bos23 line 3601); (3) for a countable ∞-category I and a !-equivalence colim_I AnSpec(A_i) → AnSpec(A) of nuclear solid ℚ_p-algebras, Nuc(A) → lim_I Nuc(A_i) along ∗-pullbacks is an equivalence, and if all A_i and A are basic nuclear, also along !-pullbacks (ABLB Lemma A.0.13, ABLB line 6850).

*Needs:* 2.11; 3.3; 3.6; RefinedTraceMethods §4.2; RefinedTraceMethods §4.3; gap:nuclear-hom-criterion.

**Checks.**

- ℚ_p and every finite free A-module are nuclear (dualizable objects are nuclear, RefinedTraceMethods §4.3); the Fréchet space ∏_ℕ ℚ_p is nuclear over ℚ_p (ABLB Example A.0.5, ABLB line 6778) without being dualizable.
- The compact projective ℚ_{p,■}[S] = (∏_ℕ ℤ_p)[1/p] for infinite S is compact but not nuclear: its identity is not trace-class, as it is not dualizable (a compact nuclear object is dualizable, CS22 Proposition 9.3, CS22 line 3577).
- For I a point and the identity of AnSpec A, (3) is the identity of Nuc(A); for I empty, ∅ → AnSpec A is a !-equivalence only for A = 0, and both sides are 0.

### 4.4 Fredholm analytic rings

Define an analytic ring A to be Fredholm if every dualizable object of D(A) is a perfect complex, i.e. lies in the thick subcategory generated by A (Sch24 Definition VI.1.6, Sch24 line 1753; CS22 Definition 9.7, CS22 line 3639, where perfect objects are the compact discrete ones). Prove: (1) A is Fredholm iff for every compact K ∈ D(A) and trace-class f: K → K the cone of 1 − f is perfect (Sch24 Proposition VI.1.5, Sch24 line 1743; CS22 Proposition 9.4, CS22 line 3588); (2) under CS22 Assumption 9.8 (duals of compact projective generators are static; CS22 line 3650), dualizable objects are generated by cones [T → T] of 1 − f for compact projective T and trace-class f, and nuclear pseudocompact objects are sequential colimits of dualizable ones (CS22 Proposition 9.10, CS22 line 3666); (3) if A → B has − ⊗_A B conservative (for example a !-cover), a finitely generated static A▷(∗)-module M with M ⊗_A B = 0 vanishes, and the perfect amplitude of a perfect M equals that of M ⊗_A B (Sch24 Proposition VI.1.2 and Corollary VI.1.3, Sch24 line 1720, Sch24 line 1727); (4) for Fredholm A, an object that is !-locally perfect is perfect with !-locally determined amplitude (Sch24 Corollary VI.1.4, Sch24 line 1733); (5) for a map A → Ā of analytic rings surjective on π₀ with Ā Fredholm, if every finitely presented static A-module M with M ⊗_A Ā = 0 vanishes, then A is Fredholm (Sch24 Proposition VI.1.7, Sch24 line 1755); (6) for a sheafy analytic complete Huber pair (A, A⁺) (in particular a sheafy Banach ℚ_p-algebra A with A⁺ = A°), (A, A⁺)_■ is Fredholm (And21 Theorem 5.50 and Corollary 5.51.1, And21 line 2733, And21 line 2978); (7) a filtered colimit of Fredholm analytic rings is Fredholm.

A proof route: (1) dualizable is compact and nuclear (CS22 Proposition 9.3), and the cone of 1 − f is compact and nuclear; (6) a nuclear pseudocoherent object of D((A, A⁺)_■) is discrete by an approximation of its resolution through trace-class maps (And21 §5.3); (7) a dualizable object of D(colim A_i) = colim D(A_i) (2.3(7)) is compact, hence a retract of the image of a compact object of some D(A_i), and its duality data (finitely many maps between compact objects) descend to a later stage, where the object is dualizable, hence perfect; perfectness is preserved by base change and retracts (the reduction step in the proof of CS22 Proposition 9.11, CS22 line 3719).

*Needs:* 2.2; 2.3; 2.9; 2.10; RefinedTraceMethods §4.2; EnhancedDerivedSheaves E5:presentability.1 (compact objects in filtered colimits of compactly generated categories).

The API consists of the following facts.

- A is Fredholm as soon as π₀A is, by (5) applied to A → π₀A, whose Nakayama hypothesis holds (Sch24 line 1765).
- The class of Fredholm analytic rings is closed under filtered colimits (7) and under the passage of (5) from Ā to A.
- For Fredholm A, perfect complexes, dualizable objects and compact nuclear objects of D(A) coincide.

**Checks.**

- The zero ring is Fredholm.
- ℚ_{p,■} = (ℚ_p, ℤ_p)_■ is Fredholm by (6), (ℚ_p, ℤ_p) being a sheafy analytic complete Huber pair; the only dualizable objects of D(ℚ_{p,■}) are perfect complexes of ℚ_p-vector spaces (ABLB line 3624).
- The general definition admits non-Fredholm rings: CS22 Example 9.6 (CS22 line 3612) exhibits, over the liquid analytic ring ℂ[T], a dualizable module (sequences of polynomial growth with T acting by (1, 2, 3, …)) that is not discrete.

### 4.5 Perfect complexes on analytic stacks of Fredholm rings

Let C₀ be as in 3.3 with every A ∈ C₀ Fredholm. Prove that for integers a ≤ b the prestack A ↦ Perf^{[a,b]}(A) of perfect A-modules of amplitude [a, b] extends uniquely to a sheaf of ∞-categories on AnStk(C₀), and define a perfect module of amplitude [a, b] on X ∈ AnStk(C₀) as an object of D(X) whose pullback to every affinoid is one, and a vector bundle as a perfect module of amplitude [0, 0]; perfectness may be tested on a jointly surjective family of affinoids (ABLB Lemma 4.2.11, Definition 4.2.12 and Remark 4.2.13, ABLB line 2235, ABLB line 2253, ABLB line 2257, stated there for Gelfand rings; the general form for Fredholm C₀ is the target here).

A proof route: dualizability is !-local, so a !-locally perfect object is dualizable, hence perfect by Fredholmness, with amplitude descending by 4.4(3); inversion of !-equivalences follows from 3.3 (the sheaf criterion of 0.13(6)) since Perf^{[a,b]} ⊆ D is fully faithful.

*Needs:* 4.4; 3.3; 0.13.

**Checks.**

- For X = AnSpec ℚ_{p,■}, vector bundles are finite-dimensional ℚ_p-vector spaces.
- For X = ∅, Perf(∅) = 0.
- For a non-Fredholm C₀ the definition by pullbacks still makes sense, but the sheaf property can fail: a dualizable nonperfect module (CS22 Example 9.6) is !-locally dualizable without being locally perfect, which is why the hypothesis is kept.

### Examples

Betti stacks of light profinite sets and of the classifying anima of locally profinite groups; the classifying stack of GL₂(ℤ_p) over ℚ_{p,■} with trivial dualizing complex, and of the Borel with dualizing complex the modulus.

### Dependencies

0.7, 0.9, 0.13, 1.2, 2.2–2.3, 2.9–2.11, 3.3, 3.6–3.8; SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.2, SR.0d.1–SR.0d.2, SR.1.1; RefinedTraceMethods §§4.2–4.3 and gap:nuclear-hom-criterion; EnhancedDerivedSheaves E2.6–E2.7, E5:presentability.1.

## Layer 5: The cotangent complex of analytic rings

### 5.1 Derivations and the cotangent complex

For a map f: A → B of analytic rings and a connective complete B-module M ∈ D_{≥0}(B), give the trivial square-zero extension B ⊕ M (obtained by animation from the static case, EnhancedDerivedSheaves E5:cotangent-export.1, applied in condensed anima) the structure induced from B, and define Der_A(B, M) as the anima of A-algebra maps B → B ⊕ M of analytic rings whose composite with the projection is the identity. Define the cotangent complex L_{B/A} ∈ D_{≥0}(B) as the object corepresenting M ↦ Der_A(B, M), with universal derivation (id, d): B → B ⊕ L_{B/A} (RCSolid Definition 7.4.1, RCSolid line 5257). Prove that it exists, M ↦ Der_A(B, M) preserving limits and being accessible, and that it is functorial in arrows of AnRing, as a functor Fun(Δ¹, AnRing) → Mod^{≥0} over AnRing (RCSolid Remark 7.4.2, RCSolid line 5266).

The API consists of the following facts.

- Commutative squares (A → B) → (A′ → B′) induce B′ ⊗_B L_{B/A} → L_{B′/A′}.
- L_{B/A} = B ⊗_{B▷_{A/}} L_{B▷_{A/}/A} and L_{B/A} = L_{B/A▷^cond} (RCSolid Example 7.4.4(2), RCSolid line 5302).
- For trivial structures on discrete animated rings, L_{B^cond/A^cond} is the discrete module L_{B/A} of EnhancedDerivedSheaves E5:cotangent-export.1, whose homotopy-category shadow is `Algebra.CotangentComplex` of DerivedModuleAlgebra §0.4 (RCSolid Example 7.4.4(1), RCSolid line 5295).
- Der_A(B, M) ≃ Map_{D(B)}(L_{B/A}, M), natural in M, and π₀ of it is the set of homotopy classes of A-linear derivations.

*Needs:* 2.2; 2.3; EnhancedDerivedSheaves E5:cotangent-export.1; EnhancedDerivedSheaves E3.2 (adjoint functor theorem); DerivedModuleAlgebra §0.4; DerivedModuleAlgebra §0.6.

**Checks.**

- L_{ℤ[T]_■/ℤ_■} ≅ ℤ[T], free of rank one on dT: (ℤ[T], ℤ)_■ → ℤ[T]_■ is idempotent and L_{(ℤ[T],ℤ)_■/ℤ_■} = ℤ[T] (RCSolid Example 7.4.4(3), RCSolid line 5306).
- For the identity A → A, L = 0, and for A → 0, L = 0.
- For ℤ_■ → 𝔽_p (induced), L_{𝔽_p/ℤ} = (p)/(p²)[1] = 𝔽_p[1], with π₁ = 𝔽_p and π₀ = 0 (DerivedModuleAlgebra §0.13); a definition with values in static modules would lose it.

### 5.2 Base change, colimits, transitivity and connectivity

Prove: (1) for a pushout B′ = B ⊗_A A′ of analytic rings, B′ ⊗_B L_{B/A} ≃ L_{B′/A′}; (2) if A → B is the colimit of a diagram of maps A_i → B_i, then colim_i B ⊗_{B_i} L_{B_i/A_i} ≃ L_{B/A}; (3) for A → B → C, C ⊗_B L_{B/A} → L_{C/A} → L_{C/B} is a fibre sequence; (4) if A → A′ is idempotent, L_{A′/A} = 0 (RCSolid Lemma 7.4.3, RCSolid line 5276; ALRS Lemma A.1.1, ALRS line 9427). Prove the connectivity estimates: for M n-connective with n ≥ 1, Sym^m_A M is (m + n − 1)-connective, and (n + 2m − 2)-connective if n ≥ 2, and nm-connective over ℚ; ∧^m_A M is (n + m − 1)-connective (RCSolid Lemma 7.4.5 and Corollary 7.4.6, RCSolid line 5315, RCSolid line 5324); for f: A → B with induced structure, the map B ⊗_A cofib(f) → L_{B/A} is surjective on π₀, with 2-connective fibre if fib(f) is connective and (n + 3)-connective fibre if fib(f) is n-connective for n > 0 (2n over ℚ) (RCSolid Proposition 7.4.7, RCSolid line 5329); f is an isomorphism iff π₀ f is and L_{B/A} = 0 (RCSolid Corollary 7.4.8, RCSolid line 5339); for f with induced structure and k-connective fibre, the square-zero extension B̃ = B ×_{B ⊕ L_{B/A}} B classified by d has A → B̃ with (k + 1)-connective fibre (RCSolid Lemma 7.4.9, RCSolid line 5347).

A proof route: (1)–(3) from the corepresenting property and the corresponding facts for analytic rings: pushouts of analytic rings are computed by 2.3, and a derivation of B′ over A′ restricts to one of B over A; (4) from A′ ⊗_A A′ = A′ and (1); the connectivity statements hold for animated rings in any ∞-topos (Lurie, SAG Propositions 25.2.4.1 and 25.3.6.1), pass to condensed animated rings, and survive completion, which preserves connective objects; the analytic statements then follow from L_{B/A} = B ⊗ L_{B▷_{A/}/A}.

*Needs:* 5.1; 2.3; EnhancedDerivedSheaves E5:cotangent-export.1–2.

**Checks.**

- (ℤ[T], ℤ)_■ → ℤ((T⁻¹)) (induced, the complementary idempotent algebra of 2.7(1)) is idempotent, so its cotangent complex vanishes, although ℤ((T⁻¹)) is not of finite type over ℤ[T].
- ℤ^cond → ℤ_■ is idempotent (ℤ_■ ⊗_{ℤ^cond} ℤ_■ = ℤ_■), so L_{ℤ_■/ℤ^cond} = 0: changing the analytic structure alone contributes nothing to L.
- For A → A[T]_■ → A (T ↦ 0), transitivity gives A·dT → L_{A/A} = 0 → L_{A/A[T]_■}, so L_{A/A[T]_■} = A[1], the shifted conormal module of a codimension-one regular quotient.

### 5.3 Descent of exterior powers of the cotangent complex

For a solid animated ring R and a descendable map A → A⁰ of solid animated R-algebras with Čech conerve A → A^•, prove that ∧^m_A L_{A/R} → Tot(∧^m_{A^•} L_{A^•/R}) is an equivalence for every m ≥ 0, and that the same holds for a descendable map of analytic rings A → A⁰ with A⁰ carrying the induced structure (ALRS Lemma A.1.2 and the sentence after it, ALRS line 9435 to ALRS line 9440), where ∧^m_A denotes the A-completion of the animated exterior power of EnhancedDerivedSheaves E5:cotangent-export.2 in condensed modules.

A proof route: for m = 1, the fibre sequence A^• ⊗_A L_A → L_{A^•} → L_{A^•/A} and descent of modules reduce to Tot(L_{A^•/A}) = 0, which follows from descendability (a retract onto finite partial totalizations, Mat16 Proposition 3.20) and the vanishing of L for the split augmented diagrams A^m → A^{•+m+1}; for general m, induct along the length-m filtration of ∧^m induced by the fibre sequence.

*Needs:* 5.2; EnhancedDerivedSheaves E5:descent; EnhancedDerivedSheaves E5:cotangent-export.2.

**Checks.**

- For m = 0 the statement is the descent A ≃ Tot(A^•).
- For A → A × A (split, descendable of index 1) both sides are ∧^m L_{A/R}.
- For the non-descendable ℤ → ℚ the comparison fails at m = 0: Tot of the Čech conerve of ℤ → ℚ is ℚ, not ℤ.

### Examples

L_{ℤ[T]_■/ℤ_■} = ℤ[T]; L_{A⟨T⟩/A} = A⟨T⟩ for A derived I-complete with the induced structure and A⟨T⟩ its I-completed polynomial ring (RCSolid Example 7.4.4(4), RCSolid line 5309); L = 0 for rational localizations.

### Dependencies

2.2–2.3, 2.7; EnhancedDerivedSheaves E3.2, E5:cotangent-export.1–2, E5:descent; DerivedModuleAlgebra §§0.4, 0.6, 0.13.

## Layer 6: Solid smoothness and Serre duality

### 6.1 Solid finite presentation

For a map f: A → B of discrete animated rings recall finite presentation (B compact as animated A-algebra), finite presentation to order n and almost finite presentation, equivalently π₀ of finite presentation with L_{B/A} perfect (resp. almost perfect) (RCSolid Definition 7.5.1 and Remark 7.5.3, RCSolid line 5435, RCSolid line 5450). For a map f: A → B of solid Huber rings define f to be of solid finite type if π₀B = π₀(A[T₁, …, T_n]_■)/(f₁, …, f_m) with the induced structure, and of solid finite (resp. almost finite) presentation if moreover L_{B/A} comes from a perfect (resp. almost perfect) B▷(∗)-module (RCSolid Definition 7.5.4, RCSolid line 5458). Prove the permanence properties: stability under base change and composition, and the two-out-of-three properties of RCSolid Lemma 7.5.7 (RCSolid line 5498).

The API consists of the following facts.

- A → B of discrete animated rings is of (almost) finite presentation iff A_■ → B_■ is of solid (almost) finite presentation (RCSolid Example 7.5.5(1), RCSolid line 5470).
- For A noetherian and I-adically complete, a topologically finite type A → B gives A_■ → B_■ of solid almost finite presentation, and for an affinoid algebra B over a complete nonarchimedean field K, (K, O_K)_■ → (B, B°)_■ is of solid almost finite presentation (RCSolid Example 7.5.5(2)–(3)).
- Of solid finite type is detected on π₀ and stable under base change.

*Needs:* 2.9; 5.2; DerivedModuleAlgebra §1.E.0 (perfect complexes).

**Checks.**

- ℤ_■ → ℤ[T]_■ is of solid finite presentation with L free of rank one.
- ℤ_■ → Sym_{ℤ_■}ℤ_■[S] for infinite S is compact but not of solid finite type, since its π₀ is not a quotient of a finitely generated solid Tate algebra.
- ℤ_■ → ℤ_{p,■} (induced) has L = 0, ℤ_p being idempotent over ℤ_■, but it is not of solid finite type: π₀ of a quotient of ℤ[T₁, …, T_n]_■ by finitely many elements with the induced structure is a discrete ring, and ℤ_p is not discrete. Vanishing of L alone does not give finite presentation.

### 6.2 Solid smooth and étale maps

For f: A → B of solid finite presentation define f to be solid smooth if L_{B/A} is finite projective and solid étale if L_{B/A} = 0; locally solid smooth (étale) if it is so locally on rational covers of A and B; the relative dimension is the locally constant rank of L_{B/A} (RCSolid Definition 7.6.1, RCSolid line 5589). Define solid standard smooth maps B = A[T₁, …, T_n]_■/^L(a₁, …, a_k) with k ≤ n and det(∂a_i/∂T_j)_{i,j≤k} invertible in B, standard étale for k = n (RCSolid Definition 7.6.3, RCSolid line 5605). Prove: rational localizations are standard étale; standard smooth and (locally) smooth or étale maps are stable under base change and composition; étale maps satisfy right cancellation; a locally solid étale map with induced structure surjective on π₀ is the quotient by an idempotent, so the diagonal of a locally solid étale map is an open and closed immersion; a surjective map with induced structure between locally solid smooth A-algebras is locally a complete intersection B/^L(f₁, …, f_k), with C▷ dualizable over B and the map suave (RCSolid Proposition 7.6.5, RCSolid line 5619); and f is locally solid smooth (étale) iff it is locally solid standard smooth (étale) (RCSolid Theorem 7.6.7, RCSolid line 5766).

The API consists of the following facts.

- The relative dimension is additive in composites and stable under base change.
- For a scheme map, A_■ → B_■ is locally solid smooth iff A → B is smooth in the classical sense (`AlgebraicGeometry.Smooth` for the associated schemes), with equal relative dimension (`AlgebraicGeometry.SmoothOfRelativeDimension`).
- For affinoid algebras over K, (A, A°)_■ → (B, B°)_■ is locally solid smooth iff the map of rigid spaces is smooth in the sense of AdicSpacesPartII §R0.16.

*Needs:* 6.1; 2.10; 5.2; 2.5 (Lemma 7.6.6 for dualizable idempotents); AdicSpacesPartII §R0.16; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `AlgebraicGeometry.SmoothOfRelativeDimension`.

**Checks.**

- A⟨f/g⟩_■ = A[T₁, …, T_n]_■/^L(gT_i − f_i) has Jacobian the diagonal matrix with entries g, invertible in B, so it is standard étale (RCSolid line 5648).
- ℤ[T]_■ → ℤ[T]_■, T ↦ T², is not étale over ℤ: its Jacobian 2T is not invertible on ℤ[T]_■; over ℤ[1/2][T^{±1}]_■ it is.
- For B = ℤ[T]_■/^L(T²), L_{B/ℤ_■} is the two-term complex B → B·dT given by multiplication by 2T (the differential of T²), with π₁ = T·ℤ ≠ 0, so L is not projective and the map is not solid smooth; it is suave as the composite of ℤ_■ → ℤ[T]_■ (6.4) and the regular quotient by T² (6.3).

### 6.3 Suaveness of regular immersions and of lci maps

Prove: (1) for a map A → B of analytic rings with trivial structures, f is suave iff B is dualizable as a condensed A▷-module (3.2), hence a regular closed immersion A → A/^L(a₁, …, a_c) is suave with dualizing complex the invertible module det(I/I²)^∨[−c] (homological degree −c), computed by the Koszul complex (RCSolid Lemma 6.3.5 and the proof of Proposition 7.7.2, RCSolid line 4111, RCSolid line 5874; DerivedModuleAlgebra §0.K.1); (2) a map of derived schemes of finite Tor-dimension is suave for the solid formalism, and a local complete intersection map is cohomologically smooth with f^!1 ≅ det(L_{X/Y}) (SixFF Theorem 9.17, SixFF line 3423; CSCond Proposition 11.5, CSCond line 2853).

*Needs:* 3.2; 3.4; 0.9; DerivedModuleAlgebra §0.K.1; DerivedModuleAlgebra §0.13.

**Checks.**

- For the zero section ℤ[T] → ℤ, Hom_{ℤ[T]}(ℤ, ℤ[T]) ≅ ℤ[−1] (RCSolid line 5838), the convention witness; for the origin of 𝔸ⁿ, ℤ[−n] (RCSolid line 5874).
- For the non-regular quotient B = ℤ[x, y]/(x², xy) of R = ℤ[x, y], B is perfect over R (R is regular), so R → B is suave, but RHom_R(B, R) has both Ext¹ (from the one-dimensional component y-axis) and Ext² (from the embedded point at the origin, where B has depth 0) nonzero, so it is not an invertible B-module in one degree: suave without being cohomologically smooth.
- For ℤ → 𝔽_p = ℤ/^L p, f^!1 = Hom_ℤ(𝔽_p, ℤ) = 𝔽_p[−1], an invertible 𝔽_p-module in homological degree −1, as for any codimension-one regular immersion.

### 6.4 The solid affine line and cohomological smoothness

Prove that ℤ_■ → ℤ[T]_■ is cohomologically smooth with dualizing complex ℤ[T][1]: f* = Hom_{ℤ_■}(ℤ[T]^∨, −) with ℤ[T]^∨ = ∏_ℕ ℤ compact projective, so f* has a ℤ_■-linear left adjoint f_♮ = ℤ[T]^∨ ⊗_{(ℤ[T],ℤ)_■} −, and f_! = p_* j_! with j_! = fib(ℤ[T] → ℤ((T⁻¹))) ⊗ − and fib(ℤ[T] → ℤ((T⁻¹))) ≅ ℤ[T]^∨[−1], whence f_! ≅ f_♮[−1] and f^! ≅ f*[1] (RCSolid Proposition 7.1.11, RCSolid line 4874). Prove that a locally solid smooth map f: A → B of solid Huber rings of relative dimension d is cohomologically smooth with f^!1 locally a line bundle in homological degree d, and that a locally solid étale map is cohomologically étale (RCSolid Theorem 7.7.1, RCSolid line 5827).

A proof route: localize on rational covers (open covers of analytic stacks, 2.10), reduce by 6.2 to standard smooth B = A[T₁, …, T_n]_■/^L(a₁, …, a_k), which is a regular quotient of a solid Tate algebra: combine base change of ℤ_■ → ℤ[T]_■ with 6.3(1); for étale maps the diagonal is an open immersion, hence étale, and 0.10 applies.

*Needs:* 6.2; 6.3; 3.2; 2.7; 0.9; 0.10.

**Checks.**

- π₁ of ℤ[T][1] is ℤ[T] and π₀ is 0: the dualizing complex of a relative dimension one map sits in homological degree +1, opposite to the zero section's degree −1, and their tensor product along the section is ℤ, as ι^!f^! = id requires.
- For 𝔸¹_ℤ → Spec ℤ, f_!1 = T⁻¹ℤ[[T⁻¹]][−1], and f_!f^!1 = f_!ℤ[T][1] = T⁻¹ℤ[[T⁻¹]] in degree 0 with trace the coefficient of T⁻¹ (SixFF line 3434); a trace defined by the constant coefficient would not be a counit.
- For the open immersion ℤ[T]_■ → ℤ[T^{±1}]_■ (étale), f^!1 = 1 in degree 0.

### 6.5 The deformation to the normal cone

Prove: (1) for the universal vector bundle V of rank n over Vect_n = BGL_n with zero section ι₀, ι₀ is cohomologically smooth, ι₀^!1[n] is a line bundle, and after fixing a trivialization at the base point (a choice in a {±1}-torsor) there is a canonical isomorphism ι₀^!1[n] ≅ det V = ∧ⁿV, the induced map Vect_n → Vect₁ being the determinant (RCSolid Proposition 7.7.2, RCSolid line 5849); (2) the positive truncation of filtered animated rings exists, the adic filtration of a pair (A → B surjective on π₀) is fully faithful into positively filtered animated rings with right adjoint Fil^{≥0} ↦ (Fil⁰ → gr⁰), and its associated graded is Sym_B(L_{B/A}[−1]) (RCSolid Lemmas 7.7.10 and 7.7.14 and Proposition 7.7.12, RCSolid line 5983, RCSolid line 6018, RCSolid line 6007; Mao21 Corollary 3.61, Mao21 line 1551); (3) the deformation to the normal cone Ñ_f = Spec_{𝔸¹/𝔾_m}(Fil_ad(A → B)), with fibre Spec A at 1 and the normal cone Spec_{B𝔾_m}(Sym_B(L_{B/A}[−1])) at 0, and the cone Y^{cone/X} → 𝔸¹/𝔾_m of a map of stacks, Y^{cone/X}(R, I) = Y(R/I) ×_{X(R/I)} X(R), agree: Y^{cone/X} = Spec_{𝔸¹/𝔾_m}(Fil_ad(A → B)) for a Zariski closed immersion (RCSolid Construction 7.7.15 and Remarks 7.7.16–7.7.17, RCSolid line 6032, RCSolid line 6042, RCSolid line 6063); (4) the construction promotes to pairs of analytic rings (maps with induced structure surjective on π₀) by passing to condensed animated rings and completing (RCSolid Remark 7.7.18, RCSolid line 6072); (5) the cone commutes with pullbacks and pushouts of pairs, is compatible with composites A → B → C with L_{C/B} = 0, and for the zero section of 𝔾_a^n the deformation is t𝔾_a^n over 𝔸¹/𝔾_m with ι̃₀^!1[n] = O(−n) (RCSolid Lemma 7.7.19, RCSolid line 6108); (6) for B = A/^L(a₁, …, a_n), f̃: Y × 𝔸¹/𝔾_m → Ñ_f is a complete intersection of codimension n, g: 𝔸¹/𝔾_m → Spec ℤ is prim with g* fully faithful, f̃^!1 ⊗ O(n) is pulled back from Y, and ι₀*(f̃^!1 ⊗ O(n)) ≅ det(N_f)[−n] for N_f = (L_{Y/X}[−1])^∨, canonically up to a universal sign (RCSolid Lemma 7.7.20, RCSolid line 6162).

*Needs:* 1.5; 1.6; 3.8; 5.2; 6.3; EnhancedDerivedSheaves E5:animation.1.

**Checks.**

- For n = 1 over B𝔾_m, ι₀^!1 = Hom_{ℤ[t]}(ℤ, ℤ[t]) = t^{−1}ℤ[−1] and ι₀^!1[1] is the degree-one line bundle, so δ: B𝔾_m → B𝔾_m is the identity and not its inverse (RCSolid line 5902); the determinant is identified with the line bundle of weight one.
- The {±1}-ambiguity is genuine: Hom(GL_n → 𝔾_m) = ℤ·det and automorphisms of the base point act by ±1, so the identification ι₀^!1[n] ≅ det V is canonical only up to sign (RCSolid line 5883).
- For A = ℤ[x] → B = ℤ (x ↦ 0), gr_ad = Sym_ℤ(ℤ·x̄) is the polynomial ring with x̄ in weight 1, matching ⊕ (xⁿ)/(xⁿ⁺¹) (RCSolid line 6003); for A = ℤ[x] → B = ℤ[x]/(x²), I/I² = (x²)/(x⁴) is free of rank one over B, so gr_ad = B[u] with u the class of x² in weight 1, which is the adic filtration of the kernel (x²) and not that of the ideal (x).

### 6.6 Serre duality

Prove that for a locally solid smooth map f: A → B of solid Huber rings of relative dimension n, the deformation to the normal cone gives an isomorphism f^!1 ≅ det(L_{B/A})[n], natural up to a sign depending only on n (RCSolid Theorem 7.7.21, RCSolid line 6208). Deduce: (1) for a smooth morphism of schemes (or of discrete adic spaces) f: Y → X of relative dimension n, f is cohomologically smooth for the solid formalism with ω_f ≅ det Ω¹_{Y/X}[n]; (2) for a smooth morphism of rigid-analytic spaces over a complete nonarchimedean field K, f is cohomologically smooth with ω_f ≅ det Ω¹_{Y/X}[n] (RCSolid Corollary 7.7.23, RCSolid line 6255; CSCond Theorems 11.1 and 11.6, CSCond line 2706, CSCond line 2865); (3) for a proper smooth scheme X over a ring A, f_* is left adjoint to ω_f ⊗ f* on classical quasi-coherent sheaves, compatibly with base change in A, i.e. coherent duality (RCSolid Remark 7.7.24, RCSolid line 6270); (4) for A = ℤ/p^s or a finite flat ℤ/p^s-algebra and q: X → Spec A smooth of pure relative dimension d, q^!A ≅ Ω^d_{X/A}[d] with its only cohomology in cohomological degree −d.

A proof route: by the diagonal trick f^!1 = Δ*pr₂^!1, reduce to a map with a section s; s is locally a complete intersection of codimension n (6.2), so 1 = s^!f^!1 = s^!1 ⊗ s*f^!1 and it suffices to identify s^!1 = det(N_s)[−n]; this follows from 6.5(6), comparing the fibres of f̃^!1 ⊗ O(n) at 0 and 1 of 𝔸¹/𝔾_m; for (1)–(2) localize to Y → 𝔸ⁿ_X étale and use 6.4; for (3) proper f_■* = f_■! preserves discrete objects (3.4), so the solid adjunction restricts.

*Needs:* 6.4; 6.5; 6.2; 3.4; 3.5; Mathlib `KaehlerDifferential`; Mathlib `AlgebraicGeometry.IsProper`; DerivedModuleAlgebra §0.12 (L ≃ Ω¹ for smooth maps).

**Checks.**

- For n = 1, det L = L, so f^!1 ≅ L[1] and the formula ω_g ≅ L_g[d] used in ALRS Remark 6.5.6 (ALRS line 8825) agrees in relative dimension one.
- For 𝔸²_ℤ → Spec ℤ, det L = ∧²(O dT₁ ⊕ O dT₂) ≅ O, so f^!1 ≅ O[2], invertible; L[2] = O²[2] is not invertible, so the formula L[d] is wrong for d = 2 and the determinant form is the theorem.
- For ℙ¹_ℤ → Spec ℤ, ω = Ω¹[1] = O(−2)[1], and coherent duality gives H⁰(ℙ¹, O) dual to H¹(ℙ¹, O(−2)), both ℤ; replacing ω by O[1] would pair H⁰(O) = ℤ with H¹(O) = 0.

### Examples

ℤ_■ → ℤ[T]_■ with dualizing complex ℤ[T][1]; the zero section of 𝔸¹ with ℤ[−1]; ℙ¹ with Ω¹[1]; a smooth curve over ℤ/p^s with Ω¹[1] in cohomological degree −1.

### Dependencies

0.9–0.10, 1.5–1.6, 2.5, 2.7, 2.9–2.10, 3.2, 3.4–3.5, 3.8, Layer 5; Mathlib `KaehlerDifferential`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.SmoothOfRelativeDimension`, `AlgebraicGeometry.IsProper`; AdicSpacesPartII §R0.16; DerivedModuleAlgebra §§0.12–0.13, 0.K.1, 1.E.0; EnhancedDerivedSheaves E5:animation.1.

## Layer 7: Cartier duality in six-functor formalisms

### 7.1 Cartier duality for bialgebras

For a small symmetric monoidal ∞-category C, let Aff_C = CAlg(C)^op, A¹_C ∈ PShv(Aff_C, CMon) the presheaf of commutative monoids Spec A ↦ Map_C(1, A) (multiplicatively), GL_{1,C} ⊆ A¹_C its grouplike part, and define the Cartier duality functor D(H) = Hom(H, A¹_C) on PShv(Aff_C, CMon), with Hom internal to presheaves of commutative monoids. Define commutative and cocommutative bialgebras bCAlg(C) as commutative algebras in cocommutative coalgebras, Hopf algebras as those whose spectrum is grouplike, and C^dual ⊆ C as the dualizable objects (Lur18a Definition 3.3.1 and §3.9). Prove: (1) for grouplike H, Hom(H, GL_{1,C}) → Hom(H, A¹_C) is an equivalence and D(H) is grouplike; (2) for A ∈ bCAlg(C^dual), D(Spec A) is corepresented by A^∨, and Cartier duality restricts to the equivalence bCAlg(C^dual) ≃ bCAlg(C^dual)^op induced by A ↦ A^∨; (3) a dualizable bialgebra A is Hopf iff A^∨ is; (4) for A, B ∈ bCAlg(C) with A dualizable, H = Spec A, G = Spec B and a linear pairing Ψ: G ⊗ H → A¹_C, the induced G → D(H) corresponds to a map of bialgebras Ψ*: A^∨ → B adjoint to the element θ: 1 → A ⊗ B classifying G × H → A¹_C, and G → D(H) is an equivalence iff θ is the unit of a duality (RC26a Theorem 2.3.2, RC26a line 678; Lur18a Propositions 3.8.1, 3.8.5 and 3.9.9 and Remark 3.8.4, Lur18a line 1757, Lur18a line 1837, Lur18a line 1915, Lur18a line 1811).

A proof route: (1) GL_{1,C} is the largest grouplike submonoid; (2)–(4) Lur18a §§3.8–3.9 after enlarging C by Day convolution so that the tensor product commutes with countable colimits; for (4), [H, A¹_C] is corepresented by Sym_C A^∨ and the composite A^∨ → Sym A^∨ → B is dual to θ.

*Needs:* EnhancedDerivedSheaves E5:abstract.1; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:presentability.1 (Ind and Day convolution); EnhancedDerivedSheaves E5:presentability.4 (dualizable objects).

The API consists of the following facts.

- D is a right adjoint, so it sends colimits of commutative monoids to limits and fibre sequences of grouplike objects to fibre sequences.
- For dualizable A, D(D(Spec A)) ≃ Spec A, so Cartier duality is an involution on dualizable bialgebras.
- bCAlg and the Hopf condition are preserved by symmetric monoidal functors.

**Checks.**

- For C = finite free ℤ-modules and A = ℤ[ℤ/n] (the group algebra, dualizable), A^∨ = ℤ^{ℤ/n}, the function algebra, and D(Spec ℤ[ℤ/n]) = Spec ℤ^{ℤ/n} = ℤ/n, so D(μ_n) = ℤ/n (μ_n = Spec ℤ[ℤ/n]).
- For A = 1 (the trivial bialgebra), D(∗) = ∗.
- For C = all ℤ-modules and A = ℤ[T] with T primitive, A is not dualizable and (2) does not apply. Indeed a character 𝔾_a → 𝔾_m over ℤ is a unit u ∈ ℤ[T]^× = {±1} with u(X + Y) = u(X)u(Y) and u(0) = 1, so u = 1 and D(𝔾_a)(Spec ℤ) is trivial, while the linear dual ℤ[T]^∨ = ∏_n ℤ·(Tⁿ)^∨ is a nontrivial ring (divided-power power series); dualizability is necessary.

### 7.2 Kernel-level Cartier duality in Künneth formalisms

Let D be a presentable six-functor formalism on a small geometric setup (C, E) with finite limits, κ-presentable, and S ∈ C with D Künneth over S, so that the kernel bicategory embeds into D(S)-linear κ-presentable categories (0.7). Let Pr_{D,S} = Mod_{D(S)}(Pr^L_κ), Aff_{D,S} = CAlg(Pr_{D,S,κ})^op, and A¹_{D,S}, GL_{1,D,S} the presheaves sending Spec_S A to the core of the κ-compact objects of the symmetric monoidal D(A) = Fun_{D(S)}(D(S), A), resp. its invertible objects. Construct the functors [−]_*: (C_E/S)^op → CAlg(Pr_{D,S}), X ↦ (D(X), ⊗) with unit and multiplication given by f* and Δ*, and [−]_!: C_E/S → cCAlg(Pr_{D,S}), the dual coalgebras with counit f_! and comultiplication Δ_!, and their refinements to bialgebras for commutative monoid objects X of C_E/S, so that D([X]_!) is D(X) with convolution along m_! (RC26a Construction 2.4.1, RC26a line 721). Prove: (1) Cartier duality of 7.1 preserves CMon(Aff^K_{D,S}) and on the image of commutative monoids X it sends Spec_S[X]_* to Spec_S[X]_! (RC26a Proposition 2.4.3, RC26a line 764); (2) for commutative monoids X, Y over S and a map of commutative monoid presheaves h: X ⊗ Y → F*A¹_{D,S} (F = Spec_S[−]_*), the Fourier–Mukai transform FM_h: [Y]_! → [X]_* is a map of bialgebras whose underlying kernel is the object F_h ∈ D(Y ×_S X) classified by Y × X → Y ⊗ X → F*A¹ (RC26a Proposition 2.4.4, RC26a line 817), FM_h: D(Y) → D(X), M ↦ π_X!(π_Y*M ⊗ F_h), sends convolution to tensor product and e_! to f* (RC26a Remark 2.4.5, RC26a line 835), and its dual FM_h^∨: [X]_! → [Y]_* has the same kernel with ! and ∗ exchanged; (3) FM_h is compatible with base change S′ → S and an equivalence can be checked after a base change of universal ∗-descent (RC26a Remark 2.4.6, RC26a line 854; HM Proposition 4.3.1). Define h to induce a 1-categorical Cartier duality if FM_h is an isomorphism, and then call Y a 1-categorical Cartier dual of X (RC26a Definition 2.4.7, RC26a line 861).

*Needs:* 7.1; 0.7; 0.12; 3.3; EnhancedDerivedSheaves E5:presentability.2; EnhancedDerivedSheaves E5:presentability.4.

The API consists of the following facts.

- [X]_* and [X]_! are dual objects of Pr_{D,S} (every D(X) is self-dual), and FM_h is invertible iff its underlying kernel is invertible in the kernel bicategory.
- A 1-categorical Cartier duality gives a symmetric monoidal equivalence (D(Y), ⋆_!) ≃ (D(X), ⊗) of D(S)-linear categories carrying e_!1 to 1.
- 1-categorical Cartier duality is preserved by base change along every S′ → S and descends along universal ∗-descent.

**Checks.**

- For X = Y = S (trivial monoids) and h trivial, FM_h is the identity of D(S).
- The trivial pairing h ≡ 1 between nontrivial monoids never induces a duality: FM_h(M) = f_X*(g_Y!M) factors through D(S); for X = Y = ℤ^Betti over ℤ^cond it sends the skyscrapers at 0 and at 1 to the same constant object ℤ, so FM_h is not faithful.
- For a finite locally free commutative group scheme G over a ring R and its Cartier dual G^D (the anti-equivalence `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`), O(G) is dualizable in D(R) with O(G)^∨ = O(G^D), and 7.1(2) recovers G^D as D(G); the evaluation pairing G × G^D → 𝔾_m induces the 1-categorical Cartier duality [BG]_! ≅ [G^D]_* in the algebraic formalism of 1.1.

### 7.3 1-suave and 1-étale maps and the descent criterion

Let V be a κ-presentable symmetric monoidal stable ∞-category, Pr_V = Mod_V(Pr^L_κ), 0Aff_V = CAlg(V)^op ⊆ 1Aff_V = CAlg(Pr_V)^op (via A ↦ Mod_A(V)), and for X ∈ 1Aff_V, Pr_X = Mod_{D(X)}(Pr_V), viewed as an ∞-category with its Pr^L-enrichment by internal Hom of linear functors. For f: Y → X in 1Aff_V with D(X) → D(Y) κ-presented, define f to be 1-suave if f*_1 = D(Y) ⊗_{D(X)} −: Pr_X → Pr_Y has a Pr_X-linear left adjoint f_{1,♯}; 1-étale if every diagonal Y → Y^{S^n/X} (the cotensor with the n-sphere over X) is 1-suave; 0-suave if f is 1-étale and the counit f_!: f_{1,♯}D(Y) → D(X) has a right adjoint in Pr_X; 0-prim if f* has a right adjoint in Pr_X (0-étale and 0-proper when this holds for all diagonals) (RC26a Definition 2.5.1, RC26a line 897). Prove: (1) κ-presented maps in 0Aff_V are 1-étale with f_{1,♯} = f_{1,∗}; for a Künneth formalism, Spec D(Y) → Spec D(X) is 1-suave for every !-able Y → X, and 1-étale if every diagonal is Künneth; the classes are stable under base change, composition and right cancellation (RC26a Lemma 2.5.3, RC26a line 928); (2) 1-étale covers (families with f_{1,♯}-colimit descent; RC26a Definition 2.5.4 and Lemma 2.5.5, RC26a line 1023, RC26a line 1030) generate a Grothendieck topology on 1Aff_V for which A¹_V and GL_{1,V} are sheaves and Cartier duals are sheaves (RC26a Definition 2.5.7, Lemmas 2.5.9 and 2.5.12, RC26a line 1081, RC26a line 1085, RC26a line 1215); (3) for G a connective spectrum object of 1-étale sheaves represented in 1Aff_V with D(G) and D(ΩG) dualizable and ∗ → G a 1-étale cover, D(G) → ∗ → D(ΩG) is a fibre sequence, and if H is represented with D(H) dualizable, ∗ → H a 1-étale cover and D(G) → ∗ → H a fibre sequence, then D(H) = ΩG and D(ΩG) = H (RC26a Proposition 2.5.13, RC26a line 1225); (4) the descent criterion: for S = AnSpec A affinoid and a !-able quasi-affinoid grouplike commutative monoid G → S factoring as a G-equivariant open immersion into an affinoid Ḡ with induced structure, with S → BG of universal !-descent, ∗ → Spec_S[BG]_* is a 1-étale !-cover with Čech nerve Spec_S[G^•]_*; if G is moreover suave, the Cartier dual of Spec_S[BG]_* is 0-affine with algebra Hom_{BG}(e_!1, e_!1) = f_!f^!1; for an affinoid grouplike H with induced structure and a pairing ψ: H × BG → GL_{1,C}, the map Spec_S[H]_* → Spec_S[BG]_! comes from a unique algebra map f_!f^!1 → O(H) corresponding to the class of ψ in Γ(H × G); and if this map is an equivalence and S → BH is descendable, ψ induces 1-categorical Cartier dualities between G and BH and between BG and H (RC26a Theorem 2.5.15, RC26a line 1318).

*Needs:* 7.1; 7.2; 0.12; 3.3; EnhancedDerivedSheaves E5:presentability.2; EnhancedDerivedSheaves E5:presentability.4; EnhancedDerivedSheaves E5:descent.

**Checks.**

- The identity of X is 1-suave, 1-étale, 0-suave and 0-prim.
- For V = D(Λ) and Y = Spec(Λ × Λ) → X = Spec Λ, f*_1(M) = M × M, with two-sided adjoint the product, and f is 0-étale and 0-proper: the finite-set formalism in disguise.
- For V = D(ℤ) and f: Spec ℤ[T] → Spec ℤ, the Künneth formalism of 1.1 makes f 1-suave by (1), and f* = ℤ[T] ⊗ − has the colimit-preserving right adjoint (restriction), so f is 0-prim; but f_! is the restriction D(ℤ[T]) → D(ℤ), whose right adjoint Hom_ℤ(ℤ[T], −) = ∏_ℕ(−) does not preserve colimits, so f is not 0-suave, matching the failure of suaveness of 𝔸¹ → Spec ℤ in 1.1.

### 7.4 Lattices and tori

Over S = AnSpec ℤ^cond, prove: g: ℤ^Betti → S has g_!1 = g_♯1 = ⊕_ℤ ℤ (RC26a Lemma 3.1.1, RC26a line 1482); B𝔾_m represents A ↦ the anima of invertible objects of D(A) of the form of line bundles and e: S → B𝔾_m is prim and descendable (RC26a Lemma 3.0.3 and Lemma 3.1.2, RC26a line 1461, RC26a line 1486); the pairing ℤ^Betti × 𝔾_m → 𝔾_m induces 1-categorical Cartier dualities [B𝔾_m]_! ≅ [ℤ^Betti]_* and [𝔾_m]_! ≅ [Bℤ^Betti]_* (RC26a Proposition 3.1.3, RC26a line 1495); and, for the algebraic stack Latt of finite free ℤ^Betti-lattices, ⊔_n BGL_n(ℤ)^Betti ≃ Latt and the pairing V × T_{V*} → 𝔾_m with the universal torus T_{V*} = 𝔾_m ⊗ V* gives [BT_{V*}]_! ≅ [V]_* and [T_{V*}]_! ≅ [BV]_* in the kernels over Latt (RC26a Theorem 3.1.4, RC26a line 1518).

A proof route: apply 7.3(4) with G = ℤ^Betti ⊆ Ḡ = Spec O(ℤ^Betti), H = 𝔾_m; the class of the pairing in Γ(ℤ^Betti × 𝔾_m) = ∏_ℤ ℤ[T^{±1}] is (Tⁿ)_n, which sends the n-th basis vector of ⊕_ℤ ℤ to Tⁿ, an isomorphism onto ℤ[T^{±1}]; the stacky form follows by ∗-descent over Latt from the rank one case.

*Needs:* 7.3; 4.1; 1.5; 3.8.

**Checks.**

- D(B𝔾_m) is graded condensed abelian groups (1.5 and 3.8), and the duality identifies a graded object ⊕_n M_n with the family (M_n)_{n∈ℤ} on ℤ^Betti, D(ℤ^Betti) = ∏_ℤ D(ℤ^cond). Under FM_h the !-convolution of D(B𝔾_m) goes to the pointwise tensor product (M_n ⊗ N_n)_n, and under FM_h^∨ the !-convolution on ℤ^Betti, (M ⋆ N)_n = ⊕_{i+j=n} M_i ⊗ N_j, goes to the tensor product of graded objects.
- For the zero lattice, Latt has the point component BGL₀ = ∗ and the duality is trivial.
- The pairing's class (Tⁿ) must be (Tⁿ) and not (T⁻ⁿ) for the convention of the universal character; with (T⁻ⁿ) the duality still holds but differs from the stated one by the inversion of ℤ^Betti, which reverses the grading.

### 7.5 Additive Cartier dualities

Prove the following 1-categorical Cartier dualities, each through 7.3(4) and an explicit computation of g_♯1 against the coordinate ring of the dual. (1) Over ℤ^cond, for the formal group Ĝ_a, the formal completion of 𝔾_a at 0 (1.4) realized over ℤ^cond (3.8), and the divided-power group G_a^♯ = Spec ℤ[T]^DP, with the exponential pairing exp(XT) = Σ_n Xⁿ Tⁿ/n!: [BG_a^♯]_! ≅ [Ĝ_a]_* and [G_a^♯]_! ≅ [BĜ_a]_*, and after base change to ℚ the corresponding dualities for 𝔾_{a,ℚ} (RC26a Lemmas 3.2.1, 3.2.3 and 3.2.5, Construction 3.2.2, Proposition 3.2.6 and Corollary 3.2.7, RC26a line 1550 to RC26a line 1628). (2) Over ℤ_■, for G_{a,■} = AnSpec ℤ[T]_■ and Ĝ^♯_{a,■} = AnSpec(ℤ[[T]]^DP, ℤ)_■ with ℤ[[T]]^DP = ∏_n ℤ Tⁿ/n! and the same exponential: [BĜ^♯_{a,■}]_! ≅ [G_{a,■}]_* and [Ĝ^♯_{a,■}]_! ≅ [BG_{a,■}]_* (RC26a Lemma 3.2.8, Construction 3.2.9, Lemma 3.2.10 and Proposition 3.2.11, RC26a line 1642 to RC26a line 1680). (3) Over R = ℤ((π)) with |π| = 1/2 and the solid structure, with the Banach spaces ℓ^ℕ_R(r) of sequences with |a_n|rⁿ → 0, the overconvergent disc D^{≤r}_R = AnSpec R⟨T⟩_{≤r}, R⟨T⟩_{≤r} = colim_{r′>r} ℓ^ℕ_R(r′) (basis Tⁿ), its divided-power variant D^{♯,≤r}_R = AnSpec R⟨T⟩^DP_{≤r} (basis Tⁿ/n!), the open disc D^{<r}_R = ∪_{r′<r} D^{≤r′}_R and the analytic line G^an_{a,R} = ∪_n AnSpec R⟨πⁿT⟩_■: R⟨T⟩^DP_{≤r} is a cocommutative Hopf algebra and a D^{≤1}_R-module, the Poincaré sequence 0 → R → R⟨T⟩^DP_{≤r} → R⟨T⟩^DP_{≤r} → 0 is exact as comodules, BD^{♯,≤r}_R is !-able, and exp(YX) induces [BD^{♯,≤r}_R]_! ≅ [D^{<1/r}_R]_* and [D^{♯,≤r}_R]_! ≅ [BD^{<1/r}_R]_* (RC26a Definitions 3.2.13–3.2.14 and 3.2.17, Lemmas 3.2.16, 3.2.18–3.2.19, Construction 3.2.20 and Proposition 3.2.21, RC26a line 1713 to RC26a line 1881). (4) Over R, with G^†_{a,R} = lim_{r→0} D^{≤r}_R and G^{♯,†}_{a,R} = lim_{r→0} D^{♯,≤r}_R, G^{♯,†}_{a,R} is a G^an_{a,R}-module, BG^{♯,†}_{a,R} is !-able, and the pairing (Y, X) ↦ exp(YX) gives [BG^{♯,†}_{a,R}]_! ≅ [G^an_{a,R}]_* and [G^{♯,†}_{a,R}]_! ≅ [BG^an_{a,R}]_* (RC26a Definition 3.2.22, Lemmas 3.2.24–3.2.25, Construction 3.2.26 and Proposition 3.2.27, RC26a line 1904 to RC26a line 1936). (5) Over ℚ_{p,■}, for ℤ_p^la = AnSpec C^la(ℤ_p, ℚ_p) (locally analytic functions) and the open unit disc 1 + D^{<1}_{ℚ_p} around 1 with its ℤ_p^la-module structure (a, 1 + X) ↦ (1 + X)^a given by the Amice transform, Bℤ_p^la is !-able and [Bℤ_p^la]_! ≅ [1 + D^{<1}_{ℚ_p}]_* and [ℤ_p^la]_! ≅ [B(1 + D^{<1}_{ℚ_p})]_* (RC26a Definition 3.2.29, Lemmas 3.2.30–3.2.31 and Proposition 3.2.32, RC26a line 1951 to RC26a line 2013), the computation being the topological isomorphism between the dual of C^la(ℤ_p, ℚ_p) and O(1 + D^{<1}) of LocallyAnalyticDistributions §1.1.

A proof route: in each case the factorization required by 7.3(4) is G ⊆ Ḡ = the algebraic line or multiplicative group with the induced structure, and BH is !-able by a Poincaré-type exact sequence of comodules showing e_*1 descendable (as in 1.5); the remaining isomorphism is the explicit statement that the exponential (resp. the Amice transform) identifies the continuous dual of O(G) with O(H).

*Needs:* 7.3; 1.4; 1.5; 2.7; 2.9; 2.11; 6.4 (suaveness of G_{a,■}); LocallyAnalyticDistributions §1.1; Mathlib `AbstractMeasure.amiceTransformEquiv`.

**Checks.**

- exp(XT) sends the dual basis vector of Xⁿ to Tⁿ/n! (RC26a line 1624), so the map ⊕_n ℤ·(Xⁿ)^∨ → ℤ[T]^DP is an isomorphism; with the polynomial ring ℤ[T] in place of ℤ[T]^DP the image of (Xⁿ)^∨ would be Tⁿ/n!, not in ℤ[T] for n ≥ 2, so 𝔾_a over ℤ is not the Cartier dual of Ĝ_a.
- Over ℚ_p with |p| = p⁻¹, v_p(n!) = (n − s_p(n))/(p − 1), so D^{♯,≤r}_{ℚ_p} = D^{≤r p^{−1/(p−1)}}_{ℚ_p} and the dualities specialize to D^{<1} against the closed overconvergent disc of radius p^{−1/(p−1)} (RC26a Remark 3.2.28, RC26a line 1941).
- The Amice transform sends δ_a to (1 + X)^a: for a = 1 the pairing of the Dirac distribution at 1 with the coordinate is 1 + X, and for a = 0 it is 1, as LocallyAnalyticDistributions' normalisation requires; the bounded case is Mathlib's `AbstractMeasure.amiceTransformEquiv`.

### 7.6 Stacky Cartier duality for vector bundles and gerbes

Let Vect be the algebraic stack of vector bundles, ⊔_n BGL_n ≃ Vect (RC26a Definition 3.2.33 and Lemma 3.2.34, RC26a line 2025, RC26a line 2028). For a ring stack R/S (a finite-product-preserving functor from polynomial ℤ-algebras to analytic stacks over S, equivalently a sheaf of animated rings on analytic stacks over S) define the transmutation P(Aff) → AnStk_{/S}, F ↦ the sheafification of X ↦ F(R(X)), which commutes with finite limits and colimits and factors through T-sheaves when R satisfies T-descent (RC26a Construction 3.2.35, RC26a line 2053). For each of the ring stacks 𝔾_a/ℤ^cond, G_{a,■}/ℤ_■, D^{≤1}_R/R, G^an_{a,R}/R and ℤ_p^la/ℚ_{p,■} (RC26a Example 3.2.36, RC26a line 2078), with V^R the transmutation of the universal vector bundle over Vect^R and V^{∨,R} that of its dual, prove the 1-categorical Cartier dualities over Vect^R: (1) [BV^♯]_! ≅ [V̂^∨]_* and [V^♯]_! ≅ [BV̂^∨]_* for 𝔾_a; (2) [BV^{♯,≤r}]_! ≅ [V^{∨,<1/r}]_* and [V^{♯,≤r}]_! ≅ [BV^{∨,<1/r}]_* for D^{≤1}_R; (3) [B(V^{∨,R} ⊗_R D(R))]_! ≅ [V^R]_* and [V^{∨,R} ⊗_R D(R)]_! ≅ [BV^R]_* for R = G_{a,■}, G^an_{a,R}, ℤ_p^la with D(R) = Ĝ^♯_{a,■}, G^{♯,†}_a, 1 + D^{<1}_{ℚ_p} (RC26a Theorem 3.2.37, RC26a line 2085). For a !-able ring stack R/S with a Cartier dual D(R) and exponential, R-modules M, N with an R-linear Ψ: M ⊗_R N → D(R) inducing [BM]_* ≅ [N]_!, and X = B²M, prove that the extensions N_ψ and M̃ of RC26a Construction 3.3.1 carry the pairing of RC26a Lemma 3.3.2 and induce [N_ψ]_* ≅ [M̃]_! in the kernels over X (RC26a Proposition 3.3.3, RC26a line 2171).

A proof route: by 7.2(3) the statements are local on Vect^R (resp. X) for ∗-descent; Vect^R is covered by the point and the duality reduces to the rank one case of 7.5 (resp. the extensions split after pullback to S, and the pairing becomes the sum of the two given dualities).

*Needs:* 7.5; 7.2; 7.4; 3.8; 1.5.

**Checks.**

- In rank zero, V = 0 and every duality is the identity.
- In rank one over the point, (1) is 7.5(1) and (3) for ℤ_p^la is 7.5(5).
- Over Vect_n the dual V^∨ appears and not V: for the standard representation St_n of GL_n, the pairing V^♯ ⊗ V̂^∨ → G_a^♯ ⊗ Ĝ_a is the evaluation, and replacing V^∨ by V would pair St_n with itself, which is not GL_n-invariant for n ≥ 1 (the scalar matrix λ acts by λ² on St ⊗ St).

### 7.7 Classifying stacks of the analytic multiplicative group and of overconvergent vector groups

For K a complete nonarchimedean field over ℚ_p and A an animated solid K_■-algebra, prove that quasi-coherent sheaves on [AnSpec A/𝔾_m^an] are the modules over A ⊗_{K_■} ℓ^temp_{ℤ,K}, the algebra of two-sided sequences (a_n)_{n∈ℤ} with |a_n| r^{|n|} → 0 for some r > 0, and that D(AnSpec A × 𝔾_m^an) ≃ D([AnSpec A/ℤ^temp]), naturally in base change B ⊗_A − (RJRC Proposition 4.4.8, RJRC line 2134). Prove that, for a vector bundle V over an analytic stack over R, D(BV^{♯,†}) ≃ D(V^{∨,an}) through 7.6(3) for G^an_{a,R}.

A proof route: the cohomologically smooth f: ∗ → [∗/𝔾_m^an] has f* with a left adjoint f_♮ = f_!(− ⊗ f^!1); Barr–Beck–Lurie identifies D([∗/𝔾_m^an]) with modules over the monad f*f_♮, which by the projection formula is tensoring with f*f_♮1, computed as the homology of 𝔾_m^an, that is ℓ^temp_{ℤ,K} (RJRC line 2141 to RJRC line 2150).

*Needs:* 7.6; 6.4; 0.9; 2.11; EnhancedDerivedSheaves E5:abstract.5.

**Checks.**

- For A = 0 both sides vanish.
- The constant sequence a_n = 1 lies in ℓ^temp (|a_n| r^{|n|} → 0 for any r < 1), while a_n = p^{−n²} does not (|a_n| r^{|n|} = p^{n²} r^{|n|} → ∞ for every r > 0), so ℓ^temp is a proper subalgebra of all sequences ∏_ℤ K.
- ℓ^temp_{ℤ,K} is closed under pointwise multiplication: if |a_n| r^{|n|} → 0 and |b_n| s^{|n|} → 0 then |a_n b_n| (rs)^{|n|} → 0, as needed for it to be the ring of functions on ℤ^temp; it is not closed under convolution of sequences (the convolution of the constant sequence 1 with itself diverges).

### Examples

ℤ^Betti and 𝔾_m; Ĝ_a and G_a^♯ through exp(XT); the open unit disc and the closed overconvergent disc of radius p^{−1/(p−1)} over ℚ_p; locally analytic ℤ_p against the open disc around 1 through the Amice transform; the universal vector bundle over Vect against its overconvergent divided-power dual.

### Dependencies

0.7, 0.9, 0.12, 1.4–1.5, 2.7, 2.9, 2.11, 3.3, 3.8, 4.1, 6.4; Mathlib `AbstractMeasure.amiceTransformEquiv`; Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` (Check); LocallyAnalyticDistributions §1.1; EnhancedDerivedSheaves E5:abstract.1–2, .5, E5:presentability.1–2, .4, E5:descent.

## Downstream consumers

- **MotivesAndAlgebraicCyclesPartII.** Its interface AnalyticStacks:0 is 0.4–0.6 (formalisms, the construction principle and the extension theorem) with 0.9–0.10 (cohomologically smooth, étale and proper maps); its interface AnalyticStacks:1 is 1.1–1.5 (derived quasi-coherent categories of algebraic stacks in the !-topology, tensor descent along !-covers and the comodule description of classifying stacks of flat affine groups). The identification of representations of its stacks MG_k and MG_ℂ with operators stays with that roadmap.
- **AutomorphicBundlesPartII.** Its gap G-solid is 3.4 (the solid six operations on schemes, the discrete subcategory, the finiteness of proper pushforward and the localization triangles of formal completions) and 6.6 (Serre duality for smooth maps). Its filtered support functors stay there.
- **HigherHidaAndColemanTheory.** Its target D1/solid-scheme-operations is 3.4 together with 6.6(4) for the coefficients ℤ/p^s and their finite flat extensions; its gap solid-localization-kernel is 2.7(1), (5), (8) and (9) (the idempotent kernels ℤ((T⁻¹)) and R̂_I and Zariski open covers); its gap discrete-adic-solid-comparison is 2.8 and 3.4.
- **RationalAnalyticPrismatization.** Its contracts map to: light-solid-analytic-rings → 2.2, 2.3, 2.11, 3.6; analytic-stack-topos → 3.3; qcoh-six-functors → 0.5, 0.6, 3.2, 3.3; suave-prim-calculus → 0.8–0.11; classifying-stack-dualizing → 4.2; hypercover-inversion → 0.13(6) with 3.3; betti-realization → 4.1; nuclear-modules → 4.3 (the description of nuclear modules on a light profinite S is that of modules over C^lc(S, ℚ_p) by 4.1; the quasi-pro-étale statement of Anschütz–Mann is not part of this roadmap); fredholm-criteria → 4.4, with the Banach case in the form of sheafy analytic complete Huber pairs; solid-cotangent-complex → 5.1–5.3; vector-group-cartier-duality → 7.5(4); stacky-cartier-duality → 7.6; qcoh-bgm-description → 7.7; algebraic-stacks-condensed → 3.8 with 1.6; formal-line-shearing → 1.7 with 3.8; formal-cone-adic-filtration → 6.5(3)–(4); regular-immersion-suave → 6.3; solid-smooth-duality → 6.4 and 6.6 (with the determinant form). Its contracts on Gestalten (n-affine, n-proper maps and transmutation into Gestalten) are not supplied here.
- **LocallyAnalyticRepresentationsOfLocalGroups.** LR.3 takes E_■ = (E, O_E)_■ and the solid structures (A, A°)_■ of affinoid algebras from 2.9 and 2.11, in the light setting; its comparison with its strongly inaccessible cutoff setting stays there.

## References

All locators are to the versions recorded in sources.toml; line numbers refer to the text extractions of those versions. Statements are in this roadmap's own words.

- **RCSolid:** J. E. Rodríguez Camargo, *Notes on Solid Geometry*, arXiv:2603.03012v1. §§4–7.
- **HM:** C. Heyer, L. Mann, *6-Functor Formalisms and Smooth Representations*, arXiv:2410.13038v1. §§2–5.
- **SixFF:** P. Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2. Lectures II–VI, IX–X.
- **LZ12b:** Y. Liu, W. Zheng, *Gluing restricted nerves of ∞-categories*, arXiv:1211.5294v4. Theorems 0.1, 4.27, 5.4.
- **Man22:** L. Mann, *A p-Adic 6-Functor Formalism in Rigid-Analytic Geometry*, arXiv:2206.02022v1. Propositions 2.9.6, A.3.21, A.5.10, A.5.12, A.5.14.
- **ABFJ22:** M. Anel, G. Biedermann, E. Finster, A. Joyal, *Left-exact localizations of ∞-topoi I: Higher sheaves*, arXiv:2101.02791v4 (Adv. Math. 400, 2022). Theorem 4.3.3.
- **ABLB:** J. Anschütz, G. Bosco, A.-C. Le Bras, J. E. Rodríguez Camargo, P. Scholze, *Analytic de Rham stacks of Fargues–Fontaine curves*, arXiv:2510.15196v2. Definition 4.2.1, Remarks 4.2.2–4.2.5, Lemmas 4.2.9, 4.2.11, Appendix A.
- **ALRS:** J. Anschütz, A.-C. Le Bras, J. E. Rodríguez Camargo, P. Scholze, *Rational analytic prismatization*, author preprint. Remarks 2.9.1–2.9.2, 6.5.6, Lemmas A.1.1–A.1.2.
- **RC26a:** J. E. Rodríguez Camargo, *Cartier duality for gerbes of vector bundles*, arXiv:2512.24967v3. §§2–3.
- **RJRC:** J. Rodrigues Jacinto, J. E. Rodríguez Camargo, *Solid locally analytic representations*, arXiv:2305.03162v5. Proposition 4.4.8.
- **Sch24:** P. Scholze, *Geometrization of the real local Langlands correspondence*, author draft. §VI.1.
- **CS22:** D. Clausen, P. Scholze, *Condensed Mathematics and Complex Geometry*, arXiv:2605.11731v1. Lectures V–VI, VIII–IX.
- **CSCond:** P. Scholze (with D. Clausen), *Lectures on Condensed Mathematics*, arXiv:2605.03658v1. Examples 7.3, Lecture XI.
- **CSAnal:** P. Scholze (with D. Clausen), *Lectures on Analytic Geometry*, arXiv:2605.03655v1. Definition 12.1, Propositions 12.19–12.20.
- **And21:** G. Andreychev, *Pseudocoherent and Perfect Complexes and Vector Bundles on Analytic Adic Spaces*, arXiv:2105.12591v1. Proposition 3.34, Theorems 4.1, 5.50, Corollary 5.51.1.
- **Bos23:** G. Bosco, *Rational p-adic Hodge theory for rigid-analytic varieties*, arXiv:2306.06100v1. Theorem A.17.
- **Mat16:** A. Mathew, *The Galois group of a stable homotopy theory*, arXiv:1404.2156v2. Propositions 3.20, 3.31, 3.34.
- **BHL17:** B. Bhatt, D. Halpern-Leistner, *Tannaka duality revisited*, arXiv:1507.01925v1. Theorem 1.10.
- **Mao21:** Z. Mao, *Revisiting derived crystalline cohomology*, arXiv:2107.02921v2. Corollary 3.61.
- **Lur18a:** J. Lurie, *Elliptic Cohomology I: Spectral Abelian Varieties*, author version of February 2018. §§3.3, 3.8–3.9.
- **GvG24:** M. Gehrke, S. van Gool, *Topological Duality for Distributive Lattices: Theory and Applications*, arXiv:2203.03286v5. Theorems 5.38, 6.4.
- **Mou:** T. Moulinos, *The geometry of filtrations*, arXiv:1907.13562v2. Theorems 1.1, 4.1.
- **BZSV:** D. Ben-Zvi, Y. Sakellaridis, A. Venkatesh, *Relative Langlands duality*, arXiv:2409.04677v1. §6.3.
- **Gest:** P. Scholze, *Geometry and higher category theory*, author lecture notes. Lectures VI–IX; cited only for the boundary of this roadmap's scope.
