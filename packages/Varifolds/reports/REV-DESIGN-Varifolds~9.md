<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6899175435 -->
Review (claude) of 9f02e3f

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Isometry laws for H, σ, η and reg^r are stated for C¹ isometries

   **Location.** `packages/Varifolds/design/README.md:419–420` ("An isometry f … (a C¹ diffeomorphism
   with f*g' = g …)"), `:914–915` ("Isometries: for an isometry f of W onto an open W' (1.2),
   H_{f_#V}(f(x)) = df_x(H_V(x)), σ_{f_#V} = f_*σ_V and η is transported by df"), `:1704–1705` (9.2:
   "Every notion commutes with push-forward by an isometry f … (1.2)"); `plan.json` 1.2, 4.4, 9.2.

   **Claim.** For every C¹ diffeomorphism f with f*g' = g, the first variation, H, σ, η and reg^r are
   transported by f.

   **Witness.** For f only C¹, the field df⁻¹(Y ∘ f) tested by δV is merely continuous. Smoothness
   of C¹ isometries is Myers–Steenrod, which `Completed/HopfRinow/README.md:527–529` names as not
   owned; no layer, supplier or pin provides it.

   **Exact repair.** Keep 1.2 and 3.1 as they are (the bundle homeomorphism and J_S f = 1 hold for C¹
   isometries). Then:

   1. In 4.4 replace "for an isometry f of W onto an open W' (1.2)" by "for an isometry f of W onto
      an open W' (1.2) of class C² (then f_*X is C¹ for C¹ fields X and f carries the Levi-Civita
      connection of g to that of g', so div_{df_x S}(f_*X)(f(x)) = div_S X(x))".
   2. In 9.2 replace "push-forward by an isometry f of an open subset of a Riemannian manifold onto an
      open subset of another (1.2)" by "push-forward by a smooth isometry f of an open subset of a
      Riemannian manifold onto an open subset of another (1.2; class C² suffices for every notion
      except reg^r and sing^r, which need class C^r; that a C¹ isometry is smooth is the
      Myers–Steenrod theorem, which this roadmap does not use)".
   3. Make the same two changes in `plan.json` 4.4 (the isometry law) and 9.2 (hypothesis
      "f smooth isometry of an open set onto an open set").

   Tested: the only isometries the roadmap itself applies these laws to are smooth: the rotations of
   9.2's Checks (H = −x on the unit circle goes to R(−x)) and 4.5's y ↦ λ⁻¹ exp_x⁻¹(y) from
   (B_r(x), λ⁻²g) onto (B_{r/λ}(0), g̃_λ); both remain covered, and for a C² isometry the Christoffel
   transformation law, which contains ∂²f, is defined.

2. **F02** (P3) 7.5's route omits the bound on the number of fibre points

   **Location.** `packages/Varifolds/design/README.md:1519–1521`: "(iii) An induction on the number of
   points of a fibre off R, … with the centres of each stage chosen among those points, concludes";
   `:1563` (*Needs:*); `plan.json` 7.5 prerequisites.

   **Claim.** The induction gives the bound with ε = ε(δ, Λ, k, N) for every fibre.

   **Witness.** Simon1983 line 8001–8010: ε depends on the number of fibre points, and that number is
   bounded only if Θ ≥ 1 at them. Off R only the ratio bound at the point is known; 6.3's lower bound
   needs it on an open set.

   **Exact repair.** Add to step (iii): "The constants of the induction depend on the number of
   points, so that number is bounded first. At y ∈ spt‖V‖ ∖ R the ratio bound and 6.2 give
   ρ^{1−k}‖δV‖(B_ρ(y)) ≤ Cερ → 0, so 7.2 applies at y; each C ∈ VarTan(V, y) is stationary with
   Θ^k(‖C‖, ·) ≥ 1 ‖C‖-a.e. (7.1 for the rescaled varifolds of 4.5, V being integral), hence at every
   point of spt‖C‖ (6.3, upper semicontinuity), and if Θ^k(‖V‖, y) > 0 then 0 ∈ spt‖C‖ and
   Θ^k(‖V‖, y) = Θ^k(‖C‖, 0) ≥ 1. So the densities off R are 0 or at least 1, the bound for n points
   allows at most (1 + δ)Λ(ω_k 2^k)⁻¹ + δ points of positive density in a fibre off R, and ε is the
   least of the finitely many values." Add "Layer 7.1–7.2" to 7.5's *Needs:* and `target:7.1`,
   `target:7.2` to its prerequisites in `plan.json` (both precede 7.5; 7.1 and 7.2 do not use 7.5).

   Tested: for m·v(ℝ^k × {0}, 1) with Λ = mω_k 3^k the count bound is (1 + δ)m(3/2)^k + δ ≥ 1, and
   the fibre has one point; for the dense-disc Check every fibre point off Z has density 0 and the
   count is 0.

3. **F03** (P3) Layer dependency lines omit library inputs their targets use

   **Location.** `packages/Varifolds/design/README.md:643–644` ("Layer 1; GeometricMeasureTheory G2;
   GeometricCurrents G2; Tau Ceti `TauCeti.CountablyRectifiable`; HopfRinow Layer 2."), `:785`,
   `:995–997`, `:1089–1090`.

   **Claim.** Each `### Dependencies` lists what its layer consumes.

   **Witness.** 2.2 *Needs:* Mathlib `Vitali.exists_disjoint_subfamily_covering_enlargement` (added by
   the last repair), 2.3 Tau Ceti `TauCeti.riemannianVolume`; 3.3 Mathlib
   `MeasureTheory.Measure.condKernel`; 4.4 Mathlib `Measure.rnDeriv`; 5.1 Tau Ceti
   `MeasureTheory.integral_divergence_eq_zero`. None is in its layer's line.

   **Exact repair.** Layer 2: append "Mathlib (Besicovitch differentiation, the Vitali covering lemma,
   `LinearMap.normDet_comp`); Tau Ceti `TauCeti.riemannianVolume`". Layer 3: append "Mathlib
   (`LinearMap.normDet`, `MeasureTheory.Measure.condKernel`, Besicovitch and Vitali families)".
   Layer 4: append "Mathlib (`CovariantDerivative.leviCivitaConnection`, `RealRMK.rieszMeasure`,
   Radon–Nikodym derivatives)". Layer 5: add "and `MeasureTheory.integral_divergence_eq_zero`" after
   the manifold divergence theorem.

Three findings: one P2 (a smoothness hypothesis missing from the isometry laws of 4.4 and 9.2, in
text no earlier round tabulated) and two P3. Both findings of REV-DESIGN-Varifolds~8 are repaired,
and the repaired 7.5 and 7.6 are mathematically sound as statements. No gap is declared and none is
needed. No maintainer notes were supplied. No file of the design and no manifest entry was edited;
no source was fetched (all eight cited works are recorded in `packages/Varifolds/sources.toml`).
There is no `Suggested.lean` at the design stage; elaboration: not available (this lane does not
elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~8), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (7.6's route did not follow from 7.5) | 7.5: "there is a Borel set Z ⊆ spt‖V‖ ∩ B_2(0) with ‖V‖(Z) < δ such that, for every x … the sum of these densities is at most (1 + δ)(ω_k 2^k)⁻¹‖V‖(B_2(x)) + δ. Moreover p(Z) ∩ B_1(0) lies in a Borel set A …" (line 1491–1497); 7.6: "Write … ψ_i = ψ'_i + ψ''_i … dist(θ(x), ℤ) ≤ 2(δθ(x) + 2δ) + δ/ω_k" (1581–1593) | **Repaired**, differently from the review's text and correctly so: the repair report's dense-disc example refutes "Z = all of R" (recomputed below). The new route gives the conclusion (rows 7.5, 7.6 below). One step of 7.5's route is still unstated: R02. |
| F02 (v(Γ_T, \|θ_T\|) with θ_T possibly 0) | "let Γ_T⁺ = {x ∈ Γ_T : θ_T(x) ≠ 0} … 𝐯_T = v(Γ_T⁺, \|θ_T\|), an integral varifold whose weight is the mass measure ‖T‖ = \|θ_T\| Hᵏ⌞Γ_T" (1724–1727) | **Repaired.** [[P]] − [[P]]: Γ⁺ = ∅, v = 0; ±2[[P]]: v(P, 2). `plan.json` 9.3 agrees. |

Same patterns elsewhere: v(·, θ) with θ not positive: 3.1 (Γ⁺, θ_f > 0), 6.4 (v({θ > 0}, θ)), 7.3
and 8.1 (θ = Θ > 0 on Γ): none. A measure-smallness bound used for an L¹ conclusion: only 7.5–7.6.
A step taken from inside a source's proof: 7.5 (R02); 7.1, 7.3, 6.4 routes name their inputs. No
finding of the repair report was marked not actionable.

### Principles, shape, plan

Read all 1832 lines of the README, `plan.json` (9 layers, 34 targets, every prerequisite an
earlier target, a pin or a supplier section; `gaps` empty; at least 3 tests each) and the manifest
(8 entries, `cited_for` agreeing with the README, no machine path). No route-specific narrowing, no
re-planned roadmap, no algorithm, no Lean file. Shape: Summary, Scope and ownership, Conventions,
Exact supplier contracts, How to read the build, nine layers each with Examples and Dependencies,
Downstream consumers, References. Grep for LaTeX delimiters, pull-request numbers, machine paths,
HTML anchors, round labels and process words: none. No backticked name is presented as this
roadmap's own (all 67 distinct backticked identifiers are library names). The Summary's "in the
generality of Allard's theory as presented in Chapter 8 of Simon's lectures" names a generality,
not an order.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 2.2 vanishing off the carrier (new) | v((0,1)×{0}, 1); k = 0, Γ = {1/n}, θ = 2⁻ⁿ, x = 0 | endpoint ρ/(2ρ) = ½ on an H¹-null set, 0 at distance d > 0; μ(B_ρ(0)) = Σ_{1/n<ρ} 2⁻ⁿ → 0 | sound |
| 2.2 definition, k = 0, sums | atoms; two crossing lines | Σθ(x)δ_{(x,0)}; v(L_1 ∪ L_2, 1) = v(L_1, 1) + v(L_2, 1), crossing H¹-null | sound |
| 7.5 mass of R | Besicovitch with ε²-small data | ‖V‖(B_ρ) < ε⁻¹‖δV‖(B_ρ) on A_1; ≤ eΛρ^k < eΛε⁻¹·tilt on A_2 ∖ A_1; total ≤ cε⁻¹·2ε² | sound |
| 7.5 A from Z | Z ∖ Γ' Hᵏ-null (2.2); p 1-Lipschitz; θ ≥ 1 on Γ' | Lᵏ(p(Z)) ≤ Hᵏ_e(Z ∩ Γ') ≤ (1 + Cε²)‖V‖(Z) < 2·δ/4 | sound |
| 7.5 dense discs (k = 2, N = 3) | Σ2πr_j < ε², r_j < ε | bad radii have length ≤ Σ2r_j < ε²/π < ½; ratio ≥ 2/sup r_j > ε; R = B_2(0), p(R) ⊇ unit disc (π); p(Z) ≤ Σπr_j² < ε³/2 | Z = R refuted, Z as stated sound |
| 7.5 fibre points lie in B_2 | \|x\| < 1, \|q\| < ε < 1 | \|y\| < √2 < 2 | sound |
| 7.5 number of fibre points | densities off R | 0 or ≥ 1 by 7.1, 7.2, 6.3; count ≤ (1 + δ)Λ(ω_k2^k)⁻¹ + δ | true; step missing: R02 |
| 7.6 route (headline) | a = (1 + δ)θ + 2δ; ∫ψ'' ≤ (1 + o(1))δ; ∫ψ' ≥ θω_k − δ − o(1) | ∫(a − ψ') ≤ (δθ + 2δ)ω_k + δ; ∫(a − θ) = (δθ + 2δ)ω_k; dist(θ, ℤ) ≤ 2(δθ + 2δ) + δ/ω_k → 0 | sound |
| 7.6 on the spikes | ψ_i = 1 + i·1_{E_i}, δ < 1/7 | 1.5 + 3.5δ < 2, so ψ' ≤ 1; ∫ψ'' ≥ i·Lᵏ(E_i) → ω_k/2 > δ | excluded |
| 7.6 hypotheses of 7.5 | Λ = θω_k3^k + 1 | lim sup ‖Ṽ_i‖(B_3) ≤ θω_k3^k < Λ; lim sup sup_ξ ‖Ṽ_i‖(B_2(ξ)) ≤ θω_k(2 + η)^k for every η | sound |
| 9.3 (headline) | [[P]] − [[P]]; ±2[[P]] | ∅, 0; v(P, 2) with weight 2Hᵏ⌞P | sound |
| 1.1 | perpendicular lines; frame (1, 1) | ‖P − P'‖ = 1; ½[[1,1],[1,1]] idempotent, [[1,1],[1,1]]² = 2[[1,1],[1,1]] | sound |
| 1.2 | h = diag(1, 4), u = (1, 1) | h(e_1, u)/h(u, u) = 1/5 against 1/2 | sound |
| 1.4 | δ_{(je_1, P)}; j·δ_{(0,P)} | masses 1 → limit 0; test ≥ 1 at (0, P) gives j → ∞ | sound |
| 3.1 | t ↦ t² on [−1, 1]; projection; chain rule | ∫\|2t\| = 2 = mass of v([0,1], 2); J = 0, image 0; (h∘f)⁻¹(K) ∩ spt = f⁻¹(h⁻¹(K) ∩ f(spt)) ∩ spt compact | sound |
| 3.3 | \|y_1\|H¹⌞L + \|y\|⁻¹L² | r² + 2πr, Θ(0) = π, D = L, ratio 9; weight e^{−1/\|t\|}: ratio ≥ e^{1/(2r)} | sound |
| 4.1 | circle, X = ψy; vertical lift, X = ψy_2e_2 | 2π = d/dt 2πe^t; div_S X = ψ on the axis | sound |
| 4.2 | ⟨X(0), 2e_1⟩; ∫(X¹ + X²) | 2δ_0; √2·vol | sound |
| 4.3 | X_n = n⁻¹ψ sin(ny_2)e_2 | sup ≤ 1/n, δV(X_n) = ∫ψ(t, 0)dt | sound |
| 4.4 isometry law | C¹ isometry | df⁻¹(Y∘f) only C⁰ | R01 |
| 5.1 | S^k, X = ψx; graph of \|t\|^{5/2} | k Hᵏ(S^k) both sides; ∫φ'u'(1 + u'²)^{−1/2} = −∫φu''(1 + u'²)^{−3/2}, and ⟨tr B, X⟩ds = φu''(1 + u'²)^{−3/2}dt | sound |
| 5.2 (headline) | great S^k ⊆ S^N; tangent X | δ(ι_#V)(X) = k∫⟨X, x⟩ = −∫⟨−kx, X⟩; B-term 0 for tangent X | sound |
| 6.2 (headline) | Grönwall; x = π/2 | f(σ) ≤ f(ρ) + C∫_σ^ρ f gives e^{Cσ}f(σ) ≤ e^{Cρ}f(ρ); (1 − x cot x)/x = 2/π | sound |
| 6.5 | X = ψγ(r)(y − ξ) | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; X = 0 on B̄_{R+ε}(ξ) ⊇ K | sound |
| 7.1 | i segments of length 1/(2i); g_i = (1 + 1/i)²e | weights → ½H¹, ‖δV_i‖ = 2i; weight (1 + 1/i)H¹ → H¹ | sound |
| 7.3 (headline) | 7.1 after division by (1 − ε)Θ(x) | {Θ < (1 − ε)Θ(x)} has density 0 at x by (iii); Θ(‖C‖, ·) ≥ Θ(x) | sound |
| 7.4 (headline) | zigzag i = 2; circles 1/i | √2 + 2; ‖δV_i‖ = i·(2π/i) = 2π, mass 2π/i | sound |
| 8.2 (headline) | hypotheses of 7.6 for the blow-ups | λ^{1−k}‖δV‖(B_{λR}) = R^{k−1}(λR)^{1−k}‖δV‖(B_{λR}) → 0 | sound |
| 9.1 | graph of \|t\|^{3/2}; ½v(L, 1) | curvature (3/4)\|t\|^{−1/2}(1 + …) unbounded: C¹ not C²; reg = L | sound |
| 9.2 | dilated circle; isometries | \|H\| = λ/R; C¹ isometry: R01 | R01 |
| 9.4 | n ≥ 8, p + q = n − 1; n = 3, m = 5, ℓ = 1 | ambient ≥ 9, all C_{p,q} minimizing; Σ of dimension 8 in ℝ⁹ | sound |

Rows of REV-DESIGN-Varifolds~8 with computed values (2.1, 2.3, 3.2, 4.5, 6.1, 6.3, 6.4, 7.2, 8.1)
are relied on; their text is unchanged.

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7305 | subspaces with the metric of the projections; compactness. Match. |
| 1.2 | Simon1983 line 7301–7305; Agnoletto et al. line 151–156 | product over a subset; Grassmann bundle of TM. Match. |
| 2.2 | Simon1983 line 2861–2897, 7318–7326, 774–788, 632–640; Agnoletto et al. line 166–175 | 15.1–15.5; the varifold of a rectifiable one; 3.5 and 3.3 (statement displays partly lost); Definition 2.3. Match. |
| 3.1 | Simon1983 line 7443–7454, 2903–2933; Agnoletto et al. line 188–195 | 39.1 with J_S f and the set where it is nonzero; 15.6–15.7; Definition 2.5. Match. |
| 4.2 | Simon1983 line 857–882 | 4.1, 4.2. Match; uniqueness is the README's. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2), 16.6(1). Match. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7674–7682 | 9.6, 16.4, 41.2(3). Support the special cases; the general formula is the README's route. |
| 6.2 | Scharrer2022 line 823–854, 1120–1127, 1184–1203; Agnoletto et al. line 542 | Lemma 2.7 (b > 0), Lemma 3.3, Remark 3.4; Lemma 2.22. Match. |
| 7.3 | Simon1983 line 7775–7790, 7806–7812; Agnoletto et al. line 1796–1798 | 42.4, 42.5 (i)–(iv); Theorem 2.32. Match. |
| 7.4 | Simon1983 line 7882–7898 | 42.7. Match. |
| 7.6 | Simon1983 line 7899–7985 | 42.8 and its proof; the L¹ step uses only the measure bound, as the README says. Match. |
| 8.2 | Simon1983 line 7793–7805, 7899–7912; EdelenSpolaor2023 line 109–112 | 42.6, 42.8; tangent cone up to rotation with multiplicity one. Match. |
| 9.1 | Agnoletto et al. line 89–92; Simon2023 line 73–83 | Definition 1.2 (C¹); reg and sing of a hypersurface with the standing convention. Match. |
| 9.3 | Simon1983 line 7253–7293 | the motivating passage; the comparison is the README's own. |
| 9.4 | Simon2023 line 84–96, 432–441; EdelenSpolaor2023 line 104–141 | Theorems 1.1, 3.7; Definition 1.1.1, Remark 1.2 (every C_{p,q} minimizing for n > 7), Theorem 1.4. Match. |

Also read: Simon1983 line 7986–8151 (42.9, 42.10 and the proof), which gave R02.

### Duplication audit, pins, suppliers, direction

- Pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in `lake-manifest.json`). Every backticked
  library name of the README was found at the pin, among them
  `Vitali.exists_disjoint_subfamily_covering_enlargement` (`Mathlib/MeasureTheory/Covering/Vitali.lean:62`:
  any index type, `1 < τ`, nonempty sets, `δ a ≤ τ * δ b`, as the contract describes),
  `LipschitzWith.hausdorffMeasure_image_le` (`Mathlib/MeasureTheory/Measure/Hausdorff.lean:745`, any
  set), `Besicovitch.ae_tendsto_rnDeriv` (`…/Covering/Besicovitch.lean:1077`),
  `VitaliFamily.ae_tendsto_average` (`…/Covering/Differentiation.lean:856`), `Vitali.vitaliFamily`
  (`…/Covering/Vitali.lean:460`), `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`
  (`…/Measure/Regular.lean:1183`), `MeasureTheory.Measure.setLIntegral_rnDeriv_le`
  (`…/Decomposition/RadonNikodym.lean:319`), `InnerProductSpace.euclideanHausdorffMeasure_eq_volume`
  (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:191`), `LinearMap.normDet`, `normDet_comp`,
  `euclideanHausdorffMeasure_image_eq_normDet_mul_volume` (`…/InnerProductSpace/NormDet.lean:69, 324, 433`),
  `instHasBesicovitchCovering` (`…/Covering/BesicovitchVectorSpace.lean:500`); Tau Ceti
  `CountablyRectifiable` with `mono`, `congr`, `iUnion`, `image`
  (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44, 74, 78, 122, 135`), `RealRMK.posPart`,
  `negPart` and the difference formula (`…/RieszMarkovKakutani/Signed.lean:160, 205, 262`), both
  `integral_divergence_eq_zero` (`…/DivergenceTheorem/CompactSupport.lean:30`,
  `…/Riemannian/DivergenceTheorem.lean:225`), the Grassmannian, flow, mass-measure, Prokhorov and
  volume declarations at the lines REV-DESIGN-Varifolds~8 lists. Grep of both pins for "varifold":
  nothing.
- Suppliers resolved on main (`1a19c9f`): GeometricCurrents G1 (scalar constancy criterion, line
  229–238), G2 (line 240–262: chart comparison, mass = absolute multiplicity times Hᵏ, locally
  integral currents), G5 (line 638–640), G6 (line 668–690); GeometricMeasureTheory G2 (line
  148–165); RiemannianGeometry R4 item 1 (line 2311–2320), R5a.2 (line 3394–3395); HopfRinow under
  `Completed/`, Layers 0–2 (line 229, 264, 427). None of these has an open revision in the list of
  open pull requests.
- Ownership against open work: `roadmaps grep -i varifold` over main and the open heads finds the
  word on main only. The board package index holds AnalyticNumberTheory and
  LawrenceVenkateshMethod, neither on this subject. Overlap report: no pull request changes this
  roadmap, no dropped id, no revision-only id, no second copy. `roadmaps resolve`: nothing missing.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main; the open lists were read in round 8 and are unchanged; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness and the auxiliary varifold of an integral current: owner GeometricCurrents G6 (cited, compared in 1.2 and 9.3); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity for minimal immersions: owner MinimalSurfaces (not restated); the coordinate Grassmannian: Tau Ceti at the pin (cited); the general varifold carrier and its theory: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

### Headlines and Lean form

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds
(7.4, 7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient
(5.2); comparison with GeometricCurrents G6 (9.3). There is no `Suggested.lean` at this stage, so
the padding probe, the `#check` comparison and the import header do not apply.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at every locator of the sample table and at
Simon1983 line 7986–8151. Shared runs are formulas and standard names; the longest shared prose is
the four conditions of 7.3's route against Simon1983 line 7785–7787, a list the mathematics forces
(at most four consecutive words). Arrangement: Simon1983's Chapter 8 runs §38–§42; the README
splits §38 over 1.1–1.3 and 3.3, takes Layer 2 from §11 and §15 and now §3, merges §40–§41 with
§17–§19 in Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7 and 8, and adds Layers 5 and 9,
4.5 and 6.2: no one-to-one run. The order first variation → monotonicity → tangents →
rectifiability is forced (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 7.1–7.2, 6.4). Reuse: no
table, figure or exercise list taken over.

Source independence: 16 passages compared with 5 sources (Simon1983, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 84 of 134 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983: the displayed conclusion of 3.5 (line 775–776), 42.1 (line 7735), displays (7), (8) of
  the proof of 42.8 (line 7975–7978), the displayed hypotheses of 42.9 (line 7992–8000) and the
  selection of centres in its proof (line 8119–8123) are lost in the extracted text. That the new
  centres are chosen among the fibre points, on which 7.5's "bound off Z over every x" rests, was
  checked by the argument (disjoint slabs of clustered points fit in one larger slab about a member),
  not against the lost display.
- 7.5 for h ≠ e: no source states it; the README marks it as its own with a route.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Gap** in Simon1983 at proof of 42.8, printed page 249–250: the source says L¹ convergence of the truncated fibre multiplicities follows from convergence as measures and the bound of 42.9 off small sets; it should be also using that the mass over the exceptional sets tends to zero; affects the proof.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and an integer above the limit converges to the limit; it should be the minimum; affects the proof.
- **Error** in Simon1983 at proof of 42.9, printed page 252: the source says the projection of the whole set where a ratio bound fails is the small exceptional set; it should be the projection of its part of positive upper density (dense small discs fail everywhere); affects the proof.
- **Gap** in Simon1983 at Remark 42.10, printed page 250: the source says the estimate for a fixed number of fibre points bounds that number a priori; it should be first showing density at least 1 at those points; affects the proof.
- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected submanifold M is a constant multiple of M in U; it should be requiring M ∩ U connected; affects a stated result.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml`; I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9f02e3f13381d5b28197a4af51ddb4774eef56a7", "job": "REV-DESIGN-Varifolds~9", "model": "fable", "worker": "chris-x80"} -->
