# Repair report: FIX-DESIGN-CohomologyOfGroups~4

Files changed:

- `packages/CohomologyOfGroups/design/README.md`
- `packages/CohomologyOfGroups/design/plan.json`
- `packages/CohomologyOfGroups/sources.toml`

There is one review (`REV-DESIGN-CohomologyOfGroups~3`) with two findings, both P2. Each was
checked against the cited source, the pinned libraries and the supplier's text before any edit.
The design stage has no `Suggested.lean`. So no Lean declaration was added, changed or
elaborated, and the `#check @name` binder audit does not apply. The review's "For the human
reviewers" section raises no finding and changed nothing.

## F01 (P2) — applied

Changed: 8.2 "a finite `p`-group in which every abelian subgroup is cyclic …" → "for a prime `p`
(`Nat.Prime p`), a finite group `P` with `IsPGroup p P` … ", with the locator's "odd prime"
(Loh19 line 2399–2419) and a new negative-control Check for `p = 21`, `P = ℤ/7 ⋊ ℤ/3`. In the plan,
8.2 gains `p : ℕ`, `Nat.Prime p`, `mathlib:Nat.Prime` and the test `burnside_composite_21`.

Verification:

- **The pinned predicate.** `IsPGroup p G` is `∀ g : G, ∃ k : ℕ, g ^ p ^ k = 1`
  (`Mathlib/GroupTheory/PGroup.lean`, lines 45–46 at the pin). It carries no primality.
- **The witness, enumerated independently.** For `(a, b)(c, d) = (a + 2^b c, b + d)` on
  `ℤ/7 × ℤ/3`:
  - Element orders: `{1: 1, 7: 6, 3: 14}`, and `g^21 = 1` for all 21 elements, so
    `IsPGroup 21 P` holds with `k = 1`.
  - Subgroup orders: `{1: 1, 3: 7, 7: 1, 21: 1}`. The abelian subgroups are those of order
    1, 3 and 7, and all of them are cyclic.
  - `(1,0)(0,1) = (1,1)` and `(0,1)(1,0) = (2,1)`, so `P` is not abelian. No element has order
    21, so `P` is not cyclic.
  - The old statement (odd `p`, no primality) is therefore false.
- **The source.** Loh19 line 2400 (Cor. 1.6.18) and line 2416 (Cor. 1.6.19) both assume an odd
  prime. Both are on printed p. 53 (PDF page 61, Loh19 lines 2391–2430).
- **Other composite parameters.**
  - `p = 0`: `IsPGroup 0 G` holds for every group (take `k = 1`).
  - `p = 6`: `IsPGroup 6 S₃` holds.
  - The new hypothesis excludes both. Neither was claimed before, since `0` and `6` are even
    and not `2`.

Pattern search: `IsPGroup`, "p-group", "p-subgroup" and "prime" in both files.

- 7.2, 8.4 and 8.5 already carry "p prime" (plan) and "for a prime `p`" (README).
- Tau Ceti's `cup_bijective_of_forall_isPGroup_of_lTensor_injective` is a pinned import and is
  used as it stands.
- 8.5's (c)⇔(d) route cites 8.2 with `p` prime, which matches the repaired statement.

No other occurrence lacked primality.

## F02 (P2) — applied

Changed:

- **8.4.** The "Generalised quaternion groups" clause (cup with `u ∈ Ĥ⁴(Q_{2^s}, ℤ)` an
  isomorphism for every `M`, 2-period 4) and the API bullet "`Q_{2^s}`: 2-period 4" were deleted.
  That case is now a Check that applies the imported theorem.
- **Imports.** Scope and ownership and the K3BlochGroups §5.2 contract now import the period
  class and the invertibility of cup product with it.
- **What stays.** 8.3 is kept, as is the cyclic all-degree theorem, which now has a locator.

Verification at the supplier's open head (K3BlochGroups README, §5.2 "Unstable special-linear
homology", its target bullets quaternionPeriodicHomology and finiteGroup_period_fromSylow):

- quaternionPeriodicHomology builds the four-periodic free resolution of `Q_{2^s}`, `s ≥ 3`. It
  gives `H_{4j+3} = ℤ/2^s`, `H_{4j+1} = (ℤ/2)²` and `H_{2j+2} = 0`, and asks to "verify that its
  fundamental period class generates Tate H⁴".
- finiteGroup_period_fromSylow sets as its proof targets "the stable period class …: cup product
  with it is invertible in Tate cohomology, its restriction is the corresponding cyclic/quaternion
  period class". It uses "the quaternion four-period class for the 2-primary branch", and it
  states that a generalised quaternion Sylow 2-subgroup has period four.
- Take `G = Q_{2^s}`. It is its own Sylow 2-subgroup, and all its Tate groups are 2-primary. So
  K3BlochGroups owns the invertibility of cup with the quaternion class and the 2-period 4. The
  deleted clause planned that again.
- **Passing to every coefficient module.** Invertibility, in either reading (a unit of
  `Ĥ*(G, ℤ)`, or cup bijective on `Ĥ*(G, ℤ)`, which in degree `−4` gives `v` with `u ∪ v = 1`),
  yields the isomorphism for every `M`. The steps:
  - `v ∪ u = (−1)^{−16} u ∪ v = 1` by `cup_gradedComm`.
  - `v ∪ (u ∪ x) = (v ∪ u) ∪ x = x` by `cup_assoc` and `cup_left_unit`, and symmetrically
    `u ∪ (v ∪ y) = y`.
  - All three are pinned in Tau Ceti: `TateCohomology/Cup/Associativity.lean` line 214,
    `GradedComm.lean` line 168 and `Unit.lean` line 56.
  - The contract records this derivation, so nothing the deleted clause gave is lost.
- **The review's repair, applied with one addition.** Removing the quaternion clause removed the
  only content that CE56 Ch. XII located in 8.4. The plan's 8.4 locator is now MilneCFT Ch. II
  Prop. 3.4 and Remark 3.5, p. 81 (MilneCFT line 3793–3822). This is the cyclic periodicity, with
  its description as cup product by the class sending the generator to `1/m`, which the source
  states without proof. The README says so. The `p`-period definition is now located at
  Hutchinson13 line 494–497 (p. 12).

Other places that carried the same content, all updated:

- the Summary ("`p`-period with its cyclic and generalised quaternion cases" → "… with the
  all-degree cup periodicity of cyclic groups");
- 8.4's *Needs:* 8.3, `QuaternionGroup` and `Sylow` (used only by the deleted clause) were
  removed. `IsCyclic` and `TauCeti.TateCohomology.cup_δ_of_flat` were added: the cyclic route's
  "compatibility of the Tate cup product with connecting maps" uses `cup_δ_of_flat`;
- Layer 8 Examples: `Q₈` through 8.3 now names the sequence cut from K3BlochGroups' resolution,
  says it agrees with the imported class, and makes no claim that the two classes are equal;
- Layer 8 Dependencies;
- in the plan: 8.4's statement, hypotheses (`[IsCyclic G]` for the cyclic clause, which matches
  the README), locator and prerequisites; the `pPeriod_quaternion` API entry moved to the tests;
  the K3BlochGroups supplier `what`;
- `sources.toml`: MilneCFT gains Prop. 3.4/Remark 3.5 and "Target 8.4"; CE56 drops "Target 8.4"
  and "generalised quaternion resolutions"; Hutchinson13's locator names the ℓ-period definition.

Other ownership was checked by object:

- `characterConnectingClass` and cup periodicity of cyclic groups were searched across main and
  the open heads. The only other hit is ClassFieldTheory's class-formation character formula
  (README lines 1013–1015 on main), which is a degree-zero reciprocity statement and not the
  all-degree periodicity.
- So the retained cyclic clause has no other owner.
- 8.3 (periodicity from an exact sequence with orientation character) is not stated by
  K3BlochGroups, which uses only the quaternion and cyclic classes.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 8.2, prime `p` | `p = 21`, `P = ℤ/7 ⋊ ℤ/3` | Orders `{1:1, 7:6, 3:14}`; `g^21 = 1` for all `g`. Abelian subgroups have orders `1, 3, 7`, all cyclic. `P` is non-abelian and not cyclic. | Old statement false; primality added; negative Check added. |
| 8.2, prime `p` | `p = 0` and `p = 6`, with `S₃` | `IsPGroup 0 S₃` holds (`k = 1`: `g^0 = 1`). `IsPGroup 6 S₃` holds (orders 1, 2, 3). | Both excluded by `Nat.Prime p`; neither was claimed before (even, ≠ 2). |
| 8.2, `p = 2` | `Q₈`, `Q₁₆ = QuaternionGroup 4`, `C₄`, `D₈`, trivial group | `Q₈`: all 6 non-central elements square to `−1`, so its abelian subgroups are `1`, `⟨−1⟩` and three `C₄`, all cyclic. `Q₁₆`: `x^i y` centralises only `{1, x⁴}` in `⟨x⟩`, so the abelian subgroups lie in `⟨x⟩ ≅ C₈` or are `⟨x^i y⟩ ≅ C₄`. `C₄` is cyclic. `D₈ ⊃ C₂²`, so the hypothesis fails. The trivial group is cyclic. | Holds both ways; `s ≥ 3` lower bound kept. |
| 8.2, odd prime | `C₉`; Heisenberg group of order 27 | `C₉` is cyclic. Heisenberg contains `C₃ × C₃`, which is not cyclic, so the hypothesis fails. | Holds. |
| 8.4, cyclic periodicity | `G = 1`, `C₂` with `M = ℤ`, `C₃` with `M = 𝔽₃`, `C₄` | `G = 1`: all `Ĥ = 0`, `δχ = 0`, unique isomorphisms. `C₂`: `Ĥ⁰ = ℤ/2 → Ĥ² = ℤ/2`, `1 ↦ δχ ≠ 0`. `C₃`: `𝔽₃ → 𝔽₃`, bijective. `C₄`: the wrong model `2δχ` sends `1 ↦ 2 ∈ ℤ/4`, not onto; `χ(g) = 1/m` excludes it. Side of the cup is irrelevant (degree 2 is even). | Holds for every generator `g`. |
| 8.4, Check `Q_{2^s}` | `Q₈` (`s = 3`), `Q₁₆` | `Ĥ¹ = Hom(G, ℤ) = 0`; `Ĥ² ≅ H₁^∨ = (ℤ/2)²` (abelianization of `Q₈` has order 4 and exponent 2); `Ĥ³ ≅ H₂^∨ = 0`; `Ĥ⁴ ≅ H₃^∨ = ℤ/2^s`. Least `d` with a cyclic group of order `2^s` is `4`. | Agrees with Swan's value and with the imported class. |
| 8.4, Check `Q_{2^s}` (wrong model) | Period 2 on `Q₈` | It would force `Ĥ² ≅ Ĥ⁰ = ℤ/8`, which is cyclic of order 8. The actual group is `(ℤ/2)²`. | Excluded. |
| K3BlochGroups contract: every `M` | `Q₈` with `M = ℤ` and `M = 𝔽₂` | `M = ℤ`: `Ĥ⁰ = ℤ/8 → Ĥ⁴ = ℤ/8`, `1 ↦ u`. `M = 𝔽₂`: dims of `Hⁿ(Q₈, 𝔽₂)` are `1, 2, 2, 1, 1, 2, 2, 1, …`, so `Ĥ⁰ = 𝔽₂ ≅ Ĥ⁴` and `Ĥ¹ = 𝔽₂² ≅ Ĥ⁵`. Sign `(−1)^{4·(−4)} = 1`. | Derivation consistent. |
| Layer 8 Example `Q₈` | Ranks of `C₃, …, C₀` = `1, 2, 2, 1` | Alternating ℤ-rank sum `1 − 8 + 16 − 16 + 8 − 1 = 0`. Left `ℤ` via `1 ↦ Σ g` has trivial action. | Exact-sequence shape consistent; 8.3 applies with `n = 3` and trivial `χ`. |
| 8.4 API, unchanged bullets | `C₆` at `p = 2, 3`; `p ∤ |G|` | `C₆`: `Ĥ¹ = 0`, and `Ĥ²(p) = ℤ/2` and `ℤ/3` give period 2. `p ∤ |G|`: least `d = 1`. | Unchanged; consistent with the new Check. |

## Checks run

Dependency check:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2179 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The placement message is expected at the design stage.

Citation resolution (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
found nowhere. The tool did not check names outside TauCetiRoadmap. So the new library names
were checked by hand at the pins:

- `Nat.Prime`: `Mathlib/Data/Nat/Prime/Defs.lean` line 42.
- `IsPGroup`: `Mathlib/GroupTheory/PGroup.lean` line 45.
- `IsCyclic`: `Mathlib/Algebra/Group/DivInvMonoid.lean` line 193.
- `TauCeti.TateCohomology.cup_left_unit`, `cup_assoc`, `cup_gradedComm`, `cup_δ_of_flat`: Tau
  Ceti `…/TateCohomology/Cup/Unit.lean:56`, `Associativity.lean:214`, `GradedComm.lean:168`,
  `Delta.lean:242`.

`plan.json` parses and round-trips with its original formatting. No source was fetched. MilneCFT
and Hutchinson13 were read from the cache. `needs-references.toml` was not created.

## For the maintainer

- No target id or target name changed. In 8.4 the plan entry `pPeriod_quaternion` moved from
  `api` to `tests`. No other roadmap cites it.
- The consumption of K3BlochGroups §5.2 now includes:
  - the quaternion period class in `Ĥ⁴`;
  - the invertibility of cup product with that class, from the targets quaternionPeriodicHomology
    and finiteGroup_period_fromSylow.

  If a revision of K3BlochGroups renames or moves those, this contract must follow.
- K3BlochGroups was read at its open head, as listed in the brief. Ownership against the other
  open roadmaps was checked with `roadmaps grep` for the objects changed here: cyclic and
  quaternion cup periodicity, and `characterConnectingClass`.
- No passage in the review asked for anything outside this job.
