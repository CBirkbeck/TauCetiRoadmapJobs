# Package report: SchemeKTheoryOperationsPartII

The package expands all 31 accepted targets into five layers in `packages/SchemeKTheoryOperationsPartII/README.md`. Its API bullets and Checks are mathematical prose. No prospective formal declaration is claimed in backticks. The generation skeleton was made from each node's statement, hypotheses, route, acceptance tests, prerequisites and source locators before the prose expansion.

The separate `packages/SchemeKTheoryOperationsPartII/design/review.json` and previous review reports were absent. The accepted review embedded in `design/plan.json` supplies the 31 target-level verdicts; its notes were verified against the design, source text and suppliers. Only the top-level gaps value in that plan was edited.

## Headline theorem inventory

The following inventory determined the acceptance file. Every item is **not statable at the pins**; there are no Lean theorem names to report.

| Headline theorem | README | Missing carrier or interface |
| --- | --- | --- |
| Formal stalk/completion and codimension comparison | §§0.1–0.4 | Locally ringed formal schemes, stalks of Spf and coherent closed immersions |
| Formal coherent supported dévissage and affine transport | §§1.2, 1.5 | Formal coherent category, power-supported subcategory and strict supported complexes |
| Regular supported comparison | §2.1 | Formal strict supported K₀ and its homology map |
| Dimension/codimension filtration comparison | §2.3 | Formal groups and their support filtrations |
| Rational affine multiplicativity | §2.4 | Strict K₀ with arbitrary closed support; unrestricted module K₀ does not state it |
| Closed-union decomposition | §3.1 | Coherent formal K₀, overlap pushforwards/cokernels and their exhaustion systems |
| Expected-dimension Tor vanishing | §3.2 | Formal regular immersion, coherent Tor sheaves and formal stalk dimension |
| Componentwise expected-dimension vanishing | §3.3 | The same carriers plus formal overlap support and its cokernel |
| Cartier pullback | §3.4 | Formal Cartier divisors and their strict supported classes |
| Derived Euler pairing and degree base change | §§4.2–4.4 | Proper scheme support over a formal base, supported formal Tor pairing and Euler degree |
| Zero-dimensional length-times-rank formula | §4.5 | Formal ambient derived Euler pairing on actual proper finite supports |
| Cartier-divisor degree formula | §4.6 | Formal ambient Cartier class and derived Euler intersection pairing |
| Proper formal pushforward and projection formula | §4.7 | Formal proper morphisms, coherent direct images and supported coherent K₀ |

A search for whole-word formal-scheme and strict-supported carriers in both pinned source trees had no matches: FormalScheme, Spf, CohSupp, StrictSuppComplex, K0Supp. The tower carrier planned by SchemeAndStackFoundations and the formal carrier planned by AdicSpacesPartIII are roadmap interfaces, not pinned library declarations. Constructing them is substantial mathematics. Encoding them afresh in the acceptance file, or replacing arbitrary supported K₀ by full-support module K₀, would violate the acceptance-test contract. Consequently `Suggested.lean` has only `import Mathlib`, the required module docstring, and the roadmap namespace.

## Corrections and unsupported claims

1. All formal-carrier supplier references were resolved to AdicSpacesPartIII §§F0.1–F0.8, while the adic-ring inputs remain AdicSpacesPartII §§R0.1a–R0.1b. The design's F0 references to Part II do not identify the present owner.
2. The general proper formal coherent-direct-image gap is recorded on AdicSpacesPartIII F0.6. Its stated completion comparison applies to completions of algebraic proper maps, not arbitrary proper formal maps. EGA III₁ (3.4.3) makes a global ML assertion for a noetherian target; the contract states it on every noetherian target open when the target is only locally noetherian (EGA-III1 lines 4492–4494).
3. The filtration indices are integers. This makes F^{d−i} meaningful for i outside [0,d] without truncated natural subtraction. The catalogue's repeated dimension-filtration text under codimension labels was replaced by the actual support-enlargement and codimension-membership facts.
4. Purity of a fixed finite dimension is used on nonempty noetherian X. The empty case is treated by its zero groups and dimension ⊥, rather than concluding dim ∅ = d from a vacuous closed-point predicate.
5. The affine regular-immersion criterion tests maximal ideals containing the defining ideal. At a maximal ideal outside the source the ideal is a unit ideal, whose quotient is zero and which cannot satisfy the native regular-sequence predicate. The immersion condition there is vacuous.
6. A perfect input on a non-quasi-compact formal scheme need not have a uniform Tor-amplitude interval. The global Euler-class clause now requires such an interval explicitly; the exhaustion construction only needs a bound on each member.
7. The strict/full-support affine comparison for general noetherian A uses the parent's resolution-property strict model; the parent §6.12 comparison is only invoked with its regular finite-dimensional hypotheses. No regularity hypothesis is silently imported into the definition of formal K₀.
8. The hypothetical degreewise complex-group Check is instantiated at Spf k. Its nonzero (1,1) class would be false for an empty formal scheme with zero group.
9. The Cartier pullback correction uses the actual line bundle g*O(−D) when the inverse-image ideal is not Cartier; writing it as O(−g⁻¹D) in that case would assume the conclusion. The self-inclusion retains Tor₁ = O_D(−D).
10. The general ringed projection *transformation* is consumed from EnhancedDerivedSheaves §§0.4, E1.4. Invertibility with locally perfect first input is proved in the formal §4.7 application. The supplier does not explicitly state a general perfect projection isomorphism on formal schemes.
11. The projective-line degree Check uses its structure morphism P¹_k → Spf A, not an impossible closed embedding into the base. The self-Cartier nonzero-Tor Check specifies nonempty D, and the restricted-power-series maximal-ideal Check specifies an irreducible nonconstant residue polynomial.
12. The Cartier two-term Euler identity is stated on any locally noetherian formal X over A, as allowed by the accepted hypothesis note: the Cartier input itself has Tor amplitude [0,1]. Its comparison with the general pairing retains §4.3’s hypotheses. On the singular node over ℤ_p with D=V(p) and F=k, both sides are 1−1=0.
13. Distinct symbols for the structure sheaf and its stalk are used; the two closed immersions in the Tor formula and the coherent ideal defining the proper image are specified. Power-annihilated sheaves use dévissage before a degree on W is applied.
14. The accepted safeguards are retained: finite dimension and the resolution property for global strict supported comparison; global spectral-sequence Euler identities rather than stalkwise detection of K₀ classes; actual O_Y/O_Z inputs in the displayed double cohomology sum; EGA adic finite-type properness; the ramification factor e for flat local base change and the residue factor f for restriction of scalars; cokernels and limits of cokernels kept distinct; affine rational multiplicativity only.

The review's confirmed resolution-hypothesis gap at ZHANG21 line 4540 is accommodated in §2.1. The preprint properness parenthesis at LIZHANG22 lines 370–372 is disproved in its unrestricted scope by Spf k⟦t⟧ → Spec k: the reduced map is proper but H⁰ = k⟦t⟧ is infinite dimensional. This is a claim about arXiv v3, not the journal text. The prime-level argument for Zhang B.2(ii) is an expansion of its compressed proof; it is not reported as a new source error. No claim of non-affine formal filtration multiplicativity is made.

No notion had to move down from a later roadmap. The proper projection isomorphism here is part of this roadmap's accepted target, with its generic transformation imported from earlier work. The finite-support specialization of the Euler pairing uses only the finitely many local Tor bounds, so §4.5 retains its broader locally noetherian scope.

## Ownership and duplication removals

Main-branch shape was read in AdicSpacesPartIII, SchemeAndStackFoundations and GrothendieckEulerForms. The supplied roadmaps service was used to inspect the heads of the new SchemeKTheoryOperations and GeneralAlgebraicKTheory folders and to search all indexed open heads and main by mathematical object: formal support, strict complexes, supported K₀, Gillet–Soulé operations, Grothendieck groups, Tor pairings, Euler degree and codimension filtration. The board packages were also searched for those objects. Broad queries with truncated results were followed by narrower object queries. The named arithmetic and motivic open work supplies ordinary scheme K-theory/regulator consumers, not the formal supported carrier developed here. The GrossZagierAndArithmeticHeightsPartII package already imports the formal targets from this roadmap; its special cycles remain its own.

The content checkout was read at main commit c57bdc02fc2a4b1643df71b4a3a14b20fdad247f. The roadmaps service additionally searches its main snapshot and indexed heads; its resolver's main snapshot was e9512ca. Revised existing roadmaps were not used in place of the content-main copies. Every supplier section named in the README was read in the applicable main copy or the new-folder head; the native library names were checked separately at the pins because the service's resolver cannot check this worker's Lake packages.

| Duplicate construction omitted as an independent target or acceptance declaration | Owner consumed instead | Formal variant retained |
| --- | --- | --- |
| Module support, annihilator, Krull dimension, ideal height, regular rings and regular sequences | Mathlib modules listed below | Formal stalk and power-support compatibility, §§0.1–0.7 |
| Formal spectrum, formal scheme, closed subscheme, coherent category and associated finite-module functor | AdicSpacesPartIII §§F0.1–F0.4, F0.6, F0.8 | Their supported K₀ specialisations |
| Abstract exact/abelian Grothendieck quotient, lift, extensionality and induction | TauCeti.ExactK0, TauCeti.AbelianK0; GrothendieckEulerForms Layers 2–3 | Coherent formal category instantiation, §1.1 |
| Standalone affine coherent-group alias from the design's proposed Lean file | TauCeti.ExactK0 of finiteModulesExactStructure | Affine transport equivalence, §1.5 |
| Unrestricted affine Cartan map, equivalence and their module-only test theorems | Pinned CartanMap/Basic; GrothendieckEulerForms Layer 3 | Arbitrary formal supported comparison with actual hypotheses, §2.1 |
| Module-only completion, height, regular-sequence Tor and length statements proposed as substitute headlines | Mathlib local algebra and supplier regular/Koszul theory | Actual formal headlines remain in the module's not-statable inventory |
| Scheme strict/perfect K-theory, supported dévissage, products and rational filtration theorem | SchemeKTheoryOperations §§1.5–1.6, 2.5, 3.5, 6.1, 6.12 | Formal affine transport, §1.5, and its application §2.4 |
| Generic Koszul complex, regular-sequence resolution and derived tensor | DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §§0.3, E1.4–E1.6 | Formal sheaf gluing, strict support and derived intersections |
| Proper curve degree, dual and tensor formulas | SchemeAndStackFoundations §3.3 | Formal Cartier intersection equals that supplied degree, §4.6 |
| Generic proper scheme G₀ pushforward, Leray and flat base change | SchemeKTheoryOperations §§2.2–2.3; SchemeAndStackFoundations §§2.2, 2.6 | Scheme supports over Spf and general formal G₀ pushforward, Layer 4 |

All 31 design nodes remain, interpreted as formal targets or comparisons with these suppliers. The removals above concern independent duplicate constructions, proposed affine aliases, duplicate acceptance stand-ins and duplicate API wording, not loss of an accepted mathematical target or test.

## Pinned declarations and hypotheses

Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as read from `lake-manifest.json`. These differ from the historical baseline hashes in the accepted design, which is why the declarations were rechecked.

| Declaration | Source at the pin | Content and limits used |
| --- | --- | --- |
| ringKrullDim | Mathlib/RingTheory/KrullDimension/Basic.lean:26 | Krull dimension of the prime spectrum, valued in WithBot ℕ∞; no finiteness assumption in the definition |
| Ideal.height | Mathlib/RingTheory/Ideal/Height.lean:35 | Infimum of prime heights over minimal primes; the unit ideal has infinite height |
| Ideal.jacobson | Mathlib/RingTheory/Jacobson/Ideal.lean:65 | Intersection over maximal ideals containing the ideal; completeness implications are separate |
| IsAdicComplete | Mathlib/RingTheory/AdicCompletion/Basic.lean:56 | Includes Hausdorff and precomplete predicates |
| AdicCompletion | Mathlib/RingTheory/AdicCompletion/Basic.lean:171 | Compatible quotient-module system, not a formal spectrum |
| IsRegularLocalRing; IsRegularRing | Mathlib/RingTheory/RegularLocalRing/Defs.lean:51,92 | Local/noetherian plus maximal-ideal generator condition; localisations regular in the ring predicate |
| RingTheory.Sequence.IsRegular | Mathlib/RingTheory/Regular/RegularSequence.lean:146 | Weakly regular plus nonzero final quotient; unit ideal cannot be a regular sequence at a nonzero stalk |
| Module.support | Mathlib/RingTheory/Support.lean:47 | Primes at which the localised module is nontrivial; no finite-generation hypothesis in the definition |
| Module.length | Mathlib/RingTheory/Length.lean:30 | Submodule-lattice dimension in ℕ∞; not an unconditional integer length |
| Submodule.annihilator | Mathlib/RingTheory/Ideal/Maps.lean:951 | Ideal annihilating the submodule |
| Module.Flat; Module.Projective | Mathlib/RingTheory/Flat/Basic.lean:113; Mathlib/Algebra/Module/Projective.lean:70 | Module flatness and lifting projectivity; neither is formal coherent local freeness |
| HomologicalComplex | Mathlib/Algebra/Homology/HomologicalComplex.lean:59 | Complex-shape-indexed objects, maps and square-zero differentials; boundedness and support are additional conditions |
| CategoryTheory.Tor | Mathlib/CategoryTheory/Monoidal/Tor.lean:44 | Left-derived tensor in the second input; abelian monoidal preadditive category and projective resolutions required |
| TauCeti.ExactK0; TauCeti.AbelianK0; TauCeti.AbelianK0.of | TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163; Abelian.lean:79,94 | Exact presentation and abelian specialisation on essentially small categories |
| TauCeti.finiteModulesExactStructure; TauCeti.finiteProjectiveModulesExactStructure | TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:215,222 | Induced exact structures on finite modules and finite projectives |
| TauCeti.cartanMap | TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:381 | Projective-class inclusion into finite-module G₀ |
| TauCeti.cartanEquiv; TauCeti.cartanMap_bijective | Same module:686,708, with hypothesis at line 631 | Every finite module admits a finite resolution by finite projectives; retained in the elaborated types |
| TauCeti.ExactStructure.IsResolving.resolutionEquiv | TauCeti/CategoryTheory/GrothendieckGroup/Resolving.lean:308 | Resolving object property in an exact category, including finite-resolution and closure hypotheses; no assumption that all resolving objects are projective |
| TauCeti.SheafOfModules.tensorProduct | TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean:93 | Sheafification-based tensor over a sheaf of commutative rings, under the module-sheaf hypotheses |

The native-definition content above is paraphrased rather than copied. In particular the support definition does not include noetherianity or finite generation, the regular-sequence predicate rejects a zero final quotient, and the completion predicate includes separatedness. No native declaration is reintroduced under this roadmap namespace.

## Sources

All five cited works were fetched legally through the sources service and recorded under one lifetime key per work in `sources.toml`. ZHANG21 uses the published institutional PDF, LIZHANG22 arXiv v3, and EGA-I/EGA-III1 the Numdam open copies. STACKS has one manifest key with chapter-qualified extraction hashes. No cited text is missing, waived or uncertified; no source passage was copied into a deliverable.

Key source checks: ZHANG21 lines 4511–4521 (formal power support), 4525–4560 (groups, filtrations and the explicit non-affine qualification), 4563–4603 (exhaustion and degree), 4607–4676 (both lemmas and their proof); EGA-I lines 2849–2892 and 7294–7299 (completed localisations and formal stalks), 8098–8177 (exact coherent affine equivalence); EGA-III1 lines 4444–4507 (properness, coherence, limit comparison and noetherian ML); LIZHANG22 lines 336–372, 965–986, 1811 and 2942–2951 (formal notation, horizontal decomposition, filtration scope and Cartier pullback). STACKS chapter-qualified line ranges appear beside each target. The CM dimension and regular-sequence criteria were read at algebra lines 11776–11792, so the prime-localisation proof is applied in the noetherian local CM scope it actually requires.

## Adversarial mathematics pass

Every target is listed below; API rows separately test each defining or compatibility fact. The values are hand computations using the stated rings, short resolutions, composition series and Euler dimensions. They are not consequences of a successful sorry build. The Checks in each section are the displayed instances for the corresponding rows, and the layer-example rows recompute their shared signs. An abstract S₃ or Q₈ cannot instantiate a K₀ group, which is an additive commutative group by construction; no claim here quantifies over arbitrary nonabelian groups. Group representation data would be a different input category. No denominator or division is introduced. Positive exponents, empty infima/suprema and integer filtration subtraction are explicitly audited.

| Statement | Instances tried | Computed left / construction | Computed right / comparison | Result and change |
| --- | --- | --- | --- | --- |
| §0.1 Stalks of Spf A, localisations of A and completed localisations share their completion | ℤ_p⟦t⟧ at its closed point; k[t] with I=0 at (t) | R/Iⁿ on all three local rings; dimension 2, respectively 1 | same R/Iⁿ; completions R, respectively k⟦t⟧ | Compatible quotient by the image of the maximal-ideal power retained. |
| §0.2 Local dimension and codimension on locally noetherian formal schemes | Spf ℤ_p⟦t⟧; generic point of A¹; empty X | dim = 2; stalk dim = 0; empty dim = ⊥ | topological dim = 0 is rejected; neighbourhood dim = 1; empty codim = ⊤ | Nonempty pure-dimension convention made explicit. |
| §0.3 Regular and Cohen–Macaulay formal schemes | Regular power series; node; two planes meeting at a point | dimension/depth/embedding dimension: (2,2,2), (1,1,2), (2,1,4) | regular yes, no, no; CM yes, yes, no | No topological test; zero ring is the empty formal scheme. |
| §0.4 Codimension formula on Cohen–Macaulay formal schemes | R=ℤ_p⟦t⟧; plane/line ring k⟦x,y,z⟧/(xz,yz) | V(t): 2−1=1; point: 2−0=2; line: 2−1=1 | heights 1,2,0 respectively | Non-CM plane/line is a negative control; nonempty Z required. |
| §0.5 Regular immersions and effective Cartier divisors of formal schemes | V(t²) in ℤ_p⟦t⟧; node closed point; empty immersion | regular lengths 1, unavailable, vacuous | codimensions 1, 1 with two generators, ⊤ globally | Affine criterion restricted to maximal ideals containing the ideal. |
| §0.6 Formal support of a coherent module | M=ℤ_p, ℤ_p/p²; J=(p), 0, A | pⁿℤ_p ≠0; p²M=0; 0M=0; AM=M | support: no, yes, every M for J=0, only zero M for J=A | Positive annihilation exponents and formal support retained. |
| §0.7 Tor sheaves of coherent modules on a locally noetherian formal scheme | R=ℤ_p⟦t⟧; t against t or t−p; dual numbers | Tor₁=R/(t), 0; Torⱼ(k,k)=k for every j | Euler classes 1−1=0, 1; no finite Euler sum for dual numbers | Fixed finite Tor interval required for non-quasi-compact perfect inputs. |
| §1.1 The Grothendieck group K′₀ of coherent modules on a noetherian formal scheme | Spf ℤ_p; Spf k; node; empty X | G₀=ℤ, ℤ, ℤ², 0; [𝔽_p]=0 in the first | rank, dimension, two generic ranks, zero | Standalone affine group alias discarded. |
| §1.2 Dévissage for formally supported coherent modules | 𝒥=(p); module ℤ_p/p²; dual numbers | two successive quotients k,k; class 2 | inverse dévissage 2[k]; underived restriction only 1[k] | Marked comparison retained, not equality of abstract groups. |
| §1.3 Strict complexes with formal support | K(p), K(0), K(1); pullback to k | homology (k,0), (R,R), (0,0); pullback (k,k) | supported on V(p): yes,no,yes; pullback has full support | Arbitrary nonflat pullback handled on strict complexes. |
| §1.4 The Gillet–Soulé group K₀^Y of a noetherian formal scheme | Full support on field; empty support; K(1) | Euler free rank 1; 0; 1−1=0 | K₀=ℤ; zero group; zero class | Degreewise group negative control scoped to Spf k. |
| §1.5 Affine transport: K-groups of Spf A are those of Spec A | A=ℤ_p⟦t⟧, J=(p,t); J=A; J=0 over k | formal strict supported groups ℤ,0,ℤ | scheme strict supported groups ℤ,0,ℤ | Affine transport limited to the actual supported constructions. |
| §1.6 The homology class map K₀^Y(X) → K′₀(Y) | K(p) with point/full support; node rank-one class | homology class 1 / 0; (1,1) | supported h(1)=1; full h of torsion=0; (1,0) unreachable | No unconditional regular comparison. |
| §1.7 The supported cup product | K(t)∪K(t−p); K(t)∪K(t); two degree-one generators | H₀=k,H₁=0; H₀=H₁=ℤ_p; symmetry −1 | Euler 1; 1−1=0; (−1)¹=−1 | Koszul sign and underived-tensor negative control retained. |
| §1.8 The Tor pairing and derived intersections on a regular formal scheme | Free ranks 1,2,3; divisor self-product; residue point | associative product 1·2·3=6; alternating 1−1=0; unit 1 | other bracketing 6; coherent self-product 0; unit acts identically | Global hyper-Tor Euler identities required. |
| §2.1 Regular supported dévissage: K₀^Y(X) ≅ K′₀(Y) | Regular ring R=ℤ_p⟦t⟧, Y=closed point; node; field | h maps supported Koszul class 1→1; r→(r,r); field 1→1 | isomorphism ℤ→ℤ; not onto ℤ²; isomorphism ℤ→ℤ | Finite dimension and resolution property explicit; common refinements replace projective horseshoe. |
| §2.2 Codimension filtration on K₀^Y and dimension filtration on K′₀ | Point support in dimension 2; field; empty support | F²=ℤ,F³=0; F⁰=ℤ,F¹=0; every term 0 | F₀(point)=ℤ; F₀(field)=ℤ,F₋₁=0; zero group | Integer indices; repeated/mislabelled catalogue API entries repaired. |
| §2.3 Codimension filtration versus dimension filtration | X=Spf ℤ_p⟦t⟧,Y=V(t); X=Spec k | F¹=ℤ,F²=0; i=−1 gives F¹=0; i=d+1 gives F⁻¹=ℤ | F₁=ℤ,F₀=0; F₋₁=0; F_{d+1}=ℤ | Integer subtraction fixes the out-of-range formula. |
| §2.4 Rational multiplicativity of the codimension filtration on affine regular formal schemes | R=ℤ_p⟦t,u⟧; divisors t,tu or t,u; field | K(t,tu)≃K(t,0), class 0; K(t,u) has codim 2; ℚ·ℚ=ℚ | 0∈F²; transverse class ∈F²; F⁰=ℚ | Only rational affine product claimed; no Euler input in its route. |
| §2.5 K-groups of locally noetherian formal schemes by noetherian exhaustion | Infinite disjoint union of Spf ℤ_p; one-member exhaustion | compatible tuples (a₀,a₁,…)∈∏ℕℤ; one factor ℤ | all-open limit same product; one-member value ℤ | Pullback exhaustion choices and finite dimensions per member explicit. |
| §3.1 Closed-union decomposition of K′₀ modulo the overlap (Lemma B.1) | Node; disjoint union of two fields; X₁=X₂=X | overlap map ℤ→ℤ is 0; coker groups ℤ²; final cokernels 0 | component cokernels ℤ⊕ℤ; ℤ⊕ℤ; 0⊕0 | Cokernels and limits of cokernels kept distinct. |
| §3.2 Tor vanishing in the expected dimension (Lemma B.2(i)) | t,t−p; t,t; Serre non-CM planes example | expected codim 2=1+1,Tor₁=0; codim 1≠2,Tor₁=ℤ_p; len H₀=3,len H₁=1 | Euler 1; positive Tor in excess; 3−1=2 | CM hypothesis has a numerical negative control; purity unnecessary for stalk argument. |
| §3.3 Tor vanishing on an expected-dimensional part (Lemma B.2(ii)) | Y′=empty; V(s,t),V(s,t−p); failed regular immersion (xy,xz) | first reduces to Torᵢ=0; ideal sum (s,t,p); generator count 2 | zero Y-cokernel class; overlap Spec 𝔽_p; height 1<2 | Prime-level proof retained without labelling source proof erroneous. |
| §3.4 Pullback of the class of an effective Cartier divisor | Identity; inclusion D→X; V(p)→Spf ℤ_p⟦t⟧ | H₀=O_D,H₁=0; H₁=O_D(−D); mod-p t has kernel 0 | classes [O_D]; [O_D]−[O_D(−D)]; [k] | Use actual pulled-back line bundle when inverse image is not Cartier. |
| §4.1 Schemes proper over Spf A live over a thickening | P¹_k; Spec A/ϖ³; A¹_k; Spf A | factor exponent 1; exponent 3; H⁰=k[t]; H⁰=A | proper finite cohomology; length 3; infinite lengths for last two | Properness needed for cohomology, scheme condition for finite length. |
| §4.2 The Euler degree of a scheme proper over Spf A | Spec A/ϖⁿ,n=1,2; P¹_k,O(m),m=−2,−1,0 | lengths 1,2; Euler values −1,0,1 | degree 1,2; m+1=−1,0,1 | Coherent degree distinguished from line-bundle degree. |
| §4.3 The derived Euler–Poincaré pairing χ(X, F ⊗ᴸ G) (B.4) | t,t−pⁿ,n=1,2; point against divisor; self-divisor | Tor lengths n,0; Tor₀/Tor₁ lengths 1,1; self has infinite H⁰ | Euler 1,2; 1−1=0; no numerical value in formal-support-only case | Genuine O_Y/O_Z inputs in displayed formula; power-supported classes use dévissage. |
| §4.4 Functoriality and base change of the Euler degree | e=2,f=1; e=1,f=2; completed infinite unramified extension | base change length 2; restriction length 2; base change length 1 | e·1=2; f·1=2; 1·1=1 | Local-flat base change not restricted to finite DVR extensions; e≥1. |
| §4.5 Pairing with zero-dimensional classes: length times generic rank | F=k(x),[k(x):k]=2,G=O^r,r=0,1,2; G=O/(t) | Euler 0,2,4; Tor₀/Tor₁ dimensions 1,1 | length 1 · degree 2 · rank 0,1,2; rank(O/(t))=0 | Only finitely many local bounds are needed for finite support. |
| §4.6 Pairing with an effective Cartier divisor | Normal bundle O(a),a=−1,0,1; r transverse rational points | χ(O)−χ(O(−a))=1−(1−a)=−1,0,1; length r | deg O(a)=−1,0,1; degree of restricted divisor r | Twist sign fixed; curve degree imported for singular/nonreduced curves too. |
| §4.7 Proper pushforward on K′₀ of formal schemes and the projection formula | Identity; t=s²; non-adic Spf k⟦t⟧→Spec k | push/pull identity; length k⟦s⟧/(s²)=2; direct image k⟦t⟧ infinite | degree factor 1; 2·1=2; coherence conclusion false outside EGA proper scope | General formal proper-cohomology supplier gap; projection transformation proved invertible here. |
| §0.2 API 1: The local dimension at x is the Krull dimension of its stalk, and the global dimension is their supremum, with dimension ⊥ for the empty formal scheme. | R=ℤ_p⟦t⟧; empty X | sup of closed-stalk dimension 2; empty supremum ⊥ | global dimensions 2,⊥ | Values agree under the stated hypotheses. |
| §0.2 API 2: For noetherian X and d ∈ ℕ, purity means that every closed stalk has dimension d; it implies dim X = d when X is nonempty. | Closed point of Spf R; empty X | closed dimension 2; no closed points | pure dimension 2 for nonempty R; no finite dimension assigned to empty X | Values agree under the stated hypotheses. |
| §0.2 API 3: Local codimension for Z → X is the difference of the two finite stalk dimensions; global codimension is their infimum, with value ⊤ on empty Z. | Z=V(t),V(p,t),empty | differences 2−1,2−0; empty infimum | codimensions 1,2,⊤ | Values agree under the stated hypotheses. |
| §0.2 API 4: At the open prime 𝔭 of Spf A, local dimension is dim A_𝔭; globally dim Spf A = dim A, and dim Spf(A/𝔞) = dim(A/𝔞). | R=ℤ_p⟦t⟧,𝔭=maximal,J=(t) | dim R_𝔭=2; dim R/J=1 | formal dimensions 2 and 1 | Values agree under the stated hypotheses. |
| §0.2 API 5: For an ordinary locally noetherian scheme, these stalks and the global dimension agree with the scheme notions; neighbourhood dimension is a separate function. | Generic point of A¹_k | dim k(t)=0; dim A¹=1 | formal-scheme-embedding values 0 and 1 | Values agree under the stated hypotheses. |
| §0.2 API 6: If Z ⊆ Z′ ⊆ X are closed formal subschemes, then codim_X Z′ ≤ codim_X Z. | V(p,t)⊆V(t)⊆Spf R | codim bigger support 1 | 1≤2=codim smaller support | Values agree under the stated hypotheses. |
| §0.3 API 1: Regularity, respectively the Cohen–Macaulay condition, is equivalent to that condition on every stalk. | Power series R; node | embedding dim/dim 2/2; 2/1 | regular yes/no; depth=dim for both | Values agree under the stated hypotheses. |
| §0.3 API 2: For adic noetherian A, Spf A is regular exactly when A is regular; its Cohen–Macaulay condition is equivalent to that condition on all A_𝔪 for maximal 𝔪. | Complete local ring R; node | unique maximal localisation R; node at its maximal ideal | formal regularity yes/no agrees | Values agree under the stated hypotheses. |
| §0.3 API 3: For an ordinary locally noetherian scheme, formal regularity agrees with scheme regularity. | Spec k[t] embedded as formal scheme | local rings k(t),k[t]_(t) | regular in both scheme and formal interpretation | Values agree under the stated hypotheses. |
| §0.3 API 4: A regular formal scheme is Cohen–Macaulay and each of its stalks is a domain. | R=k⟦t⟧ | depth=dim=1; ab=0 implies a=0 or b=0 | CM yes; domain yes | Values agree under the stated hypotheses. |
| §0.3 API 5: Restriction to an open formal subscheme preserves regularity and the Cohen–Macaulay condition. | Open D(t) in Spec k[t] | k[t,t⁻¹] local regular dimension ≤1 | restricted scheme regular and CM | Values agree under the stated hypotheses. |
| §0.5 API 1: A closed immersion is regular exactly when its stalk ideals at points of the source are generated by regular sequences. | V(t²)⊆Spf ℤ_p⟦t⟧ | multiplication t² has kernel 0; quotient nonzero | regular sequence length 1 | Values agree under the stated hypotheses. |
| §0.5 API 2: The length of such a sequence is independent of its choice, equals local codimension, and is locally constant on the source. | Same divisor; identity | regular lengths 1,0 | dimension drops 2−1=1,2−2=0 | Values agree under the stated hypotheses. |
| §0.5 API 3: A closed formal subscheme is an effective Cartier divisor exactly when its ideal is invertible, equivalently when its immersion is regular of codimension one at every point of its source. | V(t²); empty divisor | ideal t²R free rank 1; unit ideal R rank 1 | Cartier yes; codim-one condition vacuous on empty source | Values agree under the stated hypotheses. |
| §0.5 API 4: Every closed immersion between regular locally noetherian formal schemes is regular. | R→R/(t−p) | regular dimensions 2→1 | ideal generated by one regular parameter | Values agree under the stated hypotheses. |
| §0.5 API 5: For Spf(A/𝔞) → Spf A, regular immersion means that 𝔞 is generated by a regular sequence locally at every maximal ideal containing 𝔞; the condition is vacuous off V(𝔞). | k[t] with ideal (t), at maximal (t) and (t−1) | at (t): length-one regular sequence; at (t−1): unit ideal | check required only at (t); unit final quotient would be zero | Values agree under the stated hypotheses. |
| §0.5 API 6: Locally the Koszul complex of the equations is a finite free resolution of the quotient structure sheaf. | Koszul(t−p) over ℤ_p⟦t⟧ | H₀=ℤ_p,H₁=0 | quotient ℤ_p and zero positive homology | Values agree under the stated hypotheses. |
| §0.6 API 1: Formal support on V(𝒥) means local annihilation by a positive power of 𝒥; on noetherian X one exponent suffices. | M=A/p²,J=(p) | J²M=0,J M≠0 | positive exponent 2, not exponent 1 | Values agree under the stated hypotheses. |
| §0.6 API 2: The coherent modules with this property form a full Serre subcategory, denoted Coh_Y(X). | 0→k→A/p²→k→0 | endpoint exponents 1,1 | middle exponent 2=1+1 | Values agree under the stated hypotheses. |
| §0.6 API 3: For finite M on Spf A the condition is equivalent both to JⁿM = 0 for some n ≥ 1 and to Supp_A M ⊆ V(J) in Spec A. | Finite module A/p²; A with J=(p) | support V(p); support Spec A | power-annihilation yes/no | Values agree under the stated hypotheses. |
| §0.6 API 4: Enlarging Y preserves the support condition. In affine terms, J′ ⊆ J and J-power annihilation imply J′-power annihilation. | A/p²,J=(p),J′=(p²) | J²M=0 | (J′)M=0; enlarged-support condition holds | Values agree under the stated hypotheses. |
| §0.6 API 5: Tensor products of modules formally supported on Y and Z are formally supported on Y ∩ Z. | A=k⟦x,y⟧,M=A/(x),N=A/(y) | tensor k killed by x and y | support V(x,y), not their union | Values agree under the stated hypotheses. |
| §0.6 API 6: Ideals with the same radical give the same supported subcategory. | J=(p),J′=(p²),M=A/p³ | J³M=0; (J′)²M=0 | same supported category | Values agree under the stated hypotheses. |
| §0.6 API 7: For n ≥ 1, closed pushforward from V(𝒥ⁿ) takes coherent modules into Coh_Y(X). | Y₂=Spec A/p², module O | closed pushforward is A/p² | p² kills it, so it lies in Coh_Y | Values agree under the stated hypotheses. |
| §0.7 API 1: For every j ∈ ℕ the coherent Tor sheaf is functorial in both coherent inputs; degree zero is their tensor product. | R=ℤ_p,M=N=k | Tor₀=k; identity map induces identity | M⊗N=k; functor identity fixes 1 | Values agree under the stated hypotheses. |
| §0.7 API 2: On Spf A, association of finite modules carries module Tor to the formal Tor sheaf, compatibly with completed localisations. | R=k[t], localise at t−1, M=N=k at t=0 | Tor₁ before restriction k; after restriction k | local Tor₁=k as well | Values agree under the stated hypotheses. |
| §0.7 API 3: The stalk at x is Tor over O_{X,x} of the two stalks. | R=ℤ_p,M=N=k | stalk of associated Tor₁=k | Tor₁ of stalks=k | Values agree under the stated hypotheses. |
| §0.7 API 4: Interchanging the inputs gives the symmetry isomorphism; a short exact sequence in either input gives the long exact Tor sequence. | Swap R/(t),R/(t−p); 0→R→ₚR→k→0 | Tor₁=0 both orders; connecting k→k is identity | kernel/image exact; dimension 1→1 | Values agree under the stated hypotheses. |
| §0.7 API 5: Inputs formally supported on Y and Z have Tor sheaves formally supported on Y ∩ Z. | R=ℤ_p⟦t⟧,M=R/(t),N=R/(t−p) | Tor₀=k,Tor₁=0 | support V(p,t) | Values agree under the stated hypotheses. |
| §0.7 API 6: If every stalk has global dimension at most d, Tor_j vanishes for j > d. A locally free input gives vanishing for all j > 0. | R regular dimension 2; one input free | Tor₃=0; Tor₁(R,N)=0 | bounds j>2 and j>0 | Values agree under the stated hypotheses. |
| §0.7 API 7: On an ordinary noetherian scheme these Tor sheaves agree with the scheme Tor sheaves. | Ordinary Spec ℤ_p, M=N=k | formal-embedding Tor₁=k | ordinary scheme Tor₁=k | Values agree under the stated hypotheses. |
| §1.1 API 1: Every coherent module has a class, and a short exact sequence gives the sum of the outer classes. | Finite-dimensional spaces 0→k→k²→k→0 | [k²]=2 | [k]+[k]=1+1=2 | Values agree under the stated hypotheses. |
| §1.1 API 2: Restriction to opens, closed pushforward and flat pullback induce homomorphisms with identity and composition laws; their sources and targets are the corresponding coherent Grothendieck groups. | Identity; two closed pushforwards of k; flat extension k→k′ | 1→1→1; k→k as ambient torsion; dimension 2→2 | composites identical; pullback of [k²] has dimension 2 | Values agree under the stated hypotheses. |
| §1.1 API 3: On Spf A the exact affine coherent equivalence induces K′₀(Spf A) ≅ G₀(A), carrying the class of M^Δ to the class of M. | Spf ℤ_p, M=k or A² | formal classes 0,2 | module G₀ classes 0,2 | Values agree under the stated hypotheses. |
| §1.1 API 4: For an ordinary noetherian scheme, this group is its scheme G₀. | Spec k, sheaf k² | formal-embedding coherent class 2 | scheme G₀ class 2 | Values agree under the stated hypotheses. |
| §1.1 API 5: An assignment to an abelian group that respects short exact sequences extends uniquely to an additive homomorphism. | Dimension assignment Vec_k→ℤ | k↦1,k²↦2 | induced map ℤ→ℤ is n↦n | Values agree under the stated hypotheses. |
| §1.1 API 6: Two homomorphisms agree if they agree on all coherent classes. To prove a subgroup is the whole group it suffices to contain those classes; zero, sums and negatives give additive induction. | Two homomorphisms agreeing on [k]↦2; subgroup containing [k] | both take 3[k] to 6; subgroup contains ±1 | maps agree on all n; generated subgroup ℤ | Values agree under the stated hypotheses. |
| §1.3 API 1: The strict supported category is the full category of bounded global finite locally free complexes with formally supported homology. | K(p), K(0) | H₀=k,H₁=0; H₀=H₁=A | membership in V(p) yes/no | Values agree under the stated hypotheses. |
| §1.3 API 2: Shifts, cones, finite sums and degreewise split extensions preserve membership with a fixed support. | Shift K(p); cone of identity | homology k in degree 1; cone homology 0 | same formal support; empty support for cone | Values agree under the stated hypotheses. |
| §1.3 API 3: Total tensor takes the categories with supports Y and Z to the category with support Y ∩ Z. | K(t),K(t−p) over R | total tensor resolves k | support V(p,t) | Values agree under the stated hypotheses. |
| §1.3 API 4: For every formal morphism g, termwise pullback takes the category with support Y to the category with support g⁻¹Y and respects composition. | Nonflat pullback A→k of K(p) | new differential 0; H₀=H₁=k | inverse-image support full Spec k; further identity unchanged | Values agree under the stated hypotheses. |
| §1.3 API 5: On Spf A, membership means a bounded complex of finite projective A-modules whose homology has support in V(J) in Spec A. | Spf A, K(p) | bounded finite free modules, homology k | support in V(p) inside Spec A | Values agree under the stated hypotheses. |
| §1.3 API 6: The Koszul complex of any finite list of global functions has formal support in their common vanishing subscheme, even when the list is not regular. | Koszul(0) and Koszul(1) | homology A,A and 0,0 | supports full and empty respectively | Values agree under the stated hypotheses. |
| §1.4 API 1: The class of a strict supported complex satisfies the degreewise exact-sequence relation and is invariant under quasi-isomorphism. | Quasi-isomorphism K(p)→k when viewed in coherent derived category; short exact sum | Euler class 1; [E⊕E]=2[E] | homology-class value 1; outer sum 1+1=2 | Values agree under the stated hypotheses. |
| §1.4 API 2: An exact complex has zero class; shifting once negates a class; the cone of E → F has class [F] − [E]. | K(1); shift of K(p); cone zero→K(p) | classes 1−1=0,−1,1 | zero,negative original,class target−class source | Values agree under the stated hypotheses. |
| §1.4 API 3: Support enlargement, restriction to opens and pullback along every formal morphism induce maps with identities and composition laws, into the indicated enlarged, restricted or inverse-image support groups. | Point support inclusion into Spf A; identity pullback | point class 1 maps to 0 in full group; identities 1→1 | composition same; inverse-image support unchanged | Values agree under the stated hypotheses. |
| §1.4 API 4: The group with full support is a commutative ring under cup product, with unit [O_X]; every supported group is a module over it. | Field full support | tensor dimensions 2·3=6; unit 1·2=2 | ring product 6; module unit fixes 2 | Values agree under the stated hypotheses. |
| §1.4 API 5: An assignment to an abelian group respecting both defining relations extends uniquely to a homomorphism. | Euler-rank assignment on field strict complexes | k[0]↦1,k[1]↦−1,K(1)↦0 | unique homomorphism from ℤ with 1↦1 | Values agree under the stated hypotheses. |
| §1.4 API 6: Homomorphisms are determined on strict-complex classes, and containing these classes gives the additive subgroup induction principle. | Two additive maps sending k[0] to 3 | n[k]↦3n under both maps | subgroup generated by k[0] is ℤ | Values agree under the stated hypotheses. |
| §1.6 API 1: The map h_Y is an additive homomorphism from K₀^Y(X) to K′₀(Y), taking a complex to the alternating sum of its homology classes through coherent dévissage. | K(p), shift K(p) | H₀=k, respectively H₁=k | h-values +1,−1 in point group | Values agree under the stated hypotheses. |
| §1.6 API 2: Support enlargement on the source agrees with closed pushforward on the target; restriction to opens and flat pullback commute with h. | Enlarge point support to Spf A; identity restriction; flat residue extension | h(point generator)=1 then push=0; identity 1→1; base-changed dim 1 | enlarge strict class then h=0; same restrictions/base change | Values agree under the stated hypotheses. |
| §1.6 API 3: For full support on Spf A, the affine comparison identifies h with the supplied Cartan map. | Full support Spf A,k=A/p | Euler projective rank 1−1=0 | Cartan image [k]=0 | Values agree under the stated hypotheses. |
| §1.6 API 4: The Koszul class of a regular sequence maps to the structure-sheaf class of its quotient. | Regular sequence (p,t) in R | Koszul H₀=k,Hᵢ=0 for i>0 | h-class [k]=1 | Values agree under the stated hypotheses. |
| §1.7 API 1: Total tensor defines a homomorphism in either variable from K₀^Y(X) × K₀^Z(X) to K₀^{Y∩Z}(X). | K(t),K(t−p) | total tensor H₀=k,H₁=0 | product class maps to 1 | Values agree under the stated hypotheses. |
| §1.7 API 2: Associativity and symmetry hold under the canonical identifications of the support intersections; in degree zero symmetry is ordinary commutativity. | Ranks 1,2,3 over k; two degree-one generators | (1·2)·3=6; swap sign −1 | 1·(2·3)=6; (−1)¹·¹=−1 | Values agree under the stated hypotheses. |
| §1.7 API 3: The structure-sheaf class in K₀(X) is a two-sided unit. | Unit and class 2 over k | 1·2=2 | 2·1=2 | Values agree under the stated hypotheses. |
| §1.7 API 4: Support enlargement and restriction commute with the product, and g*(a ∪ b) = g*a ∪ g*b for every formal morphism g. | A→k nonflat; K(p)∪[A] | pullback H₀=H₁=k; Euler 0 | pulled factors K(0)∪[k] also Euler 0 | Values agree under the stated hypotheses. |
| §1.7 API 5: On Spf A the product agrees with the strict supported product on Spec A. | Spf R versus Spec R, t and t−p | formal product Koszul(t,t−p) resolves k | scheme product same resolution, class 1 | Values agree under the stated hypotheses. |
| §1.8 API 1: For regular noetherian X of finite dimension the finite alternating Tor sum defines a biadditive map K′₀(Y) × K′₀(Z) → K′₀(Y ∩ Z). | Divisors t and t−p; direct sum two copies in first factor | Tor Euler 1 and 2 | biadditive sum 1+1=2 | Values agree under the stated hypotheses. |
| §1.8 API 2: The map is symmetric and associative under the canonical support identifications, with unit [O_X] in K′₀(X). | Ranks 1,2,3; principal divisor self-product | pairing 6 under both bracketings; 1−1=0 | unit 1·3=3; symmetric zero self-product | Values agree under the stated hypotheses. |
| §1.8 API 3: The derived intersection class is the pairing of the two structure-sheaf classes. | Structure sheaves of transverse sections | Tor₀=k,Tor₁=0 | derived intersection class 1 | Values agree under the stated hypotheses. |
| §1.8 API 4: The homology map carries the cup product of two strict classes to the Tor pairing of their homology classes. | K(t),K(t) on R | homology of tensor has classes [A/t]−[A/t]=0 | Tor pairing of quotient sheaves also 1−1=0 | Values agree under the stated hypotheses. |
| §1.8 API 5: Closed pushforward under support enlargement commutes with the pairing in either variable. | Point class enlarged to a divisor then paired with [R] | enlarged point class 0 | pair first with unit then enlarge: 1→0 | Values agree under the stated hypotheses. |
| §1.8 API 6: A biadditive map with this source is determined by its values on pairs of coherent-module classes. | Bilinear map on G₀(k)×G₀(k), generator-pair value 2 | value on (3,4) equals 12·2=24 | any second such map also 24 | Values agree under the stated hypotheses. |
| §2.2 API 1: Membership in Fʳ means a finite sum of images of strict classes with closed supports inside Y of ambient codimension at least r. | R dimension 2, point support, integer −3 times Koszul class | −3 belongs to image with codim 2 | −3∈F²=ℤ; coefficients need not be nonnegative | Values agree under the stated hypotheses. |
| §2.2 API 2: The filtration Fʳ is descending, F⁰ is the whole supported group, and Fʳ is zero for r > d when dim X = d < ∞. | Same point; field | F²=ℤ,F³=0; F⁰=ℤ,F¹=0 | descending endpoints as stated | Values agree under the stated hypotheses. |
| §2.2 API 3: Support enlargement carries Fʳ into Fʳ in the same ambient X. | Enlarge point support to V(t) | generator maps to 0 | 0 belongs to F² in the enlarged support group | Values agree under the stated hypotheses. |
| §2.2 API 4: The quotient Fʳ/Fʳ⁺¹ is the codimension graded group; its rational version is obtained by tensoring with ℚ. | Point support in dimension 2 | F²/F³=ℤ/0=ℤ | rationalisation ℚ | Values agree under the stated hypotheses. |
| §2.2 API 5: The dimension filtration Fᵢ on K′₀ is ascending; a coherent class supported in dimension at most i belongs to Fᵢ. It is zero for i < 0, and F_d is full when dim X = d < ∞. | V(t)=Spf ℤ_p | finite-length generator [k]=0; F₀=0,F₁=ℤ | increasing 0⊆ℤ; F₋₁=0 | Values agree under the stated hypotheses. |
| §2.2 API 6: For regular finite-dimensional A the affine comparison carries these filtrations to the scheme support and dimension filtrations. | Regular R and V(p,t) | formal F²=ℤ,F³=0 | scheme support filtration F²=ℤ,F³=0 | Values agree under the stated hypotheses. |
| §2.5 API 1: An exhaustion is a directed family of noetherian open formal subschemes with union X; the transition maps on groups are restrictions from larger opens to smaller ones. | First N components of ⊔Spf ℤ_p | restriction ℤ^{N+1}→ℤ^N drops last coordinate | identity and composition are coordinate truncations | Values agree under the stated hypotheses. |
| §2.5 API 2: The coherent and strict supported groups and their filtrations are the inverse limits of their noetherian values, with their canonical projections. | Same exhaustion, full support | lim ℤ^N=∏ℕℤ | canonical projection selects first N entries | Values agree under the stated hypotheses. |
| §2.5 API 3: Two exhaustions give canonically isomorphic groups, preserving every projection after passage to a common refinement and all constructed operations. | Permuted enumeration of same components | tuple (a₀,a₁,…) maps to (a_{σ(0)},a_{σ(1)},…) | inverse permutation recovers every a_n | Values agree under the stated hypotheses. |
| §2.5 API 4: A one-member exhaustion of noetherian X recovers its original groups. | Single-member exhaustion of Spf A | limit of one group ℤ | original group ℤ, projection identity | Values agree under the stated hypotheses. |
| §2.5 API 5: For quasi-compact closed Y contained in one member, if all members are regular of finite dimension with the resolution property, the supported system stabilises to K′₀(Y). | Support only on first component | for all N≥1 supported group ℤ | eventual limit ℤ=G₀(first support) | Values agree under the stated hypotheses. |
| §2.5 API 6: Associated graded groups are quotients of the limit filtrations. No identification with limits of graded groups or cokernels is part of their definition. | Field with full support, constant filtration | lim F⁰=ℤ,lim F¹=0, quotient ℤ | graded group ℤ; no general limit-cokernel interchange inferred | Values agree under the stated hypotheses. |
| §4.2 API 1: For a noetherian scheme W proper over Spf A, degree is a homomorphism K′₀(W) → ℤ whose value on E is the alternating sum of its finite A-length cohomology. | A/p²; P¹_k with O(−2) | H⁰=A/p² length 2; H⁰=0,H¹=k | degrees 2 and −1 | Values agree under the stated hypotheses. |
| §4.2 API 2: It is length after the scheme G₀ proper pushforward to Spec(A/ϖⁿ), and does not depend on the factorising exponent n. | A/p² through Spec A/p² or Spec A/p³ | same A-module H⁰ length 2 | proper pushforward then length gives 2 both ways | Values agree under the stated hypotheses. |
| §4.2 API 3: Closed pushforward W′ → W preserves the degree, with the same A-structure. | Closed point i:Spec k→P¹_k | H⁰(i_*k)=k,H¹=0 | degree on source 1, target 1 | Values agree under the stated hypotheses. |
| §4.2 API 4: For a coherent module on a formal scheme formally supported on W, its dévissage class in K′₀(W) has a degree; an ambient cohomological interpretation requires the compatible A-structure specified in §4.3. | A/p² formally supported on Spec k | two ideal-adic factors k,k | dévisage degree 1+1=2; underived restriction would give 1 | Values agree under the stated hypotheses. |
| §4.3 API 1: For F on Y and G on Z, their pairing is the finite double alternating sum of A-lengths of Hⁱ(W, Tor_j(F,G)), with W = Y ∩ Z a proper scheme over Spf A. | t and t−p² on R | H⁰Tor₀=A/p², higher groups zero | double Euler sum 2 | Values agree under the stated hypotheses. |
| §4.3 API 2: Equivalently it is degree after the Tor pairing; this specifies a biadditive map K′₀(Y) × K′₀(Z) → ℤ. | Same pair; two copies of first input | Tor class [A/p²], twice [A/p²] | degree-after-Tor values 2 and 4 | Values agree under the stated hypotheses. |
| §4.3 API 3: The pairing is symmetric, and degree of h(a ∪ b) is the pairing of h(a) and h(b). | Swap t,t−p²; strict Koszul representatives | Tor Euler 2 in both orders | degree h(cup)=2 | Values agree under the stated hypotheses. |
| §4.3 API 4: The value is computed on any noetherian open neighbourhood of W. | Point intersection in a noetherian open neighbourhood | same stalk A/p² and H⁰ length 2 | Euler value 2 before/after restriction | Values agree under the stated hypotheses. |
| §4.3 API 5: If all positive Tor sheaves vanish, the structure-sheaf pairing is deg_W[O_W]. | Transverse t,t−p | positive Tor 0, Tor₀=k | pairing=degree[k]=1 | Values agree under the stated hypotheses. |
| §4.3 API 6: For power-annihilated inputs, pair their dévissage classes. If X is compatibly over Spf A, this equals the ambient derived Euler characteristic on a proper nilpotent thickening of W. | A/p² against free rank one over Spf A | dévisage factors two k; value 2 | ambient H⁰ length 2 on Spec A/p² | Values agree under the stated hypotheses. |
| Topology | Spf ℤ_p⟦t⟧ maximal-ideal-adic versus p-adic | underlying maximal-adic space has one point | ring dimension 2 in either topology; p-adic space also has prime (p) | Do not read dimension from the topological space. |
| Intersection and union | ideals (t),(t−p) in ℤ_p⟦t⟧ | sum (t,p); intersection (t(t−p)) | intersection quotient k; union quotient R/(t(t−p)) | Directions fixed by explicit ideals. |
| Empty dimension/purity | zero ring and empty formal scheme | no stalks; dimension ⊥, codimension ⊤ | all K₀ groups 0 | No arbitrary finite dimension deduced from empty purity. |
| Filtration indexing | field d=0, i=−1 and i=1 | d−i=1,−1; F¹=0,F⁻¹=ℤ | F₋₁=0,F₁=ℤ | Integer subtraction, not truncated subtraction. |
| Chain/cochain signs | K(p) and its one-step shift | H₀=k or H₁=k; signs +1 or −1 | supported classes 1 and −1 | Reindex i to −i between homological and cohomological conventions. |
| Tensor symmetry | two degree-one generators over ℤ | interchange sign (−1)¹=−1 | two successive swaps multiply to +1 | Characteristic 2 reduces −1 to +1 correctly. |
| Lengths and residue degrees | closed residue field k′/k of degree 2 | A-length k′=2 | degree of its closed point 2 | No algebraically closed residue-field assumption. |
| Universe and smallness | Vec over k on finite-dimensional skeleton; empty category of support | object dimensions indexed by ℕ; K₀=ℤ | larger equivalent universe gives same ℤ; empty support gives 0 | No smallness inferred for arbitrary large categories. |
| Ramified/equal-characteristic coefficients | A=k⟦t⟧→k⟦s⟧,t=s² in char 2 or 3 | A′/tA′ has basis 1,s and length 2 | e·length_A k=2·1=2 | Separability not needed; p=2,3 are included. |
| Properness | Spf k⟦t⟧→Spec k | reduced map point→point proper; H⁰=k⟦t⟧ infinite dimensional | fails adic finite type, so excluded from coherent pushforward | No reduced-map shortcut. |
| Formal support extension exponent | 0→k→A/p²→k→0 | p kills both ends, p² kills middle | a+b=2 when a=b=1 | No natural subtraction junk value; tensor exponent a+b−1=1 is positive. |
| Uniform finite Tor amplitude | disjoint union of Spec k[x₁,…,x_n] with origin sheaves | each member has Tor in degrees up to n; no global finite upper bound | memberwise limit theory exists; a global finite Euler sum is not licensed | Perfectness alone on non-quasi-compact X does not supply a uniform interval. |
| Supplied scheme degree versus coherent Euler degree | O(−2) on P¹_k | coherent Euler degree 0−1=−1 | line-bundle degree −2=(−1)−χ(O),χ(O)=1 | Curve normalisation checked against supplier §3.3. |
| Supplier Koszul convention | one equation t in k⟦t⟧; equation zero | H₀=k,H₁=0; H₀=H₁=R for zero | Euler 1; 1−1=0; degree-one tensor swap −1 | Same witness in DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5. |
| Supplier Cartan convention | A=ℤ_p,k=A/p; A=k field | [A]−[A]=0; class of k² is 2 | cartanMap sends residue torsion to 0; field class 2 to 2 | Matches pinned map, not a restriction homomorphism. |
| Supplier resolving comparison | length-one resolution 0→A→ₚA→k→0 | Euler projective rank 1−1=0 | Cartan image [k]=0 | Lifts to preselected global resolutions are not assumed. |
| Supplier coherent affine comparison | A/p² and its associated coherent sheaf | global sections A/p²; p² kills them | associated formal module has same two k-factors | Completion-based coherent carrier retained. |
| Two-term proper-cohomology bound | P¹_k, O(−2), standard two-affine cover | Čech complex in degrees 0,1; H⁰=0,H¹=k | Euler 0−1=−1; no cohomology for q≥2 | Finite-cover bound uses affine acyclicity, not relative fibre dimension. |
| Projection transformation, identity | p=id, F=k at proper closed point,G=O | Rp_*(Lp*F⊗ᴸG)=k | F⊗ᴸRp_*G=k | Transformation takes 1 to 1; zero transformation excluded. |
| Worked example, Layer 0 | ℤ_p⟦t⟧,t,t−p; reduction of ℤ_p | dimension 2; Tor₁(t,t−p)=0; Tor₁^{ℤ_p}(k,k)=k | point intersection codim 2; reduced Tor₁^k(k,k)=0 is different | Formal stalk and ambient Tor conventions agree. |
| Worked example, Layer 1 | p-Koszul; self/two-section cup products | supported class 1, shifted −1; self 1−1=0; transverse 1 | full support image of p-torsion 0; same product homology classes | Sign and support enlargement agree. |
| Worked example, Layer 2 | point/divisor support; disjoint union | point F²=ℤ,F³=0; divisor F¹=ℤ,F²=0 | dimension filtration F₀(point)=ℤ,F₀(divisor)=0; limit product ∏ℤ | Filtration direction and product limit agree. |
| Worked example, Layer 3 | node and self-Cartier pullback | two component ranks ℤ²; pulled two-term differential 0 | cokernel direct sum ℤ²; Euler 1−1=0 | Both cokernel inverse maps and Cartier sign tested. |
| Worked example, Layer 4 | t,t−pⁿ,n=0,1,2; e=2; a=−1,0,1 | n=0 gives unit t−1 and empty intersection; n=1,2 give lengths 1,2 | Euler values 0,1,2; base-changed degree 2; Cartier degrees −1,0,1 | Self-intersection has no numerical degree in this scope. |

## Audit of the individual Checks

The following rows retain the numbering of the Checks in each README subsection. Each records the actual computed values, including the negative controls; repeated accepted Checks are included separately.

| Statement | Instances and computed left side | Computed right side / rejected model | Result |
| --- | --- | --- | --- |
| §0.1 Check 1 | R=ℤ_p⟦t⟧ at its closed point; the three local rings are R | each Iⁿ quotient is R/(p,t)ⁿ and each completion is R | Matches the stated value or excludes the proposed wrong model. |
| §0.1 Check 2 | At prime (p) in ℤ_p⟨t⟩: dim A_(p)=1, regular-local generator count 1 | formal stalk dim 1 and same completion; at (p,f) with irreducible nonconstant f, ht=2 | Matches the stated value or excludes the proposed wrong model. |
| §0.1 Check 3 | I=0 on k[t] at (t): both I-adic completed-local rings k[t]_(t) | maximal-ideal completion k⟦t⟧, distinct from k[t]_(t) | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 1 | R=ℤ_p⟦t⟧ has regular parameters p,t, dimension 2 | supremum of formal stalk dimensions 2 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 2 | Quotient dimensions for (t),(p,t),(t(t−p)) are 1,0,1 | ambient differences 2−1=1,2−0=2,2−1=1 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 3 | Underlying space one point, topological dimension 0 | stalk ring dimension 2, so the topological model gives the wrong value | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 4 | k[t] has Krull dimension 1 | its ordinary-scheme embedding has dimension 1 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 5 | No points or nonzero supported objects | dim ∅=⊥, codim empty=⊤, supported group 0 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 6 | Generic stalk k(t) has dimension 0 | every nonempty affine-line neighbourhood has dimension 1 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 7 | Formal ring R has dimension 2 | one-point formal space has topological dimension 0 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 8 | Quotient dimensions of t,t−p,(p,t),t(t−p) are 1,1,0,1 | codimensions 1,1,2,1 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 9 | Generic point stalk dimension 0 | neighbourhood dimension 1 | Matches the stated value or excludes the proposed wrong model. |
| §0.2 Check 10 | Empty supremum ⊥; empty infimum ⊤ | no stalk exists at which an expression ⊥−⊥ is used | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 1 | Parameters p,t, embedding dimension 2 and ring dimension 2 | regular yes | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 2 | Node dimension 1, depth 1, embedding dimension 2 | CM yes, regular no | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 3 | Two-plane union: local dimension 2, depth 1 | depth≠dimension, so not CM | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 4 | Affine n-space over ℤ_p for n=0,1,2: closed regular dimensions 1,2,3 | formal embedding preserves these regular stalks | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 5 | Complete regular local ring in dimensions 0,1,2 has embedding dimensions 0,1,2; smooth ℤ_p examples give dimensions 1,2,3 | completed smooth stalks stay regular | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 6 | Node embedding dimension 2>1, depth 1=dimension 1 | regular no, CM yes | Matches the stated value or excludes the proposed wrong model. |
| §0.3 Check 7 | Two-plane union depth 1<2=dimension | not CM | Matches the stated value or excludes the proposed wrong model. |
| §0.4 Check 1 | Dim R/(t)=1, dim R/(p,t)=0 with ambient dim 2 | heights/codimensions 1 and 2 | Matches the stated value or excludes the proposed wrong model. |
| §0.4 Check 2 | Plane/line ring dimension 2, line dimension 1 | dimension-drop codim 1 while component prime height is 0 | Matches the stated value or excludes the proposed wrong model. |
| §0.4 Check 3 | Z=X gives d−d=0; Z empty has no points | codimension 0, respectively ⊤ with no finite-subtraction formula | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 1 | R/(t−p)=ℤ_p; t−p is nonzero in domain R | Cartier, dimension drop 2−1=1 | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 2 | R/(t²) contains nonzero nilpotent t; t² remains a nonzerodivisor | Cartier yes despite nonreduced quotient | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 3 | Empty regular sequence generates zero ideal | identity immersion has dimension drop 0 | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 4 | Node maximal ideal has two generators; depth 1 | no regular sequence of length 2, not regular immersion | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 5 | Quotient by t−p is ℤ_p of dimension 1 | Cartier codimension 1 | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 6 | Node regular-sequence maximum length 1<2 generators | failed regular immersion | Matches the stated value or excludes the proposed wrong model. |
| §0.5 Check 7 | Identity on nonempty X: empty list length 0; empty source: no stalk conditions | codim identity 0; empty immersion condition vacuous | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 1 | M=A/Jⁿ, n≥1: JⁿM=0 | support lies in V(J) | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 2 | A=ℤ_p,M=A: pⁿA≠0 for all n | formal support fails although topological support equals the unique point | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 3 | J=0 gives 0¹F=0; J=A gives AⁿF=F | all F at full support; only F=0 at empty support | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 4 | Spec k[t],M=k at (t) or M=k[t] | support containment in V(t) and t-power annihilation both yes for k, both no for k[t] | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 5 | ℤ_p has no nonzero p-power annihilator | formal support no; topological containment yes | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 6 | n=1,2 gives Jⁿ(A/Jⁿ)=0; n=0 gives A/A=0 | all those modules lie in the indicated supported category | Matches the stated value or excludes the proposed wrong model. |
| §0.6 Check 7 | J=0 and J=A: 0¹M=0, A¹M=M | positive-power criterion gives every module and only zero module respectively | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 1 | K(t)⊗R/(t) has zero differential | Tor₁=R/(t) | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 2 | K(t)⊗R/(t−p) is multiplication by p on ℤ_p | kernel 0, cokernel 𝔽_p | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 3 | Free input R and G: no positive resolution terms | Tor₀=G,Torⱼ=0 for j≥1 | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 4 | K(p)⊗k has zero differential | Tor₁^{ℤ_p}(k,k)=k; Tor₁^k(k,k)=0 | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 5 | Dual-number resolution …→εR→εR; after tensor k all maps zero | Torⱼ=k for all j and infinite nonzero terms | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 6 | K(t)⊗R/(t) kernel R/(t); K(t)⊗R/(t−p) kernel 0 | Tor₁ self=R/(t), mixed=0 | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 7 | Coefficient ring k gives Tor₁=0; coefficient ring ℤ_p gives Tor₁=k | reduction before Tor changes the value | Matches the stated value or excludes the proposed wrong model. |
| §0.7 Check 8 | Dual-number Torⱼ dimensions 1 for every j | no finite-support alternating Euler class | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 1 | 0→A→ₚA→k→0 gives [k]=[A]−[A]=0 | G₀(A)=ℤ by rank, residue class 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 2 | Node modules O,R/(x),R/(y),k have generic ranks (1,1),(1,0),(0,1),(0,0) in the appropriate order | G₀=ℤ²; residue class zero | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 3 | Empty coherent category has only zero object | group 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 4 | Field module k² has dimension 2 | both Spf and Spec G₀ classes 2∈ℤ | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 5 | Finite-thickening simple class [k]=1; ambient rank of k is 0 | marked pushforward ℤ→ℤ takes 1 to 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 6 | Rank(A)−rank(A)=1−1=0 | torsion [k]=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 7 | Node two branch ranks give classes (1,0),(0,1); residue has both ranks 0 | G₀=ℤ²,[k]=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 8 | Empty X has zero category; k² has dimension 2 | groups 0 and ℤ with class 2 | Matches the stated value or excludes the proposed wrong model. |
| §1.1 Check 9 | Residue generator has length 1 and ambient rank 0 | pushforward takes 1→0 | Matches the stated value or excludes the proposed wrong model. |
| §1.2 Check 1 | A/pⁿ has n successive residue quotients, including n=1,2 | class n[k]; supported simple class 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.2 Check 2 | Dual numbers filtered by (ε): two factors k | dévissage 2[k], underived restriction 1[k] | Matches the stated value or excludes the proposed wrong model. |
| §1.2 Check 3 | Unit support ideal forces F=0 | supported group 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 1 | K(p): H₀=k,H₁=0 | p kills its homology, membership yes | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 2 | K(0): H₀=H₁=A, no power of p kills A | membership with support V(p) no | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 3 | K(1) has H₀=H₁=0; nonexact K(0) has nonzero homology | exact complexes give empty support in both directions | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 4 | Flat coefficient extension A→A⟦t⟧ sends K(p) to K(p) | H₀=A⟦t⟧/p,H₁=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 5 | K(p) has residue homology; K(0) has full free homology | support V(p) yes/no respectively | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 6 | Pullback A→k sends p to 0 | H₀=H₁=k and inverse-image support all Spec k | Matches the stated value or excludes the proposed wrong model. |
| §1.3 Check 7 | K(1) homology zero; K(0) on nonempty Spf k has two copies k | empty support yes/no | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 1 | All empty-supported strict complexes are exact | quasi-isomorphism class 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 2 | Finite projectives over a local ring are free; ranks 0,1,2 give classes 0,1,2 | K₀=ℤ by alternating rank | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 3 | K(p) has residue homology length 1 | supported class 1≠0 | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 4 | Two degree coordinates of [k→₁k] are (1,1) | quasi-isomorphism Euler relation gives 1−1=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 5 | Ordinary affine scheme Spec k, full support class k² | both strict models give 2 | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 6 | Exact complex has class 0 | K₀^empty=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 7 | Local free modules ranks 1,2 and complex shift give 1,2,−1 | integer rank group ℤ | Matches the stated value or excludes the proposed wrong model. |
| §1.4 Check 8 | K(1) has Euler free rank 1−1=0 | degreewise presentation retains two separate coordinates 1,1 | Matches the stated value or excludes the proposed wrong model. |
| §1.5 Check 1 | Koszul(p,t) over R resolves k with point support | generator 1 in both formal and scheme supported groups ℤ | Matches the stated value or excludes the proposed wrong model. |
| §1.5 Check 2 | J=A forces exact complexes; J=0 over field permits k[0] | both group pairs 0 and ℤ | Matches the stated value or excludes the proposed wrong model. |
| §1.5 Check 3 | Koszul(t) over k⟦t⟧ has supported residue class 1 | full-support alternating free rank 1−1=0 | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 1 | K(p) homology residue k in degree zero | h value 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 2 | A=k with free rank-two module or A=ℤ_p with K(p) | h and Cartan give 2 or 0 in the full-support group | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 3 | Node free rank one localises to dimension 1 on each branch | h(1)=(1,1), missing (1,0) | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 4 | Empty support gives exact complexes and zero coherent modules | h is 0→0 | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 5 | Regular lists of lengths 0,1,2 over k, k⟦t⟧, ℤ_p⟦t⟧ | Koszul homology only quotient in degree zero, h class 1 on its support | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 6 | Node h(r)=(r,r), including r=0,1,2 | (1,0) is not reached | Matches the stated value or excludes the proposed wrong model. |
| §1.6 Check 7 | K(p) shifted moves k from degree 0 to 1 | h changes 1→−1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 1 | Koszul(t,t−p) has quotient k and no higher homology | h of cup is 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 2 | Koszul(t,t) has H₀=H₁=A/t | Euler 1−1=0 while underived tensor class 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 3 | At field class a=2: rank-one unit times 2=2 and zero times 2=0 | unit/zero laws 2,0 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 4 | Spf R and Spec R product of t,t−p Koszul complexes | same total complex, supported class 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 5 | Total tensor K(t)⊗K(t−p) is Koszul(t,t−p) | H₀=k, supported Euler 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 6 | K(t)⊗K(t) positive and zero homology classes both 1 | Euler 0; tensor of degree-zero homologies alone gives 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.7 Check 7 | Two degree-one elements swap with (−1)¹·¹=−1; a=2 gives unit product 2,zero product 0 | expected signs and values −1,2,0 | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 1 | Two section quotients have Tor₀=k,Tor₁=0 | derived intersection class 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 2 | Principal self-intersection has two copies A/t in Tor degrees 0,1 | class 1−1=0, distinct from quotient class 1 | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 3 | Free rank-one resolution of O_X tensor G | Tor₀=G,Torⱼ=0 for j>0, so pairing [G] | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 4 | Ordinary Spec k, free rank-two and rank-three modules | both Tor pairing and G₀-module pairing have value 6 | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 5 | Transverse sections give Tor Euler 1; repeated section gives 1−1=0 | derived intersection classes 1 and 0 | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 6 | Free rank-two tensor residue k gives k², no higher Tor | class 2[k] | Matches the stated value or excludes the proposed wrong model. |
| §1.8 Check 7 | Unit against b=2[k] gives 2[k]; divisor self-pair gives 1−1=0 | values 2 and 0 | Matches the stated value or excludes the proposed wrong model. |
| §2.1 Check 1 | Koszul(p,t) is a finite free resolution of k | h maps supported generator 1 to coherent generator 1 | Matches the stated value or excludes the proposed wrong model. |
| §2.1 Check 2 | Node h image is diagonal (r,r) | (1,0) outside image | Matches the stated value or excludes the proposed wrong model. |
| §2.1 Check 3 | Empty support groups 0; field full support free rank-one generator 1 | comparison maps 0→0 and 1→1 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 1 | Point support has ambient codimension 2 in R dimension 2 | F²=ℤ,F³=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 2 | V(t) support has codimension 1, h(K(t))=1 in G₀(ℤ_p) | nonzero Gr¹ class 1 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 3 | Field d=0 full support: F⁰=ℤ,F¹=0; empty support all zero | endpoints full,zero,zero | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 4 | One-point topological codimension is 0 for all nonempty supports | wrong F²=0 would omit Koszul(p,t), whose true class in F² is 1 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 5 | Ordinary Spec k, full support d=0 | scheme and formal embedding filtrations both F⁰=ℤ,F¹=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 6 | Point Koszul(p,t) class generates ℤ at codimension 2 | F²=ℤ,F³=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 7 | Divisor Koszul(t) class h=1, next filtration term 0 | Gr¹ class 1≠0 | Matches the stated value or excludes the proposed wrong model. |
| §2.2 Check 8 | Field d=0: F⁰=F₀=ℤ,F¹=F₋₁=0; empty X has zero group | integer endpoint values as stated | Matches the stated value or excludes the proposed wrong model. |
| §2.3 Check 1 | V(t) has G₀=ℤ by rank and finite-length subgroup 0 | F¹↔F₁=ℤ,F²↔F₀=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.3 Check 2 | Field d=0, i=0: Gr⁰=Gr₀=ℤ; i=−1 gives F¹=0 | matching F₋₁=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.3 Check 3 | i=d+1 implies d−i=−1 | F⁻¹=full=F_{d+1}; for field both are ℤ | Matches the stated value or excludes the proposed wrong model. |
| §2.4 Check 1 | Koszul(t,tu) is Koszul(t,0) after basis change | two equal opposite Euler terms cancel, class 0∈F² | Matches the stated value or excludes the proposed wrong model. |
| §2.4 Check 2 | Koszul(t,u) resolves R/(t,u) of codimension 2 | product belongs to F² | Matches the stated value or excludes the proposed wrong model. |
| §2.4 Check 3 | Field full support F⁰_ℚ=ℚ,F¹_ℚ=0 | products ℚ·ℚ⊆ℚ and 0·ℚ=0 | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 1 | One-member constant system on Spf ℤ_p | limit group ℤ, projection identity | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 2 | Finite unions give groups ℤ^N and coordinate truncations | limit all tuples ∏ℕℤ, including (1,1,…) outside direct sum | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 3 | Permuting components sends a_n to a_{σ(n)} | inverse permutation recovers each original coordinate | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 4 | Open exhaustion on Spf A gives residue class 0; closed-thickening G₀ has residue class 1 | marked ambient map 1→0 | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 5 | Inverse limit of coordinate truncations ℤ^{N+1}→ℤ^N | ∏ℕℤ | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 6 | X=Spf k with one-member system | limit ℤ equals original ℤ | Matches the stated value or excludes the proposed wrong model. |
| §2.5 Check 7 | Support in first component has group ℤ at every sufficiently large finite union | limit ℤ, not all tuples ∏ℕℤ | Matches the stated value or excludes the proposed wrong model. |
| §3.1 Check 1 | Node overlap residue k has [k]=0 on each branch; node classes give two ranks | union cokernel ℤ² and component cokernels ℤ⊕ℤ | Matches the stated value or excludes the proposed wrong model. |
| §3.1 Check 2 | Disjoint union of two fields has no overlap, G₀ classes record two dimensions | both groups ℤ⊕ℤ | Matches the stated value or excludes the proposed wrong model. |
| §3.1 Check 3 | X₁=X₂=X gives identity overlap maps | all cokernels 0; restricted zero (0,0) | Matches the stated value or excludes the proposed wrong model. |
| §3.2 Check 1 | R/(t−p)=ℤ_p with t acting by p | Tor₁ kernel 0; codimension 2=1+1 | Matches the stated value or excludes the proposed wrong model. |
| §3.2 Check 2 | Serre example: quotient basis 1,x,y, Koszul H₁ length 1, H₂=0 | length H₀ 3, Euler 3−1=2, so positive Tor nonzero | Matches the stated value or excludes the proposed wrong model. |
| §3.2 Check 3 | Self-intersection quotient R/(t), Koszul differential 0 | codim 1≠1+1, Tor₁=R/(t) | Matches the stated value or excludes the proposed wrong model. |
| §3.3 Check 1 | Y′ empty, transverse t,t−p example | positive Tor zero and Y-component structure class 1 | Matches the stated value or excludes the proposed wrong model. |
| §3.3 Check 2 | Transverse local rank-two model in ℤ_p⟦s,t⟧, Z₁=V(s,t),Z₂=X,Y=Z₁,Y′=empty | codim 2 and positive Tor 0, so component class is [O_Y]; in the cited horizontal/vertical application the same higher-Tor component is zero modulo overlap | Matches the stated value or excludes the proposed wrong model. |
| §3.3 Check 3 | Ideals (s,t),(s,t−p) have sum (s,t,p) | same one-point spaces but overlap quotient 𝔽_p, not ℤ_p | Matches the stated value or excludes the proposed wrong model. |
| §3.3 Check 4 | Ideal (xy,xz)=x(y,z) has height 1 and needs two generators | regular-immersion hypothesis fails; expected component V(y,z) height 2 cannot repair it | Matches the stated value or excludes the proposed wrong model. |
| §3.4 Check 1 | Nonempty self-inclusion D: pulled equation 0, kernel equal to line O_D(−D) | h=[O_D]−[O_D(−D)], locally 1−1=0 | Matches the stated value or excludes the proposed wrong model. |
| §3.4 Check 2 | Identity sends t to t in domain R | kernel 0, quotient R/(t) | Matches the stated value or excludes the proposed wrong model. |
| §3.4 Check 3 | Nonflat map R→R/p=𝔽_p⟦t⟧ sends t to nonzerodivisor t | Tor₁=0,H₀=k, supported class 1 | Matches the stated value or excludes the proposed wrong model. |
| §4.1 Check 1 | P¹_k is killed by p; A/p³ killed by p³ and not p² | factor exponents 1 and 3 | Matches the stated value or excludes the proposed wrong model. |
| §4.1 Check 2 | Spf ℤ_p has H⁰=ℤ_p of infinite length | does not meet the proper-scheme support condition | Matches the stated value or excludes the proposed wrong model. |
| §4.1 Check 3 | A¹_k killed by p but H⁰ basis 1,t,t²,… infinite | no finite A-length despite factorisation | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 1 | n=0,1,2: A/pⁿ has lengths 0,1,2 | coherent degrees 0,1,2 | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 2 | P¹_k,O(m) for m=−2,−1,0,1 has Euler −1,0,1,2 | m+1 gives −1,0,1,2 | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 3 | Residue extension degree f=1,2 gives A-length 1,2 | degree f | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 4 | Empty support has zero cohomology in every degree | Euler degree 0 | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 5 | Formal Spf A has H⁰=A infinite length | numerical degree not defined in this scope | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 6 | A/pⁿ,n=1,2,3 has n residue factors | degree 1,2,3 | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 7 | P¹_k→Spf A,O(m),m=−2,−1,0: Euler −1,0,1 | m+1=−1,0,1; no closed embedding into the base is claimed | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 8 | Spec k′,[k′:k]=2 has H⁰=k′ and no higher cohomology | degree 2 | Matches the stated value or excludes the proposed wrong model. |
| §4.2 Check 9 | O(−2) on P¹_k has H⁰ dimension 0,H¹ dimension 1 | coherent degree −1, line degree −1−1=−2 | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 1 | n=0 gives empty intersection; n=1,2 gives A/pⁿ of lengths 1,2 | Euler degrees 0,1,2 | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 2 | Point against divisor t has Tor₀=Tor₁=k | Euler 1−1=0 despite nonzero Tor₁ | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 3 | F=k or A/p² on proper support, paired with O_X | Tor₀=F,no higher Tor, degree 1 or 2 on both sides | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 4 | Y=Z=V(t) gives formal support Spf A, H⁰=A infinite length | outside numerical pairing domain | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 5 | A/p² has p-action nonzero and two residue quotients | not a k-module; dévissage degree 2 | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 6 | n=1,2: quotient by (t,t−pⁿ) is A/pⁿ | lengths 1,2 and no positive Tor | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 7 | Point with divisor: Tor₀=k,Tor₁=k | Euler 1−1=0 | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 8 | n=1,2: multiplication pⁿ on A has kernel 0 and cokernel A/pⁿ | degrees 1,2 | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 9 | Self-divisor has coherent Tor class [A]−[A]=0 but both cohomology lengths infinite | no numerical value assigned | Matches the stated value or excludes the proposed wrong model. |
| §4.3 Check 10 | A/p² cannot be a k-module since p≠0 on it; filtration factors k,k | degree 2 | Matches the stated value or excludes the proposed wrong model. |
| §4.4 Check 1 | A′/pA′=A′/u² has basis 1,u modulo u² | length 2=e·1 | Matches the stated value or excludes the proposed wrong model. |
| §4.4 Check 2 | Finite unramified residue extension k′/k of degree f=2 | length_A(k′)=2,length_{A′}(k′)=1 | Matches the stated value or excludes the proposed wrong model. |
| §4.4 Check 3 | Completed infinite unramified A′ has e=1; A′/p=k′ simple over A′ | base-changed degree 1=1·1, no finite restriction claimed | Matches the stated value or excludes the proposed wrong model. |
| §4.5 Check 1 | Point with divisor Tor₀=Tor₁=k, generic rank divisor 0; point with unit rank 1 | Euler 0=1·1·0 and 1=1·1·1 | Matches the stated value or excludes the proposed wrong model. |
| §4.5 Check 2 | F=k(x),[k(x):k]=2, free G of rank r=1,2 | Euler 2,4 and rank formula r·2=2,4 | Matches the stated value or excludes the proposed wrong model. |
| §4.5 Check 3 | Rank r=0,1,2 and residue degree 2 | computed Euler values 0,2,4=1·2·r | Matches the stated value or excludes the proposed wrong model. |
| §4.6 Check 1 | r=0,1,2 transverse rational points, no positive Tor | sum of local lengths 0,1,2 equals restricted divisor degrees 0,1,2 | Matches the stated value or excludes the proposed wrong model. |
| §4.6 Check 2 | Zero section with normal O(a),a=−1,0,1 | Euler 1−χ(O(−a))=−1,0,1=deg O(a), including C⊆D | Matches the stated value or excludes the proposed wrong model. |
| §4.6 Check 3 | χ(O)=1 and χ(O(−a))=1−a for a=−1,0,1 | differences −1,0,1 equal normal-bundle degrees | Matches the stated value or excludes the proposed wrong model. |
| §4.6 Check 4 | Singular R=ℤ_p⟦x,y⟧/(xy), D=V(p), F=k: tensor of K(p) with k has zero differential | Tor₀=Tor₁=k, Euler 1−1=0=deg[k]−deg[k] | Regularity unnecessary for this perfect Cartier input. |
| §4.7 Check 1 | Identity on k-point class 1 | push and derived pullback both take 1 to 1 | Matches the stated value or excludes the proposed wrong model. |
| §4.7 Check 2 | t=s², pull back k=A/(p,t) | quotient 𝔽_p⟦s⟧/(s²) length 2, matching d·1=2 | Matches the stated value or excludes the proposed wrong model. |
| §4.7 Check 3 | Spf k⟦t⟧→Spec k: reduced map proper, global sections have basis 1,t,t²,… | infinite dimension, map not adic finite type and theorem inapplicable | Matches the stated value or excludes the proposed wrong model. |

The tables cover 31 target statements, 86 API facts and 168 individual Checks, together with conventions, supplier normalisations and all five worked layer examples.

## Elaboration and identifier checks

The acceptance file was elaborated with `lake env lean` on `packages/SchemeKTheoryOperationsPartII/Suggested.lean`, passing its absolute filename to the command and running from the content checkout as required. Exit status: 0. Exact count of sorry warnings: **0**. Other warnings: **0**. Errors: **0**. Other output, verbatim: **empty stdout and stderr**. There are no admitted declarations or data definitions, no options and no Tau Ceti imports in that file.

The required declaration-binder audit has an empty declaration set: no roadmap definition, instance or theorem is introduced, so no standing hypothesis can silently disappear. A separate scratch file checked all 25 library declarations cited in the README with `#check @name` and elaborated successfully, with zero warnings and zero errors. The corrected fully qualified resolving-equivalence name includes the IsResolving namespace. No additional hypothesis changes were needed after comparing the displayed types. It imports only pinned modules, after targeted builds of the missing CartanMap.Basic and GrothendieckGroup.Resolving objects. The displayed types were compared with the README's category, resolution, completeness, regular-sequence, coefficient and universe hypotheses. No affine substitute is admitted as a headline.

The README has zero backticked declarations owned by this roadmap, so the missing-own-identifier count is **0**. All backticked identifiers denote the library declarations or repository files in its supplier contracts. The sources manifest parses with schema `tauceti-roadmap-sources/v1`, one key per cited work. A structural comparison confirms that `design/plan.json` is unchanged outside its top-level gaps value.

## Dependency check

Executed the specified gate depcheck with the roadmap name, merge order and movable mode. Its output is:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no move is required. Suppliers precede this roadmap. Downstream consumer references are not supplier edges. The sole supplier gap is `proper-formal-coherent-direct-images`, assigned to AdicSpacesPartIII §F0.6 in both the README and the top-level plan gaps list.
