<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1714#issuecomment-6443977033 -->
Red team round 2 pass a (codex) of 6ea72ea

Verdict: needs_changes

1. **F01** (P3) Distinguish topological closure from conical generation

   **Location:** packages/RootSystemsPartII/README.md:88: “A topological cone closure would admit half a simple root.”

   **Claim:** The negative-control Check attributes admission of half a simple root to topological closure. It does not define an additional operation of taking a real conical hull.

   **Witness:** In A₁, Q⁺=ℕα is closed in ℝα, so its topological closure still excludes α/2. The real conical hull is ℝ≥0α and includes α/2. These operations give different answers.

   **Exact repair text:** Replace the last sentence by: “The real conical hull of the simple roots admits half a simple root and is therefore larger than Q⁺. In A₁, topological closure alone leaves Q⁺ = ℕα unchanged.”

   **Retest:** Identify α with 1. Native monoid membership of 1/2 is false; membership in its topological closure is false; membership in the real conical hull is true. The replacement names the operation that actually changes the integral budget.

   No earlier finding remains actionable at this head. No new false headline statement or unowned prerequisite was found.

## Earlier findings: verification at this head

All package locators below refer to packages/RootSystemsPartII/README.md unless explicitly marked Suggested.lean. Earlier ids are the F ids in the supplied reviews.

| Earlier finding | Status | Repaired passage (at most 40 words) | Witness recomputed |
| --- | --- | --- | --- |
| r1a F01, unspecified full-period Check | Repaired | :314: “The four-term sum of iterates starting at α₁ (period 4) is 2(α₁ + α₂)” | δ=2f; distinct sum f gives coefficient 2; period-four sum 2f gives coefficient 1; period-two sum f gives coefficient 2. |
| r1a F02, uniqueness already pinned | Repaired | :154: “the evaluation fields identify their perfect pairings and the root-vector fields identify their root embeddings, so `RootPairing.IsRootSystem.ext` identifies the two root pairings” | A₃ fold has Gram [[4,−2],[−2,2]], Cartan [[2,−2],[−1,2]]; the proposed alternative sends β₂ to β₂+2β₁, squared norm 10, outside the eight roots. |
| r1b F01, nonexistent continuations | Repaired | :13: “they extend RootSystems in other directions, and none of them supplies an ingredient here.” | Neither deleted roadmap name remains in README or Suggested.lean; no dependency is assigned to them. |
| r1b F02, missing root-span adapter | Repaired | :341: “Prove that P_E is reduced and crystallographic, that b's support with b's fields restricted is a base of P_E” | GL₂: E=E′=ℝ(1,−1), restricted evaluation 2; pairing E against all ℝ² instead has a nonzero central kernel. Empty system gives E=E′=0. |
| r1b F03, unnecessary endpoint integrality | Repaired | :94: “no integrality of the endpoints is needed”; Suggested.lean:31–38,178–193,200–220,226–247 contain no endpoint-integrality assumptions. | A₁: λ=α/10, μ=11α/10, coroot values 1/5,11/5; β=α gives μ and remaining budget 0. A₂: λ=f/2, μ=3f/2; f gives dominant values (3/2,3/2), budget 0. |
| r1b F04, unnecessary subgroup stability | Repaired | :337: “Neither σ-stability of L nor integrality of L or of the endpoints is assumed” | GL₂: σ fixes root line and doubles center; σ(1,0)=(3/2,1/2)∉ℤ², but 0→(1,−1) has increment in ℤ² and residual 0. |
| r1b F05, uniqueness already pinned | Repaired | :154: “Coroot-by-coroot, the same uniqueness is `Module.Dual.eq_of_preReflection_mapsTo` applied to the finite spanning folded root set.” | Same A₃ calculation as r1a F02; for the empty system both pairings have zero carrier and equal evaluations. |
| r1b F06, tree-center dichotomy | Repaired; repair report's dispute is justified | :205: “fixes some vertex of the centre (this includes a two-vertex centre fixed pointwise, as for the D₅ fork exchange)” | D₅ center {2,3} is fixed pointwise; fixing 2 is already the first alternative. A₄ reversal swaps center {2,3}; A₃ reversal fixes center {2}. |
| r1b F07, rootLE/fixedSpace padding | Repaired | Suggested.lean:35: “mu - lam ∈ TauCeti.posRootCone P b”; :64: “LinearMap.fixedSubmodule sigma.weightMap” | Both declarations are absent. In A₂, (λ+f)−λ=f, and fixed vectors satisfy (x₂,x₁)=(x₁,x₂), hence x₁=x₂. |

The uniqueness repairs use the actual pinned `RootPairing.IsRootSystem.ext` (Mathlib/LinearAlgebra/RootSystem/Basic.lean:197; finite indices at :81) and `Module.Dual.eq_of_preReflection_mapsTo` (Mathlib/LinearAlgebra/Reflection.lean:339). The latter needs characteristic zero, a domain, a torsion-free module, a finite spanning set, and the value 2 on the reflected root. All hold here. Native `RootPairing.Base` has only support as data (Mathlib/LinearAlgebra/RootSystem/Base.lean:68); all remaining fields are propositions.

For the restriction repair, Mathlib/LinearAlgebra/RootSystem/BaseChange.lean:71 constructs the pairing on both spans, :92 supplies spanning, :110 and :114 identify the embeddings, :118 identifies Cartan pairings, and :126 specializes to crystallographic pairings. Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean:59 supplies the standing Fintype; :304 supplies balancedness; :407 supplies ordered-field anisotropy. The README now explicitly chooses `Fintype.ofFinite`. Its new adapter includes the missing base, reducedness, automorphism and cone/chamber comparisons. No new false statement was found in the repairs. The tree-center finding was disputed, not marked “not actionable in this package”; its original D₅ witness was already in the fixed-vertex alternative. No finding is re-raised.

## Verified sound

Read all **391 README lines** and all **250 Suggested.lean lines**, plus the content repository's README.md and CONTRIBUTING.md. Counts: **15 declarations** (4 definitions, 1 structure, 10 admitted theorems); **13 numbered sections with 16 principal target blocks** (the two §3.1 statements and three §4.4 targets counted separately); **57 Check bullets** recomputed below (56 retained, one clarified by S01); **17 source-locator units** checked in **3 works**; **12 distinct cross-roadmap section/target contracts** checked across **4 roadmaps**. The README uses subsection headings rather than bold target labels; all targets, API bullets, conventions and worked examples are included in the tables below.

The ten headline theorems are the ordinary step; the fixed Weyl-group isomorphism; nonsimply-laced rigidity; the simply-laced diagram dichotomy; existence of the general fold; weight/chamber transport; integral cone/lattice transport; the invariant step; the ambient step; and its torsion-lattice lift. All ten are stated on the actual carriers in Suggested.lean. The orthogonal and adjacent constructions are branches of general fold existence; component transport and the new root-span restriction are construction adapters. No additional missing headline was identified.

Compared every declaration with the supplied elaborated `#check @` signature and its README context. No binder was dropped. This review did not run Lean or repeat the supplied elaboration. Every theorem has its own explicit finite/reduced/crystallographic hypotheses; spanning is absent precisely from the ordinary and ambient steps, and is present for the fold. The four definitions and the structure use only native carriers and real bodies; each is used by a headline. The one-tactic probe found no remaining admitted API lemma, Check, boundary computation or definitional restatement among the ten theorems. The diagram results exceed the three pinned numbered rigidity cases. Cone transport still requires coefficient regrouping across orbits, rather than merely unfolding a definition.

The board head is 6ea72ea; content main is 93233955c98fa57e4dc8fcbb3cf7faa65d2cc6d8. The library checkouts match the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. All 63 distinct dotted library names in the README were resolved at these pins, with their declaration and section hypotheses read. The imports are `Mathlib` and the two existing Tau Ceti modules actually used. There are exactly ten theorem sorries, no sorry'd data, no `lemma`, no `set_option`, no placeholder condition and no computational algorithm in the package targets. All 15 local declaration names occur in the README. The package diff is confined to its folder: README.md, Suggested.lean, metadata.toml, sources.toml and two prior reports. The declared gaps list is empty.

Dependency output:

```text
depcheck: 149 roadmaps, 1008 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The citation resolver reports no unresolved roadmap citation or Lean name; its library coverage is explicitly absent, so the pinned-library audit was done directly. RootSystemsPartII follows ReductiveGroupsPartII in merge-order/ORDER.txt. No supplier is a later board roadmap, and none of the cited suppliers imports this roadmap. §4.4's restriction adapter supplies its local root-span prerequisite; it does not feed a proof of its own native construction. The references to it in the supplier explanations do not make Layers 1–3 depend on the ambient theorem.

### Supplier resolution and ownership

| Current supplier file and locator | Contract checked | Computed convention / result |
| --- | --- | --- |
| TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:218, Layer 1 | Positive-root descent, inversion exchange, finite faithful Weyl action | A₂ has 3 positive roots, Weyl order 6; a simple right descent lowers inversion count by 1. |
| Same file:245, Layer 2 | Simple generation and finite Coxeter presentation | A₂ Cartan product 1 gives Coxeter order 3; the new fixed-group theorem uses block products. |
| Same file:296, Layer 4 | Closed chamber and stabilizers | A₁ positive x has trivial stabilizer, x=0 has stabilizer of order 2. |
| Same file:321, Layer 5 | Valid finite Cartan classification | B₂ and C₂ are one valid class; A₀ is not the nonempty irreducible case. |
| Same file:356, Layer 6 | Numbered type-A datum and graph action | A₂ reversal interchanges Fin 2 indices 0 and 1; integral root lattice index in weights is 3, so only a real identification is used. |
| TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:370, Layer 2 | Module-weight integrality | Original A₂ simple-coroot values (1/2,1/2) fail integral-weight membership; package does not construct that module dictionary. |
| Same file:773, Layer 6 | Integral weight/character dictionary | The A₂ folded value 1 does not imply the original values are integral; no reverse dictionary is claimed. |
| TauCetiRoadmap/ReductiveGroups/README.md:1339, §9A.1b, Signed orbit modules and brackets | Invariant simple-root lattice; component restriction and diagonal inverse (:1353) | Two swapped A₁ components: D(tα)=(tα,tα), projection returns tα; no division by 2 in lattice coefficients. |
| Same file:1371, Folded frame, finite Cartan and presentation | ADE root pairing/base and H-row convention | A₃ projected H-row matrix [[2,−2],[−1,2]] transposes to projected root rows; distinct sums instead give root-row [[2,−2],[−1,2]]. |
| Same file:1457, Exceptional certificates, types and components | Distinct/projected/full sum, coroot and lattice maps (:1486) | A₄ projected H-row entries (−1,−2), distinct-sum root-row entries (−2,−1); orbit sizes 2 and 1 must remain distinct. |
| TauCetiRoadmap/ReductiveGroupsPartII/README.md:2421–2431, §RG2.1.4, Minuscule coweights and the dominance order, supplied open head | Natural simple-coroot monoid convention | PGL₂ 2−0∈2ℕ, 1−0∉2ℕ. |
| Same file:5993–6038, §RG2.4.3, Dominant inertia-coinvariant cocharacters | Actual torsion-sensitive cocharacters, échelonnage coroot lattice and based action | Realization of (0,1) and (0,0) is equal in ℤ⊕ℤ/2, but exact integral differences distinguish them; all lift/injectivity/equivariance assumptions remain explicit. |

Ownership searches by object used the roadmap service over its indexed main and open heads, and direct searches in board packages: orbit sums, folding, component return, invariant simple-root bases, fixed Weyl groups, root-span restriction and Stembridge steps. The relevant existing owner is ReductiveGroups §9A.1b, which is cited. Other orbit-sum hits concern characters, CM traces, divided powers or invariant rings. This roadmap owns the general real-pairing adapters, nonsimply-laced component extension, diagram dichotomy, root steps and ambient/torsion export. The service search for the namespace and headline names found no colliding fully qualified declaration. Existing-roadmap revision heads were not substituted for main as suppliers. New roadmap ownership was checked against the available open-head index and all 163 supplied local head directories; unavailable, unprovided sibling contents are not certified.

Native object checks included: `RootPairing` has a perfect pairing and reflection permutations, but no finite/reduced/spanning assumptions (Mathlib/LinearAlgebra/RootSystem/Defs.lean:81); `Base` includes finite support, independence on both sides and signed monoid expansions (:68 of Base.lean). `TauCeti.posRootCone` is algebraic monoid closure (TauCeti/LinearAlgebra/RootSystem/Positive.lean:280); `dominantChamber` requires nonnegative simple-coroot values (Chamber.lean:137). The additive closures are generated by `to_additive` from Mathlib/Algebra/Group/Subgroup/Lattice.lean:329 and Mathlib/Algebra/Group/Submonoid/Basic.lean:112; neither is topological closure. `RootPairing.Hom` has the contravariant coroot equation (Hom.lean:75). The root-span central splitting is also supported by `RootPairing.isCompl_rootSpan_ker_rootForm` and `ker_rootForm_eq_dualAnnihilator` in Finite/Nondegenerate.lean; the README's simple-coroot version follows by the base expansions.

### Declaration and context inventory

All locations in this table are in packages/RootSystemsPartII/Suggested.lean. B denotes independent universes for ι,M,N, additive commutative real modules M,N, and a native pairing P. F adds finite ι; R adds reduced and crystallographic; S adds spanning on both sides; I adds irreducible and nonempty root indices; A adds a specified automorphism preserving the simple support in both directions; FD adds finite dimensionality of the ambient modules. The separate torsion-group universe is independent of these. Every row was compared with its supplied elaborated type.

| Declaration, line, section | Context | Instances and computed values on both sides | Result / change |
| --- | --- | --- | --- |
| stembridge_step, 31, §1.2 | B+F+R; b, dominant λ≠μ, μ−λ∈Q⁺; no S/integrality | A₂: λ=0, μ=(1,1), β=(1,1); new pairings (1,1), residual (0,0). Simple candidates give (2,−1),(−1,2). A₁: α/10→11α/10, values 1/5→11/5; β=α, residual 0. | Sound; no further change. |
| orbitIndices, 44, §2.1 | B+F, arbitrary σ,i | id: {i}, size 1; A₂ simple reversal: {1,2}, size 2; D₄ outer triality: {1,3,4}, size 3; unbased A₁ negation: {α,−α}, size 2. | Real finite-range body; no basedness is falsely inferred. |
| orbitSum, 49, §2.1 | B+F, arbitrary σ,i | Corresponding sums α, f, α₁+α₃+α₄, 0. Six triality terms give 2βₒ, whereas distinct sum gives βₒ. | Zero for unbased negation is allowed by the definition; positivity laws use basedness. |
| foldedIndices, 55, §2.1 | B+F, arbitrary σ | A₂: four root orbits map to {f,−f}, size 2. A₁⊕A₁ identity gives four vectors, excludes α₁+α₂. Empty roots give ∅; unbased A₁ negation gives {0}. | Image subtype removes duplicates; no realization is promised for unbased input. |
| OrbitSumRealization, 61, §2.2 | B+F, b,σ; explicit native pairing/base and S/R/evaluation/root/support fields | A₃: fixed dimension 2, roots 8, Gram [[4,−2],[−2,2]], Cartan [[2,−2],[−1,2]]. Empty spanning input gives dimension 0 and ∅. Empty nonspanning torus with σ=id has dimension 1 and no realization. | Fields fix the actual root vectors and coroots; existence theorem has S. |
| fixedWeylGroup, 84, §2.3 | B, arbitrary σ; no F/S | Identity A₂ centralizer in W is S₃, order 6, while pointwise stabilizer of E is {1}; rank zero gives order 1. Unbased A₁ negation centralizes both Weyl elements although fixed space is 0. | Correct centralizer preimage. |
| fixed_weyl_group, 91, §2.3 | B+F+R+S+A, simply laced, horth, F-realization | A₃: 8=8, block s₁s₃ sends β₁↦−β₁, β₂↦β₂+β₁ on both sides. D₄: 12=12, outer block sends β꜀↦β꜀+βₒ. Empty: 1=1. | Sound actual-action equation; unbased test excluded. |
| indexEquiv_eq_self_of_multiple_edge, 109, §3.1 | B+F+R+S+I+A, not simply laced | B₂ proposed swap changes (−2,−1) to (−1,−2); G₂ changes (−3,−1) to (−1,−3). B₃ reverse moves the unique double edge. Allowed identity fixes 8,12,18 roots respectively. | General rigidity exceeds the three numbered supplied cases. |
| simpleOrbit_pairing_eq_zero_or_typeA_even, 121, §3.1 | B+F+R+S+I+A, simply laced | A₃ orbit pairing 0 gives first branch; A₂ pairing −1 gives n=1, i↦1−i; A₄ gives n=2, i↦3−i. D₄ outer pairings all 0; D₅ fork leaves pairing 0. | Reversal equation applies to every simple image by hbase; n=0 excluded. |
| general_fold, 138, §3.4 | B+F+R+S+A | A₂→2, A₄→8, A₆→18, D₄→12, E₆→48 folded roots; B₂ identity→8; A₁⊕A₁ identity→4, swap→2; empty→0. | Sound; native realization, no stand-in. |
| invariant_weight_transport, 150, §4.1 | B+F+R+S+A; any realization, fixed x | A₂ x=f: original (1,1), folded 2; x=f/2: (1/2,1/2),1; x=−f: (−1,−1),−2; x=0:0,0. A₃ values (d,e,d)↦(d,e). | Both chamber directions and forward integrality hold; reverse integrality is absent. |
| invariant_cone_transport, 164, §4.2 | B+F+R+S+A; realization, fixed x; no endpoint integrality | A₂ 2f has coordinates (2,2)↔2; f/2 has (1/2,1/2)↔1/2, outside both monoids/lattices; −f is in both lattices and neither monoid; 0 is in all four. | Exact natural/integer coefficients, no saturation. |
| invariant_step, 178, §4.3 | B+F+R+S+A; fixed dominant λ≠μ, exact budget | A₂ f/4→5f/4: original pairings 1/4→5/4, β=f, residual 0. D₄: good θ=(1,2,1,1) gives 0 residual; bad orbit (1,3,1,1) gives (0,−1,0,0). | Existential choice survives nonintegral endpoints and rejects arbitrary eligible orbit. |
| ambient_coroot_step, 200, §4.4 | B+F+R+FD+A; L contains roots; fixed dominant λ,μ∈L, exact budget; no S/stability/integrality | GL₂ (c,c)→(c+1,c−1), β=(1,−1), sums 2c=2c. Nonstable ℤ² with central ×2 still allows 0→(1,−1). PGL₂ 0→2 uses 2; 0→1 fails budget. | Central equality follows from root-span increments; no missing central hypothesis. |
| torsion_lattice_coroot_step, 226, §4.4 | B+F+R+FD+A; A additive commutative, r,f,τ; realization, injectivity on root subgroup, both equivariances; actually fixed endpoints and lifted budget | ℤ⊕ℤ/2, r=(2,0): (0,1)→(2,1), β=(2,0), residual 0. ℤ⊕ℤ/3: (0,2)→(2,2), same β and residual, torsion 2 retained. (0,0)→(0,1) fails lifted budget. | Fixedness and residual equality hold in A, not only after realization. |

### README target and API inventory

Locations in the following three tables refer to packages/RootSystemsPartII/README.md. The principal headline rows above also test their README statements. This table covers the remaining construction targets and every API bullet individually. “Retain” means the tested statement survives; it does not assert a Lean proof was run.

| Statement / location | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| §1.1, :73, integral order | A₁, empty base | 2α−0=2α∈ℕα; α/2∉ℕα; empty-base difference must be 0 | Retain. |
| :75, coordinate criterion | A₂ | (1,1)−(0,1)=(1,0)=1α₁+0α₂ | Retain. |
| :76, partial-order laws | A₁; rank zero | 0≤α≤2α has combined coefficient 2; α≤0 is false; in rank zero x≤y forces y−x=0 | Retain. |
| :77, translation | A₁ with central coordinate | ((3,7)+(2,5))−((1,7)+(2,5))=(2,0)=(3,7)−(1,7) | Retain. |
| :78, based equivalence | A₂ node reversal | Difference (1,0) becomes (0,1); both natural. Difference (1,−1) becomes (−1,1); neither natural | Retain both directions. |
| :79, integer coordinate order | A₂ | a=(−2,1), b=(0,3): b−a=(2,2), true on both sides; b=(−3,3): difference (−1,2), false on both | Retain. |
| :80, rational comparison | PGL₂ | 1=(1/2)·2 in rational ray; no n∈ℕ with 2n=1. Difference 4=2·2 has integral coordinate 2 | Retain necessity of integral coordinates. |
| :81, flip | PGL₂ cocharacters | Simple coroot 2 generates 2ℕ; root order on flipped pairing also gives 2ℕ | Retain. |
| :121, orbit-set laws | D₄ triality | Starting at 1,3 or4 gives {1,3,4}; applying σ gives same set; cardinality 3>0 | Retain. |
| :122, fixed representative-independent sum | A₂ reversal; fixed θ | σ(α₁+α₂)=α₁+α₂; singleton θ has sum θ=f | Retain. |
| :123, period formula | D₄; unbased A₁ negation | m=6,d=3: full=2βₒ=(6/3)βₒ. Unbased m=4,d=2 gives 0=2·0, so equality need not force m=d | Retain stated cancellation exception. |
| :124, positive nonzero sum | A₂ reversal | Sum (1,1) has height 2>0, both coefficients nonnegative; unbased ±α sum0 fails basedness | Retain. |
| :125, intertwining transport | Two relabelled A₂ copies | e(α₁+α₂)=eα₁+eα₂; both orbit sizes 2, sums coordinates (1,1) | Retain. |
| :126, orbit-image index | A₂ reversal | Positive orbits {α₁,α₂} and {θ} both map to f; 2 positive orbits become 1 positive vector | Retain image, reject orbit quotient as injective root family. |
| §2.2, :139–143, orthogonal construction/form | A₃; D₄ | Norms (4,2), edges 2, entries −2/1=−2 and −2/2=−1; triality norms (6,2), edges3, entries −3,−1 | Retain. |
| :145, root image and positive lifts | A₃ | 8 image vectors, 4 positive; β₁+2β₂ has lift α₁+α₂ whose two-element orbit sums to it | Retain. |
| :146, simple basis and signs | A₃ fold | Positive coordinates (1,0),(0,1),(1,1),(1,2); negative roots are their negatives | Retain. |
| :147, evaluation and embedding | A₁ | f(α)=1 and f(2α)=2; zero pairing gives0≠1; changed root2α differs from indexed α | Retain; wrong models excluded. |
| :148, realization uniqueness | A₃ | Gram fixes coroot entries −2,−1; alternative −2 in reverse entry gives vector β₂+2β₁ of norm10, not a root | Retain pinned uniqueness adapter. |
| :149, denominator orientation | A₃ | 2(β₁,β₂)/‖β₂‖²=−4/2=−2; reversed denominator gives−4/4=−1 | Retain. |
| :150, block reflection | A₃ | s₁s₃β₁=−β₁; s₁s₃β₂=β₂+β₁, equal to folded reflections | Retain. |
| :151, identity/empty compatibility | A₁; empty | Orbit sums {±α}={original roots}; empty roots yield ∅=∅ on0 | Retain via the specified based identification. |
| :152, functorial equivalence | A₃ node relabelling | Outer sum maps to outer sum; Gram entries 4,−2,2 remain 4,−2,2 | Retain. |
| :172, fixed-vector membership | A₂ reversal | σ(t,t)=(t,t); σ(1,−1)=(−1,1)≠(1,−1) | Retain. |
| :173, fixed submodule operations | A₂ | (1,1)+(2,2)=(3,3); 3(1,1)=(3,3); σ fixes both; σ0=0 | Retain. |
| :174, inclusion/image | A₂; id A₁ | Inclusion maps (t,t) to the same vector and is injective; under id, fixed submodule=ℝα | Retain. |
| :175, fixed Weyl membership | A₂ id; A₃ reversal | Under id all6 elements commute; A₃ commuting subgroup contains8 of24 Weyl elements | Retain. |
| :176, subgroup inclusion/action | A₁ | Included reflection has square1, acts α↦−α; identity acts α↦α on both carriers | Retain. |
| :177, closure and fixed-space action | A₃ | w=s₁s₃ has w²=1, w⁻¹=w; on fixed β₂ it gives β₂+β₁, still fixed | Retain. |
| §3.2, :218–220, adjacent-A construction | A₂,A₄,A₆ | Image sizes 2,8,18 equal 2n² for n=1,2,3; middle norms2; 2fᵢ absent | Retain. |
| :222, full image description | A₄ | ±f₁,±f₂ supply4 roots; ±f₁±f₂ supply4 more; total8, with ±2fᵢ absent | Retain. |
| :223, simple base | A₄ | β₁=f₁−f₂, β₂=f₂; f₁=β₁+β₂, f₁+f₂=β₁+2β₂ | Retain integer signs. |
| :224, weight multiplier | A₂ | λ=f gives original(1,1), folded2; λ=f/2 gives(1/2,1/2), folded1 | Retain multiplier2. |
| :225, two positive short lifts | A₄ | (e₁−e₃)+(e₃−e₅)=e₁−e₅=f₁, equal to singleton-root sum | Retain. |
| :226, transport across choices | A₂ reversal-compatible relabelling | Relabelling exchanges α₁,α₂ and leaves f fixed; both choices have folded Cartan [2] | Retain. |
| §3.3, :239–241, component construction | B₂ swap; two D₄ with triality return | B₂ norms(4,2)↦(8,4); D₄ norms(6,2)↦(12,4); entries unchanged (−2,−1),(−3,−1) | Retain extension beyond ADE. |
| :243, inverse | Two A₁ components | D(tα)=(tα,tα); projection∘D(tα)=tα; D∘projection(tα,tα)=(tα,tα) | Retain. |
| :244, orbit transport | Two D₄ with triality return | Return outer orbit size3 becomes6, central singleton becomes2; Dβ is the corresponding full distinct vector in both cases | Retain. |
| :245, form scaling | Two D₄ | Outer norm12=2·6, central norm4=2·2, mutual product−6=2·(−3) | Retain. |
| :246, natural coefficients | Two B₂ components | D(2β₁+3β₂)=2Dβ₁+3Dβ₂; coefficients2,3 unchanged despite norm factor2 | Retain. |
| :247, change of start | Three cycled A₁ components | D(tα)=(tα,tα,tα); moving starting slot byσ produces the same triple; both return maps id | Retain. |
| :248, empty assembly | No components | Empty direct sum=0; empty union of roots=∅; no length0 cycle used | Retain. |
| :265, general root image/lifts | Identity B₂; A₂ reversal | B₂ positive roots4 map identically; A₂ positive image {f} has both simple-pair and highest-root lifts | Retain. |
| :266, orbit-simple base | A₁⊕A₁ swap | Two original simples yield one β=(1,1); invariant coordinates(t,t) have unique folded coefficient t | Retain. |
| :267, branch agreement | A₃,A₄,B₂,two D₄ | Fold counts8,8,8,12 and entries(−2,−1),(−2,−1),(−2,−1),(−3,−1) match the branch constructions | Retain. |
| :268, intertwined equivalence | A₁⊕A₁ swap, interchange component names | β=α₁+α₂ maps to α₂+α₁=β; fixed root pair {±β} unchanged | Retain. |
| :269, empty general fold | Empty spanning input | E^σ=0, roots=∅, base=∅ | Retain. |
| :270, root-lattice inclusion/equality later | A₂ reversal | Folded nf embeds as original(n,n); all invariant integral pairs have this form, index1 in Q^σ | Retain. |
| §4.4, :341, root-span adapter | GL₂; empty | E=E′=ℝ(1,−1), Cartan[2] in both; on empty input E=E′=0 | Retain native restriction plus explicit adapters. |
| :343, restricted perfect pairing | GL₂ | Pairing of t(1,−1),s(1,−1) is2ts before and after; pairing against all ofV∨ would have kernelℝ(1,1) | Retain. |
| :344, transferred axioms/base/action | GL₂ σ fixes roots, doubles center | P_E roots±α, reduced; Cartan[2] integral; support singleton unchanged; restricted weight/coweight maps both id | Retain. |
| :345, chamber/monoid equality | GL₂ x=t(1,−1) | Dominance iff2t≥0 on both; root cone iff t∈ℕ on both; t=−1 and t=1/2 distinguish chamber and integral cone | Retain both directions. |

### Convention and proof-route tests

| Convention / route | Instance and computed values | Result / change |
| --- | --- | --- |
| :17, spanning default versus ambient exceptions | Empty spanning input forces M=N=0; GL₂ ambient roots span dimension1 in dimension2 | The exceptions in §§1.2,4.4 are explicit and necessary. |
| :17, numerical integrality and closed chamber | A₂ f/2 has evaluations(1/2,1/2), dominant but not integral; 0 has evaluations(0,0), dominant | No integrality assumed outside §4.1's implication; walls retained. |
| :19, root rows/coroot columns | A₃ outer-first entries−2,−1; supplier projected H rows require the transpose before normalizing roots | Compatible with both suppliers and Lean. |
| :19, forward/contravariant action | D₄ weight map 1→3→4→1; coweight map3→1,1→4,4→3 | Inverse coweight map is the forward coroot action; dualization reverses the original weight map. |
| :21, canonical versus normalized form | A₁ α∨(α)=2: RootForm(α,α)=2²+(−2)²=8; normalized displayed norm2 needs scale1/4 | README explicitly rescales for displayed lengths. |
| :21, positivity only on root span | GL₂ α=(1,−1), z=(1,1): RootForm(α,α)=8, RootForm(z,z)=0 | No ambient positive-definiteness overclaim. |
| :21, full versus distinct period | D₄ m6,d3 gives full2β; m0 gives0 but is excluded; A₂ fixed θ has d1, period2 gives2θ | Period and lift are both fixed in every numerical comparison. |
| :96, maximal-root proof without integrality | A₂ λ=f/2, μ=3f/2: simple candidates have a −1/2 evaluation; maximal θ gives(3/2,3/2), unused coefficients0 | Root budget, not endpoint integrality, drives maximality. |
| :156, height descent | A₃ orbit of α₁+α₂ has sumβ₁+2β₂, original height4; middle reflection sends it toβ₁, height2; outer block then gives−β₁ | Exceptional sign change occurs at the block simple root; no use of fixed-Weyl theorem. |
| :179, block inversion exhaustion/injectivity | D₄ longest element has12 inversions; right outer block gives9, exactly12−3. A₃ ρ=(3/2,2,3/2) has evaluations(1,1,1), is fixed and strictly dominant | Existing inversion and wall-stabilizer interfaces suffice. |
| :205, tree classification | D₅ center{2,3}, fork swap fixes both; A₄ swaps center{2,3}; D₄ order3 fixes branch | No gap from the disputed D₅ example. |
| :220, coordinate transport/lattice distinction | A₂ simple roots in fundamental coordinates are(2,−1),(−1,2), determinant3; real determinant3≠0, integral index3≠1 | Real equivalence is allowed; integral equality is not asserted. |
| :241, component descent | Identity A₁⊕A₁ roots are(±1,0),(0,±1); (1,1) is not a root; cross-block pairings0 | Component root set is a union; positive monoid is larger. |
| :295, chamber multiplier in a cycle | Two adjacent A₂ components: original simple orbit has4 members and sum norm4; orthogonal prediction8; folded evaluation2d | General adjacent orbit still has factor2, not factor4 or1/2. |
| :310, invariant coefficients | δ=(2,2) under A₂ swap gives original coefficients2,2 and single folded coefficient2; δ=(1/2,1/2) gives1/2 on both | No division by orbit size; natural/integer assertions remain exact. |
| :339, central projection | GL₂ p(a,b)=((a−b)/2,(b−a)/2); p(c,c)=0, p(c+1,c−1)=(1,−1); both original centers(c,c) | Projection need not land in L; only the root increment must. |
| :355, torsion lift and injectivity | A=ℤ⊕ℤ/2, r=(2,0): f(μ−λ)=2, so endpoints realize distinctly. A hypothetical lift r=(2,1) is still injective on its cyclic subgroup and step(2,1) stays in the exact lifted monoid | No choice of a torsion-free global splitting is used. |
| Total-function and type boundaries | Fin(2n) reversal at n1 gives0↔1; n0 excluded in exceptional case. Empty orbit-index type has no i to evaluate; every actual orbit has d≥1 | No natural subtraction/division junk value is used. |
| Other adversarial classes | ℝ has2≠0 and3≠0; the zero module admits roots only with empty index because pairing(root,coroot)=2; a nontrivial characteristic-p field cannot replace the scalar field ℝ | These cases do not inhabit the theorem signatures. Finite groups S₃ and the trivial/cyclic cases are tested above; nonabelian A is excluded by AddCommGroup. Scheme, DVR, inseparability, topology and compactness conditions are absent from these algebraic signatures. |

### All README Checks

Here f=α₁+α₂ in A₂. These are the 57 individual Check bullets, including those added by repair. The worked examples repeat the same values at :109, :193, :283, :369 and :381–385; no different normalization occurs there.

| Check / line | Instances and computed values | Result / change |
| --- | --- | --- |
| C01 :85 | PGL₂: 2∈2ℕ, 1∉2ℕ, 1=(1/2)·2 in the rational ray | Retain. |
| C02 :86 | Empty support: Q⁺={0}; x≤y iff y−x=0; central z≠0 has zero coroot evaluations but z∉Q⁺ | Retain. |
| C03 :87 | A₂ differences (1,0), (1,−1), (−1,1); only the first is inℕ² | Retain. |
| C04 :88 | A₁: 0∈ℕα; α/2∉ℕα; topological closure ofℕα isℕα; real conical hull containsα/2 | S01 specifies conical generation. |
| C05 :100 | A₂ simple increments give(2,−1),(−1,2); f gives(1,1), residual0 | Retain. |
| C06 :101 | PGL₂: step2, residual0; candidate1 leaves1∉2ℕ | Retain. |
| C07 :102 | Equal endpoints:0 budget; any positive root has some positive coefficient; empty base gives no strict comparable pair | Retain. |
| C08 :103 | A₁: λ=α/10, μ=11α/10, evaluations1/5,11/5; stepα, residual0. Differenceα/2 has no natural coefficient | Retain repaired generality. |
| C09 :130 | Identity orbit{i}, sumα; arbitrary period2 sum2α≠α | Retain. |
| C10 :131 | A₂: distinct sumf; averagef/2 has coefficients(1/2,1/2), not integral | Retain. |
| C11 :132 | D₄: distinct outer sum(1,0,1,1); six terms(2,0,2,2)=2βₒ | Retain. |
| C12 :133 | A₂: orbit{α₁,α₂} and singleton{f} both givef, so orbit map is not injective | Retain. |
| C13 :160 | A₃: norms4,2, mutual−2, Cartan−2,−1, eight roots | Retain. |
| C14 :161 | D₄: norms6,2, mutual−3, Cartan−3,−1, twelve roots, product3 | Retain. |
| C15 :162 | A₂ middle pair has product−1; normf=2+2−2=2 versus orthogonal prediction4 | Retain negative control. |
| C16 :163 | Empty spanning input: dimension0, root count0; identity A₂ preserves all3 positive roots | Retain. |
| C17 :164 | A₁ evaluation1 atα,2 at2α; A₃ proposed β₂+2β₁ has norm10, absent from8 roots | Retain. |
| C18 :183 | A₃ centralizer size8, fixed dimension2; (s₁s₃)²=1, β₁↦−β₁ | Retain. |
| C19 :184 | D₄ fixed Weyl order12; longest-element inversion count12→11→10→9 under the three outer factors | Retain. |
| C20 :185 | A₂ id: conjugation-fixed group S₃ has6 elements, pointwise kernel on root space has1 | Retain nonabelian control. |
| C21 :186 | Rank zero: both group orders1, dimension0; A₁ id: fixed dimension1, Weyl order2 | Retain. |
| C22 :187 | A₂ fixed coordinates(t,t); (1,−1)↦(−1,1); identity inclusion sendsx tox | Retain. |
| C23 :209 | A₃ simple orbit{1,3}: off-diagonal0; middle singleton has no distinct pair | Retain. |
| C24 :210 | A₄ outer orbit pairing0, middle pairing−1; rank4=2·2 | Retain. |
| C25 :211 | D₄ outer pairings0, automorphism order3; D₅ fork leaves nonadjacent, pairing0; E₆ reversal fixes branch | Retain. |
| C26 :212 | B₂ swapped entries−1,−2 differ from−2,−1; G₂−1,−3 differ from−3,−1 | Retain. |
| C27 :230 | A₂ image{±f}; x=f has original(1,1), folded2; orthogonal formula wrongly gives1 | Retain. |
| C28 :231 | A₄ roots4 short+4 long=8; simple norms4,2 and inner−2 give−2,−1 | Retain. |
| C29 :232 | A₂ image has coordinates±(1,1); ±(2,2) absent | Retain reducedness control. |
| C30 :233 | A₄ pair(e₁−e₃)+(e₃−e₅)=e₁−e₅; singleton gives the samef₁ | Retain. |
| C31 :252 | Two B₂: original16 roots,8 folded; norms4,2→8,4, entries−2,−1 unchanged | Retain. |
| C32 :253 | c1: D(u)=u, form factor1; A₃ reversal still has order2 return | Retain. |
| C33 :254 | Two D₄: outer orbit6, central orbit2; norms12,4, mutual−6, entries−3,−1; folded count12 | Retain. |
| C34 :255 | Empty components:0 cycles, dimension0, roots0; no c0 denominator | Retain. |
| C35 :274 | B₂ id:8 roots unchanged; swapped oriented matrix differs | Retain. |
| C36 :275 | A₁⊕A₁ id:4 roots, (1,1) absent; swap:2 roots±(1,1) | Retain. |
| C37 :276 | A₄ fold8 roots containsf₂, excludes2f₂; middle norm2 rather than4 | Retain. |
| C38 :277 | D₄ fold12 roots, Cartan product3; G₂/F₄ swaps transpose the multiple edge | Retain. |
| C39 :299 | A₂ original(1,1)→folded2; f/2 original(1/2,1/2)→folded1 | Retain one-way integrality. |
| C40 :300 | λ0: all evaluations0≥0, so in both closed chambers; strict inequalities fail | Retain. |
| C41 :301 | A₃ original(d,e,d)→folded(d,e); c2 scales numerator and denominator by2, ratio unchanged | Retain. |
| C42 :302 | A₂ original(−1,−1)→folded−2, outside both chambers | Retain reverse direction. |
| C43 :314 | δ2f: original(2,2), folded2; startα₁,m4 gives2f, coefficient1; m2 givesf, coefficient2 | Retain repaired Check. |
| C44 :315 | f/2 coefficients1/2 on both bases: neither integral monoid; f coefficients1: both monoids | Retain. |
| C45 :316 | −f coordinates−1 in folded lattice and(−1,−1) original; in both lattices, neither monoid | Retain. |
| C46 :317 | Rank-zero spanning case: all lattices/monoids{0}; ambient GL₂ centralz=(1,1) has zero coroot values but lies in neither root monoid | Retain as explicitly ambient control for §4.4; no nonzero center inserted in the spanning carrier. |
| C47 :329 | A₂ 0→f: simple-pair orbit and fixed-highest orbit give identicalβf, residual0 | Retain. |
| C48 :330 | D₄ θ=(1,2,1,1): λ values(2,2,2,2), μ values(2,3,2,2). Bad root values(1,1,−1,−1), orbit sum(1,3,1,1), residual(0,−1,0,0). θ residual0 | Retain; source inference refuted, existential theorem survives. |
| C49 :331 | A₁ id orbit size1 and incrementα; empty-root Q⁺{0} forces endpoints equal | Retain. |
| C50 :349 | GL₂ root-span values2 and−2 before and after restriction; functional(1,1) vanishes on root line | Retain new restriction Check. |
| C51 :350 | Torus restriction E0, root count0, cone{0} in both | Retain. |
| C52 :351 | Spanning A₂ restriction has identical Cartan[[2,−1],[−1,2]]; rescaling pairing alone by2 changes diagonal2 to4 | Retain literal-pairing control. |
| C53 :359 | Torus σ(z)=2z has infinite order for nonzeroz; root cone{0}, so no distinct comparable endpoints | Retain boundary limitation; paired with nonvacuous GL₂ control. |
| C54 :360 | GL₂ λ(c,c), μ(c+1,c−1), β(1,−1): sums2c,2c,0; residual0 | Retain. |
| C55 :361 | PGL₂ 1∉2ℕ, while 1∈ℝ≥0·2 | Retain. |
| C56 :362 | ℤ⊕ℤ/2: λ(0,1)+β(2,0)=μ(2,1); pure torsion difference(0,1)∉ℕ(2,0) | Retain. |
| C57 :363 | τ(1,0)=(1,1)≠(1,0), τ(2,0)=(2,0); fτ=f but actual fixedness differs | Retain. |

Every kept definition has at least three discriminating controls: orbitIndices/orbitSum use identity, A₂ and D₄ periods; foldedIndices uses duplicate A₂ orbits, identity A₁⊕A₁ excluding cross-roots and the A₄ root count; realization uses A₃/D₄, the rejected adjacent case and evaluation/reflection negative controls; fixedWeylGroup uses nonabelian A₂, A₃ and D₄. The root-span adapter's three additional Checks distinguish the coroot span from the ambient dual, the empty system, and literal pairing preservation.

### Independent finite computations

Integer simple-reflection calculations generated the roots and distinct orbit sums independently of the desired fold theorem. Every listed folded set was checked for nonzero roots, reducedness, integer Cartan pairings and closure under its actual reflections. The computed fixed Weyl subgroups were checked for faithful restriction to the orbit-simple span. A dash means that group was not enumerated. Endpoint tests enumerated rational fixed λ and natural orbit-simple budgets with coefficients at most 2, retained only distinct dominant endpoint pairs, and found a qualifying positive-root orbit for every one of the **179** eligible pairs. These finite tests supplement the general proof-route audit; they are not proofs of the general statements.

| Input | Original roots | Root orbits | Distinct folded roots | Simple squared norms | Original Weyl order | Commuting Weyl order | Eligible endpoint pairs |
| --- | ---: | ---: | ---: | --- | ---: | ---: | ---: |
| empty | 0 | 0 | 0 | empty | 1 | 1 | 0 |
| A1 id | 2 | 2 | 2 | 2 | 2 | 2 | 6 |
| A2 id | 6 | 6 | 6 | 2,2 | 6 | 6 | 16 |
| A2 reversal | 6 | 4 | 2 | 2 | 6 | 2 | 6 |
| A3 reversal | 12 | 8 | 8 | 4,2 | 24 | 8 | 11 |
| A4 reversal | 20 | 12 | 8 | 4,2 | 120 | 8 | 11 |
| A5 reversal | 30 | 18 | 18 | 4,4,2 | — | — | 12 |
| A6 reversal | 42 | 24 | 18 | 4,4,2 | — | — | 12 |
| D4 triality | 24 | 12 | 12 | 6,2 | 192 | 12 | 1 |
| D5 fork | 40 | 32 | 32 | 2,2,2,4 | — | — | 2 |
| E6 reversal | 72 | 48 | 48 | 4,2,4,2 | — | — | 0 |
| B2 id | 8 | 8 | 8 | 4,2 | 8 | 8 | 11 |
| G2 id | 12 | 12 | 12 | 6,2 | 12 | 12 | 1 |
| F4 id | 48 | 48 | 48 | 4,4,2,2 | — | — | 0 |
| A1+A1 id | 4 | 4 | 4 | 2,2 | 4 | 4 | 72 |
| A1+A1 swap | 4 | 2 | 2 | 4 | 4 | 2 | 6 |
| B2+B2 swap | 16 | 8 | 8 | 8,4 | — | — | 11 |
| D4+D4 triality return | 48 | 12 | 12 | 12,4 | — | — | 1 |

### Source-locator audit

Only the three legally cached works in sources.toml were needed. The author-note/preprint versions are the versions actually cited. All mathematical statements in this report are paraphrases or computations, not copied source passages. An equation range counts as one locator unit.

| Unit | Exact locator and cache witness | Comparison performed |
| --- | --- | --- |
| L01 | Rap00 §1, (1.8), printed p.154; Rap00 line 64–72 | Coefficients are nonnegative integers; difference1 in PGL₂ is excluded. |
| L02 | Rap00 §2, PGL₂ case, printed p.157; Rap00 line 172 | Cocharacter groupℤ, positive coroot2. |
| L03 | Rap00 Lemma 2.3, printed p.157; Rap00 line 191–194 | Distinct comparable dominant endpoints admit the positive-coroot step; source notation slip recorded below. |
| L04 | Rap00 (2.10)–(2.13), printed pp.157–158; Rap00 line 195–214 | Maximal-root proof uses finite integral difference coefficients and signs, not endpoint integrality; opposite roots are excluded by positivity. |
| L05 | Stem08 condition(1), printed p.1; Stem08 line 12–22 | Simple-orbit orthogonality is a standing hypothesis, not a conclusion for all diagrams. |
| L06 | Stem08 orbit sums, printed p.1; Stem08 line 23–29 | A block is a set of distinct orbit members; squared norm2·size requires orthogonality. |
| L07 | Stem08 equations(2)–(3), printed p.1; Stem08 line 30–34 | Target coroot block supplies the denominator; A₃ gives−2,−1. |
| L08 | Stem08 Claim 1, printed p.2; Stem08 line 41–42 | Characterization by orthogonal root-orbit sums. |
| L09 | Stem08 Claim 3, printed p.2; Stem08 line 57–70 | Fixed subgroup means conjugation fixed; source proof omissions are not copied into the package route. |
| L10 | Stem08 proof of Claim 3, printed pp.2–3; Stem08 line 71–80 | Exhaustion uses right descents of an entire orthogonal block; package resolves this through pinned inversion drops. |
| L11 | Stem08 proof of Claim 1, equation(4), printed p.3; Stem08 line 87–101 | Height descent uses positive squared norm and the simple-block sign-change exception. |
| L12 | Stem08 Claim 4, printed p.3; Stem08 line 102–107 | Finiteness supplies positive definiteness; the earlier simple-orbit condition remains in force. |
| L13 | KZ25 §5.2.1, preprint pp.48–49; KZ25 line 2119–2176 | Coinvariant lattice/chamber setting; coefficient-sign omission recorded below. |
| L14 | KZ25 Proposition 5.2.3, preprint p.49; KZ25 line 2179–2187 | Geometric curve statement requires more than a finite root choice; package claims only its combinatorial input. |
| L15 | KZ25 proof of Proposition 5.2.3, preprint pp.49–50; KZ25 line 2197–2206 | D₄ values(1,3,1,1) exceed budget(1,2,1,1); inference from individual bounds fails. |
| L16 | KZ25 remainder of proof and Lemma 5.2.5, preprint pp.50–52; KZ25 line 2207–2329 | Relative root groups, curve construction and descent are outside this package; translation-representative typo recorded below. |
| L17 | KZ25 Corollary 5.2.7, preprint pp.52–53; KZ25 line 2330–2363 | Downstream curve claim is motivation, not an output of Suggested.lean; local-model reference typo recorded below. |

## Not verifiable

- No Lean elaboration or build was run in this read-only pass. The supplied elaborated types for all 15 declarations were compared, including all section variables and instance contexts; no signature changed in this review.
- The KZ25 published article's pagination and agreement with other versions were not independently certified. Every mathematical locator used here is explicitly to the provided 63-page author preprint, so no unavailable published text is needed for these checks.
- Stembridge's original Corollary 2.7, cited internally by Rap00, was not needed or opened: the roadmap cites Rap00's complete maximal-root proof, which was read.
- This audit checks the named supplier interfaces and their conventions, not all proofs in the suppliers' large developments. It does not certify unavailable open-head contents beyond the supplied local heads and indexed search results. No missing reference request is required; all works the package itself cites were available under their existing manifest keys.

## Source issues

- **Misprint** in Rap00 at Lemma 2.3, printed p.157 (Rap00 line 194): the source says the chosen variable belongs to the positive coroot set, then adds another coroot decoration to it; it should be name the chosen positive coroot consistently as β∨; affects nothing.
- **Misprint** in Stem08 at proof of Claim 3, printed p.2 (Stem08 line 60–67): the source says a block product changes any simple root by the sum of its neighbors in the block; it should be restrict this formula to roots outside the block; inside, the change is minus twice the simple root; affects the proof.
- **Gap** in Stem08 at proof of Claim 3, printed p.2 (Stem08 line 68–70): the source says agreement on the folded span and reflection faithfulness give a homomorphism into the original Weyl group; it should be establish the lifted Coxeter relations or injectivity of restriction on the block-generated subgroup; affects the proof.
- **Misprint** in KZ25 at §5.2.1, author-preprint p.48 (KZ25 line 2152–2154): the source says dominance means an integral linear combination of positive coroots; it should be require nonnegative integer coefficients; otherwise distinct root-lattice translates become comparable in both directions; affects a stated result.
- **Gap** in KZ25 at proof of Proposition 5.2.3, author-preprint pp.49–50 (KZ25 line 2197–2206): the source says separate bounds on translated root increments imply the same bound on their orbit sum; it should be choose an orbit whose whole distinct sum fits the integral budget; the individual bounds do not imply this; affects the proof.
- **Misprint** in KZ25 at Lemma 5.2.5, author-preprint p.52 (KZ25 line 2317): the source says the translation representative lies in the group's power-series points; it should be place it in the Laurent-series points, allowing a general nonzero translation as used in the proposition; affects a stated result.
- **Misprint** in KZ25 at §5.2.6, author-preprint p.52 (KZ25 line 2330): the source says its input is Theorem 5.2.1.1; it should be refer to the local-model diagram(5.2.1.1); affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6ea72eae9e2af56070f699a4cc6dcf9e5e74c6b2", "job": "RT-RootSystemsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
