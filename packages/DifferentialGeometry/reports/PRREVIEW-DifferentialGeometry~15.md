# Review of DifferentialGeometry (pull request #886 at 3d4316f)

**Verdict:** needs changes

This is a full review of `3d4316f`. The previous review read `e7464d1`, and the folder has changed by 323 lines since then. Two of the previous findings are repaired:

- the slice theorem (r14 R02);
- the *Needs:* lines, the Checks and *Downstream consumers* (r14 R05).

The padding finding (r14 R03) is now justified only on the branch, so it is folded into R01. One finding remains blocking: R01, the stale pin and the conflict with main. Since last round it has grown, because main's Tau Ceti now also declares this file's flow, gradient, Laplacian, simplex and orientation carriers. Two P3 findings remain:

- the 2.3 definition has no Checks (R02);
- the description still states no order against #334 and #1187 (R03).

The gate passes. `Suggested.lean` elaborates with `sorry` as its only warning. The dependency check reports no problem.

## R01 (P2) — Written against Tau Ceti `358314d4`; main pins `2fd255d9`, which proves or declares much of this file, and `Suggested.lean` conflicts with main

Re-raised: H01 (and H02). The reply says that merging main is outside a repair job's files, and that the revision passages should change together with that rewrite. Both statements are true, but they only say who has to act. The folder still cannot merge, and its acceptance test still admits theorems that main's pinned library proves. So the finding stands, and it needs the worker or a human.

**Location.**

- `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and Lean `v4.35.0-rc3`, unchanged since the merge base `4dffb5d`.
- `TauCetiRoadmap/DifferentialGeometry/README.md:300–303` reads: "cited at Tau Ceti `2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules postdate the revision `358314d4` that this folder's `Suggested.lean` is written against".

**Claim.** Main (`3f7196b`) pins Tau Ceti `2fd255d9` with Lean `v4.36.0-rc2`, and it adapted this folder's `Suggested.lean` in `a891cd19`.

What Tau Ceti has at `2fd255d9`:

- **Admitted theorems already proved.** 22 of this file's 60 admitted declarations share their names with sorry-free Tau Ceti theorems, and so does the proved `isCompleteVectorField_of_compactSpace`. Examples: `wedgeWith_flip`, `wedgeWith_assoc`, `bracketWedge_jacobi`, `mextDeriv_mextDeriv`, `mpullback_mextDeriv`, `mextDeriv_apply_one`, `Manifold.Orientation.ext`/`eq_or_eq_neg` (`Orientation/Basic.lean:164`, `:172`), `orientable_of_forall_index_ne_two`, `exists_timeDependentFlow`, `green_ac_winding`, `green_ac_index_one`, `hessian_symm`, `integral_divergence_eq_zero` and `integral_mul_laplaceBeltrami`.
- **Carriers this file defines.** Tau Ceti declares `flowOf` (`Geometry/Manifold/Flow/Basic.lean:62`), `mgradient` (`Riemannian/Gradient/Basic.lean:73`), `divergence`, `hessian` and `laplaceBeltrami` (`Riemannian/Laplacian.lean:55`, `:135`, `:238`), `fullSimplex` and `fullSimplexEquivStdSimplex` (`Geometry/Convex/FullSimplex.lean:44`, `:85`), `OrientationLift` (`Orientation/Lift.lean:52`), `Orientation` (`Orientation/Basic.lean:32`) and `IntegralManifold` (`Distribution/IntegralManifold.lean:139`).
- **5.1 and 5.2.** Tau Ceti also declares 5.2's `integralTopForm` (`DifferentialForm/Integration/TopForm.lean:518`) and 5.1's boundary orientation (`Boundary/InducedOrientation.lean`).

Every file listed has 0 occurrences of `sorry`.

As a result, these README statements are false at main's pin, and the README's revision hashes are process narrative:

- "the pinned Tau Ceti has no manifold gradient of its own" (README 385);
- the 0.4 migration described at 358–366: `TwoForm/Basic.lean:37` already reads `abbrev SmoothTwoForm … := SmoothForm …`;
- the module docstring's "not statable" list (`Suggested.lean:45–65`).

The two non-target lemmas kept for a consumer, `isCompleteVectorField_of_compactSpace` (one `simp`, `Suggested.lean:837–845`) and `toFlow_apply` (`rfl`, `:873–876`), are consumed only by the branch's copy of MorseNovikov (its `Suggested.lean:13`, `:220`, `:224`). Main's MorseNovikov `Suggested.lean` imports only `Mathlib`. After the merge the two lemmas are padding.

**Witness.** `git merge-tree --write-tree HEAD 3f7196b9` lists `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3. At `2fd255d9`, `TauCeti/Analysis/Green/Winding.lean:30` proves `green_ac_winding` with exactly the hypotheses and conclusion of `Suggested.lean:1382–1391`.

**Repair.**

1. Merge `origin/main`. This is the worker's or a human's step, because it rewrites `lake-manifest.json`, `lean-toolchain` and other folders.
2. Resolve `Suggested.lean` against `2fd255d9`, starting from main's adapted copy.
   - Delete every admitted theorem that Tau Ceti proves.
   - Delete every definition that Tau Ceti declares (the list above). Cite each by name and file under *From Tau Ceti*.
   - Keep, as aliases of the native declarations, only the names that main's importers use: `Manifold.Orientation` with `.pullback`, `.neg` and `.ext`, `OrientationLift` with `.setoid`, and `orientationAt`, used by AlgebraicTopology's `GeneralModelOrientation.lean` and `OrientationComparison.lean`; `fullSimplex` and `fullSimplexEquivStdSimplex`, also used by `OrientationComparison.lean`; `Density`, `SmoothForm` and `Manifold.Orientation.ext`, used by ComplexKahlerGeometry; and `RoughForm`, `RoughForm.ofFunction`, `SmoothForm` and `mextDeriv`, used by ContactGeometry.
   - Restate layer 4 on `TauCeti.IntegralManifold`.
3. Delete `isCompleteVectorField_of_compactSpace` and `toFlow_apply`. Name the first in README 3.3 as Tau Ceti's `isCompleteVectorField_of_compactSpace` (`Geometry/Manifold/Flow/Complete.lean:154`). Write the second as prose.
4. On the native carriers, state the headlines that become statable: Stokes 5.3, the de Rham theorem 8.5, 9.2, Poincaré duality 9.3 and the 10.4 integral formula. Then shorten the docstring's "not statable" list to what is still missing.
5. Move 5.1's boundary orientation and 5.2's integral to *From Tau Ceti*. Both have no Checks here, and Tau Ceti now carries both.
6. Replace the revision passages with "the pinned Tau Ceti": README 44–52, 248–253, 300–317 and 1041–1044. Delete the gradient sentence at 385.
7. Rebuild. Repaired means that `git merge-tree` reports no conflict and that the targeted build passes at `2fd255d9`.

## R02 (P3) — 2.3's induced smooth structure on a covering space has no Checks

**Location.** README 879–884: "**2.3 Smooth structures on covers.** The charted structure induced on the total space by a covering map `p`, a constructor and ⚠ never an instance on the type".

**Claim.** 2.3 is a definition with an API (lifted charts, the local-diffeomorphism property, uniqueness and smoothness of lifts), but it has no **Checks.** list. Nothing computes a lifted chart, and nothing exhibits the dependence on `p` that its ⚠ asserts. No Tau Ceti constructor for this structure exists at either pin, so 2.3 stays a target after R01.

**Witness.** The map `t ↦ exp(i t³)`, from `ℝ` to `S¹`, is a covering map, because the cube is a homeomorphism of `ℝ`. Its lifted charts are locally `s ↦ s³ + c`. In charts, the identity of `ℝ` from this structure to the standard one reads `u ↦ u^(1/3)`, which is not differentiable at `0`.

**Repair.** Add to 2.3:

**Checks.**
- `p(t) = exp(it)` from `ℝ` to `S¹`: the lifted chart at `t` is the angle chart of `S¹` at `p(t)` composed with the local inverse of `p`, that is `s ↦ s + c`. The induced structure is the standard one: the identity is smooth both ways, and `p` has differential `1` in these charts.
- `p(t) = exp(i t³)` is also a covering map `ℝ → S¹`. Its lifted charts are locally `s ↦ s³ + c`, so the identity from the induced structure to the standard one is `u ↦ u^(1/3)` in charts, which is not differentiable at `0`. The structure depends on `p`, so it cannot be an instance on the type.
- `p(z) = z²` on `S¹`: the induced structure on the source is the standard one, and `p` is a local diffeomorphism whose differential is multiplication by `2z ≠ 0`. A continuous lift through `p` of the smooth map `f(z) = z²`, namely the identity, is smooth, as the smooth-lift statement requires.

## R03 (P3) — Two other open pull requests change this folder, and the description states no order

Re-raised: H06. The reply says that the description is outside the job's files. The worker or the author can still edit it, and the overlap report for this head still lists both conflicts.

**Location.** The pull-request description (data). It contains neither `334` nor `1187` (0 matches).

**Claim.** #334 replaces this folder. #1187 bumps Tau Ceti to `ab00ba392`, which is an ancestor of main's `2fd255d9`. Both conflict with this head in `README.md` and `Suggested.lean`, and #1187 also conflicts in `lake-manifest.json`.

**Witness.** Overlap report for `3d4316f`: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`".

**Repair.** Add one sentence to the description, not to the README:

> This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main (R01).

## Previous findings

- **r14 R01: not repaired.** The pin is unchanged and the conflict persists against `3f7196b`. Re-raised as R01, extended by the carriers native at `2fd255d9`.
- **r14 R02: repaired.** `Suggested.lean:1089–1092` now reads "`∃ … (P : AffineSubspace ℝ E), … Module.finrank ℝ P.direction = k ∧ ContMDiffOn I 𝓘(ℝ, E) ∞ e e.source ∧ ContMDiffOn 𝓘(ℝ, E) I ∞ e.symm e.target ∧ TauCeti.IsSliceChart e (P : Set E) …`". README 4.3 (1106–1144) matches it and adds four Checks. Taking the old witness `S := e '' (e.source ∩ A)` no longer typechecks as an affine subspace of dimension `k` in general. The positive Check elaborates (table).
- **r14 R03: partly repaired, and folded into R01.** `isCompleteVectorField_of_compactSpace` is now proved by one `simp` instead of being deleted, and `toFlow_apply` is kept. The reply (H05) is right that the branch's MorseNovikov consumes both. Main's MorseNovikov does not, so both go when main is merged (R01 step 3).
- **r14 R04: not repaired.** Re-raised as R03.
- **r14 R05: repaired.**
  - A *Needs:* line now ends every target of layers 0–5.6 and 12, and 10.2 (`grep -c '\*Needs:\*'`: 49).
  - 5.5b has five face Checks (1471–1492), and 12.4 has four volume Checks (2272–2284). Their values are recomputed in the table.
  - `## Downstream consumers` (2451–2493) lists 39 roadmaps. All 39 exist on main, and the 14 that I sampled cite this roadmap at the sections listed.

## Verified sound

**Gate.** My rerun of `gate … DifferentialGeometry --base 3f7196b9` reports every scanner at `0` and `OK`. The worker's run, with the targeted build, has `build=0`. `git diff --stat 3f7196b9...HEAD` lists nothing outside the folder.

**Dependency check** (`--movable`):

    depcheck: 237 roadmaps, 2309 edges, 0 problem(s)

It prints no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at the branch pin exits 0 in 66 s, with 60 `declaration uses sorry` warnings and no other diagnostic. All twelve imported `TauCeti.*` object files were present.

**Mechanical signature check.** A scratch copy with `#check @…` for all 121 declarations exits 0. Against the README:

- `exists_isSliceChart_integralManifold` carries `[IsManifold I 1 M] [FiniteDimensional ℝ E] [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]`, as 4.3 states.
- `isCompleteVectorField_of_compactSpace`, `toFlow` and `toFlow_apply` carry `[T2Space M] [BoundarylessManifold I M] [CompleteSpace E]`.
- `exists_flowOf_one_eq` carries `[FiniteDimensional ℝ E]` and omits `CompleteSpace`.
- `halfSpaceBoundaryVolume` carries all eleven section instances.

No definition lost a binder.

**Padding probe.** I replaced each of the 60 admissions with `first | rfl | (simp; done) | infer_instance | (simp_all; done) | (norm_num; done)` in a scratch copy. This gives 60 errors at 60 distinct lines, so no admitted declaration closes in one tactic. The two one-step closures are in R01.

**Seeded sample (8 passages; the README flags no locator as unverified).**

1. **"Smooth 2-forms" (358).** At the branch pin, `TwoForm/Basic.lean:61` declares `structure SmoothTwoForm` and `TwoForm/Closed.lean:296` defines the chartwise `IsClosed`, and `IsSymplectic` is in `Symplectic/Manifold/TwoForm.lean`. The passage is accurate at the branch pin and out of date at main's pin (R01).
2. **"Canonical interfaces and reuse" (1017).**
   - `IsDistributionFrameOn` (`Distribution.lean:87`).
   - `IsContMDiffDistribution` (`:163`): local frames of `k` fields.
   - `IsInvolutiveDistribution` (`:236`): fields that are `MDiff[U]` on an open `U`, as the passage says.
   - `Foliation` (`Foliation/Basic.lean:63`).
   - `IsInvolutiveDistribution.exists_eventually_hasFDerivAt` in `Distribution/Graph.lean`, which imports `Analysis/ODE/Frobenius.lean`.
3. **"Acceptance examples", layer 4 (1167).** The pin's convention is `v.2.2 = p.1 * v.2.1`, that is `ker(dz − x dy)` (`Distribution.lean:345–346`). Pulling back along `S(x,y,z) = (y,x,z)` gives `dz − y dx`. `not_isInvolutiveDistribution_standardContactDistribution` is at `:399`.
4. **"Acceptance examples", layer 5.6 (1740).** All values are computed in the table: ellipse, `θ = 2π√t`, weak field and the HK gate.
5. **"Conventions and existing inputs" (1524).**
   - `curveIntegral_eq_intervalIntegral_deriv` (`CurveIntegral/Basic.lean:145`).
   - `IntegrationParams.Henstock` (`BoxIntegral/Partition/Filter.lean:244`).
   - `IntegrableOn.hasBoxIntegral` (`BoxIntegral/Integrability.lean:198`).
   - `AbsolutelyContinuousOnInterval` (`AbsolutelyContinuous.lean:154`).
   - `TauCeti.Contour.windingNumber` (`Winding/Number/Basic.lean:76`).
   - The circulation integrand agrees with `circulationFun`.
6. **"Henstock–Kurzweil" (1655).** `hasIntegral_GP_pderiv` (`BoxIntegral/DivergenceTheorem.lean:151–159`) is stated for `GP` with a countable exceptional set. Mathlib's own remark (`Filter.lean:78`) says that in dimension one `GP` generates the same filter as `Henstock`. This supports the stated one-dimensional equivalence.
7. **"Flat punctured-plane family" (1760).** Computed in the table.
8. **"Ownership and ordering" (1775).** On main:
   - `Completed/ContourIntegration` and `Completed/ConformalMapping` exist, and ConformalMapping's Layer 5 lists `TauCeti.filledHull` (README 25, 260–264).
   - PDE's Green kernels are at 496, 578 and 583.
   - ModularForms' Petersson product is at 17 and 206.
   - Every relative link resolves.

**Library names in the new *Needs:* lines.** I resolved the 134 backticked tokens of the added lines. Every Mathlib and Tau Ceti name resolves at the branch pin; I opened the declaration for each that a plain search missed: `ContinuousLinearMap.compContinuousAlternatingMap` (`Topology/Algebra/Module/Alternating/Basic.lean:324`), `IsLocalDiffeomorph.mfderivToContinuousLinearEquiv` (`Geometry/Manifold/LocalDiffeomorph.lean:461`), `maximalIntegralCurve_add` (`IntegralCurve/Flow.lean:106`) and `Bundle.ContMDiffRiemannianMetric.contMDiffAt_pullback` (`Riemannian/Pullback.lean:113`). The only exceptions are the layer 10 names `TauCeti.IsNullSet`, `TauCeti.IsRegularPoint` and `TauCeti.isNullSet_image_criticalPoints`, which exist only at `2fd255d9` (`Geometry/Manifold/Measure.lean`, `Sard/EqualDimension.lean`). That is consistent with the README's statement that layers 6–11 are cited at main's pin, and it is part of R01. Every file path cited in the new *Needs:* lines exists at the pin: 13 Mathlib and 9 Tau Ceti.

**Cross-roadmap citations resolved (on main `3f7196b`, or at the open head where given).**

- HeegaardFloer F2 and F0.S = §2.1 (README 20, 46, 71).
- SmoothBundlesConnections B5, which consumes 3.5 (its 200, 1082, 1113).
- ComplexKahlerGeometry K5a (33).
- PseudodifferentialOperators P1.0 (12).
- AlgebraicTopology 6.3 and 6.5 (86–88).
- Isoperimetry I6 (397).
- GeometricMeasureTheory G1, G6 and the DG interfaces (64, 137, 288, 299).
- `Completed/HopfRinow`, `Completed/UniversalCovers`, `Completed/OneParameterSemigroups`, DGAInfinity and RepresentationTheory/LieGroups.
- DeRhamCohomologyAndDuality at its open head `420558d8`: §2.1 strict inward cone, §2.2 semiflow and inward domination, §4.1 integration comparison, Layers 1–5. Its *From DifferentialGeometry* (161–177) consumes layers 0–2, 5.1–5.3, 6, 8 and 8.5, and nothing here consumes it.
- The overlap report's dropped id §5.5 (LocalVariationalFieldTheory on main, ConvexityToric, StringOrientation) is mapped to 5.5a and 5.5b at README 37–39.
- The citation tool's seven leads are all declarations of this file.
- GeometricMeasureTheory and this roadmap cite each other. At target level the edges are G1 → 5.6.1 and 5.6/12.5 → G6, with no cycle, and GMT README 139–140 states that G1 uses none of this roadmap's integral comparisons. The structure predates this pull request (main's DG README 995).

**Ownership against open pull requests.** I compared against the sibling heads closest in vocabulary: DeRhamCohomologyAndDuality, ComplexKahlerGeometry (head of #1234), GlobalHolomorphicFunctions, RiemannianGeometry (#1683), MorseTheory (#1682), CalibratedGeometry (#946) and SpinGeometry (#1780). None claims a target that this roadmap owns. RiemannianGeometry consumes `TauCeti.Manifold.laplaceBeltrami` (its README 97, 229), which is the native carrier of R01. The CKG heads #1807, #1854 and #1808 were not given with files, so they were not checked.

**Headline theorems** (README 13–18).

- At the branch pin, these are stated: the Banach flows (3.1–3.2), Frobenius and leaves (4.2–4.4), Green for AC cycles (5.6.3), the hairy ball theorem (11) and the divergence theorems (12.5).
- These are named in the docstring as not statable, with the missing carriers: Stokes 5.3 and 5.5b, de Rham 8.5, 9.2–9.3 and the degree formula (10.3–10.5). That is correct at `358314d4` and false at `2fd255d9` (R01).

**Adversarial table** (every value below was computed in this review).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `exists_isSliceChart_integralManifold` (repaired) | `span e₁` on `ℝ²`, `e = refl`, `P₀ = mk' 0 (ker snd)`; irrational leaf on `T²`; rank 0 | scratch Lean: `IsSliceChart refl P₀ (range (u ↦ (u,0)))` and `finrank P₀.direction = 1` both elaborate (exit 0); the leaf's chart image is dense, so it lies in no line; rank 0: `{e x} = target ∩ {e x}` | true, non-vacuous | none |
| `isCompleteVectorField_of_compactSpace`, `toFlow_apply` | branch vs main consumers | branch MorseNovikov `:220`, `:224` use both; main MorseNovikov imports `Mathlib` only; native `Flow/Complete.lean:154` | padding after merge | R01 |
| headlines vs main pin | 60 admissions | 22 names proved sorry-free at `2fd255d9`; `green_ac_winding` identical; merge stages 1/2/3 | stale pin | R01 |
| 2.3 cover structure | `exp(it)`, `exp(it³)`, `z²` | lifted charts `s+c`, `s³+c`; identity reads `u^(1/3)` at `0` | no Checks | R02 |
| 5.5b facet signs on `Q²` | outward-first determinants | `det(−e₀,e₁) = −1`, `det(−e₁,e₀) = +1`; corner endpoints `+1`, `−1` | matches `(−1)^(i+1)`; lifts cancel | none |
| 5.5b product signs on `[0,1]²` | `ω = y dx` | `∫dω = −1.0`; top edge leftward `−1.0`; without `(−1)^m`: `+1`; `det(e₂,−e₁) = +1` | holds | none |
| 5.5b fibres | `Q²` at `(0,t)`, `(t,0)`, `(0,0)`; square corners | `1, 1, 2`; `2` at the corners | holds | none |
| 5.1 half-space sign | boundary chart `x ↦ (0,x)` (`Boundary/Model.lean:83`) | `det(−e₀,e₁,…) = −1` in every dimension (Lee's last-coordinate rule: `(−1)ⁿ`); half-plane boundary oriented by `−e₁`: `det(−e₀,−e₁) = +1` | consistent with 5.5b facet 0 and the square's left edge | none |
| 12.4 volume Checks | `diag(4,1)`; `X = x∂ₓ+y∂ᵧ`; `e^{2x}δ`, `X = ∂ₓ` | `√det g = 2.0` (vs `4`, `1`); `d(x dy − y dx) = 2dx∧dy`, `div = 2`; finite-difference `div = 2.000000`, `d(e^{2x}dy) = 2dV` | holds | none |
| 12.3 `hessian`, `mgradient` | `e^{2x}δ`, `f = x₁`, `(e₂,e₂)`; `diag(4,1)` | `Γ²₂₁ = 1`, `e^{−2x}·e^{2x} = 1.0`; `grad x₁ = ¼∂₁`, `g(¼e₁,v) = 1.0·v₁` | covariant, metric-dependent | none |
| `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = e^{−t}∂ₜ`; `X = 1` | `∫₀^∞ f' = −1.000000`, flux `⟨X(0),−∂ₜ⟩ = −1`; `X = 1` fails `hSupport` | holds; support needed | none |
| sample: punctured family | `α = 0.7` at `(0.8,−0.3)`; circle, `α ∈ {0, 0.7, 1, 2.5}` | curl by finite difference `0.7478685` = `2(1−α)ρ^{−α}` `0.7478685`; loop `6.283185` for every `α` | closed iff `α = 1`; never exact | none |
| sample: ellipse | `a = 2`, `b = ½` | `∮x dy = 3.141593`, `∮(−y dx + x dy)/2 = 3.141593`, `πab = 3.141593` | holds | none |
| sample: `θ = 2π√t` | area via `θ'/2` | `3.14154 ≈ π` (unbounded speed `π/√t`) | holds | none |
| sample: HK gate | `h = t² sin t⁻²` | `HK∫h' = sin 1 = 0.841471`; `∫|h'|` over `[0.1,1]` is `3.033`, over `[0.03,1]` is `4.568` (log growth) | not Bochner | none |
| sample: weak field | `P = |x−½|`, `Q = x`, unit square | boundary `1.0`, area `1` | holds | none |
| `green_verticalCell` | unit square, `P = y` | `∫₀¹(0 − 1) = −1`, `−∫1 = −1` | holds | none |
| sample: contact adapter | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx`; `[∂y, ∂x + y∂z] = ∂z`, `α(∂z) = 1` | matches pin | none |
| `Density`, `m < dim` | `dim 3`, `m = 2` | `(2³ − 2²)·toFun v = 4·toFun v = 0` | forced zero | none |
| `exists_contDiffAt_localFlow_of_completeSpace`, global law | `v = x²` at `a = 0` | orbits `{0}`, `(0,·)`, `(·,0)` free; a set-level `ℝ`-action extends the local flow `x/(1−tx)` | true as stated | none |
| `timeDependentFlowDomain_eq_univ` | `J = (0,1)` and `J = (0,1)∪(2,3)` | path in `[s,t] ⊆ J` stays compact; the second `J` is excluded by `OrdConnected` | holds | none |
| hairy ball 11.1–11.2 | `n = 0, 1, 2` | `S⁰`: `v = 0`; `S¹`: `ix` nowhere zero, `Even 1` false; `S²`: `(−x₂,x₁,0)` zero at the poles | parity needed | none |
| 8.3 corner route | straight-line homotopy in `[0,∞)`, `x = 0`, `x₀ = 1` | `x + ε(x − x₀) = −ε ∉ range I` for `t < 0` | needs a time cutoff, which "jointly smooth homotopy" allows | none |

## Not verifiable

- [Lee], GTM 218; [Tu], GTM 275; [Bott–Tu], GTM 82; [Milnor], *Topology from the Differentiable Viewpoint*. None has a legal open copy. The previous round's sources-service fetch of Lee returned `uncertified` (paywalled). This review edits no manifest and did not refetch. The change set adds no new locator into them: the three `[Lee, …]` occurrences in the added lines are re-wrapped existing text.

## Source issues

- none
