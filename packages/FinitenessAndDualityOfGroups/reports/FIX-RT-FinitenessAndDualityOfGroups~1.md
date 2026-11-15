# FIX-RT-FinitenessAndDualityOfGroups~1

Repair of red-team round 1: passes a and b, at head 4505272. All six findings were checked against the
sources, the pins and the README, and all six hold. Files changed:

- `packages/FinitenessAndDualityOfGroups/README.md`
- `packages/FinitenessAndDualityOfGroups/Suggested.lean`

`packages/FinitenessAndDualityOfGroups/design/plan.json` is unchanged (see 1b/F01).

## RT-FinitenessAndDualityOfGroups~1a/F01 (P2) — applied

Verified: Mathlib's `Rep.ind`, `ChainComplex.single₀`, `QuasiIso` and coproducts in `Rep` state the
formula; a rank-one `ℤ`-representation is a `±1` character. Old → new: the docstring's
"not statable" bullet for general 8.7 is deleted; new theorem
`groupEulerChar_eq_sum_of_monomialResolution` (finite monomial resolution, stabilizers of finite
homological type) is named in README 8.7, its *Needs:* and the Mathlib contracts.

## RT-FinitenessAndDualityOfGroups~1a/F02 (P2) — applied

Verified: Brown1974 Theorem 4 and Corollary 1 (lines 425–451) with Appendix A Theorem 7 (lines
1284–1288), which holds over every field `K`. Old → new: new theorem
`finsum_finrank_groupCohomology_eq_groupEulerChar_mul` (`IsOfTypeFP ℤ G`, finite-dimensional
`V : Rep K G`), named in README 8.5; the docstring lists the `G₀(K[G/Γ'])` form as not statable
(the pins lack the action of `G/Γ'` on `Hⁱ(Γ', V)`).

## RT-FinitenessAndDualityOfGroups~1a/F03 (P2) — applied

Verified: both results are owned here and statable with `CategoryTheory.Action` on `SSet`,
`Action.functorCategoryEquivalence` (limit = fixed simplices, colimit = orbits), `SSet.homology`
and `SSet.HasDimensionLE`. Old → new: new theorems `exists_acyclic_action_finite_stabilizers`
(README 5.4(c)) and `smith_floyd` (README 8.8(a): dimension `≤ N`, finite-dimensional homology in
each degree), with contract bullets; no new definitions.

## RT-FinitenessAndDualityOfGroups~1b/F01 (P2) — applied differently

Verified: the `K_≤` route uses only pinned declarations and `gap:simplicial-replacement-dimension`.
Old → new (README, steps 1–4): 5.4(a) keeps only the `K_≤` route, with the lift step spelled out;
the gap contract, §4.7, nerve, `toTop`, order-complex entries and `sd K` Check halves are deleted.
Step 5 is not done: the plan's target 5.4 still names the gap, and only `gaps` may change here.

## RT-FinitenessAndDualityOfGroups~1b/F02 (P3) — applied

Verified: `χ(ℤ/2 × ℤ) = 0`, so `m = 1` gives an integer while the least common multiple is `2`.
Old → new: in the docstring of `exists_int_eq_mul_groupEulerChar`, "the least such `m` is the
least common multiple" becomes: the source states the lcm case, the lcm exists (orders divide the
index of a torsion-free normal subgroup), and smaller `m` can work. The statement is unchanged.

## RT-FinitenessAndDualityOfGroups~1b/F03 (P3) — applied

Verified: BieriEckmann1973 lines 396–397 only use the isomorphism, inside the proof of Theorem 3.3;
Proposition 3.1 (lines 366–369) states it, with `Hom_S(ℤG, ℤS) ≅ ℤG` at lines 345–351. Old → new:
2.3(b) cites "BieriEckmann1973 Proposition 3.1, lines 366–369, with the isomorphism
`Hom_H(ℤG, ℤH) ≅ ℤG` of lines 345–351". The line-396 citation for Serre's theorem in 3.2 stays.

## Checks run

- **Elaboration.** I ran `lake env lean packages/FinitenessAndDualityOfGroups/Suggested.lean` from
  the content checkout. It exits 0. It reports 18 warnings, all of them "declaration uses `sorry`",
  and no errors. No `TauCeti.*` module needed building.
- **Signatures.** I elaborated a scratch copy with `#check @name` for all 27 declarations (23
  existing, 4 new).
  - The 23 existing signatures are unchanged.
  - The 4 new ones carry every binder in their own signature, and match README 5.4(c), 8.5, 8.7
    and 8.8(a).
  - In `smith_floyd`, the `let` abbreviations elaborate as `have` bindings. They are beta-redexes,
    so the proposition is unchanged.
  - Two problems were found and fixed. Opening the `Simplicial` scope breaks the `{g : G | …}`
    set-builder notation, so simplices are written `Z.V.obj (Opposite.op (SimplexCategory.mk k))`.
    `End V` is a structure at this Mathlib pin, so `(Z.ρ g).asHom` is used.
- **Dependency check.** The command of the brief prints the line below. It has no UPWARD, CYCLE or
  `moved:` line.

      depcheck: 245 roadmaps, 2214 edges, 0 problem(s)

- **Citations.** `roadmaps resolve` gives the same four leads as before: three source keys
  misread as roadmaps, and the board package MotivicStructuresInModuliOfCurves. It finds no Lean
  name nowhere.
- **Ownership.** I searched main and the open heads for Floyd, Smith theory, monomial resolutions
  and the equivariant Euler characteristic.
  - The hits are SheafTheoreticSmithTheory (étale sheaves, excluded in Scope) and the Conner–Floyd
    bordism of BordismFormalGroups.
  - Nothing owns the simplicial Smith–Floyd theorem, Serre's action or the monomial Euler formula.
  - No fully qualified name of `Suggested.lean` occurs elsewhere.

## Gate failure repaired

- **plan.json dropped a gap that its targets still name.** The worker's check reported that
  `packages/FinitenessAndDualityOfGroups/design/plan.json` drops the gap
  `order-complex-nerve-realization`, which target 5.4 of the plan still names. I restored the
  entry exactly as accepted: supplier AlgebraicTopology, section §4.7, the same `needs` and
  `neededBy`. plan.json is now byte-identical to the committed file.
- **Checks after the repair.** Nothing else changed. The README and `Suggested.lean` are untouched
  by this repair, so the elaboration result above still holds. I re-ran the dependency check after
  the restore, and it prints the same line: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `exists_acyclic_action_finite_stabilizers` | `G` finite, `Γ = 1`, `n = 0` | `Z` a point, dimension `0 ≤ 3|G|`; stabilizer `G`, `|G| ≤ [G : 1]`; meets `Γ` in `1` | holds; bound attained |
| same | `ℤ/2 × ℤ ⊇ ℤ`, `n = 1` | `Z = W × W`, dimension `2 ≤ 2·3`; stabilizers `⟨s⟩` (`2 ≤ 2`) on the diagonal, `1` elsewhere; `⟨s⟩ ∩ ℤ = 1` | holds |
| same | `Γ = G = ℤ`, `n = 1` | `W` the line, dimension `1 ≤ 3`, stabilizers trivial (`1 ≤ 1`) | holds |
| same, wrong models | `Z = ∅`; "trivial stabilizers"; bound `[G:Γ]·n` | `H₀(∅) = 0 → ℤ` is not an isomorphism, so excluded; finite `G` has stabilizer of order `|G| > 1`; a bound without `max 3` would need the Eilenberg–Ganea problem in dimension 2 | the hypotheses chosen are the right ones |
| `finsum_finrank_groupCohomology_eq_groupEulerChar_mul` | `G = 1`; `ℤ` with `t ↦ λ`; `F₂` over `𝔽₂` | `dim V = 1·dim V`; `λ ≠ 1`: `0 − 0`, `λ = 1`: `1 − 1`, both `= 0·1`; `1 − 2 = −1·1` | holds in characteristic 2 |
| same, control | `ℤ/2`, `V = ℚ` | left side `1`, right side `1/2`; excluded because `ℤ/2` is not `FP` over `ℤ` (`H^{2k} = ℤ/2`) | hypothesis needed |
| `groupEulerChar_eq_sum_of_monomialResolution` | `ℤ/2`, `C = ℤ` in degree 0 | `1/2 = 1/2` | holds |
| same | `ℤ` on the line | `C₁ = C₀ = ℤG`: `0 = 1 − 1` | holds |
| same | `ℤ/2` flipping one edge | `C₁ = ℤ_sgn`, `C₀ = ℤG`: `1/2 = 1 − 1/2` | holds with a nontrivial character |
| same | `ℤ/4 ∗_{ℤ/2} ℤ/6` on its tree | `1/4 + 1/6 − 1/2 = −1/12` | holds |
| same | `ℤ²` on the plane | `1 − 2 + 1 = 0` | holds |
| same, degenerate case | all `ι p` empty | `C ≅ 0`, so `H₀ = 0` and there is no `QuasiIso` to `ℤ` | vacuous, consistent |
| same, wrong model | coinduction in place of `Rep.ind`, for `1 ≤ ℤ` | `ℤ^ℤ` against `ℤ[ℤ]` | `Rep.ind` is the right one |
| `smith_floyd` | `Δ[0]` with trivial action; `∅` | `1 + (p−1)·1 = p·1`, tail `1 ≤ 1`; `0 = 0` | holds |
| same | reflection of the 4-vertex circle, `p = 2`, `N = 1` | Betti numbers `X (1,1)`, fixed `(2,0)`, orbit `(1,0)`; tails `2 ≤ 2`, `0 ≤ 1`; `0 + 1·2 = 2·1` | holds |
| same | free swap on that circle; `ℤ/3` rotating a 3-vertex circle | `0 + 0 = 2·0`; `0 + 2·0 = 3·0` | holds |
| same, controls | trivial `ℤ/2` on discrete `ℕ`; `E(ℤ/2)`; relation without the fixed-point term | `H₀` infinite-dimensional, excluded by `hX`; no `N` exists; `0 = 2` for the reflection | all excluded |
| 5.4(a), `K_≤` route | a vertex; an edge; `∂Δ²`; all strings | point; ranks `(2,1)`, `χ = 1`; ranks `(3,3)`, `H₀ = H₁ = ℤ`; `W` the line with 3 vertices per period, and `ℤ ⊗_Γ N(W)` has `χ = 3 − 3 = 0 = χ(ℤ)`; `(0,1,0)` nondegenerate, so infinite-dimensional | holds; Check added |
| 8.9 docstring | `ℤ/2 × ℤ` | `χ = 0`, `lcm = 2`, yet `1·χ ∈ ℤ` | the new wording is true |
| 2.3(b) locator | BieriEckmann1973 lines 345–351 and 366–369 | they state `Hᵏ(S; ℤS) ≅ Hᵏ(G; ℤG)` at finite index | supports the claim |

## For the maintainer

- **The gap `order-complex-nerve-realization` stays in plan.json.** Target 5.4 of the accepted
  plan lists `gap:order-complex-nerve-realization` among its prerequisites and in one of its tests.
  At the package stage only the top-level `gaps` list may change. The board's check refuses to drop
  a gap that a target of the plan still names, so the `gaps` entry is kept exactly as accepted.
  The README no longer uses the gap (1b/F01): no target, *Needs:* line or supplier contract names
  it. Retiring it means editing target 5.4 of the plan at the design stage, which is a human
  decision. Until then the intake announces two gaps, `simplicial-replacement-dimension` and
  `order-complex-nerve-realization`, as the accepted design already did. The plan's
  AlgebraicTopology supplier entry still mentions §4.7, and `design/review.json` still lists the
  gap under `conditional_gaps`.
- **Cited AlgebraicTopology sections.** AlgebraicTopology §4.7 is no longer cited. §§6.3, 6.4,
  8.1, 8.3, 8.5, 8.7 and 8.11a are still cited.
- **Names.** Four Lean names are new. No name was removed or renamed, and no section or target id
  changed. The new Mathlib names in the README were opened at the pin: `CategoryTheory.Action`,
  `Action.functorCategoryEquivalence`, `CategoryTheory.End`, `SSet.homologyMap`, `ModuleCat.of`,
  `CategoryTheory.Limits.terminal.from`, `Rep.ind` and `ChainComplex.single₀`.
- **Review text.** It contained no instructions beyond findings.
