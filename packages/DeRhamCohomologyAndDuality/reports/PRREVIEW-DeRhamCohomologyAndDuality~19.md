# Review of DeRhamCohomologyAndDuality (pull request #2085 at f2f197b)

**Verdict:** needs changes

This is an incremental re-review of the 10 lines of `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md` that changed since 804bdf6. `Suggested.lean` did not change, and nothing outside the folder changed.

Both README repairs are correct:

- The `### 4.2 Smooth-boundary compatibility` heading is back. Everything from it to `## Layer 5` is byte-identical to e6b4a74's.
- The Tau Ceti chart-generator bullet now describes the declaration correctly in every dimension.

One finding is left: the pull-request title and description, carried from the previous report. It needs no change in the folder.

## R01 (P3) — The pull-request title and description still contradict the head and give no order with ComplexKahlerGeometry's revision

**Location.** The title is "DeRhamCohomologyAndDuality: ComplexKahlerGeometry K6.1 is a supplier, not a consumer". The description says "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". The `<!-- merge-order -->` block is empty.

**Claim.** This head keeps main's ownership:

- K6.1 is a consumer (`README.md:1267`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1").
- §§2.4, 3.1–3.3 and 4.1 have this roadmap as their single owner (`:114–120`).

ComplexKahlerGeometry's open revision claims the same boundaryless open-pair statements and makes this roadmap their consumer. So the pull-request text says the opposite of the head, and nothing records how the two are ordered. This is the previous R02, carried. No repair report marks it as not actionable.

**Witness.** ComplexKahlerGeometry at a6ec295, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1982`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances." Main's ComplexKahlerGeometry README never mentions DeRhamCohomologyAndDuality (grep: no match). The conflict is therefore that revision's.

**Repair.** No change in the folder.

1. Rewrite the title and description to describe this head:
   - K6.1 stays a consumer.
   - Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`.
   - §2.4 is stated in `Suggested.lean`.
   - `IsTransverseAt` and the manifold Haar-null theorem are new.
   - §4.1 uses AlgebraicTopology 6.3's point generator.
   - §4.2 assumes Hausdorff `M`.
   - The Tau Ceti chart-generator bullet is scoped by dimension.
2. In the merge-order block, record that this roadmap owns §§2.4, 3.1–3.3 and 4.1 on main (main `README.md:72–76`, `:695`). ComplexKahlerGeometry's revision, when rebased, cites them here rather than owning them.

Tested: the rewritten text agrees with `README.md:1267` and `:114–120` at this head.

## Previous findings

- **R01 — repaired.** `README.md:982` is `### 4.2 Smooth-boundary compatibility`, directly before "For compact Hausdorff oriented `M` over `𝓡∂ m`, `m > 0` …". Layer 4 reads 4.1 (`:877`), 4.2 (`:982`), Examples (`:1016`), Dependencies (`:1020`).
- **R02 — not repaired.** The title still reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", while `README.md:1267` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1". This is R01 above.
- **R03 — repaired.** `README.md:337–343` now reads: "pulls back, through the preferred chart, the connecting map and radial projection, the generator of `H̃_{m−1}(S^{m−1})` selected by an orthonormal basis `b` … positive for the chart orientation … only for `m = 1` is it the zero-sphere class".

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at this head with `--base origin/main`. Every count is `0` and the run ends in `OK`. The worker's run also has `build=0`.

**Dependency check (`--movable`).** Output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**Diff outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DeRhamCohomologyAndDuality'` is empty.

**`Suggested.lean`.** It is unchanged since 804bdf6 (`git diff 804bdf6 HEAD -- …Suggested.lean` is empty).

- `lake env lean` exits 0 with exactly six `declaration uses 'sorry'` warnings, at lines 63, 83, 122, 158, 172 and 217, as in the previous report.
- The signatures, the binder check and the padding probe carry over unchanged from the previous report. No `set_option`, no `lemma`, no sorry'd data.
- The docstring's §4.2 reference (`:38`) now resolves.
- Its dimension-1 sentence (`:35–36`) agrees with the new bullet.

### Library declarations opened at the pinned Tau Ceti

All of these were `#check`ed in one scratch file that imports `…/LocalHomology/Orientation/Chart` and `…/Singular/IntervalGenerator`; it exits 0.

- `TauCeti.reducedSingularHomologySphereIsoOfOrientation` (`LocalHomology/Orientation/Chart.lean:47–50`). It is `reducedSingularHomologySphereIso R (o.finOrthonormalBasis …)`, in degree `n` with `finrank E = n + 1`, so it lives in the file the bullet names ("the same file").
- `…_eq` (`:53–60`). Any orthonormal basis `b` with `b.toBasis.orientation = o` gives the same iso, so "an orthonormal basis `b` … positive for the chart orientation" determines the class.
- `TauCeti.localOrientationOfManifoldOrientation` (`Chart.lean:202–214`). It is `(chartAt E x).localOrientationOfOrientedChart` at `l.chartOrientation x`: the preferred chart and the chart orientation, as the bullet says.
- `TauCeti.singularHomologyComplSingletonIso` (`LocalHomology/Basic.lean:170–180`). It is the chart excision iso, then the reduced connecting morphism of `(E, E ∖ {φ x})`, then `complSingletonHomotopyEquivSphere`: "the connecting map and radial projection".
- `TauCeti.reducedSingularHomologySphereIso_zero` (`AlgebraicTopology/Singular/Sphere.lean:474–481`): the zero-sphere iso at `b 0`.
- `…_succ` (`:483–490`): the suspension at `b (last)`, followed by the equator iso.
- `…_inv_ι` (`:498–503`): the class `[-b 0] - [b 0]`.
- `TauCeti.singularHomologyCubeBoundaryPairIso_one_inv`: `= -cubeRelClass`.

### Restored §4.2

The block from `### 4.2` to `## Layer 5` is byte-identical to e6b4a74's (`diff` empty), which the r17 review checked in full. Main has the same heading at `README.md:561`.

All six citations of §4.2 resolve: `README.md:21`, `:76`, `:117`, `:118`, `:937`, and `Suggested.lean:38`.

### Cross-roadmap citations

- **ComplexKahlerGeometry at a6ec295**: see R01.
- **Overlaps.** The overlaps file lists no other open pull request changing this roadmap, and no dropped or revision-only id.
- **`roadmaps resolve`** reports nothing unresolved.

The diff adds no object, so ownership is unchanged from the previous report.

### Sources

**§4.1 and §4.2.** Both are in the seeded sample and are what the diff touches. The new bullet cites no external source, only pinned Tau Ceti declarations (checked above). §4.2 cites none: its formula is the roadmap's own, from §4.1 and Tau Ceti's Stokes theorem.

**Hatcher.** Props. 1.30, 1.33 and 1.34 (`hatcher` lines 2676, 2723, 2758) were re-read; they are untouched and still match §§1.2–1.3.

**Unverified locators.** The README flags none.

### Adversarial table

**New rows, for the changed statements:**

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| B1 | Supplier bullet `:334–347`, `m = 1` | `E′ = ℝ`, standard orientation, `b₀ = 1` | `n = 0`; by `_zero` and `_inv_ι` the generator is `[−1] − [1] ∈ H̃₀(S⁰)`; under `δ[γ] = [γ(1)] − [γ(0)]` this gives `γ(0) = 1`, `γ(1) = −1`, a decreasing path, as `:344` and the §4.1 Check `:974–980` say | holds |
| B2 | Same bullet, `m = 2` | `E′ = ℝ²`, `b = (e₁, e₂)` | `n = 1`; `_succ` gives the suspension at `e₂` of the equator class `[−e₁] − [e₁]`, in `H̃₁(S¹)`, degree `1 ≠ 0`; "a class in positive degree" holds, and the old "zero-sphere generator" wording fails | holds; old text refuted |
| B3 | Same bullet, `m = 3` | `E′ = ℝ³` | the class is in `H̃₂(S²)`, degree `2` | holds |
| B4 | Same bullet, orientation reversed | `m = 1`, `−o`, so `b₀ = −1` | `_neg_hom` negates; the class is `[1] − [−1]`, the increasing path, which is AT 6.3's point generator (`:978`); sign discriminates | holds |
| B5 | Same bullet, independence of `b` | `m = 2`, `b = (e₁, e₂)` vs `b′ = (−e₂, e₁)`, both positively oriented (`det = +1`) | `_eq` gives the same iso for both | holds |
| B6 | §4.2 placement | headings at head | 4.1 `:877`, 4.2 `:982`, Examples `:1016`, Dependencies `:1020`; block equals e6b4a74's; 6 citations resolve | holds |
| B7 | §4.2 Checks (restored text, values recomputed) | `D¹`, `α = 0`, `β = c±`; `[0, 1]`, `α = dx`, `β = x` | outward-first gives `∫_{∂D¹} β = c₊ − c₋`, pairing `0 − (c₊ − c₋)`; `∫α = 1`, `∫_{∂}β = 1 − 0`, `1 − 1 = 0` | holds |
| B8 | §4.2 doubled-origin Check | `[−1, 1]` with `0`, `0′` | local images `a`, `b`, `a + b`, all equal to `s`, so `s = 0`; `H₁(M, ∂M; ℝ) ≅ ℝ²` via `H₁(M) = ℝ` and `ker(ℝ² → ℝ) = ℝ` | holds |

**Carried rows**, for statements the diff leaves untouched. They come from the previous report (r18, at 804bdf6), whose table carried r17's rows. The text is unchanged:

| r18 row | Statement | Values (r18 / r17) | Result |
|---|---|---|---|
| A1–A2 | Conventions, dimensions 1 and 2 | `∂σ = [1] − [−1]`; `det = +1` counterclockwise, swapped `−1` | agrees |
| A3 | §4.1 sign of `∫_σ` | `∫₋₂² ψ = 1`; `+½`, swapped `−½` | holds |
| A4 | §4.1 negative-control Check | `δ[γ] = [−1] − [1]`; `−1` vs `1`; `−2π` vs `2π` | correct |
| A5–A7 | §4.1 `S¹`, local step, dimension `m` | `2π = 2π`; `[2] − [−2] ⊆ N ∖ S`; distance `0.354 > 0.1` | holds |
| A9 | AT 6.3 contract | each clause found at its AT line | holds |
| A11 | §4.1 dimension 0 | `1 + 2 = 3` | holds |
| r17 1 | §1.1 local primitives | mixed partials `0` vs `1`; `φ(1/(2πn)) = −1` | holds |
| r17 2–5 | §§1.2–1.3 | `2π`, `4π`, `−2π`; `∮ dz/z = 2πi` | holds |
| r17 6–10 | §§2.1–2.2 | `a < 0.0005`; `Φ(0, x) = x + 1`; `r(0) = 0.316` | holds |
| r17 11–14 | §§2.3–2.5 | `H₁` `0` vs `ℝ`; `(ℝ, ℝ ∖ 0)`: `H₁ = ℝ`; `Q(t, t, t) = −3t²` | holds |
| r17 15–19 | §§3.1–3.3 | `−(b(1) − b(−1)) = −1`; `ℝ²/ℝ = ℝ`; `2π` | holds |
| r17 24–30 | §§5.1–5.3 | `x² + p` bad set `{0}`; `relativeTranslate = 4` | holds |

Rows A8 and A10 of r18 (the two findings it repaired) are replaced by B1–B6.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds* (`lee`).** It is recorded `uncertified` and was not read. The locators it is cited for are untouched by this diff.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** It is recorded `uncertified` and was not read. Ch. I §§5–6 are cited at §§3.1 and 4.1; the citing text is untouched.

## Source issues

- none
