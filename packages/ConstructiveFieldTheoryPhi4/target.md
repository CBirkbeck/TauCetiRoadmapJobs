Verdict: design
Name: ConstructiveFieldTheoryPhi4
Base: none
Owner: none

## Scope

The roadmap builds the lattice, probabilistic side of Euclidean scalar field theory in
dimension `d ≥ 1`, up to the notions needed to state the marginal-triviality theorem of
Aizenman and Duminil-Copin (`aizenman-duminilcopin-2021`, Theorem 1.2, line 190). Everything is
an honest probability measure on a finite-dimensional space, or a family of finite-dimensional
laws; no measure on a space of distributions is constructed, in keeping with
`TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772), which refuses functional measures.

It owns, in this generality:

- **Single-site measures.** Probability measures `ρ` on `ℝ` with `∫ exp(c φ²) dρ < ∞` for every
  `c > 0` ("admissible"); within them the even ones; the φ⁴ measures `ρ_{λ,b}`, `λ > 0`, `b ∈ ℝ`
  (`aizenman-duminilcopin-2021` (1.12), line 145); the Ising measure `½(δ_{−1} + δ_{+1})`; the
  Gaussian measures `ρ_{0,b}`, `b < 0` (the free case, admissible but outside the next class); and
  the Griffiths–Simon class, defined as in `aizenman-duminilcopin-2021` Definition 2.1 (line 363):
  laws of `α Σ_n b_n σ_n` under a ferromagnetically coupled finite Ising system, and their weak
  limits of sub-Gaussian growth `∫ exp(|φ|^α) dρ < ∞` for some `α > 2` ((2.2), line 384).
- **Finite-volume measures.** For a finite set `V ⊆ ℤ^d`, a symmetric coupling
  `J : V × V → [0, ∞)` and admissible `ρ`, the measure with density
  `exp(Σ_{x,y} J_{xy} φ_x φ_y)` against `⊗_V ρ`, with its normalisation `Z`. The filed target's
  nearest-neighbour coupling `J ≥ 0` on the box `V_R = [−R, R]^d ∩ ℤ^d` is the specialisation
  `J_{xy} = J·1_{|x−y|=1}`; general ferromagnetic couplings cost nothing in the inequalities and
  are what the sources state (`sokal-1982` lines 387–424; `peled-spinka-2017` Theorems 2.1 and
  2.3, lines 334 and 515). Reflection positivity and the infrared bound are nearest-neighbour
  (more generally reflection-positive) statements and are stated for that case.
- **Correlation inequalities** for these measures: Griffiths I and II (even admissible `ρ`,
  `J ≥ 0`), the FKG inequality (admissible `ρ`, `J ≥ 0`), the Lebowitz inequality for the
  four-point function and the Gaussian (Newman) inequality for the Griffiths–Simon class.
- **The free-boundary infinite-volume state**: monotone limits of all moments along `V_R ↑ ℤ^d`
  for even admissible `ρ` with uniform moment bounds, its symmetries, and its uniqueness as a
  limit (independence of the exhaustion). The critical point `β_c(ρ, J)` is defined through the
  susceptibility of this state, and the sub-critical regime is `χ < ∞`.
- **Reflection positivity, Gaussian domination and the infrared bound** for the periodic
  finite-volume nearest-neighbour measures, for any admissible `ρ`; the infinite-volume
  consequences in the sub-critical regime; the uniform local integrability of rescaled two-point
  functions that the scaling limit needs.
- **Random fields and Schwinger functions.** A random field on `ℝ^d` as a family
  `(T_f)_{f ∈ C_0(ℝ^d)}` of real random variables, linear in `f` almost surely on every finite
  family, considered up to finite-dimensional distributions; its Schwinger functions `S_n` as
  locally integrable kernels representing the moments, unique almost everywhere
  (`aizenman-duminilcopin-2021` (1.4)–(1.6), lines 56–76); generalised Gaussian processes and
  Wick's law ((1.7), line 81). Realisation of a consistent family of finite-dimensional laws as
  a random field: the Kolmogorov extension theorem for an arbitrary index set with real
  coordinates (Mathlib and Tau Ceti have only the countable case, see Suppliers).
- **The rescaled smeared field** `T_{f,L}` with the block variance `Σ_L` ((1.14)–(1.15),
  lines 159–166) and **reachable random fields**, parametrised by a class `𝒞` of single-site
  measures: the double limit (infinite volume, then continuum, along sequences of parameters)
  of Definition 1.1 (line 167), with the consistency, linearity and symmetry of the limit laws.
  The class of Aizenman–Duminil-Copin is `𝒞 = ` {φ⁴ measures and Ising} with nearest-neighbour
  couplings; Gaussian single-site measures are allowed so that the free field is a reachable
  field of the Gaussian class (see Final targets, item 7, and Risks).
- **The statement** of marginal triviality in `d = 4` (Theorem 1.2) and of its Griffiths–Simon
  extension (Theorem 7.1, line 2006), as summit statements with `sorry`.

Boundaries. The roadmap does not prove marginal triviality (random currents, the switching
lemma and the improved tree-diagram bound of `aizenman-duminilcopin-2021` Sections 3–7 belong
to a later roadmap). It does not construct continuum interacting measures, renormalise, or
treat the two-dimensional stochastic quantisation Gibbs measure, which stays with
`TauCetiRoadmap/PDE` (PR #93, README line 107). It does not build Osterwalder–Schrader
reconstruction, Euclidean free Schwinger distributions in `d = 4`, or Wightman fields, which are
RQFT3 and RQFT7 of `TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772). It does not
build quantum spin systems or KMS states (`TauCetiRoadmap/OperatorAlgebraDynamics` D9, PR
#1137). The DLR formalism of specifications is not developed beyond what the free-boundary
state needs; the Gibbs property of the free-boundary limit is a Check, not a target.

## Final targets

Each target is stated with its hypotheses; locators are into the manifest's texts
(`<id> line N`) or by theorem number for uncertified texts.

1. **Single-site measures and the Griffiths–Simon class.** For `λ > 0`, `b ∈ ℝ` the φ⁴ measure
   `ρ_{λ,b}` is a probability measure with all moments and `∫ exp(c φ²) dρ_{λ,b} < ∞` for all
   `c`; it is even. The Ising measure and the Gaussian measures `ρ_{0,b}` (`b < 0`) are
   admissible and even. The Griffiths–Simon class (`aizenman-duminilcopin-2021` Definition 2.1,
   line 363) is closed under the stated weak limits and contains the Ising measure and every
   φ⁴ measure: `ρ_{λ,b}` is the limit in law of normalised block sums `α_N Σ_{n ≤ N} σ_n` of
   `N` Ising spins with a mean-field ferromagnetic coupling `g_N` (lines 392–406;
   `simon-2020-twelve-tales` lines 1019–1030; proof in `griffiths-simon-1973`, uncertified).
   Check: the Ising measure is the `λ → ∞` limit of `exp(−λ(φ² − 1)²) dφ` normalised ((1.20),
   line 257).

2. **Finite-volume measures.** For finite `V ⊆ ℤ^d`, symmetric `J ≥ 0` and admissible `ρ`:
   `0 < Z < ∞`; every polynomial in the `φ_x` is integrable; the lattice symmetries of `(V, J)`
   act measure-preservingly; if `ρ` is even, the measure is invariant under `φ ↦ −φ` and all
   odd moments vanish (`aizenman-duminilcopin-2021` (1.11)–(1.12), lines 139–147, and (1.17),
   line 230; `sokal-1982` lines 392–409).

3. **Correlation inequalities.** For finite `V`, `J ≥ 0` and even admissible `ρ`:
   Griffiths I, `⟨φ_A⟩ ≥ 0`, and Griffiths II, `⟨φ_A φ_B⟩ ≥ ⟨φ_A⟩⟨φ_B⟩`, for multi-indices
   `A, B`, with the corollary that every `⟨φ_A⟩` is non-decreasing in each `J_{xy}` and in
   `V` (`peled-spinka-2017` Theorems 2.1 and 2.3, lines 334–341 and 515–522, for Ising spins;
   `sokal-1982` lines 412–415 for φ⁴; Ginibre's duplicate-variable proof for even `ρ` per
   `simon-2020-twelve-tales` lines 977–984; `glimm-jaffe-1987` Chapter 4, uncertified). For
   admissible `ρ` (not necessarily even) and `J ≥ 0`: the FKG inequality
   `⟨FG⟩ ≥ ⟨F⟩⟨G⟩` for bounded increasing `F, G` on `ℝ^V` (`sokal-1982` line 423;
   `duminilcopin-2017-lectures` Theorem 1.6, line 429, for the random-cluster route). For `ρ`
   in the Griffiths–Simon class: the Lebowitz inequality
   `⟨φ_xφ_yφ_zφ_t⟩ ≤ ⟨φ_xφ_y⟩⟨φ_zφ_t⟩ + ⟨φ_xφ_z⟩⟨φ_yφ_t⟩ + ⟨φ_xφ_t⟩⟨φ_yφ_z⟩` and Newman's Gaussian
   inequality bounding `⟨φ_{x_1} ⋯ φ_{x_{2n}}⟩` by the Wick sum of two-point functions
   (`sokal-1982` lines 419–422; `frohlich-1982` line 109; `fernandez-frohlich-sokal-1992`
   Part I, uncertified). Both are proved for Ising spins first and transported to the class by
   the block-spin representation and weak limits.

4. **The free-boundary infinite-volume state.** For even admissible `ρ`, translation-invariant
   finite-range `J ≥ 0` on `ℤ^d`: the moments `⟨φ_A⟩_{V_R}` are non-decreasing in `R` and
   bounded, so converge; the limits `⟨φ_A⟩_{J,ρ}` are the moments of a translation-,
   rotation-, reflection- and spin-flip-invariant law on `ℝ^{ℤ^d}` with all moments, and the
   limit is the same along every exhaustion of `ℤ^d` by finite sets (`sokal-1982` lines
   401–411 and 462–464; `aizenman-duminilcopin-2021` lines 231–233; `duminilcopin-2017-lectures`
   Corollary 1.9, line 549, for Ising). The uniform moment bound is proved for the Ising and φ⁴
   measures (for φ⁴ by the integration-by-parts identity `4λ⟨φ_x⁴⟩ = 1 + 2b⟨φ_x²⟩ + Σ_y J_{xy}⟨φ_xφ_y⟩`
   together with Jensen) and for the Griffiths–Simon class by the block-spin representation.
   Define the two-point function `S(x) = ⟨φ_0 φ_x⟩_{J,ρ}`, the susceptibility
   `χ = Σ_x S(x)`, and `β_c(ρ,J) = sup{β ≥ 0 : χ(βJ) < ∞}`; prove `S ≥ 0`, monotonicity of `S` and
   `χ` in `β` (Griffiths II), and the Messager–Miracle-Solé monotonicity of `S` along axes for
   nearest-neighbour `J` (`aizenman-duminilcopin-2021` Proposition 5.1, line 1040;
   `sokal-1982` lines 436–444). Check (Ising, stated): below `β_c` the infinite-volume Gibbs
   measure is unique (`duminilcopin-2017-lectures` Theorem 1.12, line 677, Lebowitz–Martin-Löf);
   for the Griffiths–Simon class this is `aizenman-duminilcopin-2021` Proposition 5.2 (line
   1105), quoted there without proof (see Risks).

5. **Reflection positivity, Gaussian domination, infrared bound.** For the nearest-neighbour
   measure with periodic boundary conditions on the torus `(ℤ/2Lℤ)^d`, any admissible `ρ` and
   `β > 0`: reflection positivity through vertex and edge hyperplanes
   (`peled-spinka-2017` Propositions 2.14–2.15, lines 1328 and 1385, proved for sphere-valued
   spins, the proof being single-site-measure-free), Gaussian domination `Z(τ) ≤ Z(0)` ((46),
   line 1591), and the infrared bound `E(p)·Ŝ^{(L)}(p) ≤ 1/(2β|J|)` for `p ≠ 0`, with
   `E(p) = 2Σ_j(1 − cos p_j)` (`aizenman-duminilcopin-2021` (5.7)–(5.9), lines 1069–1087;
   `peled-spinka-2017` (50)–(52), lines 1707–1741; `simon-2020-twelve-tales` (5.17)–(5.22),
   lines 1516–1559; `frohlich-simon-spencer-1976` Theorem 1, uncertified). Consequences, for
   `ρ` in the Griffiths–Simon class and `β < β_c`, through the identification of the periodic
   and free limits: `Ŝ(p) ≤ 1/(2β|J|E(p))` on `[−π,π]^d ∖ {0}`, the position-space bound
   `S(x) ≤ C(d)/(β|J| |x|^{d−2})` for `d ≥ 3` ((1.23), line 287), and the sliding-scale bound
   `χ_L / L² ≤ Cβ χ_ℓ / ℓ²` for `L ≥ ℓ ≥ 1` with `χ_L = Σ_{x ∈ Λ_L} S(x)` (Theorem 5.6, line
   1248), together with the lower bound of Corollary 5.8 (line 1325). Uniform local
   integrability: for every `ε > 0` the mass of the rescaled two-point kernel
   `Σ_L^{−1} Σ_{x ∈ Λ_L, |x−y| ≤ εL} S(x − y)` is bounded by `C ε²` uniformly in `L` and in the
   parameters, which is what lines 174–179 require of a reachable field's two-point function.

6. **Random fields, Schwinger functions, Gaussian processes.** Definition of a random field on
   `ℝ^d` and of equality up to finite-dimensional distributions (Mathlib's
   `map_eq_iff_forall_finset_map_restrict_eq`); the Kolmogorov extension theorem for an
   arbitrary index set `T` and standard Borel coordinates, realising any projective family of
   laws (`MeasureTheory.IsProjectiveMeasureFamily`) as a law on `T → ℝ` (existence; uniqueness is
   `MeasureTheory.IsProjectiveLimit.unique`); the countable case is
   `TauCeti.Measure.exists_isProjectiveLimit_of_countable`. For a random field with all
   moments whose moment functionals `f_1 ⊗ ⋯ ⊗ f_n ↦ E[T_{f_1} ⋯ T_{f_n}]` are given by locally
   integrable kernels: the Schwinger functions `S_n` are unique almost everywhere
   (`aizenman-duminilcopin-2021` (1.5)–(1.6), lines 59–75). A random field is a generalised
   Gaussian process if every finite family `(T_{f_1}, …, T_{f_k})` has a Gaussian law
   (`ProbabilityTheory.IsGaussianProcess` indexed by `C_0(ℝ^d)`). Theorem: for a centred random
   field with all moments, Gaussianity implies Wick's law `S_{2n} = Σ_pairings Π S_2` and
   `S_{2n+1} = 0` ((1.7), line 81; Wick–Isserlis from `TauCetiRoadmap/StandardDistributions`,
   README line 605), and conversely Wick's law for all mixed moments implies Gaussianity
   (moment determinacy of Gaussian laws, see Risks).

7. **Reachable random fields and the Gaussian free field.** For a class `𝒞` of even admissible
   single-site measures, a random field `Φ` is `𝒞`-reachable if there are nearest-neighbour
   couplings `J_n ≥ 0`, measures `ρ_n ∈ 𝒞`, scales `L_n → ∞` and volumes `R_{n,m} → ∞` such that
   for every finite family `f_1, …, f_k ∈ C_0(ℝ^d)` the laws of `(T_{f_i, L_n})_i` under
   `⟨·⟩_{J_n, ρ_n, R_{n,m}}` converge weakly in `ℝ^k` as `m → ∞` and the limits converge weakly as
   `n → ∞` to the law of `(T_{f_i}(Φ))_i` (`aizenman-duminilcopin-2021` Definition 1.1 and
   footnote 2, lines 167–187). Theorems: the limit laws form a projective family, so a reachable
   field exists and is unique up to finite-dimensional distributions once the limits exist;
   the limit is linear in `f`; it is centred and invariant under `Φ ↦ −Φ` and under the limits
   of lattice symmetries; and the normalisation `Var T_{1_{[−1,1]^d}}(Φ) = 1` holds when the
   block variance is used. The Gaussian free field: for `m > 0` and every `d ≥ 1` the centred
   Gaussian random field with covariance `∫∫ f(x) G_m(x − y) g(y) dx dy`, `G_m` the Green function
   of `−Δ + m²` on `ℝ^d`, is reachable from the Gaussian class `𝒞 = {ρ_{0,b} : b < 0}` with
   `J_n = 1`, `b_n = −(d + m²/(2L_n²))`, by convergence of the rescaled lattice Green function and
   the infrared bound (`sokal-1982` Section 2.3, Lemma 2.2, lines 700–721; `frohlich-1982`
   line 269). In `d = 4` the kernel `G_m` is the one of RQFT7.FreeReflection in
   `TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772, README lines 3481–3490), recorded
   as a Check against that roadmap's covariance, not re-proved. Check: the massless field in
   `d ≥ 3` is reachable from the same class with `b_n = −d`.

8. **Marginal triviality in four dimensions (statement).** For `d = 4` and the class
   `𝒞 = ` {φ⁴ measures `ρ_{λ,b}`, `λ > 0`} ∪ {Ising}: every `𝒞`-reachable random field whose
   two-point Schwinger function `S_2` exists as a function with `S_2(x, y) → 0` as `|x − y| → ∞`
   is a generalised Gaussian process (`aizenman-duminilcopin-2021` Theorem 1.2 with (1.10),
   lines 126 and 190–191). The Griffiths–Simon extension: the same for `𝒞` the Griffiths–Simon
   class (Theorem 7.1, line 2006, and the discussion at lines 2020–2047). Both are stated in
   `Suggested.lean` with `sorry` as the roadmap's summit; their proofs are out of scope.

## Suppliers

- `TauCetiRoadmap/StandardDistributions` (main): `multivariateGaussian`, `HasGaussianLaw`,
  `covMatrix`, the Wick–Isserlis mixed-moment theorem (README line 605, Layer 5), and the
  Gaussian characteristic function; used in targets 6–7.
- Mathlib (pinned): `MeasureTheory.IsProjectiveMeasureFamily`, `IsProjectiveLimit`,
  `IsProjectiveLimit.unique` (Mathlib/MeasureTheory/Constructions/Projective.lean);
  `ProbabilityTheory.IsGaussianProcess` and `HasGaussianLaw`
  (Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean); finite-dimensional
  laws and modifications (Mathlib/Probability/Process/FiniteDimensionalLaws.lean); weak
  convergence of probability measures, Portmanteau, Lévy–Prokhorov and Prokhorov
  (Mathlib/MeasureTheory/Measure/Portmanteau.lean, Prokhorov.lean, LevyProkhorovMetric.lean);
  Lévy's continuity and Cramér–Wold (Mathlib/Probability/CramerWold.lean); the infinite product
  measure `Measure.infinitePi` (Mathlib/Probability/ProductMeasure.lean).
- Tau Ceti (pinned): `TauCeti.Measure.exists_isProjectiveLimit_of_countable` and
  `exists_isProjectiveLimit_nat` (TauCeti/MeasureTheory/Measure/ProjectiveLimit/), the countable
  Kolmogorov extension that the general-index theorem of target 6 reduces to on countable
  subfamilies.
- `TauCetiRoadmap/StochasticCalculus` (PR #1030, merge order line 199): Layer 1 Gaussian
  processes and the projective-family construction of Brownian motion; a pattern supplier only,
  since its families are indexed by times, not by test functions. The design should import its
  Layer 0 process vocabulary where the random-field definitions coincide.
- `TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772, another author's PR): RQFT0 test
  carriers and RQFT7.FreeReflection's massive covariance `G_m` in `d = 4` for the Check in
  target 7; not a dependency of any proof.

The roadmap is inserted in the merge order after `StochasticCalculus` and
`LocalVariationalFieldTheory` (lines 199 and 211).

## Consumers

- A later roadmap proving marginal triviality: random current representation, switching lemma,
  tree-diagram and improved tree-diagram bounds (`aizenman-duminilcopin-2021` Sections 3–7;
  `aizenman-1982`), consuming targets 1–8 verbatim.
- Ising-type statistical mechanics (phase transitions by the Peierls argument and by the
  infrared bound, Lee–Yang, sharpness), for which targets 2–5 are the base; no roadmap owns it.
- `TauCetiRoadmap/RelativisticQuantumFieldTheory` (PR #1772): a reachable field's Schwinger
  functions as candidates for its Osterwalder–Schrader data, and its Euclidean free field
  matched to target 7.
- `TauCetiRoadmap/PDE` (PR #93): lattice approximations of the two-dimensional stochastic
  quantisation measure.
- `TARGET-DimerModelsAndLozengeTilings` (#6003): shares only the vocabulary of
  translation-invariant infinite-volume measures on a product space; no theorem is shared.

## Sources

Recorded in `packages/ConstructiveFieldTheoryPhi4/sources.toml`.

- `aizenman-duminilcopin-2021` — M. Aizenman, H. Duminil-Copin, *Marginal triviality of the
  scaling limits of critical 4D Ising and φ⁴₄ models*, Ann. of Math. 194 (2021); read as
  arXiv:1912.07973v4 (open repository, certified). Definition 1.1 (line 167), Theorem 1.2 (line
  190), Definition 2.1 (line 363), Section 5 (lines 1003–1345), Theorem 7.1 (line 2006).
- `sokal-1982` — A. D. Sokal, Ann. IHP A 37 (1982) 317–398; Numdam (open repository,
  certified): Section 2.2 (lines 387–480) lists the lattice φ⁴ properties and inequalities,
  Proposition 2.1 (line 574), Remark 4 on uniqueness (lines 615–619), Section 2.3 and Lemma 2.2
  (lines 620–721) on the continuum limit.
- `peled-spinka-2017` — R. Peled, Y. Spinka, *Lectures on the spin and loop O(n) models*,
  arXiv:1708.00058v3 (certified): Griffiths I and II (Theorems 2.1, 2.3), reflection positivity,
  Gaussian domination and the infrared bound (Section 2.7).
- `duminilcopin-2017-lectures` — H. Duminil-Copin, *Lectures on the Ising and Potts models on the
  hypercubic lattice*, arXiv:1707.00520v1 (certified): FKG (Theorem 1.6), monotonicity
  (Corollary 1.7), free-boundary infinite-volume limit (Corollary 1.9), uniqueness below `β_c`
  (Theorem 1.12).
- `simon-2020-twelve-tales` — B. Simon, arXiv:2011.12335v2 (certified): Section 3 on
  correlation inequalities and the Griffiths–Simon approximation (lines 977–1030), Section 5 on
  infrared bounds (lines 1424–1560).
- `frohlich-1982` — J. Fröhlich, Nucl. Phys. B 200 (1982); read as IHES preprint P/81/41
  (institutional repository, certified; OCR with missing displays): lattice φ⁴ set-up and the
  Lebowitz inequality (lines 51–111).
- Uncertified, cited by locator only (paywalled; the open Project Euclid copies of the three
  Communications papers refuse automated fetching): `griffiths-simon-1973` (CMP 33, 145–164),
  `aizenman-1982` (CMP 86, 1–48), `frohlich-simon-spencer-1976` (CMP 50, 79–95, Theorem 1),
  `glimm-jaffe-1987` (Chapters 4, 6, 8), `simon-1974` (Chapters I–IV),
  `fernandez-frohlich-sokal-1992` (Part I), `friedli-velenik-2017` (Chapters 3 and 6; the
  authors' free preprint page blocks fetching).

## Risks

- **Proof-level sources for the Griffiths–Simon class are not readable.** The block-spin
  representation of φ⁴ measures (`griffiths-simon-1973`), the Lebowitz and Gaussian inequalities
  for the class, and uniqueness of the infinite-volume state below `β_c`
  (`aizenman-duminilcopin-2021` Proposition 5.2 is quoted without proof; Sokal points to
  Lebowitz–Martin-Löf and GHS) have full proofs only in paywalled or blocked texts. The open
  texts give statements and the Ising-spin proofs. The design can proceed on the Ising and
  φ⁴ cases from the open texts; if a human supplies local copies of the Project Euclid papers
  or of Glimm–Jaffe, the class-level targets become certifiable. Otherwise the design should
  state the class-level inequalities with the Ising proofs transported by the block-spin
  construction and keep Proposition 5.2 as a hypothesis of target 5's infinite-volume part.
- **Kolmogorov extension for uncountable index sets** is absent from Mathlib and Tau Ceti;
  only the countable case exists. The roadmap must own the general case (compact-class or
  inner-regularity argument on `ℝ^T`), or define random fields by projective families and
  realise them on a countable dense subfamily of `C_0(ℝ^d)` as footnote 2 of
  `aizenman-duminilcopin-2021` suggests. The first route is a library contribution of broad use
  and is the recommended one.
- **Moment determinacy.** The converse in target 6 (Wick's law implies Gaussian law) needs that
  a law on `ℝ^k` with Gaussian moments is Gaussian (Carleman-type determinacy or an mgf bound
  from the moment growth); Mathlib has characteristic-function uniqueness but the design must
  check what moment-determinacy it has and plan the gap.
- **Uniform moment bounds for unbounded spins** beyond φ⁴ (needed for the infinite-volume
  limit of a general Griffiths–Simon measure) require either the block-spin representation with
  limits or superstability; the design should restrict target 4's uniform bounds to Ising, φ⁴ and
  Gaussian measures and derive the class case by weak limits of the already-bounded moments.
- **Free versus periodic states.** The infrared bound is proved with periodic boundary
  conditions; transferring it to the free-boundary state uses uniqueness below `β_c`. If that
  cannot be sourced, the infinite-volume bounds in target 5 should be stated for the periodic
  limit state, and the free-boundary bound for Ising only.
- **The Gaussian free field target** needs convergence of the rescaled lattice Green function
  to the continuum Green function with uniform local integrability; this is classical analysis
  (Fourier inversion and dominated convergence) but no open source in the manifest proves it in
  the stated generality, and in `d = 4` the kernel must agree with RQFT7's conventions.
- **Size.** Targets 1–7 are each a chapter; the design should keep the correlation inequalities
  and the random-field layer independent so that a Part II can take the infrared-bound
  consequences if the first roadmap grows too large.
