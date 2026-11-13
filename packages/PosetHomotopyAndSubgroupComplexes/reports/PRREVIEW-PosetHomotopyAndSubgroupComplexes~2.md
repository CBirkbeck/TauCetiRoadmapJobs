# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at bd77287)

**Verdict:** needs changes

## R01 (P1) — Separate the trivial acting group in the Euler-count argument

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:546 — “Downward induction gives `e(P) = 1`”.
**Claim:** This proof step and the resulting identity `chainEulerChar T = e(1) + 1` are false when the acting group is trivial; the theorem itself remains true.
**Witness:** Let P=1 act on a two-point antichain. The fixed-subgroup hypothesis is vacuous, χ(T)=e(P)=e(1)=2, and the claimed final identity reads 2=3. The conclusion 2≡1 modulo 1 holds.
**Repair:** Begin: “If P=1, the congruence is automatic modulo 1. Otherwise P is among the nontrivial subgroups, so e(P)=χ(Tᴾ)=1; proceed by downward induction.” Add this two-point trivial-action Check.

## R02 (P2) — Import the existing p-core and p-rank owners

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:594–606 — “Define `pRank G p`”; “Define the `p`-core `O_p(G)`”.
**Claim:** These general constructions and their stated laws duplicate the earlier OddOrderTheorem roadmap.
**Witness:** Pull request #1777, TauCetiRoadmap/OddOrderTheorem/README.md:316–331 owns the p-core and Sylow-intersection characterization; :477–489 owns elementary abelian subgroups and p-rank. Neither contract assumes the ambient group has odd order.
**Repair:** Import OddOrderTheorem §§1.1 and 1.4 in Scope, Exact supplier contracts and Needs; delete the duplicated construction targets. Keep the nontrivial subgroup-poset adapters and chain-dimension theorem. Identify any simple Lean p-rank expression with the supplier's invariant. For D₈ both definitions give rank 2 and p-core D₈. Update the PR's supplier list accordingly.

## R03 (P2) — State the nonemptiness hypothesis in the orbit-space theorem

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:775–777 — “the orbit space of the realization of `S_p(G)` under the action of `G` is contractible”.
**Claim:** This contextual theorem needs p to divide the finite group order.
**Witness:** For G=1 and p=2, S₂(G)=∅. Its realization and its orbit space are empty, hence not contractible. For S₃ at p=2 the three points form one conjugacy orbit, giving a point.
**Repair:** Write: “For a finite group G and a prime p dividing |G|, Webb conjectured that the conjugation orbit space of the realization of S_p(G) is contractible; Symonds proved this.”

## R04 (P3) — Distinguish the carrier-map variant from McCord's Theorem 3

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:391–394; TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/Suggested.lean:129 — “the carrier map … to `WithUpperSet (Face K)` … (McCord 1966, Theorem 3, p. 466)”.
**Claim:** The source's Theorem 3 uses the lower-set face topology and a different map. The proposed upper-set carrier map is valid, but is a derived variant.
**Witness:** mccord1966 lines 235–237 and 314–320: on an edge at t=1/4, the source selects face {0} from the subdivision chain {0}⊂{0,1}; the roadmap's carrier is {0,1}.
**Repair:** Attribute §2.3 and its docstring to “the upper-set carrier-map variant, obtained from McCord Theorem 2, p. 466, and barycentric subdivision; compare Theorem 3 and §6, p. 471, for the lower-set version.” Retain the given proof and include the edge calculation distinguishing the maps.

## R05 (P3) — Finish the exact source locators

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:438, :461, :486, :507, :583, :598, :643, :660, :699, :717 — “(Quillen 1978, §1)”, “(Quillen 1978, §2)”, and numbered results without pages.
**Claim:** Previous R11 is only partly repaired: the poset/subgroup targets still omit printed-page locators, and the nerve comparison, homotopy property and conical criterion retain undifferentiated section citations.
**Witness:** §§3.1–3.3 all cite §1 without a page or an individually identified result. In contrast, §1.2 now gives Corollary 1.2.6, p. 6, verifiable at barmak2011 line 673.
**Repair:** Give the individual result or construction and printed page for §§3.1–3.4 and 4.1–4.6, including the p-core characterization in its supplier contract. Keep the repaired Barmak, McCord and Brown locators.

## R06 (P3) — Restore per-definition API bullet lists

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:248, :334, :537 and :580 — “API:”; “Define `elemAbelianToPSubgroup`”.
**Claim:** Previous R12 is only partly repaired: useful laws and Checks were added, but definitions still have prose API strings instead of the required fact-by-fact bullet lists; the core's retraction API is not separated from existence.
**Witness:** §1.3 embeds duality, invariance and core retractions in one paragraph; §§2.1 and 3.5 use inline “API:”; §4.1 combines order embedding and action laws in prose. No definition has an API bullet list.
**Repair:** Give separate prose API bullets for beat-point duality/invariance; core inclusion, retraction and relative composite; basis-like covers; finite chain Euler characteristics; subgroup orders, inclusion and conjugation identity/composition/equivariance. Preserve the discriminating Checks and keep supplier-owned p-core/rank laws in the contracts after R02.

## R07 (P3) — Give the two fibre theorems separate dependencies

**Location:** TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:517–518 — “*Needs:* 3.1, 3.3; StableHomotopyKTheory §2.31; HomotopyTheoryOfCategories 2.1, 2.4”.
**Claim:** One Needs line combines two different theorems and imposes unrelated suppliers on each.
**Witness:** Part (a) uses a homeomorphism of realizations and topological Theorem A. Part (b) uses categorical localizer membership and the comma/fibre identification, with no realization. Neither route invokes conical contractibility §3.3.
**Repair:** Give (a) Needs: §3.1, StableHomotopyKTheory §2.31, Monotone.functor, CostructuredArrow and HomotopyEquiv. Give (b) Needs: HomotopyTheoryOfCategories §§2.1, 2.4, Monotone.functor and CostructuredArrow. Keep the one-object lower-fibre Check for both readings.

## Verified sound

Previous findings, checked against this head:

| Previous finding | Head passage and location | Disposition |
| --- | --- | --- |
| R01 | README:461, “The homotopy is the prism construction” | Repaired; square Check at :475. |
| R02 | README:362, “μ⁻¹(U_x) = ⋃_{y ≥ x} star(y)” | Repaired. |
| R03 | README:298, “finite T₀ space”; Lean:88 and :97 | Repaired: invariant-core and fixed-point targets. |
| R04 | README:96, “homeoWithUpperSetTopologyorderIso” | Repaired; native name elaborates. |
| R05 | README:336, “isWeakHomotopyEquivalence_of_isBasisLike” | Repaired; general cover theorem now a target. |
| R06 | README:540, “chainEulerChar_modEq_of_fixedPoints” | Prerequisite supplied; its new trivial-group proof defect is R01 above. |
| R07 | README:488, “x₀ = b and f = id” | Repaired. |
| R08 | README:357, “Alexandrov-discrete”; :391, “any vertex type” | Repaired in prose and signatures. |
| R09 | README:691, “nontrivial finite p-group”; :759, “trivial group has empty posets” | Repaired. |
| R10 | README:603, “Define the p-core”; Lean:38, “Elementary abelian subgroups are written by their two conditions” | Prohibited citations removed; replacement ownership conflicts with OddOrderTheorem (R02). |
| R11 | README:226, “Corollary 1.2.6, p. 6”; :461, “Quillen 1978, §1” | Partly repaired; R05. |
| R12 | README:622, “Conjugation”; :248, “API:” | Laws and negative controls added; API lists still missing (R06). |
| R13 | README:770, “support equivariant topology” | Repaired; repository-search narrative removed. |
| R14 | README:509, “f.monotone.functor” | Repaired; pinned conversion exists. |
| R15 | README:401 and :407, “barycentricSubdivisionRealizationHomeomorph” | Repaired in ownership, contracts and Needs. |

The headline targets are §§1.2–1.5, §§2.1–2.3, §§3.1–3.5, and §§4.1(c)–4.7: 20 Lean theorems, plus §3.4(b), explicitly unstated in the module docstring because basic-localizer carriers are unavailable.

| Statement | Instances tried | Computed input/left side | Computed output/right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Convention 1: specialization direction | Sierpiński | True specializes to False | False≤True; upper opens ∅,{True},X | Consistent | — |
| Convention 2: order complex | Fin 2; discrete pair; empty | Nonempty chains: 3;2;0 | Interval; two points; empty realization | Consistent | — |
| Convention 3: subgroup carriers | S₃, p=2,3,5 | S cardinalities 3,1,0 | A cardinalities 3,1,0 | Consistent | — |
| Convention 4: p-parts | A₅, p=2,3,5,7 | Group order 60 | p-parts 4,3,5,1 | Consistent | — |
| Convention 5: Euler signs | Edge; square; empty | 2−1;4−4;0 | χ=1;0;0, reduced χ=0;−1;−1 | Consistent | — |
| 1.1: T₀ and antisymmetry | Indiscrete pair | a≤b and b≤a, a≠b | T₀=false; antisymmetry=false | Both directions consistent | — |
| 1.1: continuity and monotonicity | Sierpiński→discrete pair, identity | Preimage of {False} not open | False<True sent to incomparable points | Both false | — |
| 1.1: connectedness | Pseudo-circle; two disjoint edges; empty | Comparability components 1;2;0 | Path components 1;2;0 | Consistent with nonempty connectedness | — |
| 1.2: homotopy/fence headline | Sierpiński; discrete pair; pseudo-circle constants | Fence lengths 1; none; 2 | Homotopic true;false;true | Consistent | — |
| 1.2: relative comparable homotopy | Edge ordered 0<1; r=const 0 | r≤id; agreement set {0} | Homotopy fixes 0 at every time | Relative condition retained | — |
| 1.2: empty source | ∅→finite Y | Exactly one map | Reflexive fence and self-homotopy | Consistent | — |
| 1.3: beat-point predicate | Singleton; three-chain; pseudo-circle | Beat counts 0;3;0 | Strict neighbourhood extrema absent;present;absent | Discriminates wrong neighbour criterion | — |
| 1.3: duality and invariance | 0,1<2; reverse order | 0 is up-beat, not down-beat | Dual 0 is down-beat; swap 0↔1 preserves beat status | Consistent | — |
| 1.3: retraction headline | Sierpiński, remove True | r(False)=r(True)=False | r fixes complement; ir≤id | Strong relative retraction | — |
| 1.3: core and composites | 0,1<2; pseudo-circle | Deletion sizes 3→2→1;4 | Constant retraction; identity on four-point core | Consistent | API lists R06 |
| 1.4: classification headline | Minimal discrete pair; pseudo-circle | Homotopy-equivalence permutations: 2;4 | Homeomorphisms: 2;4; only id homotopic to id | Consistent | — |
| 1.4: necessary beat hypothesis | Sierpiński versus point | Homotopy equivalent=true | Homeomorphic=false: cardinalities 2≠1 | Hypothesis discriminates | — |
| 1.5: invariant-core headline | C₂ swaps a,b in a,b<c | Orbit {a,b}, invariant core {c} | Constant retraction to c; core size 1 | Consistent | — |
| 1.5: fixed-point headline | Same action; simultaneous pseudo-circle swaps | Fixed-point counts 1;0 | Contractible true;false | Consistent | — |
| 1.5: T₀ negative control | C₂ freely swaps indiscrete pair | Contractible=true; T₀=false | Fixed points=0 | Excluded as required | — |
| 2.1: basis-like definition/API | Minimal Sierpiński opens; one-set cover | {X,{1}} and {X} cover; intersections refine | Both basis-like; {X} not a basis of Sierpiński topology | Distinct from native topological basis | API lists R06 |
| 2.1: nonexample and empty case | Two overlapping circle arcs; empty family | Intersection has two components; empty union=∅ | Original cover fails refinement; empty family covers only ∅ | Consistent | — |
| 2.1: local/global headline | Identity of point; identity of ∅ | Local π₀ maps 1→1; no cover members | Global π₀ maps 1→1;0→0; higher groups trivial | Consistent | — |
| 2.2: McCord headline | Sierpiński; discrete ℕ | μ(0)=0, μ(t)=1 for t>0; μ=id on ℕ | π₀ bijections; positive homotopy groups zero | General Alexandrov form retained | — |
| 2.2: open-star repair | Edge, U₀=X | μ⁻¹(U₀)=[0,1] | star(0)∪star(1)=[0,1]; star(0)=[0,1) | Correct union | — |
| 2.2: endpoint and noncontractible control | Minimum selector; pseudo-circle | Minimum selector pulls {1} back to {1} | Not open; pseudo-circle and square both π₁=ℤ | Convention discriminates | — |
| 2.3: carrier-map headline | Edge; triangle boundary; discrete ℕ | Face counts 3;6;countably infinite | π₁=0;ℤ;0 per component; π₀=1;1;ℕ | Derived variant valid | R04 attribution |
| 2.3: source map comparison | Edge at t=1/4 | McCord subdivision-minimum map={0} | Carrier map={0,1} | Maps and face topologies differ | R04 |
| 2.3: subdivision comparison | One edge | Subdivision has 3 vertices,2 edges | Same interval; maximal support face on open subedge is original edge | Pinned homeomorphism applies | — |
| 3.1: nerve headline/naturality | Fin 2; discrete pair; constant vertex map | Order-complex spaces interval;2 points; constant map | Nerve spaces interval;2 points; same constant map | Consistent | Locators R05 |
| 3.1: antisymmetry control | Indiscrete two-element preorder | Order complex is one edge | Nerve has alternating nondegenerate simplices in all dimensions | PartialOrder needed for homeomorphism | — |
| 3.2: comparable-map headline | f(i)=(i,0), g(i)=(i,1) | f≤g; f(1) and g(0) incomparable | Two prism triangles are chains; four-vertex union is not | Repaired prism works | Locators R05 |
| 3.2: noncomparability | Discrete pair, id and swap | f≤g=false | π₀ maps id≠swap, so not homotopic | Hypothesis discriminates | — |
| 3.3: conical headline | 0,1<2; 0<a,0<b | f=const 2; f=id,x₀=0 | Contractible in both cases; second has no constant upper-bound map | Consistent | Locators R05 |
| 3.3: negative control | Pseudo-circle | x≤f(x) forces f=id | No common lower x₀; π₁=ℤ | Extra inequality essential | — |
| 3.4(a): lower-fibre headline | {0}↪Fin 2; ∅→∅ | Fibres singleton,singleton; none | Point≃ₕinterval; ∅≃ₕ∅ | Consistent | Needs R07 |
| 3.4(a): strict-fibre nonexample | Discrete pair→Fin 2 bijection | Strict fibres singleton,singleton; lower fibres sizes 1,2 | π₀:2→1, not bijective | Correct fibre inequality | — |
| 3.4(a): dual | {a,c}↪{a,b<c} | Lower fibre at b empty | Upper fibre sizes 2,1,1; all contractible | Dual theorem applies | — |
| 3.4(b): localizer reading | W₀; discrete pair→point | Lower fibre has 2 components | 2→1 fails W₀; singleton→point lies in W₀ | Consistent categorical contract | Needs R07 |
| 3.5: Euler definition/API | n-point antichain; edge; square | Counts n;2−1;4−4 | χ=n;1;0 | Finite-face native formula matches | API lists R06 |
| 3.5: fixed-point congruence headline | C₄ freely permutes 4 points plus fixed point | Nontrivial fixed subposets each have χ=1 | χ(T)=5, χ−1=4 divisible by 4 | Full modulus verified | — |
| 3.5: all subgroups necessary | C₄ acts through C₂ on swapped pair plus fixed point | χ(Tᴾ)=1; χ(Tᶜ²)=3 | χ(T)=3; 3≡1 mod2, not mod4 | Negative control valid | — |
| 3.5: trivial-group proof | P=1, T=two-point antichain | Hypothesis vacuous; e(P)=e(1)=2 | Claimed χ=e(1)+1 gives 2=3; 2≡1 mod1 true | Proof branch fails | R01 |
| 3.5: non-p-group generality | S₃ regular six-point orbit plus fixed point | Every nontrivial subgroup fixes just one point | χ=7;7−1=6 divisible by ∣S₃∣ | General finite-group form supported | — |
| Layer 3 example: point deletion | 0<1<2, remove 1 | Lower/upper links each singleton | Result one edge, originally filled triangle; both contractible | Consistent | — |
| 4.1(a): inclusion | D₈,p=2; Q₈,p=2 | A sizes 7;1 | S sizes 9;5; cyclic order-four subgroups excluded from A | Injective, not generally onto | R02 ownership boundary |
| 4.1(a): junk parameters | C₄,p=4; any group,p=1,0 | C₄∈A₄; A₁=S₁=∅ | S₀=nontrivial subgroups; A₀=nontrivial abelian subgroups | Prime needed only for prime-specific conclusions | — |
| 4.1(a): conjugation and inclusion | S₃, g=(123), H=⟨(12)⟩ | gHg⁻¹=⟨(23)⟩ | Same result via either inclusion path; inverse conjugation returns H | Equivariance and composition agree | API lists R06 |
| 4.1(a): wrong action control | Same H,g; central element of D₈ | 1∉gH, so translation is not a subgroup | Conjugation preserves 1; central conjugation fixes all 9 subgroups | Discriminating controls | — |
| 4.1(b): central conical map | D₈, central Z of order2, reflection R | R≤RZ≥Z; ∣RZ∣=4 | RZ elementary abelian; χ(A₂)=7−6=1 | Consistent | — |
| 4.1(c): rank/dimension headline | 1;C₃,p=3;D₈,p=2;Q₈,p=2 | p-ranks 0;1;2;1 | Face lengths ∅;{1};{1,2};{1} | Both directions, including n=0 | R02 |
| 4.1(c): rank versus exponent/order | C₄,p=2 | ∣G∣=4, exponent=4 | Elementary subgroups maximum order2; rank1 | Wrong rank2 excluded | — |
| 4.1(d): p-core | S₄,p=2; S₃,p=2,3 | Normal p-subgroup maxima orders 4;1;3 | Sylow intersections orders 4;1;3 | Same existing supplier invariant | R02 |
| 4.1(d): wrong core controls | S₄,p=2;D₈,p=2 | All p-subgroups generate S₄; largest normal p-subgroup of D₈ is D₈ | Orders 24≠4; D₈ nonabelian | Normality and nonabelian allowance essential | — |
| 4.2: Brown–Quillen headline | D₈,p=2; S₃,p=5 | A chain counts (7,6); empty | S chain counts (9,15,7); empty; χ=1;0 on both sides | Homotopy types consistent | Locators R05 |
| 4.2: lower-fibre identification | Non-normal V₄ in S₄,p=2 | A₂(P) has 4 points | Normalizer D₈ has A₂ size7 | Normalizer substitution excluded | — |
| 4.2: finite-space distinction | S₃≀C₂,p=2 | Source-reported core sizes 21 and39 | Unequal cores; realizations still homotopy equivalent | Distinguishes notions | — |
| 4.3: normal-subgroup headline | S₄,p=2; S₃,p=2 | Nontrivial normal p-subgroup exists; absent | χ=1, conical; three discrete points | Consistent | Locators R05 |
| 4.3: product countercontrol | D₈, normal V₄=N, outside reflection Q | QN=D₈, order8 | Not elementary abelian; valid member of S₂ | Contraction stays in correct poset | — |
| 4.4: finite-space iff headline | S₃,p=2,3;G=1,p=2 | Contractible=false,true,false | Nontrivial normal p-subgroup=false,true,false | Both directions consistent | — |
| 4.4: p-group/nontriviality | Nontrivial C₂; trivial group | S₂ sizes1;0 | Top element exists; absent; contractible=true;false | Repaired Check | — |
| 4.4: elementary-abelian converse | Order576 source example,p=2 | S₂ contractible; O₂ nontrivial | A₂ core has100 points, not contractible | Source counterexample supports distinction | — |
| 4.5: connectivity headline | S₃,p=2;A₅,p=2;S₄,p=2 | Components3;5;1 | Strongly embedded subgroup orders2;12;none | Both directions consistent | Locators R05 |
| 4.5: intersection/index witness | A₅,M=A₄,p=2 | Outside conjugate intersections order3 | Index5≡1 mod2; p∤3 | Consistent | — |
| 4.5: excluded empty case | G=1,p=2 | No connected nonempty realization | No proper strongly embedded subgroup; p∤∣G∣ | Divisibility hypothesis essential | — |
| 4.6: solvable headline | S₃,p=2;S₄,p=3,2 | Reduced H₀ ranks2;3;0; last complex contractible | p-core orders1;1;4 | Consistent on solvable tests | Locators R05 |
| 4.7: Brown headline | A₅,p=2,3,5;S₄,p=2 | χ=20−15=5;10;6;19−39+21=1 | χ−1=4;9;5;0 divisible by4;3;5;8 | Full p-part checked | — |
| 4.7: empty-poset boundary | G=1,p=2;A₅,p=7 | χ=0; modulus1 | 0≡1 modulo1 | Consistent | — |
| 4.7: fixed-subposet contraction | S₃,p=2,Q=⟨(12)⟩ | Only Q is normalized by Q among S₂ | RQ=Q; fixed subposet χ=1 | Product route applies | — |
| Research: orbit-space theorem | G=1,p=2;S₃,p=2 | Conjugacy-orbit counts0;1 | Empty not contractible; point contractible | Missing p-divisibility | R03 |
| Research: coset Euler identity | G=1;C₂ | Reduced χ=−1;1 | P_G(s)=1;1−2⁻ˢ, so −P_G(−1)=−1;1 | Consistent | — |
| Research: conjecture on small groups | S₃,p=2;A₅,p=2 | O₂=1; reduced H₀ ranks2;4 | Neither subgroup complex contractible | Consistent with cited cases | — |
| Headline coverage and binders | All27 declarations,20 theorems | All explicit finite/prime/T₀/action binders present | 20 README headlines stated; one basic-localizer headline documented absent | No lost binder or substitute | — |

- Source sample: nine of 15 targets compared with readable texts, including the §2.3 variant distinguished in R04; six Quillen-only targets remain uncertified. Inspected 25 result/definition/proof locators in Barmak, McCord, Brown and Minian–Piterman.
- Sources: all 21 cited works requested through the sources service; 11 readable texts obtained, seven publisher-only citations uncertified and three fetches unsuccessful; no source manifest changed.
- Mathlib contracts: opened `Topology/Specialization.lean:61`, `CategoryTheory/Category/Preorder.lean:157`, `GroupTheory/PGroup.lean:45`, `AlgebraicTopology/SimplicialSet/NerveNondegenerate.lean:58`, `Topology/Bases.lean:73`; the native basis predicate is stronger than §2.1's cover predicate.
- Tau Ceti contracts: opened `TauCeti/AlgebraicTopology/SimplicialComplex/OrderComplex.lean:57`, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:362`, subdivision and Euler-characteristic declarations; 60 pinned supplier names elaborated without errors.
- Cross-roadmap contracts: resolved StableHomotopyKTheory §2.31 on main and HomotopyTheoryOfCategories §§2.1, 2.4 at its open head; additionally compared OddOrderTheorem §§1.1, 1.4 for R02. No dropped citation IDs or conflicting heads in the overlap data.
- Gate: every scanner, dependency check and targeted build passed. Independent Lean elaboration produced only 20 `sorry` warnings; 27 explicit signature checks lost zero binders; all 20 one-tactic padding probes failed to close their goals.
- Adversarial enumeration: subgroup lattices and chain counts computed for the trivial group, S₃, S₄, A₅ and D₈; the table includes all 15 seeded targets and all headline targets.
- Pull-request text: checked the new-folder description against three added files and 1,112 added lines; no changes outside the assigned folder, removed base declarations or omitted supplier changes at this head.

Dependency check output: `depcheck: 240 roadmaps, 2170 edges, 0 problem(s)`.

Overlap check: read StratifiedSpacesAndTameTopology, HomotopyTheoryOfCategories, KanQuillen, PlanarTopology and TeichmullerGeometry from the closest-roadmap lists; also AlgebraicTopology, ClassifyingSpaces, StableHomotopyKTheory, OddOrderTheorem and LocalFiniteGroupTheory. Owners: Mathlib for upper-set topology; Tau Ceti for order complexes, subdivision and Euler characteristics; HomotopyTheoryOfCategories for basic localizers; StableHomotopyKTheory for realized Theorem A; OddOrderTheorem for p-core and p-rank (R02). LocalFiniteGroupTheory overlaps these group invariants but is excluded as a supplier by the review contract. No additional shared construction found.

Source independence: 20 passages compared with four principal sources, including five further definition, proof and docstring passages; no nonstandard wording or reused examples-list detected. Largest share: quillen1978, 13 of 52 cited result/section/work references before the bibliography, counting combined result numbers separately. Its text and contents were unavailable, so independence against it is unverified. Barmak's contents were read: §8.1 feeds Layer 1, §1.4 feeds Layer 2, and the subgroup endpoints come from other sources; Needs edges 1.2→1.3→1.4 and 2.1→2.2→2.3 force these local orders rather than a chapter sequence.

## Not verifiable

- quillen1978: DOI 10.1016/0001-8708(78)90058-0 yielded publisher-only access; the institutional copy at Northern Arizona University failed certificate validation. Original pages, numbered statements, wording and contents remain unverified, including the six Quillen-only seeded targets.
- stong1984: DOI 10.1016/0012-365X(84)90156-0 yielded publisher-only access; §4.4 was checked against Minian–Piterman Proposition 2.1 instead, but Stong's original wording and §3 were not read.
- aschbacher_smith1993: DOI 10.2307/2946530 resolved to a JSTOR landing page; the service found no legally readable text. The contextual unitary-component restriction was compared with Piterman–Smith instead.
- webb1987: DOI 10.1007/BF02564442 yielded publisher-only access; the original conjecture's wording was not read.
- symonds1998: DOI 10.1007/s000140050061 yielded publisher-only access; the original orbit-space theorem was not read. R03 follows directly from the empty-group instance.
- thevenaz_webb1991: DOI 10.1016/0097-3165(91)90030-K yielded publisher-only access; the contextual reference was not checked against its text.
- smith2011: DOI 10.1090/surv/179 resolved to an AMS ebook landing page; the service found no legally readable text or licence classification for a full copy.
- brown2000: DOI 10.1006/jabr.1999.8221 yielded publisher-only access; the Euler identity was checked in Shareshian–Woodroofe §1.1 and on the displayed small groups, not in Brown's original text.
- hall1936: DOI 10.1093/qmath/os-7.1.134 returned HTTP 403 from Oxford Academic; Hall's original subgroup-lattice formulation was not read.
- aschbacher_kleidman1990: DOI 10.1007/BF01191159 yielded publisher-only access; the almost-simple claim was checked against later introductions, not its original proof.

## Source issues

- **Error** in shareshian_woodroofe2016 at §1.3.1, p. 3 (arXiv v2), lines 88–98: the source says S_p(G) contains only proper nontrivial p-subgroups and is contractible whenever the p-core is nontrivial; it should be the poset of all nontrivial p-subgroups, including G when G is a p-group; affects a stated result.

## For the human reviewers

- quillen1978 supplies the largest citation share; its full text and contents could not be read. Wording and arrangement against that source remain untested; the readable Barmak contents do not reproduce the roadmap's organization.
