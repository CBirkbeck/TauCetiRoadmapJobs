# Roadmap: the C_st-conjecture for dagger varieties

**Summary.** Build the fundamental period diagram for smooth dagger varieties, identify its two bundle-cohomology defects, and prove comparison for products of varieties with nonnegative de Rham slopes, algebraic analytifications, almost proper varieties, the specified tube complements, and proper times Stein spaces. For small varieties the diagram is equivalent to acyclicity, a curvature condition, and the signed height identity. Recover arithmetic Hyodo–Kato and filtered de Rham cohomology from pro-étale cohomology with Galois action, and recover the extended period modules from the geometric cohomology functor. The unrestricted assertions of CN25 Conjectures 6.21 and 9.1 are research statements; the end theorems here have the hypotheses of CN25 Theorems 8.1, 9.3 and 9.8 and Proposition 8.17 (CN25 lines 2185, 2466, 2713, 2735, 2821).

## Scope and ownership

This roadmap owns the C-lattice version of filtered Frobenius–monodromy modules, its particular modifications and bounded period-Hom theorems; the analytic fundamental square and its cohomological filtration; the qBC filtration of analytic cohomology and its defect, height and equivalence theorems; the geometric comparison classes; exhaustion obstructions and proper-times-Stein comparison; and arithmetic and geometric recovery. Its filtered module adds an embedded de Rham lattice to the arithmetic coefficient module. Its bundle construction is the application of geometric gluing to that pair.

The following mathematical objects have one supplier and are not reconstructed here:

- Mathlib supplies the algebraic period-ring carriers `BDeRhamPlus` and `BDeRham`, finite generation `Module.Finite`, freeness `Module.Free`, bundled modules `ModuleCat`, the Witt-fraction-field Frobenius carrier `WittVector.Isocrystal` with its one-dimensional classification `WittVector.isocrystal_classification`, and the categorical predicate `CategoryTheory.BicartesianSq`.
- Tau Ceti supplies adic spaces and absolute Fargues–Fontaine period-domain and topological quotient geometry. The coherent geometric curve and its bundle theory are VectorBundlesAndIsocrystals VB1 and VB2 classification.
- AdicSpacesPartII R0–R1 owns morphisms, completed tensors and analytification. Dagger spaces, their de Rham complex, strict differentials, the dagger–rigid comparison, logarithmic forms and formal tubes are AdicSpacesPartIV F1.7–F1.12 and F1.16. Its strict-differential and finite-dimensional Künneth theorems have discretely valued bases; the C-valued extensions are exact contracts below.
- PadicHodgeTheory §§0.2–0.5, 3.4–3.7 and 5.2 owns generic rational period structures, arithmetic filtered modules, admissibility and arithmetic period functors. VectorBundlesAndIsocrystals VB0–VB3 owns finite isocrystals, geometric bundle classification, slope cohomology and finite Banach–Colmez theory. Reasonable Pairs and qBC form the Part II extension of that finite BC direction, specified by the contract below rather than a second finite BC theory here.
- LocallyAnalyticDistributions §§0.0–0.2 owns nonarchimedean locally convex categories, strict derived categories, their left hearts and compact-type duality. Its distribution-algebra extensions do not supply the additional extension-duality contract below.
- CohomologyComparisons §§4.8–4.9 owns algebraic period comparison and dual descriptions. Its §4.9a owns analytic Hyodo–Kato realization; §§4.10–4.11 state proper rigid comparison over K and C. Those two comparison targets are imported, including their induced filtration, and have no duplicate theorem section here. The proper fundamental square remains an application in Layer 1.
- ClassicalAdicEtaleCohomology §§1.3–1.4, 8.4 and 9.7 owns the analytic coefficient, proper-base-change and trace framework. Its integral proper-factor contract below is stronger than a prime-to-p torsion statement.

The qBC extension and the model-free dagger extension of the comparison direction are exact supplier contracts. They are not replaced by generic propositions standing for their conclusions. The positive crystalline affinoid equality and the continuous splitting each retain a separate proof obligation. Neither is an input to the geometric comparison classes or to the two principal recovery theorems.

## Conventions

Fix a prime p. Let K be complete discretely valued of characteristic zero, with perfect countable residue field k of characteristic p. Put F=W(k)[1/p], let Fⁿʳ be the algebraic maximal unramified extension inside K̄, and put C=completion(K̄). Spaces are separated, taut and countable at infinity. All diagrams and cohomology use these hypotheses; equal-characteristic fields and nonreduced nonsmooth thickenings do not acquire the comparison theorems. Completion of Fⁿʳ is an explicit scalar extension, used in the crystalline splitting and the positive crystalline refinement (CN25 §1.3, pp.7–8, lines 329–381; §7.3, lines 2394–2406).

Use Nφ=pφN, diagonal tensor operators and the period coordinate u with N(u)=−1 and φ(u)=pu. The Fontaine period t satisfies φ(t)=pt and g(t)=χ(g)t. Twisting M by {−r} multiplies φ by p⁻ʳ and leaves N unchanged. The degree of the associated filtered bundle is t_H−t_N; it is this degree that is used for nonnegative slopes. Cohomological shifts are cohomological shifts: a group in degree i is placed at [−i]. All spaces and functor categories live in fixed universes, with the category of sympathetic C-algebras made small in a larger universe; no arbitrary enlargement is used to replace its natural transformations by all C-point maps (CN25 §5.1, pp.31–33, lines 1600–1677; §5.3, p.36, lines 1798–1832).

Let LH(C_Q_p) be the abelian left heart of the strict derived category of locally convex Q_p spaces. Tildes denote its cohomology; untilded objects denote their classical realizations. VS denotes the source's Vector Space category on sympathetic algebras. TVS consists of functors from those algebras to LH(C_Q_p) satisfying the boundedness condition on algebra maps in Definition 4.1; its maps are natural transformations. Evaluation at C yields an ordinary locally convex space only for classical objects. Hom_VS and Hom_TVS are neither arbitrary linear maps of C-points nor maps required to be period-linear (CN25 Definition 4.1, p.20, line 960; Definition 4.5, pp.21–22, line 1007).

A torsion period Pair means the left-heart object represented by an injection W₁→W₂ of topological B_m-modules for some m≥1, where B_m=B_dR⁺/tᵐ, followed by the specified completed scalar extension to sympathetic algebras. A reasonable B_m-module has its module Fréchet topology or is a c-compact inductive limit of Banach B_m-modules. A reasonable Pair has both terms reasonable and of the same type. The qBC category consists of TVS objects with positive finite-BC subobject, such a torsion Pair as middle graded piece, and negative finite-BC final quotient; its height is the sum of the two finite-BC heights. These are the imported meanings, including the natural transformations and the original topologies (CN25 Definitions 4.4–4.5, CN25 lines 992–1025; §§4.3–4.4, CN25 lines 1259–1263, 1339–1341).

Write Fʳⁱ=Hⁱ(FʳRΓ_dR), Bⁱ=Hⁱ_dR(X/B_dR⁺), Filʳⁱ=im(Fʳⁱ→Bⁱ) and Aʳⁱ=ker(Fʳⁱ→Bⁱ). The induced lattice in Bⁱ[1/t] is F⁰ of the localized cohomological filtration. Derived completed tensors and derived simultaneous invariants precede taking cohomology. The square has maps a:H→X, b:H→F, c:X→B and d:F→B, with u=(a,b) and v=(c,−d). BC and qBC height is signed: ht(Q_p)=1, while a reasonable torsion B_dR⁺-Pair has height 0. Zero objects have no HN slopes, so weak admissibility and acyclicity include zero (CN25 lines 2294–2334, 2350–2381).

**Checks.**

- For φ(e₀)=e₀, φ(e₁)=pe₁ and N(e₁)=e₀, N(e₀)=0, one has Nφ(e₁)=pe₀=pφN(e₁). With diagonal monodromy, N(e₁+ue₀)=0 while N(e₁−ue₀)=2e₀. Both remain distinct for p=2 since the coefficient field has characteristic zero.
- The lattices B_dR⁺ and tB_dR⁺ on the trivial Frobenius line give O and O(−1), with degrees 0 and −1. A Hodge jump 1 with Newton number 0 gives lattice t⁻¹B_dR⁺ and degree 1. Reversing t_H−t_N reverses these values.
- At the degree-zero point, u(1)=(1,1) and v(1,1)=1−1=0; the sum would give 2. For the dual of the jump-one line, the jump is −1: Filʲ(D∨)=(Fil¹⁻ʲD)⊥.
- In the two-term complex K→K with identity differential, both cohomology groups are 0; in K→K with zero differential they are K in degrees 0 and 1. Moving the second group to [1] instead of [−1] changes its degree.
- For a torsion module B_dR⁺/t the height is 0, whereas Q_p has height 1 despite C-dimension 0. These distinguish height, Q_p-dimension, BC curvature and bundle slope.

- On the permutation representation Q_p³ of S₃, let g=(12) and h=(23). Then gh(e₁)=e₂ whereas hg(e₁)=e₃. The contragredient action (g·f)(v)=f(g⁻¹v) gives gh(e₁∨)=e₂∨ as well; omitting the inverse reverses the multiplication order. The same rule for the cyclic transposition squares to identity (CN25 §5.1.1, p.31, CN25 line 1605).
- Over K=Q₂(√2), with π=√2, the p-normalized logarithmic coordinate u equals 2u_π for compatible roots. Hence N(u_π)=−1/2 and N(u)=−1. Over unramified Q₃ the same p-coordinate has N(u)=−1. Thus the generic period coordinate is p-normalized rather than a silent uniformizer normalization (PadicHodgeTheory §0.5; CN25 §5.4.1, CN25 line 1856).

## Exact supplier contracts

### From Mathlib

Use `BDeRhamPlus` and `BDeRham` in `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` and `:88`, under a commutative ring R, prime p, p nonunit in R, and p-adic completeness. The first is the completion of the p-inverted Witt tilt along the theta kernel. The second localizes at completed images of generators of that kernel. The geometric Fontaine complete-DVR and field identifications and their natural topologies are part of the rational-period supplier contract. At p=0 in R these carriers are zero, so the geometric nonzero field hypotheses cannot be omitted.

Use `WittVector.Isocrystal` and `WittVector.isocrystal_classification` in `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` and `:180` for Frobenius-linear automorphisms over the Witt fraction field and the one-dimensional classification over an algebraically closed residue field. The carrier itself has no finite-dimensionality, monodromy, descent or filtration condition; the classification theorem requires dimension one. General finite coefficients and higher-rank slopes are the specified suppliers below.

Use `Module.Free` from `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` for existence of a basis and `Module.Finite` from `Mathlib/RingTheory/Finiteness/Defs.lean:121` for finite generation of the top submodule. They are separate conditions. `ModuleCat` in `Mathlib/Algebra/Category/ModuleCat/Basic.lean` gives bundled algebraic modules and linear maps. Use `CategoryTheory.BicartesianSq` in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56` for a square that is both a pullback and a pushout; strict exactness must be interpreted in the supplied left heart.

### From Tau Ceti

Use `TauCeti.AdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean` for the adic carrier; `TauCeti.FarguesFontaine.spaY` and `TauCeti.FarguesFontaine.frobeniusHomeomorph` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean` for the absolute period domain and Frobenius; and `TauCeti.FarguesFontaine.spaX` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean` for its topological quotient. The relative coherent curve, completed untilt local ring and modification interfaces used below are consumed through VectorBundlesAndIsocrystals VB1. None of these imports is a construction of dagger cohomology.

### From TauCetiRoadmap.AdicSpacesPartII

R0.5, completed tensor products of Banach modules, supplies the separated completion of the projective ultrametric tensor seminorm and its universal property. R0.10–R0.17 supplies properness, continuous differentials and smooth morphisms. R1 supplies analytification and the rigid–adic comparison. Preserve completeness, Hausdorffness and the actual scalar topologies in every specialization.

### From TauCetiRoadmap.AdicSpacesPartIV

F1.7–F1.9 supplies dagger spaces, completion, strict neighbourhoods, continuous differentials and the overconvergent de Rham complex. F1.9 supplies strict differentials in its stated discretely valued range; F1.11 supplies its stated finiteness and discretely valued quasi-compact Künneth theorems. F1.12 and F1.16 supplies logarithmic complexes and formal generic fibres and tubes; these contracts keep their own resolution and finiteness hypotheses.

What AdicSpacesPartIV must provide (gap:geometric-finiteness-tubes): Provide finite-free B_dR⁺ and HK cohomology for small geometric classes over C, the strict-differential and finite-cohomology Künneth extensions over C, global proper-pair resolution in characteristic zero and the specified tube complements with compatible HK and unfiltered de Rham restrictions, full-lattice containment and common radius bounds on every Čech intersection used for union descent.

### From TauCetiRoadmap.PadicHodgeTheory

§§0.2–0.5 supplies the geometric rational periods, their embeddings, t, Frobenius and N(u)=−1; §§3.4–3.7 and 5.2 supplies finite (φ,N,G_K)-modules, weak admissibility, the semistable fundamental complex in its stated range. The acyclic smooth-Galois reconstruction and bounded subfiltration are the additional contract below (CN25 Lemmas 5.3–5.4 and Theorem 5.8–Corollary 5.10, CN25 lines 1650–1677, 1730–1773). Smooth Galois Hom is the union of continuous Hom equivariant for G_L over finite extensions L/K, with its natural semilinear descent action. The Hodge filtration is the decreasing convolution filtration and its dual is annihilator in degree 1−j. Its finite-K results alone are not an assertion over every discretely valued K.

What PadicHodgeTheory must provide (gap:bounded-arithmetic-filtration): Provide continuous smooth-Galois period-Hom reconstruction for every acyclic arithmetic filtered (φ,N,G_K)-module over a complete discretely valued K with perfect countable residue field, together with a weakly admissible subfiltration that preserves any specified [0,r] Frobenius and filtration bounds.

What PadicHodgeTheory must provide (gap:positive-crystalline-hom): Provide the additional positivity criterion for the restricted natural period-Hom maps in the affinoid refinement that proves exact B_cris⁺ equality, distinguishing B_cris⁺ from B_max⁺ and retaining Frobenius compatibility after extension to the completed maximal unramified coefficient field.

What PadicHodgeTheory must provide (gap:galois-period-hom-vanishing): Provide the continuous G_L-equivariant vanishing Hom(C,B_dR)=0 and Hom(tʲB_dR⁺/tᵏB_dR⁺,B_dR)=0 for integers j<k and finite extensions L/K, with compatible topologies, density and Tate twists, as in CN25 Proposition 2.14(iv), for every complete discretely valued K of characteristic zero with perfect countable residue field.

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

VB0, Coefficient category and rational blocks, supplies Dieudonné–Manin decomposition and tensor/dual slopes. VB1, The exact tensor isocrystal-to-bundle functor, Slope-sensitive cohomology of standard bundles, Untilts and completed local rings, and Harder–Narasimhan filtration of geometric bundles, supplies the curve, its local period rings and slope cohomology. VB2 classification, Geometric classification of vector bundles and Hom and extension calculus for geometric bundles, identifies slope-zero bundles with sums of O. VB3, Sympathetic algebras and the classical category, Curvature, the tilted coherent heart and HN invariants, and Period modules and curvature calculus, supplies finite BC, its curvature filtration, Le Bras realization and the formula ht(H⁰E)−ht(H¹E)=rank E. In particular H¹(O(−1)) has height −1, whereas O has H⁰=Q_p of height 1. A torsion sheaf at a point other than ∞ has height 0 and positive curvature, so positive curvature alone gives no strict height inequality.

What VectorBundlesAndIsocrystals must provide (gap:period-lattice-gluing): Provide effective gluing of a finite projective B_e-module to a full B_dR⁺ lattice over their identified B_dR realization, compatibly with tensor, dual and cohomology, and identify the bounded simultaneous period eigenspace for every finite (φ,N)-module of slopes in [0,r] with the sections of its nonnegative-slope modification.

What VectorBundlesAndIsocrystals must provide (gap:qbc-pairs): Extend finite BC theory to the natural TVS category on sympathetic algebras, reasonable torsion B_dR⁺-Pairs and qBC objects, with canonical curvature filtration, signed additive height, dense finite-torsion presentations, compatibility with finite BC and vanishing of countable derived inverse limits of BC systems.

What VectorBundlesAndIsocrystals must provide (gap:natural-period-hom): Provide bounded-image vanishing of arbitrary VS natural Hom from finite torsion period modules to B_dR, the corresponding natural Ext¹ vanishing, the rank-equals-height period-Hom theorem for finite BC objects of curvature ≤0, and its comparison with TVS Hom on the objects used in geometric recovery.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.0 supplies the nonarchimedean locally convex categories, projective and inductive tensors, strict derived categories and abelian left hearts; §0.2 supplies strict-sequence and three-space results. Use its non-Hausdorff category when forming the heart, with Hausdorffness imposed where used. Compact-type regularity and strong duality are used with their coefficient-field hypotheses, rather than transferred from finite extensions of Q_p to arbitrary C without proof.

What LocallyAnalyticDistributions must provide (gap:compact-extension-duality): Prove strictness of the strong-dual sequence and continuity of the bidual comparison for the compact-type extensions occurring in the syntomic splitting, with their actual coefficient-field hypotheses, or supply an alternative valid continuous period-linear splitting argument.

### From TauCetiRoadmap.CohomologyComparisons

§§4.8–4.9 supplies algebraic comparison and dual period descriptions, and §4.9a supplies analytic HK with its algebraic unramified coefficients and model agreement. §§4.10–4.11 supplies smooth proper rigid C_st comparison without a semistable-model assumption over K and C, including the induced filtration. The proper arithmetic dual Hom is strict for the weak topology, as in CN25 Remark 6.7, p.41, line 2047. Over C the comparison uses F⁰ of localized cohomology for its modification, as in CN25 Theorem 6.8 proof, p.42, line 2086. This is the input to the proper case of the fundamental square.

What CohomologyComparisons must provide (gap:analytic-syntomic-descent): Provide the model-free smooth dagger HK, B_dR⁺ and syntomic complexes with their strict derived completed comparisons, slope bound [0,min(i,dim X)], natural VS and TVS realizations, stable-range syntomic/pro-étale period map, filtered fiber triangle, Stein/affinoid syntomic diagram over C with its strict maps and cohomological topologies, and countable exhaustion descent, including comparison of derived systems with rigid completions after cofinal strict shrinkings.

What CohomologyComparisons must provide (gap:geometric-log-periods): Provide algebraic comparison over C, analytic HK GAGA and the proper logarithmic period sequence for smooth proper rigid pairs with simple normal crossings boundary, retaining the map from the logarithmic filtration to the naive analytic filtration and its compatibility with the common HK and unfiltered de Rham realizations.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§§1.3–1.4 supplies the analytic étale/pro-étale coefficient dictionary. §8.4 supplies proper base change and the projection formula in its stated coefficient range; §9.7 supplies proper pairings and integral traces. The perfect integral p-adic coefficient object needed in Layer 4 is the cohomology of the proper factor, not of an arbitrary second factor.


What ClassicalAdicEtaleCohomology must provide (gap:proper-rigid-integral-etale): Provide perfect integral Z_p-cohomology for a smooth proper rigid space over C, proper base change for its projection to any smooth rigid factor and the compatible rational étale/pro-étale realization on the quasi-compact completions used in strict Stein exhaustions.

## How to read the build

Layer 0 constructs the C-lattice module and its bounded period-Hom calculations. Layer 1 forms the analytic square on the supplied cohomology and proves its proper, Stein and affinoid instances. Layer 2 identifies the two failure objects and proves qBC, height and equivalence theorems; its crystalline and syntomic splitting branch has its own functional-analysis input. Layer 3 proves the geometric slope classes using torsion modifications. Layer 4 passes exactness through countable exhaustions and establishes proper-times-Stein comparison without smallness. Layer 5 proves recovery from the arithmetic representation and from the geometric TVS functor, then treats the stronger positive crystalline refinement. The mathematical specification is this README; [Suggested.lean](Suggested.lean) records the headline statability boundary at the pinned APIs.

## Layer 0: filtered period modules and modified bundles

### 0.1 filtered modules with a de Rham lattice

A filtered (φ,N)-module over C is a pair (M,L): M is finite dimensional over Fⁿʳ, φ is a bijective σ-semilinear map, N is Fⁿʳ-linear with Nφ=pφN, and L is a finite free B_dR⁺-submodule of M⊗B_dR spanning that module after inverting t. Morphisms are φ,N-equivariant maps carrying L into L′. The topology and period embeddings are the imported ones; C is not embedded canonically in B_dR⁺.

(CN25 §5.3.1, p. 36, CN25 line 1798.)

A proof route uses the following steps. Use the existing finite Frobenius–monodromy coefficients over Fⁿʳ; add only the lattice datum. Use localization to express spanning and the induced period-linear morphism.

The defining data and their natural maps have the following API.

- Construct (M,L) from the stated operator and full-lattice data.
- A morphism is determined by its Fⁿʳ-linear map on M.
- The lattice includes into M⊗B_dR and localizes isomorphically.
- Tensor uses diagonal operators and L⊗L′; dual uses the B_dR⁺-dual lattice.
- A filtered module with smooth descent over K gives L=Fil⁰(M_K⊗B_dR), with convolution filtration, after extension to Fⁿʳ.
- Extension to period modules preserves identity and composition.

**Checks.**

- The zero module with zero lattice has rank 0 and is an object; requiring a positive rank would exclude it.
- For M=Fⁿʳ, φ=σ, N=0, every tᵐB_dR⁺, m∈Z, is a full lattice; changing m changes the embedded lattice.
- The zero submodule of B_dR is not a lattice in the rank-one trivial module.

**Checks.**

- Identity and composition preserve the lattice.
- No Galois action is required over C.

*Needs:* PadicHodgeTheory §3.4, finite Frobenius–monodromy modules; PadicHodgeTheory §§0.2–0.5, coefficient embeddings and period structures; Mathlib `Module.Free` and `Module.Finite`.

### 0.2 the bundle of a filtered module

Associate E(M,L) on the geometric Fargues–Fontaine curve by gluing the finite projective B_e-module `(M⊗B_st)^(N=0,φ=1)` away from ∞ to L at the completed local ring B_dR⁺, using their common B_dR-realization. Put V_st(M,L)=H⁰(E), equivalently the kernel of `(M⊗B_st)^(N=0,φ=1)`→(M⊗B_dR)/L. These are actual coherent bundles and section functors, not arbitrary modules labelled as bundles.

(CN25 §5.3.1, p. 36, CN25 line 1803.)

A proof route uses the following steps. Apply the imported modification/gluing theory for bundles with a B_dR⁺ lattice. Identify H⁰ with the equalizer of the two restriction maps.

The defining data and their natural maps have the following API.

- The punctured restriction has section module `(M⊗B_st)^(N=0,φ=1)`.
- Completion at ∞ is L with its inclusion into M⊗B_dR.
- A morphism induces a bundle map; identity and composition agree.
- A section is exactly a period-invariant vector whose de Rham image belongs to L.
- The bundle of a tensor product is the tensor product of the bundles; use the existing scheme sheaf tensor and dual objects.

**Checks.**

- For the trivial module with L=B_dR⁺ the bundle is O and V_st=Q_p.
- For the same M and L=tᵐB_dR⁺ the bundle is O(−m); m=1 has negative slope.
- The zero pair gives the zero bundle and zero sections.

**Checks.**

- Recover the prescribed two restrictions and their common localization.

*Needs:* §0.1; VectorBundlesAndIsocrystals VB1, Untilts and completed local rings; the period-lattice-gluing contract.

### 0.3 weak admissibility and acyclicity over c

A pair (M,L) is weakly admissible when E(M,L) is semistable of slope zero; it is acyclic when every Harder–Narasimhan slope of E(M,L) is nonnegative. Both predicates hold for the zero object. The associated-bundle degree is t_H−t_N. It is opposite to the filtered degree t_N−t_H in PadicHodgeTheory §3.4; its destabilizing slopes use t_H−t_N and fix the dictionary for arithmetic comparison. Bundle slopes and BC curvature are distinct invariants.

(CN25 Definition 5.13 and Remark 5.14(i), p. 36; §5.1.2, p. 32, CN25 line 1807.)

A proof route uses the following steps. Use the geometric bundle slope filtration, with zero treated by the empty slope list. Transport the K definition along the filtered-module bundle comparison.

The defining data and their natural maps have the following API.

- Acyclicity is equivalent to all bundle slopes being ≥0.
- Weak admissibility implies acyclicity.
- Both predicates are invariant under isomorphism.
- Tensor products of acyclic pairs are acyclic, by addition of bundle slopes.
- An acyclic arithmetic filtered module gives an acyclic pair over C; likewise for weak admissibility.

**Checks.**

- The zero pair has the empty slope list and is acyclic and weakly admissible; requiring a slope-zero nonzero summand fails.
- The trivial M with L=t⁻¹B_dR⁺ gives O(1): it is acyclic and is not weakly admissible.
- The trivial M with L=tB_dR⁺ gives O(−1) and is not acyclic.

**Checks.**

- The degree sign matches weak admissibility t_H(D′)≤t_N(D′).

*Needs:* §0.2; VectorBundlesAndIsocrystals VB1, Harder–Narasimhan filtration of geometric bundles; PadicHodgeTheory §5.2, the arithmetic sign dictionary.

### 0.4 cohomological criteria for acyclicity

For a pair (M,L), acyclicity is equivalent to H¹(E(M,L))=0, to surjectivity of `(M⊗B_st)^(N=0,φ=1)`→(M⊗B_dR)/L, and to the existence of a sublattice L′⊆L for which (M,L′) is weakly admissible. Weak admissibility is equivalent to E≅O^rank(M), and also to finite Q_p-dimension of V_st together with exactness of its fundamental sequence. In that case V_st⊗B_st≅M⊗B_st and V_st⊗B_dR⁺≅L.

The full fundamental sequence means 0→V_st→`(M⊗B_st)^(N=0,φ=1)`→(M⊗B_dR)/L→0, with the period embedding as its last map. For a weakly admissible pair the two evaluation maps have sources V_st⊗B_st and V_st⊗B_dR⁺ and targets M⊗B_st and L, respectively.

For r≥0, if the Newton slopes are in [0,r] and M⊗B_dR⁺⊆L⊆M⊗t⁻ʳB_dR⁺, prove the bounded refinement: the weakly admissible sublattice can be chosen with M⊗B_dR⁺⊆L′⊆L and the same bounds. The arithmetic counterpart keeps Fil⁰=M_K and Filʳ⁺¹=0 while shrinking only a positive nonzero filtration step. This is the C-lattice refinement used in the proof of Proposition 5.23 (CN25 line 1918), alongside the arithmetic Lemma 5.4 (CN25 line 1670).

(CN25 Remark 5.14(ii)–(iii), p. 36; Lemma 5.3, pp. 32–33, CN25 line 1821.)

A proof route uses the following steps. Apply classification and H⁰/H¹ of slope bundles. Compute H¹ as the cokernel of the period-to-lattice-quotient map using the two-chart complex. Shrink a lattice to a slope-zero modification using the argument of Lemma 5.3; classification identifies its sections and period evaluations.

**Checks.**

- For L=t⁻¹B_dR⁺ the smaller lattice B_dR⁺ is admissible; reversing that inclusion fails for L=tB_dR⁺.

*Needs:* §0.3; VectorBundlesAndIsocrystals VB1, Slope-sensitive cohomology of standard bundles; VB2 classification, Geometric classification of vector bundles and Hom and extension calculus for geometric bundles.

### 0.5 bounded eigenspaces and period kernels

For r∈N, M with φ-slopes in [0,r], and a lattice L satisfying M⊗tʳB_dR⁺⊆tʳL⊆M⊗B_dR⁺, define the VS-valued X_stʳ(M)=`(M⊗B_st⁺)^(N=0,φ=pʳ)` and V_stʳ(M,L)=ker(X_stʳ(M)→(M⊗B_dR⁺)/tʳL). The bounded positive ring is essential: the displayed quotient map is not defined on the unrestricted B_st eigenspace. In the acyclic case this is a short exact sequence and V_stʳ=tʳV_st inside M⊗B_dR. More generally for k≥0 the t⁻ᵏB_st⁺-version maps onto (M⊗t⁻ᵏB_dR⁺)/tʳL iff the pair is acyclic, with the same kernel. For any such M, X_stʳ(M) is a finite BC object of curvature ≤0 and height dim M: it is H⁰ of the nonnegative-slope bundle attached to M{−r} with lattice M⊗B_dR⁺.

The period quotient is a finite-length B_dR⁺ module; after multiplying by tʳ its length is determined by the embedded lattice, not just its abstract free rank. The finite-BC height assertion follows from the identified bundle and the Euler-height theorem; the later period-Hom comparison additionally needs the rank-equals-height Hom theorem.

(CN25 Remark 5.16, pp.36–37; Proposition 5.18, p.37; Proposition 5.20, p.38, CN25 line 1833.)

A proof route uses the following steps. Form invariant subobjects of the imported period Vector Spaces and the indicated kernel. Use the VB1 gluing comparison to identify X_stʳ(M) with H⁰(E(M{−r},M⊗B_dR⁺)); its slopes are r minus the Newton slopes of M. Standard-bundle cohomology, the Le Bras equivalence and Euler height give finite BC, curvature ≤0 and height dim M. Use Remark 5.16 and the graded comparison of successive t-denominator levels to prove the criterion.

The defining data and their natural maps have the following API.

- v belongs to V_stʳ exactly when N(v)=0, φ(v)=pʳv and its image belongs to tʳL.
- A filtered morphism with the fixed bounds induces maps of both spaces, preserving identity and composition.
- The kernel includes in X_stʳ and hence in M⊗B_dR⁺.
- For an acyclic pair the quotient map is onto in VS and the sequence with V_stʳ is exact.
- The map tʳ identifies V_st with V_stʳ; it is the period realization of the Tate twist, not equality of Galois actions.

**Checks.**

- For r=0, M trivial and L=B_dR⁺, X_st⁰=V_st⁰=Q_p and the quotient is zero.
- For trivial M, L=B_dR⁺, r=1, the sequence is 0→Q_p·t→`(B_cris⁺)^(φ=p)`→C→0.
- For r=0 and L=t⁻¹B_dR⁺ the upper bound fails, although the pair is acyclic; do not apply the bounded theorem.
- Take φ(e₀)=e₀, φ(e₁)=pe₁, N(e₀)=0 and N(e₁)=e₀. With φ(u)=pu and N_B=−d/du, e₁+ue₀ belongs to X_st¹(M); e₁−ue₀ has diagonal monodromy 2e₀ and does not. This tests the imported monodromy sign.

**Checks.**

- All maps are natural Vector Space maps, whose C-evaluations are the indicated period maps.

*Needs:* §§0.1–0.4; PadicHodgeTheory §§0.4–0.5, positive periods; the period-lattice-gluing contract; VectorBundlesAndIsocrystals VB1, Slope-sensitive cohomology of standard bundles, and VB3, Le Bras equivalence and Euler–Poincaré height formula.

### 0.6 generation of the de Rham lattice

If M has φ-slopes in [0,r], X_stʳ(M)(C) spans M⊗B_dR⁺ over B_dR⁺. This is generation by the bounded simultaneous N=0,φ=pʳ eigenspace, without a filtration or Galois hypothesis.

(CN25 Lemma 5.17, p. 37, CN25 line 1852.)

A proof route uses the following steps. Reduce modulo t by Nakayama. Use the imported coordinate with N_B=−d/du. The horizontal lift is exp(uN_M)m, since (N_M−∂/∂u)exp(uN_M)m=0; its inverse exp(−uN_M) removes monodromy and reduces to B_cris⁺. This translates the source coordinate convention. Apply Dieudonné–Manin blocks of slope a/h and `U_(h,rh-a)`; independence of the conjugate `Q_(pʰ)`-characters shows their reductions span Cʰ.

**Checks.**

- A slope-zero trivial rank-one block at r=0 already generates the whole lattice.

*Needs:* §0.5; VectorBundlesAndIsocrystals VB0, Dieudonné–Manin classification of finite isocrystals, and VB3, The fundamental untilt sequence and degree-one divisors; PadicHodgeTheory §0.5, polynomial semistable coordinate.

### 0.7 period-valued Hom from an eigenspace

For M with φ-slopes in [0,r], evaluation induces B_dR- and B_st-linear isomorphisms M∨⊗B_dR≅Hom_VS(X_stʳ(M), B_dR) and M∨⊗B_st≅Hom_VS(X_stʳ(M), B_st). Hom here means natural Q_p-linear Vector Space morphisms, not merely linear maps of C-points and not maps assumed period-linear.

(CN25 Proposition 5.18 and Remark 5.19, pp.37–38; Proposition 3.27(i), p.20, CN25 line 1870.)

A proof route uses the following steps. Use generation for injectivity. Use the finite-BC realization and height dim M of X_stʳ(M), then the period-Hom theorem of Proposition 3.27(i), pp.19–20: for curvature ≤0 the B_dR-valued natural Hom module is finite free of rank equal to height. This gives the required rank equality and surjectivity over B_dR; Euler height alone is not a Hom theorem. Choose an admissible lattice and use its finite-dimensional period realization to force B_st-valued functionals to have B_st coefficients.

**Checks.**

- The identifications are the evaluation pairings and are functorial in M.

*Needs:* §§0.4–0.6; the natural-period-hom contract, including Proposition 3.27(i) rank equality and torsion Hom/Ext.

### 0.8 period-valued Hom from an acyclic kernel

For an acyclic pair (M,L) with the bounds of §0.5, evaluation gives M∨⊗B_dR≅Hom_VS(V_stʳ(M,L), B_dR) and M∨⊗B_st≅Hom_VS(V_stʳ(M,L), B_st). These are module isomorphisms for the indicated period rings.

(CN25 Proposition 5.20 and Remark 5.21, p. 38, CN25 line 1896.)

A proof route uses the following steps. Apply Hom into B_dR to 0→V_stʳ→X_stʳ→(M⊗B_dR⁺)/tʳL→0. Use vanishing of Hom and Ext¹ from the finite-length B_dR⁺ quotient into B_dR, then the preceding computation. For B_st choose a weakly admissible sublattice L′⊆L and evaluate on its finite Q_p period space.

**Checks.**

- The sublattice direction is L′⊆L. The required Ext¹ has target B_dR.

*Needs:* §§0.4–0.5 and 0.7; the natural-period-hom contract, including finite torsion natural Ext¹ into B_dR.

### 0.9 period reconstruction modulo a power of t

Under the same acyclicity and boundedness assumptions, for k≥2r the evaluation map M∨⊗(B_dR⁺/tᵏ)→Hom_VS(V_stʳ(M,L),B_dR⁺/tᵏ) has kernel killed by tʳ and cokernel killed by t²ʳ. In particular both are killed by t²ʳ. No isomorphism for finite k is asserted.

(CN25 Proposition 5.23, pp. 38–39, CN25 line 1913.)

A proof route uses the following steps. Choose an admissible L′ between M⊗B_dR⁺ and L with the same bounds. Compare the kernels for L′ and L; their quotient is killed by tʳ. Compare their Hom groups with the two lattice quotients. The outside composite is multiplication by tʳ; the second torsion error gives t²ʳ on the cokernel.

**Checks.**

- For r=0 the asserted annihilators are 1, so the map is an isomorphism.

*Needs:* §§0.4–0.5 and 0.8; the bounded sublattice refinement in §0.4; the finite torsion Hom interface of the natural-period-hom contract.

### Examples

For M=Fⁿʳ with φ=σ and N=0, the lattices tᵐB_dR⁺ for m=−1,0,1 give O(1), O and O(−1). Thus the first two are acyclic, only the middle is weakly admissible, and the last has nonzero H¹ of height −1. For the rank-two monodromy module of the conventions, the horizontal generator is e₁+ue₀. At p=2 its wrong-sign counterpart still has monodromy 2e₀≠0 (CN25 §5.3, p.36, lines 1803–1832; Lemma 5.17, line 1852).

### Dependencies

Mathlib module and period carriers; PadicHodgeTheory §§0.2–0.5, 3.4–3.7 and 5.2; VectorBundlesAndIsocrystals VB0–VB3; period-lattice-gluing, natural-period-hom and bounded-arithmetic-filtration contracts.

## Layer 1: the analytic fundamental diagram

### 1.1 filtered cohomology and its image filtration

For a smooth dagger X/C use the analytic cohomology package of the exact analytic-syntomic-descent contract to set Bⁱ=Hⁱ_dR(X/B_dR⁺), Fʳⁱ=Hⁱ(FʳRΓ_dR(X/B_dR⁺)), DRʳⁱ=Hⁱ(RΓ_dR/Fʳ), Filʳⁱ=im(Fʳⁱ→Bⁱ) and Aʳⁱ=ker(Fʳⁱ→Bⁱ). Set Hʳⁱ=Hⁱ_proét(X,Q_p(r)) for i≤r and Xʳⁱ=`(Hⁱ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ)`; joint invariants at complex level are derived. Tildes denote left-heart cohomology, ordinary letters its classical part, and bold letters the natural TVS/VS realization when supplied. Filter Bⁱ[1/t] by images of filtered complexes. Fʳⁱ is not identified with Filʳⁱ.

(CN25 §7.1.1 and §§7.2.1–7.2.2, pp. 46–47; Proposition 6.1, pp. 39–40 (import contract), CN25 line 2294.)

A proof route uses the following steps. Take the cohomology and image/kernel maps of the filtered distinguished triangle. Use the period morphism only in the truncation range i≤r; retain syntomic cohomology outside it.

The defining data and their natural maps have the following API.

- There are natural Fʳⁱ→Bⁱ and Bⁱ→DRʳⁱ with their connecting map DRʳ,ⁱ⁻¹→Fʳⁱ.
- Fʳⁱ/Aʳⁱ identifies with Filʳⁱ with the induced categorical image topology.
- The maps Fʳ⁺¹→Fʳ induce Filʳ⁺¹ⁱ⊆Filʳⁱ and define the induced filtration on Bⁱ[1/t].
- Pullback preserves all cohomology maps, identity, composition and period comparison.
- Over K, Bⁱ≅Hⁱ_dR(X/K)⊗̂_K B_dR⁺; over C no canonical C-linear scalar-extension presentation is assumed.

**Checks.**

- For a geometric point, B⁰=B_dR⁺, Fʳ⁰=tʳB_dR⁺ and Aʳ⁰=0.
- For a positive-dimensional smooth dagger affinoid at degree r=1, A¹¹≅O(X)/ker d; for a disc this is O(X)/C and is nonzero.
- For i<0 all the listed cohomology groups vanish; in particular the degree-zero failure sequence has no H⁻¹ term.

**Checks.**

- The diagram is first formed in the left heart; taking classical parts is explicitly labelled.

*Needs:* AdicSpacesPartIV F1.7 and F1.9, dagger spaces and de Rham complexes; LocallyAnalyticDistributions §0.0, strict derived left heart; CohomologyComparisons §4.9a and the analytic-syntomic-descent contract.

### 1.2 small dagger varieties

A smooth dagger variety X/C is small when Bⁱ=Hⁱ_dR(X/B_dR⁺) is finite free over B_dR⁺ for every i≥0, as in the operational convention of §7.2. The analytic Hyodo–Kato isomorphism then identifies its rank with dim_Fⁿʳ Hⁱ_HK(X) and with dim_C Hⁱ_dR(X). Quasi-compact smooth dagger spaces, naive interiors of quasi-compact spaces, and algebraic analytifications are the source examples; those examples require the corresponding finiteness and base-change inputs, not a definition by quasi-compactness.

(CN25 §7.2, p. 46; §1.2.3 and Remark 1.10, pp. 5–6, CN25 line 2289.)

A proof route uses the following steps. Define smallness by the actual B_dR⁺ modules. Use the imported strict Hyodo–Kato comparison to compute rank; cite finiteness for each geometric example.

The defining data and their natural maps have the following API.

- Each Bⁱ is free and finitely generated.
- rank_B_dR⁺ Bⁱ=dim_Fⁿʳ Hⁱ_HK(X)=dim_C Hⁱ_dR(X).
- Smallness is invariant under dagger isomorphism and under cohomology equivalences preserving the full period package.
- A smooth quasi-compact dagger variety over C is small, using the precise analytic finiteness theorem.
- The analytification of a finite-type smooth C-variety is small.

**Checks.**

- A point is small, with rank one in degree zero and zero in other degrees; a definition requiring positive rank in every degree fails.
- The dagger closed disc is small although its H¹_proét is infinite dimensional over Q_p.
- A countable disjoint union of geometric points is not small: B⁰ is the product of countably many B_dR⁺ modules and is not finite free.

**Checks.**

- Smallness is required in all degrees and is not a bound on Q_p-dimension of pro-étale cohomology.

*Needs:* §1.1; Mathlib `Module.Free` and `Module.Finite`; the geometric-finiteness-tubes contract, finite freeness over C.

### 1.3 the fundamental diagram

For every smooth dagger X/C and 0≤i≤r form the natural commutative square with upper row H̃ʳⁱ→X̃ʳⁱ and lower row F̃ʳⁱ→B̃ⁱ, using the syntomic period map and the map of triangles with common term RΓ_dR/Fʳ. The associated two maps are u=(a,b):H̃ʳⁱ→X̃ʳⁱ⊕F̃ʳⁱ and v=(c,−d):X̃ʳⁱ⊕F̃ʳⁱ→B̃ⁱ. Thus vu=0. X̃ and B̃ are classical. The general assertion that this square is bicartesian is Conjecture 6.21, not an unconditional theorem.

(CN25 §6.4 and Conjecture 6.21, pp. 43–44; square (6.16) and sequence (6.17), p.43 (difference-map convention), CN25 line 2185.)

A proof route uses the following steps. Form the syntomic and filtered de Rham triangles and their compatible maps. Take left-heart cohomology and the truncation isomorphism α_r. Use the existing BicartesianSq predicate; in the abelian left heart it is equivalent to the sequence 0→H̃→X̃⊕F̃→B̃→0 being exact, with the stated minus sign.

The defining data and their natural maps have the following API.

- c∘a=d∘b in the left heart.
- The difference map v satisfies v∘u=0.
- Every dagger morphism induces a morphism of the four corners and both exactness maps.
- Mathlib BicartesianSq for the square is equivalent to exactness of 0→H̃→X̃⊕F̃→B̃→0 in the abelian left heart.
- X̃ʳⁱ and B̃ⁱ are the embeddings of Xʳⁱ and Bⁱ; no such automatic identification is made for H̃ and F̃.

**Checks.**

- For a point at i=r=0 the square is Q_p→Q_p over B_dR⁺→B_dR⁺, with bottom identity and both vertical maps the inclusions.
- For that square v(1,1)=0; using c+d instead gives 2≠0.
- Exactness of a sequence of underlying vector spaces alone does not certify BicartesianSq in LH(C_Q_p); a dense nonclosed inclusion must retain its left-heart cokernel.

**Checks.**

- Both routes around the square agree; their difference, rather than their sum, kills u.

*Needs:* §1.1; Mathlib `CategoryTheory.BicartesianSq`; the stable-range period morphism and triangle of the analytic-syntomic-descent contract; LocallyAnalyticDistributions §0.0, strict left-heart cohomology.

### 1.4 twist invariance and the surjectivity reduction

For fixed i≥0 the fundamental square is bicartesian for one r≥i iff it is so for every r≥i. Multiplication by t identifies H̃ʳⁱ with H̃ʳ⁺¹ⁱ and F̃ʳ⁺¹ⁱ=tF̃ʳⁱ; the quotient Xʳ⁺¹ⁱ/tXʳⁱ identifies with Hⁱ_HK(X)⊗̂C and the corresponding Bⁱ/tBⁱ with Hⁱ_dR(X), by Hyodo–Kato. For a fixed r, surjectivity of Xʳⁱ⊕Fʳⁱ→Bⁱ in all degrees 0≤i≤r yields the short exact left-heart sequences in that range by induction from degree −1=0.

(CN25 Remark 6.23(ii)–(iii), pp. 44–45, CN25 line 2200.)

A proof route uses the following steps. Apply the exact rows and columns for t multiplication; the bottom comparison is an isomorphism. Apply the long exact cohomology sequence of the syntomic fiber; preceding-degree surjectivity kills the left kernel.

**Checks.**

- Surjectivity at a single isolated degree is not used to infer injectivity at the same degree.

*Needs:* §1.3; §0.5, successive t-level comparisons; the filtered-complex t-shift and HK comparison of the analytic-syntomic-descent contract.

### 1.5 the simplified Stein and affinoid diagram

For a smooth dagger Stein space or dagger affinoid X/C and r≥0 there is a natural map between strictly exact rows 0→Ωʳ⁻¹(X)/ker d→Hʳ_proét(X,Q_p(r))→Xʳʳ→0 and 0→Ωʳ⁻¹(X)/ker d —d→ `Ωʳ(X)^(d=0)`→Hʳ_dR(X)→0. The left vertical map is identity, the right is ι_HK⊗θ, and the middle β̃=p⁻ʳβα_r⁻¹. All vertical maps are strict with closed image. Hʳ_proét is Fréchet in the Stein case and LB in the affinoid case; ker β̃≅`(Hʳ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ⁻¹)`. Set Ω⁻¹=0.

Here r−1 in Ωʳ⁻¹ denotes the integer degree, with Ω⁻¹=0, and pʳ⁻¹ is an integer power in a characteristic-zero field. In particular at r=0 the kernel formula refers to φ=p⁻¹, not to natural subtraction followed by φ=1. The coefficient p⁻ʳ is defined because p is nonzero in Q_p.

(CN25 Theorem 6.14, p. 43, CN25 line 2098.)

A proof route uses the following steps. Import the syntomic Stein diagram and α_r in degree r. Normalize the middle map by p⁻ʳ to preserve symbols. Transport the topology, strictness and kernel assertions through α_r.

**Checks.**

- The top row is pro-étale, and its differential-form kernel on a disc is nonzero.

*Needs:* §1.3; AdicSpacesPartIV F1.9 and the strict-differential extension over C in geometric-finiteness-tubes; the Stein syntomic diagram, period comparison and natural topologies of the analytic-syntomic-descent contract.

### 1.6 bicartesian diagrams for proper, Stein and affinoid spaces

The fundamental square is bicartesian for smooth proper X/C and for smooth dagger Stein or affinoid X/C, in all 0≤i≤r by twist invariance. At degree i=r the proper horizontal arrows are injective and Fʳʳ→Filʳʳ is an isomorphism. At degree r in the Stein/affinoid case both horizontal arrows are surjective with common kernel Ωʳ⁻¹/ker d. The latter assertion uses pro-étale cohomology, not étale cohomology of a rigid affinoid completion.

(CN25 Corollaries 6.15 and 6.19, Remark 6.18, pp. 43–44, CN25 line 2117.)

A proof route uses the following steps. For the proper case use the short exact period sequence and the filtered quotient identification. For Stein/affinoid spaces compare the two triangles, use Hʲ(RΓ_dR/Fʳ)=0 for j≥r, and identify the two kernels by reduction to C. Apply twist invariance for other i≤r.

**Checks.**

- A proper point tests horizontal injectivity; a dagger disc in degree one tests the shared nonzero kernel.

*Needs:* §§1.4–1.5; CohomologyComparisons §§4.10–4.11, proper comparisons with induced filtration.

### Examples

For a geometric point at i=r=0 the square has upper identity Q_p→Q_p and lower identity B_dR⁺→B_dR⁺; its total complex is exact. For the dagger disc D at i=r=1, HK¹(D)=B¹=0 while F¹¹=O(D)/C and pro-étale H¹(D,Q_p(1))=O(D)/C. The horizontal kernel is nonzero, even though the diagram is bicartesian. At degree r=0, Ω⁻¹=0 and the point kernel at φ=p⁻¹ is zero (CN25 Theorem 6.14, lines 2098–2109; Corollaries 6.15 and 6.19, lines 2117, 2135).

### Dependencies

Layer 0; AdicSpacesPartIV F1.7–F1.12; CohomologyComparisons §§4.9a–4.11; LocallyAnalyticDistributions §0.0; analytic-syntomic-descent and geometric-finiteness-tubes contracts.

## Layer 2: the qBC filtration and comparison criteria

### 2.1 bundle cohomology measuring the diagram

For small X, i≥0, r≥0 and n=0,1 put hⁿ_i(r)=Hⁿ(X_FF,E(Hⁱ_HK(X){−r},FilʳHⁱ_dR(X/B_dR))), as a finite BC object. Here {−r} multiplies φ by p⁻ʳ and leaves N fixed, and the lattice is the induced Filʳ lattice in Bⁱ[1/t]. Use hⁿ₋₁(r)=0. In the range 0≤i≤r, and also in every nonnegative degree for quasi-compact X when r≥dim X, the tʳ-period isomorphism identifies this modified bundle with the untwisted pair (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)); the simultaneous change of φ and lattice is essential.

(CN25 §7.2.2 and Lemma 7.7, p. 47; proof of Proposition 7.10, p. 48, CN25 line 2333.)

A proof route uses the following steps. Apply the filtered-module bundle construction to the finite cohomology module and its image lattice. Use the finite BC realization of H⁰ and H¹ of a coherent bundle. Use t multiplication and the filtration shift in the range i≤r to identify the twisted and untwisted pairs.

The defining data and their natural maps have the following API.

- The zeroth object is H⁰ of the indicated modified bundle.
- The first object is H¹ of that bundle.
- Compatible pullbacks on filtered HK modules induce maps of hⁿ, preserving identity and composition.
- hⁿ₋₁(r)=0.
- Simultaneously twisting φ and the lattice by tʳ identifies the bundle and its cohomology with the untwisted F⁰ pair.

**Checks.**

- For a point at i=r=0 the bundle is O, so h⁰=Q_p and h¹=0.
- For a point at i=0,r=1, φ=p⁻¹ and lattice tB_dR⁺ cancel to give O again; twisting only the lattice would give O(−1).
- A zero HK group with zero lattice gives h⁰=h¹=0; adjoining a constant Q_p summand to the construction would fail.

**Checks.**

- The lattice uses the image filtration; Aʳⁱ is not part of that lattice.

*Needs:* §§0.2 and 1.1–1.2; §1.4, simultaneous twists; VectorBundlesAndIsocrystals VB3, finite BC realization of coherent cohomology.

### 2.2 kernel and cokernel descriptions

For small X and i≤r, h⁰_i(r)≅ker(Xʳⁱ⊕Filʳⁱ→Bⁱ)≅ker(Xʳⁱ→Bⁱ/Filʳⁱ), and h¹_i(r) is the corresponding cokernel. Moreover ker(Hʳⁱ→Xʳⁱ⊕Fʳⁱ)≅h¹ᵢ₋₁(r). These identifications lift to the natural TVS objects, with the difference-map convention of Layer 1.

(CN25 Lemma 7.7 and equation (7.6), pp. 46–47, CN25 line 2335.)

A proof route uses the following steps. The two-chart cohomology complex gives the first two identities. Compare the syntomic and filtered de Rham long exact sequences with their common DR term. Apply the snake lemma; multiplying Fʳⁱ by tʳ kills its torsion and identifies its image in Bⁱ, justifying the reduced bottom row.

**Checks.**

- At i=0 the preceding-degree kernel is zero.

*Needs:* §§2.1 and 1.3; §0.5, two-chart period quotient; natural TVS lift from the analytic-syntomic-descent contract.

### 2.3 the canonical qBC filtration on pro-étale cohomology

For small X and 0≤i≤r the natural TVS Hʳⁱ is a qBC. Its functorial canonical filtration has successive curvature pieces `H^(r,i)_(>0)`≅h¹ᵢ₋₁(r), `H^(r,i)_(=0)`≅Aʳⁱ=`(Fʳⁱ)_(B_dR⁺-tors)`, and `H^(r,i)_(<0)`≅h⁰_i(r). The middle piece is the reasonable B_dR⁺-Pair supplied by the filtered-cohomology presentation and need not be finite BC; its embedding and functorial filtration are part of the target. These are associated graded objects, not a canonical direct-sum decomposition. Zero pieces are allowed in every curvature class.

The canonical subobjects are the positive-curvature subobject and the subobject with positive and zero-curvature graded pieces. Their displayed quotients, rather than a choice of complementary subspaces, determine the filtration. The natural maps are maps of TVS functors.

(CN25 Corollary 7.9(i), p. 47, with its proof, CN25 line 2350.)

A proof route uses the following steps. Use the diagram of §2.2 to filter H by successive kernels. Identify the middle quotient with ker(F→B). Apply the imported qBC three-piece recognition and uniqueness theorem; finite bundle H¹ and H⁰ provide the positive and negative curvature pieces.

The defining data and their natural maps have the following API.

- The first subobject is h¹ᵢ₋₁(r), with its canonical injection into Hʳⁱ.
- The middle graded piece equals Aʳⁱ and its B_dR⁺-torsion description.
- The final quotient is h⁰_i(r).
- Dagger pullback preserves the filtration and induces the expected bundle maps on its finite graded pieces.
- When H is already finite BC, its filtration agrees with the existing finite BC curvature filtration; the qBC height restricts to the BC height.

**Checks.**

- For proper X the only nonzero piece is the finite Q_p negative-curvature piece Hʳ_proét; the positive and torsion pieces vanish.
- For the dagger disc at i=r=1, HK¹=0, so both finite pieces vanish while A¹¹=O(X)/C and H¹_proét≅A¹¹.
- For a point in degree zero the negative piece is Q_p of height one, not curvature zero merely because it has C-dimension zero.

**Checks.**

- The assertion does not replace an infinite torsion Pair by a finite-length module.

*Needs:* §2.2; §1.1; the qbc-pairs contract, recognition and uniqueness of the curvature filtration.

### 2.4 the exact sequence with two failure terms

For small X and 0≤i≤r there is a natural exact sequence of TVS objects 0→h¹ᵢ₋₁(r)→Hʳⁱ→Fʳⁱ⊕Xʳⁱ→Bⁱ→h¹_i(r)→0, where H→F⊕X is (b,a) and F⊕X→B sends (f,x) to c(x)−d(f). Consequently the fundamental diagram in degree i is bicartesian exactly when both h¹ᵢ₋₁(r) and h¹_i(r) vanish.

(CN25 Corollary 7.9(ii), p. 47; Proposition 7.10(a)–(b), p. 48, CN25 line 2354.)

A proof route uses the following steps. Combine the kernel description with the canonical qBC filtration. The image of F→B is Fil, so adjoining F does not change the right cokernel. Compare the classical sequence with the left-heart sequence using the classical X,B corners and the strict analytic comparison.

**Checks.**

- The criterion requires the preceding-degree failure term as well as the degree-i term.

*Needs:* §§2.2–2.3; §1.3; the TVS and left-heart compatibility of the analytic-syntomic-descent contract.

### 2.5 the height formula and its sign

For small X and r≥0, ht(Hʳʳ)=dim_Fⁿʳ Hʳ_HK(X)+ht(h¹ᵣ₋₁(r))+ht(h¹_r(r)). Each h¹ term has height ≤0, and height zero occurs only if that term is zero, because it is H¹ of a vector bundle. Therefore ht(Hʳʳ)≤dim_C Hʳ_dR(X), with equality exactly when both failure terms vanish. This strictness is not asserted for every positive-curvature BC: torsion away from ∞ is a counterexample to that broader assertion.

For O, the Euler-height equation reads 1−0=1. For O(−1), it reads 0−(−1)=1. The latter value proves the strict negative sign for a nonzero H¹ slope block; a torsion sheaf away from ∞ instead has Euler height 0 and is excluded from that strict claim.

(CN25 Proposition 7.10 proof, p. 48; Equation (3.10) and Remark 3.11, p.15; Remark 3.13(iv), p.16, CN25 line 2367.)

A proof route uses the following steps. The Pair piece has height zero and qBC height is additive. Apply the imported Euler-height identity ht(H⁰E)−ht(H¹E)=rk E. Decompose the bundle into slope blocks; each nonzero H¹ block has strictly negative height. Use the Hyodo–Kato rank comparison.

**Checks.**

- Height is a signed BC/qBC invariant, not the ordinary dimension of an infinite Q_p-vector space.

*Needs:* §2.3; §1.2, HK rank comparison; VectorBundlesAndIsocrystals VB3, Euler–Poincaré height formula, and VB1, Slope-sensitive cohomology of standard bundles; signed height additivity of the qbc-pairs contract.

### 2.6 the degreewise equivalence of comparison criteria

For a small smooth dagger X/C and r≥0 the following are equivalent: the fundamental square at degree i=r is bicartesian; h¹ᵣ₋₁(r)=h¹_r(r)=0; the two pairs (Hʲ_HK(X),F⁰Hʲ_dR(X/B_dR)) for j=r−1,r are acyclic; the TVS Hʳʳ and H_synʳ⁺¹(X,r) both have curvature ≤0; ht(Hʳʳ)=dim_C Hʳ_dR(X). The degree r+1 term here is syntomic, not Hʳ⁺¹_proét(X,Q_p(r)); it lies outside the comparison range. Negative-degree pairs vanish.

At r=0, use the zero filtered module in degree −1. The adjacent syntomic positive-curvature piece is constructed from the same fiber triangle; it is not identified with the full pro-étale group beyond the truncation range.

(CN25 Proposition 7.10 with footnote 21, p. 48, CN25 line 2367.)

A proof route uses the following steps. Use the failure exact sequence and acyclicity criteria. Twist the bundle pairs to remove r. Apply the positive-piece description also to the adjacent syntomic term in the source diagram; do not extend α_r past degree r. Use the height defect formula and the strict negativity of nonzero bundle H¹.

**Checks.**

- The single-degree curvature condition is not substituted for the pair of degree-r and degree-(r+1) conditions.

*Needs:* §§2.1 and 2.4–2.5; §0.4; the adjacent syntomic positive piece obtained from the analytic-syntomic-descent triangle and the qbc-pairs recognition theorem.

### 2.7 the four conjectural properties for a small variety

For a small smooth dagger X/C the following families of statements are equivalent: the fundamental squares are bicartesian for all 0≤i≤r; all pairs (Hⁱ_HK,F⁰Hⁱ_dR(X/B_dR)) are acyclic; every Hⁱ_proét(X,Q_p) has curvature ≤0; ht(Hⁱ_proét(X,Q_p))=dim_C Hⁱ_dR(X) for every i. This is an equivalence of properties, not a proof that they hold for every small X.

The first family quantifies over every pair of integers 0≤i≤r. The other three quantify over every i≥0. Tate twisting does not change the vanishing of the bundle H¹ terms, so the adjacent finite positive piece can be transported to twist r+1 where αᵣ₊₁ applies.

(CN25 Corollary 7.11 and Remark 7.12, p. 48; Conjectures 7.1, 7.3 and 7.4, p. 46, CN25 line 2382.)

A proof route uses the following steps. Vary r in the degreewise equivalence and use twist invariance. For the adjacent positive-curvature piece use the bundle-cohomology twist identification h¹_i(r)≅h¹_i(r+1) from the failure objects. At r+1 the comparison range includes degree r+1; this identifies the finite positive piece needed for the induction. No comparison of the full syntomic group in degree r+1 at twist r is asserted.

**Checks.**

- All degrees are quantified; a height identity in one degree is not used to prove acyclicity in every degree.

*Needs:* §2.6; §1.4; §2.1, simultaneous twists of finite failure objects.

### 2.8 splitting the crystalline eigenspace complex

For a smooth quasi-compact dagger X/C, r≥dim X, and the functorial log-crystalline complex of the analytic package, Hⁱ(`[RΓ_cris(X)]^(φ=pʳ)`)≅`(Hⁱ_HK(X)⊗B_st⁺)^(N=0,φ=pʳ)` as BC objects. The eigenspace complex is quasi-isomorphic to the direct sum of these groups placed in degree i. The splitting depends on cocycle lifts; it is neither canonical nor claimed Galois equivariant. The proof uses the completed unramified coefficient version of HK, with its comparison to the Fⁿʳ version.

(CN25 Lemma 7.13 and Remark 7.14, pp. 48–49, CN25 line 2397.)

A proof route uses the following steps. Use the non-equivariant crystalline–HK comparison. Decompose each finite HK group into Dieudonné–Manin blocks and choose cocycle lifts of its basis. Construct maps into the mapping fiber of 1−φ/pʳ by correcting each lifted block with a primitive of its Frobenius discrepancy. Use the slope bound ≤min(i,dim X) and r≥dim X to identify the eigenspaces and cohomology.

**Checks.**

- Changing cocycle lifts may change the splitting; no naturality assertion is added.

*Needs:* §0.6; §1.2; VectorBundlesAndIsocrystals VB0, Dieudonné–Manin classification; the functorial log-crystalline complex and completed-unramified HK comparison in the analytic-syntomic-descent contract.

### 2.9 a noncanonical decomposition of syntomic cohomology

For smooth quasi-compact dagger X/C and r≥dim X, every natural syntomic TVS H_synⁱ(X,r) is isomorphic, noncanonically, to h¹ᵢ₋₁(r)⊕h⁰_i(r)⊕P_i, where P_i is a reasonable B_dR⁺-Pair representing the curvature-zero piece. For i≤r this decomposes pro-étale cohomology through α_r. It does not prove that the canonical qBC filtration splits canonically or that every qBC splits.

(CN25 Proposition 7.15, pp. 49–50, CN25 line 2424.)

A proof route uses the following steps. Replace the crystalline eigenspace complex by its split cohomology complex. Represent the syntomic fiber by the explicit three-term total complex and remove an acyclic differential-image complex. Use finite free de Rham cohomology, compact-type reflexivity, extension of continuous forms and the open mapping theorem to choose period-linear complements. The remaining kernel and cokernel are h⁰_i and h¹ᵢ₋₁; reduce the middle Pair modulo tʳ.

**Checks.**

- The theorem is independent of the proofs of the final comparison cases: do not make Theorem 8.1 depend on it.

*Needs:* §§2.3 and 2.8; LocallyAnalyticDistributions §§0.0–0.2, compact-type duality and open mapping; the compact-extension-duality contract; reasonable Pairs from the qbc-pairs contract.

### Examples

At a point, h⁰=Q_p, h¹=0 and A=0, so the qBC graded pieces are (0,0,Q_p) and the height is 1. On a dagger disc in degree one, the pieces are (0,O(D)/C,0) and the height is 0=dim H¹_dR(D). A hypothetical pair with O(−1) in degree r has ht(h¹_r)=−1; it contributes a deficit of 1, demonstrating why a zero height defect must kill each H¹ term separately (CN25 Corollary 7.9 and Proposition 7.10, lines 2350–2381).

### Dependencies

Layers 0–1; finite BC and coherent bundle cohomology from VectorBundlesAndIsocrystals VB1–VB3; qbc-pairs and analytic-syntomic-descent contracts. Only the splitting branch uses compact-extension-duality.

## Layer 3: geometric classes with nonnegative de Rham slopes

### 3.1 varieties with nonnegative de Rham slopes

A smooth dagger X/C has de Rham slopes ≥0 if X is small and, for every i≥0, the filtered module (Hⁱ_HK(X),F⁰Hⁱ_dR(X/B_dR)) is acyclic. The term refers to slopes of its modified bundle, not to φ-slopes alone and not to nonnegative Hodge–Tate weights.

(CN25 §8.1, p. 50; Conjecture 7.1, p. 46, CN25 line 2462.)

A proof route uses the following steps. Use smallness to obtain finite filtered modules in every degree. Apply the acyclic predicate to their induced F⁰ lattices.

The defining data and their natural maps have the following API.

- The predicate implies smallness.
- For each i the indicated filtered HK module is acyclic.
- The predicate is preserved by compatible isomorphisms of the full cohomology package.
- For small X it is equivalent to all fundamental squares being bicartesian, by §2.7.
- It implies ht(Hⁱ_proét)=dim_C Hⁱ_dR in every degree.

**Checks.**

- A point has the predicate: its only nonzero bundle is O.
- A smooth dagger affinoid has the predicate by the elementary diagram, smallness and §2.7; in particular the dagger disc does.
- The countable disjoint union of points does not have the predicate, because it is not small even though its components have it.

**Checks.**

- The smallness condition is included, even when acyclicity is used as shorthand.

*Needs:* §§0.3 and 1.2; §2.7 for the API equivalences.

### 3.2 nonnegative de Rham slopes for products

If smooth dagger X,Y/C have de Rham slopes ≥0, their product has de Rham slopes ≥0. In degree n the cup product gives an injective bundle map `⊕_(i+j=n)`E_i(X)⊗E_j(Y)→E_n(X×Y) whose cokernel is coherent and supported at ∞. Equality of the two filtration lattices is not required or asserted.

(CN25 Theorem 8.1(a), p. 50, CN25 line 2466.)

A proof route uses the following steps. Apply HK and de Rham Künneth and their compatibility with cup products to establish smallness and identify the punctured bundles. The filtered cup product gives lattice containment, hence the injection with torsion cokernel at ∞. Tensor acyclicity annihilates H¹ of the source and torsion sheaves have H¹=0; the long exact sequence annihilates H¹ of the target.

**Checks.**

- The claim is about de Rham/HK Künneth, not a general algebraic tensor-product formula for pro-étale cohomology.

*Needs:* §3.1; §0.4, tensor acyclicity and torsion modification; cup-compatible finite HK/de Rham Künneth from the geometric-finiteness-tubes contract.

### 3.3 algebraic analytifications have nonnegative slopes

For a smooth finite-type algebraic variety V/C, its dagger analytification Vᵃⁿ has de Rham slopes ≥0. For each i, the algebraic admissible filtered module maps to its analytic counterpart, isomorphically on HK; the resulting bundle injection has coherent cokernel supported at ∞. The analytic lattice may be larger than the algebraic one.

(CN25 Theorem 8.1(b), pp. 50–51, CN25 line 2489.)

A proof route uses the following steps. Use the algebraic period comparison to obtain an admissible algebraic pair. Apply HK GAGA and analytic de Rham finiteness to obtain smallness and the lattice comparison. Enlarging the lattice gives a torsion modification; the H¹ sequence transfers acyclicity.

**Checks.**

- The result includes nonproper V; it does not replace analytic pro-étale cohomology by algebraic étale cohomology.

*Needs:* §3.1; §0.4, torsion modifications; AdicSpacesPartIV F1.8, dagger analytification; CohomologyComparisons §4.8 and the geometric-log-periods contract, algebraic comparison over C and HK GAGA.

### 3.4 almost proper varieties have nonnegative slopes

Let X/C be smooth proper rigid analytic and Z⊆X any closed analytic subvariety. The smooth dagger complement U=X∖Z has de Rham slopes ≥0. No smoothness or normal crossings assumption on Z is imposed in the conclusion. A proper modification reducing the boundary to a simple normal crossings divisor is a proof input.

(CN25 Theorem 8.1(c), p. 51, CN25 line 2501.)

A proof route uses the following steps. First discard the connected components of X contained in Z; this leaves the same U and reduces the boundary to a nowhere dense closed subspace. Resolve that pair in characteristic zero, without changing U, obtaining a smooth proper X′ with normal crossings boundary D. Use the logarithmic period exact sequence for the proper pair (X′,D). Identify ordinary HK and unfiltered de Rham cohomology of U with the log pair and compare logarithmic and naive filtrations. Surjectivity in the top logarithmic sequence implies it for the fundamental difference map for U in every degree. Apply induction and §2.7; retain finiteness proving smallness.

**Checks.**

- For Z=∅ the result is the proper case. For Z=X the complement is empty and every cohomology group is 0. A singular or nonreduced boundary has the same complement as its reduced support, while the resolution input must still cover the proper rigid pair.

*Needs:* §3.1; §1.4, surjectivity induction; proper-pair resolution and finiteness from geometric-finiteness-tubes; the exact logarithmic sequence of geometric-log-periods.

### 3.5 the logarithmic and naive filtration discrepancy

With U=X′∖D a resolved almost proper pair and i≤r, the two-term complexes [Hⁱ_ét(U,Q_p(r))→H̃ⁱ_proét(U,Q_p(r))] and [Hⁱ(FʳRΓ_dR(X′ with log D/B_dR⁺))→H̃ⁱ(FʳRΓ_dR(U/B_dR⁺))] are naturally isomorphic in the derived/left-heart realization. These are complexes with maps; no equality of ordinary quotient vector spaces without strictness is inferred.

(CN25 Remark 8.2, p. 51, CN25 line 2528.)

A proof route uses the following steps. Compare the logarithmic period and analytic syntomic triangles. Their HK and unfiltered de Rham terms are isomorphic. Cancel those terms in the associated mapping cones.

**Checks.**

- For a proper pair with empty boundary both discrepancy complexes are zero.

*Needs:* §3.4; §1.3; the compatible logarithmic and naive triangles of geometric-log-periods.

### 3.6 comparison for semistable tube complements

Let 𝔛/O_K be weak formal with local étale charts Spf(O_K{T₁,…,T_n}/(T₁⋯T_s−π)), 1≤s≤m≤n. Let 𝔝 be locally either `⋂_(j=s+1)^m V(T_j)` or `⋃_(j=s+1)^m V(T_j)`, with the stated compatible charts, and assume 𝔛_K smooth proper. For U=]𝔛_k∖𝔝_k[_𝔛, the base change U_C has de Rham slopes ≥0 and hence bicartesian fundamental diagrams. The restriction RΓ_dR(𝔛_K∖𝔝_K)→RΓ_dR(U) is an unfiltered quasi-isomorphism, compatible with the natural filtration map; no filtered-complex quasi-isomorphism is claimed. The compatible HK comparison identifies the underlying coefficients, and naturality gives inclusion of the induced full B_dR⁺ lattices. That inclusion, rather than equality of the filtrations, suffices for acyclicity.

For an empty intersection of coordinate zero loci (m=s) the intersection boundary is the entire model and its complement is empty. For the empty union the boundary is empty and the complement is the whole generic fibre. These conventions are kept distinct. Taking the reduced boundary leaves the complement unchanged; a square-zero thickening itself is not a smooth comparison input.

(CN25 Proposition 8.3 and the following example, pp.51–52, CN25 line 2538; GK04 Corollary 3.8(a),(c), p.16; Proposition 3.7, pp.14–16, in arXiv v1 pagination, GK04 line 556.)

A proof route uses the following steps. Use Grosse-Klönne Corollary 3.8(a),(c) for the unfiltered tube-complement comparison in the stated charts. The filtration compatibility used here is containment of induced lattices, as distinguished from an equivalence of filtered complexes by the Check below. Apply the almost proper theorem to V=(𝔛_K∖𝔝_K)_C, and use the compatible HK comparison to identify its punctured bundle with that of U_C. Quasi-compactness of U_C gives smallness. The natural filtration map sends L_V into L_U inside the common localized period module. These are full lattices, so E_i(V)→E_i(U_C) is injective with finite-length cokernel at ∞. Torsion sheaves have H¹=0; the cohomology sequence therefore transfers H¹=0 from E_i(V) to E_i(U_C).

**Checks.**

- Both intersection and union versions require the stated coordinate description; an arbitrary closed formal subscheme is not covered.
- For the weak formal projective line and the infinity section, restriction from the affine line to the dagger closed unit disc is not a quasi-isomorphism on gr⁰ of the naive Hodge filtration: (1−πT)⁻¹ is overconvergent on the disc but has a pole on the affine line. This rules out the stronger filtered-complex claim without affecting unfiltered de Rham invariance or the lattice-inclusion argument.

*Needs:* §3.4; §0.4, lattice enlargement; AdicSpacesPartIV F1.16, formal tubes; geometric-finiteness-tubes, compatible HK/de Rham maps and full-lattice inclusion.

### 3.7 small tubular neighbourhoods in projective space

Let X=Pⁿ_K and let Z=Z₁×_X⋯×_XZ_c be a smooth scheme-theoretic complete intersection of c hypersurfaces in the codimension-c setting of Proposition 8.4. There is ε₀∈|K×| such that for positive ε∈|K×| with ε<ε₀, removing the specified tubular neighbourhood Z(ε) instead of Z induces compatible quasi-isomorphisms in de Rham and HK cohomology. The union version is the corresponding restriction for X∖⋃Z_j→X∖⋃Z_j(ε); its target includes a simultaneous comparison on the intersections of that cover, at one sufficiently small radius. Smoothness of the full complete intersection alone is not used as a claim that every partial intersection is smooth. The resulting dagger complement over C has de Rham slopes ≥0. The chosen tube definition and its radius inequalities must be part of the geometric supplier. The restriction preserves the induced filtration, but equality of filtration lattices or a filtered-complex quasi-isomorphism is not required: lattice containment transfers acyclicity through a torsion quotient at ∞.

Choose integral models of the hypersurface line bundles on the standard projective formal model. On a formal chart trivializing them, define Z(ε) by all inequalities |f_j|≤ε. Integral changes of trivialization have absolute value 1 and give the same subdomain; arbitrary rescaling of the equations changes the radius and is not ignored. For a union use the union of the individual tubes. Require 0<ε<ε₀, with ε,ε₀∈|K×|. The local definition and its independence are BKV22 §4, p.26, lines 1176–1187. The complete-intersection condition is codimension c. At c=0, the intersection is X and both intersection complements are empty, while the empty union has complement X; these cases are distinct. For the union assertion, the common small-radius bound must work on every nonempty Čech intersection; the geometric-finiteness-tubes contract includes precisely this compatibility.

(CN25 Proposition 8.4 and the following paragraph, p. 52, CN25 line 2557; GK04 Proposition 3.7, pp.14–16, in arXiv v1 pagination, GK04 line 499.)

A proof route uses the following steps. Use the local normal-coordinate description along the smooth complete intersection and the unfiltered tube invariance of de Rham cohomology in Grosse-Klönne Proposition 3.7. Transfer to HK through its comparison and naturality; check analytic Čech descent for all strata used in the union statement. The precise radius and descent compatibility remain part of the geometric-finiteness-tubes contract. Use the unfiltered HK/de Rham comparisons and the period comparison to establish finite freeness and smallness of the tube complement; naturality includes the induced lattice of the almost proper complement in that of the tube complement. The resulting injective bundle map has torsion cokernel at ∞; its cohomology sequence transfers H¹=0 as in the semistable tube case.

**Checks.**

- No theorem for every radius or for a singular complete intersection is asserted.
- The maps on HK and the induced B_dR⁺ lattices commute with restriction on every Čech intersection at a common sufficiently small radius. Underlying de Rham invariance alone supplies no equality of filtrations.

*Needs:* §3.4; §0.4, lattice enlargement; geometric-finiteness-tubes, integral tube models, compatible unfiltered comparisons, lattice inclusion and simultaneous Čech-radius control.

### Examples

A point and a dagger disc have nonnegative de Rham slopes. The product of two annuli has de Rham dimensions (1,2,1), with degree-two generator dT/T∧dS/S; the two degree-one summands occur in the cup product. For P¹ minus the infinity section, the small tube complement is a dagger disc: both have unfiltered de Rham dimensions (1,0), while the analytic function (1−πT)⁻¹ on that disc cannot extend to the whole affine line because of its pole at π⁻¹. Thus the comparison of complexes is unfiltered (CN25 Theorem 8.1 and Proposition 8.3, lines 2466–2549; GK04 Proposition 3.7, line 499, Corollary 3.8, line 556).

### Dependencies

Layers 0–2 except the splitting branch; AdicSpacesPartIV F1.11–F1.12 and F1.16; CohomologyComparisons §§4.8–4.11; geometric-log-periods and geometric-finiteness-tubes contracts.

## Layer 4: inverse limits and proper times Stein

### 4.1 cohomology along a countable exhaustion

Fix a smooth dagger X/C with a chosen increasing admissible exhaustion X=`⋃_(n∈N) X_n` by quasi-compact open dagger subspaces, each having nonnegative de Rham slopes. For fixed r use the inverse systems `H_n^(r,i)`,`X_n^(r,i)`,`F_n^(r,i)`,B_n^i,`A_n^(r,i)` and `Fbar_n^(r,i)`=`F_n^(r,i)`/`A_n^(r,i)`=`Fil_n^(r,i)`, with restriction maps. The global versions are cohomology of the respective derived inverse-limit complexes, not definitions as ordinary limits of groups. In this setting `X^(r,i)`≅lim `X_n^(r,i)`, B^i≅lim B_n^i, and R¹lim `X_n^(r,i)`=R¹lim `Fbar_n^(r,i)`=0.

(CN25 §8.2.1, notation (8.5)–(8.8) and Remark 8.9(i)–(ii), pp. 52–53, CN25 line 2574.)

A proof route uses the following steps. Restrict the analytic complexes and their comparison maps to the chosen exhaustion. Use the imported derived-limit descent for HK, filtered de Rham and pro-étale complexes. Apply the analytic inverse-limit vanishing contract summarized in CN25 Remark 8.9(i), including the finite BC quotient argument for F̄^r.

The defining data and their natural maps have the following API.

- Restriction maps commute with all four corners and the torsion kernels.
- F̄_n=F_n/A_n is the induced image filtration, not F_n itself.
- A cofinal refinement induces the canonical isomorphism of derived-limit complexes.
- X and B identify with their ordinary limits under the stated analytic descent hypotheses.

**Checks.**

- For a constant exhaustion X_n=X the derived-limit complex is the original complex and the R¹lim terms vanish.
- For an exhaustion of the dagger open disc, `F_n^(1,1)` can have a nonzero torsion kernel although `Fbar_n^(1,1)`=0; replacing F by F̄ loses that kernel.
- Replacing X_n by X₂ₙ preserves the resulting global complex, not merely its underlying set of points.

**Checks.**

- The exhaustion is specified data; no countability assertion for arbitrary dagger spaces is made.

*Needs:* §§1.1 and 3.1; LocallyAnalyticDistributions §0.0, countable derived limits; analytic-syntomic-descent, exhaustion descent and period-limit vanishing; finite BC inverse-limit vanishing from qbc-pairs.

### 4.2 the inverse-limit obstruction sequence

For the chosen exhaustion and a fixed r, in each integer degree 0≤i≤r the Milnor sequences are 0→R¹lim `F_n^(r,i-1)`→`F^(r,i)`→lim `F_n^(r,i)`→0 and 0→R¹lim `H_n^(r,i-1)`→`H^(r,i)`→lim `H_n^(r,i)`→0. The stagewise comparison sequences give 0→lim `H_n^(r,i)`→lim `X_n^(r,i)`⊕lim `F_n^(r,i)`→lim B_n^i→R¹lim `H_n^(r,i)`→R¹lim `F_n^(r,i)`→0. If R¹lim `H_n^(r,j)`=0 for every 0≤j≤r, with negative-degree terms zero, the global sequence 0→`H^(r,i)`→`X^(r,i)`⊕`F^(r,i)`→B^i→0 is exact and R¹lim `F_n^(r,i)`=0 in that range.

(CN25 Remark 8.9(ii)–(iii), p. 53, CN25 line 2601.)

A proof route uses the following steps. Apply countable derived-limit cohomological dimension one to the complexes for the Milnor sequences. Apply the long exact inverse-limit sequence to the stagewise short exact comparison sequence. Use R¹lim X_n=0 and the two Milnor sequences to replace the limits by the actual global groups.

**Checks.**

- At degree zero all negative-degree groups vanish.
- Do not suppress R¹lim before proving its vanishing.

*Needs:* §4.1; §2.4, stagewise short exact comparison; countable derived-limit dimension one in LocallyAnalyticDistributions §0.0.

### 4.3 a de Rham criterion for R¹lim vanishing

For the exhaustion above, fixed r and i≤r, R¹lim `DR_n^(r,i-1)`=0 implies R¹lim `A_n^(r,i)`=0, which implies R¹lim `H_n^(r,i)`=0. Here `DR_n^(r,j)`=Hʲ(RΓ_dR(X_n/B_dR⁺)/Fʳ). Moreover R¹lim(`H_n^(r,i)`/`A_n^(r,i)`)=0 without the first hypothesis: these quotients lift functorially to finite BC objects.

(CN25 Lemma 8.10, Remark 8.11 and footnote 22, p. 53; Remark 3.15, p.16, CN25 line 2623.)

A proof route uses the following steps. The de Rham long exact sequence expresses A_n as a quotient of `DR_n^(r,i-1)`; countable R²lim=0 proves the first implication. Use comparison to express H_n/A_n as a kernel between finite BC objects, retaining their Vector Space lifts. Use countable BC inverse-limit vanishing and the long exact sequence for 0→A_n→H_n→H_n/A_n→0.

**Checks.**

- A system of arbitrary topological Q_p-vector spaces is not assumed R¹lim-acyclic.

*Needs:* §§4.1–4.2; the filtered long exact sequence of §1.1; the finite BC quotient realization of §2.3 and countable BC inverse-limit vanishing in qbc-pairs.

### 4.4 étale Künneth with a proper factor

For smooth rigid analytic Y,T/C with Y proper, cup product gives `⊕_(j≥0)`Hʲ_ét(Y,Q_p)`⊗_(Q_p)`Hⁱ⁻ʲ_ét(T,Q_p)≅Hⁱ_ét(Y×T,Q_p) for every i≥0. The sum is finite in each degree. At integral level the corresponding comparison uses a derived tensor over Z_p. The perfect coefficient complex in the projection formula is RΓ_ét(Y,Z_p); no perfection of RΓ_ét(T,Z_p) is assumed.

The integral statement is RΓ_ét(Y,Z_p)`⊗ᴸ_(Z_p)`RΓ_ét(T,Z_p)≃RΓ_ét(Y×T,Z_p). The comparison is the cup-product map induced by the two projections, and its reduction to the rational direct sum uses the perfect proper-factor complex.

(CN25 Lemma 8.13, equations (8.14)–(8.15), p. 54, CN25 line 2673.)

A proof route uses the following steps. Apply proper base change to the projection Y×T→T to identify its derived direct image with the constant RΓ_ét(Y,Z_p). Use perfection of the proper factor to pull this constant complex through derived global sections. Invert p and take cohomology over the field Q_p.

**Checks.**

- The proper factor has finite-dimensional Q_p-cohomology; no analogous formula for two arbitrary nonproper factors is inferred.

*Needs:* ClassicalAdicEtaleCohomology §8.4, proper base change and projection formula; the proper-rigid-integral-etale contract, perfect proper-factor Z_p-cohomology and rationalization.

### 4.5 R¹lim vanishing for proper times Stein

Let Y/C be smooth proper and S/C smooth dagger Stein, with a strictly increasing admissible covering by open dagger affinoids S_n. Put X_n=Y×S_n. For every i≥0, R¹lim_n Hⁱ_proét(X_n,Q_p)=0. Consequently Hⁱ_proét(Y×S,Q_p)≅lim_n Hⁱ_proét(X_n,Q_p), with the natural cohomological topologies.

(CN25 Proposition 8.12 and Remark 8.16(i), p. 54, CN25 line 2660.)

A proof route uses the following steps. Compare the derived inverse systems of dagger pieces and their rigid completions using cofinal strict shrinkings of the Stein exhaustion and the analytic descent contract. The affinoid pieces are not partially proper, so a termwise completion isomorphism is not used. On the quasi-compact completions use the étale realization relevant to the comparison. Apply proper-factor étale Künneth; the finite-dimensional proper groups commute with the inverse-limit computation. Use the Stein/affinoid diagram and the analytic Stein limit theorem for S_n to kill R¹lim of the second factor.

**Checks.**

- The comparison between dagger and completed systems is a derived-limit statement; do not assert it for every single non-partially-proper dagger space.

*Needs:* §4.4; §1.5, Stein limit computation; the proper-rigid-integral-etale and analytic-syntomic-descent contracts, derived-system comparison after cofinal strict shrinkings.

### 4.6 pro-étale Künneth for proper times Stein

For the same Y,S, cup product gives ⊕_jHʲ_proét(Y,Q_p)`⊗_(Q_p)`Hⁱ⁻ʲ_proét(S,Q_p)≅Hⁱ_proét(Y×S,Q_p). The tensor products are ordinary tensors with the finite-dimensional proper-factor groups, carrying their natural finite direct-sum topology. This statement is restricted to a proper factor; the analogous algebraic tensor formula fails for the product of two open one-dimensional balls.

(CN25 Remark 8.16(ii), p. 54, CN25 line 2704.)

A proof route uses the following steps. Pass the proper-factor étale Künneth maps to the inverse limit over S_n. Use proper finiteness and the preceding R¹lim vanishing to identify both sides with pro-étale groups.

**Checks.**

- There is no general pro-étale Künneth assertion for two nonproper factors.

*Needs:* §§4.4–4.5; proper-factor finiteness from proper-rigid-integral-etale.

### 4.7 the fundamental diagram for proper times Stein

For smooth proper Y/C and smooth dagger Stein S/C, X=Y×S has a bicartesian fundamental square in LH(C_Q_p) for every 0≤i≤r, r≥0. Its associated sequence is 0→Hⁱ_proét(X,Q_p(r))→`(Hⁱ_HK(X)⊗̂B_st⁺)^(N=0,φ=pʳ)`⊕Hⁱ(FʳRΓ_dR(X/B_dR⁺))→Hⁱ_dR(X/B_dR⁺)→0, with the difference-map signs. Smallness of the global space X is not required.

Writing the order of summands as X⊕F, the last arrow is c−d and the first is (a,b). The map is formed in the left heart before extracting any ordinary cohomology groups.

(CN25 Proposition 8.17, p. 55, CN25 line 2713.)

A proof route uses the following steps. Each X_n=Y×S_n has nonnegative de Rham slopes by product stability and the proper and affinoid cases. Apply stagewise comparison, proper-times-Stein R¹lim vanishing and the inverse-limit obstruction sequence. Use the classical-corner criterion to lift exactness to the abelian left heart.

**Checks.**

- Neither the small-variety height equality nor the finite-HK recovery theorem is automatically extended to this non-small case.

*Needs:* §§4.2 and 4.5; §§1.6 and 3.2, comparison of exhaustion stages; §1.3, classical corners and left-heart exactness.

### Examples

For a constant exhaustion, every derived inverse-limit error is 0. For Y=P¹ and S a dagger disc or dagger open disc, Hʲ_proét(Y,Q_p) is Q_p at j=0 and Q_p(−1) at j=2, with H¹(Y)=0. Hence H¹(Y×S)=H¹(S), H²(Y×S)=Q_p(−1), and H³(Y×S)=H¹(S)(−1), with finite-factor tensor topology. For a cofinal subsequence X₂ₙ, the global derived complexes and their Milnor sequences are unchanged (CN25 Lemma 8.13 and Remark 8.16, lines 2673–2707).

### Dependencies

Layers 1–3 except the splitting branch; LocallyAnalyticDistributions §0.0; ClassicalAdicEtaleCohomology §§1.3–1.4, 8.4 and 9.7; analytic-syntomic-descent, qbc-pairs and proper-rigid-integral-etale contracts.

## Layer 5: arithmetic and geometric period recovery

### 5.1 vanishing on the differential error term

For a smooth dagger affinoid X/K and i≥1, both `Hom^sm_(G_K)`((Ωⁱ⁻¹(X)/ker d)⊗̂_K C,B_st) and `Hom_(G_K)`((Ωⁱ⁻¹(X)/ker d)⊗̂_K C,B_dR) vanish. The maps are continuous Q_p-linear; the smooth Hom means the union of `Hom_(G_L)` over finite L/K. The same argument applies to the relevant Čech terms used for quasi-compact X. For i=0 the differential term is zero.

(CN25 Lemma 9.5 and its proof, pp. 55–56, CN25 line 2746.)

A proof route uses the following steps. Reduce smooth B_st maps to B_dR maps equivariant for G_L. Use Fontaine’s vanishing `Hom_(G_L)`(C,B_dR)=0 on each simple tensor. Use density of algebraic tensors and continuity in the completed tensor product.

**Checks.**

- Continuity and density are essential; unrestricted algebraic Hom is not used.

*Needs:* AdicSpacesPartIV F1.9, strict differential quotients; LocallyAnalyticDistributions §0.0, completed tensors and density; the galois-period-hom-vanishing contract and the smooth Galois Hom interface of bounded-arithmetic-filtration.

### 5.2 vanishing on the arithmetic torsion kernel

For a small smooth dagger X/K whose base change to C has nonnegative de Rham slopes, set `A^(r,i)`=ker(Hⁱ(FʳRΓ_dR(X_C/B_dR⁺))→Hⁱ_dR(X_C/B_dR⁺)), i≤r. Then `Hom^sm_(G_K)`(`A^(r,i)`,B_st)=`Hom_(G_K)`(`A^(r,i)`,B_dR)=0. The topology and G_K action are the natural ones. The quasi-compact proof extends to the other small cases through the finite-free cohomology and strict Čech presentations used in §9.1.3.

(CN25 Lemma 9.6 and §§9.1.2–9.1.3, pp. 56–57, CN25 line 2772.)

A proof route uses the following steps. Express A as a quotient of the preceding truncated de Rham cohomology. Compute truncated de Rham cohomology by Čech complexes with coefficients B_dR⁺/t^k. Use the Banach/compact-type presentations, density and the differential vanishing argument degree by degree. Pass through the strict quotients and CN25’s smallness reduction.

**Checks.**

- This is not obtained by pretending A is a finite BC object.

*Needs:* §5.1; §1.1, filtered triangle; finite-free analytic cohomology and strict Čech presentations from analytic-syntomic-descent; PadicHodgeTheory §3.7, Galois period-Hom topology.

### 5.3 arithmetic pro-étale-to-de Rham recovery

Let X/K be smooth dagger and assume X_C has de Rham slopes ≥0 (hence is small). For every i≥0, naturally and strictly for the weak Hom topologies, `Hom^sm_(G_K)`(Hⁱ_proét(X_C,Q_p),B_st)≅Hⁱ_HK(X_C)^∨ as (φ,N,G_K)-modules over Fⁿʳ, and `Hom_(G_K)`(Hⁱ_proét(X_C,Q_p),B_dR)≅Hⁱ_dR(X/K)^∨ as filtered K-modules. Filtration on Hom is pointwise image in tʲB_dR⁺; smooth invariants are the colimit over finite extensions. These are contravariant duals; the Hodge filtration is retained only with the arithmetic G_K structure.

(CN25 Theorem 9.3; Remark 9.2; §§9.1.1–9.1.3, pp. 55–57, CN25 line 2735.)

A proof route uses the following steps. Choose r≥i, use bicartesian comparison, and quotient `H^(r,i)` by `A^(r,i)`. Identify that quotient with the bounded V_st^r of the induced acyclic filtered HK module. Kill maps from A by arithmetic torsion vanishing and apply the imported arithmetic acyclic period reconstruction. Undo the Tate twist, check the φ,N,G_K and filtration conventions, and establish strictness using the Hausdorff weak Hom topology and finite-dimensional source of the comparison.

**Checks.**

- The general smooth-dagger statement of Conjecture 9.1 remains open in this source.
- For proper X this specializes to the proper comparison without a semistable-model hypothesis.

*Needs:* §§5.1–5.2; §2.7; §0.8; the bounded-arithmetic-filtration contract; PadicHodgeTheory §§3.4–3.7 and 5.2, arithmetic acyclic period reconstruction.

### 5.4 geometric pro-étale-to-period-module recovery

Let X/C be smooth dagger with de Rham slopes ≥0. With 𝐇 the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p), M=Hⁱ_HK(X) and B=Hⁱ_dR(X/B_dR⁺), there are natural B_st- and B_dR-linear isomorphisms Hom_TVS(𝐇,𝐁_st)≅`Hom_(Fⁿʳ)`(M,B_st) and Hom_TVS(𝐇,𝐁_dR)≅`Hom_(B_dR⁺)`(B,B_dR). Here Hom_TVS consists of natural transformations between functors on sympathetic algebras valued in LH(C_Q_p), with the boundedness condition of Definition 4.1. It is not the set of arbitrary continuous maps on C-points. These recover extended period modules; no φ,N or Hodge filtration is claimed to be recovered from the geometric functor alone.

(CN25 Theorem 9.8 and §9.2 proof, pp. 57–58, CN25 line 2821.)

A proof route uses the following steps. Use the canonical qBC filtration and the fundamental diagram to identify H/A with bounded V_st^r after twisting. Present the reasonable B_dR⁺-Pair A densely by finite torsion pieces; their maps to B_dR and B_st vanish, and continuity passes this to A. Apply filtered-period-Hom and undo the Tate twist to obtain both module isomorphisms.

**Checks.**

- The theorem’s input is X over C; there is no further base change X_C to define.
- Retain the full natural Topological Vector Space functor in Hom; neither arbitrary continuous C-point maps nor period-linear maps on H are the specified Hom.

*Needs:* §2.3; §2.7; §§0.8–0.9; the dense finite-torsion presentation in qbc-pairs; the VS/TVS comparison in natural-period-hom.

### 5.5 positive crystalline recovery for affinoids

For a smooth dagger affinoid X/C in degree i, put M=Hⁱ_HK(X), B=Hⁱ_dR(X/B_dR⁺) and r=i. Monodromy untwisting identifies X_st^i(M) with X_cris^i(M). The strengthened affinoid comparison target is Hom_TVS(Hⁱ_proét(X,Q_p(i)),B_cris⁺)≅Hom_TVS(X_cris^i(M),B_cris⁺)=M^∨⊗B_cris⁺. After the stated completed unramified scalar extension and duality it recovers φ on M`⊗_(Fⁿʳ)`F̂ⁿʳ. Also Filⁱ⁺ᵏB=t^kB for k≥0. The equality with positive crystalline coefficients is an exact target of Remark 9.9(ii), subject to the positive-crystalline-hom contract; the weaker sandwich M^∨⊗B_cris⁺⊆Hom_VS(X_cris^i(M),B_cris⁺)⊆M^∨⊗t⁻ⁱB_cris⁺ alone does not prove that equality.

The exact equality is a proof target with the additional positivity argument in the supplier contract. It cannot be inferred from the two inclusions: for i=1 the candidate t⁻¹ in the outer bound is absent from B_cris⁺. No assertion that all positive Frobenius iterates landing in B_dR⁺ characterizes all of B_cris⁺ is used without that argument.

(CN25 Remarks 5.19 and 5.21, pp. 38–39; Remark 9.9(ii), p. 58, CN25 line 2859.)

A proof route uses the following steps. Apply eigenspace generation and the weaker positive crystalline Hom sandwich. Use the affinoid exact sequence and torsion-Pair Hom vanishing to remove the differential term. Establish the additional positive-period criterion for these Hom maps required by the final equality in Remark 9.9(ii); this is the positive-crystalline-hom contract, not supplied by the sandwich. Then extend scalars to F̂ⁿʳ and dualize, respecting φ; use the affinoid filtered de Rham complex for the displayed filtration.

**Checks.**

- Prove the exact positive equality, not just the t⁻ⁱ sandwich.
- Keep the completed coefficient extension and distinguish it from recovery of the original Fⁿʳ descent datum.

*Needs:* §5.4; §§0.6–0.8, crystalline untwisting and the bounded Hom sandwich; §1.5, affinoid differential quotient; the positive-crystalline-hom contract.

### 5.6 information and scope of the recovery theorems

For a smooth proper X/C the natural Topological Vector Space functor of Hⁱ_proét(X,Q_p) is the constant finite-dimensional Q_p functor. Its geometric period Hom functors therefore retain its rank and the corresponding free extended period modules, while CN25’s extra φ,N and filtration data require additional structure. The full recovery assertions for arbitrary smooth dagger spaces, including the sheafified direction of Remark 9.9(iii), are research problems, not theorem targets discharged by Theorems 9.3 or 9.8.

For rank d, both geometric period-Hom modules are free of rank d; rank zero gives zero. A one-dimensional constant Q_p functor gives B_st and B_dR. This forgetful calculation is not an impossibility theorem about enriched coefficient sheaves.

(CN25 Remark 9.9(i),(iii), p. 58; Conjectures 1.6, 1.8 and 9.1, pp.5,55, CN25 line 2856.)

A proof route uses the following steps. Specialize geometric recovery to a constant finite Q_p functor and identify its natural period Hom modules with finite free modules. Compare the arithmetic theorem’s G_K input with the geometric theorem’s Topological Vector Space functor input. Record the unrestricted conjectures as open and keep all non-small cases outside the finite-module recovery theorem.

**Checks.**

- No universal recovery statement or impossibility theorem is promoted from CN25’s discussion.

*Needs:* §§5.3–5.4; CohomologyComparisons §§4.10–4.11, proper finite-dimensional realization.

### Examples

For X a point over K the arithmetic Hom values are Fⁿʳ and K; over C the geometric Hom values are B_st and B_dR. For the dagger disc in degree one, arithmetic continuous Galois Hom of its differential term is zero although O(D)/C is nonzero. For P¹, the degree-two representation Q_p(−1) has dual period line of jump −1 and Frobenius p⁻¹; a rank-one geometric Hom module records the extended module without that arithmetic normalization (CN25 Lemma 9.5, line 2746; Theorems 9.3 and 9.8, lines 2735, 2821).

### Dependencies

Layers 0–3 except the splitting branch; PadicHodgeTheory §§3.4–3.7 and 5.2; natural-period-hom, qbc-pairs and bounded-arithmetic-filtration contracts. Only the positive crystalline refinement uses positive-crystalline-hom.

## Downstream consumers

The comparison and reconstruction interfaces supply analytic arithmetic geometry with a single fundamental square and its topology. The arithmetic theorem retains smooth Galois descent, Frobenius, monodromy and the Hodge filtration; the geometric theorem supplies extended period modules through natural TVS Hom. A consumer needing finite HK modules uses the smallness hypothesis; the proper-times-Stein theorem supplies a diagram without granting finite-rank recovery. Sheafified recovery for arbitrary smooth dagger varieties is the research direction in CN25 Remark 9.9(iii), p.58, line 2870.

## Worked examples

For the trivial filtered line, the triple of lattices t⁻¹B_dR⁺, B_dR⁺, tB_dR⁺ has degrees 1, 0, −1. The weakly admissible lattice inside the first is B_dR⁺; no slope-zero sublattice exists inside the last. For the geometric point at twist r=1 the simultaneous changes φ↦p⁻¹φ and L↦tL cancel: the vector t is Frobenius-fixed for the twisted total operator and lies in the shifted lattice, so the bundle is O and the period line is Q_p·t. Shifting only the lattice would give O(−1) (CN25 Remark 5.14 and §7.2.2, lines 1809–1832, 2333–2340).

For a smooth proper curve of genus g over K, the period modules have ranks 1, 2g, 1 in degrees 0, 1, 2. The height identities have the same three values and Aʳⁱ=0 at i=r. A Tate elliptic curve has N of rank 1 in degree one, whereas a good-reduction elliptic curve has N=0; both have height 2. Thus height alone does not encode monodromy. For the two-dimensional Tate operator model, exp(uN)(e₁)=e₁+ue₀ and exp(−uN)(e₁+ue₀)=e₁; the nilpotence N²=0 makes these two-term expressions exact (CN25 Theorems 6.4, 6.8 and Proposition 7.10, lines 2000, 2057, 2367).

For the dagger disc at i=r=1, the nonzero class of T in O(D)/C maps to dT under the simplified diagram. It has zero HK image and is precisely part of the curvature-zero Pair. Its height is 0, agreeing with zero de Rham H¹. Replacing filtered-complex cohomology F¹¹ by its image Fil¹¹=0 would erase this class. The example distinguishes the pro-étale group, the filtered group and its image (CN25 Theorem 6.14, line 2098; Corollary 7.9, line 2350).

For the projective line with the infinity section, the functions `Σ_(n≥0)`πⁿTⁿ converge on a disc of radius greater than 1, and sum to (1−πT)⁻¹. Restriction from the analytic affine line to the closed dagger disc cannot produce this function: at T=π⁻¹ the denominator is 0. Both unfiltered de Rham complexes still have cohomology K in degree 0 and 0 in degree 1. This is the negative control against a filtered-complex equivalence, and the lattice-inclusion argument in Layer 3 supplies the slope conclusion (GK04 Corollary 3.8(a),(c), p.16, line 556; CN25 Proposition 8.3, p.51, line 2538).

## References

- **CN25.** Pierre Colmez and Wiesława Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*. [Author CN5 manuscript](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), 24 November 2024, 61 pages; [arXiv:2108.12785v4](https://arxiv.org/abs/2108.12785v4). Published in Duke Mathematical Journal 174 (2025), 2203–2301, [DOI](https://doi.org/10.1215/00127094-2024-0074). All page and line locators here refer to the author manuscript, not the journal pagination. Principal locators are §§5.3–5.4, pp.36–39; Proposition 6.1, pp.39–40; Theorem 6.14 and §6.4, pp.43–45; §§7.2–7.3, pp.46–50; §§8–9, pp.50–58; Appendix A, pp.58–60.
- **GK04.** Elmar Grosse-Klönne, *De Rham cohomology of rigid spaces*, Mathematische Zeitschrift 247 (2004), 223–240. [arXiv:1408.3330v1](https://arxiv.org/abs/1408.3330v1), 14 August 2014. Proposition 3.7, pp.14–16, line 499, and Corollary 3.8(a),(c), p.16, line 556; pages and lines refer to this preprint.
- **BKV22.** Federico Binda, Hiroki Kato and Alberto Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in toric varieties*. [arXiv:2207.00369v2](https://arxiv.org/abs/2207.00369v2), §4, pp.25–26, especially the tube definition preceding Corollary 4.6, lines 1176–1187. Only the tube definition and its integral-trivialization independence are used here; the motive comparison does not replace the HK comparison contract.
