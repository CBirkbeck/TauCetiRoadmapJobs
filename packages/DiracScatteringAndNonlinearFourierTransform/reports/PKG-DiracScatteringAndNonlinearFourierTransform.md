# Package of DiracScatteringAndNonlinearFourierTransform

This package writes out the accepted design as the roadmap folder:

- `packages/DiracScatteringAndNonlinearFourierTransform/README.md`;
- `packages/DiracScatteringAndNonlinearFourierTransform/Suggested.lean`;
- `packages/DiracScatteringAndNonlinearFourierTransform/metadata.toml` (`topic = "math.CA"`);
- `packages/DiracScatteringAndNonlinearFourierTransform/sources.toml` (unchanged: no source was added or fetched).

`design/plan.json` changes only in its top-level `gaps` list (one supplier gap, below). A round-trip check
confirmed that every other key is unchanged (indent 1, UTF-8, final newline).

The README keeps every target, Check and worked example of the design: 55 sections, 55 `**Checks.**` blocks,
55 `*Needs:*` lines, nine `### Examples` and nine `### Dependencies`. It adds the Lean names of
`Suggested.lean` at the sections that introduce their objects, and makes the corrections listed below.

## Headline theorems

| Headline (README) | Status | Lean name |
|---|---|---|
| Linear Carathéodory theorem with an integrable coefficient (§1.2) | stated | `linear_caratheodory` |
| Existence, uniqueness on `[0, ∞)` and entire dependence of the Dirac fundamental system (§3.1) | stated | `existsUnique_diracFundamentalSystem` |
| Finite non-linear Plancherel identity `∫ log|a(t, x)| dx = (π/2)∫₀ᵗ|q|²` (§4.4) | stated | `nonlinear_plancherel` |
| Non-linear Fourier transform on `ℝ` as the `L²` limit of truncations with rate `4π‖q‖²_{L²(T,∞)}`, `|q⌃*| < 1`, Plancherel identity at infinity (§5.4–§5.5) | stated | `exists_nonlinearFourier_plancherel` |
| Existence of the Neumann and Dirichlet spectral measures (Weyl limit point and Herglotz representation, §6.4–§6.5) | stated | `exists_isSpectralMeasureOf` |
| Isometric embedding `PW_t → L²(μ_q)`, `L²(μ̃_q)` (§6.6) | stated | `spectralMeasure_isometry` |
| Uniqueness of the spectral measure (§6.6) | stated | `spectralMeasure_unique` |
| Szegő condition for square-integrable potentials (§6.8) | stated | `szego_condition` |
| Pointwise convergence at almost every resonance-free point, with the strong form, convergence of `|a|`, `|b|` and bounded generalised eigenfunctions (§9.6) | stated | `tendsto_truncation_of_isResonanceFree` |

Every headline theorem is statable at the pins, and the module docstring says so. That almost every point
is resonance-free for every real square-integrable potential (with §9.6 this would give poltoratski2024
Theorem 1) is not a target of the roadmap, and the docstring says that too.

Results considered and not stated as headlines:

- The Hermite–Biehler property (§3.3), the half-plane inequality (§4.3) and the outer-multiplier theorem
  (§2.8) are classical tools of the layers, not results the roadmap is named by.
- Universality of reproducing kernels (§8.2) is an intermediate step towards §9.6.

All of these stay README targets.

Definitions in `Suggested.lean`, each needed by a statement above and each with a real body:

- `diracCoeff`;
- `IsDiracSolution`;
- the structure `DiracFundamentalSystem`, which bundles the Neumann and Dirichlet solutions with their
  integral equations;
- `DiracFundamentalSystem.hermiteBiehler`, `DiracFundamentalSystem.hermiteBiehlerDirichlet`;
- `DiracFundamentalSystem.scatteringA` and `DiracFundamentalSystem.scatteringB`, defined by the dictionary
  of §4.1;
- `DiracFundamentalSystem.IsResonanceFree`;
- `IsSpectralMeasureOf`, the Poisson representation of the limits of the imaginary parts of the Weyl
  approximants;
- `paleyWienerFunction`.

The fundamental solutions are characterised by their integral equations rather than constructed. So no
definition depends on an existence theorem, and `existsUnique_diracFundamentalSystem` makes the other
statements non-vacuous and about the unique object. Likewise `exists_isSpectralMeasureOf` makes the
statements that assume a spectral measure non-vacuous.

## Elaboration

`lake env lean packages/DiracScatteringAndNonlinearFourierTransform/Suggested.lean`, run from the content
checkout at the pins: exit code 0, exactly **9** warnings `declaration uses 'sorry'` (lines 51, 127, 140,
155, 182, 191, 206, 221, 242), and no other message. The header is `module` then `import Mathlib`, with no
`TauCeti.*` import.

The file contains no `set_option`, `#eval`, `#print`, `lemma`, `True` placeholder or sorry'd data.

**`#check` comparison.** A scratch copy with `#check @name` or `#print name` for all 19 declarations was
elaborated once, and each elaborated type was compared with its README statement. Every binder is in the
declaration's own signature: no section `variable` is used except the implicit `q` of the
`DiracFundamentalSystem` namespace, which every definition there mentions through `S`. The comparison
confirmed:

- `diracCoeff q z t = !![↑(q t).re, -z - ↑(q t).im; z - ↑(q t).im, -↑(q t).re]`, which is `−Ω(z − Q_q)`;
- `*ᵥ` parses as `(diracCoeff q z s).mulVec (X s)`;
- `exp` resolves to `Complex.exp`;
- real points are coerced as `↑x`;
- `π` is `Real.pi`.

Nothing changed as a result.

## What changed from the design (corrections)

- **`fourier_real_eq` → `Real.fourier_real_eq`.** At the pin the declaration lives in namespace `Real`
  (`Mathlib/Analysis/Fourier/FourierTransform.lean` line 483). The bare name is unknown, as an elaboration
  check showed; there were 4 occurrences.
- **Full names for six abbreviated Mathlib names.** `IntegrableOn`, `Measure.ext_of_charFun`,
  `Measure.rnDeriv`, `Measure.singularPart`, `TendstoInMeasure.exists_seq_tendsto_ae` and
  `tendstoInMeasure_of_tendsto_eLpNorm` were written without their `MeasureTheory.` prefix. They are now
  written in full.
- **§8.6 route.** The design's normalisation step said the determinant identity "at two points fixes
  `2|β|²w(s) = (1 + o(1)) sinh(2ty)`". It now derives the relative error explicitly:
  `D(t, conj z(t), z(t)) = 2i|β|²` gives `K_t(z(t), z(t)) = |β|²/(πy(t))`, and §8.2 then gives
  `2|β|²w(s) = (1 + o(1)) sinh(2ty(t))` at every height. *Needs:* gains §8.2. This is the gap in
  poltoratski2024 Lemma 6 (line 899–901) that the last design review recorded under "Source issues".
- **§2.6 locator.** mauth2022 Lemma 9 (line 469–471) states only that a function whose transform vanishes on
  the negative half-line is a boundary value. The locator now says so; the equivalence rests on garnett2007
  p. 84, which is uncertified.
- **Scope paragraph.** The sentence that the moduli compared in §9 of poltoratski2024 v14 "cannot exclude a
  resonance" now says that they are pseudo-hyperbolic distances unchanged by the insertion (§9.4, fourth
  Check) and that this roadmap does not use that comparison. "Not claimed" became "not a target". The facts
  are unchanged.
- **Generality of §1.2.** The README now says that the statement is made over `ℝ`, and that the case
  `𝕜 = ℂ` is the real statement for the underlying space by restriction of scalars, as in
  `linear_caratheodory`. A coefficient on `[a, b]` is `MeasureTheory.IntegrableOn`.
- **Conventions.**
  - "All types live in `Type`" became "may live in any universe" (`linear_caratheodory` takes `E : Type*`).
  - A bullet now says that `Suggested.lean` characterises the solutions rather than constructing them.
  - §3.1 explains why the carrier `Fin 2 → ℂ` gives the same solutions as `EuclideanSpace ℂ (Fin 2)`:
    `EuclideanSpace.equiv` is the identity on coordinates, and the integral equation and continuity do not
    see the norm. *Needs:* of §3.1 gains §1.2 and `EuclideanSpace.equiv`.
- **Supplier heading.** `### From TauCetiRoadmap.OperatorTheory.UnboundedOperators` became
  `### From TauCetiRoadmap.OperatorTheory/UnboundedOperators`, the roadmap's path and the form other
  roadmaps on main use. The dependency check accepts it.
- **Supplier gap.** See the next section.
- **AsymptoticExpansions §10.1.** One paragraph in Scope and ownership now says how §1.2 differs from that
  section's scalar Volterra theorem (next section but one).

## What the README could not support without a supplier change

OperatorTheory/UnboundedOperators §4.8 (UO-D07, on main) states the limit-point/limit-circle alternative
only for Sturm–Liouville expressions. For `Ju′ + V(r)u` it asks for "the analogous ... endpoint
classification API" (its README line 861–863) without writing the alternative out. §6.4 consumes that
alternative.

This is declared as **gap:dirac-weyl-alternative** in `design/plan.json` and in the README, in that
supplier's subsection: the alternative at `∞` for `Ju′ + Vu = λu` on `[0, ∞)`, with its independence of
`λ`. This was one of the "For the human reviewers" items of the last design review.

No source is missing: no `needs-references.toml` was written. garnett2007 (uncertified) and
coddingtonlevinson1955, debranges1968, remling2018 and krein1955 (waived) are cited by locator only. No
notion was moved down from a later roadmap.

## Duplication sweep and ownership

No target was removed: nothing the roadmap owns was found elsewhere. The search was by object.

**Pinned libraries** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Searched for:

- Paley–Wiener, de Branges, Hermite–Biehler, outer functions, Szegő, scattering, Weyl functions, Weyl
  discs, limit point;
- non-tangential limits, Blaschke products, inner functions;
- Carathéodory, Grönwall, Liouville's formula, Riccati equations, `det_exp`.

No half-plane object of Layers 2–9 exists at the pins. The matches are:

- disc objects: Mathlib's `canonicalFactor`, Tau Ceti's `planarPoissonIntegral`, `TauCeti.HardySpace`;
- the cited Gronwall and Carathéodory modules, with constant kernel or essentially bounded coefficient;
- Tau Ceti's band-limited Hörmander estimates (`Analysis/Distribution/SchwartzSpace/BandLimited.lean`),
  which concern Mihlin multipliers, not `PW_t`.

All 80 Mathlib names in the README `#check` at the pin. All 40 Tau Ceti names are declared at the cited
file and line; their object files are not built on this host, so they were verified by a namespace-aware
scan of the pinned source rather than by `#check`.

**Roadmaps on main and the open roadmap pull requests.** I ran `roadmaps grep` at the indexed heads for
20 object patterns:

- Hermite–Biehler, de Branges, Paley–Wiener, non-linear Fourier, Carathéodory, Grönwall;
- Weyl function, Hardy space, outer function, Szegő, Dirac system;
- Liouville's formula, nontangential, Herglotz, inner function, Blaschke, Riccati;
- canonical system, Krein system, Fatou.

Each match outside known owners was read:

- **SchrodingerOperatorsAndSpectralTypes** (open, later in the merge order): abstract spectral types,
  Laplace–Beltrami and Schrödinger operators on `ℝ^d`. It has no one-dimensional Weyl function, Dirac
  system or half-plane theory, so nothing is shared.
- **SymmetricHyperbolicSystems** (open): uses Mathlib's differential and discrete Grönwall.
- **AsymptoticExpansions §10.1** (main): the scalar Volterra equation with a continuous separable kernel.
  §1.2 has an integrable operator coefficient and neither statement contains the other; Scope now says so.
- **StochasticCalculus S6.5** (harmonic Hardy spaces on balls), **OperatorTheory/ToeplitzOperators**
  (disc `H²`) and **IndexTheory** (Hardy-space shift): disc or ball objects, already named in Scope.
- **SpecialFunctionsOrthogonalPolynomialsGeneral** (Szegő for orthogonal polynomials),
  **SpecialFunctionsGamma** (de Branges–Wilson integral), **FunctionFieldArithmetic** and
  **AutomorphicSpectralTheory** (Weyl functional equations, Paley–Wiener for spherical transforms):
  different objects.
- **IncompressibleFlows**: Liouville's formula for flows. It is on the never-cite list and is not cited.

Board packages: the index lists two (AnalyticNumberTheory, LawrenceVenkateshMethod), neither related. A
grep of the board's package READMEs found only FunctionFieldArithmetic's "Weyl functional equations".
`scratch/overlaps.md`: no pull request changes this roadmap, no cited id is dropped, no second copy.

This roadmap therefore owns the integrable-coefficient linear theory, the half-plane Hardy, Paley–Wiener
and outer-function theory, the Dirac scattering objects, the Weyl functions and spectral measures of Dirac
systems, and the pointwise theory. Ownership against open pull requests was checked through the tools at
the indexed heads. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's:
all sit in `TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform`.

**Supplier citations, resolved against current text:**

- AnalyticNumberTheoryPartI §0.23 (main, "### 0.23 Finite-order Hadamard factorization"; merge order line
  54). It states the genus-`n` canonical product with `h` of degree `≤ n` and `Σ|α|^{−n−1} < ∞`, as the
  contract says.
- AutomorphicSpectralTheory §0.5 (open head, a new roadmap folder; merge order line 104). It states the
  unique triple with `a = Re F(i)`, `b ≥ 0` and `∫(1 + t²)⁻¹dν < ∞`, obtained from Tau Ceti's finite `ρ`.
- OperatorTheory/UnboundedOperators §4.8 (main): see the gap above.
- `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere. It did not check
  library names; those were checked as above.

## Non-blocking notes of the accepted review

`design/review.json` records that the two P3 findings of the last review were repaired before acceptance.
Both repairs are present in the README:

- §5.4: the cross term bounded by `(L(|ρ₁|)L(|ρ₂|))^{1/2}`;
- §7.2: the mauth2022 Lemma 29 locator with its radius `4|y − x|/ε`.

From that review's "Source issues" and "For the human reviewers" sections:

- the Lemma 9 restriction to `T₁` was already in §9.3;
- the Lemma 6 relative error and the mauth2022 Lemma 9 direction are now handled (corrections above);
- the UO §4.8 "analogous" contract is now a declared gap;
- the scope sentence on poltoratski2024 v14 §9 is reworded.

The two remaining scope items are for a human, and no edit was made for them:

- the headline is conditional on `R(f)`;
- the routes of §8.7(1), §8.8 and §9.3 are this roadmap's own.

## Adversarial pass

Values were computed by hand or in plain Python (RK4 on the Dirac and scattering systems, Simpson
quadrature), in scratch only.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `linear_caratheodory` | `P(t) = t^{−1/2}` on `(0, 1]`, `t₀ = 0`; `P = 0`; `P = 1/t` | `y₀ + ∫₀¹ s^{−1/2}y₀e^{2√s} ds = y₀e² = 7.389y₀` (unbounded integrable coefficient); `Y ≡ y₀`; `Y = ct` solves for every `c` (excluded by `hP`) | holds; integrability needed | README generality note (ℝ, restriction of scalars) |
| `linear_caratheodory`, context | `[CompleteSpace E]`; junk Bochner integral | `P s (Y s) + F s` integrable on `[a, b]` for continuous `Y` (`‖P s (Y s)‖ ≤ ‖P s‖ sup|Y|`), so the integral is genuine; without completeness the integral would be `0` | binders present | none |
| `diracCoeff` sign | `−Ω(z − Q)` with `Ω = [[0,1],[−1,0]]`; real `f = c`, `z = 0` | `[[f, −z−g], [z−g, −f]]`; `Θ = (e^{ct}, 0)`, the opposite sign gives `e^{−ct}` | matches Conventions witness | none |
| `existsUnique_diracFundamentalSystem` | `q = 0`; `q = c` at `z = 0` | `Θ = (cos tz, sin tz)`: `(cos tz)′ = −z sin tz`, `(sin tz)′ = z cos tz`, entire; `Φ = (0, e^{−ct})` | holds | none |
| `IsDiracSolution` junk | `X ≡ (1, 0)` for `q = 1` | `∫₀ᵗ diracCoeff · X = (t, t z) ≠ 0`, equation fails; non-measurable `X` forced to be the genuine solution by continuity on `[0, ∞)` | continuity clause kept | none |
| `hermiteBiehler`, `hermiteBiehlerDirichlet` at `t = 0` | initial values | `E = 1 − i·0 = 1`, `Ẽ = 0 − i·1 = −i` | matches §3.2 | none |
| `scatteringA`, `scatteringB` (dictionary) | `t = 0`; smooth complex `q` of §3.1 at `t = 1.7`, `z = 0.6 + 0.25i` | `a = (1 + 1)/2 = 1`, `b = 0`; `a = 1.063206 + 0.144265i` against `G₂₂` (difference `5.2·10⁻¹⁵`), `b = 0.074961 + 0.246302i` against `G₂₁` (`1.1·10⁻¹⁵`), `det M = 1.0000000000000004` | holds | none |
| SU(1,1) on `ℝ` and in `ℂ₊` (used by all Layer 4–9 statements) | same `q`, `x = −1.3, 0, 0.7, 2.5`; `z = 0.5 + 0.2i, −2 + 0.01i, 1.5i, 3 + i` | `|a|² − |b|² = 1.000000000000` at each `x`; `1.0786, 1.0100, 1.1950, 1.0780` in `ℂ₊`; `Im(−Ẽ/E)|E|² = 1.0000` and `|E| ≤ 2|a|` at each `x` | holds | none |
| `nonlinear_plancherel` | `q = 1` on `[0, 1]`; `t = 0`; constant `1` of the sources | closed form `|a(1, x)|` matches the ODE (`1.543081` at `x = 0`); `∫ log|a| = 1.570671` on `[−4000, 4000]` plus tail `1.25·10⁻⁴` = `1.570796` against `π/2 = 1.570796`; `y(a(1, iy) − 1) = 0.4853, 0.4987` at `y = 10, 100`; `t = 0`: `0 = 0`; constant `1` would give `1 ≠ 1.5708` | holds | none |
| `exists_nonlinearFourier_plancherel` | `q = 1_{[0,2]}`, `T = 1`; `q = 0`; `T = 0` | `∫|ρ(2,·) − ρ(1,·)|² = 1.0582 ≤ 4π = 12.566`; `sup|F| = 0.964028 = tanh 2 < 1`; `∫ −log(1 − |F|²) = 6.28285` on `[−3000, 3000]` against `2π = 6.28319`; `q = 0`: `F = 0`, `b = e^{iTx}(e^{−iTx} − e^{−iTx})/2 = 0`; `T = 0`: `ρ = 0`, `∫|F|² ≤ ∫ −log(1 − |F|²) = π‖q‖² ≤ 4π‖q‖²` | holds | none |
| `exists_nonlinearFourier_plancherel`, rate | `|q⌃* − ρ₁| ≤ |ρ₂|(1 + |ρ₁|)` | `q⌃* − ρ₁ = uρ₂(1 − |ρ₁|²)/(1 + uρ₂ conj ρ₁)`, `|1 + uρ₂ conj ρ₁| ≥ 1 − |ρ₁|` | holds; `4π` | none |
| `IsSpectralMeasureOf` (determines its object) | free `m_t = i`; `μ = dx`, `2dx`, `δ₀`; kernel without `1/π` | `∫P(z, x)dx = 1 = Im i` (satisfies); `2 ≠ 1`; `P(i, 0) = 1/π = 0.3183 ≠ 1` (fail); without `1/π` the measure would be `dx/π`, excluded by §2.1's Check `P[dx] ≡ 1`; `(β, μ)` unique since `u(iy)/y → β` and §2.2 | determines `μ_q` | README §6.5 sentence |
| `IsSpectralMeasureOf`, junk integral | non-Poisson-finite `μ` | Bochner integral would be `0`; excluded by the Poisson-finite clause | clause kept | none |
| `exists_isSpectralMeasureOf` | complex `q` of §3.1 | `Im(−Ẽ/E) = 1/|E|² > 0` on `ℝ` (`1.0000·|E|⁻²`); `Im m > 0` from the Weyl discs | holds for complex potentials | none |
| `spectralMeasure_isometry` | free; `q = c1_{[0,T]}`, `t ≥ T` | `|E(t, x)| = 1`, `μ = dx`; `|E(t, x)| = |e^{−i(t−T)x}E(T, x)| = |E(T, x)|`, `μ = dx/|E(T, ·)|²`, both sides `∫|F|²/|E(T, ·)|²` | holds | none |
| `spectralMeasure_unique` | `ν = 2dx` in the free case; zeros of `k_ε` | `∫|F|²·2dx = 2‖F‖² ≠ ‖F‖²` (fails, as §6.6's Check); zeros `kπ/ε` and `k′π/ε′` disjoint for `ε′/ε ∉ ℚ`, `k_ε(0) = ε ≠ 0` | holds; Poisson-finiteness kept as in the README (not needed for truth, P3) | none |
| `szego_condition` | free; barrier `f = 0.7` on `[0, 1.3]`; `f ≡ c > 0` | `0 ≥ −2π log 2 = −4.3552`; `∫ log w dΠ = π·(−0.918466) = −2.8854 ≥ −4.3552 − π·0.637 = −6.3564`; `w = 0` on `(−c, c)`, `∫ log w dΠ = −∞` (excluded by `hq`) | holds; `L²` needed | none |
| `szego_condition`, Dirichlet side | `|Ẽ(T, x)| = |a − b| ≤ 2|a|`; disjunction | same bound as for `E`; a measure satisfying either predicate gets the conclusion | holds | none |
| `IsResonanceFree` junk | `t < 0`; `t = 0` (`C/0 = 0`); `f ≡ 1` at `s = 0` | box empty for `C/t < 0`; box `{s}`, `E(0, s) = 1`, `Ẽ(0, s) = −i`, both nonzero; zero of `Ẽ(5, ·)` at `−9.0808·10⁻⁵ i` (§9.4 Check), not resonance-free | no spurious failure | none |
| `tendsto_truncation_of_isResonanceFree` | `f = 0`; `f = c1_{[0,T₀]}`; `f ≡ 1` (not `L²`) at `s = 1/2` | `ρ_T = 0`, `|a| = 1`, `|b| = 0`, `Θ = (cos ts, sin ts)` bounded; `a(T, ·) = a(T₀, ·)` for `T ≥ T₀`, continuous with `a(T₀, s) ≠ 0`, so the disc statement holds; `|E(10, 1/2)| = 6434` grows, unbounded `M` (excluded by `hf`) | holds; `L²` needed | none |
| `tendsto_truncation_of_isResonanceFree`, measurability | non-measurable `F` with lower integral `→ 0` | indicator of a set of full outer and zero inner measure has `∫⁻ = 0` but is not `0` a.e.; `hFm : AEStronglyMeasurable F` added | added in the Lean statement from the start | none |
| Strong form constant | §9.5 limit `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)` | denominator `|·|² = 1/w + 1/w̃ + 2 > 0` since `Im β = −√(ww̃)`; `|e^{iTz}| ≤ e^{C}` on the disc | holds | none |
| §8.6 normalisation (README change) | zero `z₀ = x − iy` with `A(z₀) = iC(z₀) = β` | `E(conj z₀) = conj β − i(i conj β) = 2 conj β`; `D(conj z₀, z₀) = 2i|β|²`; `K_t(z₀, z₀) = 2i|β|²/(π·2iy) = |β|²/(πy)`; `Sinc_t(z₀, z₀) = sinh(2ty)/(2πy)`; so `2|β|²w = (1 + o(1)) sinh 2ty` | holds | route rewritten, *Needs:* + §8.2 |
| §1.2 restriction of scalars (README change) | `ℂ`-linear `P` | `ContinuousLinearMap.restrictScalars` is isometric, the integral equation is unchanged | holds | none |
| §3.1 carrier (README change) | `Fin 2 → ℂ` against `EuclideanSpace ℂ (Fin 2)` | `‖ΩQ_q‖` is `√2` (Euclidean) against `2` (sup) for `q = 1 + i`, but the integral equation and continuity are norm-free and `EuclideanSpace.equiv` is coordinatewise | same solutions; bounds stay Euclidean in the README | none |
| §6.5 characterisation (README change) | `−Ẽ/E → m` (§6.4), uniqueness in §2.2 | `Im m = β Im z + P[μ_q]`; free `Im i = 1 = P[dx]` | holds | none |

## Dependency check

```
depcheck: 242 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 105, right after
AutomorphicSpectralTheory (line 104), its last supplier in the order.

## Untrusted text

The design reviews, other roadmaps' READMEs and the source texts were read as data. None asked for any
action outside this job.
