# FIX-PKG-CountableStructureSpacesPartII~3

Repair of the two findings of `REV-PKG-CountableStructureSpacesPartII~2`: one P2, one P3. I
checked both and applied both. Files changed: `packages/CountableStructureSpacesPartII/README.md`
and `packages/CountableStructureSpacesPartII/Suggested.lean`. `sources.toml` and `metadata.toml`
are unchanged. `design/plan.json` is unchanged too: no supplier gap is needed and `gaps = []`
stays.

## REV-PKG-CountableStructureSpacesPartII~2/F01 (P2) — applied

Changed: `(hK : MeasurableSet K)` is deleted from `not_borelComplete_of_rank_bounded`. Its
docstring now reads "a class `K` of codes, not assumed Borel, …", says that for analytic `K` it is
the contrapositive of 6.2, and names the coded well-orders as an example with content. README 6.4
says "any set of codes, not assumed Borel or invariant". Its first Check is replaced and a
well-order Check is added. The Summary, Scope, contract, Dependencies and consumers are updated.

Verification. The finding is right. For Borel `K` (Borel sets are analytic: the coding space is
Polish for countable `L`), hypothesis (b) at `A = K` gives `α < ω₁` with `K_α = K`. Then (a) at
`α` is the negation of 6.2. I elaborated this proof of the old statement in a scratch copy at the
pins with no error:

```lean
  intro hB
  obtain ⟨α, hα, hb⟩ := hbdd K subset_rfl hK.analyticSet
  have hKα : K ∩ {c | ρ c ≤ α} = K := Set.inter_eq_left.mpr hb
  have h := hiso α hα
  revert h
  rw [hKα]
  exact not_measurableSet_classIso_of_borelComplete hB
```

The README proof never uses that `K` is Borel. It needs:
- the analytic image of `f` (domain `graphClass`, standard Borel; range second countable for
  countable `L`, which is why `[∀ n, Countable (L.Relations n)]` stays);
- (b) on that image;
- the corestriction to `K_α`;
- 6.2 for `graphClass` (Layer 2.3).

The new statement is therefore still true, and it is no longer a restatement of 6.2.

Every place with the same pattern was repaired:
- **README 6.4, first sentence.** It now says "any set of codes, not assumed Borel or invariant".
  The proof now names where countability of `L` is used and that 6.2 is applied to `graphClass`
  (Layer 2.3).
- **6.4 Checks.**
  - The `ρ = 0` Check is now the analytic-`K` Check: for analytic `K` the lemma is the
    contrapositive of 6.2 whatever `ρ` is, and `graphClass` admits no `ρ`.
  - The `graphClass` / `analytic_treeHeight_bounded` Check is replaced by the `wellOrderClass lt`
    Check. With `K` Borel, that Check only repeated the first one.
- **Summary.** The obstruction now concerns "a class, Borel or not, stratified into pieces with
  Borel isomorphism relation by a rank bounded on its analytic subsets". For an analytic class it
  is the non-Borelness theorem again. It has content for non-analytic classes, such as the coded
  well-orders.
- **Scope.** The torsion abelian group theorem is not an instance of 6.4. It belongs, with its
  proof, to the roadmap on algebraic classes. That roadmap uses 6.4 for classes such as the
  reduced abelian `p`-groups stratified by Ulm length.
- **Downstream consumers.** Says the same as the Scope.
- **Supplier contract, CountableStructureSpaces.**
  - The Layer 3 entry (`analytic_treeHeight_bounded`) is deleted: its only use was the replaced
    Check.
  - `analytic_type_bounded` is added to the Layer 6.2 entry.
  - The Scope list of base targets now names "the well-order class with the boundedness of its
    order types on analytic sets (Layer 6.2)" instead of the tree-height theorem.
- **Layer 6 Dependencies.** "CountableStructureSpaces Layers 3 (a Check of 6.4) and 4.4" →
  "Layers 4.4 and 6.2 (a Check of 6.4)".

How this differs from the suggested repair: the Borel orbits in the well-order Check come from
pinned Tau Ceti declarations that the "From Tau Ceti" contract already lists:
- `scottHeight_lt_omega_one`;
- `isoSetoid_le_bfEquivSetoid` and `nonempty_equiv_of_bfEquiv_of_scottHeight_le`;
- `measurableSet_setOf_bfEquivSetoid` (section of a Borel set).

They do not come from a new base Layer 4.1 entry, because the base says its Section 4.1 is
complete at the pin. The new Check's 6.3 remark is "decides this only when `ℵ₁ < 𝔠`" rather than
"does not follow from 6.2 alone". I could not settle whether `classIso (wellOrderClass lt)` has a
measurable graph in `K × K`, so the Check claims nothing about it.

## REV-PKG-CountableStructureSpacesPartII~2/F02 (P3) — applied

Changed: Summary "the five standard characterisations of Borel completeness" → "the equivalence of
Borel completeness with four standard reformulations". The same pattern in Layer 5 Examples:
"all five characterisations hold" → "all five conditions hold". Layer 5's "all five hold / fail"
Checks count conditions and are correct as written. The Summary list ("the four
characterisations") and the Lean docstring ("four characterisations") already agreed.

Verification: Layer 5 lists five equivalent conditions, the first being `BorelComplete K` itself,
and `Suggested.lean` states four `iff` theorems.

## Checks

- **Elaboration.** I ran `lake env lean packages/CountableStructureSpacesPartII/Suggested.lean`
  from the content checkout. Result: 15 warnings, all "declaration uses `sorry`" (lines 69, 95,
  102, 107, 128, 138, 144, 151, 160, 173, 182, 190, 197, 204, 217), and no error. No `TauCeti.*`
  module needed building.
- **Binders.** One scratch file held the package text, the old-statement proof above and
  `#check @name` for all 22 declarations. It elaborated with no error. I compared each
  elaborated type with its README statement. The only change is
  `not_borelComplete_of_rank_bounded`, which now reads
  `∀ {L} [L.IsRelational] [∀ n, Countable (L.Relations n)] {K} (ρ), (∀ α < ω₁, MeasurableSet {p | classIso (K ∩ {c | ρ c ≤ α}) p.1 p.2}) → (∀ A ⊆ K, AnalyticSet A → ∃ α < ω₁, ∀ c ∈ A, ρ c ≤ α) → ¬ BorelComplete K`.
  That matches README 6.4. No other declaration lost or gained a binder.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Citations** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None.
  Lean names found nowhere: None."
- **New citations.** I checked each against the base CountableStructureSpaces at its open head:
  - Layer 6.2: `wellOrderClass` (strict well-order on a distinguished binary `lt`),
    `analytic_type_bounded`, `analyticSet_compl_wellOrderClass`,
    `not_measurableSet_wellOrderClass`, and `exists_mem_wellOrderClass_type_eq` for
    `ω ≤ β < ω₁`.
  - Pinned Tau Ceti:
    - `scottHeight_lt_omega_one` (`TauCeti/ModelTheory/Scott/Height.lean` line 176);
    - `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (same file, line 186; hypothesis only on
      `scottHeight M`);
    - `isoSetoid_le_bfEquivSetoid` and `measurableSet_setOf_bfEquivSetoid`
      (`TauCeti/ModelTheory/RelationalConfiguration/BackAndForth.lean` lines 127, 144).
- **Sources.** No source was added or fetched, and no `needs-references.toml` was written. The
  6.4 locators (friedman-stanley-1989 §4, hjorth-kechris-1996 §4–§5) are unchanged and remain
  uncertified.
- **Ownership.** No construction or target was added. The new Check uses only base and pinned
  names. Ownership against open pull requests was not re-checked beyond the resolver run above.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.4, old form (with `MeasurableSet K`) | `K` Borel, any `ρ`, `A = K` | (b) gives `α` with `ρ ≤ α` on `K`, so `K_α = K`; (a) at `α` = negation of 6.2; Lean proof elaborates | degenerate | `hK` dropped |
| 6.4, new form | `K = ∅` | `K_α = ∅`, so (a) holds; only `A = ∅`, so (b) holds with `α = 0`; `¬BorelComplete ∅` holds (no map from nonempty `graphClass` into `∅`) | true | — |
| 6.4, new form | `K = graphClass`, any `ρ` | (b) at `A = K` bounds `ρ` by `α`; (a) at `α` contradicts 6.2 with Layer 2 | hypotheses inconsistent, as the first Check says | Check rewritten |
| 6.4, new form | codes of one unary predicate, `ρ = 0` | `K_α = K`; classes `(\|P\|, \|¬P\|)`, countably many, each Borel, so (a) holds; (b) with `α = 0`; `ℵ₀` classes against `𝔠` | true, matches Check of 1.2 | — |
| 6.4, new form | `K = wellOrderClass lt` (one binary symbol), `ρ` = order type | types `ω ≤ β < ω₁`; `K_0 = … = K_{ω−1} = ∅`; `K_ω = O_ω`; `K_α = ⋃_{ω≤β≤α} O_β`, countably many orbits, each Borel (section of the level-`γ` graph, `γ = SH(c) < ω₁`); (b) by `analytic_type_bounded`; `ρ` unbounded, so `K_α ≠ K` | hypotheses hold, conclusion true, not reduced to 6.2 by the first Check | new Check |
| 6.4, new form | `ρ c ≥ ω₁` for some `c ∈ K` | `{c}` is analytic, so (b) forces `ρ c < ω₁` | hypotheses force `ρ < ω₁` on `K` | — |
| 6.4, (a) readings | `K = graphClass`, `ρ = 0` on `A = g '' B`, `1` elsewhere | `K_0 = A`; isomorphic pairs = diagonal of `A`, measurable in `A × A`, not in the ambient square (preimage under `c ↦ (c, c)` is `A`) | Check unchanged, does not use `hK` | — |
| 6.4, proof | uncountable `L` | the range of the measurable map need not be second countable, so `MeasurableSet.analyticSet_image` does not apply | countability binder kept | proof names it |
| Scope: torsion abelian groups | Borel class of abelian `p`-groups | Ulm length unbounded (a reduced group of every countable length); for a Borel class 6.4 = 6.2, and the isomorphism relation of torsion abelian groups is not Borel | not an instance of 6.4 | Scope, consumers |
| Scope: reduced `p`-groups | `ℤ/p`, `ℤ/p²` | the tree of `p`-division sequences `(g₀ ≠ 0, p g_{i+1} = g_i)` has node rank = `p`-height of the last entry (checked at successor and limit); `ℤ/p`: `pG = 0`, Ulm length 1, tree height 1; `ℤ/p²`: `pG ≅ ℤ/p`, Ulm length 2, longest chain `(p, 1)`, height 2 | (b) via tree-height boundedness, (a) via Ulm invariants `f_β`, `β < α` | Scope, consumers |
| Summary count (F02) | Layer 5 | 5 conditions, the first the definition; 4 `iff` theorems; Lean docstring "four" | consistent | Summary, Layer 5 Examples |

## Notes for the maintainer

- `design/plan.json` target `6.8` (`not_borelComplete_of_rank_bounded`) still records
  "`K` … measurable" in its statement and `"MeasurableSet K"` among its hypotheses. This job may
  edit only the plan's `gaps` list, so that entry now disagrees with the README and
  `Suggested.lean`. The README and `Suggested.lean` are authoritative.
- No name of this roadmap changed. Consumers that cite `not_borelComplete_of_rank_bounded` get a
  weaker hypothesis set: every old instance is still an instance.
- The supplier contract no longer cites base Layer 3 (`analytic_treeHeight_bounded`). It now cites
  base Layer 6.2's `analytic_type_bounded`, a target of the base CountableStructureSpaces (open,
  another author's new roadmap).
- The review's "For the human reviewers" items (memory-written friedman-stanley-1989 and
  mekler-1981 locators; licence of the montalban drafts) were not acted on, as instructed.
- No untrusted text contained instructions.
