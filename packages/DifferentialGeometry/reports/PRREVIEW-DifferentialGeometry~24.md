# Review of DifferentialGeometry (pull request #886 at 5436a54)

**Verdict:** needs changes

This is a full review; the folder changed by 166 lines since `cd5e804`. Checked against the previous review, finding by finding:

- **R01 (the folder builds at neither pin's contract; conflict with main): not repaired.** `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`; `Suggested.lean:9–10` still import `TauCeti.Geometry.Manifold.Orientation` and `…Riemannian.Sphere`; `git merge-tree --write-tree HEAD origin/main` (main `f8836c4`) still reports a content conflict in `Suggested.lean`. Re-raised as R01.
- **R02 (0.4 migration and 12.3 trace formula already in Tau Ceti): repaired.** README 542–554 now reads "`TauCeti.SmoothTwoForm I M` is Tau Ceti's abbreviation for the generic carrier `SmoothForm I M ℝ 2` … Nothing about them is planned here"; 0.4 keeps only the flat-pullback acceptance and `*Needs:* 0.2–0.3`; 12.3 cites `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian` and plans only the `Δ` notation; the docstring clause about the migration is gone. All cited names resolve at `2fd255d9` (below).
- **R03 (`toFlow_apply`, `isCompleteVectorField_of_compactSpace` padding): partly repaired.** README 3.3 (1263–1280) and the MorseNovikov consumer line (3116–3119) now cite `TauCeti.IsCompleteVectorField`, `TauCeti.isCompleteVectorField_of_compactSpace` and `TauCeti.globalFlow`. `Suggested.lean:59–67, 89, 601–647` still declare and describe the four declarations. See R02.
- **R04 (two locators at the old pin): repaired.** README 325 reads `Geometry/Manifold/LocalDiffeomorph/Basic.lean`; 973–974 and 989 read `TauCeti.IsPiecewiseC1On` (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean`); 2076–2077 adds the file of `TauCeti.IsPiecewiseC1On.absolutelyContinuousOnInterval`.
- **R05 (description): not repaired.** Re-raised as R03.

The gate passes (every scanner `0`, build `OK`), the dependency check reports 0 problems, and no file outside the folder changes. The one blocking finding is a merge of main, which a repair of the folder's two files cannot perform.

## R01 (P2) — The folder builds at neither pin's contract and still conflicts with main

Re-raised: H01. The recorded reason (merging main, or touching `lake-manifest.json` and `lean-toolchain`, is outside a repair job) says who can act, not that the defect is absent: the README is written against a Tau Ceti pin its Lean file is not built at, and the Lean file does not build at main's pin. The repair is a merge of main by the worker or the author.

**Location.**
- `lake-manifest.json`: Tau Ceti `358314d4`, Lean `v4.35.0-rc3`; main has Tau Ceti `2fd255d9`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9–10`: the two imports.
- `Suggested.lean:79–87`: "Four further headlines are not statable against the Tau Ceti modules this file can import, each for want of the carriers its README statement names".
- `Suggested.lean:786–795`: `structure IntegralManifold`.

**Claim.**
- (a) Of the README's 293 backticked `TauCeti.*` declaration names, all 293 resolve at `2fd255d9` and 232 do not exist at the branch's `358314d4` (for example `TauCeti.integralTopForm`, `TauCeti.mextDeriv`, `TauCeti.deRhamCohomology`, `TauCeti.globalFlow`, `TauCeti.IntegralManifold`, `TauCeti.SmoothForm.IsClosed`).
- (b) At `2fd255d9` both imports are directories (`Orientation/`, `Riemannian/Sphere/`), so the file does not build there.
- (c) At `2fd255d9` four headlines are statable and absent: the 2.4 pair, 9.2, 9.3 and 10.3–10.4.
- (d) At `2fd255d9` the file redeclares about thirty carriers that Tau Ceti has, and admits three theorems Tau Ceti proves (`mextDeriv_add`, `mextDeriv_smul`, `isSmoothForm_mextDeriv_infty`).

**Witness.** `git merge-tree --write-tree HEAD origin/main`: "CONFLICT (content): Merge conflict in TauCetiRoadmap/DifferentialGeometry/Suggested.lean". At `358314d4`, `Geometry/Manifold/` has no `DifferentialForm/`, `DeRham/`, `Flow/` or `Degree/` directory.

**Repair.**
1. Merge main. Resolve `Suggested.lean` to the branch side. Rename the imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`. Rebuild the targeted modules.
2. State the four headlines on the natives: `TauCeti.Manifold.OrientationCover` and `TauCeti.invariantPart` (2.4); `TauCeti.compactlySupportedDeRhamCohomology.integral` (9.2); `TauCeti.poincarePairing` (9.3); `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm` (10.3–10.4). Then delete the sentence at `:79–87`.
3. Delete `Distribution.IntegralManifold` and import `TauCeti.Geometry.Manifold.Distribution.IntegralManifold`; the field names already match, so the six layer-4 statements read unchanged.
4. Replace the file's own copies by the natives (`RoughBundleForm`, `RoughForm`, `IsSmoothBundleForm`, `IsSmoothForm`, `smoothBundleForms`, `smoothForms`, `SmoothBundleForm`, `SmoothForm`, `bundleMpullback`, `mextDerivWithin`, `mextDeriv` with its three admitted laws, `mextDerivₗ`, `closedForms`, `OrientationLift`, `orientationAt`, `IsOrientationPreservingAt`, `flowDomain`, `flowOf`, `IsOutwardPointing`, `divergence`, `fullSimplex`, `fullSimplexEquivStdSimplex`, `planeAngularForm`, `circleAngularForm`, `roundMetricCircle`, `CurvatureForm`). Where a consumer on main imports a name (ContactGeometry: `SmoothForm`, `RoughForm`, `mextDeriv`, `RoughForm.ofFunction`; ComplexKahlerGeometry: `Density`; AlgebraicTopology: `fullSimplexEquivStdSimplex`, `Manifold.Orientation.pullback`), keep it as an `abbrev` or adapter with its present signature.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at main's pins.

## R02 (P3) — README 3.3 and `Suggested.lean` disagree: four declarations the README no longer names

**Location.**
- `Suggested.lean:62–63`: "`isCompleteVectorField_of_compactSpace` and `toFlow_apply` are the completeness input and the rewriting rule of MorseNovikov's flow of the negative dual field".
- `Suggested.lean:601–647`: `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow`, `toFlow_apply`; also `:64–65` and `:89`.
- README 1268–1269: "`TauCeti.isCompleteVectorField_of_compactSpace`; 3.3 consumes them by name and plans nothing about them again".

**Claim.** The README was repaired and the Lean file was not. The README names none of the four (0 occurrences of `toFlow`), so the file declares names the roadmap does not have; `toFlow_apply` is `rfl` and `isCompleteVectorField_of_compactSpace` one `simp` (padding); the docstring's MorseNovikov sentence is false on main.

**Witness.** Main's `TauCetiRoadmap/MorseNovikov/Suggested.lean` imports only Mathlib, and no file on main uses `toFlow`, `IsCompleteVectorField` or `isCompleteVectorField_of_compactSpace`. Only this branch's base copy of MorseNovikov (`:219–224`) still does, which is why the deletion fails the targeted build before the merge.

**Repair.** After step 1 of R01, delete `Suggested.lean:601–647`, the sentence at `:62–63`, and the names `IsCompleteVectorField`, `toFlow` from `:64–65` and `:89`. Tested by the previous round on a scratch copy of the file alone (exit 0, `sorry` warnings only); at this head the four still elaborate, so nothing else depends on the order.

## R03 (P3) — The description contradicts the head and fixes no order against #334

Re-raised: H03. The recorded reason is that the description is outside a repair job's files; the author can edit it, and nothing else repairs it.

**Location.** The pull-request description:
- "The de Rham complex, Mayer–Vietoris, the de Rham theorem, Poincaré duality, the mapping degree with finite-parameter transversality and the hairy ball theorem form the separate roadmap DeRhamCohomologyAndDuality";
- "The nine Lean modules retain the full existing programme"; "330 intentional admission warnings"; "PlanarPrimitiveTargets.lean";
- generated block `merge-order`: "Also changed by #334 (idontgetoutmuch)", with "No order is fixed against a pull request listed under “Also changed by”".

**Witness.** README 29–37 owns layers 6–11 ("the de Rham theorem (layer 8), … the hairy ball theorem (layer 11)"), and `Suggested.lean:1077, 1087` state the hairy ball theorem. The folder holds one `.lean` file with 32 admissions. The overlap report: "#334 and #886 conflict in `TauCetiRoadmap/DifferentialGeometry/README.md`, `…/Suggested.lean`".

**Repair.** Replace the first paragraph's second sentence by "Layers 6–11 (de Rham cohomology, Mayer–Vietoris, the de Rham theorem, Poincaré duality, the degree, the hairy ball theorem) stay in this roadmap; DeRhamCohomologyAndDuality consumes them for its relative theory." Replace the paragraphs about nine modules, 330 and 392 admissions and `PlanarPrimitiveTargets.lean` by "The folder holds one Lean file with 32 admitted theorems." Add "For this folder #334 is rebased onto this pull request."

## Verified sound

**Gate and dependency check.** The worker's gate at this head: every scanner `0`, build `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. The dependency check (`--movable`, the board's `ORDER.txt`):

    depcheck: 235 roadmaps, 2268 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. DifferentialGeometry is on main and names only Mathlib, Tau Ceti and main roadmaps as suppliers.

**Elaboration.** `lake env lean` on `Suggested.lean` at the worktree's pins (Tau Ceti `358314d4`, Mathlib `f6090c7`): exit 0, 32 `declaration uses sorry` warnings, nothing else. No `set_option`, no admitted `def`, `instance` or `example`, no `lemma`.

**Signatures.** A scratch copy with `#check @name` for all 82 declarations elaborates (exit 0). Binders compared with the README, no change needed: 3.1 carries `[CompleteSpace E]` only; `toFlow` and the two 3.2 theorems `[T2Space M] [BoundarylessManifold I M] [CompleteSpace E]`; `exists_flowOf_one_eq` and `hasDerivAt_mpullback_flowOf` `[FiniteDimensional ℝ E]` without `CompleteSpace`, the first with `[ConnectedSpace M]`; `timeDependentFlowDomain_eq_univ` `[FiniteDimensional ℝ E] [CompactSpace M]`; `exists_topForm_of_orientation` `[T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M]`; `orientable_iff_exists_atlas` `[BoundarylessManifold I M] [IsManifold I 1 M]`; `exists_leaf` `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]`; the 12.5 theorems `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]` and both metric regularity instances.

**Padding probe.** Each of the 32 `sorry` replaced by `first | rfl | infer_instance | (simp; done) | trivial | (intros; rfl)` on a scratch copy: 32 errors at 32 sites, none closes. The proved-in-place padding is R02.

**Headline theorems** (README 13–18). Stated: Banach flows (3.1–3.2), Frobenius and leaves (six theorems, 4.2–4.4), the hairy ball theorem (11.1–11.2), the divergence theorem with boundary (12.5). Tau Ceti's at `2fd255d9`: half-space Stokes, Green for absolutely continuous cycles and finite divisions, Laplace–Beltrami. Not statable at either pin and named in the docstring: corner Stokes (5.5b), the de Rham theorem (8.5). Statable only at `2fd255d9`: 2.4, 9.2, 9.3, 10.3–10.4 (R01).

**Library declarations opened** (Tau Ceti `2fd255d9`), for the passages changed since the previous review:
- `Geometry/Manifold/TwoForm/Basic.lean:37–39` `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`; `:47` `SmoothTwoForm.const` via `SmoothForm.const`.
- `DifferentialForm/Closed.lean:43` `def IsClosed (form) : Prop := mextDeriv form.1 = 0`; `:52` the chartwise description under `[IsManifold I 2 M]`, as README 546–548 says.
- `Geometry/Symplectic/Manifold/TwoForm.lean:115` `structure IsSymplectic (form : SmoothTwoForm I M)`.
- `Flow/Complete.lean:61` `IsCompleteVectorField` (no completeness or dimension hypothesis), `:121` the uniform-time criterion, `:144, :154` the two completeness theorems under `[T2Space M] [BoundarylessManifold I M] [IsManifold I 1 M] [CompleteSpace E]`.
- `IntegralCurve/GlobalFlow.lean:60` `globalFlow … : Flow ℝ M` under `[FiniteDimensional ℝ E] [T2Space M] [BoundarylessManifold I M]`, `:85` `flowOf_eq_globalFlow`. It does not cover Banach models, so 3.3's Banach `Flow ℝ M` remains a target.
- `Riemannian/VolumeDensity/Support.lean:36` (finite-dimensional, `C¹`, Borel, Lindelöf, continuous metric) and `Positivity.lean:38` (σ-compact; `lintegral`), as README 2860–2866 says.
- `Riemannian/Laplacian.lean:601` and `:760` (`ContDiff ℝ 2 f` on a finite-dimensional inner product space).
- `Analysis/Calculus/ContDiff/PiecewiseC1On/AbsolutelyContinuous.lean:76`; `Geometry/Manifold/LocalDiffeomorph/Basic.lean` exists.

All 293 `TauCeti.*` names of the README resolve at `2fd255d9`.

**Seeded sample (8 targets).**
- "Smooth 2-forms" (542–554): correct at `2fd255d9` (above). The two consumers it names exist on main: `SymplecticGeometry/HamiltonianReduction/README.md:43` and `LieGroupoidsPoisson/README.md:43`.
- "Canonical interfaces and reuse" (1380–1417): the nine files exist at `2fd255d9`; `IsInvolutiveDistribution` tests fields differentiable and tangent on an open set.
- "Acceptance examples", layer 4 (1605–1615): `S⁻¹` of Tau Ceti's fibre `ker(dz − x dy)` at `S p` is `ker(dz − y dx)` (table).
- "Acceptance examples", 5.6 (2298–2321) and "Henstock–Kurzweil" (2190–2204): every name resolves at `2fd255d9`; values in the table.
- "Conventions and existing inputs" (2034–2053): `TauCeti.Contour.windingNumber` and the Mathlib names resolve.
- "Flat punctured-plane family" (2323–2336): recomputed (table); no native, so it stays a target.
- "Ownership and ordering" (2338–2354): `Completed/ContourIntegration`, `Completed/ConformalMapping`, `PDE`, `ModularForms` exist on main.
- The README flags no locator as unverified.

**Cross-roadmap citations and overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39 (ConvexityToric, LocalVariationalFieldTheory and StringOrientation cite §5.5). No cited id is dropped by an open pull request and none is defined only by an open revision. The open DeRhamCohomologyAndDuality head (its README 3–10, 62–71, 124–127) calls itself Part II, imports DifferentialGeometry 8.3–8.5, 9.3 and 10, and owns only the relative theory: no object has two owners. The citation resolver's seven Lean-name leads are this file's own declarations. The conflicting pull requests are R03.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 `isSmoothBundleForm_mpullback` | `f = id`; `n = ω`; `n = 0`, `f = \|x\|`, `φ = dx` | `bundleMpullback id φ = φ`; `ω + 1 = ω`, analytic in and out; `±dx` off `0`, junk `0` at `0`, discontinuous | holds; `C^(n+1)` on `f` needed | none |
| 2.2 `exists_topForm_of_orientation` | `dim E = 0`; `ℝ` standard | empty basis has orientation `+`, `φ = 1 > 0`; `dx(e₁) = 1 > 0` | holds | none |
| 2.2 `orientable_iff_exists_atlas` | empty `M`; `dim 0`; `Icc 0 1` over `𝓡∂ 1` | both sides true; `det` of the `0×0` matrix is `1 > 0`; orientable with no oriented atlas, excluded by boundaryless | holds | none |
| 3.1 Banach local flow | `v = 1` on `ℝ`; `v = x²` near `1` | `x + (t+u)` both sides; Lipschitz cutoff gives a global flow equal to `1/(1/x − t)` near `(1,0)` | holds | none |
| 3.3 Banach `Flow ℝ M` target against `TauCeti.globalFlow` | `E = ℓ²`, `v = Ax` | native needs `FiniteDimensional`; flow `e^{tA}x`, group law `e^{(t+s)A} = e^{tA}e^{sA}` | target is not in the library | none |
| 3.3 `exists_flowOf_one_eq` | a point; `ℝ`, `x = 0`, `y = 3` | `v = 0`, `flowOf 0 1 x = x`; `v = 3χ`, curve `3t`, value `3` at `t = 1` | holds | none |
| 3.4 `hasDerivAt_mpullback_flowOf` | `v = ∂x`, `w = x ∂y` | pullback `(x+t)∂y`, derivative `∂y`; `[v,w] = ∂y` | sign agrees | none |
| 3.5 `timeDependentFlow_spec` | `v s x = s` on `ℝ` | `x + (t²−s²)/2`; `(r²−t²)/2 + (t²−s²)/2 = (r²−s²)/2` | holds | none |
| 4.2 `isInvolutive_iff_forall_mextDeriv` | `ker(dz − y dx)`; `span(∂x, ∂y)` | `dη(∂x + y∂z, ∂y) = 1`, `[Y,X] = ∂z ∉ D`: both false; `(df∧dz)(v,w) = 0` on `D`: both true | holds | none |
| 4.4 `exists_leaf` | rank `0`; rank `dim M`; irrational slope on the torus | carrier a point, range `{x}`; connected component (open); carrier `ℝ`, injective, dense | holds | none |
| Layer 4 acceptance | `S(x,y,z) = (y,x,z)` | `S⁻¹{c = x b}` at `S p` is `{c' = y a'} = ker(dz − y dx)` | holds | none |
| 5.4 `planarRadialPrimitive_hasFDerivAt` | `a = 0`: `(P,Q) = (1,0)`; `(−y,x)` | `g = x`, `dg = dx`; `∂yP = −1 ≠ 1 = ∂xQ`, excluded, `g = 0` | closedness needed | none |
| 5.4a `moving_pullback_hasDerivAt` | `P = x + t e₁`, `ω = x dy` | `∂t = dy`; `d(ω(e₁)) + ι_{e₁}(dx∧dy) = 0 + dy` | holds | none |
| 5.6 punctured family | symbolic; unit circle | `2ρ^(−α) − 2αρ^(−α−1)(x²+y²) = 2(1−α)ρ^(−α)`; integrand `(c−s)(−s) + (c+s)c = 1`, integral `2π ≠ 0` | closed iff `α = 1`, never exact | none |
| 5.6 gauge FTC example | `h = t² sin(t⁻²)` on `[0,1]` | `h(1) − h(0) = sin 1 − 0 ≈ 0.8415` | holds | none |
| 11.1 hairy ball | `n = 0`; `n = 1`, `v = ix`; `n = 2`, `(−x₂, x₁, 0)` | `v(±1)·(±1) = 0` forces `v = 0`; nowhere zero, excluded by `Even n`; zeros at `(0,0,±1)` | holds | none |
| 12.5 divergence theorem | half-line, `X = f ∂t` compactly supported; `X = 1`; unit disc, `X = x∂x + y∂y` | `∫f' = −f(0)` and flux `⟨X, −∂t⟩ = −f(0)`; `0 ≠ −1`, excluded by support; `2·π = 2π·1` | holds | none |
| 12.3 trace formula (cited) | flat `ℝⁿ`, `f = ‖x‖²` | `Σᵢ Hess f(eᵢ,eᵢ) = 2n = Δf` | agrees with the native | none |
| 0.4 `SmoothTwoForm` (cited) | `ℝ²`, `x dy` | `SmoothTwoForm = SmoothForm … ℝ 2` by `abbrev`; `d(x dy) = dx∧dy ≠ 0`, not closed | README matches the pin | none |

## Not verifiable

- [Lee] GTM 218, [Tu] GTM 275, [Bott–Tu] GTM 82, [Milnor]: no legal open copy was found and the roadmap records no source manifest, so their theorem and page locators are carried by citation and were not checked against text (in particular whether [Lee, Thm. 16.32] assumes an orientation, which 12.5 does without).
- The statements R01 steps 2–4 ask for were decided by reading Tau Ceti at `2fd255d9`; they were not elaborated, because the worktree's packages are at `358314d4`.
- Ownership against open pull requests was checked with the overlap report and by reading DeRhamCohomologyAndDuality's head; other heads were not read in full.

## Source issues

- none
