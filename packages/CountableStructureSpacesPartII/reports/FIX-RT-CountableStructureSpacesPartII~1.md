# FIX-RT-CountableStructureSpacesPartII~1

This round settles the four findings of red-team round 1 (passes a and b). All four are P3.
- Pass a F01 and pass b F01 are the same finding, settled once below.
- Every finding was checked on the mathematics: against the pinned Tau Ceti, the cached text of
  montalban-cst2, and the roadmap's own definitions.
- All are applied. One, pass b F02, is applied with a more precise wording than the one proposed.

Files changed:
- `packages/CountableStructureSpacesPartII/Suggested.lean`;
- `packages/CountableStructureSpacesPartII/README.md`;
- `packages/CountableStructureSpacesPartII/sources.toml` (one locator field).

Unchanged: `metadata.toml`, and `design/plan.json` (`gaps = []`, since no supplier gap is needed).

## RT-CountableStructureSpacesPartII~1a/F01, RT-CountableStructureSpacesPartII~1b/F01 (P3) — applied

**Changed.**
- `Suggested.lean`: deleted `borelComplete_iff_forall_structureSpace` and
  `borelComplete_iff_forall_measurableSet`. The module docstring now reads "four characterisations"
  → "the characterisations of Borel completeness by the graphs and by the Borel `S∞`-spaces".
- README summary paragraph: the list of four names → `borelComplete_iff_graphClass` and
  `borelComplete_iff_forall_permSpace`.
- README Layer 5: items 3 and 4 lose their backticked names. Both stay as targets, with their
  proof and *Needs:* unchanged.

**Verification.** The finding is right.
- `classIso K'` is `Setoid.comap Subtype.val (isoSetoid L' ℕ)` (`Suggested.lean`, Layer 0).
- (1) ⇒ (3): take `K' = Set.univ`. Then `isoSetoid L' ℕ` is the `comap` of `classIso univ` along
  the measurable map `x ↦ ⟨x, trivial⟩`, using Tau Ceti `Setoid.borelReducible_comap`
  (`SetTheory/Descriptive/BorelReducibility.lean:115`) and `BorelReducible.trans` (`:127`).
- (3) ⇒ (4): `Setoid.borelReducible_comap measurable_subtype_coe` composed with (3).
- (4) ⇒ (1): instantiate `B := K'`.

No step uses a target of Layers 2–4 or 6, so these two statements unfold the definition and are
not headline theorems. The deep equivalences are (1) ⇔ (2) (needs `borelComplete_graphClass`) and
(1) ⇔ (5) (needs the universal embedding), and both stay in `Suggested.lean`.

**Pattern search.**
- `roadmaps grep 'borelComplete_iff_forall'`: no roadmap on main or in an open pull request cites
  either name.
- The README summary sentence "four standard reformulations" stays. It counts conditions (2)–(5)
  of Layer 5, which all remain README targets.

## RT-CountableStructureSpacesPartII~1a/F02 (P3) — applied

**Changed.**
- `Suggested.lean`: `instance instMeasurableSpacePerm : MeasurableSpace (Equiv.Perm ℕ)` →
  `instance instMeasurableSpacePerm {α : Type*} [TopologicalSpace α] : MeasurableSpace (Equiv.Perm α)
  := borel (Equiv.Perm α)`. The docstring now gives the `ℕ` and finite-discrete cases.
- README Layer 4.1: the definition now covers every topological `α`. Added one API bullet: the
  evaluations are measurable, and for finite discrete `α` the σ-algebra is the power set. Added two
  Checks. *Needs:* updated.
- README scope bullet and supplier note updated to match.

**Verification.** The finding is right.
- Tau Ceti declares the topology for every topological carrier: `Topology/Algebra/Group/Perm.lean:38–44`,
  `variable {α X : Type*} [TopologicalSpace α]`, then `instance instTopologicalSpace`.
- The roadmap itself uses finite carriers (`classIso` on `Fin 2` and `Fin 3`, Checks of 0.1 and
  1.1).
- No diamond at the pins. Mathlib has no `MeasurableSpace (Equiv.Perm _)`. Tau Ceti's
  `Probability/Distributions/Uniform/Permutation.lean:37–38` takes `[MeasurableSpace (Equiv.Perm α)]
  [MeasurableSingletonClass …]` as a *parameter* for finite `α`. For a finite discrete `α` the new
  instance is the power set and meets that hypothesis; the README supplier note now says so.
- Ownership: `roadmaps grep` for `MeasurableSpace (Equiv.Perm` finds no roadmap on main or in an open
  pull request, so this roadmap is the owner.

**Pattern search.**
- The five declarations that use `Equiv.Perm ℕ` are unchanged and elaborate against the general
  instance (signatures below).
- Convention 5 is about `ℕ` and stays as it is.
- README line "Mathlib has no … σ-algebra on `Equiv.Perm ℕ`" stays true.

## RT-CountableStructureSpacesPartII~1b/F02 (P3) — applied differently

**Changed.** The docstring of `bfEquiv_omega0_opow_mul`:
- Old: the theorem is "Lemma II.38 and Corollary II.39, in the one-step convention".
- New: in the one-sided relations of montalban-cst2 Definition II.32, Lemma II.38 gives level
  `2γ + 1` with the larger factor on the left, and the reverse can fail (Corollary II.39).
  Observation II.35 then gives both relations at level `2γ`, which imply `BFEquiv γ` by induction.

README 6.1 now says the same, with line locators. The `sources.toml` locator adds Definition II.32
and Observation II.35.

**Verification.** The finding is right that the old wording misattributes the result:
- Lemma II.38 (montalban-cst2 line 2339) is one-sided at level `2α + 1`. Corollary II.39 (line 2425)
  is the failing direction (`ω^α ≰_{2α+1} ω^α + ω^α·A`), a sharpness result, not a source of the
  theorem.

The proposed repair ("compare …; proved directly") understates the source. The symmetric
statement does follow from the statement of Lemma II.38:
- For nonzero ordinals δ, ε (both have first elements), suppose without loss of generality that δ
  has at least as many elements as ε. Lemma II.38 gives `ω^γ·δ ≤_{2γ+1} ω^γ·ε`.
- Observation II.35 (lines 2219–2222) gives both `≤_{2γ}` and `≥_{2γ}`.
- `≡_{2γ}` implies `BFEquiv γ`, by induction:
  - **Base:** level 0 is the same atomic type.
  - **Successor:** by Definition II.32 (lines 2205–2206), `b̄ ≤_{2γ+2} ā` gives, for each new `x`,
    some `y` with `(ā x) ≤_{2γ+1} (b̄ y)`. Observation II.35 turns this into `≡_{2γ}`, which is the
    forth step of the Tau Ceti definition (`ModelTheory/BackAndForth/Equivalence.lean:49–57`).
    Back is symmetric.
  - **Limit:** `2·λ = λ`.
- The induction reads `2γ` as `2·γ`, so `2·(γ+1) = 2·γ + 2`. This matches Montalbán's own limit
  step (lines 2386–2404).

The new text claims exactly this and nothing more.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `instMeasurableSpacePerm`, `α = Fin 3` | discrete group of order 6 | σ-algebra `= ⊤` (proved in a scratch file by `borel_eq_top_of_discrete`); 64 measurable sets; the σ-algebra generated by evaluation at `0` has atoms `{σ 0 = j}` of size 2, so 8 sets, and identity and `(1 2)` share an atom | general instance correct; wrong model excluded | new Check |
| `instMeasurableSpacePerm`, `α = ℕ` | `{σ │ σ 0 = 0}`, `{σ │ σ 0 = 1}`; standard Borel | both measurable (scratch proof via `Equiv.Perm.continuous_apply` once `BorelSpace` is given by `⟨rfl⟩`); identity in the first, `(0 1)` in the second, so the trivial σ-algebra fails; `StandardBorelSpace (Equiv.Perm ℕ)` found by instance search | as README | new Check |
| `instMeasurableSpacePerm`, `α = Empty` / indiscrete `α` | one-point group; induced indiscrete topology | Borel σ-algebra `{∅, univ}`; nothing further claimed | no false claim | none |
| `instMeasurableSpacePerm` against Tau Ceti uniform permutations | finite `α`, needs measurable singletons | `⊤` has them | compatible | supplier note |
| `bfEquiv_omega0_opow_mul` (docstring) | `γ = 0` | II.38 at `α = 0`: `A ≤_1 B ⇔ │A│ ≥ │B│` (line 2314); `≡_0` and `BFEquiv 0` of empty tuples both trivial | consistent | docstring |
| same | `γ = 1, δ = 1, ε = 2` | `ω·2 ≤_3 ω` (`2 ≥ 1`); `ω ≰_3 ω·2` (II.39 with `A = 1`); II.35 gives `≡_2`, so `BFEquiv 1`; directly, any two nonempty orders are `BFEquiv 1` | consistent with the README Check of 6.1 | docstring |
| same | `δ = ε = ω` | equal sizes (infinite), so II.38 holds in both directions at `2γ + 1` | "larger on the left" covers equality | docstring |
| Layer 5 (3), (4) as README targets | `K = ∅`, `graphClass`, one unary predicate | all fail; all hold; (2) fails by counting (unchanged Checks) | unchanged | names dropped |

I recomputed the Checks of 6.1 (`γ = 0, 1`; `ω` against `ω·2` at level 2; `ω^2` against `ω^2·2`)
against the new text: none contradicts it.

## Checks run

**Elaboration.** `lake env lean packages/CountableStructureSpacesPartII/Suggested.lean`, run from
the content checkout: 13 `declaration uses 'sorry'` warnings and no errors. No `TauCeti.*` module
had to be built.

**Signatures.** I put `#check @name` for all 20 declarations into one scratch copy and elaborated it
once.
- `instMeasurableSpacePerm : {α : Type u_1} → [TopologicalSpace α] → MeasurableSpace (Equiv.Perm α)`.
- `exists_equivariant_measurableEmbedding_universal` and `borelComplete_iff_forall_permSpace` keep
  `[MeasurableSpace X] [StandardBorelSpace X] [MulAction (Equiv.Perm ℕ) X]
  [MeasurableSMul₂ (Equiv.Perm ℕ) X]`.
- The three countability-dependent theorems keep `[∀ n, Countable (L.Relations n)]`.
- Apart from the instance, every type is as before and as in the README.
- No binder was lost (the file has no `variable` or `include` line).

**Dependency check** (the brief's command):

```
depcheck: 239 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
nowhere.

## Gate failures

None were listed for this round.

## For the maintainer

- `design/plan.json` (targets) and `design/README.md` still list the two deleted names. They are
  design-stage files that this job may not edit outside `gaps`.
- No other roadmap cites any name changed here (`roadmaps grep`, main and open heads).
  `instMeasurableSpacePerm` keeps its name; only its binders widened.
- No source was fetched; montalban-cst2 was read from the cache. No text is missing, and
  `needs-references.toml` was not written.
- Ownership against open pull requests was checked with `roadmaps grep` for the σ-algebra on
  `Equiv.Perm` and for the two deleted names.
- No suspicious instructions were found in the reviews.
