# Roadmap: étale homotopy types and pro-spaces

**Summary.** Construct the raw étale homotopy type of locally noetherian schemes and simplicial schemes, starting from simplicial sets, ordinary pro-categories, finite étale covers and sheaf cohomology. Develop its covering theory, classifying pro-spaces, materialization and relative pointed mapping classes. The end theorems are Galois-equivariant cohomology transport, arithmetic monodromy orbit bijections, maps into products of raw étale K(π,1) varieties, and a functorial Betti–étale comparison after p-profinite completion with explicit cohomological finiteness hypotheses. The library includes all primes and arbitrary local coefficients in the raw comparison range.

## Scope and ownership

This roadmap owns homotopy pro-local systems, Isaksen’s pro-space model, pro-coverings and pro-classifying spaces, the rigid simultaneous étale construction, its raw comparisons and fiber theorem, arithmetic relative mapping-class adapters, and the p-finite model comparison and complex comparison zigzag. Ordinary spaces, the generic Pro carrier, finite étale Galois categories, analytic spaces and ordinary sheaf cohomology are supplied objects.

The ordinary Pro category and its Hom formula are stated by AdicSpacesPartII §R0.19.9; DiamondsAndVStacks §D0.13 and PerfectoidSpaces §P6.10 own bounded presentations. The specialization to simplicial sets retains their carrier and makes its additional size and reindexing requirements explicit. AlgebraicTopology Stages 6 and 8 own ordinary local coefficients, homotopy groups, Whitehead theory and representability; Completed/UniversalCovers Stages 2–4 own ordinary universal covers and deck transformations. StableHomotopyKTheory §§1.19–1.23 and 1.28–1.34 own discrete group nerves, translation categories and their covering/asphericity comparisons. The pro-level constructions here differ by their cofiltered diagrams and derived mapping problem.

The compact compatible-family theorems, topological finite-generation predicate and finitely generated abelian pro-p structure theorem are already in the library, in the Tau Ceti modules listed below. ProfiniteProPGroups Layers 0, 3 and 4 own their profinite group interfaces. Homotopy groups use those predicates and structures without a second definition. The native singular functor, simplicial sets, abstract model-category class and abelian sheaf cohomology are already in the library and are imported with their actual size and existence hypotheses.

EtaleCohomologyFoundations §§F.0.2 and F.0.A2 own finite étale fundamental groups, étale paths and the arithmetic exact sequence; its §F.0.4 owns purely inseparable topological invariance and §F.2.6 owns finite-coefficient Künneth. SchemeAndStackFoundations §§2.5, 2.10 and 2.15 own cohomology limits, finite étale sites and descent. Orbifolds O4-N owns ordinary numerable-submersion Čech descent. EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and E2.6 own coherent categorical infrastructure, generic hypercovers and bounded-below cohomological descent. ComplexComparisonPartII §C−1.1 owns analytification, §§C5.1 and C6.1 own sheaf–singular comparison, and §§C6.2–C6.3 own Riemann existence and finite Artin comparison.

The finite-coefficient K(π,1) applications, smooth-curve examples and geometric existence of hyperbolic neighborhoods belong to AnabelianGeometryAndNonabelianChabauty Layer 1. The raw effacement/product theorem needed before those applications is §3.9 here. The open-image and geometric-conjugacy adapters are §§4.0a–4.0b here; InverseGaloisAndArithmeticFundamentalGroups consumes them in its arithmetic applications. The general unstable-limit interface is an explicit contract with the supplied ordinary topology supplier. A¹-local realization and motivic K-theory belong to MotivicEtaleKTheory; ℓ-adic homotopy algebras and weights belong to EllAdicHomotopyTypesAndWeights; Generic Γ-spaces and group completion belong to StableHomotopyKTheory Layers 4–6; arithmetic identification of the spectrum-level symplectic Galois action belongs to ArithmeticKTheoryPartII. No geometric existence theorem is inferred from an elementary fibration supplied as input.

## Conventions

Fix universes for simplicial sets, schemes, coefficient modules and small cofiltered indexing categories. Index enlargement comes with a cofinal comparison, and small geometric-point representatives come with comparison under replacement. A family of rigid neighborhoods may be infinite. Pointed pro-objects carry compatible actual vertices. Connected means isomorphic to a diagram of connected spaces; path-connected means that the derived materialization has one path component. The empty pro-space is unpointed and is not connected.

Write Pro(C) for the ordinary size-controlled pro-category on the supplied Ind-opposite carrier. Its morphisms have the formula limⱼ colimᵢ Hom(Xᵢ,Yⱼ). Raw homotopy means Isaksen’s localization at homotopy pro-local-system equivalences; the strict model instead inverts essentially levelwise weak equivalences. Homotopy-coherent Pro of p-finite homotopy types retains mapping spaces, and is not replaced by Pro of their homotopy category. Homotopy groups are pro-sets in degree zero, pro-groups in degree one and pro-abelian groups in degrees at least two. Materialization is right-derived limit and has ordinary, underlying abstract homotopy groups.

Relative morphisms are in the slice of the homotopy category over B, with triangles commuting as morphism classes. A specified homotopy is not part of such a morphism. Multiplication of loops and target transport are normalized so that transport by α sends φ to the homomorphism γ ↦ α φ(γ) α⁻¹. With permutations composed right to left, conjugating (12) first by (123) and then by (12) gives (13); the combined conjugator is (12)(123). Conjugation by (123) alone sends (12) to (23), whereas its inverse sends (12) to (13). This fixes the direction of transport and composition.

For schemes use the small étale topology and native abelian sheaf cohomology, with sheafification and Ext existence installed in the stated universes. Raw locally constant abelian coefficients include arbitrary constant abelian groups. Finite-coefficient comparison has finite abelian coefficients. A variety means a separated finite-type scheme over the indicated field; reducedness is not needed for the raw construction, and nilpotent thickenings use étale topological invariance. A geometric closure in positive characteristic is a separable closure or an algebraic closure with the purely inseparable comparison retained. No prime is excluded from raw characteristic-zero fiber or product statements.

For the complex comparison, schemes are degreewise quasi-projective over ℂ. Analytic points have their ordinary Euclidean topology; n-simplices use the real standard n-simplex with Mathlib’s explicit universe lift. On Δ¹ the ordered vertices are 0 and 1, and restriction of a singular path evaluates its corresponding endpoints. Discrete points of a simplicial scheme have degree n equal to Xₙ(ℂ). A grading is specified open-and-closed simplicial subschemes preserved by every operator, together with grade maps on morphisms. Fix a prime p, including p=2 and p=3; p=1 and p=0 are excluded. Continuous mod-p cohomology of a pro-object is a filtered colimit; ordinary cohomology of its materialization is a separate object. Cohomology of ordinary coproducts uses products; homology uses direct sums.

## Exact supplier contracts

### From Mathlib

- `SSet` is the presheaf category on the simplex category (`Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean`, line 33). `SSet.KanComplex` and `SSet.KanComplex.hornFilling` (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`, lines 41 and 46) supply the fibrancy predicate and horn extension; no pro-space model instance is part of that predicate. `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`, line 43) supplies abstract CM1–CM5, including finite limits/colimits, lifting and factorizations, without a chosen functorial factorization.
- `TopCat.toSSet`, `TopCat.toSSetObjEquiv`, `SSet.toTop`, `sSetTopAdj` and `TopCat.toSSetIsoConst` (`Mathlib/AlgebraicTopology/SingularSet.lean`, lines 50, 57, 66, 73 and 99) supply singular simplices, realization and the adjunction. The constant comparison assumes `TotallyDisconnectedSpace`; it assumes neither nonemptiness nor compactness. `CategoryTheory.Functor.diag` and `CategoryTheory.Functor.uncurry` supply the ordinary diagonal of the singular bisimplicial diagram.
- `AlgebraicGeometry.Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean`, line 50) supplies the site, and `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`, line 56) is Ext from the constant integral sheaf. It requires `HasSheafify` and `HasExt`; these are retained, rather than inferred from the notation H.
- `ContinuousMap.evalAlgHom` and `ContinuousMap.compRightAlgHom` in `Mathlib/Topology/ContinuousMap/Algebra.lean` supply point evaluation and precomposition with their topological algebra hypotheses. `CategoryTheory.Ind` in `Mathlib/CategoryTheory/Limits/Indization/Category.lean` supplies the native carrier underlying ordinary Pro.

The derived-limit acceptance theorem uses `CategoryTheory.Functor.rightDerived` (`Mathlib/CategoryTheory/Abelian/RightDerived.lean`, line 108), `CategoryTheory.HasInjectiveResolutions` and `CategoryTheory.Limits.lim` (`Mathlib/CategoryTheory/Limits/HasLimits.lean`, line 555). The limit functor’s additive structure is supplied locally by `CategoryTheory.Functor.additive_of_preserves_binary_products` (`Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean`, line 231). The injective-resolution structure is an explicit hypothesis in the signature; the statement is on the actual inverse-system functor and has no bounded or countable-index restriction.

### From Tau Ceti

- `TauCeti.LocalCoefficientSystem` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`, line 43) is a functor from the fundamental groupoid to `ModuleCat`; `TauCeti.LocalCoefficientSystem.pullback`, `TauCeti.LocalCoefficientSystem.pullbackIdIso`, `TauCeti.LocalCoefficientSystem.pullbackCompIso` and `TauCeti.LocalCoefficientSystem.transport` (lines 75, 102, 136 and 252) supply ordinary coefficient transport. This carrier has no finite-rank or finite-monodromy condition. The pro-local-system construction is its filtered level version, using the ordinary topology comparison on simplicial realizations.
- `TauCeti.exists_forall_map_eq_of_compact_t2` and `TauCeti.exists_forall_map_eq_of_finite` (`TauCeti/Topology/Compactness/InverseSystem.lean`, lines 78 and 96) supply compatible families for nonempty compact Hausdorff systems with continuous transitions, and nonempty finite systems over a directed preorder. Surjectivity of transition maps is not required. Reindexing supplies the required directed presentation.
- `TauCeti.IsTopologicallyFinitelyGenerated` (`TauCeti/Topology/Algebra/Group/Generation.lean`, line 73) means that a finite subset generates a dense subgroup. `TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod` (`TauCeti/Topology/Algebra/Group/Profinite/ProP/StructureTheorem.lean`, line 59) supplies the decomposition into finitely many ℤₚ factors and finite cyclic p-power factors. Its assumptions are a prime p, a compact totally disconnected topological commutative group, the pro-p predicate and topological finite generation. Use it on higher homotopy groups after identifying their profinite topology.

### From TauCetiRoadmap.AdicSpacesPartII

Section R0.19.9 supplies the Ind-opposite Pro carrier, the double-limit Hom formula with stage representatives and naturality, finite limits and flattening as cofiltered limit cones. DiamondsAndVStacks §D0.13 and PerfectoidSpaces §P6.10 supply bounded presentations and cardinal comparisons.

What AdicSpacesPartII must provide (gap:pro-simplicial-reindexing): Extend §R0.19.9 to the declared universes of simplicial sets with cofinite directed reindexing, level representations of finite diagrams and monomorphisms, cofinal-refinement invariance and comparison of the small geometric-point indexing choices.

### From TauCetiRoadmap.AlgebraicTopology

Stages 6 and 8 supply ordinary local cohomology, Kan/cubical homotopy comparison, Whitehead and obstruction theory at their stated scopes; Completed/UniversalCovers Stages 2–4 supply ordinary covering classification and induced homotopy maps. The coefficient carrier and its pullback laws are the native Tau Ceti objects above.

What AlgebraicTopology must provide (gap:ordinary-simplicial-homotopy): Extend Stage 8 by the proper simplicial Kan–Quillen model on native simplicial sets, functorial finite and first Postnikov truncations, local-coefficient Whitehead and Moore–Postnikov obstruction theory, and simplicial covering classification compared with the supplied topological covers.

What AlgebraicTopology must provide (gap:unstable-limits-and-coefficients): Extend Stages 6 and 8 by arbitrary abelian local-coefficient cohomology and its derived mapping interpretation, unstable Reedy homotopy limits over small cofiltered indices, nonabelian lim¹ and higher abelian derived limits, and the connectivity and complete-convergence statements BK XI 5.2, XI 7.1, IX 5.1 and IX 5.4 require.

### From TauCetiRoadmap.StableHomotopyKTheory

Sections 1.19–1.23 and 1.28–1.34 supply simplicial covering/realization compatibility, translation categories, discrete BG and EG, the chosen π₁ identification and groupoid nerves. The group nerve convention identifies edge(g) with g and edge(gh) with edge(h) followed by edge(g); transport uses the corresponding α φ α⁻¹ convention. On S₃ this sends (12) by (123) to (23), as fixed above.

What StableHomotopyKTheory must provide (gap:surjective-nerve-fibration): Supply the native Kan-fibration criterion for the nerve of a surjective group homomorphism, compatible with the translation-category quotient models of §§1.28–1.34 and their right actions.

### From TauCetiRoadmap.Orbifolds

Section O4-N, under O4 item 3, supplies realization descent for the Čech nerve of a numerable surjective submersion using actual local sections and a subordinate partition of unity. The smooth quasi-projective complex application in §5.3 verifies those hypotheses on its analytic carrier. The distinct general hypercover and multisimplicial extension is the EnhancedDerivedSheaves contract below.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections E0.2–E0.5 and E0.8 supply mapping spaces, coherent localizations, functor categories, spaces, smallness and filtered diagrams. Section E2.6 supplies generic hypercovers with degree-zero matching and uniformly bounded-below cohomological descent, including refinement. Its sheaf-descent conclusion is used only for cohomology.

What EnhancedDerivedSheaves must provide (gap:coherent-pro-spaces): Supply the homotopy-coherent Pro category of an essentially small infinity-category, its mapping-space limit/colimit formula, universe comparisons and coherent diagram rectification on simplicial-set models.

What EnhancedDerivedSheaves must provide (gap:topological-hypercover-realization): Extend §E2.6 by the weak-homotopy-equivalence realization theorem for topological hypercovers whose matching maps admit local sections, with analytic étale refinement and levelwise-to-diagonal comparison for multisimplicial singular sets.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.9–0.12 supply approximation, geometric unibranchness and étale neighborhoods; §§2.10 and 2.15 supply site comparisons and étale cohomology. Section 2.15 supplies continuity of abelian sheaf cohomology for qcqs inverse systems with affine transitions and compatible coefficient sheaves. Its geometric field-extension application uses constant coefficients and does not assume descent of arbitrary infinite-group torsors.

What SchemeAndStackFoundations must provide (gap:rigid-components-and-curve-families): Supply open connected components of locally noetherian étale neighborhoods with size-controlled geometric points and separated matching fiber products, and the elementary-fibration input consisting of a smooth proper geometrically connected relative curve with finite étale boundary and nonempty affine complement fibers.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Section F.0.2 supplies finite étale Galois categories, the geometric fiber functor, its profinite automorphism group, étale paths and finite continuous-set/monodromy equivalences. Section F.0.A2 supplies the exact geometric/arithmetic fundamental-group sequence for quasi-compact geometrically connected schemes over a field, using an algebraic closure and retaining path choices for sections. Section F.0.4 supplies topological invariance under purely inseparable and nilpotent changes. Section F.2.6 supplies finite-coefficient geometric Künneth, with its Tor and invertibility hypotheses. In characteristic zero every finite coefficient order is invertible. The comparison of the raw pro-group with the finite-étale group is §3.5, and completion for a pro-group is §3.0a.

### From TauCetiRoadmap.ComplexComparisonPartII

Section C−1.1 supplies the single analytic-space carrier, scheme analytification, complex-point topology, finite fiber products, nilpotent compatibility and étale local analytic isomorphisms. Sections C5.1 and C6.1 supply analytic sheaf/singular comparison with their local-contractibility hypotheses; §§C6.2–C6.3 supply finite-cover Riemann existence and finite-coefficient Artin comparison. On Spec ℂ the constant-coefficient degree-zero comparison is the identity. On Gₘ, the positive loop and ζₙ=exp(2πi/n) identify the coordinate’s Kummer class with 1; no inverse normalization is introduced here.

What ComplexComparisonPartII must provide (gap:analytic-smooth-local-sections): Supply the compatibility of §C−1.1’s analytification with smooth maps between smooth quasi-projective schemes as surjective submersions when surjective, together with local analytic sections for those maps on the same carrier.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

Sections 5.1–5.2 and 6.1–6.2 supply characteristic-zero embedded resolution, principalization and projective SNC compactification for finite-type schemes over a field, preserving the smooth locus and producing normal-crossing boundary after the specified blowups. Applied to the reduction and a projective compactification, these give the strong desingularizability hypothesis used in SGA1 XIII Proposition 4.6. The finite-cover product theorem of §3.9 retains this proof input and applies in characteristic zero, where prime-to-characteristic means all primes.

### From TauCetiRoadmap.ProfiniteProPGroups

Layers 0, 3 and 4 supply finite-quotient presentations, pro-p groups and their topological group interface. Use the native compatible-family, finite-generation and abelian structure declarations named above. Transport of the finite-generation predicate to homotopy pro-groups is part of §6.5; no generic group structure theorem is reconstructed.

## How to read the build

Layer 0 fixes the raw homotopy model and its detection theorems; Layer 1 adds coverings, subgroup representability and classifying spaces. Layer 2 derives materialization, establishes profinite homotopy-limit comparison and computes the absolute and relative monodromy quotients. Layer 3 specializes these constructions to rigid étale types, cohomology, finite-cover base change and elementary fibrations. Layer 4 turns the relative theorem into arithmetic orbit and product statements. Layer 5 supplies the algebraic evaluation and diagonal Betti realization used in Layer 6, where completion, model comparison, finite-type materialization, specified gradings and coherent and strict automorphism naturality are constructed. Each Needs line separates statement prerequisites from the inputs used by the indicated proof route.

## Layer 0: Homotopy theory of pro-spaces

### 0.1 Homotopy pro-local systems

Specialize the supplied size-controlled Pro category to simplicial sets, with pointed objects represented by compatible actual vertices. A local system on X=(X_i) is a local system on one level, modulo pullback to a later level; its morphisms use the corresponding filtered colimit. The homotopy pro-local system Π_nX consists of the ordinary fundamental-groupoid homotopy local systems on the levels. For a pointed representative put π_n(X,x)=(π_n(X_i,x_i)); π_0 is pro-set-valued, π_1 pro-group-valued, and π_n is pro-abelian for n≥2. Connected means isomorphic to a levelwise connected diagram. This does not mean that its homotopy limit is path-connected. (I01, §§4–6, pp. 6–10; Corollary 7.5, pp. 12–13; I01 line 260).

One proof route is the following. Use the imported Pro carrier and finite-diagram reindexing; retain the universe of the indexing category. Pull local systems back along transition maps and pass to the filtered colimit category. Ordinary homotopy groups and their path transport come from AlgebraicTopology. Define the homotopy pro-local systems with their transition morphisms, and compare evaluation at a compatible vertex with the levelwise π_n system.

- Pointed maps induce pro-homomorphisms, preserving identity and composition.
- Pullback is compatible with reindexing and composition, up to the specified natural isomorphisms.
- For connected pointed X, evaluation of Π_nX at its point is π_n(X,x).
- For a constant pointed simplicial set, the pro-homotopy groups are the constant ordinary homotopy groups.

**Checks.**

- For the constant singular circle, π_1 is constant Z and every π_n for n≥2 is zero.
- The constant two-point set has π_0 with two elements; a single basepoint cannot detect deletion of the other component.
- On the constant circle, the integral sign local system has monodromy -1, unlike the constant integral system; both must occur in the local-system category.

*Needs:* AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; Mathlib `CategoryTheory.Ind`; Mathlib `SSet`; AlgebraicTopology Stage 8 and its ordinary simplicial contract; AlgebraicTopology Stage 6 and its local-coefficient contract.

### 0.2 Isaksen homotopy model structure

On Pro(SSet), take weak equivalences to be maps inducing an isomorphism of π_0 and of every homotopy pro-local system Π_nX→f*Π_nY, n≥1. Cofibrations are essentially levelwise monomorphisms, and fibrations have the right lifting property against trivial cofibrations. These classes form Isaksen’s simplicial model structure and induce its pointed model and homotopy categories. Every object is cofibrant. Its strict predecessor instead inverts essentially levelwise ordinary weak equivalences. Factorizations here are not asserted functorial. (I01, Definitions 6.1–6.3, Theorem 6.4, pp. 9–10; §§12–16, pp. 20–32; I01 line 398).

One proof route is the following. Import the proper simplicial Kan–Quillen model from the supplied topology owner, including the ordinary obstruction theory requested there. Use cofinite reindexing and finite predecessor matching objects. The increasing connectivity bound gives Isaksen’s strong fibrations (Definition 6.5). Apply the two factorizations and lifting theorem, I01 Propositions 15.1, 15.2, 15.4; then the pushout-product argument of §16. Properness is isolated in the next target because its original proof needs the published correction.

- Weak equivalence is equivalent to the stated π_0 and Π_n conditions.
- Every pro-simplicial set, and every pointed one, is cofibrant.
- Identity induces the localization functor from strict homotopy to Isaksen homotopy.
- For fibrant Y, Hom in the homotopy category is strict maps X→Y modulo simplicial homotopy.

**Checks.**

- On constant pointed connected Kan complexes, weak equivalence is the ordinary π_n equivalence in every degree.
- For K=∏ₙ≥₁K(Z,n), the map cK→(P_m K)_m is an Isaksen equivalence but not a strict equivalence: every finite truncation misses nonzero higher homotopy groups. This avoids relying on a finiteness claim about a particular sphere.
- The map from the singular S² to a point is not an Isaksen equivalence even though it preserves π_0 and π_1.

*Needs:* §0.1; Mathlib `HomotopicalAlgebra.ModelCategory`; AlgebraicTopology Stage 8 and its ordinary simplicial contract; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 0.3 Properness and strong fibrations

Isaksen’s model structure is left and right proper. A strong fibration is a fibration, and arbitrary fibrations are retracts of suitable strong-fibration presentations. Consequently pullback along a fibration preserves weak equivalences, also for maps over a fixed pro-space. (I01, Definition 6.5, p. 10; Proposition 17.1, pp. 32–33; SS, Appendix A opening and Lemma A.5, pp. 853–855; IStr, proof of Theorem 4.15 and Remark 4.16, pp. 11–12; IStr line 507).

One proof route is the following. Left properness follows from cofibrancy of every object. For right properness, reduce a fibration to a retract of a strong fibration and use the levelwise connectivity criterion. Use the level-presentation repair of IStr, proof of Theorem 4.15 and Remark 4.16, pp. 11–12 (IStr line 507): insert an intervening pro-isomorphism before applying levelwise right properness; a simultaneous favorable level presentation is not assumed. Apply the right-proper pullback square; do not substitute the strict model’s weak equivalences.

*Needs:* §0.2; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### 0.4 Connected pointed homotopy detection

For connected pointed pro-spaces, a pointed map is an Isaksen weak equivalence exactly when it induces an isomorphism of pro-groups π_n for every n≥1. A pointed morphism whose underlying morphism is an isomorphism in the unpointed homotopy category is an isomorphism in the pointed homotopy category. (I01, Corollary 7.5, pp. 12–13; pointed model-category consequence; I01 line 578).

One proof route is the following. Represent the map after cofinite reindexing; use path transport on connected levels to recover all stalks of Π_n from the selected one. Apply the weak-equivalence criterion, and use the forgetful pointed model functor reflecting weak equivalences for the isomorphism assertion.

*Needs:* §0.2.

### 0.5 Local-coefficient detection

A map f:X→Y of pro-spaces is an Isaksen weak equivalence if and only if π_0(f) is a pro-set isomorphism, Π_1X→f*Π_1Y is an isomorphism of pro-local systems, and H^m(Y,L)→H^m(X,f*L) is an isomorphism for every m≥0 and every abelian local system L on Y. Here cohomology for a system represented on Y_i is the filtered colimit over later levels of ordinary cohomology with pulled-back coefficients; finite constant coefficients alone do not state this criterion. (I01, §18, Proposition 18.4, pp. 34–36; I01 line 1658).

One proof route is the following. A weak equivalence admits a level presentation with connectivity increasing arbitrarily far, so ordinary local-coefficient comparison gives every fixed cohomological degree in the filtered colimit. Conversely replace by a cofibration and test maps into strongly fibrant objects. A finite Moore–Postnikov lifting tower has obstruction classes in local cohomology; kill each using the assumed isomorphisms. Pass to the inverse limit of the matching fibrations and use the model’s fibrant retract theorem. The ordinary local-coefficient Whitehead and Moore–Postnikov inputs are explicitly specified in the AlgebraicTopology contract, not asserted by its existing Kan predicate.

*Needs:* §0.1; §0.2; AlgebraicTopology Stage 6 and its local-coefficient contract; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### Examples

The constant singular circle has π₁=cℤ and πₙ=0 for n≥2. The two-point discrete space has two components, so deletion of its second point is not a weak equivalence. The integral sign system on the circle has monodromy −1 and cohomology H⁰=0, H¹=ℤ/2; the constant system has H⁰=ℤ, H¹=ℤ.

### Dependencies

AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; Mathlib `CategoryTheory.Ind`; Mathlib `SSet`; AlgebraicTopology Stage 8 and its ordinary simplicial contract; AlgebraicTopology Stage 6 and its local-coefficient contract; Mathlib `HomotopicalAlgebra.ModelCategory`. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 1: Coverings and classifying pro-spaces

### 1.1 Coverings of pro-spaces

A simplicial covering p:E→X has the unique lifting property for every vertex inclusion Δ[0]→Δ[n], including every choice of vertex. A §1.1 is a pro-morphism isomorphic to a levelwise simplicial covering; connected Galois coverings have a levelwise presentation with E_i/Aut_Xi(E_i)≅X_i. Universal pointed coverings are formed from the levelwise universal simplicial coverings. The deck group is a pro-group, not an unqualified single discrete group. (SS, Appendix A.1, Definition A.1 and preceding paragraphs, p. 853; SS line 1430).

One proof route is the following. Import ordinary simplicial covering theory, compared by realization with the supplied topological universal-cover API; this extension is specified in the AlgebraicTopology contract. Use the supplied reindexing to make a finite covering diagram levelwise. Define the pro-cover property invariantly under pro-isomorphism. Apply the ordinary pointed universal-cover functor levelwise and retain its transition maps and deck actions.

- Pullback of a §1.1 is a §1.1; finite degree is preserved under base change.
- On connected pointed levels the universal covering kills π_1 and preserves π_n for n≥2.
- The deck pro-group of the pointed universal covering is π_1(X,x).
- For a constant simplicial covering its realization agrees with the ordinary covering-space interface.

**Checks.**

- The identity covering has one point over each vertex and trivial deck group. A quotient with an extra sheet would give fiber cardinality at least two.
- The connected degree-two cover of the singular circle corresponds to 2Z⊂Z and has deck group Z/2.
- The Kan fibration Sing(S¹)→* is not a covering: the fiber contains nonconstant singular simplices, violating uniqueness over a vertex.

*Needs:* §0.1; AlgebraicTopology Stage 8 and its ordinary simplicial contract; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34.

### 1.2 Covering associated to a sub-pro-group

For connected pointed X and a monomorphism U↪π_1(X,x) of pro-groups, construct h:X_U→X in the connected pointed homotopy category. For every connected pointed W, composition with h bijects Hom(W,X_U) with the pointed homotopy classes f:W→X for which π_1(f) factors through U. This universal property specifies X_U over X up to unique isomorphism there. No finite-index hypothesis is imposed on U. (SS, Proposition A.2, p. 854; SS line 1475).

One proof route is the following. Represent the subgroup monomorphism levelwise after reindexing, using images if necessary; build the ordinary subgroup covers at each level. Use ordinary lifting uniqueness to define their transition maps, and cofinite reindexing to compare choices. Apply the levelwise lifting criterion and pass to homotopy classes into a fibrant target; the resulting representability gives the independence statement.

- A pointed homotopy class lifts exactly when its pro-π_1 factors through U.
- An inclusion U↪V over π_1 gives X_U→X_V over X, compatible with composition.
- The full subgroup gives the identity cover.
- The trivial sub-pro-group gives the universal pointed cover.

**Checks.**

- For constant Sing(S¹) and U=2Z the representing cover is the ordinary degree-two cover.
- For U=π_1(X), h is an isomorphism over X. Replacing it by the universal cover of the circle would give π₁=0 instead of ℤ.
- For U=0⊂Z the cover of Sing(S¹) is universal and has infinite fiber; restricting the construction to finite covers would fail this test.

*Needs:* §1.1; §0.2; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 1.3 Coverings under homotopy equivalence

Pullback along an Isaksen weak equivalence between connected pro-spaces induces an equivalence on their categories of connected coverings. (SS, Lemma A.3, p. 854; SS line 1484).

One proof route is the following. Transport sub-pro-groups along the pro-π_1 isomorphism and use the covering universal property to get the category equivalence.

*Needs:* §1.2; §0.3.

### 1.4 Coverings are pro-fibrations

Every §1.1 is a fibration in Isaksen’s model structure. (SS, Lemma A.4, p. 854; SS line 1493).

One proof route is the following. For fibrancy use a cofinite level presentation; the relative matching maps are coverings, hence co-1-fibrations. Apply the strong-fibration criterion, and pass to isomorphic presentations.

*Needs:* §1.1; §0.2; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 1.5 Base change of homotopy isomorphisms

For maps f:X→W and g:Y→W and an isomorphism γ:X≅Y in Ho(Pro(SSet)) with gγ=f, every §1.1 W′→W admits an isomorphism γ′:X×_W W′≅Y×_W W′ in the homotopy category, compatible with γ and the maps to W′. Choices can be made compatibly with morphisms of the covering. If W′/W is connected Galois, the induced cohomology isomorphisms with any constant abelian group A are equivariant for its deck pro-group action. Existence, rather than uniqueness of γ′, is asserted. (SS, Proposition A.6, pp. 855–856; SS line 1512).

One proof route is the following. Replace W by a fibrant object and transport the connected covering category along the equivalence; handle components separately. Represent γ and the structural homotopy by actual maps into fibrant replacements. Lift that homotopy along the covering to make the maps compatible. Right properness identifies the strict pullbacks with the required derived pullbacks. Deck transformations commute with these lifted maps, giving equivariance after cohomology.

*Needs:* §1.3; §0.3; AlgebraicTopology Stage 6 and its local-coefficient contract; §1.4.

### 1.6 Classifying pro-space and fibrant replacement

For a pro-group G=(G_i) use the supplied discrete nerves BG_i and EG_i levelwise. On a cofinite directed presentation define G_i* = ∏ⱼ≤ᵢG_j, embed G_i by all transition maps (including the identity factor), and set B*G_i=E(G_i*)/G_i for the resulting right action. Then BG→B*G is a levelwise ordinary weak equivalence and B*G is fibrant in the Isaksen pointed model. BG is not declared fibrant merely because each level is Kan. (SS, Lemma A.14, pp. 862–864; SS line 1810).

One proof route is the following. Import the discrete free, contractible EG and its quotient; build G* from finite predecessor products. The diagonal inclusion of G_i into G_i* is injective, and the product projection to predecessor factors is surjective. The associated nerve map is a Kan fibration; this discrete lemma is the StableHomotopyKTheory nerve contract. Check the relative matching maps for B*G are co-1-fibrations. Both quotient models have π_1=G_i and no higher groups, so the comparison is a level weak equivalence.

- π_1(BG)=G and π_n(BG)=0 for n≥2, using the supplied discrete computations.
- Homomorphisms of pro-groups induce pointed maps, compatible with composition.
- BG→B*G is a weak equivalence with fibrant codomain; reindexing choices give the same derived object.
- Each pro-level EG→BG has its given deck action and quotient isomorphism.

**Checks.**

- B1 is contractible and its π_1 is trivial. An empty nerve would instead have no component.
- For constant C_p, BC_p has π_1=C_p and all π_n for n≥2 zero; it need not have finitely many nondegenerate simplices.
- For G=(Z/p^r), π_1(BG) is this inverse system; it is not the constant discrete additive group Z_p.

*Needs:* §0.2; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34.

### 1.7 Full faithfulness of pro-classifying spaces

For pro-groups G,H the nerve map identifies Hom_Pro(Grp)(G,H) with strict pointed pro-simplicial maps BG→BH and with pointed Isaksen homotopy classes BG→BH. (SS, Lemma A.15, pp. 863–864; SS line 1866).

One proof route is the following. Strict nerve maps are determined by their one-simplex map, and the two-simplex identities impose the homomorphism law. Replace BH with B*H; the auxiliary map to BH* is injective on strict pointed maps because the intervening map is a pointed covering. The same π_1 computation proves injectivity after localization.

*Needs:* §1.6.

### 1.8 Maps into classifying pro-spaces

For connected pointed X and any pro-group G, π_1 induces a natural bijection Hom_Ho(Pro(SSet)_*)(X,BG)≅Hom_Pro(Grp)(π_1(X),G). (SS, Proposition A.16 and proof, pp. 864–866; SS line 1912).

One proof route is the following. Use the ordinary first Postnikov truncation X_i→BΠ_1X_i. Inclusion of the chosen object gives BG_i→BΠ_1X_i and is a level weak equivalence when the levels are connected. Represent maps into fibrant B*G. Ordinary maps from a groupoid nerve to a group nerve and pointed homotopies correspond to homomorphisms; pointing removes conjugation. Use the lim-colim Hom formula and reindexing for the pro statement. The first Postnikov construction is part of the ordinary topology supplier contract.

*Needs:* §1.6; §0.4; AlgebraicTopology Stage 8 and its ordinary simplicial contract; §1.7.

### 1.9 The first classifying morphism

For connected pointed X define c_X:X→Bπ_1(X) in the pointed homotopy category as the unique class corresponding to id under pro-BG representability. Call X a raw K(π,1) when π_n(X)=0 for all n≥2. Then c_X is an isomorphism if and only if X is a raw K(π,1). This is a property of the full pro-homotopy type, distinct from a finite- or p-coefficient convention on schemes. (SS, Definition A.17 and Corollary A.18, p. 866; SS line 1953).

One proof route is the following. Use representability with G=π_1(X) to obtain the actual morphism class. Naturality follows from the uniqueness part of the bijection. Its π_1 map is the identity; the target’s higher groups vanish. Apply connected detection. The comparison with a finite-coefficient scheme predicate uses the geometric hypotheses and effacement criterion of §3.9.

- π_1(c_X)=id under the canonical BG identification.
- For pointed f:X→Y, c_Y∘f=Bπ_1(f)∘c_X.
- c_X is invertible exactly when every π_n(X), n≥2, vanishes.
- For BG the classifying map is the identity under π_1(BG)=G.

**Checks.**

- The one-point pro-space is a raw K(π,1). All positive homotopy groups vanish; a nonemptiness-free test that accepts the empty space would not define the connected pointed object.
- The constant singular circle is raw K(Z,1) and its c_X is an isomorphism.
- The constant singular S² is not raw K(π,1), since π_2=Z, despite π_1=0.

*Needs:* §1.8; §0.4.

### Examples

For c Sing(S¹), the subgroup 2ℤ produces the degree-two cover with deck group C₂; the zero subgroup produces the infinite universal cover. The pointed maps BC₂ → BS₃ correspond to the four homomorphisms C₂ → S₃, while forgetting points gives two conjugacy classes.

### Dependencies

Earlier layers 0; AlgebraicTopology Stage 8 and its ordinary simplicial contract; StableHomotopyKTheory §§1.19–1.23, 1.28–1.34; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; AlgebraicTopology Stage 6 and its local-coefficient contract. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 2: Materialization and relative monodromy

### 2.1 Homotopy limit and topological homotopy groups

Let Mat(X) denote the right-derived limit of a small pro-simplicial set, represented by the ordinary homotopy limit of a levelwise Kan diagram. For a pointed X define π_n^top(X,x)=π_n(Mat(X),x), with pointed sets in degree zero. For n≥0, the derived constant/limit adjunction identifies πₙᵗᵒᵖ(X,x) with Hom_Ho(Pro(SSet)_*)(cS^n,X). Call X path-connected when Mat(X) is path-connected. Its comparison to lim_i π_n(X_i,x_i) is canonical; invertibility requires the separate profiniteness theorem. (I01, Proposition 8.2, Corollary 8.3 and Proposition 8.4, pp. 14–15; I01 line 637; SS, Appendix A.2.2, p. 857).

One proof route is the following. Constant objects preserve cofibrations and trivial cofibrations, so constant and limit form a Quillen adjunction. Use I01 Proposition 8.4’s levelwise Kan and Postnikov-tower argument to identify the derived limit with the ordinary homotopy limit. The unstable homotopy-limit supplier contract uses a Reedy fibrant cosimplicial replacement C, with C^q the product of X_i0 over chains i_q→…→i_0, and actual Tot_m=Map(sk_m Δ^•,C^•), including all compatibility equations. A single C^m is not Tot_m.

- Derived maps cK→X are naturally maps K→Mat(X).
- Cofinal reindexing and Isaksen weak equivalence preserve Mat up to ordinary weak equivalence.
- Projections induce natural π_n^top(X)→lim π_n(X_i), with the prescribed low-degree algebra.
- Path-connectedness means π_0(Mat(X)) is a singleton, rather than only π_0(X)=*.

**Checks.**

- Mat(cK)≃K for a Kan complex K. In particular π₀ is unchanged; a constant-point materialization fails for a two-point K.
- For a system of finite sets considered as discrete spaces, Mat is the discrete set of compatible tuples and has no positive homotopy groups.
- For the discrete diagram *→{0,1} sending * to 0, a degree-zero choice (*,1) in the cosimplicial replacement has no extension to Tot_1. The compatibility equations exclude it; retaining only independent product coordinates would admit it.

*Needs:* §0.2; AlgebraicTopology Stage 8 and its ordinary simplicial contract; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 2.2 Vanishing of profinite derived limits

For an inverse system G of finite groups over a small cofiltered category, the nonabelian derived-limit pointed set lim¹G is trivial. For a system A of finite abelian groups, lim^s A=0 for every s≥1. The headline `finiteAbelianHigherLimits` states this on a native functor A : I ⥤ AddCommGrpCat over any small cofiltered category I, with a chosen native injective-resolution structure on that functor category, finite underlying groups at every object and an explicit positive degree; the conclusion is that the native right-derived limit object is zero. The assertion is invariant under pro-isomorphism, so it applies to profinite pro-groups represented by finite groups, without assuming countable indexing. (SS, Lemma A.7, pp. 856–857; SS line 1573).

One proof route is the following. Pass to a cofinite directed presentation. Embed G_i in G_i*=∏ⱼ≤ᵢG_j through all transition maps. Its matching projections are surjective and the product system is derived-limit acyclic. The finite quotients G_i*/G_i are sets with transitive G_i* action; compactness supplies compatible lifts, giving the nonabelian lim¹ assertion. In the abelian case use 0→A→A*→A*/A→0, acyclicity of A*, and dimension shifting. The higher derived-limit formalism is included in the topology supplier contract. Use the pinned compact compatible-family theorems for the finite fibers.

*Needs:* AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; ProfiniteProPGroups Layer 0; Tau Ceti compact inverse systems; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### 2.3 Homotopy groups of profinite pro-spaces

If pointed X has π_0(X)=* and every π_n(X), n≥1, is a profinite pro-group, then Mat(X) is path-connected and π_n^top(X)→lim π_n(X) is an isomorphism for all n≥1; the degree-zero comparison is a bijection of singleton pointed sets. No finiteness of the whole simplicial sets or uniform Postnikov bound is assumed. (SS, Theorem A.8 and proof, pp. 857–858; SS line 1611; BK XI 5.2, XI 7.1, IX 5.1, IX 5.4, cited by locator without text).

One proof route is the following. Replace the levelwise Kan diagram by a Reedy fibrant cosimplicial replacement and use the actual compatible partial totalizations. Its fringe spectral sequence has E₂ˢ,ᵗ = limˢ πₜ(X), abelian for t≥2 and with the nonabelian group and pointed-set fringe retained. Apply §2.2, then the supplied BK IX 5.1 connectivity and IX 5.4 complete-convergence statements, with XI 5.2 and XI 7.1 identifying the tower and its E₂ page. The comparison is the projection-induced edge map. The BK inputs are cited by locator without text; a collapsed E₂ page is not itself convergence.

*Needs:* §2.1; §2.2; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### 2.4 Endpoint-preserving pro-cylinders

For a pro-simplicial set X with two distinct specified vertices x_0,x_1, form Cyl₂(X) from X×Δ[1] by collapsing each {x_i}×Δ[1] to its own vertex. The endpoint map from the pushout of two copies of X along {x_0,x_1} to Cyl₂(X) is a cofibration and the projection to X is an Isaksen weak equivalence. These maps form a cylinder in the undercategory of the two-point set. The projection need not be a fibration. (SS, Appendix A.2.3, p. 858, corrected cylinder assertion; SS line 1648).

One proof route is the following. Construct the quotient levelwise and use ordinary relative simplicial cylinder theory, preserving its two endpoint inclusions. Each quotient projection contracts the interval relative to the two selected vertices in the ordinary homotopy sense, so the pro-projection is a weak equivalence. Use this cylinder only for cofibrant domains in the undercategory; the interval with its two distinct endpoints supplies the domain for paths.

- The combined endpoint inclusion is a cofibration in the two-point undercategory.
- The projection is a weak equivalence and composes with either endpoint to the identity.
- Maps from Δ[1] into a fibrant target modulo this cylinder give endpoint-preserving path classes.

**Checks.**

- For X={x_0,x_1}, Cyl₂(X) is X and the projection is the identity. Identifying the two marked points would give one vertex, violating the relative construction.
- For X={x_0,x_1,a}, Cyl₂(X) is two isolated vertices together with Δ[1] over a. This projection is not a Kan fibration: a Kan horn witnessing an inverse to the directed edge has no filler.
- For X=Δ[1] with its endpoints, a homotopy fixes both endpoints at every time, as required for ordinary relative path homotopy. Moving either endpoint is excluded by the two-point undercategory.

*Needs:* §0.2; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### 2.5 Monodromy on pointed mapping classes

For pointed pro-spaces X and two points y_0,y_1 of Y, a path class u:y_0→y_1 in Mat(Y) induces a bijection u_*:Hom_Ho(Pro(SSet)_*)(X,(Y,y_0))→Hom(X,(Y,y_1)). Identity paths act identically and composition of paths composes these bijections. At y_0=y_1 this is the π_1^top(Y,y_0) action. Use the convention for which the induced action on fundamental-group homomorphisms is φ↦αφα⁻¹. (SS, Lemma A.9 and Lemma A.12, pp. 858–860; SS line 1675).

One proof route is the following. Replace Y by a fibrant target. Extend the pair consisting of f:X→Y and the path u along X∨Δ[1]→X×Δ[1], a trivial cofibration. The terminal restriction gives a pointed map to (Y,y_1). Use relative homotopies to prove independence of extension, representative path and fibrant replacement. Concatenation and inversion prove the action laws. Compare the induced map of loops with conjugation using the same path-order convention.

- Transport along the constant path fixes every pointed class.
- Transport along a composite equals successive transport.
- For a loop α, the induced π_1 homomorphism is αφα⁻¹.
- Transport is natural under pointed source maps and target maps carrying the chosen path.

**Checks.**

- For X=BC₂,Y=BS₃, a transposition homomorphism is transported to each of its conjugates in S₃.
- For X=S¹,Y=BC₃, loop transport fixes each homomorphism Z→C₃.
- For a constant two-point target, distinct points have no connecting path; no transport bijection between those basepoints is postulated.

*Needs:* §2.1; §2.4; §0.2.

### 2.6 Pointed maps modulo monodromy

If Y is path-connected, forgetting points induces a bijection Hom_Ho(Pro(SSet)_*)(X,Y)/π_1^top(Y)≅Hom_Ho(Pro(SSet))(X,Y), for any pointed X. (SS, Theorem A.10, p. 859; SS line 1683).

One proof route is the following. Represent an unpointed map into a fibrant target; connect its image of the source point to the target point and transport. An unpointed homotopy has a basepoint track; its loop is precisely the orbit ambiguity, proving injectivity of the orbit map.

*Needs:* §2.5.

### 2.7 Pointed lifts of unpointed isomorphisms

If pointed X is unpointedly isomorphic to connected pointed Y and every π_n(Y), n≥1, is a profinite pro-group, every such unpointed isomorphism admits a pointed isomorphism lift. (SS, Corollary A.11, p. 859; SS line 1693).

One proof route is the following. Layer 2’s profinite homotopy-limit theorem gives paths between the necessary points. The absolute orbit theorem supplies a pointed lift, whose underlying unpointed isomorphism makes it a pointed isomorphism.

*Needs:* §2.6; §2.3; §0.4.

### 2.8 Pointed lifting over a base

Let pointed X,Y map to pointed B. If Y and B are path-connected and π_1^top(Y)→π_1^top(B) is surjective, forgetting points gives a surjection from Hom in Ho(Pro(SSet)_*)↓(B,b) to Hom in Ho(Pro(SSet))↓B. These are slices of homotopy categories: their structural triangles commute as morphism classes; no chosen null-homotopy is part of a morphism. (SS, Theorem A.13(a), pp. 860–862; SS line 1736).

One proof route is the following. Lift the underlying unpointed map to a pointed one using target path-connectedness. The two composites to B differ by a loop at b. Surjectivity on topological π_1 lifts that loop to Y. Transport by its inverse to obtain a pointed map in the relative Hom set.

*Needs:* §2.6; §2.5.

### 2.9 Relative isomorphisms lift

Under the hypotheses of §2.8, any isomorphism in Ho(Pro(SSet))↓B has a preimage that is an isomorphism in Ho(Pro(SSet)_*)↓(B,b). (SS, Theorem A.13(a), last assertion, pp. 860–862; SS line 1783).

One proof route is the following. Use §2.8 to lift the given map. Its underlying unpointed map is an isomorphism, so it is an isomorphism in the pointed homotopy category. The inverse also commutes with the structure map because the original triangle does.

*Needs:* §2.8; §0.4.

### 2.10 Stabilizer quotient for relative maps

With the same hypotheses, let S_X⊂π_1^top(B,b) be the stabilizer of the pointed structure class p_X under monodromy, and Δ_XY its preimage under π_1^top(Y,y)→π_1^top(B,b). Monodromy restricts to the pointed relative Hom set, and its Δ_XY-orbits biject with Hom_Ho(Pro(SSet))↓B(X,Y). The whole π_1(Y) need not preserve the relative subset. (SS, Theorem A.13(b), pp. 861–862; SS line 1743).

One proof route is the following. Naturality of path transport identifies the loops preserving the structural triangle with Δ_XY. Use the absolute orbit theorem to characterize pairs with the same unpointed class; the relative constraint forces the loop into Δ_XY. Use the relative surjection for existence, giving the claimed bijection.

*Needs:* §2.8; §2.5.

### Examples

For the finite cyclic system C_(pʳ), materialization of its classifying pro-space is path-connected with π₁=ℤₚ and πₙ=0 for n≥2, for p=2 as well as p=3. In contrast the tower ℤ with transition multiplication by 2 has lim=0 and lim¹=ℤ₂/ℤ; its classifying homotopy limit is disconnected, showing why profiniteness matters. For the identity map the comparison on each group is the identity.

### Dependencies

Earlier layers 0, 1; AlgebraicTopology Stage 8 and its ordinary simplicial contract; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; ProfiniteProPGroups Layer 0; Tau Ceti compact inverse systems. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 3: Rigid étale types and finite-cover comparison

### 3.0a Profinite completion of a pro-group

For a small pro-group G, define its profinite completion by its finite quotient maps, using a small skeleton of finite groups. The completion is a pro-system of finite groups and hence a compact totally disconnected topological group. Its unit G → Ĝ induces, for every profinite group H, a natural bijection Hom_cont(Ĝ,H) ≃ Hom_Pro(Grp)(G,H), where H on the right is represented by its finite quotients. All transition and comparison maps retain their topology and source and target. This construction does not replace G by the constant discrete group of its inverse limit (SS, discussion before Corollary 2.5, p. 826; SS line 369).

- The unit induces the same finite quotients and is functorial under pro-group homomorphisms.
- Precomposition by the unit is the stated bijection for every profinite target, with its continuous maps.
- For a finite-group system the unit is an isomorphism of pro-groups, and its inverse-limit topology is the supplied profinite topology.

**Checks.**

- For the trivial pro-group, the completion has one element and exactly one map to every group; an empty limit would be wrong.
- For constant ℤ, completion is ℤ̂, and maps to C₂ are exactly the two choices for the image of 1; the discrete constant ℤ̂ is not the resulting pro-object.
- For the system C_(pʳ), the finite quotients remain C_(pʳ), including p=2 and p=3; its completion is the same pro-system, rather than a constant group.
- For constant S₃, completion is S₃ and its three order-two subgroups remain distinct; abelianization C₂ is not a completion.

*Needs:* AdicSpacesPartII §R0.19.9 and its size/reindexing contract; ProfiniteProPGroups Layer 0; ordinary finite-group and profinite-limit constructions.

### 3.1 Rigid étale covers

For a locally noetherian scheme X in a fixed universe, a rigid cover is a disjoint union U=∐_x U_x indexed by its geometric points in the chosen small presentation, each U_x connected, étale and separated over X, with a specified lift u_x of x. Morphisms preserve these lifts. The geometric-point presentation and its universe enlargement comparisons are retained. A rigid pullback along f:X→Y uses the component of X×_Y U_f(x) containing the specified lifted point, separately for every x; this may repeat a component of the ordinary pullback. (IEt, Definitions 5.1, 5.3 and Proposition 5.5, pp. 13–14; IEt line 572).

One proof route is the following. Use the small étale site and a size-controlled geometric-point indexing family; existence of connected components as open subschemes follows from local noetherianity. Take connected pointed components of the ordinary fiber products. A point-preserving map between connected étale separated neighborhoods is unique. Prove the rigid pullback universal property. Size and choice compatibility are part of the Pro supplier contract, rather than a claim that a class of all geometric points is a small set.

- There is at most one rigid cover map over a fixed base map.
- Rigid maps V→f*U over Z→X correspond to rigid maps V→U over Z→Y.
- Iterated rigid pullback agrees, by its canonical isomorphism, with pullback along the composite.
- Each chosen connected piece is separated étale; the disjoint union is a covering family, with no finite-component requirement.

**Checks.**

- Over an algebraically closed field, a connected étale neighborhood of the canonical point is Spec of that field and its chosen lift is unique.
- For A¹_C→Spec C and the canonical point cover of Spec C, ordinary pullback has one connected component A¹_C. Rigid pullback has a separate copy for each geometric point of A¹_C, including distinct copies chosen at 0 and 1. Replacing it by the ordinary pullback loses the rigid data.
- On A¹_C the indexing includes its infinitely many complex closed points; a definition demanding a finite index family would reject the required rigid covers.

*Needs:* Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; EtaleCohomologyFoundations §F.0.2; §3.0a for completion; SchemeAndStackFoundations §§0.9–0.12, 2.10, 2.15 and its curve-family contract.

### 3.2 Rigid hypercovers of simplicial schemes

A rigid hypercover U_•→X of a scheme is an augmented simplicial scheme whose map from U_n to degree n of the relative (n−1)-coskeleton of U over X is a rigid cover for every n≥0, with U_0→X in degree zero. For simplicial X_• use an augmented bisimplicial U_(a,b), with U_(a,−1)=X_a, whose rows are rigid hypercovers and whose maps in a preserve the rigid lifts. HRR(X_•) has at most one map between any two objects, is nonempty and cofiltered, and admits rigid pullbacks along simplicial scheme maps. Generic hypercovers and descent remain EnhancedDerivedSheaves’ construction. (IEt, Definitions 6.2–6.4, pp. 16–17; Proposition 6.10, pp. 17–18; Proposition 6.14 and 6.17, pp. 19–20; IEt line 747).

One proof route is the following. Use EnhancedDerivedSheaves’ augmented matching-object convention. Recursively choose rigid covers; the split degeneracies are constructed through latching components with their specified points. For finite diagrams form rigid limits by taking the connected pointed components of the ordinary matching fiber products; include the induced degeneracies, as in IEt Remarks 6.9 and 6.13. The rigid-limit universal property supplies cones and uniqueness supplies equalizers. A finite-degree right Kan construction gives cofinality into the product of HRR(X_a) over a≤m, for every m.

- The first matching map is the rigid cover U_0→X, never an omitted condition.
- Rigid pullback preserves matching covers and has the universal property of IEt Proposition 6.10.
- The size-controlled HRR index is nonempty and cofiltered.
- For every finite m, the map from HRR(X_•) to the product of HRR(X_a) over a≤m is cofinal.

**Checks.**

- An étale Čech hypercover admits rigid refinements compatible with its specified point lifts; its degree-one matching map is to U_0×_X U_0.
- The empty augmented simplicial object over a nonempty scheme is not a rigid hypercover, even if all its positive-degree conditions are vacuous.
- HRR(X) and HRR(cX) yield equivalent indexing systems; the diagonal construction on a constant scheme recovers the ordinary étale type.

*Needs:* §3.1; EnhancedDerivedSheaves §E2.6 and its topological descent contract; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 3.3 Rigid étale topological type

For a degreewise locally noetherian simplicial scheme X, construct Et(X) from the pro-system of diagonal simplicial sets U ↦ diag π₀(Uₐ,ᵦ), indexed by its rigid bisimplicial hypercovers. For an ordinary scheme take the constant simplicial scheme. A compatible geometric point gives a vertex, and rigid pullback defines the map Et(X) → Et(Y) for every scheme map X → Y, with coherent identity and composition comparisons. Define its raw homotopy groups through §0.1. Prove comparison with the realization of the degreewise étale pro-types as a weak equivalence, retaining the distinction from a strict pro-isomorphism. (IEt, §3, pp. 8–10, definitions of Et and sEt; Propositions 3.1–3.2 and Theorem 3.3; IEt line 350; FGV, Appendix A.2.2, equations (A.8)–(A.9), pp. 307–308; cited by locator without text).

One proof route is the following. Apply π_0 to each scheme in a rigid bisimplicial hypercover and take the diagonal n↦π_0(U_n,n). Use the universal rigid pullback to give an index functor and the comparison map of diagrams. Track the canonical coherence isomorphisms in any strictification. Finite-degree cofinality controls the skeleta. It gives the IEt comparison to the realization of the degreewise pro-types, without declaring those pro-objects strictly isomorphic.

- Every scheme map induces a pro-map, with identity and composition after the chosen coherence identifications.
- A geometric basepoint yields a compatible pro-vertex and pointed maps for point-preserving morphisms.
- The constant simplicial scheme construction agrees with the ordinary rigid étale type.
- Et sends disjoint unions to coproducts in pro-spaces; materialization or completion is not inferred to preserve these coproducts.

**Checks.**

- For separably closed k, Et(Spec k) is weakly contractible. Its π₀ is a singleton and all positive groups vanish; an empty indexing system must not give the empty type.
- For F_q, Et(Spec F_q)≃B Gal(F_q^sep/F_q) with Gal≅Zhat as a pro-group, not constant discrete Z.
- For the simplicial C-scheme B(C_p), the raw diagonal has the homotopy type BC_p. Replacing X_• by X_0 would give a point and is wrong.

*Needs:* §3.2; §0.1; Mathlib `SSet`.

### 3.4 Cohomology of the rigid étale type

For locally noetherian X, the rigid type has H^m(Et(X),L)≅H^m_et(X,L) for locally constant abelian étale sheaves L in the ordinary étale local-system range, naturally in X, L and every m≥0. This includes arbitrary constant abelian groups, not only finite groups. For a degreewise locally noetherian simplicial scheme, constant finite coefficients have the corresponding total/diagonal comparison. It uses the same native sheaf cohomology and EnhancedDerivedSheaves’ bounded-below descent comparison. (IEt, §2 after Theorem 2.10, p. 7, citing Friedlander Proposition 5.9; §3, pp. 8–10; IEt line 330; SS, materialization–2.2, pp. 822–824; Proposition 2.3, p. 824; Fr Proposition 5.9, cited by locator without text).

One proof route is the following. Compare the local system on the simplicial component diagram with its pullback to the hypercover’s étale site. Use EnhancedDerivedSheaves’ bounded-below hypercover descent for the sheaf concentrated in degree zero, and take the filtered colimit over refinements. This requires the local-system acyclicity/refinement theorem, not the false claim that any cover is acyclic. Establish the full coefficient range of Fr Proposition 5.9, cited by locator without text; the finite-coefficient comparison does not supply this local-system theorem. Finite-degree descent then compares total and diagonal constant-coefficient cohomology.

*Needs:* §3.3; EnhancedDerivedSheaves §E2.6 and its topological descent contract; SchemeAndStackFoundations §2.15; Mathlib `CategoryTheory.Sheaf.H`; AlgebraicTopology Stage 6 and its local-coefficient contract.

### 3.5 Raw and finite étale homotopy groups

For connected locally noetherian X the profinite completion of the raw pro-group π_1(Et(X),x) identifies with the supplied finite-étale fundamental group, compatibly with finite-cover fibers. If X is noetherian and geometrically unibranch, each raw π_n, n≥1, is a profinite pro-group, and π_1 itself identifies with that finite-étale group in Pro(Grp). For a field this identifies Et(Spec k) with BG_k in the raw homotopy category. (SS, Notation before §2, p. 822; Appendix A.3, pp. 862–866; SS line 214; AM Theorem 11.1, cited by locator without text).

One proof route is the following. Use the finite-cover classification of the rigid type and the geometric fiber to identify finite quotients of the raw π_1 with finite étale covers. For geometric-unibranch noetherian schemes invoke the precise Artin–Mazur Theorem 11.1; cited by locator without text. Do not replace it by the abstract compactness of finite groups. For a field use the finite Galois hypercover system to model Et by BG_k, equivalently the field’s higher asphericity. The field comparison here is an equivalence of raw pro-homotopy types.

*Needs:* §3.3; §1.9; EtaleCohomologyFoundations §F.0.2; §3.0a for completion.

### 3.6 Finite étale base change

For finite étale W′→W between locally noetherian schemes, Et(W′)→Et(W) is a finite §1.1. For every X→W in this scope the natural map from Et(X×_W W′) to the fiber product of Et(X) and Et(W′) over Et(W) is an isomorphism of pro-simplicial sets. Consequently a relative homotopy isomorphism Et(X)≅Et(Y) over Et(W) lifts along W′, compatibly with projections, with the existence and deck-equivariance qualifications of Layer 1. (SS, Lemmas 2.1–2.2 and proofs, pp. 822–823; SS line 228).

One proof route is the following. For constant degree d, refine rigid covers so W′ splits as d copies on every connected hypercover piece. Treat varying finite degree on its open-and-closed degree loci. On this cofinal system π_0(U×_W W′)→π_0(U) is a simplicial degree-d covering and the base-change square of component simplicial sets is cartesian. Pass to the pro-system. Apply Ethe supplied covering base-change result to homotopy isomorphisms; this final application adds no uniqueness assertion.

*Needs:* §3.3; §1.1; §1.5; EtaleCohomologyFoundations §F.0.2; §3.0a for completion.

### 3.7 Galois-equivariant geometric cohomology transport

If k-varieties X,Y have Et(X)≅Et(Y) in Ho(Pro(SSet))↓Et(k), then for every abelian group A and every m≥0 there is an isomorphism H^m_et(Y_kbar,A)→H^m_et(X_kbar,A) of G_k-modules, natural in A. Here kbar is a fixed separable closure (or its algebraic closure with the purely inseparable étale comparison). The isomorphism is induced by the lifted finite-cover system; an abstract group isomorphism alone is insufficient. (SS, Proposition 2.3, p. 824; SS line 285).

One proof route is the following. Apply Layer 1 covering base change once to the §1.1 of Et(k) formed by the entire pointed finite Galois extension tower. This supplies an isomorphism of the pulled-back towers compatible with their deck action; unrelated choices of finite-cover lifts would not suffice. Apply cohomology of the rigid type to this tower, keeping homotopy invariance for arbitrary constant abelian A and the deck-equivariant projection maps. Take the filtered colimit of scheme cohomology along the affine field-extension system. SchemeAndStackFoundations §2.15’s limit theorem identifies this with the geometric cohomology, and the deck actions give the actual G_k action.

*Needs:* §3.6; §3.4; SchemeAndStackFoundations §2.15; §0.5; §1.5.

### 3.8 Étale homotopy sequence for elementary fibrations

Let f:X→Y be an elementary fibration of smooth connected varieties in characteristic zero, with affine curve fibers, and geometric x↦y. Form the cofiltered pointed finite étale Galois cover system 𝒴 of Y and 𝒳=X×_Y𝒴. The geometric fiber, 𝒳 and 𝒴 have the Friedlander homotopy fiber sequence with all primes; finite-cover invariance identifies its higher groups with those of X and Y. This gives …→π_n Et(X_y)→π_n Et(X)→π_n Et(Y)→πₙ₋₁Et(X_y)→… in the appropriate pro-group ranges. In particular, when Y is raw K(π,1), its low-degree part is 1→π_1 Et(X_y)→π_1 Et(X)→π_1 Et(Y)→1. (SS, Notation before §2, p. 822; Proposition 2.8, pp. 827–828, invoking Friedlander Theorem 11.5; SS line 438; Fr Theorem 11.5, cited by locator without text).

One proof route is the following. Import the geometric elementary-fibration input from the curve-family supplier contract: a smooth proper geometrically connected curve family with finite étale boundary and nonempty affine complement fibers. Applications to towers of elementary fibrations use this sequence. Over the pointed finite Galois covers, use Friedlander Theorem 11.5’s all-prime homotopy-fiber comparison (Fr Theorem 11.5, cited by locator without text). Its π_1 trivialization and finite-cover invariance give the claimed higher terms. The low-degree injectivity requires π_2(Y)=0. If the base and fiber have vanishing higher raw homotopy, the exact sequence gives that vanishing for the total space; the fundamental-group exact sequence alone does not give the higher sequence.

*Needs:* §3.6; §3.5; AlgebraicTopology Stage 8 and its ordinary simplicial contract; SchemeAndStackFoundations §§0.9–0.12, 2.10, 2.15 and its curve-family contract.

### 3.9 Raw K(π,1), finite effacement and products

For a characteristic-zero field k and geometrically connected geometrically unibranch finite-type k-varieties Y₁,Y₂, prove the canonical continuous isomorphism π₁^ét(Y₁ ×ₖ Y₂) ≃ π₁^ét(Y₁) ×_(Gₖ) π₁^ét(Y₂), with the two projections and chosen compatible geometric points (SS proof of Lemma 2.9, pp. 828–829; SS line 474; SGA1 XIII Proposition 4.6). Its route first proves the geometric product formula for finite étale covers and then uses the supplied arithmetic exact sequence. This finite-cover theorem uses no vanishing of higher raw homotopy groups. Its SGA1 XIII Proposition 4.6 route requires strong desingularizability of finite-type schemes over the algebraic closure; consume ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 6.1–6.2 for this characteristic-zero input, retaining all primes (SGA1 line 12282).

For a connected noetherian geometrically unibranch pointed scheme X, prove that vanishing of every raw πₙ for n≥2 is equivalent to the following: for every finite étale X′ → X, every finite abelian group A, every q≥2 and every class α in Hᑫ_et(X′,A), some further finite étale cover X″ → X′ kills α. The covers in the killing condition are surjective. Prove the profinite local-coefficient detection lemma that justifies testing finite coefficients in this scope: between connected pro-spaces with profinite homotopy pro-groups, an isomorphism on π₁ and on all finite abelian local-coefficient cohomology groups is a weak equivalence. The proof uses finite Postnikov obstructions and the pro-universal cover; it retains profiniteness and does not apply this finite test to arbitrary raw pro-spaces (SS Lemma 2.7(b), proof, p. 827; SS line 417; AM Theorem 4.3, cited by locator without text).

For a characteristic-zero field k and a finite family of geometrically connected geometrically unibranch finite-type k-varieties which are raw K(π,1), prove that their product over k is raw K(π,1). Include the empty product Spec k. The route passes to an algebraic closure using finite-cover invariance of higher groups, applies this subsection’s finite étale product formula and geometric finite-coefficient Künneth, and kills the finitely many classes appearing in each Künneth expression on common finite covers (SS Lemma 2.7(b), pp. 827–828; SS line 414). This proof supplies the raw product input to §4.7 without using a cohomological K(π,1) predicate from its applications.

**Checks.**

- For Spec of a separably closed field, all q≥1 cohomology groups vanish and the effacement condition is satisfied by the identity; the empty product has the field’s classifying raw type.
- Over an algebraically closed characteristic-zero field, the nonzero class in H²_et(ℙ¹,C₂)=C₂ survives every connected finite étale cover, since all such covers are trivial. Thus ℙ¹ is excluded. Allowing an empty killing cover would incorrectly kill this class.
- For Gₘ over ℂ, the degree-d map pulls the degree-one finite coefficient class back by multiplication by d. Taking d equal to the coefficient exponent kills it; products of two copies have finite-coefficient cohomology dimensions 1,2,1 in degrees 0,1,2, and the product covering kills the degree-two exterior class. The product is a raw K(π,1), despite nonzero H² on the original scheme.

*Needs:* §§1.2, 1.8–1.9 and 3.4–3.6; EtaleCohomologyFoundations §§F.0.2, F.0.A2 and F.2.6; the finite étale product formula in this subsection. ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 6.1–6.2 supply the strong desingularizability used by SGA1 XIII Proposition 4.6; this is independent of raw K(π,1).


### Examples

Over a separably closed field the field type is a point; over 𝔽_q it is Bℤ̂. A square-zero thickening Spec(k[ε]/ε²) has the same étale type as Spec k. The map Spec k′ → Spec k for finite separable k′/k has the expected finite-cover index; a purely inseparable extension has index 1. For a product elementary fibration Gₘ×Y → Y with raw K(π,1) base in characteristic zero, the sequence is the split exact sequence with geometric kernel ℤ̂(1).

### Dependencies

Earlier layers 0, 1, 2; ProfiniteProPGroups Layer 0; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 6.1–6.2; EtaleCohomologyFoundations §§F.0.2, F.0.A2, F.2.6; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; EtaleCohomologyFoundations §F.0.2; §3.0a for completion; SchemeAndStackFoundations §§0.9–0.12, 2.10, 2.15 and its curve-family contract; EnhancedDerivedSheaves §E2.6 and its topological descent contract; Mathlib `SSet`; SchemeAndStackFoundations §2.15; Mathlib `CategoryTheory.Sheaf.H`; AlgebraicTopology Stage 6 and its local-coefficient contract; AlgebraicTopology Stage 8 and its ordinary simplicial contract. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 4: Arithmetic relative mapping classes

### 4.0a Center-free bases and geometric outer homomorphisms

Call a profinite group strongly center-free if the center of every open subgroup is trivial. This includes the trivial group and excludes every nontrivial abelian profinite group. For continuous homomorphisms G → Q and H → Q with H → Q surjective, define relative outer Hom as continuous homomorphisms G → H commuting with the two maps to Q, modulo conjugation by ker(H → Q). This quotient uses the geometric kernel and is not quotient by all of H. Define its open-image subset by requiring the image in the profinite topology of H to be open; conjugation preserves this condition (SS §2.2 and Corollaries 2.5–2.6, pp. 825–826; SS line 326 and SS line 369).

- Strong center-freeness is invariant under continuous group isomorphism and passes to open subgroups; a centralizer element of an open subgroup is trivial because it is central in the open subgroup it generates with that subgroup.
- Kernel conjugation preserves the over-Q condition and defines an action whose identity and composition laws use α φ α⁻¹.
- Open image is invariant under that action and hence is a property of relative outer classes; passing from a raw source to its profinite completion leaves maps to H unchanged.

**Checks.**

- For Q=1 the center condition holds and relative outer Hom is ordinary outer Hom. For Q=C₂ it fails, and a structure map with image Q has stabilizer C₂, rather than 1.
- The center of S₃ is trivial but the open subgroup A₃=C₃ has center C₃. Thus center-free alone does not satisfy the definition.
- In S₃, α=(123) transports the image (12) to (23); a second transport by β=(12) yields (13), equal to conjugation by βα. This verifies action order in the arithmetic quotient.
- For Q=C₂, G=C₂, H=C₂×C₂ and the second projection H → Q, there are two relative homomorphisms, t ↦ (0,t) and t ↦ (t,t). Both remain distinct modulo the abelian kernel. An arbitrary map t ↦ (t,0) is excluded by the over-Q condition.
- For Q=1 and H=ℤₚ, the image pℤₚ has index p and is open, whereas {0} is not open. In a finite target both images are open; algebraic surjectivity is not the predicate.
- The empty finite generating family gives the trivial group as an admissible strongly center-free base. Nontrivial C₃ and ℤₚ are excluded, including p=2.

*Needs:* ProfiniteProPGroups Layer 0 and the native profinite group topology; §3.0a; §2.5’s transport convention.

### 4.0b Open arithmetic image

For a connected nonempty finite-type k-variety X, prove that the image of π₁^ét(X) → Gₖ is open, without assuming X geometrically connected or geometrically unibranch. Finite-type descent of a chosen connected component over a separable closure makes its stabilizer open; finite-cover classification identifies that stabilizer with the arithmetic image (SS proof of Proposition 2.4(c), p. 825; SS line 361). 

**Checks.**

- X=Spec k gives the full Gₖ, index 1. For X=Spec k′ with finite separable k′/k, the image is G_(k′) and its index is [k′:k]; requiring surjectivity would be false.
- For a finite purely inseparable field extension, the map on absolute Galois groups is an isomorphism, index 1. The inseparable degree must not be used as the index.
- Over ℂ, two copies of Gₘ have fundamental group ℤ̂², and the two projections give the two coordinate maps. For Y₂=Spec k the fiber product reduces to π₁^ét(Y₁), not π₁^ét(Y₁)×Gₖ.

*Needs:* EtaleCohomologyFoundations §§F.0.2, F.0.4 and F.0.A2; SchemeAndStackFoundations §§0.9, 2.10 and 2.15; ProfiniteProPGroups Layer 0. The finite-cover product input for raw product mapping is §3.9.

### 4.1 Pointed arithmetic lifting

Let X,Y be connected finite-type k-varieties, with Y geometrically connected and geometrically unibranch. Choose geometric points over one separably closed extension of k and its induced separable closure kbar. The forgetful map Hom_Ho(Pro(SSet)_*)↓Et(k)(Et(X),Et(Y))→Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y)) is surjective. (SS, Proposition 2.4(a), p. 825; SS line 329).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch.

One proof route is the following. Identify Et(k) with BG_k. Geometric unibranchness of the noetherian Y makes its homotopy pro-groups profinite, so Layer 2 gives path-connected materializations. Import the geometric/arithmetic fundamental-group exact sequence from EtaleCohomologyFoundations §F.0.A2; apply the relative lifting theorem and its isomorphism assertion.

*Needs:* §2.8; §2.9; §2.3; §3.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.2 Pointed lifts of arithmetic isomorphisms

Under the hypotheses of §4.1, every isomorphism over Et(k) in the unpointed homotopy category has a pointed isomorphism lift over (Et(k),kbar). (SS, Proposition 2.4(a), second assertion, p. 825; SS line 340).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1.

One proof route is the following. Apply the relative isomorphism-lifting theorem using the same profinite and geometric-connectivity verifications as §4.1.

*Needs:* §4.1; §2.9.

### 4.3 Geometric monodromy quotient

Under the hypotheses of §4.1, π_1^et(Y_kbar,y) acts on pointed relative mapping classes, and forgetting points induces a surjection from its orbit set to the unpointed relative Hom set. This action is through the actual underlying abstract geometric fundamental group identified by Layer 2, not through its finite quotients one at a time. (SS, Proposition 2.4(b), p. 825; SS line 342).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1.

One proof route is the following. The exact fundamental-group sequence identifies the geometric group with the kernel of π_1(Y)→G_k. The kernel maps to the identity of G_k and therefore preserves the pointed structure class. It is contained in Δ_XY from the relative orbit theorem. The relative pointed lifting surjection descends through this subgroup quotient; it need not yet be injective.

*Needs:* §4.1; §2.10; §3.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.4 Arithmetic orbit bijection

Under the hypotheses of §4.1, if every open subgroup of Gₖ has trivial center, forgetting points induces a bijection between geometric π₁^ét(Y_k̄,y)-orbits of pointed relative maps and unpointed relative maps. Use the strongly center-free predicate of §4.0a, with all open subgroups included. (SS, Proposition 2.4(c) and proof, p. 825; SS line 352).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. If g stabilizes the structure class of Et(X)→BG_k, the conjugation formula says that g centralizes the image U of the raw pro-fundamental group in G_k. The finite-type connected-variety openness theorem proved in §4.0b says that U is open, including when X is not geometrically unibranch. The open subgroup generated by U and g has g in its center, so g=1. Thus S_X=1 and Δ_XY is exactly the geometric kernel. Apply the relative orbit theorem.

*Needs:* §4.3; §2.10; §2.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.5 Outer fundamental-group map

Under the hypotheses of §4.1 and strongly center-free G_k, applying π_1 to a pointed relative class and quotienting by target geometric conjugation yields a basepoint-independent map from unpointed relative homotopy classes to Hom_out,Gk(π_1^et(X),π_1^et(Y)). Here π₁ on the source is first the raw pro-group; because the target is profinite each map factors uniquely through X’s finite-étale profinite completion. This map agrees with the usual outer arithmetic homomorphism of a scheme map. (SS, Corollary 2.5 and preceding definitions, p. 826; SS line 369).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. Use the native Pro(Grp) functor and the profinite-completion universal property constructed in §3.0a and §4.0a. Path transport acts on the group homomorphism by conjugation by precisely the geometric target group. The relative outer Hom quotient of §4.0a therefore receives a well-defined orbit map. Apply the arithmetic orbit bijection. Compare scheme morphisms before taking either quotient, and use the usual geometric-basepoint path torsors for independence.

*Needs:* §4.4; §2.5; §3.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.6 Open-image orbit bijection

Under the hypotheses of §4.1 and strongly center-free G_k, the arithmetic orbit bijection restricts to pointed relative classes inducing homomorphisms with open image, modulo π_1(Y_kbar), and unpointed π_1-open relative classes. Openness is tested in the target profinite topology after the finite-étale completion of the source. (SS, Corollary 2.6, p. 826; SS line 391).

X and Y are connected finite-type varieties over the same field. Y is geometrically connected and geometrically unibranch; X need not be geometrically unibranch. Geometric basepoints are chosen over one separably closed extension, as in §4.1. Every open subgroup of the absolute Galois group G_k has trivial center.

One proof route is the following. The supplier’s continuous conjugation automorphisms preserve open subgroups. Hence π_1-openness is constant on every geometric orbit. Restrict the established bijection to that invariant predicate. Its definition agrees on the unpointed side by §4.5.

*Needs:* §4.4; §4.5; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### 4.7 Maps into products of étale K(pi,1) varieties

Let k have characteristic zero and strongly center-free G_k. Let Y_1,Y_2 be geometrically connected, geometrically unibranch k-varieties whose raw higher étale homotopy pro-groups vanish. For every k-variety X, projections give a bijection Hom_Ho(Pro(SSet))↓Et(k)(Et(X),Et(Y_1×_kY_2))≅Hom(Et(X),Et(Y_1))×Hom(Et(X),Et(Y_2)). (SS, Lemma 2.9 and proof, pp. 828–829; SS line 467).

The field k has characteristic zero and every open subgroup of G_k has trivial center. Y_1 and Y_2 are geometrically connected and geometrically unibranch, with vanishing raw higher étale homotopy pro-groups. X is any finite-type k-variety; its connected components are treated separately.

One proof route is the following. Treat the finitely many connected components of X separately. Apply §3.9 to show the product target is raw K(π,1). Use §3.9’s characteristic-zero finite étale product formula with its two projections. Classifying-space representability gives the product bijection of pointed relative Hom sets. The geometric target kernel is the product of the two geometric kernels; take its componentwise orbits and apply §4.4.

*Needs:* §4.4; §1.8; §3.9, raw K(π,1) products; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters.

### Examples

For a separably closed base field the geometric action is the whole target action. Thus BC₂ → BS₃ has four pointed classes and two unpointed classes. For the relative pro-space model X=BC₃ → BC₂ with trivial structure map and Y=BS₃ → BC₂ induced by sign, the pointed relative maps are the three homomorphisms C₃ → A₃. The geometric kernel A₃ fixes all three, while the full stabilizer preimage S₃ identifies the two nonzero maps. Thus its geometric-kernel quotient has three elements and the unpointed relative set has two; this is the negative control for the center hypothesis on an abstract relative model. For an empty source, every target has exactly one unpointed map, and the product formula gives 1=1×1.

### Dependencies

Earlier layers 0, 1, 2, 3; EtaleCohomologyFoundations §F.0.A2; §4.0a–§4.0b for arithmetic adapters; §3.9, raw K(π,1) products. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 5: Betti realization and analytic descent

### 5.1 Algebraic evaluation of singular simplices

For a compact Hausdorff space T, let C(T,ℂ) be the native complex algebra of continuous functions. For every quasi-projective complex scheme X, evaluation at t gives a natural bijection Hom_ℂ(Spec C(T,ℂ),X) ≃ C(T,X(ℂ)_an). The left-to-right map takes a scheme morphism to its evaluations, and the inverse glues the affine coordinate maps. It is natural in algebraic maps of X and continuous maps of T. For the standard real n-simplex this identifies the algebraic singular-simplex formula with the native singular functor, including its universe lift. (FGV, Lemma A.7 and proof, p. 306; Definition A.8, p. 307; cited by locator without text).

One proof route is the following. For affine X the bijection is the ordinary algebra-homomorphism/point correspondence, with its coordinatewise continuity. For general quasi-projective X choose a finite partition of unity on T subordinate to the inverse images of an affine cover. Choose cutoff functions whose closed supports lie in the corresponding inverse-image affine opens; their subordinate finite sum is positive at every point. Use supports to extend suitable coordinate products by zero and obtain maps on distinguished opens of Spec C(T,C). Glue the scheme maps and verify uniqueness on the distinguished cover. A cutoff supported strictly inside its affine chart makes the relevant coordinate products bounded on its support, so extension by zero is continuous. In every localization used for gluing, the chosen cutoff is inverted and hence a unit; no value at its zero set is divided by it. Precomposition of continuous functions commutes with evaluation. The imported analytification carrier and its affine coordinate tests identify the native singular set.

**Checks.**

- For T a point and X=𝔸¹_ℂ, both sides are ℂ and evaluation is the identity; the zero map would fail at the point 1.
- For T=∅, C(T,ℂ) is the zero ring, Spec is empty, and both Hom sets are singletons. For T nonempty and X=∅, both Hom sets are empty. A nonzero-ring assumption would incorrectly discard the first case.
- For T=[0,1] and X=𝔾ₘ, the function t ↦ 1+t gives a point on both sides with inverse t ↦ 1/(1+t), since 1+t≥1. The function t ↦ t is excluded: it vanishes at 0, so is not a unit.
- For X=Spec(ℂ[ε]/ε²), every map into the reduced algebra C(T,ℂ) sends ε to 0. Its analytic-point space is one point, so both sides are singletons; forgetting nilpotents is valid for this test algebra, not an equality of analytic ringed spaces.

*Needs:* Mathlib `ContinuousMap.evalAlgHom`; Mathlib `ContinuousMap.compRightAlgHom`; Mathlib `TopCat.toSSetObjEquiv`; ComplexComparisonPartII §C−1.1.

### 5.2 Betti realization of simplicial varieties

For a simplicial quasi-projective complex scheme X_•, define Sing_an(X_•)=diag([a],[b])↦Sing_b(X_a(C)_an). Equivalently its n-simplices are X_n(C(Δⁿ,C)). Define D(X_•)_n=X_n(C), with discrete complex points in the second direction; constant singular simplices give D(X_•)→Sing_an(X_•). On a constant scheme this is exactly the supplied singular functor on its analytification. (FGV, Definition A.8 and preceding identity, p. 307; properties (i)–(ii), p. 305; cited by locator without text).

One proof route is the following. Compose the given simplicial analytic space with Mathlib’s singular functor and precompose with the simplex diagonal. No new singular-simplex definition is needed. Use algebraic evaluation degreewise to identify the diagonal with X_n(C(Δⁿ,C)); check both faces and degeneracies, since both indices move. Constant simplices define the natural map from the diagonal discrete-point object.

- For cX, the diagonal realization is naturally isomorphic to TopCat.toSSet(X_an).
- A map of simplicial analytic spaces gives a simplicial map, preserving identity and composition.
- Its n-simplices identify with X_n(C(Δⁿ,C)) with the diagonal simplicial operators.
- The natural point map sends a complex point in degree n to the constant singular n-simplex in X_n.

**Checks.**

- For constant A¹_C the result is weakly contractible; its discrete points object has one component for each complex number.
- For the simplicial finite constant scheme BC_p over C, the diagonal is BC_p, not a point.
- For a constant quasi-projective scheme X the natural isomorphism agrees degreewise with Mathlib’s native singular simplices; for a finite reduced scheme it agrees with the native constant-set comparison.

*Needs:* §5.1; Mathlib `TopCat.toSSet`; Mathlib `TopCat.toSSetObjEquiv`; Mathlib `TopCat.toSSetIsoConst`; ComplexComparisonPartII §C−1.1; Mathlib `CategoryTheory.Functor.diag`; Mathlib `CategoryTheory.Functor.uncurry`.

### 5.3 Betti descent for smooth surjections

For a smooth surjection U→V of smooth quasi-projective complex varieties, let U_n=U×_V⋯×_V U with n+1 factors. Then Sing_an(U_•)→Sing_an(V) is a weak equivalence. More generally the comparison zigzag uses analytic descent for étale hypercovers of complex varieties, including singular varieties; this second assertion uses local analytic homeomorphisms and the imported topological hypercover theorem, not a manifold assertion for singular V. (FGV, Example A.10, p. 311; Appendix A.2.3, pp. 309–310; cited by locator without text).

One proof route is the following. For smooth U,V, analytification is a surjective submersion, so the differential-geometric local-section theorem supplies local sections. The Čech nerve of a map with local sections is a topological hypercover. The analytic target is Hausdorff and second countable, hence paracompact; its local-section cover is numerable. Apply Orbifolds O4-N’s Čech realization theorem and the supplied singular/realization comparison. For an étale hypercover, use that analytic étale maps are local homeomorphisms. Apply the same topological theorem degreewise and the bisimplicial diagonal weak-equivalence theorem.

*Needs:* §5.2; Orbifolds O4-N, item 3; EnhancedDerivedSheaves §E2.6 and its topological descent contract; ComplexComparisonPartII §C−1.1; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### Examples

For constant 𝔸¹_ℂ the Betti type is contractible, while its discrete points have one component per complex number. For B(C_p) in finite constant complex schemes, degree n has pⁿ simplices and the Betti type is BC_p. For the Čech nerve of {0,1} → *, each degree has 2^(n+1) simplices but the realization is contractible; a degreewise disjoint union would retain too many components.

### Dependencies

Orbifolds O4-N, item 3; Earlier layers 0, 1, 2, 3, 4; Mathlib `ContinuousMap.evalAlgHom`; Mathlib `ContinuousMap.compRightAlgHom`; Mathlib `TopCat.toSSetObjEquiv`; ComplexComparisonPartII §C−1.1; Mathlib `TopCat.toSSet`; Mathlib `TopCat.toSSetIsoConst`; Mathlib `CategoryTheory.Functor.diag`; Mathlib `CategoryTheory.Functor.uncurry`; EnhancedDerivedSheaves §E2.6 and its topological descent contract; AlgebraicTopology Stage 8 and its ordinary simplicial contract. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Layer 6: p-completion and Betti–étale comparison

### 6.1 p-finite spaces

For a prime p, a space is p-finite when π_0 is finite and for every basepoint its positive homotopy groups are finite p-groups and vanish above a uniform finite degree. Regard these as homotopy types, or Kan representatives closed under equivalence. Write Sp_p-fin for their essentially small category and Pro(Sp_p-fin) for its homotopy-coherent pro-category. Arbitrary finite π_1 is not allowed unless it is a p-group; degreewise finiteness of a simplicial model is neither the definition nor a replacement for truncation. (FGV, Appendix A.2.2, p. 307, definition before (A.9); cited by locator without text; BHH, Definition 7.3.1 and Propositions 7.3.4–7.3.6, pp. 68–70; BHH line 2427).

One proof route is the following. Use the imported ordinary homotopy groups and truncations to define the full subcategory. Take a small skeleton in the declared universe. Retain all finite component sets, and compare Kan representatives through the homotopy-coherent localization requested from EnhancedDerivedSheaves. Prove finite homotopy-limit closure and use finite Postnikov decompositions with finite p-group actions.

- The predicate is invariant under weak homotopy equivalence.
- The terminal space and finite homotopy limits of p-finite spaces are p-finite.
- K(A,n) is p-finite for a finite abelian p-group A and n≥1; B P is p-finite for a finite p-group P.
- Every component has the finite p-group and truncation properties, with one common bound for the finite component set.

**Checks.**

- Every finite discrete set, including the empty set and a two-element set, is p-finite. Their component counts are 0 and 2 and every positive homotopy group is zero, so a connectedness requirement is wrong.
- BC_p is p-finite, whereas BC_q is not p-finite for a different prime q.
- The product of K(F_p,n) over n≥1 has finite homotopy groups in each degree but is not p-finite, because no truncation bound exists.

*Needs:* §0.1; AlgebraicTopology Stage 8 and its ordinary simplicial contract; ProfiniteProPGroups Layer 0; Tau Ceti compact inverse systems; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract; ProfiniteProPGroups Layer 3; Tau Ceti topological generation.

### 6.2 p-profinite completion

For a pro-space X, construct X^∧_p in Pro(Sp_p-fin) with a unit X→X^∧_p, characterized by equivalences of derived mapping spaces Map(X^∧_p,K)≃Map(X,K) for every p-finite K. Extend this to all p-profinite targets by their limit formula. On a small cofiltered representative, maps to a constant K are the filtered colimit of derived level mapping spaces. In particular the unit preserves continuous F_p cohomology in every degree. Completion is not materialization and is not defined as levelwise group completion alone. (IC, Theorem 2.2, pp. 4–5; Definition 3.1 and Theorem 3.3, pp. 5–6; IC line 185; BHH, §7.3, Proposition 7.3.6 and Corollary 7.3.8, pp. 70–71; FGV, Appendix A.2.2, pp. 308–309; cited by locator without text).

One proof route is the following. Use the strict model on Pro(SSet) for this localization. Take the BHH finite test set K_p: finite discrete spaces, BC_p and K(C_p,n) for n≥2. Apply IC’s test-object localization and its nilpotent fibrant characterization; BHH’s finite-limit closure comparison identifies the result with a system of p-finite types. The model/infinity-category adapter is the separate next target. The mapping-space unit is the localization universal property; K(F_p,n) gives continuous cohomology preservation. This construction is applied to the raw representative of Et, without equating strict and Isaksen weak equivalences.

- The unit is natural in X in the homotopy-coherent sense.
- Precomposition with the unit is an equivalence of derived mapping spaces to every p-profinite target.
- Completing a p-profinite type again is canonically equivalent to it.
- Continuous cohomology with F_p coefficients agrees through the unit in all degrees.

**Checks.**

- For X=BC_p or any finite discrete set, completion agrees with that constant p-finite type. In particular a two-point input still has two components, excluding a connected completion.
- For q≠p, the p-profinite completion of BC_q is contractible; mod-p acyclicity here is used together with its finite prime-to-p group structure.
- The p-profinite completion of an infinite discrete set is its pro-finite-set completion, not the constant infinite discrete set and not a single connected point.

*Needs:* §6.1; §0.2; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; AlgebraicTopology Stage 8 and its ordinary simplicial contract; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract.

### 6.3 Model for homotopy-coherent p-profinite types

Prove that the infinity-category presented by the Kₚ-localized strict model on pro-simplicial sets is equivalent to the homotopy-coherent Pro category of p-finite spaces. Identify materialization with the right adjoint to completion of constant spaces: for an ordinary space K, maps from its p-completion into P are equivalent to maps from K into Mat(P). Under the model comparison, Mat(P) is the ordinary homotopy limit of a strict fibrant p-finite representative. The constant-space left adjoint here includes p-completion; an arbitrary constant space is not already p-profinite. (BHH, Theorem 7.1.2, pp. 62–64; Corollary 7.3.8, pp. 70–71; BHH line 2226).

One proof route is the following. Apply the general comparison of a localized strict pro-model with the infinity-pro-category of its finite test closure. Use BHH’s p-finite closure theorem. Compare the constant functors on the common finite types; uniqueness of right adjoints identifies derived limit with materialization. Record the exact native infinity-category and universe interface as supplier contract the coherent Pro supplier contract; the absence of an implementation is not evidence that ordinary Pro(Ho(SSet)) suffices.

*Needs:* §6.2; §2.1; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract.

### 6.4 Materialized p-completed étale type

For degreewise locally noetherian simplicial X, put Et_p(X)=Mat(Et(X)^∧_p), an ordinary homotopy type represented by a simplicial set. The projections and completion unit give a canonical map H^m_et(X,F_p)→H^m(Et_p(X),F_p). This map is not asserted to be an isomorphism for arbitrary X. The scheme-functorial construction is a functor of homotopy-coherent types; a strictly functorial chosen simplicial-set model is the strictification target in §6.9. (FGV, Appendix A.2.2, (A.9), pp. 307–309; cited by locator without text).

One proof route is the following. Apply the completion to the actual rigid inverse system and choose a strict fibrant p-finite presentation through the model comparison. Take the derived limit, using the supplied native simplicial-set carrier. Pull cohomology classes along all limit projections, and use continuous cohomology preservation to obtain the displayed map. The chosen point-set functor and its comparison are constructed in §6.9.

- Maps of simplicial schemes induce maps of the materialized p-types coherently with identity and composition.
- The canonical cohomology comparison is induced by the completion unit and limit projections.
- For separably closed k, Et_p(Spec k) is contractible.
- Under the finite-type hypotheses of the next theorem, the displayed map is an isomorphism in every degree.

**Checks.**

- Over C the p-realization of Spec C is a point. Its H⁰ is 𝔽ₚ and higher cohomology is zero, rather than H⁰=0 of an empty model.
- For the simplicial C-scheme BC_p, Et_p is BC_p, with H¹=F_p. The sufficient H¹=0 criterion is not a necessary condition for every individual comparison.
- For an infinite disjoint union of Spec C, H⁰_et consists of all F_p-valued functions on the component set. Raw materialization of the pro-finite-set completion has additional ultrafilter components, so its H⁰ need not coincide. Completion/materialization cannot silently commute with this infinite coproduct.

*Needs:* §3.3; §3.4; §6.3; §2.1.

### 6.5 Finite-type materialization comparison

For a p-profinite space P, assume H⁰_cont(P,F_p)=F_p via the unit, H¹_cont(P,F_p)=0, and every H^m_cont(P,F_p) is finite-dimensional. Then P is simply connected of finite type in Lurie’s sense: all its higher homotopy pro-p groups are topologically finitely generated. The projection map H^m_cont(P,F_p)→H^m(Mat(P),F_p) is an isomorphism for every m. Consequently Et_p(X) computes mod-p étale cohomology whenever X has these cohomological properties. A finite number of components is handled one connected component at a time. (DAG13, Definition 3.3.2 and Proposition 3.3.8, pp. 82–86; Corollary 3.4.10 and Theorem 3.4.12, pp. 91–93; DAG13 line 4146; FGV, Appendix A.2.2, p. 309; cited by locator without text).

One proof route is the following. Use the homotopy-coherent adapter to view the completed rigid object as Lurie’s p-profinite P. Apply Corollary 3.4.10 and Theorem 3.4.12 to obtain simple connectivity and finite type; apply Proposition 3.3.8 to the canonical projection-induced map. For finite components, completion preserves the finite component decomposition and the limit splits accordingly. Apply the connected assertion componentwise.

*Needs:* §6.3; §6.4; AlgebraicTopology Stage 8 and its ordinary simplicial contract; ProfiniteProPGroups Layer 0; Tau Ceti compact inverse systems; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract; ProfiniteProPGroups Layer 3; Tau Ceti topological generation; ProfiniteProPGroups Layer 4; Tau Ceti abelian pro-p structure.

### 6.6 Componentwise p-completed realization

Given a specified decomposition of X_• into open-and-closed simplicial subschemes X_•,a indexed by a∈A and preserved by every face and degeneracy, define Et_p^gr(X)=∐_a Et_p(X_a). Maps carry each specified summand into a specified target summand, together with the induced map of grading sets. If each summand has H⁰_et=F_p, H¹_et=0 and degreewise finite-dimensional mod-p cohomology, its comparison is an isomorphism, and the graded coproduct computes the full componentwise cohomology, with products over A in cohomology. This is a construction on specified graded objects and does not assert such a decomposition exists functorially for every simplicial scheme. (FGV, Appendix A.2.2–A.2.3, pp. 307–310; graded applications in A.4–A.5, pp. 312–315; cited by locator without text).

One proof route is the following. Apply raw completion and materialization separately on each supplied simplicial summand. Form the ordinary coproduct only at the end. Functoriality uses the actual map on grading sets and each component map; it cannot be reconstructed from an arbitrary decomposition of each X_n independently. The cochain complex of a coproduct is the product of the component cochain complexes. Exactness of products of vector spaces gives the cohomology assertion.

- The a-summand is canonically Et_p(X_a).
- A map preserving the given grading induces a map of the coproduct realizations.
- Its mod-p cohomology is the product of the component cohomologies in each degree.
- For finite A it agrees, up to canonical equivalence, with raw Et_p on the corresponding finite disjoint union.

**Checks.**

- For X equal to the disjoint union of copies of Spec C indexed by N with its displayed grading, Et_p^gr(X) is the ordinary discrete N and H⁰ is F_p^N.
- For a single specified grade the construction agrees with raw Et_p; for no grades it is empty.
- A separate partition of each X_n that a face merges or a degeneracy fails to preserve is not an input grading and cannot be used to form this functor.

*Needs:* §6.5; §6.4; §3.3; AlgebraicTopology Stage 6 and its local-coefficient contract.

### 6.7 Betti–étale comparison zigzag

For a simplicial quasi-projective C-scheme X and its rigid hypercovers U, whose pieces are locally of finite type and may form infinite disjoint unions, set Z_X=holim_U Sing_an(U), where the analytic realization of U uses §C−1.1’s locally finite-type analytification followed by the diagonal of all its simplicial directions. A rigid cover need not itself be quasi-projective. There is a natural zigzag Sing_an(X)←Z_X→Et_p(X); the left arrow is a weak equivalence. The right arrow is induced by the component map of every connected singular simplex and the completion unit. For a specified grading use the coproduct of these zigzags on the grades. The resulting homotopy-category map is independent of cofinal refinements. (FGV, Appendix A.2.3, pp. 309–310; cited by locator without text).

One proof route is the following. A singular simplex is connected, so its image lies in one connected component of U_a,b. These assignments commute with all face and degeneracy maps and give maps to diag π_0 U. Analytic étale hypercover descent gives Sing_an(U)→Sing_an(X) as a weak equivalence. The nerve of the nonempty cofiltered rigid index is contractible, so the homotopy limit of this objectwise weak equivalence to the constant diagram still maps by equivalence to Sing_an(X). Compose the compatible component maps with the completion unit and apply derived limit. Use homotopy-coherent functoriality to obtain the zigzag independently of cofinal refinement; §6.9 also constructs the strictly chosen point-set version.

- The left arrow of the zigzag is a weak equivalence.
- Cofinal rigid refinement gives the same comparison morphism in the homotopy category.
- Comparison commutes with algebraic maps of simplicial schemes over C.
- The composite from discrete complex points has the algebraic field-automorphism naturality stated in the final theorem.

**Checks.**

- For Spec C all three homotopy types and both maps are contractible equivalences. In degree zero the comparison is 1 ↦ 1 on 𝔽ₚ, excluding the zero map.
- For a finite disjoint union of Spec C the zigzag preserves every labeled point and every permutation.
- For the simplicial scheme BC_p it yields BC_p at both endpoints and the expected identity comparison, rather than the point X_0.

*Needs:* §5.2; §5.3; §3.2; §6.4; §2.1; AlgebraicTopology Stage 8 and its ordinary simplicial contract.

### 6.8 Mod-p Betti–étale comparison

For simplicial quasi-projective X over C, assume H⁰_et(X,F_p)=F_p, H¹_et(X,F_p)=0 and degreewise finite-dimensional mod-p étale cohomology. Then the comparison zigzag induces an isomorphism on mod-p cohomology and homology in every degree. The statement also holds for a specified open-and-closed simplicial grading with these hypotheses on each grade, using Et_p^gr. Finite constant-coefficient Artin comparison and the analytic sheaf/singular comparison are the supplied suppliers; no unrestricted infinite-coefficient analytic comparison is used. (FGV, Appendix A.2.3, pp. 309–310; property (iii), p. 305; cited by locator without text).

One proof route is the following. Apply the supplied finite-coefficient Artin comparison degreewise, then bounded-below descent/first-quadrant totalization to the simplicial scheme. Use the supplier’s paracompact semilocally contractible analytic sheaf/singular comparison; check that the induced cohomology map is precisely that from the hypercover component maps, not merely an abstract group isomorphism. Apply the finite-type materialization theorem to identify the other endpoint. Over the field F_p, natural universal coefficients turn a cohomology isomorphism into a homology isomorphism. For the grading apply this on each grade, using direct sums in homology and products in cohomology.

*Needs:* §6.7; §6.5; §6.6; ComplexComparisonPartII §§C6.1–C6.3; ComplexComparisonPartII §§C5.1, C6.1; EnhancedDerivedSheaves §E2.6 and its topological descent contract.

### 6.9 Field-automorphism naturality of discrete points

For every field automorphism σ of ℂ and every σ-semilinear morphism f:X → X′ of simplicial quasi-projective complex schemes, the discrete-point map D(X) → Etₚ(X) is natural after twisting by σ, as a map of homotopy types. The same holds for specified gradings respected by f. Analytic comparison maps are used for continuous σ, namely identity and complex conjugation. For a simplicial ℚ-scheme obtain a homotopy-coherent Aut(ℂ)-action on its p-realization and equivariance of its discrete-point map. Construct a strictly functorial simplicial-set representative of the étale p-realization and a strict Aut(ℂ)-diagram weakly equivalent, as a coherent diagram, to this action; specify the equivariant comparison for the discrete-point map. The discrete group of automorphisms and diagram category live in the fixed larger universe. (FGV, Properties (i)–(ii), p. 305; Appendix A.2.2–A.2.3, pp. 308–310; application to (6.2), pp. 259–260; cited by locator without text).

One proof route is the following. Semilinear base change sends rigid covers and their specified geometric lifts to rigid covers, and gives coherent maps of raw étale types. Completion and materialization preserve that coherent functoriality. Define the point-to-étale map directly by the algebraic lifts of complex points to the rigid system; prove its equality with the composite comparison. This avoids needing an analytic map for a discontinuous automorphism. For identity and conjugation, evaluation of continuous functions supplies the analytic semilinear comparison as well. For a Q-model use its descent identifications and their cocycle law to obtain the coherent group action. Rectify the coherent diagram indexed by the discrete group of field automorphisms in a fixed larger universe, retaining the equivariant comparison of derived diagrams and the cocycle law.

**Checks.**

- On Spec ℂ all field automorphisms act on the one-point p-type by the identity. On discrete complex points of 𝔸¹, composition sends z to σ(τ(z)); replacing the action by the inverse reverses the stated law.
- Conjugation sends the discrete point i of 𝔾ₘ to −i, and sends the positively oriented loop exp(2πit) to its inverse. On geometric π₁ it acts by multiplication by −1; a trivial action fails.
- For a finite constant scheme with two labeled points, a field automorphism fixes both labels; a permutation of labels acts by that permutation. A rectified model is compared equivariantly with these maps, and arbitrary weakly equivalent spaces without equivariant comparison do not satisfy the target.

*Needs:* §6.7; §5.1; §3.1; §6.3; ComplexComparisonPartII §C−1.1; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract.

### Examples

For B(C_p) the materialized p-type is BC_p and H¹=𝔽ₚ, so the sufficient H¹=0 theorem is not a necessary condition for every comparison. For K(ℤ/p,2), the finite-type criterion applies and the degree-two comparison is 𝔽ₚ → 𝔽ₚ, the identity. For the specified grading ∐_(a∈ℕ) Spec ℂ, the graded type is the discrete ℕ and H⁰=𝔽ₚ^ℕ. Completing the ungraded infinite set first has the ultrafilter component set βℕ; its full function space contains functions not arising from the continuous functions βℕ → 𝔽ₚ.

### Dependencies

Earlier layers 0, 1, 2, 3, 4, 5; AlgebraicTopology Stage 8 and its ordinary simplicial contract; ProfiniteProPGroups Layer 0; Tau Ceti compact inverse systems; EnhancedDerivedSheaves §§E0.2–E0.5, E0.8 and its coherent Pro contract; ProfiniteProPGroups Layer 3; Tau Ceti topological generation; AdicSpacesPartII §R0.19.9 and the Pro reindexing contract; ProfiniteProPGroups Layer 4; Tau Ceti abelian pro-p structure; AlgebraicTopology Stage 6 and its local-coefficient contract; ComplexComparisonPartII §§C6.1–C6.3; ComplexComparisonPartII §§C5.1, C6.1; EnhancedDerivedSheaves §E2.6 and its topological descent contract; ComplexComparisonPartII §C−1.1. The item-level Needs lines specify the direct inputs; proof routes retain their own coefficient, connectivity and size hypotheses.

## Downstream consumers

AnabelianGeometryAndNonabelianChabauty Layer 1 consumes raw K(π,1) recognition, finite-cover transport and elementary-fibration homotopy sequences; its geometric neighborhood constructions remain scheme geometry. InverseGaloisAndArithmeticFundamentalGroups consumes raw/finite π₁ comparison and the relative outer-map interface. EllAdicHomotopyTypesAndWeights consumes the rigid pro-simplicial carrier and its local-coefficient comparison. MotivicEtaleKTheory consumes completed realization with its coefficient and characteristic hypotheses. ArithmeticKTheoryPartII consumes the specified-graded complex comparison, its mod-p homology isomorphism under the stated finite-type conditions, and the coherent and rectified automorphism actions for spectrum-level applications.

## References

All statements are expressed here in the roadmap’s notation. Line locators refer to the legally obtained extractions identified by the source keys in `sources.toml`; a source cited by locator without text has status uncertified there.

- **SS:** Alexander Schmidt and Jakob Stix, *Anabelian geometry with étale homotopy types*, Annals of Mathematics 184 (2016), 817–868. [Published open text](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf). §materialization–2.3 and Appendix A.1–A.3; SS line 228 and SS line 1410.
- **I01:** Daniel C. Isaksen, *A model structure on the category of pro-simplicial sets*, arXiv:math/0106152v1 (2001). [Version read](https://arxiv.org/abs/math/0106152v1). §§4–8 and §§12–18; I01 line 398. Page references use the preprint, rather than journal pagination.
- **IStr:** Daniel C. Isaksen, *Strict model structures for pro-categories*, arXiv:math/0108189v1 (2001; published 2004). [Version read](https://arxiv.org/abs/math/0108189v1). Proof of Theorem 4.15 and Remark 4.16, pp. 11–12; IStr line 507. This is the preprint numbering for the properness repair.
- **IEt:** Daniel C. Isaksen, *Etale realization on the A¹-homotopy theory of schemes*, arXiv:math/0106158v2 (2003 version). [Version read](https://arxiv.org/abs/math/0106158v2). §§2–3 and §§5–6; IEt line 394 and IEt line 634.
- **IC:** Daniel C. Isaksen, *Completions of pro-spaces*, arXiv:math/0404303v1 (2004; published 2005). [Version read](https://arxiv.org/abs/math/0404303v1). Theorems 2.2 and 3.3 and Definition 3.1; IC line 185 and IC line 233. The test-object localization is distinct from localization defined only by constant-coefficient homology.
- **BHH:** Ilan Barnea, Yonatan Harpaz and Geoffroy Horel, *Pro-categories in homotopy theory*, Algebraic & Geometric Topology 17 (2017), 567–643. [Author postprint](https://www.math.univ-paris13.fr/~harpaz/pro_categories.pdf). Theorem 7.1.2, Definition 7.3.1, Proposition 7.3.6 and Corollary 7.3.8; BHH line 2226 and BHH line 2427. Page references use the postprint’s internal pages 62–71.
- **DAG13:** Jacob Lurie, *Derived Algebraic Geometry XIII: Rational and p-adic Homotopy Theory*, December 15, 2011. [Author text](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf). Definition 3.3.2, Proposition 3.3.8, Corollary 3.4.10 and Theorem 3.4.12; DAG13 line 3708, DAG13 line 3736 and DAG13 line 4146.
- **FGV:** Tony Feng, Søren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, Inventiones Mathematicae 230 (2022), 225–319. [Publisher citation](https://doi.org/10.1007/s00222-022-01127-8). Appendix A.2.1–A.2.3 and Example A.10, cited by locator without text. The finite-type criterion used here is DAG13 Theorem 3.4.12 and Proposition 3.3.8. Infinite specified gradings use componentwise completion and materialization; the smooth-submersion proof assumes a smooth target.
- **BK:** A. K. Bousfield and D. M. Kan, *Homotopy limits, completions and localizations*, Lecture Notes in Mathematics 304 (1972). [Publisher citation](https://doi.org/10.1007/978-3-540-38117-4). XI 5.2, XI 7.1, IX 5.1 and IX 5.4, cited by locator without text.
- **AM:** Michael Artin and Barry Mazur, *Etale homotopy*, Lecture Notes in Mathematics 100 (1969). [Publisher citation](https://doi.org/10.1007/BFb0080957). Theorems 4.3 and 11.1, cited by locator without text.
- **Fr:** Eric M. Friedlander, *Etale homotopy of simplicial schemes*, Annals of Mathematics Studies 104 (1982). [Publisher citation](https://doi.org/10.1515/9781400881499). Proposition 5.9 and Theorem 11.5, cited by locator without text.
- **SGA1:** A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental*, revised arXiv:math/0206203v2. [Open edition](https://arxiv.org/abs/math/0206203v2). Exposé XIII, Proposition 4.6, for the characteristic-zero geometric finite-cover product formula; Exposé IX, Theorem 6.1, for the arithmetic sequence consumed through EtaleCohomologyFoundations.
