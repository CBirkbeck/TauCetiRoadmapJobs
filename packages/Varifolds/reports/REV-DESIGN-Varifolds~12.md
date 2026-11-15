<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6901364563 -->
Review (claude) of e99df0c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 9.1's new parenthesis changes subject without saying so

   **Location.** `packages/Varifolds/design/README.md:1776–1777`: "(6.4 in U, where the restriction is
   stationary, since a field with compact support in U extends by 0 to W, has support spt‖V‖ ∩ U, and
   is nonzero because x ∈ spt‖V‖)".

   **Claim.** The three facts that let 6.4 apply in U are properties of the restriction of V to U.

   **Witness.** As written, "has support spt‖V‖ ∩ U" and "is nonzero" attach grammatically to "a
   field with compact support in U", the subject of the nearest clause; a field has neither property
   (X = 0 is a field with compact support in U).

   **Exact repair.** Replace the parenthesis by: "(6.4 applied in U to the restriction V' of V: V' is
   stationary in U, because a field with compact support in U extends by 0 to W; spt‖V'‖ =
   spt‖V‖ ∩ U (1.3); and V' ≠ 0 because x ∈ spt‖V‖)". Tested on the witness of the previous round,
   V = v(L_1, 1) + v(L_2, 2), x = (1, 0), U = B_{1/2}(x): V' = v((½, 3/2) × {0}, 1) is stationary in U,
   its support is the segment, it is nonzero, and 6.4 gives θ_0 = 1. `plan.json` needs no change (its
   9.1 entry does not have the parenthesis).

One finding, P3 (a wording repair in 9.1, written out below); no P1 or P2. The verdict asks for
changes only because that repair is to be applied; everything else is verified sound. Both findings of
REV-DESIGN-Varifolds~11 are repaired. No gap is declared and none is needed. No maintainer notes
were supplied. No file of the design and no manifest entry was edited; no source was fetched (all
eight cited works are in `packages/Varifolds/sources.toml`). There is no `Suggested.lean` at the
design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~11), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (P3; 3.1's push-forward into a target of dimension below k) | README 348, 353–356: "an integer k ≥ 0 … For k > dim E no subspace has dimension k and G(E, k) = ∅ … The statements below take 0 ≤ k ≤ dim E"; 684–686: "No bound on dim M' is assumed: if dim M' < k, then df_x is injective on no k-plane, J_S f ≡ 0, every G(T_yM', k) is empty (1.1), so G_k(W') = ∅ and f_#V = 0"; new Checks 397 and 718–722 | **Repaired**, and more carefully than asked (the carrier is defined before it is called empty). Recomputed: self-adjoint idempotents of ℝ are 0, 1, of ranks 0, 1, so G(ℝ, 2) = ∅; `LinearMap.normDet_eq_zero_iff_ker_ne_bot` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:111`) gives normDet(df : ℝ² → ℝ) = 0; the wrong model's weight is ∫_{−1}^{1} 2√(1 − t²) dt = π. `plan.json` 1.1 and 3.1 say the same (diff of the two heads read). |
| F02 (P3; 9.1's constant-multiplicity bullet) | README 1774–1779: "for every open U ∋ x such that spt‖V‖ ∩ U is a connected C² embedded k-submanifold of U, the restriction of V to U is θ_0 [spt‖V‖ ∩ U] … Such U exist: the domain of a slice chart at x, with a cube as image"; new Check 1788–1791 | **Repaired** in substance; the added parenthesis is R01. 6.4 with W := U, Σ := spt‖V‖ ∩ U: hypotheses hold (support of the restriction is spt‖V‖ ∩ U ⊆ Σ, Σ connected C²), the alternative V = 0 is excluded by x ∈ spt‖V‖. Cross with multiplicities 1, 2: B_2(x) ∋ 0 excluded (not a submanifold), B_{1/2}(x) gives θ_0 = 1. For k = 0 the bullet is also true directly (a connected 0-submanifold is {x}). |

The repaired patterns elsewhere. Dimension bounds: every other map between manifolds keeps or raises
the dimension (1.2 and 4.4 isometries, 3.2 dilations and β_{x,λ}, 5.2's inclusion into ℝ^L with
L ≥ N ≥ k, 9.1–9.2 diffeomorphisms); 1.2's bullets hold for the empty bundle (π : ∅ → W' is
continuous, open and proper; nothing claims surjectivity). Quantifiers over neighbourhoods: 7.2's
"on a neighbourhood of x" is existential in a hypothesis; 6.3's "on an open set U" and 6.4's Σ are
given data; 9.1's definition of reg^r is existential by design. No finding of the repair report was
marked not actionable.

### Adversarial table (values computed this round)

The sections that round 11 took from earlier rounds (1.4, 2.1, 2.3, 3.2, 4.3, 6.5, 7.5, 9.4) are
recomputed here, with this round's sampled targets and the headlines.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 (changed) | E = ℝ, k = 0, 1, 2; lines ℓ_θ; Q A⁻¹ Q* at (diag(1, 0), P_{ℓ_0}) | {0}, {1}, ∅; P_θ − P_0 = sin θ·[[−sin θ, cos θ], [cos θ, sin θ]], symmetric of determinant −1, norm \|sin θ\|; Q = diag(1, 0), A = diag(1, 0) + diag(0, 1) = 1, result diag(1, 0) | sound |
| 1.3 (sample) | horizontal and vertical lifts of H¹⌞axis; unit disc; k > dim | ∫χ tr(P diag(1, 0)) = ∫χ dH¹ against 0; mass 2; only varifold on ∅ is 0 | sound |
| 1.4 (sample) | δ_{(1/j, P)}; δ_{(j e_1, P)}; j δ_{(0, P)}; alternating lifts | limit δ_{(0, P)}; masses 1 → limit mass 0 (lower semicontinuity only); ∫f = j f(0, P) unbounded; test χ tr(P diag(1, 0)) alternates ∫χ, 0 | sound |
| 1.4 bounded mass of convergent sequences | f ≥ 1 on G_k(K), compactly supported | ‖V_j‖(K) ≤ ∫f dV_j, a convergent real sequence | sound |
| 2.1 | H¹⌞L with λ^{−k}, λ^{−k+1}, λ^{−k−1}; φ(y) = 2y | 2λ·λ⁻¹ = 2 (= 1·H¹(B_1 ∩ L)), 2λ → 0, 2/λ → ∞; φ_*μ(A) = μ(A/2) = ½H¹(A ∩ L) = θ/J with J = 2 | sound |
| 2.2 | endpoint of (0, 1) × {0}; Simon 3.5 for weighted measures | ρ/(2ρ) = ½ at an H¹-null point; 3.5 is stated for any Borel regular μ and μ-measurable A of finite measure (Simon1983 line 774–775), so θHᵏ⌞(Γ ∩ K) is covered | sound |
| 2.3 | graph of \|t\|^{3/2} | u'² = (9/4)\|t\|; 2∫_0^1 √(1 + 9t/4) dt = (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2 ≈ 2.828 | sound |
| 3.1 (changed) | f(y) = y_1, k = 2, V = v(D, 1); h(t) = (t, 0) after f; f(t) = t² | J ≡ 0, f_#V = 0; rank d(h ∘ f) ≤ 1 so (h ∘ f)_#V = 0 = h_#0; ∫φ(t²)\|2t\|dt = 2∫_0^1 φ | sound |
| 3.2 | segment [0, 1]; great circle on S² | mass λ⁻¹·1; radial Jacobian of λ⁻¹exp_x⁻¹ is λ⁻¹ exactly, so λ⁻¹·2λρ = 2ρ for λρ < π | sound |
| 3.3 (sample) | ‖V‖ = \|y_1\|H¹⌞L + \|y\|⁻¹ Lebesgue; weight e^{−1/\|y_1\|} | ‖V‖(B_r(0)) = r² + 2πr, Θ¹(0) = π, Θ¹((a, 0)) = \|a\|, so D = L; (‖V‖⌞D)(B̄_{3r}) = 9r² > (3 + 1)r²; ∫_{2r}^{3r} e^{−1/t} ≥ r e^{−1/(2r)} against ∫_0^r ≤ r e^{−1/r}: ratio ≥ e^{1/(2r)} | sound; D' needed |
| 3.3 Vitali family at the pin | `Vitali.vitaliFamily` (`Mathlib/MeasureTheory/Covering/Vitali.lean:460`) | hypothesis `∀ x, ∃ᶠ r in 𝓝[>] 0, μ (closedBall x (3 * r)) ≤ C * μ (closedBall x r)` on a pseudo-metric space: satisfied on D' (ratio → 3^k < 3^k + 1); needs min(d_g, 1) since d_g is extended | route owned |
| 4.1 (sample) | circle, X = ψy; X = ψ y_2² e_1 on the x-axis; vertical lift with X = ψ y_2 e_2 | div_T X = 1, δ[C](X) = 2π = (2πe^t)'(0); DX = 0 on L; δV(X) = ∫ψ(t, 0)dt ≠ 0 although X = 0 on the support | sound |
| 4.2 (sample) | L(X) = ⟨X(0), 2e_1⟩; L(X) = ∫(X¹ + X²) | 2δ_0, η = e_1; sup = √2 vol(U) at ψ = χ(1, 1)/√2 (sup norm would give 2 vol(U)) | sound |
| 4.3 (sample) | X_n = n⁻¹ψ sin(n y_2)e_2 on the vertical lift; lower semicontinuity | ∂_2X_n² = n⁻¹∂_2ψ sin(n y_2) + ψ cos(n y_2) = ψ on the axis, sup\|X_n\| ≤ n⁻¹; δV(X) = lim δV_j(X) ≤ lim inf ‖δV_j‖(U) sup\|X\| | sound |
| 4.4 (headline) | half hyperplane; θ = 1 + y_1²; step multiplicity | ∫_Σ ∂_1X¹ = −∫X¹ dH^{N−2}, η = −e_1; δV(X) = −∫X¹θ', H = (θ'/θ)e_1; ∫_{−∞}^0 X' + 2∫_0^∞ X' = −X(0), σ = δ_0, η = −e_1 | sound |
| 4.5 | g = e^{4t}dt², h = 4g, X = (1 − t²)² | Γ = 2, div_g X(0) = 2, δ_hV^h = 2·2 = 4, left side 2 > sup\|X'\| = 8/(3√3) ≈ 1.54 | sound |
| 5.1 (sample) | graph of \|t\|^{5/2}, X = φχe_2 | τ_1τ_2√(1 + u'²) = u'(1 + u'²)^{−1/2}; by parts −∫φu''(1 + u'²)^{−3/2} = −∫⟨tr B, X⟩dH¹ | sound |
| 5.2 (headline) | X tangent to M; great S^k ⊆ S^N | δ(ι_#V)(X) = δV(X^⊤) since B_M is normal, so ‖δV‖ ≤ ‖δ(ι_#V)‖; tr_{TΣ}B = −kx | sound |
| 6.1 (headline, sample) | circle, σ < 1 < ρ; line y_2 = a; weighted identity | 2π/ρ = 2π − 2π(1 − 1/ρ); 2√(ρ² − a²)/ρ both sides; from div_S X_ρ: δV(X_ρ) = kI − ρI' + ρJ' + ∫φ(y − x)·P_S∇h, so (ρ^{−k}I)' = ρ^{−k}J' + ρ^{−k−1}(∫φ(y − x)·P_S∇h − δV(X_ρ)), the README's signs | sound |
| 6.2 (headline) | tr_S(dr ⊗ dr + r Hess r) with r Hess r ≥ x cot x (g − dr ⊗ dr), x = √κ r | ≥ k x cot x because x cot x ≤ 1; 1 − x cot x ≤ (2/π)x ≤ x on (0, π/2], equality of the first at π/2 | sound |
| 6.3 (sample) | chart-ball route; θ = e^{−1/\|t\|}; segment [−a, a] | S ≤ f(ρ) + ½ max(S, S') gives S ≤ 2f(ρ) + S'; ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}, doubling ratio ≥ (2r)⁻¹e^{1/(3r)}; ‖V‖(B̄_{2a}) = 2a < 4a | sound |
| 6.4 (headline) | g = e^{2t}dt²; atom on a line | div_g X = e^{−t}(e^tX)', θ̃ = 1 constant while (θ̃w)' = e^t; δV'(ψ y_1e_1) = 0 + 1 | sound |
| 6.5 (sample) | X = ψγ(r)(y − ξ); circle with K the disc, with K = {0}; δ_{(0,P)} | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ, so k∫γ d‖V‖ ≤ 0; support misses E ∖ K, conclusion holds; H = −y ≠ 0, hypothesis fails and so does the conclusion; hull of {0} is {0} | sound, no rectifiability used |
| 7.1 (sample) | i segments of length 1/(2i); ½v(L, 1) | ‖δV_i‖ = 2i → ∞, limit density ½; density ½ < 1 persists | both hypotheses needed |
| 7.2 (headline, sample) | X = h(y)y on a cone-like C; density 1 + ½ sin(log r)cos ϑ | div_S X = kh + y·∇h when P_{S^⊥}y = 0; (λ^{−k}∫h(y/λ))' = −λ^{−k−1}∫(kh + y·∇h)(y/λ) = 0; ∫sin(log r)dr = (r/2)(sin log r − cos log r), values −π/4 at 1 and π/4 at e^π; blow-up error R^{k−1}(λR)^{1−k}‖δV‖(B_{λR}) → 0 | sound |
| 7.3 (headline) | Lebesgue with constant line; vertical lift | Θ¹ = 0, stationary, not rectifiable; Θ > 0, δV unbounded | both hypotheses needed |
| 7.4 (headline) | alternating lines; zigzag, i = 2 | no limit of the full sequence; (1, 1)/√2 + (−1, 1)/√2 = (0, √2), total √2 + 2 | sound |
| 7.5 (sample) | m planes; disc of radius r; spike functions | m ≤ (1 + δ)m + δ, n_0 ≥ m(3/2)^k; arc ≥ 2ρ over area ≤ πρ²/2 gives ratio ≥ 4/(πρ) > ε; (1 + δ)(3/2) + 2δ < 2 iff δ < 1/7 | sound |
| 7.6 (headline, sample) | \|ψ' − θ\| ≤ (a − ψ') + (a − θ), a = (1 + δ)θ + 2δ | ∫ ≤ aω_k − (θω_k − δ) + (a − θ)ω_k = 2(δθ + 2δ)ω_k + δ; ψ' integer valued gives dist(θ, ℤ) ≤ 2(δθ + 2δ) + δ/ω_k → 0 | sound |
| 8.1–8.2 (headline) | ½v(L, 1); step multiplicity; x ∉ spt‖V‖ | hypothesis fails, cone still rectifiable; ρ⁰‖δV‖({0}) = 1 ↛ 0; C = 0, integral | sound |
| 9.1 (changed) | crossing lines with multiplicities 1, 2; k = 0 | B_2(x) excluded, B_{1/2}(x): θ_0 = 1; one point, θ_0 = ‖V‖({x}) | sound; wording R01 |
| 9.3 (headline, sample) | [[P]] − [[P]]; 2[[P]] and reversed | θ_T = 0, Γ_T⁺ = ∅, varifold 0; v(P, 2) both | sound |
| 9.4 | Simon2023 Theorem 1.1; EdelenSpolaor2023 Theorem 1.4 | n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1, f = f(x, y), sing = {0} × {0} × K; n > 7 makes every C_{p,q} minimizing | statements match |

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.3 | Simon1983 line 7308–7317; Agnoletto et al. line 157–160 | varifold, weight, mass, restriction to G_n(A); Definitions 2.1–2.2. Match. Allard1972 Section 3 not readable. |
| 1.4 | Simon1983 line 1038–1045, 7336–7338, 7738–7740 | Theorem 4.4 (mass bounded on open sets of compact closure, convergence against K(X)); convergence "in the sense of Radon measures". Match. |
| 3.3 | Simon1983 line 7333–7368, 7419–7440 | 38.1–38.4 and the proof of 38.3 through 11.8 and the second part of 38.4. Match (38.4 is stated for functions of S alone; the README's f(y, S) follows by uniform continuity). |
| 4.1 | Simon1983 line 7443–7473, 1948–1964; Agnoletto et al. line 179–187, 210–212; Scharrer2022 line 87–98 | 39.1–39.2, 9.3; Definition 2.4, Proposition 2.6; tangential divergence with Levi-Civita. Match. |
| 4.2 | Simon1983 line 857–882 | Theorem 4.1 and Remark 4.2 (open-set formula). Match. Federer1969 2.5 not readable. |
| 4.3 | Simon1983 line 7474–7486, 7580–7583; Agnoletto et al. line 264–268 | stationarity, locally bounded first variation, 39.3; 40.7(1); Definitions 2.8–2.9. Match. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2) (closure in U compact in M), 16.6(1). Match. |
| 6.1 | Simon1983 line 7513–7547, 3014–3040, 3205–3221 | 40.1–40.3 (exponential form and stationary identity as in the README), 40.4, 17.2 computation, 18.1. Match; the sign in 40.4 is under "Not verifiable". |
| 6.3 | Simon1983 line 7550–7565, 3119–3152; Agnoletto et al. line 1448–1456, 1542–1547, 1680–1684 | 40.5, 17.8, 17.9(1); Corollary 2.27, Remark 2.28, Theorem 2.30. Match. |
| 6.5 | Simon1983 line 3371–3400 | 19.1–19.2, rectifiable with generalised mean curvature, same test field; the README says the general case is its own. Match. |
| 7.1 | Simon1983 line 7566–7583, 7592–7600 | 40.6 with the exceptional sets B_i and the lim inf hypothesis; start of the covering proof. Match. |
| 7.2 | Simon1983 line 7733–7774, 3414–3430, 3461–3481 | 42.1–42.3, with the remark that η_{0,λ#}C = C is known only under 42.6; 19.3 and its degree-zero homogeneous weights. Match. |
| 7.5 | Simon1983 line 7986–8060 | 42.9 with ε ∈ (0, δ²), 42.10, the sets A_1, A_2 and bound (6). Match for h = e; the set Z and the case h ≠ e are the README's, as it says. |
| 7.6 | Simon1983 line 7899–7985 | 42.8 and its proof through (8). Match. |
| 9.3 | Simon1983 line 7253–7293 | the varifold attached to an integer multiplicity current. Match; the comparison statements are the README's own. |

Also read: Simon1983 line 7664–7688 (41.1, 41.2), 7793–7805 (42.6), 7886–7898 (42.7), 774–788 (3.5);
Simon2023 line 73–97; EdelenSpolaor2023 line 104–135; Scharrer2022 line 1120–1127 (Lemma 3.3).

### Pins, duplication, suppliers, direction

- Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `plan.json`'s
  baseline. All 73 backticked library names of the README were resolved by script at the pins and
  the doubtful ones opened: `CovariantDerivative.leviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`, in namespace
  `CovariantDerivative`), `Besicovitch.vitaliFamily`, `Besicovitch.ae_tendsto_rnDeriv`,
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet`
  (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1020`, `:1077`, `:1088`; closed balls, locally
  finite measures), `Vitali.vitaliFamily` (`…/Covering/Vitali.lean:460`),
  `MeasureTheory.Measure.setLIntegral_rnDeriv_le` (`…/Decomposition/RadonNikodym.lean:319`, no
  σ-finiteness), `Measure.rnDeriv`, `Measure.singularPart` (`…/Decomposition/Lebesgue.lean:80`,
  `:73`), `LinearMap.normDet`, `LinearMap.normDet_comp` (`…/InnerProductSpace/NormDet.lean:69`,
  `:324`), `LipschitzWith.hausdorffMeasure_image_le` (`…/Measure/Hausdorff.lean:745`),
  `MeasureTheory.Measure.condKernel` (`…/Disintegration/StandardBorel.lean:361`); Tau Ceti
  `TauCeti.CountablyRectifiable` with `mono`, `congr`, `iUnion`, `image`
  (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44`, `:74`, `:78`, `:122`, `:135`),
  `TauCeti.RealRMK.posPart`, `negPart` (`…/RieszMarkovKakutani/Signed.lean:160`, `:205`),
  `Distribution.massMeasure`, `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure`
  (`TauCeti/Analysis/Distribution/Mass/Measure.lean:191`, `:213`, `:306`),
  `MeasureTheory.integral_divergence_eq_zero`
  (`TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean:30`),
  `TauCeti.Manifold.integral_divergence_eq_zero`
  (`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:225`), the `CompactSpace` and
  `T2Space` instances of `TauCeti.finiteGrassmannian` (`…/Grassmannian/Orthonormal.lean:225`,
  `Plucker.lean:89`). Each is as the supplier contract describes it.
- Duplication by object: `roadmaps grep -i varifold` and `-i Allard` find text on main only
  (GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces, and an unrelated
  JacobianChallenge line); nothing at the pins states a varifold, a first variation of a measure on
  a Grassmann bundle or a monotonicity formula.
- Suppliers on main (the content checkout is one commit past the main of the overlap report; that
  commit changes ImaginaryQuadraticClassNumber only): GeometricCurrents G1 (line 137; the constancy
  criterion for scalar distributions on connected Euclidean open sets, line 229–232), G2 (240;
  manifold/chart comparison 245, mass of a compact oriented smooth source 268–272), G5 (583), G6
  (668–689: tangent-plane measure of an integral current, unoriented fibre by orientation quotient,
  compactness over compact base regions, Radon compactness, weak first variation, monotonicity,
  tangent cones); GeometricMeasureTheory G2 (148–181: approximate tangent planes, tangential
  differentiation, area formula with extended multiplicities, C¹ graphs); RiemannianGeometry R4
  item 1 (2271, Hessian comparison 2311–2320), R5a (3205), R5a.2 (3362), R5b (3581); HopfRinow
  under `Completed/`, Layers 0, 1, 2 and 4 (229, 264, 427, 495). Every cited section exists and
  states what it is cited for.
- Ownership against open work: the two greps above over the 464 open heads return nothing outside
  main; the board index lists AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this
  subject. Overlap report: no pull request changes this roadmap, no dropped id, no revision-only
  id, no second copy (there is no Varifolds folder on main). `roadmaps resolve`: nothing missing.
  No roadmap cites this one, so no numbering is owed.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces (main; of the open list, ManifoldOptimization, LorentzianGeometry, QuasiregularMaps, PointProcesses and RealSemisimpleLieGroups contain no varifold, Grassmann-bundle or monotonicity text; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness, and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited, identified in 1.2 and 9.3; MinimalSurfaces line 86 names G6 for it); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity and smooth Allard regularity for minimal immersions: owner MinimalSurfaces 3.1 and 5.5 (not restated); the varifold carrier and the theory for arbitrary varifolds: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 241 roadmaps, 2243 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. Every *Needs:* line was read; each
names targets of earlier layers, pinned declarations, or sections of the four suppliers above, and
each layer's Dependencies line names exactly the layers its *Needs:* lines reach (Layer 5:
{2, 3, 4}; 6: {1–4}; 7: {1–4, 6}; 8: {4, 6, 7}; 9: {1–4, 6–8}).

### Principles, shape, plan, headlines

Read all 1940 lines of the README, `plan.json` (by script: 9 layers, 34 targets, each with a
locator and at least 3 tests, `gaps` empty, suppliers as in the README) and the manifest (8 entries,
every cited work recorded, no machine path). No route-specific narrowing beyond the one settled in
round 5 (6.3's geodesic-ball ratio bound on M is asserted where the density is positive; a.e.
existence of the density is unrestricted and no consumer needs more), no re-planned roadmap, no
algorithm, no Lean file. Shape: Summary, Scope and ownership, Conventions, Exact supplier
contracts, How to read the build, nine layers each with `### Examples` and `### Dependencies` (34
sections, 34 Checks blocks, each with at least three bullets), Downstream consumers, References.
Grep for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, "optional",
"deferred", round labels and process words: none ("current" occurs only as the mathematical noun).
No backticked name is presented as this roadmap's own.

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds
(7.4, 7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient
(5.2); comparison with GeometricCurrents G6 (9.3). Each has hypotheses and a locator. The padding
probe, the `#check` comparison and the import header do not apply before there is a Lean file.

A remark that needs no change: 6.3's lower-bound bullet assumes V rectifiable, which its
conclusion does not use (it follows from Θ ≥ 1 a.e. and upper semicontinuity); 7.3 and 7.5 reach
the same conclusion for their cones through the upper-semicontinuity bullet, so nothing is blocked.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at every locator of the sample table and at 2.2,
6.4, 7.4, 8.1 and 9.4 (31 passages). Shared runs are formulas and names the literature fixes
(generalised mean curvature, boundary, boundary measure, co-normal; "locally bounded first
variation"); 6.5's route shares its test field with Simon1983 19.1 and words the conditions on γ
differently; 7.6's route is the README's own computation where the source's ends with a truncation
argument. Arrangement: Simon1983's Chapter 8 runs §38–§42; the README spreads §38 over 1.1–1.3 and
3.3, §39 over 3.1 and 4.1–4.4, builds Layer 2 from §3, §11, §15, merges §40–§41 with §17–§19 and
Scharrer's Riemannian formula in Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7 and 8, and
adds 4.5, Layer 5 and Layer 9: no one-to-one run. The order first variation → monotonicity →
tangents → rectifiability is forced (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 6.4,
7.1–7.2). Reuse: no table, figure or exercise list taken over.

Source independence: 31 passages compared with 5 sources (Simon1983, AgnolettoCorreaHoyosDaSilvaNardulli2025, Scharrer2022, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 84 of 134 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 40.4 (line 7543–7547): the extraction shows the first-variation term inside the bracket
  with no sign before it, where the computation in the table above (and 18.1 with δV(X) = −∫H·X)
  gives a minus; a lost minus sign in the extraction and a misprint in the source cannot be told
  apart from the text I have. The README's sign is the computed one.
- Simon1983: the displays of 3.5 (line 775–776), 38.1 (line 7336–7338), 40.1 (line 7517), 40.6's
  density hypothesis (line 7569–7571), 42.1 (line 7736) and 42.9's hypotheses (line 7993) are lost
  or damaged in the extraction; the statements were matched through the surrounding prose and the
  proofs.
- 7.5 for h ≠ e, 4.4's isometry law, 4.5, 5.2's general formula, 6.5 for non-rectifiable V and
  7.2's dilation-invariance step on M: no source states them; the README marks them as its own with
  routes. 4.4, 4.5, 5.2, 6.5 and 7.2 were recomputed above; for 7.5 with h ≠ e I checked the error
  accounting of the route (Cε²σ(1 + σ/τ) ≤ 2Cεσ/τ for σ, τ ≤ 1 and ε small) and no more.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected C² submanifold M is a constant multiple of M in U; it should be requiring M ∩ U connected (two arms of one curve in U carry different multiplicities); affects a stated result.
- **Misprint** in Simon1983 at Remark 42.8 (proof), printed page 250: the source says the maximum of the fibre sum and an integer N above the limit density converges in L¹; it should be the minimum, the truncation from above; affects the proof.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (a file on the ANU mathematics site); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e99df0c10678979566f72d81bead18105c15301f", "job": "REV-DESIGN-Varifolds~12", "model": "fable", "worker": "chris-x80"} -->
