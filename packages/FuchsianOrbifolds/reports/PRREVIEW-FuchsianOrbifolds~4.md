# Review of FuchsianOrbifolds (pull request #1168 at a1a346e)

**Verdict:** needs changes

This is a full review of the head; the folder changed by 1137 lines since `4b6bb3d`. The gate passes on every check. `Suggested.lean` elaborates with seven `sorry` warnings and no other diagnostic. Every headline holds on every instance in the adversarial table below. There are six findings, one of them blocking.

Main moved after this head's base. ModularForms on main (`deebc70`, the newform-orbit revision) changed in two ways that affect this roadmap. It now assigns the normalized level-one `j`-function to this roadmap's Layer 6 (R01). Its `Suggested.lean` no longer imports this module, and its §10B no longer has numbered items (R04). Rebase onto main before applying R04: the copy of `TauCetiRoadmap/ModularForms/Suggested.lean` at this head's base still `#check`s the names R04 deletes.

## Previous findings

- **R01 (P1, sorried data): repaired.** `genus` now has a real body, `((2 - eulerChar X) / 2).toNat` (`Suggested.lean` 63–64). The gate reports `sorry-data=0`. The eleven headline and support declarations use no stand-in.
- **R02 (P2, SurfaceTopology, PlanarTopology and the GeometricTopology adapter): repaired.** No README line names any of them. Layer 5 item 1 takes its route from "Euler–Poincaré over `ℚ` (`TauCeti.eulerChar_eq_finsum_finrank_singularHomology`)" and AlgebraicTopology Stages 6 and 8 (README 454–466).
- **R03 (P2, re-declared library objects): repaired in `Suggested.lean`.** The file keeps 10 declarations, and `### Implemented in Tau Ceti` (README 129–173) cites the pinned names. The layer items still read as open targets (R03 below).
- **R04 (P2, Layer 0 item 2 re-planned Mathlib's action): repaired.** Line 290 now reads "restrict Mathlib's existing projective Möbius action along it". The owned remainder is the isometry of negative-determinant elements, which has Checks and a `*Needs:*` line.
- **R05 (P2, absent headline, stale docstring): repaired.** The four Layer 4a theorems are stated, and `minimum_area_finite_area_orbifold` is declared (line 118). The docstring (lines 18–35) names the pinned headlines.
- **R06 (P2, Layer 4a restated the `1/42` bound, no locator): mostly repaired.** Lines 565–566 now say "Without cusps, `δ ≥ 1/42` is Tau Ceti's `TauCeti.one_div_forty_two_le_hyperbolic_deficit`", and only uniqueness and the cusp table are owned. The locator "(Siegel 1945)" still has no theorem or page, and item 2 has none (R06 below).
- **R07 (P3, Layer 5 renumbering): repaired.** Items 1–6 keep main's numbering, and item 7 is new. GroupActionsOnRiemannSurfaces' citations of 5.1, 5.3 and 5.6 resolve.
- **R08 (P3, padding): repaired.** The `rfl` lemmas and `example`s are gone, and no sorried theorem closes in one tactic. `compactifiedChartedSpace` has since become padding, because its consumer is gone (R04).
- **R09 (P3, `letI`): repaired.** `statement-hygiene=0`.
- **R10 (P3, `TauCeti.RiemannSurface` namespace): repaired as asked.** The file now exports from `TauCetiRoadmap.FuchsianOrbifolds` into `RiemannSurface` (lines 136–146). That consumer has since been removed from main (R04).
- **R11 (P3, blob links, LaTeX, typos): repaired.** `blob=0`, `latex=0` and `tex=0`. The matrix is written `A = [[a, b], [c, d]]`, and the run-together typos are gone.
- **R12 (P3, Checks and `*Needs:*` on new items): repaired for the rewritten items.** L0.2, L2.1, 5.1, 5.3, 5.6, 5.7, 4a.1 and 4a.2 each carry both. Three `*Needs:*` lines are incomplete (R02 below).

## R01 (P2) — The normalized `j`-function: this roadmap and ModularForms each hand it to the other

- **Location.**
  - README 113–115: "The modular-forms roadmap owns modular forms and functions before descent, including the normalized level-one `j`-function, modular invariance, q-expansion, and exact elliptic orders".
  - The same hand-off recurs at 282–283 (Existing foundations), 625–626 ("This layer consumes the modular-forms roadmap's normalized `j`-function…") and 643–644 (Layer 6 source spine).
- **Claim.** ModularForms on main now disclaims `j` and assigns it to this roadmap's Layer 6. This README assigns it to ModularForms. So `j` has no owner in either roadmap, and Layer 6's supplier citation points at a roadmap that does not make it.
- **Witness.** ModularForms `README.md` on main, lines 39–41: ownership of `j`, its invariance, q-expansion and elliptic orders "moves from this roadmap to FuchsianOrbifolds Layer 6, which is to construct j from Mathlib's E₄, E₆ and Δ; this roadmap supplies no j-input module".
- **Repair.** The object already exists at the Tau Ceti pin, so this is a citation change. Its file is `TauCeti/Analysis/Complex/ModularForms/LevelOne/JInputs.lean`, and these names all `#check` at the pin:
  - `TauCeti.ModularForm.j` (line 93);
  - `TauCeti.ModularForm.j_smul_SL2Z` (105);
  - `TauCeti.ModularForm.j_sub_1728` (138);
  - `TauCeti.ModularForm.analyticOrderAt_j_comp_ofComplex_ρ` (236);
  - `TauCeti.ModularForm.analyticOrderAt_j_sub_1728_comp_ofComplex_I` (246);
  - `TauCeti.ModularForm.laurentQExpansion_j` (429).

  Make these edits:
  1. Drop `j` from the ModularForms ownership bullet (113–115).
  2. Cite the six names, with their file, in that bullet, at 282–283, at 625–626 and in the Layer 6 source spine. Layer 6 then consumes the pinned `j` and owns its descent, extension and degree-one identification, which agrees with ModularForms lines 37–42.

## R02 (P3) — Layer 4a's routes use inputs that their `*Needs:*` lines do not list or misattribute

- **Location.**
  - README 561–562: the deficit "…which is positive (Layer 5 item 7)".
  - 567–568: "with a cusp, item 2 gives the larger bound `π/3`".
  - The `*Needs:*` lines at 579–581 and 607–608.
  - Layer 5 item 6's `*Needs:*` at 526, and 155–156 and 360–361 ("`MeasureTheory.covolume` … (`Fuchsian/Covolume.lean`)").
- **Claims.**
  - **Positivity.** Layer 5 item 7 gives `covolume = ENNReal.ofReal (2π δ)`, which is also satisfied when `δ ≤ 0` and the covolume is `0`. It therefore does not give `δ > 0`. Positivity is what lets the `1/42` lemma apply.
  - **Finite CW type.** `pi_div_twentyOne_le_covolume` and `minimum_area_finite_area_orbifold` carry no `FiniteCWType` hypothesis. Routing them through Layer 5 item 7, whose statement requires `[FiniteCWType (CompactifiedQuotient Γ)]`, needs that instance for every cofinite `Γ`. The pin has it only for `X(1)` (`TauCeti.ModularGroup.finiteCWType_compactifiedQuotient`, `Fuchsian/LevelOne/Signature.lean` 64).
  - **Item order.** Item 1 uses item 2, a later item.
  - **Layer 5 item 6.** Its text uses `MeasureTheory.covolume_eq_card_mul_covolume`, but its `*Needs:*` line omits it.
  - **Attribution.** `MeasureTheory.covolume` is Mathlib's, not Tau Ceti's.
- **Witnesses.**
  - Tau Ceti `MeasureTheory.covolume_pos` (`TauCeti/MeasureTheory/Group/FundamentalDomain.lean` 358) is the missing positivity input. A scratch probe confirms it applies to every discrete `Γ ≤ PSL(2, ℝ)`.
  - `MeasureTheory.covolume` is defined at `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` 679, with junk value `0` when no fundamental domain exists.
  - For `(0; 2, 2, 2, 2)`, `δ = 0` fails the lemma's positivity hypothesis.
- **Repair.**
  - Replace "(Layer 5 item 7)" at 562 with "(Tau Ceti `MeasureTheory.covolume_pos`, with Layer 5 item 7)".
  - Add to both Layer 4a `*Needs:*` lines:
    - Tau Ceti `MeasureTheory.covolume_pos`;
    - AlgebraicTopology Stage 8 item 7 with ComplexManifolds Milestone 1, for the finite CW type of `X(Γ)`.
  - Put item 2 before item 1 and list it in item 1's `*Needs:*`. Only README line 619 cites these item numbers; TeichmullerGeometry cites "Layer 4a" as a whole.
  - Add `MeasureTheory.covolume_eq_card_mul_covolume` to line 526.
  - At 156 and 361, attribute `MeasureTheory.covolume` to Mathlib.

## R03 (P3) — Layers 0–4 and 6 present pinned results as open targets, contrary to the README's own rule

- **Location.** README 131–132: "the layers below cite those declarations rather than restate them".
  - Layer 4 items 1–3 (427–434) say "Form the carrier…", "Prove the carrier is Hausdorff and second countable…" and "prove `ChartedSpace` and `IsManifold`".
  - Line 428 points at "the displayed constructors and sum equivalence in `Suggested.lean`", which the file no longer contains.
  - Layer 3 items 1, 2 and 4; Layer 2 items 3, 4 and 6; Layer 0 items 3 and 5; and Layer 6 items 1–4 do the same.
  - Layer 0 item 1 (287–289) and the ownership line 83 plan "the quotient topology and topological-group structure".
- **Claim.** These items tell an implementer to build what the pin already proves. No declaration is named in place. The pinned theorems are often stronger: the atlas is analytic (`ω`), not `∞`.
- **Witness.** Each item's work already exists at the pins:

  | Item | At the pins |
  |---|---|
  | Layer 4 | `Subgroup.CompactifiedQuotient` with constructors `ofQuotient` and `ofCusp` and `equivSum` (`Fuchsian/Compactification/Basic.lean` 74, 86); `instT2Space` (314); `instSecondCountableTopology` (341); `instChartedSpace` and `instIsManifold` (`Compactification/Manifold.lean` 120, 260) |
  | Layer 3 | `IsCofinite.finite_cuspOrbit` (`Cusp/Finite.lean` 241); `IsCuspPoint.exists_cuspDatum` (`Cusp/Datum.lean` 326) |
  | Layer 6 | `TauCeti.ModularGroup.jBiholomorph` and `coe_jBiholomorph` (`Fuchsian/LevelOne/Sphere.lean` 175, 180) |
  | Layer 0 item 1 | Mathlib's quotient instances; `#synth` at the pin finds `QuotientGroup.instTopologicalSpace`, `QuotientGroup.instIsTopologicalGroup` and `QuotientGroup.instT2Space` for `PSL(2, ℝ)`. Only `SecondCountableTopology` fails to synthesize. |
- **Repair.**
  - In each listed item, name the pinned declaration in place, as Layer 5 items 2, 4 and 5 already do.
  - Keep as targets only what the pins lack. Examples:
    - second countability of `PSL(2, ℝ)` and the comparison with the algebraic quotient (Layer 0 item 1);
    - the cusp ramification law `e_cusp = w_{Γ'}/w_Γ` and multiplicativity in towers (Layer 4 item 4);
    - the negative-determinant isometry (Layer 0 item 2).
  - At 242 and 428, replace "displayed … in `Suggested.lean`" with the Tau Ceti names above.
  - Line 83 should cite Mathlib's quotient instances instead of owning them.

## R04 (P3) — The ModularForms compatibility layer has no consumer on main, and its README references no longer resolve

- **Location.**
  - `Suggested.lean` 45–54: `abbrev CompactifiedQuotient` and `compactifiedChartedSpace … := inferInstance`.
  - `Suggested.lean` 136–146: the `export` block into the root namespace `RiemannSurface`.
  - README 175–180: "`Suggested.lean` keeps two names for the modular-forms roadmap, whose `Suggested.lean` imports this roadmap's"; 485–486; 630–631 ("`RiemannSurface.genus X(1) = 0` expected by ModularForms 10B(vi)"); 111 ("ModularForms Layer 10B(v)"); 189 (`TauCeti.Analysis.Complex.ModularForms.DimensionFormula`).
- **Claims.**
  - **No consumer.** The only consumer was main's ModularForms `Suggested.lean`. Without it:
    - `compactifiedChartedSpace` restates Tau Ceti's instance;
    - `CompactifiedQuotient` renames `Subgroup.CompactifiedQuotient`;
    - the export block places this roadmap's names outside its namespace for no reader.
  - **Stale references.** ModularForms §10B on main has no items (v) and (vi), and uses no `RiemannSurface.*` short names. `DimensionFormula` is not a module at the pin.
- **Witnesses.**
  - ModularForms `Suggested.lean` on main (`deebc70`) has no `import TauCetiRoadmap.FuchsianOrbifolds.Suggested` and no `#check RiemannSurface.*`.
  - ArithmeticFuchsianGroups' `Suggested.lean` at its head imports this module but uses none of these names.
  - No other `Suggested.lean` uses them (`roadmaps grep --lean-only`).
- **Repair** (tested on a scratch copy, with this head's `RiemannSurface.FiniteHolomorphicMap` resolving through `open TauCeti`). Rebase first, then:
  - delete lines 43–55 and 136–146 of `Suggested.lean`;
  - write `Γ.CompactifiedQuotient` in the four headlines;
  - drop the import `TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`, which only the export block used.

  The copy elaborates with seven `sorry` warnings and nothing else, and the module docstring's "together with the one definition they need" then holds. In the README:
  - delete 175–180 and the last sentence of item 5.2 (485–486);
  - write "ModularForms §10B" at 111 and 255, and "`genus X(1) = 0`, expected by ModularForms §10B," at 630–631;
  - drop the `ModularForms.DimensionFormula` line of the import graph (184–196).

## R05 (P3) — A Layer 5 item 1 Check misstates its wrong model

- **Location.** README 472–473: "the definition `g = −χ/2`, which agrees on the torus, would give `1`".
- **Claim.** The wrong model does not agree on the torus.
- **Witness.** On the torus `χ = 0`, so `−χ/2 = 0`, while the genus is `1`. The model agrees only on the sphere, after truncation at `0`: `(−2/2).toNat = 0`.
- **Repair.** Write "the definition `g = (−χ/2).toNat`, which agrees on the sphere, would give `1` here and `0` on the torus".

## R06 (P3) — Layer 4a's theorems have no theorem-level locator

- **Location.**
  - README 565: "covolume at least `π/21` (Siegel 1945)".
  - Item 2 (591–608) and the equality cases carry no locator.
  - The docstrings of `pi_div_twentyOne_le_covolume`, `minimum_area_finite_area_orbifold` and `covolume_eq_pi_div_three_iff` (`Suggested.lean` 99–125) give "Siegel 1945" or nothing.
- **Claim.** Every theorem needs a locator at theorem or page level. A work-level citation does not let a reader check the hypotheses, and the source spine (line 621) gives only sections.
- **Witness.** The reference list (718–719) gives Siegel's page range, 708–718, and no theorem.
- **Repair.**
  - Cite Siegel's theorem or page for the `π/21` minimum.
  - Cite the textbook theorems (Beardon §10.4 or Katok §4.3, by number) for the area formula and for the cusped minimum `π/3`. If no source states the equality cases, say that the case analysis is this roadmap's own.
  - Carry the same locators into the four docstrings.

## Verified sound

**Gate, build and scope.**

- I reran the gate:

  ```
  gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- Depcheck, rerun:

  ```
  depcheck: 238 roadmaps, 2319 edges, 0 problem(s)
  ```

- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FuchsianOrbifolds'` is empty.
- The pull request changes only `README.md` and `Suggested.lean`. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are the generated files and are unchanged.
- `lake env lean` on `Suggested.lean` exits 0 in 8.6 s, with seven `declaration uses 'sorry'` warnings (lines 69, 77, 90, 101, 108, 118, 126) and no other diagnostic.

**Signatures.**

- I ran `#check @` on all ten declarations and the `RiemannSurface` exports in one scratch file. The output matches `signatures.md`, and no binder was dropped.
- Compared with the README:
  - `eulerChar_eq_two_sub_two_mul_genus` carries `ChartedSpace ℂ`, `IsManifold 𝓘(ℂ) 1`, `T2Space`, `CompactSpace`, `ConnectedSpace` and `FiniteCWType`, as Layer 5 item 1 states.
  - `riemannHurwitz` carries the same binders for `X` and `Y`. Its two universes are more general than the pinned branched-cover theorem, which puts `X` and `Y` in one universe; the statement is unaffected.
  - The four Layer 4a statements match completion criterion 9 and Layer 4a word for word.
  - `covolume_eq_two_pi_mul_signature` matches Layer 5 item 7.

**Library declarations opened at the pins.**

- 68 names `#check` from `import Mathlib` plus their modules: every backticked library name in the README.
- Three Mathlib instances: `FaithfulSMul PSL(2, ℝ) ℍ`, `FaithfulSMul PGL(2, ℝ) ℍ` (`FixedPoints.lean` 208) and `IsIsometricSMul SL(2, ℝ) ℍ` (`Metric.lean` 329).
- Mathlib definitions read:
  - `UpperHalfPlane.glAction` (`MoebiusAction.lean` 181), with `σ` (91) applying conjugation to `num/denom` when `det < 0`;
  - `UpperHalfPlane.dist_eq` (`Metric.lean` 43);
  - `MeasureTheory.covolume` (`FundamentalDomain.lean` 679).
- Tau Ceti definitions read:
  - `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean` 117): discreteness and finite covolume;
  - `Subgroup.ellipticOrbits` (`Elliptic/Finite.lean` 74): the image of the complement of the free locus;
  - `TauCeti.cardStabilizerOnOrbit` (`GroupTheory/GroupAction/Stabilizer/Basic.lean` 270): `Nat.card` of the stabilizer in `Γ ≤ PSL`, so the effective orders;
  - `TauCeti.FiniteCWType`, which is a `Prop` and homotopy-invariant (`Topology/CWComplex/Classical/FiniteCWType.lean` 91);
  - `TauCeti.eulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean` 123);
  - `TauCeti.RiemannSurface.FiniteHolomorphicMap` (`Degree.lean` 134): holomorphic, takes two values, finite fibres;
  - `TauCeti.RiemannSurface.ramificationDegree` (`Ramification.lean` 78), which is finite for compact `X` by `finite_setOf_one_lt_localMultiplicity`;
  - the branched-cover theorem (`Branch/EulerCharacteristic.lean` 130), which additionally needs `[FiniteCWType ↥f.branchValuesᶜ]`, as Layer 5 item 3 says;
  - `SidePairing.covolume_eq_two_pi_mul` (`Polygon/Area.lean` 129);
  - `TauCeti.one_div_forty_two_le_hyperbolic_deficit` (`Data/Rat/BranchDeficit.lean` 116) and `hyperbolic_deficit_two_three_seven` (196);
  - `MeasureTheory.covolume_pos` (358) and `covolume_eq_card_mul_covolume` (382);
  - `poincareRiemannianMetric_inner` (`PoincareMetric.lean` 135);
  - `CuspDatum` fields (`Cusp/Datum.lean` 169), with `cuspDatum_width_eq_mul` and `cuspDatum_coordinate_eq` (`ChangeScaling.lean` 88, 98).
- Every Mathlib and Tau Ceti file path the README names exists at the pin.

**Cross-roadmap citations resolved, on main.**

- ComplexManifolds Milestones 1–6 (headings at lines 172, 197, 221, 238, 267 and 296).
- AlgebraicTopology:
  - Stage 6 item 4, Poincaré–Lefschetz duality (line 1515);
  - Stage 6 item 5, the intersection pairing (1560);
  - Stage 8 item 7, finite CW type of compact smooth manifolds with marked interior points (1811).
- RiemannianGeometry R4 item 7, the hyperbolic half-space model (717).
- `Completed/UniversalCovers`, `Completed/ConformalMapping` and AlgebraicCurves.
- ComplexKahlerGeometry K7.
- ModularForms §10B (1173) and its `*Needs:*` on Layers 4–5 (1243). The item numbers (v) and (vi) do not resolve (R04).

**Downstream citations, at the heads of their pull requests.** Every id cited exists at this head.

- **TeichmullerGeometry.** Lines 26 and 98 cite Layer 0 items 2–3, Layer 1 items 1–3, Layer 2 item 1, Layer 4 item 5 and Layer 4a. This is exactly the list at README 31–33. Its §10.1 consumes 4a's equality case.
- **ArithmeticFuchsianGroups.** It cites L0, L2 items 4–5, L4 item 5, L4a and L5.
- **GroupActionsOnRiemannSurfaces.** It cites 5.1, 5.3 and 5.6 (its lines 606–633).
- **Other consumers.** AnalyticStableMaps cites 5.1 and 5.3. FuchsianOrbifoldsPartII says the base stops at Layers 0–6. NoncongruenceModularForms, ModularCurvesPartII, MordellLawrenceVenkatesh and the AnalyticNumberTheory parts cite layers only.
- Overlaps tool: no other pull request changes this folder, and no id is dropped.

**Ownership.**

- **TeichmullerGeometry**, downstream, states a topological `Surface.eulerChar_eq_two_sub_two_mul_genus` and `riemannHurwitz` on its own `Surface.genus`. These are a different carrier, and that roadmap names how they differ from the holomorphic formula.
- **BelyiMaps** on main has its analytic `riemannHurwitzAn` inside a block comment and defers to the compact-surface owner (its README line 543).
- **SurfaceTopology**, an open pull request on the never-cite list, states a topological `riemannHurwitz`. This roadmap does not consume it.
- **FuchsianOrbifoldsPartII** owns limit sets and convex cores, none of which is planned here.
- **KleinianGroups** (checked through `roadmaps grep` only) excludes the two-dimensional theory.
- **GroupActionsOnRiemannSurfaces** attributes the `π/21` equality case to TeichmullerGeometry §10.1, which itself cites Layer 4a. That inconsistency is theirs to fix; the owner is single, and it is Layer 4a.
- No other `Suggested.lean` declares into the root `RiemannSurface` namespace.
- The only two-owner object found is `j` (R01).

**Headline theorems** (completion criteria 1–9):

| Criterion | Status |
|---|---|
| 1–5: action, coarse quotient and elliptic ramification, cusps, compactification, descent | At the pin, named in the docstring |
| 6: `χ = 2 − 2g` and genus-form Riemann–Hurwitz | Stated |
| 7: Poincaré's theorem, its converse and triangle groups | At the pin; the genus formula is stated through 5.7 |
| 8: `X(1) ≃ P¹` | At the pin |
| 9: both minima and both equality cases | Stated |

- No statable headline is missing.
- The docstring's claim that none is unstatable holds. L2.1's distance comparison and the `GL` isometry are targets, not completion criteria.

**Padding probe.** I replaced each of the seven `sorry`s with `first | rfl | simp | infer_instance | decide | norm_num | positivity`, and all seven fail. `compactifiedChartedSpace` is padding by reading (R04).

**Shape.** The README keeps main's layout: numbered items, per-layer source spines, a dependency table and acceptance checks. It does not use the `**Summary.**` / `## Exact supplier contracts` form, which 61 of 153 roadmaps on main use. I did not raise a reformat of an existing roadmap. The items this pull request rewrote carry Checks, `*Needs:*` and locators.

**Outside the folder.** The pull request description's depends-on block still lists PlanarTopology and SurfaceTopology, which the README no longer cites. The worker may want to refresh it.

**Adversarial table.**

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `genus` (definition) | `χ = 2, 0, −2, 1, 4` | `((2−χ)/2).toNat = 0, 1, 2, 0, 0`. Wrong model `2−χ`: `0, 2, 4`. Wrong model `(−χ/2).toNat`: `0, 0, 1`. | Both wrong models discriminated; the Check text is wrong (R05) |
| `eulerChar_eq_two_sub_two_mul_genus` | `P¹`; torus; genus 2; `S² ⊔ S²` (not connected); `ℂ` (not compact) | `2 = 2−0`; `0 = 2−2`; `−2 = 2−4`; `4` vs `2`; `1` vs `2` | Holds; the two failing instances are excluded by `ConnectedSpace` and `CompactSpace`, which are in the signature |
| `riemannHurwitz` | `id` on `P¹`; `z²`; `℘ : ℂ/Λ → P¹`; genus 3 → 2 unramified; `j : X(1) → P¹` | `−2 = −2+0`; `−2 = −4+2`; `0 = −4+4`; `4 = 4+0`; `−2 = −2+0`. Sign-flipped form: `−2` vs `−6`. | Holds |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`; `Γ(2)` image; `(2,3,7)`; torsion-free genus 2; `⊥` | `π/3` (pinned) = `2π(−2+1/2+2/3+1)`; `6·π/3 = 2π(−2+3)`; `π/21 = 2π/42`; `4π = 2π·2`; `⊥` has covolume `∞` and is excluded | Holds; the degenerate group is excluded |
| Pinned polygon formula vs 5.7 | `PSL(2,ℤ)` triangle, `n = 3`, `k = 1`, `V = 1` | Polygon: `2π((3−1)/2 − 1 − 1 + 7/6) = π/3`. Cells: `3` vertices, `2` edges, `1` face, so `χ = 2` and `g = 0`. | Agree |
| Pinned level-one `−χ` form vs 5.7's `2g − 2` | `χ(X(1)) = 2` | `−2` vs `2·0 − 2` | Agree |
| `pi_div_twentyOne_le_covolume` | `(2,3,7)`; `PSL(2,ℤ)`; `(2,3,8)`; `(0;2,2,2,3)` | `π/21` against `π/21`, `π/3`, `π/12`, `π/3` | Holds; the hypothesis is satisfiable |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`; `(2,3,8)`; `PSL(2,ℤ)`; `(0;2,2,2,3)` | T/T; F/F (count at `7` is `0`); F/F (a cusp); F/F (count at `2` is `3`) | Both directions hold |
| `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`; `Γ₀(2)`; `Γ(2)`; `(2,3,7)` without the cusp hypothesis | `π/3` against `π/3`, `π`, `2π`; `π/3 ≤ π/21` is false | Holds; `[Nonempty Γ.CuspOrbit]` is needed and present |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`; Hecke `(2,4,∞)`; `Γ₀(2)`; commutator subgroup `(1;−;1)` | T/T; `π/2`: F/F; `π`: F/F (2 cusps); `2π`: F/F (genus 1) | Both directions hold |
| 4a.1 case analysis | `(2;−)`, `(1;2)`, `(0;2,2,2,3)`, `(0;2⁵)`, `(0;2,3,7)`, `(0;2,3,8)`, `(0;2,4,5)`, `(0;2,5,5)`, `(0;3,3,4)`, `(0;2,2,m)`, `(0;2,3,6)`, `(0;3,3,3)`, `(0;2⁴)` | `δ = 2, 1/2, 1/6, 1/2, 1/42, 1/24, 1/20, 1/10, 1/12, −1/m, 0, 0, 0` | Every bound in the text holds; the minimum is unique |
| 4a.2 table | `(2;−;1)`, `(1;−;1)`, `(0;−;3)`, `(0;−;2)`, `(0;2;2)`, `(0;2;1)`, `(0;−;1)`, `(0;2,2;1)`, `(0;2,3;1)`, `(0;2,4;1)`, `(0;3,3;1)`, `(0;2,2,2;1)` | `δ = 3, 1, 1, 0, 1/2, −1/2, −1, 0, 1/6, 1/4, 1/3, 1/2` | Every row holds |
| The `1/42` lemma as 4a uses it | `γ = 0, {2,3,7}`; `{2,2,2,2}` | `1/42 ≥ 1/42`; deficit `0` fails the lemma's positivity hypothesis | Positivity input missing (R02) |
| 5.6: Fuchsian Riemann–Hurwitz and `χ_orb` | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6` | `R = 3+3+4 = 10`, `−2 = −12+10`; `−1 = 6·(−1/6)` | Holds |
| 0.2: `GL` action | `diag(1,−1)` at `1+i` and at `i` | `σ(g)((1+i)/(−1)) = −1+i`; `i ↦ i`; the model without `σ` gives `−1−i ∉ ℍ` | Holds |
| 0.2: isometry and kernel | `dist(1+i,2+i)` against its image; `2·I`; `diag(2,1)` against `diag(√2,1/√2)` | `2 arsinh(1/2)` both; `z`; `2z` both | Holds |
| L2.1: distance and metric | `dist(i,2i)`; `z = w`; `v = w = 1` at `y = 2` | `2 arsinh(1/(2√2)) = log 2 = ∫₁² dy/y` (disc normalisation gives `2 log 2`); `0 = 0`; `1/4` (pinned tensor) = `1/4` (Mathlib density) | Agree |
| Cusp scaling | `σ' = 2σ+1`, `w = 1` | `w' = 2 = a·w`; `q' = exp(πi)·q = −q` | Holds; matches the pinned lemmas |
| Effective-action convention | Stabilizer of `i` in `PSL(2,ℤ)` vs `SL(2,ℤ)` | Orders `2` vs `4`. With `SL` orders the area would be `2π(−2+3/4+5/6+1) = 7π/6 ≠ π/3`. | The statements use the `PSL` orders, as required |
| 1.5 order formula for `j` | `ρ` (`m = 3`); `i` (`m = 2`) | Pinned `ord_ρ j = 3 = 3·1`; `ord_i (j−1728) = 2 = 2·1` | Consistent with degree one |
| Junk values in Riemann–Hurwitz | `ramificationDegree` with infinitely many ramified points | `0` by the `finsum` convention; unreachable for compact `X` | No junk value reached |

## Not verifiable

- **The eight `**Source spine:**` lines** (seeded sample; README 323, 344, 398, 421, 450, 555, 621 and 643). They cite Beardon, Katok, Farkas–Kra, Miranda, Forster, Diamond–Shurman, Serre, Stillwell and Siegel, all at chapter or section level.
- I ran the sources service this round (scratch manifest; the board's manifest was not edited):
  - Katok, *Fuchsian Groups*: no legal source found.
  - Miranda, *Algebraic Curves and Riemann Surfaces*: no legal source found.
  - Beardon: resolves only to a paywalled Springer page.
  - Siegel, Ann. of Math. 46 (1945): only JSTOR, a paywalled host.
  - Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell are Springer titles. In the previous round they resolved only to paywalled pages, and I did not retry them.
- Theorem numbers, pages and hypotheses at these locators are therefore unchecked. The page-level locators R06 asks for will need the same texts.

## Source issues

- none
