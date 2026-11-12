# Review of CountableStructureSpacesPartII (design, round 3)

**Verdict:** needs changes

One finding, P2: the arbitrary-carrier relabelling contract uses a class-isomorphism definition whose domain is restricted to ℕ. The four previous findings are repaired. The constructions and headline mathematical arguments checked below survive the adversarial pass. This is a design review: there is no `Suggested.lean`, and elaboration is unavailable in this lane.

## Previous findings, checked first

Locations in this table refer to `packages/CountableStructureSpacesPartII/design/README.md`. The quotations are the author's repaired wording, not source passages.

| Round 2 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01: obsolete coding API and duplicated native objects | repaired | Lines 400–405: “relabelling along `e` is Tau Ceti's restriction”; “Bundle it as a homeomorphism and a measurable equivalence”. Lines 625–629 identify `graphClass` with native `IsSimpleGraph` and explicitly cite its existing API. Lines 179–251 replace the old carriers, reducibility, graph translation and back-and-forth names with native declarations. Both recorded pins agree with `lake-manifest.json`. The declarations and surviving roadmap contracts were opened again; see the tables below. The new finding concerns the domain of the local `classIso` definition, not an obsolete supplier name. |
| R02: empty-target reducibility | repaired | Lines 356–359: “`A = ∅ ∧ (IsEmpty X ∨ Nonempty Y)`”; the full-target version has the same existence clause. `Unit → Empty` gives false on both sides; `Empty → Empty` gives true on both sides. Plan 0.4 agrees. |
| R03: distinct rationals versus distinct decoded vertices | repaired | Lines 774–775: “vertices `(0, 1)`, distinct and not adjacent”; lines 777–779: “at `[1, 2]` both entries have ν-value 0”. The separating tuple is `(0,1)`, with adjacency 0 versus 1; the negative control is `(0,0)`, with adjacency 0 in both graphs. Plan 3.6 agrees. |
| R04: direction of unary/E₀ non-reduction | repaired | Lines 1148–1153: “`eZero` is not Borel reducible to their isomorphism relation”; “these codes is Borel reducible to `eZero`”. The quotient cardinalities are respectively 𝔠 and ℵ₀. Smoothness followed by the native Cantor-to-E₀ reduction supplies the other direction. Plan 6.9 agrees. |

None was marked not actionable. No settled finding is re-raised. I also searched the remaining design for the repaired patterns: obsolete carrier names, empty-codomain assertions, rational versus vertex equality, ambiguous reduction directions, closedness of functional graph ranges, finite condensation classes, binary versus arbitrary trees, and the ambient space for analyticity. The previously repaired mathematical distinctions remain present.

## R01 (P2) — Arbitrary-carrier class transport exceeds the domain of `classIso`

**Location:** `packages/CountableStructureSpacesPartII/design/README.md:420`: “`classIso` of a class and of its image are Borel reducible to each other.” Compare its definition at line 302 and `packages/CountableStructureSpacesPartII/design/plan.json:140` with the relabelling API at line 401.

**Claim:** for arbitrary `e : α ≃ β`, §1.1 transports classes of configurations on α and β and applies `classIso` to both. But §0.1 defines `classIso` only for `K : Set (RelationalConfiguration L ℕ)`.

**Witness:** take α = β = `Fin 0`, `e = Equiv.refl`, and K the whole coding space. K has type `Set (RelationalConfiguration L (Fin 0))`; neither advertised `classIso` expression accepts it.

**Exact repair:** generalize the existing simple definition to every carrier α and relational L:

```lean
classIso (K : Set (RelationalConfiguration L α)) : Setoid K :=
  Setoid.comap Subtype.val (isoSetoid L α)
```

Carry `[L.IsRelational]` in the intended signature. Update Convention 2, §0.1, plan 0.1 and the relevant API statements consistently; keep `BorelComplete` specialized to codes on ℕ. The bijection in §1.1 then gives a measurable equivalence between K and its image, and the two native isomorphism relations pull back correctly. Alternatively, state the arbitrary-carrier conclusion directly using these two native `Setoid.comap` expressions. Do not restrict the relabelling construction to ℕ or require an infinite carrier.

**Repair tested on the witness:** with no relation symbols, configurations on `Fin 0` form a singleton, and both corrected class relations have one class; the identity is a reduction both ways. With one nullary relation there are two configurations and two isomorphism classes, fixed individually; the two corrected relations are equality on two points. On `Fin 2` with one unary predicate, the swap sends `{0}` to `{1}` and preserves the three predicate-size classes. No new supplier or heavy construction is required: native `isoSetoid` already accepts arbitrary carriers at `TauCeti/ModelTheory/RelationalConfiguration/Isomorphism.lean:86`.

This is a design signature/domain defect established by reading the explicit types, not a claimed Lean elaboration failure.

## Verified sound

### Coverage and principles

Read the entire 1,198-line README, all 49 plan targets, their API entries and 97 Checks, and all 12 manifest entries. Rechecked the four repairs first, then the changed native interfaces, all 15 seeded subsections, the headline routes and the new finding. The earlier round's computed adversarial rows were used only for unchanged mathematics; no earlier “sound” summary was treated as a substitute for computations. A fresh finite back-and-forth calculation covered 5,144 interval comparisons, with zero mismatches.

The scope is a Part II extension. CountableStructureSpaces explicitly leaves graph/order Borel completeness outside its scope; this design imports its coding and separation infrastructure. The native implementation now supplies the implemented foundations directly. No computational algorithm is proposed as a roadmap deliverable, and no copied source passage, source-chapter layer title, route-specific prime restriction in a target, upward edge, cycle, sorry'd data or `set_option` was found. Mathematical definitions of coding maps are not computational-algorithm deliverables. The final targets retain countable relational languages in arbitrary universes, nullary symbols, function symbols through graph translation, and infinitely branching trees.

The layer order is explained by the mathematical requirements: completeness uses reductions between classes; graph completeness uses incidence and tag recognition; order/tree completeness uses graph completeness and unravelling; the characterisations use the universal action; non-Borelness uses ordinal comparison and uniform separation. The independent ordinal calculation is explicitly allowed to run separately. The design does not assert that it follows a source's exposition.

### Adversarial mathematics

T and F denote computed truth values. Sections below are README sections; parenthesized numbers identify plan targets where needed. These rows cover all sampled subsections, the headline theorems and the finding, with additional rows for the other constructions. The finite computations are independent checks of the stated recursion, not Lean proofs of the infinite theorems.

| Statement | Instances tried | Values computed on the two sides / invariants | Result; change |
| --- | --- | --- | --- |
| §0.1 restriction, unfolding and whole-space transport | Unary `K={∅,ℕ}`; `A={P={0}}` inside `|P|=1` | K has 2 classes and equality T exactly on the diagonal; A and its inclusion image each have 1 class. Restricting to univ retains all relation values. | Sound on the declared carrier; generalize its domain for R01. |
| §0.1 empty and constant reductions | Empty source; nonempty source into empty; infinite coinfinite predicates to one code | Reduction existence T, F, T respectively; the last iff is `T ↔ T` for every pair although the map collapses distinct codes. | Sound. |
| §0.2 set preimages, complements, composition | `0↦(0,0)`, positive n↦`(0,1)` | Diagonal preimage `{0}`; complement preimage `ℕ\{0}`; composition preimage `f⁻¹(g⁻¹B)=(g∘f)⁻¹B`. | Sound. |
| §0.2 empty/full target repair | `Unit→Empty`, `Empty→Empty`, `Unit→Unit` | Existence clauses F,T,T; empty-target reduction for A=∅ is F,T,T; full-target reduction for A=univ is F,T,T. For `Unit→Unit`, A=∅ cannot reduce to univ: F=F. | Repaired. |
| §0.2 set reduction versus relation reduction | `x=0^ω`, `y=10^ω`, `z=1^ω` | E₀(x,y)=T and E₀(x,z)=F; the two-valued set reduction sends these to diagonal/non-diagonal. A relation reduction to equality would assert smoothness, which is F. | Sound. |
| §0.2 analytic pullback | Measurable f after finer Polish topology; complement of WO | The refined preimage and original preimage have identical elements; the continuous identity maps one onto the other. A reduction of WOᶜ to a Borel diagonal would give Borel=T, whereas Borel(WOᶜ)=F. | Sound; return to the original topology by continuous image. |
| §1.1 relabelling direction and composition | Unary `{0}`; 3-cycle; noncommuting σ=(0 1), τ=(1 2) | Inverse-coordinate pullback sends `{0}→{1}→{2}` under the cycle; inverse sends `{1}→{0}`. `(τσ)(0)=2`, `(στ)(0)=1`, so the two composite actions differ correctly. | Native restriction matches the left-action convention. |
| §1.1 arbitrary-carrier class transport | `Fin 0`, no symbols or one nullary symbol; `Fin 2` unary | Intended source/target quotients have respectively 1/1, 2/2 and 3/3 classes. Existing `classIso` has no application at these types; generalized comaps do. | R01. |
| §1.2 completeness, transfer, renaming, universes | Empty class; unary class; countably many constant unary predicates; renamed adj | Empty target admits no map from a nonempty source. Constant-unary family has 𝔠 types versus ℵ₀ unary types. Renaming/small presentation preserves each corresponding atom bit and quotient. | Sound; countability of empty function-symbol sum is available. |
| §1.2 union/intersection | Complete graph class; intersect with empty-graph orbit | Inclusion into union is a reduction; intersection has exactly 1 type, so completeness F there. | Sound. |
| §1.3 function tables and action | One constant with value 3; swap (3 5); empty language | Table value 3→5 and unary graph `{3}→{5}`; empty language has one table/code. Both action formulas evaluate `σ(F(σ⁻¹v))`. | Sound. |
| §1.3 range topology and model classes | Constants n; two outputs at input 0; no output at 0; relational language | Singleton graphs `{n}` converge to ∅, whose totality is F. Two outputs give functionality F. Relational range=univ, closed T. In characteristic-2 example `1+1=0` is T in 𝔽₂(t), F in ℚ. | Sound Gδ/homeomorphism statement with functional qualification. |
| §2.1 incidence graph | One true binary tuple `(0,1)`, reversed tuple; nullary bit; empty language | Tuple degrees 3 versus 2; nullary truth-edge count 1 versus 0; empty-language edges 0. Colours 0/1/even≥2/odd≥3 separate all four sorts. | Iso iff and triangle-freeness sound. |
| §2.1 forgetting colours | Swap two unary symbol names, only one interpreted as `{0}` | Named structures not isomorphic (T/F predicate nonemptiness differs); uncoloured incidence graphs isomorphic by swapping their symbol sorts. | Discriminating negative control. |
| §2.2 clique tags | Edge with colours 0,1; empty graph; triangle input | Vertices 9, edges 12, triangle vertices 7; triangle-neighbour counts 2,3 recover colours 0,1. Empty input gives 0 vertices. Triangle input misclassifies 3 original vertices. | Sound precisely under triangle-freeness. |
| §2.3 graph completeness | Empty language; nullary-bit pair; asymmetric relation | Source types 1 and 2 respectively; tags retain the nullary distinction. Output loops 0 and symmetry T; ordered position colours retain asymmetric input. | Continuous coordinate construction and iso reflection sound. |
| §3.1 dense colouring | `3/4,5,−1/6,1/8008,1,2,1/2` | ν-values `2,0,1,3,0,0,1`; `1/8008<1/1000`. Reduced denominators have precisely the indicated powers of 2. | Sound; denominators are positive, so valuation-at-zero junk cannot occur. |
| §3.1 coloured Cantor theorem | Identity; colour swap 0↔1; negative/nonnegative wrong colouring | Identity preserves every ν-value. Swap sends colour(1/2)=1 to 0. Wrong colouring would send an initial segment to a non-initial segment, impossible. | Density supplies the finite-partial-map extension route. |
| §3.2 order and parent | `[0]<[0,5]`; `[1/2,3]`; root | `[0,4]` lies strictly between; parent `[1/2]` has length 1 versus child length 2; root length 0, no parent. `[]` is least, not an endpoint-free order. | Sound with nonempty-child condition. |
| §3.2 atomic colours and unravelling iff | Edge `{0,1}`; `[1/2,1]`, `[1,2]`; graph relabelling σ | Decoded tuples `(1,0)`, `(0,0)` give adjacency T,F and equality F,T. Entrywise π satisfies `a(πx)=σ(a(x))`; both equality and edge bits agree in the relabelled graph. | Parent extension yields both directions of the tuple system. |
| §3.3 linear-order class | ≤, <, universal relation, divisibility on ℕ | Reflexivity T,F,T,T; universal relation antisymmetry F at 0,1; divisibility totality F at 2,3. | Definition and negative controls sound. |
| §3.3 blocks and condensation | Colour c=0,1; ω-part versus finite part | Finite class sizes 2,3; infinite class size ℵ₀; an interval crossing ω to its finite tail has size ℵ₀. Recovered colour `(c+2)−2=c`. | No natural-subtraction junk; coloured order recovered. |
| §3.3 empty/complete graph repair | `[1,1/2]`, `[1,2]`, `[1,1/2,1]` | Vertex tuples `(0,1)`, `(0,0)`, `(0,1,0)`; empty/complete colours differ, agree, differ respectively. The first empty-graph colour occurs nowhere in the complete graph. | Repaired; distinction is presence of two unequal ν-values, not unequal rationals. |
| §3.3 continuous reduction/headline | A fixed comparison in two blocks | Its truth depends on the two finite atomic diagrams; changing all other edges changes 0 relevant bits. Iso of output preserves finite-class sizes and therefore input iso. | Sound fixed-carrier reduction and completeness. |
| §3.4 tree class | Chain, rooted star, reverse ℕ, finite reversed-prefix chains | Down-set sizes x+1, or 1/2, or ℵ₀ respectively. For fixed i<j, reversed-prefix chains eventually have j≤i=T, i≤j=F. | Borel and invariant, not closed. |
| §3.4 tree tags/headline | Colours 0,1; surplus leaves; original nodes | Tag heights 2,3; surplus leaves have height 1 and do not change maxima. Infinite ascending chain exists at originals, not tags. | Recognition and continuous graph-to-tree reduction sound. |
| §3.5 presentations/cover graph | Four-node prefix tree; full list tree; rooted ray and star | Finite cardinality 4 cannot equal ℵ₀. Marked ray root degrees 1 versus 2 distinguish marks at 0 and 1. Star root has infinite degree. | Infinite-tree qualification and root marking essential. |
| §3.5 cover map is not continuous | Insert vertex n strictly between 0 and 1 in a rooted star, n→∞ | Cover(0,1)=F at every stage, T in the star limit; each fixed order coordinate eventually agrees with the star. | Borel, not continuous, as stated. |
| §4.1 Borel S∞ spaces | Evaluation action on ℕ; trivial action; uncountable unary language | Orbit counts 1 and #X. In uncountable product, changing a coordinate outside a measurable event's countable support preserves that event but leaves a specified singleton; singleton measurable F. | Standard-Borel restriction discriminates correctly. |
| §4.1 equivariant injection | `f(y)=g•f(x)` | Right side=`f(g•x)`; injection gives `y=g•x`. Conversely equivariance gives related outputs. Image is invariant; Lusin–Souslin applies. | Both directions verified. |
| §4.2 anchors and one-point action | Evaluation action, arity 1; one point, arity 2 | `(1,0)` bit=T iff x=a; swap 0,1 changes marked vertex to 1. One-point bit=T on `(0,1)`, F on `(0,0)`; arity-0 tuple gives T for a full basis set. | Injective/equivariant anchored map; unanchored map is constant on the evaluation orbit. |
| §4.2 universal language/unpair map | m=0; m=1 with unpair(1)=(1,0); arbitrary pair(n,k) | m=0 reads source (0,0); m=1 reads source (0,1) independently of its argument. A unary predicate `{0}` is therefore outside the range at m=1. Recovering at pair(n,k) gives the original bit on the first k entries. | Continuous injective equivariant coding; not surjective, as required. |
| §4.2 universal embedding headline | Distinct x,y; stabilizers of initial segments | Identity makes every anchor test for x true at a basis set containing x; agreement would yield `g_k→1`, `g_k•y∈S_n`, hence y∈closure(S_n), contradicting its choice. | Separation proof and supplier realization match. |
| Layer 5 characterisations | graphClass; ∅; unary class; trivial Cantor action | Five truth values `(T,T,T,T,T)`, `(F,F,F,F,F)`, `(F,F,F,F,F)`; trivial-action orbit relation is Cantor equality. | All implications use actual reductions; arbitrary K allowed. |
| §6.1 interval equivalence | Finite orders of sizes 0…5, levels 0…3, tuples length 0…2 of matching atomic type | 5,144 comparisons: BF of tuples equals conjunction of BF of corresponding intervals, with 0 mismatches. Empty-tuple BF₂ classes are `{0},{1},{2},{3,4,5}`; at BF₃ all six sizes separate. | Fresh computed check of the native one-point recursion. |
| §6.1 equality-pattern guard | `(0,0)` versus `(0,1)` in ℤ | Corresponding open intervals have types ω*,0,ω on both sides; equality bit T versus F. Without atomic-type agreement interval iff fails. | Hypothesis retained; source error not imported. |
| §6.1 ordinal multiples | γ=0,1,2; zero coefficient control | BF₀=T; `ω≡₂ω·2` T; `ω≡₂ω+1` F (upper interval nonempty/empty); `ω²≡₂ω²·2` T with iso F. Empty/nonempty BF₁=F. | Nonzero coefficients necessary; weaker indexing than the source acknowledged. |
| §6.1 successor/sum route | Prefix `ω^γ μ+ρ`, μ=0 or μ>0 | Matching coefficient μ′=0 or 1 respectively, with remainder ρ on both sides; terminal intervals remain nonzero multiples. Equal summands give equal concatenated interval comparisons. | Induction supports the stated bound. |
| §6.2 non-Borel headline | Types `ω^(1+β)` and twice that ordinal | Iso=F, BF at 1+β=T, hence BFβ=T; hypothetical uniform separation asserts BFβ=F. Both types are countably infinite for β<ω₁. | Contradiction valid, including limit β. |
| §6.2 unbounded height and non-analytic non-isomorphism | Invariant Borel complete K; empty control | A uniform height bound would make iso Borel=T against F. Ambient complement of non-iso pairs is `(iso∩K²)∪(K²)ᶜ`; both analytic would again make iso Borel=T. Empty K: iso=∅, Borel T, completeness F. | Correct ambient square and hypotheses. |
| §6.3 E₀ code | `0^ω,10^ω,1^ω`; one-copy alternative | Finite flip `{0}` maps copies by symmetric difference, so code-iso T=E₀ T. Finite/cofinite P distinguishes 0^ω/1^ω, so F=F. One copy yields equality, failing on 0^ω/10^ω. | Continuous construction and rigidity sound. |
| §6.3 cardinality/non-smoothness | Complete K and the native E₀ antichain | Quotient injection gives `𝔠≤#(K/≅)`; coding-space bound gives `#(K/≅)≤𝔠`; equality follows. Smoothness would imply smooth(E₀)=T, whereas it is F. | Sound headline consequences. |
| §6.4 rank obstruction | ρ=0 on unary class; hypothetical graph reduction | Unary stratum iso Borel T, rank bound 0, completeness F. Graph image bound α forces pulled-back iso Borel T against F. | Stated implication sound; no invariance of rank assumed. |
| §6.5 lower order | Unary types `(size P,size complement)`; E₀; complete K | Unary quotient ℵ₀, E₀ quotient 𝔠; unary≤E₀ T, E₀≤unary F; complete≤E₀ F by Borel pullback. | Repaired directions and strict comparison sound. |

### Source sample and unverified locators

Read the five supplied legal cached texts at the locators below. All twelve works already have a single manifest entry; no source fetch or manifest edit was needed. The seven settled uncertified entries remain uncertified, not inferred from secondary references. Page numbers here identify the version actually read: printed draft pages for Montalbán, arXiv page numbers for the announcement/preprint, and journal pages for Camerlo–Gao.

| Seeded subsection | Locator checked against text | Support and limits |
| --- | --- | --- |
| 0.1 Isomorphism restricted to a class | paolini-shelah-tfab line 83, Definition 1.4, p.2; camerlo-gao-boolean line 106, p.493 | Reductions and restriction to classes. The arbitrary-subtype comap formulation is an explicit extension, justified directly; R01 concerns its carrier signature. |
| 1.1 Carrier relabelling | becker-kechris-bams line 159 through line 164, p.4 | Inverse permutation on arguments, with the permutation an isomorphism from old to new structure. Arbitrary-carrier bundling is the roadmap's own construction. |
| 1.2 Definition of Borel completeness | paolini-shelah-tfab line 95 through line 101, Definition 1.6, p.3; camerlo-gao-boolean line 106 through line 110, p.493 | Borel classes of countable structures. The roadmap explicitly extends the predicate to arbitrary target K; transfer and characterisation proofs justify the extension. |
| 1.3 Function symbols | camerlo-gao-boolean line 87 through line 93, p.492; paolini-shelah-tfab line 56 through line 64, p.2 | Standard Borel structure/model classes, including functional examples. The precise Gδ graph-image homeomorphism is independently specified and checked, not attributed verbatim to these lines. |
| 2.1 Incidence graph | montalban-cst1 line 4572 through line 4622, Theorem VI.27, pp.99–100 | Primary structure-to-graph coding route. The source's gadgets differ; the design says “own construction” and its sort/tuple/truth recovery works directly. |
| 2.2 Clique tags | montalban-cst1 line 4623 through line 4654, Theorem VI.27 proof, pp.100–101 | Flags/connectors separated by cycles, not the exact clique gadget. The stated own construction has the verified triangle-free recognition argument. |
| 3.1 Dense colouring | montalban-cst1 line 4258 through line 4260, p.91; line 4273 through line 4275, p.92 | Dense label fibres and coloured-order back-and-forth. The denominator colouring itself is independently defined and checked. |
| 3.2 Unravelling | montalban-cst1 line 4203 through line 4285, Lemma VI.18, pp.90–92 | Labelled tuple trees, infinite repetition and recovery of the parent from lengths/order. The roadmap uses its native tuple-system theorem instead of the source's category argument, and correctly retains the least list. |
| 3.3 Linear orders complete | montalban-cst1 line 4246 through line 4288, Lemma VI.18, pp.91–92; friedman-stanley-1989 §2 remains uncertified | Source replaces labels by finite blocks. The roadmap's ω+finite blocks keep a fixed carrier and have the independently verified condensation argument. |
| 3.4 Trees complete | montalban-cst1 line 4205 through line 4245, pp.90–91; friedman-stanley-1989 §2 remains uncertified | Labelled-tree reduction supports the route. The uncoloured tag heights are the roadmap's own construction; arbitrary branching is not replaced by binary branching. |
| 4.1 Borel S∞-spaces | becker-kechris-bams line 126 through line 131, §2, p.3; standard-Borel action setting at line 23 | Equivariant Borel injections have invariant Borel images. Joint measurability and standard Borelness match the consumed realization contract. |
| 4.2 Universal embedding | becker-kechris-bams line 132, Theorem 2.1, p.3; line 172 through line 177, Corollary 2.2, p.4; line 247 through line 268, p.6 | Universality for one relation symbol per arity is stated. Source sketch uses Effros spaces/trees; the anchored-open-set proof here is a valid alternative after the named Polish-realization input. |
| 6.1 Ordinal multiples | montalban-cst2 line 2322 through line 2331, Lemma II.37, pp.35–36; line 2337 through line 2425, Lemma II.38/Corollary II.39, pp.36–38 | Source uses one-sided finite-tuple levels, and first elements in II.38. The design acknowledges the different indexing and proves its weaker native one-point bound independently. Equality-pattern defect in II.37 is excluded here. |
| 6.2 Non-Borel isomorphism | paolini-shelah-tfab line 103 through line 106, Fact 1.7, p.3; montalban-cst2 line 8997 through line 9012, Theorem XI.3, p.207 | Source non-Borelness is for Borel classes. The roadmap's direct ordinal/uniform-separation proof handles arbitrary K. XI.3 supports the bounded-rank consequence; the native external-height implication comes from the explicit supplier. |
| 6.5 Lower reducibility order | gao-idst §§5.2,13.1 remains uncertified; plan additionally cites montalban-cst2 line 9046 through line 9054, p.208 | The readable passage supports non-Borelness/unbounded rank, not by itself the unary/E₀ comparison. The latter follows from the opened native quotient, smoothness and E₀ declarations. |

Also checked paolini-shelah-tfab Definition 1.2/Remark 1.5 at lines 70–91 for set reducibility; camerlo-gao-boolean lines 94–105 for the characterisations and E₀ route; its lines 257–281 for the binary-tree comparison. The source statements are not blindly promoted to more general native signatures. The source issues below are separated from design defects because the design's actual constructions avoid them.

### Pinned library audit

The content manifest pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`, matching the repaired plan. Paths in this table are relative to their respective library repositories. These are opened definitions/signatures, not names remembered from the previous round.

| Object | Declaration and location | Relevant contract checked |
| --- | --- | --- |
| Native carrier and atoms | `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:71`, `:75`, `:85` | `Atom` is the arity/symbol/tuple sum; `RelationalConfiguration` has body `Atom L V → Bool`. It contains no relationality, countability, nonemptiness or structure axioms. |
| Restriction and left action | Same file `:211`, `:219`, `:222`, `:228`, `:300`, `:309`, `:314` | `restrict`, identity/composition, measurability, `eval_perm_smul`, `instMulActionPerm`; source and target of restriction are contravariant in the vertex map. |
| Topology and cardinality | `TauCeti/ModelTheory/RelationalConfiguration/Topology.lean:35`, `:53`, `:64`, `:71`, `:89`, `:116` | Product topology, coordinate continuity, joint restriction continuity for discrete target carrier, clopen cylinders, and continuum bound. Polish/Borel instances require countable atoms. |
| Structure transport | `TauCeti/ModelTheory/RelationalConfiguration/Structure.lean:37`, `:93`, `:99`, `:111`, `:126` | `toStructure`, `encodeVia`, evaluation and isomorphic transport, composition. Relationality is needed for decoding; empty carriers are allowed. |
| Isomorphism and invariance | `TauCeti/ModelTheory/RelationalConfiguration/Isomorphism.lean:86`, `:95`, `:101`, `:135`, `:141`, `:150`, `:187`, `:227`, `:242` | `isoSetoid`, orbit equivalence, transport iff, analytic graph, invariant sets. `isoSetoid` is already carrier-polymorphic, supplying the repair in R01. |
| Language transport | `TauCeti/ModelTheory/RelationalConfiguration/LanguageMap.lean:186`, `:217`, `:227`, `:233`, `:240` | `onConfiguration` is a homeomorphism on every carrier; inverse/composition, measurability and iso iff exist. It transports symbols, not carriers. |
| Small presentations | `TauCeti/ModelTheory/Infinitary/SmallPresentation.lean:56`, `:72` | Small language and language equivalence; countability of both symbol sums required. For relational languages the function sum is empty. |
| Graph translation | `TauCeti/ModelTheory/Infinitary/GraphTranslation/Language.lean:72`, `:82`, `:230`; `Reconstruct.lean:161`, `:209`, `:248`, `:315` | `GraphRelation`, `graphLanguage`, graph expansion with output last, totality/functionality, reconstruction and round trip. Reconstruction's nonempty-carrier hypothesis is satisfied by ℕ. |
| Simple graphs | `TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:97`, `:120`, `:126`, `:205`, `:222`, `:267`, `:277` | Symmetry/irreflexivity, restriction, measurable class, encoding, measurable equivalence, range and embedding. These are cited rather than rebuilt as targets. |
| Permutation topology | `TauCeti/Topology/Algebra/Group/Perm.lean:42`, `:110`, `:143`, `:149` | Topology records forward/inverse functions; discrete carrier gives topological group and finite-stabilizer basis; countability gives Polishness. No measurable-space instance is supplied in this module. |
| Reductions and smoothness | `TauCeti/SetTheory/Descriptive/BorelReducibility.lean:100`, `:108`, `:115`, `:127`, `:135`, `:148`, `:159`, `:229`, `:247`, `:289` | Measurable-map iff, comap reduction, composition, quotient injection/cardinality, Borel pullback, smoothness and measurable countable classes. No standard-Borel hypothesis is silently needed for the general reduction definition. |
| E₀ | `TauCeti/SetTheory/Descriptive/EZero.lean:81`, `:96`, `:105`, `:214`, `:219`, `:238`, `:243` | Eventual equality, finite disagreement, Borel graph, non-smoothness, continuum quotient and Cantor equality reduction. |
| Back-and-forth | `TauCeti/ModelTheory/BackAndForth/Equivalence.lean:50`, `:63`, `:70`, `:89`, `:96`, `:210`; `DiscreteOrder.lean:86` | Atomic level zero; successor retains previous level and adds one element each way; limit/inter-level/isomorphism laws; order atomic type includes equality and comparisons. |
| Tuple systems/Scott height/models | `TauCeti/ModelTheory/BackAndForth/TupleSystem.lean:39`; `Presentation.lean:207`; `Countable.lean:99`; `TauCeti/ModelTheory/Scott/Height.lean:133`; `TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean:66` | Empty pair, atomic type, both extension directions; countable potential iso is iso; actual Scott-height and sentence-model carriers. |
| Graph and order language | `Mathlib/ModelTheory/Graph.lean:49`, `:72`; `Mathlib/ModelTheory/Order.lean:76`, `:163`, `:209` | Simple-graph axioms and model iff; order relation is non-strict ≤, and linear-order theory is the four required axioms. |
| Coloured-order proof input | `Mathlib/ModelTheory/PartialEquiv.lean:380`, `:499`; `Mathlib/ModelTheory/FinitelyGenerated.lean:278` | Both extension-pair directions and an initial finitely generated partial equivalence are required. Empty partial map supplies the latter; dense fibres give extensions. |
| Descriptive topology | `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:83`, `:331`, `:353`, `:366`, `:524`, `:836`; `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean:614` | Standard Borel means a compatible Polish topology, not nonemptiness; measurable refinement, analytic images, continuous analytic preimages, Suslin, Lusin–Souslin and measurable continuous actions have the needed separation/countability assumptions. |
| Subtypes, lists, trees and pairing | `Mathlib/Order/Setoid/Basic.lean:442`; `Mathlib/Data/List/Lex.lean:141`; `Mathlib/SetTheory/Descriptive/Tree.lean:32`; `Mathlib/Data/Nat/Pairing.lean:103`, `:108` | Comap really restricts the relation; list order is prefix-first; native trees are prefix-closed sets and may be empty; right unpair coordinate ≤ index. |

Object searches in the pins confirmed the new completeness constructions are not already implemented under another name. In particular, the arbitrary-carrier bundled restriction equivalence is distinct from the native language-equivalence homeomorphism. General Borel reducibility, E₀, graph translation and the native graph-class API have not been reassigned to this Part II.

### Roadmap ownership, overlaps and suppliers

Read the supplied package index and overlap leads before making ownership conclusions. Used the roadmap service's searches over main and its indexed open heads, and searched the board package READMEs, for set reducibility, Borel completeness, relabelling, universal actions, incidence graphs, dense colours, unravelling and ordinal multiples. Irrelevant incidence-graph and algebraic-Borel matches were excluded by object. No second owner of the new structure codings or universal S∞ embedding was found in the supplied accessible context.

The closest heads were opened: #1316 CountableStructureSpaces, #2012 CountableModelCounting, #1319 HanfNumbers, #1616 BorelEquivalenceRelations and #1615 InfinitaryModelExistence. Counting owns model-counting/complete-invariant questions; HanfNumbers owns EM/Hanf theory; BorelEquivalenceRelations owns general descriptive-set theory; InfinitaryModelExistence owns semantic graph translation. A “Borel complete invariant” in #2012 is an invariant classifying isomorphism, not Borel completeness of an equivalence relation. None reassigns this design's new constructions. Main versions of the latter three relevant existing roadmaps were also read, rather than using their revisions as suppliers.

Every cited roadmap section was resolved anew:

| Citation | Current file and line inspected | Resolution |
| --- | --- | --- |
| CountableStructureSpaces Layer 0 | #1316, `TauCetiRoadmap/CountableStructureSpaces/README.md:228`, `:264` | Closed range of simple-graph coding is explicitly retained. |
| CountableStructureSpaces §1.2 | #1316, `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:104`, `:113` | `eval_smul_atom` and joint continuity on the actual native carrier. The former is already proved at this head. |
| CountableStructureSpaces Layer 3 | Same file `:241` | `analytic_treeHeight_bounded`: analytic parameter set, closed node events, every tree well-founded, one bound below ω₁. |
| CountableStructureSpaces §§4.3–4.4 | Same file `:342`, `:402` | Borel isomorphism for a model class of bounded external Scott height; uniform BF separation of an analytic set of non-isomorphic ambient pairs. |
| CountableStructureSpaces Layer 5 | Same file `:496` | López–Escobar for invariant Borel classes of countable relational languages. |
| CountableStructureSpaces §6.2 and worked example 2 | Same file `:588`, `:595`; README `:686` | Codes of each countably infinite ordinal; analytic complement of WO; unary types counted by `(size P,size complement)`, each Borel, height ≤ω. |
| NoncompactQuantumSymmetry Layer 4, M1.BorelRealization | #1015, `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:161` | Jointly Borel action of a Polish group on standard Borel X admits a compatible Polish topology making the same action continuous. No local compactness or transitivity hypothesis. |
| BorelEquivalenceRelations §§5.1–5.4 | Main, `TauCetiRoadmap/BorelEquivalenceRelations/README.md:547`, `:557`, `:574`, `:583` | Ownership references exist; implemented results are consumed from the pin. Revision #1616 supplies no new dependency here. |
| InfinitaryLogic Layer 1 | Main, `Completed/InfinitaryLogic/Suggested.lean:191`, `:239`, `:249` | BF recursion and tuple-system ownership; native implementations now consumed. |
| InfinitaryModelExistence §0.3, Layer 6 | Main, `TauCetiRoadmap/InfinitaryModelExistence/README.md:219`, `:611`, `:630` | Small language and semantic graph translation ownership; pin supplies the consumed declarations. No dependency on revision #1615. |
| CountableModelCounting Layer 0 | Main, `TauCetiRoadmap/CountableModelCounting/README.md:318` | Language-presentation transport ownership; native `LEquiv.onConfiguration` is the consumed implementation. No dependency on revision #2012. |

The overlap report has no conflicting head changing this roadmap, dropped cited id, or revision-only cited id. Direct inspection found no additional drift at the resolved suppliers. No old→new numbering map is needed for this design, which removes no published target ids. All 21 `*Needs:*` lines and plan prerequisites were read. There are no declared gaps, forbidden suppliers, or unowned proof inputs beyond the local signature mismatch R01.

The required dependency check returned exactly:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 231 roadmaps, 2073 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Absence from the merge order is not a finding. `roadmaps resolve` reported no missing roadmap citations or Lean names, but explicitly did not check pinned Lake packages; the manual pin audit above supplies that missing evidence.

### Shape, headline coverage and package-stage checks

The required Summary, Scope and ownership, Conventions, Exact supplier contracts, build guide, layers, consumers and references are present. All seven layers have Examples and Dependencies. The 19 definitions/constructions have API descriptions and at least three associated Checks in the design/plan; the universal-language and unpair-map details are explicit in plan 4.2 and 4.4 and used in the README's embedding section. Three main roadmaps were read for shape comparison: BorelEquivalenceRelations, InfinitaryModelExistence and CountableModelCounting. No machine path, pull-request number, HTML anchor, LaTeX delimiter or hand-off narrative occurs in the reviewed README.

The headline list from the Summary and build is:

- Borel completeness of graphs, linear orders, trees and the rooted-graph presentation;
- continuous graph-to-linear-order reduction, with continuous graph/tree coding routes;
- the universal equivariant measurable S∞ embedding;
- the four equivalences expressing the five characterisations of Borel completeness;
- back-and-forth equivalence of nonzero ordinal multiples;
- non-Borel isomorphism, unbounded Scott height, and non-analytic non-isomorphism pairs for the stated classes;
- E₀ reducibility, continuum many isomorphism types and non-smoothness;
- the rank-bounded obstruction.

These can be stated on the actual pinned carriers using a few simple class predicates and language definitions. No heavy coding map needs an admitted data definition. Own backticked theorem/definition names in the README resolve to the plan's headline names or simple supporting predicates: `classIso`, `SetReducible`, `BorelComplete`, `graphClass`, `linearOrderClass`, `treeClass`, `universalLanguage`, and the explicitly named theorems in Layers 2–6. R01 is the domain mismatch among those intended interfaces.

There is **no `Suggested.lean` in this design package**. Consequently there are zero sorried declarations to one-tactic-probe, no declaration-binder `#check` comparison to run, and no actual import/module-docstring form to certify. Package-stage headline omissions, padding and mismatched Lean binders cannot be inferred from an absent design-stage file. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run; no passing build or “sorry only” warning claim is made.

## Not verifiable

- The seven settled uncertified texts: friedman-stanley-1989 (Theorem 1 and §§1–4), gao-idst (Chapters 3,5,13), becker-kechris-1996 (§§2.5–2.7,3.4), kechris-cdst, hjorth-2000, hjorth-kechris-1996 (§§4–5) and mekler-1981 (§2). This includes the author-flagged uncertain theorem/section numbering. Their legal full texts were not supplied; they were not requested again or guessed.
- Published-version numbering of paolini-shelah-tfab beyond the cached arXiv v6, explicitly flagged in the manifest. The v6 definitions and results were read. Montalbán's locators refer to the recorded drafts, and Becker–Kechris to the recorded announcement version.
- Source gadget figures were not reconstructed from scan images. The extracted construction text was read; this design specifies different gadgets whose recognition properties were checked directly.
- Lean elaboration, inferred binders and a package acceptance build: unavailable in this design lane, with no `Suggested.lean` present.
- Ownership beyond the supplied searchable open-head and board context was not asserted. No new missing-reference request or conditional supplier gap was created.

## Source issues

- **Misprint** in montalban-cst2 at XI.2 discussion, printed page 208 (line 9039): the source says the graph theorem has an unresolved Part 1 theorem number; it should be Part 1 Theorem VI.27; affects nothing.
- **Error** in camerlo-gao-boolean at rooted binary tree definition, printed page 496 (lines 257–263, 276): the source says a root, unique parents and at most two children suffice for sequence-tree representation; it should be required that principal down-sets are finite and linearly ordered; affects a stated result.
- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36 (lines 2322–2330): the source says corresponding open intervals suffice for arbitrary weakly increasing tuples; it should be required that the equality patterns also agree, or that tuples are strictly increasing; affects a stated result.
- **Error** in montalban-cst1 at Lemma VI.18 proof, printed page 91 (line 4254): the source says the lexicographically ordered finite rational sequences form a copy of ℚ; it should be a dense order with a least element under the prefix-first convention used by the parent formula; affects a stated result.
- **Error** in becker-kechris-bams at §2, arXiv page 4 (lines 159–160): the source says every nonempty countable relational language has Cantor coding space; it should require infinitely many relation queries, excluding languages with only finitely many nullary symbols; affects a stated result.
- **Error** in paolini-shelah-tfab at introduction item (iii), arXiv page 3 (line 127): the source says class-two exponent-p groups are Borel complete for prime p without qualification; it should exclude p=2, since exponent-two groups are abelian; affects a stated result.

Witnesses for the source-only errors: `1+ℤ` satisfies the displayed root/parent/child clauses but has infinite ancestor sets; `(0,0)` and `(0,1)` in ℤ have matching interval types but different equality patterns; `[]` is least in prefix-first list order; one nullary symbol gives exactly two codes; and exponent two gives `ab=(ab)⁻¹=b⁻¹a⁻¹=ba`. These source issues do not invalidate the roadmap's graph/order/tree constructions or its stated BF bound.
