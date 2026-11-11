# FIX-PKG-VirtualFundamentalClasses~5

Repair of review `REV-PKG-VirtualFundamentalClasses~4`, which has two findings. Both are correct on the mathematics and both are applied.

Edited files:
- `packages/VirtualFundamentalClasses/README.md`: §§7.2, 8.4, 8.5, 10.2 and 11.3.
- `packages/VirtualFundamentalClasses/sources.toml`: one `cited_for` entry added to `stacks-properties`.

Unchanged: `Suggested.lean` (no declaration, and its docstring already says "pure dimension `m`" for headline 4), `metadata.toml` and `design/plan.json`. No supplier gap is needed.

## F01 (P2) — applied

§7.2: `dim 𝒞 := dim C − rk E` → `dim_z 𝒞 := dim_ξ C − rk_y E`, independent of presentation (Lemma 12.1), `dim 𝒞 := sup_z` (Definition 12.3), pure = pointwise. First Check: `dim_x BE = dim_x X − rk_x E`, sup; witness `Spec k ⊔ ℙ¹` gives `(0,0)`, not `(1,0)`. Same pattern: §8.5 per-`W_d` argument, §8.4 and §10.2 Checks.

Evidence: stacks-properties lines 1374–1417. The groupoid `E ×_U C ⇉ C` of `[C/E]` has fibre `E_y ⊗ κ(ξ)` at `ξ`, so Lemma 12.1 gives the pointwise formula. The other places, old → new:
- §8.5: "`C_{U/W}` pure of dimension `dim W`, relative dimension `dim W − m`" → on each `W_d`: dimension `(m + d) − d = m`.
- §8.4 Check: "`n − n`" → `dim_x M − rk_x T_M = 0` pointwise.
- §10.2 Check: `A_{dim M}` → `A_{m+r}` (constant `r`).

Already pointwise: 1.3, 9.2, the 10.2 construction, 10.4.

## F02 (P3) — applied

§11.3 Check: "dual to `H⁰(C, F^*T_X) → T_{[F]}Mor`" → the fibre `H⁰(C, F^*T_X)^∨ → T^*_{[F]}M` of `h^0(φ)` is dual to `T_{[F]}M → H⁰(C, F^*T_X)`, the derivative of the universal map. Added Check over `ℚ`: `Mor(ℙ¹, 𝔸¹) ≅ 𝔸¹`, `x = 2t`, `dx ↦ 2dt`; the inverse dualises to `dt ↦ ½dx`; `φ_g(c) = 2c`.

Evidence: behrend-fantechi1997 lines 1586–1591 build `e : f^*L_V → π^*L_X`, in the cotangent direction. The Check is stated over `ℚ` because `2 = ½` in characteristic 3, and `x = 2t` is not a coordinate in characteristic 2. No other direction claim was found ("tangent map", "dual to", `T_{[`); the 11.4 route `δ ↦ π^*δ ∘ h^0(e)` already agrees.

## Checks

- **Elaboration:** `lake env lean packages/VirtualFundamentalClasses/Suggested.lean`, run from the content checkout: exit 0, no output. The file has no `TauCeti.*` import, so nothing needed building. `Suggested.lean` was not edited.
- **Binder inventory (`#check @name`):** `Suggested.lean` declares nothing, so the inventory is empty and nothing changed.
- **Dependency direction** (the brief's command):

  ```text
  depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Static gate** on a scratch copy (README, `Suggested.lean`, `metadata.toml`): every count is 0 except `git=1`, which only means the scratch copy is not a git repository.
- **`sources check sources.toml`:** 0 problems.
- **`roadmaps resolve` on the README:** no unresolved cross-roadmap citation or Lean name.
- **Sources:** no new source was needed. Every locator was read in the cached texts (stacks-properties lines 1374–1417; behrend-fantechi1997 lines 1583–1599). `needs-references.toml` was not written.
- **Gate failures:** the brief listed none.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §7.2 `dim_z 𝒞 = dim_ξ C − rk_y E` | `BE`, `X = Spec k ⊔ ℙ¹`, `E = 0 ⊔ T_{ℙ¹}` | pointwise `(0−0, 1−1) = (0,0)`; sup `0`; old global formula `(1−0, 1−1) = (1,0)` | new definition; witness added as a Check |
| same | `X = Spec k`, `E = 𝔾_a` (rank 1) | `0 − 1 = −1`; stacks-properties Example 12.5 gives `−dim G = −1` | agrees |
| same, presentation independence | the point `Spec k` as `[Spec k/0]` and as `[𝔸¹/𝔾_a]` (translation) | `0 − 0 = 0` and `1 − 1 = 0` | independent, as Lemma 12.1 says |
| same | `[𝔸¹/𝔾_a]`, trivial action (`= 𝔸¹ × B𝔾_a`) | `1 − 1 = 0` at every point | matches the existing third Check |
| same, groupoid fibre | `[C/E]` with `E` of rank 2 over a point | fibre of `s : E ×_U C → C` at `ξ` is `𝔸²_{κ(ξ)}`, dimension `2 = rk E` | correction term is `rk_y E` |
| same, degenerate cases | `E = 0`; empty `X` | `BE = X`, `dim_x BE = dim_x X` (agrees with 1.3); empty sup is `−∞` (stacks-properties Remark 12.4), pure of every dimension vacuously | consistent |
| "one presentation computes `dim 𝒞`" (negative control) | `E = 0` on `Spec k ⊔ ℙ¹`, presentation over the point only | sees `0`; `dim BE = 1` | false; added to the Check |
| §7.2 subcone consequence (unchanged text, recomputed) | `ℰ = BT_X = [X/T_X]`, `X = pt ⊔ ℙ¹`, `𝒞 = ℰ` (pure dim 0) | `C = X`: dims `(0,1) = 0 + rk T_X = (0+0, 0+1)` | consistent with the new definition |
| same | `ℰ = E_1` (rank 1, `E_0 = 0`) over a point, `𝒞` = zero section | `c = 0`, `dim C = 0 = 0 + 0` | consistent |
| §8.4 Check `N_M = BT_M` | `M = pt ⊔ ℙ¹`; `M = ℙ²` | `(0−0, 1−1) = (0,0)`; `2 − 2 = 0` | pure dimension 0 even for non-pure `M` |
| §8.5 `C_{M/𝔐}` pure dim `m` | `W = 𝔸¹ ⊔ 𝔸²` over `Spec k` (`m = 0`), `U` = origins | `C_{U/W}`: dims `(1, 2)`; `rk T_W = (1, 2)`; dims `(0, 0) = m`. Old "rel. dim `dim W − m` = 2" would give `1 − 2 = −1` on the `𝔸¹` part | repaired per `W_d` |
| same, `m < 0` | `M = W = U = Spec k → 𝔐 = B𝔾_m` (`d = 1`) | `dim W = m + d = −1 + 1 = 0` ✓; `C_{U/W} = Spec k`, dim `0`; `C_{M/𝔐} = B𝔾_a`, dim `0 − 1 = −1 = m` | agrees with the existing Check |
| §10.2 smooth Check | `M = ℙ¹`, `E = Ω[0]`, `m = 0`, `r = 1`; `M = Spec k → B𝔾_m`, `m = −1`, `r = 1` | `[ℙ¹] ∈ A_1 = A_{0+1}`; `[Spec k] ∈ A_0 = A_{−1+1}` | `A_{m+r}` correct; varying rank is excluded by Layer 10 (10.4's Check covers varying `d` with constant `r`) |
| §11.3 direction | `Mor(ℙ¹, 𝔸¹) ≅ 𝔸¹`, `x = 2t`, over `ℚ` | `e: dx ↦ 2dt`; tangent `∂_t ↦ 2∂_x`, dual `dx ↦ 2dt` ✓; inverse `∂_x ↦ ½∂_t`, dual `dt ↦ ½dx` (wrong source) | Check corrected and added |
| same, through 9.3 and 11.4 | same family, `T = Spec k ⊂ Spec k[ε]`, `J = k`, `δ(dt) = c` | `φ_g(δ) = δ ∘ g^*h^0(φ)`: `dx ↦ 2c`; 11.4 `π^*δ ∘ h^0(e)`: `dx ↦ 2c` | `φ_g(c) = 2c` on both routes |
| same, characteristic | `𝔽_3`; `𝔽_2` | `2 = 1/2` in `𝔽_3`, so coefficients do not tell the map from its inverse; `2 = 0` in `𝔽_2`, so `x = 2t` is not a coordinate | Check stated over `ℚ` |
| same, other values | `X = Spec k`; `C = ℙ¹`, `X = ℙ^r`, degree `d`; elliptic `C = X` | `0 → 0`; `h⁰(F^*T_{ℙ^r}) = (r+1)(d+1) − 1 = (r+1)d + r = dim T_{[F]}M`; `h⁰(O_C) = 1 = dim` of the translates | consistent with the 11.4 Checks |

## Ownership and overlaps

- **Ownership:** no new construction or target was added. The pointwise dimension refines §7.2's existing definition, and the stack dimension it specialises is stacks-properties Definitions 12.2–12.3, cited.
- **VirtualFundamentalClass (open):** its overlap with §§7–10 is the ownership question already left to a human. It is not reopened.
- **Overlaps file:** lists no open pull request that changes this roadmap and no dropped id. No id, heading or section number changed, so no roadmap citing this one is affected.

## For the maintainer

- No Lean name changed.
- No cross-roadmap citation was added or changed.
- No suspicious instruction was found in the review text.
