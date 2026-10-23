<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/952#issuecomment-6376382778 -->
Review (codex) of cf15f63

Verdict: accepted
Conditional on the announced gaps: `smooth-whitney-extension`, `flat-ideal-regular-situation`

1. **F01** (P3) Name the product prerequisite of the support fiber

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:462`: “agrees with forgetting support and the product of Layer 4”; its Needs line is at line 471. The corresponding prerequisite list is `packages/MotivicEtaleKTheory/design/plan.json:930`.

   **Claim.** The target's Needs line lists the inputs to all its API assertions.

   **Witness.** Section 5.1's third API assertion uses the product constructed in §§4.1–4.2, but neither its Needs line nor its plan prerequisite list names either section. Section 3.4 constructs the complex and its comparisons, before the product layer.

   **Exact repair.** Add `§4.2` to §5.1's Needs line and `target:4.2` to that target's prerequisites. This is an omitted edge to an existing earlier owner, not an unowned prerequisite.

   **Repair test.** For the coordinate divisors V(x), V(y) in the complex plane squared, the supported product is the origin class with coefficient 1. Section 4.2 supplies the product used by this assertion. The added edge runs from Layer 4 to Layer 5 and introduces no cycle.

2. **F02** (P3) Include E0.6 in the Layer 6 dependency summary

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:593`: “EnhancedDerivedSheaves §§0.1–0.4, E2.6.”

   **Claim.** The layer summary includes its targets' supplier inputs.

   **Witness.** Section 6.2's Needs line at line 571 explicitly includes EnhancedDerivedSheaves §E0.6. Its plan prerequisites also include E0.6; the layer summary does not.

   **Exact repair.** Change the EnhancedDerivedSheaves clause at line 593 to `§§0.1–0.4, E0.6, E2.6`.

   **Repair test.** The non-strict square of §6.2 still sends 1 to (1,1), with differential (0,0); the wrong sign gives (0,2). The added summary reference resolves to `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259`, the dg-nerve comparison. It adds no new mathematical assumption or graph edge beyond the existing target prerequisite.

Two P3 findings; no P1 or P2 findings. Acceptance is conditional on the declared supplier contracts `smooth-whitney-extension` and `flat-ideal-regular-situation`. These are precise, owned contracts, not defects. The seven findings in the preceding review are repaired. No design or source-manifest entry was changed by this review.

## Verified sound

The review covered all 27 plan targets, all 49 API entries, all 96 target Checks, the six gap Checks, conventions and proof routes. The 88-row table below records computations for each target and each API entry separately. The previous review's computed rows were used as baseline evidence for unchanged statements; sampled and repaired passages were read again, and API assertions not individually tested there were tested here. Checks are mathematical tests, not proofs of the general theorems.

### Previous findings checked first

All locations in this table refer to `packages/MotivicEtaleKTheory/design/README.md` unless stated otherwise.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, cube scope and Coleman ownership | repaired | Line 200: “For every regular Noetherian separated finite-dimensional scheme X with an ample family of line bundles”. The same sentence allows open Y and restricted faces. Line 674 names only ColemanIntegration §L3.Fa.2. The plan has identical hypotheses. Spec ℤ₂ and the localized cube over ℤ₃ now qualify. |
| F02, rational weights | repaired | Line 200: “on Kₘ^S(Y;∂□ⁿ)⊗ℚ”. Line 216 computes the index-two integral obstruction on ℙ²; its rational expression for h is correct. |
| F03, premature identification | repaired | Line 242: “Section 2.2 separately identifies this inverse with §2.0b’s universal-class character.” Section 2.1 has only its component/naturality API; the duplicate universal-class API and plan label are absent. Section 2.2 retains the identification. |
| F04, degree-two sign test | repaired | Line 271: “Its regulator is i log 2 darg t with positive-circle period 2πi log 2≠0”. Both characters are tested on {2}·{t}; reversed loop order gives the negative nonzero class. |
| F05, Layer 2/5/7 summaries | repaired | Lines 314, 535 and 668 respectively include “MotivesAndAlgebraicCycles §4.8a”, “ComplexKahlerGeometry K1–K2” and “AlgebraicTopology Stage 8, item 2; EnhancedDerivedSheaves §E2.6”. All specifically requested additions are present. Searching the same pattern elsewhere found R02. |
| F06, bifiltered comparison | repaired | Line 341: “maps by a bifiltered quasi-isomorphism for (W,F)”. The plan agrees. Line 347 puts dlog z in W₁ on both fixed-pair complexes; its cohomological weight is 2. Refinement invariance is still only F-filtered. |
| F07, timeless ownership wording | repaired | Line 13: “The shared auxiliary complexes Aₚ, Aₚ,S and Hₚ, the logarithmic Green-current criterion and its normalized even-degree pairing are §§5.2–5.3 here”. The downstream paragraph agrees, and the historical PeriodsAndSpecialValues sentence is absent. |

The older naming/scope allocation issue remains settled: the preceding review explicitly accepted the maintainer-only reason for not renaming the roadmap. No new claim of étale descent is made here, so that reason has not been disproved. The earlier cone-sign, supplier, gap-splitting and general smooth-separated-scope repairs also survive.

The recurrence search covered rational versus integral weights, field-only cube hypotheses, duplicated universal-class identification, missing dependency entries, F versus (W,F), ownership-change wording, positive/negative logarithms, cone-map signs and the old consumer labels. Only R01–R02 remain locally actionable.

### Principles and shape

The design imports the existing simplicial cycle theory, ordinary scheme K-theory, degree-zero Chern theory, analytic current calculus and linear Hodge theory. Its new objects are the cubical/mixed adapters, higher comparison, smooth logarithmic model and universal realization. No existing roadmap is re-planned. The regular-base cube construction and arbitrary-field algebraic comparison contain no good-prime restriction. The complex embedding is an explicit hypothesis of the archimedean realization.

All seven layers have Examples and Dependencies. All eight definitions and six constructions have an API and at least three Checks; theorem statements have hypotheses and locators. The README and plan agree on target scope, coefficient choices, maps and tests. Definitions have concrete constructions, not free predicates containing their conclusions. No computational algorithm, copied source passage, sorry'd data, `set_option`, forbidden Lean `lemma`, process label or machine path was found in the design. Source wording was compared with the sampled passages. API names in the plan are specifications, not declarations in an acceptance file.

For upstream shape, I read `TauCetiRoadmap/AlgebraicTopology/README.md`, `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and `TauCetiRoadmap/DifferentialGeometry/README.md` on main. The target has the requested expanded prose/API/Checks shape.

### Seeded sources

There are ten manifest works: seven legally cached readable texts, two settled uncertified works and one settled waived work. No additional source was required. There is no locator flagged `unverified`; the explicit uncertified Bloch86 citations were preserved as such. Printed pagination, rather than PDF index, is used below.

| Sample target | Text and locator read | Hypotheses, conclusion and convention checked |
| --- | --- | --- |
| 1.3 Integral comparison and supports | BFT line 948, line 961, Proposition 6.12, pp.19–20; Levine94 line 1735, line 1767, Lemma 4.6 and Theorem 4.7, pp.295–296 | Equidimensional quasi-projective schemes over a field; integral axis quasi-isomorphisms. Supported fibers and derived coefficients are exact-functor consequences, not an assertion about ordinary tensor of homology. |
| 2.0b Universal motivic Chern classes | BF line 961 through line 997, §3.2, pp.21–22 | Flat-face simplicial cycles, universal classes, transcendental moving and specialization are described over ℂ. Arbitrary fields are explicitly attributed to uncertified Bloch86 §7, not certified from BF. |
| 2.2 Weights and higher comparison | Levine94 line 1210 through line 1269, Theorem 3.1, pp.276–278; BF line 905 and line 919, Theorem 3.5/proof, pp.20–23 | Smooth quasi-projective source; rational weight isomorphism. The inverse/universal-class identification retains its uncertified Bloch86 attribution. The infinite-field input is not silently promoted: see the source issue and supplied descent below. |
| 2.4 Products and degree-zero agreement | BF line 948 through line 997, pp.21–22; Levine94 line 2210 through line 2240, Theorem 5.2, pp.312–313 | Rational products on smooth quasi-projective schemes, homological-degree sign, usual degree-zero character. Newton coefficients give 1, −1, 1/2 in positive degree. |
| 3.1 Smooth logarithmic Dolbeault algebra | Burgos94 line 155 through line 192, §2, pp.65–67; BKK line 4217, Definition 5.20, p.116 | Actual image subalgebra generated by log, holomorphic and antiholomorphic logarithmic differentials, not the noninjective smooth tensor presentation. |
| 3.3 Deligne functor | BKK line 3999 through line 4111, Definitions 5.7–5.10, Remark 5.11, Proposition 5.12, pp.111–113 | Bounded-below real Dolbeault complex; arrow f−a, all three differential cases, inclusion, projection and homotopy. Arbitrary integer twists are meaningful because 2πi is nonzero. |
| 4.2 Associativity and choices | BKK line 4142 through line 4149, Proposition 5.15, p.114; BF line 506, Proposition 1.26, p.10 | Natural associator homotopy; its vanishing on even critical triples requires no closedness in BKK. BF's codomain-degree misprint is not inherited. |
| 5.2 Semipurity with singular support | BF line 530 through line 552, (1.30), Proposition 1.31, p.11; BKK line 4795 through line 4847, §5.6/Proposition 5.58, pp.132–133 | Smooth ambient scheme; arbitrary algebraic singular support; codimension bound; component multiplicities; both directions of the current criterion; normalized cycle pairing. |
| 5.3 Auxiliary support resolution | BF line 705 through line 785, §§2.4–2.5, pp.15–17; BFT line 250 through line 275, Proposition 4.3, pp.6–7 | Infinity normalization, support colimit, good truncation, total degree r−n and differential d_D+(−1)ʳδ before J-transport. |
| 5.4 Cycle classes and affine contraction | BF line 720, line 741, line 753, line 766, Proposition 2.8, Corollary 2.9, Lemma 2.11, Proposition 2.13, pp.15–17 | All three specified comparison maps, affine invariance, vanishing normalized positive columns, finite-width convergence. Products use BF line 1445's additional (−1)ⁿˢ. |
| 6.2 Restriction homotopies and supports | BF line 319, Lemma 1.10, p.7; line 862 through line 885, §3.1/Proposition 3.3, p.19; BFT line 277, p.7 | Strict flat restriction of the roof, derived inversion and induced supported map. Higher coherence is supplied by the named enhancement, not claimed to be a standalone BF theorem. The pair-map sign was computed directly. |
| 7.1 Independent Deligne character | BF line 919 through line 960, pp.20–21; BKK line 3965 through line 3990, §5.1, p.110 | Actual classifying sheaves, stabilization, Dold–Puppe degrees and universal Deligne Chern classes; exponential/first-Chern normalization. |
| 7.2 Identification on K-groups | BF line 905, line 919, line 998 through line 1050, Theorem 3.5 and proof, pp.20–23; BFT line 296, Theorem 4.7, p.7 | The proof uses smooth quasi-projective X and Grassmannian nerves. It compares universal classes, not just arbitrary maps agreeing on K₀. Supported equality is obtained on restriction diagrams first. |
| 7.3 Multiplicativity | BF line 1440, line 1539, line 1619 through line 1632, §§5.1–5.2, Proposition 5.13/Corollary 5.14, pp.31–35 | Supported fundamental-class products, multiplicities and totalization sign; integral Chow source followed by real coefficients. Smoothness remains for internal diagonal products. |
| 7.4 Logarithm and projective witnesses | BKK line 3965 and line 4176 through line 4180, pp.110,115; BF line 550, p.11; KLM line 546 through line 555, §5.3, p.13 | Positive unit logarithm, negative divisor Green representative, four-term odd product and positive first-Chern orientation. KLM supplies the degree-one logarithm, not an all-open current comparison. |

The repaired §2.0a route was also checked at Levine94 line 655, line 695, line 706, line 711 and line 719 through line 736 (§2, pp.257–259). The linear-algebra filtration argument uses rational regular-stratum vertex weights and therefore extends to the expressly supplied regular-base scope. The cycle theorem at Levine94 line 1101 still requires an infinite field. The fixed-pair repair in §3.2 was checked at Burgos94 line 181 and DeligneHodgeII line 1044, line 1142, line 1223 and line 1242 (Proposition 3.1.8, Theorem 3.2.5, Corollary 3.2.13, pp.33,35–38). It distinguishes residue-complex filtration from shifted cohomological weight.

### Supplier order and ownership

The requested dependency command exited 0:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. I read all 27 Needs lines and the twelve supplier contracts. The two P3 omissions do not conceal an upward supplier. The citation resolver found no unresolved roadmap citations or Lean names, but expressly did not check pinned native declarations; those were opened separately below.

The content main was `dfdf9a3`. `roadmaps show` selected main for existing roadmaps, rather than their revision pull requests. New-roadmap copies were read at the indexed heads: GeneralAlgebraicKTheory `e0552fe`, SchemeKTheoryOperations `88dbd5a`, KTheoryFiniteLocalFields `afe02e8`, MotivesAndAlgebraicCycles `79b02f6`, ResolutionOfSingularitiesCharacteristicZero `bf45c86`, ComplexComparisonPartII `2d50a88`, ColemanIntegration `ae078af` and Polylogarithms `4696a1a`.

| Supplier | Resolved section anchors and contract evidence |
| --- | --- |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:627` (§3.12); lines 795, 827, 925, 1333 (§§4.6,4.8,4.14,6.3); lines 1623–1687 (§§7.4–7.7); lines 1938,1950 (§§8.12–8.13). Exact-category K, resolution, dévissage, localization, pairings and right-linear boundary. The uniformizer gives +1; the last-slot degree-two adapter gives −1. |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:373` through line 596 (§§2.1–2.6); lines 663–820 (§§3.1–3.6); line 1102 (§4.3); lines 1979,2031,2078 (§§6.7–6.9); lines 2225,2254,2280 (§§7.1–7.3). Regular finite-dimensional Noetherian ample-family scope is explicit for supported operations/weights. Closed supports use perfect complexes in the ambient scheme, not K of a singular support. Degree-zero Chow and γ characters retain separate targets. |
| KTheoryFiniteLocalFields | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:478` (§3.0a); line 1472 (diagonalChernMilnor in §6.10). Integral dimension grading, degree-one simplex boundary [1]−[0], moving with two coprime extension degrees, localization, products and shared tower; diagonal factors 1,−1,2. |
| MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:675`, 690, 710, 813, 858, 872 (§§4.7,4.8,4.8a,4.14,4.17,4.18). Imports shared higher cycles; owns relative-cycle specialization and motive adapters. Perfect-field and resolution assumptions are retained only on those adapters. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3265`, 3309 (§§2.1–2.2); 5613,6075 (§§4.12,4.17); 6567,6653,6701,6721,6768,6921,6987,7107 (§§5.1–5.8). Native cycles, Chow maps, Chern/intersection theory, domination and SNC geometry resolve. |
| ResolutionOfSingularitiesCharacteristicZero | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672` through 728 (§§5.1–5.6); 758,770,786,802 (§§6.1–6.4). Resolution preserving the smooth open and boundary cleanup; projectivity only in the quasi-projective compactification case; étale SNC coordinates in the general smooth case. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`,105,139 (§§G.1–G.3). Compactification objects, Nagata existence and dense cofiltered common refinements. No étale coefficient result is consumed. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md:699`,856 (§§C−1.1,C−1.4); 2337,2895,3018,3401,3743,3990 (§§C5.1,C5.3–C5.6,C6.0). In particular properPureHodge at 2974 covers nonprojective smooth proper schemes, and regularSingularDeRhamComparison at 3850 admits residue 0. Current normalization starts from the supplied actual integration currents. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259`,429,441,455,492,580,2293 (§E0.6, §§0.1–0.4, E1.4,E2.6). Dg nerve, replacements, derived tensor, coherent functors and hypercover descent, including point-site specialization. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:268`,311,503,782,806,816,862 (Layers 0–1,5–9). Native wedge/differential, compactly supported Stokes, de Rham comparison and manifold duality. Whitney approximation in Layer 8 is not arbitrary closed-set jet extension. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:12`,96,193. Finite-dimensional Hausdorff second-countable manifolds; K1 type/orientation transport and K2 Dolbeault calculus. The orientation is imported from ComplexManifolds Milestones 1–2, as its introduction states. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:326`,471,946,1654. Stages 2–3, Stage 6 items 1–4 and Stage 8 item 2 provide relative theory, products/duality and the abelian Moore comparison. The latter explicitly excludes the nonabelian π₀ interpretation. |

Ownership searches used `roadmaps list`, `roadmaps grep` by objects, and `roadmaps show`, together with the board-package index and searches of the board README/plan files. I searched supported/multi-relative cubes, higher Chern operations, higher cycles, logarithmic Dolbeault/Deligne complexes, support resolutions, Whitney extension and flat ideals. Topological characteristic classes, weak-Whitney mapping topologies, Whitney approximation and arithmetic regulators are different objects.

The actual overlap is allocated in the direction required by the merge order. ColemanIntegration §L3.Fa.2 (`TauCetiRoadmap/ColemanIntegration/README.md:2433`) has the same zero-face-first a−b relativity convention and needs regular-base localized cubes, now provided by §2.0a. Its special-unit localization theorems and exact-cube operations remain there. Polylogarithms §5.2 (`TauCetiRoadmap/Polylogarithms/README.md:772`,804,824) uses the same even-degree current pairing and auxiliary complexes after Jₙ; its shifted comparison complex and explicit-current adapters remain there. Their existing consumer prose still needs external synchronization to these imports; the present design explicitly assigns ownership and does not add a reverse dependency. This is the already-settled ownership allocation, not a fresh request to duplicate their objects.

I also read the board-head files identified by the supplied index: `packages/PeriodsAndSpecialValues/README.md:747` at `9f14c68` and `packages/KatoEulerSystems/README.md:153` and line 1013 at `725fd74`. The former's projection is exactly (z+(−1)ʲ⁻¹z̄)/2; the latter requests ch₂,₂=−c₂,₂ and the projective archimedean comparison. Thus these consumer citations are readable at their supplied heads despite their absence from this checkout's package folders. `packages/ZagierConjecturePolylogarithms/design/README.md:1495` requests the two M.8 interfaces, and `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md` has its distinct N/logarithmic-filtration direction. BorelRegulators has a target description, not a source of a prerequisite here.

The excluded consumer-label ledger at line 697 was compared with the board designs for ArithmeticKTheoryPartII, GeneralAlgebraicKTheoryPartII, MotivesAndAlgebraicCyclesPartII, EtaleHomotopyTypes, QuadraticFormInvariantsPartII and SymplecticReidemeisterTorsionModSquares, and the indexed K2SymbolsBrauer §10.29. Their requests do not become suppliers or assertions of this roadmap. No new fully qualified Lean declaration is introduced by this design.

### Pins and duplication by object

The checked library HEADs equal the manifest and plan pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and declaration opened | What the declaration actually supplies |
| --- | --- |
| `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, AlgebraicGeometry.AlgebraicCycle; line 69, AlgebraicCycle.map | The body is `Function.locallyFinsupp X R`. There is no codimension or face-admissibility condition. The map requires QuasiCompact and explicit weight functions; its coefficient is a residue degree only when weights match. Properness is additional for Chow pushforward. |
| `Mathlib/AlgebraicGeometry/Scheme.lean:40`, AlgebraicGeometry.Scheme | LocallyRingedSpace plus local affine charts. Separatedness, finite type and smoothness are not fields of Scheme. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:56`, ModuleCat | An additive commutative group with a module structure; no finite-dimensionality assumption. |
| `Mathlib/Algebra/Homology/HomologicalComplex.lean:59`, HomologicalComplex; line 72, d_comp_d | Shaped differentials and their square-zero relation. Out-of-shape differentials are zero. |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`, CategoryTheory.DerivedCategory | The body is `HomologicalComplexUpToQuasiIso C (ComplexShape.up ℤ)`. This does not supply the enhanced diagram calculus. |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`, CochainComplex.mappingCone; lines 261,269, inl_v_d/inr_f_d | Source-shift-first differential (−da,fa+db). Shift −1 and negation of the second coordinate give the README pair differential. |
| `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167`, CategoryTheory.Abelian.DoldKan.equivalence | `SimplicialObject A ≌ ChainComplex A ℕ` for an abelian category. It does not itself assert πₙ=Hₙ. |
| `TauCeti/Algebra/Homology/GradedCochainComplex.lean:59`, TauCeti.gradedCochainComplex | Actual graded submodules, a homogeneous degree-one linear endomorphism and square-zero hypothesis. |
| `TauCeti/Geometry/Hodge/Structure.lean:62`, HodgeStructureOn; `TauCeti/Geometry/Hodge/Morphism.lean:69`, IsMorphism | Opposed bounded filtration; morphisms preserve filtration and commute with conjugation. These are linear data, not geometric logarithmic complexes. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:44`, tateLatticeMap; lines 91,100,111, tate/tate_F/tate_piece | Weight −2p, only piece (−p,−p), ordinary integer lattice map `Algebra.linearMap ℤ ℂ`. The geometric (2πi)ᵖ marking must be supplied explicitly. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, MixedHodgeStructure; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110`, Hom.range_inf_F_eq_map_F | Rational weight and complex Hodge filtrations with base-change models; strictness is range(f)∩Fᵖ=f(Fᵖ) for an actual mixed-Hodge morphism. |
| `TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean:87`, ContMDiffMap.weakWhitneyJet | Derivative family of an already given global smooth map. It is not an extension theorem for prescribed jets on a closed set. |

Object searches found no pinned geometric higher-Chow complex, scheme higher-K carrier, logarithmic Deligne complex or multi-relative Adams construction. The existing ordinary cycles, cone, derived category, Dold–Kan and linear Hodge objects are cited rather than rebuilt. Both declared gaps are minimal relative to these searches and the readable supplier roadmaps. Each has the same slug in the plan and README, a named DifferentialGeometry Part II supplier, precise domain and conclusion, and three computed Checks. The relative Borel clause is the coordinate-hyperplane specialization of the Whitney extension contract.

### Adversarial computations

API numbers below are the bullet order in each target. All coefficients, twists and degrees have the standing hypotheses in scope. “Keep” means no mathematical change. For inherited unmodified target rows, I checked that the previous computed value still applies. New API rows, repaired targets and the seeded sample were recomputed. The table does not claim that isolated examples prove functoriality or a comparison theorem.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Geometric scope/universe | Empty scheme; point disjoint from ℙ¹; Spec ℤ₂ | Empty cycle group 0; CH¹=0⊕ℤ, ranks ℤ²; ℤ₂ is dimension 1 regular, outside field-only scope but inside §2.0a | Domains distinguish these inputs | Keep |
| Integer grading and coefficients | p=1,a=3; R=0; ℤ/2⊗ᴸℤ/2 | 2p−a=−1 gives 0; zero coefficients give 0; derived reduction has ℤ/2 in degrees −1 and 0, ordinary tensor only degree 0 | No natural subtraction or flatness shortcut | Keep |
| Cube/simplex signs | n=0,1,2; bidegree (1,1) | J=1,−1,1; cube graph boundary +[0], BF boundary −[0]; cross coefficients −1,+1 sum to 0 | Signs fixed | Keep |
| Cone/shift convention | f:A→B; 0→ℝ[0] | Cone differential (−da,fa+db); shifted/transported differential (da,fa−db); fiber H¹=ℝ, H⁻¹=0 | Agrees at pin | Keep |
| Boundary convention | Lift Γ_t; degree n=1,2 | d(Γ_t,0)=([0],t); raw boundary −[0], adapter +[0]=ch(B[t]); last-slot factors +1,−1 | Distinct marked maps | Keep |
| Tate/projection convention | p=−1,0,1; z=3+4i at p=1,2,3 | Nonzero powers of 2πi; projection outputs 3,4i,3 and kills ℝ(p) in each case | Correct quotient and parity | Keep |
| Form and total-product degrees | Critical p=1; (n,s)=(1,1),(0,1),(1,2) | Ordinary degree 0 becomes 2 under −2∂∂̄; total-product signs −1,+1,+1 | Two separate degree conventions | Keep |
| Orientation/current convention | Two circles; point divisor on a curve | Ordered residue 1, exchanged −1; periods ±(2πi)²; (2πi)⁻¹·2πi=1, point-current factor 1 | Tate factors agree | Keep |
| Whitney gap | A={0}, empty, full; parameter y=π/2 | Coefficients 1,1,2 give derivatives 1,1,4; m=2 gives 4; empty imposes no condition; full returns f; zero jet has both 0 and exp(−1/x²) as extensions | Existence without uniqueness | Keep contract |
| Flat-ideal gap | A=B; empty/full; coordinate axes | I+I=I; C∞+0=C∞; φ(x)+φ(y) has zero origin jet but value e⁻¹ at (0,1), so belongs to sum, not intersection | Both domain and ideal operation tested | Keep contract |
| 1.1 definition | Point p=0; Γ_t; double point; p=−1 | Normalized groups ℤ,0,0 versus raw ℤ,ℤ,ℤ; boundary +[0]; coefficients 1 and 2 differ; negative codimension group 0 | Intended subgroup | Keep |
| 1.1 API 1 | Point, cube degrees 0,1 | N₀→quotient sends 1→1; N₁=ker(id_ℤ)=0 and quotient ℤ/ℤ=0 | Normalization matches quotient | Keep |
| 1.1 API 2 | ℙ¹→point; 𝔽₂(t)/𝔽₂(t²) | Fundamental pushforward has dimension drop and value 0; restriction/transfer on ℤ is ×2; codimension shift 0+0−1=−1 | Multiplicities and dimension retained | Keep |
| 1.1 API 3 | n=m=1; n=0 | J₂=1=J₁J₁; J₀=1; J₁²=1 | Product and involution agree | Keep |
| 1.1 API 4 | Single/double point; degenerate cube | Native coefficients 1≠2; degree-zero projector fixes both; positive constant cube projects to 0 | No collapsed multiplicity | Keep |
| 1.2 definition | Total degrees 0,2; (1,1) | Diagonal ranks have 1,3 summands; mixed differential square has −1+1=0 | Finite direct-sum total | Keep |
| 1.2 API 1 | Degree-zero m[V], both axes | i□(m[V])=m[V]=iΔ(m[V]) | Same augmentation | Keep |
| 1.2 API 2 | Three degree-two components | Maps with components 1,2,3 send (1,1,1) to 6; componentwise sum also 6 | Components determine total map | Keep |
| 1.2 API 3 | (1,0),(0,1),(1,1) | J signs −1,+1,−1; using n+m instead gives −1,−1,+1 | Simplex axis preserved | Keep |
| 1.3 | Point p=0; empty/full supports; zero coefficients | H₀ map ℤ→ℤ sends 1→1; higher point groups 0→0; support fibers 0 and C; R=0 gives 0→0 | Integral/derived comparison consistent | Keep |
| 1.4 | Inseparable degree 2; odd factors; nilpotent thickening | Transfer composite 2 on ℤ; exchange −1; reduced and square-zero-thickened generator both coefficient 1 | No separability or characteristic-zero shortcut | Keep |
| 2.0a definition | n=0,1,2; empty S; X=Spec ℤ₂,ℤ₃ | K^S(Y), ΩK(X), Ω²K(X); empty S gives 0; π₀ of full one-cube is K₁(ℤ_p)=ℤ_p× for p=2,3 | Repaired regular-base scope works | Keep |
| 2.0a weights | h on ℙ²; L=2I+N with Ne₂=e₁,Ne₁=0 | ψ²h=2h−h²; weight generators determinant 2; h=(2h+h²)/2−h²/2; (L−2)e₂=e₁, (L−2)²e₂=0 | Rational and generalized qualifiers necessary | Keep |
| 2.0a API 1 | n=0, arbitrary Y; S=empty/full | Values 0 and K(Y), not K(X) for arbitrary Y; support-forgetting sends 0→0 | Correct ambient retained | Keep |
| 2.0a API 2 | Rank 2, unit 2; identity face diagram | ψ² gives 2 on rank and 2[2] on the unit; applying identity first or last gives the same respective value | Vertex and relative actions compatible | Keep |
| 2.0a API 3 | Full one-/two-cube | Difference sends (1,0),(0,1),(1,1) to 1,−1,0; double loop is Ω²; exchange of coordinates has sign −1 | Ordered equivalence pinned | Keep |
| 2.0a localized Check | Remove t=2 over ℤ₃ | 2 and 1−2=−1 are units; both faces survive; trivial-line ranks (1,1) | No unsupported delooping for this open | Keep |
| 2.0b definition | Zero K-class; O(1) on ℙ²; unit 2 | c₀(0)=1 versus ch(0)=0; c₂(O(1))=0 versus ch₂=h²/2; c₁,₁(2)=[2] has v₂=1 | Distinguishes Chern and character | Keep |
| 2.0b API 1 | O(1)⊕O(−1), with/without trivial summand | Total Chern product (1+h)(1−h)=1−h²; c₁=0,c₂=−h² in both stabilizations | Whitney and stability agree | Keep |
| 2.0b API 2 | Milnor diagonal n=1,2,3 | Coefficients 1,−1,2 match supplier | Integral sign/factorial retained | Keep |
| 2.0b API 3 | Same diagonal | Character multipliers 1,−1,1/2 times 1,−1,2 equal 1,1,1 | Rational Newton normalization | Keep |
| 2.1 definition | Rank 2; O(±1) on ℙ¹; unit 2; empty X | 2; (1+h)+(1−h)=2 versus total Chern 1; [2] has v₂=1; empty source/target 0 | Inverse-cycle character nonzero | Keep |
| 2.1 API 1 | Two points with ranks (2,1) | Weight-zero projection (2,1); separate point restrictions give 2 and 1, not sum 3 | Componentwise naturality | Keep |
| 2.2 | Weights 0,1,2; ψ¹; O(1) on ℙ² | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψ¹ eigenvalues all 1; ch₂=h²/2 | Projectors only divide nonzero differences for a>1 | Keep |
| 2.2 API 1 | Point sheaf, unit 2, {2}·{t} | Both maps give h, [2], and ordered graph product; last regulator has period +2πi log 2, reversed loops give its negative | New degree-two Check discriminates | Keep |
| 2.3 definition | Empty/full/crossing supports | Fiber groups 0, absolute group, leading crossing coefficients (1,1); no identification with singular K(Z) | Ambient support theory retained | Keep |
| 2.3 API 1 | {0}⊂{0,1} and identity | Coordinate r goes to (r,0); at r=1 direct/composed maps both (1,0) | Correct direction | Keep |
| 2.3 API 2 | t; last-slot degree 2 | ch_Z B[t]=+[0], raw δ[t]=−[0]; minus raw equals +[0]; additional last-slot multiplier −1 in degree 2 | Suspension dictionary tested | Keep |
| 2.4 | Ranks 2,3; point sheaf; p=1,2,3 | Rank product 6=2·3; ch(1−O(−1))=h; higher coefficients 1,−1,1/2 | Product and degree-zero normalizations agree | Keep |
| 3.1 definition | Punctured disk; D empty; W empty; pole | dlog|z|²=dz/z+dz̄/z̄; period 2πi; empty D gives native forms; empty W gives 0; |z|⁻² is not polynomial-log growth | Image algebra distinguished | Keep |
| 3.1 API 1 | f=z z̄ | ∂∂̄f=dz∧dz̄, ∂̄∂f=−dz∧dz̄; sum 0; pure squares 0 | Dolbeault signs | Keep |
| 3.1 API 2 | z=w², followed by w=v³ | Pullback dlog z=2dlog w=6dlog v; direct sixth-power pullback also 6dlog v | Pullback and composition | Keep |
| 3.1 API 3 | log|z|² and zero at z=2 | Values log 4≠0 in both subalgebra and ambient forms; empty boundary is inclusion by identity | Zero quotient excluded | Keep |
| 3.2 | 𝔾_m; point; boundary blowup of 𝔾_m² | Logarithmic W-index 1 on both complexes gives H¹-weight 2; point weight 0; torus Betti dimensions 1,2,1 unchanged, boundary-component count increases 4→5 | Fixed-pair bifiltration, not W-invariance under refinement | Keep |
| 3.2 API 1 | f=exp(−1/|z|²); f=1 | Flat f/z² has zero jets, value e⁻¹ at 1; 1/z diverges at 0 | Flatness necessary | Keep |
| 3.2 API 2 | exp(−1/|zw|²)log|z|²/(zw̄) | Axis jets 0; value at (−2,1) is −e⁻¹ᐟ⁴ log4/2; all exponents zero gives f | Combined estimates and extension value | Keep |
| 3.3 definition | A=ℂ[0], p=−1,0,1; A=0 | H⁰=ℝ(−1),ℝ,0 respectively; H¹=0,0,ℝ; zero complex gives zero | Negative and critical twists covered | Keep |
| 3.3 API 1 | Point weight 1; x=z z̄ in critical degree | Projection log2+iθ↦log2; inclusion/projection r↦r; inclusion of x has differential (−2∂∂̄x,−2∂∂̄x,0), equal to inclusion of d_Dx | Retraction is a chain comparison | Keep |
| 3.3 API 2 | Split ℂ→ℂ²→ℂ at weight 1 | Deligne H¹ maps r↦(r,0), (r,s)↦s; kernel equals ℝ×0=image | Exactness on type-compatible sequences | Keep |
| 3.3 API 3 | p=1,x=z z̄ | d_Dx=−2dz∧dz̄, value 4i on (∂x,∂y); ordinary degree 0→2 | Critical jump and sign | Keep |
| 3.4 definition | Point disjoint from ℙ¹; torus compactifications | H_D⁰=ℝ²; torus periods (2πi,0),(0,2πi), product (2πi)² in either choice | Marked geometric comparison | Keep |
| 3.4 API 1 | Identity and double identity refinement | H⁰ maps 1→1→1; composite multiplier 1·1=1 | Cocycle/unit control | Keep |
| 3.4 API 2 | t↦t² and t↦t³ | Pullback of dlog gives 2 then 3, total 6; composite t↦t⁶ gives 6 | Contravariant order/coherence | Keep |
| 3.4 API 3 | Two affine opens of ℙ¹, weight 0; empty open | Čech H⁰ kernel of (a,b)↦a−b is diagonal ℝ, same as H⁰_D(ℙ¹); empty gives 0 | Gluing rather than product | Keep |
| 3.4 API 4 | Constant point diagram with repeated objects | Compatible maps 1↦r descend to 1↦r once; duplicating indices does not produce ℝ² | Colimit universal property | Keep |
| 4.1 definition | log2 and log|t|; two point logarithms | Four-term formula gives i log2 darg t; point product 0 because degree-one forms vanish | Specific product determined | Keep |
| 4.1 API 1 | Same odd factors; x=z z̄,y=1 at twist 1 | Swap negates i log2 darg t; d_D(x•1)=−2dz∧dz̄=d_Dx•1 | Symmetry and Leibniz signs | Keep |
| 4.1 API 2 | Constant unit and log2; two ruling classes | 1•log2=log2; high critical wedge has normalized integral 1 | Unit and wedge comparison | Keep |
| 4.1 API 3 | Nonclosed x=z z̄, y=1, both twist 1 | Product −z̄dz+z dz̄; its differential −2dz∧dz̄ | Closedness not needed | Keep |
| 4.2 | Even constants 2,3,5; Re z,2,3; odd point triple | Bracketings 30=30; 6Re z=6Re z, at z=1 both 6 while dx≠0; odd triple products 0 | Even homotopy vanishing without closedness | Keep |
| 5.1 definition | Empty/full supports; zero-source fiber | fib(id) acyclic, fib(C→0)=C; fib(0→ℝ[0]) has ℝ in degree 1; d² second coordinate res dω−d resω=0 | Correct fiber | Keep |
| 5.1 API 1 | Support {0} enlarged to {0,1} | 1↦(1,0); further identity gives (1,0), not (1,1) | Support direction | Keep |
| 5.1 API 2 | Open t and its logarithm | Raw connecting classes −[0] and −cl([0]); both adapters give +1 | Localization signs match | Keep |
| 5.1 API 3 | Disjoint supports; V(x),V(y) | Disjoint intersection gives 0; transverse divisors give origin coefficient 1; external support is their product | Mathematics sound; edge missing | R01 |
| 5.1 API 4 | Zero pair; (0,−log|t|); double | Differentials (0,0); on punctured line ∂∂̄log|t|=0; doubled supported class has coefficient 2 | Cocycle iff and addition tested | Keep |
| 5.2 | Crossing, cusp, origin; p=0; wrong codimension | H²=ℝ²,ℝ,0 respectively for p=1; origin H⁴=ℝ at p=2; full p=0 gives H⁰=ℝ; point/full p=1 has H¹=ℝ and violates omitted-codimension version | Singular support and lower bound | Keep |
| 5.2 API 1 | Complex normal disks of dimensions 1,2 | Relative Betti groups ℝ in degrees 2,4, zero below; positive oriented generators give +1 | Semipurity basis | Keep |
| 5.2 API 2 | Double divisor; crossing; zero cycle | Coordinates 2,(1,1),(0,0); only last vanishes; generic restrictions recover each entry | Both directions of zero criterion | Keep |
| 5.2 API 3 | f=t,t⁻¹ | Green functions −log|t|,+log|t|; supported coefficients +1,−1; current differentials −δ₀,+δ₀ | Sign and inverse unit | Keep |
| 5.3 definition | (r,n)=(2p,1),(2p−1,1); point p=0 | Total degrees 2p−1,2p−2; cube differential signs +1,−1; point Hₚ is ℝ in degree 0 only | Normalization and totalization | Keep |
| 5.3 API 1 | Origin and doubled origin; Γ_t face | Coefficients 1,2 on cycles and support classes; face coefficient +1 on both | Class map preserves multiplicities | Keep |
| 5.3 API 2 | Top cocycle m[V]; ω=x₁dz₂∧dz̄₂ | Projection gives m; dω(∂x₁,∂x₂,∂y₂)=−2i≠0 so ω is excluded by good truncation | No brutal-truncation cocycle | Keep |
| 5.3 API 3 | Point p=0; empty support | Constant r↦r; positive normalized constant cube 0; empty-support map 0→0 | Named comparison maps | Keep |
| 5.3 API 4 | Supports {0},{1},{0,1} | Images (1,0),(0,1); sum (1,1) at union; empty adds (0,0) | Directed equality/addition witness | Keep |
| 5.4 | Point↔𝔸¹, p=0,1; product (n,s)=(1,1) | H_D⁰=ℝ and H_D¹=ℝ respectively on both; positive normalized columns have 0 cohomology; product multiplier −1 | Contraction and products compatible | Keep |
| 6.1 definition | Integral cycle m; O(1),O(−1); zero | Roof sends m→m, normalized Chern integrals +1,−1, zero→0; shift 2p has sign +1 | Specified nonzero roof | Keep |
| 6.1 API 1 | Point p=0, lift of m; altered lift by boundary | Top class m and forgotten form m yield final m; boundary alteration yields class 0 | Lift independence on test | Keep |
| 6.1 API 2 | Units −1,i,2 | Values 0,0,log2; first two are torsion, third is not | Integral source then real coefficients | Keep |
| 6.1 API 3 | O(1),O(−1),O on ℙ¹ | Normalized first-Chern integrals +1,−1,0 in both geometric and roof descriptions | Degree-zero comparison | Keep |
| 6.2 | Identity and empty/full supports; stated two-term square | h=0 on identity, support maps 0/absolute; image (1,1) has D′=(0,0), wrong (1,−1) has (0,2) | Coherent-fiber formula nontrivial | R02 is summary only |
| 6.2 API 1 | General homotopy square; r=f′=h=1 example | Defect (f′r−r′f−dh−hd)a=0; opposite correction gives 2(dh+hd)a, value 2 at a=1 | Plus sign forced | Keep |
| 6.3 | Point→ℙ¹; ℚ→ℝ→ℂ; cube n=1,2 | c₁ pulls to 0 in both theories; unit 2 gives log2 by both embeddings; J=−1,+1 on source and target | Natural maps, not raw arbitrary cycle pullback | Keep |
| 7.1 definition | u=2eⁱθ,i; O(a); constant simplicial ℤ and S₃ | Values log2,0; character 1+a h_D; π₀=H₀=ℤ in abelian case, π₀=S₃ in nonabelian case | Construction domain and normalization | Keep |
| 7.1 API 1 | Units 2,3; ranks 2,3; embedding of ℚ | log6=log2+log3; rank product 6=2·3; embedding preserves log2 | Additivity/product/base change | Keep |
| 7.1 API 2 | Logarithm branches; O(1) | Re(log2+2πik)=log2 for every k; normalized c₁ integral 1 on either definition | Branch-independent geometric class | Keep |
| 7.2 | Rank 2, point sheaf, units 2,−1; degree-two product | Both maps give 2,h_D,log2,0; {2}·{t} gives period 2πi log2 on both routes | Identification tested beyond K₀ | Keep |
| 7.3 | Ordered units 2,t; point units; ruling divisors | Periods +2πi log2 and −2πi log2 after swap; point degree-two class 0; ruling product degree 1, doubled ruling gives 2 | Integral-source product compatible | Keep |
| 7.4 | 1,i,2,3,6,1/2; tᵃ; O(a) | Logs 0,0,log2,log3,log6,−log2; Green multiplicity a; normalized Chern values −1,0,1 for a=−1,0,1 | Scale, twist and sign fixed | Keep |

The tested wrong models include the zero regulator, total Chern class in place of character, reversed loops/faces, integral weight projectors, natural subtraction, ordinary coefficient tensor, a singular-support K carrier, arbitrary-pole forms, an abstract noninjective logarithmic tensor algebra, brutal truncation, a wrong fiber shift and a wrong homotopy sign. Their failures are numerical or group-valued in the table. Nonabelian S₃ is used only where a group comparison is present; field/DVR, characteristic 2, inseparability and nonreduced tests are used only in the layers whose domains admit them. The complex geometric assertions do not claim those noncomplex inputs.

### Headline acceptance and Lean stage

The README headlines are the integral model comparison (§1.3), higher rational weight and universal-class comparison (§2.2), supported character (§2.3), geometric filtered and compactification comparisons (§§3.2,3.4), product coherence (§4.2), singular-support semipurity (§5.2), auxiliary resolution (§5.4), universal derived/supported/natural regulator (§§6.1–6.3), Beilinson identification (§7.2), integral-source multiplicativity (§7.3) and normalization on actual unit/Chern classes (§7.4). Section 2.0a is the substantial shared supporting construction.

There is no `Suggested.lean` in this design package. The geometric higher-Chow, scheme higher-K and logarithmic Deligne carriers required by those headlines are absent at the pins; the abstract linear Hodge structures and complexes above do not replace them. The point logarithm identity alone would be a Check or scalar stand-in, not the regulator headline. No missing statable package headline or padding declaration can therefore be charged to this design. At package stage the module docstring must enumerate these missing carriers rather than introduce opaque data or scalar substitutes.

**Elaboration:** not available (this lane does not elaborate). No Lean command was run. There are zero local Lean declarations, so there was no `#check @name` binder audit or one-tactic padding probe. No claim is made that a build passed or that sorry was its only warning.

## Not verifiable

- Bloch86 §7 is settled as uncertified. The arbitrary-field universal integral Chern construction and its identification with Levine's inverse could not be independently read. BF's complex-field sketch was read; it is not a substitute certification of the unread general statement.
- Beilinson85 §§1–2 is settled uncertified; Levine98's chapter-level background is waived. Neither was requested again or entered as a new missing source.
- Burgos94's cached extraction omits several displayed formulas, including the arrows in Theorem 2.1 and the displayed expression in Proposition 4.1. The surrounding hypotheses and conclusions were read; BKK Definition 5.20 supplies the readable generator formula. The absent displays themselves are not claimed to have been visually certified.
- Sources cited only inside the suppliers' proof routes were not independently re-reviewed. The supplier statements and hypotheses were resolved at main or the provided open heads. In particular this review does not certify all literature underlying the supplied moving or enhanced-category infrastructure.
- BorelRegulators has only a target description in the available board copy; no completed downstream roadmap or future consumer import edit is certified here. All supplied indexed open heads were available to object search; no unidentified remote pull request was sought.
- Lean elaboration and eventual package acceptance-file checks are unavailable in this design lane, as recorded above.

## Source issues

- **Misprint** in BF at Proposition 1.26, p.10: the source says the associator homotopy preserves total input degree; it should be degree minus one to make dh+hd an associator; affects nothing.
- **Gap** in BF at Theorem 3.5, p.20, proof pp.20–23: the source says the K-to-Chow comparison applies to every equidimensional complex scheme; it should assume smooth quasi-projective X for the proof given; affects a stated result.
- **Gap** in BF at Proposition 2.7, p.15: the source says every quasi-projective scheme has the indicated internal higher-Chow product; it should require smoothness for the diagonal pullback and cited Levine argument; affects a stated result.
- **Gap** in Levine94 at Theorem 3.1, pp.276–278: the source says the comparison holds over every field while invoking infinite-field Theorem 2.7; it should include the rational restriction-transfer descent needed for finite fields; affects the proof.
- **Misprint** in BF at proof of Theorem 3.5, p.22, BF line 1006: the source says Gr(N,k) parametrizes k-planes in ℂᴺ but has a rank-N universal bundle and stabilization in k; it should use N-planes in ℂᴺ⁺ᵏ with their rank-N bundle; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cf15f635abe7ec104fc1850c399a5006423ec57a", "job": "REV-DESIGN-MotivicEtaleKTheory~3", "model": "gpt-6-astra", "worker": "chris-3"} -->

---

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/952#issuecomment-6376423283 -->
Review (claude) of cf15f63

Verdict: needs changes

1. **F01** (P2) §2.0a's products leave its regular domain

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:207` (the same text is in plan.json:252, `supportedCubeKApi2`): "Coordinate restrictions, allowed pullbacks of supported face diagrams and products induce the corresponding maps of total fibers; identities and compositions are coherent. Adams operations commute with these maps". The statement at `:200` says: "products are over Spec ℤ".

   **Claim.** Products of supported cube K-theories are maps of total fibres, and ψᵃ commutes with them.

   **Witness.** X = Spec ℤ[i] satisfies §2.0a's hypotheses. But X×_ℤX = Spec ℤ[i][x]/((x−i)(x+i)) has two branches meeting at (1+i, x−i), so it is not regular. SchemeKTheoryOperations `README.md:2076` grants Adams–product compatibility only when the product scheme lies in scope.

   **Repair.** In README `:207` and plan.json `supportedCubeKApi2`, replace "allowed pullbacks of supported face diagrams and products" with this text: "pullbacks along morphisms g:X′→X of schemes satisfying these hypotheses, for open Y′⊂g⁻¹(Y) with faces mapping to faces and g⁻¹(S)∩Y′⊂S′, and the products over the base K^S(Y;∂□ⁿ)⊗K^{S′}(Y′;∂□ᵐ)→K^{S×_XS′}(Y×_XY′;∂□ⁿ⁺ᵐ) for Y⊂X×□ⁿ and Y′⊂X×□ᵐ. External products over Spec ℤ are included only when X×_ℤX′ again satisfies the hypotheses of 2.0a". The product over the base is what ColemanIntegration's cup products along coordinate projections use (L3.Fa.1, L3.Fa.3).

   **Tested.** Take X = Spec ℤ_(p). Then Y×_XY′ = X×□² is regular. The units u, v ∈ K₀(X×□;∂□) = ℤ_(p)^× multiply to {u,v} ∈ K₀(X×□²;∂□²) ≅ K₂(ℤ_(p)). Applying ψ² gives 4{u,v} on one side and ψ²u·ψ²v = (2u)(2v) on the other, which agree. Over ℤ[i] the repaired clause makes no claim about X×_ℤX.

2. **F02** (P3) The relativity equivalence is not stated to preserve Adams weights

   **Location.** README `:208` (plan.json:255, `supportedCubeKApi3`): "homotopy invariance gives the ordered equivalence K^S(Y;∂□ⁿ)≃ΩⁿK^T(X)". The clause has no Adams statement. README `:674` says: "ColemanIntegration §L3.Fa.2 imports §2.0a’s cube K-theory, ordered relativity equivalence and Adams weights".

   **Claim.** §2.0a supplies ColemanIntegration's relativity isomorphism.

   **Witness.** ColemanIntegration `README.md:2438` states `cubeRelK.relativityIso` weight by weight, K_n^(j)(X^m_B;□^m)≅K_(n+m)^(j)(B), where K^(j) is a common eigenspace (`:2395`). §2.0a gives only generalized pieces and never says that the equivalence commutes with ψᵃ. Its own n=2 Check (`:214`) relies on this.

   **Repair.**
   - Append to API3 (README and plan.json): "This equivalence intertwines ψᵃ for every a≥1. It therefore carries the generalized weight-q piece of Kₘ^S(Y;∂□ⁿ)⊗ℚ onto the weight-q summand of Kₘ₊ₙ^T(X)⊗ℚ, and on these full cubes the generalized pieces are simultaneous eigenspaces."
   - In the ColemanIntegration bullet (`:674` and the plan.json consumer entry), replace "and Adams weights" with "with its weightwise form, and generalized Adams weight pieces, which are simultaneous eigenspaces on full cubes".

   **Tested.** For X = Spec ℚ and n = 1, the class of the unit 2 maps to [2] ∈ K₁(ℚ), and ψ² acts by 2 on both sides. For n = 2 and {u,v} over ℚ(u,v), ψ² acts by 4 on both sides, as Check `:214` says. The absolute weights are eigenspaces: SchemeKTheoryOperations `README.md:2084` gives them with projectors.

3. **F03** (P3) §2.1 still needs §2.0b after the identification moved to §2.2

   **Location.** README `:255`: "*Needs:* §2.0a; §2.0b; §1.4; …". plan.json:372 lists "target:2.0b" among 2.1's prerequisites.

   **Claim.** 2.1's statement or route uses §2.0b.

   **Witness.** After the round-2 repair, 2.1's statement, its sketch (`:240–242`) and its four Checks (`:250–253`) use only the inverse of Levine's cycle map. The sketch names §2.0b only to say that §2.2 identifies the two maps. §2.0b's arbitrary-field case rests on Bloch86, which is uncertified.

   **Repair.** Delete "§2.0b;" from 2.1's *Needs* line and "target:2.0b" from 2.1's plan prerequisites. §2.2 keeps it (`:273`, plan.json:424).

   **Tested.** All four 2.1 Checks evaluate without §2.0b, from the inverse cycle map and SchemeAndStackFoundations classes:
   - ch₀,₀[k²] = 2.
   - ch(O(1)⊕O(−1)) = 2, against total Chern class (1+h)(1−h) = 1.
   - X = ∅ gives 0, and the ranks on Spec k ⊔ Spec k are (2,1).
   - ch₁,₁[2] = [Γ₂], with 2-adic valuation 1.

4. **F04** (P3) The new degree-two Check depends on Layer 7

   **Location.** README `:271` (plan.json:455, `degree_two_universal_inverse_agreement`): "Its regulator is i log 2 darg t with positive-circle period 2πi log 2≠0 (§§7.3–7.4; BKK p.115, BKK line 4176–4180). Reversing the loop order gives the negative".

   **Claim.** The Check fixes the degree-2 delooping sign inside §2.2.

   **Witness.** The Check can tell the two signs apart only because [Γ₂]×[Γ_t] is rationally nonzero. Here that nonvanishing is certified by the regulator of §§7.3–7.4, five layers later, which a Layer 2 test cannot use.

   **Repair.** Replace the regulator sentence with this: "Its last-slot residue at t=0, under KTheoryFiniteLocalFields §3.0a localization, is [2]∈CH¹(Spec ℚ,1)⊗ℚ, of 2-adic valuation 1; reversing the loop order gives −[2]. §7.3 recomputes the regulator value i log 2 darg t." Keep the rest of the Check.

   **Tested.** The last-slot residues are ∂{2,t} = 2 and ∂{t,2} = 2⁻¹, with valuations +1 and −1. The sign model (−1)^{n(n−1)/2} sends {2}·{t} to −[Γ₂]×[Γ_t], whose residue is −[2] ≠ [2], so the Check still refutes it.

5. **F05** (P3) No locator states §2.4's product formula

   **Location.** README `:296` (plan.json 2.4 locator): "the weight-(p+q) character of x×y is Σᵢ₊ⱼ₌p₊q chᵢ,ₙ(x)×chⱼ,ₘ(y) … (BF, §3.2, pp.21–23, BF line 948 and BF line 997; Levine94 Theorem 5.2, p.313, Levine94 line 2226)".

   **Claim.** The cited texts state that the higher character is multiplicative.

   **Witness.** Levine94 Theorem 5.2 (line 2226–2240) gives only the rational product on higher Chow groups. BF lines 948–997 construct the character and note that it agrees in degree zero (line 997). Neither text says that ch respects products.

   **Repair.** After the product sentence, write: "(the cycle product is Levine94 Theorem 5.2, p.313; compatibility of the character with it is proved here by the tensor-pairing route below)". Keep the BF citations for the construction, the degree-zero agreement and the Newton factor. Alternatively, cite a legal text that states the compatibility.

   **Tested.** On ℙ¹ with h = 1−[O(−1)], h·h = 0 in K₀. So ch(h·h) = 0 = h² = ch(h)·ch(h), and the formula and the repaired attribution agree.

6. **F06** (P3) §3.3 reverses the order of the identity composite

   **Location.** README `:358` (plan.json:691): "Construct mutually inverse-up-to-homotopy maps with the cone, with projection followed by inclusion equal to identity on D."

   **Claim.** Projecting and then including is the identity of D.

   **Witness.** BKK line 4100 gives ψ∘φ = id, where φ is the inclusion D→cone (line 4069) and ψ the projection (line 4063). φ∘ψ − id is only dh+hd. The README itself reads "A followed by B" as B∘A (`:125`).

   **Repair.** Write: "with inclusion followed by projection equal to the identity of D, and projection followed by inclusion homotopic to the identity of the cone by BKK’s h".

   **Tested.** Take the point, p = 1, degree 1. Then φ(r) = (0,0,r) and ψ(0,0,r) = r, so inclusion followed by projection is the identity. But φψ(0,0,log 2+iθ) = (0,0,log 2), which differs from the input whenever θ ≠ 0.

All seven round-2 findings are repaired at the text. The round-2 blocking item is fixed: §2.0a now works over every regular Noetherian separated finite-dimensional base with an ample family, on open subschemes of the cube, and keeps the field only for the cycle-map clause. That generalization has one new gap. Its API still lists "products" with no base, and the same paragraph says products are taken over Spec ℤ. A product over ℤ of two schemes in scope can be singular, so it leaves both §2.0a's own domain and the supplier's Adams scope (R01, P2). The other five findings are P3: one interface clause, one stale *Needs* entry, one Check that depends on a later layer, one locator and one wording slip.

Paths are repository-relative. `packages/…` is this board package. Main-branch roadmaps were read at main `dfdf9a3`. Open roadmaps were read at the heads in the index: ColemanIntegration `ae078af`, SchemeKTheoryOperations `88dbd5a`, KTheoryFiniteLocalFields `afe02e8`, MotivesAndAlgebraicCycles `79b02f6`, GeneralAlgebraicKTheory `e0552fe`, ResolutionOfSingularitiesCharacteristicZero `bf45c86`, ComplexComparisonPartII `2d50a88` and Polylogarithms `4696a1a`. Library declarations were read at the pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`.

## Verified sound

### Round-2 findings, repair status

| Id | Status | Repaired passage (at most 40 words) |
| --- | --- | --- |
| F01 | repaired | `:200` "For every regular Noetherian separated finite-dimensional scheme X with an ample family of line bundles, n≥0, open Y⊂X×□ⁿ and closed S⊂Y". Field only "For the relative cycle map". `:13` and `:674` now name only §L3.Fa.2, with the requested wording. Plan hypotheses agree. New issues are R01 and R02. |
| F02 | repaired | `:200` "on Kₘ^S(Y;∂□ⁿ)⊗ℚ first use the finite generalized weight-q decomposition". The ℙ² negative control is at `:216`, recomputed below. |
| F03 | repaired | `:240` ends "on its Adams weight."; the universal-class API bullet and its plan label are gone. The leftover *Needs* entry is R03. |
| F04 | repaired | `:271` adds the {2}·{t} Check in K-degree 2. Its dependence on Layer 7 is R04. |
| F05 | repaired | `:314`, `:535` and `:668` now list every supplier that their *Needs* lines name. Checked by script for all seven layers, roadmap by roadmap. |
| F06 | repaired | `:341` "maps by a bifiltered quasi-isomorphism for (W,F) to E_W(log D)". Check `:347` "dz/z lies in W₁ and not W₀". Burgos94 line 181–189 is bifiltered. |
| F07 | repaired | `:13` and `:672` "are §§5.2–5.3 here; Polylogarithms §5.2 imports them". The PeriodsAndSpecialValues sentence is deleted. A grep for process words finds none: every "current" means currents. |

Each repaired pattern was searched for in the rest of the design:
- **Field-scope supply claims.** Every other consumer claim (Polylogarithms, Zagier M.8, KatoEulerSystems, PeriodsAndSpecialValues, MixedHodgeModules, ColemanIntegration L3.Fc.1) lies within the stated scope.
- **Integral weight claims.** None: 2.1–2.2 are rational throughout.
- **Premature assertions.** None besides the R03 *Needs* entry. 2.4 needs §2.2 and lists it.
- **Degree-2 sign Checks.** §§4.1, 7.3 and 7.4 and the Conventions all give i log 2 darg t, consistent with the new Check.
- **Half-stated source theorems.** BF (1.30) and BKK 5.15(i)–(ii) are stated in full.
- **Process wording.** None.

### Dependency check

Run exactly as the brief gives it; exit 0:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The placement is after merge-order line 87. The suppliers on the order come earlier: SchemeAndStackFoundations 2, GeneralAlgebraicKTheory 5, ResolutionOfSingularitiesCharacteristicZero 6, EnhancedDerivedSheaves 19, EtaleCohomologyFoundations 20, SchemeKTheoryOperations 41, ComplexComparisonPartII 46, KTheoryFiniteLocalFields 84, MotivesAndAlgebraicCycles 87. Every named consumer comes later: ZagierConjecturePolylogarithms 116, ColemanIntegration 155, Polylogarithms 156, MixedHodgeModulesAndIrregularHodgeTheory 181, PeriodsAndSpecialValues 201, HabiroRings 218, KatoEulerSystems 246. DifferentialGeometry, ComplexKahlerGeometry, AlgebraicTopology and ComplexManifolds are on main. No repair above adds a supplier.

### Seeded sample (15 targets), checked against the text

No locator in plan.json is flagged as unverified. Pages are printed pages.

- **1.3.** BFT Proposition 6.12: line 961, p.20, any field, integral. Levine94 Theorem 4.7 (line 1767, p.296) and Lemma 4.6 (line 1735, pp.295–296). The finite-field device is two coprime pure p-power extensions (Levine94 line 1596).
- **2.0b.** BF §3.2, lines 961–997, pp.21–22: universal classes in CH^p(B·GL_N,0), transcendental moving and specialization, read over ℂ. Line 997 gives degree-zero agreement.
- **2.2.** Levine94 Theorem 3.1 (line 1210, p.276), with K_p(X)^(q) generalized eigenspaces (line 706–710). BF Theorem 3.5 (line 905, p.20).
- **2.4.** BF lines 948 and 997 support the construction and degree zero. Levine94 Theorem 5.2 (line 2226, p.313) gives the cycle product only (R05).
- **3.1.** Burgos94 §2 (line 155–168, pp.65–66): the image of the multiplication map. BKK Definition 5.20 (line 4217, p.116) gives the generators log zz̄, dz/z, dz̄/z̄.
- **3.3.** BKK Definition 5.7 (line 3999, p.111), Notation 5.8 (π_p and F^{k,k′}, lines 4020–4030), Definitions 5.9–5.10 (lines 4035–4050, p.112) and Proposition 5.12 (lines 4060–4111, pp.112–113). Every case of D, d_D, φ and ψ matches; the composite order is R06.
- **4.2.** BKK Proposition 5.15 (line 4142, p.114): (ii) has no closedness hypothesis. BF Proposition 1.26 (line 506, p.10) is stated for closed inputs.
- **5.2.** BF (1.30) (line 533), Proposition 1.31 (line 540) and the principal divisor (0, −½log ff̄) (line 550–552), all p.11. BKK §5.6 (line 4795, p.132), δ normalization (2πi)^{−(d−p)} (line 4811), Proposition 5.58 (line 4841, p.133).
- **5.3.** BF §2.4 (line 705, p.15): d_s = d_D+(−1)^r δ with δ = Σ(−1)^i(δ⁰−δ¹) (lines 711–714). §2.5 (line 746, p.16). Canonical truncation (lines 582–587). BFT Proposition 4.3 (line 266, p.7).
- **5.4.** BF Proposition 2.8 (line 720, p.15), Corollary 2.9 (line 741), Lemma 2.11 (line 753) and Proposition 2.13 (line 766, pp.16–17).
- **6.2.** BF Proposition 3.3 (line 877, p.19), Lemma 1.10 (line 319, p.7), BFT §4 (line 277, p.7).
- **7.1.** BF lines 919, 934 and 948 (pp.20–21): smooth quasi-projective X, the K-sheaf and Gillet's Deligne classes. BKK §5.1 (line 3965, p.110): c₁ through the exponential sequence.
- **7.2.** BF Theorem 3.5 and its proof (lines 905, 998–1053, pp.20–23). The proof assumes smooth quasi-projective X (line 919). BFT Theorem 4.7 (line 296, p.7).
- **7.3.** BF §5.1 (line 1440, p.31; the sign (−1)^{ns} at line 1445), Definition 5.8 (line 1539, p.33), Proposition 5.13 and Corollary 5.14 (lines 1619–1625, p.35).
- **7.4.** BKK line 3965 (p.110). The special-degree formulas (lines 4167–4180, p.115) include the four-term product. BF line 550 (p.11). KLM §5.3 (lines 546–553, p.13): R₁ = log z.

Locators of the changed passages:
- Levine94 Lemma 2.1 (line 711, p.258) and its proof (lines 719–736, pp.258–259).
- Burgos94 Theorem 2.1 and Corollary 2.2 (lines 181–192, p.67).
- DeligneHodgeII Proposition 3.1.8 (line 1044, p.33), Theorem 3.2.5 (line 1142, p.35; W[n] in (iii)) and Corollary 3.2.13 (line 1242, p.38).

### Supplier sections resolved, at the stated copy

- **ColemanIntegration.** L3.Fa.1 (`:2395`) and L3.Fa.2 (`:2433–2455`). Its domain, regular Noetherian separated finite-dimensional with an ample family, equals §2.0a's. Its sign, t=0 minus t=∞, equals `:208`.
- **SchemeKTheoryOperations.** §2.5 (`:577`), §6.7 (`:1979`), §6.8 (`:2031`, products at `:2076`) and §6.9 (`:2078`, simultaneous weights with projectors at `:2084`). All are in the regular ample-family scope.
- **KTheoryFiniteLocalFields.** §3.0a (`motivicCycles`, `motivicToK`, `:478–513`) and §6.10 (`diagonalChernMilnor`, `:1472`, factors 1, −1, 2).
- **MotivesAndAlgebraicCycles.** §§4.7, 4.8, 4.8a (`:710`), 4.14, 4.17 and 4.18.
- **GeneralAlgebraicKTheory.** §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12 and 8.13.
- **ResolutionOfSingularitiesCharacteristicZero.** §§5.1–5.6 and 6.1–6.4.
- **ComplexComparisonPartII.** C−1.1, C−1.4, C5.1, C5.3 (`properPureHodge`, `relativeHodgeBundles`), C5.4, C5.5, C5.6 (`regularSingularDeRhamComparison`, `:3850`) and C6.0.
- **On main.**
  - EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6
  - ComplexKahlerGeometry K1 and K2
  - AlgebraicTopology Stages 2, 3, 6 and Stage 8 item 2 (`simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`)
  - DifferentialGeometry Layers 0–1 and 5–9
  - EtaleCohomologyFoundations G.1–G.3
  - SchemeAndStackFoundations §§2.1, 2.2, 4.12, 4.17, 5.1–5.8
  - ComplexManifolds Milestones 1–2
  - Completed/HodgeStructures

Polylogarithms' contract `gap:universal-deligne-contract` (`README.md:115`) is met by §§1.1–1.4, 2.1–2.3, 3.4, 4.1–4.2, 5.2 and 6.1–6.3. Its labels §4.2, Layer 4, §9.1 and §12.2 are in the table at `:688–695`, and its ∂_M at `:37` equals ∂□ here. HabiroRings, at its head and in its board package, cites no section of this roadmap. The resolver lists nothing unresolved, and this agrees with the copies above.

### Pinned declarations opened

Mathlib `6b7abb3c`, 12 declarations:
- AlgebraicCycle/Basic.lean:44 `AlgebraicCycle` (locally finite support, no dimension condition) and :69 `map`
- Scheme.lean:40 `Scheme`; ModuleCat/Basic.lean:56 `ModuleCat`
- HomologicalComplex.lean:59 `HomologicalComplex` and :72 `d_comp_d`
- DerivedCategory/Basic.lean:87 `DerivedCategory`
- MappingCone.lean:57 `mappingCone`, :261 `inl_v_d` and :269 `inr_f_d`
- DoldKan/Equivalence.lean:167 `equivalence`

Tau Ceti `a91d3aaf`, 8 declarations:
- GradedCochainComplex.lean:59 `gradedCochainComplex`
- Hodge/Structure.lean:62 `HodgeStructureOn`; Morphism.lean:69 `IsMorphism`
- Tate/Basic.lean:91 `tate` (type (−m,−m)), :100 `tate_F` and :111 `tate_piece`
- Mixed/Basic.lean:72 `MixedHodgeStructure`; Mixed/Strictness.lean:110 `range_inf_F_eq_map_F`

`git grep` at both pinned commits finds no Whitney or Borel extension, no flat ideal, no higher Chow group, no Deligne–Beilinson complex, no logarithmic form sheaf and no scheme Adams operation. The only hit is the weak Whitney topology in Tau Ceti's WeakWhitney.lean.

### Duplication and ownership, by object

I searched main, the 331 open heads (`roadmaps grep`) and the board packages in this checkout for these objects: multi-relative cube K-theory and relativity isomorphisms, logarithmic Dolbeault and Burgos complexes, Deligne algebras, universal or higher Chern characters, semipurity, and the namespace `MotivicRealization`. What turned up:
- ColemanIntegration L3.Fa.2.
- KTheoryFiniteLocalFields §6.10 (the field diagonal, with an agreement API in §2.0b).
- Polylogarithms §5.2 (recorded import).
- Manifold Dolbeault complexes in ComplexKahlerGeometry, IndexTheory and GeometricQuantization: a different object.
- EtaleDualityAndPerverseSheaves semipurity: étale, and later in the order.
- No name collision.

**Ownership move recorded.** Supported multi-relative cube K-theory over regular bases moves down from ColemanIntegration §L3.Fa.2 (order 155) to §2.0a here. This roadmap is the owner because it comes earlier, it needs the construction for Layer 2, and the general base is the library form.

Two texts outside this package still assign "multi-relative refinements" to ColemanIntegration: ColemanIntegration's own L3.Fa.2 and SchemeKTheoryOperations `:9` and `:2403`. Changing them is a maintainer edit outside this package, not a finding here.

The name-versus-scope question is a recorded maintainer decision and is not raised.

### Declared gaps

Both gaps name DifferentialGeometry, which is on main. Each uses the same slug in plan.json and in the README (`:93`, `:101`). Each has an exact domain and conclusion. Neither asks for anything the pins, an earlier roadmap or this roadmap provides; this was checked by `git grep` at the pins.

### Principles and shape

- **Principles.** No route shortcut, re-planned roadmap, copied passage, algorithm, Lean file or `set_option`.
- **Size.** 27 targets: 8 definitions, 6 constructions, 12 theorems and 1 example. There are 49 API entries and 96 Checks. Every definition and construction has at least three Checks.
- **README and plan.json.** They agree verbatim on all 27 statements and all 96 Checks. Four plan API entries paraphrase README sketch sentences: 2.2, 3.2 (two) and 6.2.
- **House style.** No LaTeX, no pull-request numbers and no own backticked names.
- **Note for the package stage.** State the two gaps inside the DifferentialGeometry contract subsection. They currently sit in a separate "Required supplier extensions" subsection.

### Headline theorems and elaboration

The headline theorems for the package stage are 1.3, 2.2, 2.3, 3.2, 3.4, 4.2, 5.2, 5.4, 6.1–6.3, 7.2, 7.3 and 7.4. None is statable at the pins, which have no higher Chow groups, no scheme Kₙ and no geometric Deligne complex.

**Elaboration:** not available. This lane does not elaborate, and a design has no `Suggested.lean`. So no padding probe and no `#check` binder comparison were run.

### Adversarial table

For untouched targets outside the sample (1.1, 1.2, 1.4, 2.3, 3.4, 4.1, 5.1, 6.1, 6.3), the round-2 rows carry computed values and are relied on.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 2.0a domain | ℤ_(p); ℤ₃ with t=2 removed; ∅ | π₀fib(Δ)=K₁(ℤ_(p))=ℤ_(p)^×; 2−0=2 and 1−2=−1 are units in ℤ₃, so {t=2} is closed and misses both faces; ∅ gives 0 at every vertex | holds | none |
| 2.0a rational weights | K₀(ℙ²), h=1−[O(−1)] | ψ²h=2h−h²; ψ²h²=4h²; ψ²(2h+h²)=2(2h+h²); lattice determinant 2; h=(2h+h²)/2−h²/2 | holds | none |
| 2.0a filtration route | ψ=[[2,1],[0,2]] | (ψ−2)e₂=e₁≠0, (ψ−2)²=0 (Levine94 line 719–736) | holds | none |
| 2.0a API1 | Y=X; Y⊊X open; S=∅ | K^S(X); K^S(Y)≠K^S(X) in general; 0 | holds | none |
| 2.0a API2 products | X=Spec ℤ[i]; X=Spec ℤ_(p) | over ℤ: (x−i)(x+i), two branches at (1+i,x−i), not regular; over X: X×□², and ψ²{u,v}=4{u,v}=(2u)(2v) | fails as stated | R01 |
| 2.0a API3 delooping | n=0,1,2; unit 2; {u,v} | Ω⁰K=K; (1,0)↦1, (0,1)↦−1, (1,1)↦0; ψ² weights 2 and 4 on both sides, not stated | holds; clause missing | R02 |
| ColemanIntegration relativity sign | zero face first | (a,b)↦a−b at `:208`; t=0 minus t=∞ at ColemanIntegration `:2435` | holds | none |
| 2.1 after deletion | rank 2; O(±1) on ℙ¹; ∅; Spec k⊔Spec k; unit 2 | 2; 2 against (1+h)(1−h)=1; 0; (2,1); [Γ₂] with v₂=1 | holds | R03 |
| 2.2 degree-2 Check | {2}·{t} on 𝔾_m,ℚ; reversed; (−1)^{n(n−1)/2} | x•y=(log 2/2)(dt/t−dt̄/t̄)=i log 2 darg t, period 2πi log 2; reversed gives −; model signs 1, 1, −1; residues 2 and 2⁻¹ | holds | R04 |
| 3.2 bifiltered | 𝔾_m⊂ℙ¹; point | dz/z∈W₁∖W₀ on both sides; W[n] gives weight 1+1=2; point weight 0 | holds | none |
| Dependencies | 7 layers, by script | every roadmap named in a *Needs* line appears in Dependencies | holds | none |
| 1.3 | point p=0; Z=∅,X; ℤ/2⊗ᴸℤ/2; R=0 | H₀=ℤ with 1↦1; fibres 0 and C; degrees −1 and 0; 0→0 | holds | none |
| 2.0b | O(1)⊕O(−1) on ℙ²; n=1,2,3; zero class | c=1−h², so c₂=−h² and ch₂=h²; diagonal 1, −1, 2 times 1, −1, ½ gives 1, 1, 1; c₀,₀(0)=1 against ch(0)=0 | holds | none |
| 2.2 | weights 0,1,2; ψᵃ on k^× | eigenvalues 1, 2, 4; differences −1, −3, −2; ψᵃ[u]=a[u]; ch₂(O(1)) on ℙ² is h²/2 | holds | none |
| 2.4 | ℙ¹; ranks 2,3; p=1,2,3 | ch(1−O(−1))=h; ch(h·h)=0=h²; ch₀=6=2·3; factors 1, −1, ½ | holds; locator missing | R05 |
| 3.1 | punctured disk; D=∅ | d log∣z∣²=dz/z+dz̄/z̄; ∮dz/z=2πi; ordered residues +1 and −1 | holds | none |
| 3.3 | point p=0,1,−1; ∣z∣²; composites | H⁰=ℝ; H¹=ℝ (D¹=ℝ, D²=0); H⁰=ℝ(−1), H¹=0; d_D=−2dz∧dz̄; ψφ=id; φψ(0,0,log 2+iθ)=(0,0,log 2) | holds; wording | R06 |
| 4.2 | 2,3,5; Re z,2,3; odd point triple | 30 both ways; 6 Re z both ways, 6 at z=1, d Re z=dx≠0; 0 | holds | none |
| 5.2 | V(xy), cusp, origin, point; f=t | ℝ² with (1,1); ℝ; p=1 gives 0, p=2 gives ℝ; full support H¹=ℝ≠0; −2∂∂̄[−log∣t∣]=2(−πi)/(2πi)δ₀=−δ₀, coefficient +1 | holds | none |
| 5.3 | (2p,1), (2p−1,1); point p=0; ω=Re z₁dz₂∧dz̄₂ | degree 2p−1 with sign +1, then −1; ℝ in degree 0 only; dω(∂ₓ₁,∂ₓ₂,∂ᵧ₂)=−2i | holds | none |
| 5.4 | origin ×1, ×2; point→𝔸¹; (n,s) | 1, 2; H_D¹ is ℝ on both sides; (−1)^{ns} at (1,1), (0,1), (1,2) is −1, +1, +1 | holds | none |
| 6.2 | A=A′=ℤ[0], B=0, B′=ℤ→ℤ, r=f′=h=1 | (1,1), D′=(0,1−1)=(0,0); wrong sign (1,−1), D′=(0,2); (0,log∣t∣) has class −cl([0]) | holds | none |
| 7.1 | 2e^{iθ}; 3+4i; S₃ | log 2; π_{p−1}=3, 4i, 3; adding ℝ(p) changes it by 0; π₀=S₃ is nonabelian | holds | none |
| 7.2 | rank 2; [O_pt]; units 2, −1 | 2; h_D; log 2; 0; weight-2 factor −1 | holds | none |
| 7.3 | {2},{t}; 2,3 at a point; rulings on ℙ¹×ℙ¹ | ±i log 2 darg t; H_D²(pt,ℝ(2))=0; 1, and 2 after doubling | holds | none |
| 7.4 | units f,g; u=2,3,½,i; tᵃ | i(log∣f∣darg g−log∣g∣darg f); log 6=log 2+log 3; −log 2; 0; −a log∣t∣ | holds | none |
| Gaps | A={0}; A={x=0}, B={y=0} | coefficients 1, 1, 2 give 1, 1, 4, and n! gives (n!)²; φ(x)+φ(y)=e⁻¹ at (0,1) | precise, minimal | none |

## Not verifiable

- **Bloch86 (uncertified).** The arbitrary-field universal classes (2.0b) and their identification with Levine's inverse (2.2) were not read. The construction over ℂ was read in BF lines 961–997.
- **Beilinson85 (uncertified) and Levine98 (waived).** The design relies on neither beyond background.
- **Burgos94 displays.** The extraction loses the displayed maps of Theorem 2.1 and the generators at line 133. Their content was confirmed from the surrounding text (lines 181–189) and from BKK Definition 5.20.
- **Consumer labels.** The KatoEulerSystems §12.1 and PeriodsAndSpecialValues PS.3.2a labels live in board packages on other pull-request heads. They were not fetched: the text citing them is unchanged since round 2, and they are not supply edges.
- **Lean elaboration.** Not available in this lane.

## Source issues

- **Misprint** in BF at Proposition 1.26, p.10: the source gives the associativity homotopy target degree r+s+t; it should be r+s+t−1, as the identity dh+hd equal to the associator forces; affects nothing.
- **Gap** in BF at Theorem 3.5, p.20: the source states the Beilinson comparison for any equidimensional complex algebraic scheme, while its proof assumes X smooth quasi-projective; it should assume that; affects a stated result.
- **Gap** in BF at Proposition 2.7, p.15: the source asserts an associative integral internal product for any quasi-projective scheme, citing a rational result; it should assume X smooth, for diagonal pullback, and rational coefficients or integral moving; affects a stated result.
- **Gap** in Levine94 at Theorem 3.1, pp.276–277: the source states the cycle-to-K isomorphism over any field, but its proof checks Theorem 2.7, which needs an infinite field; it should add descent from coprime infinite extensions as in Lemma 4.3; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf15f63", "job": "REV-DESIGN-MotivicEtaleKTheory~3", "model": "opus", "worker": "fable-rev38"} -->
