# Review of CountableStructureSpacesPartII (design, round 2)

**Verdict:** needs changes

Four findings: two P1, one P2, one P3; three blocking. The ten previous repairs were applied. The main new blocker is supplier and library drift since that review. No design, plan or manifest was edited in this review. No source fetch was needed.

## Previous findings, checked first

Locations below are in `packages/CountableStructureSpacesPartII/design/README.md` unless stated otherwise. Each quoted fragment is the repaired author's text, not source text.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, non-closed range | repaired | Lines 423–424: “not closed when `L` has at least one function symbol and is the whole coding space when `L` is relational”. Plan 1.5 agrees. For a constant, singleton graphs tend to the empty graph; for a relational language the range is the whole space. |
| F02, condensation classes | repaired | Lines 654–657: “are the `ω`-parts of the blocks, which are infinite, and the final finite parts”. Within the ω-part, intervals are finite; crossing to the finite part gives an infinite interval. |
| F03, uncountable language | repaired | Lines 772–773: “every set measurable for a product σ-algebra depends on countably many coordinates, so no singleton is measurable”. Plan 4.1 agrees. Changing a coordinate outside a countable support preserves every supported event but leaves the singleton. This remains correct for the native coding space. |
| F04, Layer 5 shape | repaired | Lines 858–861 add “### Examples” and “`graphClass`, for which all five characterisations hold”. Empty and unary-predicate classes are also listed. There are now seven Examples and seven Dependencies headings. |
| F05, missing locators | repaired | Lines 342–344: “own construction; the relabelling form of the logic action is becker-kechris-bams lines 159–164”. Lines 513–516 cite “montalban-cst1 Theorem VI.27, lines 4623–4654”. Both passages were read; the latter supplies related flags, not these exact clique tags, as the README acknowledges. |
| F06, non-smoothness locator | repaired | Plan 6.7 now cites “lines 94–100 (E₀ below a Borel complete relation); BorelEquivalenceRelations §5.4 not_isSmooth_of_borelReducible_eZero”. The manifest moved 6.7 to camerlo-gao-boolean. The mathematics is correct; R01 updates the now-native supplier. |
| F07, binary trees | repaired | Lines 723–725: “the binary case, rooted binary trees as partial orders and as subtrees of `2^{<ℕ}`”. Plan 3.9 and 3.12 carry the qualification. The roadmap's general finite-down-set definition is its own, not attributed to that passage. See the separate source issue below. |
| F08, ordinal carrier | repaired | Line 146 uses “`Ordinal.ToType`”. It exists at the current pin in `Mathlib/SetTheory/Ordinal/Basic.lean:652`. |
| F09, closing motivation | repaired | The closing section is gone. Lines 65–75 place the algebraic-class scope and its locators under Scope and ownership; lines 1027–1036 give consumers. Nothing here depends on the unnamed consumer. |
| F10, analytic ambient space | repaired | Lines 931–932 say “not an analytic subset of `StructureSpace L × StructureSpace L`”. Plan 6.4 agrees. In that ambient square the complement is `(iso ∩ K²) ∪ (K²)ᶜ`; its analyticity gives the intended Suslin contradiction. R01 changes the carrier name, not this argument. |

The repaired patterns were searched throughout the README and plan: functional-symbol qualification, finite versus infinite condensation classes, product versus Borel σ-algebra, binary versus arbitrary branching, ambient versus subtype analyticity, and ordinal naming. No repeat of those mathematical defects was found. None of the prior findings was marked not actionable; no settled finding is re-raised.

## R01 (P1) — Supplier contracts use an obsolete coding API and ignore the pinned implementation

**Location:** `packages/CountableStructureSpacesPartII/design/README.md:152`, “Nothing. The pinned Tau Ceti has no descriptive set theory of countable structures”; lines 160–180 and 197–203; `packages/CountableStructureSpacesPartII/design/plan.json:6` and its supplier/prerequisite entries.

**Claim:** the coding carriers and named interfaces come from the base roadmap, with nothing supplied by Tau Ceti; the recorded baseline identifies the available libraries.

**Witness:** PR #1316, `TauCetiRoadmap/CountableStructureSpaces/README.md:134`, consumes `TauCeti.RelationalConfiguration`; `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:75` defines it at the pin. The head no longer supplies `StructureSpaceOn`, `RelQueryOn` or `structureIsoSetoid` as the cited interface.

**Exact repair:** update both design files to the actual pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Use `TauCeti.RelationalConfiguration L α`, its `Atom`, `atom`, `eval`, and `isoSetoid`; replace the old graph/action/model/back-and-forth names with the native declarations in the audit table below. Keep CountableStructureSpaces as supplier only for the remaining targets actually stated at #1316, such as uniform separation and López–Escobar. Use native `Setoid.BorelReducible`, `Setoid.IsSmooth` and `TauCeti.eZero` rather than importing their old roadmap definitions. Do not create replacement aliases solely to preserve the obsolete interface.

This also corrects duplication by object: §1.1's map is already `c.restrict e.symm`, with native composition, measurability, continuity and encoding compatibility. Cite these; retain only any genuinely new bundled homeomorphism/transport statement, explicitly identifying that difference. In §2.3 use `{c | c.IsSimpleGraph}` as the simple predicate needed for completeness and cite the existing measurable equivalence and range theorem rather than planning them again. Update ownership and `*Needs:*` lines accordingly. No supplier gap is needed: the missing old names have implemented replacements.

**Repair tested:** for the unary code of `{0}` and the cycle `0→1→2→0`, native `restrict σ⁻¹` evaluates true at 1 and false at 0, exactly the roadmap's convention. Native `isoSetoid_apply` says precisely that decoded structures are isomorphic. Native `Setoid.BorelReducible` has the same measurable-map/iff definition. Thus the migration preserves the claimed generality and examples; it is not a request to narrow the mathematics.

## R02 (P2) — Empty-target set reducibility needs existence of a map

**Location:** `packages/CountableStructureSpacesPartII/design/README.md:316`, “`A` is set reducible to `∅` exactly when `A = ∅`”; also `packages/CountableStructureSpacesPartII/design/plan.json:168`, target 0.4, `empty_and_univ_targets`.

**Claim:** the empty/full-set equivalences hold on arbitrary measurable spaces, including an empty codomain.

**Witness:** take `X = Unit`, `Y = Empty`. With `A = ∅`, the right side is true but no map `X → Y` exists. With `A = univ`, the full-target equivalence fails identically.

**Exact repair:** retain the general definition and state `SetReducible A (∅ : Set Y) ↔ A = ∅ ∧ (IsEmpty X ∨ Nonempty Y)` and `SetReducible A (univ : Set Y) ↔ A = univ ∧ (IsEmpty X ∨ Nonempty Y)`. Alternatively, give the simpler Checks explicitly under `Nonempty Y`, plus the empty-codomain negative control. Apply this to the plan as well.

**Repair tested:** `Unit → Empty` makes both corrected right sides false; `Empty → Empty` makes both true via the empty map; `Unit → Unit` gives the stated empty/full preimages via a constant measurable map. The definition itself needs no extra hypothesis.

## R03 (P1) — Distinct rationals need not represent distinct vertices

**Location:** `packages/CountableStructureSpacesPartII/design/README.md:670`, “their colours differ at every node of length 2 with distinct entries”.

**Claim:** the empty and complete graphs have different unravelling colours at every two-entry list of distinct rationals.

**Witness:** `x = [1,2]` has distinct rational entries but `ν(1)=ν(2)=0`. In both simple graphs the decoded tuple is `(0,0)`, equality is true and adjacency is false. Thus the colours are equal.

**Exact repair:** replace “with distinct entries” by “whose two entries have distinct ν-values”. Add `[1,2]` as the negative control and `[1,1/2]` as the separating example. Keep the non-isomorphism theorem and the plan's weaker, correct Check.

**Repair tested:** `[1,1/2]` decodes to `(0,1)`, giving adjacency false in the empty graph and true in the complete graph; injectivity of the atomic-diagram encoding gives different colours. `[1,2]` gives equal colours, in agreement with the existing §3.2 Check at line 618.

## R04 (P3) — Write the unary-predicate non-reduction in an unambiguous direction

**Location:** `packages/CountableStructureSpacesPartII/design/README.md:1015`, “The isomorphism relation of codes of one unary predicate does not reduce `eZero`”; `packages/CountableStructureSpacesPartII/design/plan.json:1856`, target 6.9.

**Claim:** the sentence places unary-predicate isomorphism in the source position of a non-reduction. The supplied cardinality argument instead forbids E₀ as source.

**Witness:** unary-predicate isomorphism is smooth by §6.5. Composing its reduction to Cantor equality with `TauCeti.borelReducible_bot_eZero` gives a reduction to E₀. Its quotient has ℵ₀ classes; E₀ has 𝔠.

**Exact repair:** write explicitly “E₀ is not Borel reducible to unary-predicate isomorphism; unary-predicate isomorphism is Borel reducible to E₀.” Use the same direction in the plan. This is a Check wording repair; the preceding main paragraph already has the intended strict order.

**Repair tested:** the first arrow would inject 𝔠 into ℵ₀, impossible. The other exists: Borel-label the countably many unary isomorphism types by `n`, then send label `n` to the periodic sequence `(0^n1)^ω`; different labels have different limiting densities of ones and are not eventually equal.

## Verified sound

### Scope, coverage and principles

Read all 49 plan targets, their APIs and 97 tests, and the entire 1,060-line README. Recomputed the changed passages, all 15 seeded targets, the headline routes and all findings' targets. For untouched material, the earlier table's explicit computations were usable evidence; no row merely saying “sound” was treated as proof. The finite interval calculation below additionally checked 1,275 cases. This is a design review, not a Lean acceptance build.

The scope is a genuine Part II: graph/linear-order/tree completeness and the universal S∞ embedding are outside the base's scope, and the general graph translation, Polish realization and Scott infrastructure are imported. No algorithm, copied source passage, route-specific prime restriction, dependency cycle, sorry'd datum or `set_option` was found in the reviewed design. The mathematical constructions include empty languages, nullary relations, function symbols, arbitrary countable languages and arbitrary branching. R01 is an interface/ownership repair within that scope, not a reason to reject the entire roadmap.

### Adversarial table

Truth values below are computations, not declarations of confidence. Target numbers in parentheses are plan identifiers when they differ from README section numbers. The table covers the sample, headline theorems, repairs and findings; API steps not repeated here were read and checked with the same witnesses.

| Statement | Instances tried | Values on the two sides / computed invariants | Result; change |
| --- | --- | --- | --- |
| §0.1 restriction and `classIso` | `K={∅,ℕ}` for one predicate; `A={P={0}} ⊆ {|P|=1}` | First quotient has 2 classes; second inclusion has 1 class on each side; `x≅y` and the pulled-back relation agree | Sound; native carrier update R01 |
| §0.1 empty and constant reductions | empty class; all infinite coinfinite predicates mapped to one code | Empty-source reduction=true; nonempty-to-empty=false; constant-map iff is `true↔true` on the one orbit | Sound |
| §0.2 set preimages and complements | `0↦(0,0)`, `n+1↦(0,1)` | Diagonal preimage=`{0}`; complementary preimage=`ℕ\{0}`; composition gives the iterated preimage | Sound |
| §0.2 empty/full Checks | `X=Unit,Y=Empty`, then `X=Y=Empty` | First: reduction=false but `A=∅` or `A=univ`=true; second: empty map exists and both iff sides=true | R02 |
| §0.2 Borel versus set reducibility | `x=0^ω`, `y=10^ω`, `z=1^ω` | `E₀(x,y)=true`, `E₀(x,z)=false`; two-valued set reduction produces diagonal/non-diagonal respectively; smoothness=false | Sound counterexample to converse |
| §0.2 analytic pullback | continuous identity after Polish refinement; non-Borel analytic complement of WO | Refined preimage maps identically onto the original preimage; a hypothetical reduction to a Borel diagonal gives Borel=true against Borel=false | Sound, uses continuous image back to original topology |
| §1.1 relabelling and convention | 3-cycle; transposition; empty carrier | `{0}→{1}→{2}` under the cycle, inverse sends `{1}→{0}`; no nullary queries gives 1 code on `Fin 0`, one nullary query gives 2 fixed codes | Sound map, already implemented as restriction; R01 |
| §1.2 completeness | empty K; countably many fixed unary predicates; intersection with empty-graph orbit | Map from nonempty class into empty K=false; source quotient=𝔠 versus unary quotient=ℵ₀; intersection quotient=1 | Correct obstructions; transfer uses inclusion |
| §1.2 universes/renaming | unary symbol renamed or replaced by its small presentation | Same bits at corresponding queries; number of isomorphism classes stays 𝔠 for the fixed-bit family | Sound; source-language universe does not alter completeness |
| §1.3 functional action | one constant `k=3`, permutation `(3 5)` | New value=5; graph relation changes `{3}→{5}`; both equivariance expressions test `σ(F(σ⁻¹v))=y` | Sound, matches left action |
| §1.3 graph range, repaired F01 | `k=n`; no function symbols; graph with two outputs | Coordinate limit of `{n}`=empty, totality=false; relational range=univ, closed=true; two outputs gives functionality=false | Correct qualification; Gδ is `⋂inputs ⋃outputs` plus closed uniqueness |
| §1.3 model classes | graph theory; characteristic-2 field theory | Graph axioms give symmetry=true and loops=false; `𝔽₂(t)` has `1+1=0`, `ℚ` does not | Sound; countable syntax makes the theory intersection countable |
| §2.1 incidence coding | one binary true tuple; reversed tuple; nullary bit; empty language | Tuple degrees=3 and 2; nullary truth edge=1 or 0; empty language gives only isolated points | Sound; colour 0 recovers carrier, odd tuple colours recover symbols, even colours positions |
| §2.2 clique tags | edge with colours 0,1; empty V; input triangle | 9 vertices, 12 edges, 7 triangle vertices; colour recovery counts 2,3; empty gives 0; input triangle gives 3 incorrectly recognised original vertices | Sound precisely with triangle-freeness |
| §2.3 graph completeness | empty language; two nullary codes; asymmetric relation | Source has 1 type, or 2 nullary types distinguished by a truth edge; arbitrary asymmetry remains encoded in ordered tuple colours; output loops=0 and symmetry=true | Continuous coding preserves and reflects iso; range API must be cited from pin (R01) |
| §3.1 dense colouring | `3/4,5,−1/6,1/8008`; colour swap | ν-values=`2,0,1,3`; `1/8008<1/1000`; swapping 0,1 sends colour of `1/2` from 1 to 0 | Sound; odd numerators over arbitrarily large odd multiples of `2^m` give every fibre density |
| §3.1 wrong colouring | negative/nonnegative with colour swap | Image of negative rationals under increasing bijection is an initial segment; nonnegative rationals are not one | Automorphism=false, so density hypothesis discriminates |
| §3.2 parent and density | `[0]<[0,5]`; `[1/2,3]`; root | `[0,4]` is intermediate; parent=`[1/2]`, length drops `2→1`; root has length 0 and no parent | Sound; natural subtraction is only used for nonempty lists |
| §3.2 unravelling iff | edge `{0,1}`, tuples `[1/2,1]`, `[1,2]`; entrywise π | Decoded tuples=`(1,0)` and `(0,0)`; adjacency=true,false. `a(map π x)=σ(a(x))`; equality/adjacency bits match | Sound; child extensions give both directions of tuple system |
| §3.3 finite condensation, repaired F02 | block colour c; two distinct blocks | Infinite class size=ℵ₀; finite class size=`c+2`; cross-class intervals infinite; finite class determines `c=(c+2)−2` | Sound; c+2≥2 prevents natural-subtraction junk |
| §3.3 separating Check | empty/complete graphs at `[1,2]` and `[1,1/2]` | First pair: colours equal because tuple=`(0,0)` in both; second pair: adjacency bits=0 and 1 | R03; non-isomorphism theorem remains sound |
| §3.3 linear-order completeness | natural ≤, strict <, divisibility; block coding | Reflexivity=true,false,true respectively; divisibility fails totality at 2,3; finite-class sizes recover the labelled order | Sound continuous reduction and class definition |
| §3.4 tree definition | chain ℕ; rooted star; reverse ℕ; finite reversals `c_n` | Down-set sizes in chain=`x+1`; star=1 at root,2 elsewhere; reverse order=ℵ₀. For fixed i<j, eventually j≤i in `c_n` | Borel, invariant and nonclosed as claimed |
| §3.4 tree tags/completeness | colours 0,1; surplus leaves; original root | Tag heights=2,3; surplus leaves have height 1 and do not increase maxima; originals have infinite ascending chains, tag nodes do not | Sound recognition and continuous coding |
| §3.5 tree presentations, repaired F07 | four-node tree; full lists; chain/ray with root moved | Finite size=4 cannot biject ℕ; full lists countably infinite; root degree on end-marked ray=1 versus inner-marked ray=2 | Sound; general rooted trees are not being identified with binary trees |
| §4.1 Borel S∞ spaces | evaluation on ℕ; trivial action; uncountable unary language | Orbit counts=1 and `#X`; singleton in uncountable product depends on uncountably many coordinates, measurable=false | Sound, including repaired F03 |
| §4.1 invariant image/reduction | equivariant injection f; `f(y)=g•f(x)` | Equivariance gives `f(y)=f(g•x)`; injectivity gives `y=g•x`; image invariant=true | Sound; standard Borel hypotheses enable Lusin–Souslin |
| §4.2 anchored embedding | evaluation action at x=a and x≠a; one-point space | `(1,0)` coordinate=true iff x=a; for one-point space coordinate=true iff tuple injective; repeated tuple=false | Sound; unanchored map constant on the transitive ℕ orbit |
| §4.2 direction and pairing | action h; `m=Nat.pair n k`; m=0 | Substitution `g'=gh` sends anchor a to `h⁻¹a`; recovered symbol=`(k,n)` on first k entries; unpair 0=`(0,0)` | Sound; `k≤m` prevents out-of-range coordinates |
| Layer 5 characterisations | graphClass; empty K; unary K; trivial Cantor action | Five truth values=`(T,T,T,T,T)`, `(F,F,F,F,F)`, `(F,F,F,F,F)` respectively; trivial-action orbits are individual reals | Sound equivalences; K need not be invariant/Borel for their statements |
| §6.1 interval and sum laws | finite orders sizes 0…4, levels 0…2, tuples length 0…2 of same atomic type | 1,275 comparisons give identical left/right truth values. Empty-tuple BF₁ classes are `{0}`, `{1,2,3,4}`; BF₂ classes are `{0}`, `{1}`, `{2}`, `{3,4}` | Sound finite computation, plus successor/limit interval induction |
| §6.1 ordinal multiples | γ=0; γ=1; γ=2; δ=0 negative control | BF₀=true; `ω≡₂ω·2`=true; `ω≡₂ω+1`=false (upper interval nonempty versus empty); `ω²≡₂ω²·2`=true while iso=false; empty/nonempty BF₁=false | Sound; nonzero coefficients essential |
| §6.1 successor proof | prefix `ω^γ·μ+ρ`, `ρ<ω^γ` | Matching coefficient μ′=0 if μ=0, otherwise 1; prefix remainders both ρ; both tails nonzero multiples of `ω^(γ+1)` | Interval/sum induction matches both sides; limit factorisation retains nonzero multiples |
| §6.2 non-Borel headline | β from uniform separation; types `ω^(1+β)`, `ω^(1+β)·2` | Types unequal, hence iso=false; BF at `1+β` and then β=true; assumed uniform separation would give BFβ=false | Sound contradiction, after carrier migration |
| §6.2 consequences, repaired F10 | invariant Borel K; K=univ; K=empty control | Ambient complement=`(iso∩K²)∪(K²)ᶜ`; if both analytic, Borel=true, contradicting headline Borel=false. Empty K has iso=empty, Borel=true and completeness=false | Sound; bounded Scott height would likewise give Borel=true |
| §6.3 E₀ coding | `0^ω,10^ω,1^ω`; single-copy control | First pair: flip sets differ by `{0}`, so code-iso=true and E₀=true. Last pair: finite versus cofinite P in each component, code-iso=false and E₀=false | Sound continuous reduction; one copy alone gives equality, not E₀ |
| §6.3 cardinality and non-smoothness | complete K; Cantor antichain in E₀ | Injection gives `𝔠≤#(K/≅)`; code space gives upper bound `≤𝔠`; hence equality. Smoothness would make E₀ smooth=false | Sound headline consequences using native reducibility API |
| §6.4 obstruction | ρ=0 on unary class; empty K; assumed reduction from graphs | Unary rank bound=0 and iso Borel=true; empty image rank condition vacuous; graph-image bound α makes pulled-back iso Borel=true against §6.2=false | Sound stated implication; it requires no rank invariance or measurable rank map |
| §6.5 comparison | unary types indexed by (size P,size complement), including ∞ | Unary quotient=ℵ₀; E₀ quotient=𝔠; unary≤E₀=true by periodic coding, E₀≤unary=false; complete≤E₀=false by Borel pullback | Main comparison sound; make Check direction explicit (R04) |

The ordinal statement is deliberately compared with the supplier's one-point successor recursion, not identified with Montalbán's finite-tuple, one-sided levels. The source computes a sharper, differently indexed relation. Both the interval argument and the weak bound actually used here were checked independently.

### Source sample and manifest

All five cached works were read at the following locators. Pages are the printed pages of the version read (the arXiv announcements/preprints have their own pagination); no equality with the final published numbering was assumed. All 12 works have one manifest key; seven are settled uncertified. No source text was copied into the repository.

| Seeded target | Text read, page and support |
| --- | --- |
| 0.1 Isomorphism restricted to a class | paolini-shelah-tfab line 83, Definition 1.4, p.2; camerlo-gao-boolean line 106, pp.492–493. Definitions of reductions and invariant Borel classes agree. Pullback to arbitrary subtypes is the roadmap's explicit extension. |
| 0.2 Set reducibility/comparison | paolini-shelah-tfab line 70, Definition 1.2, p.2, and line 88, Remark 1.5. Source explicitly says the converse need not hold (the earlier review's word “open” was inaccurate). General measurable spaces extend its standard Borel setting; R02 handles emptiness. |
| 1.1 Carrier relabelling | becker-kechris-bams line 159 through line 164, p.4. The inverse permutation and isomorphism orientation agree. Arbitrary carrier bijections are an extension, now native at the pin. |
| 1.2 Borel completeness | paolini-shelah-tfab line 95, Definition 1.6, p.3; camerlo-gao-boolean line 106, p.493. Their targets are Borel classes. The roadmap explicitly separates its unrestricted predicate from the hypotheses needed for consequences; its transfer/characterisation proofs justify that extension. |
| 1.3 Function symbols | camerlo-gao-boolean line 87, p.492; paolini-shelah-tfab line 60, p.2. These support the standard Borel class claims, not the detailed homeomorphism. That construction was checked directly: totality Gδ, uniqueness closed, each table coordinate locally recoverable. |
| 2.2 Clique tags | montalban-cst1 line 4623 through line 4654, Theorem VI.27 proof, pp.100–101. Flags/connectors separate sorts by cycles; the roadmap correctly labels its different clique construction as its own. |
| 2.3 Graph completeness | montalban-cst1 line 4572, Theorem VI.27, pp.99–101 supplies the primary graph-encoding proof route; camerlo-gao-boolean line 111, p.493 and paolini-shelah-tfab line 125, p.3 state the classical result. Friedman–Stanley Theorem 1 remains uncertified. |
| 3.1 Dense colouring | montalban-cst1 line 4258 through line 4260, p.91, and line 4273 through line 4275, p.92: dense colour fibres and coloured-order isomorphism. The particular denominator colouring is the roadmap's construction and was computed directly. |
| 3.3 Linear-order completeness | montalban-cst1 line 4203, Lemma VI.18, pp.90–92; especially line 4286 through line 4288. Source replaces labelled points by finite orders. The roadmap's ω+finite blocks retain a fixed carrier and were checked independently. Friedman–Stanley §2 remains uncertified. |
| 3.4 Tree completeness | montalban-cst1 line 4205 through line 4245, pp.90–91 gives labelled tuple trees and infinite repetition, not the exact uncoloured tags; the latter were checked above. paolini-shelah-tfab line 125, p.3 and camerlo-gao-boolean line 113, p.493 state the tree result. Friedman–Stanley §2 remains uncertified. |
| 4.1 Borel S∞ spaces | becker-kechris-bams line 126 through line 131, §2 p.3 gives equivariant Borel embeddings and invariant Borel images; its Borel-action setting (lines 23–27) requires standard Borel spaces. The native joint-measurability signature matches. |
| 4.2 Universal embedding | becker-kechris-bams line 132, Theorem 2.1 p.3; line 172 through line 177, Corollary 2.2 p.4; line 247 through line 268, p.6. One symbol per arity is stated. The supplied sketch uses Effros spaces/trees; the roadmap's anchored-open-set proof is a different route, verified above using the explicit realization supplier. |
| 6.1 Ordinal multiples | montalban-cst2 line 2322, Lemma II.37 pp.35–36; line 2337, Lemma II.38 pp.36–38; line 2424, Corollary II.39 p.38. Source uses one-sided finite-tuple relations and first-element hypotheses, not the roadmap's identical BF index. The roadmap says so and provides its own induction. |
| 6.3 E₀ and continuum | camerlo-gao-boolean line 94 through line 105, pp.492–493 gives universality for closed-subgroup orbit relations. It does not spell out the successor-copy reduction; that construction's rigidity and flip-set bijection were checked directly. Native EZero results supply the cardinal/smoothness consequences. |
| 6.5 Lower reducibility order | montalban-cst2 line 9046 through line 9054, p.208 supports non-Borelness/unbounded rank of complete classes. It does not prove the unary/E₀ comparison by itself; the explicitly cited reducibility supplier supplies that part. gao-idst §§5.2,13.1 remain uncertified. |

Also read the changed scope citations: camerlo-gao-boolean line 405 (Theorem 1, p.499, atomic Boolean algebras), line 555 (p.502, all Boolean algebras); paolini-shelah-tfab line 169 (Main Theorem, p.4); montalban-cst2 line 8946 (Lemma XI.2, pp.205–206) and line 8997 (Theorem XI.3, p.207). They support the stated motivation/consequences. The rank obstruction's Friedman–Stanley/Hjorth–Kechris locators remain uncertified; its displayed implication has the independent proof in the adversarial table.

### Current supplier and duplication audit

The content manifest and the two library checkout HEADs agree on Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The plan still records `f6090c70` and `358314d4`. Thus the previous review's library-absence claims cannot be inherited. The following native declarations were opened; paths are repository-relative inside the named library.

| Object consumed/planned | Current declaration and inspected locator | Meaning relevant to the review |
| --- | --- | --- |
| Coding carrier/queries | `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:71`, `:75`, `:85` | `Atom` is an arity, relation symbol and tuple; `RelationalConfiguration` is the Bool-valued function type synonym; `atom` constructs queries. No relationality/countability is built into the carrier. |
| Relabelling | Same file `:211` (`restrict`), `:219` (`restrict_id`), `:222` (`restrict_comp`), `:228` (`measurable_restrict`); `Topology.lean:64` (`continuous_restrict`) | Restriction along `e.symm` is exactly §1.1's map, at every carrier/language. A bundled homeomorphism can reuse these laws. |
| Decoding/transport | `TauCeti/ModelTheory/RelationalConfiguration/Structure.lean:37`, `:93`, `:111`, `:126` | `toStructure`, `Equiv.encodeVia`, `Equiv.nonempty_equiv_encodeVia`, `Equiv.encodeVia_trans`; isomorphism requires relationality. |
| Logic action | `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:300`, `:309`, `:314` | `instSMulPerm`, `eval_perm_smul`, `instMulActionPerm`; inverse on arguments gives the intended left action. |
| Isomorphism | `TauCeti/ModelTheory/RelationalConfiguration/Isomorphism.lean:86`, `:95`, `:141`, `:187`, `:227` | `isoSetoid`, `isoSetoid_apply`, `isoSetoid_eq_orbitRel`, `analyticSet_setOf_isoSetoid`, `IsomorphismInvariant`. |
| S∞ topology | `TauCeti/Topology/Algebra/Group/Perm.lean:42`, `:110`, `:143`, `:149` | `Equiv.Perm.instTopologicalSpace`, `instIsTopologicalGroup`, `instPolishSpace`, `hasBasis_nhds_one_fixingSubgroup`; discrete carrier, and countability for Polishness. |
| Graph class/coding | `TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:97`, `:126`, `:205`, `:222`, `:267`, `:277` | `IsSimpleGraph`, measurable membership, `SimpleGraph.toRelationalConfiguration`, `relationalConfigurationEquiv`, range theorem and measurable embedding. These are already the graph class/range objects, not merely similarly named lemmas. |
| Reducibility/smoothness | `TauCeti/SetTheory/Descriptive/BorelReducibility.lean:100`, `:115`, `:127`, `:135`, `:159`, `:229`, `:253`, `:289` | `Setoid.BorelReducible`, `borelReducible_comap`, transitivity, quotient injection, measurable-graph pullback, `IsSmooth`, countable separation and `isSmooth_of_countable_quotient`. Last theorem needs measurable classes, not a stronger standard-Borel assumption. |
| E₀ | `TauCeti/SetTheory/Descriptive/EZero.lean:81`, `:105`, `:214`, `:219`, `:238`, `:243` | `TauCeti.eZero`, `measurableSet_eZero`, `not_isSmooth_eZero`, `not_isSmooth_of_borelReducible_eZero`, `mk_quotient_eZero`, `borelReducible_bot_eZero`. |
| BF recursion and tuple systems | `TauCeti/ModelTheory/BackAndForth/Equivalence.lean:70`, `:96`; `TupleSystem.lean:39`; `Presentation.lean:207`; `AllLevels.lean:91` | Successor retains previous level; native monotonicity is `BFEquiv.mono`; `IsTupleBFSystem`, `potentialIso_iff_exists_isTupleBFSystem`, `potentialIso_iff_bfEquiv_all` are implemented. |
| Mathlib graph/order languages | `Mathlib/ModelTheory/Graph.lean:49`, `:72`; `Mathlib/ModelTheory/Order.lean:76`, `:163`, `:209` | Graph language, graph axiom iff, order language/theory and `orderStructure`; last uses ≤, not <. |
| Coloured Cantor route | `Mathlib/ModelTheory/PartialEquiv.lean:380`, `:499`; `FinitelyGenerated.lean:278`; `Mathlib/Order/CountableDenseLinearOrder.lean:246` | Global extension pairs and an initial FGEquiv are required; empty partial isomorphism supplies the latter here. Uncoloured Cantor alone does not preserve colours. |
| Measurable action/standard Borel | `Mathlib/MeasureTheory/Group/Arithmetic.lean:463`; `Constructions/BorelSpace/Basic.lean:614`, `:656`; `Constructions/Polish/Basic.lean:83` | Joint action measurable; continuous action requires second countability and Borel structure; StandardBorelSpace supplies a compatible Polish topology, not nonemptiness. |
| Analytic/Lusin–Souslin route | `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:186`, `:331`, `:353`, `:366`, `:524`, `:836` | Empty analytic sets allowed; measurable maps refine continuously; measurable images analytic with second-countable range; analytic preimages require continuous maps; Suslin uses a common ambient space; measurable injective images require countable separation. |
| Subtypes/products | `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:192`, `:223`, `:420`; `Mathlib/Order/Setoid/Basic.lean:442` (`Setoid.comap`) | Arbitrary subtype inclusion is measurable; corestriction and `Prod.map` preserve measurability. No Borel-subset assumption is needed for inclusion itself. |
| Field and valuation Checks | `Mathlib/ModelTheory/Algebra/Ring/Basic.lean:59`; `Field/Basic.lean:80`; `Field/CharP.lean:47`; `Mathlib/Data/Nat/PadicValNat.lean:21`; `Mathlib/Algebra/Group/Action/End.lean:84` | Ring language, field/characteristic theories, natural valuation and evaluation action exist. `padicValNat` defaults to zero at denominator zero, but rational denominators are positive; that junk case cannot enter ν. |
| Lists, trees, ordinals, pairing | `Mathlib/Data/List/Lex.lean:141`; `Mathlib/SetTheory/Descriptive/Tree.lean:32`; `Mathlib/SetTheory/Ordinal/Basic.lean:652`, `:762`; `Mathlib/Data/Nat/Pairing.lean:103`, `:108`; `Mathlib/Logic/Encodable/Basic.lean:387` | Prefix-first list order; prefix-closed sets of lists (empty tree allowed); `Ordinal.ToType`, ω; `unpair` right coordinate≤index; countable encodings. |

Cross-roadmap citations were re-resolved, not inferred from the earlier review:

- **CountableStructureSpaces**, new-roadmap PR #1316: `TauCetiRoadmap/CountableStructureSpaces/Suggested.lean:113` gives joint continuity on the native carrier; `:241` tree-height boundedness with each node condition closed; `:342` measurable isomorphism under bounded Scott height on `modelsOf φ`; `:402` uniform BF separation of an analytic ambient set of non-isomorphic pairs; `:496` López–Escobar; `:588` well-order codes of types `ω≤β<ω₁`. These surviving theorem contracts are appropriate. The old carrier/action names are not, as R01 records. Its README `:753` excludes Borel completeness of graphs/linear orders.
- **BorelEquivalenceRelations on main**, `TauCetiRoadmap/BorelEquivalenceRelations/Suggested.lean:94`, `:178`, `:468`, `:480`, `:489`, `:510`, `:528`, `:533`: all cited sections and old signatures can be located. Their existence does not supersede the now-implemented Tau Ceti declarations. Its scope remains general descriptive set theory, not structure codings. The revision #1616 does not become a supplier merely by updating this material.
- **InfinitaryLogic on main**, `Completed/InfinitaryLogic/Suggested.lean:191`, `:218`, `:239`, `:249`, `:275`, `:305`: the earlier BF and tuple-system contracts are present and agree mathematically with the used one-point recursion. R01 redirects implemented objects to Tau Ceti.
- **InfinitaryModelExistence on main**, `TauCetiRoadmap/InfinitaryModelExistence/README.md:219` and `:611`–`:635`: small presentations and their equivalences, graph symbols, expansions, total-function axioms and reconstruction are supplied. Taking the set of function symbols to be all of them on ℕ matches §1.3. Its revision #1615 is not needed as a dependency.
- **CountableModelCounting on main**, `TauCetiRoadmap/CountableModelCounting/README.md:318`–`:324`: transport along a language equivalence supplies the promised homeomorphism and model/isomorphism compatibility. It does not own arbitrary-carrier graph codings. Its revision #2012's model-counting scope was also compared.
- **NoncompactQuantumSymmetry**, PR #1015: `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1329`, M1.BorelRealization, and `Suggested.lean:161`: exactly the jointly measurable action of a Polish group on a standard Borel space, with a compatible Polish topology making that action continuous. No local compactness or pre-existing topology on X is required. The open head still owns this input.

The package index was read before ownership conclusions. The board search, current pinned sources, main roadmaps and the supplied open-head search were queried by objects: set reducibility, Borel completeness, graph incidence/clique tags, dense colourings, unravelling, ordinal multiples, universal S∞ spaces and measurable actions. The native overlaps are recorded above. Other matches concerned unrelated incidence graphs, homotopy-theoretic Borel completeness or cohomology classes called `graphClass`. The closest heads (#1316, #2012, #1616, #1319 HanfNumbers, #1615) were compared: HanfNumbers owns EM/Hanf theory, model counting owns Morley/Vaught theory, and the other supplier divisions are as stated. No second owner of the new completeness codings or universal S∞ embedding was found in the supplied searchable context. This is not a claim about unprovided pull requests.

The provided overlap report lists no conflicting change to this roadmap, dropped section id or revision-only section id. No new deletion/renumbering is proposed by this review. R01 is declaration-level drift visible on direct inspection of #1316, despite the section-level overlap report being empty. `roadmaps resolve` also reports no missing names, but says it did not check pinned Lake packages; its output is not evidence that these old names are valid at the stated owner.

### Supplier order

All 21 `*Needs:*` lines and the plan prerequisites were read. Layer arrows run from lower layers to higher ones; §6.1 uses only BF/order infrastructure. No declared gaps (`gaps=[]`), forbidden supplier, unowned mathematical proof input, upward edge or cycle was identified apart from the obsolete supplied declarations in R01. The dependency command produced:

```
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2037 edges, 0 problem(s)
```

The absence from the order is not a finding. Passing this graph check does not validate declaration signatures.

### Shape, headline signatures and padding

The design has the requested Summary, Scope and ownership, Conventions, Exact supplier contracts, build guide, seven layers, consumers and references. Seven layers have both Examples and Dependencies. Definitions/constructions have prose APIs and at least three associated Checks across the README subsection and its plan entry; the bad Checks are isolated above. The repaired Examples paragraph and scope relocation preserve the required shape. No machine path, pull-request number, HTML anchor, LaTeX delimiter or hand-off narrative was found in the design README. Three main roadmaps were read for comparison: BorelEquivalenceRelations, InfinitaryModelExistence and CountableModelCounting.

The headline list is: graph, linear-order and tree Borel completeness; the continuous graph-to-order reduction and universal equivariant measurable embedding; the four equivalences expressing Layer 5's five characterisations; the ordinal BF computation; non-Borel isomorphism, unbounded Scott height and non-analytic non-isomorphism pairs; E₀ reducibility, continuum many types and non-smoothness; and the rank-bounded obstruction. All can be stated on the actual pinned carriers with simple class/predicate definitions. In particular, native RelationalConfiguration, BFEquiv and BorelReducible remove the need to reproduce the former supplier encodings. The heavy coding constructions belong in the README, not as admitted data in a Lean acceptance file.

There is **no `Suggested.lean` in this design package**. Therefore declaration-binder `#check`, Lean/README signature matching, import/docstring form and the one-tactic padding probe have **zero declarations to inspect**; absence is not a design-stage finding. No package-stage missing-headline or padding claim is made. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, and no claim of a passing build or “sorry only” warnings is made.

## Not verifiable

- Seven manifest entries remain settled uncertified: friedman-stanley-1989 (Theorem 1 and §§1–4), gao-idst (Chapters 3,5,13), becker-kechris-1996 (§§2.5–2.7,3.4), kechris-cdst, hjorth-2000, hjorth-kechris-1996 (§§4–5), and mekler-1981 (§2). Their texts/theorem numbering were not guessed or requested again. This includes every flagged unverified locator in those entries.
- The final published numbering of paolini-shelah-tfab was not certified: the cached v6 preprint and its own numbered definitions/theorem were checked. Montalbán locators refer to the recorded dated drafts, not a later published edition. Becker–Kechris announcement page references above refer to the cached arXiv version.
- Source figures for the graph gadgets were not reconstructed from images; their extracted explanations and the roadmap's independently specified gadgets were read. The proof of the actual clique gadget was checked directly.
- Lean elaboration and elaborated implicit binders are unavailable in this lane. No `Suggested.lean` exists to probe.
- Ownership outside the supplied open-roadmap index and accessible board context was not checked. No missing-reference request or conditional supplier gap was created.

## Source issues

- **Misprint** in montalban-cst2 at XI.2 discussion, printed page 208 (line 9039): the source says the graph theorem has an unresolved Part 1 theorem number; it should be Part 1 Theorem VI.27; affects nothing.
- **Error** in camerlo-gao-boolean at rooted binary tree definition, printed page 496 (lines 257–263, 276): the source says root, unique parents and at most two children identify these orders with binary sequence trees; it should be required that each principal down-set is finite and linearly ordered; affects a stated result.
- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36 (lines 2322–2330): the source says interval comparisons suffice for arbitrary weakly increasing tuples; it should be required that the tuples have the same equality pattern, or be strictly increasing; affects a stated result.

For the second source issue, `1+ℤ` satisfies the three displayed clauses but has infinite ancestor sets, so cannot be a sequence tree. For the third, tuples `(0,0)` and `(0,1)` in ℤ have corresponding open intervals isomorphic (both middle intervals empty), but different atomic equality types. The roadmap already excludes both counterexamples by its own definitions/hypotheses; neither source issue requires importing a false claim.
