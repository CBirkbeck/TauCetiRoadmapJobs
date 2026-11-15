# FIX-DESIGN-GaussianIsoperimetryAndClusters~7

Repair round for the review `REV-DESIGN-GaussianIsoperimetryAndClusters~6` (one finding, P3).

## F01 (P3) — applied

§9.1: "Ehrhard1983 Définition 1.1, line 117–129, in the mirrored sublevel convention" → "… in the mirrored superlevel convention: his half-space `H(u, a) = {⟨x, u⟩ > a}` (line 64–66) is a superlevel set, so with his `T = F^⊥` his `S(T, u)` is `S̄_{F,−u}` on closed sets". §6.1: "Definition 1.1" → "Définition 1.1", plus the same convention note for open sets (`S_{F,−u}`). The third §9.1 Check gains the Ehrhard witness. Plan locators of 6.1 and 9.1 and the 9.1 test `direction_matters` match.

**Verification.** Ehrhard1983 line 64–66 defines `H(u, λ)` as the open half-space `{⟨x, u⟩ > λ}`. Line 118–127 sets, for `T` of dimension `n − k` and `u ⊥ T`, the section of `S(T, u)(A)` over `x ∈ T` to be `∅` if the `γ_k`-measure of `A ∩ (x + T^⊥)` is `0`, the whole fibre if it is `1`, and otherwise `H(u, a)` (for open `A`) or its closure (for closed `A`) with `a` chosen so that the measures agree. So the section is a superlevel set in direction `u`, and Ehrhard's `T` is `F^⊥` here. The roadmap's rule `Φ(⟨y, u⟩) ≤ v` is sublevel, so the old wording was wrong; the review is right.

**Correspondence, computed.** Fix `x` and write `v` for the section measure.
- Closed sets: `S̄_{F,−u}` has section `{Φ(−⟨y, u⟩) ≤ v} = {⟨y, u⟩ ≥ −Φ⁻¹(v)}` for `0 < v < 1`. Ehrhard's closed section is `{⟨y, u⟩ ≥ a}` with `1 − Φ(a) = v`, which gives `a = −Φ⁻¹(v)`: the same set.
- Open sets: `S_{F,−u}` has section `{⟨y, u⟩ > −Φ⁻¹(v)}`, which is Ehrhard's `H(u, a)` with the same `a`.
- Degenerate cases: `v = 0` gives the empty section on both sides (`Φ(·) ≤ 0` and `Φ(·) < 0` never hold). `v = 1` gives the whole fibre on both sides.
- Witness (the review's instance): `C = {⟨x, u⟩ ≤ a}` has every section of measure `Φ(a)`. Ehrhard's rule gives `{⟨x, u⟩ ≥ −a}`, and so does `S̄_{F,−u}(C) = {Φ(−⟨y, u⟩) ≤ Φ(a)}`. Both have measure `Φ(a) = 0.8413447` at `a = 1` (double precision). The wrong model `S̄_{F,u}` fixes `C` instead, so the Check tells the two apart.
- Consistency of Proposition 1.2 (§9.1, line 134–140): Ehrhard's `S(T, u)[∁A] = ∁ S(T, −u)[A]` becomes `S_{F,−u}(∁C) = ∁ S̄_{F,u}(C)` in our notation, which is the README bullet `S_{F,u}(E ∖ C) = E ∖ S̄_{F,−u}(C)` with `u ↦ −u`. Direct check of that bullet on one fibre: `{Φ(⟨y, u⟩) < 1 − v}` against the complement of `{Φ(−⟨y, u⟩) ≤ v} = {Φ(⟨y, u⟩) ≥ 1 − v}`. They agree, so no change.

**Pattern search.** I searched README and plan for "sublevel", "superlevel", "mirrored", "Definition 1", "Définition" and "S(T".
- §6.1: the Ehrhard citation had no convention note, and its English spelling was inconsistent. Both are repaired as above, and the note records that Ehrhard defines `S(T, u)` on open and closed sets only.
- Conventions (lines 27, 35): describe this roadmap's own sublevel rule. Correct, unchanged.
- §9.1 route ("after the first step every `F_1`-section is a sublevel half-space in direction `u`"): our convention. Correct, unchanged.
- §9.3 ("`S̄_{ℝu_j, −u_j}` … sends sections to superlevel half-lines as in Ehrhard's paper"): the section `{⟨y, u_j⟩ ≥ −Φ⁻¹(v)}` is superlevel in direction `u_j`. Correct, unchanged.

The other Ehrhard1983 locators keep the source's French names (Proposition, Exemple, Lemme, Corollaire, Théorème).

## Checks

**Dependency check** (command of the brief), output:

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Other checks.**
- `plan.json` still parses as JSON.
- No new target, Lean name, supplier edge, source or manifest entry. `sources.toml` is unchanged; its Ehrhard1983 locator list already spells "Définition 1.1".
- No `Suggested.lean` exists at the design stage, so there was no elaboration and no `#check` binder audit.
- Nothing was fetched.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §9.1: Ehrhard's `S(T, u)` is `S̄_{F,−u}` on closed sets (`T = F^⊥`) | `v ∈ (0, 1)`; `v = 0`; `v = 1`; `C = {⟨x, u⟩ ≤ 1}` | threshold `a = −Φ⁻¹(v)` on both sides; empty / empty; fibre / fibre; `{⟨x, u⟩ ≥ −1}` both, measure `0.8413447` both | holds; wording changed |
| §6.1: Ehrhard's `S(T, u)` is `S_{F,−u}` on open sets | `v ∈ (0, 1)`, `0`, `1`; `O = {⟨x, u⟩ < 1}` | `{⟨y, u⟩ > −Φ⁻¹(v)}` both; empty both; fibre both; `{⟨x, u⟩ > −1}` both, measure `0.8413447` | holds; note added |
| §9.1 third Check, extended | wrong model `S̄_{F,u}` against Ehrhard's rule on `{⟨x, u⟩ ≤ 1}` | `S̄_{F,u}` gives `{⟨x, u⟩ ≤ 1}`, Ehrhard gives `{⟨x, u⟩ ≥ −1}`, both of measure `0.8413447`; flipping the side at the same threshold gives measure `0.1586553` | discriminates |
| §9.1 Proposition 1.2 bullet | one fibre, `v` arbitrary | `{Φ(⟨y, u⟩) < 1 − v}` = complement of `{Φ(⟨y, u⟩) ≥ 1 − v}` | holds; no change |

## For the maintainer

- No name that other roadmaps cite changed, and no section was renumbered.
- Ownership was not re-examined: this round adds no construction. The review's search, made with the `roadmaps` tool at the index of 2026-11-15, found no other owner.
- No untrusted text contained instructions.
