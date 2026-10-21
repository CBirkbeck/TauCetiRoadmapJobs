# Roadmap: arithmetic level raising, diagonal reciprocity and rankin–selberg selmer ranks

**Summary.** Extend SelmerIwasawaCohomology by unitary arithmetic level raising over arbitrary CM extensions, integral congruence cohomology, diagonal Abel–Jacobi classes and the two explicit reciprocity laws. These supply rank zero from a nonzero central Rankin–Selberg value and rank one from a nonzero diagonal regulator, with all coefficient-admissibility, local-level, multiplicity and cohomological-realization hypotheses visible. The rank-(2,3) refinement has its own statement and proof contract.

## Scope and ownership

This is Part II of SelmerIwasawaCohomology. The base owns continuous arithmetic cohomology, Bloch–Kato finite and singular conditions, integral Selmer reduction and Selmer complexes. This continuation owns their native unitary level-raising realization, the source-specific incidence and reciprocity comparisons, and the Selmer-rank deductions. The base's exact section boundary is an explicit supplier-contract gap; §§3.9 and 3.14 mentioned by PadicMeasuresIwasawaAlgebras do not certify the required arithmetic interfaces.

Mathlib supplies the polynomial and continuous-cohomology carriers. Tau Ceti supplies explicit continuous low-degree cochains and quotients; its divisor-class Abel–Jacobi construction and elliptic 2-Selmer constructions do not provide the higher-codimension arithmetic regulator or the Selmer groups here. No target rebuilds these existing carriers. General coefficient operations and any identical base exponent or weak-semisimplicity object belong to the base; §§1.1–1.2 add the source's general ideal-power exponent and Frobenius-comparison interface only where that is an extension.

The native unitary varieties, their general PEL moduli and compactifications stay with ShimuraVarieties, PELModuli and ShimuraCompactifications. General representations, polarized deformation conditions and rigid patching stay with the arithmetic Galois and deformation suppliers. General incidence geometry, nearby cycles, Chow theory and the arithmetic regulator have the supplier obligations below. Layers 2, 4–6 concern their particular unitary isogenies, graph cycles and comparisons. Hilbert modular supersingular geometry remains with HilbertModularVarietiesAndShimuraCurves; §8.5 is a comparison test with its theorem. Generic bipartite systems stay with EulerSystemsAndKolyvaginSystems; §7.3 is the arithmetic realization and requires an interface admitting an inequality on its second edge.

Packets, global multiplicities, general Gan–Gross–Prasad period identities, heights and derivative formulas are outside this continuation. A period nonvanishing witness is a rank-zero prerequisite with unresolved permitted ownership, recorded as `period-nonvanishing`. A nonzero L-derivative is not a hypothesis replacing a nonzero cycle; the source calls that link Conjecture 8.3.1 (ltxzz line 6748). The general conditional rank theorems include F⁺=ℚ; their established-domain specializations and the separate n=2 refinement are distinct targets.

## Conventions

F/F⁺ is a CM quadratic extension, F⁺ is totally real, and n≥2. Let n₀ and n₁ be the even and odd members of {n,n+1}, rα=⌊nα/2⌋, so r₀+r₁=n. A relevant representation Πα is irreducible cuspidal on GL(nα,A_F), is conjugate self-dual, and has archimedean principal-series characters arg^(1−nα),arg^(3−nα),…,arg^(nα−1), where arg(z)=z/|z|. E⊂ℂ is a common strong coefficient number field: it contains both rationality fields and realizes all the associated representations with scalar-extension compatibility at every λ. These general notions are supplier contracts, not new private definitions (ltxzz Definition 1.1.3, line 124; Definition 3.2.5, line 1222).

For λ|ℓ write Oλ for the integers of Eλ, π for a chosen uniformizer only in computations, kλ=Oλ/λ and A_m=Oλ/λᵐ for m≥1. Congruence ideals are ideal powers, not rational-prime powers. Ramification of Eλ/ℚℓ is allowed. Hodge–Tate weight of Eλ(1) is −1. Put Vλ=(ρΠ₀,λ⊗ρΠ₁,λ)(n), and Rα⊂ρΠα,λ(rα). Then R=R₀⊗R₁ has generic fibre Vλ and polarization R^c≃R∨(1). The dimension and twist witness is n=2: ranks 2 and 3, r₀=r₁=1, tensor rank 6 and total twist 2. The weight is (2−1)+(3−1)−4=−1 (ltxzz line 914; line 5822; line 6484).

Arithmetic Frobenius acts on residue coordinates by x↦x^q; geometric Frobenius is its inverse. Thus arithmetic Frobenius acts by 9 on Eλ(1) at an inert degree-one p=3 place of F, and geometric Frobenius by 1/9. Its Hodge–Tate weight is still −1. For the polarized disconnected group, hγ is the GL component of γ²: for γ=(I,−1)c, hγ=−I, not I. Cohomology is cohomological, Hⁱ(K[a])=Hⁱ⁺ᵃ(K); a codimension-n class is in degree 2n with twist n, and its regulator is H¹ of degree 2n−1. The inhomogeneous coboundary is g·m−m: for the sign action of C₂ on ℤ and m=1 it takes the nontrivial element to −2. These witnesses fix all directions and dualities used below (ltxzz lines 781–830; EtaleCohomologyFoundations §F.4.6; Tau Ceti `d0`).

Use finite functions on native definite Shimura sets, with pushforward counting fibre multiplicity and period given by a sum, not an average. The spherical unit is 1_K and vol(K)=1. Distinguish M_m (localization), M/I (quotient) and M[I] (annihilator submodule); residual and congruence kernels are contracted from the indicated Hecke algebra. All choices of embeddings, uniformizations and multiplicity decompositions have explicit domains and transport maps; no distinguished coordinate in a multiplicity space is canonical.

H(N) denotes exactly Hypothesis 3.2.10: for every standard indefinite rank-N V, discrete π with relevant BC(π), and ιℓ:ℂ≃ℚℓbar, irreducibility of ρBC(π),ιℓ implies that its conjugate ρ^c is the Galois multiplicity module Hom_(U(V)(A∞))(ιℓπ∞,colim_K Hᴺ⁻¹ét(Sh(V,K)_Fbar,ℚℓbar)). H(N) is retained as a mathematical hypothesis where the source retains it; it is not an arbitrary chosen motive. Conditional signatures carry it in both ranks. Removing it requires the supplier theorem in `automorphic-multiplicity` (ltxzz line 1259).

Schemes, modules and topological groups use the supplier universes without a countability restriction on carriers. Coefficients may occupy a smaller universe than the absolute Galois group. Finite discrete coefficients use ProfiniteCohomology's comparisons to the pinned `TopRep` carrier; adic coefficients require the separate non-discrete exactness and Hochschild–Serre contracts. Reduced cohomology is not silently given the topology of an arbitrary quotient of pointwise function spaces.

**Checks.**

- `twist_rank_two_three`: the rank, degree and weight calculations above distinguish a tensor twist n from twisting each factor by n.
- `frobenius_inert_three`: arithmetic and geometric actions on Eλ(1) are 9 and 1/9; replacing p² by p fails at the inert place.
- `polarization_square`: (I,−1)c squares to GL component −I; using γ instead of γ² loses the fixed-line condition.
- `cochain_sign`: the sign-action coboundary of 1 is −2, pinning the connecting-map convention.

## Exact supplier contracts

### From Mathlib

The baseline is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read these as the exact pinned signatures, with the ring, group and topology instances in their Lean contexts:

- `Polynomial.eval` in `Mathlib/Algebra/Polynomial/Eval/Defs.lean` evaluates R[X] at R; `eval_X` computes X at its argument. `Polynomial.derivative` in `Mathlib/Algebra/Polynomial/Derivative.lean` is an R-linear map under a semiring, and `derivative_X` is 1. The predicates in §1.3 add the source's parity and unit/root conditions on these carriers.
- `TopRep.homogeneousCochains` and `continuousCohomology n A : TopModuleCat k` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`, for a ring k and topological group G with the displayed topologies. The pin uses `TopRep k G` and the pointwise cohomology argument `n A`.
- `ContinuousCohomology.cochainsMap`, `map`, `map_id` and `map_comp` in `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean`: a continuous φ:H→G and f:res φ X→Y induce Hⁿ(G,X)→Hⁿ(H,Y). The identity and composition laws use those same compatible pairs.

### From Tau Ceti

The baseline is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, `TauCeti.ContCohomology.d0` is the additive map m↦(g↦g·m−m); `H1` is the quotient of continuous 1-cocycles by continuous coboundaries, and `H1pi` is its quotient map. Its context retains the continuous scalar action. `subsingleton_H1_of_subsingleton` computes H¹ for a trivial group, `subsingleton_H1_of_subsingleton_coefficients` computes zero coefficients, and `nsmul_H1_eq_zero` transfers a coefficient exponent to H¹. These provide the low-degree anchor; none asserts an arithmetic Bloch–Kato condition.

### From named roadmap sections

| Supplier | Sections and exact use |
| --- | --- |
| TauCetiRoadmap.EtaleCohomologyFoundations | §F.0.3, §F.2.6, §F.2.7, §F.3a, §§F.4.0–F.4.6, §§0.9–0.11, §F.6, §F.7: Tate twists, trait inertia, stable lattices, finite/adic cohomology, derived reduction and rationalization, Künneth, Gysin, cycle classes, trace and blowups on their stated domains. |
| TauCetiRoadmap.ProfiniteCohomology | Layers 1–3, Layers 5–8, Layer 10: Explicit/canonical finite discrete coefficient comparisons, exactness, restriction, transfer and cups; no ℓ-adic Hochschild–Serre or non-discrete exactness is inferred. |
| TauCetiRoadmap.Chebotarev | Layers 1–2, Layer 10: Arithmetic Frobenius conjugacy classes, finite exclusions and infinitely many primes over arbitrary number fields. |
| TauCetiRoadmap.SchemeAndStackFoundations | Layer 5: Chow/intersection, Chern and projective-bundle constructions on native schemes, as specified in the accepted étale supplier contract. |
| TauCetiRoadmap.ArithmeticGaloisDuality | Required unbound section: Section binding is missing; required contract(s): purity-crystalline-regulator, selmer-annihilation. These are obligations, not verified imports. |
| TauCetiRoadmap.ArithmeticGaloisRepresentations | Required unbound section: Section binding is missing; required contract(s): polarized-image-lifting, eventual-images. These are obligations, not verified imports. |
| TauCetiRoadmap.AutomorphicGaloisRepresentations | Required unbound section: Section binding is missing; required contract(s): galois-realization, automorphic-multiplicity. These are obligations, not verified imports. |
| TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII | Required unbound section: Section binding is missing; required contract(s): cohomological-genericity, local-unitary-representations, epsilon-from-cycle. These are obligations, not verified imports. |
| TauCetiRoadmap.CrystallineCohomology | Required unbound section: Section binding is missing; required contract(s): grothendieck-messing. These are obligations, not verified imports. |
| TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra | Required unbound section: Section binding is missing; required contract(s): rigid-r-equals-t. These are obligations, not verified imports. |
| TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison | Required unbound section: Section binding is missing; required contract(s): old-form-dimension. These are obligations, not verified imports. |
| TauCetiRoadmap.EulerSystemsAndKolyvaginSystems | Required unbound section: Section binding is missing; required contract(s): selmer-detection, selmer-bipartite. These are obligations, not verified imports. |
| TauCetiRoadmap.GlobalGaloisDeformations | Required unbound section: Section binding is missing; required contract(s): eventual-rigidity. These are obligations, not verified imports. |
| TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves | Required unbound section: Section binding is missing; required contract(s): hilbert-precursor. These are obligations, not verified imports. |
| TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants | Required unbound section: Section binding is missing; required contract(s): hecke-transfer, hecke-finite-support. These are obligations, not verified imports. |
| TauCetiRoadmap.LefschetzPencilsAndVanishingCycles | Required unbound section: Section binding is missing; required contract(s): nearby-weight, semistable-boundary. These are obligations, not verified imports. |
| TauCetiRoadmap.LocalGaloisDeformationRings | Required unbound section: Section binding is missing; required contract(s): rigidity. These are obligations, not verified imports. |
| TauCetiRoadmap.MotivesAndAlgebraicCycles | Required unbound section: Section binding is missing; required contract(s): chow-abel-jacobi. These are obligations, not verified imports. |
| TauCetiRoadmap.ReductiveGroupsPartII | Required unbound section: Section binding is missing; required contract(s): unitary-incidence. These are obligations, not verified imports. |
| TauCetiRoadmap.SelmerIwasawaCohomology | Required unbound section: Section binding is missing; required contract(s): coefficient-algebra, selmer-local, hochshild-serre-adic. These are obligations, not verified imports. |
| TauCetiRoadmap.ShimuraCompactifications | Required unbound section: Section binding is missing; required contract(s): boundary-cohomology. These are obligations, not verified imports. |
| TauCetiRoadmap.ShimuraData | Required unbound section: Section binding is missing; required contract(s): cm-reflex. These are obligations, not verified imports. |
| TauCetiRoadmap.ShimuraVarieties | Required unbound section: Section binding is missing; required contract(s): native-shimura, unitary-special-compatibility. These are obligations, not verified imports. |

The SchemeAndStackFoundations Layer 5 contract is read through its explicit specification in EtaleCohomologyFoundations §F.6, not inferred from the title. ProfiniteCohomology's all-degree work is on finite discrete coefficients; it expressly excludes the Hochschild–Serre and non-discrete exactness needed here.

### Missing section bindings and proof contracts

Each entry below is a `gap:` prerequisite in the data plan. An unbound contract is a requirement on the named owner, not a claimed section number. The exact native models and theorems must be supplied; a conclusion packaged as user data does not discharge a contract. A gap with owner “none” is not an imported roadmap dependency.

**`coefficient-algebra` — DVR coefficient and Frobenius endomorphism interface.** Owner: SelmerIwasawaCohomology; interface: unbound base contract: integral coefficient modules. The base section contract must bind its finite Oλ-modules, ideal-power submodules, invariant/coinvariant comparison, Nakayama and elementary-divisor API. General exponent and weak-semisimplicity definitions are retained here only as the source-specific extension; ownership of any identical base object must be settled by deletion and import. This gap includes the algebra used in the proof sketches of 1.1–1.2, not a theorem conclusion passed as data. *Required:* Supply the base coefficient API and certify that 1.1–1.2 extend it without duplication. Used by §§1.1, 1.2.

**`selmer-local` — Finite, singular and reduced integral Selmer conditions.** Owner: SelmerIwasawaCohomology; interface: unbound base contract: ltxzz §§2.2–2.4. Require H¹sing=H¹(I,R)^Γκ away from ℓ, finite kernel, rational Bloch–Kato condition above ℓ, integral preimage, reduction as IMAGE of integral Selmer, finite generation of integral Selmer, its lattice/torsion quotient and the scalar-extension comparison H¹_f(F,R)⊗Eλ≃H¹_f(F,R_E), finite-sum and conjugation functoriality, and the FL-range comparison. Preserve ramified Eλ and crystalline torsion extensions; H¹_f,R is not an arbitrary torsion Selmer group. ltxzz line 579, ltxzz line 600, ltxzz line 711, ltxzz line 717, ltxzz line 722. *Required:* Bind the actual base sections for the rational, integral and reduced finite-condition interfaces. Used by §§4.4, 4.5, 7.3.

**`galois-realization` — Relevant automorphic and polarized Galois representations.** Owner: AutomorphicGaloisRepresentations; interface: unbound contract: ltxzz Proposition 3.2.4 and Definition 3.2.5. For all relevant ranks, tempered local-global compatibility, strong coefficient fields, ρ^c≃ρ∨(1−N), finite Eλ realization, stable polarized lattices and base change; ltxzz line 1204, ltxzz line 1222, ltxzz line 796. ArithmeticGaloisRepresentations owns continuous representations and polarization; its exact section is also absent. *Required:* Bind strong coefficient fields, polarizations and the normalized local-global realizations at all finite places. Used by §§1.6, 3.1, 4.4.

**`cm-reflex` — CM types, reflex fields and local uniformization choices.** Owner: ShimuraData; interface: unbound contract: ltxzz §§3.3 and 3.5. Construct generalized CM types and finite reflexive closure, Hasse classification of global hermitian spaces with prescribed local invariants, and the CM auxiliary model Tp with its T-action and normalized orbit trace. ltxzz line 1280, ltxzz line 1288, ltxzz line 2735. *Required:* Bind CM/reflex fields, hermitian local-global existence and CM auxiliary trace sections. Used by §§1.5, 2.1.

**`rigidity` — Minimal and regular Fontaine–Laffaille deformation predicates.** Owner: LocalGaloisDeformationRings; interface: unbound contract: ltxzz Definition 6.3.4. Rigidity for (Σmin,Σlr) means every polarized lift at Σmin is minimally ramified; at each inert raising place the residual eigenpair {Nv^(−N),Nv^(−N+2)} occurs exactly once; above ℓ regular Fontaine–Laffaille crystallinity; unramified elsewhere. Similitude is η_(F/F⁺)^N εℓ^(1−N). ltxzz line 5623. General local deformation and FL theory stays with its earlier owners. *Required:* Bind the exact normalized rigidity and local deformation-condition definitions. Used by §§1.6.

**`cohomological-genericity` — Uniform cohomological genericity and eventual genericity.** Owner: AutomorphicGaloisRepresentationsPartII; interface: unbound contract: ltxzz Definition D.1.1, Proposition D.1.3 and Corollary D.1.4. For N≥1 and residual Hecke φ, quantify over EVERY enlarged exceptional set, EVERY standard indefinite rank-N space and EVERY compatible level/lattice: localized Hⁱ vanishes for i≠N−1. Decomposed genericity at a split finite place, under F⁺≠ℚ, implies that concentration; relevant Π give it for all but finitely many λ. ltxzz line 9474, ltxzz line 9492, ltxzz line 9575. Do not replace this by one chosen middle-degree module. *Required:* Bind the uniform predicate, its split-place vanishing theorem and eventual genericity on the stated base-field domain. Used by §§1.6, 3.1, 7.4.

**`native-shimura` — Native unitary Shimura schemes and integral models.** Owner: ShimuraVarieties; interface: unbound contract: ltxzz §§3.2,3.4–3.5,4.1–4.2,5.1–5.2. Need the actual standard signature spaces, neat-level functor, definite double quotients, finite special homomorphism, PEL moduli and generic-fibre comparison. General PEL representability belongs to PELModuli; deformation of polarized abelian schemes belongs to its earlier owners. Source-specific strata and incidence comparisons are 2.2–2.6. Ordinary/compact-support specialization for nonproper models is required, not an assertion of properness; ltxzz line 1718, ltxzz line 1744, ltxzz line 2744, ltxzz line 4725. *Required:* Bind the native unitary moduli, generic-fibre and nonproper specialization sections with their exact hypotheses. Used by §§2.1, 2.2, 2.6, 4.1, 5.1.

**`hecke-transfer` — Spherical Hecke algebras and transferability.** Owner: IntegralHeckeAndGaloisDeterminants; interface: unbound ownership: general-rank unitary Satake and transfer. The supplier name does not certify general-rank scope. Bind the general unramified unitary spherical Satake interface through ReductiveGroupsPartII or IntegralHeckeAndGaloisDeterminants, and transferability through EndoscopicTransferAndUnitaryTraceComparison. Transferability is BOTH clauses of Definition D.2.1; small levels exist and splitting/hyperspecial cases obey Lemma D.2.2. ltxzz line 1086, ltxzz line 9612, ltxzz line 9621. This gap explicitly rejects using a GL₂-only declaration as a general-rank supplier. *Required:* Assign and bind general-rank Satake, native double-coset operators and the two-clause inertial transfer API to earlier owners. Used by §§1.4, 2.1, 4.1.

**`unitary-incidence` — Hermitian Frobenius incidence varieties and their cohomology.** Owner: ReductiveGroupsPartII; interface: unbound contract: ltxzz Appendix A.1–A.2. Require schemes of subbundles with Frobenius-orthogonal conditions, admissibility including possibly degenerate pairings, their tangent/normal bundles, projective/Fermat identifications, integral cohomology, cycle intersections and unitary finite-field counts used in 2.2–2.5. The general incidence section requires a binding; an extension beyond that owner belongs to its continuation. ltxzz line 6937 and Appendix A; arithmetic identifications with native strata are owned here. *Required:* Bind the general unitary incidence geometry and coefficient/cohomology API on the full Appendix A domain. Used by §§2.2, 2.3, 2.4.

**`grothendieck-messing` — Deformation of polarized CM abelian schemes.** Owner: CrystallineCohomology; interface: unbound contract: Grothendieck–Messing with endomorphisms. Need crystalline Dieudonné modules, the OF-linear Hodge filtration, Frobenius/Verschiebung and polarized quasi-isogeny deformation, including ramified integral lattices and the diag(p,1,…,1) pairing. Source use: ltxzz §§3.4,4.3,5.2–5.5. Do not supply local models as arbitrary rings unrelated to the moduli functor. *Required:* Bind crystalline deformation and its PEL/finite-flat comparison sections for these universal isogenies. Used by §§2.2, 2.3.

**`nearby-weight` — Integral nearby cycles, weight sequence and monodromy.** Owner: LefschetzPencilsAndVanishingCycles; interface: unbound contract: strict-semistable weight spectral sequence. EtaleCohomologyFoundations explicitly assigns nearby/vanishing cycles to this owner. Need the strict-semistable integral sequence, alternating restriction/Gysin, monodromy filtration, inertia and tame character, functoriality for the product blowup, and support comparisons. General absolute purity remains there; 2.5 supplies only the unitary instance. ltxzz line 4023, ltxzz line 4107. *Required:* Bind the general semistable spectral sequence and monodromy comparison before its unitary instantiation. Used by §§2.5, 2.6.

**`automorphic-multiplicity` — Exact cohomological multiplicity H(N).** Owner: AutomorphicGaloisRepresentations; interface: unbound contract: ltxzz Hypothesis 3.2.10 and Proposition 3.2.11. H(N) says that for EVERY standard indefinite rank-N V, discrete π with relevant BC(π), and ιℓ, if ρBC(π),ιℓ is irreducible, Hom_{U(V)(A∞)}(ιℓπ∞, colim_K Hᴺ⁻¹ét(Sh(V,K)_Fbar,ℚℓbar))≃ρBC(π),ιℓ^c as ΓF-modules. Conditional theorems carry H(N) explicitly. To remove it require its proof for N≤3 over all F⁺ and for all N when F⁺≠ℚ. Include the cuspidal concentration and multiplicity compatibility needed for 4.3–4.5. ltxzz line 1259, ltxzz line 1273. The latter cites other work; its proof is not supplied by its mere appearance as a proposition. *Required:* Bind H(N), its stated established domains and its integral/rational multiplicity compatibility. Used by §§3.2, 3.6, 3.7, 4.3, 4.5, 6.3, 8.3, 8.4.

**`boundary-cohomology` — Boundary localization at irreducible residual systems.** Owner: ShimuraCompactifications; interface: unbound contract: ltxzz Lemma 6.1.11. Need toroidal compactification for rank-one nonproper unitary varieties and boundary Eisenstein/isobaric cohomology: residual absolute irreducibility kills the boundary in every degree. ltxzz line 5255. Compactness is not a silent premise. *Required:* Bind the native boundary cohomology theorem identifying ordinary and compact supports after localization. Used by §§3.1.

**`rigid-r-equals-t` — Rigid R=T, complete intersections and Hecke freeness.** Owner: DeformationAndDerivedPatchingAlgebra; interface: unbound contract: ltxzz-deformation Theorem 3.6.3. For the polarized global deformation problem retain D0–D4 of the cited theorem, including Fontaine–Laffaille width, ℓ>2(N+1), cyclotomic irreducibility, rigidity, uniform residual concentration and nonzero localized Hecke module; Σlr=∅ in odd rank. It supplies Runiv≃T_m and finite free middle cohomology. Local mixed/unramified/ramified rings and Runr⊗Rmix Rram come from GlobalGaloisDeformations and LocalGaloisDeformationRings. Exact sections of all three are absent. ltxzz-deformation line 1444; ltxzz line 5662. *Required:* Bind the rigid R=T/freeness theorem and the mixed-to-congruence deformation maps at their full coefficient generality. Used by §§3.3, 3.6.

**`old-form-dimension` — Transfer dimension comparison in even rank.** Owner: EndoscopicTransferAndUnitaryTraceComparison; interface: unbound contract: ltxzz Proposition D.2.3 and Lemma 6.4.2. Require trace/multiplicity comparison on transferable levels giving equality of the unramified and ramified multiplicities in the congruence problem. Use both clauses of transferability and the local nontempered/tempered constituent classification, rather than posit the equality as a certificate. ltxzz line 9631, ltxzz line 5739. *Required:* Bind the old-form dimension identity used to remove integral torsion in even-rank level raising. Used by §§3.3.

**`local-unitary-representations` — Local unitary constituents and cohomological decomposition.** Owner: AutomorphicGaloisRepresentationsPartII; interface: unbound contract: ltxzz Appendices B–C and §5.6. Need the local classification detecting special maximal invariants, Steinberg/monodromy eigenvalues, and the representation decomposition of primitive link cohomology from Proposition 5.6.4. These are general local representation/automorphic inputs, with actual earlier ownership to be bound. ltxzz line 3368, ltxzz line 5647. *Required:* Bind the local unitary constituent, primitive-cohomology and Frobenius compatibility theorems. Used by §§3.4, 6.3.

**`chow-abel-jacobi` — Chow cycles and the arithmetic étale regulator.** Owner: MotivesAndAlgebraicCycles; interface: unbound contract: arithmetic étale Abel–Jacobi. EtaleCohomologyFoundations supplies finite/adic cycle classes and Gysin but does not state the arithmetic regulator. Need cycles modulo rational equivalence, their absolute class, the projected Hochschild–Serre regulator, pullback/proper pushforward, coefficient change and integral reduction compatibilities; ltxzz line 6152, ltxzz line 6767. The generic regulator is not reconstructed from a divisor-class Abel–Jacobi map. *Required:* Bind the general Chow-to-arithmetic-étale regulator and all its operation compatibilities. Used by §§4.2, 4.3, 4.6.

**`hochshild-serre-adic` — Adic arithmetic Hochschild–Serre edge identification.** Owner: SelmerIwasawaCohomology; interface: unbound contract: Hochschild–Serre with ℓ-adic coefficients. ProfiniteCohomology explicitly excludes this spectral sequence and non-discrete coefficient exactness. Need the derived Galois-action comparison for geometric étale complexes with Oλ, Oλ/λᵐ and Eλ coefficients, compatible with scalar extension/localization, finite-level limits and support comparisons. Under a single geometric row it identifies absolute H²ⁿ with H¹ of H²ⁿ⁻¹. ltxzz line 6767. *Required:* Bind the non-discrete Hochschild–Serre spectral sequence and natural edge maps on these coefficient categories. Used by §§4.3, 4.6, 6.4.

**`purity-crystalline-regulator` — All-place purity and finite regulator theorem.** Owner: ArithmeticGaloisDuality; interface: unbound contract: ltxzz Lemma 8.1.6 and rank-one Selmer membership. Need tempered local-global purity of weight −1, local Euler characteristic with dual invariants, and crystalline regulator at good smooth integral reduction above ℓ, including nonproper projected cohomology; separate general purity belongs to DeligneWeightsAndPurity and crystalline comparison to PadicHodgeTheory. ltxzz line 6484, ltxzz line 6796. *Required:* Bind the rational all-place finite regulator theorem and its compatible integral-lattice realization. Used by §§4.4.

**`unitary-special-compatibility` — Special homomorphism under basic uniformizations.** Owner: ShimuraVarieties; interface: unbound contract: native addition-of-line and uniformization compatibility. Need native maps under V→V⊕⟨1⟩, the basic and link Cartesian squares, the two definite special correspondence legs, and identification with their double-coset maps. Source-specific geometric reciprocity is 5.2/6.2; the moduli compatibilities are required with the lattice/polarization scaling by ϖ. ltxzz §§4.5 and 5.10, especially ltxzz line 2286, ltxzz line 4432, ltxzz line 4461. *Required:* Bind the native special-map and definite/indefinite uniformization compatibility diagrams, with their isogeny scaling. Used by §§5.2, 6.1, 6.2.

**`semistable-boundary` — Singular cohomology and the potential boundary cokernel.** Owner: LefschetzPencilsAndVanishingCycles; interface: unbound contract: general potential-map comparison. Need the general comparison for integral strictly semistable schemes with ordinary/compact comparison, concentration, Frobenius exclusions and weak semisimplicity; identify ∂AJ with the actual integral potential-map cycle class. The unitary hypotheses are verified in 5.3; the generic theorem is not an arbitrary chosen isomorphism. ltxzz line 6024, ltxzz line 6030. *Required:* Bind the semistable potential-map comparison and its Abel–Jacobi value on a cycle, retaining the nonproper support hypothesis. Used by §§5.4.

**`polarized-image-lifting` — Congruence image lifting for polarized tensors.** Owner: ArithmeticGaloisRepresentations; interface: unbound contract: prime-to-ℓ image lifting. Need finite congruence images of polarized representation pairs, lifting and prime-to-ℓ powering with simultaneous cyclotomic control. Target 7.1 owns the source-specific Rankin–Selberg conclusion; general finite-group and polarized-image construction remains upstream. ltxzz line 918. *Required:* Bind finite congruence image and prime-to-ℓ lifting operations with their polarization/cyclotomic compatibilities. Used by §§7.1.

**`selmer-detection` — Finite Selmer extensions and abundant evaluation.** Owner: EulerSystemsAndKolyvaginSystems; interface: unbound contract: ltxzz §§2.3,2.6. Need reducibility depth, a uniform bound for reductions of an absolutely irreducible characteristic-zero lattice, Resρ injectivity under BOTH alternatives of Lemma 2.3.5, θS and its image bound using f(1)=1,f(2)=4, abundant tuples and diagonal evaluation, with continuous coefficient models. These are general cohomological detection, not the unitary arithmetic realization. ltxzz line 643, ltxzz line 648, ltxzz line 671, ltxzz line 678, ltxzz line 865. *Required:* Bind generic finite Selmer-extension detection and its uniform congruence-depth bounds. Used by §§7.2.

**`hecke-finite-support` — Finite Hecke-support contraction at chosen Frobenius.** Owner: IntegralHeckeAndGaloisDeterminants; interface: unbound contract: PI6, PI8 and PII8. Need finite support of localized native Hecke modules, distinction of nonisomorphic residual Galois systems by Frobenius, and contraction invariance after omitting an auxiliary rational support, simultaneously with the detecting conjugacy class. ltxzz line 5173, ltxzz line 5880, ltxzz line 6617, ltxzz line 6856. Chebotarev alone does not prove a Hecke quotient map is an isomorphism. *Required:* Bind the finite-support/Frobenius separation theorem proving the congruence Hecke quotient comparisons. Used by §§7.2.

**`selmer-bipartite` — Generic parity-system and annihilation interface.** Owner: EulerSystemsAndKolyvaginSystems; interface: unbound contract: bipartite systems with an inequality edge. The generic bipartite section requires an explicit binding. The source realization needs an equality on the singular edge and only an exponent upper bound on the absolute edge, arbitrary ramified Oλ, bounded lattice errors, finite local conditions and conjugate duality. A norm-compatible Euler/Kolyvagin system is not this contract. ltxzz line 200, ltxzz line 6158, ltxzz line 6303. *Required:* Bind a generic rank-annihilation interface accepting these exact two edge strengths, without replanning an existing bipartite theory. Used by §§7.3.

**`eventual-images` — Independent elliptic images and Steinberg tensor criterion.** Owner: ArithmeticGaloisRepresentations; interface: unbound contract: ltxzz Proposition 2.7.2 and Lemma 8.1.5. Need independent non-CM elliptic residual images, symmetric powers and their polarizations, plus the tensor irreducibility/adjoint exclusion criterion with one regular even unipotent and trivial odd action in characteristic zero or ≥2n(n+1)−1. ltxzz line 942, ltxzz line 6459. *Required:* Bind the residual-image and tensor-irreducibility facts needed to check the two admissibility families. Used by §§7.4.

**`eventual-rigidity` — Eventual rigidity in the two specified families.** Owner: GlobalGaloisDeformations; interface: unbound contract: ltxzz-deformation Corollary 4.1.2 and Theorem 4.2.6. Require eventual minimal/FL rigidity for the non-CM symmetric-power family and the supercuspidal relevant family, with their respective hypotheses, as used in ltxzz Lemmas 8.1.3–8.1.4; ltxzz-deformation line 1880; ltxzz line 6410, ltxzz line 6429. *Required:* Bind eventual rigidity and cyclotomic residual irreducibility for the stated families only. Used by §§7.4.

**`period-nonvanishing` — Upstream period witness with legal ownership.** Owner: none; interface: required period witness: ltxzz Lemma 8.2.1. Central nonvanishing must give a standard definite pair, self-dual lattices and compatible levels, and an integral Hecke eigentest f with nonzero finite diagonal sum; ltxzz line 6548. GanGrossPrasadConjecturesForClassicalGroups GGP.8 is a triaged target only, absent from the allowed suppliers and merge order. It is not imported here. An earlier permitted supplier must bind this result, or that GGP roadmap must acquire an accepted earlier position. Full packets, period identities and multiplicity theorems are not silently moved into this continuation. *Required:* Provide an allowed earlier owner for the definite period nonvanishing witness used by the rank-zero theorem. Used by §§8.1, 8.4.

**`selmer-annihilation` — Integral Tate pairings, different ideal and global reciprocity.** Owner: ArithmeticGaloisDuality; interface: unbound contract: ltxzz §§2.2–2.4 and rank proofs. Need local Tate duality and global sum-zero reciprocity, unramified isotropy, torsion crystalline pairing valued in dλ⁻¹/Oλ (not necessarily zero), Hodge–Tate range [1−n,n] with 2n−1≤(ℓ−2)/2 under ℓ>4n, and saturated integral Selmer reduction killing bad-place localizations by a fixed π-power. For a PERFECT pairing between dual free rank-one local A_m-modules, elements of exponents a,b give the lower bound max(0,a+b−m). ltxzz line 585, ltxzz line 620, ltxzz line 752, ltxzz line 6922. *Required:* Bind duality and the quantitative integral error-bound API needed to turn the two native reciprocity laws into rank bounds. Used by §§8.1, 8.2.

**`epsilon-from-cycle` — Epsilon sign forced by the nonzero diagonal regulator.** Owner: AutomorphicGaloisRepresentationsPartII; interface: unbound contract: ltxzz Remark 8.3.3. Use the actual cohomological representation pair and nonzero graph regulator to force epsilon(1/2,Π₀×Π₁)=−1; a conjectural L-derivative/height formula is not available as a proof. The remark states the conclusion without its own proof in the cited passage; bind its representation-theoretic input. ltxzz line 6793. *Required:* Bind a proved sign consequence of a nonzero diagonal regulator without assuming an arithmetic derivative conjecture. Used by §§8.2.

**`rank-two-three-proof` — Separate proof removing L6 and L7 for ranks 2 and 3.** Owner: none; interface: target 8.4: Remark 1.1.10 separate argument. The source explicitly asserts the rank-(2,3) refinement, including F⁺=ℚ and removal of L6/L7, but the inspected passage does not give the different argument. Need the small-rank replacement for integral concentration, rigid R=T and the annihilator construction, with hypotheses L1–L5 only; 8.4 is a stated target with this proof gap, not a corollary of 8.1–8.2. ltxzz line 196. *Required:* Supply the separate rank-(2,3) level-raising and rank-bound proof that replaces the uses of L6 and L7. Used by §§8.4.

**`hilbert-precursor` — Existing Hilbert modular level raising comparison.** Owner: HilbertModularVarietiesAndShimuraCurves; interface: unbound contract: liu-tian §4.1 and Theorem 4.7. The source is read, but this supplier text is absent. Its odd-degree quaternionic supersingular cycles and unramified level-raising map stay there. The exact LIInd and residual dimension hypotheses in Assumption 4.1 must remain explicit. liu-tian line 1407, liu-tian line 1496. *Required:* Bind the existing odd-degree Hilbert modular unramified level-raising theorem for the comparison Check. Used by §§8.5.

**`potential-map-notation` — Invariant/coinvariant potential-map notation and source dimensions.** Owner: LefschetzPencilsAndVanishingCycles; interface: unbound contract: ltxzz Construction 5.11.7 and equation (5.28). The extracted typography of upper/lower B and C must be matched against the source diagrams in the generic potential-map implementation: the potential map takes the INVARIANTS of the cokernel source to the COINVARIANTS of the kernel target. Remark 5.11.8 fixes the target direction because ∇ factors through coinvariants of H²ⁿ(Q(0),L(n)). This is an explicit interface check, not permission to exchange invariants and coinvariants. Use the worded definitions in 5.4 and the stratum degrees in ltxzz line 5097 through ltxzz line 5126. *Required:* Certify the precise potential-map carrier notation and its canonical maps against the generic semistable boundary theorem. Used by §§5.4.

## How to read the build

Layer 1 fixes coefficient algebra and the exact local/admissibility predicates. Layer 2 constructs the source-specific unitary reduction geometry and incidence maps. Layer 3 proves the odd Tate and even integral level-raising comparisons. Layer 4 constructs the diagonal regulator on its actual multiplicity module. Layers 5 and 6 prove the first and second reciprocity laws under their different hypothesis lists. Layer 7 realizes the arithmetic level-raising system and auxiliary-place detection. Layer 8 gives the rank deductions and their distinct specializations. Every target has a source locator and every missing prior interface ends at an explicit contract gap.

## Layer 1: Coefficient algebra, local predicates and admissibility

### 1.1 lambdaExponent

Define `lambdaExponent` as follows. For a commutative ring O, an ideal λ and an O-module M, define expλ(x) in ℕ∪{∞} as the infimum of the nonnegative e for which every element of λᵉ annihilates x. For a principal maximal ideal (π) this is the least e with πᵉx=0. Define ordλ(x) as the supremum of the nonnegative e with x∈λᵉM. Use ideal powers, so the definition is independent of a chosen uniformizer. (ltxzz, Definition 2.1.6, p. 12; ltxzz line 549).

The interface includes `lambdaExponent_le_iff` (characterisation): expλ(x)≤e iff λᵉx=0, for e∈ℕ; `lambdaExponent_map_le` (functoriality): For an O-linear map f, expλ(f x)≤expλ(x); equality holds for injective f; `lambdaExponent_unit_smul` (normalization): Multiplication by a unit preserves the exponent; `lambdaOrder_iso` (transport): Module isomorphisms preserve ordλ; over a DVR ordλ(πᵃu in O)=a for u a unit; `lambdaExponent_reduction` (evaluation): In O/πᵐ, exp(πᵃu)=m−a for 0≤a≤m and u a unit.

The proof uses the following chain. Ideal-power monotonicity and the well-ordering of ℕ give the exponent API; linear maps preserve annihilation and λ-power divisibility. No finite generation is needed.

*Needs:* contract gap `coefficient-algebra`.

**Checks.**

- `exponent_ramified`: In any DVR O, expπ(π in O/π³)=2; replacing π by the rational prime gives the wrong value in a ramified DVR.
- `exponent_zero`: expλ(0)=0 and ordλ(0)=∞; in a nonzero domain exp(1 in O)=∞.
- `exponent_field`: For λ=O, expλ(x)=∞ for x≠0, whereas λ=0 gives exponent 1 for x≠0. These boundary values distinguish ideal powers from an unspecified valuation.
- `order_DVR`: For any DVR O and uniformizer π, ordπ(π²u in O)=2 for a unit u; ordπ(u)=0.
- `order_congruence`: In O/π³, ordπ(π)=1 and ordπ(0)=∞.
- `order_unit_ideal`: For λ=O every x lies in every λᵉM, so ordλ(x)=∞, even when x≠0.

### 1.2 isFrobeniusWeaklySemisimple

Define `isFrobeniusWeaklySemisimple` as follows. For a finitely generated module M over L finite over ℤℓ or ℚℓ, with continuous action of an arbitrary topological group Γ, define weak semisimplicity to mean that the natural inclusion-to-quotient map M^Γ→M_Γ is an isomorphism. For a procyclic Γ this concerns the generalized eigenvalue-1 part; it does not assert semisimplicity of the entire representation. (ltxzz, Definition 2.1.2 and Lemmas 2.1.3–2.1.5, pp. 11–12; ltxzz line 493).

The interface includes `weaklySemisimple_iff_surjective` (criterion): When Γ≃Ẑ, for these noetherian modules the natural map is an isomorphism iff it is surjective; `weaklySemisimple_subquotient` (closure): Finite sums preserve weak semisimplicity for arbitrary Γ; Γ-stable subquotients do so when Γ≃Ẑ; `weaklySemisimple_lift` (integral comparison): For Γ≃Ẑ and M finite free over Oλ, if its reduction is weakly semisimple and dim_E(M_E)^Γ≥dim_k(M_k)^Γ, then M is weakly semisimple and these dimensions are equal; `weaklySemisimple_iso` (transport): Intertwining isomorphisms identify the natural maps.

The proof uses the following chain. Use the exact kernel/cokernel sequence of F−1 and the noetherian surjective-endomorphism criterion. For lifting, compare invariant ranks, reduce modulo λ, and use Nakayama.

*Needs:* contract gap `coefficient-algebra`; ProfiniteCohomology Layers 1–3; Tau Ceti `TauCeti.ContCohomology.d0`; Tau Ceti `TauCeti.ContCohomology.H1`.

**Checks.**

- `weak_trivial`: The trivial action on O and on the zero module is weakly semisimple: the natural map is the identity.
- `weak_jordan`: Over 𝔽₃, for F=[[1,1],[0,1]], the natural map ker(F−1)→coker(F−1) is zero between one-dimensional spaces, so weak semisimplicity fails.
- `weak_nonunit`: Over ℤ₃, F=4 on a rank-one lattice has invariants 0 and coinvariants ℤ/3, so it is not weakly semisimple although F is diagonal over ℚ₃.
- `cochain_sign`: For the sign action of C₂ on ℤ, d0(1) at the nontrivial element is −2.

### 1.3 satakeLocalConditions

Define `satakeLocalConditions` as follows. For a nonzero commutative ring L, a unit q∈L and a monic degree-N polynomial P with N≥1 and P(T)=(−T)ᴺP(T⁻¹) as a Laurent-polynomial identity, define four predicates: odd Tate genericity is invertibility of P′(1); odd intertwining genericity is invertibility of P(−q); even level-raising specialness is P(q)=0 and invertibility of P′(q); even intertwining genericity is invertibility of P(−1). The parity requirement is part of each predicate. (ltxzz, Definition 3.1.5 and Remark 3.1.6, pp. 23–24; ltxzz line 1044).

The interface includes `satakeConditions_map` (base change): A unital ring map preserves each predicate, with the target nonzero; transport the Laurent identity and monicity; `satakeConditions_local_iff_residue` (local criterion): Over a commutative local ring, unit evaluations are equivalent to nonzero residue evaluations; the equation P(q)=0 is still required in the original ring; `satakeConditions_split_iff` (root criterion): Over a splitting field, P′(a)≠0 at a root means a has multiplicity one; evaluations detect excluded roots without assuming distinctness of other roots; `satakeTensor` (tensor compatibility): For reciprocal polynomials presented by invertible root multisets, the polynomial of pairwise products is reciprocal and independent of splitting extension and root order.

The proof uses the following chain. Expand root products and use the derivative product rule. Descend symmetric expressions; invertibility transports along ring maps. The repeated-root test enforces the derivative condition.

*Needs:* Mathlib `Polynomial.eval`; Mathlib `Polynomial.derivative`.

**Checks.**

- `satake_even_F7`: Over 𝔽₇ with q=2, P=(T−2)(T−4)=T²+T+1 has P(q)=0, P′(q)=5 and P(−1)=1; it is level-raising special and intertwining generic.
- `satake_odd_F7`: Over 𝔽₇ with q=2, P=(T−1)(T−3)(T−5)=T³+5T²+2T−1 has P′(1)=1 and P(−2)=0; Tate genericity holds and intertwining genericity fails.
- `satake_collision`: P=(T−1)² at q=1 fails even specialness over a field. Over 𝔽₂, P=T−1 is odd Tate generic but P(−1)=0. Modulo π², having P(q)=0 only modulo π does not establish specialness modulo π².

### 1.4 unitaryHeckeEigenvalues

Prove `unitaryHeckeEigenvalues` as follows. For the unramified unitary group of rank N over the unramified quadratic local extension, normalize convolution by vol(K°)=1 and use the spherical Satake map of Construction 3.1.8. For reciprocal roots {aᵢ,aᵢ⁻¹}, the even-rank operator I° has value q^(r²)∏ᵢ(aᵢ+aᵢ⁻¹+2); (q+1)R°−I° has value −q^(r²)∏ᵢ(aᵢ+aᵢ⁻¹−q−q⁻¹). In odd rank 2r+1, I° has value q^(r²+r)∏ᵢ(aᵢ+aᵢ⁻¹+q+q⁻¹), and T° has value q^(r²+r)∏ᵢ(aᵢ+aᵢ⁻¹−2). Operators are the actual double-coset sums of §§B.2–B.4, including their transpose correspondences. (ltxzz, Construction 3.1.8; Propositions B.3.5 and B.4.3; ltxzz line 1086; ltxzz line 8157; ltxzz line 8400).

The hypotheses are q is invertible in the coefficient ring; roots are units with the displayed inverse pairing.

The proof uses the following chain. Apply the supplied spherical Satake isomorphism to the explicitly finite double-coset sums. The scalar identities follow from their symmetric root expressions; Propositions B.3.5 and B.4.3 supply the arithmetic normalization.

*Needs:* Layer 1 §1.3; contract gap `hecke-transfer`.

**Checks.**

- `hecke_rank2`: For r=1, q=3, a=3 in ℚ, I°=16 and (q+1)R°−I°=0. This fixes the negative product and volume normalization.
- `hecke_rank3`: For r=1, q=3, a=2 in ℚ, T°=9/2 and I°=105/2; the two operators are different.
- `hecke_bad_denominator`: The q⁻¹ formula is unavailable when q=0 in L; no division by q+1 is used to define the operators.

### 1.5 specialInertPlace

Define `specialInertPlace` as follows. For a CM extension F/F⁺ and a finite place v of F⁺, define special inertness by inertness in F, an odd underlying rational prime p unramified in F, and F⁺ᵥ≃ℚp. Define very special inertness by also requiring a place of F⁺rflx above v with the same completion ℚp; Fᵣflx is generated by F and the reflex fields of all CM types of F. (ltxzz, Definitions 3.3.1–3.3.4, p. 28; ltxzz line 1280; ltxzz line 1293).

The interface includes `verySpecialInert_isSpecial` (projection): Very special inertness implies special inertness; `verySpecialInert_of_reflexive` (comparison): When Fᵣflx=F the two predicates coincide; `specialInert_residue` (local form): A special inert place has Fᵥ the unramified quadratic extension of ℚp, with residue size p²; `specialInert_transport` (invariance): Field isomorphisms preserving the CM involution transport both predicates and their local embeddings.

The proof uses the following chain. The first two clauses are logical consequences; the local degree statement uses unramified local extensions and inertness. Reflexive closure is imported, not reconstructed.

*Needs:* contract gap `cm-reflex`.

**Checks.**

- `special_Qi_3`: For F=ℚ(i), v=(3) is very special inert, and the residue field in F has 9 elements.
- `special_Qi_split`: For ℚ(i), v=(5) is split and v=(2) is ramified and even; neither is special inert.
- `special_residue_degree`: An inert place with [F⁺ᵥ:ℚp]=2 fails special inertness even when p is odd and unramified; an empty excluded set does not remove this condition.

### 1.6 rankinSelbergAdmissible

Define `rankinSelbergAdmissible` as follows. For the standing relevant pair and strong field E, define admissibility of λ|ℓ by the seven independent clauses L1–L7 recorded below. Choose stable lattices Rα in ρΠα,λ(rα), of ranks nα, with (1−α)-polarizations Ξα; admissibility is invariant under their homotheties, polarization units and basis changes. L1: ℓ>4n and ℓ unramified in F. L2: no place above ℓ lies in Σ⁺min. L3: ρΠ₀,λ⊗ρΠ₁,λ is absolutely irreducible. L4: both factors are residually absolutely irreducible. L5-1: on R̄₀⊗R̄₁ either the residual image contains a scalar different from 1, or the module is semisimple, has dimension ≤min((ℓ+1)/2,ℓ−3), and HomΓF(End(R̄),R̄)=0. L5-2: over F⁺rflx the image of (ρ̄₀+,ρ̄₁+,ε̄ℓ) contains (γ₀,γ₁,ξ) with ξ²≠1, γα in the conjugate component of order prime to ℓ, eigenvalue 1 simple in hγ₀, hγ₁ and their tensor, and no eigenvalues −1 in hγ₀ or −ξ in hγ₁. Here hγ is the GL component of γ². L6: the even polarized residual representation is rigid for (Σ⁺min,∅) and stays absolutely irreducible over F(ζℓ). L7: both residual Hecke characters are cohomologically generic. (ltxzz, Definition 8.1.1 and Remark 8.1.2, pp. 131–132; ltxzz line 6368).

The interface includes `admissible_iff_clauses` (constructors and projections): Give separate constructors/projections L1–L7, L5-1 alternatives and the L5-2 image witness; no opaque big-image field; `admissible_change_basis` (invariance): Conjugation, lattice homothety and multiplying a polarization by a unit preserve the predicate; `admissible_polarized_tensor` (structure): R=R₀⊗R₁ has R^c≃R∨(1) and R_E≃Vλ since r₀+r₁=n; `admissible_not_small_prime` (negative criterion): No coefficient prime above ℓ≤4n is admissible.

The proof uses the following chain. Use the imported polarizable representation category, residual image and rigidity predicates. The tensor polarization adds the twists 1 and 0. Conjugacy transports all spectra and invariant Hom spaces.

*Needs:* Layer 1 §1.3; Layer 1 §1.5; contract gap `galois-realization`; contract gap `rigidity`; contract gap `cohomological-genericity`.

**Checks.**

- `admissible_n2_twist`: For n=2, (n₀,n₁,r₀,r₁)=(2,3,1,1); the tensor has rank 6 and total twist 2, and ℓ=3 fails L1.
- `admissible_scalar_identity`: The identity scalar alone never witnesses the first branch of L5-1; ξ=1 or −1 never witnesses L5-2, including over 𝔽₂ and 𝔽₃.
- `admissible_basis`: Replacing the two bases by invertible matrices changes the image witness by conjugation and leaves all seven truth values unchanged.
- `frobenius_inert_three`: Arithmetic Frobenius on Eλ(1) at a special inert p=3 place of F acts by 9; geometric Frobenius acts by 1/9.
- `polarization_square`: In the polarized disconnected group γ=(I,−1)c has GL component of γ² equal to −I.

### Examples

The ring examples include ramified mixed-characteristic DVRs, equal-characteristic DVRs and nonreduced congruence rings. Arithmetic admissibility itself uses finite extensions of ℚℓ, never these substitute coefficient rings.

### Dependencies

contract gap `coefficient-algebra`; ProfiniteCohomology Layers 1–3; Tau Ceti `TauCeti.ContCohomology.d0`; Tau Ceti `TauCeti.ContCohomology.H1`; Mathlib `Polynomial.eval`; Mathlib `Polynomial.derivative`; contract gap `hecke-transfer`; contract gap `cm-reflex`; contract gap `galois-realization`; contract gap `rigidity`; contract gap `cohomological-genericity`.

## Layer 2: Unitary integral models, incidence and the semistable product

### 2.1 unitaryLevelRaisingDatum

Define `unitaryLevelRaisingDatum` as follows. For N≥2 put r=⌊N/2⌋. Bundle a relevant Π, strong E, sets Σ⁺min⊇Σ⁺Π, Σ⁺lr of inert places strongly disjoint from Σ⁺min (their underlying rational supports are disjoint), and Σ⁺⊇Σ⁺min∪Σ⁺lr; λ|ℓ with no ℓ-adic place in Σ⁺min and ℓ∤Nv((Nv)²−1) for v∈Σ⁺lr; m≥1; a standard definite V° of rank N with self-dual lattice away from these sets and infinity; and neat K°, hyperspecial elsewhere, transferable at Σ⁺min and special maximal at Σ⁺lr in even rank, where V° is nonsplit. Include a special inert p, all auxiliary CM-moduli data of §§3.5/5.1 and an indefinite uniformization datum. Require P1: p-adic places avoid Σ⁺; P2: ℓ∤p(p²−1); P3: a CM type Φ containing τ∞ with Qp^Φ=ℚp²; P4: even PΠ,p is special modulo λᵐ, odd PΠ,p is Tate generic modulo λ; P5: PΠ,p is intertwining generic modulo λ; P6 in even rank: restriction of the congruence Hecke ideal away from p gives the same quotient of (OE/λᵐ)[Sh(V°,K°)] as the full ideal. Define mΠ and nΠ as contractions, to the algebra away from Σ⁺ and p, of the kernels of φΠ modulo λ and λᵐ. (ltxzz, §6.1 and Notation 6.1.3, pp. 106–107; ltxzz line 5136; ltxzz line 5164; ltxzz line 5195).

The interface includes `levelDatum_ext` (extensionality): Equality of the geometric, lattice, level, prime and coefficient fields determines equality; proof fields are irrelevant; `levelDatum_reduce` (coefficient change): For 1≤a≤m, reduction to λᵃ preserves the Satake equations and P6 by right exactness, with the corresponding reduced ideals; `levelDatum_ideal_maps` (evaluation): For a Hecke module M, M/nΠ is its actual quotient; M[mΠ] denotes the simultaneous annihilator and M_mΠ the localization, with distinct coercions and comparison maps; `levelDatum_changeLevel` (functoriality): Pullback/trace are defined for compatible neat levels; the target datum must separately satisfy P6, rather than inheriting it without proof.

The proof uses the following chain. Form a dependent structure using the native models and Hecke characters. Kernels and contractions produce its ideals. Reduction uses quotient tensor products, without identifying localization with the eigenspace.

*Needs:* Layer 1 §1.3; Layer 1 §1.5; contract gap `native-shimura`; contract gap `hecke-transfer`; contract gap `cm-reflex`.

**Checks.**

- `level_positive_exponent`: m=0 is outside the datum; m=1 makes nΠ the residual contracted ideal.
- `level_empty_lr`: Σ⁺lr=∅ is permitted and imposes no nonsplit condition there; p must still satisfy P1–P6.
- `level_not_scalar`: A congruence P(p)=0 modulo λ but not modulo λ² supplies an m=1 test datum and fails the m=2 condition; a wrong residual-only definition accepts it.

### 2.2 unitaryBasicCorrespondence

Construct `unitaryBasicCorrespondence` as follows. For the smooth standard-indefinite integral PEL model M at a special inert p, over the CM auxiliary base Tp, realize the source S and isogeny correspondence S←π B→ι M of §4.3. Over any field κ containing the residue field and s∈S(κ), B_s is smooth projective geometrically irreducible of dimension ⌊(N−1)/2⌋; ι is locally a closed immersion of codimension ⌊N/2⌋. Its tangent bundle is Hom(ωA∨,τ∞,ker α*,τ∞/ωA∨,τ∞) and its normal bundle is Hom(ωA∨,τ∞,im α*,τ∞). The fibre is the hermitian Frobenius incidence variety DL(V_s,{,}_s,⌈(N+1)/2⌉). (ltxzz, Definitions 4.3.1–4.3.4 and Theorem 4.3.5, pp. 38–41; ltxzz line 1788; ltxzz line 1871).

The interface includes `basicCorrespondence_representable` (structure): Represent S as finite étale over Tp and B by its isogeny moduli; the maps retain their universal quasi-p-isogeny; `basicCorrespondence_baseChange` (functoriality): The correspondence and tangent/normal identifications commute with residue-field extension and prime-to-p level maps; `basicCorrespondence_uniformize` (comparison): A definite uniformization datum identifies S with the actual definite unitary double quotient, compatibly with Hecke correspondences.

The proof uses the following chain. Use the native moduli problem to construct the quasi-isogeny, Grothendieck–Messing to compute its tangent and normal spaces, and the hermitian incidence variety to identify the fibre functor. Descent proves representability and uniformization.

*Needs:* contract gap `native-shimura`; contract gap `unitary-incidence`; contract gap `grothendieck-messing`.

**Checks.**

- `basic_N2`: For N=2 the fibre has dimension 0 and codimension 1 in a dimension-1 special fibre.
- `basic_N3`: For N=3 the fibre has dimension 1 and codimension 1 in a dimension-2 special fibre.
- `basic_empty_fibre`: Over the empty indexing scheme B is empty; no basis of functions on a nonempty invented finite set is introduced.

### 2.3 unitarySemistableStrata

Construct `unitarySemistableStrata` as follows. For the definite datum and CM-moduli data of §5.1, realize M with special components M° and M• and link M†=M°∩M• as scheme-theoretic strata. M is strictly semistable of relative dimension N−1; the reduced components are smooth and cover its special fibre. The balloon correspondence B°→M° is an isomorphism, with fibres ℙ(V_s) over points of S° in perfect residue fields; the link in a balloon fibre is the degree-(p+1) hermitian Fermat hypersurface. The link normal in the balloon component is O(p+1); its normal in the ground component is the dual O(−(p+1)). Over perfect residue fields κ, ground fibres B•_s are the projective smooth incidence varieties DL•(V_s,{,}_s), of dimension ⌊N/2⌋. Retain the tangent and normal maps from the universal isogenies, and the link fibre projective bundles of §5.5. (ltxzz, Theorems 5.2.5, 5.3.4, 5.4.4 and 5.5.3; Corollary 5.3.5, pp. 57–69; ltxzz line 2653; ltxzz line 2823; ltxzz line 2901; ltxzz line 2985).

The interface includes `semistableStrata_localEquation` (evaluation): At a link point the completed local ring is W(κ)[[x₁,…,xN]]/(x₁xN−p); away from the link it is formally smooth; `semistableStrata_baseChange` (functoriality): Strata, universal isogenies and their incidence maps commute with compatible level and residue-field changes; `semistableStrata_genericFiber` (comparison): After the specified indefinite uniformization choice, Mη≃Sh(V′,jK^pK′p)×F Tη; prove compatibility with specialization in ordinary and compact supports, including nonproper models.

The proof uses the following chain. The pairing on crystalline Dieudonné modules is diag(p,1,…,1). Orthogonal Hodge lifts give xy=p. Universal isogenies identify the two incidence fibres and their normal bundles. The generic-fibre moduli interpretation and specialization follow from the native-model comparison contract.

*Needs:* Layer 2 §2.1; contract gap `unitary-incidence`; contract gap `grothendieck-messing`.

**Checks.**

- `strata_node`: For N=2 the link chart has xy=p, two multiplicity-one components at p=0 and a zero-dimensional intersection.
- `strata_normal_sign`: For p=3 and N=3 the link in ℙ² is a smooth quartic: its normal O(4) has degree 16; the ground normal O(−4) has degree −16. Exchanging the two reverses the self-intersection sign.
- `strata_generic`: After inverting p, xy=p is smooth and has no special-fibre link; retaining a singular generic-fibre link fails the test.

### 2.4 unitaryLinkAndIntersection

Prove `unitaryLinkAndIntersection` as follows. For the strata of 2.3 and p-coprime coefficient L, balloon and link cohomology are free L-modules. If p+1 is a unit, restriction Hⁱ(M°)→Hⁱ(M†) is an isomorphism except in degrees N−2 and 2N−2. In even rank, Frobenius on Hᴺ⁻²(M†,L((N−2)/2)) is trivial. For two ground fibres over a perfect κ, their fibre product decomposes by relative positions 0≤j≤⌊N/2⌋−1 into DL• incidence varieties. The corresponding link indexing set has ∏_{i=1}^{⌊N/2⌋−j}(p^(2i−1)+1) points, and each link intersection fibre is ℙ of a vector space of dimension ⌊N/2⌋−j. The excess bundle on it is σ*H⊗O(1), with H the tautological subbundle. (ltxzz, Lemma 5.6.2; Theorems 5.7.7–5.7.8, pp. 71, 75–78; ltxzz line 3349; ltxzz line 3518; ltxzz line 3722).

The proof uses the following chain. Apply the incidence variety cohomology and projective-bundle formula fibrewise. Relative positions classify the isogeny fibre product, and the tangent cokernel identifies its excess intersection bundle.

*Needs:* Layer 2 §2.3; contract gap `unitary-incidence`; EtaleCohomologyFoundations §F.6; EtaleCohomologyFoundations §F.7.

**Checks.**

- `link_minimal`: When ⌊N/2⌋−j=1 the link index has p+1 points and each projective fibre is ℙ⁰.
- `link_degree_bad`: When ℓ divides p+1 the asserted restriction isomorphism is not exported; freeness and the geometric degree statement retain their separate domains.

### 2.5 unitaryIncidenceWeightComplex

Construct `unitaryIncidenceWeightComplex` as follows. For 2.3 define the six incidence Gysin/restriction maps by pullback from S°,S•, powers of the positive hyperplane class and pushforward from B°,B•. Form the weight spectral sequence of RΨL(r), with columns −1,0,1: E₁⁻¹,ᵠ=Hᵠ⁻²(M†,L(r−1)), E₁⁰,ᵠ=Hᵠ(M°⊔M•,L(r)), E₁¹,ᵠ=Hᵠ(M†,L(r)). Use d₁⁻¹=(m†°!,−m†•!) and d₁⁰=m†°*−m†•*. For even rank retain the increasing filtration F₋₁≃E₂¹,²ʳ⁻², gr₀≃H²ʳ⁻¹(M•,L(r)), gr₁≃E₂⁻¹,²ʳ and monodromy induced by the identity of H²ʳ⁻²(M†,L(r−1)). Define ∇₁ on E₂⁰,²ʳ and ∇₀ on ker d₁⁰,²ʳ by the linear combinations in Construction 5.9.4, preserving T°•,T•° and the factors (p+1)² and p+1. (ltxzz, Constructions 5.8.3, 5.9.1, 5.9.4; Lemmas 5.9.2–5.9.3, pp. 79–87; ltxzz line 4023; ltxzz line 4055; ltxzz line 4110; ltxzz line 4213).

The interface includes `weightComplex_incidenceMatrix` (evaluation): In odd rank the pairing matrix is [[1,0,0],[0,−(p+1)²,T°•],[0,T•°,T•]]. In even rank the monodromy-incidence matrix is [[p+1,(p+1)²,−T°•],[(p+1)²,(p+1)³,−(p+1)T°•],[−T•°,−(p+1)T•°,R•]] for N≥4, with middle row/column zero in the N=2 variant except the displayed corner terms; `weightComplex_singularSequence` (universal property): If p²−1 is a unit, 0→F₋₁H¹(I,H²ʳ⁻¹(RΨL(r)))→H¹sing→H²ʳ⁻¹(M•,L(r−1))_F→0; `weightComplex_functorial` (functoriality): The maps are Hecke equivariant and commute with compatible coefficient/level maps; ∇₁ kills boundaries and factors through Frobenius coinvariants.

The proof uses the following chain. Apply the imported weight spectral sequence to the actual strata. The excess intersection and normal-bundle computations in 2.4 compute each matrix entry. The filtration and singular sequence follow by inertia cohomology with the stated Frobenius exclusions.

*Needs:* Layer 1 §1.4; Layer 2 §2.4; contract gap `nearby-weight`.

**Checks.**

- `incidence_sign`: For the two-component node, the alternating restriction sends (a,b) to a−b; its value on (1,0) is 1 and on (0,1) is −1.
- `incidence_scalar`: At p=3 the odd middle diagonal entry is −16 and the first even diagonal entry is 4; swapping the sign or deleting the degree factor fails.
- `incidence_identity_mono`: The monodromy map from the extreme graded term is induced by the identity on link cohomology, with its displayed Tate twist; it is zero on F₀.

### 2.6 unitaryProductResolution

Construct `unitaryProductResolution` as follows. For compatible rank-n and rank-(n+1) semistable data, form P=M_n×Tp M_n+1 and Q=Bl_{P°°}P, with its strict transforms and the strict transform QΔ of the diagonal graph. Q is strictly semistable of relative dimension 2n−1, with four component strata and a weight sequence in columns −2,…,2. On mixed component pairs σ is an isomorphism; on the two equal component pairs it is the blowup of P††, and Q††→P†† is a trivial ℙ¹-bundle. Its cohomology has the pullback summand and the exceptional summand Hⁱ⁻²(P††,Oλ(−1)); specialization to nearby cycles is an isomorphism for both ordinary and compact supports. (ltxzz, Notation 5.11.1 and Lemmas 5.11.2–5.11.3, pp. 97–99; ltxzz line 4710).

The interface includes `productResolution_ext` (universal property): Maps to Q are maps to P on which the center ideal becomes invertible, using the native blowup universal property; `productResolution_cycle` (cycle compatibility): QΔ is the strict transform of the finite graph cycle, with generic fibre unchanged and pushforward σ*[QΔ]=[PΔ]; `productResolution_coefficient` (functoriality): The cohomological decompositions, Gysin and traces commute with coefficient reduction and compatible neat level maps.

The proof uses the following chain. Compute blowup charts on the product xy=p,uv=p. Identify the component strict transforms and use the projective/blowup formulas. The generic-fibre comparison contract includes the nonproper specialization case.

*Needs:* Layer 2 §2.3; Layer 2 §2.5; EtaleCohomologyFoundations §F.7; contract gap `native-shimura`; contract gap `nearby-weight`.

**Checks.**

- `product_dimension`: For n=2 the generic product and Q have dimension 3 and the graph has dimension 1, hence codimension 2.
- `product_exception`: Over one geometric point of P††, the exceptional fibre is ℙ¹ and contributes one extra class in degree 2 with twist −1; dropping this class changes the rank.
- `product_off_center`: On the complement of the center the blowup map is the identity; an empty center gives Q=P.

### Examples

At a link point the completed equation xy=p has special fibre xy=0. For p=3, the link normal in the balloon component is O(4), and its normal in the ground component is the dual O(−4). These computations fix component order, multiplicities and the Chern-class orientation.

### Dependencies

Layer 1 §1.3; Layer 1 §1.5; contract gap `native-shimura`; contract gap `hecke-transfer`; contract gap `cm-reflex`; contract gap `unitary-incidence`; contract gap `grothendieck-messing`; EtaleCohomologyFoundations §F.6; EtaleCohomologyFoundations §F.7; Layer 1 §1.4; contract gap `nearby-weight`.

## Layer 3: Odd Tate cycles and even integral arithmetic level raising

### 3.1 localizedUnitaryCohomology

Prove `localizedUnitaryCohomology` as follows. For 2.1, residual absolute irreducibility identifies compactly supported and ordinary localized cohomology of the indefinite generic fibre and the ground stratum, in every degree. Under intertwining genericity the two special-maximal-level intertwiners on definite functions are isomorphisms. Under cohomological genericity, localized nearby cohomology is concentrated in degree N−1 and free there; this latter conclusion uses the derived integral reduction comparison. (ltxzz, Lemmas 6.1.9–6.1.11 and Remark 6.1.5, pp. 107–109; ltxzz line 5206; ltxzz line 5221; ltxzz line 5247).

The proof uses the following chain. Residual irreducibility excludes boundary isobaric constituents; the local intertwining factors are units by 1.4. The universal coefficient sequence and Nakayama convert residual concentration to integral concentration and freeness.

*Needs:* Layer 2 §2.1; Layer 2 §2.5; contract gap `galois-realization`; contract gap `cohomological-genericity`; contract gap `boundary-cohomology`; EtaleCohomologyFoundations §F.4.4.

### 3.2 oddTateCycleComparison

Prove `oddTateCycleComparison` as follows. For 2.1 with N=2r+1, ∇₁:E₂⁰,²ʳ_mΠ→Oλ[Sh(V°,K°)]_mΠ is surjective. If A6.1.4 (integral nearby cohomology concentrated in degree N−1 and free there), A6.1.6 (residual absolute irreducibility) and H(N) hold, then E₂ is supported only at (0,2r), is free there, and ∇₁ induces an isomorphism from its arithmetic-Frobenius coinvariants. The middle term is weakly semisimple and its residual generalized Frobenius eigenvalues are roots of PΠ,p modulo λ. (ltxzz, Lemma 6.2.2 and Theorem 6.2.3, p. 109; ltxzz line 5295; ltxzz line 5304).

The hypotheses are The unconditional surjectivity uses only the §6.1 datum; the additional conclusions require A6.1.4, A6.1.6 and H(N).

The proof uses the following chain. Compute the odd incidence determinant using 1.4, 2.5 and Tate/intertwining genericity. Concentration kills all other E₂ terms. H(N) identifies the residual eigenvalues; the rank-one invariant factor and 1.2 give weak semisimplicity and the coinvariant isomorphism.

*Needs:* Layer 1 §1.2; Layer 2 §2.5; Layer 3 §3.1; contract gap `automorphic-multiplicity`.

### 3.3 evenIntegralFreeness

Prove `evenIntegralFreeness` as follows. Under the even hypotheses, every Hⁱ(M•,Oλ)_mΠ is free; E₂ᵃ,ᵇ_mΠ is free and zero outside {(-1,2r),(0,2r−1),(1,2r−2)}. (ltxzz, Theorem 6.3.5(1)–(2), pp. 115–116; ltxzz line 5634).

The hypotheses are N=2r; datum 2.1; A6.1.4 and A6.1.6; H(N); ℓ>2(N+1), ℓ unramified in F; even residual extension rigid for (Σ⁺min,Σ⁺lr), absolutely irreducible over F(ζℓ); residual Hecke character cohomologically generic; localized definite functions nonzero.

The proof uses the following chain. Use the rigid R=T isomorphisms for the unramified, mixed and ramified deformation problems. The common quotient Runr⊗Rmix Rram measures the congruence. Compare free multiplicities by the old-form dimension formula; then eliminate integral torsion in the middle ground cohomology and read the three-column complex.

*Needs:* Layer 2 §2.5; Layer 3 §3.1; contract gap `rigid-r-equals-t`; contract gap `old-form-dimension`.

### 3.4 evenFrobeniusExclusion

Prove `evenFrobeniusExclusion` as follows. Under the even hypotheses, if {aᵢ,aᵢ⁻¹} are the roots of residual PΠ,p, the residual generalized Frobenius eigenvalues of H²ʳ⁻¹(M•,Oλ(r))_mΠ lie in {p aᵢ,p aᵢ⁻¹} with 1 and p² excluded. (ltxzz, Theorem 6.3.5(3), p. 116; ltxzz line 5647).

The hypotheses are N=2r; datum 2.1; A6.1.4 and A6.1.6; H(N); ℓ>2(N+1), ℓ unramified in F; even residual extension rigid for (Σ⁺min,Σ⁺lr), absolutely irreducible over F(ζℓ); residual Hecke character cohomologically generic; localized definite functions nonzero.

The proof uses the following chain. Compare local constituents in the ground stratum with the supplied local unitary classification, and remove the level-raising eigenpair using the actual congruence deformation quotient.

*Needs:* Layer 3 §3.3; Layer 1 §1.4; contract gap `local-unitary-representations`.

### 3.5 evenSingularComparison

Prove `evenSingularComparison` as follows. Under the even hypotheses, ∇₀ induces F₋₁H¹(Iℚp²,H²ʳ⁻¹(M,RΨOλ(r))/nΠ)≃Oλ[Sh(V°,K°)]/nΠ. The natural map from this filtered inertia group to H¹sing(ℚp²,H²ʳ⁻¹(M,RΨOλ(r))/nΠ) is also an isomorphism. Both use quotient nΠ, not an eigen-submodule or rational isotypic projection. (ltxzz, Theorem 6.3.5(4), p. 116; ltxzz line 5650).

The hypotheses are N=2r; datum 2.1; A6.1.4 and A6.1.6; H(N); ℓ>2(N+1), ℓ unramified in F; even residual extension rigid for (Σ⁺min,Σ⁺lr), absolutely irreducible over F(ζℓ); residual Hecke character cohomologically generic; localized definite functions nonzero.

The proof uses the following chain. Use the monodromy presentation of 2.5, the congruence quotient in 3.3 and Frobenius exclusions in 3.4. The remaining ground-stratum coinvariants vanish, giving the singular comparison.

*Needs:* Layer 3 §3.3; Layer 3 §3.4; Layer 2 §2.5.

### 3.6 evenCongruenceGaloisRealization

Prove `evenCongruenceGaloisRealization` as follows. Under the even hypotheses there is μ≥1 and an Oλ[ΓF]-isomorphism H²ʳ⁻¹ét(Sh(V′,jK^pK′p)_Fbar,Oλ(r))/nΠ≃(R̄⁽ᵐ⁾,c)^⊕μ, where R is a stable lattice in ρΠ,λ(r), unique up to homothety. The conclusion asserts existence of a multiplicity and an isomorphism; it does not select a canonical summand. (ltxzz, Theorem 6.3.5(5), p. 116; ltxzz line 5655).

The hypotheses are N=2r; datum 2.1; A6.1.4 and A6.1.6; H(N); ℓ>2(N+1), ℓ unramified in F; even residual extension rigid for (Σ⁺min,Σ⁺lr), absolutely irreducible over F(ζℓ); residual Hecke character cohomologically generic; localized definite functions nonzero.

The proof uses the following chain. The free ramified Hecke cohomology module and its universal Galois representation specialize through nΠ. H(N) fixes complex conjugation and the twist; residual absolute irreducibility identifies its lattice up to homothety.

*Needs:* Layer 3 §3.5; contract gap `rigid-r-equals-t`; contract gap `automorphic-multiplicity`.

### 3.7 oddSpecialLevelChange

Prove `oddSpecialLevelChange` as follows. For standard indefinite odd rank n₁, self-dual level away from Σ⁺min, and a finite set P of special inert places with distinct rational supports outside Σ⁺min, assume H(n₁), intertwining genericity at every p∈P and cohomological genericity. The localized Oλ[ΓF]-cohomology at a hyperspecial level is isomorphic in every degree to that at any special maximal level at P. (ltxzz, Lemma 8.1.7, pp. 133–134; ltxzz line 6489).

The proof uses the following chain. Change one local factor at a time. The two intertwining maps compose to I°, a unit after localization; supplied local representation theory shows both invariant spaces occur in the same constituent.

*Needs:* Layer 3 §3.1; Layer 3 §3.2; contract gap `automorphic-multiplicity`.

### Examples

Odd rank has a coinvariant comparison. Even rank has a singular comparison and three E₂ positions. The two conclusions are not interchangeable, even in ranks 2 and 3.

### Dependencies

Layer 2 §2.1; Layer 2 §2.5; contract gap `galois-realization`; contract gap `cohomological-genericity`; contract gap `boundary-cohomology`; EtaleCohomologyFoundations §F.4.4; Layer 1 §1.2; contract gap `automorphic-multiplicity`; contract gap `rigid-r-equals-t`; contract gap `old-form-dimension`; Layer 1 §1.4; contract gap `local-unitary-representations`.

## Layer 4: Diagonal cycles and Selmer-valued Abel–Jacobi classes

### 4.1 diagonalUnitaryDatum

Define `diagonalUnitaryDatum` as follows. For the standing pair, take a standard indefinite V_n with signatures (n−1,1) at τ∞ and (n,0) elsewhere, and V_n+1=V_n⊕⟨1⟩. Choose self-dual adelic lattices away from Σ⁺min and compatible neat levels (K_n,K_n+1), hyperspecial away from Σ⁺min, with K_n contained in K_n+1 under U(V_n)→U(V_n+1). Include the native finite map sh↑:Sh_n→Sh_n+1. Transferability of even local levels at Σ⁺min is a separate predicate, required for the rank-one theorem. (ltxzz, §8.3 and Theorem 8.3.2, p. 139; ltxzz line 6755; ltxzz line 6773).

The interface includes `diagonalDatum_ext` (extensionality): Compatible isometries of hermitian spaces and lattices with equal transported levels identify data and the finite map; `diagonalDatum_refine` (functoriality): Compatible refinement produces a cartesian level diagram with its actual finite covering degrees; `diagonalDatum_product` (evaluation): X=Sh_n×F Sh_n+1 has dimension 2n−1; the source Sh_n has dimension n−1.

The proof uses the following chain. Restrict the native unitary Shimura functor along the norm-one embedding and compatible levels; use its dimension theorem. No substitute finite-set model is permitted.

*Needs:* contract gap `native-shimura`; contract gap `hecke-transfer`.

**Checks.**

- `diagonal_n2`: For n=2, dimensions (1,2,3) give codimension 2 for the graph, not 1.
- `diagonal_level_failure`: Levels without K_n⊆K_n+1 do not define sh↑ and cannot form a datum.
- `diagonal_identity_transport`: The identity isometry and unchanged levels induce the identity of X and its graph cycle.

### 4.2 diagonalGraphCycle

Construct `diagonalGraphCycle` as follows. For 4.1 construct Δ=[Graph(sh↑)]∈Zⁿ(X), its Chow class and its absolute étale cycle class in H²ⁿét(X,Oλ(n)), with Eλ realization. Retain graph multiplicities and proper pushforward under compatible finite level maps. (ltxzz, Construction 4.6.1(3) and §8.3, pp. 53, 139; ltxzz line 2508; ltxzz line 6764).

The interface includes `diagonalGraphCycle_support` (evaluation): Its underlying closed subscheme is the image of (id,sh↑), with the scheme multiplicities of the native graph; `diagonalGraphCycle_pushforward` (functoriality): For compatible finite covers, pushing forward the graph at the refined level gives its covering degree times the graph downstairs; `diagonalGraphCycle_class` (comparison): The Chow-to-étale class agrees with Gysin of the unit class along the graph and commutes with coefficient maps.

The proof uses the following chain. Use native graph closed immersion, cycle multiplicities, proper pushforward and the imported cycle class/Gysin construction.

*Needs:* Layer 4 §4.1; EtaleCohomologyFoundations §§0.9–0.11; EtaleCohomologyFoundations §F.6; contract gap `chow-abel-jacobi`.

**Checks.**

- `graph_zero_cycle`: The zero cycle maps to zero; linear extension sends Δ−Δ to zero in Chow and étale cohomology.
- `graph_degree_two`: A degree-2 compatible cover pushes the refined graph to 2Δ; a degree-free formula fails.
- `graph_point`: On the zero-dimensional graph test Spec k→Spec k the class is 1 with trace 1, pinning the positive Gysin orientation.

### 4.3 projectedDiagonalAbelJacobi

Construct `projectedDiagonalAbelJacobi` as follows. For 4.1 and H(n),H(n+1), localize at the two cuspidal Hecke characters and quotient by I=(ker φΠ₀,ker φΠ₁). Prove rational geometric cohomology vanishes outside degree 2n−1. The Hochschild–Serre edge map therefore sends each codimension-n cycle, in particular Δ, to H¹(F,Wλ), where Wλ=H²ⁿ⁻¹ét(X_Fbar,Eλ(n))/I. Define AJλ(Δ) by the absolute class followed by this edge identification; use the integral edge map at congruence levels only under the separate integral concentration/freeness hypotheses. (ltxzz, §8.3 preceding (8.10); §7.2 preceding Corollary 7.2.9, pp. 126,139; ltxzz line 6152; ltxzz line 6767).

The interface includes `projectedAJ_add` (linearity): The regulator is additive in cycles and Eλ-linear after tensoring; `projectedAJ_edge` (characterisation): Its image under the inverse edge identification is the Hecke-projected absolute cycle class; `projectedAJ_reduce` (coefficient compatibility): Where integral concentration holds, the integral regulator reduces to the corresponding congruence regulator; rational and integral quotients are connected by their natural maps.

The proof uses the following chain. Use cohomological realization of the cuspidal Hecke quotient, Künneth and the arithmetic Hochschild–Serre spectral sequence. Its single nonzero geometric row identifies degree 2n with H¹ of degree 2n−1.

*Needs:* Layer 4 §4.2; contract gap `automorphic-multiplicity`; contract gap `chow-abel-jacobi`; contract gap `hochshild-serre-adic`; EtaleCohomologyFoundations §F.2.6; EtaleCohomologyFoundations §F.4.5.

**Checks.**

- `aj_zero`: AJ(0)=0 and AJ(Δ−Δ)=0.
- `aj_twist_degree`: For n=2 the target is H¹(F,H³ét(X_Fbar,Eλ(2))/I); using H⁴ as the coefficient degree fails the edge-degree test.
- `aj_no_concentration`: For ℙ¹, the degree-1 point class is not an Abel–Jacobi class in H¹(F,H¹(ℙ¹bar,Eλ(1)))=0; this prevents an edge construction for arbitrary cycles without concentration.

### 4.4 rankinSelbergPurityAndSelmer

Prove `rankinSelbergPurityAndSelmer` as follows. The standing representation Vλ is pure of weight −1 at every finite w∤ℓ. For the diagonal datum, H(n),H(n+1), and λ with Σ⁺min∩Σ⁺ℓ=∅, AJλ(Δ) belongs to H¹_f(F,Wλ). Away from ℓ use the weight −1 local vanishing with conjugate-dual polarization, and above ℓ use the crystalline regulator comparison for the actual smooth integral model. (ltxzz, Lemma 8.1.6 and proof of Theorem 8.3.2, pp. 133,139–140; ltxzz line 6484; ltxzz line 6796).

The proof uses the following chain. Tempered local-global compatibility gives purity; (n₀−1)+(n₁−1)−2n=−1. The local finite regulator theorem and good reduction only at w|ℓ establish the finite conditions. At all other places the self-dual pure weight −1 representation has vanishing rational local H¹.

*Needs:* Layer 4 §4.3; contract gap `selmer-local`; contract gap `purity-crystalline-regulator`; contract gap `galois-realization`.

### 4.5 diagonalMultiplicityRealization

Prove `diagonalMultiplicityRealization` as follows. Under H(n),H(n+1), realize Wλ as a finite direct sum of copies of Vλ^c, compatibly with the two Hecke characters and twists. Complex conjugation induces H¹_f(F,Vλ^c)≃H¹_f(F,Vλ), so H¹_f(F,Wλ) is isomorphic to a finite multiplicity of H¹_f(F,Vλ). When AJλ(Δ)≠0, some coordinate under any chosen such isomorphism is nonzero. No canonical single coordinate or canonical vector of H¹_f(F,Vλ) is asserted. (ltxzz, Hypothesis 3.2.10; §8.3, pp. 28,139–140; Lemma 2.4.5, p. 17; ltxzz line 1259; ltxzz line 745; ltxzz line 6805).

The proof uses the following chain. Use the automorphic multiplicity spaces and Künneth, retaining the c in H(N). The Selmer functor preserves finite sums and conjugation; a nonzero tuple has a nonzero component.

*Needs:* Layer 4 §4.3; Layer 4 §4.4; contract gap `automorphic-multiplicity`; contract gap `selmer-local`.

### 4.6 diagonalRegulatorNaturality

Prove `diagonalRegulatorNaturality` as follows. For compatible finite level maps and scalar extensions Eλ→E′λ′, the projected graph regulator commutes with pullback, trace and the induced Hecke quotient maps, whenever the corresponding data satisfy their concentration hypotheses. In a cartesian refinement of degree d, trace(AJ(Δ′))=d AJ(Δ). Scalar extension is through the actual base-changed representations and multiplicity spaces. (ltxzz, Constructions 4.6.1, 5.10.1 and §8.3; ltxzz line 2488; ltxzz line 6767).

The proof uses the following chain. Apply the naturality of cycle classes and Hochschild–Serre to the graph correspondence; proper pushforward supplies the covering degree. Map the actual kernel ideals rather than identifying unrelated eigenspaces.

*Needs:* Layer 4 §4.2; Layer 4 §4.3; EtaleCohomologyFoundations §F.4.6; contract gap `chow-abel-jacobi`; contract gap `hochshild-serre-adic`.

### Examples

The rank-(2,3) product has dimension 3, its graph has dimension 1 and codimension 2, and its Abel–Jacobi coefficient degree is 3 with twist 2. Multiplicity spaces remain visible.

### Dependencies

contract gap `native-shimura`; contract gap `hecke-transfer`; EtaleCohomologyFoundations §§0.9–0.11; EtaleCohomologyFoundations §F.6; contract gap `chow-abel-jacobi`; contract gap `automorphic-multiplicity`; contract gap `hochshild-serre-adic`; EtaleCohomologyFoundations §F.2.6; EtaleCohomologyFoundations §F.4.5; contract gap `selmer-local`; contract gap `purity-crystalline-regulator`; contract gap `galois-realization`; EtaleCohomologyFoundations §F.4.6.

## Layer 5: First geometric and explicit reciprocity laws

### 5.1 firstReciprocityDatum

Define `firstReciprocityDatum` as follows. Bundle the standing pair; λ|ℓ with Σ⁺min avoiding ℓ, ℓ>2(n₀+1) and ℓ unramified in F; m≥1; Σ⁺lr,I inert with rational support disjoint from Σ⁺min and ℓ∤Nv((Nv)²−1); Σ⁺I containing both; definite V°_n⊂V°_n+1 with added line ⟨1⟩, self-dual lattices away from these sets; compatible neat K°_sp,K°_n,K°_n+1, with K°_sp=K°_n on Σ⁺min and K°_sp⊆K°_n on Σ⁺lr,I; even local V nonsplit and K special maximal at Σ⁺lr,I, transferable at Σ⁺min. Include special inert p and the CM-moduli and uniformization data of §§5.1/5.10. PI1: all p-adic places avoid Σ⁺I. PI2: ℓ∤p(p²−1). PI3: Φ contains τ∞ and Qp^Φ=ℚp². PI4: even Satake is special modulo λᵐ and odd Satake Tate generic modulo λ. PI5: both are intertwining generic modulo λ. PI6: restricting the two Hecke ideals away from p preserves the two nonzero congruence function quotients. PI7: the tensor Satake polynomial is special modulo λᵐ. Define mα,nα as the contracted residual and λᵐ kernels of the actual φΠα. (ltxzz, §7.2 and Notation 7.2.1, pp. 120–121; ltxzz line 5835; ltxzz line 5875; ltxzz line 5899).

The interface includes `firstDatum_to_levelDatum` (constructor): Extract a rank-nα datum of 2.1, with the chosen compatible levels and actual contracted ideals; `firstDatum_ext` (extensionality): Isometries preserving lattices, levels, CM data and Hecke characters transport the datum; `firstDatum_testModule` (evaluation): Define Aα=Oλ[Sh°_nα]/nα and Bα=(Oλ/λᵐ)[Sh°_nα][nα]; the summation pairing A₀⊗A₁ × B₀⊗B₁→Oλ/λᵐ uses no division by set cardinalities; `firstDatum_reduce` (functoriality): Reduction to 1≤a≤m transports equations, nonzero quotients and PI6 with the corresponding ideals.

The proof uses the following chain. Construct the levels and ideals on the native Shimura sets. Tensor Satake specialness is checked separately from the two factors. The finite-set pairing descends because nα annihilates the test module.

*Needs:* Layer 2 §2.1; Layer 2 §2.6; Layer 1 §1.3; contract gap `native-shimura`.

**Checks.**

- `first_tensor_not_factors`: Over 𝔽₁₁, q=2, even roots {2,6} and odd roots {1,4,3} satisfy individual specialness/Tate and intertwining genericity, but tensor eigenvalue 2 occurs twice (2·1=6·4); PI7 fails.
- `first_point_pairing`: For a singleton graph and f=1 the sum pairing equals 1; a two-point fibre pushed onto the same pair contributes 2.
- `first_zero_localization`: A zero congruence function quotient fails PI6; the datum cannot certify an arithmetic level-raising theorem using empty automorphic support.

### 5.2 firstGeometricReciprocity

Prove `firstGeometricReciprocity` as follows. For compatible prime-to-p levels in the special subcategory of §5.10 and any p-coprime coefficient ring L, the intersection of the ground graph P•Δ with the incidence cycles has the following three descriptions. Pairing with inc•†!(f) equals the graph sum of T•°_n₁,p f; pairing with inc••!(f) equals the graph sum of T•_n₁,p f. Pairing with inc•†!((T•°_n₀,p⊗I°_n₁,p)f)+(p+1)² inc••!((T•°_n₀,p⊗T•°_n₁,p)f) equals the definite graph sum of (I°_n₀,p⊗T°_n₁,p)f. Each graph sum uses the source special level and the two maps sh•↓,sh•↑ or sh°↑, with the source T-trace. (ltxzz, Theorem 5.11.5(1)–(3), pp. 101–102; ltxzz line 4899).

The proof uses the following chain. Identify the Cartesian isogeny diagrams for the special homomorphism and use the excess intersection bundle. Pushforward/pullback and the Hecke correspondences turn each intersection into its actual fibre sum.

*Needs:* Layer 1 §1.4; Layer 2 §2.4; Layer 2 §2.6; Layer 4 §4.2; contract gap `unitary-special-compatibility`.

### 5.3 productCohomologyConcentration

Prove `productCohomologyConcentration` as follows. Under the first-law hypotheses the localized product spectral sequence has only E₂ positions (−1,2n),(0,2n−1),(1,2n−2); they are respectively the tensor products of the three even E₂ terms with the odd middle E₂ term. After twist −1 a trivial Frobenius subquotient can occur only in column 1. Even-degree twisted cohomology of every product and resolved stratum is weakly semisimple. Hⁱ(Q,RΨOλ) vanishes off 2n−1, and the compact-support to ordinary maps on its strata are isomorphisms. (ltxzz, Lemma 7.2.5 and Remark 7.2.6, pp. 121–123; ltxzz line 5931).

The hypotheses are Datum 5.1; A7.1.1: both factors residually absolutely irreducible; A7.2.2: even polarized residual representation rigid for (Σ⁺min,Σ⁺lr,I) and absolutely irreducible over F(ζℓ); A7.2.3: for each α localized RΨOλ cohomology vanishes off nα−1 and is finite free there; A7.2.4: even residual Hecke character cohomologically generic; H(n),H(n+1).

The proof uses the following chain. Use freeness to remove Künneth Tor terms, then the blowup decomposition to compare spectral sequences. PI7 excludes the unwanted product eigenvalues. Apply 1.2 to subquotients and finite sums; boundary vanishing supplies the support comparison.

*Needs:* Layer 1 §1.2; Layer 2 §2.6; Layer 3 §3.2; Layer 3 §3.3; Layer 3 §3.4; Layer 3 §3.1; EtaleCohomologyFoundations §F.2.6.

### 5.4 diagonalCycleBoundaryComparison

Construct `diagonalCycleBoundaryComparison` as follows. Under the first-law hypotheses, write B^r=ker[H²ʳ(Q(0),L(r))→H²ʳ(Q(1),L(r))] and B_r=coker[H²⁽²ⁿ⁻ʳ⁻²⁾(Q(1),L(2n−r−2))→H²⁽²ⁿ⁻ʳ⁻¹⁾(Q(0),L(2n−r−1))], with alternating restrictions and Gysin maps. Let B^r_0 and B_(2n−r−1),0 be the kernel and cokernel of the tautological map B^r→B_(2n−r−1). Define potentialSource(r)=(B_(2n−r),0)^F and potentialTarget(r)=(B^r_0)_F, where superscript F means invariants and subscript F means coinvariants for arithmetic Frobenius. The composite δ₁!δ₀* induces the potential map Δ^r:potentialSource(r)→potentialTarget(r), by taking invariants on its source and then projecting its target to coinvariants. For r=n and L=Oλ construct H¹sing(ℚp²,H²ⁿ⁻¹(Q,RΨOλ(n))_(m₀,m₁))≃coker Δ^n_(m₀,m₁), sending ∂AJ_Q(Qη_sp) to the image of cl(Q_sp). The source and target of this map are actual subquotients of the stratum complex. (ltxzz, Equation (5.28); Proposition 7.2.7, pp. 104–105,123–124; ltxzz line 5076; ltxzz line 6024).

The hypotheses are Datum 5.1; A7.1.1: both factors residually absolutely irreducible; A7.2.2: even polarized residual representation rigid for (Σ⁺min,Σ⁺lr,I) and absolutely irreducible over F(ζℓ); A7.2.3: for each α localized RΨOλ cohomology vanishes off nα−1 and is finite free there; A7.2.4: even residual Hecke character cohomologically generic; H(n),H(n+1).

The interface includes `cycleBoundary_presentation` (universal property): Use actual kernels, images and cokernels of the restriction/Gysin maps; provide the quotient map and its factorization criterion; `cycleBoundary_compare_cycle` (evaluation): For Q_sp the image of the integral cycle class equals the singular localization of its regulator; `cycleBoundary_naturality` (functoriality): The comparison commutes with coefficient and compatible level maps preserving the concentration hypotheses.

The proof uses the following chain. Use 5.3 to verify the three integral conditions of the semistable boundary comparison: E₂ concentration, Frobenius exclusion and weak semisimplicity. The edge connecting homomorphism gives the asserted value on Q_sp.

*Needs:* Layer 2 §2.5; Layer 5 §5.3; Layer 4 §4.3; contract gap `semistable-boundary`; contract gap `potential-map-notation`.

**Checks.**

- `boundary_zero`: The zero cycle gives zero on both sides.
- `boundary_sign`: For the two-term toy complex O→O with differential multiplication by π², the cokernel class of π has exponent 1; replacing the actual boundary by zero gives infinity.
- `boundary_reduction`: Reducing a boundary class modulo π preserves its image in the reduced cokernel, even when tensoring its kernel is not left exact.
- `potential_invariants_coinvariants`: For F=[[1,1],[0,1]] over 𝔽₃, the natural map invariants→coinvariants is zero, although both have dimension 1. The target of the potential map is a coinvariant quotient; treating invariant and coinvariant lines as canonically interchangeable fails this test.

### 5.5 firstExplicitReciprocity

Prove `firstExplicitReciprocity` as follows. Under the first-law hypotheses, the map ∇ from the actual cycle-boundary target annihilates the image of Δⁿ modulo n₀. It induces coker Δⁿ_m₁/n₀≃(Oλ[Sh°_n₀]/n₀)⊗Oλ Oλ[Sh°_n₁]_m₁. After further quotient by n₁, for every f∈B₀⊗B₁ of 5.1, pair ∇(∂AJ_Q(Qη_sp)) with f. The result is (p+1)φΠ₀(I°_n₀,p)φΠ₁(T°_n₁,p)∑_{s∈Sh(V°_n,K°_sp)}f(s,sh°↑(s)). (ltxzz, Theorem 7.2.8(1)–(3), p. 124; ltxzz line 6037).

The hypotheses are Datum 5.1; A7.1.1: both factors residually absolutely irreducible; A7.2.2: even polarized residual representation rigid for (Σ⁺min,Σ⁺lr,I) and absolutely irreducible over F(ζℓ); A7.2.3: for each α localized RΨOλ cohomology vanishes off nα−1 and is finite free there; A7.2.4: even residual Hecke character cohomologically generic; H(n),H(n+1).

The proof uses the following chain. The even monodromy-incidence relations make ∇ descend modulo n₀; combine 3.5 with the odd coinvariant comparison. Compute the class of Q_sp using 5.2 and the strict-transform cycle formula, then descend the finite pairing.

*Needs:* Layer 5 §5.2; Layer 5 §5.3; Layer 5 §5.4; Layer 3 §3.5; Layer 3 §3.2.

**Checks.**

- `first_normalization`: For p=3 and a test function supported on one graph pair with fibre multiplicity 1, the value is 4φΠ₀(I°)φΠ₁(T°), not the unweighted graph value 1.

### 5.6 firstReciprocityExponentEquality

Prove `firstReciprocityExponentEquality` as follows. Under the first-law hypotheses, for the generic uniformization pair Sh′_n₀×Sh′_n₁, expλ(∂p locp AJ(Sh′_sp)) equals expλ of the pushed-forward characteristic function of Sh(V°_n,K°_sp) in Oλ[Sh°_n₀×Sh°_n₁]/(n₀,n₁). Exponents are computed in the exact singular cohomology and function quotients, respectively. (ltxzz, Corollary 7.2.9, p. 126; ltxzz line 6158).

The hypotheses are Datum 5.1; A7.1.1: both factors residually absolutely irreducible; A7.2.2: even polarized residual representation rigid for (Σ⁺min,Σ⁺lr,I) and absolutely irreducible over F(ζℓ); A7.2.3: for each α localized RΨOλ cohomology vanishes off nα−1 and is finite free there; A7.2.4: even residual Hecke character cohomologically generic; H(n),H(n+1).

The proof uses the following chain. The uniformization comparison identifies the two singular classes. PI2 makes p+1 a unit, PI5 and the even Hecke formula make φΠ₀(I°) a unit, and PI4 and the odd formula make φΠ₁(T°) a unit. Apply unit invariance of exponent.

*Needs:* Layer 1 §1.1; Layer 1 §1.4; Layer 5 §5.5.

### Examples

The graph characteristic function is pushed forward with fibre multiplicities. At p=3 a test function supported on one graph point has first-law pairing 4a₀a₁, where a₀=φΠ₀(I°) and a₁=φΠ₁(T°). Neither a Hecke factor nor the factor 4 disappears from the identity.

### Dependencies

Layer 2 §2.1; Layer 2 §2.6; Layer 1 §1.3; contract gap `native-shimura`; Layer 1 §1.4; Layer 2 §2.4; Layer 4 §4.2; contract gap `unitary-special-compatibility`; Layer 1 §1.2; Layer 3 §3.2; Layer 3 §3.3; Layer 3 §3.4; Layer 3 §3.1; EtaleCohomologyFoundations §F.2.6; Layer 2 §2.5; Layer 4 §4.3; contract gap `semistable-boundary`; contract gap `potential-map-notation`; Layer 3 §3.5; Layer 1 §1.1.

## Layer 6: Second geometric and explicit reciprocity laws

### 6.1 secondReciprocityDatum

Define `secondReciprocityDatum` as follows. Bundle the standing pair; λ|ℓ with Σ⁺min avoiding ℓ; m≥1; inert Σ⁺lr,II with rational support disjoint from Σ⁺min and ℓ∤Nv((Nv)²−1); Σ⁺II containing both; an indefinite V_n and V_n+1=V_n⊕⟨1⟩, self-dual lattices away from the exceptional sets; compatible neat K_sp,K_n,K_n+1 with K_sp=K_n at Σ⁺min and K_sp⊆K_n at Σ⁺lr,II; even local space nonsplit and level special maximal at raising places and transferable at Σ⁺min. Include the §4.1 moduli data, special inert p, CM type and definite uniformization data. PII1: p-adic places avoid Σ⁺II. PII2: ℓ∤p(p²−1). PII3: Φ contains τ∞ and Qp^Φ=ℚp². PII4: even Satake is special modulo λᵐ and odd Satake Tate generic modulo λ. PII7: tensor Satake is special modulo λᵐ. Construct the ideals by the same kernel contraction as 5.1 and the special level K⋆_sp,sp on the definite uniformization pair. There are no PII5 or PII6 clauses. (ltxzz, §7.3 and Notation 7.3.1, pp. 127–128; ltxzz line 6192; ltxzz line 6231).

The interface includes `secondDatum_ext` (extensionality): Isometries preserving lattices, levels, CM type and uniformization transport the datum and its ideal quotients; `secondDatum_graphFunction` (evaluation): Push forward 1 on Sh(V⋆_n,K⋆_sp,sp) along both correspondence legs, counting every fibre multiplicity in the definite product; `secondDatum_reduce` (functoriality): Reduction from m to 1≤a≤m preserves the polynomial conditions and contracted quotient maps.

The proof uses the following chain. Use the actual special homomorphism correspondence and the definite uniformization datum. The two legs specify its function pushforward; do not replace a correspondence by a chosen map.

*Needs:* Layer 1 §1.3; Layer 1 §1.5; Layer 2 §2.2; Layer 4 §4.1; contract gap `unitary-special-compatibility`.

**Checks.**

- `second_fibre_multiplicity`: Two source points mapping to one definite pair contribute 2 to its characteristic pushforward, even when the image set is a singleton.
- `second_no_extra_assumptions`: The truth of the second datum does not depend on a supplied even rigidity witness or on intertwining genericity: changing these extra labels cannot change the datum.
- `second_level_exponent`: m=0 is rejected, and P(p)=0 modulo λ does not establish the m=2 condition.

### 6.2 secondGeometricReciprocity

Prove `secondGeometricReciprocity` as follows. For compatible prime-to-p levels in the special subcategory and p-coprime L, let loc′p be localization of the absolute cycle class, pullback to the CM model and smooth specialization. Put A=(id×π_n₁)!∘(id×ι_n₁)*. Then T⋆_n₁,p A(loc′p[Δ])=A(inc⋆⋆!(1_Δ⋆)) in H²ʳ⁰_T(M_n₀×Tp S_n₁,L(r₀)), where inc⋆⋆! is product pullback from the finite uniformization sets followed by Gysin. This equality retains T⋆ and the two correspondence legs. (ltxzz, Construction 4.6.1 and Theorem 4.6.2, pp. 53–54; ltxzz line 2488; ltxzz line 2517).

The proof uses the following chain. Use the Cartesian basic-correspondence diagram under addition of the norm-one line, the excess intersection formula and the source Hecke identity. Smooth specialization identifies the actual local absolute class.

*Needs:* Layer 2 §2.2; Layer 4 §4.2; Layer 6 §6.1; contract gap `unitary-special-compatibility`; EtaleCohomologyFoundations §F.6.

### 6.3 oddSpecialFiberCoinvariants

Prove `oddSpecialFiberCoinvariants` as follows. Under datum 6.1, A7.1.1, A7.3.2 and H(n₁), H²ʳ¹(M_n₁,Oλ(r₁))_m₁ is weakly semisimple and (π_n₁!∘ι_n₁*) identifies its arithmetic-Frobenius coinvariants with H⁰(S_n₁,Oλ)_m₁. (ltxzz, Lemma 7.3.3, p. 128; ltxzz line 6257).

The proof uses the following chain. Use the smooth generic/special comparison and H(n₁), then compare residual invariants with the characteristic-zero invariant rank. Apply 1.2 and the geometric odd incidence comparison.

*Needs:* Layer 1 §1.2; Layer 2 §2.2; contract gap `automorphic-multiplicity`; contract gap `local-unitary-representations`.

### 6.4 secondExplicitReciprocity

Prove `secondExplicitReciprocity` as follows. Under the second-law hypotheses, expλ(locp[Sh(V_n,K_sp)], H²ⁿét((Sh_n₀×F Sh_n₁)_Fp,Oλ(n))/(n₀,n₁)) is at most expλ(1_Sh(V⋆_n,K⋆_sp,sp), Oλ[Sh⋆_n₀×Sh⋆_n₁]/(n₀,n₁)). The left-hand class is the absolute localized diagonal cycle class; the right-hand element is the pushed-forward function of 6.1. (ltxzz, Theorem 7.3.4, p. 129; ltxzz line 6303).

The hypotheses are Datum 6.1; A7.1.1: both factors residually absolutely irreducible; A7.3.2: localized SPECIAL-FIBRE Hⁱ(M_nα,Oλ) vanishes for i≠nα−1 and is finite free in degree nα−1; H(n),H(n+1).

The proof uses the following chain. Use 6.3 and Künneth to make A an isomorphism after localization. PII4 makes T⋆_n₁,p invertible. If πᵉ kills the definite graph function then 6.2 kills the image of the localized cycle class, hence that class itself. Minimize e.

*Needs:* Layer 1 §1.1; Layer 6 §6.2; Layer 6 §6.3; contract gap `hochshild-serre-adic`.

**Checks.**

- `second_inequality_control`: For the toy quotient O/π²→O/π, the image of 1 has exponent 1 and the source 1 has exponent 2; functoriality of exponent permits strict inequality and cannot justify equality.

### Examples

The second law measures the absolute localized cycle class in degree 2n. It gives an exponent upper bound. The source does not identify that class with a singular regulator or assert equality of exponents.

### Dependencies

Layer 1 §1.3; Layer 1 §1.5; Layer 2 §2.2; Layer 4 §4.1; contract gap `unitary-special-compatibility`; Layer 4 §4.2; EtaleCohomologyFoundations §F.6; Layer 1 §1.2; contract gap `automorphic-multiplicity`; contract gap `local-unitary-representations`; Layer 1 §1.1; contract gap `hochshild-serre-adic`.

## Layer 7: Auxiliary places and the arithmetic level-raising system

### 7.1 admissibleImageLift

Prove `admissibleImageLift` as follows. For Rα, their polarizations and residual image as in L5-2, and every m≥1, the image of (ρ̄₀+⁽ᵐ⁾,ρ̄₁+⁽ᵐ⁾,ε̄ℓ⁽ᵐ⁾) over F⁺rflx contains (γ₀,γ₁,ξ) with ξ²−1 a unit, both conjugate components of order prime to ℓ, and ker(hγ₀−1), ker(hγ₁−1), ker(hγ₀⊗hγ₁−1) free of rank 1 over Oλ/λᵐ, with the residual exclusions −1 and −ξ. (ltxzz, Lemma 2.7.1 with F′=F⁺rflx and P=T²−1, p. 21; ltxzz line 918).

The proof uses the following chain. Lift the residual image element through the actual congruence image; prime-to-ℓ powering removes its pro-ℓ part. The simple eigenspaces lift by the integral idempotent decomposition. Preserve ξ²−1 under the same powering choices.

*Needs:* Layer 1 §1.6; contract gap `polarized-image-lifting`.

### 7.2 auxiliaryPlaceDetection

Prove `auxiliaryPlaceDetection` as follows. For an admissible λ, R=R₀⊗R₁ and m>m₀≥0, let S⊆H¹_f,R(F,R̄⁽ᵐ⁾) be free of rank r=1 or 2 over Oλ/λ^(m−m₀). Let rR bound the reducibility depths of all R̄⁽ᵃ⁾ and choose γ from 7.1. Outside any finite exceptional rational support there exist distinct very special inert places and a basis s₁,…,sᵣ such that loc_wᵢ(sⱼ)=0 for i≠j and expλ(loc_wᵢ(sᵢ))≥m−m₀−f(r)rR, where f(1)=1 and f(2)=4. These places satisfy the individual and tensor Satake conditions and the CM-type condition needed by 5.1 or 6.1. For the fixed native Hecke modules used in the rank argument they also preserve the contracted quotient maps PI6 and PI8, or PII8, respectively. (ltxzz, Lemmas 2.3.3–2.3.5, 2.6.4; Propositions 2.6.6–2.6.7; proofs of Theorems 8.2.2/8.3.2, pp. 14–20,135–136,140–141; ltxzz line 648; ltxzz line 846; ltxzz line 870; ltxzz line 883; ltxzz line 6613; ltxzz line 6848).

The hypotheses are S is the actual reduced integral Selmer submodule; γ has prime-to-ℓ order and rank-one hγ-fixed tensor line; L5-1 holds; the fixed Hecke modules satisfy the native automorphic realization and genericity hypotheses used for PI6/PI8.

The proof uses the following chain. Restriction to the field cut out by R̄ is injective under L5-1. Evaluation gives the finite Selmer extension and its θS map. The reducibility bound makes its image contain π^(f(r)rR)Hom(S,R̄); abundant tuples and elementary divisors diagonalize the evaluations. Chebotarev over the real reflexive closure realizes these elements outside the exclusions. The Hecke finite-support contraction theorem gives PI6/PI8.

*Needs:* Layer 7 §7.1; Chebotarev Layers 1–2 and 10; ProfiniteCohomology Layers 5–8; contract gap `selmer-detection`; contract gap `hecke-finite-support`.

### 7.3 rankinSelbergLevelRaisingSystem

Prove `rankinSelbergLevelRaisingSystem` as follows. For admissible λ and H(n),H(n+1), realize on the native definite and indefinite data the two parities of the level-raising system generated by the diagonal cycles and the definite diagonal characteristic functions, indexed by the finite compatible sets of auxiliary places used in the two-prime argument. For each allowed adjacent definite/indefinite change, the singular edge is 5.6 and the absolute-cycle edge is the inequality 6.4. Localizations away from the raising places and Σ⁺min∪Σ⁺ℓ satisfy the finite conditions; conjugation and tensor polarization give the correct dual coefficients. Export the one- and two-place rank bounds on this realization through the imported Selmer-annihilation interface. (ltxzz, §1.2 and proofs of Theorems 8.2.2/8.3.2, pp. 5–6,135–143; ltxzz line 200; ltxzz line 6633; ltxzz line 6879).

The hypotheses are Only native data satisfying 5.1 or 6.1 at the corresponding edge; all integral lattice comparison kernels and cokernels have their fixed λ-power bounds.

The proof uses the following chain. At one place use first reciprocity and the congruence Galois realization to produce an annihilating cohomology class. At two places apply second reciprocity at the first, change the odd special level using 3.7, and first reciprocity at the second. The finite local conditions follow from the integral regulator comparison. Global reciprocity bounds the remaining local pairing with the different-ideal error retained.

*Needs:* Layer 3 §3.6; Layer 3 §3.7; Layer 4 §4.6; Layer 5 §5.6; Layer 6 §6.4; Layer 7 §7.2; contract gap `selmer-bipartite`; contract gap `selmer-local`.

**Checks.**

- `system_empty_vertex`: The empty raising set is a vertex, not an omitted base case; its definite value is the actual diagonal function.
- `system_two_places`: For independent s₁,s₂ the detecting basis has off-diagonal evaluations zero; a one-place norm-compatible class does not supply this matrix.

### 7.4 eventualAdmissibilityFamilies

Prove `eventualAdmissibilityFamilies` as follows. For F⁺≠ℚ, admissibility holds outside finitely many λ for each of two source families. Family A: E=ℚ, two geometrically nonisogenous elliptic curves over F⁺, each with geometric endomorphism ring ℤ, and ρΠα,ℓ≃Sym^(nα−1)H¹ét(Aα_Fbar,ℚℓ)|ΓF for every ℓ. Family B: a very special inert p with Π₀,p Steinberg and Π₁,p unramified with eigenvalue 1 exactly once, and a supercuspidal finite local component of each Πα. No eventual-admissibility assertion is made for arbitrary relevant pairs. (ltxzz, Lemmas 8.1.3–8.1.5, pp. 131–133; ltxzz line 6400; ltxzz line 6418; ltxzz line 6459).

The proof uses the following chain. Check L1–L7 separately. For A, use independent elliptic residual images and symmetric powers. For B, the Steinberg unipotent plus trivial odd inertia proves tensor irreducibility and excludes its occurrence in the adjoint when char k=0 or ≥2n(n+1)−1; local tempered eigenvalue exclusions prove L5-2. Eventual rigidity and cohomological genericity are separate imports.

*Needs:* Layer 1 §1.6; contract gap `eventual-images`; contract gap `cohomological-genericity`; contract gap `eventual-rigidity`.

### Examples

Local detection uses the polarized tensor and its actual finite representation extension. Rank one requires a pair of places with diagonal evaluations, rather than one place detecting two independent classes.

### Dependencies

Layer 1 §1.6; contract gap `polarized-image-lifting`; Chebotarev Layers 1–2 and 10; ProfiniteCohomology Layers 5–8; contract gap `selmer-detection`; contract gap `hecke-finite-support`; Layer 3 §3.6; Layer 3 §3.7; Layer 4 §4.6; Layer 5 §5.6; Layer 6 §6.4; contract gap `selmer-bipartite`; contract gap `selmer-local`; contract gap `eventual-images`; contract gap `cohomological-genericity`; contract gap `eventual-rigidity`.

## Layer 8: Rank zero, rank one and the rank-(2,3) refinement

### 8.1 rankinSelbergSelmerRankZero

Prove `rankinSelbergSelmerRankZero` as follows. For every CM F/F⁺, n≥2, relevant Π₀,Π₁, common strong E and admissible λ, assume H(n),H(n+1). If L(1/2,Π₀×Π₁)≠0, then H¹_f(F,Vλ)=0. (ltxzz, Theorem 8.2.2, p. 135; ltxzz line 6568).

The proof uses the following chain. The upstream period input supplies a nonzero definite diagonal period and a finite valuation mper. If a nonzero Selmer class exists, reduce a saturated rank-one lattice and kill finitely many bad-place localizations by a fixed π-power. Detect it at one auxiliary place using 7.2. First reciprocity produces a dual class with singular exponent ≥m−mper−mlat. Global reciprocity bounds the exponent independently of m, with different-ideal and reducibility errors. Let m exceed these fixed constants.

*Needs:* Layer 4 §4.4; Layer 7 §7.3; contract gap `period-nonvanishing`; contract gap `selmer-annihilation`.

### 8.2 rankinSelbergSelmerRankOne

Prove `rankinSelbergSelmerRankOne` as follows. For the same standing pair, admissible λ and H(n),H(n+1), suppose a diagonal datum 4.1 has even local levels transferable at Σ⁺min and AJλ(Δ)≠0. Then dim_Eλ H¹_f(F,Vλ)=1. Nonzero AJ already forces the global epsilon sign −1; it is a conclusion rather than an extra premise. (ltxzz, Theorem 8.3.2 and Remark 8.3.3, p. 139; ltxzz line 6773; ltxzz line 6793).

The proof uses the following chain. 4.5 gives the lower bound. If the dimension were at least 2, reduce a saturated rank-two lattice containing the primitive diagonal class and kill bad localizations. Choose an abundant detecting pair by 7.2. Second reciprocity at the first prime gives a large definite exponent; after the odd-level comparison, first reciprocity at the second gives a dual annihilator. Global reciprocity yields a fixed upper exponent bound, contradicting arbitrarily large m.

*Needs:* Layer 4 §4.4; Layer 4 §4.5; Layer 7 §7.3; contract gap `selmer-annihilation`; contract gap `epsilon-from-cycle`.

### 8.3 rankTheoremsTotallyRealBase

Prove `rankTheoremsTotallyRealBase` as follows. For F⁺≠ℚ and n≥2, export 8.1 and 8.2 with no H(N) premises, using the cohomological realization theorem H(N) for every needed N. In family 7.4A or 7.4B, combine the conclusion with eventual admissibility to obtain the corresponding all-but-finitely-many coefficient-prime result. (ltxzz, Proposition 3.2.11; Theorems 1.1.5, 1.1.9 and Corollary 8.2.5, pp. 3–5,28,138; ltxzz line 1273; ltxzz line 136; ltxzz line 191; ltxzz line 6743).

The hypotheses are F⁺≠ℚ; all the remaining rank-zero or rank-one hypotheses unchanged.

The proof uses the following chain. Apply the supplier theorem establishing H(N) on this domain, then the conditional rank theorem. Intersect the finite exceptional sets only for the specified families.

*Needs:* Layer 8 §8.1; Layer 8 §8.2; Layer 7 §7.4; contract gap `automorphic-multiplicity`.

### 8.4 rankTwoThreeRefinedRankTheorems

Prove `rankTwoThreeRefinedRankTheorems` as follows. For n=2, F/F⁺ any CM extension including F⁺=ℚ, and λ satisfying L1–L5, export rank zero under central L-value nonvanishing and rank one under the same transferable diagonal datum and nonzero AJ premise as 8.2. In these two theorems L6 and L7 are absent. H(2) and H(3) are discharged by the small-rank realization theorems; the proof must use the separate rank-(2,3) level-raising argument rather than deleting L6/L7 from 7.3. (ltxzz, Remark 1.1.10, p. 5; Proposition 3.2.11, p. 28; ltxzz line 196; ltxzz line 1273).

The proof uses the following chain. Use the separate rank-2 local level-raising and rank-3 cohomology argument named in the source remark. Its detailed supplier proof is a gap; the high-rank rigidity/freeness argument is not claimed to prove this refinement.

*Needs:* Layer 1 §1.6; Layer 4 §4.4; Layer 4 §4.5; contract gap `rank-two-three-proof`; contract gap `automorphic-multiplicity`; contract gap `period-nonvanishing`.

### 8.5 hilbertPrecursorCompatibility

Check `hilbertPrecursorCompatibility` as follows. As a comparison test supplied by HilbertModularVarietiesAndShimuraCurves, for a totally real field K of odd degree g, parallel-weight-two Π, quaternionic level and λ satisfying Liu–Tian Assumption 4.1, and p inert in K, coprime to the excluded supports and satisfying their Definition 4.5, the unramified level-raising map from the semi-meander-indexed definite functions onto H¹(𝔽p^(2g),Hᵍét(Sh_bar,OE/λ((g+1)/2))/m) is surjective. Compare carrier and Frobenius conventions only; it is not an instance replacing the unitary singular theorem. (liu-tian, Assumption 4.1, Definition 4.5 and Theorem 4.7, pp. 30–32; liu-tian line 1407; liu-tian line 1477; liu-tian line 1496).

The hypotheses are g odd; ℓ coprime to R, disc K and the specified central double quotient; ℓ≥g+2; residual LIInd condition; dim residual Hᵍ=2ᵍ dim(Π_B^∞)^K; p∤R∪{2,ℓ}; ℓ∤∏_{i=1}^g(p^(2gi)−1); T_p²≡(pᵍ+1)² and S_p≡1 modulo λ.

The proof uses the following chain. Read the supplied Hilbert modular comparison at its exact hypotheses. The test checks only agreement of unramified cohomology, arithmetic Frobenius and degree/twist conventions.

*Needs:* contract gap `hilbert-precursor`.

### Examples

The two conclusions concern the same representation Vλ. A nonzero class in a multiplicity space gives a nonzero Selmer class after choosing a coordinate; the upper-bound argument is independent of that coordinate choice.

### Dependencies

Layer 4 §4.4; Layer 7 §7.3; contract gap `period-nonvanishing`; contract gap `selmer-annihilation`; Layer 4 §4.5; contract gap `epsilon-from-cycle`; Layer 7 §7.4; contract gap `automorphic-multiplicity`; Layer 1 §1.6; contract gap `rank-two-three-proof`; contract gap `hilbert-precursor`.

## Downstream consumers

PeriodsAndSpecialValues consumes §§1.6, 4.1–4.6, 5.5–6.4 and 8.1–8.4 for admissibility, diagonal regulator, reciprocity and rank statements; its consumer section binding is a contract requirement on that consumer. It supplies no premise to this roadmap. An arithmetic Part II of the Gan–Gross–Prasad theory can consume these cycle and reciprocity interfaces for height applications; the base period theorem has independent earlier ownership. No L-derivative/height formula is exported here.

## References

- **ltxzz** — Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, [arXiv:1912.11942v3](https://arxiv.org/abs/1912.11942v3). The cited theorem/page numbers are those of v3; source lines identify the version read. Main locators: Definitions 3.1.5, 6.3.4, 8.1.1; Hypothesis 3.2.10; Theorems 4.6.2, 5.11.5, 6.2.3, 6.3.5, 7.2.8, 7.3.4, 8.2.2 and 8.3.2; Remark 1.1.10. The source's external period and multiplicity arguments are imported only through the explicit contracts.
- **ltxzz-deformation** — the same authors, *Deformation of rigid conjugate self-dual Galois representations*, [arXiv:2108.06998v1](https://arxiv.org/abs/2108.06998v1), Theorem 3.6.3 (ltxzz-deformation line 1444), Corollary 4.1.2 (ltxzz-deformation line 1761) and Theorem 4.2.6 (ltxzz-deformation line 1880). General deformation and patching ownership remains upstream.
- **liu-tian** — Y. Liu and Y. Tian, *Supersingular locus of Hilbert modular varieties, arithmetic level raising and Selmer groups*, [arXiv:1710.11492v2](https://arxiv.org/abs/1710.11492v2), §4.1, Assumption 4.1, Definition 4.5 and Theorem 4.7 (liu-tian lines 1384, 1407, 1477 and 1496). This supplies the comparison test's locator, not a replacement for unitary arithmetic level raising.

The source manifest identifies the legal versions and hashes. Mathematical statements here are paraphrases, not transcriptions of source passages.
