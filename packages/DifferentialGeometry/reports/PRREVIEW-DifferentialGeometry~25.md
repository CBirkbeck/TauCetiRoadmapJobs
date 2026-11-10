# Review of DifferentialGeometry (pull request #886 at 5436a54)

**Verdict:** needs changes

This is a full review of the same head the previous review read (`5436a54`; the folder has not changed since). Only the pull-request description changed. The previous review's findings, one by one:

- **Previous R01 (the folder builds at neither pin's contract; conflict with main): not repaired.** `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`, while main has `2fd255d9` with `v4.36.0-rc2`. `git merge-tree --write-tree HEAD origin/main` (main `f8836c4`) still reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/DifferentialGeometry/Suggested.lean". The description now says so itself: "The branch therefore has to merge main before it can merge … The Lean file is in its pre-merge state in four respects". Re-raised as R01.
- **Previous R02 (`IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow`, `toFlow_apply`): not repaired.** `Suggested.lean:601–647` and the docstring sentences at `:59–65, :89` are unchanged. Re-raised as R04.
- **Previous R03 (description): repaired.** The description now reads "Layers 6–11 stay in this roadmap", "The folder holds one Lean file with 32 admitted theorems" and "#334 changes the same two files and conflicts with this head; this pull request merges first and #334 is rebased onto it." The first sentence still overstates what DeRhamCohomologyAndDuality consumes (R03).

This round adds three findings that the previous review missed: R02, R03 and R05.

The gate passes (every scanner `0`; the worker's run also reports `build=0`). The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The folder is written against main's Tau Ceti pin, built at an older one, and conflicts with main

Re-raised: H01. The recorded reason was that merging main, or touching `lake-manifest.json` and `lean-toolchain`, is outside a repair job. That reason says who can act; it does not say the defect is absent. The description now confirms the defect and defers it to "that merge". The folder can only be accepted in its merged state.

**Location.**
- `lake-manifest.json`: Tau Ceti `358314d4`.
- `Suggested.lean:9–10`: `public import TauCeti.Geometry.Manifold.Orientation` and `…Riemannian.Sphere`.
- `Suggested.lean:79–80`: "Four further headlines are not statable against the Tau Ceti modules this file can import".
- `Suggested.lean:786–795`: `structure IntegralManifold`.

**Claim.**
- (a) Supplier drift at this folder's own pin. The README names 292 `TauCeti.*` declarations in backticks. All 292 resolve at `2fd255d9`, and 236 do not exist at `358314d4`, for example `TauCeti.integralTopForm`, `TauCeti.mextDeriv`, `TauCeti.globalFlow`, `TauCeti.IntegralManifold` and `TauCeti.Green.green_ac_winding`.
- (b) Both imports are directories at `2fd255d9`, so the file does not build at main's pin.
- (c) Four headlines that are statable at `2fd255d9` are absent: 2.4, 9.2, 9.3 and 10.3–10.4.
- (d) At `2fd255d9` the file redeclares Tau Ceti carriers and admits three theorems Tau Ceti proves there: `TauCeti.mextDeriv_add` (`DifferentialForm/ExtDeriv.lean:247`), `TauCeti.mextDeriv_smul` (`:268`), and `isSmoothForm_mextDeriv_infty`, which is `TauCeti.isSmoothForm_mextDeriv` (`Regularity.lean:223`) with `p = n = ∞`.

**Witness.** At `2fd255d9`, `TauCeti/Geometry/Manifold/Orientation/` holds `OrientedAtlas.lean`, `Pullback.lean` and others, and `Riemannian/Sphere/` holds `Basic.lean`; there is no `Orientation.lean` or `Sphere.lean`. The merge-tree conflict is quoted above.

**Repair.**
1. Merge main and resolve `Suggested.lean` to the branch side. Change the two imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`, then rebuild the targeted modules.
2. State the four headlines on the natives, then delete the sentence at `:79–87`:
   - 2.4 on `TauCeti.Manifold.OrientationCover` and `TauCeti.invariantPart`;
   - 9.2 on `TauCeti.compactlySupportedDeRhamCohomology.integral`;
   - 9.3 on `TauCeti.poincarePairing`;
   - 10.3–10.4 on `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm`.
3. Delete `Distribution.IntegralManifold` and import `TauCeti.Geometry.Manifold.Distribution.IntegralManifold`. The six layer-4 statements then read `TauCeti.IntegralManifold (I := I) ∞ D k`. Tau Ceti takes `I` implicitly and gives the carrier its own universe `v` (`Distribution/IntegralManifold.lean:139–142`); the field names agree.
4. Replace the file's copies by the natives: the rough and smooth form carriers, `bundleMpullback`, `mextDerivWithin`, `mextDeriv` with its three admitted laws, `mextDerivₗ`, `closedForms`, the orientation lift and quotient, `flowDomain`, `flowOf`, `IsOutwardPointing`, `divergence`, `fullSimplex`, `fullSimplexEquivStdSimplex`, `planeAngularForm`, `circleAngularForm`, `roundMetricCircle` and `CurvatureForm`. Keep an `abbrev` or adapter with the present signature for every name a roadmap on main uses from this module:
   - ContactGeometry: `RoughForm`, `RoughForm.ofFunction`, `SmoothForm`, `mextDeriv`;
   - ComplexKahlerGeometry: `Density`;
   - AlgebraicTopology's `GeneralModelOrientation.lean` and `OrientationComparison.lean`: `Manifold.Orientation`, `OrientationLift`, `OrientationLift.setoid`, `orientationAt`, `Manifold.Orientation.pullback`, `fullSimplex`, `fullSimplexEquivStdSimplex`.

   The description lists only the last two of the AlgebraicTopology names.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at main's pins.

## R02 (P3) — `exists_timeDependentFlow` states only pointwise existence, not the C¹ local flow that README 3.5 says needs 3.1

**Location.**
- `Suggested.lean:684–694`. The docstring says "a time-dependent `C¹` field on an open time slab has a local flow solving the nonautonomous equation". The conclusion is `∃ U Ψ, IsOpen U ∧ (t₀, x₀) ∈ U ∧ (∀ p ∈ U, Ψ p.1 p = p.2) ∧ ∀ p ∈ U, ∀ᶠ t in 𝓝 p.1, HasMFDerivAt …`.
- README 1345–1347: "`exists_timeDependentFlow` is the independent C¹ Banach local target on ℝ×M, proved via 3.1".

**Claim.** The conclusion says nothing about how `Ψ` depends on `p`, so `U = univ` with `Ψ` chosen separately at each point satisfies it. It is local existence of a solution through each point. For Banach models, Mathlib already proves this: apply `exists_isMIntegralCurveAt_of_contMDiffAt` (`Geometry/Manifold/IntegralCurve/ExistUnique.lean:65`, `[CompleteSpace E]`, interior point) to the suspension `(1, v)` on `ℝ × M`. No smooth dependence (3.1) enters, so this Lean statement does not test what README 3.5 says it does.

**Witness.** Tau Ceti's finite-dimensional theorem of the same name, at main's pin, opens its proof with `refine ⟨univ, fun t p ↦ timeDependentFlowOf X p.1 t p.2, isOpen_univ, …⟩` (`TauCeti/Geometry/Manifold/Flow/TimeDependent.lean:447`).

**Repair.** Add the conjunct `ContMDiffAt ((𝓘(ℝ, ℝ)).prod ((𝓘(ℝ, ℝ)).prod I)) I 1 (fun q : ℝ × (ℝ × M) ↦ Ψ q.1 q.2) (t₀, (t₀, x₀))`, which is joint `C¹` dependence on the time, the initial time and the initial point, and say so in the docstring. That is what 3.1 supplies and what a pointwise choice of `Ψ` lacks. Tested on `M = ℝ` with `v s x = s`: `Ψ t (s, x) = x + (t² − s²)/2` is polynomial in `(t, s, x)` and satisfies every clause, the new one included. If only existence is meant instead, delete the theorem from `Suggested.lean` and replace README 1345–1347 by a sentence citing Mathlib's local existence for the suspension, with no 3.1 in its *Needs:*.

## R03 (P3) — What DeRhamCohomologyAndDuality consumes is not stated the same way on both sides

**Location.**
- README 111: "One owner per shared construction, stated identically on both sides."
- README 113–121: "**DeRhamCohomologyAndDuality** consumes this roadmap: … the Poincaré pairing and duality (9), regular values, Sard and the degree (10) and the hairy ball theorem (11)."
- README 3098: "every layer".
- README 19–21: "all built on the forms, orientations, integration, de Rham cohomology, smooth chains and degree of this roadmap".
- The description repeats it: "DeRhamCohomologyAndDuality consumes them for its relative theory".

**Claim.** At its open head, DeRhamCohomologyAndDuality names 8.3, 8.4 and 8.5 from this roadmap, and nothing else. It explicitly disclaims 9.3, layer 10 and layer 11. It takes forms, orientations and integration from Tau Ceti directly.

**Witness.** DeRhamCohomologyAndDuality README 62–66 (pull request #2085): "Poincaré duality (9.3), Sard on manifolds and the degree (layer 10) and the hairy ball theorem (layer 11) stay DifferentialGeometry's, and nothing here consumes them". Its supplier contract (377–385) lists only 8.3–8.5.

**Repair.**
- Replace README 113–124 by: "**DeRhamCohomologyAndDuality** consumes 8.3–8.5 by name (the smoothing equivalence, chain integration with Stokes for chains and the de Rham homomorphism, and the de Rham isomorphism), and the Tau Ceti declarations that layers 0–7 name; it consumes nothing of 9.3, 10 or 11. It owns the relative de Rham theory, the fundamental-class comparison, relative transversality, and the strict inward cone, strictly inward fields, their forward semiflow and inward domination (its §§2.1–2.2). No layer here consumes any of its material."
- Replace README 3098–3099 by "**DeRhamCohomologyAndDuality**: 8.3–8.5, for its relative de Rham theory and the comparison with singular fundamental classes".
- In README 21, replace "de Rham cohomology, smooth chains and degree of this roadmap" by "de Rham cohomology and smooth chains of this roadmap".
- In the description, replace "consumes them for its relative theory" by "consumes 8.3–8.5 for its relative theory".

Tested against that head: every `DifferentialGeometry` citation in its README (lines 124, 410, 413, 677, 729, 738, 818, 871, 878, 904, 909, 928, 1004, 1088) is to 8.3, 8.4 or 8.5. Its mentions of 9.3 and 10 (lines 71, 81–82) only disclaim them.

## R04 (P3) — README 3.3 and `Suggested.lean` disagree: four flow declarations the README no longer names

Not repaired from the previous review's R02.

**Location.**
- `Suggested.lean:61–63`: "`isCompleteVectorField_of_compactSpace` and `toFlow_apply` are the completeness input and the rewriting rule of MorseNovikov's flow of the negative dual field".
- `Suggested.lean:601–647`: the four declarations `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow` and `toFlow_apply`.
- `Suggested.lean:64–65` and `:89`: further docstring mentions.

**Claim.**
- The README has 0 occurrences of `toFlow`. README 3.3 (1263–1270) and 3116–3119 cite `TauCeti.IsCompleteVectorField`, `TauCeti.isCompleteVectorField_of_compactSpace` and `TauCeti.globalFlow` instead.
- `toFlow_apply` is `rfl`, and `isCompleteVectorField_of_compactSpace` is one `simp` from a Tau Ceti lemma.
- The docstring's MorseNovikov sentence is false on main.

**Witness.** Main's `MorseNovikov/Suggested.lean` imports no DifferentialGeometry module. Only this branch's base copy (`:13`, `:219`, `:224`) imports and uses `toFlow` and `toFlow_apply`, which is why the repair has to wait for R01's merge.

**Repair.** After step 1 of R01:
- delete `Suggested.lean:601–648`;
- in the sentence at `:59–63`, change "Five statements" to "Three statements" and delete the clause from "and `isCompleteVectorField_of_compactSpace`" to "negative dual field";
- at `:64–66`, remove `IsCompleteVectorField` from the list and replace "`toFlow` and the divergence theorem of 12.5" by "the time-dependent flow of 3.5 and the divergence theorem of 12.5" (`flowDomain` stays, because `timeDependentFlowDomain` uses it);
- remove `toFlow` from the list at `:89`.

Tested on a scratch copy at this head with `:601–648` deleted: exit 0 and the same 32 `sorry` warnings; only the three docstring mentions remain.

## R05 (P3) — The §5.5 mapping is not in a form the overlap check reads, so §5.5 is still reported as dropped

**Location.** README 37–42: "Citations of a single section 5.5 (densities and Stokes with corners) refer to 5.5a (densities) and 5.5b (smooth faces, abstract boundary and corner Stokes). Citations of the layer 4 names Distribution, IsInvolutive and leafThrough refer to …".

**Claim.** The overlap check recognises an old → new mapping only in these forms:
- a sentence containing "is now", "reads as", "resolves to", "formerly", "renumbered" or "was numbered";
- a table whose header names the former numbering.

"refer to" is none of these, so §5.5 is still listed as dropped while three roadmaps cite it.

**Witness.** The overlap report lists "DifferentialGeometry §5.5: cited by ConvexityToric (#1651 line 654, #1651 line 745); LocalVariationalFieldTheory (main line 473); StringOrientation (#948 line 708)". LocalVariationalFieldTheory README 473 on main reads "DifferentialGeometry §5.5 density integration".

**Repair.** In README 38 and 40, replace "refer to" by "resolve to". Tested: the check's sentence pattern finds no mapping for `5.5` in the README at this head, and finds one once line 38 says "resolve to".

## Verified sound

**Gate and dependency check.** I re-ran the gate on this head:

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head adds `build=0`. The dependency check (`--movable`, the board's `ORDER.txt`, `--pr 886`):

    depcheck: 235 roadmaps, 2268 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The roadmap is on main and names only Mathlib, Tau Ceti and roadmaps on main as suppliers. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean` on `Suggested.lean` at the worktree's pins (Tau Ceti `358314d4`, Mathlib `f6090c7`) exits 0 with 32 `declaration uses sorry` warnings and nothing else. The file has no `set_option`, no admitted `def`, `instance` or `example`, and no `lemma`.

**Signatures.** A scratch copy with `#check @name` for all 82 declarations elaborates (exit 0). Each elaborated binder list matches the README:
- `exists_flowOf_one_eq`, `hasDerivAt_mpullback_flowOf`, `exists_chart_mfderiv_eq_const`: `[T2Space M] [BoundarylessManifold I M] [FiniteDimensional ℝ E]`, without `CompleteSpace`; the first also has `[ConnectedSpace M]`.
- `exists_timeDependentFlow`: `[T2Space M] [BoundarylessManifold I M] [CompleteSpace E] [IsManifold I 1 M]`.
- `timeDependentFlowDomain_eq_univ`: `[FiniteDimensional ℝ E] [CompactSpace M]` and `OrdConnected J`.
- `exists_topForm_of_orientation`: `[T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M]`.
- `orientable_iff_exists_atlas`: `[BoundarylessManifold I M] [IsManifold I 1 M]`.
- `Distribution.exists_leaf`: `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]`.
- The 12.5 theorems: `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]` and both metric regularity instances.

No declaration lost a needed section variable.

**Padding probe.** I replaced each of the 32 `sorry` with `first | rfl | infer_instance | (simp; done) | trivial | (intros; rfl)` in a scratch copy. That gives 32 errors at 32 sites, so none closes in one tactic. The proved-in-place padding is R04.

**Headline theorems** (README 13–18).
- Stated in `Suggested.lean`:
  - the Banach fundamental theorem of flows (3.1–3.2);
  - Frobenius and global leaves (six statements, 4.2–4.4);
  - the hairy ball theorem (11.1–11.2);
  - the divergence theorem with boundary (12.5).
- Proved in Tau Ceti at main's pin, not restated:
  - half-space Stokes;
  - Green for absolutely continuous cycles and for finite divisions;
  - the Laplace–Beltrami operator.
- Named in the docstring as not statable at either pin:
  - corner Stokes (5.5b), for want of the face structure;
  - the de Rham theorem (8.5), for want of the de Rham homomorphism;
  - degree homotopy invariance (10.5).
- Statable only at main's pin: 2.4, 9.2, 9.3 and 10.3–10.4 (R01).

**Library declarations opened.**

Tau Ceti `2fd255d9` (main's pin):
- `Geometry/Manifold/TwoForm/Basic.lean:37` (`abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`) and `:47` (`const`).
- `DifferentialForm/Closed.lean:43` (`IsClosed := mextDeriv form.1 = 0`) and `:52` (the chartwise form, under `[IsManifold I 2 M]`).
- `Geometry/Symplectic/Manifold/TwoForm.lean:70, :115` (`TauCeti.SmoothTwoForm.IsSymplectic`).
- `Geometry/Manifold/Distribution.lean`:
  - `:351` `IsInvolutiveDistribution`: fields `MDiff` on an open `U` and tangent there;
  - `:499` `standardContactDistribution`: carrier `v.2.2 = p.1 * v.2.1`;
  - `:560` its non-involutivity.
- `Distribution/IntegralManifold.lean:139–160`.
- `Flow/TimeDependent.lean:439–452`.
- `DifferentialForm/ExtDeriv.lean:247, :268` and `Regularity.lean:223`.
- `Flow/Basic.lean:57, :62`, `Flow/Complete.lean:61, :154` and `IntegralCurve/GlobalFlow.lean:60`.
- `Boundary/Orientation.lean:46`, `Riemannian/Laplacian.lean:55` and `DifferentialForm/Involution.lean:42`.
- `DeRham/PoincarePairing.lean:151` and `Degree/Basic.lean:76`.
- `Analysis/BoxIntegral/FundThmCalculus.lean:68, :102`, `Oriented/Basic.lean:34, :249, :259`, `Analysis/Green/GraphIntegral.lean:72` and `Analysis/Contour/Winding/Number/Basic.lean:76`.

Tau Ceti `358314d4` (this branch's pin):
- `Distribution.lean:163, :236, :338`: the same bodies as at main's pin.
- `IntegralCurve/Maximal.lean:107, :215` and `IntegralCurve/Flow.lean:168`: Banach-general definitions, so the 3.2 targets typecheck on Tau Ceti's own objects.
- `Analysis/ODE/InitialCondition.lean:215`: the finite-dimensional `ODE.exists_contDiffAt_localFlow`, the same shape as the 3.1 target.

Mathlib `f6090c7`: `Geometry/Manifold/IntegralCurve/ExistUnique.lean:65`.

**Cross-roadmap citations resolved.**
- On main: `Completed/HopfRinow`, `Completed/UniversalCovers`, `Completed/ContourIntegration`, `Completed/ConformalMapping`, `RepresentationTheory/LieGroups`, `GeometricMeasureTheory`, `Isoperimetry`, `PDE`, `ModularForms`, `AlgebraicTopology`, `GeometricTopology`, `HeegaardFloer`, `SmoothBundlesConnections`, `MorseNovikov`, `LieGroupoidsPoisson`, `SymplecticGeometry/HamiltonianReduction` and `ComplexKahlerGeometry`.
- Every name that main's importers of this module use is declared at this head (R01 step 4).
- LieGroupoidsPoisson (README 43, 192, 1206–1226) and HamiltonianReduction (README 21) cite 0.4's `legacySmoothTwoFormEquiv`, which this head drops. README 550–554 maps it to the identity of `TauCeti.SmoothTwoForm I M` with `SmoothForm I M ℝ 2`, and to the defining equation of `TauCeti.SmoothForm.IsClosed`. ComplexKahlerGeometry mentions the name only in its docstring (`Suggested.lean:16–17`), so nothing breaks.
- The citation resolver's seven Lean-name leads are this file's own declarations; `#check` resolves each.
- All 292 `TauCeti.*` declaration names resolve at `2fd255d9`.

**Ownership against open pull requests.** I checked the overlap report, and read the DeRhamCohomologyAndDuality head (its README 1–30, 56–90, 377–400) in the sibling checkout. It calls itself Part II and owns only the relative theory, so no object has two owners (the consumer statement is R03). The #334 order is now fixed in the description. #1187 (pin bump) is ordered after this pull request. Other open heads were not read in full.

**Seeded sample.**
- "Smooth 2-forms" (542–554): correct at `2fd255d9` (declarations above); the two consumers it names exist on main.
- "Canonical interfaces and reuse" (1380–1416): the nine files and `TauCeti/Analysis/ODE/Frobenius.lean` exist at `2fd255d9`. `IsInvolutiveDistribution` tests fields that are differentiable and tangent on an open set, as stated. "Repeats that structure field for field" holds up to the explicit `I` and the carrier universe (R01 step 3).
- "Acceptance examples", layer 4 (1605–1615): correct; values in the table.
- "Acceptance examples", 5.6 (2298–2321): every name resolves at `2fd255d9`; values in the table.
- "Conventions and existing inputs" (2034–2054): `TauCeti.Contour.windingNumber` is at `Analysis/Contour/Winding/Number/Basic.lean:76`; the integrand convention is checked in the table.
- "Henstock–Kurzweil" (2189–2204): the FTC at `FundThmCalculus.lean:102` has a complete target, `a < b`, continuity on `Icc`, a derivative on `Ioo` off a countable set, and no integrability hypothesis, as stated.
- "Flat punctured-plane family" (2323–2336): recomputed in the table; no native, so it stays a target.
- "Ownership and ordering" (2338–2363): the four linked roadmaps exist on main.
- The README flags no locator as unverified.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 `isSmoothBundleForm_mpullback` | `f = id`; `n = 0`, `f = \|x\|`, `φ = dx` | `bundleMpullback id φ x = (φ x).comp id = φ x`; pullback `±dx` off `0`, junk `0` at `0`: discontinuous | holds; `C^(n+1)` on `f` is needed | none |
| 1.1 `mextDeriv_smul` | `c = 0`; `c = 2`, `φ = ∛x dy` at `0` | `0 = 0`; both sides junk `0` (no derivative of `∛x` or `2∛x`) | holds unconditionally | none |
| 1.1 `mextDeriv_add` | `φ = ∛x dy`, `η = (x − ∛x) dy` at `0` | `d(φ+η) = dx∧dy ≠ 0`; `dφ + dη = 0 + 0` (junk) | `C¹` needed, as stated | none |
| 2.2 `pullbackSign_mul_pullbackSign` | chain rule; `ℝ` with charts `t` (`≥ 0`), `−t` (`< 0`), `y = 1` | `s(y→x') = sign det D(φ_{x'}φ_x⁻¹) · s(y→x)`, so the product is `sign det D(φ_{x'}φ_x⁻¹)`; signs `+1`, `−1`, product `−1` = sign of `t ↦ −t` | holds | none |
| 2.2 `exists_topForm_of_orientation` | `dim E = 0`; `ℝ` standard | `φ = 1`: empty basis positive, `1 > 0`, no basis at negative points; `dx(e₁) = 1 > 0` | holds | none |
| 2.2 `orientable_iff_exists_atlas` | `Icc 0 1` over `𝓡∂ 1`; empty `M` | left true, right false (increasing at `0`, decreasing at `1`), excluded by boundaryless; both true | holds | none |
| 3.1 Banach local flow | `v = 1` on `ℝ`; `v = x²` near `1` | `Φ x (t+u) = x+t+u = Φ (Φ x t) u`; a Lipschitz cutoff gives a global flow equal to `1/(1/x − t)` near `(1, 0)` | holds | none |
| 3.2 Banach openness and smoothness | `E = ℓ²`, `v = Ax`, `A` bounded | domain `univ` (open), flow `e^{tA}x` smooth | holds | none |
| 3.3 `exists_flowOf_one_eq` | a point; `ℝ`, `x = 0`, `y = 3` | `v = 0`, `flowOf 0 1 x = x`; `v = 3χ` (`χ = 1` on `[−1, 4]`), curve `3t`, value `3` at `t = 1` | holds | none |
| 3.4 `hasDerivAt_mpullback_flowOf` | `v = ∂x`, `w = x ∂y` | pullback `(x+t)∂y`, derivative `∂y`; Mathlib bracket `Dw·v − Dv·w = (0, 1) = ∂y` | sign agrees | none |
| 3.5 `exists_timeDependentFlow` | `v ≡ 0` on `ℝ`; Tau Ceti's proof | `Ψ t p = p.2` works with `U = univ`; Tau Ceti takes `U = univ` with a pointwise flow | weaker than README 3.5 | R02 |
| 3.5 `timeDependentFlow_spec` | `v s x = s` on `ℝ`, `J = ℝ` | `φ_{t,s}x = x + (t²−s²)/2`; `(r²−t²)/2 + (t²−s²)/2 = (r²−s²)/2`; `∂_t = t = v t`; inverse returns `x` | holds | none |
| 3.5 `timeDependentFlowDomain_eq_univ` | `J = (0,1) ∪ (2,3)`, `v = 0`; `J = (0,1)`, `M = S¹` | `(2.5, 0.5, x)` not in domain (curve leaves `↥J` at elapsed time `0.5`), excluded by `OrdConnected`; domain `univ` | holds | none |
| 4.2 `isInvolutive_iff_forall_mextDeriv` | contact `ker(dz − y dx)`; rank `0` | `dη(∂x + y∂z, ∂y) = 1` and `[∂y, ∂x + y∂z] = ∂z ∉ D`: both false; `⊥` involutive and `dη(0, 0) = 0`: both true | holds | none |
| 4.2 `isInvolutive_of_forall_exists_integralManifold` | `span(e₁, e₂)` on `ℝ³` | slices `z = c` through every point; brackets of `∂x`, `∂y` combinations stay in `D` | holds | none |
| 4.3 `exists_flatChart`, slices | rank `0`; `span(e₁)` on `ℝ²` | `W = ⊥`, `finrank 0`, `{e x} = e.target ∩ {e x}`; `e = id`, `P = ℝ × {0}`, `finrank 1` | holds | none |
| 4.3 `exists_contMDiff_factor` | irrational line `N` on `T²`, `f(s) = (s, αs)`; `z ↦ z²` on `S¹` | `g = id` smooth; non-injective, excluded by `hinj` | holds | none |
| 4.4 `exists_leaf` | rank `0`; rank `dim M`; irrational slope | a point; the component; carrier `ℝ`, injective, dense | holds | none |
| Layer 4 acceptance (sample) | `S(x,y,z) = (y,x,z)`, Tau Ceti fibre `v.2.2 = p.1 · v.2.1` | at `S p = (y,x,z)`: `c' = y b'`; pulled back, `z' = y x'`, i.e. `ker(dz − y dx)` | holds | none |
| 5.4 `planarRadialPrimitive_hasFDerivAt` | `(P,Q) = (y, x)`; `(−y, x)` | `g = xy/2 + yx/2 = xy`, `dg = y dx + x dy`; `∂yP = −1 ≠ 1 = ∂xQ`, excluded, `g = 0` | closedness needed | none |
| 5.4a `moving_pullback_hasDerivAt` | `P = x + t e₁`, `ω = x dy`; `ℝ`, `ω = f(x) dx` | `dy = 0 + dy`; `f'(x+t) dx = d(f(x+t)) + 0` | holds | none |
| 5.5a `Density` Check | `m < dim`; `V = ℝ`, `m = 2` | `(2^dim − 2^m)·toFun v = 0`; `toFun(a,b) = \|a\|` is a nonzero density, and the README claims nothing for `m > dim` | Check correct | none |
| 5.5b `fullSimplexEquivStdSimplex` | `p = 1`; `p = 2` | `x ↦ (1−x, x)`; `e₁ ↦` weight `1` at index `1`, `0 ↦` index `0` | as stated | none |
| 5.6 acceptance (sample) | ellipse; `θ = 2π√t`; weak field; gauge `h` | `ab/2 → πab`; `π/(2√t) → π`; `¼ + 1 − ¼ + 0 = 1 = ∫ 1 dA`; `sin 1 ≈ 0.8415`, `∫\|h'\| = ½∫\|cos u\|/u du = ∞` | holds | none |
| 5.6 conventions (sample) | `exp(it)`, `P = −y/2`, `Q = x/2` | integrand `½`, integral `π` | holds | none |
| 5.6 punctured family (sample) | symbolic; unit circle; `α = 1` | `2ρ^{−α} − 2αρ^{−α−1}(x²+y²) = 2(1−α)ρ^{−α}`; `(c−s)(−s) + (c+s)c = 1 → 2π`; curl `0` and integral `2π` | closed iff `α = 1`, never exact | none |
| 0.4 Smooth 2-forms (sample) | `ℝ²`, `x dy` | `abbrev` makes the types equal; `d(x dy) = dx∧dy ≠ 0`: not closed | matches the pin | none |
| 7.4 induction principle | `P` = "`H⁰_dR` finite-dimensional"; `P` = "closed 1-forms exact" | disjoint union of balls: infinite-dimensional; `S¹` = two arcs, `[dθ] ≠ 0` | both negative controls correct | none |
| 11.1 hairy ball | `n = 0`; `n = 1`, `v = ix`; `n = 2`, `(−x₂, x₁, 0)` | `⟪v x, x⟫ = 0` forces `v = 0`; nowhere zero, excluded by `Even`; zeros at `(0,0,±1)` | holds | none |
| 11.2 section form | `n = 0` | tangent spaces are `0`-dimensional, `V x = 0` | holds | none |
| 12.5 divergence theorem | half-line, `X = f ∂t`; `X = 1`; unit disc, `X = x∂x + y∂y` | `∫ f' = −f(0) = f(0)·(−1)`; `0 ≠ −1`, excluded by support; `2·π = 2π·1` | holds | none |
| 12.1 `volume_circle` | round metric; metric scaled by `r²` | `⟪iz, iz⟫ = 1`, volume `2π`; scaled gives `2πr` | holds | none |
| Ownership statement | DeRhamCohomologyAndDuality head | consumes 8.3–8.5 only; disclaims 9.3, 10, 11 | inconsistent | R03 |

## Not verifiable

- [Lee] GTM 218, [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: I found no legal open copy, and the roadmap records no source manifest. Their theorem and page locators are carried by citation and were not checked against the text. In particular I could not check whether [Lee, Thm. 16.32] assumes an orientation; 12.5 states the theorem without one and gives a density route.
- The HOL Light and AFP theorem names of 5.6 (`GREEN_THEOREM_CURL`, the three `GreenThm_typeI_typeII_…` names) were not fetched this round.
- R01's repair statements were decided by reading Tau Ceti at `2fd255d9`. They were not elaborated, because the worktree's packages are at `358314d4`.

## Source issues

- none
