# Design report: SolidAnalyticRings

The design consists of packages/SolidAnalyticRings/design/README.md, packages/SolidAnalyticRings/design/plan.json and the updated packages/SolidAnalyticRings/sources.toml. It has seven layers, 26 targets, seven definitions with APIs and at least three discriminating Checks each, and two explicit missing supplier contracts. It covers all seven endpoints of packages/SolidAnalyticRings/target.md. No target was merged into this scope from another triaged target.

The final targets include the ambient light spectral category, null-test solidification and compact generator, countable product and coherently split finite sphere tower comparisons, the actual balanced tensor map, cardinal-filtered interchange, the full spectral null-family formula, all homotopy sheaves and finite-output naturality, bounded-below resolutions, uniform realization estimates, the transferred p-complete comparison and sphere-linear analytic structures. Spectral extensions are stated as proof obligations with the source model identified; they are not represented as proved by the abelian or arithmetic source alone.

## Scope decisions and mathematical corrections

The null-family datum is consistent beyond arithmetic. The inverse system of truncated spherical monoid algebras at t^r has ranks0,1,2 at r=0,1,2 and limit 𝕊[[t]]. Its multiplication-by-t^r cofiber is its rank-r quotient, and the truncations split sphere-linearly. The theorem is not restricted to this example; its general hypotheses remain the specified connective algebra, coherent divisibility, completeness and split finite sphere quotients.

The ideal object J_r is a derived fiber, abstractly equivalent to A with marked map a_r to A. Treating it as an unmarked copy of A would erase the filtration. No quotient cofiber is assumed to carry a commutative spectral algebra structure. No idempotence or analytic-ring axiom for Λ_a on arbitrary modules is inferred merely from completeness of A.

The order on proper profiles is reverse pointwise order. The family f_k(j)=max(j−k,0) would force a common target to be identically0, which is not proper. Accordingly §5.3 uses the independent-union theorem, not §4.1. The tensor argument uses independent towers before balancing; it never upgrades a sphere-linear splitting to a coefficient-linear splitting. The scalar-limit comparison has the explicit dualizability hypothesis, and the rational denominator example demonstrates the need for a restriction.

The pinned convergent-sequence projectivity theorem in Mathlib/Condensed/Light/Sequence.lean:302 was found by object search and read with its Type0 variable block. That base case is imported, with the marked retract and the additional universe transport explicitly separated in §1.3. The preliminary spectral null-Hom calculation is placed before reflection in §2.1. This removes a possible proof cycle between homotopy compatibility and construction of the reflector. The free solid measure comparison in §2.2 makes the connective-preservation input explicit. The summability argument uses right modules over the compact generator's connective endomorphism algebra, with precomposition fixing the action; it does not infer connective preservation from reflectivity alone.

The p-adic comparison retains all primes, a uniform lower bound where tensor is involved, and the completed sphere unit. Integer relative tensor is distinguished from absolute sphere tensor: Hℤ_p⊗■_{Hℤ}Hℤ_p=Hℤ_p is the integer statement, while no absolute equality Hℤ_p⊗■Hℤ_p=Hℤ_p is claimed. The analytic measure comparison requires the supplied integer-solid realization of the underlying algebra and measures. It does not transport a general liquid or other non-solid analytic structure into Sp■ without such a comparison.

No Suggested.lean was requested among the design deliverables, and none was written. In particular, no axioms or abstract replacement structures were introduced to conceal missing spectral carriers at the pins. No Lean command was run. The eventual acceptance test must state headline theorems using the real supplied carriers, with one import Mathlib, necessary simple definitions, theorem sorries only and no set_option. Design targets and their basic APIs are not a substitute for that later elaboration test.

## Ownership and citations checked

The content checkout was verified at main a07e2024f391f3022520c3f8ad194912b3eab614. GeneralizedCohomology and EnhancedDerivedSheaves were read on that main, including their substantive supplier and model sections. StableHomotopyKTheory §§5.13–5.18 and VStackSheavesAndLisseCategories VS2.1–VS2.2 were read through the supplied open-head roadmap service. HabiroRings §§2.8–2.12 and its supplier gap were also read at its supplied head. A progress/revision pull request for EnhancedDerivedSheaves was not substituted for its main contract.

Ownership searches used the roadmap service against the main and all indexed open roadmap heads, by objects: light spectral hypersheaves, null-sequence solidity, split finite free towers, balanced tensor, proper profiles, analytic full subcategories, summability tests and countable AB6. Visible board designs were searched by the same objects. In addition, every one of the 37 heads in the supplied board package index was read at its indexed head, using packages/<Name>/README.md or packages/<Name>/design/README.md as present. There were no unavailable package READMEs among those 37. Matches for the spectral foundations were RefinedTraceMethods, and requests were HigherHidaAndColemanTheory; AnalyticNumberTheory's “spectral summability” match concerns Weyl estimates and is unrelated to these coefficient objects.

The board package packages/RefinedTraceMethods/README.md at head 87bc3ff, §6.2, was read directly. Its exact ambient block is the work relocated below; its remaining nuclear and even theory stays there. packages/HigherHidaAndColemanTheory/design/README.md at head da88512, R23–R24, was read directly. packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md, LR.3 and its SA.1/SA.2/SA.4 requests, was read in the visible board. These are requests for contracts, not evidence that those section numbers already exist here.

The board's packages/VStackSheavesAndLisseCategoriesPartII/design/README.md at head 0987ba7 was read as well. Its VS6–VS11 develops decent stacks, exceptional operations and trace formulas. It does not supply the light countable AB6 statement. The missing abelian continuation below is proposed as VStackSheavesAndLisseCategoriesPartIII §1.1, since the Part II name already denotes that geometric continuation. The existing Part II is not cited as a supplier of AB6 and none of its targets is replanned here.

The given open roadmap files were included in the indexed ownership searches. No unlisted pull request was sought as a dependency. No instruction-like source passage was encountered that was executed or incorporated as an instruction. Source and issue text was treated as data.

### Notions moved down

| Existing owner and block | Destination in this design | Preserved boundary |
| --- | --- | --- |
| RefinedTraceMethods §6.2, Light condensed and solid spectra | §§1.1–1.4, 2.1–2.4 and6.4 | The hypersheaf model, fully faithful monoidal discrete embedding, null test, reflection, generator and bounded-below p-complete comparison are retained. Nuclearity, trace classes, perfect-even sites and filtrations stay in RefinedTraceMethods §§6.2–6.4. |

This is an ownership relocation. RefinedTraceMethods is not a supplier row, Needs item or plan prerequisite. Its own dependency on HabiroRings therefore cannot create a return edge. Integration must update that owner's generic block to import these sections; this job does not edit the other author's files.

### Proposed continuations and gaps

| Gap | Required statement and exact owner | Needed by |
| --- | --- | --- |
| cardinal-interchange | EnhancedDerivedSheaves E0.8/E5:presentability.2: κ-filtered colimits in spaces commute with κ-small limits, compatibly with stabilization. E0.8 gives definitions and accessibility, not this theorem; the generic extension is proposed as EnhancedDerivedSheaves, Part II. HTT Proposition 5.3.3.3 was read, HTT line18705. | §4.1 |
| light-countable-ab6 | VStackSheavesAndLisseCategories VS2.1: countably many directed unions of subobjects commute with the product when the indices are chosen independently. This is the exact additional abelian continuation contract, proposed as VStackSheavesAndLisseCategoriesPartIII §1.1; its existing geometric Part II is not evidence for it. RC Theorem 2.3.3(1) was read, RC line539. | §4.2, then §§5.3–5.4 |

The Hida contracts R23–R24 exceed this roadmap in Huber-pair localization, formal complements and nilpotent-slope geometry. Their integer/analytic geometric portion belongs to VS2.2 or an additional continuation of that owner. LR.3's strongly inaccessible universe, Banach/Smith/LB and solid profinite group-ring requests also exceed the chosen light sphere-linear coefficient contract. They require their functional-analysis and representation coefficient owners or a dedicated continuation; they are not silently asserted here. There are no merged target statements left unplanned.

### Pinned declaration evidence

The baseline commits are exactly those of lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Every listed library statement below was read in that pinned checkout. The native-body entries explain the actual scope of the carriers, including what they do not assert.

| Declaration | Pinned file and lines | Statement consumed and limitation |
| --- | --- | --- |
| LightProfinite; LightProfinite.of | Mathlib/Topology/Category/LightProfinite/Basic.lean:42,56 | The native property is total disconnectedness and second countability on CompHausLike; the constructor explicitly requires compactness and T2. Noncompact ℕ is not a light profinite object. |
| LightProfinite.effectiveEpi_iff_surjective | Mathlib/Topology/Category/LightProfinite/EffectiveEpi.lean:28 | EffectiveEpi f iff Function.Surjective f, for actual light profinite arrows. |
| LightCondensed | Mathlib/Condensed/Light/Basic.lean:28 | Its body is `Sheaf (coherentTopology LightProfinite.{u}) C`. This is an ordinary category of sheaves, not a spectral enhancement or a Postnikov convergence theorem. |
| LightCondMod; LightCondensed.free; LightCondensed.freeForgetAdjunction; LightCondAb | Mathlib/Condensed/Light/Module.lean:42,68,73,85 | ModuleCat-valued light sheaves; compose-and-sheafify free modules; the free/forgetful adjunction; specialization to ℤ. |
| LightCondensed.discreteUnderlyingAdj | Mathlib/Condensed/Discrete/Basic.lean:65–87 | For an ordinary category with the specified sheafification, discrete C is left adjoint to point evaluation; no spectral or inverse-limit preservation statement. |
| CountableAB4Star and IsGrothendieckAbelian instances | Mathlib/Condensed/Light/AB.lean:31–37 | Exact countable products for any ring R; Grothendieck abelianness. The class statements were also read at CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean:280 and GrothendieckCategory/Basic.lean:69. They do not contain AB6. |
| Ordinary monoidal/closed instances | Mathlib/Condensed/Light/Monoidal.lean:35–62 | Commutative R, ordinary sheaf tensor, symmetry, internal Hom and monoidal sheafification/free functors. |
| Condensed.profiniteFree; profiniteSolid; profiniteSolidification | Mathlib/Condensed/Solid.lean:44,48,69 | Free sheaf; right Kan extension of finite free sheaves; comparison to that right Kan extension. No proof of reflection or spectral solidity is included by those definitions. |
| CondensedMod.IsSolid | Mathlib/Condensed/Solid.lean:74–85 | The field requires inversion of every profinite-solidification test. The native docstring warns against this as general-ring solidity and specifies polynomial restriction tests. The roadmap uses VS2 for that theory. |
| LightCondensed.internallyProjective_free_natUnionInfty; CategoryTheory.InternallyProjective.ofRetract | Mathlib/Condensed/Light/Sequence.lean:20–22,302; CategoryTheory/Preadditive/Projective/Internal.lean:41–61 | The free convergent-sequence module is internally projective for a commutative ring in Type0; the marked null summand inherits this by retraction. Internal projectivity means preservation of epimorphisms by internal Hom. Universe transport is an explicit additional target in §1.3, not silently obtained from this specialized signature. |
| Submodule.basisOfPid | Mathlib/LinearAlgebra/FreeModule/PID.lean:298 | A submodule of a finite free module over a commutative principal ideal domain has a finite basis; use ℤ for the finite matrix kernel in §3.2. |
| LocallyConstant.freeOfProfinite | Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153 | Module.Free ℤ (LocallyConstant S ℤ) for every profinite S. Integer measure consequences remain owned by VS2.1. |

An object/field search of pinned TauCeti found no direct light spectral carrier or solidity construction to substitute here; the sheaf tensor reference in TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean:41 is an ordinary tensor comparison. No new direct Tau Ceti dependency is claimed. Concrete spectra and enhanced adapters are supplier roadmap targets, not declaration aliases at the pin.

## Sources read and unavailable sources

All nine manifest entries are certified legal copies. The eight supplied cached texts were reused, and HTT was fetched through the sources service from its author page, retaining its service provenance. Its read version is 9 April2017, printed p.394/PDF p.412. The manifest has one key per work and no machine path. There is no missing-text request and no uncertified paper silently used as read evidence.

| Key | Passages actually used |
| --- | --- |
| W | W lines437–475, paragraphs 2.1–2.3, pp.11–12: the spectral foundations and bounded-below p-complete recollection. |
| MW | MW lines1748–1775, paragraphs 4.1–4.2, p.41: the spectral category and integer f-summability model. |
| Q | Q lines3643–3705, AppendixB.6–B.8, printed pp.79–80: product/tower, balanced variables, null profiles and bounded-below argument. The arithmetic multiplication and q-binomial estimates after this point are not targets here. |
| Bosco | Bosco lines3459–3521, PropositionA.3 and LemmaA.4, pp.92–93: integer p-completion, free resolutions and uniform block decay. These do not certify arbitrary spectral coefficients. |
| RC | RC lines537–558,730–803,870–898,1392–1519,2114–2145: light exactness, null projectivity, integer solid measures, hyperdescent, analytic subcategory axioms and summability models. |
| CS | CS lines1243–1257 and1578–1595, Theorems5.8 and6.2: the imported integer solid and monoidal theory. |
| AG | AG lines1361–1408 and3014–3078, Definition 6.12/Proposition 6.14 and Definition 12.1/Proposition 12.4/Remark 12.5: integer and animated analytic measure theory. |
| HTT | HTT lines18705–18726, Proposition 5.3.3.3: the exact cardinal interchange equivalence. |
| AS | AS lines9–20 and39–44: course identity and editorial limitations only. It is not mathematical certification for a headline. |

## Adversarial mathematics pass

These computations check the stated signatures and conventions; they are not proofs of the general targets. Each target and each API law has a row. Test rows then verify that every stated Check is consistent with its target. The conventions include direction, sign, universe, scalar handedness, zero rings, nonreduced coefficients and the distinction between ordinary and condensed limits. Number-theoretic ramification, nonabelian group actions and inseparable field extensions are not inputs of these statements; no field, DVR, residue-characteristic exclusion or group commutativity is hidden in a variable block.

| Statement | Instances tried and computed values on the two sides | Result | Change or retained requirement |
| --- | --- | --- | --- |
| §1.1 The ambient category | T=∅: 0=0; T=*⊔*: M(T)=M(*)²; free sizes 2 and 3 give 2·3=6 sphere summands. The identity hypercover has Tot X=X. | Agrees on these instances. | Hyperdescent and empty value are explicit. |
| §1.1 API: lightSpectralFree | For T=*, M=δ𝕊 the mapping spectrum is 𝕊 and π₀=ℤ; for T=∅ it is 0. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §1.1 API: lightSpectralSheaves_ext | The maps 0 and 1 on δHℤ have values 0 and 1 at *, so are distinct. | Agrees on this law. | extensionality law has the hypotheses in its target. |
| §1.1 API: lightSpectralSheaves_descent | For the identity cover of *, Tot of the constant cosimplicial spectrum X is X. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §1.1 API: lightSpectralTensor | For T of size 2 and U of size 3 both sides are six spheres; with T empty both are 0. | Agrees on this law. | structure law has the hypotheses in its target. |
| §1.2 Discreteness and point evaluation | X=0 gives 0→0; X=𝕊 gives π₀(unit)=id_ℤ; X=Σ𝕊 gives π₁(unit)=id_ℤ. On T=ℤ_p, id:T→ℤ_p belongs to lim_r C(T,ℤ/p^r) and does not belong to locally constant C(T,ℤ_p). | Agrees on these instances. | No arbitrary inverse-limit preservation. |
| §1.2 API: discreteSpectral_map | For ×2 followed by ×3 on Hℤ the induced π₀ map is ×6, as is δ(×6); the zero map has value0. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §1.2 API: discreteSpectral_unit | At X=ΣHℤ its π₁ map is id_ℤ and π₀ is0→0. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §1.2 API: discreteSpectral_tensor | For X=𝕊²,Y=𝕊³ the product comparison identifies six individual projections; for X=0 both sides are0. | Agrees on this law. | structure law has the hypotheses in its target. |
| §1.3 The marked null sequence | π₀Hom(N,δHℤ)(*)=⊕ℕℤ; σ*e₀=0, σ*e₁=e₀; (1−σ*)(e₁+e₀)=e₁. For C={∞}, cofib(id)=0. | Agrees on these instances. | Shift and sign fixed. |
| §1.3 API: spectralNullSequence_map | The identity sends e₀ to e₀; σ sends e₀ to e₁. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §1.3 API: spectralNullSequence_hom | For discrete Hℤ, π₀ of this Hom at * is ⊕_ℕℤ; the ∞ value is 0. | Agrees on this law. | universal property law has the hypotheses in its target. |
| §1.3 API: spectralNullSequence_shift | For b=e₁, σ*b=e₀ and (1−σ*)b=e₁−e₀. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §1.3 API: spectralNullSequence_universe | The lifted marked point remains∞, σ sends the lifted0 to the lifted1, and on integer coefficients the witness e₁−e₀ is unchanged; the single marked-point null summand is0 in both universes. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §1.4 Spectral solidity | M=0: Hom=0 and 1−σ*=id_0. M=δHℤ: e₁↦e₁−e₀↦e₁. For N→L■N, π₀ at * sends finite-support vectors into ∏ℕℤ; (1,1,…) is outside the image, so the unit is not invertible (using §2.4). | Agrees on these instances. | Internal test, not global π₀ only. |
| §1.4 API: isSolidSpectrum_iff_tests | For M=0 every mapping spectrum is 0; for the identity map on the test cofiber the value is nonzero when that cofiber is nonzero. | Agrees on this law. | characterisation law has the hypotheses in its target. |
| §1.4 API: isSolidSpectrum_equiv | The two automorphisms ±1 of δHℤ remain distinct, with π₀ values 1 and −1. | Agrees on this law. | extensionality law has the hypotheses in its target. |
| §1.4 API: discrete_isSolidSpectrum | On e₁ the inverse is e₁+e₀, and on 0 it is 0. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §2.1 The spectral homotopy structure | For Hℤ[1]=ΣHℤ, π₀=0 and π₁=ℤ; cochains ℤ[−2] give π₋₂=ℤ. For square-zero 𝕊⊕Σ𝕊, π₁=(ℤ/2)⊕ℤ; truncation τ≤0 has π₁=0. 0 has every π_k=0. | Agrees on these instances. | Preliminary calculation precedes reflector. |
| §2.1 API: solidHomotopy_truncation | For M=Hℤ⊕ΣHℤ, τ≤0M=Hℤ with π₀=ℤ and π₁=0, while τ≥1M=ΣHℤ. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §2.1 API: solidHomotopy_heart | For B=ℤ/2, π₀HB=ℤ/2 and π₁HB=0; for B=0 every π_k is0. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §2.1 API: solidHomotopy_shift | For M=Hℤ and k=1 both sides areℤ; at k=0 both sides are0. | Agrees on this law. | structure law has the hypotheses in its target. |
| §2.2 Reflection and closed tensor | L■0=0; L■δ𝕊=δ𝕊; 0⊗■δ𝕊=0; for two free ranks 2, Hom((𝕊²)⊗■(𝕊²),Hℤ)(*) has π₀=ℤ⁴. | Agrees on these instances. | Free measure comparison and connective preservation explicit. |
| §2.2 API: solidSpectralReflection_unit | For C=M=δHℤ the unit induces id_ℤ on π₀. | Agrees on this law. | universal property law has the hypotheses in its target. |
| §2.2 API: solidSpectralReflection_idempotent | For C=0 both composites are id_0; for C=δ𝕊 both are id_𝕊. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §2.2 API: solidSpectralTensorHom | For C=D=𝕊⊕𝕊 and M=Hℤ both sides have π₀=ℤ⁴. | Agrees on this law. | structure law has the hypotheses in its target. |
| §2.2 API: solidSpectralFreeMeasure | For T=∅,*,{0,1} the limits have ranks0,1,2. For the convergent sequence the marked summand has product coordinates e_n tending to0. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §2.3 The Hℤ-linear comparison | Unit: π₀Hℤ=ℤ. Tensoring [ℤ --p→ ℤ] with 𝔽_p gives [𝔽_p --0→ 𝔽_p], so π₀=π₁=𝔽_p for p=2,3. In degree 1, H₁(BΣ₂;𝔽₂)=𝔽₂ whereas π₁𝔽₂[x]=0. | Agrees on these instances. | Hℤ-linear comparison is not a sphere equivalence. |
| §2.4 The free solid generator | π₀G(*)=ℤ^ℕ, containing (1,1,…); π₀N(*)=ℤ^(ℕ) excludes it. e_n converges coordinatewise to 0, but is never eventually 0 in the discrete topology. For A=0, G_A=0 and Mod_A has one object up to equivalence. | Agrees on these instances. | Generator is A⊗■G, not an unexplained product of A. |
| §2.4 API: solidNullGenerator_unit | On π₀ at *, the vector e₀ maps to coordinate vector(1,0,0,…); the all-one vector is absent from N. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §2.4 API: solidNullGenerator_homotopy | At k=0 this isℤ^ℕ, at k=−1 it is0, and at k=1 it is(ℤ/2)^ℕ. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §2.4 API: solidModuleGenerator_free | For A=0 both sides are0; for A=𝕊 and M=G both sides are End(G), whose identity sends e₀ to e₀. | Agrees on this law. | universal property law has the hypotheses in its target. |
| §3.1 Product tensor comparison | I=∅: 0⊗■P=0=∏∅𝕊. Sizes 1,1 give 𝕊; sizes 2,3 give 𝕊⁶. The two Σ𝕊 factors give (−1)^(1·1)=−1, while degree 0 gives +1. | Agrees on these instances. | Empty/finite indices and Koszul sign retained. |
| §3.2 Coherently split finite free towers | Ranks 1→2→3 decompose as 1,1+1,1+1+1. Projection-section composite is the 1×1 matrix [1]. For ×2, a section would require 2b=1 in ℤ. The two section coordinates differ by y−x, not y+x. | Agrees on these instances. | Sphere-linear coherent sections only. |
| §3.2 API: splitFiniteFreeSphereTower_mk | The projection 𝕊²→𝕊 with section x↦(x,0) has composite id and kernel 𝕊. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §3.2 API: splitFiniteFreeSphereTower_ext | Two identity stage families induce id on every product coordinate. | Agrees on this law. | extensionality law has the hypotheses in its target. |
| §3.2 API: splitFiniteFreeSphereTower_decompose | P_n=𝕊^(n+1) with truncation gives ranks 1+n and limit 𝕊^ℕ. | Agrees on this law. | structure law has the hypotheses in its target. |
| §3.2 API: splitFiniteFreeSphereTower_changeSplitting | The sections x↦(x,0) and x↦(x,x) of 𝕊²→𝕊 give coordinate change (x,y)↦(x,y−x), with inverse (x,z)↦(x,z+x). | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §3.3 Independent towers | Constant ranks 1,1 give rank1; growing stages (m,n)=(0,0),(1,2),(2,2) give ranks 1,6,9. Over A=𝕊[t], s(t·1)=0 and t·s(1)=t≠0, disproving A-linearity. | Agrees on these instances. | Independent tower variables retained. |
| §3.4 Balancing and change of scalars | A=X=Y=𝕊 gives 𝕊. Over 𝕊[t], μ(t₁)=t=μ(t₂) and μ(t₁−t₂)=0. For B=Hℚ, (1/2^n) has no common denominator, while each element of (ℤ^ℕ)[1/ℤ≠0] does. Finite free B=Hℤ² gives (lim M)²=lim M². | Agrees on these instances. | Dualizability required for scalar-limit interchange. |
| §4.1 Countable-limit interchange | K=∅ gives colim_J0=0=lim∅. With J=ℕ, π₀(colim_n∏_kF(n,k))=ℤ^(ℕ), while π₀(∏_kcolim_nF(n,k))=ℤ^ℕ; (1,1,…) occurs only on the right. ℕ is filtered but has no upper bound for {0,1,2,…}. | Agrees on these instances. | ω₁-filteredness retained. |
| §4.2 Independent bounds in the heart | Independent choices α_j=j+1 contain x_j=1/(j+1)!; there is no fixed N with all x_j∈(1/N!)ℤ. For the split tower, lim π₀=ℤ^ℕ and lim¹π₁=0; its n=1 projection sends (a₀,a₁,…) to (a₀,a₁). | Agrees on these instances. | Independent index choices; supplier gap recorded. |
| §5.1 The coefficient datum and derived completion | For A=𝕊[[t]], ranks B₀,B₁,B₂ are 0,1,2; J₀=A and J₂→J₁ corresponds to ×t. For A=0 every object is 0. π₀(𝕊/2)=ℤ/2 and π₀(𝕊/3)=ℤ/3, excluding the required free ℤ-stage property. | Agrees on these instances. | Derived cofibers and marked fiber maps retained. |
| §5.1 API: completeSplitCoefficientDatum_mk | For A=𝕊[[t]], a_r=t^r, B₀=0, B₁=𝕊 and B₂=𝕊². | Agrees on this law. | constructor law has the hypotheses in its target. |
| §5.1 API: coefficientIdeal_map | For t-powers, J₂→J₁ sends t²x to t²x, corresponding to x↦tx on the unmarked copies of A. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §5.1 API: derivedQuotientCompletion_unit | For M=A the map is the given equivalence; for M=0 it is id_0. | Agrees on this law. | universal map law has the hypotheses in its target. |
| §5.1 API: derivedQuotientCompletion_cofinal | Keeping only stages 2r of the t-power tower still gives lim A/t^(2r)=A. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §5.1 API: derivedQuotientCompletion_tensor | For r=0, cofib(id_M)=0=M⊗_A0. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §5.2 Proper profiles and their order | For f(j)=j, #{j:f(j)<0}=0 and #{j:f(j)<2}=2. For constant0 the r=1 sublevel has cardinal ℵ₀. A common target of f_k has g(j)=0 for all j. min(j,2j)=j is a common target of j and 2j. | Agrees on these instances. | Reverse order; not ω₁-filtered. |
| §5.2 API: properProfile_mk | f(j)=j has sublevel set {0,…,r−1}, of cardinal r, including cardinal0 when r=0. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §5.2 API: properProfile_filtered | For f_k(j)=max(j−k,0), a common target g would have g(j)≤f_j(j)=0, so g=0 is not proper. | Agrees on this law. | structure law has the hypotheses in its target. |
| §5.2 API: properProfile_transition | For a_r=t^r and f(j)=j+1,g(j)=j, the map is inclusion t^(j+1)A→t^jA, corresponding to multiplication by t. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §5.2 API: finiteSupportBlockMap_comp | Supports {j,j+1} followed by {k,k+2} give {j,j+1,j+2,j+3}, with at most four outputs. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §5.3 The completed countable-sum formula | For x_j=t^j, modulo t⁰ all vanish, modulo t only x₀=1 remains, and modulo t² the survivors are 1,t. For x_j=1, infinitely many survive modulo t. Two nonempty finite blocks give A², and all empty blocks give0. One infinite block gives A^ℕ, without coordinatewise t-decay. | Agrees on these instances. | Uniformity is in the block index, not within one block. |
| §5.4 Every degree and finite-output block maps | k=−1: both homotopy sheaves are0. For k=1 and p=2 sphere class η, modulo t² the sequence is (η,ηt,0,…). Duplicating to 2j,2j+1 gives (1,1,t,t,0,…) modulo t²; the constant-output family (1,1,…) is excluded. | Agrees on these instances. | Every homotopy degree and actual finite-output maps. |
| §6.1 Uniformly bounded-below free resolutions | For constant P_n=Σ^bG_A, realization=Σ^bG_A and π_k=0 for k<b in every n. For zero P, realization0. For P_n=Σ^(−n)G_A the least possible bounds −n tend to −∞; no fixed b exists. | Agrees on these instances. | One lower bound in every simplicial degree. |
| §6.2 Connectivity of quotient completion | cofib(id_M)=0; cofib(0_M)=M⊕ΣM. A degree0 ×2 tower has π₀lim=0 and π₋₁lim=ℤ₂/ℤ≠0. Split finite-free block quotient towers instead have lim¹=0. | Agrees on these instances. | Conservative b−1 bound, improved on split free blocks. |
| §6.3 Uniform realization comparison | For a constant simplicial object the comparison is id. For normalized degree1 M=Σ^bA the layer is Σ^(b+1)A. If normalized degree n is Σ^(−n)A then Σ^nΣ^(−n)A=A: every tail can have π₀A, rather than increasing connectivity. | Agrees on these instances. | Explicit skeletal tail estimates. |
| §6.4 The transferred p-complete comparison | For p=2,3: π₀unit is ℤ→ℤ_p, 1↦1, not an isomorphism ℤ≃ℤ_p. Hℤ_p⊗■_{Hℤ}Hℤ_p=Hℤ_p. The two-term resolution of 𝔽_p over ℤ_p gives π₀=π₁=𝔽_p for H𝔽_p⊗_{Hℤ_p}H𝔽_p. X=0 gives e_p0=0. For X=H𝔽_p, the tower maps on X⊕ΣX are diag(id,0), so its limit is X; retaining an identity on the second summand would incorrectly give X⊕ΣX. | Agrees on these instances. | Completed sphere unit and all primes retained. |
| §6.4 API: primeCompleteDiscrete_unit | For X=H𝔽₂ and H𝔽₃, the quotient tower has maps diag(id,0) and limit X, so the unit is id_X. | Agrees on this law. | evaluation law has the hypotheses in its target. |
| §6.4 API: primeCompleteDiscrete_tensor | For X=Y=𝕊^∧_p the comparison gives e_p(𝕊^∧_p) on both sides, with π₀=ℤ_p for p=2,3. | Agrees on this law. | structure law has the hypotheses in its target. |
| §6.4 API: primeCompleteInteger_comparison | For A=ℤ_p and M=N=ℤ/p in degree0, relative tensor has π₀=π₁=𝔽_p at p=2,3. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §6.4 API: solidPrimeCompletion_reflection | For M=H𝔽_p, the cofiber transitions diag(id,0) have limitM and the unit is id; for M=Hℤ[1/p], each cofiber is0 and completion is0. | Agrees on this law. | universal property law has the hypotheses in its target. |
| §7.1 Uncompleted and completed structures | D=all: L_D(A)=A; D=0: L_D(A)=0. For A=Hℤ their π₀ units are ℤ→ℤ and ℤ→0, respectively. ⊕ℕHℤ is not perfect because its identity cannot factor through a finite subsum. | Agrees on these instances. | Uncompleted and completed structures distinguished. |
| §7.1 API: spectralAnalyticStructure_mk | D=Mod_A has L=id, whereas D={0} has L=0; both satisfy the uncompleted axioms. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §7.1 API: spectralAnalyticStructure_ext | For A=Hℤ, D=all and D=0 are not equal: L(A) is Hℤ in one and0 in the other. | Agrees on this law. | extensionality law has the hypotheses in its target. |
| §7.1 API: spectralAnalyticStructure_morphism | Restriction along id_A sends M to M; the composite of two identity restrictions is again M. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §7.1 API: spectralAnalyticStructure_complete | For D=0 and A≠0 the map A→0 is not an equivalence; for A=0 it is. | Agrees on this law. | characterisation law has the hypotheses in its target. |
| §7.2 Complete tensor and scalar extension | D=0,A=Hℤ: unit0 with π₀=0; D=all: unitHℤ with π₀=ℤ. Identity extensions compose to id. H𝔽₂⊗_{Hℤ}H𝔽₂ has π₀=π₁=𝔽₂, so completing a trivial structure leaves that Tor group present. | Agrees on these instances. | Explicit completed B′-module base-change paths; Tor retained. |
| §7.2 API: analyticCompletedTensor_unit | For D=0 the tensor unit is0, not a nonzero A; for D=all it is A. | Agrees on this law. | structure law has the hypotheses in its target. |
| §7.2 API: analyticScalarExtension_adjunction | For A=B=Hℤ with trivial structure and M=N=Hℤ, both mapping spectra have π₀=ℤ. | Agrees on this law. | universal property law has the hypotheses in its target. |
| §7.2 API: analyticScalarExtension_comp | For A=B=C and identity maps both expressions are M; for M=0 both are0. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §7.2 API: analyticScalarExtension_baseChange | For trivial structures over A=Hℤ, B=H𝔽₂ and A′=H𝔽₂, the pushout has π₀=π₁=𝔽₂; an underived pushout would omit π₁. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §7.3 Spectral summability structures | f=0:1−fσ*=id. For finite support, σ*e₁=e₀ and σ*e₀=0, so (1−fσ*)(e₁+fe₀)=e₁. For p=2,3, b=(1,p,p²,…) has (1−p⁻¹σ*)b=0 with b₀=1≠0; hence the test is not injective on this A. For A=H(𝔽₂[ε]/ε²), ε≠0, ε²=0 and (1−εσ*)(1+εσ*)=1, so L_{ε}=id. | Agrees on these instances. | Connectivity proved by the spectral endomorphism localization; coefficient unit retained. |
| §7.3 API: spectralSummabilityLocalization_tests | For f=0 the map is id; for f=1 it is already invertible on solid M. | Agrees on this law. | characterisation law has the hypotheses in its target. |
| §7.3 API: spectralSummabilityLocalization_free | For F=∅ this is C itself; for C=0 it is0. | Agrees on this law. | constructor law has the hypotheses in its target. |
| §7.3 API: spectralSummabilityLocalization_monotone | F=∅ followed by F′={0} gives the identity reflector twice. | Agrees on this law. | functoriality law has the hypotheses in its target. |
| §7.3 API: spectralSummabilityLocalization_scalar | For the identity algebra map and F=F′, extension and restriction are identities. | Agrees on this law. | compatibility law has the hypotheses in its target. |
| §7.3 API: spectralSummability_nilpotent | For A=H(𝔽₂[ε]/ε²), (1−εσ*)(1+εσ*)=1−ε²(σ*)²=1; the nonzero nilpotent ε is retained. | Agrees on this law. | characterisation law has the hypotheses in its target. |
| §7.4 Measures, animated inputs and site comparison | Integer measure ranks at ∅,*,{0,1} are0,1,2. In E=ℚ₂ or ℚ₃, (p^(−n)) has denominator exponents n with no finite bound, so it is outside (O_E^ℕ)[1/p]. Over 𝔽₂, H₁(BΣ₂;𝔽₂)=𝔽₂ while π₁𝔽₂[x]=0. | Agrees on these instances. | Only supplied integer-solid presentations are compared. |

The following rows spell out the convention checks that apply across layers.

| Convention | Instances and values computed | Result | Change |
| --- | --- | --- | --- |
| Empty stable products and free objects | ∏∅𝕊=0; 0⊗■𝕊=0; free(*⊔*)=𝕊²; 𝕊²⊗■𝕊³=𝕊⁶. | The empty branch agrees in §§1,3,5,7. | Empty cases kept. |
| Shift and symmetry | Hℤ[1]=ΣHℤ has π₁=ℤ, π₀=0; cochain degree2 gives π₋₂=ℤ; swapping two suspended generators has sign(−1)¹=−1. | Grading agrees in §§2,3,6. | Homological and cohomological signs fixed. |
| Precomposition direction | σ*e₁=e₀, σ*e₀=0; (1−σ*)(e₁+e₀)=e₁; (1−fσ*)(e₁+fe₀)=e₁. | Same witness in §§1,7. | Right-shift inverse convention excluded. |
| Module handedness | e₁₂e₂₁=e₁₁ while e₂₁e₁₂=e₂₂; (h·a)·b=(h∘a)∘b=h∘(ab). | Right End action by precomposition; E₁ module categories are left module categories before this reconstruction. | The noncommutative test is not replaced by a cyclic example. |
| Profile order and initial stage | a₀=1 gives cofib(id_A)=0, J₀=A; f=j+1→g=j gives t^(j+1)A⊆t^jA; min(j,2j)=j is a common target. | All arrows agree in §§5.1–5.4. | No ideal division or unmarked-fiber substitution. |
| Spherical monoid variable | In the r=2 quotient, basis(1,t), t²=0; ranks at r=0,1,2 are0,1,2. The square of t is not a new basis vector there. | The formal-variable witness satisfies the general datum. | Free commutative spectral algebra, with symmetric-group homology, is excluded as this example's carrier. |
| Universe and topology | The convergent sequence is compact and second countable. Discrete ℕ is not compact; an uncountable product2^I lacks a countable basis. Identity e_n→0 is coordinatewise continuous but not locally constant. | The chosen site and common-presentation comparisons do not acquire all larger spaces. | No unrestricted universe equivalence. |
| Completed prime unit | π₀unit=ℤ₂ at p=2 and ℤ₃ at p=3; ambient π₀unit=ℤ; both unit maps send1↦1. | Unital equivalence holds in the completed codomain. | Inclusion into all solid spectra is lax. |
| Nonreduced characteristic-two coefficient | In 𝔽₂[ε]/ε², ε≠0 and ε²=0; (1−εσ*)(1+εσ*)=1. | Nilpotent f adds no summability condition. | Nonreduced rings remain admitted in the analytic layer. |
| Total-function boundary values | For proper f=j, the r=0 sublevel is empty and r=2 sublevel={0,1}; max(j−j,0)=0 in the counterexample family. There are no scalar denominators in the null-family construction. | Natural subtraction does not alter the profile contradiction. | Strict sublevel convention retained. |

### Check-to-target consistency

Each listed Check below was evaluated using the computed target/API rows above; this index keeps the README's examples attached to the statements they test.

| Target | Check | Evaluated value or negative control |
| --- | --- | --- |
| §1.1 | empty | The empty space evaluates to 0, excluding the constant presheaf with nonzero empty value. |
| §1.1 | pair | For a disjoint pair, the sheaf value is two factors, and the free object is two spheres. |
| §1.1 | ordinary_carrier | The degree-zero integer homotopy sheaves use LightCondAb; an ordinary Category-valued sheaf alone does not encode spectral hyperdescent. |
| §1.2 | zero | δ0=0 and the adjunction unit at 0 is the identity of 0. |
| §1.2 | two_terms | For X=𝕊⊕Σ𝕊, π₀δX is ℤ and π₁δX contains the shifted ℤ summand. |
| §1.2 | inverse_limit | The inverse limit of discrete H(ℤ/p^r) has continuous ℤ_p-valued sections. On T=ℤ_p its identity section is not locally constant, so it is not δHℤ_p. |
| §1.3 | marked_point | The free cofiber on a singleton marked point is 0, excluding an unreduced free object. |
| §1.3 | shift | Against δHℤ, (1−σ*)e₁=e₁−e₀ and its inverse sends e₁ to e₁+e₀. |
| §1.3 | direction | A right shift on coefficient sequences sends e₁ to e₂ and fails the computed witness. |
| §1.4 | zero | 0 is solid, with the unique self-map of its zero Hom an equivalence. |
| §1.4 | sphere | δ𝕊 is solid with π₀=ℤ and π₁=ℤ/2; replacing spectra by Hℤ-modules loses the latter sphere class. |
| §1.4 | free_null | N is not solid: its pointwise π₀ is ⊕_ℕℤ, whereas its solidification has product π₀ and contains the all-one vector. |
| §2.1 | shift | ΣHℤ has π₁=ℤ and π₀=0; cohomological ℤ in degree 2 corresponds to π₋₂=ℤ. |
| §2.1 | zero | The zero module lies in every connective and coconnective range. |
| §2.1 | square_zero | A=𝕊⊕Σ𝕊 with square-zero ideal is connective and has a nonzero π₁; its heart does not determine A as a spectral algebra. |
| §2.2 | zero | L■0=0 and 0⊗■M=0. |
| §2.2 | unit | L■δ𝕊=δ𝕊, and δ𝕊⊗■M=M. |
| §2.2 | hom | Internal Hom into a solid target is computed in Cond(Sp), rather than by forgetting condensation. |
| §2.3 | integer | The spectral Hℤ-module unit corresponds to ℤ concentrated in cohomological degree 0. |
| §2.3 | tor | H𝔽_p⊗_{Hℤ}H𝔽_p has π₀=π₁=𝔽_p and other homotopy zero, including p=2,3. |
| §2.3 | animation | Over 𝔽₂, a free commutative derived algebra retains positive symmetric-group homology, whereas the animated polynomial algebra is discrete. |
| §2.4 | point | At the point, π₀G=∏_ℕℤ and the all-one vector is present. |
| §2.4 | non_discrete | The null family e_n gives a continuous map of the convergent sequence to π₀G; as a map into the discrete group ∏_ℕℤ it is not continuous. |
| §2.4 | zero_algebra | For A=0 the module category and G_A are both zero; generation is still the zero-object detection assertion. |
| §3.1 | empty | If I=∅ the empty product in the stable category is 0, so both sides vanish. |
| §3.1 | finite | For ∣I∣=2 and ∣J∣=3, both sides are six spheres and the coordinate (1,2) projection is the tensor of those two projections. |
| §3.1 | symmetry | Swapping two degree-one suspended sphere factors multiplies the generator by −1; unsuspended coordinate reindexing has sign +1. |
| §3.2 | constant | The constant zero tower has every kernel and limit 0; a constant rank-one identity tower has limit 𝕊. |
| §3.2 | growing | For P_n=𝕊^(n+1), the ranks at n=0,1,2 are 1,2,3 and the kernels all have rank 1. |
| §3.2 | non_split | Multiplication by 2 on 𝕊 is not a split surjection: an integer b with 2b=1 does not exist. |
| §3.3 | constant | Two constant rank-one towers give 𝕊⊗■𝕊≃𝕊. |
| §3.3 | ranks | At m=1,n=2 for the growing rank n+1 towers the independent stage has 2·3=6 summands. |
| §3.3 | scalar_warning | A section of A→A/(t) given by constant polynomials over the sphere is not A-linear: s(t·1)=0 while t·s(1)=t. |
| §3.4 | unit | For A=𝕊 both sides are X⊗■Y; if X=0 both are 0. |
| §3.4 | variables | For A=𝕊[t], X=Y=A, the absolute tensor has π₀=ℤ[t₁,t₂], and balancing sends t₁ and t₂ to t. |
| §3.4 | limit_failure | Over Hℤ, rational scalar extension of ∏_ℕℤ has uniformly bounded denominators. The element (1/2^n)_n lies in ∏_ℕℚ but not in (∏_ℕℤ)⊗ℚ, so arbitrary scalar extension cannot commute with this product. |
| §4.1 | empty_K | For K empty, both sides are 0; for J a point both sides are lim_K F. |
| §4.1 | ordinary_filtered | For F(n,k)=Hℤ when k<n and 0 otherwise, with J=ℕ and discrete K=ℕ, the two π₀ groups are ⊕_ℕℤ and ∏_ℕℤ, respectively. |
| §4.1 | constant | For K a point the map is the identity on colim_J F; no countable product assertion is used in this case. |
| §4.2 | bounded_denominators | For B_j=ℚ and subgroups (1/n!)ℤ, independent choices include (1/(j+1)!)_j, while the diagonal union has only uniformly bounded denominators. |
| §4.2 | zero | With every B_j=0 both sides are 0; an empty product is also 0 in abelian groups. |
| §4.2 | split_limit | For truncation towers ℤ^(n+1), the projection of ℤ^ℕ to the first n+1 coordinates is onto and lim¹=0. |
| §5.1 | formal_variable | Construct A as lim_r δ(𝕊[t]/t^r), whose underlying split stages have ranks r and preserve all sphere stems. Multiplication by t has cofiber 𝕊. |
| §5.1 | zero_ring | A=0 with its unique unit and zero stages is admitted; all J_r and all completions are 0. |
| §5.1 | p_moore | The tower 𝕊/p^r is not a split finite free sphere tower: π₀(𝕊/p)=ℤ/p is not finite free over ℤ. The p-adic theorem is §6.4, with its separate hypotheses. |
| §5.2 | proper | f(j)=j is proper; f(j)=0 fails for r=1, whose sublevel set is all ℕ. |
| §5.2 | empty_blocks | When every I_j is empty, each V_f=0. |
| §5.2 | not_omega_one | The countable family max(j−k,0) has no common target profile, excluding use of §4.1 for this colimit. |
| §5.2 | block_identity_zero | The identity block map has output support {j} on block j; the zero block map has empty support and induces the zero map on every quotient. |
| §5.2 | block_composition | The duplication j↦{2j,2j+1} followed by the same duplication has outputs {4j,4j+1,4j+2,4j+3}, a finite set of size4. |
| §5.2 | profile_transition | For a_r=t^r and f(j)=j+1→g(j)=j, the j-th ideal map sends t^(j+1)x to the same element of t^jA; reversing the inclusion would fail on t^j. |
| §5.3 | t_decay | For I_j a singleton and A=𝕊[[t]], the family (t^j)_j occurs, whereas (1)_j does not; modulo t^r only j<r remain. |
| §5.3 | finite_blocks | If only blocks 0 and 1 are nonempty singletons, both sides are A²: choose a proper profile with f(0)=f(1)=0. |
| §5.3 | infinite_block | For I₀=ℕ and all other blocks empty, both sides are ∏_ℕA. The allowed zero value at j=0 does not force decay within that block. |
| §5.4 | negative | For k<0 every term is 0 because the split coefficient ideals are connective; the completed free block sum is connective. |
| §5.4 | sphere_stem | For A=𝕊[[t]], π₁A=(ℤ/2)[[t]] and the degree-one family (ηt^j) has modulo t² survivors η and ηt. |
| §5.4 | block_maps | The map sending input block j to blocks 2j and 2j+1 sends t^j to two copies of t^j; modulo t² only outputs 0,1,2,3 survive. A block mapped simultaneously to every output is excluded by the finite-output condition. |
| §6.1 | zero | M=0 has the zero resolution and realization0. |
| §6.1 | shift | For M=Σ^bG_A the constant simplicial object on M is already a resolution with lower bound b. |
| §6.1 | no_uniform_bound | The family Σ^(−n)G_A has no common lower bound; it does not satisfy the hypothesis of the realization theorem for completion. |
| §6.2 | unit_scalar | For a_r=1 all quotient cofibers and Λ_aM are0. |
| §6.2 | zero_scalar | For a single zero scalar the derived quotient is M⊕ΣM; it is not the ordinary quotient M alone. |
| §6.2 | lim_error | For the tower ℤ --2→ ℤ --2→⋯ in degree0, lim=0 and lim¹=ℤ₂/ℤ, so the homotopy limit has π₋₁=ℤ₂/ℤ. The b−1 bound is necessary for general towers. |
| §6.3 | constant | A constant simplicial M gives the identity comparison Λ_aM→Λ_aM. |
| §6.3 | first_layer | A normalized layer in simplicial degree1 contributes ΣM, so a b-connective input produces a (b+1)-connective layer before completion and at least b-connective after completion. |
| §6.3 | uniform | With normalized term Σ^(−n)A in degree n, its suspended layer is A in every degree; the tails never become more connective, so the proof cannot apply. |
| §6.4 | p2 | At p=2, π₀(e_p(𝕊^∧_p)(*))=ℤ₂, and the ambient unit has π₀=ℤ. |
| §6.4 | p3 | At p=3 the same calculation gives ℤ₃, and the unit comparison sends 1 to1; no inversion of 2 or 3 is used. |
| §6.4 | integer_model | For M=N=Hℤ_p the relative solid tensor over Hℤ is Hℤ_p. In contrast H𝔽_p⊗_{Hℤ_p}H𝔽_p has an additional π₁=𝔽_p; absolute sphere tensor and Hℤ-relative tensor remain distinct. |
| §6.4 | characteristic_p | For X=H𝔽_p, X/p^r=X⊕ΣX with transition identity on X and zero on ΣX. The limit is X and the completion unit is its identity, including p=2,3. |
| §7.1 | trivial | For D=all modules, L_D=id and the structure is completed. |
| §7.1 | zero | D={0} is an uncompleted structure for every A, completed exactly when A=0. |
| §7.1 | hom_closure | The full subcategory of perfect Hℤ-modules fails the axioms: a countable coproduct of Hℤ is not perfect. |
| §7.2 | zero_module | 0⊗hat_A N=0 and every completed scalar extension sends0 to0. |
| §7.2 | uncompleted_unit | For D=0 and A=Hℤ, the tensor unit has π₀=0 rather than ℤ. |
| §7.2 | derived_base_change | For trivial structures the base-change comparison is the derived relative tensor, retaining Tor in the square ℤ→𝔽₂←ℤ. |
| §7.3 | zero_scalar | F=∅ and F={0} both give all modules; f=1 adds no condition in Sp■. |
| §7.3 | two_term_sign | For a finite-support null sequence b=e₁ and any discrete scalar f, (1−fσ*)(e₁+fe₀)=e₁. |
| §7.3 | coefficient_changes | For A=Hℚ_p with its topological solid realization and f=1/p, the null sequence b_n=p^n satisfies b_n−f b_(n+1)=0 and b₀=1. Thus A is not F-complete, including p=2,3, and replacing Â_F by A would be false. |
| §7.3 | nilpotent | For A=H(𝔽₂[ε]/ε²) and f=ε, the inverse is 1+εσ* and the reflector is the identity; this tests a nonreduced characteristic-two coefficient ring. |
| §7.4 | finite_measures | For integer-solid measures on a finite set of size2 the free complete module is ℤ²; on ∅ it is0 and on * it isℤ. |
| §7.4 | denominators | For topological E/ℚ_p, (∏_I O_E)[1/p] has uniformly bounded denominators and excludes (p^(−n))_n. Replacing the free complete measure object by an unrestricted product ∏_I E fails. |
| §7.4 | positive_characteristic | Over 𝔽₂, θ preserves the specified animated polynomial input but is not an equivalence onto all commutative H𝔽₂-algebras; the positive group homology witness is retained. |

The stronger right-connectivity of arbitrary scalar-quotient completion was not needed: the explicit b−1 estimate already makes all realization tails tend to infinity, and the split free case has the stronger bound. This is a conservative estimate, not a counterexample to the stronger bound for the scalar tower. The ×2 tower example in §6.2 demonstrates the general countable-limit loss; it is not mislabeled as a split finite-free quotient tower.

## Mechanical validation

The JSON was parsed. Every prerequisite has exactly one of the allowed prefixes mathlib:, tauceti:, roadmap:, target: or gap:. Internal references are to earlier targets, every target has a source key and exact locator, every definition has a nonempty API and at least three tests, and both gap references resolve to gap entries with needs, supplier and section. The README uses only existing pinned Lean names in backticks; planned Lean names occur in the data, not as claims of declarations in a nonexistent Suggested.lean.

The citation resolver found no unknown Lean names. Its one unresolved cross-roadmap lead was:

    - 7: RefinedTraceMethods §6.2: no roadmap RefinedTraceMethods on main or in an open pull request

This is a board-index limitation, not a missing owner: packages/RefinedTraceMethods/README.md at head 87bc3ff was read and its §6.2 located. The resolver also says it did not check external pinned Lake names on its own host; the actual pin statements were read manually at the paths and lines listed above. Neither proposed continuation contract is reported as an already written supplier section.

Dependency check, with candidate packages/SolidAnalyticRings/design/README.md and merge-order/ORDER.txt:

```text
candidate: SolidAnalyticRings is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 233 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order file, cached source text, supplier roadmap or content README was manually edited.
