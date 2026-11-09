# Review of Surfaces (pull request #1974 at b71f133)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** accepted

This is an incremental re-review of the 30 lines changed since c019d09. The change touches only README 3.2 (the statement sentence) and the 3.2 theorem of `Suggested.lean` (its docstring and signature).

- Both findings of the previous review are repaired, and the repairs introduce no new problem.
- The gate passes on this head.
- `Suggested.lean` elaborates with eight `sorry` warnings and nothing else.
- The order-aware dependency check reports no problem.

This report has no findings.

## Previous findings

- R01 — repaired: `Suggested.lean` 166–167 now reads `(o : TauCeti.Manifold.Orientation I M (Fin 2))` then `[∀ x : M, Fact (Module.finrank ℝ (TangentSpace I x) = 2)] (K : M → ℝ)`. `grep haveI` finds nothing in the folder, and the gate reports `statement-hygiene=0`.
- R02 — repaired: README 524–525 reads "piecewise `C²` unit-speed Jordan curve c with corners at a finite set T of parameters and integrable k_g on the smooth pieces". Docstring 161 reads "with corners at `T` and integrable `k_g`".

## Verified sound

### Gate, dependency check and diff scope

- **The worker's gate at b71f133** (`scratch/gate.md`): every check is 0, including `statement-hygiene=0` and `build=0`, and the result is `OK`.
- **My rerun** of the brief's gate command reports `statement-hygiene=0` and `lean-lines=0`. It prints the same two lines as in the last three rounds, and both are false positives of the bare rerun:
  - `depcheck: NOT IN ORDER: Surfaces`: the bare rerun uses the default order, while the candidate order lists `Surfaces` at line 399.
  - `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`: that file is the family index, which this pull request owns. The brief's exclusion diff (`git diff --stat origin/main...HEAD -- . ':!…/Surfaces' ':(exclude,glob)…/RiemannianGeometry/*'`) is empty.
- **Order-aware dependency check** (the brief's `--depcheck … --movable` command), output verbatim:

  ```text
  depcheck: 240 roadmaps, 2328 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Diff scope:**
  - `git diff --stat c019d09 HEAD` touches only `Surfaces/README.md` (7 lines) and `Surfaces/Suggested.lean` (23 lines).
  - The parent README has no change since c019d09; against main it still differs by 36 lines.
  - `changes.md` lists no file outside the folder.
  - No line of either file exceeds 100 columns.

### Lean audit

- **Elaboration at the head:** `lake env lean` on `Suggested.lean` gives eight `declaration uses 'sorry'` warnings (lines 56, 77, 102, 130, 165, 210, 236 and 285) and nothing else. 5.1 remains proved.
- **Signatures:** `scratch/signatures.md` (line 134 onward) and my own `#check @…` in a scratch probe give the same elaborated type for the 3.2 theorem.
  - It keeps every section binder it uses: `MeasurableSpace`, `BorelSpace`, `LindelofSpace` and `IsContinuousRiemannianBundle` for `riemannianVolume`, and `[I.Boundaryless]` for `riemannianExp`.
  - It has the new instance binder `inst_15 : ∀ x, Fact (finrank ℝ (TangentSpace I x) = 2)`.
  - The diff touches no other declaration, so the other eight signatures are unchanged.
- **Equivalence with the previous statement:** in a scratch copy of `Suggested.lean`, two probes elaborate with no error and no `sorry`, so the repair changed no mathematics:
  - The c019d09 form (with its four `haveI`) follows from the head form: build the `Fact` family with `fun x ↦ o.fact_finrank_tangentSpace x`, then `exact`.
  - The head form follows from the c019d09 form by a single `exact`.
- **The binder does not add a hypothesis:**
  - `fact_finrank_tangentSpace` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:92`) derives the binder from `o` at every point.
  - `Orientation.rightAngleRotation` and `Orientation.oangle` need exactly this `Fact`. See `Mathlib/Analysis/InnerProductSpace/TwoDim.lean:82` (variable line) and `:230`, and `Mathlib/Geometry/Euclidean/Angle/Oriented/Basic.lean:49` and `:55`.
- **One-tactic probe** on the head statement: `first | rfl | simp | infer_instance` fails. `simp` stops at the goal `∫_D K − ∫₀ᴸ ω(D_t c′, c′) + Σ oangle(…).toReal = 2π`, having rewritten the integrand by `inner_rightAngleRotation_right` (`TwoDim.lean:242`, `⟪x, J y⟫ = −ω x y`). The theorem is not padding.

### The integrability clause (R02 repair) against the Lean hypothesis `hk`

- **The README and Lean conditions agree.** The prose says "integrable k_g on the smooth pieces"; the Lean says `IntervalIntegrable … volume 0 L`. The smooth pieces cover `[0, L]` except for the finite set `T`, which has measure zero, so the two conditions are equivalent.
- **The clause is satisfied where it should be:**
  - Unit disk: `k_g ≡ 1`, so `∫₀^{2π} |k_g| = 2π < ∞`.
  - Unit square and geodesic polygons: `k_g ≡ 0`.
  - Cap `φ ≤ φ₀`: `k_g ≡ cot φ₀`.
  - PositiveMass §3.1 (at the head of its open pull request, `README.md` lines 148–155 and 718–733): it consumes S3 for disks with piecewise smooth boundary, smooth on each closed piece. `k_g` is then bounded on each piece, so `hk` holds automatically and the contract there needs no change.
  - The other consumers of 3.2 in this README: the bigon and loop of 4.2 (line 632) and the hyperbolic triangle (line 607) have geodesic sides, so `k_g = 0` there.
- **The clause excludes the counterexample from the previous round.** Take a half-disk whose bottom side near the corner (1,0) is the graph of `(1−x)³ sin(1/(1−x))`.
  - The second derivative contains the term `−sin(1/u)/u`, with `u = 1 − x`.
  - Then `∫ |k_g| ≥ ∫_{1/a}^∞ |sin v|/v dv = ∞`, so the clause fails, as it should.
- **Why the clause also makes the statement true.** When `k_g` is integrable, the tangent angle on each piece has one-sided limits at the corners. Those limits agree with the one-sided derivatives that `hleft` and `hright` require, so the corner angles in the sum are the right ones.

### Library declarations opened at the pins (9)

- **Tau Ceti, `Geometry/Manifold/Orientation/Basic.lean`:**
  - `TauCeti.Manifold.Orientation.card_eq` (`:83`).
  - `finrank_tangentSpace_eq` (`:87`).
  - `fact_finrank_tangentSpace` (`:92`).
  - `orientationAt` (`:140`).
- **Mathlib:**
  - `Orientation.rightAngleRotation` (`Analysis/InnerProductSpace/TwoDim.lean:230`), with its variable line `:82`.
  - `inner_rightAngleRotation_right` (`:242`) and `areaForm_rightAngleRotation_right` (`:272`).
  - `Orientation.oangle` (`Geometry/Euclidean/Angle/Oriented/Basic.lean:55`), with its variable line `:49`.

### Cross-roadmap citations and ownership

- **PositiveMass at the head of its open pull request** (3de256b): §3.1 cites S3 at lines 50, 150–156, 726 and 733. The cited conventions are unchanged: D on the left, the inward conormal, and `αᵢ = π − βᵢ ∈ (−π, π)`.
- **Overlaps** (`scratch/overlaps.md`):
  - No other open pull request changes this roadmap.
  - No open pull request drops an id this README cites.
  - No id here is defined only by an open revision.
  - The closest roadmaps are #1683, #1327, #1187, #956 and #1506, as in the last round. The changed passages add no object.
- **Name uniqueness:** `roadmaps grep --fixed --lean-only integral_curvature_add_integral_geodesicCurvature`, run over main and every open head, matches only `Surfaces/Suggested.lean:165`.
- **Unresolved citations:** the worker's `roadmaps resolve` (`scratch/citations.md`) found none, and the changed lines add no new citation.

### Adversarial table

Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-Surfaces~6, at c019d09) with its values. The 3.2 rows are recomputed for the head form, which the probe above shows is equivalent to the c019d09 form.

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| 3.2 Lean, new `Fact` binder | `E = ℝ²` with `o`; `E = ℝ³` | with `o`, `fact_finrank_tangentSpace` gives `finrank = 2` at every x, so the binder always holds; for ℝ³ the binder needs `3 = 2` and `card_eq` gives `2 = 3`, so no `o` exists either | no new restriction; equivalence proved in both directions | none |
| 3.2 Lean, `hk` and its prose | unit disk; square; cap φ₀; wiggled half-disk | `∫|k_g| = 2π`; `0`; `2π sin φ₀ · cot φ₀ = 2π cos φ₀`; `∫_{1/a}^∞ |sin v|/v dv = ∞` | the first three satisfy `hk`, the wiggle is excluded; prose, docstring and Lean agree | none |
| 3.2 Lean | unit disk, `c = e^{it}`, `L = 2π`, `T = ∅` | `J c′ = i·ie^{it} = −e^{it}` points inward; `ω(c″, c′) = Im(conj(−e^{it})·ie^{it}) = −1`, so `⟨c″, J c′⟩ = 1`; `0 + 2π + 0 = 2π` | holds | none |
| 3.2 Lean | clockwise `c = e^{−it}` | `J c′ = e^{−it}` points outward, so `hin` fails; the sum would be `0 − 2π + 0 = −2π ≠ 2π` | `hin` load-bearing | none |
| 3.2 Lean | unit square, `T = {0,1,2,3}`, `L = 4` | `oangle(1, i) = arg i = π/2` at each corner; `0 + 0 + 4·π/2 = 2π` | holds | none |
| 3.2 Lean | L-shape, reflex corner at (1,1) | `oangle(−1, i) = arg(−i) = −π/2`; `5·π/2 − π/2 = 2π` | holds | none |
| 3.2 Lean | cap `φ ≤ φ₀` on S² | `2π(1 − cos φ₀) + 2π cos φ₀ + 0 = 2π` | holds | none |
| 3.2 Lean | hemisphere, outward orientation | `2π + 0 + 0 = 2π` | holds | none |
| 3.2 Lean | hyperbolic triangle, three angles `π/4` | `−π/4 + 0 + 3·3π/4 = 2π`; `volume_carrier` gives `π − 3π/4 = π/4` | holds | none |
| 3.2 Lean | cusp `v⁺ = −v⁻`; fake corner `v⁺ = v⁻` | `oangle = π`, excluded by `hcusp`; a fake corner adds `0` | holds | none |
| 3.2 use in 4.2 (carried) | lune β; equator as a loop | `2β = β + β`; `2π = π + π` | holds | none |
| Conventions: `αᵢ = oangle(v⁻, v⁺)` (carried) | `Complex.oangle` | `arg(conj v⁻ · v⁺) = arg(v⁺/v⁻)` for unit `v⁻` | consistent with 3.1 | none |
| 2.1 Checks with ℓ (carried) | disk ρ = 1, ℓ = 2; hemisphere, ℓ = 2 | `min(1, 2) = 1`; `min(π/2, 2) = π/2` | holds | none |
| 2.2 Checks (carried) | ρ = 1, ℓ = 2, R = 3/2 and 1/2; hemisphere | `π = π·1²`; `3π/4 = π(1 − 1/4)`; `2π sin R` on both sides | holds | none |
| Layer 2 negative control (carried) | ρ = 1, ℓ = 2, R = 3/2 | `a(3/2) = −1/2 < 0`; the zero extension gives `π` | holds | none |
| 1.1 `polar_jacobian_ode` (carried) | ℝ², S², ℍ²; `j = r` on S² | `0 + 0 = 0`; `−sin r + sin r = 0`; `sinh r − sinh r = 0`; `0 + r ≠ 0` | holds | none |
| 1.2 `normalStrip_jacobian` (carried) | circle ρ = 2; latitude π/3; equator; line | `a_t(0) = ∓0.5`; `−cot(π/3) = −0.5774`; `a = cos t`; `a ≡ 1` | holds | none |
| 1.3 (carried) | segment `[0,1]`, points (1/2, 2) and (2, 1) | `(0,−2)·(1,0) = 0`; `(−1,−1)·(1,0) = −1` | holds | none |
| 1.4 `hasDerivAt_polarLength_and_volume_ball` (carried) | ℝ², S², ℍ² | `2π = 2π − 0`; `2π cos r = 2π − 2π(1 − cos r)`; `2π cosh r = 2π + 2π(cosh r − 1)` | holds | none |
| 3.1 `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` (carried) | circle; square; L-shape; clockwise circle | `2π`; `4·π/2`; `5π/2 − π/2`; index −1, so `hz` fails | holds | none |
| 3.2 README Checks (carried) | octant; lune β; split rectangle; outward conormal | `π/2 + 3π/2`; `2β + 2(π − β)`; `π/2 + π/2 = 0 + π`; `−2π ≠ 2π` | holds | none |
| 4.1 `exists_disk_of_simpleClosedCurve` (carried) | unit circle in the disk of radius 2; annulus | closed unit disk; `0 ∉ B`, so `hsc` load-bearing | holds | none |
| 4.2 `riemannianExp_bijOn_ball_of_curvature_nonpos` (carried) | ℝ², ℍ²; flat cylinder, R = 4; oblate spheroid; slit plane | bijective; only `hsc` fails; only `hK` fails; only `hcpt` fails | holds | none |
| 5.1 `integral_norm_mgradient_sq_rescale` (carried, proved) | ℝ² with `f = e^{2x}`; ℝ³ | `e^{2x}·e^{−2x} = 1`; `e^{x} ≠ 1`, excluded by `hE` | holds | none |
| 5.2 `integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale` (carried) | `Φ(z) = 2z`; `Φ(z) = z̄` | `∫ 4|∇φ(2z)|² = ∫ |∇φ|²`; `f = 1`, equal energies | holds | none |

### Seeded sample

- Of the twelve seeded targets, only 3.2 falls in the changed passages. Its statement is checked above.
- Its locators did not change: do Carmo, *Curves and Surfaces*, §4-5 from p. 264, and Lee, 2nd ed., pp. 271–275.
- The other eleven targets are in untouched text, and the locator checks of earlier rounds still apply to them.

### Remarks on untouched text

None.

## Not verifiable

- do Carmo, *Differential Geometry of Curves and Surfaces* (1976), §4-5, and Lee, *Introduction to Riemannian Manifolds*, 2nd ed., pp. 271–275, for 3.2.
  - Earlier rounds tried both. The sources service found no legal copy of do Carmo, and Lee's DOI 10.1007/978-3-319-91755-9 is paywalled.
  - I did not retry them, because this re-review edits no manifest.
  - The integrability clause only adds a hypothesis. The sources assume each arc is regular on its closed interval, so `k_g` is bounded there and their setting satisfies the clause.
  - Every 3.2 instance in the table is verified by computation.

## Source issues

- none
