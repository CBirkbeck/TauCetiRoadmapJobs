<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13739#issuecomment-6849295823 -->
Review (claude) of 8b24069

Verdict: needs_changes

1. **F01** (P3) two declaration names attributed to the base do not exist at its head

   **Location:** `packages/CountableStructureSpacesPartII/design/README.md:271`: "Layer 1.2:
   `continuousSMul_relationalConfiguration`, joint continuity of the logic action for every language";
   also lines 116 (`eval_smul_atom`), 564, 942, 953, and `design/plan.json:1437`, `:2077`.

   **Claim:** these are "the base's names" for targets of CountableStructureSpaces Layer 1.2.

   **Witness:** CountableStructureSpaces at its open head (`TauCetiRoadmap/CountableStructureSpaces/README.md:350`)
   states joint continuity as an unnamed `ContinuousSMul` instance obtained from
   `continuous_uncurry_restrict` and `Equiv.Perm.continuous_inv_apply`; its `Suggested.lean:78–86` no
   longer declares it. `roadmaps grep` for both names: no match on main or in any open pull request.
   The action formula there is `eval_perm_smul` (line 348).

   **Why P3 and not a gap:** the cited section exists and still states the consumed fact, for every
   language, as a target of the base (the pinned Tau Ceti has no `ContinuousSMul` instance on
   `RelationalConfiguration`: only `continuous_uncurry_restrict`, `ModelTheory/RelationalConfiguration/Topology.lean:70`).
   Only the label is wrong.

   **Exact repair:** in the five README places and the two plan places, cite "CountableStructureSpaces
   Layer 1.2, joint continuity of the logic action (the `ContinuousSMul (Equiv.Perm α)
   (RelationalConfiguration L α)` instance, from `continuous_uncurry_restrict` and
   `Equiv.Perm.continuous_inv_apply`)" without the invented name; in Convention 4 delete
   "base Layer 1.2 `eval_smul_atom`" (the sentence already cites `eval_perm_smul`, which is the base's
   and the pin's name, `ModelTheory/RelationalConfiguration/Basic.lean:309`). Tested: both replacement
   names exist at the pin (`Topology.lean:70`, `Topology/Algebra/Group/Perm.lean:58`) and in the base's
   Layer 1.2 text.

2. **F02** (P3) hypothesis (a) of the obstruction does not say which σ-algebra

   **Location:** `packages/CountableStructureSpacesPartII/design/README.md:1199`: "isomorphism
   restricted to `K ∩ {c | ρ c ≤ α}` is measurable as a subset of the square"; `design/plan.json`
   target 6.8 ("measurable in the square").

   **Claim:** a hypothesis with exact meaning.

   **Witness:** `ρ` is an arbitrary function, so the stratum `K_α = K ∩ {ρ ≤ α}` need not be
   measurable; "the square" can be `K_α × K_α` with the subtype σ-algebras or the ambient
   `RelationalConfiguration L ℕ × RelationalConfiguration L ℕ`. For a non-measurable `K_α` with
   isomorphism equal to equality on it, the diagonal of `K_α` is measurable in the first sense and not
   in the second.

   **Exact repair:** state (a) as: for every `α < ω₁`, the set of isomorphic pairs of
   `K_α × K_α` is measurable for the product of the subtype σ-algebras (that is, `classIso K_α` has
   measurable graph). This is the weaker hypothesis and the proof uses exactly it: the reduction `f`
   corestricts to `K_α` measurably (`Measurable.subtype_mk`) and the graph of `classIso graphClass` is
   the preimage under `f × f`. Tested on the instance: with `ρ = 0`, `K_0 = K`, and (a) reads
   "`classIso K` has measurable graph", the negation of the conclusion of 6.2, as the first Check of
   6.4 requires.

Two findings, both P3, each with a repair to apply (R01, R02). No P1 or P2 finding. The three
findings of round 4 are repaired. This is a design: there is no `Suggested.lean`, and elaboration
is not available (this lane does not elaborate), so no elaboration, `#check` or one-tactic probe
was run and none is claimed.

## Previous findings (round 4), checked first

| Finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P2) continuity convention covered the cover-graph map | repaired | README Convention 3: "The cover-graph reduction of Layer 3.5 is Borel and not continuous, even on `treeClass`, and is stated as Borel only." New Check in 3.5 (star `T`, `T_n` with `n` between `0` and `1`). Recomputed: for `n > max(i, j)` the coordinate `(i, j)` of `T_n` equals that of `T` (both: `0 ≤ k` for all `k`, `1` above `0`, other pairs incomparable), cover(0,1) is T in `T`, F in every `T_n` (covers of `T_n`: `0—n`, `n—1`, `0—k`). `T_n ∈ treeClass`: down-set of `1` is `{0, n, 1}`, a chain of 3. Coordinate sets: "i < j strict" clopen, "no k strictly between" an intersection of clopen sets, so closed; Borel holds. |
| F02 (P2) colour defined only on `graphClass` | repaired | README 3.2: "For every code `c : RelationalConfiguration Language.graph ℕ` … the bit `c.eval (adjAtom a_i a_j)`". Checked against `SameAtomicType` at the pin (`ModelTheory/BackAndForth/AtomicType.lean:81`, tests `RelMap r (a ∘ f)` for all `f : Fin k → Fin n`, and equalities): for one binary symbol that is the equality matrix plus the ordered relation matrix, diagonal included, exactly the encoded data. 3.3 and 3.4 state formation and continuity for all codes and reflection on `graphClass` only. |
| F03 (P3) no Checks for the packing map | repaired | Three Checks added to 4.2. Recomputed from `Mathlib/Data/Nat/Pairing.lean:37, :42`: `unpair 0 = (0,0)`; `unpair 1`: `s = 1`, `1 − 1 = 0 < 1`, so `(0, 1)`; `unpair 2`: `s = 1`, `2 − 1 = 1 ≮ 1`, so `(1, 0)`; `pair 1 0 = 1·1 + 1 + 0 = 2`. With `(n, k) = unpair m`: `m = 1` reads the unary symbol `(k, n) = (1, 0)`; reversed reading gives `(0, 1)`, a nullary symbol; `m = 2` reads the nullary symbol `(0, 1)`, constant on pairs. |

No finding of the repair report was marked not actionable; nothing is re-raised. Pattern search for
the three repaired patterns (a continuity claim wider than its proof; an object used outside its
domain of definition; a construction without Checks) over the rest of the README: the continuity
claims of the Summary, 1.3, 2.3, 3.3, 3.4, 4.2 step 3 and 6.3 each concern a map whose coordinates
read finitely many input coordinates; `classIso`, the colour, the block order and the tagged tree
are used only where defined; every definition and construction has at least three Checks. R02 above
is the one under-specified domain found.

## Verified sound

### Coverage

Read the whole README (1,287 lines), the plan (49 targets in 7 layers, `gaps: []`), the manifest
(12 entries), the round-4 review and the repair report. Passages changed by the repair (Convention
3, 3.2–3.5, 4.2) were reviewed in full; the 15 sampled targets were reviewed in full, sources
included; for text no repair touched, the round-4 table rows carry computed values and were relied
on except where a row below recomputes them.

### Principles

Part II of CountableStructureSpaces, whose head lists "Borel completeness of isomorphism of
countable graphs or linear orders" and Vaught transforms as out of scope
(`TauCetiRoadmap/CountableStructureSpaces/README.md:960–962`). General Borel reducibility, E₀,
back-and-forth, graph translation and the Polish realization are imported, not re-planned. No
copied passage, no algorithm, no `set_option`, no sorry'd data (no Lean file). The layer order is
forced by the dependency lines (0 → 1 → 2 → 3; 4 from NoncompactQuantumSymmetry; 5 from 0–4; 6.1
free and said to be so); no layer is named after a source chapter and the README does not say it
follows a source. Statements are general: arbitrary countable relational languages in any universe,
nullary symbols, function symbols through the graph language, arbitrary branching in trees.

### Adversarial table

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| 0.1 `classIso`, restriction, corestriction | `K = ∅`; `K` nonempty; unary predicate on `Fin 2` | maps nonempty → `∅`: 0, so reducible to `classIso ∅` iff `K = ∅`; `Fin 2`: 4 codes, classes `|P| = 0, 1, 2` = 3; `{0} ~ {1}` T, `∅ ~ {0}` F | sound; none |
| 1.1 relabelling direction | `Fin 3`, `e = (0 1 2)`, `P = {0}` | `restrict e.symm`: `{w | e⁻¹ w = 0} = {1} = e(P)`; `restrict e`: `{w | e w = 0} = {2}`; twice along `e` on ℕ: `{2} ≠ {0}` | matches Convention 4 and the base's acceptance check; none |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; `P_i ∈ {∅, ℕ}` family; `graphClass ∩` empty-graph orbit | no map from nonempty into `∅`; quotients `ℵ₀` vs `2^ℵ₀`; the empty graph is fixed by every permutation, so the orbit is 1 code and the intersection has 1 type | sound; none |
| 1.3 functional space, graph code | constant `k` with `F k = 3`; unary `f` with two or no values at `0`; values `n → ∞`; relational `L` | graph relation `{3}`; functionality F; totality F; limit has no value, so range not closed; relational: table is the empty map, range = univ. Last coordinate is the value: `GraphTranslation/Language.lean:75–77, :234` | sound; none |
| 2.1 incidence graph | colours of the four sorts; `R = {(0,1)}` binary; two unary symbols | colours `0`, `1`, even `≥ 2`, odd `≥ 3`: pairwise disjoint; degrees of `t_q`: 3 and 2; an isomorphism forces `σ (v j) = v' j` through the unique colour-`2+2j` neighbour, then `d.eval (atom R (σ ∘ v)) = c.eval (atom R v)`, i.e. `d = σ • c`; uncoloured: `P₁ = {0}` and `P₂ = {0}` graphs isomorphic while the codes are not | both directions hold; none |
| 2.2 clique tags | one edge, `κ = (0, 1)`; triangle; `κ x = 0, 1` | vertices `2 + 3 + 4 = 9`; edges `1 + 2 + 3 + 6 = 12`; neighbours of tag `0` that lie in triangles: `κ x + 2` = 2 and 3; in a tagged triangle the 3 originals lie in a triangle | triangle-freeness needed and present; none |
| 3.2 parent definable | `x = p·r`; competitor `p'` of length `|x| − 1`, first difference at `i` | every `z` with `p < z < p·r` is `p·s·w`, `s < r`: length `≥ |x|`; for `p' ≠ p`, `z = (x_0…x_{i−1}, q)` with `p'_i < q < x_i` has length `i + 1 < |x|` and `p' < z < x` | unique; none |
| 3.2 (i) ⇒ (ii), (iii) ⇒ (i) | `d = σ • c`, `Φ` entrywise `π` | `a(Φ x) = σ ∘ a(x)`; `d.eval (adjAtom (σ a_i) (σ a_j)) = c.eval (adjAtom a_i a_j)`; `Ψ` fixes the unique parentless node; children map onto children, so forth and back of `IsTupleBFSystem` (`TupleSystem.lean:39–50`) hold | sound; none |
| 3.3 block order | blocks `ω + (χ + 2)`; `χ = 0, 1`; constant-true code | finite condensation classes: sizes 2, 3; `ω`-part against finite part: infinite interval; between blocks: infinite (density: `p < p·(r − 1) < p·r`, `[] < [−1] < [0]`); comparison of `(x, i)`, `(x, j)` reads `χ_c(x)` only | lands in `linearOrderClass` for every code; reflection on `graphClass`; none |
| 3.4 tagged tree | `χ = 0, 1`; down-set of `(x, some m)` | chain above `(x, some 0)`: `χ + 2` nodes = 2, 3; down-set: `|x| + 1` prefixes and at most `χ + 2` tags, a finite chain; originals carry the infinite chain `x < x·0 < x·0·0 < …`, tags none | in `treeClass` for every code; none |
| 3.5 presentations, cover graph | `{[], [0], [1], [0,0]}`; `List ℕ`; ray marked at `0` or `1`; star and `T_n` | 4 nodes, no code on ℕ; marked vertex of degree 1 vs 2; convergence and cover values as in the F01 row. `Descriptive.tree` is closed under `x ++ [a] ∈ T → x ∈ T` (`Mathlib/SetTheory/Descriptive/Tree.lean:32`), so an infinite `T` contains `[]` | sound; none |
| 4.1 Borel S∞-spaces | evaluation action on ℕ; trivial action; uncountably many unary symbols | orbits: 1; `#X`; a product-measurable set depends on countably many coordinates, so singletons are not measurable. Equivariant injection: `f x = g • f y = f (g • y)` gives `x = g • y` | sound; none |
| 4.2 anchored map | `X = ℕ`, `S_n = {n}`; one point; `h • x` | `(1, 0)` at `(a)`, `x`: `∃ g, g a = 0 ∧ g x = 0` iff `x = a`; one point: holds iff `a` injective; `g' = g h`: `g' (h⁻¹ (a i)) = i`, matching `(h • c).eval (atom R a) = c.eval (atom R (h⁻¹ ∘ a))`; `g_k` fixing `0..k−1` has `g_k⁻¹` fixing them, so `g_k → 1` in the two-sided topology | equivariant and injective; none |
| 4.2 packing | `m = 0, 1, 2` | see F03 row; `k ≤ m` by `unpair_right_le` (`Pairing.lean:108`), recovery at `pair n k ≥ k` (`:103`) | sound; none |
| Layer 5, five characterisations | `graphClass`; `∅`; one unary predicate | T,T,T,T,T; F,F,F,F,F (each quantifies over a nonempty instance); (2) F by `2^ℵ₀` vs `ℵ₀` classes | sound; none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1, 2`; successor step with `ξ = ω^γ·μ + ρ + 1` | `γ = 1`: any two nonempty orders T, empty vs nonempty F; cut of `ω^(γ+1)·δ` after `ξ = ω^(γ+1)·δ₁ + ξ'`, `ξ' < ω^(γ+1)`: remainder `ω^(γ+1)·(δ − δ₁) ≠ 0`; `m'` exists since `ω^γ + ρ < ω^(γ+1)`; limit: `ω^γ·δ = ω^γ'·(ω^(γ−γ')·δ)` | sound; none |
| 6.2 non-Borel headline | types `ω^(1+β)`, `ω^(1+β)·2` | both countable and `≥ ω`; isomorphic F; `BFEquiv (1+β)` T by 6.1 with `δ = 1`, `ε = 2`; `β ≤ 1 + β`, so `BFEquiv β` T by `BFEquiv.mono` (`Equivalence.lean:96`); uniform separation would give F | contradiction valid for arbitrary `K`; none |
| 6.2 consequences | invariant Borel `K`; `K = ∅` | complement of the non-isomorphic pairs = `(iso ∩ K ×ˢ K) ∪ (K ×ˢ K)ᶜ`; `∅`: Borel isomorphism T, complete F | hypotheses of `lopez_escobar` and `measurableSet_iso_inter_of_scottHeight_le` met (base `Suggested.lean:377`, `:242`); none |
| 6.3 E₀ code | `0^ω`, `1 0^ω`, `1^ω` | copies `x Δ F`, each member of the class once; `F ↦ F Δ {0}` matches copies: iso T = E₀ T; finitely vs cofinitely many `P`-points: iso F = E₀ F | sound; none |
| 6.4 obstruction | `ρ = 0`; unary class; `graphClass` | `K_0 = K`; (a) and (b) hold for the unary class, conclusion T; for `graphClass` (a) and (b) cannot both hold | true under either reading of (a); R02 fixes the reading |
| 6.5 lower part | unary class against `eZero` | `ℵ₀` vs `2^ℵ₀` classes: `eZero → unary` F; unary smooth, so `→ ⊥ → eZero` T | sound; none |

### Sources: the seeded sample

All locators of the five cached texts were opened at the cited lines.

| Target | Locator read | Result |
| --- | --- | --- |
| 0.1, 0.2, 1.2 | paolini-shelah-tfab line 70 (Definition 1.2), line 83 (Definition 1.4), lines 88–91 (Remark 1.5), lines 95–101 (Definition 1.6); camerlo-gao-boolean lines 106–110 | match; the sources work on standard Borel spaces and Borel classes on ℕ, the README states its own extension to arbitrary sets and carriers |
| 1.1, 4.1 | becker-kechris-bams lines 159–164 (logic action, inverse on coordinates), lines 126–131 (Borel G-spaces, embeddings) | match |
| 1.3 | camerlo-gao-boolean lines 87–93; paolini-shelah-tfab lines 60–64 | match (arbitrary countable languages; group classes) |
| 2.1, 2.2 | montalban-cst1 line 4572 (Theorem VI.27), lines 4623–4654 (flags and connectors, kept apart by cycle lengths) | supports "classical, different gadgets"; the construction is declared the roadmap's own |
| 2.3 | camerlo-gao-boolean lines 111–112; paolini-shelah-tfab line 125 | match |
| 3.3, 3.4 | montalban-cst1 lines 4205–4245 (labelled trees), 4246–4288 (labelled dense orders, parent definition at 4279–4283, label + 2 elements at 4286–4288), 4258–4260, 4273–4275 | match; the README replaces the category argument by a tuple system and says so |
| 3.5 | camerlo-gao-boolean lines 257–263, 276–281 | background for the binary case, as the README says |
| 4.2 | becker-kechris-bams line 132 (Theorem 2.1), lines 172–177 (Corollary 2.2), lines 247–268 (sketch; the coding into one symbol per arity at 263–268) | match; the anchored-open-set route is the roadmap's own and was checked above |
| 6.1 | montalban-cst2 lines 2322–2331 (Lemma II.37), 2337–2425 (Lemma II.38, Corollary II.39) | match; one-sided levels there, two-sided here, as the README says |
| 6.2 | paolini-shelah-tfab lines 103–106 (Fact 1.7) | match (the non-Borel part) |
| Scope paragraph | paolini-shelah-tfab lines 169–171; camerlo-gao-boolean line 405, line 555; montalban-cst2 lines 8946–8980 | match |
| 6.4, 6.5 | friedman-stanley-1989 §4, hjorth-kechris-1996 §4–§5, gao-idst §5.2, §13.1 | not read (settled uncertified); the proofs given were checked directly |

Every cited work has a manifest entry; none was added or changed, and no request was written.

### Pinned declarations opened

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the plan's baseline). All 221 backticked dotted or
plain identifiers of the README were searched at the pins; every library name resolves. Opened in
particular: `SameAtomicType` (`ModelTheory/BackAndForth/AtomicType.lean:81`), `IsTupleBFSystem`
(`TupleSystem.lean:39`), `BFEquiv.zero`, `add_one`, `limit`, `mono`, `symm`, `trans`
(`Equivalence.lean:65, :70, :90, :96, :126, :144`), `perm_smul_def`, `eval_perm_smul`
(`RelationalConfiguration/Basic.lean:304, :309`), `continuous_uncurry_restrict` (`Topology.lean:70`),
`analyticSet_setOf_isoSetoid`, `perm_smul_eq_encodeVia`, `Equiv.isoSetoid_encodeVia_iff`
(`Isomorphism.lean:187, :100, :149`), `LEquiv.onConfiguration`, `isoSetoid_onConfiguration_iff`
(`LanguageMap.lean:186, :240`), `IsSimpleGraph.restrict`, `eval_toRelationalConfiguration_adjAtom`,
`range_toRelationalConfiguration` (`Combinatorics/SimpleGraph/RelationalConfiguration.lean:120, :210, :267`),
`Equiv.Perm.instTopologicalSpace`, `instIsTopologicalGroup`, `instPolishSpace`,
`hasBasis_nhds_one_fixingSubgroup` (`Topology/Algebra/Group/Perm.lean:42, :110, :143, :149`),
`BorelReducible.lift_mk_quotient_le`, `Setoid.isSmooth_of_countable_quotient`
(`SetTheory/Descriptive/BorelReducibility.lean:146, :289`), `not_isSmooth_of_borelReducible_eZero`,
`mk_quotient_eZero`, `borelReducible_bot_eZero` (`EZero.lean:219, :238, :243`), `GraphRelation`
(`Infinitary/GraphTranslation/Language.lean:72`), `model_graphAxioms_iff`,
`reconstructStructure_graphExpansion` (`Reconstruct.lean:209, :315`), `scottHeight`
(`Scott/Height.lean:133`); Mathlib `ContinuousSMul.measurableSMul₂`
(`MeasureTheory/Constructions/BorelSpace/Basic.lean:614`), `MeasurableSet.standardBorel`,
`AnalyticSet.measurableSet_of_compl`, `MeasurableSet.image_of_measurable_injOn`
(`Constructions/Polish/Basic.lean:1110, :524, :836`), `equiv_between_cg`
(`ModelTheory/PartialEquiv.lean:499`), `Structure.cg_of_countable` (`FinitelyGenerated.lean:278`),
`Theory.simpleGraph_model_iff` (`Graph.lean:72`), `linearOrderTheory` (`Order.lean:163`),
`Theory.fieldOfChar` (`Algebra/Field/CharP.lean:47`), `Descriptive.tree`
(`SetTheory/Descriptive/Tree.lean:32`), `Nat.pair`, `Nat.unpair`, `right_le_pair`, `unpair_right_le`
(`Data/Nat/Pairing.lean:37, :42, :103, :108`).

Duplication by object at the Tau Ceti pin: no `BorelComplete`, class-restricted isomorphism on
arbitrary sets, set reducibility, linear-order or tree class of codes, universal language,
σ-algebra instance on `Equiv.Perm` (only instance arguments in
`Probability/Distributions/Uniform/Permutation.lean:38`), closedness of the simple-graph codes, or
`ContinuousSMul` on codes. `ModelTheory/BackAndForth/DiscreteOrder.lean` has
`sameAtomicType_order_iff` (cited) and results on discrete orders and `ℤ ⊕ₗ ℤ`, not the interval
lemma or ordinal multiples of 6.1.

### Cross-roadmap citations, ownership and overlap

- CountableStructureSpaces (open, a new roadmap by another author; read at its head): Layer 0
  closedness of the graph-code range (`README.md:244, :280`, still to build there); Layer 1.2 joint
  continuity (`README.md:350`; names: R01); Layer 3 `analytic_treeHeight_bounded`
  (`Suggested.lean:164`); 4.3 `measurableSet_iso_inter_of_scottHeight_le` (`:242`); 4.4
  `exists_uniform_bfSeparation` (`:302`, needs only `[L.IsRelational]` and an analytic set of
  non-isomorphic pairs, as 6.2 uses it); Layer 5 `lopez_escobar` (`:377`); 6.2 `wellOrderClass`,
  `exists_mem_wellOrderClass_type_eq`, `analyticSet_compl_wellOrderClass`,
  `not_measurableSet_wellOrderClass` (`:439, :448, :455, :478`); worked example 2 (`README.md:895–901`).
  The line numbers differ from those of round 4: that head has moved, and every citation was
  resolved again.
- NoncompactQuantumSymmetry (earlier in the merge order): Layer 4, M1.BorelRealization,
  `exists_polishTopology_continuousSMul` (`Suggested.lean:162`): Polish group with `BorelSpace`,
  standard Borel `X`, `MeasurableSMul₂`; conclusion as the README states it.
- On main: BorelEquivalenceRelations §5.1–§5.4 (`README.md:547, :557, :574, :583`);
  InfinitaryModelExistence 0.3 with `smallPresentation` (`README.md:135, :200`) and Layer 6
  (`:597`); CountableModelCounting Layer 0, `isoSetoidOn` (`README.md:281`) and transport between
  presentations (`:318`); InfinitaryLogic Layer 1 (completed).
- `roadmaps grep` for Borel completeness, Friedman–Stanley, universal Borel spaces and unravelling
  over main and the open heads found no other owner; CountableModelCounting's "Borel complete
  invariant" is a different notion. The overlaps file lists no conflicting head, no dropped id, no
  revision-only id and no second copy; this roadmap is not on main.

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations (and HanfNumbers, InfinitaryModelExistence, InfinitaryLogic); nothing shared: restricted isomorphism on models of one sentence is CountableModelCounting's, `classIso` on arbitrary sets and everything on Borel completeness is this roadmap's, general reducibility and E₀ are BorelEquivalenceRelations', the coding space and its base theorems are CountableStructureSpaces'.

### Supplier order

All `*Needs:*` lines and layer Dependencies read; no upward citation, cycle, forbidden supplier or
unowned prerequisite; no gap is declared and none is needed. Gate output:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1897 edges, 0 problem(s)
```

### Shape and headline theorems

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven
layers each ending with Examples and Dependencies, Downstream consumers, References: present. Every
definition has API bullets and at least three Checks; every theorem has hypotheses and a locator or
is marked as the roadmap's own construction. No LaTeX delimiters, pull-request numbers, machine
paths or round labels in the README.

Headline theorems for the package stage, all statable at the pins with real-bodied definitions
(`classIso`, `BorelComplete`, `graphClass`, `linearOrderClass`, `treeClass`, `universalLanguage`):
`borelComplete_graphClass`, `borelComplete_linearOrderClass`, `borelComplete_treeClass`,
`exists_continuous_reduction_graphClass_linearOrderClass`,
`exists_equivariant_measurableEmbedding_universal`, the four `borelComplete_iff_…` equivalences,
`bfEquiv_omega0_opow_mul`, `not_measurableSet_classIso_of_borelComplete`,
`borelReducible_eZero_of_borelComplete`, `not_isSmooth_of_borelComplete`,
`not_borelComplete_of_rank_bounded`. The padding probe has nothing to run on at this stage.

## Not verifiable

- The seven settled uncertified texts (friedman-stanley-1989, gao-idst, becker-kechris-1996,
  kechris-cdst, hjorth-2000, hjorth-kechris-1996, mekler-1981): cited by locator only; their section
  numbers, which the manifest flags as from memory, could not be checked. Not requested again.
- The Annals numbering of paolini-shelah-tfab: the cached text is arXiv v6.
- Lean elaboration, binder inventories and the one-tactic probe: no `Suggested.lean` at the design
  stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the roadmap index only (README and
  `Suggested.lean` of each head), not through other files of those branches.

## Source issues

- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36: the source says comparing the intervals cut out by weakly increasing tuples decides the back-and-forth relation; it should also require the two tuples to have the same equality pattern; affects a stated result.
- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says finite sequences of rationals in lexicographic order form a copy of ℚ; it should say a dense order with least element the empty sequence; affects the proof.
- **Error** in camerlo-gao-boolean at the definition of rooted binary tree, printed page 496: the source says a root, unique parents and at most two children identify the order with a subtree of binary sequences; it should also require finite ancestor sets; affects a stated result.
- **Error** in becker-kechris-bams at §2, arXiv page 4: the source says the coding space of every nonempty countable relational language is homeomorphic to Cantor space; it should exclude languages with only finitely many nullary symbols; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8b2406951de9abd15f87297a87e2a0584aa4bb82", "job": "REV-DESIGN-CountableStructureSpacesPartII~5", "model": "fable", "worker": "chris-x51"} -->
