# Review of FuchsianOrbifolds (pull request #1168 at 4b6bb3d)

**Verdict:** needs changes

This is a full review of the head after the arithmetic layers moved to ArithmeticFuchsianGroups. The gate fails on four checks: `sorry-data=6`, `dropped=38`, `blob=8` and `statement-hygiene=4`. Each failure is a finding below.

The Tau Ceti pin (`2fd255d`) already proves most of what `Suggested.lean` re-declares. That includes compactness of the compactified quotient of a cofinite group, the branched-cover Euler-characteristic formula, triangle groups and the `1/42` deficit bound. Most repairs are therefore deletions and citations. The others are restoring main's supplier for genus and stating the one headline that is missing.

## Previous findings

- **R01 (re-plan; Layers 4a, 7, 8, 9): partly repaired.** `## Layer 7`, `## Layer 8`, `## Layer 9` and the provenance section are gone, and the README is down to 555 lines. Layer 4a stays (lines 365–403). R06 below covers what it still restates from the library. Once that is removed, what Layer 4a still owns (the equality case and the minimum for groups with cusps) follows directly from Layer 4 item 5's area formula, which main's plan already owns. I do not hold the rest of R01.
- **R02 (cycle with TeichmullerGeometry): repaired.** Lines 29–31 now say "no layer here consumes any layer of it". No README line cites TeichmullerGeometry as a supplier.
- **R03 (upward suppliers): partly repaired.** AdelicAlgebraicGroups, ZerosOfLFunctions, NoncompactQuantumSymmetry and QuaternionicModularForms are gone. SurfaceTopology and PlanarTopology are still cited (R02 below).
- **R04 (`set_option`): repaired.** The gate reports `set_option=0`.
- **R05 (sorried data): not repaired.** See R01 below.
- **R06 (library duplicates): not repaired.** See R03 below.
- **R07 (headlines): partly repaired.** Compactness for cofinite groups is now proved at the pin, so it no longer needs a statement. The `π/21` bound is still absent and the docstring still names no unstatable headline (R05 below).
- **R08 (padding): partly repaired.** The order-32 block is gone; the rest remains (R08 below).
- **R09 (imports, library namespaces): partly repaired.** The header is now `import Mathlib` plus two `TauCeti.*` modules (`imports=0`, `mathlib-subimports=0`). The `TauCeti.RiemannSurface` block remains (R10).
- **R10 (blob links, TeX, provenance): partly repaired.** Blob links are down from 18 to 8 and the provenance section is gone. `\begin{pmatrix}` is now at line 245 (R11).
- **R11 (shape, sources): partly repaired.** The arithmetic references are moot. The new Layer 4a has no locator (R06, R12).
- **R12 (computational certificates): repaired.** They left with Layer 7.
- **R13 (backticked own names): partly repaired.** Seven of the eight are gone. `minimum_area_finite_area_orbifold` (line 387) is still not declared (R05).
- **R14 (local-volume wording): moot.** Layer 7 left.

## R01 (P1) — Sorried data in `Suggested.lean`; Riemann–Hurwitz is stated through it

- **Location.** `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
  - Lines 32, 65, 309, 314, 367 and 373 have `:= by sorry` bodies: `pslAction`, `pslBoundaryAction`, `compactifiedTopologicalSpace`, `compactifiedChartedSpace`, `SurfaceInvariants.surfaceEulerCharacteristic` and `SurfaceInvariants.genus`.
  - Everything that mentions them is affected too, including `riemannHurwitz` (lines 420 and 452) and the `RiemannSurface` exports (line 470).
- **Claim.**
  - No `def` or `instance` may have a `sorry` body, and nothing may mention one.
  - The two surface invariants are independent opaque constants. The identity at line 378 and the formula at line 414 therefore constrain nothing, and the Riemann–Hurwitz headline is stated through stand-ins.
- **Witness.** Take the model `χ := 2`, `g := 0`. It satisfies line 379. Line 415 then reads `2 = 2·2 − 0` for an unramified double cover of a genus-2 curve by a genus-3 curve, which is false. The gate reports `sorry-data=6`.
- **Repair** (tested in a scratch copy).
  - Delete the six sorried declarations.
  - State the surface invariants on the native carriers:
    - `genus X := ((2 - TauCeti.eulerChar X) / 2).toNat`, under `[TauCeti.FiniteCWType X]` (a definition with a real body);
    - the theorem `TauCeti.FiniteCWType X` for compact connected Riemann surfaces;
    - the theorem `TauCeti.eulerChar X = 2 - 2 * genus X`;
    - `riemannHurwitz`, with `[FiniteCWType X] [FiniteCWType Y]`.
  - `ModularForms/Suggested.lean` on main imports this module. To keep it building:
    - keep `abbrev CompactifiedQuotient Γ := Γ.CompactifiedQuotient`;
    - keep `compactifiedChartedSpace … := inferInstance`;
    - export `genus` and `riemannHurwitz` into `RiemannSurface`.
  - Tested result: the scratch copy elaborates with four `sorry` warnings and no sorried data. All eleven `#check`s at lines 89–99 of main's `ModularForms/Suggested.lean` resolve against it.

## R02 (P2) — Layer 5's suppliers are SurfaceTopology, PlanarTopology and a GeometricTopology adapter that main lacks

- **Location.**
  - README lines 60–66, 90–115, 137–149, 408–451 and 493.
  - `Suggested.lean` lines 338–356, 366, 372, 377, 394, 400 and 410–413.
  - Line 60 says: "SurfaceTopology Layer 8 owns compact-surface classification, genus, and topological Euler characteristic; SurfaceTopology Layer 5 owns the generic topological branched-cover Riemann–Hurwitz theorem."
- **Claim.**
  - **SurfaceTopology and PlanarTopology.**
    - Both are on the list of roadmaps never to cite as suppliers. They exist only in an open new-roadmap pull request and appear on no line of the merge order, so an on-main roadmap would consume unmerged work.
    - The gate flags them under `dropped=38`. The depcheck prints nothing for them because neither name is in the order.
  - **GeometricTopology Layer 1.** Lines 94–95 say "GeometricTopology Layer 1 supplies the dimension-two smooth/finite-CW comparison adapter". Main's Layer 1 (its lines 177–288) contains no CW or surface comparison. That material is §1.7 of GeometricTopology's open revision.
  - **Regression from main.** Main's Layer 5 took genus from AlgebraicTopology's finite-CW Euler characteristic, which is on main.
- **Witness.**
  - `ORDER.txt` has no SurfaceTopology or PlanarTopology line.
  - `grep -i 'finite.\?CW'` on main's `GeometricTopology/README.md` returns nothing.
- **Repair.** Restore main's supply chain, now largely at the pin:
  - **Euler characteristic.** Use `TauCeti.eulerChar` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` line 123).
  - **Branched-cover formula.** Use `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (`TauCeti/Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean` line 130).
  - **Finite CW type.** "Compact manifolds have finite CW type" is owned on main by AlgebraicTopology: see its `## Ownership and dependencies` and `compactManifoldFiniteCWType` in its `Suggested.lean`, line 1155.
  - **What Layer 5 owns.** Layer 5 states, with a locator, that a compact connected Riemann surface has `χ = 2 − 2g` with `g ∈ ℕ`. Main's Layer 5 item 1 owned this, and no roadmap on main states it.
  - **Other references.** Point lines 112–115 (ComplexKahlerGeometry K7, ModularForms 10B(v)) at this genus.
  - **Remove the old citations.** Delete every SurfaceTopology, PlanarTopology and GeometricTopology Layer 1 citation.

## R03 (P2) — `Suggested.lean` re-declares what the pinned Tau Ceti already has

- **Location.** `Suggested.lean` lines 27–322 and 414–418.
- **Claim.** Each object in the left column of the table below already exists at the pin.
- **Witness.** Every name in the right column elaborates from `import Mathlib` plus the named modules (scratch probe; output under *Verified sound*).

| This file | At the Tau Ceti pin |
|---|---|
| `pslAction`, `pslAction_mk`, `pslAction_injective`, `pslAction_mdifferentiable`, `continuous_pslAction` (32–51) | `UpperHalfPlane.instMulActionPSL2`, `pslMk_smul`, `FaithfulSMul PSL(2, ℝ) ℍ` (`Analysis/Complex/UpperHalfPlane/PSL/Action.lean` 136, 144, 180); `ContinuousSMul` (`UpperHalfPlane/ProperAction.lean` 33); `instContMDiffConstSMulPSL2` (`UpperHalfPlane/PSL/Manifold.lean` 38) |
| `pslBoundaryAction`, `pslBoundaryAction_mk` (65–71) | `instMulActionPSL : MulAction PSL(2, K) (OnePoint K)`, `toPGL_smul` (`Topology/Compactification/OnePoint/ProjectiveLine.lean` 196, 250) |
| `properlyDiscontinuous_pslSubgroup` (89) | instance at `Analysis/Complex/Fuchsian/ProperAction.lean` 33 |
| `pslFreeLocus`, `descendInvariant` (84, 124) | `TauCeti.freeLocus` (`Topology/Algebra/GroupAction/FreeLocus.lean` 36); `Subgroup.existsUnique_mdifferentiable_quotientMk` (`Fuchsian/Descent.lean` 138) |
| `IsCuspPoint`, `BoundaryOrbit`, `IsCuspOrbit`, `isCuspOrbit_quotientMk`, `CuspOrbit` (146–172) | `Subgroup.IsCuspPoint`, `BoundaryOrbit`, `IsCuspOrbit`, `isCuspOrbit_mk_iff`, `CuspOrbit` (`Fuchsian/Cusp/Basic.lean` 54, 117, 122, 127, 137) |
| `CuspDatum`, `mem_stabilizer_iff`, `conjugates_stabilizer_iff` (177–207) | `Subgroup.CuspDatum`, `mem_stabilizer_iff`, `mem_stabilizer_iff_conj` (`Fuchsian/Cusp/Datum.lean` 169, 233, 266) |
| `CuspDatum.coordinate`, `coordinate_eq_of_mem_stabilizer`, `width_change`, `coordinate_change` (223–252) | `TauCeti.Subgroup.CuspDatum.coordinate`, `coordinate_smul` (`Fuchsian/Cusp/Coordinate.lean` 53, 89); `TauCeti.cuspDatum_width_eq_mul`, `TauCeti.cuspDatum_coordinate_eq` (`Fuchsian/Cusp/ChangeScaling.lean` 88, 98) |
| `TriangleOrder`, `TriangleOrder.reciprocal` (257–264) | `TauCeti.TriangleOrder`, `reciprocal` (`Fuchsian/TriangleOrder/Basic.lean` 46, 57) |
| `coarseOrbitRel`, `CoarseQuotient`, `CompactifiedQuotient`, `equivSum`, topology, charts, `compactified_isManifold` (283–322) | `Subgroup.CompactifiedQuotient`, `equivSum` (`Fuchsian/Compactification/Basic.lean` 75, 86), its topology (193), `instChartedSpace` and `instIsManifold` at `ω` (`Compactification/Manifold.lean` 120, 260) |
| `surfaceEulerCharacteristic`, `branchedCover_eulerCharacteristic` (367, 414) | `TauCeti.eulerChar` and the branched-cover theorem of R02 |

- **Repair.**
  - Delete the left column, keeping only R01's two consumer abbreviations.
  - In the README's Ownership section, cite the right column by name and file.
  - The local `width_change` needs `hgen` and `0 < a`. The library form proves the same conclusion without either (`TauCeti.cuspDatum_generator_eq`, `ChangeScaling.lean` 41), so take that form.

## R04 (P2) — Layer 0 item 2 now plans Mathlib's `GL(2,ℝ)`/`PGL(2,ℝ)` action as new construction

- **Location.** README lines 244–252: "Construct the projective action of `PGL₂(ℝ)=GL₂(ℝ)/ℝˣ` on `UpperHalfPlane` from matrix representatives … for negative determinant use `z↦(a\bar z+b)/(c\bar z+d)`". The same appears at lines 23–25 and 293.
- **Claim.**
  - Mathlib at the pin already has this action, its descent to `PGL` and its faithfulness.
  - Main's item 2 read "restrict Mathlib's existing projective Möbius action", and STATUS records Layer 0 as done.
  - This head re-plans a done item into a duplicate of Mathlib.
- **Witness.**
  - The action is `UpperHalfPlane.glAction` (`Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` 181).
  - `σ g` is conjugation when `det g < 0` (line 91).
  - `MulAction PGL(2, ℝ) ℍ` is at line 267, and `FaithfulSMul PGL(2, ℝ) ℍ` at `FixedPoints.lean` 208.
  - For `diag(1,−1)` and `z = 1+i`, both formulas give `−1+i`.
- **Repair.**
  - Restore main's wording for item 2, citing these declarations and Tau Ceti's `toPGL_smul` (`UpperHalfPlane/PSL/Action.lean` 170).
  - In L2.1, keep as owned only the isometry of the negative-determinant elements. Mathlib has `IsIsometricSMul SL(2, ℝ) ℍ` (`Metric.lean` 329) and nothing for `GL`.
  - The id "Layer 0 item 2", which TeichmullerGeometry and ArithmeticFuchsianGroups cite, keeps resolving.

## R05 (P2) — A statable headline is absent, and the module docstring is stale

- **Location.**
  - `Suggested.lean` lines 5–16.
  - README completion criterion 9 (lines 71–72).
  - README line 387, which backticks `minimum_area_finite_area_orbifold`.
- **Claim.**
  - **Absent headline.** Siegel's lower bound `π/21` and the minimum `π/3` for groups with cusps can be stated at the pins on `Subgroup.IsCofinite`, `MeasureTheory.covolume` and `Subgroup.CuspOrbit`. Neither is stated.
  - **Undeclared name.** `minimum_area_finite_area_orbifold` is a backticked own name, and ArithmeticFuchsianGroups cites it (its lines 70 and 614). `Suggested.lean` does not declare it.
  - **Stale docstring.**
    - It says elliptic charts and the compactification atlas "remain roadmap targets". Both are at the pin: `Subgroup.instIsManifoldOrbitRelQuotient` (`Fuchsian/CoarseQuotient.lean` 130) and `instIsManifold` (`Compactification/Manifold.lean` 260).
    - It names no headline as unstatable.
- **Witness.** In the scratch probe, both statements elaborate with only `sorry` warnings:
  - `ENNReal.ofReal (π / 21) ≤ MeasureTheory.covolume Γ ℍ` for `Γ.IsCofinite`;
  - the `π / 3` form with `[Nonempty Γ.CuspOrbit]`.
- **Repair.**
  - State both bounds, the second under the name `minimum_area_finite_area_orbifold`.
  - State the equality case on `Subgroup.ellipticOrbits`, `TauCeti.cardStabilizerOnOrbit` and `Subgroup.CuspOrbit`.
  - Rewrite the docstring:
    - name the headlines already at the pin: compactness, `TauCeti.ModularGroup.jBiholomorph` and `TriangleOrder.IsHyperbolic.exists_isCofinite_triangleGroup` (`Fuchsian/TriangleOrder/Group.lean` 469);
    - say whether the general converse Poincaré theorem is stated or what it lacks.

## R06 (P2) — Layer 4a restates the pinned `1/42` bound as owned proof and gives no locator

- **Location.** README lines 373–383 ("Proof target: … minimize the positive gap") and 400–401 ("Own the integer-signature minimization proof in these cases").
- **Claim.**
  - The compact inequality is already `TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`TauCeti/Data/Rat/BranchDeficit.lean` 116). It says a positive `2γ − 2 + Σ(1 − 1/eᵢ)` with all `eᵢ ≥ 2` is at least `1/42`.
  - The value at `(2,3,7)` is `TauCeti.hyperbolic_deficit_two_three_seven` (line 196).
  - TeichmullerGeometry already cites both (its line 29 and §10.1).
  - Layer 4a has no source spine.
- **Witness.** The lemma's bracket is Layer 4a's bracket, and both give `1/42` at `(0;2,3,7)`.
- **Repair.**
  - Cite the two Tau Ceti lemmas for the inequality.
  - Keep as owned:
    - the equality case, that only `(0;2,3,7)` attains the bound;
    - the table for groups with cusps, since the lemma has no cusp term.
  - Add a locator: Siegel, *Some remarks on discontinuous groups*, Ann. of Math. 46 (1945), plus the textbook theorem number.
  - Keep the heading "Layer 4a", because TeichmullerGeometry and ArithmeticFuchsianGroups cite it.

## R07 (P3) — Renumbering Layer 5 breaks GroupActionsOnRiemannSurfaces' citations

- **Location.** README lines 406–457. Main's items 1–6 become items 1–5.
- **Claim.** On main, Layer 5 item 3 is the branched-cover formula and item 6 is Fuchsian Riemann–Hurwitz. At this head, item 3 is descent of invariant functions and there is no item 6.
- **Witness.** GroupActionsOnRiemannSurfaces at its head cites:
  - "Fuchsian orbifolds 5.3's `χ(X) = deg π · χ(X/G) − ramificationDegree π`" (its line 627);
  - "*Needs:* … FuchsianOrbifolds Layer 5 item 3" (633);
  - "5.6's Fuchsian Riemann–Hurwitz" (708).
- **Repair.** Either keep main's numbering, or add one old → new line per moved item:
  - 5.2 → the native Tau Ceti modules;
  - 5.3 → 5.2;
  - 5.4 → 5.3;
  - 5.5 and 5.6 → 5.4.

## R08 (P3) — Padding in `Suggested.lean`

- **Location.**
  - Proved by `rfl`: lines 59–61, 79–81 and 130–134.
  - Lines 214–216, 219–220, 272–274 and 276–278.
  - The `example`s at lines 95, 101, 105 and 111.
- **Witness.** In the scratch probe, each of these closes the statement at the given line:
  - `differentiable_pow m` closes line 272;
  - `pow_eq_zero_iff hm.ne'` closes line 276;
  - `Complex.exp_ne_zero _` closes line 219;
  - a single `simp [cuspCoordinate, UpperHalfPlane.coe_vadd, add_div, mul_add, Complex.exp_add, hw.ne', Complex.exp_two_pi_mul_I, mul_div_assoc]` closes line 214.

  The four `example`s restate Mathlib or Tau Ceti instances.
- **Repair.** Delete them from `Suggested.lean`; the README keeps the statements.

## R09 (P3) — `letI` in signatures

- **Location.** `Suggested.lean` lines 60, 80, 90 and 320 (gate `statement-hygiene=4`).
- **Repair.**
  - These disappear with R03, since the Tau Ceti instances are global.
  - Otherwise, use a named instance binder, as the gate says.

## R10 (P3) — Declarations into the library's namespace `TauCeti.RiemannSurface`

- **Location.** `Suggested.lean` lines 432–458; README lines 99–100 and 411–413.
- **Claim.**
  - The file declares `TauCeti.RiemannSurface.surfaceEulerCharacteristic`, `genus` and `riemannHurwitz`. These names sit in the namespace of `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean`, which the library itself needs when it implements these targets.
  - Nothing consumes them: main's `ModularForms/Suggested.lean` checks only root `RiemannSurface.*` (its lines 91–99).
- **Repair.**
  - Delete the block.
  - Export from `TauCetiRoadmap.FuchsianOrbifolds` into `RiemannSurface`, as tested under R01.
  - Reword README lines 99–100 and 413.

## R11 (P3) — Blob links, LaTeX, typos and a process clause

- **Location.**
  - Blob links (gate `blob=8`): lines 60, 63, 83, 87, 94, 95, 112 and 288.
  - Lines 245–246 contain `A=\begin{pmatrix}a&b\c&d\end{pmatrix}` (malformed: `\c` where a row break was meant) and `\bar z`.
  - Typos: "Layers5 and8" (90), "Fuchs Layer 5" (98), "Layer0" (293), "Layers5/6/8" (409).
  - Line 83: "…at an older dependency pin; these are written supplier targets, not a claim that all declarations are implemented."
- **Repair.**
  - Replace each blob link with the roadmap and section name.
  - Write the matrix as `A = [[a, b], [c, d]]` and use `conj z`.
  - Fix the spacing.
  - Delete the clause at line 83.

## R12 (P3) — New and rewritten items carry no locator and no Checks

- **Location.** Layer 0 item 2 (244–252), L2.1 (288–293), Layer 4a (365–403) and Layer 5 items 1, 2 and 5 (408–457).
- **Claim.** Every theorem needs a locator, every definition three Checks, and every target a `*Needs:*` line. The README has none of these.
- **Witness.** `grep -c -E '\*\*Checks|\*Needs:\*'` on the README returns `0`.
- **Repair.**
  - Add locators for the new claims: the area-formula minimum (R06) and the local normal form of a finite holomorphic map (Forster §17, which Tau Ceti's `Branch/EulerCharacteristic.lean` already cites).
  - Add Checks. The computed rows below can serve:
    - `i` and `2i` are at distance `log 2`;
    - `diag(1,−1)` acts by `z ↦ −z̄`;
    - `(0;2,3;1)` has area `π/3`;
    - `σ' = 2σ+1` sends `q` to `−q`.

## Verified sound

**Gate and scope.**

- I reran the gate at this head:

  ```
  gate FuchsianOrbifolds: set_option=0 blob=8 latex=0 tex=0 prnum=0 sorry-data=6 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=4 forbidden=0 dropped=38 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  ```

  The worker's targeted build of this module and `ModularForms.Suggested` reported `build=0`.
- Depcheck, rerun:

  ```
  depcheck: 239 roadmaps, 2354 edges, 0 problem(s)
  ```

  It does not parse SurfaceTopology or PlanarTopology because neither is in the order (R02).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FuchsianOrbifolds'` is empty.
- The folder holds `README.md` and `Suggested.lean`, plus the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.

**Elaboration and signatures.**

- `lake env lean` on `Suggested.lean` exits 0 in 8.5 s, with 24 `declaration uses 'sorry'` warnings and no other diagnostic.
- I read the 61 elaborated types in `signatures.md`. No binder is dropped.
- Each of the six surface declarations (`SurfaceInvariants.*`, `surfaceEulerCharacteristic`, `genus`, the identity, `branchedCover_eulerCharacteristic`, `riemannHurwitz`) carries all six instance binders: `TopologicalSpace`, `ChartedSpace ℂ`, `T2Space`, `CompactSpace`, `ConnectedSpace` and `IsManifold 𝓘(ℂ, ℂ) 1`.
- `riemannHurwitz` elaborates to `2 * ↑(genus X) − 2 = ↑(degree ↑f) * (2 * ↑(genus Y) − 2) + ↑(ramificationDegree ↑f)`, which is README Layer 5's formula.

**Library declarations opened at the pins (about 40).** All were confirmed by `#check` from `import Mathlib` plus individual modules.

- *Mathlib:*
  - `UpperHalfPlane.glAction`, `σ`, the `PGL(2, ℝ)` action (`MoebiusAction.lean` 181, 91, 267);
  - `FaithfulSMul PGL(2, ℝ) ℍ` (`FixedPoints.lean` 208);
  - `UpperHalfPlane.dist_eq` (`Metric.lean` 43) and `IsIsometricSMul SL(2, ℝ) ℍ` (329);
  - `volume_def`, density `(1/y)²` (`Measure.lean` 48);
  - `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ` (88).
- *Tau Ceti:*
  - every right-hand entry of R03;
  - `Subgroup.IsCofinite.compactSpace_compactifiedQuotient` (`Fuchsian/DirichletDomain/Cofinite.lean` 163);
  - `IsCofinite.finite_cuspOrbit` (`Fuchsian/Cusp/Finite.lean` 241);
  - `localMultiplicity_quotientMk` (`Fuchsian/Ramification.lean` 69);
  - `TauCeti.ModularGroup.eulerChar_compactifiedQuotient`, value 2, and `covolume_psl2zToPSL2RRange_eq_two_pi_mul`, value `π/3` (`Fuchsian/LevelOne/Signature.lean`);
  - `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.covolume_eq_two_pi_mul` (`Fuchsian/Polygon/Area.lean` 129);
  - `TauCeti.IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean` 41);
  - `TauCeti.UpperHalfSpace`, which is the positive-height subtype of `WithLp 2 (E × ℝ)` with metric `(‖dx‖² + dt²)/t²` (`Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean` 91). This matches L2.1's literal coordinates. No `UpperHalfPlane ↔ UpperHalfSpace` comparison exists at the pin, so L2.1's comparison is genuinely owned here.
  - the native Riemann-surface API cited by Layer 5:
    - `FiniteHolomorphicMap` (`Degree.lean` 134), `degree` (121), `degree_eq_fiber_sum` (386), `degree_comp` (435);
    - `biholomorphOfDegreeEqOne` (443) and `biholomorphOfDegreeEqOne_toFun` (474);
    - `ramificationDegree` (`Ramification.lean` 78) and `card_fiber_add_sum_localMultiplicity_sub_one` (173);
    - `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex` (`AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean` 159).
  - All are present.

**Repair test.**

- I built a scratch copy with the R01 and R10 repairs. It elaborates with four `sorry` warnings.
- With it, the eleven `#check`s of main's `ModularForms/Suggested.lean` (lines 89–99) resolve: `CompactifiedQuotient`, `compactifiedChartedSpace`, `RiemannSurface.FiniteHolomorphicMap`, `genus`, `localMultiplicity`, `degree`, `degree_comp`, `divisorPullback`, `biholomorphOfDegreeEqOne`, `biholomorphOfDegreeEqOne_toFun` and `riemannHurwitz`.

**Cross-roadmap citations resolved.**

*On main:*

- RiemannianGeometry R4 item 7 (consumes `Hyperbolic/UpperHalfSpace.lean`; pins `(|dx|²+dy²)/y²`).
- AlgebraicTopology Stage 4 item 7 (`simplicialRealizationCW`, `standardCellBallToOrderedSimplex`, lines 817–820).
- ComplexManifolds Milestones 3–6 (headings at 221, 238, 267, 296).
- ComplexKahlerGeometry K7 (1405).
- ModularForms 10B (v) and (vi) (1095, 1108).

*Not resolved (R02):* GeometricTopology Layer 1's adapter, SurfaceTopology and PlanarTopology.

*Downstream, at the heads of their pull requests:*

- TeichmullerGeometry consumes Layer 0 item 2, Layer 1, L2.1, Layer 4 item 5 and Layer 4a (its line 26). Its §10.1 consumes only 4a's equality case.
- ArithmeticFuchsianGroups consumes Layers 0, 2, 4.5, 4a, 5.4 and 5.5 (its lines 69–70, 613–614, 1012, 1034, 1076, 1107).
- Every one of these ids exists at this head, except the undeclared `minimum_area_finite_area_orbifold` (R05).
- The citation lead `RiemannSurface.riemannHurwitz` resolves to the export at `Suggested.lean` 470.

**Ownership and overlaps.**

- `overlaps.md` lists no other pull request that changes this folder and no dropped ids. My own check found R07.
- FuchsianOrbifoldsPartII (its line 7) says the base roadmap stops at Layers 0–6. It owns limit sets, convex cores and bordered signatures, none of which this head plans.
- The `π/21` equality case has one owner, Layer 4a: TeichmullerGeometry §10.1 cites it.
- Genus of compact complex curves is declared only in this folder:
  - BelyiMaps' `genus` is for permutation triples;
  - NoncongruenceModularForms' is for modular triples;
  - AdelicImagesAndModularCurves' is for open subgroups;
  - TeichmullerGeometry's is for `StandardSurface`.
- I did not check ownership against KleinianGroups, whose files this brief does not provide.

**Headline theorems** (README completion criteria 1–9):

1. **Effective action, proper discontinuity, finite stabilizers.** At the pins (R03, R04).
2. **Coarse quotient with charts `z ↦ z^m`.** At the pin.
3. **Finitely many cusp orbits.** At the pin.
4. **Compact, Hausdorff, second-countable compactification.** At the pin.
5. **Descent of invariant functions.** At the pin.
6. **Riemann–Hurwitz and the genus bridge.**
   - The Euler form is at the pin, given finite CW type.
   - The genus form is statable (repair test) but is stated only through sorried data (R01).
7. **Poincaré's theorem and triangle groups.**
   - Triangle groups and the presentation for parabolic cycles are at the pin (`exists_isCofinite_triangleGroup`; `relatorQuotientTo_bijective_of_isParabolic`, `Polygon/Poincare.lean` 102).
   - The general converse is not stated, and the docstring is silent on it (R05).
8. **`X(1) ≃ P¹`.** At the pin.
9. **The minima `π/21` and `π/3`.** Statable but absent (R05).

**Padding probe.** Four one-tactic closes (R08). The other sorried theorems are duplicates (R03) rather than one-tactic consequences.

**Adversarial table.**

| Statement | Instances | Values computed (both sides) | Result |
|---|---|---|---|
| L4a: compact area `≥ π/21`, equality only at `(0;2,3,7)` | `(2;)`, `(1;2)`, `(0;2,3,7)`, `(0;2,3,8)`, `(0;2,4,5)`, `(0;2,5,5)`, `(0;3,3,4)`, `(0;2,2,2,3)`, `(0;2,2,2,2,2)`, `(0;2,3,6)` | brackets `2, 1/2, 1/42, 1/24, 1/20, 1/10, 1/12, 1/6, 1/2, 0`; areas `4π, π, π/21, π/12, π/10, π/5, π/6, π/3, π, 0` | holds; minimum unique at `(0;2,3,7)`; `(2,3,6)` excluded by positivity |
| `TauCeti.one_div_forty_two_le_hyperbolic_deficit` vs L4a | `γ=0, e={2,3,7}`; `γ=1, e={2}` | lemma `1/42 ≥ 1/42`, `1/2 ≥ 1/42`; L4a the same brackets | same statement (R06) |
| L4a table for groups with cusps, minimum `π/3` | `(0;2,3;1)`, `(0;2,4;1)`, `(0;3,3;1)`, `(0;2,2;1)`, `(0;2;1)`, `(0;;1)`, `(0;2;2)`, `(0;;2)`, `(0;;3)`, `(1;;1)` | brackets `1/6, 1/4, 1/3, 0, −1/2, −1, 1/2, 0, 1, 1`; hyperbolic areas `π/3, π/2, 2π/3, —, —, —, π, —, 2π, 2π` | holds; `PSL₂(ℤ)` attains `π/3` = Tau Ceti's `covolume_psl2zToPSL2RRange` value |
| Proposed Siegel headline `π/21 ≤ covolume Γ` under `Γ.IsCofinite` | `Γ = ⊥`; cyclic of order 2; `⟨z ↦ z+1⟩`; `PSL₂(ℤ)` | covolumes `∞, ∞, ∞` (not cofinite: `IsCofinite.covolume_ne_top`); `π/3 ≥ π/21` | degenerate groups excluded; not vacuous |
| L2.1 distance comparison | `z=i, w=2i`; `z=w` | README `arcosh(1+1/4) = log 2`; Mathlib `2 arsinh(1/(2√2)) = log 2`; vertical `|log 2|`; `z=w`: `arcosh 1 = 0 = 2 arsinh 0` | agree |
| L2.1 tensor and volume | `v=w=1` at `y=2` | tensor `1/4`; `sqrt det(y⁻² I₂) = 1/4`; Mathlib density `(1/y)² = 1/4` | agree |
| L0.2 PGL action | `diag(1,−1)`, `z=1+i`; `−I`; two negative determinants | README `−z̄ = −1+i`; Mathlib `σ(z/−1) = conj(−z) = −1+i`; `−I`: `z`; `M_A(conj M_B(z̄)) = M_{AB}(z)` with `det AB > 0` | agree; duplicates Mathlib (R04) |
| L0.2 kernel is the nonzero scalars | `−2·I`; `diag(1,−1)` at `1+i` | `(−2z)/(−2) = z`; `−1+i ≠ 1+i` | holds |
| Cusp width change `w' = a w` | `σ' = 2σ+1`, `w = 1` | `σ'γσ'⁻¹(z) = 2((z−1)/2+1)+1 = z+2`, so `w' = 2 = a·w` | holds; = `TauCeti.cuspDatum_width_eq_mul` |
| q-coordinate change | same | `q' = exp(2πi(2σ+1)/2) = −q`; formula `exp(2πi·1/(2·1)) = −1` | holds; = `TauCeti.cuspDatum_coordinate_eq` |
| `CuspDatum.conjugates_stabilizer_iff` | `n = −1, 0` | `γ⁻¹ ↦ z − w`; `1 ↦ z + 0` | holds |
| `cuspCoordinate_vadd` at junk `w = 0` | `w = 0` | `(z+0)/0 = 0`; both sides `exp 0 = 1` | true without `hw`; one `simp` (R08) |
| Riemann–Hurwitz, genus form | identity; genus 2 → `P¹` hyperelliptic; genus 3 → genus 2 unramified; `j: X(1) → P¹` | `2g−2 = 2g−2`; `2 = 2(−2)+6`; `4 = 2·2+0`; `−2 = 1·(−2)+0` | consistent |
| Sorried pair (lines 378, 414) | model `χ := 2, g := 0` | line 379: `2 = 2−0` holds; line 415 at genus 3 → 2 unramified: `2 = 4` | pins nothing (R01) |
| Repair `genus := ((2−χ)/2).toNat` | `χ = 2, 0, −4`; `X(1)` | `0, 1, 3`; `eulerChar X(1) = 2` at the pin gives `0` | matches ModularForms 10B(vi)'s `genus X(1) = 0` |
| L5.5 orbifold Euler characteristic and area | `X(1)`: `h=0, s=1, m=2,3` | `χ_orb = 2−0−1−7/6 = −1/6`; area `π/3`; Tau Ceti covolume `π/3` | agree |
| L4.4 cusp index and degree | `Γ̄(2) ≤ PSL₂(ℤ)` | three cusps of width 2 over width 1: `e = 2` each, sum `6` = index `6` | holds |
| L1.5 order formula | `f = u ∘ z³` | `3 = 3·1` | holds |
| `TriangleOrder.reciprocal` | `(2,3,cusp)`, `(2,3,7)`, `(2,3,6)` | `5/6 < 1`; `41/42 < 1`; `1 ≮ 1` | correct; duplicate (R03) |

## Not verifiable

- **The seven `**Source spine:**` lines** (seeded sample; README lines 263, 284, 315, 338, 363, 459, 481).
  - They cite Beardon, Katok, Farkas–Kra, Miranda, Forster, Diamond–Shurman, Serre and Stillwell, all at chapter or section level.
  - I ran each through the sources service this round. Katok and Miranda: no legal source found. Beardon, Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell: only paywalled Springer pages.
  - Theorem numbers, pages and hypotheses are therefore unchecked.
- **Siegel 1945** (Ann. of Math. 46, the minimum `π/21` that Layer 4a needs): the only copy is at JSTOR, a paywalled host. Layer 4a cites no source at all (R06).

## Source issues

- none
