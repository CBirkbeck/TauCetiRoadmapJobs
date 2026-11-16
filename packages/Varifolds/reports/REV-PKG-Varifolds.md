<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18010#issuecomment-6906583238 -->
Review (claude) of 9536a77

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `Euclidean.exists_isVarifoldTangent` carries two hypotheses its conclusion does not need

   **Location.** `packages/Varifolds/Suggested.lean` lines 429–437: "`(hV : HasLocallyBoundedFirstVariation V) … (hδ : Tendsto (fun ρ : ℝ ↦ ENNReal.ofReal (ρ ^ (1 - (k : ℤ))) * firstVariationMass V (Metric.ball x ρ)) (𝓝[>] 0) (𝓝 0))`"; `packages/Varifolds/README.md` §7.2, lines 1603–1604.

   **Claim.** The declaration states only subsequential convergence of the dilations to a Radon
   measure. That needs the finite density alone: `‖V_{x,λ}‖(B_R(0)) = λ^{−k}‖V‖(B_{λR}(x)) → θ ω_k R^k`
   (3.2) bounds the masses on compact sets and 1.4 gives the subsequence. `hV` and `hδ` enter only
   `IsVarifoldTangent.isStationary`.

   **Witness.** The vertical lift V of H¹⌞(x-axis) in ℝ², k = 1, x = 0: `Euclidean.blowUp V 0 s = V`
   for every s > 0, so the conclusion holds, while `hV` fails (README line 1041) and
   ‖δV‖(B_ρ(0)) = ∞.

   **Repair.** Delete the binders `hV` and `hδ` from `Euclidean.exists_isVarifoldTangent` and reword
   its docstring: "**Existence of varifold tangents** (§7.2). If `Θ^k(‖V‖, x)` exists and is finite at
   `x ∈ W`, every sequence `λ_j ↓ 0` has a subsequence along which `V_{x,λ_j}` converges to a Radon
   measure (Simon1983, 42.1–42.3, with the compactness theorem 4.4)." In README §7.2 replace "the
   existence of a convergent subsequence along every λ_j ↓ 0 is `Euclidean.exists_isVarifoldTangent`"
   by "the existence of a convergent subsequence along every λ_j ↓ 0, which uses only the finiteness
   of the density (3.2's mass identity and 1.4), is `Euclidean.exists_isVarifoldTangent`", and add the
   Check: "The vertical lift of H¹⌞(x-axis) has `V_{0,λ} = V` for every λ, so VarTan-type limits exist
   at 0 although V does not have locally bounded first variation; the limit V is not stationary, so
   the first-variation hypotheses are what stationarity needs." Tested: on the witness the remaining
   hypotheses hold (density ratio 2ρ/(ω_1 ρ) = 1) and the conclusion holds with the constant
   sequence; the edited file elaborates.

2. **F02** (P3) the convex hull property of MinimalSurfaces 3.3 is not cited

   **Location.** `packages/Varifolds/README.md` line 55–56 ("monotonicity (Euclidean and Riemannian),
   densities, their measurability and upper semicontinuity, the constancy theorem and the convex hull
   property") and §6.5, lines 1509–1534.

   **Claim.** The Scope section is the place that says what another roadmap states. It cites
   RiemannianGeometry/MinimalSurfaces 3.1 for the smooth monotonicity statement but is silent on
   MinimalSurfaces 3.3, which states the convex hull property for smooth minimal submanifolds; 6.5
   contains that statement for embedded ones.

   **Witness.** `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/README.md` line 760–767, "### 3.3
   Convex hull property": a compact minimal n-submanifold of ℝ^m with boundary lies in the convex hull
   of its boundary.

   **Repair.** Add to "Owned elsewhere and cited": "The convex hull property of a compact smooth
   minimal submanifold with boundary of ℝ^m, proved from the harmonicity of the coordinate functions
   without varifolds: RiemannianGeometry/MinimalSurfaces 3.3. 6.5 is the statement for an arbitrary
   varifold of compact support that is stationary off a compact set K; for an embedded Σ it returns
   3.3 by taking V = [Σ ∖ ∂Σ] and K = ∂Σ (5.1)." Add to 6.5's Checks: "For the catenoid piece
   {ρ = cosh x_3, |x_3| ≤ h}, K is the two boundary circles of radius cosh h at heights ±h, [Σ ∖ ∂Σ] is
   stationary in ℝ³ ∖ K, and 6.5 places it in the solid cylinder {ρ ≤ cosh h, |x_3| ≤ h}, the hull of
   K: the Check of MinimalSurfaces 3.3." Tested on that instance: ρ = cosh x_3 ≤ cosh h on the piece.

3. **F03** (P3) `VarifoldTendsto` (§1.4) sits under the Layer 7 header

   **Location.** `packages/Varifolds/Suggested.lean` lines 407–413: "`/-! ## Layer 7: varifold
   tangents, rectifiability and compactness -/` … **Varifold convergence** (§1.4) … `def
   VarifoldTendsto`".

   **Claim.** The file's section comments are to follow the README order; this declaration belongs to
   Layer 1 by its own docstring and by README §1.4 and the Conventions.

   **Witness.** README line 566–567 defines `VarifoldTendsto` in "### 1.4 Varifold convergence and
   compactness" of Layer 1; the Lean file declares it 300 lines later, after Layers 2–6.

   **Repair.** Move the docstring and `def VarifoldTendsto` unchanged to the end of the Layer 1
   section (after `end Euclidean`, before `/-! ## Layer 2 … -/`). It uses only `C_c`, `Measure`,
   `Tendsto`, all open at the top. Tested: the moved file elaborates, 15 `sorry` warnings.

Three findings, all P3 (none blocking). The mathematics of every statement I computed is sound,
`packages/Varifolds/Suggested.lean` elaborates with `sorry` as its only warning, the dependency
check is clean and every library and cross-roadmap citation resolves. The three repairs are small
and each was tested (the two Lean ones by elaborating a scratch copy: 15 `sorry` warnings, nothing
else).

Dependency check output: `depcheck: 242 roadmaps, 2261 edges, 0 problem(s)` (no UPWARD, CYCLE or
`moved:` line; Varifolds is in the merge order after GaussianIsoperimetryAndClusters, and its
roadmap suppliers GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry and HopfRinow are on
main).

Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Elaboration.** `lake env lean` on `packages/Varifolds/Suggested.lean` from the content checkout:
15 warnings "declaration uses `sorry`" (lines 253, 300, 327, 345, 361, 371, 383, 395, 429, 443,
462, 475, 499, 518, 533), no error, no other warning. No `set_option`, `lemma`, `#eval`, `#print`,
sorry'd data, `True` placeholder or `Prop`-valued stand-in. Imports: `import Mathlib` and three
`TauCeti.*` modules, each used (`IsNormalDomain`; `sectionalCurvature`; the smoothness instance of
the Levi-Civita connection that `sectionalCurvature` requires).

**Signatures (`#check @name`, 41 declarations).** All 15 theorems keep `[I.Boundaryless]`,
`[SecondCountableTopology M]`, `[IsRiemannianManifold I M]`, `[BorelSpace M]` (resp.
`[BorelSpace F]`). The 18 flagged declarations are all `def`/`instance`; none needs the binder it
lost (`IsRectifiable` uses `μHE[k]` of the `EMetricSpace`, and every theorem that mentions it
carries `IsRiemannianManifold`). Probed in scratch: on `TangentSpace I x` the norm is the
Riemannian one (`‖v‖ ^ 2 = inner ℝ v v` by `real_inner_self_eq_norm_sq`), `star A` is
`ContinuousLinearMap.adjoint A` by `rfl`, so `IsStarProjection` in `grassmannBundle` is
g_x-self-adjointness, and the subtype carries a topology.

**One-tactic probe, all 15 sorried theorems** (`first | rfl | infer_instance | (simp; done)` on a
scratch copy): none closes (6 "unsolved goals" after `simp`, 9 "`simp` made no progress"). No
declaration restates a definition, mirrors a Check or treats a boundary case. Every one of the 18
definitions is used by a stated theorem.

**Headline theorems** (README Summary) against the Lean file: Riesz decomposition
(`exists_firstVariation_eq_riesz`); monotonicity, Euclidean (`Euclidean.monotonicity_identity`) and
Riemannian (`monotonicity_inequality`, `monotoneOn_exp_mul_densityRatio`), densities
(`ae_hasDensity`, `hasDensity_and_limsup_le_of_firstVariationMass_le`,
`one_le_upperDensity_of_mem_support`); Allard rectifiability (`isRectifiable_of_ae_density_pos`);
compactness (`rectifiable_compactness`, `integral_compactness`); varifold tangents and cones
(`Euclidean.exists_isVarifoldTangent`, `.isStationary`, `.isRectifiable`, `.isIntegral`); constancy
(`constancy`). Named in the module docstring as not statable, each with the missing carrier: the
Riemannian forms of 7.2, 8.1, 8.2; the varying-metric forms of 7.4, 7.6; 5.2; 9.3. I agree with
each: the pins have no push-forward on Grassmann bundles, the Riemannian metric is an instance (no
sequence of metrics on one type without an ad hoc second bundle and connection), and integral
currents are not at the pins. All 33 Lean names occur in the README; every backticked name the
README gives as its own is declared (the 10 leads of the citation tool are the `Euclidean.*`
declarations, which exist).

**Adversarial table** (values computed by me).

| Statement | Instance | Values | Result |
|---|---|---|---|
| 1.1 operator-norm distance | lines ℓ_θ, ℓ_0 of ℝ² | P_θ − P_0 = sin θ·[[−sin θ, cos θ],[cos θ, sin θ]], symmetric, square 1, det −1; norm \|sin θ\| | holds |
| 1.1 image-plane formula Q A⁻¹ Q* | L = diag(1,0), P = P_{ℓ_0} | Q = diag(1,0), A = 1, result diag(1,0) = P_{ℓ_0} | holds; fails to extend at P_{ℓ_{π/2}} as stated |
| 1.1 G(E,k) for k > dim E, k = 0 | G(ℝ,2); G(E,0) | ∅; {0} | consistent with `Euclidean.grassmannian` (rank condition unsatisfiable; P = 0) |
| 1.2 metric dependence | h = diag(1,4), u = (1,1) | h-projection of e_1: h(e_1,u)/h(u,u) = 1/5; Euclidean 1/2 | holds |
| 1.4 mass bound of a convergent sequence | j·δ_{(0,P)}; δ_{(j e_1,P)} | masses j → ∞, no limit; masses 1, limit 0 | holds |
| 2.1 normalisation λ⁻ᵏ | H¹⌞L, k = 1; Lebesgue on ℝ²; δ_0 | 2λ/λ = 2 = θω_1; πλ → 0; λ⁻¹ → ∞ | holds |
| 2.1 chart comparison θ/J | φ = 2·id, μ = H¹⌞L | φ_*μ = ½H¹⌞L; θ/J = 1/2 | holds |
| 2.2 `IsRectifiable`, `IsIntegral` | k = 0; k > dim M; non-measurable θ; vertical lift | atoms on a countable set; `grassmannBundle` empty, V = 0, U_j = ∅; lower integral equals that of the largest measurable minorant, which is ℕ-valued when θ is (⌈g⌉ ≤ θ); planes vertical ≠ tangent line | definitions determine v(Γ, θ); wrong model excluded |
| 2.3 weight of the \|t\|^{3/2} graph | ∫₋₁¹ √(1 + 9\|t\|/4) dt | (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2 | holds |
| 3.1 push-forward | f = 2·id; f(t) = t² on [−1,1]; f(y) = y_1, k = 2 | mass 2; ∫\|2t\| = 2 = mass of v([0,1],2); J ≡ 0, f_#V = 0 | holds |
| 3.2 `Euclidean.blowUp` | V = v([0,1]×{0},1), λ | map of H¹ under y ↦ y/λ is λH¹; times λ⁻¹: v([0,λ⁻¹]×{0},1), mass λ⁻¹ | scaling law holds |
| 3.3 density-point example | \|y_1\|H¹⌞L + \|y\|⁻¹ dy | ‖V‖(B_r(0)) = r² + 2πr; Θ¹(0) = π; (‖V‖⌞D)(B̄_{3r}) = 9r² | holds |
| 4.1/4.3 first variation | circle, X = ψy; vertical lift, X_n = n⁻¹ψ sin(n y_2)e_2 | δ = 2π = d/dt 2πe^t; δV(X_n) = ∫ψ(t,0)dt with sup\|X_n\| ≤ 1/n | holds; unbounded first variation |
| 4.2 Riesz | L(X) = ∫(X¹ + X²) | ‖L‖ = √2 Leb, η = (e_1 + e_2)/√2 | holds |
| 4.4 `exists_firstVariation_eq_riesz` | half hyperplane; v(L, 1 + y_1²); step multiplicity 1, 2; k = 0; k > dim M | δ = −∫X¹ dHᴺ⁻², η = −e_1; H = (θ'/θ)e_1; δV(X) = −X¹(0), σ = δ_0; δV = 0, H = 0, σ = 0; V = 0 | sign and decomposition hold; degenerate cases true |
| 4.4 dilation law | circle of radius R | δ(V_{x,λ})(Y) = λ^{−k}·λ·δV(Y∘η); \|H\| = λ/R | holds |
| 4.5 two metrics | g = e⁴ᵗdt², h = 4g, V = δ_{(0,1)}, X = (1 − t²)² | Γ = 2; δ_gV = 2; δ_hV^h = 4; sup\|X'\| = 8/(3√3) ≈ 1.54 < 2 | holds |
| 5.1 first variation of a C² graph | u = \|t\|^{5/2}, X = φχe_2 | ∫φ'u'(1+u'²)^{−1/2} = −∫φu''(1+u'²)^{−3/2} = −∫_Σ⟨tr B, X⟩ | holds, sign pinned |
| 5.2 intrinsic vs ambient | great k-sphere in S^N | tr_S B = −kx, H_V = 0, sum −kx = mean curvature of S^k | holds |
| 6.1 `Euclidean.monotonicity_identity` | unit circle, x = 0, σ < 1 < ρ; line {y_2 = a}; k = 0 | LHS 2π/ρ; RHS 2π − ∫₁^ρ t⁻²·2π = 2π/ρ; 2√(ρ²−a²)/ρ both sides; ‖V‖(B_ρ) − ‖V‖(B_σ) = ‖V‖({σ ≤ r < ρ}) | holds with the minus sign, with open balls and the half-open annulus |
| 6.1 exponential form | from the identity | (e^{Λt}f)' ≥ e^{Λt}J' ≥ J' | holds |
| 6.2 `monotonicity_inequality` | S², great circle; S², k = 2, area | 2 ≤ 2 + 2(ρ − σ); f(ρ) = 2π(1 − cos ρ)/ρ², f(0+) = π > f(π/2) = 8/π, right side gains ≥ (16/π)(π/2 − σ) | holds; curvature term needed; factor k√κ ≥ (2/π)k√κ of the route |
| 6.2 `monotoneOn_exp_mul_densityRatio` | backward Grönwall | g(σ) = f(ρ) + c∫_σ^ρ f, (e^{cσ}g)' = c e^{cσ}(g − f) ≥ 0 | holds |
| 6.3 a.e. existence on M | route | S_1 ≤ f(ρ) + ½max(S_1, S_2) ⇒ S_1 ≤ 2f(ρ) + S_2 | holds |
| 6.3 upper semicontinuity, lower bound | crossing lines; step multiplicity; e^{−1/\|t\|} | Θ(0) = 2 ≥ 1; Θ(0) = 3/2 < 2 with σ_V = δ_0; ‖δV‖/‖V‖ ≥ ρ⁻², doubling ratio ≥ (2r)⁻¹e^{1/(3r)} | holds; hypothesis needed |
| 6.4 `constancy` | V = 0 with Σ the sin(1/t) graph; g = e²ᵗdt²; k = 0; k > dim M | 0 • (H¹⌞Σ) = 0, θ₀ = 0; div_gX = e⁻ᵗ(eᵗX)', θ̃ = 1; point mass cδ_p; no immersion, vacuous | holds |
| 6.5 convex hull | test field γ(r)(y − ξ) | tr(P_S DX) = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ | holds for every varifold |
| 7.2 `IsVarifoldTangent.isStationary` | ball masses; μ = (1 + ½ sin(log r) cos ϑ) dr dϑ; k = 0 | ‖C‖(B_ρ) ≤ lim inf and ‖C‖(B̄_ρ') ≥ lim sup give θω_kρ^k; (π/4)(sin log λ − cos log λ) = −π/4, π/4 at λ = 1, e^π; C = θδ_0 | holds |
| 7.2 `exists_isVarifoldTangent` | vertical lift at 0 | blow-ups constant, `hV` and `hδ` false | R01 |
| 7.4 `rectifiable_compactness` | alternating lines; zigzags | two limits; ‖δV_i‖ = √2(i − 1) + 2 → ∞, limit not rectifiable | holds; statement is subsequential |
| 7.6 `integral_compactness` | v(L,1) + v(L_i,1); ½v(L,1) | limit v(L,2); not integral input | holds |
| 8.1/8.2 tangent cones | ½v(L,1); integral V | hypothesis fails, conclusion holds; {Θ* < 1} is ‖V‖-null so 8.1 applies | holds |
| 9.4 literature statements | Simon2023 line 84–96; EdelenSpolaor2023 line 104–135 | hypotheses n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1; n ≥ 8 makes every C_{p,q} minimizing (line 120) | faithful |

**Sources: seeded sample (15 targets), each read at its locator.** 1.1 and 1.2: Simon1983 line
7295–7305 (§38), AgnolettoCorreaHoyosDaSilvaNardulli2025 line 151–156. 1.4: Simon1983 line
1038–1045 (4.4), 7336–7338, 7739–7740. 2.1: line 2276–2301 (11.4–11.6), 2352–2374 (11.8–11.9). 3.1:
line 7443–7454 (39.1), 2903–2933 (15.6–15.7). 3.3: line 7333–7368 (38.1–38.4), 7419–7440. 4.2: line
857–882 (4.1–4.2). 5.1: line 1950–1973 (9.3, 9.5), 2979–2988 (16.6). 6.1: line 3016–3076
(17.2–17.5), 7513–7547 (40.1–40.4), 3205–3221 (18.1). 6.2: Scharrer2022 line 823–854 (Lemma 2.7),
1120–1127 (Lemma 3.3), 1184–1203 (Remark 3.4); Agnoletto et al. line 542 (Lemma 2.22). 6.5: Simon1983
line 3371–3400 (19.1–19.2). 7.2: line 7733–7774 (42.1–42.3, including the source's remark that only
the weight is shown dilation invariant, which the README respects), 3414–3430, 3461–3481. 7.4: line
7886–7898 (42.7). 7.6: line 7899–7912 (42.8), 7916–7985. 9.2: line 7443–7454. Also read: 39.2–39.4
(line 7455–7509), 40.5–40.7, 41.1–41.2, 42.4–42.6, 17.8–17.9, Agnoletto et al. Definition 1.2,
Theorems 2.30 and 2.32. Every theorem number, hypothesis and conclusion agrees with the README. No
locator was flagged by the author as unverified.

**Library declarations opened at the pins** (file and line): all 86 backticked library names of the
README resolve. Among them `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`
(`Mathlib/MeasureTheory/Measure/Regular.lean:1183`), `Measure.setLIntegral_rnDeriv_le`
(`…/Decomposition/RadonNikodym.lean:319`, no σ-finiteness, as the README says),
`Besicovitch.ae_tendsto_rnDeriv` (`…/Covering/Besicovitch.lean:1077`),
`ContMDiff.mpullback_vectorField` (`…/VectorField/Pullback.lean:608`, `m + 1 ≤ n`),
`LipschitzWith.hausdorffMeasure_image_le` (`…/Measure/Hausdorff.lean:745`),
`Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean:479`),
`TauCeti.Manifold.IsNormalDomain` (structure printed: open, contains 0, star-convex, inside the
domain of exp, injective, local diffeomorphism), `IsNormalDomain.image_riemannianExp_ball`
(`…/Geodesic/Gauss/Distance.lean:251`), `TauCeti.Manifold.integral_divergence_eq_zero`
(`…/Riemannian/DivergenceTheorem.lean:225`), `CovariantDerivative.sectionalCurvature`
(`…/Curvature/Sectional.lean:77`), `TauCeti.CountablyRectifiable` with `mono`, `congr`, `iUnion`,
`image` (`…/Rectifiable/Basic.lean:44–135`), `TauCeti.RealRMK.posPart`/`negPart`
(`…/RieszMarkovKakutani/Signed.lean:160, 205`), the `CompactSpace` and `T2Space` instances of
`TauCeti.finiteGrassmannian` (`Orthonormal.lean:225`, `Plucker.lean:89`).

**Duplication by object.** The pinned Mathlib and Tau Ceti contain no varifold, no first variation
of a measure on a Grassmann bundle, no `upperDensity`/`densityRatio`/`HasDensity` for a
k-dimensional density and no named ω_k (`EuclideanSpace.volume_ball` gives its value; the README
does not restate it). The five same-name leads (`weight`, `IsIntegral` ×2, `IsStationary` ×2) are
unrelated objects in other namespaces. No `Suggested.lean` on main or at an open head declares
anything in `TauCetiRoadmap.Varifolds`. Open pull requests: searched all 454 heads for `varifold`,
`Allard`, `Grassmann bundle`, `monotonicity formula` and the declaration names: no roadmap plans
any of this roadmap's objects.

**Cross-roadmap citations resolved on main.** GeometricCurrents G1 (constancy criterion, README line
219–229), G2 (line 240–262), G5 (line 638), G6 (line 668–690); GeometricMeasureTheory G2 (line
148–182); RiemannianGeometry R4 item 1 (Hessian of the distance function, line 2311–2321), R5a,
R5a.2, R5b (headings at 3205, 3362); RiemannianGeometry/MinimalSurfaces Scope and 3.1 (line 86,
708); HopfRinow (Completed) Layers 0–4 (headings at 229–495). No declared supplier gap; none needed.
`scratch/overlaps.md`: no dropped id, no revision-only id, no second copy, no conflicting head.

Overlap check: read GaussianIsoperimetryAndClusters, ManifoldOptimization, LorentzianGeometry (open),
GeometricCurrents, RiemannianGeometry with MinimalSurfaces, GeometricMeasureTheory (main); the
results-and-headings list is empty. Shared objects: the unoriented Grassmann bundle and the varifold
of an integral current, owner GeometricCurrents G6 (this roadmap keeps the projection presentation
and proves the comparison, 1.2 and 9.3); monotonicity for smooth proper minimal immersions, owner
MinimalSurfaces 3.1 (cited); the convex hull property of smooth minimal submanifolds, owner
MinimalSurfaces 3.3 (not cited: R02); B and H of smooth immersions, owner RiemannianGeometry R5a
(cited); the finite Grassmannian, owner Tau Ceti.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, nine layers each ending in Examples and Dependencies, Downstream consumers, References. Every
subsection has at least three Checks and a `*Needs:*` line; no LaTeX delimiters, pull-request
numbers, dates, paths or process words. The manifest records all eight cited works. Two remarks
that need no change: the Summary's "in the generality of Allard's theory as presented in Chapter 8
of Simon's lectures" describes the generality, and the layers do not follow that chapter (below);
the `line N` locators are the form the target brief uses.

**Copyright.** Wording: 14 passages set beside their sources (3.3/38.3, 2.1/11.8, 4.2/4.1, 4.3/39.3,
7.4/42.7, 8.1/42.6, 6.4/41.1, 6.5/19.2, 6.2/Scharrer 3.3, 9.1/Definition 1.2, the two statements of
9.4, and the docstrings of `constancy` and `rectifiable_compactness`); the longest shared run is
about nine words inside a theorem's forced list of conclusions (38.3). Arrangement: Simon1983's
chapters are 1 (§§1–4), 2 (§§5–10), 3 (§§11–14), 4 (§§15–19), 5 (§§20–24), 6 (§§25–32), 7 (§§33–37),
8 (§§38–42). Layer 1 draws on §38 and §4; Layer 2 on §§11, 15; Layer 3 on 39.1, 15.6, 38.1–38.4;
Layer 4 on §39, §4, §9 and its own 4.5; Layer 5 on §§9, 16; Layer 6 on §§17, 19, 40, 41 and
Scharrer; Layer 7 on 40.6 and §42; Layer 8 on 42.6; Layer 9 is its own. No run of layers maps one
to one onto a run of sections; the order 1 → 4 → 6 → 7 is forced by the `*Needs:*` lines of 4.1,
6.1 and 7.1–7.3. Reuse: no table, figure or exercise list taken over.

Source independence: 14 passages compared with 5 sources, none shared; largest share Simon1983, 85
of 135 source citations; contents compared with Simon1983: independent.

## Not verifiable

- Allard1972, Federer1969, Maggi2012: recorded `uncertified` (paywalled); their locators were not
  checked against a text. Every statement they are cited for also carries a Simon1983 locator that
  was read, or is this roadmap's own.
- Simon1983's displayed formulas are largely missing from the extraction (40.1, the sign of the
  first-variation term in 40.4, the hypotheses of 42.9, displays (6)–(8) in the proof of 42.8).
  Statements were compared through the surrounding prose and by recomputation; the README's remark
  that the proof of 42.8 at line 7977–7985 uses only a measure bound could not be confirmed.
- Unsampled locators (among them Simon1983 line 774–788 and 632–640, Agnoletto et al. line
  1448–1546) were not opened.

## Source issues

- **Gap** in Simon1983 at the proof of Lemma 42.9, printed p. 252: the source says the exceptional set is the projection of all support points where a ratio bound fails, controlled by their mass; it should be restricted to such points of positive density, since zero-density support points carry no mass yet can project onto everything; affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at the proof of Theorem 2.32, p. 17: the source says locally bounded first variation is preserved by pushing forward along a smooth bi-Lipschitz chart, with no argument; it should be an estimate comparing the first variations for the two metrics; affects the proof.

## For the human reviewers

- **Licence.** AgnolettoCorreaHoyosDaSilvaNardulli2025 is an arXiv preprint (v3) with no journal reference in `packages/Varifolds/sources.toml`; it is cited 19 times, always beside Simon1983, Scharrer2022 or a route of the roadmap's own.
- **Licence.** Simon1983 is read from the ANU Mathematical Sciences Institute's copy, recorded `institutional` in `packages/Varifolds/sources.toml`; I did not find a stated licence on the text itself.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9536a778ae4f01f8820122c99fe663a6548ca367", "job": "REV-PKG-Varifolds", "model": "fable", "worker": "chris-x80"} -->
