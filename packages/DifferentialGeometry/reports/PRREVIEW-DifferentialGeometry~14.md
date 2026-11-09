# Review of DifferentialGeometry (pull request #886 at e7464d1)

**Verdict:** needs changes

This is a full review of the head `e7464d1`, which the previous review also read; the folder has not changed since then. Both carried findings stand (R01, R04). The full pass found one new blocking defect: the slice clause of `Distribution.exists_isSliceChart_integralManifold` holds for every chart and every set (R02). It also found two padding declarations (R03) and gaps in the README's shape (R05). The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem.

## R01 (P2) — The folder is written against Tau Ceti `358314d4`; main pins `2fd255d9`, which already proves many of its admitted headlines, and `Suggested.lean` conflicts with main

Re-raised: R01. The repair report of `4d6e96e` said this has to wait until the branch is updated. That reason says who must act, not that the defect is gone. The folder still cannot merge, and its acceptance test still states as targets theorems the pinned library of main proves. Merging `origin/main` is outside a repair job's files, so this needs the worker or a human.

**Location.** `lake-manifest.json` is unchanged from the merge base `4dffb5d` (Tau Ceti `358314d4`, Mathlib `f6090c70`, Lean `v4.35.0-rc3`). `TauCetiRoadmap/DifferentialGeometry/README.md:300–303` reads "cited at Tau Ceti `2fd255d9`, the revision the content repository's `lake-manifest.json` pins; these modules postdate the revision `358314d4` that this folder's `Suggested.lean` is written against". README 248–253 and 992–995 also describe main's pin.

**Claim.** Main (`34f48ff`) pins Tau Ceti `2fd255d9` and Lean `v4.36.0-rc2`. It also edited this folder's `Suggested.lean` in the pin bump (`a891cd19`). At main's pin, Tau Ceti proves or declares much of what `Suggested.lean` admits or defines. The README's revision hashes are process narrative, not timeless text.

**Witness.** `git merge-tree --write-tree HEAD origin/main` lists `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at stages 1, 2 and 3, a content conflict. At `2fd255d9`, 23 of the 61 admitted declarations share a name with a sorry-free Tau Ceti theorem. Three examples:

- `TauCeti.Green.green_ac_winding` (`TauCeti/Analysis/Green/Winding.lean:30`) has the same hypotheses and conclusion as `Suggested.lean:1372`.
- `hessian_symm` is at `Geometry/Manifold/Riemannian/Laplacian.lean:197`.
- `mextDeriv_mextDeriv` is at `Geometry/Manifold/DifferentialForm/Squared.lean:72`.

The 0.4 migration of the sampled passage "Smooth 2-forms" (README 358–366) is already done there: `TwoForm/Basic.lean:37` reads `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`.

**Repair.**

1. Merge `origin/main`.
2. Rewrite `Suggested.lean` against `2fd255d9`. Delete every admitted theorem and every carrier Tau Ceti now declares, and cite them in *From Tau Ceti*. Keep, or move to Tau Ceti's names, the declarations that main's consumers import: `SmoothForm` and `mextDeriv` (ContactGeometry), `Density` (ComplexKahlerGeometry), and `orientationAt`, `fullSimplex`, `fullSimplexEquivStdSimplex` and `Manifold.Orientation.pullback` (AlgebraicTopology).
3. State the headlines that become statable at that pin on the native carriers: 5.3, 8.5, 9.2, 9.3 and the 10.4 integral formula. Delete them from the docstring's list of headlines that cannot be stated.
4. Replace the hashes in README 248–253, 300–303 and 992–995 with "the pinned Tau Ceti", then rebuild.

The repair is tested by `git merge-tree` reporting no conflict and by elaboration at `2fd255d9`.

## R02 (P2) — `Distribution.exists_isSliceChart_integralManifold`: the slice clause holds for every chart and set

**Location.** `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:1075–1083`: "∃ (N : IntegralManifold I ∞ D k) (e : OpenPartialHomeomorph M E) (S : Set E), x ∈ range N.inclusion ∧ x ∈ e.source ∧ TauCeti.IsSliceChart e S (range N.inclusion)". The README at 1052–1062 promises "flat charts and local integral slices".

**Claim.** At the pin, `TauCeti.IsSliceChart φ S A` is `φ '' (φ.source ∩ A) = φ.target ∩ S` (`TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:169`). In the statement both `e` and `S` are existential, and `e` need not be a chart of the atlas or even smooth. Taking `S := e '' (e.source ∩ A)` satisfies the clause for every `e` and `A`. The theorem therefore asserts only that an integral manifold passes through `x`, which `exists_leaf` already gives. Nothing about slices is stated. The defect dates from the roadmap's first edition on main and is reviewed here as part of the full pass.

**Witness.** This proof elaborates at the pin (scratch file, `lake env lean`, exit 0):

```lean
example (e : OpenPartialHomeomorph M F) (A : Set M) :
    TauCeti.IsSliceChart e (e '' (e.source ∩ A)) A :=
  (Set.inter_eq_right.mpr ((Set.image_mono Set.inter_subset_left).trans
    e.image_source_eq_target.subset)).symm
```

On the torus, the whole dense irrational leaf, taken with any chart, satisfies the clause.

**Repair.** Make `e` a smooth chart and `S` an affine `k`-plane, and state the same in README 4.3. The following signature elaborates at the pin:

```lean
∃ (N : IntegralManifold I ∞ D k) (e : OpenPartialHomeomorph M E) (W : Submodule ℝ E) (c : E),
  x ∈ range N.inclusion ∧ x ∈ e.source ∧ Module.finrank ℝ W = k ∧
  ContMDiffOn I 𝓘(ℝ, E) ∞ e e.source ∧ ContMDiffOn 𝓘(ℝ, E) I ∞ e.symm e.target ∧
  TauCeti.IsSliceChart e (c +ᵥ (W : Set E)) (range N.inclusion)
```

Tested on two instances:

- For the constant family `span e₁` on `ℝ²` with `N = (u ↦ (u, 0))` and `e = id`, the clause reads `id '' (ℝ × {0}) = univ ∩ (0 +ᵥ span e₁)`, which holds.
- The whole irrational leaf meets a chart's target in infinitely many parallel segments, which no single affine line describes, so the leaf no longer satisfies the clause. A plaque still does.

## R03 (P3) — Padding: `isCompleteVectorField_of_compactSpace` and `toFlow_apply`

**Location.** `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:834–840` and `866–871`; README 896–899.

**Claim.**

- `isCompleteVectorField_of_compactSpace`: its own docstring calls it "the `flowDomain` form of Tau Ceti's `isMIntegralCurve_maximalIntegralCurve`". It is not a headline, and it closes with one `simp` over one pinned lemma. The docstring's "`toFlow` consumes it" is also wrong, because `toFlow` takes `hc` as a hypothesis.
- `toFlow_apply` is proved by `rfl`. Its docstring says it is "Kept because MorseNovikov's `Suggested.lean` consumes it by this name". That is false: MorseNovikov's `Suggested.lean`, on main and at its open head, imports only `Mathlib` and never mentions `toFlow`. `roadmaps grep toFlow_apply` finds it only in this folder and in #1187's copy of it.

**Witness.** This proof elaborates at the pin:

```lean
eq_univ_of_forall fun p ↦ by
  simp [flowDomain, TauCeti.maximalIntegralCurveFlowDomain,
    maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo hv
      (zero_mem_maximalIntegralCurveInterval (x := p.2) hv.contMDiffAt) isCompact_univ
      (fun _ _ ↦ mem_univ _)]
```

The lemma it uses is at `TauCeti/Geometry/Manifold/IntegralCurve/Maximal.lean:364`.

**Repair.** Delete both declarations from `Suggested.lean`. In README 896–899, write them as prose, because a backticked name of this roadmap's own must be declared in `Suggested.lean`. For example: "compact-manifold completeness, Tau Ceti's `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo` read in the `flowDomain` form", and "whose maps are `flowOf` by definition".

## R04 (P3) — Two other open pull requests change this folder and the description states no order

**Location.** The pull-request description (data). It names neither #334 nor #1187.

**Claim.** Carried unchanged from the previous review (its R02). The overlap report computed for this head still lists both pull requests as conflicting with it.

**Witness.** Overlap report for `e7464d1`: "#334 and #886 conflict in … `README.md`, … `Suggested.lean`" and "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` … `lake-manifest.json`". Searching the description for `334` and `1187` finds 0 matches.

**Repair.** Add one sentence to the description, for example "this head supersedes #334; #1187 is rebased on this head after it merges". The README must not name pull-request numbers.

## R05 (P3) — README shape: no *Needs:* lines in layers 0–5.6 and 12, two definitions without Checks, and no *Downstream consumers*

**Location.** The first `*Needs:*` line is at README 1774 (7.4), and all ten fall in 7.4–11.2. The `**Checks.**` list of 5.5b (1329) covers only `fullSimplex`. 12.4 (2120–2129) has none. There is no `## Downstream consumers` heading.

**Claim.**

- Layers 0–5.6 and 12 give their dependencies only through the layer-level paragraph of *How to read the build*. For example, 5.3 Stokes, 5.5a densities and 12.5's divergence theorem carry no per-target *Needs:* line.
- 5.5b's smooth face structure, `LocalBoundaryGerm` and `∂̃M` have no Checks list. Neither does 12.4's Riemannian volume form and density. Neither definition exists at either pin.
- Consumers appear only inside *Scope and ownership*.

**Witness.** `grep -n '\*Needs:\*'` lists README lines 1774, 1841, 1874, 1897, 1925, 1939, 1995, 2023, 2036 and 2043. `grep -n '\*\*Checks'` lists no line between 1329 and 1458 that belongs to the face structure, and no line between 2109 and 2177.

**Repair.**

1. Add a *Needs:* line to each target of layers 0–5.6 and 12, for example 5.3: *Needs:* 5.1; 5.2; the half-space flat divergence theorem; partitions of unity.
2. Add Checks for the face structure:
   - `Q²`'s abstract boundary is two facets, and the corner has a fibre of size 2.
   - `j` over `[0,1]²` has fibres of size 2 at the four corners.
   - For the half-space, `∂̃M` is Tau Ceti's boundary.
3. Add Checks for 12.4:
   - On flat `ℝⁿ`, `dV = dx¹∧…∧dxⁿ`.
   - For `g = diag(4,1)`, `dV = 2 dx∧dy`.
   - Reversing the orientation negates `dV` but not the density.
   - For `X = x∂ₓ + y∂ᵧ`, `d(ι_X dV) = d(x dy − y dx) = 2 dx∧dy = (div X) dV`.
4. Add a `## Downstream consumers` section listing DeRhamCohomologyAndDuality, AlgebraicTopology 6.3, GeometricTopology, ComplexKahlerGeometry, ContactGeometry, MorseTheory, MorseNovikov and HeegaardFloer, with the sections each one consumes.

## Previous findings

- **R01 — not repaired.** `lake-manifest.json` still pins `358314d4`. README 300–302 still reads "`2fd255d9` … postdate the revision `358314d4` that this folder's `Suggested.lean` is written against". `git merge-tree` against main `34f48ff` still conflicts in `Suggested.lean`. Carried and re-raised as R01.
- **R02 — not repaired.** The description quoted for this head contains neither `334` nor `1187`. Carried as R04.

## Verified sound

**Gate.** The worker's gate and my rerun (`gate … --base origin/main`) report every scanner at `0`. The rerun reports `OK`. The worker's run, which includes the targeted build, reports `build=0`.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at the branch pin (Tau Ceti `358314d4`, Mathlib `f6090c70`) exits 0 in 57 s. It gives 61 `declaration uses 'sorry'` warnings and no other diagnostic.

**Depcheck** (`--movable`):

    depcheck: 238 roadmaps, 2320 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` lists nothing outside the folder.

**Mechanical signature check.** One scratch file with `#check @…` for all 121 declarations exits 0. I compared the elaborated types with the README:

- No definition lost a binder. `IsCompleteVectorField` correctly takes no section instance, and `halfSpaceBoundaryVolume` carries all eleven section instances.
- `exists_flowOf_one_eq` carries `[T2Space M] [BoundarylessManifold I M] [FiniteDimensional ℝ E]` and omits `CompleteSpace`.
- `hessian_symm` carries the `C¹` and the `C^∞` metric instances.
- `isInvolutive_iff_forall_mextDeriv` has no boundaryless hypothesis, as README 4.2 says. I rechecked the criterion with boundary (bump extension of an annihilating covector, and `η(W) ≡ 0` near `x`): it holds.
- `‖N x‖` and `inner` in `exists_halfSpaceOutwardUnitNormal` use the Riemannian instance `instNormedAddCommGroupOfRiemannianBundle…`, not the Euclidean norm (scratch `show_term infer_instance`, and `norm_eq_sqrt_real_inner` closes).

**Padding probe.** I replaced each of the 61 admissions with `first | rfl | (simp; done) | infer_instance | (simp_all; done)` in a scratch copy. That gives 61 errors, one per declaration, so none closes in one tactic. The one-lemma closures are in R03.

**Seeded sample (8 passages, checked at the pin they cite).**

1. "Smooth 2-forms" (358). At the branch pin: `TwoForm/Basic.lean:61` is `structure SmoothTwoForm`; `TwoForm/Closed.lean:296` defines chartwise `IsClosed`; `Symplectic/Manifold/TwoForm.lean:92` is `IsSymplectic`. The passage is accurate at the branch pin and obsolete at main's (R01).
2. "Canonical interfaces and reuse" (968). `Distribution.lean:163` is `IsContMDiffDistribution` (local frames of `k` fields on an open neighbourhood). `:236` is `IsInvolutiveDistribution` (fields that are `MDiff` on an open `U`, exactly as the passage says). `Foliation/Basic.lean:63` and `Distribution/Graph.lean:235` (`IsInvolutiveDistribution.exists_eventually_hasFDerivAt`) both exist.
3. "Acceptance examples" (1090). The pinned carrier is `v.2.2 = p.1 * v.2.1`, that is `ker(dz − x dy)` (`Distribution.lean:338–340`). Pulling it back along `S(x,y,z) = (y,x,z)` gives `dz − y dx`. `not_isInvolutiveDistribution_standardContactDistribution` exists.
4. "Conventions and existing inputs" (1405). `curveIntegral_eq_intervalIntegral_deriv` is at `Mathlib/MeasureTheory/Integral/CurveIntegral/Basic.lean:145`, `IntegrationParams.Henstock` at `BoxIntegral/Partition/Filter.lean:244` and `IntegrableOn.hasBoxIntegral` at `BoxIntegral/Integrability.lean:198`. Tau Ceti's `windingNumber` is in `Winding/Number/Basic.lean`.
5. "Henstock–Kurzweil" (1531). `hasIntegral_GP_pderiv` (`BoxIntegral/DivergenceTheorem.lean:151–159`) is stated for `GP` with a countable exceptional set, as the passage says.
6. "Acceptance examples" (1610): computed in the table.
7. "Flat punctured-plane family" (1630): computed in the table.
8. "Ownership and ordering" (1645).
   - `Completed/ContourIntegration` exists.
   - `Completed/ConformalMapping` has Layer 5 at 733 and consumes `TauCeti.filledHull` at 271–274.
   - PDE's Green kernel is at 494–496.
   - ModularForms owns the Petersson product (17, 206).

The README flags no locator as unverified.

**Other library declarations opened.**

- Tau Ceti at the branch pin:
  - `ODE.exists_contDiffAt_localFlow` (`Analysis/ODE/InitialCondition.lean:215`).
  - `isOpen_maximalIntegralCurveFlowDomain` and `contMDiffOn_maximalIntegralCurve` (`IntegralCurve/Flow.lean:358`, `:370`).
  - `HasDerivAt.metricDerivative_eq`, `AbsolutelyContinuousOnInterval.lintegral_metricDerivative_lt_top` and `ContinuousLinearMap.integral_bilinear_fderiv_sub_prod_Icc` (`MetricDerivative.lean:155`, `:322`; `Integral/DivergenceTheorem.lean:55`).
  - The filled-hull API (`Topology/FilledHull.lean:79`, `:140`; `Analysis/Normed/Module/FilledHull.lean:102`, `:140`, `:187`).
- Mathlib: `leviCivitaConnection` (`CovariantDerivative/LeviCivita.lean:359`), `InnerProductSpace.instLaplacian` (`Laplacian.lean:138`), and `exists_isMIntegralCurveAt_of_contMDiffAt` (`IntegralCurve/ExistUnique.lean:65`).
- Tau Ceti at main's pin (for R01): `Orientation/Basic.lean:164`, `:172` (`ext`, `eq_or_eq_neg`), `Riemannian/VolumeForm.lean:55`, `Boundary/InducedOrientation.lean:108` and `DifferentialForm/HomotopyOperator.lean:100`. Each file I cite in R01 has 0 occurrences of `sorry`.

**Cross-roadmap citations resolved (22).**

- On main, outside RepresentationTheory: HopfRinow, UniversalCovers, OneParameterSemigroups, ContourIntegration and ConformalMapping (all in `Completed/`); GeometricTopology, AlgebraicTopology, HeegaardFloer, PseudodifferentialOperators, DGAInfinity, ComplexKahlerGeometry, PDE, ModularForms, GeometricMeasureTheory and Isoperimetry.
- RepresentationTheory/LieGroups, the "Lie groups" roadmap, owns `lieExp` (45–46) and the closed-subgroup theorem (11).
- MorseTheory cites DifferentialGeometry 12.2 for `mgradient` (README 897–902).
- RiemannianGeometry consumes `laplaceBeltrami` (41).
- The HomotopySpheres head (#284) mirrors 2.1 and cites this roadmap as owner (README 122–128).
- The DeRhamCohomologyAndDuality head (#1768) imports layers 6–11 from this roadmap and owns the relative theory and the inward cone (its README 23–75), matching README 54–76 here. So no object has two owners.

The overlap report's dropped id §5.5 is mapped to 5.5a and 5.5b at README 37–39. The citation tool's seven leads are all declarations of `Suggested.lean`.

**Headline theorems** (README 13–18). At the branch pin, the following are stated:

- the Banach flows (3.2);
- Frobenius and leaves (4.2–4.4), with R02 for the slice clause;
- the hairy ball theorem (11.1–11.2);
- Green for absolutely continuous cycles (5.6.3);
- Laplace–Beltrami with the boundaryless and half-space divergence theorems (12.3, 12.5).

The following are named in the module docstring as not statable, with the missing carrier: Stokes (5.3, 5.5b), the de Rham theorem, Poincaré duality, the degree formula and the division form of Green. That is correct at `358314d4`; R01 covers main's pin.

**Adversarial table.** Rows marked (r11) are carried from earlier reviews, for statements that no later revision has changed. All other rows were computed in this review.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `exists_isSliceChart_integralManifold` | any `e`, `A`; irrational leaf on `T²`; constant `span e₁` | `IsSliceChart e (e''(e.source∩A)) A` proved; leaf + any chart satisfies clause; repaired: `ℝ×{0} = univ ∩ (0+ᵥspan e₁)` | slice clause vacuous | R02 |
| `isCompleteVectorField_of_compactSpace` | one-`simp` proof | elaborates, exit 0 | restates pinned lemma | R03 |
| `toFlow_apply` | `rfl`; consumers | proof `rfl`; MorseNovikov imports: `Mathlib` only | padding, false docstring | R03 |
| headlines vs main pin | 61 admissions | 23 names proved at `2fd255d9`; `green_ac_winding` identical; merge stages 1/2/3 | stale pin | R01 |
| `exists_contDiffAt_localFlow_of_completeSpace`, global law | `E = ℓ¹` (no `C¹` bump); `E = 0` | the local flow is extended to an ℝ-action on all of `E` (choice): `|E∖B'| = |E| = |E|·𝔠`; `SmoothFlow.lean:165` uses the law | true as stated | none |
| `exists_halfSpaceOutwardUnitNormal`, `‖N x‖` | `e^{2y}δ` on `{x₀≥0}` | instance Riemannian; `N = −e^{−y}∂₀` norm 1 (Euclidean `−∂₀` would have norm `e^y`) | metric norm | none |
| `integral_divergence_eq_boundaryFlux` | `[0,∞)`, `X = f∂ₜ`, `f(0)=1` compact support; `X = 1` | `∫₀^∞ f' = −1`, flux `⟪X(0),−∂ₜ⟫ = −1`; `X=1`: `0` vs `−1`, excluded by `hSupport` | holds; support needed | none |
| `isInvolutive_iff_forall_mextDeriv`, with boundary | contact family on `ℝ×[0,∞)×ℝ` | `[∂y, ∂x+y∂z] = ∂z`, `α(∂z)=1`, `dα(X,Y)=1` | ⇐ via bump works at boundary | none |
| `timeDependentFlowDomain_eq_univ` | `J=(0,1)`, `M=S¹`, `v=1/(1−t)` | `θ(t) = θ₀ + ln((1−s)/(1−t))`; `s=.5,t=.9`: `1.609` | defined on `J×J×M` | none |
| `mextDeriv_apply_one` | `φ = x dy`, `V=∂x`, `W=∂y` | `dφ(V,W)=1`; `V(φ W)−W(φ V)−φ[V,W] = 1−0−0` | holds | none |
| `curryLeft_wedgeWith` | `φ=dx`, `ψ=dy`, `v=e₁` | `ι(dx∧dy)=dy`; `1·dy + (−1)·dx·0 = dy` | holds | none |
| `wedgeWith_flip` | `dx`, `dy` at `(e₁,e₂)` | `1` vs `(−1)^1·(−1) = 1` | holds | none |
| `moving_pullback_hasDerivAt` | `P = x+te₁`, `ω = x dy` | `∂ₜ(x+t)dy = dy`; `d(0) + ι_{e₁}(dx∧dy) = dy` | holds | none |
| sample: punctured family | `α=0.7` at `(0.8,−0.3)`; circle | curl formula `0.7478685`, finite difference `0.7478685`; loop `6.283185` | closed iff `α=1` | none |
| sample: ellipse | `a=2`, `b=½` | `∮x dy = 3.141593 = πab` | holds | none |
| sample: HK gate | `h = t² sin t⁻²` | `HK∫₀¹h' = sin 1 = 0.841471` | holds | none |
| sample: contact adapter | `S(x,y,z)=(y,x,z)` | `S^*(dz − x dy) = dz − y dx` | matches pin | none |
| hairy ball 11.1–11.2 | `n = 0, 1, 2` | `S⁰`: `v=0`; `S¹`: `ix` nowhere 0, `Even 1` false; `S²`: `(−x₂,x₁,0)` zero at poles | parity needed | none |
| 2.2 remark, half-space and corner (r11) | strip `[0,1]×ℝ`; `[0,1]`; pentagonal cone | transition det `+1`; signs `+`,`−`; `Aut C = ℝ_{>0}·id` | consistent | none |
| `planarRadialPrimitive` (r11) | `(1,0)`, `(x,y)`, `(−y,x)` | `x`; `(x²+y²)/2`; `0`, `dg ≠ ω` | closedness needed | none |
| `Density` (r11) | `2·id`, `m<dim` | `(2^dim − 2^m)·toFun v = 0` | forced zero | none |
| `curl` (r11) | `(−y,x)`, `(y,x)`, `(0,x)` | `2, 0, 1` | order pinned | none |
| 12.2–12.3 (r11) | `diag(4,1)`; `e^{2x}δ` | `grad x₁ = ¼∂₁`; `div ∂₁ = 2`; `Hess(e₂,e₂) = 1` | metric and covariant | none |
| 3.5 (r11) | `x' = s` | `x + (t²−s²)/2`; two-time law adds | holds | none |
| 1.3 `mextDeriv_add` (r11) | `∛x dy + (x−∛x)dy` at `0` | `0 + 0` vs `dx∧dy` | `C¹` needed | none |

## Not verifiable

- [Lee], GTM 218. The sources service returns "uncertified: the citation resolves only to a paywalled page". The worker's shared cache holds a copy whose header records a third-party personal website, not the author's page or the publisher. This review does not treat that as a legal copy and did not use it, so Lee's locators were not re-verified this round. They were last checked in earlier rounds.
- [Tu], [Bott–Tu] and [Milnor]: no legal copy is available to this worker.

## Source issues

- none
