<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6902043438 -->
Review (claude) of 42be01f

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 7.3's route takes a ball bound "from the weight's form" that needs monotonicity as well

   **Location.** `packages/Varifolds/design/README.md:1498`: "with ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k from the
   weight's form, the identity 6.1 for C at y gives P_{S^⊥}(z − y) = 0".

   **Claim.** The bound on balls about an arbitrary y ∈ spt‖C‖ follows from 7.2's form of the weight
   (‖C‖(B_ρ(0)) = Θ(x)ω_kρ^k) alone.

   **Witness.** The weight's form gives only ‖C‖(B_ρ(y)) ≤ ‖C‖(B_{ρ+|y|}(0)) = Θ(x)ω_k(ρ + |y|)^k. For
   C two lines crossing at 0 (Θ = 2) and y = (1, 0) this is 4(ρ + 1), not 4ρ. The bound is true; Simon1983
   line 7811–7820 obtains it with 40.2.

   **Exact repair.** Replace "with ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k from the weight's form," by "since
   ρ^{−k}‖C‖(B_ρ(y)) is non-decreasing in ρ (6.1, C stationary) and at most Θ(x)ω_k(1 + |y|/ρ)^k, which
   tends to Θ(x)ω_k as ρ → ∞ (the weight's form), ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k for every ρ > 0; with this,".
   Tested on the witness: ρ⁻¹‖C‖(B_ρ(y)) is 2 for ρ ≤ 1/√2 and at most 4 throughout, so
   ‖C‖(B_ρ(y)) ≤ 4ρ. 7.3's *Needs:* line already lists Layer 6.1; `plan.json` does not carry the sentence.

One finding (P3) on a route sentence of 7.3, with its exact repair, so the verdict asks for changes; no
P1 or P2. The finding of REV-DESIGN-Varifolds~12 is repaired. No gap is declared and none is needed.
No maintainer notes were supplied. I edited no file of the design and no manifest entry, and fetched
no source: all eight cited works are in `packages/Varifolds/sources.toml`. There is no
`Suggested.lean` at the design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~12), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 of round 12, priority P3: 9.1's parenthesis changed subject | README 1781–1783: "(6.4 applied in U to the restriction V' of V: V' is stationary in U, because a field with compact support in U extends by 0 to W (4.1); spt‖V'‖ = spt‖V‖ ∩ U (1.3); and V' ≠ 0 because x ∈ spt‖V‖)"; README 479–481 (1.3): "the weight of the restriction V' of V to G_k(W') is ‖V‖ restricted to W', so spt‖V'‖ = spt‖V‖ ∩ W', the support being taken in W'"; new Check 490–492; *Needs:* of 9.1 gains Layer 4.1 | **Repaired.** Each cited statement exists where cited: 4.1's locality bullet (README 846) and the new 1.3 clause. Tested on V = v(L_1, 1) + v(L_2, 2), x = (1, 0), U = B_{1/2}(x): V' = v((½, 3/2) × {0}, 1), stationary in U, support the segment, θ_0 = 1. `plan.json` 1.3 and 9.1 agree (diff of the two heads read). |

The repaired pattern elsewhere (a parenthesised argument whose predicates attach to the wrong subject,
and a cross-reference to a clause that the cited section does not state): I resolved every internal
"(n.m)" reference in the sampled sections against the section it names; R01 is the only place where
the stated source of a step does not give it. No finding of the repair report was marked not
actionable.

### Adversarial table (values computed this round)

Sampled targets, headlines, and the passages the repair changed.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.2 (sample) | h = diag(1, 4), u = (1, 1); h = 4g; k = 0, N | h(e_1, u)/h(u, u) = 1/5 against 1/2 Euclidean; same projections for h = c²g; fibre {0}, {1} so bundle ≅ W | sound |
| 1.3 (changed) | lift of H¹⌞([0, 1] × {0}), W' = B_{1/2}(0); W' = ∅; δ_{(x,P)} with x ∉ W' | support [0, ½) × {0}, closed in W', (½, 0) ∉ W'; ∅ = ∅; restriction 0, ∅ = {x} ∩ W' | sound |
| 1.4 (sample) | δ_{(j e_1, P)}; j δ_{(0,P)}; alternating lifts; f ≥ 1 on G_k(K) | masses 1 → limit mass 0; ∫f = j f(0, P) unbounded; χ tr(P diag(1, 0)) gives ∫χ, 0 alternately; ‖V_j‖(K) ≤ ∫f dV_j convergent | sound |
| 2.1 (sample) | H¹⌞L with λ^{−k}, λ^{−k±1}; Lebesgue, δ_0 (k = 1); φ(y) = 2y | 2λ·λ⁻¹ = 2; 2λ → 0 and 2/λ → ∞; πλ → 0; λ⁻¹ → ∞; φ_*μ = ½H¹⌞L = θ/J with J = 2 | sound |
| 2.3 (sample) | graph of \|t\|^{3/2}; half-line | u'² = (9/4)\|t\|; 2·(8/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2; support [0, ∞) × {0} ≠ Σ | sound |
| 3.1 (sample) | f(t) = t²; f(y) = (y_1, 0) on a vertical segment; Σ_j v({j} × [0, 1]) under (0, y_2); f : ℝ² → ℝ, k = 2 | ∫φ(t²)\|2t\|dt = 2∫_0^1 φ, so v([0, 1], 2); J = 0, f_#V = 0; mass ∞ on a compact set; G_2(ℝ) = ∅, f_#V = 0 | sound |
| 3.1 image-plane formula (1.1) | L = P = diag(1, 0) | Q = diag(1, 0), A = diag(1, 0) + diag(0, 1) = 1, Q A⁻¹ Q* = diag(1, 0) | sound |
| 3.3 (sample) | ‖V‖ = \|y_1\|H¹⌞L + \|y\|⁻¹ Lebesgue; weight e^{−1/\|y_1\|} | ‖V‖(B_r(0)) = r² + 2πr, Θ¹(0) = π, Θ¹((a, 0)) = \|a\|, D = L; (‖V‖⌞D)(B̄_{3r}) = 9r²; ∫_{2r}^{3r} e^{−1/t} ≥ r e^{−1/(2r)} against ∫_0^r ≤ r e^{−1/r}, ratio ≥ e^{1/(2r)} | sound; D' needed |
| 3.3 nesting step | chart ball between B̄_r and B̄_{c²r} | ‖V‖(B̄_r ∖ D) ≤ o(‖V‖(B̄^ch_{cr})) ≤ o((c^{2k} + 1)‖V‖(B̄_r)); ratio at D' tends to 3^k < 3^k + 1 | sound |
| 4.4 (headline, sample) | half hyperplane; θ = 1 + y_1²; f a rotation by π/2; dilation | ∫_Σ ∂_1X¹ = −∫X¹ dH^{N−2}, η = −e_1; δV(X) = −∫X¹θ', H = (θ'/θ)e_1; −e_2 = R(−e_1); div_S(Y ∘ η) = λ⁻¹(div_S Y) ∘ η gives δV_{x,λ}(Y) = λ^{1−k}δV(Y ∘ η), H' ∘ η = λH, circle of radius R/λ has \|H\| = λ/R | sound |
| 4.5 (used by 7.2) | g = e^{4t}dt², h = 4g, X = (1 − t²)²; blow-up bound | Γ = 2, δ_gV = 2, δ_hV^h = 4, sup\|X'\| = 8/(3√3) ≈ 1.54 < 2; norm change \|Y\|_{g̃_λ} ≤ (1 + ε)\|Y\|_{g_x} is absorbed: min(A(1 + ε), B) ≤ A + εB with B = k sup\|∇Y\|‖Ṽ_λ‖ | sound |
| 5.2 (headline, sample) | X normal: div_S X^⊥ = −⟨X, tr_S B_M⟩; great S^k ⊆ S^N; affine M; k = 0 | tangential X gives δ(ι_#V)(X) = δV(X^⊤), so ‖δV‖ ≤ ‖δ(ι_#V)‖; tr_{TΣ}B = −kx; B = 0; 0 = 0 | sound |
| 6.1 (headline, sample) | circle, σ < 1 < ρ; line y_2 = a; exponential form; weighted identity | 2π/ρ = 2π − 2π(1 − 1/ρ); 2a²T/(a²ρ) = 2T/ρ with T = √(ρ² − a²); f' ≥ J' − Λf gives (e^{Λρ}f)' ≥ J'; δV(X_ρ) = kI − ρI' + ρJ' + ∫φ(y − x)·P_S∇h, the README's signs | sound |
| 6.2 (headline) | derivation with c(r) = √κ r cot(√κ r); x = π/2 | (t^{−k}I)' ≥ −t^{−k}(‖δV‖(B̄_t) + k√κ I); (1 − x cot x)/x = 2/π at π/2 | sound |
| 6.3 (sample) | triple junction; step multiplicity; θ = e^{−1/\|t\|}; route on M | 3ρ/2ρ = 3/2; δV(X) = X(0) − 2X(0), σ = δ_0, η = −e_1, Θ(0) = 3/2 < 2; ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}, doubling ratio ≥ (2r)⁻¹e^{1/(3r)}; S ≤ f(ρ) + ½max(S, S') gives S ≤ 2f(ρ) + S' | sound |
| 6.4 (headline, sample) | f∇f; g = e^{2t}dt²; atom on a line; open half-line as Σ; sin(1/t) graph | div_S(f∇f) = \|P_S∇f\|² on {f = 0}; θ̃ = 1 while (θ̃w)' = e^t; ratio 2r/(2r + 1) → 0 and δV'(ψy_1e_1) = 1; only V = 0 (support of a nonzero V would be the closed half-line ⊄ Σ); length ∫_1^∞\|cos u\|du = ∞ | sound |
| 6.5 (sample) | X = ψγ(r)(y − ξ); circle with K the disc and K = {0}; k = 0 | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; conclusion holds, respectively hypothesis fails (H = −y); excluded by the standing 1 ≤ k (δV = 0 for k = 0 would falsify it) | sound |
| 7.2 (headline, sample) | ball masses; X = h(y)y; density 1 + ½ sin(log r)cos ϑ | ‖C‖(B_ρ) ≤ Θω_kρ^k ≤ ‖C‖(B̄_ρ) for all ρ gives equality; (λ^{−k}∫h(y/λ))' = −λ^{−k−1}∫(kh + z·∇h)(y/λ) = 0; μ(B_ρ) = 2πρ, λ⁻¹∫_{B_λ}cos ϑ dμ = (π/4)(sin log λ − cos log λ): −π/4 at 1, π/4 at e^π | sound |
| 7.3 (headline, sample) | Lebesgue with constant line; vertical lift; crossing lines at y = (1, 0) | Θ¹ = 0, stationary, not rectifiable; Θ > 0 but δV unbounded; weight's form gives 4(ρ + 1), monotonicity gives 4ρ | sound; route wording R01 |
| 7.3 hypothesis of 7.2 | ratio bound (iv) | ρ^{1−k}‖δV‖(B_ρ) ≤ Λρ·ρ^{−k}‖V‖(B_ρ) → 0 | sound |
| 7.4, 7.6 (headlines) | alternating lines; zigzag i = 2; ½v(L, 1) | no limit of the full sequence; (1, 1)/√2 + (−1, 1)/√2 = (0, √2), total √2 + 2; limit not integral | sound |
| 8.1 (headline, sample) | ½v(L, 1); step multiplicity; cone at y ≠ 0 | hypothesis fails, cone still rectifiable; ρ⁰‖δV‖({0}) = 1 ↛ 0; invariance of ‖C‖ gives Θ(λy) = Θ(y) and y ∈ T_yΓ_C | sound |
| 8.2 (headline) | x ∉ spt‖V‖; C_{p,q} | C = 0, integral; k = p + q + 1 ≥ 3 | sound |
| 9.1 (changed) | crossing lines with multiplicities 1, 2 | B_2(x) is no submanifold; B_{1/2}(x) gives θ_0 = 1 | sound |
| 9.3 (headline) | [[P]] − [[P]]; 2[[P]] and reversed | θ_T = 0, Γ_T⁺ = ∅, varifold 0; v(P, 2) both | sound |
| 9.4 | Simon2023 Theorem 1.1; EdelenSpolaor2023 Theorem 1.4 | n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1, f = f(x, y), sing = {0} × {0} × K; p + q = n − 1, n > 7 makes every C_{p,q} minimizing | statements match |

For the sections outside the sample that this table does not recompute (1.1, 2.2, 3.2, 4.1–4.3, 5.1,
7.1, 7.5), I read the text in full and rely on the computed rows of REV-DESIGN-Varifolds~12; the
values I re-derived there while reading (5.1's by-parts identity for \|t\|^{5/2}, 4.3's X_n, 7.5's disc
ratio 4/(πρ)) agree with them.

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.2 | Simon1983 line 7295–7305; Agnoletto et al. line 151–156 | Grassmannian with the projection metric, G_n(A) with the product metric, compactness over compacts; the Grassmann bundle of M. Match. |
| 1.4 | Simon1983 line 1038–1045, 7336–7338, 7738–7740 | Theorem 4.4; convergence as Radon measures. Match. |
| 2.1 | Simon1983 line 2276–2301, 2352–2374 | 11.4–11.6, 11.8 (M the set where the limit holds, μ = Hⁿ⌞θ), 11.9. Match. |
| 2.3 | Simon1983 line 2861–2867, 1855–1859; EdelenSpolaor2023 line 109–112, 130–131 | weight of v(M, θ); area of a C¹ graph; "multiplicity one". Match; the weight identity is the README's own. |
| 3.1 | Simon1983 line 7443–7454, 2903–2926; Agnoletto et al. line 188–195 | 39.1 with J_S f and the set {J ≠ 0}; 15.6–15.7 with the fibre sum; Definition 2.5. Match. |
| 3.3 | Simon1983 line 7333–7368, 7419–7440 | 38.1–38.4 and the proof of 38.3. Match. |
| 4.4 | Simon1983 line 7486–7509; Agnoletto et al. line 269–303 | 39.3–39.4 and Proposition 2.10. Match; Simon writes the co-normal term with the opposite sign (inward co-normal), and the README's Conventions fix the outward one with a witness. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7675–7682 | 9.6, 16.4, 41.2(3). They support the stationary case; the general formula is marked as the README's. |
| 6.1 | Simon1983 line 3016–3076, 7513–7547 | 17.2–17.5, 40.1–40.4. Match (40.4's sign: Not verifiable). |
| 6.3 | Simon1983 line 7550–7565, 3119–3152; Agnoletto et al. line 1448–1456, 1542–1547, 1680–1684 | 40.5, 17.8, 17.9(1); Corollary 2.27, Remark 2.28, Theorem 2.30. Match. |
| 6.4 | Simon1983 line 7664–7732 | 41.1, 41.2(1), proof steps (1), (5) and the coordinate argument. Match. |
| 6.5 | Simon1983 line 3371–3400 | 19.1–19.2, rectifiable case, same test field. Match. |
| 7.2 | Simon1983 line 7733–7774, 3414–3430, 3461–3481 | 42.1–42.3, the remark that full invariance is open without a density hypothesis, 19.3. Match. |
| 7.3 | Simon1983 line 7775–7881; Agnoletto et al. line 1796–1810 | 42.4, 42.5 (i)–(iv), the proof through uniqueness of T; Theorem 2.32 and its chart assertion. Match. |
| 8.1 | Simon1983 line 7793–7805 | 42.6 with the hypothesis on {Θ < 1}. Match. |

Also read: Simon1983 line 7566–7582 (40.6), 7886–7912 (42.7, 42.8), 7986–8011 (42.9, 42.10);
Scharrer2022 line 1118–1127, 1184–1203; Simon2023 line 73–97; EdelenSpolaor2023 line 100–135.

### Pins, duplication, suppliers, direction

- Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `plan.json`'s
  baseline. All 73 backticked library names of the README were resolved at the pins, among them:
  `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Mathlib/MeasureTheory/Measure/Regular.lean:1183`),
  `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` (`…/RieszMarkovKakutani/Real.lean:408`),
  `Besicovitch.vitaliFamily`, `Besicovitch.ae_tendsto_rnDeriv`,
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` (`…/Covering/Besicovitch.lean:1020`,
  `:1077`, `:1088`; closed balls, locally finite measures), `Vitali.vitaliFamily`
  (`…/Covering/Vitali.lean:460`; hypothesis `∀ x, ∃ᶠ r in 𝓝[>] 0, μ (closedBall x (3 * r)) ≤ C * μ (closedBall x r)`
  at every point of the space, which is why 3.3 works on the subspace D'),
  `Vitali.exists_disjoint_subfamily_covering_enlargement` (`:62`), `VitaliFamily.ae_tendsto_average`
  (`…/Covering/Differentiation.lean:856`), `MeasureTheory.Measure.setLIntegral_rnDeriv_le`
  (`…/Decomposition/RadonNikodym.lean:319`), `LinearMap.normDet_comp` (`…/InnerProductSpace/NormDet.lean:324`),
  `LipschitzWith.hausdorffMeasure_image_le` (`…/Measure/Hausdorff.lean:745`),
  `MeasureTheory.Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:68`),
  `Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean:479`),
  `ContMDiff.mpullback_vectorField` (`…/VectorField/Pullback.lean:608`),
  `CovariantDerivative.leviCivitaConnection` (`…/CovariantDerivative/LeviCivita.lean:360`),
  `isStarProjection_iff_eq_starProjection_range` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:513`);
  Tau Ceti `TauCeti.CountablyRectifiable` with `mono`, `congr`, `iUnion`, `image`
  (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44`, `:74`, `:78`, `:122`, `:135`),
  `TauCeti.RealRMK.posPart`, `negPart`, `integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart`
  (`…/RieszMarkovKakutani/Signed.lean:160`, `:205`, `:262`), `Distribution.HasLocallyFiniteMass`
  (`TauCeti/Analysis/Distribution/Mass/Basic.lean:353`), `Distribution.massMeasure`,
  `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure` (`…/Mass/Measure.lean:191`, `:213`,
  `:306`), `TauCeti.riemannianVolume`, `TauCeti.eq_riemannianVolume_iff`
  (`…/VolumeDensity/Volume.lean:82`, `:93`), `TauCeti.Manifold.divergence` (`…/Riemannian/Laplacian.lean:55`),
  `TauCeti.Manifold.integral_divergence_eq_zero` (`…/Riemannian/DivergenceTheorem.lean:225`),
  `MeasureTheory.integral_divergence_eq_zero` (`…/DivergenceTheorem/CompactSupport.lean:30`),
  `TauCeti.globalFlow`, `TauCeti.contMDiff_globalFlow_uncurry` (`…/IntegralCurve/GlobalFlow.lean:60`, `:147`),
  `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off` (`…/Flow/Complete.lean:144`),
  `TauCeti.IsLocalRiemannianIsometry` (`…/Isometry/Local.lean:70`),
  `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback` (`…/Isometry/LeviCivita.lean:130`),
  `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`…/Isometry/Exponential.lean:117`),
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace` (`…/Riemannian/Restriction.lean:68`),
  `TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le` (`TauCeti/MeasureTheory/Measure/Prokhorov.lean:52`),
  `TauCeti.finiteGrassmannian.toEuclidean`, `toEuclidean_injective`,
  `continuous_starProjection_toEuclidean` (`TauCeti/Topology/Grassmannian/Tautological.lean:73`, `:80`,
  `:110`) and the `CompactSpace` and `T2Space` instances (`Orthonormal.lean:225`, `Plucker.lean:89`).
- Duplication by object: `roadmaps grep -i varifold` and a grep for Allard, first variation and
  monotonicity formula find text on main only (GeometricCurrents, GeometricMeasureTheory,
  RiemannianGeometry/MinimalSurfaces; one unrelated line in an open GaugeQuiltFieldTheory head).
  Nothing at the pins states a varifold, a first variation of a measure on a Grassmann bundle or a
  monotonicity formula.
- Suppliers resolved on main: GeometricCurrents G1 (`TauCetiRoadmap/GeometricCurrents/README.md:137`,
  constancy criterion 229–232), G2 (240; manifold/chart comparison 245; mass of a compact oriented
  smooth source 268–272), G5 (583; local area minimization by comparison with T + ∂Q, 638–641), G6
  (668–689); GeometricMeasureTheory G2 (`…/GeometricMeasureTheory/README.md:148–181`);
  RiemannianGeometry R4 item 1 (`…/RiemannianGeometry/README.md:2271`, Hessian comparison 2311–2320),
  R5a (3205), R5a.2 (3362), R5b (3581); HopfRinow under `Completed/`, Layers 0, 1, 2 and 4 (229, 264,
  427, 495; isometry transport 521). Every cited section exists and states what it is cited for.
- Overlap report: no pull request changes this roadmap, no dropped id, no revision-only id, no
  second copy (no Varifolds folder on main). `roadmaps resolve` lists nothing missing. The board index
  lists AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject. No roadmap cites
  this one, so no numbering is owed. Ownership against the open pull requests was checked through
  `roadmaps grep` over their heads.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces (main; the open list — ManifoldOptimization, LorentzianGeometry, QuasiregularMaps, PointProcesses, RealSemisimpleLieGroups — has no varifold, Grassmann-bundle or monotonicity text by grep; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness, and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited; identified in 1.2 and 9.3; MinimalSurfaces line 86 names G6 for monotonicity of that object); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity and smooth Allard regularity for minimal immersions: owner MinimalSurfaces 3.1 and 5.5 (not restated); the varifold carrier and the theory for arbitrary varifolds: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2255 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. I read every *Needs:* line: each
names targets of earlier layers, pinned declarations, or sections of the four suppliers above.

### Principles, shape, plan, headlines

Read all 1946 lines of the README, `plan.json` (by script: 9 layers, 34 targets, each with a locator
and at least three tests, `gaps` empty) and the manifest (8 entries, every cited work recorded, no
machine path). No route-specific narrowing, no re-planned roadmap, no algorithm, no Lean file. Shape:
Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine
layers each ending with `### Examples` and `### Dependencies`, 34 sections each with a *Needs:* line
and a Checks block of at least three bullets (counted by script: minimum 3, maximum 7), Downstream
consumers, References. Grep for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors,
"optional", "deferred", round labels and process words: none. No backticked name is presented as this
roadmap's own.

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds (7.4,
7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient (5.2);
comparison with GeometricCurrents G6 (9.3). Each has hypotheses and a locator. The padding probe, the
`#check` comparison and the import header do not apply before there is a Lean file.

Remarks that need no change. The Summary's reference to Chapter 8 of Simon's lectures describes the
generality (arbitrary Radon measures on the Grassmann bundle), not the organisation. 6.3's lower-bound
bullet assumes V rectifiable, which its conclusion does not use.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at the 15 sampled targets and at 7.1, 7.4, 7.5 (statement),
6.2, 9.1 and 9.4 (21 passages). Shared runs are formulas and fixed names. The closest are 3.3's
statement of the first rectifiability theorem against Simon1983 line 7343–7349 (a list of four
conclusions, about 8 consecutive words apart from symbols) and 7.3's conditions (i)–(iv) against
Simon1983 line 7785–7787 (each a formula or a standard phrase of at most 5 words); both are lists the
mathematics fixes. 6.5's route shares its test field with 19.1 and words the conditions on γ
differently. Arrangement: Simon1983's Chapter 8 runs §38–§42; the README spreads §38 over 1.1–1.3 and
3.3, §39 over 3.1 and 4.1–4.4, builds Layer 2 from §3, §11, §15, merges §40–§41 with §17–§19 and
Scharrer's Riemannian formula in Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7 and 8, and adds
4.5, Layer 5 and Layer 9: no one-to-one run. The order first variation → monotonicity → tangents →
rectifiability is forced (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 6.4, 7.1–7.2). Reuse: no
table, figure or exercise list is taken over.

Source independence: 21 passages compared with 5 sources (Simon1983, AgnolettoCorreaHoyosDaSilvaNardulli2025, Scharrer2022, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 84 of 134 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 40.4 (line 7543–7547): the extraction shows the first-variation term in the bracket
  without a sign, where my computation gives a minus; a lost sign in the extraction and a misprint in
  the source cannot be told apart from this text. The README's sign is the computed one.
- Simon1983: the displays of 38.1 (line 7336–7338), 40.1 (line 7517), 40.6's density hypothesis (line
  7569–7571), 42.1 (line 7736), 42.4's density hypothesis (line 7777–7778) and 42.9's hypotheses (line
  7993) are lost or damaged in the extraction; I matched the statements through the surrounding prose
  and the proofs.
- 7.5 for h ≠ e, 4.4's isometry law, 4.5, 5.2's general formula, 6.5 for non-rectifiable V and 7.2's
  dilation-invariance step on M: no source states them; the README marks them as its own, with
  routes. I recomputed 4.4, 4.5, 5.2, 6.5 and 7.2 above; 7.5 for h ≠ e I did not re-derive this round.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected C² submanifold M is a constant multiple of M in U; it should be requiring M ∩ U connected (two arcs of one curve in U can carry different multiplicities); affects a stated result.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (a file on the ANU mathematics site); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "42be01f8220be1ad1587a29fdc5b98f029533016", "job": "REV-DESIGN-Varifolds~13", "model": "fable", "worker": "chris-x91"} -->
