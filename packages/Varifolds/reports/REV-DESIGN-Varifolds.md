<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7602#issuecomment-6700570171 -->
Review (claude) of f19ba8b

Verdict: needs_changes

1. **F01** (P3) False Check in 2.1: the wrong normalisation diverges, it does not give 0

   Location: `packages/Varifolds/design/README.md` line 428, "a normalisation by λ^{−k−1} instead of λ^{−k} would give multiplicity 0 for both"; mirrored in `packages/Varifolds/design/plan.json` target 2.1, test "line" ("a lambda^{-k-1} normalisation would give 0").

   Claim: with μ = H¹⌞L (L the x-axis of ℝ², k = 1) the normalisation λ^{−k−1} gives multiplicity 0.

   Witness: λ^{−2}·μ(x + λB_1(0)) = λ^{−2}·2λ = 2/λ → ∞ as λ ↓ 0; the blow-ups diverge and no approximate tangent space exists. The exponent that gives multiplicity 0 is λ^{−k+1}: λ^{0}·2λ·... = λ·H¹(L ∩ B_1) = 2λ → 0.

   Repair (tested on the instance above): replace the clause by "a normalisation by λ^{−k+1} instead of λ^{−k} would give multiplicity 0 for both, and λ^{−k−1} would make the blow-ups diverge", and change the plan.json test statement accordingly.

2. **F02** (P3) The manifold divergence and divergence theorem exist at the Tau Ceti pin; cite them, not DifferentialGeometry 12.3 and 12.5

   Location: `packages/Varifolds/design/README.md` lines 69–70 (Scope), 226 (supplier contract), 640, 658, 665 (4.1), 821, 837 (5.1), 805, 883 (layer dependencies); `packages/Varifolds/design/plan.json` prerequisites "roadmap:DifferentialGeometry 12.3" (line 704) and "roadmap:DifferentialGeometry 12.5" (line 962).

   Claim: the divergence as the trace of the Levi-Civita covariant derivative and the divergence theorem on boundaryless manifolds are supplied by DifferentialGeometry 12.3 and 12.5.

   Witness: at the pinned Tau Ceti, `TauCeti.Manifold.divergence` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` line 55) is exactly the trace of `CovariantDerivative.leviCivitaConnection`, and `TauCeti.Manifold.integral_divergence_eq_zero` (`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean` line 225) states that the divergence of a compactly supported C¹ field on a smooth Hausdorff σ-compact boundaryless Riemannian manifold integrates to 0 against `riemannianVolume`. What exists at the pin is cited by name, not through a roadmap section.

   Repair: add both declarations with their files to "From Tau Ceti"; in 4.1 ("Degenerate dimensions", Check 3, *Needs:*), 5.1 (route, *Needs:*) and the Layer 4 and 5 dependencies replace "DifferentialGeometry 12.3"/"12.5" by the two Tau Ceti names; delete the DifferentialGeometry subsection of the supplier contracts and the Scope line unless something else of DifferentialGeometry is used (nothing is); replace the two plan.json prerequisites by `tauceti:TauCeti.Manifold.divergence` and `tauceti:TauCeti.Manifold.integral_divergence_eq_zero`, and drop DifferentialGeometry from the plan's suppliers.

3. **F03** (P3) Wrong file for the complete-vector-field lemma

   Location: `packages/Varifolds/design/README.md` line 172, "`TauCeti/Geometry/Manifold/IntegralCurve/CompactSupport.lean`: a C¹ field vanishing off a compact set is complete".

   Claim: `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off` lives in that file.

   Witness: at the pin the theorem is declared in `TauCeti/Geometry/Manifold/Flow/Complete.lean` line 144 (hypotheses: `ContMDiff I I.tangent 1` field, compact K, field zero off K, `[CompleteSpace E]`); `IntegralCurve/CompactSupport.lean` only names it in its module docstring (line 15) and declares `mapsTo_maximalIntegralCurve_insert_of_eq_zero_off`.

   Repair: cite `TauCeti/Geometry/Manifold/Flow/Complete.lean`.

4. **F04** (P3) Route overclaim in 3.3: the Vitali doubling hypothesis fails at some points of D

   Location: `packages/Varifolds/design/README.md` line 595, "for `Vitali.vitaliFamily` of the closed geodesic balls on the subspace D with ‖V‖⌞D, where every small radius satisfies the doubling hypothesis with C = 3^k + 1".

   Claim: on the set D where Θ^k(‖V‖, ·) exists in (0, ∞), the measure ‖V‖⌞D satisfies the doubling hypothesis of Mathlib's `Vitali.vitaliFamily` (`Mathlib/MeasureTheory/Covering/Vitali.lean` line 460: at every point x, frequently as r ↓ 0, μ(B̄_{3r}(x)) ≤ C μ(B̄_r(x))) with C = 3^k + 1.

   Witness: W = ℝ², k = 1, ‖V‖ = |t| H¹⌞L + |y|⁻¹ dy (L the x-axis). Then ‖V‖(B_r(0)) = r² + 2πr, so Θ¹(‖V‖, 0) = π and 0 ∈ D; off L the density is 0 and on L ∖ {0} it is |t|, so D = L and ‖V‖⌞D = |t| H¹⌞L. At 0 ∈ D: (‖V‖⌞D)(B̄_r(0)) = r² and (‖V‖⌞D)(B̄_{3r}(0)) = 9r² > 4r² for every r > 0, so the hypothesis fails at a point of D and `Vitali.vitaliFamily` cannot be formed on D as stated. The statement of 3.3 (the limit at ‖V‖-a.e. point of D) is unaffected.

   Repair: form the Vitali family on the ‖V‖-full Borel subset D' ⊆ D of ‖V‖-density points of D (Besicovitch's theorem in charts, as in 6.3's route, gives ‖V‖(B_r(x) ∖ D) = o(‖V‖(B_r(x))) at ‖V‖-a.e. x ∈ D, hence the doubling at every point of D' for small r), and say so in the route.

5. **F05** (P3) 9.4 has no *Needs:* line, and its statements are README-only

   Location: `packages/Varifolds/design/README.md` line 1354 (section 9.4) to line 1381; every other section of the design ends with a *Needs:* line.

   Claim: the two literature statements of 9.4 are statable with the roadmap's definitions.

   Witness: the section cites 1.4, 2.3, 4.2, 6.3, 7.2, 8.2 and 9.1 in prose and `plan.json` lists these as its prerequisites, but the README carries no *Needs:* line, so the gate's dependency reading of this section is empty.

   Repair: after the Checks of 9.4 add "*Needs:* Layer 1.4, Layer 2.3, Layer 4.2, Layer 6.3, Layer 7.2, Layer 8.2, Layer 9.1." At the package stage, state in the module docstring of `Suggested.lean` that the two statements of 9.4 are tests of the carrier and not theorems of this roadmap, and do not write them there with `sorry`.

Five findings, all P3, none blocking; each asks for a repair, so the verdict is needs changes and a fix round applies them before the port. No principle is violated, the dependency gate shows no UPWARD or CYCLE line, every supplier citation resolves on main, every cited library declaration exists at the pins (two file-path or citation slips, below), the sampled source locators support the statements as written, and the adversarial pass found one false Check and one overclaimed proof route, neither affecting a stated theorem.

## Verified sound

**Principles.** General theory on open subsets of Riemannian manifolds, Euclidean space as the flat case; no special-case route. No roadmap is re-planned: GeometricCurrents G6 owns the auxiliary varifold of an integral current and its first variation, monotonicity and tangent cones (`TauCetiRoadmap/GeometricCurrents/README.md` lines 668–690); this design states strictly more general theorems for arbitrary varifolds and identifies G6's object in 9.3, in the supplier direction. The projection presentation of the Grassmann bundle (1.2) is a second carrier for G6's bundle, compared by an explicit homeomorphism and used to transport G6's compactness; the design says why it owns it (metric change and tangential traces are explicit on projections). No copied passage (spot-checked the 15 sampled sections against the source lines), no algorithm, no process residue, no LaTeX delimiters, no pull-request numbers, no `set_option` (no Lean yet).

**Dependency gate.** Output: "candidate: Varifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)" and "depcheck: 240 roadmaps, 2352 edges, 0 problem(s)". No UPWARD or CYCLE line.

**Supplier citations resolved on main.** GeometricMeasureTheory G2 (rectifiable closure API, approximate tangent planes, tangential differentiation, area formula; `TauCetiRoadmap/GeometricMeasureTheory/README.md` lines 148–181). GeometricCurrents G1 (distributional constancy criterion on connected Euclidean open sets, lines 219–238), G2 (chart comparison of rectifiable sets and Hᵏ, mass of a smooth submanifold as Riemannian volume, integer-rectifiable and locally integral currents, lines 240–300), G5 (local minimizers, lines 583–600), G6 (lines 668–690). RiemannianGeometry R4 item 1 (radial Hessian zero and transverse bounds by (s_κ'/s_κ)g, lines 607–625), R5a (B, S, pinned signs, lines 1044–1065), R5a.2 (averaged H, δVol = ∫div_M X^⊤ − m⟨H, X^⊥⟩, sphere H = −position, lines 1105–1135). DifferentialGeometry 12.3 and 12.5 (lines 910–936) exist, but see R02. HopfRinow Layers 0–2 (`Completed/HopfRinow/README.md` lines 229–451: reconciled distance and native `IsRiemannianManifold`, exponential map, normal balls, local logarithm, Gauss lemma, local distance identity). Declared gaps: none, and none is needed.

**Library declarations opened at the pins.** Mathlib: `IsStarProjection` (Algebra/Star/StarProjection.lean 29: idempotent and self-adjoint, nothing more), `Submodule.starProjection` (InnerProductSpace/Projection/Basic.lean 131), `isStarProjection_starProjection` and `isStarProjection_iff_eq_starProjection_range` (InnerProductSpace/Adjoint.lean 507, 513; need `[CompleteSpace E]`), `IsFiniteMeasureOnCompacts` (Measure/Typeclasses/Finite.lean 343), `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (Measure/Regular.lean 1183), `Measure.ext_of_integral_eq_on_compactlySupported` (RieszMarkovKakutani/Real.lean 408), `RealRMK.rieszMeasure` and `integral_rieszMeasure` (Real.lean 66, 341), `MeasureTheory.Measure.condKernel` (Disintegration/StandardBorel.lean 361: finite measure on α × Ω, Ω standard Borel), `HasBesicovitchCovering` (Covering/Besicovitch.lean 155) with the finite-dimensional instance (BesicovitchVectorSpace.lean 500), `Besicovitch.vitaliFamily` (Besicovitch.lean 1020), `Besicovitch.ae_tendsto_rnDeriv` (1077), `Vitali.vitaliFamily` (Vitali.lean 460, frequent doubling with factor 3 at every point), `VitaliFamily.ae_tendsto_average` (Covering/Differentiation.lean 856), `euclideanHausdorffMeasure` (Geometry/Euclidean/Volume/Measure.lean 68, on any emetric space, scaled μH[d]), `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` (191), `LinearMap.normDet` (InnerProductSpace/NormDet.lean 69, zero when not injective) and `euclideanHausdorffMeasure_image_eq_normDet_mul_volume` (433), `IsRiemannianManifold` (Geometry/Manifold/Riemannian/Basic.lean 80, edist = riemannianEDist), `CovariantDerivative.leviCivitaConnection` (CovariantDerivative/LeviCivita.lean 360, under `IsManifold I 2 M`), `Module.Grassmannian` (RingTheory/Grassmannian.lean, algebraic quotient functor, correctly declared not a supplier; no topological Grassmannian of projections exists at the pin). Tau Ceti: `TauCeti.globalFlow` (IntegralCurve/GlobalFlow.lean 60), `contMDiff_globalFlow_uncurry` (147, `1 ≤ n`, `[IsManifold I n M]`), `globalFlowDiffeomorph` (190), `isCompleteVectorField_of_isCompact_of_eq_zero_off` (Flow/Complete.lean 144, see R03), `TauCeti.RealRMK.posPart`, `negPart` (RieszMarkovKakutani/Signed.lean 160, 205) and `integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (262), `isCompact_closure_of_isTightMeasureSet_of_mass_le` (Measure/Prokhorov.lean 52, tight set of `FiniteMeasure` with mass ≤ C), `MeasureTheory.integral_divergence_eq_zero` (DivergenceTheorem/CompactSupport.lean 30, flat), `TauCeti.riemannianVolume` (VolumeDensity/Volume.lean 82). No varifold, rectifiable set or approximate tangent plane exists at either pin (grep), so Layers 2–3 duplicate nothing. Baseline hashes in `plan.json` equal the pins of the content checkout's lake manifest.

**Ownership and overlaps.** `roadmaps grep -i varifold` over main and the 466 open heads: the only hits outside this package are GeometricCurrents (its auxiliary varifold, cited) and one GeometricMeasureTheory scope line (also in the revision carried by pull request #1187, unchanged). No open roadmap owns varifolds; overlaps lists no shared ids and no conflicting pull request. The board's package index (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) contains nothing related.

**Sources at their locators** (all certified texts read; counts: Simon1983 31 locators, Scharrer2022 4, Agnoletto 12, Simon2023 3, EdelenSpolaor 3). Simon1983 line 7295–7305 (§38 Grassmannian with the projection metric; Simon's metric is the Frobenius norm of P_S − P_T, the design's operator norm is declared and gives the same topology), 7308–7317 (varifold, weight, mass, restriction), 1038–1045 (4.4 compactness), 7333–7349 (38.1–38.3), 7352–7368 (38.4), 7443–7454 (39.1 push-forward, proper on the support), 857–882 (4.1–4.2 Riesz representation with a Hilbert space H), 7486–7509 (39.3–39.4 decomposition H, Z, σ, ν), 7510–7547 (40.1–40.4), 3016–3076 (17.2–17.4), 3119–3152 (17.8–17.9), 7550–7565 (40.5), 7566–7583 (40.6–40.7), 7733–7774 (42.1–42.3), 3414–3430 (19.3), 7775–7790 (42.4–42.5), 7793–7805 (42.6, hypothesis exactly ρ^{−n}μ({Θ < 1} ∩ B_ρ) → 0), 7882–7898 (42.7), 7899–7912 (42.8), 7986–8012 and 8128–8151 (42.9–42.10, see Not verifiable), 7664–7682 (41.1–41.2, closure in U if V ≠ 0), 1950–1973 (9.3, 9.5), 2005–2016 (9.6), 2276–2301 and 2352–2374 (11.4–11.9), 3373–3400 (19.1–19.2; Simon states them for rectifiable V, the design's route uses only δV), 7253–7293 (Chapter 8 introduction, varifold of a current). Scharrer2022 line 823–854 (Lemma 2.7: K ≤ b on a geodesically star-shaped U ⊂ B_{π/√b}(p) gives div_T(r∇r) ≥ m√b r cot(√b r)), 1120–1127 (Lemma 3.3), 1184–1203 (Remark 3.4: c(π/2) = 2/π), 87–100 (δV, ‖δV‖). Agnoletto line 89–92 (Definition 1.2, C¹ regular set), 151–160 (Definitions 2.1–2.2), 166–175 (2.3), 179–195 (2.4–2.5), 210–212 (Proposition 2.6), 264–268 (2.8–2.9), 269–303 (2.10), 542 (Lemma 2.22), 1680 (Theorem 2.30), 1796–1810 (Theorem 2.32 and its proof). Simon2023 line 73–83 (reg/sing for hypersurfaces), 84–96 (Theorem 1.1), 432–441 (Theorem 3.7). EdelenSpolaor2023 line 104–112 (Definition 1.1.1), 114–120 (Remark 1.2: every C_{p,q} minimizing for n > 7), 130–135 (Theorem 1.4); the design's n ≥ 8 restriction drops the n = 7 cases C_{3,3}, C_{2,4} that Theorem 1.4 also covers, a harmless narrowing of an acceptance test.

**Adversarial table** (values computed by hand; "ok" means both sides agree).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 1.1 ‖P_{ℓ_θ} − P_{ℓ_0}‖ | θ = π/2; general θ | P_θ − P_0 = sin θ·[[−s, c],[c, s]], R symmetric, R² = I, det R = −1; norm \|sin θ\|; Frobenius √2 at π/2 | ok | — |
| 1.1 G(E,0), G(E,dim E), non-self-adjoint idempotent | ℝ², [[1,t],[0,0]] | idempotent, adjoint [[1,0],[t,0]] ≠ it for t ≠ 0; norm → ∞ with t | ok, excludes wrong model | — |
| 1.1 tr(P∘A) bound | P ∈ G(ℝ³,2), A = diag(a,b,c) | tr = a + b ≤ 2‖A‖ | ok | — |
| 1.2 metric dependence | h = diag(1,4), u = (1,1) | h-projection of e_1: (h(e_1,u)/h(u,u))u = u/5; Euclidean u/2 | ok | — |
| 1.2 conformal metric | h = 4g | P^h_S = P^g_S (same projector) | ok | — |
| 1.3 weight does not determine V | horizontal vs vertical lift of H¹⌞axis, test χ·tr(P∘diag(1,0)) | ∫χ dH¹ vs 0 | ok | — |
| 1.4 mass loss | δ_{(je_1,P)} | masses 1, limit 0 | ok | — |
| 1.4 no limit | alternating lifts; j·δ_{(0,P)} | no convergent subsequence; unbounded mass | ok | — |
| 2.1 normalisation Check | μ = H¹⌞L, k = 1, λ^{−2} | λ^{−2}·2λ = 2/λ → ∞, not 0 | false | R01 |
| 2.1 Lebesgue, Dirac | k = 1 | πλ → 0; λ^{−1} → ∞ | ok | — |
| 2.1 chart comparison | φ = 2·id, μ = H¹⌞L | φ_*μ = ½H¹⌞L; 1/J_L(2·id) = 1/2 | ok | — |
| 2.1 criterion vs Simon 11.8 | statement | M = {x : (*) holds}, countably n-rectifiable, θ Hⁿ-measurable, μ = Hⁿ⌞θ | ok | — |
| 2.2 k = 0 | Γ countable | H⁰ counting, v = Σθ(x)δ_{(x,0)} | ok | — |
| 2.2 fractional multiplicity | v(L, 1/2) | rectifiable, not integral | ok | — |
| 2.3 support | half-line (0,∞)×{0} | closure [0,∞)×{0} | ok | — |
| 3.1 homothety | f = 2y, V = v([0,1]×{0},1) | J = 2, mass 2 | ok | — |
| 3.1 collapse | f = (y_1,0), vertical segment | J = 0, f_#V = 0 | ok | — |
| 3.1 fold | f(t) = t², V = v([−1,1],1) | ∫φ(t²)\|2t\| dt = 2∫_0^1 φ; f_#V = v([0,1],2) | ok | — |
| 3.1 properness | Σ_j v({j}×[0,1],1), f = (0,y_2) | image segment gets infinite mass | ok (necessity) | — |
| 3.1 spt‖f_#V‖ = f(spt‖V‖) for immersions | general | J_S f > 0 for all S when df_x injective; f(spt) closed by properness | ok | — |
| 3.2 scaling | V = v([0,1]×{0},1), k = 1 | V_{0,λ} = v([0,λ⁻¹]×{0},1), mass λ⁻¹ = λ^{−k}M(V) | ok | — |
| 3.2 great circle on S² | x north pole | exp_x⁻¹ isometric on the circle; ‖V_{x,λ}‖(B_ρ(0)) = 2ρ for λρ < π | ok | — |
| 3.3 crossing lines | V = v(L_1,1)+v(L_2,1) | V_{0,λ} = V, not θv(T,1) | ok | — |
| 3.3 vertical lift | H¹⌞axis with vertical plane | V_{x,λ} = vertical lift of H¹⌞axis ≠ θv(T,1); weight has tangent L | ok (stronger notion) | — |
| 3.3 Vitali route | ‖V‖ = \|t\|H¹⌞L + \|y\|⁻¹dy, k = 1 | Θ(0) = π, D = L, (‖V‖⌞D)(B̄_{3r}(0))/(‖V‖⌞D)(B̄_r(0)) = 9 > 4 ∀r | route fails at 0 ∈ D | R04 |
| 4.1 circle dilation | X = ψ(y)y, ψ = 1 near C | div_T X = 1; δ[C](X) = 2π; length 2πe^t, derivative 2π | ok | — |
| 4.1 k = N | V = vol, X compactly supported | δV(X) = ∫div X = 0 | ok | — |
| 4.1 δV not determined by X on spt | vertical lift, X = ψy_2e_2 | X = 0 on axis, div_S X = ψ, δV(X) = ∫ψ(t,0)dt | ok | — |
| 4.1 bound \|δV(X)\| ≤ k‖V‖(K)sup\|∇X\| | general | \|tr(P_S∇X)\| ≤ k‖∇X‖ | ok | — |
| 4.2 vertical lift unbounded δ | X_n = n⁻¹ψ sin(ny_2)e_2 | div_S X_n = ψ on axis, sup\|X_n\| ≤ n⁻¹ | ok | — |
| 4.2 Lebesgue with constant line stationary | k = 1 | ∫⟨D_vX, v⟩ = ∫∂_v⟨X,v⟩ = 0 | ok | — |
| 4.3 Riesz Checks | L(X) = ⟨X(0),v⟩; ∫(X¹+X²) | ‖L‖ = \|v\|δ_0, η = v/\|v\|; ‖L‖ = √2·Leb, η = (e_1+e_2)/√2 | ok | — |
| 4.4 half hyperplane | {x_N = 0, x_1 > 0}, k = N−1 | ∫_0^∞∂_1X¹ = −X¹(0,·); H = 0, σ = H^{N−2}⌞{x_1 = x_N = 0}, η = −e_1 | ok, pins sign | — |
| 4.4 variable multiplicity | θ = 1 + y_1² on the axis | δV(X) = −∫X¹θ'; H = (θ'/θ)e_1 tangential, σ = 0 | ok | — |
| 4.4 dilation laws | general; circle radius R | δV_{x,λ}(Y) = λ^{1−k}δV(Y∘η) (div_S(Y∘η) = λ⁻¹div_S Y∘η, V_{x,λ} = λ^{−k}η_*V); H_{V_{x,λ}}∘η = λH_V; \|H\| = λ/R | ok | — |
| 4.4 iff Λ-bound | general | ‖δV‖ ≤ Λ‖V‖ ⇔ ‖δV‖ ≪ ‖V‖ with density ≤ Λ | ok | — |
| 4.5 conformal Check | h = c²g | J = c^k, div^h = div^g, left side \|c^k − 1\|\|δ_gV(X)\| | ok | — |
| 4.5 Dirac Check | V = δ_{(0,P)}, X = ψAy | X(0) = 0, ∇X(0) = A; left side \|tr((JP^h − P^g)A)\| | ok, sup\|DX\| needed | — |
| 4.5 constant C(N,Λ_0) | Christoffel difference | Γ^h − Γ^g = (h⁻¹−g⁻¹)Dh + g⁻¹D(h−g); \|Dh\| ≤ Λ_0 + ‖h−g‖_{C¹}, ‖h−g‖_{C⁰} ≤ 2Λ_0 absorbs the product | ok | — |
| 4.5 blow-up form | g̃_λ(y) = g̃(λy) | ‖g̃_λ − g_x‖_{C¹(B_R)} ≤ (R+1)sup\|Dg̃\|·λ; λ^{−2}g-balls = g-balls of radius λR; V^{λ^{−2}g} = λ^{−k}V; ‖δ‖ scales by λ^{1−k} | ok | — |
| 5.1 sphere | S^k, X = ψx | both sides kHᵏ(S^k); H_{[S^k]} = −kx; S_ν = −id for ν = x | ok | — |
| 5.1 sign of the route | div_S X = div_S X^⊤ − ⟨X, tr_S B⟩ | from ⟨X^⊥, τ_i⟩ = 0 and B = (∇_XY)^⊥ | ok | — |
| 5.2 great sphere | M = S^N, Σ great k-sphere | B = −⟨u,v⟩x, tr_{TΣ}B = −kx, H_{ι_#[Σ]} = 0 + (−kx) | ok, matches 5.1 | — |
| 5.2 ‖δV‖ ≤ ‖δ(ι_#V)‖ | general | H_{ι#V} = H_V + ∫tr_S B dν^x with orthogonal summands, so \|H_{ι#V}\| ≥ \|H_V\|; σ transported | ok | — |
| 6.1 sign and exponents | line y_2 = a, x = 0, σ < a < ρ | left 2√(ρ²−a²)/ρ; right ∫_{\|t\|<√(ρ²−a²)} a²(t²+a²)^{−3/2}dt = 2√(ρ²−a²)/ρ | ok | — |
| 6.1 first-variation term | unit circle, x = 0 | left 2π/ρ; first term 2π; δV(1_{B_t}y) = 2π for t > 1 (H = −y); −∫_1^ρ 2πt^{−2} = −2π(1−1/ρ); sum 2π/ρ; plus sign gives 2π(2 − 1/ρ) | ok, sign pinned | — |
| 6.1 weighted identity | X_ρ = hφ(r/ρ)(y−x) | div_S X_ρ = kφh + φ(y−x)·P_S∇h + hφ'(r/ρ)ρ⁻¹r(1 − \|P⊥(y−x)\|²/r²); rearranged gives the stated d/dρ(ρ^{−k}I) formula with −δV(X_ρ) | ok | — |
| 6.1 Λ-monotone form | general | d/dρ(e^{Λρ}ρ^{−k}μ(B_ρ)) ≥ e^{Λρ}d/dρ∫\|P⊥\|²r^{−k−2} ≥ d/dρ∫ | ok (40.2) | — |
| 6.2 Grönwall form | f(t) = t^{−k}‖V‖(B̄_t), C = Λ + k√κ | f(σ) ≤ f(ρ) + C∫_σ^ρ f ⇒ f(σ) ≤ (2 − e^{−C(ρ−σ)})f(ρ) ≤ e^{C(ρ−σ)}f(ρ) | ok | — |
| 6.2 Riemannian input | R4 item 1, Scharrer 2.7 | ∇(r∇r) = dr⊗dr + r∇²r ≥ √κr cot(√κr)g since √κr cot(√κr) ≤ 1; (1 − x cot x)/x ≤ 2/π on (0,π/2] attained at π/2 | ok | — |
| 6.2 great circle on S² | κ = 1 | ‖V‖(B̄_ρ) = 2ρ, e^{ρ}·2 nondecreasing | ok | — |
| 6.3 triple junction | three half-lines at 2π/3 | ‖V‖(B_ρ(0)) = 3ρ, Θ = 3/2; tangents sum to 0 so stationary | ok | — |
| 6.3 step multiplicity | θ = 1 on (−∞,0), 2 on (0,∞) | δV(X) = X¹(0) − 2X¹(0) = −X¹(0): σ = δ_0, η = −e_1; Θ(0) = 3/2 < 2 = lim sup | ok (necessity of σ = 0) | — |
| 6.3 a.e. existence on M (route) | chart inflation c² | shell recurrence a_{n+1} ≤ (1 + Cℓ_n)max(a_n, a_{n−1}) with Σℓ_n < ∞ bounds f near 0 | ok | — |
| 6.3 usc under convergence | x_j → x | Θ(‖V_j‖,x_j) ≤ e^{Cρ}ω_k⁻¹ρ^{−k}‖V_j‖(B̄_{ρ+ε}(x)) for large j, then 1.4 on compact sets | ok | — |
| 6.4 constancy | v(L,3); parallel lines with 1 and 2; half-line | θ_0 = 3; disconnected: non-constant; half-line not stationary (σ = δ_0) | ok | — |
| 6.4 route | f vanishing on Σ | div_S(f∇f) = f div_S∇f + \|P_S∇f\|² = \|P_S∇f\|² on Σ | ok | — |
| 6.5 convex hull | X = ψγ(r)(y−ξ), γ' ≥ 0 | div_S X = kγ + γ'r(1 − \|P⊥\|²/r²) ≥ kγ; K = ∅ gives V = 0; circle with K = {0} not stationary | ok | — |
| 7.1 segments | i segments of length 1/(2i) | Θ = 1 a.e., ‖δV_i‖ = 2i → ∞, limit ½v([0,1]×{0},1) | ok | — |
| 7.1 conformal sequence | g_i = (1+1/i)²e | weights (1+1/i)H¹⌞L → H¹⌞L, Θ = 1 | ok | — |
| 7.2 Lebesgue with constant line | k = 1 | Θ = 0, V_{x,λ} = λ·Leb → 0, VarTan = {0} | ok | — |
| 7.2 circle | x on C | ‖δV‖(B_ρ(x)) ≈ 2ρ → 0, VarTan = {v(T_x,1)} | ok | — |
| 7.3 route step "‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k" | C stationary cone, y ∈ spt | monotonicity at y: ρ^{−k}‖C‖(B_ρ(y)) ≤ lim_{R→∞}R^{−k}‖C‖(B_R(y)) = Θ(x)ω_k | ok (needs the monotonicity at y, which 6.1 gives) | — |
| 7.3 density hypothesis for 7.1 | Ṽ_λ/((1−ε)Θ(x)) | bad set mass λ^{−k}‖V‖({Θ < (1−ε)Θ(x)} ∩ B_{λR}(x)) → 0 by approximate continuity; ‖δ‖ ≈ λΛ(x)Θω_kR^k → 0 | ok | — |
| 7.4 zigzag | slopes ±1, amplitude 1/i | length √2; corner atom \|τ_+ − τ_−\| = √2; limit √2H¹⌞[0,1]×{0} with planes ±45°, not rectifiable | ok | — |
| 7.4 shrinking circles | radius 1/i | mass 2π/i, ‖δV_i‖ = i·2π/i = 2π, limit 0 | ok | — |
| 7.5 plane with multiplicity m | W = m v(ℝ^k×{0},1)⌞B_3 | ‖W‖(B_2(x)) = mω_k2^k; bound (1+δ)m + δ ≥ m | ok | — |
| 7.5 metric error form | 4.5 with \|DX\| ≤ C(1 + ρ/T) | error Cε(1 + ρ/T)‖W‖(B_ρ), same form as Cερ/T | ok in form | — |
| 8.1 hypothesis | Simon 42.6 | ρ^{−k}‖V‖({Θ < 1} ∩ B_ρ(x)) → 0, as stated | ok | — |
| 8.1 step multiplicity | k = 1 | ρ^{0}‖δV‖(B_ρ(0)) = 1 ↛ 0 | ok | — |
| 8.2 cone C_{p,q} | multiplicity 1 | self-similar, Θ(0) = mass ratio on B_1 | ok | — |
| 9.1 \|t\|^{3/2} graph | 0 | C¹ (derivative (3/2)\|t\|^{1/2}sgn t), not C²; 0 ∈ reg¹ ∖ reg² | ok | — |
| 9.1 reg of ½v(L,1), V = 0 | — | reg^r = L; both empty | ok | — |
| 9.3 currents | [[P]] + (−[[P]]) | current 0, varifold 0; v(P,1)+v(P,1) = v(P,2) | ok | — |
| 9.4 Simon's theorem | K = ∅ | sing^∞[Σ] = ∅, Σ closed; statement matches Simon2023 Theorem 1.1 (n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1, sup\|f − 1\| < τ, sup\|D^jf\| < Cτ) | ok | — |
| 9.4 Edelen–Spolaor | V_i = V = C_{p,q} | y_i = 0; Theorem 1.4 hypotheses: multiplicity one, regular away from 0, minimizing (p,q)-singularity; conclusion: isolated singularity of the same type or regular | ok | — |
| Conventions ω_k, H¹(S¹), H²(disc) | k = 1, 2 | 2, π; 2π, π | ok | — |
| Conventions J witnesses | f = 2y, f = (y_1,0) | 2; 0 on span(e_2) | ok | — |

**Shape.** Summary, Scope and ownership (with explicit deferrals by section), Conventions (every sign and normalisation with a computed witness), Exact supplier contracts per supplier, How to read the build, Layers 1–9 in build order with prose subsections, each definition with API bullets and ≥ 3 discriminating Checks (34 Checks blocks, 3–5 bullets each), each theorem with hypotheses and a locator, each of the 9 layers ending with Examples and Dependencies, Downstream consumers, References; every cited work is in `packages/Varifolds/sources.toml` with status and version notes (Federer1969, Allard1972, Maggi2012 uncertified, cited by locator only, as settled). Vocabulary is the literature's (Simon's and Allard's names) throughout. `plan.json`: 34 targets with locator, prerequisites, API and tests consistent with the README (the 2.1 test shares R01).

**Headline theorems** (from the Summary): Riesz decomposition of δV (4.4); Euclidean and Riemannian monotonicity (6.1, 6.2) with densities (6.3); Allard's rectifiability theorem (7.3); compactness for rectifiable and integral varifolds (7.4, 7.6); varifold tangents and tangent cones (7.2, 8.1, 8.2); constancy (6.4); the intrinsic/ambient comparison (5.2); the identification of G6's varifold (9.3). Statability at the pins is a package-stage question; for orientation: the carrier (rank-k `IsStarProjection` elements of the endomorphism bundle of `TangentSpace`), Radon measures, `leviCivitaConnection`, `euclideanHausdorffMeasure` and `normDet` exist, so 4.4, 6.1–6.3, 6.4 (with a C² embedded submanifold predicate), 6.5, 7.2 and 7.4's first-variation part are statable; 7.3, 7.6, 8.1, 8.2 and 9.3 need countable rectifiability and approximate tangent planes on a manifold, which are GeometricMeasureTheory G2 and GeometricCurrents G2 targets absent from the pins, and must be named in the module docstring as not statable. The 9.4 statements are not this roadmap's theorems (R05).

**Elaboration.** Not applicable at the design stage: there is no `Suggested.lean`, and this lane does not elaborate.

## Not verifiable

- Simon1983 42.9, line 7993: the hypothesis list "(*)" of Allard's multiplicity lemma is lost in the OCR of the scan; the design's reading (mass ≤ Λ, ‖δW‖ ≤ ε, L¹ tilt ≤ ε on B_3(0)) is consistent with the proof text at lines 8001–8151 and with 42.8's use, but could not be checked word for word. The Riemannian extension of 7.5 (metrics with ‖h − e‖_{C²} ≤ ε) is the design's own; its route was checked for the form of the error terms only, not line by line against Simon's induction.
- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: paywalled, settled as uncertified, cited by locator only.

## Source issues

- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Theorem 2.32 (proof), arXiv v3 page 17–18: the proof asserts that locally bounded first variation and positive density are preserved by pushing a varifold forward through a bi-Lipschitz smooth chart, with no argument; it should compare the first variations for the pulled-back metric and the Euclidean metric (a C¹-closeness estimate, which this design proves as 4.5); affects the proof.
- **Misprint** in Simon1983 at 42.9, printed page 262: the constant is written ε = ε(δ, Λ, n), while the remark that follows (42.10) and the induction bound depend on n, k and Λ; it should be ε(δ, Λ, n, k); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f19ba8bb16867c5f0f482b8b345632607ddc44af", "job": "REV-DESIGN-Varifolds", "model": "fable", "worker": "chris-x9"} -->
