# Review of RiemannianGeometry (pull request #1327 at fda77cf)

**Verdict:** needs changes

RiemannianGeometry is a roadmap on main; this head amends it (R1.2 reconstruction identity, R3.3c stereographic Hopf block, R6 ownership of the squared-distance theory, R8.3 convention bridge, locators and Checks) and rewrites `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` as a ten-declaration acceptance test. The gate passes on this head, the dependency check reports no UPWARD or CYCLE line, the file elaborates with only `sorry` warnings, and every formula of the amended passages recomputes (table below). The one blocking finding is that three further headline theorems of R4, the comparison and space-form layer, are statable at the pins (two of them with the file's own `IsJacobiFieldOn`) but are neither stated nor named in the module docstring; the scratch statements that elaborate are given in R01.

**Previous review (pull request #1327 at 810f49e), finding by finding.** R01 (GeometricTopology names that exist nowhere): repaired, R6 now owns the properness, focal-image nullity, chart Hessian and normal-derivative lemmas as its own targets (README lines 1430–1462) and cites GT Layer 1 only for the normal bundle and tubular neighbourhood. R02 (sorry'd data): repaired, the four definitions and their eight dependents are gone (gate `sorry-data=0`; 26 declarations deleted, none cited by any other roadmap, see below). R03 (Cartan–Hadamard, three geodesics absent): repaired, `cartanHadamard_isCoveringMap` (line 139) and `three_simple_closed_geodesics` (line 177) are stated and the docstring names Morse index, Gauss–Codazzi/variations, Bochner and Takahashi as unstatable. R04 (ClassicalGroups Layer 3A): repaired, R8.3 cites Layer 3 as on main and states its own Classical convention with the Fulton–Harris locator (lines 1620–1648). R05 (blob links): repaired, gate `blob=0`. R06 (TeX subscripts): repaired, `tex=0`. R07 (pull-request URLs): repaired, `prnum=0`. R08 (dead relative links): repaired, all 24 relative link targets exist on main (`../../Completed/HopfRinow`, `../../Completed/ConformalMapping`; RicciFlow unlinked). R09 (supplier labels): repaired ("VariationalMethods §2.3–§2.4 and Layers 3–5.2", "PositiveMass §2.3"). R10 (companion Lean files): repaired, both files deleted, their statements folded into R1.2 and R3.3c Checks. R11 (padding): repaired, the proved API, `veronese` and `brokenNode` block are gone. R12 (shape): partly repaired, the amended passages carry Checks and `*Needs:*` lines and the seven undeclared backticked names are prose; the untouched sections keep the old shape (R02 below). R13 (projective block locator): repaired, O'Neill Theorem 2/Corollary 1 and the explicit curvature formula are in the block (lines 348–356). R14 (Math240 sentence): repaired, no occurrence of `Math240` or `0224_028`. R15 (Hopf block locator): repaired, Lyons section "Seeing the Hopf fibration", Investigation (L), Figure 10, recorded in `sources.toml` as `lyons-hopf`.

## R01 (P2) — three statable R4 headlines are absent from `Suggested.lean` and unnamed in its docstring

Location: `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` lines 16–30 (the docstring's "statable" and "not statable" lists) and lines 124–157 (section `GlobalDistance`); README R4.1 lines 760–764 (Rauch), 784–790 (Bishop–Gromov relative volume), R4.7 line 902 (Killing–Hopf).

Claim: R4 is titled "Comparison, complete manifolds and space forms"; its named theorems are the Rauch comparison (item 1), the Bishop–Gromov relative-volume monotonicity (the bold "Ricci lower bounds and relative volume" block, consumed by PositiveMass §2.3), Cartan–Hadamard, Bonnet–Myers, Synge and the Killing–Hopf classification (item 7). The docstring says which headlines are stated and which lack a carrier, but is silent on Rauch, Bishop–Gromov, Synge and Killing–Hopf, and the first three of these are statable at the pins: Rauch with the file's own `IsJacobiFieldOn` and one real-valued model function, Bishop–Gromov with `TauCeti.riemannianVolume` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76`, hypotheses `[MeasurableSpace M] [BorelSpace M] [LindelofSpace M]` and a continuous Riemannian bundle) and the Ricci tensor already used by `bonnetMyers_distance`, and the spherical Killing–Hopf with `TauCeti.RiemannianIsometry` (`Riemannian/Isometry/Basic.lean:44`, a diffeomorphism preserving the inner products) and the round sphere's Riemannian bundle (`Riemannian/Sphere.lean:73`).

Witness: three scratch files, each a copy of the head's preamble plus one declaration, elaborated with `lake env lean` at the pins (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`) with exactly one `declaration uses sorry` warning each and no error:

```lean
/-- `s_κ`: the solution of `s'' + κ s = 0` with `s(0) = 0`, `s'(0) = 1`. -/
def modelSine (κ t : ℝ) : ℝ :=
  if 0 < κ then Real.sin (Real.sqrt κ * t) / Real.sqrt κ
  else if κ = 0 then t
  else Real.sinh (Real.sqrt (-κ) * t) / Real.sqrt (-κ)

/-- R4.1, Rauch comparison under an upper curvature bound (in section `Intrinsic`). -/
theorem rauch_norm_ge_of_sectional_le {γ : ℝ → M} {X : ∀ t, TangentSpace I (γ t)} {b κ : ℝ}
    (hb : 0 < b) (hX : IsJacobiFieldOn (I := I) γ X (Icc 0 b))
    (hunit : ∀ t ∈ Icc 0 b, ‖TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) t‖ = 1)
    (h0 : X 0 = 0)
    (hnormal : inner ℝ ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X
      (Icc 0 b) 0) (TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) 0) = 0)
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤
        κ * (‖u‖ ^ 2 * ‖v‖ ^ 2 - (inner ℝ u v) ^ 2))
    (hmodel : 0 < κ → b < Real.pi / Real.sqrt κ) :
    ∀ t ∈ Icc 0 b, modelSine κ t *
      ‖(CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc 0 b) 0‖ ≤ ‖X t‖ := by
  sorry
```

```lean
/-- R4.1, Bishop–Gromov with the flat model (section `GlobalDistance` plus
`[MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
[IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]`; import
`TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`). -/
theorem bishopGromov_flat [ConnectedSpace M] [CompleteSpace M] (p : M)
    (hRic : ∀ x (v : TangentSpace I x),
      0 ≤ (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s) :
    (TauCeti.riemannianVolume I M (Metric.ball p s)).toReal / s ^ Module.finrank ℝ E ≤
      (TauCeti.riemannianVolume I M (Metric.ball p r)).toReal / r ^ Module.finrank ℝ E := by
  sorry
```

```lean
/-- R4.7, Killing–Hopf, spherical case (imports `TauCeti.Geometry.Manifold.Riemannian.Isometry.Basic`
and `TauCeti.Geometry.Manifold.Riemannian.Sphere`; the order-one and order-two bundle instances are
explicit binders for the same reason as in `three_simple_closed_geodesics`). -/
theorem killingHopf_sphere {n : ℕ} (hn : 2 ≤ n) {M : Type*} [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
    [RiemannianBundle (fun x : M => TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n)) (fun x : M => TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) 1 (EuclideanSpace ℝ (Fin n)) (fun x : M => TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) 2 (EuclideanSpace ℝ (Fin n)) (fun x : M => TangentSpace (𝓡 n) x)]
    [IsRiemannianManifold (𝓡 n) M] [ConnectedSpace M] [CompleteSpace M] [SimplyConnectedSpace M]
    (hK : (CovariantDerivative.leviCivitaConnection (𝓡 n) M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection (𝓡 n)) 1) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n) (𝓡 n) M
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) := by
  sorry
```

Each is true as written (table rows "Rauch probe", "Bishop–Gromov probe", "Killing–Hopf probe"): Rauch with the global bound `K ≤ κ` and the model's first zero excluded, Bishop–Gromov for complete connected `M` where balls have finite volume so `toReal` is honest, Killing–Hopf for `n ≥ 2` where the sphere is simply connected.

Repair: state these three in `Suggested.lean` (Rauch after `exists_jacobi_initial_data`, the other two in or after `GlobalDistance`, with the imports and binders noted in the docstrings), name them in the README at R4.1 and R4.7 with backticks, and extend the module docstring: Synge (R4.6) is not statable because the pins have no orientability predicate for manifolds, Lichnerowicz (R7.0) because there is no Laplacian on functions; the hyperbolic and Euclidean Killing–Hopf cases are statable on `UpperHalfSpace` and `EuclideanSpace` by the same pattern and may be stated or named.

## R02 (P3) — README shape outside the amended passages

Location: README R2 (lines 372–420), R3.1–R3.4, R4.1–R4.3, R4.6–R4.8, R4.9, R5a, R5b, R7, R8.1, R8.2, R8.4, R8.5: no `*Needs:*` lines and no `**Checks.**` lists; no `## Scope and ownership` or `## Exact supplier contracts` heading (the supplier list sits under `## Conventions and suppliers`, line 14); no `### Dependencies` per layer.

Claim: the house shape is prose per target with its `*Needs:*` line and at least three Checks per definition; the dependency check only sees `*Needs:*` edges, so for most of this roadmap its "0 problems" is thin. The amended passages (R1.2, R1.4, R3.3c Hopf block, R4.4, R4.9 head, R6, R8.3) now have the shape; the rest keeps main's. Also a label-form nit: "PDE A.1–6/D16–19/E20–22" (line 94) while PDE's own labels read `A.6`, `D.17`, `D.19`, `E.20` (PDE README lines 314, 548–552).

Repair: at least a `*Needs:*` line per `###` subsection and Checks for the definitions of R3.1–R3.2, R5a, R5b, R7 and R8.1; "PDE A.1–A.6, D.16–D.19, E.20–E.22".

## R03 (P3) — process narrative in "Dependency order and validation"

Location: README lines 1746–1748: "Compile prototypes against the real Tau Ceti imports; remove supplier mirrors when the actual API is available."

Claim: a working instruction, not a mathematical statement; the roadmap is timeless.

Repair: delete the sentence.

## Verified sound

**Gate and tooling.** The worker's gate at this head: every counter 0, `build=0`, OK. Dependency check rerun: `depcheck: 204 roadmaps, 1654 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line (RiemannianGeometry is on main and not listed in the merge order). `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Diff outside the folder against `origin/main`: none. Pins of the worktree manifest: Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`; every declaration below was opened at these pins.

**Elaboration and form.** `lake env lean TauCetiRoadmap/RiemannianGeometry/Suggested.lean`: nine `declaration uses sorry` warnings (lines 54, 63, 89, 101, 114, 139, 149, 177, 203), nothing else, 7.3 s. Form: `module`, `public import Mathlib` plus four `TauCeti.*` modules that exist at the pin, one module docstring naming the unstatable headlines, one definition with a real body (`IsJacobiFieldOn`), no `lemma`, no `set_option`, no `#eval`, a docstring on every declaration, README and Lean names agree (every backticked name of the roadmap's own in the README is declared; the other backticked tokens are notation such as `u_i`, `t_i`, `C_glue`). The worker's `signatures.md` lists an instance `is` at line 176: that is its parser reading the word "instance" inside the docstring of `three_simple_closed_geodesics`, not a declaration.

**Elaborated signatures.** `#check @` of all ten declarations in a scratch copy, compared with the README: `constant_sectional_tensor_iff` (R1.2), `schur` (R1.3, `[ConnectedSpace M]`, `3 ≤ finrank`), `IsJacobiFieldOn` (R2; drops `[I.Boundaryless]` because its type does not mention it, as a `def` should), `jacobi_eq_of_initial_data`, `exists_jacobi_initial_data` (R2, interval `Icc a b`, `a < b`), `jacobi_eq_zero_of_nonpositive_curvature` (R2/R3), `cartanHadamard_isCoveringMap` (R4.4, `[ConnectedSpace M] [CompleteSpace M] [IsRiemannianManifold I M]`), `bonnetMyers_distance` (R4.5, `2 ≤ finrank`, `0 < λ`), `three_simple_closed_geodesics` (R4.9), `riemannianDist_eq_sSup_smooth` (R7.8, `[ConnectedSpace M]`, no completeness). No `sorry`'d theorem lost a hypothesis its README statement carries.

**One-tactic probe.** A scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | (exact fun _ => by simp) | sorry`: six declarations fell through to `sorry`, three (`jacobi_eq_of_initial_data`, `jacobi_eq_zero_of_nonpositive_curvature`, `three_simple_closed_geodesics`) left unsolved goals after `simp` made progress; none closed. No padding.

**Library declarations opened at the pins.** Tau Ceti: `CovariantDerivative.curvatureOperator` (`Curvature/Basic.lean:85`, `∇_X∇_Y − ∇_Y∇_X − ∇_[X,Y]`, the README's convention at line 27), `curvatureTensor` (`Curvature/Tensor.lean:148`), `sectionalCurvature` (`Curvature/Sectional.lean:70`, `⟨R(u,v)v,u⟩/det Gram`), `HasSectionalCurvatureAt` (140, quantified over linearly independent pairs), `HasConstantSectionalCurvature` (164), `IsConstantCurvatureTensor` (`Curvature/Metric.lean:141`, `R(w,u)v = κ(⟨u,v⟩w − ⟨w,v⟩u)`, which is the README's `κ(⟨Z,Y⟩X − ⟨Z,X⟩Y)` with `X=w, Y=u, Z=v`), `ricciTensor` (`Curvature/Ricci.lean:57`, trace of `w ↦ R(w,u)v`; on the unit sphere `(n−1)⟨u,v⟩`, so the sign of `hRic` is right), `expDomain`/`riemannianExp` (`Geodesic/Exponential.lean:92, 98`), `IsGeodesicCurveOn` (`Geodesic/Basic.lean:98`: `UniqueDiffOn`, `C²`, vanishing acceleration), `curveVelocityWithin` (`MFDeriv/Curve.lean:122`), `alongCurveWithin` (`AlongCurve/Basic.lean:124`), `symmL_alongCurveInChartWithin` (`AlongCurve/Chart.lean:69`), `exists_isTubularNeighborhood_normalBundle` (`TubularNeighborhood/Euclidean.lean:454`: `[CompactSpace M]`, `C²`, injective immersion, as R6 says), `manifoldMorseIndex` (`Morse/Index.lean:74`), `riemannianVolume` (`VolumeDensity/Volume.lean:76`), `RiemannianIsometry` (`Isometry/Basic.lean:44`), `completeSpace_ofRiemannianMetric_of_isPretransitive_isom` (`Riemannian/Homogeneous.lean:79`), `MetricSpace.ofRiemannianMetric` (`Riemannian/Distance.lean:293`), `HyperbolicMetric` (`Riemannian/Hyperbolic.lean:46`), `UpperHalfSpace.isPretransitive_isom` (`Hyperbolic/UpperHalfSpace.lean:483`), `unitSphereIsomHom` and its injectivity (`Isometry/Sphere.lean:124, 150`), `RealProjectiveSpace` and `fundamentalGroupMulEquivAt` (`UniversalCover/RealProjective/Basic.lean:57`, `FundamentalGroup/Basic.lean:134`, `2 ≤ n`), `pathLoopSpaceMulEquiv` (`HomotopyGroup/LoopSpace.lean:361`), the `ClassicalGroups/WeylDimension/{OddOrthogonal,EvenOrthogonal}.lean` files R8.3 names. Mathlib: `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` (`MeasureTheory/Function/Jacobian.lean:645`), `Besicovitch.exist_disjoint_covering_families` (`Covering/Besicovitch.lean:455`), `IsCoveringMap` (`Topology/Covering/Basic.lean:287`), `Diffeomorph` (`Geometry/Manifold/Diffeomorph.lean:82`), and `Geometry/Manifold/Riemannian/Basic.lean:221`: the vector-space norm on `TangentSpace` is deliberately not a global instance, so `‖v‖` in `bonnetMyers_distance` and `‖mfderiv I 𝓘(ℝ,ℝ) f p‖` in `riemannianDist_eq_sSup_smooth` are the Riemannian norms the README means. The pinned Tau Ceti has no Jacobi field, Rauch, Cartan–Hadamard, Myers, Schur, Lusternik–Schnirelmann or distance-duality statement (grep), so nothing stated here duplicates the library.

**Cross-roadmap citations resolved.** On main: ClassicalGroups Layer 3 (line 237; the `SOₙ` type B/D classification for the connected group, line 265) and Layer 5 (line 297, with the `SOₙ` product forms), its standing convention `Matrix.orthogonalGroup`, i.e. the standard symmetric form R8.3's isotropic basis is written against; CompactGroups Layer 2 complete reducibility and the invariant product (lines 234, 248); GeometricTopology Layer 1 tubular neighbourhood (line 218); DifferentialGeometry Layer 10 with 10.2 Sard (lines 877, 884); SmoothBundlesConnections B5.0 (smooth families, line 1072) and B6.0 (uniform normal and strong-convexity radii, line 1327); SpinGeometry G1 (4 items), G2 (3 items), G3 (9 items) so G1.2/G2.2/G3.4 are item labels of the kind SpinGeometry uses itself (line 518); MorseTheory M1–M6, HeegaardFloer Lane M, DGFloer Layers 1–2, GeometricMeasureTheory G1/G3–G6, Isoperimetry I3/I6, CharacteristicClasses C2/C3 with `bundleDiskSphereRelCW`, `bundleDiskAttachmentCWModel`, AlgebraicTopology Stages 4/6/8 with `reducedSuspensionSphereHomeomorph`, `finiteSourceMappingCWType`, `basedLoopCWType`, LieGroups Layers 0–2, ComplexKahlerGeometry K7, OptimalTransport Layer 7, Yamabe Y9 (Obata), GeneralizedCohomology G4.0b, TopologicalKTheory T6.6; Completed: HopfRinow Layers 0–4, ConformalMapping L3/L5, UniversalCovers. At open heads: HomotopySpheres §3A.1 (line 663), Stage 4B (1341), §5.0 (1529); VariationalMethods §2.3, §2.4, Layers 3–5, §5.1, §5.2; UnboundedOperators §4.7 (UO-D06) in the OperatorTheory pull request; PositiveMass §2.3; PseudodifferentialOperators P1.0/P1.1, P5, P6, P7a; LieGroupoidsPoisson G0.0; CalibratedGeometry C3/C6; RicciFlow's sphere and Hamilton theorems. None is later than this roadmap in the merge order or cited upward.

**Ownership and consumers.** Cartan–Hadamard, Bonnet–Myers, Schur, the three closed geodesics, Jacobi fields and the curvature polarization were searched by object in every roadmap on main and at the open heads (`roadmaps grep`): the only other hits are mentions as consumers (RicciFlow, PositiveMass, OptimalTransport, HomotopySpheres, LieGroups, NoncompactQuantumSymmetry) or unrelated uses of the words; no roadmap states them. The 26 declarations this head deletes from the on-main `Suggested.lean` (`indexForm`, `secondFundamentalForm`, `shapeOperator`, the `euclidean…` family, `veronese…`, `brokenNode…`, `extendIntervalField`, `cOneEndpointZeroFields`, `immersionNormal…`) are cited by no other roadmap. One consumer note: CalibratedGeometry §C3 at its open head (line 237) cites "RiemannianGeometry R5a.1's `volumeVariation_isContDiff`", a name that was never declared and that this head rightly turns into prose; the section it needs (R5a.1, C² relative volume) is unchanged, so that citation now resolves to a prose target.

**Sources.** `lyons-hopf` lines 347–402 and 449–450: the stereographic projection from a point of one fibre, Investigation (L) (fibres project to linked circles, the fibre through the projection point to a line), Figure 10; Lyons uses quaternion coordinates and projects from `(1,0,0,0)`, as the README says. `andrews-dg-ch16` lines 100–101 (`K(σ)=R(e₁,e₂,e₁,e₂)`), 104–139 (p. 154, Proposition 16.2.1 and its orthonormal polarization proof); Andrews's `R` has the opposite sign to the README's, so his `K` equals the README's `⟨R(e₁,e₂)e₂,e₁⟩`, as the README's caveat says. O'Neill, Milnor and Fulton–Harris are `uncertified` in `sources.toml` and cited by locator.

**Adversarial table.** Rows cover the sampled targets, the amended passages, every declaration of `Suggested.lean` and the three probes of R01.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| R1.2 `24r = B_Q(x,w;y,z) − B_Q(y,w;x,z)` | hand proof: polarize `Q(a,b)=r(a,b,b,a)` in `a` then in `b` | `Q(x+w,b)−Q(x−w,b)=4r(x,b,b,w)`; `B_Q(x,w;y,z)=8[r(x,y,z,w)+r(x,z,y,w)]`; difference `8[2r(x,y,z,w)+r(x,z,y,w)−r(y,z,x,w)]=24r` by Bianchi | holds | none |
| same, numerically | sum of six Kulkarni–Nomizu squares in ℝ⁵, random x,y,z,w | `24r=178.9433146`, RHS `178.9433146`, difference `−2.8e−14`; symmetry residuals `0, −2.7e−15, −1.8e−15` | holds | none |
| R1.2 Check 1 | orthonormal x,y, K=1, z=y, w=x | `B_Q(x,x;y,y)=16`, `B_Q(y,x;x,y)=−8`, `16+8=24=24·r(x,y,y,x)` | matches | none |
| R1.2 Check 2 | `Q(x,λx)`; opposite slot order | `λ²r(x,x,x,x)=0`; `r(e₁,e₂,e₁,e₂)=−1` on the unit sphere | matches | none |
| R1.2 Check 3 (no Bianchi) | `r=ω⊗ω`, `ω(e₁,e₂)=ω(e₃,e₄)=1` | `B_Q(e₁,e₄;e₂,e₃)=0+4+4+0=8`, `B_Q(e₂,e₄;e₁,e₃)=−4−0−0−4=−8`, RHS `16`, `24r=24` | fails as the Check says | none |
| `constant_sectional_tensor_iff` | dim 0, 1, 2, ≥3 | dim ≤1: both sides true (no independent pair; `⟨u,v⟩w−⟨w,v⟩u=0` on a line and `R(w,w)=0`); dim 2: Gaussian curvature; dim ≥3: R1.2 | holds in every dimension | none |
| `schur` | n=2 excluded, n≥3 connected | hypothesis `3 ≤ finrank`; planes exist | matches R1.3 | none |
| `IsJacobiFieldOn` | unit sphere, `J=sin t·E` | `D_t²J=−J`, `R(J,γ′)γ′=⟨γ′,γ′⟩J−⟨J,γ′⟩γ′=J`, sum 0 with the pin's `R(u,v)w` order | right sign | none |
| `jacobi_eq_zero_of_nonpositive_curvature` | dim 1 (`R=0`); constant geodesic | tangential `(a+bt)γ′` or affine `X`, zero at `a,b` ⇒ 0 | holds | none |
| `cartanHadamard_isCoveringMap` | flat ℝⁿ; dim 0 point; dim 1 line/circle | `exp_0=id`; `{0}→{pt}`; `ℝ→S¹` covering | holds; `p` excludes empty `M` | none |
| `bonnetMyers_distance` | unit `Sⁿ`, `Ric=(n−1)g`, `λ=n−1`, n=2 | `π√(1/1)=π` = diameter | sharp | none |
| `three_simple_closed_geodesics` | round `S²`; constant curve | three great circles, `T=2π`, distinct ranges; constant curve fails `InjOn` on `Ico 0 T` | holds, nonconstant forced | none |
| `riemannianDist_eq_sSup_smooth` | `f=0`; 1-Lipschitz `f`; `(0,1)⊂ℝ`, `f=id` | set nonempty, bounded by `dist`; `sup=|x−y|` without completeness | holds | none |
| Rauch probe (R01) | dim 1; unit sphere `κ=1`, `b<π` | dim 1: `X′(0)⊥γ′(0)` forces `X≡0`, `0≤0`; sphere: `|J|=sin t·|J′(0)|=s₁(t)|J′(0)|` equality | true, elaborates | state it |
| Bishop–Gromov probe (R01) | dim 0; `ℝ`; `S¹` of length `L`; unit `Sⁿ` | `1/1≤1/1`; `2r/r=2` constant; `min(2r,L)/r` nonincreasing; `vol(B(p,r))/rⁿ` decreasing on the sphere | true, elaborates | state it |
| Killing–Hopf probe (R01) | `n=1` excluded (ℝ covers `S¹`); `n≥2` | sphere simply connected for `n≥2`; isometry type extends `Diffeomorph` | true, elaborates | state it |
| Projective block `K∈[1,4]` | O'Neill `K_B=K_M+¾|[X,Y]^v|²`, `[X,Y]^v=2⟨X,JY⟩Jz` | `K=1+3⟨X,JY⟩²`; `Y⊥JX`: 1; `Y=JX`: 4; d=1 constant 4 = `S²(½)` | matches | none |
| Projective period π | `γ=cos t·z+sin t·v`, `v⊥z, v⊥iz` | `⟨γ′,iγ⟩=Re[−i(−sin t cos t+cos t sin t)]=0` horizontal; `γ(t)∈ℂz` iff `sin t=0` | first return at π | none |
| `−½Re tr(X²)=|Xe_(d+1)|²` | `X=[[0,v],[−v*,0]]`; `X=diag(0,…,iθ)` | `tr X²=−2|v|²`, `|Xe_(d+1)|²=|v|²`; `u(1)`: `θ²/2` vs `θ²` | matches, "half" right | none |
| `ω_g=π·ω_FS` | `CP¹=S²(½)` | area `4π·¼=π`, `∫ω_FS=1` | matches | none |
| Hopf `j(u)∈S³`, `σ(j(u))` | `u=0.3−0.4i`; `u=0` | `|j(u)|²=1.0`; `σ(j(u))=(0.3,−0.4,0)`; `j(0)=(0,−i)` | matches | none |
| orbit meets `j(int D²)` once | `z₁≠0`, `s=|z₁|` | `ζ=z₁/(−is)`, `|u|²=(1−s)/(1+s)`, `2|u|/(1+|u|²)=√(1−s²)=|z₀|` | unique | none |
| exceptional fibres | `|z₁|=0`; `|z₁|=1` | `σ=(cos α,sin α,0)`; `σ=(0,0,cos β/(1−sin β))`, all of the z-axis plus P at `β=π/2` | matches | none |
| `H`, north fibre, framing | `ζ=e^(0.7i)`; `b=(1,0)` | `H(0,ζ)=(0,0,1)`, `H(1,0)=(0,0,−1)`; `dH(0,ζ)(ζ/2,0)=(1.0,0,−2.5e−7)`, `dH(0,ζ)(iζ/2,0)=(0,1.0,−2.5e−7)` (finite differences); `det R=+1` | matches | none |
| R8.3 `R_θu₁=e^(−iθ)u₁` | `θ=0.6` | `Ru₁/u₁=0.8253−0.5646i=e^(−0.6i)` on both coordinates | matches | none |
| character of `(x₁−ix₂)` under `p(g⁻¹x)` | `θ=0.6`, `x=(0.37,−0.81)` | `(R·p)(x)/p(x)=0.8253+0.5646i=e^(0.6i)` | `e^(iθ)` as stated | none |
| `K`, `KR_θK`, `Ku₁`, `B` | one plane | `KR_θK=[[c,s],[−s,c]]=R_(−θ)`; `Ku₁=e₁−ie₂=2v₁`; `B(u₁,v₁)=(1+1)/2=1`, `B(u₁,u₁)=1+i²=0`; `det K=(−1)^r` | matches | none |
| `U_Kρ(g)U_K⁻¹=ρ(σ(g))` | `K⁻¹=K` | `p(Kg⁻¹Kx)=p((KgK)⁻¹x)` | holds | none |
| `x₁+ix₂=B(x,u₁)` highest for Classical Borel | torus `t`; Borel `b` | `g·B(x,u₁)=B(x,gu₁)`; `tu₁=t₁u₁` gives character `t₁`; `bu₁∈⟨u₁⟩` | highest vector, character `t₁^d` | none |
| σ inner or not | N=2; N=3 | `diag(1,−1)∉SO(2)`, inversion of an abelian group; `−K=diag(−1,1,−1)∈SO(3)` | as stated | none |
| `dim H_d` | N=2,3,4 | `2`; `(d+2)(d+1)/2−d(d−1)/2=2d+1`; `(d+1)[(d+3)(d+2)−d(d−1)]/6=(d+1)²` | matches B₁, D₂ dimensions | none |
| R6 chart Hessian | `h_q=|f−q|²` | `∂_i∂_jh_q=2(⟨∂_if,∂_jf⟩+⟨∂_i∂_jf,f−q⟩)`; at a critical point with `q−f(p)=v` normal: `2(g−⟨B,v⟩)`, `=2(I−tS_v)` for `v=tν` | matches | none |
| R6 properness | open unit disc, `q=(2,0)` | `inf h_q=1` not attained | non-example right | none |
| R6 focal nullity | `C²` embedding, normal map `(p,v)↦f(p)+v` | `C¹` map between equal-dimension manifolds; critical values null | Sard applies | none |
| R6 regression `I_M(X,X)=1/b−1` | unit circle, `γ(t)=(1−t,0)`, `X=(1−t/b)e₂` | `∫₀^b(1/b)²=1/b`; `⟨S_ηX(0),X(0)⟩=1` with inward `η` | matches | none |

**Read but not re-derived.** R3.1–R3.2, R3.4, R4.1–R4.3, R4.6–R4.8, R4.9, R5a, R5b, R7 and R8.1–R8.2, R8.4–R8.5 are text this pull request changes only cosmetically (subscripts, labels, prose for former backticked names); they were read for policy, citation and shape defects (R02, R03) and their analytic estimates were not recomputed in this round.

## Not verifiable

- J. M. Lee, *Introduction to Riemannian Manifolds*, 2nd ed.: paywalled; the principal convention reference, cited by locator only.
- J. Milnor, *Morse Theory*: JSTOR, paywalled; §6 Lemma 6.5 and Theorem 6.6 (R6) and §§13–18 (R3.2) cited by locator; `sources.toml` records it `uncertified`.
- B. O'Neill, *The fundamental equations of a submersion* (1966): Project Euclid landing page only; Theorem 2 and Corollary 1 cited by locator (`uncertified`); the formula was verified by computation (table).
- W. Fulton, J. Harris, *Representation Theory*: Springer, paywalled; Lecture 18 §18.1 and Lecture 19 cited by locator (`uncertified`); the convention was verified by computation (table).
- Lyons, published pagination (Mathematics Magazine 76, 87–98): only the arXiv v1 text was read; its own preface places Figure 10 at printed p. 96.

## Source issues

- **Misprint** in lyons-hopf at Figure 10, printed p. 96 (published version): the label of the 3-sphere carries a stray minus sign; it should read S³; affects nothing; corrected in print at the arXiv v1 preface (lyons-hopf line 20).
- **Misprint** in lyons-hopf at the quaternion product display, printed p. 92 (published version): the middle line of a worked product has two slips; it should be the three-line computation the preface gives; affects nothing; corrected in print at the arXiv v1 preface (lyons-hopf lines 14–19).
- **Misprint** in andrews-dg-ch16 at §16.1, printed p. 151 (as extracted, line 12): the definition of `R(X,Y)Z` reads `∇_Y(∇_X Z) − ∇_Y(∇_Y Z) − ∇_[Y,X] Z`; it should be `∇_Y(∇_X Z) − ∇_X(∇_Y Z) − ∇_[Y,X] Z`; affects nothing (the sign convention is clear from the rest of the lecture).
