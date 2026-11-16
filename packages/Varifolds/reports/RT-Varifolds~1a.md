<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18010#issuecomment-6907497472 -->
Red team round 1 pass a (claude) of 2485ce7

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 5.2 has one vacuous Check, and no Check separates `tr_S B_M` from the full trace

   Location: `packages/Varifolds/README.md:1260`, "V = 0 gives 0 = 0; for k = 0 both sides vanish."

   Claim: a Check of the formula `δ(ι_#V)(X) = δV(X^⊤) − ∫ ⟨X, tr_S B_M⟩ dV`.

   Witness: with V = 0 or k = 0 every candidate formula (opposite sign, the full trace `tr B_M` in
   place of `tr_S B_M`, no curvature term) reads 0 = 0. The affine Check (line 1259) has B_M = 0 and
   the sphere Check (line 1257) has `tr_S B = −k x` for every S, so neither depends on S: 5.2 has
   fewer than three discriminating Checks.

   Repair: replace line 1260 by

   > - The trace is over S, not over TM. On the cylinder M = {x₁² + x₂² = 1} ⊆ ℝ³,
   >   `B_M(τ, τ) = −(x₁, x₂, 0)` for the unit tangent τ of the horizontal circles and
   >   `B_M(e₃, e₃) = 0`. For k = 1 and V the varifold of a ruling {p} × ℝ (a geodesic of M, H_V = 0),
   >   `tr_S B_M = B_M(e₃, e₃) = 0` and `H_{ι_#V} = 0`, as 5.1 gives for a straight line of ℝ³; for V
   >   the varifold of the circle {x₃ = 0} (also a geodesic of M), `tr_S B_M = −(x₁, x₂, 0)` and
   >   `H_{ι_#V} = −(x₁, x₂, 0)`, the curvature vector of a unit circle (5.1). The full trace
   >   `tr B_M = −(x₁, x₂, 0)` would give the ruling a nonzero mean curvature. On the circle,
   >   ‖δ(ι_#V)‖ = H¹⌞circle = k|B_M| ‖V‖ with |B_M| = 1: the bound of the first consequence is
   >   attained.

   Tested on the refuting instance: the wrong model `tr B_M` gives −(x₁, x₂, 0) ≠ 0 on the ruling,
   the stated formula gives 0; the sign-reversed formula gives +(x₁, x₂, 0) on the circle against
   5.1's −x.

2. **F02** (P3) `grassmannBundle.instBorelSpace` is padding

   Location: `packages/Varifolds/Suggested.lean:90`–92, `instance grassmannBundle.instBorelSpace … := ⟨rfl⟩`.

   Claim: a declaration of the acceptance test.

   Witness: it is proved by `⟨rfl⟩` from the definition two lines above
   (`grassmannBundle.instMeasurableSpace := borel _`), and no statement of the file uses a
   `BorelSpace` instance on the bundle: the bundle occurs only under `Measure`, `Measure.map`,
   `IsFiniteMeasureOnCompacts`, `∀ᵐ`, `∫` and `C_c(·, ℝ)`, none of which asks for it.

   Repair: delete lines 90–92 from `Suggested.lean`. In `README.md:503` replace
   "(`grassmannBundle.instMeasurableSpace`, `grassmannBundle.instBorelSpace`)" by
   "(`grassmannBundle.instMeasurableSpace`; it is a Borel space by definition)". Confirm with the
   elaboration that the file still compiles (this pass ran no Lean).

3. **F03** (P3) "All types live in a single universe" is false for the Lean file

   Location: `packages/Varifolds/README.md:187`, "All types live in a single universe."

   Claim: the Lean carriers are monomorphic in one universe.

   Witness: `Suggested.lean:60`–67 declares `{E : Type*} {H : Type*} {M : Type*} {F : Type*}`; the
   elaborated type of `exists_firstVariation_eq_riesz` has `{E : Type u_1} … {H : Type u_2} …
   {M : Type u_3}`, and `constancy` adds a fourth for `N`.

   Repair: delete the sentence (nothing in the README uses it), or replace it by "The model space,
   the manifold and the Euclidean space each have their own universe."

4. **F04** (P3) Lemma 2.22 of the second source is not the inequality of 6.2

   Location: `packages/Varifolds/README.md:1340` ("AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542,
   Lemma 2.22") and `Suggested.lean:332` (docstring of `monotonicity_inequality`).

   Claim: the locator supports `σ^{−k}‖V‖(B_σ(x)) ≤ ρ^{−k}‖V‖(B_ρ(x)) + ∫_σ^ρ t^{−k}(‖δV‖(B_t(x)) + k√κ‖V‖(B_t(x))) dt`.

   Witness: AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542–575 is a differential inequality for a
   weighted, mollified ratio, with a constant c(σ, K) and radius ρ₀(r₀, K) from two-sided curvature
   bounds; it has no first-variation term and no `k√κ`. The stated inequality is Scharrer2022 line
   1120–1127 with 1184–1203.

   Repair: in `README.md:1340` write "…Lemma 3.3 and Remark 3.4; a weighted differential form under
   two-sided curvature bounds is AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542, Lemma 2.22)". In
   `Suggested.lean:332` end the docstring with "(Scharrer2022, Lemma 3.3 and Remark 3.4)."

5. **F05** (P3) the Summary describes the theory through a source's chapter

   Location: `packages/Varifolds/README.md:4`–5, "in the generality of Allard's theory as presented
   in Chapter 8 of Simon's lectures", and line 24, "The theorems of Allard's paper and of Simon's
   Chapter 8 are the case W ⊆ E".

   Claim: a description of the roadmap's generality.

   Witness: the planning principle that a roadmap does not say it follows a source; the first
   sentence presents the plan through one source's chapter. (The layers themselves do not map onto
   that chapter: see the arrangement check under Verified sound.)

   Repair: line 3–7: "…of a smooth Riemannian manifold (M, g), in the generality of Allard's theory:
   a varifold is an arbitrary Radon measure on the Grassmann bundle of unoriented k-planes, and the
   analysis is carried out for varifolds of locally bounded first variation." Line 24: "The Euclidean
   theorems of the literature (Allard1972; Simon1983, §§38–42) are the case W ⊆ E with the flat
   metric, …".

Five findings, all P3. No P1 or P2 was found: every Lean statement was computed on the instances
of the table below and none was refuted; every supplier citation resolves on main or at the pins.

## Verified sound

Counts: 40 declarations of `Suggested.lean` read (25 definitions and instances, 15 theorems); 34
README sections with all their targets read, every line; 34 Checks blocks, 144 Check bullets, of
which about 65 recomputed (values below; the others were read against the statements); 49 source
locators opened (Simon1983 27, Scharrer2022 3, AgnolettoCorreaHoyosDaSilvaNardulli2025 14,
Simon2023 3, EdelenSpolaor2023 2); 16 sibling citations resolved on main; more than 60 pinned
declaration names resolved at the pins.

Elaborated signatures: no Lean was run in this pass (read-only). The elaborated types of
`scratch/signatures.md` were compared with the README statements. All 18 "dropped binder" leads are
definitions or instances whose body does not use the dropped class (`[BorelSpace M]`,
`[SecondCountableTopology M]`, `[IsRiemannianManifold I M]`, `[I.Boundaryless]`, `[BorelSpace F]`);
every theorem keeps the full variable block. Nothing changed.

Dependency check, output: `depcheck: 246 roadmaps, 2295 edges, 0 problem(s)` (no UPWARD, no CYCLE,
no `moved:` line).

Suppliers resolved on main: GeometricMeasureTheory G2 (approximate tangent planes, tangential
differentiation, area formula with extended multiplicity, injective case, C¹ graphs);
GeometricCurrents G1 (distributional constancy criterion on connected Euclidean open sets, mass
measures), G2 (chart comparison, integer-rectifiable and locally integral currents, mass of the
current of a compact oriented smooth source), G5 (minimizers), G6 (unoriented Grassmann bundle by
orientation quotient, compactness over compact base regions, Radon compactness, auxiliary varifold,
weak first variation, monotonicity, tangent cones); RiemannianGeometry R4 item 1 (radial Hessian
zero and the `K ≤ κ` Hessian bound on a normal-distance domain), R5a, R5a.2, R5b;
RiemannianGeometry/MinimalSurfaces Scope and ownership, 3.1 and 3.3; HopfRinow (Completed) Layers
0, 1, 2 and 4 (transport across smooth isometries). GeometricCurrents is on main and does not cite
this roadmap.

Ownership: `roadmaps grep` for `varifold` over the open pull requests and main returns only
GeometricCurrents, GeometricMeasureTheory (an exclusion) and MinimalSurfaces, all cited; no open
roadmap or roadmap on main declares `grassmannBundle`, `firstVariation`, `IsStationary`,
`densityRatio`, `unitBallVolume`, `upperDensity` or `HasDensity` in a `Suggested.lean`. The
same-name library leads (`weight`, `IsIntegral`, `IsStationary`) are unrelated notions in other
namespaces. This roadmap owns the general varifold; G6 owns the auxiliary varifold of a current,
and 9.3 compares them.

Pinned names resolved (file and declaration found at the pin): `μHE` /
`MeasureTheory.Measure.euclideanHausdorffMeasure` (normalised: `addHaarScalarFactor volume μH[d] •
μH[d]`, so `IsIntegral` uses the Lebesgue-normalised Hᵏ and a multiplicity-one plane has density 1),
`Manifold.IsSmoothEmbedding` (immersion and topological embedding, so the source `N` of `constancy`
inherits Hausdorff and second countable), `TauCeti.Manifold.IsNormalDomain`,
`exists_isNormalDomain_ball`, `IsNormalDomain.image_riemannianExp_ball` (image of the tangent ball
is `eball p (ENNReal.ofReal r)`, the ball the Lean statements use),
`CovariantDerivative.sectionalCurvature`, `MeasureTheory.Measure.support`,
`Measure.setLIntegral_rnDeriv_le`, `Vitali.exists_disjoint_subfamily_covering_enlargement`,
`Besicovitch.ae_tendsto_rnDeriv`, `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet`,
`ContMDiff.mpullback_vectorField`, `LinearMap.normDet_comp`,
`LipschitzWith.hausdorffMeasure_image_le`, the Tau Ceti Grassmannian, flow, signed Riesz, mass
measure (`𝓓^{n}(Ω, F)` with `n : ℕ∞`), Prokhorov, divergence, isometry, restriction, second
fundamental form, induced metric and `CountablyRectifiable` (`mono`, `congr`, `iUnion`, `image`)
declarations, and the three imported Tau Ceti modules.

Headline theorems (README Summary) against `Suggested.lean`: Riesz decomposition (stated);
monotonicity, Euclidean and Riemannian (stated); existence and semicontinuity of densities
(stated); Allard rectifiability (stated); rectifiable and integral compactness (stated, fixed
metric; varying metrics named as not statable); varifold tangents and tangent cones (stated in E;
Riemannian forms named as not statable); constancy (stated); intrinsic versus ambient comparison
and the G6 identification (named as not statable). The convex hull property (6.5) is not among the
Summary's end theorems, so its absence from the Lean file is not raised. Padding probe: only R02.

Arrangement: Simon1983 has 86 of the 136 source mentions. Its Chapter 8 is §38 (definitions,
tangent spaces, first rectifiability), §39 (first variation), §40 (monotonicity), §41 (constancy),
§42 (varifold tangents, rectifiability, compactness). Layer 1 and Layer 3 both draw on §38; Layer 2
is §11 and §15; Layer 5 is §9, §16 and 41.2(3); Layer 6 merges §40, §41, §17, §19 and Scharrer2022;
Layers 7 and 8 split §42; Layer 9 has no counterpart. No one-to-one run. The order Layer 4 → 6 → 7
→ 8 is forced by the *Needs:* lines of 6.1 (Layer 4.1–4.4), 7.1 (Layer 6.2–6.3) and 8.1 (Layer
7.1–7.3).

Wording: the README text at each opened locator was set beside the source; the longest shared runs
are formulas and hypothesis lists (9.4 against Simon2023 line 89–96; 7.5 against Simon1983 line
7991–8000); no sentence or proof plan is reproduced. No table, figure or exercise list is reused.
The misprint "max" of Simon1983 line 7982 is not copied (the README writes min, line 1832).

Source independence: 49 passages compared with 5 sources, none shared; largest share Simon1983,
86 of 136 locators; contents compared with Simon1983: independent (Allard1972, Federer1969 and
Maggi2012 are uncertified and were not read).

### The adversarial pass: `Suggested.lean`

Context of every Riemannian row: `E` finite-dimensional normed, `I` boundaryless, `M` an
`EMetricSpace` with `IsManifold I ∞ M`, second countable, `RiemannianBundle`,
`IsContMDiffRiemannianBundle I ∞`, `IsRiemannianManifold I M`, Borel. Euclidean rows: `F`
finite-dimensional inner product, Borel, `W : Opens F`. Norms and inner products of tangent vectors
are those of the Riemannian fibre instance (`TangentSpace` is not reducible to `E`).

| Declaration (layer) | Instances tried | Values computed | Result |
|---|---|---|---|
| `grassmannBundle` (1) | k = 0; k = N; k > N | {(x,0)}; {(x,1)}; ∅ | matches 1.2 |
| `grassmannBundle.instMeasurableSpace` (1) | definition | `borel _` | needed by every `Measure` on the bundle |
| `grassmannBundle.instBorelSpace` (1) | uses in file | none | R02 |
| `weight` (1) | `δ_{(x,P)}`; horizontal lift of H¹⌞axis on the unit disc | δ_x; mass 2 | matches 1.3 |
| `Euclidean.grassmannian` (1) | `[[1,t],[0,0]]`; diag(1,1,0) with k = 2, 1; F = ℝ, k = 2 | not self-adjoint, excluded; in, out; ∅ | matches 1.1 |
| `Euclidean.weight` (1) | W ≠ F | measure on F with weight(F ∖ W) = 0 | as README 1.3 |
| `VarifoldTendsto` (1) | `δ_{(j e₁,P)}`; `j·δ_{(0,P)}` | → 0; no Radon limit | matches 1.4 |
| `IsRectifiable`, `Euclidean.IsRectifiable` (2) | v(L,1); vertical lift of H¹⌞axis; `δ_{(0,P)}`, k ≥ 1; two crossing lines | holds; plane clause fails a.e.; weight clause fails (Hᵏ{0} = 0); holds, crossing is null | equals v(Γ,θ) form |
| `IsIntegral`, `Euclidean.IsIntegral` (2) | v(L,1); v(L,½); plane in ℝ³ with `μHE[2]` | θ = 1; θ = ½ ∉ ℕ; θ = 1 (normalised H²) | correct normalisation |
| `Euclidean.blowUp` (3) | V = v([0,1]×{0},1), s = λ; line through x | v([0,λ⁻¹]×{0},1), mass λ⁻¹; unchanged | matches 3.2 |
| `firstVariation`, `Euclidean.firstVariation` (4) | unit circle, X = y; v(axis,1), X = ψe₂; vertical lift, X = ψy₂e₂ | 2π; 0; ∫ψ(t,0)dt | matches 4.1 |
| `IsStationary` (both) (4) | line; circle; Lebesgue with constant line | 0; 2π ≠ 0; 0 | matches 4.3 |
| `HasLocallyBoundedFirstVariation` (both) (4) | vertical lift with X_n = n⁻¹ψ sin(ny₂)e₂ | sup‖X_n‖ ≤ n⁻¹, δV = ∫ψ: fails | matches 4.3 |
| `firstVariationMass` (both) (4) | circle; step multiplicity 1, 2 on the axis | H¹⌞C; δ₀ | sup form equals ‖δV‖ on open sets |
| `exists_firstVariation_eq_riesz` (4) | V = 0; half hyperplane; v(L, 1+y₁²); k = 0 | (0,0,any); H = 0, σ = Hᴺ⁻², η = −e₁; H = (θ′/θ)e₁, σ = 0; all 0 | true; signs as Conventions |
| `unitBallVolume` (6) | k = 0, 1, 2 | 1, 2, π | |
| `densityRatio`, `HasDensity`, `upperDensity` (6) | H¹⌞L on L; two crossing lines at 0; atom, k ≥ 1; ρ ≤ 0 | 1; 2; ∞; junk outside `𝓝[>] 0` | matches Conventions |
| `Euclidean.monotonicity_identity` (6) | line y₂ = a, x = 0, σ < a < ρ; unit circle, σ < 1 < ρ; k > dim F | 2√(ρ²−a²)/ρ both sides; 2π/ρ = 2π − 2π(1 − 1/ρ); 0 = 0 with ησ = 0 forced by `hrep` | true; sign of the δV term confirmed; derivation redone with X = φ(r/ρ)(y − x) |
| `monotonicity_inequality` (6) | S², great circle, k = 1, κ = 1; S², k = 2, V = vol; κ = 0 flat | 2 ≤ 2 + 2(ρ−σ); f(σ) ≤ f(ρ) + ∫2f, f(0+) = π, f(π/2) = 8/π; 6.1 without the excess term | true; equals Scharrer2022 Lemma 3.3 with (1 − x cot x)/x ≤ 2/π |
| `monotoneOn_exp_mul_densityRatio` (6) | Grönwall from the previous row; S² great circle | (e^{cσ}g(σ))′ ≥ 0 with g = f(ρ) + c∫f; 2e^ρ increasing | true |
| `ae_hasDensity` (6) | v(L, e^{−1/|t|}) at 0 | ‖V‖-null point, density 0 exists | true (a.e.) |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` (6) | crossing lines; step multiplicity (hypothesis fails: atom of ‖δV‖) | Θ(0) = 2 ≥ 1; Θ(0) = 3/2 < 2 excluded | true; hypothesis needed |
| `one_le_upperDensity_of_mem_support` (6) | v(L,½); segment endpoints with U = B_a(0) | hypothesis fails; endpoints outside U | true |
| `constancy` (6) | v(L,3); half-line in a line; N = open half-line, V ≠ 0; sin(1/t) graph | θ₀ = 3; not stationary (σ = δ₀); impossible, support not in the image; only V = 0 | true; `θ₀ = 0 ∨ IsClosed` needed |
| `Euclidean.IsVarifoldTangent` (7) | cone at 0 | C = V | |
| `Euclidean.exists_isVarifoldTangent` (7) | vertical lift at 0 | Θ = 1, `blowUp V 0 s = V` | true without first-variation hypotheses |
| `Euclidean.IsVarifoldTangent.isStationary` (7) | triple junction; Lebesgue with a line; vertical lift (no `hV`); measure 1 + ½ sin(log r)cos ϑ | Θ = 3/2, C = V; Θ = 0, C = 0; C not stationary; ball masses 2πρ but (π/4)(sin log λ − cos log λ) not constant | true; scaling ‖δV_{x,λ}‖(B_R) = λ^{1−k}‖δV‖(B_{λR}) |
| `isRectifiable_of_ae_density_pos` (7) | Lebesgue with a line (Θ = 0); vertical lift (no `hV`) | excluded by `hθ`; excluded by `hV` | true |
| `rectifiable_compactness` (7) | alternating lines; zigzags; half-density segments | two subsequential limits; ‖δV_i‖ = √2(i−1) + 2 → ∞; ‖δV_i‖ = 2i → ∞ | true; quantifier "every Radon subsequential limit" right |
| `integral_compactness` (7) | v(L,1) + v(L_i,1); ½v(L,1) | limit v(L,2); not integral input | true |
| `Euclidean.IsVarifoldTangent.isRectifiable` (8) | ½v(L,1); step multiplicity | `hlow` fails, conclusion still holds; `hδ` fails (ratio 1) | true; Simon1983 42.6 |
| `Euclidean.IsVarifoldTangent.isIntegral` (8) | two planes; integral V gives {Θ* < 1} null | density 2; `hlow` automatic | true |

### The adversarial pass: README targets

| Section | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 | lines ℓ_θ; h-projection; `Q A⁻¹ Q*` | `P_θ − P_0 = sin θ·[[−s,c],[c,s]]`; idempotent and self-adjoint by `Q*Q = A` on range P | sound |
| 1.2 | h = diag(1,4), u = (1,1); h = c²g | e₁ ↦ u/5 against u/2; identity | sound |
| 1.3, 1.4 | restriction to the half disc; escaping Dirac | support [0,½)×{0}; mass 1 → 0 | sound |
| 2.1 | H¹⌞L with λ^{−k±1}; φ = 2·id | 0, ∞; multiplicity ½ | sound |
| 2.2 | v((0,1)×{0},1) at an endpoint; k = 0 | ρ/(2ρ) = ½; Σθ(x)δ | sound |
| 2.3 | graph of |t|^{3/2} | metric 1 + (9/4)|t|, length (26√13 − 16)/27 ≈ 2.879 > 2√2 | sound |
| 3.1 | f = 2y; f = t²; f = y₁ on the disc, k = 2 | mass 2; v([0,1],2); 0, wrong model has mass π | sound |
| 3.2 | great circle on S² | λ⁻¹·2λρ = 2ρ | sound |
| 3.3 | |y₁|H¹⌞L + |y|⁻¹ Lebesgue; weight e^{−1/|y₁|} | r² + 2πr, Θ(0) = π, ratio 9; ratio ≥ e^{1/(2r)} | sound |
| 4.1, 4.3 | as in the Lean rows | | sound |
| 4.2 | L = ∫(X¹ + X²) | √2 Lebesgue against 2 for the sup norm | sound |
| 4.4 | dilation law; rotation by π/2 | δ(V_{x,λ})(Y) = λ^{1−k}δV(Y∘η), |H| = λ/R; −e₂ = R(−e₁) | sound |
| 4.5 | g = e^{4t}dt², h = 4g, X = (1 − t²)²; blow-up form | Γ = 2, left side 2 > 8/(3√3); m*g̃_λ = λ⁻²g, ‖δ‖ scales by λ^{1−k} | sound |
| 5.1 | sphere with X = ψx; graph of |t|^{5/2} | k Hᵏ(Sᵏ) both sides; ∫φ′u′(1+u′²)^{−1/2} = −∫φu″(1+u′²)^{−3/2} | sound |
| 5.2 | great sphere; cylinder (R01) | −kx; 0 on a ruling, −(x₁,x₂,0) on a circle | sound; R01 |
| 6.1–6.3 | as in the Lean rows; weighted identity rederived; e^{−1/|t|} | div_S X = kφh + hrφ′ρ⁻¹|P∇r|² + φ(y−x)·P∇h; ratio ≥ ρ⁻², doubling ≥ (2r)⁻¹e^{1/(3r)} | sound |
| 6.4 | g = e^{2t}dt² | δV = ∫(e^tX)′ = 0 with θ̃ = 1, (θ̃w)′ = e^t | sound |
| 6.5 | catenoid piece; γ test field | area 2π(h + sinh h cosh h); div_S X ≥ kγ | sound |
| 7.1–7.4 | as in the Lean rows; h(y)y test | d/dλ[λ^{−k}∫h(y/λ)d‖C‖] = −λ^{−k−1}∫(kh_λ + y·∇h_λ) = 0 | sound |
| 7.5 | m planes; disc of radius r, 2πr < ε²; dense discs | m ≤ (1+δ)m + δ; boundary ratio ≥ 4/(πρ) > ε; R = B₂(0), p(Z) of measure < ε² | Checks sound; statement beyond Simon1983 42.9 not verified (below) |
| 7.6 | spike sequence 1 + i·1_{E_i} | weak limit 3/2, min(ψ_i,2) → 1 | the Check is right |
| 8.1, 8.2 | as in the Lean rows | | sound |
| 9.1–9.3 | L₁ with mult. 1 and L₂ with mult. 2; [[P]] − [[P]] | ball through 0 not a submanifold; Γ_T⁺ = ∅ | sound |
| 9.4 | Simon2023 line 84–96, 432–441; EdelenSpolaor2023 line 104–135 | n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1; "n > 7" for all C_{p,q} minimizing | faithful |

## Not verifiable

- Allard1972 (Sections 3–6, 8), Federer1969 (2.5, 2.8, 3.2) and Maggi2012 (Part II): uncertified,
  not read; their locators are unchecked.
- 7.5 beyond Simon1983 42.9: the set Z with ‖V‖(Z) < δ, the bound over every x off Z, and the case
  h ≠ e are the roadmap's own, argued from the source's proof (line 8014–8151). The extraction of
  those pages is too damaged to follow the slab estimates; the three steps were read as a plan,
  not checked as a proof. 7.6's route depends on them.
- Simon1983 display (8) at line 7978 is illegible in the extraction, so the Gap recorded below
  rests on the surrounding sentences (line 7977–7985) and on the spike sequence of 7.5's Check.
- 6.3's route for almost-everywhere densities on M and 3.3's Vitali-family route on M are the
  roadmap's own; the inequalities of each step were recomputed, the whole was not proved.
- Whether `Suggested.lean` still elaborates after R02's deletion, and that it elaborates now: no
  Lean was run.
- That GeometricCurrents G6's unoriented bundle is homeomorphic to `grassmannBundle` (1.2): G6 is
  a plan on main with no carrier at the pins.

## Source issues

- **Misprint** in Simon1983 at the proof of Remark 42.8, printed p. 250: the source says the
  maximum of ψ_i and N converges in L¹ to θ₀; it should be the minimum of ψ_i and N; affects
  nothing.
- **Gap** in Simon1983 at the proof of Remark 42.8, printed p. 249–250: the source says weak
  convergence of the fibre sums and an upper bound off sets of small measure give L¹ convergence
  of the truncations; it should also bound the mass carried over the exceptional sets (integer
  spikes on shrinking sets converge weakly to 3/2); affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at the proof of Theorem 2.32, printed p.
  17–18: the source says locally bounded first variation is preserved under push-forward by a
  bi-Lipschitz chart; it should prove it, for instance by a two-metric first-variation estimate;
  affects the proof.
- **Misprint** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Definitions 2.8 and 2.9, printed p. 4:
  the source says stationarity and the first-variation bound are tested on continuous compactly
  supported fields; it should be C¹ fields, on which Definition 2.4 defines the first variation;
  affects nothing.

## For the human reviewers

- **Scope.** AgnolettoCorreaHoyosDaSilvaNardulli2025 is an arXiv preprint (2504.10758v3); it is
  cited 19 times, always beside Simon1983 or Scharrer2022 except for Definition 1.2 in 9.1.
- **Scope.** 4.5 (two-metric estimate), the set Z of 7.5, the varying-metric forms of 7.1–7.6 and
  the general case of 6.5 are marked "this roadmap" in the README: no cited source states them.
- **Scope.** The README (line 1880–1882) says the printed proof of Simon1983 42.8 is incomplete
  and repairs it with 7.5's set Z; see Source issues.
- **Not tested.** Allard1972, Federer1969 and Maggi2012 are uncertified: wording and locators were
  not compared with them (17 of 136 source mentions).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2485ce7b88ed73a01668009c599b59506b4dd03d", "job": "RT-Varifolds~1a", "model": "fable", "worker": "chris-x55"} -->
