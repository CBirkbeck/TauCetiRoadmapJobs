# PORT-CountableStructureSpacesPartII

## Result

- Branch `roadmap/countable-structure-spaces-part-ii`, head commit
  `060a878f32404b88fcffe2866b8be8f01ee14ba1`
  ("CountableStructureSpacesPartII: roadmap (README, Suggested.lean, metadata)"), one commit on
  `c639cfa`. It adds only `TauCetiRoadmap/CountableStructureSpacesPartII/{README.md,Suggested.lean,metadata.toml}`.
- Build, `lake build TauCetiRoadmap.CountableStructureSpacesPartII.Suggested`:
  `Build completed successfully (18316 jobs).` It gives 13 warnings, all
  "declaration uses `sorry`", one for each theorem. There are no other warnings and no errors.
- Gate:
  `gate CountableStructureSpacesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (the brief's `gate --depcheck … --movable` command, run after all edits):

      depcheck: 238 roadmaps, 2251 edges, 0 problem(s)

  There are no UPWARD, CYCLE or `moved:` lines.

## Draft pull request body

This roadmap continues CountableStructureSpaces. That roadmap stops at the isomorphism relation of a
single class of countable structures. This one compares the isomorphism relations of different
classes by Borel reducibility. On Tau Ceti's coding space `RelationalConfiguration L ℕ` it defines
two notions: isomorphism restricted to a class, and Borel completeness, which says that every
invariant Borel class of every countable relational language reduces to the class. It then proves
the following:

- the Friedman–Stanley theorem: countable graphs, trees and linear orders are Borel complete. The
  proof goes through explicit continuous codings: tagged incidence graphs, and the unravelling of a
  graph along a dense colouring of `List ℚ`;
- the Becker–Kechris theorem: every Borel S∞-space embeds equivariantly into the logic action of the
  language with one relation symbol of each arity;
- the characterisations of Borel completeness, by graphs and by Borel S∞-spaces;
- the consequences of Borel completeness. A Borel complete isomorphism relation is not Borel; the
  proof uses an explicit back-and-forth computation on ordinal multiples. It lies above `E₀`, has
  exactly continuum many classes and forces unbounded Scott height. The Friedman–Stanley
  obstruction says that a class stratified into pieces with Borel isomorphism, by a rank bounded on
  its analytic subsets, is not Borel complete.

These results are the standard benchmarks against which the classification problem of a class of
countable structures is measured. A roadmap on the Borel completeness of algebraic classes
(torsion-free abelian groups, Boolean algebras, groups, fields) consumes Borel completeness, the
characterisations and the obstruction.

## Dependencies that are still pull requests

- **CountableStructureSpaces.** This is the base roadmap. It is another author's open pull request
  adding a new roadmap folder, and it is not listed in the merge order. The README cites, at that
  head:
  - Layer 0: closedness of the simple-graph codes;
  - Layer 1.2: the `ContinuousSMul` instance of the logic action;
  - Layer 4.3: `measurableSet_iso_inter_of_scottHeight_le`, cited only as the model-class form of
    a step in 6.2;
  - Layer 4.4: `exists_uniform_bfSeparation`;
  - Layer 6.2: `wellOrderClass`, `exists_mem_wellOrderClass_type_eq`,
    `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass` and
    `analytic_type_bounded`;
  - worked examples 2, 3 and 5, and its Layer 1 acceptance check.

  I checked each of these today at that head.
- **NoncompactQuantumSymmetry.** It is earlier in the merge order, on the line directly before this
  roadmap. The README cites Layer 4, M1.BorelRealization, `exists_polishTopology_continuousSMul`.
  At its head this is stated for a Polish group with `[IsTopologicalGroup G] [PolishSpace G]
  [BorelSpace G]` and a standard Borel `X` with `[MeasurableSMul₂ G X]`, which is how 4.2 uses it.

The README cites no id that is defined only in an open revision. The roadmaps on main that it cites
keep these ids at the heads of their open revisions:
- BorelEquivalenceRelations §5.1–§5.4 (open revision #1616);
- CountableModelCounting Layers 0 and 1 (open revision #2012);
- InfinitaryModelExistence Layer 0.3 and Layer 6 (open revision #1615).

InfinitaryLogic Layer 1 is completed and on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the required form:
- one module docstring;
- `import Mathlib` followed by the five Tau Ceti modules it uses, all present at the pin;
- seven definitions with real bodies, needed to state the 13 headline theorems;
- no sorry'd data, no `set_option` and no examples.

It is ported byte for byte. No headline that is statable at the pins is missing. Non-smoothness
(Tau Ceti `not_isSmooth_of_borelReducible_eZero` applied to
`borelReducible_eZero_of_borelComplete`) and conditions (3) and (4) of Layer 5, which follow almost
directly from the definition, stay in the README as targets. That was already the case in the
package.

**Signature check.** The only Lean command allowed is the module build. So I appended `#check @name`
for all 20 declarations to a temporary copy of `Suggested.lean`, together with the pinned
declarations newly cited (below) and a few witnesses. I built it with the brief's command and then
restored the file; `cmp` against the saved copy confirmed the restore.

I compared each elaborated type with its README statement. Nothing differs and no binder is lost:
- countability of `L` is carried by exactly `exists_lt_scottHeight_of_borelComplete`,
  `mk_quotient_classIso_of_borelComplete` and `not_borelComplete_of_rank_bounded`, as Convention 1,
  6.2, 6.3 and 6.4 say;
- `bfEquiv_omega0_opow_mul` is over `Ordinal.{u_1}`, as Convention 10 says;
- `X : Type u_1` in 4.2 and `X : Type u_3` in Layer 5 (5), matching "any universe" and "a fixed
  universe".

The Lean file was not changed.

## Supplier replacements and duplication removals

1. **6.2, the Scott-height step is now a pinned lemma.** The package proved by hand that
   isomorphism on `K` is `BFEquiv β` when every code of `K` has Scott height at most `β`, from
   `isoSetoid_le_bfEquivSetoid` and `nonempty_equiv_of_bfEquiv_of_scottHeight_le`. Tau Ceti at the
   pin already has this, for an arbitrary set `K` and with no countability:
   `TauCeti.IsIsolatingRank.comap_isoSetoid_eq_bfEquivSetoid` applied to
   `TauCeti.isIsolatingRank_scottHeight` (`TauCeti/ModelTheory/Counting/Stratification.lean`).
   - In the scratch build, `(isIsolatingRank_scottHeight L).comap_isoSetoid_eq_bfEquivSetoid hK`
     has type `classIso K = (bfEquivSetoid L ℕ β).comap Subtype.val`.
   - The README now cites the lemma and deletes the restatement. The 6.2 *Needs:* line, the Tau Ceti
     contracts and the Layer 6 Dependencies are updated to match.
   - Scope and ownership now lists isolating ranks as CountableModelCounting Layer 1, implemented
     at the pin.
2. **0.1, restricted isomorphism on model classes.** Tau Ceti implements CountableModelCounting
   Layer 0's `isoSetoidOn` at the pin as `TauCeti.RelationalConfiguration.isoSetoidOn V φ`, an
   abbreviation for `(isoSetoid L V).comap Subtype.val` on `modelsOf φ`
   (`TauCeti/ModelTheory/Counting/Classes.lean`, `RelationalConfiguration/ModelsOf.lean`).
   - `classIso` stays: it is the general form, for arbitrary and possibly non-invariant sets, which
     the 0.1 restriction law, Layer 5 (4) and the strata of 6.4 need.
   - In the scratch build, `classIso (modelsOf φ) = isoSetoidOn ℕ φ` holds by `rfl`.
   - The README records this in Scope and ownership (one clause on how the two differ, and that
     they agree on model classes), in a new 0.1 API bullet, in a new 0.1 Check, in the Tau Ceti
     contracts and in the Layer 0 Dependencies.
3. **Duplication sweep, by object.** I searched every roadmap on main and every open roadmap pull
   request at its head with `roadmaps grep`, for:
   - "Borel complete";
   - Friedman–Stanley and Becker–Kechris;
   - a σ-algebra on `Equiv.Perm`, S∞-spaces and universal G-spaces;
   - the seven definition names.

   The board packages index lists no other package. What turned up:
   - "Borel complete" hits are other notions (Borel-complete spectra in RefinedTraceMethods,
     complete invariants in CountableModelCounting, complete sections in ClassicalErgodicTheory);
   - Becker–Kechris appears only as out-of-scope lines (BorelEquivalenceRelations,
     CountableStructureSpaces) or for the Polish realization (NoncompactQuantumSymmetry, cited as
     the supplier);
   - `graphClass` in ProfiniteCohomology is a different object, `TauCeti.ContCohomology.graphClass`.

   No other owner exists, and no declaration of `Suggested.lean` shares a fully qualified name with
   a declaration in another roadmap.

   I also checked the pinned Tau Ceti and Mathlib for each object:
   - `ContinuousSMul` on codes: absent. Only `ContinuousSMul (Equiv.Perm α) α` exists.
   - Closedness of the simple-graph codes, the well-order class of codes, and a σ-algebra on
     `Equiv.Perm`: absent. `Probability/Distributions/Uniform/Permutation.lean` only takes one as
     a parameter.
   - Ordinal back-and-forth computations: absent. `BackAndForth/DiscreteOrder.lean` covers only
     discrete orders.
   - Borel reducibility in Mathlib: absent.

   So the README's statements of what the pins lack hold.
4. **Names at the pins.** I checked every backticked identifier of the README against the pinned
   Mathlib and Tau Ceti sources with a script; the resolver tool does not check library names. All
   resolve except two groups:
   - the eight names the README attributes to CountableStructureSpaces and NoncompactQuantumSymmetry,
     checked at their heads (above);
   - core types (`Option`, `ULift`, `Unit`) and file-path segments.

## Fixes from the upstream reading

Each fix was made in the README.

- **Summary.** It said Borel completeness is defined for "an invariant Borel class". The definition
  (1.2, and `BorelComplete` in the Lean) applies to any class of codes on ℕ, so I reworded it to
  "a class of codes on ℕ (the isomorphism relation of every invariant Borel class of every
  countable relational language reduces to its isomorphism relation)".
- **"The base".** The README cites "the base" and "base Layer …" throughout without defining the
  term. The Summary now says "The CountableStructureSpaces roadmap (cited below as the base)".
- **Convention 9.** `padicValNat` is still a definition at the Mathlib pin, but its lemmas are
  deprecated in favour of `multiplicity` (since 2026-10-28). The convention now says that
  `ν(r) = multiplicity 2 r.den` (`Nat.padicValNat_def`). I recomputed the witness values in Lean
  (table).
- **3.2, ordered-bits Check.** The sentence "…, true and the bit at the index pair `(0, 1)` false"
  read ambiguously. It now reads "…, true, while the bit at the index pair `(0, 1)` is false".
- **0.1, new Check.** An agreement-with-the-library Check for a model class, with a wrong model
  (equality of codes) that it excludes.
- **Scope and ownership, 0.1 bullet.** It said non-invariant sets are needed "as Layers 0.1 and 5
  need". It now names the actual uses: the restriction law of 0.1, condition (4) of Layer 5 and
  the strata of 6.4.

## Adversarial mathematics pass

"Lean" in the table means the value was checked in the scratch build described above. The other
values are computed by hand.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 1, countability of `L` (and `mk_quotient_classIso_of_borelComplete`) | `L` = graph symbol plus `𝔠` unary symbols; `K` = simple-graph codes with each unary predicate `∅` or ℕ | `K` is Borel complete (send `G` to `G` with all predicates empty); codes differing on a predicate are non-isomorphic, so there are at least `2^𝔠 > 𝔠` classes | the countability argument of the count is necessary; it is in the signature | none |
| Conv. 4, logic action | 3-cycle `σ : 0↦1↦2↦0`, code of `P = {0}` | `(σ•c)(P w) = c(P (σ⁻¹ w))`, true iff `w = σ 0 = 1` | `P = {1}` | none |
| Conv. 8, `List ℚ` order | the chain `[] < [0] < [0,5] < [1/2] < [1]` | all four comparisons (Lean, `List.cons_lt_cons_iff`) | holds; proper prefix first | none |
| Conv. 9, `ν` | `3/4`, `5`, `-1/6`, `1/8008` | denominators 4, 1, 6, 8008 (Lean); `padicValNat 2` of them = 2, 0, 1, 3 (Lean, via `multiplicity_eq_of_dvd_of_not_dvd`); `1/8008 < 1/1000` (Lean) | holds | `multiplicity` form added |
| Conv. 10, universes | elaborated types | `BFEquiv (α : Ordinal.{o})`; `scottHeight : Ordinal.{w}` for `M : Type w`, so `Ordinal.{0}` on ℕ; `bfEquiv_omega0_opow_mul` over `Ordinal.{u_1}` | consistent | none |
| 0.1 `classIso` | `K = ∅`; `Fin 2` with one unary predicate; `K = modelsOf φ` | no map from a nonempty type into `∅`; 4 codes and 3 classes (`\|P\| = 0, 1, 2`), with `{0}` and `{1}` related; `classIso (modelsOf φ) = isoSetoidOn ℕ φ` by `rfl` (Lean) | holds | API bullet and Check added |
| 0.2 set reducibility | `X = Unit`, `Y = Empty`, `A = ∅`; `A = {0} ⊆ ℕ` into the diagonal | no map `Unit → Empty`, so the existence clause is needed; `0 ↦ (0,0)`, `n+1 ↦ (0,1)` has preimage `{0}` | holds; the converse fails by `not_isSmooth_eZero` | none |
| 1.1 relabelling | `e` = 3-cycle on `Fin 3`, `P = {0}` | `restrict e.symm` gives `P = {e 0} = {1}`; `restrict e` would give `{2}`; 8 codes in 4 classes | holds | none |
| 1.2 `BorelComplete` | `K = ∅`; one unary predicate; countably many unary predicates, each `∅` or ℕ | fails (no map into `∅`); `ℵ₀` classes against `2^ℵ₀` classes of the Cantor family | holds | none |
| 1.3 functional coding | one constant with value `n → ∞`; a relational `L` | the graph relation `{n}` tends to `∅`, which is not total, so the range is not closed; for relational `L` the table is empty and the range is everything | Gδ, not closed | none |
| 2.1 incidence graph | `R = {(0,1)}`; two unary predicates without colours | the tuple vertex of `(0,1)` has degree 3 and that of `(1,0)` degree 2; swapping the symbols' tuple vertices is an uncoloured isomorphism of non-isomorphic codes | colours needed | none |
| 2.2 clique tags | one edge with `κ = (0,1)`; a triangle | `2+3+4 = 9` vertices; `1+2+3+6 = 12` edges; a vertex `x` of `H` lies in no triangle; tag 0 has `κ x + 2` triangle neighbours; the vertices of a triangle in `H` lie in a triangle | triangle-freeness needed | none |
| 2.3 `graphClass`, `borelComplete_graphClass` | empty graph; `adj(0,0)`; `adj(0,1)` without `adj(1,0)` | in; out; out; each output bit is constant or one input bit | continuous, one map for all `K'` | none |
| 3.1 coloured Cantor | `σ = (0 1)`; the colouring "negative or not" | `π(1/2)` must have `ν = 0`; an initial segment cannot map onto the non-negatives | density needed | none |
| 3.2 unravelling | edge `{0,1}` at `[1/2,1]`, `[1,2]`, `[1,1/2]`; `c` = only `adjAtom 0 1`, `d = τ•c`; a loop against the empty graph | `a = (1,0)`, `(0,0)`, `(0,1)`; bits at `(1,0)` are both true and at `(0,1)` both false; the colour of `[1]` with a true diagonal bit occurs nowhere for the empty graph; a bijective map that preserves parents fixes `[]` | holds for all graph codes | punctuation |
| 3.2, parent definability | `x = [1/2, 1]`; competitor `p' = [b]` with `b < 1/2` | `[c]` with `b < c < 1/2` lies in `(p', x)` and has length 1; every `z` in `([1/2], x)` has length at least 2 | parent unique | none |
| 3.3 `linearOrderClass` and the reduction | `(ℕ,≤)`, `(ℕ,<)`, divisibility; block `ω + (χ+2)` | in; out at atom `(0,0)`; a partial order but not total; finite condensation classes are exactly the final parts, of size `χ+2 ≥ 2` | continuous reduction of all graph codes | none |
| 3.4 `treeClass` | `c_n` = chain `n<…<0<n+1<…` | for `i,j ≤ n`, `c_n` orders them as `(ℕ,≥)`, so `c_n → (ℕ,≥)`, which has infinite down-sets | not closed; tag height `χ+2` | none |
| 3.5 presentations | `{[],[0],[1],[0,0]}`; `T_n → T` (star) | finite, so no code on ℕ; cover adjacency `(0,1)` is 1 in `T` and 0 in every `T_n` | Borel, not continuous | none |
| 4.1 `instMeasurableSpacePerm` | `Perm (Fin 3)`; evaluation at `0` alone; `Perm ℕ` stabilizer of `0` | 6 elements and `2^6 = 64` measurable sets; the evaluation σ-algebra has 3 atoms and `2^3 = 8` sets; `{σ \| σ 0 = 0}` is clopen and not in the trivial σ-algebra | holds | none |
| 4.2 `universalLanguage`, embedding | `X = ℕ`, `S_n = {n}`; packing at `m = 0, 1, 2` | symbol `(1,0)` at `(a)` holds iff `x = a`; `unpair 0 = (0,0)`, `unpair 1 = (0,1)`, `unpair 2 = (1,0)`, `pair 1 0 = 2` (Lean) | matches Conv. 4; injective | none |
| Layer 5, both iff theorems | `graphClass`; `∅`; one unary predicate | all five conditions hold; all fail; `𝔠` against `ℵ₀` classes | holds; (5) ⇐ via `ULift` of an invariant Borel `K'` | none |
| 6.1 `bfEquiv_omega0_opow_mul` | `γ = 0`; `γ = 1`; `ω` against `ω·2` and `ω+1`; `δ = 0` | trivial; nonempty on both sides; `ω ≡₂ ω·2` (each point has a nonempty upper interval), `ω ≢₂ ω+1` (the maximum has an empty upper interval); the empty order against a nonempty one fails at level 1 | holds; `δ, ε ≠ 0` needed | none |
| 6.2 `not_measurableSet_classIso_of_borelComplete` | `β = 0`; `K = ∅` | `ω^(1+0) = ω` and `ω·2`: distinct, countable, `BFEquiv 1`, hence `BFEquiv 0`; the hypothesis fails for `∅` | holds without countable `L` | none |
| 6.2 `exists_lt_scottHeight_of_borelComplete` | all heights `≤ β` on an arbitrary `K` | `classIso K = (bfEquivSetoid L ℕ β).comap Subtype.val` (Lean, pinned lemma); measurable for `β < ω₁` and countable `L` | contradiction | cites the pinned lemma |
| 6.2, third consequence | Borel `K`; `(K ×ˢ K)ᶜ` | the ambient complement is the union of `iso ∩ K×K` (analytic) and `(K×K)ᶜ` (Borel); if both pieces were analytic, Suslin would make them Borel | holds | none |
| 6.3 `borelReducible_eZero_of_borelComplete`, count | `0^ω` against `10^ω`; `0^ω` against `1^ω` | `F ↦ F ∆ {0}` matches the copies; finitely against cofinitely many `P`-points | reduction correct; the count needs countable `L` (Conv. 1 row) | none |
| 6.4 `not_borelComplete_of_rank_bounded` | analytic `K`; `wellOrderClass lt` with `ρ` the order type | (b) on `A = K` gives `K_α = K`, so the result is the contrapositive of 6.2; for well-orders `K_α` is a union of `\|{β : ω ≤ β ≤ α}\| ≤ ℵ₀` Borel orbits, and `ρ` is unbounded | has content off analytic classes | none |
| 6.5 | one unary predicate | `ℵ₀` classes, each Borel, so smooth; `eZero` has `𝔠` classes and does not reduce to it | holds | none |

## Ownership against open pull requests

I checked this against all 455 open roadmap pull requests at their heads, using `roadmaps grep` by
object. I read the closest roadmaps:
- CountableStructureSpaces, the base, cited;
- CountableModelCounting: `isoSetoidOn` on model classes against `classIso` on arbitrary sets,
  recorded in the Scope;
- BorelEquivalenceRelations: general Borel reducibility, cited; its out-of-scope list assigns the
  Borel complexity of isomorphism to CountableStructureSpaces, which this Part II continues.

HanfNumbers and RandomGraphs contain none of the objects searched for. No object has two owners.

## Unresolved

- These are carried from the accepted review's "For the human reviewers" section and are not
  changed here:
  - `sources.toml` records the friedman-stanley-1989 and mekler-1981 locators as written from
    memory, so the Friedman–Stanley citations ("Theorem 1", "§2", "§4") rest on no text that was
    read;
  - montalban-cst1 and montalban-cst2 are author's drafts, cited by draft line numbers.
- The source issue in montalban-cst1 recorded by the review (proof of Lemma VI.18: the
  lexicographic finite sequences of rationals form a dense order with a least element, not a copy
  of ℚ) does not affect the README, which states the correct fact (3.2).
- CountableStructureSpaces is not in the merge order. The worker names it in the merge-order
  paragraph as a dependency that is still a pull request.
- No suspicious instruction was found in any text read.


Pull request: #2418 (roadmap/countable-structure-spaces-part-ii at 060a878)
