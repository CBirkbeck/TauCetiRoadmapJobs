# Review of RiemannianGeometry (pull request #1683 at 28b0cf1)

**Verdict:** needs changes

RiemannianGeometry is a roadmap on main; this pull request amends R1.4 (radial-parallel orthonormal frames), adds R5a.3 (paraboloid geodesics and the vertex pole) and adds `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean`. The new mathematics is correct (every formula of R5a.3 and R1.4 recomputed below; the new Lean file elaborates at the pins with exactly three `sorry` warnings). The verdict is driven by the gate, which fails on this head (`sorry-data=4`, `build=1`, `blob=7`, `tex=7`), by an unowned supplier citation in R6, and by two headline theorems that are statable at the pins but absent from `Suggested.lean`. All blocking findings are in text this pull request did not touch; they are listed because the gate must pass and the folder is reviewed as a whole.

## R01 (P2) — `Suggested.lean` carries four `sorry`'d data declarations and eight dependents

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` lines 91–99 (`cOneEndpointZeroFields`, three `sorry` proof fields of a `Submodule`), 103–106 (`indexForm … := by sorry`), 194–197 (`secondFundamentalForm … := by sorry`), 213–218 (`shapeOperator … := by sorry`).

Claim: these are definitions (data) with `sorry` bodies; the gate reports `sorry-data=4`, and the principles forbid sorry'd data outright.

Witness: gate line `sorry-data (4)` at this head, naming exactly these four lines; `indexForm_apply` (108–121), `secondFundamentalForm_along_curve` (200–208), `inner_shapeOperator` (220–227), `euclideanImmersionSecondFundamentalForm` (247–251), `euclideanSecondFundamentalForm` (254–257), `euclideanSecondFundamentalForm_along_curve` (261–268), `euclideanShapeOperator` (273–279) and `inner_euclideanShapeOperator` (281–289) mention them.

Repair: delete the four definitions and the eight dependents (and `extendIntervalField`, lines 85–87, which then has no user). The README already states the index form (R3), B and S (R5a) as targets with their intended signatures; heavy definitions are README targets, not sorry'd Lean data.

## R02 (P2) — the build gate fails on the module-system warning

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` line 1 (`import Mathlib`).

Claim: the targeted build compiles, but Lake emits "imports `Mathlib` … designed for use with the module system; consider adding `module`", and the gate counts every warning other than `declaration uses sorry` as a build failure (`build=1 FAIL`).

Witness: gate section `build (1)` at this head; the same warning is reproduced by the worker's build log quoted in the gate.

Repair: make the file a module-system file: first line `module`, then `public import Mathlib` and `public import TauCeti.…` for the six Tau Ceti modules, the module docstring, then `@[expose] public section` before `noncomputable section` (TypeAHeckeAlgebras on main is the precedent; the gate's import rule accepts `public import Mathlib`). Do the same in `ParaboloidTargets.lean` for uniformity.

## R03 (P2) — two headline theorems are statable at the pins but absent from `Suggested.lean`

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` (whole file); README R4 item 4 (line 765, Cartan–Hadamard) and R4.9 (line 815, three simple closed geodesic images on a smooth two-sphere).

Claim: both end theorems can be written against the pinned carriers, so their absence is a defect; the file instead carries padding (R11).

Witness: a scratch probe elaborated at the pins with only `sorry` warnings. Cartan–Hadamard, in the `GlobalDistance` context of lines 137–142 plus `[ConnectedSpace M] [CompleteSpace M]`: for `p : M` and `hK : ∀ x (u v : TangentSpace I x), inner ℝ (curvatureTensor x u v v) u ≤ 0`, the conclusion `IsCoveringMap (TauCeti.Manifold.riemannianExp I M p)` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:98`; `Mathlib/Topology/Covering/Basic.lean:287`). Three geodesics: for `M` with `[ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] [IsManifold (𝓡 2) ∞ M]`, a `RiemannianBundle` instance, `IsContMDiffRiemannianBundle (𝓡 2) ∞ …` and `Nonempty (M ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1)`, the conclusion `∃ (γ : Fin 3 → ℝ → M) (T : Fin 3 → ℝ), (∀ i, 0 < T i ∧ TauCeti.Manifold.IsGeodesicCurveOn (𝓡 2) (γ i) univ ∧ (∀ t, γ i (t + T i) = γ i t) ∧ InjOn (γ i) (Ico 0 (T i))) ∧ ∀ i j, i ≠ j → range (γ i) ≠ range (γ j)`. Note: with the concrete model `𝓡 2` the instance `IsContMDiffRiemannianBundle (𝓡 2) 1 …` needed by `IsGeodesicCurveOn` is not found from the `∞` instance within the default heartbeats; adding it as an explicit instance binder makes the statement elaborate without any `set_option`.

Repair: state both in `Suggested.lean` (the second with the explicit order-one instance binder), each with `sorry`, and name in the module docstring the headlines that remain unstatable (Morse index theorem and Takahashi, which need the index form and a Laplacian carrier; Bochner vanishing, which needs a de Rham cohomology carrier at the pin).

## R04 (P1) — R6 consumes GeometricTopology Layer 1 declarations that exist nowhere

Location: `TauCetiRoadmap/RiemannianGeometry/README.md` lines 1324–1328 ("Consume GT Layer 1's `euclideanSquaredDistance_isProper`, `euclideanNormalEndpoint_criticalImage_isNull`, `ae_nondegenerateCriticalPoints_euclideanSquaredDistance` … `ae_isMorse_euclideanSquaredDistance`") and 1333–1335 (`euclideanChartSquaredDistanceHessian`, `euclideanChartNormalDerivativePairing`).

Claim: the a.e.-Morse and properness theorems for Euclidean squared-distance functions, which R6's focal/index comparison needs, are attributed to a supplier that does not state them, so they are unowned.

Witness: GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md`, Layer 1 at line 177, tubular neighbourhoods at lines 218–222) contains none of the six names; neither does GeometricTopology at the head of its open pull request, nor the pinned Tau Ceti (`TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean` has `normalTube`, `exists_isTubularNeighborhood_normalBundle` and no squared-distance result); `roadmaps grep` finds the names only in this README and in AffineMorseLefschetz on main (lines 167–177), which cites GeometricTopology for them in the same way. MorseTheory on main (line 456) also cites "GeometricTopology Layer 1's squared-distance exhaustion".

Repair: own them in R6 as targets: for a closed `C²` embedding `f : M → ℝⁿ`, `h_q = |f − q|²` is proper; the set of `q` for which `h_q` has a degenerate critical point is the image of the focal set and is Lebesgue null; for smooth `f` and almost every `q`, `h_q` is Morse (Milnor, *Morse Theory*, §6, Theorem 6.6, with the chart Hessian and normal-derivative pairing as the two lemmas R6 already describes at lines 1318–1319). Replace the six names by R6 targets, and keep GeometricTopology Layer 1 cited only for the normal bundle, tubular neighbourhood and nearest-point map it does state.

## R05 (P3) — TeX-only subscripts outside code spans

Location: `TauCetiRoadmap/RiemannianGeometry/README.md` lines 821, 827, 841, 847, 849, 857, 1046 (gate `tex (7)`), e.g. `D_{η_def}(C)` at line 847 and `g_{γ(t)}` at line 821.

Repair: put each expression in a code span or write the subscript in Unicode/words; the gate rule is quoted in `gate.md`.

## R06 (P3) — links pinned to repository commits

Location: README lines 66 (SmoothBundlesConnections), 83 and 289 (ComplexKahlerGeometry), 94 and 1238 (VariationalMethods), 99 (UnboundedOperators), 144 (PseudodifferentialOperators): `github.com/…/blob/<sha>/…` (gate `blob (7)`).

Repair: SmoothBundlesConnections and ComplexKahlerGeometry are on main: link `../SmoothBundlesConnections/README.md` and `../ComplexKahlerGeometry/README.md`. VariationalMethods, UnboundedOperators and PseudodifferentialOperators are not on main: name the roadmap and section with no URL.

## R07 (P3) — pull-request URLs as citations

Location: README lines 120, 165, 616: `[HomotopySpheres …](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)`.

Claim: cross-roadmap citations name the roadmap and section, never a pull request; the number is also stale (HomotopySpheres' open pull request is a different one).

Witness: HomotopySpheres at its open head has §3A.1 (15 mentions) and Stage 4B (29 mentions), so the sections resolve by name.

Repair: write "HomotopySpheres §3A.1" and "HomotopySpheres Stage 4B" with no link.

## R08 (P3) — three dead relative links

Location: README line 50 `../HopfRinow/README.md`; lines 134 and 903 `../ConformalMapping/README.md`; line 173 `../RicciFlow/README.md`.

Witness: on main, HopfRinow and ConformalMapping live under `Completed/`; RicciFlow is not on main (open pull request, merge order 196).

Repair: `../../Completed/HopfRinow/README.md`, `../../Completed/ConformalMapping/README.md`; name RicciFlow without a link.

## R09 (P3) — supplier labels that the suppliers do not use

Location: README lines 94 and 1238 ("VariationalMethods V2.3–V2.4/V3–V5.2"); line 650 ("PositiveMass P2.3").

Witness: VariationalMethods at its open head has `### 2.3 Energy space and forcing maps`, `### 2.4 Semibounded shifts`, Layers 3–5 with `### 5.2 Domain expansions, spectrum and weak equations`; PositiveMass at its open head has `### 2.3 Maximal-volume rigidity`. The content matches the citations; only the labels differ (`roadmaps resolve` reports both as found nowhere).

Repair: cite "VariationalMethods §2.3–§2.4 and Layers 3–5.2" and "PositiveMass §2.3".

## R10 (P3) — form of `ParaboloidTargets.lean`

Location: `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean` lines 19–26 and 48 (no docstrings on `timeIntegrand`, `angleIntegrand`, `timeIntegral`, `angleIntegral`, `point`); README R5a.3 lines 1192–1194 (links the file, names none of its declarations); lines 55–72 (`geodesic_crossings`).

Claim: (a) every declaration needs a docstring; (b) every Lean name appears in the README, and none of the eight here does; (c) `geodesic_crossings` quantifies over free functions `r θ : ℝ → ℝ` with ODE hypotheses, a coordinate stand-in for the statement about geodesics of the paraboloid's induced metric, which the module docstring concedes.

Witness: the three theorems are true as stated (table rows below), so this is form only. The induced metric in the single Cartesian chart is `g = δ + 4 x xᵀ` on ℝ², smooth across the vertex, so the geometric statement is statable on the manifold `EuclideanSpace ℝ (Fin 2)` once a `RiemannianBundle`/`IsContMDiffRiemannianBundle` instance with that real body is provided (its `pos`, `symm`, `isVonNBounded`, `contMDiff` fields need real proofs, not `sorry`).

Repair: either state the geometric theorem on that carrier (every maximal unit-speed geodesic avoiding the vertex has infinitely many distinct transverse self-intersections) and keep the integral estimates as its lemmas, or keep the coordinate statements as Checks in R5a.3 and drop the file. In either case add docstrings and name every kept declaration in R5a.3.

## R11 (P3) — padding in `Suggested.lean`

Location: lines 242–244 (`immersionNormal_eq_normalSubspace`, `rfl`), 306–318 (`norm_veronese`, `inner_fderiv_veronese`, `veronese_fibers`: small computations mirroring R8.5), 333–391 (`brokenNode_first`, `brokenNode_last`, `continuous_brokenNode`, `continuous_brokenDiscreteEnergy`, `isOpen_brokenEnergyDomain`, `brokenDiscreteEnergy_edge_bound`, `brokenEnergyDomain_edge_lt`: proved API lemmas with `@[simp]`/`@[fun_prop]`), and the definitions `brokenNode`, `brokenDiscreteEnergy`, `brokenEnergyDomain`, `veronese` that no headline uses.

Repair: delete them from `Suggested.lean`; the README (R3.2, R8.5) keeps each as a target or Check.

## R12 (P3) — README shape: no `*Needs:*` lines, undeclared backticked names

Location: whole README; e.g. lines 1079 (`volumeVariation_isContDiff`), 1213 (`minimalNormalSecondVariation`), 1225 (`hypersurfaceJacobiOperator`), 1247, 1257, 1263, 1265.

Claim: the house shape has `*Needs:*` lines, `## Exact supplier contracts` and `### Dependencies`; without `*Needs:*` lines the dependency check has no edge from this roadmap to check (its "0 problems" is vacuous: this README cites PseudodifferentialOperators, HomotopySpheres, VariationalMethods, UnboundedOperators and LieGroupoidsPoisson, all only in open pull requests). A backticked name of this roadmap's own claims a declaration in `Suggested.lean`; the seven listed are not declared there.

Repair: unbacktick the seven names (or declare them), and give at least the sections touched here `*Needs:*` lines, e.g. R5a.3: HopfRinow (Completed) Layers 2–4, R2's Jacobi API, R5a.2's coordinate formulas.

## R13 (P3) — the projective metric block has no locator

Location: README lines 286–320 (**Projective metric examples**).

Claim: the curvature range [1,4], the period π, the `−½ Re tr(XY)` normalisation and `ω_g = π·ω_FS` are stated without a source and theorem number; the sampled target could only be checked by computation (table rows below).

Repair: add the locators (the Hopf-fibration computation and O'Neill's formula from the convention reference the README names, with theorem and page), and record the source in `sources.toml`.

## Verified sound

**Gate and tooling.** Text scanners rerun at this head reproduce the worker's result (`blob=7 tex=7 sorry-data=4`, all other counters 0). Dependency check: `depcheck: 204 roadmaps, 1500 edges, 0 problem(s)` (no UPWARD/CYCLE line; see R12 for why it is vacuous here). Branch manifest equals main's: Mathlib `f6090c70`, Tau Ceti `358314d4` (2026-10-07). `lake env lean` on `ParaboloidTargets.lean`: three `declaration uses sorry` warnings (lines 32, 40, 55), nothing else, 11.6 s. Diff outside the folder: none (`git diff --stat origin/main...HEAD` lists only the two folder files).

**Elaborated signatures.** All 37 declarations of `Suggested.lean` compared with the README; the 14 declarations flagged as having lost a section binder are all `def`s or explicitly `omit`ted theorems whose types do not mention the binder (`IsJacobiFieldOn`, `extendIntervalField`, `cOneEndpointZeroFields`, `indexForm`, `immersionNormal`, `secondFundamentalForm`, `shapeOperator`, the three `euclidean…` definitions, `immersionNormal_eq_normalSubspace`, `brokenNode`, `brokenNode_first`, `brokenNode_last`); no `sorry`'d theorem lost a hypothesis its README statement carries.

**Library declarations opened at the pins.** `TauCeti.Manifold.riemannianExp` (Geodesic/Exponential.lean:98, junk value `p` off `expDomain`), `TauCeti.Manifold.IsGeodesicCurveOn` (Geodesic/Basic.lean:98, needs `IsManifold I 2`, `IsContMDiffRiemannianBundle I 1`, `UniqueDiffOn`), `curveVelocityWithin` (MFDeriv/Curve.lean:122), `HasSectionalCurvatureAt` (Curvature/Sectional.lean:140), `HasConstantSectionalCurvature` (:164), `IsConstantCurvatureTensor` (Curvature/Metric.lean:141, 172), `ricciTensor` (Curvature/Ricci.lean:57), `completeSpace_ofRiemannianMetric_of_isPretransitive_isom` (Riemannian/Homogeneous.lean:79; needs `T3Space`, `IsManifold I 1`, a pretransitive `Isom I M`, as R1 states), `ContMDiffRiemannianMetric` (Mathlib Geometry/Manifold/VectorBundle/Riemannian.lean:244), `IsCoveringMap` (Mathlib Topology/Covering/Basic.lean:287), sphere manifold instances (Mathlib Geometry/Manifold/Instances/Sphere.lean:385, 417). The pinned Tau Ceti has no Jacobi fields, no parallel transport and no `Curvature/Polarization.lean`: `constant_sectional_tensor_iff` and `schur` are not duplicates at the pin (the library's main has since proved both, per `STATUS.md`; nothing to change at this pin).

**Cross-roadmap citations resolved.** SmoothBundlesConnections B5.0 on main (lines 1072–1113) supplies "smooth finite-dimensional path families give smooth transport in initial points and parameters", which is exactly what R1.4's new text consumes; B6.0 (line 1306) exists. HopfRinow is complete (`Completed/HopfRinow/README.md`). GeometricTopology Layers 1/7/8 (lines 177, 627, 696) and the smoothing-and-triangulation section (line 930) exist; `HyperbolicMetric`/`ModelGeometry.Space` are named there. PDE "A.1–6/D16–19/E20–22" = Lane A items 1–6, Lane D items 16–19, Lane E items 20–22 on main. GeneralizedCohomology G4.0b, TopologicalKTheory T6.6, CharacteristicClasses C2.0 with `bundleDiskSphereRelCW`/`bundleDiskAttachmentCWModel`, AlgebraicTopology 8.11a with `finiteSourceMappingCWType`/`basedLoopCWType` and AT4.4 `reducedSuspensionSphereHomeomorph`, Yamabe Y9, Isoperimetry I6, SpinGeometry G1.2/G2.2/G3.4, MorseTheory M5, DGFloer's Moore-path convention, OptimalTransport Layer 7, HeegaardFloer Lane M: all found on main. LieGroupoidsPoisson G0.0 found at its open head. UnboundedOperators UO-D06 = §4.7 at its open head. Pinned names cited by the README and found: `manifoldMorseIndex` (Morse/Index.lean), `pathLoopSpaceMulEquiv`, `RealProjectiveSpace.fundamentalGroupMulEquivAt`, `riemannianVolume`, `HyperbolicMetric`, `MetricSpace.ofRiemannianMetric`, `unitSphereIsomHom`, `isPretransitive_isom`, `affineIsometryMulEquiv`, `symmL_alongCurveInChartWithin`, `riemannianLog`, `IsNormalDomain`, `normalSubspace`, `SmoothEmbedding`, `ClassicalGroups/WeylDimension/{Odd,Even}Orthogonal.lean`.

**Suppliers only in open pull requests** (allowed by the brief as new-folder pull requests; recorded for the author): PseudodifferentialOperators (merge order 8), HomotopySpheres (64), RicciFlow (196, consumer only), CalibratedGeometry (208, consumer only), VariationalMethods and UnboundedOperators (not yet in the merge order), LieGroupoidsPoisson.

**Adversarial table.** Rows cover the sampled target, the headline theorems and every target a finding touches.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R5a.3 polar metric `(1+4r²)dr²+r²dθ²` | z=x²+y², x=r cos θ | dz=2r dr, dx²+dy²=dr²+r²dθ² | matches | none |
| R5a.3 `(r′)²=(r²−a²)/(r²(1+4r²))` | unit speed + r²θ′=a; r=a; r→∞ | r′=0 at r=a; r′²≈1/(4r²) | matches; consistent with T_a≥R²−a² | none |
| R5a.3 `r″` formula and `r″(0)=1/(a(1+4a²))` | Euler–Lagrange for L=(1+4r²)r′²+r²θ′²; also ½f′(a) with f=(r²−a²)/(r²(1+4r²)) | (1+4r²)r″=−4r r′²+a²/r³; ½f′(a)=1/(a(1+4a²)) | both routes agree | none |
| R5a.3 `T_a`, `A_a` integrals | dt/dr=1/r′, dθ/dr=θ′/r′ | integrands s√(1+4s²)/√(s²−a²), a√(1+4s²)/(s√(s²−a²)) | matches | none |
| R5a.3 integrability at a | s↓a | integrand ~ C(s−a)^(−1/2) | integrable; continuous from 0 | none |
| R5a.3 `T_a(R)≥R²−a²`, `A_a(R)≥2a log(R/a)` | √(1+4s²)≥2s, √(s²−a²)≤s; R=a | integrands ≥2s, ≥2a/s; both sides 0 at R=a | holds, sharp at R=a | none |
| R5a.3 symmetry `r(−t)=r(t)`, `θ(−t)=2θ₀−θ(t)` | second-order ODE uniqueness at (a,0); θ′=a/r² even | r′ odd, θ′ even | holds (first integral alone insufficient: r≡a solves it) | none |
| R5a.3 crossings `γ(t_n)=γ(−t_n)` | A_a(R_n)=(n+1)π, n=0 | θ(t_n)−θ(−t_n)=2(n+1)π=2π | same point, radii R_n strictly increasing | none |
| R5a.3 transversality | tangents (r′,a/R_n²), (−r′,a/R_n²) | det = 2a r′(t_n)/R_n² ≠ 0 since r′(t_n)>0 | holds | none |
| R5a.3 `K=4/(1+4r²)²`, vertex Jacobi field | graph formula; r(ℓ) with dr/dℓ=(1+4r²)^(−1/2) | K(0)=4; r″(ℓ)=−4r/(1+4r²)² so r″+Kr=0, r(0)=0, r′(0)=1 | ∂_θ is the normal Jacobi field, length r(ℓ)>0 | none |
| `ParaboloidTargets.integral_estimates` | R=a (junk value √0=0, division by 0 = 0) | both integrals 0, bounds 0 | true | none |
| `ParaboloidTargets.integral_monotonicity_and_limits` | integrand sign on (a,∞) | positive | StrictMonoOn, continuity, →∞ true | none |
| `ParaboloidTargets.geodesic_crossings` | r′ never 0 (monotone r→L≥a, r″→1/(a(1+4a²))>0) | contradiction, so a turn exists; strict local minima only, so unique | hypotheses consistent (actual geodesics satisfy them), conclusion true | form only (R10) |
| R1.4 radial frame | v=0; isometric transport; ∇_w E_i(p)=D/ds E_i(exp sw)|₀ | E_i(p)=e_i; orthonormal; 0 | holds | none |
| R1.4 "frames not identified away from p" | unit S², Y⊥T unit, |v|=t | coordinate vector length sin t/t, transported length 1 | differ for t>0 | none |
| R1.4 jet `|d exp_(tT)(tY)|²=t²−⅓K t⁴+O(t⁵)` | unit S² | sin²t = t²−t⁴/3+… | matches with K=1 | none |
| Projective block: K ∈ [1,4] | O'Neill K=1+¾|[X,Y]^v|², |[X,Y]^v|²=4⟨X,JY⟩² | K=1+3⟨X,JY⟩²; Y⊥JX gives 1, Y=JX gives 4 | attained for d≥2; d=1 constant 4 = S²(½) | none |
| Projective block: period π | horizontal great circle γ(t)=cos t x+sin t y | γ(π)=−x ~ x | primitive period π | none |
| Projective block: `⟨X,Y⟩=−½ Re tr(XY)` | X_v=[[0,−v*],[v,0]] | −½tr(X_v²)=|v|², X_v e₀=v | normal homogeneous = round quotient | none |
| Projective block: sp(d+1) `−¼ Re tr` doubled | q ↦ 2×2 complex block | tr_ℂ = 2 Re tr_ℍ | consistent | none |
| Projective block: `ω_g=π·ω_FS` | area of CP¹=S²(½) | 4π·¼=π; ∫ω_FS=1 | holds; ω_g(u,Jv)=g(Ju,Jv)=g(u,v) | none |
| R1 bi-invariant `R(X,Y)Z=−¼[[X,Y],Z]` | ∇_XY=½[X,Y], README convention, Jacobi identity | ¼[[X,Y],Z]−½[[X,Y],Z] | matches; K=¼|[X,Y]|²≥0 | none |
| R1 conformal `Scal̃`, `Ric̃` | n=2 | K̃=e^(−2u)(K−Δu); Ric̃=Ric+(Δ⁺u)g | matches classical formula | none |
| `schur` | n=2 (excluded), n≥3 connected | hypothesis 3≤finrank | matches R1.3 | none |
| `bonnetMyers_distance` | unit Sⁿ, Ric=(n−1)g, λ=n−1 | bound π = diameter | sharp; n≥2 enforced | none |
| `riemannianDist_eq_sSup_smooth` | (0,1)⊂ℝ, f=id | sup=|x−y|=dist | holds without completeness; `[ConnectedSpace M]` in scope | none |
| `jacobi_eq_zero_of_nonpositive_curvature` | hK = ⟨R(u,v)v,u⟩≤0 | matches K sign convention | holds | none |
| `IsJacobiFieldOn` | D_t²X+R(X,γ′)γ′ | argument order matches R2 | consistent | none |
| R6 regression `I_M(X,X)=1/b−1` | unit circle, γ(t)=(1−t,0), X=(1−t/b)e₂ | ∫₀^b (1/b)² dt − ⟨S X(0),X(0)⟩ = 1/b − 1 | matches (S_η=Id for η=γ′(0), the inward normal) | none |
| R8.5 Veronese | x=(1,0,0) | (√3/2,0,0,0,−½), norm² = 1 | `‖F x‖=‖x‖²` holds | none |

**Read but not re-derived.** R3.3–R3.4, R4.1–R4.8 and the whole of R4.9 (curve shortening on S²), R5b, R7 and R8 are pre-existing text this pull request does not touch; they were read for gate, citation, shape and policy defects (R05–R09, R12) but their analytic estimates were not recomputed in this round.

## Not verifiable

- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed.: the README's principal convention reference (Chapters 7–8, 10–12), paywalled (Springer); cited by locator only, uncertified. The sampled projective block gives no locator into it or anything else (R13).
- J. Milnor, *Morse Theory*: JSTOR link is paywalled; §6 Theorem 6.6 (used in the R04 repair) and §§13–18 cited by locator only.
- J. Milnor, *Curvatures of left invariant metrics on Lie groups* (1976): resolved only to a paywalled page through the sources service; not needed for a finding (the bi-invariant formulas were recomputed).
- W. Ziller, *Examples of Riemannian manifolds with non-negative sectional curvature*, arXiv:math/0701389 (fetched, open repository): mentions Fubini–Study only as a recognition target and the Hopf fibrations qualitatively; it does not contain the computation the projective block needs, so it certifies nothing here.
- Z. Wang's notes (xumin.net PDF): not fetched this round; no finding depends on them.

## Source issues

- none
