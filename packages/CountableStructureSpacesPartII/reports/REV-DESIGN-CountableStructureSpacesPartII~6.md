<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13739#issuecomment-6895031020 -->
Review (claude) of 0282936

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the locator given for `classIso` defines reducibility, not the restricted relation

   **Location:** `design/README.md:320`, section 0.1: "(paolini-shelah-tfab Definition 1.4, line 83;
   camerlo-gao-boolean lines 106–110, where the carrier is ℕ …)"; the same locator in plan target 0.1.

   **Claim:** the cited places support the definition of isomorphism restricted to a class with the
   subtype Borel structure.

   **Witness:** paolini-shelah-tfab line 83 (Definition 1.4) is Borel reducibility between equivalence
   relations on two standard Borel spaces. The restricted relation and its Borel structure are at
   paolini-shelah-tfab lines 65–68 and lines 95–96 (Definition 1.6).

   **Exact repair:** in 0.1 and plan 0.1 cite "paolini-shelah-tfab lines 65–68 and Definition 1.6,
   lines 95–96; camerlo-gao-boolean lines 106–110"; keep Definition 1.4 (line 83) where Convention 2
   introduces a Borel reduction between classes. Tested: lines 65–68 treat a Borel class as a standard
   Borel space with relations as subsets of its square; lines 95–96 name the isomorphism relation on
   the class.

2. **F02** (P3) the unravelling lemma and the two reflections are stated for `graphClass` only, and hold for every code

   **Location:** `design/README.md:751`: "Unravelling lemma: for `c, d ∈ graphClass`, the following are
   equivalent"; `:816` ("for `c, d ∈ graphClass` the images are isomorphic exactly when `c` and `d`
   are"); `:873`; plan targets 3.5, 3.8, 3.11.

   **Claim:** the equivalences need `c, d` to be simple-graph codes.

   **Witness:** the proof given never uses symmetry or irreflexivity: the colour is defined for every
   code, (i) ⇒ (ii) uses only `d = σ • c`, (iii) ⇒ (i) only colours and `IsTupleBFSystem`. Instance:
   `c` with the single true atom `adjAtom 0 1`, `d` with `adjAtom 1 0`, `τ = (0 1)`: `d = τ • c`, and
   `χ_d(Φ x) = χ_c(x)` for `Φ` entrywise `π_τ`.

   **Exact repair:** state the lemma for all `c, d : RelationalConfiguration Language.graph ℕ`, and in
   3.3 and 3.4 state reflection for all codes, so that each map is a continuous reduction of
   `isoSetoid Language.graph ℕ`; keep the `graphClass` statements as the corollaries used for Borel
   completeness, and keep the fourth Checks of 3.3 and 3.4 (they are instances of the wider statement).
   In the same paragraph of 3.3 replace "each comparison depends on two colours" by "each comparison
   depends on at most one colour, that of the common block". Tested on the instance: with the loop code
   (`adjAtom 0 0` only) against the empty graph, the colour "length 1, diagonal true" occurs at `[1]`
   for the first and nowhere for the second, so (ii) and (iii) fail, as non-isomorphism requires; on
   the directed pair above all three hold.

Two findings, both P3; no P1 or P2. Each is a repair to apply (R01, R02), so the verdict asks for changes. Both round-5
findings are repaired. This is a design: there is no `Suggested.lean`, and elaboration is not
available (this lane does not elaborate), so no elaboration, `#check` inventory or one-tactic probe
was run and none is claimed. No supplier gap is declared.

## Previous findings (round 5), checked first

| Finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P3) invented base names `continuousSMul_relationalConfiguration`, `eval_smul_atom` | repaired | `design/README.md:271–274`: "Layer 1.2: joint continuity of the logic action for every language and every discrete carrier `α`, the `ContinuousSMul (Equiv.Perm α) (RelationalConfiguration L α)` instance, obtained from Tau Ceti `continuous_uncurry_restrict` composed with `Equiv.Perm.continuous_inv_apply`". Also lines 114–118, 567–569, 947–948, 958–960 and the plan's supplier entry. A grep of README and plan finds neither old name. Base at its open head, Layer 1.2: the bullet "The action is jointly continuous (a `ContinuousSMul` instance), for every language" with the same two ingredients; the acceptance check (3-cycle on `P = {0}` gives `P = {1}`) is under Layer 1 Examples, as Convention 4 now says. Pin: `continuous_uncurry_restrict` (`ModelTheory/RelationalConfiguration/Topology.lean:70`, needs `[DiscreteTopology W]`, hence "discrete carrier"), `continuous_inv_apply` (`Topology/Algebra/Group/Perm.lean:58`), `perm_smul_def`, `eval_perm_smul` (`RelationalConfiguration/Basic.lean:304, :309`). |
| F02 (P3) hypothesis (a) of 6.4 did not name the σ-algebra | repaired | `design/README.md:1207–1212`: "write `K_α = K ∩ {c | ρ c ≤ α}` (a set that need not be measurable …); assume (a) for every `α < ω₁`, the set of pairs of `K_α × K_α` with isomorphic entries is measurable for the product of the subtype σ-algebras". Plan target 6.8 says the same. Proof sketch now names the corestriction `f'`. Recomputed below (rows 6.4). |

Nothing in the repair report was marked not actionable; nothing is re-raised. Pattern search for the
two repaired patterns over the whole design: (i) every backticked name attributed to a supplier was
resolved again (below): none is missing; (ii) every "measurable/Borel/analytic subset of a product"
statement names its ambient space: 6.2 headline (subtype product), its three consequences (ambient
square, then pulled back), the base 4.3 contract (ambient, with the remark that the two agree for
measurable `modelsOf φ`), 6.4 (a) (subtype product).

## Verified sound

### Coverage

Read the whole README (1,311 lines), the plan (49 targets in 7 layers, `gaps: []`, baseline Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9`, equal to the pins of the content repository's manifest), the
manifest (12 entries), the round-5 review and its repair report. The passages the repair changed
(Convention 4, the base contract, 1.3 and 4.1 *Needs:*, 6.2 first consequence, 6.4) and the 15
sampled targets were reviewed in full, sources included. For the remaining text (0.1, 1.1, 1.2,
3.4, Layer 5, 6.3) the round-5 rows carry computed values; I recomputed those that the sampled
targets depend on, and they are in the table.

### Principles

Part II of CountableStructureSpaces, whose open head lists Borel completeness of graphs and linear
orders and Vaught transforms as outside its scope. General Borel reducibility, smoothness and E₀
(BorelEquivalenceRelations §5.1–§5.4, on main), back-and-forth (InfinitaryLogic, completed), small
presentation and graph translation (InfinitaryModelExistence 0.3 and Layer 6, on main), transport
between presentations and `isoSetoidOn` (CountableModelCounting Layer 0, on main) and the Polish
realization (NoncompactQuantumSymmetry Layer 4) are imported, not planned again. No copied passage,
no algorithm, no `set_option`, no sorry'd data (no Lean file). Statements are general: arbitrary
countable relational languages in any universe, nullary symbols, function symbols through the graph
language, arbitrary branching; R02 is the one place where a statement is narrower than its proof.
Layer order: 0 → 1 → 2 → 3 by the *Needs:* lines; 4 needs only 4.1 and NoncompactQuantumSymmetry;
5 needs 0–4; 6.1 is free and the README says so. No layer is named after a source chapter and the
README does not say it follows a source.

### Adversarial table

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| 0.2 `SetReducible`, empty and full targets | `X = Unit, Y = Empty`; `X = Y = Empty`; nonempty `Y` | maps `Unit → Empty`: 0, so `∅ ≤ ∅` F although `A = ∅`; empty map: T; constant map into nonempty `Y`: preimage of `∅` is `∅`, of `univ` is `univ` | iff holds both ways with the existence clause; none |
| 0.2 converse fails | `E = eZero`, `F = ⊥` on Cantor space | two-valued map `p ↦ (0,0)` on the graph, `(0,1)` off it: preimage of the diagonal = graph, measurable by `measurableSet_eZero` (`EZero.lean:105`); Borel reducibility to `⊥` is `IsSmooth eZero` by definition (`BorelReducibility.lean:229`), F by `not_isSmooth_eZero` (`:214`) | set reducible T, Borel reducible F; none |
| 0.2 analytic pull-back | `f` measurable between Polish spaces | `Measurable.exists_continuous` (`Polish/Basic.lean:331`) gives a finer Polish topology; preimage analytic there; identity to the old topology continuous, image analytic | sound; none |
| 1.1 relabelling direction | `Fin 3`, `e = (0 1 2)`, `P = {0}` | pin: `restrict (f : V → W) : Config W → Config V` (`Basic.lean:211`); `restrict e.symm`: `{w | e⁻¹ w = 0} = {1}`; `restrict e`: `{2}` | agrees with Convention 4 and the base's check; none |
| 1.3 graph-code map | constant `k`, `F k = 3`; unary `f` with values at `0` equal to `n → ∞`; relational `L`; a constant symbol alone | relation `{3}`; limit code has no value at `0`: totality F, so range not closed, also for a nullary function symbol (`{n}` → `∅`); relational: range = whole space. Last argument is the value (`GraphTranslation/Language.lean:75–77`) | Gδ, not closed, closed exactly as stated; none |
| 1.3 action on tables | `(σ • F)⟨f, v⟩ = σ (F ⟨f, σ⁻¹ ∘ v⟩)` | graph bit at `w`: `(σ•F)(init w) = last w` ⇔ `F(σ⁻¹ ∘ init w) = σ⁻¹ (last w)` = bit of `F` at `σ⁻¹ ∘ w` | equivariant for Convention 4; none |
| 2.1 incidence graph | colours; `R = {(0,1)}`; two unary symbols; nullary symbol | colours `0`, `1`, even `≥ 2`, odd `≥ 3` disjoint; degrees of tuple vertices 3 and 2; image of `t_q` forced to `atom R (σ ∘ v)` through unique neighbours; `d.eval (atom R (σ ∘ v)) = c.eval (atom R v)` ⇔ `d = σ • c`; uncoloured graphs of `P₁ = {0}`, `P₂ = {0}` isomorphic, codes not | both directions; none |
| 2.2 clique tags | one edge, `κ = (0,1)`; triangle; `κ = 0, 1` | `2+3+4 = 9` vertices, `1+2+3+6 = 12` edges; neighbours of `x`: `H`-neighbours (pairwise non-adjacent) and tag `0` (adjacent to no `H`-vertex but `x`), so `x` in no triangle; triangle-neighbours of tag `0`: `κ x + 2` | recognition holds exactly under triangle-freeness; none |
| 2.3 `borelComplete_graphClass` | vertex set and tags | both independent of `c`; each output coordinate constant or one coordinate of `c` | continuous on the whole space; none |
| 3.1 dense colouring | `3/4`, `5`, `−1/6`, `1/8008`; fixed `m`; two-colouring by sign | `ν = 2, 0, 1, 3` (`8008 = 2³·1001`); `k/2^m` alone has gaps `2/2^m`, `j/(2^m q)` with `j, q` odd is dense; negatives are an initial segment, non-negatives are not | each fibre dense; density needed; none |
| 3.1 coloured Cantor | `σ = (0 1)` | `π(1/2)` must have colour `0`; extension pair: a point of prescribed colour in a prescribed open interval or ray exists by density and no endpoints; `equiv_between_cg` (`PartialEquiv.lean:499`) | sound; none |
| 3.2 order, parent | `x = p·r`; competitor `p'` differing first at `i` | `p < z < p·r` forces `z = p·s·w`, `s < r`, length `≥ |x|`; `z = (x_0…x_{i−1}, q)`, `p'_i < q < x_i`, has length `i+1 < |x|`; between a prefix `x` and `x·r·w`: `x·(r−1)` | dense, least `[]`, parent unique; none |
| 3.2 unravelling | one edge `{0,1}`; ordered code `adjAtom 0 1`; `Ψ` on children | `a([1/2,1]) = (1,0)`, `a([1,2]) = (0,0)`; ordered bits at `[1/2,1]`: `(1,0)` T, `(0,1)` F, reversed at `[1,1/2]`; `Ψ⁻¹` preserves parents because colours fix lengths | (i) ⇔ (ii) ⇔ (iii); R02 (wider than stated) |
| 3.3 block order | `χ = 0, 1`; constant-true code; empty against complete graph | finite condensation classes of sizes 2, 3; ω-part against finite part: infinite interval; colour "length 2, distinct, non-adjacent" at `[1,1/2]` for the empty graph, at no node for the complete graph | lands in `linearOrderClass` for every code, reflects; R02 |
| 3.5 presentations | `{[],[0],[1],[0,0]}`; `List ℕ`; ray marked at `0` or `1`; star `T` and `T_n` | 4 nodes: no code on ℕ; marked vertex of degree 1 against 2; coordinates of `T_n` agree with `T` once `n > max(i,j)`, cover `(0,1)` T in `T`, F in each `T_n`; `tree` is prefix-closed (`Descriptive/Tree.lean:32`) | Borel and not continuous, as stated; none |
| 4.1 Borel S∞-spaces | evaluation on ℕ; trivial action; uncountably many unary symbols | 1 orbit; orbits are points; σ-algebra is the product one (`Basic.lean:182`), sets depend on countably many coordinates, singletons not measurable | sound; none |
| 4.2 anchored map | `X = ℕ`, `S_n = {n}`; one point; `h • x`; `x ≠ y` | `(1,0)` at `(a)`, `x`: `∃ g, g a = 0 ∧ g x = 0` ⇔ `x = a`; injective tuples only; `g' = g h` gives the condition at `h⁻¹ ∘ a`; `g_k` and `g_k⁻¹` fix `0..k−1`, so `g_k → 1`, `g_k • y → y ∈ closure S_n` | equivariant, injective; none |
| 4.2 packing | `m = 0, 1, 2` | `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)`; `(n,k) = unpair m`: unary reads `(1,0)`, binary reads nullary `(0,1)` | Checks correct; none |
| Layer 5 | `graphClass`; `∅`; one unary predicate | T×5; F×5; (2) F by `2^ℵ₀` against `ℵ₀` classes | sound; none |
| 6.1 interval lemma | `γ = 0`; successor step, both directions; equal entry | level 0: both sides T (no nullary symbols, `BFEquiv.zero`, `Equivalence.lean:65`); new `m ∈ I_j`: partner `m' ∈ J_j` from `I_j ≡_{γ+1} J_j`, the two sub-intervals `≡_γ` by the lemma inside `I_j`; conversely `m'` lies in `J_j` by atomic type | holds with `add_one` as at the pin (previous level retained, `:70`); none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0, 1, 2, 3`; cut after `ξ = ω^γ μ + ρ` | remainder of `ω^(γ+1) δ` after `ξ + 1`: `ω^(γ+1)(δ − δ₁) ≠ 0`; `m'` exists since `ω^γ + ρ < ω^(γ+1)`; `γ = 1`: empty against nonempty F; `ω`, `ω·2` at level 2 T, `ω`, `ω + 1` at level 2 F; `γ = 3`: `ω²·5 + ω + 3` against `ω² + ω + 3` at level 2 T (emptiness of the two sides matches) | sound; `δ, ε ≠ 0` needed; none |
| 6.2 headline | types `ω^(1+β)`, `ω^(1+β)·2`; `β = 0` | both countable and infinite (`ω`, `ω·2` at `β = 0`; `ω^β` would be `1`); not isomorphic; `BFEquiv (1+β)` T, so `BFEquiv β` T (`mono`, `:96`); base `exists_uniform_bfSeparation` gives F | contradiction for arbitrary `K`; none |
| 6.2 consequences | invariant Borel `K`; `K = ∅` | complement of non-isomorphic pairs `= (iso ∩ K×ˢK) ∪ (K×ˢK)ᶜ`, analytic; base 4.3 output is ambient, pulled back along `val × val` it is the graph of `classIso K` | sound; none |
| 6.4 obstruction, (a) | `ρ = 0`; `A = g '' B`, `ρ = 0` on `A`, `1` off it; `ρ ≡ ω₁`; `K = ∅` | `K_0 = K`: (a) is ¬(6.2); `K_0 = A`: diagonal of `A` is `(val×val)⁻¹ Δ`, T; ambient: preimage under `c ↦ (c,c)` is `A`, F; in general ambient ⇔ subtype ∧ `K_α` measurable, since `c ≅ c`; `ρ ≡ ω₁`: (b) F on a singleton | subtype reading is the weaker one and the proof uses exactly it; none |
| 6.4 proof | reduction `f : graphClass → K` | image analytic (`MeasurableSet.analyticSet_image`, `Polish/Basic.lean:353`), inside some `K_α`; `(x,y)` in graph ⇔ `(f' x, f' y)` in graph of `classIso K_α` | valid; none |
| 6.5 lower part | unary class against `eZero` | `ℵ₀` against `2^ℵ₀` classes: `eZero →` unary F; unary smooth (`isSmooth_of_countable_quotient`, `:289`), so `→ ⊥ → eZero` T | sound; none |

Remark needing no change: in the second Check of 6.4 the two readings differ at the stratum `α = 0`;
with `ρ = ω₁` off `A` instead of `1`, every stratum equals `A` and the two hypotheses (a) differ as
wholes. The Check as written is correct.

### Sources: the seeded sample

No locator is flagged as unverified by the author beyond the settled uncertified works. Cached texts
opened at the cited lines:

| Target | Locator read | Result |
| --- | --- | --- |
| 0.2 | paolini-shelah-tfab lines 70–73 (Definition 1.2), 88–91 (Remark 1.5; the failure of the converse at line 91) | match; the source has standard Borel spaces, the README measurable spaces |
| 1.3 | camerlo-gao-boolean lines 87–93; paolini-shelah-tfab lines 60–64 | match |
| 2.1, 2.2 | montalban-cst1 line 4572 (Theorem VI.27), lines 4623–4654 | supports "classical, different gadgets"; the constructions are the roadmap's own and were checked directly |
| 2.3 | camerlo-gao-boolean lines 111–112; paolini-shelah-tfab line 125 | match |
| 3.1 | montalban-cst1 lines 4258–4260, 4273–4275 | match (dense preimages; densely labelled orders) |
| 3.2 | montalban-cst1 lines 4205–4285 (Lemma VI.18) | match; the source uses a category argument, the README a tuple system |
| 3.3 | montalban-cst1 lines 4246–4288 (label + 2 at 4288) | match |
| 3.5 | camerlo-gao-boolean lines 257–263, 276–281 | background for the binary case, as stated |
| 4.1, 4.2 | becker-kechris-bams lines 126–131, 132 (Theorem 2.1), 172–177 (Corollary 2.2), 247–268 | match; the anchored route is the roadmap's own |
| 6.1 | montalban-cst2 lines 2322–2331 (Lemma II.37), 2337–2425 (Lemma II.38, Corollary II.39) | match; one-sided levels there |
| 6.2 | paolini-shelah-tfab lines 103–106 (Fact 1.7) | match (non-Borel part) |
| Scope | paolini-shelah-tfab lines 169–171; camerlo-gao-boolean lines 405, 555; montalban-cst2 line 8946 | match |
| 0.1 | paolini-shelah-tfab line 83 | R01 |
| 6.4, 6.5, parts of 2.3, 3.3, 3.5 | friedman-stanley-1989, hjorth-kechris-1996, gao-idst | not read (settled uncertified) |

All twelve cited works have manifest entries; none was added or changed; no request was written.

### Pinned declarations opened

`RelationalConfiguration`, `Atom`, `restrict`, `eval_restrict`, `perm_smul_def`, `eval_perm_smul`,
the `MeasurableSpace` instance (`ModelTheory/RelationalConfiguration/Basic.lean:75, :71, :211, :215,
:304, :309, :182`); `continuous_uncurry_restrict`, `mk_le_continuum` (`Topology.lean:70, :109`);
`Equiv.Perm.instTopologicalSpace`, `continuous_inv_apply`, `hasBasis_nhds_one_fixingSubgroup`
(`Topology/Algebra/Group/Perm.lean:42, :58, :149`); `BFEquiv`, `zero`, `add_one`, `limit`, `mono`,
`symm`, `trans` (`ModelTheory/BackAndForth/Equivalence.lean:49, :65, :70, :90, :96, :126, :144`);
`BorelReducible`, `borelReducible_iff_exists_eq_comap`, `borelReducible_comap`,
`exists_measurable_injective_quotient`, `lift_mk_quotient_le`, `measurableSet_setOf`, `IsSmooth`,
`isSmooth_of_countable_quotient` (`SetTheory/Descriptive/BorelReducibility.lean:100, :108, :115,
:135, :146, :159, :229, :289`); `eZero`, `eZero_iff_finite`, `measurableSet_eZero`,
`not_isSmooth_eZero`, `not_isSmooth_of_borelReducible_eZero`, `mk_quotient_eZero`,
`borelReducible_bot_eZero` (`EZero.lean:81, :95, :105, :214, :219, :238, :243`); `GraphRelation`
(`Infinitary/GraphTranslation/Language.lean:72`; its symbols live in `Type (max u v)`);
`scottHeight` (`Scott/Height.lean:133`). Mathlib: `Measurable.exists_continuous`,
`MeasurableSet.analyticSet_image`, `AnalyticSet.measurableSet_of_compl`,
`MeasurableSet.image_of_measurable_injOn` (`MeasureTheory/Constructions/Polish/Basic.lean:331, :353,
:524, :836`), `Prod.borelSpace` (`Constructions/BorelSpace/Basic.lean:656`), `Language.graph`
(`ModelTheory/Graph.lean:49`), `Descriptive.tree` (`SetTheory/Descriptive/Tree.lean:32`),
`Order.iso_of_countable_dense` (`Order/CountableDenseLinearOrder.lean:246`). The other names are
covered by round 5's list at the same pins.

Duplication by object: a grep of both pins for a topology or σ-algebra instance on `Equiv.Perm`
finds only Tau Ceti's topology (`Perm.lean:42`) and instance arguments in
`Probability/Distributions/Uniform/Permutation.lean:38`; no `ContinuousSMul` on codes, no Borel
completeness, set reducibility or class of linear-order or tree codes.

### Cross-roadmap citations, ownership and overlap

- CountableStructureSpaces (open, a new roadmap of another author; read at its head): Layer 0
  closedness of the graph-code range (still to build there); Layer 1.2 joint continuity; Layer 1
  acceptance check; Layer 3 `analytic_treeHeight_bounded`; 4.3
  `measurableSet_iso_inter_of_scottHeight_le` (countably many symbols, `φ`, `β < ω₁`, bound on
  `modelsOf φ`, ambient conclusion); 4.4 `exists_uniform_bfSeparation` (`[L.IsRelational]`, analytic
  set of non-isomorphic pairs); Layer 5 `lopez_escobar` (measurable and invariant gives `modelsOf φ`);
  6.2 `wellOrderClass`, `exists_mem_wellOrderClass_type_eq` (`ω ≤ β < ω₁`, strict),
  `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass`; worked example 2. Each
  exists with the hypotheses this design uses.
- NoncompactQuantumSymmetry (earlier in the merge order): Layer 4, M1.BorelRealization,
  `exists_polishTopology_continuousSMul`, signature as the contract states it.
- On main: BorelEquivalenceRelations §5.1–§5.4; InfinitaryModelExistence 0.3 and Layer 6;
  CountableModelCounting Layer 0 (`isoSetoidOn`, transport between presentations); InfinitaryLogic
  (completed).
- `roadmaps grep` over main and the open heads for `BorelComplete`, `classIso`, `linearOrderClass`,
  `treeClass`, `SetReducible`, `universalLanguage`, a `MeasurableSpace` on `Equiv.Perm`,
  Friedman–Stanley: no other owner. CountableModelCounting's "Borel complete invariant" is another
  notion. The overlaps file lists no other pull request changing this roadmap, no dropped id, no
  revision-only id and no second copy.

Overlap check: read CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting; nothing shared (the coding space and its base theorems are CountableStructureSpaces', general reducibility and E₀ are BorelEquivalenceRelations', isomorphism on the models of one sentence is CountableModelCounting's, `classIso` on arbitrary sets and Borel completeness are this roadmap's).

### Supplier order

All *Needs:* lines and layer Dependencies read: no upward citation, cycle, forbidden supplier or
unowned prerequisite; no gap is declared and none is needed. Gate output:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

### Shape, headline theorems, residue

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven
layers each ending with Examples and Dependencies, Downstream consumers, References. Every
definition has API bullets and at least three Checks; every theorem its hypotheses and a locator or
the mark "own construction". A grep finds no LaTeX delimiters, pull-request numbers, dates, machine
paths, round labels or "optional/deferred" wording.

Headline theorems for the package stage, all statable at the pins with real-bodied definitions:
`borelComplete_graphClass`, `borelComplete_linearOrderClass`, `borelComplete_treeClass`,
`exists_continuous_reduction_graphClass_linearOrderClass`,
`exists_equivariant_measurableEmbedding_universal`, the four `borelComplete_iff_…` equivalences,
`bfEquiv_omega0_opow_mul`, `not_measurableSet_classIso_of_borelComplete`,
`borelReducible_eZero_of_borelComplete`, `not_isSmooth_of_borelComplete`,
`not_borelComplete_of_rank_bounded`. The padding probe has nothing to run on at this stage.

### Copyright and arrangement

Wording compared at every locator of the sample and at seven further passages (Convention 2 and the
definition of `BorelComplete` against paolini-shelah-tfab lines 95–101; `SetReducible` against lines
70–73; 4.1 against becker-kechris-bams lines 126–131; the proof of 4.2 against lines 247–268; the
parent definition of 3.2 against montalban-cst1 lines 4279–4283; 2.2 against lines 4641–4654; 6.1
against montalban-cst2 lines 2322–2331): the statements share only what the mathematics forces
(the reducibility formula, the parent formula); the proofs take other routes. No table, figure or
list is taken over. paolini-shelah-tfab has the largest share of locators; its sections (introduction,
preliminaries, combinatorial frame, torsion-free abelian groups, endorigid groups) correspond to no
layer here.

Source independence: 22 passages compared with 5 sources, none shared; largest share paolini-shelah-tfab, 11 of 47 locators; contents compared with paolini-shelah-tfab: independent. The seven uncertified works (17 of the 47 locators) could not be read.

## Not verifiable

- The seven settled uncertified texts (friedman-stanley-1989, gao-idst, becker-kechris-1996,
  kechris-cdst, hjorth-2000, hjorth-kechris-1996, mekler-1981): cited by locator only; their section
  numbers could not be checked. Not requested again. The proofs of the targets citing them (2.3,
  3.3–3.5, Layer 5, 6.4, 6.5) were checked directly.
- The Annals numbering of paolini-shelah-tfab: the cached text is arXiv v6, as the manifest notes.
- Lean elaboration, binder inventories and the one-tactic probe: no `Suggested.lean` at the design
  stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the roadmap index (README and
  `Suggested.lean` at each head), not through other files of those branches.

## Source issues

- **Error** in montalban-cst2 at Lemma II.37, printed pages 35–36: the source says comparing the intervals cut out by weakly increasing tuples decides the back-and-forth relation; it should also require the two tuples to have the same equality pattern; affects a stated result.
- **Error** in montalban-cst1 at the proof of Lemma VI.18, printed page 91: the source says finite sequences of rationals in lexicographic order form a copy of the rationals; it should say a dense order whose least element is the empty sequence; affects the proof.
- **Error** in camerlo-gao-boolean at the definition of rooted binary tree, printed page 496: the source says a root, unique parents and at most two children identify the order with a subtree of binary sequences; it should also require finite ancestor sets; affects a stated result.
- **Error** in becker-kechris-bams at §2, arXiv page 4: the source says the coding space of every nonempty countable relational language is homeomorphic to Cantor space; it should exclude languages with only finitely many symbols, all nullary; affects nothing.

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are author's drafts fetched from the author's page (manifest entries of those ids); they are cited for locators only, and the published volumes' numbering was not compared.
- **Not tested.** Seven cited works are uncertified and unread, among them friedman-stanley-1989, the primary source of Layers 2, 3 and 6.4 (7 of 47 locators): wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "02829365328386b445e1a7c243abc04b4a2b3b34", "job": "REV-DESIGN-CountableStructureSpacesPartII~6", "model": "fable", "worker": "chris-x26"} -->
