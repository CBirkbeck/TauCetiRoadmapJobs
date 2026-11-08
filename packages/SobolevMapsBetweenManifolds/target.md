Verdict: design
Name: SobolevMapsBetweenManifolds
Base: none
Owner: none

## Scope

The roadmap builds the first-order local Sobolev classes of maps between smooth manifolds,
their weak differentials, and, in the oriented equidimensional Riemannian case, the operator
norm of the differential and the Jacobian, in the generality of the manifold-valued
definition used in geometric function theory (HeikkilaPankka2025 lines 20–27: a continuous
map between oriented Riemannian `n`-manifolds in `W^{1,n}_loc(M, N)`, with the operator norm
`‖Df‖` of the weak differential and the Jacobian determinant `J_f`) and of the
embedding definition of Sobolev mappings between manifolds (Hajlasz2009 lines 20–28).
Throughout, manifolds are smooth, Hausdorff, second countable and without boundary, modelled
on finite-dimensional real inner product spaces; `1 ≤ p ≤ ∞`; "null set" on a manifold is
DifferentialGeometry 10.2's chartwise `IsNullSet`, and no measurable structure is installed on
a manifold beyond the `[MeasurableSpace M] [BorelSpace M]` that a measure on `M` carries
(DifferentialGeometry conventions).

**Owned here.**

1. *Euclidean local vector-valued classes and the chain rules.* For an open `Ω` of a
   finite-dimensional real inner product space `E` and a finite-dimensional `F`, the class
   `W^{1,p}_loc(Ω; F)`: maps whose restriction to every relatively compact open `V ⋐ Ω` is in
   `W^{1,p}(V)` coordinatewise, equivalently maps with a `HasWeakFDerivOn` derivative
   `Du : Ω → E →L F` such that `u` and `Du` are `L^p` on compact subsets. Its API: coordinate
   and basis independence, closure under continuous linear maps, restriction, the sheaf
   property (membership on each set of an open cover gives membership on the union), and
   agreement with Tau Ceti's `W1p` for `F = ℝ` on relatively compact subdomains. The three
   chain rules of T1: precomposition with a `C¹` diffeomorphism (or `C¹` local
   diffeomorphism) `θ : Ω' → Ω` with `D(u ∘ θ) = (Du ∘ θ) Dθ` a.e.; postcomposition of a
   *continuous* `u` with values in an open `W ⊆ F` by a `C¹` map `G : W → F'` with
   `D(G ∘ u) = (DG ∘ u) Du` a.e.; and locality. No boundedness of `Dθ`, `Dθ⁻¹` or `DG` is
   assumed: the local class is what makes the statements unconditional. The scalar Tau Ceti
   chain rule (`W1p.hasWeakFDerivOn_comp`, Lipschitz `C¹` function of one variable) and the
   global bounded-derivative composition theorems planned by the sibling pull requests
   (SobolevPolynomialApproximation §2.1, SobolevDifferentialForms §4.1) are the global
   special cases; the local statements are proved here by exhaustion and cut-off, with the
   standard references Ziemer1989 (Theorem 2.1.11, Theorem 2.2.2) and Mazya2011 (§1.1).
2. *Null sets on manifolds and the Riemannian volume.* With `IsNullSet` read through charts
   against Haar measure on the model (DifferentialGeometry 10.2), prove that a set is null
   iff it is null for Tau Ceti's `riemannianVolume` of any Riemannian metric, through
   `riemannianVolume_restrict_source` and the positivity and continuity of
   `chartVolumeDensity`. Hence "almost everywhere" on a manifold has one meaning. (One owner:
   if RiemannianGeometry R6's chart-nullity remark lands first as a theorem, consume it.)
3. *The continuous class `W^{1,p}_loc(M, N)`.* For continuous `f : M → N` and charts `φ` of
   `M`, `ψ` of `N`, the local representative `f_{φψ} = ψ ∘ f ∘ φ⁻¹` on the open set
   `φ(U ∩ f⁻¹(V))`. The class is the set of continuous `f` all of whose local representatives
   lie in `W^{1,p}_loc` (item 1, with `F` the model of `N`). Prove T2 (one atlas of each
   suffices) by the chain rules and the sheaf property, and construct the weak differential
   `Df`: an a.e.-defined field `Df(x) : T_xM → T_{f(x)}N`, chart-measurable, unique up to null
   sets, with `dψ_{f(x)} ∘ Df(x) ∘ (dφ_x)⁻¹ = D f_{φψ}(φ(x))` a.e. on each chart overlap.
   Smooth (indeed `C¹`) maps lie in the class with `Df = mfderiv f` a.e.; restriction to open
   subsets; precomposition with `C¹` local diffeomorphisms and postcomposition with `C¹` maps
   preserve the class, with the manifold chain rule a.e.
4. *Metrics: the operator norm and the `L^p` characterisation.* Given Riemannian metrics on
   `M` and `N` (Mathlib's `IsRiemannianManifold` through `RiemannianBundle`), the measurable
   function `‖Df‖ : M → [0, ∞)` (operator norm with respect to `g_M`, `g_N`), its chart
   comparison with the Euclidean operator norm up to locally bounded factors, and T3: a
   continuous `f` with local representatives in `W^{1,1}_loc` lies in `W^{1,p}_loc(M, N)` iff
   `‖Df‖ ∈ L^p_loc(M, vol_M)`. Uniformly comparable metrics change `‖Df‖` by bounded
   factors (consumed by QuasiregularMaps item 3).
5. *The Jacobian in the oriented equidimensional case.* For `dim M = dim N = n`, `M`, `N`
   oriented (DifferentialGeometry Layer 2) and Riemannian, with volume forms `vol_M`, `vol_N`
   (DifferentialGeometry 12.4), define `J_f` a.e. by `(Df)^* vol_N = J_f vol_M` (pointwise
   pullback of a top form by the linear map `Df(x)`), prove the chart formula of T4 in
   positively oriented charts, Hadamard's inequality `|J_f| ≤ ‖Df‖ⁿ` a.e. (from the linear
   inequality `|det A| ≤ ‖A‖ⁿ` for `A` between `n`-dimensional inner product spaces,
   SuccessiveMinima 0.1.2's Gram–Hadamard bound), hence `J_f ∈ L^{p/n}_loc` and
   `J_f ∈ L¹_loc` when `p ≥ n`. Define the pullback `f^* vol_N := J_f vol_M` as an a.e.-defined
   top form and, when `J_f ∈ L¹_loc(M, vol_M)` (in particular for `p ≥ n`), as the locally
   finite signed measure with density `J_f` with respect to `riemannianVolume`. Sign laws under
   reversal of either orientation; comparison with `LinearMap.normDet`: `|J_f| = normDet(Df)`
   a.e., so that GeometricMeasureTheory's Jacobians and this one agree.
6. *The extrinsic description through an embedding.* For a smooth embedding
   `ι : N → ℝ^l` (Mathlib `IsSmoothEmbedding`; one exists for compact `N` by Whitney,
   `exists_embedding_euclidean_of_compact`), T5: a continuous `f : M → N` lies in
   `W^{1,p}_loc(M, N)` iff `ι ∘ f ∈ W^{1,p}_loc(M, ℝ^l)` (item 3 with `N = ℝ^l`), with
   `D(ι ∘ f) = dι ∘ Df` a.e., and `‖Df‖ = ‖D(ι ∘ f)‖` a.e. when `ι` is isometric for `g_N` and
   the Euclidean metric. This is the definition of HeikkilaPankka2025 lines 1328–1329 and
   Hajlasz2009 line 28, which the roadmap proves equivalent to the chartwise one for
   continuous maps. The extrinsic class itself,
   `W^{1,p}_loc(M, N; ι) = {u ∈ W^{1,p}_loc(M; ℝ^l) : u(x) ∈ ι(N) for a.e. x}`
   (Hajlasz2009 line 28), is defined here for arbitrary measurable `u`, since the library's
   future users (harmonic maps, the approximation problem of Bethuel1991) need Sobolev maps
   that are not continuous; its independence of `ι` for closed `N` is a stated target (T7).
7. *Compatibility with the Euclidean case* (T6): for `M = Ω ⊆ ℝ^m` and `N = ℝ^k` with
   identity charts and flat metrics, `Df` is the weak Jacobian matrix, `‖Df‖` its operator
   norm, and for `m = k` `J_f = det Df` a.e., the Jacobian of MartioRickmanVaisala1969
   line 124 for the `ACL^n` maps of lines 332–340 (the `ACL^n ⇔ W^{1,n}_loc`
   characterisation itself is QuasiregularMaps T7, not owned here).

**Not owned.** Scalar Sobolev spaces on Euclidean domains, Meyers–Serrin, Morrey's embedding
and the `p = n` borderline (PDE Lane A items 1–4; Tau Ceti `W1p`, `Wkp`); the scalar local
spaces `W^{j,p}_loc(Ω)` by restriction (GeometricCurrents G6, consumed and extended to vector
values); differential forms, pullback `mpullback`, orientations, integration of top forms,
densities, `IsNullSet`, the Riemannian volume form and its bridge to `riemannianVolume`
(DifferentialGeometry Layers 0, 2, 5, 10.2, 12.4); the Riemannian measure itself (Tau Ceti
`riemannianVolume`); the area and coarea formulas and `normDet` conventions
(GeometricMeasureTheory G2); quasiregular maps, distortion, Reshetnyak's theorem and the
`ACLⁿ` characterisation (QuasiregularMaps); two-dimensional quasiconformal maps as
`W^{1,2}_loc` homeomorphisms with the Beltrami equation (TeichmullerGeometry §7.4,
PR #1169); the class `W^{k,p}_loc(Σ, M)` of maps from surfaces with `kp > 2` through
isothermal charts (PseudoholomorphicCurveAnalysis PH4.1, PR #1793, a sibling special case
with higher order and the Morrey regime; a comparison at `k = 1`, `p > 2` is a Check once both
exist); Sobolev spaces of differential forms (SobolevDifferentialForms, PR #1609); the density
of smooth maps in `W^{1,p}(M, N)` (Hajlasz2009 Theorem 2.1, lines 129–137; Bethuel1991),
traces, homotopy classes of Sobolev maps, and Sobolev maps into metric spaces
(Heinonen–Koskela–Shanmugalingam–Tyson): Part II candidates. Nash's isometric embedding
theorem is not needed and not planned: wherever the filed wording invokes a Nash embedding,
the roadmap takes an embedding as a hypothesis and the isometric case as a further
hypothesis.

**Generality notes on the filed wording.**

- The filed chain rule (a) asks for `C^∞` diffeomorphisms; the theorem holds for `C¹`
  diffeomorphisms and `C¹` local diffeomorphisms, which is what chart changes and the
  invariance of QuasiregularMaps need, and is the target (Ziemer1989 Theorem 2.2.2 proves even
  the bi-Lipschitz case, which is a Part II item once GMT's Rademacher calculus is in place).
  The `C^∞` case is a Check.
- The filed definition of `f^* vol_N` as a "locally finite signed measure" is only meaningful
  when `J_f ∈ L¹_loc`; for `p < n` Hadamard gives only `L^{p/n}_loc`. The target carries the
  hypothesis `J_f ∈ L¹_loc(M, vol_M)`, automatic for `p ≥ n`; the `p = n` case of
  HeikkilaPankka2025 is the Check.
- The filed class consists of continuous maps. The sources define the class without
  continuity through an embedding (Hajlasz2009 line 28). The chartwise class needs continuity
  for `f⁻¹(V)` to be open; so the roadmap owns both the continuous chartwise class and the
  extrinsic class for measurable maps, proves them equal for continuous maps (T5), and states
  the independence of the embedding (T7).
- The filed `1 ≤ p ≤ ∞` is kept. At `p = ∞` the weak identities are proved on relatively
  compact subdomains through the finite-exponent case, as Tau Ceti's chain rule requires
  `p ≠ ∞`.
- Domains are open subsets of finite-dimensional real inner product spaces, Tau Ceti's `W1p`
  setting, not only `ℝ^m`; manifolds are modelled on such spaces with `𝓘(ℝ, E)`.

## Final targets

Each is stated for smooth, Hausdorff, second countable manifolds without boundary, `1 ≤ p ≤ ∞`.

- **T1 (Euclidean chain rules).** Let `Ω ⊆ E`, `Ω' ⊆ E'` be open in finite-dimensional real
  inner product spaces and `u ∈ W^{1,p}_loc(Ω; F)` with weak derivative `Du`.
  (a) If `θ : Ω' → Ω` is a `C¹` diffeomorphism, or a `C¹` local diffeomorphism onto an open
  subset, then `u ∘ θ ∈ W^{1,p}_loc(Ω'; F)` and `D(u ∘ θ)(y) = Du(θ(y)) ∘ Dθ(y)` for a.e. `y`.
  (b) If `u` is continuous with values in an open `W ⊆ F` and `G : W → F'` is `C¹`, then
  `G ∘ u ∈ W^{1,p}_loc(Ω; F')` and `D(G ∘ u)(x) = DG(u(x)) ∘ Du(x)` for a.e. `x`.
  (c) If `(Ω_i)` is an open cover of `Ω`, then `u ∈ W^{1,p}_loc(Ω; F)` iff
  `u|_{Ω_i} ∈ W^{1,p}_loc(Ω_i; F)` for all `i`, and the weak derivatives agree a.e. on overlaps.
  (Ziemer1989 Theorem 2.1.11 and Theorem 2.2.2; Mazya2011 §1.1; for `F = ℝ` and Lipschitz
  `G` of one variable the pinned `W1p.hasWeakFDerivOn_comp`.)
- **T2 (independence of charts and the weak differential).** For continuous `f : M → N`, if
  the local representatives `f_{φψ}` for the charts of one atlas of `M` and one of `N` lie in
  `W^{1,p}_loc`, then they do for all charts. There is an a.e.-defined field
  `Df(x) : T_xM → T_{f(x)}N`, unique up to null sets, whose chart expressions are measurable
  and satisfy `dψ_{f(x)} ∘ Df(x) ∘ (dφ_x)⁻¹ = Df_{φψ}(φ(x))` for a.e. `x ∈ U ∩ f⁻¹(V)`; null
  sets of `M` are the `IsNullSet`s of DifferentialGeometry 10.2 and coincide with the null sets
  of `riemannianVolume` for every Riemannian metric. For `C¹` `f`, `Df = mfderiv f` a.e.
  (Standard; Lee2012 Ch. 6 for chartwise null sets; the class of HeikkilaPankka2025
  lines 22–23.)
- **T3 (the `L^p` characterisation).** For Riemannian `M`, `N` and continuous `f : M → N`
  whose local representatives lie in `W^{1,1}_loc`: `f ∈ W^{1,p}_loc(M, N)` iff
  `‖Df‖ ∈ L^p_loc(M, vol_M)`, where `‖Df(x)‖` is the operator norm from `(T_xM, g_M)` to
  `(T_{f(x)}N, g_N)`, a measurable function of `x`. Metrics uniformly comparable to `g_M`,
  `g_N` change `‖Df‖` by a factor bounded above and below by constants depending only on the
  comparability constants. (Standard; Rickman1993 Ch. I §1 for the Euclidean case.)
- **T4 (Jacobian).** Let `dim M = dim N = n ≥ 1`, `M`, `N` oriented Riemannian, and
  `f ∈ W^{1,p}_loc(M, N)`. There is a measurable `J_f`, unique up to null sets, with
  `(Df(x))^* (vol_N)_{f(x)} = J_f(x) (vol_M)_x` a.e.; in positively oriented charts
  `J_f = det(Df_{φψ}) ∘ φ · (√det g_N ∘ ψ ∘ f) / (√det g_M ∘ φ)` a.e.; `|J_f| = normDet(Df)` a.e.;
  reversing one orientation negates `J_f`; Hadamard's inequality `|J_f| ≤ ‖Df‖ⁿ` a.e.; hence
  `J_f ∈ L^{p/n}_loc(M, vol_M)` and `J_f ∈ L¹_loc` when `p ≥ n`. When `J_f ∈ L¹_loc`,
  `f^* vol_N := J_f · riemannianVolume` is a locally finite signed measure on `M`, which for
  `C¹` orientation-preserving `f` is the measure of the pulled-back volume form. (Rickman1993
  Ch. I §1 for `|J| ≤ ‖Df‖ⁿ`; Lee2012 Ch. 15–16 for the chart formula of the volume form;
  the Jacobian measure of HeikkilaPankka2025 lines 25–27.)
- **T5 (embedding characterisation).** Let `ι : N → ℝ^l` be a smooth embedding. A continuous
  `f : M → N` lies in `W^{1,p}_loc(M, N)` iff `ι ∘ f ∈ W^{1,p}_loc(M, ℝ^l)`, and then
  `D(ι ∘ f)(x) = dι_{f(x)} ∘ Df(x)` a.e. If moreover `ι` is an isometric embedding for `g_N`
  and the Euclidean metric, `‖Df‖ = ‖D(ι ∘ f)‖` a.e. for every metric on `M`. (Hajlasz2009
  line 28 and HeikkilaPankka2025 lines 1328–1329 take this as the definition.)
- **T6 (Euclidean compatibility).** For `M = Ω ⊆ ℝ^m` open, `N = ℝ^k`, the identity charts
  and flat metrics, `f ∈ W^{1,p}_loc(M, N)` iff `f ∈ W^{1,p}_loc(Ω; ℝ^k)` and is continuous,
  `Df` is the weak Jacobian matrix, `‖Df‖` its Euclidean operator norm, and for `m = k`,
  `J_f = det Df` a.e. (MartioRickmanVaisala1969 line 124 and lines 332–340.)
- **T7 (extrinsic class, stated).** For a closed `N` and two smooth embeddings
  `ι₁, ι₂ : N → ℝ^{l_i}`, a measurable `u : M → N` has `ι₁ ∘ u ∈ W^{1,p}_loc(M; ℝ^{l_1})` iff
  `ι₂ ∘ u ∈ W^{1,p}_loc(M; ℝ^{l_2})`; so `W^{1,p}_loc(M, N)` is defined for measurable maps
  into a closed manifold independently of the embedding, and contains the continuous class
  of T2 as the subset of continuous maps. (Hajlasz2009 lines 23–28; the proof needs a smooth
  retraction of a tubular neighbourhood of `ι₂(N)`, see Risks.)

## Suppliers

- **PDE** (main), Lane A items 1 and 4: weak derivatives, `W^{1,p}(Ω)`, Morrey and the
  `p = n` borderline (used only in remarks and Checks: for `p > m` continuity is automatic).
- **Tau Ceti** (pin): `HasWeakFDerivOn` (vector-valued weak Fréchet derivative), `W1p`, `Wkp`,
  `W1p.hasWeakFDerivOn_comp` and `W1p.contDiffComp` (scalar Lipschitz chain rule),
  `W1p.restrictL`, the Morrey file; `riemannianVolume`, `chartRiemannianVolume`,
  `chartVolumeDensity` with `chartVolumeDensity_changeChart` and
  `chartVolumeDensity_eq_abs_det_mul_of_inner_mfderiv`, `riemannianVolume_restrict_source`;
  `Orientable` and `IsOrientedAtlas` (oriented-atlas orientability, with
  `IsOrientedAtlas.det_fderivWithin_pos`).
- **GeometricCurrents** (main), G6: the scalar local spaces `W^{j,p}_loc(Ω)` and `C^{j,α}_loc`
  by restriction to relatively compact opens, finite-cover gluing; extended here to vector
  values.
- **DifferentialGeometry** (main): Layer 0 (`mpullback`, top forms), Layer 2 (`OrientationLift`,
  `Manifold.Orientation`, `IsOrientationPreservingAt`, oriented-atlas criterion), Layer 5
  (integration of top forms and densities), 10.2 (`IsNullSet` through charts), 12.4
  (`riemannianVolumeForm`, `riemannianDensity`, the bridge to `riemannianVolume`).
- **GeometricMeasureTheory** (main), G2: `LinearMap.normDet` as the only geometric Jacobian,
  the area formula (Checks on the Jacobian measure for `C¹` maps).
- **SuccessiveMinima** (main), 0.1.2 `hermitian_gram_hadamard`: the Gram–Hadamard inequality
  behind `|det A| ≤ ‖A‖ⁿ`.
- **RiemannianGeometry** (main), R5a: pullback metric of an isometric immersion, for the
  isometric case of T5.
- **Mathlib**: `mfderiv`, `IsRiemannianManifold`, `IsSmoothEmbedding`,
  `exists_embedding_euclidean_of_compact`, `lintegral_image_eq_lintegral_abs_det_fderiv_mul`
  and the Jacobian change of variables, `LinearMap.normDet_eq_abs_det`.
- **Open pull requests, optional**: SobolevPolynomialApproximation §2.1 (#1612) and
  SobolevDifferentialForms §4.1 (#1609) plan global bounded-derivative composition theorems
  on Euclidean domains; PseudoholomorphicCurveAnalysis PH1.1–1.2 (#1793) plans the planar
  `MemWkpLoc` with composition and change of variables for `kp > 2`. None is on main, none is
  in the merge order, and none covers general `m` and all `p`, so T1 is owned here and
  reconciled with them by Checks if they land first.

## Consumers

- **QuasiregularMaps** (DESIGN, #6283, on the board): imports `W^{1,n}_loc(M, N)`, `Df`,
  `‖Df‖`, `J_f`, Hadamard's inequality, the chain rules and the metric-comparison statements
  by name; its `target.md` names this target as its carrier. The merge order must place
  SobolevMapsBetweenManifolds before QuasiregularMaps.
- Future roadmaps on harmonic maps, regularity of maps into manifolds, and the approximation
  problem (Hajlasz2009 §2; Bethuel1991), which need the extrinsic class of T7.
- PseudoholomorphicCurveAnalysis PH4.1 (#1793), which could reconcile its surface class at
  `k = 1`, `p > 2` with T2 once both exist.
- The filed consumers CalibratedGeometry (#946, merge order 214) and VariationalMethods
  (#1028) do not refer to manifold-valued Sobolev maps at their current heads (their Sobolev
  needs are PDE Lane A's scalar spaces); they are possible later consumers, not present ones.

## Sources

- HeikkilaPankka2025 (arXiv 2302.11440v2, open repository, certified): lines 20–27 the
  definition of quasiregular maps through `W^{1,n}_loc(M, N)`, `‖Df‖`, `J_f`; lines 1328–1329
  the embedding description `p ∈ W^{1,∞}(M, N)` through `ι ∘ p`. Published version: Ann. of
  Math. 201 (2025), no. 2, Appendix B.
- Hajlasz2009 (author page, certified): lines 20–28 the embedding definition of
  `W^{1,p}(M, N)`; lines 120–137 §2 and Theorem 2.1 (density for `p > n`, not owned).
- MartioRickmanVaisala1969 (Ann. Acad. Sci. Fenn. open site, institutional, certified):
  line 124 the Jacobian, lines 332–340 Definition 2.16 (`ACL`, `ACL^p`), lines 409–412
  Definition 2.20.
- Ziemer1989 (GTM 120, paywalled, uncertified): Theorem 2.1.11 (chain rule), Theorem 2.2.2
  (change of variables), cited by locator.
- Mazya2011 (2nd ed., paywalled, uncertified): §1.1 (basic properties, locality, change of
  variables), cited by locator.
- Rickman1993 (Ergebnisse 26, paywalled, uncertified): Ch. I §1 (`ACL` maps, Sobolev classes,
  the Jacobian, `|J| ≤ ‖Df‖ⁿ`), cited by locator.
- Lee2012 (GTM 218, 2nd ed., paywalled, uncertified): Ch. 6 (sets of measure zero in
  manifolds), Ch. 15 (orientations), Ch. 16 (Riemannian volume form in oriented charts), cited
  by locator; the same chapters DifferentialGeometry cites.
- Bethuel1991 (Acta Math. 167, open on Project Euclid but the sources service received only
  a bot-protection page; uncertified): Introduction, the embedding definition and the
  approximation problem, cited by locator and used only as context for T7.
- Not recorded: Evans–Gariepy Ch. 4 (its chain rule duplicates Ziemer1989's and is equally
  paywalled); Heinonen–Koskela–Shanmugalingam–Tyson Ch. 6–7 (metric targets, out of scope);
  Nash 1956 (not needed: the isometric embedding is a hypothesis of T5).

## Risks

- **Foundations not in the pin.** DifferentialGeometry's `OrientationLift`,
  `Manifold.Orientation`, `IsNullSet` and `riemannianVolumeForm` (Layers 2, 10.2, 12.4) are
  planned on main but absent from the pinned Tau Ceti, which has only the oriented-atlas
  `Orientable` and the measure `riemannianVolume`. The design must import them by section and
  write `Suggested.lean` with the pinned vocabulary (oriented atlases, `chartVolumeDensity`,
  `riemannianVolume`), which is possible for every target above.
- **No local or vector-valued Sobolev carrier in the pin.** Tau Ceti's `W1p` is scalar and
  global on an open set, and the pin has no change-of-variables theorem for `W1p`
  (`W1p.compL`, named by #1612, does not exist in the pin). T1 is therefore real work: the
  local class, its sheaf property and the three chain rules at every `1 ≤ p ≤ ∞`.
- **Slice charts for embeddings.** The direction "`ι ∘ f` Sobolev implies `f` Sobolev" in T5
  needs, near each point of `ι(N)`, a smooth map on an open subset of `ℝ^l` inverting `ι`
  (a slice chart). Mathlib's `IsSmoothEmbedding`/immersion files should be checked for it;
  otherwise it is a lemma to own. T7 needs a tubular neighbourhood with smooth nearest-point
  retraction, which DifferentialGeometry assigns to GeometricTopology; T7 is stated, not
  proved, until that supplier exists.
- **Measurable structure.** DifferentialGeometry installs no measurable structure on
  manifolds; `Df` and `J_f` must be defined through charts, with measurability and the a.e.
  statements phrased against `IsNullSet` and, where a measure is needed,
  `[MeasurableSpace M] [BorelSpace M]` and `riemannianVolume`. Item 2 makes the two notions
  of null set agree.
- **Sources.** The certified texts (HeikkilaPankka2025, Hajlasz2009,
  MartioRickmanVaisala1969) give the definitions but not the proofs of T1–T4; the proofs are
  textbook material whose references are paywalled and cited by locator only. The design
  must write the proofs in its own words from the standard arguments (mollification,
  exhaustion, Fubini), which is feasible for this material. Bethuel1991 could not be read
  despite being open content.
- **Edge cases.** `p = ∞` (Tau Ceti's chain rule needs `p ≠ ∞`; prove through relatively
  compact subdomains); `n = 1` in T4 (`det` of a `1 × 1` matrix, orientation of curves); the
  sign conventions of `J_f` under orientation reversal must match DifferentialGeometry's
  `IsOrientationPreservingAt`.
