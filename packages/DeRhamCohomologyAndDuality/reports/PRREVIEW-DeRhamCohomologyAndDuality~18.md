# Review of DeRhamCohomologyAndDuality (pull request #2085 at 804bdf6)

**Verdict:** needs changes

This is an incremental re-review. It covers the 77 lines of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` (`README.md`, `Suggested.lean`) that changed since e6b4a74. Nothing outside the folder changed.

The sign repair in §4.1 is correct: the point generator is now AlgebraicTopology 6.3's, and the new Checks and route compute the right values. The same commit also deleted the `### 4.2` heading. The pull-request text finding is carried again. One new P3 concerns a supplier description. The gate passes and `Suggested.lean` elaborates.

## R01 (P3) — The repair deleted the `### 4.2 Smooth-boundary compatibility` heading, so §4.2 now sits inside §4.1

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:970–978`. The new negative-control Check bullet (`:970–976`) is followed directly by "For compact Hausdorff oriented `M` over `𝓡∂ m`, `m > 0` …" (`:978`), with no heading in between.

**Claim.** The diff replaced the line `### 4.2 Smooth-boundary compatibility` with the new Check. Layer 4 now has only `### 4.1` (`:873`), followed by `### Examples` (`:1010`). The boundary formula, its Route, *Needs:* and second **Checks.** block (`:994`) therefore read as part of §4.1. They contradict §4.1's opening scope, "boundaryless manifolds `N`" (`:875`).

Six citations of §4.2 now point to no section:

- the Summary's end theorem "(4.2)", `:21`;
- `:76`, `:117`, `:118`;
- "which §4.2 uses", `:933`;
- the "not statable" list in `Suggested.lean:38`.

The gate does not catch this, because no other roadmap cites §4.2 (`roadmaps grep` finds no match).

**Witness.** Main has `### 4.2 Smooth-boundary compatibility` at `README.md:561`, and e6b4a74 has it at `:944`. In the diff, `-### 4.2 Smooth-boundary compatibility` sits directly above `+- The local generator is AlgebraicTopology 6.3's, not Tau Ceti's chart generator.`

**Repair.** Insert `### 4.2 Smooth-boundary compatibility` and a blank line before `README.md:978`.

Tested on a scratch copy: Layer 4's headings become 4.1 (`:873`), 4.2 (`:978`), Examples and Dependencies. The block from the `### 4.2` heading to `## Layer 5` is then byte-identical to e6b4a74's, and all six citations resolve.

## R02 (P3) — The pull-request title and description still contradict the head and state no order with ComplexKahlerGeometry's revision

**Location.** The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer". The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". The merge-order block is empty.

**Claim.** This head keeps main's ownership: K6.1 is a consumer (`README.md:1261`), and §§2.4, 3.1–3.3 and 4.1 have this roadmap as their single owner (`:114–120`). ComplexKahlerGeometry's open revision claims the same boundaryless open-pair statements and makes this roadmap their consumer. The pull-request text says the opposite of the head, and records no resolution.

This is the previous R02, carried. No repair report marks it as not actionable.

**Witness.** ComplexKahlerGeometry at a6ec295, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1982`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances."

**Repair.** No change in the folder.

- Rewrite the title and description to describe this head:
  - K6.1 stays a consumer.
  - Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`.
  - §2.4 is stated in `Suggested.lean`.
  - `IsTransverseAt` and the manifold Haar-null theorem are new.
  - §4.1 uses AlgebraicTopology 6.3's point generator.
  - §4.2 assumes Hausdorff `M`.
- In the merge-order block, say that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here. This roadmap owns them on main (main `README.md:72–76`, `:695`).

Tested: the rewritten text agrees with `README.md:1261` at this head.

## R03 (P3) — The new supplier bullet says `localOrientationOfManifoldOrientation` pulls back the zero-sphere generator in every dimension `m ≥ 1`

**Location.** `README.md:334–339`: "…`E′` an inner-product space of dimension `m ≥ 1`, `TauCeti.localOrientationOfManifoldOrientation` …, which pulls the zero-sphere generator `[−b₀] − [b₀]` (`TauCeti.reducedSingularHomologySphereIso_inv_ι`, …) back through the connecting map and radial projection."

**Claim.** That holds only for `m = 1`. For `m ≥ 2` the declaration pulls back the generator of `H̃_{m−1}(S^{m−1})` selected by a positively oriented orthonormal basis. The zero-sphere class does not appear there.

**Witness.**

- `LocalHomology/Orientation/Chart.lean:47–50`: `reducedSingularHomologySphereIsoOfOrientation R o hE := reducedSingularHomologySphereIso R (o.finOrthonormalBasis …)`, on `reducedSingularHomologyFunctor R n` of the unit sphere, with `n + 1 = m`.
- `Sphere.lean:487–492`: for `n + 1`, this is the suspension at `b (last)`.
- For `E′ = ℝ²` the pulled-back class lies in `H̃₁(S¹)`.

**Repair.** Replace "which pulls the zero-sphere generator … radial projection." with:

"which pulls back, through the connecting map and radial projection, the generator of `H̃_{m−1}(S^{m−1})` selected by a positively oriented orthonormal basis `b` (`TauCeti.reducedSingularHomologySphereIsoOfOrientation`), for `m = 1` the zero-sphere class `[−b₀] − [b₀]` (`TauCeti.reducedSingularHomologySphereIso_inv_ι`, `AlgebraicTopology/Singular/Sphere.lean`)."

Tested: both names elaborate at the pin (scratch `#check`). For `m = 1`, `n = 0`, and `Sphere.lean:470–481` reduces the iso to the zero-sphere iso at `b 0`, as the dimension-1 sentence that follows says.

## Previous findings

- **R01 — repaired.** `README.md:879–886` now reads: "AlgebraicTopology 6.3's point generator: pull `o` back to the Euclidean rechart … take there the class of an affine simplex `[v₀, …, vₘ]` … with `(v₁ − v₀, …, vₘ − v₀)` positively oriented … It is not Tau Ceti's chart generator". The repair introduced R01 and R03 above.
- **R02 — not repaired.** The title still reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", while `README.md:1261` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4,…". This is R02 above.

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at this head with `--base origin/main`. Every count is `0`, ending in `OK`; the worker's run also has `build=0`.

**Dependency check (`--movable`).** Output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**`Suggested.lean`.** `lake env lean` exits 0 with exactly six `declaration uses 'sorry'` warnings, at lines 63, 83, 122, 158, 172 and 217. These are the previous six, shifted by the one added docstring line.

- Only the module docstring changed (`:36–37`), and its new clause is correct (row A4 below).
- The declarations, their elaborated signatures and the padding probe are unchanged from the previous report: no lost binder beyond the harmless `[NormedSpace ℝ _]` on `incidenceEquation`, and no padding.
- No `set_option`, no `lemma`, no sorry'd data.

### Library declarations opened at the pinned Tau Ceti (2fd255d)

All of these were `#check`ed in one scratch file that imports the four modules; it exits 0.

- `TauCeti.localOrientationOfManifoldOrientation` (`Chart.lean:202`). It takes `[T2Space M]`, `InnerProductSpace ℝ E`, `FiniteDimensional`, `IsManifold 𝓘(ℝ, E) 1 M` and `finrank = n + 1`, matching the bullet's "Hausdorff boundaryless … over `𝓘(ℝ, E′)`, `m ≥ 1`". It is `chartAt` composed with `localOrientationOfOrientedChart` (`:169–175`), which is `(singularHomologyComplSingletonIsoOfOrientation …).inv 1`.
- `TauCeti.reducedSingularHomologySphereIso_inv_ι` (`Sphere.lean:498`): the class `[-b 0] - [b 0]`.
- `TauCeti.singularHomologyCubeBoundaryPairIso_one_inv` (`IntervalGenerator.lean:295`): it equals `-cubeRelClass`, the simplex from `1` to `0`. Its docstring at `:14–20` gives the connecting map on the standard simplex as `[1] − [0]`.
- `TauCeti.HomologicalOrientation.eq_fundamentalClassOn` (`FundamentalClass.lean:150`): uniqueness from local images on a compact `A`, with `T2Space M`.
- `eq_fundamentalClass`, `realFundamentalClass`, `localHomologyRestriction_fundamentalClassOn_of_subset`: their types are as the README states.
- Tau Ceti's simplex integral (`SmoothSingular/Integral.lean:18–23`, `Geometry/Convex/FullSimplex.lean:85–110`) is over `Δᵖ ⊆ ℝᵖ` with vertex 0 at the origin and vertex `i` at `eᵢ`. So the affine map of `[v₀, …, vₘ]` has Jacobian `(v₁ − v₀, …, vₘ − v₀)`, and "orientation-preserving parametrization … with sign `+1`" is right.

### Cross-roadmap citations resolved

**AlgebraicTopology 6.3 on main** (3090489, `TauCetiRoadmap/AlgebraicTopology/README.md`):

- `:1285–1286`: the point generator is the signed ordered-simplex identity class under the chart pair map.
- `:1312–1314`: `chartSimplexSupportClass_signed_local_image_pointGenerator` holds "on the whole interior".
- `:1349–1350`: in dimension `0`, `pointGenerator = orientationSignAt • positivePointClass`.
- `:1423`, `:1461`: `∂[D¹] = [+1] − [−1]`.
- `:1423–1424`: `∂_*[D², S¹] = [S¹]` counterclockwise.
- `:1434–1440`: the Euclidean rechart along `e`, `embeddingIntegralLocalMap`, and independence of `e`.

The new contract (`README.md:367–378`) and the §4.1 statement claim exactly these.

**ComplexKahlerGeometry** at a6ec295: `:1979–1982`, see R02.

The overlaps file lists no dropped or revision-only id. `roadmaps resolve` reports nothing unresolved.

### Ownership

The diff adds no new object, only a convention and Checks on existing carriers. Ownership is unchanged from the previous report; R02 is the only two-owner conflict.

### Adversarial table

**New rows, for the changed statements:**

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| A1 | Conventions `:153–158`, dimension 1 | `D¹ = [−1, 1]`, `σ(t) = 2t − 1` | `∂σ = σ∘δ₀ − σ∘δ₁ = [1] − [−1]`; AT 6.3 `:1461` says `[+1] − [−1]` | agrees |
| A2 | Conventions, dimension 2 | `[0, e₁, e₂]`; `[0, e₂, e₁]` | `det = +1`, boundary `0 → e₁ → e₂ → 0` counterclockwise, matching AT 6.3 `:1423–1424`; swapped gives `det = −1`, clockwise | agrees; discriminates |
| A3 | §4.1 route, sign of `∫_σ` | `t ↦ 4t − 2`; `[0, e₁, e₂]` with `dx∧dy` | `∫₀¹ ψ(4t − 2)·4 dt = ∫₋₂² ψ = 1`; `+½` (swapped `−½`), from `FullSimplex.lean` vertex 0 = origin | holds |
| A4 | Negative-control Check `:970–976`, `Suggested.lean:36–37` | `ℝ`, `b₀ = 1`, `γ` from `1` to `−1` | `δ[γ] = [γ(1)] − [γ(0)] = [−1] − [1]`, equal to the generator; `z/\|z\|` fixes `±1`; so the native class is the decreasing path; with it `[ℝ]_K = [2 − 4t]` and the pairing is `∫₀¹ ψ(2 − 4t)(−4) dt = −1` against `∫ψ = 1`; `S¹`: `−2π` against `2π` | Check correct |
| A5 | §4.1 `S¹` Check `:954–956` | `σ(t) = e^(2πit)`; reversed | `∂σ = σ(1) − σ(0) = 0`; `θ = 2πt` increasing; `∫₀¹ 2π dt = 2π = ∫ dθ`; reversed `−2π` both sides | holds |
| A6 | §4.1 local step `:914–921` | `N = ℝ`, `S = [−1, 1]`, `σ = 4t − 2`; `σ = 2t − 1` | `∂σ = [2] − [−2] ⊆ N ∖ S`, a relative cycle; local image at `0` is the increasing path, so `[σ] = μ_S` by `eq_fundamentalClassOn`; pairing `1 = 1`; `2t − 1` has `∂ = [1] − [−1] ⊄ N ∖ S`, not a cycle | holds |
| A7 | §4.1 dimension `m`, positive, with `S ⊆ int σ` in one oriented chart | `ℝ²`, `S` = disc of radius `0.1` at `(0.25, 0.25)`, `σ = [0, e₁, e₂]` | distance from centre to hypotenuse `x + y = 1` is `0.5/√2 ≈ 0.354 > 0.1`, so `S ⊆ int σ`; the local image is `+` the point generator (`det = 1`) | holds |
| A8 | Supplier bullet `:334–339` | `m = 1`; `m = 2`, `E′ = ℝ²` | `H̃₀(S⁰)` class `[−b₀] − [b₀]`, as stated; `H̃₁(S¹)` generator, not a zero-sphere class | R03 |
| A9 | AT 6.3 contract `:367–378` | the AT 6.3 lines above | point generator, interior local images, `ε_o(x)[x]`, `∂[D¹]`, independence of `e`: each found at its line | holds |
| A10 | §4.2 placement | headings at head against main and e6b4a74 | head: 4.1 then Examples; main `:561` and e6b4a74 `:944` have 4.2; six citations unresolved | R01 |
| A11 | §4.1 dimension 0, untouched text, re-run with the new generator | `ℤ`, `K = {0, 1}`, `η = 1, 2` | class `[0] + [1]`; `1 + 2 = 3` both sides | holds |

**Carried rows**, for statements the diff leaves untouched. Each is from the previous report's table (r17, at e6b4a74); the values were recomputed there and the text is unchanged:

| r17 row | Statement | Values (r17) | Result |
|---|---|---|---|
| 1 | §1.1 local primitives | `x dy`: mixed partials `0` vs `1`; `d(x² sin(1/x))`: `φ(1/(2πn)) = −1` | holds |
| 2–3 | §1.2 integral; vs `pathClassIntegral` | `2π`, `4π`, `−2π`; `3`; ours `1` vs junk `0` | holds |
| 4–5 | §1.3 Lean; holomorphic Check | `S¹` loop `2π`, excluded; `∮ dz/z = 2πi` | holds |
| 6–7 | §2.1 cone, local field | parabola: `v ∈ cone` iff `a < 0.0005`; `ball(z, ε₀) ⊆ C` | holds |
| 8–10 | §2.2 Lean, persistence, quadrant | `Φ(0, x) = x + 1`; `r(0) = 0.316`; `a = −t` | holds |
| 11 | §2.3 transfer | `S¹` against a point: `H₁` `0` vs `ℝ` | hypothesis necessary |
| 12 | §2.4 Lean | `(ℝ, ℝ ∖ 0)`: `H₁ = ℝ`, `H₀ = 0`; graph `W`: openness necessary | holds |
| 13–14 | §2.5 route, Checks | `ε/2 + ε/2`; `r(3, 4) = (0.6, 0.8)`; `Q(t, t, t) = −3t²` | holds |
| 15–18 | §3.1 sign, §3.2 lift, evaluation, cocone | `−(b(1) − b(−1)) = −1`; `1 − (1 − 0) = 0` | holds |
| 19 | §3.3 | `ℝ²/ℝ = ℝ`; `2π` | holds |
| 22–23 | §4.2 formula, doubled origin (text untouched, heading lost: R01) | `3 = 3`; `1 − 1 = 0`; `a = b = a + b = s` forces `s = 0` | holds |
| 24–30 | §§5.1–5.3, `IsTransverseAt`, `relativeTranslate`, corners | `x² + p` bad set `{0}`; translates `x²(1 + p)` all bad; `relativeTranslate = 4` | holds |

Row 20 (§4.1 with Tau Ceti's native generator) is replaced by A3–A7 and A11; row 21 is A11.

### Sources

§4.1 is in the seeded sample. Its new text cites no new source: the generator convention is AlgebraicTopology 6.3's (checked above), and [Bott–Tu, §5] is unchanged (*Not verifiable*). Hatcher Props. 1.30, 1.33 and 1.34 (`hatcher` lines 2676, 2723, 2758) were checked in the previous report, and those passages are untouched.

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds* (`lee`).** It is recorded `uncertified` in the manifest and was not read. The locators it is cited for (Prop. 2.28, Thms. 6.35, 6.36, 9.24–9.26, 18.7 and 18.14, Ch. 11) are untouched by this diff.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** It is recorded `uncertified` and was not read. Ch. I §5 is cited at §4.1 and §6 at §3.1.

## Source issues

- none
