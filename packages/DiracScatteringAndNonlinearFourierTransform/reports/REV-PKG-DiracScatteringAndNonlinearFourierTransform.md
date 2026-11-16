<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18040#issuecomment-6907097601 -->
Review (claude) of 7aacc70

Verdict: accepted
Conditional on the announced gaps: `dirac-weyl-alternative`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The acceptance is conditional on the declared supplier gap `gap:dirac-weyl-alternative`
(OperatorTheory/UnboundedOperators §4.8). There is no previous review of the package and there are no
maintainer notes. Files reviewed: `packages/DiracScatteringAndNonlinearFourierTransform/README.md`
(2587 lines, read in full), `Suggested.lean` (258 lines), `metadata.toml`, `sources.toml`.

## Findings

None.

## Verified sound

### 1. Principles

- No route-specific shortcut: Layers 1–6 are stated for complex potentials integrable on every `[0, t]`
  (square-integrable where the theorem needs it); Layers 7–9 are for real potentials, the generality of the
  source theorem, and the README says so in Scope and at the head of Layer 7.
- No re-planned roadmap, no upward or cyclic supply (dependency check below), no copied passage, no
  computational algorithm (numerical values appear only as Checks), no sorry'd data, no `set_option`.
- `Suggested.lean`: one module docstring, `import Mathlib` only, 19 declarations: 10 definitions with real
  bodies (nine `def`s and one structure) and 9 theorems, each with `sorry`; `theorem` never `lemma`, no `#eval`, `#print`, `True` placeholder or free `Prop` predicate.

### 2. Sources: the seeded sample

All 15 sampled targets were checked against the cached texts at their locators. The author flagged no
locator as unverified.

| Target | Locators opened | Result |
|---|---|---|
| 2.1 | poltoratski2024 line 250–254, 610–614; mauth2022 line 378–392 | Poisson measure, Poisson-finite, Poisson extension, Lemma 3: as cited |
| 2.3 | poltoratski2024 line 615–622; mauth2022 line 411–433 | cone with `Im z < 1`, maximal function, Lemma 5, Corollary 1, Lemma 6: as cited |
| 2.7 | poltoratski2024 line 236–249; mauth2022 line 472–484 | `PW_t`, (2.3), (2.4), Lemma 10: as cited |
| 3.3 | poltoratski2024 line 175–180; mauth2022 line 491–493, 531; romanov2014 line 780, 789 | definition, Lemma 13, Proposition 4, (15): as cited |
| 4.5 | denisov2006 line 2510–2521, 2544–2548 | Lemma 9.1 (157)–(158), Lemma 9.2: as cited (stated as an analogue, correctly) |
| 5.4 | poltoratski2024 line 545–548, 567–577; mauth2022 line 206–210; denisov2006 line 3246–3255 | identity printed with constant `1` in the first two, `π` in (194): as the README says |
| 5.5 | poltoratski2024 line 518–544; mauth2022 line 711 | convergence in `Π`-measure, Lemma 19: as cited |
| 6.4 | romanov2014 line 2217–2261, 2370 | Theorem 15, boundary points of the Weyl disc, Lemma 23: as cited |
| 7.1 | poltoratski2024 line 307–331, 337–346; mauth2022 line 446–449 | inner, meromorphic inner, Blaschke condition, the derivative formula: as cited |
| 7.2 | poltoratski2024 line 332–360; mauth2022 line 1624–1627 | Lemma 1 with radius `3|y − x|/ε`, Lemma 29 with `4|y − x|/ε` and `ε < ε₀`: as cited |
| 8.4 | poltoratski2024 line 756–760; mauth2022 line 1129–1132 | Lemma 4 (6.6), Lemma 22: as cited |
| 8.5 | poltoratski2024 line 804–842; mauth2022 line 1205–1212 | (7.1), Lemma 5 (7.2), Corollary 1 (7.3), Corollary 4: as cited |
| 8.6 | poltoratski2024 line 846–917; mauth2022 line 1258, 1765 | `T₀`, (7.4), Lemma 6, Remark 3, Corollary 2, Lemmas 23 and 32: as cited |
| 8.7 | poltoratski2024 line 997–1015; mauth2022 line 1397–1410 | `T₁`, Corollary 3 parts 1 and 2, Corollary 6: as cited; part (3) is the README's own statement with its own route |
| 9.2 | poltoratski2024 line 1228–1347 | (9.1), (9.2) at line 1306, (9.3), (9.4): as cited |

Further locators opened outside the sample: poltoratski2024 line 54–57, 96–101, 136–148, 186–195, 204–208,
255–268, 484–507, 578–586, 1116–1172, 1350–1377, 1482–1490, 1536–1582; mauth2022 line 182–189, 216–219,
659–660, 702–707, 735–737, 746, 1893–1894; romanov2014 line 756–760, 2283–2287; killipsimon2003 line
1812–1837, 1864, 1960; taothiele2012 line 296, 430–433, 680–683; denisov2026 line 204–216;
mnatsakanyan2022 line 9–13, 135–138, 1812–1813. All as the README cites them.

### 3. Adversarial pass

Every statement of the README was read and its formulas recomputed; the table covers the sampled targets,
the headline theorems and the conventions they rest on. "Numerics" means my own integration of the Dirac
system (fourth-order Runge–Kutta, 4000 steps) and Simpson quadrature, independent of the author's values.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Dirac coefficient `−Ω(z − Q_q)` (Conventions, `diracCoeff`) | product by hand; free case; `f = c`, `z = 0` | `[[f, −z − g], [z − g, −f]]`; `Θ = (cos tz, sin tz)`, `Φ = (−sin tz, cos tz)`; `A(t, 0) = e^{ct}` | agrees with the Lean body |
| `E`, `Ẽ`, `a`, `b` (§3.2, §4.1, Lean definitions) | free case; constant complex `q` at `z = 0`; `q = 1` at real `x` | `E = e^{−itz}`, `Ẽ = −ie^{−itz}`, `a = 1`, `b = 0`; `a = cosh|q|t`, `b = (q/|q|) sinh|q|t`; `a = e^{ix}(cos κ − ix sin κ/κ)`, `b = e^{ix} sin κ/κ` and `∂ₜb = q e^{2ixt} a#` holds | sound; `q` sits in the lower left entry |
| Position of `q`, smooth complex potential (§4.1 Check) | `t = 1.7`, `z = 0.6 + 0.25i` | `det M = 1.0000000000000004`; `a = 1.063206 + 0.144265i`; `b = 0.074961 + 0.246302i`; `ρ = 0.100095 + 0.218078i`; `|E| = 1.840579`, `|E#| = 0.573348` | all README values reproduced |
| §1.1 Grönwall | `α < 0`; equality case; `β = −1` | `u ≤ α + v`, `v ≤ α(e^B − 1)` for every real `α`; `2 + 2(e^{min(t,1)} − 1) = 2e^{min(t,1)}`; `1/2 > e^{−1}` | sound; `β ≥ 0` needed |
| §1.2 `linear_caratheodory` | `a > b` (hypothesis `t₀ ∈ Icc a b` empty); `P = t^{−1/2}`; `P = 1/t`; indicator of `(2, 3)` | `Y = y₀e^{2√t}`; `Y = ct` all solve; uniqueness only on `[a, b]` | sound; Lean states uniqueness as `EqOn` on `Icc a b` |
| §1.3 time ordering | `A`, `B` nilpotent | `exp(B)exp(A) = [[1,1],[1,2]]`, reversed `[[2,1],[1,1]]` | sound |
| §1.5 | `p = 0`, `p′ = 1` | `e − 1 = 1.718 ≤ e = 2.718`; bound derived from variation of constants | sound |
| §2.1 kernel and Cayley comparison | `z = 1 + i`, `x = 3`; `z = 2i`, `x = 1`; `h = (x² − 1)/(x² + 1)` | `1/(5π)`; `w = 1/3`, `ζ = −i`, `4/5`, `2/(5π)`; partial fractions `(−2/3)π + (5/3)(π/2) = π/6`, times `2/π` gives `1/3` | sound; bound `C(z)` re-derived |
| §2.2 | `u = P[δ₀]`, `F = −1/(πz)` | `Im F = y/(π|z|²)`, `F′ = i(u_x − iu_y)`; `πy u(iy) = 1` | sound; `ν = πν_F` |
| §2.3 cone comparison | `|x′ − x| < y`; `s = y(1 + √5)/2` | `(s − x)² + y² ≤ 2(s − x′)² + 3y²`; supremum `(φ + 2)/(3 − φ) = 2.618`; `P[1_{[0,1]}](2 + i) = 0.1024`, maximal function `1/4` | sound; orientation of `TauCeti.halfSpacePoissonKernel_le_mul` matches |
| §2.6 | `F = 1/(z + i)` | `‖F‖² = π`, `|F(i)|² = 1/4 = π/(4π)`; `∫P(z, x)² dx = 1/(2π Im z)`; `𝓕g(w) = −2πie^{−2πw}` for `w > 0` | sound; vanishing on negative frequencies is Mathlib's convention |
| §2.7 `paleyWienerFunction` | `φ = 1_{[−t,t]}`; kernel at `λ = z` | `2 sin(tz)/z`, `‖F‖² = 4πt`; `k_t(λ, λ) = sinh(2t Im λ)/(2π Im λ)`, `t/π` on `ℝ`; `zF = i∫φ′e^{isz}` | sound |
| §2.8 | `h = log|x + i|` | `S[h](i) = log 2`, `O_h(i) = 2 = −i(2i)` | sound |
| §3.1 Christoffel–Darboux, §3.3 | derivative by hand; free case | `∂ₜ(M(λ)*ΩM(z)) = (z − conj λ)M(λ)*M(z)`; `4 Im(conj A · C) = 4y∫|Θ|²`; `2 sinh 2ty` both sides | sound; `t > 0` needed (`E(0) = 1`) |
| §3.2 equation and bounds | derivative of `A − iC`; real `x` | `E′ = −izE + qE#`; `|∂ₜ log|E|| ≤ |q|` | sound |
| §3.1 norm Check | `q = 1 + i`, `z = 0` | `[[3.5465, −1.3683], [−1.3683, 0.8099]]`, row sum `4.9148 > e^{√2} = 4.1133` | sound |
| §4.1 concatenation, translation, modulation, dilation | conjugation by `diag(e^{−izs}, e^{izs})` | `b = e^{2izs}b₂a₁# + a₂b₁`, `a = e^{2izs}b₂b₁# + a₂a₁` | sound |
| §4.2, §5.6 bounds | `q = 0.4cos 5s + 0.3i`, three `z` | `L = 0.400569`; `|b − lin| = 0.00592, 0.00745, 0.00246 ≤ 0.01080`; `|a − 1| = 0.0439, 0.0572, 0.0296 ≤ 0.0813`; `|ρ − lin| = 0.00842, 0.00964, 0.00114 ≤ 0.0434` | reproduced |
| §4.3 | `q = 1`, `z = ±5i` | `|a(1, 5i)| = 1.0934`; `|a(1, −5i)| = 237.0`, `|b(1, −5i)| = 2384.6` | sound; fails in `ℂ₋` as stated |
| §4.4 `nonlinear_plancherel` | first order; `q = 1`; `t = 0` | `∫|∫q e^{2ixs}|² dx = π∫|q|²`, so `π/2`; `y(a(1, iy) − 1) = 0.4853` at `y = 10`; `a(0, x) = 1`, both sides `0` | constant `π/2` correct; sources' `1` is wrong |
| §4.5 Riccati | derivative by hand; real `f`, `z = 0` | `r′ = 2izr + conj q − qr²`; `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `ρ′ = qe^{2izt}/a²`; `r = tanh F` | sound |
| §5.1 | Young with kernel mass `1/(2y)` | `‖r‖₂ ≤ ‖q‖/y`, `log|a| ≤ ‖q‖²/y`; `log a(1, 5i) = 0.0893 ≤ 0.2` | sound |
| §5.3 concatenation at the boundary | `ρ₁ = ρ₂ = 1/2`, `u = 1` | `4/5`; `9/25` both sides | sound |
| §5.4 identity at infinity | series bound; `(0.999, 0.999)` | `−log(1 − ab) ≤ (L(a)L(b))^{1/2}` by Cauchy–Schwarz on `Σ(ab)ⁿ/n`; `6.2151` both sides; `I = 12.5419` at `ξ = −0.25`, `21.7050` at `ξ = −0.5` | sound |
| §5.5, `exists_nonlinearFourier_plancherel` | `|q⌃* − ρ₁|` | `|ρ₂|(1 − |ρ₁|²)/(1 − |ρ₁||ρ₂|) ≤ 2|ρ₂|`; `‖ρ₂‖² ≤ ∫−log(1 − |ρ₂|²) = π‖q‖²_{L²(T,∞)}`, so `4π`; `−log(1 − |ρ|²) = 2 log|a|`, so `π‖q‖²` | Lean constants `4π` and `π` correct |
| §6.1 kernel | `E = z + i`; `E = e^{−itz}` | `2i(conj w − z)` over `2πi(conj w − z)` gives `1/π`; sinc kernel | sound |
| §6.3 isometric chain | derivative | `∂ᵣ|E|^{−2} = −2 Re(q/E²)`; `∫(F/E)(F#/E) = 0` | sound |
| §6.4 Weyl disc | free case `t = 1.7`, `z = 0.6 + 0.25i`; `f = 1_{[0,1]}`, `z = i`; smooth potential | `1 − e^{−0.85} = 0.5726 < 1`; `m(i) = i/(1 + √2 tanh √2) = 0.443190i`; `−D/C = 0.591892i`, `−B/A = 0.385819i`; `w₀ = 0.346770 + 0.749282i` | sound; `−Ẽ/E` interior |
| §6.4 limit point | limit circle at `z = 0` | `det[Θ, Φ] = 1` gives `1 ≤ |Θ||Φ|`, not integrable | sound, given the gap |
| §6.5, `IsSpectralMeasureOf`, `exists_isSpectralMeasureOf` | free case; `f ≡ 1`; real `x` | `m = i`, `μ = dx`; `m(i) = i(√2 − 1)`, masses `0.537329, 0.443190, 0.415910, 0.414219`; `Im(−Ẽ/E) = 1/|E|² = 0.9831359585` at `x = 0.7`; density at `x = 2` in `[1/2, 3/2]`, mean `√3/2` | sound; `(β, μ)` unique also when `β` ranges over `ℝ`, so the Lean predicate determines `μ` |
| §6.6 `spectralMeasure_isometry`, `spectralMeasure_unique` | free case; `2 dx` | Plancherel; `2‖F‖²`; uniqueness by polarisation and the characteristic functions of `|k_ε|² dμ`, zeros of `k_1` and `k_{√2}` meet only where `k_ε(0) = ε ≠ 0` | sound |
| §6.7 entropy | `μ = 2dx`; barrier `f = 0.7` on `[0, 1.3]` | `1 − log 2 = 0.306853`; `ν(X) = 0.5375390` (quadrature `0.5375389`), `(1/π)∫log w dΠ = −0.9184663` (quadrature `−0.9184664`), `klDiv = 0.456005 ≥ 0.158293` | sound; killipsimon2003 (5.9) is `ν(X) − σ(X) − klDiv σ ν` |
| §6.8 `szego_condition` | `|E| = |a + b| ≤ 2|a|`; free case | `∫log w_T dΠ ≥ −2π log 2 − 2∫log|a| dΠ ≥ −2π log 2 − π‖q‖²` (`dΠ ≤ dx`, `log|a| ≥ 0`); `0 ≥ −2π log 2` | Lean bound correct |
| §7.1 | `E = z + i`; `E = e^{−itz}` | `|θ′| = 2/(1 + x²)`, `ψ′ = 1/(1 + x²)`; `ψ = tx`, `ψ′ = t` | sound; the representation holds for every meromorphic inner function |
| §7.2 | `b_{10i}`, `ε = 1/2`; constant `c` term | `0.2, 0.16, 0.1`; `c ≤ (1 + ε)c`, so a summand carries the inequality; `(√(1 + ε) + 1) < 3` | sound |
| §7.3 Riccati | derivative | `θ′ = 2izθ + f(1 − θ²)`; `θ̃(0) = −1`; `ζ′ = −f/∂_zθ` | sound |
| §8.1 | `γ(1)` | `0.7426`; `[tanh p, coth p]` | sound |
| §8.3 normalisation Check | expansion | `S(1/w − 2/√w + 1) = S(1/√w − 1)²` | sound |
| §8.5 | box diameter | `π|λ − z| ≤ 2√2πC/t`, times `o(t)` | sound |
| §8.6 | `E(z(t)) = 0` | `D(t, conj z, z) = 2i|β|²`, `K_t(z, z) = |β|²/(πy)` | sound |
| §8.7(3) | two-term form with `M = diag(2, 1/2)`; general `M` | zeros at height `½log(5/3) = 0.2554`; Rouché margin relative to `|a|e^{−P}` is `O(e^{2C}η_C)`, independent of `‖M‖`; no zero in `Q(s, K/t)` forces `|b/a| < e^{1−2K}`, so the error on `Q(s, D/t)` is `O(e^{2D+1−2K}) + o(1)` for every `K` | sound; the conclusion follows from the two-term form alone |
| §8.9 | determinant of the two forms; `w = 0.7`, `w̃ = 0.9` | `i|κ|² sinh(2ty′)`; with `γ(1.5)`: `2.0820i` at `1.52`, `2.4448i` at `1.6`; with `γ(ty′)`: `2i` | sound; the sources' factor `γ(ty)` is wrong |
| §9.1, §9.2 | `t₁ = 0`; `t₁ = t₂`; product formulas | `a = e^{it₂z}(E + iẼ)/2`; `a = 1`, `b = 0`; `sin θ₂ cos(conj θ₁ − Φ) − cos(θ₂ − Φ) sin(conj θ₁) = cos Φ sin(e + 2iυ)`; `|a|² − |b|² = sinh 2υ sinh 2(υ + ε₂)/N² = 1` | sound |
| §9.4 `IsResonanceFree` | conjugation by `Ω`; `f ≡ 1`; heights | `E_{−f} = iẼ_f`; zero of `Ẽ` near `−2ie^{−10} = −9.08·10⁻⁵i`; `|E(10, 1/2)| = 6434.5`; distances `0.0027860, 0.0028445, 0.0056305` in both triples | sound; the definition needs both `E` and `Ẽ` |
| §9.5 | determinant; free case; `f = c1_{[0,T]}` at `0` | `(conj β − β)/√(w w̃) = 2i`, so `Im β = −√(w w̃)`; `|1/√w + iβ/√w̃|² = 1/w + 1/w̃ + 2`; `α = i`, `β = −i`; `cosh² cT` | sound |
| §9.6 `tendsto_truncation_of_isResonanceFree` | disc `|z − s| < C/T ⊆ Q(s, C/T)`; compact support; `f ≡ 1` at `s = 1/2` | `|e^{−itz}| ≥ e^{−C}` on the box, so `a(T, z) ≠ 0` for large `T`; `R(f) = ℝ`; `M(t, s)` grows like `e^{(√3/2)t}` | sound; the null set depends on `F`, which the quantifier order allows |

Context and signatures: I elaborated a scratch copy with `#check @name` for every declaration and compared
each type with its README statement. Every binder is in the declaration's own signature; the only section
variable is the implicit `q` of the `DiracFundamentalSystem` namespace, which each definition there
mentions through `S`. Nothing was lost. The README's generality equals the Lean's (§1.2 says the statement
is over `ℝ` and why that covers `ℂ`).

One remark that needs no change: in `spectralMeasure_unique` the hypothesis that `ν` is Poisson-finite is
the README's and the source's wording (poltoratski2024 line 255–257); the route of §6.6 uses only the
finiteness of `|k_ε|² dν`, which the isometry hypothesis gives.

### 4. Duplication audit

- Pinned libraries: all 110 Mathlib and Tau Ceti names in the supplier contracts were resolved at the pins;
  each exists, and every stated file and line number is correct. The statements the
  README relies on were read at the pin, among them `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`
  (`TauCeti/Analysis/ODE/Caratheodory.lean` line 196, essentially bounded `M`),
  `TauCeti.le_mul_exp_of_le_add_mul_integral` (`Gronwall.lean` line 59, constant `K`, continuous `φ`),
  `TauCeti.halfSpacePoissonKernel` and `TauCeti.halfSpacePoissonKernel_le_mul`
  (`Analysis/PDE/GreenFunction/HalfSpace.lean` lines 122, 198), `poissonKernel`
  (`Mathlib/Analysis/Complex/Poisson.lean` line 54), `TauCeti.rouche_exists_eq_zero_iff`
  (`Rouche.lean` line 359), `Matrix.hasFDerivAt_det` (`Det.lean` line 110),
  `TauCeti.I_mul_herglotzTransform_cayley_eq` (`Nevanlinna.lean` line 404),
  `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (`Variational.lean` line 499),
  `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous` (line 41) and
  `InformationTheory.klDiv` (`Basic.lean` line 56). None of the 9 theorems of `Suggested.lean` is proved at
  the pins: the Tau Ceti Carathéodory and Grönwall theorems are the bounded and constant-kernel cases, and
  the half-space Poisson integral takes bounded data only, as the README says.
- Roadmaps: searched main and the open pull requests, by object, for Hermite–Biehler functions, de Branges
  spaces, Paley–Wiener spaces, nontangential limits, outer functions, the half-plane Hardy space, Weyl
  functions and the limit-point alternative, Carathéodory and Grönwall theorems, meromorphic inner
  functions, the Szegő condition, Dirac systems, the non-linear Fourier transform, Fatou's theorem,
  Liouville's formula and Herglotz representations. Owners found and cited by the README:
  OperatorTheory/UnboundedOperators §4.8 (endpoint classification), AutomorphicSpectralTheory §0.5
  (subtracted-kernel Herglotz representation), AnalyticNumberTheoryPartI §0.23 (Hadamard factorization),
  AsymptoticExpansions §10.1 (scalar Volterra equation, neither statement contains the other),
  StochasticCalculus S6.5 and OperatorTheory/ToeplitzOperators (disc and ball Hardy spaces, not consumed).
  No other roadmap states the half-plane Hardy space, Poisson integrals of Poisson-finite measures, the
  Dirac scattering data or the spectral measures. No other roadmap cites this one.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is
  defined only by an open revision, and no second copy exists on main.

Overlap check: read SchrodingerOperatorsAndSpectralTypes, SchattenClassesAndSchurMultipliers, MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory, PDE, StochasticCalculus, OptimalTransport (the results-and-headings list is empty); nothing shared. AutomorphicSpectralTheory owns the Herglotz representation of §0.5 and this roadmap cites it; PDE and Tau Ceti own the half-space Poisson kernel and this roadmap cites the pinned declarations.

### 5. Supplier-order audit

    depcheck: 244 roadmaps, 2272 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The three supplier roadmaps were resolved now:

- OperatorTheory/UnboundedOperators §4.8 (UO-D07), on main: the section exists; it builds the
  endpoint classification for `Ju′ + V(r)u` with `J = [[0, −1], [1, 0]]` and locally integrable Hermitian
  `V`, and its API bullet states the alternative for Sturm–Liouville expressions. The dictionary
  `J = −Ω`, `V = −Q_q`, `λ = −z` was recomputed (`V = 0`, `λ = −z` gives `(cos tz, sin tz)`).
- AutomorphicSpectralTheory §0.5, open and earlier in the merge order: the triple `(a, b, ν)` with
  `a = Re F(i)`, `b ≥ 0`, `dν = (1 + t²)dρ` is stated there as the README describes it.
- AnalyticNumberTheoryPartI §0.23, on main: `f = z^m exp(h) ∏E_n(z/α)` with `n = ⌊ρ⌋`, as cited.

The declared gap `gap:dirac-weyl-alternative` is precise (expression, interval, hypotheses on `V`, both
branches and the independence of `λ`), minimal (the supplier states the alternative only for
Sturm–Liouville expressions and describes the Dirac case as analogous) and declared with the same slug in
`design/plan.json` and under the supplier's subsection of the README.

Every `*Needs:*` line (55) names layers of this roadmap, pinned declarations or the three suppliers;
none names a later roadmap or anything the scope excludes.

### 6. Shape and completeness

- Headings in the upstream order; 9 layers, each ending with `### Examples` and `### Dependencies`;
  55 target sections, each with a `*Needs:*` line and a `**Checks.**` block of at least three bullets
  (counted mechanically).
- The organisation is the roadmap's own; see part 8.
- No LaTeX delimiters, pull-request numbers, job ids, dates, HTML anchors or machine paths in the README
  or in `Suggested.lean`.
- Elaboration: `lake env lean` on `Suggested.lean` from the content checkout exits `0` with exactly 9
  warnings, all `declaration uses 'sorry'` (lines 51, 127, 140, 155, 182, 191, 206, 221, 242).
- Every Lean name appears in the README, and the 10 backticked names the citation tool listed as found
  nowhere are fields and definitions of `Suggested.lean`.

### 7. Headline theorems and padding

Headline theorems named by the README's summary, each stated in `Suggested.lean`: the linear Carathéodory
theorem (`linear_caratheodory`), the Dirac fundamental system (`existsUnique_diracFundamentalSystem`), the
finite Plancherel identity (`nonlinear_plancherel`), the transform on `ℝ` with its rate and Plancherel
identity (`exists_nonlinearFourier_plancherel`), existence, isometry and uniqueness of the spectral
measures (`exists_isSpectralMeasureOf`, `spectralMeasure_isometry`, `spectralMeasure_unique`), the Szegő
condition (`szego_condition`) and pointwise convergence at resonance-free points
(`tendsto_truncation_of_isResonanceFree`). None is absent and none is a stand-in; the docstring says that
all are statable and that convergence almost everywhere is not a target.

One-tactic probe on all 9 theorems, each on a scratch copy elaborated at the pins: `simp`, `rfl`,
`infer_instance`, `first | trivial | simp_all | tauto` and `exact?` each fail on all 9. No declaration
restates a definition, mirrors a Check, computes a value or treats a boundary case. No padding.

### 8. Copyright, licences and scope

- Wording: 34 passages were set beside the sources (the 15 sampled targets, the further locators of part
  2, and six passages of prose: the scope paragraph, the definitions of §7.1 and §8.1, the statement of
  §9.3, the entropy of §6.7 and the docstring of `tendsto_truncation_of_isResonanceFree`). No sentence,
  list or proof plan reproduces a source; the longest shared run is the five-word term for the Apollonius
  circle and its foci in §7.2.
- Arrangement: poltoratski2024 has the largest share. Its sections are 1 (Dirac systems), 2 (de Branges
  spaces and spectral measures), 3 (meromorphic inner functions), 4 (Dirac inner functions), 5 (scattering
  and the transform), 6 (universality), 7, 8 (approximations), 9 (proof). The roadmap has two layers the
  source has none of (1, 2), places scattering (Layers 4–5) before the spectral theory (Layer 6), merges
  sections 3–4 into Layer 7 and sections 6–8 into Layer 8. The only run in the source's order is
  Layer 7 → Layer 8 → Layer 9, which the dependency lines force (§8.7 needs §7.2; §9.3 needs §8.8, §8.9).
- Reuse: no table, figure or list is taken over. I know of no public formalisation of these statements.

Source independence: 34 passages compared with 8 sources, none shared; largest share poltoratski2024, 71 of 188 citations; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (uncertified, paywalled): the locators of §2.2–§2.6 and §2.8 were not read. The statements
  cited to it are standard and were checked mathematically; mauth2022 gives the same page numbers.
- coddingtonlevinson1955, debranges1968, remling2018, krein1955 (waived): cited by locator only; not read.
- The published Annals text of poltoratski2024 was not read; the README cites arXiv version 14 and says so.
- The proofs of the universality statements §8.2–§8.4 were checked for their statements, hypotheses and
  routes, not line by line against poltoratski2024 Lemmas 2–4 and mauth2022 Lemmas 21–22.

## Source issues

- **Error** in poltoratski2024 at (5.5), printed p. 14 (line 545–548, and line 567–568): the source says the `L¹(ℝ)` norm of `log|a(t, ·)|` equals the squared `L²` norm of the potential; it should be `π/2` times it (and `π` times it for `log(1 − |f⌃|²)`); affects a stated result.
- **Error** in mauth2022 at (4), printed p. 5 (line 206–210): the source says the same identity with constant `1`; it should carry the constant `π/2`, and `π` in the second form; affects a stated result.
- **Misprint** in mauth2022 at Corollary 6 (20), line 1404–1410: the source says the approximant away from resonances is a multiple of `e^{itz}`; it should be `e^{−itz}`, as its own free case at line 746 shows; affects a stated result.
- **Error** in poltoratski2024 at Lemma 8 (8.5), printed p. 29 (line 1131–1138): the source says the exact forms at `s` carry the factor `γ(ty)`; it should be `γ(ty′)`, since the determinant identity gives `|κ|² sinh(2ty′) = 2`; affects a stated result.

## For the human reviewers

- Scope: the headline of Layer 9 is conditional (convergence at almost every resonance-free point). mnatsakanyan2022 (line 9–13) says an earlier version of poltoratski2024 contains a mistake; the README (Scope) does not use §9 of version 14 for the absence of resonances.
- Scope: §8.7(3) and the uniform choice in §9.3 are the roadmap's own statements with routes written in the README, not statements of a refereed source; poltoratski2024 Corollary 3 has parts 1 and 2 only (line 1002–1012).
- Licence: none to settle; every text read is an arXiv copy recorded as `open-repository` in `sources.toml`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7aacc703c85a275dd00e6fd8822d1f83c7cfdf08", "job": "REV-PKG-DiracScatteringAndNonlinearFourierTransform", "model": "fable", "worker": "chris-x26"} -->
