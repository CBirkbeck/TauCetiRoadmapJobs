<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6902533883 -->
Review (claude) of 2ddaa7d

Verdict: accepted

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The single finding of REV-DESIGN-Varifolds~13 is repaired, the repaired passage passes
the adversarial pass, and nothing else in the design needs a change. No gap is declared and none is
needed. No maintainer notes were supplied. I edited no file of the design and no manifest entry, and
fetched no source: all eight cited works are in `packages/Varifolds/sources.toml`. There is no
`Suggested.lean` at the design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~13), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (P3): 7.3's route took ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k "from the weight's form" alone | `packages/Varifolds/design/README.md:1498–1500`: "since ρ^{−k}‖C‖(B_ρ(y)) is non-decreasing in ρ (6.1, C stationary in all of T_xM) and, because B_ρ(y) ⊆ B_{ρ+\|y\|}(0), at most Θ(x)ω_k(1 + \|y\|/ρ)^k, which tends to Θ(x)ω_k as ρ → ∞" | **Repaired.** Crossing lines at 45°, y = (1, 0): ratio 2 for ρ ≤ 1/√2, then 2 + 2√(1 − 1/(2ρ²)) ↑ 4 = Θω_1; weight-form bound at ρ = 1 is 8 ≥ 2 + √2. 6.1 admits every ρ because W = T_xM has empty complement. 7.3's *Needs:* line lists 6.1 and 7.2. |

The repaired pattern elsewhere (a ball bound about a point other than the centre of a known mass
ratio): 7.2's route works at 0 only; 7.5's bound ‖V‖(B_ρ(y)) ≤ CΛρ^k cites the monotonicity of
6.1–6.2; 8.1 uses P_{S^⊥}(y) = 0 from 7.2 at 0. No other occurrence. No finding of the repair report
was marked not actionable.

### Adversarial table (values computed this round)

The seeded sample, the headline theorems, the changed passage, and the sections the earlier round
summarised without values (1.1, 2.2, 3.2, 4.1–4.3, 5.1, 7.1, 7.5).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 (sample) image-plane formula | Q = L∘P, A = Q*Q + 1 − P; L = P = diag(1, 0); L kills range P | on range P, ⟨Q*Qv, v⟩ = \|Lv\|²; A = 1, QA⁻¹Q* = diag(1, 0); A singular, pair outside the open set | sound |
| 1.1 isometry and comparison laws | U : ℝ → ℝ² inclusion, k = 1 and k = 0; e replaced by O∘e | U1U* = diag(1, 0), misses diag(0, 1); k = 0 both {0}; e⁻¹O⁻¹P_S Oe = e⁻¹P_{O⁻¹S}e; rotation φ sends ℓ_θ to ℓ_{θ−φ} | sound |
| 1.2 (sample) | h = diag(1, 4), u = (1, 1); h = 4g; k = 0, N | h(e_1, u)/h(u, u) = 1/5 against 1/2; same projections; fibres {0}, {1} | sound |
| 2.2 | v((0, 1) × {0}, 1) at an endpoint; k = 0; two crossing lines | ρ/(2ρ) = ½ at a point off Γ, so vanishing is a.e. only; Σθ(x)δ_{(x,0)}; crossing point H¹-null | sound |
| 2.3 (sample) | graph of \|t\|^{3/2}; open half-line | u'² = (9/4)\|t\|; 2·(8/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 ≈ 2.879 > 2√2 ≈ 2.828; support [0, ∞) × {0} ≠ Σ | sound |
| 3.1 (sample) | f(t) = t² on [−1, 1]; f(y) = (y_1, 0) on a vertical segment; f : ℝ² → ℝ, k = 2; Σ_j v({j} × [0, 1]) under (0, y_2) | ∫φ(t²)\|2t\|dt = 2∫_0^1φ; J = 0, f_#V = 0; G_2(ℝ) = ∅, wrong model has mass ∫2√(1 − t²) = π; mass ∞ on a compact set | sound |
| 3.2 | η_{0,μ}∘η_{x,λ}; segment [0, 1]; great circle on S² | (λμ)⁻¹(y − x); mass λ⁻¹; λ⁻¹·2λρ = 2ρ for λρ < π | sound |
| 4.1 | circle with X = ψy; vertical lift with X = ψy_2e_2; X = ψy_2²e_1 on the axis | div_T X = 1, δ[C](X) = 2π = d/dt 2πe^t; div_S X = ψ + y_2∂_2ψ = ψ on the axis; DX = e_1 ⊗ (y_2²Dψ + 2ψy_2e_2) = 0 on L | sound |
| 4.2 (sample) | L(X) = ⟨X(0), v⟩, v = 2e_1 and v = 0; L(X) = ∫(X¹ + X²) | 2δ_0, η = e_1; ‖L‖ = 0, η undetermined; sup = √2 vol(U) with ψ = χ(1, 1)/√2, sup-norm model gives 2 vol(U) | sound |
| 4.2 route | scalar functionals ϕ ↦ L(ϕe_i) | \|L(ϕe_i)\| ≤ ∫\|ϕ\|d‖L‖, so both parts ≤ ‖L‖; \|∫⟨η, ψ⟩d‖L‖\| ≤ ∫\|ψ\|d‖L‖ gives \|η\| ≤ 1 | sound |
| 4.3 | X_n = n⁻¹ψ sin(ny_2)e_2 on the vertical lift; extension to continuous fields supported in K | div_S X_n = ψ on the axis, sup\|X_n\| ≤ 1/n; {X ≠ 0} open inside K, so the same bound | sound |
| 4.4 (headline, sample) | half hyperplane; θ = 1 + y_1²; dilation; rotation by π/2 | ∫_Σ∂_1X¹ = −∫X¹dH^{N−2}, η = −e_1; H = (θ'/θ)e_1; div_S(Y∘η) = λ⁻¹(div_S Y)∘η, so δV_{x,λ}(Y) = λ^{1−k}δV(Y∘η) and H'∘η = λH; −e_2 = R(−e_1) | sound |
| 4.5 (sample) | h = c²g; g = e^{4t}dt², h = 4g, X = (1 − t²)²; Γ_h − Γ_g | V^h = c^kV, left side \|c^k − 1\|\|δ_gV(X)\|; Γ = 2, δ_gV = 2, δ_hV^h = 4, sup\|X'\| = 8/(3√3) ≈ 1.54 < 2, ‖h − g‖_{C⁰} = 3e⁴; h⁻¹D(h − g) + (h⁻¹ − g⁻¹)Dg, bounded with \|Dg\| only | sound |
| 4.5 blow-up form | pull-back of g by y ↦ λy; first variation for λ⁻²g | λ²g̃(λy), so λ⁻²g ↦ g̃_λ; δ(λ^{−k}V) with \|X\|_h = λ⁻¹\|X\|_g gives λ^{1−k}‖δV‖ | sound |
| 5.1 (sample) | S^k with X = ψx; graph of \|t\|^{5/2} with X = φ(y_1)e_2 | kHᵏ(S^k) both sides; u'' = (15/4)\|t\|^{1/2}; ∫φ'u'(1 + u'²)^{−1/2}dt = −∫φu''(1 + u'²)^{−3/2}dt = −∫⟨tr B, X⟩dH¹ | sound |
| 5.2 (headline) | tangent Y extended to X with X^⊤ = Y; great S^k ⊆ S^N; U with W closed in U | ⟨X, tr_S B_M⟩ = 0, so ‖δV‖ ≤ ‖δ(ι_#V)‖; tr_{TΣ}B = −kx; U = O ∩ O' with M = O ∩ closure(M) | sound |
| 6.1 (headline, sample) | derivation with I, J; circle σ < 1 < ρ; line y_2 = a | δV(X_ρ) = kI − ρI' + ρJ', so (ρ^{−k}I)' = ρ^{−k}J' − ρ^{−k−1}δV(X_ρ); 2π/ρ = 2π − 2π(1 − 1/ρ); 2T/ρ both sides, T = √(ρ² − a²) | sound |
| 6.1 exponential and weighted forms | f' ≥ J-term − Λf; X = φh(y − x) | (e^{Λt}f)' ≥ e^{Λt}t^{−k}dJ ≥ t^{−k}dJ; extra term +∫φ(y − x)·P_S∇h, sign of δV negative | sound |
| 6.2 (headline, sample) | c(r) = √κ r cot(√κ r); x = π/2; κ = 0; great circle on S² | ∇(r∇r) ≥ c·g since c ≤ 1; (t^{−k}I)' ≥ −t^{−k}(‖δV‖(B̄_t) + (2/π)k√κ‖V‖(B̄_t)), stronger than stated; (1 − x cot x)/x = 2/π; ratio 2 constant | sound |
| 6.3 (headline) | triple junction; step multiplicity; segment [−a, a] with U = B_a(0) | 3ρ/(2ρ) = 3/2; δV(X) = X(0) − 2X(0), σ = δ_0, η = −e_1, Θ(0) = 3/2 < 2; 2a < 4a at ρ = 2a | sound |
| 6.4 (headline) | f∇f; g = e^{2t}dt²; atom on a line | div_S(f∇f) = \|P_S∇f\|² on {f = 0}; θ̃ = 1, (θ̃w)' = e^t; δV'(ψy_1e_1) = 1 | sound |
| 6.5 (sample) | X = ψγ(r)(y − ξ); K = ∅; circle with K = {0}; Dirac varifold | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; two disjoint balls give spt = ∅; H = −y ≠ 0 so the hypothesis fails; stationary off {0}, not rectifiable | sound |
| 7.1 (sample) | i segments of length 1/(2i); ½v(L, 1); g_i = (1 + 1/i)²e | weights → ½H¹, ‖δV_i‖ = 2i → ∞; density ½ persists; weight (1 + 1/i)H¹⌞L, Θ_{g_i} = 1, limit Θ = 1 | sound |
| 7.2 (headline) | ball masses; X = h(y)y; density 1 + ½ sin(log r)cos ϑ | ‖C‖(B_ρ) ≤ Θω_kρ^k ≤ ‖C‖(B̄_ρ) for all ρ; div_S X = kh + y·∇h; μ(B_ρ) = 2πρ, λ⁻¹∫cos ϑ dμ = (π/4)(sin log λ − cos log λ): −π/4 at 1, π/4 at e^π | sound |
| 7.3 (headline, changed) | crossing lines; triple junction at y = (1, 0); support in a k-plane | 4ρ ≥ 2ρ + 2√(ρ² − ½); ratio 1 + √(4 − 3/ρ²) ↑ 3, but Θ(y) = 1 < 3/2 so the route's hypothesis fails there; z − y ∈ S for all y in the support and 0 in the support give spt ⊆ S | sound |
| 7.4, 7.6 (headlines) | alternating lines; zigzag i = 2; a = (1 + δ)θ + 2δ | no limit of the full sequence; atoms √2, total √2 + 2; ∫\|ψ' − θ\| ≤ 2(δθ + 2δ)ω_k + δ, and 3/2 + 3.5δ < 2 for δ < 1/7 | sound |
| 7.5 | m planes; disc of radius r; dense small discs; parameter count | m ≤ (1 + δ)m + δ, n_0 ≥ m(3/2)^k; ratio ≥ 2ρ/(πρ²/2) = 4/(πρ) > ε; intervals of total length < ε²/π < ½, ratio ≥ 2/sup r_j > ε, p(Z) ≤ Σπr_j² < ε²; cε⁻¹·2ε² = 2cε against 2c | sound |
| 8.1, 8.2 (headlines) | ½v(L, 1); step multiplicity; integral V | hypothesis fails, cone still rectifiable; ρ⁰‖δV‖({0}) = 1 ↛ 0; ‖V‖({Θ < 1}) = 0, so 8.1 applies | sound |
| 9.1 (sample) | v(L_1, 1) + v(L_2, 2), x ∈ L_1; \|t\|^{3/2}; k = 0 | B_2(x) no submanifold, B_{1/2}(x) gives θ_0 = 1; u'' unbounded so 0 ∈ reg¹ ∖ reg²; a single point, statement trivially true | sound |
| 9.2 (sample) | dilation; isometry and exp | ‖V_{x,λ}‖(B_ρ(η(y))) = λ^{−k}‖V‖(B_{λρ}(y)), same density; f∘exp_x = exp_{f(x)}∘df_x gives (f_#V)_{f(x),λ} = (df_x)_#V_{x,λ} | sound |
| 9.3 (headline, sample) | [[P]] − [[P]]; 2[[P]] and reversed | θ_T = 0, Γ_T⁺ = ∅, varifold 0, while v(P, 1) + v(P, 1) = v(P, 2); v(P, 2) both | sound |

Layers 3.3, 6.4's full route, 7.6 and 9.4 are unchanged since REV-DESIGN-Varifolds~13, whose rows
for them carry computed values; I reread them and the rows above record what I recomputed.

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1, 1.2 | Simon1983 line 7295–7305 | subspaces with the projection metric, product with the base, compactness over compacts. Match. |
| 2.2 (not in the sample) | Simon1983 line 774–788, 632–640 | 3.5 for a Borel regular measure and a set of finite measure; 3.3 the covering statement. Match. |
| 2.3 | Simon1983 line 2861–2867, 1855–1859; EdelenSpolaor2023 line 130–131 | weight of a rectifiable varifold; area of a C¹ graph; "multiplicity-one". Match. |
| 3.1 | Simon1983 line 7443–7454 | 39.1 with J_S f and the set where it is nonzero, f proper on the support. Match. |
| 4.2 | Simon1983 line 857–882 | 4.1 with the local bound and \|ν\| = 1; 4.2 the open-set formula. Match. |
| 4.4 | Simon1983 line 7486–7509 | 39.3–39.4, Z the set of infinite derivative, the four names. Match. |
| 4.5 | AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1788–1810 | the proof of Theorem 2.32 asserts preservation under a chart without argument, as the README says. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2), 16.6(1). Match. |
| 6.1 | Simon1983 line 7513–7547 | 40.1–40.4. Match (40.4's sign: Not verifiable). |
| 6.2 | Scharrer2022 line 823–854, 1120–1127, 1184–1203 | Lemma 2.7 (K ≤ b, U inside the ball of radius π/√b), Lemma 3.3, Remark 3.4 with c(π/2) = 2/π for t < π/(2√b). Match. |
| 6.5 | Simon1983 line 3371–3400 | 19.1–19.2, rectifiable case, same test field. Match. |
| 7.1 | Simon1983 line 7566–7600 | 40.6 with the exceptional sets B_i and the lim inf bound; 40.7(1); the sets A_{ij} of the proof. Match. |
| 9.1 | AgnolettoCorreaHoyosDaSilvaNardulli2025 line 89–92; Simon2023 line 73–83 | Definition 1.2 (C¹); reg and sing for smooth hypersurfaces and the convention reg M = M. Match. |
| 9.2 | Simon1983 line 7443–7454 | cited for the push-forward only; the statements are the README's own. |
| 9.3 | Simon1983 line 7253–7293 | the varifold associated with an integer multiplicity current. Match; the comparison is the README's own. |

### Pins, duplication, suppliers, direction

- Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `plan.json`'s
  baseline and to the pins of REV-DESIGN-Varifolds~13, whose list of 73 resolved names therefore
  stands. Opened again this round: `TauCeti.finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean:52`,
  arguments 𝕜, r, N: subspaces of `Fin N → 𝕜` of finrank r, no separation or metric in the type),
  `toEuclidean` and `continuous_starProjection_toEuclidean` (`…/Tautological.lean:73`, `:110`),
  `Distribution.HasLocallyFiniteMass` (`TauCeti/Analysis/Distribution/Mass/Basic.lean:353`: a bound
  `‖f φ‖ ≤ C‖φ‖` on tests supported in each compact subset), `Distribution.massMeasure`,
  `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure` (`…/Mass/Measure.lean:191`, `:213`,
  `:306`; the measure is 0 by convention without locally finite mass, and no polar density is given),
  `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`…/Isometry/Exponential.lean:117`: boundaryless
  models, Hausdorff, every tangent vector, junk value off the domain),
  `mfderiv_leviCivitaConnection_mpullback` (`…/Isometry/LeviCivita.lean:130`),
  `restrictOpenTangentSpace` (`…/Riemannian/Restriction.lean:68`), both `integral_divergence_eq_zero`
  (`…/DivergenceTheorem/CompactSupport.lean:30`, `…/Riemannian/DivergenceTheorem.lean:225`),
  `eq_riemannianVolume_iff` (`…/VolumeDensity/Volume.lean:93`),
  `isCompleteVectorField_of_isCompact_of_eq_zero_off` (`…/Flow/Complete.lean:144`),
  `isCompact_closure_of_isTightMeasureSet_of_mass_le` (`TauCeti/MeasureTheory/Measure/Prokhorov.lean:52`),
  `CountablyRectifiable` (`…/Rectifiable/Basic.lean:44`),
  `integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (`…/RieszMarkovKakutani/Signed.lean:262`);
  Mathlib `Vitali.exists_disjoint_subfamily_covering_enlargement` (`Mathlib/MeasureTheory/Covering/Vitali.lean:62`,
  conclusion `δ a ≤ τ * δ b` for any τ > 1), `ContMDiff.mpullback_vectorField`
  (`Mathlib/Geometry/Manifold/VectorField/Pullback.lean:608`, `m + 1 ≤ n`), `LinearMap.normDet_comp`
  (`…/NormDet.lean:324`), `Measure.setLIntegral_rnDeriv_le` (`…/Decomposition/RadonNikodym.lean:319`),
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` (`…/Covering/Besicovitch.lean:1088`),
  `Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean:479`),
  `Measure.ext_of_integral_eq_on_compactlySupported` (`…/RieszMarkovKakutani/Real.lean:408`),
  `Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:68`),
  `leviCivitaConnection` (`…/CovariantDerivative/LeviCivita.lean:360`), `Measure.condKernel`
  (`…/Disintegration/StandardBorel.lean:361`, finite measures).
- Duplication by object: a grep of both pinned libraries for "varifold" finds nothing.
  `roadmaps grep` for varifold, Allard and Grassmann bundle over the open heads and main finds text
  on main only (GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces).
- Suppliers resolved on main (same head as the earlier round): GeometricCurrents G1
  (`TauCetiRoadmap/GeometricCurrents/README.md:137`), G2 (240), G5 (583), G6 (668–689: the
  orientation-quotient Grassmann bundle, compactness over compact base regions, Radon compactness,
  the auxiliary rectifiable varifold, weak first variation under ambient flows, stationarity of local
  minimizers, density, monotonicity with Riemannian error bounds, tangent cones);
  GeometricMeasureTheory G2 (`…/GeometricMeasureTheory/README.md:148`); RiemannianGeometry R4 item 1
  (`…/RiemannianGeometry/README.md:2311–2320`), R5a, R5a.2, R5b; HopfRinow under `Completed/`,
  Layers 0, 1, 2, 4 (229, 264, 427, 495). Every cited section exists and states what it is cited for.
- Overlap report: no pull request changes this roadmap, no dropped id, no revision-only id, no
  second copy (no Varifolds folder on main). `roadmaps resolve` lists nothing missing. The board
  index lists AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject. No roadmap
  cites this one. Ownership against the open pull requests was checked through `roadmaps grep` over
  their heads.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry/MinimalSurfaces (main; of the open list — ManifoldOptimization, LorentzianGeometry, QuasiregularMaps, PointProcesses, RealSemisimpleLieGroups — none has varifold, Grassmann-bundle-measure or monotonicity text; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness, and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited in 1.2, 1.4 and 9.3; MinimalSurfaces line 86 names G6 for that object); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity and smooth Allard regularity for minimal immersions: owner MinimalSurfaces 3.1 and 5.5 (not restated); the varifold carrier and the theory for arbitrary varifolds: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 239 roadmaps, 2252 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. I read every *Needs:* line: each
names targets of earlier layers, pinned declarations, or sections of the four suppliers above.

### Principles, shape, plan, headlines

Read all 1948 lines of the README, `plan.json` (by script: 9 layers, 34 targets, each with a locator
and at least three tests, `gaps` empty) and the manifest (8 entries, every cited work recorded, no
machine path). No route-specific narrowing, no re-planned roadmap, no algorithm, no Lean file. Shape:
Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine
layers each ending with `### Examples` and `### Dependencies`, 34 sections each with a *Needs:* line
and a Checks block (34 of each, counted), Downstream consumers, References. Grep for LaTeX delimiters,
pull-request numbers, machine paths, HTML anchors, "optional", "deferred", round labels and process
words: none. No backticked name is presented as this roadmap's own.

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds (7.4,
7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient (5.2);
comparison with GeometricCurrents G6 (9.3). Each has hypotheses and a locator. The padding probe, the
`#check` comparison and the import header do not apply before there is a Lean file.

Remarks that need no change. The Summary's mention of Chapter 8 of Simon's lectures describes the
generality (arbitrary Radon measures on the Grassmann bundle), not the organisation. 6.3's
lower-bound bullet assumes V rectifiable, which its conclusion does not use. 9.1's last bullet rests
on 6.4, stated for k ≥ 1; the Conventions restrict k ≥ 1 from Layer 6 on, and for k = 0 the bullet is
trivially true.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at the 23 passages of the table above (15 in
Simon1983, 3 in Scharrer2022, 3 in AgnolettoCorreaHoyosDaSilvaNardulli2025, 1 each in Simon2023 and
EdelenSpolaor2023). Shared runs are formulas and fixed names. The closest are 4.2's hypothesis
against Simon1983 line 868–869 (a formula) and 6.5's route against Simon1983 line 3385–3390 (the same
test field, with the conditions on γ worded differently). Arrangement: Simon1983's Chapter 8 runs
§38–§42. The README spreads §38 over 1.1–1.3 and 3.3, puts 39.1 in Layer 3 before the first variation
of Layer 4, builds Layer 2 from §3, §11, §15, merges §40–§41 with §17–§19 and Scharrer's formula in
Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7 and 8, and adds 4.5, Layer 5 and Layer 9: no
one-to-one run. The order first variation → monotonicity → tangents → rectifiability is forced (6.1
needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 6.4, 7.1–7.2). Reuse: no table, figure or exercise list
is taken over.

Source independence: 23 passages compared with 5 sources (Simon1983, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 84 of 134 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 40.4 (line 7543–7547): the extraction shows the first-variation term in the bracket with
  a plus sign, where my computation and Simon1983's own 18.1 pattern give a minus; a slip of the
  extraction and a misprint of the source cannot be told apart from this text. The README's sign is
  the computed one, and its circle Check (6.1) pins it.
- Simon1983: the displays of 3.5 (line 775–776), 38.1, 40.1 (line 7517), 40.6's density hypothesis
  (line 7569–7571) and 41.1's conclusion (line 7668) are lost in the extraction; I matched the
  statements through the surrounding prose and the proofs.
- 7.5 for h ≠ e, 4.4's isometry law, 4.5, 5.2's general formula, 6.5 for non-rectifiable V and 7.2's
  dilation-invariance step on M: no source states them; the README marks them as its own, with
  routes. I recomputed 4.4, 4.5, 5.2, 6.5 and 7.2 above. For 7.5 with h ≠ e I checked the error
  accounting (Cε²ρ(1 + ρ/τ) against ρ^{−k−1}, integrating to Cε²σ(1 + σ/τ) ≤ 2Cεσ/τ) and not the
  full induction of step (iii).
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold with support in a connected C² submanifold M is a constant multiple of M in U; it should be asking that M ∩ U be connected, since two arcs of one curve in U can carry different multiplicities; affects a stated result.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (a file on the ANU mathematics site); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ddaa7d0219592724320d37163ccff94da3151b3", "job": "REV-DESIGN-Varifolds~14", "model": "fable", "worker": "chris-x79"} -->
