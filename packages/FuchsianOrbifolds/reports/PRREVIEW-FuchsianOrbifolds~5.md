# Review of FuchsianOrbifolds (pull request #1168 at 1e1ceeb)

**Verdict:** needs changes

This is a full review: the folder changed by 630 lines since `a1a346e`. I reran the gate and it passes every check. `Suggested.lean` elaborates with seven `sorry` warnings and no other diagnostic. All seven sorried headlines hold on every instance in the adversarial table. There are five findings, all P3; none is blocking.

## Previous findings

- **R01 (P2, `j` handed back and forth with ModularForms): repaired.**
  - README 124–132 now reads "Tau Ceti supplies the normalized level-one `j`-function (`TauCeti/Analysis/Complex/ModularForms/LevelOne/JInputs.lean`)", and Layer 6 (745–747) consumes it.
  - All six names `#check` at the pin.
  - With the object at the pin, it has a single owner. ModularForms on main (lines 37–42) still says Layer 6 "is to construct j"; that sentence is ModularForms' to update.
- **R02 (P3, Layer 4a inputs): repaired.**
  - Lines 663–664 read "Tau Ceti's `MeasureTheory.covolume_pos` makes the covolume of a discrete group positive".
  - Both 4a `*Needs:*` lines (690–694, 725–728) list `covolume_pos` and "AlgebraicTopology Stage 8 item 7 with ComplexManifolds Milestone 1".
  - Item 1 no longer uses item 2: "A cusp makes the inequality strict, by the replacement argument" (681–682).
  - The 5.6 `*Needs:*` line (627) lists `MeasureTheory.covolume_eq_card_mul_covolume`.
  - Line 391 attributes `MeasureTheory.covolume` to Mathlib.
- **R03 (P3, pinned results presented as targets): repaired, with one exception.**
  - Lines 145–147: "Each item below names, at its claim, the pinned declarations that prove it, and states as a target only what the pins lack".
  - Layers 0, 1, 3, 4 and 6 and Layer 2 items 2–4 and 6 now cite the pinned names in place. Line 83 cites Mathlib's quotient instances.
  - The exception is Layer 2 item 5, which still plans a theorem that is at the pin (R02 below).
- **R04 (P3, compatibility layer): partly repaired.**
  - The four headlines now write `Γ.CompactifiedQuotient`, and the docstring no longer names a ModularForms consumer.
  - `Suggested.lean` 46–56 and 145–153 remain, and README 159–164 describes them without a purpose.
  - The previous request to delete the whole export block was too broad. `RiemannSurface.genus` is cited on main by PseudoholomorphicCurveAnalysis (README 194, 1317, 1378).
  - R03 below narrows the request.
- **R05 (P3, Check text): repaired.** Lines 574–575 read "the definition `g = (−χ/2).toNat`, which agrees on the sphere, would give `1` here and `0` on the torus".
- **R06 (P3, Layer 4a locators): repaired.**
  - 670–671 cite "(Siegel 1945, pp. 708–718; Martin, Theorem 2.1)".
  - 642 cites "(Martin, Theorem 2.2; Beardon, §10.4; Katok, §4.3)".
  - 712–713 say the cusped case analysis "is this roadmap's own".
  - The four docstrings carry the same locators.
  - Siegel's page range covers the whole article, but Martin's Theorem 2.1 is a theorem-level locator, and I checked it (Martin2013 lines 212–214).

## R01 (P3) — `riemannHurwitz` puts `X` and `Y` in two universes; the pinned formula its route rewrites needs one

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean` 79: `theorem riemannHurwitz {X Y : Type*} …`, which elaborates with `X : Type u_1` and `Y : Type u_2`.
  - README 593–598: "Prove `riemannHurwitz` … by rewriting both Euler characteristics with item 1 … *Needs:* item 1; Tau Ceti `…eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`".
- **Claim.** The route covers only maps between surfaces in one universe. At the statement's generality it needs universe transport, and nothing owns that:
  - `ChartedSpace`/`IsManifold` on `ULift`;
  - `FiniteCWType` and `TauCeti.eulerChar` under `ULift`;
  - degree and ramification under transport.

  None of these is at the pins. `Homeomorph.eulerChar_eq` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` 163) also requires one universe.
- **Witness.** The pinned theorem is stated for `{X Y : Type u}` (`TauCeti/Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean` 71). In a scratch file, applying it by term:
  - elaborates for `X Y : Type u`;
  - fails with a type mismatch for `X : Type v`, `Y : Type w`.
- **Repair.** Add `universe u` and write `theorem riemannHurwitz {X Y : Type u} …`, matching the supplier.
  - Tested: the copy elaborates with seven `sorry` warnings and nothing else, and the pinned formula applies by term at that generality.
  - No consumer uses `riemannHurwitz` in Lean.
  - The alternative is a README target that owns the universe transport.

## R02 (P3) — Layer 2 item 5 plans, as a target the pins lack, a theorem Tau Ceti already proves

- **Location.**
  - README 439–443: "Prove the relation between the orientation of the boundary word and the orientation of meridians in the quotient, against the meridian convention fixed under Pinned conventions", with its `*Needs:*`.
  - 153–154 list it among what "the pins lack".
- **Claim.**
  - The comparison is at the pin.
  - As written, the target also states no hypotheses, no conclusion, no Check and no locator.
- **Witness.** `TauCeti/Analysis/Complex/Fuchsian/Cusp/Polygon.lean` has:
  - `TauCeti.UpperHalfPlane.ConvexPolygon.SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul` (line 90): a meridian lift with `k` signed turns at an ideal vertex ends at the `k`th power of the cycle word;
  - `cuspDatum_generator_eq_cycleMap` (68);
  - `exists_cuspDatum_generator_eq_cycleMap` (49).

  All three `#check` at the pin.
- **Repair.**
  - Replace the last sentence of item 5 and its `*Needs:*` line with: "The orientation of the boundary word agrees with that of the cusp meridians: Tau Ceti's `…SidePairing.exists_cuspDatum_generator_eq_cycleMap`, `…SidePairing.cuspDatum_generator_eq_cycleMap` and `…SidePairing.meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul` (`Fuchsian/Cusp/Polygon.lean`)."
  - Delete the bullet at 153–154.
  - Tested on the level-one cusp. The cycle map `T: z ↦ z + 1` has width `1`. One counterclockwise turn of `q = e^(2πiz)` raises `Re z` by `1`, so the lift ends at `T·z`, as convention 221–223 and the pinned theorem say.

## R03 (P3) — The compatibility names: two have no consumer, one renames a library instance, and the README does not say why the cited one stays

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 46–56: `abbrev CompactifiedQuotient … := Γ.CompactifiedQuotient` and `compactifiedChartedSpace … := inferInstance`;
    - 147–149: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`;
    - docstring 17–19.
  - README 159–164.
- **Claims.**
  - No headline uses the two abbreviations.
  - `compactifiedChartedSpace` restates `Subgroup.CompactifiedQuotient.instChartedSpace`.
  - The first `export` renames Tau Ceti declarations.
  - Only `RiemannSurface.genus` has citations.
- **Witness** (`roadmaps grep` over main and the open heads):
  - `RiemannSurface.genus` is cited by PseudoholomorphicCurveAnalysis (main, README 194, 1317, 1378) and by NoncongruenceModularForms (README 651, 1400).
  - Nothing cites `compactifiedChartedSpace` or the aliases of Tau Ceti names.
  - Main's ModularForms (`deebc70`) imports nothing from this roadmap.
- **Repair.**
  1. Rebase onto main first. This branch's base `373d88d` predates `deebc70`, and its `TauCetiRoadmap/ModularForms/Suggested.lean` 89–99 still `#check`s these names.
  2. Delete `Suggested.lean` 46–57, the `export TauCeti.RiemannSurface (…)` lines and the import `TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`. Keep `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`.
  3. Drop "It also names … `RiemannSurface.*`" from the docstring.
  4. Replace README 159–162 with: "`Suggested.lean` also exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`, the names under which PseudoholomorphicCurveAnalysis and NoncongruenceModularForms cite them; the carrier written `CompactifiedQuotient Γ` elsewhere is Tau Ceti's `Γ.CompactifiedQuotient`."

  Tested on a scratch copy: seven `sorry` warnings and nothing else.

## R04 (P3) — L2.1 cites RiemannianGeometry R4 item 7 for half-space completeness and curvature that are at the Tau Ceti pin

- **Location.**
  - README 387–389: "Identify this metric, through `x + iy ↦ (x, y)`, with the dimension-two half-space model of RiemannianGeometry R4 item 7, which transports completeness and curvature `−1`".
  - Also `*Needs:*` 397–399, line 264 and the L2 row of the table at 786.
- **Claim.** What is consumed is at the pin, and the cited roadmap item itself defers to it.
- **Witness.**
  - `TauCeti.UpperHalfSpace.hyperbolicMetric` (`TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.lean` 41): the complete metric `(‖dx‖² + dt²)/t²`, of curvature `−1`.
  - `completeSpace_of_riemannianMetric` (`Hyperbolic/Completeness.lean` 43).
  - `hasConstantSectionalCurvature` (`UpperHalfSpace/Curvature.lean` 139).
  - RiemannianGeometry on main, line 733: "Native `UpperHalfSpace` already has its Riemannian distance; consume it."
- **Repair.**
  - In those four places, cite the three Tau Ceti names with `E = EuclideanSpace ℝ (Fin 1)`.
  - Keep as the owned target the identification of `TauCeti.UpperHalfPlane.poincareRiemannianMetric` with `TauCeti.UpperHalfSpace.riemannianMetric` under `x + iy ↦ (x, y)`: no file at the pin mentions `UpperHalfPlane` there.
  - Tested on `v = w = 1` at `y = 2`: both tensors give `1/4`.

## R05 (P3) — Three owned theorems lack a locator, one route input is missing from `*Needs:*`, and one cross-roadmap locator names the wrong subsection

- **Location and claims.**
  - Three owned targets carry no locator:
    - Layer 0 item 1, second countability (279–285);
    - Layer 0 item 2, the `GL(2,ℝ)` isometry (307–313);
    - Layer 5 item 6, Fuchsian Riemann–Hurwitz and `χ_orb` multiplicativity (621–627).

    The layer source spines are chapter-level.
  - Layer 5 item 7's route identifies the polygon cell count with `TauCeti.eulerChar X(Γ)`, but its `*Needs:*` (645–647) omits the theorem that does this.
  - Layer 6 item 1 (757–758) says "`genus X(1) = 0`, expected by ModularForms §10B". (That wording came from the previous review's suggested text.)
- **Witness.**
  - The identification theorem is Tau Ceti's `TauCeti.eulerChar_eq_cwEulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean` 143).
  - ModularForms §10B on main (1173–1246) never uses the genus of `X(1)`. §10A's genus formula and its level-one Check (around 1160–1166) do: `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0`.
- **Repair.**
  - Give each of the three items either a theorem-level textbook locator or "(this roadmap's own derivation from …)", as 4a.2 does.
  - Add `TauCeti.eulerChar_eq_cwEulerChar` to the 5.7 `*Needs:*` line.
  - Write "expected by ModularForms §10A".

## Verified sound

**Gate, build and dependencies.**

- I reran the gate:

  ```
  gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- Depcheck, rerun: `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FuchsianOrbifolds'` is empty, and `git merge-tree` against main is clean.
- `lake env lean` on `Suggested.lean` gives seven `declaration uses 'sorry'` warnings (lines 71, 79, 93, 105, 113, 124, 133) and nothing else.

**Signatures.**

- `#check @` on all ten declarations matches `signatures.md`. No binder was dropped.
- Each signature has the generality of its README statement, except the universes of `riemannHurwitz` (R01).

**Padding probe.** I replaced each `sorry` with `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (norm_num; done) | (positivity; done) | (exact le_rfl; done) | sorry`. All seven fall through to `sorry`. `compactifiedChartedSpace` is padding by reading (R03).

**Headline theorems** (completion criteria 1–9):

| Criterion | Status |
|---|---|
| 1–5 | At the pin, named in the docstring |
| 6 | Stated (`eulerChar_eq_two_sub_two_mul_genus`, `riemannHurwitz`) |
| 7 | At the pin; the genus formula is stated through `covolume_eq_two_pi_mul_signature` |
| 8 | At the pin (`TauCeti.ModularGroup.jBiholomorph`) |
| 9 | Stated (four theorems) |

No statable headline is absent.

**Library declarations opened at the pins.**

- 158 backticked library names in the README `#check`, from `import Mathlib` plus 75 Tau Ceti modules. I built `Compactification.Conj`, `Cusp.Meridian`, `Elliptic.Linearizing` and `FreeLocus` first.
- Instance search fails for `SecondCountableTopology SL(2, ℝ)` and `SecondCountableTopology PSL(2, ℝ)`, as README 283 says. It succeeds for `T2Space PSL(2, ℝ)`, `IsTopologicalGroup PSL(2, ℝ)`, `FaithfulSMul`, `ContinuousSMul` and `IsIsometricSMul PSL(2, ℝ) ℍ`, and for `IsIsometricSMul SL(2, ℝ) ℍ`.
- Definitions read:
  - `Subgroup.IsCofinite` (`Fuchsian/Covolume.lean` 117): discreteness and covolume `≠ ∞`;
  - `Subgroup.ellipticOrbits` (`Elliptic/Finite.lean` 74);
  - `TauCeti.cardStabilizerOnOrbit` (`GroupTheory/GroupAction/Stabilizer/Basic.lean` 270): stabilizer order in `Γ ≤ PSL`;
  - `TauCeti.eulerChar` (`FiniteCWType.lean` 123) with `eulerChar_eq_cwEulerChar` (143) and `Homeomorph.eulerChar_eq` (163);
  - `TauCeti.ModularForm.j = E₄³/Δ` (`JInputs.lean` 93);
  - `MeasureTheory.covolume` (Mathlib `FundamentalDomain.lean` 679);
  - `MeasureTheory.covolume_pos` and `covolume_eq_card_mul_covolume` (Tau Ceti `MeasureTheory/Group/FundamentalDomain.lean` 358, 382);
  - `TauCeti.one_div_forty_two_le_hyperbolic_deficit`, with hypotheses all orders `≥ 2` and a positive deficit;
  - `SidePairing.covolume_eq_two_pi_mul` (`Polygon/Area.lean` 129), whose docstring states that the cell-count identification, Layer 5 item 7's target, "is not proved here";
  - `QuotientGroup.instSecondCountableTopology` (needs `SecondCountableTopology G`) and `Matrix.SpecialLinearGroup.isClosedEmbedding_val`.
- Every "pins lack" claim of 149–157 except Layer 2 item 5 survives grep:
  - no `SecondCountableTopology` for `SL`/`PSL`;
  - no `GL` isometry instance;
  - no comparison of the Poincaré Riemannian distance with `dist` on `ℍ`;
  - no Riemann-surface `genus`, `π/21` or cusped minimum.

**Cross-roadmap citations resolved, on main.**

- ComplexManifolds Milestones 1–6 (headings 172–296).
- AlgebraicTopology:
  - Stage 6 item 2 (graded commutativity, 1056), item 4 (Poincaré–Lefschetz, 1515) and item 5 (intersection pairing, 1560);
  - Stage 8 item 7 (finite CW type with marked points, 1811).
- RiemannianGeometry R4 item 7 (717).
- ComplexKahlerGeometry K7 (1405; `b₁ = 2g`).
- ModularForms:
  - §10A (1150) and §10D (1313) consume `X(1) ≃ ℙ¹`;
  - §10B (1173) compares the analytic genus with Layer 5's;
  - its supplier block (285) agrees with README 118–123.
- `Completed/UniversalCovers`, `Completed/ConformalMapping` and AlgebraicCurves exist.
- The roadmaps on the never-cite list are not cited.

**Downstream citations, at the open heads.**

- TeichmullerGeometry cites Layer 0 item 2, Layer 1, Layer 2 item 1, Layer 4 item 5 and Layer 4a, whose equality case its §10.1 consumes (line 1007).
- ArithmeticFuchsianGroups, at its head `f16c1799`, cites Layer 0 items 1–3, L2.1, Layer 2 items 4–5, Layer 4 item 5, Layer 4a and Layer 5 items 5–7 (its README 210–223). This matches README 35–37.
- GroupActionsOnRiemannSurfaces cites 5.1, 5.2, 5.3 and Layer 2 items 3–6.
- NoncongruenceModularForms cites 5.1, 5.3, 5.5–5.6, 6.4, 0.5, 2.1 and 2.3.
- ModularCurvesPartII cites Layer 4 item 4. AnalyticStableMaps cites 5.1 and 5.3. CongruenceSpectralGap cites Layers 0–3, 4.5 and 6.1. HilbertModularSurfaces cites Layers 1 and 3 and 6.1.
- All of these resolve at this head with the same content.
- One downstream inaccuracy is that roadmap's to fix, not this one's: NoncompactQuantumSymmetry (its line 1593) names a consumer "FuchsianOrbifolds L9", which neither main nor this head has.

**Ownership.**

- The closest roadmaps in vocabulary are FuchsianOrbifoldsPartII, NoncongruenceModularForms, TeichmullerGeometry, ConformalMappingPartII and GroupActionsOnRiemannSurfaces. None owns the genus, Riemann–Hurwitz, the area formula or the minima:
  - FuchsianOrbifoldsPartII starts after Layers 0–6;
  - GroupActionsOnRiemannSurfaces takes `π/21` through TeichmullerGeometry §10.1, which cites Layer 4a;
  - TeichmullerGeometry's `Surface.genus` and `riemannHurwitz` are on topological surfaces and downstream;
  - BelyiMaps' `riemannHurwitzAn` on main sits inside a block comment and defers to the compact-surface owner.
- No other `Suggested.lean` declares into the root `RiemannSurface` namespace.
- Overlaps: no other pull request changes this folder, and no id is dropped.

**Shape.**

- The README keeps main's numbered-item layout, not the `**Summary.**` / supplier-contract form. As in the previous round, I did not ask for a reformat of an existing roadmap.
- `genus` has four discriminating Checks. Every rewritten item has `*Needs:*`, and every theorem item has Checks.
- There are no process words, PR numbers, LaTeX or `lemma`.

**Adversarial table.**

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `genus` (definition) | `χ = 2, 0, −2, 1 (RP²), 3` | `((2−χ)/2).toNat = 0, 1, 2, 0, 0` (ℤ division, `(−1)/2 = −1`). Wrong model `2−χ`: `0, 2, 4`. Wrong model `(−χ/2).toNat`: `0, 0, 1`. | Both wrong models discriminated by the Checks at 572–575 | none |
| `eulerChar_eq_two_sub_two_mul_genus` | `P¹`; torus; genus 2; `X(1)`; `S²⊔S²`; `ℂ` | `2=2`; `0=0`; `−2=−2`; pinned `χ(X(1)) = 2` and `genus X(1) = 0` by `simp` (elaborated); `4` vs `2` (excluded by `ConnectedSpace`); `1` vs `2` (excluded by `CompactSpace`) | Holds | none |
| `riemannHurwitz` | `id` on `P¹`; `z²`; `℘`; unramified genus 3 → 2; `jSphere` (degree 1); `X(2) → X(1)` | `−2=−2+0`; `−2=−4+2`; `0=−4+4`; `4=4+0`; `−2=−2+0`; `−2=−12+10`. Sign-flipped form at `z²`: `−2` vs `−6`. | True | R01 |
| Pinned branched-cover formula on the `riemannHurwitz` route | `X Y : Type u`; `X : Type v`, `Y : Type w` | Applies by term (elaborated); type mismatch (elaborated) | Route covers one universe only | R01 |
| `covolume_eq_two_pi_mul_signature` | `PSL(2,ℤ)`; `Γ(2)`; `(2,3,7)`; genus-2 surface group; `⊥` | `2π(−2+1/2+2/3+1) = π/3` (pinned); `2π(−2+3) = 2π = 6·π/3`; `π/21`; `4π`; covolume `∞`, not cofinite | Holds | none |
| Effective vs `SL` orders | Stabilizers of `i` and `ρ` | `PSL`: `2, 3`. `SL`: `4, 6`, giving `2π(−2+3/4+5/6+1) = 7π/6 ≠ π/3`. | Lean uses the `PSL` orders | none |
| Pinned polygon count vs 5.7 | `PSL(2,ℤ)`: `n=3`, `k=1`, `V=1`, `s=1` | `(n−k)/2−1−V = −1 = 2g−2+s` at `g=0`. Cells: `3−2+1 = 2`. | Agree | R05 (`*Needs:*`) |
| `pi_div_twentyOne_le_covolume` | `(2,3,7)`; `(2,3,8)`; `(2,4,5)`; `(0;2,2,2,3)`; `PSL(2,ℤ)` | `π/21` against `π/21`, `π/12`, `π/10`, `π/3`, `π/3` | Holds; tight | none |
| `covolume_eq_pi_div_twentyOne_iff` | `(2,3,7)`; `(2,3,8)`; `PSL(2,ℤ)`; `(0;2,2,2,3)`; `m = 0, 1` | T/T; F/F (count at `7` is `0`); F/F (a cusp); F/F (count at `2` is `3`); counts `0 = 0` | Both directions hold | none |
| `minimum_area_finite_area_orbifold` | `PSL(2,ℤ)`; Hecke `(0;2,4;1)`; `Γ₀(2)`; `Γ(2)`; `(2,3,7)` | `π/3` against `π/3`, `π/2`, `π`, `2π`; `π/21 < π/3` without a cusp | Holds; `[Nonempty Γ.CuspOrbit]` is needed and present | none |
| `covolume_eq_pi_div_three_iff` | `PSL(2,ℤ)`; `(0;2,4;1)`; `Γ₀(2)`; `(1;−;1)` | T/T; F/F (count at `4` is `1`); F/F (two cusps); F/F (genus 1) | Both directions hold | none |
| 4a.1 case analysis | `(2;−)`, `(1;2)`, `(0;2,2,2,3)`, `(0;2⁵)`, `(0;2,3,7)`, `(0;2,3,8)`, `(0;2,4,5)`, `(0;2,5,5)`, `(0;3,3,4)`, `(0;2,2,m)`, `(0;2,3,6)`, `(0;3,3,3)`, `(0;2⁴)` | `δ = 2, 1/2, 1/6, 1/2, 1/42, 1/24, 1/20, 1/10, 1/12, −1/m, 0, 0, 0` | Every bound holds; the minimum is unique | none |
| 4a.1 cusp replacement | `(0;2,3;1)` with `m = 7` and `m = 6`; `(1;−;1)` with `m = 2` | `1/6 − 1/7 = 1/42`, so `1/6 > 1/42`; at `m = 6` the deficit is `0` and the lemma does not apply; `1 − 1/2 = 1/2` | Argument and Check correct | none |
| Deficit lemma hypotheses | `γ = 0` with `{2,3,7}`; `γ = 0` with `{2,2,2,2}` | `1/42 ≤ 1/42`; deficit `0` fails `0 < …` | Positivity supplied by `covolume_pos` | none |
| 4a.2 table | `(2;−;1)`, `(1;−;1)`, `(0;−;3)`, `(0;−;2)`, `(0;2;2)`, `(0;2;1)`, `(0;−;1)`, `(0;2,2;1)`, `(0;2,3;1)`, `(0;2,4;1)`, `(0;3,3;1)`, `(0;2,2,2;1)` | `δ = 3, 1, 1, 0, 1/2, −1/2, −1, 0, 1/6, 1/4, 1/3, 1/2` | Every row holds | none |
| 5.6: Fuchsian Riemann–Hurwitz and `χ_orb` | `X(2) → X(1)`, `d = 6` | `R = 3+3+4 = 10`, `−2 = −12+10`; `−1 = 6·(−1/6)` | Holds | R05 (locator) |
| L2.5 orientation (pinned) | `PSL(2,ℤ)` cusp, `T: z ↦ z+1`, `w = 1` | One counterclockwise turn of `q` gives `Re z + 1`, endpoint `T·z`; the pinned theorem gives cycle word`^k` | Consistent with 221–223 | R02 |
| L2.1 half-space comparison | Poincaré tensor vs `UpperHalfSpace (EuclideanSpace ℝ (Fin 1))`, `v = w = 1`, `y = 2`; `dist(i, 2i)` | `1/4` both; `∫₁² dy/y = log 2 = 2 arsinh(1/(2√2))` | Agree | R04 |
| L0.1 | `SecondCountableTopology` on `SL(2,ℝ)` and `PSL(2,ℝ)`; discrete topology on `PSL(2,ℝ)` | Not synthesized (elaborated); Hausdorff but uncountable | Target and Checks correct | R05 (locator) |
| L0.2 | `diag(1,−1)` at `1+i` and at `i`; `dist(1+i, 2+i)` | `−1+i`; `i`; `2 arsinh(1/2)` on both sides; without conjugation, `−1−i ∉ ℍ` | Holds | R05 (locator) |
| Cusp scaling | `σ' = 2σ+1`, `w = 1` | `w' = 2`; `q' = exp(πi)·q = −q` | Matches the pinned lemmas | none |
| Layer 6 orders | `ord_ρ j`, `ord_i (j−1728)` | Pinned `3` and `2`; local multiplicity of `jQuotient` is `1 = 3/3 = 2/2` | Consistent with degree one | none |
| L6.1 genus | `χ(X(1)) = 2` | `((2−2)/2).toNat = 0` (`simp`); the §10A level-one Check gives `0` | Holds; cite §10A | R05 |
| `j` convention | `j = E₄³/Δ`, values at `ρ` and `i` | Pinned definition; `jBiholomorph_ρ = 0`, `jBiholomorph_I = 1728` | Matches 124–132 | none |
| L2.1 Checks | Ideal triangle `0, 1, ∞`; region `|x| ≤ 1/2, |z| ≥ 1` | `π − 0 = π`; `π − 2π/3 = π/3` | Correct | none |

## Not verifiable

- **The eight sampled `**Source spine:**` lines** (README 337, 375, 455, 499, 552, 656, 741, 777).
  - Verified:
    - Martin, Theorems 2.1 and 2.2 (Martin2013 lines 212–227, printed p. 6). Theorem 2.1 gives `μ(2) = π/21` over lattices of `Isom⁺(H²)`, attained only by the `(2,3,7)` group. Theorem 2.2 is the signature area formula, as Layer 5 item 7 and Layer 4a state them.
    - The two Mathlib files of the Layer 0 spine (`UpperHalfPlane/ProperAction.lean`, `UpperHalfPlane/FixedPoints.lean`) and Tau Ceti's `JInputs.lean` exist with the cited content.
  - Not verifiable: theorem numbers, pages and hypotheses in the textbooks these lines cite.
    - Katok, Miranda: the sources service, run this round, found no legal source.
    - Beardon, Siegel: recorded uncertified, paywalled.
    - Forster, Farkas–Kra, Diamond–Shurman, Serre, Stillwell: Springer titles that earlier rounds found only behind paywalls.
- **The same texts at their in-line locators**: Katok §1.2 (L2.1), Miranda Chapter II §4 (5.1), Forster §17 (5.3), Beardon §10.4 and Katok §4.3 (5.7, 4a).
- **Not in the board's `sources.toml`**: seven cited works (Katok, Miranda, Forster, Farkas–Kra, Diamond–Shurman, Serre, Stillwell). This review edits no manifest.
- **Ownership against open pull requests**: checked through the sibling checkouts and `roadmaps grep` only.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the hypothesis calls the number of punctures `n`, but the area formula writes it as `N`; it should use one letter for the cusp count throughout; affects nothing.
- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the conclusion begins with a doubled article, "The the"; it should read "Then the"; affects nothing.
