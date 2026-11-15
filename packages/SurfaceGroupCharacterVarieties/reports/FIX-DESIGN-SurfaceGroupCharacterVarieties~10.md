# FIX-DESIGN-SurfaceGroupCharacterVarieties~10

This round settles the findings of REV-DESIGN-SurfaceGroupCharacterVarieties~9: two findings, both
P3. Both were verified and applied. Files changed:
`packages/SurfaceGroupCharacterVarieties/design/README.md` and
`packages/SurfaceGroupCharacterVarieties/design/plan.json`. `sources.toml` is unchanged, since no new
source is cited.

## F01 (P3) — applied

What changed:
- **Contract.** Added after "acts trivially)": §5.2 is the right action `ρ ↦ ρ ∘ φ`, an anti-homomorphism. §7.4's `[φ]` acts by §5.2's automorphism of `φ⁻¹`. The four listed automorphisms are involutions, so the two directions agree on them.
- **§7.5 third Check.** Appended the witness at `φ = (a, a⁻¹b)`: `(x, z, xz − y)` against `(x, xy − z, y)`, giving `(2, 3, 4)` and `(2, 1, 2)` at `(2, 2, 3)`.
- **Same pattern elsewhere.** The Scope sentence ("the action" → "the right action `ρ ↦ ρ ∘ φ`"), the Layer 7 Examples (`[φ]` by §5.2's automorphism of `φ⁻¹`), and in `plan.json` the 7.5 statement, the `pants_SL2C` test and the `suppliers` entry.

Verification:
- **NonabelianLevelStructures §5.2, at its open head.** It states "right precomposition by Aut(F₂) induces an anti-homomorphism". Its first Check gives the triple `(x, xy − z, y)` for `φ ∘ (r ∘ t)`, with `r ∘ t : (a, b) ↦ (a, a⁻¹b)`.
- **Hand computation.**
  - `r ∘ t` sends `a ↦ r(a⁻¹) = a` and `b ↦ r(ab) = a⁻¹b`. Its inverse sends `b ↦ ab`.
  - With `ρ = (A, B)`, `ρ ∘ φ⁻¹ = (A, AB)`. Since `A² = (tr A)A − I`, `tr(A²B) = xz − y`.
  - `ρ ∘ φ = (A, A⁻¹B)`, with `tr(A⁻¹B) = xy − z` and `tr(A · A⁻¹B) = y`.
  - At `(2, 3, 5)`: `(2, 5, 7)` against `(2, 1, 3)`, as the review says.
- **Matrices, recomputed with a short script.** Take `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`.
  - `A · AB = [[3,2],[1,1]]`, so the triple is `(2, 3, 4)`.
  - `A⁻¹B = [[0,−1],[1,1]]`, so the triple is `(2, 1, 2)`.
  - Both commutator traces are `3`: `4+9+16−24−2` and `4+1+4−4−2`.
- **The four listed automorphisms are involutions.**
  - `r² = s² = γ₋ᵢ² = 1`.
  - `t²` sends `a ↦ t(a⁻¹) = a` and `b ↦ t(a) t(b) = a⁻¹ab = b`.
  - Their moves recomputed at `(2, 2, 3)`: `r ↦ (2, 2, 1)`, `s ↦ (2, 2, 3)`, `t ↦ (2, 3, 2)`, and `γ₋ᵢ ↦ (2, 2, 3)`. These match the contract.

One departure from the suggested placement: the witness goes at the end of the §7.5 Check, not after "not faithful". Placed there, it would separate "Both moves preserve the commutator trace" from the two moves it refers to.

## F02 (P3) — applied

What changed:
- **Scope.** "both are used here only in §7.5" → "§5.1 is used here only in Checks of §§7.2 and 7.5, and §5.2 only in §7.5".
- **Contract.** "Used only in §7.5" → the same split.
- **Layer 7 Dependencies.** "NonabelianLevelStructures §§5.1–5.2 … (§7.5)" → "(Checks of §§7.2 and 7.5)".
- **`plan.json` `suppliers`.** "Used only in 7.5" → "§5.1 used only in tests of 7.2 and 7.5, and §5.2 only in 7.5".

Verification:
- §7.2's second Check cites NonabelianLevelStructures §5.1, and §7.2's *Needs:* line does not list it. This matches the README's treatment of SymplecticGeometry/HamiltonianReduction R5: it is "(a Check of §7.1)" and is not in §7.1's *Needs:*.
- The README now cites NonabelianLevelStructures at lines 161, 165, 400, 1740, 1824, 1827, 1843, 1849, 1850 and 1859. Every one lies in the Scope, the contract, §7.2's Check, §7.5, the Layer 7 Examples or the Dependencies.
- The split is exact because §5.2 is cited only in §7.5 and in the Examples that restate it.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Contract: §7.4's `[φ]` is §5.2's automorphism of `φ⁻¹` | `φ = r ∘ t = (a, a⁻¹b)`; `ρ = (A, B)` | §7.4: `ρ ∘ φ⁻¹ = (A, AB)` → `(x, z, xz − y)`; §5.2: `ρ ∘ φ = (A, A⁻¹B)` → `(x, xy − z, y)`; the composition `(φψ)·ρ = ρ ∘ ψ⁻¹ ∘ φ⁻¹ = φ·(ψ·ρ)` | true | added |
| Contract: the four listed moves agree in both directions | `r, s, t, γ₋ᵢ` at `(2, 2, 3)` | each squares to `1`; moves `(2, 2, 1)`, `(2, 2, 3)`, `(2, 3, 2)`, `(2, 2, 3)`, matching the matrix triples of `(A⁻¹, B)`, `(B, A)`, `(A⁻¹, AB)`, `(A⁻¹, B⁻¹)` | true | added |
| §7.5 Check, direction witness | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`; also `(2, 3, 5)` | `A·AB = [[3,2],[1,1]]`, triple `(2, 3, 4)`; `A⁻¹B = [[0,−1],[1,1]]`, triple `(2, 1, 2)`; commutator traces `3`, `3`; at `(2, 3, 5)`: `(2, 5, 7)` against `(2, 1, 3)` | true; Fricke invariance holds for both | added |
| Identity `tr(A²B) = tr A · tr AB − tr B` on `SL₂` | the pair above; `A = I` | `4 = 2·3 − 2`; with `A = I`: `tr B = 2 tr B − tr B` | true (Cayley–Hamilton `A² = (tr A)A − I`) | added |
| Scope and contract usage split | every occurrence of the supplier name | §5.1 is cited in §7.2's Check and in §7.5 (Check and *Needs:*); §5.2 only in §7.5 and the Examples | true | changed |
| Layer 7 Examples clause | the class of `(a⁻¹, b⁻¹)`; `φ = r ∘ t` | trivial in both directions; `(2, 3, 4)` from the inverse, as in §7.5 | consistent with §§7.4–7.5 | changed |

No other statement uses the object changed here. The Conventions "Actions" bullet (`φ · ρ = ρ ∘ φ⁻¹`, with its `ℤ²` witness) and §§1.3 and 7.4 already state the left action. They agree with the new text: the left action is §5.2's map at the inverse, and the `ℤ²` witness is unchanged.

## Checks

- **Dependency check (gate), after the final edit:**

  ```text
  candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
  depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **`roadmaps resolve` on the README:** no cross-roadmap citation and no Lean name found nowhere. The four names listed in the worker's `citations.md` no longer show up.
- **`plan.json`:** parses as JSON. Only the 7.5 statement, the `pants_SL2C` test and the NonabelianLevelStructures `suppliers` entry changed. Prerequisites are unchanged, so the *Needs:* lines and the `prerequisites` lists still agree.
- **`Suggested.lean`:** there is none at the design stage, so the `#check` elaboration comparison was not run.
- **Gate failures:** none were listed for this round.

## Notes for the maintainer

- No name that other roadmaps cite was renamed, and no section was renumbered.
- No new supplier, gap or source was added.
- Ownership: no new object is stated, so no new ownership question arises. NonabelianLevelStructures keeps §§5.1–5.2, cited by section. This roadmap only records how its own §7.4 action relates to §5.2's right action.
- Nothing in the review text was suspicious.
