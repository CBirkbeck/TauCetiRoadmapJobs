# PKG-CountableStructureSpacesPartII

Deliverables: `packages/CountableStructureSpacesPartII/README.md`, `Suggested.lean`,
`metadata.toml` (`topic = "math.LO"`, as the sibling roadmaps BorelEquivalenceRelations and
CountableModelCounting on main), `sources.toml` (updated). `design/plan.json` is unchanged: no
supplier gap is needed, `gaps` stays `[]`.

The design was accepted with no finding; the accepting review's only notes are two questions for
human reviewers (the author's drafts of montalban-cst1 and montalban-cst2 are cited for locators
only; six uncertified works, among them friedman-stanley-1989, could not be read). Both still
apply and are not changed by this package. Every target, Check and worked example of the design is
kept in the README.

## Headline theorems

All are statable at the pins and all are stated in `Suggested.lean` (namespace
`TauCetiRoadmap.CountableStructureSpacesPartII`):

| Headline | Lean name | Status |
| --- | --- | --- |
| Countable graphs are Borel complete (Friedman–Stanley) | `borelComplete_graphClass` | stated |
| One continuous reduction of all graph codes to linear-order codes | `exists_continuous_reduction_linearOrderClass` | stated |
| Countable linear orders are Borel complete | `borelComplete_linearOrderClass` | stated |
| Countable trees are Borel complete | `borelComplete_treeClass` | stated |
| Becker–Kechris universal Borel S∞-space | `exists_equivariant_measurableEmbedding_universal` | stated |
| Characterisation by graphs | `borelComplete_iff_graphClass` | stated |
| Characterisation by whole structure spaces | `borelComplete_iff_forall_structureSpace` | stated |
| Characterisation by Borel, not necessarily invariant, classes | `borelComplete_iff_forall_measurableSet` | stated |
| Characterisation by Borel S∞-spaces | `borelComplete_iff_forall_permSpace` | stated |
| Back-and-forth equivalence of ordinal multiples | `bfEquiv_omega0_opow_mul` | stated |
| Borel complete isomorphism is not Borel | `not_measurableSet_classIso_of_borelComplete` | stated |
| Unbounded Scott height | `exists_lt_scottHeight_of_borelComplete` | stated |
| E₀ reduces to Borel complete isomorphism | `borelReducible_eZero_of_borelComplete` | stated |
| Continuum many isomorphism types | `mk_quotient_classIso_of_borelComplete` | stated |
| Not smooth | `not_isSmooth_of_borelComplete` | stated |
| Friedman–Stanley obstruction | `not_borelComplete_of_rank_bounded` | stated |

Definitions added only to state them, all with real bodies on pinned carriers: `classIso`
(`Setoid.comap Subtype.val (isoSetoid L α)`), `BorelComplete`, `graphClass` (`{c | IsSimpleGraph
c}`), `linearOrderClass` (models of Mathlib's `linearOrderTheory`), `treeClass` (models of
`partialOrderTheory` with a least element and finite chain down-sets), `instMeasurableSpacePerm`
(`borel (Equiv.Perm ℕ)`; a local `[MeasurableSpace (Equiv.Perm ℕ)]` hypothesis is flagged by the
pinned linter as an instance assumption with no free variables, so the design's 4.1 definition is
the instance), `universalLanguage` (`Functions _ := Empty`, `Relations _ := Unit`).

Considered and not treated as a headline: the function-symbol extension of Layer 1.3 (a Borel
complete relational class receives every invariant Borel class of a countable language with
function symbols). It is a robustness result for the definition, not an end theorem; stating it
needs four further definitions (the functional coding space, its σ-algebra, decoding, and its
isomorphism setoid). It stays a README target. Likewise the universe and renaming laws of 1.2,
the incidence and tag gadgets, the unravelling lemma and the presentations of trees.

## What the README could not support

Nothing is missing from the README. The numbers of the six settled uncertified works are cited by
locator only (as recorded in `sources.toml`); every target that cites them was checked directly.
No notion was moved down from a later roadmap.

## Corrections made against the design (all mathematical content kept)

1. **Unbounded Scott height (6.2) rerouted through the pin and generalised.** The design proved it
   for invariant Borel `K` from CountableStructureSpaces Layer 5 (`lopez_escobar`) and Layer 4.3
   (`measurableSet_iso_inter_of_scottHeight_le`). The pinned Tau Ceti has
   `TauCeti.RelationalConfiguration.bfEquivSetoid`, `isoSetoid_le_bfEquivSetoid`,
   `measurableSet_setOf_bfEquivSetoid` (`ModelTheory/RelationalConfiguration/BackAndForth.lean`,
   lines 105, 127, 144) and `TauCeti.nonempty_equiv_of_bfEquiv_of_scottHeight_le`
   (`ModelTheory/Scott/Height.lean`, line 186). These give the result for every `K` with
   `BorelComplete K`, without invariance or Borelness: if every code of `K` has Scott height at
   most `β < ω₁`, isomorphism on `K` is level-`β` equivalence, whose graph is Borel. The two base
   supplier rows (Layers 4.3 and 5) and the `modelsOf` row of the Tau Ceti contract are deleted
   because nothing else uses them; the new pinned declarations are added to the Tau Ceti
   contract and to "Scope and ownership".
2. **3.3: the named continuous reduction is stated for all codes.** The design's
   `exists_continuous_reduction_graphClass_linearOrderClass` restricted a map that its own proof
   shows is a reduction on all codes of `Language.graph` with values in `linearOrderClass`. The
   stronger form is stated as `exists_continuous_reduction_linearOrderClass`; the restriction to
   `graphClass` is a sentence of 3.3.
3. **4.2 stated as a measurable embedding.** "Measurable and injective" is the same as
   `MeasurableEmbedding` for a standard Borel domain and a countably separated codomain (Mathlib
   `Measurable.measurableEmbedding`, `Polish/Basic.lean` line 883). The Lean statement uses
   `MeasurableEmbedding`, for `X` in any universe; the README says so.
4. **6.1 stated on `Ordinal.ToType`.** `bfEquiv_omega0_opow_mul` is stated for
   `(ω ^ γ * δ).ToType` and `(ω ^ γ * ε).ToType` with Mathlib's `orderStructure`; the form for
   arbitrary well-orders of these types (used in 6.2) is one application of
   `FirstOrder.Language.Equiv.bfEquiv` and `BFEquiv.trans`, as the README says.
5. **Continuum many types (6.3) named.** `mk_quotient_classIso_of_borelComplete`, with the
   README noting that the upper bound needs countably many relation symbols.
6. **Set reducibility (0.2) in prose.** The design's backticked `SetReducible` named no
   declaration of `Suggested.lean`; the definition and its API are written in prose.
7. **6.4 route made precise.** The analytic image of a reduction defined on the subtype
   `graphClass` is obtained by extending it measurably to the whole coding space (constant off
   the measurable set `graphClass`) before applying `MeasurableSet.analyticSet_image`.
8. **6.5 hypotheses.** "Invariant Borel `K`" dropped: the three claims hold for every `K` with
   `BorelComplete K`.
9. **Conventions 5 and 4.1** name `instMeasurableSpacePerm`; the Mathlib contract adds
   `partialOrderTheory`, `IsChain`, `Measurable.measurableEmbedding`,
   `MeasurableSet.standardBorel`, `Cardinal.continuum`.
10. **`sources.toml`**: `cited_for` now lists README sections (the design listed `plan.json` target
    ids); the locators of paolini-shelah-tfab (adds lines 60–64 and 125, which the README cites;
    drops Notation 1.8 and Convention 1.9, which it does not), montalban-cst2 (drops Theorem XI.3
    and lines 9046–9054, not cited) and camerlo-gao-boolean (names the cited passages) now match
    the README. No key added, renamed or removed; nothing fetched; no `needs-references.toml`.

## Duplication sweep

By object, not name. Pins: grep of Mathlib and Tau Ceti for `BorelComplete`, `classIso`,
`SetReducible`, `linearOrderClass`, `treeClass`, `universalLanguage`, a `MeasurableSpace` instance
on `Equiv.Perm`, a `ContinuousSMul (Equiv.Perm _) (RelationalConfiguration _ _)` instance,
López–Escobar, uniform separation, `wellOrderClass`, tree heights. Found: no Borel completeness,
no restricted class isomorphism, no set reducibility, no σ-algebra on `Equiv.Perm` (Tau Ceti's
`Probability/Distributions/Uniform/Permutation.lean` takes one as a hypothesis), only
`ContinuousConstSMul` for the logic action (base Layer 1.2 still owns joint continuity). Tau
Ceti's `TauCeti.ContCohomology.graphClass` is an unrelated cohomology class. Roadmaps (main and
the open heads, `roadmaps grep`): `BorelComplete`, "Borel complete", "Borel-complete",
"S∞-complete", `classIso`, "Becker–Kechris", "Friedman–Stanley", "universal Borel",
`universalLanguage`, `MeasurableSpace (Equiv.Perm`, `omega0_opow_mul`, `linearOrderClass`,
`treeClass`, "set reducib": only the base's out-of-scope line (CountableStructureSpaces README
line 1032), BorelEquivalenceRelations' out-of-scope list (Polish group actions and the logic
action, Becker–Kechris special cases of Glimm–Effros), CountableModelCounting's "Borel complete
invariant" (another notion), RefinedTraceMethods' Borel-complete spectra and
ClassicalErgodicTheory's Borel complete sections (unrelated). Board packages on the subject
(BorelEquivalenceRelations, CountableModelCounting, CountableStructureSpaces,
InfinitaryModelExistence) are the roadmaps cited as suppliers.

Removals: no target of the design exists elsewhere, so no target is deleted. The supplier
citations of CountableStructureSpaces Layer 4.3 and Layer 5 and of Tau Ceti `modelsOf` are
replaced by pinned declarations (correction 1). Ownership against open pull requests was checked
through the roadmap index (README and `Suggested.lean` at each head); this roadmap owns Borel
completeness, `classIso`, set reducibility and the universal S∞-space, which the base and
BorelEquivalenceRelations both name as outside their scope. No declaration of `Suggested.lean`
has the qualified name of a declaration in another roadmap.

Citations re-resolved this round: CountableStructureSpaces at its open head (Layers 0, 1.2, 3,
4.1, 4.2, 4.4, 6.2, worked example 2; the 3-cycle acceptance check), NoncompactQuantumSymmetry at
its head (Layer 4, M1.BorelRealization, `exists_polishTopology_continuousSMul`: Polish group with
`BorelSpace`, standard Borel `X`, `MeasurableSMul₂`), BorelEquivalenceRelations §5.1–§5.4,
CountableModelCounting Layer 0 (`isoSetoidOn`, transport between presentations),
InfinitaryModelExistence 0.3 and Layer 6, InfinitaryLogic Layer 1 (under `Completed/`), all on
main. `roadmaps resolve` on the README: no citation and no Lean name found nowhere. The overlaps
file lists no pull request changing this roadmap, no dropped id and no revision-only id.

## Adversarial pass

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Convention 4, logic action | one unary `P = {0}`, `σ` the 3-cycle `0 ↦ 1 ↦ 2 ↦ 0`; wrong model `c.restrict σ` | pin `σ • c = c.restrict σ⁻¹`: value at `P(1)` is `c(P(σ⁻¹ 1)) = c(P(0)) = true`, so `P = {1}`; wrong model gives `P(w) = c(P(σ w))`, true at `w = 2`: `{2}` | holds; none |
| `classIso` (Lean) | `Fin 2`, one unary predicate, `K = univ`; `K = {P = ∅, P = ℕ}` on ℕ; `K = ∅` | 4 codes, classes by `|P| = 0, 1, 2`: 3 classes, `{0} ~ {1}` by the transposition; both codes fixed by every permutation: 2 classes; setoid on the empty type | holds; none |
| `BorelComplete` (Lean) | `K = ∅`; one unary predicate; universe of `L'` | `L'` one unary symbol, `K' = univ` nonempty, no map into `↥∅`: false; Cantor family `P_i ∈ {∅, ℕ}` has `2^ℵ₀` types against `ℵ₀`: false; `Language.graph`, `Language.order`, `universalLanguage` elaborate in `Language.{0, 0}` (`#check`: `RelationalConfiguration.{0, 0, 0}`) | holds; none |
| `graphClass` (Lean) | empty graph; `adj(0,0)`; `adj(0,1)` only | empty-graph code in the class (proved in a scratch probe from `isSimpleGraph_toRelationalConfiguration`); diagonal bit true: out; asymmetric: out | holds; none |
| `linearOrderClass` (Lean) | `(ℕ, ≤)`; `(ℕ, <)`; divisibility | `(ℕ, ≤)` in the class and `(ℕ, <)` not (both proved in a scratch probe: the reflexivity axiom fails at `0`); `2 ∤ 3`, `3 ∤ 2`: not total | holds; none |
| `treeClass` (Lean) | `(ℕ, ≤)`; star; `(ℕ, ≥)`; ℤ; `c_n` | down-set of `x` is `{0, …, x}`, `x + 1` elements, a chain: in; star down-sets `{0, x}`: in; down-set of `0` in `(ℕ, ≥)` is ℕ: out; no least element: out; `c_n → (ℕ, ≥)` coordinatewise (bit `(i, j)` is `[i ≥ j]` for `n > max(i, j)`): not closed | holds; none |
| `exists_continuous_reduction_linearOrderClass` (generalised) | `χ = 0, 4`; empty against complete graph; constant-true code; distinct blocks | block orders `2 < 3 < … < 0 < 1` (type `ω + 2`) and `6 < … < 0 < … < 5`; colour of `[1, 1/2]` (vertices `(0, 1)`, distinct, not adjacent) absent for the complete graph; constant-true: finite class of size `χ + 2` with diagonal bit true, no simple-graph image has it; `x < x·(r − 1) < x·r` gives infinite intervals between blocks | reduction on all codes; statement generalised (correction 2) |
| `borelComplete_graphClass` | `L'` empty; `R = {(0, 1)}`; two unary symbols uncoloured | one code, points with `K₃` tags; tuple vertex of `atom R ![0,1]` degree 3, of `atom R ![1,0]` degree 2; `P₁ = {0}` against `P₂ = {0}` have isomorphic uncoloured graphs, so the tags are needed | holds; none |
| `borelComplete_treeClass` | `χ = 0, 1`; constant-true code | heights above the tag root 2 and 3; constant-true image in `treeClass` with a height no simple graph's image has | holds; none |
| `instMeasurableSpacePerm` | wrong model `⊤` | `borel` of the pointwise topology; Polish (`instPolishSpace`) so standard Borel; with `⊤` the product σ-algebra on `Perm ℕ × X` grows and `MeasurableSMul₂` would admit non-Borel actions | definition pins the Borel σ-algebra; none |
| `universalLanguage` | arities 0, 1, 2; wrong model `Relations n = ℕ` | one symbol per arity (`Unit`), no function symbols; the `ℕ`-per-arity language is the intermediate of 4.2 step 2, not becker-kechris-bams line 172–175's `{R_n}` | holds; none |
| `exists_equivariant_measurableEmbedding_universal` | `X = ℕ`, `S_n = {n}`, `g = (0 1)`; `X` empty; one point; packing `m = 0, 1, 2` | `Φ 1` marks `1`; `g • Φ 1` reads `Φ 1` at `g⁻¹ ∘ (a)`: at `a = (0)`, `g⁻¹ 0 = 1`, true, so marks `0` = `Φ (g • 1)`; empty map is a measurable embedding; one point: code of injective tuples fixed by every `g`; `unpair 0 = (0, 0)`, `unpair 1 = (0, 1)`, `unpair 2 = (1, 0)`, `pair 1 0 = 2` | holds; stated as `MeasurableEmbedding` (correction 3) |
| `borelComplete_iff_graphClass` | `graphClass`; `∅`; one unary predicate | T ↔ T (identity); F ↔ F (no map from the nonempty `graphClass` into `↥∅`); F ↔ F (`2^ℵ₀` against `ℵ₀` classes) | holds; none |
| `borelComplete_iff_forall_structureSpace`, `_forall_measurableSet` | `∅`; `B = {P = {0}}` | no map from a nonempty coding space into `↥∅`: F ↔ F; `classIso B` has one class and reduces to any nonempty class by a constant map | holds; none |
| `borelComplete_iff_forall_permSpace` | trivial action on Cantor space; universe `w` | orbit relation is equality, reducible to `classIso graphClass` by 6.3; logic action of `L'` lifted to `ULift.{w}` has orbit relation `isoSetoid L' ℕ` up to `ULift.up` | holds; none |
| `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`, `δ = 1`, `ε = 2`; `δ = 0`; successor step | `ω^0 · δ = δ`, level 0 is atomic type of empty tuples: T; singletons share atomic type (`m ≤ m`): T; `ω · 0 = 0` empty against nonempty fails forth at level 1, so `δ ≠ 0` is needed; cut `ξ = ω^γ·μ + ρ` in `ω^(γ+1)·δ`, rest `ω^(γ+1)·(δ − δ₁) ≠ 0`, partner `ω^γ·μ' + ρ < ω^(γ+1)` | holds; stated on `ToType` (correction 4) |
| `not_measurableSet_classIso_of_borelComplete` | `graphClass`; one unary predicate; `ω^(1+β)` against `ω^(1+β)·2` | contradiction at the base's level `β`; unary codes have Borel graph and are not Borel complete; distinct countable infinite types, `BFEquiv (1 + β)` then `β ≤ 1 + β` | holds; none |
| `exists_lt_scottHeight_of_borelComplete` (rerouted, generalised) | one unary predicate (heights at most `ω`); universes | no code above `ω`, consistent with not Borel complete; `scottHeight` of `ℕ` is in `Ordinal.{0}`, `measurableSet_setOf_bfEquivSetoid` needs `β < Ordinal.omega 1` at `o = 0`; graph of `classIso K` = preimage of the level-`β` graph under the measurable inclusion | holds for every `K`; hypotheses dropped (correction 1) |
| `borelReducible_eZero_of_borelComplete` | `0^ω` against `1 0^ω` and `1^ω`; single copies | copy `F ↦ F ∆ {0}` matches `P = x ∆ F`; finitely against cofinitely many `P`-points in every copy; one copy per real reduces equality only | holds; none |
| `mk_quotient_classIso_of_borelComplete` | countable `L`; uncountably many unary symbols | `𝔠 = #(Quotient eZero) ≤ #types ≤ #codes ≤ 𝔠` (`mk_quotient_eZero`, `mk_le_continuum`); without countability `#codes` exceeds `𝔠`, so the hypothesis is kept | holds; none |
| `not_isSmooth_of_borelComplete` | one unary predicate | countably many Borel classes: smooth, consistent with not Borel complete | holds; none |
| `not_borelComplete_of_rank_bounded` | `ρ = 0`; `K = ∅`; `A = g '' B` with `B` non-measurable | (a) negates the previous theorem; (a), (b) hold and `¬ BorelComplete ∅` is true; diagonal of `A` measurable in the subtype square, not in the ambient one (preimage under `c ↦ (c, c)` is `A`); Lean takes the subtype reading | holds; 6.4 route made precise (correction 7) |
| 0.2 set reducibility (prose) | `X = Unit`, `Y = Empty`; `{0} ⊆ ℕ` | `A = ∅` but no map `Unit → Empty`: not reducible; `0 ↦ (0, 0)`, `n + 1 ↦ (0, 1)` has preimage `{0}` | holds; prose (correction 6) |

Context: `Suggested.lean` has no section `variable`s; every binder is in the declaration's own
signature. The `#check @name` inventory of all 23 declarations was elaborated in one scratch file
and compared with the README: each Layer 5 and 6 theorem carries `[L.IsRelational]` and
`[∀ n, Countable (L.Relations n)]`; `classIso` and `BorelComplete` carry only `[L.IsRelational]`
(as the README says); the universal theorem carries `[StandardBorelSpace X]` and
`[MeasurableSMul₂ (Equiv.Perm ℕ) X]` against `instMeasurableSpacePerm`; the obstruction carries
`MeasurableSet K` and both (a), (b). What changed from the inventory: the first draft bound
`[MeasurableSpace (Equiv.Perm ℕ)] [BorelSpace (Equiv.Perm ℕ)]` locally, which the pinned linter
warns against; it became the instance. The first draft also wrote `Language.{u, v}`, which is
ambiguous with Mathlib's root `Language` once `FirstOrder` is open; every binder now writes
`FirstOrder.Language`. No theorem signature uses `letI`: `bfEquiv_omega0_opow_mul` passes the
named instance `Language.orderStructure` of each `ToType` explicitly to `@BFEquiv`, and
`exists_lt_scottHeight_of_borelComplete` passes `c.toStructure` explicitly to `@scottHeight`, the
form the pinned Tau Ceti itself uses (`@BFEquiv L _ V N c.toStructure _ …` in
`TauCeti/ModelTheory/RelationalConfiguration/LevelSentence.lean`). The `#check @name` of both,
printed with explicit instances, shows `@TauCeti.BFEquiv FirstOrder.Language.order _ (ω ^ γ * δ).ToType (ω ^ γ * ε).ToType (@FirstOrder.Language.orderStructure _ (Preorder.toLE …)) … γ 0 Fin.elim0 Fin.elim0`
and `∃ c ∈ K, β < @TauCeti.scottHeight L inst ℕ (@TauCeti.RelationalConfiguration.toStructure L ℕ inst c)`:
the same statements as before, with the instance named instead of bound by `letI`.

Generality, both directions: the README's statements equal the Lean signatures (the
characterisations and consequences for countable relational `L` in any universes, `X` in any
universe, the linear-order reduction on all codes, Scott height for any `K`); 6.1 states the
`ToType` form, as the Lean does, and derives the general well-order form in one step.

## Elaboration

`lake env lean` on `packages/CountableStructureSpacesPartII/Suggested.lean`, run from the content
checkout, after the `letI` repair of `bfEquiv_omega0_opow_mul` and
`exists_lt_scottHeight_of_borelComplete`: exit 0, exactly 16 warnings, all
``declaration uses `sorry` `` (one per theorem, at lines 69, 95, 102, 107, 128, 138, 144, 151, 160,
173, 182, 190, 197, 204, 211, 221), no other message. All imported `TauCeti.*` object files were present; nothing was built. Imports: `Mathlib`
and `TauCeti.ModelTheory.RelationalConfiguration.Isomorphism`,
`TauCeti.Combinatorics.SimpleGraph.RelationalConfiguration`, `TauCeti.SetTheory.Descriptive.EZero`,
`TauCeti.ModelTheory.Scott.Height`, `TauCeti.Topology.Algebra.Group.Perm`. No `set_option`.

## Dependency check

```text
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers: CountableStructureSpaces (an open pull request of
another author adding a new roadmap folder), NoncompactQuantumSymmetry (earlier in the merge
order), BorelEquivalenceRelations, CountableModelCounting, InfinitaryModelExistence and
InfinitaryLogic (on main).

## Untrusted text

Nothing in the fetched sources, the other roadmaps or the reviews asked for any action; no
suspicious passage.
