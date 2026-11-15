# FIX-DESIGN-VirtualFundamentalClassPartII~16

Findings of REV-DESIGN-VirtualFundamentalClassPartII~15: two, both P3. Both are right and both are applied.
The second finding's pattern occurs in two more places, which are repaired too.

## F01 (P3) — applied

Changed: 8.4 "a smooth connected curve … smooth of dimension one" → "a regular connected curve … a
connected regular `k`-scheme of finite type and of dimension one (over a perfect `k`, the same as a smooth
one), hence integral". The route now says where regularity enters. The witness is added as a Check.
The plan's 8.4 `statement`, first `hypotheses` entry and `tests` match.

**Verification.** The finding is right. I went through each step of 8.4's route with `B` regular and
not smooth:

- **The immersion.** At a closed point `b` of a regular one-dimensional scheme the local ring is a
  discrete valuation ring. So `i_b` is a regular immersion of codimension one. Its base change `η_b`
  along the flat projection `𝔐 × B → B` is one too.
- **8.2's dimensions.** `𝔐 × B → 𝔐` is flat. Its fibres `B_K` are of pure dimension one, since every
  generic point of `B_K` lies over the generic point of `B`. So `𝔐 × B` is of pure dimension `m + 1`, and
  `𝔐_{κ(b)}` is of pure dimension `m`. This used smoothness of `B` before; the route now says it.
- **The class on `B`.** A connected regular Noetherian scheme is normal, hence integral. So
  `A_1(B)_ℚ = ℚ·[B]`.
- **The rest.** 4.1, 4.2 (flat base change, `i_b^![B] = [{b}]` for equidimensional `B`) and 5.4 ask nothing
  of `B` beyond Convention 1, which assumes no perfectness.

li-tian1998 Theorem 4.2 (line 1472) assumes an irreducible smooth curve. The locator now says "there over
an irreducible smooth curve". The README's statement is more general and is proved by the route.

**The Check, computed.** Take `p` odd, `k = 𝔽_p(a)`, `B = Spec k[x, y]/(y² − x^p + a)`.

- `x^p − a` is irreducible over `k` and not a square, so `B` is integral.
- At `b₀ = (y, x^p − a)` we have `κ(b₀) = k(a^{1/p})`, of degree `p`, and `m_{b₀} = (y, y²) = (y)`: regular.
- `∂_x = p·x^{p−1} = 0` and `∂_y = 2y` vanish at `b₀`, so `B` is not smooth there. `y ≠ 0` at every other
  closed point, so `B` is smooth there.
- With `𝔐 = Spec k`, `X = B` and `E = 0`: `[X]^vir = [B]`, `n = 1`, `i_{b₀}^![B] = [b₀]`, and the count is
  `1` everywhere. The `k`-degree at `b₀` is `p`.
- The node of `Spec k[x, y]/(xy)`: `m/m²` has dimension `2`, so the point is not a regular immersion of
  codimension one. The Check records this as the step regularity is needed for. It is not a
  counterexample to the statement.

**Same pattern.** "Smooth" hypotheses on bases elsewhere were searched for. 9.2's and 9.4's Checks use
"a single smooth curve" as an example, not as a hypothesis. 8.1–8.3 already state bases of pure
dimension. There is no other instance.

## F02 (P3) — applied

Changed: 5.2 API "For a morphism of algebraic spaces `M′ → M`" → "For a morphism `M′ → M` of
quasi-separated algebraic spaces of finite type over `k`". The bullet now says why `ℳ ×_M M′` is a stack
of Convention 1. A base-change Check is added: `M′ = {0}`, and `⊔_ℕ Spec k` as the excluded case. The
plan's `moduliSpace.baseChange` and a new test match.

**Verification.** The finding is right. vistoli1989 Lemma 2.2 (lines 561–562) is stated for schemes in
its Noetherian setting (line 539). The bare "algebraic spaces" admitted `M′ = ⊔_ℕ Spec k`, where
`ℳ ×_M M′ = ⊔_ℕ BG` is not quasi-compact.

**Proof for the repaired class.** Write `ℳ′ := ℳ ×_M M′`.

- **Diagonal.** `Δ_{ℳ′}` is a base change of `Δ_{ℳ/M}` followed by a base change of `Δ_{M′}`.
  - `Δ_{ℳ/M}` is representable by schemes, quasi-compact, separated and unramified, because `Δ_ℳ` is and
    `ℳ ×_M ℳ → ℳ × ℳ` is a monomorphism.
  - `Δ_{M′}` is representable by schemes and quasi-compact (`M′` quasi-separated), and separated and
    unramified (a monomorphism locally of finite type).
- **Finite type.** `ℳ′ → M′` is proper, so `ℳ′` is of finite type over `k`.
- **Geometric points.** `M(Ω)` is a set, so iso classes of `ℳ′(Ω)` are `(ℳ(Ω)/≅) ×_{M(Ω)} M′(Ω)`. This is
  in bijection with `M′(Ω)`.

**The Check, computed.** For `[𝔸¹/μ₂] → 𝔸¹` and `M′ = {0}`, the fibre product is
`[Spec k[x]/(x²)/μ₂]`. Its cycle is `2·[Bμ₂]`, which pushes forward to `2·(1/2)·[Spec k] = [Spec k]`.

**Same pattern** (a base-change clause that leaves the class of the new object unstated). There are two
more instances, both repaired:

- 4.2 API: "For a flat morphism `𝒢_1 → 𝒢`" → "… of algebraic stacks locally of finite type over `k`".
  The flat-base-change bullet of 3.5 already says this, and 4.2's `f_1^!` is defined only in that class.
  The plan's `stackGysin.flatBaseChange` and `refinedGysin.flatBaseChange` now say the same.
- The supplier contract for `gap:normal-cones-of-local-immersions`: "for a morphism `Y′ → Y`" → "… of
  algebraic stacks locally of finite type over `k`". This is the class in which the gap's cone is
  defined; vistoli1989 line 529 states it for "stacks" in its sense. The plan's gap `detail` matches.
  The gap's slug, supplier, section and `needs` are unchanged.

8.1's "smooth base change `Y_1 → Y`" needed no change. A smooth morphism is locally of finite
presentation, and Convention 1 makes every algebraic stack quasi-separated. 3.5's `q : Y′ → Y` already
says "of such algebraic spaces".

## Checks run

- **Dependency check** (output verbatim):

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 237 roadmaps, 2240 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- **Citation resolver** on `packages/VirtualFundamentalClassPartII/design/README.md`: no cross-roadmap
  citation and no Lean name found nowhere.
- **`plan.json`** parses. Its formatting is unchanged, and the diff touches only the entries named above.
- **`Suggested.lean`:** none at the design stage. No `#check` elaboration applies, and none was run.
- **Gate failures:** none were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.4, `B` regular | `y² = x^p − a` over `𝔽_p(a)`, `X = B`, `E = 0` | `m_{b₀} = (y)`; `[κ(b₀) : k] = p`; `∂_x = 0`, `∂_y(b₀) = 0`; count `1` at `b₀` and elsewhere; `k`-degree `p` at `b₀` | holds; not smooth at `b₀` | F01 |
| 8.4, regularity used | node `xy = 0` at the origin | `dim m/m² = 2 > 1`: not a Cartier point | outside the route; no counterexample claimed | Check clause |
| 8.4, pure dimension of `𝔐 × B` | `𝔐 = Spec k`; `𝔐` pure of dimension `m`, `B` regular | `dim B = 1`; transcendence degree `m + 1` at each generic point of `𝔐 × B` | pure of dimension `m + 1` without smoothness | route sentence |
| 8.4, earlier Checks with "regular" | `B = 𝔸¹`, `L`, `𝔸¹ ⊔ 𝔸¹` | each regular; counts `2`; `2` at `0₁`, `0₂`, `t ≠ 0`; `1` and `0` | unchanged | none |
| 5.2 base change | `M′ = {0} ⊂ 𝔸¹_y` for `[𝔸¹/μ₂]`; `M′ = Spec K`, `[K : k]` finite, for `BG`; `M′ = ⊔_ℕ Spec k` | `[Spec k[x]/(x²)/μ₂]`, one geometric point, `2·(1/2) = 1`; `BG_K → Spec K` proper, one point; `⊔_ℕ BG` not quasi-compact | holds for `M′` qs of finite type; excluded otherwise | F02 |
| 5.2, `ℳ′` in Convention 1 | `ℳ = BG`, `M′ = Spec K` | `Δ_{BG_K}` finite étale with fibres `G`, so quasi-compact and separated | holds | none |
| 4.2 flat base change | `𝒢_1 = 𝔐 × B → 𝒢 = B` (8.4's use); `𝒢_1 = Spec k(t) → 𝔸¹` | first is locally of finite type, so the bullet applies; second is not, so `f_1^!` is undefined there and no stack of finite type over `k` maps to `Spec k(t)` | class needed for `f_1^!` | pattern |
| Normal-cone gap, base change | `Y′ = Spec k → BG`, with `X = Spec k → BG` | `X′ = G`, `C_{G/Spec k} = G`, the zero bundle, embedded in `C ×_X X′` | holds in the stated class | pattern |

## For the maintainer

- No name that another roadmap cites changed. The gap slugs and their suppliers (VirtualFundamentalClass
  §§1.5, 2.1) are unchanged.
- 8.4 is now more general than its source, li-tian1998 Theorem 4.2 (an irreducible smooth curve). The
  route supports the generality.
- **Ownership:** no new construction was introduced, so no ownership question arises. Ownership against
  the open pull requests is as the review recorded it.
- **Sources:** no source was fetched. The `sources.toml` locators already cover vistoli1989 (2.1)–(2.5),
  including the line-539 setting cited in 5.2, so the manifest is unchanged. No
  `needs-references.toml` was written.
