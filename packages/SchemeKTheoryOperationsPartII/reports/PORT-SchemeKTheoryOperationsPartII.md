# Port: SchemeKTheoryOperationsPartII

Branch: `roadmap/scheme-k-theory-operations-part-ii`.
Head commit: 5c00dc61725a9819501e1ab298f943772f483db6.

## Validation

- Initial checkout: clean, `c994070`, matching the requested base.
- Targeted build: `Build completed successfully (8954 jobs).`
- Warning count: **0**. No admitted theorem is statable on its actual formal carrier at these pins, so the acceptance module contains no declarations and emits no `sorry` warnings.
- Gate: `gate SchemeKTheoryOperationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Signature audit: enumerated every declaration in `Suggested.lean`; there are **0**. Consequently the scratch `#check @name` list is empty, with no elaborated signatures or silently dropped binders to compare. The module itself was elaborated by the requested build. No signature changed.
- Metadata: `topic = "math.AG"`, the single-key form used on main; compared with `TauCetiRoadmap/GrothendieckEulerForms/metadata.toml`.
- Main models read: `TauCetiRoadmap/GrothendieckEulerForms/README.md`, `TauCetiRoadmap/SchubertGeometry/README.md`, and `Completed/Chebotarev/README.md`; the completed integral-lattice roadmap was also consulted.

Dependency-direction output:

```text
depcheck: 195 roadmaps, 1223 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was reported. The original gate run had every content counter at zero and failed only its clean-tree condition on the uncommitted new folder; the final run is recorded below after committing, because the gate explicitly requires an empty `git status --short`.

## Draft pull request body

Build supported coherent and strict-complex K₀ for locally noetherian formal schemes, extending SchemeKTheoryOperations beyond ordinary schemes. The roadmap connects formal support and coherent dévissage to regular comparison, support filtrations, affine rational products, closed-union decomposition and expected-dimension Tor vanishing, then develops derived Euler intersection degrees, Cartier formulas and proper formal pushforward. Its power-annihilation support and stalk-dimension conventions distinguish formal subschemes with the same underlying space and provide the intersection interfaces needed in arithmetic geometry.

AI assistance: Codex performed the port, supplier and ownership checks, mathematical examples and validation.

## Dependencies that remain open roadmaps

- **GeneralAlgebraicKTheory**, §4.8, categorical dévissage.
- **SchemeKTheoryOperations**, §§1.5–1.6, 2.1–2.5, 3.1, 3.4–3.5, 4.4–4.5, 6.1 and 6.12, ordinary-scheme strict/coherent models, supported operations, transfers and filtrations.

AdicSpacesPartII, AdicSpacesPartIII, SchemeAndStackFoundations, JacobianChallenge, GrothendieckEulerForms, DerivedModuleAlgebra and EnhancedDerivedSheaves are cited as they stand on main. Revision/progress pull requests for these existing roadmaps are not dependencies. The proper-formal-coherent-direct-images contract is the accepted conditional supplier gap, described below.

## Port changes and upstream mathematics pass

All 31 subsections, with precise statements, source locators, API lists, worked examples and supplier contracts remain. `Suggested.lean` and `metadata.toml` were preserved byte for byte. Nothing moved from Lean to README: the package already had the correct declaration-free acceptance file, explaining each construction-sized missing carrier. No scalar or full-support substitute was introduced.

The accepted review's notes were checked against the supplied package rather than applied to stale line numbers. Most duplicate Checks were already consolidated. Two remaining repetitions were merged: the standalone dimension-two Check in §0.2 duplicates its one-point-space negative control; the standalone regularity Check in §0.3 duplicates the power-series family. The latter now computes dimensions 1, 2, 3 for 0, 1, 2 variables. Every subsection retains at least three distinct Checks (minimum 3, total 123). A repeated maximal-ideal-testing sentence in §0.3 was also consolidated. The EGA-I locator note was already repaired in the package: §0.7 uses EGA-I line 8186 through 8192 for (10.10.8), while §0.6 uses EGA-I line 8193 through 8199 for (10.10.9). Both windows were opened and verified; no stale 8190–8207 window remains.

The upstream read made these further repairs:

1. Added the exact pinned `Module.support_eq_zeroLocus` supplier for finite-module support, retaining §0.6's distinct comparison with formal coherent support.
2. Replaced the standalone adic-ring maximal-ideal assertion in §0.1 with the pinned `IsAdicComplete.le_jacobson_bot`, and recorded ownership in Scope and ownership. The formal closed-point identification and completion theorem remain.
3. Spelled out the integer-index step in §4.3's graded-dependence proof: replacing negative indices by zero leaves those filtration terms full and only increases the relevant sum. This justifies using §2.4's nonnegative-index theorem without narrowing the numerical statement.
4. Corrected the dependency descriptions for the special numerical formulas: §4.5 uses its finite-support local Tor bound, and §4.6 uses its two-term Cartier complex. Neither route assumes the global regular finite-dimensional hypotheses of §4.3. Section 4.6 now cites §1.2 and §0.7 directly and cites §4.3 only for agreement in its additional scope. Section 4.5 already states that agreement explicitly.
5. Made factorising exponents positive in §§4.1–4.2. At n=0, A/ϖ⁰ is the zero ring, so K′₀(Spec A/ϖ⁰)=0, whereas the thickening identification with ℤ requires n≥1. The degree formula itself still gives 0 correctly at n=0; the Check now states both facts.
6. Recast the accepted proper formal coherent-direct-image gap as a timeless mathematical supplier contract, preserving its exact hypotheses and ML assertion; the gap identifier remains recorded in this report. Lower-cased the title's initial word as requested.

The n=0 instance exposed the missing positivity in the thickening-group identification; it is repaired as above. No further false statement was found in the computed instances below. The package's important restrictions remain: global strict complexes need the resolution property for regular comparison; multiplicativity is rational and affine; no cokernel/limit interchange is asserted; degree requires proper scheme support; the Cartier special formula needs no ambient regularity; general formal pushforward requires EGA properness.

## Supplier resolution and duplication sweep

Library revisions were checked against `lake-manifest.json` and the actual package checkouts: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.

The pinned native definitions were read, including their scope:

| Supplier declaration | Pinned file and line | Content used and boundary |
| --- | --- | --- |
| `ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean:26` | WithBot ℕ∞ dimension; no finite-dimension hypothesis built in. |
| `Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean:35` | Infimum over minimal primes, valued in ℕ∞. |
| `IsRegularLocalRing`, `IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`, line 92 | Localness and noetherianity; regular ring means regular prime localizations, not a uniform finite global dimension. |
| `RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean:146` | Weak regularity plus nonzero final quotient; unit ideals do not define regular sequences on nonzero rings. |
| `IsAdicComplete`, `AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`, line 171 | Completeness includes Hausdorffness; the completion is a module construction, not a formal stalk. |
| `IsAdicComplete.le_jacobson_bot` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:880` | Ideal of definition lies in every maximal ideal; no new theorem of adic rings needed here. |
| `Ideal.jacobson` | `Mathlib/RingTheory/Jacobson/Ideal.lean:65` | Intersection of maximal ideals above an ideal. |
| `Module.support`, `Module.support_eq_zeroLocus` | `Mathlib/RingTheory/Support.lean:47`, line 216 | Nontrivial prime-localized module; support equals the annihilator zero locus under finite generation. This is support in Spec A, not the formal topological space. |
| `Module.length` | `Mathlib/RingTheory/Length.lean:30` | ℕ∞ length, with no implicit finiteness. |
| `Submodule.annihilator` | `Mathlib/RingTheory/Ideal/Maps.lean:951` | Annihilator of the submodule as a module. |
| `Module.Flat`, `Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/Basic.lean:113`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63` | Tensor exactness and faithful flatness; neither is automatic for a quotient map. |
| `Module.Projective`, `Module.Free` | `Mathlib/Algebra/Module/Projective.lean:70`, `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` | Projective and free are distinct; finite projective modules may have varying component ranks. |
| `Module.free_of_flat_of_isLocalRing` | `Mathlib/RingTheory/LocalRing/Module.lean:299` | Requires finite generation as well as flatness and a local ring. |
| `HomologicalComplex` | `Mathlib/Algebra/Homology/HomologicalComplex.lean:59` | Differential and square-zero laws; no boundedness or local freeness built in. |
| `CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44` | Requires monoidal abelian/preadditive category and projective resolutions; not a formal coherent Tor-sheaf carrier. |
| `TauCeti.ExactK0`, `TauCeti.AbelianK0`, `TauCeti.AbelianK0.of` | `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163`, `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:79`, line 94 | Essentially-small category data and actual exact/abelian structures; no duplicate quotient here. |
| `TauCeti.finiteModulesExactStructure`, `TauCeti.finiteProjectiveModulesExactStructure` | `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:219`, line 226 | Finite modules and finite projectives with their exact structures. |
| `TauCeti.cartanMap`, `TauCeti.cartanEquiv`, `TauCeti.cartanMap_bijective` | `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:386`, line 691, line 713 | Full-support module comparison; equivalence/bijectivity carries the explicit finite-projective-resolution hypothesis. |
| `TauCeti.ExactStructure.IsResolving.resolutionEquiv` | `TauCeti/CategoryTheory/GrothendieckGroup/Resolving.lean:308` | Finite resolving-category comparison; not projective lifting for arbitrary vector bundles. |
| `TauCeti.SheafOfModules.tensorProduct` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean:93` | Ordinary sheaf tensor; the derived construction uses the named derived suppliers. |

Every cross-roadmap citation was resolved against main or the indexed head of a new-roadmap pull request. `roadmaps resolve` was rerun with the actual pinned Lake packages and reported no cross-roadmap citations or Lean names found nowhere. The substantive contracts were opened: AdicSpacesPartII §§R0.1a–R0.1b; AdicSpacesPartIII §§F0.1–F0.4, F0.6, F0.8; SchemeAndStackFoundations §§0.7, 0.16–0.18, 2.2, 2.6, 3.3, 4.7–4.10, 4.13, 5.7; JacobianChallenge Layer C; GrothendieckEulerForms Layers 2–3; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §§0.3–0.4, E1.4–E1.6; GeneralAlgebraicKTheory §4.8; and the SchemeKTheoryOperations sections listed above. Scope ownership citations to SchemeKTheoryOperations Layers 4 and 7 were also checked.

The open-head `roadmaps list`, `roadmaps grep` and `roadmaps show` tools were used. Searches by objects included formal coherent modules, Spf/stalks, closed supports, strict supported complexes, Tor sheaves, K₀/G₀, dimension/codimension filtrations, closed-union cokernels, proper formal direct images and Euler intersection degrees. They covered all main roadmaps and the indexed open heads (including the supplied sibling heads); the board packages were independently searched, including their design READMEs. Relevant adjacent owners were read: SchemeKTheoryOperations for ordinary schemes, GeneralAlgebraicKTheory for categorical dévissage, the formal geometry suppliers on main, and the arithmetic/heights, motivic and stable-homotopy consumers. The supplied open heads for StableHomotopyKTheoryPartII, ArithmeticKTheory and MotivicEtaleKTheory develop other carriers. GrossZagierAndArithmeticHeightsPartII consumes this formal supported theory; it does not supply it. GeneralAlgebraicKTheoryPartII's Nil and chromatic material and SchemeAndStackFoundationsPartII's flat-cohomology and formal-patching comparisons do not replace the supported formal K₀ and degree constructions here.

No additional overlapping formal-K₀ target was found to delete. Generic categorical groups, ordinary module support, full-support Cartan comparison, ordinary scheme operations, Koszul complexes, derived tensor, affine formal coherent equivalence and ordinary curve degree remain with their named owners; this is recorded in Scope and ownership rather than as target stubs. The only additional supplier replacement during this port was the adic Jacobson-radical fact; the finite-module support citation was made explicit. No later supplier was introduced, no notion moved down the merge order, and the Lean file introduces no declaration capable of colliding with another roadmap's name.

## Sources and the accepted condition

The legal cached extractions were opened at the actual cited locators: ZHANG21 line 4511 through 4676 (Appendix B); LIZHANG22 line 336 through 372 and line 2942 through 2959; EGA-I line 2849 through 2892 and line 8186 through 8199; EGA-III1 line 4444 through 4507. The Stacks chapter/tag locators were checked against their corresponding cached extractions. Statements are the roadmap's own prose; no source passage was copied into the port.

AdicSpacesPartIII §F0.6's formal-direct-image-comparison applies to the completion of a proper **scheme** map. At the identity of Spec B it supplies affine formal acyclicity: H⁰(Spf B, M^Δ) = M and Hᵠ = 0 for q > 0. It does not state coherence and the inverse-limit/ML comparison for an arbitrary proper formal map. The accepted conditional gap **proper-formal-coherent-direct-images** therefore remains unresolved as a supplier commitment, with precisely the accepted hypotheses: adic proper finite-type map of locally noetherian formal schemes, coherent input, comparison with the ideal-power reductions, and ML on each noetherian target open (EGA-III1 line 4471 through 4507). The Čech uniform bound is derived separately from the imported affine acyclicity. The port does not assert that the gap is implemented or silently enlarge the supplier.

Two source cautions remain correctly accounted for in the mathematics: ZHANG21 line 4520 has the associated-ideal/associated-module misprint, while LIZHANG22 line 370 through 372 describes properness only on reductions. The Spf k⟦t⟧ → Spec k negative control gives global sections k⟦t⟧, an infinite-dimensional k-vector space; EGA properness is required. No fetched passage was treated as an instruction and no suspicious instruction was encountered.

## Computed adversarial mathematics pass

The table covers definitions, theorem clauses and their API laws separately. R denotes ℤ_p⟦t⟧ with maximal-ideal topology, k its residue field unless another field is specified, and K(f) the homological two-term Koszul complex in degrees 1,0. Each row records actual values; examples test a statement's plausibility and conventions, rather than proving its general theorem. The truth and generality audit also followed each proof route through the supplier contracts. No group-action or Frobenius normalization is part of these carriers, so nonabelian-group tests and a q=1 specialization do not apply. Residue characteristics 2 and 3, equal characteristic, inseparability, empty objects, nilpotents and unbounded global dimension are included explicitly.

| Statement | Instances tried and computed values on the two sides | Result | Change |
| --- | --- | --- | --- |
| Convention: formal topology and dimension | R has one open prime m and stalk dimension 2; p-adic ℤ_p⟨t⟩ has points (p) and (p,f), with dimensions 1 and 2. Topological dimension of the first one-point space is 0 ≠ 2. | Separates ring and space dimension. | Preserved. |
| Convention: intersections and unions | In R, (t)+(t−p)=(t,p), quotient k; (t)∩(t−p)=(t(t−p)), quotient dimension 1. Sum gives intersection of dimension 0, intersection gives union of dimension 1. | Directions fixed. | Preserved. |
| Convention: empty values and integer indices | Empty supremum = ⊥; empty codimension infimum = ⊤. At d=2,i=3, d−i=−1, F⁻¹=ℤ=F₃ for full support on Spf R. | No truncated subtraction. | Preserved. |
| Convention: signs and reindexing | K(p) over ℤ_p has H₀=k,H₁=0 and Euler +1; K(p)[1] has Euler −1. Cochain degrees −1,0 yield the same +1; reversing the Euler sign would give −1. | Agrees with DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5. | Preserved. |
| Convention: tensor symmetry | Two degree-one generators interchange by −1; in characteristic 2 this scalar is 1, in characteristic 3 it is 2. Their K₀ classes both have sign −1, so the product class has sign +1 in either order. | Koszul and K₀ commutativity compatible. | Preserved. |
| Convention: length versus curve degree | On P¹_k, χ(O(−2))=0−1=−1; line-bundle degree of O(−2)=(−1)−1=−2. | Different degree notions distinguished. | Preserved. |
| Convention: coefficient scalings | For e=2,f=1, base change of k has length 2=2·1; for e=1,f=2, restriction of k′ has A-length 2=2·1. | e and f not interchanged. | Preserved. |
| Convention: small skeleton and varying ranks | Finite k-spaces k⁰,k¹,k² have classes 0,1,2 in either skeleton. Over A=ℤ_p×ℤ_p, A·(1,0) has rank vector (1,0), not a constant free rank. | Skeleton independence and component rank scope retained. | Preserved. |
| §0.1 completion comparison | R at m: A_m=O_x=completed localization=R, dimension 2 on all three. With I=0,A=k[t],p=(t), the three local rings are k[t]_(t), with maximal completion k⟦t⟧ and dimension 1. | Both completions distinguished. | Replaced generic maximal-ideal assertion by native supplier. |
| §0.1 flat/modulo-I comparison | On p-adic ℤ_p⟨t⟩ at (p), modulo p all three rings are 𝔽_p(t), and modulo p² the maps induce the same localized quotient; residue dimension is 0 while the local rings have dimension 1. | Positive powers and local direction respected. | Preserved. |
| §0.2 local/global dimension definition | R: stalk/global=2/2; A¹_k at generic point: stalk 0, every open neighbourhood dimension 1. Empty X: global ⊥. | Wrong neighbourhood definition excluded. | Consolidated duplicate Check. |
| §0.2 purity | For Spf ℤ_p⟦t₁,…,t_n⟧, n=0,1,2, the unique closed stalk has dimension 1,2,3; the same global dimensions result. Empty X has ⊥, not every natural d. | Nonempty hypothesis matters. | Preserved. |
| §0.2 codimension definition | In R, V(t),V(t−p),V(p,t),V(t(t−p)) give differences 2−1=1,1,2−0=2,1; V(1) gives ⊤. | Ambient finite subtraction coherent. | Preserved. |
| §0.2 scheme/affine compatibility | Spec k[t] has global dimension 1 and generic stalk dimension 0; Spf k⟦t⟧ has global dimension 1. Both agree with coordinate-ring dimension 1. | Actual stalks used. | Preserved. |
| §0.2 monotonicity | V(p,t)⊆V(t)⊆X gives codimensions 2≥1≥0; ∅⊆V(p,t) gives ⊤≥2. | Both directions of inclusion ordered correctly. | Preserved. |
| §0.3 regular/CM definitions | k⟦x,y⟧/(xy): dimension 1, depth 1, embedding dimension 2; CM true, regular false. Union of two planes in four-space: dimension 2, depth 1; CM false. | Wrong identification of CM with regular excluded. | Consolidated duplicate regular-family Check. |
| §0.3 affine criterion | ℤ_p has regular maximal localization of dimension 1; dual numbers have maximal localization of dimension 0 and cotangent dimension 1, so regularity false on both Spec and Spf. Zero ring has no stalks. | Both directions and empty case retained. | Preserved. |
| §0.3 regular implies CM/domain; restriction | k⟦x,y⟧ has depth=dimension=2 and xy≠0; its localization at (x) has depth=dimension=1. Node has xy=0 and is not regular. | Localisation and domain consequences compatible. | Preserved. |
| §0.4 CM codimension/height | In R, ht(t)=1=2−1; ht(p,t)=2=2−0. For non-CM k⟦x,y,z⟧/(xz,yz), V(x,y) has height 0 but local dimension drop 2−1=1. | CM hypothesis separates values. | Preserved. |
| §0.4 pure-dimensional formula | Pure d=2 R: dim V(t)=1 gives 2−1=1; X itself gives 2−2=0. Empty support has ⊤, outside this finite subtraction. | Nonempty support explicit. | Preserved. |
| §0.5 regular immersion predicate | Identity on nonempty R: empty sequence, length/codim 0. V(t²): nonzerodivisor, length/codim 1, quotient nonreduced. Node closed point: 2 generators, depth 1, not regular. | Tests both inclusion directions. | Preserved. |
| §0.5 conormal rank/local constancy | For V(t²), (t²)/(t⁴) is free of rank 1 over R/(t²), matching codimension 1. Identity has conormal 0, rank 0. | Rank is not number of components. | Preserved. |
| §0.5 Cartier criterion | t−p and t² are nonzerodivisors: ideals free rank 1. In the node, x has annihilator (y), so (x) is not an invertible ideal. Empty divisor has ideal O and zero quotient. | Nonreduced Cartier and zero-divisor non-example. | Preserved. |
| §0.5 regular-to-regular immersion and affine maximal test | V(t) in R: source ℤ_p and target R regular; one equation gives rank 1. Identity gives 0 equations. At a maximal ideal outside V(t), the ideal is 1, so no source stalk is tested. | Unit-ideal case not misclassified as a regular sequence. | Preserved. |
| §0.5 Koszul resolution | K(t²) has H₀=R/(t²), H₁=0; K(0) has H₀=H₁=R. | Nonzerodivisor condition needed. | Preserved. |
| §0.6 formal-support predicate | On Spf ℤ_p, p² kills ℤ_p/p² but no pⁿ kills ℤ_p. Both have the same one-point topological support. | Zero-map/topological models excluded. | Preserved. |
| §0.6 inverse-image ideal definition | At i:Spec k→Spf ℤ_p, i*(p)≅k but its image in O=k is 0. Thus i⁻¹V(p)=Spec k, not V(k)=∅. | Image, not raw pullback, is the ideal. | Preserved. |
| §0.6 identities, composition and support pullback | Pull V(p²) from Spf ℤ_p to Spf R and then to V(t): ideals p²R and p²ℤ_p, same as direct pullback. Pull ℤ_p/p² to R: p² kills R/p². Identity leaves p². | Sources and targets and power laws agree. | Preserved. |
| §0.6 flatness and exactness | ℤ_p→R is flat; the injection p stays injective. ℤ_p→k takes that injection to 0:k→k, with kernel k. | Nonflat quotient excluded. | Preserved. |
| §0.6 Serre closure | 0→k→ℤ_p/p²→k→0 has p killing each end and p² killing the middle; subobjects and quotients have exponent at most 2. | Extension exponent adds. | Preserved. |
| §0.6 affine support criterion | M=R/(t²): annihilator (t²), support V(t), and t²M=0. M=R has annihilator 0, support Spec R and tⁿM≠0. | Finite-module equivalence agrees with native support. | Added exact native support supplier. |
| §0.6 enlargement and radical independence | (t²)⊆(t); M=R/t is killed by either ideal. M=R/t³ is killed by (t)³ and (t²)², but not by t². | Exponent may change, subcategory does not. | Preserved. |
| §0.6 tensor support | (R/t)⊗(R/(t−p))=k, killed by (t,p); R⊗R=R, killed by ideal 0. | Intersection is the sum ideal. | Preserved. |
| §0.6 closed pushforward and endpoints | ℤ_p/p³ pushed from V(p³) is p-power-supported. J=0 supports all M; J=1 supports only 0. At exponent 0, R/J⁰=0. | Positive powers and empty/full supports tested. | Preserved. |
| §0.7 formal Tor definition/affine/stalk comparison | Over R, Tor₀(R/t,R/(t−p))=k, Tor₁=0; at the closed formal stalk the same modules result. | Gluing respects actual coefficient ring. | Preserved. |
| §0.7 degree zero, symmetry and functoriality | Tor₀(R²,k)=k²=Tor₀(k,R²); map 2:R→R induces 2:k→k, zero at p=2 and nonzero at p=3. | Functor remembers coefficient maps. | Preserved. |
| §0.7 long exact sequence | Tensor 0→ℤ_p —p→ ℤ_p→k→0 with k: connecting Tor₁(k,k)→k is an isomorphism, then p:k→k is 0. | Positive Tor cannot be discarded. | Preserved. |
| §0.7 support and finite bound | Tor₀(k,k)=Tor₁(k,k)=k over ℤ_p, all Tor≥2 zero; support V(p) in either degree. Over the reduction k, positive Tor is 0. | Ambient-ring convention fixed. | Preserved. |
| §0.7 locally free input | Tor₀(R²,k)=k²; Torⱼ(R²,k)=0 for j>0; zero free module gives all 0. | Bound 0 agrees with free rank. | Preserved. |
| §0.7 singular infinite amplitude | For B=k[ε]/ε², the ε-resolution tensored with k has all differentials 0, giving Torⱼ(k,k)=k for every j≥0. | No finite alternating class claimed. | Preserved. |
| §1.1 coherent K′₀ definition/additivity | On Spf ℤ_p, [ℤ_p]=[ℤ_p]+[k] gives [k]=0; over dual numbers [B]=2[k], and [k]=1. | Rank and length groups distinguished. | Preserved. |
| §1.1 restriction, closed pushforward and flat pullback | Closed k→Spf ℤ_p sends 1 to 0; flat ℤ_p→R sends [O]=1 to 1. Identity restriction fixes 1. | Maps have the specified variance. | Preserved. |
| §1.1 affine and scheme comparisons | Spf k=Spec k has K′₀=ℤ, [k²]=2; node has ℤ², [O]=(1,1), [k]=0. | Affine group is supplied G₀, not a new quotient. | Preserved. |
| §1.1 universal property | Dimension on finite k-spaces gives 0↦0, k↦1, k²↦2; the unique group homomorphism is n↦n. Choosing value 3 on k gives n↦3n. | Additive invariant determines all values. | Preserved. |
| §1.1 extensionality and induction | Homomorphisms ℤ→ℤ agreeing at 1 both give 2 at 2 and −1 at −1; the subgroup containing 1 is ℤ, whereas 2ℤ omits 1. | Generators and negatives necessary. | Preserved. |
| §1.2 coherent dévissage and nilpotent invariance | ℤ_p/pⁿ gives n[k] at n=0,1,2: 0,1,2. Dual-number O gives 2[k], underived restriction only 1[k]. Empty support gives group 0. | Correct inverse uses a filtration. | Preserved. |
| §1.3 strict supported category | K(p) on Spf ℤ_p has supported H₀=k; K(0) has H₀=H₁=ℤ_p, not p-power-supported. K(1) is exact with empty support. | Formal support excludes the wrong topological category. | Preserved. |
| §1.3 closure under shift/cone/sum/extension | K(p) shifted has H₁=k; cone(id K(p)) has zero homology; K(p)⊕K(p) has H₀=k². Split extension has that same H₀. | All stay p-power-supported. | Preserved. |
| §1.3 tensor support | K(t)⊗K(t−p)=K(t,t−p), H₀=k,H_{>0}=0. K(t)⊗K(t) has H₀=H₁=ℤ_p. | Both use the appropriate intersection support. | Preserved. |
| §1.3 arbitrary pullback | Pull K(p) to k: differential 0 and H₀=H₁=k, still strict with full source support. Identity pullback keeps differential p. | Pullback need not be exact on homology. | Preserved. |
| §1.3 locally free iff finite projective | Over ℤ_p, O is free and k is not flat. Over ℤ_p×ℤ_p, M=ℤ_p×0 is projective with ranks (1,0), but no constant free rank. | Projective is required, not free. | Preserved. |
| §1.3 Koszul support without regularity | K(0) has H₀=H₁=A, annihilated by ideal (0); K(1) has no homology. Over dual numbers K(ε) has H₀=k,H₁=(ε)≅k, both killed by ε. | Support does not assert a resolution. | Preserved. |
| §1.4 strict group relations | K(1) has class 0; [E[1]]=−[E] with E=k[0] gives −1. Cone(0:k→k) has class 1−1=0. | Quasi-isomorphism and Euler signs retained. | Preserved. |
| §1.4 degreewise exact-sequence relation | P¹ Euler sequence gives [O(1)]=2−L with L=[O(−1)]; multiplying by L gives 1=2L−L², so (1−L)²=0. | Non-split global relation matters. | Preserved. |
| §1.4 supported maps and endpoints | K(p) has supported class 1, enlargement to full Spf ℤ_p sends it to 0; empty supported group is 0. Identity and identity composition fix 1. | Support maps need not be injective. | Preserved. |
| §1.4 ring/module structure | Spf k has product 2·3=6, unit 1; empty support module is 0 with 1·0=0. P¹ has h²=0 although h≠0. | Unit excludes zero product. | Preserved. |
| §1.4 universal property/generator induction | On Spf k, alternating rank takes k[0]↦1 and k[1]↦−1. Any allowed invariant with value c on k has value 2c on k² and −c on k[1]. | Both defining relations constrain the map. | Preserved. |
| §1.5 affine transport | A=R,J=m: Koszul (p,t) gives generator 1↔1 of ℤ↔ℤ. J=A: 0↔0. A=k,J=0: ℤ↔ℤ. | Arbitrary closed support, not just full support. | Preserved. |
| §1.5 product/enlargement/filtration compatibility | In k⟦t⟧, K(t) maps 1↔1 with support (t), then 0↔0 in full support. In R, ht(m)=2 equals formal codimension 2. | Marked maps, not abstract isomorphisms only. | Preserved. |
| §1.6 homology homomorphism | K(p) gives [k]=1 in point support; shift gives −1; empty group gives 0→0. | Finite Euler formula and its signs. | Preserved. |
| §1.6 naturality | Enlarging support sends h(K(p))=1 to [k]=0; h of enlarged K(p) is rank 1−1=0. Flat pullback ℤ_p→R gives the same [R/p]. | Commuting square has value 0 on both paths. | Preserved. |
| §1.6 full-support Cartan comparison | Dual numbers: h([B])=2[k], so ℤ→ℤ is ×2. Node: ℤ→ℤ² sends 1 to (1,1), missing (1,0). | Regularity cannot be dropped. | Preserved. |
| §1.6 regular-sequence classes | K(p,t) on R has H₀=k,H₁=H₂=0, so maps to 1. Nonregular K(t,t) has H₀=H₁=R/t and maps to 0. | Quotient formula needs regularity. | Preserved. |
| §1.7 cup definition/biadditivity | On Spf k, ranks (1+2)·3=9=3+6. On R, K(t)∪K(t−p) gives [k]=1 with point support. | Tensor is descended in both variables. | Preserved. |
| §1.7 associativity/symmetry/unit | Free ranks 2,3,4 give (2·3)·4=24=2·(3·4); 2·3=6=3·2; 1·2=2 and 0·2=0. | Wrong zero/rescaled product excluded. | Preserved. |
| §1.7 derived versus homology tensor | K(t) self-product has Tor₀=Tor₁=R/t, class 1−1=0, while ordinary tensor of homologies has class 1. | Derived operation essential. | Preserved. |
| §1.7 pullback/restriction/affine compatibility | Pull K(p)∪[O²] to k: 2[k]−2[k]=0; cup of the pulled complexes has the same 0. On P¹, [O(1)]·[O(−1)]=1. | Pullback is multiplicative, even nonflat. | Preserved. |
| §1.8 coherent Tor pairing | In R, O_{V(t)}·ᴸO_{V(t−p)}=[k]=1. Self-intersection of V(t) has 1−1=0. P² transverse lines give point class 1. | Pairing retains Tor and geometric support. | Preserved. |
| §1.8 associativity/symmetry/unit | O²,O³,k yield 6[k] in either bracketing; switching O² and k gives 2[k]; O gives 1[k]. | Global identities have consistent finite local values. | Preserved. |
| §1.8 cup/homology and enlargement | K(t),K(t−p) give h(cup)=1=Tor pairing. Enlarge point support to V(t): 1↦[k]=0 on each side. | Support and Cartan maps agree. | Preserved. |
| §1.8 generation by coherent pairs | At Spec k, a biadditive map with value c at (k,k) gives 6c at (k²,k³) and −2c at (−[k],k²). | Values on generators determine pairing. | Preserved. |
| §2.1 regular supported comparison | R,m: h:ℤ→ℤ takes Koszul generator 1 to 1. Field full support gives 1→1, empty support 0→0. Node gives diagonal ℤ→ℤ², not onto. | Hypotheses separate counterexample. | Preserved. |
| §2.1 resolutions and open invariance | R/m has resolution ranks 1,2,1 of length 2, supported Euler generator 1. On P¹ with Y a rational point and U=A¹ containing it, both supported groups are ℤ and h sends the point class to 1. | Resolution property is explicit, not projectivity of vector bundles. | Preserved. |
| §2.2 codimension filtration definition | R,Y=m: F⁰=F¹=F²=ℤ, F³=0. R,Y=V(t): F¹=ℤ, F²=0 because [k]=0 in G₀(ℤ_p). | Ambient codimension, not support-relative dimension. | Preserved. |
| §2.2 descending filtration/endpoints | At Spec k: F⁻¹=F⁰=ℤ, F¹=0; empty X gives every term 0. At R,m, F³=0⊆F²=ℤ. | All index endpoints defined. | Preserved. |
| §2.2 support enlargement | Point support in R has F²=ℤ; enlarging to V(t) gives F²=0, via 1↦[k]=0. | Preserved filtration does not mean injection. | Preserved. |
| §2.2 graded/rational group definition | For R,V(t), Gr¹=ℤ/0=ℤ and rational Gr¹=ℚ; Gr²=0/0=0. Spec k gives Gr⁰=ℤ. | Quotient orientation fixed. | Preserved. |
| §2.2 dimension filtration | Spf ℤ_p: F₋₁=0,F₀=0,F₁=ℤ; Spec k: F₋₁=0,F₀=ℤ. | A point-support class can vanish after pushforward. | Preserved. |
| §2.2 directed supports/affine comparison | In R, union of V(t) and V(t−p) has quotient dimension max(1,1)=1 and codimension min(1,1)=1; both map identically under Spec/Spf transport. | Union supports stay in the same bound. | Preserved. |
| §2.2 P² worked filtration | K₀(P²)=ℤ[h]/h³: F¹=ℤh+ℤh²,F²=ℤh²,F³=0. Degree e=0,1,2 curves give 0,h,2h−h². | Natural binomial expression agrees at zero. | Preserved. |
| §2.3 filtration comparison | R,d=2,Y=V(t): i=1 gives ℤ↔ℤ; i=0 gives 0↔0; i=−1 gives 0↔0; i=3 gives full ℤ↔ℤ with d−i=−1. | Integer and empty bounds agree. | Preserved. |
| §2.3 graded comparison | Spec k,d=0: Gr⁰=ℤ=Gr₀. Empty X: all quotients 0 without assigning a pure finite d. | Quotient/emptiness conventions compatible. | Preserved. |
| §2.4 rational multiplicativity | In ℤ_p⟦t,u⟧, K(t)∪K(tu)≅K(t,0), class 0∈F² despite codimension-one intersection; K(t)∪K(u)=K(t,u)∈F² with codimension 2. | Excess and proper intersections tested. | Preserved. |
| §2.4 zero-dimensional endpoint | At field k,a=b=0: ℚ·ℚ⊆ℚ; a=1,b=0 gives 0·ℚ=0. | No integral or non-affine extension inferred. | Preserved. |
| §2.5 exhaustion/limit definitions | Disjoint union of countably many Spf ℤ_p: stage N has ℤ^N, limit ∏ℤ contains (1,1,…); direct sum does not. One-member exhaustion yields ℤ. | Restriction inverse limit, not direct sum. | Preserved. |
| §2.5 independence/projections | Enumerating components in order or swapping the first two coordinates gives limits identified by that coordinate permutation: (1,2,3,…)↦(2,1,3,…). Projection to the original first component still gives 1. | Canonical marking preserved. | Preserved. |
| §2.5 operations/pullback on limits | Componentwise rank sequences (1,2,…) and (2,2,…) multiply to (2,4,…); restriction to the first two pieces gives (2,4) either before or after multiplication. | Compatible members suffice. | Preserved. |
| §2.5 compact-support stabilisation | Support in one component gives ℤ at every stage containing it; the transition on its generator is 1↦1, with limit ℤ. The unsupported limit remains ∏ℤ. | Compact support is not the whole product. | Preserved. |
| §2.5 limit graded definition/boundary | Constant field exhaustion has lim F⁰=ℤ,lim F¹=0 and quotient ℤ. General quotient/limit commutation is not stated; the constant instance alone has both quotients ℤ. | No stronger interchange inferred. | Preserved. |
| §2.5 not a thickening limit | On Spf ℤ_p, [k]=0 in full G₀. Each G₀(ℤ/pⁿ), n≥1, is ℤ by length with [k]=1; pushforward between thickenings sends 1↦1, but into G₀(ℤ_p) sends 1↦0. | Abstract ℤ≅ℤ cannot identify marked theories. | Preserved. |
| §3.1 closed-union decomposition | Node: overlap ℤ maps 1↦0 into each branch ℤ; total cokernel and sum of component cokernels are ℤ², [O]↦(1,1). | Cokernels, not injective-subgroup quotients. | Preserved. |
| §3.1 tensor defect/overlap support | For B=k⟦x,y⟧/(xy), Tor₁^B(B/(x),B/(y))=0; Tor₁^B(k,B/(x))=k supported at (x,y). Component restriction of k remains k and is zero modulo overlap classes. | Tensor can descend only after quotienting the defect. | Preserved. |
| §3.1 inverse/degenerate unions/limits | Disjoint points: (a,b)↦a+b in ℤ² is inverse to coordinate restriction; X₁=X₂=X gives all cokernels 0. Constant exhaustion gives lim 0=0 or lim ℤ²=ℤ². | No limit/cokernel swap used. | Preserved. |
| §3.2 expected-dimension Tor vanishing | In R, t and t−p give codimensions 1+1=2 and intersection quotient k; positive Tor=0. Self t,t has codimension 1≠2 and Tor₁=ℤ_p≠0. | Dimension condition separates failure. | Preserved. |
| §3.2 CM necessity | Union of two planes in k⟦x,y,z,w⟧ with diagonal equations x−z,y−w: expected codim 2+2=4, Tor₀ length 3, Tor₁ length 1, Tor₂=0, Euler 3−1=2. Depth of the union is 1<2. | Dropping CM gives nonzero higher Tor. | Preserved. |
| §3.2 induced regular immersion and zero-rank case | On V(t−p)≅Spf ℤ_p, pulled equation t=p is a nonzerodivisor of codimension 1. Identity Z₁=X has rank 0 and Tor_{>0}(O_X,O_{Z₂})=0. | Rank-zero and transversal cases covered. | Preserved. |
| §3.3 componentwise vanishing | Y′=∅: support condition forces positive Tor=0, recovering §3.2. In k⟦x,y,z⟧, ideal (xy,xz) has 2 generators and height 1, so it is outside the regular-immersion hypothesis. | Full support criterion used on Spec of stalk. | Preserved. |
| §3.3 formal overlap/cokernel | In ℤ_p⟦s,t⟧, Y=V(s,t),Y′=V(s,t−p) share one formal point, but overlap ideal is (s,t,p) and quotient k; its class maps 1↦0 in G₀(Spf ℤ_p)=ℤ. | A formal topological complement would be empty and miss the distinction. | Preserved. |
| §3.3 actual proper component example | In R, Z₁=V(t(t−p)),Z₂=X,Y=V(t),Y′=V(t−p): codim Y=1=codim Z₁+0. Tor_{>0}(O_{Z₁},O_X)=0; Y component is [O_Y]=1 mod image[k]=0. | Structure-sheaf component and overlap quotient agree. | Preserved. |
| §3.4 Cartier pullback | Identity preserves t and has Tor₁=0. Pull to V(p): t stays nonzero in k⟦t⟧ and gives [k]=1, despite nonflatness. | Flatness is not the necessary hypothesis. | Preserved. |
| §3.4 correction without Cartier hypothesis | Self-inclusion V(t) gives [ℤ_p→₀ℤ_p], H₀=H₁=ℤ_p and class 1−1=0. Tor₁ is O_D(−D), not 0. | Actual pulled line bundle used. | Preserved. |
| §4.1 factorisation and finiteness | Spec A/ϖ³ factors at n=3, not n=2; H⁰ has A-length 3. P¹_k factors at n=1 with H⁰=k,H¹=0. A¹_k also factors but H⁰=k[t] has infinite length. | Properness needed in addition to factorisation. | Preserved. |
| §4.1 proper formal versus scheme | Spf A has H⁰=A of length ∞, while Spec A/ϖⁿ has H⁰ length n. Spec Frac A has no map to Spf A: a nonzero ϖ never becomes nilpotent in its discrete field. | Scheme and continuity hypotheses matter. | Preserved. |
| §4.2 Euler-degree definition | Spec A/ϖⁿ: degrees n=0,1,2 give 0,1,2; the K′₀ groups are 0,ℤ,ℤ, so the ℤ identification requires n≥1. P¹_k with m=−2,−1,0,1 has H⁰ dimensions 0,0,1,2, H¹ dimensions 1,0,0,0 and degrees −1,0,1,2=m+1. | Finite signed sum; n=0 exposes wrong group identification. | Required n≥1 for factorising thickening and ℤ identification; retained degree-zero Check. |
| §4.2 additivity/thickening independence | 0→k→A/ϖ²→k→0 gives 2=1+1. Reading A/ϖ² over A/ϖ² or A/ϖ³ leaves A-length 2. | Degree independent of presentation. | Preserved. |
| §4.2 closed pushforward | Spec k′→a proper k-curve, [k′:k]=2: the point sheaf has Euler degree 2 before and after closed pushforward. Empty scheme has degree 0. | Residue degree is retained. | Preserved. |
| §4.2 power-supported extension | A/ϖ² formally supported on V(ϖ) has dévissage class 2[k], degree 2; it is not itself a k-module, since ϖ acts nontrivially. | Ill-typed underived restriction avoided. | Preserved. |
| §4.3 derived Euler pairing | In R, V(t),V(t−pⁿ), n=0,1,2: quotient is 0,k,A/p², Tor₁=0, Euler 0,1,2=n. Self V(t) has formal support Spf A and lengths ∞, so no numerical value is assigned. | Degenerate n=0 and self-support distinguished. | Preserved. |
| §4.3 biadditivity/symmetry/cup comparison | Free ranks 2,3 paired on a proper point give length 6 in either order; sum ranks 1+2 against k gives 3=1+2. Koszul cup for t,t−p gives degree 1=Tor degree 1. | Zero or rescaled pairing excluded. | Preserved. |
| §4.3 finite neighbourhood and Tor-independent case | Two transverse divisors have only T₀=k; all higher coherent cohomology is 0 and degree is 1. Restricting to a noetherian neighbourhood of that point leaves the double sum 1. | Global cohomology support correctly located. | Preserved. |
| §4.3 power-support ambient Euler agreement | X=Spf A,F=A/ϖ²,G=O: ambient H⁰ has length 2, dévissage gives 2[k], same degree 2. | Uses compatible A-map on the ambient space. | Preserved. |
| §4.3 dependence on graded images | R,d=2: replacing the class of V(t) by it plus a point-support class changes pairing with V(t−p) by 1−1=0. For integer indices −1 and 3, F⁻¹ is full and F³=0; replacing −1 by 0 keeps full and raises sum from 2 to 3. | Integer-index extension of affine theorem justified. | Added explicit proof step. |
| §4.4 proper functoriality | P¹_k→Spec k sends [O(m)] to m+1, so degrees m=−2,−1,0,1 are −1,0,1,2 on either side. Identity gives n=n on A/ϖⁿ. | Leray sign agrees. | Preserved. |
| §4.4 finite restriction of scalars | Unramified residue degree f=2: length_A k′=2=2·length_A′ k′. In equal characteristic k=𝔽_p(u), k′=k(u^{1/p}), f=p,e=1: values 2 and 3 for p=2 and 3, despite inseparability. | No separability restriction introduced. | Preserved. |
| §4.4 flat base change | Ramified e=2: k⊗A′=A′/ϖ_A A′ has A′-length 2=2·1. Infinite unramified residue extension has e=1, giving 1=1·1. | Flat scaling uses e, not residue degree. | Preserved. |
| §4.5 length-times-rank identity | F=k,G=R/t: Tor₀=Tor₁=k, Euler 1−1=0=1·1·rank(R/t). G=R gives 1=1·1·1. Residue degree 2 and G free ranks 0,1,2 give 0,2,4 on both sides. | Rank taken over the regular local domain. | Corrected direct prerequisites. |
| §4.5 positive-codimension vanishing/Gr⁰ | R/t has generic rank 0; pairing with k is 0, whereas G=R has rank 1 and value 1. Thus the zero-dimensional functional kills F¹ but not the O-class in F⁰. | Nontrivial quotient functional. | Preserved. |
| §4.5 no global-dimension bound | Disjoint union of Spf ℤ_p⟦t₁,…,t_n⟧ has dimensions n+1 unbounded. F=k on n=2 component: G=O gives 1; G=O/(t₁) there gives 1−1=0, with local bound 3 sufficient. | Special route does not need §4.3's finite global dimension. | Removed that prerequisite. |
| §4.6 two-term Cartier formula | F=k on singular Spf(ℤ_p⟦x,y⟧/(xy)), D=V(p): pulled differential 0, Tor₀=Tor₁=k, Euler 0=degree F−degree F(−D)=1−1. | Ambient regularity unnecessary. | Direct Cartier/Tor prerequisites stated. |
| §4.6 curve degree and sign | Zero section of O(a) over P¹ completed along special zero section: O_X(D) restricted to C is O(a). At a=−1,0,1, χ(O_C)−χ(O_C(−a))=1−(1−a)=−1,0,1=degree O(a). | Works even with C contained in D. | Preserved. |
| §4.6 proper transverse curve intersection | D meeting C in r rational points, r=0,1,2: Tor₀ has length r,Tor₁=0, so Euler r=degree O_C(D). | Orientation is positive for effective transverse intersections. | Preserved. |
| §4.7 pushforward definition/cohomological bound | Identity on affine Spf B: R⁰=F,R^{q>0}=0. Cover by N affine opens gives Čech degrees 0…N−1; N=2 on formal P¹ with O(−2) has H¹=A≠0 and H^{≥2}=0. | Uniform finite bound is separate from coherence. | Preserved accepted supplier condition. |
| §4.7 composition/closed support/degree | Closed point to P¹_k to Spf A: each composite sends its degree 1 class to 1; closed direct image has no higher terms. Identity maps give a↦a on both sides. | Composition and supported degree agree. | Preserved. |
| §4.7 projection formula | Finite flat t↦s²: for a=k at (p,t),b=O, Lp*a=k⟦s⟧/(s²), length 2; p_*b is free rank 2, so a·p_*b=2[k], also degree 2. For identity and b=k,a=O² both sides 2[k]. | Actual regular perfect input supplies finite Tor. | Preserved. |
| §4.7 finite flat scaling | Degrees d=0,1,2 with empty source, identity, t↦s² give 0,1,2=d·1 on a point class. For t↦s² in characteristic 2 the extension is inseparable, still free on 1,s and degree 2. | No good-prime restriction. | Preserved. |
| §4.7 proper-reduction negative control | Spf k⟦t⟧→Spec k has point→point reduction, but H⁰(O)=k⟦t⟧ with independent 1,t,t²,…, hence infinite k-dimension. It is not adic finite type. | Weak properness convention refuted. | Preserved. |
| Supplier: affine formal acyclicity | B=k⟦t⟧,M=B/t²: identity-completion comparison gives H⁰=M of length 2 and H¹=0. B=0 gives every group 0; J=0 gives ordinary scheme acyclicity. | Correct use of AdicSpacesPartIII §F0.6. | Gap not enlarged to include acyclicity. |
| Supplier: arbitrary formal direct-image condition | Identity gives R⁰=F,R^{>0}=0; formal P¹ with O(−2) has H¹=A, showing nontrivial coherent higher image, while affine N=1 has bound q≥1. | Does not establish arbitrary-map coherence from algebraic completion alone. | Explicit unresolved accepted supplier contract. |

## Unresolved items

The accepted supplier gap **proper-formal-coherent-direct-images** remains the sole conditional item. There is no unresolved build, gate, citation, dependency-order, Lean-signature or ownership finding. The absence of headline signatures is intentional and documented, rather than an unresolved elaboration error. No branch was pushed and no pull request, issue or comment was created or edited.


Pull request: #1741 (roadmap/scheme-k-theory-operations-part-ii at 5c00dc6)
