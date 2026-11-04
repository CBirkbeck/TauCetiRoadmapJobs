# Package report: RootSystemsPartII

The package contains the four accepted layers, all 13 design targets, all 36 design API requirements and all 24 definition Checks, together with the theorem Checks and three worked endpoint examples. The generated design skeleton was made before prose expansion; APIs and Checks in the README use prose rather than undeclared proposed Lean names. The package does not change the accepted mathematics or the two independent continuation assignments.

The separately named `design/review.json` and prior report files were absent from the supplied package. The accepted review is embedded at `review` in `design/plan.json`; I read its notes and per-node findings and applied them. No input file was reconstructed. The top-level gaps list remains empty and the entire plan file is unchanged.

## Headline inventory, made before writing Suggested.lean

| Headline | Acceptance signature |
|---|---|
| Ordinary Stembridge positive-root step, also with central directions | Stated: `TauCetiRoadmap.RootSystemsPartII.stembridge_step`; no spanning assumption is needed. |
| Orthogonal orbit-sum fold | Stated as the orthogonal specialization of `TauCetiRoadmap.RootSystemsPartII.general_fold`, whose realization specifies actual root vectors and simple support. The normalizations and root-lifting API stay in README §2.2. |
| Weyl group of the orthogonal fold | Stated: `TauCetiRoadmap.RootSystemsPartII.fixed_weyl_group`, with an explicit equality of its action on fixed vectors and the original Weyl action. |
| Adjacent even-A fold and general finite fold | Stated: `TauCetiRoadmap.RootSystemsPartII.general_fold`, including the adjacent, nonsimply-laced and component-cycle branches. It asserts existence of a native root pairing and base with their actual realization equations, not admitted data. |
| Irreducible based-automorphism rigidity in nonsimply-laced type | Stated: `TauCetiRoadmap.RootSystemsPartII.indexEquiv_eq_self_of_multiple_edge`. It extends the native three numbered rigidity cases. |
| Orthogonal-simple-orbit versus even-A reversal dichotomy | Stated: `TauCetiRoadmap.RootSystemsPartII.simpleOrbit_pairing_eq_zero_or_typeA_even`, including an actual Cartan numbering and reversal equation. |
| Forward folded-weight integrality and chamber equivalence | Stated: `TauCetiRoadmap.RootSystemsPartII.invariant_weight_transport`, on the native fixed submodule and any specified orbit-sum realization. The factor formulas and failure of reverse integrality remain in README §4.1. |
| Invariant positive integral cone and root-lattice equality | Stated: `TauCetiRoadmap.RootSystemsPartII.invariant_cone_transport`, comparing the actual native monoids and subgroups in both directions. |
| Existential invariant orbit-sum step | Stated: `TauCetiRoadmap.RootSystemsPartII.invariant_step`, on the original native pairing. |
| Ambient coroot step retaining the center | Stated: `TauCetiRoadmap.RootSystemsPartII.ambient_coroot_step`. Apply it to the flipped pairing for the coroot interpretation. |
| Exact coroot-step lift in a group with torsion | Stated: `TauCetiRoadmap.RootSystemsPartII.torsion_lattice_coroot_step`, with actual root lifts, equivariant real realization and injectivity on their generated subgroup. |

No headline is unstatable at these pins. The design's suggested-shape rationale had treated folded comparisons as reader-only because no constructed fold constant is implemented. The native fixed submodule, its dual and finite orbit-image subtype permit an honest existence theorem without such a constant. The acceptance file therefore includes those headlines too, using six simple real-bodied definitions (`rootLE`, `orbitIndices`, `orbitSum`, `fixedSpace`, `foldedIndices`, `fixedWeylGroup`) and one structure `OrbitSumRealization` bundling an existing native root-pairing carrier, base and explicit native conditions. Its fields do not contain any of the chamber, cone or Weyl comparison conclusions. The general-fold theorem proves existence; no data definition contains `sorry`. The root equation excludes rescaled or zero roots; the evaluation and base equations specify the perfect pairing and simple support. Component-cycle transport remains a construction adapter, not a scalar-algebra replacement headline. No API lemmas, boundary theorems or computed examples are admitted.

## Corrections and ownership decisions

1. Replaced the design's recorded library baseline with the actual pins from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The content main checkout is `e9512ca8df2763cf4a2c2be435e96f55a7742d11`. Every supplier below was checked in that checkout or at the specified open head, rather than inferred from the design's audit.
2. Preserved the accepted review's added diagram case theorem, explicit type-A transport, connected-component criterion, height input, dual order convention and torsion export. Strengthened the Lean even-A case from a mere type label to its actual reversal equation, as the prose requires.
3. Corrected the type-A carrier wording. The pinned integral datum has weight carrier `Fin n → ℤ` and is not literally the sum-zero integral coordinate lattice. A real based equivalence gives the classical sum-zero coordinates; its graph action becomes negative coordinate reversal there. No integral lattice isomorphism is asserted.
4. Made the torsion export's proof hypotheses explicit. An abstract torsion quotient need not admit injective real realization of its root subgroup, and real fixedness does not imply actual fixedness. The theorem requires both root equivariance and actual endpoint fixedness, plus an exact integral budget in the original group. README §4.4 supplies the negative control τ(n,t) = (n,t+n mod 2). The ReductiveGroupsPartII application checks these conditions on its actual échelonnage realization; no automatic absolute/relative identification is promised.
5. Distinguished forward weight integrality from chamber equivalence for all real fixed vectors, and cone equivalence for arbitrary fixed differences. The latter two do not require integral endpoints. The counterexample f/2 in the A₂ fold has folded value 1 and original values (1/2,1/2).
6. Qualified the nonminimal-period equality. The full sum always has its integer multiplicity factor for a positive period; equality with the distinct sum can also occur for a zero orbit-sum vector of an unbased automorphism. For based positive orbits the sum is nonzero and equality forces the minimal period. No period-zero division is stated.
7. Retained the source correction precisely as a correction to a finite inference: KZ25 line 2197 through KZ25 line 2206 bounds individual translates then their sum. The D₄ example leaves budget (0,−1,0,0) for that orbit, while the fixed highest root leaves budget 0. This does not refute the geometric proposition or assert anything about an unread published version.

8. Corrected the design's suggested-file limitation: a named implemented fold is not necessary to state fold existence and its comparisons. The realization is a bundle of native data with explicit equations, and the existence theorem is a Prop-valued theorem with `sorry`, not sorry'd data. The fixed-group signature specifies the restriction by its action on every fixed vector. The chamber and cone statements quantify over realizations tied to the actual orbit vectors; they do not quantify over an unrelated arbitrary root pairing.

### Duplication sweep and removals

I searched by mathematical objects in the pinned root-system trees, all main roadmaps, the board's package READMEs/design plans, and the open-head roadmap index using the required `roadmaps grep` and `roadmaps show` tools. The sweep included natural simple-root monoids, dominant intervals, root strings, component-return maps, signed versus unsigned orbits, fixed Weyl groups, oriented diagram symmetries, projected versus summed root normalizations, weight/cone transport and central/torsion lattices. The service initially indexed 362 open heads; its refreshed index used 363. Revision-only heads of RootSystems, LieHighestWeight and ReductiveGroups were not used as suppliers; their local main versions were read. The grep results were used only as leads.

| Object no longer independently constructed here | Supplier and exact locator | Retained extension |
|---|---|---|
| Natural simple-root cone, membership, positivity, height and integral evaluations | `TauCeti/LinearAlgebra/RootSystem/Positive.lean`: `TauCeti.posRootCone` line 280, `TauCeti.mem_posRootCone` line 285, `TauCeti.exists_root_eq_sum_nat_of_mem_posRoots` line 258, `TauCeti.exists_intCast_eq_coroot'_of_mem_posRootCone` line 339, `TauCeti.isPointed_posRootCone` line 358; `TauCeti.heightLinearMap_sum_nsmul_root` line 310 | A relation wrapping the native monoid and its transport/coordinate API, not a new cone |
| Dominant chamber and dominant finite intervals | `TauCeti/LinearAlgebra/RootSystem/Chamber.lean`: `TauCeti.dominantChamber` line 137; `DominantCone.lean`: `TauCeti.finite_setOf_dominant_sub_mem_posRootCone` line 119 | The new ordinary and invariant root-step existence theorems |
| Finite Weyl carrier, faithfulness and inversion descent | `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean` lines 153, 337; `Inversions/StrongExchange.lean` line 189; `Inversions/Exchange.lean` line 122 | Fixed-subgroup restriction and orbit-block descent, using those inputs |
| Chamber stabilizers | `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean` lines 125, 186 | Injectivity of restriction on the conjugation-fixed Weyl subgroup |
| Classification, diagram tree, numbered matrices and symmetry membership | `TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.lean` line 127; `FiniteType/Diagram.lean` lines 85, 244; `DynkinType.lean` lines 222, 416; `DiagramPermutations.lean` line 386 | Classification of **orbits of arbitrary based automorphisms**, including the even-A exception |
| Numbered B₂, F₄ and G₂ rigidity | `TauCeti/LinearAlgebra/RootSystem/SpecialNodePermutations.lean`: `TauCeti.DynkinType.eq_one_of_cartanMatrix_B2`, `eq_one_of_cartanMatrix_G2`, `eq_one_of_cartanMatrix_F4`, lines 248, 259, 273 | Arbitrary-pairing nonsimply-laced rigidity, including the Bₙ/Cₙ families; the three numbered cases are consumed |
| Type-A root datum, graph reversal and its index equations | `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/A.lean` lines 307, 603, 705, 747 | Real transport and the unsigned adjacent orbit-image/lift characterization |
| Dot-product base change and Cartan transport | `TauCeti/LinearAlgebra/RootSystem/BaseChange.lean` lines 124, 190, 199, 207, 235, 261 | Its specialization in the adjacent-A transport, with all scalar hypotheses |
| Generic signed ADE Lie fold, its projected/normalized presentation and root/coroot comparison maps for distinct/full sums | ReductiveGroups §9A.1b, *Folded frame, finite Cartan and presentation* and *Exceptional certificates, types and components* | Native real RootPairing adapters and the unsigned image of every root orbit; no duplicated Lie presentation, signed orbit calculation or exceptional Lie enumeration |
| Invariant ADE simple-root lattice basis | ReductiveGroups §9A.1b, *Signed orbit modules and brackets* | Its arbitrary-crystallographic component extension and positive **integral monoid** comparison |
| ADE component return, restriction, diagonal inverse and change of starting component | ReductiveGroups §9A.1b, component-return paragraph under *Signed orbit modules and brackets* | Form scaling, root-orbit sums and the nonsimply-laced extension, including two exchanged B₂ components |
| Coinvariant cocharacter order and group-theoretic realization | ReductiveGroupsPartII §RG2.1.4, *Minuscule coweights and the dominance order*, and §RG2.4.3, *Dominant inertia-coinvariant cocharacters* | Generic root-order API and the conditional exact lattice step; no second coinvariant lattice or order |
| General weight/fundamental-weight apparatus | LieHighestWeight Layers 2 and 6 on main | Pointwise integer coroot evaluations or an explicit subgroup L suffice |

The first eight rows were already designated suppliers in the accepted design; the package keeps them deleted from its targets. The ADE, component-return, invariant lattice and three numbered rigidity overlaps were additional removals found in this package sweep. Every such removal is reflected in Scope and ownership and the exact supplier contracts, without target stubs or extra Lean declarations.

Other apparent overlaps have different objects. CFSGBasicProperties T1–T2 constructs finite-field root groups, fixed normalizer representatives and twisted Bruhat descent, not the real fixed-Weyl restriction theorem. McKaySkewGroup consumes an adjacent-simple-orbit adapter in its marked affine diagram analysis. LieHighestWeight Layer 10 concerns affine alcoves and extended diagram symmetries. ClassicalGroupsPartII's reciprocal Weyl invariant rings, HabiroNahmSeries' recurrence root orbits and GeometricSatakeAndFusionPartII's geometric application do not own the unsigned finite-root fold. The board's geometric consumer explicitly requests this invariant-step result. No other owner of the ordinary/invariant step or the general finite pairing assembly was found.

The README cannot support summing an arbitrary eligible orbit, equality with the full folded weight lattice, unconditional lifting of real fixedness through torsion, or claims about an uninspected final source version. Their precise replacements and counterexamples are stated above; no accepted core target is omitted.

No notion was moved down from a later roadmap. All later geometric, affine and representation-theoretic applications remain consumers. No supplier gap is required: the generic torsion theorem has explicit conditional input maps, and the README makes no unconditional realization assertion beyond its named supplier.

## Sources and citation checks

All three works were fetched through the source service from author-hosted legal copies, with their existing design keys reused. Their extraction hashes match the design: Rap00 `8dfb39087041244845bb0fdd57cdd52c1bda3d70b8eebc02711df7cb90d2f71d`, Stem08 `989cbdb4147d5c99779e8a184a9a86086090f26fe5b003ca95696fd6c8e18de3`, KZ25 `cc6383505c39b40bd450c76de28218382b7b1216fe7999c098fc78c5a1d24d3b`. All entries are certified. There is no missing-text request, duplicate key or copied source passage.

I read Rap00's definition (1.8), its PGL₂ parity example and the entire Lemma 2.3 proof, Rap00 line 64, line 172 and lines 191–214; Stem08's condition (1), equations (2)–(4), Claims 1, 3 and 4 and their proofs, Stem08 lines 8–107; KZ25's Proposition 5.2.3, the orbit inference and geometric cases, and the Corollary 5.2.7 context, KZ25 lines 2179–2358. The README attributes the adjacent-A/return-map/general extensions to its own derivation and the named roadmap supplier rather than to Stembridge's orthogonality theorem. KZ25 numbering is explicitly that of the inspected author preprint.

The citation resolver reported no missing roadmap citation or Lean name. It used service main `1ce5c4f` and the refreshed open-head index, not the local main pin, and reported verbatim: “Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host.” I therefore checked the library names independently in the supplied local pins and resolved the supplier section titles directly against local main or the ReductiveGroupsPartII head. The quoted resolver limitation is not evidence that the local libraries are absent. No fetched text was treated as an instruction; no suspicious instruction-bearing passage was encountered.

## Adversarial mathematics pass

The rows below cover conventions, definitions, API laws, theorem conclusions and proof-route identities. Values are in simple-root coordinates unless Euclidean coordinates are specified. A₂ has Cartan matrix [[2,−1],[−1,2]], D₄ has center 2, and original simply-laced squared lengths are 2. Where a general law is tested, the displayed computation is a witness, not its proof. All API/Check claims were also compared with their section hypotheses and source/supplier route.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Standing finite reduced real arena | A₀, A₁, A₂ | Root counts 0,2,6; simple ranks 0,1,2 | Empty system included; irreducibility not invoked on it | Nonempty binder explicit in case theorem |
| Independent universes and finite indices | Empty and six-index A₂ | Sum over empty index = 0; A₂ positive index count = 3 | No cardinal or countability restriction needed | Separate universes retained |
| Cartan row convention | A₃ outer β₁, middle β₂ | Norms 4,2, cross −2; 2(−2)/2 = −2, 2(−2)/4 = −1 | Matches root rows, coroot columns | Supplier H-row transpose stated |
| Contravariant coweight action | D₄ triality | Forward 1→3→4→1; coweight map 3→1→4→3 | Inverse directions differ for order 3 | Forward action identified as inverse coweight map |
| Native perfect pairing versus spanning | Torus on ℝ | Perfect scalar pairing xy; zero roots span {0}, not ℝ | RootPairing alone permits a center | Explicit spanning only where used |
| Native base independence | A₂ simples, zero vector | det [[2,−1],[−1,2]] = 3; zero vector would have dependence coefficient 1 | Base excludes zero/rescaled fake simple root | Consume native base |
| Closed dominant chamber | A₂ at 0 and α₁ | Values (0,0) accepted; (2,−1) rejected | Walls included | Closed convention retained |
| Integral lattice versus rational ray | PGL₂ 0,1,2 | Q⁺ = 2ℕ; 1/2·2 = 1 in rational ray, 1 not in 2ℕ | Saturation fails | Exact natural cone |
| Canonical form on central directions | A₁ root α plus z with all evaluations zero | B(α,α) = 2·2 + (−2)(−2) = 8; B(z,z) = 0 | Positive only on root span | No ambient positivity assertion |
| Canonical-form automorphism invariance | A₂ λ = α₁, reversed λ = α₂ | Sum of squared coroot evaluations = 4+1+1+4+1+1 = 12 on each | Reindexing preserves form | Invariance derived, not assumed |
| Length normalization | A₁ canonical form, normalized form | 8 scaled by 1/4 = 2; coroot ratio 2·8/8 = 2·2/2 = 2 | Positive rescaling preserves pairings | Norm 2 used only after rescaling |
| Distinct period convention | D₄ outer root, m = 3,6 | Distinct βₒ; full sums βₒ,2βₒ; m/d = 1,2 | No weighted orbit sum | Positive-period hypothesis |
| Unbased zero-sum period exception | A₁ negation, periods 2,4 | Orbit {α,−α}, distinct sum 0; full sums 0,0 | Equality need not force minimal period outside based positive case | Period API qualified |
| §1.1 definition/membership | A₂ x=(0,1), y=(1,1) | Difference (1,0); natural expression 1α₁+0α₂ | Both descriptions true | Native cone wrapper |
| §1.1 reflexivity | A₂ x=(1,1) | x−x=(0,0)=0α₁+0α₂ | True | No order instance |
| §1.1 transitivity | 0,(1,0),(1,1) | Differences (1,0)+(0,1)=(1,1) | Two comparisons imply third | Addition in native monoid |
| §1.1 antisymmetry | A₂ and central line | δ=(1,0) is natural, −δ=(−1,0) is not; δ=−δ=0 only jointly | Pointedness gives equality | No chamber-only order |
| §1.1 translation | x=(0,1),y=(1,1),z=(2,−3) | (3,−2)−(2,−2)=(1,0)=y−x | Iff both directions | Arbitrary z allowed |
| §1.1 based equivalence | A₂ reversal | (1,0) difference maps to (0,1), both natural; (1,−1) maps to (−1,1), neither natural | Preserved and reflected | Based map hypothesis |
| §1.1 coordinate criterion | a=(−2,1),b=(0,3); incomparable (1,0),(0,1) | b−a=(2,2)≥0; incomparable differences (−1,1),(1,−1) | Coordinate iff and negative control | Integer coordinates explicit |
| §1.1 rational implication | PGL₂ difference 1 | Rational coefficient 1/2 exists, natural coefficient does not | Converse false | No saturation |
| §1.1 flip compatibility | PGL₂ dual root vector 2 | Difference 2 = 1·coroot; difference 1 has no natural coefficient | Flipped order matches integral cocharacter order | One order |
| §1.1 empty support | Torus x=0,y=z≠0 | Cone {0}; y−x=z∉{0}; x−x=0∈{0} | Comparison iff equality | Central negative control |
| §1.2 ordinary step | A₂ 0 to (1,1) | Highest-root increment (1,1), evaluations (1,1), residual (0,0) | All conclusions hold | None |
| §1.2 eligible simple can fail | A₂ simple α₁,α₂ | Evaluations (2,−1),(−1,2), versus required nonnegative pair | Arbitrary simple choice fails | Maximal-root route retained |
| §1.2 finite nonempty eligible set | A₂ budget (1,1) | Eligible positives (1,0),(0,1),(1,1), count 3 | Maximum (1,1) exists | Actual finite roots used |
| §1.2 maximality root-sum branch | A₂ β=α₁+α₂ | β+α₁=(2,1) not root; pairing β with α₁∨ = 1≥0 | Contrapositive applicable, β≠−α₁ | Opposite-root exception explicit |
| §1.2 exhausted-coordinate branch | A₁ budget α | m=n=1; λ+β=μ−0; coroot value 2 | Upper dominance transfers | Natural residual coefficients |
| §1.2 strictness and L membership | A₁ 0 to 2α, L=ℤα | β=α≠0; residual α; α,2α∈L | Strict and lattice conclusions | Membership derived from Q⊆L |
| §1.2 equal endpoints/rank zero | λ=μ; empty roots | Budget 0; each positive β has positive coefficient, cannot fit | Distinctness necessary | Negative control in README |
| §2.1 orbitIndices | A₂ reversal on α₁, identity | Sets {α₁,α₂} and {α₁}; sizes 2,1 | Deduplication and nonempty | Real-bodied finite image |
| §2.1 orbit-set stability | A₂ pair | σ{α₁,α₂}={α₂,α₁}={α₁,α₂} | Set invariant | No chosen exponent |
| §2.1 fixed sum | A₂ pair, D₄ outer cycle | σ(1,1)=(1,1); σ(1,0,1,1)=(1,0,1,1) | Sum fixed | Native action |
| §2.1 representative invariance | A₂ α₁ versus α₂ | Both orbit sets {α₁,α₂}; both sums (1,1) | Equal | None |
| §2.1 singleton law | A₂ highest root | Orbit {(1,1)}; sum (1,1) | Returns original root | None |
| §2.1 period formula | D₄ triality d=3,m=6 | Full sum (2,0,2,2)=2·(1,0,1,1) | Factor required | No period-zero claim |
| §2.1 positivity/nonzero | A₂ positive versus negative orbit | Sums (1,1) and (−1,−1); height 2 versus −2 | Positive sum nonzero; negative excluded | Basedness explicit |
| §2.1 equivariance | A₂ base reversal as equivalence | f(sum α₁ orbit)=(1,1)=sum f(orbit) | Same image vector | Intertwining required |
| §2.1 noninjective orbit image | A₂ simple pair and highest singleton | Two different orbit sizes 2,1; both vector (1,1) | Orbit quotient alone not root embedding | Root image deduplicated |
| §2.2 root-image and positivity | A₃ reversal | 12 original roots; 8 sum roots; 4 positive folded roots | Finite image correct | ADE supplier specialization |
| §2.2 simple-orbit basis | A₃ | β₁=(1,0,1),β₂=(0,1,0); fixed coordinates (a,b,a)=aβ₁+bβ₂ | Independent and spanning | Fixed-space carrier specified |
| §2.2 norm formula | A₃, D₄ | 2·2=4 outer A₃; 2·3=6 outer D₄; central 2·1=2 | 2 times orbit size | Orthogonality hypothesis |
| §2.2 edge/Cartan formula | A₃ blocks sizes 2,1; D₄ sizes 3,1 | N=2 gives −2/1=−2,−2/2=−1; N=3 gives −3,−1 | Integer entries in correct orientation | Denominator nonempty |
| §2.2 block reflection | A₃ outer block on β₂ | s₁s₃(α₂)=α₂+α₁+α₃=β₂+β₁; folded sβ₁ gives β₂−(−1)β₁ | Maps equal | Commuting product required |
| §2.2 identity/empty compatibility | A₁ id and empty | Root set {±α} unchanged; empty root image ∅, fixed dimension 0 | Agreement | Empty base included |
| §2.2 isometric equivalence | A₃ exchanging outer labels | β₁ maps to itself, β₂ to itself; norms 4,2 unchanged | Based fold map preserves vectors | No unmarked identification |
| §2.2 height descent | A₃ central block on the orbit of α₁+α₂ | Sum (1,2,1) has central pairing 2 and maps under s₂ to (1,0,1); height 4→2 | Strict decrease 2 | Central block supplies descent; the outer block fixes this sum |
| §2.2 all-root orthogonality | A₃ orbit {α₁+α₂,α₂+α₃} | Dot product −1+0+2−1=0; sum norm 4 | Non-simple root orbit also orthogonal | Finiteness retained |
| §2.2 adjacent exclusion | A₂ pair | Predicted orthogonal norm 4 versus actual 2+2−2=2 | Orthogonal construction inapplicable | Adjacent adapter |
| §2.3 fixed-Weyl isomorphism | A₃ and D₄ | Centralizer orders 8 and 12; folded B₂/G₂ orders 8 and 12 | Consistent and faithful | Exact restriction theorem |
| §2.3 block inversion drop | A₃ w₀, outer block | Inversion counts 6→5→4, drop 2=block size | Sequential removals justified | Uses native right descent |
| §2.3 injectivity witness | A₃ fixed regular sum | α₁+2α₂+α₃ has values (0,2,0), not regular; 3α₁+4α₂+3α₃ has (2,2,2), regular | Wall-free witness required | Strictly dominant choice, not arbitrary invariant vector |
| §2.3 conjugation fixed versus pointwise | A₂ id, W=S₃ | Fixed subgroup order 6; whole-space pointwise stabilizer order 1 | Distinct notions | Explicit definition |
| §2.3 noncommutativity | A₂ s₁s₂ versus s₂s₁ | Images of α₁ are α₂ versus −α₁−α₂ | Group not assumed abelian | S₃ negative control |
| §2.3 empty group | Rank 0 | Both group orders 1, no inversions | Trivial theorem case | No simple index selected |
| §3.1 nonsimply-laced rigidity | B₂,G₂ node exchange | (−2,−1)→(−1,−2); (−3,−1)→(−1,−3) | Oriented Cartan not preserved | Three native rigidity cases consumed |
| §3.1 orthogonal branch | A₃ reversal; D₄ triality | Outer pairings 0; middle singleton size1; D₄ outer pairings all0 | Orthogonal alternative | Nonempty and irreducible explicit |
| §3.1 even-A branch | A₄ reversal | Permutation (1 4)(2 3); middle pairing −1; outer pairing 0; n=2 | Exceptional alternative realized | Numbering and reversal included in Lean |
| §3.1 tree-center route | A₃ versus A₄ | Centers vertex2 versus edge{2,3}; distance changes across an edge by1 | Correct dichotomy | Classification supplies finite types |
| §3.2 classical model transport | A₂ | Native weight carrier rank2; classical sum-zero ambient rank2; Cartan det3 | Real equivalence, not equality of integral lattices | Carrier wording corrected |
| §3.2 complete even-A root list | A₂,A₄,A₆ | Distinct sums 2,8,18 = 2·1²,2·2²,2·3² | Counts include short roots once | Image construction |
| §3.2 base and Cartan | A₄ long f₁−f₂, short f₂ | Norms4,2, dot−2; off-diagonal −2,−1 | B₂ orientation | No projected normalization |
| §3.2 middle value formula | A₂ λ=f | Original values (1,1); folded 2; orthogonal formula would give1 | Factor2 essential | Doubled middle coroot value |
| §3.2 fixed/paired short lifts | A₄ | (e₁−e₃)+(e₃−e₅)=e₁−e₅=f₁ | Two lifts, one image | No injectivity assertion |
| §3.2 exclude doubled short root | A₂ | Image {±f}; 2f has norm8 versus each image norm2 | Reduced root set | BC₁ rejected |
| §3.2 functorial transport | A₂ reversal before/after numbering | f maps to f, coroot value 2 on both; two possible A₂ numberings commute with reversal | Based equivalence compatibility | Specified intertwiner |
| §3.3 return transport/inverse | Two exchanged A₁ components | D(tα)=(tα,tα); projection gives tα; fixed pair (u,v) has u=v | Two inverse composites identity | ADE inverse imported; extension retained |
| §3.3 component orbit cardinality | Two D₄ components with triality return | c=2,d=3 gives6 outer members; c=2,d=1 gives2 central members | cd formula | Closing return action retained |
| §3.3 form scaling | Two swapped B₂ components | Norms l²→2l²; dot b→2b; ratio 2·2b/(2l²)=2b/l² | Cartan invariant | c≥1 avoids zero denominator |
| §3.3 simple-base transport | Two exchanged A₁ components | Simple coefficient n maps nα→n(α,α), no factor1/2 | Bases biject | No averaging |
| §3.3 cone transport | Same, n=0,1,2 and n=−1 | Image coefficients 0,1,2 stay natural; −1 remains outside cone | Iff both directions | Natural budget retained |
| §3.3 change of initial component | Two exchanged A₁ | D from component1 gives (u,u); starting at2 with σu gives same (u,u) | Diagram commutes | Return maps conjugated |
| §3.3 c=1/empty | Triality one D₄, empty system | D(u)=u on fixed subspace, factor1; no cycles in empty case | Boundaries valid | No c=0 datum |
| §3.3 nonsimply-laced extension | Two B₂ swap | Each8-root component folds to8 roots, not16; norms double | Broader than ADE supplier | Retained genuine extension |
| §3.4 general image/base | A₁⊕A₁ id versus swap | Root counts4 versus2; simple-base counts2 versus1 | Assembly distinguishes actions | Actual fixed space |
| §3.4 direct-sum root union | A₁⊕A₁ id | α₁+α₂ has coordinates(1,1) but root list is ±(1,0),±(0,1) | Positive vector need not be root | Union, not sumset |
| §3.4 branch agreement | B₂ id, A₄ reversal, D₄ triality | Root counts8,8,12; Cartan products2,2,3 | All finite branches covered | No long/short graph swap |
| §3.4 empty/functorial assembly | Empty and relabelled A₁⊕A₁ | Empty count0/dimension0; swap of labels permutes four roots, leaves root count4 | Compatible | Based equivalence requirement |
| §3.4 root-lattice image | A₂ reversal | Q^σ={(m,m):m∈ℤ}=ℤ(1,1) | Image equals invariant lattice by §4.2 | No full weight-lattice claim |
| §4.1 orthogonal evaluation | A₃ λ with values(d,e,d) | Folded outer value (2·2d)/4=d; central value e | Forward integrality | Norm denominator positive |
| §4.1 adjacent evaluation | A₂ λ=d f | Original(d,d); numerator4d/denominator2=2d | Middle factor2 | No division by2 in integrality proof |
| §4.1 component scaling | Two identical orthogonal blocks | Numerator N→2N; denominator D→2D; N/D unchanged | Values transport | c>0 |
| §4.1 chamber iff | A₂ d=−1,0,1 | Original signs −,0,+; folded values −2,0,2 | Both directions, walls included | Real chamber generality explicit |
| §4.1 failure of reverse integrality | A₂ λ=f/2 | Folded1; original1/2,1/2 | Full folded weight lattice larger | No surjectivity |
| §4.2 natural coefficient regrouping | A₂ c=0,1,2 | Original(c,c), folded coefficient c on each | Both directions | No orbit-size division |
| §4.2 uniqueness and integer version | A₃ invariant(a,b,a) | Coefficients(a,b) uniquely; e.g.(−1,2,−1)=−β₁+2β₂ | Root-lattice equality, signed coefficients allowed | Monoid distinguished |
| §4.2 rational negative control | A₂ f/2 | Original coordinates(1/2,1/2), folded coefficient1/2 | Outside both integral cones | Exact natural budget |
| §4.2 negative lattice vector | A₂ −f | Integer coefficient−1 on both sides; neither natural | Lattice≠positive monoid | Negative Check |
| §4.2 center/empty | Central z≠0 and zero | Simple sums always have central coordinate0; z has coordinate1; 0 has0 | No spurious central comparison | Ambient distinction |
| §4.3 invariant step | A₂ 0→f | β=f≠0, λ+β=f fixed, folded value2, residual0 | Endpoint valid | Existential selection |
| §4.3 bad D₄ orbit | α₁+α₂ and its triality translates | Individual pairings(1,1,−1,−1) permute; adding λ gives(3,3,1,1) | Individually dominant | Counterexample retained |
| §4.3 bad orbit budget | D₄ θ=(1,2,1,1) | Sum(1,3,1,1); θ−sum=(0,−1,0,0) | Generic summation implication false | Replaced by suitable-orbit existence |
| §4.3 good D₄ orbit | Fixed highest θ | θ pairings(0,1,0,0); λ+θ values(2,3,2,2); residual0 | Suitable orbit exists | Source correction scoped to inference |
| §4.3 identity/rank zero | A₁ and empty | Singleton increment α; empty cone0 gives no distinct endpoints | Ordinary theorem recovered | No weakened substitute |
| §4.4 ambient splitting | GL₂ v=(a,b) | E projection((a−b)/2,(b−a)/2), Z projection((a+b)/2,(a+b)/2); sum=(a,b) | Root evaluations and center retained | Positivity only on E |
| §4.4 projected endpoint need not stay in L | GL₂ L=ℤ², v=(1,0) | E projection(1/2,−1/2)∉ℤ², evaluation difference1 integral | Projection proof needs full integral-weight subgroup on E | Does not require p(L)⊆L |
| §4.4 GL₂ step | λ=(c,c),μ=(c+1,c−1) | β=(1,−1), both sums2c; dominance differences0,2 | Original central component preserved | Original endpoints used |
| §4.4 torus/infinite central action | ℝ rootless, σx=2x | Cone0; fixed λ requires λ=0; σᵐ=2ᵐ≠1 for m>0 | No central finite-order assumption needed | Hypothesis omitted |
| §4.4 PGL₂ integral export | ℤ, root2 | β=2 fits 0→2; candidate1 leaves nonintegral root coefficient1/2 | Parity retained | No rational replacement |
| §4.4 exact torsion step | ℤ⊕ℤ/2, r=(2,0) | (0,1)+(2,0)=(2,1); realized difference2; residual(0,0) | Torsion coordinate retained | Actual root lifts |
| §4.4 torsion-only endpoint gap | (0,0)→(0,1) | Real difference0; lattice difference(0,1)∉{(2n,0):n∈ℕ} | Exact budget excludes false application | Integrality in A required |
| §4.4 real fixedness does not lift | τ(n,t)=(n,t+n mod2) | fτ(1,0)=1=f(1,0), but τ(1,0)=(1,1)≠(1,0); τ(2,0)=(2,0) | Root equivariance alone insufficient for endpoints | Actual fixed endpoints explicit |
| §4.4 injective root subgroup realization | Root subgroup {(2n,0)} | f(2n,0)=2n; equality 2n=2m implies n=m | Nonzero budget cannot realize as0 | Explicit injectivity hypothesis |
| §4.4 equivariance/fixed sum in A | A₂ orbit with lifts r₁,r₂ | τ(r₁+r₂)=r₂+r₁=r₁+r₂; residual natural coefficients lifted exactly | Actual fixedness and order in A | No guessed torsion representative |
| Native fixed-space specialization | A₂ reversal, A₁ identity, empty root span | Fixed vectors (t,t), all tα, and 0; dimensions 1,1,0; (1,−1) maps to (−1,1) and is excluded | Native defining equation discriminates the carrier | No invented fixed-space object |
| Finite image index | A₂ two original root orbits | Two orbits of sizes 2,1 give the same f; image contains f once | Subtype is injectively indexed | No orbit-quotient embedding |
| Realization evaluation field | A₁ x=α,2α and functional f(α)=1 | Pairings 1,2; zero pairing would give0,0 | Functional evaluation pins the pairing | Zero/rescaled pairing excluded |
| Realization root-vector field | A₁ index α | Ambient root α equals index α; candidate 2α differs by α≠0 | Root rescaling fails the equation | Actual index vector required |
| Realization base field and mixins | A₂ reversal and empty input | Folded index set {±f}, simple support {f}; empty case has zero roots and zero support | Negative f cannot be chosen simple; empty bundle still permitted | Base equation and native root-system predicates |
| Realization excludes assumed comparison conclusions | A₂ λ=f/2 | All realization field equations hold; λ has folded value1 but original half-integer values | Structure does not assume reverse integrality | Only explicit root/base/evaluation conditions |
| Realization coroot determination | A₃ outer-first fold, alternative coroot value −2 on β₂ | Correct reflection gives β₂+β₁; alternative gives β₂+2β₁, outside positive roots β₁,β₂,β₁+β₂,β₁+2β₂ | Same root vectors cannot carry that alternative coroot | Finite reflection closure and value2 determine the functional |
| Fixed-Weyl subgroup definition | A₂ identity and A₁ identity | Centralizer preimage orders6,2; commutator with identity is1 for every element | Native fixed subgroup, closed under inverse/product | No new Weyl carrier |
| Restriction action equation | A₃ outer block, x=β₂ | Original s₁s₃ x = β₂+β₁; folded reflection image also β₂+β₁ | Isomorphism specified by actual action | Arbitrary unmarked group isomorphism excluded |
| Characteristic and prime boundary | Reduction of A₂ matrix modulo2,3 | det3 becomes1 mod2,0 mod3; diagonal2 becomes0 mod2 | Real theorems cannot be silently reinterpreted in positive characteristic | All Lean scalars ℝ; no good-prime restriction introduced |
| Total-function and denominator boundaries | d=1,2,3; c=1,2; n=1,2 | m=6 gives quotients6,3,2; norm denominators2,4,6; c=0,n=0 excluded only from nonempty adapter formulas | No 0/0, natural-subtraction or invalid Fin index | Empty case handled separately |

The finite coordinate checks were recomputed independently in scratch: A₀ through A₆ root-orbit images have sizes 0,2,2,8,8,18,18; A₃/A₄ have four norm-2 and four norm-4 image roots; D₄ has 24 original roots and twelve orbit-image roots, six each of norms 2 and 6. Its Weyl group has 192 elements and triality centralizer 12; the A₃ reversal centralizer has 8 elements. These checks verify the examples, not the proof obligations represented by `sorry`.

## Elaboration and binder audit

Ran the prescribed `lake env lean` command on the absolute tool path of `packages/RootSystemsPartII/Suggested.lean`, from the content checkout. Final exit status: 0. Exactly **10** warnings, each ``warning: declaration uses `sorry` ``; there were no errors and no other messages in the final run. The warnings occur at the ten headline theorems. Both individual Tau Ceti imports had their object files present, so no module build was needed. No forbidden build, import or option was used.

One intermediate expansion produced this non-warning message, reproduced verbatim without its machine-path prefix:

```text
error(lean.dependsOnNoncomputable): failed to compile definition, consider marking it as 'noncomputable' because it depends on 'RootPairing.Equiv.instGroup', which is 'noncomputable'
```

The fixed Weyl subgroup definition uses that native noncomputable automorphism-group instance, so it was marked `noncomputable`. The final run above resolves that error.

I also elaborated one scratch copy with `#check @name` for **all 17 top-level declarations**, all eight realization fields and its constructor, comparing the printed types with the README. The order definition keeps only module/pairing/base data. The orbit definitions and finite-image index retain `[Finite ι]`; the fixed-space definition does not need it. The realization retains its actual pairing, base, sigma and finite-index parameters. Both diagram statements retain finiteness, nonemptiness, spanning, reducedness, crystallographicity, irreducibility, basedness and the appropriate simply-laced condition. The general fold and the Weyl/chamber/cone comparisons retain finiteness, spanning, reducedness, crystallographicity and basedness; the Weyl statement additionally retains simply-laced and orthogonal-simple-orbit hypotheses. Their realization parameter is an actual bundled native pairing with the defining equations. The invariant step retains both fixedness, dominance, integrality and exact-comparison hypotheses. The ambient and torsion statements retain both finite-dimensionality assumptions, their subgroup/realization data and all fixedness/integrality hypotheses. No silently dropped binder was found and no post-audit signature change was needed. The ambient theorem requires endpoint integrality exactly as the README says, rather than an unused global integrality axiom on all of L.

## Dependency and identifier checks

The prescribed dependency check returned:

```text
depcheck: 52 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All supplier roadmaps are main or earlier permitted suppliers; no later continuation appears as a prerequisite. The empty gaps list remains unchanged.

The resolver found no missing cross-roadmap citation or Lean name, subject to the separately recorded library-search limitation. A local identifier audit finds all 17 top-level Lean declarations named in the README and zero undeclared own-namespace/API identifier claims. Only the ten headline theorems contain `sorry`; definitions have real bodies. Package outputs contain no absolute machine path. Source provenance remains in `sources.toml`; no source file or extraction is copied into the package.
