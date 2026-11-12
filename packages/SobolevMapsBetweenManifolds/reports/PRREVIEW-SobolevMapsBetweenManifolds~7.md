# Review of SobolevMapsBetweenManifolds (pull request #2230 at e23a66d)

**Verdict:** needs changes

## R01 (P3) — §5.2 credits Convent–Van Schaftingen beyond their finite-dimensional setting

**Location:** `README.md:1053–1055` "Convent–Van Schaftingen (Def. 2.1, p. 8) define the homogeneous class `Ẇ^{1,p}(M, N)` by the global form of this energy condition, for Riemannian metrics, `p < ∞` and the Hilbert–Schmidt norm `|Df|_HS`"

**Claim:** In §5.2 the targets are Banach manifolds, and this roadmap's "Riemannian metric" is Mathlib's `Bundle.RiemannianBundle`, which allows Hilbert fibres. The sentence therefore credits the source with the definition for `N = ℓ²`. The source treats only finite-dimensional `M` and `N`, and only colocally weakly differentiable maps.

**Witness:** ConventVanSchaftingen2016 lines 128–129 (§1.1, p. 3) give `M`, `N` dimensions `m`, `n`, Hausdorff with a countable basis. Line 408 adds colocal weak differentiability. Mathlib `Topology/VectorBundle/Riemannian.lean:370–378`: `RiemannianMetric` has no finite-dimensionality field.

**Repair:** Replace "define the homogeneous class `Ẇ^{1,p}(M, N)` by the global form of this energy condition, for Riemannian metrics, `p < ∞`" with "define the homogeneous class `Ẇ^{1,p}(M, N)` of colocally weakly differentiable maps by the global form of this energy condition, for finite-dimensional second-countable Riemannian manifolds `M`, `N` (§1.1, p. 3), `p < ∞`". Tested on `N = ℓ²`: the attribution no longer covers it, and the comparison `‖Df‖ ≤ |Df|_HS ≤ √(dim M) ‖Df‖` is unchanged.

## Previous findings

- R01 — repaired: `README.md:1053–1056` "Convent–Van Schaftingen (Def. 2.1, p. 8) define the homogeneous class `Ẇ^{1,p}(M, N)` … pointwise `‖Df‖ ≤ |Df|_HS ≤ √(dim M) ‖Df‖`, so the two norms give the same `L^p_loc` condition". The locator and the comparison are correct. The stated setting is the new R01.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §5.2 comparison `‖Df‖ ≤ \|Df\|_HS ≤ √(dim M) ‖Df‖` | `id` of round `S²`; projection `(x,y) ↦ x`; `diag(3,1)`; `dim M = 0` | `1 ≤ √2 ≤ √2`; `1 ≤ 1 ≤ √2`; `3 ≤ √10 ≈ 3.16 ≤ 3√2 ≈ 4.24`; `0 ≤ 0 ≤ 0` | holds; both bounds attained | — |
| §5.2 equivalence, Check `\|t\|^{1/2}` (`dim M = 1`, so HS = operator norm) | `p = 1`, `3/2`, `2` | `∫_{−1}^{1}(2\|t\|^{1/2})^{−p}dt = 2^{1−p}/(1−p/2)`: `2`, `2√2`, `∞` | in `L^p_loc` exactly for `p < 2`, as the Check says | — |
| §5.2 locator, CVS Def. 2.1, p. 8 (seeded) | page markers; hypotheses | Def. at lines 407–408, page 8 = lines 360–424; `p ∈ [1,∞)`; Riemannian (line 393); HS norm as orthonormal-basis sum (394–405); global `Lᵖ(M)` | number, page, `p < ∞`, HS norm hold | — |
| same, setting (R01) | `N = ℓ²`, flat metric (§5.1 Check `t ↦ t e₁`) | source: `dim N = n` finite (lines 128–129); README: Banach targets, `RiemannianMetric` without finite dimension | attribution overreaches | R01 |
| §5.4 citation of the same definition (`README.md:1101–1103`) | `N` finite-dimensional by §5.4's hypothesis | same Def., page, `p < ∞` and HS norm as in §5.2 | consistent with §5.2 | — |
| QuasiregularMaps gap `sobolev-maps-norm` (its README:391) | the §5.2 statement | asks: Riemannian `M`, `N`; continuous `f ∈ W^{1,1}_loc`; `f ∈ W^{1,p}_loc ⟺ ‖Df‖ ∈ L^p_loc`. §5.2 states this for the operator norm; the HS remark changes no hypothesis | supplied | — |

The rows for statements this change leaves untouched stand as in the previous review, of `80ac39d`.

- **Source locators checked (3 passages):** ConventVanSchaftingen2016 lines 92–98, 128–130 and 392–414. The only seeded target in the changed text is §5.2.
- **Library declarations opened:** Mathlib `Topology/VectorBundle/Riemannian.lean:370–378` (`RiemannianMetric`) and `:420` (`RiemannianBundle`) at the pin. `Suggested.lean` is unchanged since `80ac39d`. Its docstring (lines 33–36) still lists §5.2 as not statable for continuous tangent norms.
- **Cross-roadmap citations:** the open head of QuasiregularMaps cites §5.1–§5.2 (its README:943) and the gap `sobolev-maps-norm`. The change renumbers nothing. It has six `sobolev-maps-*` gaps, matching the description's "six Sobolev contracts".
- **Gate:** rerun on `e23a66d`: every check 0, OK, and the worker's targeted build is 0. `git diff --stat origin/main...HEAD` outside the folder is empty. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else, as at `80ac39d`. The file is unchanged, so the `#check @name` comparison of the previous review stands.
- **Pull-request text:** the title and description agree with this head. The change adds a Convent–Van Schaftingen locator in arXiv numbering, which the description already declares. No sentence is contradicted, and no removal or renumbering goes unstated.
- Overlap check: read QuasiregularMaps, YangMillsConnectionsAndCaloricGauge, SobolevDifferentialForms, Surfaces, RiemannianGeometry (open), and DifferentialGeometry, CalibratedGeometry, PseudoholomorphicCurveAnalysis (main). The changed passage adds no target. The operator-norm `L^p` characterisation stays owned here (§5.2), and QuasiregularMaps cites it. QuasiregularMaps owns the Hilbert–Schmidt distortion quotients, and §5.2 mentions the Hilbert–Schmidt norm only in a remark. The `Ẇ^{σ,p}(ℝ⁴)` of YangMillsConnectionsAndCaloricGauge is a different object. Nothing else is shared.

## Not verifiable

- None among the changed passages. Ziemer1989, Lee2012, Rickman1993, Mazya2011 and Bethuel1991 remain settled as uncertified, and the change rests on none of them.

## Source issues

- **Misprint** in ConventVanSchaftingen2016 at §2, definition of the operator norm, p. 8: the source takes the supremum of `|ξ(e)|` over `e ∈ T_yN` with `|e|_{g_N} ≤ 1`; it should be over `e ∈ T_xM` with `|e|_{g_M} ≤ 1`, since `ξ ∈ L(T_xM, T_yN)`; affects nothing.
- **Misprint** in ConventVanSchaftingen2016 at the Introduction, p. 2: the source announces the homogeneous space `Ẇ^{1,p}(M, N)` for `p ∈ [1,∞]`; it should be `p ∈ [1,∞)`, as Def. 2.1 on p. 8 states; affects nothing.
