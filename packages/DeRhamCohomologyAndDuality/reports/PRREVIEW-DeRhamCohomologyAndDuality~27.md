# Review of DeRhamCohomologyAndDuality (pull request #2085 at df0682f)

**Verdict:** accepted

This is an incremental re-review of the 66 changed lines since cca26c2. Only `README.md` changed; `Suggested.lean` and `metadata.toml` are byte-identical to cca26c2. No file outside the folder changed.

The changes are:

- §§1.1, 1.2, 2.4, 2.5, 3.1, 3.2, 4.1, 4.2 and the `IsTransverseAt` paragraph of §5.3 each gained entries in their *Needs:* lines.
- The Layer 3 and Layer 4 *Dependencies* lines name their Mathlib inputs.
- The Tau Ceti supplier contract and §4.1's route name the chart integral `TauCeti.integralTopForm_of_tsupport_subset_chart`.

Both previous findings are repaired. This report has no findings, the gate passes, and I found no new defect in the changed passages.

## Previous findings

- R01 — repaired: the title now reads "DeRhamCohomologyAndDuality: primitives on simply connected manifolds, relative smooth chains and transversality stated against the pins". The description lists the head's changes against main and says "ComplexKahlerGeometry K6.1 remains a consumer of §§2.4, 3.1–3.3 and 4.1, as on main".
- R02 — repaired: §4.1's *Needs:* (`README.md:1004–1018`) now lists all eight names, from `TauCeti.intToRealCoeff` to `TauCeti.integralTopForm_mpullback_subtypeVal`. §4.2's (`:1060–1064`) now lists Mathlib `ChartedSpace.secondCountable_of_sigmaCompact` and `exists_contMDiffMap_one_nhds_of_subset_interior`.

## Verified sound

### Gate, dependency check, Lean

- **Gate.** I re-ran it at df0682f with `--base origin/main`. It printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0.
  - My run printed no `build=` field. The worker's `gate.md` for this head records `build=0`.
  - My own elaboration (next items) exits 0.
- **Dependency check** (`--movable --pr 2085`). The full output is `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - The changed lines name only Mathlib, Tau Ceti and the suppliers already on main (DifferentialGeometry 8.3–8.5, AlgebraicTopology 6.3).
- **Elaboration.**
  - `lake env lean` on `TauCetiRoadmap/DeRhamCohomologyAndDuality/Suggested.lean` exits 0 with exactly six `declaration uses 'sorry'` warnings, at lines 63, 83, 122, 158, 172 and 217.
  - A scratch copy that also runs `#check @` on all 13 declarations gives the same six warnings and nothing else.
- **Binder check.** The file is unchanged, so the comparison of each elaborated type with its README statement in the previous report still holds. I re-ran it and nothing changed. The one signature lead, `incidenceEquation`, drops its `NormedSpace ℝ` binders, which its body `F (x, p) − j y` does not need.
- **Padding probe.** I re-ran it on a scratch copy, replacing every `sorry` with `first | rfl | infer_instance | simp | exact?`. None of the six theorems closes:
  - lines 67, 125, 166 and 182 end in "`exact?` could not close the goal";
  - lines 89 and 226 end in "unsolved goals".
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty, and `changes.md` lists none.
- **Overlaps.** `overlaps.md` lists no other pull request changing this roadmap, no dropped ids and no ids that only an open revision defines.

### Declarations the changed lines cite, resolved at the pins (68 `#check`s, 0 unresolved)

I resolved every backticked name in the changed passages, and every name in the changed *Needs:* lines, with `#check` against the pinned Mathlib and Tau Ceti. The 68 names were checked in two scratch files. The first imported 12 Tau Ceti modules and held 63 `#check`s. The second added the Kronecker and MappingCocone modules for the 5 names the first did not import. All 68 resolve.

The new names, with their declaration lines:

- **§1.1:**
  - `TauCeti.RoughForm`;
  - `TauCeti.exists_contMDiff_isPrimitiveOn` (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:265`). Its variables at `:262` are `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]`, and it takes `IsSmoothForm I r φ`, `mextDeriv φ = 0` and `1 ≤ r`. This is exactly the first bullet's "closed `C^r` form, `r ≥ 1`, complete `F`, finite-dimensional Hausdorff smooth `M`".
- **§1.2:**
  - `TauCeti.PrimitiveSpace.proj` (`:175`);
  - `TauCeti.PrimitiveSpace.translate` (`:233`), with `value_translate` at `:241` giving `value + c`;
  - `TauCeti.IsPrimitiveOn.mpullback` (`:117`), which takes `MDifferentiable I I' f`. This matches "natural under differentiable maps".
  - `TauCeti.pathClassIntegral` (`DeRham/Period.lean:90`).
- **§2.4:**
  - `TauCeti.smoothSingularSubcomplexMap` (`SmoothSingular/Basic.lean:205`);
  - `SSetPair.chainComplex`, which is Mathlib's (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Relative.lean:201`), with `chainComplexMap` at `:207`. Tau Ceti's `chainComplexMap` at `HomotopyInvariance.lean:77` lives in `SSetPair.Homotopy` and does not clash.
- **§2.5:** `Metric.infDist` (`Topology/MetricSpace/HausdorffDistance.lean:464`). Its junk value is `infDist_empty : infDist x ∅ = 0` (`:478`), which is why the image-reserve bullet needs `U ≠ V`.
- **§3.1 and Layer 3:**
  - `ComplexShape.embeddingUpNat` (`Algebra/Homology/Embedding/Basic.lean:212`);
  - `CochainComplex.mappingCocone`, which is Mathlib's (`Algebra/Homology/HomotopyCategory/MappingCocone.lean:33`).
- **§3.2:** `TopPair.singularCohomologyδ` (`AlgebraicTopology/Cohomology/Relative.lean:273`) is by definition `(P.shortExact_singularCochainComplexShortComplex R k M).δ n m`. That is exactly the connecting map of the sequence the text names.
- **§4.1:**
  - `TauCeti.integralTopForm_of_tsupport_subset_chart` (`Integration/Regularity.lean:67`). See the next subsection.
  - `TauCeti.Manifold.Orientation` is the quotient of `OrientationLift` (`Orientation/Basic.lean:32–34`).
  - `TauCeti.Manifold.Orientation.exists_lift` (`:73`) supplies the "representing orientation lift of `o`" that the new route sentence uses. It belongs to the API of the carrier the *Needs:* line already names, so an implementer is not blocked behind anything unlisted.
  - `TauCeti.HomologicalOrientation` (`Singular/LocalHomology/Orientation/Homological.lean:75`).
  - `TauCeti.HomologicalOrientation.eq_fundamentalClass` (`FundamentalClass.lean:219`) and `localHomologyRestriction_fundamentalClassOn_of_subset` (`:161`).
  - `TauCeti.intToRealCoeff` (`:83`).
  - `TopCat.singularKronecker` and `TopPair.singularKronecker` (`Cohomology/Kronecker.lean:65`, `:127`).
- **§4.2:**
  - `TauCeti.IsCollar` (`Boundary/Collar/Global.lean:46`), which is `(f : N → M) (c : N × Ico 0 1 → M)` and matches "a topological collar `∂M × [0, 1) → M`".
  - `TauCeti.IsLocallyCollared.isCollared` (`Collar/Brown.lean:459`) needs `[CompactSpace N] [T2Space M]`. The boundary is compact because it is closed in compact `M`, and `M` is Hausdorff by §4.2's hypothesis.
  - `TauCeti.mpullback`.
  - `ChartedSpace.secondCountable_of_sigmaCompact` (`Mathlib/Geometry/Manifold/ChartedSpace.lean:236`) needs `[SecondCountableTopology H] [SigmaCompactSpace M]`, both true for compact `M` over `𝓡∂ m`.
- **§5.3, the `IsTransverseAt` paragraph:** `mfderiv_eq_fderiv` (`Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:786`). At this pin it is `fderiv` conjugated by `NormedSpace.fromTangentSpace`, the identity identification, so surjectivity is preserved as the first bullet says.

### The new chart-formula contract (`README.md:252–257`) against the pinned lemma

At `Integration/Regularity.lean:67–74` the lemma takes:

- `l : Manifold.OrientationLift I M (Fin k)`;
- `IsSmoothForm I 0 φ`;
- compact `tsupport φ ⊆ (chartAt H α).source`;
- a basis `b` with `b.orientation = l.modelOrientation`.

It concludes that `integralTopForm (Orientation.mk l) φ` equals the integral over `(extChartAt I α).target` of `l.signAt α (…) * mpullback 𝓘(ℝ, E) I (extChartAt I α).symm φ y b` against `b.addHaar`.

Its variables at `:33–:35` are `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`, any `I` and `[IsManifold I 1 M]`. The README's paraphrase gives each of these in its own words: lift, continuity, compact support in the preferred chart, the sign of `l`, the positive basis and its Haar measure, finite-dimensional `E`, any model, `[IsManifold I 1 M]`. The Borel structure on `E` is the one any integral over `E` needs.

### Adversarial table

Rows 1–35 are carried forward from the previous report (PRREVIEW-DeRhamCohomologyAndDuality~26, at cca26c2). The diff leaves those statements unchanged: it changes only *Needs:* lines, *Dependencies* lines, one supplier-contract paraphrase and one route clause. The values below are the ones that report computed.

Rows C1–C10 cover the changed passages. I computed them this round.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives (r26 row 1) | `E = 0`; `x dy`; angular form | `Λ¹ = 0`; mixed partials `1 ≠ 0`; loop `2π` | passes / fails / local only |
| 2 | §1.3 context (r26 row 2) | `U = {x}` | `IsPrimitiveOn.isOpen` excludes it | not vacuous |
| 3 | §1.2 integral (r26 row 3) | angular form ×1, ×2, reversed; `dx` split at `1` | `2π`, `4π`, `−2π`; `1 + 2 = 3` | holds |
| 4 | §1.2 agreement (r26 row 4) | `d(|x|^(3/2))` | ours `1` / `pathClassIntegral` junk `0` | needs closed `C¹` |
| 5 | §1.3 (r26 row 5) | point; `d(x² sin(1/x))`; `S¹`, `dθ` | constant; `g′(0) = 0`; `2π ≠ 0` | holds |
| 6 | §1.3 holomorphic Check (r26 row 6) | slit plane `1/z`; `ℂ∖{0}` | `Log`; `2πi ≠ 0` | holds |
| 7–8 | §2.1 cone and uniformity (r26 rows 7–8) | half-line, quadrant, disc; perturbation radius | `εt − εt/4 − εt/4 = εt/2` | holds |
| 9–10 | §2.2 Lean and Check (r26 rows 9–10) | `Φ = x + (1−t)²`; `1/2 − x` | `x + 1`, `x`, `4`; `r(0) = 0.3161` | holds |
| 11–13 | §2.3 (r26 rows 11–13) | `[0,∞) ⊇ (0,∞)`; `S¹`; cube-root charts | `[1]`; factors through `0`; `ℝ^(ℝ)` / `ℝ` | holds; `H` needed |
| 14–16 | §2.4 (r26 rows 14–16) | `W = ∅`, `X`; `(ℝ, ℝ∖0)`; non-open graph | absolute / `0`; `H₁ = ℝ`, `H₀ = 0`; `𝔠` / `0` | holds; `IsOpen W` needed |
| 17–18 | §2.5 route and Checks (r26 rows 17–18) | `h = f + ρ(e − f)`; retractions | `< ε/2 + ε/2`; `r((3,4)) = (0.6, 0.8)` | holds |
| 19–20 | §3.1 (r26 rows 19–20) | `d²`; sign witness | `0`; `δ[b] ↦ 1` | holds |
| 21 | §3.2 (r26 row 21) | `ψ dx`; kernel maps at `t = 0, 5` | `1 − 1 = 0`; both inverse on `H⁰` | holds |
| 22 | §3.3 (r26 row 22) | `(ℝ, ℝ∖0)`; `(ℝ², ℝ²∖0)` | `1`; `2π` | holds |
| 23–25 | §4.1 (r26 rows 23–25) | `S¹` both ways; discrete `ℤ`; AT 6.3 generator vs Tau Ceti chart generator | `±2π`; `1 + 2 = 3`; `1` / `−1` | holds; AT 6.3's generator is the right one |
| 26 | §4.2 (r26 row 26) | `D¹`, `c₊ = 3`, `c₋ = 1`; doubled origin | `−2 = −2`; `s = 0` | holds; `T2` needed |
| 27–30 | §§5.1–5.2 (r26 rows 27–30) | `x² + p`; `E = W = 0`; `(1,2) × ℝ` | `±2` / `0`; bad set `{0}`; `∅` | holds |
| 31–35 | §5.3, `relativeTranslate` (r26 rows 31–35) | `x²(1+p)`; `[0,∞)`; two origins; discrete `N`; `p = 1` at `2` | `p = 0` bad; route needs boundaryless; `{0}` null, `∞`; `4` | holds; second countability of `N` needed |
| C1 | Contract `integralTopForm_of_tsupport_subset_chart` | `M = ℝ` over `𝓘(ℝ, ℝ)`, chart `id`, lift `l` with positive model orientation and signs `+1`; `φ = ψ dx`, `supp ψ ⊆ [−1,1]`, `∫ψ = 1`; bases `b = (1)`, `b′ = (2)` | `b`: `∫ (+1)·ψ dλ = 1`. `b′`: `b′.addHaar = λ/2`, coefficient `2ψ`, so `∫ 2ψ d(λ/2) = 1`. Plain `λ` with `b′` would give `2`. | holds; "that basis's Haar measure" is needed |
| C2 | The same contract under the flip of `l` (`mk l = mk l.flip`, `Orientation/Basic.lean:45`) | `l.flip`: model orientation negative, signs `−1`, positive basis `(−1)` | coefficient `−ψ`, sign `−1`, product `ψ`, integral `1` = value for `l`. A formula without the sign factor gives `−1`. | holds; the sign factor is needed for well-definedness on the quotient |
| C3 | The same contract with the reversed orientation (signs `−1`, model positive) | `ψ dx` as in C1 | `∫ (−1)·ψ = −1`, the negative of C1, as §4.1's `S¹` Check requires | holds |
| C4 | §4.1 route clause (`README.md:979–984`): local formula through the chart identity | `ℝ`, `η_S = ψ dx`, `σ(t) = 4t − 2`; negative control `σ′(t) = 2 − 4t` | `∫_σ ψ dx = ∫₀¹ ψ(4t−2)·4 dt = 1` / chart formula `1`. `σ′` gives `−1 ≠ 1`. | holds; "orientation-preserving `σ`, sign `+1`" is needed |
| C5 | §4.1 route: "pieces inside preferred charts" | `S¹` with stereographic charts, `η = dθ` | `tsupport dθ = S¹ ⊄` any chart source, so the lemma does not apply to `η` itself. A partition `ρ₁ + ρ₂ = 1` subordinate to the two charts gives pieces, each in one source, and `∫ρ₁dθ + ∫ρ₂dθ = 2π`. | holds; the decomposition is needed |
| C6 | §1.1 first bullet via `exists_contMDiff_isPrimitiveOn` | `dx` on `ℝ` (`r = ∞`, `F = ℝ`); `x dy` | `g = x`, `C^∞`. `d(x dy) = dx ∧ dy ≠ 0`, so the lemma does not apply, matching the Check that `x dy` has no primitive. | holds |
| C7 | §1.2 lifts differ by `PrimitiveSpace.translate` | `dx` on segment `0 → 3`; lift `Γ` and `translate 7 ∘ Γ` | `3 − 0 = 3` / `(3 + 7) − (0 + 7) = 3` (`value_translate`) | holds |
| C8 | §2.5 image reserve with `Metric.infDist` | `D = V = ℝ`, `U = (0, ∞)`, `f = e^(−x²)`; constant tolerance `1/2`; `U = V` | Tolerance `min(ε, e^(−x²)) > 0`. With constant `1/2`, `g = f − 0.4` gives `e^(−1) − 0.4 = −0.032 ∉ U` at `x = 1`. `infDist (f x) ∅ = 0`, so the tolerance is not positive. | holds; `U ≠ V` and a variable tolerance are needed off compact `D` |
| C9 | §3.2 connecting map `TopPair.singularCohomologyδ` | `(ℝ, ℝ∖0)`, `b = 1` on points of `(0,∞)`, extension by zero `b̃`, `c = [−1, 1]` | `(δb)(c) = b̃(1) − b̃(−1) = 1` / cocone side `δ[b] = −[(0,b)] ↦ 1` (§3.1) | holds; same sign as rows 19–21 |
| C10 | §5.3 first bullet via `mfderiv_eq_fderiv` | `F = x² + p`, `W = 0`, `j = 0`, at `p = −1` and `p = 0` | `p = −1`: `mfderiv` at `±1` is `±2·`, onto, and the incidence derivative `(u, v) ↦ ±2u` is onto. `p = 0`: `0` at `x = 0` on both sides. | holds |

### Sources: the seeded sample in the changed passages

- The changed lines add no external locator; they name only library declarations and roadmap sections.
- The Hatcher locators of §§1.2–1.3 sit next to the changed *Needs:* line of §1.2. I rechecked them:
  - Prop. 1.30 at `hatcher` line 2676 (page 69);
  - Prop. 1.33 at line 2723 (page 70);
  - Prop. 1.34 at line 2758 (page 71).
  
  They are as stated.
- §§1.1, 2.4, 2.5, 3.1, 3.2, 4.1 and 4.2 are otherwise unchanged in their locators. The previous report's verdicts on them stand.

### Cross-roadmap citations in the changed lines

- §2.4: DifferentialGeometry 8.3. §3.2: DifferentialGeometry 8.4. §4.1: Layer 3, DifferentialGeometry 8.4, AlgebraicTopology 6.3. §4.2: §4.1, §3.3, AlgebraicTopology 6.3. §5.3: §5.1.
- These are unchanged citations. They resolve on main f8836c4 as the previous report recorded: DifferentialGeometry 8.3 `:836`, 8.4 `:845`, 8.5 `:852`; AlgebraicTopology Stage 6 item 3 `:1180`.
- `roadmaps resolve` (`citations.md`) finds no unresolved citation or Lean name.

### Headline theorems

These are unchanged from the previous report.

- **Stated:**
  - §1.3 `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`;
  - §2.2 `exists_smooth_inward_deformation`;
  - §2.4 `quasiIso_smoothPairToSingular`;
  - §5.2 `addHaar_setOf_not_isRegularIncidenceParameter`;
  - §5.3 `exists_isRegularIncidenceParameter_relativeTranslate` and `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate`.
- **Named in the docstring as not statable:** §§3.3, 4.1 and 4.2. All three lack the de Rham cochain map, and 4.1 and 4.2 also lack AlgebraicTopology 6.3's classes.
- **Padding:** the probe closes none of the six theorems.

### Remarks on untouched text (no change requested)

- The model-domain bullet of §2.5 cites `Continuous.exists_contDiff_approx_and_eqOn` as its last step (`README.md:790`). That name is in the Mathlib contracts but not in §2.5's *Needs:* line. It was present at cca26c2. The manifold lemma over `𝓘(ℝ, ℝⁿ)` serves equally well.
- §2.3 names `TopCat.Homotopy` (`:656`) outside its *Needs:* line. It was present at cca26c2.

## Not verifiable

- **Lee (`lee`) and Bott–Tu (`bott-tu`).** Both are settled as uncertified, and I did not read them. No changed line cites them anew.
- **Ownership against open pull requests without a checkout.** I checked these only through the overlap report, which lists no shared or dropped ids. The changed lines introduce no new object.

## Source issues

- none
