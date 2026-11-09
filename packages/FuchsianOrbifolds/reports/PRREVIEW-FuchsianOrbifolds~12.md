# Review of FuchsianOrbifolds (pull request #1168 at cafadfb)

**Verdict:** needs changes

This is an incremental re-review of the 3 lines of `README.md` that changed since `bc1fbab` (README 161–165, the Layer 2 item 1 bullet under "Implemented in Tau Ceti"), together with the text that cites or depends on them. `Suggested.lean` is unchanged, and nothing changed outside the folder.

The changed lines are correct. R01 of the previous review is not repaired, so it is carried below. It is P3 and the only finding; nothing is blocking. The gate passes, and `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else.

## R01 (P3) — The compatibility block in `Suggested.lean` has no consumer once main is merged

*Carried from R01 of reviews ~6 to ~11.* The board has no repair report that marks this finding not actionable.

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 64–74: `abbrev CompactifiedQuotient (Γ : Subgroup PSL(2, ℝ)) : Type := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 167–169: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7;
    - docstring 17–20.
  - `README.md` 172–176, from "It also declares `CompactifiedQuotient`" to "under the same short names `RiemannSurface.*`." (one line lower than before, because of the inserted line).
- **Claim.**
  - No headline uses either abbreviation, and both restate pinned Tau Ceti declarations.
  - The first `export` is a catalogue of seven renamed library declarations, which the form rules exclude.
  - Their only user is the branch's merge-base copy of `TauCetiRoadmap/ModularForms/Suggested.lean` (lines 2 and 89–99). Main has replaced that file.
- **Witness.**
  - Main's `TauCetiRoadmap/ModularForms/Suggested.lean` imports Mathlib and three `TauCeti.*` modules only (lines 2–5).
  - `git merge-tree --write-tree HEAD origin/main` is clean, and its ModularForms file has 0 occurrences of `FuchsianOrbifolds` or `RiemannSurface.`.
  - Searches of main and every open head:
    - `roadmaps grep --fixed 'FuchsianOrbifolds.Suggested'` finds no match;
    - `--lean-only` searches find no use of the two abbreviations or the seven exported names outside this file.
- **Repair.**
  1. Merge `origin/main` into the branch, so that `TauCetiRoadmap/ModularForms/Suggested.lean` becomes main's file. Without this step, the targeted build of `TauCetiRoadmap.ModularForms.Suggested` breaks. If the repair job may not merge, the operator does this step.
  2. In `Suggested.lean`:
     - delete 64–75 and import line 7;
     - delete 167–169, keeping `namespace RiemannSurface` and `export TauCetiRoadmap.FuchsianOrbifolds (genus riemannHurwitz)`, because NoncongruenceModularForms (README 651, 1400) and PseudoholomorphicCurveAnalysis (194, 1317, 1378) cite `RiemannSurface.genus`;
     - shorten comment 163–164 to name those two short names only.
  3. In docstring 17–20, replace everything after "the one definition they need, `genus`" with ", and exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete 172–176 from "It also declares" to "short names `RiemannSurface.*`.". Keep the next sentence, "The carrier written `CompactifiedQuotient Γ` in other roadmaps is Tau Ceti's `Γ.CompactifiedQuotient`", which serves NoncongruenceModularForms README 1252.

  Retested at this head on a scratch copy with step 2 applied:
  - The copy elaborates with 8 `sorry` warnings and nothing else.
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve.
  - `riemannHurwitz` still elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap` through `open TauCeti`.

## Previous findings

- R01 — not repaired: `Suggested.lean` 66–74 still declares `abbrev CompactifiedQuotient` and `compactifiedChartedSpace`, and 167–169 still `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree …)`; README 172–176 still describes them.

## Verified sound

**The changed lines (README 161–165).** The Layer 2 item 1 bullet now adds "the constant curvature `−1` and the completeness of the Poincaré metric carried along them".

- **Agreement with Layer 2 item 1.** This matches L2.1 (e) and (f) (README 461–470):
  - (e) transports curvature `−1` along the Riemannian isometry of (c), with `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff` and `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`;
  - (f) transports completeness along the distance comparison (b), with Mathlib's `ProperSpace ℍ`.
  - "Them" covers both comparisons, so each property is carried along one of the listed identifications.
- **Agreement with the rest of the README.** It also matches completion item 10 (README 72–77) and the foundations bullet on `TauCeti.UpperHalfSpace.hyperbolicMetric` (README 280–283).
- **The previous remark is addressed.** Review ~11's remark on untouched text was that the open-target list did not name L2.1 (e) and (f). The list now names all six L2.1 targets (a)–(f).
- **The pins lack both targets.**
  - `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean` is the only file at the pin that mentions `poincareRiemannianMetric`. Its public declarations (lines 49, 127, 135, 144, 148, 153, 181) are the atlas, the metric, `poincareRiemannianMetric_inner`, three bundle instances and `riemannianVolume_eq_volume`. None concerns curvature or completeness.
  - No `HyperbolicMetric` on `ℍ` exists at the pin. The only explicit one is the half-space's (`Hyperbolic/UpperHalfSpace/Metric.lean` 41, fields `complete` and `curvature`).
  - In a scratch file, both targets elaborate as statements, and `infer_instance` closes neither:
    - (e) as `(leviCivitaConnection 𝓘(ℝ, ℂ) ℍ).HasConstantSectionalCurvature (isMetricCompatible_leviCivitaConnection 𝓘(ℝ, ℂ)) (-1)`;
    - (f) as `CompleteSpace ℍ` for the uniform structure of `TauCeti.MetricSpace.ofRiemannianMetric 𝓘(ℝ, ℂ) ℍ`.
- **Names resolved at the pin** (`#check @`):
  - `TauCeti.RiemannianIsometry.hasConstantSectionalCurvature_iff` (`Riemannian/Isometry/Curvature.lean` 234);
  - `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature` (`Hyperbolic/UpperHalfSpace/Curvature.lean` 139);
  - `TauCeti.UpperHalfSpace.hyperbolicMetric`, `TauCeti.RiemannianIsometry.riemannianEDist_eq`, `TauCeti.MetricSpace.ofRiemannianMetric`, `TauCeti.Isom`, `TauCeti.UpperHalfPlane.poincareRiemannianMetric`;
  - Mathlib's `UpperHalfPlane.dist_eq` (stated as `2 * arsinh(dist z w / (2√(Im z Im w)))`), `IsRiemannianManifold`, and the instances `ProperSpace ℍ` and `CompleteSpace ℍ`;
  - `IsManifold 𝓘(ℝ, ℂ) ∞ ℍ` is found by `inferInstance`, as (e) requires.

**Gate, dependencies, elaboration.**

- Gate rerun on this head: every check `=0`, OK. The worker's gate, including the targeted build, also passed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Depcheck output: `depcheck: 236 roadmaps, 2281 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. FuchsianOrbifolds is line 49 of the merge order; ArithmeticFuchsianGroups and TeichmullerGeometry are at 284 and 285.
- `lake env lean` on `Suggested.lean`: 8 `sorry` warnings (lines 61, 89, 99, 113, 125, 133, 144, 153) and nothing else.
- The file is unchanged since `bc1fbab`. The 11 elaborated types in `signatures.md` still match the README statements, with no dropped binder.

**Cross-roadmap citations and overlaps.**

- The change cites no other roadmap and adds no owned object.
- `citations.md` lists one lead, `RiemannSurface.riemannHurwitz` (README 171). It is this file's own export, and it resolves.
- `overlaps.md` lists no dropped, conflicting or revision-only id. Ownership against the open pull requests was checked with the `roadmaps` tools at their heads.

**Seeded sample.** The 8 "Source spine:" lines are now at README 362, 400, 558, 602, 655, 811, 896 and 933, shifted by one line and textually unchanged. None falls in the changed passage. Review ~10 checked six of them and review ~11 the two that changed then. The changed lines carry no locator; L2.1 (e) and (f) are library compositions.

**Adversarial table.** Rows marked *(~11)* or *(~10)* carry the values computed in those reviews, for statements this change leaves untouched. The first two rows are computed here.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Open-target list, L2.1 bullet: curvature `−1` (changed) | Poincaré `λ = 1/y`; wrong models `λ² = 1/y`, `λ = 2/y`; half-space `E = ℝ` | `K = −Δ log λ / λ²`. For `λ = 1/y`: `Δ(−log y) = 1/y²`, so `K = −1`. For `λ² = 1/y`: `K = −1/(2y)`, not constant. For `λ = 2/y`: `K = −1/4`. The half-space tensor at `(0, 2)` is `1/4`, equal to the Poincaré tensor at `2i` | the claim and (e) hold; the pin has no curvature theorem for `poincareRiemannianMetric` |
| Open-target list, L2.1 bullet: completeness (changed) | `zₙ = i·2⁻ⁿ`; wrong model: the Euclidean metric on `ℍ` | `dist_eq`: `2 arsinh(2⁻ⁿ⁻¹/(2·2⁻ⁿ⁺¹ᐟ²)) = 2 arsinh(1/(2√2)) = 2(0.34657) = 0.69315 = log 2` for each consecutive pair, so the sequence is not Cauchy. Euclidean: `|zₙ − zₙ₊₁| = 2⁻ⁿ⁻¹ → 0`, with limit `0 ∉ ℍ`, so that metric is incomplete | the claim and (f) hold; at the pin, `infer_instance` fails for the Riemannian-distance form |
| R01 block: `CompactifiedQuotient`, `compactifiedChartedSpace`, exports | users on main, at the open heads, in the merged tree | `0` imports of the module; `0` uses of the 9 names; the merged ModularForms file has `0` occurrences; the repair copy gives 8 `sorry` warnings | the block has no consumer (R01) |
| L2.6 triangle group *(~11)* | `(2,3,7)`, `(2,3,cusp)` | triangle area `π/42`, `Δ` covolume `π/21`, index `2`; `(2,3,cusp)`: `π/6`, `π/3`; relators `{x^a, y^b, z^c, zyx}` by `rfl`; `order cusp = 0` | holds |
| L5.6 Fuchsian Riemann–Hurwitz *(~11)* | `Γ(2) ≤ PSL(2,ℤ)`, `d = 6`; `Γ′ = Γ` | `R = 10`, `−2 = 6(−2) + 10`; `χ_orb = −1/6`, `−1 = 6(−1/6)`; elaborates given both `FiniteCWType` instances | holds |
| `covolume_eq_two_pi_mul_signature` *(~11)* | `PSL(2,ℤ)`, `(2,3,7)`, torsion-free genus 2, trivial group | `π/3`, `π/21`, `4π`; trivial group not cofinite (LHS `∞`, RHS `0`) | holds; README and Lean generalities equal |
| `isRiemannianManifold_upperHalfPlane` *(~10)* | `(i, 2i)`, `(i, 1+i)`, `z = w` | `log 2 = log 2`; `arcosh(3/2) ≈ 0.9624 < 1`; `0 = 0` | holds |
| `genus` *(~10)* | `P¹`, torus, genus 2, `RP²` | `χ = 2, 0, −2, 1` give `0, 1, 2, 0` (the last is junk) | determines the genus |
| `eulerChar_eq_two_sub_two_mul_genus` *(~10)* | `P¹`, torus, genus 2, `X(1)` | `2 = 2`, `0 = 0`, `−2 = −2`, `χ(X(1)) = 2` | holds |
| `riemannHurwitz` *(~10)* | `id`, `z²`, `zⁿ`, `℘`, unramified 2:1 | `−2 = −2`; `−2 = −4 + 2`; `−2 = −2n + 2(n − 1)`; `0 = −4 + 4`; `4 = 4 + 0`; with `−R`, `z²` gives `−6` | holds |
| `pi_div_twentyOne_le_covolume` *(~10)* | `(0;2,3,7)`, `(0;2,3,8)`, `PSL(2,ℤ)`, `(0;2,2,2,3)` | `π/21`, `π/12`, `π/3`, `π/3` | holds |
| `covolume_eq_pi_div_twentyOne_iff` *(~10)* | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)` | true/true; `π/12` false and count at `7` is `0`; false with a cusp | both directions agree |
| `minimum_area_finite_area_orbifold` *(~10)* | `PSL(2,ℤ)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)` | `π/3`, `π`, `2π`; without a cusp `π/21 < π/3` | the cusp hypothesis is needed |
| `covolume_eq_pi_div_three_iff` *(~10)* | `PSL(2,ℤ)`, `Γ₀(2)`, `(0;2,4;1)` | true/true; `π` with `2` cusps; `π/2` with count `0` at `3` | both directions agree |
| L2.1 tensor Checks *(~10)* | `diag(2,1)` at `i`; `−1/z` at `2i`; half-space at `2i` | `1 = 1`; `1/4 = 1/4`; `1/4 = 1/4` | conventions pinned |

The remaining rows of review ~11's table (L5.3 punctured step, L5.7 cell count, L4a.1 and L4a.2 case analyses, L0.2 conjugation, cusp scaling, L1.2 disc quotient, L4a positivity) cover untouched text and stand as computed there.

**Headline theorems.** These are stated in `Suggested.lean`:

- `isRiemannianManifold_upperHalfPlane`;
- `eulerChar_eq_two_sub_two_mul_genus` and `riemannHurwitz`;
- `covolume_eq_two_pi_mul_signature`;
- the four minimal-area theorems.

The other headlines are proved at the pin and named in the docstring. None is forced through a stand-in. The file is unchanged, so the earlier padding probe stands: no theorem closes in one tactic.

## Not verifiable

- The changed lines carry no source locator, so no source was opened this round.
- The paywalled texts recorded `uncertified` (Forster1981, DiamondShurman2005, Beardon1983, FarkasKra1992, Serre1973, Stillwell1992, Siegel1945) are as in reviews ~10 and ~11. Their locators are unchanged.

## Source issues

- none
