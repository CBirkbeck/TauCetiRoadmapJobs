Verdict: design
Name: DiracScatteringAndNonlinearFourierTransform
Base: none
Owner: none

## Scope

The first roadmap on one-dimensional Dirac (canonical) systems and on non-linear Fourier
analysis. It owns four library layers and one headline theorem, in this supply order:

- **Layer A, Carathéodory theory of linear systems with a holomorphic parameter.** Existence,
  uniqueness and regularity for the integral equation `Y(t) = Y₀ + ∫₀ᵗ P(s) Y(s) ds` when the
  coefficient is only locally integrable in `t`, and holomorphic dependence on a parameter
  `z` when `P(t, z)` is holomorphic in `z`. Mathlib's Picard–Lindelöf (`IsPicardLindelof`
  in `Mathlib/Analysis/ODE/PicardLindelof.lean`) requires continuity in time and its Gronwall
  lemma (`Mathlib/Analysis/ODE/Gronwall.lean`) is stated for derivative bounds; neither covers
  a merely integrable coefficient. UnboundedOperators (#1027) §4.8 UO-D07 plans "local
  integral-equation existence/uniqueness" for a *fixed* spectral parameter, as a step of its
  Sturm–Liouville and `Ju′ + Vu` endpoint theory; it never states holomorphy in the parameter
  or a global theorem. Layer A owns the general parametric theorem; its fixed-parameter
  corollary is a Check against UO-D07, not a second plan of it.
- **Layer B, Dirac systems with a locally integrable potential and their scattering
  functions.** The fundamental matrix `M(t, z)`, the Hermite–Biehler functions `E, Ẽ`, the
  SU(1,1)-valued matrix `G(t, z)` and the scattering functions `a, b`, with their algebraic
  identities (`det ≡ 1`, the `#`-symmetry, `|a|² − |b|² = 1` on `ℝ`), the outerness of
  `a(t, ·)` in `ℂ₊`, the bounds `|a| ≥ 1`, `|b| < |a|` on the closed upper half-plane, and the
  locality in the potential.
- **Layer C, the scattering limit for an `L²` potential.** Locally uniform convergence of
  `a(t, ·), b(t, ·)` on `ℂ₊`, the non-linear Plancherel identity, and convergence in
  Poisson measure on `ℝ` to the boundary values of the limits, with `|a|² − |b|² = 1` a.e.
- **Layer D, the SU(1,1) non-linear Fourier transform.** `f⌃ = b(∞, ·)/a(∞, ·)`, its
  truncations, the boundary-function statement, the recovery of `(a, b)` from `f⌃`, and the
  elementary properties the transform shares with the linear one (reflection symmetry for real
  potentials, the modulation/shift and rescaling rules, the first-order approximation by the
  linear transform).
- **Layer E, the headline theorem.** Poltoratski's non-linear Carleson theorem: for every
  real `f ∈ L²(ℝ₊)` the truncated transforms `f⌃_T(s)` converge to `f⌃(s)` for almost every
  real `s` (poltoratski2024 line 579–581). Layer E owns what its proof needs and no other
  roadmap plans (see Risks): the spectral measures of the Neumann and Dirichlet problems, the
  de Branges spaces `B(E(t, ·))` with their reproducing kernels and isometric embedding into
  `L²(μ)`, the Szegő condition for `L²` potentials, meromorphic inner functions, and
  Poltoratski's universality and resonance arguments (poltoratski2024 §§6–9; mauth2022 §3).

Boundaries. Hardy spaces of the upper half-plane, Fatou's theorem, the inner–outer
factorisation and the Smirnov class are **not** planned anywhere on main, in an open pull
request or on the board (see Suppliers): ToeplitzOperators T1 builds only the `p = 2` Hardy
space of the unit disc and its radial `L²` limits, GlobalHolomorphicFunctions (#992) is
Runge–Weierstrass–Mittag-Leffler theory (the issue's claim that it supplies bounded
holomorphic functions on the half-plane is wrong), StochasticCalculus (#1030) S6.5.3 owns the
disc nontangential maximal function and a circle maximal function, and Tau Ceti has the
Herglotz and Nevanlinna–Pick representations (`TauCeti/Analysis/Complex/Herglotz.lean`,
`TauCeti/Analysis/Complex/Pick/`) but no Hardy space. The design must either plan a
half-plane Hardy-space layer inside this roadmap, scoped to what Layers C–E consume
(`H^p(ℂ₊)` for `1 ≤ p ≤ ∞`, nontangential limits, outer functions from a boundary modulus
with `log w ∈ L¹(dΠ)`, the Smirnov class `N⁺` and its factorisation, Paley–Wiener `PW_t`),
or carve that layer out as a supplier roadmap `HardySpacesOfTheHalfPlane` placed before this
one in the merge order; the triage recommends the second whenever the layer exceeds a
quarter of the README, because PDE, StochasticCalculus and ToeplitzOperators would all consume
it. Out of scope: inverse scattering, the Riemann–Hilbert approach, the `ℓ^p`/`L^p` theory
of Tao–Thiele Lecture 1 (Christ–Kiselev), the discrete model, the Schrödinger reduction
(denisov2006 §14), integrable systems, and the spectral theory of the Dirac *operator* on
`L²` (UO-D07's endpoint API is imported where Layer E needs a self-adjoint realisation).

Generality. The filed wording takes a real potential throughout. Layers A–D are stated for a
**complex** locally integrable potential `q = f + i g`, the generality of Krein systems
(denisov2006 §4, complex coefficient `A(r)`) and of the Tao–Thiele model (taothiele2012
Lecture 1, coefficients in the unit disc): the coefficient matrix `[[0, e^{−2izt} q],
[e^{2izt} q̄, 0]]` lies in `su(1,1)` for real `z`, so `G(t, x) ∈ SU(1,1)`, `det G ≡ 1` and the
symmetry `G(t, z) = σ conj(G(t, z̄)) σ`, `σ = [[0,1],[1,0]]`, hold verbatim; the Dirac system
`ΩX′ = zX − QX` with real `f` is the case `g = 0`, where in addition `A, B, C, D` are real
entire and `a(t, −z̄) = conj a(t, z)`. Layer A is stated on an arbitrary interval, for a
Banach-space-valued linear system, with the parameter holomorphic on an open `U ⊆ ℂ` (entire
is `U = ℂ`), and the nonlinear Carathéodory theorem with an integrable Lipschitz modulus is in
scope as the general existence statement of which the linear one is the global case. Layer E
stays with **real** `f`, as poltoratski2024 proves it (its line 144–148 only remarks that the
method extends); the complex case is a Risk, not a target.

Conventions the design must pin: `Ω = [[0, 1], [−1, 0]]` with Poltoratski's sign in
`ΩX′ = zX − QX` (poltoratski2024 line 139–143), against Romanov's `JX′ + QX = λX`
(romanov2014 line 231) and Denisov's canonical Dirac form `D = J d/dr + Q` with
`J = [[0,1],[−1,0]]` (denisov2006 line 4245–4258); the `#`-reflection `H^#(z) = conj H(z̄)`;
`a` as `G₂₂` (poltoratski2024 line 490–491 notes that Tao–Thiele's `a` is this roadmap's
`a^#`); the Poisson measure `dΠ = dx/(1 + x²)`; the Fourier transform of Mathlib, so that the
free case gives `E(t, z) = e^{−itz}` and the first-order approximation of `f⌃` is a multiple
of the linear transform evaluated at `−2x` (the design computes the constant). Convergence in
measure is Mathlib's `MeasureTheory.TendstoInMeasure` for the finite measure `Π`.

## Final targets

Layer A (Carathéodory systems). `I ⊆ ℝ` an interval containing `0`, `E` a complex Banach
space, `U ⊆ ℂ` open.

1. **Integral Gronwall lemma with an integrable kernel.** If `u : I → [0, ∞)` is bounded on
   compacts and measurable, `β ∈ L¹_loc(I)` nonnegative, `α ≥ 0`, and
   `u(t) ≤ α + ∫₀ᵗ β u` for `t ≥ 0` in `I`, then `u(t) ≤ α exp(∫₀ᵗ β)`. (Standard; the
   waived coddingtonlevinson1955 Ch. 1 is the classical locator; the filed Mathlib Gronwall
   is the differential form.)
2. **Carathéodory existence and uniqueness, linear case.** For `P : I → L(E)` strongly
   measurable with `‖P‖ ∈ L¹_loc(I)` and `Y₀ ∈ E`, there is a unique locally absolutely
   continuous `Y : I → E` with `Y(t) = Y₀ + ∫₀ᵗ P(s) Y(s) ds` for all `t ∈ I`; it satisfies
   `Y′ = P Y` almost everywhere, `‖Y(t)‖ ≤ ‖Y₀‖ exp(|∫₀ᵗ ‖P‖|)`, the chain rule
   `Y(b) = N(b; a) Y(a)` for the solution operator, and, for `E = ℂⁿ`, Liouville's formula
   `det Y(t) = det Y₀ · exp(∫₀ᵗ tr P)`. Solutions depend continuously on `P` in `L¹` on
   compacts. (coddingtonlevinson1955 Ch. 2, Ch. 1 §7, waived; romanov2014 line 213–224 for the
   estimate (3), `det ≡ 1` and the chain rule in the canonical-system case.)
3. **Nonlinear Carathéodory theorem.** For `F : I × E → E` measurable in `t`, with
   `‖F(t, x) − F(t, y)‖ ≤ L(t) ‖x − y‖` and `‖F(t, x₀)‖ ≤ m(t)` for `L, m ∈ L¹_loc(I)`, the
   integral equation `Y(t) = x₀ + ∫₀ᵗ F(s, Y(s)) ds` has a unique locally absolutely
   continuous solution on `I`; a local version with a ball-restricted Lipschitz bound gives
   existence on a subinterval. Check: Mathlib's `IsPicardLindelof` hypotheses imply these, and
   the solutions agree. (coddingtonlevinson1955 Ch. 2 §1, waived.)
4. **Holomorphic dependence on a parameter.** If `P : I × U → L(E)` is measurable in `t`,
   holomorphic in `z` for a.e. `t`, and for every compact `K ⊆ U` there is `m_K ∈ L¹_loc(I)`
   with `‖P(t, z)‖ ≤ m_K(t)` on `K`, then the solution `Y(t, z)` of 2 is holomorphic in `z`
   for every `t`, jointly continuous, and holomorphic as a map `U → C(J, E)` for every compact
   `J ⊆ I`, with `‖Y(t, z)‖ ≤ ‖Y₀‖ exp(|∫₀ᵗ m_K|)` locally uniformly. Entire coefficients give
   entire solutions. (romanov2014 line 220–222; coddingtonlevinson1955 Ch. 1 §7, waived.)
   Check: for `P` continuous in `t` this is the parametric Picard–Lindelöf theorem; for a fixed
   `z` and `Ju′ + Vu` with `V ∈ L¹_loc` Hermitian it is the local existence statement of
   UnboundedOperators UO-D07.

Layer B (Dirac systems; `q ∈ L¹_loc(ℝ₊; ℂ)`, `z ∈ ℂ`, `t ≥ 0`).

5. **Fundamental matrix.** `M(t, z)`, the solution of `ΩM′ = zM − QM`, `M(0, z) = I`, exists
   uniquely by 2 and is entire in `z` by 4, with `det M ≡ 1` and the chain rule; for real `f`
   (`g = 0`) its entries `A, B, C, D` are real entire. (poltoratski2024 line 136–166, (2.1) at
   line 204; mauth2022 Lemma 14 line 565.)
6. **Hermite–Biehler functions.** `E = A − iC`, `Ẽ = B − iD` satisfy `∂ₜE = −izE + f E^#`
   (poltoratski2024 (2.5) line 293; mauth2022 Lemma 15 line 612) and are Hermite–Biehler:
   `|E(t, z)| > |E(t, z̄)|` for `Im z > 0` and `t > 0` (poltoratski2024 line 175–180; mauth2022
   Lemma 13 line 531; romanov2014 Proposition 4 line 780 for canonical systems), with
   `det [[E, Ẽ], [E^#, Ẽ^#]] = 2i` (poltoratski2024 (2.2) line 205–208), exponential type `t`
   (Krein's theorem, romanov2014 line 226–227), and the modulus and argument equations (2.6),
   (2.7) on `ℝ` (poltoratski2024 line 295–306; mauth2022 Lemma 17 line 646). Free case:
   `E = e^{−itz}`, `A = D = cos tz`, `C = −B = sin tz` (poltoratski2024 line 192–195).
7. **Scattering functions.** `G(t, z)` the solution of `∂ₜG = [[0, e^{−2izt} q], [e^{2izt} q̄,
   0]] G`, `G(0, z) = I` (poltoratski2024 (5.3) line 496–501); `a = G₂₂`, `b = G₂₁`. Prove:
   `G = [[a^#, b^#], [b, a]]` and `a a^# − b b^# ≡ 1`, so `G(t, x) ∈ SU(1,1)` for real `x`
   (poltoratski2024 line 492–503); for real `f`, `a = e^{itz}(E + iẼ)/2`,
   `b = e^{itz}(E − iẼ)/2` (line 484–488) and `a(t, −z̄) = conj a(t, z)`, `a(t, iy) ≥ 1` real;
   the Volterra formulas (5.4) (line 508–517); `G(t, z) = G(T, z)` for `t ≥ T` when `q = 0` on
   `(T, ∞)`; `a(t, 0) = cosh ∫₀ᵗ f` for real `f`.
8. **Outerness and the half-plane bounds.** For each `t`, `a(t, ·)` is bounded and zero-free
   on the closed upper half-plane, outer in `ℂ₊`, with `|a(t, z)| ≥ 1` and `|b(t, z)| < |a(t, z)|`
   for `Im z ≥ 0`, and `b(t, ·)/a(t, ·)` is a holomorphic map of the closed upper half-plane
   into the open unit disc. (poltoratski2024 line 503–507; the discrete
   analogue taothiele2012 Lemma 3 line 296; denisov2006 Theorem 11.1 line 3246–3249 for the
   Krein-system `A⁻¹` outer.)
9. **Non-linear Plancherel identity.** `∫_ℝ log |a(t, x)| dx = c ∫₀ᵗ |q|²`, with the constant
   `c` fixed by the conventions (`c = 1` in Poltoratski's normalisation, `c = π` in Denisov's), for every `t` and every `q ∈ L²_loc`, and
   `log(1 − |b/a|²) = −2 log |a|` on `ℝ`. (poltoratski2024 (5.5) line 545–548 and line 567–568;
   denisov2006 (194) line 3250–3255; taothiele2012 Lemma 6 line 680–683 for the discrete
   model.)

Layer C (the scattering limit; `q ∈ L²(ℝ₊; ℂ)`).

10. **Convergence in the half-plane.** `a(t, ·) → a(∞, ·)` and `b(t, ·) → b(∞, ·)` locally
    uniformly on `ℂ₊` as `t → ∞`; the limits are holomorphic, `a(∞, ·)` is outer and
    zero-free with `|a(∞, z)| ≥ 1`, `|b(∞, z)| ≤ |a(∞, z)|`, and for real `f`,
    `a(∞, iy) ≥ 1` is real. (denisov2006 Theorem 11.1 line 3246–3255, Theorem 11.4 line 3655,
    for Krein systems; its §13 (245)–(248) line 4219–4258 for the Dirac–Krein dictionary;
    poltoratski2024 line 518–529.)
11. **Boundary values and convergence in Poisson measure.** The nontangential boundary
    values `a(∞, x)`, `b(∞, x)` exist a.e.; `a(t, ·)|_ℝ → a(∞, ·)|_ℝ` and
    `b(t, ·)|_ℝ → b(∞, ·)|_ℝ` in `Π`-measure; `log |a(t, ·)| → log |a(∞, ·)|` in `L¹(ℝ)`;
    `|a(∞, x)|² − |b(∞, x)|² = 1` a.e.; and the Plancherel identity 9 holds at `t = ∞` with
    `‖q‖²_{L²(ℝ₊)}`. (poltoratski2024 line 518–548; the Hardy-space inputs mauth2022
    Lemmas 1, 2, 8, 9 line 359–471 with their page locators into garnett2007 Ch. II.)

Layer D (the non-linear Fourier transform; `q ∈ L²(ℝ₊; ℂ)`).

12. **Definition and truncations.** `f⌃ := b(∞, ·)/a(∞, ·)` on `ℂ₊` and a.e. on `ℝ`;
    `f_T := f·1_{(0,T)}` has `f⌃_T = b(T, ·)/a(T, ·)` on the closed upper half-plane (by 7,
    locality). `|f⌃| ≤ 1` on `ℂ₊`, `|f⌃| < 1` a.e. on `ℝ`, `log(1 − |f⌃|²) ∈ L¹(ℝ)` with
    `‖log(1 − |f⌃|²)‖_{L¹(ℝ)} = 2c‖q‖²_{L²(ℝ₊)}` (the constant `c` of 9), and `f⌃_T|_ℝ → f⌃|_ℝ` in
    `Π`-measure. (poltoratski2024 line 550–577.)
13. **Boundary function and recovery.** `f⌃|_ℝ` is the nontangential boundary function of
    `f⌃|_{ℂ₊}` (so `f⌃ ∈ H^∞(ℂ₊)` with norm `≤ 1`); `a(∞, ·)` is the outer function with
    modulus `(1 − |f⌃|²)^{−1/2}` on `ℝ`, normalised by `a(∞, iy) > 0`, and `b(∞, ·) = a(∞, ·)
    f⌃`; hence `(a, b)`, `G(∞, ·)` and (through 10) the whole scattering data are determined
    by `f⌃`. For real `f`, `f⌃(−x) = conj f⌃(x)` a.e. (poltoratski2024 line 504–507 and
    569–577; garnett2007 Ch. II for outer functions, uncertified.)
14. **Elementary rules.** Shift of the potential by `t₀` multiplies `b` by `e^{2izt₀}` and
    fixes `a` (modulation rule); dilation `q(λ·)` rescales `z`; the free case gives
    `f⌃ = 0`; and for `‖q‖_{L¹}` small, `f⌃(x) = ∫₀^∞ conj(q(s)) e^{2ixs} ds + O(‖q‖³_{L¹})`
    uniformly, the linear Fourier transform as first-order approximation (poltoratski2024 line
    565–567; taothiele2012 line 687–688 for the discrete model; the design states the exact
    constants).

Layer E (the headline theorem; real `f ∈ L²(ℝ₊)`).

15. **Non-linear Carleson theorem.** For every real `f ∈ L²(ℝ₊)`, `f⌃_T(s) → f⌃(s)` as
    `T → ∞` for almost every `s ∈ ℝ`. (poltoratski2024 Theorem 1 line 579–581; mauth2022
    Theorem 2 and §3.8 Theorem 6 line 4121.) Check: the stronger form
    `sup_{|z − s| < C/T} |f⌃_T(z) − f⌃(s)| → 0` for a.e. `s` and every `C > 0`
    (poltoratski2024 line 582–586). Corollary: for a.e. real `x` the generalised
    eigenfunctions `M(·, x)` are bounded on `ℝ₊` (poltoratski2024 line 54–57), the question
    of Muscalu–Tao–Thiele. The proof's intermediate statements that are library theorems in
    their own right, and which Layer E owns unless the design carves out a supplier: the
    Neumann and Dirichlet spectral measures `μ, μ̃` with the isometric embeddings
    `B(E(t, ·)) → L²(μ)` (poltoratski2024 line 255–262; the waived debranges1968 §§19–23 and
    remling2018 Ch. 1 by locator; romanov2014 §§2–5), `B(E(t, ·)) = PW_t` as sets for
    `f ∈ L¹_loc` (poltoratski2024 line 269–278; mauth2022 Lemma 18 line 659), the Szegő
    condition `log w ∈ L¹(dΠ)` for `f ∈ L²` (poltoratski2024 line 263–268; mauth2022 Theorem 3
    line 702; denisov2006 Theorem 11.1), and the universality of reproducing kernels near a.e.
    point (poltoratski2024 §6 Lemma 2 line 630).

## Suppliers

- **Mathlib** (pinned): `Mathlib/Analysis/ODE/` (Picard–Lindelöf with continuous time,
  Gronwall in differential form, `ODE_solution_unique*`) as the special cases of 1–4;
  `MeasureTheory.TendstoInMeasure` (`Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`)
  for 11–12; Bochner integration and absolutely continuous functions; the Fourier transform;
  complex analysis (Cauchy integrals, maximum principle, Phragmén–Lindelöf where available).
- **Tau Ceti** (pinned): `TauCeti/Analysis/Complex/Herglotz.lean` and
  `TauCeti/Analysis/Complex/Pick/{Basic,Nevanlinna,Boundary}.lean` (Herglotz and
  Nevanlinna–Pick representations on the disc and the upper half-plane, the Cayley transport
  of measures) and `TauCeti/Analysis/Complex/Poisson/` (disc Poisson integrals) for the
  harmonic-majorant and Poisson-extension steps of 8, 11, 13.
- **OperatorTheory** on main, sub-roadmap **ToeplitzOperators** T1 (`H²` of the disc via
  negative Fourier coefficients, the harmonic-majorant model, radial `L²` convergence):
  the disc model to transport by Cayley where the design prefers it; it supplies no half-plane
  space, no `H^∞`, no outer functions and no nontangential limits.
- **UnboundedOperators** (#1027, board package, not yet in the merge order) §4.8 UO-D07:
  the `L²` realisation of `Ju′ + Vu` with `V ∈ L¹_loc` Hermitian, its maximal and minimal
  operators and endpoint classification; Layer E imports it where a self-adjoint Dirac
  operator and its spectral measure are needed, and the fixed-parameter case of 4 is a Check
  against it. Layer A otherwise supplies UO-D07 with the parametric theorem it lacks; the
  design must place this roadmap before or after UnboundedOperators in the merge order
  consistently with which direction of supply it chooses (the triage recommends after, so
  that Layer E may import UO-D07 and UO-D07 keeps its local-existence step).
- **StochasticCalculus** (#1030) S6.5.3: the disc nontangential maximal function and the
  circle maximal function of a finite measure, with the weak-(1,1) bound; Layer E's maximal
  function `MPμ` of a Poisson extension (poltoratski2024 line 610–622; mauth2022 Lemmas 3–7)
  is its half-plane transport, imported if S6.5.3 is earlier in the merge order, otherwise
  planned here with the Cayley comparison as a Check.
- **PDE** on main: local weak derivatives and `W^{1,1}_loc` on intervals for the absolutely
  continuous solutions of Layer A; its inventory lists the Hardy–Littlewood maximal function as
  to be vendored from the Carleson project and does not own it.
- **GlobalHolomorphicFunctions** (#992): nothing beyond Mathlib's entire-function theory
  (Weierstrass products if the design factors `a(t, ·)` through its zeros); it is not a
  supplier of half-plane function theory.

## Consumers

- **SchrodingerOperatorsAndSpectralTypes** (DESIGN #6282) and future roadmaps on
  one-dimensional Schrödinger and Dirac operators: the Carathéodory layer (fundamental
  matrices entire in the spectral parameter for `L¹_loc` coefficients), the Hermite–Biehler
  functions and the Szegő condition for `L²` potentials (Deift–Killip-type statements).
- **UnboundedOperators** UO-D07, **PDE** §6.2 (Galerkin systems) and **StochasticCalculus**
  (linear SDE comparison arguments): the integral Gronwall lemma and the Carathéodory
  existence theorem with integrable coefficients, which all three lack.
- A future **DeBrangesSpaces** or **CanonicalSystems** roadmap (inverse spectral theory,
  Krein's theorem on exponential type, the de Branges ordering theorem): Layers A–B and the
  spectral-measure statements of Layer E.
- A future **HardySpacesOfTheHalfPlane** roadmap, if carved out, becomes a supplier; otherwise
  this roadmap's Hardy layer is consumed by ToeplitzOperators (half-plane Toeplitz and
  Wiener–Hopf operators, denisov2006 §16), by StochasticCalculus S6.5.3's half-plane form and
  by any roadmap on the Paley–Wiener theorem.
- Non-linear Fourier analysis in the Tao–Thiele sense (the `ℓ²(ℤ)` and `L²(ℝ)` theory, the
  maximal non-linear Carleson operator, the AKNS/Zakharov–Shabat scattering of
  Muscalu–Schlag) and inverse scattering roadmaps consume Layers B–D.

## Sources

Manifest: `packages/DiracScatteringAndNonlinearFourierTransform/sources.toml`.

- `poltoratski2024` — A. Poltoratski, *Pointwise convergence of the non-linear Fourier
  transform*, Ann. of Math. 199 (2024), 741–793; arXiv:2103.13349 v14 read (OCR text; an
  image-only scan). Open repository, certified. §1 (the system, line 136–166), §2 (Hermite–Biehler
  functions, (2.1)–(2.7), line 170–306), §5 (scattering functions, (5.1)–(5.5), Theorem 1, line
  469–586), §§6–9 (proof). Section and equation numbers are cited against the arXiv text; the
  design re-checks them against the Annals version.
- `mauth2022` — L. Mauth, *On pointwise convergence of the non-linear Fourier transform*,
  arXiv:2210.12286 (2022), the expository account the issue attributes to Poltoratski. Open
  repository, certified. §2.1 Lemmas 1–11 (Hardy-space facts with page locators into Garnett),
  §2.3 Lemmas 13–19 (the Dirac-system lemmas with proofs), §3 (the proof in full detail).
- `denisov2006` — S. A. Denisov, *Continuous analogs of polynomials orthogonal on the unit
  circle and Krein systems*, IMRS 2006, Art. ID 54517; arXiv:0908.4049 v1 read. Open
  repository, certified. §4 (Krein systems), §11 Theorem 11.1 and (194)–(195), Theorem 11.4
  (the `L²` scattering limit, outerness, Plancherel), §13 (245)–(248) (Dirac systems), §15
  (scattering theory). The arXiv §§11 and 13 are the published chapters 12 and 14 that
  Poltoratski cites.
- `taothiele2012` — T. Tao, C. Thiele, *Nonlinear Fourier Analysis*, IAS/Park City lecture
  notes, arXiv:1201.5129 v1 read (OCR text). Open repository, certified. Lecture 1 Lemmas 1–3,
  Theorem 1 (discrete SU(1,1) model), Lecture 2 Lemma 6 (Plancherel) and Lemmas 9–14 (the
  `ℓ²` extension); the notes are discrete throughout and state the pointwise-convergence
  question as open (line 675–677).
- `romanov2014` — R. Romanov, *Canonical systems and de Branges spaces*, arXiv:1408.6022 v1.
  Open repository, certified. §0 (fundamental solution, estimate (3), `det ≡ 1`, chain rule,
  Krein's theorem, line 212–227), §1 Example 1 (Dirac equation as a canonical system, line
  229–241), §3 Proposition 4 (Hermite–Biehler property, line 780), §§2–5 (spectral measures,
  for Layer E).
- `garnett2007` — J. B. Garnett, *Bounded Analytic Functions*, GTM 236, Springer 2007, Ch. II.
  Paywalled; recorded `uncertified` with its DOI and cited by locator only (the page locators
  pp. 55, 64, 84 come from mauth2022's references).
- `krein1955`, `debranges1968`, `remling2018`, `coddingtonlevinson1955` — settled as waived by
  the human answer recorded in the manifest; cited by locator only (Krein pp. 637–640; de
  Branges §§19–23; Remling Ch. 1; Coddington–Levinson Ch. 1 §7 and Ch. 2).

No text is outstanding: `needs-references.toml` is not written.

## Risks

- **Size of Layer E.** The headline theorem's proof (poltoratski2024 §§6–9, mauth2022 §3,
  fifty pages of the expository text) rests on the Krein–de Branges direct spectral theory of
  Dirac systems: existence and uniqueness of the spectral measure with the isometric embedding
  `B(E(t)) → L²(μ)` (the de Branges theorem, waived source), the Szegő condition for `L²`
  potentials (denisov2006 §11 through the Dirac–Krein dictionary of §13), reproducing-kernel
  universality, and meromorphic inner functions with the dynamics of their zeros. None of this
  is planned anywhere. The design may find that the spectral theory alone is a roadmap; the
  recommended split is then a supplier `DeBrangesSpacesAndDiracSpectralMeasures` (owning the
  spectral measures, `B(E)`, the Szegő condition) placed before this roadmap, with Layer E
  consuming it. Layers A–D and the statement of 15 are complete without it.
- **Half-plane Hardy spaces are missing from the library.** Items 8, 11, 13 and all of Layer E
  need `H^p(ℂ₊)`, Fatou's theorem, outer functions and the Smirnov class, which no roadmap
  plans (ToeplitzOperators T1 is the disc `p = 2` model only). The only certified text that
  states them is mauth2022 §2.1, with proofs delegated to garnett2007, which is paywalled; the
  design must either prove them from Tau Ceti's Herglotz–Nevanlinna representations and
  Mathlib, or find an open source (Koosis or Hoffman are also paywalled; the design should
  check Duren's *Theory of H^p spaces* status and open lecture notes before requesting a text).
- **Outerness of `a(t, ·)` (item 8).** Poltoratski calls it well known; the certified route is
  Denisov's Theorem 11.1 for Krein systems plus the §13 dictionary, or a direct argument
  (entire of exponential type, bounded and zero-free on the closed half-plane, `a(t, iy) → 1`
  as `y → ∞` to kill the exponential factor). The design must choose and write it out; the
  dictionary between Poltoratski's Dirac system and Denisov's Krein system (`a(r) = 2 Re A(2r)`,
  line 4230, and the normalisation of `E`) carries factor-of-two conventions that must be
  pinned once.
- **OCR texts.** Both poltoratski2024 and taothiele2012 were read from OCR of image-only
  scans; formulas are garbled in places (for instance the scattering-function definitions at
  line 484–488). mauth2022 and denisov2006 have clean text layers and restate every formula the
  design needs; the design cross-checks each displayed identity against them.
- **Merge-order placement relative to UnboundedOperators.** UO-D07 and Layer A touch the same
  local existence statement from opposite sides. The triage places this roadmap after
  UnboundedOperators so that Layer E can import UO-D07; if the design instead wants UO-D07 to
  consume Layer A, ownership of the fixed-parameter existence step moves here and
  UnboundedOperators needs an amendment, which the design must say explicitly.
- **Complex potentials in Layer E.** Poltoratski states the theorem for real `f` only. The
  general-potential version is a remark in the source, so it cannot be a target; the design
  records it as future work and keeps Layers A–D general.
