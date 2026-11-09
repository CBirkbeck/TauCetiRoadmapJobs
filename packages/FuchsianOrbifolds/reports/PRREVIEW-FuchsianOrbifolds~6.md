# Review of FuchsianOrbifolds (pull request #1168 at 40532c9)

**Verdict:** needs changes

This is an incremental re-review of the 141 lines changed since `1e1ceeb`. There are two findings, both P3; neither is blocking.

- R01 is the unrepaired half of the previous R03.
- R02 is a gap that the repair of the previous R04 opened.

The gate passes. `Suggested.lean` elaborates with seven `sorry` warnings and nothing else.

## R01 (P3) — The compatibility block is still in `Suggested.lean`; its only user is this branch's stale copy of ModularForms

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 48–58: `abbrev CompactifiedQuotient … := Γ.CompactifiedQuotient` and `compactifiedChartedSpace … := inferInstance`;
    - 151–153: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7 and docstring 17–19.
  - README 165–169: "It also declares `CompactifiedQuotient` … and exports the Tau Ceti degree API of Layer 5 item 2 under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation.
  - `compactifiedChartedSpace` restates Tau Ceti's `Subgroup.CompactifiedQuotient.instChartedSpace`.
  - The first `export` is a catalogue of seven renamed Tau Ceti declarations.
  - The README now explains why `RiemannSurface.genus` stays, but names no consumer for any of these.
- **Witness.**
  - `roadmaps grep` over main `bebc607` and the 469 open heads finds no citation of `compactifiedChartedSpace`, `FuchsianOrbifolds.CompactifiedQuotient` or the seven aliases, and no import of this module.
  - Their only user is this branch's `ModularForms/Suggested.lean` 89–99, inherited from base `373d88d`. Main's copy (since `deebc70`) imports only Mathlib and Tau Ceti.
- **Repair.**
  1. Rebase onto main; `git merge-tree` against `bebc607` is clean.
  2. In `Suggested.lean`, delete lines 48–58, the `export TauCeti.RiemannSurface (…)` block and `import TauCeti.Analysis.Complex.RiemannSurface.Divisor.Basic`.
  3. Replace docstring 17–19 with "It exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete the sentence at 165–169 and keep the sentences before and after it.

  Tested on a scratch copy: seven `sorry` warnings and nothing else. `riemannHurwitz` still resolves `RiemannSurface.FiniteHolomorphicMap` through `open TauCeti`. NoncongruenceModularForms writes `CompactifiedQuotient Γ_ℙ` only in prose (its README 652, 1252), and README 169–170 maps that to Tau Ceti's carrier.

## R02 (P3) — L2.1's new route transports completeness and curvature by an unnamed step, and does not state the distance comparison TeichmullerGeometry consumes

- **Location.**
  - README 405–413: "so the map is a Riemannian isometry (this roadmap's own derivation from the two metric formulas). It transports Tau Ceti's completeness … and constant sectional curvature `−1` …".
  - The *Needs:* line (422–426) names no transport theorem.
- **Claim.**
  - The previous text credited the transport to RiemannianGeometry R4 item 7. The repair of the previous R04 removed that citation, so the step now has no named input.
  - The object TeichmullerGeometry consumes is the metric isometry `ℍ ≃ᵢ UpperHalfSpace ℝ` from Mathlib's `dist` to the Riemannian distance. The item reaches it only through a pinned theorem it does not cite.
- **Witness.**
  - Both transport theorems are at the pin, and both `#check`:
    - `TauCeti.RiemannianIsometry.riemannianEDist_eq` (`Riemannian/Isometry/Distance.lean` 58);
    - `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff` (`Riemannian/Isometry/Curvature.lean` 234).
  - TeichmullerGeometry, at its head, consumes "Layer 2 item 1's comparison isometry `ℍ ≃ᵢ UpperHalfSpace ℝ`" (its README 26, 337, 352, 566).
- **Repair.**
  - After "Riemannian isometry", insert: "with the distance comparison above and Tau Ceti's `TauCeti.RiemannianIsometry.riemannianEDist_eq` (`Riemannian/Isometry/Distance.lean`), it is an isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ` from Mathlib's `dist` to the Riemannian distance, and `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff` (`Riemannian/Isometry/Curvature.lean`) transports curvature `−1`".
  - Add both names to the *Needs:* line.
  - Tested:
    - `Φ.hasConstantSectionalCurvature_iff (-1)` elaborates for `Φ : TauCeti.RiemannianIsometry 𝓘(ℝ, ℂ) 𝓘(ℝ, WithLp 2 (ℝ × ℝ)) ℍ (TauCeti.UpperHalfSpace ℝ)`.
    - The `∞`-smooth manifold and metric instances and `T2Space` are found on both sides.
    - On `i, 2i ↦ (0, 1), (0, 2)`, both distances are `log 2`.

## Previous findings

- R01 — repaired: `Suggested.lean` 41 `universe u` and 83 `theorem riemannHurwitz {X Y : Type u}`; README 632–633 "for `X` and `Y` in one universe as in the pinned formula".
- R02 — repaired: README 470–482 cite `…SidePairing.exists_cuspDatum_generator_eq_cycleMap`, `…cuspDatum_generator_eq_cycleMap` and `…meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul` with their hypotheses; the "pins lack" bullet is gone (154–161).
- R03 — partly repaired: README 163–165 now names the citers of `RiemannSurface.genus`, and 169–170 the carrier. `Suggested.lean` 48–58 and 151–153 and README 165–169 remain. Carried as R01.
- R04 — repaired: README 273–276, 405–426 and table row 831 cite Tau Ceti's `UpperHalfSpace` names with `E = ℝ`, and no RiemannianGeometry citation remains. The transport step lost its owner; that is R02.
- R05 — repaired:
  - "(this roadmap's own derivation …)" at 295–296 (L0.1), 326–327 (L0.2) and 666–667 (L5.6);
  - `TauCeti.eulerChar_eq_cwEulerChar` at 679 and in the *Needs:* line at 690;
  - "expected by ModularForms §10A" at 802.

## Verified sound

**Gate, build and supply.**

- I reran the gate on this head:

  ```
  gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- Depcheck, rerun: `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The edge count is one fewer than last round, because the RiemannianGeometry edge was dropped.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean Suggested.lean` gives `sorry` warnings at lines 73, 83, 97, 109, 117, 128 and 137, and nothing else.

**Signatures and padding.**

- I ran `#check @` on all ten declarations and on `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`. Each matches `signatures.md`, and no binder was dropped.
- The only change is that `riemannHurwitz` puts `X` and `Y` in one universe `u_1`.
- Both of its actual uses have source and target in `Type`:
  - `TauCeti.Fuchsian.compactifiedQuotientFiniteHolomorphicMap : FiniteHolomorphicMap Δ.CompactifiedQuotient Γ.CompactifiedQuotient`;
  - `TauCeti.ModularGroup.jSphere : … CompactifiedQuotient → OnePoint ℂ`.
- In a scratch file, the pinned branched-cover formula plus `eulerChar_eq_two_sub_two_mul_genus` proves the `Type v` statement by `linear_combination`.
- Padding probe: each `sorry` was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (norm_num; done) | (positivity; done) | (exact le_rfl; done) | sorry`. All seven fall through to `sorry`.

**Library declarations opened at the pins** (33, file and line):

- **Riemann sphere.**
  - `OnePoint.instChartedSpace`, `OnePoint.invChart` and `OnePoint.instIsManifold` (`Geometry/Manifold/Instances/OnePoint/Basic.lean` 207, 122, 236).
  - The charts read `z ↦ z` off `∞` and `z ↦ z⁻¹`, `∞ ↦ 0`, off `0`, as README 98–102 say.
- **Layer 0 item 2.**
  - Mathlib's `UpperHalfPlane.J := !![-1, 0; 0, 1]` and `coe_J_smul : ↑(J • τ) = -conj ↑τ` (`UpperHalfPlane/MoebiusAction.lean` 380, 382).
  - Tau Ceti's `TauCeti.UpperHalfPlane.isometry_J_smul` (`UpperHalfPlane/Geodesic/Reflection.lean` 94).
  - The only isometric-action instances on `ℍ` at the pins are Mathlib's `IsIsometricSMul SL(2, ℝ) ℍ` (`Metric.lean` 329) and Tau Ceti's `IsIsometricSMul PSL(2, ℝ) ℍ` (`UpperHalfPlane/ProperAction.lean` 46). There is none for `GL(2,ℝ)` or `PGL(2,ℝ)`, so the bullet at README 155 holds.
- **Half-space model.**
  - `TauCeti.UpperHalfSpace` (`Hyperbolic/UpperHalfSpace/Basic.lean` 91), `riemannianMetric` (336) and `inner_def` (379).
  - `completeSpace_of_riemannianMetric` (`Hyperbolic/Completeness.lean` 43), `hasConstantSectionalCurvature` (`UpperHalfSpace/Curvature.lean` 139) and `hyperbolicMetric` (`UpperHalfSpace/Metric.lean` 41).
  - They need `InnerProductSpace ℝ E` and, for the last three, `FiniteDimensional ℝ E`. All of them `#check` at `E = ℝ`.
  - None of the six Tau Ceti files that mention `UpperHalfSpace` mentions Mathlib's `UpperHalfPlane`, so the bullet at README 156–158 holds.
- **Transport and the Poincaré metric.**
  - `TauCeti.RiemannianIsometry.riemannianEDist_eq` and `hasConstantSectionalCurvature_iff` (`Isometry/Distance.lean` 58, `Isometry/Curvature.lean` 234). I built `Isometry.Curvature` first.
  - `UpperHalfPlane.instIsManifoldReal` (ω) and the `∞`-smooth Poincaré metric (`UpperHalfPlane/PoincareMetric.lean` 49, 127, 148).
- **Layer 2 item 5.**
  - `exists_cuspDatum_generator_eq_cycleMap`, `cuspDatum_generator_eq_cycleMap` and `meridian_lift_endpoint_eq_pairingHom_cycleWord_zpow_smul` (`Fuchsian/Cusp/Polygon.lean` 49, 68, 90).
  - Their hypotheses are pairing maps in `Γ` and disjoint nontrivial translates of `interior P.carrier`, plus parabolicity for the first, exactly as README 471–482 state.
  - `CuspDatum.meridian_lift_endpoint` and `meridian_neg` `#check`.
- **Layer 5 and Layer 6.**
  - `TauCeti.eulerChar_eq_cwEulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean` 143), with `X` and `C ⊆ Y` in one universe; `X(Γ) : Type` meets this.
  - `…FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` (`Branch/EulerCharacteristic.lean` 130, `{X Y : Type u}` at 71).
  - `MeasureTheory.covolume_eq_card_mul_covolume`.
  - `TauCeti.ModularGroup.eulerChar_compactifiedQuotient` (`Fuchsian/LevelOne/Signature.lean` 72).
  - `Matrix.SpecialLinearGroup.isClosedEmbedding_val`, `QuotientGroup.instSecondCountableTopology` and `UpperHalfPlane.glAction`.

**Cross-roadmap citations resolved.**

- On main `bebc607`:
  - ComplexManifolds Milestone 3 (221–236) "use[s] Tau Ceti's installed `OnePoint.instChartedSpace`", as README 101–102 say.
  - ModularForms §10A (1150–1171) ends with the level-one Check `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0` (1169) and consumes "the supplied X(1)≃ℙ¹".
  - PseudoholomorphicCurveAnalysis cites `RiemannSurface.genus` (194, 1317, 1378).
- At open heads:
  - NoncongruenceModularForms cites `RiemannSurface.genus` (651, 1400).
  - TeichmullerGeometry (head `8883653c`) cites L0.2 and L2.1 (21, 26, 98, 337, 352, 566).
  - ArithmeticFuchsianGroups (head `f16c1799`) cites L0.2 and L2.1 (108, 113, 409, 507).
  - All of these resolve at this head with the content they expect, apart from the unstated distance comparison of R02.
- No RiemannianGeometry citation remains. No roadmap on the never-cite list is cited.

**Ownership and overlaps.**

- `roadmaps grep` for `UpperHalfSpace ℝ` and `poincareRiemannianMetric` finds only TeichmullerGeometry, which cites this roadmap's L2.1. The comparison has one owner.
- `roadmaps overlaps FuchsianOrbifolds` lists no other pull request changing the folder, and no dropped or revision-only id.

**Sources.**

- The diff changes none of the eight `**Source spine:**` lines (355, 393, 494, 538, 591, 700, 785, 822).
- I reread Martin, Theorems 2.1 and 2.2 (Martin2013 lines 212–227, printed p. 6): `μ(2) = π/21`, attained only by the `(2,3,7)` group, and the signature area formula. Both support the 4a and 5.7 statements as written.
- The new locators are "(this roadmap's own derivation …)" or pinned files. No new external citation enters.

**Remark on untouched text** (no change requested): L2.1's sentence "the `PSL(2,ℝ)` and `PGL(2,ℝ)` actions are then Riemannian isometries by Layer 0 item 2" still passes from distance isometries to Riemannian isometries without naming the step.

**Adversarial table.** Rows marked "r5" carry forward the previous report's values for statements the diff leaves untouched. The other rows are recomputed this round for the changed statements.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `riemannHurwitz` at `{X Y : Type u}` | `id` on `P¹`; `z ↦ z²`; `℘ : ℂ/Λ → P¹`; unramified genus 3 → 2; `X(2) → X(1)`; `jSphere` | `−2 = 1·(−2)+0`; `−2 = 2·(−2)+2`; `0 = 2·(−2)+4`; `4 = 2·2+0`; `−2 = 6·(−2)+10`; `−2 = 1·(−2)+0`. Sign-flipped form at `z²`: `−2` vs `−6`. The two Fuchsian uses live in `Type` (elaborated). | Holds; no use lost | none |
| L2.1 comparison `x + iy ↦ (x, y)` (new target) | At `2i`: `v = w = 1`; `v = w = i`; `v = 1, w = i`. Wrong models: disc `4\|dz\|²/y²`; rescaling `(x, 2y)`; swap `(y, x)` | Poincaré `1/4, 1/4, 0`. Half-space at `(0,2)`: `(1²+0²)/4 = 1/4`, `(0²+1²)/4 = 1/4`, `0`. Disc gives `1`; rescaling gives `1/16`; the swap sends `−1+i` to height `−1`, outside the half-space. | Holds; Check 428–431 discriminates | none |
| L2.1 transport | `φ = −log y` in `e^(2φ)(dx²+dy²)`; disc factor `φ = log 2 − log y`; `dist(i, 2i)` | `K = −e^(−2φ)Δφ = −y²·y⁻² = −1`; `K = −(y²/4)·y⁻² = −1/4`; `2 arsinh(1/(2√2)) = log 2 = ∫₁² dt/t` | Holds; inputs at the pin but unnamed | R02 |
| L0.2 via `J` | `J(1+i)`; `g = [[0,1],[1,0]] = h·J` with `h = [[0,1],[−1,0]]`; `dist(i,2i)` vs `dist(g i, g 2i)` | `−1+i`; `h(J z) = −1/(−conj z) = 1/conj z = g z`, `det h = 1`; `g i = i`, `g(2i) = i/2`; both distances `log 2` | Holds | none |
| L2.5 orientation (pinned) | `PSL(2,ℤ)`, vertex `∞`, `σ = 1`, `w = 1`, `k = 1, −1, 2` | The pinned generator is the cycle map `T: z ↦ z+1`, not `T⁻¹` or `T²`; endpoints `z+1`, `z−1`, `z+2`. One counterclockwise turn of `q = e^(2πiz)` raises `Re z` by `1`. | Matches convention 227–232 | none |
| L5.7 cell count → `eulerChar` | `X(1)`: vertices `[ρ], [i], [∞]`; edges `ρ→∞` and `ρ→i`; one face | `3 − 2 + 1 = 2 = 2 − 2·0`; pinned `eulerChar X(1) = 2` | Consistent with `eulerChar_eq_cwEulerChar` | none |
| L5.6 (locator only) | `X(2) → X(1)`, `d = 6` | `−2 = 6·(−2)+10`; `χ_orb(Γ(2)) = −1 = 6·(−1/6)` | Holds | none |
| L6.1 via §10A | Level one, `(d,ε₂,ε₃,ε∞) = (1,1,1,1)` | `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0`; `((2−2)/2).toNat = 0` | Agree | none |
| Riemann-sphere atlas (98–102, 252) | Point `2`; `∞`; transition; wrong models `z ↦ −1/z`, `z ↦ 1/conj z` | Charts give `2` and `1/2`; `∞ ↦ 0` in the inverted chart; transition `z ↦ z⁻¹`. The wrong models give `−1/2`, and an antiholomorphic transition contradicts `instIsManifold`. | Matches pin and Milestone 3 (226–227) | none |
| Compatibility block (README 163–172) | Its 11 names; consumer grep | All elaborate (the `export` lines compile; four `#check`ed). `RiemannSurface.genus` has 5 citations; the other 10 have 0 outside the stale ModularForms copy. | Partly justified | R01 |
| `genus` (r5) | `χ = 2, 0, −2, 1, 3` | `0, 1, 2, 0, 0`. Wrong models `2−χ` give `0, 2, 4`; `(−χ/2).toNat` gives `0, 0, 1`. | Discriminated | none |
| `eulerChar_eq_two_sub_two_mul_genus` (r5) | `P¹`; torus; genus 2; `X(1)`; `S²⊔S²`; `ℂ` | `2=2`; `0=0`; `−2=−2`; `2=2`; `4` vs `2` (excluded by `ConnectedSpace`); `1` vs `2` (excluded by `CompactSpace`) | Holds | none |
| `covolume_eq_two_pi_mul_signature` (r5) | `PSL(2,ℤ)`; `Γ(2)`; `(2,3,7)`; genus-2 surface group; `⊥` | `π/3`; `2π`; `π/21`; `4π`; `⊥` is not cofinite | Holds | none |
| Effective vs `SL` orders (r5) | Stabilizers of `i`, `ρ` | `PSL` gives `2, 3`. `SL` gives `4, 6`, so `7π/6 ≠ π/3`. | Lean uses `PSL` | none |
| `pi_div_twentyOne_le_covolume` (r5) | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(0;2,2,2,3)`, `PSL(2,ℤ)` | `π/21 ≤ π/21, π/12, π/10, π/3, π/3` | Holds, tight | none |
| `covolume_eq_pi_div_twentyOne_iff` (r5) | `(2,3,7)`; `(2,3,8)`; `PSL(2,ℤ)`; `(0;2,2,2,3)` | T/T; F/F; F/F; F/F | Both directions | none |
| `minimum_area_finite_area_orbifold` (r5) | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)` | `π/3 ≤ π/3, π/2, π, 2π`; `π/21 < π/3` without a cusp | Holds; the cusp hypothesis is needed | none |
| `covolume_eq_pi_div_three_iff` (r5) | `PSL(2,ℤ)`; `(0;2,4;1)`; `Γ₀(2)`; `(1;−;1)` | T/T; F/F; F/F; F/F | Both directions | none |
| 4a.1, 4a.2 deficits (r5) | 13 compact and 12 cusped signatures | Minimum `1/42` at `(0;2,3,7)` and `1/6` at `(0;2,3;1)` | Every bound holds | none |
| L0.1 (r5) | `SecondCountableTopology` for `SL(2,ℝ)` and `PSL(2,ℝ)`; discrete topology | Not synthesized; uncountable discrete space | Target and Checks correct | none |
| Cusp scaling, `j` orders and values (r5) | `σ' = 2σ+1`; `ord_ρ j`, `ord_i(j−1728)`; `j(ρ)`, `j(i)` | `w' = 2`, `q' = −q`; `3`, `2`; `0`, `1728` | Match pins | none |

## Not verifiable

- **Textbook locators.** Theorem numbers, pages and hypotheses are unchanged by this diff and were not verifiable last round either:
  - Katok and Miranda have no legal copy found by the sources service.
  - Beardon, Siegel, Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell are recorded uncertified.
  - This covers the source spines and the in-line locators (Katok §1.2 in L2.1; Forster §17 and Miranda Chapter II §4 in L5.3 and the `riemannHurwitz` docstring; Beardon §10.4 and Katok §4.3 in 5.7 and 4a).
- **Ownership against open pull requests.** Checked through the sibling checkouts this brief lists and `roadmaps grep` only.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the hypothesis names the cusp count with one letter and the area formula with another (lower- versus upper-case n); it should use one letter throughout; affects nothing.
- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the conclusion opens with a doubled article; it should read "Then the hyperbolic area"; affects nothing.
