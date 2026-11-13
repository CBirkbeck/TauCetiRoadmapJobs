# FIX-PKG-KloostermanSheavesAndBesselIsocrystals~6

Review settled: `REV-PKG-KloostermanSheavesAndBesselIsocrystals~5` (three findings). All three were
checked against the sources and the roadmap and found correct. Only `packages/KloostermanSheavesAndBesselIsocrystals/README.md`
changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified. XZ line 2009 (§4.2.2, p. 43) and line 2052 (§4.2.5, p. 44) define the coefficient as
`p₁^+(E_{−π})[dim Gr_λ]`. XZ lines 701–714 (§2.3.4, p. 15) place smooth objects in `Hol[−d]` and
identify `f^+` with unshifted isocrystal pullback. XZ lines 1861 and 2056 put the curve shift `[1]`
on the eigenvalue and on `j_{!+}(M)`. So the unshifted `j_{!+}(p₁^+ A_ψ)` has its cohomology in degree
`d`, not in degree 0.

Changes (old → new):
- §3.1: coefficient `p₁^+ E_{−π}` on `GR_W°` → the Satake-normalized coefficient. This is
  `M = p₁^+E_{−π}[d]` in the de Rham theory, and `p₁^+A_ψ[d]` in the arithmetic theory, with `(d/2)`
  when Frobenius is kept. `M` is defined on the smooth locus `GR_W°°` and equals
  `p₁^+A_ψ ⊗ IC_W` there. The fibre/total-space/curve shift convention is stated: on a fibre, `M` is
  in the heart; on the total space, `M[1]` is; on the curve, `Kl_W[1]` is. Needs gains §1.3.
- §3.2: the degree-zero claim now refers to `M`. The first Check gains the `d = 1` `SL₂` control.
- §3.3: `j_{!+}(p₁^+A_ψ)` → `j_{!+}(M_s)`, with `j_{!+}(M) ≅ p₁^+A_ψ ⊗ IC_W`. "Relative de Rham object
  holonomic in degree zero" → "`τ_+(M)[1]` lies in the heart in both theories" (XZ Lemma 4.2.6(i)
  states both, and §3.4 uses the rigid one). Needs gains §§1.3 and 1.5. A new Check gives the
  `d = 2` negative control.

Pattern search: §§3.1 and 3.2 had the same unshifted coefficient and were repaired with §3.3. The
other `j_{!+}` statements (§6.6, §11.5) say that cohomology vanishes in every degree, which no shift
changes. §1.4 already normalizes its fibre explicitly. Two related corrections were needed to state
`M` on the smooth locus. The quasi-minuscule good compactification is the resolution
`G̃r_{≤W} × ℙ¹` (XZ line 2051). Relative cohomology is a derived direct image, because `GR_W°°` is
not affine over `X`.

## F02 (P3) — applied

Verified. For the vertex `i` and the punctured chart `j`, `i^+ j_! = 0`, so the old Check said the
reverse of the truth. The old Check is replaced by a computed one on the `PGL₂` cone.
`p₁^+A_ψ` is smooth across the vertex, since the vertex lies in `GR_W°` (XZ line 2063). The cone is
`𝔸²/μ₂`: a Galois double cover for odd `p` and radicial for `p = 2`. So `IC` is the shifted constant
object, and the vertex stalks in degree `−2` have dimensions `0` (`j_!`) and `1` (`j_{!+}`).

The localization triangle with this theorem's concentration then gives
`h^{−1}_c(U_s, M_s) = 1` and `h^0_c = 3`; dually `h^0 = 3` and `h^1 = 1`. The old assertion of a
dimension change was not kept: in degree 0 the three groups agree.

## F03 (P2) — applied

Verified. `merge-order/ORDER.txt` lists KloostermanMomentsAndPotentialAutomorphy at line 310 and this
roadmap at line 366. `packages/KloostermanMomentsAndPotentialAutomorphy/README.md` lines 120 and
2021 state that it supplies this roadmap. The Downstream bullet claiming that it uses §§0.1 and 8.1
of this roadmap is deleted. The imports in Scope, Exact supplier contracts and §8.1 are unchanged. No
other reverse claim exists: a grep for consumers and uses found only the GlobalShtukasAndFunctionFieldLanglandsPartII
bullet, a genuine later consumer.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §3.1 normalized `M` | `W = 1`, `d = 0` | `p₁` is constant at the big-cell origin and `φ(0) = 0`, so `M = O` on `X`; the relative map is the identity of `A†`. | The existing Check still holds. |
| §3.1 shift convention | Fibre of dimension `d`, total space `d + 1`, curve `X` | `M_s = L[d]` is in the heart; `M` has shift `d` on a `(d+1)`-fold, so `M[1]` is in the heart (XZ line 2056); on the curve `Kl_W ∈ Hol[−1]`, so `Kl_W[1]` is in the heart (XZ line 1861). | Stated in §3.1. |
| §3.1 half twist | Minuscule, `d = 1`, Frobenius kept | `IC_W = K[1](1/2)`, so the stalk Frobenius is multiplied by `c_q^{−1}`. The integral twist would give `q^{−1}`, which is off by `c_q^{−1}`, as in the §1.5 Check. | Consistent with §§1.3 and 1.5. |
| §3.2 degree claim | `H = SL₂`, standard `W`, `d = 1` | Normalized: `h⁰ = 2`, `h¹ = 0`. Unshifted: `h⁰ = 0`, `h¹ = 2`. This matches rank 2 of `Kl₂`. | Added to the §3.2 Check. |
| §3.3 concentration | `PGL₂`, adjoint `W`, `d = 2` | Normalized: `h⁰ = 3`, `h² = 0`. Unshifted: `h⁰ = 0`, `h² = 3`. | New negative-control Check. |
| §3.3 relative object | `τ_+(M)` against `τ_+(M)[1]` | On the dense open where it is smooth, `τ_+(M)` lies in holonomic degree `1`; `τ_+(M)[1]` lies in degree `0`. | Statement uses `[1]` in both theories. |
| §3.3 vertex stalk | `i^+ j_!` against `i^+ j_{!+}` on the cone | `0` against `K[2]`: dimensions `0` and `1` in degree `−2`. | Replaces the reversed Check. |
| §3.3 `IC` of the cone | `p = 3`: `(x,y) ↦ (x², y², xy)`; `p = 2`: same map | `p = 3`: the fibre over the vertex is `{0}` and the `±1`-invariants of `K` are `K`, so `IC = K[2]`. `p = 2`: `x²` determines `x` and `[k(x,y) : k(x², xy, y²)] = 2` is purely inseparable, so the map is a universal homeomorphism and again `IC = K[2]`. | Every `p` is covered. |
| §3.3 compact-support sequence | Triangle `j_! → j_{!+} → i_+i^+j_{!+}`, with `H^*_c(Y, j_{!+}M_s)` equal to `K³` in degree 0 | `0 → H^{−2}_c(U) → 0 → K → H^{−1}_c(U) → 0`, so `h^{−2}_c = 0` and `h^{−1}_c = 1`; then `h⁰_c(U) = h⁰_c(Y) = 3` and `h^{≥1}_c = 0`. | Check values. |
| §3.3 dual sequence | `i^! j_{!+} M_s = K[−2](−2)` by duality | `h⁰(U) = 3`; `0 → h¹(U) → K → 0` gives `h¹(U) = 1`. | Check values. |
| Downstream direction | Supplier and this roadmap | Order `310 < 366`; the supplier states it supplies this roadmap; the deleted bullet asserted `366 → 310`. | Bullet deleted. |

## Checks run

- `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` (run from the content
  checkout): exit 0. There were exactly five `declaration uses 'sorry'` warnings, at lines 66, 133,
  145, 156 and 169. The only import is `Mathlib`, so no Tau Ceti module had to be built.
- Signatures: one scratch file with `#check @name` for all 11 declarations (six definitions, five
  theorems) elaborated once. Each type was compared with its README statement. No binder was lost
  and nothing changed, as expected, since `Suggested.lean` is untouched.
- Dependency check (`gate --depcheck … --movable --content …`), complete output:

```
depcheck: 206 roadmaps, 1908 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` lists one lead: `KloostermanMomentsAndPotentialAutomorphy §2.6`, found nowhere on
  main or in the open pull requests. The roadmap is a board package earlier in the merge order, and
  its §2.6 is at line 747 of `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`. This is
  not a defect.

## Notes for the maintainer

- No new targets, Lean names or supplier gaps were added, and no id changed. No other roadmap's
  citation is affected. The new XZ locators (§2.3.4, p. 15; §§4.2.2 and 4.2.5, pp. 43–44) fall within
  the ranges the manifest already records, and §§3.1–3.3 are already in its `cited_for`. No source
  was fetched and none is missing.
- The added material is internal normalization. It introduces no construction another roadmap could
  own, so no new ownership search against open pull requests was needed.
- KloostermanMomentsAndPotentialAutomorphy no longer appears as a consumer of this roadmap. Any later
  use of the reductive-group companion theorem by scalar work belongs to a separate Part II, not to
  that earlier roadmap.
