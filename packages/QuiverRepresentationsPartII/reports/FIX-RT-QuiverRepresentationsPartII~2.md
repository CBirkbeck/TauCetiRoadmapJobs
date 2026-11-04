# Repair report: quiver representations, part II

The first six finding sections concern review r2a; the final three concern review r2b. Each heading retains that review’s finding identifier and severity. Overlapping findings share a repair but each has its own disposition. Only `packages/QuiverRepresentationsPartII/README.md`, `packages/QuiverRepresentationsPartII/Suggested.lean`, and this requested report changed. Metadata and the source manifest did not need changes; no supplier gap was introduced.

## F01 (P2) — applied

Reconstruction listed as unavailable → `reconstruction_from_image` on actual range submodules, with equal grade finranks, bidirectional grade preservation, and restricted-operator intertwining. Updated §1.6 and the module docstring. AKY line 554 states exactly this reconstruction; Mathlib `Algebra/Module/Submodule/Range.lean:155` supplies the range-valued map. The classification-based route remains.

## F02 (P2) — applied

Only occurrence Dilworth tested → also `finite_dilworth` for every finite partial order, including the empty carrier, with nonempty disjoint chain parts covering the carrier and an equal-size antichain. Named it in §4.3 and added three prose Checks. Evidence: DIL line 40 and line 59. The matching specialization remains a separate headline.

## F03 (P3) — applied

A fresh induction proving polynomial nonvanishing → consumption of `MvPolynomial.funext`, with its exact supplier contract and §2.5 dependency. At the pin, `Mathlib/Algebra/MvPolynomial/Funext.lean:31,79–86` retains integral-domain and infinitude hypotheses. Added values 0,0,2 for X(X−1) and the zero-variable constant value 3. The topology and irreducibility targets remain.

## F04 (P3) — applied

Indirect or missing coverage → three discriminating prose Checks each for standard vectors, image models, iterated images, centralizer restriction, simultaneous restrictions, and the window predicate (§§1.3, 1.5, 2.1, 3.3, 4.5). They compute vectors, embedding ranges, powers, restriction coefficients, and both window bounds. Structural restriction equations are distinguished from the stronger image-admissibility condition. No Lean padding was added.

## F05 (P2) — applied

Restriction surjectivity absent from acceptance → `centralizer_image_extension` on the native range, simultaneously for both directions. §§2.3–2.4 specify its opposite degree, commutation, and extension equations. AKY line 631–642 gives both directions; the block-coordinate lifting proof also verifies them. No genericity or image-model hypothesis was added.

## F06 (P3) — applied

Undeclared own API identifiers in code spans → italic prose names or mathematical formulas, throughout Layers 0–5. All 81 affected spans were treated consistently, including consumers of image, duality, ramification, and representation adapters. Genuine acceptance and supplier names retain code notation. The unused interval constructor was deleted under r2b F03; no API declarations were added to satisfy formatting.

## F01 (P3) — applied

Attainment restricted to 1≤a<r → attainment for a≤r. Updated the signature, docstring, §§4.5–4.7, and boundary Checks. AKY line 793 restricts the source's rewriting to interior cuts; line 819 defines the paths. At a=0 the all-up path visits the whole nested cut; at a=r the all-left path does. For a>r, a decreasing steps cannot fit into r steps.

## F02 (P3) — applied differently

Added the missing simultaneous-restriction and adjacent-dual-count Checks (§§3.3, 4.1), sharing §3.3 with r2a F04. Corrected the proposed example: Im N for `[0,1]+[1,2]` is `[1,1]+[2,2]`, since N kills both image basis vectors. Its restricted opposite operator has WL type `[1,2]`. The proposed repair had interchanged those types; the restriction coefficient remains λ.

## F03 (P3) — applied

Unused `intSeg` notation in §0.1 → deleted. It had no consumer and no declaration in the acceptance file. Intervals and their endpoints retain the same meaning; this also settles its occurrence in r2a F06.

## Verification outcomes

- Required elaboration of `packages/QuiverRepresentationsPartII/Suggested.lean` from the pinned content environment: **exit 0**, exactly **13** `declaration uses 'sorry'` warnings, at lines 108, 111, 116, 134, 154, 199, 208, 212, 238, 243, 250, 254, 258; no other diagnostic. The imported Tau Ceti object was present, so no targeted build was needed. No Lean process remains running.
- Mechanical binder audit: a single scratch file containing the final module followed by `#check @name` for **all 42 explicit declarations** elaborated with **exit 0**, the same 13 expected warnings, and all 42 signatures. Compared every elaborated signature with the README and its explicit source type. None lost a binder. Reconstruction retains both pairs, grade dimensions, range equivalence, grade biconditionals, and operator equation. Extension retains direction and both input conditions. Finite Dilworth retains its universe-polymorphic partial order, finite carrier, and decidable equality. Attainment retains exactly a≤r and the window condition. The irreducibility type uses the explicitly supplied polynomial topology, even though pretty-printing suppresses that argument.
- Dependency check, with the supplied order, `--name QuiverRepresentationsPartII` and `--movable`: **exit 0**, exact output:

```text
depcheck: 34 roadmaps, 311 edges, 0 problem(s)
```

There was no UPWARD, CYCLE, or moved line.

- Citation resolver: **exit 0**, no missing cross-roadmap citations and no missing roadmap Lean names. Its library-name scan was unavailable in that command's environment; the pinned files were therefore checked directly, as documented below.
- Finite mathematical probes: **exit 0**, **405 multisegment/cut cases** for windows r=0,1,2,3 and multisets of at most three intervals. Exhaustively compared path maxima with chain maxima, adjacent dual counts with cut deficits, and nonempty peeling; also checked both truncation identities, dual involutivity, ram/truncation commutation, and canonical ramified additivity on each tested multiset. These computations supplement the arguments; they do not prove the general targets.
- `git diff --check`: **exit 0**, no output. All 42 explicit Lean names occur in the README. The Lean file has one Mathlib import, the single used Tau Ceti import, 29 real-bodied definitions/carriers, 13 admitted headline theorems, no admitted data, no examples, and no options.
- Format-gate repairs: all nine finding headings now start with their original F-identifiers, with review provenance in the introduction. The flagged associated-bundle expression in §2.7 is now prose naming its fibre and stabilizer structure group; its mathematical assertion is unchanged. No commit, repository-tool change, merge-order change, or external write was made.
- Verification after the format-gate repairs: the worker’s report parser recognizes **all 9 finding sections** and its coverage checker returns **no missing findings**. The README scanners return **tex=0, latex=0**. Required Lean elaboration again exits **0** with the same **13** expected admission warnings; the dependency check again exits **0**, with the exact output shown above and no UPWARD or CYCLE line. `git diff --check` exits **0** with no output. `Suggested.lean` is unchanged by these format repairs; its recorded 42-signature binder audit remains applicable.

## Sources, ownership, and pattern audit

The two main-branch exemplars read were `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md` and `TauCetiRoadmap/AlgebraicVectorBundles/README.md`. The repairs preserve the package's layers, API prose, Examples, Dependencies, and supplier headings.

The manifest pins were read directly: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant pinned declarations were inspected by object, not just by our chosen names:

| Supplier file and locator | Actual contract and limit |
|---|---|
| Mathlib `Algebra/Module/Submodule/Range.lean:57,155` | Range is the actual image submodule; range restriction retains the original map with range-valued codomain. It does not construct a coordinate image pair. |
| Mathlib `Algebra/Module/Submodule/Map.lean:52` | Submodule map is the actual image under the linear map. |
| Mathlib `Algebra/DirectSum/Basic.lean:440` | Internality is bijectivity of the canonical sum map, stronger than pairwise disjointness. |
| Mathlib `LinearAlgebra/Dimension/Free.lean:334`; `LinearAlgebra/Basis/VectorSpace.lean:152` | The finite-basis target uses finite generation and freeness; the arbitrary vector-space basis alone does not assert finite dimension. |
| Mathlib `LinearAlgebra/Matrix/Rank.lean:132` | Matrix rank is the finrank of its linear-map range. |
| Mathlib `Algebra/MvPolynomial/Eval.lean:256`; `Algebra/MvPolynomial/Funext.lean:31,79–86` | Evaluation is a ring homomorphism; function extensionality assumes an infinite integral domain, with arbitrary variable type. |
| Mathlib `Topology/Order.lean:70`; `Topology/Irreducible.lean:48` | The chosen generated topology is explicit; irreducibility includes nonemptiness. No Euclidean topology or algebraic dimension is supplied. |
| Mathlib `Order/Preorder/Chain.lean:51`; `Order/Antichain.lean:42` | Both use pairwise conditions on distinct members. Empty sets satisfy both. Neither is an attaining finite chain partition theorem. |
| Tau Ceti `LinearAlgebra/Graded/LinearMap.lean:56,61,80,95,138,146` | Homogeneity is the degree-mapping condition, with no internal-grading assumption. Addition, composition, scalar multiplication, and the fixed-degree submodule are supplied. |
| Tau Ceti `LinearAlgebra/End/LocallyNilpotent.lean:104` | The supplied exponent is per vector on a finitely supported function carrier with a well-founded lowering weight; the uniform exponent remains a target here. |
| Tau Ceti `Topology/Algebra/MulAction/Orbit.lean:87` | Local closedness requires a constructible orbit, a Noetherian space, and the ambient translation-continuity assumptions. No conormal dimension assertion follows from this alone. |
| Tau Ceti `RepresentationTheory/Quiver/Representation/Basic.lean:53`; `AsModule.lean:574` | Quiver representations are path functors; the path-algebra equivalence has the finite-vertex hypotheses. |
| Tau Ceti `RepresentationTheory/Quiver/Representation/KrullSchmidt.lean:85,110,148` | Pointwise finite-dimensional finite-quiver representations have finite indecomposable decompositions, matching index equivalences, and equal isomorphism-class multiplicities. |

Cross-roadmap contracts were resolved against main or the supplied open-head inventory, including their actual statement text:

| Roadmap | Verified section/declarations and use |
|---|---|
| QuiverRepresentations on main | Layers 1, 2, 5; `quiverRepEquivalence` at Suggested.lean:93, `exists_indecomposable_decomposition` at :128, `krullSchmidt_unique` at :135; README:348 for Gabriel. Left modules and increasing path arrows agree with this package's conventions. |
| AlgebraicVectorBundles on main | README L0B at :228 and L2B at :340; Suggested.lean `FiniteLocallyFreeSheaf` at :40, `rank` at :167, `totalSpaceScheme` at :732, `totalSpaceEquiv` at :750, `totalSpaceHomEquiv` at :795. These supply general bundle carriers, not this particular orbit's conormal comparison. |
| SmoothRepresentationsOfLocalGroups at its new-roadmap head | SR.0–SR.3, SR.5.2 target segment-representations, and SR.5.3 target highest-derivative-adapter were read through `roadmaps show`. They supply positive-rank unitary cuspidal labels, real endpoints, normalized Z/L conventions, the GL₀ unit, and the representation involution. No open revision of an existing roadmap was substituted for main. |

Ownership searches used `roadmaps grep` over main and the indexed open heads, direct searches of board packages, and every sibling checkout supplied in the brief. Search objects included finite chain partitions/Dilworth, graded commuting operators, multisegments, and orbit conormals. The SelmerIwasawaCohomologyPartII match concerns a filtered nearby-cycle operator, not these interval or extension objects. GraphConnectivityAndFlows explicitly excludes Dilworth in its Scope boundaries (README:1117). No other general finite-Dilworth owner was found; the already-planned §4.3 remains its owner. Reconstruction and opposite-centralizer extension are this package's graded-operator continuation of its parent. The scoped conormal construction remains here; general bundles remain with AlgebraicVectorBundles. The exact three new theorem names occur nowhere in the other roadmap Lean files searched. No new supplier, renamed supplier target, or gap entry is needed.

Legal cached texts suffice for every repair: AKY line 554–587 for reconstruction, line 593–642 for interval arrows and restriction, line 734–736 for simultaneous choice, line 789–875 for grid maxima; DIL line 27–73 for finite partial orders and Dilworth. Source keys were reused. Z81 stays uncertified by its settled locator. The MW extraction is image-only for the relevant article, so no claim of newly reading its proof is made; the changed operator assertions have independently readable AKY locators and the coordinate arguments below. No source passage was copied and no new reference request is needed.

The pattern searches covered every occurrence of the interior path hypotheses, image conventions, polynomial nonvanishing proof route, and planned own identifiers. The generality change reaches §§4.5, 4.6, and 4.7, while the source's interior-only monotone-minimum rewriting remains explicitly interior. The mistaken proposed VN-image type was corrected in both §§2.1 and 3.3. Checks for new API coverage remain entirely in the README. The source manifest and absent design plan did not require supplier-gap edits.

## Adversarial mathematics: acceptance declarations

All spaces in the operator rows are finite coordinate spaces over ℂ; no arbitrary-field or positive-characteristic generality is inferred. Let A=[0,2], B=[1,1], C=[0,0]+[1,1], D=2[0,1], Q=2[0,0]+3[1,1], and H=[0,1]+[1,2]. For H use x₀,x₁ on the first block and y₁,y₂ on the second, with N(x₀)=x₁, N(y₁)=y₂ and zero on the last vectors. Values in the table were recomputed from the definitions. The result column describes the repair, not independent acceptance.

| Statement | Instances tried | Computed values | Result / change |
|---|---|---|---|
| Interval | A, singleton, reversed pair | 0≤2 true; 1≤1 true; 2≤1 false | Nonempty endpoints retained. |
| Interval.contains | A at 0,2,3 | true,true,false | Inclusive endpoints retained. |
| Interval.included | B⊆A, A⊆B | true,false | Direction retained. |
| Interval.shorten | A, B | [0,1], none | Singleton deletion retained. |
| Multisegment | D, empty | card 2,0; length 4,0 | Occurrences retained. |
| rightTruncate | D, A+B, empty | 2[0,0], [0,1], empty | No singleton residue. |
| occurrenceInterval | C, D, empty | counts at the two C labels 1,1; D has count 2; empty domain has 0 labels | No constant or deduplicating selector. |
| maximalPart | 2A, A+B, C | A, A, C | One copy per distinct maximum. |
| remainder | 2A, A+B, C | A, B, empty | Multiplicity retained. |
| Space | n=0; degrees 0,1 | total dimensions 0,2 | Arbitrary finite multiplicities retained. |
| Space.Carrier | n=0,1,2 | complex dimensions 0,1,2 | Native coordinate carrier. |
| Space.grade | degrees 0,1; vector (1,0) | membership at 0 true, at 1 false; dimension at 2 is 0 | Coordinates fix grades. |
| Direction | up, down | exactly two constructors | No degree-zero direction. |
| Direction.step | up, down | +1,−1 | Sign retained. |
| Homogeneous | E₂₁ on grades 0,1; identity; zero | E₂₁: +1 true, −1 false; identity: 0 true, +1 false; zero: both true | Pinned degree predicate. |
| Pair | E₂₁ up, E₂₁ down | first admitted by degree law; second rejected | Homogeneity is stored data. |
| Space.internal | n=0; degrees 0,1 | zero sum→zero bijective; (u,v)↦(u,v) bijective | No merely disjoint model. |
| Pair.nilpotent | E₂₁, zero singleton, zero space | E₂₁²=0≠E₂₁; zero¹=0; on zero space even identity=0 | Uniform exponent retained. |
| reconstruction_from_image | A+B vs itself; A+B vs A; zero singleton at 0 vs 1 | identity gives matching ranks; middle dimensions 2≠1 reject second; grade-0 dimensions 1≠0 reject third | Added native-range headline. |
| centralizer_image_extension | H with coefficient λ; reflected H; zero image | L(y₁)=λx₀,L(y₂)=λx₁; NL(y₁)=LN(y₁)=λx₁; reflection reverses degrees; zero extends by zero | Added both directions. |
| polynomialTopology | n=1,0 | D(X)=ℂ excluding 0; D(3) in dimension 0 is the sole point | Polynomial, not Euclidean, topology. |
| polynomial_irreducible | n=1,0 | D(X)∩D(X−1) contains 2, product value 2; dimension-0 universe has one point | Nonemptiness retained. |
| cutPart | C at 0,3 | C, empty; cardinalities 2,0 | Meeting either grade retained. |
| IsInclusionChain | {A,B}, singleton, empty, C support | true,true,true,false | Native chain predicate. |
| chainWeight | A+B, 2[0,1]+B, C at 0; empty | 2,3,1,0 | Full multiplicity weights. |
| endpointBefore | C ordered 0→1; A→B; equal copies | true,false,false | Both endpoints strictly increase. |
| IsEndpointAntichain | D labels, C labels, empty | true,false,true | Duplicate labels incomparable. |
| IsEndpointMatching | three singletons with 0→1,1→2; reused-left or reused-right edges | size-2 path true; {0→1,0→2} false; {0→2,1→2} false | Roles kept separate. |
| matchingNumber | C,D,three ordered singletons,empty | 1,0,2,0 | Empty feasible set gives 0. |
| antichainWidth | C,D,three ordered singletons,empty | 1,2,1,0 | Multiplicity retained. |
| finite_dilworth | empty; 3-chain; 3-antichain; four-element diamond | antichain/part sizes 0/0,1/1,3/3,2/2; diamond parts {bottom,left,top},{right} cover all 4 | Added full finite-poset statement. |
| weighted_dilworth | C,D,three singletons,empty | 1+1=2; 0+2=2; 2+1=3; 0+0=0 | No nonempty hypothesis. |
| cut_antichain_width | A+B; 2[0,1]+B; C; empty at 0 | widths/weights 2/2,3/3,1/1,0/0 | Both comparison directions retained. |
| GridPath | r=3,a=1; r=a=0; r=2,a=3 | vertices (2,1),(1,1),(1,2),(1,3); sole vertex (1,0); third case impossible since 3>2 required decreases | Endpoints and unit steps retained. |
| intervalWeight | 2[1,3] at (1,3),(2,1),(1,2) | 2,0,0 | Reversed and absent intervals have weight 0. |
| GridPath.weight | displayed r=3 path on 2[1,3] and empty | 0+0+0+2=2; 0+0+0+0=0 | Multiplicities retained. |
| InWindow | [1,3], [0,1], [2,4] with r=3; empty with r=0 | true,false,false,true | Added both-bound Checks. |
| GridPath.weight_bound | displayed path on 2[1,3]; all paths for [0,1],r=3,a=1; r=a=0 | 2≤2; 0≤1; 0≤0 | No window/interior condition. |
| grid_path_chain_max | [1,1],r=2,a=0; [1,2],r=a=2; empty r=a=0 | weights (0,1,0)→1=E₀; (0,0,1)→1=E₂; 0=E₀ | Broadened to a≤r. |
| truncate_maximalPart | 2A; [0,1]+[0,0]; [0,0]+2[1,2]+[2,2] | both sides [0,1]; both [0,0]; both [1,1] | Singleton/maximal issue covered. |
| truncate_remainder | same three inputs | both sides [0,1]; both empty; both [1,1] | Multiplicities covered. |
| chainWeight_peeling | [0,0]+[0,1]; A+2B; singleton; empty cut | 2=1+1; 3=2+1; 1=0+1; empty would give false 0=0+1 | Nonempty hypothesis retained. |

## Adversarial mathematics: README statements and interfaces

Each row names a mathematical statement or defining law, including the APIs that intentionally have no Lean declaration. All added and changed Checks are instantiated here; unchanged interfaces are also tested to ensure the repairs propagate coherently. Formulas referring to planned carriers are mathematical notation, not declarations claimed to exist at the pins.

| Statement | Instances tried | Computed values | Result / change |
|---|---|---|---|
| Closed-interval and absence conventions | [3,3], [3,4], [4,3] | lengths 1,2; reversed endpoints rejected | No empty-interval data. |
| Length definition and positivity | A, B | 2−0+1=3; 1−1+1=1 | Positive natural lengths. |
| Translation definition | [2,4] by −1; empty multiset | [1,3]; empty | Shift sign retained. |
| Translation membership API | [2,4] at 2,5 with shift −1 | true↔true at 1; false↔false at 4 | Both directions. |
| Translation length API | [2,4] by −1 | 3=3 | Endpoint difference preserved. |
| Endpoint extensionality | [0,2] vs [0,2], [0,1] | equal; unequal right endpoints | No unmarked isomorphism. |
| Inclusion reflexivity | A | A⊆A true | Retained. |
| Inclusion transitivity | B⊆[0,1]⊆A | true,true imply B⊆A true | Retained. |
| Inclusion antisymmetry | A vs B | B⊆A true, A⊆B false | Equality requires both directions. |
| Degree dimension definition | A+B at 0,1,2,3 | 1,2,1,0 | Multiplicity and endpoints fixed. |
| Total length definition | A+B, empty | 3+1=4; 0 | Different from card 2. |
| Shift multisegment definition | 2[2,4] by −1 | 2[1,3] | Two copies remain. |
| Occurrence count API | D at [0,1] | two labels, count 2 | Constant and set selectors excluded. |
| Truncation additivity | [0,0]+[1,3] | truncation [1,2]=empty+[1,2] | Singleton contributes zero. |
| Truncation/translation commutation | [2,4] shifted −1 | shorten [1,3]=[1,2]; shift [2,3]=[1,2] | Same endpoints. |
| Additivity of grade dimensions | A+B at grade 1 | 2=1+1 | Retained. |
| Length as sum of dimensions | A+B | 4=1+2+1 | Finite-support sum. |
| Exact length decrement | A+B, empty | 4−2=2=length [0,1]; 0−0=0 | Strictness only for nonempty input. |
| Maximal-part count criterion | 2A+B at A,B | counts 1,0 | Duplicate maximum not counted twice. |
| Maximal plus remainder | 2A+B | A+(A+B)=2A+B | Actual subtraction reconstructs input. |
| Comparable maxima coincide | A+B; C | sole maximum A; C maxima incomparable | No distinct comparable maxima. |
| Existence of a maximal containing interval | B in A+B; [2,2] in [0,0]+2[1,2]+[2,2] | containing maxima A; [1,2] | Finite support sufficient. |
| Layer-0 worked decomposition | [0,0]+2[1,2]+[2,2] | maxima [0,0]+[1,2], remainder [1,2]+[2,2]; truncation 2[1,1] | One maximal copy survives. |
| Abstract grading/coordinate presentation | grades 0 and 1 of dimensions 2,1 | n=3, coordinate grades 0,0,1 | No one-dimensional-grade restriction. |
| Finiteness of nonzero grades | same presentation; n=0 | support {0,1}; empty | Explicit finite carrier. |
| Grade finrank equals coordinate count | same presentation at 0,1,2 | 2,1,0 | Native submodule agrees. |
| Constant-space definition | n=2,a=3; n=0 | dimensions at 3,4 are 2,0; zero carrier all dimensions 0 | Planned name now prose. |
| Grade-membership API | degree-3 two-coordinate space, vector (1,2) | grade 3 true, grade 4 false; zero belongs to both | Zero vector not a negative control. |
| Pair isomorphism definition | zero singletons at 0 and 1 | ungraded dimension 1=1 but grade-0 dimensions 1≠0 | Degree biconditionals necessary. |
| Pair isomorphism reflexivity | E₂₁ | identity intertwiner: I N=N I=N | Retained. |
| Pair isomorphism transitivity | scalar grade-preserving intertwiners 2I,3I | composite 6I; (6I)N=N(6I) | Retained. |
| Zero-pair definition | nonzero singleton, zero carrier | operator 0; exponent 1 works in each | No nonzero-map requirement. |
| Grade reflection | A, H | A→[−2,0]; degree +1→−1 | Distinct from vector-space transpose. |
| Finite-window equivalence | one-vertex [0,0]; arrow [0,1] | zero arrow; E₂₁ entry 1 in increasing direction | No wraparound. |
| Window enlargement compatibility | extend [0,1] to [−1,2] then restrict | original two spaces and coefficient 1; boundary arrows 0 | Labels unchanged. |
| Standard-space definition | A,D | dimensions 3,4; D grade-0 dimension 2 | Occurrence basis retained. |
| Standard-vector definition | one [0,1] at a=0,2 | v₀≠0; v₂=0 | Added positive and absent-degree tests. |
| Standard-vector independence | two [0,1] at a=0 | coordinates (1,0),(0,1), determinant 1 | Duplicate labels remain independent. |
| Standard-vector membership law | same valid and invalid vectors | v₀ in grade 0; invalid zero in every grade | Does not assign nonzero vectors outside intervals. |
| Standard-vector basis identity | A at a=1 | vector has coordinate 1 at (occ,1), 0 elsewhere | Zero model excluded. |
| Standard-space grade formula | A+B at grade 1 | dimension 2=count 2 | Retained. |
| Standard-space total formula | A+B | dimension 4=length 4 | Retained. |
| Standard-pair up-arrow formula | A basis | v₀→v₁→v₂→0 | Boundary direction fixed. |
| Standard-pair down-arrow formula | A basis | v₂→v₁→v₀→0 | Reverse direction without translation. |
| Standard-pair type formula | WL singleton [2,2]; D in either direction | types [2,2]; 2[0,1] | Multiplicity and degree preserved. |
| Pair type/classification iff | H vs standard H; zero vs nonzero on grades 0,1 | equal type admits identity; types C vs [0,1] unequal | Both directions constrained. |
| Type grade-dimension formula | A+B | dimensions (1,2,1)=occurrence counts | Retained. |
| Rank-table definition | A+B | R(0,0)=1,R(1,1)=2,R(2,2)=1; R(0,1)=R(1,2)=R(0,2)=1 | Includes zero-length paths. |
| Rank finite differences | same input at [0,2],[1,1] | 1−0−0+0=1; 2−1−1+1=1 | Integer differences, not iterated natural subtraction. |
| WL rank convention | down A from degree 2 to 0 | L²(v₂)=v₀, rank 1 | Direction reversed. |
| Shift-space definition | VN A shifted −1 | grades −1,0,1 | Convention V(c)ₐ=Vₐ₋c. |
| Shift-pair definition | same shift | arrow v₀→v₁ has degrees −1→0 | Operator unchanged. |
| Image-pair definition | VN A | range span(v₁,v₂), operator v₁→v₂→0 | Native image required. |
| Image-model injectivity/range law | image basis mapped to v₁,v₂; zero map; map to v₀,v₁ | ranges span(v₁,v₂),0,span(v₀,v₁) | First accepted; other two rejected. |
| Image-model grading law | v₁,v₂ vs embedding into v₀,v₁ | grades 1,2 vs 0,1 | Shift cannot silently change the embedding. |
| Image-model intertwining law | VN A image | embed(N'v₁)=v₂=N(embed v₁) | Both sides computed. |
| Iterated-image definition | A,k=0,1,2,3; zero operator on nonzero V; zero space | A dimensions 3,2,1,0; zero operator dimensions dim V,0,0,…; zero space dimensions all 0 | Added coverage distinguishes zero space from zero operator and includes N⁰. |
| Interval-type translation | [2,4] by −1 | [1,3] | Both endpoints change. |
| VN image-type formula | A and singleton | image [1,2], then shift −1 gives [0,1]=trunc A; singleton→empty | Unshifted vs shifted distinguished. |
| WL image-type formula | A and singleton | image [0,1]=trunc A without shift; singleton→empty | No extra shift. |
| Reconstruction rank route | A+B vs A | same off-diagonal ranks 1; diagonal at 1 is 2 vs 1 | Grade dimensions supply missing singleton. |
| Opposite-centralizer definition | VN A, C, zero | dimensions 0,1,0 | Full commuting endomorphism algebra is too large. |
| Opposite-pair operator law | C,L(v₁)=λv₀ | opposite operator sends v₁ to λv₀ | Same actual map. |
| Centralizer commutation law | H with coefficient λ | NL(y₁)=λx₁=LN(y₁); on y₂ both 0 | Boundary equation retained. |
| Restriction map definition/equation | H; C; zero | y₂↦λx₁; every scalar↦0; unique zero↦zero | Added all three tests. |
| Conjugation invariance of centralizer | C, diagonal change diag(2,1) | coefficient λ becomes 2λ; inverse divides by 2 | Linear equivalence, not equality of coefficients. |
| Precedes definition | [0,0]→[1,1]; self A; [0,0]→[2,2] | 0<1≤1≤1 true; 0<0 false; 2≤1 false | Endpoint order and adjacency separated. |
| Block-coordinate parameterization | H; Q | H one scalar; Q six independent scalars | Occurrence labels essential. |
| Boundary coefficient constraints | self A and adjacent singletons | self descending scalar forced 0; adjacent scalar arbitrary | Rejects spurious internal arrows. |
| Cut matrix-entry law | H at a=0,1 | same scalar appears in one entry at each cut | Coordinates independent at a fixed cut, not across powers. |
| VN restriction-surjectivity route | H image blocks [1,1],[2,2] | image criterion 1<2≤2≤2; original 0<1≤2≤2 | Every image scalar lifts. |
| WL restriction via reflection | reflected H; original up step +1 | down step −1, extending opposite step +1; same scalar λ | Both signs computed. |
| Polynomial topology transport | one-coordinate bases x and 2x | D(X) pulls back to D(2X)=D(X) | Basis change preserves topology. |
| Polynomial nonvanishing openness | D(X),D(3),D(0) | open sets ℂ excluding 0, whole space, empty | Defined generators include degeneracies. |
| Polynomial extensionality input | X(X−1); constant 3 in zero variables | evaluations at 0,1,2: 0,0,2; sole constant evaluation 3 | Imported pinned theorem. |
| Product nonvanishing | X and X−1 | product at 2 is 2, nonzero | Nonempty intersection witnessed. |
| Centralizer open-dense predicate | C scalar line | nonzero scalars open dense; zero omitted | Generic does not mean universal. |
| Finite intersections of dense opens | D(X),D(X−1); empty family | intersection contains 2; empty intersection is whole affine space | Includes dimension zero. |
| Surjective linear inverse image | projection ℂ²→ℂ of D(X) | preimage x≠0 contains (1,0), excludes (0,1) | Nonzero pulled-back polynomial. |
| Affine-subspace intersection proviso | D(X)∩{0}; D(X)∩{1} | empty; {1} dense in that point | Nonempty proviso necessary. |
| Euclidean-topology exclusion | unit disk | contains 0, excludes infinitely many reals ≥1; proper Zariski open has finite complement | Polynomial topology retained. |
| Generic-type construction | A,C,[0,0]+[2,2] | three singletons; [0,1]; unchanged separated singletons | Maximal ranks determine interval type. |
| Generic-locus exact type condition | C coefficients λ=0,1 | types C,[0,1]; 0 excluded,1 included | No arbitrary dense subset substituted. |
| Generic-locus openness/density | C; centralizer of A | ℂ excluding 0; one-point whole space | Zero-dimensional case works. |
| Generic-type conjugation invariance | C with diagonal basis change diag(2,1) | λ=1→2; both types [0,1] | Type independent of scalar choice. |
| Uniqueness of open dense type | C | zero-type locus {0} not open dense; chain locus nonzero scalars | Competing type rejected. |
| Generic-type shift compatibility | C shifted −2 | generic interval [−2,−1]=shift of [0,1] | Shift preserved. |
| Generic-locus shift compatibility | same nonzero λ before/after shift | λ=1 remains generic; λ=0 remains nongeneric | Same underlying endomorphism. |
| Incidence zero-locus definition | grades 0,1, up n, down l | commuting iff nl=0 | Two axes, not whole plane. |
| Trace nondegeneracy | scalar n=l=1 | tr(NL)=1 | Pairing not zero. |
| Tangent/commutator sign | N=E₂₁,L=E₁₂,X=diag(1,0) | NL−LN=diag(−1,1); tr(X[N,L])=−1=tr([X,N]L) | Sign witnessed. |
| Orbit smoothness/tangent interface | n≠0 on scalar up line; n=0 | orbit ℂ× dimension 1, tangent ℂ; point dimension 0, tangent 0 | Scope remains this action. |
| Conormal-bundle comparison | same two orbits | ranks 1−1=0 and 1−0=1 | Opposite fibres 0 and ℂ. |
| Conormal-closure dimension | same orbits | each axis has dimension 1=dim E₊ | Rank plus orbit dimension. |
| Incidence-component theorem | scalar incidence nl=0 | exactly two irreducible axis components | Proper containment excluded. |
| Opposite projection comparison | up-axis component; down-axis component | dense down orbit {0}; dense down orbit ℂ× | Swapping axes gives corresponding component. |
| Generic-fibre comparison | fixed n≠0; fixed n=0 | fibre {0} entire; fibre ℂ with dense open ℂ× | Nonempty in every orbit fibre. |
| Zero-space conormal convention | V=0 | trivial group, point spaces, one component, dimensions 0 | No positive dimension assumed. |
| Generic conormal symmetry | VN A and its zero opposite | generic opposite = three singletons; generic return =A | Pair recovered. |
| Dual definition | A,C,separated singletons | duals three singletons,[0,1],separated singletons | Geometric labels, not arbitrary involution. |
| VN generic-dual identification | C | generic opposite type [0,1]=dual C | Retained. |
| WL generic-dual identification/transpose | down chain [0,1] | generic up 0 has type C=dual [0,1] | Transpose keeps grade labels. |
| Dual grade-dimension preservation | Q and 2[0,1]+B | (2,3)=(2,3) | Multiplicities essential. |
| Dual total-length preservation | Q | 5=2·2+1 | Length, not occurrence count. |
| Dual translation compatibility | C shifted −2 | dual [−2,−2]+[−1,−1]=[−2,−1] | Sign fixed. |
| Dual nonadditivity | C vs its two summands | dual C=[0,1]; sum of dual singletons=C | Arbitrary additivity false. |
| Dual involutivity | A,C,Q,empty | dual twice A,C,Q,empty respectively | Empty point case retained. |
| Admissible definition/equivalence with genericity | C,L=0 or λ=1 | WL types C vs [0,1]; false,true | Actual dual type imposed. |
| Opposite-image definition | C,λ=1; H,λ=1 | range span(v₀) with N=0; range span(x₀,x₁) with N(x₀)=x₁ | N-stability from commutation. |
| Opposite-image embedding equation | H at x₀ | embed(N'x₀)=x₁=N(embed x₀) | Source and target fixed. |
| Image-admissibility definition | C,λ=1 | restricted VN and WL types [0,0]; dual singleton=[0,0] | Separate image equality holds. |
| Image-admissibility implies admissibility | C,λ=0 vs 1 | ambient false vs true; first rejected before image condition | Logical conjunction explicit. |
| Image-admissible locus open dense | C; A | C requires λ≠0; A sole zero map works | Both centralizer dimensions tested. |
| Nonempty-image genericity route | C,λ=1 | image point [0,0] has unique VN map 0 | Pullback locus nonempty. |
| Minor-chart openness | C scalar λ | chart λ≠0; reciprocal valid there, invalid at λ=0 | No division by zero. |
| Simultaneous-restriction carrier law | A,L=0,k=0,1,2,3 | onto dimensions 3,2,1,0; zero carrier at k=0 has dimension 0≠3 | Added range controls. |
| Simultaneous-restriction N-intertwining | A at k=1 | N(v₁)=v₂ on both sides | Not merely matching labels. |
| Simultaneous-restriction opposite-map law | C,λ≠0,k=0 | proposed 2λ map gives 2λv₀≠λv₀ on v₁ | Intertwining N=0 alone insufficient. |
| Simultaneous image-admissibility | C,λ≠0 | k=0 has WL chain; k≥1 zero; ambient λ=0 fails chain type | Equations and admissibility distinguished. |
| Simultaneous restriction on H | λ≠0,k=1 | VN type [1,1]+[2,2]; WL type [1,2]; zero replacement gives 0≠λx₁ | Corrected proposed swapped type. |
| Finite intersection over iterated images | A | N³=0; only k=0,1,2 nonzero carriers | Later conditions automatic. |
| Ram definition | C,A,separated singletons,empty | [0,0],empty,empty,empty | Correct image direction. |
| Dual of ramification identity | C | dual ram=[0,0]=trunc dual C | Involutivity route. |
| VN-image realization of ramification | H,λ=1 | (Im L,N) is [0,1]=ram H | Actual image, not WL label. |
| Ram length bound | H,C,A | lengths 2≤4,1≤2,0≤3 | Subspace dimensions. |
| Ram translation compatibility | C shifted −2 | ram=[−2,−2]=shift [0,0] | Shift sign retained. |
| Image-admissibility under shift | C,λ=1 shifted −1 | image singleton goes from degree 0 to −1 on both sides | Same carrier regraded. |
| Ram/truncation commutation | H,C,A | both sides [0,0]; both empty; both empty | Recomputed image convention. |
| Commuting-image/shift route | H,λ=1 | LN(y₁)=x₁=NL(y₁), common image grade 1; shift −1 gives [0,0] | Omission of shift would give [1,1]. |
| Adjacent-dual-count definition | C at a=0,1; A at 0 | 1,0,0; A's dual meeting count is 2 | Added containing-both control. |
| Cut occurrence-count preservation | 2[0,1]+B at 0,3 | counts 2,1 retained; at 3 both 0 | Full submultisegment. |
| Chain-weight bound | 2[0,1]+B; C | 3≤3; 1≤2 | Nat subtraction in deficit justified. |
| Chain-weight zero iff empty cut | C at 3 vs 0 | 0 iff card 0; weight 1 when card 2 | Both directions tested. |
| Endpoint strict transitivity | three singleton labels 0,1,2 | 0<1<2 on both endpoints; 0→2 true | No cycles. |
| Endpoint irreflexivity | every singleton at itself | 0<0 false | Diagonal matching edges forbidden. |
| Matching-size bound | three ordered singletons | maximum 2≤3 | Role constraints matter. |
| Maximum/bound characterization | C bound 0 or 1 | matching edge violates bound 0; every matching has size ≤1 | Both quantifier directions reflected. |
| Occurrence-permutation invariance | interchange two D labels | matching 0→0; width 2→2 | Endpoints retained under permutation. |
| Reflexive endpoint partial order | distinct equal D labels | x≤y false, y≤x false; x≤x true | Equality of labels, not intervals. |
| Weak duality for chain covers | 3-chain, antichain {1}; 3-antichain | each chain intersection size ≤1; three singleton parts needed | Any attaining witness is extremal. |
| Partition/matching comparison | singleton chain 0<1<2 | one chain gives two edges; matching size 2 gives 3−2=1 chain | Both directions computed. |
| Endpoint-incomparability/inclusion comparison | A,B; same-left [0,0],[0,1]; C | incomparable+included; incomparable+included; comparable endpoints+not included | Includes equal endpoints. |
| Full-copy weighted antichains | 2[0,1]+B | all three labels incomparable; distinct-support size only 2 | Width 3 equals weight 3. |
| Adjacent generic-rank theorem | Q; H at 0,1; A | ranks 2,1,1,0; matching sizes 2,1,1,0 | Independent entries attain bounds. |
| Cut edges give valid grade entries | C at 0; separated singletons at 0 | C one valid edge; separated cut contains only [0,0], hence no edge | Overlap inequality automatic only on the cut. |
| Minor/matching rank comparison | 2×3 singleton block | matrix [[1,0,0],[0,1,0]] has minor determinant 1 and rank 2 | Zero matrix rank 0 is nongeneric. |
| WL crossing-count comparison | H generic opposite at a=0,1 | one WL interval crosses each arrow; ranks 1,1 | Containing both grades. |
| Path-coordinate monotonicity | r=3,a=1 displayed path | first coordinates 2,1,1,1; seconds 1,1,2,3 | Values in [1,2]×[1,3]. |
| Path-step counts/existence bound | r=3,a=1; r=2,a=3 | 1 decreasing+2 increasing; impossible 3 decreases in 2 steps | a≤r necessary. |
| Unique invalid path vertex | same displayed path | j−i values −1,0,1,2 | Only first weight forced 0. |
| Path vertices form nested cut intervals | same valid vertices | [1,1]⊆[1,2]⊆[1,3] | Distinct vertices. |
| Window-bound predicate | [1,3],[0,1],[2,4],r=3; empty,r=0 | true,false,false,true | Lower and upper failures distinguished. |
| Unwindowed path bound | [0,1],r=3,a=1 | path weights all 0≤E₁=1 | Attainment still needs support window. |
| Interior chain interpolation | r=3,a=1,m=[1,1]+[1,3] | displayed path weight 1+0+1=2=E₁ | Added zero-weight vertices harmless. |
| Lower-boundary attainment | r=2,a=0,m=[1,1] | all-up weights 0,1,0; maximum 1 | Generalized headline. |
| Upper-boundary attainment | r=2,a=2,m=[1,2] | all-left weights 0,0,1; maximum 1 | Generalized headline. |
| Single-grade window attainment | r=1,m=2[1,1],a=0 or 1; outside-window m=[0,0],a=0 | first paths weights 0,2 and E=2; outside-window path weight 0 but cut card 1 | No r≥2 restriction; window explicitly retained. |
| Empty-window attainment | r=a=0 | only vertex (1,0); m empty; maximum 0 | Zeroth boundary covered. |
| Paths/chains need not be bijective | r=3,a=1,m empty | 3 paths all select empty support and weight 0 | No false bijection. |
| Monotone-minimum staircase rewriting | r=3,a=1,m=[1,2], two constant ν choices | path boundaries (2,1),(1,1),(1,2),(1,3) of weight 1 and (2,1),(2,2),(2,3),(1,3) of weight 0; cut card 1 gives rank sums 0,1 | Interior-only source rewriting retained. |
| Adjacent chain formula | C;2[0,1]+B;A+B;empty at 0 | 1+1=2;0+3=3;0+2=2;0+0=0 | Both counts checked. |
| Boundary adjacent formula | A at a=−1,2 | cut card 1, weight 1, dual crossing 0; 0+1=1 | All-integer formula needs no interior assumption. |
| Truncation inclusion preservation/reflection | [1,2]⊆A; [0,1] vs [1,2] | shortened [1,1]⊆[0,1] true; non-comparable originals remain [0,0],[1,1] | No nonsingleton collision. |
| Truncation of maximal singleton | [0,0]+[1,2] | first disappears, second becomes [1,1] and remains maximal | Singleton cannot contain a surviving nonsingleton. |
| Empty-cut peeling companion | empty; C at a=3 | weights (original,remainder,maximal)=(0,0,0) | Nonempty formula not applied. |
| Peeling upper-bound route | A+2B at 0 | original 3, remainder 2, loss 1 | Chain meets ≤1 distinct global maximum. |
| Peeling lower-bound route | same input | append/restore A to 2B gives weight 3 | Restored single copy required. |
| Maximal-part chain weight | C at 0; A+B at 0 | maxima C gives weight 1; sole A gives weight 1 | Not maximal-part cardinality. |
| Canonical ramified additivity | 2A;[0,0]+2[1,2]+[2,2] | empty=empty+empty; [0,0]=[0,0]+empty | Recomputed, no arbitrary split. |
| Split induction measure | A+B | length 4→2 under truncation | Strict positive drop 2. |
| Split grade-dimension route | [0,0]+2[1,2]+[2,2] at 0 | m cut 3,weight 2,deficit 1; maxima cut 2,weight 1,deficit 1; remainder cut 1,weight 1,deficit 0 | 1=1+0. |
| Split reconstruction route | same input | original ram [0,0], split ram [0,0]; both VN images zero and grade-0 dimensions 1 | New headline applies coherently. |
| Arbitrary ram additivity excluded | C as two singleton summands | ram C=[0,0] but sum of ram summands empty | Negative control retained. |
| Integral-segment adapter definition | [0,1],d=2,c=0 | twists ρ,ρν; group rank 2·2=4 | Positive cuspidal rank essential. |
| Adapter support/translation API | [b,e] shifted 2 | twists start b+c+2, end e+c+2 | Common determinant twist 2. |
| Empty adapter/unit API | empty,d=2 | rank 0, unit dimension 1 | GL₀ retained. |
| Normalized Z/L conventions | trivial line,[0,1] | Z=ν¹ᐟ² determinant, L=ν¹ᐟ² Steinberg; for adjacent singleton sum L=Z([0,1]) | Two-term normalization witness. |
| Representation-duality comparison | m=[0,1],ρ trivial; m=C | L([0,1])=Z(C); L(C)=Z([0,1]) | Both directions tied by duality. |
| Rank of comparison | d=2,[0,1] vs its dual C | both GL₄, lengths 2=2 | No GL₂ label collapse. |
| Unramified-character decomposition | χ=norm²,q=2 | c=−log(1/4)/log 2=2; χ₀=1 | Sign and nonzero denominator. |
| Unit-valued/uniformizer conditions | χ unitary; ϖ replaced by uϖ | modulus 1 gives c=0; χ(u)=norm(u)=1 keeps c | No dependence on uniformizer. |
| Equal-characteristic application | F=𝔽₂((t)),trivial line,C | q=2, two input singleton ranks 1+1=2; dual one length-2 interval | No mixed-characteristic condition. |
| Least-endpoint dual recurrence | A; C | A removes left singleton output [0,0], then [1,1],[2,2]; C selects p=2 and outputs [0,1] | Endpoint minimum/maximum conventions separated. |
| Recurrence measure | C with p=2; A with p=1 | lengths 2→0=2−2;3→2=3−1 | Positive decrease. |
| Duplicate recurrence behavior | D | dual 2[0,0]+2[1,1], both grade dimensions 2 | Deduplication would give 1,1. |
| MW decreasing lexicographic order | [0,2],[2,2]; [1,3],[2,3] | first smaller in each pair | Weak threshold for matches preserved. |
| Singleton extraction | C,k=1;2[0,0],k=0 | m′=[0,0] in both; ranks drop by d | Last greatest-left interval fixed. |
| Involution on embeddings | trivial-line singleton | τ fixes α, rank 1→rank 1; product order reverses while total rank unchanged | Scoped rank-one statement retained. |
| Right-singleton candidates | q=[0,0],k=1 | labels C or [0,1], each length 2 | Addition or extension, not arbitrary interval. |
| Quantified matching exclusion | q=A+[1,3]+[2,2],k=3,A-choice=[2,2] | smaller [0,2] matches [1,3], and 0<1≤3≤3; extension [0,3] excluded | Matching controls specified smaller occurrences. |
| Dual reinsertion | C;2[0,0] | extend [0,0] to [0,1]; absent A adds [0,0] | Both branches. |
| Reinsertion equality threshold | m=2[0,1]+[1,2]+[2,2] | m′ dual [0,0]+[0,1]+[1,1]+[1,2]; A=[1,1],C=[1,2]=extended A; new dual [0,0]+[0,1]+2[1,2] | Strict threshold would fail valid witness. |
| Cuspidal-line label independence | d=1 vs d=2 on C | same dual label [0,1]; group ranks 2 vs 4 | Comparison of labels, no cross-group isomorphism. |
| Comparison induction inputs | C and its shorter label | lengths 2→1, both involutions return C after two applications | No new supplier cycle. |
| Newform example definition | seven displayed intervals | cardinality 7; lengths 2+5+2+4+1+2+1=17 | Distinct from basis dimension. |
| Newform example degree dimension | degree 3 | four contributors [3,7],[3,4],[2,5],[3,3] | Singleton contribution retained. |
| Newform full dual | same input | [0,3]+[2,4]+2[3,3]+2[4,5]+[5,6]+[6,6]+[7,7], total length 17 | Independently recomputed recurrence. |
| Newform ramification identity | same input | ram=[0,0]+[1,2]+[2,5]+[4,4], length 1+2+4+1=8 | No second shortening. |
| Newform maximal-piece calculation | maximal [0,0]+[1,2]+[2,5]+[3,7] | dual [0,3]+[2,4]+[4,5]+[5,6]+[7,7]; truncation [0,2]+[2,3]+[4,4]+[5,5] | Exactly one shortening. |
| Newform remainder calculation | [3,3]+[3,4]+[5,6] | maximal [3,4]+[5,6] ramifies to [4,4]; singleton ram empty | Canonical split twice. |
| Newform output Checks | computed ram at grade 3 | cardinality 4, length 8, grade-3 dimension 1 | Matches all displayed formulas. |
| Downstream image-rank interface | H on Im L; C on Im L | ram lengths 2 and 1; types [0,1] and [0,0] | Supplies actual type equalities, not labels without maps. |

## Maintainer consequences

New acceptance names are `reconstruction_from_image`, `centralizer_image_extension`, and `finite_dilworth`, all in `TauCetiRoadmap.QuiverRepresentationsPartII`. No existing declaration was renamed or deleted. `grid_path_chain_max` now takes a proof of a≤r in place of the former two interior inequalities; consumers supplying positional arguments must update that invocation. There is no cross-roadmap theorem move or dependency-order change. The repairs are ready for the required fresh independent review; this report is not an acceptance decision.
