Verdict: design
Name: YangMillsConnectionsAndCaloricGauge
Base: none
Owner: none

## Scope

A new analytic gauge-theory roadmap on Euclidean space: finite-energy connections on `ℝ⁴` with
values in a compact Lie group, their topological class and characteristic numbers, the Yang–Mills
heat flow at critical regularity, and the caloric gauge with its manifold of caloric connections.
It is the common ground of the four Oh–Tataru papers on the hyperbolic Yang–Mills equation, and it
stops exactly where the hyperbolic equation begins: it owns no wave equation, no Strichartz or
null-form estimate and no Minkowski-space statement.

**Setting (fixed for the whole roadmap).** `G` is a compact Lie group, realised as a closed
subgroup of `U(N)` (every compact Lie group has a faithful unitary representation; the roadmap may
take the embedding as part of the data), with Lie algebra `𝔤 ⊆ 𝔲(N)` and a bi-invariant inner
product `⟨·,·⟩`, which exists for every compact `G` (OhTataru-YMHF lines 100–102). Connections on
`ℝ^d` are `𝔤`-valued 1-forms `A = A_j dx^j`; the covariant derivative is `D_j = ∂_j + ad(A_j)`, the
curvature is `F_jk = ∂_j A_k − ∂_k A_j + [A_j, A_k]`, and a `G`-valued map `O` acts by
`A ↦ O A O⁻¹ − (∂O) O⁻¹`, `F ↦ O F O⁻¹` (OhTataru-YMHF lines 103–118). This is
SmoothBundlesConnections B4.2's left action `u·A = Ad(u)A − du·u⁻¹` in the trivial bundle, so the
sign conventions agree with the library's.

**The roadmap owns:**

1. *Rough connections and gauge transformations on open subsets of `ℝ^d`, `d ≥ 3`.* The classes
   `A^{1,d/2}_loc(X)` of connections with `W^{1,d/2}_loc` potential and `L^{d/2}_loc` curvature, and
   the groups `G^{k,p}_loc(X)` of `W^{k,p}_loc` matrix functions with values a.e. in `G`
   (OhTataru-TopClass lines 283–289); closure of `G^{2,d/2}_loc` under product and inverse; the gauge
   action on `A^{1,d/2}_loc`, with gauge invariance of `‖F‖_{L^{d/2}}` and, in `d = 4`, of the energy
   `ℰ_e(a) = ½∫⟨F_jk, F^jk⟩` (OhTataru-YMHF lines 124–130). The filed wording (`H¹_loc` potentials,
   `L²` curvature, `H²_loc` gauges) is the case `d = 4`, which the roadmap states as the
   specialisation and uses from then on.
2. *Uhlenbeck's lemma for a general compact `G`.* On the unit ball, a connection with
   `‖F‖_{L^{d/2}} < ε₀` has a `G^{2,d/2}` gauge, unique up to a constant, in which the potential is
   divergence-free, has vanishing normal component on the boundary and is bounded in `W^{1,d/2}` by
   `‖F‖_{L^{d/2}}`, together with the continuity of this gauge under `W^{1,d/2}` convergence
   (OhTataru-TopClass lines 1358–1371, citing Uhlenbeck-LpCurvature Theorem 1.3); and its punctured-ball
   version, by which a connection on a punctured ball with small `L^{d/2}` curvature extends across the
   puncture (OhTataru-TopClass lines 1398–1412, citing Uhlenbeck-RemovableSingularities). FourManifolds
   F5 states the ball lemma for `G = SU(2)` only, and its removable-singularity and compactness theorems
   for `SU(2)` bundles on closed four-manifolds (see Suppliers and Risks): this roadmap owns the
   general-`G` statements on balls in `ℝ^d` and derives F5's `SU(2)` unit-ball statement as a Check.
3. *Good gauges and topological classes.* The good gauge on a ball under an `L^{d/2}` concentration
   hypothesis (OhTataru-TopClass lines 342–353) and the good global gauge theorem on `ℝ^d`: every
   connection with `L^{d/2}` curvature has a global gauge in which `A = −χ(·/R) O_(∞);x + B` with
   `O_(∞)` smooth and 0-homogeneous into `G` and `B ∈ Ẇ^{1,d/2}` (OhTataru-TopClass lines 367–375);
   the uniqueness of the gauge at infinity up to homotopy and its realisability within a homotopy class
   (lines 397–405); the topological class `[A] ∈ [S^{d−1}, G]` (lines 407–411), its gauge invariance,
   its invariance under adding a `Ẇ^{1,d/2}` form, its locality (line 426–429), and the
   characterisation of the trivial class as the connections gauge equivalent to a `Ẇ^{1,d/2}`
   potential (lines 453–462). For `d = 4` the class lives in `[S³, G] = π₃(G)`.
4. *Characteristic numbers.* For an `Ad`-invariant symmetric `k`-linear form `f` on `𝔤` and `d = 2k`,
   the characteristic number `χ_f(A) = ∫_{ℝ^d} f(F,…,F)` of a connection with `L^{d/2}` curvature,
   its invariance under smooth approximation, and the theorem that it depends only on `[A]` and vanishes
   on the trivial class (OhTataru-TopClass lines 430–448, 460–462). In `d = 4` with `f = −⟨·,·⟩`:
   `χ(a) = −∫⟨F ∧ F⟩`, the pointwise Bogomol'nyi bound `½⟨F_jk,F^jk⟩ ≥ |⟨F ∧ F⟩|` and the integrated
   bound `ℰ_e(a) ≥ |χ(a)|` (OhTataru-TopClass lines 901–906; OhTataru-Threshold lines 237–246). For
   `G = SU(2)` with `⟨X,Y⟩ = −tr(XY)`: `χ(a) = 8π² c₂(a)` with `c₂(a) = (8π²)⁻¹ ∫ tr(F ∧ F)` an integer
   equal to the degree of `O_(∞) : S³ → SU(2) ≅ S³`, and `c₂` classifies `[a] ∈ π₃(SU(2)) ≅ ℤ`
   (OhTataru-TopClass lines 852–860; OhTataru-YMHF lines 327–335). The integrality goes through the
   bundle on `S⁴` clutched by `O_(∞)` and CharacteristicClasses C4's integral comparison; the
   clutching-class-to-`c₂` comparison for `SU(2)` on `S⁴` is FourManifolds F5's.
5. *Harmonic Yang–Mills connections and the ground state.* The equation `D^ℓ F_ℓj = 0` for `H¹_loc`
   connections on `ℝ⁴`, the definition of the ground state energy `E_GS` as the infimum of the energies
   of nontrivial harmonic connections, and the theorem that for noncommutative `G` the infimum is
   finite and attained, and that every nontrivial harmonic connection has either `ℰ_e ≥ 2E_GS` or
   `|χ| = ℰ_e ≥ E_GS` (OhTataru-TopClass lines 910–918; OhTataru-YMHF lines 2905–2918). Its inputs
   are Uhlenbeck's regularity of `H¹_loc` harmonic connections up to `H²_loc` gauge (OhTataru-YMHF
   lines 275–276), the Gursky–Kelleher–Streets energy gap on `S⁴` transported by conformal invariance
   (OhTataru-YMHF lines 348–352; GurskyKelleherStreets-GapTheorem lines 88–125), the BPST instanton
   of charge one with energy `8π²` (FourManifolds F5) and the root-`SU(2)` embedding into a general
   noncommutative `G` (OhTataru-YMHF lines 353–358). The roadmap may state the Uhlenbeck regularity and
   the compactness/bubbling package of OhTataru-YMHF lines 284–301 as targets if it does not prove
   them, but it must state them in full generality.
6. *The Yang–Mills heat flow in `d = 4`.* The covariant flow `F_sj = D^ℓ F_ℓj` on `ℝ⁴ × J`
   (OhTataru-YMHF lines 1541–1544), its gauge invariance, the curvature evolution (lines 1547–1550),
   the local caloric gauge `A_s = 0` and the de Turck gauge `A_s = ∂_k A_k` (lines 1806–1818), the
   energy identity (lines 437–445), the linearised flow (lines 1828–1836) and the dynamic flow with
   the extra component `A₀` (lines 1578–1583). Local well-posedness in `Ḣ¹` and in
   `ℋ = {a ∈ Ḣ¹ : ∂^ℓ a_ℓ ∈ ℓ¹L²}` in the local caloric gauge with locally Lipschitz dependence on data
   (Theorem 5.9, lines 1873–1875); bounds in terms of the caloric size `‖F‖_{L³(J;L³)}` (Theorem 5.10,
   lines 1878–1893); continuation: a maximal `Ḣ¹` solution on `[0, s₀)` has `s₀ = ∞` or
   `‖F‖_{L³L³} = ∞` (Corollary 5.13, lines 1938–1939); small energy gives a global solution with
   `Q(a)² ≲ ℰ_e(a)` (Corollary 5.14, lines 1945–1948); and for a global solution with
   `Q(a) = ‖F‖_{L³([0,∞);L³)} < ∞` the limit `a_∞ = lim A(s)` exists in `Ḣ¹`, is flat, and depends
   Lipschitz-continuously on `a` (Corollary 5.15, lines 1952–1957). The Dichotomy Theorem (Theorem 6.1,
   lines 2562–2589: the maximal solution is global with `Q(a) < ∞`, or bubbles off a nontrivial finite-energy
   harmonic connection at a finite time or at infinity, after rescaling and `H²_loc` gauges) and the
   Threshold Theorem (Theorem 6.6, lines 2833–2837: `ℰ_e(a) < 2E_GS` gives a global solution with
   `Q(a) ≤ Q(ℰ_e(a))`).
7. *The caloric gauge and the caloric manifold.* Caloric connections: `a ∈ Ḣ¹` with `Q(a) < ∞` and
   `a_∞ = 0` (Definition 7.1, lines 3000–3001); the sets `𝒞` and `𝒞_Q` (lines 3280–3282); every
   `Ḣ¹` connection with finite caloric size is gauge equivalent to a caloric one, unique up to constant
   gauge transformations, with the map `Cal` continuous for the gauge-quotient distance and `C¹` on
   `ℋ` (Proposition 7.2, lines 3003–3008); the `ℋ` bound `‖a‖_{Ḣ¹} + ‖∂^ℓ a_ℓ‖_{ℓ¹L² ∩ W^{1,4/3}} ≲_{Q,E} 1`
   for `a ∈ 𝒞_Q` (Proposition 7.7, lines 3286–3288); the caloric manifold theorem: `𝒞` is a `C¹`
   submanifold of the Banach space `ℋ` (Theorem 7.8, line 3294), with the local chart through the
   covariant Coulomb slice `{a + b : D^ℓ b_ℓ = 0}` (lines 3301–3306); the tangent space
   `T_a𝒞 = {b ∈ ℋ : B(∞) = 0}` for the linearised flow `∂_s B_i = D^j(D_j B_i − D_i B_j) + [B^j, F_ji]`
   (lines 3349–3355), its `L²` closure `T^{L²}_a𝒞 = {b ∈ L² : B(∞) = 0}` (lines 3357–3359), and the
   nonlinear div–curl decomposition `w = b − D(a)c`, `b ∈ T^{L²}_a𝒞`, `c ∈ Ḣ¹`, with its bounds and
   the projection `Π_a` (Proposition 7.9, lines 3363–3379). The `L²` tangent bundle
   `T^{L²}𝒞 ⊆ ℋ × L²` of caloric initial data sets `(a, b)`, `a ∈ 𝒞`, `b ∈ T^{L²}_a𝒞`
   (OhTataru-Threshold lines 920–925).

**Boundaries.** Not owned here: the hyperbolic Yang–Mills equation, its initial data sets, the
constraint equation and the caloric-gauge form of the wave equation (OhTataru-YMHF Section 8 onward,
OhTataru-CaloricLWP, OhTataru-Threshold), which are the work of a later roadmap; the Yang–Mills
energy and its variational calculus on closed Riemannian manifolds (FourManifolds F5 for `SU(2)`
on closed four-manifolds; SmoothBundlesConnections, Part II, for general closed manifolds); the
Yang–Mills heat flow on closed manifolds in dimensions two and three (Rade-YMHeat Theorems 1 and 2,
lines 212–223), which is background and a possible later roadmap; instanton moduli spaces, Uhlenbeck
compactification and the ADHM construction (FourManifolds F5, InstantonFloerTheory); Chern–Weil
theory itself (CharacteristicClasses C4); the general Sobolev, Besov and parabolic machinery on
`ℝ^d` (PDE); the Lie-theoretic structure of compact groups (LieGroups, CompactGroups, DGFloer Layer
11.3 for the finite cover `T × K → G` and `π₃`).

**Generality.** The sources support, and the library needs, the following generality, which the
design must adopt: the topological-class layer in every dimension `d ≥ 3` with curvature in `L^{d/2}`
(OhTataru-TopClass is stated for general `d`, lines 277–279 and 367–375), with `d = 4` as the
specialisation; a general compact `G` throughout, with `SU(2)` as the worked case for the instanton
number; all characteristic numbers `χ_f` for `Ad`-invariant symmetric forms `f`, with `f = −⟨·,·⟩`
as the case that gives `χ`; and the heat-flow and caloric layers in `d = 4` exactly, since the
dichotomy and threshold theorems use energy criticality (OhTataru-YMHF lines 762–764). The
Bogomol'nyi bound is a pointwise algebraic inequality for `𝔤`-valued 2-forms on an oriented
four-dimensional inner-product space; state it at that generality.

## Final targets

Each target is a theorem the finished roadmap proves; the locator is the certified text read.

1. **Gauge invariance of finite energy.** For `d ≥ 3`, `X ⊆ ℝ^d` open, `A ∈ A^{1,d/2}_loc(X)` and
   `O ∈ G^{2,d/2}_loc(X)`, the transformed potential lies in `A^{1,d/2}_loc(X)`, its curvature is
   `O F O⁻¹`, and `‖F‖_{L^{d/2}(X)}` is unchanged; for `d = 4` the energy `ℰ_e` is unchanged.
   (OhTataru-TopClass lines 283–292; OhTataru-YMHF lines 103–118, 124–130.)
2. **Uhlenbeck's lemma on the unit ball for general compact `G`.** With `ε₀ = ε₀(d, G)`: if
   `A ∈ W^{1,d/2}(B₁; 𝔤)` and `‖F‖_{L^{d/2}(B₁)} < ε₀`, there is `O ∈ G^{2,d/2}(B₁)`, unique up to a
   constant element of `G`, with `Ã = Ad(O)A − O;x` divergence-free on `B₁`, `x^ℓ Ã_ℓ = 0` on `∂B₁`, and
   `‖Ã‖_{W^{1,d/2}} ≲ ‖F‖_{L^{d/2}}`; the gauge depends continuously on `A` in `W^{1,d/2}` up to constant
   gauge transformations and subsequences. (OhTataru-TopClass lines 1358–1371; Uhlenbeck-LpCurvature
   Theorem 1.3, cited by locator.) The punctured-ball version: a connection on `B'_{1+δ}` with
   `‖F‖_{L^{d/2}(B'_1)} ≤ ε'₀` has a Coulomb gauge on `B'_1` with the same bound, hence extends to an
   `A^{1,d/2}_loc` connection on the full ball. (OhTataru-TopClass lines 1398–1412;
   Uhlenbeck-RemovableSingularities, cited by locator.)
3. **Good global gauge theorem.** For `d ≥ 3`, `A ∈ A^{1,d/2}_loc(ℝ^d)` with `F ∈ L^{d/2}(ℝ^d)`,
   inner concentration radius `≥ r` and outer concentration radius `≤ R` at the universal threshold
   `ε_*`, there is a global gauge in which `A = −χ(·/R) O_(∞);x + B`, with `O_(∞)` a smooth
   0-homogeneous map into `G` and `B ∈ Ẇ^{1,d/2}(ℝ^d; 𝔤)`, with `‖B‖_{Ẇ^{1,d/2}} ≲_{ε_*, R/r} 1` and
   `C^N(S^{d−1})` bounds on `O_(∞)`; higher covariant regularity of `F` passes to `B`. (OhTataru-TopClass
   lines 361–375.) The filed `d = 4` statement (every finite-energy connection is gauge equivalent to
   `−η O_(∞);x + b` with `b ∈ Ḣ¹`) is its specialisation (OhTataru-Threshold lines 1069–1075).
4. **Topological class.** Two good representatives of the same connection have homotopic gauges at
   infinity, every smooth map homotopic to a gauge at infinity is one, and the class is independent
   of the cutoff; hence `[A] ∈ [S^{d−1}, G]` is well defined and gauge invariant; `[A + B] = [A]` for
   `B ∈ Ẇ^{1,d/2}`; each class is path-connected for the `Ẇ^{1,d/2}` distance modulo `G^{2,d/2}_loc`
   gauges; and `[A] = [A']` whenever `A`, `A'` are `L^d(B_{5R})`-close with small `L^{d/2}` curvature
   outside `B_R`. (OhTataru-TopClass lines 397–429.) For `d = 4`, `[S³, G] = π₃(G)` because `G` is a
   topological group (MimuraToda-TopologyLieGroups, cited by locator, for the homotopy groups of
   compact Lie groups; DGFloer Layer 11.3 for `π₃(K) ≠ 0`).
5. **Topological triviality.** A connection with `L^{d/2}` curvature is in the class of `0` if and
   only if it is gauge equivalent to `d + Ã` with `Ã ∈ Ẇ^{1,d/2}(ℝ^d; 𝔤)`; in `d = 4`, if and only if it
   is gauge equivalent to an `Ḣ¹` connection. (OhTataru-TopClass lines 451–462; OhTataru-Threshold
   lines 1066–1067.)
6. **Characteristic numbers depend only on the class.** For `d = 2k` and `f` an `Ad`-invariant
   symmetric `k`-linear form, `χ_f(A) = ∫ f(F,…,F)` converges absolutely for `F ∈ L^{d/2}`, is the
   limit of the characteristic numbers of smooth compactly-curved approximants, depends only on `[A]`,
   and vanishes on the trivial class. (OhTataru-TopClass lines 430–448, 460–462.)
7. **Bogomol'nyi bound.** For `d = 4` and any finite-energy connection,
   `½⟨F_jk, F^jk⟩ ≥ |⟨F ∧ F⟩|` pointwise, so `ℰ_e(a) ≥ |χ(a)|` with `χ(a) = −∫⟨F ∧ F⟩`; equality in the
   integrated bound holds exactly for self-dual or anti-self-dual `F`. (OhTataru-TopClass lines
   860–868, 901–906; Bogomolnyi-Stability, cited by locator.)
8. **The instanton number for `SU(2)`.** With `⟨X,Y⟩ = −tr(XY)`, `χ(a) = 8π² c₂(a)`,
   `c₂(a) = (8π²)⁻¹ ∫_{ℝ⁴} tr(F ∧ F) ∈ ℤ` equals the degree of `O_(∞) : S³ → SU(2) ≅ S³`, and
   `[a] ↦ c₂(a)` is the isomorphism `π₃(SU(2)) ≅ ℤ`. (OhTataru-TopClass lines 852–860, 256–264;
   OhTataru-YMHF lines 327–335, 2913–2915.) Check: the BPST instanton of FourManifolds F5 has
   `c₂ = 1` and `ℰ_e = 8π²`; the trivial connection has `c₂ = 0`.
9. **Ground state energy.** For noncommutative compact `G`, `E_GS` is finite and attained by a
   nontrivial harmonic connection, and every nontrivial harmonic connection `Q` has `ℰ_e(Q) ≥ 2E_GS`
   or `|χ(Q)| = ℰ_e(Q) ≥ E_GS`; for `G = SU(2)`, `E_GS = 8π²`. (OhTataru-TopClass lines 910–918;
   OhTataru-YMHF lines 2905–2918, 348–352; GurskyKelleherStreets-GapTheorem lines 88–125.)
10. **Local well-posedness of the heat flow in the local caloric gauge.** The flow
    `∂_s A_i = D^ℓ D_ℓ A_i − D^ℓ ∂_i A_ℓ`, `A(0) = a`, is locally well-posed in `Ḣ¹`, in `ℋ` and in
    `Ḣ¹ ∩ Ḣ^σ` (`σ ≥ 1`), with locally Lipschitz dependence on the data; the caloric-size bounds of
    Theorem 5.10 hold; a maximal `Ḣ¹` solution on `[0, s₀)` has `s₀ = ∞` or `‖F‖_{L³([0,s₀);L³)} = ∞`.
    (OhTataru-YMHF lines 1817–1818, 1873–1893, 1938–1939.)
11. **Convergence to a flat connection.** For a global `Ḣ¹` solution with `Q(a) < ∞`, `A(s)` converges
    in `Ḣ¹` as `s → ∞` to a flat connection `a_∞`, and `a ↦ a_∞` is Lipschitz in `Ḣ¹`, `ℋ` and
    `Ḣ¹ ∩ Ḣ^σ` on bounded convex sets with a uniform caloric-size bound; small energy gives
    `Q(a)² ≲ ℰ_e(a)`. (OhTataru-YMHF lines 1945–1957.)
12. **Dichotomy and Threshold Theorems for the heat flow.** Either the maximal solution is global
    with `Q(a) < ∞`, or it bubbles off a nontrivial finite-energy harmonic connection at a finite
    time or at infinity in the sense of Theorem 6.1; and `ℰ_e(a) < 2E_GS` implies a global solution
    with `Q(a) ≤ Q(ℰ_e(a))` for a positive function `Q`. (OhTataru-YMHF lines 2562–2589, 2833–2837.)
13. **Existence and uniqueness of the caloric gauge.** Every `Ḣ¹` connection with `Q(ã) < ∞` is gauge
    equivalent to a caloric connection `a = Cal(ã)`, unique up to constant gauge transformations;
    `Cal` is continuous for the quotient distance `d(a₁, a₂) = inf_O ‖O a₁ O⁻¹ − a₂‖_{Ḣ¹}` and `C¹` on
    `ℋ`; below `2E_GS` the caloric representative exists for every `Ḣ¹` connection.
    (OhTataru-YMHF lines 3000–3008, 571–574.)
14. **The caloric manifold and its tangent spaces.** `𝒞_Q ⊆ ℋ` with `‖a‖_ℋ ≲_{Q,E} 1`; `𝒞` is a `C¹`
    submanifold of the Banach space `ℋ`; `T_a𝒞 = {b ∈ ℋ : B(∞) = 0}` and
    `T^{L²}_a𝒞 = {b ∈ L² : B(∞) = 0}` for the linearised flow; `T^{L²}_a𝒞 ∩ D(a)Ḣ¹ = 0`; every
    `w ∈ L²` decomposes uniquely as `b − D(a)c` with `b ∈ T^{L²}_a𝒞`, `c ∈ Ḣ¹`, with the bounds of
    Proposition 7.9 and `c = −Δ⁻¹∇·w + L(a, w)`, `L` at least quadratic. The `L²` tangent bundle
    `T^{L²}𝒞 ⊆ ℋ × L²` is the set of caloric initial data sets. (OhTataru-YMHF lines 3286–3288, 3294,
    3349–3379; OhTataru-Threshold lines 912–925.)

`Suggested.lean` states targets 1, 4–8, 13 and 14 against the pinned libraries; the carriers it
needs that exist at the pins are Mathlib's `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`,
`HomotopyGroup` (π₃) and Tau Ceti's `W1p`/`Wkp` on open subsets of a Euclidean space; the
homogeneous spaces `Ḣ¹`, `ℓ¹L²` and `ℋ` must be defined in the file from Fourier multipliers or
stated through the inhomogeneous carriers with an explicit note.

## Suppliers

All on main unless a pull request number is given; earlier in the merge order than this roadmap,
which is inserted after FourManifolds.

- **SmoothBundlesConnections** B3.1, B4.1, B4.2 (principal connections, curvature, Bianchi, the
  gauge group and its left action `Ad(u)A − du·u⁻¹`), B1.3 (cocycles: the clutching construction of
  the `S^d` bundle from `O_(∞)`), B6.3 (rank-one Chern–Weil as the model). The roadmap works in the
  trivial bundle on `ℝ^d` and uses these for conventions and for the extended bundle on `S^d`.
- **CharacteristicClasses** C4 (invariant polynomials on `𝔤`, Chern–Weil forms, closedness,
  connection independence, and the comparison with the integral classes), C7 (acceptance
  calculations, including `c₂` on `HP¹ = S⁴`); the integrality of `c₂` of the clutched `SU(2)`
  bundle on `S⁴` comes from here.
- **FourManifolds** (#936) Layer 5: the `SU(2)` Yang–Mills calculus on closed four-manifolds, the
  normalisation `k = ⟨c₂,[M]⟩ = (8π²)⁻¹∫tr(F∧F)` and `E = 8π²k + 2‖F⁺‖²`, the BPST instanton on `S⁴`
  with its charge and energy, Uhlenbeck's small-curvature Coulomb gauge on the unit Euclidean 4-ball
  for `SU(2)`, removable singularities and the comparison of the `S³` clutching class with `c₂`. This
  roadmap consumes the `SU(2)` clutching-to-`c₂` comparison and BPST, and owns the general-`G`
  statements on balls in `ℝ^d`.
- **DifferentialGeometry** Layers 0–1 (forms, wedge, exterior derivative), 2 (orientations), 5
  (Stokes), 10 (Brouwer degree of `O_(∞) : S³ → S³`), 12 (metrics; the Hodge star on 2-forms in
  dimension four may be taken from ComplexKahlerGeometry K5a as FourManifolds does).
- **PDE** Layer 1 (`W^{k,p}` on open sets of `ℝ^d`, density, embeddings, the critical embeddings
  `W^{1,d/2} ⊂ L^d`, `W^{2,d/2} ⊂ W^{1,d}`), Layer 2 (interpolation, Calderón–Zygmund, Mihlin
  multipliers), §6.3 (the heat semigroup on `ℝ^d` and its generator), Layer 7 (dyadic blocks `P_k`,
  Bernstein, Littlewood–Paley, homogeneous Besov spaces: `Ḣ^σ = Ḃ^σ_{2,2}`, `ℓ¹L² = Ḃ⁰_{2,1}`,
  `ℓ¹Ḣ^σ = Ḃ^σ_{2,1}`, and the frequency envelopes of OhTataru-YMHF lines 895–928). The filed target
  names PseudodifferentialOperators for the Littlewood–Paley projections; on main those are PDE §7.1's.
- **PseudodifferentialOperators** P5 (Sobolev and `L^p` mapping estimates, Bessel/Besov comparisons)
  where the roadmap needs operator-level statements beyond PDE Layer 7.
- **LieGroups** Layers 0–1 (exponential, `Ad`, `ad`), 6 (compact groups, maximal tori, root
  `SU(2)` subgroups for the embedding `su(2) → 𝔤`); **CompactGroups** (Haar measure, which gives the
  bi-invariant inner product by averaging).
- **AlgebraicTopology** Stage 8 (Hurewicz: `π₃(S³) ≅ ℤ`, so `π₃(SU(2)) ≅ ℤ`); **DGFloer** Layer 11
  item 3 (the finite cover `T × K → G`, `π_j` comparison for `j ≥ 2`, `π₃(K) ≠ 0` for nontrivial
  simply connected semisimple `K`), for the general-`G` topological class.
- **Mathlib**: `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `HomotopyGroup`, Banach
  manifolds (`ModelWithCorners` on a Banach space) for the caloric manifold; **Tau Ceti**:
  `Analysis/Sobolev` (`W1p`, `Wkp`, weak derivatives, mollification, embeddings) at the pin.

## Consumers

- A roadmap for the **hyperbolic Yang–Mills equation on `ℝ^{1+4}`** (not yet filed), which needs
  every target here: finite-energy and caloric initial data sets, the constraint equation, local
  well-posedness in the caloric and temporal gauges, the Threshold Theorem for topologically trivial
  caloric data below `2E_GS` and the Dichotomy Theorem in an arbitrary topological class
  (OhTataru-Threshold lines 428–447, 461–467; OhTataru-CaloricLWP; OhTataru-YMHF Sections 8–9 and
  OhTataru-TopClass Section 1.5).
- A possible roadmap for the **Yang–Mills heat flow on closed manifolds** in dimensions two and
  three (Rade-YMHeat Theorems 1–2, lines 212–223) and for Yang–Mills flow on closed four-manifolds
  (GurskyKelleherStreets-GapTheorem lines 105–125), which would share the covariant-flow
  definitions, the energy identity and the local caloric gauge.
- **FourManifolds** F5 and **InstantonFloerTheory** IF1 do not consume this roadmap (they are
  earlier in the merge order), but a reviewer of either may use target 2 as the general-`G` form of
  F5's `SU(2)` lemma.

## Sources

Manifest: `packages/YangMillsConnectionsAndCaloricGauge/sources.toml`. Locators are into the texts
read (arXiv versions); the design must check the numbering against the published versions it cites.

- `OhTataru-YMHF` — S.-J. Oh, D. Tataru, *The Yang–Mills heat flow and the caloric gauge*,
  Astérisque 436 (2022); read as arXiv:1709.08599v2 (open repository, certified). §1 (lines 100–261:
  setting, equations, scaling), §2 (lines 267–760: review and main theorems), §5 (lines 1541–1957:
  covariant and dynamic flows, local caloric gauge, Theorems 5.9–5.11, Corollaries 5.12–5.15), §6
  (lines 2562–2918: Theorems 6.1, 6.6, 6.10), §7 (lines 2992–3379: Definition 7.1, Propositions
  7.2, 7.7, 7.9, Theorem 7.8).
- `OhTataru-TopClass` — S.-J. Oh, D. Tataru, *The hyperbolic Yang–Mills equation for connections
  in an arbitrary topological class*, Comm. Math. Phys. 365 (2019); read as arXiv:1709.08604v2
  (open repository, certified). §1.2–1.4 (lines 215–466: Theorems 1.3–1.5, Proposition 1.6,
  Definition 1.8, Proposition 1.9, Corollaries 1.10–1.11), §1.6 (lines 845–918: `c₂`, Bogomol'nyi,
  Lemma 1.31, Theorem 1.32), §3.4 (lines 1358–1412: Theorems 3.11–3.12).
- `OhTataru-Threshold` — S.-J. Oh, D. Tataru, *The threshold conjecture for the energy critical
  hyperbolic Yang–Mills equation*, Ann. of Math. 194 (2021); read as arXiv:1709.08606v2 (open
  repository, certified). §1.1.7–1.1.8 (lines 227–292), §1.2 (lines 428–467: Threshold and Dichotomy
  Theorems, the consumer's statements), §2.1 (lines 880–967), §2.3 (lines 1037–1120).
- `OhTataru-CaloricLWP` — S.-J. Oh, D. Tataru, *The hyperbolic Yang–Mills equation in the caloric
  gauge: local well-posedness and control of energy-dispersed solutions*, Pure Appl. Anal. 2 (2020);
  read as arXiv:1709.09332v2 (open repository, certified). Consumer-side background only.
- `GurskyKelleherStreets-GapTheorem` — M. Gursky, C. L. Kelleher, J. Streets, *A conformally
  invariant gap theorem in Yang–Mills theory*, Comm. Math. Phys. 361 (2018); read as arXiv:1708.01157v3
  (open repository, certified). Theorem 1.1 (line 36), Corollaries 1.2–1.3 (lines 88–125): the
  energy gap behind target 9; not in the filed list, added because target 9 needs it.
- `Uhlenbeck-LpCurvature` — K. K. Uhlenbeck, *Connections with Lᵖ bounds on curvature*, Comm.
  Math. Phys. 83 (1982), 31–42; Theorem 1.3. Open access on Project Euclid, but the sources service
  was bot-blocked on every attempt: recorded uncertified and requested in `needs-references.toml`.
- `Uhlenbeck-RemovableSingularities` — K. K. Uhlenbeck, *Removable singularities in Yang–Mills
  fields*, Comm. Math. Phys. 83 (1982), 11–29; Theorem 4.1. Same situation as the previous entry.
- `Rade-YMHeat` — J. Råde, *On the Yang–Mills heat equation in two and three dimensions*, J. reine
  angew. Math. 431 (1992), 123–163; read from GDZ (open repository, OCR text, certified). Theorems 1
  and 2 (lines 212–223). Background for the closed-manifold flow; not needed for any target.
- `FreedUhlenbeck-Instantons` — D. S. Freed, K. K. Uhlenbeck, *Instantons and Four-Manifolds*,
  2nd ed., MSRI Publ. 1, Springer 1991, Ch. 1–3. Paywalled (Springer; no free copy on the SLMath
  site was found, contrary to the filed note): uncertified, cited by locator.
- `DonaldsonKronheimer` — S. K. Donaldson, P. B. Kronheimer, *The Geometry of Four-Manifolds*,
  Oxford 1990, Ch. 2 and Ch. 4. Paywalled: uncertified, cited by locator.
- `Bogomolnyi-Stability` — E. B. Bogomol'nyi, *The stability of classical solutions*, Sov. J.
  Nucl. Phys. 24 (1976), 449–454. Paywalled, no open copy: uncertified, cited by locator; the bound
  is proved in `OhTataru-TopClass` lines 860–868 and 901–906.
- `MimuraToda-TopologyLieGroups` — M. Mimura, H. Toda, *Topology of Lie Groups, I and II*, AMS
  Transl. Math. Monogr. 91, 1991. Paywalled: uncertified, cited by locator for `π₃` of compact
  connected Lie groups; the library's own route is DGFloer Layer 11.3 plus AlgebraicTopology Stage 8.

## Risks

- **Homogeneous function spaces are far above the pin.** The whole heat-flow and caloric layer lives
  in `Ḣ¹(ℝ⁴)`, `Ḣ^σ`, `ℓ¹L²`, `ℓ¹Ḣ^σ`, mixed norms `L^pL^q` in heat-time, and frequency envelopes.
  Tau Ceti has `W^{k,p}` on open sets; PDE Layers 6–7 (heat semigroup, dyadic blocks, homogeneous
  Besov spaces) are planned but unbuilt. The design must consume PDE §7.1–7.2 by name and may need
  to state `Suggested.lean` headlines through inhomogeneous carriers with explicit notes.
- **The parabolic core is deep.** Targets 10–12 rest on the solvability theory for `Δ_A` and
  `∂_s − Δ_A` with frequency envelopes (OhTataru-YMHF Theorem 4.1, lines 963–970), the infinitesimal
  de Turck trick through the dynamic flow (lines 765–826), Uhlenbeck compactness and bubbling for
  harmonic connections (lines 284–301), and the energy gap of Gursky–Kelleher–Streets on `S⁴`. A
  design that states these as targets with `sorry` must still state them at full generality and
  must not plan the compact-base `SU(2)` compactness that FourManifolds F5 owns.
- **Ownership overlap with FourManifolds F5.** F5 (pull request #936, under review) owns
  Uhlenbeck's unit-ball Coulomb gauge, removable singularities and compactness for `SU(2)`. This
  roadmap needs the same lemmas for a general compact `G` in the critical `W^{1,d/2}` class on balls
  in `ℝ^d`. Two proofs of one lemma at two generalities is a design defect; the clean resolution is
  that this roadmap owns the general-`G` ball lemmas and derives F5's `SU(2)` statement as a Check,
  and that a human decides whether F5 should instead import them (which would reverse the supply
  direction and is not possible while this roadmap is later in the merge order).
- **Sources the service cannot read.** Both Uhlenbeck papers are open on Project Euclid but the
  fetcher is bot-blocked; the certified restatements in `OhTataru-TopClass` Theorems 3.11–3.12 cover
  what the triage needs, and the design can proceed on them, but the originals should be supplied
  locally or waived. Freed–Uhlenbeck, Donaldson–Kronheimer, Mimura–Toda and Bogomol'nyi are
  paywalled and are cited by locator only; nothing in the targets depends on their text.
- **Numbering drift.** All Oh–Tataru locators are into arXiv v2 texts; the published Astérisque,
  CMP and Annals versions may renumber. The design must cite the version it reads, with a
  `version_note`.
- **`π₃(G)` for general `G`.** The identification `[S³, G] = π₃(G)` and the structure of `π₃` of
  compact Lie groups are not in the library; DGFloer Layer 11.3 proves only `π₃(K) ≠ 0`. The targets
  need `π₃(SU(2)) ≅ ℤ` (AlgebraicTopology Stage 8) and the set `[S³, G]`; the full `π₃(G) ≅ ℤ^m`
  (Mimura–Toda) is background, not a target.
- **The caloric manifold is only `C¹`.** `Cal` and `a ↦ a_∞` are `C¹` and possibly no better
  (OhTataru-YMHF lines 3295–3296); a design must not promise smoothness, and Mathlib's `C^n` Banach
  manifold API must be used at `n = 1`.
