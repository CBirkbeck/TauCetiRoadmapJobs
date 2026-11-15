# FIX-RT-CountableStructureSpacesPartII~2

This round settles the six P3 findings of red-team round 2 (passes a and b). No two of them
overlap. Each was checked on the mathematics against:
- the base roadmap CountableStructureSpaces, at the head of its open pull request (another
  author's new roadmap folder), README and `Suggested.lean`;
- the pinned Tau Ceti and Mathlib;
- the cached text of montalban-cst2.

All six findings are right. Four are applied as proposed. Two are applied differently:
2a/F01 (the citation goes in the prose, not in *Needs:*) and 2b/F01 (one more locator added, for
the same pattern).

Files changed:
- `packages/CountableStructureSpacesPartII/README.md`;
- `packages/CountableStructureSpacesPartII/Suggested.lean` (two docstrings only; no signature
  changed);
- `packages/CountableStructureSpacesPartII/sources.toml` (montalban-cst2: `locator` and
  `cited_for`).

Unchanged:
- `metadata.toml`;
- `design/plan.json`: `gaps = []`. No supplier gap is needed, because every new citation is of a
  target the base already states.

## RT-CountableStructureSpacesPartII~2a/F01 (P3) — applied differently

**Changed.** README 6.2, Scott-height bullet. After "Neither invariance nor Borelness of `K` is
used." it now says:
- for the class of models of an infinitary sentence, this step is CountableStructureSpaces
  Layer 4.3 (`measurableSet_iso_inter_of_scottHeight_le`, where the graph is in the ambient square);
- the README argues it from the pinned lemmas because `K` is arbitrary and the graph is taken in
  `K × K`.

**Not applied: the *Needs:* addition.** The route of 6.2 uses only the pinned lemmas
(`isoSetoid_le_bfEquivSetoid`, `nonempty_equiv_of_bfEquiv_of_scottHeight_le`,
`measurableSet_setOf_bfEquivSetoid`). It never uses base 4.3. Listing 4.3 under *Needs:* would put
an implementer behind a target they do not need, against the house rule for *Needs:* lines.

**Verification.**
- The base `Suggested.lean` at its head has `measurableSet_iso_inter_of_scottHeight_le`:
  - hypotheses: `[∀ n, Countable (L.Relations n)]`, `φ : L.Sentenceω`, `β : Ordinal.{0}`,
    `β < ω₁`, every code of `modelsOf φ` with `scottHeight ≤ β`;
  - conclusion: `iso ∩ (modelsOf φ ×ˢ modelsOf φ)` is measurable in the ambient square.
- `modelsOf φ` is Borel (base Layer 2). For such a class, measurability in the ambient square and
  in the subtype square agree, so the base statement is the model-class case of the step.
- For the set `A` of the second Check of 6.4 (non-measurable, pairwise non-isomorphic), the base
  statement does not apply and the README's argument does.

**Pattern.** The fourth Check of 6.4 re-derives "each orbit is the `bfEquivSetoid` class at its
Scott height". That is CountableStructureSpaces worked example 5, which the Check now cites ("as
in CountableStructureSpaces worked example 5"). No other step of the README restates a base target
without citing it:
- `graphClass` closed cites base Layer 0;
- the Borel orbits of one unary predicate cite base worked example 2.

## RT-CountableStructureSpacesPartII~2a/F02 (P3) — applied

**Changed.**
- README 3.3. Before: "API: it is closed and invariant". After: "API: it is closed
  (CountableStructureSpaces worked example 3: every axiom of `linearOrderTheory` is universal,
  `Theory.IsUniversal`, so membership is an intersection over tuples of conditions on finitely many
  atoms, each clopen by `isClopen_setOf_eval`) and invariant".
- Supplier contracts, from CountableStructureSpaces: new bullet "Worked example 3: the codes of
  linear orders in `Language.order` form a closed set (the API of 3.3)."
- Mathlib contract (Order.lean bullet): the two theories carry instances of
  `FirstOrder.Language.Theory.IsUniversal` (`Mathlib/ModelTheory/Complexity.lean`).
- Layer 3 Dependencies: "and worked example 3 (closedness of `linearOrderClass`)".

**Verification.**
- The base README at its head, worked example 3: "In Mathlib's `Language.order` the codes of linear
  orders form a closed set". This is the same set: the models of `linearOrderTheory`, with the
  symbol read as `≤`.
- At the Mathlib pin, `Mathlib/ModelTheory/Order.lean:163–167`: `linearOrderTheory` is `insert
  leSymb.total partialOrderTheory`, with `instance : Theory.IsUniversal L.linearOrderTheory`.
  `partialOrderTheory` likewise (`:156–160`). The class is declared at
  `Mathlib/ModelTheory/Complexity.lean:416`.
- Recomputed:
  - the code of `(ℕ, <)` fails reflexivity at the single atom `(0, 0)`, a clopen condition;
  - transitivity at `(x, y, z)` reads the three atoms `(x, y)`, `(y, z)` and `(x, z)`;
  - totality and antisymmetry at `(x, y)` read `(x, y)` and `(y, x)`.
- Negative control, consistent with the README: `treeClass`, with a least-element and a
  finite-down-set axiom that are not universal, is not closed (Check `c_n → (ℕ, ≥)` of 3.4).

**Pattern.** No other closedness claim lacks an owner:
- `graphClass` cites base Layer 0;
- the closedness in 3.5 (being a cover) and the Gδ range in 1.3 are this roadmap's own and are
  proved there.

## RT-CountableStructureSpacesPartII~2a/F03 (P3) — applied

**Changed.** The Tau Ceti `Perm.lean` contract bullet now covers the whole file:
- for every topological `α`: `instTopologicalSpace` (induced by `σ ↦ (σ, σ⁻¹)`), with
  `continuous_apply` and `continuous_inv_apply`;
- for a discrete `α`: `instIsTopologicalGroup`, `instPolishSpace` (countable `α`),
  `instDiscreteTopology` (finite `α`) and `hasBasis_nhds_one_fixingSubgroup`.

**Verification.** Pinned `TauCeti/Topology/Algebra/Group/Perm.lean`:
- `:38` `variable {α X : Type*} [TopologicalSpace α]`;
- `:42` `instTopologicalSpace`; `:53` `continuous_apply`; `:58` `continuous_inv_apply`;
- `:72` `variable [DiscreteTopology α]`;
- `:110` `instIsTopologicalGroup`; `:143` `instPolishSpace [Countable α]`;
  `:149` `hasBasis_nhds_one_fixingSubgroup`; `:178` `instDiscreteTopology [Finite α]`.

Layer 4.1 uses `continuous_apply`, `continuous_inv_apply` and `instDiscreteTopology`. The supplier
line of base Layer 1.2 uses `continuous_inv_apply`. The old bullet named none of the three.

Recomputed for `α = Fin 3`: the instance gives a discrete group of order 6 with all `2 ^ 6 = 64`
subsets measurable, as the second Check of 4.1 says.

## RT-CountableStructureSpacesPartII~2b/F01 (P3) — applied differently

**Changed.**
- README 6.2, after "greater than `β`": "(montalban-cst2 Theorem XI.3, lines 8997–9001, and lines
  9046–9051, for the Scott rank of a class closed under isomorphism; here for the external height
  `scottHeight` and an arbitrary `K`)".
- `Suggested.lean`, docstring of `exists_lt_scottHeight_of_borelComplete`: the same locator in Lean
  docstring style.
- README 6.3: `mk_quotient_classIso_of_borelComplete` "(the roadmap's own corollary of the reduction
  of `eZero`)". Its Lean docstring now states the two bounds. No readable source states the count.
- `sources.toml`, montalban-cst2:
  - `locator` gains "Theorem XI.3 (lines 8997-9012), classes on top for Borel reducibility:
    complete analyticity and unbounded Scott rank (lines 9046-9051)";
  - `cited_for` gains "6.2".

**Verification.**
- montalban-cst2 lines 8997–9001: for `K` closed under isomorphism, the isomorphism problem is
  Borel exactly when the Scott rank is bounded below `ω₁`. The direction (2) ⇒ (1) is the step 6.2
  argues by contraposition.
- Lines 9046–9051: a class on top for Borel reducibility (footnote at line 9069: "sometimes called
  Borel complete") has unbounded Scott rank below `ω₁`.
- Montalbán's Scott rank is internal; `scottHeight` is external. Boundedness below `ω₁` is the
  same for both (base Layer 4.2: `s ≤ SH ≤ s + ω` and `SR ≤ SH + 1`), so the citation fits with the
  stated difference.
- Instance check:
  - one unary predicate: heights at most `ω`, Borel isomorphism, as XI.3 says;
  - `graphClass`: on top, unbounded height.

**Applied differently: one more locator for the same pattern.** The third consequence of 6.2
(non-isomorphic pairs of a Borel `K` are not analytic) also had no locator. It now cites the
Σ¹₁-completeness at montalban-cst2 lines 9046–9050 for a Borel class closed under isomorphism. A
Σ¹₁-complete set is not coanalytic, so the ambient complement is not analytic, and the Borel set
`(K ×ˢ K)ᶜ` can be removed. The README says that the completeness itself is not proved here, as
the Scope section defers it.

Two Layer 6 statements stay without a locator:
- the second consequence of 6.2;
- the non-smoothness in 6.3.

Each is one named pinned lemma (`BorelReducible.measurableSet_setOf`,
`not_isSmooth_of_borelReducible_eZero`) applied to a stated theorem, and the text says so.

## RT-CountableStructureSpacesPartII~2b/F02 (P3) — applied

**Changed.** Convention 10. Before: "Ordinals are in `Ordinal.{0}`, ω₁ is …". After:
"Ordinals are in `Ordinal.{0}`, except in Layer 6.1: there the level of the interval lemma and of
its sum form may lie in any universe, as Tau Ceti's `BFEquiv` allows, and
`bfEquiv_omega0_opow_mul` is stated for `γ`, `δ`, `ε` in any one universe (6.2 uses it in universe
0)".

**Verification.**
- Pinned `ModelTheory/BackAndForth/Equivalence.lean:49`: `BFEquiv (α : Ordinal.{o})`, with `M : Type
  w` and `N : Type w'` independent of `o`.
- Elaborated `bfEquiv_omega0_opow_mul : ∀ (γ δ ε : Ordinal.{u_1}), …`.
- 6.2 instantiates it at universe 0 with `γ = 1 + β`, where `β : Ordinal.{0}` comes from the base's
  `exists_uniform_bfSeparation` (`∃ β < (Ordinal.omega 1 : Ordinal.{0})`).

**Pattern.** The other ordinal universes in the README agree with the new convention:
- the `BFEquiv` contract ("level in any ordinal universe");
- `scottHeight` ("the universe of the structure", `Ordinal.{0}` on ℕ);
- `ρ : … → Ordinal.{0}` in 6.4.

## RT-CountableStructureSpacesPartII~2b/F03 (P3) — applied

**Changed.** The 3.5 *Needs:* line is now "3.4, Layer 1.2 (the Transfer law), Layer 0.1; Mathlib
`Descriptive.tree`".

**Verification.** 3.5 (b) concludes that the marked-graph class is Borel complete, from
`BorelComplete treeClass` and a reduction. That is the Transfer law of 1.2. 3.3 and 3.4 list
Layer 1.2 for the same step.

**Pattern: four more *Needs:* lines lacked Layer 1.2.** Each statement mentions `BorelComplete`,
and some routes also unfold it. All four now list Layer 1.2:
- 6.2: the definition, applied to `linearOrderClass`;
- 6.3: "Layers 1.1, 1.2, 5";
- 6.4: the definition, applied to `graphClass`;
- 6.5: Layer 1.2 added.

Layers 2.3, 3.3, 3.4, 5 and 1.3 already listed Layer 1.2.

## Checks

**Elaboration.** `lake env lean packages/CountableStructureSpacesPartII/Suggested.lean`, run from the
content checkout: exit 0. The only output is 13 warnings "declaration uses `sorry`", one per
theorem.

**Signatures.** A scratch copy of the file with `#check @name` for all 20 declarations also
elaborated (exit 0). I compared each elaborated type with its README statement; none changed in
this round, since only docstrings were edited. In particular:
- `bfEquiv_omega0_opow_mul` is over `Ordinal.{u_1}` (Convention 10 now says so);
- `exists_lt_scottHeight_of_borelComplete` and `mk_quotient_classIso_of_borelComplete` keep
  `[∀ n, Countable (L.Relations n)]`;
- `instMeasurableSpacePerm` is `{α} → [TopologicalSpace α] → MeasurableSpace (Equiv.Perm α)`.

**Dependency check** (the brief's command), after all edits:

```
depcheck: 240 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. There is one edge more than in the reviews' run (2256): the new
citations of CountableStructureSpaces worked examples 3 and 5 and Layer 4.3, a supplier already
cited.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
nowhere. The tool did not check Mathlib names, so I checked by hand at the pins every new one:
- `FirstOrder.Language.Theory.IsUniversal`;
- `Equiv.Perm.continuous_apply`, `continuous_inv_apply` and `instDiscreteTopology`;
- `isClopen_setOf_eval`.

**Ownership.** Nothing new is stated. Each new citation points to the existing owner,
CountableStructureSpaces (Layer 4.3, worked examples 3 and 5), read at the head of its open pull
request. The overlap listing shows no pull request changing this roadmap and no dropped id.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention 10 (6.1 universes) | `w = 0` as in 6.2; levels in a universe other than that of `M`, `N` | `BFEquiv (α : Ordinal.{o})` with `M : Type w`, `N : Type w'`; `γ = 1 + β`, `β : Ordinal.{0}`, `ω^(1+β)` countable | consistent with Lean and the pin | convention widened |
| `Perm.lean` contract | `α = Fin 3` discrete; `α = ℕ` discrete; `α` indiscrete | order 6, 64 measurable sets; Polish and basis of stabilizers; topology and `continuous_apply` only, no group-topology claim | matches `Perm.lean:38–178` | bullet rewritten |
| `linearOrderClass` closed | `(ℕ, ≤)`, `(ℕ, <)`, divisibility, `treeClass` as control | in; out at atom `(0,0)`; out at a pair `(2,3)` (totality, atoms `(2,3)`, `(3,2)`); `treeClass` not closed (`c_n → (ℕ, ≥)`) | universal axioms give closedness; non-universal axioms do not | base cited |
| 6.2 height step against base 4.3 | `K = modelsOf φ`; `K = A` of the 6.4 Check | Borel class: ambient and subtype squares agree; `A` non-measurable: only the subtype form holds | base is the special case | citation added |
| 6.2 unbounded height against XI.3 | one unary predicate; `graphClass` | heights `≤ ω`, Borel; on top, unbounded | agrees with lines 8997–9001 and 9046–9051 | locator added |
| 6.2 third consequence against Σ¹₁-completeness | Borel invariant `K`; `(K ×ˢ K)ᶜ` | Σ¹₁-complete ⇒ not Π¹₁ ⇒ ambient complement not Σ¹₁ ⇒ `K² \ iso` not Σ¹₁ | consistent; cited as a stronger fact not proved here | locator added |
| count of 6.3 | uncountable `L` | lower bound from `mk_quotient_eZero`; upper bound needs `mk_le_continuum`, so countable `L`, present in the signature | sound | marked own corollary |
| 6.4 Check orbit Borel against base worked example 5 | code of type `ω + 1` (Scott height `γ < ω₁`) | orbit = `bfEquivSetoid γ` class (`isoSetoid_le_bfEquivSetoid` and the height comparison) | same argument | citation added |
| *Needs:* of 3.5, 6.2–6.5 | 3.5 (b); 6.4 with `K' = graphClass` | Transfer law; the definition at `graphClass` (`Language.graph : Language.{0,0}`, countable) | 1.2 needed | Layer 1.2 added |

## For the maintainer

- No Lean name of this roadmap changed, and no id that other roadmaps cite was renumbered or
  removed.
- The roadmap now also cites CountableStructureSpaces worked examples 3 and 5 and Layer 4.3, by
  the names they have at the head of that roadmap's open pull request. If that roadmap renumbers
  its worked examples, these citations follow.
- The red-team reports raise two points for humans: the montalban-cst2 Corollary II.39 source
  issue and the four "For the human reviewers" questions. No edit was made for either.
