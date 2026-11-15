# FIX-DESIGN-StackPointsAndResidualGerbes~10

This round repairs the design `packages/StackPointsAndResidualGerbes` against the three findings of
`REV-DESIGN-StackPointsAndResidualGerbes~9`, all P3. Each finding was checked against the cached
sources, SchemeAndStackFoundations and ReductiveGroups on main, and the roadmap's own text. All
three are right. F02 and F03 are applied as the review asked. F01 is applied with one correction
to the suggested repair, explained below. Each repair was also made wherever the same pattern
appeared elsewhere in the roadmap; those places are listed under each finding.

Files changed: `design/README.md`, `design/plan.json` and `sources.toml` (one `cited_for` clause).
No source was fetched, since every text needed was already in the cache, and
`needs-references.toml` was not written. A design has no `Suggested.lean`, so nothing was
elaborated and there was no `#check` comparison.

## F01 (P3) — applied

Verified: the last API bullet of 0.1 ("open substacks have `P`") uses 0.3. 0.3 needs only 0.2, so
it is the only edge in Layer 0 that points forward. The bullet's only user by citation is step 2
of 5.2.

Old → new: the bullet moves from 0.1's API to the end of 0.3's "Prove" list. It now reads: an open
substack of a stack with a smooth-local `P` (0.1) has `P`, because an open immersion is smooth
(stacks-06RD lines 3551–3556, Lemma 101.35.4). Further changes:
- 0.3's *Needs* gains "0.1 (the open-substack bullet)".
- 0.3's gap:stack-morphism-permanence clause gains "agreement of smoothness with
  `RepresentableProperty`".
- 0.1's *Needs* drops "0.3".
- In the plan, `target:0.3` leaves the prerequisites of 0.1, `target:0.1` joins those of 0.3, and
  the API entry moves (now `openSubstack_hasSmoothLocalProperty`).

Correction to the suggested repair: gap:stack-morphism-permanence must stay in 0.1. Its second API
bullet (`P` passes along smooth `𝒴 → 𝒳` and descends along smooth surjective ones) composes an
atlas `V → 𝒴` with `𝒴 → 𝒳`. That needs composition of smooth, and of smooth surjective, morphisms
of stacks (Lemmas 101.33.2 and following), which §1.20 does not provide. The gap's parenthetical in
0.1 now says exactly this.

Same pattern elsewhere:
- 5.2 step 2: "(0.1's API, open substacks)" → "(0.3's API, open substacks)".
- 5.4 used the moved fact without citing it: "`U` is … reduced (0.1's API, …)" needs `𝒰` reduced
  as an open substack of `𝒳'`. That step is now explicit and cites 0.3's API, with the descent along
  `π` still cited to 0.1's API.
- 2.6 and 4.4 cite 0.3 for open substacks already, so no change was needed there.

New 0.3 Check (README and plan): open substacks inherit `P` but closed ones need not. `Spec k ⊆
[𝔸¹/𝔾_m]` is regular. `[Spec k[t]/(t²)/𝔾_m]` is a closed substack of the regular `[𝔸¹/𝔾_m]`, and it
is neither reduced nor regular.

In-layer order after the change: 0.1 needs none, 0.2 none, 0.3 needs 0.1 and 0.2, 0.4 needs 0.3,
and 0.5 needs 0.1 and 0.3. "Layers 0–3 are linear" still holds.

## F02 (P3) — applied

Verified: ahr2020 line 476 assumes affine stabilisers for the stack, and line 485 takes only "a
smooth group scheme". The proof of 7.4 uses three things: `V → [V/G]` is a smooth atlas, §1.21's
`actionQuotient` and `quotientStack_algebraic` (for a flat, locally finitely presented
groupoid), and 7.3's chart computation. Affineness enters only through `G_x ⊆ GLₙ` in 7.3, and
Layer 7's standing hypothesis "`G_x` affine" covers that.

Old → new: "smooth affine group scheme `G` … `x ∈ V(k)` whose orbit … is closed" → "smooth group
scheme `G` … `x ∈ V(k)` with affine stabiliser `Stab_G(x)` (the standing hypothesis of this layer)
whose orbit … is closed", with a locator note on line 476 and one sentence on where affineness
enters. The plan's statement, hypotheses and locator are changed to match.

New Check (README and plan): `G = E × 𝔾_m` acting on `E × 𝔸¹`, which is the review's instance. It
also records that `E` acting trivially on `Spec k` (`G_x = E`) is excluded by the stabiliser
hypothesis.

Same pattern elsewhere:
- The ReductiveGroups contract remark (README line 453) said that, under 7.4's hypotheses, `G·x ×
  k̄` "is the orbit of Layer 3A". Layer 3A assumes quasi-compact `G` and `X`, and with `G` no longer
  affine that is not automatic. The remark now carries the qualifier "when `G` and `V` have
  quasi-compact underlying spaces".
- gap:homogeneous-quotient-scheme concerns `GLₙ/G_x`, where `GLₙ` is affine, and is correct as
  stated.

## F03 (P3) — applied

Verified: for `G = 1`, `BG = Spec k`, the induced map is the identity and both fibre products are
`Spec k`. So the third Check of 3.5 was false at `G = 1`.

Old → new: "For `BG → Spec k` the induced … is not an isomorphism, and the criterion fails" → "For
`G ≠ 1` and `BG → Spec k`, … fails: `Spec k ×_{BG} Spec k = G`, while `Spec k ×_{Spec k} Spec k =
Spec k`". It adds the values for `ℤ/2` (2 points against 1) and `μ_p` (length `p` against 1), and
the `G = 1` case.

Same pattern elsewhere:
- The plan's tests `BG_to_point` and `pointToBG` of 3.5 both lacked `G ≠ 1`, and both now carry
  it.
- I checked every other `BG` claim in the README (0.2, 1.3, 2.1, 3.1–3.3, 6.1, 6.2, 7.1, 7.2). Each
  either already has `G ≠ 1` or holds at `G = 1`. 6.2's "neither … nor" Check already states that
  all three products are `Spec k` for `G = 1`.

## Checks run

Dependency check, after all edits:

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2234 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The edge count is unchanged, because every new edge is inside
this roadmap or goes to a supplier it already names.

Citation resolver (`roadmaps resolve`) on the edited README:
- It lists one cross-roadmap citation as found nowhere: "VirtualFundamentalClasses §1.2", a
  consumer line naming a board package with no open pull request, as before.
- It lists no Lean name as found nowhere, and no new Lean name was introduced.

Other checks, by script:
- The *Needs* line of each of the 38 targets agrees with its plan prerequisites, in target numbers
  and gap slugs. The only difference is 7.3's "8.3", which is AlgebraicModuliForArithmeticGeometry
  §8.3 being read as a target number.
- README Checks against plan tests: 138 = 138, every target has at least three. That is 136 before
  this round plus the new Checks of 0.3 and 7.4.
- `plan.json` parses and round-trips in its own format, and `sources.toml` parses.
- No machine path or LaTeX was added.

Sources: one locator was added, stacks-06RD lines 3551–3556 (Lemma 101.35.4), read in the cache and
recorded in that entry's `cited_for`.

Ownership: this round adds no target, construction or gap, so no ownership search was needed. The
moved bullet stays inside this roadmap.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 new bullet: open substack of `𝒳` with `P` has `P` | `Spec k ⊆ [𝔸¹/𝔾_m]`; `𝔾_m ⊆ 𝔸¹`; `∅ ⊆ 𝒳`; closed `[Spec k[t]/(t²)/𝔾_m]` | atlas `𝔾_m`: reduced, regular, locally Noetherian, as `𝔸¹` is; `𝔾_m` regular; empty atlas has every `P`; closed substack has atlas `k[t]/(t²)`, not reduced | holds for open; fails for closed, so it is not stated for immersions | moved, Check added |
| 0.1 second bullet's route | `𝒴 = Spec k → B(ℤ/2) = 𝒳` (étale, surjective); `Bμ_p ← 𝔾_m` | `V = Spec k → B(ℤ/2)` is the composite of smooth surjective maps, so `B(ℤ/2)` is regular because `Spec k` is; `𝔾_m → Bμ_p` composite smooth surjective, regular | holds; uses composition of smooth (surjective) stack morphisms | gap kept, parenthetical rescoped |
| 5.4 "`U` reduced" | `𝒳' = [𝔸¹/𝔾_m]`, `ξ` generic, `𝒰 = Spec k`, `U = Spec k`; `𝒳' = Bμ_p`, `U = Spec 𝔽_p` | `𝒰` reduced (0.3), `U` reduced by descent along `π = id`; `π : Bμ_p → Spec 𝔽_p` smooth surjective (2.3), `U` reduced | holds; both inputs now cited | wording |
| 7.4 restated | `E × 𝔾_m` on `E × 𝔸¹` at `(0_E, 0)`; `GLₙ` on `𝔸ⁿ` at `0`; `𝔾_m` on `𝔸¹` at `1`; `E` trivially on `Spec k`; constant `ℤ` by translation on `𝔸¹_ℚ` at `0` | `Stab = 𝔾_m`, orbit `E × 0` closed, `[V/G] = [𝔸¹/𝔾_m]`, `𝒵 = B𝔾_m`, `N = k·∂_t` weight 1 = 7.2's `N_0`; `N_0 = kⁿ`; orbit `𝔾_m` not closed; `Stab = E` not affine, excluded; orbit `ℤ ⊂ 𝔸¹` not closed, excluded | holds on admitted instances; both hypotheses needed | statement generalised, Check added |
| 7.4 weight of `N` on `E × 𝔾_m` | scaling `λ·t = λt` | on functions `t` has weight `−1` (7.2: `ℐ/ℐ² = k·t` weight `−1`), so `∂_t` has weight `+1` | agrees with Convention 5 and 7.2 | — |
| 3.5 third Check | `G = 1`, `ℤ/2`, `μ_p` (char `p`) | `Spec k` vs `Spec k`, iso; `ℤ/2` (2 pts) vs `Spec k` (1 pt); length `p` vs length 1 | `G = 1` now excluded and recorded | `G ≠ 1` added (README, plan) |
| 3.5 first Check (`Spec k → BG`) | `G = 1` | identity; already guarded by `G ≠ 1` in README, plan now too | holds | plan test reworded |
| ReductiveGroups contract remark | `G = ℤ` constant (not quasi-compact) | outside Layer 3A's finiteness, so the identification is not claimed | qualified | wording |

## For the maintainer

- No name that another roadmap cites changed, and no target, gap slug or section number was added,
  removed or renumbered. One plan API entry was renamed as it moved from 0.1 to 0.3 (`open` →
  `openSubstack_hasSmoothLocalProperty`). It is plan-internal, not a Lean name, and no other
  roadmap cites it.
- MotivicStructuresInModuliOfCurves consumes 7.4. Its statement is now more general (`G` need not
  be affine), so every former use still applies.
- The four human questions of the review (the `alper-moduli` and `sga3-vi-a` licences,
  VirtualFundamentalClasses' own closed-substack text, and FunctionFieldArithmeticPartII's gap
  address) are left as they are.
- No untrusted text contained instructions.
