<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6895232020 -->
Review (claude) of 9762f8e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 1.1 builds the real Grassmannian without citing the one at the Tau Ceti pin

   **Location:** `packages/Varifolds/design/README.md:303–312` ("define the Grassmannian G(E, k) as the
   set of continuous linear maps P : E → E that are self-adjoint idempotents … G(E, k) is compact") and
   `:184–185` ("`Module.Grassmannian` … is the algebraic quotient functor and is not a supplier").

   **Claim:** the only library Grassmannian is Mathlib's algebraic one, so compactness and the Hausdorff
   property of the space of k-planes are this roadmap's to prove, with no comparison owed.

   **Witness:** `TauCeti.finiteGrassmannian 𝕜 r N` (`TauCeti/Topology/Grassmannian/Basic.lean:52`, the
   r-dimensional subspaces of `Fin N → 𝕜` with the frame-quotient topology), `CompactSpace`
   (`Orthonormal.lean:225`), `T2Space` (`Plucker.lean:89`), at the pin `2fd255d9`.

   **Exact repair:** (a) in "From Tau Ceti" add: "`TauCeti.finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean`),
   with its `CompactSpace` and `T2Space` instances (`Orthonormal.lean`, `Plucker.lean`): the
   k-dimensional subspaces of `Fin N → ℝ` with the quotient topology of the span map on frames; it
   carries no metric and no projection operator." (b) In Scope ("Owned here", first bullet) add the
   clause "the projection presentation is kept because the tangential trace tr(P ∘ A) and the
   operator-norm distance are stated on P; it is homeomorphic to `TauCeti.finiteGrassmannian ℝ k N`
   (1.1)". (c) Add to 1.1 the API bullet: "For an orthonormal basis of E (a linear isometry
   E ≅ ℝ^N), P ↦ range P is a homeomorphism of G(E, k) onto `TauCeti.finiteGrassmannian ℝ k N`
   (a frame F goes to F(F*F)⁻¹F*, continuous on full-rank frames and constant on the fibres of the span
   map; a continuous bijection from a compact space to a Hausdorff one)", and add the name to 1.1's
   *Needs:* and to target 1.1's prerequisites in `plan.json`. Tested: k = 0 gives one point on both
   sides (`Basic.lean:185`, G(E, 0) = {0}); k = N gives one point (`Basic.lean:198`, G(E, N) = {1});
   k = 1, N = 2 gives the circle ℝP¹ on both sides, and the frame (cos θ, sin θ) goes to P_{ℓ_θ}, the
   README's own parametrisation. GeometricCurrents G6 already compares its fibre with this carrier
   (GeometricCurrents README line 86 and 675, TopologicalKTheory T1.5), so the three presentations then
   agree by stated maps.

2. **F02** (P3) 7.4's zigzag Check names the tangent directions as the co-normals

   **Location:** `packages/Varifolds/design/README.md:1395–1397`: "the two unit co-normals (1, ±1)/√2
   there add up to a vector of length √2".

   **Claim:** at an interior corner the outward co-normals of the two segments are (1, 1)/√2 and
   (1, −1)/√2.

   **Witness:** at the peak (1/2, 1/2) of the i = 2 graph the rising segment ends with outward
   co-normal (1, 1)/√2 and the falling one starts with outward co-normal −(1, −1)/√2 = (−1, 1)/√2; their
   sum is (0, √2). The vectors (1, ±1)/√2 sum to (√2, 0), which is not the atom's direction.

   **Exact repair:** replace "(the two unit co-normals (1, ±1)/√2 there add up to a vector of length
   √2)" by "(at a peak the outward unit co-normals of the two segments are (1, 1)/√2 and (−1, 1)/√2,
   with sum (0, √2); at a trough they are (1, −1)/√2 and (−1, −1)/√2, with sum (0, −√2))". Tested on
   i = 2: one interior corner of mass √2 and two endpoints of mass 1, total √2 + 2, the README's value;
   the masses and the conclusion of the Check are unchanged.

3. **F03** (P3) 3.1 uses F for a closed set and for an unnamed map in one sentence

   **Location:** `packages/Varifolds/design/README.md:605–606`: "If f is proper on a closed set F
   containing spt‖V_j‖ … (the integrand J_S f · (φ ∘ F) extends continuously by 0 to {J = 0})".

   **Claim:** φ ∘ F is defined.

   **Witness:** F is introduced in that sentence as a closed subset of W; φ is a function on G_k(W'),
   so φ ∘ F has no meaning. The map meant is (x, S) ↦ (f(x), df_x(S)), which the README never names
   (Simon1983 line 7448 calls it F).

   **Exact repair:** replace the parenthesis by "(for φ compactly supported and continuous on G_k(W'),
   the integrand (x, S) ↦ J_S f(x) φ(f(x), df_x(S)) extends continuously by 0 to {J = 0}, and on the
   closed set G_k(F) it is supported over the compact set f⁻¹(π(spt φ)) ∩ F)". Tested on the fold
   f(t) = t², V = v([−1, 1], 1): the integrand is |2t| φ(t²), continuous at t = 0 where J = 0, and
   ∫ |2t| φ(t²) dt = 2∫_0^1 φ, the README's Check.

Three findings, all P3; no P1, no P2. Each has an exact repair, so the verdict asks for changes: a fix round applies the three repairs. Both findings of
REV-DESIGN-Varifolds~5 are repaired. No gap is declared and none is needed. No file of the design
and no manifest entry was edited; no source was fetched (all eight cited works are recorded in
`packages/Varifolds/sources.toml`). No maintainer notes were supplied. There is no `Suggested.lean`
at the design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~5), finding by finding

| Prior finding | Repaired passage | Status and my test |
|---|---|---|
| F01 (6.4: no differentiation step for ‖V‖ ≪ Hᵏ⌞Σ) | 6.4 route: "`Besicovitch.ae_tendsto_rnDeriv`, applied to Lebesgue measure dt against ν, gives at ν-a.e. t a limit of the ratio … the bound gives D(t) ≥ ω_k/c_t > 0. A Borel set A with dt(A) = 0 has ∫_A D dν ≤ dt(A) = 0 … so ν(A) = 0" | **Repaired.** Pin: `Besicovitch.lean:1077` gives ρ(B̄_r)/μ(B̄_r) → ρ.rnDeriv μ, μ-a.e., for two locally finite measures; with ρ = dt, μ = ν the ratio is ω_k r^k/ν(B̄_r(t)) ≥ ω_k r^k/(c_t r^k). `RadonNikodym.lean:319`: ∫_s μ.rnDeriv ν dν ≤ μ(s), no instance argument. ν(B̄_r(t)) ≤ ‖V‖(B̄_{Lr}(x_t)) ≤ (Θ + 1)ω_k(Lr)^k. Witness H¹⌞L + δ_0: ratio 2r/(2r + 1) → 0 at 0, ν({0}) = 1, so D = 0 on a set of positive ν-measure and the step correctly fails; v(L, θ): ratio → 1/θ(t). 6.3 supplies finiteness at every point for stationary V (README line 1101–1103). *Needs:*, the Mathlib contract, Layer 6 Dependencies and `plan.json` 6.4 carry both names. |
| F02 (6.5: Simon 19.1–19.2 is the rectifiable case) | "(Simon1983 line 3371–3400, 19.1–19.2, for rectifiable V with generalised mean curvature; the general case is this roadmap's, by the same test field)" and the rewritten route | **Repaired.** Simon1983 line 3371–3372 states the standing rectifiable hypothesis; line 3387 has the test field. ∇X = γI + γ'(y − ξ)⊗(y − ξ)/r ⇒ tr(P_S∇X) = kγ + γ'|P_S(y − ξ)|²/r ≥ kγ. spt X ⊆ spt ψ ∩ {r ≥ R + ε}, disjoint from K ⊆ B̄_R(ξ). k = 0: div_S X = 0, every 0-varifold stationary, hull property false (δ_1 with K = {0}); excluded by Layer 6's k ≥ 1, which the route now uses explicitly. |

Same-pattern search. (i) "carried by ⇒ absolutely continuous": 2.1's criterion (points of Γ have
Θ^k(μ, x) = θ(x) > 0, so μ-null subsets of Γ are Hᵏ-null and conversely μ is carried by Γ by
hypothesis; the source's 11.8 at Simon1983 line 2352–2364), 3.3 and 7.3 (through 2.1) are sound;
no other occurrence. (ii) Chapter 4 (rectifiable) locators for general statements: 5.2, 6.1, 6.3,
7.2 now say "rectifiable case" beside a Chapter 8 or Agnoletto et al. locator; 7.1, 7.3, 7.4, 7.6,
8.1 cite §§40–42 only. No finding of the repair report was marked not actionable.

### Principles, shape, plan

Read all 1700 lines and `plan.json` (9 layers, 34 targets, 34 distinct ids, no prerequisite on a
later target, no `gap:` prerequisite, `gaps` empty, every target with at least 3 tests, baseline
equal to the pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). No
route-specific narrowing (statements are for arbitrary Radon measures on the Grassmann bundle of a
Riemannian manifold, varying metrics in Layer 7); no re-planned roadmap (GeometricCurrents G6's
auxiliary varifold is compared in 9.3, not rebuilt; the smooth monotonicity of MinimalSurfaces 3.1
is not restated); no algorithm; no Lean file, so no sorry'd data and no `set_option`. Shape:
Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine
layers each ending in Examples and Dependencies, Downstream consumers, References. Grep for LaTeX
delimiters, pull-request numbers, machine paths, HTML anchors, round labels, "optional",
"deferred", "so far": none; "lemma" only in "Gauss lemma", "multiplicity lemma", "closure lemmas".
No backticked name is presented as this roadmap's own (all 58 distinct backticked identifiers are
library names or notation).

### Adversarial table (values computed this round)

Rows for the changed passages, the sampled targets, the headlines, the sections the round-5 table
did not cover (1.4, 2.1, 2.2, 3.1–3.3, 7.3–7.6, 9.1–9.2) and the targets the findings touch.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 image-plane projection Q A⁻¹ Q* | L = diag(1, 0), P = P_{ℓ_0}; P = P_{ℓ_{π/2}} | Q = diag(1,0), A = 1, QQ* = diag(1,0); Q = 0, A = diag(1, 0) singular | sound |
| 1.1 against the pin | k = 0, k = N, (k, N) = (1, 2) | one point, one point, ℝP¹ on both carriers | R01 |
| 1.3 weight does not determine V | χ·tr(P diag(1, 0)) on the two lifts | ∫χ dH¹ against 0 | sound |
| 1.4 semicontinuity, compactness | δ_{(je_1,P)}; j·δ_{(0,P)}; alternating lifts | masses 1 → limit mass 0 (lower semicontinuity only); mass j on a compact set, no bound; integrals alternate ∫χ, 0 | sound |
| 2.1 normalisation, chart law | H¹⌞L; Lebesgue on ℝ², k = 1; δ_0; φ = 2·id | λ⁻¹·2λ = 2; λ⁻¹·πλ² → 0; λ⁻¹ → ∞; φ_*μ = ½H¹⌞L = (1/J)·H¹⌞L | sound |
| 2.2 k = 0; additivity | Γ countable; two crossing lines | Σθ(x)δ_{(x,0)}; crossing point H¹-null, v(L_1 ∪ L_2, 1) = sum | sound |
| 2.3 weight identity | graph of \|t\|^{3/2} on (−1, 1) | (8/27)·2·((13/4)^{3/2} − 1) = (26√13 − 16)/27 = 2.8794 > 2√2 = 2.8284 | sound |
| 3.1 push-forward | f = 2·id; f = (y_1, 0) on a vertical segment; t ↦ t²; non-proper stack | mass 2 (not 1); J = 0 ⇒ 0; ∫\|2t\|φ(t²) = 2∫_0^1 φ ⇒ v([0,1], 2); infinite mass on a compact segment | sound; R03 (notation) |
| 3.1 immersion ⇒ equality of supports | y = f(x), x ∈ spt, A ∋ y open | ‖f_#V‖(A) = ∫_{f⁻¹A} J dV > 0 since J > 0 and ‖V‖(f⁻¹A) > 0 | sound |
| 3.2 scaling | segment, k = 1; composition | mass λ⁻¹; η_{0,μ} ∘ η_{x,λ} = η_{x,λμ} | sound |
| 3.3 doubling on D | weight \|y_1\| + \|y\|⁻¹dy; weight e^{−1/\|y_1\|} | ‖V‖(B_r) = r² + 2πr, Θ(0) = π; (‖V‖⌞D) ratio 9r²/r² = 9 ≠ 3; ≥ r e^{−1/(2r)}/(r e^{−1/r}) = e^{1/(2r)} | sound |
| 4.1 first variation | circle, X = ψy | div_T X = 1, δ[C](X) = 2π = d/dt 2πe^t at 0 | sound |
| 4.2 Riesz for fields | ⟨X(0), 2e_1⟩; ∫(X¹ + X²) | 2δ_0, η = e_1; √2·vol (Euclidean norm) against 2·vol (sup norm) | sound |
| 4.4 decomposition (headline), dilation law | half hyperplane; circle of radius R | δ[Σ](X) = −∫X¹: η = −e_1; div(Y∘η) = λ⁻¹(div Y)∘η ⇒ factor λ^{1−k}, H_{V_λ}(ηy) = λH_V(y), \|H\| = λ/R | sound |
| 5.1 C² submanifold | S^k, X = ψx | k Hᵏ(S^k) on both sides (H_{[S^k]} = −kx) | sound |
| 5.2 intrinsic against ambient (headline) | great S^k ⊂ S^N; tangent X | H_V = 0, tr B = −kx ⇒ H_{ι_#V} = −kx, 5.1's value; X^⊥ = 0 ⇒ δ(ι_#V)(X) = δV(X^⊤) | sound |
| 6.1 identity (headline), weighted form | circle, σ < 1 < ρ; general h | 2π/ρ = 2π − 2π(1 − 1/ρ); kI − ρI' = δV(X) − ρJ' − ∫φ(y − x)·P_S∇h ⇒ minus sign on δV(X_ρ) | sound |
| 6.2 Riemannian form (headline) | Euclidean reduction; x = π/2 | \|δV(1_{B_t}(y − x))\| ≤ t‖δV‖(B_t) ⇒ term t^{−k}‖δV‖(B̄_t); (1 − x cot x)/x = 2/π ≤ 1 | sound |
| 6.3 lower bound | monotone e^{(Λ+k√κ)ρ}ρ^{−k}‖V‖(B̄_ρ) | ≥ ω_kΘ ≥ ω_k ⇒ ‖V‖(B̄_ρ) ≥ e^{−(Λ+k√κ)ρ}ω_kρ^k | sound |
| 6.4 constancy (headline) | H¹⌞L + δ_0; v(L, θ); g = e^{2t}dt² | ratio 2r/(2r + 1) → 0 on an atom; → 1/θ; (e^tX)' integrates to 0 with θ̃ = 1 | sound (F01 repaired) |
| 6.5 convex hull | X = ψγ(r)(y − ξ); δ_{(0,P)}; K = ∅; k = 0 | div_S X ≥ kγ; {0} = hull{0}; two disjoint balls ⇒ V = 0; false, excluded | sound (F02 repaired) |
| 7.3 rectifiability (headline), plane step | C stationary cone, y ∈ spt‖C‖ | ρ^{−k}‖C‖(B_ρ(y)) ≤ lim_{ρ→∞} ρ^{−k}‖C‖(B_{ρ+\|y\|}(0)) = Θω_k and ≥ Θ(‖C‖, y)ω_k ≥ Θω_k ⇒ constant ⇒ P_{S^⊥}(z − y) = 0 | sound |
| 7.3 negative controls | Lebesgue with a constant line; vertical lift | Θ¹ = 0, not rectifiable; Θ = 1 but δV unbounded (X_n, sup 1/n, δV = ∫ψ) | sound |
| 7.4 compactness (headline) | alternating lines; zigzag i = 2; circles 1/i | two limits; corners (1,1)/√2 + (−1,1)/√2 = (0, √2), total √2 + 2; limit weight √2H¹, fibre ½δ_{P_+} + ½δ_{P_−}; mass 2π/i → 0 | sound; R02 (wording) |
| 7.5 multiplicity lemma | m planes; planes at ±ε/2; ε = 1/10 | m ≤ (1 + δ)m + δ; fibre sum 2 ≤ (1 + δ)·2(1 − ε²/16)^{k/2} + δ since ε < δ²; cε⁻¹(2ε²) = c/5 against cε⁻¹(2ε) = 2c | sound for h = e |
| 7.6 integral compactness (headline) | v(L,1) + v(L_i,1); ½v(L,1) | limit v(L, 2); non-integral input, non-integral limit | sound |
| 8.1 rectifiable cones | ½v(L, 1); step multiplicity | ρ⁻¹·½·2ρ = 1 ↛ 0, cone still rectifiable; ρ⁰‖δV‖(B_ρ) = 1 ↛ 0 | sound |
| 8.2 integral cones | blow-up of integral V; x ∉ spt‖V‖; C_{p,q} | λ^{−k}V for λ^{−2}g keeps θ (Hᵏ scales by λ^{−k}); ‖δṼ_λ‖(B_R) = λ^{1−k}‖δV‖(B_{λR}) → 0; VarTan = {0}; \|x\|²/\|y\|² = p/q, dim p + q + 1 = n | sound |
| 9.1 regular set | \|t\|^{3/2} graph; ½v(L, 1); stationary x ∈ reg² | 0 ∈ reg¹ ∖ reg²; reg = L; 6.4 on U with x ∈ spt ⇒ θ_0 > 0 | sound |
| 9.2 dilation invariance of Θ | ball B_ρ(ηy) | λ^{−k}‖V‖(B_{λρ}(y))/(ω_kρ^k) = ‖V‖(B_{λρ}(y))/(ω_k(λρ)^k) | sound |
| 9.3 comparison (headline) | [[P]] − [[P]]; multiplicity 2, both orientations | 0 against v(P, 2); v(P, 2) twice | sound |
| 9.4 statements | n ≥ 8 | p + q = n − 1 ≥ 7, every C_{p,q} minimizing (EdelenSpolaor2023 line 120) | sound |

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7300 | Subspaces with a metric given by the projection matrices. Match; the operator norm is the README's stated choice. |
| 1.3 | Simon1983 line 7308–7317 | Varifold, weight by π, mass, restriction to G_n(A). Match. |
| 1.4 | Simon1983 line 7336–7338, 7738–7740, 1038–1045 | Convergence as Radon measures on the Grassmann bundle; Theorem 4.4 with bounds on relatively compact open sets. Match. |
| 2.3 | Simon1983 line 2861–2867, 1855–1859; EdelenSpolaor2023 line 130–131 | v(M, θ) (θ = 1 at line 7319–7320); area of a C¹ graph; "multiplicity-one". Match. |
| 3.1 | Simon1983 line 7443–7454, 2903–2926; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 188–195 | 39.1 with f proper on the support and the integrand restricted to J ≠ 0; 15.6–15.7 with the fibre sum. Match. |
| 4.1 | Simon1983 line 7455–7473, 1948–1964; Scharrer2022 line 87–98; Agnoletto et al. line 179–187, 210–212 | 39.2, 9.3; tangential divergence with the Levi-Civita connection; Proposition 2.6. Match. |
| 4.2 | Simon1983 line 857–882 | 4.1 (Hilbert-space valued) and 4.2 (open-set formula). Match; the bundle version and uniqueness are the README's, with a route. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2), 16.6(1). Match. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7674–7682 | 9.6, 16.4, 41.2(3). Match, sign included. |
| 6.1 | Simon1983 line 7510–7547 | 40.1–40.4. Match; 40.4's sign under Source issues. |
| 6.5 | Simon1983 line 3371–3400 | 19.1–19.2 in the rectifiable setting, as the README now says. |
| 7.4 | Simon1983 line 7882–7898 | 42.7: bounds on W ⊂⊂ U, exceptional sets, subsequence, lim inf. Match (g_i = g = e). |
| 7.5 | Simon1983 line 7986–8048 | ε ∈ (0, δ²), the slab {\|q\| < ε}, the factor (1 + δ) and + δ, B_2(x), Lⁿ(A) < δ, step (i) "≤ cε by the hypotheses". Match where legible; see Not verifiable. |
| 8.1 | Simon1983 line 7793–7805 | 42.6 with the hypothesis on {Θ < 1}. Match. |
| 8.2 | Simon1983 line 7793–7805, 7899–7912; EdelenSpolaor2023 line 109–112 | 42.6 and 42.8; tangent cone "up to rotation … with multiplicity one". The combination is the README's route (8.1 + 7.6). Match. |

Also read: Simon1983 line 7662–7732 (41.1 and its proof, with the differentiation theorem at line
7713–7716), 7733–7745, 7775–7790 (42.4–42.5), 7960–7985.

### Duplication audit, pins, suppliers, direction

- Pins checked by commit. All 58 backticked identifiers resolved; opened this round:
  `Besicovitch.ae_tendsto_rnDeriv` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1077`),
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` (same file, 1088),
  `MeasureTheory.Measure.setLIntegral_rnDeriv_le` (`Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean:319`),
  `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Mathlib/MeasureTheory/Measure/Regular.lean:1183`),
  `TauCeti.CountablyRectifiable` with `mono`, `congr`, `iUnion`, `image`
  (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44, 74, 78, 122, 135`),
  `TauCeti.Manifold.divergence` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:55`),
  `TauCeti.Manifold.integral_divergence_eq_zero` (`…/Riemannian/DivergenceTheorem.lean:225`),
  `MeasureTheory.integral_divergence_eq_zero` (`TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean:30`),
  `TauCeti.RealRMK.posPart`, `negPart` (`…/RieszMarkovKakutani/Signed.lean:160, 205`). A grep of both
  pins for "varifold" finds nothing; for the Grassmannian it finds R01's carrier.
- Suppliers resolved on main (`1a19c9f`): GeometricCurrents G1 (constancy criterion, line 229–238),
  G2 (line 240–249), G5 (583), G6 (668–690); GeometricMeasureTheory G2 (148–168); RiemannianGeometry
  R4 item 1 (2271, 2311–2320), R5a (3205), R5a.2 (3362), R5b (3581); HopfRinow under `Completed/`,
  Layers 0–2 (229, 264, 427). None of them appears in the list of open pull requests, so no
  revision can drift them.
- Ownership against open work: `roadmaps grep` for "varifold" over main and the 475 open heads
  finds only GeometricCurrents, GeometricMeasureTheory and MinimalSurfaces, all on main. The board
  package index (AnalyticNumberTheory, LawrenceVenkateshMethod) was read: no package
  on this subject. Overlap report: no pull request changes this roadmap, no dropped id, no
  revision-only id, no second copy.
- The worker's citation report lists no cross-roadmap citation and no Lean name found nowhere.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main), ManifoldOptimization, LorentzianGeometry, PointProcesses, QuasiregularMaps, BanachSpaceTheory (open or by vocabulary); the unoriented Grassmann bundle, its Radon compactness and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited, compared in 1.2 and 9.3); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); monotonicity for smooth proper minimal immersions: owner MinimalSurfaces 3.1 (not restated here); the general varifold carrier and its theory: this roadmap; the others share nothing.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2229 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

### Headlines and Lean form

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity, Euclidean and Riemannian
(6.1–6.2); existence and semicontinuity of densities (6.3); Allard's rectifiability theorem (7.3);
compactness of rectifiable and of integral varifolds (7.4, 7.6); varifold tangents and cones (7.2,
8.1–8.2); constancy (6.4); intrinsic against ambient (5.2); comparison with GeometricCurrents G6
(9.3). There is no `Suggested.lean` at this stage, so the padding probe, the `#check` comparison
and the import header do not apply. For the package: 4.4, 6.1–6.3, 7.2 and the measure part of 7.4
are statable on native carriers with a few real definitions; those needing weighted approximate
tangent planes, submanifold predicates or the supplier's currents (7.3's conclusion, 7.6, 8.x, 6.4,
5.2, 9.3) are to be named in the module docstring with the missing carrier unless stated without
stand-ins.

### Copyright, arrangement, reuse

Wording: besides the fifteen sampled locators, compared the definition of 1.3 with Simon1983 line
7308–7317, the statement of 6.4 with line 7665–7671, the route of 6.5 with line 3381–3390, the
statement of 7.4 with line 7886–7898, the second statement of 9.4 with EdelenSpolaor2023 line
130–135, and 2.2, 3.1, 4.1 with AgnolettoCorreaHoyosDaSilvaNardulli2025 line 157–195. No run of
shared words beyond standard names and forced hypothesis lists; the proof plans are restated with
different organisation (6.5 adds the divergence identity and the k ≥ 1 step; 7.4 is restated for
varying metrics). Arrangement: Simon1983's Chapter 8 runs §38 basics and first rectifiability, §39
first variation, §40 monotonicity, §41 constancy, §42 tangents, rectifiability, compactness. The
README splits §38 over 1.1–1.3 and 3.3, takes Layer 2 from §11 and §15, puts push-forward (§39's
opening) in Layer 3, merges §40–§41 with §17–§19 in Layer 6 and moves 40.6 to 7.1, splits §42 over
Layers 7 and 8, and adds Layers 5 and 9 and the Riemannian material (4.5, 6.2) from other sources:
no one-to-one run. The order first variation → monotonicity → tangents → rectifiability is forced
by the *Needs:* lines (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 7.1–7.2, 6.4). Reuse: no
table, figure or exercise list taken over.

Source independence: 21 passages compared with 4 sources (Simon1983, EdelenSpolaor2023, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025), none shared; largest share Simon1983, 82 of 132 source references; contents compared with Simon1983 (Chapters 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 42.9 (line 7991–8000): the three displayed hypotheses (mass bound Λ, thresholds ε² for
  the first variation and the tilt) are lost in the extracted text; the legible parts and step (i)
  of the proof ("≤ cε by the hypotheses", line 8045–8046) agree with the README's reading.
- 7.5 for h ≠ e: no source states it; the README marks it as its own with a route. I checked the
  error accounting of the route (Cε²ρ(1 + ρ/τ) against ρ^{−k−1} integrates to ≤ Cε²σ(1 + σ/τ)), not
  a full proof.
- GeometricCurrents G2 states its manifold/chart comparison in one clause (main, line 244–245);
  that it will carry the Jacobian form used in 2.3's route is a contract with the supplier.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Misprint** in Simon1983 at 40.4, printed page 236: the source says the weighted radial identity carries the first variation with a plus sign; it should be a minus sign, as the computation of the divergence of the weighted radial field gives; affects a stated result.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and N converges to the limit multiplicity; it should be the minimum, since a maximum with N above the limit cannot converge to it; affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at proof of Theorem 2.32, arXiv v3 page 17: the source says locally bounded first variation is preserved by a bi-Lipschitz chart push-forward, without argument; it should be supplying a metric comparison, since the change of metric adds a term in the derivative of the test field; affects the proof.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (line 69); I did not re-fetch it and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and for Theorems 2.30 and 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9762f8e214333a89f9bbca2839fb8883c748a27b", "job": "REV-DESIGN-Varifolds~6", "model": "fable", "worker": "chris-x83"} -->
