# FIX-PKG-ModularCharactersAndBlocksPartII~3

There was one review with three findings, all P3. All three are applied. F02's route clause was worded differently from the reviewer's suggestion, for the reason given under F02.

## F01 (P3) — applied

**Verified.** Martínez states Corollary 8.12 (martinez line 2131) "in the above situation", which is Theorem 8.11 (martinez lines 2018–2019). That theorem assumes `G = C_G(P) P`. The step from the root `b` of `D C_G(D)` to `B` is in the proof of Theorem 9.8: martinez lines 2331–2336 reduce to the stabiliser, and lines 2337–2347 compare the heights.

**Changed (old → new):**
- README §8.3: "(reynolds line 531, Theorem 8; martinez line 2131)" → "(reynolds line 531, Theorem 8, for the formula; martinez line 2131, Corollary 8.12, for the block `b` of `N = D C_N(D)`, the situation of martinez line 2018, Theorem 8.11, and martinez lines 2331–2347, in the proof of Theorem 9.8, for the passage from `b` to `B` through the stabiliser `T`)".
- `reynolds_heights` docstring: now cites "Corollary 8.12 for the block of `D C_G(D)`, carried to `G` in the proof of Theorem 9.8".

I cited lines 2331–2347 rather than the reviewer's 2337, because lines 2331–2336 are the reduction to `T` that §8.3 also makes.

**Same citation elsewhere.** The README cites martinez line 2131 in one other place, §8.2, whose standing hypothesis is `G = P C_G(P)`. That citation is correct and was not changed. The References entry "Lecture 9 (lines 2161–2360)" already covers the new lines, so `sources.toml` is unchanged.

## F02 (P3) — applied

**Verified.** Base §8.2 (ModularCharactersAndBlocks at its open head) defines covering by the identity over `k`. The orbit sum of the block idempotents of `k[N]` is the sum of the `e_B` over the covering blocks. Base §1.3 adds that a central idempotent has a unique central lift. Our §7.2 listed the identity under "Prove:" without saying it is the lift to `O`. Its route works in `Z(O[N])`, but it never cited base §1.3.

**Changed (old → new):**
- The third statement of §7.2 now reads "in `Z(O[G])` the central lifts satisfy `Σ_{B covers b} e_B = Σ_{b'} e_{b'}` …, the lift to `O` of the identity over `k` by which base §8.2 defines covering".
- Its route: "…which are those of the blocks covering `b` (base §8.2)" → "its reduction is the orbit sum over `k`, which base §8.2 writes as the sum of the block idempotents of `k[G]` of the covering blocks, and a central idempotent of `k[G]` has exactly one central lift (base §1.3)".
- The §7.2 *Needs:* line gains base §1.3.

I did not copy the reviewer's sentence for the route clause. The old route identified the blocks below the `O`-orbit sum with the covering blocks by citing base §8.2 alone. That identification needs the reduction step and the uniqueness of central lifts, so the route now names both.

**Same pattern elsewhere.** The base §1.3 contract bullet listed only `existsUnique_blockIdempotent_map_residue` and surjectivity. Uniqueness of central lifts is also used in §6.1 (the change of system, `O_w[X] → O'[X]`), §6.3 (`O_w[X] → O_v[X]`) and §7.3 (the dominated blocks). The bullet now also says "the uniqueness of the central lift of a central idempotent of `k[G]` to `Z(O[G])`", which the base states in its §1.3. No other target restates a definition of the base: the only other mention of orbit sums, in §6.3, cites base §8.2.

## F03 (P3) — applied

**Verified.** The Conventions bullet "Blocks in `Suggested.lean`" defines `IsBlockDefectGroup` and `blockCharacters` but gave no witness for either. I recomputed every value the reviewer gave. They are correct.

**Changed.** The bullet now has three witnesses for `IsBlockDefectGroup` and four for `blockCharacters`, in my own wording (values in rows 4–10 of the table below):
- **`IsBlockDefectGroup`, `S₃` at `p = 2`, `e = 1 + r + r²`.** `⟨t⟩` qualifies. `1` fails only the maximality clause, which excludes a definition without that clause.
- **`IsBlockDefectGroup`, `S₃` at `p = 2`, `e = r + r²`.** The defect group is `1`. This excludes reading the support on all of `G`.
- **`IsBlockDefectGroup`, `S₄` at `p = 3`, the degree-3 character.** Its reduced idempotent has coefficients `0, 2, 1, 0, 1` on the classes. The defect group is `1`, and reading the normaliser instead of the centraliser would wrongly accept `⟨(123)⟩`.
- **`blockCharacters`.** Over `ℤ₂[ζ₃]`: `(1 + r + r²)/3` gives `{1, sgn}` and `(2 − r − r²)/3` gives `{std}`. `b = 1` gives all irreducible characters and `b = 0` gives `∅`. Over `ℤ₂`, the block `(2 − r − r²)/3` of `C₃` gives the single character `2, −1, −1`, not the two linear characters of `C₃`.

The witnesses are README prose only. Nothing was added to `Suggested.lean`.

## Adversarial pass on the changed and added text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.3 height formula with the new locator (`T = G`) | `SL(2,3)`, `p = 2`, `D = Q₈` | `C_G(Q₈) = {±1} ≤ Q₈`, so `N = Q₈` and `b` is the one block of `Q₈`, degrees `1,1,1,1,2`, heights in `N` `{0, 1}`. `|T : N| = 3`. Degrees in `G` are `1,1,1,2,2,2,3` with `a − d = 3 − 3 = 0`, heights `{0, 1}` | Corollary 8.12 applies to `N`, the passage carries the set to `G` | locator only |
| §8.3 with `T < G` (the case lines 2331–2336 handle) | `G = (C₃ × C₇) ⋊ C₂`, `C₂` inverting both factors, `p = 3`, `D = C₃` | `N = C_G(C₃) = C₃ × C₇`; blocks `b_μ`, `μ ∈ Irr(C₇)`; for `μ ≠ 1`, `T = N`, `|G : T| = 2`. `Irr(B)` is the three `Ind(λ × μ)`, of degree `2`. `a − d = 0`, heights `{ν₃(2)} = {0} = {ν₃(ξ(1)) : ξ ∈ Irr(C₃)}` | formula holds through `T` | none |
| §7.2 third statement, over `O` | `S₃`, `N = C₃`, `p = 2`, `O = ℤ₂[ζ₃]`; `p = 3`; `N = 1`; `N = G`; `S₄ ⊵ A₄`, `p = 2` | `e_λ + e_λ̄ = (2 + (ω+ω²)(r + r²))/3 = (2 − r − r²)/3 = e_std`, since `e_std = (2/6)(2 − r − r²)`. `e_{1_N} = (1+r+r²)/3 = (1/6)(2+2r+2r²) = e_{1_G} + e_sgn`. At `p = 3` one block each side, both sums `1`. `N = 1`: `1 = Σ_B e_B`. `N = G`: `{b} = {B}`. `A₄`, `S₄` at `p = 2`: one block each, both sums `1` | true; over `k` the reductions `r + r²` and `1 + r + r²` are the base's definition | restated as the `O`-lift, base §1.3 cited |
| §1.3 contract addition | base §1.3 text | the base says "a central idempotent has a unique central lift" (base README §1.3). Instance: `ℤ₂`, `G = C₃`, the lifts `(1+r+r²)/3`, `(2−r−r²)/3` of `1+r+r²`, `r+r²` (base §1.3 Check) | matches the supplier | contract line extended |
| `IsBlockDefectGroup`, `S₃`, `p = 2`, `e = 1 + r + r²` | `P = ⟨t⟩`, `P = 1` | `C_G(⟨t⟩) = {1, t}`, coefficient at `1` is `1 ≠ 0`, no 2-subgroup strictly above `⟨t⟩` (order 2 is Sylow): qualifies. `P = 1`: clauses 1–2 hold (`C_G(1) = G`), maximality fails at `Q = ⟨t⟩` | defect groups `⟨t⟩`, as base §6.2 | witness added |
| same, `e = r + r²` | `P = ⟨t⟩`, `P = 1` | `−1/3 ≡ 1 (mod 2)`, `2/3 ≡ 0`, so `(2 − r − r²)/3 ↦ r + r²`. Coefficients at `1`, `t` are `0, 0`: `⟨t⟩` fails. `P = 1`: coefficient `1` at `r ∈ G`; every `Q = ⟨t'⟩` has `C_G(Q) = {1, t'}` with zero coefficients, so `1` is maximal. With the support read on all of `G`, `⟨t⟩` would pass | defect group `1`, matching the Conventions witness `Br_D(r + r²) = 0` | witness added |
| same, `S₄`, `p = 3`, `χ = 3, 1, −1, 0, −1` | `P = ⟨(123)⟩`, `P = 1`; normaliser variant | `e_χ = (3/24) Σ χ(g) g`, coefficients `3/8, 1/8, −1/8, 0, −1/8`. `8 ≡ 2`, `2⁻¹ ≡ 2 (mod 3)`: `0, 2, 1, 0, 1`. `|C(123)| = 24/8 = 3`, entries `0` there. `N(⟨(123)⟩) = S₃` contains three transpositions with coefficient `2 ≠ 0` | defect group `1`, matching defect zero (`|S₄|_3 = 3 = χ(1)`). The normaliser model fails | witness added |
| control on the same element | `ω_χ` on class sums | `6·1/3 = 2`, `3·(−1)/3 = −1`, `6·(−1)/3 = −2`, `8·0/3 = 0`; `2·2 + 1·(−1) + 1·(−2) = 1` | `λ_B(e) = 1`, as for a block idempotent | none |
| `blockCharacters`, `S₃` over `ℤ₂[ζ₃]` | `b = (1+r+r²)/3`, `(2−r−r²)/3`, `1`, `0` | `exp(S₃) = 6`, `−ζ₃²` has order 6. On `1`, `sgn`: `(1+1+1)/3 = 1`. On `std`, `r` has eigenvalues `ζ₃, ζ₃²`: `1 + ζ₃ + ζ₃² = 0`, and `(2 − ζ₃ − ζ₃²)/3 = 3/3 = 1`. `b = 0`: `ρ(0) = 0 ≠ 1` on a nonzero space, and `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (Mathlib `RepresentationTheory/Irreducible.lean` line 29), so the space is nonzero | `{1, sgn}`, `{std}`, all, `∅` | witness added |
| `blockCharacters`, `C₃` over `ℤ₂` | `b = (2 − r − r²)/3` | `3` is a unit in `ℤ₂`. `X² + X + 1` has no root in `𝔽₂` (`1, 1`), so it is irreducible over `ℚ₂`. Irreducible `ℚ₂`-representations are the trivial one (`b ↦ 0`) and `ℚ₂(ζ₃)` (`b ↦ 1`), character `2, −1, −1`. The complex model gives `λ, λ̄` | one character of degree 2 | witness added |
| agreement with other Checks | §6.1 Check, base §1.3 Check, Conventions Brauer-correspondent witness | `e_std ≡ r + r²` (§6.1). Lifts `(1+r+r²)/3`, `(2−r−r²)/3` (base §1.3). `Br_{⟨t⟩}(1+r+r²) = 1`, `Br_{⟨t⟩}(r+r²) = 0` (Conventions) | consistent | none |

No theorem statement, binder or definition body changed. `Suggested.lean` changed only in one docstring.

## Checks

- **Elaboration.** Ran `lake env lean` on `packages/ModularCharactersAndBlocksPartII/Suggested.lean` from the content checkout: exit 0, 16 warnings, all "declaration uses `sorry`", no errors. No `TauCeti.*` build was needed.
- **Signatures.** I put a `#check @<name>` for each of the 20 declarations in one scratch copy of the file and elaborated it once: exit 0. After normalising namespace prefixes and line breaks, all 20 elaborated types are identical to those recorded in `scratch/signatures.md`. No binder was lost, and no README statement needs to change.
- **Dependency check** (`gate --depcheck … --movable`), output:

      depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`) after the edits: no cross-roadmap citation and no Lean name found nowhere. The worker's four leads (`IsGlaubermanFamily.adjoin_range_eq`, `.exists_sign_of_isCyclic`, `.index_mul_degree_eq`, `.restrict_pairing_ne_zero`) are this roadmap's own declarations, confirmed by the `#check` pass.
- **Gate failures listed in the brief:** none.

## For the maintainer

- **Names and ids.** No Lean name, target, layer or section id changed.
- **Other files.** `design/plan.json` is unchanged, with no new supplier gap: base §1.3 already states the uniqueness of central lifts. `sources.toml` and `metadata.toml` are unchanged.
- **Ownership.** No new construction was added. Covering stays with ModularCharactersAndBlocks §8.2, which this roadmap cites. The §7.2 statement is now marked as its lift to `O`.
- **Human notes.** The review's "For the human reviewers" notes (the licence of martinez and sambale; LocalFiniteGroupTheory L3) were not acted on, as the brief directs.
- **Source misprints.** The review notes two misprints in martinez (line 725, line 2337). They affect no statement here, and the new citation of lines 2331–2347 reads them as corrected.
