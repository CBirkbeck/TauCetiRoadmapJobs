# Review of DifferentialGeometry (pull request #886 at e7464d1)

**Verdict:** needs changes

Incremental re-review of the 55 lines changed since `8f9be9a` (README 2.2's remark and Checks, the "Statements that must not enter the library" bullet on oriented atlases, and the docstring of `orientable_iff_exists_atlas`). The gate passes, `Suggested.lean` elaborates at the branch pin with `sorry` as the only warning, and the depcheck reports no problems. R02 and R03 of the previous review are repaired: the dimension-one exception is now scoped to the half-space model, the strip Check separates dimension 2 from dimension 1, and the pentagonal-cone Check is a correct negative control over a model with corners (its automorphism claim recomputed exactly below). The two carried findings are R01 and R02; neither has a repair in the folder or in the description.

## R01 (P2) — The folder is still written against two Tau Ceti revisions and conflicts with main

Re-raised: R01 (the repair report of `4d6e96e` said the repair has to wait until the branch is updated). That reason says who has to act, not that the defect is gone. Nothing in this head changes the situation, and a folder that cannot merge into main is not ready for a human's final approval.

**Location:** `lake-manifest.json` (Tau Ceti `358314d4`, Mathlib `f6090c70`, Lean `v4.35.0-rc3`); `TauCetiRoadmap/DifferentialGeometry/README.md:301–302` ("`2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules postdate the revision `358314d4` that this folder's `Suggested.lean` is written against").

**Claim:** unchanged from the previous two reviews. Layers 6–11 cite Tau Ceti modules that are missing at the branch's pin; at main's pin Tau Ceti already proves several of the file's admitted headlines; the README names git revisions, so it is not timeless.

**Witness:** `git merge-tree --write-tree HEAD origin/main` on this head lists `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3 (a content conflict). `git -C .lake/packages/TauCeti rev-parse HEAD` gives `358314d4…`; `origin/main:lean-toolchain` is `v4.36.0-rc2` while the branch's is `v4.35.0-rc3`.

**Repair:** as in the previous reviews, steps 1–4: merge `origin/main`; resolve `Suggested.lean` against main's pin, with the imports moved to `Orientation.OrientedAtlas` and to the module that now carries `sphereRoundMetric`; delete the admitted theorems and carriers that Tau Ceti `2fd255d9` proves or declares, keeping only the names consumers on main import; restate the newly statable headlines (9.2, 9.3, the 10.4 integral formula) on the native carriers, remove the two revision hashes from README 301–302 and 248, and rebuild. The first step lies outside the files a repair job may edit.

## R02 (P3) — Two other open pull requests change this folder and the description states no order

**Location:** the pull-request description (data). It names neither #334 nor #1187.

**Claim:** carried from the previous two reviews, unchanged. The overlap report computed for this head still lists both pull requests as conflicting with it.

**Witness:** the overlap report for `e7464d1`: "#334 and #886 conflict in `TauCetiRoadmap/DifferentialGeometry/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` … `lake-manifest.json`". A search of the quoted description for `#334` and `#1187` finds neither.

**Repair:** add one sentence to the description, for example "this head supersedes #334; #1187 is rebased on this head after it merges". The README must not name pull-request numbers.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; README 301–302 still reads "`2fd255d9` … postdate the revision `358314d4` that this folder's `Suggested.lean` is written against"; `git merge-tree` still conflicts in `Suggested.lean`. Carried as R01.
- R02 — repaired: README 786–792 now reads "Over the half-space model `𝓡∂ n` the hypothesis is needed only for `n = 1` … Over a general model with corners the hypothesis is needed in higher dimension as well"; the docstring at `Suggested.lean:737–743` is scoped the same way. The pentagonal-cone Check (810–826) is the requested negative control, and it is correct (the table below).
- R03 — repaired: README 802–810 replaces the half-plane with the strip `[0, 1] × ℝ` over `𝓡∂ 2`, with the two charts, the reflected chart and the transition determinant `(−1)(−1) = +1`, and names `[0, 1]` as the one-dimensional analogue with no oriented atlas.
- R04 — not repaired: the description quoted for this head names neither #334 nor #1187. Carried as R02.

## Verified sound

**Gate.** The worker's gate at `e7464d1` and my rerun (`gate … --base origin/main --build`) both report every scanner at `0`, `build=0`, result `OK`.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at the branch pin (Tau Ceti `358314d4`, Mathlib `f6090c70`, confirmed with `git rev-parse` in the package directories) exits 0 in 50 s with 61 `declaration uses 'sorry'` warnings and no other diagnostic, the same count as at `8f9be9a`. The Lean diff is a docstring change only.

**Depcheck** (`--movable`):

    depcheck: 238 roadmaps, 2320 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The changed passages add no `*Needs:*` line, supplier row or cross-roadmap citation. Their internal references (2.1, "the first Check", "the pentagonal-cone Check", 2.2's criterion) resolve in this README. `git diff --stat origin/main...HEAD` outside the folder lists nothing.

**Mechanical signature check.** A scratch file importing the built module with `#check @TauCetiRoadmap.DifferentialGeometry.orientable_iff_exists_atlas` elaborates to `∀ {E H} … {I : ModelWithCorners ℝ E H} {M} … [FiniteDimensional ℝ E] [BoundarylessManifold I M] [IsManifold I 1 M], Orientable I M ↔ ∃ A, TauCeti.IsOrientedAtlas I 1 A`, unchanged, over an arbitrary model with corners; the README's generality (782–784) is the same, and the scoped remark now makes no claim beyond it.

**Padding probe.** A copy of that statement with `first | rfl | (simp; done) | infer_instance | exact Iff.rfl` fails with a type mismatch, so it does not close in one tactic.

**Pinned declarations opened.**
- Mathlib `Geometry/Manifold/IsManifold/Basic.lean:164–170` (`ModelWithCorners`: convex range with nonempty interior, no further shape condition) and `:318–323` (`ofConvexRange` takes a `PartialEquiv` with `source = univ`, convex target, continuity both ways and nonempty interior of the target). The inclusion of the pentagonal cone `C` satisfies all five, so the Check's model exists.
- Mathlib `Geometry/Manifold/Instances/Real.lean:59–60`: `EuclideanHalfSpace n` is `{x // 0 ≤ x 0}`, so `x₀` is the boundary-defining coordinate as README 789 says.
- Tau Ceti `Geometry/Manifold/Orientation.lean:99–102` (`OrientationPreservingOn`: within-`range I` derivative with positive determinant) and `:332–339` (`IsOrientedAtlas`: subset of the maximal atlas, covering, coordinate changes in `orientationPreservingGroupoid I`). The corner Check's "derivative within `C`" is this derivative.
- `Suggested.lean:540–556` (`OrientationLift`: signs per chart, locally constant, with the within-`range I` Jacobian law) and `:630–631` (`Orientable` = `Nonempty (Manifold.Orientation I M (Fin (finrank ℝ E)))`): the Check's "orientation of `ℝ³`" is such a lift.

**Lee locator**, read from the cached text `67802551`: Proposition 15.6 (lines 17594–17599, page marker 400) states the converse under "`∂M = ∅` or `dim M > 1`", and its proof (17607–17613) reflects a coordinate and says this fails for boundary charts when `dim M = 1`. README 786–790 and the docstring now say exactly this, translated to Mathlib's convention (the boundary-defining coordinate is `x₀`, so any other coordinate is reflected).

**Pentagonal-cone computation.** With exact rational arithmetic on the five rays `(0,0,1), (4,0,1), (6,3,1), (2,5,1), (−1,2,1)`: no three rays are coplanar (every triple has nonzero determinant) and the pentagon is convex (all five consecutive orientations positive), so any four rays form a projective frame. For each of the ten dihedral permutations, the linear map sending rays 0–3 to their images, determined up to scale, was applied to ray 4: for the identity it lands on ray 4 (scales `1, 1, 1`); for the other nine it misses (for example the reflection fixing vertex 0 sends ray 4 to `(3, 0, 11/8)`, not proportional to `(4, 0, 1)`; the rotation by one step sends it to `(439/320, −11/128, 317/320)`, not to `(0, 0, 1)`). So the linear automorphisms of `C` are the positive multiples of the identity, as the Check says; a negative multiple sends `C` to `−C`.

**Seeded sample.** None of the eight targets falls in a changed passage. The diff's hunks are at README 785–827 and 2211–2212. "Smooth 2-forms" (358), "Canonical interfaces and reuse" (968), the two "Acceptance examples" (1090, 1610), "Conventions and existing inputs" (1405), "Henstock–Kurzweil" (1531), "Flat punctured-plane family" (1630) and "Ownership and ordering" (1645) are byte-identical to the text verified at `8f9be9a`, shifted by 20 lines after line 801. The README flags no locator as unverified.

**Citations and overlaps.** The seven leads of the citation tool are declarations of this file (`Distribution.exists_flatChart`, `exists_isSliceChart_integralManifold`, `exists_contMDiff_factor`, `exists_leaf`, `Manifold.Orientation.pullbackSign`, `continuous_pullbackSign`, `pullbackSign_mul_pullbackSign`), unchanged since the previous review. The overlap report's dropped id §5.5 is still mapped to 5.5a/5.5b at README 37–39. Its two conflicting pull requests are R02. The changed passages introduce no new object (the pentagonal cone is a Check instance, not a target), so ownership was not searched again.

**Adversarial table.** The first five rows are new or recomputed and cover the changed statements. The rest are carried from the previous review (`PRREVIEW-DifferentialGeometry~12`, read at `8f9be9a`, and through it `~11`), for statements this diff does not touch.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.2 remark, half-space `n ≥ 2` (changed) | strip `[0,1] × ℝ` over `𝓡∂ 2`; Lee 15.6 | charts `(x,y)↦(x,y)` on `x<1`, det `+1`; `(x,y)↦(1−x,y)` on `x>0`, det `−1`; reflected `(1−x,−y)`, det `+1`; transition `(u,v)↦(1−u,−v)` on `0<u<1`, det `(−1)(−1) = +1`; `(x,y)↦(x−1,y)` has `x−1 ≤ 0`, outside `{x₀ ≥ 0}`; Lee: converse under `∂M=∅ ∨ dim M>1` | oriented atlas exists; Check separates `n=2` from `n=1`; remark matches source | none |
| 2.2 remark, half-space `n = 1` (changed) | `Set.Icc 0 1` over `𝓡∂ 1` | chart at `0` derivative `>0`, at `1` `<0`; sign locally constant on connected `[0,1]` | no oriented atlas; orientation exists; "needed only for `n = 1`" right | none |
| 2.2 remark, corner model `dim 3` (changed) | cone `C` over `(0,0),(4,0),(6,3),(2,5),(−1,2)`; `M = (C∩B(0,1)) ∪ (q+σ(C∩B(0,1))) ∪ tube`, `|q|>2` | collinear triples: none; identity extends (scales `1,1,1`); 9 non-identity dihedral maps miss ray 4; `Aut C = ℝ_{>0}·id`; tangent cone at apex `= C` (no line), at edge/face/interior points contains a line; chart at `0` sign `+`, chart `x↦σ(x−q)` sign `det σ = −1` | orientable, connected, no oriented atlas; remark's "needed in higher dimension as well" true | none |
| 2.2 remark, `dim 0` | `E = 0` | `range I = {0} = E`: boundaryless; `det` on `0` is `1`; `𝓡∂ 0` undefined (`NeZero`) | hypothesis vacuous; remark consistent | none |
| "Statements that must not enter", oriented-atlas bullet (changed) | `[0,1]` over `𝓡∂ 1`; pentagonal `M`; `ℝ²` boundaryless | narrower: no atlas, orientable (both); agrees: `{id}` oriented | bullet's three clauses each witnessed | none |
| docstring of `orientable_iff_exists_atlas` (changed) | same three instances | as the two rows above; "no orientation-reversing linear automorphism" is implied by `Aut C = ℝ_{>0}·id` | docstring consistent with README and signature | none |
| 9.2 locator (r12) | Lee 17.30; `n = 0`; `[0,1]` | iso `∫ : H^n_c → ℝ`; `H⁰_c = ℝ`, evaluation; `[dx] = 0`, `∫ dx = 1` | statement matches; boundaryless needed | none |
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

Two remarks on the new corner Check, which ask for no change: the step "fixes the apex" is the chain rule within `C` (the within-derivative of a `C¹` coordinate change is a linear isomorphism carrying the tangent cone at a point onto the tangent cone at its image, and the apex is the only point whose cone contains no line), and the conclusion "no oriented atlas" uses 2.1's uniqueness of the orientation on connected `M` up to negation (`Suggested.lean:625`), which the Check signals by stating that `M` is connected. Both inputs are in the roadmap.

## Not verifiable

- As in the previous reviews, there is no legal copy of [Tu], [Bott–Tu] or [Milnor] for this worker. The changed passages cite only Lee, which was read.
- Ownership against the open pull requests that the brief lists without files was not checked. The changed passages add no new object.

## Source issues

- none
