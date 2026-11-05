Verdict: design
Name: SchrodingerOperatorsAndSpectralTypes
Base: none
Owner: none

## Scope

A general spectral-theory library in three layers, each with its own interface, built on the
unbounded self-adjoint spectral theory that OperatorTheory (SelfAdjointSpectralTheory, SAST) and
UnboundedOperators (UO) already plan, on DifferentialGeometry Layer 12 and ComplexKahlerGeometry K5a
for the Laplacian on manifolds, and on PDE Lane A, QuantumFoundations §8.2 and Mathlib's
Bessel-potential scale for the Euclidean Laplacian. The roadmap owns what is planned nowhere:

- **Layer 1, spectral types.** The vector spectral measure `μ_f(B) = ⟪E(B)f, f⟫` of a self-adjoint
  `LinearPMap` on an arbitrary complex Hilbert space, the identification of the three spectral
  projections with the Lebesgue decomposition of every `μ_f`, the spectral parts `σ_ac`, `σ_sc`,
  `σ_pp`, the essential-closure description of `σ_ac` (hence no isolated points), the interval
  criterion for `[a, b] ⊆ σ_ac(H)`, the abstract wave operators and the Kato–Rosenblum theorem on
  trace-class perturbations. The decomposition `ℋ = ℋ_ac ⊕ ℋ_sc ⊕ ℋ_pp`, its reducing property,
  the self-adjoint restrictions and `σ(H) = σ_ac ∪ σ_sc ∪ σ_pp` are UO-C03 and are imported, never
  re-planned; this layer owns only the measure-side identifications and the consequences UO-C03
  does not state.
- **Layer 2, the Laplace–Beltrami operator.** For every smooth Riemannian manifold without boundary
  (any dimension, not necessarily connected, orientable or compact): the minimal operator
  `Δ₀ = −div grad` on `C_c^∞(X)` in `L²(X, vol_g; ℂ)`, its symmetry and nonnegativity by Green's
  formula, its adjoint as the maximal operator, the energy form on `H¹_0(X)` and its Friedrichs
  operator, and the completeness theorem (Gaffney, Chernoff, Strichartz): on a complete manifold
  `Δ₀` is essentially self-adjoint, its closure `Δ_X` is the maximal operator and the form operator
  of `∫|grad u|²` on `H¹(X) = H¹_0(X)`. The spectral vocabulary of `Δ_X` (eigenvalues with
  multiplicity, discrete and essential spectrum, bottom of the spectrum, ordered eigenvalues below
  the essential spectrum), the compact case as a comparison with K5a's realisation, and the
  finite-area hyperbolic surface as a stated target. Bounded real potentials `Δ_X + V`,
  `V ∈ L^∞(X)`, come for free from Layer 3's abstract perturbation items and are in scope; magnetic
  Laplacians, bundle-valued Laplacians, unbounded potentials on manifolds and heat kernels are not.
- **Layer 3, Schrödinger operators on `L²(ℝ^d)`.** The equivalent descriptions of `H²(ℝ^d)`, the
  free Laplacian with domain `H²` (imported from QuantumFoundations §8.2 and UO-E06, see Risks),
  the abstract bounded-perturbation and Kato–Rellich lower-bound items that SAST does not state,
  and `H = −Δ + V` for real `V ∈ L^∞(ℝ^d)` in every dimension `d ≥ 1`: self-adjoint on `H²`,
  bounded below by `ess inf V`, essentially self-adjoint on `C_c^∞` and on Schwartz space, with
  `σ_ess(H) = [0, ∞)` when `V` vanishes at infinity, and the quasi-periodic trigonometric-polynomial
  potentials as the model example. Singular potentials (`L^p`, Kato class, Coulomb) are UO-E06's and
  a future roadmap's; scattering theory beyond the abstract Kato–Rosenblum theorem is not planned.

Generality: the filed wording is already the general statement for Layers 1 and 3. For Layer 2 the
filed hypothesis "Riemannian manifold without boundary" is kept; completeness enters only in the main
theorem. The hyperbolic-surface statement is stated for every connected complete Riemannian surface
of constant curvature `−1` and finite area, not only for quotients `Γ\ℍ`; the congruence quotients of
AutomorphicSpectralTheory §1.16a and CongruenceSpectralGap §0.2 become Checks.

Conventions the design must pin: `Δ` is the nonnegative operator `−div grad`, the negative of
DifferentialGeometry's `laplaceBeltrami` and of Mathlib's `InnerProductSpace.laplacian`; on `ℍ` it
is `−y²(∂ₓ² + ∂ᵧ²)`, the convention of AutomorphicSpectralTheory, CongruenceSpectralGap and
MaassForms; the Fourier transform is Mathlib's, so `−Δ` corresponds to multiplication by `4π²|ξ|²`;
inner products are conjugate-linear in the first variable as in SAST; the Hilbert space is complex.

## Final targets

Layer 1 (self-adjoint `H : ℋ →ₗ.[ℂ] ℋ` on a complex Hilbert space, `E = P_H` its spectral PVM of
SA-E01; no separability).

1. **Vector spectral measures.** `μ_f(B) = ⟪E(B)f, f⟫` is a finite positive Borel measure on `ℝ`
   with `μ_f(ℝ) = ‖f‖²` (SA-B21's diagonal measure transported along SA-E01), `μ_{g(H)f} = |g|²μ_f`
   for bounded Borel `g`, and `μ_{E(B)f} = μ_f|_B`. (teschl line 4388–4419; rs1 §VII.2.)
2. **The projections realise the Lebesgue decomposition.** With `ℋ_ac, ℋ_sc, ℋ_pp` and the
   orthogonal projections `P_ac, P_sc, P_pp` of UO-C03: for every `f`,
   `μ_f = μ_{P_ac f} + μ_{P_sc f} + μ_{P_pp f}`, `μ_{P_ac f}` is Mathlib's absolutely continuous part
   `(μ_f).withDensity (μ_f.rnDeriv volume)`, `μ_{P_sc f} + μ_{P_pp f}` is `μ_f.singularPart volume`,
   `μ_{P_pp f}` is the atomic part and `μ_{P_sc f}` the continuous singular part; each `P_xx` is a
   Borel function `χ_{M_xx}(H)` of `H` and commutes with every `E(B)`. (teschl line 4391–4398 and
   4420–4425; Mathlib `MeasureTheory.Measure.singularPart_add_rnDeriv`.)
3. **Spectral parts.** `σ_ac(H) := σ(H|ℋ_ac)`, `σ_sc`, `σ_pp` likewise, with `H|ℋ_xx` the
   self-adjoint restriction of UO-C03 (via SA-E09). Prove: `σ_ac(H)` is the essential closure of a
   minimal support of `(μ_ψ)_ac` for a maximal spectral vector `ψ`, equivalently
   `λ ∈ σ_ac(H)` iff `(μ_f)_ac((λ−ε, λ+ε)) > 0` for every `ε > 0` and some `f`; hence `σ_ac(H)`
   is closed with no isolated points; `σ_xx` is invariant under unitary equivalence.
   `σ(H) = σ_ac ∪ σ_sc ∪ σ_pp` and `σ_pp(H) = closure{eigenvalues}` are UO-C03 imports. (teschl
   line 4315–4332, 4354–4355, 4420–4427.)
4. **Interval criterion.** For `a < b`: `[a, b] ⊆ σ_ac(H)` iff for every nonempty open
   `J ⊆ (a, b)` there is `f` with `(μ_f)_ac(J) > 0`; in particular `[a, b] ⊆ σ_ac(H)` whenever some
   `f` has `(μ_f)_ac` with almost-everywhere positive density on `[a, b]`; and
   `σ_ac(H) ∩ (a, b) = ∅` iff `(μ_f)_ac((a, b)) = 0` for all `f`. (Consequence of item 3;
   teschl line 4326–4332.)
5. **Abstract wave operators and Kato–Rosenblum.** For self-adjoint `H₁, H₂` define
   `Ω_± = s-lim_{t→±∞} e^{itH₂}e^{−itH₁}P_ac(H₁)` on its domain of existence; `D(Ω_±)` and
   `Ran(Ω_±)` are closed, reduce `H₁` resp. `H₂`, and `Ω_±` intertwines them (teschl line
   10600–10631, Lemma 12.1 and Theorem 12.2). Kato–Rosenblum: if `H₂ = H₁ + V` with `V` bounded
   self-adjoint and trace class, then `Ω_±` exist on all of `ℋ_ac(H₁)`, are partial isometries with
   initial space `ℋ_ac(H₁)` and final space `ℋ_ac(H₂)`, so `H₁|ℋ_ac ≅ H₂|ℋ_ac` unitarily and
   `σ_ac(H₁) = σ_ac(H₂)`. (rs3 §XI.3; kato76 Ch. X §4.) Filed as a target to be stated; the
   design decides whether its proof (Rosenblum's lemma and Pearson's theorem) enters this roadmap,
   see Risks.

Layer 2 (`(X, g)` a smooth Riemannian manifold without boundary, `vol_g` Tau Ceti's
`riemannianVolume`, `ℋ = L²(X, vol_g; ℂ)`).

6. **Minimal operator.** `Δ₀ u = −div(grad u)` on `C_c^∞(X; ℂ)` as a `LinearPMap` on `ℋ`: densely
   defined, symmetric, nonnegative, with `⟪Δ₀u, v⟫ = ∫⟨grad u, grad v⟩ dvol_g` (DifferentialGeometry
   12.5, `integral_mul_laplaceBeltrami`), hence closable. (bms02 line 150–180, §2.1; grigoryan09
   Ch. 4.)
7. **Adjoint equals maximal operator.** `Δ₀† = Δ_max`, the operator with domain
   `{u ∈ L² : Δu ∈ L²}` (`Δu` the distributional `−div grad u`, tested against `C_c^∞`) acting by
   `Δu`. (bms02 line 177–182; grigoryan09 Ch. 4.)
8. **Energy form and Friedrichs operator.** `H¹(X) = {u ∈ L² : grad u ∈ L²}` with its norm,
   `H¹_0(X)` the closure of `C_c^∞(X)`; the form `𝔞(u, v) = ∫⟨grad u, grad v⟩` on `H¹_0(X)` is
   closed and nonnegative, its operator in the sense of UO-D06 is the Friedrichs extension `Δ_F` of
   `Δ₀`, and `Δ₀ ⊆ Δ_F ⊆ Δ_max`. (teschl Theorem 2.12, §2.3; grigoryan09 Ch. 4.)
9. **Main theorem (Gaffney–Chernoff–Strichartz).** If `(X, g)` is complete, `Δ₀` is essentially
   self-adjoint: `closure Δ₀ = Δ_F = Δ_max =: Δ_X`, a nonnegative self-adjoint operator with
   `σ(Δ_X) ⊆ [0, ∞)`, `H¹_0(X) = H¹(X)`, `dom Δ_X = {u ∈ H¹(X) : Δu ∈ L²}`, and `𝔞` on `H¹(X)` is
   the form of `Δ_X`. Route: Gaffney's cutoff functions `χ_k` with `0 ≤ χ_k ≤ 1`, compact support,
   `χ_k → 1` and `|grad χ_k| ≤ 1/k`, which exist by completeness (Hopf–Rinow), together with local
   elliptic regularity `dom Δ_max ⊆ H¹_loc` (PDE Lane E interior estimates in charts, bms02
   Theorem 2.3 line 179–182 for the scalar case). (bms02 Corollary 2.10 line 245–246 with `D = d`
   on the trivial line bundle; gaffney54; chernoff73; strichartz83; grigoryan09 Ch. 11.)
10. **Spectral vocabulary of `Δ_X`.** Eigenvalues and multiplicities `dim ker(Δ_X − λ)`, discrete
    spectrum (isolated eigenvalues of finite multiplicity) and essential spectrum `σ_ess`
    (UO-C02, Weyl's criterion teschl line 6277), `λ₀(X) = inf σ(Δ_X) ≥ 0`, the ordered eigenvalues
    `λ_k(X)` below `inf σ_ess` with multiplicity by Courant–Fischer (VariationalMethods 4.4), and
    `λ₁(X)` as the first spectral value above `0` in the sense Hide–Magee use (hm23 line 41–47,
    104–105); `ker Δ_X` consists of the locally constant `L²` functions.
11. **Compact case.** For compact `X`: `Δ_X` has compact resolvent and equals ComplexKahlerGeometry
    K5a's `H²` realisation of the scalar Hodge Laplacian (the negative of `laplaceBeltrami`);
    `σ(Δ_X) = σ_disc(Δ_X) = {λ_k}` with `0 = λ₀ ≤ λ₁ ≤ ⋯ → ∞` counted with multiplicity, every
    eigenspace finite-dimensional with smooth eigenfunctions, an orthonormal eigenbasis of
    `L²(X)`, and the multiplicity of `0` equal to the number of connected components. (K5a;
    chavel84 Ch. I.)
12. **Finite-area hyperbolic surface (stated target).** For `X` connected, complete, of dimension
    `2`, sectional curvature `−1` and `vol_g(X) < ∞`, noncompact: `σ_ess(Δ_X) = [1/4, ∞)`;
    `σ(Δ_X) ∩ [0, 1/4)` is a finite set of eigenvalues of finite multiplicity with `0` simple;
    the eigenvalues of `Δ_X` form a discrete subset of `[0, ∞)`, each of finite multiplicity;
    `ℋ_sc(Δ_X) = 0`; and `Δ_X` restricted to the orthogonal complement of the closed span of all
    eigenfunctions is purely absolutely continuous with spectrum `[1/4, ∞)`, so
    `σ_ac(Δ_X) = [1/4, ∞)`. The compact finite-area case is item 11. (lp76 Ch. 1 and 8; lp80
    Theorem 2.1 and Corollary 2.2 line 297–301, §§4–7; iwaniec02 Ch. 4, 7 and 11; hm23 line
    44–47.) Statement-level target: see Risks for the proof.

Layer 3 (`ℋ = L²(ℝ^d; ℂ)`, `d ≥ 1`).

13. **Descriptions of `H²(ℝ^d)`.** For `u ∈ L²(ℝ^d)` the following are equivalent: Mathlib's
    `MemSobolev 2 2` (Bessel potential); weak derivatives of order `≤ 2` in `L²` (Tau Ceti `Wkp`,
    PDE Lane A.3 reconciliation); `(1 + |ξ|²) û ∈ L²` (Mathlib
    `memSobolev_iff_exists_smulLeftCLM_fourier`); and `Δu ∈ L²` distributionally, with
    `‖u‖_{H²} ≍ ‖u‖₂ + ‖Δu‖₂`. The first three are imports and adapters; the fourth is owned.
    (teschl line 7087–7092; rs2 Ch. IX.)
14. **Free Laplacian.** `H₀ = −Δ` with domain `H²(ℝ^d)` is self-adjoint and nonnegative,
    unitarily equivalent under Mathlib's Fourier transform to multiplication by `4π²|ξ|²`,
    `σ(H₀) = σ_ac(H₀) = [0, ∞)`, `σ_sc(H₀) = σ_pp(H₀) = ∅`, and `C_c^∞(ℝ^d)` and `𝒮(ℝ^d)` are
    cores. Imported from QuantumFoundations §8.2 (at `m = 1/2`) and UO-E06 (`d = 3`); this
    roadmap owns only the adapter to item 13's carrier. (teschl Theorem 7.8 line 7095–7127,
    Lemma 7.9 line 7130–7136.)
15. **Bounded self-adjoint perturbations.** For `A` self-adjoint and `V` bounded self-adjoint:
    `A + V` is self-adjoint on `dom A` (SA-C54, import); every core of `A` is a core of `A + V`;
    if `inf σ(A) = γ` then `γ − ‖V‖ ≤ inf σ(A + V) ≤ γ + ‖V‖`. (teschl Theorem 6.4 line
    5704–5711 with `a = 0`.)
16. **Kato–Rellich with the lower bound.** For `A` self-adjoint, `V` symmetric on `dom A` with
    `‖Vu‖ ≤ a‖Au‖ + b‖u‖`, `a < 1`: `A + V` is self-adjoint on `dom A` (SA-C55, import), every
    core of `A` is a core of `A + V`, and if `A ≥ γ` then `A + V ≥ γ − max(b/(1−a), a|γ| + b)`.
    (teschl line 5704–5720; rs2 Theorem X.12; kato76 Ch. V §4.)
17. **Schrödinger operators with bounded potentials.** For measurable real `V` with
    `‖V‖_∞ < ∞`, `H = −Δ + V` with domain `H²(ℝ^d)` is self-adjoint, `H ≥ ess inf V`,
    `σ(H) ⊆ [ess inf V, ∞)`, `C_c^∞` and `𝒮` are cores, and `σ_ac(H)`, `σ_sc(H)`, `σ_pp(H)` are
    defined by Layer 1; if moreover `V(x) → 0` as `|x| → ∞` (`V ∈ L^∞_∞`), `V` is `H₀`-compact
    and `σ_ess(H) = [0, ∞)` (UO-E04 relatively compact perturbations). (teschl Theorem 10.2 line
    9578–9589; rs2 §X.2; cfks87 Ch. 1.)
18. **Quasi-periodic model.** For `Q ∈ ℕ`, `l ≥ 1`, frequencies `θ_n ∈ ℝ^d` and coefficients
    `V_n ∈ ℂ` (`n ∈ ℤ^l`, `|n| ≤ Q`) with `V_{−n} = conj V_n`, `V(x) = Σ_n V_n e^{i⟨θ_n, x⟩}` is a
    real, smooth, bounded function, so item 17 applies to `−Δ + V`. Check: the conclusion of
    kps26 Theorem 1.1, "`[λ*, ∞) ⊆ σ_ac(−Δ + V)`", is statable in the roadmap's vocabulary
    (kps26 line 28–39, 47–50); likewise the conclusion of hm23 Theorem 1.1 and Corollary 1.3 in
    Layer 2's (hm23 line 60–66, 104–105). Neither theorem is a target.

## Suppliers

- **OperatorTheory/SelfAdjointSpectralTheory** (main): Part B (bounded Borel calculus, PVMs,
  diagonal measures SA-B21), Part C (`LinearPMap` graphs, cores SA-C39, relative boundedness
  SA-C44–C53, bounded Kato–Rellich SA-C54, Kato–Rellich SA-C55), Part D (resolvents,
  semiboundedness), Part E (spectral PVM SA-E01–E04, resolvent formula SA-E05, spectral
  restriction SA-E09, form bounds SA-E11–E13, generated group SA-E26–E29).
- **UnboundedOperators** (PR #1027, board package; another author's PR): UO-A01 (unbounded spectral
  integral), UO-A07 (multiplier model), UO-C02 (essential spectrum), UO-C03 (the three spectral
  subspaces, their reduction, restrictions and spectra), UO-D06 (closed forms and the Friedrichs
  extension), UO-E04 (relatively compact perturbations), UO-E06 (free Laplacian on `ℝ³`).
- **QuantumFoundations** (PR #1771, another author's PR): §8.2 (the free Hamiltonian on `H²(ℝⁿ)`
  with cores and purely absolutely continuous spectrum).
- **PDE** (main): Lane A.1 (weak derivatives, `W^{k,p}`), A.3 (agreement with the Bessel-potential
  scale), A.6 (Rellich), Lane E (interior `H²` estimates).
- **DifferentialGeometry** (main): Layer 12 (metrics, `mgradient`, `divergence`, `laplaceBeltrami`,
  `riemannianVolume`, divergence theorem and Green identities 12.5).
- **RiemannianGeometry** (main) and **HopfRinow** (Completed): completeness, Hopf–Rinow, R1
  curvature calculus (for the curvature `−1` hypothesis), R7.0 (first positive eigenvalue on closed
  manifolds, a consumer-side comparison).
- **ComplexKahlerGeometry** (main): K5a (compact-manifold `H²` realisation, compact resolvent,
  smooth eigenbasis of the scalar Hodge Laplacian).
- **VariationalMethods** (PR #1028, another author's PR): 4.4 (Courant–Fischer), 5.1–5.2
  (compact form pairs and their represented operator).
- **PseudodifferentialOperators** (main): P1.0 (formal adjoints of differential operators).
- **FuchsianOrbifolds** (main) and Tau Ceti `Geometry/Manifold/Riemannian/Hyperbolic`: finite-area
  hyperbolic quotients for the Checks of item 12.
- **Mathlib**: `MeasureTheory.Measure.HaveLebesgueDecomposition`, `singularPart`, `rnDeriv`;
  `Analysis/Distribution/Sobolev.lean` (`besselPotential`, `MemSobolev`, the Fourier
  characterisation, `MemSobolev.laplacian`); `LinearPMap` adjoints and `IsSelfAdjoint`;
  `InnerProductSpace.laplacian`. **Tau Ceti**: `Analysis/Sobolev` (Bessel potential comparison,
  `Wkp`, smooth cutoffs), `Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`,
  `Geometry/Manifold/Riemannian/VolumeDensity`, `Analysis/PDE/Spectrum`.

Merge order: the only suppliers that appear in `merge-order/ORDER.txt` are VonNeumannAlgebras,
PseudodifferentialOperators and HilbertModules (the first and last through UnboundedOperators); the
others are on main or are other authors' pull requests. Insert the roadmap directly after
`HilbertModules`, so that AutomorphicSpectralTheory and CongruenceSpectralGap, which come later in the
order, may consume it.

## Consumers

- **CongruenceSpectralGap** §0.2 (PR #1504): replaces its hand-made Gaffney cutoff argument on
  `Γ(N')\ℍ` by item 9, and its maximal-domain description by item 7.
- **AutomorphicSpectralTheory** §1.16a (PR #925) and **MaassForms** Layer 0 (PR #1717): the
  essential self-adjointness and maximal domain of the modular Laplacian, and the spectral-type
  vocabulary in which the congruence spectral description (`σ_ac = [1/4, ∞)`, exceptional
  eigenvalues) is phrased.
- **VariationalMethods** 5.3 and **ComplexKahlerGeometry** K5a: the noncompact complete-manifold
  realisation they explicitly leave out.
- **QuantumFoundations** Layers 8–9 and **RelativisticQuantumFieldTheory**: spectral types, the
  interval criterion and Kato–Rosenblum for physical Hamiltonians.
- **SpectralManifolds**, **PositiveMass**, **Yamabe**, **RicciFlow**-type roadmaps: the Laplacian on
  complete noncompact manifolds.
- Future roadmaps: multidimensional quasi-periodic Schrödinger operators and the Bethe–Sommerfeld
  property (kps26), random covers and spectral gaps of hyperbolic surfaces (hm23), scattering
  theory of Schrödinger operators, heat kernels on complete manifolds.

## Sources

Recorded in `packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`.

- `teschl` — G. Teschl, *Mathematical Methods in Quantum Mechanics*, GSM 99, author-hosted online
  edition (author page, certified). §3.3 spectral types (Lemmas 3.14–3.19, (3.83)–(3.85)); Theorem
  6.4 Kato–Rellich; Theorem 7.8 and Lemma 7.9 free Schrödinger operator; Theorem 10.2; Lemma 6.17
  Weyl criterion; §12.1 wave operators.
- `bms02` — Braverman, Milatovic, Shubin, Russian Math. Surveys 57 (2002), arXiv math/0201231v3
  (open repository, certified). §2.1, Theorem 2.3, Theorem 2.7, Corollary 2.10.
- `lp80` — Lax, Phillips, *Scattering theory for automorphic functions*, Bull. AMS 2 (1980)
  (publisher open, certified). Theorem 2.1, Corollary 2.2, §§4–7.
- `kps26` — Karpeshina, Parnovski, Shterenberg, Ann. of Math. 203 (2026), arXiv 2010.05881v3 (open
  repository, certified; text partly OCR). (1.2)–(1.6), Theorem 1.1.
- `hm23` — Hide, Magee, Ann. of Math. 198 (2023), arXiv 2107.05292v3 (open repository, certified).
  Introduction, Theorem 1.1, Corollary 1.3.
- Uncertified, cited by locator only (paywalled): `strichartz83` (JFA 52, 1983), `chernoff73`
  (JFA 12, 1973), `gaffney54` (Ann. of Math. 60, 1954), `rs1`, `rs2`, `rs3` (Reed–Simon I–III),
  `kato76` (Kato, Ch. V §4 and Ch. X §4), `grigoryan09` (Ch. 4, 11), `chavel84` (Ch. I),
  `iwaniec02` (Ch. 4, 7, 11), `lp76` (Lax–Phillips, Ann. of Math. Studies 87), `cfks87` (Ch. 1).
  The Elsevier open archive copies of Strichartz and Chernoff exist but the sources service cannot
  read ScienceDirect; `bms02` carries the proof of item 9 in full generality, so no design step
  depends on an unreadable text.

## Risks

- **Suppliers still in pull requests.** UO-C03, UO-D06, UO-E04, UO-E06 (PR #1027), QuantumFoundations
  §8.2 (PR #1771) and VariationalMethods (PR #1028) are not on main. The design must import them by
  section and may not re-plan them; if their final form changes (for instance UO-C03's general
  non-separable construction), Layer 1's items 2–4 move with it.
- **Two existing plans for the free Laplacian.** UO-E06 realises `−Δ` on `H²(ℝ³)` and
  QuantumFoundations §8.2 realises `−Δ/(2m)` on `H²(ℝⁿ)`; the design must pick one supplier for
  item 14 (QuantumFoundations §8.2 at `m = 1/2` is the general one), write the adapter, and report
  the duplication to the board rather than add a third construction.
- **Distributional Laplacian on a noncompact manifold.** Item 7 needs `Δu` for `u ∈ L²_loc` as a
  distribution on `X`; K5a's bundle distributions are built for compact bases and Tau Ceti has
  `Geometry/Manifold/Distribution` only in an early form. The design may have to define the maximal
  domain chartwise by testing against `C_c^∞` and prove chart independence, which is a foundations
  item far above the present library.
- **Local elliptic regularity on manifolds.** The route to item 9 needs `dom Δ_max ⊆ H¹_loc`
  (indeed `H²_loc`); PDE Lane E states interior estimates on Euclidean domains, so the design owns
  their transport to charts with a Riemannian metric (variable coefficients), or consumes K5a's
  local estimates if they are stated locally.
- **Statement-level targets.** `Suggested.lean` states what the roadmap will prove. Item 5
  (Kato–Rosenblum) can be proved within this roadmap by the trace-class route of rs3 §XI.3 (only
  paywalled texts carry it; Teschl does not); the design should plan that proof or find a legal
  text. Item 12 (Lax–Phillips) needs Eisenstein series, meromorphic continuation and the cusp
  analysis; AutomorphicSpectralTheory §4 proves the congruence case and the general finite-area
  case is a roadmap of its own. The design should either keep item 12 as a stated acceptance Check
  of the vocabulary (not a headline) or make its proof a dependency on a future roadmap; the filed
  target asks for it as a stated target. Legal readable sources for the general case are thin: lp80
  is a survey, lp76 and iwaniec02 are paywalled; Colin de Verdière's *Pseudo-laplaciens II* (Ann.
  Inst. Fourier 1983, Numdam) is a legal alternative the design may fetch.
- **OCR text.** kps26's cached text is partly OCR (its arXiv v3 has no text layer on most pages);
  locators into it must be checked against the page images before they are relied on.
- **Sign and Fourier conventions.** Three Laplacian signs are in play (Mathlib's, DifferentialGeometry's
  `div grad`, the nonnegative `Δ` here) and Mathlib's `2π` Fourier convention; a wrong sign makes
  items 6, 9 and 17 false. The acceptance tests must include `Δ‖x‖² = −2d` for the nonnegative
  operator and the hyperbolic `Δ y^s = s(1−s) y^s`.
