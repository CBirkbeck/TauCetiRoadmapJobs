<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16877#issuecomment-6901391160 -->
Red team round 1 pass b (claude) of 78b884a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Two of the four characterisations in `Suggested.lean` are reshufflings of the definition

   - **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean:143-156`:
     `borelComplete_iff_forall_structureSpace` and `borelComplete_iff_forall_measurableSet`.
   - **Claim.** They are headline theorems ("four characterisations of Borel completeness").
   - **Witness.** Neither uses a target of Layers 2–4 or 6. With `BorelComplete` unfolded:
     (4) ⇒ (1) is `fun h L' _ _ K' hK' _ => h L' K' hK'`; (1) ⇒ (3) is the definition at
     `K' = Set.univ` (`MeasurableSet.univ`, invariance trivial) composed with the measurable
     equivalence `univ ≃ RelationalConfiguration L' ℕ`; (3) ⇒ (4) is `Setoid.borelReducible_comap`
     along `Subtype.val` and `BorelReducible.trans`. The README's own proof says the same
     (`README.md:1129-1130`: "with `K' = Set.univ`", "by restriction", "since an invariant Borel class
     is Borel"). The deep equivalences are (1) ⇔ (2) (needs `borelComplete_graphClass`) and (1) ⇔ (5)
     (needs the universal embedding); those stay.
   - **Repair.** Delete `borelComplete_iff_forall_structureSpace` and
     `borelComplete_iff_forall_measurableSet` from `Suggested.lean` (the README keeps conditions (3)
     and (4) of Layer 5 as targets). Then:
     - in the module docstring replace "four characterisations of Borel completeness (Layer 5)" by
       "the characterisations of Borel completeness by the graphs and by the Borel `S∞`-spaces
       (Layer 5)";
     - in `README.md:29-31` replace "the four characterisations `borelComplete_iff_graphClass`,
       `borelComplete_iff_forall_structureSpace`, `borelComplete_iff_forall_measurableSet`,
       `borelComplete_iff_forall_permSpace`" by "the characterisations
       `borelComplete_iff_graphClass` and `borelComplete_iff_forall_permSpace`";
     - in `README.md:1121-1125` drop the two backticked names from items 3 and 4 (the items stay).

2. **F02** (P3) Docstring of `bfEquiv_omega0_opow_mul` cites a source statement that is one-sided

   - **Location.** `packages/CountableStructureSpacesPartII/Suggested.lean:169-172`: "(Montalbán,
     Part 2, Lemma II.38 and Corollary II.39, in the one-step convention of `TauCeti.BFEquiv`)".
   - **Claim.** The symmetric level-`γ` equivalence of `ω ^ γ * δ` and `ω ^ γ * ε` is the cited
     lemma in another convention.
   - **Witness.** montalban-cst2 line 2339: the lemma is an equivalence between a one-sided relation
     at level `2α + 1` and a comparison of the sizes of the two factors; for `δ = 1`, `ε = 2` it
     holds in one direction only (line 2425 states the failing direction). The README says this
     correctly (`README.md:1191-1192`: "which compute the sharper one-sided levels").
   - **Repair.** Replace the parenthesis by: "(compare Montalbán, Part 2, Lemma II.38 and
     Corollary II.39, which compute the sharper one-sided relations at level `2α + 1`; the symmetric
     statement here, at level `γ` of `TauCeti.BFEquiv`, is proved directly by induction on `γ`)".
     Tested on `γ = 1`, `δ = 1`, `ε = 2`: the Lean statement asks `BFEquiv 1` of `ω` and `ω · 2`,
     which holds (any two nonempty linear orders), while the source's level-3 relation fails one way;
     the new wording claims only the former.

Two P3 findings (R01, R02). No P1 or P2 finding survived the computed pass below.

## Verified sound

Counts: 22 declarations read (15 theorems, 6 definitions, 1 instance); 31 bold or numbered README
targets read (all of Layers 0–6); 41 source locators verified against the cached texts (22 more are
uncertified, see below); 90 README Checks in 23 blocks evaluated; 14 sibling citations resolved; the
Mathlib and Tau Ceti declaration names of the supplier contracts grepped at the pins (none missing).

Elaborated signatures: I compared the worker's elaborated types of the 22 declarations
(`#check @name` output at this head) with the README statements one by one; the file has no
`variable` or `include` line, no binder is lost, and nothing changed. I ran no Lean.

Dependency check (run as the brief gives it):

    depcheck: 241 roadmaps, 2244 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

Policy: the pull request changes only `packages/CountableStructureSpacesPartII/`; no `lemma`
keyword, no `set_option`, no `#eval`/`#synth`/`#print axioms`, no sorry'd data, no pull-request
number or process narrative in the README or docstrings; every Lean name is in the README and every
backticked own name of the README is declared.

Ownership: `BorelComplete`, `classIso`, `graphClass` (as a set of codes), `linearOrderClass`,
`treeClass`, `universalLanguage` and a σ-algebra on `Equiv.Perm ℕ` occur in no roadmap on main, no
open roadmap head and neither pin (grep by object: "Borel complete", "Friedman–Stanley",
`MeasurableSpace (Equiv.Perm`, universal `S∞`-space). CountableStructureSpaces excludes "Borel
completeness of isomorphism of countable graphs or linear orders" from its scope, so this roadmap is
the owner. `isoSetoidOn` (CountableModelCounting Layer 0, at the pin) restricts to the models of
one sentence; `classIso` on arbitrary sets is not a duplicate.

Supplier citations resolved (at main or at the open head): CountableStructureSpaces Layer 0
(closedness of the range of the graph coding), Layer 1.2 (`ContinuousSMul` instance), Layers 4.1,
4.2, Layer 4.4 `exists_uniform_bfSeparation`, Layer 6.2 `wellOrderClass` (strict, as the Checks of
3.3 and 6.4 assume), `exists_mem_wellOrderClass_type_eq`, `analyticSet_compl_wellOrderClass`,
`not_measurableSet_wellOrderClass`, `analytic_type_bounded`, worked example 2;
NoncompactQuantumSymmetry Layer 4 M1.BorelRealization `exists_polishTopology_continuousSMul` (its
hypotheses `[PolishSpace G] [BorelSpace G] [StandardBorelSpace X] [MeasurableSMul₂ G X]` are met by
`instMeasurableSpacePerm := borel _`); InfinitaryLogic Layer 1;
InfinitaryModelExistence 0.3 and Layer 6; CountableModelCounting Layer 0; BorelEquivalenceRelations
§5.1–§5.4 (reducibility, smoothness, Silver, E₀). The pin lacks what the
README says it lacks: no `ContinuousSMul (Equiv.Perm α) (RelationalConfiguration L α)`, no
closedness of the simple-graph codes, no `exists_uniform_bfSeparation`, no `wellOrderClass`, no
`MeasurableSpace (Equiv.Perm ℕ)` instance in Mathlib or Tau Ceti.

Headline theorems: Friedman–Stanley for graphs, linear orders, trees; the continuous
graph-to-order reduction; the universal embedding; (1) ⇔ (2), (1) ⇔ (5); the ordinal-multiple
back-and-forth equivalence; non-Borelness; unbounded Scott height; `E₀` below; continuum many
types; the obstruction. All are stated. Layer 1.3 (function symbols) and 3.5 need the functional
coding space and a second language and are README targets only; they are not headline ends.

### The computed pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `classIso` (0.1) | `Fin 2`, one unary `P`; `K = ∅`; `K` = codes with `P` infinite-coinfinite | 4 codes, 3 classes (`|P| = 0, 1, 2`); `Setoid` on the empty type; one class, uncountably many codes | agrees with Checks | none |
| Set reducibility, empty/full targets (0.2) | `X = Unit, Y = Empty`; `X = Y = Empty`; one-point `Y` | no map; empty map works; diagonal = everything, receives `A = univ` only | agrees | none |
| Converse of Borel ⇒ set reducibility (0.2) | graph of `eZero` against the diagonal | two-valued measurable map `(0,0)`/`(0,1)` reduces any Borel set; `not_isSmooth_eZero` at the pin | agrees | none |
| Relabelling convention (1.1, Conv. 4) | `Fin 3`, `e = (0 1 2)`, `P = {0}`; logic action of the same cycle on ℕ | `restrict e.symm`: new `P(w)` iff `e.symm w = 0` iff `w = 1`; `restrict e` gives `w = 2`; `(σ • c)(P w) = c(P (σ⁻¹ w))` gives `{1}` | one convention throughout | none |
| `Fin 0` carrier (1.1) | no nullary symbol; one nullary symbol | 1 code, 1 class; 2 codes, 2 classes | agrees | none |
| `BorelComplete` (1.2) | `K = ∅`; codes of one unary predicate; `K ∩` orbit of the empty graph | no map from nonempty into `∅`; `ℵ₀` classes (`(|P|, |Pᶜ|)`) against `2^ℵ₀` from the `P_i ∈ {∅, ℕ}` family; one class | not complete in all three | none |
| Functional space, graph code (1.3) | one constant `k`, `F k = 3`; `F k = n → ∞`; action `(σ • F)⟨f, v⟩ = σ (F ⟨f, σ⁻¹ ∘ v⟩)` | relation `{3}`; limit is the empty relation, outside the range, so the range is not closed already for constants; graph of `σ • F` at `w` = graph of `F` at `σ⁻¹ ∘ w` | agrees; equivariant for Conv. 4 | none |
| Incidence graph (2.1) | colours `0, 1, 2 + 2j, 3 + 2ι(R)`; `R = {(0,1)}`; two unary symbols, uncoloured | four sorts have disjoint colour sets; degrees 3 and 2; uncoloured graphs of `P₁ = {0}` and `P₂ = {0}` isomorphic by swapping symbols | agrees | none |
| Clique tags (2.2) | one edge, `κ = (0, 1)`; `κ x = 0` | `2 + 3 + 4 = 9` vertices, `1 + 2 + 3 + 6 = 12` edges; tag is `K₃`, vertex `0` of it has `κ x + 2 = 2` triangle neighbours | agrees | none |
| `borelComplete_graphClass` | `L'` with no symbols; nullary symbol | one code; truth edge alone distinguishes the two codes | no degenerate failure | none |
| Dense colouring (3.1) | `3/4`, `5`, `−1/6`, `1/8008`; `σ = (0 1)` | `2, 0, 1, 3`; `π(1/2)` has colour `0` | agrees | none |
| Parent definability (3.2) | `x = [1, 5]`; candidate `p' = [q]`, `q < 1` | parent `[1]`: every `z` between extends `[1]`; for `p'`, `z = [(q+1)/2]` has length 1 < 2 | unique | none |
| Unravelling lemma (3.2) | `c = {adj 0 1}`, `d = {adj 1 0}`, `τ = (0 1)`; loop at `0` against the empty graph | bits at `(1,0)`: `c(adj 0 1) = d(adj 1 0) = true`; colour of `[1]` with a true diagonal bit occurs nowhere for the empty graph | (i)–(iii) agree in both | none |
| Back half of (iii) ⇒ (i) | a child `y'` of `Ψ x` | `y' = Ψ y`, `Ψ(parent y) = Ψ x`, so `parent y = x`; root fixed because colours record length | tuple system is closed under back | none |
| `exists_continuous_reduction_linearOrderClass` | block type `ω + (χ + 2)`; empty against complete graph; constant-true code | finite condensation classes are exactly the final parts, of size `χ + 2 ≥ 2`; colours differ at `[1, 1/2]`; image still a linear order | iff holds on all codes | none |
| `treeClass` | `(ℕ, ≤)`; star; `(ℕ, ≥)`; chains `c_n` | in; in; no least element and infinite down-sets; `c_n →` code of `≥` | Borel, not closed | none |
| Tagged tree (3.4) | `χ = 0`, `χ = 1` | chain above `(x, some 0)` has `χ + 2 = 2`, `3` nodes; leaves do not change the height | height recovers `χ` | none |
| Cover graph (3.5) | star `T`, `T_n` with `0 < n < 1` | `T_n → T`; edge `0—1` in the cover graph of `T` only | Borel, not continuous | none |
| Universal embedding (4.2) | `X = ℕ`, `S_n = {n}`; one-point `X`; substitution `g' = g h` | symbol `(1,0)` holds of `a` at `x` iff `x = a`; holds of injective tuples; condition at `(h • x, a)` = condition at `(x, h⁻¹ ∘ a)` | equivariant for Conv. 4; injective | none |
| Packing (4.2 step 3) | `m = 0, 1, 2` | `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)` (`pair 1 0 = 2`) | agrees with the Checks | none |
| Layer 5, (1)–(5) | `K = ∅`; `K = graphClass`; one unary predicate | all fail; all hold; (2) fails by counting | consistent | R01 |
| `borelComplete_iff_forall_permSpace` | universe `w ≠ 0` | (5) ⇒ (3) through `ULift` of the coding space; (3) ⇒ (5) uses 4.2 in any universe | true for every `w` | none |
| `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`; `ω`, `ω·2` at level 2; `ω`, `ω + 1`; successor step with `m` at `ω^γ·μ + ρ` | trivial; any two nonempty orders; holds; fails (empty upper interval); final segment `ω^(γ+1)·δ'` with `δ' ≠ 0` after absorbing `θ' + 1`, `m'` at `ω^γ·μ' + ρ < ω^γ·2 ≤ ω^(γ+1)` | true as typed; `δ, ε ≠ 0` needed from `γ = 1` | R02 (docstring) |
| `not_measurableSet_classIso_of_borelComplete` | `β = 0` in the proof; uncountable `L` | `ω^(1+0) = ω`, `ω·2`: infinite, countable, distinct; `f × f` is measurable for the product of subtype σ-algebras with no countability | true for every relational `L` | none |
| `exists_lt_scottHeight_of_borelComplete` | bound `β` on all of `K` | iso on `K` = `bfEquivSetoid L ℕ β` on `K`, Borel at the pin for `β < ω₁` and countable `L` | contradiction as claimed | none |
| `E₀` reduction (6.3) | `0^ω`, `1 0^ω`; `0^ω`, `1^ω` | copies matched by `F ↦ F ∆ {0}`; finitely against cofinitely many `P`-points | reduction | none |
| `mk_quotient_classIso_of_borelComplete` | uncountable `L` | upper bound fails without `mk_le_continuum`'s countability | hypothesis needed and present | none |
| `not_borelComplete_of_rank_bounded` | `K = ∅`; analytic `K`; `K = graphClass` with `ρ = 0` on a non-measurable set of pairwise non-isomorphic codes; `wellOrderClass` | conclusion true; reduces to 6.2; diagonal of `A` measurable in `A × A`, not in the ambient square; `K_α` = countably many Borel orbits, `ρ` unbounded | not vacuous, hypotheses as typed | none |

## Not verifiable

- friedman-stanley-1989 (8 citations: Theorem 1, §2, §3, §4), gao-idst (4), becker-kechris-1996
  (3), hjorth-kechris-1996 (3), kechris-cdst (2), mekler-1981 (2): recorded as uncertified; the
  locators were not checked against the texts. In particular the attribution of the statement of
  6.4 to friedman-stanley-1989 §4 and hjorth-kechris-1996 §4–§5, and of graphs to "Theorem 1" of
  friedman-stanley-1989, rests on the locator alone (camerlo-gao-boolean lines 111–113 credit
  graphs to earlier classical results and trees and linear orders to Friedman–Stanley).
- Truth of the sorry'd statements beyond the hand computations above: no Lean was run.

Source independence: 12 passages compared with 5 sources (paolini-shelah-tfab Definitions 1.2, 1.4,
1.6 and Fact 1.7; becker-kechris-bams lines 159–164, 172–177, 247–268; camerlo-gao-boolean lines
94–110; montalban-cst1 lines 4246–4288 and 4623–4654; montalban-cst2 lines 2322–2331 and
2337–2425), none shared beyond what the mathematics forces; largest share paolini-shelah-tfab, 14 of
63 locators; contents compared with paolini-shelah-tfab (all 14 locators lie in its introduction;
none of Layers 0–6 corresponds to one of its sections): independent. friedman-stanley-1989, the
primary source of the Layer 2–3 theorems, could not be read; its section order (§1 general theory,
§2 trees and linear orders, §3 fields, §4 torsion abelian groups, by the manifest's locator) does
not map onto Layers 0–6 one to one.

## Source issues

- none

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are cited as author's drafts (`README.md:1408-1411`),
  not as published books; 11 of 63 locators point into them by line number of the draft.
- **Not tested.** friedman-stanley-1989, the primary source of the graph, tree and linear-order
  theorems and of the name given to Layer 6.4, is uncertified: wording and arrangement were not
  compared with it.
- **Scope.** The name "Friedman–Stanley obstruction" for the statement of Layer 6.4
  (`README.md:1296`) was found in no source that could be read; the statement is the roadmap's own
  formulation.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "78b884ab52c7ffbaf7b3f895926dca87015f26eb", "job": "RT-CountableStructureSpacesPartII~1b", "model": "fable", "worker": "chris-x83"} -->
