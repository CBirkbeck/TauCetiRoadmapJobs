# Port: QuiverRepresentationsPartII

Branch: `roadmap/quiver-representations-part-ii`.
Head commit: `a462714dca41eef47f754f11bcb8573f36e8a743`.
Initial status was empty and initial HEAD was `ae2562c`. The committed content consists of `TauCetiRoadmap/QuiverRepresentationsPartII/README.md`, `TauCetiRoadmap/QuiverRepresentationsPartII/Suggested.lean`, and `TauCetiRoadmap/QuiverRepresentationsPartII/metadata.toml`. The package inputs were unchanged. This report is the separately requested output under `packages/QuiverRepresentationsPartII/reports/`.

## Draft pull request body

Develop multisegment duality from opposite-degree commuting operators on finite complex graded spaces, continuing QuiverRepresentations beyond its finite type-A classification. The roadmap builds actual-image reconstruction and centralizer restriction, polynomial genericity and conormal symmetry, adjacent generic ranks through weighted chains and finite Dilworth, and ramified truncation with additivity for the canonical maximal split. It identifies the geometric dual with the Zelevinsky involution on every real translate of an integral supercuspidal line of arbitrary positive cuspidal rank, providing the interval identities needed for general-linear newform arguments.

AI-assisted port and mathematical audit by Codex (GPT-6).

## Validation

Build exit status: 0. Exact outcome line:

```text
Build completed successfully (8978 jobs).
```

Exactly 13 warnings, all saying that a declaration uses `sorry`; no other warning or error. The module build line was:

```text
⚠ [8978/8978] Built TauCetiRoadmap.QuiverRepresentationsPartII.Suggested (5.5s)
```

Gate exit status: 0. Exact summary line:

```text
gate QuiverRepresentationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Explicit dependency-order check, exit 0:

```text
depcheck: 35 roadmaps, 327 edges, 0 problem(s)
```

No UPWARD, CYCLE, or moved line. The merge-order file was unchanged. The first full gate found only the untracked target directory (`dirty=1`); its content and dependency counters were zero. The final gate was run on the committed tree, with every counter zero. Whitespace validation passed.

The source package's Lean file already satisfies the acceptance-test rule and is byte-for-byte preserved: one `import Mathlib`, the used `TauCeti.LinearAlgebra.Graded.LinearMap` import, 29 real-bodied definitions/carriers, and 13 admitted headline theorems. There are no examples, sorry'd data, or options. No statements moved from Lean to README during this port, and no statable headline was dropped. The module docstring retains the unavailable-headline list and its missing carriers.

The mechanical binder audit elaborated one scratch file containing the final module and `#check @name` for all 42 explicit declarations. It exited 0 with the same 13 admission warnings. Every elaborated type was compared with its README statement: no binder repair was necessary. In particular, reconstruction retains equal grade finranks, both grade-membership directions and restricted intertwining; extension retains either direction, opposite homogeneity, commutation and value agreement; finite Dilworth retains its universe, partial order, finite carrier and decidable equality; path attainment retains exactly a≤r and the support window; peeling retains the nonempty cut. The irreducibility statement explicitly supplies the polynomial topology even though the pretty-printer hides that argument.

## Dependencies, ownership, and duplication

The only supplier roadmap still in a pull request is **SmoothRepresentationsOfLocalGroups**, SR.0–SR.3, SR.5.2 *segment-representations*, and SR.5.3 *highest-derivative-adapter*. These targets were read using `roadmaps show` at its indexed new-folder head. QuiverRepresentations Layers 1, 2 and 5 and AlgebraicVectorBundles L0B and L2B were checked in the supplied content checkout on main. EndoscopicTransferAndUnitaryTraceComparison §10.23 is a potential consumer, not a supplier. GraphConnectivityAndFlows, Scope boundaries, explicitly excludes finite Dilworth; it supplies nothing to that target.

The ownership sweep used `roadmaps grep` across every indexed open roadmap head and main, direct object searches of the board packages, and all 34 supplied sibling checkouts. Searches covered interval multiplicities, generic commuting types, image reconstruction, opposite-degree centralizers, finite chain partitions, Dilworth, orbit conormals, and the retained theorem names. No retained fully qualified declaration collides with another readable roadmap. General graded Hom APIs, path algebras, Krull–Schmidt, type-A classification, general vector bundles, smooth classification, and the representation involution retain their named suppliers. No new duplicate target was deleted and no mathematical ownership moved across the merge order.

SpringerResolutionAndCharacteristicCycles, design target *steinberg-components*, describes conormals for diagonal flag-variety orbits and the Steinberg variety, with its cotangent embedding and Weyl-indexed strata. It does not supply the integer-graded operator action here. The scoped conormal comparison belongs here, using AlgebraicVectorBundles for its general bundle carriers. SchurWeyl's image centralizers concern tensor representation algebras, and the monodromy operators in the other search hits concern filtrations and Weil actions; neither is the opposite-degree extension theorem. The requested open-head ownership check was performed, not left unchecked.

Supplier replacements: the existing use of pinned homogeneity, actual ranges, polynomial extensionality, quiver equivalence and Krull–Schmidt was retained. The broad assertion that the smooth supplier explicitly supplies common-twist compatibility was narrowed to its actual classification contract: §5.4 now owns the precise compatibility law and derives it from the character-twist functor and unique-subrepresentation/quotient characterizations. This changes no mathematical scope and adds no supplier.

## Upstream-reviewer pass and content changes

All 35 numbered subsections, six Examples blocks, hypotheses, source locators, source recurrence, occurrence-sensitive matching conditions and worked computations were retained. Definition APIs are explicit mathematical bullet lists. Added controls test grading membership and internal decomposition, shift identity/composition/inverse, pair-isomorphism invertibility, actual pair types, centralizer operator values, independent duplicate coordinates, generic loci, conjugation, actual opposite-image embeddings, and the scalar conormal components. The accepted decisions on general cuspidal rank, boundary path attainment, nonempty peeling, native range headlines, and the weak reinsertion threshold are preserved.

The final read identified and repaired these points:

1. Conventions ambiguously called the two-coordinate matrix E₂₁ after discussing both directions. It now states VN=E₂₁ and WL=E₁₂ in the ordered basis (v₀,v₁), agreeing with all later arrows and the trace witness.
2. Scheme language could obscure whether the incidence component cover was a statement on arbitrary test schemes. The convention now explicitly uses reduced finite-type complex varieties. The square-zero test n=l=ε, ε²=0, satisfies nl=0 but factors through neither axis; the README distinguishes this from the underlying component cover. No scheme reducedness theorem is asserted.
3. The smooth supplier does not separately name the full twist/involution compatibility asserted by the package. Its classification characterizations suffice to derive it, so the exact law is now in the adapter API and its uses point there.
4. The conormal route's Needs line did not enumerate the bundle supplier and geometric comparisons. It now lists finite orbit classification, commuting fibres, rank topology, AlgebraicVectorBundles L0B/L2B, the orbit theorem's hypotheses, and the scoped tangent, dimension, projection and fibre targets individually.
5. The pair-rank finite-difference formula now has an explicit Z98 formula-(2) locator and its general interval-count justification. The final representation argument is explicitly one proof route.
6. Relative links replace main-branch web links for the two local roadmap suppliers. Metadata remains `topic = "math.RT"`, matching the neighboring representation roadmap.
7. The package attributed excluded Aubert, Langlands and conductor work to unspecified existing owners. Scope now states the exclusion directly and identifies only the verified smooth-representation contract as input; it imposes no new obligation on an unnamed roadmap.

No requested mathematics was weakened, lost or replaced by a stand-in. Definitions needed only for planned geometric constructions remain README targets; the actual-image headlines remain native Lean statements.

## Source and pin audit

The working copies of the dependencies were confirmed at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, exactly the manifest pins. No manifest or toolchain was edited. Source locators below identify the cached numbered text; MW line references are image-page markers, whose pages were rendered and read. Z81 line references identify the publisher's PDF text reached through the reference's original-article link.

| Source | Locators inspected and scope |
|---|---|
| AKY | AKY line 264: segment conventions; line 278: character normalization; line 319: ramification; line 422: one-copy maxima; line 430: split theorem; line 459: worked example; line 554: reconstruction; line 588: shift; line 594: arrows; line 620: classification; line 631: both extension directions; line 651: shifted VN/unshifted WL images; line 676: image admissibility; line 734: iterated images; line 757: commuting truncations; line 766: maximal peeling; line 771: adjacent count; line 793: interior rewriting; line 819: path endpoint; line 838: inconsistent converse-path endpoint; line 863: domination rather than bijection; line 878: split proof. |
| Z98 | Z98 line 67: generic opposite type; line 90: rank finite differences; line 140: least-left recurrence; line 152: geometric dual recurrence and decreasing length. The scratch evaluator implements this relation for finite checks only. |
| DIL | DIL line 27: finite-poset laws; line 40: finite Dilworth; line 59: the cardinality induction and gluing; line 104: split graph; line 111: matching-to-chain count; line 145: incomparable copies. The roadmap uses the mathematical correspondence, not a computational algorithm. |
| MW | MW line 184: printed p.147, embedding reversal and arbitrary positive cuspidal rank; line 185: p.148, endpoint order; line 187: p.150, reinsertion; line 188: p.151, its matching condition; line 197: p.160, block-coordinate equations; line 198: p.161, converse and boundary cases; line 199: p.162, generic-geometric identification and affine slices; line 200: p.163, explicit nonempty-intersection proviso; line 206: p.169, involutivity; line 209: p.172, right-singleton candidates; line 210: p.173, reversed-product comparison; line 211: p.174, exclusion and extraction; line 212: p.175, uniqueness and independence; line 213: p.176, independence and the two-induction comparison; line 214: p.177, conclusion by the two involutions. |
| Z81 | Z81 line 406: §4.3, finite-orbit conormal symmetry over ℂ; line 416: the graded action; line 418: trace pairing; line 428: involutivity; line 431: Proposition 4.4; line 436: tangent-annihilator computation; line 441: §4.5 is a conjecture. Its original Russian PDF is accessible from the linked journal page, resolving the accepted package report's text-access limitation. The read-only source manifest is unchanged. |

The citation resolver reports no missing cross-roadmap citation or roadmap Lean name. Its library scan says pinned packages are unavailable in its host context; every library contract was therefore checked directly in the worktree's pinned files, rather than treating that scan as verification.

| Native contract | Pinned file and actual meaning |
|---|---|
| Internality | `Mathlib/Algebra/DirectSum/Basic.lean:440`: bijectivity of the canonical sum map, not only disjointness. |
| Ranges | `Mathlib/Algebra/Module/Submodule/Range.lean:57` and `:155`: actual image and range-valued restriction. `Mathlib/Algebra/Module/Submodule/Map.lean:52` uses the actual image of a submodule. |
| Bases | `Mathlib/LinearAlgebra/Dimension/Free.lean:334` uses freeness and finite generation; `Mathlib/LinearAlgebra/Basis/VectorSpace.lean:152` gives a basis but alone no finite dimension. |
| Matrix rank | `Mathlib/LinearAlgebra/Matrix/Rank.lean:132`: finrank of the range of the matrix linear map, specialized here to ℂ. |
| Polynomial evaluation | `Mathlib/Algebra/MvPolynomial/Eval.lean:256`: ring-hom evaluation; `Mathlib/Algebra/MvPolynomial/Funext.lean:82`: extensionality over an infinite integral domain. |
| Topology | `Mathlib/Topology/Order.lean:70`: generated topology; `Mathlib/Topology/Irreducible.lean:48`: nonempty and preirreducible. Neither supplies orbit dimension. |
| Chains | `Mathlib/Order/Preorder/Chain.lean:51` and `Mathlib/Order/Antichain.lean:42`: pairwise predicates on distinct members, with no attaining partition theorem. A full pinned-source object search found no finite Dilworth supplier. |
| Homogeneity | `TauCeti/LinearAlgebra/Graded/LinearMap.lean:56` literally sends grade p to grade p+q; there is no internal-sum assumption. Lines 61, 80, 95, 138 and 146 supply its mapping, additive, composition, scalar and submodule API. |
| Local nilpotence | `TauCeti/LinearAlgebra/End/LocallyNilpotent.lean:104`: an exponent for each vector on a well-founded weighted basis, not the uniform finite-coordinate headline. |
| Constructible orbit | `TauCeti/Topology/Algebra/MulAction/Orbit.lean:87`: local closedness requires a Noetherian space, the ambient homeomorphic action and constructibility. |
| Quiver representations | `TauCeti/RepresentationTheory/Quiver/Representation/Basic.lean:53`: path functors; `AsModule.lean:574`: finite-vertex module equivalence; `KrullSchmidt.lean:85`, `:110`, `:148`: decomposition, matching equivalence, and isomorphism-class multiplicities for pointwise finite-dimensional representations. |

The Mathlib/Zulip design searches found no usable new interface beyond the pinned chain vocabulary; the historical finite-poset link could not be fetched and was not treated as a supplier. Mathematical development remains owned here. External text was treated as data; no fetched command, script, credential request or external-write instruction was executed.

## Adversarial mathematics pass

These are finite computations and explicit mathematical witnesses, not proofs of the admitted general theorems. Let A=[0,2], B=[1,1], C=[0,0]+[1,1], D=2[0,1], H=[0,1]+[1,2], and Q=2[0,0]+3[1,1]. For H use N(x₀)=x₁ and N(y₁)=y₂; L(y₁)=λx₀ and L(y₂)=λx₁, zero otherwise. Empty means the empty multiset or zero carrier as appropriate.

The independently written scratch evaluator checked 1,001 multisets of at most four intervals with endpoints in [−1,2], all 7,007 cuts in [−3,3] (4,500 nonempty and 2,507 empty), 3,003 translations, 1,835 window/path-attainment cases for r≤4, 31,031 unrestricted path bounds, all 100 ordered block-pair equation systems, and all 51 naturally topologically ordered posets on at most four labels. Relabeling covers all small poset order types. All assertions passed. It also recomputed the full newform example separately from its canonical-split computation.

The tables cover each acceptance declaration, then the remaining defining laws, conventions and theorem interfaces. Values True/False below are evaluations of the actual mathematical predicates, not Lean placeholders.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Interval | A, singleton, reversed pair | 0≤2 true; 1≤1 true; 2≤1 false | Retained nonempty carrier. |
| Interval.contains | A at 0,2,3 | true,true,false | Inclusive ends agree. |
| Interval.included | B in A; A in B | true,false | Inclusion direction agrees. |
| Interval.shorten | A, B | [0,1], absence | Singleton deletion agrees. |
| Multisegment | D, empty | card 2,0; lengths 4,0 | Occurrences retained. |
| rightTruncate | D, A+B, empty | 2[0,0], [0,1], empty | Full multiplicity agrees. |
| occurrenceInterval | C,D,empty | distinct value counts 1,1; repeated value count 2; zero labels | No constant selector. |
| maximalPart | 2A,A+B,C | A,A,C | One distinct maximal copy. |
| remainder | 2A,A+B,C | A,B,empty | Other copies retained. |
| Space | n=0; degree list (0,0,1) | dimensions 0,3 | Multiplicities allowed. |
| Space.Carrier | n=0,1,2 | complex dimensions 0,1,2 | Native carrier agrees. |
| Space.grade | degree list (0,1), vector (1,0) | grade 0 true; grade 1 false; grade 2 dimension 0 | Membership control added. |
| Direction | up,down | two constructors, no third | No zero-step direction. |
| Direction.step | up,down | 1,−1 | Sign agrees. |
| Homogeneous | E₂₁, identity, zero on degrees (0,1) | E₂₁ has +1 and fails −1; identity fails +1; zero has both | Supplier condition retained. |
| Pair | E₂₁ with up,down | first valid, second invalid | Degree proof constrains operator. |
| Space.internal | n=0; degrees (0,1) | 0→0 bijective; (u,0)+(0,v)=(u,v) uniquely | Whole grading agrees. |
| Pair.nilpotent | E₂₁; zero singleton; zero space | N²=0≠N; 0¹=0; identity=0 on zero space | Uniform exponent valid. |
| reconstruction_from_image | A+B vs itself; A+B vs A; singletons at 0 vs 1 | identity works; middle grade 2≠1; grade-0 dimensions 1≠0 | Native hypotheses exclude wrong models. |
| centralizer_image_extension | H, reflected H, zero image | y₂↦λx₁ extends by y₁↦λx₀; NL(y₁)=λx₁=LN(y₁); reflected steps −1,+1; zero extends to zero | Both directions agree. |
| polynomialTopology | one variable, zero variables | D(X)=ℂ excluding 0; D(3)=whole point; D(0)=empty | Polynomial topology retained. |
| polynomial_irreducible | dimensions 1,0 | X(X−1) at 2 is 2≠0; zero-dimensional universe has one point | Nonempty intersections witnessed. |
| cutPart | C at 0,3 | card 2,0 | Either-grade predicate agrees. |
| IsInclusionChain | {A,B}, empty, C support | true,true,false | Native vocabulary retained. |
| chainWeight | A+B,2[0,1]+B,C,empty at 0 | 2,3,1,0 | Full weights agree. |
| endpointBefore | adjacent singletons, A/B, equal copies | true,false,false | Both endpoints strict. |
| IsEndpointAntichain | D,C,empty | true,false,true | Copies remain incomparable. |
| IsEndpointMatching | edges 0→1,1→2; 0→1,0→2; 0→2,1→2 | valid size 2; invalid reused left; invalid reused right | Roles checked separately. |
| matchingNumber | C,D,three singletons,empty | 1,0,2,0 | Maxima agree. |
| antichainWidth | C,D,three singletons,empty | 1,2,1,0 | Multiplicity agrees. |
| finite_dilworth | empty,3-chain,3-antichain,diamond | antichain/partition sizes 0/0,1/1,3/3,2/2 | Full poset statement retained. |
| weighted_dilworth | C,D,three singletons,empty | 1+1=2; 0+2=2; 2+1=3; 0+0=0 | All finite probes pass. |
| cut_antichain_width | A+B,2[0,1]+B,C,empty at 0 | width/weight 2/2,3/3,1/1,0/0 | Both notions agree. |
| GridPath | r=3,a=1; r=a=0; r=2,a=3 | (2,1),(1,1),(1,2),(1,3); sole (1,0); 3 decreases impossible in 2 steps | Endpoints and emptiness agree. |
| intervalWeight | 2[1,3] at (1,3),(2,1),(1,2) | 2,0,0 | Reversed/absent inputs totalized correctly. |
| GridPath.weight | displayed path on 2[1,3],empty | 0+0+0+2=2; all zeros=0 | Vertex sum agrees. |
| InWindow | [1,3],[0,1],[2,4] with r=3; empty,r=0 | true,false,false,true | Both bounds checked. |
| GridPath.weight_bound | 2[1,3]; outside-window [0,1]; empty r=a=0 | 2≤2; 0≤1; 0≤0 | No extra hypothesis added. |
| grid_path_chain_max | [1,1],a=0,r=2; [1,2],a=r=2; empty r=a=0 | path sums 1=E₀; 1=E₂; 0=E₀ | Boundary generality retained. |
| truncate_maximalPart | 2A; [0,1]+[0,0]; [0,0]+2[1,2]+[2,2] | both [0,1]; both [0,0]; both [1,1] | All finite probes pass. |
| truncate_remainder | same three inputs | both [0,1]; both empty; both [1,1] | Subtraction multiplicity agrees. |
| chainWeight_peeling | [0,0]+[0,1]; A+2B; singleton; empty cut | 2=1+1; 3=2+1; 1=0+1; empty would give 0≠1 | Nonempty hypothesis retained. |

| README statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Closed intervals and absence | [3,3],[3,4],[4,3] | lengths 1,2; reversed pair rejected | Convention agrees. |
| Interval length and positivity | A,B | 2−0+1=3; 1−1+1=1 | Minimum is 1. |
| Endpoint extensionality | A vs A; A vs [0,1] | equal (0,2)=(0,2); unequal 2≠1 | Both directions of equality agree. |
| Inclusion reflexivity | A,B | A⊆A true; B⊆B true | API in bullets. |
| Inclusion transitivity | B⊆[0,1]⊆A | all three inclusion predicates true | API in bullets. |
| Inclusion antisymmetry | B,A | B⊆A true, A⊆B false; A=A both true | Unequal pair excluded. |
| Interval translation | [2,4] by −1,0 | [1,3],[2,4] | Both endpoints shift. |
| Shifted membership | 2,5 in [2,4], shift −1 | true↔true at 1; false↔false at 4 | Both implication directions agree. |
| Shifted length | [2,4] by −1 | 3=3 | API in bullets. |
| Shift identity/composition/inverse | [0,1], shifts 0; −1 then 2; −1 then 1 | [0,1]; [1,2]=shift 1; [0,1] | Added explicit controls. |
| Multisegment shift | 2[2,4] by −1 | 2[1,3], counts 2=2 | No deduplication. |
| Truncation additivity | [0,0]+[1,3] | [1,2]=empty+[1,2] | API in bullets. |
| Truncation/translation commutation | [2,4] by −1 | shorten [1,3]=[1,2]=shift [2,3] | All 3,003 shift probes agree. |
| Degree dimension | A+B at 0,1,2,3 | 1,2,1,0 | Inclusive counts agree. |
| Grade-dimension additivity | A+B at 1 | 2=1+1 | API in bullets. |
| Total length | A+B,empty | 4=3+1; 0 | Distinct from occurrence card 2. |
| Length as sum of grade dimensions | A+B | 4=1+2+1 | Finite support matters. |
| Exact truncation length decrement | A+B,empty | 4=2+2; 0=0+0 | Strict drop only for nonempty input. |
| Occurrence count and permutation | D with labels interchanged | two labels at [0,1] before and after; absent [1,1] count 0 | Count preserved. |
| Maximal count criterion | 2A+B | maximum counts A:1,B:0 | One copy, no contained interval. |
| Maximal part below original | 2A+B | A-count 1≤2; B-count 0≤1 | Subtraction justified. |
| Maximal part plus remainder | 2A+B | A+(A+B)=2A+B | No lost multiplicity. |
| Comparable maxima equal | A+B; C | sole maximum A; C's two maxima incomparable | Distinct comparable maxima absent. |
| Existence of containing maximum | B in A+B; [2,2] in [0,0]+2[1,2]+[2,2] | B⊆A; [2,2]⊆[1,2] | Finite support route agrees. |
| Empty maximal decomposition | empty | empty+empty=empty | Empty convention agrees. |
| Layer-0 example | [0,0]+2[1,2]+[2,2] | maxima [0,0]+[1,2]; remainder [1,2]+[2,2]; truncation 2[1,1] | All displayed values recomputed. |
| Abstract grading coordinates | grade dimensions 2 at 0,1 at 1 | n=3, degree list (0,0,1) | Arbitrary multiplicities retained. |
| Finite grading support | degree list (0,0,1); n=0 | supports {0,1},empty | No spurious nonzero grades. |
| Grade finrank/count | same degree list at 0,1,2 | finranks 2,1,0 equal coordinate counts 2,1,0 | API in bullets. |
| Constant presentation | n=2,a=3; n=0 | grade-3 dimension 2; grade-4 dimension 0; zero case all 0 | Three controls retained. |
| Grade-membership characterization | degree list (3,3), vector (1,2), zero | grade 3 true, grade 4 false; zero in both | Zero is no negative control. |
| VN/WL arrows | ordered basis (v₀,v₁) | N(1,0)=(0,1), L(0,1)=(1,0) | Clarified E₂₁ vs E₁₂. |
| Direction reversal | up,down,twice-reversed up | down,up,up; steps −1,1,1 | Added controls. |
| Grade reflection | A | [−2,0], operator step +1→−1 | Different from unchanged-grade transpose. |
| Pair isomorphism definition | zero singleton at 0 vs 1 | underlying dims 1=1; grade-0 dims 1≠0 | Degree condition excludes wrong equivalence. |
| Pair isomorphism identity | N=E₂₁ | IN=NI=N | API in bullets. |
| Pair isomorphism inverse | scalar map 2I | (1/2 I)(2I)=I | Invertibility control added. |
| Pair isomorphism composition | 2I,3I | composite 6I; 6IN=N6I | API in bullets. |
| Pair isomorphism negative | N vs 0; proposed zero equivalence | Iv₀=v₀ but INv₀=v₁≠0; zero map has rank 0<2 | Both models excluded. |
| Zero pair | singleton and zero space | operator 0, first power 0 | No nonzero-carrier requirement. |
| Finite-window equivalence | [0,0]; [0,1] increasing/decreasing | one space/zero arrow; arrow coefficient 1 with opposite orientations | No classification cycle. |
| Window unit/counit and enlargement | [0,1] extended to [−1,2] | arrows 0,1,0 restrict to 1; identity intertwiner preserved | Source and target specified. |
| Standard space and basis | A,D | dimensions 3,4; D's repeated grade has two basis vectors | No set model. |
| Standard vector definition | [0,1] at 0,2 | nonzero v₀; zero at 2 | Junk grade handled. |
| Standard-vector independence | two [0,1] at grade 0 | vectors (1,0),(0,1), determinant 1 | Duplicate labels independent. |
| Standard-vector membership | valid vector at 0, invalid vector at 2 | v₀ in grade 0; invalid 0 in every grade | No outside basis vector. |
| Standard-vector basis identity | A at 1 | coordinate 1 at (occ,1), zero at other labels | Zero model excluded. |
| Standard-space grade formula | A+B at 1 | dimension 2=count 2 | API in bullets. |
| Standard-space total formula | A+B | dimension 4=length 4 | API in bullets. |
| Standard up arrow | A | v₀→v₁→v₂→0 | Upper boundary killed. |
| Standard down arrow | A | v₂→v₁→v₀→0 | Lower boundary killed. |
| Standard-pair type | WL singleton at 2; D in either direction | [2,2]; 2[0,1] | No support translation. |
| Classification iff | zero vs nonzero arrow on degrees (0,1); H vs itself | types C vs [0,1] differ; same H gives identity isomorphism | Both directions tested. |
| Type grade dimensions | A+B | (1,2,1)=counts (1,2,1) | Full multiplicities. |
| Rank table including diagonal | A+B | diagonal (1,2,1); R(0,1)=R(1,2)=R(0,2)=1 | Zero-length paths present. |
| Rank finite differences | A+B at [0,2],[1,1] | 1−0−0+0=1; 2−1−1+1=1 | Explicit locator added. |
| Rank table determines type | A+B vs A | off-diagonal ranks equal 1; diagonal middle 2≠1 | Singleton positions detected. |
| WL rank direction | down A, 2→0 | L²v₂=v₀, rank 1 | Correct direction. |
| Shift-space definition | A shifted −1 | degrees −1,0,1 | V(c)ₐ=Vₐ₋c retained. |
| Shift-pair definition | same shifted A | same nonzero arrows, degrees −1→0→1 | Underlying operator fixed. |
| Image pair | VN A | range span(v₁,v₂), arrow v₁→v₂→0 | Actual carrier. |
| Image-model range/injectivity | image basis mapped to v₁,v₂; zero; v₀,v₁ | ranges span(v₁,v₂),0,span(v₀,v₁) | Only first satisfies range law. |
| Image-model grading | valid basis vs v₀,v₁ embedding | degrees 1,2 vs 0,1 | Regrading cannot repair wrong range. |
| Image-model intertwining | A image at v₁ | embed(N'v₁)=v₂=N(embed v₁) | Both sides equal. |
| Iterated image | A at k=0,1,2,3 | dimensions 3,2,1,0; types [0,2],[1,2],[2,2],empty | Zeroth power included. |
| Iterated image for zero maps | zero on nonzero V; zero space | dimensions dim V,0,0,…; all 0 on zero space | Carriers distinguished. |
| Successive image compatibility | A at k=1 then one image | span(v₂)=range N² | Iteration law agrees. |
| Interval type under shift | [2,4] shifted −1 | [1,3] | Both endpoints agree. |
| VN image/truncation formula | A,singleton | image [1,2] shifted −1 gives [0,1]=trunc A; singleton empty | Shift essential. |
| WL image/truncation formula | A,singleton | image [0,1]=trunc A; singleton empty | No added shift. |
| Images commute with shift | A shifted −1 vs shifted image | both image type [0,1] | Same underlying range. |
| Reconstruction route | A+B vs A | same unshifted image [1,2]; grade-1 dims 2≠1 | Hypothesis detects extra singleton. |
| Opposite centralizer | VN A,C,zero space | dimensions 0,1,0 | Full centralizer is wrong model. |
| Opposite-pair operator | C with λ=0,1,2 | v₁↦0,v₀,2v₀ respectively | Actual coefficient control added. |
| Commuting equation | H at y₁,y₂ | NLy₁=λx₁=LNy₁; NLy₂=0=LNy₂ | Correct boundary. |
| Restriction map | H,C,zero | y₂↦λx₁; all coefficients restrict to 0 on C's zero N-image; unique zero | Three distinct restrictions. |
| Restriction linearity | H, coefficients 1 and 2 | restricted sum coefficient 3=1+2 | Complex linear map. |
| Centralizer conjugation | C by diag(2,1) | λ→2λ→λ after inverse | Equivalence, not equal coordinates. |
| Conjugation/restriction compatibility | H, coefficient 1, target block rescaled by 2 and source fixed | ambient coefficient 1→2 and image coefficient 1→2; both arrows have coefficient 2 | Both embeddings retain the scalar. |
| Precedes criterion | [0,0]→[1,1]; A→A; [0,0]→[2,2] | 0<1≤1≤1 true; 0<0 false; 2≤1 false | Endpoint and overlap checks agree. |
| Block coordinate theorem | H,Q; all ordered interval pairs in test window | 1 and 6 independent scalars; each of 100 kernel dimensions equals the criterion 0 or 1 | Direct equation systems computed. |
| Boundary coefficient equations | self A; adjacent singletons | self descending coefficient 0; adjacent coefficient arbitrary λ | False internal arrow excluded. |
| Coordinate inverse maps | H coefficient λ=2 | extraction/reconstruction returns 2 and y₂↦2x₁ | Both directions witnessed. |
| Adjacent entry vs repeated coordinate | H at cuts 0,1 | one entry λ at each cut; same λ across cuts | No power-rank shortcut. |
| VN restriction surjectivity | H image blocks [1,1],[2,2] | 1<2≤2≤2 implies original 0<1≤2≤2; λ lifts unchanged | Native extension agrees. |
| WL restriction by reflection | H reflected at a↦−a | down degree −1, extension degree +1, same λ | Opposite sign correct. |
| Polynomial basis independence | coordinate change x↦2x | D(X) pulls back to D(2X)=D(X) | No Euclidean substitution. |
| Nonvanishing openness | X,3,0 | nonzero line,whole,empty respectively | Generators include degeneracies. |
| Polynomial extensionality | X(X−1); zero-variable constant 3 | values 0,0,2 at 0,1,2; sole value 3 | Infinite-domain supplier used. |
| Finite-field negative control | X²−X over 𝔽₂ | values 0,0 but coefficient of X² is 1 | Explains why complex/infinitude hypotheses remain. |
| Finite product/nonempty opens | X,X−1 at 2 | product 2≠0 | Intersection nonempty. |
| Zero-dimensional irreducibility | n=0 | one point; constant 3 nonzero there | Rank zero valid. |
| Open-dense predicate | scalar centralizer C | ℂ× and whole line dense open; {0} not dense | Three predicate controls. |
| Finite intersections | D(X),D(X−1),empty family | intersection contains 2; empty intersection whole space | Empty family included. |
| Surjective linear pullback | projection (x,y)↦x | preimage x≠0 contains (1,0), excludes (0,1) | Nonzero pullback polynomial. |
| Affine intersection proviso | ℂ× with {0},{1} | empty; whole {1} | Nonemptiness cannot disappear. |
| Euclidean-topology negative | unit disk | proper set whose complement has infinitely many real points ≥1 | Not a polynomial open. |
| Generic type construction | A,C,separated [0,0]+[2,2] | three singletons,[0,1],unchanged separated singletons | Rank maxima determine type. |
| Full generic locus | C at λ=0,1 | nongeneric type C; generic [0,1] | Exact type locus, not arbitrary dense subset. |
| Generic openness/density | C,A | ℂ×; whole one-point centralizer | Both dimensions checked. |
| Generic conjugacy invariance | C by diag(2,1) | λ=1→2; type [0,1] on both | Added control. |
| Unique dense type | C | chain type locus ℂ×; zero-map type locus {0} not dense | Competing type rejected. |
| Generic-type translation | C shifted −2 | [−2,−1]=shift [0,1] | Both endpoint signs agree. |
| Generic-locus translation | same shift at λ=0,1 | false,false before/after for 0; true,true for 1 | Underlying map unchanged. |
| Reduced incidence definition | scalar n,l | nl=0 gives two axes; (1,1) fails | Variety convention explicit. |
| Square-zero test scheme | n=l=ε in ℂ[ε]/(ε²) | nl=ε²=0; n≠0,l≠0 | Added control excludes functor-of-points misreading. |
| Trace pairing nondegeneracy | N=E₂₁,L=E₁₂ | tr(NL)=1 | Pairing nonzero. |
| Tangent/commutator identity | X=diag(1,0),same N,L | [N,L]=diag(−1,1); tr(X[N,L])=−1=tr([X,N]L) | Sign fixed by explicit witness. |
| Nonabelian conjugation action | g=[[1,1],[0,1]], h=[[1,0],[1,1]] in GL₂ | gh=[[2,1],[1,1]]≠hg=[[1,1],[1,2]]; conjugation by gh equals successive g,h conjugation | Uses actual group multiplication. |
| Orbit tangent geometry | scalar n≠0 and n=0 | orbit dims 1,0; tangent spaces ℂ,0 | Scoped action tested. |
| Conormal bundle rank | same scalar orbits | ranks 1−1=0,1−0=1 | Fibres 0 and ℂ. |
| Conormal closure dimension | same two components | 1+0=1 and 0+1=1=dim E₊ | Correct dimension notion. |
| Incidence components | nl=0 | exactly two axes of dimension 1 | Equal-dimensional cover witnessed. |
| Opposite projection | up axis; down axis | images {0}; ℂ with dense orbit ℂ× | Swapped closures agree. |
| Generic fibre comparison | n≠0;n=0 | whole point {0}; ℂ× dense open in fibre ℂ | Every orbit fibre met. |
| Zero geometry | V=0 | G trivial; E₊,E₋,incidence points; dimension 0 | No nonempty-support condition. |
| Generic conormal symmetry | A→three singletons→A; C→[0,1]→C | original labels recovered | Source symmetry agrees. |
| Dual definition | A,C,separated singletons,empty | three singletons,[0,1],same separated label,empty | Not arbitrary involution. |
| VN generic-dual comparison | C | generic [0,1]=dual C | Ambient type used. |
| WL comparison via transpose | down [0,1] | opposite up zero has type C=dual [0,1] | Grades stay 0,1. |
| Dual degree dimensions | Q and its dual 2[0,1]+B | (2,3)=(2,3) | Full copies retained. |
| Dual total length | Q | 5=2·2+1 | Occurrence cards differ 5 vs 3. |
| Dual translation | C shifted −2 | dual=[−2,−1]=shift dual C | All shift probes agree. |
| Dual nonadditivity | C vs its singleton summands | dual C=[0,1]≠C=sum of singleton duals | Negative control retained. |
| Dual involutivity | A,C,Q,empty; all 1,001 probes | dual twice equals input in every case | No counterexample found. |
| Admissibility/genericity equivalence | C at λ=0,1 | false,false and true,true | Actual dual type imposed. |
| Opposite image definition | C at λ=1; H at λ=1 | span(v₀),N=0; span(x₀,x₁),N(x₀)=x₁ | Actual stable ranges. |
| Opposite-image embedding | H at x₀ | embed(N'x₀)=x₁=N(embed x₀) | Both sides computed. |
| Wrong image embedding | H, proposed span(x₁,y₂) | proposed dimension 2 but actual range span(x₀,x₁) differs | Added range control. |
| Image-admissibility equality | C at λ=1; H at λ=1 | image types [0,0]/[0,0]; H image types [0,1]/C are dual | Separate image condition. |
| Image-admissible implies admissible | C at λ=0,1 | first rejected ambient; second satisfies both ambient and image equalities | No vacuity. |
| Admissibility under conjugation | C, λ=1→2 | same ambient chain and image singleton types | Predicates preserved. |
| Image-admissible locus open dense | C;A | ℂ×;whole point | Ambient dimensions 1,0. |
| Nonempty image-genericity route | C at λ=1 | image singleton has sole restricted VN operator 0 | Pullback locus nonempty. |
| Minor chart denominators | C at λ=1,0 | reciprocal 1 defined on chart; λ=0 excluded | No division at zero. |
| Simultaneous carrier law | A,k=0,1,2,3 | range dimensions 3,2,1,0 | Zero carrier wrong at k=0. |
| Simultaneous N-intertwining | A,k=1 at v₁ | N'v₁=v₂ and ambient Nv₁=v₂ | Values agree. |
| Same-L restriction equation | C,λ=1,k=0; proposed 2L | prescribed v₀ vs proposed 2v₀ | Wrong commuting map rejected. |
| Simultaneous image admissibility | C,λ=1 and 0 | λ=1 ambient chain,image singleton; λ=0 ambient type C fails | Equations alone insufficient. |
| Restricted opposite on Im N | H at λ=1 | y₂↦x₁; VN type [1,1]+[2,2], WL type [1,2] | Swapped-type error excluded. |
| Restricted opposite image | same H restriction | span(x₁), both types [1,1] | Image-admissible triple. |
| Finite intersection bound | A | N³=0; k=0,1,2 only nonzero images | Infinite tail automatic. |
| Ram definition | A,C,separated singletons,empty | empty,[0,0],empty,empty | Correct truncation direction. |
| Dual-of-ram identity | C | dual [0,0]=[0,0]=trunc [0,1] | Involutivity applied. |
| VN image realization | H,λ=1 | (Im L,N) has [0,1]=ram H | Not the WL image type. |
| Ram length bound | H,C,A | 2≤4;1≤2;0≤3 | Actual subspaces. |
| Ram translation | C shifted −2 | [−2,−2]=shift [0,0] | All shift probes pass. |
| Image-admissibility under shift | C,λ=1 shifted −1 | image grade 0 becomes −1 on both sides | Same carrier, reindexed grades. |
| Ram/truncation commutation | H,C,A | both [0,0];both empty;both empty | All finite probes pass. |
| Common image and shift | H at y₁ | LNy₁=x₁=NLy₁; image grade 1 shifts to 0 | Omitting −1 gives wrong [1,1]. |
| Cut count preservation | 2[0,1]+B at a=0,3 | retained counts 2,1; outside counts 0,0 | Full submultiset. |
| Empty/singleton inclusion chain | empty,{A},{A,B},C support | true,true,true,false | Three models distinguished. |
| Chain bound and zero iff empty | C at a=0,3 | E=1≤2;E=0 iff cut card 0 | Both iff directions tested. |
| Weighted maximum attained | 2[0,1]+B at 0 | support chain weight 2+1=3 | Distinct support size 2 is wrong. |
| Adjacent dual count | C at 0,1; A at 0 | 1,0,0; A's merely-meeting count 2 | Both-grade condition retained. |
| Endpoint transitivity | three ordered singletons | 0→1,1→2,0→2 true | No cycles. |
| Endpoint irreflexivity | singleton self-edge | 0<0 false | Diagonal edges excluded. |
| Matching size bound | three ordered singletons | max 2≤3 | Both role injections necessary. |
| Bound characterization | C, proposed bound 0 or 1 | edge size 1 violates 0; all feasible sizes ≤1 | Both quantifier directions witnessed. |
| Permutation invariance | exchange D labels; reverse C labels | width 2→2,matching 0→0; C matching 1→1 | Values independent of order. |
| Endpoint reflexive closure | distinct equal D labels | x≤y false,y≤x false,x≤x true | Equality of labels, not values. |
| Weak duality for chain covers | 3-chain with {1};3-antichain | every intersection ≤1; antichain requires 3 covering chains | Extremality follows. |
| Finite partition attaining width | diamond | chains {bottom,left,top},{right}; antichain {left,right} | Sizes 2=2, union card 4. |
| Matching/chain correspondence | three-singleton chain | chain gives 2 edges; 2 edges give 3−2=1 chain | Both constructions agree. |
| Endpoint incomparable iff nested | A,B; equal-left [0,0],[0,1]; C | first two incomparable and nested; C comparable and not nested | Equal endpoints included. |
| Full-copy antichain weight | 2[0,1]+B | three labels incomparable; width 3=weight 3 | No support-size replacement. |
| Adjacent generic rank | Q;H at 0,1;A | ranks 2,1,1,0 equal matching 2,1,1,0 | Single-arrow theorem. |
| Cut edges yield actual entries | C at 0;separated singletons at 0 | C valid edge; separated cut card 1 has no edge | Overlap automatic only in cut. |
| Determinant/matching witness | Q matrix [[1,0,0],[0,1,0]] | chosen minor det 1; rank 2; zero matrix rank 0 | Maximum attained. |
| Crossing count/rank comparison | generic opposite of H at 0,1 | one interval crosses each, ranks 1,1 | Equal counts agree. |
| Path coordinate monotonicity | r=3,a=1 displayed path | first coordinates 2,1,1,1; seconds 1,1,2,3 | Bounds agree. |
| Path step counts | r=3,a=1; r=2,a=3 | 1 decrease+2 increases; impossible 3 decreases | Exact a≤r condition. |
| Invalid initial weight | same displayed path | j−i=−1,0,1,2; first weight 0 | Only initial pair reversed. |
| Nested cut vertices | valid vertices of displayed path | [1,1]⊆[1,2]⊆[1,3] | Distinct full-weight intervals. |
| Window bounds | [1,3],[0,1],[2,4] at r=3 | true;1≤0 false;4≤3 false | Two separate failures. |
| Unwindowed path bound | [0,1],r=3,a=1 | every path weight 0≤E₁=1 | Attainment needs window. |
| Chain interpolation | [1,1]+[1,3],r=3,a=1 | displayed path weights 0,1,0,1 sum 2=E₁ | Added vertices nonnegative. |
| Lower-boundary attainment | [1,1],r=2,a=0 | path weights 0,1,0 sum 1=E₀ | No interior restriction. |
| Upper-boundary attainment | [1,2],r=a=2 | path weights 0,0,1 sum 1=E₂ | No strict upper cut restriction. |
| Single-grade attainment | 2[1,1],r=1,a=0,1 | each path 0,2 sum 2=E | No r≥2 restriction. |
| Empty-window attainment | r=a=0,empty | sole vertex (1,0),weight 0=E₀ | Zero boundary included. |
| Paths not bijective with chains | empty,r=3,a=1 | three paths select same empty support with weight 0 | No false bijection. |
| Staircase rank rewriting | [1,2],r=3,a=1,constant ν choices | boundary weights 1,0; cut card 1 gives rank sums 0,1 | Source interior range retained. |
| Adjacent chain formula | C;2[0,1]+B;A+B;empty at 0 | 1+1=2;0+3=3;0+2=2;0+0=0 | All 7,007 cuts pass. |
| Boundary adjacent formula | A at a=−1,2 | crossing 0+weight 1=cut card 1 | All-integer generality. |
| Truncation preserves/reflects inclusion | [1,2]⊆A; [0,1] vs [1,2] | shortened inclusion true; shortened [0,0],[1,1] still incomparable | Nonsingletons required. |
| Singleton maxima disappear | [0,0]+[1,2] | [0,0] disappears; [1,1] stays maximal | No new containment. |
| Empty-cut peeling companion | empty; C at 3 | original,remainder,maximal weights 0,0,0 | False 0=1 not asserted. |
| Peeling upper bound | A+2B at 0 | E=3≤2+1 | At most one maximal copy removed from chain. |
| Peeling lower bound | same input | restore A to 2B gives weight 3≥2+1 | One-copy convention necessary. |
| Maximal-part weight | C;A+B at 0 | both maximal-part weights 1 | Not maximal-part cardinality 2 for C. |
| Canonical ram additivity | 2A;[0,0]+2[1,2]+[2,2] | empty=empty+empty;[0,0]=[0,0]+empty | All finite probes pass. |
| Split induction measure | A+B | length 4→2,positive drop 2 | Well-founded measure. |
| Split grade dimension calculation | [0,0]+2[1,2]+[2,2] at 0 | original deficit 3−2=1; maximal 2−1=1; remainder 1−1=0 | 1=1+0. |
| Split reconstruction | same input | both ram types [0,0],both VN images zero,grade-0 dims 1 | Reconstruction inputs related to construction. |
| Arbitrary ram additivity fails | C split into singletons | ram C=[0,0],sum of two singleton rams empty | Negative control retained. |
| Integral-segment adapter | [0,1],d=2,c=0 | twists ρ,ρν;rank 2·2=4 | Positive cuspidal rank retained. |
| Adapter translation/support | [b,e] shifted 2 | twists b+c+2,…,e+c+2 on both sides | Owned compatibility law explicit. |
| Empty adapter | empty,d=2 | rank 0,GL₀ unit dimension 1 | No zero-rank cuspidal label. |
| Singleton adapter | [b,b] | rank d,representation ρν^(b+c) | Both Z/L agree. |
| Z/L normalization | trivial line [0,1] | Z=ν¹ᐟ² determinant;L=ν¹ᐟ² Steinberg | Two-term convention retained. |
| Representation-duality comparison | [0,1];C | L([0,1])=Z(C);L(C)=Z([0,1]) | Both directions tied to duality. |
| Comparison group ranks | d=2,[0,1] vs C | both GL₄,total lengths 2=2 | No cross-group isomorphism. |
| Normalized induction square root | GL₂ parabolic,diag(ϖ,1),q=2 | δ=1/2,square root 1/√2>0 | Positive modulus convention. |
| Common real twist | trivial line,segment [0,1],c=2 | translated [2,3];determinant exponent 1/2+2=5/2 | Adapter law derives from classification. |
| Involution/twist compatibility | singleton twist ν² | involution fixes ν²=twist of fixed singleton 1 | No unsupported new supplier. |
| Unramified decomposition | χ=norm²,q=2;unitary χ | c=−log(1/4)/log2=2;unitary modulus 1 gives c=0 | Sign and denominator correct. |
| Uniformizer independence | ϖ→uϖ | χ(u)=norm(u)=1,so unchanged modulus and c | Unramified hypothesis used. |
| Local-field boundary | F=𝔽₂((t)) vs mixed characteristic | q=2,|t|=1/2,same two-term GL₂ identity | Field characteristic not narrowed. |
| Least-left dual recurrence | A,C | A selects p=1,outputs [0,0];C selects p=2,outputs [0,1] | Recurrence agrees. |
| Recurrence measure | A with p=1;C with p=2 | 3→2=3−1;2→0=2−2 | Positive decrease. |
| Duplicate recurrence | D | dual 2[0,0]+2[1,1],grade dims 2,2 | Deduplication gives wrong 1,1. |
| MW order | [0,2] vs [2,2];[1,3] vs [2,3] | former smaller in each pair | Direction agrees with source. |
| Singleton extraction | C,k=1;2[0,0],k=0 | m′=[0,0] in both;length decreases by 1 | Group rank decreases by d. |
| Involution on embeddings | rank-one singleton α | τα=α,rank 1 unchanged;factors reverse under τ | Scoped rank-one source retained. |
| Right-singleton candidates | q=[0,0],k=1 | candidate labels C or [0,1],length 2 each | No arbitrary extension. |
| Matching exclusion | q=A+[1,3]+[2,2],k=3,A-choice=[2,2] | smaller [0,2] matches [1,3];0<1≤3≤3;[0,3] extension excluded | Quantified occurrence condition. |
| Dual reinsertion branches | C;2[0,0] | extend [0,0] to [0,1];absent branch adds [0,0] | Both branches computed. |
| Reinsertion weak threshold | m=2[0,1]+[1,2]+[2,2] | dual m′=[0,0]+[0,1]+[1,1]+[1,2];A=[1,1];C=[1,2]=A⁺ | Equality must be allowed. |
| Reinsertion output | same m | dual m=[0,0]+[0,1]+2[1,2] | Recomputed source recurrence. |
| Cuspidal-line independence | d=1 vs d=2 on C | same label [0,1],group ranks 2 vs 4 | Label equality,not representation isomorphism. |
| Two comparison inductions | C and shorter singleton | lengths 2→1;both involutions square to C | Strict measure and finite support. |
| Newform input definition | seven displayed intervals | card 7,lengths 2+5+2+4+1+2+1=17 | No basis/card confusion. |
| Newform degree dimension | input at grade 3 | four contributing intervals,giving 4 | Singleton retained. |
| Newform full dual | input | [0,3]+[2,4]+2[3,3]+2[4,5]+[5,6]+[6,6]+[7,7],length 17 | Independently recomputed. |
| Newform ramification | input | [0,0]+[1,2]+[2,5]+[4,4],length 1+2+4+1=8 | Matches displayed output. |
| Newform maximal split | input | maximal [0,0]+[1,2]+[2,5]+[3,7];remainder [3,3]+[3,4]+[5,6] | Their sum recovers seven occurrences. |
| Newform maximal dual/truncation | maximal piece | dual [0,3]+[2,4]+[4,5]+[5,6]+[7,7];truncate [0,2]+[2,3]+[4,4]+[5,5] | Exactly one shortening. |
| Newform maximal ram | preceding truncated dual | [0,0]+[1,2]+[2,5] | Three occurrences. |
| Newform remainder ram | [3,3]+[3,4]+[5,6] | [3,4]+[5,6] ramifies to [4,4];singleton ram empty | Two canonical peels. |
| Newform output checks | full ram at grade 3 | card 4,length 8,grade dimension 1 | All values agree. |
| Downstream actual-image interface | H,C on Im L | VN types [0,1],[0,0],dimensions 2,1 | Supplies actual equalities with embeddings. |

## Unresolved matters

No unresolved port defect, dependency cycle, missing supplier declaration, ownership conflict or mathematical counterexample remains. All mathematical signatures are still targets admitted with `sorry`; neither elaboration nor the finite computations prove them. The geometric, generic-type and representation constructions named in the module docstring remain the explicit library work of the roadmap, not assumed implementations. Source Z81 was read from the original journal PDF; the read-only package manifest retains its earlier uncertified DOI record. No suspicious external instruction was followed. No helper agent was used, no repository file outside the target folder was edited, and nothing was pushed or posted.


Pull request: #1486 (roadmap/quiver-representations-part-ii at a462714)
