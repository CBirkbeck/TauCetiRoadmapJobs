# Review of DifferentialGeometry (pull request #886 at cd5e804)

**Verdict:** needs changes

This is a full review of the same head the previous review read: the folder has 0 changed lines since `cd5e804`. Checked against that review, finding by finding:

- **R01 (the folder builds at neither pin's contract; conflict with main): not repaired.** `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`. `Suggested.lean:9–10` still import `TauCeti.Geometry.Manifold.Orientation` and `…Riemannian.Sphere`. `git merge-tree --write-tree HEAD origin/main` against main `f8836c4` still reports "CONFLICT (content)" in `Suggested.lean`. Re-raised as R01, with a fuller repair list.
- **R02 (description: no order against #334 and #1187; "nine modules"): not repaired.** The description is unchanged. Re-raised as R05.

This round also finds three things the previous rounds missed:

- 0.4 still plans the `SmoothTwoForm` migration, and 12.3 still plans the Laplacian trace formula. Main's Tau Ceti pin has both (R02).
- Two proved-in-place declarations are kept for a MorseNovikov import that no longer exists (R03).
- Two Tau Ceti locators use the old pin's names (R04).

The gate passes: every scanner is `0` and the build is `OK`. The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The folder builds at neither pin's contract and still conflicts with main

Re-raised: H01. The recorded reason is that merging main, or touching `lake-manifest.json` and `lean-toolchain`, is outside a repair job. That reason limits who can act; it does not say the defect is absent. The head is unchanged, its Lean file does not build at main's pin, and its README is written against a pin its Lean file is not built at. The repair is a merge of main by the worker or the author, not an edit of the manifest by hand.

**Location.**
- `lake-manifest.json`: Tau Ceti `358314d4`, Lean `v4.35.0-rc3`. Main has Tau Ceti `2fd255d9`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9–10`: the two imports.
- `Suggested.lean:80–88`: "Four further headlines are not statable against the Tau Ceti modules this file can import, each for want of the carriers its README statement names".
- `Suggested.lean:787–799`: `structure IntegralManifold`.

**Claim.**
- (a) The README's contract is written against `2fd255d9`. Of its 286 backticked `TauCeti.*` names, 283 resolve at `2fd255d9`; 229 of them do not exist at the branch's `358314d4`. Examples: `TauCeti.integralTopForm`, `TauCeti.mextDeriv`, `TauCeti.deRhamCohomology`, `TauCeti.Manifold.mgradient`, `TauCeti.IntegralManifold`, and all eleven 5.6 acceptance examples. (The other 3 names are a namespace or module path.)
- (b) At `2fd255d9` both imports are gone (`Orientation/` and `Riemannian/Sphere/` are now directories), so the file does not build there.
- (c) At `2fd255d9` four headlines are statable and absent: the 2.4 pair, 9.2, 9.3 and 10.4.
- (d) At `2fd255d9` the file redeclares about thirty carriers that Tau Ceti has. README 375–379 and 443–445 say a declaration of `Suggested.lean` with one of these names is "that target's signature, never a second definition".

**Witness.** `git merge-tree --write-tree HEAD origin/main` against `f8836c4`: "CONFLICT (content): Merge conflict in TauCetiRoadmap/DifferentialGeometry/Suggested.lean". At `358314d4`, `Geometry/Manifold/` has no `DifferentialForm/`, `DeRham/` or `Flow/` directory.

**Repair.**
1. Merge main (or bump `lake-manifest.json` and `lean-toolchain` to main's pins). Resolve `Suggested.lean` to the branch side. Rename the imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`. Rebuild the six targeted modules.
2. State the four headlines on the natives:
   - `TauCeti.Manifold.OrientationCover` and `TauCeti.invariantPart` (2.4);
   - `TauCeti.compactlySupportedDeRhamCohomology.integral` (9.2);
   - `TauCeti.poincarePairing` (9.3);
   - `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm` (10.4).

   Then delete the sentence at `:80–88`.
3. Delete `Distribution.IntegralManifold` and import `TauCeti.Geometry.Manifold.Distribution.IntegralManifold`. The field names already match, so the six layer-4 statements read unchanged on `TauCeti.IntegralManifold`.
4. Replace the file's own copies with the natives at `2fd255d9`. These are: `RoughBundleForm`, `RoughForm` (`DifferentialForm/Basic.lean:35, 41`); `IsSmoothBundleForm`, `IsSmoothForm`, `smoothBundleForms`, `SmoothBundleForm`, `SmoothForm` (`DifferentialForm/Smooth.lean`); `bundleMpullback`; `mextDerivWithin`, `mextDeriv`, `mextDeriv_add`, `mextDeriv_smul` (`ExtDeriv.lean:145`); `mextDerivₗ`; `closedForms` (`DeRham/Basic.lean:77`); `OrientationLift`, `orientationAt`, `IsOrientationPreservingAt`; `Manifold.Orientation.pullback` with `pullbackSign` and its two laws (Tau Ceti builds it differently: `Orientation/Pullback.lean:173` with `isOrientationPreservingAt_pullback`, `:205`); `flowDomain`, `flowOf` (`Flow/Basic.lean:57, 62`); `IsOutwardPointing` (`Boundary/Orientation.lean:46`); `divergence` (`Riemannian/Laplacian.lean:55`); `fullSimplex`, `fullSimplexEquivStdSimplex`; `planeAngularForm`, `circleAngularForm` (`DeRham/Circle.lean:92`); `roundMetricCircle`; `CurvatureForm` (`DifferentialForm/Curvature.lean:33`).

   Where a consumer on main imports a name, keep it as an `abbrev` or adapter with its current signature. The consumers are:
   - ContactGeometry: `SmoothForm`, `RoughForm`, `mextDeriv`, `RoughForm.ofFunction`;
   - ComplexKahlerGeometry: `Density`;
   - AlgebraicTopology: `fullSimplexEquivStdSimplex`, `Manifold.Orientation.pullback`.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at main's pins.

## R02 (P2) — 0.4's `SmoothTwoForm` migration and 12.3's trace formula are already in Tau Ceti at main's pin

**Location.**
- README 530–538: "Smooth 2-forms, defined in `Geometry/Manifold/TwoForm/Basic.lean` as `TauCeti.SmoothTwoForm` … migrate to the generic `SmoothForm I M ℝ 2` in layer 0.4. Refactor the existing implementation".
- The same plan appears at 815–827 (with its *Acceptance*), 833–835, 841–843, 154–155 and 3092.
- README 2818–2820: "plans the trace formula for the Laplacian in an orthonormal basis of the Hessian".
- `Suggested.lean:74–75`: "the migration equivalence of 0.4 lacks the generic carrier in Tau Ceti".

**Claim.** At `2fd255d9` the migration has been done (Tau Ceti #17706). That is the pin of this README's contract and of main.
- `TauCeti.SmoothTwoForm I M` is the generic carrier.
- Closedness is `mextDeriv = 0`.
- The symplectic files are stated on that carrier.
- The "linear equivalence" the target asks for is the identity, and "the old independent carrier is removed" already holds.

The trace formula 12.3 plans is also there. The docstring clause contradicts README 375, which names `TauCeti.SmoothForm` as an existing Tau Ceti carrier. As in the previous rounds, planning what `2fd255d9` proves is P2.

**Witness.** Tau Ceti `2fd255d9`:
- `Geometry/Manifold/TwoForm/Basic.lean:37–39`: `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`;
- `DifferentialForm/Closed.lean:43`: `def IsClosed (form) : Prop := mextDeriv form.1 = 0`;
- `Riemannian/Laplacian.lean:601`: `laplaceBeltrami_eq_sum_hessian`, which says `Δf = Σ hessian f (bᵢ) (bᵢ)`.

**Repair.**
- Replace README 530–538 by: "`TauCeti.SmoothTwoForm I M` is Tau Ceti's abbreviation for `SmoothForm I M ℝ 2` (`Geometry/Manifold/TwoForm/Basic.lean`). Closedness is the generic `TauCeti.SmoothForm.IsClosed`, `mextDeriv φ = 0` (`DifferentialForm/Closed.lean`). The symplectic API of `Geometry/Symplectic/Manifold/{TwoForm,Energy}.lean` is stated on it. Nothing about it is planned here."
- In 0.4, delete from "Refactor Tau Ceti's existing `SmoothTwoForm`" to "as a migration check", and the *Acceptance* clauses about the old carrier. Keep the flat-pullback acceptance. Drop "for the migration, …" from *Needs*.
- In the second Check of 0.4, replace the migration clause by "`TauCeti.SmoothForm.IsClosed` is `mextDeriv = 0`".
- Delete "layer 0.4 owns migration of its existing 2-form API and consumers to the generic carrier" (154–155) and "the migration of 0.4" (3092).
- Delete "the migration equivalence of 0.4 lacks the generic carrier in Tau Ceti;" from `Suggested.lean:74–75`.
- In 12.3 write "consumes them by name, with the trace formula `TauCeti.Manifold.laplaceBeltrami_eq_sum_hessian` (`Riemannian/Laplacian.lean`), and plans the `Δ` notation instance". Add the name to the 12.2–12.5 list of *From Tau Ceti*.

Tested: both names resolve at `2fd255d9` (namespaces `TauCeti.SmoothForm` and `TauCeti.Manifold`). The edit to `Suggested.lean` is docstring-only.

## R03 (P3) — `toFlow_apply` and `isCompleteVectorField_of_compactSpace` are padding, kept for a MorseNovikov import that does not exist

**Location.**
- `Suggested.lean:62–63`: "`isCompleteVectorField_of_compactSpace` and `toFlow_apply` are the completeness input and the rewriting rule of MorseNovikov's flow of the negative dual field".
- `Suggested.lean:602–649`.
- README 3100–3102: "importing `toFlow`, `isCompleteVectorField_of_compactSpace`, `toFlow_apply`, `flowOf` and `closedForms` from `Suggested.lean`".

**Claim.**
- MorseNovikov on main imports only Mathlib. Its open revision imports Mathlib and one Tau Ceti module, and names `toFlow` only in README prose.
- No file on main uses these names.
- `toFlow_apply` is `rfl`: it restates the definition.
- `isCompleteVectorField_of_compactSpace` is one `simp` with `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo`, and is `TauCeti.isCompleteVectorField_of_compactSpace` at `2fd255d9`.
- Without them, `toFlow` and `IsCompleteVectorField` occur in no statement of the file.

**Witness.** Main's `TauCetiRoadmap/MorseNovikov/Suggested.lean:3` `public import Mathlib` is its only import. Searching for `toFlow|IsCompleteVectorField|isCompleteVectorField_of_compactSpace` in the five files on main that import this module gives 0 hits.

**Repair.**
- Delete `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow` and `toFlow_apply` (`Suggested.lean:602–649`).
- In the module docstring, delete the MorseNovikov sentence (`:62–63`) and these names from `:64–67` and `:90`.
- In README 3.3 (1257–1266), cite `TauCeti.IsCompleteVectorField` and `TauCeti.isCompleteVectorField_of_compactSpace`. State the `Flow ℝ M` target in prose with no backticked own name, and drop `toFlow` from line 600.
- Replace 3100–3102 by "**MorseNovikov**: layers 0–3, 5–6, 8, 10 and 12, and `circleAngularForm`". That is its own *From TauCetiRoadmap.DifferentialGeometry* (main, README 26 and 147–153).

Tested: a scratch copy with `:602–649` deleted elaborates with exit 0 and only the 32 `sorry` warnings.

## R04 (P3) — Two Tau Ceti locators are the old pin's names

**Location.**
- README 322: "`Geometry/Manifold/LocalDiffeomorph.lean`, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`".
- README 968: "For `TauCeti.Contour.IsPiecewiseC1On γ s₀ s₁`".
- README 983: "Tau Ceti's `TauCeti.Contour.IsPiecewiseC1On`".

**Claim.** At `2fd255d9`, the pin every other citation uses, the theorem is in `Geometry/Manifold/LocalDiffeomorph/Basic.lean`. The predicate is `TauCeti.IsPiecewiseC1On` for curves `ℝ → E`. Main's own pin bump renamed it in this folder's `Suggested.lean`.

**Witness.** Tau Ceti `2fd255d9`, `Analysis/Calculus/ContDiff/PiecewiseC1On.lean:78` `namespace TauCeti`, `:91` `def IsPiecewiseC1On (γ : ℝ → E)`. There is no file `Geometry/Manifold/LocalDiffeomorph.lean`. Main's commit `a891cd19` replaces `TauCeti.Contour.IsPiecewiseC1On` by `TauCeti.IsPiecewiseC1On`.

**Repair.** README 322: `Geometry/Manifold/LocalDiffeomorph/Basic.lean`. README 968 and 983: `TauCeti.IsPiecewiseC1On` (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean`). Tested: both resolve at `2fd255d9`, together with `TauCeti.IsPiecewiseC1On.absolutelyContinuousOnInterval`, which line 2068 cites.

## R05 (P3) — The description states no order against #334 and #1187, and still describes nine Lean modules

Re-raised: H03. The recorded reason is that the description is outside a repair job's files. That does not hold here: the author can edit the description, and nothing else repairs it.

**Location.** The pull-request description:
- "The nine Lean modules retain the full existing programme …";
- "330 intentional admission warnings";
- "PlanarPrimitiveTargets.lean";
- no mention of `334` or `1187`.

**Witness.** The overlap report at this head says "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`". The folder holds one `.lean` file with 32 admissions.

**Repair.**
- Add to the description: "This head supersedes #334. For this folder, #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main."
- Replace the paragraphs about nine modules, 330 and 392 admissions and `PlanarPrimitiveTargets.lean` by "The folder holds one Lean file with 32 admitted theorems."

## Verified sound

**Gate and dependency check.** The worker's gate at this head reports every scanner `0` and the build `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty. The dependency check (`--movable`, the board's `ORDER.txt`) reports:

    depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. DifferentialGeometry is on main and names only Mathlib, Tau Ceti and main roadmaps as suppliers. DeRhamCohomologyAndDuality appears only as an owner of deferred items and as a consumer.

**Elaboration.** I ran `lake env lean` on the worktree's `Suggested.lean` (Tau Ceti `358314d4`, Mathlib `f6090c7`): exit 0 in about 28 s, with 32 `declaration uses sorry` warnings and nothing else. The file has no `set_option`, no admitted `def`, `instance` or `example`, and no `lemma`.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 82 declarations (exit 0) and compared the binders with the README. The comparison found no defect:
- 3.2 Banach and 3.5 Banach carry `[CompleteSpace E] [T2Space M] [BoundarylessManifold I M]`.
- `exists_flowOf_one_eq`, `hasDerivAt_mpullback_flowOf`, `exists_chart_mfderiv_eq_const` and `timeDependentFlowDomain_eq_univ` carry `[FiniteDimensional ℝ E]` and not `CompleteSpace`. The last also carries `[CompactSpace M]`.
- `exists_topForm_of_orientation` carries `[T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M]`.
- `orientable_iff_exists_atlas` carries `[BoundarylessManifold I M] [IsManifold I 1 M]`.
- The four 12.5 declarations carry `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]` and both Riemannian regularity instances.

The Banach target `exists_contDiffAt_localFlow_of_completeSpace` has exactly the conclusion of Tau Ceti's `ODE.exists_contDiffAt_localFlow` (`358314d4`, `Analysis/ODE/InitialCondition.lean:215`), with `[CompleteSpace E]` in place of `[FiniteDimensional ℝ E]`.

**Padding probe.** On a scratch copy I replaced each `sorry` with `first | rfl | infer_instance | (simp; done) | trivial | (intros; rfl)`. That made 32 replacements and gave an error at each of the 32 sites; none closes. The proved-in-place padding is R03.

**Headline theorems** (README 13–18):
- Stated in `Suggested.lean`: Banach flows (3.1–3.2), Frobenius and leaves (six theorems of 4.2–4.4), the hairy ball theorem (11.1–11.2), and the divergence theorem with boundary (12.5).
- Tau Ceti's at `2fd255d9` (R01): half-space Stokes, Green for AC cycles and for finite divisions, and Laplace–Beltrami.
- Not statable at either pin, each named in the docstring with the missing construction: corner Stokes (5.5b) and the de Rham theorem (8.5).
- Statable only at `2fd255d9` (R01): 2.4, 9.2, 9.3 and 10.4.

**Seeded sample (8 targets).**
- "Smooth 2-forms" (530–538): wrong at `2fd255d9` (R02). At `358314d4`, `SmoothTwoForm` is still a standalone structure.
- "Canonical interfaces and reuse" (1372–1408): all nine files exist at `2fd255d9`, and four of them are missing at `358314d4` (`IntegralManifold`, `Diffeomorph`, `Splitting`, `Annihilator`). `IsInvolutiveDistribution` (`Distribution.lean:351`) tests fields that are differentiable and tangent on an open set, as stated. `IsInvolutiveDistribution.exists_eventually_hasFDerivAt` is in `Distribution/Graph.lean`.
- "Acceptance examples", layer 4 (1597–1607): Tau Ceti's fibre is `c = x b` (`Distribution.lean:497–501`). `S⁻¹` of it at `S p` is `ker(dz − y dx)`, as stated. `not_isInvolutiveDistribution_standardContactDistribution` is at `:560`.
- "Acceptance examples", 5.6 (2289–2312): all eleven names exist at `2fd255d9` and none at `358314d4`. `green_ellipse_area` (`Examples/CurveArea/Green.lean:59`) states `π·a·b` for all real `a, b`. `oscillatoryPrimitive t = t²·sin((t²)⁻¹)` (`GaugeFTC.lean:36`), and its Henstock integral is `sin 1` (`:81`).
- "Conventions and existing inputs" (2026–2046) and "Henstock–Kurzweil" (2180–2195): `TauCeti.Contour.windingNumber` (`Winding/Number/Basic.lean:76`) and the six `BoxIntegral`/Green names exist at `2fd255d9`. Thirty Mathlib names of the README exist at both Mathlib pins (`f6090c7` and `1b1ccf4`), among them `AbsolutelyContinuousOnInterval`, `IntegrableOn.hasBoxIntegral`, `curveIntegral_eq_intervalIntegral_deriv`, `ContinuousOn.curveIntegrable_of_contDiffOn`, `Complex.contDiffAt_log`, `ContinuousAlternatingMap.ofSubsingletonLIE`, `extDeriv_constOfIsEmpty`, `range_mfderiv_coe_sphere`, `ModelWithCorners.ofConvexRange` and `Convexity.StdSimplex`.
- "Flat punctured-plane family" (2314–2327): values are in the table. No native exists, so it remains a target.
- "Ownership and ordering" (2329–2344): `Completed/ContourIntegration`, `Completed/ConformalMapping` (Layer 5 holds the filled-hull material), `PDE` and `ModularForms` exist on main.
- The README flags no locator as unverified.

**Cross-roadmap citations resolved on main.**
- GeometricMeasureTheory G1 (README 106), G2 (148), G6 (275).
- Isoperimetry I3 (182), I6 (397).
- HeegaardFloer §2.1 (1351) and F2.1 (2437, "Lane F2, item 1").
- SmoothBundlesConnections B5.0–B5.2.
- PseudodifferentialOperators P1.0 (164).
- ComplexKahlerGeometry K5 (568) and K5a (33).
- AlgebraicTopology Stage 6 (946), 6.3 and 6.5.
- DeRhamCohomologyAndDuality §§2.1–2.2 (292, 322), §4.1 (512) and Layers 1–5. It is on main, and its main text imports DG layers 0–11 (its README 42–48), as DG's consumer list says.
- `Completed/HopfRinow`, `Completed/UniversalCovers`, `RepresentationTheory/LieGroups` and `DGAInfinity` exist.

The citation resolver's seven Lean-name leads are this roadmap's own declarations, all in `Suggested.lean`.

**Overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39. ConvexityToric, LocalVariationalFieldTheory and StringOrientation cite §5.5. No cited id is dropped by an open pull request, and none is defined only by an open revision. The conflicting pull requests are R05.

I checked ownership against the open heads with `roadmaps grep`:
- GeometricTopology's open revision (its README 231–235, 1082–1091) and CalibratedGeometry (82) consume DG.
- The open DeRhamCohomologyAndDuality revision narrows its DG consumption to 8.3–8.5. That revision is not a dependency, and DG matches main.
- TangentialBordism's "smoothing theorem" is for maps, a different object.
- No object has two owners.

**Library declarations opened** (Tau Ceti `2fd255d9`, besides those named above):
- `DifferentialForm/Pullback/Smooth.lean:192`: `IsSmoothBundleForm.mpullback` covers fixed coefficients only, so the bundle-valued 0.3 headline is new.
- `Orientation/Pullback.lean:173, 205`.
- `Riemannian/Laplacian.lean:601`; it has no `Δ` instance.
- `Foliation/Basic.lean:63`.
- `Flow/Complete.lean:61`.
- `Orientation/Lift.lean:52`, `Orientation/Basic.lean:140`.
- None of these exists at `2fd255d9`: a triviality theorem for the orientation cover, `d` commuting with `invariantPart`, an outward orientation of `Sⁿ`, homotopy-operator naturality, Mayer–Vietoris induction, `deRhamHom`, `chainIntegral`, all-dimensions Sard, the degree formula, Poincaré duality, `immersionMetric`, the boundary divergence theorem, a density structure, or the hairy ball theorem. These targets are open.

At `358314d4`: `Analysis/Contour/PiecewiseC1On.lean:73, 86`, `IntegralCurve/Maximal.lean:364`, and the old `structure SmoothTwoForm`.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.3 `isSmoothBundleForm_mpullback` | `f = id`; constant `f ≡ c` in degree `≥ 1` and `0`; `n = 0`, `f = \|x\|`, `φ = dx` | `bundleMpullback id φ = φ`; `0` and the constant `φ c`, both `C⁰`; `±dx` off `0` and junk `0` at `0`, discontinuous | holds; `C^(n+1)` on `f` needed | none |
| 1.1 `mextDeriv_add` (kept) | `φ = ∛x dy`, `η = (x − ∛x) dy` at `0` | `d(φ+η)(e₁,e₂) = 1`; `dφ(0) = dη(0) = 0` (junk), sum `0` | `C¹` needed and present | none |
| 2.2 `exists_topForm_of_orientation` | `dim E = 0` with sign `−` at some points; `ℝ` standard | the only basis is empty with `Basis.orientation = +`: vacuous at `−` points, `φ = 1` elsewhere; `dx(e₁) = 1 > 0` | holds | none |
| 2.2 `orientable_iff_exists_atlas` | empty `M`; `Icc 0 1` over `𝓡∂ 1`; `ℝ` with `{id}` and `{id, t ↦ −t}` | both sides true; orientable with no oriented atlas, excluded by boundaryless; `{id}` oriented, the other has transition derivative `−1` | holds | none |
| 2.2 `pullbackSign_mul_pullbackSign` | `ℝ` with `t ↦ t` at points `≥ 0` and `t ↦ −t` at points `< 0`; `f = id`, `y = 1` | chart at `0`: `(+1)(+1) = +1`; chart at `−1`: `(+1)(−1) = −1`; product `−1` = sign of `t ↦ −t` | holds | R01 step 4 |
| 3.1 Banach local flow | `v = 1` on `ℝ`; `v = 0`; `v = Ax` on `ℓ²`; `v = x²` near `1` | `x+t+u` on both sides of the law; `Φ = id`; `e^{tA}x`; with the Lipschitz cutoff `χ(‖x−1‖)·v`, a global flow equal to `1/(1/x − t)` near `(1,0)` | holds | none |
| 3.2 Banach openness and smoothness | `v = x²` on `ℝ`; line with two origins | domain `t < 1/x` for `x > 0`, `t > 1/x` for `x < 0`, all `t` at `0`: open; two maximal curves, excluded by `T2Space` | holds | none |
| 3.3 `exists_flowOf_one_eq` | a point; `ℝ` with `x = 0`, `y = 3`; infinite-dimensional `E`; two points | `v = 0`; `v = 3χ` with `χ = 1` on `[−1, 4]`, giving `3t`, which is `3` at `t = 1`; compact sets have empty interior, so `v = 0` and `x = y`; excluded by `ConnectedSpace` | holds | none |
| 3.4 `hasDerivAt_mpullback_flowOf` | `v = ∂x`, `w = x ∂y` on `ℝ²` | pullback `(x+t)∂y`, derivative `∂y`; `Dw·v − Dv·w = ∂y` | sign agrees with `mlieBracket` | none |
| 3.4 `exists_chart_mfderiv_eq_const` | rotation `(−y, x)` at `(1,0)`; a zero of `v` | polar chart gives `∂θ = e₂`; at a zero `u = 0` contradicts an invertible chart derivative, excluded by `hx` | holds | none |
| 3.5 `timeDependentFlow_spec` | `v s x = s` on `ℝ`; `v = x²` | `x + (t²−s²)/2`: equals `x` at `t = s`, `∂t = t`; `(r²−t²)/2 + (t²−s²)/2 = (r²−s²)/2`; `1/(1−(t−s))` for `t < s+1`, open | holds | none |
| 3.5 `timeDependentFlowDomain_eq_univ` | `S¹`, `J = (0,1) ∪ (2,3)`, `v = 0`; `ℝ`, `v = x²`; `J = ∅` | `(2.5, 0.5, x)` not in the domain, excluded by `OrdConnected`; domain proper, excluded by `CompactSpace`; empty type, `= univ` | holds | none |
| 4.2 `isInvolutive_iff_forall_mextDeriv` | contact `ker(dz − y dx)`; `span(∂x, ∂y)` on `ℝ³` | `dη = dx∧dy` and `dη(∂x + y∂z, ∂y) = 1`, `[Y,X] = ∂z ∉ D`: both sides false; for `η = f dz`, `(df∧dz)(v,w) = 0` on `D`: both sides true | holds | none |
| 4.3 `exists_isSliceChart_integralManifold` | `span(e₁)` on `ℝ²`; rank `0` | `id '' (ℝ×{0}) = univ ∩ (ℝ×{0})`, dimension `1`; `P = {e x}`, direction `⊥`, dimension `0` | holds | none |
| 4.3 `exists_contMDiff_factor` | discrete `ℝ` carrier; double cover `z ↦ z²` | `id : ℝ → ℝ_disc` discontinuous, excluded by second countability; not injective, excluded by `hinj` | hypotheses needed | none |
| 4.4 `exists_leaf` | rank `0`; rank `dim M`; irrational slope on `ℝ²/ℤ²` | `{x}`; connected component; carrier `ℝ`, injective, dense image | holds | none |
| Layer 4 acceptance | `S(x,y,z) = (y,x,z)`, Tau Ceti's fibre `c = x b` at `S p` | `S⁻¹{c = y b} = {c' = y a'} = ker(dz − y dx)` at `p` | holds | none |
| 5.4 `planarRadialPrimitive_hasFDerivAt` | `a = 0` with `(P,Q) = (1,0)`, `(x,y)`, `(−y,x)`; `z = a = 1+i` | `g = x`, `dg = dx`; `g = (x²+y²)/2`; `∂yP = −1 ≠ 1 = ∂xQ` (excluded), `g = 0 ≠` a primitive; `g(a) = 0` | holds; closedness needed | none |
| 5.4 coordinate formula for `K(H^*(A dx∧dy))` | `H(p,t) = a + t(p−a)`, contraction in the first slot | `ι_∂t H^*ω = A(H)(−tv dx + tu dy)`, so `η = −vI dx + uI dy`; `∂x(xI) + ∂y(yI) = 2I + (A − 2I) = A` | sign and slot order hold | none |
| 5.4a `moving_pullback_hasDerivAt` | `P = x + t e₁`, `ω = x dy`; `P = e^t x` on `ℝ`, `ω = dx` | `∂t = dy` and `d0 + ι_{e₁}(dx∧dy) = dy`; `e^t dx` and `d(e^t x) + 0 = e^t dx` | holds | none |
| 5.5a `Density`, `m < dim` | `2·id` against doubling `span v` | `2^dim f(v) = 2^m f(v)`, so `f(v) = 0`; `dx(−1) = −1 ≠ \|−1\|·dx(1)` | holds | none |
| 5.5b product and corner signs | `[0,1]²` with `ω = y dx`; corner of `Q²` | `∫ dω = −1`, top edge leftward `∫₁⁰ 1 dx = −1`; facet coefficients `(−1)¹`, `(−1)²` give the corner `+1` and `−1` | holds | none |
| 5.6 punctured family (sample) | symbolic; `α = 0, 1`; unit circle | `2ρ^{−α} − 2αρ^{−α−1}(x²+y²) = 2(1−α)ρ^{−α}`; `2`, `0`; integrand `(c−s)(−s) + (c+s)c = 1`, `∫ = 2π` | holds; not exact for any `α` | none |
| 5.6 acceptance (sample) | ellipse `a = 2, b = ½`; bow tie `(0,0),(1,1),(1,0),(0,1)`; gauge FTC | `πab = π`; shoelace `0 − 1 + 1 + 0 = 0`; `h(1) − h(0) = sin 1 ≈ 0.8415`, with `h(0) = 0·sin(0⁻¹) = 0` | holds, at `2fd255d9` only | R01 |
| 11.1 hairy ball | `n = 0`; `n = 1` with `v = ix`; `n = 2` with `(−x₂, x₁, 0)` | `v x · x = 0` forces `v = 0`; nowhere zero, excluded by `Even n`; zeros at `(0,0,±1)` | holds | none |
| 12.5 divergence theorem | half-line `n = 0`, compactly supported `X(t)∂t`; `X = 1`; flat closed disc, `X = x∂x + y∂y` | `∫₀^∞ X' = −X(0)` with `N = −∂t` and flux `−X(0)`; `0 ≠ −1`, excluded by the support hypothesis; `∫ div = 2π = ∫_{S¹} ⟨X,N⟩` | holds | none |
| 12.3 Hessian Check | `g = e^{2x}δ` on `ℝ²`, `f = x₁`, `(e₂,e₂)` | `Γ²₂₁ = 1`, `⟨e^{−2x}Γ²₂₁∂₂, ∂₂⟩_g = 1`; flat value `0` | holds | none |
| 12.4 `d(ι_X dV) = (div X) dV` | `g = diag(4,1)`; `g = e^{2x}δ`, `X = ∂x` | `√det g = 2`; `d(e^{2x}dy) = 2dV` and `div X = e^{−2x}∂x(e^{2x}) = 2` | holds | none |
| 0.4 migration | main's pin | `SmoothTwoForm I M := SmoothForm I M ℝ 2`; `IsClosed := mextDeriv form.1 = 0`; the equivalence is the identity | already in the library | R02 |
| 12.3 trace formula | main's pin; flat `ℝⁿ`, `‖x‖²` | `Δf = Σ Hess f(bᵢ,bᵢ)`; `Σᵢ 2 = 2n` | already in the library | R02 |

## Not verifiable

- [Lee] GTM 218: the only copy in the sources cache is hosted on a third party's personal page, which is not a source this review may treat as legal. I did not use it. The theorem and page locators of [Lee] are carried by citation and were not checked against text. In particular, I did not check whether [Lee, Thm. 16.32] assumes an orientation, which 12.5 does without. [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy found.
- The statements R01 steps 2–4 ask for were decided by reading Tau Ceti at `2fd255d9`. They were not elaborated, because the worktree's packages are at `358314d4` and the brief allows elaboration only there.
- I checked ownership against open pull requests with `roadmaps grep` over all open heads and by reading DeRhamCohomologyAndDuality's head. Other heads were not read in full.

## Source issues

- none
