<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13739#issuecomment-6796656941 -->
Review (codex) of 4f171c3

Verdict: needs_changes

1. **F01** (P2) The continuity convention includes a noncontinuous reduction

   **Location:** `packages/CountableStructureSpacesPartII/design/README.md:108`: “Every reduction constructed in Layers 2 and 3 is continuous on the whole coding space”. Compare §3.5, lines 855–858, and plan target 3.13.

   **Claim:** the blanket convention includes the order-to-rooted-cover-graph reduction of §3.5. That reduction is not continuous even on `treeClass`, as §3.5 itself correctly states.

   **Witness:** Let T be the rooted star on ℕ. For n>1, insert n between 0 and 1, keeping the other leaves. Then Tₙ→T coordinatewise, but coverₙ(0,1)=false and cover_T(0,1)=true.

   **Exact repair:** replace Convention 3 with a precise scope: the structure-to-graph coding of §2.3 and the graph-to-order/tree codings of §§3.3–3.4 are continuous on their ambient coding spaces; §3.5's cover-graph comparison is Borel. Retain the noncontinuity statement in §3.5 and add the moving-intermediate-vertex witness there as a Check. Do not remove the comparison or claim a continuous extension of its specified map.

   **Repair tested:** for every fixed coordinate pair `(i,j)`, the inserted vertex eventually differs from both, so the orders agree with the star at that coordinate. The output adjacency coordinate `(0,1)` stays false instead of its limiting value true. The repaired convention makes no continuity assertion about this map, while its cover predicate remains a countable intersection of clopen conditions and is therefore Borel.

2. **F02** (P2) The full-space codings use a colour defined only on simple graphs

   **Location:** `packages/CountableStructureSpacesPartII/design/README.md:725`: “For a code `c ∈ graphClass` with decoded graph `G`”; lines 780–783 then specify a continuous map on `RelationalConfiguration Language.graph ℕ`. Also `packages/CountableStructureSpacesPartII/design/plan.json:979`, target 3.3, versus targets 3.6–3.7 and 3.10–3.11.

   **Claim:** the displayed block-order construction gives the advertised map on the whole binary-relation coding space. Its input colour `χ_c`, however, is defined only after assuming `c ∈ graphClass` and decoding a simple graph. The same dependency feeds the tagged-tree construction.

   **Witness:** Take the constant-true relation code c. It belongs to the ambient space but has `c.eval (adjAtom 0 0)=true`, so `IsSimpleGraph c=false`. The stipulated decoded simple graph and `χ_c` are unavailable.

   **Exact repair:** define the colour on every `c : RelationalConfiguration Language.graph ℕ`, encoding the length, the equality bits of `x.map ν`, and the ordered relation bits `c.eval (adjAtom a_i a_j)`. This is a finite diagram of a binary relation even when it is asymmetric or has loops. Keep the unravelling isomorphism theorem and the root/length-one independence Checks restricted to `graphClass`. State block-order and tagged-tree formation/continuity for arbitrary codes; retain isomorphism reflection where `c,d ∈ graphClass`. Update plan 3.3, its hypotheses/API, and the consuming constructions consistently.

   **Repair tested:** at `x=[1]`, the constant-true code has descriptor `(length=1, equality=true, adjacency=true)`; the empty graph has `(1,true,false)`. Both are legitimate finite data for the extended colour. Every natural colour still defines the order `ω+(colour+2)` and a tag of height `colour+2`. For simple graphs the new definition gives exactly the old colour; consequently the original reductions and Checks are preserved. The native carrier explicitly imposes no graph axioms (`TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:75`); the separate predicate and guarded decoder are at `TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:97` and `:108`.

   This is a design-domain defect, not a claimed Lean elaboration failure or a counterexample to the existence of some continuous extension.

3. **F03** (P3) The arity-packing construction has no README Checks

   **Location:** `packages/CountableStructureSpacesPartII/design/README.md:942`: “Pass to `universalLanguage` by the coding that reads symbol `m` of arity `m`”. Its Checks block at lines 952–963 tests the anchored map and the final embedding, not this construction.

   **Claim:** every construction is specified with at least three discriminating README Checks. Plan target 4.4 has three; their mathematical content has not reached the README.

   **Witness:** `packages/CountableStructureSpacesPartII/design/plan.json:1536` has `pair_zero`, `padding_irrelevant`, and `not_surjective`. No README Check computes an unpair value, tests unused coordinates, or excludes an impossible image relation.

   **Exact repair:** add three prose Checks to §4.2 for this map, without Lean counterpart names: (1) `unpair 0=(0,0)` reads the original nullary bit; (2) `unpair 2=(1,0)`, so the arity-2 output reads symbol `(k,n)=(0,1)` and is constant on all two-tuples, regardless of their entries; (3) a target code whose arity-2 relation holds at `(0,0)` but fails at `(1,0)` is outside the image. Retain the existing API assertion of continuity, injectivity and equivariance and the recovery description from plan 4.4.

   **Repair tested:** the pinned pairing formula gives `pair 1 0=2`, `unpair 1=(0,1)` and `unpair 2=(1,0)`. Thus the second Check discards both tuple entries, and the third has values true/false where every image must have equal values. The earlier review's table incorrectly gave `unpair 1=(1,0)`; that was an error in its evidence, not in the design, and is not inherited here.

Three findings: two P2 interface/overclaim defects and one P3 README Check omission. The previous finding is repaired. The main mathematical constructions remain viable; none of the repairs below changes ownership or weakens a headline theorem. This is a design review: no `Suggested.lean` exists, and this lane does not elaborate.

## Previous finding, checked first

| Previous finding | Status | Repaired passage and independent verification |
| --- | --- | --- |
| Round 3 R01, `classIso` restricted to ℕ despite arbitrary-carrier transport | repaired | `packages/CountableStructureSpacesPartII/design/README.md:306`: “For a relational language `L` … and any carrier `α`, define `classIso K : Setoid K`”. Lines 307–309 give `Setoid.comap Subtype.val (isoSetoid L α)`. Lines 433–439 explicitly transport a class on α to its image on β and use both inverse relabellings. Convention 2 and plan targets 0.1–0.3 and 1.1 agree. The native `isoSetoid` accepts arbitrary carriers with `[L.IsRelational]`; no countability or nonemptiness is required. |

The repair's additional ownership clause at README lines 28–30 distinguishes arbitrary sets from CountableModelCounting's models of a sentence. That distinction is real: on `Fin 3`, the singleton code `P={0}` is not invariant and cannot be a sentence-model class. The ordinary subtype comap can represent it.

Checked all changed statements: arbitrary-carrier restriction, corestriction, whole-space comparison, orbit unfolding, invariant-image transfer, and the new `Fin 2`/`Fin 3` Checks. Computations appear below. `BorelComplete` remains specialized to ℕ (README lines 470–475). No finding was marked not actionable, and none is re-raised. Searching for the repaired domain-mismatch pattern elsewhere found R02 below. The earlier empty-codomain, decoded-vertex, and E₀-direction repairs also remain correct.

## Verified sound

### Coverage and principles

Read the complete 1,226-line README, all 49 targets, 59 API entries and 99 plan Checks, and all 12 source-manifest entries. The plan has seven layers, 19 definitions/constructions, and no gaps. Rechecked every changed passage and all 15 seeded source targets. The previous computed table was used for unchanged checks only; source and supplier summaries were independently resolved again. Fresh calculations include 1,700 finite interval comparisons, finite unary orbit counts, clique tags, rational colours and the continuity counterexample.

The design is a Part II extension of CountableStructureSpaces, whose scope explicitly excludes graph/order completeness. It imports rather than re-plans the coding, semantic graph translation, general reducibility, E₀, Scott-height and Polish-realization foundations. No new computational algorithm, copied source passage, sorry'd data, `set_option`, forbidden supplier or cyclic supply was found. The explicit maps are mathematical constructions. The targets allow nullary symbols, arbitrary countable relational languages/universes, function symbols through graph translation, and arbitrary branching in trees.

The layer order follows the supplied mathematical dependencies: class reductions → completeness → graph coding → order/tree coding; Polish realization → universal embedding; those results → the characterisations. The ordinal calculation is independent and is expressly allowed to precede the other constructions. No layer is named after a source chapter and the design does not say it follows a source's exposition.

### Adversarial table

T/F are truth values; cardinalities and finite diagrams are computed invariants. Rows cover all seeded targets, the headline theorems, the changed statements and all findings. Related API statements are grouped. These finite computations check the specifications and proof routes; they are not Lean proofs of the infinite theorems.

| Statement | Instances | Computed sides / invariants | Result; change |
| --- | --- | --- | --- |
| §0.1 `classIso`, orbit unfolding | Unary predicate on `Fin n`, n=0,1,2,3; one nullary symbol on `Fin 0` | Numbers of codes/classes: 1/1, 2/2, 4/3, 8/4; nullary case 2/2. On `Fin 2`, `{0}~{1}`=T, `∅~{0}`=F. | Repaired definition excludes both equality and the indiscrete relation. |
| §0.1 whole-space, restriction, corestriction | Identity on empty carrier; singleton `{P={0}}` inside size-one predicates on `Fin 3`; empty classes | Quotient counts 1→1, 1→1; inclusion reflects T exactly. Empty→empty reduction T; nonempty→empty F because MapsTo cannot hold. | Repaired carrier-general laws valid. |
| §0.1 non-injective reduction | Infinite coinfinite predicates → a single code | Source/target relations both T on every pair; source has 𝔠 codes and one orbit, image one code. | Reduction need not be injective. |
| §0.2 set versus relation reducibility | `0↦(0,0)`, positive integers↦`(0,1)`; E₀ | Diagonal preimage `{0}`; complement preimage `ℕ\{0}`. E₀(0^ω,10^ω)=T, E₀(0^ω,1^ω)=F, encoded by the two diagonal tests. Smooth(E₀)=F. | Set reduction is weaker, as claimed. |
| §0.2 empty targets, preimages | `Unit→Empty`, `Empty→Empty`, `Unit→Unit`; analytic pullback | Map-existence/empty-set-reduction values F/F, T/T, T/T. Refined-topology preimage and original preimage have identical elements; continuous identity returns the analytic set to the original topology. | Previous empty-codomain repair retained. |
| §1.1 arbitrary-carrier transport | `Fin 0` with/without nullary symbol; `Fin 3`, e=(012), P={0} | Quotient counts 1↔1 and 2↔2. Forward P={1}, inverse convention P={2}; inverse after forward returns {0}. Full unary class has four orbits before/after. | Repair valid; no countability needed. |
| §1.1 composition/invariance | σ=(01), τ=(12); invariant full class and singleton P={0} | `(τσ)(0)=2`, `(στ)(0)=1`. Full-class invariance T→T; singleton invariance F→F. Image equals inverse-relabelling preimage. | Left-action convention preserved. |
| §1.2 completeness and transfer | Empty class; one unary predicate; constant countable unary family; intersection with one graph orbit | Empty target has zero possible maps from a nonempty class. Quotient sizes ℵ₀ versus 𝔠 exclude unary completeness. Intersection has one type, completeness F; inclusion into a union preserves each iso bit. | Quantifiers, renaming and universe transport sound. |
| §1.3 functional coding | Constant value 3, swap(3,5); missing/duplicate function values; relational language | Table/graph values 3/{3}→5/{5}. Two values violate uniqueness; no value violates totality. Singleton graphs {n} converge to ∅. Relational range=univ. | Continuous Gδ range, not generally closed. |
| §1.3 model classes | Empty language; fields of characteristic 2 | Empty table/code gives one point; `1+1=0` is T in 𝔽₂(t), F in ℚ. | First-order countable-language model classes are invariant Borel. |
| §2.1 incidence construction | True binary tuple (0,1), reversed tuple; nullary bit; no symbols | Tuple degrees 3/2; nullary truth-edge counts 1/0; empty-language edge count 0. Sort colours 0,1,even≥2,odd≥3 disjoint. | Ordered positions and nullary information are retained. |
| §2.1 iso reflection | Two named unary predicates, only one nonempty | Source iso F, uncoloured incidence iso T; colours prohibit the symbol swap. With colours, tuple positions force the induced permutation and preserve the truth bit. | Both directions of the coloured iff hold. |
| §2.2 clique tags | Single edge, colours 0 and 1; empty carrier; triangular input | 9 vertices, 12 edges, 7 triangle vertices; recovered counts 2 and 3. Empty gives 0 vertices. Triangle input misclassifies its three originals. | Triangle-free hypothesis essential and present. |
| §2.3 graph class/completeness | Empty relation; loop; asymmetric edge; nullary source pair | Graph membership T,F,F. Graph coding preserves the two nullary types; output loops=0, symmetry=T. Each output coordinate reads ≤1 input bit. | Continuous graph-completeness construction sound. |
| §3.1 rational colour | 3/4,5,−1/6,1/8008,1,2,1/2 | ν=2,0,1,3,0,0,1; `1/8008<1/1000`=T. Denominators positive, so no valuation-at-zero case. | Dense fibres and normalization consistent. |
| §3.1 coloured Cantor theorem | Identity; swap(0,1); negative/nonnegative colouring | Identity preserves all bits; swap requires colour(π(1/2))=0 instead of 1. Negative set is an initial segment, nonnegative set is not. | Dense-fibre extension argument supplies both extension directions; wrong colouring fails. |
| §3.2 list order and parent | `[0]`, `[0,5]`; `[1/2,3]`; root | `[0]<[0,4]<[0,5]`; parent length 1, child length 2. Root length 0 and no parent. `[]` is least. | Source endpoint error is not imported. |
| §3.2 colours and tuple system | Single edge {0,1}; lists `[1/2,1]`, `[1,2]` | Decoded tuples (1,0),(0,0); equality F,T; adjacency T,F. A graph permutation preserves both matrices under the lifted map. | Root and both child-extension clauses yield a tuple BF system. |
| §§3.2–3.4 full-space domain | Constant-true code at `[1]`; empty graph | Native simple-graph predicate F/T; original χ application undefined/defined. Extended descriptors `(1,T,T)` / `(1,T,F)`. | R02: extend the colour's domain, keep graph hypotheses on reflection. |
| §3.3 linear-order class | ≤, <, universal relation, divisibility | Reflexive T,F,T,T; universal relation antisymmetric F at 0,1; divisibility total F at 2,3. | Closed invariant class specification correct. |
| §3.3 block recognition/completeness | Colours 0,1; ω-part and finite tail; empty/complete graph | Finite condensation sizes 2,3; ω-parts size ℵ₀; crossing ω/tail interval infinite. Decoded (0,1) adjacency differs; decoded (0,0) agrees. | Recognition and reflection work; full-domain specification needs R02. |
| §3.4 tree class | Chain, star, reverse ℕ, reversed initial chains | Down-set sizes x+1; 1 or 2; ℵ₀. For fixed i<j, reversed initial chains eventually give j≤i=T and i≤j=F. | Borel, invariant and nonclosed. |
| §3.4 tags/completeness | Colours 0,1; surplus leaves | Tag heights 2,3; surplus leaf height 1. Infinite ascending chains exist at originals, not in a tag. | Colour recovery works; ambient definition follows R02. |
| §3.5 presentations and rooted graphs | Four-node prefix tree; full list tree; ray marked at 0 or 1; star | Finite cardinal 4≠ℵ₀. Marked root degrees 1 versus 2 distinguish the ray marks. Star root degree ℵ₀. | Infinite qualification and marked root are necessary and present. |
| Convention 3 / §3.5 cover map | Star with moving n inserted in (0,1) | Input coordinates stabilize to the star; output edge(0,1) stays F, limiting edge T. | R01: continuity overclaim. Borel reduction itself is correct. |
| §4.1 Borel actions | Evaluation on ℕ; trivial action; uncountable unary signature | Orbit counts 1 and #X. In an uncountable product a singleton is not measurable: any countably supported event leaves another bit free. | Standard Borel hypothesis has content. |
| §4.2 anchored embedding | Evaluation action with S₀={0}; one-point action | Arity-one test at (a) equals x=a. On one point, test at (0,1)=T and (0,0)=F. With no anchors, the evaluation action gives the same code for every x. | Anchors ensure injectivity; equivariance matches inverse-coordinate action. |
| §4.2 universal language/packing | m=0,1,2,3; source symbol (k,n) | `unpair m`=(0,0),(0,1),(1,0),(1,1), respectively. At m=2 every tuple reads the same nullary bit. At pair(n,k), restricting an extended tuple returns the original k-tuple. | Map injective/equivariant; R03 supplies its absent README Checks. |
| §4.2 full universality | Distinct x,y and a basis open containing x with closure avoiding y | Identity makes every anchored test at x true; agreement forces gₖ→1 and gₖ•y in that open, hence y in its closure, contradiction. | Supplier's Polish realization has exactly the needed hypotheses. |
| Layer 5 characterisations | graphClass, empty class, unary class; trivial Cantor action | Five truth values T,T,T,T,T; F,F,F,F,F; F,F,F,F,F. Trivial-action orbit relation equals Cantor equality. | All implications use reductions on actual carriers. |
| §6.1 interval iff | Sizes 0…4, tuple lengths 0…2, equal atomic types, levels 0…3 | 1,700 comparisons: tuple BF value equals conjunction of interval BF values, zero mismatches. Empty-tuple BF₂ classes `{0},{1},{2},{3,4}`; BF₃ separates all five sizes. | Fresh recursion check, retaining the previous successor level. |
| §6.1 equality guard and ordinal multiples | Tuples (0,0),(0,1) in ℤ; ω,ω·2,ω+1; ω²,ω²·2 | Interval types ω*,0,ω agree but equality bits T/F. BF₂(ω,ω·2)=T; BF₂(ω,ω+1)=F; BF₂(ω²,ω²·2)=T, iso=F. Empty/nonempty BF₁=F. | Equality-pattern and nonzero-coefficient hypotheses are essential and present. |
| §6.1 induction route | Prefix ω^γ μ+ρ, μ=0 or positive | Matching μ′=0 or 1, same ρ; initial intervals agree at BFγ by the sum form; terminal intervals remain nonzero multiples. At γ=0 all empty tuples have identical empty atomic diagrams. | Stated native one-point bound follows, without importing the source's stronger indexing. |
| §6.2 non-Borel headline | Ordinal types ω^(1+β) and twice that ordinal | Iso F; BF at 1+β T, hence at β T. Hypothetical uniform separation would give BFβ F. Both types countably infinite for β<ω₁. | Valid contradiction for arbitrary target K, including limit β. |
| §6.2 height/complement consequences | Invariant Borel complete K; empty K control | Uniform height bound would give Borel iso T, contradicting F. Ambient complement of non-iso pairs is `(iso∩K²)∪(K²)ᶜ`. Empty K has Borel iso T and completeness F. | Correct ambient square, hypotheses and pullback. |
| §6.3 E₀ code | 0^ω,10^ω,1^ω; single-copy variant | Finite flip {0} permutes copies by symmetric difference: iso=T=E₀. Finite/cofinite P gives iso=F=E₀ for 0^ω/1^ω. Single-copy iso=F on 0^ω/10^ω. | All finite modifications are needed; rigidity gives reflection. |
| §6.3 cardinality/non-smoothness | Complete K; E₀ and Cantor antichain | Quotient bounds `𝔠≤#(K/≅)≤𝔠` give equality. Smoothness of K would force smooth(E₀)=T, contradicting F. | Both headline consequences follow from the native inputs. |
| §6.4 rank obstruction | ρ=0, unary class, graphClass | Every stratum with α≥0 equals K. Unary iso Borel=T, bound=0, complete=F. For graphClass, (a) and (b) cannot both hold: an analytic image bound makes its iso Borel=T against F. | Direct argument supports the stated theorem; source locator remains uncertified. |
| §6.5 lower order | Unary class and complete K | Unary quotient ℵ₀ versus E₀ quotient 𝔠: E₀→unary F; unary→Cantor equality→E₀ T. Complete K→E₀ F because Borelness would pull back. | Previous direction repair remains valid. |

### Seeded sources and author-flagged locators

All cited works already have manifest entries; no source was fetched or entry changed. Five cached texts were opened. Seven entries are settled uncertified and were neither requested again nor treated as read. The following distinguishes support for a theorem from support for the design's particular proof.

| Seeded target | Text and exact locator opened | Assessment |
| --- | --- | --- |
| 0.1 Isomorphism restricted to a class | paolini-shelah-tfab line 83, Definition 1.4, p.2; camerlo-gao-boolean line 106, pp.492–493 | Source definitions concern standard Borel spaces/classes on ℕ. Arbitrary-carrier/subset generalization is supplied by the native comap and measurable-space API, now explicit. |
| 1.1 Carrier relabelling | becker-kechris-bams line 159 through line 164, arXiv p.4 | Inverse-coordinate action and orbit=isomorphism match. Bundling arbitrary-carrier restriction is explicitly the design's construction. |
| 1.2 Definition of Borel completeness | paolini-shelah-tfab line 95 through line 101, Definition 1.6, p.3; camerlo-gao-boolean line 106 through line 110, p.493 | Quantification over countable structure classes matches. The design's arbitrary target K is a stated extension, justified by its subsequent reduction arguments. |
| 2.1 Incidence graph | montalban-cst1 line 4572 through line 4659, Theorem VI.27, pp.99–101 | Uniform relational-structure-to-graph coding; different gadgets. The design labels its incidence construction as its own and proves recognition rather than attributing its formula to the source. |
| 2.3 Graphs complete | Same Theorem VI.27; camerlo-gao-boolean line 111, p.493; paolini-shelah-tfab line 125, p.3 | Readable sources support graph completeness; Friedman–Stanley Theorem 1 is settled uncertified. Explicit fixed-carrier continuity checked independently. |
| 3.1 Dense colouring | montalban-cst1 line 4258 through line 4260 and line 4273 through line 4275, pp.91–92 | Dense labelled rationals and the coloured Cantor argument. Specific denominator valuation is the design's choice and satisfies density. |
| 3.2 Unravelling | montalban-cst1 line 4205 through line 4285, Lemma VI.18 proof, pp.90–92 | Labelled tuple trees, repetition, lengths and parent recovery support the route. Design replaces category by a named tuple-system theorem. R02 concerns its ambient domain. |
| 3.3 Linear orders complete | montalban-cst1 line 4246 through line 4288, Lemma VI.18, pp.91–92 | Source eliminates labels with finite orders. Design's ω+finite blocks keep the carrier fixed; condensation independently verifies them. Friedman–Stanley §2 unreadable. |
| 3.4 Trees complete | montalban-cst1 line 4205 through line 4245, pp.90–91 | Labelled-tree step supports the route, with own uncoloured tag construction verified above. No finite-branching restriction imported. |
| 3.5 Tree presentations | camerlo-gao-boolean line 257 through line 263 and line 276 through line 281, p.496 | Binary-tree discussion is background only. Design correctly requires finite linearly ordered ancestor sets, admits arbitrary branching, and keeps only infinite trees for codes on ℕ. Cover map checked directly. |
| 4.2 Universal embedding | becker-kechris-bams line 132, Theorem 2.1, arXiv p.3; line 172 through line 177, Corollary 2.2, p.4; line 247 through line 268, p.6 | Universal S∞ logic action is stated. Source proof uses Effros spaces and trees; anchored-open-set route here is a valid alternative using the explicit Polish-realization supplier. |
| 6.1 Ordinal multiples | montalban-cst2 line 2322 through line 2331, Lemma II.37, pp.35–36; line 2337 through line 2425, Lemma II.38/Corollary II.39, pp.36–38 | Source uses one-sided, finite-tuple levels and first-element hypotheses. Design acknowledges the indexing difference and independently proves its native one-point bound; equality-pattern omission is corrected. |
| 6.2 Non-Borel isomorphism | paolini-shelah-tfab line 103 through line 106, Fact 1.7, p.3; montalban-cst2 line 8997 through line 9012, Theorem XI.3, p.207 | Source non-Borelness is for Borel classes; design's arbitrary-K extension has its own uniform-separation proof. Bounded-height implication is consumed from the named native-carrier supplier. |
| 6.3 E₀ and continuum many types | camerlo-gao-boolean line 94 through line 105, pp.492–493 | Passage gives universal orbit reducibility, not the explicit finite-flip construction. That construction's iff, continuity and rigidity were independently checked; native E₀ cardinality/non-smoothness supplies the consequences. |
| 6.4 Friedman–Stanley obstruction | friedman-stanley-1989 §4; hjorth-kechris-1996 §§4–5 | Settled uncertified; exact section numbering cannot be certified. Direct analytic-image/bounded-stratum proof was checked independently. |

Also read paolini-shelah-tfab Definitions 1.2/1.4 and Remark 1.5 for §0.2, becker-kechris-bams §2 for §4.1, and montalban-cst2 line 9046 through line 9054 for the lower-order context. The latter does not by itself prove the unary/E₀ comparison; the pinned quotient and smoothness results do. The manifest's flagged Annals numbering versus arXiv v6 and the seven uncertified works remain under Not verifiable. The Montalbán citations expressly name the drafts actually read.

### Pinned declarations and duplication by object

The content manifest and plan agree on Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths here are relative to the respective library repositories. Opened the following definitions/signatures and their hypotheses; this is independent of the roadmap resolver, which does not inspect the local pins.

| Objects | Pinned locations and contracts read |
| --- | --- |
| Codes, atoms and restriction | `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:71`, `:75`, `:182`, `:211`, `:222`, `:228`, `:304`, `:309`, `:314`: atoms are symbol/tuple data; codes have body `Atom L V → Bool`, with no graph, structure, countability or nonempty axioms; product measurability; contravariant restriction and inverse-coordinate action. |
| Topological coding | `TauCeti/ModelTheory/RelationalConfiguration/Topology.lean:35`, `:52`, `:64`, `:70`, `:89`, `:93`, `:97`, `:103`, `:109`: compact product topology, coordinate continuity, countable-language/carrier Polish/Borel instances and cardinality bound. |
| Decoding and transport | `TauCeti/ModelTheory/RelationalConfiguration/Structure.lean:37`, `:93`, `:98`, `:111`, `:126`: relational decoding; `Equiv.encodeVia`, its evaluation, isomorphism and composition. |
| Native isomorphism/invariance | `TauCeti/ModelTheory/RelationalConfiguration/Isomorphism.lean:81`, `:86`, `:95`, `:100`, `:135`, `:141`, `:149`, `:187`, `:227`, `:244`: arbitrary carriers; relationality explicit; analytic graph needs countability; action invariance agrees. |
| Language equivalence/model classes | `TauCeti/ModelTheory/RelationalConfiguration/LanguageMap.lean:186`, `:200`, `:218`, `:227`, `:234`, `:240`, `:277`; `ModelsOf.lean:66`: language transport is a homeomorphism on every carrier, preserving iso for relational languages and carrying sentence model classes. |
| Simple graph distinction | `TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:73`, `:97`, `:108`, `:120`, `:126`, `:205`, `:222`, `:267`, `:277`: arbitrary binary codes versus symmetric irreflexive codes, guarded decoder, measurable graph equivalence/range. R02 relies on this distinction. |
| Small language/functional translation | `TauCeti/ModelTheory/Infinitary/SmallPresentation.lean:50`, `:56`, `:72`, `:111`, `:120`; `GraphTranslation/Language.lean:72`, `:82`, `:230`; `GraphTranslation/Reconstruct.lean:161`, `:209`, `:248`, `:315`: both symbol sums countable for small presentation; graph relation's last coordinate is output; totality/functionality; reconstruction uses nonemptiness, satisfied on ℕ. |
| Permutation topology | `TauCeti/Topology/Algebra/Group/Perm.lean:42`, `:110`, `:143`, `:149`: forward/inverse topology, discrete-carrier group structure, countable-carrier Polishness, finite-stabilizer basis. No global measurable-space instance there. |
| Reductions and E₀ | `TauCeti/SetTheory/Descriptive/BorelReducibility.lean:100`, `:108`, `:115`, `:127`, `:135`, `:146`, `:159`, `:229`, `:246`, `:289`; `EZero.lean:81`, `:95`, `:105`, `:214`, `:219`, `:238`, `:243`: general measurable-space reductions/comaps, quotient injection, Borel pullback, measurable countable classes, E₀ finite disagreement, cardinality and strict nonsmoothness. |
| Back-and-forth and height | `TauCeti/ModelTheory/BackAndForth/Equivalence.lean:49`, `:65`, `:70`, `:90`, `:96`, `:210`; `TupleSystem.lean:39`; `Presentation.lean:207`; `Countable.lean:99`; `DiscreteOrder.lean:86`; `TauCeti/ModelTheory/Scott/Height.lean:133`: actual one-element successor recursion, equality/comparison atomic types, empty tuple and both extension directions, countable-system-to-isomorphism, external height. |
| Native language theories | `Mathlib/ModelTheory/Graph.lean:49`, `:59`, `:68`, `:72`; `Order.lean:76`, `:163`, `:209`; `Algebra/Ring/Basic.lean:59`; `Algebra/Field/Basic.lean:80`; `Algebra/Field/CharP.lean:47`: graph axioms, non-strict linear-order theory and field Check inputs. `Language.order.linearOrderTheory` is dot application to the order language. |
| Coloured-order proof inputs | `Mathlib/ModelTheory/PartialEquiv.lean:380`, `:499`; `FinitelyGenerated.lean:278`; `Mathlib/Order/CountableDenseLinearOrder.lean:246`: initial finitely generated partial equivalence and both extension directions are needed; the empty map supplies the former. Ordinary Cantor isomorphism has no colour-preservation conclusion. |
| Descriptive topology | `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:83`, `:331`, `:353`, `:366`, `:524`, `:836`, `:1110`; `Mathlib/MeasureTheory/Group/Arithmetic.lean:463`; `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean:614`: standard Borelness, Polish refinement, analytic images/preimages, Suslin, Lusin–Souslin, subtype standard Borelness and joint measurable action. No nonemptiness hidden in standard Borelness. |
| Subtypes, list order, trees, pairing | `Mathlib/Order/Setoid/Basic.lean:442`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:192`, `:223`; `Mathlib/Data/List/Lex.lean:141`; `Mathlib/SetTheory/Descriptive/Tree.lean:32`; `Mathlib/Data/Nat/Pairing.lean:37`, `:42`, `:103`, `:108`: actual comap relation, measurable inclusion/corestriction, prefix-first list order, prefix-closed trees (empty allowed), and pairing values/bounds. |

Object searches covered the pins, main and indexed open heads through `roadmaps grep`, and board READMEs. General Borel reductions/E₀ and graph translation already have native owners and are imported. The new incidence/tag maps, denominator colouring, unravelling, Borel-completeness comparisons and anchored universal embedding were not found as existing targets under different names. Carrier relabelling differs from the native language-equivalence homeomorphism; `classIso` differs from sentence-specific restricted isomorphism, as the repaired scope explains. No new declaration duplicates a readable sibling's fully qualified name.

### Cross-roadmap citations, overlaps and direction of supply

Read the supplied package index and overlap leads first. Read the scopes/ownership of the closest heads: #1316 CountableStructureSpaces; #2012 CountableModelCounting; #1319 HanfNumbers; #1616 BorelEquivalenceRelations; #1615 InfinitaryModelExistence. Also read NoncompactQuantumSymmetry #1015's realization contract. The three main README shape comparisons were BorelEquivalenceRelations, InfinitaryModelExistence and CountableModelCounting. Revisions of roadmaps already on main were not used as new suppliers.

| Citation | Resolved current location | Result |
| --- | --- | --- |
| CountableStructureSpaces Layer 0 and §1.2 | #1316, `TauCetiRoadmap/CountableStructureSpaces/README.md:228`, `:264`; `Suggested.lean:113` | Closed graph-code range and joint continuous logic action are still supplied. |
| CountableStructureSpaces Layer 3 | #1316, `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:241` | Analytic family, closed node events, well-founded trees, bound below ω₁; no clopen-only narrowing. |
| CountableStructureSpaces §§4.3–4.4 | Same `Suggested.lean:342`, `:402` | Bounded Scott height on a sentence-model class gives Borel iso; analytic non-iso pairs have uniform BF separation. |
| CountableStructureSpaces Layer 5 | Same `Suggested.lean:496` | López–Escobar on invariant Borel classes with countable relation symbols. |
| CountableStructureSpaces §6.2/worked example 2 | Same `Suggested.lean:579`, `:588`, `:595`, `:618`; `README.md:686` | Strict well-order codes, countably infinite ordinal presentations, analytic complement/non-Borelness, and unary countable Borel orbits/height ≤ω. |
| NoncompactQuantumSymmetry Layer 4, M1.BorelRealization | #1015, `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1329`; `Suggested.lean:161` | Polish group, standard Borel X, jointly Borel action → same X with compatible Polish continuous-action topology. Neither local compactness nor original continuity assumed. |
| BorelEquivalenceRelations §§5.1–5.4 | Main, `TauCetiRoadmap/BorelEquivalenceRelations/README.md:547`, `:557`, `:574`, `:583` | Ownership exists; consumed implementation is at the Tau Ceti pin. Revision #1616 is not needed. |
| InfinitaryLogic Layer 1 | Main, `Completed/InfinitaryLogic/Suggested.lean:191`, `:239`, `:249` | BF recursion and tuple-system ownership; native implementations consumed. |
| InfinitaryModelExistence §0.3/Layer 6 | Main, `TauCetiRoadmap/InfinitaryModelExistence/README.md:219`, `:611`, `:630` | Small language, graph language/expansion and reconstruction ownership; native implementations consumed. Revision #1615 is not needed. |
| CountableModelCounting Layer 0 | Main, `TauCetiRoadmap/CountableModelCounting/README.md:281`, `:318`; #2012 `README.md:372` | Sentence-restricted isomorphism and language transport, not arbitrary-set `classIso` or universal Borel completeness. Revision #2012 is not needed. |
| Closest other scope | #1319, `TauCetiRoadmap/HanfNumbers/README.md:46` | EM models, partition calculus and Hanf numbers, not these coding/reducibility objects. |

The overlaps file reports no conflicting head, dropped cited id or revision-only id. Inspection of the cited sections found no additional drift or second owner. A “Borel complete invariant” in CountableModelCounting classifies types by equality and is not a Borel-complete equivalence relation. Other broad-search hits concerned algebraic Borel subgroups or equivariant spectra and were excluded by object. The three remotely indexed board packages concern arithmetic; the local board search revealed no competing owner for these constructions. No maintainer notes were supplied.

All 21 `*Needs:*` lines, layer Dependencies and plan prerequisites were read. No declared supplier gaps, unowned proof input, forbidden supplier, upward citation or cycle was found. The required command returned:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2057 edges, 0 problem(s)
```

`roadmaps resolve` found no missing cross-roadmap citations or local roadmap names. Its explicit limitation—no pinned Lake packages checked by that service—is covered by the local pin inspections above.

### Shape, headline coverage and package checks

The Summary, Scope and ownership, Conventions, Exact supplier contracts, build guide, seven mathematical layers, Examples/Dependencies, consumers and references are present. All 19 plan definitions/constructions have API entries and at least three Checks; R03 identifies a concrete failure to carry a construction's Checks into the README. R01 and R02 concern mathematical scope, not the organization of the layers. No README machine path, pull-request number, HTML anchor, LaTeX delimiter, hand-off narrative or source-chapter heading was found.

The headline theorems to carry into the package are:

- Borel completeness of graphs, linear orders, order trees, and the rooted-graph presentation;
- continuous structure-to-graph and graph-to-order/tree reductions;
- the equivariant measurable universal S∞ embedding;
- the four equivalences between the five characterisations of completeness;
- back-and-forth equivalence of nonzero ordinal multiples;
- non-Borel isomorphism, unbounded Scott height, and non-analytic non-isomorphism pairs with their stated hypotheses;
- E₀ reducibility, continuum many types, and nonsmoothness;
- the rank-bounded obstruction.

These have native carriers at the pins and can be stated existentially using simple language/class predicates; no admitted coding map is needed. The repaired `classIso` can have a real comap body. R02 preserves the promised full-space continuity headline instead of restricting it away. Own backticked names resolve to plan predicates/headline names; the plan's internal API catalogue is not an instruction to put those API facts in Lean.

There is **no `Suggested.lean` in this design**. Thus there are zero sorried declarations to probe, no actual import/docstring/binder inventory to certify, and no package-stage headline omission inferred from an absent design-stage file. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No `#check @name` run or one-tactic Lean run was possible; no passing elaboration or “sorry only” warning claim is made. At package stage each actual headline must be checked for padding against the native APIs; this report does not pre-approve an unwritten Lean file.

## Not verifiable

- The seven settled uncertified texts: `friedman-stanley-1989` (Theorem 1 and §§1–4), `gao-idst` (Chapters 3, 5, 13), `becker-kechris-1996` (§§2.5–2.7, 3.4), `kechris-cdst`, `hjorth-2000`, `hjorth-kechris-1996` (§§4–5), and `mekler-1981` (§2). This includes the author-flagged uncertain numbering. No legal full text was supplied; none was guessed or requested again.
- Published Annals numbering for `paolini-shelah-tfab`: the cached text and checked numbering are arXiv v6, as the manifest records. The published version was not compared.
- Source gadget figures were not visually reconstructed. The extracted construction text was read; the design uses different, explicitly specified gadgets, checked directly.
- Lean elaboration and inferred declaration binders: unavailable in this lane and no `Suggested.lean` exists. Only design signatures and actual pinned source declarations were compared.
- Ownership beyond the supplied/indexed heads and readable board/main context is not asserted. No new missing-reference request or conditional supplier gap was created.

## Source issues

- **Misprint** in montalban-cst2 at XI.2 discussion, printed page 208 (line 9039): the source says the graph theorem has an unresolved Part 1 theorem number; it should be Part 1 Theorem VI.27; affects nothing.
- **Error** in camerlo-gao-boolean at rooted binary tree definition, printed page 496 (lines 257–263, 276): the source says root, unique parents and at most two children suffice for sequence-tree representation; it should require finite linearly ordered principal down-sets; affects a stated result.
- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36 (lines 2322–2330): the source says corresponding open intervals suffice for weakly increasing tuples; it should also require matching equality patterns, or strictly increasing tuples; affects a stated result.
- **Error** in montalban-cst1 at Lemma VI.18 proof, printed page 91 (line 4254): the source says finite rational sequences in lexicographic order form a copy of ℚ; it should retain their least element under the prefix-first convention; affects a stated result.
- **Error** in becker-kechris-bams at §2, arXiv page 4 (lines 159–160): the source says every nonempty countable relational language has Cantor coding space; it should require infinitely many relation queries, excluding finitely many nullary symbols only; affects a stated result.
- **Error** in paolini-shelah-tfab at introduction item (iii), arXiv page 3 (line 127): the source says class-two exponent-p groups are Borel complete for every prime p; it should exclude p=2, since exponent-two groups are abelian; affects a stated result.

These are reverified source issues, not six additional design findings. Witnesses: `1+ℤ` satisfies the displayed root/parent/child conditions but has infinite ancestor sets; `(0,0)` and `(0,1)` in ℤ have interval types ω*,0,ω but different equality patterns; `[]` is least in the list order; one nullary symbol gives two codes; exponent two gives `ab=(ab)⁻¹=b⁻¹a⁻¹=ba` (and on countably infinite elementary abelian 2-groups there is one isomorphism type). The roadmap's actual constructions avoid these defects.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4f171c396ae03b5a8ca8d896576540ab2561d11b", "job": "REV-DESIGN-CountableStructureSpacesPartII~4", "model": "gpt-6-astra", "worker": "chris-3"} -->
