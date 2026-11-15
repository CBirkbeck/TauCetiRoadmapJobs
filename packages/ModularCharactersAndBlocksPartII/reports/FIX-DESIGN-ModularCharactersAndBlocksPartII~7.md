# FIX-DESIGN-ModularCharactersAndBlocksPartII~7

One review, `REV-DESIGN-ModularCharactersAndBlocksPartII~6`, one finding. Files changed:
`packages/ModularCharactersAndBlocksPartII/design/README.md` and
`packages/ModularCharactersAndBlocksPartII/design/plan.json`. `sources.toml` is unchanged: no new
work is cited.

## F01 (P2) — applied

The finding is right. The targets of Layers 6–8 are stated for a finite group `G` at the system of
base §1.1 built from `ℚ(ζ_{exp G})`. They are then used for subgroups and quotients `H` of `G`
(`N_G(D)` in §§6.4 and 9.2, `T` and `N` in §7.4, `D C_G(D)` in §8.3, `G/P` in §8.2) at the system
of `G`, which is a different system: `𝔽₄` against `𝔽₂` for `C₂ ≤ S₃`, `𝔽₁₆` against `𝔽₄` for
`A₄ ≤ A₅`. No target connected the two levels. I applied the primary repair, keeping every
statement at `e = exp(G)`:

- §6.3 gains a new API bullet, *change of level*. Old: none. New: for `H` finite, `e` a multiple of
  `exp(H)`, `v` a place of `ℚ(ζ_e)` over `p` and `w` the place of `ℚ(ζ_{exp H})` below it, scalar
  extension along `k_w ⊆ k_v` gives a bijection on the blocks of every subquotient `X` of `H`. It
  preserves `a_B`, `λ_B`, defect classes, `Br_P`, defect groups, block induction, covering, `Irr`,
  `IBr` and decomposition numbers, hence heights, `Irr₀` and Brauer correspondents.
- New Checks: three in §6.3. Two are the finding's witnesses (`C₂ ≤ S₃`; `Q₈ ≤ SL(2,3)` and
  `A₄ ≤ A₅`). The third is a negative control: `C₃` against the level `ℚ`, where `𝔽₂` does not
  split `C₃`, so the block `r + r²` breaks into two blocks over `𝔽₄`.
- Conventions, Blocks: one sentence (subquotient statements are read at the system of `G`, via §6.3)
  with the `S₃`/`C₂` witness.
- *Needs:* §6.3 added to §§7.1, 7.2, 7.3 (last bullet), 7.5 and 7.6. §§6.4, 7.4, 8.3 and 9.2
  already had §6.3 and are now annotated with what they use it for.
- New bullets: in §7.3, domination commutes with the change of level; in §7.5, regularity does too.
- §8.3: "§8.2 applies to `b`" is now read at the system of `G` through §6.3.
- Scope (Layer 6 bullet), Layer 6 Dependencies and the base supplier contracts for §2.3 (radical
  base change), §2.4 (change of splitting modular system) and §6.2 (scalar extension of blocks)
  now name these inputs.
- plan.json: in 6.3, a new API entry `blocks_changeOfLevel`, three new tests and the base
  prerequisites §§1.3, 2.1, 2.3, 2.4, 4.1, 6.1, 7.1, 8.2. `target:6.3` added to the prerequisites
  of 7.1, 7.2, 7.3, 7.5, 7.6. A new hypothesis item ("blocks of subgroups, normalisers,
  stabilisers and quotients of G are taken over the same k … change of level (6.3)") on 6.4,
  7.1–7.6 and 8.3. In 7.3, a new API entry `dominates_changeOfLevel`. In 9.2, the statement now
  says that `b'` and `Irr₀(b')` are read at the system of `G`. In the supplier `what` for the base,
  the three new inputs.

Why it holds: everything the comparison needs is already in the base, as checked at the base's
open head.

- **Splitting.** `k_w` contains a primitive root of unity of order `exp(H)'`, so it splits every
  subquotient of `H` (base §2.3).
- **Blocks over a larger field.** Base §6.2 states the scalar extension for fields `k ⊆ k'` with
  `k` splitting the group. It covers blocks, `λ`, defect classes, `Br_P`, defect groups and the
  principal block.
- **Ordinary characters.** Central lifts are unique (base §1.3) and the `e_χ` have coefficients in
  `ℚ(ζ_{exp H})`, so `Irr(B)` is the same at both levels. The congruence criterion
  `exists_blockIdempotent_iff_centralCharacter_congr` (base §4.2) gives the same result, because
  `m_v ∩ O_w = m_w`.
- **Brauer characters.** Base §2.3 supplies the radical base change and base §2.4 the change of
  splitting modular system, so `IBr(B)` and the decomposition numbers are the same.
- **Induction and covering.** Block induction (base §7.1) is defined through central characters
  and covering (base §8.2) through orbit sums of idempotents; both are linear in the coefficients,
  so both commute with scalar extension.

Ownership: no roadmap on main or in an open pull request states a change of cyclotomic level for
blocks. A search for "change of level" finds only modular-curve and Shimura-variety usages. The
base owns the inputs (§§2.3, 2.4, 6.2), and this roadmap owns the assembly, because it owns
heights and `Irr₀`.

## Checks run

Dependency check (on the edited README):

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. `roadmaps resolve` on the README reports no cross-roadmap
citation and no Lean name that is found nowhere. plan.json parses.

`Suggested.lean`: the package is at the design stage and has none. No Lean command was run, and
no `#check @name` comparison was possible. No new backticked Lean name of this roadmap's own was
added to the README; the two new plan API names are plan-only, like the existing
`height_changeOfPlace`.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Change of level: `K_w ⊆ K_v`, `m_v ∩ O_w = m_w` | `e = exp(H)`; `H = 1`, `p = 5`; `C₂`, `e = 6`, `p = 3` | `w = v`, identity; `ℚ₅ ⊆ ℚ₅`, `𝔽₅`; `ℚ₃ ⊆ ℚ₃(ζ₃)` ramified, `k_w = k_v = 𝔽₃` | holds |
| Blocks biject (`k_w` splits `X`) | `C₂ ≤ S₃`, `p = 2`; `C₂`, `p = 3`; `C₃` at level `ℚ`, `p = 2` | one block `1` on both sides (`𝔽₂ ⊆ 𝔽₄`); `(1 ± t)/2` on both sides (`𝔽₃`); `r + r² = e_α + e_{α²}` because `α² + α = 1`, so the map is not a bijection | holds when `exp(X)` divides the lower level; the third case is the negative-control Check |
| `Irr(1 ⊗ B) = Irr(B)` | `C₂`, `p = 2`; `S₃`, `p = 2`, `N_G(⟨t⟩) = C₂` | `ω_1({t}⁺) − ω_sgn({t}⁺) = 2 ∈ 2ℤ₂ ⊆ m_v`; `{1, sgn}` at `𝔽₂` and at `𝔽₄` | holds |
| Heights and `Irr₀` preserved | `Q₈`, exponents `4` and `12`; `A₄`, exponents `6` and `30` | `ℚ₂(i)`/`𝔽₂` against `ℚ₂(ζ₁₂)`/`𝔽₄`, heights `0,0,0,0,1` on both sides; `2` has order `2` mod `3` and `4` mod `15`, so `𝔽₄ ⊆ 𝔽₁₆`, heights `0,0,0,0` | holds |
| Block induction and covering commute | `S₃`, `N = C₃`, `p = 2`, `𝔽₄` | orbit sums `1 + r + r²` and `e_α + e_{α²} = r + r²` are unchanged by `k → k'`; `λ_b(z_H)` is linear in `z` | holds |
| Brauer correspondent: `1 ⊗ b'` | `S₃`, `p = 2`, `D = ⟨t⟩` | `Br_D(1 + r + r²) = 1` over `𝔽₂` and over `𝔽₄` | holds |
| §7.3 domination commutes (new bullet) | `S₃`, `N = C₃`, `p = 2` and `p = 3` | `π(1 + r + r²) = 1`, `π(r + r²) = 0`; `π(1) = e₊ + e₋`; the same over any extension of `𝔽₂` or `𝔽₃` | holds |
| §7.5 regularity preserved (extended bullet) | `S₃`, `N = C₃`, `p = 2` | `λ_{B₀}(𝒞⁺_t) = 1`, `λ_{def 0}(𝒞⁺_t) = 0`, values in `𝔽₂` kept in `𝔽₄` | holds |
| Conventions sentence | `C₂ ≤ S₃`, `p = 2` | own system of `C₂` is `(ℚ₂, ℤ₂, 𝔽₂)`; ambient residue field is `𝔽₄` (`2` inert in `ℚ(ζ₃)`) | holds |
| §6.4 last Check (annotated) | `S₃`, `p = 2` | `|Irr₀(B₀)| = 2`; `|Irr₀(b')| = 2` over `𝔽₄` through §6.3 | holds |
| §9.2 Checks | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `2 = 2`; `4 = 4` (`A₄` over `𝔽₁₆`, the same as over `𝔽₄`); `3 = 3`, with `N_G(C₃) = C₆` at level `6` (`k_w = 𝔽₃`) against level `12` (`k_v = 𝔽₉`) | holds; see the note below |

Recomputation note for the last row: at `p = 3`, `ℚ(ζ₁₂) = ℚ(i, ζ₃)` has `e = 2` (from `ζ₃`) and
`f = 2` (`3` is inert in `ℚ(i)`), so `k_v = 𝔽₉`. `C₆ = C₂ × C₃` at its own level `ℚ(ζ₆) = ℚ(ζ₃)`
has `k_w = 𝔽₃`, which splits `C₆` at `p = 3`. Over each field there are two blocks, one for each
character of `C₂`, each holding three characters of defect group `C₃` with heights `0`. So
`|Irr₀(b')| = 3` at both levels, which is the Check's value.

## Maintainer notes

- No name that another roadmap cites changed, and no id was dropped or renumbered.
- The repair relies on base §6.2 (scalar extension of blocks along an extension of a splitting
  field of characteristic `p`), base §2.3 (radical base change) and base §2.4 (compatibility of
  the decomposition map with a change of splitting modular system), all read at the head of the
  base's open pull request. If the base revises those statements, §6.3's change of level must
  follow.
- Ownership against open pull requests was checked through `roadmaps grep` (all open heads and
  main), searching for the comparison by object; there is no other owner.
- No source text was copied, and no new source was needed.
