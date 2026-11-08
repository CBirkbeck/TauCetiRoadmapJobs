Verdict: design
Name: Varifolds
Base: none
Owner: none

## Scope

The roadmap builds the general theory of k-varifolds on an open subset W of a smooth Riemannian
manifold (M, g) without boundary, Hausdorff, second countable, of dimension N, for 1 ≤ k ≤ N, in
the generality of Allard's paper and of Simon's Chapter 8 (`Simon1983` line 7245–7293, which
follows Allard): a varifold is any Radon measure on the Grassmann bundle of unoriented k-planes,
and the theory is developed for varifolds with locally bounded first variation, with stationary
varifolds as the special case of vanishing first variation. The Euclidean case W ⊆ ℝ^N is the
model where every statement is proved first; the Riemannian statements are proved intrinsically
(Levi-Civita connection and flows of compactly supported C¹ vector fields) and compared with the
ambient statements for an embedded submanifold M ⊆ ℝ^L carrying the induced metric. No Nash
embedding theorem is assumed.

Owned here:

- the Grassmann bundle G_k(W) ⊆ G_k(TM) as a locally compact, second countable space with compact
  fibre G(N, k), imported from `GeometricCurrents` G6 (which constructs the unoriented fibre from
  CalibratedGeometry C1's oriented carrier and proves fibre compactness) and extended by the
  metric and chart laws the general theory needs; the varifold carrier (Radon measures on G_k(W)),
  weight ‖V‖ = π_#V, mass, support, restriction to Borel sets, and varifold convergence as
  weak-* convergence against C_c(G_k(W)) (`Simon1983` line 7308–7317);
- rectifiable and integral varifolds v(Γ, θ) of a countably k-rectifiable Γ with locally
  H^k-integrable density θ > 0 (`Simon1983` line 2861–2897 and 7318–7326), the multiplicity-one
  varifold [Σ] of a C¹ embedded k-submanifold closed in W with locally finite area, the tangent
  space with multiplicity of a general varifold and the first rectifiability theorem
  (`Simon1983` line 7333–7349);
- push-forward under a C¹ map proper on spt‖V‖, with the k-Jacobian weight (`Simon1983` line
  7443–7454 and 2903–2926), functoriality, and the explicit scaling law of homotheties;
- the first variation δV, its tangential-divergence formula, locally bounded first variation,
  the Riesz decomposition into generalised mean curvature, generalised boundary measure and
  co-normal (`Simon1983` line 7455–7509), stationarity, and the smooth comparison with
  `RiemannianGeometry` R5a.2;
- monotonicity for varifolds with locally bounded first variation and a density-ratio bound on the
  first variation (`Simon1983` line 7510–7549 and 2989–3098), the stationary and bounded-mean-
  curvature cases, existence and upper semicontinuity of densities (`Simon1983` line 7550–7579),
  and the Riemannian version with explicit error bounds;
- weak-* compactness of varifolds of locally bounded mass, Allard's rectifiability theorem for
  varifolds with locally bounded first variation and positive density (`Simon1983` line
  7777–7790), the compactness theorem for rectifiable varifolds (`Simon1983` line 7886–7898) and
  the integral compactness theorem (`Simon1983` line 7899–7912; `Allard1972` Section 6);
- varifold tangents (blow-ups) and tangent cones of stationary varifolds, with the integral case
  (`Simon1983` line 7733–7797 and 3414–3430);
- regular and singular sets, locality and chart-independence of every notion, and the intrinsic
  versus ambient comparison for an embedded M ⊆ ℝ^L (`Simon1983` line 2005–2020 and
  2954–2971).

Not owned here: Allard's regularity theorem and every regularity statement beyond the definition
of the regular set; Wickramasekera's stable regularity; min-max (Almgren–Pitts) theory; Brakke
flows and mean curvature flow; curvature varifolds; varifolds in metric spaces; currents and
their homology (`GeometricCurrents`); Euclidean rectifiability, approximate tangent planes, area
and coarea (`GeometricMeasureTheory` G2); perimeter and BV (`GeometricMeasureTheory` G3–G6);
regularity of minimising currents (`GeometricCurrents` G6–G7); the smooth second variation and
stability (`RiemannianGeometry` R5b). Allard's regularity theorem is the natural "Varifolds,
Part II".

Ownership boundary with `GeometricCurrents` G6. That section constructs, for its own regularity
proof, the auxiliary rectifiable varifold of an integral current with restriction, weight,
integer multiplicity, weak convergence, push-forward, first variation under compactly supported
smooth ambient flows, monotonicity with Riemannian error bounds, rescaling and tangent cones,
all for that auxiliary object. The present roadmap imports G6's Grassmann bundle and its
current-to-varifold construction by name, proves the general theorems for arbitrary varifolds
with locally bounded first variation, and proves one comparison theorem: the auxiliary varifold
of an integral current T is the rectifiable varifold v(Γ_T, |θ_T|) of its carrier and its G6
first variation and monotonicity are the general ones evaluated on it. Nothing G6 states is
planned again.

Generality beyond the filing. The filed wording restricts the smooth case to hypersurfaces and
the mean-curvature term to varifolds "with no generalised boundary"; both are special cases.
The targets are stated for k-submanifolds of any codimension and for the full Riesz
decomposition of δV; the hypersurface and boundaryless cases are Checks. The filed monotonicity
is for stationary varifolds; the target is Allard's version for locally bounded first variation
with a density-ratio bound, of which the stationary and bounded-mean-curvature cases are
corollaries.

## Final targets

Conventions: Hᵏ is the normalised Euclidean Hausdorff measure of `GeometricMeasureTheory`,
transported to M through `GeometricCurrents` G2's chart comparison; ω_k is the volume of the unit
k-ball; mean curvature follows `RiemannianGeometry` R5a, H = (1/k) tr B for an immersed
k-submanifold, so that the trace mean curvature is kH. Dilations are η_{x,λ}(y) = λ^{-1}(y − x).

1. **Carrier and convergence** (`Simon1983` line 7295–7317; `Allard1972` Section 3). For W open
   in M, G_k(W) is locally compact, second countable, metrisable, and G_k(K) is compact for every
   compact K ⊆ W. A k-varifold on W is a Radon measure on G_k(W); its weight ‖V‖ = π_#V is a Radon
   measure on W; mass, support spt‖V‖, restriction V ⌞ G_k(A) for Borel A, and varifold
   convergence V_j → V (against every f ∈ C_c(G_k(W))) are defined, with ‖V_j‖ → ‖V‖ weakly when
   V_j → V. Every sequence with sup_j ‖V_j‖(K) < ∞ for each compact K has a varifold-convergent
   subsequence (weak-* compactness of Radon measures on a locally compact second countable
   space). Check: a varifold is not determined by its weight (two distinct k-planes through a
   point with equal weight).

2. **Rectifiable and integral varifolds** (`Simon1983` line 2861–2897, 7318–7349; `Federer1969`
   3.2). For Γ ⊆ W countably k-rectifiable, Hᵏ-measurable, and θ : Γ → (0, ∞) locally
   Hᵏ-integrable, the varifold v(Γ, θ) = (Hᵏ ⌞ θ) lifted along the approximate tangent plane
   T_xΓ, with ‖v(Γ, θ)‖ = Hᵏ ⌞ θ, spt, restriction, and invariance under Hᵏ-null modification of
   Γ and θ. Integral varifolds are those with θ integer-valued a.e. The tangent space with
   multiplicity of a general V at x (the blow-ups (η_{x,λ})_#V, scaled by λ^{-k}, converge to
   θ·v(T, 1)) and the first rectifiability theorem: if V has a tangent space with multiplicity in
   (0, ∞) at ‖V‖-a.e. x, then V = v(Γ, θ) for Γ = {x : T_x, θ(x) exist}, which is countably
   k-rectifiable with θ locally Hᵏ-integrable. The multiplicity-one varifold [Σ] of a C¹ embedded
   k-submanifold Σ closed in W with locally finite area has ‖[Σ]‖ = Hᵏ ⌞ Σ and tangent spaces
   T_xΣ everywhere on Σ.

3. **Push-forward** (`Simon1983` line 7443–7454, 2903–2933; `Allard1972` Section 3). For f :
   W → W' of class C¹ with f proper on spt‖V‖, f_#V is the varifold on W' obtained by pushing V
   forward along (x, S) ↦ (f(x), df_x(S)) with weight the k-Jacobian J_S f(x) of df_x on S, on the
   set where it is nonzero. Then (g ∘ f)_# = g_# ∘ f_#, id_# = id, f_#(v(Γ, θ)) = v(f(Γ), θ') with
   θ' the fibre sum of θ (area formula, `GeometricMeasureTheory` G2), f_#[Σ] = [f(Σ)] for a C¹
   embedding, and ‖f_#V‖(A) ≤ Lip(f)^k ‖V‖(f⁻¹(A)) on a Lipschitz bound. For a homothety
   η_{x,λ} on ℝ^N: ‖(η_{x,λ})_#V‖(A) = λ^{-k} ‖V‖(x + λA), and (η_{x,λ})_#v(Γ, θ) =
   v(η_{x,λ}(Γ), θ ∘ η_{x,λ}⁻¹).

4. **First variation and the Riesz decomposition** (`Simon1983` line 7455–7509, 1868–1872,
   1950–1960, 2934–2951; `Allard1972` Section 4). For a C¹ vector field X with compact support
   in W and its flow φ_t (`TauCeti` smooth flows of compactly supported fields), and a compact K
   ⊇ spt X, the function t ↦ ‖(φ_t)_#V‖(K) is differentiable at t = 0 with derivative
   δV(X) = ∫_{G_k(W)} div_S X(x) dV(x, S), where div_S X = Σ_i ⟨∇_{τ_i} X, τ_i⟩ over an
   orthonormal basis of S (Levi-Civita connection; the Euclidean case has ∇ = D). δV is linear in
   X, depends only on X on spt‖V‖, and is local in W. V is stationary in W if δV = 0 on every
   such X; V has locally bounded first variation if |δV(X)| ≤ C_K sup|X| for spt X ⊆ K, and then
   the Riesz representation gives a Radon measure ‖δV‖ on W, a ‖V‖-measurable H_V (the
   generalised mean curvature), a ‖V‖-null Borel set Z (the generalised boundary), σ = ‖δV‖ ⌞ Z
   (the generalised boundary measure) and a σ-measurable unit field ν with
   δV(X) = −∫ ⟨H_V, X⟩ d‖V‖ + ∫ ⟨ν, X⟩ dσ. Stationarity is equivalent to H_V = 0 and σ = 0.
   Push-forward and dilation laws: δ((η_{x,λ})_#V) is the rescaled δV.

5. **Smooth case** (`Simon1983` line 1950–1960, 2979–2988, 2005–2034; `RiemannianGeometry`
   R5a.2). For a C² embedded k-submanifold Σ ⊆ W, closed in W, with locally finite area,
   δ[Σ](X) = −k ∫_Σ ⟨H, X⟩ dHᵏ with H the averaged mean curvature vector of R5a; so [Σ] has
   generalised mean curvature kH, no generalised boundary, and is stationary in W iff Σ is
   minimal; this agrees with R5a.2's first volume variation for compactly supported variations.
   Check (strictness of the closedness hypothesis): for Σ the open half-hyperplane
   {x_N = 0, x_1 > 0} in W = ℝ^N, Σ is minimal and [Σ] has locally bounded first variation with
   H = 0, generalised boundary {x_N = 0, x_1 = 0} and boundary measure H^{N−2} on it with
   co-normal −e_1, so [Σ] is not stationary. Check: the hypersurface case k = N − 1 with the sign
   convention of the outward unit sphere (B = −gν).

6. **Monotonicity** (`Simon1983` line 7510–7549, 2989–3098; `Allard1972` Section 5). Euclidean
   version: if V has locally bounded first variation in W ⊆ ℝ^N, x ∈ W, and ‖δV‖(B_ρ(x)) ≤
   Λ ‖V‖(B_ρ(x)) for 0 < ρ < ρ_0 ≤ dist(x, ∂W), then ρ ↦ e^{Λρ} ρ^{-k} ‖V‖(B_ρ(x)) is
   non-decreasing on (0, ρ_0), with the identity relating the ratio at two radii to
   ∫ r^{-k-2} |p_{S^⊥}(y − x)|² dV over the annulus. Corollaries: for stationary V the ratio
   ‖V‖(B_ρ(x))/(ω_k ρ^k) is non-decreasing and the density Θ^k(‖V‖, x) exists at every x ∈ W;
   for generalised mean curvature with |H_V| ≤ Λ and no boundary the same with the factor
   e^{Λρ}; the density is ‖V‖-measurable and, for stationary V, upper semicontinuous in x and
   under varifold convergence (`Simon1983` line 7550–7579); Θ^k(‖V‖, x) ≥ 1 on spt‖V‖ for
   integral stationary V. Riemannian version: for V stationary in W ⊆ M and x ∈ W there are
   r_0 > 0 and C depending only on bounds for the curvature of g and the injectivity radius on a
   neighbourhood of x such that ρ ↦ e^{Cρ} ‖V‖(B_ρ(x))/(ω_k ρ^k) is non-decreasing on (0, r_0),
   with the Riemannian distance balls; the density Θ^k(‖V‖, x) exists. Check: a k-plane through
   x has constant ratio equal to its multiplicity; a cone has constant ratio at its vertex.

7. **Rectifiability and compactness** (`Simon1983` line 7777–7790, 7886–7912; `Allard1972`
   Sections 5 and 6). Rectifiability: a varifold with locally bounded first variation and
   Θ^k(‖V‖, x) > 0 for ‖V‖-a.e. x is rectifiable, V = v(Γ, θ). Compactness: if V_j are
   rectifiable with locally bounded first variation, sup_j (‖V_j‖(K) + ‖δV_j‖(K)) < ∞ for every
   compact K, and Θ^k(‖V_j‖, ·) ≥ 1 ‖V_j‖-a.e. outside sets whose ‖V_j‖-measure tends to zero on
   compacts, then a subsequence converges to a rectifiable V with locally bounded first
   variation, Θ^k(‖V‖, ·) ≥ 1 a.e., and ‖δV‖(K) ≤ lim inf ‖δV_j‖(K); stationarity passes to the
   limit. Integral compactness (Allard): if the V_j are integral, so is V. Check: a sequence of
   integral varifolds whose weights converge to a Radon measure with density 1/2 does not
   satisfy the hypotheses (the lower density bound is what excludes it).

8. **Varifold tangents and tangent cones** (`Simon1983` line 7733–7797, 3414–3430; `Allard1972`
   Section 5). For V with locally bounded first variation and x ∈ W with Θ^k(‖V‖, x) ∈ (0, ∞)
   and ρ^{1−k} ‖δV‖(B_ρ(x)) → 0: every sequence λ_j → 0 has a subsequence along which
   (η_{x,λ_j})_#V converges to a stationary varifold C on ℝ^N whose weight is dilation
   invariant, ‖C‖(λA) = λ^k ‖C‖(A), with Θ^k(‖C‖, 0) = Θ^k(‖V‖, x); the set VarTan(V, x) of such
   limits is nonempty and compact. If moreover ρ^{-k} ‖V‖({y ∈ B_ρ(x) : Θ^k(‖V‖, y) < 1}) → 0
   (in particular if V is integral and stationary), every C ∈ VarTan(V, x) is rectifiable,
   invariant under every dilation, (η_{0,λ})_#C = C, hence a cone, and integral when V is
   integral. On a Riemannian manifold the blow-ups are taken in a normal chart at x and the
   limits are stationary cones in T_xM ≅ ℝ^N. Check: for V = [P_1] + [P_2], two k-planes through
   0 in ℝ^N, VarTan(V, 0) = {V} and Θ^k(‖V‖, 0) = 2.

9. **Regular and singular sets, locality, intrinsic versus ambient** (`Simon1983` line
   2005–2020, 2954–2971; `EdelenSpolaor2023` line 109–112). reg V is the set of x ∈ spt‖V‖ with a
   neighbourhood U such that spt‖V‖ ∩ U is a C¹ embedded k-submanifold (the design fixes C¹
   versus C^∞ and records both if needed), sing V = spt‖V‖ ∖ reg V; reg V is open in spt‖V‖,
   sing V is closed, and both are invariant under C¹ diffeomorphisms through push-forward. Every
   notion of 1–8 is local in W (restriction to open W' ⊆ W commutes with it) and independent of
   charts and of the choice of metric within its isometry class. Comparison: for M ⊆ ℝ^L an
   embedded submanifold with the induced metric, W ⊆ M open and V a k-varifold on W, the
   ambient varifold ι_#V on an open set of ℝ^L has δ(ι_#V)(X) = δV(X^⊤) − ∫ ⟨X, tr_S B_M⟩ dV(x,S)
   for every compactly supported C¹ field X on ℝ^L, where B_M is the second fundamental form of
   M; hence V is stationary in W iff ι_#V is stationary against all fields tangent to M, and
   then ι_#V has generalised mean curvature tr_S B_M in ℝ^L, bounded by sup|B_M| on compacts.
   Check: for M = S^{N} ⊆ ℝ^{N+1} and Σ a great k-sphere, ι_#[Σ] has mean curvature
   −k·position.

10. **Statement-level acceptance checks** (`Simon2023` line 89–96, 432–441; `EdelenSpolaor2023`
    line 104–112, 130–141). The definitions of 1–9 suffice to state, with `sorry`, (a) Simon's
    theorem: for n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1 and any closed K ⊆ ℝ^ℓ there are a smooth warped
    metric g on ℝ^{n+m+ℓ}, close to Euclidean with all derivatives, and a smooth embedded
    hypersurface M, stationary as a multiplicity-one varifold for g and strictly stable, with
    sing M = {0} × {0} × K; (b) Edelen–Spolaor's theorem: for a multiplicity-one stationary
    integral n-varifold in B_1 ⊆ ℝ^{n+1}, regular away from 0 with a minimising quadratic-cone
    tangent at 0, every sequence of stationary integral varifolds converging to it is, on B_{1/2}
    and for large index, either regular or singular only at one point of the same cone type.
    These are not targets to prove; they test that the carrier and the notions of varifold
    convergence, tangent cone, regular set and stationarity for a warped metric are the ones the
    literature uses.

## Suppliers

- `GeometricMeasureTheory` G2 (on main): countable k-rectifiability, approximate tangent planes
  with multiplicity and their a.e. uniqueness, tangential differentiation, the area formula and
  the normalised Hausdorff measure Hᵏ. Euclidean only; the manifold transport is imported from
  `GeometricCurrents` G2.
- `GeometricCurrents` (on main) G2 (rectifiable sets and Hᵏ on manifolds, chart comparison) and
  G6 (the unoriented Grassmann bundle, its fibre compactness and chart/isometry laws, the
  auxiliary varifold of an integral current, Radon compactness on the bundle). G6's first
  variation, monotonicity and tangent-cone statements for the auxiliary varifold are imported
  for the comparison theorem in Scope, not reproved.
- `RiemannianGeometry` (on main) R5a (B, S, averaged H and the sign conventions), R5a.1
  (orientation-free volume density) and R5a.2 (first volume variation of an immersion, Euclidean
  and spherical mean-curvature dictionaries); R6 (Hessian of the squared distance) if the design
  proves the Riemannian monotonicity intrinsically.
- `CalibratedGeometry` C1.4 (pull request #946, merge order after `LocalVariationalFieldTheory`):
  the oriented Grassmannian and Stiefel carrier, consumed only through `GeometricCurrents` G6's
  unoriented quotient. Since G6 rests on it, `Varifolds` is inserted in the merge order after
  `CalibratedGeometry`.
- `HopfRinow` (Completed): the Riemannian distance and normal balls.
- Mathlib and Tau Ceti: Radon measures on locally compact second countable spaces, the
  Riesz–Markov–Kakutani theorem, weak convergence of finite measures and Prokhorov's theorem
  (Tau Ceti `MeasureTheory/Measure/Prokhorov.lean`), Hausdorff measure, `LinearMap.normDet`
  for the k-Jacobian, flows of vector fields on manifolds (Tau Ceti
  `Geometry/Manifold/IntegralCurve/SmoothFlow.lean`), `IsRiemannianManifold` and the Levi-Civita
  connection of `HopfRinow`.

## Consumers

- The comparison theorem with `GeometricCurrents` G6 is the only present-day consumer on main or
  on the board, and it runs in the supplier direction (G6 is imported, then compared). No open
  roadmap, pull request or design consumes general varifolds today: `PositiveScalarCurvature`
  (main) follows the Gromov–Lawson surgery route and uses no minimal hypersurfaces; `PositiveMass`
  (#956) consumes `GeometricCurrents` G1–G7 directly; `CalibratedGeometry` (#946) and
  `DESIGN-GaussianIsoperimetryAndClusters` only note the target.
- Future consumers this roadmap is the language for: "Varifolds, Part II: Allard regularity"
  (`Allard1972` Section 8), Almgren–Pitts min-max and the existence of minimal hypersurfaces,
  Brakke flows, Wickramasekera's stable regularity (cited by `GeometricCurrents` as a route it
  does not take), and the two Annals statements of target 10. `DESIGN-GaussianIsoperimetryAndClusters`
  records that its multi-bubble theorem (q ≥ 3) needs interface regularity that no roadmap
  plans; this roadmap supplies the carrier such a regularity roadmap would start from.

## Sources

Recorded in `packages/Varifolds/sources.toml`.

- `Simon1983`: L. Simon, Lectures on Geometric Measure Theory, Proc. CMA ANU 3 (1983). Open
  access PDF of the 1983 edition on the ANU Mathematical Sciences Institute site (institutional;
  also on Project Euclid). Chapter 3 §11 (rectifiable sets and approximate tangent spaces, lines
  2181–2380), Chapter 4 §15–§17, §19 (rectifiable varifolds, first variation, monotonicity,
  tangent cones, lines 2860–3100 and 3370–3445), Chapter 2 §9 (smooth first variation, lines
  1860–2035), Chapter 8 §38–§42 (general varifolds, lines 7245–7912). The primary certified
  source; every target above has a locator in it.
- `Allard1972`: W. K. Allard, On the first variation of a varifold, Ann. of Math. 95 (1972),
  Sections 3–6. Paywalled (JSTOR); `uncertified`, cited by locator.
- `Federer1969`: H. Federer, Geometric Measure Theory, 3.2 and 4.1. Paywalled (Springer);
  `uncertified`, cited by locator.
- `Maggi2012`: F. Maggi, Sets of Finite Perimeter and Geometric Variational Problems, Part II.
  Paywalled (CUP); the author's cvgmt page offers only a synopsis; `uncertified`.
- `Simon2023`: L. Simon, Stable minimal hypersurfaces in ℝ^{N+1+ℓ} with singular set an
  arbitrary closed K ⊆ {0} × ℝ^ℓ, arXiv 2101.06401v2 (open repository), published Ann. of Math.
  197 (2023), no. 3; Theorem 1.1 and Theorem 3.7.
- `EdelenSpolaor2023`: N. Edelen and L. Spolaor, Regularity of minimal surfaces near quadratic
  cones, arXiv 1910.00441v1 (open repository), published Ann. of Math. 198 (2023), no. 3, the
  issue's second article (DOI 10.4007/annals.2023.198.3.2); Definition 1.1.1 and Theorem 1.4.
  This is the "Annals 198 (2023), no. 3" paper the filing describes.

No text is outstanding: the three paywalled works are settled as `uncertified`, and everything
they would be cited for is also located in `Simon1983`.

## Risks

- **Ownership boundary with `GeometricCurrents` G6.** G6 already promises first variation,
  monotonicity with Riemannian error bounds, rescaling and tangent cones for the auxiliary
  varifold of an integral current. A design that restates those for integral currents re-plans
  G6; a design that proves the general theorems and then identifies G6's object by one
  comparison theorem does not. The brief above fixes the second reading; the design must keep
  it, and `GeometricCurrents` cannot be made to consume this roadmap (it is earlier and on main).
- **Allard's integral compactness theorem.** The filing calls it "the required input" but no
  roadmap supplies it, so it is a target here (7). Its proof (`Simon1983` line 7899–7912 only
  states it; the proof is `Allard1972` Section 6, paywalled, and Simon's 42.9–42.10 lemma gives
  the Lipschitz-approximation ingredient at lines 7991–8100) is the hardest single item: a
  Lipschitz approximation of an integral varifold with small tilt-excess relative to its tangent
  plane and the lower density bound. The design should read Simon's proof of 42.4 and 42.7–42.9
  fully (certified) and plan the integrality step from them, since Allard's text cannot be read.
- **Riemannian monotonicity.** `Simon1983` proves monotonicity in ℝ^N and the submanifold-of-
  submanifold comparison (line 2005–2020, 2954–2971) that transfers it to an embedded M ⊆ ℝ^L
  with error from sup|B_M|. An intrinsic proof on an abstract (M, g) needs the Hessian
  comparison for the squared distance in a normal ball (`RiemannianGeometry` R6) and a source
  with the explicit constant; the design must either find a legal source for the intrinsic
  constant or state the Riemannian target for embedded M ⊆ ℝ^L only and prove the abstract case
  through local isometric charts with controlled curvature, which is not a Nash embedding. No
  Nash embedding theorem is in the library or planned.
- **Supplier maturity.** `GeometricMeasureTheory` G2 and `GeometricCurrents` G2/G6 are not
  implemented on main; the roadmap imports them by name and cannot be completed before they
  land. `Suggested.lean` must define the Grassmann bundle it tests against locally and simply
  (the subtype of k-dimensional subspaces of T_xM over x ∈ W, with the product topology) if
  G6's carrier is not yet declared, and state the headline theorems against that.
- **Lean carriers.** Mathlib has no Grassmann manifold carrier (`Module.Grassmannian` is the
  algebraic functor), no rectifiable sets and no varifolds. Radon measures, Riesz representation,
  Hausdorff measure, weak convergence and flows of vector fields exist; weak-* compactness of
  locally bounded Radon measures on a locally compact second countable space must be built from
  Prokhorov on compact exhaustions.
- **Mean-curvature conventions.** `RiemannianGeometry` uses the averaged H and `GeometricCurrents`
  pins its signs to it; Simon's H is the trace. Target 5 is written with the factor k; the
  design must keep one convention and record the translation, or the smooth comparison will
  fail by a factor of k and a sign.
