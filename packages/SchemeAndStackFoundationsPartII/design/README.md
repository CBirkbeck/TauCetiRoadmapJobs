# Roadmap: scheme and stack foundations, part II — flat cohomology

**Summary.** Starting from SchemeAndStackFoundations' ordinary schemes, torsors and cohomology, this Part II builds the general flat-cohomology interfaces for animated algebras with ordinary finite locally free commutative coefficients: fpqc hyperdescent, finite-ideal excision, complete continuity, henselian invariance, algebraization and adic descent with supports. The Brauer contribution extends affine comparison to quasi-compact separated schemes carrying an ample invertible sheaf. Perfect-base Dieudonné theory, prime-adic continuity and principal excision enter from their earlier owner.

## Scope and ownership

SchemeAndStackFoundations stops at the ordinary scheme, site, torsor, Brauer-class-map and formal-geometry interfaces of §§0.9, 0.12, 0.14–0.15, 0.21, 1.15, 2.1–2.15 and 2.22. This Part II owns ind-fppf and ind-syntomic maps, the pro-fppf site, animated point and support interfaces, the remaining deformation consequences, finite-ideal excision, fpqc hyperdescent, complete continuity, henselian invariance and supported adic descent.

PrismaticCohomologyPartIII §6.0 owns the perfect-base classification, Hom/Ext description, perfect pro-fppf comparison, V−1 sequence and perfect-base cohomology triangle through `Prismatic.FlatCohomology.perfectDieudonneComparison`, as well as `Prismatic.FlatCohomology.pContinuity` and `Prismatic.FlatCohomology.excision`. Its proof routes also construct Bégueri resolutions, animated fppf cohomology, the cohomology deformation triangle and perfection of pro-fppf covers; the precise exports needed here are supplier gaps below. Layer 4 here retains the affine vanishing consequence, Layer 2 the animated-point cotangent interfaces, and Layer 3 the further Postnikov, truncation, nilpotent and support consequences, each distinguished from that imported construction.

HeightsRationalPointsAndObstructions §§2.6a–2.6c owns `TwistedModule`, `endomorphismAzumaya`, projective stabilization, `localEtale_finiteFree_domination`, `twistedBundle_affine_glue` and `Brauer.affine_comparison`. Its §2.6d treats finite-type quasi-projective schemes over infinite fields. Layer 1 extends that result to every quasi-compact separated scheme with an ample invertible sheaf, using the arithmetic Skolem argument. Twisted-module calculus is used on Noetherian models after SchemeAndStackFoundations §0.9 approximation and gap:flat-cohomology-continuity; its general construction is not repeated here. AlgebraicModuliForArithmeticGeometry Layer 4 owns banded gerbes and their H² classification. AlgebraicVectorBundles L0A–L0C owns the untwisted tensor, dual, Hom and rank operations.

The pinned library provides the ordinary algebraic predicates, the classical fppf and fpqc topologies, the affine Hopf-algebra fppf point sheaf and finite locally free Cartier duality. DerivedModuleAlgebra owns ordinary square-zero classification (§0.5), Koszul complexes (§0.K.1) and module completion (§§1.1–1.9); EnhancedDerivedSheaves supplies the animated enhancements. ArcTopologyAndDescent's complete arc interfaces are recorded only as supplier gaps. Purity, the perfectoid Dieudonné formula and mixed-characteristic birational applications have other owners and are downstream of these general interfaces.

## Conventions

Rings are commutative and unital, including the zero ring. A finite ideal means a finitely generated ideal. Unless a statement changes the base, R is an **ordinary** ring and G is an **ordinary** affine commutative R-group. The principal coefficients are finite locally free G, and some preliminary theorems also allow smooth affine G. We evaluate those groups on animated R-algebras A. No theorem silently introduces a finite-flat-group theory over an arbitrary animated base.

We use cohomological indexing in D(ℤ): π_i corresponds to H^(−i). An animated module is connective, so occupies cohomological degrees ≤0. A derived fixed-point expression for V is **fib(V−1)** in D(ℤ); the ordinary fixed subgroup is only its H⁰. Limits of cohomology complexes are derived limits, including hypercover totalizations. The support convention is the fibre of restriction to the complementary open. For animated A, its topological spectrum means Spec π₀A, while all its algebraic tensor products retain higher homotopy.

Choose actual representatives for finite tuples of π₀-elements when forming derived Koszul quotients. All comparisons are invariant under the resulting equivalences; there is no chosen canonical map π₀A→A. Derived completion, animated rings, cotangent complexes and their module categories come from the owners listed below. On an ordinary ring, A/^La is the cone of multiplication by a on the underlying module; it need not equal A/(a).

A henselian pair means the native HenselianRing convention: I⊂Jac(R) and simple monic roots lift. Locality, Noetherianity and completeness are separate hypotheses. A nonunital henselian ring uses the genuine Dorroh unitalization Z⊕I, with multiplication (m,x)(n,y)=(mn,my+nx+xy).

The three Brauer objects retain distinct names: Br_Az(X), the parent’s Azumaya Morita classes; Br′(X)=H²_et(X,G_m)_tors; and ambient H²_et(X,G_m). The natural class map is compared with Br′ only under the stated affine or ample-line-bundle hypotheses. Kummer exactness with μ_n uses the fppf topology for every n≥1, including n divisible by residue characteristic.

In the covariant crystalline convention, M(ℤ/p^n) has F=pσ and V=σ⁻¹, whereas M(μ_(p^n)) has F=σ and V=pσ⁻¹. The source is CS24 §4.1.2, p.36, and the supplier is PrismaticCohomologyPartIII §6.0. The normalization and indexing are fixed by these computed witnesses.

**Checks.**

- On 𝔽_p with G=ℤ/p, V−1=0 on 𝔽_p, so the fibre has H⁰=H¹=𝔽_p. For μ_p, V−1=−1 and both groups are 0. Taking an ordinary kernel would miss the first H¹.
- For A=k⊕k[1] and G_a, H^(−1)(A,G_a)=k and H⁰=k. Thus homotopy degree 1 corresponds to cohomological degree −1.
- For A=ℤ/p², multiplication by p has kernel and cokernel 𝔽_p, so A/^Lp has π₁=π₀=𝔽_p. The ordinary quotient has π₁=0.
- With I=(1), supported cohomology is fib(id)=0; with I=(0), it is fib(RΓ(A,G)→0)=RΓ(A,G). These directions are retained in every support comparison.
- The pair (ℤ,2ℤ) is not henselian, since Jac(ℤ)=0; (ℤ₂,2ℤ₂) is henselian. In the Dorroh multiplication, (1,0)(n,y)=(n,y), while (0,x)(0,y)=(0,xy).

## Exact supplier contracts

From Mathlib and Tau Ceti at the manifest pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following file lines locate the definitions and signatures.

| Supplier declaration | Pinned file and line | Input consumed |
| --- | --- | --- |
| `Algebra.FinitePresentation` | Mathlib/RingTheory/FinitePresentation.lean:43 | An algebra presentation by finitely many generators and a finitely generated relation ideal; used in ind-fppf factorization tests. |
| `Module.FaithfullyFlat` | Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63 | Flat modules with the maximal-ideal faithfulness condition; retains the distinction between flat and faithfully flat. |
| `AlgebraicGeometry.Scheme.fppfTopology` | Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:53 | Classical scheme fppf topology generated by jointly surjective flat locally finitely presented families. |
| `AlgebraicGeometry.Scheme.fpqcTopology` | Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:75 | Classical scheme fpqc topology with the quasi-compact covering condition. |
| `TauCeti.CommAlgCat.fppfTopology` | TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:51 | The affine fppf topology on (CommAlgCat R)^op induced from schemes over Spec R. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeNatIso` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:174 | The natural isomorphism between Cartier dualization after arbitrary scalar extension and scalar extension after Cartier dualization on the native finite locally free commutative affine group category; used in the Bégueri resolution base-change API. |
| `HenselianRing` | Mathlib/RingTheory/Henselian.lean:94 | Henselian pairs via Jacobson containment and simple monic root lifting; no locality or completeness is part of the pair. |
| `IsAzumaya` | Mathlib/Algebra/Azumaya/Defs.lean:60 | Faithful finite projective algebras for which the left-right multiplication map is bijective; not a scheme Brauer group. |
| `AdicCompletion.flat_of_isNoetherian` | Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378 | Flatness of the completion of a Noetherian ring. |
| `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` | TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81 | Flat finite presentations of fixed fibre dimension; a standard syntomic local model, not the global locally syntomic predicate. |
| `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension.baseChange` | TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:168 | Arbitrary scalar extension preserves the standard syntomic relative dimension. |
| `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:61 | The native affine Hopf-algebra point presheaf is an fppf sheaf. |
| `TauCeti.HopfAlgebra.pointsFppfSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:78 | The group-valued affine fppf sheaf, before an abelian coefficient adapter for a commutative group law. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:331 | Native finite locally free Cartier duality. |

`HenselianRing` includes Jacobson containment and simple monic root lifting; it includes neither locality nor completeness. `IsAzumaya` includes projectivity, finite generation and faithful scalar action, in addition to bijectivity of left-right multiplication. The standard syntomic predicate specifies a flat finite presentation of fixed fibre dimension; it does not supply the global locally syntomic predicate. The group-valued `TauCeti.HopfAlgebra.pointsFppfSheaf` uses `GrpCat`; abelian coefficients still need the commutative-group adapter specified below.

From TauCetiRoadmap.SchemeAndStackFoundations: §§0.9 and 0.12 supply limits, Noetherian approximation and henselization; §0.14 supplies `henselian_pair_characterisations`, `henselian_pair_permanence`, `henselian_smooth_lifting` and `henselian_finiteEtale_equivalence`; §0.15 supplies `popescu_colimit_of_geometricallyRegular` and §0.21 regular maps and G-rings. Section 1.15 supplies `torsorRepresentability`. Sections 2.1–2.6 supply derived site cohomology, Leray, torsors, filtered sheaf colimits and quasi-coherent cohomology; §2.10 supplies `smoothGroup_fppf_etale_comparison`; §2.11 supplies `fppf_kummer_sequence` for every n≥1; §2.15 supplies `gabber_affine_proper_base_change` and `etale_cohomology_limits`. Section 2.22 supplies `SchemeBrauerGroup`, `CohomologicalBrauer` and `Azumaya.trivializationGerbeClass`; injectivity of its class map is the separate gap below.

From TauCetiRoadmap.PrismaticCohomologyPartIII §6.0: `Prismatic.FlatCohomology.perfectDieudonneComparison` includes covariant crystalline classification over perfect bases, finite projective dimension, F,V with FV=VF=p, perfect-base change, and the V−1 fibre on the étale site. `Prismatic.FlatCohomology.pContinuity` applies to p-primary finite locally free coefficients on animated algebras with p-henselian π₀, without completeness. `Prismatic.FlatCohomology.excision` compares supports under derived principal residue equivalence. The latter two theorems include their own lifting and descent proof inputs; no proof of either is scheduled here.

From TauCetiRoadmap.HeightsRationalPointsAndObstructions: §2.6a's `TwistedModule` and `endomorphismAzumaya` supply Noetherian twisted-module descent, coherent extension and the positive-rank Azumaya criterion. Section 2.6b supplies commutative projective K₀ rank, cancellation and tensor-root stabilization. Section 2.6c's `Brauer.affine_comparison` is for every commutative ring, and its `localEtale_finiteFree_domination` and `twistedBundle_affine_glue` supply local existence and affine patching. Section 2.6c lists injectivity of the Azumaya class map among its prerequisites; this is precisely gap:brauer-class-injective, not an additional assumption of injectivity here.

From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry Layer 4 §§4.1–4.8: banded gerbes, neutralizations, change of band and classification by derived H². From TauCetiRoadmap.AlgebraicVectorBundles L0A–L0C: untwisted module and finite locally free tensor, dual, internal Hom and rank operations.

From TauCetiRoadmap.EnhancedDerivedSheaves: E1.3 supplies enhanced derived objects; E2.3 and E2.7 hypercovers and Postnikov descent; E2:towers.1 the Milnor comparison retaining lim¹; E3.2 accessible localization; E5:animation.1–.4 animation, perfect characteristic-p tensors, bounded totalizations and animated modules; E5:cotangent-export.1 supplies `cotangentComplex` and its comparison `cotangentComplex_ordinary`. In particular E5:animation.3's `tot_filteredColimit_of_bounded` is used only with a uniform lower cohomological bound.

From TauCetiRoadmap.DerivedModuleAlgebra: §0.5 classifies ordinary square-zero extensions, §0.K.1 supplies finite Koszul complexes, and §§1.1–1.8 supply limits, completion, Nakayama, Koszul completion towers and complete flatness. Section 1.9 supplies p-adic Čech module descent for ordinary p-complete rings with bounded p-power torsion; the finite-tuple animated hypercover extension is a gap below. From TauCetiRoadmap.DerivedDeRhamCohomology §1.22, `DerivedDeRham.completionExchanges` gives the stated perfect-tensor and bounded-totalization exchanges.

From TauCetiRoadmap.PerfectoidQuotients Layer 0 §§0.1, 0.4–0.6: integral perfectoid rings, reducedness, compatible-root annihilators, ring operations and completion. From TauCetiRoadmap.ReductiveGroupsPartII Layer RG2.0a §§RG2.0a.1–RG2.0a.3: affine Weil restriction along finite locally free maps and arbitrary base change. From TauCetiRoadmap.PotentialModularityAndCompatibleSystems Layer 2 §2.8, `moret_bailly_integral_point` gives the integral-point theorem for incomplete Skolem data. The application here has base ℤ, empty prescribed-place set, and an open of affine space surjective over ℤ.

What EnhancedDerivedSheaves must provide (gap:animation-composition): For 1-sifted-colimit-preserving F:C→D and H:D→E between cocomplete categories generated by strongly finitely presented objects, supply Ani(H)∘Ani(F)→Ani(H∘F), an equivalence when F(C^sfp)⊂Ind(D^sfp) or Ani(H)(F(C^sfp)) is discrete, and identify the limit-preserving composites of animated rings, abelian groups and anima. Section: E5:animation. (CS24 Proposition 5.1.5 and Example 5.1.6, p.49).

What EnhancedDerivedSheaves must provide (gap:general-square-zero): For m≥0 and an animated ring B that is (m+1)-truncated, classify B→τ≤mB as the square-zero extension by π_(m+1)(B)[m+1] associated to its derivation, and identify τ≤(m+2)L_(τ≤mB/B)≃π_(m+1)(B)[m+2], compatibly with base change. Section: E5:cotangent-export.1. (CS24 §§5.1.9–5.1.10, pp.51–52).

What SchemeAndStackFoundations must provide (gap:finite-group-ext): For every commutative finite locally free group X over any scheme, the fppf sheafification of T↦Ext¹_(T_fppf)(X_T,G_m), with Ext classifying commutative group extensions, vanishes. Section: Layer 2 §2.4. (BG80 Proposition 2.2.1, pp.25–27; R70 Lemma 6.2.2, p.51).

What SchemeAndStackFoundations must provide (gap:henselian-stack-lifting): For any henselian pair (A,I) and smooth algebraic A-stack X with quasi-affine diagonal, X(A)→X(A/I) is essentially surjective. Section: Layer 1 §§1.18–1.22. (BC22 Proposition 2.1.4, pp.7–8).

What SchemeAndStackFoundations must provide (gap:henselian-torsor-cohomology): For any henselian pair (A,I), H¹(A,Q)→H¹(A/I,Q) is bijective for smooth affine Q; for flat finitely presented quasi-affine G it is surjective, and for commutative such G the map on H² is injective. Section: Layer 1 §1.15. (BC22 Theorem 2.1.6, pp.7–8). *Needs:* gap:henselian-stack-lifting.

What SchemeAndStackFoundations must provide (gap:cauchy-algebraization): For a topological ring B with an open nonunital henselian subring B′ and a zero-neighborhood basis of B′-ideals, every set-valued functor F on B-algebras commuting with filtered colimits and invariant under henselian pairs satisfies F(B)≃F(B̂), via the Cauchy-net quotient description of the separated completion, with no first-countability or Noetherian hypothesis. Section: Layer 4. (Bouthier–Česnavičius §2.1.12–2.1.15, pp.11–13).

What SchemeAndStackFoundations must provide (gap:punctured-h2-injectivity): For Noetherian R→R′ and a finite ideal I such that both associated pairs are henselian and R/I^n≃R′/I^nR′ for every n>0, every open U containing Spec R minus V(I) and commutative finite locally free R-group G satisfy injectivity of H²(U,G)→H²(U×_R R′,G), without assuming flatness of R→R′. Section: Layer 4. (Bouthier–Česnavičius Corollary 2.3.5(c), pp.30–31; CS24 Corollary 5.6.13, p.77).

What DerivedModuleAlgebra must provide (gap:adic-flat-module-limits): For a finite weakly proregular ideal J⊂C and flat C/J^n-modules M_n with M_(n+1)⊗_(C/J^(n+1))C/J^n≃M_n, their limit M′ is classically J-complete, M′/J^nM′≃M_n and Tor_i^C(N,M′)=0 for i>0 and J-power-torsion N, and completion preserves this adic flatness. Section: §1.7. (Yekutieli arXiv:1606.01832v3 Theorems 1.8,4.3,5.9, pp.5–6,14,16–17 (published numbering cited by CS24: 2.8,4.3,6.9)).

What SchemeAndStackFoundations must provide (gap:char-p-etale-dimension): For every affine scheme in characteristic p and every p-primary torsion abelian étale sheaf F, H^i_et(X,F)=0 for i≥2. Section: Layer 2. (CS24 Corollary 5.3.7, p.61).

What SchemeAndStackFoundations must provide (gap:flat-cohomology-continuity): For a filtered diagram of ordinary R-algebras C_j and an affine commutative R-group G smooth or finite locally free, colim_j H^i_fppf(C_j,G)≃H^i_fppf(colim_j C_j,G) for i≥0; the same holds for inverse limits of qcqs schemes with affine transition maps and descended such coefficients, including compatible quasi-compact opens and supports defined by finite ideals. Section: Layer 2 §2.5. (CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–60; de Jong §3.1, p.4).

What SchemeAndStackFoundations must provide (gap:torsor-limit-descent): For a filtered diagram of ordinary R-algebras and a flat affine finitely presented R-group G, G-torsors, their isomorphisms and every finite diagram of such data descend to some finite stage. Section: Layer 1 §1.15. (CS24 Lemma 5.3.1, Claim 5.3.5.3 and Corollary 5.2.10, pp.57–60; de Jong §3.1, p.4).

What SchemeAndStackFoundations must provide (gap:complete-torsor-effectivity): For every ordinary ring C classically complete and separated for (a), and finite locally free C-group G, G-torsors and their isomorphisms are equivalent to compatible systems over C/a^n, with the H⁰ Mittag–Leffler comparison of CS24 Lemma 5.6.4 and without a Noetherian hypothesis. Section: Layer 4. (CS24 Lemma 5.6.4, pp.72–73).

What DerivedModuleAlgebra must provide (gap:complete-module-hyperdescent): For a finite tuple in π₀A and a hypercover of animated A-algebras faithfully flat after derived Koszul reduction, connective derived I-complete modules satisfy descent under completed tensor product; include valuation-product perfectoid arc hypercovers when their structural rings and flat Koszul reductions descend. Section: §1.9. (CS24 proof of Lemma 5.7.1 and square-zero step of Theorem 5.7.2, pp.78,80).

What DerivedModuleAlgebra must provide (gap:koszul-geometric-support): For any ordinary ring T, finite tuple b and N∈D(T), geometric cohomology supported on V(b) is C_b⊗^L_T N≃colim_n RHom_T(K_T(b₁^n,…,b_s^n),N), where C_b=⊗_i[T→T[1/b_i]]; this identification commutes with derived base change and perfect-complex tensor coefficients, without weak proregularity. Section: §0.K.1 and §§1.2–1.4. (SP Tag 0A6R, Lemma 47.9.1; CS24 proof of Theorem 5.7.2, p.81).

What SchemeAndStackFoundations must provide (gap:syntomic-presentations): For ordinary ring maps and scheme morphisms, define syntomic to mean locally standard syntomic using TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension, and prove composition and finite-presentation limit descent. Section: Layer 0 §0.8. (CS24 §2.3.3 and footnote 11, p.24).

What SchemeAndStackFoundations must provide (gap:classical-affine-group-adapter): For ordinary rings, connect the native affine Hopf-algebra group-point functors and finite locally free Cartier duality with the smooth affine commutative group-scheme category, including smoothness of Res_(X/S)G_m for finite locally free X/S. Section: Layer 1 §1.15. (Bégueri §§2.1–2.2, pp.22–27; CS24 §§1.4,5.1.11, pp.8,52).

What SchemeAndStackFoundations must provide (gap:flat-group-cotangent-amplitude): For every flat affine commutative group G of finite presentation over an ordinary ring R, its linearized cotangent C_G=e*L_(G/R) is perfect of amplitude [−1,0], has amplitude [0,0] when G is smooth, and carries the canonical additive linearization of the group law. Section: Layer 1 §1.15. (CS24 §5.1.11 and Proposition 5.1.12, p.52).

What SchemeAndStackFoundations must provide (gap:ample-global-generation): For a quasi-compact scheme X with ample invertible L and finite-type quasi-coherent F, F⊗L^n is globally generated for all sufficiently large n, with coherent extension of finite generator data on Noetherian models and no properness hypothesis. Section: Layer 2. (de Jong §§3.2–3.7, pp.4–6).

What SchemeAndStackFoundations must provide (gap:noetherian-completion-flat): For a Noetherian local ring (C,m), its m-adic completion is faithfully flat, with C/m^n≃Ĉ/m^nĈ for n>0; combine the pinned completion flatness with these quotients to obtain the derived residue comparison. Section: Layer 0 §0.21. (CS24 Corollary 5.4.5, p.68; standard Noetherian completion theorem).

What PrismaticCohomologyPartIII must provide (gap:begueri-resolution): For every commutative finite locally free G/S, supply a functorial, arbitrary-base-change-compatible fppf-exact sequence 0→G→H→Q→0 with H=Res_(G*/S)G_m, Q the affine symmetric multiplicative two-cocycle group on G*, coboundary H→Q faithfully flat and finitely presented, and H,Q smooth affine commutative S-groups. Section: §6.0. (BG80 Proposition 2.2.1 and proof, pp.25–27). *Needs:* gap:finite-group-ext; gap:classical-affine-group-adapter; ReductiveGroupsPartII §RG2.0a.

What PrismaticCohomologyPartIII must provide (gap:animated-flat-cohomology): For ordinary R and an affine commutative R-group G smooth or finite locally free, supply the D(ℤ)-valued fppf and étale sheafifications RΓ(A,G) of the animated point functor, the identity τ≤0RΓ(A,G)≃G(A), evaluation on opens by the fppf slice-site limit with pullback transition maps, and the ordinary-algebra comparison with TauCeti.HopfAlgebra.pointsFppfSheaf and classical sheaf cohomology. Section: §6.0. (CS24 §5.2.5 and (5.2.5.1), p.55).

What PrismaticCohomologyPartIII must provide (gap:cohomology-deformation): For an ordinary ring R, an affine commutative R-group G smooth or finite locally free, and a square-zero extension A′→A of animated R-algebras by a connective ideal M, supply the functorial untruncated fibre sequence RΓ(A′,G)→RΓ(A,G)→RHom_R(e*L_(G/R),M[1]) in D(ℤ), where e is the identity section. Section: §6.0. (CS24 Theorem 5.2.8, p.57).

What PrismaticCohomologyPartIII must provide (gap:perfection-covers): For morphisms of 𝔽_p-algebras, perfection preserves faithful flatness and ind-fppf maps, so perfecting a pro-fppf cover over a perfect base again gives a cover. Section: §6.0. (CS24 Lemma 4.1.6, pp.37–38).

What ArcTopologyAndDescent must provide (gap:torsion-arc-hyperdescent): For every qcqs scheme X and torsion abelian étale sheaf F, étale cohomology and its restrictions to quasi-compact opens satisfy arc hyperdescent. Section: Layer 6 §6.4.

What ArcTopologyAndDescent must provide (gap:formal-glueing): For a finite ideal I in an ordinary ring A and an A-algebra B with A/I^n ≃ B/I^nB for all n>0, the formal glueing square for torsion étale cohomology is cartesian. Section: Layer 8 §8.6.

What ArcTopologyAndDescent must provide (gap:complete-etale-hyperdescent): For a finite ideal I and torsion étale coefficients, cohomology of I-adic completions, I-henselizations and their punctured spectra satisfies I-complete arc hyperdescent. Section: Layer 11 §11.5.

What ArcTopologyAndDescent must provide (gap:complete-valuation-product-basis): For an ordinary ring A and finite ideal I, every A-algebra has an I-complete arc-cover by a product of I-complete absolutely integrally closed valuation domains of rank at most one, whose quasi-compact opens are étale-acyclic. Section: Layer 11 §11.2.

What ArcTopologyAndDescent must provide (gap:integral-perfectoid-hyperdescent): For a p-complete arc-hypercover of integral perfectoid ℤ_p-algebras with all terms integral perfectoid, the structural rings, tilts and A_inf rings are derived hyperdescent objects. Section: Layer 12 §12.7.

What SchemeAndStackFoundations must provide (gap:brauer-class-injective): For every scheme X, an Azumaya algebra whose class in H²_et(X,G_m) is zero is End(E) for an everywhere positive-rank finite locally free E, so SchemeBrauerGroup.toH2 is injective; this is also a prerequisite of HeightsRationalPointsAndObstructions §2.6c. Section: §2.22. (DJ §§2.13–2.14 and §3.1, pp.3–4).

What SchemeAndStackFoundations must provide (gap:henselized-formal-fibres): For the henselization A of a finite-type ℤ-algebra along a finite ideal I, A is Noetherian and A→lim_n A/I^n has geometrically regular fibres. Section: §0.21. (CS24 proof of Corollary 5.6.9, p.76; SP Tags 0AH2, 0AH3).

## How to read the build

Layer 0 gives ind-flat maps and the pro-fppf site, Layer 1 the arithmetic ample Brauer extension, and Layers 2–3 the point, support and deformation consequences of the imported animated-cohomology construction. Layer 4 extracts affine vanishing from the supplied perfect-base triangle. Layers 5–7 assemble prime-complete comparisons, finite-ideal excision and fpqc descent from the supplied prime-adic continuity and principal excision. Layer 8 starts with the independent henselian H² lemma, then restricted continuity, principal complete descent and full finite-ideal continuity, in that order. Layer 9 uses finitary completion comparison for henselian invariance and algebraization. Layer 10 concludes with adic descent with supports. Each *Needs:* line lists both statement inputs and those used by the displayed proof route.

## Layer 0: Ind-flat maps and the pro-fppf site

### 0.1 Ind-fppf ring maps

Define the following predicate or object. A ring map R→B is ind-fppf if B is a filtered colimit, in commutative R-algebras, of faithfully flat finitely presented R-algebras. Equivalently every R-algebra map C→B with C finitely presented factors C→D→B with D faithfully flat and finitely presented over R. The indexing category is filtered and small in a fixed universe; a general faithfully flat map need not satisfy this predicate. (CS24, §2.3.3 and footnotes 12–13, p.24).

The API consists of the following laws and comparisons.

- Every faithfully flat finitely presented R-algebra is ind-fppf.
- The finite-presentation factorization criterion in the statement is equivalent to the filtered-colimit definition.
- An ind-fppf R-algebra is Module.FaithfullyFlat over R.
- Base change of an ind-fppf map along any ring map is ind-fppf.
- Composites of ind-fppf maps are ind-fppf.
- A nonempty finite product of ind-fppf R-algebras is ind-fppf.
- A filtered colimit of ind-fppf R-algebras is ind-fppf.

**Checks.**

- R→R[X] is ind-fppf even when R has nilpotents.
- Z→Q is not ind-fppf: factorization of Z[1/2]→Q through a faithfully flat ℤ-algebra would make 2 a unit there.
- R→R is ind-fppf, including the zero ring.
- For nonzero R, R→0 is not ind-fppf; this detects omission of faithfulness.

**Proof route.** Use the finite-presentation factorization criterion for filtered algebra colimits; include faithful flatness in every approximating stage. Descend finite equations and maps to finite stages; source footnote 13 explains preservation under composition.

*Needs:* `Algebra.FinitePresentation`; `Module.FaithfullyFlat`; SchemeAndStackFoundations §0.9.

### 0.2 Ind-syntomic ring maps

Define the following predicate or object. A ring map R→B is ind-syntomic if B is a filtered colimit of syntomic R-algebras, without requiring these algebras to be faithful. Syntomic means flat and finitely presented with local complete-intersection fibres, equivalently the local regular-sequence presentations of CS24 footnote 11. Every map from a finitely presented R-algebra to B must factor through a syntomic R-algebra. (CS24, §2.3.3, p.24).

The API consists of the following laws and comparisons.

- Every syntomic ring map is ind-syntomic.
- Factorization through syntomic finite-presentation algebras characterizes ind-syntomicity.
- Arbitrary base change preserves ind-syntomicity.
- Composition preserves ind-syntomicity.
- A faithfully flat ind-syntomic map is ind-fppf.
- Finite products and filtered colimits preserve ind-syntomicity.

**Checks.**

- Z→Z[1/2] is ind-syntomic but not ind-fppf.
- 𝔽_p→𝔽_p[x]/(x^p) is syntomic and faithfully flat, hence both ind-syntomic and ind-fppf despite being non-étale.
- Z→Z/4 is not ind-syntomic, since it is not flat.

**Proof route.** Apply the same finite-presentation factorization argument to the syntomic class. Use finite-presentation descent of flatness and local complete intersection for composition and base change.

*Needs:* §0.1 ind-fppf ring maps; SchemeAndStackFoundations Layer 0 §§0.9, 0.12, 0.14; gap:syntomic-presentations; `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`; `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension.baseChange`.

### 0.3 The pro-fppf site

Define the following predicate or object. A map X′→X is pro-ppf if, locally on source and target in affine charts, its ring map is a filtered colimit of flat finitely presented algebras. The pro-fppf site has schemes as objects, pro-ppf arrows as covering candidates, and families satisfying: each quasi-compact open of the target is a finite union of images of quasi-compact opens in the sources. A single faithfully flat pro-ppf morphism is called pro-fppf. These covers are fpqc covers; no topology is generated by arbitrary faithfully flat maps alone. (CS24, §4.1.5, p.37).

The API consists of the following laws and comparisons.

- Every fppf covering family is a pro-fppf covering family.
- Base change preserves pro-fppf covers.
- Composites of covering families cover.
- Every pro-fppf cover is fpqc in the scheme-site sense.
- For affines, a faithfully flat ind-ppf ring map defines a pro-fppf singleton cover.
- Representable functors are sheaves for this topology.

**Checks.**

- The identity of any scheme covers.
- The two component inclusions into Spec(k×k) form a cover, although neither singleton is surjective.
- Spec k→Spec(k×k) selecting one component does not cover.
- A faithfully flat finitely presented affine map covers in both the native Mathlib fppf topology and this topology.

**Proof route.** Use affine filtered presentations and the quasi-compact covering condition to check pullbacks and refinements. Relate the resulting topology to the native fppf and fpqc topologies.

*Needs:* §0.1 ind-fppf ring maps; `AlgebraicGeometry.Scheme.fpqcTopology`; SchemeAndStackFoundations §2.10.

### Examples

Over ℤ/4 the polynomial algebra (ℤ/4)[X] is faithfully flat and finitely presented, hence ind-fppf. Over ℤ the localization ℤ[1/2] is syntomic but not faithfully flat; this separates the two ind predicates.

### Dependencies

`Algebra.FinitePresentation`; `Module.FaithfullyFlat`; SchemeAndStackFoundations §0.9; SchemeAndStackFoundations Layer 0 §§0.9, 0.12, 0.14; gap:syntomic-presentations; `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`; `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension.baseChange`; `AlgebraicGeometry.Scheme.fpqcTopology`; SchemeAndStackFoundations §2.10.

## Layer 1: Twisted bundles and ample Brauer comparison

### 1.1 Twisted bundles with an ample invertible sheaf

Prove the following statement. Let X be quasi-compact and separated with an ample invertible sheaf, and let 𝒢→X be a G_m-gerbe with torsion class. Then 𝒢 has a finite locally free weight-one sheaf of constant positive rank. The construction reduces to finite type over ℤ and improves the codimension of the non-locally-free locus of a coherent twisted sheaf until that locus is empty. This extends HeightsRationalPointsAndObstructions §2.6d from finite-type quasi-projective schemes over infinite fields to general arithmetic ample schemes. (DJ, §3.1–3.22, pp.4–9).

**Checks.**

- On a G_m-gerbe, n+1 weight-one factors have weight n+1; an invertible weight −n sheaf changes this to 1. Torsion does not identify integer weights.
- Over an affine base the construction recovers a positive-rank twisted bundle from HeightsRationalPointsAndObstructions §2.6c. Rank zero cannot generate an Azumaya representative.
- For the neutral gerbe over P¹_Z, O with its weight-one character is a rank-one solution; a restriction to schemes over infinite fields would exclude this arithmetic base.

**Proof route.** Spread out the finite gerbe data and the ample bundle to a finite-type Z-model; affine Gabber supplies enough local twisted bundles. After choosing a μ_n-lift by fppf Kummer and descending its finite data through Noetherian approximation, use the Noetherian twisted-module calculus of HeightsRationalPointsAndObstructions §2.6a. For a class killed by n, select n+1 coherent twisted sheaves, finite locally free at prescribed complementary points and of common generic rank r. The direct sum of r^n copies of each has weight one; their tensor product has weight n+1. On a G_m-gerbe tensor weights add as integers: transport weight n+1 back to weight one with a chosen invertible weight −n sheaf, or make the construction on a μ_n-gerbe lift. Use Serre generation and the high codimension of the determinantal bad cone to choose a morphism with controlled kernels. de Jong Claim 3.22 obtains such a section after a finite flat Z-extension: the complement of the bad closure is an open of affine space, surjective over ℤ, so the imported incomplete-Skolem theorem applies with empty local conditions. Push the kernel back along the finite faithfully flat extension; its nonfree locus improves in codimension. Iterate through the finite dimension of the model.

*Needs:* HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; HeightsRationalPointsAndObstructions §2.6a `TwistedModule`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.9; PotentialModularityAndCompatibleSystems Layer 2 §2.8 `moret_bailly_integral_point`; HeightsRationalPointsAndObstructions §2.6b; HeightsRationalPointsAndObstructions §2.6c `localEtale_finiteFree_domination`; HeightsRationalPointsAndObstructions §2.6c `twistedBundle_affine_glue`; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:flat-cohomology-continuity; gap:ample-global-generation.

### 1.2 Gabber’s Brauer comparison with an ample bundle

Prove the following statement. If X is quasi-compact and separated and admits an ample invertible sheaf, Br_Az(X)→Br′(X)=H²_et(X,G_m)_tors is an isomorphism. This includes affine and quasi-affine schemes. The isomorphism is the natural Azumaya class map; no equality with the entire H² group is asserted. (DJ, Theorem 1.1, p.1; proof §§2–3, pp.1–9).

**Checks.**

- On an affine scheme the comparison agrees with HeightsRationalPointsAndObstructions §2.6c Brauer.affine_comparison.
- On Spec R, M₂(R)=End(R²) has class 0. Over the real field the quaternion division algebra has nonzero class; injectivity distinguishes it from the matrix algebra.
- For P¹_k the comparison gives Br_Az(P¹_k)=Br(k)=Br′(P¹_k); it is not an assertion about all ambient H².

**Proof route.** Use the μ_n-lift and Noetherian model in the ample twisted-bundle construction; apply HeightsRationalPointsAndObstructions §2.6a endomorphismAzumaya on that model and pull back the resulting Azumaya algebra. Use gap:brauer-class-injective for injectivity of the general scheme class map.

*Needs:* §1.1 twisted bundles with an ample invertible sheaf; HeightsRationalPointsAndObstructions §2.6a `endomorphismAzumaya`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; gap:brauer-class-injective; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §0.9.

### Examples

For the neutral gerbe BG_m over ℙ¹_ℤ, the standard character tensored with O is weight one and its endomorphism algebra is O. Three weight-one factors have weight 3; when n=2 a weight −2 line brings the tensor back to weight 1.

### Dependencies

HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; HeightsRationalPointsAndObstructions §2.6a `TwistedModule`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.9; PotentialModularityAndCompatibleSystems Layer 2 §2.8 `moret_bailly_integral_point`; HeightsRationalPointsAndObstructions §2.6b; HeightsRationalPointsAndObstructions §2.6c `localEtale_finiteFree_domination`; HeightsRationalPointsAndObstructions §2.6c `twistedBundle_affine_glue`; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:flat-cohomology-continuity; gap:ample-global-generation; HeightsRationalPointsAndObstructions §2.6a `endomorphismAzumaya`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; gap:brauer-class-injective.

## Layer 2: Animated group points and cotangent deformation

### 2.1 Animated points of a classical group

Construct the following object and comparisons. Fix an ordinary commutative ring R and a commutative flat affine R-group G=Spec B. On animated R-algebras put G(A)=Map_(AnimAlg_R)(B,A), with the Z-module-object structure induced by the classical group law. This is an animated abelian group, equivalently an object of D(ℤ) in cohomological degrees ≤0. The definition evaluates a classical group on animated algebras; it does not define finite flat group schemes over an arbitrary animated base. (CS24, §5.1.11, p.52; Examples 5.1.6(2)–(3), p.49).

The API consists of the following laws and comparisons.

- A→A′ gives G(A)→G(A′), preserving the Z-module structure and identities/composition.
- For ordinary A, G(A) is the discrete classical A-point group.
- G sends all limits of animated R-algebras to limits of animated abelian groups.
- For an ordinary R-algebra S, evaluation of G_S on animated S-algebras agrees with evaluation of G.
- The Dold–Kan image lies in D^(≤0)(ℤ); π_i corresponds to H^{−i}.

**Checks.**

- For G=G_a, G(A) is the underlying animated additive group of A, including its higher homotopy.
- For G=G_m and discrete A, π₀G(A)=A^× and π_iG(A)=0 for i>0.
- For A=k⊕k[1], G_a(A) has π₁=k; replacing A by π₀A would lose this value.

**Proof route.** Use representability to preserve limits; transport the classical commutative group law and coherent Z-action through animation. Use gap:animation-composition and Dold–Kan to distinguish animated abelian groups from arbitrary grouplike E∞ spaces.

*Needs:* EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; EnhancedDerivedSheaves E5:animation.1–.4; EnhancedDerivedSheaves E1.3; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:animation-composition; gap:classical-affine-group-adapter.

### 2.2 The cotangent at the identity

Construct the following object and comparisons. For a classical commutative flat affine R-group G and animated R-algebra A, the module-object cotangent corepresenting M↦fib(G(A⊕M)→G(A)) has underlying A-module C_G⊗^L_R A, where C_G=e*L_(G/R) and e is the identity section. The linearization carries the canonical Z-action coming from the group law. For finite-presentation G, this agrees with the ordinary R-linear action, rather than extra action data. (CS24, §5.1.11 and Proposition 5.1.12, p.52).

The API consists of the following laws and comparisons.

- The underlying complex is precisely e*L_(G/R).
- Maps from C_G⊗A to M identify naturally with fib(G(A⊕M)→G(A)).
- Ordinary base change and animated scalar extension preserve this identification.
- A group homomorphism G→H induces C_H→C_G and the corresponding natural transformation of tangent point-fibres.
- For finite-presentation G the group-object Z-action agrees with restriction of the R-module structure.

**Checks.**

- For G_a, C_G≃R in degree zero.
- For G_m, C_G≃R in degree zero, with its generator represented by dlog at 1.
- For G=μ_p over 𝔽_p, C_G≃[𝔽_p --0→ 𝔽_p] in degrees −1,0; using only the tangent space would lose the degree −1 term.

**Proof route.** Identify the point-fibre over the identity with derivations B→R⊕M at the augmentation B→R. Apply the cotangent universal property and base change; corepresentability in module objects supplies the coherent Z-action.

*Needs:* §2.1 animated points of a classical group; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex_ordinary`; EnhancedDerivedSheaves E5:animation.4 `animatedModules`; EnhancedDerivedSheaves E3.2.

### 2.3 Amplitude of the group cotangent

Prove the following statement. For a flat affine commutative R-group G of finite presentation, C_G=e*L_(G/R) is perfect of cohomological amplitude [−1,0]; for smooth G it is finite projective in degree zero. If G is finite locally free of p-power order, C_G[1/p]=0, so on affine base a power p^k kills C_G in D(R). (CS24, §5.1.11, p.52; proof of Theorem 5.3.5, pp.59–60).

**Checks.**

- For μ_p over 𝔽_p the complex is [𝔽_p→0 𝔽_p] in degrees −1,0, so both endpoints of the amplitude occur.
- For μ_p over ℤ it is [Z→p Z], and multiplication by p is null-homotopic; after inverting p it is acyclic.
- For G_a the complex is R in degree 0, including characteristic 2.

**Proof route.** Use the finite-presentation flat group cotangent theorem (CS24 §5.1.11), whose precise adapter is gap:flat-group-cotangent-amplitude, rather than inferring amplitude from flatness of an arbitrary algebra. A p-primary finite flat group becomes finite étale after inverting p; localization of the perfect cotangent is zero. Compactness gives a finite p-power annihilator.

*Needs:* §2.2 the cotangent at the identity; DerivedModuleAlgebra §§0.10–0.13; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:flat-group-cotangent-amplitude.

### 2.4 Deformation of group-valued points

Prove the following statement. Let G be flat affine commutative of finite presentation over an ordinary ring R. If A′→A is a square-zero extension of animated R-algebras with connective ideal M, there is a functorial fibre sequence G(A′)→G(A)→Map_R(C_G,M[1]) in animated abelian groups. The last object is the connective realization of RHom_R(C_G,M[1]). This need not be a fibre sequence of untruncated D(ℤ)-objects: the obstruction map can fail to be surjective on π₀. (CS24, Theorem 5.1.13 and Remark 5.1.14, pp.52–53).

**Checks.**

- For G_m over k[ε]/ε²→k, the fibre is 1+εk≃k, while the obstruction target is the connective realization of k[1].
- For μ_p over 𝔽_p[ε]/ε²→𝔽_p the point fibre is 1+ε𝔽_p; the map to the degree-zero obstruction group 𝔽_p is not surjective. Thus an untruncated D(ℤ) fibre sequence of point objects would be false.
- For an extension with zero ideal the point map is an equivalence and its deformation target is 0.

**Proof route.** Apply G to the defining square-zero pullback and split the projection G(A⊕M[1])→G(A). Use cotangent corepresentability to identify its fibre; retain the connective-cover qualification.

*Needs:* §2.2 the cotangent at the identity; §2.3 amplitude of the group cotangent; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; DerivedModuleAlgebra §0.5.

### Examples

For μ_p over 𝔽_p the linearized cotangent complex is [𝔽_p→0 𝔽_p] in degrees −1,0. For G_m it is a single copy of the base ring in degree 0; both are needed by the deformation comparison.

### Dependencies

EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; EnhancedDerivedSheaves E5:animation.1–.4; EnhancedDerivedSheaves E1.3; SchemeAndStackFoundations Layer 1 §§1.13–1.15; gap:animation-composition; gap:classical-affine-group-adapter; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex_ordinary`; EnhancedDerivedSheaves E5:animation.4 `animatedModules`; EnhancedDerivedSheaves E3.2; DerivedModuleAlgebra §§0.10–0.13; gap:flat-group-cotangent-amplitude; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; DerivedModuleAlgebra §0.5.

## Layer 3: Animated sites, supports and deformation consequences

### 3.1 Flat animated modules and maps

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
- Z/4→F₂ is not a flat map of discrete rings.
- The zero module over a nonzero field is flat but not faithfully flat.
- For A=k⊕k[1] and M=k, π₀M=k is faithfully flat but π₁A⊗k=k≠π₁M=0. Thus M is not faithfully flat.

**Proof route.** Use the graded homotopy module and its canonical scalar-extension map. Keep all homotopy-degree conditions as part of the predicate.

*Needs:* EnhancedDerivedSheaves E5:animation.4 `animatedModules`; `Module.FaithfullyFlat`.

### 3.2 Tensor products with flat animated modules

Prove the following statement. For a flat connective animated A-module M and every connective animated A-module N, π_*(N⊗^L_A M)≃π_*N⊗_(π₀A)π₀M, naturally and as graded modules. Flatness and faithful flatness are preserved by arbitrary derived base change; composites of flat (respectively faithfully flat) animated ring maps have the same property. (CS24, §5.2.1, p.53).

**Checks.**

- For A=Z, M=ℤ_p and N=ℤ/p, both sides have π₀=𝔽_p and higher homotopy 0.
- For M=A and N=k[1] over A=k, both sides have π₁=k and π₀=0; an ungraded formula loses this term.
- Base change of A→A[X] gives B→B[X] with π_i(B[X])=(π_iB)[X] in each degree.

**Proof route.** Use the homotopy Tor spectral sequence: graded flatness kills all positive Tor columns. Apply the resulting formula to the new base and ordinary faithfulness on π₀.

*Needs:* §3.1 flat animated modules and maps; EnhancedDerivedSheaves E5:animation.4 `animatedModules`.

### 3.3 Flatness after a nilpotent thickening

Prove the following statement. Let A→B induce a surjection π₀A→π₀B with nilpotent kernel, and let M be a connective animated A-module. Then M is flat, respectively faithfully flat, if and only if B⊗^L_A M is so over B. Also M=0 if and only if B⊗^L_A M=0. The nilpotent-kernel condition is uniform; a general localization is not a detection map. (CS24, Lemma 5.2.2, pp.53–54).

**Checks.**

- For A=Z/4, B=F₂ and M=F₂, B⊗^L_A M has Tor₁=F₂ and is not flat, agreeing with M not flat over A.
- For M=A the reduction is B and both modules are flat over their bases.
- Localization ℤ→Q is excluded: Z/2 tensors to 0 while Z/2≠0.

**Proof route.** First reduce the source to π₀ by induction through its square-zero Postnikov layers, using the homotopy tensor calculation. For ordinary rings reduce the nilpotent ideal to square-zero steps and apply the derived local flatness criterion; derived Nakayama detects zero for connective modules.

*Needs:* §3.1 flat animated modules and maps; §3.2 tensor products with flat animated modules; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero.

### 3.4 Étale, fppf and fpqc sites of animated rings

Define the following predicate or object. Fix an animated ring A. On animated A-algebras use flat maps; étale maps are flat maps with étale π₀, and fppf maps are flat maps with finitely presented π₀. Covering families are jointly faithfully flat on π₀, with the usual finite quasi-compact refinement convention for fpqc. Fix a cardinal bound when forming the big fpqc site. The spectra and opens below are those of π₀, but the algebras and tensor products in these sites retain higher homotopy. (CS24, §5.2.3, p.54; §5.2.5, p.55).

The API consists of the following laws and comparisons.

- A flat map with faithfully flat finitely presented π₀ is a singleton fppf cover.
- Derived tensor products compute base change of covers.
- For discrete A the three sites recover their ordinary counterparts; the affine fppf topology matches TauCeti.CommAlgCat.fppfTopology.
- An étale cover is fppf, and an fppf cover is fpqc.
- Every covering family gives the corresponding covering family of π₀ rings.
- The chosen fpqc cardinal bound is part of the site construction and may be enlarged compatibly.

**Checks.**

- Every fppf algebra over ℤ/4 is discrete; ordinary fpqc cohomology is unchanged by the animated site.
- For A=k⊕k[1], A→k has étale π₀ but is not an animated étale map because it is not flat.
- Over k×k, the two component projections give a jointly faithful cover; a single component does not.
- For A=ℤ/p² and the element p, A/^Lp has π₀=𝔽_p and π₁=𝔽_p. It is not the discrete ring A/(p); all cover and continuity formulas keep this higher group.

**Proof route.** Verify the pretopology axioms from derived flat base change and the ordinary π₀ covering conditions. A flat algebra over a discrete source is discrete, giving the exact comparison with classical sites.

*Needs:* §3.1 flat animated modules and maps; §3.2 tensor products with flat animated modules; `AlgebraicGeometry.Scheme.fppfTopology`; `AlgebraicGeometry.Scheme.fpqcTopology`; `TauCeti.CommAlgCat.fppfTopology`.

### 3.5 Étale algebras see π₀

Prove the following statement. For an animated ring A, π₀ induces equivalences from étale A-algebras to étale π₀A-algebras, and from finite étale A-algebras to finite étale π₀A-algebras. Étale A→B has L_(B/A)=0. The inverse functor is the unique étale lifting, not a tensor product along a nonexistent canonical map π₀A→A. (CS24, Proposition 5.2.4, p.54).

**Checks.**

- For A=𝔽_p⊕𝔽_p[1], the lift of F_(p²) is A⊗_(𝔽_p)F_(p²), with π₀=F_(p²) and π₁=F_(p²).
- The lift of π₀A itself is A, so passing to π₀ does not discard the base homotopy.
- For A=0 both étale categories consist of the zero algebra.

**Proof route.** Use vanishing cotangent to lift étale algebras uniquely across Postnikov square-zero layers. Pass to the complete Postnikov tower and compare finite presentation and finiteness on π₀.

*Needs:* §3.4 étale, fppf and fpqc sites of animated rings; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero.

### 3.6 Henselization of an animated ring

Construct the following object and comparisons. For an animated ring A and I⊂π₀A, construct A^h_I as the filtered colimit of the unique étale lifts to A of the pointed étale neighborhoods defining (π₀A)^h_I. Then π₀(A^h_I)≃(π₀A)^h_I and π_i(A^h_I)≃π_iA⊗_(π₀A)(π₀A)^h_I; A→A^h_I is ind-étale. This fixes the notation used by prime-complete descent. (CS24, Proof of Lemma 5.6.5, p.74; §5.2.4, p.54).

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

*Needs:* §3.5 étale algebras see π₀; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`.

### 3.7 Flat cohomology with supports

Construct the following object and comparisons. For an animated R-algebra A, closed Z⊂Spec π₀A and complement U, set RΓ_Z(A,G)=fib(RΓ(A,G)→RΓ(U_A,G)) in D(ℤ). For I⊂π₀A write RΓ_I for the support V(I). The finite-generation hypothesis is imposed by the excision and adic theorems, not by this fibre definition. All pullbacks of supports use the underlying inverse image of closed subsets. (CS24, §5.2.5, p.55 and Corollary 5.3.8, p.62).

The API consists of the following laws and comparisons.

- RΓ_Z(A,G)→RΓ(A,G)→RΓ(U_A,G) is a fibre sequence and yields the support long exact sequence.
- RΓ_∅(A,G)=0.
- RΓ_(Spec π₀A)(A,G)≃RΓ(A,G).
- Ideals with the same vanishing subset give canonically equivalent support complexes.
- A→B gives RΓ_Z(A,G)→RΓ_(Z_B)(B,G), coherent in composites.
- On ordinary rings this recovers fppf local cohomology, not merely coherent Zariski local cohomology.
- For I=(a₁,…,a_r), supports are the total fibre of the cube of localizations at the a_i.

**Checks.**

- RΓ_(1)(A,G)=0, whereas RΓ_(0)(A,G)=RΓ(A,G).
- The supports for (t) and (t²) on 𝔽_p[t] agree.
- For G_a over k[t] with support (t), H¹_(t)=k[t,t⁻¹]/k[t] and H⁰_(t)=0; forgetting the fibre would give k[t].

**Proof route.** Use the open-restriction map in the stable category and form its fibre. Transport the fibre through base change and limits; identify classical support cohomology by ordinary-site comparison.

*Needs:* gap:animated-flat-cohomology; EnhancedDerivedSheaves E1.3.

### 3.8 Fppf hyperdescent and Postnikov convergence

Prove the following statement. For an ordinary ring R and an affine commutative R-group G that is smooth or finite locally free, A↦RΓ_fppf(A,G) satisfies fppf hyperdescent on animated R-algebras and RΓ(A,G)≃Rlim_n RΓ(τ≤n A,G). If G is smooth, RΓ_et(A,G)≃RΓ_fppf(A,G) and the étale evaluation also satisfies fppf hyperdescent. (CS24, Theorem 5.2.6, p.56).

**Checks.**

- For G_a and A=k⊕k[1], RΓ=A and τ≤nA=A for n≥1, so the Postnikov limit retains H^(−1)=k.
- The split cover A→A×A has a split augmented Čech object and totalization RΓ(A,G).
- For G_m over an ordinary ring, the degree-one comparison reads Pic_fppf=Pic_et.

**Proof route.** For smooth groups, use étale lifting and the deformation of points to control Postnikov layers; classical smooth fppf–étale comparison identifies the sites. Quasi-coherent derived module sheaves are hypersheaves; finite cotangent amplitude gives uniform truncation control for Postnikov limits. For finite locally free groups, apply the Bégueri short exact sequence of smooth affine groups and preserve it on the animated fppf site.

*Needs:* gap:animated-flat-cohomology; gap:begueri-resolution; §3.5 étale algebras see π₀; §2.3 amplitude of the group cotangent; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; EnhancedDerivedSheaves E2.3; EnhancedDerivedSheaves E2.7.

### 3.9 Cohomology of increasingly accurate ring towers

Prove the following statement. For G as in fppf-postnikov-hyperdescent and a tower of animated A-algebras A_n with τ≤n A≃τ≤n A_n compatibly, RΓ(A,G)≃Rlim_n RΓ(A_n,G). No completeness for an ideal is assumed; this is increasing Postnikov accuracy. (CS24, Corollary 5.2.7, p.56).

**Checks.**

- For A_n=τ≤nA, the formula is Postnikov convergence. For A=k⊕k[1], its tail is constant A and has H^(−1)(G_a)=k.
- For the constant tower A_n=A, both limits equal RΓ(A,G).
- For A=0 every term of the cohomology tower is 0.

**Proof route.** Compare the two Postnikov-indexed double limits using the uniformly bounded cotangent errors. Apply convergence of each cohomology Postnikov tower and commute limits in D(ℤ).

*Needs:* §3.8 fppf hyperdescent and postnikov convergence; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

### 3.10 Positive cohomology and classical truncation

Prove the following statement. For affine commutative G smooth over R, H^i(A,G)→H^i(π₀A,G) is surjective for all integers i and bijective for i≥0. For finite locally free commutative G it is surjective for all integers i and bijective for i≥1. Degree zero for finite flat G need not be unchanged. (CS24, Corollary 5.2.9, p.57).

**Checks.**

- For G_a and A=k⊕k[1], H^(−1)=k→0 is surjective but not injective; H⁰=k→k is bijective.
- For μ_p and A=𝔽_p⊕𝔽_p[1], the zero-differential two-term cotangent complex gives a nonzero kernel 𝔽_p in H⁰→H⁰(𝔽_p,μ_p)=0.
- For ordinary A, π₀A=A and every comparison map is the identity.

**Proof route.** Apply the deformation triangle to each Postnikov step and use the two cotangent amplitude bounds. Pass to the tower limit with the stronger approximation theorem.

*Needs:* gap:cohomology-deformation; §2.3 amplitude of the group cotangent; §3.9 cohomology of increasingly accurate ring towers.

### 3.11 Cohomology across nil ideals

Prove the following statement. Let I⊂R be an ideal all of whose elements are nilpotent, without a uniform nilpotence bound. For smooth affine commutative G, H^i(R,G)→H^i(R/I,G) is surjective for i≥0 and bijective for i≥1. For commutative finite locally free G it is surjective for i≥1 and bijective for i≥2. (CS24, Corollary 5.2.10, p.57).

**Checks.**

- For μ_p over 𝔽_p[ε]/ε²→𝔽_p, the H¹ kernel contains 1+ε≠1 modulo p-th powers; bijectivity in degree one would fail.
- For G_a over the same rings, H⁰ is 𝔽_p[ε]/ε²→𝔽_p, surjective with kernel ε𝔽_p, while all positive affine cohomology vanishes.
- For I=0 all comparison maps are identities.

**Proof route.** First treat a square-zero ideal with the deformation triangle. Finite-generation approximation makes the nil ideal nilpotent at each Noetherian stage; iterate square-zero steps and pass through filtered colimits.

*Needs:* gap:cohomology-deformation; §2.3 amplitude of the group cotangent; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent.

### 3.12 Fppf supports in étale neighborhoods

Prove the following statement. For an ordinary ring C, finite locally free commutative G, a finitely generated ideal J and C→D an étale neighborhood inducing V(J)≃V(JD), restriction RΓ_J(C,G)→RΓ_J(D,G) is an equivalence. The same holds for C→C^h_J. This is the classical neighborhood-excision input needed before general derived excision is proved. (CS24, Claim 5.3.5.3 and footnote 24, p.59).

**Checks.**

- For J=(1), both support complexes are 0.
- For C→C the map on support cohomology is the identity.
- For C=Z, J=(p), localization at 1+p is an étale neighborhood since it reduces to 1 modulo p; p-supported cohomology is unchanged.

**Proof route.** Use the morphism from the fppf topos to the small étale topos: étale neighborhood restriction preserves the local support fibre. Verify the degree-zero support assertion for a sheaf, then dimension-shift an injective resolution. Pass to the filtered system of pointed étale neighborhoods for henselization using finite-presentation continuity.

*Needs:* §3.7 flat cohomology with supports; SchemeAndStackFoundations Layer 2 §§2.1–2.6; §3.5 étale algebras see π₀; SchemeAndStackFoundations §2.1; SchemeAndStackFoundations §0.12; gap:flat-cohomology-continuity; gap:torsor-limit-descent.

### Examples

For G_a over k[t], H⁰_(t)=0 and H¹_(t)=k[t,t⁻¹]/k[t]. Replacing t by t² leaves both groups unchanged. For k⊕k[1], the additive cohomology retains H^(−1)=k.

### Dependencies

EnhancedDerivedSheaves E5:animation.4 `animatedModules`; `Module.FaithfullyFlat`; EnhancedDerivedSheaves E5:cotangent-export.1; gap:general-square-zero; `AlgebraicGeometry.Scheme.fppfTopology`; `AlgebraicGeometry.Scheme.fpqcTopology`; `TauCeti.CommAlgCat.fppfTopology`; EnhancedDerivedSheaves E5:cotangent-export.1 `cotangentComplex`; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`; gap:animated-flat-cohomology; EnhancedDerivedSheaves E1.3; gap:begueri-resolution; §2.3 amplitude of the group cotangent; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; EnhancedDerivedSheaves E2.3; EnhancedDerivedSheaves E2.7; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`; gap:cohomology-deformation; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent; SchemeAndStackFoundations §2.1.

## Layer 4: Perfect-base affine vanishing

The perfect-base classification and comparison triangle are imported from PrismaticCohomologyPartIII §6.0; this layer proves their affine cohomological-dimension consequence.

### 4.1 Higher vanishing over perfect affine rings

Prove the following statement. For a perfect 𝔽_p-algebra S and a commutative finite locally free S-group G of p-power order, H^i_fppf(S,G)=0 for i≥2. (CS24, Corollary 4.1.9, p.38).

**Checks.**

- For G=ℤ/p over 𝔽_p, V−1=0 on 𝔽_p, so H⁰=H¹=𝔽_p but H^i=0 for i≥2. Ordinary fixed points would lose H¹.
- For μ_p over 𝔽_p, V−1=−1, giving zero cohomology in every degree.
- For α_p over a perfect 𝔽_p-algebra, Frobenius is bijective on the additive sequence and cohomology is 0.

**Proof route.** On affine W_n(S), quasi-coherent M has no positive cohomology. The mapping fibre of V−1 therefore occupies degrees zero and one.

*Needs:* PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`.

### Examples

For ℤ/p over 𝔽_p, V−1=0 gives H⁰=H¹=𝔽_p and no higher cohomology; for μ_p and α_p every group is 0. These are the covariant normalization tests of PrismaticCohomologyPartIII §6.0.

### Dependencies

PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`.

## Layer 5: Prime-complete comparisons

### 5.1 Ind-fppf refinements splitting all covers

Prove the following statement. For any ring R there is an ind-fppf faithfully flat R-algebra R̃ such that every faithfully flat finitely presented R̃-algebra admits an R̃-algebra retraction. If I⊂Jac(R), R̃ may be chosen so (R̃,IR̃) is henselian. Each such R̃ has no higher fppf cohomology for any abelian sheaf; the henselian refinement remains ind-fppf. (CS24, Lemma 5.3.1 and Remark 5.3.2, p.58).

**Checks.**

- An algebraically closed field has split nonempty finitely presented covers and no higher fppf cohomology.
- Over nonzero R a faithfully flat refinement has nonzero target, since otherwise its tensor kills R.
- The zero ring is its own refinement, with all cohomology 0.

**Proof route.** Choose a set of all finitely presented faithfully flat R-algebras and tensor over its finite subsets, ensuring each cover obtains a section after base change. Iterate this operation countably; insert I-henselization at each step when I⊂Jac(R). Descend any finite-presentation cover of the final colimit to a finite step; its chosen factor at the next step provides a section. Exactness of evaluation follows from splitting covers, hence vanishing of higher derived evaluation.

*Needs:* §0.1 ind-fppf ring maps; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent.

### 5.2 Derived Beauville–Laszlo glueing

Prove the following statement. For A→A′ of animated rings and a∈π₀A, if A/^La→A′/^La is an equivalence then A→A′×^h_(A′[1/a]) A[1/a] is an equivalence, also after passage to underlying D(ℤ)-objects. No nonzerodivisor or bounded-torsion assumption is imposed. (CS24, Lemma 5.3.3, p.58).

**Checks.**

- For ℤ→ℤ_p at p, the square ℤ→ℤ_p×_(Q_p)Z[1/p] is cartesian: ℤ_p∩Z[1/p]=Z and ℤ_p+Z[1/p]=Q_p.
- If a=1, both localizations are the rings themselves and the square is cartesian.
- If a=0, the derived residue hypothesis forces A→A′ to be an equivalence; it does not follow merely from equality of π₀.

**Proof route.** Apply the derived quotient and localization functors to the fibre of the comparison map. It is both uniquely a-divisible and a-power torsion, so vanishes. Use that limits of animated rings are computed on their underlying animated modules.

*Needs:* gap:animated-flat-cohomology; EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; DerivedModuleAlgebra §§1.2–1.4.

### 5.3 The square-zero defect of completed π₀

Prove the following statement. For animated A and a∈π₀A, the map π₀(Rlim_n A/^La^n)→lim_n π₀(A)/a^n is surjective with kernel lim¹_n π₁(A/^La^n). This kernel is square-zero. (CS24, Lemma 5.3.4, p.58).

**Checks.**

- For A=Z and a=p, π₁(A/^Lp^n)=0, so completed π₀=lim ℤ/p^n=ℤ_p with kernel 0.
- For A=ℤ/p² the π₁ tower has transitions multiplication by p and is eventually zero on every fixed level; lim¹=0 and completed π₀=ℤ/p².
- For a=1 all quotients and both sides are 0.

**Proof route.** Use the tower Milnor sequence and π₀(A/^La^n)=π₀A/a^n. Multiplication of two lim¹ classes lands in lim², which is zero for a sequential tower.

*Needs:* §5.2 derived beauville–laszlo glueing; DerivedModuleAlgebra §1.6; EnhancedDerivedSheaves E2:towers.1.

### 5.4 Cohomological dimension in the primary case

Prove the following statement. Fix a prime p, an ordinary ring R, a commutative finite locally free R-group G of p-power order, and an animated R-algebra A with (π₀A,pπ₀A) henselian. Then H^i(A,G)=0 for i≥3. If (π₀A/p)^red is perfect, H^i(A,G)=0 for i≥2. (CS24, Corollary 5.3.7, p.61).

**Checks.**

- For ℤ_p and μ_p with p odd, H¹=ℤ_p^×/(ℤ_p^×)^p≃ℤ/p and H^i=0 for i≥2; the perfect reduced residue gives the stronger bound.
- For 𝔽_p and ℤ/p, H¹=𝔽_p and H²=0, so the bound does not assert H¹ vanishing.
- For A=0 all groups vanish.

**Proof route.** Reduce through the derived quotient tower to characteristic p using the deformation triangle. For ε from the fppf to the étale site, the Bégueri sequence and smooth comparison give R^jε_*G=0 for j≥2. The remaining sheaves are p-primary; affine p-primary étale cohomology has dimension at most one. Leray therefore gives fppf vanishing in degrees ≥3. For a perfect reduced special fibre use the perfect-base vanishing and nil invariance. Use the Mittag–Leffler control from continuity to avoid an extra lim¹ degree.

*Needs:* PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §4.1 higher vanishing over perfect affine rings; §3.11 cohomology across nil ideals; SchemeAndStackFoundations Layer 2 §§2.1–2.6; EnhancedDerivedSheaves E2:towers.1; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; gap:begueri-resolution; gap:char-p-etale-dimension.

### 5.5 Primary invariance under derived completion

Prove the following statement. Let A→A′ be animated R-algebras with π₀A and π₀A′ p-henselian and A/^Lp≃A′/^Lp. For commutative finite locally free p-primary G/R and every open U⊂Spec π₀A containing D(p), restriction induces equivalences on RΓ(U_A,G) and on RΓ_Z(A,G), Z=Spec π₀A minus U. In particular RΓ(A,G)≃RΓ(A′,G). (CS24, Corollary 5.3.8, pp.61–62).

**Checks.**

- For A=A′ the comparisons on every indicated open and support are identities.
- For A=ℤ_p and A′=ℤ_p×Q_p, derived reductions modulo p agree, but π₀A′ is not p-henselian; the generic-fibre doubling is excluded.
- For A=𝔽_p and U=D(p)=∅, open cohomology is 0 and supported cohomology is full cohomology.

**Proof route.** Continuity identifies cohomology on the two rings from the identical derived quotients. Use the punctured formal-glueing comparison and étale primary coefficients on D(p). Apply the support fibre sequence for the indicated open.

*Needs:* PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §5.2 derived beauville–laszlo glueing; §3.7 flat cohomology with supports; gap:torsion-arc-hyperdescent; gap:complete-etale-hyperdescent.

### Examples

For ℤ_p and μ_p with p odd, H¹=ℤ_p^×/(ℤ_p^×)^p=ℤ/p, while the perfect reduced residue gives H^i=0 for i≥2. At p=2, H¹(ℤ₂,μ₂)=(ℤ/2)², represented by the unit classes −1 and 5. At p=3, H¹(ℤ₃,μ₃)=ℤ/3; the theorem includes both primes.

### Dependencies

§0.1 ind-fppf ring maps; SchemeAndStackFoundations §0.12; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent; gap:animated-flat-cohomology; EnhancedDerivedSheaves E5:animation.1 `animatedAlgebras`; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §1.6; EnhancedDerivedSheaves E2:towers.1; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §4.1 higher vanishing over perfect affine rings; §3.11 cohomology across nil ideals; SchemeAndStackFoundations §2.2; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; gap:begueri-resolution; gap:char-p-etale-dimension; §3.7 flat cohomology with supports; gap:torsion-arc-hyperdescent; gap:complete-etale-hyperdescent.

## Layer 6: Derived excision with supports

### 6.1 Perfection across an unchanged derived divisor

Prove the following statement. Suppose A→A′ are ordinary 𝔽_p-algebras, A perfect and A′ semiperfect. If A/^La≃A′/^La for a∈A, then the kernel of A′→(A′)^perf is uniquely a-divisible, and A/^La≃(A′)^perf/^La. (CS24, Lemma 5.4.1, pp.62–63).

**Checks.**

- For A=A′ perfect the kernel of A′→(A′)^perf is 0, hence uniquely a-divisible.
- For A=𝔽_p and A′=𝔽_p[t^(1/p^∞)]/(t), a=1, the kernel contains t^(1/p) but multiplication by a is the identity and both derived quotients are 0.
- For a=0, equivalence of derived residues forces A≃A′, so the nilpotent kernel vanishes.

**Proof route.** Semiperfection makes the perfection map surjective with nil kernel. Use the derived quotient hypothesis to identify annihilator groups and show multiplication by a is bijective on the kernel. The zero kernel modulo a and its zero derived a-torsion identify the derived quotients.

*Needs:* gap:perfection-covers; EnhancedDerivedSheaves E5:animation.2.

### 6.2 The derived residue condition

Define the following predicate or object. For A→B animated rings and a finitely generated ideal I⊂π₀A, say the derived residue condition holds if π₀A/I→(π₀A/I)⊗^L_A B is an equivalence. For any chosen finite generators a₁,…,a_r it is equivalent to A/^L(a₁,…,a_r)≃B/^L(a₁,…,a_r), and to equivalence of their iterated derived a_i-completions. The original definition makes independence of generators explicit. (CS24, Lemma 5.4.3, p.67).

The API consists of the following laws and comparisons.

- The identity A→A satisfies the condition for every finite I.
- For each finite generating tuple, the corresponding derived Koszul quotients are equivalent.
- The iterated generator-adic derived completions are equivalent.
- Changing the finite generating tuple preserves the predicate.
- Derived base change transports the residue equivalence to the image ideal.
- For I=(1) the condition holds for every map, since the residue and support vanish.

**Checks.**

- Z→ℤ_p satisfies it for I=(p), since flatness identifies all finite p-power quotients.
- ℤ/p²→𝔽_p has identical ordinary residue modulo p but fails the condition: 𝔽_p⊗^L_(ℤ/p²) 𝔽_p has nonzero Tor₁.
- For I=(1), ℤ→𝔽_p satisfies the condition despite not being an equivalence of rings.
- A→A satisfies it even for A=k⊕k[1] and I=(0).

**Proof route.** Compare the residue tensor with the Koszul object by successive connective derived Nakayama. Use derived completion and its Koszul reductions to prove the second equivalence.

*Needs:* §3.1 flat animated modules and maps; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §1.4.

### 6.3 Finite-ideal derived excision

Prove the following statement. For animated R-algebras A→A′, finite I⊂π₀A, and commutative finite locally free G/R, the derived residue condition implies RΓ_I(A,G)≃RΓ_I(A′,G). In particular support cohomology is invariant under iterated derived completion along a finite generating tuple. (CS24, Theorem 5.4.4, pp.67–68).

**Checks.**

- For I=(1), both supported complexes are 0 even for ℤ→𝔽_p.
- For I=(0), the derived residue condition forces equivalence of the rings, and support is full cohomology.
- For ℤ→ℤ_p and I=(p), flatness gives 𝔽_p⊗^L_Zℤ_p=𝔽_p, so p-supported cohomology agrees.

**Proof route.** Use the completion characterization to replace both rings by their equivalent iterated completions. Apply principal excision successively to the finite localization cube computing support in the common zero locus. Check the construction is independent of generator order by the residue formulation.

*Needs:* §6.2 the derived residue condition; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §3.7 flat cohomology with supports; DerivedModuleAlgebra §1.6.

### 6.4 Local cohomology and Noetherian completion

Prove the following statement. For a Noetherian local ring (R,m), its m-adic completion R̂, and commutative finite locally free G/R, H^i_m(R,G)≃H^i_(mR̂)(R̂,G) for every integer i. (CS24, Corollary 5.4.5, p.68).

**Checks.**

- For R=Z_(p), its completion is ℤ_p and 𝔽_p⊗^L_Rℤ_p=𝔽_p, giving the required derived residue.
- For a field R with m=0, completion is R and the comparison is the identity on full cohomology.
- For the zero coefficient group every support group is 0 in every integer degree.

**Proof route.** Noetherian completion is flat and has the same finite residue quotients. Its derived residue tensor is R/m, so apply finite-ideal excision.

*Needs:* §6.3 finite-ideal derived excision; SchemeAndStackFoundations §0.9; DerivedModuleAlgebra §1.5; SchemeAndStackFoundations Layer 0 §§0.9, 0.12, 0.14; gap:noetherian-completion-flat; `AdicCompletion.flat_of_isNoetherian`.

### Examples

The map ℤ→ℤ_p has 𝔽_p⊗^L_ℤℤ_p=𝔽_p. The map ℤ/p²→𝔽_p instead has Tor₁(𝔽_p,𝔽_p)=𝔽_p, so equality of ordinary residues does not imply derived excision.

### Dependencies

gap:perfection-covers; EnhancedDerivedSheaves E5:animation.2; §3.1 flat animated modules and maps; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §1.4; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §3.7 flat cohomology with supports; SchemeAndStackFoundations §0.9; DerivedModuleAlgebra §1.5; SchemeAndStackFoundations Layer 0 §§0.9, 0.12, 0.14; gap:noetherian-completion-flat; `AdicCompletion.flat_of_isNoetherian`.

## Layer 7: Faithfully flat hyperdescent

### 7.1 Fpqc hyperdescent of flat cohomology

Prove the following statement. For ordinary R and commutative finite locally free G/R, A↦RΓ_fppf(A,G) on animated R-algebras is a hypercomplete sheaf for faithfully flat covers. In particular for every fpqc hypercover A→A^•, RΓ(A,G)≃Rlim_Δ RΓ(A^•,G). (CS24, Theorem 5.5.2, pp.69–70).

**Checks.**

- For the split fpqc cover A→A×A, the augmented complex contracts to RΓ(A,G).
- For A=0 every hypercover term and both sides are 0.
- For the identity hypercover on 𝔽_p and G=ℤ/p, both sides retain H¹=𝔽_p.

**Proof route.** Split into primary coefficients. Primary continuity and punctured étale formal glueing reduce the question to derived characteristic-p quotients. Use the deformation triangle and Postnikov convergence to reduce to ordinary characteristic-p algebras. Ind-fppf semiperfect refinements, followed by nilpotent approximation, reduce to perfect algebras. Use the perfect-base V−1 formula: Witt-module faithful-flat hyperdescent and its finite Tor-amplitude Dieudonné coefficients compute the limit.

*Needs:* §3.8 fppf hyperdescent and postnikov convergence; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:cohomology-deformation; §3.11 cohomology across nil ideals; gap:perfection-covers; §3.7 flat cohomology with supports; gap:torsion-arc-hyperdescent; gap:formal-glueing; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent; EnhancedDerivedSheaves E5:animation.2.

### 7.2 Primary descent modulo p

Prove the following statement. For p-primary commutative finite locally free G/R, A↦RΓ(A^h_(p),G) satisfies hyperdescent for maps whose derived reduction modulo p is faithfully flat. For closed Z⊂Spec R/p, A↦RΓ_(Z_A)(A,G) satisfies the same hyperdescent. No p-completeness is imposed on A. (CS24, Corollary 5.5.3, p.70).

**Checks.**

- For A=𝔽_p, the p-henselization is A, and the identity hypercover retains H¹(𝔽_p,ℤ/p)=𝔽_p.
- For A=Q_p and Z⊂V(p)=∅, supported cohomology is 0.
- The map ℤ_p→𝔽_p is excluded: its derived reduction has Tor₁=𝔽_p and is not flat over 𝔽_p.

**Proof route.** Apply primary continuity to the p-henselization and to every hypercover term. A faithful-flat derived mod-p hypercover remains so modulo p^n by the nilpotent-flatness test. Commute the quotient-tower limit with hypercover totalization; recover supports by primary excision.

*Needs:* §7.1 fpqc hyperdescent of flat cohomology; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §3.6 henselization of an animated ring; §5.5 primary invariance under derived completion; §3.7 flat cohomology with supports; §3.3 flatness after a nilpotent thickening.

### Examples

The split faithfully flat cover A→A×A has a contracting augmented Čech diagram. Its totalization recovers RΓ(A,G), including H¹(𝔽_p,ℤ/p)=𝔽_p for the identity hypercover.

### Dependencies

§3.8 fppf hyperdescent and postnikov convergence; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:cohomology-deformation; §3.11 cohomology across nil ideals; gap:perfection-covers; §3.7 flat cohomology with supports; gap:torsion-arc-hyperdescent; gap:formal-glueing; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:flat-cohomology-continuity; gap:torsor-limit-descent; EnhancedDerivedSheaves E5:animation.2; §3.6 henselization of an animated ring; §5.5 primary invariance under derived completion; §3.3 flatness after a nilpotent thickening.

## Layer 8: Complete continuity

### 8.1 Derived completeness implies henselianity

Prove the following statement. For an animated ring A and an ideal I⊂π₀A, if A is derived a-complete for every a∈I, then (π₀A,I) is henselian. In particular finite-ideal derived completeness has this consequence; π₀A need not be classically I-complete. (CS24, Lemma 5.6.2, p.71).

**Checks.**

- For A=ℤ_p and I=(p), the pair is henselian with π₀A=ℤ_p.
- For A=𝔽_p⊕𝔽_p[1] and I=0, derived completeness is automatic and the pair is henselian despite higher homotopy.
- For Z and I=(p), p-completion is ℤ_p≠Z, and p is not in Jac(Z)=0; the hypothesis fails.

**Proof route.** Derived completeness is detected on homotopy groups and is preserved by truncation. Replace A by π₀A. For principal a, the completed-π₀ theorem then compares this ring to its ordinary a-completion with square-zero kernel. A classically complete ring is henselian, and henselianity lifts across a nil ideal. Apply the elementwise characterization of henselian pairs to all a∈I.

*Needs:* §5.3 the square-zero defect of completed π₀; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`.

### 8.2 H² invariance over a henselian pair

Prove the following statement. For any henselian pair (R,I) and commutative finite locally free R-group G, H²_fppf(R,G)→H²_fppf(R/I,G) is an isomorphism. This independent low-degree lemma precedes the general henselian-invariance theorem. (CS24, Lemma 5.6.3, p.71).

**Checks.**

- For ℤ_p and μ_p, H²=Br(ℤ_p)[p]=0=H²(𝔽_p,μ_p), while H¹(ℤ_p,μ_p)≃ℤ/p for p odd.
- For (R,0) the comparison is the identity.
- For R=C[[t]] and μ_n, Pic=0 and Br=0 on both sides, so both H² groups are 0.

**Proof route.** The supplier henselian torsor/gerbe lifting theorem gives injectivity for finite flat G. The smooth resolution reduces surjectivity to smooth affine groups and then Weil restrictions of G_m. For the G_m term, the relevant torsion H² classes are Azumaya classes by affine Gabber, so lift them through the PGL_n torsor description and henselian smooth torsor lifting. Use the exact coefficient sequence to recover surjectivity for G.

*Needs:* gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology.

### 8.3 Continuity with a cohomological bound

Prove the following statement. Let A be a derived a-complete animated R-algebra, and G a commutative finite locally free R-group. If H^i(A,G)=H^i(A/^La,G)=0 for i≥3, then RΓ(A,G)≃Rlim_(n>0)RΓ(A/^La^n,G). (CS24, Lemma 5.6.4, pp.72–73).

**Checks.**

- For A=ℤ_p, a=p and G=μ_p, the dimension hypotheses hold and H¹ is the unit quotient ℤ/p for p odd.
- For a=1, derived a-completeness forces A=0 and both sides vanish.
- For the zero coefficient group both complexes vanish for every derived a-complete A.

**Proof route.** Use the bounds to reduce continuity to H⁰, H¹, H² and the low-degree tower Milnor sequence. The henselian H² lemma identifies the degree-two systems. Classical complete torsor effectivity and control of the automorphism tower handle H¹; affine point evaluation handles nonpositive degrees. The deformation triangle controls the square-zero completion defect and the animated Postnikov error.

*Needs:* §8.2 h² invariance over a henselian pair; §8.1 derived completeness implies henselianity; gap:cohomology-deformation; §2.3 amplitude of the group cotangent; §5.3 the square-zero defect of completed π₀; §3.9 cohomology of increasingly accurate ring towers; SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity.

### 8.4 Faithfully flat descent after principal completion

Prove the following statement. Fix an ordinary ring R, a commutative finite locally free R-group G, an animated R-algebra A and a∈π₀A. If A→A^• is a cosimplicial animated A-algebra, A and every A^j are derived a-complete, and A/^La→A^•/^La is a faithfully flat hypercover, then RΓ(A,G)→Rlim_Δ RΓ(A^•,G) is an equivalence. (CS24, Lemma 5.6.5, pp.74–75).

**Checks.**

- For R=Z, A=Z[[t]] and a=t, the identity cosimplicial A-algebra satisfies the statement directly; t need not come from R.
- For a=p coming from R=Z and A=ℤ_p, the split cover A→A×A has a contracting Čech object and recovers RΓ(A,G).
- For a=1 derived completeness forces every ring to be 0, hence both cohomology complexes are 0.

**Proof route.** Separate primary coefficients and the locus where that prime is invertible. For the primary piece, use prime continuity and the restricted complete-continuity lemma, whose required dimension bound holds in characteristic p. Compare the error with the étale extension by zero j_!G from the prime-invertible locus, using excision and henselian étale proper base change. Étale complete-arc hyperdescent handles that error. This order uses no general complete-continuity theorem.

*Needs:* §8.3 continuity with a cohomological bound; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §5.4 cohomological dimension in the primary case; §7.1 fpqc hyperdescent of flat cohomology; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §3.6 henselization of an animated ring; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; gap:complete-etale-hyperdescent.

### 8.5 Continuity over complete animated rings

Prove the following statement. For animated R-algebra A derived I-complete with I=(a₁,…,a_r)⊂π₀A finite, and commutative finite locally free G/R, RΓ(A,G)≃Rlim_(n>0)RΓ(A/^L(a₁^n,…,a_r^n),G). The quotients are the animated Koszul quotients; they cannot in general be replaced termwise by ordinary quotients. (CS24, Theorem 5.6.6, p.75).

**Checks.**

- For the empty tuple, I=0 and every quotient is A, so the limit is the constant RΓ(A,G).
- For A=ℤ_p, I=(p), G=μ_p and p odd, H¹=ℤ/p agrees with the inverse-limit unit quotient.
- For A=ℤ/p² the derived quotient by p has π₀=π₁=𝔽_p; replacing the tower by ordinary quotients termwise loses π₁.

**Proof route.** Treat one generator. Construct an ind-fppf split-cover hypercover, take derived a-completions, and use the square-zero defect of completed π₀ to see that the terms and their derived quotients have no nonsplit étale covers. The smooth resolution kills H^j for j≥2, so restricted continuity applies. Use the preceding complete-descent theorem to pass from that cover back to A. Iterate generatorwise; commute the resulting finite family of sequential limits and use the diagonal cofinal system.

*Needs:* §8.4 faithfully flat descent after principal completion; §8.3 continuity with a cohomological bound; §8.2 h² invariance over a henselian pair; gap:cohomology-deformation; §3.8 fppf hyperdescent and postnikov convergence; DerivedModuleAlgebra §1.6; §5.1 ind-fppf refinements splitting all covers; §5.3 the square-zero defect of completed π₀; gap:begueri-resolution; §3.5 étale algebras see π₀.

### 8.6 Comparison with ordinary quotient cohomology

Prove the following statement. Let an ordinary ring R be derived I-complete for finite I, and G finite locally free commutative over R. Then H^i(R,G)→H^i(R/I,G) is surjective for i≥1 and bijective for i≥2. There is an exact sequence 0→lim¹_n H⁰(R/^L(a₁^n,…,a_r^n),G)→H¹(R,G)→lim_n H¹(R/I^n,G)→0 for any finite generating tuple a of I. If R is also classically I-complete, the lim¹ term is lim¹_n G(R/I^n). (CS24, Example 5.6.7, pp.75–76).

**Checks.**

- For ℤ_p and μ_p with p odd, H¹=ℤ/p→H¹(𝔽_p,μ_p)=0 is surjective, not injective.
- In that example μ_p(ℤ/p^n) has eventually zero transitions towards each fixed level, hence lim¹=0 and the inverse-limit H¹ is ℤ/p.
- For I=0 the tower is constant and lim¹=0.

**Proof route.** Take the tower Milnor exact sequence of the derived continuity formula. Use positive-degree truncation comparison and nil-invariance to identify the quotient cohomology groups. Use cofinality of the tuple-power ideals with I^n, keeping the derived point group in the degree-one kernel.

*Needs:* §8.5 continuity over complete animated rings; §3.10 positive cohomology and classical truncation; §3.11 cohomology across nil ideals; EnhancedDerivedSheaves E2:towers.1.

### 8.7 Why henselianity does not give full continuity

Prove the following statement. For the henselization R=𝔽_p{t} of (𝔽_p[t],(t)), the map H¹(R,μ_p)→H¹(𝔽_p[[t]],μ_p) is not an isomorphism. The source is countable and the target is uncountable, as follows from units modulo p-th powers. Thus the complete-ring comparison cannot be extended to every henselian ring in degree one. (CS24, Remark 5.6.8, p.76).

**Checks.**

- For R=𝔽_p{t}, Pic(R)=0 and H¹(R,μ_p)=R^×/(R^×)^p is countable.
- For 𝔽_p[[t]], units 1+t·h(t^p) give distinct classes for uncountably many h: a ratio that is a p-th power lies in 𝔽_p[[t^p]], forcing the two h equal.
- Both rings have H²(μ_p)=Br[p]=0; the degree-one failure is consistent with H² invariance.

**Proof route.** The henselization of the countable finitely presented ring is countable. In 𝔽_p[[t]] the p-th-power units have exponents divisible by p; independent infinitely many remaining coefficients give uncountably many quotient classes. Both local rings have zero Picard group, so the Kummer sequence identifies H¹ with units modulo p-th powers.

*Needs:* §8.6 comparison with ordinary quotient cohomology; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; SchemeAndStackFoundations §0.12.

### Examples

Over ℤ[[t]], t lies in π₀ of the animated ℤ-algebra without lying in the base ℤ. Principal complete descent applies directly. For an empty generating tuple, complete continuity is the constant A-system.

### Dependencies

§5.3 the square-zero defect of completed π₀; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`; gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; gap:cohomology-deformation; §2.3 amplitude of the group cotangent; §3.9 cohomology of increasingly accurate ring towers; SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; §5.4 cohomological dimension in the primary case; §7.1 fpqc hyperdescent of flat cohomology; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; §3.6 henselization of an animated ring; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; gap:complete-etale-hyperdescent; §3.8 fppf hyperdescent and postnikov convergence; §5.1 ind-fppf refinements splitting all covers; §3.5 étale algebras see π₀; §3.10 positive cohomology and classical truncation; §3.11 cohomology across nil ideals; SchemeAndStackFoundations §0.12.

## Layer 9: Henselian invariance and algebraization

### 9.1 Finitary functors and henselian completion

Prove the following statement. For a Noetherian henselian pair (A,I) whose completion map A→Â has geometrically regular fibres, and a set-valued functor F on A-algebras commuting with filtered colimits, F(A)→F(Â) is injective. An element of F(A/I) lifts to F(A) if and only if it lifts to F(Â). (BC22, Lemma 2.1.3, pp.6–7).

**Checks.**

- For (A,I)=(Z_(p)^h,(p)) and F(C)=C, A→ℤ_p is injective; the residue 1∈𝔽_p lifts to 1 in both rings.
- For I=0, Â=A and every comparison is the identity.
- For F the constant two-element set, F(A)→F(Â) is the identity and exactly the same residue elements lift on either side.

**Proof route.** Write Â as a filtered colimit of smooth A-algebras by Popescu. Each stage has an A/I-point inherited from Â; henselian smooth lifting gives an A-retraction. Descend a proposed equality or lift to one smooth stage and apply its retraction.

*Needs:* SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`.

### 9.2 Flat cohomology over henselian pairs

Prove the following statement. For a henselian pair (R,I) and commutative finite locally free R-group G, H^i(R,G)→H^i(R/I,G) is surjective for i≥1 and bijective for i≥2. R and I may be non-Noetherian and I need not be finitely generated. (CS24, Corollary 5.6.9, p.76).

**Checks.**

- For (Z_(p)^h,p) and μ_p with p odd, H¹≃ℤ/p maps onto 0 on 𝔽_p, so bijectivity cannot be demanded in degree one.
- For the same pair, H²(μ_p)=0 on both sides.
- For I=0 the comparison is the identity in every degree.

**Proof route.** Use varying-base continuity to reduce to the henselization of a finite-type ℤ-algebra along a finite ideal; gap:henselized-formal-fibres gives the geometrically regular completion map. Apply the finitary-functor completion comparison of §9.1, proved from Popescu and henselian smooth lifting, to the cohomology functor. Use complete continuity and the independent H² lemma. Descend and lift the finite data, then pass through filtered colimits; retain surjectivity only in degree one.

*Needs:* §8.6 comparison with ordinary quotient cohomology; §8.2 h² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; §9.1 finitary functors and henselian completion; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; gap:flat-cohomology-continuity; gap:torsor-limit-descent.

### 9.3 Algebraization over a topological ring

Prove the following statement. Let B be a topological ring with an open nonunital henselian subring B′ and a basis of zero consisting of B′-ideals. For its separated completion B̂ and every commutative finite locally free B-group G, H^i(B,G)≃H^i(B̂,G) for i≥2. No first-countability or Noetherian condition is imposed. (CS24, Corollary 5.6.10, p.76).

**Checks.**

- For B=𝔽_p{t} with its t-adic topology, B̂=𝔽_p[[t]] and both H²(μ_p)=0.
- For a discrete topological ring B, B̂=B and every high-degree comparison is the identity.
- The preceding noncomplete example has countable versus uncountable H¹(μ_p), so a degree-one extension would fail.

**Proof route.** Apply the Cauchy-net algebraization criterion to the functor C↦H^i(C,G), i≥2. Its finitary property is the varying-base cohomology-limit theorem; invariance on henselian pairs is the preceding henselian-invariance theorem. Retain the nonunital subring hypothesis via its Dorroh unitalization, which has its actual ring multiplication.

*Needs:* §9.2 flat cohomology over henselian pairs; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; gap:cauchy-algebraization; gap:flat-cohomology-continuity; gap:torsor-limit-descent.

### 9.4 Algebraization on a Laurent puncture

Prove the following statement. For any ring R, let R{t} be the t-henselization of R[t]. For a commutative finite locally free group G over R{t}[1/t], the natural map H^i(R{t}[1/t],G)→H^i(R((t)),G) is an isomorphism for i≥2. (CS24, Example 5.6.11, p.77).

**Checks.**

- For R=𝔽_p and G=μ_p, Br(𝔽_p{t}[1/t])[p]=ℤ/p=Br(𝔽_p((t)))[p], giving H²=ℤ/p.
- For the same fields the unit quotients in H¹(μ_p) are respectively countable and uncountable, so i≥2 is essential.
- For the trivial group both sides vanish in every degree.

**Proof route.** Use the t-adic topological ring B=R{t}[1/t] and open nonunital subring tR{t}. Its completion is R[[t]][1/t]=R((t)); apply topological algebraization.

*Needs:* §9.3 algebraization over a topological ring; SchemeAndStackFoundations §0.12.

### 9.5 Henselian comparison on punctured animated rings

Prove the following statement. Let A→A′ be animated R-algebras and I⊂π₀A finite. Suppose π₀A and π₀A′ are henselian for I and its image, and π₀A/I≃(π₀A/I)⊗^L_A A′. For U=Spec π₀A minus V(I) and commutative finite locally free G/R, H^i(U_A,G)≃H^i(U_(A′),G) for i≥2. (CS24, Corollary 5.6.12, pp.76–77).

**Checks.**

- For Z_(p)^h→ℤ_p and I=(p), the generic fields have H²(μ_p)=Br[p]=ℤ/p on both sides.
- For I=(0) the derived residue condition forces A≃A′, and the punctured open is empty.
- For I=(1), henselianity forces the zero ring and both groups are 0.

**Proof route.** Compare the two support localization triangles. The support terms are equivalent by derived excision and the affine high-degree terms by henselian invariance and truncation comparison. Use the long exact sequences, including degree-two injectivity, to identify the punctured terms.

*Needs:* §6.3 finite-ideal derived excision; §9.2 flat cohomology over henselian pairs; §3.10 positive cohomology and classical truncation; §3.7 flat cohomology with supports; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`.

### 9.6 Comparison on Noetherian open neighborhoods

Prove the following statement. Let R→R′ be Noetherian rings, I⊂R an ideal, and both (R,I) and (R′,IR′) henselian. Suppose R/I^n≃R′/I^nR′ for every n>0. For every open U⊂Spec R containing Spec R minus V(I) and every finite locally free commutative R-group G, H^i(U,G)≃H^i(U×_R R′,G) for i≥2. (CS24, Corollary 5.6.13, p.77).

**Checks.**

- For Z_(p)^h→ℤ_p and U=D(p), the comparison is ℤ/p→ℤ/p on H²(μ_p).
- For R→R the hypothesis on every quotient holds and the map is the identity for any allowed U.
- For I=0 the equality of quotients already forces R≃R′; no flatness hypothesis has been inserted.

**Proof route.** Use Noetherian formal comparison and excision to compare supports on the complement of U. Use henselian invariance for the affine ambient terms. Use the independent punctured H² injectivity input for the boundary of the long exact sequence; higher degrees then follow.

*Needs:* §9.5 henselian comparison on punctured animated rings; §9.2 flat cohomology over henselian pairs; §8.5 continuity over complete animated rings; §3.7 flat cohomology with supports; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; §6.3 finite-ideal derived excision; gap:punctured-h2-injectivity.

### Examples

The henselian map ℤ_(p)^h→ℤ_p compares the generic-field groups H²(μ_p)=ℤ/p. In equal characteristic, 𝔽_p{t} has countably many unit classes modulo p-th powers while 𝔽_p[[t]] has uncountably many, so the degree-one completion comparison fails.

### Dependencies

SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`; §8.6 comparison with ordinary quotient cohomology; §8.2 h² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; gap:flat-cohomology-continuity; gap:torsor-limit-descent; SchemeAndStackFoundations Layer 4; gap:cauchy-algebraization; SchemeAndStackFoundations §0.12; §6.3 finite-ideal derived excision; §3.10 positive cohomology and classical truncation; §3.7 flat cohomology with supports; §8.5 continuity over complete animated rings; gap:punctured-h2-injectivity.

## Layer 10: Adic descent with supports

### 10.1 Discreteness of completely flat perfectoid modules

Prove the following statement. Let A be an integral perfectoid ring, derived complete for I=(a₁,…,a_r), and M a connective derived I-complete animated A-module. If M/^L(a₁^n,…,a_r^n) is flat over A/^L(a₁^n,…,a_r^n) for all n>0, then M is discrete. The conclusion is not ordinary flatness of M over an arbitrary non-Noetherian A. (CS24, Lemma 5.7.1, p.78).

**Checks.**

- For M=A the reductions are free of rank one and M is discrete.
- For nonzero A=𝔽_p, I=0 and M=A[1], the reduction is still A[1], which is not flat over the discrete A; the hypothesis excludes this nondiscrete module.
- For M=0 every reduction is flat and the conclusion is the discrete zero module.

**Proof route.** Use perfectoid p-complete arc hypercovers by products of complete rank-at-most-one valuation rings and descend M from its flat Koszul reductions. After completing and splitting the valuation products, reduce I to a principal element with compatible p-power roots. Compare M with the ordinary inverse limit of π₀M/a^n; the complete flat-system theorem identifies its reductions. The compatible-root annihilator identity makes (a) weakly proregular; adic flatness gives derived reduction discreteness. Derived Nakayama identifies M with that ordinary limit.

*Needs:* §3.1 flat animated modules and maps; §3.3 flatness after a nilpotent thickening; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; gap:complete-valuation-product-basis; gap:integral-perfectoid-hyperdescent; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9.

### 10.2 Adically faithfully flat descent with supports

Prove the following statement. Fix ordinary R, commutative finite locally free G/R, animated R-algebra A and I=(a₁,…,a_r)⊂π₀A. If A→A^• is a cosimplicial animated A-algebra whose derived Koszul reduction modulo the tuple is a faithfully flat hypercover, then RΓ_I(A,G)≃Rlim_Δ RΓ_I(A^•,G). Without completeness this is a supported statement. If A and all A^j are derived I-complete, the analogous equivalences also hold for RΓ(A,G) and for RΓ(U_A,G), U=Spec π₀A minus V(I). (CS24, Theorem 5.7.2, pp.78–81; SP, Tag 0A6R (Lemma 47.9.1), 0954 (Lemma 47.8.2), and §47.10; online, no page numbers).

**Checks.**

- For I=(1), both supported complexes vanish; completeness would force the rings to be 0 only for the additional full-cohomology assertion.
- For the empty tuple I=0, supports are full and the statement is fpqc hyperdescent.
- For the split cover A→A×A at I=(a), the localization fibres split with the cover and the totalization equals RΓ_(a)(A,G).

**Proof route.** Excision permits completing every term. General continuity and fpqc descent already give full affine descent in the complete case; the support triangle reduces the new assertion to punctured descent. Separate primary coefficients. Étale complete-arc hyperdescent treats the prime-invertible contribution and its j_! error. Prime continuity reduces the remaining punctured functor to characteristic-p quotients. Use complete module descent and the cohomology deformation triangle to make the assertion invariant under square-zero extensions; Postnikov convergence reduces to discrete 𝔽_p-algebras. Use ind-fppf semiperfect refinements, nilpotent approximation, and completion to reach perfect A. Perfectoid complete-flat discreteness makes the completed cover terms discrete, so cohomological connectiveness reduces hyperdescent to Čech descent. Establish universal Čech descent, allowing refinement of the cover by its perfection; repeat the reductions after arbitrary animated base change. This makes every Čech algebra perfect. Apply the perfect-base Dieudonné fibre formula. Remove V−1 by the fibre triangle and M by its finite projective dimension and base-change compatibility. For J=(p,[a₁],…,[a_r]) in W(A), use geometric supports as colim_n RHom(K_J^n,−), with the finite Koszul complex, instead of ordinary J-power quotients. Each dual Koszul complex on an ordinary Witt ring occupies [0,r+1], so filtered colimits commute with the cosimplicial totalization. Derived complete faithful-flat module descent identifies W(A) with the totalization of its Witt terms. Finite-projective Koszul base change and commutation of RHom with limits prove each fixed-n equivalence, then its filtered colimit. Witt rings are derived J-complete: p is regular, reduction modulo p is the I-complete perfect ring, and complete derived Nakayama lifts completeness along the finite Teichmüller tuple. The same argument applies to every cover term.

*Needs:* §6.3 finite-ideal derived excision; §8.5 continuity over complete animated rings; §7.1 fpqc hyperdescent of flat cohomology; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; §3.9 cohomology of increasingly accurate ring towers; §10.1 discreteness of completely flat perfectoid modules; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:perfection-covers; §8.1 derived completeness implies henselianity; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; gap:complete-etale-hyperdescent; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; gap:flat-cohomology-continuity; gap:torsor-limit-descent; gap:complete-module-hyperdescent; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

### Examples

For I=(1), supported descent compares two zero complexes. For I=(0), support is the whole spectrum and the hypothesis is an fpqc hypercover. For a single nonunit parameter the split cover A→A×A descends the localization fibre directly.

### Dependencies

§3.1 flat animated modules and maps; §3.3 flatness after a nilpotent thickening; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; gap:complete-valuation-product-basis; gap:integral-perfectoid-hyperdescent; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9; §6.3 finite-ideal derived excision; §8.5 continuity over complete animated rings; §7.1 fpqc hyperdescent of flat cohomology; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; §3.9 cohomology of increasingly accurate ring towers; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:perfection-covers; §8.1 derived completeness implies henselianity; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; gap:complete-etale-hyperdescent; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; gap:flat-cohomology-continuity; gap:torsor-limit-descent; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

## Downstream consumers

PurityForFlatCohomology uses ind-syntomic maps, support excision, complete continuity and adic hyperdescent for its purity statements. Perfectoid and prismatic applications use the same coefficient and support comparisons. These applications do not supply prerequisites to this roadmap. The ample Brauer comparison also supplies arithmetic schemes beyond the infinite-field scope of HeightsRationalPointsAndObstructions §2.6d.

## Worked examples

Over 𝔽_p[t], the fppf α_p torsor x^p=t is nontrivial: the additive Frobenius sequence gives H¹(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t]^p. Passing to an étale point presheaf would erase this torsor. Over a perfect 𝔽_p-algebra, Frobenius is surjective and the α_p example behaves differently; the Dieudonné formula still records the correct V−1 fibre, including its possible H¹ for other groups.

For A=ℤ/p², the derived quotient by p has π₀=𝔽_p and π₁=𝔽_p. The ordinary residue does not record π₁. The map ℤ/p²→𝔽_p therefore cannot be used as an excision equivalence merely because the ordinary residues agree. By contrast ℤ→ℤ_p is flat and has identical derived reductions modulo p, so it supplies a valid principal-excision example.

For a nonzero ring R the map R→0 is flat, but is not ind-fppf. The map ℤ→Q also fails ind-fppf despite ordinary flatness: Z[1/2]→Q would have to factor through a faithfully flat finitely presented ℤ-algebra, forcing 2 to be a unit there. Thus the ind-fppf definition distinguishes both loss of faithfulness and failure of finite-presentation factorization.

For supports, I=(1) gives zero cohomology and satisfies the derived residue condition for every map; I=(0) gives full cohomology. Ideals (t) and (t²) give the same support complex, whereas their Koszul quotients are distinct objects. The zero-support and radical invariance tests apply before choosing a completion tower.

A G_m-gerbe has integer weights: an (n+1)-fold tensor of a weight-one bundle has weight n+1, even if n times the gerbe class vanishes. The ample-generation construction either works on a μ_n-gerbe lift, where weights are modulo n, or tensors with a chosen invertible weight −n bundle. Quasi-compactness gives finitely many rank values of a locally free bundle; it does not imply finitely many connected components. These two distinctions enter the twisted-sheaf construction directly.

## References

Page numbers are printed preprint pages. Stable Stacks tags replace pages for the online reference. Statements and proof paths are expressed in this roadmap’s own words.

- **CS24**. Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*. arXiv:1912.10932v3, 26 April 2023; preprint pagination. [Source](https://arxiv.org/pdf/1912.10932v3). Locations used: §1.4 pp.8–9; §2.2 pp.18–21; §2.3.3 pp.24–25; §4.1 pp.36–39; §5 pp.46–81; §7.2 pp.90–91.
- **BG80**. Lucile Bégueri, *Dualité sur un corps local à corps résiduel algébriquement clos*. Mémoires de la SMF, nouvelle série 4 (1980). [Source](https://www.numdam.org/item/MSMF_1980_2_4__1_0.pdf). Locations used: §§2.1–2.2, pp.22–27.
- **DJ**. Aise Johan de Jong, *A result of Gabber*. author note, nine pages; undated PDF. [Source](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf). Locations used: Theorem 1.1 and §§2–3, pp.1–9.
- **L08**. Max Lieblich, *Twisted sheaves and the period-index problem*. arXiv:math/0511244v4, 25 May 2007; preprint pagination. [Source](https://arxiv.org/pdf/math/0511244v4). Locations used: §§3.1.1–3.1.2 pp.6–8; Lemmas 3.1.3.5–3.1.3.6 pp.10–11; §3.1.4 pp.11–14.
- **BC22**. Alexis Bouthier and Kęstutis Česnavičius, *Torsors on loop groups and the Hitchin fibration*. arXiv:1908.07480v4; preprint pagination. [Source](https://arxiv.org/pdf/1908.07480v4). Locations used: §2.1.1–2.1.8 pp.5–8; §2.1.12–2.1.15 pp.11–13; §2.3 pp.29–31.
- **Y18**. Amnon Yekutieli, *Flatness and completion revisited*. arXiv:1606.01832v3, 6 September 2017; numbering differs from published 2018 paper. [Source](https://arxiv.org/pdf/1606.01832v3). Locations used: Theorem 1.8 pp.5–6; §4 pp.12–14; Theorem 5.9 pp.16–17.
- **SP**. The Stacks Project Authors, *The Stacks Project*. online version. [Source](https://stacks.math.columbia.edu/tag/0954). Locations used: Tag 0954, Lemma 47.8.2, statement and proof; stable tag in place of page number; Tag 0A6R, Lemma 47.9.1, geometric localization complex; §47.10, local cohomology for Noetherian rings and comparison map; Tags 0AH2 and 0AH3, regular completion and henselization of G-rings.
- **C19**. Kęstutis Česnavičius, *Purity for the Brauer group*. arXiv:1711.06456v4, 1 December 2018; internal date 4 December 2018; preprint pagination. [Source](https://arxiv.org/abs/1711.06456v4). Locations used: §1.5 p.3; Lemma 3.1 p.6.
- **R70**. Michel Raynaud, *Spécialisation du foncteur de Picard*, Publications Mathématiques de l’IHÉS 38 (1970), pp.27–76. [Source](https://www.numdam.org/item/PMIHES_1970__38__27_0/). Lemma 6.2.2, p.51.
