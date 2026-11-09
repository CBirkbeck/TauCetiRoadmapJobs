# Review of RiemannianGeometry (pull request #1683 at 1949a0c)

**Verdict:** needs changes

Incremental re-review of the 131 lines changed in `TauCetiRoadmap/RiemannianGeometry/` since `bc24c8c`. The head is a merge of main into the branch: `lake-manifest.json` and `lean-toolchain` are now byte-identical to main's (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), and `git merge-tree` against `origin/main` reports no conflict. The folder changes are: the three imports renamed to the `.Basic` modules; `TauCeti.Orientable I ∞ M` → `TauCeti.Orientable I M` in the two Synge statements; and the two paraboloid headlines moved from the coordinate plane to an abstract surface `S` with a graph chart `e`, with the matching README paragraph (`README.md:2163–2192`). `PROGRESS.md` and `STATUS.md` changed only through the merge and are identical to main.

Two findings remain, both P2. R01 of the previous report is only partly repaired: its steps 1, 2 and 4 are done, but step 3 is not, so `Suggested.lean` still declares its own copies of Tau Ceti's Jacobi predicate and model sine. R02 is new and was introduced by the pin bump: the new Tau Ceti pin has de Rham cohomology and the curvature operator on bivectors, so the R7.6 Ricci case and the R7.7 curvature-operator cases of the Bochner vanishing theorems can now be stated, but the module docstring still says they cannot. The gate passes, the dependency check reports 0 problems, and the file elaborates with `sorry` as the only warning.

## R01 (P2) — Partly repaired: `Suggested.lean` still restates Tau Ceti's `IsJacobiFieldOn` and `curvatureSine`

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:77` (`def IsJacobiFieldOn`), `:104` (`def modelSine`), `:19–21` (docstring naming both); `README.md:201–202` ("`IsJacobiFieldOn` in `Suggested.lean` writes out the same three clauses"), `:207–208`, `:679–680`, `:1199–1200`.

**Claim.** After the merge, both objects exist at the pin as library declarations: `TauCeti.Manifold.IsJacobiFieldOn` (`TauCeti/Geometry/Manifold/Riemannian/Jacobi/Basic.lean:59`) and `TauCeti.curvatureSine` (`TauCeti/Analysis/SpecialFunctions/Trigonometric/Curvature.lean:40`). The local definitions are the same objects under roadmap names. `exists_jacobi_initial_data`, `rauch_norm_ge_of_sectional_le` and (through `modelBallVolume`) `bishopGromov` are stated against these copies, so a proof built on the library's Jacobi API (uniqueness, Wronskian, `Model.lean`) needs bridge lemmas before it can discharge them. That gives one object two owners; the rule is to cite what exists at the pin and not restate it.

**Witness.** In a scratch copy at the pins, `IsJacobiFieldOn (I := I) γ X s ↔ TauCeti.Manifold.IsJacobiFieldOn I γ X s` closes by `TauCeti.Manifold.isJacobiFieldOn_iff.symm`. `modelSine = TauCeti.curvatureSine` closes by `curvatureSine_of_pos` / `simp` / `curvatureSine_of_neg` on the sign of κ.

**Repair.** This is step 3 of the previous report.
1. Import `TauCeti.Geometry.Manifold.Riemannian.Jacobi.Basic` and `TauCeti.Analysis.SpecialFunctions.Trigonometric.Curvature`.
2. Delete `IsJacobiFieldOn` and `modelSine`.
3. State `exists_jacobi_initial_data` and `rauch_norm_ge_of_sectional_le` on `TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc a b)` (respectively `(Icc 0 b)`) and `TauCeti.curvatureSine κ t`, and define `modelBallVolume` with `TauCeti.curvatureSine`.
4. Remove the docstring clause at `:19–21` and the README sentences at `:201–202`, `:207–208`, `:679–680` and `:1199–1200` (the parenthetical "`modelSine` in `Suggested.lean` has the same definition").

Tested: the scratch copy edited this way elaborates at the pins with exactly 16 `declaration uses sorry` warnings and no error.

## R02 (P2) — The new pin makes the R7.6 Ricci case and the R7.7 curvature-operator cases statable; the docstring says they are not

**Location.** `Suggested.lean:47–49`: "the Bochner vanishing theorems (R7.6, R7.7), which need the Weitzenböck curvature term on `p`-forms, absent at the pin, and whose Ricci case `b₁ = 0` needs the de Rham cohomology of a manifold, absent at the pin". Headlines: `README.md:2566–2570` (R7.6, "positive Ricci kills b_1"), `:2575` (R7.7, "positive Rop on closed connected n≥3 gives b_2=0"), `:2582–2583` ("any positive Rop kills all interior Betti numbers").

**Claim.** The merge moved Tau Ceti from `358314d4` to `2fd255d9`. Two carriers are present at the new pin and absent at the old one:
- `TauCeti.deRhamCohomology I M k` (`TauCeti/Geometry/Manifold/DeRham/Basic.lean:127`), the homology of the smooth real de Rham complex;
- `CovariantDerivative.curvatureEndomorphism` (`…/CovariantDerivative/Curvature/ExteriorSquare.lean:60`), the curvature operator on `⋀²T_xM`, normalised so that constant curvature κ gives κ Id, as in the README.

The three statements above need only these carriers and the pinned `ricciTensor`. Only the general positive-`ℛ_p` statement needs the Weitzenböck term on `p`-forms, which is still absent. So the docstring's reason is false at the pin, and three headlines that can now be stated are missing.

**Witness.** With the `Intrinsic` binders and `[CompactSpace M]`, these elaborate with only `sorry` warnings:
- `(∀ x v, v ≠ 0 → 0 < Ric(v,v)) → Subsingleton (deRhamCohomology I M 1)`;
- `(∀ x β, β ≠ 0 → 0 < ⟪Rop_x β, β⟫) → 0 < p → p < n → Subsingleton (deRhamCohomology I M p)`.

**Repair.**
1. Add a `/-! ## Layer 7: Bochner vanishing -/` section stating these two theorems (the second contains the `n ≥ 3`, `p = 2` case). Use no `ConnectedSpace`, because the README says the statements are componentwise. Use `(CovariantDerivative.leviCivitaConnection I M).curvatureEndomorphism (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x` for Rop.
2. Name both declarations in R7.6 and R7.7.
3. Add `TauCeti.deRhamCohomology` and `CovariantDerivative.curvatureEndomorphism` with their files to the "From Tau Ceti" contract.
4. Rewrite `:47–49` so that it lists only the general positive-`ℛ_p` vanishing (and the `λ>(p−1)Λ` criterion only if you judge it not statable) as blocked by the missing Weitzenböck term on `p`-forms.

The adversarial rows below check both statements on S², S³, RP², RP³, T², S¹, S²×S¹ and S²×S², including the guards `n ≥ 3` and strict positivity.

## Previous findings

- R01 — partly repaired. `lake-manifest.json` now equals main's (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). `Suggested.lean:10–12` imports `…Sphere.Basic`, `…UpperHalfSpace.Basic`, `…Orientation.Basic`, and `git merge-tree` is clean. But `def IsJacobiFieldOn` (`:77`) and `def modelSine` (`:104`) remain, and `README.md:201`, `:207–208` still describe them as copies. Raised again as R01.
- r15 R01 (settled: the description gave no order with #1327, #1187, #1974) — repaired. The description now says this pull request merges first, then #1327, then #1974. #1187's Tau Ceti `ab00ba392` is an ancestor of the merged pin `2fd255d9`, so #1187 is superseded for this folder.

## Verified sound

### The changed paraboloid statements (`Suggested.lean:326–379`, `README.md:2163–2192`)

- **Why the metric moved to `S`.** Mathlib at the pin already declares a flat `RiemannianBundle` on the tangent spaces of every inner-product space (`Mathlib/Geometry/Manifold/Riemannian/Basic.lean:125`). The earlier variable instance on `EuclideanSpace ℝ (Fin 2)` therefore competed with that instance. Putting the metric on a separate type `S` removes the clash, as the new README sentence says.
- **Hypothesis `hmetric`.** It is exactly `TauCeti.inducedRiemannianMetric_inner` (`TauCeti/Geometry/Manifold/Riemannian/Induced.lean:91`) for `f = paraboloidGraph ∘ e`. The intended model (S a copy of ℝ², `e` the identity, `inducedRiemannianMetric` of the graph, which has injective differential `(u,v)↦(u,v,2xu+2yv)`) satisfies all the binders, so the hypotheses are not vacuous. `mvfderiv` is Mathlib's `mfderiv` into a normed space (`Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:608`).
- **Unit speed in the right metric.** In a scratch probe with the same binders, `‖v‖ = √(g.inner x v v)` on `TangentSpace (𝓡 2) x` for `x : S` closes by `norm_eq_sqrt_real_inner; rfl`. Lean resolves the norm through `instNormedAddCommGroupOfRiemannianBundle…`, so `hspeed` is unit speed in the paraboloid metric, not in a model norm.
- **Geodesic predicate.** `TauCeti.Manifold.IsGeodesicCurveOn` (`Geodesic/Basic.lean:102`) includes `ContMDiffOn … 2`, so `γ = e ∘ (e.symm ∘ γ)` is differentiable and `deriv γ` in `hmomentum` and in the crossing determinant is the true chart velocity, not a junk value.
- **Exponential map.** `riemannianExp` (`Geodesic/Exponential.lean:104`) takes the junk value `p` off `expDomain`. The paraboloid is complete (it is a closed proper graph), so `expDomain = univ` and the vertex-pole statement is about the geometric exponential map. The basepoint `e.symm 0` maps to `F(0) = (0,0,0)`.
- **Ownership.** `S`, `e`, `Diffeomorph` and `mvfderiv` are native carriers. `roadmaps grep` finds `paraboloidGraph`, `paraboloid_geodesic_crossings` and `paraboloid_vertex_pole` in this folder only.

### The changed Synge statements (`Suggested.lean:131–154`)

- `TauCeti.Orientable I M` (`TauCeti/Geometry/Manifold/Orientation/Basic.lean:263`) is a class whose one field is `Nonempty (Manifold.Orientation I M (Fin (finrank ℝ E)))`, as the new docstring says. `orientable_iff_nonempty_vectorBundleOrientation` (`:275`) identifies it with orientability of the tangent bundle on a `C¹` manifold. Hence RP² is excluded, as the docstring claims. The only global instance is for the model `H` itself, so `infer_instance` cannot prove `synge_orientable_of_odd`.

### Gate, direction, elaboration, binders, padding

- **Gate.** The worker's gate prints every counter zero, `build=0`, `OK`. My run of `gate … --base origin/main` prints every counter zero and `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty, so nothing changed outside the folder.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 12 s. It gives exactly 16 `declaration uses sorry` warnings (lines 90, 114, 138, 149, 184, 201, 211, 222, 232, 263, 273, 285, 313, 346, 368, 396) and nothing else.
- **Binders.** A scratch copy with `#check @` for all 20 declarations elaborates. The changed statements keep `[I.Boundaryless] [T2Space M] [ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I M]` (`synge`) and `[IsManifold (𝓡 2) ∞ S]`, both bundle-regularity instances and `e` (the paraboloid theorems), matching the README.
- **Signature tool.** Its "lost binder" lead (`[I.Boundaryless]` on `def IsJacobiFieldOn`) is harmless: the predicate does not use it, and R01 deletes the definition. Its "instance `is`" at line 312 is the docstring word "instance", not a declaration.
- **Padding.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (constructor; done) | (exact ⟨_, fun _ => rfl⟩)`. The result has 27 errors across all 16 theorems and 0 sorries, so nothing closes in one tactic.
- **Form.** One module docstring, `public import Mathlib` plus nine `TauCeti.*` modules that exist at the pin, no `set_option`, no `lemma`, no sorry'd data, and a docstring on every declaration.

### Seeded sample

1.1, 1.2, 1.3, 2.1 and 2.2 lie outside the changed README lines, and their source locators are unchanged since the reviews that read them. The pin bump could have broken their Tau Ceti citations, so I re-resolved those at `2fd255d9`:
- **1.1–1.3:** `eq_of_forall_hasSectionalCurvatureAt` (`Curvature/Schur.lean`), `eq_of_ricciTensor_eq_smul_inner` (`Curvature/Einstein.lean`), `hasParallelCurvature_iff_isLocallyConstant_scalarCurvature_of_finrank_eq_two` (`Curvature/LocallySymmetric.lean`), `scalarCurvature_rescale` (`Curvature/Conformal.lean`), and `apply_mulInvariantVectorField` and `curvatureTensor_one` (`Riemannian/LieGroup/BiInvariant.lean`).
- **2.1:** `wronskian_eq` (`Jacobi/Basic.lean`), `eq_of_eq_of_alongCurveWithin_eq` (`Jacobi/Uniqueness.lean`), `eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos` (`Jacobi/Convexity.lean`), `jacobiFieldSpace` and `finrank_jacobiFieldSpace_le` (`Jacobi/Space.lean`), `conjugateMultiplicity` (`Jacobi/Conjugate.lean`), `exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (`Jacobi/Model.lean:62`) and `IsKillingField` (`Riemannian/Killing.lean`).

All resolve in the files the README names. 2.1's sentence at `:679–680` is part of R01.

### Citations and library declarations opened

- **README names.** Of the README's 137 backticked identifiers, every library and Suggested name resolves at the pins. Five more are AlgebraicTopology/DGFloer target names defined on main (`finiteSourceMappingCWType`, `basedLoopCWType`, `bundleDiskSphereRelCW`, `bundleDiskAttachmentCWModel`, `reducedSuspensionSphereHomeomorph`). `C_glue` and `b_exit` are notation.
- **R7.0 and R8.1 contract file locators.** All resolve: `Laplacian.lean`, `Bochner.lean`, `Lichnerowicz.lean`, `Harmonic/Orthogonal.lean` and `Analysis/MvPolynomial/Sphere.lean`.
- **Tau Ceti at `2fd255d9`.** I opened `Jacobi/Basic.lean:59, 73`, `Curvature.lean:40, 50, 59, 66`, `Orientation/Basic.lean:263, 275`, `Geodesic/Basic.lean:102`, `Geodesic/Exponential.lean:104`, `Induced.lean:62, 91`, `DeRham/Basic.lean:45, 127, 204` and `Curvature/ExteriorSquare.lean:60`. With `git cat-file`, `DeRham/Basic.lean`, `ExteriorSquare.lean`, `Jacobi/Basic.lean` and `Jacobi/Conjugate.lean` are absent at `358314d4`, while `PiecewisePath.lean` and `Induced.lean` are present there.
- **Mathlib at `1b1ccf4b`.** I opened `Geometry/Manifold/Riemannian/Basic.lean:125` and `MFDeriv/NormedSpace.lean:608`.
- **Other "absent at the pin" claims at the new pin.** No injectivity radius, cut locus, mean curvature or pullback connection exists. `TauCeti.secondFundamentalForm` (`Analysis/InnerProductSpace/SecondFundamentalForm.lean`) covers maps between normed spaces only, so the R4.1 Günther, R5a/R5b and R8.4 reasons still hold. The R3/R6 reason (no carrier for the index form on piecewise `C¹` sections) rests on `PiecewisePath.lean`, which was already present at the old pin, so the previous reviews' assessment stands.

### Overlaps and ownership

- #1327 and #1974 conflict with this head in the folder; the description now orders them.
- #1187 is superseded (see Previous findings).
- The GeometricTopology fragment cited at `:1048` is defined on main, which is what the citation reads. #903 and #1797 revise a roadmap on main, so they are not dependencies.
- No id that this pull request drops is cited elsewhere.
- I did not re-read the heads of #1327, #1974 and #1187: the brief gives no checkout for them, so their facts come from the overlaps tool.

### Adversarial table

Rows for the changed statements (and for R02) were computed this round. Rows for untouched statements carry the values of r21, r20 and r19.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `paraboloid_geodesic_crossings` (changed carrier) | e = id; Clairaut constant a = 1 and a = ½, launched at the turning point `γ(0)=(a,0)`, `γ′(0)=(0,1)`; RK4 integration of `x″=−4x|x′|²/(1+4|x|²)`, h = 10⁻⁴ | a = 1: `A₁(R₀)=π` gives R₀ = 2.275594 and `T₁(R₀)` = 6.467619. The ODE's first `y=0` return is at t = 6.46762, with `γ(t)=γ(−t)=(−2.27559, 0)`; chart determinant 0.169425 = `2a r′/R`; speed² 1.00000000. R₁ = 10.2898, t₁ = 109.142; R₂ = 49.3589, t₂ = 2441.53 (strictly increasing, unbounded). Bounds: `T ≥ R²−a²`: 6.4676 ≥ 4.1783; `A ≥ 2a log(R/a)`: 3.1416 ≥ 1.6445. a = ½: R₀ = 3.763459, t₀ = 15.343929, ODE crossing t = 15.34393, determinant 0.034684 | true; matches the README's integrals |
| `paraboloid_geodesic_crossings`, degenerate cases | meridian through the vertex; circle r ≡ 1; flat plane | meridian: `x y′ − y x′ = 0`, so `hmomentum` excludes it. r ≡ 1 with θ′ = 1: radial equation `−rθ′² = −1 ≠ 0`, not a geodesic. Flat metric (graph height dropped): lines never self-cross, excluded by `hmetric` (metric square of `(1,0)` at `(1,0)` is 5, not 1) | guards correct |
| `paraboloid_vertex_pole` (changed carrier) | radial Jacobi field `r(ℓ)`, `ℓ=∫₀ʳ√(1+4s²)ds`, against the round K = 4 sphere | ℓ = 0.5: 0.446334 vs `sin(2ℓ)/2` = 0.420735; ℓ = 1: 0.763927 vs 0.454649; ℓ = π/2: 1.040423 vs 0; ℓ = 3: 1.554045 vs −0.139708. Basepoint `F(e(e.symm 0)) = (0,0,0)`, where the metric is Euclidean | no conjugate point; the sphere's appears at π/2 |
| Norm in `hspeed` (changed carrier) | `x : S`, `v : T_xS` | `‖v‖ = √(g_x(v,v))` proved in Lean; resolved through the RiemannianBundle norm instance | unit speed is in the paraboloid metric |
| `synge` with `TauCeti.Orientable I M` (changed) | point; S²; RP²; flat T²; RP³ | dim 0: `Orientation ℝ E (Fin 0)` nonempty, so Orientable, conclusion holds; S²: orientable, π₁ = 1; RP²: tangent bundle not orientable (`:275`), excluded; T²: K = 0 fails strict positivity; RP³: odd dimension, `heven` fails | true on all |
| `synge_orientable_of_odd` (changed) | S¹; RP³; S³ | S¹: no independent pairs, so `hK` holds vacuously, and S¹ is orientable; RP³: K = 1, orientable, π₁ = ℤ/2; S³: orientable | true on all |
| R02: Ricci case, `H¹_dR = 0` | S²; RP²; flat T²; S¹; S²×S¹; dimension 0 | S² (Ric = g): `H¹ = 0`; RP² (Ric = g): `H¹(RP²;ℝ) = 0`; T²: Ric = 0 excluded (`H¹ = ℝ²`); S¹: Ric ≡ 0 excluded (`H¹ = ℝ`); S²×S¹: `Ric(∂θ,∂θ) = 0` excluded (`H¹ = ℝ`); dim 0: `H¹ = 0` by `subsingleton_deRhamCohomology_of_finrank_lt` | true; strict positivity needed |
| R02: Rop > 0, interior degrees | S³; RP³; S²; S²×S²; Sⁿ | S³, RP³: Rop = Id, `H² = 0`; S²: n = 2, Rop = 1 > 0 but `p = 2 = n` is not interior (`H² = ℝ`), so the `p < n` guard is sharp; S²×S²: `Rop(e₁∧e₃) = 0` excluded (`H² = ℝ²`); Sⁿ: `H^p = 0` for 0 < p < n | true; guards sharp |
| R01 equivalences | `IsJacobiFieldOn` vs library; `modelSine` vs `curvatureSine` at κ = 1, 0, −1, t = 1 | `isJacobiFieldOn_iff.symm` closes the iff; values `sin 1` = 0.841471, 1, `sinh 1` = 1.175201 on both sides (three-case proof) | identical objects |
| `two_distinct_geodesics`, Morse/Serre split | r21 row | S¹ lifts `(π/2+2πk)t`; S²: `H_k(ΩS²) = ℤ`; RP³ second branch | unchanged (r21) |
| `rauch_norm_ge_of_sectional_le` | r20 row | `sin t ≤ sin t`; radius 5/2 sphere at t = π/2: 1 ≤ 1.4695 | unchanged (r20) |
| Killing–Hopf triple | r20 row | r = 1: unit S², `ℍ²(1)`; n = 1: `(0,∞)`, `dt²/t²` ≅ ℝ; n = 0: point | unchanged (r20) |
| `three_simple_closed_geodesics` | r20 row | round S²: three great circles, period 2π | unchanged (r20) |
| 1.1–1.3, Jacobi Checks, 2.2 jets | r19 rows | `κ(⟨Z,Y⟩X − ⟨Z,X⟩Y) = e₁`; S³: a = 2; `−¼[[X,Y],Z]`; residual `2E`; `t² − t⁴/3` | unchanged (r19) |
| R3 Checks, `modelBallVolume`, `bishopGromov`, Cartan–Hadamard, Bonnet–Myers, Myers, R4.6/R4.9/R5a/R6/R7/R8 Checks, `riemannianDist_eq_sSup_smooth` | r19 rows | `π²/2`; `r²/2`, `1 − cos r`; ratios 2.888, 2.224, 1.273 on S²; λ = n − 1, bound π; `sSup = 1 = dist`; `Δr⁴ = 20r²` | unchanged (r19) |

### Remarks on untouched text (no change requested)

- The README's "From Tau Ceti" contract does not name the carriers `TauCeti.Orientable`, `TauCeti.Manifold.curveVelocityWithin` or Mathlib's `mvfderiv`, all of which `Suggested.lean` uses. This pattern was accepted in earlier rounds.
- The pull-request description mentions `ParaboloidTargets.lean`, an R1.4 radial-frame amendment and Mathlib `6b7abb3c`. None of these is in this folder or at this head's pins. This is for the human who merges.
- "mod2 class" (`:1590`) and "mod2 Thom class" (`:1592`) remain run-together tokens (r21 remark).

## Not verifiable

- **Settled uncertified keys.** Milnor, *Morse Theory* (2.1's §14, p. 77, and Lemma 14.4, pp. 80–81), O'Neill 1966, Lee's *Introduction to Riemannian Manifolds* and Fulton–Harris are cited by locator only. No changed passage depends on their text.
- **Open heads not given.** #1327, #1974, #1187, #903 and #1797 were not re-read; their overlap facts come from the tool and from earlier reviews.
- **R5a.3 cites no external source.** The paraboloid section is checked by the computations above, not against a text.

## Source issues

- none
