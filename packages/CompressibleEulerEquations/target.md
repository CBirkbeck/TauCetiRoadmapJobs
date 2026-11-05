Verdict: design
Name: CompressibleEulerEquations
Base: none
Owner: none

## Scope

The roadmap owns the compressible Euler equations of a perfect fluid as a quasilinear symmetric hyperbolic system
together with the causal geometry that a solution defines, on the Galilean spacetime `𝔐 = ℝ_t × Σ` with
`Σ = ℝⁿ` or `Σ = ℝ × (ℝ/2πℤ)^{n−1}`, `n ≥ 1`. Concretely it owns:

1. **The equations.** The isentropic (barotropic) system in the material-derivative form
   `(∂_t + v·∇)ρ = −ρ ∇·v`, `(∂_t + v·∇)v = −ρ⁻¹∇p`, for a smooth equation of state `p = p(ρ)` on an open
   interval of densities with `p′ > 0`, the sound speed `c = √p′(ρ)`, the polytropic family `p = k₀ρ^γ`
   (`k₀ > 0`, `γ > 1`) as the worked example, and the non-isentropic system with the entropy transport
   `(∂_t + v·∇)s = 0` and `p = p(ρ, s)`, `∂_ρ p > 0`, carried alongside (the design decides whether the
   non-isentropic system is a Check or a full target; the sources support both). States are `C¹` pairs
   `(ρ, v)` on a set `D ⊆ 𝔐` with `ρ > 0`; classical solutions are states satisfying the equations on the interior
   of `D`. The conservative form `∂_t ρ + ∇·(ρv) = 0`, `∂_t(ρv) + ∇·(ρ v⊗v) + ∇p = 0`, the equivalence of the two
   forms for `C¹` states with `ρ > 0`, and Galilean invariance.
2. **Symmetric hyperbolic form.** The symmetrisation of the system by the variables `(ρ, v)` with the weight
   `c²/ρ²` (or by `(p, v)` or the enthalpy), a general carrier for first-order quasilinear symmetric hyperbolic
   systems `A⁰(u)∂_t u + Σ_i Aⁱ(u)∂_i u = F(u)` with `A^μ` symmetric and `A⁰` positive definite on an open set
   of states, the Friedrichs energy identity and the `L²` and `H^s` energy estimates for the linearised system,
   and the fact that the compressible Euler system is of this class on `{ρ > 0}`.
3. **Local well-posedness.** Existence, uniqueness, continuous dependence and the continuation criterion for the
   quasilinear symmetric hyperbolic Cauchy problem with data in `H^s(Σ)`, `s > n/2 + 1`, taking values in a
   compact subset of the state domain, by the iteration or the linear-existence-plus-energy route; the
   specialisation to compressible Euler with data `(ρ̄, v̄)` such that `ρ̄` is bounded below by a positive constant
   (and `(ρ̄ − ρ₀, v̄) ∈ H^s` relative to a constant background state when `Σ` is not compact).
4. **Finite speed of propagation and local uniqueness.** The energy identity on a lens-shaped domain whose
   lateral boundary is spacelike for the characteristic cone of the system; uniqueness of `C¹` solutions on the
   domain of dependence of a set of data; that the propagation cone of compressible Euler is the sound cone
   `|ẋ − v| ≤ c`.
5. **The acoustical metric and its Lipschitz causal curves.** For a state `(ρ, v)` on `D`, the Lorentzian metric
   `g = −c² dt² + Σ_i (dxⁱ − vⁱ dt)²` on `D`, its inverse, its causal cones (the sound cones), the time
   orientation by `∂_t + v·∇`, and the identification of its null cone with the characteristic cone of the
   symmetric hyperbolic form. The pointwise notions (Lorentzian scalar product, causal, null, timelike and
   future-directed vectors, piecewise `C¹` causal curves, null hypersurfaces, null normals and generators,
   geodesics of a `C^{1,1}` metric) are imported from DESIGN-LorentzianGeometry (#6251), which records the
   acoustical form as its example and Check and declares this theory out of its scope. Owned here, because
   LorentzianGeometry owns only piecewise `C¹` curves and leaves locally Lipschitz causal curves to a causality
   Part II: future-directed causal curves `γ(t) = (t, x(t))` with `x` locally Lipschitz and
   `|ẋ(t) − v(t, x(t))| ≤ c(t, x(t))` for almost every `t`, stated directly against the sound-cone field on the
   Galilean carrier; curves ending at a point; past-inextendible causal curves in `D`; and the comparison with
   LorentzianGeometry's piecewise `C¹` future-directed causal curves of `g` (every such curve, reparametrised by
   `t`, is one of these).
6. **Domains of dependence and developments.** The future domain of dependence `𝒟⁺_D(S)` of `S ⊆ D` for a
   state on `D` (the points `p ∈ D` such that every past-inextendible future-directed causal curve in `D` ending
   at `p` meets `S`), with `S ⊆ 𝒟⁺_D(S)` and `𝒟⁺_D(S) ∩ Σ_{t₀} ⊆ S` when `D ⊆ {t ≥ t₀}` and `S ⊆ Σ_{t₀}`;
   initial data sets `S` (a closed subset of `Σ_{t₀}` with nonempty interior, or `S = S₀ ∪ C` with `C` a
   hypersurface in `{t ≥ t₀}` meeting `Σ_{t₀}` inside `S₀`, with prescribed data `(ρ̄, v̄)` on `S`);
   developments `(D, (ρ, v))` of the data: `S ⊆ D ⊆ {t ≥ t₀}`, `(ρ, v)` a classical solution on the interior
   of `D` equal to the data on `S`, `D = 𝒟⁺_D(S)` for the acoustical metric of the solution itself, and `C`
   null for that metric in the characteristic case; the partial order of developments by inclusion and
   restriction.
7. **Uniqueness and the maximal development.** Two developments of the same data agree on the intersection of
   their domains; the union of all developments is a development, the unique maximal development `D_max`;
   existence of a development for `H^s` data with `s > n/2 + 1` and `ρ̄ ≥ ρ_* > 0` by extension of the data,
   solution on a slab and restriction to the domain of dependence; the characteristic case under the
   constraint and compatibility conditions on `C`; the domain of dependence of the data (`D_max`) and the
   characteristic boundary `∂D_max ∩ {t > t₀} ∖ C`, which, where it is a `C¹` hypersurface, is null for the
   acoustical metric and, where the regularity allows, ruled by null geodesics issuing from the edge of the
   data set.

Boundaries. The roadmap does not own: the incompressible limit, the incompressible Euler and Navier–Stokes
equations (IncompressibleFlows, PR #237); Lorentzian geometry of a fixed metric, causal character of vectors
and hypersurfaces, null generators, optical functions and geodesics of a `C^{1,1}` metric in general
(DESIGN-LorentzianGeometry, #6251); causality theory of a general spacetime (`I^±`, `J^±`, global hyperbolicity,
Cauchy horizons, domains of dependence for an arbitrary Lorentzian manifold, Chruściel–Grant low-regularity
causal curves), which LorentzianGeometry assigns to its causality Part II: this roadmap defines and proves
everything it needs for the acoustical metric on the Galilean carrier, and the identification with the general
theory is that Part II's business when it exists; Sobolev spaces, Besov spaces, Strichartz estimates and the
flat wave equation (PDE on main and PR #93); the Levi-Civita connection of a smooth nondegenerate metric
(Completed/HopfRinow) and Riemannian geometry (RiemannianGeometry on main); shock formation (Christodoulou,
Speck, Luk–Speck), the shock development problem, the structure of the singular boundary (Abbrescia–Speck) and
the stability of rarefaction waves (Luo–Yu): these are consumers that state their theorems against the
carriers built here. Vacuum boundaries (`ρ = 0`), weak and entropy solutions of conservation laws, Riemann
solvers and numerical schemes are outside the scope.

Generality. The target is stated for general `n ≥ 1`, a general smooth equation of state with `p′ > 0`, both
carriers `Σ`, and the non-isentropic system where the sources support it; the polytropic law, `n = 2` and
`n = 3` are Checks. The symmetric hyperbolic local well-posedness theorem is stated for a general first-order
quasilinear symmetric hyperbolic system, with compressible Euler as its instance, because it is the library's
first such theorem and later relativistic-fluid and Einstein-equation roadmaps will need the general one.

## Final targets

Notation: `𝔐 = ℝ_t × Σ`, `Σ_t = {t} × Σ`, `n = dim Σ ≥ 1`, `Σ = ℝⁿ` or `ℝ × (ℝ/2πℤ)^{n−1}`. A state on a set
`D ⊆ 𝔐` is a `C¹` pair `(ρ, v) : D → (0, ∞) × ℝⁿ` (`C¹` up to the boundary of `D`). The equation of state
`p : (0, ∞) → ℝ` is smooth with `p′ > 0`, `c(ρ) = √p′(ρ)`. Every target is stated for general `n` and general
`p`; the polytropic `p = k₀ρ^γ` and `n = 2` are Checks. Keys are those of
`packages/CompressibleEulerEquations/sources.toml`; line numbers refer to the line-numbered extraction of
the version recorded there.

1. **Symmetric hyperbolic form and energy estimate.** *(Majda1984 Ch. 2, §2.1–2.2; Dafermos2016 Ch. V, §5.1;
   Kato1975 Theorem I; all uncertified. Friedrichs1954, waived, cited by locator.)* For `(ρ, v)` with `ρ > 0`
   the isentropic system is equivalent to `A⁰(U)∂_t U + Σ_i Aⁱ(U)∂_i U = 0` with `U = (ρ, v)`,
   `A⁰ = diag(c²/ρ², 1, …, 1)`, `Aⁱ` symmetric, `A⁰` positive definite, all smooth in `U` on `{ρ > 0}`. For a
   general first-order system of this type with `A^μ` smooth on an open set of states, and for a `C¹` solution
   `U` on `[0, T] × Σ` taking values in a compact subset, the Friedrichs energy identity for the linearised
   system holds and gives `‖W(t)‖_{L²} ≤ C e^{Ct}‖W(0)‖_{L²}` with `C` depending on `‖∂U‖_{L^∞}`; the `H^s`
   version with `C` depending on `‖U‖_{H^s}` for integer `s > n/2 + 1`, through the Moser product and
   commutator estimates in `H^s(Σ)`. (Christodoulou2019 line 187 and ChristodoulouMiao2014 §2.1.2 state that
   the system is a quasilinear hyperbolic first-order system; the symmetric form is textbook.)
2. **Local well-posedness in `H^s`.** *(Kato1975 Theorem I; Majda1984 Ch. 2, Theorem 2.1; Dafermos2016 Ch. V,
   Theorem 5.1.1; all uncertified. Abbrescia–Speck state the theorem for compressible Euler:
   AbbresciaSpeck2022 lines 175–177, §1.2.)* For a symmetric hyperbolic system as in 1 and data `U₀` with
   `U₀ − Ū ∈ H^s(Σ)`, `s > n/2 + 1`, taking values in a compact subset `K` of the state domain (`Ū` a constant
   state), there are `T > 0` depending only on `‖U₀ − Ū‖_{H^s}` and `K` and a unique solution
   `U − Ū ∈ C([0, T]; H^s) ∩ C¹([0, T]; H^{s−1})` with values in a compact subset of the state domain; the
   solution depends continuously on the data in `H^s`; the maximal time `T_*` is characterised by the
   continuation criterion `∫₀^{T_*} ‖∂U(t)‖_{L^∞} dt = ∞` or `U` leaving every compact subset of the state
   domain. Specialisation: for compressible Euler with `ρ̄ ≥ ρ_* > 0` and `(ρ̄ − ρ₀, v̄) ∈ H^s`, a unique
   classical solution on `[0, T] × Σ` with `ρ ≥ ρ_*/2`.
3. **Finite speed of propagation and local uniqueness in lens-shaped domains.** *(Majda1984 Ch. 2, §2.3,
   uncertified; the energy-on-cones argument for the linear wave equation is BarGinouxPfaffle2007 Ch. 3, §3.2,
   Theorem 3.2.11 at line 3664 and Theorem 3.2.12 at line 3721, with the causal-support statement; the flat
   case is also RQFT1 of RelativisticQuantumFieldTheory, PR #1772.)* Let `U₁, U₂` be `C¹` solutions on a closed
   lens-shaped domain `Λ ⊆ [t₀, t₁] × Σ` whose lateral boundary is spacelike for the characteristic cone of the
   system at `U₁` (for compressible Euler: for the acoustical metrics of both solutions; it suffices that the
   boundary's inward conormal `(τ, ξ)` satisfies `τ > |v·ξ| + c|ξ|` for both states). If `U₁ = U₂` on
   `Λ ∩ Σ_{t₀}` then `U₁ = U₂` on `Λ`. Consequence: a `C¹` solution on `D` is determined on `𝒟⁺_D(S)` by its
   values on `S` (target 6).
4. **The acoustical metric and its causal curves.** *(ChristodoulouMiao2014 §1.3, eq. (1.39) at line 672 and
   (1.40) at line 676; §2.1.2 lines 864–872; LukSpeck2018 eq. (3.3.10a) at line 2004 and §3.5; LuoYu2023a
   line 95; Christodoulou2019 lines 134–141; Minguzzi2019 lines 1360–1374 for the Lipschitz parametrisation of
   continuous causal curves; Chrusciel2011 §2.3 and §2.5; MinguzziCone2019 §2.1 for the cone-structure
   version.)* For a state `(ρ, v)` on `D`, `g = −c² dt² + Σ_i (dxⁱ − vⁱ dt)²` is a Lorentzian metric of class
   `C¹` on `D` (class `C^k` when the state is `C^k`), with
   `g⁻¹ = −c⁻²(∂_t + v·∇)⊗(∂_t + v·∇) + Σ_i ∂_i ⊗ ∂_i`, `√(−det g) = c`, and the material field
   `B = ∂_t + v·∇` timelike and future-directed, so `(D, g)` is a time-oriented Lorentzian manifold with
   corners in the sense of LorentzianGeometry L1–L2 (its Check that the acoustical form is Lorentzian with `B`
   timelike is imported, not re-proved). A vector `(τ, ξ)` is causal iff `|ξ − τv| ≤ c|τ|`, null iff equality
   holds; the null cone of `g` is the characteristic cone of the symmetric hyperbolic form in target 1 (the
   sound cone), and `dt` is timelike for `g⁻¹`, so every `Σ_t ∩ D` is spacelike. A future-directed causal
   curve is `γ(t) = (t, x(t))`, `t ∈ I`, with `x` locally Lipschitz and `|ẋ(t) − v(t, x(t))| ≤ c(t, x(t))` for
   almost every `t`; prove that every piecewise `C¹` future-directed causal curve of `g` in LorentzianGeometry's
   sense is, after reparametrisation by `t`, such a curve, and define curves ending at a point and
   past-inextendible curves in `D`.
5. **The future domain of dependence.** *(Minguzzi2019 Definition 3.1 at line 3576 and Remark 3.2 at
   line 3581; Chrusciel2011 §2.9 at line 1843; MinguzziCone2019 Definition 2.17 at line 1737;
   BarGinouxPfaffle2007 Definition 1.3.5 at line 1006; HawkingEllis1973 §6.5 and ONeill1983 Ch. 14, waived,
   cited by locator.)* For a state on `D` and `S ⊆ D`, `𝒟⁺_D(S)` is the set of `p ∈ D` such that every
   past-inextendible future-directed causal curve in `D` ending at `p` meets `S`. Theorems: `S ⊆ 𝒟⁺_D(S)`;
   if `D ⊆ {t ≥ t₀}` and `S ⊆ Σ_{t₀}` then `𝒟⁺_D(S) ∩ Σ_{t₀} ⊆ S`; monotonicity in `S` and the behaviour
   under restriction to a subset `D′ ⊆ D` (`𝒟⁺_{D′}(S ∩ D′) ⊇ 𝒟⁺_D(S) ∩ D′` when `D′` is causally convex
   in `D`); for `S` compact in `Σ_{t₀}` and a solution on a slab `[t₀, t₁] × Σ`, the explicit description of
   `𝒟⁺(S)` by the backward sound cones (the points `(t, x)` such that every Lipschitz curve `x(·)` with
   `|ẋ − v| ≤ c` a.e. from `(t, x)` back to `Σ_{t₀}` lands in `S`), and that `𝒟⁺(S)` is closed when `S` is.
6. **Initial data sets, developments and the uniqueness proposition.** *(ChristodoulouMiao2014 §2.1.2,
   lines 864–880; Christodoulou2019 lines 130–141 and 185–188; LuoYu2023b §1.4.2 at line 417 and
   Definition 2.13 at line 910; Christodoulou2007 Ch. 1, waived, cited by locator.)* An initial data set is a
   closed `S ⊆ Σ_{t₀}` with nonempty interior, or `S = S₀ ∪ C` with `S₀` such a set and `C ⊆ {t ≥ t₀}` a `C¹`
   hypersurface with `C ∩ Σ_{t₀} ⊆ S₀`, together with data `(ρ̄, v̄)` on `S` of the regularity the statement
   needs. A development of the data is `(D, (ρ, v))` with `S ⊆ D ⊆ {t ≥ t₀}`, `(ρ, v)` a classical solution
   on the interior of `D`, continuous up to `S` and equal to the data there, `D = 𝒟⁺_D(S)` for the acoustical
   metric of `(ρ, v)` itself, and, in the characteristic case, `C ∩ D` a null hypersurface of that metric (null
   hypersurface in the sense of LorentzianGeometry L3). Developments are ordered by `(D₁, U₁) ≤ (D₂, U₂)` iff
   `D₁ ⊆ D₂` and `U₂|_{D₁} = U₁`. **Proposition (uniqueness; the maximal development).** Two developments of
   the same data agree on the intersection of their domains; the union of all developments, with the solution
   they glue to, is a development, the unique maximal development `D_max` of the data. Proof route: target 3
   applied to a neighbourhood of each point of the intersection, exhausted by lens-shaped domains along `t`,
   and the fact that a past-inextendible causal curve ending in the union ends in one member and meets `S`
   there.
7. **Existence of a development.** *(Kato1975, Majda1984 Ch. 2 for the slab, uncertified; AbbresciaSpeck2022
   §1.2 lines 175–177; the restriction argument is the one of ChristodoulouMiao2014 §2.1.2 lines 866–872.)*
   For `S ⊆ Σ_{t₀}` closed with nonempty interior and data `(ρ̄, v̄)` on `S` that extend to `Σ_{t₀}` as `H^s`
   data with `s > n/2 + 1` and `ρ̄ ≥ ρ_* > 0`, the solution of target 2 on a slab `[t₀, t₀ + T] × Σ`,
   restricted to `𝒟⁺(S)` computed with its own acoustical metric, is a development of the data, and it is
   independent of the extension by target 3. In the characteristic case `S = S₀ ∪ C`: state the constraint
   equations that the data on `C` must satisfy (the components of the Euler system tangential to `C`) and the
   compatibility conditions along `C ∩ Σ_{t₀}`, and state the existence of a development in a neighbourhood of
   `C ∩ Σ_{t₀}`; the design decides, from the legal sources, whether this is a target with a proof route (the
   reduction to a Cauchy problem by solving the transport equations on `C`) or a Check in the Luo–Yu
   configuration (LuoYu2023b Theorem 3 at line 813, whose developments of data on `{x¹ ≤ 0}` and on
   `{x¹ ≥ 0}` are bounded by null hypersurfaces from the edge).
8. **The domain of dependence of the data and the characteristic boundary.** *(ChristodoulouMiao2014 §2.1.2,
   lines 880–900; Christodoulou2019 lines 131–141; LuoYu2023b §1.4.2 lines 417–419; MinguzziCone2019
   Theorem 2.32 at lines 1749–1760 for the generation of Cauchy horizons by null geodesics under Lipschitz
   regularity; LorentzianGeometry target 9 (#6251) for the null-generator theorem.)* The domain of
   dependence of the data is `D_max`, and the characteristic boundary is `∂D_max ∩ {t > t₀} ∖ C`. Where the
   characteristic boundary is a `C¹` hypersurface it is null for the acoustical metric of the maximal
   development (it is achronal, and a timelike or spacelike piece would admit a strictly larger development by
   target 7 applied to the data induced on a slab); where moreover the hypersurface is `C²` and the metric is
   `C^{1,1}` (LorentzianGeometry's hypotheses for null generators and geodesic uniqueness) it is ruled by null
   geodesics of the acoustical metric issuing from the edge `∂S` of the data set (`∂S₀` in `Σ_{t₀}` in the
   Cauchy case, `∂C` in the characteristic case). Checks: for the constant state `(ρ₀, 0)` and `S` a closed
   ball of radius `R` in `Σ_{t₀} = ℝⁿ`, `D_max = {(t, x) : |x| ≤ R − c₀(t − t₀)}`, with boundary the backward
   sound cone; for `S = Σ_{t₀}` and `H^s` data with `ρ̄ ≥ ρ_* > 0` and `n = 2`, the maximal development
   contains `[t₀, t₀ + T] × Σ` with `T` from target 2 (the regime of LukSpeck2018 §1.1 and LuoYu2023a §1).

The acceptance test (`Suggested.lean`) should state targets 2 (for compressible Euler), 3, 6 (the
proposition) and 8 (nullity of the `C¹` characteristic boundary), with the definitions of targets 4–6 as the
simple definitions they need and Mathlib's `MemSobolev` for `H^s(ℝⁿ)`.

## Suppliers

All suppliers are on main, completed, or designs on the board that sit earlier in the merge order; the design
must check each at the pinned heads before importing.

- **PDE** (`TauCetiRoadmap/PDE/README.md` on main; PR #93 is the complete version): Lane A / Layer 1 for the
  weak-derivative Sobolev spaces `W^{k,2}` and their agreement with the Bessel-potential scale (`A3`, §1.3),
  the embeddings `H^s ↪ C¹_b` for `s > n/2 + 1` and the Moser-type product and composition estimates needed by
  the energy method (these product and commutator estimates in `H^s` are not yet stated by PDE; if the design
  cannot import them it owns them, stated for `Σ = ℝⁿ` and for `ℝ × 𝕋^{n−1}`); Lane F / Layer 6 (Bochner spaces,
  `C([0,T]; H^s)`); Layer 7 (Littlewood–Paley) only if the design takes the Besov route to the commutator
  estimates. Mathlib's `MemSobolev s p` on tempered distributions (`Mathlib/Analysis/Distribution/Sobolev.lean`)
  carries `H^s(ℝⁿ)` for real `s`; Tau Ceti's `TauCeti/Analysis/Sobolev` carries `W^{k,p}`, Bessel comparison,
  Morrey and Rellich.
- **IncompressibleFlows** (PR #237, draft, other author): Layer 0 (vector-valued and periodic Sobolev substrate
  on `UnitAddTorus d` and Euclidean space) and the local `H^s` energy method of Layer 6.1 for incompressible
  Euler are the model and, where their statements are vector-valued and not divergence-free, the import, for
  the periodic-in-`(n−1)`-directions setting `Σ = ℝ × (ℝ/2πℤ)^{n−1}`; compressible Euler is not in its scope.
- **DESIGN-LorentzianGeometry** (#6251, `packages/LorentzianGeometry/target.md`): L0 Lorentzian scalar
  products and causal cones; L1 Lorentzian metrics of class `C^k` and `C^{k,α}` on manifolds with corners,
  causal character of vectors and piecewise `C¹` curves, the Levi-Civita connection of a `C¹` metric, geodesic
  uniqueness for `C^{1,1}` metrics (its target 5), the acoustical metric as example; L2 time orientation and
  future-directed causal vectors and curves (target 6); L3 null hypersurfaces, null normals and optical
  functions (target 8), null generators (target 9) and characteristic hypersurfaces of `□_g` (target 10).
  Its Scope declares the compressible Euler theory of the acoustical metric out of its scope and names
  `TARGET-CompressibleEulerEquations` as a consumer; its merge-order note places it before this roadmap.
  The design here must import these by section and must not re-plan them; LorentzianGeometry's own Risk that
  `Suggested.lean` carries a local Lorentzian-metric structure until the Tau Ceti pin advances applies here
  too, and the two acceptance tests must agree on that structure.
- **RiemannianGeometry** (main) and **HopfRinow** (`Completed/HopfRinow/README.md`, nondegenerate Levi-Civita
  supplier, geodesic equation for a smooth nondegenerate metric): through LorentzianGeometry, for the
  geodesics of the acoustical metric in target 8.
- **DifferentialGeometry** (main): manifolds with boundary and corners, tensor fields, flows of vector fields
  (the material vector field `∂_t + v·∇` and its integral curves).
- **Mathlib ODE** (`Mathlib/Analysis/ODE`, Picard–Lindelöf, Grönwall) and **Tau Ceti ODE**
  (`TauCeti/Analysis/ODE`, smooth parameter dependence): the Galerkin or iteration step and the Grönwall closure
  of the energy estimates; Lipschitz curves and their almost-everywhere derivatives (Mathlib's Rademacher).

Supply direction: PDE, DifferentialGeometry, RiemannianGeometry, HopfRinow → LorentzianGeometry →
CompressibleEulerEquations; IncompressibleFlows is a sibling consumer of PDE and supplies only its periodic
substrate. No roadmap earlier in the order consumes this one, and the roadmap does not consume the causality
Part II of LorentzianGeometry, so no cycle arises when that Part II later identifies the domain of dependence
defined here with the general one.

## Consumers

- The shock-formation and shock-development programme: Christodoulou's 3D shock formation
  (Christodoulou2007), Speck's quasilinear wave equations (Speck2016 §1.11), Luk–Speck's 2D Euler with
  vorticity (LukSpeck2018), Abbrescia–Speck's singular boundary and crease (AbbresciaSpeck2022) and
  Christodoulou's shock development problem (Christodoulou2019) all state their main theorems for the maximal
  development of `H^s` or smooth data through the acoustical metric, the acoustical (eikonal) function and the
  null hypersurfaces of the solution; the first such roadmap (a "ShockFormation" or "AcousticalGeometry"
  Part II) starts from items 5–7 of the Scope.
- The rarefaction-wave programme of Luo–Yu (Ann. of Math. 202 (2025), arts. 2–3; LuoYu2023a, LuoYu2023b):
  developments of characteristic data on `C`, the domain of dependence of the data and the characteristic
  boundary are the carriers of their main theorems; their statements are the first Check of this roadmap's
  definitions.
- DESIGN-LorentzianGeometry lists this target as its first consumer; its causality Part II
  (`LorentzianGeometryPartII`: `I^±`, `J^±`, global hyperbolicity, Cauchy horizons, domains of dependence for a
  general spacetime, Lipschitz causal curves) will take the domain-of-dependence theory here as its first worked
  example of a solution-dependent metric and identify the two definitions.
- RelativisticQuantumFieldTheory (PR #1772, RQFT1) and LocalVariationalFieldTheory (PR #916) use flat
  Minkowski causal propagation; the quasilinear symmetric hyperbolic local well-posedness theorem here is the
  library's first and will be the supplier for any future Einstein-equations or relativistic-fluids roadmap.

## Sources

Recorded in `packages/CompressibleEulerEquations/sources.toml` (18 entries, manifest check clean). Open texts
are in the sources cache as line-numbered extractions; passages are cited as `<key> line N`. Where a preprint
was read for a published work, the manifest's `version_note` says so and the locators are to the version read.

| key | work | licence | used for |
|---|---|---|---|
| ChristodoulouMiao2014 | Christodoulou, Miao, *Compressible Flow and Euler's Equations*, Surveys of Modern Mathematics 9, 2014; arXiv:1212.2867v2 | open repository, certified | §1.1 the Euler system; §1.3 the acoustical metric, eqs. (1.39)–(1.40) (lines 672–676); §2.1.2 developments and the maximal development (lines 864–900) |
| Christodoulou2019 | Christodoulou, *The Shock Development Problem*, EMS Monographs, 2019; arXiv:1705.00828v1 | open repository, certified | Prologue (lines 121–215): maximal development, acoustical causal structure, characteristic data on `C`; §1.1, §1.3 (non-relativistic limit), §1.5 (the shock development problem) |
| LuoYu2023a | Luo, Yu, *On the stability of multi-dimensional rarefaction waves I*, Ann. of Math. 202 (2025), 631–752; arXiv:2302.09714v2 | open repository, certified (OCR text) | §1 the 2D isentropic system and acoustical metric (lines 82–99); §1.4 (line 333) |
| LuoYu2023b | Luo, Yu, *… II: existence of solutions and applications to Riemann problem*, Ann. of Math. 202 (2025), 753–855; arXiv:2305.06308v2 | open repository, certified (OCR text) | §1.4.2 (lines 417–419): future domain of dependence of the data and its characteristic boundary as a null hypersurface; Theorem 3 (line 813); Definition 2.13 (line 910) |
| LukSpeck2018 | Luk, Speck, Invent. Math. 214 (2018), 1–169; arXiv:1610.00737v1 | open repository, certified | §1.1 (line 359); §3.3 formulation (line 1941) and eq. (3.3.10a) (line 2004); §3.5 (line 2077) |
| AbbresciaSpeck2022 | Abbrescia, Speck, *The emergence of the singular boundary from the crease in 3D compressible Euler flow*; arXiv:2207.07107v1 | open repository, certified | §1.2 (lines 147–177): the system on `ℝ × 𝕋²`, local well-posedness for non-vacuum data; eq. (2.15a) acoustical metric |
| Speck2016 | Speck, *Shock Formation in Small-Data Solutions to 3D Quasilinear Wave Equations*, AMS 2016; arXiv:1407.6320v1 | open repository, certified | §1.11 (line 1626): the acoustical metric of the irrotational fluid; consumer context |
| BarGinouxPfaffle2007 | Bär, Ginoux, Pfäffle, *Wave Equations on Lorentzian Manifolds and Quantization*, ESI Lectures 2007; arXiv:0806.1036v1 | open repository, certified | Definition 1.3.5 Cauchy development (line 1006); §3.2 the Cauchy problem, Theorems 3.2.11–3.2.12 (lines 3664, 3721): energy method and causal support for linear wave equations |
| Chrusciel2011 | Chruściel, *Elements of causality theory*, lecture notes 2011; arXiv:1110.6706v1 (the issue form's id 1110.0214 is a different paper) | open repository, certified | §2.3 causal paths, §2.5 inextendible paths, §2.9 domains of dependence (line 1843), §2.10 Cauchy horizons |
| MinguzziCone2019 | Minguzzi, *Causality theory for closed cone structures with applications*, Rev. Math. Phys. 31 (2019); arXiv:1709.06494v4 | open repository, certified | Definition 2.17 (line 1737) domains of dependence for cone structures; Theorem 2.32 (lines 1749–1760): Cauchy horizons generated by lightlike geodesics, Lipschitz case |
| Minguzzi2019 | Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019), art. 3, doi 10.1007/s41114-019-0019-x | open access, certified from the INSPIRE mirror of the publisher's open-access text (same copy as `packages/LorentzianGeometry/sources.toml`) | §2.2 Lipschitz parametrisation of continuous causal curves (lines 1360–1374); Definition 3.1 and Remark 3.2, domains of dependence (lines 3576–3582) |
| Kato1975 | Kato, Arch. Rational Mech. Anal. 58 (1975), 181–205, doi 10.1007/BF00280740 | paywalled, uncertified | Theorem I: quasilinear symmetric hyperbolic local well-posedness in `H^s` |
| Majda1984 | Majda, *Compressible Fluid Flow and Systems of Conservation Laws in Several Space Variables*, Springer 1984, doi 10.1007/978-1-4612-1116-7 | paywalled, uncertified | Ch. 2: local existence (Theorem 2.1), finite propagation (§2.3), compressible Euler as a symmetric system (§2.1) |
| Dafermos2016 | Dafermos, *Hyperbolic Conservation Laws in Continuum Physics*, 4th ed., Springer 2016, doi 10.1007/978-3-662-49451-6 | paywalled, uncertified | Ch. V: symmetric hyperbolic systems, local existence and uniqueness |
| Christodoulou2007 | Christodoulou, *The Formation of Shocks in 3-Dimensional Fluids*, EMS 2007, doi 10.4171/031 | waived by a human (jobs issue #6000), cited by locator | Ch. 1–2: acoustical metric, domains of dependence, acoustical structure equations; the open ChristodoulouMiao2014 covers the same definitions |
| HawkingEllis1973 | Hawking, Ellis, *The Large Scale Structure of Space-Time*, CUP 1973 | waived, cited by locator | §6.5 domains of dependence; covered by Minguzzi2019 Definition 3.1 and Chrusciel2011 §2.9 |
| ONeill1983 | O'Neill, *Semi-Riemannian Geometry*, Academic Press 1983 | waived, cited by locator | Ch. 14 causality; covered by Minguzzi2019 and Chrusciel2011 |
| Friedrichs1954 | Friedrichs, Comm. Pure Appl. Math. 7 (1954), 345–392 | waived, cited by locator | the symmetric hyperbolic energy identity; covered by the uncertified Majda1984 and Dafermos2016 locators |

No source is outstanding: every statement above is covered by an open certified text or by a settled locator.

## Risks

- **Far above the library.** Tau Ceti has no hyperbolic PDE of any kind: no symmetric hyperbolic systems, no
  `H^s` energy estimates for first-order systems, no Lorentzian metric, no causal curves. Items 2–4 of the Scope
  are a full "Majda Chapter 2" programme on their own (commutator and Moser estimates in `H^s`, mollified
  iteration, continuity in time at the top order, finite propagation by energy on lens-shaped domains), and the
  design must size `Suggested.lean` so that the headline theorems are the local well-posedness theorem and the
  maximal development theorem, not the intermediate estimates.
- **Supplier still a design.** LorentzianGeometry (#6251) has a target file but no README or Lean yet, and its
  own Risks record that the pinned Tau Ceti lacks HopfRinow's nondegenerate-metric files, so its acceptance
  test carries a local Lorentzian-metric structure. This roadmap's `Suggested.lean` must use the same local
  structure (or restate the acoustical metric concretely as a matrix-valued function on `D ⊆ ℝ × Σ`, which is
  enough for every target here) and must not name LorentzianGeometry declarations that do not exist at the pin.
  The two designs must agree on the signature convention `(−, +, …, +)`, on future-directedness through
  `g(B, X) < 0`, and on the null-generator hypotheses (`g ∈ C¹`, hypersurface `C²`, null normal `C¹`).
- **Lipschitz causal curves are owned here, not by the supplier.** LorentzianGeometry restricts to piecewise
  `C¹` curves and defers locally Lipschitz causal curves to a causality Part II that does not exist. The target
  needs Lipschitz curves (the data set's edge and the characteristic boundary produce only Lipschitz causal
  curves). The design therefore states the Lipschitz definition concretely on the Galilean carrier (a graph
  over `t`, which avoids reparametrisation issues) and proves only the one-way comparison with piecewise `C¹`
  curves; the full equivalence with the general low-regularity theory is left to that Part II.
- **Regularity of the acoustical metric.** For an `H^s` solution with `s > n/2 + 1` the metric is only `C¹`
  (in fact `C^{0,1}` in `t` with `C¹` spatial slices), so geodesic uniqueness and the null-generator theorem
  need the `C^{1,1}` statements that LorentzianGeometry promises, not the smooth ones; the ruling of the
  characteristic boundary by null geodesics is stated only where that boundary is `C²` and the metric is
  `C^{1,1}`, and the design must not promise more. Nullity of a `C¹` characteristic boundary needs no such
  hypothesis and is the headline statement.
- **Maximal development as a set.** The union of all developments must be shown to be a development: the
  domain-of-dependence condition `D = 𝒟⁺_D(S)` is not obviously preserved by unions, and the proof goes through
  local uniqueness plus the fact that a causal curve ending in the union ends in some member. This is the
  roadmap's central proposition and its proof must be written for Lipschitz causal curves, not for smooth ones.
- **Characteristic data.** Existence of a development for characteristic data on `C` (the constraint and
  compatibility conditions on `C`, the data on `S₀ ∪ C`) is stated in the open sources only for specific
  configurations (Luo–Yu's rarefaction fronts, Christodoulou's shock development with singular data); the
  general theorem (Rendall's reduction or the Cauchy-problem-on-a-null-cone method) is paywalled or absent.
  The design should make the characteristic existence theorem a stated target with an explicit proof route
  (reduction to a Cauchy problem by solving a transport system on `C`) or, if no legal source supports the
  general statement, a Check for the Luo–Yu configuration.
- **Sources.** Kato 1975, Majda 1984 and Dafermos 2016 are paywalled and cited by locator only; Christodoulou
  2007, Hawking–Ellis, O'Neill and Friedrichs are waived. The open texts (Christodoulou–Miao, Christodoulou
  2019, Speck, Luk–Speck, Abbrescia–Speck, Luo–Yu, Bär–Ginoux–Pfäffle, Minguzzi, Chruściel) cover every
  definition and the structure of the proofs but not a self-contained symmetric hyperbolic local existence
  proof; the design should cite Bär–Ginoux–Pfäffle Ch. 3 for the energy method template and Kato/Majda by
  locator. The Luo–Yu texts are OCR extractions of image-only scans; their line locators are to the OCR text
  and the design should re-read each passage it relies on.
