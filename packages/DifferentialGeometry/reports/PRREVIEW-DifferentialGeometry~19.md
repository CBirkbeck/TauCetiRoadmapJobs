# Review of DifferentialGeometry (pull request #886 at dabafb8)

**Verdict:** needs changes

A full review: the folder changed by 674 lines since `473c4df`. First, finding by finding against the previous review:

- **R01 (pin lag, merge conflict, duplicates of main's Tau Ceti) — partly repaired.** The 25 admissions that Tau Ceti proves at main's pin are deleted and the README cites the natives by name and module (README 48–66, 349–389, 538–622, 1.1–1.4, 2.1–2.4, 3.2–3.4, 5.1, 5.6.3, 12.1–12.5). Every one of the ~60 newly cited names resolves at Tau Ceti `2fd255d9` with the hypotheses the README states (the table below). Not repaired: `lake-manifest.json` still pins `358314d4` with Lean `v4.35.0-rc3`, `git merge-tree --write-tree HEAD origin/main` still conflicts in `Suggested.lean`, and the README now cites, as plain *From Tau Ceti*, about 115 declarations that do not exist at the folder's own pin while `Suggested.lean:9–10` import two modules that do not exist at main's. Re-raised as R01.
- **R02 (description names no order against #334 and #1187) — not repaired.** The description contains neither number (0 matches). Re-raised as R02.
- **New:** R03, a false justification in the module docstring for a kept admission.

The gate passes (every scanner `0`, `OK`). `Suggested.lean` elaborates with 35 `declaration uses sorry` warnings and no other diagnostic (70 s). The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The README is written against Tau Ceti `2fd255d9`, the Lean file against `358314d4`; neither pin makes the folder consistent, and the folder still conflicts with main

Re-raised: H01 (r15–r18 R01). The previous reason, that merging main is outside a repair job's files, says who must act; it does not make the folder mergeable. This round did steps 2–3 of the repair without step 1, so the README and the Lean file now disagree about which library they are written against.

**Location.**

- `lake-manifest.json` (Tau Ceti `358314d4ab97…`, Lean `v4.35.0-rc3`); main's pins Tau Ceti `2fd255d997…`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9` `public import TauCeti.Geometry.Manifold.Orientation` and `:10` `… Riemannian.Sphere`: both files exist at `358314d4` and not at `2fd255d9` (there they are `Orientation/OrientedAtlas.lean` and `Riemannian/Sphere/Basic.lean`).
- README 273 cites `Geometry/Manifold/Orientation/OrientedAtlas.lean` (main's layout) while README 321, 327 and 412 cite `Riemannian/Pullback.lean`, `Riemannian/Sphere.lean` and `MeasureTheory/Function/MetricDerivative.lean` (the branch's layout; at `2fd255d9` these are `Riemannian/Pullback/Basic.lean`, `Riemannian/Sphere/Basic.lean`, `MeasureTheory/Function/MetricDerivative/Basic.lean`).
- README 349–389 (the new *Forms, the exterior derivative, flows, …* bullet), 538–622 (0.1–0.2), 865–1013 (2.1–2.4), 1102–1137 (3.3–3.4), 1359–1363 (5.1), 1882–1912 (5.6.3), 2376–2510 (12.1–12.5).

**Claim.** At the folder's pin (`358314d4`) the *From Tau Ceti* contract names declarations that do not exist: of the 175 cited Tau Ceti names I located at `2fd255d9`, about 115 have no declaration at `358314d4`, among them every name of the new bullet (`ContinuousAlternatingMap.pairedWedge_flip`, `TauCeti.bracketWedge_jacobi`, `TauCeti.instContMDiffVectorBundleContinuousAlternatingMap`, `TauCeti.smoothForms_wedgeWith_mem`, `TauCeti.mpullback_mextDeriv`, `TauCeti.mextDeriv_mextDeriv`, `TauCeti.isSmoothForm_mextDeriv`, `TauCeti.mextDeriv_wedgeWith`, `TauCeti.mextDeriv_apply_one`, `TauCeti.flowOf`, `TauCeti.IsCompleteVectorField`, `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off`, `MDifferentiable.apply_flowOf`, `TauCeti.exists_isOutwardPointingField`, `TauCeti.Green.green_ac_winding`, `TauCeti.nonempty_contMDiffRiemannianMetric`, `TauCeti.Manifold.hessian_symm`, `TauCeti.Manifold.integral_divergence_eq_zero`, `TauCeti.Manifold.Orientation.pullback`, `TauCeti.Manifold.Orientation.ofTopForm`, `TauCeti.Manifold.orientable_of_forall_index_ne_two`, the whole `Orientation/Cover/` and `DeRham/` families). At main's pin the Lean file does not build (its two imports are gone), and the README is still stale there in one place: 5.2–5.3 plan the integral of top forms and half-space Stokes, and the docstring (`Suggested.lean:51–55`) calls 5.3 "not statable … lacks the integral of a top form", although both are native (below). The folder is therefore consistent with no pin and cannot merge.

**Witness.**

- `git merge-tree --write-tree HEAD origin/main`: stages 1–3 for `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, "CONFLICT (content)".
- `git cat-file -e 2fd255d9:TauCeti/Geometry/Manifold/Orientation.lean` and `…/Riemannian/Sphere.lean`: both absent; present at `358314d4`.
- At `2fd255d9`: `Topology/Algebra/Module/Alternating/Wedge/Basic.lean:430` `pairedWedge_flip`; `Analysis/Normed/Module/Alternating/BracketWedge.lean:124` `bracketWedge_jacobi`; `Geometry/Manifold/Flow/Basic.lean:57–62` `flowDomain`, `flowOf`; `Analysis/Green/Winding.lean:30` `green_ac_winding`; `Geometry/Manifold/Riemannian/DivergenceTheorem.lean:225` `integral_divergence_eq_zero`; `Geometry/Manifold/Orientation/Pullback.lean:173` `pullback`; `Orientation/TopForm.lean:186` `ofTopForm`; `Orientation/Cover/FundamentalGroup.lean:41`. `git grep` for each of these at `358314d4`: 0 declarations.
- Also at `2fd255d9` and absent at `358314d4`: `DifferentialForm/Integration/TopForm.lean:518` `public def integralTopForm`, `Boundary/InducedOrientation.lean:108` `boundaryOrientation`, `Boundary/Integration.lean:37` `boundaryRestriction`, and `DifferentialForm/Integration/Stokes.lean:37` `integralTopForm_mextDeriv` (half-space Stokes: `[IsManifold (𝓡∂ (n+1)) ∞ M] [T2Space M] [SigmaCompactSpace M]`, `C¹` form with compact support, outward-first boundary orientation), exactly 5.3's statement; README 349–352 even lists `Integration/{TopForm,Stokes,BoundarylessStokes,Path}.lean` among the modules it consumes.

**Repair** (as r15 R01 steps 1–7; what is left):

1. Merge main, or bump `lake-manifest.json` and `lean-toolchain` to main's pins; resolve `Suggested.lean` to the branch side (main's only change since the merge base is the pin bump); rename the two imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`; rebuild the targeted modules.
2. Then re-read 5.1–5.3 and the docstring at that pin: 5.1 cites `TauCeti.boundaryOrientation` and `TauCeti.boundaryRestriction`, 5.2 cites `TauCeti.integralTopForm`, 5.3 cites `TauCeti.integralTopForm_mextDeriv` (and the boundaryless `integralTopForm_mextDeriv_eq_zero`, `BoundarylessStokes.lean:122`), and the docstring drops 5.1–5.3 from "not statable". Definitions of `Suggested.lean` that `2fd255d9` provides natively and that no consumer module imports from this folder (`flowDomain`, `flowOf`, `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow_apply`, `IsOutwardPointing`, `Green.curl`, `Green.circulationFun`, `Green.windingWeight`, `mgradient`, `divergence`, `hessian`, `laplaceBeltrami`, `wedgeWith`, `bracketWedge`) are deleted; the carriers that `AlgebraicTopology/{GeneralModelOrientation,OrientationComparison}.lean`, `ComplexKahlerGeometry/Suggested.lean`, `MorseNovikov/Suggested.lean` and `SymplecticGeometry/ContactGeometry/Suggested.lean` import (`OrientationLift`, `Manifold.Orientation`, `orientationAt`, `Manifold.Orientation.pullback`, `fullSimplex`, `fullSimplexEquivStdSimplex`, `SmoothForm`, `Density`, `RoughForm`, `RoughForm.ofFunction`, `mextDeriv`, `closedForms`, `toFlow`, `flowOf`) stay, as the README's "signature, never a second definition" clause says.
3. Make the three file locators of README 321, 327 and 412 the pin's paths.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at main's pins.

## R02 (P3) — Two other open pull requests change this folder, and the description states no order

Re-raised: H06 (r16 R06, r17 R03, r18 R02). The reason given, that the description is outside the job's files, fails because the worker or the author can edit it.

**Location.** The pull-request description (data): 0 matches for `334` and `1187`.

**Claim.** #334 replaces this folder and #1187 bumps Tau Ceti to `ab00ba392`, an ancestor of main's `2fd255d9`; both conflict with this head and the description does not say which merges first.

**Witness.** The overlap report at this head: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`".

**Repair.** One sentence in the description, not in the README: "This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main."

## R03 (P3) — The docstring keeps `Manifold.Orientation.ext` as "imported by" three consumers that do not use it

**Location.** `Suggested.lean:46–49`: "Four statements that Tau Ceti also proves are kept because declarations of this file or of its consumers use them: … `Manifold.Orientation.ext` is imported by the orientation modules of AlgebraicTopology, ComplexKahlerGeometry and MorseNovikov." The admission is `Suggested.lean:495`.

**Claim.** The justification is false. The three other kept statements are used (`mextDeriv_add`, `mextDeriv_smul` and `isSmoothForm_mextDeriv_infty` are the proof fields of `mextDerivₗ`, `Suggested.lean:371–381`, behind `closedForms`, which MorseNovikov imports). Nothing uses `Manifold.Orientation.ext`: not this file, not the five consumer modules of the targeted build, not any roadmap `.lean` on the branch or on main. It is an admission that Tau Ceti proves (`Orientation/Basic.lean:164` at `2fd255d9`, `theorem ext {o o' : Orientation I M ι} …`), in the same class as the 25 deleted this round, and README 2.1 (870–871) already cites `TauCeti.Manifold.Orientation.ext`.

**Witness.** `grep -rn -F 'Orientation.ext' TauCetiRoadmap --include='*.lean'` on the branch and on main: 0 hits outside `DifferentialGeometry/Suggested.lean`. The DG names the five consumers use: `GeneralModelOrientation.lean` (`Manifold.Orientation`, `orientationAt`, `Manifold.Orientation.pullback`), `OrientationComparison.lean` (`OrientationLift`, `Manifold.Orientation`, `orientationAt`, `fullSimplex`, `fullSimplexEquivStdSimplex`), `ComplexKahlerGeometry/Suggested.lean` (`SmoothForm`, `Density`), `MorseNovikov/Suggested.lean` (`RoughForm`, `toFlow`, `flowOf`, `closedForms`), `ContactGeometry/Suggested.lean` (`mextDeriv`, `RoughForm`, `RoughForm.ofFunction`, `SmoothForm`).

**Repair.** Delete `Manifold.Orientation.ext` (`Suggested.lean:492–496`) and the clause "and `Manifold.Orientation.ext` is imported by …" from the docstring (so the sentence reads "Three statements …"). Elaboration after the deletion needs nothing else: no declaration of the file mentions it.

## Previous findings

- R01 — partly repaired (the 25 duplicate admissions are gone and cited; the pin, the merge conflict, the two imports, 5.1–5.3 and three file locators remain). Re-raised as R01.
- R02 — not repaired (description). Re-raised as R02.

## Verified sound

**Gate.** The worker's run: every scanner `0`, build `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`, with the board's `ORDER.txt`):

    depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` from the worktree: exit 0 in 70 s, 35 `declaration uses sorry` warnings at the 35 admitted theorems, no other diagnostic. The file has 96 declarations.

**Signatures.** A scratch file importing the built module with `#check @…` for all 96 declarations elaborates with no error (12 s); I compared the binders of the admissions against their README statements: `exists_topForm_of_orientation` carries `[T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M] [FiniteDimensional ℝ E]`; `orientable_iff_exists_atlas` `[BoundarylessManifold I M] [IsManifold I 1 M]`; `hasDerivAt_mpullback_flowOf` `[T2Space M] [BoundarylessManifold I M] [FiniteDimensional ℝ E] [IsManifold I ∞ M]`; `exists_contDiffAt_localFlow_of_completeSpace` `[CompleteSpace E]`; `exists_eq_zero_of_inner_eq_zero` `[Fact (finrank ℝ E = n + 1)]`; `integral_divergence_eq_boundaryFlux` the eleven instances of README 12.5 (smooth half-space manifold, T2, second countable, σ-compact, Borel, smooth and continuous Riemannian bundle). The diff of `Suggested.lean` since `473c4df` adds no statement (only deletions and docstring text), so the other binders are r15's.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | (simp; done)`: 35 errors at exactly the 35 admitted declarations, so none closes by one of these tactics. `toFlow_apply` (`:= rfl`) restates a definition and is native at main's pin (`Flow/Basic.lean:67` `flowOf_apply`): R01 step 2.

**Library declarations opened at Tau Ceti `2fd255d9`, each compared with the README sentence that cites it (file:line, hypotheses as found).**

- `Wedge/Basic.lean:430` `pairedWedge_flip` (any pairing, continuity of the uncurried pairing, which `mu.continuous₂` supplies); `Wedge/Assoc.lean:114` `pairedWedge_assoc` (`h : ∀ a b c, mu₁₂₃ (mu₁₂ a b) c = mu₁₂₃' a (mu₂₃ b c)`); `Alternating/Wedge.lean:116` `curryLeft_pairedWedge`; `BracketWedge.lean:112` `bracketWedge_skew` (`hβ : β a b = −β b a`); `:124` `bracketWedge_jacobi` (only `β (β a b) c + β (β b c) a + β (β c a) b = 0`, as README 0.1 says).
- `VectorBundle/ContinuousAlternatingMap.lean:116` `instContMDiffVectorBundleContinuousAlternatingMap`, from the prebundle's `IsContMDiff` instance; `:85–108` give it at every order under `NeZero ((card ι)! : 𝕜)`, and the theorem form discharges `n ≠ ω` automatically: README 0.2's sentence.
- `Wedge/Smooth/Basic.lean:104` `smoothForms_wedgeWith_mem`; `ExtDeriv.lean:247` `mextDeriv_add` (pointwise, differentiability within `range I` of the chart expressions), `:268` `mextDeriv_smul` (any division semiring of scalars, no hypothesis); `Naturality.lean:190/239/249` `mpullback_mextDeriv_at/_on/_` (`C²` map, `C¹` form); `Squared.lean:72` `mextDeriv_mextDeriv` (`C²` form); `Regularity.lean:223` `isSmoothForm_mextDeriv` (`[IsManifold I 2 M]`, `n + 1 ≤ p`); `Wedge/Leibniz.lean:97/131` `mextDeriv_wedgeWith`, `mextDeriv_wedge` (both forms `MDifferentiableAt` at the point, sign `(−1)^k`); `VectorField.lean:193` `mextDeriv_apply_one` (form and fields differentiable at the point, `mvfderiv`).
- `Flow/Basic.lean:57,62` `flowDomain := Prod.swap ⁻¹' maximalIntegralCurveFlowDomain v`, `flowOf v t x := maximalIntegralCurve v x t` (the bodies of `Suggested.lean:626–633`); `Flow/Complete.lean:61` `IsCompleteVectorField := flowDomain v = univ`, `:144` `…_of_isCompact_of_eq_zero_off` (`C¹`, `[CompleteSpace E]`), `:154` `…_of_compactSpace`; `Flow/Related.lean:51` `maximalIntegralCurveInterval_subset` (differentiable `f`, related fields, no regularity), `:76` `apply_flowOf` (`[T2Space M'] [IsManifold I' 1 M'] [BoundarylessManifold I' M']`, `Y` `C¹`, `(t, x) ∈ flowDomain X`).
- `Boundary/Orientation.lean:46` `IsOutwardPointing` (boundary point and negative zeroth coordinate of the chart derivative, the body of `Suggested.lean:960–964` up to `fromTangentSpace`); `:152` `IsOutwardPointingField`; `OutwardExistence.lean:75` `exists_isOutwardPointingField` (`[T2Space M] [SigmaCompactSpace M] [IsManifold (𝓡∂ (n+1)) ∞ M]`).
- `Analysis/Green/Basic.lean:71` `circulationFun`, `WindingWeight/Basic.lean:37` `windingWeight` (zero on the trace), `Winding.lean:30` `green_ac_winding`, `IndexOne.lean:33` `green_ac_index_one`, `:65` `green_ac_flux` (`X dy − Y dx`, `∂ₓX + ∂ᵧY`), `FiniteSum.lean:34` `green_ac_winding_sum` (total index), `Cycle.lean:36` `Contour.Cycle.green_winding`: binder for binder the deleted statements of 5.6.3.
- `VectorBundle/Riemannian/Existence.lean:69` `nonempty_contMDiffRiemannianMetric` (`[FiniteDimensional ℝ EB] [T2Space B] [SigmaCompactSpace B] [IsManifold IB ∞ B] [FiniteDimensional ℝ F] [ContMDiffVectorBundle n F E IB]`); `Riemannian/Gradient/Basic.lean:73` `mgradient := rieszDual x (mvfderiv I f x)`; `Laplacian.lean:57,135,238` `divergence`, `hessian`, `laplaceBeltrami` with the bodies of `Suggested.lean:1245–1263`; `:197` `hessian_symm` (`ContMDiffAt I 𝓘(ℝ) 2 f x`); `DivergenceTheorem.lean:73,216,225` `integral_divergence_eq_zero` (`[I.Boundaryless]`, `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`, `C¹` field, `HasCompactSupport`); `:312` `integral_mul_laplaceBeltrami` (`f` `C¹` compactly supported, `g` `C²`: the README's "`C²` functions" asks more than needed, harmless); `:337` `…_right_eq_left` (`f` `C²` compactly supported, `g` `C²`).
- `Orientation/Lift.lean:52` `OrientationLift`; `Orientation/Basic.lean:32,164,172,263` `Orientation`, `ext`, `eq_or_eq_neg` (`[PreconnectedSpace M]`), `class Orientable`; `Orientation/Pullback.lean:173` `pullback` (`ContMDiff I I' 1 f`, `∀ x, (mfderiv I I' f x).IsInvertible`, `Fintype.card ι = finrank ℝ E`); `Orientation/TopForm.lean:186` `ofTopForm` (`IsSmoothForm I 0 φ`, `∀ x, φ x ≠ 0`, index `Fin k` with `finrank ℝ E = k`); `Orientation/Atlas.lean:181` `IsOrientedAtlas.orientable` (`[NeZero n]`, every model); `Orientation/OrientedAtlas.lean` `IsOrientedAtlas` (at `358314d4` in `Orientation.lean:332`).
- `Instances/Comap.lean:194` `compatible_chartedSpaceComap`; the 2.4 cover declarations as r18 listed them (`Cover/Basic.lean:55,63,71,79`, `Cover/Smooth.lean:71,108,149,170`, `Cover/Descent.lean:68,79,91`, `DifferentialForm/Involution.lean:42,48,123,234,245`, `FundamentalGroup.lean:41`).
- The other 118 Tau Ceti names of the *From Tau Ceti* section (de Rham, chains, Sard, degree, Brouwer, covering, Riesz, volume, contour, filled hull, metric derivative, distributions): all declared at `2fd255d9`; 62 of them have no declaration at `358314d4` (R01).

**Mathlib.** Every Mathlib name the sampled passages cite exists at both Mathlib pins (`f6090c70` on the branch, `1b1ccf4b` on main): `curveIntegral_eq_intervalIntegral_deriv`, `AbsolutelyContinuousOnInterval`, `BoxIntegral.IntegrationParams.Henstock`, `IntegrableOn.hasBoxIntegral`, `hasIntegral_GP_pderiv`, `BoxIntegral.HasIntegral`, `HasFDerivWithinAt.curveIntegral_segment_source`, `ContinuousOn.curveIntegrable_of_contDiffOn`, `curveIntegral_trans`, `intervalIntegral.sum_integral_adjacent_intervals`, `Complex.contDiffAt_log`, `extDeriv_constOfIsEmpty`, `extDerivWithin_pullback`, `ContinuousAlternatingMap.ofSubsingletonLIE`, `MulAction.instChartedSpaceQuotient`, `IsLocalHomeomorph.chartedSpace`, `IsCoveringMap.isLocalHomeomorph`, `contMDiff_neg_sphere`, `range_mfderiv_coe_sphere`, `boundary_product`, `InnerProductSpace.instLaplacian`, `CovariantDerivative.leviCivitaConnection`, `mfderivToContinuousLinearEquiv`, `Module.finBasisOfFinrankEq`, `ModelWithCorners.convex_range`, `contMDiff_coe_sphere`, `range_mvfderiv_subtypeVal`, `injective_mvfderiv_subtypeVal_sphere`, `curryLeft_same`, `AlternatingMap.domCoprod`, `MultilinearMap.uncurrySum`, `modelWithCornersEuclideanQuadrant`, `Convexity.StdSimplex`, `ModelWithCorners.ofConvexRange`, `Geometry/Manifold/IntegralCurve/UniformTime.lean`, `Topology/VectorBundle/ContinuousAlternatingMap.lean`.

**Seeded sample (8 targets).**

- "Smooth 2-forms" (README 427–436): `Geometry/Manifold/TwoForm/Basic.lean:37` `abbrev SmoothTwoForm`, `TwoForm/Closed.lean`, `Geometry/Symplectic/Manifold/TwoForm.lean:115` `structure IsSymplectic`, `Symplectic/Manifold/Energy.lean`: all present at both pins; the migration is still a target at both.
- "Canonical interfaces and reuse" (README 1183–1222): `Distribution.lean:269,351,499` `IsContMDiffDistribution`, `IsInvolutiveDistribution` (brackets of fields differentiable and tangent on an open set, as the paragraph says), `standardContactDistribution` (carrier `v.2.2 = p.1 * v.2.1`, the `ker(dz − x dy)` convention the Acceptance paragraph names); `Foliation/Basic.lean`, `Distribution/Graph.lean`, `Analysis/ODE/Frobenius.lean` at both pins; `Distribution/IntegralManifold.lean` (with `Nonempty N` in `IsIntegralManifold`, `:78`) only at `2fd255d9` (R01).
- "Acceptance examples" (layer 4, README 1343–1354): the adapter `S(x,y,z) = (y,x,z)` carries `ker(dz − y dx)` to `ker(dz − x dy)`: `S^*(dz − x dy) = dz − y dx` (r15's value, rechecked: under `S`, `x ↦ y`). "Acceptance examples" (5.6, README 1926–1945): ellipse `a = 2, b = ½`: `∮ x dy = 3.1415927 = πab`; `h(t) = t² sin t⁻²`: `sin 1 = 0.8414710`; weak field `|x − ½|`: `∂ᵧP = 0`, `∂ₓQ = 1`, area `1`.
- "Conventions and existing inputs" (README 1711–1724) and "Henstock–Kurzweil" (README 1800–1813): the Mathlib names above, `TauCeti.Contour.windingNumber` (`Analysis/Contour/Winding/Number/Basic.lean` at both pins); `hasIntegral_GP_pderiv` is stated for `GP`, as the paragraph says.
- "Flat punctured-plane family" (README 1947–1961): `∂ₓQ_α − ∂ᵧP_α = 2ρ^{−α} − 2αρ^{−α−1}(x(x+y) − y(x−y)) = 2(1−α)ρ^{−α}`; numerically at `α = 0.7`, `(x, y) = (1.3, −0.4)`: central differences `0.3900597`, formula `0.3900597`; unit-circle circulation `6.2831853` for `α = 0.7` (integrand identically `1`).
- "Ownership and ordering" (README 1963–1979): `Completed/ContourIntegration/README.md` (index and cycles, lines 62, 107, 249), `Completed/ConformalMapping/README.md` "## Layer 5: Jordan domains and the boundary index" (line 733; `filledHull` at 25, 262–271), `TauCetiRoadmap/PDE`, `ModularForms`, `GeometricMeasureTheory`, `Isoperimetry`: all exist on main.
- The README flags no locator as unverified (0 matches).

**Lee locators** (cached text `67802551…`, recorded `uncertified`; theorem labels found at these lines): Thm 9.16 (9713, compactly supported fields complete), Prop 9.6 (9406, naturality), Prop 13.3 (15147, metrics exist), Prop 15.33 (18003, unique smooth outward unit normal; 5.1 cites it for the outward field, a weaker consequence), Lemma 14.13 (16457, `ι_v` antiderivation with sign `(−1)^k`), Prop 14.29 (16995), Thm 16.32 (19732, oriented, compactly supported: the roadmap's unoriented statement is more, by its own density route), Prop 15.15 (17651), Prop 15.5 (17550), Prop 15.6 (17594: converse under `∂M = ∅` or `dim M > 1`, which 2.2's half-space remark reproduces).

**Overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39. No cited id is dropped by an open pull request and none is defined only by an open revision. RiemannianGeometry (#1683) consumes `TauCeti.Manifold.laplaceBeltrami` and says it is not a second definition (its README 155–156, 642), consistent with 12.3. DeRhamCohomologyAndDuality (#2085) names this roadmap's sections as suppliers (its README 3, 60–80, 122) and restates none of 2.4, 5.6 or 12 (0 hits for `invariantPart`, averaging, orientation cover, Green). Ownership against open pull requests without a path was not checked.

**Headline theorems** (README 13–18): Stokes (5.3, 5.5b), flows for Banach models (3.1–3.2), Frobenius and leaves (4), the de Rham theorem (8.5), Poincaré duality (9.3), the degree (10.4), the hairy ball theorem (11), Green for AC cycles (5.6.3), Laplace–Beltrami with the divergence theorem (12.5). Stated: 3.1–3.2 (`exists_contDiffAt_localFlow_of_completeSpace`, `isOpen_…_of_completeSpace`, `contMDiffOn_…_of_completeSpace`), 4 (five theorems), 11 (two), 12.5 with boundary (`integral_divergence_eq_boundaryFlux`). Named not statable: 5.3, 5.5b, 8.5, 9.3, 10.4 (docstring 51–75); 5.6.3 and boundaryless 12.5 are cited to Tau Ceti. At `358314d4` the "not statable" list is right; at `2fd255d9` 5.3 is native (R01).

**Adversarial table.** Rows marked r15–r18 are carried from those reports for statements this diff leaves untouched; the others were computed here.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `bracketWedge_jacobi` hypothesis (README 0.1 and its Check) | `[e₁,e₂]=e₃`, `[e₂,e₃]=e₁`, `[e₃,e₁]=e₁` at `(e₁,e₂,e₃)` | cyclic sum `[e₃,e₃] + [e₁,e₁] + [e₁,e₂] = 0 + 0 + e₃ ≠ 0`; the theorem's only hypothesis is this cyclic sum `= 0` | Check refutes exactly what the hypothesis excludes | none |
| `pairedWedge_flip` "every pairing" | `μ = mul` on ℝ, two covectors | `φ∧ψ(v,w) = φv ψw − φw ψv`; flip gives `(−1)^1(ψ∧φ)(w,v)` = same | holds; `mu.continuous₂` supplies the continuity binder | none |
| `isSmoothForm_mextDeriv` (README 1.3) | `p = 1, n = 0`; `p = n = ∞` | `0 + 1 ≤ 1`: `dφ` continuous (`continuous_mextDeriv`, `:230`); `∞ + 1 ≤ ∞`: the kept `isSmoothForm_mextDeriv_infty` | README's "`n + 1 ≤ p` on a `C²` manifold" exact | none |
| `mextDeriv_add` pointwise (README 1.1 Check) | `φ = ∛x dy`, `η = (x − ∛x) dy` at `0` | both chart expressions non-differentiable at `0`: hypotheses fail; `d(φ+η) = dx∧dy ≠ 0 = dφ + dη` (junk) | Check matches the native hypotheses | none |
| `mextDeriv_smul`, no hypothesis | `c = 0`; `c = 2`, `φ = ∛x dy` at `0` | `0 = 0`; junk `0 = 2·0` | holds for any scalar | none |
| `apply_flowOf` (README 3.4) | `f = id`; `f` constant to a point, `Y = 0` | `flowOf X t x = flowOf X t x`; `f(flowOf X t x) = pt = flowOf 0 t pt` | holds; target needs `T2`, `C¹`, boundaryless, present at `Related.lean:70` | none |
| `isCompleteVectorField_of_isCompact_of_eq_zero_off` (3.3 Check) | rotation field on ℝ²; `v = x²` on ℝ | complete, not compactly supported; `1/(1−t)` blows up at `t = 1` | compact support sufficient, not necessary | none |
| `hessian_symm` at a `C²` point (12.3 Check) | `f = x₁x₂` flat; `f = |x|` at `0` | `Hess(e₁,e₂) = 1 = Hess(e₂,e₁)`; `|x|` not `C²` at `0`, theorem silent | hypothesis `ContMDiffAt … 2 f x` as README says | none |
| `integral_divergence_eq_zero` support form | `X = e^{−x²}∂ₓ` on ℝ (not compactly supported); bump field | `∫ div X = ∫ (e^{−x²})' = 0` anyway; bump: `HasCompactSupport` ⇔ vanishes off a compact `K` (`T2`) | README's "vanishes outside a compact subset" equals the native hypothesis under `T2` | none |
| Green's first identity hypotheses | `f` bump, `g = x²` on ℝ | `∫ f·2 = −∫ f'·2x = 2∫ f` by parts | native needs `f` `C¹` only; README says `C²` (more than needed, true) | none |
| `nonempty_contMDiffRiemannianMetric` (12.1) | tangent bundle of ℝⁿ, `n = 0` | the constant metric; `n = 0`: the zero fibre, inner product `0`, positive-definite vacuously | hypotheses as README 12.1 lists | none |
| `Orientation.pullback` dimension hypothesis (2.2 Check) | empty `M` over ℝ², `M' = ℝ`, `ι = Fin 1` | `card = 1 ≠ 2`: `hι` fails, no orientation; nonempty `M`: invertible `mfderiv` forces `card = dim` | `hι` explicit at `Pullback.lean:174` | none |
| `ofTopForm` index (2.2) | `k = finrank ℝ E` | `Orientation I M (Fin (finrank))`, the index of `Orientable` | README's `Fin (finrank ℝ E)` is the instance `hk = rfl` | none |
| `IsOrientedAtlas.orientable` over every model (2.2) | `[0, ∞)` with `{id}`; `Icc 0 1` | oriented atlas `{id}` gives an orientation; `Icc 0 1` has none, so the converse direction is the one that needs boundaryless (2.2's Check) | `[NeZero n]` only | none |
| `exists_isOutwardPointingField` (5.1 Check) | `v = 0` at a boundary point | `0 < 0` false: not outward; conclusion `IsOutwardPointingField` forces `v ≠ 0` on `∂M` | holds | none |
| `green_ac_winding`, `green_ac_index_one`, `green_ac_flux`, `green_ac_winding_sum`, `Cycle.green_winding` vs the deleted statements | binder comparison; flux with `(P,Q) = (−Y, X)` | identical binders; `circulationFun (−Y) X = X·im − Y·re`, `curl (−Y) X = ∂ₓX + ∂ᵧY` | native = deleted statements | none |
| Native `flowDomain`, `flowOf`, `IsCompleteVectorField`, `divergence`, `hessian`, `laplaceBeltrami` bodies vs `Suggested.lean` | definitional comparison | identical (`mgradient`: `mvfderiv` for `mfderiv I 𝓘(ℝ)`, the same map) | duplicates after the merge (R01 step 2) | R01 |
| Half-space Stokes at main's pin (5.3, docstring 51–53) | `Stokes.lean:37` binders | `C¹` compactly supported `n`-form, `[IsManifold ∞] [T2] [SigmaCompact]`, outward-first `boundaryOrientation`, `∫_M dφ = ∫_{∂M} φ|_{∂M}` | 5.3's statement, proved natively; docstring says not statable | R01 |
| Docstring claim on `Manifold.Orientation.ext` (`Suggested.lean:48–49`) | grep of the 5 consumer modules and every roadmap `.lean` on branch and main | 0 uses; `Orientation/Basic.lean:164` proves it | false claim, duplicate admission | R03 |
| Punctured family curl (5.6 Acceptance) | `α = 0.7`, `(1.3, −0.4)`; circle | `0.3900597` both sides; circulation `6.2831853`; closed iff `α = 1` since `2(1−α) = 0` | holds | none |
| Ellipse, HK, weak field (5.6 Acceptance) | `a = 2, b = ½`; `t² sin t⁻²`; `|x − ½|` | `3.1415927 = πab`; `sin 1 = 0.8414710`; `∂ᵧP = 0`, `∂ₓQ = 1`, area `1` | holds | none |
| Contact adapter (layer 4 Acceptance) | `S(x,y,z) = (y,x,z)` | `S^*(dz − x dy) = dz − y dx`; native carrier `v.2.2 = p.1 · v.2.1` is `ker(dz − x dy)` | holds | none |
| Lee locators (10) | the labels above | each theorem found at the cited number with the hypotheses the README states | holds | none |
| r18: triviality ↔ orientable, no connectedness (2.4) | `∅`, point, `S¹`, Möbius `B`, `ℝP²`, `S¹⊔S¹`, `S¹⊔B` | cover components `0,2,2,1,1,4,3`; section/trivial/orientable agree on all seven; disconnected ≠ orientable on `S¹⊔B` | holds | none |
| r18: `d` commutes with averaging (2.4) | `τ ≡ c` on ℝ, `C¹` `f`; `τ = id` | `d((f+f(c))/2) = df/2 = (df + 0)/2`; `dφ = dφ` | holds for any `C²` self-map | none |
| r18: antipodal sign `(−1)^{n+1}` (2.4) | `n = 0, 1, 2` | `−1`, `+1`, `−1`; outward-first at `(1,0)`: `det((1,0),(0,1)) = 1` | matches 2.2's Check | none |
| r18: π₁ criterion vs `FundamentalGroup.lean:41` | `S²`, `ℝP²`, `S¹`, plane with two origins | trivial π₁ orientable; `{1}` index 2; `2ℤ` index 2 yet orientable; non-Hausdorff orientable | sufficient only | cited, not stated (repaired) |
| r17: 2.3 chart formula; `exp(i t³)` refutation; LieGroups name map | `t³ + c` chart; `|p'(0)| = 0`, `|p'(1)| = 3` | prose matches `Comap.lean`; `IsCoveringMap.inducedChartedSpace H hp` elaborates | holds | none |
| r16: 2.3 smooth-lift criterion `f = ∛` | `t = 2`; quotients at `0` | `(∛2)³ = 2.000000`; `∛h/h = 100.0`, `10000.0` | incompatible structures | none |
| r15: 5.5b facet signs on `Q²`; product signs on `[0,1]²`; fibres | outward-first; `ω = y dx`; `(0,t),(t,0),(0,0)` | `det(−e₀,e₁) = −1`, `det(−e₁,e₀) = +1`; `∫dω = −1 = ` top edge; `1,1,2` | holds | none |
| r15: 5.1 half-space sign; 12.4 volume; 12.3 `hessian`, `mgradient` | chart `x ↦ (0,x)`; `diag(4,1)`; `e^{2x}δ` | `det(−e₀,e₁,…) = −1`; `√det g = 2.0`, `div = 2`; `Γ²₂₁ = 1`, `grad x₁ = ¼∂₁` | holds | none |
| r15: `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = e^{−t}∂ₜ`; `X = 1` | `−1.000000` both sides; `X = 1` fails `hSupport` | holds | none |
| r15: `green_verticalCell`; `Density`, `m < dim`; local flow law; `timeDependentFlowDomain_eq_univ`; hairy ball; 8.3 corner route | unit square `P = y`; `dim 3, m = 2`; `v = x²`; `(0,1)∪(2,3)`; `n = 0,1,2`; `x₀ = 1` | `−1 = −1`; `(8 − 4)·toFun v = 0`; `x/(1−tx)`; excluded by `OrdConnected`; `ix` nowhere zero on `S¹`, poles on `S²`; `−ε ∉ range I` | holds | none |
| r15: `exists_isSliceChart_integralManifold`; `isCompleteVectorField_of_compactSpace`, `toFlow_apply` | `span e₁`; irrational leaf; rank 0; branch vs main | slice elaborates; dense leaf in no line; `{e x}`; native `Flow/Complete.lean:154`, `Flow/Basic.lean:67` | true; duplicates after the merge | R01 |

## Not verifiable

- [Lee] GTM 218 is read from the cached text recorded as `uncertified` (a course-page copy); the ten locators above agree with it. [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy; the citations are to standard theorems and are carried by their locators.

## Source issues

- none
