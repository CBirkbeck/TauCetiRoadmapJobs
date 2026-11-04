# Review of RiemannianGeometry (pull request #1683 at 164b354)

**Verdict:** needs changes

## R01 (P3) — The coordinate companion acceptance file is still in the folder

**Location:** `TauCetiRoadmap/RiemannianGeometry/ParaboloidTargets.lean:6–10`: “These real-coordinate targets illustrate its integral and crossing statements … The theorem admissions are future proof targets, not implemented results.” Not repaired since the previous review (its R02); the file is byte-identical.

**Claim:** The file's five definitions and three admitted theorems are proof-route lemmas of R5a.3 on bare real functions (`r θ : ℝ → ℝ` with three scalar equations, `ParaboloidTargets.lean:55–62`), not headline theorems; the definitions carry no docstrings; none of the eight names (`timeIntegrand`, `angleIntegrand`, `timeIntegral`, `angleIntegral`, `integral_estimates`, `integral_monotonicity_and_limits`, `point`, `geodesic_crossings`) appears in the README; and the geometric headlines it illustrates are already stated natively at `Suggested.lean:395` and `:416`.

**Witness:** `README.md:1973–1976` says the integral estimates “are part of their proof and Checks”; the statements are true (with `a=1`, `R=2`: `T_1(2)≈5.0979≥3`, `A_1(2)≈2.8412≥2 log 2≈1.3863`, `r″(0)=1/5`, crossing determinant `2a r′/R²≠0`), which is exactly why they are README Checks and not acceptance targets. The file elaborates at the pin with three `sorry` warnings and no error (scratch probe), so this is purely a form finding.

**Repair:** Delete `ParaboloidTargets.lean`. The README keeps the two integrals, their lower bounds, the symmetry `r(−t)=r(t)` and the crossing construction as targets and Checks of R5a.3 (they are already there at `README.md:1898–1944`). Do not prove the three statements in place.

## R02 (P3) — Myers' theorem is cited for a conclusion it does not state

**Location:** `README.md:1159–1163`: “prove diameter≤π√((n−1)/λ), compactness and finite fundamental group at every basepoint (`myers_finite_fundamentalGroup`) (Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 5.2.26, p. 220, with λ=(n−1)/r²)”; the same locator in the References at `README.md:2794`.

**Claim:** Theorem 5.2.26 states the diameter bound and compactness only; finiteness of the fundamental group is not part of it.

**Witness:** `nicolaescu-lectures line 9923–9931` (printed p. 220–221): the theorem's conclusions are that every geodesic of length `≥ πr` has conjugate points, `diam(M) ≤ πr`, and compactness by Hopf–Rinow. The universal-cover argument the README's own proof sketch uses (apply the same bound upstairs) is Nicolaescu's Example 6.2.29, `line 10851–10857` (printed p. 243), which concludes that the universal cover is compact; finiteness of the fibre, hence of `π₁`, is the step the README's R4.3 owns.

**Repair:** Split the locator: “(Nicolaescu, Theorem 5.2.26, p. 220, with λ=(n−1)/r², for the diameter bound and compactness; Example 6.2.29, p. 243, for compactness of the Riemannian universal cover, from which R4.3's fibre finiteness gives finite `π₁`)”, and add Example 6.2.29, p. 243, to the Nicolaescu entry in the References.

## Verified sound

This is a full review of head `164b354`, 346 lines changed since the head the previous review read. It has **two findings, both P3; no P1, no P2.** The worktree was not edited; probes ran on scratch copies.

### Previous findings checked against this head

| Previous finding | Passage at 164b354 | Disposition |
|---|---|---|
| R01 (P2) statable comparison headlines absent | `Suggested.lean:167` `rauch_norm_ge_of_sectional_le`, `:190` `synge`, `:201` `synge_orientable_of_odd`, `:236` `bishopGromov`, `:274` `myers_finite_fundamentalGroup`, `:315/:325/:337` `killingHopf_euclidean/sphere/hyperbolic`, with the real-bodied `modelSine` (`:157`) and `modelBallVolume` (`:226`); README sentences name each (`README.md:1035–1041, 1083, 1161, 1190–1197, 1255–1263`). | **Repaired**, and beyond the request: Bishop–Gromov is stated for every `κ` with the model volume `∫₀ʳ s_κ^(n−1)`, not only the flat form; Killing–Hopf is stated in all three cases, the hyperbolic one on the pinned `TauCeti.UpperHalfSpace`. Every hypothesis the repair asked for is in the elaborated types (table below). |
| R02 (P3) companion file | `ParaboloidTargets.lean` unchanged. | **Not repaired**: R01 above. |
| R03 (P3) claim-level locators | Andrews Prop. 16.2.1, p. 154 at `README.md:278–279`; the Lee Chapter 7 reference at `:295–303` replaced by a derivation from SmoothBundlesConnections B5.0 and §1.1 item 2 (no external locator needed); O'Neill article pages 459–469 at `:471–472` and `:2781`; Nicolaescu Prop. 4.1.25, p. 151 for the first-order contact at `:644–645`; Brewin §5 p. 9 and (11.1) p. 15 for the jets at `:650–653`; the speed metric now defined at `:770–773` with no external reference. | **Repaired.** All five locators read against the cached texts (source table below). |
| R04 (P3) scope sentence about another roadmap | `README.md:24–29`: R7A's ownership and R4.7's ownership stated as this roadmap's own; PseudodifferentialOperators P7a mentioned only as a consumer. | **Repaired.** The dependency check still has no edge to PseudodifferentialOperators. |
| R05 (P3) radial-parallel frame API and Checks | `README.md:610–641`: four API bullets (joint smoothness including `v=0`, orthonormality, radial parallelism `D_sE_i=0`, `∇_wE_i(p)=0`) and four Checks. | **Repaired.** Check values recomputed: flat transport is the identity; on the unit sphere at `t=π/2` the transported vector has norm `1` against `sin(π/2)/(π/2)=0.6366` for the coordinate vector; transporting `2e₁` gives constant norm `2`; the holonomy of the octant triangle is its area `π/2`. |

No repair report marks any finding “not actionable in this package”.

### Gate, direction and elaboration

The worker's gate at this head reports every counter zero and OK (targeted build, dependency check, imports, sorry-data, set_option, stray-files, outside-folder, source-material). The diff outside the folder against `origin/main` is empty. My own run of the dependency check on this head's README:

```text
depcheck: 203 roadmaps, 1654 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line names only Mathlib, Tau Ceti, this roadmap's layers, roadmaps on main or the Completed folder (checked by directory: HopfRinow, ConformalMapping and UniversalCovers in Completed; DifferentialGeometry, SmoothBundlesConnections, GeometricTopology, ComplexKahlerGeometry, PDE, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, GeometricMeasureTheory, Isoperimetry, SpinGeometry, AlgebraicTopology, MorseTheory, HeegaardFloer, DGFloer, AffineMorseLefschetz, Yamabe, OptimalTransport, NoncommutativeGeometry, PseudodifferentialOperators, RepresentationTheory/{LieGroups,ClassicalGroups,CompactGroups} on main). The prose-only citations of open new-folder pull requests by the same author (VariationalMethods §§2.3, 2.4, 5.1, 5.2 at its head lines 494, 528, 839, 882; UnboundedOperators §4.7) were settled by the earlier reviews of this folder and are unchanged. RicciFlow, HomotopySpheres, PositiveMass, SpectralManifolds and CalibratedGeometry appear only as owners of other theorems or as consumers, never as suppliers.

`lake env lean` on a scratch copy of `Suggested.lean` in which every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | sorry` exited 0 with exactly 23 `sorry` warnings (lines 72, 81, 92, 119, 131, 144, 167, 190, 201, 236, 253, 263, 274, 284, 315, 325, 337, 365, 395, 416, 446, 471, 480) and no error: no admitted theorem closes by one tactic, and reading each new statement against the pinned definitions found no single library lemma that proves one (the pinned Tau Ceti has no Rauch, Bishop–Gromov, Synge, Myers, Cartan–Hadamard or Killing–Hopf statement: grep over `TauCeti/` and `Mathlib/Geometry/`). The same probe on `ParaboloidTargets.lean` exited 0 with three `sorry` warnings. The six definitions have real bodies on native carriers; there is no `set_option`, no sorried data, no foreign-roadmap import; the imports are `Mathlib` and nine existing `TauCeti.*` modules (the five new ones, `VolumeDensity.Volume`, `Isometry.Basic`, `Riemannian.Sphere`, `Hyperbolic.UpperHalfSpace`, `Orientation`, all exist at the pin).

The worker's `#check @name` transcript covers all 30 declarations (its thirtieth, `is`, is the word “is” inside the docstring at line 364, not a declaration). I compared each elaborated type with its README statement. The one flagged binder loss is `IsJacobiFieldOn` without `[I.Boundaryless]`, as before: the predicate's body needs no boundaryless model and `README.md:526–527` says so; every theorem about it keeps the binder. Present in the elaborated types of the new statements: `0 < b`, unit speed on `[0,b]`, `X 0 = 0`, `D_tX(0) ⊥ γ′(0)`, the global sectional bound with the Gram factor and the guard `0 < κ → b < π/√κ` (Rauch); `ConnectedSpace`, `CompactSpace`, `TauCeti.Orientable I ∞ M`, `Even (finrank ℝ E)` and positivity on linearly independent pairs (Synge even), the same without orientability and with `Odd` (Synge odd); `ConnectedSpace`, `CompleteSpace`, `MeasurableSpace`, `BorelSpace`, `SecondCountableTopology`, `IsContinuousRiemannianBundle`, the Ricci bound with the factor `(n−1)κ`, `0 < r ≤ s` and the model guard (Bishop–Gromov); `2 ≤ finrank`, `0 < λ`, the Ricci bound and a basepoint (Myers); `ConnectedSpace`, `CompleteSpace`, `SimplyConnectedSpace`, `IsRiemannianManifold (𝓡 n) M` and the constant-curvature predicate with `2 ≤ n` (sphere) and `1 ≤ n` (hyperbolic) (Killing–Hopf).

### Headline coverage

| Headline (README) | `Suggested.lean` |
|---|---|
| Constant sectional curvature ⇔ tensor form (R1.1 item 2) | `constant_sectional_tensor_iff`, 72 |
| Schur; Einstein-factor constancy (R1.1 item 3) | `schur`, 81; `einstein_factor_constant`, 92 |
| Jacobi existence and interval uniqueness (R2.1) | `exists_jacobi_initial_data`, 131; `jacobi_eq_of_initial_data`, 119 |
| No endpoint-zero Jacobi field under `K ≤ 0` (R2.1/R3) | `jacobi_eq_zero_of_nonpositive_curvature`, 144 |
| Rauch lower bound (R4.1) | `rauch_norm_ge_of_sectional_le`, 167 |
| Bishop–Gromov (R4.1) | `bishopGromov`, 236, general `κ` |
| Cartan–Hadamard (R4.4) | `cartanHadamard_isCoveringMap`, 253 |
| Bonnet–Myers distance form; finite `π₁` (R4.5) | `bonnetMyers_distance`, 263; `myers_finite_fundamentalGroup`, 274 |
| Synge, even and odd (R4.6) | `synge`, 190; `synge_orientable_of_odd`, 201 |
| Killing–Hopf (R4.7) | `killingHopf_euclidean`, 315; `killingHopf_sphere`, 325; `killingHopf_hyperbolic`, 337 |
| Two distinct geodesics on a closed manifold (R4.8) | `two_distinct_geodesics`, 284 |
| Three simple closed geodesic images (R4.9) | `three_simple_closed_geodesics`, 365 |
| Paraboloid crossings and vertex pole (R5a.3) | `paraboloid_geodesic_crossings`, 395; `paraboloid_vertex_pole`, 416 |
| Smooth-function distance duality (R7.8) | `riemannianDist_eq_sSup_smooth`, 446 |
| Fischer splitting and decomposition (R8.1) | `fischer_split`, 471; `fischer_decomposition`, 480 |
| Morse index theorem, focal index theorem, Günther, Gauss–Codazzi–Ricci, volume variations, Bochner connection, Bochner vanishing, Takahashi | named in the docstring as not statable, each with the missing carrier; checked: no index form on piecewise `C¹` sections, no injectivity radius, no second fundamental form, no bundle differential-operator carrier, no Hodge Laplacian or de Rham cohomology, no function Laplacian at the pins |

### Pinned objects opened (Mathlib `f6090c7`, Tau Ceti `358314d4`, the pins of the worktree manifest)

| Location at the pin | What it says and what it does not |
|---|---|
| `TauCeti/Geometry/Manifold/Orientation.lean:345` | `class Orientable [NeZero n] : Prop`: existence of an oriented atlas (charts compatible with the `C^n` structure, covering `M`, coordinate changes in `orientationPreservingGroupoid`). The atlas the manifold carries need not be oriented. |
| `TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.lean:44` | `RiemannianIsometry I J M N extends Diffeomorph I J M N ∞` with the inner-product law `inner_mfderiv'`; it asks nothing of the metric-space structures, so the sphere's chordal subtype metric does not enter the Killing–Hopf statement. |
| `TauCeti/Geometry/Manifold/Riemannian/Sphere.lean:60–76` | `sphereRoundMetric` is `inducedRiemannianMetric` of the inclusion `sphere 0 1 → E`; `instRiemannianBundleSphere` installs it, with `[Fact (finrank ℝ E = n+1)]`: the round metric of curvature `1`. |
| `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace.lean:102, 329–338` | `ChartedSpace (WithLp 2 (E × ℝ)) (UpperHalfSpace E)`; the installed metric is the Euclidean metric rescaled by `t⁻²`, i.e. `(‖dx‖² + dt²)/t²`. Its header (line 33) says constant curvature `−1` and completeness are not proved there; the roadmap's R4.7 owns both, so the headline is not vacuous and not circular. |
| `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:124` | `instance : RiemannianBundle (fun x : F ↦ TangentSpace% x)` from `riemannianMetricVectorSpace F`: the flat metric, which is what `killingHopf_euclidean`'s target `EuclideanSpace ℝ (Fin n)` carries. In the Paraboloid section this global instance is shadowed by the section's explicit instance variable, which `hmetric` pins to the graph metric. |
| `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:52–76` | `riemannianVolume I M` needs `[IsManifold I 1 M] [MeasurableSpace M] [BorelSpace M] [LindelofSpace M] [IsContinuousRiemannianBundle E _]`; second countability supplies Lindelöf. |
| `…/Curvature/Sectional.lean:70, 140, 164` | `sectionalCurvature = ⟨R(u,v)v,u⟩/det Gram`; `HasSectionalCurvatureAt`, `HasConstantSectionalCurvature` quantify over linearly independent pairs, vacuous in dimension `< 2`. |
| `…/Curvature/Metric.lean:141` | `IsConstantCurvatureTensor`: `R(w,u)v = κ(⟨u,v⟩w − ⟨w,v⟩u)`. |
| `…/Curvature/Ricci.lean:57` | `ricciTensor x u v`, the trace of `w ↦ R(w,u)v`; on the unit `S³` this is `2g`. |
| `…/Riemannian/Geodesic/Basic.lean:98`, `…/Exponential.lean:92–98` | `IsGeodesicCurveOn` (`UniqueDiffOn`, `C²`, zero covariant acceleration); `riemannianExp` is `p` off `expDomain`. |
| `TauCeti/…/Riemannian/ModelGeometry/Basic.lean:84` | `abbrev Space : ModelGeometry → Type`, the carrier the README's R4.7 names. |
| `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:361` | `pathLoopSpaceMulEquiv`, the loop-space shift R4.8 names. |

Also found at the pins, by name, every library declaration the README cites in the supplier contracts and `*Needs:*` lines: `completeSpace_ofRiemannianMetric_of_isPretransitive_isom`, `MetricSpace.ofRiemannianMetric`, `EMetricSpace.ofRiemannianMetric`, `affineIsometryMulEquiv`, `unitSphereIsomHom`, `UpperHalfSpace.isPretransitive_isom` (`UpperHalfSpace.lean:483`), `RealProjectiveSpace.fundamentalGroupMulEquivAt`, `exists_isTubularNeighborhood_normalBundle`, `manifoldMorseIndex`, `SmoothEmbedding.NormalSpace`, `normalClassL`, `inducedRiemannianMetric_inner`, `symmL_alongCurveInChartWithin`, `ricciTensor_eq_of_curvatureTensor_eq_smul_sub`, `scalarCurvature_eq_of_curvatureTensor_eq_smul_inner_sub`, `HyperbolicMetric`, `expDomain_eq_univ_iff`, the `ClassicalGroups/WeylDimension/{OddOrthogonal,EvenOrthogonal}.lean` files; Mathlib `LipschitzOnWith.extend_real`, `eq_compactlyGenerated`, `UCompactlyGeneratedSpace`, `Besicovitch.exist_disjoint_covering_families`, `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`.

### Supplier and ownership audit

All `*Needs:*` lines and the supplier prose were read; the supplier citations did not change in this round and every one resolved in the previous review was re-checked by directory on main (list above). Ownership by object for the new headlines: no roadmap on main, no package on the board and no `Suggested.lean` in the open pull requests supplied to this review declares Rauch, Bishop–Gromov, Synge, Myers' finite `π₁` or Killing–Hopf (`roadmaps grep --lean-only` finds no hit outside this folder); RicciFlow at its head owns the sphere theorems, PositiveMass §2.3 consumes R4.1's equality API, and neither builds the comparison theorems. The model function `s_κ` and the model ball volume have no carrier at the pins (grep for `sinh (Real.sqrt`/`sin (Real.sqrt` in Tau Ceti: none). No two `Suggested.lean` files in the supplied checkouts declare the same fully qualified name. Ownership against open pull requests not listed with files in the brief was not checked.

### Computed adversarial pass

Values I computed on this head; sphere radii are 1 unless stated.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `modelSine` | `κ=1,0,−1` at `t=π/2`; `κ=4` | `1`, `π/2=1.5708`, `sinh(π/2)=2.3013`; `s_4=sin(2t)/2`, `s_4′(0)=1.0000` (numeric), first zero `π/2`; wrong `sin(κt)/κ` has zero `π/4`, wrong `sin(√κt)` has slope `2` | definition pins normalisation; Check values correct |
| `rauch_norm_ge_of_sectional_le` | sphere radius `5/2` (`K=4/25≤1`), `J=(5/2)sin(2t/5)E`; `t=π/2`; `t=5π/2`; dimension 1 | `sin(π/2)=1 ≤ 2.5·sin(π/5)=1.4695`; at `5π/2`: `s_1=1`, `|J|=0`, so `1 ≤ 0` fails, excluded by `b<π`; dim 1: `J′(0)⊥γ′` forces `J≡0`, `0≤0` | guard `b<π/√κ` necessary; true as stated |
| `synge`, `synge_orientable_of_odd` | `S²`, `RP²`, flat `T²`, `RP³`, a point, `S¹` | `(orientable, π₁, K) = (yes,1,1), (no,ℤ/2,1), (yes,ℤ²,0), (yes,ℤ/2,1)`; point: `Even 0`, simply connected; `S¹`: odd, curvature vacuous, orientable | each hypothesis necessary; odd conclusion is orientability only |
| `modelBallVolume` | `n=2,κ=0`; `n=2,κ=1,r=π`; `n=3,κ=0`; `n=0,1`; scaling `κ=1→1/4, c=2, r=1` | `r²/2`; `1−cos π=2`; `r³/3`; exponent `0−1=0` gives `r`; `V_{1/4}(2)=1.83879=4·V_1(1)=1.83879` | API values and scaling law hold |
| `bishopGromov` | `ℝ²`, `r=1,R=2`; unit `S²` (`Ric=g`, `κ=1`) at `s=0.5,1,2,3`; same with `κ=0`; hyperbolic plane with `κ=0`; `n=0,1` | `π·4·1=π·1·4=12.566`; ratio `2π(1−cos s)/(1−cos s)=6.2832` constant; `2π(1−cos r)/r²=2.8884, 2.2245, 1.2732` at `r=1,2,π` nonincreasing; `2π(cosh r−1)/r²=3.4123, 4.3388` increasing, outside the hypothesis; point: `c/s≤c/r`; circle: `min(2s,L)/s` | inequality direction and Ricci hypothesis correct; dimension-free statement true |
| `myers_finite_fundamentalGroup` | `S³` (`λ=2`), `S³(2)` (`λ=1/2`), `RP³`, flat `T³` | bounds `π√(2/2)=3.1416`, `π√(2/0.5)=6.2832`; `RP³`: `π₁=ℤ/2` finite; `T³`: `λ=0` excluded, `π₁=ℤ³` | positivity of `λ` necessary |
| `killingHopf_euclidean` | `n=0`, `n=1`, `ℝⁿ` | point ≅ `EuclideanSpace ℝ (Fin 0)`; connected complete simply connected 1-manifold is `ℝ` (`S¹` has `π₁=ℤ`); flat `ℝⁿ` ≅ itself | holds for every `n` |
| `killingHopf_sphere` | `n=1`; `n=0`; `n=2` | the line has vacuous curvature `1` and is not `S¹`; `sphere 0 1 ⊂ ℝ¹` is two points; `S²` ≅ itself | `2 ≤ n` necessary and sufficient |
| `killingHopf_hyperbolic` | `n=1`; `n=0`; `n=2` | `UpperHalfSpace(ℝ⁰)={t>0}` with `dt²/t²` ≅ `ℝ` via `log`; `n=0`: `Fin(0−1)=Fin 0`, target 1-dimensional, source a point, excluded by `1 ≤ n`; `n=2`: `(dx²+dt²)/t²`, `K=−1` | guard `1 ≤ n` necessary |
| `constant_sectional_tensor_iff` | dim 0, 1; `S²`, `κ=1` | dim ≤ 1: left side vacuous, right side `⟨u,v⟩w−⟨w,v⟩u=0` for collinear vectors, both true for every `κ`; `S²`: `R(e₁,e₂)e₂=e₁`, `K=1` | iff holds in every dimension |
| `schur`, `einstein_factor_constant` | `S³ ⊔ S³(2)`; `g=dx²+e^(2x²)dy²` | `K=1` and `1/4` on the two components; surface `K=−f″/f=−2−4x²`, `K(1)=−6`, `∂ₓK(1)=−8`, `Ric=Kg` with nonconstant `K` | connectedness and `n≥3` both essential |
| Jacobi definition | flat `J=u+tv`, `J=t²E`; sphere `J=sin t·E` | residuals `0`, `2E`, `−sin t·E+sin t·E=0` | predicate separates the three |
| Normal-coordinate jets (R1.4) | `S²`, unit `T⊥Y`, `t=0.1` | `sin²t=0.0099667111`; `t²−t⁴/3+2t⁶/45=0.0099667111` | transverse coefficient `−K/3`; Brewin's `−⅓x^cx^dR_acbd` with `R_acad x^cx^d=+K|v|²` on the sphere |
| Radial-parallel frame (R05) | flat; `S²` at `t=π/2`; `2e₁`; octant triangle | identity; `1` vs `sin(π/2)/(π/2)=0.6366`; norm `2`; holonomy angle = area `4π/8=π/2` | four Checks discriminate |
| Polarization (Andrews) | orthonormal `e_i,e_j,e_k,e_l` | `3R_ijkl` from eight sectional curvatures (`andrews-dg-ch16 line 123–138`) | supports R1.1 item 2 |
| O'Neill on the Hopf fibration | horizontal orthonormal `X, JX` | `|[X,Y]^v|=2`, `¾·4=3`, `K=1+3=4`; totally real pair `K=1`; `X=[[0,−1],[1,0]]`: `−tr(X²)/2=1=|Xe₂|²`; `diag(0,i)`: `1/2` vs `1` | curvature range `[1,4]` and normalisation Check correct |
| O'Neill `T` on warped products | `dx²+e^(2x)dy²`, `dx²+e^(4x)dy²` | `Γˣ_yy=−e^(2x)`, `T_UU=−∂ₓ`, norm `1`; norm `2` | `T≡0` rejected |
| `cartanHadamard_isCoveringMap` | `ℝⁿ`, flat cylinder | `exp(v)=p+v` bijective; cylinder deck group `2πℤ` | covering, not injectivity; Nicolaescu 6.2.6 assumes completeness, as the statement does |
| Paraboloid integrals (R01) | `a=1`, `R=2` | `T_1(2)=5.0979 ≥ 3`; `A_1(2)=2.8412 ≥ 1.3863`; `r″(0)=1/(1·5)=0.2` | companion statements true; they are Checks |
| `riemannianDist_eq_sSup_smooth` | interval, `x=¼`, `y=¾`; `x=y` | `f(t)=t` gives `½=dist`; diagonal set `{0}` | unchanged from the previous review |
| `fischer_split`, `fischer_decomposition` | `n=3`: `r²`, `X₁²−X₂²`, `r⁴`; `n=0` | `(q,h)=(1,0)`, `(0,p)`; `Δr⁴=20r²`, `h₂=1`; `n=0`: every constant `q` works | `2≤n` excludes nonuniqueness |

### Source verification (seeded sample and the new locators)

| Target | Text read | Outcome |
|---|---|---|
| 1.1 Curvature identities | Andrews, Lecture 16, Proposition 16.2.1, `andrews-dg-ch16 line 104–139`, printed page header “154 Lecture 16. Curvature” | locator exact; the proposition reconstructs `R_ijkl` from sectional curvatures by the displayed polarization |
| 1.2 Local symmetry and Einstein factor | no external locator now; the derivation from B5.0 (SmoothBundlesConnections on main) and §1.1 item 2 with `κ=K(x)` checked: in dimension two `R=K·(g∧g)`, `∇g=0`, so `∇R=dK⊗(g∧g)` and `∇R=0 ⇔ dK=0` | sound |
| 1.3 Metric changes, Lie groups, submersions | O'Neill is a settled uncertified key; article pages 459–469 added; Hopf, warped `T`, `SU(2)` and conformal values recomputed above | mathematics verified; cited by locator |
| 2.1 Jacobi fields and initial data | Milnor §14 p. 77 and Lemma 14.4 pp. 80–81 are under the settled uncertified key; sign dictionary (`R(γ′,X)γ′` vs `R(X,γ′)γ′`) and the three Checks recomputed | mathematics verified; cited by locator |
| 2.2 Normal-coordinate jets (R1.4) | Nicolaescu Prop. 4.1.25, `nicolaescu-lectures line 6793–6797`, page header “4.1. METRIC PROPERTIES 151”: `g_ij(q)=δ_ij`, `∂_kg_ij(q)=0`; Brewin §5, `brewin-rnc line 363` (printed p. 9): `g_ab=g_ab−⅓x^cx^dR_acbd−⅙x^cx^dx^e∂_cR_adbe+O(ε⁴)`, and `line 614–615` (printed p. 15), equation (11.1), with `∇_c` in the cubic term | locators exact; the README's `−⅓⟨R(e_i,v)v,e_j⟩−⅙⟨(∇_vR)(e_i,v)v,e_j⟩` matches (11.1) under the stated convention |
| R4.4 Cartan–Hadamard | Nicolaescu Thm 6.2.6, `line 10630–10633`, page header “238” follows on the next page marker | locator exact |
| R4.5 Myers | Nicolaescu Thm 5.2.26, `line 9923–9931` (p. 220–221): `Ric ≥ (n−1)/r²` gives `diam ≤ πr` and compactness | locator exact for the diameter and compactness; finite `π₁` is Example 6.2.29, `line 10851–10857`, p. 243: R02 |
| R4.6 injectivity radius | Nicolaescu Def. 4.1.23, `line 6772–6775`, p. 151 | locator exact |

## Not verifiable

- **Lee, Introduction to Riemannian Manifolds** (`lee-irm`, settled uncertified): Chapter 10, section on cut points (`README.md:1208–1209`) and the Chapter 7–12 references are cited by locator only.
- **O'Neill 1966** (`oneill-submersion`), **Milnor, Morse Theory** (`milnor-morse-theory`), **Fulton–Harris** (`fulton-harris`): settled uncertified keys; cited by locator only.
- **Axler–Bourdon–Ramey, Harmonic Function Theory**, **Wang/Liang notes, Taimanov 1993, Gage 1990, Grayson 1989, Angenent 1988, White 2005, Allen–Layne–Tsukahara, Dobbins, Lauer, Ma, Homma, Azagra et al., Toth–Ziller, Kolář–Michor–Slovák, Gilkey**: not in this round's seeded sample and not re-read; their passages were unchanged since the previous review, which read the cached texts of Homma, Azagra, Toth–Ziller, Kolář–Michor–Slovák and Gilkey.

## Source issues

- none
