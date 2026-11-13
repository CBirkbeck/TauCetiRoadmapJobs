# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at a86135c)

**Verdict:** needs changes

## R01 (P1) — Comparable maps need a prism homotopy

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:370 — “their image under `g` together form a chain”.
**Claim:** Pointwise comparability does not make the two simplicial maps contiguous; the proposed straight-line homotopy can leave the realization.
**Witness:** Take P={0<1}, Q={0,1}², f(i)=(i,0), g(i)=(i,1). Then f≤g, but f(1) and g(0) are incomparable. The midpoint homotopy has all four vertices in its support.
**Repair:** Replace the straight-line argument with the simplicial prism construction, whose mixed simplices use f(x₀),…,f(xᵢ),g(xᵢ),…,g(xₙ). Add this square as a negative-control Check; its two prism triangles are chains, whereas their union is not.

## R02 (P1) — A minimal-open preimage is not one open star

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:292 — “the preimage is the open star of that vertex”.
**Claim:** The asserted equality is false even for Sierpiński space.
**Witness:** For 0<1 with upper opens, U₀={0,1}; μ⁻¹(U₀)=[0,1], but star(0)=[0,1). McCord’s actual argument is mccord1966 line 238 and line 270.
**Repair:** Write “μ⁻¹(Uₓ)=⋃_{y≥x} star(y); it deformation retracts onto |K(Uₓ)|, a cone with vertex x.” Cite McCord §5, Lemmas 3 and 7, pp. 469–470, and add the Sierpiński preimage calculation.

## R03 (P1) — The invariant-core argument needs T₀

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:521 — “a contractible finite `G`-space has a `G`-invariant core”.
**Claim:** This auxiliary theorem is false without T₀, and the equivariant core theorem is not a target of Layers 1–3.
**Witness:** C₂ freely swaps the indiscrete two-point space. Every homotopy into this space is continuous, so it is contractible, but it has zero fixed points. Barmak’s hypothesis is T₀: barmak2011 line 4592.
**Repair:** Add the general equivariant-core theorem for finite T₀ spaces acted on by homeomorphisms to Layer 1, with the fixed-point corollary, and consume it here. Cite Barmak Lemma 8.1.2 and Proposition 8.1.3, pp. 106–107; retain the indiscrete swap as the excluded case.

## R04 (P1) — The named Mathlib supplier does not exist

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:130 — `Specialization.homeoWithUpperSetTopologyorderIso` (also lines 98, 191 and 196).
**Claim:** The exact supplier contract names a nonexistent declaration.
**Witness:** At the pin, Mathlib/Topology/Specialization.lean:97 defines the root-level homeoWithUpperSetTopologyorderIso. A scratch #check rejects the Specialization-qualified name and accepts the root name.
**Repair:** Replace all four occurrences with `homeoWithUpperSetTopologyorderIso`. Its elaborated type requires `AlexandrovDiscrete X` and supplies exactly `X ≃ₜ WithUpperSet (Specialization X)`.

## R05 (P1) — Own the local-to-global weak-equivalence theorem

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:291 — “The route is McCord’s theorem on basis-like open covers”.
**Claim:** The proof consumes a general theorem that is neither a target nor a named supplier. A paper citation does not provide an implemented prerequisite.
**Witness:** mccord1966 line 144 states Theorem 6 for arbitrary spaces and basis-like open covers. README §2.1’s Needs lists only §1.1 and carrier APIs; no layer or cited roadmap supplies this theorem.
**Repair:** Add a preceding target: for continuous f:E→B and a basis-like open cover U of B, if every restriction f⁻¹(V)→V is a weak homotopy equivalence, then f is one (McCord Theorem 6, p. 467). Define basis-like covers with their API and Checks, and add the dependency.

## R06 (P1) — Supply the full-modulus Euler-characteristic argument

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:577 — “a Möbius inversion over the subgroups of `P` turns this into the congruence modulo `|P|`”.
**Claim:** The passage from fixed-point Euler characteristics to divisibility by |P| is an unnamed prerequisite; the supplied counting theorem only gives modulus p.
**Witness:** Mathlib/GroupTheory/PGroup.lean:314 concludes MOD p. For P=C₄, 3≡1 modulo 2 but 3≢1 modulo 4. No listed target states the fixed-point-to-full-modulus implication.
**Repair:** Add a general finite P-poset target: if every nontrivial subgroup Q≤P has an acyclic fixed order complex, then χ(K)≡1 mod |P|. Supply its orbit/mark argument, using Brown Theorem 1, p. 3 (brown1975 line 98), or explicitly cite Mathlib IncidenceAlgebra.moebius_inversion_top and state the required stabilizer-count identities.

## R07 (P1) — A minimum uses the identity map, not a constant

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:389 — “A preorder with a largest or a smallest element is the case `f` constant.”
**Claim:** The smallest-element specialization does not satisfy x≤f(x) when f is constant in general.
**Witness:** In 0<a, 0<b, there is a minimum and no upper bound of {a,b}. Thus no constant f satisfies x≤f(x). With x₀=0 and f=id, both required inequalities hold.
**Repair:** Write “For a largest element t take f constant at t; for a smallest element b take x₀=b and f=id.” Add the three-point poset 0<a, 0<b as the minimum Check.

## R08 (P2) — Retain McCord’s generality

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:286 and :312; TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/Suggested.lean:90 and :103 — “for a finite `T₀` space” and “on a finite vertex type”.
**Claim:** Both McCord headlines are restricted below the generality of their cited source, although the pinned carriers support the general statements.
**Witness:** mccord1966 lines 68–93 state Theorem 2 for all T₀ Alexandrov spaces and Theorem 3 for every simplicial complex with weak realization; local finiteness is explicitly not assumed.
**Repair:** Use `[AlexandrovDiscrete X] [T0Space X]` in §2.1 and remove `[Finite ι]` from §2.2, in README and Lean. Keep finite cases as Checks. Both broadened signatures elaborate at the pins; the infinite discrete complex gives the identity weak equivalence on ℕ.

## R09 (P3) — Exclude the trivial group from the contractibility Checks

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:528 — “For a `p`-group `P`, `S_p(P)` has the largest element `P` and is contractible”.
**Claim:** The Check and the analogous example at line 596 omit nontriviality of the subgroup supplying the cone point.
**Witness:** For P=1 and p=2, P=⊥ is excluded from S₂(P). Both subgroup posets have zero elements and empty, noncontractible realizations.
**Repair:** Write “For a nontrivial finite p-group P…” at line 528, and “Nontrivial finite p-groups, and finite groups with a nontrivial normal Sylow p-subgroup…” at line 596. Add P=1 as the negative control.

## R10 (P3) — Remove all sixteen prohibited-supplier references

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:69 and :170; TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/Suggested.lean:34 — “Left to LocalFiniteGroupTheory”.
**Claim:** The worker’s `dropped` gate fails on 13 README references and 3 module-docstring references to a supplier explicitly prohibited by this review’s supplier rules.
**Witness:** The gate reports dropped=16 and FAIL. README lines 69, 70, 72, 170, 183, 450, 458, 461, 504, 505, 524, 560, 600 and Suggested.lean lines 34, 36, 38 are the hits.
**Repair:** Remove these supplier citations and assign the required p-core, elementary-abelian and p-rank contracts to an eligible owner or to explicit local targets, retaining their general APIs. Update scope, Needs and the module docstring consistently, then rerun the gate.

## R11 (P3) — Replace broad references with exact locators

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:193 — “(Stong 1966; Barmak 2011, Chapter 1)” (likewise §§1.2–1.4, 2.1–2.2, 3.1–3.3 and 4.7).
**Claim:** Whole-paper citations, a whole chapter and unnamed theorem descriptions do not give the required theorem/section and page locators.
**Witness:** Barmak places the fence criterion at Corollary 1.2.6, p. 6 (barmak2011 line 673); Brown’s congruence is Corollary 2 to Theorem 2, p. 4 (brown1975 line 150).
**Repair:** Use Barmak Propositions 1.2.1/1.2.4 (pp. 4–5), Corollary 1.2.6 (p. 6), Definition 1.3.3/Proposition 1.3.4 (pp. 7–8), Corollary 1.3.7 (p. 8); McCord Theorems 2–3 (p. 466) and 6 (p. 467); Brown Corollary 2 (p. 4). Supply exact Quillen pages for §§3.1–3.3, and distinguish published and arXiv pagination.

## R12 (P3) — Provide definition APIs and discriminating Checks

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:231 and :448 — “Define `IsBeatPoint x`”; “Define `PSubgroupPoset G p`”.
**Claim:** The definitions have no required API bullet lists; the inclusion, conjugation actions and core construction do not each receive three discriminating Checks.
**Witness:** §1.3 jumps from definition and proof prose to Checks. §4.1 shares three bullets among two posets, an inclusion and conjugation; none tests the conjugation action or its compatibility with the inclusion.
**Repair:** Add prose API bullets for beat-point duality/order-isomorphism invariance, core retractions, induced subgroup orders, inclusion and conjugation identities/composition. Give three Checks for each construction: include the empty subgroup poset, D₈’s strict inclusion, and conjugation sending ⟨(12)⟩ to ⟨(23)⟩ in S₃. State the relative fence result used by beat-point retractions.

## R13 (P3) — Remove repository-search narrative from the roadmap

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:50 and :605 — “A search of the roadmaps on main, of the open pull requests…”; “No roadmap on main or in the open pull requests cites…”.
**Claim:** These are dated workflow observations, not timeless mathematical scope or downstream contracts.
**Witness:** Lines 50–56 report a repository search, while the entire Downstream consumers section at lines 603–605 reports the present citation state.
**Repair:** Delete the search account. Retain only the concrete ownership boundaries. Replace the downstream sentence with “The subgroup-complex comparisons support equivariant topology and the study of group cohomology through subgroup posets.”

## R14 (P3) — Use the pinned conversion from order maps to functors

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:61, :408 and :414 — `CostructuredArrow f.functor q` and `f.functor`.
**Claim:** For f:P→oQ, the pinned API has no OrderHom.functor field, so the displayed comma-category comparison is not expressed using the cited constructor.
**Witness:** A scratch elaboration rejects f.functor. Mathlib/CategoryTheory/Category/Preorder.lean:157 defines Monotone.functor on a proof of monotonicity; f.monotone.functor elaborates.
**Repair:** Replace f.functor by f.monotone.functor in these three expressions. This uses the same objects and lower fibres; on {0}↪Fin 2 both comma categories remain singletons.

## R15 (P3) — Cite the subdivision machinery used by the face-poset route

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:316 — “the face poset’s order complex is the barycentric subdivision of `K`”.
**Claim:** The route uses the subdivision identification and its realization homeomorphism, but neither is included in Scope, Exact supplier contracts or this target’s Needs.
**Witness:** At the pin, TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Basic.lean:76 supplies barycentricSubdivision_eq_orderComplex; TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean:221 supplies barycentricSubdivisionRealizationHomeomorph.
**Repair:** Cite `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex` and `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`, with their files, in the ownership/supplier sections and §2.2 Needs. Do not plan a second construction. On an edge, this identifies its two-edge barycentric subdivision with the same interval.

## Verified sound

| Statement | Instances tried | Computed side/input | Computed other side/output | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Convention 1: specialization | Sierpiński {False<True} | True ⤳ False = true | False≤True = true; opposite inequality false | Pass | — |
| Convention 2: faces | Fin 2; discrete pair | 3 faces; 2 faces | interval; two points | Pass | — |
| Convention 3: subgroup carriers | S₃, p=2,3,5 | ∣S∣=3,1,0 | ∣A∣=3,1,0 | Pass | — |
| Convention 4: p-parts | A₅, p=2,3,5,7 | ∣G∣=60 | ∣G∣ₚ=4,3,5,1 | Pass | — |
| Convention 5: Euler signs | edge; four-point square | 2−1=1; 4−4=0 | χ(interval)=1; χ(circle)=0 | Pass | — |
| 1.1: topology and continuity | Sierpiński→discrete pair, identity | continuous=false: {False} not open | monotone=false: comparable pair becomes incomparable | Pass | — |
| 1.1: T₀ correspondence | indiscrete pair | T₀=false | a≤b and b≤a, a≠b: antisymmetric=false | Pass | — |
| 1.1: connectivity | pseudo-circle; two Sierpiński components | components=1;2 | path components=1;2; comparability components=1;2 | Pass | — |
| 1.2: homotopies are fences | Sierpiński; discrete pair; pseudo-circle constants | const False∼id; const a≁const b in discrete pair | fence lengths 1; none; 2 via a≤c≥b | Pass | — |
| 1.2: empty source | X=∅, arbitrary finite Y | one continuous map; self-homotopy=true | EqvGen reflexive=true | Pass | — |
| 1.3: beat-point predicate | singleton; chain of three; pseudo-circle | beat-point counts=0;3;0 | strict neighbourhood extrema=none; present; none | Pass | API in R12 |
| 1.3: relative retraction | Sierpiński, remove True | r(False)=False=r(True) | r fixes complement; ir≤id | Pass | — |
| 1.3: cores | 0,1<2; pseudo-circle | beat deletions: 3→2→1; none | core sizes=1;4 | Pass | — |
| 1.4: Stong classification | minimal discrete pair; pseudo-circle | homotopy-equivalence permutations are bijections | homeomorphisms=true; only id lies in id’s homotopy class | Pass | — |
| 1.4: beat hypothesis | Sierpiński versus point | homotopy equivalent=true | homeomorphic=false: 2≠1 points | Pass | — |
| 2.1: McCord map | Sierpiński; empty space | μ(0)=0; μ(t)=1 for t>0; ∅→∅ | π₀:1→1 or 0→0; positive πₙ=0 | Pass | Generality R08 |
| 2.1: selected endpoint | Sierpiński, choose minimum instead | preimage of {True}={1} | {1} not open in [0,1] | Pass | — |
| 2.1: claimed open star | U₀ in 0<1 | μ⁻¹(U₀)=[0,1] | star(0)=[0,1) | False equality | R02 |
| 2.1: cover theorem input | identity on point; one-set cover | restricted weak equivalence=true | global weak equivalence=true | Missing target | R05 |
| 2.2: subdivision input | single edge | face-poset order complex: 3 vertices,2 edges | native subdivision: 3 vertices,2 edges; realization=[0,1] | Existing input omitted from contracts | R15 |
| 2.2: carrier map | one edge; triangle boundary; empty complex | face counts=3;6;0 | π₁=0;ℤ; no basepoint on both sides | Pass | — |
| 2.2: topology direction | one edge, face {0} | carrier⁻¹({{0}})={0} | lower-open singleton pulls back to nonopen singleton | Pass | — |
| 2.1–2.2: infinite cases | discrete ℕ; discrete simplicial complex on ℕ | realization and specialization are discrete ℕ | maps=id; all component maps bijective | Unneeded finite restrictions | R08 |
| 3.1: order complex/nerve | Fin 2; discrete pair; 0,1<2 | interval; two points; two-edge tree | same spaces from strict-chain nerve simplices | Pass | — |
| 3.1: antisymmetry control | two-element indiscrete preorder | order complex: one edge | nerve: nondegenerate simplices in every dimension | Hypothesis discriminates | — |
| 3.1: naturality | discrete {a,b}, canonical e=id, f=const a | e∘f=const a | f∘e=const a | Pass | — |
| 3.2: comparable maps | f(i)=(i,0), g(i)=(i,1) | f≤g=true; f(1)=(1,0) | g(0)=(0,1); incomparable | Prism works; straight line leaves complex | R01 |
| 3.2: noncomparable maps | discrete pair, id and swap | f≤g=false | homotopic=false: components exchanged | Pass | — |
| 3.3: conical criterion | 0,1<2; pseudo-circle | f=const 2 works; no permitted (f,x₀) | contractible=true; false (π₁=ℤ) | Pass | — |
| 3.3: minimum specialization | 0<a,0<b | no constant satisfies x≤f(x) | f=id, x₀=0 satisfies both inequalities | False specialization | R07 |
| 3.4: comma-category conversion | {0}↪Fin 2 | f.functor: unknown field | f.monotone.functor: fibres have 1,1 objects | API spelling fails | R14 |
| 3.4(a): lower fibres | {0}↪Fin 2; ∅→∅ | fibre sizes=1,1; no fibres | point≃ₕinterval; ∅≃ₕ∅ | Pass | — |
| 3.4(a): strict-fibre control | discrete pair→Fin 2 bijection | strict fibres=1,1; lower fibres=1,2 | components:2→1; not homotopy equivalence | Pass | — |
| 3.4(a): upper-fibre dual | {a,c}↪{a,b<c} | lower fibre over b=∅; upper sizes=2,1,1 | all upper fibres contractible; both realizations contractible | Pass | — |
| 3.4(b): basic-localizer specialization | W₀; discrete pair→point | fibre has 2 components, not W₀-aspherical | 2→1 not bijective on components; not in W₀ | Pass | — |
| 4.1: total parameter values | C₄ at p=4; any group at p=1,0 | C₄ belongs to A₄; S₁=A₁=∅ | S₀=all nontrivial subgroups; A₀=nontrivial abelian subgroups | Definitions consistent; prime needed for headlines | — |
| 4.1: inclusion and nonexamples | D₈ and Q₈ at p=2 | D₈: ∣A∣=7, ∣S∣=9; Q₈:1,5 | cyclic order-four subgroups excluded from A | Pass | — |
| 4.1: conjugation | S₃, g=(123), H=⟨(12)⟩ | gHg⁻¹=⟨(23)⟩ | same order-two subgroup after either inclusion path | Pass | Check missing: R12 |
| 4.1(b): central contraction | D₈, central Z of order 2 | reflection R≤RZ≥Z; ∣RZ∣=4 | RZ elementary abelian; S also has top D₈ | Pass | — |
| 4.1(c): dimension | 1; C₃ at p=3; D₈ at p=2 | p-ranks=0;1;2 | dimensions=−1;0;1 | Pass | — |
| 4.2: Brown–Quillen | D₈, p=2; S₃, p=5 | A: 7 vertices,6 edges; S:9,15,7 | both contractible, χ=1; both empty for S₃,p=5 | Pass | — |
| 4.2: normalizer control | S₄, P=⟨(12),(34)⟩ | ∣A₂(P)∣=4 | ∣N(P)∣=8; ∣A₂(N(P))∣=7 | Pass | — |
| 4.3: normal p-subgroup contraction | S₄,p=2; S₃,p=2 | normal V₄ exists; no normal C₂ | S₄ contracts to V₄; S₃ has 3 components | Pass | — |
| 4.3: elementary-abelian product control | D₈, normal V₄=N, outside reflection Q | ∣QN∣=8; QN=D₈ | not abelian; belongs to S₂, not A₂ | Pass | — |
| 4.4: finite-space iff | S₃,p=2,3; G=1,p=2 | contractible=false,true,false | normal nontrivial p-subgroup=false,true,false | Pass | — |
| 4.4: auxiliary fixed-point assertion | C₂ swaps indiscrete two-point space | contractible=true; identity homotopic to constant | fixed points=0; invariant singleton cores=0 | False without T₀ | R03 |
| 4.4: p-group Check | G=1,p=2 | IsPGroup=true; ∣S₂∣=0 | ContractibleSpace=false; no top subgroup in carrier | False Check | R09 |
| 4.5: strongly embedded criterion | S₃,p=2; A₅,p=2 | components=3;5; proper M orders=2;12 | outside conjugate intersections have orders=1;3 | Both directions consistent | — |
| 4.5: connected control | S₄,p=2 | S₂ connected; Sylow subgroup order=8 | distinct Sylows intersect in V₄, order=4; criterion fails | Both sides false | — |
| 4.6: solvable theorem | S₃,p=2; S₄,p=3,2 | reduced H₀ ranks=2;3;0; S₄ at 2 contracts | ∣Oₚ∣=1;1;4; nonzero top-homology degree=0 in first two | Pass | — |
| 4.7: Euler congruence | A₅,p=2,3,5; S₄,p=2 | χ=20−15=5;10;6;19−39+21=1 | χ−1=4,9,5,0 divisible by 4,3,5,8 | Pass | — |
| 4.7: empty-poset modulus | G=1,p=2; A₅,p=7 | χ=0; p-part=1 | 0≡1 mod 1=true in both cases | Pass | — |
| 4.7: supplied mod-p bound | P=C₄; candidate χ=3 | 3≡1 mod 2=true | 3≡1 mod 4=false | Stronger input must be supplied | R06 |

- Sources: 8/15 seeded targets checked against readable texts (1.1–1.4, 2.1–2.2, 4.4, 4.7); the 7 Quillen-locator targets remain uncertified; 22 works requested, 12 texts obtained.
- Source locators opened include Barmak 1.2.1, 1.2.4–1.2.6, 1.3.3–1.3.7, 1.4.6, 8.1.2–8.1.3; Stong 1966 Propositions 5–9 and Theorems 2–4; McCord Theorems 2, 3, 6 and §5 Lemmas 3, 7; Brown Corollary 2; Minian–Piterman Proposition 2.1, Examples 3.5, 3.7 and Proposition 3.8.
- Pins: 47 supplier names checked in Lean; 1 misqualified name rejected separately (R04). Opened Mathlib/Topology/Specialization.lean:61, :97; Mathlib/GroupTheory/PGroup.lean:45, :314, :450; Mathlib/AlgebraicTopology/SimplicialSet/NerveNondegenerate.lean:58.
- Tau Ceti declarations opened: TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean:57, :68, :116; TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:362; TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean:149; TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Basic.lean:76; TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Homeomorph.lean:221; TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean:145; TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean:78. Realizations use finite nonempty supports; weak equivalences include surjectivity on components even for empty sources.
- Cross-roadmaps: 5 distinct supplier section IDs resolved at open heads: StableHomotopyKTheory §2.31 (#1227), HomotopyTheoryOfCategories §§2.1, 2.4 (#1521), LocalFiniteGroupTheory L1, L4 (#1634); the last supplier is prohibited. Main AlgebraicTopology and ClassifyingSpaces scopes read; no second copy or duplicate headline found.
- Gate: FAIL, solely dropped=16; targeted build passed. Independent elaboration passed with 15 sorry warnings; all 19 #check signatures matched their explicit binders, with 0 lost hypotheses. One-tactic probes simp/rfl/infer_instance closed 0/15 theorems; library near-matches supplied no exact headline proof.
- Headline coverage: all 15 advertised primary theorems are present; naturality of the nerve comparison is a separate README target. The docstring names the 2 additional unstated headlines, basic-localizer fibres and subgroup-complex dimension. Both broadened McCord signatures elaborate.
- PR text/diff: 3 files added, 890 lines, 19 declarations; 0 files changed outside the folder; title and prose match those changes. Worktree remained clean.

`depcheck: 240 roadmaps, 2176 edges, 0 problem(s)` — no UPWARD or CYCLE output. This does not waive the independent prohibited-supplier gate.

Overlap check: read StratifiedSpacesAndTameTopology (#1519), HomotopyTheoryOfCategories (#1521), LocalFiniteGroupTheory (#1634), KanQuillen (#2269); common order-complex carriers belong to pinned Tau Ceti, upper-set topology to Mathlib, basic localizers to HomotopyTheoryOfCategories §§2.1–2.4, and the cited p-core/elementary-abelian/rank APIs to LocalFiniteGroupTheory L1/L4 (prohibited supplier: R10). KanQuillen’s simplicial weak equivalences are distinct from the topological predicate used here. No main/results-heading nearest-neighbour candidates were listed.

Source independence: 19 passages compared with 9 sources; no nonstandard copied wording or reused tables/figures found. Largest share: quillen1978, 11 of 49 explicit author-year citation occurrences before References. Its text and contents were unavailable, so independence against that source is unverified. Barmak’s contents were read: Layers 1–2 use Chapter 1, while Layer 3 and Brown’s endpoint have different scopes; §1.2→§1.3→§1.4 and §2.1→§2.2 are explicit dependencies, not evidence of copied arrangement.

## Not verifiable

- quillen1978: §§1, 2, Proposition 5.2 and Corollary 12.2; DOI service classified the publisher text as paywalled; the Northern Arizona University PDF failed certificate verification over both supplied URL schemes. Original numbering, pages, hypotheses, wording and contents remain unverified.
- stong1984: DOI service returned uncertified/paywalled; Proposition 2.1 and the finite-space examples were checked in minian_piterman2018 (arXiv:1612.04302v1), not against Stong’s original paper.
- aschbacher_smith1993: DOI resolved to JSTOR; the service found no classified legal open text.
- webb1987: DOI service returned uncertified/paywalled.
- symonds1998: DOI service returned uncertified/paywalled.
- thevenaz_webb1991: DOI service returned uncertified/paywalled.
- smith2011: DOI resolved to AMS’s ebook page; no readable text obtained.
- brown2000: DOI service returned uncertified/paywalled; the coset-poset identity was corroborated in shareshian_woodroofe2016, §1.1.
- hall1936: Oxford DOI landing page returned HTTP 403.
- aschbacher_kleidman1990: DOI service returned uncertified/paywalled.
- Published/preprint pagination for minian_piterman2018 and the contextual arXiv references was not independently matched; checks use the fetched versions, not assumed published page numbers.

## Source issues

- none

## For the human reviewers

- Not tested: quillen1978 has the largest citation share (11/49); its text and contents could not be obtained through the sources service, so wording and arrangement against that work remain unchecked.
