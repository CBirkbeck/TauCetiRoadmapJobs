# Repair of CountableStructureSpacesPartII (design, round 3)

One review was resolved: `packages/CountableStructureSpacesPartII/reports/REV-DESIGN-CountableStructureSpacesPartII~2.md`. It has four findings, R01–R04, and all four are right. Files edited: `packages/CountableStructureSpacesPartII/design/README.md` and `packages/CountableStructureSpacesPartII/design/plan.json`. `packages/CountableStructureSpacesPartII/sources.toml` is unchanged: no new source is cited and no locator moved.

## R01 (P1) — applied

The supplier contracts, Conventions, Scope, every `*Needs:*` line, Layers 0–6 and the plan moved from the obsolete base interface to the native declarations at the pins. Plan baseline: `f6090c70`/`358314d4` → Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, with a declarations list. `StructureSpace L` → `RelationalConfiguration L ℕ`. `structureIsoSetoid` → `isoSetoid L ℕ`. `RelQueryOn` → `Atom`. `BorelReducible`/`IsSmooth`/`eZero` → `Setoid.BorelReducible`/`Setoid.IsSmooth`/`TauCeti.eZero`. §1.1 now bundles native `restrict e.symm`. §2.3 defines `graphClass := {c | IsSimpleGraph c}` and cites the library's equivalence and range theorems.

Evidence. CountableStructureSpaces at the head of its open new-roadmap pull request (`TauCetiRoadmap/CountableStructureSpaces/README.md` Conventions 1–3 and the ownership table) is built on `TauCeti.RelationalConfiguration`. The names `StructureSpaceOn`, `RelQueryOn`, `structureIsoSetoid`, `graphCode`, `smul_apply` and `continuousSMul_structureSpaceOn` appear nowhere there. At the Tau Ceti pin:

- `TauCeti/ModelTheory/RelationalConfiguration/Basic.lean:75` defines `RelationalConfiguration`; lines 211, 300 and 309 have `restrict`, the action and `eval_perm_smul`.
- `Isomorphism.lean:86` defines `isoSetoid`; line 141 has `isoSetoid_eq_orbitRel`.
- `TauCeti/SetTheory/Descriptive/BorelReducibility.lean:100` defines `Setoid.BorelReducible`; line 229 defines `Setoid.IsSmooth`.
- `TauCeti/SetTheory/Descriptive/EZero.lean:81` defines `TauCeti.eZero`.
- `TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean:97` defines `IsSimpleGraph`; lines 222 and 267 have the measurable equivalence and the range theorem.

**The same pattern elsewhere.** The finding named only the base and BorelEquivalenceRelations, but the same drift affected four more supplier rows. All were repaired.

- **InfinitaryLogic names.** `BFEquiv.monotone`, `potentialIso_of_equiv` and `potentialIso_iff_BFEquiv_all` are the completed roadmap's own `Suggested.lean` names. At the pin they are `TauCeti.BFEquiv.mono` (`ModelTheory/BackAndForth/Equivalence.lean:96`), `FirstOrder.Language.Equiv.bfEquiv` (line 210, which gives the "isomorphic orders are equivalent at every level" step directly) and `potentialIso_iff_bfEquiv_all` (`AllLevels.lean:91`). Also native: `TauCeti.IsTupleBFSystem` (`TupleSystem.lean:39`), `potentialIso_iff_exists_isTupleBFSystem` (`Presentation.lean:207`) and `countable_potentialIso_iff_iso` (`Countable.lean:99`). Used in §3.2, §6.1 and §6.2.
- **InfinitaryModelExistence Layers 0.3 and 6.** These objects are in Tau Ceti at the pin:
  - `smallPresentation` and `smallPresentationEquiv`: `ModelTheory/Infinitary/SmallPresentation.lean:56,72`;
  - `GraphRelation`, `graphLanguage` and `graphExpansion`: `GraphTranslation/Language.lean:72,82,230`;
  - `graphAxioms`, `model_graphAxioms_iff`, `reconstructStructure` and `reconstructStructure_graphExpansion`: `Reconstruct.lean:161,209,248,315`.

  Used in §1.2 and §1.3.
- **CountableModelCounting Layer 0 transport.** It is `FirstOrder.Language.LEquiv.onConfiguration` (`RelationalConfiguration/LanguageMap.lean:186`), with `isoSetoid_onConfiguration_iff` (line 240). Used in the universes and renaming laws of §1.2, and in the relational-language Check of §1.3, which is now stated as transport along `R ↦ GraphRelation.base R`.
- **BorelEquivalenceRelations rows that were not used.** §0.3 `AnalyticSet.prod`, §0.5 `HasCantorAntichainOn` and §5.3 `borelReducible_bot_cantor_iff` were listed as consumed but used nowhere in the body. They were dropped.

**Suppliers after the repair.** BorelEquivalenceRelations, InfinitaryLogic, InfinitaryModelExistence and CountableModelCounting remain the named owners in Scope and ownership. They are no longer roadmap suppliers in the contracts or the plan, because the roadmap consumes their implementations in Tau Ceti. CountableStructureSpaces stays a supplier only for targets that the pin does not implement and that its head states:

- Layer 0: closedness of the range of the graph coding;
- Layer 1.2: `continuousSMul_relationalConfiguration`;
- Layer 3: `analytic_treeHeight_bounded`;
- Layer 4.3: `measurableSet_iso_inter_of_scottHeight_le`;
- Layer 4.4: `exists_uniform_bfSeparation`;
- Layer 5: `lopez_escobar`;
- Layer 6.2: `wellOrderClass` and the related declarations;
- worked example 2.

`analyticSet_orbitRel_graph` was replaced by the native `analyticSet_setOf_isoSetoid` (`Isomorphism.lean:187`). Neither pin has a σ-algebra on `Equiv.Perm`, so §4.1 keeps its definition. Convention 1 now uses Tau Ceti's `[∀ n, Countable (L.Relations n)]` and states that this is equivalent to the Σ-form, which is the form `smallPresentation` takes.

**What stays new in §1.1, and why.** The library has the unbundled map `restrict` together with `restrict_id`, `restrict_comp`, `measurable_restrict` and `continuous_restrict`. It identifies relabelling with `encodeVia` only for permutations (`perm_smul_eq_encodeVia`). What §1.1 adds is the bundled homeomorphism and the identification for an arbitrary bijection. The plan target `StructureSpaceOn.relabel` was renamed `relabelHomeomorph`. A search of the open heads, main and the Tau Ceti pin found no other owner of this bundled map.

## R02 (P2) — applied

§0.2 gets a new API bullet, and plan 0.4 gets two new API entries:

- `SetReducible A ∅ ↔ A = ∅ ∧ (IsEmpty X ∨ Nonempty Y)`;
- `SetReducible A univ ↔ A = univ ∧ (IsEmpty X ∨ Nonempty Y)`.

The false Check "reducible to ∅ exactly when A = ∅" became an empty-codomain negative control: `Unit → Empty` fails both reductions, and `Empty → Empty` gives both. The one-point diagonal case is kept, with nonemptiness stated. The same pattern was searched elsewhere: the §0.1 `classIso ∅` Check is correct, because its target type is the empty subtype.

## R03 (P1) — applied

§3.3 Check, old: "colours differ at every node of length 2 with distinct entries". New: the colour of `[1, 1/2]` for the empty graph (vertices `(0,1)`, distinct and not adjacent) occurs at no node of the complete graph, so there is no colour-preserving automorphism. The two colourings differ exactly at nodes with two entries of distinct ν-values. The negative control is `[1, 2]`, which gives `(0,0)` with equal colours. The plan's 3.6 test was updated to match.

## R04 (P3) — applied

The §6.5 Check and the plan's 6.9 statement and test now say both directions explicitly:

- `eZero` is not Borel reducible to unary-predicate isomorphism (`BorelReducible.lift_mk_quotient_le` would inject 𝔠 classes into ℵ₀);
- unary-predicate isomorphism is Borel reducible to `eZero`, since it is smooth (`Setoid.isSmooth_of_countable_quotient`) and `borelReducible_bot_eZero` applies.

The phrase "does not reduce" no longer appears anywhere in the README or the plan.

## Checks

Dependency check, exact output:

```
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2122 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

`roadmaps resolve` on the edited README found no cross-roadmap citations and no Lean names that exist nowhere. It reports that it did not check the pinned Lake packages. To cover that, every Tau Ceti name newly cited in the README was grepped for its declaration in the pinned tree, and each was found. The namespaces of `SimpleGraph.*`, `TauCeti.scottHeight` and `FirstOrder.Language.*` were confirmed by reading the files. The Mathlib names cited are unchanged from the previous round and were re-checked at `1b1ccf4b`: `Measurable.exists_continuous` at `MeasureTheory/Constructions/Polish/Basic.lean:331`, `AnalyticSet.preimage` at line 366, `MeasurableSet.analyticSet_image` at line 353, `MeasurableSet.image_of_measurable_injOn` at line 836, and `ContinuousSMul.measurableSMul₂` at `Constructions/BorelSpace/Basic.lean:614`.

There is no `Suggested.lean` at the design stage. So no Lean was elaborated, no `#check @name` comparison was possible, and no build is claimed.

Gate failures listed in the brief: none.

## Adversarial pass on changed statements

| Statement | Instances | Computed values | Result / change |
| --- | --- | --- | --- |
| `SetReducible A ∅ ↔ A=∅ ∧ (IsEmpty X ∨ Nonempty Y)` | `Unit→Empty, A=∅`; `Empty→Empty`; `Unit→Unit, A=univ` | LHS F / RHS F; T / T; F (`()∈A` but `f()∉∅`) / F | holds; new API |
| `SetReducible A univ ↔ A=univ ∧ (…)` | `Unit→Empty, A=univ`; `Unit→Bool, A=∅` | F / F; F (`x∉∅` but `f x∈univ`) / F | holds; new API |
| relabelling `restrict e.symm` = `encodeVia e` | 3-cycle `e`, `P={0}` | `restrict`: `{y : e⁻¹y=0}={1}`; `encodeVia`: `{y : e.symm y=0}={1}` | equal; matches Convention 4 |
| inverse/composite laws | `e` then `e.symm`; `e` twice, 3-cycle | `restrict_comp`: `e.symm∘e=id` gives `c`; twice gives `{2}≠{0}` | Checks unchanged |
| `Fin 0` relabelling | no nullary symbol; one nullary symbol | atoms 0 → 1 code; atoms 1 → 2 fixed codes | Check unchanged |
| `graphClass` invariant | edge `{0,1}`, `σ=(1 2)` | `σ•c` has edge `{0,2}`, symmetric, loop-free | `IsSimpleGraph.restrict` covers every vertex map |
| R03 colours | `[1,1/2]`, `[1,2]`, `[1/2,1]` | ν: (0,1), (0,0), (1,0); empty vs complete adjacency at `[1,1/2]`: F vs T; at `[1,2]`: F vs F | the old Check was false; corrected |
| R04 directions | unary iso `E_u`, `E₀` | `#Q(E_u)=ℵ₀`, `#Q(E₀)=𝔠`; `E₀≤E_u` false; `E_u ≤ ⊥ ≤ E₀` true | wording fixed |
| continuum many types (§6.3) | `K` Borel complete | lower bound `𝔠` (`mk_quotient_eZero` and the quotient injection); upper bound `#Q ≤ #RC ≤ 𝔠` (`mk_le_continuum`) | holds; `K ≠ ∅` because `BorelComplete ∅` fails |
| universes law via `onConfiguration` | `L'` relational in `Language.{1,1}` | `smallPresentation` needs countable Σ-functions: Σ of empty types is empty, hence countable | holds |
| relational case of §1.3 | `L` with no function symbols | `onConfiguration` at `atom (base R) w` gives `c.eval (atom R w)`; no `graph f` atoms | range is univ, closed |
| §4.2 basis | stabilizers of finite sets | `s ⊆ {0..k−1}` gives `fix{0..k−1} ⊆ fix s` | initial segments also form a basis |
| §0.1 corestriction | `f` measurable, `f '' K' ⊆ K` | `g = ⟨f ∘ val, h⟩` measurable (`Measurable.subtype_mk`); `classIso K' = (classIso K).comap g` | `borelReducible_iff_exists_eq_comap` |
| §6.2 ordinal codes | `ω^(1+β)` vs `ω^(1+β)·2` | `Equiv.isoSetoid_encodeVia_iff`: iso ↔ equal types, false; `BFEquiv(1+β)` true, then `mono` to `β` | contradiction preserved |
| Convention 1 equivalence | `∀ n, Countable (Rel n)` vs `Countable (Σ n, Rel n)` | Σ over countable ℕ of countable types (⇒); `Sigma.mk n` injective (⇐) | holds |

## Notes for the maintainer

- **Renamed plan names.** None is cited by another roadmap: this is a design package, not yet on main.
  - `StructureSpaceOn.relabel` → `relabelHomeomorph`, with its API renamed to `relabelHomeomorph_*`;
  - `range_graphCode` → `range_toRelationalConfiguration` (a citation of the Tau Ceti theorem);
  - `measurableSMul₂_structureSpace` → `measurableSMul₂_relationalConfiguration`;
  - `structureSpace_universal_polish` → `polishSpace_universal`.
- **Supplier edges.** The roadmap now depends on CountableStructureSpaces only through targets stated at the head of its open new-roadmap pull request, and on NoncompactQuantumSymmetry Layer 4 (also an open new-roadmap pull request, checked at its head, `Suggested.lean` `exists_polishTopology_continuousSMul`). All other suppliers are Mathlib and Tau Ceti at the pins.
- **Overlaps and ownership.** The overlap report lists no open pull request that changes this roadmap and no dropped ids, and this round renumbers nothing. Ownership against open pull requests was checked through `roadmaps grep` over all open heads and main.
- **References.** No `needs-references.toml` was written; no source was missing.
- **Suspicious text.** None found in the review.
