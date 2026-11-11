# FIX-PKG-VirtualFundamentalClasses~4

Repair of review `REV-PKG-VirtualFundamentalClasses~3` (three findings). I checked all three on the mathematics, and all three are correct. Edited files: `packages/VirtualFundamentalClasses/README.md`, `packages/VirtualFundamentalClasses/Suggested.lean` (module docstring only) and `packages/VirtualFundamentalClasses/sources.toml` (stacks-chow locator). `metadata.toml` and `design/plan.json` are unchanged, and no supplier gap is needed.

## F01 (P1) — applied

The review's witness is correct. Take `X = Spec k ⊔ ℙ¹`, `C = ℙ¹` and the constant map to the point. Then `E = 0`, `δ = g = 0` and `χ = 0`, while `δ + dim X·(1 − g) = 1`.

Change in 11.6: `rk E = δ + dim X·(1 − g)` becomes the following.
- `M = ⊔_ρ M_ρ` with `M_ρ := π(F⁻¹(X_ρ))`, where `X_ρ` is the locus on which `T_X` has rank `ρ`. The loci are open and closed because `π` is open and closed and its fibres are nonempty and connected (`PrestableFamily` extends `GeometricallyConnected`, whose fibres are `ConnectedSpace`s).
- On `M_ρ`: `rk E = δ + ρ(1 − g)`, `vd = b + δ + ρ(1 − g)`, and the Gromov–Witten formula has `ρ − 3`. When `X` is pure-dimensional, `ρ = dim X`.
- The review's witness is added as a negative-control Check.

The same pattern occurred elsewhere, and each place is repaired:
- the Summary;
- the 9.2 Check: "`M` has pure dimension `vd`" now reads "dimension `vd` at every point; pure on the loci where the rank is constant", with `Spec k ⊔ ℙ¹` as the control;
- the 9.2 definition: `vd` is said to be locally constant;
- 7.2: "pure dimension `c + rk E_0`";
- 10.2: "pure dimension `m + rk F^0`". The class is now `Σ_a 0^!_{F_1|M_a}`, because 5.1 needs constant rank. A Check was added: a resolution with `rk F^0 = (0, 1)` gives the class of degrees `(1, −1)`, the same as in 10.4;
- the Layer 10 preamble: zero-section Gysin maps are taken on the parts where the ranks are constant;
- the docstring of headline 8 in `Suggested.lean`;
- the Mathlib supplier contract: `AlgebraicGeometry.GeometricallyConnected` is added.

## F02 (P2) — applied

The witness is correct. On `𝔸¹`, `E = Ω[0]` with `φ = 0` satisfies (⋆). On affine `T` the group `Ext¹` vanishes, so extensions exist and form a `J(T)`-torsor, which is abstractly an `Ext⁰(Lg^*E, J)`-torsor. The isomorphism sheaf is `Aut(vertex) ≅ J`. So the existential versions of (3) and (4) hold, but `h⁰(φ) = 0`. The source's proof uses the map induced by `φ` (behrend-fantechi1997 line 1180).

Changes:
- 9.1 now constructs `can_g` (ḡ ↦ `h^* − (i∘ḡ)^*`) and states its equivariance, `can_g(δ·ḡ) = can_g(ḡ) − δ`. The sign is pinned by a Check on `𝔸¹` with values `b, c`.
- 9.3 defines `φ_g` (precomposition with `Lg^*φ`) and `Φ_g` (composition with `φ^∨`). (3) now requires `φ_g` to be bijective whenever `g` extends. (4) requires `Φ_g ∘ can_g` to be an isomorphism.
- The route is rewritten so that it carries these maps throughout, including the step "equivariant bijection of torsors ⇒ `φ_g` bijective".
- A Check was added: `φ = 0` gives `φ_g = 0 : k → k`; `φ = id` gives the identity.
- Same pattern: the 11.4 route, which uses criterion (3), now shows that `φ_g` corresponds to `δ ↦ π^*δ ∘ h⁰(e)` and is bijective by 11.1. The docstring of headline 5 is updated.

## F03 (P3) — applied

stacks-chow line 1395 (Lemma 19.3) is the localisation sequence; the review is right. Changes:
- §2.4 now cites Definition 8.1 (tag 02QR, p. 17, line 752) and Definition 19.1 (tag 02RW, p. 30, line 1356), with `δ = dim`.
- The `Spec k` Check now computes `Z_0 = ℤ` and `R_0 = 0`.
- Both definitions are added to References and to the stacks-chow manifest locator and `cited_for`.
- Lemma 19.3 stays at §3.4 (README line 856), where it is the right citation.

## Checks

- **Elaboration.** `lake env lean packages/VirtualFundamentalClasses/Suggested.lean`, run from the content checkout after the last edit to `Suggested.lean`: exit 0, no output. No `TauCeti.*` import, so nothing needed building.
- **Binder inventory (`#check @name`).** `Suggested.lean` declares zero declarations, so the inventory is empty and there is nothing to compare. Only the module docstring changed (headlines 5 and 8).
- **Dependency direction.** Output of the brief's command:

  ```text
  depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Scratch gate** (README, `Suggested.lean` and `metadata.toml` copied into a scratch folder): every check is 0 except `git=1`, which only means the scratch copy is not a git repository.
- **`sources check sources.toml`:** 0 problems.
- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name is unresolved.
- **Sources.** No new source was needed; every locator above was read in the cached texts. `needs-references.toml` was not written.

## Adversarial pass (changed statements)

| Statement | Instances and computed values | Result / change |
|---|---|---|
| 11.6 splitting `M = ⊔ M_ρ` | `X = pt ⊔ ℙ¹`, constant maps: `M_0 = pt`, `M_1 = ℙ¹`. `X = ∅`: `M = ∅`. Without nonempty fibres the `M_ρ` would not cover `M`; `ConnectedSpace` includes `Nonempty` (Mathlib `Topology/Connected/Basic.lean:705–707`). | Stated with that justification. |
| 11.6 `rk E = δ + ρ(1−g)` | `ℙ¹ → ℙ^r` of degree `d`: `h⁰(F^*T) = (r+1)(d+1) − 1 = (r+1)d + r = δ + r`. Elliptic `C ≅ X`: `1 − 1 = 0 = 0 + 1·0`. Nodal `g = 0` curve, constant map to `ℙ¹`: `χ = 1 = 0 + 1·1`. `pt ⊔ ℙ¹`: `(0, 1)`. | Holds; the `dim X` version gives 1 on the point. |
| 11.6 Gromov–Witten `vd` | Lines in `ℙ²`: `−3 + 3 + 2 = 2`. CY3: `n`. `pt ⊔ ℙ¹`, `g = 0`, `n = 3`, `β = 0`: point part `0 + (0−3) + 3 = 0` (`M̄_{0,3} = pt`); `ℙ¹` part `1`; the `dim X` formula gives 1 on the point part. | Uses `ρ`. |
| 9.2 lci dimension | `pt ⊔ ℙ¹`: ranks `(0, 1)` equal the local dimensions. `xy = 0` in `𝔸²`: rank 1, pure dimension 1. `k[x]/x²` over `k`: rank 0, dimension 0 in every characteristic. | Pointwise statement. |
| 7.2 `C = 𝒞 ×_ℰ E_1` | `ℰ = BT_M = [M/T]`, `M` pure of dimension `n`: `C = M`, `n = 0 + n`. `M = pt ⊔ ℙ¹`: dimensions `(0, 1)`. | Pointwise statement. |
| 10.2 class summed over the parts `M_a` | Resolution `[0→0] ⊔ [O(1)→Ω]`: `C(F^•)` has dimensions `(0, 1)`, class degrees `(1, −1)`; with `[O→O]` on the point, `0^!_{𝔸¹}[𝔸¹] = [pt]`, the same. `M = pt`, `E = [O^s→0]`: `c_s(O^s) ∩ [pt]`, degrees `1, 0, 0` for `s = 0, 1, 2`. | Agrees with 10.3 and 10.4. |
| 9.1 `can_g` equivariance | `𝔸¹`, `T = pt`, `T̄` dual numbers, `h: x ↦ 0`, `ḡ: x ↦ bε` ↦ `−b`; `δ = c` gives `−(b+c)`. `J = 0`: `can_g(g) = 0`, the identity. Étale `M`: one extension, trivial `Aut`. | Sign `−δ` pinned by a Check. |
| 9.3 (3) | `φ = 0` on `𝔸¹`: `φ_g = 0`, so (3) fails, as does (1). `φ = id`: `φ_g = id`. `ℙ¹`, `E = [O(1)→Ω]`: `φ_g = id` and `φ^*ω = 0` (since `φ^{−1} = 0`, `I = 0`). Char 2, dual numbers, `φ = (0, id)`: `φ_g = id` but the obstruction part fails. | The two parts of (3) give independent controls. |
| 9.3 (4) | `φ = 0`: `Φ_g ∘ can_g` sends the `k` extensions to the identity, so it is not injective. `φ = id`: equals `can_g`. | Specified map. |
| 9.3 (3) ⇒ (1) | Trivial extension `A ⊕ J'` for all `J'`; `J' = 0` gives `0 → 0`, so the argument needs all `J'` (Yoneda). | Stated. |
| 11.4 `φ_g ↔ π^*δ ∘ h⁰(e)` | `X = Spec k`: the target `Hom` is 0, so bijectivity means `Ω_{M/𝔅} = 0`, i.e. `M` étale (11.1 Check). Isolated point carrying `id_{ℙ¹}`: `0 → H⁰(T_{ℙ¹}) = k³` is not bijective, matching 11.1's negative control. | Consistent. |
| 2.4 scheme comparison | `Spec k`: `Z_0 = ℤ`, `R_0 = 0`. `𝔸¹`: `CH_0 = 0`, `CH_1 = ℤ`. | Locator fixed. |

## For the maintainer

- No section, layer or target was renumbered or deleted, and no name that other roadmaps cite changed. `Suggested.lean` still declares nothing.
- **Ownership.** No new construction or target was added; the repairs restate existing targets. The open-ownership question about the singular-name VirtualFundamentalClass and GromovWittenTheory pull requests is still the human decision recorded in earlier rounds. It was not raised again.
- **Untrusted text.** The review text contained no instruction-like passages.
