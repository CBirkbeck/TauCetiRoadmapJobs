# Roadmap: scheme and stack foundations, part II — flat cohomology

**Summary.** Starting from SchemeAndStackFoundations' ordinary schemes, sites, torsors and cohomology, and from the flat cohomology of animated algebras with its supports, nilpotent invariance, primary comparisons, finite-ideal excision and fpqc hyperdescent (PrismaticCohomologyPartIII §6.0 and PurityForFlatCohomology Layer 3), this Part II builds the complete and henselian theory of flat cohomology with ordinary coefficients (commutative groups over an ordinary base that are finite locally free, or smooth and affine): the pro-fppf site, animated points of ordinary groups with their identity cotangent complex and deformation sequence, flat animated modules and algebras with their sites and henselization, cohomology along increasingly accurate towers, the ring-theoretic inputs of derived completion, continuity along derived complete rings, henselian invariance, algebraization over topological rings and adically faithfully flat descent with supports (Česnavičius–Scholze, *Purity for flat cohomology*, §5). Ind-flat ring maps, perfect-base Dieudonné theory, p-adic continuity, principal excision and complete arc descent enter from their earlier owners. The end theorems are complete continuity (§4.5), henselian invariance (§5.2), algebraization (§5.3) and adic descent with supports (§6.2).

## Scope and ownership

SchemeAndStackFoundations stops at the ordinary scheme, site, torsor, Brauer and formal-geometry interfaces of its §§0.12, 0.14–0.15, 0.21, 1.13–1.15, 1.18–1.22, 2.1–2.6, 2.10–2.11, 2.15, 2.22 and Layer 4; its §2.7 owns cohomology with supports of abelian sheaves on a topological space and its §2.9 the big-site sheaves 𝔾_a, 𝔾_m and μ_n. This Part II owns the pro-fppf site, animated points of ordinary groups and their cotangent deformation theory, flat animated modules and algebras with their étale, fppf and fpqc sites and their henselization, cohomology of increasingly accurate ring towers, ind-fppf split refinements, derived Beauville–Laszlo glueing, the square-zero defect of completed π₀, perfection across an unchanged derived divisor, complete continuity, henselian invariance, algebraization and adic descent with supports.

PerfectoidQuotientsPartII Layer Q7 owns ind-fppf and ind-syntomic ring maps (§Q7.1, §Q7.2) and their stability under composition, base change, finite products and filtered colimits (§Q7.3). They are imported; the pro-fppf site of §0.1 and the split refinements of §3.1 are built on them.

PrismaticCohomologyPartIII §6.0 owns the perfect-base classification, the Hom/Ext description, the perfect pro-fppf comparison, the V−1 sequence and the perfect-base cohomology triangle through `Prismatic.FlatCohomology.perfectDieudonneComparison`, as well as p-adic continuity `Prismatic.FlatCohomology.pContinuity` and principal excision `Prismatic.FlatCohomology.excision`. Its proof routes also construct Bégueri resolutions, animated fppf cohomology, the cohomology deformation triangle and perfection of pro-fppf covers; the exports needed here are the supplier contracts below. Layer 2 here proves the animated-point cotangent interfaces.

PurityForFlatCohomology owns fppf cohomology with supports on schemes (§0.2) and its continuity along cofiltered limits (§0.3); the vanishing of H^i_fppf(A,G) for i≥2 over a perfect 𝔽_p-algebra A and a commutative finite locally free A-group G of p-power order (§2.1); and, for animated algebras, cohomology with supports, the étale equivalence with π₀, fppf hyperdescent and Postnikov convergence (§3.2), invariance under classical truncation and across nil ideals (§3.3), the primary cohomological-dimension bound and invariance under derived mod-p equivalence (§3.4), the derived residue condition, finite-ideal excision and the comparison of a Noetherian local ring with its completion (§3.5), and fpqc hyperdescent with primary descent modulo p (§3.6). It also owns Gabber's comparison Br_Az(X)≃H²_et(X,𝔾_m)_tors for a scheme with an ample invertible sheaf, with its twisted-bundle route (§7.10). These are imported and not restated here.

HeightsRationalPointsAndObstructions §2.6c owns Gabber's affine comparison `Brauer.affine_comparison`, used in Layer 4 for H² over a henselian pair.

The pinned libraries provide the ordinary algebraic predicates, the scheme fppf and fpqc topologies, the henselization of a pair with Noetherianity and faithful flatness of its completion, Tau Ceti's affine fppf site with its Hopf-algebra point sheaves, the category of finite locally free commutative affine group schemes over an affine base with Cartier duality, abelian sheaf `Ext` groups and the separated completion of a topological ring. DerivedModuleAlgebra owns ordinary square-zero classification (§0.5), Koszul complexes (§0.K.1), perfect complexes and Tor amplitude (§1.E.0) and module completion (§§1.1–1.9); EnhancedDerivedSheaves supplies animated rings and modules, towers and cotangent complexes. ArcTopologyAndDescent owns complete arc-covers by products of valuation rings (§11.2), completed and punctured étale hyperdescent (§11.5) and integral perfectoid, tilt and A_inf hyperdescent (§12.7), imported through the contracts below. The perfectoid Dieudonné key formula, the purity theorems and their birational applications belong to PurityForFlatCohomology.

## Conventions

Rings are commutative and unital, including the zero ring. A finite ideal means a finitely generated ideal. Unless a statement changes the base, R is an **ordinary** ring and G is an **ordinary** affine commutative R-group. The principal coefficients are finite locally free G; some preliminary theorems also allow smooth affine G. These groups are evaluated on animated R-algebras A. No theorem introduces a theory of finite flat group schemes over an arbitrary animated base.

Cohomological indexing is used in D(ℤ): π_i corresponds to H^(−i). An animated module is connective, so it occupies cohomological degrees ≤0. A derived fixed-point expression for V is **fib(V−1)** in D(ℤ); the ordinary fixed subgroup is only its H⁰. Limits of cohomology complexes are derived limits, including hypercover totalizations. Cohomology with supports RΓ_Z(A,G) is the fibre of restriction to the complementary open, as constructed in PurityForFlatCohomology §3.2, and for ordinary schemes in PurityForFlatCohomology §0.2; RΓ_I(A,G) denotes support in V(I). For animated A, its topological spectrum means Spec π₀A, while all algebraic tensor products over A retain higher homotopy.

Finite tuples of π₀-elements are represented by actual elements when forming derived Koszul quotients; every comparison is invariant under the resulting equivalences, and there is no canonical map π₀A→A. Derived completion, animated rings, cotangent complexes and their module categories come from the owners listed below. On an ordinary ring, A/^La is the cone of multiplication by a on the underlying module; it need not equal A/(a).

A henselian pair means Mathlib's `HenselianRing` convention: I⊂Jac(R) and simple roots of monic polynomials lift. Locality, Noetherianity and completeness are separate hypotheses. A nonunital subring B′ of a ring B is **henselian** when it satisfies Gabber's criterion inside B: every x∈B′ has a quasi-inverse y∈B′, (1+x)(1+y)=1, and for every N≥1 and a₀,…,a_N∈B′ the polynomial T^N(T−1)+a_NT^N+…+a₀ has a root in 1+B′. Equivalently B′ is a henselian ideal of its Dorroh unitalization ℤ⊕B′, with multiplication (m,x)(n,y)=(mn,my+nx+xy) (BC22 §2.1.1, p.5; SP Tag 09XI, Lemma 15.11.6). §5.0 records this as `IsHenselianNonunitalSubring`.

The three Brauer objects keep distinct names: Br_Az(X), the Morita classes of Azumaya algebras of SchemeAndStackFoundations §2.22; Br′(X)=H²_et(X,𝔾_m)_tors; and the whole group H²_et(X,𝔾_m) (C19 §1.5, p.3). The class map is compared with Br′ only on affine schemes (HeightsRationalPointsAndObstructions §2.6c) or, with an ample invertible sheaf, by PurityForFlatCohomology §7.10. Kummer exactness with μ_n uses the fppf topology for every n≥1, including n divisible by a residue characteristic.

In the covariant crystalline convention, M(ℤ/p^n) has F=pσ and V=σ⁻¹, whereas M(μ_(p^n)) has F=σ and V=pσ⁻¹ (CS24 §4.1.2, p.36; PrismaticCohomologyPartIII §6.0). The normalization and indexing are fixed by the computed witnesses below.

**Checks.**

- On 𝔽_p with G=ℤ/p, V−1=0 on 𝔽_p, so the fibre has H⁰=H¹=𝔽_p. For μ_p, V−1=−1 and both groups are 0. Taking an ordinary kernel would miss the first H¹; interchanging the covariant and contravariant conventions would interchange the two computations.
- For A=k⊕k[1] and G_a, H^(−1)(A,G_a)=k and H⁰=k. Thus homotopy degree 1 corresponds to cohomological degree −1.
- For A=ℤ/p², multiplication by p has kernel and cokernel 𝔽_p, so A/^Lp has π₁=π₀=𝔽_p. The ordinary quotient has π₁=0.
- With I=(1), supported cohomology is fib(id)=0; with I=(0), it is fib(RΓ(A,G)→0)=RΓ(A,G). These directions are kept in every support comparison.
- The pair (ℤ,2ℤ) is not henselian, since Jac(ℤ)=0; (ℤ₂,2ℤ₂) is henselian. In the Dorroh multiplication, (1,0)(n,y)=(n,y), while (0,x)(0,y)=(0,xy).

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib of the content repository's manifest; file and line numbers are those of that pin.

| Supplier declaration | Pinned file and line | Input consumed |
| --- | --- | --- |
| `Algebra.FinitePresentation` | Mathlib/RingTheory/FinitePresentation.lean:44 | Finitely presented algebras; the stages of pro-ppf maps in §0.1. |
| `Module.FaithfullyFlat` | Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:64 | Flatness with faithfulness on maximal ideals; keeps flat and faithfully flat apart. |
| `AlgebraicGeometry.Scheme.fppfTopology` | Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54 | Scheme fppf topology of jointly surjective flat locally finitely presented families. |
| `AlgebraicGeometry.Scheme.fpqcTopology` | Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:76 | Scheme fpqc topology with the quasi-compact covering condition. |
| `HenselianRing` | Mathlib/RingTheory/Henselian.lean:81 | Henselian pairs by Jacobson containment and simple-root lifting; neither locality nor completeness is included. |
| `AdicCompletion.flat_of_isNoetherian` | Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378 | Flatness of the adic completion of a Noetherian ring, used in §5.1. |
| `CategoryTheory.HasExt` | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55 | The smallness condition under which `Ext` groups of an abelian category exist in a chosen universe; taken as an instance argument in §5.0. |
| `CategoryTheory.Abelian.extFunctor` | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:437 | The bifunctor of `n`-th `Ext` groups; evaluated on fppf sheaves in §5.0. |
| `CategoryTheory.presheafToSheaf` | Mathlib/CategoryTheory/Sites/Sheafification.lean:74 | Sheafification; for `AddCommGrpCat.{u+1}`-valued presheaves on the affine fppf site of a ring in universe `u` it exists at the pin, for `AddCommGrpCat.{u}` it does not. |
| `AddCommGrpCat.free` | Mathlib/Algebra/Category/Grp/Adjunctions.lean:54 | Free abelian groups, applied to representable presheaves. |
| `AddCommGrpCat.uliftFunctor` | Mathlib/Algebra/Category/Grp/Basic.lean:491 | Universe lift of abelian groups (additive form of `CommGrpCat.uliftFunctor`); fully faithful and exact. |
| `CategoryTheory.Sheaf.cohomologyPresheafFunctor` | Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70 | The model for §5.0: `Ext` from the free sheaf on a representable is cohomology of the slice site. |
| `UniformSpace.Completion` | Mathlib/Topology/UniformSpace/Completion.lean:291 | Separated completion; with `UniformSpace.Completion.algebra` (Mathlib/Topology/Algebra/UniformRing.lean:198) it is an algebra over a uniform topological ring. |

### From Tau Ceti

At the pinned Tau Ceti of the content repository's manifest; file and line numbers are those of that pin.

| Supplier declaration | Pinned file and line | Input consumed |
| --- | --- | --- |
| `TauCeti.CommAlgCat.fppfTopology` | TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61 | The fppf topology on `(CommAlgCat R)ᵒᵖ` induced from schemes over Spec R. |
| `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:57 | The points presheaf of a commutative Hopf algebra is an fppf sheaf. |
| `TauCeti.HopfAlgebra.pointsFppfSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:72 | The group-valued (`GrpCat`) fppf sheaf of points, before an abelian coefficient adapter. |
| `AlgHom.mapValue` | TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143 | Functoriality of convolution points in the value algebra; `AlgHom.convCommGroupOfSemiring` (line 232) makes the points of a cocommutative Hopf algebra a commutative group. Both live in the root namespace `AlgHom`, not under `TauCeti`. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122 | Finite locally free commutative affine group schemes over an affine base: finite, flat, locally of finite presentation and commutative. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:298 | The coordinate Hopf algebra, finite projective and cocommutative. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:321 | Finite locally free Cartier duality over an affine base. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeNatIso` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:172 | Cartier dualization commutes with arbitrary base change; used by the Bégueri resolution contract. |
| `TauCeti.Henselization.isNoetherianRing` | TauCeti/RingTheory/Henselization/Noetherian.lean:72 | For Noetherian R and any ideal I, the henselization `TauCeti.Henselization.algebra I` is Noetherian (an instance); used in §5.2. |
| `TauCeti.Henselization.faithfullyFlat_adicCompletion` | TauCeti/RingTheory/Henselization/Noetherian.lean:62 | For Noetherian R, the completion of the henselization along the extended ideal is faithfully flat over the henselization (an instance); used in §5.2. |
| `TauCeti.Henselization.completionEquiv` | TauCeti/RingTheory/Henselization/Quotient.lean:155 | The R-algebra isomorphism from the I-adic completion of R to the completion of its henselization along the extended ideal, with no Noetherian hypothesis; used in §5.2. |

`HenselianRing` includes Jacobson containment and simple-root lifting, not locality or completeness. Tau Ceti's points sheaf is group-valued; §5.0 builds the abelian coefficient sheaf from the commutative group structure of points of a cocommutative Hopf algebra. The two henselization instances carry the hypothesis `IsNoetherianRing R`; `completionEquiv` does not.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.12 supplies the henselization of a pair by étale neighbourhoods, on Tau Ceti's `TauCeti.Henselization.algebra`; §0.14 supplies `henselian_pair_characterisations`, `henselian_pair_permanence` and `henselian_smooth_lifting`; §0.15 supplies `popescu_colimit_of_geometricallyRegular` and §0.21 regular maps and G-rings. §§1.13–1.15 supply group algebraic spaces and torsors, §§1.18–1.22 algebraic stacks and quasi-coherent sheaves on them. §§2.1–2.6 supply derived site cohomology, Leray, torsors, slice sites, filtered sheaf colimits and quasi-coherent cohomology; §2.10 the comparison morphisms between topologies, including `smoothGroup_fppf_etale_comparison`; §2.11 `fppf_kummer_sequence` for every n≥1; §2.15 `gabber_affine_proper_base_change`. §2.22 supplies `SchemeBrauerGroup` and `CohomologicalBrauer`. Layer 4 supplies formal schemes, adic completion and algebraization interfaces.

What SchemeAndStackFoundations must provide (gap:finite-group-ext): For every commutative finite locally free group X over any scheme, the fppf sheafification of T↦Ext¹_(T_fppf)(X_T,𝔾_m), with Ext classifying commutative group extensions, vanishes. Section: Layer 2 §2.4. (BG80 Proposition 2.2.1, pp.25–27; R70 Lemma 6.2.2, p.51).

What SchemeAndStackFoundations must provide (gap:henselian-stack-lifting): For any henselian pair (A,I) and smooth algebraic A-stack X with quasi-affine diagonal, X(A)→X(A/I) is essentially surjective. Section: Layer 1 §§1.18–1.22. (BC22 Proposition 2.1.4, pp.7–8).

What SchemeAndStackFoundations must provide (gap:henselian-torsor-cohomology): For any henselian pair (A,I), H¹(A,Q)→H¹(A/I,Q) is bijective for smooth affine Q; for flat finitely presented quasi-affine G it is surjective, and for commutative such G the map on H² is injective. Section: Layer 1 §1.15. (BC22 Theorem 2.1.6, pp.7–8). *Needs:* gap:henselian-stack-lifting.

What SchemeAndStackFoundations must provide (gap:cauchy-algebraization): For a topological ring B with an open nonunital henselian subring B′ and a zero-neighbourhood basis of B′-ideals, every set-valued functor F on B-algebras commuting with filtered colimits and invariant under henselian pairs satisfies F(B)≃F(B̂), via the Cauchy-net quotient description of the separated completion, with no first-countability or Noetherian hypothesis. Section: Layer 4. (BC22 §§2.1.12–2.1.15, pp.11–13).

What SchemeAndStackFoundations must provide (gap:punctured-h2-injectivity): For Noetherian R→R′ and a finite ideal I such that both associated pairs are henselian and R/I^n≃R′/I^nR′ for every n>0, every open U containing Spec R minus V(I) and commutative finite locally free R-group G satisfy injectivity of H²(U,G)→H²(U×_R R′,G), without assuming flatness of R→R′. Section: Layer 4. (BC22 Corollary 2.3.5(c), pp.30–31; CS24 Corollary 5.6.13, p.77).

What SchemeAndStackFoundations must provide (gap:torsor-limit-descent): For a filtered diagram of ordinary R-algebras and a flat affine finitely presented R-group G, G-torsors, their isomorphisms and every finite diagram of such data descend to some finite stage. Section: Layer 1 §1.15. (CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–60; DJ §3.1, p.4).

What SchemeAndStackFoundations must provide (gap:complete-torsor-effectivity): For every ordinary ring C classically complete and separated for (a), and finite locally free C-group G, G-torsors and their isomorphisms are equivalent to compatible systems over C/a^n, with the H⁰ Mittag–Leffler comparison of CS24 Lemma 5.6.4 and without a Noetherian hypothesis. Section: Layer 4. (CS24 Lemma 5.6.4, pp.72–73).

What SchemeAndStackFoundations must provide (gap:classical-affine-group-adapter): For ordinary rings, connect the native affine Hopf-algebra group-point functors and finite locally free Cartier duality with the smooth affine commutative group-scheme category, including smoothness of Res_(X/S)𝔾_m for finite locally free X/S. Section: Layer 1 §1.15. (BG80 §§2.1–2.2, pp.22–27; CS24 §1.4, p.8 and §5.1.11, p.52).

What SchemeAndStackFoundations must provide (gap:flat-group-cotangent-amplitude): For every flat affine commutative group G of finite presentation over an ordinary ring R, its linearized cotangent C_G=e*L_(G/R) is perfect of amplitude [−1,0], has amplitude [0,0] when G is smooth, and carries the canonical additive linearization of the group law. Section: Layer 1 §1.15. (CS24 §5.1.11 and Proposition 5.1.12, p.52).

What SchemeAndStackFoundations must provide (gap:henselized-formal-fibres): For the henselization A of a finite-type ℤ-algebra along a finite ideal I, the map A→lim_n A/I^n is regular, that is, has geometrically regular fibres. Noetherianity of A and faithful flatness of A→Â are Tau Ceti's `TauCeti.Henselization.isNoetherianRing` and `TauCeti.Henselization.faithfullyFlat_adicCompletion`, and `TauCeti.Henselization.completionEquiv` identifies Â with the I-adic completion of the finite-type algebra. Section: §0.21. (CS24 proof of Corollary 5.6.9, p.76; SP Tags 0AH2, 0AH3).

### From TauCetiRoadmap.PerfectoidQuotientsPartII

Layer Q7: §Q7.1 ind-fppf ring maps (filtered colimits of faithfully flat finitely presented algebras, with the factorization criterion and the characterization as faithfully flat filtered colimits of flat finitely presented algebras), §Q7.2 ind-syntomic ring maps (no faithfulness), and §Q7.3 stability of both classes under composition, base change, the stated finite products and filtered colimits, with faithfully flat ind-syntomic maps ind-fppf.

### From TauCetiRoadmap.PrismaticCohomologyPartIII

§6.0: `Prismatic.FlatCohomology.perfectDieudonneComparison` gives covariant crystalline classification over perfect bases, finite projective dimension, F and V with FV=VF=p, perfect base change, and the V−1 fibre on the étale site. `Prismatic.FlatCohomology.pContinuity` applies to p-primary finite locally free coefficients on animated algebras with p-henselian π₀, without completeness. `Prismatic.FlatCohomology.excision` compares supports under a derived principal residue equivalence. The latter two include their own lifting and descent proof inputs; no proof of either is planned here.

What PrismaticCohomologyPartIII must provide (gap:begueri-resolution): For every commutative finite locally free G/S, supply a functorial, arbitrary-base-change-compatible fppf-exact sequence 0→G→H→Q→0 with H=Res_(G*/S)𝔾_m, Q the affine symmetric multiplicative two-cocycle group on G*, coboundary H→Q faithfully flat and finitely presented, and H,Q smooth affine commutative S-groups. Section: §6.0. (BG80 Proposition 2.2.1 and proof, pp.25–27). *Needs:* gap:finite-group-ext; gap:classical-affine-group-adapter; ReductiveGroupsPartII §RG2.0a.

What PrismaticCohomologyPartIII must provide (gap:animated-flat-cohomology): For ordinary R and an affine commutative R-group G smooth or finite locally free, supply the D(ℤ)-valued fppf and étale sheafifications RΓ(A,G) of the animated point functor, the identity τ≤0RΓ(A,G)≃G(A), and the ordinary-algebra comparison with `TauCeti.HopfAlgebra.pointsFppfSheaf` and classical sheaf cohomology. Section: §6.0. (CS24 §5.2.5 and (5.2.5.1), p.55).

What PrismaticCohomologyPartIII must provide (gap:cohomology-deformation): For an ordinary ring R, an affine commutative R-group G smooth or finite locally free, and a square-zero extension A′→A of animated R-algebras by a connective ideal M, supply the functorial untruncated fibre sequence RΓ(A′,G)→RΓ(A,G)→RHom_R(e*L_(G/R),M[1]) in D(ℤ), where e is the identity section. Section: §6.0. (CS24 Theorem 5.2.8, p.57).

What PrismaticCohomologyPartIII must provide (gap:perfection-covers): For morphisms of 𝔽_p-algebras, perfection preserves faithful flatness and ind-fppf maps, so perfecting a pro-fppf cover over a perfect base again gives a cover. Section: §6.0. (CS24 Lemma 4.1.6, pp.37–38).

### From TauCetiRoadmap.PurityForFlatCohomology

§0.2: for a scheme X, a closed Z⊂X and an abelian sheaf F on the big fppf site (in particular a commutative group scheme), RΓ_Z(X,F) is the fibre of restriction to X∖Z, with its long exact sequence, excision for an open containing Z and for an étale X′→X with Z×_X X′→Z an isomorphism of reduced closed subschemes, and agreement with étale supports for smooth F. §0.3: for a cofiltered limit X=lim X_λ of quasi-compact quasi-separated schemes with affine transition maps and a finitely presented commutative group scheme G over X_0, colim_λ H^i_fppf(X_λ,G)≃H^i_fppf(X,G), and the same for supports in a closed Z_0⊂X_0 with quasi-compact complement; affine commutative R-groups that are smooth or finite locally free are finitely presented, so this covers filtered colimits of R-algebras and supports V(I) with I finite. §3.2: for an animated R-algebra A and closed Z⊂Spec π₀A with complement U, RΓ(U_A,G) is the derived limit of RΓ_fppf(A′,G) over fppf A-algebras A′ with Spec π₀A′→Spec π₀A factoring through U, and RΓ_Z(A,G) the fibre of RΓ(A,G)→RΓ(U_A,G), functorial in A, G and Z with its support triangle; base change to π₀ is an equivalence on étale and on finite étale algebras; for G smooth or finite locally free, A↦RΓ_fppf(A,G) satisfies fppf hyperdescent and RΓ(A,G)≃Rlim_n RΓ(τ≤nA,G), and RΓ_et(A,G)≃RΓ_fppf(A,G) for smooth G (CS24 Proposition 5.2.4, Theorem 5.2.6). §3.3: H^i(A,G)→H^i(π₀A,G) is surjective for all i and bijective for i≥0 when G is smooth, for i≥1 when G is finite locally free; for an ideal I⊂R of nilpotent elements, H^i(R,G)→H^i(R/I,G) is surjective for i≥0 (smooth G), resp. i≥1 (finite locally free G), and bijective for i≥1, resp. i≥2 (CS24 Corollaries 5.2.9, 5.2.10). §3.4: for finite locally free G of p-power order and π₀A p-henselian, H^i(A,G)=0 for i≥3, and for i≥2 when (π₀A/p)_red is perfect; for A→A′ of such algebras with A/^Lp≃A′/^Lp and an open U with Spec π₀A[1/p]⊂U⊂Spec π₀A and complement Z, RΓ(U_A,G)≃RΓ(U_(A′),G) and RΓ_Z(A,G)≃RΓ_Z(A′,G) (CS24 Corollaries 5.3.7, 5.3.8). §3.5: for A→A′ and a finite ideal I=(a₁,…,a_r)⊂π₀A, the derived residue condition π₀A/I≃(π₀A/I)⊗^L_A A′ is equivalent to A/^L(a₁^n,…,a_r^n)≃A′/^L(a₁^n,…,a_r^n) for every n>0 and to equivalence after iterated derived a_i-completion; under it RΓ_I(A,G)≃RΓ_I(A′,G) for commutative finite locally free G; and H^i_𝔪(R,G)≃H^i_𝔪(R̂,G) for a Noetherian local ring (R,𝔪) (CS24 Lemma 5.4.3, Theorem 5.4.4, Corollary 5.4.5). §3.6: for commutative finite locally free G, A↦RΓ_fppf(A,G) satisfies fpqc hyperdescent on animated R-algebras; for G of p-power order and closed Z⊂Spec R/pR, A↦RΓ(A^h_(p),G) and A↦RΓ_Z(A,G) satisfy hyperdescent along cosimplicial A-algebras A^• with A/^Lp→A^•/^Lp an fpqc hypercover (CS24 Theorem 5.5.2, Corollary 5.5.3). Assumed as stated there.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§2.6c `Brauer.affine_comparison`: for every commutative ring, the Azumaya class map identifies the Brauer group of Azumaya algebras with the torsion of H²_et(Spec R,𝔾_m).

### From TauCetiRoadmap.EnhancedDerivedSheaves

E1.3 supplies enhanced derived objects; E2:towers.1 the Milnor comparison keeping lim¹; E3.2 accessible localization; E5:animation.1–.4 animation (`animatedAlgebras`), perfect characteristic-p tensors, bounded totalizations and animated modules (`animatedModules`); E5:cotangent-export.1 supplies `cotangentComplex` and its comparison `cotangentComplex_ordinary`. E5:animation.3's `tot_filteredColimit_of_bounded` is used only with a uniform lower cohomological bound.

What EnhancedDerivedSheaves must provide (gap:animation-composition): For 1-sifted-colimit-preserving F:C→D and H:D→E between cocomplete categories generated by strongly finitely presented objects, supply Ani(H)∘Ani(F)→Ani(H∘F), an equivalence when F(C^sfp)⊂Ind(D^sfp) or Ani(H)(F(C^sfp)) is discrete, and identify the limit-preserving composites of animated rings, abelian groups and anima. Section: E5:animation. (CS24 Proposition 5.1.5 and Example 5.1.6, p.49).

What EnhancedDerivedSheaves must provide (gap:general-square-zero): For m≥0 and an animated ring B that is (m+1)-truncated, classify B→τ≤mB as the square-zero extension by π_(m+1)(B)[m+1] associated to its derivation, and identify τ≤(m+2)L_(τ≤mB/B)≃π_(m+1)(B)[m+2], compatibly with base change. Section: E5:cotangent-export.1. (CS24 §§5.1.9–5.1.10, pp.51–52).

### From TauCetiRoadmap.DerivedModuleAlgebra

§0.5 classifies ordinary square-zero extensions, §0.K.1 supplies finite Koszul complexes, §0.10 derived base change of the cotangent complex, §0.11 its localization, §0.12 the smooth cotangent computation, §0.13 two-term models of regular quotients, §1.E.0 perfect complexes and Tor amplitude, and §§1.1–1.8 limits, completion, Nakayama, Koszul completion towers and complete flatness. §1.9 supplies p-adic Čech module descent for ordinary p-complete rings with bounded p-power torsion; the finite-tuple animated hypercover extension is a contract below.

What DerivedModuleAlgebra must provide (gap:adic-flat-module-limits): For a finite weakly proregular ideal J⊂C and flat C/J^n-modules M_n with M_(n+1)⊗_(C/J^(n+1))C/J^n≃M_n, their limit M′ is classically J-complete, M′/J^nM′≃M_n and Tor_i^C(N,M′)=0 for i>0 and J-power-torsion N, and completion preserves this adic flatness. Section: §1.7. (Y18 Theorems 1.8, 4.3 and 5.9, pp.5–6, 14, 16–17; published numbering cited by CS24: 2.8, 4.3, 6.9).

What DerivedModuleAlgebra must provide (gap:complete-module-hyperdescent): For a finite tuple in π₀A and a hypercover of animated A-algebras faithfully flat after derived Koszul reduction, connective derived I-complete modules satisfy descent under completed tensor product; include valuation-product perfectoid arc hypercovers when their structural rings and flat Koszul reductions descend. Section: §1.9. (CS24 proof of Lemma 5.7.1 and square-zero step of Theorem 5.7.2, pp.78, 80).

What DerivedModuleAlgebra must provide (gap:koszul-geometric-support): For any ordinary ring T, finite tuple b and N∈D(T), geometric cohomology supported on V(b) is C_b⊗^L_T N≃colim_n RHom_T(K_T(b₁^n,…,b_s^n),N), where C_b=⊗_i[T→T[1/b_i]]; this identification commutes with derived base change and perfect-complex tensor coefficients, without weak proregularity. Section: §0.K.1 and §§1.2–1.4. (SP Tag 0A6R, Lemma 47.9.1; CS24 proof of Theorem 5.7.2, p.81).

### From TauCetiRoadmap.DerivedDeRhamCohomology

§1.22 `DerivedDeRham.completionExchanges` gives the perfect-tensor and bounded-totalization exchanges of completion.

### From TauCetiRoadmap.PerfectoidQuotients

Layer 0 §§0.1, 0.4–0.6: integral perfectoid rings, reducedness, compatible-root annihilators, ring operations and completion.

### From TauCetiRoadmap.ReductiveGroupsPartII

Layer RG2.0a §§RG2.0a.1–RG2.0a.3: affine Weil restriction along finite locally free maps and arbitrary base change.

### From TauCetiRoadmap.ArcTopologyAndDescent

§11.2: for an ordinary ring A and a finite ideal I, every A-algebra admits an I-complete arc-cover by a product of I-complete absolutely integrally closed valuation domains of rank at most one, and every quasi-compact open of the spectrum of such a product has no nonsplit étale covers; its global sections functor is therefore exact on étale sheaves, so these opens are étale-acyclic. §11.5: for torsion F on Spec A and finite I, each of R↦RΓ(Spec R̂_I,F), R↦RΓ(Spec R^h_I,F), R↦RΓ(Spec R̂_I minus V(I),F) and R↦RΓ(Spec R^h_I minus V(I),F) is a hypercomplete I-complete arc-sheaf. §12.7: for a p-complete arc-hypercover A→B• whose augmentation and all terms are integral perfectoid ℤ_p-algebras, A→Rlim B•, A♭→Rlim (B•)♭ and A_inf(A)→Rlim A_inf(B•) are equivalences. Assumed as stated there.

## How to read the build

Layer 0 gives the pro-fppf site on top of the imported ind-flat maps. Layer 1 develops the sites on which the cohomology lives: flat animated modules and algebras, the big étale, fppf and fpqc sites of an animated ring with their restriction to ordinary algebras, the henselization of an animated ring and cohomology along increasingly accurate towers, on top of the animated flat cohomology of PrismaticCohomologyPartIII §6.0 and the Postnikov theory of PurityForFlatCohomology §3.2. Layer 2 builds the coefficients evaluated on those sites: the animated points of an ordinary group, its identity cotangent complex and the deformation sequence of points. Layer 3 proves the ring-theoretic inputs of the complete theory: split ind-fppf refinements, derived Beauville–Laszlo glueing, the square-zero defect of completed π₀ and perfection across an unchanged derived divisor. Layers 1, 2 and 3 use none of one another's targets; they meet in Layer 4, where bounded continuity combines the tower comparison of §1.6, the cotangent amplitude of §2.3 and the completed π₀ of §3.3, and principal complete descent uses the henselization of §1.5. Layer 4 starts with the independent henselian H² lemma, then bounded continuity, principal complete descent and full finite-ideal continuity, in that order, using the primary comparisons and fpqc hyperdescent of PurityForFlatCohomology §§3.4 and 3.6. Layer 5 fixes the ordinary flat-cohomology carrier of the acceptance test, then proves henselian invariance and algebraization through the finitary completion comparison. Layer 6 ends with adic descent with supports, using the finite-ideal excision of PurityForFlatCohomology §3.5. Each *Needs:* line lists both the inputs of the statement and those of the displayed proof route.

## Layer 0: The pro-fppf site

### 0.1 The pro-fppf site

Define the following site. A map X′→X of schemes is pro-ppf if, locally on source and target in affine charts, its ring map is a filtered colimit of flat finitely presented algebras. The pro-fppf site has schemes as objects, pro-ppf maps as covering candidates, and as covering families those families of pro-ppf maps for which each quasi-compact open of the target is a finite union of images of quasi-compact opens of the sources. A single faithfully flat pro-ppf morphism with this covering condition is called pro-fppf. These covers are fpqc covers; no topology is generated by arbitrary faithfully flat maps alone. (CS24, §4.1.5, p.37).

The API consists of the following laws and comparisons.

- Every fppf covering family is a pro-fppf covering family.
- Base change preserves pro-fppf covers.
- Composites of covering families cover.
- Every pro-fppf covering family is an fpqc covering family of `AlgebraicGeometry.Scheme.fpqcTopology`.
- For affine schemes, an ind-fppf ring map (PerfectoidQuotientsPartII §Q7.1) defines a pro-fppf singleton cover; conversely an affine pro-fppf singleton cover is ind-fppf, by the characterization of PerfectoidQuotientsPartII §Q7.3.
- Representable functors are sheaves for this topology.

**Checks.**

- The identity of any scheme covers.
- The two component inclusions into Spec(k×k) form a cover, although neither singleton is surjective.
- Spec k→Spec(k×k) selecting one component does not cover.
- A faithfully flat finitely presented affine map covers in both the Mathlib fppf topology and this topology.
- Spec ℚ→Spec ℤ is pro-ppf, as ℚ is the filtered colimit of the flat finitely presented ℤ[1/n], but it is not a cover: its image misses every closed point. A topology generated by flat maps without the covering condition would admit it.

**Proof route.** Use affine filtered presentations and the quasi-compact covering condition to check pullbacks and refinements, with the stability of ind-flat maps under base change and composition from PerfectoidQuotientsPartII §Q7.3. Relate the resulting topology to the fppf and fpqc topologies.

*Needs:* PerfectoidQuotientsPartII §§Q7.1, Q7.3; `Algebra.FinitePresentation`; `AlgebraicGeometry.Scheme.fpqcTopology`; SchemeAndStackFoundations §2.10.

### Examples

Over ℤ/4 the polynomial algebra (ℤ/4)[X] is faithfully flat and finitely presented, so Spec (ℤ/4)[X]→Spec ℤ/4 is a pro-fppf cover. Over ℤ the localization ℤ[1/2] is flat and finitely presented but not faithfully flat, so Spec ℤ[1/2]→Spec ℤ is pro-ppf and not a cover; adding Spec ℤ_(2) gives a covering family of two pro-ppf maps.

### Dependencies

PerfectoidQuotientsPartII §§Q7.1, Q7.3; `Algebra.FinitePresentation`; `AlgebraicGeometry.Scheme.fpqcTopology`; SchemeAndStackFoundations §2.10.

## Layer 1: Flat animated algebras, henselization and towers

### 1.1 Flat animated modules and maps

Define the following predicate or object. A connective animated A-module M is flat if π₀M is flat over π₀A and each canonical π_iA⊗_(π₀A)π₀M→π_iM is an isomorphism for i≥0. It is faithfully flat when it is flat and π₀M is faithfully flat. A map of animated rings is (faithfully) flat when its target is so as a module over its source. Flatness of π₀ alone is insufficient. (CS24, §5.2.1, p.53).

The API consists of the following laws and comparisons.

- Flatness supplies ordinary flatness of π₀M and the homotopy scalar-extension isomorphisms.
- Over an ordinary ring R a connective flat module is discrete and its π₀ is an ordinary flat R-module.
- Faithful flatness is flatness together with ordinary faithfulness of π₀M.
- Equivalences of base rings and modules transport the predicate.
- The zero module is flat, and is faithfully flat exactly when the base ring is zero.

**Checks.**

- For A=k⊕k[1], the quotient module k is not A-flat although π₀A→π₀k is an isomorphism.
- A[X] is A-flat with π_i(A[X])=π_i(A)[X].
- ℤ/4→𝔽₂ is not a flat map of discrete rings.
- The zero module over a nonzero field is flat but not faithfully flat.
- For A=k⊕k[1] and M=k, π₀M=k is faithfully flat but π₁A⊗k=k≠π₁M=0. Thus M is not faithfully flat.

**Proof route.** Use the graded homotopy module and its canonical scalar-extension map. Keep all homotopy-degree conditions as part of the predicate.

*Needs:* EnhancedDerivedSheaves E5:animation.4 `animatedModules`; `Module.FaithfullyFlat`.

### 1.2 Tensor products with flat animated modules

Prove the following statement. For a flat connective animated A-module M and every connective animated A-module N, π_*(N⊗^L_A M)≃π_*N⊗_(π₀A)π₀M, naturally and as graded modules. Flatness and faithful flatness are preserved by arbitrary derived base change; composites of flat (respectively faithfully flat) animated ring maps have the same property. (CS24, §5.2.1, p.53).

**Checks.**

- For A=ℤ, M=ℤ_p and N=ℤ/p, both sides have π₀=𝔽_p and higher homotopy 0.
- For M=A and N=k[1] over A=k, both sides have π₁=k and π₀=0; an ungraded formula loses this term.
- Base change of A→A[X] gives B→B[X] with π_i(B[X])=(π_iB)[X] in each degree.

**Proof route.** Use the homotopy Tor spectral sequence: graded flatness kills all positive Tor columns. Apply the resulting formula to the new base and ordinary faithfulness on π₀.

*Needs:* §1.1 flat animated modules and maps; EnhancedDerivedSheaves E5:animation.4 `animatedModules`.

### 1.3 Flatness after a nilpotent thickening

Prove the following statement. Let A→B induce a surjection π₀A→π₀B with nilpotent kernel, and let M be a connective animated A-module. Then M is flat, respectively faithfully flat, if and only if B⊗^L_A M is so over B. Also M=0 if and only if B⊗^L_A M=0. The nilpotent-kernel condition is uniform; a general localization is not a detection map. (CS24, Lemma 5.2.2, pp.53–54).

**Checks.**

- For A=ℤ/4, B=𝔽₂ and M=𝔽₂, B⊗^L_A M has Tor₁=𝔽₂ and is not flat, agreeing with M not flat over A.
- For M=A the reduction is B and both modules are flat over their bases.
- Localization ℤ→ℚ is excluded: ℤ/2 tensors to 0 while ℤ/2≠0.

**Proof route.** First reduce the source to π₀ by induction through its square-zero Postnikov layers, using the homotopy tensor calculation. For ordinary rings reduce the nilpotent ideal to square-zero steps and apply the derived local flatness criterion; derived Nakayama detects zero for connective modules.

*Needs:* §1.1 flat animated modules and maps; §1.2 tensor products with flat animated modules; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero.

### 1.4 Étale, fppf and fpqc sites of animated rings

Define the following sites. Fix an animated ring A. The big étale, fppf and fpqc sites of A have as objects all animated A-algebras (in the fixed universe, and below a fixed cardinal bound for fpqc) and as morphisms all maps of animated A-algebras; no flatness is asked of the structure map A→B of an object. A map B→B′ of animated rings is flat when B′ is a flat animated B-module (§1.1), étale when it is flat and π₀B→π₀B′ is étale, and fppf when it is flat and π₀B→π₀B′ is finitely presented. The flatness conditions bear on covering families only: a covering family of an object B is a family of étale (respectively fppf, flat) maps B→B_i that is jointly faithfully flat on π₀, that is, the images of the Spec π₀B_i cover Spec π₀B, and for fpqc some finite subfamily already does. The spectra and opens below are those of π₀, but the algebras and tensor products in these sites retain higher homotopy. CS24 forms the topoi of A on the full subcategories of A-algebras étale, fppf or flat over A; the restriction comparison below gives the same values at their objects. (CS24, §5.2.3, p.54; §5.2.5, p.55).

The API consists of the following laws and comparisons.

- A flat map with faithfully flat finitely presented π₀ is a singleton fppf cover.
- Derived tensor products compute base change of covers.
- An étale cover is fppf, and an fppf cover is fpqc.
- Every covering family gives the corresponding covering family of π₀ rings.
- For every object B, the slice of the big site at B is the big site of B, and its full subcategory of animated B-algebras étale (respectively fppf, flat) over B contains every covering family of each of its objects together with the derived tensor products of the terms of that family. Restriction of presheaves to this subcategory therefore commutes with sheafification, and the value at B of the sheafification of a presheaf on the big site is computed on it; for B=A these are the sites of CS24 §5.2.5.
- A map from A to a discrete ring factors uniquely through π₀A, so the discrete objects are the ordinary π₀A-algebras. A flat algebra over a discrete ring is discrete (§1.1), so every covering family of a discrete object, and every derived tensor product of its terms, is discrete. The topology induced on the full subcategory of ordinary π₀A-algebras, in which a family covers exactly when it covers in the big site, is therefore the ordinary big étale, fppf or fpqc topology on affine π₀A-schemes; in the fppf case it is `TauCeti.CommAlgCat.fppfTopology` of π₀A (of A itself when A is discrete), the topology induced from `AlgebraicGeometry.Scheme.fppfTopology` over Spec π₀A.
- For an ordinary π₀A-algebra C and a presheaf F on the big site, the two preceding comparisons identify the value at C of the étale, fppf or fpqc sheafification of F with the value at C of the sheafification, on the ordinary big site, of the restriction of F to ordinary algebras; for a presheaf of abelian groups placed in degree 0 this is the classical étale, fppf or fpqc cohomology of C with coefficients in its sheafification (CS24 §5.2.5, p.55). For the coefficient groups of this roadmap, the resulting identification of RΓ(C,G) with classical fppf cohomology and with the cohomology of `TauCeti.HopfAlgebra.pointsFppfSheaf` is the ordinary-algebra comparison of gap:animated-flat-cohomology, which §5.0 records on the pinned carrier.
- These comparisons concern the subcategory of ordinary algebras and the values at its objects, not the whole site. If B→B′ is faithfully flat, the flat tensor formula of §1.2 gives π_iB′≅π_iB⊗_(π₀B)π₀B′, which is nonzero whenever π_iB is, by faithfulness; so a covering family of a non-discrete object always has a non-discrete term, and the ordinary algebras do not cover the big site.
- The chosen fpqc cardinal bound is part of the site construction and may be enlarged compatibly.

**Checks.**

- Over A=ℤ/4 every fppf algebra is discrete, being flat over a discrete ring, so the covering families of ℤ/4 in the big site are exactly its ordinary fppf covering families, and the value at ℤ/4 of the fppf sheafification of G_a is ℤ/4 in degree 0, its classical fppf cohomology.
- Negative control. Over A=k, the animated k-algebra B=k⊕k[1] is an object of the big site, with π₁B=k, and is not an ordinary k-algebra. For every faithfully flat B→B′, π₁B′≅π₁B⊗_kπ₀B′=π₀B′≠0, so every covering family of B has a non-discrete term. Evaluation at B keeps H^(−1)(B,G_a)=π₁B=k, whereas RΓ(C,G_a)=C sits in degree 0 at every ordinary C, including C=k. A description of the whole big site of k by ordinary k-algebras would lose this value.
- For A=k⊕k[1], the discrete ring k is an object of the big site of A, as an ordinary π₀A-algebra, but A→k is not a covering map: its π₀ is étale, yet it is not flat, since π₁A⊗_kk=k while π₁k=0.
- Over k×k, the two component projections give a jointly faithful cover; a single component does not.
- For A=ℤ/p² and the element p, A/^Lp has π₀=𝔽_p and π₁=𝔽_p. It is not the discrete ring A/(p); all cover and continuity formulas keep this higher group.

**Proof route.** Verify the pretopology axioms from derived flat base change, composition of flat maps (§1.2) and the ordinary π₀ covering conditions. For the restriction to algebras flat over B, observe that covers of an object flat over B are flat over B by composition, and the derived tensor products of their terms by base change, so the inclusion is continuous and cocontinuous. A flat algebra over a discrete ring is discrete (§1.1), which gives the comparison on the ordinary subcategory; compare its fppf covering sieves with those of `TauCeti.CommAlgCat.fppfTopology` through affine open covers of flat locally finitely presented schemes. The flat tensor formula shows that non-discrete objects are not covered by discrete ones.

*Needs:* §1.1 flat animated modules and maps; §1.2 tensor products with flat animated modules; `AlgebraicGeometry.Scheme.fppfTopology`; `AlgebraicGeometry.Scheme.fpqcTopology`; `TauCeti.CommAlgCat.fppfTopology`; gap:animated-flat-cohomology.

### 1.5 Henselization of an animated ring

Construct the following object and comparisons. For an animated ring A and I⊂π₀A, construct A^h_I as the filtered colimit of the unique étale lifts to A of the pointed étale neighborhoods defining (π₀A)^h_I. Then π₀(A^h_I)≃(π₀A)^h_I and π_i(A^h_I)≃π_iA⊗_(π₀A)(π₀A)^h_I; A→A^h_I is ind-étale. This fixes the notation used by principal complete descent in §4.4. (CS24, Proof of Lemma 5.6.5, p.74; §5.2.4, p.54).

The API consists of the following laws and comparisons.

- There is the canonical map A→A^h_I.
- The map on π₀ is the ordinary I-henselization unit.
- Higher homotopy is extended scalarly along the ordinary henselization.
- Maps from A to an animated ring B whose π₀ is henselian for the image of I extend uniquely up to contractible choice through A^h_I.
- Maps of pairs give compatible maps of henselizations; the identity and composition laws are coherent.

**Checks.**

- For ordinary A this is precisely the parent’s ordinary henselization.
- A^h_(0)≃A, including all higher homotopy.
- If π₀A is I-henselian then A→A^h_I is an equivalence, also when A is nondiscrete.

**Proof route.** Use the imported ordinary henselization diagram and its pointed étale maps. Lift the entire diagram via the étale equivalence and form its filtered colimit in animated rings; flatness computes homotopy.

*Needs:* PurityForFlatCohomology §3.2 (étale algebras see π₀); SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`.

### 1.6 Cohomology of increasingly accurate ring towers

Prove the following statement. For an ordinary ring R, an affine commutative R-group G that is smooth or finite locally free, an animated R-algebra A and a tower of animated A-algebras A_n with τ≤n A≃τ≤n A_n compatibly, RΓ(A,G)≃Rlim_n RΓ(A_n,G). No completeness for an ideal is assumed; this is increasing Postnikov accuracy. (CS24, Corollary 5.2.7, p.56).

**Checks.**

- For A_n=τ≤nA, the formula is Postnikov convergence. For A=k⊕k[1], its tail is constant A and has H^(−1)(G_a)=k.
- For the constant tower A_n=A, both limits equal RΓ(A,G).
- For A=0 every term of the cohomology tower is 0.

**Proof route.** Form the double limit of RΓ(τ≤m A_n,G) over m and n. Taking it first in m gives Rlim_n RΓ(A_n,G), by Postnikov convergence for each A_n. Taking it first in n gives Rlim_m RΓ(τ≤m A,G), because τ≤m A_n≃τ≤m A compatibly for n≥m, so each tower in n is eventually constant; Postnikov convergence for A identifies this with RΓ(A,G). Limits commute in D(ℤ).

*Needs:* PurityForFlatCohomology §3.2 (Postnikov convergence).

### Examples

Over A=k⊕k[1], the quotient module k is not A-flat although π₀A→π₀k is an isomorphism, since π₁A⊗k=k while π₁k=0. The henselization of A along I=0 is A itself, with π₁=k. The Postnikov tower τ≤nA is constant equal to A from n=1, so the tower formula of §1.6 returns RΓ(A,G_a)=A, with H^(−1)=k and H⁰=k. Over the base k, the same ring k⊕k[1] is an object of the big fppf site of k that no family of ordinary k-algebras covers, while the covers of k itself are ordinary and give RΓ(k,G_a)=k in degree 0.

### Dependencies

EnhancedDerivedSheaves E5:animation.4 `animatedModules`; `Module.FaithfullyFlat`; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; `AlgebraicGeometry.Scheme.fppfTopology`; `AlgebraicGeometry.Scheme.fpqcTopology`; `TauCeti.CommAlgCat.fppfTopology`; gap:animated-flat-cohomology; PurityForFlatCohomology §3.2; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`.

## Layer 2: Animated group points and cotangent deformation

### 2.1 Animated points of a classical group

Construct the following object and comparisons. Fix an ordinary commutative ring R and a commutative flat affine R-group G=Spec B. On animated R-algebras put G(A)=Map_(AnimAlg_R)(B,A), with the ℤ-module-object structure induced by the classical group law. This is an animated abelian group, equivalently an object of D(ℤ) in cohomological degrees ≤0. The definition evaluates a classical group on animated algebras; it does not define finite flat group schemes over an arbitrary animated base. (CS24, §5.1.11, p.52; Examples 5.1.6(2)–(3), p.49).

The API consists of the following laws and comparisons.

- A→A′ gives G(A)→G(A′), preserving the ℤ-module structure and identities/composition.
- For ordinary A, G(A) is the discrete classical A-point group.
- G sends all limits of animated R-algebras to limits of animated abelian groups.
- For an ordinary R-algebra S, evaluation of G_S on animated S-algebras agrees with evaluation of G.
- The Dold–Kan image lies in D^(≤0)(ℤ); π_i corresponds to H^(−i).

**Checks.**

- For G=G_a, G(A) is the underlying animated additive group of A, including its higher homotopy.
- For G=𝔾_m and discrete A, π₀G(A)=A^× and π_iG(A)=0 for i>0.
- For A=k⊕k[1], G_a(A) has π₁=k; replacing A by π₀A would lose this value.

**Proof route.** Use representability to preserve limits; transport the classical commutative group law and coherent ℤ-action through animation. Use gap:animation-composition and Dold–Kan to distinguish animated abelian groups from arbitrary grouplike E∞ spaces.

*Needs:* EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; EnhancedDerivedSheaves E5:animation.1–.4; EnhancedDerivedSheaves E1.3; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:animation-composition; gap:classical-affine-group-adapter.

### 2.2 The cotangent at the identity

Construct the following object and comparisons. For a classical commutative flat affine R-group G and animated R-algebra A, the module-object cotangent corepresenting M↦fib(G(A⊕M)→G(A)) has underlying A-module C_G⊗^L_R A, where C_G=e*L_(G/R) and e is the identity section. The linearization carries the canonical ℤ-action coming from the group law. For finite-presentation G, this agrees with the ordinary R-linear action, rather than extra action data. (CS24, §5.1.11 and Proposition 5.1.12, p.52).

The API consists of the following laws and comparisons.

- The underlying complex is precisely e*L_(G/R).
- Maps from C_G⊗A to M identify naturally with fib(G(A⊕M)→G(A)).
- Ordinary base change and animated scalar extension preserve this identification.
- A group homomorphism G→H induces C_H→C_G and the corresponding natural transformation of tangent point-fibres.
- For finite-presentation G the group-object ℤ-action agrees with restriction of the R-module structure.

**Checks.**

- For G_a, C_G≃R in degree zero.
- For 𝔾_m, C_G≃R in degree zero, with its generator represented by dlog at 1.
- For G=μ_p over 𝔽_p, C_G≃[𝔽_p --0→ 𝔽_p] in degrees −1,0; using only the tangent space would lose the degree −1 term.

**Proof route.** Identify the point-fibre over the identity with derivations B→R⊕M at the augmentation B→R. Apply the cotangent universal property and base change; corepresentability in module objects supplies the coherent ℤ-action.

*Needs:* §2.1 animated points of a classical group; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex_ordinary`; EnhancedDerivedSheaves E5:animation.4 `animatedModules`; EnhancedDerivedSheaves E3.2.

### 2.3 Amplitude of the group cotangent

Prove the following statement. For a flat affine commutative R-group G of finite presentation, C_G=e*L_(G/R) is perfect of cohomological amplitude [−1,0]; for smooth G it is finite projective in degree zero. If G is finite locally free of p-power order, C_G[1/p]=0, so on affine base a power p^k kills C_G in D(R). (CS24, §5.1.11, p.52; proof of Theorem 5.3.5, pp.59–60).

**Checks.**

- For μ_p over 𝔽_p the complex is [𝔽_p→0 𝔽_p] in degrees −1,0, so both endpoints of the amplitude occur.
- For μ_p over ℤ it is [ℤ→p ℤ], and multiplication by p is null-homotopic; after inverting p it is acyclic.
- For G_a the complex is R in degree 0, including characteristic 2.

**Proof route.** Use the finite-presentation flat group cotangent theorem (CS24 §5.1.11), whose precise adapter is gap:flat-group-cotangent-amplitude, rather than inferring amplitude from flatness of an arbitrary algebra. A p-primary finite flat group becomes finite étale after inverting p; localization of the perfect cotangent is zero. Compactness gives a finite p-power annihilator.

*Needs:* §2.2 the cotangent at the identity; DerivedModuleAlgebra §§0.10–0.13, 1.E.0; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:flat-group-cotangent-amplitude.

### 2.4 Deformation of group-valued points

Prove the following statement. Let G be flat affine commutative of finite presentation over an ordinary ring R. If A′→A is a square-zero extension of animated R-algebras with connective ideal M, there is a functorial fibre sequence G(A′)→G(A)→Map_R(C_G,M[1]) in animated abelian groups. The last object is the connective realization of RHom_R(C_G,M[1]). This need not be a fibre sequence of untruncated D(ℤ)-objects: the obstruction map can fail to be surjective on π₀. (CS24, Theorem 5.1.13 and Remark 5.1.14, pp.52–53).

**Checks.**

- For 𝔾_m over k[ε]/ε²→k, the fibre is 1+εk≃k, while the obstruction target is the connective realization of k[1].
- For μ_p over 𝔽_p[ε]/ε²→𝔽_p the point fibre is 1+ε𝔽_p; the map to the degree-zero obstruction group 𝔽_p is not surjective. Thus an untruncated D(ℤ) fibre sequence of point objects would be false.
- For an extension with zero ideal the point map is an equivalence and its deformation target is 0.

**Proof route.** Apply G to the defining square-zero pullback and split the projection G(A⊕M[1])→G(A). Use cotangent corepresentability to identify its fibre; retain the connective-cover qualification.

*Needs:* §2.2 the cotangent at the identity; §2.3 amplitude of the group cotangent; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; DerivedModuleAlgebra §0.5.

### Examples

For μ_p over 𝔽_p the linearized cotangent complex is [𝔽_p→0 𝔽_p] in degrees −1,0. For 𝔾_m it is a single copy of the base ring in degree 0; both are needed by the deformation comparison.

### Dependencies

EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; EnhancedDerivedSheaves E5:animation.1–.4; EnhancedDerivedSheaves E1.3; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:animation-composition; gap:classical-affine-group-adapter; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex_ordinary`; EnhancedDerivedSheaves E5:animation.4 `animatedModules`; EnhancedDerivedSheaves E3.2; DerivedModuleAlgebra §§0.10–0.13, 1.E.0; gap:flat-group-cotangent-amplitude; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; DerivedModuleAlgebra §0.5.

## Layer 3: Split refinements, derived glueing and perfection

### 3.1 Ind-fppf refinements splitting all covers

Prove the following statement. For any ring R there is an ind-fppf R-algebra R̃ (PerfectoidQuotientsPartII §Q7.1) such that every faithfully flat finitely presented R̃-algebra admits an R̃-algebra retraction. If I⊂Jac(R), R̃ may be chosen so (R̃,IR̃) is henselian. Each such R̃ has no higher fppf cohomology for any abelian sheaf; the henselian refinement remains ind-fppf. (CS24, Lemma 5.3.1 and Remark 5.3.2, p.58).

**Checks.**

- An algebraically closed field has split nonempty finitely presented covers and no higher fppf cohomology.
- Over nonzero R a faithfully flat refinement has nonzero target, since otherwise its tensor kills R.
- The zero ring is its own refinement, with all cohomology 0.

**Proof route.** Choose a set of all finitely presented faithfully flat R-algebras and tensor over its finite subsets, ensuring each cover obtains a section after base change. Iterate this operation countably; insert I-henselization at each step when I⊂Jac(R). Descend any finite-presentation cover of the final colimit to a finite step; its chosen factor at the next step provides a section. Exactness of evaluation follows from splitting covers, hence vanishing of higher derived evaluation.

*Needs:* PerfectoidQuotientsPartII §§Q7.1, Q7.3; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; PurityForFlatCohomology §0.3; gap:torsor-limit-descent.

### 3.2 Derived Beauville–Laszlo glueing

Prove the following statement. For A→A′ of animated rings and a∈π₀A, if A/^La→A′/^La is an equivalence then A→A′×^h_(A′[1/a]) A[1/a] is an equivalence, also after passage to underlying D(ℤ)-objects. No nonzerodivisor or bounded-torsion assumption is imposed. (CS24, Lemma 5.3.3, p.58).

**Checks.**

- For ℤ→ℤ_p at p, the square ℤ→ℤ_p×_(ℚ_p)ℤ[1/p] is cartesian: ℤ_p∩ℤ[1/p]=ℤ and ℤ_p+ℤ[1/p]=ℚ_p.
- If a=1, both localizations are the rings themselves and the square is cartesian.
- If a=0, the derived residue hypothesis forces A→A′ to be an equivalence; it does not follow merely from equality of π₀.

**Proof route.** Apply the derived quotient and localization functors to the fibre of the comparison map. It is both uniquely a-divisible and a-power torsion, so vanishes. Use that limits of animated rings are computed on their underlying animated modules.

*Needs:* gap:animated-flat-cohomology; EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; DerivedModuleAlgebra §§1.2–1.4.

### 3.3 The square-zero defect of completed π₀

Prove the following statement. For animated A and a∈π₀A, the map π₀(Rlim_n A/^La^n)→lim_n π₀(A)/a^n is surjective with kernel lim¹_n π₁(A/^La^n). This kernel is square-zero. (CS24, Lemma 5.3.4, p.58).

**Checks.**

- For A=ℤ and a=p, π₁(A/^Lp^n)=0, so completed π₀=lim ℤ/p^n=ℤ_p with kernel 0.
- For A=ℤ/p² the π₁ tower has transitions multiplication by p and is eventually zero on every fixed level; lim¹=0 and completed π₀=ℤ/p².
- For a=1 all quotients and both sides are 0.

**Proof route.** Use the tower Milnor sequence and π₀(A/^La^n)=π₀A/a^n. Multiplication of two lim¹ classes lands in lim², which is zero for a sequential tower.

*Needs:* §3.2 derived Beauville–Laszlo glueing; DerivedModuleAlgebra §1.6; EnhancedDerivedSheaves E2:towers.1.

### 3.4 Perfection across an unchanged derived divisor

Prove the following statement. Suppose A→A′ are ordinary 𝔽_p-algebras, A perfect and A′ semiperfect. If A/^La≃A′/^La for a∈A, then the kernel of A′→(A′)^perf is uniquely a-divisible, and A/^La≃(A′)^perf/^La. (CS24, Lemma 5.4.1, pp.62–63).

**Checks.**

- For A=A′ perfect the kernel of A′→(A′)^perf is 0, hence uniquely a-divisible.
- For A=𝔽_p and A′=𝔽_p[t^(1/p^∞)]/(t), a=1, the kernel contains t^(1/p) but multiplication by a is the identity and both derived quotients are 0.
- For a=0, equivalence of derived residues forces A≃A′, so the nilpotent kernel vanishes.

**Proof route.** Semiperfection makes the perfection map surjective with nil kernel. Use the derived quotient hypothesis to identify annihilator groups and show multiplication by a is bijective on the kernel. The zero kernel modulo a and its zero derived a-torsion identify the derived quotients.

*Needs:* gap:perfection-covers; EnhancedDerivedSheaves E5:animation.2.

### Examples

For ℤ→ℤ_p and a=p the derived quotients agree, both being 𝔽_p because ℤ_p is ℤ-flat, and the glueing square of §3.2 reads ℤ≃ℤ_p×_(ℚ_p)ℤ[1/p], since ℤ_p∩ℤ[1/p]=ℤ and ℤ_p+ℤ[1/p]=ℚ_p. For A=ℤ and a=p every π₁(ℤ/^Lp^n) vanishes, so the completed π₀ of §3.3 is ℤ_p with zero square-zero defect. Over an algebraically closed field every faithfully flat finitely presented algebra has a section by the Nullstellensatz, so §3.1 may take the field itself as its refinement.

### Dependencies

PerfectoidQuotientsPartII §§Q7.1, Q7.3; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; PurityForFlatCohomology §0.3; gap:torsor-limit-descent; gap:animated-flat-cohomology; EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §1.6; EnhancedDerivedSheaves E2:towers.1; gap:perfection-covers; EnhancedDerivedSheaves E5:animation.2.

## Layer 4: Complete continuity

### 4.1 Derived completeness implies henselianity

Prove the following statement. For an animated ring A and an ideal I⊂π₀A, if A is derived a-complete for every a∈I, then (π₀A,I) is henselian. In particular finite-ideal derived completeness has this consequence; π₀A need not be classically I-complete. (CS24, Lemma 5.6.2, p.71).

**Checks.**

- For A=ℤ_p and I=(p), the pair is henselian with π₀A=ℤ_p.
- For A=𝔽_p⊕𝔽_p[1] and I=0, derived completeness is automatic and the pair is henselian despite higher homotopy.
- For ℤ and I=(p), p-completion is ℤ_p≠ℤ, and p is not in Jac(ℤ)=0; the hypothesis fails.

**Proof route.** Derived completeness is detected on homotopy groups and is preserved by truncation. Replace A by π₀A. For principal a, the completed-π₀ theorem then compares this ring to its ordinary a-completion with square-zero kernel. A classically complete ring is henselian, and henselianity lifts across a nil ideal. Apply the elementwise characterization of henselian pairs to all a∈I.

*Needs:* §3.3 the square-zero defect of completed π₀; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`.

### 4.2 H² invariance over a henselian pair

Prove the following statement. For any henselian pair (R,I) and commutative finite locally free R-group G, H²_fppf(R,G)→H²_fppf(R/I,G) is an isomorphism. This independent low-degree lemma precedes the general henselian-invariance theorem. (CS24, Lemma 5.6.3, p.71).

**Checks.**

- For ℤ_p and μ_p, H²=Br(ℤ_p)[p]=0=H²(𝔽_p,μ_p), while H¹(ℤ_p,μ_p)≃ℤ/p for p odd.
- For (R,0) the comparison is the identity.
- For R=ℂ[[t]] and μ_n, Pic=0 and Br=0 on both sides, so both H² groups are 0.

**Proof route.** The supplier henselian torsor/gerbe lifting theorem gives injectivity for finite flat G. The smooth resolution reduces surjectivity to smooth affine groups and then Weil restrictions of 𝔾_m. For the 𝔾_m term, the relevant torsion H² classes are Azumaya classes by affine Gabber, so lift them through the PGL_n torsor description and henselian smooth torsor lifting. Use the exact coefficient sequence to recover surjectivity for G.

*Needs:* gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology.

### 4.3 Continuity with a cohomological bound

Prove the following statement. Let A be a derived a-complete animated R-algebra, and G a commutative finite locally free R-group. If H^i(A,G)=H^i(A/^La,G)=0 for i≥3, then RΓ(A,G)≃Rlim_(n>0)RΓ(A/^La^n,G). (CS24, Lemma 5.6.4, pp.72–73).

**Checks.**

- For A=ℤ_p, a=p and G=μ_p, the dimension hypotheses hold and H¹ is the unit quotient ℤ/p for p odd.
- For a=1, derived a-completeness forces A=0 and both sides vanish.
- For the zero coefficient group both complexes vanish for every derived a-complete A.

**Proof route.** Use the bounds to reduce continuity to H⁰, H¹, H² and the low-degree tower Milnor sequence. The henselian H² lemma identifies the degree-two systems. Classical complete torsor effectivity and control of the automorphism tower handle H¹; affine point evaluation handles nonpositive degrees. The deformation triangle controls the square-zero completion defect and the animated Postnikov error.

*Needs:* §4.2 H² invariance over a henselian pair; §4.1 derived completeness implies henselianity; gap:cohomology-deformation; §2.3 amplitude of the group cotangent; §3.3 the square-zero defect of completed π₀; §1.6 cohomology of increasingly accurate ring towers; SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity.

### 4.4 Faithfully flat descent after principal completion

Prove the following statement. Fix an ordinary ring R, a commutative finite locally free R-group G, an animated R-algebra A and a∈π₀A. If A→A^• is a cosimplicial animated A-algebra, A and every A^j are derived a-complete, and A/^La→A^•/^La is a faithfully flat hypercover, then RΓ(A,G)→Rlim_Δ RΓ(A^•,G) is an equivalence. (CS24, Lemma 5.6.5, pp.74–75).

**Checks.**

- For R=ℤ, A=ℤ[[t]] and a=t, the identity cosimplicial A-algebra satisfies the statement directly; t need not come from R.
- For a=p coming from R=ℤ and A=ℤ_p, the split cover A→A×A has a contracting Čech object and recovers RΓ(A,G).
- For a=1 derived completeness forces every ring to be 0, hence both cohomology complexes are 0.

**Proof route.** Separate primary coefficients and the locus where that prime is invertible. For the primary piece, use prime continuity and the restricted complete-continuity lemma, whose required dimension bound holds in characteristic p. Compare the error with the étale extension by zero j_!G from the prime-invertible locus, using excision and henselian étale proper base change. Étale complete-arc hyperdescent handles that error. This order uses no general complete-continuity theorem.

*Needs:* §4.3 continuity with a cohomological bound; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PurityForFlatCohomology §3.4 (cohomological dimension in the primary case); PurityForFlatCohomology §3.6 (fpqc hyperdescent); PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §1.5 henselization of an animated ring; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5.

### 4.5 Continuity over complete animated rings

Prove the following statement. For animated R-algebra A derived I-complete with I=(a₁,…,a_r)⊂π₀A finite, and commutative finite locally free G/R, RΓ(A,G)≃Rlim_(n>0)RΓ(A/^L(a₁^n,…,a_r^n),G). The quotients are the animated Koszul quotients; they cannot in general be replaced termwise by ordinary quotients. (CS24, Theorem 5.6.6, p.75).

**Checks.**

- For the empty tuple, I=0 and every quotient is A, so the limit is the constant RΓ(A,G).
- For A=ℤ_p, I=(p), G=μ_p and p odd, H¹=ℤ/p agrees with the inverse-limit unit quotient.
- For A=ℤ/p² the derived quotient by p has π₀=π₁=𝔽_p; replacing the tower by ordinary quotients termwise loses π₁.

**Proof route.** Treat one generator. Construct an ind-fppf split-cover hypercover, take derived a-completions, and use the square-zero defect of completed π₀ to see that the terms and their derived quotients have no nonsplit étale covers. The smooth resolution kills H^j for j≥2, so restricted continuity applies. Use the preceding complete-descent theorem to pass from that cover back to A. Iterate generatorwise; commute the resulting finite family of sequential limits and use the diagonal cofinal system.

*Needs:* §4.4 faithfully flat descent after principal completion; §4.3 continuity with a cohomological bound; §4.2 H² invariance over a henselian pair; gap:cohomology-deformation; PurityForFlatCohomology §3.2 (fppf hyperdescent, Postnikov convergence and étale algebras over π₀); DerivedModuleAlgebra §1.6; §3.1 ind-fppf refinements splitting all covers; §3.3 the square-zero defect of completed π₀; gap:begueri-resolution.

### 4.6 Comparison with ordinary quotient cohomology

Prove the following statement. Let an ordinary ring R be derived I-complete for finite I, and G finite locally free commutative over R. Then H^i(R,G)→H^i(R/I,G) is surjective for i≥1 and bijective for i≥2. There is an exact sequence 0→lim¹_n H⁰(R/^L(a₁^n,…,a_r^n),G)→H¹(R,G)→lim_n H¹(R/I^n,G)→0 for any finite generating tuple a of I. If R is also classically I-complete, the lim¹ term is lim¹_n G(R/I^n). (CS24, Example 5.6.7, pp.75–76).

**Checks.**

- For ℤ_p and μ_p with p odd, H¹=ℤ/p→H¹(𝔽_p,μ_p)=0 is surjective, not injective.
- In that example μ_p(ℤ/p^n) has eventually zero transitions towards each fixed level, hence lim¹=0 and the inverse-limit H¹ is ℤ/p.
- For I=0 the tower is constant and lim¹=0.

**Proof route.** Take the tower Milnor exact sequence of the derived continuity formula. Use positive-degree truncation comparison and nil-invariance to identify the quotient cohomology groups. Use cofinality of the tuple-power ideals with I^n, keeping the derived point group in the degree-one kernel.

*Needs:* §4.5 continuity over complete animated rings; PurityForFlatCohomology §3.3 (classical truncation and nil ideals); EnhancedDerivedSheaves E2:towers.1.

### 4.7 Why henselianity does not give full continuity

Prove the following statement. For the henselization R=𝔽_p{t} of (𝔽_p[t],(t)), the map H¹(R,μ_p)→H¹(𝔽_p[[t]],μ_p) is not an isomorphism. The source is countable and the target is uncountable, as follows from units modulo p-th powers. Thus the complete-ring comparison cannot be extended to every henselian ring in degree one. (CS24, Remark 5.6.8, p.76).

**Checks.**

- For R=𝔽_p{t}, Pic(R)=0 and H¹(R,μ_p)=R^×/(R^×)^p is countable.
- For 𝔽_p[[t]], units 1+t·h(t^p) give distinct classes for uncountably many h: a ratio that is a p-th power lies in 𝔽_p[[t^p]], forcing the two h equal.
- Both rings have H²(μ_p)=Br[p]=0; the degree-one failure is consistent with H² invariance.

**Proof route.** The henselization of the countable finitely presented ring is countable. In 𝔽_p[[t]] the p-th-power units have exponents divisible by p; independent infinitely many remaining coefficients give uncountably many quotient classes. Both local rings have zero Picard group, so the Kummer sequence identifies H¹ with units modulo p-th powers.

*Needs:* §4.6 comparison with ordinary quotient cohomology; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; SchemeAndStackFoundations §0.12.

### Examples

Over ℤ[[t]], t lies in π₀ of the animated ℤ-algebra without lying in the base ℤ. Principal complete descent applies directly. For an empty generating tuple, complete continuity is the constant A-system.

### Dependencies

§3.3 the square-zero defect of completed π₀; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`; gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; gap:cohomology-deformation; §2.3 amplitude of the group cotangent; §1.6 cohomology of increasingly accurate ring towers; SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PurityForFlatCohomology §3.4; PurityForFlatCohomology §3.6; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §1.5 henselization of an animated ring; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; PurityForFlatCohomology §3.2; §3.1 ind-fppf refinements splitting all covers; PurityForFlatCohomology §3.3; SchemeAndStackFoundations §0.12.

## Layer 5: Henselian invariance and algebraization

### 5.0 Flat cohomology of ordinary algebras and henselian nonunital subrings

Define the following objects; they make §5.2 and §5.3 statable on the pinned carriers. For an ordinary ring R and a commutative finite locally free R-group G, an object of `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` over R, let `pointsAddFunctor G` be the functor on commutative R-algebras sending A to the abelian group G(A), the convolution group of R-algebra maps from the coordinate Hopf algebra of G to A; it is functorial through `AlgHom.mapValue` and commutative because the coordinate Hopf algebra is cocommutative. Let `coefficientSheaf G` be its sheafification on the affine fppf site `TauCeti.CommAlgCat.fppfTopology` after the universe lift `AddCommGrpCat.uliftFunctor`; the points presheaf is already an fppf sheaf (`TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`), so sheafification does not change it. Let `flatCohomology G n` be the covariant functor on commutative R-algebras sending A to the n-th `Ext` group, in abelian fppf sheaves on affine R-schemes, from the sheafified free abelian sheaf on the representable presheaf of Spec A to `coefficientSheaf G`, as in `CategoryTheory.Sheaf.cohomologyPresheafFunctor`. This is the n-th cohomology of the slice site over Spec A, which is the big affine fppf site of A, so its value is Hⁿ_fppf(A,G_A); its definition takes an instance of `CategoryTheory.HasExt` on the sheaf category, in the universe chosen for the `Ext` groups. Finally let `IsHenselianNonunitalSubring B′`, for a nonunital subring B′ of a ring B, be Gabber's criterion of the Conventions. (CS24 §5.2.5, p.55, for H^i(A,G) of an ordinary algebra; BC22 §2.1.1, p.5, and SP Tag 09XI for the criterion.)

The API consists of the following laws and comparisons.

- In degree zero, `flatCohomology G 0` evaluated at A is G(A), since homomorphisms out of the free sheaf on Spec A are sections at Spec A.
- A sequence 0→G′→G→G″→0 of commutative finite locally free R-groups that is exact as fppf sheaves gives a long exact sequence of the groups Hⁿ_fppf(A,−), natural in A.
- On ordinary R-algebras, `flatCohomology G n` agrees with H^n(A,G) of the animated construction of gap:animated-flat-cohomology and with the cohomology of `TauCeti.HopfAlgebra.pointsFppfSheaf` over Spec A.
- For an R-algebra R′ and an R′-algebra A, the theory of G over R evaluated at A agrees with the theory of the base change of G to R′ evaluated at A, by the identification of slice sites.
- A nonunital subring B′ satisfies `IsHenselianNonunitalSubring` exactly when B′ is a henselian ideal of its Dorroh unitalization ℤ⊕B′ in the `HenselianRing` sense; for an ideal I of a ring A, the pair (A,I) is henselian exactly when I is henselian as a nonunital subring of A; and every ideal of a henselian nonunital ring is again henselian (BC22 §2.1.1, p.5; SP Tag 09XI).

**Checks.**

- H¹_fppf(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t]^p by the additive Frobenius sequence, with the torsor x^p=t nonzero; étale cohomology of α_p, or of an étale points presheaf, would give 0.
- For p odd, H¹_fppf(ℤ_p,μ_p)=ℤ_p^×/(ℤ_p^×)^p≅ℤ/p by Kummer theory and Pic(ℤ_p)=0; for p=2 it is (ℤ/2)², generated by the classes of −1 and 5.
- For the trivial group, whose coordinate Hopf algebra is R, every group Hⁿ_fppf(A,G) is zero, including n=0.
- The zero subring and pℤ_p⊂ℤ_p are henselian nonunital subrings; ℤ⊂ℤ is not, since 1 has no quasi-inverse (2(1+y)=1 has no integer solution); and 3ℤ_(3)⊂ℤ_(3) has quasi-inverses (ℤ_(3) is local) but is not henselian, since T(T−1)−3 has discriminant 13, not a rational square, so no root in 1+3ℤ_(3). A criterion asking only for quasi-inverses would accept this last example.

*Needs:* gap:animated-flat-cohomology; SchemeAndStackFoundations §2.5; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra`; `AlgHom.mapValue`; `TauCeti.CommAlgCat.fppfTopology`; `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`; `CategoryTheory.presheafToSheaf`; `AddCommGrpCat.free`; `AddCommGrpCat.uliftFunctor`; `CategoryTheory.Abelian.extFunctor`; `CategoryTheory.HasExt`; `HenselianRing`.

### 5.1 Finitary functors and henselian completion

Prove the following statement. For a Noetherian henselian pair (A,I) whose completion map A→Â has geometrically regular fibres, and a set-valued functor F on A-algebras commuting with filtered colimits, F(A)→F(Â) is injective. An element of F(A/I) lifts to F(A) if and only if it lifts to F(Â). (BC22, Lemma 2.1.3, pp.6–7).

**Checks.**

- For (A,I)=(ℤ_(p)^h,(p)) and F(C)=C, A→ℤ_p is injective; the residue 1∈𝔽_p lifts to 1 in both rings.
- For I=0, Â=A and every comparison is the identity.
- For F the constant two-element set, F(A)→F(Â) is the identity and exactly the same residue elements lift on either side.

**Proof route.** Write Â as a filtered colimit of smooth A-algebras by Popescu. Each stage has an A/I-point inherited from Â; henselian smooth lifting gives an A-retraction. Descend a proposed equality or lift to one smooth stage and apply its retraction.

*Needs:* SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`.

### 5.2 Flat cohomology over henselian pairs

Prove `flatCohomology_henselian_invariance`: for a henselian pair (R,I) in the `HenselianRing` sense and a commutative finite locally free R-group G, the reduction map Hⁿ_fppf(R,G)→Hⁿ_fppf(R/I,G), the image of the quotient map R→R/I under `flatCohomology G n`, is surjective for n≥1 and bijective for n≥2. R and I may be non-Noetherian and I need not be finitely generated. (CS24, Corollary 5.6.9, p.76).

**Checks.**

- For (ℤ_(p)^h,p) and μ_p with p odd, H¹≃ℤ/p maps onto 0 on 𝔽_p, so bijectivity cannot be demanded in degree one.
- For the same pair, H²(μ_p)=0 on both sides.
- For I=0 the comparison is the identity in every degree.
- For the henselian pair (𝔽_p[[t]],(t)) and G=α_p, the additive Frobenius sequence gives H¹=𝔽_p[[t]]/𝔽_p[[t]]^p≠0, which maps onto H¹(𝔽_p,α_p)=𝔽_p/𝔽_p^p=0, and H²=0 on both sides; degree one fails injectivity for infinitesimal coefficients as well as for μ_p.

**Proof route.** Use varying-base continuity to reduce to the henselization of a finite-type ℤ-algebra along a finite ideal; gap:henselized-formal-fibres gives the geometrically regular completion map. Apply the finitary-functor completion comparison of §5.1, proved from Popescu and henselian smooth lifting, to the cohomology functor. Use complete continuity and the independent H² lemma. Descend and lift the finite data, then pass through filtered colimits; retain surjectivity only in degree one.

*Needs:* §5.0 flat cohomology of ordinary algebras; §4.6 comparison with ordinary quotient cohomology; §4.2 H² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; `TauCeti.Henselization.isNoetherianRing`; `TauCeti.Henselization.faithfullyFlat_adicCompletion`; `TauCeti.Henselization.completionEquiv`; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; §5.1 finitary functors and henselian completion; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; PurityForFlatCohomology §0.3; gap:torsor-limit-descent.

### 5.3 Algebraization over a topological ring

Prove `flatCohomology_algebraization`: let B be a topological ring, with the uniform structure of its additive group, and B′⊂B an open nonunital subring that is henselian (`IsHenselianNonunitalSubring`) and such that every neighbourhood of zero in B contains an open ideal of B′, equivalently B′ has a neighbourhood basis of zero consisting of ideals of B′. For the separated completion B̂ and every commutative finite locally free B-group G, the map Hⁿ_fppf(B,G)→Hⁿ_fppf(B̂,G) induced by B→B̂ is bijective for n≥2. No first-countability or Noetherian condition is imposed. (CS24, Corollary 5.6.10, p.76).

**Checks.**

- For B=𝔽_p{t} with its t-adic topology, B̂=𝔽_p[[t]] and both H²(μ_p)=0.
- For a discrete topological ring B, B̂=B and every high-degree comparison is the identity.
- The preceding noncomplete example has countable versus uncountable H¹(μ_p), so a degree-one extension would fail.
- For a henselian pair (A,I), take B=A and B′=I with the topology whose neighbourhoods of zero are the subsets containing I; then B̂=A/I and the statement is the degree-≥2 part of §5.2 (CS24 Example 5.6.11, p.77). If B′ were only required to have quasi-inverses, the pair (ℤ_(3),3ℤ_(3)) with this topology would be admitted, with completion 𝔽_3; there the conclusion fails, since H²(ℤ_(3),μ_3) contains Br(ℤ_(3))[3], which contains the class unramified at 3 of a cubic algebra over ℚ with invariants 1/3 at 2 and −1/3 at 5, while H²(𝔽_3,μ_3)=0. The criterion of §5.0 excludes this example.

**Proof route.** Apply the Cauchy-net algebraization criterion to the functor C↦H^i(C,G), i≥2. Its finitary property is the varying-base cohomology-limit theorem; invariance on henselian pairs is the preceding henselian-invariance theorem. Use the nonunital subring hypothesis through Gabber's criterion, equivalently through the Dorroh unitalization ℤ⊕B′ with its actual ring multiplication.

*Needs:* §5.0 flat cohomology of ordinary algebras and henselian nonunital subrings; `UniformSpace.Completion`; §5.2 flat cohomology over henselian pairs; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; gap:cauchy-algebraization; PurityForFlatCohomology §0.3; gap:torsor-limit-descent.

### 5.4 Algebraization on a Laurent puncture

Prove the following statement. For any ring R, let R{t} be the t-henselization of R[t]. For a commutative finite locally free group G over R{t}[1/t], the natural map H^i(R{t}[1/t],G)→H^i(R((t)),G) is an isomorphism for i≥2. (CS24, Example 5.6.11, p.77).

**Checks.**

- For R=𝔽_p and G=μ_p, Br(𝔽_p{t}[1/t])[p]=ℤ/p=Br(𝔽_p((t)))[p], giving H²=ℤ/p.
- For the same fields the unit quotients in H¹(μ_p) are respectively countable and uncountable, so i≥2 is essential.
- For the trivial group both sides vanish in every degree.

**Proof route.** Use the t-adic topological ring B=R{t}[1/t] and open nonunital subring tR{t}. Its completion is R[[t]][1/t]=R((t)); apply topological algebraization.

*Needs:* §5.3 algebraization over a topological ring; SchemeAndStackFoundations §0.12.

### 5.5 Henselian comparison on punctured animated rings

Prove the following statement. Let A→A′ be animated R-algebras and I⊂π₀A finite. Suppose π₀A and π₀A′ are henselian for I and its image, and π₀A/I≃(π₀A/I)⊗^L_A A′. For U=Spec π₀A minus V(I) and commutative finite locally free G/R, H^i(U_A,G)≃H^i(U_(A′),G) for i≥2. (CS24, Corollary 5.6.12, pp.76–77).

**Checks.**

- For ℤ_(p)^h→ℤ_p and I=(p), the generic fields have H²(μ_p)=Br[p]=ℤ/p on both sides.
- For I=(0) the derived residue condition forces A≃A′, and the punctured open is empty.
- For I=(1), henselianity forces the zero ring and both groups are 0.

**Proof route.** Compare the two support localization triangles. The support terms are equivalent by derived excision and the affine high-degree terms by henselian invariance and truncation comparison. Use the long exact sequences, including degree-two injectivity, to identify the punctured terms.

*Needs:* PurityForFlatCohomology §3.5 (finite-ideal derived excision); §5.2 flat cohomology over henselian pairs; PurityForFlatCohomology §3.3 (classical truncation); PurityForFlatCohomology §3.2 (flat cohomology with supports); SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`.

### 5.6 Comparison on Noetherian open neighborhoods

Prove the following statement. Let R→R′ be Noetherian rings, I⊂R an ideal, and both (R,I) and (R′,IR′) henselian. Suppose R/I^n≃R′/I^nR′ for every n>0. For every open U⊂Spec R containing Spec R minus V(I) and every finite locally free commutative R-group G, H^i(U,G)≃H^i(U×_R R′,G) for i≥2. (CS24, Corollary 5.6.13, p.77).

**Checks.**

- For ℤ_(p)^h→ℤ_p and U=D(p), the comparison is ℤ/p→ℤ/p on H²(μ_p).
- For R→R the hypothesis on every quotient holds and the map is the identity for any allowed U.
- For I=0 the equality of quotients already forces R≃R′; no flatness hypothesis has been inserted.

**Proof route.** Use Noetherian formal comparison and excision to compare supports on the complement of U. Use henselian invariance for the affine ambient terms. Use the independent punctured H² injectivity input for the boundary of the long exact sequence; higher degrees then follow.

*Needs:* §5.5 henselian comparison on punctured animated rings; §5.2 flat cohomology over henselian pairs; §4.5 continuity over complete animated rings; PurityForFlatCohomology §0.2 (fppf cohomology with supports on schemes); SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; PurityForFlatCohomology §3.5 (finite-ideal excision); gap:punctured-h2-injectivity.

### Examples

The henselian map ℤ_(p)^h→ℤ_p compares the generic-field groups H²(μ_p)=ℤ/p. In equal characteristic, 𝔽_p{t} has countably many unit classes modulo p-th powers while 𝔽_p[[t]] has uncountably many, so the degree-one completion comparison fails.

### Dependencies

gap:animated-flat-cohomology; SchemeAndStackFoundations §2.5; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra`; `AlgHom.mapValue`; `TauCeti.CommAlgCat.fppfTopology`; `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`; `CategoryTheory.presheafToSheaf`; `AddCommGrpCat.free`; `AddCommGrpCat.uliftFunctor`; `CategoryTheory.Abelian.extFunctor`; `CategoryTheory.HasExt`; `HenselianRing`; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`; §4.6 comparison with ordinary quotient cohomology; §4.2 H² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; `TauCeti.Henselization.isNoetherianRing`; `TauCeti.Henselization.faithfullyFlat_adicCompletion`; `TauCeti.Henselization.completionEquiv`; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; PurityForFlatCohomology §0.3; gap:torsor-limit-descent; `UniformSpace.Completion`; SchemeAndStackFoundations Layer 4; gap:cauchy-algebraization; SchemeAndStackFoundations §0.12; PurityForFlatCohomology §3.5; PurityForFlatCohomology §3.3; PurityForFlatCohomology §3.2; §4.5 continuity over complete animated rings; PurityForFlatCohomology §0.2; gap:punctured-h2-injectivity.

## Layer 6: Adic descent with supports

### 6.1 Discreteness of completely flat perfectoid modules

Prove the following statement. Let A be an integral perfectoid ring, derived complete for I=(a₁,…,a_r), and M a connective derived I-complete animated A-module. If M/^L(a₁^n,…,a_r^n) is flat over A/^L(a₁^n,…,a_r^n) for all n>0, then M is discrete. The conclusion is not ordinary flatness of M over an arbitrary non-Noetherian A. (CS24, Lemma 5.7.1, p.78).

**Checks.**

- For M=A the reductions are free of rank one and M is discrete.
- For nonzero A=𝔽_p, I=0 and M=A[1], the reduction is still A[1], which is not flat over the discrete A; the hypothesis excludes this nondiscrete module.
- For M=0 every reduction is flat and the conclusion is the discrete zero module.

**Proof route.** Use perfectoid p-complete arc hypercovers by products of complete rank-at-most-one valuation rings and descend M from its flat Koszul reductions. After completing and splitting the valuation products, reduce I to a principal element with compatible p-power roots. Compare M with the ordinary inverse limit of π₀M/a^n; the complete flat-system theorem identifies its reductions. The compatible-root annihilator identity makes (a) weakly proregular; adic flatness gives derived reduction discreteness. Derived Nakayama identifies M with that ordinary limit.

*Needs:* §1.1 flat animated modules and maps; §1.3 flatness after a nilpotent thickening; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; ArcTopologyAndDescent §11.2; ArcTopologyAndDescent §12.7; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9.

### 6.2 Adically faithfully flat descent with supports

Prove the following statement. Fix ordinary R, commutative finite locally free G/R, animated R-algebra A and I=(a₁,…,a_r)⊂π₀A. If A→A^• is a cosimplicial animated A-algebra whose derived Koszul reduction modulo the tuple is a faithfully flat hypercover, then RΓ_I(A,G)≃Rlim_Δ RΓ_I(A^•,G). Without completeness this is a supported statement. If A and all A^j are derived I-complete, the analogous equivalences also hold for RΓ(A,G) and for RΓ(U_A,G), U=Spec π₀A minus V(I). (CS24, Theorem 5.7.2, pp.78–81; SP, Tag 0A6R (Lemma 47.9.1), 0954 (Lemma 47.8.2), and §47.10; online, no page numbers).

**Checks.**

- For I=(1), both supported complexes vanish; completeness would force the rings to be 0 only for the additional full-cohomology assertion.
- For the empty tuple I=0, supports are full and the statement is fpqc hyperdescent.
- For the split cover A→A×A at I=(a), the localization fibres split with the cover and the totalization equals RΓ_(a)(A,G).

**Proof route.** Excision permits completing every term. General continuity and fpqc descent already give full affine descent in the complete case; the support triangle reduces the new assertion to punctured descent. Separate primary coefficients. Étale complete-arc hyperdescent treats the prime-invertible contribution and its j_! error. Prime continuity reduces the remaining punctured functor to characteristic-p quotients. Use complete module descent and the cohomology deformation triangle to make the assertion invariant under square-zero extensions; Postnikov convergence reduces to discrete 𝔽_p-algebras. Use ind-fppf semiperfect refinements, nilpotent approximation, and completion to reach perfect A. Perfectoid complete-flat discreteness makes the completed cover terms discrete, so cohomological connectiveness reduces hyperdescent to Čech descent. Establish universal Čech descent, allowing refinement of the cover by its perfection; repeat the reductions after arbitrary animated base change. This makes every Čech algebra perfect. Apply the perfect-base Dieudonné fibre formula. Remove V−1 by the fibre triangle and M by its finite projective dimension and base-change compatibility. For J=(p,[a₁],…,[a_r]) in W(A), use geometric supports as colim_n RHom(K_J^n,−), with the finite Koszul complex, instead of ordinary J-power quotients. Each dual Koszul complex on an ordinary Witt ring occupies [0,r+1], so filtered colimits commute with the cosimplicial totalization. Derived complete faithful-flat module descent identifies W(A) with the totalization of its Witt terms. Finite-projective Koszul base change and commutation of RHom with limits prove each fixed-n equivalence, then its filtered colimit. Witt rings are derived J-complete: p is regular, reduction modulo p is the I-complete perfect ring, and complete derived Nakayama lifts completeness along the finite Teichmüller tuple. The same argument applies to every cover term.

*Needs:* PurityForFlatCohomology §3.5 (finite-ideal derived excision); §4.5 continuity over complete animated rings; PurityForFlatCohomology §3.6 (fpqc hyperdescent); PurityForFlatCohomology §3.3 (cohomology across nil ideals); §3.1 ind-fppf refinements splitting all covers; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; §1.6 cohomology of increasingly accurate ring towers; §6.1 discreteness of completely flat perfectoid modules; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:perfection-covers; §4.1 derived completeness implies henselianity; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; PurityForFlatCohomology §0.3; gap:torsor-limit-descent; gap:complete-module-hyperdescent; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

### Examples

For I=(1), supported descent compares two zero complexes. For I=(0), support is the whole spectrum and the hypothesis is an fpqc hypercover. For a single nonunit parameter the split cover A→A×A descends the localization fibre directly.

### Dependencies

§1.1 flat animated modules and maps; §1.3 flatness after a nilpotent thickening; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; ArcTopologyAndDescent §11.2; ArcTopologyAndDescent §12.7; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9; PurityForFlatCohomology §3.5; §4.5 continuity over complete animated rings; PurityForFlatCohomology §3.6; PurityForFlatCohomology §3.3; §3.1 ind-fppf refinements splitting all covers; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; §1.6 cohomology of increasingly accurate ring towers; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:perfection-covers; §4.1 derived completeness implies henselianity; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; PurityForFlatCohomology §0.3; gap:torsor-limit-descent; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

## Downstream consumers

The exports are complete continuity (§4.5) and its ordinary-quotient form (§4.6), henselian invariance (§5.2), algebraization over topological rings and on Laurent punctures (§§5.3–5.4), the punctured and Noetherian-neighbourhood comparisons (§§5.5–5.6), adic descent with supports (§6.2), and the animated point and cotangent interfaces of Layer 2. They serve later work on torsors over complete and henselian rings in the setting of BC22 §2 and on flat cohomology of perfectoid and prismatic rings. PurityForFlatCohomology, PrismaticCohomologyPartIII and ArcTopologyAndDescent supply this roadmap and take nothing from it.

## Worked examples

Over 𝔽_p[t], the fppf α_p torsor x^p=t is nontrivial: the additive Frobenius sequence gives H¹(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t]^p. Passing to an étale point presheaf would erase this torsor. Over a perfect 𝔽_p-algebra, Frobenius is surjective and the α_p example behaves differently; the Dieudonné formula still records the correct V−1 fibre, including its possible H¹ for other groups.

For A=ℤ/p², the derived quotient by p has π₀=𝔽_p and π₁=𝔽_p. The ordinary residue does not record π₁. The map ℤ/p²→𝔽_p therefore fails the derived residue condition of PurityForFlatCohomology §3.5, although the ordinary residues agree. By contrast ℤ→ℤ_p is flat and has identical derived reductions modulo p, so it satisfies that condition for I=(p).

For the pro-fppf site, Spec ℤ[1/2]→Spec ℤ and Spec ℚ→Spec ℤ are flat pro-ppf maps that do not cover; Spec ℤ[1/2] together with Spec ℤ_(2) covers, and the quasi-compact covering condition is met because Spec ℤ is the union of the two images. Neither the identification H^i(R̃,−)=0 of §3.1 nor any descent statement uses non-covering flat maps.

For supports, I=(1) gives zero cohomology and satisfies the derived residue condition for every map; I=(0) gives full cohomology. Ideals (t) and (t²) give the same support complex, whereas their Koszul quotients are distinct objects. In §6.2 these two cases are the zero comparison and fpqc hyperdescent.

## References

Page numbers are printed preprint pages. Stable Stacks tags replace pages for the online reference. Statements and proof paths are expressed in this roadmap’s own words.

- **CS24**. Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*. arXiv:1912.10932v3, 26 April 2023; preprint pagination. [Source](https://arxiv.org/pdf/1912.10932v3). Locations used: §1.4 p.8; §4.1.2 p.36; §§4.1.5–4.1.6 pp.37–38; §§5.1–5.7 pp.49–81.
- **BG80**. Lucile Bégueri, *Dualité sur un corps local à corps résiduel algébriquement clos*. Mémoires de la SMF, nouvelle série 4 (1980). [Source](https://www.numdam.org/item/MSMF_1980_2_4__1_0.pdf). Locations used: §§2.1–2.2, pp.22–27.
- **DJ**. Aise Johan de Jong, *A result of Gabber*. author note, nine pages; undated PDF. [Source](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf). Locations used: §3.1, p.4.
- **BC22**. Alexis Bouthier and Kęstutis Česnavičius, *Torsors on loop groups and the Hitchin fibration*. arXiv:1908.07480v4; preprint pagination. [Source](https://arxiv.org/pdf/1908.07480v4). Locations used: §§2.1.1–2.1.8 pp.5–8; §2.1.12–2.1.15 pp.11–13; §2.3 pp.29–31.
- **Y18**. Amnon Yekutieli, *Flatness and completion revisited*. arXiv:1606.01832v3, 6 September 2017; numbering differs from published 2018 paper. [Source](https://arxiv.org/pdf/1606.01832v3). Locations used: Theorem 1.8 pp.5–6; §4 pp.12–14; Theorem 5.9 pp.16–17.
- **SP**. The Stacks Project Authors, *The Stacks Project*. online version. [Source](https://stacks.math.columbia.edu/tag/0954). Locations used: Tag 0954, Lemma 47.8.2, statement and proof; stable tag in place of page number; Tag 0A6R, Lemma 47.9.1, geometric localization complex; §47.10, local cohomology for Noetherian rings and comparison map; Tags 0AH2 and 0AH3, regular completion and henselization of G-rings; Tag 09XI (Lemma 15.11.6), Gabber's criterion for henselian pairs.
- **C19**. Kęstutis Česnavičius, *Purity for the Brauer group*. arXiv:1711.06456v4, 1 December 2018; internal date 4 December 2018; preprint pagination. [Source](https://arxiv.org/abs/1711.06456v4). Locations used: §1.5 p.3.
- **R70**. Michel Raynaud, *Spécialisation du foncteur de Picard*, Publications Mathématiques de l’IHÉS 38 (1970), pp.27–76. [Source](https://www.numdam.org/item/PMIHES_1970__38__27_0/). Lemma 6.2.2, p.51.
