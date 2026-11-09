# Review of FuchsianOrbifolds (pull request #1168 at f997c5f)

**Verdict:** needs changes

This is a full review of the head the previous round read; the folder has not changed since. There are seven findings, all P3, so none is blocking:

- R01 carries the previous review's R01.
- R02–R07 are new. They come from the source-spine sample, the route and *Needs:* audit, and the completion criterion.

The gate passes. `Suggested.lean` elaborates with seven `sorry` warnings and nothing else.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean` 50–58: `abbrev CompactifiedQuotient … := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`.
  - The same file, 151–153: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`, together with import line 7 and docstring 17–19.
  - README 166–170.
- **Claim.**
  - No headline uses either abbreviation, and `compactifiedChartedSpace` restates the pinned `Subgroup.CompactifiedQuotient.instChartedSpace`.
  - The first `export` is a catalogue of seven renamed Tau Ceti declarations.
  - Their only user is this branch's copy of `ModularForms/Suggested.lean`, which is the merge-base version; main has replaced it. The commit that restored the block gives that copy as its reason, and the reason disappears with a merge.
- **Witness.**
  - On main `c44dcc8`, `ModularForms/Suggested.lean` imports only Mathlib and three `TauCeti.*` modules.
  - `roadmaps grep` finds no import of this module, and no use of the nine names, on main or at any open head.
  - `git merge-tree HEAD origin/main` is clean, and `lake-manifest.json` is identical on both sides.
- **Repair.**
  1. Merge `origin/main` into the branch. Afterwards no file outside the folder differs from main. If the repair job may not merge, the operator does this step.
  2. Delete `Suggested.lean` 48–59, 151–153 and import line 7.
  3. Replace docstring 17–19 with: "It exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete the text from "It also declares" to "short names `RiemannSurface.*`." (166–170).

  Tested on a scratch copy: it elaborates with `sorry` warnings only. `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve, and `riemannHurwitz` still elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap`.

## R02 (P3) — Five source-spine locators point at sections on other topics

- **Location.** README:
  - 394: "Farkas--Kra, Chapter I §§4--5";
  - 569: "Katok, §§3.4 and 4.2; Forster, §19";
  - 622: "Forster, §§18--19";
  - 731: "Farkas--Kra, Chapter II §4".
- **Claim.** None of these sections treats elliptic quotient charts (Layer 1), cusps (Layer 3), the compactification (Layer 4) or genus and Riemann–Hurwitz (Layer 5).
- **Witness** (the published tables of contents):
  - Farkas–Kra: I.4 "Integration Formulae" (no I.5); II.4 "Harmonic Differentials"; quotients are IV.9 "Discontinuous Groups and Branched Coverings".
  - Forster: §18 is "Prescribed Principal Parts", §19 "Harmonic Differential Forms".
  - Katok: §3.4 is "The limit set", §4.2 "Cocompact Fuchsian groups".
- **Repair.**
  - 394: replace with "Farkas--Kra, §IV.9".
  - 569: delete "Katok, §§3.4 and 4.2; Forster, §19". Diamond–Shurman §2.4 ("Cusps") remains.
  - 622: delete "Forster, §§18--19".
  - 731: replace with "Farkas--Kra, §§I.2 and III.1" ("Topology of Riemann Surfaces"; "Intersection Theory on Compact Surfaces", the alternating pairing that makes `b₁` even). These are chosen by title; the text is uncertified.
  - Update the `FarkasKra1992` locator in the package manifest to match.

## R03 (P3) — Riemann–Hurwitz's route needs finite CW type of the punctured target, which AlgebraicTopology Stage 8 item 7 does not state

- **Location.**
  - README 661–663: "given finite CW type of `X`, `Y` and of `Y` minus the finitely many branch values, which AlgebraicTopology Stage 8 item 7 supplies with marked points".
  - The *Needs:* lines 667–669. Layer 5 item 6 (692–699) inherits the same input.
- **Claim.**
  - The pinned branched-cover formula takes `[FiniteCWType ↥f.branchValuesᶜ]` as a hypothesis.
  - Stage 8 item 7 gives finite CW type only in the compact case. Its marked points are cells of that structure; for a noncompact manifold such as `Y \ S` it gives only countable locally finite CW type.
  - So the step is unowned here. TeichmullerGeometry claims "the finite CW type of punctured compact surfaces" (its README 369), but it comes later in the merge order.
- **Witness.**
  - AlgebraicTopology README 1815–1816 on main: "The compact case has finite CW type; include … finitely many prescribed interior marked points".
  - The pinned `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage` (`AlgebraicTopology/SimplicialComplex/Realization/Complement.lean` 132) supplies the punctured case.
- **Repair.**
  - In 662–663, replace "which AlgebraicTopology Stage 8 item 7 supplies with marked points" with: "from a triangulation of `Y` with the branch values among its vertices (AlgebraicTopology Stage 8 item 7, marked-point form) and Tau Ceti's `AbstractSimplicialComplex.instFiniteCWTypeComplVertexImage`, transported along the triangulation by `Homeomorph.finiteCWType`".
  - Add both names to the *Needs:* of items 3 and 6.
  - Tested on `z ↦ z²`: triangulate `P¹` as a tetrahedron boundary with `0` and `∞` as vertices. The instance makes `P¹ \ {0, ∞}` of finite CW type, and `eulerChar_compl_of_finite` gives `χ = 2 − 2 = 0`. Both names `#check` at the pin.

## R04 (P3) — "The genus read off the polygon" is used but never defined

- **Location.**
  - README 500–501: "the genus read off the polygon is identified with the genus of the compactified quotient in Layer 5 item 7".
  - README 709: "whose cell count is `2 − 2h` for the polygon genus `h`".
- **Claim.** No layer and no pinned declaration defines a polygon genus. So the target of Layer 5 item 7 names an object that does not exist.
- **Witness.** The pinned `SidePairing.covolume_eq_two_pi_mul` (`Fuchsian/Polygon/Area.lean` 129) is `2π((n − k)/2 − 1 − V + Σₑ(1 − 1/mₑ))`. Here `n` counts sides, `k` self-paired sides and `V` finite vertex cycles; there is no genus or cusp term.
- **Repair.**
  - In 705–711, state the target as the cell count. For a side pairing as in Layer 2 items 4–5 with `c` ideal vertex cycles, prove `eulerChar X(Γ) = V + c + 1 − (n − k)/2`.
  - Then item 1 gives `(n − k)/2 − 1 − V = 2 genus X(Γ) − 2 + c`, and with the pinned formula this is `covolume_eq_two_pi_mul_signature`.
  - In 500–501, write "the Euler characteristic of `X(Γ)` is computed from the polygon in Layer 5 item 7".
  - Add a Check. Computed values of `(n, k, V, c) ↦ V + c + 1 − (n − k)/2`:
    - `PSL(2,ℤ)`: `(3,1,1,1)` and the split-arc convention `(4,0,2,1)` both give `2`;
    - `Γ(2)`: `(4,0,0,3)` gives `2`;
    - the commutator subgroup: `(4,0,0,1)` gives `0`;
    - the genus-2 octagon: `(8,0,1,0)` gives `−2`.

## R05 (P3) — Layer 4a's title restricts it to compact orbifolds; its theorems are not

- **Location.**
  - README 734: "## Layer 4a: minimum area of compact orientable hyperbolic orbifolds".
  - `Suggested.lean` 104: "Layer 4a: minimal areas of cofinite Fuchsian groups".
- **Claim.**
  - Item 1 covers every cofinite group, and item 2 only groups with a cusp, whose quotient is never compact.
  - So the title excludes item 2's equality case `PSL(2,ℤ)`, and it disagrees with the Lean section comment.
- **Witness.** `minimum_area_finite_area_orbifold` assumes `[Nonempty Γ.CuspOrbit]`, and `covolume_eq_pi_div_three_iff` holds for `PSL(2,ℤ)`, area `π/3`.
- **Repair.**
  - Retitle 734 "## Layer 4a: minimal areas of cofinite Fuchsian groups".
  - `roadmaps grep` finds no link to the old anchor; consumers cite "Layer 4a".

## R06 (P3) — The completion criterion leaves out owned targets that downstream roadmaps consume

- **Location.**
  - README 43: "The roadmap is complete when Tau Ceti proves the following." This is followed by items 1–9.
  - Compare 154–159, which list the open targets of Layer 0 items 1–2 and Layer 2 item 1.
- **Claim.**
  - The roadmap could be declared complete without:
    - second countability of `PSL(2,ℝ)`;
    - the isometric action of `GL(2,ℝ)`;
    - L2.1's distance comparison and isometry `ℍ ≃ᵢ UpperHalfSpace ℝ`.
  - TeichmullerGeometry (README 337, 352, 567) and ArithmeticFuchsianGroups (README 1239, 1250) consume these.
  - The distance comparison is statable at the pins and absent from `Suggested.lean`.
- **Witness.** `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` elaborates with Tau Ceti's Poincaré-metric instance (`PoincareMetric.lean` 144). `#synth` finds no instance, so it is open.
- **Repair.**
  1. Add item 10 to the criterion: "`PSL(2,ℝ)` is second countable; every element of `GL(2,ℝ)` acts on `ℍ` by an isometry of `dist` and a Riemannian isometry of the Poincaré metric; the Riemannian distance of the Poincaré metric is Mathlib's `dist`; `x + iy ↦ (x, y)` is a Riemannian isometry onto `TauCeti.UpperHalfSpace ℝ` and an isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ`."
  2. In `Suggested.lean`, add `import TauCeti.Analysis.Complex.UpperHalfPlane.PoincareMetric` and a section `/-! ## Layer 2: hyperbolic polygons and cofinite groups -/` before Layer 5. Under it put a docstring naming the Poincaré metric and Katok §1.2, then `theorem isRiemannianManifold_upperHalfPlane : IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ := by sorry`.
  3. Name `isRiemannianManifold_upperHalfPlane` in README 410–412 and in the docstring's "Stated here" list.

  Tested together with R01 on a scratch copy: 8 `sorry` warnings and nothing else, and neither `infer_instance` nor `simp` closes the new theorem.

## R07 (P3) — Layer 2 item 1 has one *Needs:* line for six targets with different inputs

- **Location.** README 443–450: a single *Needs:* line of 17 inputs, ending "Layer 0 item 2". It covers the `GL(2,ℝ)` Riemannian isometries, the distance comparison, the half-space Riemannian isometry, `ℍ ≃ᵢ`, the curvature transport and completeness.
- **Claim.** The half-space Riemannian isometry and the curvature transport appear blocked behind Layer 0 item 2 and the distance comparison, which neither uses.
- **Witness.** README 417–421 derive the half-space comparison from `poincareRiemannianMetric_inner` and `UpperHalfSpace.inner_def` alone: "both tensors are the Euclidean one divided by the squared height".
- **Repair.** Keep item 1, since consumers cite "Layer 2 item 1", but split it into sub-bullets, each with its own *Needs:*:

  | Sub-bullet | *Needs:* |
  |---|---|
  | (a) `GL(2,ℝ)` acts by Riemannian isometries | `poincareRiemannianMetric_inner`, `im_smul_eq_div_normSq`, `J`, `coe_J_smul`, `TauCeti.Isom`, Layer 0 item 2 |
  | (b) the distance comparison | (a), `dist_eq`, `IsIsometricSMul PSL(2, ℝ) ℍ`, `IsRiemannianManifold` |
  | (c) the half-space Riemannian isometry | `poincareRiemannianMetric_inner`, `UpperHalfSpace.riemannianMetric`, `inner_def` |
  | (d) the isometry `ℍ ≃ᵢ UpperHalfSpace ℝ` | (b), (c), `ofRiemannianMetric`, `riemannianEDist_eq` |
  | (e) the curvature transport | (c), `hasConstantSectionalCurvature_iff`, `UpperHalfSpace.hasConstantSectionalCurvature` |
  | (f) completeness | (b), `ProperSpace ℍ` |

## Previous findings

- **R01 (r7) — not repaired.** The head is unchanged. `Suggested.lean` 50–58, 151–153, import 7, docstring 17–19 and README 166–170 read as before. Carried as R01.

## Verified sound

**Gate and supply** (rerun on this head):

```
gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2316 edges, 0 problem(s)
```

- The depcheck shows no UPWARD, CYCLE or moved line. FuchsianOrbifolds is line 49 of the order; TeichmullerGeometry (285) and ArithmeticFuchsianGroups (284) consume it, and it consumes neither.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean checks.**

- **Elaboration.** `lake env lean` on `Suggested.lean` gives `sorry` warnings at lines 73, 83, 97, 109, 117, 128 and 137, and nothing else.
- **Signatures.** I put `#check @` for all ten declarations in one scratch file. The output matches `signatures.md` and the README statements: `riemannHurwitz` has one universe, and no binder is dropped.
- **Padding probe.** I tried each of the 7 theorems with each of `rfl`, `simp`, `norm_num`, `infer_instance`, `positivity`, `omega`, `decide`, `simp_all` and `aesop`, each followed by `done`. None closes any of them.
- **README names.** I extracted every backticked dotted name from the README, about 190 including the namespace-relative ones, and `#check`ed them at the pins. All resolve.
- **Instance probes.**
  - Found: `IsIsometricSMul`, `ContinuousSMul` and `FaithfulSMul` for `PSL(2, ℝ)` on `ℍ`; `IsIsometricSMul SL(2, ℝ) ℍ`; `ProperSpace ℍ`; `ProperlyDiscontinuousSMul Γ ℍ` for discrete `Γ`.
  - Absent: `SecondCountableTopology` for `SL(2,ℝ)` and `PSL(2,ℝ)` (so L0.1 is open, as stated); `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` (so L2.1 is open); any topology on `PGL(2, ℝ)`.

**Library declarations opened at the pins** (file:line):

- **The headline carriers.**
  - `Subgroup.IsCofinite` is `Fuchsian/Covolume.lean`:117. It has the fields `discreteTopology` and `covolume_ne_top`.
  - `instCountableOfDiscreteTopology` is :73.
  - Mathlib's `MeasureTheory.covolume` is `MeasureTheory/Group/FundamentalDomain.lean`:679, and it is `0` when no fundamental domain exists.
  - Tau Ceti's `covolume_pos` is at :358 and `covolume_eq_card_mul_covolume` at :382.
  - `Subgroup.ellipticOrbits` is `Fuchsian/Elliptic/Finite.lean`:74 and needs `DiscreteTopology`.
  - `cardStabilizerOnOrbit` is `GroupAction/Stabilizer/Basic.lean`:270, the stabilizer in `Γ ≤ PSL`, so the effective order.
  - `Subgroup.CuspOrbit` is `Fuchsian/Cusp/Basic.lean`:137.
- **Genus and Riemann–Hurwitz.**
  - `TauCeti.FiniteCWType` is `Classical/FiniteCWType.lean`:74, a `Prop` class in one universe.
  - `TauCeti.eulerChar` is `Cellular/EulerCharacteristic/FiniteCWType.lean`:123.
  - `FiniteHolomorphicMap` is `RiemannSurface/Degree.lean`:134: holomorphic, nonconstant, with finite fibres. `degree` is :121.
  - `ramificationDegree` is `Ramification.lean`:78.
  - The branched-cover formula is `Branch/EulerCharacteristic.lean`:130, in one universe and with `[FiniteCWType ↥f.branchValuesᶜ]`.
  - `eulerChar_compl_of_finite` is `Puncture.lean`:113 and takes the complement's finite CW type as a hypothesis.
  - `instFiniteCWTypeComplVertexImage` is `Realization/Complement.lean`:132; `Homeomorph.finiteCWType` is `Classical/FiniteCWType.lean`:98; `IsTriangulable.finiteCWType` is `Triangulable/FiniteCWType.lean`:41.
- **Minimal areas and the area formula.**
  - `one_div_forty_two_le_hyperbolic_deficit` and `hyperbolic_deficit_two_three_seven` are `Data/Rat/BranchDeficit.lean`:116 and :196.
  - `SidePairing.covolume_eq_two_pi_mul` is `Polygon/Area.lean`:129.
  - `covolume_psl2zToPSL2RRange` is `LevelOne/Basic.lean`:99.
- **Charts, cusps and the metric.**
  - `stabilizerBallQuotientHomeomorph` is `UpperHalfPlane/Elliptic.lean`:176, with radius `tanh(ε/2)^m` as L1.2 says.
  - `cuspDatum_width_eq_mul` and `cuspDatum_coordinate_eq` are `Cusp/ChangeScaling.lean`:88 and :98. They give `w' = aw` and the factor `exp(2πib/(aw))`.
  - `PoincareMetric.lean` has instances at :49 and :144.
- **Mathlib, upper half-plane.**
  - In `MoebiusAction.lean`: `glAction` :181, `σ` :91, `im_smul_eq_div_normSq` :219, the `PGL` action :267, `J` :380 (`diag(−1, 1)`) and `coe_J_smul` :382.
  - `FaithfulSMul PGL(2, ℝ) ℍ` is `FixedPoints.lean`:208.
  - `IsIsometricSMul SL(2, ℝ) ℍ` is `Metric.lean`:329.
  - `volume_def` is `Measure.lean`:48.

**Cross-roadmap citations resolved.**

- **On main:**
  - ComplexManifolds Milestones 1–6, at 172–296.
  - AlgebraicTopology Stage 6 items 4–5 (Poincaré–Lefschetz; the intersection pairing) and Stage 8 item 7 (see R03).
  - ModularForms: "From TauCetiRoadmap.FuchsianOrbifolds" (285); §10A (1150), whose level-one Check `(1,1,1,1) ↦ 0` matches L6.1; §10B (1173), the analytic-genus comparison; §10D.
  - ComplexKahlerGeometry K7, the `b₁ = 2g` dictionary.
  - Completed/UniversalCovers, Completed/ConformalMapping and AlgebraicCurves.
  - PseudoholomorphicCurveAnalysis cites `RiemannSurface.genus` (194, 1317, 1378).
- **At the open heads:**
  - TeichmullerGeometry (`417bd270`) cites L0.2, L0.3, L1, L2.1, L4.5 and L4a.
  - ArithmeticFuchsianGroups (`5fdb26da`) cites L0, L2, L4.5, L4a, L5.7, `minimum_area_finite_area_orbifold` and `covolume_eq_two_pi_mul_signature`.
  - NoncongruenceModularForms (`5342d2e7`) cites 5.1, 5.3, 5.5–5.6 and 6.4.
  - GroupActionsOnRiemannSurfaces (`bb14724a`) cites L2 items 3–6 and L5 items 1 and 3.
  - AnalyticStableMaps cites L5.1 and L5.3; CongruenceSpectralGap cites L4.5 and L6.1.
  - Every cited id exists with the content claimed.
  - One item is for TeichmullerGeometry's own review, and needs no change here: its README 98 reads L0.2 as a *continuous* `PGL(2,ℝ)` action, and `PGL(2,ℝ)` carries no topology at the pin.

**Ownership** (sibling checkouts and `roadmaps grep`):

- The genus `(2 − χ)/2` with `χ = 2 − 2g` has no second owner. TeichmullerGeometry's `Surface.genus` is the classification genus, and its README 232 keeps the two apart. BelyiMaps' `genusAn` and `riemannHurwitzAn` use an analytic genus and sit in a comment block.
- L2.1's statements and the `π/21` and `π/3` minima have no second owner.
- FuchsianOrbifoldsPartII owns convex cores and limit sets, which this roadmap does not.
- `roadmaps overlaps`: no other pull request changes the folder, and no id is dropped.

**Sources, the seeded sample** (all eight `**Source spine:**` lines). Title checks use the published tables of contents: Forster's author page, the Chicago publisher listing for Katok, and bookseller and library listings for Farkas–Kra, Stillwell, Beardon, Diamond–Shurman and Miranda.

| Line | Layer | Result |
|---|---|---|
| 356 | 0 | Beardon Ch. 7–8 ("Hyperbolic Geometry", "Fuchsian Groups") ✓; Katok §§2.1–2.4 ✓; both Mathlib files exist ✓ |
| 394 | 1 | Farkas–Kra ✗ (R02); Miranda III, which has "Group Actions on Riemann Surfaces" and monodromy ✓ |
| 525 | 2 | Beardon Ch. 9–11 ✓; Katok Ch. 3–4 ✓; Stillwell Ch. 5 "Hyperbolic Surfaces", with §5.5 surfaces from polygons ✓ |
| 569 | 3 | Diamond–Shurman §2.3 "Elliptic points" and §2.4 "Cusps" ✓; Katok and Forster ✗ (R02) |
| 622 | 4 | Katok Ch. 4 ✓; Diamond–Shurman §§2.4–2.5 ✓; Forster ✗ (R02) |
| 731 | 5 | Forster §17 "The Serre Duality Theorem" and §19 "Harmonic Differential Forms" ✓ by title (contents uncertified); Katok §4.3 "The signature of a Fuchsian group" ✓; Farkas–Kra ✗ (R02) |
| 816 | 4a | Martin2013 lines 212–227 (printed p. 6) ✓: Theorem 2.1 gives `μ(2) = π/21` over all lattices of `Isom⁺(H²)`, attained only by `(2,3,7)`; Theorem 2.2 gives the area formula. These support `pi_div_twentyOne_le_covolume`, its equality case and `covolume_eq_two_pi_mul_signature` as written. |
| 853 | 6 | Diamond–Shurman §§2.3–2.5 ✓; `JInputs.lean` exists ✓ |

**Adversarial table** (computed this round):

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `genus` | `χ = 2, 0, −2, 1, 3`; wrong models `2 − χ` and `(−χ/2).toNat` | `0, 1, 2, 0, 0`. Torus: `2` and `0` from the wrong models, vs `1`. Genus-2: `4` and `1`, vs `2`. | Discriminated by Checks 640–648 | none |
| `eulerChar_eq_two_sub_two_mul_genus` | `P¹`; torus; genus-2 surface; `RP²`; `S²⊔S²`; `ℂ` | `2=2`, `0=0`, `−2=−2`. `RP²`: `1` vs `2`; it is not a complex manifold. `S²⊔S²`: `4` vs `2`, excluded by `ConnectedSpace`. `ℂ`: `1` vs `2`, excluded by `CompactSpace`. | Holds | none |
| `riemannHurwitz` | `id_{P¹}`; `z²`; `℘`; unramified 3→2; `X(2)→X(1)`; `jSphere`; sign-flipped model | `−2 = 1·(−2)+0`; `−2 = 2·(−2)+2`; `0 = 2·(−2)+4`; `4 = 2·2+0`; `−2 = 6·(−2)+10`; `−2 = 1·(−2)+0`. The flipped sign gives `−2 vs −6`. A constant map is excluded by `nonconstant`. | Holds | R03 (route) |
| Punctured finite CW type (R03) | `P¹ \ {0,∞}`; Weierstrass `P¹` minus 4 points | Stage 8.7 gives only locally finite CW type. With the repair: `χ = 2−2 = 0` and `2−4 = −2`; upstairs `0−4 = −4 = 2·(−2)`. | The input is unowned as written | R03 |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`; `Γ₀(2)`; `Γ(2)`; commutator subgroup; `(2,3,7)`; genus-2 surface group; `⊥` | `π/3`, `π`, `2π`, `2π`, `π/21`, `4π`. `⊥` has covolume `∞` and is not cofinite. With `SL` stabilizer orders, `PSL(2,ℤ)` gives `7π/6 ≠ π/3`. | Holds; the `PSL` convention is needed | none |
| Polygon cell count (R04) | `PSL(2,ℤ)` `(3,1,1,1)` and `(4,0,2,1)`; `Γ(2)` `(4,0,0,3)`; commutator `(4,0,0,1)`; octagon `(8,0,1,0)` | `χ = 2, 2, 2, 0, −2`. Pinned area brackets: `1/6`, `1/6`, `1`, `1`, `2`. These equal `2g−2+Σ+c` = `1/6, 1/6, 1, 1, 2`. | The identity holds; "polygon genus" is undefined | R04 |
| `pi_div_twentyOne_le_covolume` | `(2,3,7)`; `(2,3,8)`; `(2,4,5)`; `(0;2,2,2,3)`; `PSL(2,ℤ)` | `π/21 ≤` each of `π/21, π/12, π/10, π/3, π/3` | Holds, tight | none |
| L4a cusp replacement | `(0;2,3;1)` with `m = 7, 6` | `1/6 − 1/7 = 1/42 > 0`; for `m = 6` the deficit is `0`, so `m > c/δ = 6` is needed | Holds | none |
| L4a case analysis | `(2,2,m)`; `(2,3,m)`; `(2,4,m)`; `(2,5,5)`; `(3,3,4)`; `r = 4`; `r ≥ 5` | `−1/m`; `1/6−1/m`; `1/4−1/m ≥ 1/20`; `1/10`; `1/12`; `≥ 1/6`; `≥ 1/2` | Holds | none |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)`, `(0;2,2,2,3)` | Left/right: T/T, F/F, F/F, F/F. At `m = 0, 1`: `0 = 0`. | Both directions | none |
| `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `Γ(2)`; `(2,3,7)` without a cusp | `π/3 ≤ π/3, π/2, π, 2π`; `π/21 < π/3` | The cusp hypothesis is needed | R05 (title) |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `(1;−;1)` | T/T, F/F, F/F, F/F | Both directions | none |
| L4a item 2 table | `g≥2`, `g=1`, `c≥3`, `c=2`, `c=1` with `r ≤ 1`, `r = 2`, `r ≥ 3` | `δ ≥ 3, 1, 1`; `0` or `≥ 1/2`; `< 0`; `0, 1/6, ≥ 1/4`; `≥ 1/2` | Holds | none |
| L0.1 | `#synth` at the pin; discrete topology | Not found for `SL` or `PSL`. With the discrete topology, `PSL(2,ℝ)` is uncountable, so not second countable. | Open target; route correct | R06 |
| L0.2 | `J(1+i)`; model without conjugation; `dist(1+i,2+i)` | `−1+i` vs `−1−i ∉ ℍ`; `2 arsinh(1/2) ≈ 0.9624` on both sides | Holds | R06 |
| L2.1 distance comparison | `(i, 2i)`, `(i, 1+i)`, `(z, z)`; straight-segment model | `log 2 = 2 arsinh(1/(2√2)) ≈ 0.6931`; `arcosh(3/2) = 2 arsinh(1/2) ≈ 0.9624 < 1`; `0` | Holds; statable and open | R06, R07 |
| L2.1 half-space isometry | Vector `1` at `2i`; disc normalisation; `(x, 2y)` | `1/4` vs `1/4`; `1`; `1/16` | Discriminated | R07 |
| L5.6 Fuchsian RH | `Γ(2) ≤ PSL(2,ℤ)` | `R = 3+3+4 = 10`; `χ_orb`: `−1 = 6·(−1/6)` | Holds | R03 |
| L1.2 radius, L3.4 scaling | `ε`, `m`; `σ' = aσ+b` | `tanh(ε/2)^m`, the pinned value; `w' = aw` and `q' = e^{2πib/(aw)}q`, pinned | Matches the pins | none |
| Compatibility block | 9 names; consumers on main and at the open heads | 0 consumers apart from the stale branch copy | Unjustified | R01 |

## Not verifiable

- **Textbook statements** (beyond section titles): Beardon, Siegel, Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell are recorded as uncertified and are cited by locator.
- **Katok and Miranda** are cited but have no entry in the package's `sources.toml`; earlier rounds found no legal copy through the sources service. This review edits no manifest. Their section titles were checked against the published contents only.
- **Serre's Chapter VII** contents were not fetched.
- **Ownership against open pull requests** was checked only through the sibling checkouts this brief lists and `roadmaps grep`.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the hypothesis names the cusp count with a lower-case letter, while the area formula uses an upper-case one; it should use one letter throughout; affects nothing.
- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the conclusion begins with a doubled definite article; it should read "Then the hyperbolic area"; affects nothing.
