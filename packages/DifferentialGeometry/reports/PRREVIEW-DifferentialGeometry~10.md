# Review of DifferentialGeometry (pull request #886 at 6f270bf)

**Verdict:** needs changes

🤖 AI full review of the repaired head. The folder changed by 869 lines since `e8165fc`, so every passage was read again. The gate passes (the worker's run and a rerun: every scanner `0`, `OK`). `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` exits 0 in 79 s with 61 `declaration uses sorry` warnings and no other diagnostic. The depcheck reports 0 problems. The blocking defect (R01) is not mathematical: the folder is written against two Tau Ceti revisions, and it conflicts with main.

## Previous findings

- r9 R01 (layers 6–11 handed to a roadmap whose head hands them back): **repaired.** The README now owns them (lines 32–37: "the de Rham complex and cohomology … (layer 6) … the hairy ball theorem (layer 11)"). `### Layer 6` to `### Layer 11` are restored (lines 1610–1989), and the DeRhamCohomologyAndDuality head (`README.md:3–8, 42–49`) describes exactly this split. Its own §§1–5 own nothing this README owns.
- r9 R02 (fewer than three Checks): **repaired.** `**Checks.**` lists now exist for 0.3 (535), 0.4 (586), 1.3 (644), 3.3 (846), 3.5 (889), 4.2 (967), 5.1 (1056), 5.4 (1102), 5.4a (1177), 5.5a (1196), 5.5b (1265), 5.6 (1394), 5.6.2 (1457), 7.4 (1712), 8.3 (1779), 8.4 (1811), 10.4 (1933), 11 (1981), 12.1 (2014), 12.2 (2033), 12.3 (2045) and 12.5 (2113). Each definition of `Suggested.lean` has at least three discriminating values. Some lists put them all in one bullet, e.g. 4.2's `Distribution`: constant, contact, non-example, rank 0, rank `dim`.
- r9 R03 (`rfl` restatement, missing docstrings): **partly repaired.** The two docstrings exist (`Suggested.lean:803–806, 1243–1246`) and `volume_circle`'s states `vol(S¹) = 2π` (1703–1705). `toFlow_apply` remains, kept on a ground that is false (R04).
- r9 R04 (no stated order with #334 and #1187): **not repaired** (R05).

## R01 (P2) — The folder mixes two Tau Ceti revisions and conflicts with main

**Location:** `TauCetiRoadmap/DifferentialGeometry/README.md:286–289`: "cited at Tau Ceti `2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules postdate the revision `358314d4` that this folder's `Suggested.lean` is written against". Also README 41–49 and layers 0–5, 5.6 and 12, and the whole of `Suggested.lean`, including the docstring's not-statable list (lines 43–61).

**Claim:** layers 6–11 treat Tau Ceti `2fd255d9` (main's pin since `a891cd19`) as the library and cite 83 declarations there. Everything else is written against this branch's pin `358314d4`: layers 0–5, 5.6 and 12, every `Suggested.lean` declaration, and the docstring's statability claims. Neither revision makes both parts right.

- **Read at `358314d4`** (the branch's `lake-manifest.json`), 51 of the 84 `TauCeti.*` names the README cites do not exist. Neither do three of the files it cites:
  - `Geometry/Manifold/Exhaustion.lean`, which 7.4 *Needs*;
  - `AlgebraicTopology/Cohomology/UniversalCoefficient.lean` and `AlgebraicTopology/Singular/BrouwerFixedPoint.lean`, which README 305 and 309 cite with no revision qualifier.

  So 7.4, 8.1 and 10.5 consume inputs nobody owns at the pin.
- **Read at `2fd255d9`**, every cited name resolves. But there Tau Ceti proves, with no `sorry`, theorems under 21 of the names that `Suggested.lean` admits as headlines. Most are at the same or wider generality: `green_ac_winding` is identical, `mextDeriv_smul` takes any scalar ring, `hessian_symm` needs only `C²`, `integral_divergence_eq_zero` only a `C¹` field. Two are narrower: `exists_timeDependentFlow` is finite-dimensional there, and `timeDependentFlowDomain_eq_univ` concerns the suspension over `ℝ` rather than an open slab. The 21:
  - forms (0–1): `wedgeWith_flip`, `wedgeWith_assoc`, `bracketWedge_jacobi`, `smoothForms_wedgeWith_mem`, `mextDeriv_add`, `mextDeriv_smul`, `mpullback_mextDeriv`, `mextDeriv_mextDeriv` (`DifferentialForm/Squared.lean:72`), `isSmoothForm_mextDeriv`, `mextDeriv_wedgeWith`, `mextDeriv_apply_one`;
  - orientations (2): `orientable_of_forall_index_ne_two` (`Orientation/Cover/FundamentalGroup.lean:41`);
  - flows (3): `isCompleteVectorField_of_compactSpace`, `exists_timeDependentFlow`, `timeDependentFlowDomain_eq_univ`;
  - Green (5.6): `green_ac_winding`, `green_ac_index_one`;
  - Riemannian (12): `nonempty_contMDiffRiemannianMetric`, `hessian_symm`, `integral_divergence_eq_zero` (`Riemannian/DivergenceTheorem.lean:225`), `integral_mul_laplaceBeltrami`.

  It also declares at least 58 of the file's names as its own carriers: `RoughForm`, `SmoothForm`, `mextDeriv`, `closedForms`, `OrientationLift`, `orientationAt`, `Orientable`, `flowOf`, `IntegralManifold`, `IsOutwardPointing`, `circleAngularForm`, `fullSimplex`, `curl`, `windingWeight`, `mgradient`, `divergence`, `laplaceBeltrami`, `roundMetricCircle`, ….
- **Statability.** Half-space Stokes is proved there (`TauCeti.integralTopForm_mextDeriv`, `DifferentialForm/Integration/Stokes.lean:37`), although the docstring calls it not statable. 9.2, 9.3 and 10.4 become statable on `TauCeti.compactlySupportedDeRhamCohomology.integral`, `TauCeti.poincarePairing` and `TauCeti.degreeAtRegularValue`. At either revision, the docstring's claim that 8.5 lacks "singular cohomology with real coefficients" is false: `TauCeti.singularCohomologyFunctor` (`AlgebraicTopology/Cohomology/Basic.lean:60`) takes any coefficient ring.
- **Mixed names within one file.** The README cites `358314d4` names that main's bump renamed:
  - `TauCeti.Contour.IsPiecewiseC1On` (line 699);
  - `Geometry/Manifold/LocalDiffeomorph.lean` (246);
  - `MeasureTheory/Function/MetricDerivative.lean` (328).

  Main's own edit of this `Suggested.lean` uses the new names: `TauCeti.IsPiecewiseC1On`, `LocalDiffeomorph.Basic`, `MetricDerivative.Basic`.

**Witness:** `git merge-tree --write-tree HEAD origin/main` reports a content conflict in `Suggested.lean`. Tau Ceti `2fd255d9` `Analysis/Green/Winding.lean:30` proves `TauCeti.Green.green_ac_winding`, word for word `Suggested.lean:1380–1389`. At `358314d4`, `TauCeti.deRhamCohomology` (README 1621) does not exist.

**Repair:**

1. **Rebase onto main.** The branch's manifest then pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` and Lean v4.36.0-rc2, without the pull request touching a file outside the folder. Write both files against that one revision.
2. **Suggested.lean: delete what Tau Ceti already has.** Delete every admitted theorem that a Tau Ceti theorem implies (19 of the 21 above) and every carrier Tau Ceti declares. Keep, restated on the native carriers, the forms Tau Ceti has only narrowly: the Banach `exists_timeDependentFlow` and the slab `timeDependentFlowDomain_eq_univ`. Exception: the names that consumers on main import must keep compiling, so keep them only as abbreviations of the Tau Ceti natives:
   - AlgebraicTopology's five orientation files: `Manifold.Orientation`, `OrientationLift`, `OrientationLift.setoid`, `orientationAt`, `Manifold.Orientation.pullback`, `fullSimplex`, `fullSimplexEquivStdSimplex`;
   - ComplexKahlerGeometry: `Density`, `Distribution`, `SmoothForm`;
   - ContactGeometry: `RoughForm`, `RoughForm.ofFunction`, `mextDeriv`.

   Restate the remaining headlines on the Tau Ceti carriers.
3. **State what becomes statable.** State 9.2 (top cohomology), 9.3 (Poincaré duality) and the 10.4 integral formula on the Tau Ceti carriers. Rewrite the docstring's not-statable list for `2fd255d9`.
4. **README: cite what is done.** Treat every target `2fd255d9` realizes the way layers 6–7 are already treated: name the declaration, keep the id, and leave as a target only what is missing. That covers 0.1–0.4 apart from the migration, 1.1–1.4, 2.1–2.2 and 2.4, 3.1–3.2 and 3.5, 5.1–5.3, 5.4's operator, 5.6.1–5.6.3, 12.1–12.3 and boundaryless 12.5. Main's generated `STATUS.md` for this roadmap lists what remains: 2.3, 3.3 homogeneity, Frobenius flat charts and leaves, Stokes on `M × [0,1]`, 5.5a–5.5b, 12.4, boundary 12.5, 12.6, 7.4, 8.3–8.5, 9.2–9.3, 10.2–10.5 and 11.
5. **Check it.** Run the gate's targeted build on the rebased head. The refuting instance, `green_ac_winding`, is then cited rather than admitted.

## R02 (P3) — Tau Ceti's orientation API is not cited; the atlas criterion restates it

**Location:** README 2.2, lines 767–769 (`orientable_iff_exists_atlas`); the first bullet of *Statements that must not enter the library*, lines 2144–2146; *From Tau Ceti*, lines 233–333, which cites no orientation file. Also `Suggested.lean:732–736`.

**Claim:** the README presents the positive-Jacobian-atlas definition as a mistake that must not enter the library, and the theorem spells that predicate out inline. Tau Ceti already defines it at the pin, over every model, and it fails for `Set.Icc 0 1` over `𝓡∂ 1`, which the README itself says has no positive-Jacobian atlas (lines 166–168, 737–738). The README never names it and plans no reconciliation, unlike `SmoothTwoForm` in *Existing code to refactor*.

**Witness:** at the pin, `TauCeti/Geometry/Manifold/Orientation.lean:332,345` defines `IsOrientedAtlas` and `class Orientable`: an oriented atlas from the maximal `C^n` atlas, with positive-determinant transitions. The right-hand side of `orientable_iff_exists_atlas` is `TauCeti.Orientable I 1 M` written out.

**Repair:**

- Cite `Geometry/Manifold/Orientation.lean` under *From Tau Ceti*: `OrientationPreservingOn`, `orientationPreservingGroupoid`, `IsOrientedAtlas`, `TauCeti.Orientable`.
- State the theorem as `Orientable I M ↔ TauCeti.Orientable I 1 M` under `[BoundarylessManifold I M]`.
- Add a Check: `Set.Icc 0 1` over `𝓡∂ 1` is chart-sign orientable but has no oriented atlas.
- Reword the bullet: Tau Ceti's atlas class agrees with chart-sign orientability on boundaryless manifolds and is narrower for 1-manifolds with boundary.

After R01's rebase, the same repair reads against `2fd255d9`. There Tau Ceti has the chart-sign `Orientable` (`Orientation/Basic.lean:263`), `IsOrientedAtlas` (`Orientation/OrientedAtlas.lean:283`) and only the direction atlas ⇒ orientable (`Orientation/Atlas.lean:181`). The converse for boundaryless `M`, stated with `TauCeti.IsOrientedAtlas I 1`, remains this roadmap's target.

## R03 (P3) — `Distribution.IsInvolutive` restates a pinned predicate

**Location:** `Suggested.lean:1001–1035` (the `Distribution` structure and `Distribution.IsInvolutive`); README 929–937 ("a bundled signature presentation of that shared data").

**Claim:** the acceptance test restates two library definitions instead of using them:

- `Distribution.IsInvolutive` repeats `TauCeti.IsInvolutiveDistribution` verbatim;
- `Distribution`'s `finrank_fiber` and `exists_localFrame` fields restate `TauCeti.IsContMDiffDistribution` (equivalent, since a spanning family of `k` fields in a rank-`k` fibre is a basis).

The five Layer 4 headlines are statable on the natives directly.

**Witness:** pin `TauCeti/Geometry/Manifold/Distribution.lean:236–239`: `IsInvolutiveDistribution I D` has the same binders and conclusion as `Suggested.lean:1026–1035`. At `:163–165`, `IsContMDiffDistribution I n k D` is the rank-`k` local-frame condition.

**Repair:**

- Give `Distribution` the fields `fiber` and `isContMDiff : TauCeti.IsContMDiffDistribution I n k fiber`. ComplexKahlerGeometry and ContactGeometry import the name, so keep the structure.
- Delete `Distribution.IsInvolutive`.
- Let `isInvolutive_of_forall_exists_integralManifold`, `isInvolutive_iff_forall_mextDeriv`, `exists_flatChart`, `exists_isSliceChart_integralManifold`, `exists_contMDiff_factor` and `exists_leaf` take or conclude `TauCeti.IsInvolutiveDistribution I D.fiber`.
- README 950 then names the Tau Ceti predicate.

After R01's rebase, also compare `Distribution.IntegralManifold` with Tau Ceti `2fd255d9` `Geometry/Manifold/Distribution/IntegralManifold.lean:139`.

## R04 (P3) — `toFlow_apply` is a `rfl` restatement kept for a consumer that does not exist

**Location:** `Suggested.lean:856–861`: "The maps of `toFlow` are `flowOf`, by construction. Kept because MorseNovikov's `Suggested.lean` consumes it by this name."

**Claim:** no roadmap consumes `toFlow_apply`, and the theorem restates the `toFun` field of `toFlow`.

**Witness:** `roadmaps grep --fixed toFlow_apply` finds it only in this folder, on main and at every open head. Main's `TauCetiRoadmap/MorseNovikov/Suggested.lean` imports only `Mathlib`. The proof is `rfl`.

**Repair:** delete `toFlow_apply`. README line 841 then reads "the flow of a complete vector field as a Mathlib `Flow ℝ M` (`toFlow`, whose maps are `flowOf`)", without the backticked theorem name.

## R05 (P3) — Two other open pull requests change this folder and no order is stated

**Location:** the pull-request description (data), against the worker's overlap report.

**Claim:** when two open heads change the same roadmap and conflict, the description says which one is rebased on the other.

**Witness:** open #334 (another author's draft of this folder) and #1187 (a Tau Ceti bump) both conflict with this head in `Suggested.lean`. The description names neither.

**Repair:** add one sentence to the description, for example: "this head supersedes the draft #334 and is rebased on main after its Tau Ceti bump; #1187 is rebased on this head" (or whatever order is intended). The README must not name pull-request numbers.

## Verified sound

**Gate, elaboration, depcheck.** Worker's gate and a rerun: every scanner `0`, `OK`. `lake env lean` on `Suggested.lean` against Tau Ceti `358314d4` and Mathlib `f6090c70` (the branch's manifest, checked with `git rev-parse` in the package directories): exit 0, 61 sorry warnings, nothing else. Fresh depcheck:

    depcheck: 237 roadmaps, 2341 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. DifferentialGeometry is on main, and DeRhamCohomologyAndDuality (order line 393) consumes it; no layer here consumes DeRhamCohomologyAndDuality.

**Mechanical signature check.** A scratch copy of `Suggested.lean` with `#check @name` for all 123 declarations elaborated with exit 0. Compared with the README:

- the hairy-ball theorems carry exactly `[InnerProductSpace ℝ E] [Fact (finrank ℝ E = n + 1)]` and `Even n`;
- `orientable_iff_exists_atlas` carries `[FiniteDimensional ℝ E] [BoundarylessManifold I M] [IsManifold I 1 M]`;
- `Distribution.exists_leaf` carries `[IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M] [FiniteDimensional ℝ E]`;
- `toFlow_apply` carries `[T2Space M] [BoundarylessManifold I M] [CompleteSpace E]`;
- the half-space divergence theorem and `exists_halfSpaceOutwardUnitNormal` carry `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]` and the smooth and continuous metric instances.

No admitted statement lost a hypothesis its truth needs. Every one of the file's names occurs in the README. The eight leads of the citation tool are the file's own names (`Distribution.*`, `Manifold.Orientation.pullbackSign` and its two laws), all declared.

**Padding probe.** Each of the 61 admitted theorems, with `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide` on a scratch copy at the pin: all 61 failed. At the branch pin nothing closes by one tactic. At main's pin, 19 of them follow from Tau Ceti theorems (R01). The previous round's `exact?` probes on `mextDeriv_smul`, `nonempty_contMDiffRiemannianMetric` and the compact-completeness theorem apply unchanged; those statements did not change.

**Pinned declarations opened, at `358314d4`/`f6090c70`.**

- Tau Ceti orientations and distributions: `TauCeti/Geometry/Manifold/Orientation.lean:99, 178, 332, 345`; `Distribution.lean:87, 163, 236, 338–346` (`standardContactDistribution` has carrier `v.2.2 = p.1 * v.2.1`, i.e. `ker(dz − x dy)`); `Foliation/Basic.lean:63`; `Distribution/Graph.lean:235`; `Analysis/ODE/Frobenius.lean`.
- Tau Ceti two-forms: `TwoForm/Basic.lean:61`; `TwoForm/Closed.lean:296`; `Symplectic/Manifold/TwoForm.lean:92` and its three sibling files.
- Tau Ceti contour and cohomology: `Analysis/Contour/Winding/Number/Basic.lean:76` (`windingNumber`); `Analysis/Contour/PiecewiseC1On.lean` (`TauCeti.Contour.IsPiecewiseC1On`); `Analysis/Contour/Cycle/Basic.lean:183` (`Cycle`); `AlgebraicTopology/Cohomology/Basic.lean:60`.
- Mathlib: `CurveIntegral/Basic.lean:145, 331`; `AbsolutelyContinuous.lean:357` (`boundedVariationOn`); `BoxIntegral/Integrability.lean:198`; `BoxIntegral/Partition/Filter.lean:244, 258` (`Henstock = ⟨false, true, false⟩`, `GP = ⊥`); `BoxIntegral/DivergenceTheorem.lean:151` (`hasIntegral_GP_pderiv`: continuity at a countable set, derivative off it, no integrability of `f'`). Mathlib has no manifold orientation and no `hairy` result.
- At `2fd255d9` (the revision R01 asks for), the following were opened and contain no `sorry`: `Analysis/Green/Winding.lean:26–38`, `Analysis/Green/IndexOne.lean:33`, `DifferentialForm/Integration/Stokes.lean:37–43`, `DifferentialForm/Squared.lean:72`, `Riemannian/{Laplacian,DivergenceTheorem}.lean`, `Orientation/{Basic,Lift,OrientedAtlas,Atlas,Cover/FundamentalGroup}.lean`, `Flow/Complete.lean:154`, `DeRham/PoincarePairing.lean:111, 151`, `Degree/Basic.lean:76`. All 83 declaration names the README cites resolve there, as do the 20 files of lines 290–313 that were checked.

**Cross-roadmap citations resolved.**

- DeRhamCohomologyAndDuality at its head: `README.md:3–8, 25–49` (scope as R01 of r9 required), its Layer 2 owns smooth proper exhaustion functions, and 7.4 here consumes Tau Ceti's, not its own.
- Main: GeometricMeasureTheory G1, G2, G6 (`README.md:106, 148, 275`, citing 5.6 at 299); `Completed/ConformalMapping` L5 (`README.md:133–137`, `filledHull C \ C`); `Completed/ContourIntegration`, PDE, ModularForms and Isoperimetry exist.
- The §5.5 → 5.5a/5.5b mapping (lines 37–39) covers the one dropped id that other roadmaps cite.
- Consumers on main that import this file use the names listed in R01's repair.
- Duplicate-owner search with `roadmaps grep`: "hairy ball", "Mayer–Vietoris induction" and `laplaceBeltrami` in every open head. Only consumers citing this roadmap appeared.

**Seeded source sample.**

- "Smooth 2-forms" (344–352): the carrier, chartwise `IsClosed` and `IsSymplectic` exist at the pin as cited.
- "Canonical interfaces and reuse" (910–937): all six cited objects and files exist.
- Layer 4 "Acceptance examples" (1026–1036): with `S(x,y,z) = (y,x,z)`, the pinned fibre at `S p` is `w₃ = y w₂`; pulled back it is `v₃ = y v₁ = ker(dz − y dx)`.
- "Conventions and existing inputs" (1341–1361) and "Henstock–Kurzweil" (1466–1479): declarations as above. A `Box (Fin 1)` has distortion `1`, so the GP/Henstock equivalence is the vacuous distortion bound.
- 5.6 "Acceptance examples" (1546–1564), "Flat punctured-plane family" (1566–1579): table below.
- "Ownership and ordering" (1581–1595): the four linked roadmaps exist with the cited sections.

**Adversarial table.** Values by hand or by a scratch script (central differences, step `10⁻⁶`; midpoint rule, `2·10⁵` points).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `green_ac_winding` | twice-traversed unit circle, `P = −y/2`, `Q = x/2` | circulation `∫₀^{4π} ½ = 6.283185`; `∫ 2 · 1 dA = 2π` | true; identical to `TauCeti.Green.green_ac_winding` at `2fd255d9` | R01 |
| `green_ac_index_one` | unit circle, same field | `π = π`; `K ⊆ filledHull K`, index `0` off it | true; proved at `2fd255d9` | R01 |
| `green_verticalCell` | unit square `P = y`; triangle `ℓ = 0`, `u = x` | `−1 = −1`; `−0.5 = −0.5` | true | none |
| `green_horizontalCell` | `Q = x²`, `ℓ = 0`, `u = 1 + y` | `∫₀¹ (1+y)² = 2.333333 = ∫∫ 2x` | true | none |
| Flat punctured family | `α = 0.7` at `(0.8, −0.3)`; unit circle `α = 0.7, 1, 2` | curl `0.747869` vs `2(1−α)ρ^{−α} = 0.747869`; loop `6.283185` ×3 | closed iff `α = 1`, never exact | none |
| Ellipse gate | `a = 2`, `b = ½` | `∮ x dy = 3.141593 = πab` | true | none |
| HK gate `h = t² sin t⁻²` | `∫ h'` and `∫ |h'|` | `h(1) − h(0) = sin 1 = 0.841471`; `∫ ½u⁻¹|cos u| du = ∞` | HK, not Bochner | none |
| `curl` Check | `(−y, x)`, `(y, x)`, `(0, x)`, swapped `(x, 0)` | `2`, `0`, `1`, `0` | order pinned | none |
| `circulationFun` Check | `e^{it}`, `P = −y/2`, `Q = x/2` | integrand `½`, integral `π` | true | none |
| `exists_eq_zero_of_inner_eq_zero` | `n = 0` (`E = ℝ`); `n = 1`, `v = ix`; `n = 2`, `(−x₂, x₁, 0)` | `⟪v x, x⟫ = 0 ⇒ v x = 0` at `±1`; `v` nowhere `0`, excluded by `Even n`; zeros `(0,0,±1)` | true, parity needed | none |
| `exists_eq_zero_of_continuous_section` | `n = 0` | `TangentSpace (𝓡 0) = 0`, sphere `{±1}` nonempty | true | none |
| 11.1 route | great-circle homotopy at `t = 1` | `cos π · x + sin π · w = −x`; `deg id = 1` vs `(−1)^{n+1} = −1`, `n = 2` | contradiction for even `n` | none |
| 10.3–10.4 Checks | `z ↦ zᵏ`; `z̄`; antipodal `S¹`, `S²` | `k`; `−1`; `+1`, `−1` | true | none |
| 10.4 negative control | `(0, ∞) ↪ ℝ`, `y = ±1` | counts `1`, `0` | compactness needed | none |
| `degreeAtRegularValue_const` Check | point target | constant = identity, count `1 ≠ 0` | `0 < dim N` needed | none |
| 7.4 negative control | `P` = "`H⁰` finite-dim.", `⊔ₙ` balls | basis `1`; MV injects `H⁰(U ∪ V)`; union `∞` | disjoint-union hypothesis needed | none |
| 7.4 second Check | two arcs covering `S¹` | `P(U), P(V), P(U ∩ V)` hold, `[dθ] ≠ 0` | step fails as it must | none |
| 8.3 cube-root charts | smooth path, `g(s) = g(t) + h(s)³` | `g'(t) = 3h(t)²h'(t) = 0` | smooth `H₀` has dimension `|ℝ|`, singular `1` | none |
| 8.3 corner 3-simplex | faces `(y−z)²`, `(x−z)²`, `(x−y)²` | Hessian diagonal `2`, off-diagonal `−2`; along `(t,t,t)`: `½t²·(−6) = −3t²` | no smooth filling | none |
| 8.4 face convention | `σ(t) = t` on `fullSimplex 1` | `∂σ = σ∘δ₀ − σ∘δ₁ = [1] − [0]`; `∫_σ df = f(1) − f(0)` | true | none |
| 9.1 boundary | `[0,1]`, `⟨[1], [dx]⟩` | `[dx] = 0` vs `∫ dx = 1` | boundaryless needed | none |
| 9.3 corollary | `V ≅ V**` abstractly | infinite-dim. ⇒ `dim V** > dim V` | finite-dim. follows | none |
| Two-origin line | `H¹_dR`, singular `H¹` | primitive glues (`f_U = f_V` off `0` ⇒ everywhere): `0`; MV: `ℝ` | `T2` needed | none |
| `orientable_iff_exists_atlas` | `dim 0`; `Icc 0 1` over `𝓡∂ 1` | `det` of the zero map of `0` is `1`, both sides true; `Icc` chart-sign orientable, no oriented atlas | true for boundaryless; RHS is `TauCeti.Orientable I 1 M` | R02 |
| `Distribution.IsInvolutive` | binders vs `Distribution.lean:236–239` | identical | duplicate | R03 |
| `toFlow_apply` | proof | `rfl` | restatement | R04 |
| `isInvolutive_iff_forall_mextDeriv` | rank `0`; rank `dim` | both sides true; only `η = 0` annihilates `TM` | true | none |
| `exists_isOrientationPreservingAt_pullback` | `M = ∅` over `ℝ²`, `ι = Fin 1` | `hcard`: `1 = 2`, excluded | true | none |
| `pullbackSign` transition Check | `ℝ` with charts `t`, `−t`, `y = 1` | signs `+1`, `−1`, product `−1` = transition sign | factor needed | none |
| 3.3 Check | `v = x²` from `1` | `1/(1−t)`, `t < 1`; from `2`: `2/(1−2t)` blows up at `½` | law only on domain | none |
| 3.5 Check | `v(s,x) = s` | `x + (t² − s²)/2`; `(r²−t²)/2 + (t²−s²)/2 = (r²−s²)/2`; `s − t` reading gives slope `−t` | true | none |
| 1.3 `mextDeriv_add` Check | `∛x dy + (x − ∛x) dy` at `0` | `0 + 0` vs `dx ∧ dy` | `C¹` needed | none |
| 0.3 wedge Check | `(x dy) ∧ dx` at `(e₁, e₂)` | `0·0 − x·1 = −x` | true | none |
| 0.1 Jacobi Check | skew bracket with `[e₃, e₁] = e₁` | `0 + 0 + e₃ ≠ 0` | Jacobi needed | none |
| 5.5a `Density` Check | `2·id` vs doubling `span v` | `2^dim c = 2^m c ⇒ c = 0` | forced zero for `m < dim` | none |
| `planeAngularForm` | `e^{it}`; reversed convention | `cos² t + sin² t = 1`, `∫ = 2π`; `−2π` | pinned | none |
| 12.2 gradient Check | `g = diag(4,1)`, `f = x₁` | `¼ ∂₁`; `⟪¼∂₁, v⟫_g = v₁` | metric matters | none |
| 12.3 divergence Check | `g = e^{2x₁}δ`, `X = ∂₁` | `(1/√g) ∂₁ √g = 2.0`; flat trace `0` | true | none |
| 12.3 Hessian Check | `f = x₁`, same `g` | `−Γ¹₂₂ = 1`; `e^{−2x}Γ²₂₁⟪∂₂,∂₂⟫_g = 1` | covariant | none |
| 12.5 boundary metric Check | `e^{2y}δ` on `{x₀ ≥ 0}` | `e^{2y} dy²`, volume `e^y dy` | true | none |
| Stokes 5.3 headline | `358314d4`; `2fd255d9` | no integral of top forms: not statable; `integralTopForm_mextDeriv` proved | docstring right only at the old pin | R01 |
| 8.5 headline | `358314d4` | no de Rham complex or chain integration; `singularCohomologyFunctor` exists | not statable, one stated reason false | R01 |

## Not verifiable

- [Lee] *Introduction to Smooth Manifolds* (2nd ed.), [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor] *Topology from the Differentiable Viewpoint*: no legal copy is available to this worker (publisher paywalls; `sources.toml` records none). The locators were not checked against the text: Lee Thm. 6.10, 9.12–9.48, 13.3, 14.13–14.35, 15.5–15.43, 16.6, 16.25, 16.32, 17.14, 17.17, 17.21, 17.27–17.28, 17.34–17.35, Cor. 17.42, 18.4–18.14, Problems 16-6 and 18-6 to 18-8; Bott–Tu I §§2, 5; Milnor §5. Each statement's mathematics was checked independently in the table. 9.2's locator, "[Lee, Ch. 17, the top-degree compactly supported cohomology of a connected oriented manifold]", names no theorem, so the exact item could not be identified.
- The Zulip and GitHub design references ([t1]–[t13], mathlib4 pull requests) were not fetched. The README uses them for design only.
- Ownership against the open pull requests the brief lists without files (among the vocabulary neighbours, Surfaces and the later ComplexKahlerGeometry head) was checked only by `roadmaps grep` for the objects named above.

## Source issues

- none
