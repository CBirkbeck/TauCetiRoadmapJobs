<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6799897147 -->
Review (claude) of 7157678

Verdict: needs_changes

1. **F01** (P3) 6.4's route omits the differentiation step that makes the weight absolutely continuous

   **Location:** `packages/Varifolds/design/README.md:1158–1159`, "The density exists everywhere (6.3)
   and equals 1 for Hᵏ⌞Σ, so V = v(Σ, θ) with θ = Θ^k(‖V‖, ·)"; *Needs:* line at 1193–1194.

   **Claim:** existence of the two densities alone gives ‖V‖ = θ Hᵏ⌞Σ, with the inputs of the
   *Needs:* line (2.3, 3.3, 4.3, 6.3, GeometricCurrents G1).

   **Witness:** μ = H¹⌞L + δ_0 on a line L is carried by L and is not θH¹⌞L. It is excluded only by a
   differentiation theorem (Θ¹(μ, 0) = ∞); Simon1983 line 7713–7716 invokes one (4.7) at this step. No
   listed input supplies it.

   **Exact repair:** after "equals 1 for Hᵏ⌞Σ" insert: "in a C² chart of Σ, `Besicovitch.ae_tendsto_rnDeriv`
   applied to coordinate Lebesgue measure against the image of ‖V‖ gives a Radon–Nikodym derivative
   that is positive ‖V‖-a.e. because Θ^k(‖V‖, ·) is finite everywhere, so ‖V‖ ≪ Hᵏ⌞Σ, with density θ".
   Add Mathlib `Besicovitch.ae_tendsto_rnDeriv` to 6.4's *Needs:* and to target 6.4's prerequisites in
   `plan.json`. Tested on the witness: at 0 the ratio 2r/(2r + 1) tends to 0 on a set of μ-measure 1,
   so the criterion fails, as it must; for μ = θH¹⌞L the ratio tends to 1/θ > 0. The statement of 6.4
   does not change.

2. **F02** (P3) 6.5 cites Simon 19.1–19.2 for a wider class than the source treats

   **Location:** `README.md:1198–1199`, "Let V be a varifold on E with spt‖V‖ compact, stationary in
   E ∖ K … (Simon1983 line 3373–3400, 19.1–19.2)".

   **Claim:** the cited statements cover arbitrary varifolds.

   **Witness:** Simon1983 line 3371–3372: §19 assumes V = v(M, θ) rectifiable with generalised mean
   curvature. The statement is true in general (the route's div_S X = kγ + γ'|P_S(y − ξ)|²/r ≥ kγ uses
   no rectifiability), but that case is the roadmap's.

   **Exact repair:** change the locator to "(Simon1983 line 3373–3400, 19.1–19.2, for rectifiable V;
   the general case is this roadmap's, by the same test field)". Tested: δ_{(0,P)}, not rectifiable for
   k ≥ 1, is stationary in E ∖ {0} with support {0} = hull of {0}, the README's own Check.

Two findings, both P3, each with a repair to apply; no P1, no P2. All five findings of
REV-DESIGN-Varifolds~4 are repaired. No gaps are declared. No file
of the design and no manifest entry was edited; no source was fetched (all eight cited works are
recorded in `packages/Varifolds/sources.toml`). No maintainer notes were supplied.

## Verified sound

### Previous review (REV-DESIGN-Varifolds~4), finding by finding

| Prior finding | Repaired passage | Status and my test |
|---|---|---|
| F01 (G2 cited for a volume comparison) | 2.3: "which is the Riemannian volume `TauCeti.riemannianVolume` of Σ with the induced metric, pushed into W (this roadmap)" and the "Route for the weight"; contract: "cited in 2.3 only as the case in which 2.3's weight identity agrees with it" | **Repaired.** `eq_riemannianVolume_iff` (`Volume.lean:93`) is stated for every preferred chart under `IsManifold I 1 M` and a continuous bundle (line 57–61). Graph of `|t|^{3/2}`: 2·(4/9)(2/3)((13/4)^{3/2} − 1) = (26√13 − 16)/27 = 2.8794 > 2√2 = 2.8284. `normDet_comp` (`NormDet.lean:324`): normDet(id ∘ Dψ) = √det(ψ*φ_*g). |
| F02 (R5a cited for C² Σ) | Conventions: "`B(X, Y) = (∇_X Y)^⊥` for C¹ tangent fields X, Y of Σ … for smooth Σ these are RiemannianGeometry R5a's B and R5a.2's H"; same in 5.1, Scope, R5a contract | **Repaired.** `|t|^{5/2}`: u'' = (15/4)|t|^{1/2}; left side ∫φ'u'(1 + u'²)^{−1/2}dt, right side −∫φu''(1 + u'²)^{−3/2}dt, equal since (u'(1 + u'²)^{−1/2})' = u''(1 + u'²)^{−3/2}. Sphere: (∇_X Y)^⊥ = −⟨X, Y⟩x. |
| F03 (k = 0) | 1.1: "for k ≥ 1 this subset is all of G(F, k) only when U is surjective, and for k = 0 both sides are {0}" | **Repaired.** U(t) = (t, 0): k = 0 gives {0} = {0}; k = 1 gives {diag(1, 0)} ≠ G(ℝ², 1). For k ≥ 1 and dim E < dim F a k-plane through a vector outside range U is missed. |
| F04 (mass measure at the pin) | 4.2 route: "The measure ‖L‖ on U is the image under φ⁻¹ of Tau Ceti's `Distribution.massMeasure` of T"; contract and *Needs:* | **Repaired** (with the pinned namespace `Distribution`, correctly). `massMeasure` (`Mass/Measure.lean:191`), `massMeasure_preimage_coe` (213), `enorm_apply_le_lintegral_massMeasure` (306), `HasLocallyFiniteMass` (`Mass/Basic.lean:353`), `localMass` (`Basic.lean:77`: tests with `‖φ x‖ ≤ 1`, norm of F), `n : ℕ∞` (`TestFunction.lean:63`). ∫(X¹ + X²): √2·vol(U) in `EuclideanSpace`, 2·vol(U) in the sup norm. |
| F05 (a.e. ratio bound on M) | 6.3: "On M, Θ^k(‖V‖, ·) exists and is finite ‖V‖-a.e. … by the route below, and the geodesic-ball ratio bound holds at ‖V‖-a.e. x at which Θ^k(‖V‖, x) > 0"; 7.3 (iv) | **Repaired.** With S = sup_{[σ,ρ]} f, A = sup_{[ρ,c²ρ]} f, Cρ ≤ ½: S ≤ f(ρ) + ½max(S, A) ⇒ S ≤ 2f(ρ) + A. θ = e^{−1/|t|}: ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}, ratio ≥ ρ^{−2}; doubling ratio ≥ (2r)⁻¹e^{1/r − 2/(3r)}. |

Same-pattern search over the unrepaired text. Supplier cited beyond what it states: GeometricCurrents
G1 (README line 229–233: scalar distribution, connected Euclidean open set, smooth tests; 6.4 uses
exactly that), GeometricMeasureTheory G2 (line 148–167: injective specialisation, C¹ graphs),
RiemannianGeometry R4 item 1 (line 2108–2115: lower bound under radial K ≤ κ before the first model
zero), HopfRinow Layer 2 (line 427–443: normal balls, local logarithm, Gauss lemma, local distance
identity), GeometricCurrents G6 (line 668–690: unoriented fibre, compactness, Radon compactness, weak
first variation, monotonicity, tangent cones): each states what is consumed. Almost-everywhere claims
on M: 3.3, 7.3 (iii)–(iv) and 7.6 are restricted to points of positive finite density or need only
upper bounds by ρ^k. Missing differentiation step: R01. No finding of the repair report was marked
not actionable.

### Principles, shape, plan

Read all 1667 lines and the plan (9 layers, 34 targets, 34 distinct ids, every target prerequisite
earlier than its target, no `gap:` prerequisite, `gaps` empty, baseline equal to the pins of
`lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). No route-specific narrowing, no
re-planned roadmap (G6's auxiliary varifold is compared in 9.3, not rebuilt), no algorithm, no
copied passage, no Lean file and no `set_option` at this stage. The Summary names Simon's Chapter 8
for the generality, not for the order; the layer order is forced by the *Needs:* lines (first
variation needs push-forward, monotonicity needs the Riesz decomposition, rectifiability needs
densities, constancy and tangents) and no layer is named after a source chapter. Shape: Summary,
Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each
ending in Examples and Dependencies, Downstream consumers, References. Every definition or
construction has its API and at least three Checks (plan: 3–6 tests per target). Grep for LaTeX
delimiters, pull-request numbers, machine paths, HTML anchors, round labels, "optional", "deferred",
`lemma` as a keyword: none ("lemma" occurs only in "Gauss lemma" and "multiplicity lemma"). No
backticked name is presented as this roadmap's own.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 image of P ↦ UPU* | U(t) = (t, 0), k = 0, 1 | {0} = {0}; {diag(1,0)} ≠ G(ℝ², 1) | sound |
| 1.2 metric dependence | h = diag(1, 4), u = (1, 1) | h(e₁, u)/h(u, u) = 1/5 against 1/2 | sound |
| 1.3 weight does not determine V | horizontal and vertical lifts, test χ·tr(P diag(1, 0)) | ∫χ against 0 | sound |
| 2.3 weight identity | `|t|^{3/2}` graph; half-line | 2.8794 both sides; support [0, ∞) × {0} | sound |
| 4.1 first variation | circle, X = ψy; vertical lift, X = ψy₂e₂ | 2π = d/dt 2πe^t; ∫ψ ≠ 0 with X = 0 on the support | sound |
| 4.2 Riesz | ⟨X(0), v⟩ with v = 2e₁, 0; ∫(X¹ + X²) | 2δ₀, η = e₁; zero measure; √2 against 2 | sound |
| 4.3 bounded first variation | X_n = n⁻¹ψ sin(ny₂)e₂ on the vertical lift | sup ≤ 1/n, δV(X_n) = ∫ψ: unbounded ratio | sound |
| 4.4 decomposition, dilation | half hyperplane; θ = 1 + y₁²; circle R | −∫X¹: η = −e₁; H = (θ'/θ)e₁; div(Y∘η) = λ⁻¹(div Y)∘η ⇒ λ^{1−k}, |H| = λ/R | sound |
| 4.5 two metrics | g = e^{4t}dt², h = 4g, X = (1 − t²)² | Γ = 2, δ_g = 2, δ_h = 4, left side 2 > 8/(3√3) = 1.5396 | sound |
| 4.5 blow-up | β = λ⁻¹exp⁻¹ | β*g̃_λ = λ⁻²g; mass λ^{−k}, ‖δ‖ λ^{−k}·λ; D_y[g̃(λy)] = O(λ²R) | sound |
| 5.1 C² submanifold | S^k, X = ψx; `|t|^{5/2}` graph | kHᵏ(S^k) both sides; parts identity above | sound |
| 5.2 inclusion | great S^k ⊂ S^N; tangent Y extended | tr B = −kx, H = −kx; X^⊥ = 0 ⇒ δ(ι_#V)(X) = δV(Y) | sound |
| 6.1 identity and signs | circle, σ < 1 < ρ; weighted form | 2π/ρ = 2π − 2π(1 − 1/ρ); kI − ρI' = δV(X) − ρJ' − ∫φ(y − x)·P_S∇h ⇒ minus sign on δV | sound |
| 6.1 exponential form | \|δV(1_{B_t}(y − x))\| ≤ tΛ‖V‖(B_t) | (e^{Λρ}f)' ≥ e^{Λρ}J' ≥ J' | sound |
| 6.2 curvature term | (1 − x cot x)/x at π/2 | 2/π ≤ 1, so the deficiency is ≤ k√κ‖V‖(B̄_t) | sound |
| 6.3 densities | step multiplicity; e^{−1/\|t\|} | δV(X) = −X¹(0), Θ(0) = 3/2 < 2; ratio ≥ ρ^{−2} at a null point | sound |
| 6.4 constancy | H¹⌞L + δ₀; g = e^{2t}dt² | Θ¹ = ∞ at 0; θ̃ = 1, (θ̃w)' = e^t | R01; else sound |
| 6.5 convex hull | X = ψγ(r)(y − ξ); δ_{(0,P)}; K = ∅ | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; {0}; V = 0 | R02 (locator); sound |
| 7.1 semicontinuity | i segments of length 1/(2i) | Θ = 1, ‖δV_i‖ = 2i → ∞, limit density ½ | sound |
| 7.2 tangents | ball masses; angular control | ‖C‖(B_ρ) ≤ Θω_kρ^k ≤ ‖C‖(B̄_ρ) for all ρ ⇒ equality; (π/4)(sin log λ − cos log λ) = −π/4, +π/4 | sound |
| 7.2 stationarity of C | 4.5 bound | R^{k−1}·o(1) + C'λ·Θω_kR^k → 0 | sound |
| 8.1 cones | ½v(L, 1); step multiplicity | ρ⁻¹·½·2ρ = 1 ↛ 0, cone still rectifiable; ρ⁰‖δV‖(B_ρ) = 1 ↛ 0 | sound |
| 8.2 integral cones | x ∉ spt‖V‖; C_{p,q} | Θ = 0, VarTan = {0}; dim p + q + 1 = n in ℝ^{n+1} | sound |
| 9.3 comparison | [[P]] − [[P]]; plane with multiplicity 2 | 0 against v(P, 2); v(P, 2) for both orientations | sound |
| 9.4 statements | K = ∅; punctured ℝ⁸ × {0} ⊂ ℝ⁹; n ≥ 8 | closure = Σ; origin regular and missing; p + q ≥ 7, all C_{p,q} minimizing | sound |

### Sources: the seeded sample, read at the locators

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7300 | Subspaces with the metric of the projections. Match. |
| 1.2 | Simon1983 line 7301–7305 | A × G with product metric, compact over compacts. Match. |
| 1.3 | Simon1983 line 7308–7317 | Varifold, weight, mass, restriction to G_n(A). Match. |
| 4.1 | Simon1983 line 7455–7473, 1948–1964 | 39.2 and 9.3 (derivative of area). Match. |
| 4.3 | Simon1983 line 7474–7486, 7580–7583 | Stationarity, locally bounded first variation, 39.3; 40.7(1). Match. |
| 4.5 | AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1788–1810 | Preservation under a chart asserted at line 1802–1803 without argument, as the README says; the estimate is the roadmap's. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2) (closure condition), 16.6(1). Match. |
| 5.2 | Simon1983 line 2005–2016, 2954–2971, 7674–7682 | 9.6, 16.4, 41.2(3): the term in B of the ambient N. Match, sign included. |
| 6.1 | Simon1983 line 3016–3076, 3205–3221, 7513–7547 | 17.2–17.5, 18.1, 40.1–40.4. Match; 40.4's sign under Source issues. |
| 6.5 | Simon1983 line 3371–3400 | 19.1–19.2, in the rectifiable setting: R02. |
| 7.1 | Simon1983 line 7566–7579 | 40.6 with the exceptional sets B_i and the lim inf bound. Match. |
| 7.2 | Simon1983 line 7733–7774, 3414–3430 | 42.1 (both hypotheses), stationarity, 42.2, 42.3; 19.3. Match. |
| 8.1 | Simon1983 line 7793–7805 | 42.6 with the hypothesis on {Θ < 1}. Match. |
| 9.3 | Simon1983 line 7253–7293 | The varifold of an integer multiplicity current. Supports the construction; the comparison is marked as the roadmap's. |
| 9.4 | Simon2023 line 73–96, 432–441; EdelenSpolaor2023 line 104–135 | n ≥ 3, m ≥ 2, n + m ≥ 8, the convention reg M = M, Theorems 1.1 and 3.7; Definition 1.1.1, Remark 1.2 (n > 7), Theorem 1.4. Match. |

Also read: Simon1983 line 7664–7732 (6.4), 7899–7912 and 7975–7985 (7.6). No locator was flagged
unverified by the author.

### Pins, suppliers, direction, overlaps

- Pins checked by commit (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Opened this round, beyond the
  rows above: `MeasureTheory.integral_divergence_eq_zero`
  (`TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean:30`, on `Fin (n + 1) → ℝ`),
  `TauCeti.Manifold.integral_divergence_eq_zero` (`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:225`),
  `Besicovitch.ae_tendsto_rnDeriv` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1077`, two
  locally finite measures). No Hausdorff-measure versus `riemannianVolume` comparison exists at the
  Tau Ceti pin (grep of `Geometry/Manifold/Riemannian`), so 2.3 duplicates nothing. The other
  library names are unchanged since round 4, where each was opened.
- Suppliers resolved on main: GeometricCurrents G1, G2, G5, G6 (headings at line 137, 240, 583, 668);
  GeometricMeasureTheory G2; RiemannianGeometry R4, R5a, R5a.2, R5b (line 2066, 2840, 2997, 3216);
  HopfRinow under `Completed/`, Layers 0–2 (line 229, 264, 427). None of them is in the list of open
  pull requests given to this job, so there is no revision to drift against.
- Ownership against open work: `roadmaps grep` for "varifold" over main and the open heads finds
  only GeometricCurrents and GeometricMeasureTheory on main (the latter excludes varifolds, line 12);
  a grep for a Hausdorff/Riemannian volume comparison finds nothing. The board package index (three
  number-theory packages) was read. Overlap report: no pull request changes this roadmap, no dropped
  id, no revision-only id; the closest roadmaps (ManifoldOptimization, PointProcesses,
  QuasiregularMaps, YangMillsConnectionsAndCaloricGauge) were compared in the earlier rounds and own
  none of these objects.
- Dependency check:

      candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
      depcheck: 207 roadmaps, 1914 edges, 0 problem(s)

  No UPWARD or CYCLE line. The worker's citation report lists no citation and no Lean name found
  nowhere.

### Headlines and Lean form

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity, Euclidean and Riemannian
(6.1–6.2); densities (6.3); Allard's rectifiability theorem (7.3); compactness of rectifiable and
integral varifolds (7.4, 7.6); varifold tangents and cones (7.2, 8.1–8.2); constancy (6.4); intrinsic
against ambient (5.2); comparison with GeometricCurrents G6 (9.3). This is the design stage: there
is no `Suggested.lean`, so no padding probe, no binder check and no import header apply.
Elaboration: not available (this lane does not elaborate). For the package: the general-varifold
headlines (4.4, 6.1–6.3, 7.2, the measure part of 7.4) are statable on native carriers with a few
real definitions; those needing weighted approximate tangent planes, submanifold predicates or the
supplier's currents (7.3's conclusion, 7.6, 8.x, 6.4, 5.2, 9.3) are to be named in the module
docstring with the missing carrier unless stated without stand-ins.

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- 7.5 for h ≠ e: no accessible source states it; the README marks it as its own. Its statement and
  route are unchanged since round 4 and were not in this round's sample; the formulas of Simon1983
  42.9–42.10 are partly lost in the extracted text.
- GeometricCurrents G2 states its "manifold/chart comparison" in one clause (main, line 244–245);
  that it will carry the Jacobian form 2.3's route uses is a contract with the supplier, not
  something the supplier's text lets me confirm.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Misprint** in Simon1983 at 40.4, printed page 236: the source says the weighted radial identity carries the first variation with a plus sign; it should be a minus sign, as 18.1 with the first variation equal to minus the mean-curvature integral gives; affects a stated result.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and N converges to the limit multiplicity; it should be the minimum, since a maximum with N above the limit cannot converge to it; affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at proof of Theorem 2.32, arXiv v3 page 17: the source says locally bounded first variation is preserved by a bi-Lipschitz chart push-forward, without argument; it should be supplying a metric comparison, since the change of metric adds a term in the derivative of the test field; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "71576783269cfc7f8b25c8c4938fa81dcfd77ab9", "job": "REV-DESIGN-Varifolds~5", "model": "fable", "worker": "chris-x10"} -->
