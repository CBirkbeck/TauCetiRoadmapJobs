<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18010#issuecomment-6908469094 -->
Red team round 2 pass b (claude) of afb3867

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the module docstring says a sequence of metrics "has no carrier"; the pin has one

   Location: `packages/Varifolds/Suggested.lean:43–46`: "Mathlib's Riemannian metric is the instance
   `Bundle.RiemannianBundle` on the tangent bundle, so a sequence of metrics on one manifold, each with
   its Grassmann bundle of `g_i`-orthogonal projections, and the canonical identification of §1.2
   between these bundles have no carrier".

   Claim: at the pins a metric exists only as an instance, so 7.4 and 7.6 for g_i → g cannot be stated.

   Witness: `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:245` declares the structure
   `Bundle.ContMDiffRiemannianMetric` (a metric as data); the README itself cites
   `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace` (`README.md:182`). A sequence
   `g : ℕ → ContMDiffRiemannianMetric …` is a carrier.

   The conclusion (not statable without a long encoding) stands; only the stated reason is wrong.
   What the pins lack is the notions of this file for a metric given as data. Repair, replacing the
   second bullet of "Not statable at the pins":

   > the forms of §7.4 and §7.6 for metrics `g_i → g` in `C²`. A metric as data exists
   > (`Bundle.ContMDiffRiemannianMetric`), but the Levi-Civita connection, the Riemannian distance and
   > so every definition of this file (`grassmannBundle`, `firstVariation`, `firstVariationMass`,
   > `HasDensity` for the distance of the metric, `IsRectifiable`) are read from the instance
   > `Bundle.RiemannianBundle`; the statement for a sequence needs each of them with the metric as an
   > argument, the identification of §1.2 between the Grassmann bundles of two metrics, and `C²`
   > convergence of metrics on compact sets, none of which is at the pins;

   Tested on the refuting instance: the new text is consistent with
   `Bundle.ContMDiffRiemannianMetric` existing, and names exactly what is absent
   (`CovariantDerivative.leviCivitaConnection I M` takes no metric argument,
   `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`).

2. **F02** (P3) 4.4's `*Needs:*` line omits the push-forward and the dilations its laws use

   Location: `packages/Varifolds/README.md:1109–1112`: "*Needs:* Layer 4.2, Layer 4.3; Mathlib
   `Measure.rnDeriv`, `Measure.singularPart`, `ContMDiff.mpullback_vectorField`; Tau Ceti …".

   Claim: 4.4 needs only 4.2 and 4.3 from this roadmap.

   Witness: `README.md:1080–1082` states δ(f_#V)(Y) = δV(f^*Y) and ‖δ(f_#V)‖ = f_*‖δV‖ (f_# is 3.1);
   `README.md:1088–1089` states the laws for `V_{x,λ}` (3.2). 3.2 is not reached through 4.2, 4.3 or
   4.1 (4.1 needs 1.3 and 3.1 only), and 4.5 (`README.md:1160`) lists 3.1–3.2 itself.

   Repair: `*Needs:* Layer 3.1–3.2 (the isometry and dilation laws), Layer 4.2, Layer 4.3; Mathlib …`
   (rest unchanged). No cycle: 3.1 and 3.2 need Layers 1–3 only. The `prerequisites` of target 4.4 in
   `packages/Varifolds/design/plan.json` have the same omission; that file is not editable at this
   stage, so the README line is the place.

3. **F03** (P3) "tilt" and "tilt excess" are used for an unsquared integral and never defined

   Location: `packages/Varifolds/README.md:1840`: "A plane through 0 tilted by angle α has tilt excess
   \|sin α\| ‖V‖(B_3(0))"; also "the tilt" at lines 1780, 1828, 1834, 1842, 1845, 1859 and 1884.

   Claim: the reader knows which quantity "tilt" and "tilt excess" name.

   Witness: no line defines either word; they stand for 7.5's hypothesis ∫ ‖P_S − p‖ dV (unsquared,
   unnormalised). The literature's tilt-excess is the squared, scale-normalised quantity (Simon1983
   line 3779, §22; line 3580), so line 1840's value \|sin α\|‖V‖ is not the tilt-excess, which would
   carry sin²α.

   Repair: (i) after the display at `README.md:1771` add "The third quantity is called the tilt of V
   over B_3(0) below; it is unsquared and unnormalised, and is not the tilt-excess of Simon1983 §22
   (line 3779), which integrates the square." (ii) at line 1840 replace "has tilt excess" by "has
   tilt". Tested: for a k-plane rotated by α in one coordinate 2-plane, ‖P_S − p‖ = \|sin α\| (the 1.1
   Check), so the tilt is \|sin α\|‖V‖(B_3(0)), as line 1840 computes, and the squared quantity is
   sin²α‖V‖(B_3(0)).

Three new findings, all P3 (S01–S03). The seven distinct round-1 findings are all repaired, and no
repair introduced an error. `README.md` (2165 lines) and `Suggested.lean` (548 lines) were read in
full.

## Round-1 findings at this head

| Round-1 id | State | Witness at `afb3867` |
|---|---|---|
| 1a/F01, 1b/F01 (vacuous 5.2 Check) | repaired | `packages/Varifolds/README.md:1262–1277`: "The trace is over S, not over T_xM, and the curvature term enters with a minus sign. Let M be the unit cylinder…" and the helix Check. Recomputed: B(τ, τ) = (D_τ τ)^⊥ = −ν; vertical line tr_S B = 0; circle −ν = γ''; helix γ''/\|γ'\|² = −cos²α ν, equal to cos²α·B(τ, τ). All three agree with the 5.2 formula and refute the full-trace and opposite-sign models. |
| 1a/F02 (`instBorelSpace` padding) | repaired | The name occurs 0 times in `Suggested.lean` and in the README; `README.md:505` reads "(`grassmannBundle.instMeasurableSpace`; it is a Borel space by definition)". True: the instance is `borel _`. |
| 1a/F03, 1b/F05 (single universe) | repaired | "single universe" occurs 0 times in the README; the elaborated types carry `u_1`–`u_4`. |
| 1a/F04, 1b/F04 (Lemma 2.22 credited for 6.2) | repaired | `README.md:1357–1359`: "Scharrer2022 line 1120–1127 and 1184–1203, Lemma 3.3 and Remark 3.4; a differential form for a weighted, mollified mass ratio, under a two-sided bound \|sec\| ≤ K…". Scharrer2022 line 1120–1127 and 1184–1203 state the integrated inequality and the bound m√b; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 has \|sec\| ≤ K. |
| 1a/F05 (source's arrangement named) | repaired | `README.md:4`: "in the generality of Allard's theory:"; `README.md:22–23`: "The Euclidean theorems of the literature (Allard1972; Simon1983, §§38–42)"; `README.md:160`: "(Simon1983 line 2898–2902, §15)". The only remaining "Chapter 8" is the bibliographic entry at `README.md:2147`. |
| 1b/F02 (42.1/42.3 docstring locators) | repaired | `Suggested.lean:418`: "(Simon1983, 42.3)"; `Suggested.lean:442`: "(Simon1983, 42.1–42.3)". Simon1983 line 7736 (42.1), 7763 (42.2), 7768 (42.3). |
| 1b/F03 (supplier file attribution) | repaired | `README.md:224–233` puts `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` in `Mathlib/Geometry/Euclidean/Volume/Measure.lean` (pin: line 191) and `normDet`, `normDet_comp` in `NormDet.lean` (pin: lines 69, 324). |

No repair introduced a new error: the new 5.2 Checks, the reworded 6.2 locator and the supplier
glosses for `exists_isNormalDomain_ball` and `HasBesicovitchCovering` were recomputed or read at
the pins (rows below).

## Verified sound

Counts: 39 declarations of `Suggested.lean` read (24 definitions and instances, 15 theorems); 36
README targets read (1.1–9.4) with the Conventions and the supplier contracts; 68 locators verified
against the cached texts (48 Simon1983, 11 AgnolettoCorreaHoyosDaSilvaNardulli2025, 3 Scharrer2022,
3 Simon2023, 3 EdelenSpolaor2023); 145 Check bullets read, and those with a computable value recomputed (the
tables show the values); 17 sibling citations resolved on main; 58 library names resolved at the pins.

**Signatures.** No Lean was run (the job is read-only). The elaborated types supplied with the job
were compared with the README, declaration by declaration. The 17 "dropped binder" leads are all
definitions or the instance, and in each the dropped classes (`I.Boundaryless`,
`SecondCountableTopology M`, `IsRiemannianManifold I M`, `BorelSpace`) are not used by the body;
all 15 theorems carry the full variable block (checked on `monotonicity_inequality`,
`constancy`, `rectifiable_compactness`). `∞` elaborates to `↑⊤ : WithTop ℕ∞`, that is C^∞. No
natural-number subtraction: the exponents are `-(k : ℤ) - 2`, `-(k : ℤ) - 1`, `1 - (k : ℤ)`.
`ENNReal.ofReal (σ ^ k)⁻¹` elaborates as `ofReal ((σ^k)⁻¹)`.

**Dependency check.** Output:

```
depcheck: 251 roadmaps, 2381 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Varifolds is line 434 of `merge-order/ORDER.txt`; its suppliers
GeometricCurrents, GeometricMeasureTheory, RiemannianGeometry (with
RiemannianGeometry/MinimalSurfaces) and HopfRinow (Completed) are on main.

**Sibling citations (17, all on main).** GeometricCurrents G1 (constancy criterion on connected
Euclidean open sets: its README line 230–238), G2 (chart comparison, null changes: line 244–247;
mass of a compact oriented smooth source: line 268–272), G5 (comparison with T + ∂Q: line 638), G6
(orientation quotient, compactness over compact base regions, Radon compactness, auxiliary
varifold, weak first variation under ambient flows, monotonicity, tangent cones: line 670–690);
GeometricMeasureTheory G2 (approximate tangent planes, area formula with extended multiplicity,
injective case, C¹ graphs: line 148–168); RiemannianGeometry R4 item 1 (Hessian of r bounded below
by s_κ'/s_κ under K ≤ κ before the first model zero: line 2311–2321), R5a (line 3205), R5a.2
(H = (tr B)/m, `δVol=∫div_M X^⊤−m⟨H,X^⊥⟩`: line 3362–3395), R5b; RiemannianGeometry/MinimalSurfaces
Scope (line 86–91), 3.1 (line 685–709), 3.3 (line 760–782); HopfRinow Layers 0, 1, 2 and Layer 4's
isometry transport. Each states what the README says it states.

**Ownership.** Searched main and the 462 open heads by object: "varifold" (main only:
GeometricCurrents, GeometricMeasureTheory's exclusion, MinimalSurfaces), "Grassmann bundle",
"monotonicity formula", "approximate tangent", "constancy theorem", "tangent cone", "convex hull
property", "generalised mean curvature", "Allard". No open roadmap owns a varifold object. No
fully qualified name of `Suggested.lean` exists elsewhere: `unitBallVolume` and `HasDensity` occur
in LatticePackingsAndPerfectForms and MathematicalStatisticsFoundations under their own namespaces.
This roadmap is the owner of general varifolds; G6's auxiliary varifold is cited and identified in
9.3, not rebuilt.

**Library names (58 at the pins).** Every name of the supplier contracts resolves in the file the
README gives, with the hypotheses the README states: for example
`ContMDiff.mpullback_vectorField` (`Pullback.lean:608`, hypothesis `m + 1 ≤ n`),
`TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
(`Isometry/LeviCivita.lean:130`, Y differentiable at f x),
`TauCeti.RiemannianIsometry.riemannianExp_mfderiv` (`Isometry/Exponential.lean:117`),
`TauCeti.Manifold.IsNormalDomain.image_riemannianExp_ball` (`Gauss/Distance.lean:251`, tangent ball
inside a normal domain maps onto `eball p (ofReal r)`), `Vitali.vitaliFamily` (`Vitali.lean:460`),
`Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Regular.lean:1183`),
`TauCeti.CountablyRectifiable.mono/congr/iUnion/image` (`Rectifiable/Basic.lean:74–135`).
`CovariantDerivative.leviCivitaConnection` is a choice unique on differentiable fields
(`LeviCivita.lean:357–360`), which is all `firstVariation` uses (C¹ fields).

**Headlines and padding.** Headlines of the Summary: Riesz decomposition (stated), Euclidean
monotonicity identity (stated), Riemannian monotonicity and its exponential form (stated), density
existence, semicontinuity and lower bound (stated), Allard rectifiability (stated), rectifiable and
integral compactness (stated, fixed metric), varifold tangents and tangent cones (stated in E),
constancy (stated), the embedded comparison 5.2 and the comparison 9.3 (named in the docstring as
not statable, with the missing carrier). No statable headline is absent and none is forced through
a stand-in. One-tactic probe on the 15 theorems: none follows from one library lemma or restates a
definition; the shortest, `one_le_upperDensity_of_mem_support`, needs
`hasDensity_and_limsup_le_of_firstVariationMass_le` and a support argument. Every definition is
used by a stated theorem. No `set_option`, `lemma`, `#eval`, `#check`, `True`, sorry'd data,
pull-request number or process word in either file. The pull request changes only
`packages/Varifolds/`.

**Note (not a finding).** `rectifiable_compactness` assumes each `V i` rectifiable, as Simon1983
42.7 (line 7886) and README 7.4 do; the README's route (1.4, 7.1, 7.3) does not use it. README and
Lean agree, so nothing changes.

### Adversarial table: `Suggested.lean`

Context: R = the Riemannian block (`E` finite-dimensional, `I.Boundaryless`, `EMetricSpace M`,
`IsManifold I ∞ M`, second countable, `RiemannianBundle`, `IsContMDiffRiemannianBundle I ∞`,
`IsRiemannianManifold I M`, Borel); Eu = `F` finite-dimensional real inner product space, Borel,
`W : Opens F`.

| Declaration (context) | Instances tried | Values computed | Result |
|---|---|---|---|
| `grassmannBundle` (R, def) | k = 0; k = N; k > N | {(x, 0)}; {(x, 1)}; ∅ | matches 1.2 |
| `grassmannBundle.instMeasurableSpace` | — | `borel _`, Borel by `rfl` | needed by every `Measure` |
| `weight` (R) | Dirac at (x, P) | δ_x | matches 1.3 |
| `Euclidean.grassmannian` (Eu) | F = ℝ, k = 0, 1, 2; `[[1,t],[0,0]]` | {0}; {1}; ∅; excluded (not self-adjoint) | matches 1.1 |
| `Euclidean.weight` | horizontal lift of H¹ on the axis, unit disc | mass 2 | matches 1.3 |
| `VarifoldTendsto` | δ at j·e_1; j·δ_0 | → 0; integrals j·f(0) diverge | vague convergence |
| `IsRectifiable`, `IsIntegral` (R) | V = 0; non-measurable θ | holds with U_j = ∅; `withDensity θ` ≪ Hᵏ⌞∪f_j(U_j), so a measurable density exists | no wrong model admitted |
| `Euclidean.IsRectifiable`, `Euclidean.IsIntegral` | vertical lift of H¹⌞axis; v(L, ½); δ_(0,P), k = 1 | excluded (tangent of every piece is the axis a.e.); rectifiable not integral; excluded (H¹{0} = 0) | matches 2.2 |
| `Euclidean.blowUp` | V = v([0,1]×{0}, 1), x = 0, s = λ | mass λ⁻¹·1 = λ⁻ᵏ𝐌(V) | matches 3.2 |
| `firstVariation`, `Euclidean.firstVariation` | unit circle, X = ψy; line, X = ψe_2 | 2π; 0 | matches 4.1 |
| `IsStationary`, `Euclidean.IsStationary` | line; circle | 0 for all X; 2π ≠ 0 | matches 4.3 |
| `HasLocallyBoundedFirstVariation` (both) | vertical lift, X_n = n⁻¹ψ sin(ny_2)e_2 | sup\|X_n\| ≤ 1/n, δV(X_n) = ∫ψ(t,0)dt: no C | order ∀K ∃C ∀X correct |
| `firstVariationMass` (both) | unit circle, U ⊇ C; U = ∅ | 2π; 0 | matches 4.3 |
| `exists_firstVariation_eq_riesz` (R) | half hyperplane {x_N = 0, x_1 > 0}; v(L, 1 + y_1²) | H = 0, σ = Hᴺ⁻²⌞edge, η = −e_1; H = (θ'/θ)e_1, σ = 0 | true; conclusion does not assert measurability of `Hv`, `η` (an existential, weaker than 4.4, still true) |
| `unitBallVolume` | k = 0, 1, 2 | 1, 2, π | Conventions |
| `densityRatio`, `HasDensity`, `upperDensity` | H¹⌞L at x ∈ L; two lines at the crossing; atom, k ≥ 1; ρ ≤ 0 | 2ρ/(2ρ) = 1; 2; ∞; filter `𝓝[>] 0` ignores junk | Conventions |
| `Euclidean.monotonicity_identity` | line y_2 = a, x = 0, σ < a < ρ; unit circle, σ < 1 < ρ | both sides 2√(ρ²−a²)/ρ; 2π/ρ = 2π − 2π(1 − 1/ρ) | sign of the δV term correct; a plus sign gives 2π(2 − 1/ρ) |
| `monotonicity_inequality` (R) | S², great circle, k = 1, κ = 1; S², k = 2, volume, σ ↓ 0, ρ = π/2 | 2 ≤ 2 + 2(ρ − σ); π ≤ 8/π + ∫2f ≥ 2.55 + 8 − 5.1σ | true; without the κ term π ≤ 2.546 fails |
| `monotoneOn_exp_mul_densityRatio` | from f(σ) ≤ f(ρ) + c∫_σ^ρ f | F(σ) = ∫_σ^ρ f satisfies F ≤ f(ρ)(e^{c(ρ−σ)} − 1)/c, so f(σ) ≤ e^{c(ρ−σ)}f(ρ) | Grönwall step valid without differentiability |
| `ae_hasDensity` | v(L, e^{−1/\|t\|}) at 0 | Θ = 0 exists though the ratio ‖δV‖/‖V‖ ≥ ρ⁻² | a.e. statement, finite |
| `hasDensity_and_limsup_le_of_firstVariationMass_le` | two lines; step multiplicity 1, 2 | Θ(0) = 2 ≥ 1; hypothesis fails (σ_V = δ_0), Θ(0) = 3/2 < 2 | hypothesis necessary and present |
| `one_le_upperDensity_of_mem_support` | v(L, ½) | hypothesis Θ ≥ 1 a.e. fails; Θ = ½ | consistent |
| `constancy` | v(L, 3); half-line in a line; open segment Σ; graph of sin(1/t) | θ₀ = 3; not stationary; θ₀ > 0 would give spt = closure ⊄ Σ, so θ₀ = 0; θ₀ = 0, `0 • μHE` = 0 | "θ₀ = 0 ∨ IsClosed" correct |
| `Euclidean.IsVarifoldTangent` | two crossing lines at 0 | VarTan = {V} | matches 7.2 |
| `Euclidean.exists_isVarifoldTangent` | vertical lift at 0 | Θ = 1, `blowUp V 0 λ` = V for all λ: limit exists without first-variation bound | no δV hypothesis needed |
| `Euclidean.IsVarifoldTangent.isStationary` | triple junction; measure 1 + ½ sin(log r)cos ϑ | ‖C‖(B_ρ) = (3/2)·2ρ; ball masses 2πρ but λ⁻¹∫cos ϑ = (π/4)(sin log λ − cos log λ): −π/4, π/4 | dilation clause is not implied by ball masses, correctly separate |
| `isRectifiable_of_ae_density_pos` | Lebesgue × constant line; vertical lift | Θ¹ = 0, hypothesis fails; not of bounded first variation | hypotheses necessary and present |
| `rectifiable_compactness` | lines y_2 = 0, 1 alternating; zigzags; circles of radius 1/i | two subsequential limits; ‖δV_i‖ = √2(i−1) + 2 → ∞; limit 0 | existence and "every limit" clauses both right |
| `integral_compactness` | i segments of length 1/(2i) | ‖δV_i‖ = 2i → ∞, limit of density ½ excluded by `hmass` | consistent |
| `Euclidean.IsVarifoldTangent.isRectifiable` | ½v(L, 1); blow-up masses of {Θ* < 1} | `hlow` fails (ρ⁻¹·ρ = 1 ↛ 0); scaled set has mass λ⁻ᵏ‖V‖(·∩B_{λR}) → 0 | matches 8.1; 7.1 and 7.3 need no rectifiability of V |
| `Euclidean.IsVarifoldTangent.isIntegral` | v(P_1, 1) + v(P_2, 1); x ∉ spt | cone of density 2; θ = 0, C = 0 integral | matches 8.2 |

### Adversarial table: README targets

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions | H¹(circle), H²(disc); sphere S^k | 2π, π; B = −g·x, H_[S^k] = −kx | consistent with 4.4, 5.1 |
| 1.1 | A = Q*Q + 1 − P on range P and ker P; U : ℝ → ℝ²; h-projection | (QA⁻¹Q*)² = QA⁻¹Q* since Q*Q A⁻¹Q* = Q*; image {diag(1,0)}; — | image-plane formula right |
| 1.2 | h = diag(1,4), u = (1,1) | h-projection of e_1 = u/5, Euclidean u/2 | presentation depends on g |
| 1.3 | restriction to the disc of radius ½ | support [0, ½) × {0} | relative support |
| 1.4 | δ at j·e_1 | masses 1, limit 0 | lower semicontinuity only |
| 2.1 | H¹⌞L with λ⁻ᵏ⁺¹, λ⁻ᵏ⁻¹; φ = 2y | 0, ∞; φ_*μ = ½H¹⌞L = 1/J | normalisation and chart law right |
| 2.2 | open segment endpoints | ρ/(2ρ) = ½ off Γ | "Hᵏ-a.e." needed |
| 2.3 | graph of \|t\|^{3/2} | ∫₋₁¹√(1 + 9\|t\|/4)dt = (26√13 − 16)/27 = 2.879 > 2√2 = 2.828 | right |
| 3.1 | 2y; (y_1, 0); t²; ℝ² → ℝ, k = 2 | mass 2; 0; v([0,1], 2); 0 (model without J: mass π) | right |
| 3.2 | great circle on S² | ‖V_{x,λ}‖(B_ρ) = 2ρ for λρ < π | right |
| 3.3 | \|y_1\|H¹⌞L + \|y\|⁻¹L²; weight e^{−1/\|y_1\|} | ‖V‖(B_r) = r² + 2πr, Θ(0) = π, ratio 9; ratio ≥ e^{1/(2r)} | density points needed |
| 4.1 | X = ψy_2²e_1 on the axis | div_L X = 0 | locality |
| 4.2 | L(X) = ∫(X¹ + X²) | √2·Lebesgue, η = (e_1+e_2)/√2; sup norm gives 2 | right |
| 4.3 | circle | ‖δ[C]‖ = H¹⌞C | right |
| 4.4 | dilation law | δ(V_λ)(Y) = λ⁻ᵏ∫tr(P DY∘η)dV = λ^{1−k}δV(Y∘η); H_λ(ηy) = λH_V(y); circle R/λ: λ/R | right |
| 4.5 | h = c²g; g = e⁴ᵗdt², c = 2; blow-up | \|c^k − 1\|\|δ_gV(X)\|; Γ = 2, div X(0) = 2, left side 2 > 8/(3√3) = 1.54, ‖h − g‖ = 3e⁴; ψ^*g̃_λ = λ⁻²g, ‖δṼ_λ‖ = λ^{1−k}‖δV‖, ‖g̃_λ − g_x‖_{C¹} = O(λ²R) | right; the factor 1 + O(λ) between \|Y\| for g̃_λ and g_x is absorbed by \|δṼ(Y)\| ≤ k sup\|∇Y\|‖Ṽ‖ |
| 5.1 | graph of \|t\|^{5/2} | ∫φ'u'(1+u'²)^{−1/2} = −∫φu''(1+u'²)^{−3/2} | right |
| 5.2 | cylinder, helix; great sphere | −cos²α ν; −kx | right |
| 6.1 | weighted identity | δV(X) = kI − ρI' + ρJ' + ∫φ(y−x)·P∇h, so (ρ⁻ᵏI)' = ρ⁻ᵏJ' + ρ⁻ᵏ⁻¹(∫… − δV(X_ρ)) | sign right |
| 6.2 | (1 − x cot x)/x | increasing, 2/π at π/2 ≤ 1 | right; κ = 0 read as the limit |
| 6.3 | chart-ball route; e^{−1/\|t\|} | ‖δV‖(B̄_t) ≤ Λc^{2k}t^k f(c²t); ‖V‖(B_{2r})/‖V‖(B_r) ≥ (2r)⁻¹e^{1/(3r)} | right |
| 6.4 | g = e²ᵗdt² | div_g X = e⁻ᵗ(eᵗX)', θ̃ = 1, (θ̃w)' = eᵗ ≠ 0 | right |
| 6.5 | catenoid piece | area 2π(h + sinh h cosh h) | right |
| 7.1 | segments | ‖δV_i‖ = 2i | right |
| 7.2 | h(y/λ) test | derivative −λ⁻ᵏ⁻¹∫(kh_λ + y·∇h_λ) = 0 | right |
| 7.3 | bound on ‖C‖(B_ρ(y)) from B_ρ(y) ⊆ B_{ρ+\|y\|}(0) | ρ⁻ᵏ‖C‖(B_ρ(y)) ≤ Θω_k(1 + \|y\|/ρ)^k → Θω_k as ρ → ∞ | right |
| 7.4 | zigzag corner | co-normals (1,1)/√2 + (−1,1)/√2 = (0, √2) | right |
| 7.5 | m planes; disc of radius r; spike | n_0 ≥ m(3/2)^k ≥ m; ratio ≥ 2ρ/(πρ²/2) = 4/(πρ); 3/2 + 7δ/2 < 2 iff δ < 1/7 | right; see S03 for the word "tilt" |
| 7.6 | final estimate | \|ψ' − θ\| ≤ (a − ψ') + (a − θ); total 2(δθ + 2δ)ω_k + δ | right |
| 8.1, 8.2 | ½v(L, 1); step multiplicity | hypothesis fails yet cone rectifiable; ρ^{1−k}‖δV‖ = 1 | right |
| 9.1 | L_1 + 2L_2 | θ_0 = 1 on a ball missing L_2 | right |
| 9.2 | circle dilated | \|H\| = λ/R, Θ = 1 | right |
| 9.3 | [[P]] − [[P]] | θ_T = 0, Γ_T⁺ = ∅, varifold 0 | right |
| 9.4 | Simon2023 Theorem 1.1; EdelenSpolaor2023 Theorem 1.4 | n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1 (line 84); p + q = n − 1, every cone minimizing for n > 7 (line 107, 120) | hypotheses match the sources |

### Copyright, licences and scope

Wording: 14 passages set beside the sources at their locators — README 1.1/1.2 (Simon1983 line
7295–7305), 1.3 (7308–7317), 2.1 (2352–2364), 3.1 (7443–7446), 3.3 (7333–7349), 4.3 (7474–7486),
6.2 (Scharrer2022 line 1120–1127, 1184–1203), 6.4 (Simon1983 line 7665–7700), 7.2 (7734–7774), 7.4
(7886–7898), 7.5 (7991–8003), 9.1 (AgnolettoCorreaHoyosDaSilvaNardulli2025 line 89–92), 9.4
(Simon2023 line 84–96; EdelenSpolaor2023 line 104–135), and the docstrings of
`monotonicity_inequality` and `rectifiable_compactness`. No sentence is reproduced; the longest
shared runs are standard names and formulas ("locally bounded first variation", the displayed
metric of Simon2023).

Arrangement: Simon1983 has 88 of 139 source mentions. Its §§38–42 are: basics and first
rectifiability; first variation; monotonicity; constancy; tangents, rectifiability, compactness.
The README's layers are not in one-to-one correspondence: Layer 1 ↔ part of §38; Layer 2 ↔ §11,
§15; Layer 3 ↔ rest of §38 with 39.1; Layer 4 ↔ §39 with §4 and the roadmap's own 4.5; Layer 5 ↔
§9, §16; Layer 6 ↔ §40, §41, §19 and Scharrer2022; Layers 7–8 ↔ §42 split; Layer 9 has no
counterpart. The order first variation → monotonicity → tangents → rectifiability → compactness is
forced by the `*Needs:*` lines of 6.1 (4.1–4.4), 7.2 (6.1), 7.3 (7.1–7.2, 6.3–6.4), 7.4 (7.1, 7.3)
and 7.6 (7.4–7.5).

Reuse: no table, figure or list of exercises is taken over. No public formalisation with matching
names was found.

Source independence: 14 passages compared with 5 sources, none shared; largest share Simon1983, 88 of 139 locators; contents compared with Simon1983: independent. Allard1972, Federer1969 and Maggi2012 (18 mentions) are uncertified and were not read.

## Not verifiable

- Allard1972 (Sections 3–6, 8), Federer1969 (2.5, 2.8, 3.2) and Maggi2012 (Part II): uncertified,
  cited by locator only; neither the locators nor the wording were compared.
- The proof of 7.5 for h ≠ e and the varying-metric forms of 7.1, 7.4 and 7.6 are this roadmap's
  own; I checked the arithmetic of each displayed estimate and the Checks, not a full proof.
- Simon1983 is a scan read through its text layer. Two places read as slips but may be recognition
  errors, so they are not entered below: line 7791 and 7806 call the rectifiability theorem "42.2"
  where line 7777 numbers it 42.4; line 7546 shows the first-variation term of 40.4 without the
  minus sign that the computation (and README 6.1) gives.
- "Not statable" claims of the module docstring for §7.2/§8.1/§8.2 on a manifold and for §5.2: I
  confirmed the named objects are absent by grep at the pins (no push-forward of measures on
  Grassmann bundles; `TauCeti.secondFundamentalForm` takes a map out of a normed space,
  `SecondFundamentalForm.lean:82`), not that no short encoding exists.
- No Lean was elaborated in this pass; signature claims rest on the elaborated types supplied
  with the job.

## Source issues

- **Misprint** in Scharrer2022 at Lemma 3.3, proof, printed page 20 (line 1140–1141): the source says the divergence formula holds for all planes in the Grassmannian of 2-planes; it should be the Grassmannian of m-planes, as in the statement; affects nothing.
- **Misprint** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Definition 2.5, printed page 4 (line 195): the source says the tangential Jacobian is taken along the m-plane S for a d-dimensional varifold; it should be the d-plane S; affects nothing.

## For the human reviewers

- **Scope.** AgnolettoCorreaHoyosDaSilvaNardulli2025 is an arXiv preprint (2504.10758v3) with no published version in `packages/Varifolds/sources.toml`; cited 19 times, alone only for Definition 1.2 in 9.1.
- **Scope.** 4.5, the set Z of 7.5, the varying-metric forms of 7.1–7.6 and the general case of 6.5 are marked "this roadmap" in the README; no cited source states them.
- **Scope.** `README.md:1900–1902` says the printed proof of Simon1983 42.8 (line 7977–7985) uses only the measure bound on the exceptional set, and supplies the mass bound on Z itself.
- **Not tested.** Allard1972, Federer1969 and Maggi2012 are uncertified: 18 of 139 source mentions were not compared with a text.
- **Scope.** `packages/Varifolds/design/plan.json` (`summary`) still reads "in the generality of Allard and Simon's Chapter 8"; the README no longer does, and this stage may not edit that field.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "afb3867f9fb117ea6c0b9f70acc44fc18764941f", "job": "RT-Varifolds~2b", "model": "fable", "worker": "chris-x82"} -->
