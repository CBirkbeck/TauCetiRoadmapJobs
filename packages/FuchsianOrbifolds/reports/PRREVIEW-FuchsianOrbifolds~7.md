# Review of FuchsianOrbifolds (pull request #1168 at f997c5f)

**Verdict:** needs changes

This is an incremental re-review of the 88 lines changed since `40532c9`. One finding remains, R01 (P3, not blocking). It is the previous R01, which this head does not repair. The previous R02 is repaired, and the changed passages introduce no new defect.

The gate passes. `Suggested.lean` elaborates with seven `sorry` warnings and nothing else.

## R01 (P3) — The compatibility block is still in `Suggested.lean`; its only user is this branch's stale copy of ModularForms

- **Location.**
  - `TauCetiRoadmap/FuchsianOrbifolds/Suggested.lean`:
    - 50–58: `abbrev CompactifiedQuotient … := Γ.CompactifiedQuotient` and `noncomputable abbrev compactifiedChartedSpace … := inferInstance`;
    - 151–153: `export TauCeti.RiemannSurface (FiniteHolomorphicMap localMultiplicity degree degree_comp divisorPullback biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun)`;
    - import line 7 (`…RiemannSurface.Divisor.Basic`) and docstring 17–19.
  - `TauCetiRoadmap/FuchsianOrbifolds/README.md` 166–170: "It also declares `CompactifiedQuotient` … and exports the Tau Ceti degree API of Layer 5 item 2 under the same short names `RiemannSurface.*`."
- **Claim.**
  - No headline uses either abbreviation.
  - `compactifiedChartedSpace` restates Tau Ceti's `Subgroup.CompactifiedQuotient.instChartedSpace`.
  - The first `export` is a catalogue of seven renamed Tau Ceti declarations, and `Suggested.lean` admits neither.
- **Why the repair commit's reason does not hold.** The repair commit restored the block on the grounds that "the branch's ModularForms copy checks them". That copy (`ModularForms/Suggested.lean` 2 and 89–99) is the merge-base `373d88d` version, which this pull request does not change. Main's copy replaced it, so after the merge nothing checks these names.
- **Witness.**
  - Main `34f48ff`: `ModularForms/Suggested.lean` imports only Mathlib and three `TauCeti.*` modules.
  - `roadmaps grep` finds no import of this module and no use of `compactifiedChartedSpace` or the seven aliases on main or at any open head.
  - `git merge-tree HEAD origin/main` is clean.
  - The pins (`lake-manifest.json`) are identical at `373d88d` and `34f48ff`.
- **Repair.**
  1. Merge `origin/main` into the branch. This is clean, it changes no pin, and afterwards the branch's ModularForms copy no longer imports this module.
  2. In `Suggested.lean`, delete lines 48–59, the `export TauCeti.RiemannSurface (…)` block at 151–153 and import line 7.
  3. Replace docstring 17–19 with "It exports `genus` and `riemannHurwitz` as `RiemannSurface.genus` and `RiemannSurface.riemannHurwitz`."
  4. In the README, delete the sentence at 166–170, from "It also declares" to "short names `RiemannSurface.*`.". Keep the sentences before and after it.

  Tested on a scratch copy with steps 2 and 3 applied:
  - it gives seven `sorry` warnings and nothing else;
  - `#check @RiemannSurface.genus` and `#check @RiemannSurface.riemannHurwitz` resolve;
  - `riemannHurwitz` still elaborates against `TauCeti.RiemannSurface.FiniteHolomorphicMap` through `open TauCeti`.

## Previous findings

- R01 — not repaired: `Suggested.lean` 50–58 (`abbrev CompactifiedQuotient`, `compactifiedChartedSpace`), 151–153 (`export TauCeti.RiemannSurface (…)`), import 7, docstring 17–19, and README 166–170 are unchanged. Carried as R01.
- R02 — repaired: README 422–435 now name `TauCeti.MetricSpace.ofRiemannianMetric` and `riemannianEDist_eq` with its `IsometryClass` instance. They state the isometry `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ` and carry curvature by `hasConstantSectionalCurvature_iff`. The *Needs:* line at 443–450 lists all three.

## Verified sound

**Gate, build and supply** (rerun on this head):

```
gate FuchsianOrbifolds: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- The depcheck shows no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean Suggested.lean` gives `sorry` warnings at lines 73, 83, 97, 109, 117, 128 and 137, and nothing else.

**What the diff changes, all checked:**

- **L2.1 (README 398–465).** It adds:
  - a new target, that every element of `GL(2,ℝ)` acts by an element of `TauCeti.Isom 𝓘(ℝ, ℂ) ℍ`;
  - the distance comparison, restated as `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ`;
  - the comparison map typed as `TauCeti.RiemannianIsometry 𝓘(ℝ, ℂ) 𝓘(ℝ, WithLp 2 (ℝ × ℝ)) ℍ (TauCeti.UpperHalfSpace ℝ)`, with its metric isometry `ℍ ≃ᵢ`;
  - curvature transported by the iff;
  - completeness through `dist` and `ProperSpace ℍ`, replacing the earlier transport of the half-space's completeness;
  - a new Check and an extra clause in the `dist(i, 2i)` Check.
- **Other changes:**
  - the Scope list at 156–159;
  - the Conventions pointer at 248 (now Layer 5 item 2, whose 649–657 list all four objects named there);
  - the acceptance check at 889–891;
  - the docstring of `covolume_eq_two_pi_mul_signature`, whose cusp count is now `c`, matching README 714 and 736 and the Lean `Nat.card Γ.CuspOrbit`.
- The previous report's remark that L2.1 passed from distance isometries to Riemannian isometries without a step is resolved: README 402–410 now give the derivative computation for positive determinant, and for negative determinant `J` composed with a positive-determinant element.

**Mechanical elaboration of the new L2.1 names.** One scratch file, elaborated once, raised no error:

- `#check`s all twelve new pinned names;
- shows that `Group (TauCeti.Isom 𝓘(ℝ, ℂ) ℍ)` is found;
- finds `ProperSpace ℍ`, `IsIsometricSMul PSL(2, ℝ) ℍ`, `T3Space` and `PreconnectedSpace (TauCeti.UpperHalfSpace ℝ)`;
- coerces a `Φ : RiemannianIsometry …` to `ℍ ≃ᵢ TauCeti.UpperHalfSpace ℝ`, under `[IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ]` and `letI := TauCeti.MetricSpace.ofRiemannianMetric …`;
- proves Poincaré curvature `−1` as `(Φ.hasConstantSectionalCurvature_iff (-1)).mp TauCeti.UpperHalfSpace.hasConstantSectionalCurvature`. This is the direction README 430–433 state.

**Signatures.**

- The Lean statements are unchanged since `40532c9`; only one docstring changed.
- I compared all ten entries of `signatures.md` with the README. They match, and no binder was dropped.
- The padding probe of the previous report covers the same seven statements.

**Library declarations opened at the pins** (19):

- **Tau Ceti, Poincaré metric** (`Analysis/Complex/UpperHalfPlane/PoincareMetric.lean`):
  - `TauCeti.UpperHalfPlane.poincareRiemannianMetric` (127);
  - `UpperHalfPlane.poincareRiemannianMetric_inner` (135), which gives the Euclidean inner product over `im²`;
  - the `RiemannianBundle` instance on ℍ (143);
  - `UpperHalfPlane.riemannianVolume_eq_volume` (181).
- **Tau Ceti, Riemannian isometries** (`Geometry/Manifold/Riemannian/`):
  - `TauCeti.Isom` (`Isometry/Group.lean` 49);
  - `TauCeti.RiemannianIsometry` (`Isometry/Basic.lean` 44), an `∞`-diffeomorphism preserving inner products;
  - `riemannianEDist_eq` (`Isometry/Distance.lean` 58) and the `IsometryClass` instance (78), which needs `IsRiemannianManifold` on both sides;
  - `TauCeti.MetricSpace.ofRiemannianMetric` (`Distance.lean` 293), which needs `T3Space` and `PreconnectedSpace`, and its `IsRiemannianManifold` instance (300);
  - `hasConstantSectionalCurvature_iff` (`Isometry/Curvature.lean` 234), stated as target ↔ source.
- **Tau Ceti, half-space** (`Geometry/Manifold/Riemannian/Hyperbolic/`):
  - `TauCeti.UpperHalfSpace` (`UpperHalfSpace/Basic.lean` 91): a type synonym carrying a topology, a charted space on `WithLp 2 (E × ℝ)`, `T3Space` (105) and `ContractibleSpace` (173), with no metric instance. So "give the half-space its Riemannian distance" is a needed step.
  - `inner_def` (379);
  - `hasConstantSectionalCurvature` (`UpperHalfSpace/Curvature.lean` 139);
  - `hyperbolicMetric` (`UpperHalfSpace/Metric.lean` 41), still cited at README 277.
- **Tau Ceti, action:** `IsIsometricSMul PSL(2, ℝ) ℍ` (`UpperHalfPlane/ProperAction.lean` 46).
- **Mathlib:**
  - `UpperHalfPlane.im_smul_eq_div_normSq` (`UpperHalfPlane/MoebiusAction.lean` 219), with `|det g|`, which equals `det g` for positive determinant as README 405–406 use it;
  - `UpperHalfPlane.J` and `coe_J_smul` (380, 382);
  - `IsRiemannianManifold` (`Geometry/Manifold/Riemannian/Basic.lean` 80), which states `edist = riemannianEDist`;
  - `ProperSpace ℍ` (`UpperHalfPlane/Metric.lean` 308).

**Cross-roadmap citations resolved at the open heads.**

- **TeichmullerGeometry** (`417bd270`), README 26, 98, 337, 352, 567: it consumes Layer 2 item 1 as "an isometry from Mathlib's distance on `ℍ` to the Riemannian distance of the half-space model, and the Layer 0 item 2 action is by Riemannian isometries for it". README 417–429 now state both.
- **ArithmeticFuchsianGroups** (`5fdb26da`), README 135, 1239, 1250: it consumes L2.1 for "every element of `PGL₂(ℝ)` acting by a smooth isometry of the Poincaré metric" and "Riemannian distance … is Mathlib's distance". README 402–416 state both.
- No RiemannianGeometry citation and no never-cite roadmap appears.
- The one `citations.md` lead, `RiemannSurface.riemannHurwitz` at README 165, is a false positive: it is the `export` at `Suggested.lean` 155, and `#check` resolves it.

**Ownership.**

- `roadmaps grep` for `Isom 𝓘(ℝ, ℂ)`, `IsRiemannianManifold 𝓘(ℝ, ℂ) ℍ` and `RiemannianIsometry 𝓘(ℝ, ℂ)` finds only this roadmap. `poincareRiemannianMetric` also occurs in ArithmeticFuchsianGroups, which cites L2.1.
- At the pins, no file states a Riemannian isometry of `ℍ` or `IsRiemannianManifold` for `ℍ`. Tau Ceti's `Conformal/Hyperbolic/Length.lean` is the disc model only.
- So the new L2.1 targets have one owner and duplicate nothing.
- `roadmaps overlaps`: no other pull request changes the folder, and no id is dropped or defined only by a revision.

**Sources.**

- The diff changes none of the eight `**Source spine:**` lines (356, 394, 525, 569, 622, 731, 816, 853).
- I reread Martin2013 lines 213–227 (printed p. 6) for the changed docstring:
  - Theorem 2.1 gives `μ(2) = π/21`, attained only by the `(2,3,7)` group;
  - Theorem 2.2 gives the area `2π(2g − 2 + (cusp count) + Σ(1 − 1/mⱼ))`.
  - Both support the docstring as written; the letter `c` is the author's own.
- The new L2.1 steps are labelled as this roadmap's own derivation or cite pinned files. No new external citation enters.

**Adversarial table.** Rows marked "r6" carry the previous report's values for statements the diff leaves untouched. The other rows are computed this round.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| L2.1: `GL(2,ℝ)` acts by Riemannian isometries (new) | `diag(2,1)` at `i`; `[[1,0],[1,1]]` at `i`; `[[0,1],[1,0]]` (det `−1`) at `2i`; `2I`; wrong model: Euclidean tensor | `\|g′\|²/Im(gz)²` vs `1/Im z²`: `4/4 = 1` vs `1`. `gz = (1+i)/2`, `\|g′\| = 1/2`: `(1/4)/(1/4) = 1` vs `1`. `2i ↦ i/2`, `dv ↦ conj v/4`: `(1/16)/(1/4) = 1/4` vs `1/4`, via `h = [[0,1],[−1,0]]`, `det h = 1`, `h(−z̄) = 1/z̄`. `2I`: `g′ = 4/4 = 1`. Euclidean: `1` vs `4`. | Holds; Check 452–456 discriminates | none |
| L2.1: Riemannian distance = `dist` (`IsRiemannianManifold`) | `(i, 2i)`; `(i, 1+i)`; `(z, z)` | `log 2 = ∫₁² dy/y = 2 arsinh(1/(2√2))`. `2 arsinh(1/2) = arcosh(3/2) ≈ 0.9624`; the horizontal segment has length `1 > 0.9624`, so a straight-segment model is wrong. `0 = 0`. | Holds | none |
| L2.1: comparison `ℍ ≃ᵢ UpperHalfSpace ℝ` (new) | `(i,2i) ↦ ((0,1),(0,2))`; `(i,1+i) ↦ ((0,1),(1,1))`; tensor at `2i`; wrong model `(x, 2y)` | `log 2` both; `arcosh(3/2)` both. Tensor `1/4` vs `1/4`; disc `1`. `(x,2y)` sends the second pair to `((0,2),(1,2))`: `arcosh(9/8) ≈ 0.4950 ≠ 0.9624`, and the tensor gives `1/16`. Coercion elaborated. | Holds | none |
| L2.1: curvature transport (route changed) | `.mp` of the iff at `k = −1`; `φ = −log y`; disc factor | Elaborates from half-space to ℍ. `K = −e^(−2φ)Δφ = −y²·y⁻² = −1`; the disc factor gives `−1/4`. | Holds | none |
| L2.1: completeness (route changed) | `zₙ = i/n` | Euclidean: Cauchy, limit `0 ∉ ℍ`. `dist(i/n, i/m) = \|log(m/n)\|`: not Cauchy. `ProperSpace ℍ` found. | Holds; the route through `dist` is the right one | none |
| `covolume_eq_two_pi_mul_signature` docstring (`s → c`) | `PSL(2,ℤ)` `(0;2,3;1)`; `Γ(2)` `(0;−;3)` | `2π(−2 + 1/2 + 2/3 + 1) = π/3`; `2π(−2 + 3) = 2π`; `c = Nat.card Γ.CuspOrbit` | Consistent with README 714, 736 | none |
| Conventions 247–248 → Layer 5 item 2 | The four objects named | All four in 649–657 (`localMultiplicity`, `degree`, `divisorPullback`, `biholomorphOfDegreeEqOne`) | Holds | none |
| Compatibility block | 11 names; consumers on main `34f48ff` and the open heads | 0 consumers apart from the stale ModularForms copy. Scratch copy without the block: 7 `sorry` warnings, both short names resolve. | Unjustified | R01 |
| `riemannHurwitz` (r6) | `id`, `z²`, `℘`, unramified 3→2, `X(2)→X(1)`, `jSphere` | `−2 = 1·(−2)+0`; `−2 = 2·(−2)+2`; `0 = 2·(−2)+4`; `4 = 2·2+0`; `−2 = 6·(−2)+10`; `−2 = 1·(−2)+0` | Holds | none |
| L0.2 via `J` (r6) | `J(1+i)`; `[[0,1],[1,0]] = h·J`; `dist(i,2i)` | `−1+i`; `det h = 1`; both `log 2` | Holds | none |
| L2.5 orientation (r6) | `PSL(2,ℤ)`, `∞`, `k = 1, −1, 2` | Generator `T`; endpoints `z+1, z−1, z+2` | Holds | none |
| L5.7 cell count (r6) | `X(1)` | `3 − 2 + 1 = 2 = 2 − 2·0` | Holds | none |
| L6.1 via §10A (r6) | Level one | `1 + 1/12 − 1/4 − 1/3 − 1/2 = 0` | Holds | none |
| Riemann-sphere atlas (r6) | Point `2`, `∞`, wrong models | `2`, `1/2`; `−1/2` excluded | Holds | none |
| `genus` (r6) | `χ = 2, 0, −2, 1, 3` | `0, 1, 2, 0, 0`; wrong models `0, 2, 4` and `0, 0, 1` | Discriminated | none |
| `eulerChar_eq_two_sub_two_mul_genus` (r6) | `P¹`, torus, genus 2, `S²⊔S²`, `ℂ` | `2=2`, `0=0`, `−2=−2`; `4` vs `2` (excluded by `ConnectedSpace`); `1` vs `2` (excluded by `CompactSpace`) | Holds | none |
| `covolume_eq_two_pi_mul_signature` (r6) | `PSL(2,ℤ)`, `Γ(2)`, `(2,3,7)`, genus 2, `⊥` | `π/3`, `2π`, `π/21`, `4π`; `⊥` is not cofinite | Holds | none |
| Effective vs `SL` orders (r6) | Stabilizers of `i`, `ρ` | `2, 3` vs `4, 6`, giving `7π/6 ≠ π/3` | Lean uses `PSL` | none |
| `pi_div_twentyOne_le_covolume` (r6) | `(2,3,7)`, `(2,3,8)`, `(2,4,5)`, `(0;2,2,2,3)` | `π/21 ≤ π/21, π/12, π/10, π/3` | Holds, tight | none |
| `covolume_eq_pi_div_twentyOne_iff` (r6) | `(2,3,7)`, `(2,3,8)`, `PSL(2,ℤ)`, `(0;2,2,2,3)` | T/T, F/F, F/F, F/F | Both directions | none |
| `minimum_area_finite_area_orbifold` (r6) | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `Γ(2)`, `(2,3,7)` | `π/3 ≤ π/3, π/2, π, 2π`; `π/21` without a cusp | The cusp hypothesis is needed | none |
| `covolume_eq_pi_div_three_iff` (r6) | `PSL(2,ℤ)`, `(0;2,4;1)`, `Γ₀(2)`, `(1;−;1)` | T/T, F/F, F/F, F/F | Both directions | none |
| 4a deficits (r6) | 13 compact and 12 cusped signatures | Minimum `1/42` at `(0;2,3,7)`, `1/6` at `(0;2,3;1)` | Holds | none |
| L0.1, cusp scaling, `j` orders (r6) | Discrete topology; `σ' = 2σ+1`; `ρ`, `i` | Uncountable discrete; `w' = 2`, `q' = −q`; orders `3`, `2` | Holds | none |

## Not verifiable

- **Textbook locators.** These are unchanged by the diff:
  - Katok §1.2 in L2.1, Katok and Miranda elsewhere: no legal copy was found by the sources service.
  - Beardon, Siegel, Forster, Farkas–Kra, Diamond–Shurman, Serre and Stillwell are recorded as uncertified and are cited by locator.
- **Ownership against open pull requests.** I checked it through the sibling checkouts this brief lists and `roadmaps grep` only.

## Source issues

- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the hypothesis names the cusp count with a lower-case letter, while the area formula uses an upper-case one; it should use one letter throughout; affects nothing.
- **Misprint** in Martin2013 at Theorem 2.2, printed p. 6: the conclusion begins with a doubled definite article; it should read "Then the hyperbolic area"; affects nothing.
