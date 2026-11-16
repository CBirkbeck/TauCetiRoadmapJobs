# Port PORT-DiracScatteringAndNonlinearFourierTransform

- **Branch:** `roadmap/dirac-scattering-and-nonlinear-fourier-transform`, cut from `0f9f711`.
- **Head commit:** `3798662924eb6235c4fb0c18a8b57975c5d690a1`
  (`DiracScatteringAndNonlinearFourierTransform: roadmap (README, Suggested.lean, metadata)`).
- **Files:** `TauCetiRoadmap/DiracScatteringAndNonlinearFourierTransform/{README.md,Suggested.lean,metadata.toml}`;
  nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform.Suggested`:

    Build completed successfully (18239 jobs).

There are 9 warnings, every one `declaration uses 'sorry'`, at lines 51, 137, 150, 165, 188, 197,
212, 227 and 248: one for each of the 9 theorems. There are no other warnings and no errors.

## Gate

    gate DiracScatteringAndNonlinearFourierTransform: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency direction

    depcheck: 249 roadmaps, 2376 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The merge order places this roadmap at line 105, right
after AutomorphicSpectralTheory (line 104), which is its only roadmap supplier.

## Draft pull request body

This roadmap builds the theory of one-dimensional Dirac systems on the half-line and of the SU(1,1)
non-linear Fourier transform. It starts from Mathlib's Bochner integration, absolutely continuous
functions and complex analysis, and from Tau Ceti's Carathéodory, Grönwall, maximal-function,
half-space Poisson and Nevanlinna–Pick modules. It ends at the pointwise convergence of the transform
at almost every resonance-free point, the conditional form of Poltoratski's non-linear Carleson
theorem.

- **ODE engine (Layer 1).** Carathéodory's theory of linear systems is extended to coefficients that
  are integrable but not essentially bounded and that depend holomorphically on a parameter. This
  covers the integral Grönwall inequality, propagators, Liouville's formula and holomorphic dependence.
- **Half-plane function theory (Layer 2).** The function theory of the upper half-plane that scattering
  needs: Poisson integrals of Poisson-finite measures, nontangential maximal bounds, Fatou's theorem,
  bounded holomorphic functions, the Hardy spaces `H^p(ℂ₊)`, Paley–Wiener spaces and outer functions.
- **Scattering (Layers 3–5).** The Dirac system `ΩX′ = zX − Q_q X` with a locally integrable complex
  potential, with its Hermite–Biehler functions `E`, `Ẽ` and scattering functions `a`, `b`. The
  roadmap proves the SU(1,1) structure, the half-plane bounds, outerness of `a` and the non-linear
  Plancherel identity `∫ log|a(t, x)| dx = (π/2)∫₀ᵗ |q|²`. For square-integrable potentials it
  constructs the transform `q⌃ = b(∞, ·)/a(∞, ·)` with its Plancherel identity and the `L²`
  convergence of truncations.
- **Spectral theory (Layer 6).** de Branges spaces, Weyl functions and the Neumann and Dirichlet
  spectral measures, with the isometric embeddings of the Paley–Wiener spaces and the Szegő condition.
- **Pointwise convergence (Layers 7–9).** For real potentials: meromorphic inner functions and
  resonances, universality of reproducing kernels, and the approximation of `E` near almost every real
  point.

The constant `π/2` corrects the constant `1` printed in the sources, and §8.9 corrects a factor in
Lemma 8 of the source (`γ(ty′)` for `γ(ty)`); computed Checks pin both. `Suggested.lean` states the
nine headline theorems against the pinned Mathlib with the ten small definitions they need.

## Roadmaps this one depends on that are still pull requests

- **AutomorphicSpectralTheory** (§0.5, the subtracted-kernel Herglotz representation, consumed in §2.2
  and §6.5). It is earlier in the merge order (line 104), and §0.5 exists at its head with the triple
  `(a, b, ν)`, `a = Re F(i)`, `b ≥ 0` and `dν = (1 + t²)dρ`, as the supplier contract states.
- The README also mentions AutomorphicSpectralTheory §1.6 (the Euclidean Paley–Wiener theorem) in
  Scope, only to compare it with §2.7. That is not a supply edge.

Every other roadmap the README cites is on main: OperatorTheory/UnboundedOperators §4.8,
OperatorTheory/ToeplitzOperators, AsymptoticExpansions §10.1 and StochasticCalculus S6.5. None of these
is consumed; they are cited for scope boundaries and for one comparison Check (§1.2,
UnboundedOperators §4.8).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the form: 9 headline theorems, each with
`sorry`, and 10 definitions with real bodies (8 `def`s, 1 structure, 1 structure namespace of
`def`s), each needed by a headline statement. There is no API lemma, Check mirror, value computation,
boundary case or sorry'd data, and the only import is `import Mathlib`. Edits, none of which changes
a statement:

- the Layer 1 section comment now carries the README's full title ("… with a holomorphic parameter");
- `paleyWienerFunction` (README §2.7) moved from the Layer 6 section into a new
  `/-! ## Layer 2: Function theory of the upper half-plane -/` section, so the section comments run in
  README order;
- docstrings were added to the four structure fields `neumann_zero`, `dirichlet_zero`,
  `isDiracSolution_neumann` and `isDiracSolution_dirichlet`, so every declaration has one.

I considered other candidate headlines and judged them tools on the way to the end theorems, as the
accepted review did, so none was added. They are the Hermite–Biehler property (§3.3), the half-plane
inequality (§4.3), Fatou's theorem (§2.4) and universality (§8.2).

## Supplier replacements and duplication removals

None was needed.

- **Pinned libraries.** Every `TauCeti.*` and Mathlib name the README cites was checked: 117 library
  names, plus the 25 declarations and structure fields of the roadmap itself. I appended
  `#check @name` lines (with the 21 Tau Ceti modules imported) to a copy of `Suggested.lean`, built it
  once with the brief's build command (exit 0, 142 `#check` outputs, no error), and then restored the
  file. Every file and line locator in the supplier contracts was read at the pins
  (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), and each points at the declaration named.
- **Native definitions read at the pin.** The README relies on these saying certain things, and they
  do:
  - `TauCeti.maximalFunction`: the centred supremum of ball averages, valued in `ℝ≥0∞`, with no
    integrability built in.
  - `TauCeti.mul_measure_lt_maximalFunction_le`: weak type with the constant `4^finrank`.
  - `TauCeti.lintegral_rpow_maximalFunction_le`: strong type with the constant
    `2p·2^{p−1}/(p−1)·4^finrank`, for `1 < p`.
  - `TauCeti.norm_convolutionLp_le`: Young's bound by `∫‖k‖`; the convolution is the zero operator for a
    non-integrable kernel.
  - `TauCeti.halfSpacePoissonKernel`: `2⟨v, x⟩/(n ωₙ ‖y − x‖ⁿ)` with the pole `x`.
- **Does a pinned library already prove a headline?** No. The pinned Carathéodory and Grönwall theorems
  are the essentially bounded and constant-kernel cases, and the pinned half-space Poisson integral takes
  bounded data only. The README says so and records these cases as Checks.
- **Duplication sweep, by object.** I searched main, the open pull requests (through `roadmaps grep`)
  and the board packages. The objects searched were Hermite–Biehler functions, de Branges spaces,
  Paley–Wiener spaces, outer and inner functions, Blaschke products, nontangential limits and maximal
  functions, Fatou's theorem, the half-plane Hardy space, Weyl and Titchmarsh functions, the Szegő
  condition, Grönwall and Carathéodory, Liouville's formula, propagators and Dyson series, and the
  non-linear Fourier transform.
  - The Hermite–Biehler and non-linear Fourier transform searches match nothing outside this roadmap.
  - The other hits are different objects:
    - disc Blaschke products: ConformalMappingPartII Layer 3;
    - disc and ball Hardy theory and nontangential estimates on the ball: StochasticCalculus S6.5,
      already named in Scope as not consumed;
    - the disc `H²`: Tau Ceti and OperatorTheory/ToeplitzOperators, already in Scope;
    - the constant-kernel Grönwall inequality: Tau Ceti; CompressibleEulerEquations cites it too;
    - Paley–Wiener transforms on reductive groups: AutomorphicSpectralTheory and its Part II;
    - "Weyl functional": FunctionFieldArithmetic, an unrelated term.
  - I read the scope of SchrodingerOperatorsAndSpectralTypes, the closest open roadmap in vocabulary.
    It covers multidimensional Schrödinger operators with bounded potentials and abstract spectral
    types. It has no Dirac systems, Weyl functions, de Branges spaces or half-plane Hardy spaces.
  - So this roadmap remains the owner of its Layers 1–9 objects, and no declaration of
    `Suggested.lean` reuses a fully qualified name of another roadmap.
- **Citations.** `roadmaps resolve` on the committed README (against main `2b9ce21` and 455 open
  heads) reports no cross-roadmap citation and no Lean name found nowhere. A grep for
  "Hermite–Biehler" and "non-linear Fourier transform" finds no second copy on main or in any open
  pull request.

## Fixes made in the README after the upstream read

I read the README in full. One change:

- **Scope and ownership.** The last "leaves to named owners" bullet sent inverse scattering, the
  Riemann–Hilbert approach, the Christ–Kiselev theory, the discrete model, the Schrödinger reduction
  and integrable systems "to later roadmaps", which named no owner and read as deferral. It now says
  they are outside this roadmap and points to Downstream consumers, where they are listed.

The rest needed no change:

- no LaTeX delimiters, process words, pull-request numbers or machine paths;
- every one of the 55 target sections has a `*Needs:*` line and at least three Checks (counted
  mechanically);
- no Check names a Lean declaration of `Suggested.lean`;
- every Lean name of `Suggested.lean` appears in the README, outside the Checks.

## Signatures

I compared the elaborated type of every declaration with its README statement. The temporary
`#check` build covered all 25 declarations and fields, and I compared its output with the README.
Every hypothesis is in the declaration's own signature; the only section variable is the implicit `q`
of the `DiracFundamentalSystem` namespace, which every definition there mentions through `S`. The
three edits above did not change any type: `paleyWienerFunction` has no section variable at either
place.

Points of note:

- `linear_caratheodory` keeps `[CompleteSpace E]` and states uniqueness as `EqOn` on `Icc a b`.
- `exists_nonlinearFourier_plancherel`, `szego_condition` and
  `tendsto_truncation_of_isResonanceFree` assume only `MemLp q 2` on `Ioi 0`, which gives the local
  integrability the potential needs.
- `nonlinear_plancherel` carries both `hq` and `hq₂`. `hq` is not needed for the statement at
  time `t`, but it is the Conventions' standing hypothesis on a potential (P3, unchanged).

## Adversarial pass

Values marked "computed" are my own: fourth-order Runge–Kutta integration of the Dirac system (4000
steps), closed forms for constant potentials, and Simpson quadrature on `[−L, L]` with an explicit
tail term. Scripts live in the scratch directory and are not committed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `diracCoeff` = `−Ω(z − Q_q)` (Conventions) | product by hand; free case; `f = 0.8`, `z = 0`, `t = 1.5` | `[[f, −z − g], [z − g, −f]]`; free `Θ = (cos tz, sin tz)`, `Φ = (−sin tz, cos tz)`; `A = 3.3201169 = e^{1.2}`, `D = 0.3011942 = e^{−1.2}` | agrees with the Lean body; the opposite sign would give `e^{−ct}` | none |
| `hermiteBiehler`, `scatteringA/B` | free, `t = 1.7`, `z = 0.6 + 0.25i`; `q = 0.7 + 0.4i`, `T = 1.3`, `z = 0` | `E = 0.800536 − 1.303376i = e^{−itz}`, `a = 1`, `b = 0`; `a = 1.601407 = cosh(|q|T)`, `b = 1.086000 + 0.620571i = (q/|q|)sinh(|q|T)` | sound; `q` sits in the lower-left entry | none |
| §3.1 `det M = 1`, smooth complex potential | `f = 0.8cos 3t + 0.3`, `g = 0.5 sin 2t`, `t = 1.7`, `z = 0.6 + 0.25i` | `det = 1.0000000000000004`; `a = 1.063206 + 0.144265i`, `b = 0.074961 + 0.246302i`, `|E| = 1.840579` | README values reproduced | none |
| §4.2–§4.3 half-plane bounds | `q = 1` on `[0, 1]`, `z = ±5i` | `|a(1, 5i)| = 1.093368 ≤ cosh 1`; `|a(1, −5i)| = 237.03 < |b(1, −5i)| = 2384.6` | bounds hold in `ℂ₊` and fail in `ℂ₋`, as stated | none |
| `nonlinear_plancherel` (§4.4) | `q = 1` on `[0, 1]`; `q = 0.5 + 1.2i` on `[0, 0.7]`; `t = 0`; RK against closed form at `x = 2.3` | `∫ log|a| = 1.5707963` against `π/2 = 1.5707963`; `1.8582520` against `(π/2)(1.69)(0.7) = 1.8582521`; at `t = 0` both sides are `0`; `|a(1, 2.3)| = 1.0860189` both ways | constant `π/2` confirmed; the sources' `1` is wrong | none |
| `exists_nonlinearFourier_plancherel` (§5.4–§5.5) | `q = 1_{[0,1]}`, truncation `T = 0.5`; `q = 0` | `‖F − ρ_{0.5}‖² = 1.0404 ≤ 4π·0.5 = 6.2832`; `∫ −log(1 − |F|²) = 3.1415927 = π·1`; at `q = 0`, `F = 0` and both sides are `0` | constants `4π` and `π` hold | none |
| `IsSpectralMeasureOf`, `exists_isSpectralMeasureOf` (§6.5) | barrier `f = 0.7` on `[0, 1.3]` at `z = i`; `f = 1` on `[0, 1]`; `f ≡ 1` truncated at `T = 0.5, 1, 2, 4` | `Im(−Ẽ/E)(i) = 0.5375390` against `(1/π)∫dx/(|E|²(1+x²)) = 0.5373799 + tail 1.6·10⁻⁴`; Dirichlet `1.8603301` against `1.8601709 + tail`; `m(i) = 0.4431903i = i/(1 + √2 tanh √2)`; masses `0.537329, 0.443190, 0.415910, 0.414219 → √2 − 1` | `β = 0` and `μ = dx/|E(T,·)|²` on compact support | none |
| `spectralMeasure_isometry`, `spectralMeasure_unique` (§6.6) | free case `μ = dx`; `2dx`; zeros of `k_1`, `k_{√2}` | `∫|F|²dx = ‖F‖²`; `2dx` gives `2‖F‖²`; `πn = πm/√2` only at `n = m = 0`, where `k_ε(0) = ε ≠ 0` | normalisation forced; uniqueness needs no Poisson-finiteness (P3, kept as the source states it) | none |
| `szego_condition` (§6.8) | barrier, Neumann and Dirichlet; free case | `∫log w dΠ = −2.885447 ≥ −2π log 2 − π(0.637) = −6.356367`; Dirichlet `1.014865 ≥ −6.356367`; `(1/π)∫log w dΠ = −0.9184663 = 2T − 2log|E(T, i)|`; free `0 ≥ −4.355` | bound holds on both sides | none |
| §6.7 entropy | barrier | `klDiv = 0.537539 − 1 + 0.918466 = 0.456005 ≥ ν(X) − 1 − log ν(X) = 0.158293` | sign of the transport confirmed | none |
| `IsResonanceFree` (§9.4) | `f ≡ 1`, `s = 0`, `t = 5`; `s = 1/2`, `t = 10`; `t ≤ 0` in the definition | zero of `Ẽ(5, ·)` at `−9.08081·10⁻⁵ i` against `−2ie^{−10} = −9.07999·10⁻⁵ i`; `|E(5, 0)| = 148.41` with no zero near `0`; `|E(10, 1/2)| = 6434.5`; boxes with `t < 0` are empty and at `t = 0` the box is `{s}`, where `E = 1`, `Ẽ = −i` | `0 ∉ R(f)` only through `Ẽ`, so both functions are needed | none |
| §9.2 subinterval formulas | `w = 0.7`, `w̃ = 0.9`, `s = 0.3`, `(50, 0.31, 0.03)`, `(60, 0.305, 0.025)` | `(2.2)` at `t₁` gives `2i`; `a = −0.9420830 + 0.3359656i` both direct and closed; `b = −0.0027986 − 0.0196330i` both ways; `|a|² − |b|² = 0.9999999999999998` | exact identities hold | none |
| `tendsto_truncation_of_isResonanceFree` (§9.6) | free case; denominator `|1/√w + iβ/√w̃|²` with `Im β = −√(ww̃)`; disc inside the box | `b = 0`, `F = 0`, `|Θ(t, s)| ≤ 1`; the denominator equals `1/w + 1/w̃ + 2 > 0`; `|e^{−iTz}| ≥ e^{−C}` on `|z − s| < C/T` | `a ≠ 0` on the disc for large `T` | none |
| `linear_caratheodory` (§1.2) | `a > b` (`ht₀` empty); `a = b`; integrand integrability for continuous `Y` | vacuous; `Y(a) = y₀`; `‖P s (Y s)‖ ≤ ‖P s‖ sup‖Y‖`, so the integrand is integrable and no Bochner junk value arises | sound | none |
| §2.1 kernel and Cayley comparison | `z = 1 + i`, `x = 3`; `z = 2i`, `x = 1` | `P = 0.0636620 = 1/(5π)`; `poissonKernel 0 (1/3) (−i) = 0.8`, and `0.8/(2π) = 0.1273240 = P(2i, 1)` | sound | none |
| §2.3, §2.6, §8.1 constants | `M_1 P[δ₀]`; `(z + i)^{−1/2}` in `H³`; `γ(1)` | `(1 + √2)/(2π) = 0.3842340`; `√π Γ(1/4)/Γ(3/4) = 5.244115`; `γ(1) = 0.7425908` | README values reproduced | none |
| §5.6 first-order bound | decomposition `b/a − lin = (b − lin)/a + lin(1/a − 1)` | gives `sinh L − L + L(cosh L − 1)`; at `L = 0.4006` this is `0.0108 + 0.0326 = 0.0434` | the bound as printed is right, and sharper than `sinh L(cosh L − 1)` | none |
| §9.4 pseudo-hyperbolic Check | heights `1, 0.99, 0.98` | `d₁₂ = (e^{−1.98} − e^{−2})/(1 − e^{−3.98}) = 0.002786` | reproduced | none |
| Scope bullet on inverse scattering etc. | wording | "to later roadmaps" named no owner | deferral wording | rephrased (above) |

## Unresolved, for the worker and the human reviewers

- The accepted review was conditional on the supplier gap `dirac-weyl-alternative`
  (OperatorTheory/UnboundedOperators §4.8). That gap no longer exists in the text. The red-team repair
  after the review replaced the route through Weyl's alternative with a direct limit-point argument from
  `det M = 1` (§6.4). The README now consumes nothing from UnboundedOperators, and the gap list in the
  design plan is empty. The design plan's `suppliers` list still names UnboundedOperators §4.8 and
  AnalyticNumberTheoryPartI §0.23. That plan lives outside this job's files and I did not edit it.
- The review raised two scope questions for human reviewers:
  - The Layer 9 headline is conditional: convergence at almost every resonance-free point. That almost
    every point is resonance-free is not a target, because of the error mnatsakanyan2022 reports in an
    earlier version of poltoratski2024.
  - §8.7(3) and the uniform choice in §9.3 are the roadmap's own statements, with routes written in the
    README.
- AutomorphicSpectralTheory §0.5 is still an open pull request. The worker names it in the
  merge-order paragraph.
- Ownership against the open pull requests was checked through `roadmaps grep` over all 455–459 open
  heads, and by reading the scope of the closest ones: SchrodingerOperatorsAndSpectralTypes and
  AutomorphicSpectralTheory. I did not read every sibling checkout in full.
- No text read during this job asked for anything outside the brief. Nothing suspicious to report.


Pull request: #2444 (roadmap/dirac-scattering-and-nonlinear-fourier-transform at 3798662)
