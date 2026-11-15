# FIX-DESIGN-CountableStructureSpacesPartII~6

Repair of the design after review REV-DESIGN-CountableStructureSpacesPartII~5 (two findings, both
P3). Files changed: `packages/CountableStructureSpacesPartII/design/README.md` and
`packages/CountableStructureSpacesPartII/design/plan.json`. `sources.toml` is unchanged: no new work
is cited.

## F01 (P3) — applied

Old → new: "base Layer 1.2 `continuousSMul_relationalConfiguration`" → "CountableStructureSpaces
Layer 1.2, joint continuity of the logic action (the `ContinuousSMul (Equiv.Perm α)
(RelationalConfiguration L α)` instance, from `continuous_uncurry_restrict` and
`Equiv.Perm.continuous_inv_apply`)" in the supplier contract, 1.3 *Needs:*, 4.1 API and 4.1
*Needs:*, plan 4.1 API and suppliers entry. Convention 4: dropped `eval_smul_atom`; "base Layer 1.2
acceptance check" → "base Layer 1 acceptance check".

Verification. At the base's open head, Layer 1.2 says the pin gives joint continuity of
restriction and that joint continuity of the action follows with `Equiv.Perm.continuous_inv_apply`.
Its bullet "The action is jointly continuous (a `ContinuousSMul` instance), for every language"
carries no Lean name. `roadmaps resolve` and a grep of the base's README and `Suggested.lean` find
neither `continuousSMul_relationalConfiguration` nor `eval_smul_atom`. At the pinned Tau Ceti there
is no `ContinuousSMul` instance on `RelationalConfiguration`: `grep` over the whole library finds
none. The pin has `continuous_uncurry_restrict` (`ModelTheory/RelationalConfiguration/Topology.lean:70`,
for a discrete target carrier), `Equiv.Perm.continuous_inv_apply`
(`Topology/Algebra/Group/Perm.lean:58`), `perm_smul_def` and `eval_perm_smul`
(`ModelTheory/RelationalConfiguration/Basic.lean:304, :309`).

The ingredients compose as follows. `σ • c = c.restrict ⇑σ⁻¹`, and `σ ↦ ⇑σ⁻¹` is continuous into
`α → α` by `continuous_pi` and `continuous_inv_apply`. So the instance is
`continuous_uncurry_restrict ∘ (σ ↦ ⇑σ⁻¹) × id`. The contract now says "every discrete carrier
`α`", since `continuous_uncurry_restrict` needs `[DiscreteTopology W]`.

The base's acceptance check sits under Layer 1 "Examples" (base README line 397), not under 1.2,
which is why that locator was also corrected.

Pattern: every occurrence of the two names was replaced: README lines 116, 271, 564, 942, 953 and
plan lines 1437, 2077 (lines as of the reviewed head). A grep now finds neither name in either file.

## F02 (P3) — applied

Old → new: (a) "isomorphism restricted to `K ∩ {c | ρ c ≤ α}` is measurable as a subset of the
square" → "with `K_α = K ∩ {c | ρ c ≤ α}` (not necessarily measurable), the isomorphic pairs of
`K_α × K_α` are measurable for the product of the subtype σ-algebras, i.e. `classIso K_α` has
measurable graph". The proof sketch now names the corestriction (`Measurable.subtype_mk`). Updated:
the `ρ = 0` Check, a new Check on the two readings, and plan 6.8 (statement, hypothesis (a),
prerequisites, tests).

Verification. `ρ` is arbitrary, so `K_α` need not be measurable, and the two readings differ. The
new Check builds a witness. A reduction `g` of equality on Cantor space to `classIso graphClass` (6.3)
is injective, so `A = g '' B` is non-measurable for non-measurable `B`, and its codes are pairwise
non-isomorphic. Take `ρ` equal to `0` exactly on `A`. Then the isomorphic pairs of `A × A` form the
diagonal of `A`:
- in the subtype reading it is the preimage of the closed diagonal under `val × val`, so measurable;
- in the ambient square its preimage under `c ↦ (c, c)` is `A`, so not measurable.

The proof uses only the weaker (subtype) reading:
- `f : graphClass → K` has analytic image (`MeasurableSet.analyticSet_image`, Mathlib
  `MeasureTheory/Constructions/Polish/Basic.lean:353`);
- by (b) that image lies in some `K_α`;
- `f' = (val ∘ f).subtype_mk` is measurable (`MeasureTheory/MeasurableSpace/Constructions.lean:223`);
- the graph of `classIso graphClass` is `(f' × f')⁻¹` of the graph of `classIso K_α`.

This agrees with 6.2, whose conclusion is stated for the product of the subtype σ-algebras.

Pattern. Two other "Borel in the square" phrasings are now made exact. Both concern measurable sets,
so the two readings coincide there:
- the supplier contract for base 4.3 `measurableSet_iso_inter_of_scottHeight_le`, whose base
  statement is ambient measurability of `iso ∩ (modelsOf φ ×ˢ modelsOf φ)` (base `Suggested.lean`
  lines 245–251);
- the unbounded-Scott-height consequence in 6.2, which now pulls ambient measurability back along
  the inclusion of `K × K`.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Base 1.2 joint continuity, as cited | `α = ℕ`, `σ = (0 1 2)`, `c` the code of `P = {0}` | `σ • c = c.restrict σ⁻¹`: `{w ∣ σ⁻¹ w = 0} = {1}`; coordinate `atom P (w)` of `σ • c` reads `c` at `σ⁻¹ w`, so it depends on `σ⁻¹ w` (continuous by `continuous_inv_apply`) and on one coordinate of `c` | continuous; discrete-carrier hypothesis added to the contract |
| Base 1.2, finite carrier | `α = Fin 2` | `Perm (Fin 2)` discrete (2 elements), coding space compact; action continuous trivially in `σ` | consistent with "every discrete carrier" |
| Convention 4 after the edit | 3-cycle on `P = {0}` | `{1}` (convention), inverse convention gives `{2}` | unchanged witness; locator now base Layer 1 Examples |
| 6.4 (a), `ρ = 0` | `K = graphClass`; `K` = codes of one unary predicate | `K_α = K` for all `α`. Unary: iso is a countable union of `O × O` over orbits `O`, each Borel, so (a) T and (b) T, hence `¬ BorelComplete` T, as the 1.2 Check says. `graphClass`: (a) F by 6.2 | consistent; Check rewritten |
| 6.4 (a), subtype against ambient | `A = g '' B`, `ρ = 0` on `A`, `1` off it | `K_0 = A`; iso pairs of `A × A` = `{(a, a)}`; subtype: `= (val × val)⁻¹ Δ`, `Δ` closed, so T; ambient: `diag⁻¹ {(a, a)} = A` non-measurable, so F | readings differ; new Check |
| 6.4 proof under the subtype reading | `f` a reduction, image in `K_α` | `(x, y) ∈ graph(classIso graphClass)` ⇔ `val x ≅ val y` ⇔ `val (f x) ≅ val (f y)` ⇔ `(f' x, f' y) ∈ graph(classIso K_α)` | valid; sketch names `f'` |
| 6.4 with `K = ∅` | `K = ∅` | `K_α = ∅`, (a) T, (b) T (the only analytic subset is `∅`); `BorelComplete ∅` F by the 1.2 Check | conclusion T, consistent |
| 6.4, `ρ` constant `ω₁` | `ρ ≡ ω₁` on nonempty `K` | `K_α = ∅` for every `α < ω₁`, (a) T vacuously; (b) F for `{c}` with `c ∈ K` (`ρ c = ω₁` is not below `ω₁`) | hypotheses not met, no claim; none |
| 6.2 consequence, rephrased | `K = modelsOf φ` with heights `≤ β` | base 4.3 gives the ambient set `iso ∩ (K ×ˢ K)` measurable; its preimage under `val × val` is the graph of `classIso K`; 6.2 says it is not measurable | contradiction valid; text made exact |
| Base 4.3 contract, rephrased | `modelsOf φ` measurable (Tau Ceti `measurableSet_modelsOf`) | ambient measurability ⇔ subtype measurability for a measurable `K` (the subtype σ-algebra is the trace) | equivalence holds; text made exact |

## Suggested.lean

There is no `Suggested.lean` at the design stage, so no `#check` scratch file was elaborated and no
binder inventory was compared. No Lean name was added or removed: `K_α` is notation inside the
statement of `not_borelComplete_of_rank_bounded`, not a declaration.

## Checks run

Dependency check (`gate --only CountableStructureSpacesPartII`), after the edits:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the edited README: no cross-roadmap citation found nowhere and no Lean name
found nowhere. `plan.json` parses as JSON, and its diff touches only the four entries named above.

## For the maintainer

- No name that other roadmaps cite changed. This roadmap no longer cites the non-existent base names
  `continuousSMul_relationalConfiguration` and `eval_smul_atom`. If the base later names the
  instance, the contract can cite that name.
- Ownership: no new object is introduced. The joint-continuity instance stays the base's (Layer 1.2,
  CountableStructureSpaces, earlier in the dependency direction). The sharpened hypothesis (a)
  belongs to this roadmap's own target 6.4.
- No text was requested; `needs-references.toml` was not written.
