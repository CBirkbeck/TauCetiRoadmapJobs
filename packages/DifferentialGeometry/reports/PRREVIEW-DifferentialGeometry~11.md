# Review of DifferentialGeometry (pull request #886 at 4d6e96e)

**Verdict:** needs changes

🤖 AI full review of the repaired head: the folder changed by 255 lines since `6f270bf`, so every passage was read again. The gate passes (the worker's run and a rerun: every scanner `0`, `OK`). `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` at the branch's own pin (Tau Ceti `358314d4`, Mathlib `f6090c70`, checked with `git rev-parse` in the package directories) exits 0 in 89 s with 61 `declaration uses 'sorry'` warnings and no other diagnostic. The depcheck reports 0 problems. One blocking finding remains, the one the repair report of `4d6e96e` itself says it cannot apply: the branch is still written against two Tau Ceti revisions and still conflicts with main. Three P3s follow.

## Previous findings (review of `6f270bf`)

- R01 (two Tau Ceti revisions, conflict with main): **not repaired**, by the repair report's own account ("the repair has to wait for the branch to be updated"). The manifest still pins `358314d4`; `git merge-tree --write-tree HEAD origin/main` still reports a content conflict in `Suggested.lean`; README 286–289 still say "cited at Tau Ceti `2fd255d9` … postdate the revision `358314d4` that this folder's `Suggested.lean` is written against". Carried as R01 below.
- R02 (Tau Ceti's oriented-atlas API not cited): **repaired.** *From Tau Ceti* now has an **Oriented atlases** entry (README 243–253) naming `OrientationPreservingOn`, `orientationPreservingGroupoid`, `IsOrientedAtlas I n A` and the class `Orientable I n M`; `orientable_iff_exists_atlas` (`Suggested.lean:740–742`) reads `Orientable I M ↔ ∃ A : Set (OpenPartialHomeomorph M H), TauCeti.IsOrientedAtlas I 1 A`, with the two new Checks (README 787–796). The `Icc` Check and the second-revision claims were verified (table and *Verified sound*).
- R03 (`Distribution.IsInvolutive` restates a pinned predicate): **repaired.** The `Distribution` structure and `IsInvolutive` are gone; the six Layer 4 headlines take `TauCeti.IsContMDiffDistribution I ∞ k D` and `TauCeti.IsInvolutiveDistribution I D` on the family `D` (`Suggested.lean:1033–1117`), and only `Distribution.IntegralManifold` is defined (1016–1024). README 955–963 and the 4.2 Checks (994–1018) follow.
- R04 (`toFlow_apply` is a `rfl` restatement): **answered, reason correct for this head.** On this branch `TauCetiRoadmap/MorseNovikov/Suggested.lean:13` imports this module and uses `toFlow_apply`; main's MorseNovikov imports only `Mathlib`. The deletion is therefore a post-merge step (R01, step 2) and is not raised again.
- R05 (no stated order with #334 and #1187): **not repaired** in the description the worker quoted (data); the repair report hands it to the worker. Carried as R02.

## R01 (P2) — The folder is still written against two Tau Ceti revisions and conflicts with main

**Location:** `lake-manifest.json` (Tau Ceti `358314d4`, Mathlib `f6090c70`, Lean `v4.35.0-rc3`); `TauCetiRoadmap/DifferentialGeometry/README.md:286–289` ("cited at Tau Ceti `2fd255d9` … postdate the revision `358314d4` that this folder's `Suggested.lean` is written against"); layers 6–11 (README 1642–2021); `Suggested.lean:45–65` (the not-statable list).

**Claim:** at the pin this brief names (the branch's manifest, `358314d4`), layers 6–11 consume inputs nobody has: of the 94 distinct `TauCeti.*` names the README cites, 51 do not exist in that tree (`deRhamComplex`, `deRhamCohomology`, `closedForms`, `exactForms`, `compactlySupportedDeRhamCohomology`, `mayerVietorisShortComplex`, `smoothSingularSubcomplex`, `SmoothSimplex`, `poincarePairing`, `IsNullSet`, `IsRegularPoint`, `IsRegularValue`, `degreeAtRegularValue`, `integralTopForm`, `homotopyOperator`, `fullSimplex`, `RoughForm`, `SmoothForm`, `mextDeriv`, `IntegralManifold`, …), nor do five of the files it cites (`Geometry/Manifold/Exhaustion.lean`, which 7.4 *Needs*; `DeRham/Basic.lean`; `AlgebraicTopology/Cohomology/{UniversalCoefficient,MayerVietoris/Basic}.lean`; `AlgebraicTopology/Singular/BrouwerFixedPoint.lean`). At main's pin (`2fd255d9`) every name resolves, but there Tau Ceti already proves 21 of the file's admitted headlines (`green_ac_winding` word for word, `mextDeriv_mextDeriv`, `hessian_symm`, `integral_divergence_eq_zero`, `orientable_of_forall_index_ne_two`, …) and declares 58 of its carriers, and `Geometry/Manifold/Riemannian/Sphere.lean`, which the file imports, no longer exists. Neither revision makes both halves right, and a README that names git revisions is not timeless.

**Witness:** `git merge-tree --write-tree HEAD origin/main` on this head: `CONFLICT (content): Merge conflict in TauCetiRoadmap/DifferentialGeometry/Suggested.lean` (only that file conflicts; the manifest and toolchain merge to main's). In the branch's packages, `ls Geometry/Manifold/Exhaustion.lean` fails; in main's, `Geometry/Manifold/Orientation/OrientedAtlas.lean:283` and `Distribution/IntegralManifold.lean:139` exist exactly as README 249–253 and 960–963 describe them.

**Repair** (the first step is the author's or the worker's, outside the files a repair job may edit; the rest follow it):

1. Merge `origin/main` (or rebase): the manifest then pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` and Lean `v4.36.0-rc2`. Resolve `Suggested.lean` to this branch's file with the import `TauCeti.Geometry.Manifold.Riemannian.Sphere` replaced by the module that now carries `sphereRoundMetric`, and `TauCeti.Geometry.Manifold.Orientation` by `Orientation.OrientedAtlas`.
2. In `Suggested.lean`, delete every admitted theorem a `2fd255d9` theorem implies and every carrier it declares, keeping as abbreviations only the names consumers on main import (AlgebraicTopology's `Manifold.Orientation`, `OrientationLift`, `OrientationLift.setoid`, `orientationAt`, `Manifold.Orientation.pullback`, `fullSimplex`, `fullSimplexEquivStdSimplex`; ComplexKahlerGeometry's `Density`; ContactGeometry's `RoughForm`, `RoughForm.ofFunction`, `mextDeriv`, `SmoothForm`); delete `toFlow_apply` (no consumer on main). Restate the two narrower survivors (Banach `exists_timeDependentFlow`, slab `timeDependentFlowDomain_eq_univ`) and the headlines that become statable (9.2, 9.3 on `TauCeti.poincarePairing`, the 10.4 integral formula on `TauCeti.degreeAtRegularValue`) on the native carriers; rewrite the not-statable list (half-space Stokes is `TauCeti.integralTopForm_mextDeriv` there).
3. In the README, treat layers 0–5, 5.6 and 12 as layers 6–7 already are: name the `2fd255d9` declaration, keep the id, leave as targets only what is missing; delete the two revision hashes from lines 286–289 and 249–253 and say "at the pin".
4. Run the targeted build and the `#check` probe again on the merged head.

## R02 (P3) — Two other open pull requests change this folder and the description states no order

**Location:** the pull-request description (data), against the worker's overlap report.

**Claim:** #334 (another author's draft of this folder) and #1187 (a Tau Ceti bump) both conflict with this head in `Suggested.lean`; the description names neither, and the repair report of `4d6e96e` hands the sentence to the worker.

**Witness:** `scratch/overlaps.md`, "Other open pull requests that change this roadmap": #334 and #1187, each conflicting in `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`.

**Repair:** one sentence in the description, for example "this head supersedes #334 and is rebased on main after its Tau Ceti bump; #1187 is rebased on this head". The README must not name pull-request numbers.

## R03 (P3) — 9.2's locator names no theorem

**Location:** `README.md:1881–1883`: "Prove `H^n_c(M) ≃ ℝ` by integration for a connected oriented boundaryless `M` of dimension `n` [Lee, Ch. 17, the top-degree compactly supported cohomology of a connected oriented manifold]".

**Claim:** every theorem carries an exact locator; this one gives a chapter and a description.

**Witness:** Lee, Theorem 17.30 (Top Cohomology, Orientable Compact Support Case): for a connected oriented smooth `n`-manifold the integration map `H^n_c(M) → ℝ` is an isomorphism (`67802551 line 21190`). The nonorientable statement two sentences later already cites Theorem 17.34 (`line 21319`).

**Repair:** replace the bracket by `[Lee, Thm. 17.30]`.

## R04 (P3) — 2.2 overstates when the boundaryless hypothesis is needed

**Location:** `README.md:784–785`: "The direction from an oriented atlas to an orientation holds over every model; the converse needs `[BoundarylessManifold I M]`."

**Claim:** the converse holds with boundary in every dimension except `1`; the hypothesis is sufficient (the Lean statement is fine) but is not needed as stated.

**Witness:** Lee, Proposition 15.6: the oriented charts form a consistently oriented atlas when `∂M = ∅` or `dim M > 1` (`67802551 line 17598`). On the closed half-plane `{x₀ ≥ 0}` the reflection `(x₀, x₁) ↦ (x₀, −x₁)` preserves the half-space with Jacobian `−1`, so every chart near the boundary can be made positive; only `Set.Icc 0 1` (the Check at 787–792) obstructs.

**Repair:** "the converse needs `[BoundarylessManifold I M]` only in dimension `1`: for `dim M ≥ 2` it also holds with boundary [Lee, Prop. 15.6], and `Set.Icc 0 1` is the one-dimensional obstruction."

## Verified sound

**Gate, elaboration, depcheck.** Worker's gate and a rerun: every scanner `0`, `OK`. `lake env lean` on `Suggested.lean` at `358314d4`/`f6090c70`: exit 0, 61 sorry warnings, nothing else. Fresh depcheck (`--movable`):

    depcheck: 238 roadmaps, 2353 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. DifferentialGeometry is on main; DeRhamCohomologyAndDuality (order line 394) consumes it, and no `*Needs:*` line, supplier row or "Supplied by" here names it or any later roadmap (checked by grep for every roadmap name in *Needs* lines).

**Mechanical signature check.** A scratch file with `#check @name` for all 121 declarations, importing the built module, elaborated with exit 0 and no error. Compared with the README:

- `orientable_iff_exists_atlas`: `[FiniteDimensional ℝ E] [BoundarylessManifold I M] [IsManifold I 1 M]`, conclusion `Orientable I M ↔ ∃ A, TauCeti.IsOrientedAtlas I 1 A` (README 782–785);
- the six Layer 4 headlines all carry `[IsManifold I 1 M] [FiniteDimensional ℝ E] [IsManifold I ⊤ M] [T2Space M]`, the four Frobenius ones also `[BoundarylessManifold I M]`, and `TauCeti.IsContMDiffDistribution I ⊤ k D` with `TauCeti.IsInvolutiveDistribution I D` where the README says (955–958); `exists_contMDiff_factor` carries `[SecondCountableTopology N.carrier]` and the source's `[FiniteDimensional ℝ E'] [IsManifold J ⊤ P] [BoundarylessManifold J P] [T2Space P] [SecondCountableTopology P]` (README 1032–1036);
- `Distribution.IntegralManifold I n D k : Type (u+1)` with explicit `I`, `n`, `D`, `k`; its `isManifold : IsManifold (𝓡 k) n carrier` and `range_mfderiv` equality (README 972–977);
- the hairy-ball theorems carry exactly `[InnerProductSpace ℝ E] [Fact (finrank ℝ E = n + 1)]` and `Even n`; the divergence theorems `[T2Space M] [SecondCountableTopology M] [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]` and the smooth and continuous metric instances.

No admitted statement lost a hypothesis its truth needs. Every Lean name occurs in the README; the seven leads of the citation tool (`Distribution.exists_*`, `Manifold.Orientation.pullbackSign` and its two laws) are the file's own declarations, all present.

**Padding probe.** A scratch copy with each of the 61 `sorry`s replaced by `first | rfl | (simp; done) | infer_instance | decide | exact le_rfl`: 61 errors on 61 distinct declarations, 0 sorry warnings. Nothing closes by one tactic at the branch pin. (At main's pin 21 of them are Tau Ceti theorems: R01.)

**Pinned declarations opened, at `358314d4`/`f6090c70`.**

- `Geometry/Manifold/Orientation.lean:99` (`OrientationPreservingOn`: differentiable within `range I` with positive determinant of the within-derivative, read through `I`), `:178` (`orientationPreservingGroupoid`), `:332–341` (`IsOrientedAtlas`: `A ⊆ maximalAtlas I n M`, every point in some source, `e.symm ≫ₕ e'` in the groupoid), `:345` (`class Orientable`, the atlas class, as README 249 says).
- `Geometry/Manifold/Distribution.lean:163` (`IsContMDiffDistribution I n k D`: a `C^n` rank-`k` local frame near every point), `:236–240` (`IsInvolutiveDistribution I D`: fields differentiable and tangent to `D` on an open `U` have bracket in `D` on `U`), `:338–345` (`standardContactDistribution`, carrier `v.2.2 = p.1 * v.2.1`, i.e. `ker(dz − x dy)`), `:393, 399` (its rank-2 smoothness and non-involutivity); `Foliation/Basic.lean:63`; `Distribution/Graph.lean:235` (`IsInvolutiveDistribution.exists_eventually_hasFDerivAt`); `Analysis/ODE/Frobenius.lean` exists.
- `Geometry/Manifold/LocallyFlat/Basic.lean:169` (`IsSliceChart φ S A`: `φ '' (φ.source ∩ A) = φ.target ∩ S`); Mathlib `Geometry/Manifold/Immersion.lean:801` (`Manifold.IsImmersion`).
- `AlgebraicTopology/Cohomology/Basic.lean:55–60, 129`: `singularCohomologyFunctor` is built from `singularCochainComplex R k M` over an abelian `k`-linear `C`; with `C = ModuleCat ℝ`, `R = M = ℝ`, `k = ℝ` it is real singular cohomology, as the docstring (`Suggested.lean:59–60`) now says.
- Two-forms: `TwoForm/Basic.lean:61` (`SmoothTwoForm`), `TwoForm/Closed.lean:296` (`IsClosed`), `Symplectic/Manifold/TwoForm.lean:92` (`IsSymplectic`).
- Contour, hulls, metric derivatives: `Analysis/Contour/PiecewiseC1On.lean:86` (`TauCeti.Contour.IsPiecewiseC1On`, the branch-pin name), `Analysis/Contour/Winding/{Number/Homotopy,Proximity}.lean` (`windingNumber_eq_two_pi_I_inv_mul_curveIntegral`, `windingNumber_eq_of_dist_lt_dist`), `Topology/FilledHull.lean:79`, `MeasureTheory/Function/MetricDerivative.lean` (`HasDerivAt.metricDerivative_eq`, `lintegral_metricDerivative_lt_top`), `MeasureTheory/Integral/DivergenceTheorem.lean` (`integral_bilinear_fderiv_sub_prod_Icc`).
- Mathlib: `CurveIntegral/Basic.lean:145, 274, 331` (`curveIntegral_eq_intervalIntegral_deriv`, `curveIntegral_trans`, `ContinuousOn.curveIntegrable_of_contDiffOn`), `BoxIntegral/Partition/Filter.lean:244` (`Henstock`), `BoxIntegral/Integrability.lean:198` (`IntegrableOn.hasBoxIntegral`), `BoxIntegral/DivergenceTheorem.lean:151` (`hasIntegral_GP_pderiv`), `AbsolutelyContinuous.lean:45` (`boundedVariationOn`), `DifferentialForm/Basic.lean:87, 143, 239` (`extDerivWithin`, `extDeriv_constOfIsEmpty`, `extDerivWithin_pullback`), `Instances/Sphere.lean:464, 520`, `Alternating/Curry.lean:86` (`curryLeft_same`), `LeviCivita.lean:359`, `Riemannian/Basic.lean:79`, `Complex/LogDeriv.lean:49`. `ModelWithCorners.convex_range` (7.4's *Needs*) exists at both pins (`Diffeomorph.lean:412` uses `I.convex_range`).
- Riemannian Tau Ceti: `Riesz.lean:74, 82` (`rieszDual`, `inner_rieszDual`), `Induced.lean:92`, `Pullback.lean`, `Sphere.lean` (`sphereRoundMetric`, `inner_tangentSpace_sphere`, `instIsContinuousRiemannianBundleSphere`; the file exists only at this pin), `VolumeDensity/Volume.lean:76`, `Boundary/Charts.lean` (`isManifold_boundary`, `isImmersion_subtypeVal_boundary`), `LocalDiffeomorph.lean`, `IntegralCurve/{Flow,Maximal}.lean`, `ODE/InitialCondition.lean`, `Lie/Exponential/Basic.lean:139`, `Sard/OutermostStratum.lean`, `Instances/ClosedBall.lean`.
- At `2fd255d9` (main's pin), for the README's two new second-revision claims: `Orientation/OrientedAtlas.lean:283` (`IsOrientedAtlas`, same three fields), `Orientation/Atlas.lean:181` (`IsOrientedAtlas.orientable`), `Orientation/Basic.lean:263` (`class Orientable`: `Nonempty (Manifold.Orientation I M (Fin (finrank ℝ E)))`, the chart-sign class of 2.1, as README 251–253 says); `Distribution/IntegralManifold.lean:139–150` (`TauCeti.IntegralManifold n D k` with a `[nonempty : Nonempty carrier]` field, as README 960–963 says).

**Cross-roadmap citations resolved.**

- DeRhamCohomologyAndDuality at its head (`rev/1768`, `1b57dbe0`): `README.md:3–8, 40–61, 160–177` import layers 0–11 from here by the ids this README keeps (6.1, 6.3, 6.4, 8.3 `SmoothSimplex`/`smoothSingularChainComplex`/`smoothToSingular`, 8.4 `fullSimplex`/`simplexFace`/`chainIntegral`/`deRhamHom`, 8.5 `deRhamEquiv`), all of which README 1649–1865 name as "the names under which consumers cite"; its §§2.1–2.2 (inward cone, semiflow), §§2.4, 3.1–3.3 and §4.1 own what *Scope and ownership* (lines 44–51, 60–66) hands it, and it hands nothing back. Remark, no edge: AlgebraicTopology on main (`README.md:84–85, 1205`) still says "DG9.3 owns … the integration comparison", which both this README (1904–1905) and the DeRham head (`:60–61`) place in DeRham §4.1; that is a consumer-side note on main, to be updated by AlgebraicTopology, not a supplier citation here.
- Main: `Completed/HopfRinow` (Levi-Civita, flows), `UniversalCovers`, `GeometricTopology`, `HeegaardFloer` (§2.1 = F0.S sharp Sard, `README.md:19–20, 71`; §4.1 = Lane F2.1 consumes 3.5's time-dependent flows, `:2437, 2476`), `AlgebraicTopology` (Stage 6.5 compares degrees, `:86–88`), `SmoothBundlesConnections` (B5.0 cites 3.5, `:1113`), `GeometricMeasureTheory` G1, G2, G6, `Isoperimetry` I3, I6, `Completed/ConformalMapping` L5 (`:133`), `Completed/ContourIntegration`, `PDE`, `ModularForms`, `ComplexKahlerGeometry` K5/K5a (`:33, 48`), `PseudodifferentialOperators` P1.0 (`:12`).
- The §5.5 → 5.5a/5.5b mapping (README 37–39) covers the one dropped id other roadmaps cite; the new Distribution/IsInvolutive/leafThrough mapping (39–42) covers the Layer 4 names consumers used.
- Consumers on main that import this module use none of the deleted names: ContactGeometry's `Distribution`/`IsInvolutive` occurrences are `TauCeti.standardContactDistribution` and `TauCeti.IsInvolutiveDistribution` (`SymplecticGeometry/ContactGeometry/Suggested.lean:90–93`); ComplexKahlerGeometry's are Mathlib's `Distribution`.
- Duplicate-owner search with `roadmaps grep` over the open heads: "hairy ball", "Mayer–Vietoris induction", `laplaceBeltrami`, `IsOrientedAtlas`, `orientable_iff_exists_atlas`, `exists_leaf`, `green_ac_winding`, `IntegralManifold`: only consumers citing this roadmap (DeRham #1768, GeometricTopology #903, ComplexComparisonPartII #848, AnalyticNumberTheory I/II) and #1187's copy of this folder appeared.

**Seeded source sample.**

- "Smooth 2-forms" (README 358–366): the three pinned declarations above exist as cited.
- "Canonical interfaces and reuse" (936–953): all six objects and files exist at the pin.
- Layer 4 "Acceptance examples" (1058–1068): with `S(x,y,z) = (y,x,z)` the pinned fibre at `S p` is `w₃ = y w₂`; pulled back it is `v₃ = y v₁ = ker(dz − y dx)`; `not_isInvolutiveDistribution_standardContactDistribution` exists.
- "Conventions and existing inputs" (1373–1393) and "Henstock–Kurzweil" (1498–1526): declarations as above; a `Box (Fin 1)` has distortion `1`, so the `GP`/`Henstock` equivalence is the vacuous distortion bound; HOL Light's `GREEN_THEOREM_CURL` (Freek's page, entry 21) has exactly the hypotheses the table at 1359 lists (absolutely continuous closed path, winding number `1` inside, open `u` containing path and interior, `f` differentiable on `u` with continuous derivative; integrability of both sides concluded).
- 5.6 "Acceptance examples" (1578–1596) and "Flat punctured-plane family" (1598–1611): table below.
- "Ownership and ordering" (1613–1640): the linked roadmaps and sections exist (above).
- Lee locators, from the cached text (`67802551`): Prop. 15.6 (line 17594), 15.5 (17550), 15.15 (17651), 15.24 (17751), 15.33 (18003), Thm. 15.41, 15.43 (18185, 18223), Thm. 6.10 (5824), Prop. 9.6, Thm. 9.12, Lemma 9.15, Thm. 9.16, Lemma 9.19, Thm. 9.22, 9.38, 9.44, 9.46, 9.48 (9406–10728), Cor. 12.33, Thm. 12.37, Prop. 13.3 (15147), Lemma 14.13, Prop. 14.29, 14.32, Thm. 14.35, Prop. 16.6, Thm. 16.25, 16.32 (19732), Problem 16-6 (20340: the five equivalent statements, (c)–(d) being the route of 11.1), Problem 16-13 (20401: Lee's `Δu = −div(grad u)`, so the sign remark of *Conventions* is right), Thm. 17.14, 17.17, 17.21, Lemma 17.27, Thm. 17.28, 17.30, 17.34, 17.35 (21190–21360, with the signed count `Σ sgn(x)` at 21373), Cor. 17.42, Thm. 18.4, 18.6, 18.7, 18.12, Prop. 18.13, Thm. 18.14, Problems 18-6 to 18-8 (22853–22893: compactly supported cohomology, the duality map `PD(ω)(η) = ∫ ω ∧ η`, finite-dimensionality on compact `M`), Thm. 19.12, 19.17, 19.21 (23201–23456), Prop. 19.3. Each supports the statement it is cited for, with the two precisions of R03 and R04.

**Adversarial table.** Values by hand or by a scratch script (central differences, step `10⁻⁶`; midpoint rule, `2·10⁵` points).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `orientable_iff_exists_atlas`, `Icc` Check | `Set.Icc 0 1` over `𝓡∂ 1` | chart at `0` maps `0 ↦ 0 ∈ [0,∞)`, one-sided derivative `> 0`; chart at `1` maps `1 ↦ 0`, derivative `< 0`; positive transitions ⇒ sign locally constant on connected `[0,1]`, `+` at `0`, `−` at `1` | no oriented atlas; chart-sign orientation exists | none |
| same, with boundary in dim 2 | half-plane `{x₀ ≥ 0}`, reflection `(x₀,x₁) ↦ (x₀,−x₁)` | preserves the half-space, Jacobian `−1` | converse holds with boundary for `dim ≥ 2` (Lee 15.6) | R04 |
| same, dimension 0 and `M = ∅` | `E = 0`; empty atlas | `det` of the zero endomorphism of `0` is `1 > 0`; cover and transitions vacuous; one chart-sign orientation | both sides true | none |
| second 2.2 Check | `ℝ`, atlas `{id, t ↦ −t}` | transition derivative `−1`; `{id}` alone is oriented | criterion asks for *some* oriented atlas | none |
| `isInvolutive_iff_forall_mextDeriv` | rank `0`; rank `dim`; contact `ker(dz − y dx)` | `⊥`: both sides true; `⊤`: only `η = 0` annihilates, both true; contact: `[∂y, ∂x + y∂z] = ∂z`, `dz(∂z) − y dx(∂z) = 1 ≠ 0`, and `dα(Y,X) = −α([Y,X]) = −1 ≠ 0` for `α = dz − y dx` | both sides false, iff holds | none |
| ⇐ direction, Hausdorff | local pair tangent to `D` with `[X,Y](x) ∉ D(x)` | bump `χ` at `x` times a local annihilator `α` with `α([X,Y])(x) ≠ 0`: `d(χα)(X,Y)(x) = −α_x([X,Y]_x) ≠ 0` | `T2` and finite dimension used for the bump | none |
| `isInvolutive_of_forall_exists_integralManifold` | constant family; contact family | slices `u ↦ (u,c)` exist, bracket of constant-coefficient fields in `span` ✓; contact: no integral surface, hypothesis fails, conclusion false | consistent (Lee 19.3) | none |
| `IntegralManifold` equality Check | `j < k`, `u ↦ (u, 0, c)` | image of differential `= span(e₁..e_j) ⊊ span(e₁..e_k)` | not an integral manifold; with `≤` it would be | none |
| `exists_flatChart` degenerate | `k = 0`; `k = dim E` | `W = ⊥`, any chart; `W = ⊤`, `mfderiv (I ∘ e)` invertible | true | none |
| `exists_isSliceChart_integralManifold` | irrational line on `T²` | the dense leaf meets a chart in infinitely many slices, but `N` is existential: the plaque through `x` is one slice, `φ '' (φ.source ∩ range N) = φ.target ∩ S` | true as quantified | none |
| `exists_leaf` maximality | disjoint union of two plaques of different leaves | meets the leaf, not contained | `ConnectedSpace N'.carrier` needed, present | none |
| `green_ac_winding` | twice-traversed unit circle, `P = −y/2`, `Q = x/2` | circulation `6.283185`; `∫ 2 · 1 dA = 2π = 6.283185` | true; identical to `TauCeti.Green.green_ac_winding` at `2fd255d9` | R01 |
| Ellipse gate | `a = 2`, `b = ½` | `∮ x dy = 3.141593 = πab` | true | none |
| Flat punctured family | `α = 0.7` at `(0.8, −0.3)`; unit circle `α ∈ {0.7, 1, 2}` | curl `0.7478685` vs `2(1−α)ρ^{−α} = 0.7478685`; loop `6.283185` ×3 | closed iff `α = 1`, never exact | none |
| HK gate `h = t² sin t⁻²` | `∫₀¹ h'`; `∫_δ^1 |h'|` for `δ = 10⁻¹, 10⁻², 10⁻³` | `h(1) − h(0) = sin 1 = 0.841471`; `3.03, 5.97, 8.89` (growing like `log`) | HK, not Bochner | none |
| `curl` Check | `(−y, x)`, `(y, x)`, `(0, x)`, swapped `(x, 0)` | `2`, `0`, `1`, `0` | order pinned | none |
| 3.5 Check `x' = s` | through `(s, 1)`, `s = 0.3` | `x(t) = 1 + (t² − s²)/2`: `x(0.3) = 1`, `x'(0.7) = 0.700000` | true; `s − t` reading fails | none |
| 3.3 Check | `v = x²` from `1` | `1/(1−t)`, `t < 1`; `(½, 1), (½, 2)` in the domain, `(1, 1)` not | law only on domain | none |
| 1.3 `mextDeriv_add` | `∛x dy + (x − ∛x) dy` at `0` | `0 + 0` vs `dx ∧ dy` | `C¹` needed, present | none |
| 0.1 Jacobi Check | bracket with `[e₃, e₁] = e₁` | `[e₃,e₃] + [e₁,e₁] + [e₁,e₂] = e₃ ≠ 0` | Jacobi needed | none |
| 0.3 wedge Check | `(x dy) ∧ dx` at `(e₁, e₂)` | `0·0 − x·1 = −x` | true | none |
| 5.4 `planarRadialPrimitive` Checks | `P = 1, Q = 0`; `P = x, Q = y`; `P = −y, Q = x` | `g = x`; `g = (x² + y²)/2`; `g = −xy/2 + xy/2 = 0`, `dg = 0 ≠ ω` | closedness needed | none |
| 5.5a `Density` Check | `2·id` vs doubling `span v`, `m < dim` | `(2^dim − 2^m) · toFun v = 0` | forced zero | none |
| 5.5b facet sign | `Q^n`, facet `i` (0-based), outward `−e_i` | `i` transpositions and one sign: `(−1)^{i+1}`; `n = 1`: `−1` at `0` | matches 5.1's left endpoint | none |
| 8.3 corner 3-simplex | faces `(y−z)², (x−z)², (x−y)²` | `F(t e_i) = t²` ⇒ gradient `0`; Hessian diagonal `2`, off-diagonal `−2`; along `(t,t,t)`: `½ t² · (−6) = −3t²` | no smooth filling, `F ≥ 0` | none |
| 10.3–10.4 Checks | `z ↦ zᵏ`; `z̄`; antipodal `S¹`, `S²`; `(0,∞) ↪ ℝ` | `k`; `−1`; `+1`, `−1`; counts `1` over `y > 0`, `0` over `y < 0` | compactness needed | none |
| 11.1 route | great-circle homotopy at `t = 1` | `cos π · x + sin π · w = −x`; `1 = (−1)^{n+1}` forces `n` odd | true for even `n` | none |
| 11.1–11.2 degenerate | `n = 0`, `E = ℝ`; `n = 1`, `v = ix` | `⟪v x, x⟫ = 0 ⇒ v x = 0` at `±1`; nowhere-zero field, excluded by `Even n` | parity needed | none |
| 12.2 gradient Check | `g = diag(4,1)`, `f = x₁` | `⟪¼∂₁, v⟫_g = v₁ = dx₁(v)` | metric matters | none |
| 12.3 divergence/Hessian Checks | `g = e^{2x₁}δ`, `X = ∂₁`, `f = x₁` | `div = e^{−2x}∂₁(e^{2x}) = 2`; `Γ²₂₁ = 1`, `∇_{∂₂} grad f = e^{−2x}∂₂`, `⟪·, ∂₂⟫_g = 1`; flat values `0`, `0` | covariant | none |
| 12.5 vs Lee 16.32 | nonorientable `M`; compact `M` with any `X` | Lee: oriented, compactly supported `X`; here: densities, and compact `M` makes every `X` compactly supported | generalization stated with its route (2119–2121) | none |
| 9.1 boundary | `[0,1]`, `⟨[1],[dx]⟩` | `[dx] = 0` vs `∫₀¹ dx = 1` | boundaryless needed | none |
| 7.4 negative control | `P` = "`H⁰` finite-dim.", `⊔ₙ` balls | union `∞`-dimensional | disjoint-union hypothesis needed | none |
| Two-origin line | `H¹_dR` vs singular `H¹` | `0` vs `ℝ` | `T2` load-bearing | none |
| `singularCohomologyFunctor` claim | `C = ModuleCat ℝ`, `R = M = ℝ`, `k = ℝ` | `singularCochainComplex ℝ ℝ ℝ` = real cochains | docstring claim true | none |
| Stokes 5.3 headline | `358314d4`; `2fd255d9` | no `integralTopForm`: not statable; `integralTopForm_mextDeriv` proved | docstring right only at the branch pin | R01 |

## Not verifiable

- [Tu] GTM 275 §21, [Bott–Tu] GTM 82 I §§2, 5 and [Milnor] §5: no legal copy is available to this worker (`sources.toml` records none; the sources cache holds none). Each cited statement was checked independently in the table.
- The three AFP theorem names of 5.6 (`GreenThm_typeI_typeII_divisible_region`, `…_finite_holes`, `…_equivallent_boundary`, README 1364–1366): the rendered theory page at `isa-afp.org/browser_info/current/AFP/Green/Green.html` was fetched in four segments; the text ends inside `Greens_thm_type_I` and no `GreenThm_` name appears in the part the fetch returns, so the names could not be confirmed or refuted. The HOL Light entry was confirmed.
- The Zulip and GitHub design references ([t1]–[t13], mathlib4 pull requests) were not fetched; the README uses them for design only.
- Ownership against the open pull requests the brief lists without files (Surfaces #1974 among the vocabulary neighbours) was checked only by `roadmaps grep` for the objects named above.

## Source issues

- none
