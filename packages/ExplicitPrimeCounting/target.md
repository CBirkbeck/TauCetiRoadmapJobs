Verdict: design
Name: ExplicitPrimeCounting
Base: none
Owner: none

## Scope

**What the roadmap owns.** The numerically explicit inequalities for the prime-counting
functions on Mathlib's carriers: `Chebyshev.psi`, `Chebyshev.theta`, `Nat.primeCounting`,
`ArithmeticFunction.vonMangoldt`, `Nat.nth Nat.Prime`, and the offset logarithmic integral
`TauCeti.Real.logIntegral` (this is `Li`, normalised by `Li 2 = 0`; see Layer 0 for `li`). It
proves, in general form and then with the published constants, the bounds of the TME-EMT pages
"Explicit bounds on primes" and "Short intervals containing primes": bounds for `ψ`, `θ`, `π`
under RH and under RH verified to a height; unconditional bounds of Rosser–Schoenfeld, Schoenfeld,
Dusart, Faber–Kadiri, Platt–Trudgian, Johnston–Yang and Fiori–Kadiri–Swidinsky shape; explicit
Mertens-type sums and sums of prime powers; bounds for the `n`-th prime; primes in arithmetic
progressions with explicit constants; and short intervals containing a prime. Every published
constant appears as the specialisation of a theorem whose analytic inputs (a zero-free region
with constant `R`, a zero-density bound, a height `H` of verified zeros, a table row, a finite
verification) are explicit parameters or named `Prop` hypotheses.

**Generality rule.** Each result is proved once for general data and then specialised:

- Chebyshev error shapes are theorems of the form "from a zero-free region of shape `S` with
  constant `R`, a zero-density bound of shape `D`, `RH(H)`, and an explicit `N(T)` error, one has
  `|ψ(x) − x| ≤ ε(x; R, H, …) x` for `x ≥ x₀(R, H, …)`", with the error function and threshold
  stated as functions of the parameters (Rosser–Schoenfeld 1975 §§4–7 and Schoenfeld 1976 §7 give
  the scheme; Platt–Trudgian 2021 Theorem 1 is already a table-row statement). The numbers
  `0.006409`, `235`, `9.39`, `9.22022`, … are instances.
- Progressions are stated for an arbitrary modulus `q ≥ 1` and residue `a` (coprimality as a
  hypothesis only where the source needs it), with the zero data of the characters mod `q` as
  parameters; `q = 1` recovers the `ψ, θ, π` statements.
- Sums over primes are stated for general weights (Ramaré 2016, Lemma 3.2: any `C¹`
  non-negative non-increasing `f`) and for general exponent `r` (Deléglise–Nicolas `π_r`).
- Every computational input is a `Prop`, stated once (Layer H below), never proved here.

**Conventions fixed here.** `f = g + O*(h)` means `|f − g| ≤ h` on the stated range. Real
arguments throughout; sums over `n ≤ x` are over `Finset.Icc 1 ⌊x⌋₊`. The `n`-th prime is
`Nat.nth Nat.Prime (n − 1)` for `n ≥ 1` (Mathlib is zero-based: `nth Prime 0 = 2`), so the
published `p_n` statements are transported with an index shift, which must be visible in every
`Suggested.lean` statement. `li x` is defined here as `TauCeti.Real.logIntegral x + li 2`, with
`li 2` the Cauchy principal value `∫₀² dt/log t` defined as a limit; `li` is used only where the
source uses it (Büthe 2018, Schoenfeld's `π − li`, Johnston–Yang). Progression carriers
`θ(x; a, q)`, `ψ(x; a, q)`, `π(x; a, q)` are imported from `AnalyticNumberTheoryPartI` §0.2
(`theta_ap`, `psiAP`, `primeCountAP`); the logarithmic sum `ψ̃(x; q, a) = Σ_{n ≤ x, n ≡ a (q)}
Λ(n)/n` and the constants `C(q, a)` with `ψ̃(x; q, a) − log x/φ(q) → C(q, a)` are defined here.

**Boundaries (not owned).**

- Zero-free regions, zero counting, zero density, the explicit formula, Perron and mean-value
  tools, and the semantics of verified zeros: `ZerosOfLFunctions` (main) for the shapes with
  existential constants, `ExplicitZetaBounds` (#6894) for the decimal constants
  (`R₀ = 5.70175, 5.573412, 5.558691`, Kadiri's `R₁`, `R₂`, the Kadiri–Lumley–Ng density bound,
  explicit `N(T)` errors, Kadiri's zero-free region for `L(s, χ)` with its exceptional zero) and
  for the bounded-height Props `RH(H)` and `GRH(q, H)` of its Layer 8. Nothing about zeros is
  proved here.
- Dirichlet characters and `L(s, χ)`: Mathlib and `LFunctions` Layer 4.
- The explicit Brun–Titchmarsh inequality (Montgomery–Vaughan constant) and explicit sieve
  bounds: the sibling `ExplicitCharacterSumsAndSieves` (#6062). The qualitative interval bound
  `SieveApplications.prime_interval_upper` of `SieveMethodsAndPrimePatterns` §1.6 has an
  inexplicit constant and is not enough for Layer 6; the explicit one is consumed from #6062.
- Certified computation: `ComputationalNumberTheory` (Layer 1 primality presentations, Layer 4
  analytic enclosures and §4.22 Platt's finite-conductor zero theorem). The roadmap contains no
  algorithm (no prime generation, no primality proof, no Meissel–Lehmer); the wiki pages on
  exact computation of `π(x)` and on arithmetical constants contribute values only, as Props.
- Möbius and multiplicative-function consequences (Ramaré's transfer to `M(x)`, explicit Euler
  products): `ExplicitMultiplicativeFunctions` (#6897), which consumes Layers 2–3 here.
- Almost-all and probabilistic statements about primes in short intervals (Selberg 1943,
  Cramér's model): `ProbabilisticAndMetricNumberTheory` Layer 5.
- The four instances already stated by `AnalyticNumberTheoryPartI` under its
  `…FiniteRangeInput` Props are imported by section and not restated: §0.3 (`θ(x) < 1.000081 x`),
  §0.5 (Rosser–Schoenfeld Theorem 1, `π` between `x/log x (1 + 1/(2 log x))` and `x/log x (1 +
  3/(2 log x))` for `x ≥ 59`), §0.8 and §0.20 (Rosser–Schoenfeld Theorem 6), §0.19
  (Rosser–Schoenfeld Theorem 5 with the constant `B`), §0.25 (the Euler-product bound), §0.16
  (the mod-8 theta mass from Ramaré–Rumely), §1.6 (`DirichletGRH`, `GRH` as statements) and
  §1.9 (the `O(x^{1/2+ε})` consequences of RH and GRH). What this roadmap adds for those is the
  bridging target T0.5: it proves their finite-range Props from `RH(H)` and the verification Props
  of Layer H, which discharges the gaps `gap:schoenfeld-theta-finite-range`,
  `gap:rosser-schoenfeld-prime-count-finite-range`, `gap:prime-product-finite-range` and the
  theta clause of `gap:mod-eight-theta-finite-range` that `ErdosProgressionPowers` §0.9 declares.
- `ClassicalArithmeticCompletion` (main) names `dyadicPrimeCount`, the inequality
  `π(2x) − π(x) > 3x/(5 log x)` for `x ≥ 41/2` (Rosser–Schoenfeld 1962, Corollary 3 of Theorem
  2, `rosser-schoenfeld-1962` line 210), and plans its own proof. This roadmap states the two
  sided Corollary 3 as a corollary of T2.1 and records the agreement; it does not re-plan the
  Lehmer-problem application.
- `EffectiveClassNumbers` (#1406) plans the asymptotic `p_n ∼ n log n` from the prime number
  theorem; Layer 4 here gives the explicit two-sided bounds and Cipolla's expansion, and derives
  that asymptotic as a corollary only if #1406 has not merged first.

**Hypotheses (Layer H), each a `Prop` and each its own target.** The brief asks that every
computation be a named hypothesis; they are:

- H1 `RH(H)`: imported by name from `ExplicitZetaBounds` Layer 8, which defines it as
  `AllOnCriticalLine` of `ZerosOfLFunctions` Layer 9 on `Icc 0 1 ×ℂ Icc (−H) H` for the entire
  completion of `ζ`. Instances named here as Props with their sources: `H = 545 439 823`
  (`van-de-lune-te-riele-winter-1986` line 13), `3.3·10⁹` (Ramaré–Saouter 2003 §1, via Wedeniwski;
  see Risks), `3.0610046·10¹⁰` (`platt-2017` line 485, Theorem 5.1), `3 000 175 332 800`
  (`platt-trudgian-2021-rh` line 48, Theorem 1). The ZetaGrid and Gourdon–Demichel announcements
  are context only, as `ExplicitZetaBounds` already decided: every theorem a paper proves from
  them is stated from `RH(3·10¹²)`, which implies them.
- H2 `GRH(q, H)`: imported from `ExplicitZetaBounds` Layer 8. Instances: Rumely's `q ≤ 13` to
  height `10 000` and his list (every `q ≤ 72`, composite `q ≤ 112`, and the listed moduli up to
  432) to height `2500` (`rumely-1993` lines 13 and 30); Platt's `q ≤ 400 000` to height
  `10⁸/q` is not a hypothesis but the theorem `platt_bounded_height` of
  `ComputationalNumberTheory` §4.22 (`platt-2011-thesis` line 11 states the range), with one
  bridging lemma from §4.22 to `GRH(q, 10⁸/q)`.
- H3 `PrimeCountTable`: the tabulated `π(10^k)` for `k ≤ 18` and `ψ(m·10^k)` for `m ≤ 9`,
  `k ≤ 15` (`deleglise-rivat-1998` lines 195 and 236, Tables 1–2; Deléglise–Rivat 1996 for
  `π`), and `π(10²³)` (Platt 2011), stated as one `Prop` per table with the listed values as data.
- H4 `PrimeGapsVerified X`: the maximal gaps between consecutive primes below `X` are those of
  the table, `X = 10¹⁵` (`nicely-1999` line 12, extending Young–Potler 1989), and the height that
  Carneiro–Milinovich–Soundararajan quote for their small-`x` range.
- H5 `FiniteRangeVerification`, one `Prop` per paper: Rosser–Schoenfeld 1962 below their
  thresholds (`rosser-schoenfeld-1962` lines 213–216 state that the small ranges are checked
  against Lehmer's table); Büthe's 2018 tabulation (`buthe-2018` line 60); Dusart's 2018 check on
  `[10¹⁰, 10²⁰]`; the exhaustive search over `q ≤ 1000`, `x ≤ 10⁵` behind the `0.8533` statement
  of Layer 5; the small-`n` checks behind Robin, Massias–Robin and Dusart 1999
  (`dusart-1999-mc` lines 118 and 168: `3 ≤ p_k ≤ 10¹¹` from Robin, and the range
  `k = 39017 … 170367` by machine).
- H6 `TableOfConstants`, one `Prop` per table: Treviño 2012 Table 1 (`trevino-2012` line 471);
  Kadiri 2008 Table 1 `α(q₀, ε)` (`kadiri-2008` line 140); Ramaré–Rumely 1996 Tables 1–2
  (`ramare-rumely-1996` line 58 and its §5) and Dusart 2002 (`dusart-2002` line 989, Theorem 5
  and its table) `ε(x, q)`; the per-modulus tables of Bennett–Martin–O'Bryant–Rechnitzer 2018;
  Platt–Trudgian 2021 Table 1 rows `{X, A, B, C, ε₀}` (`platt-trudgian-2021-error` line 81).

Each `Prop` is stated from the computation the paper actually describes, with its data in the
statement, and every theorem's dependence on it is visible in its signature. Discharging any of
them is `ComputationalNumberTheory`'s business, later.

**Alignment with PNT+.** The repository PrimeNumberTheoremAnd is not a pinned dependency
(`lake-manifest.json` lists only Mathlib and Tau Ceti). Its Chebyshev definitions agree with
Mathlib's `Chebyshev.psi`/`theta` (which it upstreamed), and its "PNT with error term" shape
`|ψ(x) − x| ≤ C x exp(−c (log x)^{1/2})` is the shape of T2.0's general input, so a PNT+ error
term can be plugged into T2.0 once it exists in a pinned library; nothing is imported from it.

## Final targets

Layer numbering follows the filed statement. Locators are to the sources cache (`<id> line N`)
where the text is held, else to the published theorem number (`uncertified`).

**Layer 0 — carriers and transfer lemmas.**

- T0.1 `li`, `ψ̃(x; q, a)` and `C(q, a)`: definitions as above; `li x − Li x = li 2` for `x ≥ 2`;
  existence of `C(q, a)` as a limit for `(a, q) = 1` from the qualitative prime number theorem
  in progressions (`AnalyticNumberTheoryPartI` §0.32 Siegel–Walfisz, or `ZerosOfLFunctions` 8.7
  at a ray class of `ℚ`); agreement of `primeCountAP` (ANTPartI §0.2) with
  `SieveDistribution.primeCountAP` (`SieveMethodsAndPrimePatterns` §3.1) for every `x, q, a`.
- T0.2 `ψ − θ`: `ψ(x) − θ(x) = Σ_{k ≥ 2} θ(x^{1/k})` is Mathlib's `Chebyshev.psi_eq_theta_add_sum_theta`;
  the explicit bounds `ψ(x) − θ(x) < 1.001093 √x + 3 x^{1/3}` for `x > 0` and `> 0.998697 √x` for
  `x > 121` (`schoenfeld-1976` lines 729–733, Theorem 6*, (5.3*)–(5.4*)); the general
  statement: from `|θ(y) − y| ≤ ε y` on `[y₀, ∞)` deduce `|ψ(x) − θ(x) − √x| ≤ ε √x + (log x/log
  2) x^{1/3}` for `x ≥ y₀²`.
- T0.3 Partial summation `θ ↔ π` with explicit remainder: for `x ≥ 2`,
  `π(x) − Li(x) = (θ(x) − x)/log x + ∫₂ˣ (θ(t) − t)/(t log² t) dt + 2/log 2`, the rational instance
  of Tau Ceti's `primeCount_sub_mul_logIntegral_eq` (δ = 1) after the adapter
  `TauCeti.primeCount ℚ univ x = π(⌊x⌋₊)` that `EffectiveClassNumbers` also states; and the
  reverse direction `θ(x) = π(x) log x − ∫₂ˣ π(t)/t dt`.
- T0.4 Conversion of `|ψ(x) − x| ≤ ε(x) x` into `θ` and `π` bounds (`rosser-schoenfeld-1962`
  lines 334–343, Theorem 11 with its `ε(x)`; `schoenfeld-1976` lines 201–206, Theorem 11): for a
  non-increasing admissible `ε`, `|θ(x) − x| ≤ (ε(x) + ε₁(x)) x` and `|π(x) − Li(x)| ≤ …` with
  the explicit remainder of T0.3, stated for general `ε`, with the published `ε₀(x) =
  √(8/(17π)) X^{1/2} e^{−X}`, `X = √(log x/R)`, `R = 9.645908801` as the Check.
- T0.5 Bridging to `AnalyticNumberTheoryPartI`: under `RH(H)` with `H ≥ 545 439 823` and the
  Rosser–Schoenfeld finite-range Prop of H5, the Props `SchoenfeldFiniteRangeInput`,
  `RosserSchoenfeldFiniteRangeInput` and `PrimeProductFiniteInput` of ANTPartI §§0.3, 0.5, 0.25
  hold; under `GRH(8, 10 000)` and Ramaré–Rumely's tabulation Prop (H5), the theta clause of
  `ModEightFiniteInput` (§0.16) holds (`ramare-rumely-1996` lines 58–84, Theorems 1–2 at
  `k = 8`). This discharges the four gaps of `ErdosProgressionPowers` §0.9.
- T0.6 Platt–Ramaré transfer (Platt–Ramaré 2017, Theorem 1.7, uncertified): for `q ≤ 10⁴ ≤ x`,
  `|ψ̃(x; q, a) − log x/φ(q) − C(q, a) − (ψ(x; q, a) − x/φ(q))/x| ≤ ∫_x^{5x/3} |ψ(y; q, a) −
  y/φ(q)| dy/y² + 7.05 x^{−1/2} + 8·10^{−12}`, stated for general `q, a, x` with the paper's
  two numerical constants as parameters whose values are the Check.

**Layer 1 — under RH and under RH(H).**

- T1.1 Schoenfeld under RH (`schoenfeld-1976` lines 20–28, Theorem 10; lines 98–100, Corollary
  1): with `RH` the Prop of `ZerosOfLFunctions` Layer 9 (equal to Mathlib's
  `RiemannHypothesis`), `|ψ(x) − x| < √x log² x/(8π)` for `x > 73.2` and the lower bound
  alone for `x > 59`; `|θ(x) − x| < √x log² x/(8π)` for `x > 599`; `|π(x) − li(x)| < √x log
  x/(8π)` for `x > 2657`; `π(x) − li(x) < √x log x/(8π)` for `x > 3/2`.
- T1.2 Büthe under partial RH (`buthe-2016` lines 688–700, Theorem 2): from `RH(T)` alone, for
  every `x` with `4.92 √(x/log x) ≤ T`: the `ψ` bound for `x > 59`, the `θ` bound for `x > 599`,
  and the bound for Büthe's `π*` (Riemann's weighted count); the transfer from `π*` to `π` for
  `x > 2657` is a target, not a quotation. Check: with `T = 3·10¹²` (H1) the range is
  `x ≤ 2.16·10²⁵`, and the short interval `[x − √x log² x/(4π), x]` contains a prime for
  `x ≥ 599` (Schoenfeld 1976, Corollary to Theorem 10, from T1.1's `θ` bound).
- T1.3 Büthe 2018 (`buthe-2018` lines 73–84, Theorem 2): from `RH(10¹¹)` and the tabulation
  Prop of H5, `|x − ψ(x)| ≤ 0.94 √x` for `11 < x ≤ 10¹⁹`; `x − θ(x) ≤ 1.95 √x` for `1423 ≤ x ≤
  10¹⁹`; `x − θ(x) > 0.05 √x` for `1 ≤ x ≤ 10¹⁹`; `0 < li(x) − π(x) ≤ (√x/log x)(1.95 + 3.9/log
  x + 19.5/log² x)` for `2 ≤ x ≤ 10¹⁹`. The general theorem is Büthe's Theorem 1 (line 32), an
  explicit bound for `|ψ(x) − x|` from the zeros up to a height, with the paper's parameters.
- T1.4 Short intervals under RH: Ramaré–Saouter 2003, `(x − (8/5)√x log x, x]` contains a prime
  for `x ≥ 2` (`ramare-saouter-2003`, uncertified: Elsevier; cited by theorem number); Dudek 2015
  (`dudek-2015` line 51, Theorem 2), the same with `4/π` for `x ≥ 2`;
  Carneiro–Milinovich–Soundararajan 2019 (`carneiro-milinovich-soundararajan-2019` lines 230
  and 242, Theorem 3 and Corollary 4), with `22/25` for `x ≥ 4`, equivalently `p_{n+1} − p_n ≤
  (22/25) √p_n log p_n` for `n ≥ 3`; the small-`x` range of the last rests on H4. Each is proved
  from the explicit formula under RH; the `22/25` result also needs the extremal Fourier
  problem of their Theorems 1–2, which the design must either prove or declare as a gap.

**Layer 2 — unconditional bounds for `ψ`, `θ`, `π`.**

- T2.0 General scheme (`rosser-schoenfeld-1975`, Theorems 1–2 and §4; `schoenfeld-1976` lines
  201–206, Theorem 11; `platt-trudgian-2021-error` lines 58–62, Theorem 1): from a de la Vallée
  Poussin region `σ ≥ 1 − 1/(R log |t|)` with constant `R`, `RH(H)`, an explicit `N(T)` error and
  (for the Faber–Kadiri and Platt–Trudgian shapes) a zero-density bound, an explicit
  `|ψ(x) − x| ≤ ε(x) x` for `log x ≥ X`, with `ε` a function of `(R, H, X, …)`. The published
  rows are instances: Rosser–Schoenfeld's `ε(x) = √(8/(17π)) X^{1/2} e^{−X}`, `R = 9.645908801`
  (Schoenfeld); Dusart 1999's `0.905·10^{−7}` for `x ≥ e⁵⁰` from `H = 545 439 823` (`dusart-1999-mc`
  lines 102–104, Theorem 2); Trudgian's update with `R = 6.455` (`trudgian-2016` lines 66–73,
  Theorem 1: `|θ(x) − x| ≤ x ε₀(x)` for `x ≥ 149`, `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`; lines
  132–140, Theorem 2: `|π(x) − li(x)| ≤ 0.2795 x (log x)^{3/4} exp(−√(log x/6.455))` for
  `x ≥ 229`); Platt–Trudgian's Table 1 rows with `R = 5.573412` and the π–li corollary
  `235 x (log x)^{0.52} exp(−0.8 √log x)` for `log x ≥ 2000` (lines 76–77, Corollary 2; the
  wiki's rendering `exp(−√(log x/R))` is the shape of Theorem 1, and the design states the
  paper's two forms, not the wiki's).
- T2.1 Rosser–Schoenfeld 1962: `ψ(x) < 1.03883 x` for `x > 0` with the maximum of `ψ(x)/x` at
  `x = 113` (`rosser-schoenfeld-1962` lines 341–342); `θ(x) < 1.01624 x` for `x > 0` (line
  327, Theorem 9); `x/log x < π(x)` for `x ≥ 17` and `π(x) < 1.25506 x/log x` for `x > 1` (lines
  205–207, Corollary 1); `3x/(5 log x) < π(2x) − π(x)` for `x ≥ 41/2` and `0 < π(2x) − π(x) <
  7x/(5 log x)` for `x > 1` (lines 210–212, Corollary 3); `x(1 − 1/(2 log x)) < θ(x)` for `x ≥ 563`
  and `θ(x) < x(1 + 1/(2 log x))` for `x > 1` (lines 244–253, Theorem 4). Small ranges: H5.
- T2.2 Dusart 1999 and the thesis (`dusart-1998-thesis` lines 845–846, Théorème 1.3; lines
  869–874, Théorème 1.4; line 925; line 1435): `|ψ(x) − x| ≤ 0.006409 x/log x` for `x > e²²`;
  `|θ(x) − x| ≤ 0.006788 x/log x` for `x > 10 544 111`; `|θ(x) − x| ≤ 0.2 x/log² x` for
  `x > 3 594 641`; `|θ(x) − x| ≤ 515 x/log³ x` for `x > 1`; `π(x) > x/(log x − 1)` for
  `x > 5393`. Dusart 2018 (uncertified, Ramanujan J.; Theorem 5.2 and Corollary 5.3 are the
  locators to confirm in design): `515` becomes `20.83`, and `|θ(x) − x| ≤ x/log³ x` for
  `x ≥ 89 967 803`.
- T2.3 Faber–Kadiri 2015 with the 2018 corrigendum (`faber-kadiri-2015`, Theorem 1.1 and Table
  1): `|ψ(x) − x| ≤ 0.00053699 x` for `x ≥ 485 165 196`, from Kadiri's 2013 zero-density
  estimate (imported from `ExplicitZetaBounds` target 17) and `RH(H)`, as an instance of T2.0's
  density-driven shape; the corrected table row is the Check.
- T2.4 Johnston–Yang 2023 (`johnston-yang-2023` lines 57–58, Theorem 1.1; lines 77–78,
  Theorem 1.4): `|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)` for `x ≥ 2` (the
  wiki prints `1.51`; the paper's exponent is `1.515`) and `≤ 0.026 x (log x)^{1.801} exp(−0.1853
  (log x)^{3/5}/(log log x)^{1/5})` for `x ≥ 23`; also `|π(x) − li(x)| ≤ 9.59 x (log x)^{0.515}
  exp(−0.8274 √log x)` (line 72) and the `8.14·10^{−20}` bound for `x ≥ exp(5000)`. The second
  shape needs the Vinogradov–Korobov region with constants, which `ExplicitZetaBounds` keeps as a
  declared gap; T2.4(b) is stated with that region as a hypothesis.
- T2.5 Fiori–Kadiri–Swidinsky 2023 (`fiori-kadiri-swidinsky-2023`, Theorem 1 and Theorem 3,
  line 159): `|ψ(x) − x| ≤ 9.22022 x (log x)^{1.5} exp(−0.8476836 √log x)` for `x ≥ 2`, and
  the `θ`-to-`π` transfer of their Theorem 6 as an instance of T0.4.
- T2.6 Corollaries for `π`: Panaitopol 2000 (two-term bounds for `π(x)` from Dusart's `θ`
  bounds) and Axler 2016 (`axler-2016` lines 31–47, Theorems 1.1–1.4: the two-sided bounds
  for `π(x)` with the `(log x)^{−k}` expansions, and Theorem 1.5, line 51, a short-interval
  corollary for `x ≥ 58 837`), each as a corollary of T0.3 applied to a T2.2 bound.

**Layer 3 — sums over primes.**

- T3.1 Rosser–Schoenfeld 1962: `log log x < Σ_{p ≤ x} 1/p` for `x > 1` and `Σ_{p ≤ x}
  (log p)/p < log x` for `x > 1` (`rosser-schoenfeld-1962` lines 259–266 and 283–293, the
  corollaries of Theorems 5–6). The two-sided statements with `B` and `E` are ANTPartI §§0.8,
  0.19 and are imported.
- T3.2 Ramaré 2013 corrected by Vanlalngaia 2017 (`ramare-2013` lines 82–108, Theorem 1.1 of
  the HAL text, which still prints the uncorrected range `x ≥ 23` for the `0.0067/log x` term;
  `vanlalngaia-2017` for the corrected thresholds): `Σ_{n ≤ x} Λ(n)/n = log x − γ + O*(1.833/log²
  x)` for `x > 1`, `O*(0.0067/log x)` for `x ≥ 1 520 000`, `O*(0.01/log x)` for `x ≥ 468 000`,
  `O*(1.31/√x)` for `1 ≤ x ≤ 10¹⁰`; and for `x ≥ 8950`, `Σ_{n ≤ x} Λ(n)/n = log x − γ + (ψ(x) −
  x)/x + O*(1/(2√x) + 1.75·10^{−12})`. General form: the transfer from any `|ψ(y) − y| ≤ ε(y) y`
  to `Σ Λ(n)/n` by partial summation, with the constants as the instance.
- T3.3 Vanlalngaia 2017, with `B` the Meissel–Mertens constant: `Σ_{p ≤ x} 1/p = log log x + B
  + O*(4/log³ x)` for `x ≥ 2`, `2.3` for `x ≥ 1000`, `1` for `x ≥ 24 284`, and
  `O*(1.1 exp(−√(0.175 log x))/(log x)^{3/4})` for `log x ≥ 4635`; the definition of `B` is
  Tau Ceti's `mertensConstant` at `K = ℚ` (file `TauCeti/NumberTheory/LFunctions/Mertens.lean`),
  and its decimal enclosure is a Prop shared with `ExplicitMultiplicativeFunctions`
  (`MeisselMertensConstantValue`), stated once there.
- T3.4 Ramaré 2016 Lemma 3.2 (`ramare-2016` lines 294–303): for `C¹` non-negative
  non-increasing `f` on `[P, ∞)` with `t f(t) → 0`, `Σ_{p ≥ P} f(p) log p ≤ (1 + ε) ∫_P^∞ f +
  ε P f(P) + P f(P)/(5 log² P)` with `ε = 1/914` for `P ≥ 3 600 000`, and `1/5` replaced by `4`
  for `P ≥ 2`; the general statement takes any `θ`-bound `|θ(y) − y| ≤ ε y` on `[P, ∞)` as input
  and the value `ε = 1/36 260` for the range of Dusart 2016, Proposition 5.1 (`dusart-2016`) as
  a second instance.
- T3.5 Treviño 2012 (`trevino-2012` lines 466–476, Lemma 3.4 and Table 1): for every row
  `(a, c₁, c₂)` of Table 1 (hypothesis H6) and `x ≥ a`, `x²/(2 log x) + c₁ x²/log² x ≤ Σ_{p ≤ x}
  p ≤ x²/(2 log x) + c₂ x²/log² x`; proved from the `θ` bounds of Table 2 (line 493) by partial
  summation, so the general theorem converts a `θ`-bound row into a sum-of-primes row.
- T3.6 Deléglise–Nicolas 2019 (`deleglise-nicolas-2019-rh`, HAL text, line 542: the `π₁`
  bound for `x > 110 117 910` is its Corollary 2.7, so the HAL numbering differs from the
  issue's "Proposition 2.7 and Corollary 2.8" and the design must cite the version it reads;
  `deleglise-nicolas-2019-landau`, HAL text, Proposition 2.5 and Corollaries 2.6–2.8 to be
  confirmed likewise), `π_r(x) = Σ_{p ≤ x} p^r`: the two-sided bounds for `π₁` (upper for `x ≥ 110 117 910`,
  lower for `x ≥ 905 238 547`) and `π₂` (upper for `x ≥ 60 173`, lower for `x ≥ 1 091 239`) with
  the stated three-term main terms and `x^{r+1}/log⁴ x` remainders; `π₃, π₄, π₅ ≤ 0.271 x⁴/log
  x, 0.237 x⁵/log x, 0.226 x⁶/log x` for `x ≥ 664, 200, 44`; and `π_r(x) ≤ (log 3/3)(1 +
  (2/3)^r) x^{r+1}/log x` for `x ≥ 1`, `r ≥ 5`. General form: for every `r ≥ 1`, partial
  summation of a `θ`-bound against `t^r/log t`.

**Layer 4 — the `n`-th prime** (indices shifted to Mathlib's `nth Prime (n − 1)`).

- T4.1 Rosser 1938 and 1941 (uncertified, paywalled; cited by theorem number): `p_n > n log n`
  for `n ≥ 1`, `n(log n + log log n − 10) < p_n < n(log n + log log n + 8)` for `n > 1` (1938),
  the same with `−4` and `+2` for `n ≥ 55` (1941). Rosser–Schoenfeld 1962
  (`rosser-schoenfeld-1962` lines 224–241, Theorem 3 and its Corollary): `n(log n + log log n −
  3/2) < p_n` for `n ≥ 2`, `p_n < n(log n + log log n − 1/2)` for `n ≥ 20`, `n log n < p_n` for
  `n ≥ 1`, `p_n < n(log n + log log n)` for `n ≥ 6`. General form: inversion of a two-sided
  `θ` bound (`θ(p_n) = Σ_{i ≤ n} log p_i`) into a `p_n` bound, with the threshold as a function
  of the `θ`-threshold.
- T4.2 Robin 1983 (Théorème 8; IMPAN back volume if reachable, else uncertified): `p_n ≥ n(log n
  + log log n − 1.0072629)` for `n ≥ 2`, and with `1` for `p_n ≤ 10¹¹`; Massias–Robin 1996
  (`massias-robin-1996`, Théorème A): `1` is admissible for `p_n < e⁵⁹⁸` and for `p_n > e¹⁸⁰⁰`;
  Dusart 1999 (`dusart-1999-mc` lines 116–117, Theorem 3; line 168): `p_n ≥ n(log n + log log n
  − 1)` for all `n ≥ 2`, and `p_n ≤ n(log n + log log n − 0.9484)` for `n ≥ 39 017`. The small
  ranges rest on `RH(545 439 823)` and the H5 Props (lines 118–120 and 1279 of the thesis say
  which).
- T4.3 Cipolla 1902 (waived; cited as Matematiche (Napoli) 3, pp. 132–166): the asymptotic
  expansion `p_n = n(log n + log log n − 1 + (log log n − 2)/log n − ((log log n)² − 6 log log n +
  11)/(2 log² n) + o(1/log² n))`, as an asymptotic statement, proved by inverting the prime number
  theorem with error term (`ZerosOfLFunctions` 8.5 at `K = ℚ`, or Tau Ceti's rational prime number
  theorem plus T2.0's instance).
- T4.4 Axler 2019 (`axler-2019`, Theorems 1.6–1.7): the two-sided bounds for `Σ_{i ≤ k} p_i`,
  lower for `k ≥ 6 309 751` and upper for `k ≥ 256 376`, with the paper's main terms (the wiki's
  rendering drops a factor `log k`; the paper's statement is the target). De Koninck–Letendre
  2020 (`de-koninck-letendre-2020` line 489, Lemma 4.8 of the arXiv text): `Σ_{i ≤ k} log p_i ≤ k(log k + log log k − 1/2)`
  for `k ≥ 5` and `Σ_{i ≤ k} log log p_i ≥ k(log log k + (log log k − 3/2)/log k)` for `k ≥ 6`.

**Layer 5 — primes in arithmetic progressions.**

- T5.1 General theorem (McCurley 1984, Theorems 1.1–1.3; `ramare-rumely-1996` lines 58–65,
  Theorem 1, and its Theorem 4.3.2; `dusart-2002` lines 402 and 989, Theorems 3 and 5): for a
  modulus `q`, from an explicit zero-free region for the `L`-functions mod `q` with its possible
  exceptional zero, `GRH(q, H)` and the explicit formula, `max_{y ≤ x} |ψ(y; q, a) − y/φ(q)| ≤
  ε x/φ(q)` and the same for `θ` for `x ≥ x₀`, with `ε = ε(x₀, q, H, R)` the paper's function; the
  rows `(q, ε, x₀)` of Ramaré–Rumely Table 1 and of Dusart 2002 are H6 instances. Ramaré–Rumely
  Theorem 2 (lines 77–84): for `q` in Table 1 and `1 ≤ x ≤ 10¹⁰`, `|θ(y; q, a) − y/φ(q)| ≤ 2.072
  √x` and `|ψ(y; q, a) − y/φ(q)| ≤ 1.745 √x`, a tabulation Prop of H5.
- T5.2 Bennett–Martin–O'Bryant–Rechnitzer 2018 (`bennett-martin-obryant-rechnitzer-2018`,
  lines 169–195, Theorems 1.1–1.3): for `q ≥ 3` and `(a, q) = 1` there are explicit
  `c_ψ(q) ≤ c₀(q)` and `x_ψ(q) ≤ x₀(q)` with `|ψ(x; q, a) − x/φ(q)| < c_ψ(q) x/log x` for `x ≥
  x_ψ(q)`, where `c₀(q) = 1/840` for `3 ≤ q ≤ 10⁴` and `1/160` for `q > 10⁴`, and `x₀(q) =
  8·10⁹` for `3 ≤ q ≤ 10⁵` and `exp(0.03 √q log³ q)` for `q > 10⁵`; the same for `θ`, and
  `|π(x; q, a) − Li(x)/φ(q)| < c_π(q) x/log² x` with the same bounds (the wiki prints the
  large-`q` threshold as a constant; the paper's function is the target, and the per-modulus
  `c(q), x(q)` are table data).
  Inputs: `platt_bounded_height` (ComputationalNumberTheory §4.22) through the bridging lemma of
  H2, Kadiri's zero-free region for `L(s, χ)` (`ExplicitZetaBounds` target 16, the Dirichlet
  case), and the paper's per-modulus tables (H6).
- T5.3 Ramaré 2002, Theorem 2 (Manuscripta, uncertified): for `q` in Rumely's list and
  `(a, q) = 1`, `ψ̃(x; q, a) = log x/φ(q) + C(q, a) + O*(1)` for `x ≥ 1`, from `GRH(q, 2500)`
  (`rumely-1993` lines 13 and 30) and T0.6. The finite statement that `max √x |ψ̃(x; q, a) − log
  x/φ(q) − C(q, a)|` over `q ≤ 1000`, `q ≤ x ≤ 10⁵`, `(a, q) = 1` lies in `(0.8533, 0.8534)`,
  attained at `(q, x, a) = (17, 606, 2)`, is an H5 Prop and a Check, not a theorem here.
- T5.4 Bach–Sorenson 1996 (`bach-sorenson-1996`, Theorem 5.3 or the theorem the design
  confirms): under `GRH` for the characters mod `q` (ANTPartI §1.6's `DirichletGRH` for every
  `χ` mod `q`), for `(m, q) = 1` some prime `p ≡ m (mod q)` satisfies `p < 2 (q log q)²`.
- T5.5 Kadiri 2008 (`kadiri-2008` lines 128–131, Theorem 1.1; line 140, Table 1): for `q ≥ 3`
  non-exceptional, `(a, q) = 1`, `ε > 0`, there is `α > 0` such that `x ≥ α log² q` implies
  `[eˣ, e^{x+ε}]` contains a prime `p ≡ a (mod q)`; the existence statement is proved in
  general, and the table `α(q₀, ε)` is an H6 Prop whose rows give the quantitative Checks.

**Layer 6 — short intervals, unconditional.** Each from the smoothed explicit formula
(`ZerosOfLFunctions` 8.3–8.4 with `ExplicitZetaBounds`' constants), the explicit
Brun–Titchmarsh inequality (#6062), a zero-free region and `RH(H)`, the finite range closed by
an H5 Prop.

- T6.1 Schoenfeld 1976 (`schoenfeld-1976` lines 668–669, Theorem 12): `(x, x + x/16597)` contains
  a prime for `x > 2 010 759.9`.
- T6.2 Ramaré–Saouter 2003 (Theorems 1–3; see Sources): from `RH(3.3·10⁹)`, `(x(1 − 1/28 314
  000), x]` contains a prime for `x > 10 726 905 041` and `(x(1 − 1/204 879 661), x]` for `x ≥
  e⁵³`; from `RH(3·10¹²)` (replacing the unrefereed `2.445·10¹²`), `(x(1 − 1/14 500 755 538), x]`
  for `x ≥ e⁶⁰`. General form: an interval `(x(1 − 1/Δ(H, R, x₀)), x]` with `Δ` the paper's
  function of the height and the region.
- T6.3 Kadiri–Lumley 2014 (`kadiri-lumley-2014` lines 28–29, Theorem 1.1, with its Table 2):
  for every `x₀ ≥ 4·10¹⁸` and the table's `Δ(x₀)`, `((1 − Δ⁻¹)x, x)` contains a prime for `x >
  x₀`; the wiki's row is `Δ = 1 966 196 911` at `x₀ = e⁶⁰` (line 52). Cully-Hugill–Lee 2022 with
  the 2024 corrigendum (`cully-hugill-lee-2022` lines 75–76, Theorem 1 with Table 2; the
  corrigendum's corrected table is the authority): `(x(1 − Δ⁻¹), x]` for `x ≥ x₀` for each pair
  `(Δ, x₀)` of the table, `Δ = 7.69·10¹⁰` at `log x₀ = 60` (line 85). Both are table-row
  statements with the table as an H6 Prop and the general theorem (Kadiri–Lumley's Theorem 2.7)
  as the target.
- T6.4 Trudgian 2016 (`trudgian-2016` lines 229–233, Corollary 2): `[x, x(1 + 1/(111 log² x))]`
  contains a prime for `x ≥ 2 898 239` (the wiki prints `2 898 242`), a corollary of his
  Theorem 1 (lines 66–73: Schoenfeld's `ε₀` shape with `R = 6.455`, `|θ(x) − x| ≤ x ε₀(x)` for
  `x ≥ 149`, `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`), which is itself an instance of T2.0 and is
  listed there. Dusart 2018 (uncertified): `[x, x(1 + 1/(5000 log² x))]` for `x > 468 991 632`
  and `[x, x(1 + 1/log³ x)]` for `x > 89 693`, the range `10¹⁰ ≤ x ≤ 10²⁰` an H5 Prop. Axler
  2016 Theorem 1.5 (`axler-2016` line 51) is the corollary already in T2.6.
- T6.5 Dudek 2016 (`dudek-2016` line 63, Theorem 1.1): there is a prime between `n³` and
  `(n + 1)³` for every `n ≥ exp(exp(33.217))` in the arXiv text (the published version and
  Cully-Hugill quote `33.3`; the design cites the version it reads); the wiki's form `(x, x +
  3x^{2/3}]` for `x ≥ exp(exp(34.32))` is the corollary at `x = n³`. Cully-Hugill 2021
  (`cully-hugill-2021` line 662) improves the cube threshold to `exp(exp(33.990))`; her Theorem
  1 (line 28), a prime between consecutive 155-th powers for every `n ≥ 1`, is a further
  corollary worth stating. These rest on the Vinogradov–Korobov region with constants
  (`ExplicitZetaBounds`' declared gap) and are stated with that region as a hypothesis.

**Suggested.lean.** It states the headline instances with `sorry` against Mathlib's carriers,
importing only `Mathlib`: at least T1.1 (Schoenfeld under `RiemannHypothesis`), T2.1 (`ψ(x) <
1.03883 x`), T2.2 (Dusart's `0.006409`), T2.4 (Johnston–Yang, under its `RH(H)` and table Props),
T3.3 (Vanlalngaia's `4/log³ x` with `B` a stated real), T4.2 (Dusart's `p_n ≥ n(log n + log log n
− 1)`), T5.2 (BMOR at `q ≤ 10⁴`), T6.1 and T6.4. The `Prop`s H1–H6 are stated in the file as
simple definitions (a `RH(H)` placeholder over Mathlib's `riemannZeta` is acceptable there, with
the README recording that the roadmap's own `RH(H)` is the imported one).

## Suppliers

On main:

- `ZerosOfLFunctions`: Layer 4 (`zeroCount`, `N(T)`), Layer 6 (zero-free regions with
  existential constants; the exceptional-zero predicate), Layer 7 (Riemann–von Mangoldt), Layer
  8 (contour shift, truncated and Weil explicit formulas, 8.5 prime ideal theorem with error term
  at `K = ℚ`, 8.9 `Li` adapters), Layer 9 (`HasZerosInRects`, `AllOnCriticalLine`, `GRH`).
- `LFunctions` Layer 4 (Dirichlet characters and `L(s, χ)` as records), through
  `ZerosOfLFunctions`.
- `Completed/ArithmeticDirichletSeries` §6.2 (`TauCeti.Real.logIntegral`, the `ϑ ⟹ π` transfer
  as realised in Tau Ceti's `primeCount_sub_mul_logIntegral_eq`) and Tau Ceti's
  `mertensConstant`.
- `ClassicalArithmeticCompletion` (`dyadicPrimeCount`, agreement recorded).
- Mathlib: `Chebyshev.psi`, `Chebyshev.theta`, `Chebyshev.psi_eq_theta_add_sum_theta`,
  `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`, `Chebyshev.theta_le_log4_mul_x`,
  `Nat.primeCounting`, `Nat.nth`, `Nat.primeCounting'_nth_eq`, `Nat.exists_prime_lt_and_le_two_mul`,
  `ArithmeticFunction.vonMangoldt`, `RiemannHypothesis`, `Real.eulerMascheroniConstant`
  (enclosed only by `1/2 < γ < 2/3`: the decimal enclosure is a Prop shared with #6897).

Earlier in the merge order (open pull requests):

- `AnalyticNumberTheoryPartI` (#1126, order 84): §0.2 progression carriers, §§0.3, 0.5, 0.8,
  0.16, 0.19, 0.20, 0.25 (imported instances and the Props T0.5 proves), §1.6 (`DirichletGRH`,
  `GRH`), §1.9, §0.32 (Siegel–Walfisz, for `C(q, a)`).
- `ComputationalNumberTheory` (#1800, order 185): §4.22 `platt_bounded_height`, §4.24; Layer 4
  §4.17a digamma remainders (for the `γ` enclosure, optionally).
- `ErdosProgressionPowers` (#1336, order 187): consumer of T0.5 through the gaps it declares;
  not a supplier.
- `SieveMethodsAndPrimePatterns` (#1495, order 259): §3.1 `SieveDistribution.primeCountAP`
  (agreement lemma), §1.6 `prime_interval_upper` (not sufficient; recorded).
- `EffectiveClassNumbers` (#1406, order 238): the rational-prime counting adapter
  `TauCeti.primeCount ℚ univ x = π(⌊x⌋₊)`, reused rather than restated.

Sibling targets, to be placed before this roadmap:

- `ExplicitCharacterSumsAndSieves` (#6062): explicit Brun–Titchmarsh (Layer 6 here).
- `ExplicitZetaBounds` (#6894): Layer 8 Props `RH(H)`, `GRH(q, H)`; targets 16–17 (zero-free
  regions with constants, zero density), the explicit `N(T)` error terms, Lehman's lemma, the
  Perron and mean-value tools, `R₀`, `A`, Kadiri's `R₁`, `R₂`. The order it fixes is
  `ExplicitCharacterSumsAndSieves → ExplicitZetaBounds → ExplicitPrimeCounting`.

Merge-order position: after `ProbabilisticAndMetricNumberTheoryPartII` (261) and after the two
siblings above, before `ExplicitMultiplicativeFunctions` (#6897) and `ExplicitNumberFields`
(#6064), which consume it.

## Consumers

- `ExplicitMultiplicativeFunctions` (#6897): Layers 2–3 here for the numerical instances of its
  T1.2, T2.2, T3.1, T8.1–T8.2 (explicit `ψ`, `Σ Λ(n)/n`, Mertens sums); it names
  `RiemannZerosVerified T = RH(T)`.
- `ExplicitNumberFields` (#6064): Layers 2–5 for its least-primitive-root and class-number
  bounds (sums over primes, primes in progressions).
- `ErdosProgressionPowers` (#1336): T0.5 discharges `gap:schoenfeld-theta-finite-range`,
  `gap:rosser-schoenfeld-prime-count-finite-range`, `gap:prime-product-finite-range` and the
  theta clause of `gap:mod-eight-theta-finite-range` (each still conditional on `RH(H)` and H5).
- `ClassicalArithmeticCompletion` (`dyadicPrimeCount`) and `EffectiveClassNumbers` (`p_n ∼ n log
  n`): T2.1 and T4.1–T4.3 give both with constants; if they merge first they are imported, else
  their statements are corollaries here.
- Beyond the board: explicit Goldbach-type and seven-cubes arguments (Kadiri 2008's Theorem
  1.2 is such an application and is not a target here), `CircleMethodThreePrimes` (which
  excludes every explicit form and names this layer as what it would consume), effective
  Chebotarev and least-prime bounds, and any Diophantine argument needing a prime in `(x, x(1 +
  δ)]`.

## Sources

Manifest `packages/ExplicitPrimeCounting/sources.toml` records every work below with its status.

Fifty-seven works are recorded; every one was fetched through the sources service or is held by
the operator, except seven paywalled papers recorded `uncertified` (cited by locator) and
Cipolla 1902 (`waived`). No text remains unread that a design must have, so no
`needs-references` request is open.

**Held locally (operator copies, `certified`, read).** `rosser-schoenfeld-1962` (Theorems 1–14
and Corollaries, lines 195–350), `schoenfeld-1976` (Theorems 10, 11, 12, 6*, 8*, Corollaries
1–3), `dusart-1999-mc`, `dusart-1998-thesis` (Chapitres 1, 3, 4; Théorèmes 1.3, 1.4, 1.8),
`dusart-2002` (Theorems 1–5), `ramare-rumely-1996` (Theorems 1–2, 3.6.2–3.6.3, 4.3.2, Tables
1–2), `kadiri-2008` (Theorem 1.1, Table 1), `trevino-2012` (Lemma 3.4, Tables 1–2), `ramare-2016`
(Lemma 3.2), `platt-2017` (Theorem 5.1), `van-de-lune-te-riele-winter-1986`, `rumely-1993`,
`deleglise-rivat-1998` (Tables 1–2), `nicely-1999`, `young-potler-1989` (an image-only scan: its
cached text is empty and the service's OCR was used to read it; cite it by page and table).

**Open repositories and open archives (`certified`, read).** arXiv: `platt-2011-thesis`,
`buthe-2016`, `buthe-2018`, `platt-trudgian-2021-rh`, `platt-trudgian-2021-error`,
`fiori-kadiri-swidinsky-2023`, `johnston-yang-2023`, `axler-2016`, `axler-2019`,
`carneiro-milinovich-soundararajan-2019`, `bennett-martin-obryant-rechnitzer-2018`,
`kadiri-lumley-2014`, `trudgian-2016`, `dudek-2016`, `dudek-2015`, `cully-hugill-2021`,
`cully-hugill-lee-2022`, `kadiri-2013-density`, `de-koninck-letendre-2020`. HAL: `ramare-2013`
(the uncorrected text; see Risks), `deleglise-nicolas-2019-rh`, `deleglise-nicolas-2019-landau`.
Numdam: `massias-robin-1996`. Zenodo (CC BY 4.0): `vanlalngaia-2017` (the extracted text has a
broken font map; the service's OCR output was used to confirm its thresholds `24 284` and
`4635`). AMS Math. Comp. open archive (`publisher-open`): `rosser-schoenfeld-1975`,
`dusart-2016`, `faber-kadiri-2015`, `faber-kadiri-2018-corrigendum`, `mccurley-1984`,
`bach-sorenson-1996`, `deleglise-rivat-1996`. Institutional and author pages: `robin-1983`
(Acta Arithmetica back volume at the Polish digital mathematics library, OCR'd scan),
`panaitopol-2000` (the journal's own archive), `ramare-2002` (the author's page).

**Paywalled, cited by locator (`uncertified`).** `rosser-1938` (Proc. LMS, Theorems 1–2),
`rosser-1941` (Amer. J. Math., Theorems 1–3), `dusart-1999-cr` (C. R. Canada; the proofs are in
the thesis), `dusart-2018` (Ramanujan J., Theorems 5.1–5.4, Corollaries 5.5–5.6, Proposition
5.4), `ramare-saouter-2003` (J. Number Theory, Theorems 1–3), `platt-ramare-2017` (Exp. Math.,
Theorem 1.7; Bristol's repository lists an accepted manuscript that answers scripts with HTTP
403, so a human may name it), `cully-hugill-lee-2024` (Math. Comp. corrigendum, inside the
publisher's five-year window).

**Waived.** `cipolla-1902` (Matematiche (Napoli) 3, pp. 132–166).

**Context, not sources.** The ZetaGrid (Wedeniwski 2002) and Gourdon–Demichel (2004)
announcements, the TME-EMT wiki pages, and the PNT+ repository are consulted for orientation
only; no statement is taken from them.

Version notes the design must keep: `dudek-2016` arXiv prints `33.217` where the journal
version and later citations print `33.3`; `deleglise-nicolas-2019-rh` (HAL) numbers the `π₁`
bound Corollary 2.7; `ramare-2013` (HAL) predates Vanlalngaia's corrections and Ramaré's own
2023 corrigendum (Acta Arith. 211, reporting sign errors in its Lemmas 2.1–2.2 and in Lemma 4 of
Ramaré–Saouter 2003); `bennett-martin-obryant-rechnitzer-2018` is the arXiv draft of the
Illinois J. Math. paper.

## Risks

- **Supplier chain not yet placed.** The decimal constants of the zero-free regions, the
  explicit `N(T)` error, the zero-density bound and the Props `RH(H)`, `GRH(q, H)` are planned by
  `ExplicitZetaBounds` (#6894), and the explicit Brun–Titchmarsh by `ExplicitCharacterSumsAndSieves`
  (#6062); both are designs in progress. Mitigation already in the targets: every Layer 2, 5 and 6
  theorem takes its region constant, height and density bound as parameters, so the general
  theorems can be designed and proved before the siblings land; only the instances wait.
- **Vinogradov–Korobov with constants.** T2.4(b) (Johnston–Yang's second shape) and T6.5
  (Dudek, Cully-Hugill) need the Vinogradov–Korobov region with explicit constants, which
  `ExplicitZetaBounds` keeps as a declared gap because no roadmap plans an explicit Vinogradov
  mean value theorem. These targets are stated with the region as a hypothesis; they cannot
  become unconditional until that gap is filled.
- **Fourier optimisation.** Carneiro–Milinovich–Soundararajan's `22/25` rests on an extremal
  problem in Fourier analysis (their Theorem 2) that no roadmap plans. T1.4 states the prime-gap
  theorem from that lemma as a hypothesis or declares the gap.
- **Unreadable texts.** Rosser 1938 and 1941, Dusart 1999 (C. R. Can.), Dusart 2018, Ramaré
  2013, Ramaré 2002, Platt–Ramaré 2017, Kadiri 2013, the two Deléglise–Nicolas papers,
  De Koninck–Letendre 2020, Trudgian 2016 (published form) and Carneiro–Milinovich–Soundararajan
  (published form) are paywalled; several have arXiv versions whose numbering the design must
  check against the journal statements it quotes. Cipolla 1902 is waived. Where only the issue
  text and the wiki carry a constant (Dusart 2018's `20.83`, `89 967 803`, `5000`, `468 991 632`,
  `89 693`; Ramaré 2013's four constants; Ramaré 2002's `O*(1)`), the README must mark the
  constant as taken from a secondary rendering until the primary text is read.
- **Wiki renderings differ from the papers.** Johnston–Yang's exponent is `1.515`, not `1.51`;
  Platt–Trudgian's `235` bound is their π–li corollary with `exp(−0.8 √log x)`, while their
  Theorem 1 is a table-row statement with `exp(−C √(log x/R))`; Büthe 2016's third inequality is
  for `π*`, not `π`; Axler 2019's main terms lose a factor `log k` on the wiki; Dudek's threshold
  `34.32` versus the paper's. The design must state the papers' forms and treat the wiki as an
  index only.
- **Index and threshold conventions.** Mathlib's `nth Prime` is zero-based; `Chebyshev.theta` is
  inclusive at `x`; the sources mix `x > x₀` with `x ≥ x₀` and real with integer `x`. Every
  `Suggested.lean` statement needs a Check at the threshold.
- **Certified real arithmetic in Lean.** Constants like `0.006409`, `1.03883` and thresholds
  like `485 165 196` must be compared with values of `exp`, `log` and `π` in Lean; Mathlib has
  `pi_gt_d6`, `exp_one_gt_d9`, `log_two_gt_d9` but only `1/2 < γ < 2/3`. The `γ` and `B`
  enclosures are Props shared with #6897 and must be stated once.
- **Hypothesis granularity.** Several papers describe a verification without stating the
  verified predicate (Dusart's `[10¹⁰, 10²⁰]` check, Büthe's tabulation, the `0.8533` search);
  the design must phrase each Prop from the computation actually described, one Prop per
  distinct computation, never from the wiki's summary.
- **Overlap management with `AnalyticNumberTheoryPartI`.** Its §§0.3, 0.5, 0.8, 0.19, 0.25 are
  imported, not restated; if that pull request changes those Props' shapes before this roadmap
  is designed, T0.5 must follow.
