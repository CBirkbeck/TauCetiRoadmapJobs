# Roadmap: solid spectral analytic coefficients

**Summary.** Build the light solid spectral coefficient library from concrete spectra, the light profinite site and the integer solid theory, retaining the sphere and all its homotopy groups. The endpoints are the countable product and split-tower tensor comparisons, balanced scalar change, countable-limit/ω₁-filtered-colimit interchange, the spectral null-family description of completed countable block sums, uniformly bounded-below realization comparisons, and spectral analytic coefficient structures with completed scalar extension and summability localizations.

## Scope and ownership

This roadmap owns the sphere-linear theory of light spectral hypersheaves and solidification, its integer-linear comparison, and the coefficient constructions of Layers 3–7. The ambient light condensed and solid spectral block of RefinedTraceMethods §6.2, “Light condensed and solid spectra”, belongs here in §§1–2 and §6.4. Its discrete embedding, null-sequence definition, reflection, compact generator and bounded-below p-complete statement are retained with the completed unit. RefinedTraceMethods §§6.2–6.4 own trace-class maps, nuclearity, perfect-even sites and even filtrations. They consume this foundational block.

VStackSheavesAndLisseCategories VS2.1 owns solid abelian groups, Breen–Deligne resolutions, integer solidification and its enhanced derived tensor. VS2.2 owns analytic measures, integer-linear analytic structures, analytic spectra and their geometric gluing, including its nonarchimedean coefficient structures. Those objects are imported, with the common-site comparisons their owner specifies. The variants here have sphere-linear coefficients and preserve higher spectral homotopy. GeneralizedCohomology G2 owns concrete spectra; StableHomotopyKTheory §§5.13–5.18 and EnhancedDerivedSheaves E5:spectra-comparison own their abstract and integer-module adapters. Generic enhanced category theory remains in EnhancedDerivedSheaves; the two exact extensions it and VS2.1 must supply are stated below.

The site, ordinary light sheaves, ordinary module tensor, countable exact products and integer solidity predicate are already in the pinned libraries under the declarations listed below. Ordinary light sheaves are not a construction of the enhanced spectral hypersheaf category. No second abelian solidity predicate, spectrum carrier, ordinary tensor or general bar construction is planned here.

HabiroRings §§2.6–2.12 owns the Habiro algebra, its particular factorial filtration, arithmetic scalar idempotence and bounded-below arithmetic monoidality. It instantiates the general coefficient comparisons here. Huber-pair geometry, functional analysis, group representation theory, analytic stacks and six operations belong to their named geometric, functional-analysis and representation owners. The requests labeled SA.1–SA.4 in consumers do not define sections of this roadmap. Integer E-coefficients and common-presentation comparisons are supplied through VS2.2 and §7.4; their Huber-pair and group-ring extensions are identified under Downstream consumers.

## Conventions

Fix universes u<v. Choose an essentially small skeleton of the pinned category of u-small light profinite spaces; diagrams, families of tests and summands are u-small. Coefficient categories are presentable in the compatible enlargement. An enlargement is accompanied by a comparison functor on the stated presentations. A light profinite space is compact Hausdorff, totally disconnected and second countable. Covers are finite jointly surjective families; hyperdescent is part of Cond(Sp). Empty space values and empty products in stable categories are 0. A two-point free object is 𝕊⊕𝕊, so tensoring ranks two and three gives rank six.

Left module categories are used for E₁ coefficients. In compact-generator reconstruction, Map_A(G_A,M) is a right module over End_A(G_A) by precomposition. With matrix units, e₁₂e₂₁=e₁₁ and e₂₁e₁₂=e₂₂; the order is retained in scalar and bar comparisons.

All limits, colimits, cofibers, relative tensors and realizations are coherent derived operations on the supplied enhancement. Write π_k for homological spectral degree, with π_kH(C)=H^(−k)(C). Thus ΣHℤ has π₁=ℤ and π₀=0; cochain ℤ in degree 2 gives π₋₂=ℤ. Tensor symmetry on two suspended generators is −1, while unsuspended coordinate permutations have sign +1. These witnesses are used again in the layers that use the conventions.

The sphere 𝕊 is never replaced by Hℤ. A spectral algebra, an Hℤ-algebra and an animated ring have their distinct carriers and comparison functors. The animated comparison θ is an equivalence only in the rational case specified by EnhancedDerivedSheaves E5:animation.4. Even over 𝔽₂, the group homology of Σ₂ distinguishes its free commutative derived algebra from an animated polynomial algebra.

For C=ℕ∪{∞}, with index0 and marked ∞, σ sends n to n+1. On coefficient sequences σ* sends b_n to b_(n+1). For the two-term finite-support vector e₁, (1−σ*)e₁=e₁−e₀ and (1−σ*)⁻¹e₁=e₁+e₀. This pins the sign and direction in every summability test.

The product ∏_Iδ𝕊 is a product of condensed objects. It is not identified with δ(∏_I𝕊). The map from the former ordinary product’s discrete realization into the condensed product has a specified domain. The sequence e_n tends to0 in the product of discrete integer groups but is not eventually0 in their discrete product group, distinguishing these objects on the convergent sequence.

Finite free sphere modules mean finite coproducts of the unsuspended sphere. Splittings are coherent sphere-linear maps. A polynomial section of A→A/(t) satisfies s(t·1)=0 and t·s(1)=t, so it is not promoted to A-linearity. In examples, 𝕊[t] is the spherical monoid algebra of the discrete monoid ℕ. The truncated monoid algebras have basis 1,t,…,t^(r−1); modulo t², t·t=0. They define 𝕊[[t]] by their inverse limit. They are not the free commutative spectral algebra on a degree-zero generator.

Quotients by a scalar are module cofibers. For a₀=1, B₀=0 and J₀=A; for a zero scalar the quotient is A⊕ΣA. The abstract equivalence J_r≃A does not forget its marked map a_r:A→A. A profile f is proper when each {j:f(j)<r} is finite, and an arrow f→g means f≥g. Thus t^(j+1)A→t^jA is the inclusion for the arrow j+1→j. The quotient transition B_s→B_r is induced by the cofiber square (b_(r,s),id). For p-powers this is (p,id); on H𝔽_p its derived quotient tower has transition diag(id,0) on H𝔽_p⊕ΣH𝔽_p, with limit H𝔽_p. No division by a_r is used. For prime completion, p is any prime, and the tensor unit is the completed sphere: its π₀ at * is ℤ₂ or ℤ₃ at the two smallest primes, with ambient unit comparison ℤ→ℤ_p.

## Exact supplier contracts

### From Mathlib

Use Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a.

- The native `LightProfinite` is defined in Mathlib/Topology/Category/LightProfinite/Basic.lean:42 as a CompHausLike category with total disconnectedness and second countability. `LightProfinite.of`, at line56, requires compactness and Hausdorffness as well. `LightProfinite.effectiveEpi_iff_surjective`, in EffectiveEpi.lean:28, identifies single effective-epimorphism covers with surjections. These are site carriers; they contain no spectral enhancement.
- `LightCondensed`, in Mathlib/Condensed/Light/Basic.lean:28, is exactly the ordinary sheaf category for the coherent topology. `LightCondMod`, in Light/Module.lean:42, is its ModuleCat-valued specialization; `LightCondensed.free` and `LightCondensed.freeForgetAdjunction`, at lines68 and73, supply the ordinary free module and adjunction. `LightCondAb`, at line85, specializes to ℤ. The equivalence of ordinary integer presentations is imported from VS2.1; no unrestricted-site equivalence is inferred from the abbreviation.
- `LightCondensed.discreteUnderlyingAdj`, in Mathlib/Condensed/Discrete/Basic.lean:86, assumes a Category and the indicated HasSheafify and states the ordinary discrete/evaluation adjunction. It supplies the degree-zero comparison, rather than the spectral adjunction of §1.2.
- Mathlib/Condensed/Light/AB.lean:31–37 gives `CategoryTheory.CountableAB4Star` and `CategoryTheory.IsGrothendieckAbelian` instances for light modules over any ring R. This does not state the independent-union law required in gap:light-countable-ab6. Light/Monoidal.lean:41–62 gives `CategoryTheory.MonoidalCategory`, `CategoryTheory.SymmetricCategory` and `CategoryTheory.MonoidalClosed` instances over commutative R and monoidal ordinary sheafification/free functors. Derived solid and spectral tensors use their respective owners.
- `Condensed.profiniteFree`, `Condensed.profiniteSolid` and `Condensed.profiniteSolidification`, in Mathlib/Condensed/Solid.lean:44,48,69, are the ordinary free functor, right Kan extension of finite free objects, and its comparison. `CondensedMod.IsSolid`, at line83, is the map-inversion predicate. Its defining field tests every profinite object; its docstring at lines74–81 restricts this use to finite-type integer algebras and explains the polynomial restriction correction for a general ring. VS2.1–VS2.2 owns that correction and the resulting theory. `LocallyConstant.freeOfProfinite`, in Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153, is Nöbeling freeness for the actual module of locally constant integer functions on any profinite S; its integer measure use stays in VS2.1.

- `LightCondensed.internallyProjective_free_natUnionInfty`, in Mathlib/Condensed/Light/Sequence.lean:302, proves internal projectivity of the free convergent-sequence module for a commutative ring R in Type0. Its variable block at lines20–22 fixes that universe; §1.3 supplies the additional transport on common light presentations. `CategoryTheory.InternallyProjective.ofRetract`, in Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:61, transports this property to the marked integer null summand. The predicate at lines41–47 means internal Hom preserves epimorphisms, not that all sectionwise evaluations preserve epimorphisms.
- `Submodule.basisOfPid`, in Mathlib/LinearAlgebra/FreeModule/PID.lean:298, gives a finite basis of a submodule of a finite free module over a commutative principal ideal domain. Its ℤ instance identifies the finite integer matrix kernel in §3.2; the spectral lift remains a target here.

### From Tau Ceti

Use Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. There is no additional direct Tau Ceti declaration imported by this design. The supplied enhanced and integer roadmaps retain their own pinned sheaf-tensor and dg interfaces. Their spectral comparison is imported by section, rather than presented as a pinned spectral declaration.

### From TauCetiRoadmap.GeneralizedCohomology

G2.1–G2.7 supplies pointed simplicial sets, symmetric spectra and stable/positive-flat monoidal models, true homotopy groups, sphere/free objects and Eilenberg–Mac Lane rings and modules. G3.8–G3.9 supplies coherent ordinary spectral towers and derived prime completion, with its actual completion comparison. The abstract carrier comparison is EnhancedDerivedSheaves E5:spectra-comparison.

### From TauCetiRoadmap.StableHomotopyKTheory

Sections 5.13–5.18 supply operadic algebra/model comparisons, HR-modules and unbounded cochain comparison, π_k=H^(−k), cellular approximation and connective spectrum comparison. Section 5.14 distinguishes absolute sphere tensor from relative HR tensor; the relative tensor of two H𝔽_p over Hℤ has π₁=𝔽_p. No second concrete spectrum or chain-complex model is introduced here.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections0.1–0.3 and E1.3 supply enhanced module sheaves and their tensor/Hom and derived limits on small ringed sites. E5:spectra-comparison supplies the point-site Eilenberg–Mac Lane equivalence; the sheafwise light comparison is the target of §2.3. E0.4 and E0.8 supply stable coherent categories, cardinal filteredness, accessibility and presentability. E2:towers supplies the coherent limit fiber of 1−shift, Milnor and pro-zero APIs. E2.6–E2.7 supplies hypercovers, space-valued sheaves, hypercompletion and the distinction from Postnikov completeness. E3.2–E3.3 supplies accessible localizations, adjoints and compact generation. E5:abstract.2–E5:abstract.5 supplies algebra/module fibers, bar scalar extension, tensor-compatible localization, stable monoidal comparisons and monadic reconstruction. E5:presentability.1–E5:presentability.2 supplies compact objects, presentable-category operations and abstract stabilization. E5:spectra-comparison supplies the concrete spectral and Eilenberg–Mac Lane module comparisons. E5:animation.4 supplies θ and animated-module comparison with its positive-characteristic restriction. E4.1 and E4.4 supplies integer-derived completion and completed tensor where those hypotheses apply; §6.4 proves the extra sphere-linear instance.

**Additional exact contract — gap:cardinal-interchange.** EnhancedDerivedSheaves E0.8 and E5:presentability.2 must supply: for every infinite regular κ, the colimit over any κ-filtered small J in spaces preserves all κ-small limits, compatibly with levelwise stabilization. This is HTT Proposition 5.3.3.3, printed p.394, HTT line18705. The supplied sections define cardinal filteredness and spectra but do not state this general interchange theorem. The extension is EnhancedDerivedSheaves, Part II, in the same categorical direction. §4.1 specializes that contract to the light spectral site.

### From TauCetiRoadmap.VStackSheavesAndLisseCategories

VS2.1, “Solid abelian groups”, “Solidification as a reflection” and “Solid tensor and internal Hom”, supplies the integer full subcategory, reflection, enhanced derived comparison, compact projective integer products and their derived tensor theorem. VS2.2, “Analytic measures and complete modules”, supplies the measure and Dirac data, Hom extension axiom, enhanced reflection, complete tensor/Hom and scalar extension. Its conventions and “Solid nonarchimedean coefficients” supplies common size-bounded light/cutoff realization comparisons and topological E-coefficients. Analytic spectrum and gluing remain there. In particular, the Smith-type measure object has uniformly bounded denominators, rather than arbitrary ∏E.

**Additional exact contract — gap:light-countable-ab6.** VS2.1 must supply: for a countable family of directed systems of subobjects B_(j,α)⊆B_j in light condensed abelian groups, the map colim_(α_j)∏_j B_(j,α_j)→∏_j colim_α B_(j,α) is an isomorphism, naturally and compatibly with the solid full inclusion. RC Theorem 2.3.3(1), pp.12–13, RC line539, supplies its abelian model. Countable exact products alone do not state this law. This missing abelian continuation is proposed as VStackSheavesAndLisseCategoriesPartIII §1.1; the geometric VStackSheavesAndLisseCategoriesPartII VS6–VS11 keeps its scope. §4.2 uses the abelian contract, and §5.3 uses that spectral application.

## How to read the build

Layer 1 fixes the site and null test. In Layer 2, §2.1 proves the preliminary null-Hom and homotopy calculation before §2.2 constructs reflection and module tensor; §2.3 then compares Hℤ-linear coefficients and §2.4 identifies the compact generator. Layer 3 proves product and split-tower comparisons and applies the supplied bar formalism to balanced tensor. Layer 4 separates ω₁-filtered interchange from independent directed support bounds. Layer 5 constructs the complete filtered datum and proves its spectral null-family theorem in every degree. Layer 6 supplies bounded-below resolutions, the exact connectivity estimates for realizations, and the retained p-complete comparison. Layer 7 builds the sphere-linear analytic structures and their measure comparison. Locators described as integer models or arithmetic models identify the argument being extended; the sphere-linear extensions are the targets stated here, with their full hypotheses. Neither a legal-source status nor an integer comparison is substituted for their proofs.

## Layer 1: Light spectral sheaves and the null-sequence test

### 1.1 The ambient category

Fix a small skeleton of second-countable profinite spaces in universe u, with finite jointly surjective covering families. Define Cond(Sp) as hypercomplete spectrum-valued sheaves on this site. Construct a presentable stable closed symmetric monoidal enhancement, with tensor obtained by hypersheafifying the sectionwise tensor. Its limits are sectionwise; its colimits are hypersheafified sectionwise colimits. Construct the free spectral sheaf 𝕊[T] representing evaluation at each light profinite T. Prove that hypercovers can be refined by simplicial light profinite objects, so each descent comparison involves a countable diagram. (RC, Definition 4.0.1, pp.27–28, RC line 1392; W paragraph 2.1, p.11, W line 437).

A proof route is to apply the supplied hypercomplete-space-sheaf localization and stabilization to the pinned site. Verify stability of descent under shifts and that the hypercover localization is compatible with tensor on free representables. Induct on matching degrees to choose finite covering refinements; finite disjoint unions and finite limits remain light profinite. Use the free-object mapping property for closedness and descent.

*Needs:* Mathlib `LightProfinite`; Mathlib `LightProfinite.effectiveEpi_iff_surjective`; Mathlib `LightCondensed`; GeneralizedCohomology G2.1–G2.7; EnhancedDerivedSheaves E0.4; EnhancedDerivedSheaves E0.8; EnhancedDerivedSheaves E2.6–E2.7; EnhancedDerivedSheaves E3.2; EnhancedDerivedSheaves E5:presentability.2.

The API has the following laws.

- For each light profinite T, the free object has Map(𝕊[T],M) ≃ M(T), naturally in T and M.

- Maps agree when their maps of values agree coherently on the site; equivalences are detected on all values.

- For every hypercover U•→T, M(T)→Tot M(U•) is an equivalence.

- The free-object tensor is 𝕊[T]⊗𝕊[U] ≃ 𝕊[T×U], including empty T or U.

**Checks.**

- The empty space evaluates to 0, excluding the constant presheaf with nonzero empty value.

- For a disjoint pair, the sheaf value is two factors, and the free object is two spheres.

- The degree-zero integer homotopy sheaves use LightCondAb; an ordinary Category-valued sheaf alone does not encode spectral hyperdescent.

### 1.2 Discreteness and point evaluation

For every spectrum X construct δX as the hypercomplete constant sheaf. Prove δ ⊣ ev_* with unit X→(δX)(*) an equivalence, and δ𝕊≃𝕊 and δ(X⊗Y)≃δX⊗δY coherently. Hence δ is fully faithful and preserves all small colimits. Identify the homotopy sheaf π_k(δX) with the discrete sheaf on π_kX for every integer k. The comparison from δ of an inverse limit to the limit of δ is a specified natural map, with no general equivalence assertion. (W, Paragraph 2.1, p.11, W line 437; MW paragraph 4.1, p.41, MW line 1748).

A proof route is to use constant sheafification and the terminal point to construct the adjunction. Compute the unit at the point and the tensor comparison on constant free spectra, then extend by colimits and stabilization. Compare degree-zero truncation with the pinned ordinary adjunction.

*Needs:* §1.1; Mathlib `LightCondensed.discreteUnderlyingAdj`.

The API has the following laws.

- A spectral map X→Y induces δX→δY, preserving identities, composites, zero maps and all integer shifts.

- The adjunction unit is the natural equivalence X→(δX)(*), including its action on every π_k.

- The tensor and unit comparisons of δ satisfy symmetry, associativity and unit coherences.

**Checks.**

- δ0=0 and the adjunction unit at 0 is the identity of 0.

- For X=𝕊⊕Σ𝕊, π₀δX is ℤ and π₁δX contains the shifted ℤ summand.

- The inverse limit of discrete H(ℤ/p^r) has continuous ℤ_p-valued sections. On T=ℤ_p its identity section is not locally constant, so it is not δHℤ_p.

### 1.3 The marked null sequence

Let C=ℕ∪{∞} with the one-point compactification topology, and define N=cofib(𝕊[{∞}]→𝕊[C]). Define σ:N→N from the continuous map n↦n+1, ∞↦∞, using its compatibility with the marked point. All maps and cofibers are in Cond(Sp). Construct the universe-lifted marked compactification and compare the free integer null summand, shift and internal projectivity with the pinned Type0 model. At the base universe, internal projectivity is imported; the additional target is its natural scalar/site transport on the common light presentations, not another base-universe proof. (W, Paragraph 2.1, p.11, W line 443; RC Definition 3.2.1, p.16, RC line 730).

A proof route is to apply the free-sheaf functor to the marked inclusion and shift, then use functoriality of cofibers. The finite-support calculation against discrete integers fixes precomposition and the sign. The ordinary marked-point map splits by the constant map to the point, so the integer null summand is a retract of the free convergent-sequence module. Use the pinned internal projectivity theorem at Type0 and the pinned retract lemma. For larger universes, construct the marked ULift and scalar-lift comparisons and verify the internal lifting test over each common light presentation: the countable fiber products and finite covering diagrams are transported before passing to free objects. This universe-transport statement is an additional target, with no claim that the pinned theorem is universe-polymorphic.

*Needs:* §1.1; Mathlib `LightCondensed.internallyProjective_free_natUnionInfty`; Mathlib `CategoryTheory.InternallyProjective.ofRetract`; VStackSheavesAndLisseCategories VS2.1; VStackSheavesAndLisseCategories VS2.2.

The API has the following laws.

- A continuous map of pointed compactifications induces the corresponding map of cofibers, with identity and composition laws.

- Internal Hom from N to M is the fiber of internal Hom(𝕊[C],M)→internal Hom(𝕊[{∞}],M).

- For a map with coefficient sequence b, precomposition σ* has coefficient at n equal to b_(n+1).

- On common light presentations, universe/scalar lifts commute with the marked point, null summand and shift and transport the integer internal-projectivity lifting test.

**Checks.**

- The free cofiber on a singleton marked point is 0, excluding an unreduced free object.

- Against δHℤ, (1−σ*)e₁=e₁−e₀ and its inverse sends e₁ to e₁+e₀.

- A right shift on coefficient sequences sends e₁ to e₂ and fails the computed witness.

### 1.4 Spectral solidity

A spectrum-valued hypersheaf M is solid when 1−σ* is an equivalence of internal Hom objects Hom(N,M)→Hom(N,M). Define Sp■ as the full subcategory on this property. Equivalently, M is right-orthogonal to cofib(1−σ:N→N) after tensoring that cofiber with every free 𝕊[T]; the internal and externally tested formulations must agree. (W, Paragraph 2.1, p.11, W lines 443–451; MW paragraph 4.1, MW line 1754).

A proof route is to use tensor–Hom adjunction and free-object evaluation to turn an internal equivalence into the displayed family of vanishing mapping spectra. This supplies an actual set of localization tests, including every shift.

*Needs:* §1.3; §1.1.

The API has the following laws.

- Solidity is equivalent to Map(cofib(1−σ)⊗𝕊[T],M)=0 for every T.

- An equivalence of hypersheaves transports solidity; the full-subcategory inclusion is fully faithful.

- Every δX is solid for arbitrary X, with the finite-support inverse of 1−σ* agreeing with the integer witness.

**Checks.**

- 0 is solid, with the unique self-map of its zero Hom an equivalence.

- δ𝕊 is solid with π₀=ℤ and π₁=ℤ/2; replacing spectra by Hℤ-modules loses the latter sphere class.

- N is not solid: its pointwise π₀ is ⊕_ℕℤ, whereas its solidification has product π₀ and contains the all-one vector.

### Examples

The empty profinite space has value 0; a disjoint pair has value X(*) × X(*). The convergent sequence, with its distinguished limit point, fixes the shift used throughout the build.

### Dependencies

Pinned light profinite and sheaf carriers; GeneralizedCohomology G2.1–G2.7; EnhancedDerivedSheaves E0.4, E0.8, E2.6–E2.7, E3.2 and E5:presentability.2.

## Layer 2: Solidification, homotopy and the compact generator

### 2.1 The spectral homotopy structure

First prove, inside Cond(Sp), that Hom(N,−) is t-exact and preserves small colimits; its homotopy sheaf in degree k is the internal abelian Hom from the integer null object to π_k. Deduce that M is solid exactly when every π_kM is integer-solid on the light site. The homotopy t-structure restricts to the stable full subcategory Sp■, has heart the light realization of SolidAb, is nondegenerate and left and right complete, and is compatible with filtered colimits and countable products. Compare truncations and shifts with ordinary spectra and the supplied integer enhancement. (RC, Theorem 2.3.3(1)–(3), pp.12–13, RC line 537; Theorem 3.2.4(6), p.17, RC line 764; proof RC line 870 (integer model)).

A proof route is to lift the pinned integer internal-projectivity result, its marked retract and the universe transport of §1.3, together with the compactness calculation through bounded Postnikov intervals. Use exact countable products and the supplied tower fiber formula to pass to unbounded spectra. The light finite-cover lifting argument gives colimit preservation; it does not claim that every representable is projective. The internal-Hom test then reduces solidity to integer solidity in every homotopy sheaf. Countable exact products and the replete light-site descent prove Postnikov convergence and effectivity here, rather than assuming this for every hypercomplete topos.

*Needs:* §1.1; §1.3; VStackSheavesAndLisseCategories VS2.1; Mathlib `LightCondensed`; Mathlib `LightCondMod`; EnhancedDerivedSheaves E2:towers; EnhancedDerivedSheaves E5:spectra-comparison; StableHomotopyKTheory §§5.15–5.18; Mathlib `CategoryTheory.CountableAB4Star`; Mathlib `CategoryTheory.IsGrothendieckAbelian`.

The API has the following laws.

- All homotopy truncations preserve solidity; their unit/counit maps have the stated π_k isomorphism and vanishing ranges.

- The heart inclusion identifies a solid integer group B with HB, with π₀=B and all other homotopy sheaves zero.

- Suspension sends the lower bound b to b+1 and gives π_k(ΣM)=π_(k−1)M.

**Checks.**

- ΣHℤ has π₁=ℤ and π₀=0; cohomological ℤ in degree 2 corresponds to π₋₂=ℤ.

- The zero module lies in every connective and coconnective range.

- A=𝕊⊕Σ𝕊 with square-zero ideal is connective and has a nonzero π₁; its heart does not determine A as a spectral algebra.

### 2.2 Reflection and closed tensor

Construct the accessible reflection L■:Cond(Sp)→Sp■. Prove that the inclusion creates all small limits and colimits and that Hom(C,M) is solid whenever M is solid and C is any condensed spectrum. Prove tensor compatibility L■(C⊗D)≃L■(L■C⊗D), and equip Sp■ with closed symmetric monoidal tensor C⊗■D=L■(C⊗D), unit δ𝕊 and the ambient internal Hom into solid targets. Prove L■ preserves connective objects. For a connective E₁ solid A, Mod_A has the underlying homotopy t-structure. For connective commutative A, tensor over A sends degrees ≥b and ≥c to degrees ≥b+c, for all integers b,c. For every light profinite T presented as a sequential limit of finite quotients T_n, construct L■𝕊[T]≃lim_n δ𝕊[T_n], independent of the presentation and compatible with its free-object unit. (W, Paragraph 2.1, p.11, W lines 448–451; RC Theorem 3.2.4(5)–(8), p.17, RC line 761 (integer model); RC Theorem 3.2.4(12), p.17, RC line 773 (free measure model)).

A proof route is to construct the free solid measure on a profinite T from its finite clopen quotients. Use the exact null-Hom and homotopy tests of §2.1 and the imported integer measure universal property to identify maps from this limit into every solid M, first on bounded Postnikov intervals and then using the complete homotopy structure. Its unit is induced by the finite projections. Extend this free-object reflection to spectral sheaves by its mapping universal property and accessible localization. These free measure objects are connective; connective free resolutions therefore give connective preservation of L■. Tensor–Hom adjunction makes the kernel a tensor ideal and proves Hom closure; apply monoidal localization. Transfer the homotopy structure to modules over connective algebras and prove the tensor bound on connective free cells.

*Needs:* §1.4; EnhancedDerivedSheaves E3.2; EnhancedDerivedSheaves E5:abstract.3; VStackSheavesAndLisseCategories VS2.1; §2.1.

The API has the following laws.

- For solid M, precomposition with C→L■C gives Map(L■C,M)≃Map(C,M); its counit is invertible.

- The two units L■C→L■L■C agree and are equivalences.

- For solid C,D,M, Hom(C⊗■D,M)≃Hom(C,Hom(D,M)), coherently with symmetry and units.

- For every sequential finite-quotient presentation of T, the free solid measure object is the displayed limit; its unit is induced by the finite projections, and maps of T act covariantly.

**Checks.**

- L■0=0 and 0⊗■M=0.

- L■δ𝕊=δ𝕊, and δ𝕊⊗■M=M.

- Internal Hom into a solid target is computed in Cond(Sp), rather than by forgetting condensation.

### 2.3 The Hℤ-linear comparison

Construct a symmetric monoidal t-exact equivalence Mod_{δHℤ}(Sp■)≃D(SolidAb_light) on the common enhancement. It identifies solidification of Hℤ-module sheaves with derived integer solidification, including the units and the internal-Hom comparison. For every integer b and solid X with π_kX=0 for all k<b, the unit-induced map X→δHℤ⊗■X induces an isomorphism on π_b. Consequently Hℤ⊗■− detects zero objects among bounded-below solid spectra. Compare modules over θB for animated B through the supplied animated-to-commutative-algebra functor, without identifying animated rings with arbitrary connective spectral algebras. (MW, Paragraph 4.1, p.41, MW line 1763; RC Theorem 3.2.4(9)–(11), p.17, RC line 769).

A proof route is to use the supplied point-site equivalence Mod_Hℤ(Sp)≃D(ℤ), then construct its sheafwise comparison with the enhanced ringed-site derived category of §§0.1–0.3 and E1.3. Compare bounded Postnikov intervals by hypercover descent; §2.1 and exact countable products justify passage to the unbounded light setting. Identify the resulting solid localization tests with those of VS2.1 and compare the monoidal localizations by their universal properties. The connective cofiber of 𝕊→Hℤ and the tensor bound of §2.2 give first-homotopy detection for bounded-below spectra. The sheafwise comparison is a target here, not a theorem claimed from the point-site supplier.

*Needs:* §2.1; §2.2; VStackSheavesAndLisseCategories VS2.1; EnhancedDerivedSheaves E5:spectra-comparison; EnhancedDerivedSheaves E5:animation.4; StableHomotopyKTheory §§5.14–5.16; EnhancedDerivedSheaves §§0.1–0.3; EnhancedDerivedSheaves E1.3; EnhancedDerivedSheaves E2.6.

**Checks.**

- The spectral Hℤ-module unit corresponds to ℤ concentrated in cohomological degree 0.

- H𝔽_p⊗_{Hℤ}H𝔽_p has π₀=π₁=𝔽_p and other homotopy zero, including p=2,3.

- Over 𝔽₂, a free commutative derived algebra retains positive symmetric-group homology, whereas the animated polynomial algebra is discrete.

### 2.4 The free solid generator

Put G=L■N. Construct an equivalence G≃∏_ℕδ𝕊, with the product in Cond(Sp), and prove G is connective, compact and a generator of Sp■. For any E₁ algebra A, G_A=A⊗■G is a compact generator of left A-modules. For connective A it is connective and its degree-zero homotopy is a projective generator of the heart. The homotopy sheaves of G are ∏_ℕδπ_k𝕊, and Hℤ⊗■G corresponds to ∏_ℕℤ. For connective A, Map_A(G_A,−) is t-exact and the endomorphism spectrum R_A=Map_A(G_A,G_A) is connective; precomposition makes Map_A(G_A,M) a right R_A-module. (W, Paragraph 2.3, p.12, W line 472; RC Theorem 3.2.4(12), p.17, RC line 773 (integer model)).

A proof route is to build the free solid measure on the convergent sequence by its finite clopen partitions, using the spectral Postnikov comparison and integer measure calculation. Identify the marked summand with the product. Null-Hom compactness gives compactness after reflection; the vanishing tests and integer detection on homotopy sheaves give generation. Transfer compactness and generation by the free/forgetful module adjunction.

*Needs:* §2.1; §2.2; §2.3; VStackSheavesAndLisseCategories VS2.1; EnhancedDerivedSheaves E3.3; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:presentability.1; §1.3.

The API has the following laws.

- The map N→G is the reflection unit and its maps to the finite partition quotients determine the product comparison.

- For every integer k, π_kG=∏ℕδπ_k𝕊, with the finite-coordinate evaluation maps.

- For every E₁ A, Map_A(A⊗■G,M)=Map(G,UM); this transports compactness and zero detection.

**Checks.**

- At the point, π₀G=∏_ℕℤ and the all-one vector is present.

- The null family e_n gives a continuous map of the convergent sequence to π₀G; as a map into the discrete group ∏_ℕℤ it is not continuous.

- For A=0 the module category and G_A are both zero; generation is still the zero-object detection assertion.

### Examples

The solid sphere retains its higher stems. Integer-linearization sends the solid null generator to the product of integers, while it does not identify all solid spectra with integer-linear objects.

### Dependencies

Layer 1; VStackSheavesAndLisseCategories VS2.1; EnhancedDerivedSheaves E3.2–E3.3, E5:abstract.2–E5:abstract.3, E5:presentability.1 and E5:spectra-comparison; StableHomotopyKTheory §§5.13–5.18.

## Layer 3: Countable products, split towers and balanced tensor

### 3.1 Product tensor comparison

For all countable sets I,J, including finite and empty sets, the projection-induced map (∏_Iδ𝕊)⊗■(∏_Jδ𝕊)→∏_(I×J)δ𝕊 is an equivalence, natural under reindexing and coherent with units, symmetry and associativity. Identify the map on integer-linearization with VS2.1’s derived product tensor. (Q, Proof of Lemma B.8, printed p.79, Q line 3672; RC Theorem 3.2.4(13), p.17, RC line 777).

A proof route is to use G and its finite retracts to identify the integer-linearization of each product with the integer product. Both sides and the cone of the comparison are bounded below. Apply the imported integer product theorem and bounded-below Hℤ-detection of §2.3. Identify the equivalence by its individual projections so all reindexing and coherence diagrams are determined.

*Needs:* §2.2; §2.3; §2.4; VStackSheavesAndLisseCategories VS2.1.

**Checks.**

- If I=∅ the empty product in the stable category is 0, so both sides vanish.

- For |I|=2 and |J|=3, both sides are six spheres and the coordinate (1,2) projection is the tensor of those two projections.

- Swapping two degree-one suspended sphere factors multiplies the generator by −1; unsuspended coordinate reindexing has sign +1.

### 3.2 Coherently split finite free towers

A split finite free sphere tower is a functor P:ℕᵒᵖ→Sp with a finite sphere basis at each stage, a sphere-linear section s_n:P_n→P_(n+1) of each transition d_n, and coherent choices identifying composites with their iterated splittings. Maps are coherent maps of diagrams; a map need not preserve the chosen sections. Construct the coherent identification of P_n with P_0 plus the first n split kernels, each kernel a finite free sphere module, and hence lim δP as the countable product of these sphere factors. (Q, Proof of Lemma B.8, printed p.79, Q lines 3672–3674 (split-tower argument)).

A proof route is to split successive fiber sequences. A retract of a finite sphere sum is a finite projective integer matrix summand and is again a finite sphere sum, using Submodule.basisOfPid over ℤ for the finite matrix image and bounded-below Hℤ-detection for its spectral lift. Identify the limit of the resulting finite partial products with the full product; use coherent tower maps to prove independence of the chosen decomposition.

*Needs:* §2.4; EnhancedDerivedSheaves E2:towers; GeneralizedCohomology G2.4; EnhancedDerivedSheaves E5:abstract.4; Mathlib `Submodule.basisOfPid`; §2.3.

The API has the following laws.

- Finite sphere bases, transitions, sections and coherent right-inverse identities determine a split tower.

- Coherently equal stage maps give equal maps of tower limits.

- P_n≃P_0⊕⊕_(r<n)ker d_r and lim δP≃δP_0×∏_rδker d_r.

- Different specified sections give equivalent product presentations of the same limit, compatible with its stage projections.

**Checks.**

- The constant zero tower has every kernel and limit 0; a constant rank-one identity tower has limit 𝕊.

- For P_n=𝕊^(n+1), the ranks at n=0,1,2 are 1,2,3 and the kernels all have rank 1.

- Multiplication by 2 on 𝕊 is not a split surjection: an integer b with 2b=1 does not exist.

### 3.3 Independent towers

For any two split finite free sphere towers P,Q, the map (lim_m δP_m)⊗■(lim_n δQ_n)→lim_(m,n)δ(P_m⊗Q_n) induced by stage projections is an equivalence. Restricting the right side to the diagonal n=m is also an equivalence. Both comparisons are natural for all coherent maps of towers, including maps which change the chosen sections. (Q, Proof of Lemma B.8, printed p.79, Q line 3672).

A proof route is to decompose both towers into finite partial products of their split kernels. Apply §3.1 to their countable limits and regroup the product over pairs of factors. Finite-stage projections identify the resulting map with the stated comparison. Use cofinality of the diagonal in the product inverse index, retaining its direction.

*Needs:* §3.1; §3.2; EnhancedDerivedSheaves E2:towers.

**Checks.**

- Two constant rank-one towers give 𝕊⊗■𝕊≃𝕊.

- At m=1,n=2 for the growing rank n+1 towers the independent stage has 2·3=6 summands.

- A section of A→A/(t) given by constant polynomials over the sphere is not A-linear: s(t·1)=0 while t·s(1)=t.

### 3.4 Balancing and change of scalars

For commutative A in Sp■ and A-modules X,Y, construct the natural equivalence X⊗■_A Y≃(X⊗■Y)⊗■_(A⊗■A)A, with the latter action given by multiplication A⊗■A→A. Compute both sides by the supplied two-sided bar constructions and identify their bisimplicial realizations. For maps A→B→C, give coherent identity, associativity and ordinary pushout base-change comparisons of relative tensor. If B is dualizable as an A-module, prove B⊗■_A lim_K M≃lim_K(B⊗■_A M) for every small diagram M. Without this hypothesis, apply balancing to the completed object produced by §3.3; do not move B through its inverse limit. (Q, Proof of Lemma B.8, printed pp.79–80, Q lines 3672 and 3685 (spectral application of relative tensor)).

A proof route is to use the existing scalar-extension adjunction and bar model. Fubini for geometric realizations compares the two bar objects; their faces are multiplication and module action, which fixes the comparison. Dualizability makes B⊗_A− also a right adjoint and hence limit-preserving.

*Needs:* §2.2; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:abstract.4.

**Checks.**

- For A=𝕊 both sides are X⊗■Y; if X=0 both are 0.

- For A=𝕊[t], X=Y=A, the absolute tensor has π₀=ℤ[t₁,t₂], and balancing sends t₁ and t₂ to t.

- Over Hℤ, rational scalar extension of ∏_ℕℤ has uniformly bounded denominators. The element (1/2^n)_n lies in ∏_ℕℚ but not in (∏_ℕℤ)⊗ℚ, so arbitrary scalar extension cannot commute with this product.

### Examples

A rank-two stage tensored with a rank-three stage has six sphere summands. For a polynomial coefficient algebra the absolute tensor has two variables; multiplication to the balanced tensor identifies them.

### Dependencies

Layer 2; EnhancedDerivedSheaves E2:towers, E5:abstract.2–E5:abstract.4 and E5:presentability.1; integer products from VStackSheavesAndLisseCategories VS2.1.

## Layer 4: Countable limits and independent support bounds

### 4.1 Countable-limit interchange

Let K be a small category whose nerve has countably many nondegenerate simplices, let J be a small ω₁-filtered category, and let F:J×K→Cond(Sp) be any coherent diagram. The comparison colim_j lim_k F(j,k)→lim_k colim_j F(j,k) is an equivalence. Prove the same assertion in Sp■ and in left modules over any fixed E₁ solid spectral algebra. In these categories ω₁-filtered colimits of hypersheaves are computed sectionwise. (HTT, Proposition 5.3.3.3, printed p.394, HTT line 18705; RC Remark 4.0.3, p.28, RC line 1411; Q line 3688).

A proof route is to import the abstract cardinal-filtered limit theorem specified in the gap contract. Apply it levelwise to spectra, then to the countable hypercover refinements of §1.1; hence a sectionwise ω₁-filtered colimit remains a hypersheaf. Limits are sectionwise. Use creation of limits and colimits by solid inclusion and by the fixed-algebra module forgetful functor.

*Needs:* §1.1; §2.2; EnhancedDerivedSheaves E0.8; EnhancedDerivedSheaves E5:presentability.2; gap:cardinal-interchange.

**Checks.**

- For K empty, both sides are 0; for J a point both sides are lim_K F.

- For F(n,k)=Hℤ when k<n and 0 otherwise, with J=ℕ and discrete K=ℕ, the two π₀ groups are ⊕_ℕℤ and ∏_ℕℤ, respectively.

- For K a point the map is the identity on colim_J F; no countable product assertion is used in this case.

### 4.2 Independent bounds in the heart

For a countable family of light solid abelian groups B_j and directed systems of subobjects B_(j,α)⊆B_j, the natural map colim_(α_j)∏_j B_(j,α_j)→∏_j colim_α B_(j,α) is an isomorphism of light solid sheaves. In a countable split tower of finite sphere sums, prove that π_k of its limit is the inverse limit of the π_k sheaves for every integer k, and that every projection is surjective on π_k. These statements provide independent coordinate bounds and eliminate the lim¹ error used in §5. (RC, Theorem 2.3.3(1)–(2), pp.12–13, RC line 539; Bosco Lemma A.4 proof, p.93, Bosco lines 3504–3521).

A proof route is to import countable AB6 for the light abelian carrier rather than construct it again. The full solid inclusion creates these operations. For towers, apply the split decomposition and countable exact products to each homotopy sheaf; the shift map on the product is surjective by the chosen sections, so its cokernel lim¹ vanishes. Use these two results separately; no common index for all coordinates is required.

*Needs:* §2.2; §3.2; gap:light-countable-ab6; EnhancedDerivedSheaves E2:towers; §2.1.

**Checks.**

- For B_j=ℚ and subgroups (1/n!)ℤ, independent choices include (1/(j+1)!)_j, while the diagonal union has only uniformly bounded denominators.

- With every B_j=0 both sides are 0; an empty product is also 0 in abelian groups.

- For truncation towers ℤ^(n+1), the projection of ℤ^ℕ to the first n+1 coordinates is onto and lim¹=0.

### Examples

Ordinary filtered colimits do not commute with countable products: the all-one vector distinguishes finite-support vectors from all vectors. The separate independent-bound calculation is used for null families.

### Dependencies

Layers 1–3; EnhancedDerivedSheaves E0.8 and E5:presentability.2, with gap:cardinal-interchange; VStackSheavesAndLisseCategories VS2.1, with gap:light-countable-ab6.

## Layer 5: Complete filtered coefficients and spectral null families

### 5.1 The coefficient datum and derived completion

A complete split coefficient datum consists of a connective commutative solid spectral algebra A, elements a_r∈π₀A(*) with a₀=1, representatives and coherent divisibility maps a_s=a_r b_(r,s) for r≤s, and the induced coherent quotient tower B_r=cofib(a_r:A→A). Its unit A→lim_r B_r must be an equivalence. Each B_r, as a condensed spectrum, has a specified equivalence with δP_r for a finite free sphere module, and the transitions are equipped with coherent sphere-linear sections. Define J_r=fib(A→B_r), with its marked map to A, and Λ_a(M)=lim_r cofib(a_r:M→M)=lim_r(M⊗■_A B_r). Quotients here are A-modules; no commutative algebra structure on a cofiber is assumed. (Q, Proof of Lemma B.8, pp.79–80, Q lines 3672–3688 (model for the general spectral datum)).

A proof route is to form cofibers from specified multiplication maps, using divisibility to construct every transition square. Form fibers and completion as coherent limits. Identify J_r abstractly with A by the fiber/cofiber triangle, while retaining its map a_r to A; the filtration is carried by the marked map, not by the unmarked object. Naturality of these constructions supplies the API.

*Needs:* §3.2; §3.3; §3.4; EnhancedDerivedSheaves E2:towers.

The API has the following laws.

- The displayed algebra, multiplication representatives, divisibility homotopies, split stages and completeness equivalence determine the datum; equivalent coherent data induce equivalent completions.

- J_r≃A and its map to A is multiplication by a_r; for r≤s the map J_s→J_r is multiplication by b_(r,s).

- There is a natural map M→Λ_a(M), and scalar-linear maps commute with it and with all quotient projections.

- A cofinal reindexing of the coherent tower induces an equivalence of completions, compatible with the unit.

- The quotient cofiber of multiplication on M is M⊗■_A B_r; the statement concerns modules and uses no quotient algebra.

**Checks.**

- Construct A as lim_r δ(𝕊[t]/t^r), whose underlying split stages have ranks r and preserve all sphere stems. Multiplication by t has cofiber 𝕊.

- A=0 with its unique unit and zero stages is admitted; all J_r and all completions are 0.

- The tower 𝕊/p^r is not a split finite free sphere tower: π₀(𝕊/p)=ℤ/p is not finite free over ℤ. The p-adic theorem is §6.4, with its separate hypotheses.

### 5.2 Proper profiles and their order

A proper profile is a function f:ℕ→ℕ such that for every r the set {j | f(j)<r} is finite. Order profiles by an arrow f→g when f(j)≥g(j) for every j. For countable sets I_j define V_f=∏_j∏_(i∈I_j)J_(f(j)), with transition V_f→V_g induced by the marked ideal maps. Define a block map as an A-linear map on the uncompleted direct sums for which each entire input block factors through a specified finite sum of output blocks; include the actual coherent factorizations as data. (Q, Proof of Lemma B.8, p.80, Q lines 3693–3705; Bosco Lemma A.4, p.93, Bosco line 3488).

A proof route is to use pointwise minimum for cocones on pairs of profiles, and ideal inclusions for the transition functor. Prove properness is invariant under altering finitely many values and that every finite-support family belongs to a profile stage. Construct block-map identity and composition by taking finite unions of the given output supports.

*Needs:* §5.1.

The API has the following laws.

- A function with the displayed finite-sublevel-set condition determines a profile; equality is pointwise equality.

- The profile category is nonempty and filtered, with a common target min(f,g); it is not ω₁-filtered.

- Identity transitions are identities and transitions compose according to the divisibility coherences.

- Identity block maps and composites have finite output supports for each input block.

**Checks.**

- f(j)=j is proper; f(j)=0 fails for r=1, whose sublevel set is all ℕ.

- When every I_j is empty, each V_f=0.

- The countable family max(j−k,0) has no common target profile, excluding use of §4.1 for this colimit.

- The identity block map has output support {j} on block j; the zero block map has empty support and induces the zero map on every quotient.

- The duplication j↦{2j,2j+1} followed by the same duplication has outputs {4j,4j+1,4j+2,4j+3}, a finite set of size4.

- For a_r=t^r and f(j)=j+1→g(j)=j, the j-th ideal map sends t^(j+1)x to the same element of t^jA; reversing the inclusion would fail on t^j.

### 5.3 The completed countable-sum formula

For every complete split coefficient datum and countable block sets I_j, put F_I=⊕_j∏_(i∈I_j)A. Construct a natural equivalence colim_(f proper) V_f→Λ_a(F_I) in Sp■, hence also in Cond(Sp) and on underlying spectra at the point. Its map modulo a_r is obtained by retaining the finitely many blocks with f(j)<r; blocks with f(j)≥r map to zero by the specified divisibility nullhomotopies. The equivalence is of spectra, not just a π₀ identification. (Q, Proof of Lemma B.8, p.80, Q line 3688 and displayed formula Q lines 3693–3705; Bosco Lemma A.4 proof, Bosco lines 3504–3521 (abelian model)).

A proof route is to compare each finite quotient with ⊕_j∏_I_j B_r, using exactness of countable products and the split finite sphere stages. The tower transitions are split on each homotopy sheaf, so there is no lim¹ contribution. Identify compatible quotient sections with block families tending uniformly to zero in each block: for every r only finitely many blocks survive modulo a_r. The independent-union calculation in §4.2 constructs one proper profile dominating these bounds, locally as a sheaf statement. Apply the same calculation to every homotopy sheaf and use nondegeneracy to prove equivalence. Establish the needed monomorphism π_kJ_r→π_kA from the surjectivity in §4.2. Never apply ω₁-filtered interchange to the profile colimit.

*Needs:* §4.2; §5.1; §5.2; §2.2; §2.1.

**Checks.**

- For I_j a singleton and A=𝕊[[t]], the family (t^j)_j occurs, whereas (1)_j does not; modulo t^r only j<r remain.

- If only blocks 0 and 1 are nonempty singletons, both sides are A²: choose a proper profile with f(0)=f(1)=0.

- For I₀=ℕ and all other blocks empty, both sides are ∏_ℕA. The allowed zero value at j=0 does not force decay within that block.

### 5.4 Every degree and finite-output block maps

For every integer k, the equivalence of §5.3 induces π_kΛ_a(F_I)≃colim_f∏_j∏_(i∈I_j)π_kJ_(f(j)) as light solid homotopy sheaves. It is natural for the coherent finite-output block maps of §5.2 and for maps of complete split coefficient data which carry their marked ideal towers to each other. Under a block map, sums over input blocks are defined by their finite reductions modulo each a_r, not by an unqualified infinite sum in A. (Q, Proof of Lemma B.8, p.80, Q lines 3688–3705; Bosco Lemma A.4 proof, p.93, Bosco line 3510 (models for spectral extension)).

A proof route is to use filtered-colimit compatibility of homotopy sheaves and exact countable products. At each quotient only finitely many input blocks remain; their finite output supports have finite union. These reductions define a map into completion. Compare it with the functorial completion of the original block map via the quotient projections, and then transport by §5.3.

*Needs:* §5.3; §5.2; §2.2; §2.1.

**Checks.**

- For k<0 every term is 0 because the split coefficient ideals are connective; the completed free block sum is connective.

- For A=𝕊[[t]], π₁A=(ℤ/2)[[t]] and the degree-one family (ηt^j) has modulo t² survivors η and ηt.

- The map sending input block j to blocks 2j and 2j+1 sends t^j to two copies of t^j; modulo t² only outputs 0,1,2,3 survive. A block mapped simultaneously to every output is excluded by the finite-output condition.

### Examples

The formal-variable tower 𝕊[[t]]/(t^r) has ranks 0,1,2 at r=0,1,2, giving a coefficient example independent of arithmetic. Proper profiles describe uniform decay of each entire block, including infinite blocks.

### Dependencies

Layers 2–4; the independent-union supplier gap in §4.2; the integer p-adic model is Bosco Lemma A.4 and the sphere-linear model is Q, proof of Lemma B.8. No Habiro-specific statement is an input.

## Layer 6: Bounded-below resolutions, realizations and prime completion

### 6.1 Uniformly bounded-below free resolutions

For a connective E₁ solid algebra A and M∈Mod_A with π_kM=0 for k<b, construct an augmented simplicial resolution P•→M whose realization is M and each P_n is a coproduct of shifts Σ^dG_A with d≥b. The same integer b works for every simplicial degree. Give coherent comparison maps between resolutions over a map of modules, unique at the level of their realized derived functors; no uniqueness of the individual free presentations is asserted. Arbitrary coproduct index sets remain in the fixed universe. (Bosco, Proof of Proposition A.3, pp.92–93, Bosco lines 3462–3469; Q proof of Lemma B.8, Q lines 3688–3692 (integer/arithmetic resolution models)).

A proof route is to use the connective projective generator G_A to choose a free cover of the bottom homotopy sheaf and free shifted covers of the remaining nonnegative degrees. Resolve kernels within degrees ≥b and apply the free/forgetful simplicial bar construction; its extra degeneracy gives the augmentation equivalence. A degreewise replacement argument compares resolutions. Filter a large set of free summands by its countable subsets using an ω₁-filtered index only when §4.1 is needed.

*Needs:* §2.2; §2.4; EnhancedDerivedSheaves E3.3; EnhancedDerivedSheaves E5:abstract.2; StableHomotopyKTheory §5.17; §4.1.

**Checks.**

- M=0 has the zero resolution and realization0.

- For M=Σ^bG_A the constant simplicial object on M is already a resolution with lower bound b.

- The family Σ^(−n)G_A has no common lower bound; it does not satisfy the hypothesis of the realization theorem for completion.

### 6.2 Connectivity of quotient completion

For any connective commutative solid A and coherent divisibility tower of scalar multiplication maps a_r, define Λ_a by the module cofiber tower as in §5.1, without assuming finite free quotients or that A is complete. It is exact, and if M≥b then M/a_r≥b for every r and Λ_a(M)≥b−1. For the free block modules of §5.3 and a complete split datum, improve the bound to Λ_a(F_I)≥0 by split surjectivity on each homotopy tower. The map between the limit and the product has the fiber-of-1−shift convention of the supplied tower theory. (Bosco, Proposition A.3 proof, Bosco line 3465; Q proof of Lemma B.8, Q line 3688 (connectivity step made explicit)).

A proof route is to each quotient is a cofiber of an endomorphism of a b-connective module. A countable tower limit is fib(1−shift on the product), and countable products preserve connectivity, giving the possible one-degree loss. Exactness follows because all these functors preserve finite limits and colimits. For split free block quotients, the 1−shift map is surjective on π_b and removes the loss.

*Needs:* §2.2; §5.1; §5.3; EnhancedDerivedSheaves E2:towers; §2.1.

**Checks.**

- For a_r=1 all quotient cofibers and Λ_aM are0.

- For a single zero scalar the derived quotient is M⊕ΣM; it is not the ordinary quotient M alone.

- For the tower ℤ --2→ ℤ --2→⋯ in degree0, lim=0 and lim¹=ℤ₂/ℤ, so the homotopy limit has π₋₁=ℤ₂/ℤ. The b−1 bound is necessary for general towers.

### 6.3 Uniform realization comparison

For the quotient completion functor of §6.2 and a simplicial A-module M• with M_n≥b for one integer b independent of n, the natural map |Λ_a(M•)|→Λ_a(|M•|) is an equivalence. More explicitly, cofib(|sk_dM•|→|M•|) lies in degrees ≥b+d+1, and applying Λ_a gives degrees ≥b+d; the analogous tail of |Λ_a(M•)| is ≥b+d. Consequently finite skeleta determine the comparison on π_k once d>k−b+2. The equivalence is natural and agrees with the balanced bar comparison of §3.4 whenever A and the bar terms have the stated uniform lower bounds. For a two-sided bar for X⊗_A Y, take the A-action through the X factor in each degree; the realized action is the balanced A-action, and the comparison is A-linear for these specified actions. (Bosco, Proof of Proposition A.3, Bosco line 3465; Q proof of Lemma B.8, Q lines 3688–3692 (uniform spectral estimate supplied here)).

A proof route is to finite Reedy skeleta use finite colimits, which commute with exact Λ_a. Latching cofibers stay b-connective; the d-th normalized layer is suspended d times. The two tail estimates make the finite-skeleton comparisons stabilize in each homotopy degree, and nondegeneracy gives equivalence. In a balanced bar with connective coefficient algebra, all terms have lower bound the sum of the module bounds. This proof uses connectivity, not a formal exchange of arbitrary realization and inverse limit.

*Needs:* §6.2; §6.1; §3.4; EnhancedDerivedSheaves E5:abstract.2.

**Checks.**

- A constant simplicial M gives the identity comparison Λ_aM→Λ_aM.

- A normalized layer in simplicial degree1 contributes ΣM, so a b-connective input produces a (b+1)-connective layer before completion and at least b-connective after completion.

- With normalized term Σ^(−n)A in degree n, its suspended layer is A in every degree; the tails never become more connective, so the proof cannot apply.

### 6.4 The transferred p-complete comparison

For every prime p, define e_p(X)=lim_r δ(X/p^r) on derived p-complete ordinary spectra X. Evaluation at the point is its right adjoint on p-complete objects and the unit is an equivalence, so e_p is fully faithful. If M,N are p-complete bounded-below solid spectra then M⊗■N is p-complete. For bounded-below p-complete X,Y, e_p(X)⊗■e_p(Y)≃e_p((X⊗Y)^∧_p). The bounded-below p-complete solid category is symmetric monoidal with unit e_p(𝕊^∧_p), and the inclusion into all solid spectra is lax monoidal with unit map δ𝕊→e_p(𝕊^∧_p). On Hℤ-linear inputs, recover Bosco’s completed-tensor comparison over any derived p-complete solid ordinary ring with bounded-above cohomological complexes. Construct the p-complete full subcategory in Cond(Sp) and Sp■ by orthogonality to all shifts of p-inverted free spectral objects, and prove its reflection is the p-power cofiber limit used in the definition of e_p. (W, Paragraph 2.2, p.11, W lines 452–462; Bosco Proposition A.3, pp.92–93, Bosco line 3459).

A proof route is to construct the spectral p-completion reflection from the p-inverted free objects and identify its quotient tower using the supplied ordinary Moore/telescope argument on the spectral tensor action. All shifts and all light free tests occur in the orthogonality condition. Point evaluation and the ordinary completion unit then compute the adjunction unit. For bounded-below objects resolve by free solid generators, apply the realization estimate to the p-power cofiber tower, and prove the generator tensor comparison through the integer p-adic null-family calculation and bounded Postnikov intervals. State and prove these spectral comparisons on the actual generator, using the tail estimates to pass to arbitrary bounds. Moore spectra are not declared finite free spheres; §5.1 is not invoked for them. Retain the monoidal unit in the completed codomain.

*Needs:* §1.2; §2.3; §2.4; §6.1; §6.3; GeneralizedCohomology G3.8–G3.9; EnhancedDerivedSheaves E4.1; EnhancedDerivedSheaves E4.4; §3.1.

The API has the following laws.

- For a p-complete spectrum X, evaluation e_pX at * is X, compatibly with the completed discrete/evaluation adjunction unit.

- For bounded-below complete X,Y the tensor comparison is computed with completed ordinary smash and has completed sphere unit.

- On the Hℤ-linear realization the comparison is Bosco’s relative completed tensor over the chosen derived p-complete solid ordinary ring.

- The p-power cofiber limit is left adjoint to inclusion of objects right-orthogonal to every shift of every p-inverted light free object.

**Checks.**

- At p=2, π₀(e_p(𝕊^∧_p)(*))=ℤ₂, and the ambient unit has π₀=ℤ.

- At p=3 the same calculation gives ℤ₃, and the unit comparison sends 1 to1; no inversion of 2 or 3 is used.

- For M=N=Hℤ_p the relative solid tensor over Hℤ is Hℤ_p. In contrast H𝔽_p⊗_{Hℤ_p}H𝔽_p has an additional π₁=𝔽_p; absolute sphere tensor and Hℤ-relative tensor remain distinct.

- For X=H𝔽_p, X/p^r=X⊕ΣX with transition identity on X and zero on ΣX. The limit is X and the completion unit is its identity, including p=2,3.

### Examples

The identity differential has zero cofiber, while multiplication by zero has cofiber M⊕ΣM. These two-term calculations control the degree estimates. Prime completion retains the completed sphere as its tensor unit for every prime.

### Dependencies

Layers 2–5; EnhancedDerivedSheaves E2:towers and E5:abstract.2; GeneralizedCohomology G3.8–G3.9; StableHomotopyKTheory §5.17; integer p-completion and its completed tensor model from EnhancedDerivedSheaves E4.1 and E4.4.

## Layer 7: Spectral analytic coefficients and summability

### 7.1 Uncompleted and completed structures

For connective commutative A in Sp■ define an uncompleted spectral analytic structure to be a specified accessible reflective stable full subcategory D⊆Mod_A(Sp■), closed under all small ambient limits and colimits and under internal Hom_A(C,M) for arbitrary A-module C and M∈D, whose reflector L_D preserves connective objects. A completed structure additionally has A∈D. A morphism (A,D)→(B,E) is an algebra map A→B whose restriction carries E into D. Equivalent reflective full subcategories determine the same structure only with their actual inclusion and unit identified. (RC, Definition 4.1.1 and Remark 4.1.2, pp.28–29, RC lines 1431 and 1457; AG Definition 12.1, AG line 3014 (integer/animated model)).

A proof route is to use a full-subcategory property and the supplied reflective-localization interface. Impose Hom closure on all modules, rather than only on complete inputs. Define morphisms by restriction and prove the property is closed under identity and composition. Retain the reflector’s universal map as part of every comparison.

*Needs:* §2.2; §3.4; EnhancedDerivedSheaves E3.2; §2.1.

The API has the following laws.

- The specified inclusion, accessible adjunction, closure laws and connective-preservation proof determine the structure.

- Two inclusions with the same full image have a uniquely identified reflector under their units; an unmarked equivalence of abstract categories is insufficient.

- Identity and composite algebra maps preserving complete objects give identity and composite morphisms.

- The structure is completed iff its unit A→L_DA is an equivalence.

**Checks.**

- For D=all modules, L_D=id and the structure is completed.

- D={0} is an uncompleted structure for every A, completed exactly when A=0.

- The full subcategory of perfect Hℤ-modules fails the axioms: a countable coproduct of Hℤ is not perfect.

### 7.2 Complete tensor and scalar extension

For an uncompleted structure (A,D), construct the closed symmetric monoidal tensor M⊗hat_A N=L_D(M⊗■_A N) on D, with unit L_DA and internal Hom inherited from Mod_A. Retain the connective commutative coefficient algebra Â=L_DA supplied by the lax monoidal inclusion and its map A→Â; no identification with A is made without completedness. For a morphism (A,D)→(B,E), completed scalar extension M↦L_E(B⊗■_A M) is left adjoint to restriction E→D. Prove identity, composition and coherences for the scalar-change squares: both iterated extensions along a coherently commuting square to a fixed analytic target agree with extension along its composite. For algebra-pushout base change, prove the completed-tensor comparison after applying the target reflector whenever its kernel is the localizing tensor ideal generated by the scalar extensions of the two input kernels; this kernel-generation condition specifies the induced analytic structure. Explicitly, for an algebra pushout B′=B⊗■_A A′ with compatible analytic structures D_B,D_A′,D_B′ and the indicated generated kernel, both L_D_B′(B′⊗_B L_D_B(B⊗_A M)) and L_D_B′(B′⊗_A′ L_D_A′(A′⊗_A M)) are canonically L_D_B′(B′⊗_A M), for every A-module M. These are equivalences of complete B′-modules. (RC, Proposition 4.1.6 and proof, pp.29–30, RC lines 1489–1519; AG Proposition 12.4 and Remark 12.5, p.80, AG lines 3041–3055).

A proof route is to use tensor–Hom adjunction: for C in ker L_D and complete M, Map(C⊗X,M)=Map(C,Hom(X,M))=0, so the kernel is a tensor ideal. Apply the supplied monoidal localization. The ordinary scalar-extension adjunction factors through L_D because restriction of an E-object is D-complete. Its mapping-space formula fixes all units, composite comparisons and scalar-change coherences. For the displayed pushout paths use the specified generated kernel and the universal property of localization, retaining the target completion on both sides.

*Needs:* §7.1; §3.4; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:abstract.4.

The API has the following laws.

- The tensor unit is L_DA, and for completed structures this is A.

- For M∈D and N∈E, Map_E(L_E(B⊗_A M),N)≃Map_D(M,U N).

- For composable compatible maps, L_F(C⊗_B L_E(B⊗_A M))≃L_F(C⊗_A M), coherently under units and threefold composition.

- For the compatible algebra pushout B′=B⊗_A A′, the two completed scalar paths displayed in the statement agree with L_D_B′(B′⊗_A M) for every A-module M, coherently with the units.

**Checks.**

- 0⊗hat_A N=0 and every completed scalar extension sends0 to0.

- For D=0 and A=Hℤ, the tensor unit has π₀=0 rather than ℤ.

- For trivial structures the base-change comparison is the derived relative tensor, retaining Tor in the square ℤ→𝔽₂←ℤ.

### 7.3 Spectral summability structures

For connective commutative solid A and any small family F⊆π₀A(*), construct the full subcategory D_F of modules M for which 1−fσ* is invertible on internal Hom_A(A⊗■G,M), for every f∈F. Prove D_F is an uncompleted spectral analytic structure, including ambient colimit closure and connective preservation of its reflector. The condition can equivalently be tested with A⊗N in condensed modules. Construct its free complete modules, its reflector, and its coefficient algebra Â_F=L_FA with the unit A→Â_F. Establish naturality for algebra maps which carry the specified summability tests to tests of the target. Imposing more tests gives a further localization; being completed is a separate assertion that A is itself F-summable. (MW, Paragraph 4.2, p.41, MW lines 1764–1775; RC Example 4.6.4(2),(4), p.44, RC lines 2125–2145 (integer model)).

A proof route is to take the stable tensor localization at the cofibers of 1−fσ on G_A, tested by the compact generator. Since G⊗■G is another countable sphere product, these external tests are maps between connective compact projective generators and their finite sums; this proves closure under ambient colimits. Use the supplied monadic reconstruction for the compact generator to identify the tests with degree-zero endomorphism localizations in right modules over its connective endomorphism algebra (precomposition gives the right action). Their derived universal inversion is a colimit of connective algebras, so restriction of the associated extension preserves the claimed connective bound. Tensor–Hom proves Hom closure. This connective-inversion argument is part of this spectral instance, not an inference from mere existence of the reflector.

*Needs:* §1.3; §2.4; §3.1; §7.1; §7.2; EnhancedDerivedSheaves E5:abstract.5; EnhancedDerivedSheaves E3.2; EnhancedDerivedSheaves E3.3.

The API has the following laws.

- M is local exactly when all specified internal 1−fσ* maps are equivalences; equivalent scalar representatives give equivalent tests.

- The free complete object on an A-module C is L_FC, with Map(L_FC,M)≃Map(C,M) for local M.

- For F⊆F′, D_F′⊆D_F and L_F′L_F≃L_F′, with the units fixed.

- A map carrying the scalar tests into a target family makes restriction preserve local objects and gives the completed extension of §7.2.

- If f^d=0 for some d≥1, the f-test is automatically invertible on every module, with inverse the finite geometric sum of the powers of fσ*.

**Checks.**

- F=∅ and F={0} both give all modules; f=1 adds no condition in Sp■.

- For a finite-support null sequence b=e₁ and any discrete scalar f, (1−fσ*)(e₁+fe₀)=e₁.

- For A=Hℚ_p with its topological solid realization and f=1/p, the null sequence b_n=p^n satisfies b_n−f b_(n+1)=0 and b₀=1. Thus A is not F-complete, including p=2,3, and replacing Â_F by A would be false.

- For A=H(𝔽₂[ε]/ε²) and f=ε, the inverse is 1+εσ* and the reflector is the identity; this tests a nonreduced characteristic-two coefficient ring.

### 7.4 Measures, animated inputs and site comparison

For an integer-linear analytic measure structure (B,μ) supplied by VS2.2, with B and all measure objects in its integer-solid realization, and represented on its common size-bounded light presentation, transport its complete derived module subcategory through §2.3 to the Hℤ-linear spectral algebra associated to B. Prove this is a completed spectral analytic structure exactly when the imported Dirac unit B→μ[*] is an equivalence; in general retain μ[*] as the completed coefficient algebra. Identify free complete modules, Dirac maps, relative tensor, internal Hom and compatible scalar extension. For animated B use θB and the supplied animated-module comparison, retaining the distinction from arbitrary Hℤ-algebras. Prove these comparisons commute with cutoff enlargement on the supplied common presentations and with restriction to the light site on those presentations; no equivalence of unrestricted condensed universes is asserted. (AG, Definition 6.12 and Proposition 6.14, pp.39–40, AG lines 1361 and 1384; Definition 12.1, Proposition 12.4, Remark 12.5, pp.79–80, AG lines 3014–3055).

A proof route is to use the imported measure reflection and its universal Hom property to identify the transported full subcategory and its free objects. The monoidal and scalar-change comparisons are forced by their units and adjunctions. Apply only the site/cutoff comparison proved by VS2.2 on common presentations. Use the associative module comparison for animated coefficients, not an unavailable positive-characteristic equivalence of commutative algebra categories.

*Needs:* §2.3; §7.1; §7.2; §7.3; VStackSheavesAndLisseCategories VS2.1; VStackSheavesAndLisseCategories VS2.2; EnhancedDerivedSheaves E5:animation.4.

**Checks.**

- For integer-solid measures on a finite set of size2 the free complete module is ℤ²; on ∅ it is0 and on * it isℤ.

- For topological E/ℚ_p, (∏_I O_E)[1/p] has uniformly bounded denominators and excludes (p^(−n))_n. Replacing the free complete measure object by an unrestricted product ∏_I E fails.

- Over 𝔽₂, θ preserves the specified animated polynomial input but is not an equivalence onto all commutative H𝔽₂-algebras; the positive group homology witness is retained.

### Examples

The trivial analytic structure has identity completion. For topological ℚ_p and f=p⁻¹, the null sequence p^n is a nonzero kernel vector for 1−fσ*, so the coefficient object itself need not be complete for an imposed summability structure.

### Dependencies

Layers 1–6; EnhancedDerivedSheaves E3.2, E5:abstract.2–E5:abstract.5, E5:animation.4 and E5:spectra-comparison; VStackSheavesAndLisseCategories VS2.1–VS2.2 supplies integer-linear measures and their site comparisons.

## Downstream consumers

HabiroRings §§2.8–2.12 imports §§1–6 for its light-solid-spectra contract. The general split tower and scalar identity do not themselves prove the arithmetic multiplication equivalence: its factorial divisibility, balanced scalar idempotence and two-variable profile estimates remain in that consumer. The Habiro quotient tower is a consumer Check: its ranks at n=1,2 are1,3, and its polynomial sections are sphere-linear, not Laurent-algebra-linear. The arithmetic conclusions retain their supplier hypotheses until all parts of this contract, including the two named gaps, are proved.

RefinedTraceMethods §§6.2–6.4 imports the light spectral foundation of §§1–2 and the full bounded-below p-complete comparison of §6.4, with the completed unit. Its trace-class maps, nuclearity, perfect-even generators, sites and filtrations remain its targets. This direction supplies HabiroRings before that trace theory and has no return dependency.

HigherHidaAndColemanTheory R23–R24 consumes the scalar-extension interface of §7.2 and the common-presentation comparison of §7.4. Its requests for discrete-adic Huber pairs, formal complements and topologically nilpotent annihilation require VS2.2’s geometric coefficient interface or a VStackSheavesAndLisseCategories, Part II extension. They are not consequences of the abstract spectral scalar theorem.

LocallyAnalyticRepresentationsOfLocalGroups LR.3 consumes the integer E-coefficient comparison of §7.4 on the supplied light presentations. Its profinite group rings and strongly inaccessible-cutoff representation setting require a LocallyAnalyticRepresentationsOfLocalGroups, Part II coefficient extension or the existing representation/Iwasawa owners; Banach/Smith/LB comparisons remain with functional analysis. No equivalence of unrestricted universes or new group-ring construction is promised here.

## References

All locators use the legally read versions recorded in sources.toml. Every statement is phrased independently of the source wording. Spectral extensions of an integer or arithmetic model are identified in their statements and proof routes.

- **W:** Ferdinand Wagner, *q-de Rham cohomology and topological Hochschild homology over ku*, arXiv:2510.06057v1. Paragraphs2.1–2.3, pp.11–12, W lines437,443,452,472. [Open text](https://arxiv.org/abs/2510.06057v1).
- **MW:** Samuel Meyer and Ferdinand Wagner, *q-Hodge complexes and refined TC−*, author version of5 February2026, §4.1, paragraphs4.1–4.2, p.41, MW lines1748,1764. [Author text](https://ferdinand-wagner.github.io/papers/q-Hodge.pdf).
- **Q:** Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2, AppendixB, LemmaB.8 and proof, printed pp.79–80, Q lines3666–3705; the extraction page numbers are124–125. [Open text](https://arxiv.org/abs/2510.04782v2).
- **Bosco:** Guido Bosco, *Rational p-adic Hodge theory for rigid-analytic varieties*, arXiv:2306.06100v1, PropositionA.3 and LemmaA.4, pp.92–93, Bosco lines3459,3488,3504. These are integer-linear models. [Open text](https://arxiv.org/abs/2306.06100v1).
- **RC:** Juan Esteban Rodríguez Camargo, *Notes on Solid Geometry*, arXiv:2603.03012v1. Theorem 2.3.3, pp.12–13, RC line537; Theorem 3.2.4, pp.17–18, RC line754; Definition 4.0.1 and Remark 4.0.3, pp.27–28, RC lines1392,1411; Definition 4.1.1 and Proposition 4.1.6, pp.28–30, RC lines1431,1489; Example 4.6.4, p.44, RC line2114. [Open text](https://arxiv.org/abs/2603.03012v1).
- **CS:** Peter Scholze, joint work with Dustin Clausen, *Lectures on Condensed Mathematics*, May2026 revision of the2019 lectures. Theorems5.8 and6.2, pp.35–36,43, CS lines1243,1578. The integer theory is imported through VS2.1. [Author text](https://people.mpim-bonn.mpg.de/scholze/Condensed.pdf).
- **AG:** Peter Scholze, joint work with Dustin Clausen, *Lectures on Analytic Geometry*, May2026 revision of the2019/20 lectures. Definition 6.12 and Proposition 6.14, pp.39–40, AG lines1361,1384; Definition 12.1, Proposition 12.4 and Remark 12.5, pp.79–80, AG lines3014,3041. [Author text](https://people.mpim-bonn.mpg.de/scholze/Analytic.pdf).
- **HTT:** Jacob Lurie, *Higher Topos Theory*, author PDF of9 April2017. Proposition 5.3.3.3, printed p.394 (PDF p.412), HTT line18705, is the abstract supplier extension of §4.1. [Author text](https://www.math.ias.edu/~lurie/papers/HTT.pdf).
- **AS:** Clausen–Scholze, *Analytic Stacks*,2023–24 public contributor transcript, lectures2–3,5–6,8,13. AS lines9,39 identify the course; AS lines43–44 explain the unendorsed and partly automated transcript. This is context only and is not the sole evidence for any target. [Public transcript](https://raw.githubusercontent.com/ndcroos/analytic-stacks/main/AnalyticStacks.pdf).
