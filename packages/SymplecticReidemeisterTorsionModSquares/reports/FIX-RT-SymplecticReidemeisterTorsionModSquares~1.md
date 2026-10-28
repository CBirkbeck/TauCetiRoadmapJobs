# Repair findings and verification

Finding identifiers repeat across the two reviews. Each section below identifies its review; overlapping topology-citation findings share one repair, with both verdicts recorded.

## F01 (P1) — applied

Review r1a. Equality of Darboux and Lagrangian volumes → ν_L=(−1)^rν_Darboux. Made the degree-zero adjoint explicit in §1.7, corrected §2.1 and its Needs, and recomputed §1.8’s coordinate-Lagrangian Check. Evidence: AV-v1 lines 3282, 3572, 3755. For rank two, quotient f↦−e* gives −e∧f; rank zero gives 1. Cellular normalization and downstream torsion signs remain unchanged.

## F02 (P2) — applied

Review r1a. Arbitrary projective systems as standard-group labels → symplectically framed standard-free systems in the conventions and §3.7; frame change acts by conjugation. §3.5 retains arbitrary projectives and gains the sphere-tangent-module Check, with normalized constant-system value 1. §7.5’s field proof chooses a frame. Evidence: AV-v1 lines 445–450, 618–643; fields admit Darboux bases, general projectives need not.

## F03 (P1) — not actionable in this package: GeometricTopology must supply marked-twist compatibility

Review r1a. Recorded gap:marked-surface-twists, supplier GeometricTopology Layer 3, in both contracts and plan gaps. §4.8 now explicitly requires realization before constructing the mapping torus, with three relator/orientation Checks and the added dependency. AV-v1 lines 4047–4066 use this geometric input. Word and matrix calculations verify the local instance but cannot replace the supplier’s smooth realization theorem.

## F04 (P3) — applied

Review r1a. A degree-zero nondegenerate symplectic form labelled dimension four → the zero skew dimension-four pairing in §2.7. AV-v1 lines 3015–3018 explicitly allow a non-Poincaré input pairing. The boundary still has ranks two in degrees −1,4; χ(C)=2, χ₁/₂(D)=−2, and r≡0. No boundary-case Lean declaration was added.

## F05 (P3) — applied

Review r1a. Stages 2/4 supplying cochains and crossed homomorphisms → Stage 2 local systems, Stage 4 chains, §6.1 cellular/singular cochains. §4.7 owns the presentation-specific degree-one derivation. Updated §§0.8, 2.2, 2.3, 4.7 and layer dependencies. Main AlgebraicTopology lines 1011–1038 state that comparison. Recomputed the genus-two model: cocycles 6, principal cocycles 2, H¹ dimension 4.

## F01 (P1) — applied differently

Review r1b. The nonexistent named consumer → arithmetic scope exclusion and an unnamed list of usable interfaces. Searches find no roadmap folder of that name; board designs contain a proposal, so “exists nowhere” is too broad. No repository-wide absence of consumers was asserted. The frozen design prose is outside the permitted edits; maintainers should reconcile its proposed-consumer wording separately.

## F02 (P2) — applied

Review r1b. Split the three compound contracts into seven independently consumed contracts: detection/weight/count; real components/Bockstein; dyadic rank/reduction. Updated §§5.4, 7.1, 8.2 and dependency summaries, and made ℝ explicit throughout Layer 8; §§5.3, 7.4 and 8.1 already consume the retained first slugs. AV-v1 lines 233–246 fix the Bockstein direction H₃→H₂. These remain supplier gaps, not newly attributed supplier theorems.

## F03 (P3) — applied

Review r1b. Unspecified auxiliary-prime input → pinned `Nat.forall_exists_prime_gt_and_eq_mod`, with N above all ramified primes. Chebotarev §7.2 supplies the full cyclotomic degree; §7.1’s prime class 1 is not used. Updated the Mathlib contract, §6.3 and Layer 6 dependencies. At h=4, residues 5 and 13 work; 17 kills complex conjugation in the degree-four quotient.

## F04 (P3) — applied differently

Review r1b. Stage 6.3 as duality supplier → §6.4 and `compactTriadPoincareLefschetz`; §§6.1–6.3 now have their actual roles. This is the same citation repair as r1a F05, propagated through the duality consumers. Also corrected the gap’s section in the permitted top-level gaps list: the brief permits that edit, contrary to the review’s “frozen” suggestion. The boundary-cone extension remains explicit.

## F05 (P3) — applied

Review r1b. Replaced AV-v1 page/diagram locators 3397, 3407, 3494, 3536, 3591, 3629, 3822, 82 by 3415; 3427; 3498/3513/3526; 3565/3583; 3588; 3653/3675; 3840/3854; 94. §2.2 cites 509/3770; §2.3 cites 3766. JRV 854→855. Updated both occurrences of 3822 and the reference list. All replacements were read in the certified extractions.

## Checks and acceptance signatures

- Elaborated `packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean` from the pinned content checkout with `lake env lean`: exit 0. Only output: `Suggested.lean:40:8: warning: declaration uses sorry`. The existing Tau Ceti object file was available; no build was required.
- Elaborated one scratch signature file containing the unchanged acceptance file followed by `#check @TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula` and `#check @Nat.forall_exists_prime_gt_and_eq_mod`: exit 0, with the same expected `sorry` warning. Compared the complete elaborated signature with README §4.1. It retains independent K,V universes, Field K, Invertible 2, AddCommGroup V, Module K V, FiniteDimensional K V, Q, Q.Nondegenerate, A in full O(Q), the primary basis and invariant-image witness. No dropped binders and no signature change.
- Dirichlet’s elaborated type has `{q : ℕ} [NeZero q] {a : ZMod q}`, hypothesis `IsUnit a`, an arbitrary bound n, and conclusion `∃ p>n, Nat.Prime p ∧ ↑p=a`. Here q=2h>0 and gcd(h+1,2h)=1 for even h≥4.
- Dependency check with the prescribed configuration, roadmap name, order and movable flag: exit 0, output exactly:

```text
depcheck: 52 roadmaps, 588 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolver: no cross-roadmap citations or roadmap Lean names found nowhere. Its warning that it could not inspect pinned Lake packages was handled by direct reads of the actual local pins and the successful elaborations above.
- Contract consistency: all 14 top-level gaps have identical supplier/needs sentences in “Exact supplier contracts”; each has a supplier and section. JSON outside the top-level gaps value is byte-for-byte unchanged. There remain 60 numbered subsections and one Lean theorem. No Lean declarations were added, deleted or renamed.
- `git diff --check`: exit 0, no output. The scope scan found only the two permitted edited inputs and this requested report; no machine paths occur in the deliverables.
- No gate failures were supplied in the brief. `Suggested.lean`, metadata and source manifest need no change. All three cited works are already certified; no additional text or missing-reference request was needed.

## Source and ownership verification

The read-only content checkout is main e98875d. The manifest and package HEADs agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Two main roadmaps, AlgebraicTopology and GeometricTopology, were read for structure before editing. Supplier citations were checked at main when present, at the supplied K3BlochGroups head, and through `roadmaps show` for new roadmap folders absent from main. Revision pull requests for existing suppliers were not substituted for main.

| Supplier citation | Resolved repository-relative evidence | Consumed scope and boundary |
| --- | --- | --- |
| KTheoryLowDegrees §§14.1–14.4 | TauCetiRoadmap/KTheoryLowDegrees/README.md, §§14.1, 14.4 | Integer-graded lines, perfect determinants, parity comparison, ordered triangles and acyclic maps; rank-one acyclic scalar is u⁻¹. |
| PadicMeasuresIwasawaAlgebras §5.1 | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172 | Bounded finite-projective determinants and their dual/shift/cone/base-change API. Reverse-wedge adapter stays local. |
| AlgebraicTopology Stages 2,4,5,6 | TauCetiRoadmap/AlgebraicTopology/README.md:1011, :1515, :1534 | §6.1 cochains, §6.2 products, §6.3 orientation, §6.4 duality. The signed boundary-cone comparison is a gap, not inferred from a cohomological isomorphism. |
| GeometricTopology Layers 1,3,11 | TauCetiRoadmap/GeometricTopology/README.md:177, :357, :831, smoothing comparison | Manifolds, diffeomorphism groups, smooth/PL comparisons. Neither an all-dimensional simple-volume comparison nor the marked-twist word compatibility is silently assumed implemented. |
| TangentialBordism B1–B3.1 | TauCetiRoadmap/TangentialBordism/README.md:81, :170, :266 | Labelled geometric bordism, orientation map and connective filtration; Ω₀=ℤ, Ω₁=Ω₂=Ω₃=0. |
| StableHomotopyKTheory §§1.17,1.30,1.32 | TauCetiRoadmap/StableHomotopyKTheory/README.md:289, :441, :466 | Filtered homology, nerve/classifier/bar comparisons. §1.30 includes freely homotopic conjugate maps, giving frame independence with trivial coefficients. |
| SchemeAndStackFoundations §§0.9,0.21,2.9,2.11 | TauCetiRoadmap/SchemeAndStackFoundations/README.md, named subsections | Approximation, excellence/finite normalization and Kummer line pairs. Generic full faithfulness for existing étale covers is separately requested. |
| KTheoryFiniteLocalFields §§1.5,1.8–1.9 | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md, named subsections | Restriction multiplier, degree-three standard-representation slant, all-rank finite-field comparison; Witt lifts and real comparisons remain gaps. |
| K3BlochGroups §§2.4–2.5,4.20,6.7 | TauCetiRoadmap/K3BlochGroups/README.md:471, :504, :1682, :2253 | Stable number-field Hurewicz and genuine finite coefficients. The unstable SL₂ and dyadic lattice refinements are explicit gaps. |
| Chebotarev Layers 7,11.3,13 | TauCetiRoadmap/Chebotarev/README.md:245, especially §7.2 | §7.1 gives class 1; §7.2 gives irreducibility from unramifiedness. Number-field density is retained; arithmetic-scheme detection, weight and count remain supplier extensions. |
| RepresentationTheory/LieGroups Layer 5 | TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:358 | Connected Lie-group universal cover and kernel π₁. Identifying positive-rank Sp’s kernel and metaplectic quotient remains a gap. |
| MetaplecticAutomorphicForms §2.4b | TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:477 | Real topological double cover and central sign. No Chern identification is attributed to this section. |

Native definitions were read, rather than inferred from their names. `CochainComplex` is the shape-up specialization of `HomologicalComplex` (Mathlib/Algebra/Homology/HomologicalComplex.lean:157); it does not impose boundedness, projectivity or duality. Homology is `ShortComplex` homology (Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:89). The representation-homology carrier is at Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:228; Sylow at Mathlib/GroupTheory/Sylow.lean:54; the all-rank symplectic determinant theorem at Mathlib/LinearAlgebra/SymplecticGroup.lean:385. Dirichlet’s exact signature is at Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442.

Tau Ceti’s additive square-class quotient, multiplicative homomorphism and square criterion occur at TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45, :73, :83; scalar extension is TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean:149. Orthogonal carriers and spinor maps are the cited modules; reflection value [Q(v)] is pinned by TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:121. The real-subspace Lagrangian predicate at TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99 is equality with the symplectic orthogonal over ℝ; it does not supply a finite-projective shifted-dual exact subcomplex.

Object searches used `roadmaps grep`, main and Completed, board packages, the 102 README/Lean files in the 51 supplied sibling checkouts, and both pinned libraries. The supplied siblings have no overlapping signed-torsion/primary-spinor/marked-twist target; FunctionFieldArithmetic’s match concerns the cohomological L-function determinant, not this construction. MorseNovikov N4 owns ordinary based chain torsion with homology bases and a scalar-zero convention; it does not own the nonacyclic self-dual determinant root or the torsion–Chern theorem. Generic determinant and bordism objects remain imported from their owners. The new realization instance is §4.8’s explicit geometric input, while its general compatibility is assigned to GeometricTopology by the new gap. Generic twists in MappingClassGroupsAndCanonicalRepresentations’ design are imports from MordellLawrenceVenkatesh LV.5, not a discharged based-word-action comparison. Broad search results for other open roadmaps were leads only; no unprovided open checkout became a supplier. No declaration duplicates another roadmap’s fully qualified name.

The three legal cached texts were used directly: AV-v1 for the signed conventions, boundaries, normal families, propagation and topology; JRV Theorem 5.1, lines 782–810, for the full orthogonal formula; Thom line 2527 for coefficients only. The all-odd circle/mapping-torus extensions and normalized-family correction use the README’s own arguments, rather than pretending AV-v1’s characteristic-zero proof or raw-jump assertion has that generality.

## Adversarial mathematics ledger

Each row gives actual values, including negative controls. These computations test the statements; they do not discharge supplier gaps or replace the next independent review. Empty determinants are 1, exponents and truncation indices are integers, and characteristic two is excluded wherever division by two is used. API consequences are recorded separately after the numbered targets.

| Statement | Instances tried | Values on the two sides / competing model | Result and change |
| --- | --- | --- | --- |
| Conventions: cochain degree and shift | K —2→ K, degrees 0,1 | Shifted degrees −1,0 and differential −2, versus unsigned +2 | Retained. |
| Conventions: tensor interchange | degrees (1,1),(1,2), empty factors | Signs −1,+1,1 | Retained. |
| Conventions: dual and dual-shift | two-term d=2, q=0,1 | Comparison coefficients +1,−1; chain equation −2=−2 | Retained. |
| Conventions: determinant ratio | d=2 and shifted d=−2 | Acyclic coefficient 1/2, based/acyclic 2; shifted ratio 1/2 | Retained; no Darboux-volume conversion is inserted here. |
| Conventions: square classes | ℚ, 𝔽₃, 𝔽₅ | [4]=1; [−1]≠1 over 𝔽₃; [−1]=1 and [2]≠1 over 𝔽₅ | Retained. |
| Conventions: integral quotient | formal H₃=0,H₂=C₂; odd finite-field H₂ | UCT gives 0→H₃(F₂)→C₂, versus H₂[2]=0 in the finite-field cases | Retained; no full-mod-two identification over general rings. |
| Conventions: coefficient universe/rank/zero ring | zero ring; rank 0; ℚ[ε]/ε² | 0=1, unique module; det(0)=1; εJ reduces to zero and H⁰ has dimension 2 | Retained; nonreduced ring excluded from family theorems. |
| Conventions: Frobenius | C₂ character, Frob and its inverse | Nonidentity inverse is itself; both character values −1 | Retained. |
| Conventions: standard-free labels | standard plane; sphere tangent module | Frame gives a Sp₂ representation; tangent P has no frame although det P is trivial | Clarified domain; §3.5 still applies to P. |
| §0.1 complex/dual/cone definitions | Cone(id_K), Cone(0), d=2 | Cohomology (0,0), (K,K); shifted differential −2 | Retained. |
| §0.2 symmetric/Poincaré/strict predicates | hyperbolic pair; nonzero contractible C with zero form | Hyperbolic adjoint invertible; zero adjoint induces 0≃0 on homology but is not componentwise invertible | Retained; predicates distinguish examples. |
| §0.3 algebraic boundary | C=0; C=K[0], f=a, n=0 | Boundary 0; two-term d=a, cross value −α(y)+β(x), determinant of cross pairing 1 for a=0 or 2 | Retained. |
| §0.4 semicharacteristic | C=0; K[−1]; S³ constant K² | χ=0, −1, 2, respectively, versus unsigned 0,+1,2 | Retained. |
| §0.5 local strictification | contractible d=1 with zero form; d=sJ with cross I₂ | First contracts to zero; second has invertible adjoint in all fibres, H⁰ dimensions 0 and 2 | Retained; strictness does not mean constant cohomology. |
| §0.6 parity/local constancy | ranks (1,1),d=0; ranks (2,2),d=J,sJ; characteristic-two d=1 | χ≤0=1≡1; 0≡2; generic 0≡special 2; excluded F₂: 0≠1 mod 2 | Retained with the existing negative control. |
| §0.7 strict splitting | zero; acyclic J; rank-one d=0 | Middle rank 0,2,0; lower cohomology dimensions 0,0,1 | Retained. |
| §0.8 cellular/relative pairing | point; interval; noncompact ℝ | Point pairing original; boundary coefficients −1,+1; ordinary ℝ dimensions H⁰=1,H¹=0 | Corrected supplier locators; compact/relative hypotheses retained. |
| §1.1 signed inverse adapter | parities 0,1; grades 1,2 | Double inverse +1,−1; swaps −1 for (1,1), +1 for (1,2) | Retained. |
| §1.2 square torsor/root class | reference e,2e,4e over ℚ; two odd roots | Coordinates change [2],1; middle-root swap contributes [−1] | Retained; no preferred origin. |
| §1.3 reverse wedge/shift | n=0,1,2,3,4; m=n=1 | Signs +,+,−,−,+; combined −1 versus separate +1, with cross factor −1 | Retained. |
| §1.4 strong evenness | 0; d=id on K; diag(1,0) on K² | Term ranks 0; odd 1,1 with H=0; even 2,2 with H ranks 1,1 | Retained; neither cohomological condition implies the other. |
| §1.5 ordered term determinant | K² in degrees 0,−1; truncation r=1 | Top wedge and inverse top wedge; quotient is C⁰ in degree 0 | Corrected locator to B.13, not a diagram. |
| §1.6 determinant/cohomology adapter | zero differential; d=2; shift; cone(id) | Identity coefficient 1; acyclic 1/2; shifted ratio 1/2; cone comparison 1 | Corrected locators; normalization retained. |
| §1.7 Lagrangian exact sequence | symplectic coordinate lines; zero L; diag(1,1) with line (1,1) | Quotient f↦−e*, e↦f*; L=0 implies C=0; self-pairing (1,1) gives 2≠0 | Made vector-space adjoint explicit. |
| §1.8 Lagrangian root/volume | rescale root by 2; two odd roots; L=ℚe,ℚf | Rescaling multiplies by 4; odd-root interchange −1; both coordinate volumes −e∧f | Corrected comparison Check, retained independence of L. |
| §2.1 symplectic volume | ranks 0,2,4,6,8; rank six over 𝔽₃ | ν_L/ν_Darboux=1,−1,1,−1,1; 3!=0 but Darboux coefficient 1 | Replaced false equality by (−1)^r comparison. |
| §2.2 cell-fibre generator | point; oriented edge; rank-one edge | Generator e; orientation scalar (−1)²=1; rank-one scalar −1 | Added §6.1 input and corrected citation; normalization unchanged. |
| §2.3 simple invariance | attaching I₂,−I₂; based scalar d=2 | Determinants 1,1; arbitrary based quasi-isomorphism ratio 2 | Corrected cochain input and triangulation locator. |
| §2.4 duality-volume scalar | point of rank 2,4; closed 3-manifold rank 2 | (−1)^(1·1)=−1; (−1)^(2·1)=1; (−1)^(1·0)=1 | Recomputed after volume repair; no formula change. |
| §2.5 torsion definition | empty; constant K² on S³; I₂ rotation circle | RT=1,[−1],[2]; S³ normalized class [−1]²=1 | Retained Darboux numerator. |
| §2.6 orientation reversal | empty; S³ constant K²; algebraic lower rank 1 | Scalars 1,(−1)²=1,−1 | Retained. |
| §2.7 boundary-volume comparison | C=0; C=K²[0] with zero dimension-four form; middle J | a=b=c=1; χC=2,χhalfD=−2,r≡0 so all ratios 1; det J=1 yet b/c=−1 | Repaired inadmissible degree-zero pairing. |
| §2.8 normalized boundary | ∂D⁴ rank 2,4; cylinder | χhalf=2,RT=[−1],N=1; χhalf=4,RT=1; two equal N values square to 1 | Retained after recomputing the duality and boundary signs. |
| §3.1 low bordism orientation | point d=0,1,2,3,4; Bℤ in degree 1 | ℤ→ℤ sends +1→1; zeros→zeros in 1–3; degree 4 gives ℤ→0; labelled circle maps 1→1 | Retained degree bound. |
| §3.2 evenness | S³; identity genus-two mapping torus; L(3,1) in char 3,0 | χhalf=2,−4,0,2; extension multipliers at q=3,5 are 10,26≡0 | Retained; integers jump but parity does not. |
| §3.3 even strict models | 0; lower rank-one d=0; d=sJ on ranks 2,2 | Term ranks 0; χhalf=1 obstructs all-even terms; sJ already even with fibre h=0,2 | Retained. |
| §3.4 normal-domain extension | ℚ[s]_(s), monodromy diag(1+s,(1+s)⁻¹)⊕I₂ | Generic RT=[−(1+s)], special RT=1; s has odd valuation and is ramified, 1+s valuation 0 | Retained; raw extension is not arbitrary specialization. |
| §3.5 normalized family | same family; constant symplectic P on S³ | Generic N=[1+s]→1=special N; P generic χhalf=2,RT=[−1],N=1 | Added nonfree projective Check; retained full family scope. |
| §3.6 Chern slant adapter | zero; nonzero finite-field cycle q=3,5 | c(0)=1; c(x)=[−1] at 3, [2] at 5 | Retained integral quotient domain. |
| §3.7 normalized transformation | boundary; doubled cycle; constant standard label; frame conjugation | N=1, N(x)²=1, H₃(point)=0; conjugate maps have identical homology image | Restricted label formula to symplectically framed standard fibres. |
| §4.1 full orthogonal primary formula | V=0; rank-one Q=3x²,A=−1; I₂ rotation; hyperbolic −I | D=1,3,1/2,−1; θ=1,[3],[2],[−1], and [1/2]=[2] | Sole Lean headline; generality and nonzero product retained. |
| §4.1 plus-one variant | rank-one Q=3x²,A=−1; square-discriminant dimension four −I | Excluded rank-one formula gives [2]≠[3]; allowed dimension four gives det(2I)=16 with class 1 | Additional SO/even/square-disc hypotheses are essential. |
| §4.1 nonabelian homomorphism controls | S₃ permutation three-cycle; Q₈ commutator −I₄ | Product [2]²=1 and D=1/4; quaternion D=disc(I₄)=1 | Retained; cyclic tests alone do not test commutators. |
| §4.2 circle Poincaré complex | A=1,−1, rotation | d=0,2,1−A; cross B,0,(1+A)/2; rotation determinants det(1±A)=2 | Retained; acyclic −I need not be strict. |
| §4.3 strict sign formula | identity and rotation on I₂ | Identity n=h=2,r=0, raw −1 normalized 1; rotation n=2,h=0,r=1,detP=1/2,normalized [2] | Retained. |
| §4.3 alternating argument order | I₂ rotation, x=y=e₁ | P(x,(1−A)y)=0; P((1−A)x,y)=1 | Retained second-argument differential; no sign regression from §2.1. |
| §4.4 all-odd circle formula | 𝔽₃ unipotent hyperbolic four-space; ±I on allowed form | h=2,θ=1,RT=[−1]; +I₂ has h=2,raw−1; −I has det(2I)=2^n a square | Retained, with no semisimplicity or characteristic-zero restriction. |
| §4.5 orthogonal surface H¹ | (g,r)=(2,1),(1,1), H⁰=0; constant genus two | Dimensions 4,0 and square discriminants; constant H⁰=2,H¹=8 differs from 4 | Retained no-section hypothesis and determinant-one conclusion. |
| §4.6 mapping torus | T=I₄; charpoly x⁴+1; generalized unipotent block over 𝔽₃ | h=4,θ=1; h=0,det(1−T)=2; fixed Gram determinant 0 versus generalized discriminant 1 | Retained generalized eigenspace and chosen intertwiner. |
| §4.7 cocycle model | either Gaussian representation | Relator rank 2, generator space rank 8, cocycles 6, principal space 2, H¹=4; det ratios 4/2,8/2 | Added actual cellular comparison and dimension Check. |
| §4.8 geometric realization instance | T₁,T₂,T₄,T₅; T₃; reversing handles | R→R; R→(a₂⁻¹a₁⁻¹)R(a₁a₂); R→R⁻¹ | Added target/Checks; smooth realization still requires the supplier. |
| §4.8 first Gaussian witness | exact rational Gaussian arithmetic, prescribed twist order | Relator I₂; four intertwiner residuals 0; principal residual 0; charpoly x⁶+x⁴+x²+1; quotient x⁴+1; ratio 2 | Recomputed; N=[2]=[i]≠1. |
| §4.8 wrong-order control | reverse order T₁,T₃,T₂,T₄,T₄ | b₂ residual [[1−i,1−i],[−1−i,1+i]]; other three residuals 0 | Retained specified composition order. |
| §4.8 second Gaussian witness | second matrices and twists | Relator I₂; four residuals 0; charpoly (x²+1)³; quotient (x²+1)²; ratio 8/2=4 | Recomputed, square class 1. |
| §5.1 good-field predicate | source/target C₂; constant S³ at q=3 | Zero map has image {1}; isomorphism has image {1,a}; raw S³ nonsquare but N=1 | Retained normalized witness criterion. |
| §5.2 Chern-liftable image | zero; finite field; two witnesses x,y | 0 maps 1; finite image has 2 elements; c(x+y)=c(x)c(y) | Retained image/subspace definition. |
| §5.3 transfer | independent a,b; b∈span(a); zero witness | Four patterns include (0,1); span has {0,a}; zero specializes 0 at both fields | Split detection contract only; no counting input used. |
| §5.4 number-field liftable rank | ℚ,ℚ(i),totally imaginary degree 4 | Lower dimensions 0,1,2; image sizes at least 1,2,4; ℚ stable Hurewicz orders 48→24 | Separated dyadic reduction from surjection/rank supplier obligations. |
| §5.5 controlling density | empty subset; finite set; degree≥2 primes | Empty subset size 0; finite weight O(1/X); higher-degree weight O(X⁻¹/² log X)→0 | Retained nonempty set and upper-zero exceptional condition. |
| §5.6 quadratic control from torsion | Gaussian α=i; normalized constant S³ | Extension degree 2, subset fraction 1/2; constant N=1 gives degree 1 and empty nonidentity set | Retained nontrivial normalized hypothesis. |
| §5.7 composita | equal quadratics; independent quadratics; empty subsets | Galois orders 2 versus product 4; union size 3/4; empty∪nonempty is nonempty, empty∪empty empty | Retained individual surjectivity only. |
| §5.8 intermediate fields | M=L; ℚ(i)/ℚ split/inert primes | Multiplicity 1; split prime norm p on both sides; inert upstairs norm p² and normalized weight→0 | Retained degree-one comparison. |
| §6.1 independent liftable classes | independent α,β; β=α with identity control | Selected pattern count 1/4; conflicting α square/nonsquare has count 0 | Retained independence. |
| §6.2 multiquadratic control | dimensions 0,1,2 | Group sizes 1,2,4 and nonidentity counts 0,1,3; basis β,α+β avoids α in dimension two | Retained positive dimension and W≠span(α). |
| §6.3 cyclic imaginary extension | h=4,r=5,13,17; h even | (r−1)/h=1,3,4; conjugation images nonzero,nonzero,zero; gcd(h+1,2h)=1 | Added exact pinned prime-existence input. |
| §6.4 density amplification | δ=1/2,h=8,N=4; δ=1/4,h=12,N=6; δ=0 | Gains 7/128≥1/128; 5/256≥1/1024; δ=0 has no finite minimum h | Retained δ>0 domain of induction. |
| §6.5 density-one rational primes | initial ℚ(i) identity subset; remove p=2 | Initial fraction 1/2; omitted weight log 2/X→0; iterated bad fraction→0 | Recomputed Gaussian seed; unchanged conclusion. |
| §7.1 characteristic-zero comparison | Spec ℤ[1/2], Spec ℤ[1/2,t]; bad prime tail | Total weights ∼Q,∼Q²/2; bad weight ≤CQ^(d−1)o(Q)+O(Q^(d−1/2)(log Q)²)=o(Q^d) | Split counting and positive nonsplit weight obligations. |
| §7.2 Witt/Sylow lift | Sp₂(𝔽₃), Sylow order 8; characteristic 2; zero cycle | Index 24/8=3≡1 mod2; 8⁻¹=2 in 𝔽₃, 8=0 in 𝔽₂; zero lifts to zero | Retained odd-residue hypothesis and explicit lift gap. |
| §7.3 every odd finite field | q=3,9; rank 0 | Positive-rank H₃/2 size 2; at q=9 H₂=C₃ has H₂[2]=0; rank0 H₃=0 | Retained all odd fields; no good-prime restriction introduced. |
| §7.4 universal comparison | algebraically closed K; 𝔽₃(t); identity and specialization | Square-class target 1; char 3 remains char 3; identity acts identically; s→0 kills s so gives no fraction-field inclusion | Retained finite-data/normalization route and detection-only gap use. |
| §7.5 topological theorem | S³ constant K²; Gaussian; doubled Gaussian; empty | Normalized/Chern values 1,[2],[2]²=1,1 | Clarified field frame choice; recomputed signs. |
| §7.6 mapping-class spinor identity | identity on H¹ rank4; Gaussian | h=4,χhalf=−4,θ=1; h=0,χhalf=0,θ=[2] | Corrected (1.5) locator; retained chosen intertwiner. |
| §8.1 real component/cover | positive rank; rank0; C₂ class t² | Kernels ℤ→ℤ/4→ℤ/2 carry 1→1→1; rank0 kernel0; β(t²)=0 although t²≠0 | Split supplier component and compatibility contracts. |
| §8.2 full-mod-two vanishing | Gal(ℂ/ℝ)=C₂; zero cycle; hypothetical nonzero value | β_et(t)=t²≠0; c(0)=0; nonzero c₃₁ would have nonzero β_et, but β_G^coh(c₂₂)=0 | Explicit homological/cohomological Bockstein directions; conclusion unchanged. |

| API statement | Instances tried | Computed values | Result / change |
| --- | --- | --- | --- |
| §0.2 recover symmetry/closedness | rank-two cross I₂,d=J | Jᵀ+J=0 | Retained. |
| §0.2 adjoint chain map | same model | Adjoint blocks I₂; chain equation J=−Jᵀ | Retained. |
| §0.2 shift symmetry | skew dimension3 model, one shift | (ε,n)=(−1,3)→(+1,1) | Retained. |
| §0.2 componentwise strictness | cross I₂ and zero | Adjoint determinants 1 and 0 | Retained, distinct from acyclic Poincaré. |
| §0.3 signed boundary construction | n=0,ε=+1,C=K[0] | Terms K in −1,0; cross values −αy,+βx | Retained. |
| §0.3 strict boundary adjoint | f=0 and f=2 | Hyperbolic cross determinant 1 in either case | Retained. |
| §0.3 cone inclusion/quotient | same models | Kernel has dimension1 in degree0; quotient dimension1 in degree−1 | Retained. |
| §0.3 boundary functoriality for isometries | C=K[0],f=0, scalar isometry u=2 | Cone factors 1/2 and 2; cross product 1 | Retained. |
| §0.4 finite alternating sum | K in degrees1 and0 | χ≤1=−1 and +1; zero outside support adds 0 | Retained. |
| §0.4 quasi-isomorphism invariance | d=1→zero; identity of K[0] | χ=0=0 and 1=1 | Retained. |
| §0.4 direct-sum additivity | K[0]⊕K[−1] | χ≤1=1−1=0 | Retained. |
| §0.4 dimension-three cutoff | S³ constant K² | dim H⁰−dim H¹=2−0=2 | Retained. |
| §0.8 closed cellular pairing | point with standard symplectic fibre | Gram matrix J, det J=1 | Retained. |
| §0.8 absolute/relative adjoint | interval with scalar coefficients | H⁰(abs)=K paired with H¹(rel)=K, coefficient1 | Corrected topology locators. |
| §0.8 cone/boundary pairing | oriented interval | Endpoint coefficients −1,+1; their sum0 | Gap remains required. |
| §1.2 nonzero line quotient | ℚe, e,4e,2e | e/4e=1/4 square; e/2e=1/2 nonsquare | Retained. |
| §1.2 canonical tensor square | root generators e,2e | Images e²,4e², same square class | Retained. |
| §1.2 ratio of line classes | classes e and2e | Ratio [2]; reversing gives [1/2]=[2] | Retained. |
| §1.2 graded root rearrangement | parities (1,1),(0,1) | Scalars −1,+1 | Retained. |
| §1.3 reverse-wedge unit | dimensions0 through4 | Exponents0,0,1,3,6; signs1,1,−1,−1,1 | Retained. |
| §1.3 normalized determinant duality | dim2 basis e₁,e₂ | Reversed dual wedge e₂*∧e₁*=−e₁*∧e₂* | Retained. |
| §1.3 duality/shift coherence | Cone(id_K), one odd line | Canonical acyclic scalar1; signed double-inverse scalar−1 on both routes | Retained. |
| §1.3 dimension-addition law | m=n=1; m=1,n=2 | −1=(+1)(+1)(−1); −1=(+1)(−1)(+1) | Retained. |
| §1.4 termwise parity predicate | ranks0,1,2 | Even true,false,true | Retained. |
| §1.4 shift stability | even-rank pair in degrees0,1 | Shifted ranks2,2 in degrees−1,0 | Retained. |
| §1.4 dual stability | same pair | Dual ranks2,2 in degrees−1,0 | Retained. |
| §1.4 sum stability | rank2⊕rank2 | Rank4 even | Retained. |
| §1.4 even Euler characteristic | rank2 degree0; two-term diag(1,0) | χ=2; χ=2−2=0 | Retained. |
| §1.6 determinant/cohomology map | rank2 zero differential | Coefficient1, identity on top wedge | Retained. |
| §1.6 quasi-isomorphism naturality | d=2 acyclic, map to0 | Acyclic generator (1/2)e maps1 | Retained. |
| §1.6 dual/shift compatibility | scalar acyclic d=2, shift | Ratios2 and1/2, product1 | Retained. |
| §1.6 injection/cone quotient | inclusion K[0]→K²[0] first coordinate | Quotient rank1, extra identity cone has acyclic coefficient1 | Retained. |
| §1.7 isotropic inclusion | coordinate line e versus line e+f for diag(1,1) | First self-pairing0; second self-pairing2 | Retained. |
| §1.7 prescribed adjoint quotient | symplectic plane L=Ke | q(f)(e)=−1; quotient kernel Ke, rank1 | Made degree-zero normalization explicit. |
| §1.7 hyperbolic summand Lagrangian | K⊕K∨, cross1 | Kernel of second projection rank1, quotient rank1 | Retained. |
| §1.7 upper truncation Lagrangian | dimension1 cross I₂, d=J | L rank2 in degree1; quotient rank2 in degree0, adjoint cross determinant1 | Retained. |
| §1.8 root square class | rank2 upper truncation, cross I₂ | Root rescaling2 multiplies representative by4 | Retained. |
| §1.8 isometry naturality | symplectic plane e↦2e,f↦f/2 | det=1 and ν=−e∧f is preserved | Recomputed with corrected sign. |
| §1.8 direct-sum law | two rank-one lower cohomology roots | χL₁χL₂ odd, interchange scalar−1 | Retained odd-dimensional-complex formula. |
| §1.8 strongly-even termwise comparison | cross I₂ dimension1 complex, zero differential | Reverse-wedge correction−1; termwise and root-square coordinates both−1 | Clarified that vector-space factors use Lagrangian normalization. |
| §2.1 canonical determinant generator | standard symplectic plane and zero | e∧f and1 | Retained Darboux normalization. |
| §2.1 isometry invariance | diag(2,1/2); standard rotation J | Determinants1,1 and wedge scalars1,1 | Retained. |
| §2.1 scalar extension | ℤ[1/2]→𝔽₃, rank6 | Coefficient1 maps1; no 3! division | Retained. |
| §2.1 Lagrangian comparison | r=0,1,2,3 | Quotient sign times reverse/shuffle signs gives1,−1,1,−1 | Corrected equality throughout. |
| §2.2 relative generator | one relative rank-two cell | Fibre determinant coefficient1, inverse coefficient1 in odd degree | Retained. |
| §2.2 orientation/order invariance | edge reversal; swap two rank-two cells | (−1)²=1; (−1)⁴=1 | Retained. |
| §2.2 pair exact-sequence factorization | two points, one in A | e_X=e_(X,A)e_A with coefficients1=1·1 | Retained. |
| §2.2 base change | constant plane over ℤ[1/2] to𝔽₃ | Wedge coefficient1→1 | Added correct cochain input. |
| §2.5 scalar torsion | S³ constant K² | e/ν=[−1] | Retained. |
| §2.5 geometric/isometric invariance | identity; fibre diag(2,1/2) | Determinant scalars1; S³ raw value remains[−1] | Retained. |
| §2.5 disjoint-union sign | two S³ planes; two odd algebraic lower roots | χhalf factors2·2 give +1; odd·odd gives−1 | Retained general sign; three-dimensional symplectic specialization multiplicative. |
| §2.5 acyclic agreement | circle rotation | det(1−A)=2 and raw torsion[2] | Retained. |
| §3.4 unique generic extension | unit1+s; odd-valuation s | Étale torsor for1+s exists, valuation0; s has valuation1 and is ramified | Retained no arbitrary generic extension claim. |
| §3.4 restriction to fraction field | family generic raw torsion | RT_R represented by−(1+s), fraction-field value[−(1+s)] | Retained. |
| §3.4 localization agreement | localize again by2 | Class[−(1+s)] remains[−(1+s)] | Retained. |
| §3.4 strict root with generic sign | family ranks n=4,h=2,r=1 | Upper-term/cohomology root ratio−1; corrected raw class[−(1+s)] | Retained. |
| §3.5 normalized torsor | same family | [−1]·[−(1+s)]=[1+s] | Retained. |
| §3.5 fibre half-sign | generic h=2, special h=4 | Signs−1,+1; normalized values[1+s],1 | Retained. |
| §3.5 arbitrary domain-map naturality | s→0 and identity | [1+s]→1; identity sends[1+s] to itself | Retained; no injective fraction-field map required. |
| §3.5 lower-rank root formula | n=4, fibre h=2,r=1 and h=4,r=0 | n−h=2,0; sign exponents n/2−r=1,2 agree with h/2 | Retained. |
| §3.6 homomorphism | C₂ finite-field source generator x | c(2x)=c(0)=1=c(x)² | Retained. |
| §3.6 coefficient naturality | 𝔽₃→𝔽₉ | Restriction multiplier10≡0; −1 becomes a square | Retained. |
| §3.6 finite-field comparison | 𝔽₃,𝔽₅ nonzero classes | Images[−1],[2], each nonsquare | Retained. |
| §3.6 stabilization | Sp₂→Sp₄ over𝔽₃ | Nonzero degree-three generator still maps to[−1] | Retained. |
| §3.7 homomorphism | x+x; zero label | N(x)²=1=N(2x); N(0)=1 | Retained. |
| §3.7 manifold evaluation | standard plane on S³; Gaussian | N=1 and[2], respectively | Restricted to standard-free labels. |
| §3.7 naturality | constant S³ under identity and coefficient reduction | 1→1 in either target | Retained normalized functoriality. |
| §3.7 constant stabilization | Gaussian plus standard constant plane | Constant N=1; total N=[2]·1=[2] | Clarified standard free summand. |
| §4.2 signed circle complex | rotation | det differential2; det cross1/2 | Retained. |
| §4.2 strictness iff | A=1 and−1 | det(1+A)=2^n and0; cross pairing B and0 | Retained both directions. |
| §4.2 kernel/cokernel pairing | A=1 and−1 on K² | H ranks(2,2) with Gram B; ranks(0,0) with unique perfect zero-space pairing | Retained. |
| §4.2 basis-independent generator | same basis change diag(2,1) in both terms | Determinant ratio2/2=1 | Retained. |
| §4.7 word evaluation | principal cocycle φ_v | φ(g⁻¹)=ρ(g)⁻¹v−v=−ρ(g)⁻¹(ρ(g)v−v) | Retained. |
| §4.7 quotient description | either Gaussian case | dim Z¹=6, dim B¹=2, dim H¹=4 | Corrected source ownership. |
| §4.7 invariant principal space | both exact Gaussian matrices | T̃ι−ιM⁻¹=zero6×2 matrix | Recomputed. |
| §4.7 quotient determinant | both systems | det(1−T)=4/2=2 and8/2=4; denominator2≠0 | Recomputed all consumers. |
| §5.1 equality predicate | homomorphisms C₂→C₂ | Zero map≠Chern isomorphism; isomorphism=Chern | Retained. |
| §5.1 witness equivalence | image sizes1,2 | Nonzero normalized witness absent,present | Retained both directions. |
| §5.1 rank independence | finite-field standard stabilization | Nonzero generator stays nonzero, target size2 at both ranks | Retained. |
| §5.2 image membership | zero and nonsquare finite-field class | Preimages0 and the unique nonzero generator | Retained. |
| §5.2 finite-rank witness | sum of two stabilized rank-one cycles | Common rank2 source represents x+y | Retained finite stabilization. |
| §5.2 subspace property | C₂ generator a | a+a=0; image contains0 and is closed | Retained. |
| §5.2 base change | nonsquare−1 over𝔽₃ to𝔽₉ | Liftable nonzero class maps to liftable0 | Retained; preservation need not preserve nontriviality. |
| §5.5 weighted counting | single place norm3 | Weight log3/X for X≥3, limit0 | Retained. |
| §5.5 controlling witness data | quadratic extension, nonidentity subset | |S|=1,|G|=2, lower good density≥1/2 | Retained. |
| §5.5 good-density lower bound | disjoint quadratic union | |S|/|G|=3/4 | Retained. |
| §5.5 finite-change invariance | add one place norm3 | Counting difference log3/X→0 | Retained. |

The 87 API bullets above were tested on their actual objects or their coefficient/degree specializations; none was promoted to a Lean declaration.

| Additional changed contract or worked assertion | Instances tried | Computed values | Result / change |
| --- | --- | --- | --- |
| Marked-twist supplier contract | free surface words, T₃ and reversing handles | Conjugacy exponent+1 versus−1 | Requires smooth based-word compatibility, not just a matrix intertwiner. |
| Dyadic rank contract | ℚ,ℚ(i), imaginary degree4 | r₂=0,1,2 and required image sizes≥1,2,4 | Existing obligation separated from coefficient reduction. |
| Dyadic reduction contract | exact coefficient sequence 0→ℤ₂(2)→[2]ℤ₂(2)→μ₂→0 | Kernel of reduction on H¹ is exactly2H¹, hence kernel on H¹/2 is0 | Injection is coherent; no odd-prime inference at2. |
| Real component contract | positive rank versus rank0 | Central kernelℤ versus0; class is reduction of integer extension | Positive-rank restriction retained. |
| Real Bockstein compatibility contract | C₂ cohomology classes t,t²; zero homology cycle | β(t)=t²; β(t²)=0; both evaluated values on zero are0 | Directions and targets specified explicitly. |
| Frobenius detection contract | Spec𝔽₃ and independent formal characters | Unique nontrivial torsor evaluates1; independent quotient has four patterns, including(0,1) | Detection obligation uses every characteristic without a counting claim in dimension0. |
| Arithmetic nonsplit-weight contract | quadratic number-field character | Weighted nonsplit count∼Q/2, so c=1/4 works for large Q | Positive lower bound separated. |
| Arithmetic residue-order contract | Specℤ[1/2,t], q=p^f | Degree-f closed points≤p^f=q=q^(d−1), d=2 | One uniform constant is coherent; no normalized total1 claim. |
| Nonfree symplectic Check | n=(x,y,z), P=ker(n·−) | n·n=1 gives R³=P⊕Rn; (n×−)²=−id on P; at n=(0,0,1), ω(e₁,e₂)=1 and det=1 | P finite projective of rank2, perfect alternating. |
| Nonfreeness of that P | hypothetical nonzero tangent section on S² | Normalized section v gives cos(t)x+sin(t)v(x), connecting identity degree+1 to antipodal degree−1 | Contradiction; no algebraic frame. R is smooth/normal since the gradient cannot vanish on n·n=1. |
| Constant projective normalization | P-system on S³ and its fraction-field fibre | Generic χhalf2, raw[−1], N=[−1]²=1; normal injectivity gives global1 | Family scope preserved without a standard Sp label. |
| Frame-independence assertion | frame change S and label ρ | New representation SρS⁻¹; nerve natural transformation gives same H₃ class | Existing classifying-space comparison supplies it. |
| Worked Gaussian example | both complete systems, inverse-order control | Quotient polynomials x⁴+1,(x²+1)²; det ratios2,4; wrong order residual on b₂ nonzero | Recomputed, as detailed above. |
| Gaussian nonsquare proof | (a+bi)²=i, a,b∈ℚ | a²=b² and2ab=1 force a²=1/2 or−1/2; neither rational square; (1−i)²i=2 | Nontrivial class remains[2]=[i]. |
| Worked normalized specialization | hyperbolic H⊕H overℚ[s]_(s) | Generic moving determinant−s²/(1+s), class[−(1+s)]; N=[1+s]→1 | Unchanged after sign and frame audit. |
| Worked density count | δ=1/2,h=8,N=4 | δ/h−1/(h2^N)=1/16−1/128=7/128 | No unsupported product-surjectivity assumption. |
| Lower-density negative control | alternating dominating weighted blocks | Each color has subsequential normalized weights0 and1; union always1 | Upper-zero exceptional condition retained. |

## Maintainer consequences

The only changed package files are README, the plan’s top-level gaps list and this report. No commit or external write was performed. There are no Lean-name changes for consumers. The five new slugs are marked-surface-twists, dyadic-number-field-chern-reduction, real-chern-bockstein-compatibility, arithmetic-scheme-nonsplit-weight and arithmetic-scheme-residue-order-count. The nine original slugs remain; poincare-boundary-cone’s section now points at Stage 6.4. Their suppliers must close the mathematical obligations independently. The realization finding cannot be closed solely by an edit of this package; it is explicitly recorded for the maintainer’s decision and subsequent supplier work.
