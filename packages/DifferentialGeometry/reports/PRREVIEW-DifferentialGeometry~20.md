# Review of DifferentialGeometry (pull request #886 at 6fb2ca3)

**Verdict:** needs changes

A full review: the folder changed by 564 lines since `dabafb8`. First, finding by finding against the previous review:

- **R01 (README written against Tau Ceti `2fd255d9`, Lean file against `358314d4`; merge conflict) — partly repaired.** Repaired: 5.1–5.4 and 12.2–12.4 now cite the natives (README 54–63, 407–433, 1409–1433, 1459–1511, 2513–2564), the docstring no longer calls 5.1–5.3 "not statable", the unused duplicate definitions (`wedgeWith`, `bracketWedge`, `RoughForm.wedgeWith`, `Green.curl`, `Green.circulationFun`, `Green.windingWeight`, `mgradient`, `hessian`, `laplaceBeltrami`) are deleted, and the three file locators are main's (`Riemannian/Pullback/Basic.lean`, `Riemannian/Sphere/Basic.lean`, `MeasureTheory/Function/MetricDerivative/Basic.lean`, README 335, 341, 458). Not repaired: `lake-manifest.json` still pins `358314d4` with Lean `v4.35.0-rc3`, `Suggested.lean:9–10` still import the two modules that do not exist at main's pin, and `git merge-tree --write-tree HEAD origin/main` still reports a content conflict in `Suggested.lean`. Re-raised as R01.
- **R02 (description names no order against #334 and #1187) — not repaired.** 0 matches for either number in the description. Re-raised as R03.
- **R03 (`Manifold.Orientation.ext` kept with a false justification) — repaired.** The admission is gone (34 admissions, was 35); the docstring reads "Five statements …" and each of the five is used (`mextDerivₗ` at `Suggested.lean:318–327`; `MorseNovikov/Suggested.lean:219–224` uses `toFlow`, `isCompleteVectorField_of_compactSpace`, `toFlow_apply`). README 905–906 cites `TauCeti.Manifold.Orientation.ext`.
- **New:** R02 (targets and two admissions that Tau Ceti proves at the pin the README's contract is written against) and R04 (a Check bullet that carries target prose).

The gate passes (every scanner `0`, build `OK`). `Suggested.lean` elaborates with 34 `declaration uses sorry` warnings and no other diagnostic. The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The folder is consistent with neither pin and still conflicts with main

Re-raised: H01 (r15–r19 R01). The recorded reason, that merging main is outside a repair job's files, says who must act; it does not make the folder mergeable, and each repair round moves the README further onto main's pin while the Lean file stays on the branch's.

**Location.**

- `lake-manifest.json`: Tau Ceti `358314d4ab97…`, Lean `v4.35.0-rc3`; main: Tau Ceti `2fd255d997…`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9` `public import TauCeti.Geometry.Manifold.Orientation`, `:10` `… Riemannian.Sphere`.
- README 273–433 (*From Tau Ceti*).
- `Suggested.lean:59–79`: "… (2.4) lack, among this file's imports, Tau Ceti's `TauCeti.Manifold.OrientationCover` and `TauCeti.invariantPart` …" and three more clauses of the same form (5.4, 9.2–9.3, 10.3–10.5).

**Claim.** (a) Of the 205 Tau Ceti declarations the README names that I located at `2fd255d9`, 155 have no declaration at the folder's pin `358314d4`, so the *From Tau Ceti* contract is false at the pin the folder builds against. (b) At main's pin the Lean file does not build: both imports are gone. (c) The four "lack, among this file's imports" clauses are true at neither pin. At `358314d4` the modules do not exist at all, so no import could supply them. At `2fd255d9` they exist and the import rule allows adding them, so the headlines they excuse (triviality of the orientation cover and `d` commuting with the averaging operators, naturality of the homotopy operator, `H^n_c ≃ ℝ` and Poincaré duality, the degree formula) are statable and must be stated.

**Witness.**

- `git merge-tree --write-tree HEAD origin/main`: stages 1–3 for `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, "CONFLICT (content)".
- At `358314d4`: `Geometry/Manifold/Orientation.lean` and `Riemannian/Sphere.lean` present; `DeRham/`, `Degree/`, `Orientation/Cover/`, `Flow/`, `Analysis/Green/`, `DifferentialForm/{HomotopyOperator,Involution}.lean`, `DifferentialForm/Integration/TopForm.lean` absent. At `2fd255d9`: the reverse.
- At `2fd255d9`: `DeRham/PoincarePairing.lean:151` `poincarePairing (o : Manifold.Orientation I M (Fin (k + l))) : deRhamCohomology I M k →ₗ[ℝ] compactlySupportedDeRhamCohomology I M l →ₗ[ℝ] ℝ`; `:111` `compactlySupportedDeRhamCohomology.integral o : … →ₗ[ℝ] ℝ`; `Degree/Basic.lean:76` `degreeAtRegularValue o o' f y : ℤ`; `DifferentialForm/Involution.lean:42` `invariantPart τ φ`.

**Repair.**

1. Merge main (or bump `lake-manifest.json` and `lean-toolchain` to main's pins); resolve `Suggested.lean` to the branch side; rename the two imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`; rebuild the six targeted modules.
2. At that pin, state the headlines that become statable and drop their docstring clauses, importing only the modules used. The shapes, read from the signatures above and not elaborated here (the worktree is at the old pin):
   - 9.3: `Function.Bijective ⇑(TauCeti.poincarePairing I M o)` for `o : Orientation I M (Fin (k + l))`, with `[T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]` and `finrank ℝ E = k + l`. The codomain `H^l_c →ₗ[ℝ] ℝ` is the dual, so no new definition is needed.
   - 9.2: `Function.Bijective ⇑(TauCeti.compactlySupportedDeRhamCohomology.integral o)` for connected `M`, same hypotheses.
   - 10.3–10.4: `integralTopForm o (mpullback I J f ω) = (degreeAtRegularValue o o' f y : ℝ) * integralTopForm o' ω` for `f` smooth, `M`, `N` compact connected boundaryless of the same dimension `≥ 1`, `y` a regular value, `ω` a smooth top form.
   - 2.4: `mextDeriv (invariantPart τ φ) = invariantPart τ (mextDeriv φ)` for a `C²` self-map `τ` of a `C²` manifold and a `C¹` form `φ`; and `Orientable I M ↔ ∃ e : M × Fin 2 ≃ₜ OrientationCover I M, ∀ p, proj (e p) = p.1`.
3. Keep in the docstring only the headlines that lack a construction at main's pin: 5.5b and the face-structured 12.5 (the smooth face structure), 8.5 (the de Rham homomorphism), 5.5a/12.4 (the integral of densities), the sign of the antipodal map (the outward orientation of `Sⁿ`), 0.4's migration.

The finding is repaired when `git merge-tree` reports no conflict, the targeted build passes at main's pins and no clause of the docstring says "among this file's imports".

## R02 (P2) — Layers 5.6.1–5.6.2, 12.6 and parts of 0.3, 1.2, 1.4, 3.5, 5.1 and 12.1–12.5 plan what Tau Ceti `2fd255d9` already proves; two admissions and one docstring clause restate it

**Location.**

- `Suggested.lean:1070–1107`: `verticalCell`, `horizontalCell`, `green_verticalCell`, `green_horizontalCell` (both admitted).
- `Suggested.lean:68–70`: "the finite type-I/type-II division theorems (5.6.2) lack the oriented boundary chain of finite integer-weighted sums of parametrized arcs with its Henstock–Kurzweil integrals"; `:67–68` "Cartan's formula (1.4) lacks the Lie derivative of forms".
- README 1826–1982 (5.6.1–5.6.2), 2026–2044 (Acceptance examples), 2085–2088, 2655–2669 (12.6), 1497–1500 (5.3 "What remains"), 638–651 and 732–738 (coefficient postcomposition), 783–796 (1.2), 838–840 (1.4), 1192–1221 (3.5), 1434–1440 (5.1 "What remains is the closed ball"), 2595–2597 (12.5 boundary metric), 925–930 (product orientations).

**Claim.** The README's *From Tau Ceti* contract is written against `2fd255d9` (R01), and its Scope paragraph (48–84) lists what is "Already in the library". That list stops short. Each item below is planned as a target ("Prove", "Build", "Supply", "Construct") while the same library proves it; the two cell identities are admitted in `Suggested.lean` although the library's statement implies them; and the docstring says a carrier is missing that exists.

**Witness** (all at Tau Ceti `2fd255d9`, file and line; none of these files exists at `358314d4`).

| README | Native declaration |
|---|---|
| 5.6.2 cells, `green_verticalCell`, `green_horizontalCell` | `Analysis/Green/Cell.lean:36,40` `TauCeti.Green.verticalRegion`, `horizontalRegion` (the bodies of `verticalCell`, `horizontalCell`, character for character); `Analysis/Green/Directional.lean:157,184` `integral_graphs_sub_eq_neg_integral_verticalRegion`, `integral_graphs_sub_eq_integral_horizontalRegion` |
| 5.6.2 cell API (compactness, measurability, null boundary, slicing, swap) | `Cell.lean:194,206,251,261`, `Directional.lean:112,137` |
| 5.6.2 boundary chains, finite divisions, full Green with both integrability conclusions, Bochner specialization | `Analysis/Green/BoundaryChain/Basic.lean:34` `BoundaryChain := Arc →₀ ℤ` with `boundary`, `integral`, `Integrable`; `Division/Basic.lean:30` `Division`; `Division/Green.lean:63` `Division.integrable_and_integral_add_integral_eq_integral_sub`, `:99` `…curveIntegral_eq_integral_sub` |
| 5.6.2 Henstock–Kurzweil: `GP` = `Henstock` on `Fin 1`, FTC off a countable set, graph substitution | `Analysis/BoxIntegral/FundThmCalculus.lean:68` `hasIntegral_GP_iff_Henstock_fin_one`, `:102` `hasIntegral_Henstock_of_hasDerivAt_off_countable`; `Analysis/Green/GraphIntegral.lean:72` `hasHenstockIntervalIntegral_graph_reparam` |
| 5.6.2 agreement with the rectangle theorems | `Analysis/Green/RectangleComparison.lean:61,86` `integral_rectangle_boundary_eq_divergence`, `…_eq_bilinear` |
| 5.6.2 winding-weighted polygonal identity, triangle indices | `Analysis/Green/Polygonal/Green.lean:91` `green_polygonal`; `Polygonal/Index.lean:116,164,181,237` |
| 5.6 Acceptance examples: circle, ellipse, annulus, double circle, `2π√t`, weak field, shoelace/bow tie, `t² sin t⁻²` | `Analysis/Green/Examples/CurveArea/Green.lean:45,59,71,104,119,131`; `Examples/WeakField.lean:30` `green_abs_unitSquare`; `Examples/{Shoelace,BowTie}.lean`; `Analysis/BoxIntegral/Examples/GaugeFTC.lean:81` `hasHenstockIntervalIntegral_deriv_oscillatoryPrimitive` |
| 12.6 and 5.3 "What remains" (planar/manifold comparison) | `Analysis/Green/Comparison/` (`Rectangle/Basic.lean:229` `integralTopForm_rectangle_mextDeriv`, `IndexOne.lean:37,94`, `Boundary/Smooth.lean:161`, `Divergence.lean:30`, `CurveIntegral.lean:31`) |
| 0.3–0.4, 1.2–1.3 coefficient postcomposition `L_*ω` with its laws and `d(L_*ω) = L_*(dω)` | `Geometry/Manifold/DifferentialForm/MapCoeff.lean:87` `mapCoeff`, `:113,117`, `:150` `IsSmoothForm.mapCoeff`, `:159` `mextDerivWithin_mapCoeff`, `:169` `mextDeriv_mapCoeff`, `:200` `SmoothForm.mapCoeff`, `:222` `mextDerivₗ_mapCoeff`; `Wedge/MapCoeff.lean` |
| 1.4 Lie derivative of forms and Cartan's formula | `DifferentialForm/LieDeriv.lean:83` `mlieDerivForm`, `:304` `mlieDerivForm_eq_interior_mextDeriv_add` ("Cartan's magic formula") |
| 3.4 Lie derivative of forms via flows | `DifferentialForm/Flow.lean:223` `hasDerivAt_mpullback_globalFlow` |
| 3.5 finite-dimensional time-dependent flow (open domain, joint smoothness, two-time law, compact case) | `Geometry/Manifold/Flow/TimeDependent.lean:127` `timeDependentFlowDomain`, `:134` `timeDependentFlowOf`, `:326`, `:334`, `:310`, `:462` (time slab `ℝ`) |
| 2.2 product orientations | `Orientation/Prod.lean:112` `Manifold.Orientation.prod`, `:131` |
| 5.1 closed ball: boundary ≃ `Sⁿ`, orientation by the inclusion, outward radial field | `Instances/ClosedBall/Boundary.lean:38` `sphereDiffeomorphBoundaryClosedBall`; `Orientation/ClosedBall.lean:39,50`; `Instances/ClosedBall/Outward.lean:34` `isOutwardPointing_closedBall_radial` |
| 12.5 induced boundary metric and its regularity | `Riemannian/Boundary.lean:115` `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`, `:146` |
| 12.1 `roundMetricCircle` | `Riemannian/Circle.lean:40` `TauCeti.roundMetricCircle`, `:51` |

`integral_graphs_sub_eq_neg_integral_verticalRegion` asks `a ≤ b`, continuity of `P` on each vertical fibre, the slice derivative on the open fibre and area integrability, for `P` with values in a complete normed space; `green_verticalCell` asks `a < b`, continuity on the cell and the derivative at every point of the cell, for real `P`. Every hypothesis of the admitted statement implies the native one, and `P (x + ℓ x * I) = P ⟨x, ℓ x⟩`, so the admission is the native theorem with stronger hypotheses. No roadmap `.lean` on the branch uses `verticalCell`, `horizontalCell` or the two identities (0 hits outside this file).

**Repair.**

1. Delete `verticalCell`, `horizontalCell`, `green_verticalCell`, `green_horizontalCell` and the section comment's sentence about them from `Suggested.lean`; delete the 5.6.2 and 1.4 clauses from the "not statable" paragraph and name 5.6.2 and Cartan's formula among the headlines Tau Ceti proves.
2. In the README, rewrite 5.6.1–5.6.2, the Acceptance examples and 12.6 as 5.6.3 is written: name the declarations and modules above, add them to *From Tau Ceti* and to the Scope paragraph's "Already in the library", and keep as targets only what the library lacks. I found no native for the flat punctured-plane family (README 2046–2059), 5.6.1's kernel estimate `∫ ‖z − w‖⁻¹ ≤ 4πR`, or the continuous-BV line integral (README 2754–2761); check each of the remaining "Prove" sentences of 5.6.1 against `Analysis/Green/{AbsolutelyContinuous,Approximation,Limit,Localization}.lean` before keeping it.
3. Do the same for the other rows: 0.3–0.4 and 1.2–1.3 cite `mapCoeff` and its laws; 1.4 cites `mlieDerivForm` and Cartan's formula; 3.5 cites the `ℝ`-slab flow and keeps the open-slab `J` and Banach extensions; 2.2 cites `Manifold.Orientation.prod`; 5.1 keeps only the agreement with 2.4's outward orientation of `Sⁿ`; 12.5 builds `halfSpaceBoundaryMetric` on `restrictBoundaryTangentSpace` or cites it; 12.1 cites `TauCeti.roundMetricCircle`.
4. Step 1's deletions and the citation of names that exist only at `2fd255d9` belong after R01's merge; before it they would add to the 155 names absent at the folder's pin.

The table is what a sweep of `Analysis/Green`, `Analysis/BoxIntegral` and `Geometry/Manifold/{DifferentialForm,Flow,Orientation,Instances/ClosedBall,Riemannian}` found; the same sweep is owed for every remaining "Prove"/"Build" sentence once the folder is on main's pin.

## R03 (P3) — The description states no order against #334 and #1187, and still describes nine Lean modules

Re-raised: H06 (r16 R06, r17 R03, r18–r19 R02). The recorded reason, that the description is outside the job's files, fails because the author or the worker can edit it.

**Location.** The pull-request description: 0 matches for `334` and `1187`; "The nine Lean modules retain the full existing programme …", "330 intentional admission warnings", "PlanarPrimitiveTargets.lean".

**Claim.** #334 replaces this folder and #1187 bumps Tau Ceti to an ancestor of main's pin; both conflict with this head and no order is stated. The description also says "The folder holds one Lean file" and then describes nine modules and a companion file that the head does not contain.

**Witness.** The overlap report at this head: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`". The folder holds one `.lean` file with 34 admissions.

**Repair.** In the description: add "This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main."; delete the paragraphs about nine modules, 330 and 392 admissions and `PlanarPrimitiveTargets.lean`, or replace them by "one Lean file, 34 admitted theorems".

## R04 (P3) — A Check bullet of 4.4 carries target prose

**Location.** README 1387–1391: "… a disjoint union of two plaques of different leaves is an integral manifold meeting a leaf without lying in it. Develop these results on the existing distribution and foliation interfaces. No assertion of a boundaryless leaf through every boundary point is made …".

**Claim.** The third Check of 4.4 ends with two sentences that are not a test: an instruction and a scope statement. A Check says what is computed and what a wrong definition would get wrong.

**Witness.** The bullet starts at 1387 ("Maximality only among *connected* integral manifolds") and runs to 1391 with no paragraph break.

**Repair.** End the bullet at "… without lying in it." and move the two sentences into the body of 4.4, before `*Needs:*` (line 1379), as: "Develop these results on the existing distribution and foliation interfaces. No boundaryless leaf through every boundary point is asserted: the full tangent distribution on `[0, ∞)` rules that out."

## Previous findings

- R01 — partly repaired; the pin, the two imports and the merge conflict remain. Re-raised as R01.
- R02 — not repaired (description). Re-raised as R03.
- R03 — repaired (`Manifold.Orientation.ext` deleted, docstring corrected).

## Verified sound

**Gate.** The worker's run at this head: every scanner `0`, build `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`, with the board's `ORDER.txt`):

    depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` from the worktree (Tau Ceti `358314d4`, Mathlib `f6090c70`): exit 0, 34 `declaration uses sorry` warnings, no other diagnostic. No `set_option`, no admitted `def`, `instance` or `example`; imports are `Mathlib` and twelve `TauCeti.*` modules, each present at the folder's pin.

**Signatures.** A scratch file importing the built module with `#check @…` for 86 declarations elaborates with no error. Binders compared with the README: `exists_flowOf_one_eq`, `hasDerivAt_mpullback_flowOf` and `exists_chart_mfderiv_eq_const` carry `[T2Space M] [BoundarylessManifold I M] [FiniteDimensional ℝ E] [IsManifold I ∞ M]` and not `[CompleteSpace E]` (the `omit` works); `Distribution.isInvolutive_iff_forall_mextDeriv` carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M]` and no boundaryless hypothesis, as 4.2 says; `Distribution.exists_flatChart` adds `[BoundarylessManifold I M]`, as 4.3 says. This head adds no declaration (the diff of `Suggested.lean` since `dabafb8` is deletions and docstring text), so the other binders are those r15–r19 compared.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | (simp; done)`: 34 errors on 34 distinct lines, the 34 admitted declarations; none closes at the folder's pin. `toFlow_apply` (`rfl`) and `isCompleteVectorField_of_compactSpace` (proved) are kept for MorseNovikov, which uses both. At main's pin `green_verticalCell` and `green_horizontalCell` follow from one library theorem each (R02).

**Tau Ceti names.** A sweep of every backticked library name of the README against both pins: 205 Tau Ceti declarations located at `2fd255d9` (155 of them absent at `358314d4`, R01); of the 28 swept names found at neither pin, 24 are this roadmap's own targets, each declared in `Suggested.lean`, and 4 are not declarations (a module path, a namespace, AFP's `analytically_valid`, the coordinate forms `dt_i`). Opened at `2fd255d9` for the passages this head changed, hypotheses as found:

- `Boundary/Integration.lean:37` `boundaryRestriction` (`mpullback` along `Subtype.val`; `F` an `ℝ`-module with a topology, line 33); `Boundary/Restriction.lean:131` `boundaryRestriction_mextDeriv` (`[IsManifold (𝓡∂ (n+1)) 2 M]`, `IsSmoothForm … 1 φ`): README 5.1's "`C¹` form on a `C²` manifold".
- `Boundary/InducedOrientation.lean:108` `boundaryOrientation` (from `Fin (n+1)` to `Fin n`), `:145` `_spec` (outward `v`, `b' = Fin.cons v (dι ∘ b)`), `:177` `_neg`, `:188` `orientationAt_boundaryOrientation_model` (`= −` the standard orientation): README 5.1's sign.
- `Measure.lean:114` `isNullSet_boundary` (`[FiniteDimensional ℝ E] [IsManifold I 1 M]`, any model).
- `Orientation/Interval.lean:153,163`: left endpoint `−`, right endpoint `+`.
- `Instances/ClosedBall/Basic.lean:231,264,314,322`: the four closed-ball names of 5.1.
- `DeRham/PoincarePairing.lean:111,151`, `Degree/Basic.lean:76`, `DifferentialForm/Involution.lean:42,48`: as 9.1, 10.3 and 2.4 describe them.
- `Riemannian/VolumeDensity/Basic.lean:48` `chartVolumeDensity`, `Volume.lean:93` `eq_riemannianVolume_iff`, `VectorBundle/Riemannian/Riesz.lean:85,203` `inner_rieszDual`, `contMDiffAt_rieszDual`, `Distribution.lean:131,499`, `Analysis/Contour/Winding/Number/Basic.lean:76`, `DeRham/Circle.lean:149,344`, `DeRham/Punctured.lean:95`, `AlgebraicTopology/Cohomology/Cup.lean:203`, `AlgebraicTopology/Singular/BrouwerFixedPoint.lean:71`.
- The declarations r19 opened (wedge, bracket wedge, alternating bundle, `mextDeriv` calculus, flows, outward field, Green for AC cycles, metrics, Hessian, divergence theorem, orientation, covers): unchanged pin, carried.

**Seeded sample (8 targets).**

- "Smooth 2-forms" (README 474–482): `SmoothTwoForm` and `Geometry/Symplectic/Manifold/TwoForm.lean:115` `IsSymplectic (form : SmoothTwoForm I M)` at `2fd255d9`; the migration is a target at both pins.
- "Canonical interfaces and reuse" (README 1243–1270): `Distribution.lean:131` `IsDistributionFrameOn`, `:499` `standardContactDistribution`; `Distribution/IntegralManifold.lean:139` `structure IntegralManifold`, with `:94` `IsIntegralManifold.nonempty`, the nonempty carrier the paragraph mentions.
- "Acceptance examples" (layer 4): `S(x,y,z) = (y,x,z)` gives `S^*(dz − x dy) = dz − y dx`. "Acceptance examples" (5.6): values below; the examples themselves are native (R02).
- "Conventions and existing inputs" and "Henstock–Kurzweil": the Mathlib names exist at both Mathlib pins (r19's list, unchanged); the `GP`/`Henstock` equivalence and the gauge FTC are native (R02).
- "Flat punctured-plane family": values below.
- "Ownership and ordering": `Completed/ContourIntegration`, `Completed/ConformalMapping`, `TauCetiRoadmap/{PDE,ModularForms,GeometricMeasureTheory,Isoperimetry}` exist on main.
- The README flags no locator as unverified.

**Overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39 (ConvexityToric, LocalVariationalFieldTheory and StringOrientation cite §5.5). No cited id is dropped by an open pull request and none is defined only by an open revision. Ownership against DeRhamCohomologyAndDuality, RiemannianGeometry and ComplexKahlerGeometry is as r19 found it (those heads consume this roadmap's sections and restate none of 2.4, 5.6 or 12); open pull requests without a path were not checked.

**Headline theorems** (README 13–18). Stated: Banach flows (3.1–3.2, three theorems), Frobenius and leaves (4, six), the hairy ball theorem (11, two), the divergence theorem with boundary (12.5). Cited to Tau Ceti: half-space Stokes (5.3), Green for AC cycles (5.6.3), the boundaryless divergence theorem. Not statable for want of a construction at either pin: corner Stokes (5.5b), the de Rham theorem (8.5). Statable at main's pin and absent: Poincaré duality (9.3), the degree formula (10.4) (R01). Stated although native at main's pin: the one-cell identities; unstated although native: the finite-division theorem (R02).

**Adversarial table.** Rows marked r15–r19 are carried from those reports for statements this diff leaves untouched; the others were computed here.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `green_verticalCell` vs native `integral_graphs_sub_eq_neg_integral_verticalRegion` | unit square, `P = y`; `ℓ = u`; `P = |x − ½|` | `∫₀¹ (0 − 1) dx = −1 = −∫ 1 dA`; `0 = 0`; `∂ᵧP = 0`, both sides `0`. Hypotheses: cell continuity ⇒ fibre continuity; derivative on the cell ⇒ on the open fibre; `a < b` ⇒ `a ≤ b` | true, and implied by the library | R02: delete |
| `green_horizontalCell` vs native | unit square, `Q = x` | `∫₀¹ (1 − 0) dy = 1 = ∫ 1 dA` | true, implied | R02: delete |
| Docstring: 5.6.2 "lacks the boundary chain" | `BoundaryChain/Basic.lean:34`, `Division/Green.lean:63` | `Arc →₀ ℤ` with `boundary`, gauge `Integrable`, `integral`; conclusion: both chain integrabilities, `IntegrableOn (RQ − RP) D`, equality | carrier and theorem exist | R02 |
| Docstring: "lack, among this file's imports" (2.4, 5.4, 9.2–9.3, 10.3–10.5) | file existence at both pins | `358314d4`: 0 of 6 modules; `2fd255d9`: 6 of 6 | false at one pin, statable at the other | R01 |
| 9.3 post-merge shape `Bijective ⇑(poincarePairing I M o)` | `M = ℝ`, `k = 0`, `l = 1`; `M = [0,1]` | `H⁰_dR(ℝ) = ℝ`, `(H¹_c(ℝ))^* = ℝ`, `⟨1, ψ⟩ = ∫ψ`: bijective; `[0,1]` excluded by boundaryless (`[dx] = 0`, `∫ dx = 1`) | hypotheses needed as listed | R01 step 2 |
| 10.4 post-merge shape | `z ↦ z²` on `S¹`; `(0,∞) ↪ ℝ` | `∫ f^*dθ = 4π = 2 · 2π`; noncompact: count `1` over `y > 0`, `0` over `y < 0` | compactness needed, as 10.4's Check says | R01 step 2 |
| `boundaryOrientation_spec`, model sign (5.1 Check) | `{x₀ ≥ 0} ⊂ ℝ²`, outward `−e₀` | `det(−e₀, e₁) = −1`: `e₁` negative; outward-last `det(e₁, −e₀) = +1` | README's `−e₁` = native `−basisFun` | none |
| Interval endpoints (5.1) | `Icc a b`, increasing orientation | native: left `−`, right `+`; `g(b) − g(a)` | holds | none |
| `integralTopForm_neg`, change of variables (5.2) | `t ↦ −t` on `ℝ`, bump `ω` | `∫ f^*ω = −∫ ω` (reversing), `∫_{−o} ω = −∫_o ω` | signs as README | none |
| 5.5b facet coefficient `(−1)^(i+1)` | `Q³`, `i = 0, 1, 2` | `det(−eᵢ, others in order) = −1, +1, −1` | holds, 0-based | none |
| 5.5a `Density`, `m < dim` | `dim 3`, `m = 2` | `(2³ − 2²) · toFun v = 4 · toFun v = 0` | holds | none |
| `planarRadialPrimitive` Checks (5.4) | `(P,Q) = (x,y)` and `(−y,x)` at `(0.3, 0.7)` | `0.29 = (x² + y²)/2`; `0.0`, so `dg = 0 ≠ ω` | closedness needed | none |
| 5.6.1 kernel estimate | `R = 1`, `w = c`; `w` on the boundary | `2π ≈ 6.283`; `≈ 3.999`; bound `4π ≈ 12.566`; then `∫|n_γ| ≤ (1/2π) · L · 4πR = 2RL` | holds (not sharp) | none |
| Punctured family (5.6) | `α = 0.7`, `(1.3, −0.4)`; unit circle | central differences `0.3900597`, `2(1−α)ρ^{−α} = 0.3900597`; circulation `6.2831853` | holds | none |
| Ellipse, HK (5.6) | `a = 2, b = ½`; `t² sin t⁻²` | `∮ x dy = 3.1415927 = πab`; `sin 1 = 0.8414710` | holds; native (R02) | R02: cite |
| Antipodal sign `(−1)^(n+1)` (2.4, 10.4, 11) | `n = 0, 1, 2` | `−1, +1, −1`; hairy ball: `1 = (−1)^(n+1)` forces `n` odd | consistent across 2.4, 10.4, 10.5, 11.1 | none |
| 12.5 half-line | `X = e^{−t}∂ₜ` on `[0,∞)`; `X = 1` | `∫ X' = −1 = ⟪X, −∂ₜ⟫(0)`; `X = 1` fails `hSupport` | holds | none |
| 12.3 conformal divergence | `g = e^{2x}δ`, `X = ∂₁` | `e^{−2x} ∂ₓ(e^{2x}) = 2`; flat trace `0` | holds, agrees with 12.4's `d(ι_X dV) = 2 dV` | none |
| `hasIntegral_GP_iff_Henstock_fin_one`, GaugeFTC vs README "Henstock–Kurzweil" | statement comparison | the README's "named one-dimensional equivalence" and `∫ h' = sin 1` | native | R02 |
| Contact adapter (layer 4) | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx`; native carrier `v.2.2 = p.1 · v.2.1` | holds | none |
| r19: `bracketWedge_jacobi`, `pairedWedge_flip`, `isSmoothForm_mextDeriv`, `mextDeriv_add`/`_smul`, `apply_flowOf`, compact-support completeness, `hessian_symm`, `integral_divergence_eq_zero`, Green's identities, metric existence, `Orientation.pullback`, `ofTopForm`, `IsOrientedAtlas.orientable`, outward field, `green_ac_*` | as r19 | `e₃ ≠ 0`; equal; `0+1 ≤ 1`; junk `0 ≠ dx∧dy`; `1/(1−t)`; `Hess(e₁,e₂) = 1`; `0`; `2∫f`; `card 1 ≠ 2`; `{id}` on `[0,∞)`; `0 < 0` false; identical binders | holds | none |
| r18: triviality ↔ orientable; `d` and averaging; π₁ criterion | `∅`, point, `S¹`, Möbius, `ℝP²`, `S¹⊔S¹`, `S¹⊔B`; `τ ≡ c` | components `0,2,2,1,1,4,3`; `df/2 = df/2`; `2ℤ ⊂ ℤ` index 2 yet orientable | holds | none |
| r15–r17: 2.3 chart formula and `exp(i t³)`; 5.5b product signs; `Density`; local flow law; `timeDependentFlowDomain_eq_univ`; slice chart; leaves | `t³`; `[0,1]²`, `ω = y dx`; `v = x²`; `(0,1) ∪ (2,3)`; irrational line | `|p'(0)| = 0`; `∫dω = −1 =` top edge; `x/(1−tx)`; excluded by `OrdConnected`; dense leaf in no line | holds | none |

## Not verifiable

- [Lee] GTM 218 is read from the cached text recorded as `uncertified`; the ten locators r19 checked are unchanged in this head, and the locators this head adds ([Lee, Prop. 15.24] for the outward-first rule, [Lee, Prop. 16.6] for positivity, [Lee, Prop. 15.29] for the volume form) were not re-read against the text. [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy; standard theorems carried by their locators.
- The post-merge statements of R01 step 2 and the one-line derivation of the cell identities from the native theorems (R02) were decided by reading the library at `2fd255d9`; they were not elaborated, because the worktree's packages are at `358314d4`.

## Source issues

- none
