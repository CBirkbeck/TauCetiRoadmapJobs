# Roadmap: cohomology comparisons, part II — classical syntomic producers and relative open-curve coefficients

**Summary.** Build classical rigid and divided/undivided log-syntomic cohomology from shared rigid, crystalline, de Rham and enhanced derived realizations. Construct period maps with separate exact small-weight and bounded all-weight conclusions, adapters to the shared Hyodo–Kato and rational h-descent realizations, and a relative library of filtered Frobenius connections, strict extensions, open-curve residues and Frobenius-point specialization. The endpoints are the classical comparison interfaces and the absolute syntomic value of a relative extension; symbols, regulators and integration formulas consume these interfaces.

## Scope and ownership

This continues CohomologyComparisons. The base owns its comparison carriers, semistable comparison theorems and rational h-descent extension. This Part II owns the explicit classical producer diagrams and their adapters, the AM filtered relative assembly, extension evaluation and specialization. The overlap boundary is an exact supplier obligation below: absence of a section locator never transfers the base’s ownership here.

CrystallineCohomology owns log schemes/sites, PD coefficients, filtered crystalline realization and Hyodo–Kato foundations; PadicPeriodRings owns the period rings, lattices inside period rings and fundamental sequences; PadicDifferentialEquationsAndRigidCohomology owns general absolute and relative rigid cohomology, overconvergent isocrystals, connections and finiteness. The relative coefficient object here differs by its algebraic Hodge filtration, rigid comparison and strict exact structure. The residue sequence here is its filtered Frobenius-compatible producer interface. General exact structures and conflation-exact functors use the pinned Tau Ceti carriers; GrothendieckEulerForms Layer 5 concerns abelian Ext, while general exact-category Yoneda extensions require the Part II contract identified below, rather than an abelian Ext instance on Fil-F-MIC.

The library floor is Mathlib’s mapping cone, semilinear isocrystal and abelian Ext API, together with Tau Ceti’s Quillen exact structures and conflation-exact functors. Those objects are already in the library. Tau Ceti’s standard syntomic algebra predicate is already in the library as a morphism-theoretic notion; it does not supply syntomic cohomology. These are imports and boundaries, not construction targets.

AdicSpacesPartIV §§F1.5,F1.7–F1.9,F1.12,F1.16 owns weak completions, dagger geometry and differential forms. RigidAnalyticGeometry §§6.1–6.2,7.3–7.4,8.1,8.4 owns the rigid sites and analytic comparisons. EnhancedDerivedSheaves §§0.1–0.4,E2:towers.1,E5:abstract owns enhanced fibres, tensor and inverse limits. EtaleCohomologyFoundations §§F.0.3,F.1,F.4.1–F.4.5 owns Tate sheaves and derived/adic étale realizations. DerivedModuleAlgebra §0.K.1 owns Koszul complexes. None is rebuilt here.

The AM symbol-to-Ext construction, symbol relations, tame-symbol comparison and regulator equality belong to PadicHodgeRegulators. Its AM Theorem 3.7 application retains W(k), projective log-smooth f:(Y,M)→(Q,L), smooth affine Q with reduced relative simple normal-crossings T, smooth Y with reduced relative simple normal-crossings D, affine S=Q−T and U=Y−(D∪f⁻¹T), both total and relative horizontal normal-crossings conditions, compatible log-Frobenius lifts at every level, all-degree coherent relative rigid cohomology, 0≤n<p−1, and H^n and H^(n+1) of the relative log complex ω^(≥n+1) vanishing modulo every p^m, m>0. Its comparison factor is (−1)^n. The curve application additionally retains p>2, connected fibres, finite étale horizontal boundary and vertical multiplicities prime to p (AM Theorem 3.7 and §4.1, AM line 1185, AM line 1200, AM line 1432, AM line 1445, AM line 1644). These are consumer contracts, not restrictions on the general classical producers. ColemanIntegrationPartII owns integration, index and branch formulas; EllipticRegulators owns its special-value applications.

## Conventions

Let p be prime, V a complete mixed-characteristic (0,p) discrete valuation ring with perfect residue field k, K=Frac(V), K0=Frac(W(k)) and e=[K:K0]. No finiteness of k is assumed. Complete rings are separated. The structural embedding W(k)→V is retained. Canonical log structure on V means the closed-point log structure; X_tr denotes the locus of trivial log structure. The AM horizontal-log pair (Y,D) in 7.4 is instead over trivial-log W(k) and does not add Y0 to D. Adding the vertical log structure changes the syntomic producer, as the weight-one point Check in 7.4 shows. X0 is the special fibre; X_n means reduction modulo p^n, not modulo π^n. Fine, saturated, integral, log-smooth and Cartier-type hypotheses are stated separately at their uses (NN §1.5 and §2.3, NN line 360, NN line 521; CN §1.1.1, CN line 54).

Only the relative AM setting assumes an endomorphism F_V with F_V(x)≡x^p modulo pV and a compatible p-Frobenius σ on B† for S=Spec(B). This is the source’s strong modulo-p condition, not merely reduction modulo the maximal ideal. In a ramified trait it is obstructed: writing p=uπ^e, any such endomorphism sends π to valuation 1, whereas π^p has valuation p, so their difference has valuation 1<e when e>1. The concrete π²=p negative control is attached to 1.1. All-prime ramified classical targets in Layers 2–5 require no such F_V (AM standing assumptions, AM line 117).

Use cochain degrees in ℤ and d of degree +1; A[1]^q=A^(q+1). In explicit fibre coordinates, Fib(f)^q=A^q⊕B^(q−1) and d(a,b)=(da,f(a)−db). Give an explicit coordinate isomorphism to Mathlib’s cone[-1]; do not identify signs by notation. Multiplication 2 on Q gives [Q —2→ Q] in degrees 0,1, and the fibre connecting image of b is (0,b). These witnesses are Checks in 1.4 and 7.5. Products use the cohomological Koszul sign. Statements about products on cohomology do not demand a strictly commutative integral cochain algebra (EN §2.1.2, EN line 219; NN §3.2, NN line 1320).

S_n is EN’s divided fibre; S′_n is its undivided fibre. NN and CN use S_n for the latter. Integral Tate lattices are actual lattices inside Q_p(r) and finite coefficients mean L/p^nL. Section 4.1 fixes both EN/NN factorial and CN p-power normalizations, including CN’s inclusive endpoint convention. At p=2,r=2 their floor-normalized generators differ by 2. No identification or finite-level inverse is implicit (EN line 306; NN line 2324; CN line 67, CN line 968).

O(m) has Frobenius p^(−m)σ and filtration jump −m. Thus φ(dlog t)=p dlog t and H¹(G_m)=O(−1). HK monodromy has Nφ=pφN and the change from π to πu composes ι_π with exp(log(u)N), on the HK side with a positive sign. On φe0=e0, φe1=p e1, Ne1=e0, changing π sends e1 to e1+log(u)e0, and the lower map in the semistable square is 1−φ/p^(r−1), including 1−pφ at r=0. Residue uses Res_0(dlog t)=1, Res_∞(dlog t)=−1. These are the two-term and curve Checks in 2.3,5.1,5.2,6.6 (AM line 181; HK line 770, HK line 1340; NN line 1366; AM line 595).

Work in fixed object and hom universes, enlarging for sheaves when necessary. Form Yoneda groups through an essentially small model of the exact coefficient category and prove model independence. Scalar extension and comparison maps carry their actual scalar towers. Frobenius-semilinear maps over K0 and F_V-semilinear maps over K become Q_p-linear maps when taking syntomic fibres. No K0-linearity is asserted for 1−φ/p^r. Zero modules and empty schemes are allowed; V, K and K0 are nonzero by the field/DVR hypotheses. Coordinate rings of empty charts and weak completions of generic-only components may be zero.

Suggested declaration homes are the ordinary TauCeti cohomology, exact-category and coefficient namespaces. A production module imports proved definitions rather than a roadmap prototype. Suggested.lean is reserved for headline forms easy on existing carriers, with one `import Mathlib`, proved examples of its own definitions, no sorry-valued data and no `set_option`.

## Exact supplier contracts

### From Mathlib

The pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

- `CochainComplex.mappingCone` in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean`, with `mappingCone.inl`, `inr`, `fst` and `snd`, supplies the cochain cone. Its source requires a preadditive category and the relevant binary biproducts; the comparison here fixes explicit fibre coordinates (MathlibCone line 61, MathlibCone line 76, MathlibCone line 80, MathlibCone line 84, MathlibCone line 92).
- `WittVector.Isocrystal`, `WittVector.IsocrystalHom` and `WittVector.IsocrystalEquiv` in `Mathlib/RingTheory/WittVector/Isocrystal.lean` supply modules over FractionRing(WittVector p k) with bijective Frobenius-semilinear map, and equivariant linear maps. They require p prime, a characteristic-p perfect domain k. Apply them here with k a perfect field. The one-dimensional classification also needs k algebraically closed and finrank=1; it is not used as a finite-dimensional HK theorem (MathlibPin line 77, MathlibPin line 117, MathlibPin line 136, MathlibPin line 142, MathlibPin line 184).
- `CategoryTheory.HasExt` and `CategoryTheory.Abelian.Ext` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` require an abelian category. They are the compatibility target for the general Yoneda supplier, not a construction of exact-category Ext (MathlibExt line 53, MathlibExt line 59, MathlibExt line 122).
- `BDeRhamPlus R p` and `BDeRham R p` are global declarations in `Mathlib/RingTheory/Perfectoid/BDeRham.lean`. Their binders are `[CommRing R]`, `[Fact p.Prime]`, `[Fact ¬IsUnit (p : R)]` and `[IsAdicComplete (Ideal.span {(p : R)}) R]`. They provide the completion and localization carriers; the period-rings contract extends or specializes these carriers with the missing filtration, comparison and fundamental-sequence API (MathlibBDeRhamReview line 55, MathlibBDeRhamReview line 79, MathlibBDeRhamReview line 92).

### From Tau Ceti

The pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `CochainComplex.mappingCone.nonempty_homotopy_id_zero_of_homotopyEquiv` in `TauCeti/Algebra/Homology/HomotopyCategory/MappingCone.lean` supplies contractibility of the cone of a homotopy equivalence over a preadditive category with a zero object and binary biproducts; it verifies the degenerate fibre comparison (TauCetiCone line 40, TauCetiCone line 53). `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension` in `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean` is a flat finite-presentation/fibre-dimension predicate and is a checked ownership boundary, not a cohomological supplier (TauCetiSyntomic line 79, TauCetiSyntomic line 85).

`TauCeti.ExactStructure C` in `TauCeti/CategoryTheory/Exact/ExactStructure.lean` requires `[Category C] [Preadditive C] [HasZeroObject C] [HasBinaryBiproducts C]` and bundles a chosen Quillen exact structure. `TauCeti.ExactStructure.IsConflationExact E E′ F` in `TauCeti/CategoryTheory/Exact/Functor.lean` requires these additive-category binders on C and D, chosen structures E,E′ and an additive functor F:C⥤D; it asserts preservation of their conflations (TauCetiExactReview line 245–267; TauCetiExactFunctorReview line 68–81). The Ext API in `TauCeti/Algebra/Homology/Ext/Basic.lean` still requires `[Abelian C] [HasExt C]`; it cannot instantiate the general Yoneda contract on FilFMIC (TauCetiExtReview line 54).

### From named roadmap sections

From TauCetiRoadmap.AdicSpacesPartIV §F1.5, §F1.7, §F1.8, §F1.9, §F1.12, §F1.16: Weak completions, dagger coherent modules, strict neighbourhoods, continuous differentials and logarithmic complexes.

From TauCetiRoadmap.RigidAnalyticGeometry §6.1, §6.2, §7.3, §7.4, §8.1, §8.4: Classical rigid sites, coherent/proper cohomology, analytification and proper GAGA; not general open-family coherence.

From TauCetiRoadmap.EnhancedDerivedSheaves §§0.1–0.4, §E2:towers.1, §E5:abstract: Enhanced sheaves, coherent homotopy fibres and limits, tensor products and inverse towers.

From TauCetiRoadmap.EtaleCohomologyFoundations §F.0.3, §F.1, §F.4.1–§F.4.5: Tate twists and derived/adic étale realizations; nearby-cycle-inputs, nearby-cycle-cartier and nearby-cycle-graded record the extra contracts.

From TauCetiRoadmap.DerivedModuleAlgebra §0.K.1: General Koszul complexes, their signs, maps and tensor rules; used only by the local comparison proof input.

### Required contracts with missing section locators

Every contract below is a recorded prerequisite gap. It is not an assertion that an unspecified section supplies the result. An extension in the same owner’s direction is identified as a proposed Part II. The layers consume it only through the corresponding `gap:` key in the data plan.

**`base-ownership` — From TauCetiRoadmap.CohomologyComparisons.** CohomologyComparisons is a declared existing base. Its README and section locators are absent. Required outputs are its de Rham, rigid, crystalline, étale and semistable comparison carriers, coherent comparison diagrams, cup products and finite scalar-extension/trace compatibility. Bind every overlapping comparison to its accepted section before implementing the adapters here; none is reconstructed by this extension. Supply the base roadmap text and exact sections identifying its comparison objects and already-owned theorems. Section contract: accepted sections unavailable.

**`crystalline-inputs` — From TauCetiRoadmap.CrystallineCohomology.** The site carriers include fine, integral and saturated log structures without conflating these conditions; the coefficient assertions below concern log-syntomic X/W(k), including the local presentations used over V. The Frobenius-divisible J^⟨r⟩ and divided Frobenius are constructed in 3.1, not requested here (EN §2.1, pp. 4–5, EN line 150–165, EN line 198–218). For k perfect of characteristic p, V a complete mixed-characteristic DVR with residue k, n≥1 and r∈ℤ, supply fine, integral and fs log-scheme carriers and log-crystalline and log-syntomic sites over W(k), canonical-log V and fine integral log arithmetic pairs, and, for X log-syntomic over W(k), the sheaves O_cr,n=H⁰_cr(X_n,O) and J_n^[r]=H⁰_cr(X_n,J^[r]) with J^[r]=O for r≤0, their Z/p^n-flatness, J_(n+1)^[r]⊗ᴸ_(Z/p^(n+1))Z/p^n≃J_n^[r] (also for O_cr), the Frobenius-compatible equivalence RΓ(X_n,syn,J_n^[r])≃RΓ_cr(X_n/W_n(k),J^[r]), and filtered log-PD de Rham presentations for local exact immersions into log-smooth W(k)-schemes with compatible Frobenius lifts, natural under refinement and étale descent. Section contract: accepted sections unavailable; EN §2.1 and §2.1.1, pp. 4–5.

**`crystalline-filtered-quotient` — From TauCetiRoadmap.CrystallineCohomology.** Arithmetic pairs have dense open K-interior U in reduced proper flat Ubar/V, with its fine integral quasi-coherent boundary log structure. The comparison is of filtered quotients, and does not replace them by unfiltered cohomology (NN line 475–487, NN line 1299–1338). For V a complete mixed-characteristic DVR with perfect residue field k, fine proper log-smooth X over canonical-log V and r≥0, including such arithmetic pairs (U,Ubar), supply the canonical rational equivalence RΓ_cr(X/W(k),O/J^[r])_Q≃RΓ_log-dR(X_K/K)/F^r compatible with the quotient maps, products within each fixed-r quotient and pullback, and for the arithmetic-pair crystalline coefficient complexes supply derived p-completeness and RΓ_cr(J^[r])⊗ᴸZ/p^n≃RΓ_cr(J^[r])_n and RΓ_cr(O)⊗ᴸZ/p^n≃RΓ_cr(O)_n for n≥1. Section contract: accepted sections unavailable; NN Corollary 2.4, p. 10, and §3.2 equation (32), pp. 25–26.

**`hyodo-kato-proper` — From TauCetiRoadmap.CrystallineCohomology.** The uniformizer comparison and its change law are on the supplied proper cohomology carrier; HK line 698, HK line 715, HK line 770, HK line 1321, HK line 1340. For proper fine log-smooth X over the canonical log mixed-characteristic DVR V with perfect residue field and Cartier-type special fibre, supply finite-dimensional H^q_HK over K0 with bijective semilinear φ, nilpotent N satisfying Nφ=pφN, and ι_π:H^q_HK⊗K≃H^q_log-dR with ι_(πu)=ι_π∘exp(log(u)N) for every q≥0 and u∈V×. Section contract: accepted sections unavailable; HK §§3.2–3.6, pp. 243–246, Theorem 5.1, pp. 262–263.

**`arithmetic-pair-deformation` — From TauCetiRoadmap.CrystallineCohomology.** This interface includes NN line 1341–1383 and applies to arithmetic pairs with nonproper interior; the proper cohomology theorem alone supplies no such enhanced triangle. For a fine integral quasi-coherent log arithmetic pair (U,Ubar) log-smooth over canonical log V and of Cartier type, supply enhanced rational RΓ_HK and RΓ_cr over the log PD deformation base, the distinguished N-triangle from absolute to deformation cohomology, and the Frobenius-equivariant section ι_π with its de Rham projection and uniformizer-change coherence used in NN Proposition 3.8. Section contract: accepted sections unavailable; NN §3.1 and Proposition 3.8, pp. 26–27.

**`period-rings` — From TauCetiRoadmap.PadicPeriodRings.** Extend or specialize Mathlib BDeRhamPlus R p and BDeRham R p on the binders recorded above (MathlibBDeRhamReview line 55, MathlibBDeRhamReview line 79, MathlibBDeRhamReview line 92). A_cris, B_cris, B_st, B_dR, filtrations, φ, N, t and Tate coordinates; divided and undivided fundamental sequences with their distinct integral lattices; relative PD Poincaré and Artin–Schreier sequences for CN chart period rings. NN §4.1 and CN §2.4.3 specify which sequence is used. Frobenius acts on t by p and N uses HK sign. On the existing de Rham period-ring carriers and the classical crystalline/semistable period rings for the mixed-characteristic bases used here, supply the missing filtration and comparison API and the divided/undivided integral fundamental sequences, including the CN chart PD Poincaré and Artin–Schreier sequences. Section contract: accepted sections unavailable.

**`rigid-realizations` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** The filtration is on algebraic logarithmic de Rham compactification complexes; no Hodge filtration on general rigid cohomology is asserted. Scalar-extension maps retain K0 and K, and Frobenius is semilinear on the K0 realization (BesserI §4 and §5, BesserI line 625–636, BesserI line 648–688). For every separated finite-type k-scheme Z with k perfect of characteristic p and coefficient fields K0=Frac(W(k))⊂K=Frac(V) for a complete mixed-characteristic DVR V, supply functorial enhanced RΓ_rig(Z/K0), RΓ_rig(Z/K), K⊗K0 RΓ_rig(Z/K0)≃RΓ_rig(Z/K), semilinear Frobenius on the K0 complex, products, finite Zariski Čech descent, independence of frames and strict neighbourhoods and finite coefficient-extension/trace comparisons, and for smooth separated finite-type T over a characteristic-zero field L supply F^rRΓ_dR(T/L) for r∈ℤ from smooth proper normal-crossings compactifications, with filtered independence, products, finite Čech descent and scalar-extension compatibility. Section contract: accepted sections unavailable; BesserI §§4–5, manuscript pp. 9–18.

**`rigid-log-crystalline` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** The log structure is induced by the horizontal divisor alone over trivial-log W(k); canonical vertical log structures are excluded from this contract (AM line 1302–1327). For k perfect of characteristic p, Y projective smooth over W(k), D a relative normal-crossings divisor, M its horizontal log structure and U=Y−D, supply the natural Frobenius- and product-compatible equivalence RΓ_log-cr((Y_k,M_k)/W(k))[1/p]≃RΓ_rig(U_k/K0), together with F^rRΓ_log-dR((Y_K0,M_K0)/K0)≃F^rRΓ_dR(U_K0/K0) for every r∈ℤ and compatibility with the de Rham/crystalline specialization maps and finite coefficient extensions. Section contract: accepted sections unavailable; AM Lemma 3.10, equations (3.10)–(3.12), pp. 29–30.

**`relative-rigid-coefficients` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** Relative rigid derived pushforwards, their induced Gauss–Manin connection and Frobenius, and frame-independent realization are used before coherence is asserted (AM Definition 2.12 and Remark 2.13, AM line 451–505); no direct-image finiteness follows merely from smoothness. For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B†, supply the horizontal B†_K realization of overconvergent F-isocrystals with continuous connection, its tensor equivalence under change of σ with identity and cocycle laws, and exact pullback for morphisms of smooth affine bases, together with frame-independent relative rigid derived pushforwards and their connection and Frobenius for smooth quasi-projective u:U→S, without a finiteness assertion. Section contract: accepted sections unavailable; AM Remark 2.2, pp. 4–5.

**`relative-rigid-projective-finiteness` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** This is the geometric rigid finiteness input invoked in AM line 510–527; algebraic filtered finiteness is a separate contract. For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B† and u:U→S projective smooth, supply coherent R^iu_rig j†O on strict neighbourhoods in every degree i≥0, with base change to closed fibres and finite coefficient extensions, and its connection and Frobenius. Section contract: accepted sections unavailable; AM Setting 2.14 and Proposition 2.15, pp. 12–13.

**`relative-rigid-log-finiteness` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** AM line 530–585 retains both boundary conditions and log integrality; no finiteness for arbitrary open smooth families is requested. For V a complete mixed-characteristic DVR with perfect residue field and F_V(x)≡x^p modulo pV, S=Spec(B) smooth affine over V and a compatible p-Frobenius σ on B† and the full goodCompactification of 6.3 (smooth projective ambient V-schemes, both total V-normal-crossings and relative S-normal-crossings boundary, projective log-smooth integral map and Zariski-type base), supply coherent R^iu_rig j†O on strict neighbourhoods for every i≥0 with base change to closed fibres and finite coefficient extensions, connection and Frobenius. Section contract: accepted sections unavailable; AM Setting 2.16 and Proposition 2.17, pp. 13–14.

**`rigid-gysin` — From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.** The (−1) twist multiplies Frobenius by p. After geometric splitting, Gysin followed by curve trace sums the boundary coefficients on each geometric component; over k use finite-étale coefficient-field traces. The sequence is compatible with the de Rham residue sequence under comparison and with finite extensions of perfect residue/coefficient fields. Empty D retains H²(U)=H²(X), so the last zero of the affine relative sequence cannot be asserted without its affineness hypothesis. For a smooth projective curve X over a perfect characteristic-p field k, finite étale reduced boundary D and U=X−D, supply the Frobenius-compatible rigid localization sequence 0→H¹_rig(X)→H¹_rig(U)→H⁰_rig(D)(−1)→H²_rig(X)→H²_rig(U)→0 over K0, with residue, Gysin, trace and scalar-extension compatibility; when D meets every geometric component, supply H²_rig(U)=0. Section contract: accepted sections unavailable; AM Proposition 2.18 proof, p. 14, AM line 595–607.

**`relative-hodge` — From TauCetiRoadmap.CohomologyComparisons.** On the two geometric domains of 6.4, establish the independent algebraic hypotheses of 6.2 on actual algebraic de Rham cohomology, using the proper or logarithmic compactification complex; AM Assumption 2.20 alone gives none of these algebraic finiteness conclusions. For the smooth projective curve X/S with finite étale D of 6.6, require the logarithmic de Rham residue/Gysin sequence to be strict for the Hodge filtration, horizontal, compatible with scalar extension and traces. AM Definition 2.1, Propositions 2.15,2.17,2.18, AM line 131, AM line 510–607. The full-domain datum of 6.1 needs no finiteness theorem. For smooth affine S over an AM base and either projective smooth u or the full goodCompactification of 6.3, supply finite algebraic H^i_dR, a finite exhaustive separated Hodge filtration with finite locally free graded pieces, integrable Gauss–Manin connection, Griffiths transversality, horizontal comparison and filtered base change for every i≥0; for projective smooth relative curves X/S with finite étale boundary D, supply the strict horizontal filtered logarithmic residue/Gysin sequence with traces and scalar extension. Section contract: accepted sections unavailable; relative filtered-realization extension requires ownership resolution.

**`nearby-cycle-inputs` — From TauCetiRoadmap.EtaleCohomologyFoundations.** Write ε:X_se→X_et, εhat:Xhat_se→X0_et and ε_syn:X_n,syn→X0_et, identifying the étale sites of nilpotent thickenings; i_se and j_se are the formal-closed and generic syntomic-étale maps, a:X_n,syn→Xhat_se and u:X_tr,et→X_K,se are the canonical projections, j_K:X_K→X, j′:X_tr→X_K, and j=j_Kj′. The two projection comparisons are EN line 313–317 and EN line 336–357; the contract extends EtaleCohomologyFoundations F.1/F.3a. For log-syntomic X/W(k), its p-adic completion Xhat, n≥1, i:X0→X, j_K:X_K→X, j′:X_tr→X_K and j=j_Kj′, supply the topoi and maps ε:X_se→X_et, εhat:Xhat_se→X0_et, ε_syn:X_n,syn→X0_et, a:X_n,syn→Xhat_se, u:X_tr,et→X_K,se, i_se:Xhat_se→X_se and j_se:X_K,se→X_se, recollement by formal-closed and generic parts, exact a_* and open extensions j_se! and j_K!, Rεhat_*a_*≃Rε_syn_*, and for Λ=Z/p^n(r) or L_EN(r)/p^n with r≥0 supply Rεhat_*i_se*Rj_se*Ru_*Λ≃i*Rj_*Λ and Rε_*j_se!Ru_*Λ≃j_K!Rj′_*Λ naturally under coefficient reduction and compatible base change. Section contract: extension beyond F.1/F.3a; proposed Part II, no accepted section; EN §2.2, pp. 7–8.

**`nearby-cycle-cartier` — From TauCetiRoadmap.EtaleCohomologyFoundations.** The residue fibre Y is reduction modulo π; at a ramified base it need not equal X_1, which is reduction modulo p. The Cartier sequence is on Y_et, while the local PD calculation retains the full mod-p thickening. This is a characteristic-p input, not a syntomic period equivalence (TsujiNearby line 1156–1166, TsujiNearby line 1205–1245). For V a complete mixed-characteristic DVR with perfect residue field k and fine log-smooth X over canonical-log V whose residue fibre Y=X⊗V k is of Cartier type, put ω^q=Ω^q_(Y/s) over the standard residue log point s, Z^q=ker d, B^q=im d and ω_log^q the étale subsheaf generated by wedges of logarithmic differentials, and supply for every q≥0 the inverse Cartier isomorphism C⁻¹:ω^q≃Z^q/B^q with C⁻¹(a dlog b₁∧⋯∧dlog b_q)=[a^p dlog b₁∧⋯∧dlog b_q] and the exact étale sequence 0→ω_log^q→Z^q→ω^q/B^q→0 with last map 1−C⁻¹ as characteristic-p input to the coefficient-level n=1 PD calculation in weights 0≤r≤p−2 and degrees 0≤q≤r. Section contract: proposed Part II crystalline/étale interface; TsujiNearby Theorems A3–A4, p. 563.

**`nearby-cycle-graded` — From TauCetiRoadmap.EtaleCohomologyFoundations.** W counts horizontal logarithmic poles, with strata the intersections of components of D; the maps are induced by the Fontaine–Messing map and its logarithmic symbols. This supplies only level-one, equal-degree/weight associated-graded maps on a smooth underlying V-scheme with μ_p in K, rather than the full fs comparison of 4.3 (TsujiNearby line 805–820, TsujiNearby line 873–883, TsujiNearby line 892–929). For a complete mixed-characteristic DVR V with perfect residue field k, μ_p⊂K=Frac(V), X smooth over V, D a relative simple normal-crossings divisor, log structure from D∪X0, i:X0→X, j:X−(D∪X0)→X, n=1 and 0≤q=r≤p−2, supply the filtrations W by number of horizontal logarithmic poles on H^q(S_1(q)) and i*R^qj_*F_p(q) and the isomorphisms gr_v^W H^q(S_1(q))→gr_v^W i*R^qj_*F_p(q) induced by α_1,q for 0≤v≤q, compatible with residue maps to the codimension-v boundary strata and with products. Section contract: proposed Part II crystalline/étale interface; TsujiNearby Lemmas 4.3–4.4 and proof of Theorem 4.2, pp. 551–555, Proposition A15, p. 570.

**`local-period-pd-radius` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural p^(6r)-quasi-isomorphisms Kum(R_PD,r)→Kum(R^[u],r) for 1/(p−1)≤u≤1 and Kum(R^[u′],r)→Kum(R^[u],r) for u′≤u≤pu′ of Proposition 3.3. Section contract: accepted sections unavailable; CN Proposition 3.3, p. 32, CN line 1453–1456.

**`local-period-annulus-entry` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the τ≤r comparison Kum(R^[u],r)→Kum(R^[u,v],r) for pu≤v with the p-power cohomology error bound of Corollary 3.9. Section contract: accepted sections unavailable; CN Corollary 3.9, p. 34, CN line 1545–1548.

**`local-period-frobenius-change` — From TauCetiRoadmap.PadicHodgeTheory.** The zigzag uses the filtered PD Poincaré maps of Lemma 3.11; at p=2 its dimension dependence is retained. For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the 2^(2(d+1))-quasi-isomorphism zigzag between Kum(R^[u,v],r) and Cycl(R^[u,v],r) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 as in Proposition 3.10. Section contract: accepted sections unavailable; CN Proposition 3.10 and Lemma 3.11, pp. 34–35, CN line 1569–1588.

**`local-period-lie` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the τ≤r comparisons Kos(φ,Lie Γ_R,A^[u,v]_R(r))→Kos(φ,∂,F^rA^[u,v]_R) with p^(40r) error and their mod-p^n versions with p^(80r) error for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Section contract: accepted sections unavailable; CN Lemma 4.4, p. 43, CN line 1998–2001.

**`local-period-lazard` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural Lazard quasi-isomorphism Kos(φ,Γ_R,A^[u,v]_R(r))→Kos(φ,Lie Γ_R,A^[u,v]_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Section contract: accepted sections unavailable; CN Proposition 4.5, pp. 43–44, CN line 2055–2057.

**`local-period-annulus-change` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural quasi-isomorphism Kos(φ,Γ_R,A^(0,v]+_R(r))→Kos(φ,Γ_R,A^[u,v]_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2. Section contract: accepted sections unavailable; CN Lemma 4.8, p. 45, CN line 2148–2150.

**`local-period-phi-psi` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural p^(p+7)-quasi-isomorphism Kos(φ,Γ_R,S(r))→Kos(ψ,Γ_R,S(r)) for S=A_R or A^(0,v]+_R with u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 and the shifted lattice in the ψ-complex prescribed before Lemma 4.10. Section contract: accepted sections unavailable; CN Lemma 4.10, p. 46, CN line 2176–2187.

**`local-period-disk-change` — From TauCetiRoadmap.PadicHodgeTheory.** For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the natural quasi-isomorphism Kos(ψ,Γ_R,A^(0,v]+_R(r))→Kos(ψ,Γ_R,A_R(r)) for u=(p−1)/p,v=p−1 for p≥3 and u=3/4,v=3/2 for p=2 with the shifted ψ-lattice of Lemma 4.12. Section contract: accepted sections unavailable; CN Lemma 4.12, p. 47, CN line 2249–2255.

**`local-period-galois` — From TauCetiRoadmap.PadicHodgeTheory.** These are intermediate cohomology comparisons, not the syntomic period theorem; generic Koszul carriers remain DerivedModuleAlgebra §0.K.1. For r≥0 on CN §2.2.2 completed étale semistable charts with horizontal normal-crossings boundary over a complete mixed-characteristic DVR with perfect residue field, assuming K has enough roots of unity in the sense of CN §2.2.1, supply the Artin–Schreier fibre identification with RΓ_cont(G_R,Z_p(r)), the inflation/completion comparisons through the toric tower and the decompletion quasi-isomorphism of Proposition 4.13(i)–(iii). Section contract: accepted sections unavailable; CN Proposition 4.13, p. 48, CN line 2267–2277.

**`local-period-approximation` — From TauCetiRoadmap.PadicHodgeTheory.** For rings R of CN (5.3), their henselizations at (p), or the completed charts of §2.2.2 over the mixed-characteristic DVR, with the indicated boundary, supply the identification of the boundary-unramified maximal extension with that obtained after adjoining all roots of boundary coordinates in Lemma 5.8(i), and, for R the henselization of a chart of (5.3), the natural isomorphism G_Rhat→G_R of Lemma 5.8(ii). Section contract: accepted sections unavailable; CN Lemma 5.8, pp. 55–56, CN line 2659–2674.

**`local-period-kpi1` — From TauCetiRoadmap.PadicHodgeTheory.** For a completed semistable chart Rhat with normal-crossings horizontal boundary over the mixed-characteristic DVR and n≥1, supply the isomorphism from continuous fundamental-group cohomology to étale cohomology for every locally constant constructible p^n-torsion sheaf on the trivial-log locus Sp(Rhat[1/p])_tr of §5.1.4 (equivalently every positive-degree class dies on a finite étale cover). Section contract: accepted sections unavailable; CN §5.1.4, p. 56, CN line 2704–2725.

**`local-period-etale-gaga` — From TauCetiRoadmap.PadicHodgeTheory.** For R the henselization at (p) of a semistable chart of CN (5.3), with its horizontal normal-crossings boundary, r≥0 and n≥1, supply the natural cohomology isomorphism between (Spec R)_tr and Sp(Rhat[1/p])_tr with Z/p^n(r)′ coefficients used as g in diagram (5.6). Section contract: accepted sections unavailable; CN §5.1.5, p. 57, diagram (5.6), CN line 2620–2635, CN line 2728–2746.

**`local-period-descent` — From TauCetiRoadmap.PadicHodgeTheory.** For a semistable chart R as in CN (5.3), r≥0 and a finite Galois extension K1/K of relative ramification index e1 with Galois group G, supply the natural p^(c r e1)-quasi-isomorphism RΓ_syn(R,r)→RΓ(G,RΓ_syn(R⊗O_K O_K1,r)) for a universal c, and after derived reduction modulo p^n a p^(2c r e1) bound. Section contract: accepted sections unavailable; CN Lemma 5.9, pp. 57–58, CN line 2747–2762.

**`exact-yoneda` — From TauCetiRoadmap.GrothendieckEulerForms.** Use the pinned TauCeti.ExactStructure and TauCeti.ExactStructure.IsConflationExact carriers with their additive-category binders (TauCetiExactReview line 245–246; TauCetiExactFunctorReview line 68–81). No enough-injectives or abelian hypothesis on FilFMIC is assumed; the pinned Tau Ceti Ext API still requires [Abelian C] and [HasExt C] (TauCetiExtReview line 54). For a ring R and an essentially small R-linear additive category C with chosen TauCeti.ExactStructure C, supply Ext^i_E(X,Y) for all i≥0 as admissible i-extensions modulo zigzags (Ext⁰=Hom), with Baer addition, R-module operations, splicing, pullback/pushout, naturality for R-linear functors satisfying TauCeti.ExactStructure.IsConflationExact and canonical agreement with Mathlib Abelian.Ext with its HasExt instance for the canonical abelian exact structure, and under an additional R-bilinear biexact symmetric monoidal structure supply external extension products and unit-source cups with associativity and graded symmetry. Section contract: proposed Part II: exact-category Yoneda extensions; no accepted section.

**`rational-descent` — From TauCetiRoadmap.CohomologyComparisons.** The h-topology on reduced separated finite-type K-varieties, arithmetic pairs as dense open interiors of reduced proper flat V-models with induced boundary log structure, semistable h-bases, enhanced rational syntomic h-realization and uniqueness, arithmetic and geometric period maps, product compatibility and equivalence after τ≤r for r≥0. The canonical classical-pair comparison for fine log-smooth Cartier-type arithmetic pairs and r≥0 is NN Proposition 3.18, p. 33, NN line 1688–1691. NN Theorem A(1),(4), Proposition 4.6 and Corollary 4.11 are reserved to the base owner. This extension compares its classical producers to that realization; it does not rebuild h-descent or prove a second semistable comparison theorem. For fine log-smooth Cartier-type arithmetic pairs and r≥0, supply the canonical classical-to-h quasi-isomorphism of NN Proposition 3.18; for reduced separated finite-type K-varieties, supply rational syntomic h-descent and the product-compatible arithmetic/geometric τ≤r period comparisons of NN Theorem A(1),(4), Proposition 4.6 and Corollary 4.11. Section contract: accepted sections unavailable; NN Theorem A(1),(4) ownership contract; NN Proposition 3.18, p. 33.

## How to read the build

Layer 1 constructs the exact coefficient category, its connection fibre and extension evaluation. Layer 2 assembles rigid syntomic cohomology on its natural fields. Layer 3 separates divided and undivided log-syntomic coefficients before gluing and completion. Layer 4 constructs their period maps and proves distinct exact and bounded conclusions. Layer 5 supplies adapters to the imported HK and rational h-realizations. Layer 6 promotes relative geometric data on explicit admissible domains and gives residue and extension projections. Layer 7 specializes those extensions at Frobenius-compatible points and identifies their absolute log/rigid syntomic values. Within a layer, numbered targets are in build order. Each paragraph fixes its hypotheses and locator, its named API, a proof dependency chain and discriminating Checks. The base’s general comparison theory is a supplier contract, not another implementation of these layers.

## Layer 1: Filtered Frobenius connections and extension evaluation

### 1.1 Coefficient objects and morphisms

Define `FilFMIC`. Define FilFMIC(S,σ) with objects (H_dR,H_rig,c,∇,F,Φ): coherent B_K- and B†_K-modules, c:H_dR⊗B_K B†_K≃H_rig, an integrable algebraic connection on H_dR, a finite exhaustive separated descending integer filtration with finite locally free graded pieces satisfying ∇F^j⊆Ω¹⊗F^(j−1), and a horizontal B†_K-linear isomorphism Φ:σ*H_rig≃H_rig. The induced connection on H_rig uses continuous differentials. Morphisms are pairs of linear maps preserving c, connection, filtration and Φ. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†. (AM, Definition 2.1 and Remark 2.2, pp. 3–4; AM line 117, AM line 131, AM line 155).

The named API is `FilFMIC.ofData` (The displayed geometric data and verified axioms construct an object.); `FilFMIC.hom_ext` (Two morphisms with equal de Rham and rigid component maps are equal.); `FilFMIC.fiberProductEquivalence` (Identify this category with filtered connections fibred over connections against overconvergent Frobenius connections.); `FilFMIC.forget` (Give additive realization functors and their coefficient-extension comparison; the de Rham realization is faithful, since c determines the rigid component. The rigid realization need not be faithful on generic-only components.).

The proof uses the following chain. Use the supplied coefficient/connection realization and form the fibre product category. Composition is componentwise; compatibility and horizontality are preserved by it. Local freeness of the finite filtration makes the underlying algebraic module finite projective on S_K.

*Needs:* AdicSpacesPartIV §F1.5; AdicSpacesPartIV §F1.9; required contract `relative-rigid-coefficients`.

**Checks.**

- `FilFMIC_zero`: Both modules zero, the unique connection and finite zero filtration give the zero object; Φ:0≃0 is invertible.
- `FilFMIC_unit`: Rank one with c natural, ∇=d, F⁰=B_K, F¹=0, Φ=σ is an object; its constant horizontal section 1 is fixed.
- `FilFMIC_nonhorizontal`: Over V[t,t⁻¹] with σ(t)=t^p, trivial ∇ and Φ(e)=t e fail horizontality since ∇Φ(e)=dt⊗e≠0. Invertibility alone must not admit this datum.
- `FilFMIC_ramifiedBaseObstruction`: For V=Z_p[π] with π²=p, a ring endomorphism fixing p sends π to valuation 1, while π^p has valuation at least 2. Their difference cannot lie in pV=(π²). Thus the required p-Frobenius modulo p does not exist, including at p=2. This base is admitted in the classical layers, not as an AM base.
- `FilFMIC_genericOnlyRealization`: For S=Spec(K) as a smooth affine V-scheme, B†=0. The datum H_dR=K,H_rig=0 with the unit filtration is admitted, and its identity is nonzero on de Rham realization but zero on rigid realization. Only the de Rham realization is asserted faithful.

### 1.2 Tensor operations, Tate twists and transport

Construct `FilFMIC.tensorTatePullback`. On FilFMIC define direct sums, tensor with the convolution filtration and tensor connection, the tensor unit, and duals with their dual filtration and inverse-transpose Frobenius. For every integer m define O_S(m) by Φ=p^(−m)σ and F^(−m)=B_K, F^(−m+1)=0. A morphism g:S′→S of smooth affine V-schemes induces a tensor pullback. Change of compatible Frobenius lift σ→σ′ gives tensor equivalences satisfying identity and cocycle laws; no equation gσ′=σg is required when pullback is defined through isocrystals. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; S′ is smooth affine and carries a compatible Frobenius lift. (AM, Remark 2.2, Definition 2.3 and (2.1), pp. 4–5; AM line 164, AM line 171, AM line 181, AM line 206).

The named API is `FilFMIC.tateTensor` (O(a)⊗O(b)≃O(a+b), with Φ=p^(−a−b)σ and the stated filtration.); `FilFMIC.pullback_comp` (Pullbacks compose up to the canonical tensor natural isomorphism; identity pullback is identity.); `FilFMIC.changeFrobenius_cocycle` (The equivalences for σ,σ′,σ″ compose canonically and preserve the de Rham component.); `FilFMIC.dualEvaluation` (The evaluation and coevaluation are horizontal, filtered and Frobenius compatible and satisfy the triangle identities.).

The proof uses the following chain. Tensor and dualize finite projective realizations; use the isocrystal realization equivalence for Frobenius transport. The scalar p is nonzero in K, hence invertible; negative twists use integer powers only in characteristic zero.

*Needs:* Layer target 1.1; required contract `relative-rigid-coefficients`.

**Checks.**

- `FilFMIC.tensorTatePullback_twistOne`: O(1) has F⁰=0, F⁻¹=B_K and Φ=p⁻¹σ; the opposite exponent is rejected.
- `FilFMIC.tensorTatePullback_tensorCancel`: O(1)⊗O(−1)≃O(0), and a zero factor gives zero.
- `FilFMIC.tensorTatePullback_identityPullback`: Identity base map and unchanged σ give the identity on every component, not an extra scalar automorphism.

### 1.3 Strict exactness and Yoneda functoriality

Construct `FilFMIC.exactStructure`. Equip FilFMIC with a `TauCeti.ExactStructure` whose conflations 0→H′→H→H″→0 are exact on F^j of the de Rham realization for every j∈ℤ. Compare with strict exactness and the induced rigid exact sequence. Tensoring with each fixed object, duality (viewed from the opposite exact category) and the pullbacks and equivalences of 1.2 satisfy `TauCeti.ExactStructure.IsConflationExact`. On the supplied general Yoneda construction export Ext^i(H,H′) for i≥0, Baer addition, Q_p-linearity, splicing, pushout, pullback and coefficient-category naturality. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; Use an essentially small model, with Ext transported back independently of the model. (AM, Exact structure and Yoneda groups, p. 5; AM line 186–217; Buhler Definition 2.1, p. 5, Buhler line 195).

The named API is `FilFMIC.conflation_iff` (A short sequence is a conflation exactly when each F^j sequence is exact.); `FilFMIC.ext_map` (Conflation-exact functors induce maps on all Yoneda groups, commuting with splicing and Baer addition.); `FilFMIC.ext_zero` (Ext⁰ is Hom and split 1-extensions represent zero.); `FilFMIC.ext_universe` (Changing the small model induces canonical group isomorphisms preserving representatives.); `FilFMIC.ext_cup` (The biexact tensor product gives Ext^i(O,H)×Ext^j(O,H′)→Ext^(i+j)(O,H⊗H′) for i,j≥0, compatible with associativity, the unit and the Koszul symmetry.).

The proof uses the following chain. Check the Quillen axioms by filtered module pushouts/pullbacks and locally split graded pieces, transporting the rigid component along c; use the coefficient exactness contract. Apply general exact-category Yoneda theory, rather than Mathlib HasExt on a category without an abelian structure. Biexact tensor gives the external extension product; pull back along O≃O⊗O for the unit-source cup.

*Needs:* Layer target 1.1; Layer target 1.2; Tau Ceti `TauCeti.ExactStructure` and `TauCeti.ExactStructure.IsConflationExact`; required contract `exact-yoneda`; required contract `relative-rigid-coefficients`.

**Checks.**

- `FilFMIC.exactStructure_splitExtension`: 0→H→H⊕O→O→0 is exact on each filtration step and has Yoneda class zero.
- `FilFMIC.exactStructure_zeroCoefficient`: Ext¹(O,0)=0 and Ext⁰(O,O) is the actual filtered horizontal Frobenius-compatible endomorphism group.
- `FilFMIC.exactStructure_nonStrictIdentity`: At Spec(Z_p), take A with F⁰A=K and B with F⁰B=0, F⁻¹B=K, both Φ=σ. The identity B→A is a morphism but not an isomorphism or a strict admissible map; its inverse does not preserve F⁰. Underlying-module exactness must not define conflations.

### 1.4 The coefficient mapping fibre

Define `FilFMIC.syntomicConnectionComplex`. For H∈FilFMIC set A_H^j=Ω^j_(B_K/K)⊗F^(−j)H_dR and B_H^j=Ω^j_(B†_K/K)⊗H_rig for j≥0, zero otherwise. Their differential sends ω⊗h to dω⊗h+(−1)^jω∧∇h. Define S_σ(H)=Fib(1−Φ:A_H→B_H), where Φ includes σ on forms and c identifies the coefficients. This is a functor to complexes of Q_p-vector spaces, exact on conflations. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; Ω on B† uses the supplied continuous differential module. (AM, Definition 2.4 and (2.2), pp. 6–7; AM line 224, AM line 249, AM line 258).

The named API is `FilFMIC.syntomicConnectionComplex_d` (Fib(f)^j=A^j⊕B^(j−1) and d(a,b)=(da,f(a)−db), with an explicit isomorphism to the supplied cone[-1].); `FilFMIC.syntomicConnectionComplex_d_sq` (The differential squares to zero by integrability, horizontality and transversality.); `FilFMIC.syntomicConnectionComplex_map` (Morphisms act componentwise and yield a fibre triangle natural in H.); `FilFMIC.syntomicConnectionComplex_exact` (A conflation gives a degreewise short exact sequence of coefficient fibre complexes.); `FilFMIC.syntomicConnectionComplex_cup` (Construct the natural homotopy-coherent pairing S(H)⊗S(H′)→S(H⊗H′) from the two multiplicative maps 1 and Φ, giving the unit and graded symmetry on cohomology.).

The proof uses the following chain. Griffiths transversality makes A a subcomplex, integrability gives d²=0, and Frobenius horizontality gives a chain map. Apply the enhanced fibre construction and strict exactness termwise. Compare the chosen coordinates to Mathlib mappingCone rather than redefine cones. The identity 1−Φ on a tensor product decomposes into the two tensor maps, giving the standard fibre pairing; its homotopies give the unit and symmetry on cohomology.

*Needs:* Layer target 1.1; Layer target 1.3; EnhancedDerivedSheaves §§0.1–0.4; Mathlib `CochainComplex.mappingCone`.

**Checks.**

- `FilFMIC.syntomicConnectionComplex_pointUnit`: At k=F_p, S(O(0)) is [Q_p —0→ Q_p] in degrees 0,1; both cohomology groups are Q_p. The degree-zero class 1 is the cup unit.
- `FilFMIC.syntomicConnectionComplex_pointTate`: At the same point S(O(1)) is Q_p in degree 1, since F⁰O(1)=0. It is not the fibre of 1−p⁻¹ on all of K.
- `FilFMIC.syntomicConnectionComplex_zero`: S(0)=0. The two-term fibre of multiplication 2 on Q is [Q —2→ Q] and is acyclic, including the sign on its second differential.

### 1.5 Evaluation of extensions

Construct `FilFMIC.extEvaluation`. For every i≥0 and H∈FilFMIC construct the Q_p-linear map u_i:Ext^i(O_S,H)→H^i(S_σ(H)). For an admissible i-extension, apply S_σ and send 1∈H⁰(S_σ(O_S)) to its iterated connecting image. At i=0 it sends f:O_S→H to the class f(1). Prove independence of the extension representative, additivity, pushout/pullback naturality and compatibility with the de Rham projection to H^i(A_H). Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†. (AM, Equations (2.3)–(2.7), pp. 6–7; AM line 229, AM line 258, AM line 266).

The named API is `FilFMIC.extEvaluation_representative` (u_i sends a representative to δ(1), with connecting maps in extension order.); `FilFMIC.extEvaluation_natural` (Base pullback, coefficient morphisms and change-of-σ realization commute with u_i.); `FilFMIC.extEvaluation_deRham` (Projection to A_H agrees with evaluation after forgetting Φ.); `FilFMIC.extEvaluation_cup` (For i,j≥0, u_(i+j)(E cup E′)=u_i(E) cup u_j(E′), using ext_cup and syntomicConnectionComplex_cup with their actual coefficient tensor.).

The proof uses the following chain. Degreewise exactness gives connecting maps. Naturality under extension diagrams gives descent through zigzags, and the diagonal/codiagonal definition of Baer sum proves additivity. The class of 1 is used even on disconnected S; no assertion H⁰(S(O))=Q_p is needed. Tensor the representative extensions and compare their connecting maps in the resulting bicomplex to prove the cup identity, including the cochain sign.

*Needs:* Layer target 1.3; Layer target 1.4; required contract `exact-yoneda`.

**Checks.**

- `FilFMIC.extEvaluation_degreeZero`: For i=0, the identity of O maps to 1; the zero map maps to zero.
- `FilFMIC.extEvaluation_split`: Every split 1-extension evaluates to zero.
- `FilFMIC.extEvaluation_pointNonSplit`: Over Spec(Z_p), extension with basis h,e, F⁰M=M, ∇=0, Φh=h, Φe=e−h gives u_1=(0,h) in coker(1−Φ on H)=Q_p. This is nonzero; it detects reversal of 1−Φ.

### 1.6 Canonical representatives and the two projections

Prove `FilFMIC.extEvaluation_injective`. If F⁰H_dR=0, u_1 is injective. For every conflation 0→H→M→O_S→0 there is a unique e∈F⁰M_dR mapping to 1. Under c its class is (∇e,(1−Φ)e); it satisfies d∇e=0 and (1−Φ)∇e=d((1−Φ)e). Thus define δ(E)=∇e and R_σ(E)=(1−Φ)e without a quotient ambiguity. δ is unchanged by Frobenius-lift transport. Under the identified underlying extension and filtered lift e, R_σ′−R_σ=(Φ_σ−Φ_σ′)e, where Φ_σ′ is the transported Frobenius from the supplied isocrystal equivalence. No σ-independence of R is asserted. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; F⁰H_dR=0. (AM, Lemma 2.5, (2.10) and (2.22), pp. 7–8,19; AM line 283, AM line 289, AM line 795, AM line 808).

The named API is `FilFMIC.extension_filteredLift` (Strict exactness identifies F⁰M_dR with B_K, so the lift is unique.); `FilFMIC.extEvaluation_injective` (A zero representative yields a horizontal Φ-fixed filtered splitting; a splitting yields zero.); `FilFMIC.delta` (The first component lies in Ω¹⊗F⁻¹H_dR and equals the de Rham evaluation.); `FilFMIC.frobeniusRemainder` (The second component lies in H_rig and satisfies dR_σ=(1−Φ)δ.).

The proof uses the following chain. Since F⁰H=0, the degree-zero source A_H is zero. A zero degree-one class is then the zero pair, not merely an arbitrary coboundary. Its lift is a filtered horizontal Frobenius-fixed splitting. This target uses no Milnor-symbol construction.

*Needs:* Layer target 1.4; Layer target 1.5.

**Checks.**

- `FilFMIC.extEvaluation_injective_splitLift`: In H⊕O the lift e=(0,1) gives δ=0 and R_σ=0.
- `FilFMIC.extEvaluation_injective_pointTateRemainder`: For H=O(1) at Spec(Z_p), Φe=e+a h gives (∇e,(1−Φ)e)=(0,−a h). The sign must be negative.
- `FilFMIC.extEvaluation_injective_noFzero`: For H=O(0) at the same point, lifts of 1 in a split extension differ by c h. Therefore unique-lift coordinate projections are not exported without F⁰H=0.

### Examples

At S=Spec(Z_p), compute Tate objects and split and nonsplit extensions. Over the dagger affine line test horizontality and change of Frobenius lift.

### Dependencies

Tau Ceti exact structures and conflation-exact functors; AdicSpacesPartIV §§F1.5, F1.7–F1.9; EnhancedDerivedSheaves §§0.1–0.4; gaps relative-rigid-coefficients and exact-yoneda. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 2: Rigid syntomic assembly on natural coefficient fields

### 2.1 The de Rham-to-rigid diagram

Construct `RigidSyntomic.specializationDiagram`. For smooth separated finite-type X/V construct, on the imported realization carriers, the natural map sp_X:RΓ_dR(X_K/K)→RΓ_rig(X_k/K), its composites sp_r from F^rRΓ_dR, and its compatibility with pullback, finite field extension and products. Retain the scalar-extension map bc:A=RΓ_rig(X_k/K0)→C=RΓ_rig(X_k/K) and σ-semilinear φ on A. Choices of algebraic compactification, rigid frame and resolution yield coherently equivalent diagrams, not additional intrinsic structure on X. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0. (BesserI, §5 and §4.22, manuscript pp. 16–18; BesserI line 625, BesserI line 648, BesserI line 663).

The named API is `RigidSyntomic.specialization_natural` (For f:Y→X, f*_rig sp_X=sp_Y f*_dR, with the coherent comparison on resolutions.); `RigidSyntomic.specialization_filtered` (sp_(r+1) factors through the filtration map F^(r+1)→F^r.); `RigidSyntomic.specialization_product` (sp_(r+s)(a∪b)=sp_r(a)∪sp_s(b).).

The proof uses the following chain. Pass from logarithmic algebraic forms on a smooth proper generic-fibre compactification to analytic forms, then to the tube of the special fibre and overconvergent forms. Use the supplied independence and common-refinement comparisons. No new rigid cohomology realization or compactification-existence theorem is built here.

*Needs:* required contract `base-ownership`; required contract `rigid-realizations`; AdicSpacesPartIV §F1.7; RigidAnalyticGeometry §8.1; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `RigidSyntomic.specializationDiagram_point`: For Spec(V), sp in degree zero is id_K and bc is K0→K.
- `RigidSyntomic.specializationDiagram_empty`: For the empty scheme every realization and map is zero.
- `RigidSyntomic.specializationDiagram_notEquivalence`: For Spec(K) regarded as a smooth finite-type V-scheme, sp:K→0 in degree zero is not an equivalence. No equivalence is attached to general smooth open X.

### 2.2 The rigid syntomic fibre

Define `RigidSyntomic.complex`. Define RΓ_rsyn(X,r)=Fib(f_r:A⊕F^rRΓ_dR(X_K/K)→A⊕C) in enhanced Q_p-complexes, where f_r(a,b)=((1−p^(−r)φ)a,bc(a)−sp_r(b)). Define H^q_rsyn(X,r)=H^q of this fibre for q∈ℤ. This is contravariant in smooth separated finite-type X/V and independent of all presentations. The Frobenius part is Q_p-linear; it is not generally K0-linear. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0. (BesserI, Definition 6.1, Proposition 6.3 and its cone description, manuscript pp. 19–20; BesserI line 704, BesserI line 712, BesserI line 741).

The named API is `RigidSyntomic.complex_fiberTriangle` (The fibre has its two projections and null-homotopies for f_r, and satisfies the enhanced fibre universal property.); `RigidSyntomic.complex_map` (Pullback preserves both component projections and composes coherently.); `RigidSyntomic.complex_independent` (A refinement of presentation induces an equivalence commuting with all component maps.); `RigidSyntomic.cohomology` (Take cohomology as Q_p-vector spaces, with no artificial K0-linearity requirement.).

The proof uses the following chain. Apply the enhanced fibre construction to the actual diagram in 2.1. Forgetting enhancements recovers Besser’s iterated cone via the two cone projections. All maps are formed in Q_p-complexes so σ-semilinearity causes no invalid scalar-linear morphism.

*Needs:* Layer target 2.1; EnhancedDerivedSheaves §§0.1–0.4; Mathlib `CochainComplex.mappingCone`.

**Checks.**

- `RigidSyntomic.complex_pointWeightZero`: For V=Z_p and r=0, f(a,b)=(0,a−b). Thus H⁰=Q_p on the diagonal, H¹=Q_p on the first target component, and all other groups vanish.
- `RigidSyntomic.complex_pointPositiveWeight`: For V=Z_p and r>0, F^rRΓ_dR=0 and f(a)=((1−p^(−r))a,a); H⁰=0 and H¹=Q_p. This retains the two different target components.
- `RigidSyntomic.complex_genericOnly`: If X_k is empty, the fibre is F^rRΓ_dR(X_K), rather than zero.

### 2.3 Exact sequence, descent, products and the unramified presentation

Prove `RigidSyntomic.basicTheory`. The fibre triangle of 2.2 gives, for every q∈ℤ, the long exact sequence with middle map H^q(A⊕F^rRΓ_dR)→H^q(A⊕C) induced by f_r. Finite Zariski Čech covers give descent. Construct associative unital graded-commutative products H^i_rsyn(X,r)×H^j_rsyn(X,s)→H^(i+j)_rsyn(X,r+s), compatible with both realization maps and pullback. If K=K0, identify RΓ_rsyn(X,r) with Fib((1−p^(−r)φ)sp_r:F^rRΓ_dR→RΓ_rig(X_k/K)), without assuming sp is invertible. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r,s≥0; The last equivalence assumes K=K0. (BesserI, Propositions 6.2–6.3, Definition 6.5 and Remark 8.7(3), manuscript pp. 19–20,28; BesserI line 719, BesserI line 727, BesserI line 752, BesserI line 1073).

The named API is `RigidSyntomic.longExact` (Every kernel equals the image of the preceding arrow, with the connecting map induced by the fixed fibre coordinates.); `RigidSyntomic.cup` (Products carry the Koszul sign (−1)^(ij); realization maps preserve products.); `RigidSyntomic.cech` (The pullback to a finite Čech nerve is an equivalence.); `RigidSyntomic.unramifiedFiber` (Eliminate the equation a=sp_r(b) in the second component of f_r to obtain the single fibre.).

The proof uses the following chain. Use exactness of the cohomology functor on the fibre triangle. Descent is checked on A,F^rDR,C. Products come from the multiplicative comparison diagram and the standard homotopy product on a fibre of 1−φ_r; pass to cohomology for graded commutativity. The unramified equivalence is Gaussian elimination of an identity component, not inversion of sp.

*Needs:* Layer target 2.2; EnhancedDerivedSheaves §E5:abstract; required contract `rigid-realizations`.

**Checks.**

- `RigidSyntomic.basicTheory_elimination`: At Spec(Z_p), r=0, the single fibre [Q_p —0→ Q_p] gives the groups of 2.2.
- `RigidSyntomic.basicTheory_gMfrobenius`: For t on G_m and σ(t)=t^p, φ(dlog t)=p dlog t; in weight 1, (1−φ/p)dlog t=0. A twist p instead of p⁻¹ fails.
- `RigidSyntomic.basicTheory_emptyProduct`: Cohomology of the empty scheme is zero and every product involving it vanishes.

### Examples

Use a point, the generic-fibre-only smooth V-scheme Spec(K), and G_m with its logarithmic differential. Keep A over K0 and the fibre over Q_p.

### Dependencies

AdicSpacesPartIV §§F1.5–F1.9; RigidAnalyticGeometry §§8.1,8.4; EnhancedDerivedSheaves §§0.1–0.4; gaps base-ownership and rigid-realizations. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 3: Divided and undivided log-syntomic complexes

### 3.1 Divisibility before finite-level reduction

Define `LogSyntomic.divisiblePD`. For a log-syntomic X/W(k), n≥1 and r≥0 define J_n^⟨r⟩ using a level n+s, s≥r, by the Frobenius-divisibility submodule of J_(n+s)^[r] on which φ lands in p^r O_cr,n+s, followed by the standard reduction modulo p^n. Construct φ_r:J_n^⟨r⟩→O_cr,n by division at that higher level. Prove auxiliary-level independence, Z/p^n-flatness, reduction J_(n+1)^⟨r⟩⊗Z/p^n≃J_n^⟨r⟩, and equality with J_n^[r] for 0≤r≤p−1. For j≤0 use J^[j]=O_cr and the source’s compatible degree conventions in PD de Rham presentations. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X is log-syntomic over W(k); n≥1; r≥0; s≥r. (EN, §2.1 and §2.1.1, pp. 4–5; EN line 158, EN line 165, EN line 198).

The named API is `LogSyntomic.divisiblePD_independent` (The maps from larger s identify the reduced divisibility modules and φ_r.); `LogSyntomic.divisiblePD_reduce` (Reduction in n commutes with divided Frobenius.); `LogSyntomic.divisiblePD_smallWeight` (For r≤p−1 the inclusion into J_n^[r] is an equality.); `LogSyntomic.dividedFrobenius_spec` (On a divisible lift x, p^r times its divided image is φ(x), with independence proved using the higher level, not inferred from this equation modulo p^n alone.).

The proof uses the following chain. Use the supplied flat crystalline coefficient sheaves and their higher-level Frobenius divisibility. Compare all choices after passing to a common higher level and reducing. The PD valuation estimate gives the small-weight equality. These are filtered coefficient constructions, not inversion of p in Z/p^n.

*Needs:* required contract `crystalline-inputs`.

**Checks.**

- `LogSyntomic.divisiblePD_weightZero`: At r=0, J_n^⟨0⟩=O_cr,n and φ_0=φ.
- `LogSyntomic.divisiblePD_smallPrime`: At p=2,r=1, the small-weight equality J^⟨1⟩=J^[1] applies even though the exact period theorem of 4.3 has range r≤0.
- `LogSyntomic.divisiblePD_noDivisionModp`: In Z/p, multiplication by p kills both 0 and 1. Thus the equation p y=0 does not define a unique divided image; a definition using arbitrary division modulo p is rejected.

### 3.2 Two integral fibres on their sites

Define `LogSyntomic.complexes`. Define S_n(r)=Fib(1−φ_r:J_n^⟨r⟩→O_cr,n) and S′_n(r)=Fib(p^r−φ:J_n^[r]→O_cr,n) on the log-syntomic site. On the étale site use their derived pushforward Rε_* and name the comparison explicitly. For every q∈ℤ give the corresponding crystalline long exact sequences, with J^⟨r⟩ for the divided version and J^[r] for the undivided version. On the syntomic site identify the divided fibre with the kernel sheaf using surjectivity; that identification is not silently transported to the étale site. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X is log-syntomic over W(k); n≥1; r≥0. (EN, §2.1, equation (2.1), pp. 4–5; EN line 158, EN line 169, EN line 178, EN line 196).

The named API is `LogSyntomic.dividedTriangle` (S_n(r) is the enhanced fibre with its natural projection and null-homotopy.); `LogSyntomic.undividedTriangle` (S′_n(r) is the fibre of the stated undivided map.); `LogSyntomic.realization` (Derived global sections agree with the crystalline coefficient fibre through the supplied realization.); `LogSyntomic.reduce` (Construct the transition maps in n and their compatible fibre triangles.).

The proof uses the following chain. Apply the enhanced fibre and derived pushforward. The crystalline realization contract identifies RΓ of coefficient sheaves with crystalline complexes; the cohomology triangle gives exactness. Only on the syntomic site use surjectivity of 1−φ_r to replace the fibre by its kernel.

*Needs:* Layer target 3.1; required contract `crystalline-inputs`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `LogSyntomic.complexes_weightZero`: S_n(0)=S′_n(0)=Fib(1−φ:O_cr,n→O_cr,n).
- `LogSyntomic.complexes_zeroMapModel`: For zero endomorphism f:A[0]→B[0], the fibre has H⁰=A and H¹=B. Ordinary kernels would lose B.
- `LogSyntomic.complexes_empty`: On the empty log scheme both derived global section complexes are zero.

### 3.3 Error maps and multiplicative structure

Construct `LogSyntomic.omegaTauProducts`. Construct ω_r:S′_n(r)→S_n(r) from (p^r,id) on source and target coefficients and τ_r:S_n(r)→S′_n(r) from (inclusion,p^r). Their composites are multiplication by p^r; on cohomology kernels and cokernels are annihilated by p^r. Construct the PD cup products in weights r,s≥0 for both families, compatible with crystalline products, transition maps and ω. Retain the source’s warning that τ has no general multiplicativity contract; no algebra-map instance for τ is exported. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X log-syntomic over W(k); n≥1; r,s≥0. (EN, §§2.1–2.1.2, pp. 5–6; EN line 193, EN line 219, EN line 243).

The named API is `LogSyntomic.tau_omega` (τ_rω_r=p^r id and ω_rτ_r=p^r id.); `LogSyntomic.omega_error` (Every kernel and cokernel of H^q(ω_r), and of H^q(τ_r), is killed by p^r.); `LogSyntomic.omega_cup` (ω_(r+s)(a∪b)=ω_r(a)∪ω_s(b).); `LogSyntomic.cup_reduce` (Cup products commute with reduction n+1→n and with PD realization.).

The proof uses the following chain. Verify each chain square before passing to the fibres. The two composite identities imply the kernel/cokernel bounds by elementary module algebra. Use the explicit PD fibre products of EN §2.1.2 and descend them to the étale site; assert only the supplied multiplicative comparison for ω.

*Needs:* Layer target 3.2; EnhancedDerivedSheaves §E5:abstract.

**Checks.**

- `LogSyntomic.omegaTauProducts_weightZero`: ω_0 and τ_0 are identity maps, and the error exponent is zero.
- `LogSyntomic.omegaTauProducts_errorNotIso`: On the model module Z/p², the map multiplication p has kernel and cokernel killed by p but is not invertible. A killed-error assertion must not generate an integral equivalence.
- `LogSyntomic.omegaTauProducts_productUnit`: The weight-zero unit acts as identity; odd degree classes use the cochain Koszul sign, including at p=2 without division by 2.

### 3.4 Local PD presentations, gluing and rational fibres

Construct `LogSyntomic.presentationsAndCompletion`. For an étale-local exact log immersion into a log-smooth W(k)-scheme with compatible Frobenius lifts, identify S_n(r),S′_n(r) with the corresponding log-PD-envelope de Rham fibres, using J^⟨r−j⟩ or J^[r−j] in degree j and the total Frobenius on forms. Prove independence of immersion and lifts and coherent gluing. For an arithmetic pair (U,Ubar) log-smooth over V with canonical log structure, set RΓ_syn(U,Ubar,r)=Rlim_n RΓ(S′_n(r)) and RΓ_syn,Q=RΓ_syn⊗Q_p. Construct the rational equivalence to Fib((1−φ/p^r,can):RΓ_cr,Q→RΓ_cr,Q⊕RΓ_dR/F^r), using the filtered crystalline/de Rham quotient comparison. Both integral families become equivalent after rationalization via ω and τ, with the required p^r rescaling visible. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); n≥1; r≥0; An arithmetic pair is a dense open K-variety inside a reduced proper flat V-scheme, with fine integral quasi-coherent boundary log structure; Log-smoothness and the existence of local exact log-PD presentations are retained. (EN, §2.1.1, p. 5, EN line 198–218; NN §3.2, equation (32), pp. 25–26, NN line 1299, NN line 1323).

The named API is `LogSyntomic.localPDComparison` (The local de Rham fibre computes the derived sheaf fibre on its stated site.); `LogSyntomic.presentationRefinement` (Common log-PD refinements commute with Frobenius and give equivalences satisfying cocycle laws.); `LogSyntomic.completedReduction` (On the NN arithmetic-pair domain, the completed complex reduces derivedly to the n-th complex.); `LogSyntomic.rationalFiber` (The second target component is the derived quotient RΓ_dR/F^r, with its canonical quotient map.).

The proof uses the following chain. Use the filtered log-crystalline Poincaré lemma on each presentation, compare via products of ambient embeddings and descend using enhanced coherences. Rlim commutes with finite fibres; derived reduction is the crystalline reduction theorem in the contract. Rationally identify the filtered ideal fibre with the fibre of (1−φ_r,can) and apply the supplied filtered de Rham quotient equivalence.

*Needs:* Layer target 3.2; Layer target 3.3; required contract `crystalline-inputs`; required contract `rational-descent`; EnhancedDerivedSheaves §E2:towers.1; required contract `crystalline-filtered-quotient`.

**Checks.**

- `LogSyntomic.presentationsAndCompletion_rzero`: F⁰RΓ_dR=RΓ_dR on these de Rham complexes, so the rational presentation at r=0 has zero quotient component.
- `LogSyntomic.presentationsAndCompletion_rationalError`: After tensoring Q_p, p^r is invertible, so ω is an equivalence with inverse p^(−r)τ; τ alone is not claimed to be its inverse.
- `LogSyntomic.presentationsAndCompletion_tower`: For A_n=⊕_(j≥n) F_p (n≥0) with inclusion transitions, lim A_n=0 but H¹(Rlim A_n)=lim¹ A_n≃(∏_(j≥0) F_p)/(⊕_(j≥0) F_p)≠0; the class of (1,1,…) is nonzero. Indeed, 0→A_n→B→C_n→0 with constant B=⊕_(j≥0) F_p and C_n=⊕_(j<n) F_p gives lim C_n=∏ F_p and lim¹ B=lim¹ C_n=0, since both latter towers are Mittag–Leffler. Replacing Rlim by lim would erase this H¹ (StacksRlim, Tag 07KV, Lemmas 15.88.1–15.88.2, StacksRlim line 10638–10675).

### Examples

At weight zero the two constructions coincide. At p=2 keep every nonnegative weight while exact-range results remain separate. Track reduction n+1→n before rationalization.

### Dependencies

CrystallineCohomology through gaps crystalline-inputs and crystalline-filtered-quotient; EnhancedDerivedSheaves §§0.1–0.4 and E2:towers.1; Layer 2 for comparison vocabulary. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 4: Classical period maps and their precise ranges

### 4.1 Ordinary and modified Tate lattices

Define `Syntomic.modifiedTateLattices`. For r≥0 let L(r)=Z_p(r), a=floor(r/(p−1)), b=r−(p−1)a, so 0≤b<p−1. Define L_EN(r)=(p^a a!)⁻¹L(r), and for a specified CN decomposition r=(p−1)a_c+b_c with a_c≥0 and 0≤b_c≤p−1 define L_CN(r;a_c)=p^(−a_c)L(r). These are lattices inside Q_p(r), and their mod-p^n versions are L/p^nL, not subgroups obtained by dividing elements in Z/p^n. Construct inclusions and scalar-coordinate isomorphisms. For a_c=a, L_EN=(a!)⁻¹L_CN and the inclusion L_CN→L_EN has cokernel killed by p^v_p(a!). If the alternative CN endpoint decomposition exists, its lattice differs by one factor p; transport period maps and error bounds explicitly. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0; n≥1; The denominator p^a a! is nonzero because p is prime and the ambient field has characteristic zero. (EN, §2.2, p. 7, EN line 299–308; NN §4.1, p. 44, NN line 2324; CN §§1.1.1,2.4.3, pp. 2,23, CN line 67, CN line 968).

The named API is `Syntomic.modifiedLattice_inclusion` (Give the actual lattice inclusions and their induced maps after reduction, recording that reduction of an inclusion need not be injective.); `Syntomic.modifiedLattice_coordinate` (Relative to t_EN=t/(p^a a!), the ordinary generator t has coordinate p^a a!, not 1.); `Syntomic.modifiedLattice_EN_CN` (The equal-decomposition adapter sends the CN generator to a! times the EN generator.); `Syntomic.modifiedLattice_errorTransport` (Composing a map whose kernel/cokernel is killed by p^A with a lattice inclusion of cokernel exponent p^B gives a bound p^(A+B) on kernel/cokernel, also after the finite-level coefficient adapter.).

The proof uses the following chain. All lattices are actual scalar multiples of the same rank-one Q_p-local system. Compute inclusions in generator coordinates and use the p-adic valuation of factorials for error transport. CN’s printed endpoint inequality is inclusive; retain the decomposition as data, and when fixing the floor convention transport from any alternate endpoint with its one-power error.

*Needs:* EtaleCohomologyFoundations §F.0.3; EtaleCohomologyFoundations §F.4.1–§F.4.5; required contract `period-rings`.

**Checks.**

- `Syntomic.modifiedTateLattices_weightZero`: At r=0 choose a=a_c=b=b_c=0. Both modified lattices equal Z_p and the inclusion is identity.
- `Syntomic.modifiedTateLattices_factorial`: For p=2,r=2 with a_c=2, L_CN=(1/4)Z_2(2), L_EN=(1/8)Z_2(2). Inclusion has coordinate 2; at n=1 its reduction is zero, not an isomorphism.
- `Syntomic.modifiedTateLattices_boundary`: At r=p−1, CN permits (a_c,b_c)=(1,0) or (0,p−1); the two lattices are p⁻¹L and L. Their adapter is multiplication p in generator coordinates, so endpoint ambiguity cannot be treated as definitional equality.

### 4.2 Period morphisms and their targets

Construct `Syntomic.fontaineMessingPeriod`. Let X be fine saturated log-smooth over V with the canonical log structure, i:X0→X and j:X_tr→X. For 0≤r≤p−2 construct the divided map α_n,r:S_n(r)→i*Rj_*(Z/p^n(r)). For every r≥0 construct the modified-lattice divided map and its composite with ω, α′_n,r:S′_n(r)→i*Rj_*(L_EN(r)/p^n). Export the CN-normalized undivided map to its L_CN lattice with its specified coordinate adapter. All maps are natural in X and n and compatible with cup products through the corresponding coefficient product maps. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); n≥1; r≥0; Use fine saturated log smoothness; X_tr is the open trivial-log locus, including removal of horizontal boundary. (EN, §2.2 and §2.2.1, pp. 7–8; EN line 299, EN line 311, EN line 326; CN §5.1.2, p. 54, CN line 2587).

The named API is `Syntomic.period_reduce` (Coefficient reduction and the transition maps of S,S′ commute with α,α′.); `Syntomic.period_omega` (The undivided EN map is the modified divided map composed with ω.); `Syntomic.period_product` (The cup square commutes with the actual lattice product, not an identification of all twists.); `Syntomic.period_site` (The target is on X0_et; global sections use RΓ(X0,i*Rj_*−).).

The proof uses the following chain. Apply the filtered crystalline Poincaré lemma and the period-ring fundamental sequence on the syntomic-étale site, then push to X0_et using the supplied projection comparisons. Construct the modified map before using ω. Period-ring multiplication proves the cup square.

*Needs:* Layer target 3.3; Layer target 3.4; Layer target 4.1; required contract `period-rings`; required contract `nearby-cycle-inputs`.

**Checks.**

- `Syntomic.fontaineMessingPeriod_zeroWeight`: At r=0, ω=id and the modified and ordinary lattices agree, so both period constructions coincide.
- `Syntomic.fontaineMessingPeriod_unit`: The weight-zero syntomic unit maps to 1 in nearby cycles.
- `Syntomic.fontaineMessingPeriod_site`: For nonproper X no equation RΓ(X0,i*Rj_*−)=RΓ(X_tr,−) is inferred. Generic-fibre cohomology on X uses the glued complexes in 4.5.

### 4.3 Exact divided comparison

Prove `Syntomic.smallWeightComparison`. For X fine saturated log-smooth over V with canonical log structure, n≥1 and 0≤r≤p−2, the divided α induces an equivalence S_n(r)≃τ≤r i*Rj_*Z/p^n(r) on X0_et, and S_n(r) has no cohomology sheaves above r. Exactness is asserted for the divided complex and ordinary Tate lattice in this range only. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X fine saturated and log-smooth over V with canonical log structure; n≥1; 0≤r≤p−2. (EN, Proposition 2.1 and Theorem 2.2, pp. 5,7; EN line 186, EN line 318).

The named API is `Syntomic.smallWeight_truncation` (The source equals its τ≤r truncation.); `Syntomic.smallWeightComparison_natural` (The equivalence is the map of 4.2 and respects reduction and products whenever all involved weights are in range.).

The proof uses the following chain. Use the local inverse Cartier and boundary-stratum symbol calculations with the filtered PD presentation to prove the level-one, equal-degree/weight comparison on smooth normal-crossings charts. Products with the degree-zero twist classes give q≤r; the tame degree-(p−1) descent removes the μ_p assumption, and coefficient exact triangles give all n≥1. For general fs log-smooth X, prove invariance under the toric log blow-ups and use proper base change and the one-dimensional-fibre stalk induction of TsujiNearby Lemmas 3.2 and 5.2 to reduce to those charts, then glue. The local PD degree calculation gives vanishing above r (EN Proposition 2.1). These reductions are proof obligations of this target; no full small-weight period equivalence is a supplier premise (TsujiNearby §4 proof of Theorem 4.2, pp. 554–555, and §5 proof of Theorem 5.1, pp. 558–561; TsujiNearby line 892–940, TsujiNearby line 1074–1140).

*Needs:* Layer target 4.2; required contract `nearby-cycle-inputs`; required contract `crystalline-inputs`; required contract `nearby-cycle-cartier`; required contract `nearby-cycle-graded`.

**Checks.**

- `Syntomic.smallWeightComparison_p2`: At p=2 the range contains r=0 and excludes r=1; no positive-weight exact theorem follows from this statement.
- `Syntomic.smallWeightComparison_p3`: At p=3, r=0,1 are admitted and r=2 is excluded.
- `Syntomic.smallWeightComparison_undivided`: For r>0 the identities τω=ωτ=p^r do not let this equivalence transfer to S′ integrally.
- `Syntomic.smallWeightComparison_cartierWitness`: On the residue chart Y=G_m over F_p, inverse Cartier sends t dlog t to [t^p dlog t]≠0 in Z¹/B¹, whereas [t dlog t]=[dt]=0; replacing its Frobenius-semilinear coefficient rule by the identity would fail. This is a residue-fibre calculation, even when X_1 is a thicker mod-p fibre over ramified V.

### 4.4 All weights and bounded error

Prove `Syntomic.boundedPeriodComparison`. Assume X is étale locally a CN semistable chart, including base changes of semistable models: étale over V[x₁^±1,…,x_a^±1,x_(a+1),…,x_d,x_(d+1)]/(x_(d+1)x_(a+1)…x_(a+b)−π^h), 1≤h≤e, with log structure from special fibre and x_(a+b+1)…x_d=0. For all n≥1,r≥0 and 0≤q≤r, H^q(α′_CN) has kernel and cokernel killed by p^A for an integer A=A(e,p,r) independent of n and X. Separately, if K has enough roots in the CN sense, there is a universal N and c_p (also depending on chart dimension d at p=2) giving p^(Nr+c_p). Here enough roots means δ_K+[K:F_i]<e/(2p), F_i=K0(ζ_(p^i)), i maximal with ζ_(p^i)∈K, and δ_K=e v_p(Different(K/F_i)), with v_p(p)=1. Transport to L_EN by 4.1, increasing the exponent by the recorded factorial and endpoint lattice errors. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); e=[K:K0] and π is a uniformizer; X has the stated semistable/base-change charts and log boundary; n≥1; r≥0; 0≤q≤r; The refined bound additionally assumes the stated different inequality. (CN, §2.2.1, Theorem 1.1 and §5.1.2, pp. 2,10,54; CN line 70, CN line 78, CN line 413, CN line 422, CN line 2600).

The named API is `Syntomic.boundedPeriod_uniform` (Quantifiers are ∃A(e,p,r), ∀X,n,q≤r; the constant is not chosen separately for each n or X.); `Syntomic.boundedPeriod_roots` (Keep the universal linear-in-r exponent separately from the ramified descent bound.); `Syntomic.boundedPeriod_lattice` (The EN coefficient adapter changes the bound by v_p(a!) and any explicit CN endpoint adjustment.).

The proof uses the following chain. Use CN’s chart syntomic/PD realization, the separately specified local-period convergence, Frobenius-change, Lie, Lazard and continuous-Galois contracts, and its continuous Galois realization to obtain the local Lazard comparison. The period-ring Poincaré lemma compares that map to the Fontaine–Messing map (CN Theorems 4.14 and 4.16). Approximation, K(π,1) and rigid étale comparison transfer it to nearby cycles. Cyclotomic extension and ramified descent give A(e,p,r); with enough roots retain Nr+c_p instead. The required intermediate estimates and comparison sections are explicitly missing contracts, not facts inferred from this conclusion.

*Needs:* Layer target 4.2; Layer target 4.1; required contract `local-period-pd-radius`; required contract `local-period-annulus-entry`; required contract `local-period-frobenius-change`; required contract `local-period-lie`; required contract `local-period-lazard`; required contract `local-period-annulus-change`; required contract `local-period-phi-psi`; required contract `local-period-disk-change`; required contract `local-period-galois`; required contract `local-period-approximation`; required contract `local-period-kpi1`; required contract `local-period-etale-gaga`; required contract `local-period-descent`; required contract `period-rings`; DerivedModuleAlgebra §0.K.1.

**Checks.**

- `Syntomic.boundedPeriodComparison_ramified`: A chart xy=π^h with h>1 in a ramified base change is admitted; replacing h by 1 globally would lose a source case.
- `Syntomic.boundedPeriodComparison_p2positive`: At p=2,r=1 this gives a bounded comparison in q=0,1 and keeps dimension dependence in c_2.
- `Syntomic.boundedPeriodComparison_notUntruncated`: No claim is made about q>r; a p-power bound at each finite level is not an integral equivalence, even if rationalization kills its errors.

### 4.5 Syntomic-étale objects on X

Define `Syntomic.etaleGluing`. Let j_K:X_K→X and j′:X_tr→X_K, so j=j_Kj′. For every r≥0 glue S_n(r) and S′_n(r), respectively, to Rj′_*(L_EN(r)/p^n) using the modified divided and undivided maps of 4.2, obtaining E_n(r),E′_n(r) on X_et. For 0≤r≤p−2 identify the first construction with ordinary-lattice gluing because a=0. Their triangles have first term j_K!Rj′_* of the corresponding lattice, middle term E or E′, and third term i_*S or i_*S′. Construct maps to Rj_* of the generic lattice. Prove τ≤rE_n(r)≃τ≤rRj_*Z/p^n(r) in the divided exact range; on the semistable chart domain, H^q(E′_n(r))→R^qj_*(L_EN/p^n) has the transported 4.4 kernel/cokernel bound for 0≤q≤r. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X fine saturated log-smooth over canonical log V; n≥1; r≥0; the ordinary-lattice divided identification and exact conclusion use r≤p−2; The bounded conclusion assumes the semistable chart domain of 4.4. (EN, §2.2.2, equations (2.6)–(2.7), Theorem 2.5, pp. 8–9; EN line 336, EN line 351, EN line 360).

The named API is `Syntomic.etaleGluing_restrict` (i*E=S, j_K*E=Rj′_* of the generic lattice, with the specified attachment map.); `Syntomic.etaleGluing_triangle` (The recollement fibre construction yields the displayed distinguished triangle and is unique with its gluing data.); `Syntomic.etaleGluing_period` (Restriction of the period map to the closed part is α; on the open part it is identity.); `Syntomic.etaleGluing_truncation` (Open extension is exact, so the corresponding truncated triangles give the asserted truncated comparison and transported error bound.).

The proof uses the following chain. Form the enhanced recollement pullback of the closed fibre and open direct image over nearby cycles. Its localization triangle has exact open extension. Compare it to the localization triangle for Rj_*; the open map is identity and the closed map is 4.3 or 4.4. Apply cohomological exactness, retaining truncation.

*Needs:* Layer target 4.2; Layer target 4.3; Layer target 4.4; required contract `nearby-cycle-inputs`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `Syntomic.etaleGluing_genericRestriction`: Restricting E′ to X_K returns Rj′_*L_EN/p^n; it is the lattice itself when j′ is identity.
- `Syntomic.etaleGluing_emptyClosedPart`: With no closed part the gluing gives only the open direct image, rather than a zero syntomic sheaf on X.
- `Syntomic.etaleGluing_unit`: At weight zero the closed and open units glue to the unit and its period image is 1.

### Examples

Use p=2,r=0 for exact comparison, p=2,r=1 for the bounded result, and a ramified chart xy=π^h with horizontal boundary. Compute every lattice rescaling before quoting an error exponent.

### Dependencies

Layers 2–3; EtaleCohomologyFoundations §§F.0.3,F.1,F.4.1–F.4.5; gaps period-rings, nearby-cycle-inputs, nearby-cycle-cartier, nearby-cycle-graded, local-period-pd-radius, local-period-annulus-entry, local-period-frobenius-change, local-period-lie, local-period-lazard, local-period-annulus-change, local-period-phi-psi, local-period-disk-change, local-period-galois, local-period-approximation, local-period-kpi1, local-period-etale-gaga, local-period-descent; DerivedModuleAlgebra §0.K.1. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 5: Semistable and rational descent adapters

### 5.1 Hyodo–Kato data on the shared carriers

Construct `ClassicalSyntomic.hyodoKatoAdapter`. For proper fine log-smooth X over canonical log V with Cartier-type special fibre, transport the supplied D^q=H^q_HK(X0) to Mathlib WittVector.Isocrystal p k, with its actual bijective σ-semilinear φ, and retain K0-linear nilpotent N satisfying Nφ=pφN. For every uniformizer π export ι_π:D^q⊗K0 K≃H^q_log-dR(X_K/K). The identity is ι_(πu)=ι_π∘exp(log(u)N) for u∈V×, and conjugating N through ι_π is independent of π. No proper HK theorem is asserted for arbitrary nonproper log-smooth X. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); X is proper fine log-smooth over canonical log V; The special fibre is of Cartier type; q≥0; log on V× is the canonical p-adic unit logarithm. (HK, §§3.2–3.6, pp. 243–246, Theorem 5.1, pp. 262–263; HK line 698, HK line 715, HK line 740, HK line 770, HK line 1321, HK line 1335).

The named API is `ClassicalSyntomic.hyodoKato_isocrystal` (The transported frob is precisely the supplied semilinear automorphism, not an unrelated instance.); `ClassicalSyntomic.hyodoKato_N_phi` (Nφ=pφN on the same D^q.); `ClassicalSyntomic.hyodoKato_changeUniformizer` (The change law composes on the D_K side with the positive exponential.); `ClassicalSyntomic.hyodoKato_deRhamN` (ι_π N ι_π⁻¹ is the same operator for every π.).

The proof uses the following chain. Use the proper HK supplier theorem for the cohomology and uniformizer comparison; transport its Frobenius equivalence into the existing Mathlib class. The exponential is finite by nilpotence; conjugation independence follows because N commutes with its exponential. The counterexample is HK’s own obstruction to omitting Cartier type.

*Needs:* required contract `hyodo-kato-proper`; required contract `base-ownership`; Mathlib `WittVector.Isocrystal`.

**Checks.**

- `ClassicalSyntomic.hyodoKatoAdapter_rankOne`: For the good-reduction point D=K0, φ=σ and N=0; every ι_π is the same.
- `ClassicalSyntomic.hyodoKatoAdapter_twoTerm`: On D=Q_p e0⊕Q_p e1, φe0=e0, φe1=p e1, Ne1=e0, Ne0=0, Nφe1=p e0. Uniformizer change sends e1 to e1+log(u)e0 before ι_π.
- `ClassicalSyntomic.hyodoKatoAdapter_cartierNecessary`: For p∤m and m>1, the log chart 1↦m on Spec(k[t]/t^m) is log-smooth but not Cartier type; φ(t)=t^p on its rational crystalline H⁰ need not be invertible (HK §3.3). It cannot supply an Isocrystal instance.

### 5.2 The semistable total fibre and its adapter

Define `ClassicalSyntomic.semistableFiber`. For an arithmetic pair (U,Ubar) log-smooth over canonical log V and of Cartier type, set D=RΓ_HK,Q and E=RΓ_dR/F^r. Define C_st(D,r,ι_π) as the total homotopy fibre of the square with top (1−φ/p^r,ι_π):D→D⊕E, left N:D→D, right (N,0):D⊕E→D and bottom 1−φ/p^(r−1):D→D. Construct the canonical equivalence RΓ_syn,Q(U,Ubar,r)≃C_st(D,r,ι_π), natural in the pair and compatible with products and the supplied uniformizer-change comparison. For degree-zero realizations its three terms are D, D⊕E⊕D, D with differentials x↦((1−φ/p^r)x,ι_πx,Nx) and (a,b,c)↦Na−(1−φ/p^(r−1))c. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); (U,Ubar) is an arithmetic pair with fine integral quasi-coherent log structure, log-smooth over canonical log V and of Cartier type; r≥0; π is a uniformizer; ι_π is supplied enhanced comparison data. (NN, §3.2 and Proposition 3.8, pp. 26–27; NN line 1341, NN line 1366, NN line 1384, NN line 1387).

The named API is `ClassicalSyntomic.semistableFiber_square` (N(1−φ/p^r)=(1−φ/p^(r−1))N; give the coherence used by the enhanced square.); `ClassicalSyntomic.semistableFiber_universal` (The total fibre is the iterated enhanced fibre with its square projections and homotopies.); `ClassicalSyntomic.semistableFiberComparison` (The comparison is induced by the log deformation N-triangle and ι_π, rather than selected as an arbitrary isomorphism.); `ClassicalSyntomic.semistableFiber_changeUniformizer` (Changing π gives the comparison through the imported HK change law, preserving its de Rham projection.).

The proof uses the following chain. The relation Nφ=pφN makes the square commute. Apply the supplied log deformation N-triangle to the rational fibre of 3.4 and compare the deformation complex with HK by its Frobenius-equivariant section. NN Proposition 3.8’s kernel/cokernel argument identifies the resulting iterated fibres. Proper 5.1 is only the cohomology witness; the enhanced arithmetic-pair input is a separate required contract.

*Needs:* Layer target 3.4; Layer target 5.1; required contract `arithmetic-pair-deformation`; required contract `base-ownership`; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `ClassicalSyntomic.semistableFiber_twistWitness`: On the two-dimensional datum of 5.1, N(1−φ/p^r)e1=(1−p^(1−r))e0, agreeing with the lower map on Ne1. Reusing 1−φ/p^r below fails.
- `ClassicalSyntomic.semistableFiber_rzero`: At r=0 the lower exponent is −1, so the lower map is 1−pφ; no natural-number subtraction may replace it by 1−φ.
- `ClassicalSyntomic.semistableFiber_zero`: If D=E=0 the total fibre is zero; its three-term differential squares to zero for every valid (φ,N,ι) datum.

### 5.3 Compatibility with rational h-descent

Prove `ClassicalSyntomic.hRealizationCompatibility`. For an arithmetic pair as in 5.2 with interior U, identify the classical rational syntomic complex of 3.4 with the base-owned h-realization RΓ_syn(U_h,r). For every reduced separated finite-type K-variety X and r≥0, transport the base’s functorial arithmetic and geometric product-compatible period maps and its equivalences τ≤rRΓ_syn(X_h,r)≃τ≤rRΓ_et(X,Q_p(r)) and τ≤rRΓ_syn(X_Kbar,h,r)≃τ≤rRΓ_et(X_Kbar,Q_p(r)). These are exports of the base theorem through named classical adapters, with all comparison squares specified. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); r≥0; Classical-pair statements retain fine integral quasi-coherent log structure, log smoothness and Cartier type; The classical map is the one induced by the base h-realization on its log-smooth Cartier-type arithmetic pairs. (NN, Proposition 3.18, p. 33, NN line 1688–1691 for the classical-pair map; Theorem A(1),(4), Proposition 4.6 and Corollary 4.11, pp. 2,46,53, NN line 78, NN line 85, NN line 93, NN line 2400, NN line 2778 for the period comparisons).

The named API is `ClassicalSyntomic.hRealizationCompatibility` (The classical-to-h map commutes with product, pullback and the semistable fibre projections.); `ClassicalSyntomic.arithmeticPeriodAdapter` (The transported arithmetic period is the base period on the common realization.); `ClassicalSyntomic.geometricPeriodAdapter` (Geometric base extension and G_K-action commute with the transported period.).

The proof uses the following chain. Use uniqueness of the base’s h-descent extension to identify the classical-pair map, checking the semistable presentation and product on the h-basis. Transport the base’s period squares through that equivalence. The h-descent theorem, semistable comparison theorem and its geometric counterpart are imports, not new proof targets.

*Needs:* Layer target 3.4; Layer target 5.2; required contract `rational-descent`; required contract `base-ownership`; required contract `rigid-realizations`.

**Checks.**

- `ClassicalSyntomic.hRealizationCompatibility_identity`: Changing a presentation by its identity induces identity on the h-realization and on both period maps.
- `ClassicalSyntomic.hRealizationCompatibility_p2`: At p=2 any r≥0 is permitted rationally; the integral exact range is not reused.
- `ClassicalSyntomic.hRealizationCompatibility_truncation`: At r=0 only τ≤0 is exported. Tensoring with Q_p does not itself provide a comparison in all degrees.

### Examples

The two-dimensional (φ,N) witness fixes the twist and uniformizer sign. Compare only rationally with the base h-realization, with both arithmetic and geometric targets truncated.

### Dependencies

Layer 3; gaps hyodo-kato-proper, arithmetic-pair-deformation, crystalline-inputs, period-rings, base-ownership and rational-descent; EnhancedDerivedSheaves §§0.1–0.4. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 6: Relative realizations and open-curve residues

### 6.1 Relative cohomology before promotion

Construct `RelativeCohomology.datum`. For smooth quasi-projective u:U→S on an AM base and i≥0, assemble H^i(U/S)=(H^i_dR(U_K/S_K),H^i_rig(U_k/S_k),c,∇,Φ,F). The first module is Γ(S_K,R^iu_K*Ω•_(U_K/S_K)); the second is Γ(S_K^an,R^iu_rig j†O), with relative continuous differential realization on frames. Construct c by algebraic-to-analytic adjunction and restriction to overconvergent forms. Give the Gauss–Manin and Hodge maps and the Frobenius structure from the rigid realization. This datum is defined without asserting coherence or invertibility of c in an arbitrary open family. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u is smooth quasi-projective; i≥0. (AM, Definition 2.12 and Remark 2.13, pp. 11–12; AM line 451, AM line 463, AM line 478).

The named API is `RelativeCohomology.datum_comparison` (c is the displayed adjunction/restriction map, B†_K-linear after scalar extension.); `RelativeCohomology.datum_frame` (The frame description and the lifted U^an relative-overconvergent description agree.); `RelativeCohomology.datum_natural` (Morphisms of families induce the realization maps and commute with c,∇,F,Φ wherever their base-change comparison is defined.).

The proof uses the following chain. Use the supplied algebraic and rigid relative derived pushforwards and take H^i. The map c is constructed before any bijectivity theorem. Adjoint pullback to analytification followed by j† produces it; the frame-independence theorem identifies the two rigid descriptions.

*Needs:* Layer target 2.1; required contract `relative-rigid-coefficients`; RigidAnalyticGeometry §8.1; AdicSpacesPartIV §F1.9.

**Checks.**

- `RelativeCohomology.datum_identity`: For u=id_S, H⁰=(B_K,B†_K,c,d,σ,F⁰=all,F¹=0) and H^i=0 for i>0.
- `RelativeCohomology.datum_empty`: For U empty every cohomology datum is zero.
- `RelativeCohomology.datum_projectiveLine`: For P¹_S, H⁰=O_S, H¹=0, H²=O_S(−1); the H² Frobenius is p times the base Frobenius, not p⁻¹.

### 6.2 The admissibility interface

Prove `RelativeCohomology.filteredFrobeniusRealization`. Assume u:U→S is smooth quasi-projective on an AM base, every R^iu_rig j†O is coherent over j†O_(S_K^an), and every c_i:H^i_dR⊗B†_K→H^i_rig is bijective. Independently assume the algebraic finiteness, Hodge-filtration and connection hypotheses below on the actual modules of 6.1. Then promote these data to FilFMIC(S,σ), with horizontal invertible Φ supplied by the rigid realization. Prove naturality in family morphisms and in base changes for which the actual relative cohomology maps are isomorphisms respecting the Hodge filtration. AM Assumption 2.20 supplies only the rigid coherence and comparison conditions; it does not imply the independent algebraic hypotheses. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u smooth quasi-projective; For every i≥0 the stated relative rigid sheaf is coherent and c_i is bijective; For every i≥0, the actual module H^i_dR(U_K/S_K) of 6.1 is finite over B_K, its actual Hodge filtration is finite exhaustive separated with finite locally free graded pieces, its Gauss–Manin connection is integrable and satisfies Griffiths transversality, and c_i identifies its induced continuous connection with the rigid connection. (AM, Definition 2.1, Remark 2.13, Assumption 2.20 and Remark 2.21, pp. 3–4,12,15; AM line 131, AM line 497, AM line 502, AM line 627).

The named API is `RelativeCohomology.filteredFrobeniusRealization_forget` (Forgetting the promoted object returns the constructed datum of 6.1.); `RelativeCohomology.filteredFrobeniusRealization_pullback` (When the actual base-change maps on both realizations are isomorphisms, identify the Hodge filtrations and respect the connections and Frobenius, they give an isomorphism in FilFMIC.); `RelativeCohomology.filteredFrobeniusRealization_unique` (The coefficient object is uniquely determined by the datum and its verified properties; no Frobenius is chosen independently of rigid cohomology.).

The proof uses the following chain. Affine overconvergent coherence gives finite B†_K-modules. Use the independent finiteness and filtered-connection hypotheses on the actual algebraic modules; bijectivity of c identifies their scalar extensions and connections with the rigid modules. The rigid coefficient realization supplies horizontal invertible Frobenius. Verify 1.1 directly. No descent of algebraic finiteness through B_K→B†_K is used.

*Needs:* Layer target 1.1; Layer target 6.1; required contract `relative-rigid-coefficients`.

**Checks.**

- `RelativeCohomology.filteredFrobeniusRealization_identity`: Promotion of H⁰(S/S) agrees with O_S and its exact filtration.
- `RelativeCohomology.filteredFrobeniusRealization_zeroDegree`: A vanishing cohomology datum promotes to the zero object, including in degrees above a known cohomological bound.
- `RelativeCohomology.filteredFrobeniusRealization_guard`: A formal tuple with c=0 between nonzero rank-one modules cannot be promoted; a non-locally-free Hodge graded piece also fails the explicit filtered-realization contract.
- `RelativeCohomology.filteredFrobeniusRealization_genericDivisor`: For every prime p, V=Z_p, S=Spec(V[t]), σ(t)=t^p and U=D(pt−1), one has U_k=S_k and all-degree coherent rigid cohomology with bijective c_i. In degree zero H_dR=Q_p[t,(pt−1)⁻¹], while H_rig=B†_K since (1−pt)⁻¹=Σ_(j≥0)p^j t^j converges on some radius 1<ρ<p. The algebraic module is not finite: finitely many fractions have a bounded pole order at t=1/p, but its inverse powers have unbounded pole order. Thus 6.1 applies and 6.2 does not; nonempty special fibre and rigid coherence do not repair algebraic finiteness.


### 6.3 The full compactification setting

Define `RelativeCohomology.goodCompactification`. Define goodCompactification(u) as existence of smooth projective V-schemes Sbar,Xbar, S=Spec(B) open in Sbar with relative simple normal-crossings complement T, a projective extension fbar:Xbar→Sbar, a horizontal relative normal-crossings divisor D_h on Xbar/V and vertical divisor D_v=fbar⁻¹(T), such that D_h∪D_v is relative normal-crossings over V, X=fbar⁻¹(S), D=D_h∩X is relative normal-crossings over S, U=X−D, and (Xbar,D_h∪D_v)→(Sbar,T) is log-smooth and integral with the base of Zariski type. The witnesses are presentation data; no boundary splitting or restriction on p is imposed. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; u:U→S smooth quasi-projective; all identifications commute with u. (AM, Setting 2.16, pp. 13–14; AM line 530–558).

The named API is `RelativeCohomology.goodCompactification_ofData` (The stated diagrams, boundary identities and geometric hypotheses construct a witness.); `RelativeCohomology.goodCompactification_ext` (Isomorphic compactification diagrams transport witnesses and induce the same interior u.); `RelativeCohomology.goodCompactification_independence` (Whenever the intrinsic datum satisfies 6.2, its coefficient object uses the realizations of 6.1, so two compactification witnesses induce the same promoted object.); `RelativeCohomology.goodCompactification_relativeBoundary` (Over S the vertical divisor disappears and the horizontal boundary is D with its relative S-normal-crossings property.).

The proof uses the following chain. Use the imported scheme/log-divisor vocabulary and store precisely the geometric presentation required in AM Setting 2.16. Invariance under isomorphisms follows from its geometric predicates. The independence API refers to the intrinsic cohomology datum; it asserts no existence of a good compactification for every u.

*Needs:* required contract `crystalline-inputs`; required contract `relative-rigid-coefficients`; AdicSpacesPartIV §F1.12.

**Checks.**

- `RelativeCohomology.goodCompactification_constantGm`: Take S=A¹_V, Sbar=P¹_V, Xbar=P¹_V×P¹_V over the first factor, T=∞, D_h the second-factor sections 0,∞. Then D_v is the fibre over ∞ and U=A¹_V×G_m,V satisfies every clause.
- `RelativeCohomology.goodCompactification_properConstant`: With no horizontal boundary in the same example and a fixed smooth projective fibre, the interior family is projective smooth; empty divisors are allowed.
- `RelativeCohomology.goodCompactification_collision`: For p odd, the horizontal sections x=0 and x=t over A¹_V collide at t=0. Their union is not a relative normal-crossings divisor over S there, even if the total-space crossing is normal. This does not give a goodCompactification witness for that S.

### 6.4 Projective smooth and good-compactification families

Prove `RelativeCohomology.sufficientGeometricSettings`. For every i≥0, prove coherence of R^iu_rig j†O and bijectivity of c_i in each of two domains: (a) u is projective smooth; (b) u admits goodCompactification as in 6.3. In each domain also establish finiteness of the actual algebraic de Rham modules, a finite exhaustive separated Hodge filtration with finite locally free graded pieces, integrable Gauss–Manin connection with Griffiths transversality, horizontal comparison and filtered base change. These independent algebraic conclusions, together with the rigid conclusions, give the FilFMIC object of 6.2. Keep log integrality, Zariski type and both the total and relative boundary hypotheses in (b). Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; Either u is projective smooth or goodCompactification(u) holds; i≥0. (AM, Setting 2.14 and Propositions 2.15,2.17, pp. 12–14; AM line 510, AM line 512, AM line 567).

The named API is `RelativeCohomology.projectiveSmooth` (The projective-smooth domain satisfies AM Assumption 2.20 and all independent algebraic hypotheses of 6.2 in every degree.); `RelativeCohomology.goodCompactification_admissible` (The full good-compactification domain satisfies AM Assumption 2.20 and all independent algebraic hypotheses of 6.2 in every degree.); `RelativeCohomology.comparison_horizontal` (The invertible c_i commutes with connection, filtration maps and Frobenius on the rigid side.).

The proof uses the following chain. Apply relative-rigid-projective-finiteness in (a) and relative-rigid-log-finiteness in (b). Independently apply relative-hodge to the proper de Rham or compactification log-de Rham complex to obtain algebraic finiteness and all filtered-connection hypotheses of 6.2. With coherence established in all degrees, use geometric base change and the absolute/logarithmic comparison to prove c_i invertible and horizontal. Then apply 6.2; rigid coherence supplies no substitute for algebraic finiteness.

*Needs:* Layer target 6.1; Layer target 6.2; Layer target 6.3; required contract `relative-rigid-coefficients`; required contract `relative-rigid-projective-finiteness`; required contract `relative-rigid-log-finiteness`; required contract `relative-hodge`; required contract `rigid-realizations`; RigidAnalyticGeometry §8.4.

**Checks.**

- `RelativeCohomology.sufficientGeometricSettings_properCurve`: For a constant smooth projective geometrically connected genus-g curve, ranks are 1,2g,1 in degrees 0,1,2, including g=0.
- `RelativeCohomology.sufficientGeometricSettings_constantGm`: The compactification in 6.3 gives H⁰=O and H¹=O(−1); its H¹ Frobenius multiplies dlog x by p.
- `RelativeCohomology.sufficientGeometricSettings_allPrimes`: The geometric statements admit p=2. A ramified V without a p-Frobenius modulo p is excluded from the AM relative setting, while the classical log/rigid producers still admit it. The Frobenius hypothesis is not vacuous notation.

### 6.5 Affine acyclicity and continuous-differential cohomology

Prove `RelativeCohomology.affineOverconvergentAcyclicity`. If Z is smooth affine over V and M is a coherent j†O_(Z_K^an)-module, then H^j(Z_K^an,M)=0 for every j>0. For a smooth morphism U=Spec(A)→S=Spec(B) of smooth affine V-schemes such that every relative rigid cohomology sheaf is coherent, identify H^i_rig(U_k/S_k) with H^i(Ω•_(A†_K/B†_K)) naturally and compatibly with the supplied connection and Frobenius. No affine acyclicity statement is applied to a proper positive-genus curve. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); Z smooth affine over V; M coherent over its overconvergent structure sheaf; In the relative statement U and S are affine and every relative rigid cohomology sheaf is coherent; Frobenius compatibility additionally uses the AM lifts. (AM, Lemma 2.19 and Remark 2.21(3), pp. 14–15; AM line 609, AM line 612, AM line 639).

The named API is `RelativeCohomology.affineOverconvergentAcyclicity` (Every higher coherent overconvergent sheaf cohomology group on this affine analytification vanishes.); `RelativeCohomology.continuousDifferentialComparison` (The edge map from global relative continuous forms to the relative rigid realization is the stated cohomology isomorphism.).

The proof uses the following chain. Embed the affine scheme in affine space, descend the coherent overconvergent module to a strict neighbourhood, and use cofinal affinoid strict neighbourhoods and coherent affinoid acyclicity. For U/S apply the Leray spectral sequence and this vanishing to both relative cohomology sheaves and individual relative differential sheaves; the resulting edge isomorphism gives the continuous-differential comparison.

*Needs:* required contract `relative-rigid-coefficients`; AdicSpacesPartIV §F1.7; AdicSpacesPartIV §F1.9; RigidAnalyticGeometry §7.3; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- `RelativeCohomology.affineOverconvergentAcyclicity_affineLine`: For A=V[t], S=Spec(V), the dagger complex has H⁰=K and H¹=0, since overconvergent integration remains overconvergent.
- `RelativeCohomology.affineOverconvergentAcyclicity_gM`: For A=V[t,t⁻¹], H¹=K dlog t. Replacing dagger forms by only exact forms would erase this class.
- `RelativeCohomology.affineOverconvergentAcyclicity_properCounterexample`: For an elliptic curve E/V, H¹(E_K^an,O)=K. The unrestricted smooth-scheme wording of AM Lemma 2.19 would be false; its affine-embedding proof supplies the affine theorem used here.

### 6.6 Residues without a split-boundary hypothesis

Prove `RelativeCohomology.openCurveResidueSequence`. Let U and S be smooth affine over an AM base, u:U→S smooth of relative dimension one with connected fibres, X→S a projective smooth compactification and D=X−U finite étale over S. Assume all hypotheses of 6.2 for U/S, including algebraic finiteness and the actual filtered-realization hypotheses independently of rigid coherence and bijectivity of c. Construct the exact sequence 0→H¹(X/S)→H¹(U/S)→Res H⁰(D/S)(−1)→Gys H²(X/S)→0 in FilFMIC, with Res filtered, horizontal and Frobenius compatible. Construct induced maps Ext^i(O_S,H¹(U/S)(m))→Ext^i(O_S,H⁰(D/S)(m−1)) for every i≥0,m∈ℤ, commuting with u_i and coefficient pullback. D is a finite étale scheme, not a list of S-rational sections. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; U and S smooth affine; u smooth of relative dimension one with connected fibres; X/S projective smooth; U⊂X; D finite étale; U/S satisfies all hypotheses of 6.2, including the independent algebraic finiteness, Hodge-filtration and connection conditions. (AM, Proposition 2.18 and the residue interface in Lemma 4.2, pp. 14,33; AM line 587, AM line 595, AM line 1483).

The named API is `RelativeCohomology.residue` (The residue of (dt/t)⊗h along a local boundary parameter is h, with the corresponding Tate shift.); `RelativeCohomology.residueSequence_exact` (Exactness holds on every filtration step and the rigid comparison, not only after forgetting the filtration.); `RelativeCohomology.residue_frobenius` (Res φ=φ_(H⁰D(−1)) Res, so the target Frobenius has the extra factor p.); `RelativeCohomology.residueExt` (Pushout of an admissible extension along Res defines the Ext map and commutes with evaluation.).

The proof uses the following chain. Use the logarithmic de Rham residue/Gysin sequence and its strictness from relative-hodge; proper-smooth X and finite-étale D use 6.4. Identify the rigid sequence via c and flat scalar extension; check Frobenius on the absolute fibres using `rigid-gysin`, with H²(U)=0 supplied by the affine curve hypothesis. Descend finite étale boundary data, retaining its entire cohomology module and trace. Apply coefficient pushout in Yoneda Ext and naturality of 1.5; symbol residue identities remain consumers’ theorems.

*Needs:* Layer target 6.2; Layer target 6.4; Layer target 1.3; Layer target 1.5; required contract `relative-hodge`; required contract `relative-rigid-coefficients`; required contract `rigid-gysin`.

**Checks.**

- `RelativeCohomology.openCurveResidueSequence_splitGm`: For P¹−{0,∞}, Res(dlog t)=(1,−1) in O²(−1); Gys is the sum, hence the composite is zero.
- `RelativeCohomology.openCurveResidueSequence_nonsplit`: Over Z_2 take D⊂P¹ given by t²+t+1, an unramified quadratic étale divisor. H⁰(D) has rank 2, Gys is its field trace, and H¹(P¹−D) is rank-one trace-zero part with twist (−1); Frobenius acts by −2. A boundary indexed by rational sections would miss it.
- `RelativeCohomology.openCurveResidueSequence_emptyBoundaryExcluded`: A nonempty smooth projective curve X/S with D empty has nonzero H². It does not satisfy the affine U curve hypotheses, so 0→H¹X→H¹X→0→H²X→0 is not exported as exact.
- `RelativeCohomology.residueSequence_emptyBoundaryControl`: For X=P¹_k and D empty, U=X has H²_rig(U)=K0(−1); the general rigid localization sequence retains H²_rig(X)→H²_rig(U) as identity. This proper curve is excluded by the affine U/S hypothesis of the short relative sequence.

### 6.7 Geometric extension projections

Construct `RelativeCohomology.extensionProjections`. For a smooth affine u:U→S satisfying all hypotheses of 6.2, including its independent algebraic conditions, and n≥0 with F^(n+1)H^n_dR=0, set H=H^n(U/S)(n+1). Export δ:Ext¹(O,H)→Ω¹_BK⊗F^nH^n_dR and R_σ:Ext¹(O,H)→B†_K⊗H^n_dR as the canonical components of 1.6. They satisfy dδ=0 and (1−Φ_(n+1))δ=dR_σ. For the setting of AM §2.7 additionally retain F^(n+1)H^(n+1)_dR=0; it is an application hypothesis, not a condition on the general coefficient construction. The maps commute with residue and filtered base change when the cohomology comparisons are defined. Here p is prime; V is a complete mixed-characteristic (0,p) DVR with perfect residue field k; K=Frac(V), K0=Frac(W(k)); in addition V has an endomorphism F_V inducing x↦x^p modulo pV; S=Spec(B) is smooth affine over V; σ:B†→B† extends F_V and induces x↦x^p modulo pB†; U and S affine; u smooth; all hypotheses of 6.2 hold, including its independent algebraic finiteness, Hodge-filtration and connection conditions; n≥0; F^(n+1)H^n_dR=0; The AM §2.7 application also assumes F^(n+1)H^(n+1)_dR=0. (AM, §2.7, equation (2.22), p. 19; AM line 795, AM line 799, AM line 808).

The named API is `RelativeCohomology.delta` (δ is the algebraic connection component of the unique filtered lift.); `RelativeCohomology.frobeniusRemainder` (R_σ is the overconvergent (1−Φ) component, with the Frobenius acting also on base forms.); `RelativeCohomology.projectionsResidue` (After the Tate shift of 6.6, the two components commute with the coefficient residue map.); `RelativeCohomology.projections_changeFrobenius` (δ transports identically on the de Rham side; R changes through the supplied lift-change equivalence.).

The proof uses the following chain. Substitute the Tate filtration in 1.6 and use the cohomology object of 6.2. F⁰H=F^(n+1)H^n=0 removes the coboundary ambiguity. Horizontality, strictness and the Tate shift in 6.6 prove residue compatibility. The extra vanishing in AM §2.7 is retained only for that geometric application, and symbols are not defined here.

*Needs:* Layer target 1.6; Layer target 6.2; Layer target 6.5; Layer target 6.6.

**Checks.**

- `RelativeCohomology.extensionProjections_split`: A split geometric extension has δ=0 and R_σ=0.
- `RelativeCohomology.extensionProjections_curveTwist`: For U=G_m/S, n=1, H¹(U/S)(2)=O(1), so F⁰=0 and the residue extension lands in H⁰(D/S)(1), not twist (2).
- `RelativeCohomology.extensionProjections_nzero`: For n=0, H=H⁰(U/S)(1); the construction uses weight 1 with no sign reversal. No artificial n≥1 restriction is introduced.

### Examples

For P¹/S compute H⁰=O, H¹=0 and H²=O(−1). For G_m/S compute the residues of dlog t. A nonsplit quadratic étale boundary tests descent of the residue target.

### Dependencies

Layer 1; Layer 2 comparison diagram; AdicSpacesPartIV §§F1.5,F1.7–F1.9; RigidAnalyticGeometry §§7.3–7.4,8.1,8.4; gaps relative-rigid-coefficients, relative-rigid-projective-finiteness, relative-rigid-log-finiteness, relative-hodge, rigid-gysin and rigid-realizations. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Layer 7: Frobenius-point specialization and absolute evaluation

### 7.1 Frobenius-compatible lifts of residue points

Construct `FrobeniusPoint.lift`. Let V=W(k), k perfect, Z=Spec(C) smooth affine over W(k), and (σ_m) a compatible system of p-Frobenius lifts on C/p^m extending Witt Frobenius F_W. For every a∈Z(k) construct the unique W(k)-point P_a lifting a such that P_a∘σ=F_W∘P_a on the p-adic completion, equivalently at every finite level. Give reduction, naturality for Frobenius-compatible morphisms and uniqueness APIs. This is not a choice of an arbitrary analytic lift. Here p prime; k perfect of characteristic p; V=W(k); Z smooth affine over W(k); Compatible σ_m exist for all m≥1. (AM, Lemma 3.8, pp. 28–29; AM line 1229–1287).

The named API is `FrobeniusPoint.lift_reduce` (P_a modulo p equals a.); `FrobeniusPoint.lift_commutes` (At every m, P_aσ_m=F_WP_a.); `FrobeniusPoint.lift_unique` (Any W(k)-point with the same reduction and these equations equals P_a.); `FrobeniusPoint.lift_natural` (A morphism commuting with the σ_m carries P_a to the lift of its residue point.).

The proof uses the following chain. Use formal smoothness for successive lifting and the contraction of F_W⁻¹σ on lifts modulo p^m: the next value depends only on the previous reduction. Uniqueness follows at every finite level, and p-adic completeness produces a W(k)-point. This is a mathematical existence proof, not an algorithm target.

*Needs:* AdicSpacesPartIV §F1.5; required contract `relative-rigid-coefficients`.

**Checks.**

- `FrobeniusPoint.lift_zero`: For Z=A¹_W and σ(t)=t^p, P_0(t)=0.
- `FrobeniusPoint.lift_teichmuller`: For the same σ, P_a(t)=[a], since F_W[a]=[a]^p; P_1(t)=1.
- `FrobeniusPoint.lift_arbitraryLift`: Over Z_p, t↦p lifts the residue point 0 but is not compatible with σ(t)=t^p because p^p≠p. With σ(t)=t^p+p the compatible lift of 0 is instead congruent to p modulo p².

### 7.2 Detection by lifts over an algebraically closed residue field

Prove `FrobeniusPoint.detectSection`. Let k be algebraically closed of characteristic p, C smooth affine over W(k), and M finite locally free over C_hat[1/p]. Choose for every a∈Spec(C/p)(k) any W(k)-point P_a lifting a. If x∈M has zero image in M⊗_(C_hat[1/p]),P_a Frac(W(k)) for every a, then x=0. Frobenius compatibility is unnecessary for this detection theorem; the canonical lifts of 7.1 are one allowed choice. Here p prime; k algebraically closed of characteristic p; C smooth affine over W(k); C_hat its p-adic completion; M finite locally free over C_hat[1/p]; One lifting P_a is specified for every k-point. (AM, Lemma 3.9, p. 29; AM line 1289–1301).

The named API is `FrobeniusPoint.detectSection_equal` (Two sections agreeing at all P_a are equal, by applying detection to their difference.); `FrobeniusPoint.detectSection_zeroRank` (The zero-rank case is included.); `FrobeniusPoint.detectSection_choice` (The conclusion holds for any such system of lifts, not only a chosen Frobenius system.).

The proof uses the following chain. Embed the finite projective module as a direct summand of a finite free module. For a nonzero coordinate clear p-denominators and divide by its largest common p-power; its reduction modulo p is nonzero. Vanishing at all residue points contradicts the Nullstellensatz for the reduced smooth special fibre. If the special fibre is empty, C_hat=0 and the conclusion is the zero-module case.

*Needs:* RigidAnalyticGeometry §7.3; AdicSpacesPartIV §F1.5.

**Checks.**

- `FrobeniusPoint.detectSection_zeroRank`: For M=0 the only section is zero, so no nonzero-rank hypothesis is introduced.
- `FrobeniusPoint.detectSection_constant`: For M=C_hat[1/p], x=1 evaluates to 1 at every existing residue lift and is not detected as zero on nonempty Spec(C/p).
- `FrobeniusPoint.detectSection_finiteResidue`: For k=F_p, C=W(k)[t], the nonzero section t^p−t vanishes at every Teichmüller lift of the finitely many F_p-points. Algebraic closedness cannot be omitted.

### 7.3 Specializing extensions and their representatives

Prove `FilFMIC.specializationEvaluation`. On the W(k) base of 7.1, suppose σ comes from the fixed overconvergent lift defining FilFMIC. Pullback along P_a, extending continuously to C_hat and its generic fibre, carries any admissible extension E of O by H to its absolute coefficient extension and carries u_i(E) to u_i(P_a*E). For F⁰H=0 the unique filtered lift specializes, so dP_a(δ(E))=δ(P_a*E)=0 (pullback as a differential form, not merely tensor evaluation in the cotangent fibre) and R_σ(E)|P_a=R_(F_W)(P_a*E). Use the pullback on connection complexes and its completion map. The formula compares actual extensions; it is not an assertion about arbitrary unrelated tuples. Here The hypotheses of 7.1 and the overconvergent σ of 1.1; H∈FilFMIC(Z,σ); E is an admissible extension; For representative formulas F⁰H_dR=0. (AM, Pullback (2.1), Lemma 2.5 and proof of Theorem 3.7, pp. 5,7,30–31; AM line 206, AM line 283, AM line 1352–1364).

The named API is `FilFMIC.specializationEvaluation_ext` (The specialization square for u_i commutes for every i≥0.); `FilFMIC.specializationEvaluation_lift` (The unique F⁰ lift of 1 pulls back to the unique F⁰ lift of 1.); `FilFMIC.specializationEvaluation_remainder` (The Frobenius equation P_aσ=F_WP_a identifies (1−Φ)e after pullback with its absolute representative.).

The proof uses the following chain. Apply conflation-exact pullback and the naturality of the connecting maps defining u_i. Uniqueness of the filtered lift identifies its pullback. The Frobenius-compatibility equation of P_a is essential in the second component; extension to the completed generic base is the supplied continuous pullback map.

*Needs:* Layer target 1.2; Layer target 1.5; Layer target 1.6; Layer target 7.1; required contract `relative-rigid-coefficients`.

**Checks.**

- `FilFMIC.specializationEvaluation_split`: The split extension remains split, and its R-value is zero at every compatible point.
- `FilFMIC.specializationEvaluation_pointIdentity`: For Z=Spec(W(k)), specialization is identity on the extension and on R.
- `FilFMIC.specializationEvaluation_wrongPoint`: For σ(t)=t^p on Z_p[t], evaluation at t=p does not commute with Frobenius. The formula obtained by simply substituting t=p into (1−Φ)e is not an absolute F_W-Frobenius extension representative.

### 7.4 Absolute log-syntomic and rigid syntomic comparison

Prove `ClassicalSyntomic.logRigidComparison`. Let Y be smooth projective over W(k), D a relative normal-crossings divisor, M the horizontal log structure induced by D alone, over W(k) with trivial log structure, and U=Y−D. For every r≥0 construct RΓ_log-syn((Y,M),Q_p(r))≃RΓ_rsyn(U,r), inducing the AM cohomology comparison in every degree. Identify both with the fibre of F^rRΓ_log-dR(Y_K,M_K)→RΓ_log-cr(Y_k,M_k) with arrow (1−φ/p^r) composed with the de Rham/crystalline map. Prove compatibility with products and the period maps on the shared base carriers, and with pullback of such pairs. No regulator or symbol map is a premise. Here p prime; k perfect of characteristic p; V=W(k); Y/W(k) projective smooth; D relative normal-crossings; U=Y−D; the log structure is from D alone, not D∪Y0; r≥0. (AM, Lemma 3.10, equations (3.10)–(3.12), pp. 29–30; AM line 1302, AM line 1314, AM line 1327; BesserI Remark 8.7(3), BesserI line 1073).

The named API is `ClassicalSyntomic.logRigidComparison_fiber` (The equivalence is induced by filtered log/algebraic de Rham and log-crystalline/rigid realization comparisons.); `ClassicalSyntomic.logRigidComparison_cup` (The cup square commutes with weight addition.); `ClassicalSyntomic.logRigidComparison_period` (The two period maps to generic-fibre étale cohomology commute through this equivalence.).

The proof uses the following chain. Form completed and rational horizontal-log coefficients from 3.2 and the local PD presentations of 3.4, then apply the supplied filtered log de Rham/algebraic de Rham and relative log-crystalline/rigid comparisons to the two single-fibre presentations. This does not use the canonical-vertical-log arithmetic-pair C_st presentation. Since V=W(k), 2.3 applies without changing base fields. Their multiplicative period-compatible comparison diagram induces the claimed fibre equivalence. The regulator square in AM Lemma 3.10 is a downstream application, not needed for this construction.

*Needs:* Layer target 2.3; Layer target 3.2; Layer target 3.4; required contract `rigid-realizations`; required contract `base-ownership`; required contract `period-rings`; required contract `rigid-log-crystalline`.

**Checks.**

- `ClassicalSyntomic.logRigidComparison_point`: For Y=Spec(W(k)), D empty, r=0 the comparison identifies the same fibre of 1−φ on K0.
- `ClassicalSyntomic.logRigidComparison_gM`: For Y=P¹_W,D={0,∞}, it identifies dlog t and its Frobenius p dlog t in the two realizations.
- `ClassicalSyntomic.logRigidComparison_noGoodCompactificationClaim`: For a general smooth open V-scheme without such a W(k) projective normal-crossings pair, this theorem supplies no integral or unramified single-fibre replacement of 2.2.
- `ClassicalSyntomic_logRigidComparison_verticalLog`: For Y=Spec(Z_p), D empty and r=1, the horizontal-log/rigid fibre has H¹=Q_p. Adding the canonical vertical log gives the C_st point complex Q_p→Q_p³→Q_p, with first differential ((1−p⁻¹)x,x,0) and second differential zero, so H¹=Q_p². These two log structures cannot share an equivalence.

### 7.5 The absolute target of relative evaluation

Construct `ClassicalSyntomic.absoluteExtensionValue`. In 7.4 fix n≥0 and r=n+1. Assume H^n(F^rRΓ_dR(U_K))=H^(n+1)(F^rRΓ_dR(U_K))=0, and assume the geometric coefficient H=H^n(U/W(k))(r) of 6.2 has F⁰=0. The connecting map identifies H^n_rig(U_k/K0) with H^(n+1)_rsyn(U,r). Compose R_(F_W):Ext¹(O,H)→H^n_rig with this connecting isomorphism, and with 7.4, to define absoluteExtensionValue in H^(n+1)_log-syn((Y,M),Q_p(r)). For a family and compatible point whose fibre satisfies these hypotheses, this value equals the image of R_σ(E)|P_a under the same connecting map. Products and period compatibility are those of the comparison maps; no equality of symbol-defined regulators is asserted. Here The hypotheses of 7.4; n≥0; r=n+1; H^n(F^rRΓ_dR)=H^(n+1)(F^rRΓ_dR)=0 as filtered-complex hypercohomology; H^n(U/W(k))(r) is a coefficient object with F⁰=0; The family specialization statement retains all hypotheses of 6.2, including its independent algebraic conditions, filtered base-change isomorphisms and the compatible point of 7.3. (AM, Lemma 3.10 and proof of Theorem 3.7, pp. 30–31; AM line 1352, AM line 1379–1400; BesserI Proposition 6.3, BesserI line 727).

The named API is `ClassicalSyntomic.absoluteExtensionValue_connecting` (The connecting class of b is represented by (0,b) in the chosen fibre, fixing its positive sign.); `ClassicalSyntomic.absoluteExtensionValue_natural` (Coefficient base change and Frobenius-compatible specialization commute with the value.); `ClassicalSyntomic.absoluteExtensionValue_period` (Applying the log or rigid period map gives the same étale class.).

The proof uses the following chain. Use the long exact sequence for the unramified single fibre of 2.3. The two explicit hypercohomology vanishings make the connecting map an isomorphism. Apply 1.6 for the remainder, 7.3 for specialization and 7.4 for the absolute log target. This fixes only the fibre sign; the (−1)^n in the AM symbol comparison belongs to the regulator consumer.

*Needs:* Layer target 6.7; Layer target 7.3; Layer target 7.4; Layer target 2.3.

**Checks.**

- `ClassicalSyntomic.absoluteExtensionValue_curve`: For a smooth curve with a good W(k) normal-crossings compactification, n=1,r=2 gives F²Ω•=0. Thus H²_rsyn(U,2)≃H¹_rig(U); the value is the connecting image of R, with no extra negative sign introduced here.
- `ClassicalSyntomic.absoluteExtensionValue_split`: A split extension has absoluteExtensionValue zero.
- `ClassicalSyntomic.absoluteExtensionValue_missingVanishing`: If H^(n+1)(F^rRΓ_dR) is nonzero, the fibre exact sequence has a further filtered contribution; the connecting map need not be surjective and no inverse is exported.

### Examples

Teichmüller points, a rank-zero module and the polynomial t^p−t distinguish the point-lifting and point-detection hypotheses. On a curve, the weight-two absolute fibre identifies with H¹_rig.

### Dependencies

Layers 1–6; AdicSpacesPartIV §§F1.5,F1.9; gaps rigid-realizations, rigid-log-crystalline, relative-hodge, relative-rigid-coefficients, base-ownership and period-rings. Each `gap:` contract above is required on the domain stated in its consuming paragraph.

## Downstream consumers

- **PadicHodgeRegulators**: Rigid/log syntomic producers, period maps, exact-category extension evaluation, geometric coefficient objects, residue and specialization maps. Owns all symbol/regulator constructions, the AM (−1)^n symbol comparison and its restricted hypotheses.
- **ColemanIntegrationPartII**: Curve de Rham/semistable adapters, cup products and Frobenius/monodromy compatibilities on the imported base carriers; integration and index pairings remain its work.
- **EllipticRegulators**: Absolute syntomic targets and relative open-curve residues/evaluation, via regulator producers; no reverse dependency.

These consumers supply no premise to this build. The intended direction is the named main/earlier suppliers → CohomologyComparisonsPartII → these consumers. The classical curve comparison and residue interfaces keep nonsplit finite étale boundaries; scalar-extension and trace comparisons of the imported realizations remain explicit base contracts. No integration pairing, regulator or special-value theorem is silently added to those contracts.

## References

All mathematical statements and proof descriptions are paraphrases. Locators refer to the versions below; line numbers identify the service-cached or operator-held extraction. The source manifest is `packages/CohomologyComparisonsPartII/sources.toml`.

- **BesserI** — Amnon Besser, *Syntomic regulators and p-adic integration I: Rigid syntomic regulators* (2000), operator-held manuscript extraction, §§4–6 and Remark 8.7(3), manuscript pp. 9–20,28. Source lines 328,405,491,500,648,712,719,727,752,1073. The manuscript’s OCR loses pieces of displayed equations; the explicit fibre diagram is checked by the cone construction and AM equations (3.11)–(3.12), not guessed journal pagination.
- **EN** — Veronika Ertl and Wiesława Nizioł, *Syntomic cohomology and p-adic motivic cohomology*, [arXiv:1603.01705v2](https://arxiv.org/abs/1603.01705v2), §§2.1–2.2, Proposition 2.1, Theorems 2.2 and 2.5, pp. 4–9; EN line 158, EN line 193, EN line 243, EN line 318, EN line 360. Its motivic comparisons are outside this producer.
- **CN** — Pierre Colmez and Wiesława Nizioł, *Syntomic complexes and p-adic nearby cycles*, [arXiv:1505.06471v4](https://arxiv.org/abs/1505.06471v4), §1.1.1/Theorem 1.1, §2.2.1, §2.4.3, Theorems 4.14/4.16 and §5.1, pp. 2,10,23,49–57; CN line 67, CN line 78, CN line 422, CN line 968, CN line 2305, CN line 2384, CN line 2664. The bound retained here is the v4 statement including its p=2 qualification, not the shorter EN summary.
- **HK** — Osamu Hyodo and Kazuya Kato, *Semi-stable reduction and crystalline cohomology with logarithmic poles*, Astérisque 223 (1994), Exposé V, 221–268, [Numdam open text](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §§3.2–3.6 and Theorem 5.1; HK line 698, HK line 715, HK line 730, HK line 770, HK line 1321, HK line 1340.
- **NN** — Jan Nekovář and Wiesława Nizioł, *Syntomic cohomology and regulators for varieties over p-adic fields*, [arXiv:1309.7620v5](https://arxiv.org/abs/1309.7620v5), Theorem A(1),(4), §3.2/equation (32), Propositions 3.8 and 3.18 (p. 33, NN line 1688–1691), §4.1, Proposition 4.6, Corollary 4.11; NN line 85, NN line 93, NN line 1299, NN line 1387, NN line 2324, NN line 2400, NN line 2778. Cite this version’s numbering; no conversion to published pagination is assumed.
- **AM** — Masanori Asakura and Kazuaki Miyatani, *Milnor K-theory, F-isocrystals and Syntomic Regulators*, [arXiv:2007.14255v2](https://arxiv.org/abs/2007.14255v2), Definitions 2.1,2.3,2.4,2.12; Lemma 2.5; Propositions 2.15,2.17–2.18; Lemma 2.19 with its affine proof domain; equation (2.22); Lemmas 3.8–3.10; Theorem 3.7 and §4.1 only for consumer compatibility contracts. AM line 117, AM line 131, AM line 181, AM line 249, AM line 283, AM line 451, AM line 512, AM line 567, AM line 587, AM line 609, AM line 808, AM line 1229, AM line 1289, AM line 1302. The Frobenius datum is a module isomorphism; a coefficient module is not required to be an algebra.
- **Buhler** — Theo Bühler, *Exact Categories*, [arXiv:0811.1480v2](https://arxiv.org/abs/0811.1480v2), Definition 2.1, p. 5, Buhler line 195; §12, pp. 42–48, Buhler line 2215, for exact-category proof context. This is not an assertion that an enough-projectives construction covers every coefficient category.
- **TsujiNearby** — Takeshi Tsuji, *On p-adic nearby cycles of log smooth families*, Bulletin de la Société Mathématique de France 128 (2000), 529–575, [Numdam open text](https://www.numdam.org/article/BSMF_2000__128_4_529_0.pdf), Theorems A3–A4, p. 563; Lemmas 4.3–4.4, pp. 551–553; proof of Theorem 4.2, pp. 554–555; Lemmas 3.2 and 5.2, pp. 547,555–557; proof of Theorem 5.1, pp. 558–561; Proposition A15, p. 570. TsujiNearby line 679, TsujiNearby line 805, TsujiNearby line 873, TsujiNearby line 892, TsujiNearby line 954, TsujiNearby line 1074, TsujiNearby line 1211, TsujiNearby line 1231, TsujiNearby line 1442.
- **StacksRlim** — The Stacks Project authors, *More on Algebra*, [Tag 07KV](https://stacks.math.columbia.edu/tag/07KV), Lemmas 15.88.1–15.88.2 and the two-term derived-limit construction; StacksRlim line 10638–10675.
- **MathlibPin**, **MathlibCone**, **MathlibExt**, **MathlibBDeRhamReview**, **TauCetiCone**, **TauCetiSyntomic**, **TauCetiExactReview**, **TauCetiExactFunctorReview**, **TauCetiExtReview** — the pinned open Lean files and declarations listed in the exact supplier contracts; their licensed source URLs and content hashes are in the manifest. Code is provenance for existing carriers, not the mathematical specification of new comparison theorems.
