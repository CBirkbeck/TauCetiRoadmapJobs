# Review of RiemannianGeometry (pull request #1327 at 5297709)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/RiemannianGeometry/README.md` (2392 lines) and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` (367 lines: 3 definitions and 16 admitted theorems). No file outside the folder changes. `Suggested.lean` elaborates, and its only warnings are the 16 `sorry` warnings. The dependency check reports no problem. The push gate fails on the dropped-names rule (R01). Four findings are blocking: R02 and R03 are supplier citations that do not resolve (one on main, one at three open heads), and R04 and R05 are headline theorems that are statable at the pins but absent. Each of R04 and R05 comes with a scratch statement that elaborates.

## R01 (P3) — The gate fails: six lines name HomotopySpheres, and one of them is a supplier contract

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:146–148`, "HomotopySpheres §3A.1: compact-generation/product foundations for AT's early finite-source mapping and based-loop CW-type targets." The other occurrences are at `:22`, `:721`, `:833–838` ("Compare this framed fibre with HomotopySpheres §5.0 and its Hopf-generator calibration … transports to that supplier's native models"), `:867` and `:929`. Line `:2333` attributes HomotopySpheres' numbering to AlgebraicTopology ("AT's early §3A.1 mapping-CW targets").

**Claim.** HomotopySpheres is on the never-cite list, and the gate reports `dropped=6 … FAIL`. R3.2 does not consume anything from HomotopySpheres. It consumes only AlgebraicTopology 8.11a's `finiteSourceMappingCWType` and `basedLoopCWType`, and what AlgebraicTopology uses to build those is AlgebraicTopology's business. The R3.3c sentence at `:833` owns a comparison with a section that will not exist.

**Witness.** My gate run gives `dropped: line 146: - HomotopySpheres §3A.1:` plus five further lines. AlgebraicTopology on main, line 1949, owns "8.11a. Early mapping-space CW type (`finiteSourceMappingCWType`, `basedLoopCWType`)".

**Repair.**
- Delete the bullet at `:146–148`.
- At `:720–723` keep "R3 consumes neither AT's smash/suspension comparison targets nor a Freudenthal theorem" and drop the sentence about the HomotopySpheres API.
- Delete `:832–838` from "Compare this framed fibre" through "that supplier's native models;", and the clause at `:866–868`.
- At `:21–22` write "It does not need Bott-chain constructions beyond MorseTheory M5."
- At `:927–929` write "stable homotopy calculations are outside this roadmap."
- At `:2333` write "AT 8.11a's mapping-space CW-type targets".

Re-run the gate; it then reports `dropped=0`.

## R02 (P2) — R4.3 cites LieGroupoidsPoisson G0.0 for the countability of π₁, which that section does not state

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:1058`, "The independently owned LieGroupoidsPoisson G0.0 countable-coordinate/overlap-components argument makes pi1 countable." The *Needs:* line at `:1062–1066` names no supplier for this step.

**Claim.** This is supplier drift. G0.0 is the topological-groupoid section. LieGroupoidsPoisson does not own countability of π₁: it consumes it from SmoothBundlesConnections B5.2.

**Witness.**
- LieGroupoidsPoisson README on main, line 261: `### G0.0 Topological groupoids`.
- The same file, lines 216–217, lists under what it consumes: "B5.2: … the countability of `π₁(M,m₀)` for a connected second-countable manifold".
- SmoothBundlesConnections README, line 38 (B5) and line 1209 (`### B5.2 Holonomy and flat connections`).

**Repair.** Write "SmoothBundlesConnections B5.2 supplies the countability of π₁(M,m₀) for a connected second-countable manifold". Add "SBC B5.2 (countability of π₁)" to the R4.3 *Needs:* line. SBC B2–B5 is already in the supplier contracts, so no new supplier is introduced.

## R03 (P2) — The ComplexKahlerGeometry supplier anchor is dropped by three open revisions

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:407`, "[ComplexKahlerGeometry K7.1](../ComplexKahlerGeometry/README.md#k7-projective-torus-and-hopf-examples)".

**Claim.** This is a supplier citation (the smooth CP^d carrier and the normalized Fubini–Study form). Its heading id is renamed at the heads of #1398, #1807 and #1808, so the link breaks when any of them merges. The labels K7.1 and K7.2 survive at every head.

**Witness.**
- Main, line 1405: `## K7. Projective, torus, and Hopf examples`.
- #1398 head, line 2271: `## Layer 7: projective, torus, and Hopf examples`, with `### 7.1 … (K7.1)` and `### 7.2 … (K7.2)`.
- #1807 head, line 1961, and #1808 head, line 2181: `## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7)`.

**Repair.** Link `../ComplexKahlerGeometry/README.md` without a fragment and cite by label: "K7.1 (projective charts and orientation)" and "K7.2 (projective bundles, forms and cohomology)". This resolves on main and at all three heads.

## R04 (P2) — Günther's comparison is statable at the pins, but the docstring says it is not

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:35–36`, "the Günther volume comparison (R4.1), whose full-ball range `r < inj(p)` needs the injectivity radius, absent at the pin".

**Claim.** The stated reason does not hold. On a complete manifold, the native predicate `Set.InjOn (TauCeti.Manifold.riemannianExp I M p) (Metric.ball 0 r)` holds exactly when `r ≤ inj(p)` in R4.6's sense:
- If the radius exceeded the cut time in some direction v, the vector `(t_c+ε)v` and the shorter minimizing vector to the same point would both lie in the ball, contradicting injectivity.
- If `r ≤ inj(p)`, injectivity holds by the definition of inj(p).

The model constant `ω_{n−1}` is `n·vol(Bⁿ(1))` with Mathlib's Euclidean volume. No stand-in is needed.

**Witness.** This statement, placed after `modelBallVolume` in the `GlobalDistance` section, elaborates at the pins with only `sorry`:

```lean
theorem guenther [ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M]
    [SecondCountableTopology M] [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)]
    (p : M) {κ r : ℝ}
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤
        κ * (‖u‖ ^ 2 * ‖v‖ ^ 2 - (inner ℝ u v) ^ 2))
    (hr : 0 < r) (hmodel : 0 < κ → r < Real.pi / Real.sqrt κ)
    (hinj : Set.InjOn (TauCeti.Manifold.riemannianExp I M p) (Metric.ball 0 r)) :
    ENNReal.ofReal ((Module.finrank ℝ E : ℝ) * modelBallVolume κ (Module.finrank ℝ E) r) *
        MeasureTheory.volume (Metric.ball (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) 1) ≤
      TauCeti.riemannianVolume I M (Metric.ball p r)
```

Two test cases:
- Unit S² with κ = 1 and r < π: both sides equal `2π(1−cos r)`, since `2·(1−cos r)·π` is the area of the cap.
- n = 1: both sides equal `2r`.

**Repair.** Add this theorem, with a docstring saying that `hinj` is `r ≤ inj(p)` on a complete manifold. Remove Günther from the docstring's list of headlines that are not statable. Name `guenther` in the README's R4.1 sentence at `:959–963`.

## R05 (P2) — Three statable headlines are neither stated nor named, and two more are not named

**Location.** The module docstring of `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` (lines 23–43). The headlines concerned are:
- R4.8 (`README.md:1230–1232`): at least two geodesics between distinct points of a closed manifold.
- R6 (`:1948–1952`): for almost every q, `h_q` is a Morse function (Milnor §6, Theorem 6.6).
- R8.3 (`:2243`): for N ≥ 3, the complexified `H_d` is an irreducible SO(N)-representation.
- R3.3 (`:769`): `H_*(ΩSⁿ;ℤ)`.
- R3.4 (`:893–896`): the Morse proof of the Freudenthal range.

**Claim.** Each of these is a named milestone of its section. The first three are statable on native carriers, and R3.3 and R3.4 are not even mentioned in the docstring.

**Witness.** All three scratch statements elaborate at the pins:
- R4.8 (in `GlobalDistance`): `[CompactSpace M] [ConnectedSpace M] (hdim : 1 ≤ finrank ℝ E) (p q : M) (hpq : p ≠ q) : ∃ γ₁ γ₂ : ℝ → M, IsGeodesicCurveOn I γ₁ (Icc 0 1) ∧ IsGeodesicCurveOn I γ₂ (Icc 0 1) ∧ γ₁ 0 = p ∧ γ₁ 1 = q ∧ γ₂ 0 = p ∧ γ₂ 1 = q ∧ ∃ t ∈ Icc 0 1, γ₁ t ≠ γ₂ t`.
- R6, after adding `TauCeti.Geometry.Manifold.Morse.Basic`, whose `TauCeti.IsMorse` is at line 178: for `f : M → EuclideanSpace ℝ (Fin n)` with `ContMDiff I 𝓘(ℝ, _) ∞ f` and `∀ x, Function.Injective (mfderiv … f x)`, the conclusion is `∀ᵐ q, TauCeti.IsMorse I (fun x => ‖f x - q‖ ^ 2)`.
- R8.3, with three short definitions:
  - `laplacian := ∑ i, (pderiv i).toLinearMap ∘ₗ (pderiv i).toLinearMap`;
  - `harmonic N d := homogeneousSubmodule (Fin N) ℂ d ⊓ LinearMap.ker (laplacian N)`;
  - `act g := aeval fun i => ∑ j, C ((g⁻¹ : specialOrthogonalGroup (Fin N) ℝ) i j) * X j`.

  The theorem is: `(hN : 3 ≤ N) (W ≤ harmonic N d) (∀ g, ∀ p ∈ W, act N g p ∈ W) → W = ⊥ ∨ W = harmonic N d`. The carrier is Mathlib's `Matrix.specialOrthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:305`).

Tau Ceti's `ae_hasNondegenerateCriticalPointsOn_sub_inner` (`Analysis/Calculus/Morse/Generic.lean:238`) covers only linear perturbations on open subsets of the model space, so R6's submanifold statement is not already proved.

**Repair.** State the three theorems above, keeping the R8.3 definitions to these real bodies. Name R3.3 and R3.4 in the docstring together with the carrier each lacks, or state them if `Path`-space singular homology (`AlgebraicTopology/SingularHomology/Basic.lean`) and `HomotopyGroup` suffice.

## R06 (P3) — Build order: the R1 projective block consumes the later layer R4.7

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:403–406`, "Its curvature and geodesic calculations also consume R4.7's independently constructed round model". The *Needs:* line at `:449–455` cites R4.7.

**Claim.** A target in R1 needs a target of the later layer R4. That later target (`:1157–1162`) in turn "precedes R1's projective curvature/period calculations". R3.2 (`:688`) consumes the same block. This is not a cycle at target level, but the layer order is broken.

**Witness.** R4.7 at `:1157–1160` states that its direct model construction uses only R1's connection identities and HopfRinow.

**Repair.** Move R4.7's direct model construction (the round sphere's tangential-projection connection, curvature +1, great-circle geodesics and scaling) into a new R1 subsection placed before the projective block. Keep the Killing–Hopf classification and the quotients in R4.7, and update the *Needs:* lines at `:449–455` and `:1219–1229`.

## R07 (P3) — Two Checks compute wrong values

**Location (a).** `README.md:385–388`, "the horizontal lift of a great circle of `S²(½)` (length π) is a horizontal great circle of `S³` (length π)".
- **Witness.** A great circle of S³ has length 2π. The lift `γ(t)=cos t·z+sin t·v` for 0≤t≤π has length π and runs from z to −z: it is half a great circle.
- **Repair.** "is a horizontal half great circle of `S³` (length π) from z to −z on the same fibre; traversing the base circle twice closes it into a great circle of length 2π".

**Location (b).** `README.md:2167–2169`, "`Δ(r²x)=Δ(x³+xy²)=8x` … the formula without the `−2` would give 10x".
- **Witness.** `2k(2l+n+2k)` at l=k=1, n=2 equals `2·6=12`.
- **Repair.** "would give 12x".

## R08 (P3) — Several definitions have fewer than three Checks

**Location.**
- `Rop` has one Check (`README.md:329–333`).
- R3 has no Checks for the index form, conjugate multiplicity or the ℕ∞-valued index (`:530–578`).
- R3.3/R3.4 have none for `s:S¹→ΩS²` or `j:S^(n−1)→ΩSⁿ`.
- R4.3 has none for the pullback metric `g_E` (`:1052`).
- R4.7 has none for the hyperbolic models or the round RPⁿ quotient metric.
- R5a.1 has none for `J_t` or `V(t)` (`:1703–1712`).
- R8.4 has none for the normalized eigenmap `F` (`:2283`).

**Witness.** No `**Checks.**` list follows these blocks.

**Repair.** Add at least three discriminating Checks for each definition. Tested candidates:
- **Index form, unit sphere.** For `X=sin(πt/b)E` on `[0,b]`, `I(X,X)=(b/2)(π²/b²−1)`, which is negative exactly when b>π. A form with `+⟨R(X,γ′)γ′,X⟩` would be positive.
- **Relative density.** For `F_t(x)=(1+t)x` on `Sᵐ`, `J_t=(1+t)ᵐ` and `V″(0)=m(m−1)Vol(Sᵐ)`.
- **Eigenmap, degree 1 on Sᵐ.** λ=m and N=m+1, so `F=x` with target radius `√(m/λ)=1`.
- **Eigenmap, degree 2 on S².** λ=6, N=5, radius `1/√3`, which matches R8.5.
- **Pullback metric.** Under `t↦e^{it}`, `ℝ→S¹` pulls the round metric back to `dt²`. Under the double cover `z↦z²`, the pulled-back circle has length 4π.
- **`Rop`.** On `S²×ℝ` its eigenvalues are 1 on the S² plane and 0 on the two mixed planes; on hyperbolic space it is `−Id`.

## R09 (P3) — Headline claims lack theorem-level locators, and one link fragment is dead

**Location.** These claims carry no locator at the claim:
- Schur (`README.md:279`), Rauch (`:941–951`), Bishop–Gromov (`:991`);
- Cartan–Hadamard (`:1068`), Bonnet–Myers (`:1077`), Killing–Hopf (`:1183–1192`);
- the three geodesics (`:1264`), R7.8 (`:2096`), Lichnerowicz (`:2004–2006`) and Takahashi (`:2285`).

Synge (`:1112–1113`) cites only "Lee, Chapter 12". The manifest records `nicolaescu-lectures` and `brewin-rnc` (the latter for R1.4), but the README cites neither.

Lyons is cited for "pairwise linked" (`:795–797`) with Investigation (L), but the linking is Investigation (M).

The fragment `../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison` (`:725`) is dead.

**Witness.**
- `nicolaescu-lectures` line 9923: Theorem 5.2.26 (Myers), printed p. 220.
- `nicolaescu-lectures` line 10630: Theorem 6.2.6 (Cartan–Hadamard), printed p. 238.
- `lyons-hopf` lines 391–402 are Investigation (L) (the circles and the line); lines 415–425 are Investigation (M) (pairwise linking).
- The GeometricTopology heading on main, line 930, is "## The smoothing-and-triangulation comparison (far horizon)".

**Repair.**
- Add theorem/page locators at each headline. Use Nicolaescu Theorem 5.2.26, p. 220 and Theorem 6.2.6, p. 238. Use Lee's theorem numbers for Synge, Schur, Rauch and Killing–Hopf, and Taimanov's or Grayson's for R4.9.
- Cite `brewin-rnc` at R1.4, or drop it from the manifest.
- For Lyons, write "Investigations (L) and (M) and Figure 10 (arXiv v1 pp. 11–14)".
- Use the fragment `#the-smoothing-and-triangulation-comparison-far-horizon`.

## R10 (P3) — Three open pull requests change this folder and conflict with this head, and no order is stated

**Location.** The pull-request description, which states no merge order relative to these.

**Witness.** From `scratch/overlaps.md`:
- #1683 conflicts in `README.md` and `Suggested.lean`;
- #1974 conflicts in `README.md` and `Suggested.lean`;
- #1187 conflicts in `Suggested.lean`.

**Repair.** State in the description which of #1327, #1683, #1974 and #1187 merges first, and which ones are rebased onto it.

## R11 (P3) — README shape and house style

**Location.**
- The title at `:1` is not `# Roadmap: …`, and there is no `**Summary.**`.
- There is no `## How to read the build` and no `## Downstream consumers`, and no layer ends with `### Examples` and `### Dependencies`.
- The heading at `:2312` is "Dependency order and validation".
- Some mathematics is in ASCII outside code spans, with garbled tokens:
  - `:769`: "Z in multiples of n-1 and0 otherwise … no1-cell … The n2 Hopf bridge and n1 winding";
  - `:778`: "period2*pi"; `:870`: "one0-cell"; `:1432` and `:1448`: "in6b";
  - the R4.7 RPⁿ block at `:1209–1215`, and R8.1–R8.2 at `:2144–2182`.
- Capitals are used for emphasis: "ACTUAL" (`:870`, `:1215`), "IF … CALLER … AFTER" (`:1060`), "ENTIRE" (`:2180`).
- `:603` has "the course's speed metric", and `:2154` has "phases".

**Witness.** The README template in the brief.

**Repair.**
- Retitle the README and add the missing sections. Move the consumers named in Scope into `## Downstream consumers`.
- Write "n=2", "n=1", "ΩS³", "π₁", "2π", "R4.9.6b", or put the ASCII inside code spans.
- Drop the emphasis capitals.
- Write "the speed metric" and "R8.2–R8.3".

## Verified sound

**Gate and dependency check.** My gate run reproduces the worker's: every counter is 0 except `dropped=6` (R01). The dependency check prints `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. RiemannianGeometry is not listed in `ORDER.txt`, so it is checked as placed after its last supplier; that is not a finding.

**Lean.**
- `lake env lean` on `Suggested.lean` takes 22 s and produces exactly 16 warnings, all `declaration uses sorry`.
- I compiled `#check @name` for all 19 declarations in one scratch file. Every elaborated binder list matches its README statement, and nothing changed. In particular:
  - `bishopGromov` carries `IsRiemannianManifold`, completeness, Borel and second countability;
  - `IsJacobiFieldOn` carries the `RiemannianBundle` and `IsContMDiffRiemannianBundle` instances.
- I checked with `pp.explicit` that `‖·‖`, `inner` and `‖mfderiv … f p‖` on `TangentSpace` use Mathlib's `RiemannianBundle` instances (open through `open Bundle`, `Topology/VectorBundle/Riemannian.lean:431,449`) on both source and target. They are the Riemannian norms, not the model norm, so `hK`, `hunit`, `hRic` and R7.8 read the metric.
- There is no padding: no declaration restates a definition or closes in one tactic. The three definitions have real bodies.

**Conventions at the pin (Tau Ceti).**
- `Curvature/Basic.lean:80–89`: `R(X,Y)σ=∇X∇Yσ−∇Y∇Xσ−∇[X,Y]σ`.
- `Curvature/Tensor.lean:148`: the README's linked line is the `curvatureTensor` definition.
- `Curvature/Ricci.lean:57–66`: `Ric(u,v)=tr(w↦R(w,u)v)`, so on the unit Sⁿ, `Ric(u,u)=(n−1)|u|²`.
- `Curvature/Sectional.lean:70–73, 140–143, 164–166`.
- `Curvature/Metric.lean:141–147`: `IsConstantCurvatureTensor`, `R(w,u)v=κ(⟨u,v⟩w−⟨w,v⟩u)`, which matches README `:250`.

**Declarations resolved at the pins (24).**
- Tau Ceti:
  - `completeSpace_ofRiemannianMetric_of_isPretransitive_isom` (`Riemannian/Homogeneous.lean`)
  - `symmL_alongCurveInChartWithin` (`AlongCurve/Chart.lean`)
  - `affineIsometryMulEquiv` (`Isometry/Euclidean.lean`)
  - `unitSphereIsomHom` (`Isometry/Sphere.lean`)
  - `UpperHalfSpace.isPretransitive_isom` (`Hyperbolic/UpperHalfSpace.lean:483`)
  - `sphereRoundMetric`, `HyperbolicMetric`
  - `MetricSpace`/`EMetricSpace.ofRiemannianMetric` (`Riemannian/Distance.lean`)
  - `RealProjectiveSpace`, `fundamentalGroupMulEquivAt`
  - `pathLoopSpaceMulEquiv` (`HomotopyGroup/LoopSpace.lean`)
  - `curveVelocityWithin`, `alongCurveWithin`
  - `exists_isTubularNeighborhood_normalBundle` (`TubularNeighborhood/Euclidean.lean:454`)
  - `manifoldMorseIndex` (`Morse/Index.lean:74`)
  - `IsMorse` (`Morse/Basic.lean:178`)
  - `WeylDimension/{OddOrthogonal,EvenOrthogonal}.lean`
- Mathlib:
  - `Besicovitch.exist_disjoint_covering_families`
  - `integral_image_eq_integral_abs_det_fderiv_smul`
  - `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`
  - `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
  - `ODE_solution_unique_of_mem_Icc`
  - `intervalIntegral.integral_eq_sub_of_hasDerivAt`
  - `Matrix.specialOrthogonalGroup`

The docstring's other not-statable claims hold: no injectivity-radius, second-fundamental-form, manifold Laplacian, de Rham cohomology, cut-locus or index-form carrier exists at either pin.

**Cross-roadmap citations resolved (24).**

Correct on main:
- SBC B6.0 (line 1306, uniform normal and strong-convexity radii) and SBC B5.2 (line 1209)
- Yamabe Y9 (line 308)
- CharacteristicClasses C2 (line 728), with `bundleDiskSphereRelCW` (line 731) and `bundleDiskAttachmentCWModel` (line 764)
- HeegaardFloer Lane M (line 217), MorseTheory M5 (line 857), DGFloer Layer 2 (line 846)
- AlgebraicTopology 8.11a (line 1949) and `reducedSuspensionSphereHomeomorph` (lines 544, 576)
- ClassicalGroups Layer 3, with the SOₙ type B/D classification (lines 237–271), and Layer 5 (line 297)
- PDE A1–A6, D16–D19 and E20–E22 (lines 677–1927)
- ComplexKahlerGeometry K7.1 and K7.2 (lines 1405–1444)

At open heads:
- VariationalMethods §2.3, §2.4 and Layers 3–5 at the #1028 head
- UnboundedOperators §4.7 (UO-D06) at the #1027 head (line 546)

Consumers, which all only consume: Surfaces (#1974, boundaries stated in its scope), PositiveMass (#956, line 45), RicciFlow (#1023), NoncompactQuantumSymmetry (#1015).

Wrong: LieGroupoidsPoisson G0.0 (R02).

**Ownership against open pull requests.** I searched the open heads and main for other owners of Bishop–Gromov, Rauch, Cartan–Hadamard, Synge, Killing–Hopf, Bonnet–Myers, `IsJacobiFieldOn` and Lusternik–Schnirelmann. Every hit consumes from this roadmap, so there is no second owner.

**Sources (sampled targets).**
- **Stereographic Hopf circles.** Lyons, "Seeing the Hopf fibration", arXiv v1 pp. 11–14 (`lyons-hopf` lines 347–450). Investigation (L) gives one line and circles, and projects from (1,0,0,0) on the axis fibre. Investigation (M) and Figure 10 give pairwise linking. The figure numbering matches the published version (`lyons-hopf` line 20). The README's own coordinates were recomputed (table).
- **Projective metric examples.** O'Neill is uncertified. I recomputed the mathematics independently (table).
- **R1.2.** Andrews Proposition 16.2.1 is at p. 154 (`andrews-dg-ch16` lines 104–139), and it supports "determined by sectional curvatures". Its final display has a sign slip (Source issues). The README's own identity is correct.

**Adversarial table.**

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| R1.2 `24r = B_Q(x,w;y,z) − B_Q(y,w;x,z)` | random algebraic curvature tensor on ℝ⁴ (sum of five h⊙h) | −113.97154727 / −113.97154727 | holds | none |
| R1.2 Check, sphere pair | orthonormal x,y; z=y, w=x | `B_Q(x,x;y,y)=16`, `B_Q(y,x;x,y)=−8`; 16−(−8)=24 = 24·1 | holds | none |
| R1.2 Check, no Bianchi | `r=ω⊗ω` on ℝ⁴ at (e₁,e₂,e₃,e₄) | 24r=24 / 8−(−8)=16; Bianchi sum = 1 | the Check refutes the wrong model as claimed | none |
| `constant_sectional_tensor_iff` | unit S² (tensor `⟨u,v⟩w−⟨w,v⟩u`); dim 1; dim 0 | `⟨R(u,v)v,u⟩/Gram`=1 / κ=1; dim 1: no independent pairs and tensor ≡0, both true for every κ | holds | none |
| `schur` | n=2 surface with varying K; n=3 | guard `3 ≤ finrank` excludes n=2 | holds | none |
| `IsJacobiFieldOn` sign | unit sphere, `sin t·E` vs `sinh t·E` | `D²X+R=0` / `2 sinh t·E≠0` | correct sign | none |
| `jacobi_eq_of_initial_data`, `exists_jacobi_initial_data` | constant γ; great circle | `u+tv`, unique; `sin t·E` from (0,E) | hold | none |
| `jacobi_eq_zero_of_nonpositive_curvature` | flat ℝ²; sphere on [0,π] | affine field vanishing twice is 0; `sin t·E` vanishes at 0,π but K=1 violates `hK` | holds, guard needed | none |
| `rauch_norm_ge_of_sectional_le` | S²(½), κ=4; S²(5/2), κ=1, b=5π/2; κ=−1 with J=tγ′ | `sin2t/2 = s₄(t)`; `s₁(5π/2)=1 > 0=|J|` excluded by `hmodel`; `t < sinh t` excluded by `hnormal` | holds, guards needed | none |
| `modelSine` | κ=0,1,−1,4 | t, sin t, sinh t, `sin2t/2` (zero π/2) | holds | none |
| `modelBallVolume` | V₁(2,r); V₀(3,2); V₋₁(2,1); n=0 | `1−cos r`; 8/3; cosh1−1≈0.5431; r (junk, ratio unaffected) | holds | none |
| `bishopGromov` | unit S², κ=1; circle of length 7, n=1; κ>0 past pole | 2π constant; 2, 2, 2, 2, 1.75; `4π` at 3π/2 vs `2π` at 1, excluded by `hmodel` | holds | none |
| `cartanHadamard_isCoveringMap` | flat T²; dim 0 | ℝ²→T² is a covering; {0}→{p} | holds | none |
| `bonnetMyers_distance` | unit Sⁿ, λ=n−1 | `π√((n−1)/λ)=π` = diam | sharp | none |
| `synge` / `synge_orientable_of_odd` | S², RP², RP³, T², S¹, RP²×S¹ | S² π₁=0; RP² non-orientable; RP³ odd; T² K=0; S¹ orientable (`hK` vacuous); RP²×S¹ K≥0 only | hold, guards sharp | none |
| `killingHopf_*` | n=0,1,2 | point = ℝ⁰; line ≅ ℝ ≅ ((0,∞), dt²/t²) via log; line ≠ S¹ (guard n≥2) | hold | none |
| `three_simple_closed_geodesics` | round S²; constant curve; double traversal | three coordinate great circles, T=2π; constant and γ(2t) with T=2π fail `InjOn` on `[0,T)` | holds, primitive | none |
| `riemannianDist_eq_sSup_smooth` | ℝ; norm instance | smoothed clamp gives `|x−y|`; f=0 gives a nonempty set; Riemannian norm on both sides (`pp.explicit`) | holds | none |
| Projective: O'Neill | horizontal X,Y on S^(2d+1) | `K_B=1+¾·4⟨X,JY⟩²`: Y=JX gives 4, totally real gives 1 | holds | none |
| Projective: normalization | `X=[[0,b],[−b*,0]]`; u(1) summand | `−½Re tr X²=|b|²=|Xe_(d+1)|²`; `θ²/2` vs `θ²` | holds | none |
| Projective: Kähler constant | CP¹=S²(½) | area π, `∫ω_FS=1` ⇒ `ω_g=π ω_FS`; `ω_g(u,Ju)=|u|²>0` | holds | R06 (placement) |
| Projective: sp(d+1) | quaternionic vs doubled complex trace | `Re tr_ℂ = 2 Re tr_ℍ` ⇒ `−¼` | holds | none |
| Stereographic: `j(u)` | general u; u=0; |u|=1 | `|j|²=(4|u|²+(|u|²−1)²)/(1+|u|²)²=1`; `j(0)=(0,−i)`; `j(u)=(u,0)` | holds | none |
| Stereographic: chart | `1−Im z₁` on `j(u)` | `2/(1+|u|²)`; `σ(j(u))=(Re u, Im u, 0)` | holds | none |
| Stereographic: orbits | |u|<1, second coordinate `−is`, s>0 | ζ forced to 1, then u=v; |u|=|v|=1 gives ζ=v/u | holds | none |
| Stereographic: `H`, `dH` | (0,ζ), (1,0) | `H(0,ζ)=(0,0,1)`, `H(1,0)=(0,0,−1)`; `dH(ζ/2,0)=(1,0,0)`, `dH(iζ/2,0)=(0,1,0)` | holds | R01 (drop the HomotopySpheres comparison) |
| R1 conformal Check | `u=log2−log(1+r²)` | `Δu=−4/(1+r²)²`, `K̃=1`, `Scal̃=2` | holds | none |
| R1 SU(2) Check | `iσ_j` | `tr(iσ_j)²=−2`, `|[iσ₁,iσ₂]|²=4`, K=1 | holds | none |
| R1 horizontal-lift Check | great circle of S²(½) | lift length π = ½·(2π) | false wording | R07(a) |
| R3.1 Checks | `tv`, `t²v`, triangle waves | `L²=|v|²=2·½|v|²`; `2E=4/3|v|²`; `sup=1/(2k)`, speed distance 1 | hold | none |
| R3.2 Checks | equal spacing; r=2; circle, c=20 | `E_Δ=½|q−p|²`; d vs √2·d; `2π²≈19.74<20`, ρ>√20>π/2 | hold | none |
| R4.6 Checks | RPⁿ, T², S¹(r)×ℝ | inj π/2, ½, πr; conj radius π, ∞ | hold | none |
| R4.9.0 / R4.9.4 Checks | latitude π/3; latitude π/4 | `d_V=π/6+2π(1−√3/2)≈1.365`; `arccos(½+½cos(π/(2√2)))≈0.7641`, defect ≈0.0213 | hold | none |
| R5a Checks | sphere, Clifford torus, cylinder | K=1; `K=1−1=0`; `H=−ν/2`, K=0 | hold | none |
| R5b Checks | Clifford torus; equator S² | `Q=−4·Area`, `Scal_P=6−4+0−2=0`; `Q=−8π` | hold | none |
| R6 Check `I_M` | unit circle, X=(1−t/b)(0,1) | `1/b` and `−1` give `1/b−1`, zero at b=1 | holds | none |
| R7 Clifford Check | `a₂*a₁*a₁a₂(e¹∧e²)` | −e¹, −1, −e¹, e¹∧e² gives binomial(2,2)=1 | holds | none |
| R8.1 Checks | m=1, m=2; `Δ(r²x)` in ℝ² | 2; 2d+1; 8x but "without −2" gives 12x, not 10x | one value false | R07(b) |
| R8.3 bridge | `R_θ(e₁+ie₂)`, K, B, det | `e^(−iθ)(e₁+ie₂)`; `KR_θK=R_(−θ)`; `Ku₁=2v₁`; `B(u₁,v₁)=1`; `det K=(−1)^r`; N=4 gives `(d+1)²` | holds | none |
| R8.5 | (1,0,0), (0,0,1), (1,1,0)/√2 | sums of squares 1, 1, 1; radius `√(m/λ)=1/√3` | holds | none |
| Günther probe (R04) | unit S², κ=1; n=1 | `2π(1−cos r)` both sides; 2r both sides | statable and true | R04 |

## Not verifiable

These manifest entries are uncertified and settled. I cite them by locator and verified the mathematics independently in the table:
- **O'Neill**, *The fundamental equations of a submersion*, Theorem 2 and Corollary 1: the Project Euclid landing page has no PDF.
- **Milnor**, *Morse Theory*, §6, Lemma 6.5 and Theorem 6.6, and §§13–18: JSTOR, paywalled.
- **Fulton–Harris**, Lecture 18, §18.1 and Lecture 19: Springer, paywalled. The R8.3 bridge is the README's own computation.
- **Lee**, *Introduction to Riemannian Manifolds*, Chapter 12 (Synge): uncertified.

## Source issues

- **Misprint** in andrews-dg-ch16 at Proposition 16.2.1, p. 154: the source says the final formula subtracts K(e_j∧e_l)/6 and K(e_i∧e_k)/6 and adds K(e_i∧e_l)/6 and K(e_j∧e_k)/6; it should be the opposite signs, as the proof's two preceding identities give (on the unit sphere with i=k=1, j=l=2 the printed formula yields 5/3, not 1); affects nothing.
