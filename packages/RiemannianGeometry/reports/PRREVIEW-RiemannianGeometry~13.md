# Review of RiemannianGeometry (pull request #1683 at 843fbeb)

**Verdict:** needs changes

Incremental re-review of the 95 lines changed since `82a58c9` (the head the previous review read): the change replaces every citation of DifferentialGeometry Layer 10 for manifold Sard by the Tau Ceti equal-dimension theorem, makes R4.6 the owner of the transfer from chartwise nullity to the Riemannian volume, and adds two Checks and three `*Needs:*` items; `Suggested.lean` is byte-identical to the previous head. The previous R01 is repaired. The previous R02 is unrepaired and is written again below, and one new Check is off by a point against the item's own definition. Both are P3; nothing blocks.

## R01 (P3) — The S² Check calls the conjugate values of p "the single antipode", but the item defines them as the critical values of `exp_p`, which include p itself

**Location.** `TauCetiRoadmap/RiemannianGeometry/README.md:1282–1284` ("On unit S² the conjugate locus of p is the single antipode, so volume-nullity does not record its multiplicity n−1=1"), against `:1216–1217` ("The conjugate values of p are the critical values of `exp_p` on `T_pM`").

**Claim.** The set whose nullity R4.6 proves by `TauCeti.isNullSet_image_criticalPoints` is, on unit S², the one-point set {−p}.

**Witness.** The theorem's conclusion is nullity of `exp_p '' {v | ¬ IsRegularPoint …}`, the full set of critical values. On unit S² the critical set of `exp_p` is the union of the spheres |v| = kπ, k ≥ 1; for k = 2 the image is p itself (exp_p(v) = p for |v| = 2π, with d exp_p singular there), so the set of critical values is {p, −p}, two points. "The single antipode" is the first conjugate locus, a term the roadmap does not define; the term "conjugate locus" occurs nowhere else in the README (grep).

**Repair.** Make the Check agree with the definition at `:1216`: "On unit S² the critical values of `exp_p` are p and its antipode (|v| = 2π maps to p with singular differential), so volume-nullity records neither the antipode's multiplicity n−1 = 1 nor the return to p." Tested: the set {p, −p} is finite, hence `TauCeti.IsNullSet` in every chart and of Riemannian volume zero, so the conclusion of the Check (nullity carries no multiplicity) is unchanged; only the described set changes.

## R02 (P3) — Two open pull requests change this folder and conflict with this head, and no order is stated

Re-raised from the previous report's R02 (not repaired: the repair commit changed only the README, which may not name pull-request numbers, and the description is unchanged).

**Location.** The pull-request description (`scratch/pull-request.md`, data), which names neither #1327 nor #1187; `TauCetiRoadmap/RiemannianGeometry/README.md` and `Suggested.lean` (the conflicting files).

**Claim.** The overlap index of 2026-11-07 (`scratch/overlaps.md`, computed from the heads) reports that #1327 (@kim-em, "RiemannianGeometry: curvature polarization and harmonic conventions") conflicts with #1683 in `README.md` and `Suggested.lean`, and that #1187 (@kim-em, "chore: bump TauCeti to ab00ba392") conflicts in `Suggested.lean`, `lake-manifest.json` and ten other files.

**Witness.** `scratch/overlaps.md`, section "Other open pull requests that change this roadmap", the two bullets. The heads of #1327 and #1187 are not among the checkouts given to this review; only the conflict is on record. The description's only ordering remark is about Mathlib pins ("CI validation on that pin remains pending"), which names neither pull request.

**Repair.** State in the pull-request description which of #1327 and #1683 is rebased on the other before either merges, and that #1187's pin bump re-targets `Suggested.lean` after whichever merges first. No change to the folder.

## Previous findings

- R01 — repaired: no citation of DifferentialGeometry Layer 10 or of "manifold Sard" remains (grep); the Tau Ceti contract at `:124–136` names `TauCeti.IsNullSet`, `TauCeti.isNullSet_image_criticalPoints`, `TauCeti.riemannianVolume_apply_of_subset` and `TauCeti.chartRiemannianVolume_apply`, R4.6 owns the transfer (`:1224–1233`), and R6 cites R4.6 (`:2166–2169`, `:2256–2260`, `:2274–2276`). The repair introduced R01 above (a Check) and nothing else.
- R02 — not repaired: the pull-request description still names neither #1327 nor #1187 and states no order; written again as R02 above.

## Verified sound

### The change set

| Passage | What was checked | Outcome |
|---|---|---|
| Tau Ceti contract, `README.md:124–136` | `TauCeti.IsNullSet` is `def IsNullSet (I) [MeasurableSpace E] [BorelSpace E] (s : Set M) : Prop := ∀ x μ [μ.IsAddHaarMeasure], μ (extChartAt I x '' (s ∩ (extChartAt I x).source)) = 0` at `TauCeti/Geometry/Manifold/Measure.lean:36`, with `IsNullSet.mono` (`:56`), `IsNullSet.iUnion` (`:72`, countable index) and `IsNullSet.interior_eq_empty` (`:89`, `[FiniteDimensional ℝ E]`), exactly the four properties the contract lists. `TauCeti.isNullSet_image_criticalPoints` at `TauCeti/Geometry/Manifold/Sard/EqualDimension.lean:105`: `[LindelofSpace M] [MeasurableSpace E'] [BorelSpace E'] (hdim : finrank ℝ E = finrank ℝ E') (hf : MDifferentiable I J f) : IsNullSet J (f '' {x | ¬ IsRegularPoint I J f x})`, with `[FiniteDimensional ℝ E] [FiniteDimensional ℝ E'] [IsManifold I 1 M] [IsManifold J 1 N]` in the variable block (`:44–50`): a differentiable map from a Lindelöf C¹ manifold to a C¹ manifold of the same finite model dimension, as the contract says. `TauCeti.riemannianVolume_apply_of_subset` (`…/VolumeDensity/Volume.lean:95`: `s ⊆ (chartAt H α).source → riemannianVolume I M s = chartRiemannianVolume α s`, no measurability needed) and `TauCeti.chartRiemannianVolume_apply` (`…/VolumeDensity/Measure.lean:117`: for measurable `s`, the chart volume is `∫⁻` over `extChartAt I α '' (s ∩ source)` of `ENNReal.ofReal (chartVolumeDensity α (symm y))` against `(Module.finBasis ℝ E).addHaar`): the contract's "integral of the chart density over its chart image". The Haar measure of the chart volume is one of the Haar measures `IsNullSet` quantifies over. | every clause of the contract is the declaration's statement |
| The pin | The branch's `lake-manifest.json` pins Tau Ceti `358314d4`, where `TauCeti/Geometry/Manifold/Measure.lean` and `Sard/EqualDimension.lean` do not exist (no `IsNullSet` anywhere in that tree) and the two volume declarations do (`Volume.lean:95`, `Measure.lean:117`). Main's `lake-manifest.json` pins Tau Ceti `2fd255d9`, where all four exist at the lines above with the signatures quoted; `riemannianVolume` there carries `[MeasurableSpace M] [BorelSpace M] [LindelofSpace M] [IsContinuousRiemannianBundle …]`. The pull request changes no manifest (the diff outside the folder is empty), so on main the roadmap builds against `2fd255d9`; `Suggested.lean` mentions none of the four names, so the gate's build is unaffected either way. Recorded here, not as a finding: the names are checked true at the pin the merged roadmap will have. | consistent at main's pin; branch pin lags |
| R4.6 Sard step, `:1216–1220` | On complete M, `exp_p : T_pM → M` is smooth between n-manifolds; `T_pM ≅ ℝⁿ` is second countable, so Lindelöf. The critical set {v : d(exp_p)_v not surjective} is the zero set of a continuous determinant in coordinates, so closed; a closed subset of ℝⁿ is σ-compact, its continuous image a countable union of compacts, each closed in Hausdorff M, hence Borel. | the two sentences are correct |
| R4.6 transfer, `:1224–1233` | Route: countably many preferred chart sources cover M (Lindelöf); for `s ∩ U_α`, the chart image is Haar-null, so lies in a Borel null set `B` (`toMeasurable`); `T = e_α⁻¹(B) ∩ U_α` is measurable, contains `s ∩ U_α`, and `riemannianVolume T = chartRiemannianVolume α T = ∫⁻ over e_α(T) ⊆ B of the density = 0` by the two cited declarations; monotonicity and countable subadditivity give `riemannianVolume s = 0`. Converse: a subset of a chart source of volume zero has `∫⁻_{e(s)} density = 0` with the density continuous and positive, so `e(s)` is Lebesgue-null, and the same for the chart at any other point, so `IsNullSet`. | the stated proof is complete at the cited declarations |
| DG contract, `:152–157` | "Layers 0–3, 5–9, 12" of DifferentialGeometry on main exist (`TauCetiRoadmap/DifferentialGeometry/README.md:288–933`); Layer 10 no longer cited. | consistent |
| R6, `:2166–2169`, `:2229–2231`, `:2256–2260`, `:2274–2276` | νM of a k-submanifold of the n-manifold N has dimension k + (n − k) = n; an open subset of a second-countable manifold is a second-countable C¹ manifold, so the equal-dimension theorem applies to the normal exponential into N and to `(p,v) ↦ f(p)+v` into ℝⁿ; for ℝⁿ with `chartedSpaceSelf` the extended chart is the identity, so `IsNullSet` is Lebesgue nullity (every Haar measure is a multiple of Lebesgue). R4.6 (Layer 4) precedes R6 (Layer 6). | consistent |
| Ownership of the transfer | DifferentialGeometry on main plans `IsNullSet`, `isNullSet_image_criticalPoints` and `dense_isRegularValue` in 10.2 (`:884–885`, now landed in Tau Ceti and cited here directly) and in 12.4 (`:923–929`) the density bridge, `integral_riemannianVolume_eq_integralDensity`, full support and positivity, but no statement that a chartwise null set has Riemannian volume zero; GeometricTopology owns the measure itself (`DifferentialGeometry/README.md:1028–1029`). TangentialBordism at the head of #942 consumes `TauCeti.IsNullSet` (`TauCetiRoadmap/TangentialBordism/README.md:148–151`) and states no volume transfer; AffineMorseLefschetz on main cites "DifferentialGeometry §10.2 chartwise null-set transport" (`:150`, `:494`), a citation of a section that states no such target, which is that roadmap's drift, not this one's. So R4.6 is the first owner. | this roadmap is the owner |
| Checks, `:1273–1284` | see the adversarial rows below | one defect (R01) |

### Gate, direction, folder, elaboration

The worker's gate at this head is all-zero with `build=0 OK`. My own run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The dependency check:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`.

`lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` from the pull-request worktree (all nine imported Tau Ceti object files present): exit 0 in 31 s, exactly 23 `declaration uses 'sorry'` warnings (lines 70, 79, 90, 117, 129, 142, 165, 188, 199, 234, 251, 261, 272, 282, 313, 323, 335, 363, 393, 414, 444, 469, 478) and no other warning. The one-tactic probe (a scratch copy with every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | sorry`): exit 0, the same 23 declarations still admitted, so no declaration closes by one tactic and there is no padding. The file is byte-identical to the previous head (`git diff 82a58c9..HEAD` on it is empty), so the previous report's `#check @` comparison of all 29 elaborated types with the README stands.

### Seeded sample

None of the five sampled targets (1.1, 1.2, 1.3, 2.1, 2.2) falls in the changed lines; their locators were verified in the previous report (Andrews Prop. 16.2.1 at `andrews-dg-ch16 line 105–106`; Nicolaescu Prop. 4.1.25 at `nicolaescu-lectures line 6793–6795` and Def. 4.1.23 at `line 6772`; Brewin `brewin-rnc line 363` and `line 614`; O'Neill 1966 Thm 2/Cor. 1 and Milnor §14 Lemma 14.4 under settled uncertified keys) and the text at those lines is unchanged in the cache. The changed passages cite only pinned declarations and Milnor §6 Theorem 6.6 (unchanged, uncertified key).

### Adversarial table

Rows for untouched statements carry forward from the previous report (`PRREVIEW-RiemannianGeometry~12`, "Adversarial table"), whose values I recomputed where cheap; the last four rows are the changed statements.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `constant_sectional_tensor_iff`, `schur`, `einstein_factor_constant` | previous report | `K=−2−4x²`, factors 2 and 1/2 on `S³ ⊔ S³(2)` | carried |
| `IsJacobiFieldOn`, initial data | previous report | residuals 0, 0, `2E` | carried |
| `modelSine`, `rauch_norm_ge_of_sectional_le` | previous report | `(5/2)sin(2t/5)` vs `sin t`: `1 ≤ 1.4695` at `π/2` | carried |
| `modelBallVolume`, `bishopGromov` | previous report | `2π(1−cos r)/r² = 2.8884, 2.2245, 1.2732` | carried |
| `cartanHadamard_isCoveringMap`, Bonnet–Myers, Synge, Killing–Hopf, closed geodesics | previous report | `π√(2/2)`, `RP²`/`T²`/`RP³` dispositions | carried |
| paraboloid headlines, `riemannianDist_eq_sSup_smooth`, Fischer, Weitzenböck, R3/R4.9/R5a/R8.5 Checks | previous report | `T_1(2)=5.0979`, `Δr⁴=20r²`, `p(n−p)=4,6,9` | carried |
| R4.6 transfer: `IsNullSet s → riemannianVolume s = 0` | ℝⁿ, flat, identity chart; S¹ with the angle chart at p | ℝⁿ: `IsNullSet` = Lebesgue-null since `extChartAt = id`; density `√det g = 1` in orthonormal coordinates, volume = Lebesgue, both sides agree. S¹: the chart `(−π, π)` at p omits the antipode, so a one-chart test gives 0 for the antipode while `IsNullSet` (every chart) also gives 0 — the Check's point is that a single chart misses points, not that the verdicts differ; the chart at the antipode sees it. | Check at `:1273–1278` correct |
| R4.6 Check: flat square torus | `ℝ²/ℤ²`, origin | cut locus = image of `x=½` and `y=½`: two circles of length 1, total 2; nonempty, not discrete, closed; chart image in `(0,1)²` two segments, Lebesgue area 0; Riemannian area 0 (density 1) | correct |
| R4.6 Check: unit S² conjugate values | `|v| = kπ`, k = 1, 2, 3 | images: antipode, p, antipode; critical values {p, −p}, two points, not one; first conjugate locus {−p} | R01 |
| R4.6 conjugate values null | unit Sⁿ; ℝⁿ | Sⁿ: {p, −p}, finite, null; ℝⁿ: critical set empty, image ∅ | consistent |
| R6 Euclidean genericity | unit circle in ℝ², normal map `(θ,t) ↦ (1−t)(cos θ, sin θ)` | Jacobian `det = 1−t`: 0.5, 0, −1 at t = 1/2, 1, 2; critical set {t = 1}, image the origin, Lebesgue null; agrees with the R6 example `Hess h = 2(1−t)` (nullity only at t = 1) | consistent |

### Ownership and citations

- Cross-roadmap citations in the changed lines resolved on main: DifferentialGeometry Layers 0–3, 5–9, 12 (`TauCetiRoadmap/DifferentialGeometry/README.md:288–933`), GeometricTopology Layer 1 (unchanged), HopfRinow under `Completed/` (unchanged). The citations tool found no unresolved citation or Lean name.
- Overlaps: no id this README cites is dropped by an open pull request, no id this pull request drops is cited elsewhere, and no id depends on an open revision (`scratch/overlaps.md`); the two conflicting heads are R02. The closest open roadmaps in vocabulary (RicciFlow #1023, PositiveMass #956, CalibratedGeometry #946) are consumers named in the scope; Poincare3D #1740 and ManifoldOptimization #1506 are not among the checkouts given, so ownership against them was not checked, nor against #1327 and #1187.

## Not verifiable

- **O'Neill 1966**, **Milnor, Morse Theory** (§6 Theorem 6.6 is cited in the changed R6 passage), **Fulton–Harris**, **Lee, Introduction to Riemannian Manifolds**: settled uncertified keys, cited by locator only.
- The heads of **#1327** and **#1187** are not among the checkouts given to this review (R02 rests on the overlap index alone).

## Source issues

- none
