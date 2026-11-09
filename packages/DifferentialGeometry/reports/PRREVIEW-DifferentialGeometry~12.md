# Review of DifferentialGeometry (pull request #886 at 8f9be9a)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since `4d6e96e` (README 2.2 and 9.2, and the docstring of `orientable_iff_exists_atlas`). The gate passes, `Suggested.lean` elaborates at the branch pin, and the depcheck reports no problems. R03 and R04 of the previous review are repaired. The R04 repair copied the previous review's suggested wording, and that wording was too broad: the theorem is stated over every model with corners, where the dimension-one exception is not the only one (R02). The new half-plane Check does not tell dimension 2 apart from dimension 1 (R03). The two carried findings are R01 and R04.

## R01 (P2) — The folder is still written against two Tau Ceti revisions and conflicts with main

Re-raised: R01 (the repair report of `4d6e96e` said the repair has to wait until the branch is updated). That reason says who has to act, not that the defect is gone. Nothing in this head changes the situation, and a folder that cannot merge into main is not ready for a human's final approval.

**Location:** `lake-manifest.json` (Tau Ceti `358314d4`, Mathlib `f6090c70`, Lean `v4.35.0-rc3`); `TauCetiRoadmap/DifferentialGeometry/README.md:300–303` ("cited at Tau Ceti `2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules postdate the revision `358314d4` that this folder's `Suggested.lean` is written against").

**Claim:** this is unchanged from the previous review. Layers 6–11 cite Tau Ceti modules that are missing at the branch's pin (for example `Geometry/Manifold/Exhaustion.lean`, which 7.4 *Needs*). At main's pin (`2fd255d9`), Tau Ceti already proves several of the file's admitted headlines, and the imported `Geometry/Manifold/Riemannian/Sphere.lean` has been moved. The README also names git revisions, so it is not timeless.

**Witness:** `git merge-tree --write-tree HEAD origin/main` on this head gives `CONFLICT (content): Merge conflict in TauCetiRoadmap/DifferentialGeometry/Suggested.lean`. `git -C .lake/packages/TauCeti rev-parse HEAD` gives `358314d4…`, while `origin/main:lake-manifest.json` pins `2fd255d9…` and `origin/main:lean-toolchain` is `v4.36.0-rc2`.

**Repair:** as in the previous review, steps 1–4.
1. Merge `origin/main`.
2. Resolve `Suggested.lean` against main's pin, with the imports moved to `Orientation.OrientedAtlas` and to the module that now carries `sphereRoundMetric`.
3. Delete the admitted theorems and carriers that Tau Ceti `2fd255d9` proves or declares. Keep only the names that consumers on main import.
4. Restate the newly statable headlines (9.2, 9.3, the 10.4 integral formula) on the native carriers, remove the two revision hashes from README 300–303 and 248, and rebuild.

The first step lies outside the files a repair job may edit.

## R02 (P2) — "Needed only in dimension 1" is false at the generality of `orientable_iff_exists_atlas`

**Location:** `README.md:785–789`: "the hypothesis is needed only in dimension `1`: for a manifold with boundary of dimension at least `2` the converse also holds [Lee, Prop. 15.6]". `Suggested.lean:737–738` makes the same claim in the docstring.

**Claim:** the theorem is stated for an arbitrary `I : ModelWithCorners ℝ E H` (the `#check` below). Lee's Proposition 15.6 covers only the half-space model. Over a corner model, the converse can fail in dimension 3 without the boundaryless hypothesis.

Take a corner `p` whose model is a convex cone `C` with no orientation-reversing linear automorphism. The within-derivative of any coordinate change that fixes the apex maps `C` onto `C`, so it has positive determinant. All charts at such a corner therefore carry the same sign. A connected `M` with one such corner and one mirror-image corner has an orientation but no oriented atlas: whichever orientation an atlas induces, the charts at one of the two corners are negatively signed. The reason the README gives (reflecting a coordinate that is not boundary-defining) only works for the half-space.

**Witness:** apply `ModelWithCorners.ofConvexRange` (Mathlib `IsManifold/Basic.lean:318`) to the cone over the pentagon `(0,0),(4,0),(6,3),(2,5),(−1,2)` at height 1. Of its ten dihedral vertex permutations, only the identity extends projectively (computed exactly), so `Aut C = ℝ_{>0}·id`.

**Repair:** in README 785–789, write: "Over the half-space model `𝓡∂ n` the hypothesis is needed only for `n = 1`: for `n ≥ 2` the converse also holds with boundary [Lee, Prop. 15.6], since … ; over a general model with corners it is needed in higher dimension too." Make the same scoping change in the docstring at `Suggested.lean:737–740`.

Add the corner as a negative-control Check: over the pentagonal cone model above, a connected `M` that is `C` near `p` and a mirror image of `C` near `q` is orientable but has no oriented atlas. Tested on that instance: it is not modelled on `𝓡∂ n`, so the scoped sentence makes no claim about it. `Set.Icc 0 1` over `𝓡∂ 1` and the strip of R03 over `𝓡∂ 2` both agree with the scoped sentence.

## R03 (P3) — The half-plane Check does not separate dimension 2 from dimension 1

**Location:** `README.md:797–801`: "The closed half-plane `{x₀ ≥ 0}` over `𝓡∂ 2` has an oriented atlas: the reflection `(x₀, x₁) ↦ (x₀, −x₁)` preserves the half-plane with Jacobian `−1` … A criterion that demanded boundarylessness in every dimension would miss it".

**Claim:** the half-plane is the model space itself, and the atlas `{id}` is already oriented, so no reflection is needed. The one-dimensional analogue `[0, ∞)` over `𝓡∂ 1` also has the oriented atlas `{id}`, even though dimension 1 is exactly where the converse fails. The Check therefore holds in the exceptional dimension as well and tests nothing about the remark it accompanies.

**Witness:** `[0, ∞)` over `𝓡∂ 1` has the atlas `{id}` with transition derivative `1 > 0`. The half-plane has `{id}` with determinant `1 > 0`. Both have an oriented atlas, so the Check does not distinguish the two dimensions.

**Repair:** replace the half-plane with the two-dimensional analogue of `[0, 1]`, the strip `[0, 1] × ℝ` over `𝓡∂ 2`. The chart `(x, y) ↦ (x, y)` on `x < 1` has Jacobian `+1`. A chart at `x = 1` must send that line to `{x₀ = 0}`: `(x, y) ↦ (1 − x, y)` has Jacobian `−1`, and after the reflection `(x, y) ↦ (1 − x, −y)` has `+1`. The transition `(u, v) ↦ (1 − u, −v)` has determinant `(−1)(−1) = +1`, so the two charts form an oriented atlas. On `[0, 1]` (the first Check) there is no second coordinate to reflect. Tested: the strip's one-dimensional analogue is `[0, 1]`, which has no oriented atlas, so the new Check separates the two dimensions.

## R04 (P3) — Two other open pull requests change this folder and the description states no order

**Location:** the pull-request description (data). It names neither #334 nor #1187.

**Claim:** carried from the previous review, unchanged. The overlap report computed today still lists both pull requests as conflicting with this head.

**Witness:** the overlap report for this head: "#334 and #886 conflict in `TauCetiRoadmap/DifferentialGeometry/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` … `lake-manifest.json`".

**Repair:** add one sentence to the description, for example "this head supersedes #334; #1187 is rebased on this head after it merges". The README must not name pull-request numbers.

## Previous findings

- R01 — not repaired: the manifest pins Tau Ceti `358314d4`; README 300–303 still says "cited at Tau Ceti `2fd255d9` … postdate the revision `358314d4` that this folder's `Suggested.lean` is written against"; `git merge-tree` still conflicts in `Suggested.lean`. Carried as R01.
- R02 — not repaired: the description quoted for this head still names neither #334 nor #1187. Carried as R04.
- R03 — repaired: README 1890–1891 reads "for a connected oriented boundaryless `M` of dimension `n` [Lee, Thm. 17.30]". Lee's Theorem 17.30 (`67802551 line 21190`) is exactly this statement.
- R04 — repaired, but the repair introduced two problems: README 785–787 now reads "the hypothesis is needed only in dimension `1`: for a manifold with boundary of dimension at least `2` the converse also holds" (new R02), and the added half-plane Check (797–801) does not discriminate (new R03).

## Verified sound

**Gate.** The worker's gate at `8f9be9a` and my rerun both report every scanner at `0`, with `build=0` and the result `OK`.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at the branch pin (Tau Ceti `358314d4`, Mathlib `f6090c70`, confirmed with `git rev-parse` in the package directories) exits 0 in 39 s. It gives 61 `declaration uses 'sorry'` warnings and no other diagnostic, the same count as at `4d6e96e`. The Lean diff is a docstring change only.

**Depcheck** (`--movable`):

    depcheck: 238 roadmaps, 2320 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The changed passages add no `*Needs:*` line, supplier row or cross-roadmap citation. Their internal references (2.1, the first Check, 2.4, 6.4) resolve in this README.

**Mechanical signature check of the changed declaration.** A scratch file importing the built module, with `#check @TauCetiRoadmap.DifferentialGeometry.orientable_iff_exists_atlas`, gives `∀ {E H} … {I : ModelWithCorners ℝ E H} {M} … [FiniteDimensional ℝ E] [BoundarylessManifold I M] [IsManifold I 1 M], Orientable I M ↔ ∃ A, TauCeti.IsOrientedAtlas I 1 A`. This is unchanged and matches README 782–784, which is why R02 reads the remark at every model.

**Padding probe.** A copy of that statement with `first | rfl | (simp; done) | infer_instance | decide | exact Iff.rfl` fails with a type mismatch, so it does not close in one tactic.

**Pinned declarations opened.**
- Mathlib `Geometry/Manifold/IsManifold/Basic.lean:164–179`: `ModelWithCorners` requires only `source_eq`, convex range, nonempty interior and continuity, so a polyhedral cone is admissible. `:318` defines `ofConvexRange`.
- Mathlib `Instances/Real.lean:59–60`: `EuclideanHalfSpace n` is `{x // 0 ≤ x 0}`, so `x₀` is the boundary-defining coordinate, as the new Check says.
- Tau Ceti `Geometry/Manifold/Orientation.lean:99–102`: `OrientationPreservingOn` takes the within-`range I` derivative with positive determinant.
- Tau Ceti `Geometry/Manifold/Orientation.lean:332–341`: `IsOrientedAtlas` has the three fields the README states.

**Lee locators**, read from the cached text `67802551`:
- Proposition 15.6 (line 17594, page marker 400) covers manifolds of positive dimension with or without boundary. The converse holds when `∂M = ∅` or `dim M > 1`, and the proof reflects `x¹` because Lee's boundary charts make the *last* coordinate nonnegative (lines 17607–17613). The README's translation is right: in Mathlib's convention the coordinate to reflect is any other than `x₀`, and its warning that reflecting the first coordinate leaves the half-plane is correct.
- Theorem 17.30 (line 21190, page marker 472) states the integration isomorphism for a connected oriented smooth `n`-manifold, which in Lee is boundaryless.
- Theorem 17.34 (line 21319) is the nonorientable case and is unchanged.

**Seeded sample.** None of the eight targets falls in a changed passage. The diff has three hunks, at README 785, 787–801 and 1891–1893. "Smooth 2-forms" (358), "Canonical interfaces and reuse" (945), the two "Acceptance examples" (1067, 1587), "Conventions and existing inputs" (1382), "Henstock–Kurzweil" (1508), "Flat punctured-plane family" (1607) and "Ownership and ordering" (1622) are byte-identical to the text verified at `4d6e96e`, shifted by 9 lines after line 801. The README flags no locator as unverified.

**Citations and overlaps.** All seven leads of the citation tool are declarations of this file: `Distribution.exists_flatChart` 1059, `exists_isSliceChart_integralManifold` 1072, `exists_contMDiff_factor` 1086, `exists_leaf` 1108, `Manifold.Orientation.pullbackSign` 660, `continuous_pullbackSign` 673, `pullbackSign_mul_pullbackSign` 683. The overlap report's dropped id §5.5 is still mapped to 5.5a/5.5b at README 37–39. Its two conflicting pull requests are R04. The changed passages introduce no new object, so ownership was not searched again.

**Adversarial table.** The first six rows are new and cover the changed statements. The rest are carried from the previous review (`PRREVIEW-DifferentialGeometry~11`, read at `4d6e96e`), for statements this diff does not touch.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.2 remark, half-space `n = 2` (new) | strip `[0,1] × ℝ` over `𝓡∂ 2` | charts `(x,y)↦(x,y)` det `+1`; `(x,y)↦(1−x,y)` det `−1`; reflected `(1−x,−y)` det `+1`; transition `(u,v)↦(1−u,−v)` det `(−1)(−1) = +1` | oriented atlas exists, as Lee 15.6 says | none |
| 2.2 remark, corner model, `dim 3` (new) | cone `C` over pentagon `(0,0),(4,0),(6,3),(2,5),(−1,2)` | projective extension of the 9 non-identity dihedral permutations: fifth vertex misses its target in all 9; identity: det `1` | `Aut C = ℝ_{>0}`; mirrored corners give orientable `M` with no oriented atlas; "needed only in dimension 1" false over every model | R02 |
| 2.2 remark, `dim 1` | `Set.Icc 0 1` over `𝓡∂ 1` | chart at `0` derivative `> 0`, at `1` `< 0`; sign locally constant on connected `[0,1]` | no oriented atlas; orientation exists | none |
| 2.2 remark, `dim 0` | `E = 0` | `range I = {0} = E`, interior `E`: every manifold boundaryless; `det` on `0` is `1` | hypothesis vacuous; remark consistent | none |
| new half-plane Check (new) | half-plane over `𝓡∂ 2`; `[0,∞)` over `𝓡∂ 1` | `{id}`, det `1`; `{id}`, derivative `1` | both have an oriented atlas: no separation of the dimensions | R03 |
| 9.2 locator (new) | Lee 17.30; `n = 0`; `[0,1]` | Lee: connected oriented `n`-manifold, `∫ : H^n_c → ℝ` iso; point: `H⁰_c = ℝ`, `∫` = evaluation, iso; `[0,1]`: `[dx] = 0`, `∫ dx = 1` | statement matches; boundaryless needed | none |
| second 2.2 Check (r11) | `ℝ`, atlas `{id, t ↦ −t}` | transition derivative `−1`; `{id}` alone oriented | asks for *some* oriented atlas | none |
| `isInvolutive_iff_forall_mextDeriv` (r11) | rank `0`, rank `dim`, contact `ker(dz − y dx)` | `⊥`, `⊤`: both sides true; contact `[∂y, ∂x + y∂z] = ∂z`, `α(∂z) = 1`, `dα(Y,X) = −1` | iff holds | none |
| ⇐ direction, Hausdorff (r11) | bump `χα` at `x` | `d(χα)(X,Y)(x) = −α_x([X,Y]_x) ≠ 0` | `T2`, finite dimension used | none |
| `isInvolutive_of_forall_exists_integralManifold` (r11) | constant; contact | slices exist ✓; no integral surface | consistent | none |
| `IntegralManifold` equality Check (r11) | `j < k`, `u ↦ (u,0,c)` | `span(e₁..e_j) ⊊ span(e₁..e_k)` | excluded | none |
| `exists_flatChart` (r11) | `k = 0`; `k = dim E` | `W = ⊥`; `W = ⊤` | true | none |
| `exists_isSliceChart_integralManifold` (r11) | irrational line on `T²` | one plaque per existential `N` | true as quantified | none |
| `exists_leaf` maximality (r11) | two plaques of different leaves | meets, not contained | connectedness needed, present | none |
| `green_ac_winding` (r11) | doubled unit circle, `P = −y/2`, `Q = x/2` | `6.283185` vs `6.283185` | true; proved at `2fd255d9` | R01 |
| Ellipse gate (r11) | `a = 2`, `b = ½` | `∮ x dy = 3.141593 = πab` | true | none |
| Flat punctured family (r11) | `α = 0.7` at `(0.8,−0.3)`; unit circle | curl `0.7478685` both sides; loop `6.283185` | closed iff `α = 1` | none |
| HK gate `t² sin t⁻²` (r11) | `∫₀¹ h'`; `∫_δ^1 |h'|` | `0.841471`; `3.03, 5.97, 8.89` | HK, not Bochner | none |
| `curl` Check (r11) | `(−y,x)`, `(y,x)`, `(0,x)`, `(x,0)` | `2, 0, 1, 0` | order pinned | none |
| 3.5 `x' = s` (r11) | `s = 0.3` | `x(0.3) = 1`, `x'(0.7) = 0.7` | true | none |
| 3.3 `v = x²` (r11) | from `1` | `1/(1−t)`; `(1,1)` outside domain | law on domain | none |
| 1.3 `mextDeriv_add` (r11) | `∛x dy + (x−∛x) dy` at `0` | `0 + 0` vs `dx ∧ dy` | `C¹` needed, present | none |
| 0.1 Jacobi, 0.3 wedge (r11) | `[e₃,e₁] = e₁`; `(x dy) ∧ dx` | `e₃ ≠ 0`; `−x` | true | none |
| 5.4 radial primitive (r11) | `(1,0)`, `(x,y)`, `(−y,x)` | `x`; `(x²+y²)/2`; `0`, `dg ≠ ω` | closedness needed | none |
| 5.5a `Density`, 5.5b facet sign (r11) | `2·id`; facet `i` of `Q^n` | `(2^dim − 2^m)·toFun v = 0`; `(−1)^{i+1}` | forced; matches 5.1 | none |
| 8.3 corner 3-simplex (r11) | faces `(y−z)²,…` | Hessian along `(t,t,t)`: `−3t²` | no smooth filling | none |
| 10.3–10.4 (r11) | `zᵏ`, `z̄`, antipodal `S¹`, `S²`, `(0,∞) ↪ ℝ` | `k`, `−1`, `+1`, `−1`, `1`/`0` | compactness needed | none |
| 11.1–11.2 (r11) | great-circle homotopy; `n = 0, 1` | `(−1)^{n+1} = 1`; `v = ix` nowhere zero | `Even n` needed | none |
| 12.2–12.3 (r11) | `diag(4,1)`; `e^{2x₁}δ` | `v₁ = dx₁(v)`; `div ∂₁ = 2`, Hessian entry `1` | metric/covariant | none |
| 12.5 vs Lee 16.32 (r11) | nonorientable; compact | densities; compact support automatic | stated with route | none |
| 9.1, 7.4, two-origin line (r11) | `[0,1]`; `⊔ₙ` balls; non-`T2` | `[dx] = 0` vs `1`; `∞`-dim `H⁰`; `0` vs `ℝ` | hypotheses needed | none |
| Stokes 5.3 headline (r11) | `358314d4`; `2fd255d9` | absent; `integralTopForm_mextDeriv` proved | branch pin only | R01 |

A remark on untouched text, which asks for no change: the reflow of 9.2 leaves the line "joins any two of them" short at README 1893. It renders as one paragraph.

## Not verifiable

- As in the previous review, there is no legal copy of [Tu], [Bott–Tu] or [Milnor] for this worker. The changed passages cite only Lee, which was read.
- Ownership against the open pull requests that the brief lists without files was not checked. The changed passages add no new object.

## Source issues

- none
