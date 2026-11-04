# Review of FuchsianOrbifolds (pull request #1168 at 62cca0d)

**Verdict:** rejected

Incremental re-review of the 90 changed lines since 401a026. The change folds the former `SurfaceInvariants.lean` into `Suggested.lean` as a section (lines 355–394), deletes that file, and reworded README lines 104 and 443 to point at the section. Nothing outside the folder changed. The change is correct as far as it goes (the file elaborates, the merged declarations have the types the README states, the second module and the cross-roadmap import are gone), but it touches none of the blocking defects: the pull request still re-plans an on-main roadmap, still closes a roadmap-level cycle with `TeichmullerGeometry`, and the gate still fails on `set_option`, sorried data, imports, blob links, TeX and two UPWARD edges. The verdict stays `rejected` for the reason given last time: the repair is a new roadmap folder, not edits inside this one. Every finding below is carried from the previous report, restated at this head's line numbers; none is new.

## R01 (P1) — Re-plans the on-main roadmap; Layers 4a, 7, 8, 9 are a new roadmap

- Location: `TauCetiRoadmap/FuchsianOrbifolds/README.md` lines 21–77 (scope), 398–436 (Layer 4a), 516–1160 (Layer 7), 1162–1383 (Layer 8), 1385–1465 (Layer 9); 1590 lines against 431 on main.
- Claim: `FuchsianOrbifolds` is on main with `STATUS.md` recording Layers 0, 1, 3 done and Layers 2, 4, 5, 6 partial. A roadmap is built on, never re-planned; extensions are Part roadmaps. `FuchsianOrbifoldsPartII` (open, order line 265) already says "FuchsianOrbifolds stops at … (Layers 0–6)" and owns Nielsen cores, so that name is taken.
- Witness: `## Layer 4a`, `## Layer 7`, `## Layer 8`, `## Layer 9`, `## Secondary implementation provenance` are headings at this head (lines 398, 516, 1162, 1385, 1585) and absent on main.
- Repair: leave the base folder as on main (the only legitimate maintenance is Layer 5's switch to the native `TauCeti.Analysis.Complex.RiemannSurface.*` modules, a small separate change). Put Layers 4a, 7, 8, 9 in a new folder (for example `ArithmeticFuchsianLattices`) whose introduction says where `FuchsianOrbifolds` stops, placed after its last supplier. `QuaternionArithmetic` at its open head now cites only Layers 0–5, 1, 4 and 5 (its lines 164, 1691, 1835, 2347), so no consumer of Layer 7 needs repointing any more.

## R02 (P1) — Cycle: `TeichmullerGeometry` consumes Layers 0–8, Layer 9 consumes `TeichmullerGeometry`

- Location: README lines 31–32, 142–147, 183–187 ("`Fuchsian L1/L2.1/L4/L4a/L5 → TeichmullerGeometry T9`", "`Fuchsian L7.4 → TeichmullerGeometry T8`", "Fuchsian L9 consumes … Teichmuller T0, T4a, T9 and T10"), 1461.
- Claim: supply is per roadmap, not per section. `FuchsianOrbifolds` is on main and so a supplier of every open roadmap; its Layer 9 needs four milestones of `TeichmullerGeometry` (order line 266), which needs its Layers 0–8. That is a roadmap-level cycle.
- Witness: `ORDER.txt` line 266 `TeichmullerGeometry`; `FuchsianOrbifolds` on main. The depcheck does not parse the arrow form, which is why it prints no CYCLE line.
- Repair: as R01: the Gassmann application lives in the new roadmap, placed after `TeichmullerGeometry`; nothing in the on-main folder cites `TeichmullerGeometry`.

## R03 (P2) — Upward suppliers: an on-main roadmap citing open pull requests

- Location (depcheck at this head, quoted under *Verified sound*): `AdelicAlgebraicGroups` (order 31) at line 133, `ZerosOfLFunctions` (order 78) at lines 135, 784, 1109, 1129. Of the same kind but not parsed: `NoncompactQuantumSymmetry M1` (order 142) at line 150; `TeichmullerGeometry` (order 266) at lines 31–32, 142–147; `QuaternionicModularForms §0.3` (order 64) at line 1145; `SurfaceTopology` and `PlanarTopology` (in no order line, only in an open pull request) at lines 57–60, 95–118, 171–173, 440–462.
- Claim: a roadmap on main may consume only Mathlib, Tau Ceti and main.
- Witness: `PseudodifferentialOperators` has reached main since the last review, which is why that UPWARD line is gone; none of the others is in `content/TauCetiRoadmap` or `content/Completed`.
- Repair: as R01. In the new roadmap these become downward supplies once it is placed after them; `SurfaceTopology`/`PlanarTopology` can be cited only once they are in the order, and Layer 5's genus bridge (lines 440–449) must not cite them from the on-main folder.

## R04 (P1) — `set_option` in `Suggested.lean`

- Location: `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean` lines 531–532, 539–540, 568–569, 576–577, 588–589 (`set_option maxRecDepth 10000 in` / `set_option maxHeartbeats 10000000 in`).
- Claim: never `set_option` of any kind.
- Repair: delete the p85 block (R08); the finite-pair facts stay in the README as Checks.

## R05 (P1) — Sorried data

- Location: `Suggested.lean` line 42 `pslAction`, 75 `pslBoundaryAction`, 319 `instance compactifiedTopologicalSpace`, 324 `compactifiedChartedSpace`, 377 `SurfaceInvariants.surfaceEulerCharacteristic`, 383 `SurfaceInvariants.genus` (all `:= by sorry`), and everything that mentions them: the abbrevs at 405, 411, 453, 458, the theorems at 388, 415, 424, 430, 462, every `CuspDatum` theorem, `compactified_isManifold`, the `export` lists at 477–483.
- Claim: no `def`, `instance` or `abbrev` whose body is `sorry`, and nothing that mentions one. On main `genus` has the body `Int.toNat ((2 − χ)/2)`; this head makes `genus` a second independent `sorry`, so `surfaceEulerCharacteristic_eq_two_sub_two_mul_genus` now relates two opaque constants. With the model `χ := 0`, `genus := 0` it is false; with `χ := 2`, `genus := 0` it holds and then `branchedCover_eulerCharacteristic` reads `2 = 2d − R`, false for any degree-2 unramified map. The statements pin no mathematics.
- Witness: gate `sorry-data (6)`; the probes `simp` and `rfl` on the identity fail (scratch `Check.lean`).
- Repair: delete these declarations; cite the pinned library objects (R06). No genus carrier for compact complex curves exists at the pin (Tau Ceti's `genus` declarations are for permutation triples, ribbon graphs, slice surfaces and function fields) nor in any open roadmap's `Suggested.lean` (grep at the heads: `BelyiMaps`, `NoncongruenceModularForms`, `AdelicImagesAndModularCurves` define genus of other objects), so the Riemann–Hurwitz headline is not statable: the module docstring says so and nothing is stated in its place.

## R06 (P2) — Duplicates of objects the pinned Tau Ceti already has

- Location: `Suggested.lean` lines 39–332.
- Claim: the pinned Tau Ceti already provides what the file re-declares with `sorry`: `MulAction PSL(2, ℝ) ℍ`, `FaithfulSMul PSL(2, ℝ) ℍ` (`TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean` lines 132, 176); proper discontinuity of discrete subgroups (`Fuchsian/ProperAction.lean` line 33); `Subgroup.IsCuspPoint`, `BoundaryOrbit`, `CuspOrbit` (`Fuchsian/Cusp/Basic.lean` lines 54, 117, 137); `Subgroup.CuspDatum` with its fields and `mem_stabilizer_iff`, `mem_stabilizer_iff_conj` (`Fuchsian/Cusp/Datum.lean` lines 167–254); `Subgroup.CompactifiedQuotient`, `ofQuotient`, `ofCusp`, `equivSum` (`Fuchsian/Compactification/Basic.lean` lines 74–85) with its topology and `IsManifold 𝓘(ℂ) ∞` instance (`Compactification/Manifold.lean`); `TauCeti.TriangleOrder` (`Fuchsian/TriangleOrder.lean` lines 44–57); `Subgroup.IsCofinite`, `isCofinite_iff_covolume_ne_top` (`Fuchsian/Covolume.lean` line 122); `TauCeti.ModularGroup.jBiholomorph` (`Fuchsian/LevelOne/Sphere.lean`).
- Witness: all elaborate from `import Mathlib` plus the named `TauCeti.*` modules (previous report's `#check` file; unchanged files at the same pin, `lake-manifest.json` unchanged since 401a026).
- Repair: delete the duplicates and cite the library by name in the supplier contracts; Layers 0, 1, 3 and the Layer 6 endpoint are done and recorded as such, not restated as targets.

## R07 (P2) — Statable headlines absent; docstring silent on the unstatable ones

- Location: `Suggested.lean` lines 15–26 (module docstring) and the whole file.
- Claim: the headlines are (1) cofinite ⇒ compact compactified quotient, (2) `X(1) ≃ P¹` (proved at the pin), (3) Poincaré's polygon theorem, (4) Riemann–Hurwitz for finite holomorphic maps, (5) the minima `π/21` (compact) and `π/3` (finite area), (6) Takeuchi finiteness, (7) the commensurator dichotomy, (8) the degree-eight isospectral covers. (1) is statable now as `Γ.IsCofinite → CompactSpace Γ.CompactifiedQuotient`; (5) as `π/21 ≤ covolume` for discrete `Γ` with compact coarse quotient through `Fuchsian/Covolume.lean` and `volume : Measure ℍ`. Neither is stated. (4), (6), (7), (8) are not statable and the docstring does not say so; (4) is forced through the sorried `genus` (R05).
- Repair: state (1) and (5) on the library carriers; name (4), (6), (7), (8) in the docstring with the missing carrier; delete the rest.

## R08 (P3) — Padding in `Suggested.lean`

- Location: lines 496–611 (the p85 block, all closed by `decide` or by one lemma: `p85_card`, `p85H₁_card`, `p85H₂_card`, `p85H₁_subgroup_card`, `p85H₂_subgroup_card`, `p85AlmostConjugate`, `p85_not_conjugate`, `p85_normalForm`, `p85_generates`); lines 282, 286 (`cyclicQuotientCoordinate_differentiable`, `cyclicQuotientCoordinate_eq_zero`); lines 70, 90, 142, 230 (`rfl` or one-lemma statements); lines 106–122 (four Mathlib `example`s).
- Witness: `differentiable_id.pow m` and `pow_eq_zero_iff hm.ne'` close the two `cyclicQuotientCoordinate` statements (previous report, unchanged lines); the p85 block computes values in a group of order 32.
- Repair: delete them from `Suggested.lean`; the README keeps the finite-pair facts as Checks (they are correct, see the table).

## R09 (P3) — Imports and declarations into the library's namespaces

- Location: `Suggested.lean` lines 1–13 (no `import Mathlib`; eleven `import Mathlib.<submodule>` lines); lines 444–492 (declarations and `export` lists inside `namespace TauCeti.RiemannSurface` and `namespace RiemannSurface`, including `abbrev Divisor`).
- Claim: the header is the single line `import Mathlib` followed by the `TauCeti.*` modules used; every declaration lives in `namespace TauCetiRoadmap.FuchsianOrbifolds`; a roadmap file does not declare into the library's namespace. The cross-roadmap import and the second module are gone at this head (that part is repaired). README line 104 says "the three target declarations re-exported on `TauCeti.RiemannSurface`", but that namespace receives `surfaceEulerCharacteristic`, `genus` and `riemannHurwitz`; the section's third declaration, the identity `χ = 2 − 2g`, is exported only into `RiemannSurface` (line 483).
- Witness: gate `imports (1)`, `mathlib-subimports (11)`, `no-import-mathlib (1)`; the `#check` output under *Verified sound*.
- Repair: fix the header; drop the `TauCeti.RiemannSurface`/`RiemannSurface` aliases. `ModularForms/Suggested.lean` on main (its lines 2, 92, 99) imports this module and `#check`s `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`; the fix is for `ModularForms` to cite the native `TauCeti.RiemannSurface` names and drop the two genus names until a genus carrier exists, not for this file to keep aliases of sorried data alive.

## R10 (P3) — Blob links, TeX, process artefacts

- Location: README lines 57, 60, 88, 92, 99, 100, 117, 131, 132, 133, 148, 150, 152, 321, 1372 (eighteen `github.com/…/blob/<sha>/…` links); lines 810–811 (`Z_{k_i−1}` outside a code span, gate `tex (2)`); line 278 (`\begin{pmatrix}…` in a code span); lines 1585–1590 (`## Secondary implementation provenance`, naming the artefact `root-odlyzko-estimates4-5-all-signatures-certificate-20261016T173212Z`).
- Repair: name the roadmap and section instead of a pinned link; put the display formula in one code span; write the matrix as `[[a,b],[c,d]]`; delete the provenance section.

## R11 (P3) — Shape, missing sources, invented vocabulary

- Location: whole README; Layer 9 (lines 1385–1465) has no `**Source spine:**`; Layer 8's spine (line 1381) cites "the source article's cited 1974 ICM theorem" without naming the article; `## References` (lines 1545–1583) omits Takeuchi 1975 and 1983, Maclachlan–Reid, Vignéras, Margulis and Odlyzko 1977, all cited in the text; "the p85 order-32 Gassmann pair" (lines 149, 1385) is not a term of the literature.
- Claim: not in the house shape (no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`; no `### k.n` subsections except in Layer 9; no `**Checks.**` bullets; no per-layer `### Examples`/`### Dependencies`); Layer 7 is one 645-line layer.
- Repair: for the new roadmap of R01, write in the house shape; cite Sunada (Ann. Math. 121, 1985) or Brooks for the Gassmann construction and say that `Q` is the affine group of `ℤ/8` with `H₁` its unit subgroup; add the missing references; name the article behind Layer 8.

## R12 (P2) — Computational certificates written as roadmap content

- Location: README lines 846–895 (rational directed-interval certificates, Bernstein bisection "six leaves at depths at most 5", polynomial identity checked "at 84 and 66 distinct rational points"); lines 1010–1080 (quadrature with explicit integration error bounds, 31 cutoffs, 35 degree checks, "certify that the smallest ratio is at degree 9 and exceeds `1.20369`").
- Claim: mathematics, not algorithms. The mathematics behind them (Odlyzko's Theorem 1, equations (8)–(13), the tables as cited facts, the reduction of inequality (11) to `x = 1` by harmonicity) is welcome.
- Repair: state estimates (4) and (5), the Table 1 data and the Table 2/4 rows as cited inputs with locators; state the needed inequalities (`e^(−70) > 10^(−34)`, `58.6^(3/2)/(4π²) > 10`, `B_n^n > a₀R₀^n` for `n ≤ 35`) as targets with their values; drop the prescribed certificate algorithms.

## R13 (P3) — Backticked own names that nothing declares

- Location: README line 520 `tamagawaNumberOne_SL1_quaternion`; 420, 988 `minimum_area_finite_area_orbifold`; 707–708, 1193–1194 `invariant_squared_trace_data_finite_index`, `invariant_squared_trace_data_commensurable`; 728, 907, 1353 `integral_trace_lattice_order`; 738, 901 `squared_trace_integrality_of_commensurable_arithmetic_group`; 1113 `global_reduced_norm_localization`; 1202 `dense_commensurator_squared_trace_field_is_number_field`.
- Claim: a backticked name of the roadmap's own claims that `Suggested.lean` declares it; none of the eight is declared (grep of `Suggested.lean` at this head).
- Repair: write them as prose names.

## R14 (P3) — Local-volume wording in Layer 7.2(c)

- Location: README lines 651–652: "Hence a division place replaces the split factor by `(q−1)⁻¹`".
- Claim: the same paragraph gives the division-place volume as `(1−q⁻²)/(q−1)`, so the division place multiplies the split factor `1−q⁻²` by `(q−1)⁻¹`. Values: `q = 2`: split `3/4`, division `3/4`; `q = 3`: split `8/9`, division `4/9`; "replaces by `(q−1)⁻¹`" would give `1` and `1/2`.
- Repair: "multiplies the split factor by `(q−1)⁻¹`".

## Previous findings

- R01 — not repaired: headings `## Layer 4a` (398), `## Layer 7` (516), `## Layer 8` (1162), `## Layer 9` (1385), `## Secondary implementation provenance` (1585) all present; README 1590 lines against 431 on main.
- R02 — not repaired: "Fuchsian L9 consumes Fuchsian L2.1, L5 and L8, Teichmuller T0, T4a, T9 and T10" (line 147); `TeichmullerGeometry` at order line 266.
- R03 — partly repaired, by main moving rather than by the pull request: `PseudodifferentialOperators` reached main, so its UPWARD line is gone; `AdelicAlgebraicGroups` (133) and `ZerosOfLFunctions` (135, 1129) still UPWARD; `NoncompactQuantumSymmetry M1` (150), `TeichmullerGeometry`, `QuaternionicModularForms §0.3` (1145), `SurfaceTopology`/`PlanarTopology` (57–60, 95–118, 440–462) still cited.
- R04 — not repaired: ten `set_option … in` lines at 531–589.
- R05 — not repaired: the two surface-invariant `sorry` definitions moved from `SurfaceInvariants.lean` into `Suggested.lean` lines 377 and 383, where the gate now counts them (`sorry-data=6`, up from 4); the four others at 42, 75, 319, 324 unchanged.
- R06 — not repaired: lines 39–332 unchanged.
- R07 — not repaired: docstring lines 15–26 unchanged; no cofiniteness-compactness or `π/21` statement.
- R08 — not repaired: p85 block now at 496–611, `cyclicQuotientCoordinate` statements at 282 and 286.
- R09 — partly repaired: `import TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants` and the second module are gone; the header still has no `import Mathlib` and eleven submodule imports (lines 1–13), and the `TauCeti.RiemannSurface`/`RiemannSurface` declarations remain (444–492).
- R10 — not repaired: 18 blob links on 15 lines, `Z_{k_i−1}` at 811, `pmatrix` at 278, provenance section at 1585–1590.
- R11 — not repaired: `## References` (1545–1583) still lists no Takeuchi, Maclachlan–Reid, Vignéras, Margulis or Odlyzko 1977; Layer 9 still has no source spine; "p85 order-32" at 149 and 1385.
- R12 — not repaired: Bernstein leaves at 870–880, "exceeds `1.20369`" at 1079.
- R13 — not repaired: all eight names present at the lines listed above.
- R14 — not repaired: "replaces the split factor by `(q−1)⁻¹`" at 651–652.

## Verified sound

**Scope of this re-review.** The diff since 401a026 (data, `changes.md`): README lines 104 and 443 reworded; `Suggested.lean` loses the roadmap import at line 1 and gains the `SurfaceInvariants` section at lines 355–394; `SurfaceInvariants.lean` deleted. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FuchsianOrbifolds'` is empty. The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md`, `metadata.toml` (gate `stray-files=0`). `lake-manifest.json` is unchanged, so the pins and every library line number of the previous report still hold.

**Gate (data, quoted).** `gate FuchsianOrbifolds: set_option=10 blob=18 latex=0 tex=2 prnum=0 sorry-data=6 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=11 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=2 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`. The targeted build passes. Depcheck, rerun by me at this head:

```
UPWARD: FuchsianOrbifolds (on main) -> AdelicAlgebraicGroups (#30) at README lines [130]
UPWARD: FuchsianOrbifolds (on main) -> ZerosOfLFunctions (#77) at README lines [130, 1129]
depcheck: 234 roadmaps, 2042 edges, 2 problem(s)
```

**Elaboration.** `lake env lean TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean` from the worktree: exit 0, 24 `declaration uses 'sorry'` warnings (lines 42, 46, 51, 55, 60, 75, 79, 99, 177, 206, 212, 224, 238, 245, 254, 282, 286, 319, 324, 329, 377, 383, 388, 424), no other diagnostic, 11 s. The same 24 as the previous head's 21 + 3 in the deleted module. A scratch file importing `TauCetiRoadmap.FuchsianOrbifolds.Suggested` with `#check @` on the 16 declarations the diff touches or that mention them elaborated: `SurfaceInvariants.surfaceEulerCharacteristic : (X : Type u) → [TopologicalSpace X] → [ChartedSpace ℂ X] → [T2Space X] → [CompactSpace X] → [ConnectedSpace X] → [IsManifold 𝓘(ℂ, ℂ) 1 X] → ℤ`, `SurfaceInvariants.genus` likewise to `ℕ`, the identity `surfaceEulerCharacteristic X = 2 − 2 * ↑(genus X)` with all six instance binders in scope, `branchedCover_eulerCharacteristic : χ X = ↑(degree ↑f) * χ Y − ↑(ramificationDegree ↑f)`, `riemannHurwitz : 2 * ↑(genus X) − 2 = ↑(degree ↑f) * (2 * ↑(genus Y) − 2) + ↑(ramificationDegree ↑f)`; `TauCeti.RiemannSurface.genus`, `.surfaceEulerCharacteristic`, `.riemannHurwitz` and `RiemannSurface.genus`, `.riemannHurwitz`, `.surfaceEulerCharacteristic_eq_two_sub_two_mul_genus` all print as the same sorried section declarations. These match README Layer 5's `2g_X − 2 = d(2g_Y − 2) + R`. At the pin `TauCeti.RiemannSurface.degree` and `ramificationDegree` take a bare `X → Y` with only `TopologicalSpace` and `ChartedSpace ℂ` on each side (junk values off finite holomorphic maps), and the file applies them to the coercion of a `FiniteHolomorphicMap`, which is the intended case. The one-tactic probes `simp` and `rfl` on the changed sorried identity fail (`simp made no progress`; `rfl` not definitional), so the merged theorem is not padding in the one-tactic sense; it is sorried data (R05). No `set_option` was needed by my scratch file.

**Ownership of the changed section.** Grep of every open roadmap's `Suggested.lean` at its head and of main for `def`/`abbrev` named `genus`, `eulerChar` or `surfaceEulerCharacteristic`: only this folder (and its own copy on main, lines 399 and 406, where `surfaceEulerCharacteristic` is sorried and `genus := Int.toNat ((2 − χ)/2)`) declares them on compact complex curves; `BelyiMaps` (permutation triples), `FreeGroupsAndLimitGroups` (surface models), `NoncongruenceModularForms` (modular triples) and `AdelicImagesAndModularCurves` (open subgroups, `ℚ`-valued) define genus of other objects. Tau Ceti at the pin has `genus` only in `Combinatorics/PermutationTriple/EulerCharacteristic.lean` line 204, `Combinatorics/RibbonGraph/Genus.lean` line 41, `KnotTheory/Slice/Genus.lean` line 141 and `FieldTheory/FunctionField/RiemannRoch/Genus.lean` line 189. So this folder is the only owner of the object and no second owner was introduced; the defect is that the owner's declaration is sorried data, not that it is duplicated.

**Cross-roadmap citations the diff touches.** README lines 104 and 443 cite SurfaceTopology Layers 5 and 8, PlanarTopology Layers 5/6/8, GeometricTopology Layer 1 and AlgebraicTopology 4.7: resolved as in the previous report (GeometricTopology Layer 1 at main line 177; AlgebraicTopology 4.7 `simplicialRealizationCW`, `standardCellBallToOrderedSimplex` at main lines 817–820; SurfaceTopology Layer 5 `IsBranchedCover` and Layer 8 classification, PlanarTopology Radó/Hauptvermutung, in the open pull request only, absent from `ORDER.txt`: R03). `QuaternionArithmetic` at its open head (lines 164, 1691, 1835, 2347) now cites only Layers 0–5, so the previous report's consumer of Layer 7 no longer exists; `FuchsianOrbifoldsPartII` at its open head still says FuchsianOrbifolds stops at Layers 0–6 (its line 7). `ModularForms/Suggested.lean` on main imports this module (line 2) and `#check`s `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz` (lines 92, 99): the targeted build of both modules passes.

**Sources.** None of the seeded targets (seven `**Source spine:**` lines at 296, 317, 348, 371, 396, 491, 513, 1150, 1381; `**Supplier boundary.**` at 1103 and 1371; `**Dependency order:**` at 1461) falls in the two changed README lines, which carry no locator. The nearest is Layer 5's spine (line 491: Forster §§10, 17, 19; Miranda III §§3–4; Farkas–Kra), unchanged, and under *Not verifiable* as before. The previous report's source checks (Odlyzko 1977 Theorem 1 and tables, Odlyzko's Tables 2 and 4, Takeuchi 1975 and 1983, Belolipetsky–Gelander–Lubotzky–Shalev, Bader–Furman at arXiv v1) concern unchanged passages and stand.

**Adversarial table.** Rows for unchanged statements are carried from the previous report (`PRREVIEW-FuchsianOrbifolds~1`, cited as "prev"); rows for the changed statements are computed here.

| Statement | Instances | Values | Result |
|---|---|---|---|
| `SurfaceInvariants.surfaceEulerCharacteristic_eq_two_sub_two_mul_genus` (changed, sorried `χ`, `g`) | models of the two sorried constants; true surfaces | model `χ := 2, g := 0` satisfies it; model `χ := 0, g := 0` refutes it; sphere `2 = 2 − 0`, torus `0 = 2 − 2`, genus 3: `−4 = 2 − 6` | pins nothing (R05); on main `g := toNat((2−χ)/2)` gave `χ = 2 − 2·toNat((2−χ)/2)`, true iff `χ ≤ 2` even |
| `riemannHurwitz` derived by `linarith` from the identity and `branchedCover_eulerCharacteristic` (changed context) | identity map `d=1, R=0`; unramified degree-2 cover of a torus `d=2, R=0`; hyperelliptic genus 2 → `P¹` `d=2, R=6` | `2g−2 = 1·(2g−2)+0`; `0 = 2·0 + 0` with `g_X = 1`; `2 = 2·(−2) + 6` | consistent with the classical formula; the `linarith` step is sound given its inputs |
| `branchedCover_eulerCharacteristic` with the model `χ := 2` | degree-2 unramified map | `2 = 2·2 − 0 = 4` | false under the model, so the sorried pair pins nothing (R05) |
| README 104 "three target declarations re-exported on `TauCeti.RiemannSurface`" (changed line) | the `#check` output | `TauCeti.RiemannSurface` receives `χ`, `genus`, `riemannHurwitz`; the section's identity theorem lands only in `RiemannSurface` (line 483) | two of three; noted under R09 |
| Instance binders of the changed declarations | the six section `variable`s | all six (`TopologicalSpace`, `ChartedSpace ℂ`, `T2Space`, `CompactSpace`, `ConnectedSpace`, `IsManifold 𝓘(ℂ,ℂ) 1`) appear in each elaborated type | none dropped; `IsManifold … 1` here against `∞` on main, consistent with the native carrier |
| L4a compact minimum `π/21` | prev | gaps `1/42, 1/20, 1/10, 1/12`; `(1;2)` area `π`; `r=4`: `1/6`; `2π/42 = π/21` | holds (prev) |
| L4a finite-area table | prev | brackets `1/6, 1/4, 1/3, 1/2, 1, 1, 1/2` → `π/3, π/2, 2π/3, π, 2π, 2π, π` | holds, min `π/3` (prev) |
| L7.2 area formula | prev, `k=ℚ`, `B=M₂(ℚ)` | `8π·(π²/6)/(4π²) = π/3` | holds (prev) |
| L7.2 Tamagawa chain | prev | `(π/2)(π/3)(6/π²) = 1` | holds (prev) |
| L7.2 Gram determinants | prev | `−16a²b²`; split `det = −1` | holds (prev) |
| L7.2 local volumes | prev, `q = 2, 3` | split `3/4, 8/9`; division `3/4, 4/9` | holds; wording R14 (prev) |
| L7.2 `vol(SL₁(ℍ)) = 4π²` | prev | `4·(1/2)·2π² = 4π²` | holds (prev) |
| L7.3 trace identities | prev, `λ = 2` | `t = 17/4`, `(tr)² = 25/4 = t+2`, `t₂ = 257/16 = t²−2` | holds (prev) |
| L7.3b constants | prev | `3^70 < 10^34`; `58.6^(3/2)/(4π²) = 11.36 > 10`; `8π = 25.13 ≥ 24` | holds (prev) |
| L7.3b discriminant bound | prev | `8πΔ^(3/2)/(4π²)^n ≤ C_sig` | holds (prev) |
| L7.4 generator/index bounds | prev, `(0;2,3,7)` | `d ≤ 4.05`; `m(m!)^d` | holds (prev) |
| L7.6 `Δ ≥ a₀R₀^n` | prev | min ratio `1.203691` at `n = 9`; `29.582 > 29.099` | holds (prev) |
| L8.3 index two | prev | `|PGL₂/PSL₂| = 2` | holds (prev) |
| L9 group `Q = (ℤ/8)ˣ ⋉ ℤ/8` | prev | conjugation `(v, ub + (1−v)a)`; `|Q| = 32` | holds (prev) |
| L9.2 class sizes, almost conjugacy, non-conjugacy, generation, cores, permutation characters | prev | sizes `1,4,2,1,4,4,2,4,2,4,4`; both sequences `1,0,0,0,1,0,1,0,0,1,0`; `6a₀ ≡ 4` and `4a₀ ≡ 4` contradict; fixed cosets `2, 4, 2`, identity `8` | holds (prev); the p85 Lean block agrees (R08: padding, not error) |
| L9 genus of the covers | prev | `g′ = 17 = 8·3 − 7` | holds (prev) |
| L9.1 `r ≤ 2g+2−4h` | prev | `g=2,h=0,r=6`: codim 0; `g=3`: codim ≥ 1 | holds (prev) |
| L2.1 distance | prev, `i`, `2i` | `arcosh(5/4) = log 2 = 2 arsinh(1/(2√2))` | agree (prev) |
| `CuspDatum.conjugates_generator` vs library | prev | both `z ↦ z + width` | same convention (prev) |

## Not verifiable

- Voight, *Quaternion Algebras* (Main Theorems 29.10.1(c), 29.11.3, Lemma 29.11.1, Lemma 29.8.24(b), p. 536): paywalled at Springer, no author copy; recorded `uncertified` last round.
- Katok, Beardon, Farkas–Kra, Miranda, Forster, Diamond–Shurman, Serre, Stillwell (the Source spines of Layers 0–6, including Layer 5's at line 491, the layer whose item 1 the diff reworded), Maclachlan–Reid, Vignéras, Margulis Chapter IX, Weil: books, no legal text found; Borel 1981 and Prasad 1989 not fetched.
- Bader–Furman: numbering checked at arXiv v1 only; the README cites the Annals version.
- ZerosOfLFunctions sub-labels 1.4, 3.4, 4.8, 5.6, 8.4: not headings at its open head; resolved at layer level only.

## Source issues

- none
