# Package report: SymplecticReidemeisterTorsionModSquares

The package is `packages/SymplecticReidemeisterTorsionModSquares/`. Its README has nine layers and 60 substantive subsections, with all retained design APIs and Checks in prose. The starting skeleton was generated from all 63 plan nodes before ownership resolution. The three generic targets transferred to suppliers retain their mathematical contracts below and in Scope and ownership. Only the top-level `gaps` list in `design/plan.json` changed; a byte-level comparison of the prefix and suffix outside that JSON value confirmed this.

The supplied `design/review.json` was absent and `reports/` was initially empty. The embedded review in `design/plan.json` is accepted and contains a verdict for every node; its nonblocking notes were applied and independently checked. No instruction found in read source or roadmap data was treated as an instruction to act.

## Headline inventory made before Suggested.lean

| Headline | Acceptance-test status |
| --- | --- |
| Strict Poincaré splitting and locally constant semicharacteristic parity | Not statable at the pins: lacks the signed Poincaré-complex carrier and its specified duality. |
| Signed boundary torsion theorem | Not statable: lacks signed cellular torsion and the chain-level boundary pairing comparison. |
| Normal-domain torsion extension and normalized specialization | Not statable: lacks the torsion and determinant-root-line carriers. |
| Labelled oriented bordism comparison in degrees at most three | Not statable: lacks the labelled compact smooth bordism carrier; the supplier roadmap is not a library import. |
| Evenness of three-dimensional symplectic semicharacteristic | Not statable: lacks the twisted finite cellular manifold complex with its duality. |
| Full Zassenhaus primary-decomposition formula | Stated as `TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula`, on native quadratic forms and orthogonal groups, in every characteristic other than two. |
| Circle torsion formula in all odd characteristics | Not statable: lacks signed torsion of the circle Poincaré complex. |
| Mapping-torus torsion formula | Not statable: lacks the twisted surface-cohomology/Wang pairing comparison and torsion carrier. |
| Gaussian nonsquare normalized torsion witness | Not statable: lacks the actual genus-two local-system/mapping-torus torsion carrier; bare matrix identities are Checks, not substitutes. |
| Number-field liftable-rank bound, transfer and density-one goodness | Not statable: lacks the Chern slant and normalized torsion transformations on the actual integral degree-three quotient. |
| Universal torsion/Chern equality, its manifold theorem and mapping-class identity | Not statable: lacks the signed torsion and universal equivariant étale slant objects. |
| Real metaplectic-component comparison and full-mod-two Chern vanishing | Not statable: lacks real Chern components and their group/étale Bockstein comparison. |

The module docstring names every unavailable headline and the missing carrier. No API lemmas, boundary examples, free predicates, opaque stand-ins or admitted data were added. The Witt lifting and auxiliary cyclic-extension arguments remain proof-route targets in the README, not replacements for any torsion headline. The single Lean theorem uses no newly defined carrier or data.

## Ownership sweep and removals

The content checkout is main `5f173a7b9ac37eb6b62d01eb3db5047b92d19363`. The actual library revisions match its manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These replace the older revisions recorded in the immutable design baseline. OrthogonalSpinGroups, AlgebraicTopology and Completed/RestrictedProducts were read as shape references; the package keeps the denser definition/API/Check format requested here.

Ownership was searched by mathematical object using `roadmaps grep` against main and the supplied open-head index, as well as the board packages and the two pinned libraries. Searches covered signed Poincaré complexes, Lagrangian subcomplexes, determinant/cohomology and graded-line comparisons, spinor norms and Zassenhaus determinants, labelled bordism, finite-rank symplectic degree-three homology, universal Chern slant, dyadic K₃ comparisons, metaplectic covers, closed-point Frobenius detection and weighted density. The specified open roadmap heads were included in this index search. Existing-roadmap revisions were not used as dependencies: AlgebraicTopology, GeometricTopology, Chebotarev, PadicMeasuresIwasawaAlgebras and RepresentationTheory/LieGroups were read on main. The new supplier folders were read at their available heads. TangentialBordism is a new-folder supplier found by the object search; its B1–B3 contracts were read, rather than inferred from its title.

| Design construction removed or narrowed | Resolved owner and exact boundary |
| --- | --- |
| Separate labelled bordism construction, RT.3/labelled-bordism | TangentialBordism B1, B2.1–B2.5. No second quotient, group law or fundamental-class map is planned. The low-degree orientation isomorphism remains a consequence here; its supplier owns the filtration and coefficients. Its point/circle/Bℤ Checks remain in the supplier contract. |
| Star-norm spinor conversion, RT.4/spinor-convention | Pinned `CliffordAlgebra.orthogonalSpinorNorm_reflectionOrthogonal`, `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:121`, gives [Q(v)], with no negative sign. The old adapter is unnecessary. SO uses the pinned restriction. |
| Generic arithmetic-scheme Frobenius detection target, RT.5/quadratic-cover-detection | Supplier gap `arithmetic-scheme-frobenius-detection`, Chebotarev Layer 13 arithmetic-scheme extension. The exact detection, quantitative and residue-order statements live in that contract, not in a duplicate local target. |
| New graded-line category, parity reduction and generic determinant/cohomology construction within RT.1 | KTheoryLowDegrees §§14.1–14.4 and PadicMeasuresIwasawaAlgebras §5.1 own the category, coherent determinant and quasi-isomorphism/acyclic/cone maps. Only right-evaluation, reverse-wedge and their cohomology compatibility adapters remain here; their original sign Checks remain. |
| Universal Chern classes and finite-rank finite-field comparison | KTheoryFiniteLocalFields §§1.8–1.9. Layer 3 only evaluates the supplied classes and defines the normalized torsion transformation. |
| Kummer line-pair construction | SchemeAndStackFoundations §2.11 explicitly supplies line pairs, Hilbert 90 and Kummer. Only arbitrary-normal-domain generic gluing remains a gap. |
| Metaplectic double-cover construction | MetaplecticAutomorphicForms §2.4b; universal covers are RepresentationTheory/LieGroups Layer 5. This package only applies their comparison to Chern components. |

No existing owner was found for the retained signed torsion construction, its odd-characteristic circle proof, its normalized specialization formula or its universal comparison. The pinned real symplectic Lagrangian predicate at `TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99` has real vector subspaces as its carrier; it is not the retained general-ring exact shifted-dual Lagrangian subcomplex. Generic Poincaré ∞-categories in hermitian K-theory are distinct from these bounded signed cochain adapters, and do not supply this torsion normalization.

No notion was imported from a later roadmap or moved down from one. SymplecticLFunctionsModSquares is only a consumer. The low-degree topology found in TangentialBordism is imported in the existing direction. No foreign fully qualified declaration name was assigned to the one new Lean theorem.

## Supplier corrections and remaining mathematical obligations

The design's atlas-style section names were resolved to actual sections. KTheoryLowDegrees Z.3/Z.6 becomes §§14.1–14.4; KTheoryFiniteLocalFields L.1 becomes §§1.5 and 1.8–1.9; stable Hurewicz is K3BlochGroups §2.4; group-nerve comparison and continuity are StableHomotopyKTheory §§1.17, 1.30, 1.32. MotivicEtaleKTheory's actual scope is higher-cycle/Deligne realization, not the old M.1/M.7/M.8 interfaces. Kummer is now cited to SchemeAndStackFoundations §2.11, universal finite Chern classes to KTheoryFiniteLocalFields §1.8, and the unstable/dyadic number-field requests to K3BlochGroups §§2.4–2.5 and 6.7. The supplied AnalyticNumberTheoryPartII is an existing Lerch/Dirichlet-series/operator roadmap, so inventing another roadmap of that name for scheme Chebotarev would conflict with ownership. The scheme extension is recorded on the actual Frobenius-density owner, Chebotarev.

Nine one-sentence supplier gaps are registered, each with the identical `What <Supplier> must provide (gap:<slug>)` text under its supplier in README. They are mathematical proof obligations, not claims of implemented APIs: smooth cell comparison; the signed boundary cone; arbitrary-normal-domain torsor gluing; unstable SL₂ Chern lifting; dyadic number-field Chern rank; Witt/Sylow lifting; real Chern/Bockstein compatibility; the symplectic universal-cover kernel; arithmetic-scheme Frobenius detection. The README cannot certify primary proofs of these extra supplier statements from their owners' existing text alone. In particular, the arithmetic-scheme theorem remains a gap, not a consequence of number-field Chebotarev; the dyadic/real-place correction and real Chern-component comparison remain explicit. No missing source request is needed for a source merely named inside AV's proof: those unread primary arguments are supplier obligations, not new certified citations in this package.

## Mathematical corrections and source audit

All three cited works were fetched with the sources service and read from its line-numbered cache. The manifest has exactly three lifetime keys, AV-v1, JRV and Thom, all certified. The redirect of Thom's institutional copy needed the final institutional hostname; it then fetched successfully with the design's hash. No source file or extraction was copied into the package. All AV locators use the 98-page arXiv v1, JRV uses v3 dated 2013, and Thom IV.13 is printed p.81 at Thom line 2527. The published AV edition and the primary works cited only inside AV are not represented as texts read. There are no unresolved missing-text entries.

The Zassenhaus plus-one formula in the design was grammatically attached to an arbitrary isometry. It requires the additional determinant-one, even-dimension and square-total-discriminant hypotheses. For a one-dimensional form B=(3) and A=−1, its unrestricted right side is [2] while the actual spinor value is [3]. The README now scopes that formula to the additional hypotheses and the Lean theorem states the full valid minus-one-primary formula without them. The cross-pairing calculation uses the differential in the second argument; at the rational rotation its two argument placements give 0 and 1. Every denominator has its nonvanishing hypothesis: two is invertible; determinant ratios require 1−M⁻¹ invertible; the final scalar determinant has an explicit nonzero witness; weighted counts have X≥1. The circle differential is written as an arrow between two copies of V, avoiding confusion with an image-subspace target. The relative self-pairing's actual composite and its boundary-cone target are explicit. The general disjoint-union API now carries the determinant-root interchange sign [(-1)^(χhalf(X)χhalf(Y))] explicitly; three-dimensional symplectic evenness then gives the promised multiplicativity. Even term ranks alone do not remove a cohomological root parity: two odd root lines produce −1. This is a normalization clarification, without an asserted geometric counterexample in other dimensions.

| Design source finding | Independent numerical or typed witness | Disposition |
| --- | --- | --- |
| E1, AV-v1 p.8 | Rank two has one e,f pair with self-pairings 0 and cross value 1. | Retain corrected Darboux normalization. |
| E2, AV-v1 Theorem 2.2 | Dimension 4 and coefficient rank 2 are independent parameters. | Reject claimed source error; use j for dimension. |
| E3, AV-v1 pp.16–17 | H₂(SL₂(𝔽₉))=ℤ/3 has 2-torsion subgroup 0, though it is not 0. | Consume odd order, not integral vanishing. |
| E12, AV-v1 line 3076 | Zero d on K has cokernel dimension 1; d=J on K² has image dimension 2. | Perfect alternating quotient is C⁰/ker d, not the cokernel. |
| E13, AV-v1 line 3124 | Acyclic J block occupies degrees 0,1. | Correct the degree table. |
| E14, AV-v1 lines 3260, 3450 | At r=1 the brutal quotient is C⁰ in degree 0; n=−1 uses inverse shift iteration. | Preserve corrected indices. |
| E15, AV-v1 B.6 | Cone term dimensions are c_(n−i)+c_(i+1); scalar cone has degrees −1,0. | Correct Lagrangian and summand labels; r is determined modulo 2. |
| E16, AV-v1 B.6–B.8 | Cohomological root is class (c) of B.6; torsion definition is B.7. | Use actual locators. |
| E17, AV-v1 B.9.2 | N(e)=Ne and N(Ne)=N²e fix the shifted target; the second block uses N^(m₂−1)e₂ and the corrected cross term uses Mf. | Retain index/vector corrections only; printed B.35 diagonal determinant v₁v₂ is unchanged. The primary proof here avoids Jordan logarithms. |
| E18, AV-v1 line 3979 | The referenced left side is already (−1)^(h/2)RT. | Reject claimed source error. |
| E19, AV-v1 lines 565, 3987 | Circle generic raw [−(1+s)] versus special 1; normalized [1+s] specializes to 1. | Separate raw extension from normalized naturality; no claimed geometric three-dimensional counterexample. |
| E20, AV-v1 line 4083 | Hyperbolic 𝔽₃ unipotent fixed restriction has determinant 0, generalized +1 component determinant class 1. | Use generalized eigenspace. |
| E21, AV-v1 lines 4154, 4171, 4183 | All Gaussian intertwining and principal residuals 0 with M⁻¹φ∘t; quotient dimension 4. | State typed action, surface H¹ and explicit word-composition order. |
| E25, AV-v1 pp.82–88 | 𝔽₃ unipotent has h=2, θ=1, raw [−1]. | Supply characteristic-free strict-circle proof, without a logarithm. |
| E26, AV-v1 line 890 | Constant K² on S³: raw [−1], χhalf=2, normalized 1. | Require normalized nonsquare witness. |
| E27, AV-v1 line 881 | Two alternating dominating-block prime sets have liminf 0; union limit 1. | Use zero upper weighted density for exceptions. |
| E28, AV-v1 line 909 | Equal quadratic fields give compositum group order 2, product order 4. | Only individual projections are onto. |
| E29, AV-v1 line 973 | W=0 gives character group size 1 and nonidentity locus size 0. | Require dim W≥1. |
| E30, AV-v1 line 1122 | Spec ℤ[1/2,t] contributes asymptotic Q²/2. | Use positive-order nonsplit lower bound, not a false normalized total of 1. |
| E31, JRV line 774 | Real positive-definite plane has only positive reflection values, hence spinor image {1}. | No unconditional surjectivity claim. |

## Adversarial pass: every retained target

Values in this table are direct small models or explicitly marked uses of supplier normalizations, rather than evidence from the admitted Lean build. An equality was tested on both its positive model and the listed negative control. Full group examples include cyclic C₂, nonabelian S₃ and Q₈. Family tests distinguish fields, the DVR ℚ[s]_(s), equal-characteristic finite fields, ramified generic covers and square-zero rings. Characteristic two is excluded by an actual parity counterexample; characteristic three is included by a unipotent and a lens-space calculation.

| Statement | Instances tried | Computed values on the compared objects | Result / change |
| --- | --- | --- | --- |
| §0.1 Cochain, shift, dual and cone conventions | K —2→ K; Cone(1), Cone(0); degrees 0,1 | shift differential −2; cone cohomology (0,0) versus (K,K); dual-shift coefficients (1,−1) | Retained at the displayed hypotheses. |
| §0.2 Symmetric Poincaré complexes | hyperbolic K⊕K∨[−1]; K —1→ K with zero pairing; skew dimension 3 | adjoint cross determinants (1,1); zero adjoint components, cohomology (0,0); shift gives sign +1 and dimension 1 | Retained at the displayed hypotheses. |
| §0.3 The algebraic boundary | C=0; C=K[0], f=a at a=0,2 | boundary 0; terms in degrees (−1,0), differential 0 or 2, cross values T(x,β)=βx and T(β,x)=βx; adjoint determinants 1 | Retained at the displayed hypotheses. |
| §0.4 Semicharacteristic | zero; constant K² on S³; K in degree 1 | χ=0; 2−0=2; χ≤1=−1 rather than +1 | Retained at the displayed hypotheses. |
| §0.5 Local strictification | hyperbolic rank 1; acyclic zero pairing; sJ over ℚ[s]_(s) | adjoint determinant 1; contractible source→zero strict model; generic/special lower homology dimensions 0,2 | Retained at the displayed hypotheses. |
| §0.6 Parity and local constancy | d=0 rank 1; d=J rank 2; sJ; characteristic 2 rank 1 | term/cohomology lower ranks 1/1, 2/0, 2/(0 or 2); characteristic-two d=1 gives 1/0, a counterexample outside scope | Retained at the displayed hypotheses. |
| §0.7 Splitting a strict symmetric complex | zero; d=J on K²; zero-differential rank-one hyperbolic pair | middle ranks 0,2,0; middle degrees (0,1); lower Q dimensions 0,0,1 | Retained at the displayed hypotheses. |
| §0.8 Cellular Poincaré pairing | positive/negative point; interval; noncompact ℝ | pairing scalars 1,−1; boundary coefficients (−1,+1); ordinary dim H⁰(ℝ)=1 versus dim H¹(ℝ)=0 excludes closed duality there | Specified relative composite and boundary target. |
| §1.1 Parity and inverse conventions for graded lines | grades 0,1 and pair (1,2); right/left evaluation | double-inverse scalars +1,−1; interchange +1 for (1,2); evaluations 1,−1 on an odd line | Retained at the displayed hypotheses. |
| §1.2 Square classes in a determinant line | ℚ line generators e,4e,2e; two odd roots | ratio classes [4]=1, [2]≠1; swapping middle odd factors gives [−1]≠1 | Retained at the displayed hypotheses. |
| §1.3 Reverse-wedge determinant duality | n=0,1,2,3,4; m=n=1; rank-two dual | signs (1,1,−1,−1,1); sign(2)=−1=1·1·(−1); rank-two duality scalar −1 | Retained at the displayed hypotheses. |
| §1.4 Strongly even complexes | zero; rank-one acyclic; diag(1,0):K²→K² | term ranks 0; term ranks (1,1), cohomology (0,0); term ranks (2,2), cohomology (1,1); Euler 0 in each | Retained at the displayed hypotheses. |
| §1.5 Termwise determinants of strongly even complexes | K² in degrees 0,−1; truncation r=1 | determinants det(K²), det(K²)⁻¹; quotient C⁰ in degree 0, not C¹ in degree 1 | Retained at the displayed hypotheses. |
| §1.6 Determinant versus cohomology | zero differential; a=2; shifted two-term pair | identity scalar 1; acyclic volume coefficient 1/2 and ratio 2; shifted ratio 1/2 | Generic map imported; signed adapter retained. |
| §1.7 Lagrangian subcomplexes | coordinate hyperbolic line; zero submodule; (1,1) in diag(1,1) | L=L⊥=K; zero is Lagrangian exactly for ambient zero; B((1,1),(1,1))=2≠0 | Retained at the displayed hypotheses. |
| §1.8 The square class of a Lagrangian | root rescaling by 2; two odd roots; symplectic plane coordinates | root image scales by 4, class unchanged; sum sign −1; both coordinate choices give the class of e∧f | Retained at the displayed hypotheses. |
| §2.1 The symplectic determinant volume | rank 0,2,6; rank 6 over 𝔽₃ | generators 1, e∧f, wedge of three Darboux pairs; last coefficient 1 although 3!=0 | Retained at the displayed hypotheses. |
| §2.2 The Reidemeister cellular volume | positive point; rank-two reversed edge; rank-one reversed edge | fibre generator e; sign (−1)²=1; sign (−1)¹=−1 | Retained at the displayed hypotheses. |
| §2.3 Subdivision and simple cellular invariance | attaching matrices I₂,−I₂,−1; arbitrary based acyclic d=2 | determinants 1,1,−1; based-to-acyclic ratio 2≠1, so quasi-isomorphism alone does not preserve the based generator | Retained at the displayed hypotheses. |
| §2.4 Poincaré duality and cellular volumes | point ranks 2,4; closed three-manifold rank 2 | scalars (−1)^(1·1)=−1, (−1)^(2·1)=+1, (−1)^(1·0)=+1 | Retained at the displayed hypotheses. |
| §2.5 Reidemeister torsion modulo squares | empty; constant K² on S³; rotation circle | RT=1; RT=[−1], χhalf=2, N=1; det(1−A)=2, θ(A)=[Q(e₁)Q(e₁+e₂)]=[2] | Retained at the displayed hypotheses. |
| §2.6 Orientation reversal | empty; constant K² on S³; lower-rank-one hyperbolic algebraic model | reversal multipliers +1,+1,−1; the model has χ≤0=1 and root negation scalar −1 | Retained at the displayed hypotheses. |
| §2.7 Three volumes on an algebraic boundary | C=0; C=K² in degree 0 with n=4, zero pairing; acyclic J block | a=b=c=1; χ(C)=2, χhalf(D)=−2, r≡0 and a=b=c; det J=1 but upper/acyclic root ratio −1 | Retained at the displayed hypotheses. |
| §2.8 Normalized boundary torsion | ∂D⁴ rank 2,4; cylinder boundary | (χhalf,RT,N)=(2,[−1],1),(4,1,1); cylinder normalized product N²=1 | Retained at the displayed hypotheses. |
| §3.1 Low-dimensional oriented bordism and homology | point degrees 0–4; identity circle over Bℤ | positive/negative point maps ±1; both sides 0 in degrees 1–3; degree 4 gives ℤ→0, nonisomorphism; Bℤ circle maps 1 | Generic filtration imported. |
| §3.2 Evenness in dimension three | S³; identity genus-two mapping torus; L(3,1); finite-field quadratic restriction | χhalf=2,−4; lens space χhalf=0 in characteristic 3 and 2 in characteristic 0; multipliers 10,26 vanish modulo 2 | Retained at the displayed hypotheses. |
| §3.3 Even strict models | zero; rank-one strict zero-differential pair; sJ pair | term ranks 0; odd χhalf=1 obstructs all-even stabilization; ranks (2,2) already even despite lower fibre cohomology 0,2 | Retained at the displayed hypotheses. |
| §3.4 Torsion over normal rings | field; nontrivial 2-torsion root line; orthogonal circle family | field value unchanged; nonzero Pic[2] coordinate cannot come from a unit; raw generic [−(1+s)] specializes to [−1] while raw special is 1 | Retained at the displayed hypotheses. |
| §3.5 Normalized torsion in families | constant S³ rank 2; circle family; root rescaling 2 | N=1; generic [1+s] specializes to special 1; root image changes by 4, leaving its class unchanged; s−h=2r cancels the acyclic sign | Retained at the displayed hypotheses. |
| §3.6 The étale Chern transformation | zero cycle; nonzero finite-field cycle at q=3,5; C₂×C₂ UCT control | outputs 0,[−1],[2]; H₂(C₂×C₂;ℤ)[2]=C₂, so integral H₃/2→full mod-two H₃ has a nonzero cokernel | Retained at the displayed hypotheses. |
| §3.7 The normalized torsion transformation | boundary; doubled Gaussian class; constant S³ label | outputs 1, [2]²=1,1; χhalf=2 with raw [−1] still gives constant-label normalized 1 | Retained at the displayed hypotheses. |
| §4.1 Zassenhaus determinant formula | dim 0; dim 1 B=3,A=−1; rational rotation; hyperbolic −I; S₃ and Q₈ | products 1,3,1/2,−1 with spinor classes 1,[3],[2],[−1]; unrestricted plus formula in dim 1 gives [2]≠[3]; three-cycle determinant 1/4 and Q₈ commutator determinant 1, both squares | Corrected plus-one scope; full minus-one formula retained. |
| §4.2 The circle Poincaré complex | A=1,−1, rotation; B=I₂ | (d,P)=(0,B),(2,0); cohomology dimensions (2,2),(0,0); rotation det(1−A)=det(1+A)=2 | Clarified both terms are V. |
| §4.3 The strict two-term sign calculation | rotation x=e₁; identity plane; rotation plane | P(e₁,(1−A)e₁)=0 versus P((1−A)e₁,e₁)=1; identity raw [−1] normalized 1; rotation det P=1/2 gives class [2] | Retained at the displayed hypotheses. |
| §4.4 The circle formula in odd characteristic | I₂; hyperbolic 𝔽₃ unipotent four-space; square-disc even −I | (h,RT,N)=(2,[−1],1),(2,[−1],1),(0,1,1); unipotent θ=1 since its order 3 maps to an exponent-two group | Retained at the displayed hypotheses. |
| §4.5 The orthogonal cohomology of a surface | g=2,r=1,H⁰=0; g=1,H⁰=0; constant genus-two rank 2 | dimensions 4,0,8; the constant system violates H⁰=0 and refutes dimension 4 there; first two discriminant classes 1 | Retained at the displayed hypotheses. |
| §4.6 Torsion of a mapping torus | T=I₄; Gaussian quotient; hyperbolic unipotent linear control | h=4, θ=1; h=0, det(1−T)=2; unipotent h=2, fixed restriction determinant 0 versus generalized-space discriminant 1 | Retained at the displayed hypotheses. |
| §4.7 A genus-two cocycle model | g⁻¹; principal cocycle; both Gaussian systems | φ(g⁻¹)=−ρ(g)⁻¹φ(g); all principal-equivariance residuals 0; dimensions 6−2=4 and determinant ratios 4/2=2,8/2=4 | Added explicit intertwining hypothesis. |
| §4.8 A nonsquare Gaussian torsion class | both exact ℚ(i) systems; word composition in both directions | relators I₂; four intertwining and six principal residual rows all 0; first char6=(x²+1)(x⁴+1), ratio 2; second char6=(x²+1)³, ratio 4; reversed first-word order has nonzero b₂ residual | Retained at the displayed hypotheses. |
| §5.1 Good finite fields | two-element homomorphisms; constant S³ over 𝔽₃; positive-rank stabilization | zero map sends 0,1↦0,0; isomorphism sends 0,1↦0,1; raw [−1] normalizes to 1 on S³; nonzero source remains nonzero under supplied rank isomorphisms | Retained at the displayed hypotheses. |
| §5.2 Chern-liftable square classes | zero; finite-field nonzero; sum of two witnesses | c(0)=0; q=3 generator maps [−1]; c(x+x)=2c(x)=0, so product of identical square classes is 1 | Retained at the displayed hypotheses. |
| §5.3 The transfer lemma | x=0; independent pair; nonzero specialization in span{a} | a=0 fails the nonzero hypotheses; character patterns 00,01,10,11 with 01 contradicting b outside span; remaining scalar choices 0,1 and nonzero fibre selects 1 | Retained at the displayed hypotheses. |
| §5.4 Many liftable classes over number fields | ℚ,ℚ(i), imaginary degree-four field; rational stable Hurewicz | r₂=0,1,2 gives lower image sizes 1,2,4; ℤ/48→ℤ/24 has kernel of size 2 | Retained at the displayed hypotheses. |
| §5.5 Weighted density and controlling extensions | C₂ nonidentity; degree≥2 places; alternating dominating prime blocks | density bound 1/2; tail O(X^(−1/2)log X)→0; both liminf weights 0 but union limit 1; empty S has size 0 and is excluded | Added X≥1; upper-zero condition retained. |
| §5.6 A torsion witness gives a controlling extension | Gaussian normalized [i]; constant S³; α=1 | extension degree 2 and controlling proportion 1/2; S³ normalized 1 despite raw [−1]; α=1 gives degree 1 with 0 nonidentity elements | Retained at the displayed hypotheses. |
| §5.7 Composita of controlling extensions | equal quadratic fields; disjoint quadratics; empty subsets | image sizes 2 versus product size 4; union fraction 3/4; one empty leaves the other inverse image, two empty give size 0 | Retained at the displayed hypotheses. |
| §5.8 Controlling extensions and intermediate fields | M=L; split/inert ℚ(i) primes | multiplicity 1; split prime gives 2 degree-one places of norm p, inert prime gives 1 place of norm p² and negligible upstairs weight | Retained at the displayed hypotheses. |
| §6.1 Independent liftable classes propagate goodness | independent pair; β=α; β=1 | one of four Frobenius patterns gives selected α-value and β=1; square/nonsquare conflicting α=β pattern has 0 elements; β=1 nonsquare locus has 0 elements | Retained at the displayed hypotheses. |
| §6.2 Multiquadratic controlling extensions | dim W=0,1,2; α in a two-space | nonidentity subset sizes 0,1,3; basis β,α+β is independent and avoids α; dimension 0 is excluded | Retained at the displayed hypotheses. |
| §6.3 A disjoint totally imaginary cyclic extension | h=4,r=5,13,17 | (r−1)/h=1,3,4; complex conjugation survives in first two degree-four quotients and dies in the last | Retained at the displayed hypotheses. |
| §6.4 The cubic density improvement | δ=1/2,1/4,0 | h=8,N=4 gain≥7/128≥1/128; h=12,N=6 gain≥5/256≥1/1024; δ=0 has no admissible h for the minimum and is already finished | Retained at the displayed hypotheses. |
| §6.5 Density one for good rational primes | initial ℚ(i)/ℚ class; Gaussian and S³ seeds; prime 2 | initial fraction 1/2; normalized seeds [2]≠1 versus 1; excluded prime weight log 2/X→0 | Retained at the displayed hypotheses. |
| §7.1 Comparison in characteristic zero | Spec ℤ[1/2]; Spec ℤ[1/2,t]; bad-prime tail | normalized total limits 1,1/2; Q^(d−1)o(Q)=o(Q^d); higher-power error O(Q^(d−1/2)log²Q)=o(Q^d) | Retained at the displayed hypotheses. |
| §7.2 Lifting finite-field homology through Witt vectors | Sp₂(𝔽₃); order 8 averaging; characteristic 2; x=0 | group order 24, Sylow order 8, index 3≡1 mod 2; 8⁻¹=2 in 𝔽₃; 8=0 in 𝔽₂ so averaging fails; zero cycle lifts to zero | Retained at the displayed hypotheses. |
| §7.3 Every odd finite field is good | q=3,9; rank 0 | B_r has size 2 at positive rank; exceptional H₂ at q=9 is ℤ/3 with H₂[2]=0; rank-zero H₃=0 | Retained at the displayed hypotheses. |
| §7.4 The transformation comparison | algebraically closed field; 𝔽₃(t); identity and specialization maps | square-class target size 1; field characteristic is 3, forbidding any unital characteristic-zero embedding; identity maps fix values and specialization sends 1+s↦1 | Retained at the displayed hypotheses. |
| §7.5 The topological torsion theorem | constant rank-two S³; Gaussian witness; double and empty | normalized classes [−1]·[−1]=1,[2],[2]²=1,1; corresponding Chern evaluations 1,[2],1,1 | Retained at the displayed hypotheses. |
| §7.6 The mapping-class spinor identity | identity H¹ dimension 4; Gaussian; rotation control | χhalf=−4, normalized θ=1; Gaussian θ=[2],h=0; rotation θ=[1·2]=[2], depending on its actual operator | Retained at the displayed hypotheses. |
| §8.1 The real Chern component and the metaplectic cover | kernel generator 1; rank 0; integral H²(C₂) generator | ℤ→ℤ/4→ℤ/2 sends 1↦1↦1 and β=0; rank-zero kernel 0; reduction of integral degree-two generator is nonzero but its β is 0 | Retained at the displayed hypotheses. |
| §8.2 Vanishing of the real degree-three Chern component | real character t; hypothetical c₃₁=t; zero cycle | β_et(t)=t²≠0; compatibility would give t²=0, impossible; c₃₁(0)=0, or multiplicative class 1 | Retained at the displayed hypotheses. |

## Adversarial pass: API statements

Each API statement below is prose in the README, with no promised Lean declaration. The numbered API position refers to its bullet order inside that subsection. This tests the API facts independently of the headline acceptance signature.

| Statement | Instance and computed comparison | Result / change |
| --- | --- | --- |
| §0.2 API 1: Recover the bilinear degree-n pairing and its symmetry and closedness laws. | hyperbolic cross matrices 1 and 1 satisfy symmetry and d=0 gives closedness 0=0 | Retained under the subsection hypotheses. |
| §0.2 API 2: The associated cochain map C→C∨[−n]. | hyperbolic adjoint matrices 1,1 | Retained under the subsection hypotheses. |
| §0.2 API 3: Shift by one changes dimension by −2 and symmetry sign by −1. | (ε,n)=(−1,3) maps to (+1,1) | Retained under the subsection hypotheses. |
| §0.2 API 4: Strictness is equivalent to every component of the adjoint being an isomorphism. | component matrices 1,1 invertible; zero-pairing acyclic example has component 0 noninvertible | Retained under the subsection hypotheses. |
| §0.3 API 1: Construct the boundary with the displayed signed cross pairing. | n=0 scalar cone cross values βx and βx | Retained under the subsection hypotheses. |
| §0.3 API 2: Its adjoint is an isomorphism. | scalar cone adjoint matrices 1 in both complementary degrees | Retained under the subsection hypotheses. |
| §0.3 API 3: The inclusion C∨[−n]→∂alg C has quotient C[1]. | degrees (−1,0) project onto K in degree −1 with kernel K∨ in degree 0 | Retained under the subsection hypotheses. |
| §0.3 API 4: Isometries of C induce isometries of its boundary. | identity and multiplication by −1 on scalar C induce cross-pairing scalar products (−1)²=1 | Retained under the subsection hypotheses. |
| §0.4 API 1: Return the finite alternating cohomology sum at a cutoff. | rank-two S³ value 2 | Retained under the subsection hypotheses. |
| §0.4 API 2: Quasi-isomorphic complexes have the same value at every cutoff. | K —1→ K and zero have χ≤m=0 at every m | Retained under the subsection hypotheses. |
| §0.4 API 3: The integer is additive under finite direct sums. | two S³ plane systems give 2+2=4 | Retained under the subsection hypotheses. |
| §0.4 API 4: For support [0,3] the midpoint value is dim H⁰−dim H¹. | S³ dimensions (2,0) give 2−0=2 | Retained under the subsection hypotheses. |
| §0.8 API 1: The pairing on a closed oriented cellular model. | positive point gives the original matrix B; negative point gives −B | Retained under the subsection hypotheses. |
| §0.8 API 2: The absolute/relative adjoint realizes Poincaré–Lefschetz duality. | interval relative H¹=K and absolute H⁰=K have perfect pairing 1 | Retained under the subsection hypotheses. |
| §0.8 API 3: The algebraic boundary of the compactly supported/relative pairing models boundary cochains with the boundary orientation. | oriented endpoint multiplicities −1,+1 | Retained under the subsection hypotheses. |
| §1.2 API 1: The class of a nonzero vector in a line. | e and 4e have ratio square 4; e and 2e have ratio nonsquare 2 | Retained under the subsection hypotheses. |
| §1.2 API 2: The canonical class of A⊗A. | root generator 2l gives 4(l⊗l) | Retained under the subsection hypotheses. |
| §1.2 API 3: The ratio of two classes in the same line is a scalar square class. | coordinate classes of e and 2e have ratio [2] | Retained under the subsection hypotheses. |
| §1.2 API 4: Moving two root lines of parities a,b past one another multiplies the resulting square class by [(-1)^{ab}]. | odd/odd sign −1; even/odd sign +1 | Retained under the subsection hypotheses. |
| §1.3 API 1: The unit (−1)^{n(n−1)/2} over a field. | n=0,1,2,3,4 gives signs 1,1,−1,−1,1 | Retained under the subsection hypotheses. |
| §1.3 API 2: The determinant-dual line equivalence with this normalization. | rank-two reversed dual wedge has coefficient −1 | Retained under the subsection hypotheses. |
| §1.3 API 3: The duality/shift square is commutative with the signed double-inverse identification. | odd-line double inverse −1 cancels the signed degree-one dual-shift −1, giving comparison scalar +1 | Retained under the subsection hypotheses. |
| §1.3 API 4: Dimension-addition rule for the reverse-wedge sign. | m=n=1 gives −1=1·1·(−1) | Retained under the subsection hypotheses. |
| §1.4 API 1: Every term has even rank. | zero ranks 0; rank-two terms 2; rank-one acyclic terms 1 fail | Retained under the subsection hypotheses. |
| §1.4 API 2: Every integer shift of a strongly even complex is strongly even. | shifted rank-two term remains rank 2 in the new degree | Retained under the subsection hypotheses. |
| §1.4 API 3: The dual has the same parity condition. | dual of K² has rank 2 | Retained under the subsection hypotheses. |
| §1.4 API 4: A direct sum of strongly even complexes is strongly even. | two K² terms add to rank 4 | Retained under the subsection hypotheses. |
| §1.4 API 5: The Euler characteristic of a bounded strongly even complex is even, over each field fibre. | Euler of rank-two degree-zero complex is 2; of rank-two two-term complex is 0 | Retained under the subsection hypotheses. |
| §1.6 API 1: The determinant isomorphism from C to its graded cohomology. | zero differential gives scalar 1, acyclic a=2 gives ratio 2 | Retained under the subsection hypotheses. |
| §1.6 API 2: Naturality for quasi-isomorphisms. | identity quasi-isomorphism scalar 1; scaling both terms of d=1 by 2 has determinant ratio 2/2=1 | Retained under the subsection hypotheses. |
| §1.6 API 3: Compatibility with the chosen duality and shift. | shifting a=2 inverts ratio to 1/2; reversed rank-two dual wedge scalar −1 | Retained under the subsection hypotheses. |
| §1.6 API 4: For an injection A→B, identify the cone determinant with the quotient determinant using the exact triangle and shift. | identity injection K→K has cone acyclic d=1 and quotient zero, both determinant scalars 1 | Retained under the subsection hypotheses. |
| §1.7 API 1: The isotropic inclusion into C. | coordinate line in hyperbolic plane has B(e,e)=0 | Retained under the subsection hypotheses. |
| §1.7 API 2: The quotient is the prescribed shifted dual of L. | hyperbolic quotient dimension 2−1=1=dim L∨ | Retained under the subsection hypotheses. |
| §1.7 API 3: The first summand of L⊕L∨[−n] is Lagrangian. | first coordinate line equals its orthogonal complement | Retained under the subsection hypotheses. |
| §1.7 API 4: For strict odd-dimensional C, its upper brutal truncation is Lagrangian. | dimension 1 strict hyperbolic complex has upper L in degree 1 and quotient K in degree 0 | Retained under the subsection hypotheses. |
| §1.8 API 1: The distinguished square class in det C. | symplectic plane coordinate L gives [e∧f] | Retained under the subsection hypotheses. |
| §1.8 API 2: Isometries carrying L to L′ carry their classes to one another. | symplectic rescaling (e,f)↦(2e,f/2) has wedge scalar 1 | Retained under the subsection hypotheses. |
| §1.8 API 3: The direct-sum formula includes (−1)^{χ(L₁)χ(L₂)}. | χ(L₁)=χ(L₂)=1 gives direct-sum correction −1 | Retained under the subsection hypotheses. |
| §1.8 API 4: For strongly even L, it is the product of the paired-degree vector-space volumes. | even L ranks 2,2 give all commutation exponents divisible by 2 and total scalar 1 | Retained under the subsection hypotheses. |
| §2.1 API 1: The canonical determinant generator for a finite projective symplectic module. | rank 0 generator 1, rank 2 generator e∧f | Retained under the subsection hypotheses. |
| §2.1 API 2: Symplectic isometries preserve the generator. | diag(2,1/2) has determinant 1 | Retained under the subsection hypotheses. |
| §2.1 API 3: The generator commutes with extension of scalars. | rank-six Darboux wedge has coefficient 1 over ℚ and 𝔽₃ | Retained under the subsection hypotheses. |
| §2.1 API 4: The associated square class agrees with the vector-space Lagrangian construction. | both coordinate lines in symplectic K² give the same class [e∧f] | Retained under the subsection hypotheses. |
| §2.2 API 1: The determinant generator of the relative cochain model. | one zero-cell generator is the fibre generator | Retained under the subsection hypotheses. |
| §2.2 API 2: Orientation, ordering and volume-preserving cell trivializations leave the generator unchanged. | rank-two orientation reversal determinant +1; swapping two rank-two blocks sign (−1)^4=1 | Retained under the subsection hypotheses. |
| §2.2 API 3: For A⊂X, the absolute generator factors as the relative generator followed by the generator of A. | for interval and its endpoints the relative/absolute factorization has the same degree-zero determinant coefficient 1 | Retained under the subsection hypotheses. |
| §2.2 API 4: The determinant generator commutes with base change of the coefficient system. | the standard Darboux wedge coefficient 1 maps to 1 under ℚ→ℚ(i) | Retained under the subsection hypotheses. |
| §2.5 API 1: The scalar square class e_X/ν_{H^{>m}}. | constant S³ e/ν=[−1] | Retained under the subsection hypotheses. |
| §2.5 API 2: Oriented homeomorphisms with compatible smooth cell models and local-system isometries preserve RT. | identity oriented map sends [−1] to [−1] | Retained under the subsection hypotheses. |
| §2.5 API 3: Signed disjoint-union law, with multiplicativity for dimension-three symplectic systems. | two S³ planes have χhalf=2,2 and sign (−1)^4=1, giving [−1]²=1; two abstract odd roots have sign −1 | Retained under the subsection hypotheses. |
| §2.5 API 4: For acyclic coefficients RT agrees with the cellular determinant torsion with these fixed sign conventions. | rotation acyclic pair has det(1−A)=2 and torsion [2] | Retained under the subsection hypotheses. |
| §3.4 API 1: The unique extension of generic torsion to H¹(R,μ₂). | circle generic [−(1+s)] has unit extension over ℚ[s]_(s) | Retained under the subsection hypotheses. |
| §3.4 API 2: Restriction to the fraction field is the field-valued torsion. | restriction gives [−(1+s)] in ℚ(s) | Retained under the subsection hypotheses. |
| §3.4 API 3: Restriction to a localization agrees with the same generic extension. | further localization leaves the same rational unit −(1+s) | Retained under the subsection hypotheses. |
| §3.4 API 4: A strict model represents it by its root line with the generic acyclic sign correction. | generic sJ has rank 2 and root comparison sign −1; special zero differential has rank 0 and sign +1 | Retained under the subsection hypotheses. |
| §3.5 API 1: The normalized μ₂-torsor class over R. | constant rank-two S³ gives class 1 | Retained under the subsection hypotheses. |
| §3.5 API 2: The field-fibre value includes its own semicharacteristic half-sign. | circle fibre h=2 raw [−(1+s)] gives [1+s]; h=4 raw 1 gives 1 | Retained under the subsection hypotheses. |
| §3.5 API 3: Every map of normal domains preserves the normalized class. | specialization maps [1+s] to [1]=1 | Retained under the subsection hypotheses. |
| §3.5 API 4: On a strongly even strict shifted model use the lower-half term rank s. | with s₀=2, generic h₀=0 and r=1, exponents s₀/2+r=2 and h₀/2=0 agree modulo 2 | Retained under the subsection hypotheses. |
| §3.6 API 1: The homomorphism from integral H₃ modulo two. | zero integral cycle gives zero additive class | Retained under the subsection hypotheses. |
| §3.6 API 2: It commutes with maps of normal Z[1/2]-domains. | identity coefficient map gives same class [2] over 𝔽₅ | Retained under the subsection hypotheses. |
| §3.6 API 3: For every odd finite field it is the finite-rank K-theoretic isomorphism. | q=3 source generator gives [−1]≠1; q=5 gives [2]≠1 | Retained under the subsection hypotheses. |
| §3.6 API 4: Block inclusion of symplectic groups preserves the evaluated class. | the supplied positive-rank stabilization sends the nonzero two-element source generator to the nonzero generator | Retained under the subsection hypotheses. |
| §3.7 API 1: The homomorphism N_R on B_r(R). | N(0)=1 and N(2x)=N(x)²=1 | Retained under the subsection hypotheses. |
| §3.7 API 2: Its value on a labelled manifold is the normalized torsion. | S³ rank-two label gives (−1)·(−1)=1 | Retained under the subsection hypotheses. |
| §3.7 API 3: Every map of normal domains commutes with N. | circle strict-model specialization sends [1+s] to 1 on both sides | Retained under the subsection hypotheses. |
| §3.7 API 4: Adding a constant symplectic summand preserves N, since its normalized torsion is trivial. | adding a constant rank-two S³ factor multiplies normalized class by 1 | Retained under the subsection hypotheses. |
| §4.2 API 1: The two-term complex and its signed pairing. | A=−I gives d=2I,P=0; A=I gives d=0,P=B | Retained under the subsection hypotheses. |
| §4.2 API 2: Strictness is equivalent to invertibility of 1+A. | det(1+A)=0 for −I and 4 for I₂ over ℚ | Retained under the subsection hypotheses. |
| §4.2 API 3: H⁰=ker(1−A), H¹=coker(1−A), naturally paired by B. | at I₂ both H⁰,H¹ have dimension 2; at −I₂ both have dimension 0 | Retained under the subsection hypotheses. |
| §4.2 API 4: The same basis in both degrees gives the based generator independently of basis. | basis rescaling by u contributes det u/(det u)=1 | Retained under the subsection hypotheses. |
| §4.7 API 1: Evaluate a crossed homomorphism on a word from its generator values. | φ(g g⁻¹)=ρ(g)(−ρ(g)⁻¹φ(g))+φ(g)=0 | Retained under the subsection hypotheses. |
| §4.7 API 2: The quotient by principal cocycles is the stated V³/ι(V). | rank-two quotient dimension 6−2=4 | Retained under the subsection hypotheses. |
| §4.7 API 3: The action is M⁻¹φ∘t and preserves ι(V). | both Gaussian principal-equivariance residuals are zero matrices | Retained under the subsection hypotheses. |
| §4.7 API 4: The quotient determinant identity follows from the equivariant short exact sequence. | determinant products 4=2·2 and 8=2·4 | Retained under the subsection hypotheses. |
| §5.1 API 1: The predicate N=c_et on the finite-field integral quotient. | on two-element groups identity map has values (0,1), zero map (0,0) | Retained under the subsection hypotheses. |
| §5.1 API 2: Goodness is equivalent to existence of a nonzero normalized value. | identity has nonzero value 1; zero map has none | Retained under the subsection hypotheses. |
| §5.1 API 3: The criterion is independent of positive symplectic rank. | positive-rank stabilization is an isomorphism of two-element sources, sending 1↦1 | Retained under the subsection hypotheses. |
| §5.2 API 1: Membership in the image of c_et. | zero is in the image c(0)=0 | Retained under the subsection hypotheses. |
| §5.2 API 2: A class with this predicate has a finite-rank integral homology witness modulo two. | nonzero finite-field class has its unique nonzero two-element source witness | Retained under the subsection hypotheses. |
| §5.2 API 3: The liftable classes form an F₂-subspace. | c(x+x)=0 while c(x)+c(x)=0 | Retained under the subsection hypotheses. |
| §5.2 API 4: Ring maps send liftable classes to liftable classes. | q=3 to q=9 sends [−1] to the trivial class since −1 becomes a square | Retained under the subsection hypotheses. |
| §5.5 API 1: The logarithmically weighted counting function divided by X. | finite set {v} has count (log Nv)/X for X≥Nv, limit 0 | Retained under the subsection hypotheses. |
| §5.5 API 2: A finite Galois extension, a nonempty conjugacy subset and a zero upper-density bad set. | C₂ nonidentity S has size 1 versus group size 2 | Retained under the subsection hypotheses. |
| §5.5 API 3: The lower density of good places is at least |S|/|Gal(E/L)|. | good-place lower weighted bound is 1/2−0=1/2 | Retained under the subsection hypotheses. |
| §5.5 API 4: Changing finitely many places leaves the condition unchanged. | adding one place changes weight by at most log Nv/X→0 | Retained under the subsection hypotheses. |

## Adversarial pass: conventions, supplier interfaces and extra Checks

| Statement | Instances and computed values | Result / change |
| --- | --- | --- |
| Nonzero-domain family convention | Zero ring has 0=1, one module and empty spectrum; ℚ[ε]/ε² has ε≠0 and ε²=0. | General linear algebra admits these rings; family claims exclude both as nonzero normal domains fail. |
| Compact smooth closed convention | ℝ has ordinary H⁰ dimension 1 and H¹ dimension 0, unlike closed one-dimensional duality. | No noncompact manifold statement. |
| Rank and support convention | Rank 0 has determinant 1 and H₃ source 0; unbounded sums of one-dimensional terms have no finite alternating sum. | Finite projectivity and boundedness retained. |
| Shift/dual/tensor convention | a=2 shifts to −2; degrees p=q=1 interchange with −1; dual-shift at q=0,1 has 1,−1. | Same witness in Layers 0–4 and determinant supplier. |
| Determinant convention | a=2 gives acyclic volume 1/2 times basis, ratio 2; its shift gives ratio 1/2; reversing two wedges gives −1. | The inverse scalar is explicit, rather than an unspecified a-or-inverse convention. |
| Unsigned Gram and reflection convention | B=3,A=−1 gives θ=[3]; polar B has coefficient 6; on an even reflection word the rescaling factor is 2². | Associated-form diagonal Q and no extra dimension sign. |
| Integral versus full mod-two homology | C₂×C₂ has H₂=∧²(C₂×C₂)=C₂; its H₂[2]=C₂ contributes a nonzero UCT cokernel. | No generic identification; full real domain has separate proof. |
| Frobenius and weighted-count convention | In a quadratic quotient Frob and inverse coincide; norms are ≥2; X≥1, so X⁻¹ exists. | No q=1 residue field or X=0 denominator admitted. |
| Smooth/simple supplier | Elementary attaching I₂ and −I₂ both have determinant 1; rank-one −1 has determinant −1. | Exact volume-compatible smooth comparison gap retained. |
| Boundary-cone supplier | Relative interval pair has absolute H⁰=K, relative H¹=K and endpoint orientation vector (−1,1). | Signed cone, not homology groups alone. |
| Labelled-bordism supplier | Point maps ±1; constant circle maps 0; identity Bℤ-circle maps 1. | Generic construction removed here; labels retained. |
| Normal torsor gluing supplier | Generic √s over ℚ[s]_(s) has ramification index 2; √(1+s) is étale and has special square class 1. | No extension of arbitrary generic torsor inferred from normality. |
| Finite-field K-theory supplier | q=3,5 restriction multipliers 10,26 are even; q=9 multiplier H₂=ℤ/3 has no 2-torsion. | Odd order retained at the exceptional field. |
| Chern normalization supplier | Finite-field nonzero values are [−1] at q=3 and [2] at q=5; at q=5 [−1]=1 would be wrong. | Genuine finite-rank Chern map consumed. |
| Dyadic/unstable supplier | ℚ: stable Hurewicz kernel has order 2; ℚ(i): r₂=1 needs an image with at least 2 elements. | Precise corrected gaps, without assuming integral K₃≃H₃. |
| Witt congruence supplier | In 𝔽₃, 8·2=1; in 𝔽₂, 8=0. | Averaging restricted to odd characteristic. |
| Chebotarev number-field supplier | C₂ nonidentity fraction 1/2; disjoint quadratic union fraction 3/4; finite exceptional weight O(1/X). | Natural weighted density used. |
| Arithmetic-scheme supplier | Spec ℤ[t] d=2 has degree-one weight Q²/2; Spec 𝔽₃ has one Frobenius detecting its unique nontrivial torsor and H¹-dimension 1. | Positive lower bound only in characteristic zero; no impossible pair of independent classes on Spec 𝔽₃. |
| Universal-cover and metaplectic supplier | Positive-rank kernel generator maps 1 in ℤ to 1 in ℤ/4 and ℤ/2; rank-zero kernel 0. | Positive-rank restriction and central normalization retained. |
| Real Chern Bockstein supplier | β_et(t)=t²≠0 on C₂; integral-lifted degree-two class has group β=0. | Separate full-domain comparison, not an inference from integral cycles. |
| Denominators and junk inputs | a=0 yields nonacyclic two-term complex; det(1−M⁻¹)=2 in both Gaussian examples; 2=0 in characteristic 2; at s=−1, 1+s=0 cannot be an image of a unit of ℚ[s]_(s). | Every division has its displayed hypothesis; the invalid specialization is not a ring map. |
| Natural subtraction and indices | n=0,1,2 gives n(n−1)/2=0,0,1; the Lean basis uses Fin(finrank), with no out-of-range basis vector. | Empty determinant 1; no negative natural index. |
| Nonabelian controls | In S₃ the transposition commutator is a three-cycle with θ=[2]²=1 and determinant factor 1/4; in Q₈ the commutator −I₄ has θ=disc I₄=1. | Homomorphism formulas tested beyond cyclic groups. |
| Strict versus derived nondegeneracy | d=1 with zero pairing has zero cohomology and a zero adjoint component, whereas the zero strict model has its unique adjoint isomorphism. | Distinct predicates retained. |
| Definition model discrimination | Half-dimensional line (1,1) in diag(1,1) has self-pairing 2, unlike isotropic coordinate line in a hyperbolic plane; zero subcomplex is Lagrangian only for zero ambient. | Exact shifted-dual quotient and isotropy both retained. |

The source exponent, basis and map-direction examples have been recomputed in each place they are used. No zero-ring, inseparable-field or nonreduced extension is silently treated as a characteristic-zero embedding. Scalar extension in the field theorem allows inseparable extensions; its proof uses finite bar data and normalization inside the target field, not separability. The norm-count and finite-field group formulas exclude q=1 by the field hypotheses. Polynomial degrees and infinite fans have no carrier in these statements. Unused witnesses such as stable-image invariance are not asserted independent necessities: that witness is automatic from commutation with its own power and makes the native restriction map explicit.

## Exact Gaussian recomputation

Both surface relators evaluated to I₂; all four intertwining differences and every row of the principal-plane equivariance difference were zero. With twists applied successively to words, the first t is T₁∘T₃∘T₂∘T₄∘T₄. Its characteristic polynomial on six cocycle coordinates is x⁶+x⁴+x²+1; quotienting by the principal plane divides by x²+1 and gives x⁴+1. The numerator/denominator determinants are 4 and 2, so h=0 and N=[2]=[i]≠1. The second six-dimensional polynomial is x⁶+3x⁴+3x²+1; quotient polynomial (x²+1)² and determinants 8 and 2 give N=[4]=1. All arithmetic used rational real and imaginary parts. A reversal of the first word-composition order was tried as a negative control: its b₂ intertwining residual is nonzero, even though a bare determinant computation can still return 4. This is why intertwining and the invariant principal plane were checked before division.

## Elaboration, binder audit and mechanical checks

The required `lake env lean` command was run from the content checkout on the absolute package path of `packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean`. Its first attempt identified the missing imported object file. The allowed targeted command `lake build TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic` completed successfully (2239 jobs). The corrected file then elaborated with exit code 0, exactly **1** `sorry` warning and **no other messages**. Its diagnostic, with only the machine-specific filename prefix replaced by the repository-relative path, was:

```text
packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean:40:8: warning: declaration uses `sorry`
```

A single scratch Lean file containing the acceptance signature and `#check @TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula` was elaborated once. Its printed type retained `[Field K]`, `[Invertible (2 : K)]`, `[AddCommGroup V]`, `[Module K V]`, `[FiniteDimensional K V]`, the explicit Q and nondegeneracy witness, the actual orthogonal element, stable-kernel basis, stable-image invariance witness and nonzero product determinant. This agrees with README §4.1 at arbitrary rank and on the full orthogonal group. The only elaboration correction was qualifying the carrier as `TauCeti.QuadraticMap.orthogonalGroup`; no hypothesis was lost, added to conceal the conclusion, or recovered through a section variable. There are no new definitions, instances, `set_option` commands or admitted examples.

Pinned declaration evidence was read directly: `CochainComplex` at `Mathlib/Algebra/Homology/HomologicalComplex.lean:157`; `HomologicalComplex.homology` at `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:89` requires its homology-existence instance; `groupHomology` at `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:228` takes a representation and does not itself assert a transfer theorem; `Sylow` at `Mathlib/GroupTheory/Sylow.lean:54` is a maximal p-subgroup; `SymplecticGroup.det_eq_one` at `Mathlib/LinearAlgebra/SymplecticGroup.lean:385` holds over a commutative ring. Square classes at `TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`, `:72`, `:83` are the additive quotient, multiplicative homomorphism and square criterion; the map at `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean:149` has field source/target hypotheses. Orthogonal-group preservation is its actual carrier condition at `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:180`; the spinor definitions and reflection formula are at `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:96`, `:121`, `:143`, `:149`. Associated bilinear form and its matrix carrier are at `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:962`, `:1210`. No library-presence claim depends on a newer checkout.

`roadmaps resolve` found no missing cross-roadmap citation and no missing roadmap Lean name. It additionally printed `Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host.` That resolver limitation is not a library-absence finding: the actual pinned package directories and revisions were independently read and the signature compiled against them. The package's only owned backticked declaration is present in Suggested.lean. The source-manifest checker reported 0 problems. The candidate dependency invocation also returned success.

The required dependency check was run with the package README, name SymplecticReidemeisterTorsionModSquares, `merge-order/ORDER.txt` and `--movable`. Output:

```text
depcheck: 51 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No tooling, merge-order file, content checkout source, pin or top-level roadmap list was edited. The six deliverable paths are the package README, Suggested.lean, metadata.toml, sources.toml, design/plan.json (gaps only) and this report.
