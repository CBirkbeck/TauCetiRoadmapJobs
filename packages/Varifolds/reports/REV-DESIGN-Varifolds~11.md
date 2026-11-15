<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6900765887 -->
Review (claude) of 00d470a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 3.1 defines the push-forward into a target whose dimension may be below k

   **Location.** `packages/Varifolds/design/README.md:674–676`: "Let W ⊆ M, W' ⊆ M' be open subsets
   of Riemannian manifolds, V a varifold on W and f : W → W' a C¹ map … Define f_#V(A) = …";
   `packages/Varifolds/design/plan.json` 3.1 (hypotheses "f C^1", "f proper on spt||V||").

   **Claim.** f_#V is a k-varifold on W' for every such f.

   **Witness.** M = ℝ², k = 2, M' = ℝ, f(y) = y_1, V the area of the unit disc: 1.1 defines G(E, k)
   only for 0 ≤ k ≤ dim E, so G_2(ℝ), the space f_#V should live on, is not defined.

   **Exact repair.** In 3.1 (README and `plan.json`) add after the definition: "If dim M' < k, no
   df_x is injective on a k-plane, J_S f ≡ 0, G_k(W') is empty and f_#V = 0." Tested on the witness:
   `normDet(df|_S : ℝ² → ℝ) = 0` for S = ℝ², so the integrand vanishes identically and f_#V = 0, the
   zero measure on the empty space; for dim M' ≥ k nothing changes.

2. **F02** (P3) 9.1's constant-multiplicity bullet does not say which neighbourhoods it means

   **Location.** `packages/Varifolds/design/README.md:1763–1764`: "If V is stationary and x ∈ reg^2 V,
   then on a neighbourhood U of x with spt‖V‖ ∩ U connected, V⌞U = θ_0 [spt‖V‖ ∩ U] for a constant
   θ_0 > 0 (6.4)".

   **Claim.** Read with "every such U", the bullet is false; only the reading "some U" is meant
   (`plan.json` 9.1: "a constant multiple of [spt] near points of reg^2").

   **Witness.** V = v(L_1, 1) + v(L_2, 2), two lines of ℝ² crossing at 0, x ∈ L_1 ∖ {0}, U a ball
   about x containing 0: spt‖V‖ ∩ U is connected, not a submanifold, and the multiplicity is 1 and 2.

   **Exact repair.** Replace by: "If V is stationary and x ∈ reg^2 V, then for every open U ∋ x such
   that spt‖V‖ ∩ U is a connected C² embedded k-submanifold of U (such U exist), V⌞U =
   θ_0 [spt‖V‖ ∩ U] for a constant θ_0 > 0 (6.4)". Tested on the witness: the ball containing 0 is
   excluded (the cross is not a submanifold); a ball about x missing L_2 gives V⌞U = 1·[L_1 ∩ U].

Two findings, both P3, each with an exact repair for a fix round; no P1 or P2. Both findings of
REV-DESIGN-Varifolds~10 are repaired. No gap is declared and none is needed. No maintainer notes
were supplied. No file of the design and no manifest entry was edited; no source was fetched (all
eight cited works are in `packages/Varifolds/sources.toml`). There is no `Suggested.lean` at the
design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~10), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (P3; 4.1's locality hypothesis collapsed to disjoint supports) | README 827–830: "δV(X) depends only on ∇X along spt‖V‖: δV(X) = 0 when ∇X(x) = 0 for every x ∈ spt‖V‖, in particular when spt X ∩ spt‖V‖ = ∅"; new Check 854–857 | **Repaired**, in a stronger form than requested, and true: W ∖ spt‖V‖ is open and ‖V‖-null (second countable), so V(G_k(W ∖ spt‖V‖)) = 0 and the integrand tr(P_S ∘ ∇X(x)) is 0 on G_k(spt‖V‖). Check recomputed: X = ψ y_2² e_1 has DX = e_1 ⊗ (y_2² Dψ + 2ψ y_2 e_2) = 0 on {y_2 = 0}. `plan.json` 4.1 has the same law and a test for it. |
| F02 (P3; Dependencies of Layers 6, 7 named Layer 5) | README 1381: "Layers 1–4; RiemannianGeometry R4 item 1; …"; 1691: "Layers 1–4 and 6; …"; also 1779 ("Every notion of Layers 1–4, 6 and 7 and of 9.1"), 1803, 1882 ("Layers 1–4 and 6–8") | **Repaired.** Computed by script from the *Needs:* lines: Layer 6 names {1, 2, 3, 4}, Layer 7 {1, 2, 3, 4, 6}, Layer 8 {4, 6, 7}, Layer 9 {1, 2, 3, 4, 6, 7, 8}, Layer 5 {2, 3, 4}; each Dependencies line names exactly that set. |

The repaired patterns elsewhere: no other locality clause with an open-set hypothesis (4.3's
"depends only on X restricted to spt‖V‖" is for locally bounded first variation, where
spt‖δV‖ ⊆ spt‖V‖ makes it true, and 4.1's vertical-lift Check shows why it needs that); every
Dependencies line equals the transitive set its *Needs:* lines give (table above; Layer 4 reaches
Layer 2 through 3.1). No finding of the repair report was marked not actionable.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 4.1 one-jet locality (changed) | V = 0; v(L, 1) with X = ψ y_2² e_1; vertical lift with X = ψ y_2 e_2 | 0 = 0; DX = 0 on L and div_L X = ∂_1(ψ y_2²) = 0; ∇X = ψ e_2 ⊗ e_2 ≠ 0 on L, δV(X) = ∫ψ(t, 0)dt ≠ 0 (law does not apply) | sound |
| 4.1 first variation (sample) | circle, X = ψy | div_T X = 1, δ[C](X) = 2π = d/dt(2πe^t) at 0 | sound |
| 9.2 scope (changed) | notions listed against their layers | weight … convergence (1), rectifiability, tangent spaces, fibre measures (2–3), δV … (4), densities (6), VarTan (7), reg^r (9.1); none from 5 or 8 | sound |
| 9.2 dilations | (V_{x,λ})_{η(y),μ} | = V_{y,λμ} by 3.2's composition law, so VarTan and Θ agree | sound |
| 1.1 (sample) | lines ℓ_θ of ℝ²; U : ℝ → ℝ²; A = Q*Q + 1 − P | P_θ − P_0 = sin θ·[[−sin θ, cos θ], [cos θ, sin θ]], a symmetric matrix of square 1: norm \|sin θ\|; U 1 U* = diag(1, 0); Q A⁻¹ Q* is the projection onto L(range P) since Q* maps into range P | sound |
| 1.2 | h = diag(1, 4), u = (1, 1) | h(e_1, u)/h(u, u) = 1/5 against 1/2 | sound |
| 1.3 (sample) | horizontal and vertical lifts of H¹⌞axis; unit disc | ∫χ tr(P diag(1, 0)) = ∫χ dH¹ against 0; mass 2 | sound |
| 2.2 (sample) | v((0, 1) × {0}, 1) at an endpoint; k = 0 | ρ/(2ρ) = ½ at an H¹-null point; counting measure on a countable set | sound |
| 3.1 (sample) | f(t) = t² on [−1, 1]; f(y) = (y_1, 0) on a vertical segment; dim M' < k | ∫φ(t²)\|2t\|dt = 2∫_0^1 φ; J = 0, f_#V = 0; G_k(W') undefined | sound for dim M' ≥ k; R01 |
| 3.3 (sample) | ‖V‖ = \|y_1\|H¹⌞L + \|y\|⁻¹ Lebesgue | ‖V‖(B_r(0)) = r² + 2πr, Θ¹(0) = π; (‖V‖⌞D)(B̄_{3r}) = 9r² = 9·r² > (3 + 1)·r² | sound: density points are needed |
| 3.3 Vitali family | `Vitali.vitaliFamily` at the pin | hypothesis is for every point of the space, so the space is D' with ‖V‖⌞D': ratio → 3^k < 3^k + 1 at each x ∈ D' | route owned at the pin |
| 4.2 (sample) | L(X) = ⟨X(0), 2e_1⟩; L(X) = ∫(X¹ + X²) | 2δ_0, η = e_1; sup = √2 vol(U) with ψ = χ(1, 1)/√2, sup norm would give 2 vol(U) | sound |
| 4.4 (headline, sample) | half hyperplane; v(L, 1 + y_1²); dilation | ∫_Σ ∂_1X¹ = −∫X¹ dH^{N−2}, η = −e_1; H = (θ'/θ)e_1; D(Y ∘ η) = λ⁻¹DY ∘ η gives δV_{x,λ}(Y) = λ^{1−k}δV(Y ∘ η), H'(ηy) = λH(y) | sound |
| 4.5 blow-up | φ = λ⁻¹exp_x⁻¹ | φ^*g̃_λ = λ⁻²g; ‖δ‖ scales by c^{k−1} = λ^{1−k} for c = λ⁻¹ | sound |
| 5.1 (sample) | graph of \|t\|^{5/2}, X = φχe_2; S^k | τ_1τ_2 √(1 + u'²) = u'(1 + u'²)^{−1/2}; by parts −∫φu''(1 + u'²)^{−3/2} = −∫⟨tr B, X⟩dH¹; k Hᵏ(S^k) both sides | sound |
| 5.2 (headline, sample) | great S^k ⊆ S^N; X tangent to M | H_ι = 0 + (−kx); δ(ι_#V)(X) = δV(X^⊤), so ‖δV‖ ≤ ‖δ(ι_#V)‖ on W | sound |
| 6.1 (headline) | line y_2 = a; circle; exponential form | 2√(ρ² − a²)/ρ both sides ([t/√(t² + a²)]); 2π/ρ = 2π − 2π(1 − 1/ρ); d(e^{Λt}f) ≥ e^{Λt}dE ≥ dE | sound |
| 6.2 (headline) | x = π/2; great circle | (1 − x cot x)/x = 2/π; ratio 2ρ/ρ constant | sound |
| 6.3 | θ = e^{−1/\|t\|} | ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}; ‖V‖(B_{2r})/‖V‖(B_r) ≥ (2r)⁻¹e^{1/(3r)} | sound |
| 6.4 (headline) | Σ a plane minus a point (k ≥ 2); two parallel lines | θ_0[Σ] has support ⊄ Σ, so V = 0; connectedness needed | sound |
| 7.1 (sample) | i segments of length 1/(2i); g_i = (1 + 1/i)²e | ‖δV_i‖ = 2i → ∞, limit density ½; weights (1 + 1/i)H¹ → H¹ | sound |
| 7.1 convention | canonical homeomorphism (no Jacobian) against 4.5's V^h | they differ by J^{g_i→g} → 1 uniformly on compact sets: same limits | consistent |
| 7.2 (headline, sample) | density 1 + ½ sin(log r)cos ϑ; route | μ(B_ρ) = 2πρ; (π/4)(sin log λ − cos log λ) = −π/4 at 1, π/4 at e^π; error term λ·(λ^{−k}‖V‖(B_{λR})) → 0 | sound; only the weight is claimed dilation invariant, as the source says |
| 7.3 (headline) | Lebesgue with a constant line; vertical lift | Θ¹ = 0, stationary, not rectifiable; positive density, δV unbounded | hypotheses both needed |
| 7.4 (headline) | zigzag, i = 2 | co-normals (1, 1)/√2 + (−1, 1)/√2 = (0, √2); total √2 + 2 | sound |
| 7.6 (headline) | constant sequence ½v(L, 1) | limit not integral; hypothesis needed | sound |
| 8.1 | step multiplicity, k = 1 | ρ⁰·‖δV‖({0}) = 1 ↛ 0 | sound |
| 8.2 (headline, sample) | integral stationary V; x ∉ spt‖V‖; blow-up sequence | hypotheses of 7.2 hold everywhere; VarTan = {0}; ‖δṼ_λ‖(B_R) = λ^{1−k}‖δV‖(B_{λR}) → 0, D²g̃_λ = λ²D²g̃(λ·) → 0 | sound |
| 9.1 (sample) | graph of \|t\|^{3/2}; v(L_1, 1) + v(L_2, 2) | reg¹ ∖ reg²; multiplicities 1 and 2 on a connected non-submanifold | definitions sound; bullet wording R02 |
| 9.3 (headline, sample) | [[P]] − [[P]]; 2[[P]] | θ_T = 0, Γ_T⁺ = ∅, varifold 0; v(P, 2) | sound |

Rows of REV-DESIGN-Varifolds~8 to ~10 that carry computed values for 1.4, 2.1, 2.3, 3.2, 4.3, 6.5,
7.5 and 9.4 are relied on; their text is unchanged since round 10 (diff of the two heads read:
only 4.1, the three Dependencies lines and 9.2 changed).

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7305 | G(n+k, n) with the metric of the projection matrices, G_n(K) compact. Match (the operator norm is the README's stated choice). |
| 1.3 | Simon1983 line 7308–7317 | varifold, weight, mass, restriction. Match. Allard1972 Section 3 not readable. |
| 2.2 | Simon1983 line 2861–2897, 7318–7326, 774–788; Agnoletto et al. line 166–175 | 15.1–15.5; the varifold of a rectifiable one via M*; 3.5; Definition 2.3. Match. |
| 3.1 | Simon1983 line 7443–7454, 2903–2933; Agnoletto et al. line 188–195 | 39.1 with J_S f and the set {J ≠ 0}; 15.6–15.7; Definition 2.5 (which assumes d < min{d_1, d_2}; see R01). Match. |
| 3.3 | Simon1983 line 7333–7368, 7419–7440 | 38.1–38.4 and the proof of 38.3 through 11.8 and 38.4. Match. |
| 4.1 | Simon1983 line 7455–7473; Agnoletto et al. line 179–187, 210–212; Scharrer2022 line 87–98 | 39.2; Definition 2.4, Proposition 2.6; tangential divergence with Levi-Civita. Match. |
| 4.2 | Simon1983 line 857–882 | 4.1 and Remark 4.2 (open-set formula). Match. Federer1969 2.5 not readable. |
| 4.4 | Simon1983 line 7486–7509; Agnoletto et al. line 269–303 | 39.3–39.4, Z = {D‖δV‖ = ∞}; Proposition 2.10. Match (η is minus the source's ν; the half-hyperplane Check fixes it). |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2), 16.6(1). Match. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7675–7682 | 9.6, 16.4 (rectifiable case, as the README says), 41.2(3). Match; the general formula is the README's own. |
| 7.1 | Simon1983 line 7566–7579 | 40.6 with the exceptional sets. Match. |
| 7.2 | Simon1983 line 7733–7774, 3414–3430 | 42.1–42.3, with the source's remark that full dilation invariance is known only under 42.6's hypothesis; 19.3. Match. |
| 8.2 | Simon1983 line 7793–7805, 7899–7912; EdelenSpolaor2023 line 109–112 | 42.6; 42.8; tangent cone with multiplicity one up to rotation. Match. |
| 9.1 | Agnoletto et al. line 89–92; Simon2023 line 73–83 | Definition 1.2 (C¹); reg M, sing M and the convention reg M = M. Match. |
| 9.3 | Simon1983 line 7253–7293 | the varifold associated with an integer multiplicity current. Match; the comparison statements are the README's own, as it says. |

Also read: Simon1983 line 7664–7684 (41.1–41.2), 7882–7898 (42.7); Simon2023 line 84–96;
EdelenSpolaor2023 line 104–135 (9.4's statements match, n > 7 as in Remark 1.2).

### Pins, duplication, suppliers, direction

- Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the pins of round 10). All
  73 backticked library names of the README were resolved by script at the pins and the doubtful
  ones opened: `ContMDiff.mpullback_vectorField`
  (`Mathlib/Geometry/Manifold/VectorField/Pullback.lean:608`, m + 1 ≤ n),
  `MeasureTheory.Measure.setLIntegral_rnDeriv_le` (`…/Decomposition/RadonNikodym.lean:319`, no
  σ-finiteness), `LipschitzWith.hausdorffMeasure_image_le` (`…/Measure/Hausdorff.lean:745`),
  `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`
  (`…/Measure/Regular.lean:1183`), `Vitali.vitaliFamily` (`…/Covering/Vitali.lean:460`, hypothesis at
  every point), `Besicovitch.ae_tendsto_rnDeriv` and
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` (`…/Covering/Besicovitch.lean:1077`,
  `:1088`), `MeasureTheory.Measure.condKernel` (`…/Disintegration/StandardBorel.lean:361`),
  `LinearMap.normDet_comp` (`…/InnerProductSpace/NormDet.lean:324`); Tau Ceti
  `Distribution.massMeasure`, `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure`
  (`TauCeti/Analysis/Distribution/Mass/Measure.lean:191`, `:213`, `:306`; n : ℕ∞, finite-dimensional
  E, regular measure, as the contract says), `Distribution.HasLocallyFiniteMass`
  (`…/Mass/Basic.lean:353`), `TauCeti.CountablyRectifiable` with `mono`, `congr`, `iUnion`, `image`
  (`…/Rectifiable/Basic.lean:44`, `:74`, `:78`, `:122`, `:135`), `TauCeti.RealRMK.posPart`, `negPart`
  (`…/RieszMarkovKakutani/Signed.lean:160`, `:205`),
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`
  (`…/Riemannian/Restriction.lean:130`), `TauCeti.finiteGrassmannian` instances
  (`…/Grassmannian/Orthonormal.lean:225`, `Plucker.lean:89`),
  `TauCeti.Manifold.integral_divergence_eq_zero` (`…/Riemannian/DivergenceTheorem.lean:225`),
  `MeasureTheory.integral_divergence_eq_zero` (`…/DivergenceTheorem/CompactSupport.lean:30`). Each
  is as the supplier contract describes it.
- Duplication by object: no file of the pinned Mathlib or Tau Ceti mentions varifolds; the
  first-variation files of Tau Ceti are about curves and energy. Nothing the roadmap states exists
  at the pins.
- Suppliers on main: the folders of GeometricCurrents, GeometricMeasureTheory and RiemannianGeometry
  are unchanged since the main round 10 resolved against (diff of the two mains: none of their
  files). Reopened: GeometricCurrents G1 (line 137), G2 (240), G5 (583), G6 (668–690, read in full:
  auxiliary varifold of an integral current, Grassmann bundle by orientation quotient, compactness,
  first variation, monotonicity, tangent cones); GeometricMeasureTheory G2 (148); RiemannianGeometry
  R4 item 1 (2311–2320); HopfRinow under `Completed/`, Layers 0–2 (229, 264, 427) and Layer 4 (495).
- Ownership against open work: `roadmaps grep -i` for "varifold", "Allard", "Grassmann bundle",
  "approximate tangent" and "Varifolds" over the open heads and main: "varifold" occurs on main only
  (GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces); "Allard" in MinimalSurfaces 5.5 (the
  smooth ε-regularity statement, proved without varifolds) and JacobianChallenge (unrelated);
  "approximate tangent" also in the open SobolevDifferentialForms (a citation, no ownership). No
  open pull request plans varifolds. The board index lists AnalyticNumberTheory and
  LawrenceVenkateshMethod, neither on this subject. Overlap report: no pull request changes this
  roadmap, no dropped id, no revision-only id, no second copy. `roadmaps resolve`: nothing missing.
  No other roadmap cites this one, so no numbering is owed.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main; of the open list, ManifoldOptimization, LorentzianGeometry, QuasiregularMaps, PointProcesses, RealSemisimpleLieGroups, none contains varifold or Allard text; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness, and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited; identified with this roadmap's objects in 1.2 and 9.3; MinimalSurfaces line 86 cites G6 for it); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); smooth monotonicity and smooth Allard regularity for minimal immersions: owner MinimalSurfaces 3.1 and 5.5 (not restated); the varifold carrier and the theory for arbitrary varifolds: this roadmap.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 244 roadmaps, 2235 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. Every *Needs:* line was read; each
names targets of earlier layers, pinned declarations, or sections of the four suppliers above.

### Principles, shape, plan, headlines

Read all 1921 lines of the README, `plan.json` (by script: 9 layers, 34 targets, every `target:`
prerequisite earlier, every target with a locator and at least 3 tests, `gaps` empty) and the
manifest (8 entries, each cited work recorded, no machine path). No route-specific narrowing, no
re-planned roadmap (the general theory is not G6's, and the scope section says in one clause how it
differs), no algorithm, no Lean file. Shape: Summary, Scope and ownership, Conventions, Exact
supplier contracts, How to read the build, nine layers each with `### Examples` and
`### Dependencies` (34 sections, 34 Checks blocks, each with at least three bullets), Downstream
consumers, References. Grep for LaTeX delimiters, pull-request numbers, machine paths, HTML
anchors, "optional", "deferred", round labels and process words: none. No backticked name is
presented as this roadmap's own (the code spans are formulas and library names).

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity (6.1–6.2) with densities
(6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and integral varifolds
(7.4, 7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic against ambient
(5.2); comparison with GeometricCurrents G6 (9.3). Each has hypotheses and a locator. There is no
`Suggested.lean`, so the padding probe, the `#check` comparison and the import header do not apply
at this stage.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at every locator of the sample table and at 6.4, 7.4
and 9.4 (34 passages). Shared runs are formulas and standard names (the longest: the four names of
39.4, generalised mean curvature, boundary, boundary measure, co-normal, which the literature
fixes); 9.4's two statements are rearranged and shortened against Simon2023 Theorem 1.1 and
EdelenSpolaor2023 Theorem 1.4, with formulas shared. Arrangement: Simon1983's Chapter 8 runs
§38–§42; the README spreads §38 over 1.1–1.3 and 3.3, §39 over 3.1 and 4.1–4.4, builds Layer 2 from
§3, §11, §15, merges §40–§41 with §17–§19 in Layer 6, moves 40.6 to 7.1, splits §42 over Layers 7
and 8, and adds 4.5, Layer 5, 6.2 and Layer 9: no one-to-one run. The order first variation →
monotonicity → tangents → rectifiability is forced (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3
needs 6.4, 7.1–7.2). The Summary's "in the generality of Allard's theory as presented in Chapter 8
of Simon's lectures" describes generality, not the plan. Reuse: no table, figure or exercise list
taken over.

Source independence: 34 passages compared with 5 sources (Simon1983, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025, Simon2023, EdelenSpolaor2023), none shared; largest share Simon1983, 84 of 134 source references; contents compared with Simon1983 (Chapters 1, 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983: the displays of 3.5 (line 775–776), 38.1 (line 7336–7338), 40.6's density hypothesis
  (line 7569–7571) and 42.4's density hypothesis (line 7777–7778) are lost or damaged in the
  extraction; the statements were matched through the surrounding prose and the proofs.
- Simon1983 40.4 (weighted identity): the sign of the first-variation term cannot be read from the
  extraction; round 10 recomputed the README's sign and I rely on that row.
- 7.5 for h ≠ e, 4.4's isometry law, 4.5 and 5.2's general formula: no source states them; the
  README marks them as its own with routes. 4.4, 4.5 and 5.2 were recomputed above; 7.5's values
  are those of rounds 9 and 10.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Error** in Simon1983 at Theorem 41.1, printed page 240: the source says a stationary varifold supported in a connected C² submanifold M is a constant multiple of M in U; it should be requiring M ∩ U connected (two arms of one curve in U carry different multiplicities); affects a stated result.

The three issues round 10 listed for the proofs of 42.8 and 42.9 were not rechecked this round.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (a file on the ANU mathematics site); I read the cached text and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and Theorems 2.30, 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "00d470a8a9c3cc86dc724cfbac86c38581bc8657", "job": "REV-DESIGN-Varifolds~11", "model": "fable", "worker": "chris-x83"} -->
