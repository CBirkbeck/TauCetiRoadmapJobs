# FIX-DESIGN-FinitenessAndDualityOfGroups~10

Review settled: `REV-DESIGN-FinitenessAndDualityOfGroups~9` (two findings, both P3). Both were
verified and repaired. Files changed: `packages/FinitenessAndDualityOfGroups/design/README.md`,
`packages/FinitenessAndDualityOfGroups/design/plan.json`, `packages/FinitenessAndDualityOfGroups/sources.toml`.

## F01 (P3) — applied

Verified. Brown1974 line 427–428 assumes characteristic zero, and in characteristic `p` the trace
form of the 8.5 identity is degenerate. On the reviewer's witness (`K = 𝔽₂`, `G = F₂`, index 2) the
trace identity reads `0 = 0`, while the class identity says `−2 = −2`.

Old → new (README 8.5 and plan target 8.5): "virtual character of `G/Γ'` … times the regular
character (… Theorem 7 gives every field)" → in `G₀(K[G/Γ'])`, `Σ(−1)ⁱ[Hⁱ(Γ', V)] = χ(G)·dim_K V·[K[G/Γ']]`.
Its characteristic-zero reading is the character form, and Theorem 7 gives freeness over every
field. Two Checks were added: `F₂` index 2 over `ℚ` (`H¹ ≅ 2·𝟙 ⊕ sgn`) and over `𝔽₂`.

I changed the reviewer's wording in three ways:
- **Carrier.** The Grothendieck group is the pinned `TauCeti.AbelianK0 (FDRep K Δ)`. That file's
  own docstring identifies it with `G₀(k[Δ])` in every characteristic.
- **Route.** It now names the Euler–Poincaré relation
  `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`
  (`TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean` line 370). It also names the
  converse to the character form through `FDRep.nonempty_iso_of_character_eq`.
- **Supporting text.**
  - *Needs:* gains 4.4, which gives torsion-freeness and so `χ(G) ∈ ℤ`, and CohomologyOfGroups §1.2,
    the source of the `G/Γ'`-action.
  - The supplier contracts and the Scope list gain the `AbelianK0` bullet, with the abelian and
    essentially-small instances of `FDRep` at the pins.
  - The Layer 8 Dependencies line was updated.
  - The Brown1974 manifest locator now lists §4 Theorem 4.

Same pattern searched elsewhere: no other character identity is stated over an arbitrary field. 7.3
is rational; 7.4 and 7.5 are stated as freeness or isomorphism, valid over every field. 8.6 uses
only the dimension form of 8.5, which is unchanged.

## F02 (P3) — applied

Verified:
- MappingClassGroupsAndCanonicalRepresentations, at its open head, contains no "cohomological
  dimension", "vcd", "virtual" or "duality group". Its one "Euler characteristic" is that of a
  surface cover.
- "The arithmetic roadmaps" named no roadmap.

Old → new:
- **Downstream consumers.** The bullet now names only ArithmeticKTheory §3.2 (4.1, Layer 6),
  BianchiModularForms §9.3 (8.4) and FuchsianOrbifolds Layer 5 item 6 (8.4(c), 8.7), stating their
  instances "independently of this roadmap".
- **4.4 Examples.** "owned by the arithmetic roadmaps" → "the Borel–Serre instance for `Aut(P)`,
  with a finite classifying complex at neat level, is ArithmeticKTheory §3.2".

I changed the reviewer's wording in one way. All three roadmaps come before this one in the merge
order (FuchsianOrbifolds is on main; ArithmeticKTheory and BianchiModularForms are open and earlier).
So the bullet says they state the instances independently, rather than "can compare them", which
would make them cite a later roadmap.

Each citation was re-read at its source:
- ArithmeticKTheory §3.2: the duality statement with `d = r₁m(m+1)/2 + r₂m² − m`, and the finite
  classifying model at neat level.
- BianchiModularForms §9.3: the line `χ(Γ₀(𝔫, 𝔞)) = 0`.
- FuchsianOrbifolds Layer 5 item 6: `χ_orb(Γ′) = d χ_orb(Γ)`, and its Check `χ_orb(PSL(2,ℤ)) = −1/6`.
- MotivicStructuresInModuliOfCurves §2.1, the unchanged first bullet: its board package README,
  "The virtual cohomological dimension".

Same pattern searched elsewhere: the Scope list of instances owned elsewhere (ArithmeticKTheory
§3.2, FuchsianOrbifolds Layer 5 item 6, BianchiModularForms §9.3) agrees with these texts. The 8.7
Check citing FuchsianOrbifolds `−1/6` is correct. plan.json `consumers` carries neither the removed
names nor these three, which are not consumers.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed (each side) | Result / change |
|---|---|---|---|
| 8.5 class form | `Γ' = G` | `G₀(K) ≅ ℤ` by dimension: gives Corollary 1, `Σ(−1)ⁱ dim Hⁱ = χ·dim V` | holds |
| 8.5 | `G = Γ' = 1`, any `V` | `[V] = dim V·[K]` | holds |
| 8.5 | `V = 0` | `0 = 0` | holds |
| 8.5 | `G = ℤ`, `Γ' = 2ℤ`, `V = K_λ`, `λ = −1`, char ≠ 2 | `H⁰ = H¹ = sgn`: `[sgn] − [sgn] = 0 = χ(ℤ)·[K[ℤ/2]]` | holds |
| 8.5 | `G = ℤ`, `Γ' = nℤ`, trivial `V = K` | `[K] − [K] = 0 = 0·[K[ℤ/n]]` | holds |
| 8.5 | `F₂`, `Γ' = ker(a↦1, b↦0)` (free on `b, aba⁻¹, a²`), `V = ℚ` | `a` swaps the duals of `b` and `aba⁻¹` and fixes that of `a²`: `H¹ = 2·𝟙 + sgn`; `𝟙 − (2·𝟙 + sgn) = −𝟙 − sgn = −1·[ℚ[ℤ/2]]` | holds; Check added (excludes `−2·𝟙`) |
| 8.5 | same, `V = 𝔽₂` | length `1 − 3 = −2 = −1·2`; regular trace `(0, 0)` in `𝔽₂`; alternating trace at `1`: `−2 = 0`; at `a`: `1 − 1 = 0` | class form holds; trace form vacuous; Check added |
| 8.5 | `G = ℤ/2`, `V = ℚ` (not `FP`) | `1` against `1/2` | hypothesis needed (existing Check) |
| 8.5 integrality | `G` of type `FP` | torsion-free (4.4), so `χ(G) = χ_ℚ(G) ∈ ℤ` (8.4(c)); `χ(G)·dim V` is an integer multiple in `G₀` | added to statement |
| ArithmeticKTheory instance `vcd Aut(P) = d` | `m = 1`, `F = ℚ`; `m = 2`, `F = ℚ`; `m = 2`, `F = ℚ(i)`; `m = 1`, `F` real quadratic | `d = 0` (`{±1}` finite); `d = 1` (`GL₂(ℤ)` virtually free); `d = 2` (that roadmap's own `vcd SL₂(ℤ[i]) = 2`); `d = 1` = unit rank | holds |
| FuchsianOrbifolds instance | `PSL(2,ℤ) = ℤ/2 ∗ ℤ/3`; `Γ(2)` image | `2 − (1/2 + 2/3) − 1 = −1/6 = 1/2 + 1/3 − 1`; `2 − 3 = −1 = 6·(−1/6)` (free of rank 2) | holds |
| Bianchi instance | torsion-free `Γ'` | `χ_ℚ(Γ') = χ(M̄) = ½χ(∂M̄) = 0` (torus cusps) | holds |

## Checks run

Dependency check, as prescribed:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

- **Citation resolver.** `roadmaps resolve` on the edited README gives the same five leads as before
  this round, and no Lean name it could not find:
  - CohomologyOfGroups §4.6 and MotivicStructuresInModuliOfCurves §2.1 are board packages; both were
    confirmed in their READMEs.
  - BieriEckmann1974 §3.3, BrownGTM87 §VIII.6 and BieriEckmann1973 §1.5 are source locators that the
    tool misreads as roadmap names.
- **Pinned declarations added.** All were opened at Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`:
  - `TauCeti.AbelianK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean` line 79)
  - `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar` (`EulerCharacteristic.lean` line 370; it sits
    in a section, not a namespace, so the name is as written)
  - `CategoryTheory.Action.essentiallySmall` (`TauCeti/CategoryTheory/Action/EssentiallySmall.lean`
    line 54)
  - Mathlib's `Abelian (Action V G)` (`Mathlib/CategoryTheory/Action/Limits.lean` line 394) and
    `Abelian (FGModuleCat k)` for noetherian `k` (`Mathlib/Algebra/Category/FGModuleCat/Abelian.lean`
    line 36)
  - `FDRep.nonempty_iso_of_character_eq`: any field of characteristic zero, finite group.
- **Not run.** `Suggested.lean` does not exist at the design stage, so no `#check` comparison or
  elaboration was run. plan.json and sources.toml parse.
- **Ownership.** `G₀` of `FDRep` with its Euler–Poincaré relation is pinned Tau Ceti, cited rather
  than restated. 8.5 stays owned here, as before. Ownership against the open pull requests was checked
  only for the roadmaps named in F02, through `roadmaps show` at their heads.

## For the maintainer

- No id of this roadmap changed; target 8.5 keeps its number and plan name.
- No supplier was added. The new inputs are pinned Tau Ceti declarations and CohomologyOfGroups §1.2,
  which was already a supplier section.
- MappingClassGroupsAndCanonicalRepresentations is no longer named anywhere in this roadmap.
- No suspicious instructions were found in the review text.
