## H01 (CBirkbeck) — applied

The absent-anchor empty domain is replaced by complete occurrence matching in `TauCetiRoadmap/QuiverRepresentationsPartII/README.md:834`, with the corresponding exclusion of every extension candidate at line 832 and both induction branches distinguished at line 837. Lines 849–850 add the three-dimensional witness, a repeated-copy matching and a failed-injection control; the exclusion follows from MW Lemma II.10.2’s ordered matching and the endpoint exchange argument, independently of the comparison theorem (MW line 209, line 210 and line 211).

## H02 (CBirkbeck) — applied

The private interval structure and membership/inclusion predicates are replaced by `abbrev Interval := NonemptyInterval ℤ` at `TauCetiRoadmap/QuiverRepresentationsPartII/Suggested.lean:34`, and shortening, maximal peeling, cuts, chains, endpoint comparisons and window conditions now use native endpoints, membership and order. `TauCetiRoadmap/QuiverRepresentationsPartII/README.md:19`, line 49 and §0.1 transfer the general interval API to Mathlib’s exact pinned declarations while retaining integer length, translation laws and singleton deletion; §4.1 uses the native inclusion relation.

## H03 (CBirkbeck) — answered

The precise metadata wording is: “The only direct open supplier is #785; its transitive prerequisites are those listed in #785.” At supplier head `1383569`, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:385` consumes ChevalleyGroups C2–C4 and CFSGBasicProperties T0–T2, while `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:447` consumes ReductiveGroupsPartII; the indexed ChevalleyGroups and CFSGBasicProperties heads are `99cf6aa` and `3e30589`, both authored by kim-em.

### Signature, source and ownership verification

All 40 retained declarations were elaborated together using `#check @name` and compared with their README statements; the six newly cited native interval declarations were checked in the same file. No hypothesis was dropped and no binder repair was needed: the original 42 declarations become 40 by deleting the two private predicates, with the interval structure replaced by an alias. In particular, reconstruction retains both actual range carriers, equal grade dimensions, the bidirectional grade condition and the restricted-operator intertwining equation; extension retains its direction, opposite degree, commutation and agreement on the range. The representation theorem and the two matching refinements remain README targets because the required smooth-representation carriers are absent from the retained pinned acceptance interface.

Mathlib HEAD was verified as `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti HEAD as `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest pins. At `Mathlib/Order/Interval/Basic.lean:35` the native structure extends a pair and carries `fst_le_snd`; line 126 gives inclusive membership and line 77 gives `s ≤ t ↔ t.fst ≤ s.fst ∧ s.snd ≤ t.snd`. It includes no empty-interval constructor, so singleton shortening still requires `Option`. Its general order, equality and transport API is consumed rather than commissioned again.

The original legal GDZ scan was read at MW printed pp.150–151 (MW line 187 and line 188), pp.159–160 (MW line 196 and line 197), and pp.172–174 (MW line 209, line 210 and line 211); these extraction lines are page markers because the scan has no mathematical text layer. The complete singleton-addition matching is explicitly a refinement to prove with the endpoint-chain recurrence, rather than a claim that the actual-anchor statement already supplies it. Z98 line 140 and line 152 give the recurrence used for the computed witnesses; AKY line 274, line 548, line 554 and line 588 fix interval length, pair direction, reconstruction and shifts; DIL line 40 and line 59 give the finite-poset input. Z81 remains settled as uncertified and was not requested again; no missing text blocks these repairs.

Ownership was searched by interval, multisegment, singleton-matching and Dilworth objects in the main/open roadmap index, board packages and every supplied sibling checkout. The native interval belongs to Mathlib; SmoothRepresentationsOfLocalGroups SR.5.2 and SR.5.3 supply the representation carriers and classification, while the comparison-specific reinsertion and exclusion are owned here and consume that classification. No second owner of these scoped matching targets was found; the other interval hits concern native rational intervals and the other multisegment hits consume the same smooth supplier. The parent’s Layers 1, 2 and 5 and AlgebraicVectorBundles L0B/L2B were resolved against main `ae2562c`; the smooth contracts were resolved at the supplied open head. No ownership move or new supplier was introduced. The citation resolver’s original GridPath.weight_bound lead is discharged by its declaration in `TauCetiRoadmap/QuiverRepresentationsPartII/Suggested.lean:226` and its elaborated signature.

### Adversarial mathematics record

The finite computation used the Z98 recurrence, with independent occurrence matching, inclusion-chain, endpoint-antichain and rank-difference calculations. It covered all 3,003 multisets of at most five intervals in [0,3]: 1,758 singleton-addition branches (1,179 with a nonempty extension domain) and 1,244 extension branches; every displayed assertion passed. These finite instances supplement the source arguments; they do not prove the general targets. All geometry remains over ℂ and all representation statements retain the local-field, positive cuspidal-rank and normalization hypotheses.

In the tables, ∅ denotes an empty multisegment or empty finite set as appropriate. S denotes [0,0]+[1,1], B denotes [0,1]+[1,2], and M denotes [0,0]+2[1,2]+[2,2]. Entries marked “retain” keep the stated generality; “native” changes only the interval carrier or its inherited order/membership.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Interval carrier | [0,2], [3,3], reversed (2,1) | Endpoint proof: 0≤2 and 3≤3; 2≤1 is false | pass | Native alias |
| Inclusive membership | a=2,3 in [0,2] | 0≤2≤2 true; 0≤3≤2 false | pass | Native membership |
| Inclusion order and extensionality | [1,1], [0,2], equal endpoint pairs | Small≤large true; reverse false; equal pairs give equal intervals | pass | Native order/API |
| Interval length | [0,2], [3,3] | 2−0+1=3 integer points; 3−3+1=1 point | pass | Retain |
| Translation preserves length/membership | [2,4], c=−1, a=4 | [1,3], lengths 3=3; 4∈[2,4] iff 3∈[1,3] | pass | Native transport |
| Translation identity/composition | [0,1], c=−1,d=2 | Shift 0=[0,1]; successive shifts=[1,2]=shift 1 | pass | Native map API |
| Interval.shorten | [3,3], [3,4] | none; some [3,3], length 1=2−1 | pass | Native endpoints |
| Shortening membership | [0,2], a=1,2 | Shortening [0,1]: 1 is retained, 2 is deleted; 0≤a<2 agrees | pass | Explicit integer law |
| Shortening/translation | [2,4], [3,3], c=−1 | Both orders give [1,2]; both singleton orders give none | pass | Explicit witness |
| Multisegment | 2[0,1], ∅ | Cardinalities 2 and 0, lengths 4 and 0 | pass | Native element carrier |
| Degree dimension | 2[0,1], a=0,1,2 | Dimensions 2,2,0; their sum 4=total length | pass | Retain |
| Total length/additivity | [0,2]+[1,1], ∅ | 3+1=4; 0+0=0 | pass | Retain |
| rightTruncate | 2[1,2], [3,3], ∅ | 2[1,1], ∅, ∅ | pass | Native shortening |
| Truncation/addition | [0,1]+[1,1] | [0,0]+∅=[0,0] on both sides | pass | Retain |
| Truncation/translation | [1,2], c=−1 | Both sides [0,0] | pass | Retain |
| Translation of multisegments/counts | 2[2,4], c=−1 | 2[1,3]; count 2=2, length 6=6 | pass | Retain |
| Degree-dimension reindexing | 2[0,1], c=−2 | New dimensions at −2,−1 are 2,2, matching old at 0,1 | pass | Retain |
| occurrenceInterval | [0,0]+[2,2], 2[0,1], ∅ | Value counts (1,1), 2, and 0; constant selector gives (2,0) and fails | pass | Native return carrier |
| Occurrence reindexing | Swap labels of 2[0,1] | Two labels before/after, count 2=2 | pass | Retain |
| Truncation measure | 2[0,1], ∅ | Length 4→2=4−2, strict; 0→0, not strict | pass | Retain |
| maximalPart | 2[0,2], nested [0,2]+[1,1] | One [0,2] in each case; retaining both copies gives wrong count 2 | pass | Native inclusion |
| Maximal-part count | M | Counts 1 at [0,0] and [1,2], 0 at [2,2] | pass | Native inclusion |
| remainder | M, ∅ | [1,2]+[2,2], ∅ | pass | Retain |
| Maximal-part submultiset and split | M | [0,0]+[1,2]+[1,2]+[2,2]=M, counts (1,2,1) | pass | Retain |
| Maximal members are incomparable | [0,0]+[2,2] | Both inclusion directions false; each equal to itself | pass | Native inclusion |
| Every interval has a maximal container | [0,2]+[1,1], ∅ | [1,1]≤[0,2] true; empty input has 0 obligations | pass | Retain |
| Space | n=0; n=2, degrees (3,3) | Carrier dimensions 0 and 2; repeated degree still gives 2 coordinates | pass | Retain |
| Space.Carrier | n=0,1,2 | Dimensions of coordinate functions are 0,1,2 | pass | Retain |
| Space.grade | Degrees (0,1), vector (1,0) | Member of grade 0, not grade 1; (1,1) decomposes into (1,0)+(0,1) | pass | Retain |
| Space.dimension/finite support | Degrees (3,3), grade 4 | Dimensions at 3 and 4: 2 and 0; exactly one nonzero grade | pass | Retain |
| constantSpace | n=2,a=3; n=0,a=0 | Chosen-grade dimensions 2 and 0; every other dimension 0 | pass | Retain |
| Space.internal | Empty carrier; degrees (0,1) | Zero decomposes uniquely; (1,1)=(1,0)+(0,1) uniquely | pass | Retain |
| Abstract grading coordinate presentation | Two one-dimensional grades | Two basis vectors, n=1+1=2, degree list (0,1) | pass | Retain |
| Direction | up, down | Exactly two cases, steps 1 and −1; step 0 unavailable | pass | Retain |
| Direction.step/reversal | up→down→up | Steps 1→−1→1; double reversal returns up | pass | Retain |
| Grade reflection | [0,1] | Reflected support [−1,0], up arrow becomes down | pass | Retain |
| Homogeneous | N=E₂₁ on degrees (0,1); identity | N(v₀)=v₁, degree +1 true and −1 false; identity degree +1 false | pass | Retain native predicate |
| Pair | E₂₁ with up; E₂₁ with down; zero | First bundles degree proof, second fails; zero satisfies both | pass | Retain |
| zeroPair/linear closure | Zero; 2E₂₁+3E₂₁ | Zero has both allowed degrees; sum is 5E₂₁ of degree +1 | pass | Retain |
| PairIso | Identity, 2·identity, zero; zero singletons at grades 0 and 1 | Intertwiners at first two give 2Nv=N(2v); zero noninvertible; different grades fail preservation | pass | Retain |
| Pair-isomorphism laws | Identity and scaling by 2 then 1/2 | Composite scalar 2·(1/2)=1; identity operator is recovered | pass | Retain |
| Pair.nilpotent | Zero space; zero on singleton; N=E₂₁ | Exponents 1,1,2 kill the operators; N¹≠0 on the chain | pass | Retain |
| Finite-window equivalence | One vertex; [0,1] enlarged to [−1,2] | Single arrow 1 retained, added boundary arrows 0; restrict back gives 1 | pass | Retain parent transport |
| standardSpace | [0,2], 2[0,1] | Dimensions 3,4; latter grade counts 2,2 | pass | Retain |
| standardVector | [0,1], degrees 0 and 2 | v₀≠0; out-of-range v₂=0 | pass | Retain |
| Standard basis occurrence independence | 2[0,1] at degree 0 | Two basis vectors have coordinate pairs (1,0),(0,1), linearly independent | pass | Retain |
| standardPair arrows | [0,1], up/down | Up v₀↦v₁↦0; down v₁↦v₀↦0 | pass | Retain |
| pairType | [0,1] nonzero arrow; zero arrow on same grades | Types [0,1] versus [0,0]+[1,1] | pass | Retain |
| Classification iff | Same two models; a nonzero scalar rescaling | Different types cannot intertwine; rescaling coefficient 1 to 2 preserves [0,1] | pass | Retain |
| Pair-type grade dimensions | [0,2]+[1,1] | Counts and dimensions both (1,2,1) | pass | Retain |
| Rank-difference multiplicities | [0,2]+[1,1] | At [0,2]: 1−0−0+0=1; at [1,1]: 2−1−1+1=1 | pass | Retain integer subtraction |
| shiftSpace/shiftPair | [0,1], c=−1 | New support [−1,0]; arrow remains nonzero of degree +1 | pass | Retain |
| imagePair actual range | N on [0,2]; zero operator | Ranges span(v₁,v₂) and 0; span(v₀,v₁) omits v₂ and fails | pass | Retain |
| ImageModel/embed | Basis sent to v₁,v₂; zero embedding | Correct range dimension 2 and injective; zero range dimension 0 fails | pass | Retain |
| Image-model grade/intertwining law | N on [0,2] | Embed(Nv₁)=v₂=N(embed v₁); degree dimensions (0,1,1) | pass | Retain |
| iteratedImage | N on [0,2], k=0,1,2,3 | Dimensions 3,2,1,0; supports [0,2],[1,2],[2,2],∅ | pass | Retain |
| Iterated-image step | Same N, k=1 | Image of span(v₁,v₂) is span(v₂)=range N² | pass | Retain |
| VN shifted-image dictionary | [0,2] | Unshifted [1,2], shifted −1 gives [0,1]=rightTruncate | pass | Retain |
| WL unshifted-image dictionary | [0,2] | Image [0,1]=rightTruncate, no shift | pass | Retain |
| Shift/image compatibility | VN [0,1], shift −1 | Both constructions give image singleton [0,0]; singleton original gives 0 | pass | Retain |
| reconstruction_from_image | [0,2]+[1,1] and [0,2] | Images both [1,2], but grade-1 dimensions 2≠1 exclude false equivalence | pass | Retain grade/image hypotheses |
| centralizer | Single [0,2]; S | Dimensions 0 and 1; full ungraded centralizer has extra maps | pass | Retain |
| oppositePair operator law | S, coefficients 0,1,2 | v₁ maps to 0,v₀,2v₀ respectively | pass | Retain |
| restrictCentralizer | B, coefficient λ=2 | L(y₂)=2x₁ on range N=span(x₁,y₂), same coefficient 2 | pass | Retain |
| Restriction linearity/zero kernel example | S, λ=1,2 | Both restrict to 0 on Im N=0; restriction of sum 3 also 0 | pass | Retain |
| Centralizer conjugation | S, diag(2,1) | Coefficient 1 becomes 2, inverse returns 1 | pass | Retain |
| Precedes/block criterion | [0,0]→[1,1]; equal [0,2]; [0,0]→[2,2] | 0<1≤1≤1 true; 0<0 false; 2≤1 false | pass | Retain all inequalities |
| Independent ordered block coordinates | 2[0,0]+3[1,1] | Six free coefficients, 2×3 matrix; identifying copies gives only one | pass | Retain |
| Commuting block constancy | B | L(y₁)=λx₀ and L(y₂)=λx₁ give NL(y₁)=λx₁=LN(y₁) | pass | Retain |
| centralizer_image_extension, up | B, coefficient λ=2; zero image | Restricted coefficient 2 lifts to original 2; zero image lifts 0 | pass | Retain |
| centralizer_image_extension, down | Reflected B | Reflection sends [0,1],[1,2] to [−1,0],[−2,−1]; step −1 becomes +1 and back | pass | Retain |
| polynomialTopology | D(X), ordinary unit disk | X(0)=0, X(1)=1; disk complement infinite so cannot be proper one-variable algebraic closed | pass | Retain |
| Polynomial evaluation/nonzero witness | X(X−1), constant 3 in dimension 0 | Values 0,0,2 at 0,1,2; sole constant evaluation 3 | pass | Retain |
| polynomial_irreducible | n=0; D(X) and D(X−1) in n=1 | Whole point nonempty; common point 2 has values 2 and 1 | pass | Retain |
| Topology basis independence | Coordinate change z↦2z | Pullback of X is 2X; both nonvanishing loci are z≠0 | pass | Retain |
| Open-dense finite intersections | Two preceding opens; empty family | Point 2 in intersection; empty intersection of conditions gives whole space | pass | Retain |
| Surjective inverse-image genericity | Projection ℂ²→ℂ; zero map | D(X) pulls back to x≠0, includes (1,0), excludes (0,1); zero-map pullback empty | pass | Retain surjectivity |
| Affine-intersection qualification | D(X) with {0} and {1} | Intersections ∅ and {1}; only second is nonempty dense in the point | pass | Retain nonemptiness |
| genericType | Single [0,2]; S; [0,0]+[2,2] | Types three singletons; [0,1]; two separated singletons | pass | Retain |
| genericLocus exact type | S, λ=0,1 | λ=0 gives two singletons, outside; λ=1 gives [0,1], inside | pass | Retain |
| Generic-locus uniqueness/conjugation | S, λ=1→2 | Both have arrow rank 1 and type [0,1]; zero rank 0 differs | pass | Retain |
| Generic type/locus translation | S, shift −2 | Type [−2,−1]; generic coefficients still λ≠0 | pass | Retain |
| Incidence/commutator normalization | E₂₁,E₁₂ | NL−LN=diag(−1,1); trace against diag(1,0) is −1 | pass | Retain |
| Trace pairing/tangent annihilator | Scalar up n, down l, X=diag(1,0) | tr([X,N]L)=−nl=tr(X[N,L]) | pass | Retain |
| Reduced-variety convention | n=l=ε over ℂ[ε]/ε² | nl=ε²=0 while n,l≠0; no required axis factorization for test schemes | pass | Retain |
| Orbit smoothness/tangent claim | Dimension vector (1,1), n≠0 or n=0 | Up-orbit dimensions 1 and 0; tangent images dimensions 1 and 0 | pass | Retain scoped geometry |
| Conormal-incidence bundle/rank | Same two orbits | Conormal ranks 0 and 1; dimensions 1+0=0+1=1 | pass | Retain supplier bundle |
| Conormal closure dimension | Same two orbits; zero space | Two axis closures of dimension 1; point closure dimension 0 | pass | Retain |
| Incidence components | Dimension vector (1,1); zero space | Equation nl=0 has two axes; zero-space incidence has one point/component | pass | Retain |
| Opposite projection closure | Up-axis and down-axis | Images {0} and full down line; dense orbits {0} and ℂ× | pass | Retain |
| Generic-fibre comparison | n≠0 and n=0 | Fibres {0} and ℂ; dense opposite loci {0} and ℂ× | pass | Retain |
| Generic conormal symmetry | VN [0,2]; S | Opposite type three singletons returns [0,2]; opposite [0,1] returns S | pass | Retain |
| dual definition | [0,2], S, ∅ | Three singletons, [0,1], ∅ | pass | Retain |
| VN/WL generic-type agreement | Standard [0,1] in each direction | Opposite generic type in both cases [0,0]+[1,1]; transpose preserves support | pass | Retain |
| Dual grade dimensions/total length | 2[0,0]+3[1,1] | Dual 2[0,1]+[1,1]; grade counts (2,3)=(2,3), total 5=5 | pass | Retain |
| Dual translation | S, shift −2 | Both sides [−2,−1] | pass | Retain |
| Dual involutivity | [0,2], S, ∅ | Double dual returns [0,2], S, ∅ | pass | Retain |
| Admissible | S, λ=1 and λ=0 | Types [0,1]=dual S and S≠dual S | pass | Retain |
| onOppositeImage/N-stability | B, λ=1 | Range L=span(x₀,x₁); N(x₀)=x₁ and N(x₁)=0 stay in range | pass | Retain |
| Image embedding equation | Same B | embed(Nx₀)=x₁=N(embed x₀); proposed span(x₁,y₂) has wrong range | pass | Retain |
| imageAdmissibleLocus restricted equality | B, λ=1 | Image VN type [0,1], WL type [0,0]+[1,1]=dual [0,1] | pass | Retain |
| Image-admissibility conjugation/shift | S, λ=1, shift −2 | Ambient type [−2,−1], image type [−2,−2] in both directions | pass | Retain |
| Open dense image admissibility | S, λ=0,1; [0,2] | S locus λ≠0, contains 1 and excludes 0; chain locus whole point | pass | Retain |
| Image-chart denominators | Scalar L=λ | Selected 1×1 minor λ; at λ=1 invertible, at 0 chart excluded | pass | Retain |
| simultaneousRestrictions | [0,2], L=0, k=0,1,2,3 | Range dimensions 3,2,1,0; every restricted map 0 | pass | Retain |
| Simultaneous same-map equation | S, L(v₁)=λv₀ | At k=0, changed map gives 2λv₀≠λv₀; k≥1 has zero carrier/map | pass | Retain |
| Simultaneous image genericity | B, λ≠0, k=1 | VN image type [1,1]+[2,2], WL restricted type [1,2], opposite image singleton [1,1] | pass | Retain |
| Simultaneous locus open dense | S and B | Nonzero scalar intersection remains λ≠0; later zero-image conditions impose 0=0 | pass | Retain finite support |
| ram definition | [0,2], S, separated singletons, ∅ | ∅, [0,0], ∅, ∅ | pass | Retain |
| dual/ram truncation identity | S | dual(ram S)=[0,0]=rightTruncate([0,1]) | pass | Retain |
| Ram actual-image realization | S, L(v₁)=v₀ | Im L=span(v₀), restricted N=0, type [0,0]=ram S | pass | Retain |
| Ram length bound | S, [0,2] | Lengths 1≤2 and 0≤3 | pass | Retain |
| Ram translation | S, shift −2 | Both sides singleton [−2,−2] | pass | Retain |
| Ram/right-truncation commutation | B; S | Both sides [0,0] for B, ∅ for S | pass | Retain |
| Shared image/shift in commutation | B, coefficient 1 | Im NL=Im LN=span(x₁), shifted type [0,0] | pass | Retain |
| cutPart | S at a=0,3 | S and ∅; union test retains 2 copies, intersection test would retain 0 | pass | Native membership |
| IsInclusionChain | ∅, {[0,2],[1,1]}, {[0,0],[1,1]} | true,true,false | pass | Native inclusion |
| chainWeight | 2[0,1]+[1,1] at a=0 | Full weight 2+1=3; support-size stand-in gives 2 | pass | Native inclusion |
| Chain-weight bound/zero iff | S at a=0,3 | 1≤2, and 0=0 at empty cut; nonempty cut has positive 1 | pass | Retain |
| Chain-weight attainment | Nested 2[0,1]+[1,1] | The whole distinct support is a chain attaining 3 | pass | Retain |
| adjacentDualCount | S at a=0,1 | Counts 1 and 0; meeting instead of containing would give 1 at a=1 | pass | Retain |
| endpointBefore | S, two equal intervals, equal-left intervals | Edge true for S; false in both directions for equal copies and equal-left pair | pass | Native endpoints |
| Endpoint strict-order laws | Three singletons at 0,1,2 | 0<1 and 1<2 imply 0<2; self-edge false | pass | Retain |
| IsEndpointAntichain | 2[0,1], S | Two-copy label set true; adjacent singleton pair false | pass | Retain |
| IsEndpointMatching | Three singleton labels 0,1,2 | {(0,1),(1,2)} true; {(0,1),(0,2)} and {(0,2),(1,2)} false | pass | Retain |
| matchingNumber | Three singletons; 2[0,1]; ∅ | 2,0,0 | pass | Retain |
| antichainWidth | Same three examples | 1,2,0 | pass | Retain |
| Maxima bounds and reindexing | Swap two repeated labels; three singletons | Width 2=2 after swap; matching 2≤3, width 1≤3 | pass | Retain |
| finite_dilworth | Empty, 3-chain, 3-antichain | Antichain/partition sizes 0=0,1=1,3=3; chain intersections ≤1 | pass | Retain |
| weighted_dilworth | Three singletons; 2[0,1]; ∅ | 2+1=3; 0+2=2; 0+0=0 | pass | Retain |
| cut_antichain_width | 2[0,1]+[1,1], a=0; S,a=0 | Both sides 3 and 1 respectively | pass | Native inclusion |
| Adjacent matching/rank theorem | 2[0,0]+3[1,1]; single [0,2] | Generic matrix rank/matching 2=2; 0=0 | pass | Retain |
| GridPath | r=3,a=1; r=2,a=3 | (2,1),(1,1),(1,2),(1,3) has 3 legal steps; second case needs 3 left steps in 2 slots | pass | Retain |
| GridPath monotonicity/step counts | r=3,a=1 | First coordinate 2,1,1,1; second 1,1,2,3; counts 1 left and 2 up | pass | Retain |
| intervalWeight | m=2[1,3], vertices (2,1),(1,3),(1,2) | 0,2,0; invalid initial pair contributes zero | pass | Native constructor |
| GridPath.weight | Preceding r=3,a=1 path, m=2[1,3] | Vertex weights (0,0,0,2), sum 2 | pass | Retain |
| InWindow | [1,3], [0,1], [2,4], r=3; ∅,r=0 | true,false,false,true | pass | Native endpoints |
| GridPath.weight_bound | m=[0,1], r=3,a=1; empty r=a=0 | Every path 0≤E₁=1; one invalid vertex gives 0≤0 | pass | Retain no window hypothesis |
| grid_path_chain_max | a=0,r=2,m=[1,1]; a=r=2,m=[1,2] | Weights (0,1,0), (0,0,1), both sums 1=chain maximum | pass | Retain both hypotheses |
| Empty/window boundary attainment | r=a=0; r=1,a=0 or 1, n copies [1,1] | 0=0; each one-step path has weight n=cut cardinality | pass | Retain |
| Path/chain equality of maxima | r=3,a=1,m=2[1,3] | Maximum path weight 2=full multiplicity chain weight 2 | pass | Retain |
| Adjacent Knight–Zelevinsky identity | S; 2[0,1]+[1,1]; nested [0,2]+[1,1] at a=0 | 1+1=2; 0+3=3; 0+2=2 | pass | Retain |
| truncate_maximalPart | M | Truncated input 2[1,1], both sides one [1,1] | pass | Native inclusion |
| truncate_remainder | M | Both sides one [1,1], retaining the second copy | pass | Retain |
| chainWeight_peeling nonempty | M at a=1 | 3=2+1 and maximal-part weight 1 | pass | Native inclusion |
| Empty-cut companion | ∅ and cut a=5 of M | All weights 0; unrestricted nonempty formula would assert 0=1 | pass | Retain nonempty binder |
| Canonical ramified additivity | M | ram M=[0,0]; maximal part ram [0,0] plus remainder ram ∅ | pass | Retain |
| Arbitrary-sum negative control | S split into its singletons | ram S=[0,0] but ∅+∅=∅ | pass | Retain canonical hypothesis |
| Integral-segment adapter | [0,1], d=2,c=1/2; ∅ | Twists ρν^(1/2),ρν^(3/2), rank 4; empty rank 0 | pass | Retain positive d |
| Adapter occurrence preservation | 2[0,1], d=2 | Two occurrences, four twists, group rank 2·4=8 | pass | Retain |
| Adapter common translation | [0,1], t=2 | Twists ν²,ν³, equal to ν² times ν⁰,ν¹ | pass | Retain |
| Twist/induction/Z/L/involution laws | Singleton; exponent 0 and sum 1+2 | Norm exponent 0 is 1; successive twists ν¹ν²=ν³; singleton Z=L | pass | Retain supplier characterization |
| Unramified-character unitary decomposition | q=2, χ=norm²; unitary χ | c=−log(1/4)/log2=2, χ₀=1; unitary case c=0 | pass | Retain nonzero logarithm |
| Uniformizer independence | χ and norm trivial on units, replace ϖ by uϖ | χ(u)=1 and norm(u)=1; unchanged χ(ϖ), q and c | pass | Retain |
| Representation comparison | Trivial GL₁ line, S and [0,1]; positive-rank line d=2 | L(S)=Z([0,1])=norm(det)^(1/2); d=2 gives GL₄ on both sides | pass | Retain all cuspidal lines |
| GL₀/empty convention | ∅, any d≥1 | Rank d·0=0, representation dimension 1; singleton rank d≥1 | pass | Retain |
| Equal-characteristic/residue-2 convention | F=𝔽₂((t)), S | q=2, norm(t)=1/2, same GL₂ adjacent-singleton label | pass | Retain |
| MW interval/list order | [0,1]+[1,1] and [0,0]+2[1,1] | Lists begin [1,1]; next [0,1]<[1,1], so first list is smaller | pass | Retain |
| Geometric endpoint recurrence | [0,2]; S; 2[0,1]; ∅ | Duals three singletons; [0,1]; 2[0,0]+2[1,1]; ∅ | pass | Retain |
| Recurrence length decrement | S; [0,2] | Selected p=2 gives 2→0; p=1 gives 3→2 | pass | Retain |
| Singleton extraction | [0,1]+[1,1] at k=1; [0,1] at k=0 | m′=[0,1] (length 3→2); m′=[1,1] (2→1) | pass | Retain |
| Involution on embeddings | Singleton and GL₀ unit | α embeds in α×1; after reversal α embeds in 1×α, both rank 1 | pass | Retain rank-one scope |
| Right-singleton candidate list | q=[0,0]+[1,1], k=1 | Addition [0,0]+2[1,1]; extension [0,1]+[1,1] | pass | Retain |
| Actual-anchor matching exclusion | q=[0,2]+[1,3]+[2,2], k=3, A=[2,2] | Smaller B=[0,2] maps to C=[1,3], with 0<1≤3≤3; C<[2,3] | pass | Retain |
| Dual reinsertion with anchor | S; 2[0,1]+[1,2]+[2,2] | First extends [0,0]→[0,1]; second dual [0,0]+[0,1]+2[1,2] | pass | Retain |
| Nonstrict target bound | Second reinsertion, k=2 | B=[0,1]→C=[1,2]=A⁺; strict inequality is false | pass | Retain weak bound |
| Singleton-addition complete matching | m=[0,1]+[1,1], m′=[0,1] | q=[0,0]+[1,1]; one B→one C, matching size 1=domain 1; dual m=q+[1,1] | pass | Replace empty-domain clause |
| Empty-domain singleton addition | m=2[0,0], k=0 | q=[0,0], domain 0, matching size 0; result 2[0,0] | pass | Preserve degenerate branch |
| Complete matching excludes all extensions | q=[0,0]+[1,1], k=1 | Matching size 1=1; smaller extension [0,1]+[1,1] excluded; addition label remains | pass | Add missing exclusion |
| Multiplicity in complete matching | q=2[0,0]+2[1,1], k=1 | Two distinct pairs, size 2=domain 2; addition label 2[0,0]+3[1,1] | pass | Add repeated-copy Check |
| Incomplete-matching negative control | q=2[0,0]+[1,1], k=1 | Maximum 1<domain 2; extension label [0,0]+[0,1]+[1,1] | pass | Add negative Check |
| Nested-neighborhood saturation | Two B=[0,0] and two C=[1,1]; remove one C | Ordered maximum sizes 2 and 1, agreeing with independent matching maxima | pass | Add independent exclusion route |
| Total-length comparison branch split | Witness m of length 3, extraction length 2 | Complete branch returns [0,0]+2[1,1]; competing list is strictly smaller and excluded | pass | Name both induction branches |
| Cuspidal-line independence | d=1 versus d=2, m=[0,1] | Same dual label [0,0]+[1,1]; ranks 2 and 4, no cross-group isomorphism asserted | pass | Retain |
| Fixed-support involutivity step | S and [0,1] | Dual swaps two labels; applying twice yields each original label | pass | Retain finite-order induction |
| newformExample | Seven displayed intervals | Total length 2+5+2+4+1+2+1=17 | pass | Retain |
| Newform ramification identity | Same seven intervals | Output [4,4]+[2,5]+[1,2]+[0,0], length 1+4+2+1=8 | pass | Retain |
| Nonabelian graded group/zero orbit | Two coordinates in grade 0, G=GL₂(ℂ) | E₊=E₋=0; orbit dimension 0, stabilizer dimension 4, conormal rank 0 | pass | Retain |
| Staircase/cut reindexing | r=2,a=1,m=[1,1]+[2,2] | Both staircase paths have vertex weights (0,1,0); cut weight 2 minus boundary weight 1 equals adjacent rank 1 | pass | Retain |
| Newform degree dimensions | Displayed input and output at degree 3 | Input count 4, output count 1, agreeing with inclusive membership | pass | Retain |
| Newform maximal-part decomposition | Seven-interval input | Maximal part [3,7]+[2,5]+[1,2]+[0,0], remainder [5,6]+[3,4]+[3,3], counts sum to 7 | pass | Retain |
| Newform maximal-part dual/truncation | Its four maximal intervals | Dual [7,7]+[5,6]+[4,5]+[2,4]+[0,3]; truncated [5,5]+[4,4]+[2,3]+[0,2] | pass | Retain |
| Newform successive split | Its maximal part and remainder | Ramified maximal part [2,5]+[1,2]+[0,0]; ramified remainder [4,4]; sum is the length-8 output | pass | Retain |

### Build, gate and commit

`lake build TauCetiRoadmap.QuiverRepresentationsPartII.Suggested` exited 0, with the 13 intended theorem-`sorry` warnings and no errors. Exact final build line:

```text
Build completed successfully (8978 jobs).
```

The dependency check with `--movable` exited 0 and produced exactly:

```text
depcheck: 41 roadmaps, 410 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The full gate after commit exited 0; exact summary:

```text
gate QuiverRepresentationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Commit: `a3f4dcc` — `QuiverRepresentationsPartII: review repairs (complete singleton matching and reuse native intervals)`. Only the two authorized roadmap files changed, and the worktree is clean. The metadata answer above is supplied for the worker’s reply; no pull-request text was edited and nothing was pushed.
