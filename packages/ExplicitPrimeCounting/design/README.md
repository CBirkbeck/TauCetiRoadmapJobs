# Roadmap: explicit prime counting — numerically explicit bounds for ψ, θ, π, the n-th prime, sums over primes, primes in progressions and short intervals

**Summary.** This roadmap develops, on Mathlib's carriers `Chebyshev.psi`, `Chebyshev.theta`,
`Nat.primeCounting`, `Nat.nth Nat.Prime` and `ArithmeticFunction.vonMangoldt` and on Tau Ceti's
offset logarithmic integral `TauCeti.Real.logIntegral`, the numerically explicit theory of the
distribution of primes: the exact transfer identities between `ψ`, `θ`, `π` and `Li`; the general
theorems that turn a zero-free region with constant `R`, a height `H` of verified zeros, an explicit
zero-counting error and a zero-density bound into a bound `|ψ(x) − x| ≤ ε(x) x` with `ε` an explicit
function of those parameters; the same for primes in a residue class modulo `q`; and the published
constants of Rosser–Schoenfeld, Schoenfeld, Dusart, Faber–Kadiri, Trudgian, Platt–Trudgian,
Johnston–Yang, Fiori–Kadiri–Swidinsky, Büthe, Ramaré–Rumely, Bennett–Martin–O'Bryant–Rechnitzer,
Kadiri–Lumley and Cully-Hugill–Lee as instances of those theorems. From the Chebyshev bounds it
derives explicit bounds for `π(x)`, for the `n`-th prime, for the Mertens sums `∑ Λ(n)/n`, `∑ 1/p`,
for the sums `∑_{p ≤ x} p^r`, for primes in arithmetic progressions, and for short intervals
`(x(1 − Δ⁻¹), x]` that contain a prime. Every numerical computation a source relies on (a verified
height of zeros, a table of constants, a finite-range check) is a named proposition stated once in
Layer 1 with its data in the statement, never proved here, and visible in the signature of every
theorem that uses it. The end theorems are Schoenfeld's bounds under the Riemann hypothesis,
Rosser–Schoenfeld's `ψ(x) < 1.03883 x`, Dusart's `|ψ(x) − x| ≤ 0.006409 x/log x`, Johnston–Yang's
`|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)`, Vanlalngaia's `∑_{p ≤ x} 1/p = log log x
+ B + O*(4/log³ x)`, Dusart's `p_n ≥ n(log n + log log n − 1)`, the Bennett–Martin–O'Bryant–Rechnitzer
bound `|ψ(x; q, a) − x/φ(q)| < x/(840 log x)` for `3 ≤ q ≤ 10⁴`, Schoenfeld's prime in `(x, x + x/16597)`
and Trudgian's prime in `[x, x(1 + 1/(111 log² x))]`.

Suggested home: `TauCeti/NumberTheory/ExplicitPrimes/`, divided into `Carriers/`, `Hypotheses/`,
`ConditionalBounds/`, `ChebyshevBounds/`, `PrimeSums/`, `NthPrime/`, `Progressions/` and
`ShortIntervals/`. `Suggested.lean` states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Owned here

- The carriers this roadmap adds: the unoffset logarithmic integral *li* with `li 2` the Cauchy
  principal value, the logarithmic progression sum `ψ̃(x; q, a) = ∑_{n ≤ x, n ≡ a (q)} Λ(n)/n`, and
  the Mertens constants `C(q, a)` of a residue class (Layer 0).
- The exact transfer identities between `ψ`, `θ`, `π` and `Li` with their remainders, and the general
  conversion of a `ψ`-bound into `θ`- and `π`-bounds (Layer 0).
- The hypotheses: bounded-height Riemann hypotheses for `ζ` and for the characters modulo `q` as
  stated in `Suggested.lean`, the finite-range verifications, the tables of constants, the maximal
  prime-gap table, and the decimal enclosures of Euler's constant `γ` and of the Meissel–Mertens
  constant `B` (Layer 1). The decimal enclosures are stated here because the roadmap
  `ExplicitMultiplicativeFunctions`, which also needs them, is later in the order of supply.
- Bounds for `ψ`, `θ`, `π` under the Riemann hypothesis and under the Riemann hypothesis to a height
  (Layer 2); unconditionally, the general scheme and its published instances (Layer 3).
- Explicit Mertens sums, Ramaré's weighted prime sums, Treviño's sums of primes and
  Deléglise–Nicolas's sums `∑_{p ≤ x} p^r` (Layer 4).
- Two-sided bounds for the `n`-th prime, Cipolla's expansion, and sums of the first `n` primes
  (Layer 5).
- Primes in arithmetic progressions with explicit constants, the general theorem and its instances
  (Layer 6); short intervals containing a prime, conditional (Layer 2) and unconditional (Layer 7).

### Consumed, not redefined

- `Chebyshev.psi`, `Chebyshev.theta`, their basic laws and the identities
  `Chebyshev.psi_eq_theta_add_sum_theta`, `Chebyshev.primeCounting_eq_theta_div_log_add_integral`,
  `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`, `Chebyshev.theta_le_log4_mul_x`: Mathlib.
- `TauCeti.Real.logIntegral` (`Li`, with `Li 2 = 0`) and its calculus, in particular
  `TauCeti.Real.logIntegral_eq_div_log_sub_add`; `TauCeti.mertensConstant ℚ` (the constant `B`):
  Tau Ceti. The asymptotic adapters `Li x − x/log x ∼ x/log² x`: ZerosOfLFunctions §8.9.
- The progression carriers `psiAP q a x` and `primeCountAP q a x` (modulus `q`, residue `a : ZMod q`,
  real `x`) and the theta sum `θ(x; a, q)`: AnalyticNumberTheoryPartI §0.2.
- The rational prime-counting adapter `TauCeti.primeCount ℚ Set.univ x = π(⌊x⌋₊)`:
  EffectiveClassNumbers §4.4.
- Everything about the zeros of `ζ` and `L(s, χ)`: the counting function `zeroCount` and `N(T)`
  (ZerosOfLFunctions §§4.1, 4.5), the zero-free regions with existential constants and the
  exceptional-zero predicate (§§6.2–6.4), the truncated and Weil explicit formulas
  (§§8.3–8.4), the prime number theorem with error term and its progression form (§§8.5, 8.7),
  the certificate semantics `AllOnCriticalLine` and `GRH` (Layer 9). The decimal constants of the
  zero-free regions, the explicit zero-counting errors, the zero-density bounds, Lehman's lemma,
  the explicit Perron formula and the bounded-height propositions `RH(H)`, `GRH(q, H)` are the
  business of ExplicitZetaBounds and are listed as gaps in the supplier contracts.
- Dirichlet characters and `L(s, χ)`: Mathlib `DirichletCharacter.LFunction`; the statements
  `DirichletGRH χ` and `GRH`: AnalyticNumberTheoryPartI §1.6; Siegel–Walfisz: §0.32.
- The explicit Brun–Titchmarsh inequality with the Montgomery–Vaughan constant: a gap on
  ExplicitCharacterSumsAndSieves.
- Platt's finite-conductor zero theorem `platt_bounded_height` and the absence of real zeros for
  conductors at most `400 000`: ComputationalNumberTheory §§4.22, 4.24.
- The four finite-range inputs `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`,
  `PrimeProductFiniteInput` and the theta clause of `ModEightFiniteInput` of
  AnalyticNumberTheoryPartI §§0.3, 0.5, 0.25, 0.16, and the theorems they gate (§§0.3, 0.5, 0.8,
  0.16, 0.19, 0.20, 0.25): imported by section. This roadmap adds only the theorems that prove
  those inputs from its own hypotheses (§0.6).

### Not owned here

- The inequality `π(2x) − π(x) > 3x/(5 log x)` for `x ≥ 41/2`, named `dyadicPrimeCount` by
  ClassicalArithmeticCompletion §6.34, which plans its own proof; §3.5 here states the two-sided
  Rosser–Schoenfeld corollary of which it is the lower half and records the agreement.
- The asymptotic `p_n ∼ n log n`: EffectiveClassNumbers §4.4. Layer 5 gives explicit two-sided
  bounds, from which that asymptotic follows, but does not restate it.
- Products over primes (Mertens' third theorem with explicit constants), the Möbius function and
  Euler products: ExplicitMultiplicativeFunctions, a consumer of Layers 3–4.
- Almost-all and probabilistic statements about primes in short intervals:
  ProbabilisticAndMetricNumberTheory Layer 5.
- Algorithms: no prime generation, no primality proof, no Meissel–Lehmer method, no computation of
  zeros. Every number a paper obtained by computation enters as data in a Layer 1 proposition.
- The explicit Vinogradov–Korobov zero-free region: ExplicitZetaBounds target 17, itself a declared
  gap there; the two theorems that need it (§3.6, §7.5) take that region as a hypothesis.
- The asymptotic prime-gap statements of Carneiro–Milinovich–Soundararajan (their Theorem 3 and
  Corollary 4), which rest on Iwaniec's Brun–Titchmarsh constant `36/11`, a sieve theorem no roadmap
  plans; only their explicit Theorem 5 is a target (§2.4).
- The effective Chebotarev theorem under the generalised Riemann hypothesis for a general Galois
  extension (Bach–Sorenson's Theorem 5.1): §6.5 proves its rational instance for the characters
  modulo `q` directly from Dirichlet `L`-functions.

## Conventions

- `f = g + O*(h)` on a range means `|f(x) − g(x)| ≤ h(x)` for every `x` of the range. Every bound
  is stated in this form with its range; thresholds are written exactly as the source states them
  (`x > x₀` or `x ≥ x₀`), and every `Suggested.lean` statement is checked at its threshold.
- Real arguments throughout. `ψ(x) = ∑_{n ≤ x} Λ(n)` and `θ(x) = ∑_{p ≤ x} log p` are Mathlib's
  `Chebyshev.psi` and `Chebyshev.theta`, sums over `Finset.Ioc 0 ⌊x⌋₊`, inclusive at `x` and zero
  for `x < 2`. `π(x)` means `Nat.primeCounting ⌊x⌋₊`, inclusive at `x`.
- `Li x = TauCeti.Real.logIntegral x = ∫₂ˣ dt/log t`, so `Li 2 = 0`. `li x = Li x + li 2` with
  `li 2 = 1.04516…` the Cauchy principal value (Layer 0); `li` is used only where the source uses
  it (Schoenfeld, Büthe, Trudgian, Platt–Trudgian, Johnston–Yang, Fiori–Kadiri–Swidinsky).
- The `n`-th prime `p_n` (with `p_1 = 2`) is `Nat.nth Nat.Prime (n − 1)`; Mathlib's `nth` is
  zero-based (`Nat.nth_prime_zero_eq_two`). Every published statement about `p_n` is transported
  with this shift, and `Nat.primeCounting (Nat.nth Nat.Prime k) = k + 1` (Tau Ceti
  `primeCounting_nth_prime`) is the dictionary.
- Progressions: the modulus is `q : ℕ` and the residue `a : ZMod q`; `ψ(x; q, a)` is
  AnalyticNumberTheoryPartI's `psiAP q a x`, `π(x; q, a)` its `primeCountAP q a x`, `θ(x; q, a)` its
  theta sum. Coprimality of `a` and `q` is a hypothesis only where the source needs it. The sum
  `ψ̃(x; q, a) = ∑_{n ≤ x, n ≡ a (q)} Λ(n)/n` and the constants `C(q, a)` are defined in §0.2.
  Sources write `(x; k, l)` or `(x; a, q)`; this roadmap writes `(x; q, a)`.
- Zero-free regions. The *classical shape* with constant `R` is "`ζ(σ + it) ≠ 0` whenever `|t| ≥ 2`
  and `σ ≥ 1 − 1/(R log |t|)`"; the *Rosser–Schoenfeld shape* with constant `R` is "`ζ(σ + it) ≠ 0`
  whenever `|t| ≥ 21` and `σ ≥ 1 − 1/(R log(|t|/17))`". The classical shape with constant `R`
  implies the Rosser–Schoenfeld shape with the same `R` only for `|t|` large; each theorem names the
  shape it uses. Every published value of `R` (`9.645908801`, `6.455`, `5.70175`, `5.69693`,
  `5.573412`, `5.5666305`) is a parameter, never a theorem.
- `RH(H)` means: every zero `ρ` of `ζ` with `0 < Re ρ < 1` and `|Im ρ| ≤ H` has `Re ρ = 1/2`;
  `GRH(q, H)` the same for `L(s, χ)` and every character `χ` modulo `q`. Their library form is
  ExplicitZetaBounds's Layer 8 (a gap); `Suggested.lean` states them over Mathlib's `riemannZeta`
  and `DirichletCharacter.LFunction`, and §1.1 records that the two agree through ZerosOfLFunctions
  Layer 9.
- `N(T)` counts the zeros of `ζ` with `0 < Im ρ ≤ T` in the critical strip with multiplicity, as
  ZerosOfLFunctions §4.5; `N(σ, T)` those with `Re ρ ≥ σ`. `M(T) = (T/2π) log(T/2π) − T/2π + 7/8`.
- Euler's constant is Mathlib's `Real.eulerMascheroniConstant`; the Meissel–Mertens constant `B` is
  `TauCeti.mertensConstant ℚ`; their decimal values are propositions of §1.7, never asserted.
- A *table proposition* asserts that the general error function of a theorem, evaluated at the
  parameters of one row of a published table, is at most the row's value; a *finite-range
  proposition* asserts a stated inequality on a stated bounded range. Both are `Prop`s with their
  data in the statement.

## Exact supplier contracts

### From Mathlib

- `Chebyshev.psi`, `Chebyshev.theta` (sums over `Finset.Ioc 0 ⌊x⌋₊`), `Chebyshev.psi_nonneg`,
  `Chebyshev.theta_nonneg`, `Chebyshev.psi_mono`, `Chebyshev.theta_mono`,
  `Chebyshev.psi_eq_zero_of_lt_two`, `Chebyshev.theta_eq_zero_of_lt_two`, `Chebyshev.theta_le_psi`,
  `Chebyshev.psi_eq_psi_coe_floor`, `Chebyshev.theta_eq_theta_coe_floor`.
- `Chebyshev.psi_eq_theta_add_sum_theta`: for `x ≥ 2`, `ψ(x) = θ(x) + ∑_{n=2}^{⌊log x/log 2⌋} θ(x^{1/n})`.
- `Chebyshev.theta_le_log4_mul_x`: `θ(x) ≤ (log 4) x` for `x ≥ 0`; `Chebyshev.psi_le_const_mul_self`:
  `ψ(x) ≤ (log 4 + 4) x` for `x ≥ 0`; `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`:
  `|ψ(x) − θ(x)| ≤ 2 √x log x` for `x ≥ 1`.
- `Chebyshev.primeCounting_eq_theta_div_log_add_integral`: for `x ≥ 2`,
  `π(⌊x⌋₊) = θ(x)/log x + ∫₂ˣ θ(t)/(t log² t) dt`;
  `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`: `θ(x) = π(⌊x⌋₊) log x − ∫₂ˣ π(⌊t⌋₊)/t dt`;
  `Chebyshev.integrableOn_theta_div_id_mul_log_sq`.
- `Nat.primeCounting`, `Nat.primeCounting'`, `Nat.primeCounting'_nth_eq`, `Nat.prime_nth_prime`,
  `Nat.add_two_le_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Nat.nth_prime_one_eq_three`,
  `Nat.primesLE`, `Nat.mem_primesLE`; `Nat.exists_prime_lt_and_le_two_mul` (Bertrand).
- `ArithmeticFunction.vonMangoldt` (`Λ n = log (minFac n)` on prime powers, `0` elsewhere),
  `ArithmeticFunction.vonMangoldt_apply`, `ArithmeticFunction.vonMangoldt_nonneg`.
- `RiemannHypothesis` (every zero of `riemannZeta` that is neither a trivial zero nor `1` has real
  part `1/2`), `riemannZeta`, `DirichletCharacter.LFunction`, `analyticOrderNatAt`.
- `Real.eulerMascheroniConstant`, `Real.one_half_lt_eulerMascheroniConstant`,
  `Real.eulerMascheroniConstant_lt_two_thirds` (the only enclosure of `γ` in the pin);
  `Real.pi_gt_d6`, `Real.pi_lt_d6`, `Real.exp_one_gt_d9`, `Real.exp_one_lt_d9`, `Real.log_two_gt_d9`,
  `Real.log_two_lt_d9`; `sum_mul_eq_sub_sub_integral_mul` (Abel summation).

### From Tau Ceti

- `TauCeti.Real.logIntegral x = ∫₂ˣ (log t)⁻¹ dt`, `TauCeti.Real.logIntegral_two`,
  `TauCeti.Real.logIntegral_nonneg`, `TauCeti.Real.le_logIntegral`,
  `TauCeti.Real.logIntegral_eq_div_log_sub_add` (`Li x = x/log x − 2/log 2 + ∫₂ˣ dt/log² t` for
  `x ≥ 2`), `TauCeti.Real.logIntegral_isEquivalent_div_log`,
  `TauCeti.Real.intervalIntegrable_inv_log_pow`, `TauCeti.Real.intervalIntegrable_div_mul_log_sq`.
- `TauCeti.mertensConstant K` (the limit of `∑_{N𝔭 ≤ x} 1/N𝔭 − log log x`) with
  `TauCeti.tendsto_primeSummatory_inv_absNorm_sub_log_log` and
  `TauCeti.isBigO_primeSummatory_inv_absNorm_sub_log_log_sub_mertensConstant`; at `K = ℚ` the
  prime ideals of `𝓞 ℚ` correspond to the rational primes with norm `p`.
- `TauCeti.primeCount`, `TauCeti.primeTheta`, `TauCeti.primeCount_sub_mul_logIntegral_eq` (the
  number-field remainder identity, of which §0.4 is the rational instance),
  `TauCeti.primeCount_univ_isEquivalent_div_log`, and the prime number theorem in progressions
  `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`.
- `TauCeti.primeCounting_nth_prime` (`π(p_k) = k + 1` for `p_k = Nat.nth Nat.Prime k`),
  `TauCeti.primesLE_eq_image_nth`.

### From TauCetiRoadmap.ZerosOfLFunctions

- §4.1 `zeroCount`, §4.5 `N(T)` and the discreteness of the zero set; §6.2–6.4 the de la Vallée
  Poussin region with an existential constant and *IsExceptionalZero*; §7.4 the Riemann–von
  Mangoldt formula (inexplicit); §8.3 the truncated explicit formula `chebyshevPsi_explicitFormula`
  (with an inexplicit `O`), §8.4 the Weil explicit formula `riemannZeta_weilExplicitFormula` on
  the stated test class; §8.5 `primeIdealCount_effective` at `K = ℚ`; §8.7
  `primeCounting_progression_effective`; §8.9 the `Li` adapters; Layer 9 *AllOnCriticalLine*
  and the bridge of *GRH* at the `ζ` record to Mathlib's `RiemannHypothesis`.

### From TauCetiRoadmap.LFunctions

- Layer 4 `dirichletData` (the record of `L(s, χ)` with conductor, parity and functional equation),
  through ZerosOfLFunctions; Layer 7 `L(1, χ) ≠ 0`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.2 `psiAP q a x`, `primeCountAP q a x`, `theta_ap` with `theta_ap.level_one` and
  `theta_ap.sum_classes`; §0.3, §0.5, §0.8, §0.16, §0.19, §0.20, §0.25 and their finite-range
  inputs `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`, `ModEightFiniteInput`,
  `PrimeProductFiniteInput` (consumed by name in §0.6); §0.30 the rational Dirichlet-to-ray-class
  dictionary; §0.32 Siegel–Walfisz in the `ψ` form `siegel_walfisz`; §1.6 `DirichletGRH χ` and `GRH`;
  §1.9 `psi_sub_self_isBigO_of_riemannHypothesis` and `psiAP_isBigO_of_dirichletGRH` (consumed
  only as consistency checks).

### From TauCetiRoadmap.ComputationalNumberTheory

- §4.22 `platt_bounded_height`: for primitive `χ` of modulus `q ≤ 400 000`, every zero of
  `L(s, χ)` with `0 < Re s < 1` and `|Im s| ≤ H(q)`, `H(q) ≥ 10⁸/q`, has real part `1/2`; §4.24 no
  real zero in `(0, 1)` for conductor at most `400 000`; §4.17a explicit digamma remainders (a
  route to the enclosure of `γ` of §1.7, recorded there, not required).

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §3.1 `SieveDistribution.primeCountAP` (real `x`, modulus `q : ℕ`, residue `a : ℕ`, the
  congruence being equality at `q = 0`), for the agreement lemma of §0.6 only.

### From TauCetiRoadmap.EffectiveClassNumbers

- §4.4 the rational-prime counting adapter `TauCeti.primeCount ℚ Set.univ x = (Nat.primeCounting
  ⌊x⌋₊ : ℝ)`.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- §6.34 `dyadicPrimeCount` (the lower dyadic inequality), for the agreement recorded in §3.5.

### Gaps: what ExplicitZetaBounds must provide

The roadmap ExplicitZetaBounds is designed in parallel with this one and precedes it in the order
of supply. Each item below is cited as a gap (`gap:<slug>`) wherever a theorem needs it; the
general theorems of Layers 3, 6 and 7 take the corresponding object as an explicit parameter, so
only their instances wait for these items.

- `gap:rh-up-to-height` (ExplicitZetaBounds target 20, Layer 8): the proposition `RH(H)`, defined
  as *AllOnCriticalLine* of `zetaEntireCompletion` on `Icc 0 1 ×ℂ Icc (−H) H`, antitone in `H`,
  implied by `RiemannHypothesis`, and its named instances `RH(545 439 823)`,
  `RH(3.0610046·10¹⁰)`, `RH(3 000 175 332 800)`.
- `gap:grh-up-to-height` (target 20): the proposition `GRH(q, H)` for the characters modulo `q`,
  with `GRH(1, H) = RH(H)`, antitone in `H`, Rumely's instances (`GRH(q, 10 000)` for `q ≤ 13`;
  `GRH(q, 2500)` for `q ≤ 72`, composite `q ≤ 112` and the listed moduli up to 432), and the
  bridge from ComputationalNumberTheory §4.22 to `GRH(q, 10⁸/q)` for `q ≤ 400 000`.
- `gap:classical-zero-free-constants` (target 16): the classical-shape region for `ζ` with
  `R = 5.70175` (Kadiri), `5.573412` (Mossinghoff–Trudgian), `5.558691`
  (Mossinghoff–Trudgian–Yang), and the Rosser–Schoenfeld shape with `R = 9.645908801`; for
  `L(s, χ)`, the region `σ ≥ 1 − 1/(6.4355 log(q max(1, |t|)))` with its exceptional-zero clause,
  and `R₂ = 5.60` for `3 ≤ q ≤ 400 000`.
- `gap:vinogradov-korobov-constants` (target 17): the Vinogradov–Korobov region
  `σ ≥ 1 − 1/(A (log |t|)^{2/3} (log log |t|)^{1/3})` with an explicit `A` (Ford's `57.54`, `58`,
  `55.241`, `53.989`), itself a declared gap of that roadmap.
- `gap:explicit-zero-count-error` (target 8): `N(T) = M(T) + O*(a₁ log T + a₂ log log T + a₃)`
  with the published triples (Rosser's `0.137, 0.443, 1.588` for `T ≥ 2`; Trudgian's
  `0.112, 0.278, 2.510 + 1/(5T)`; the Hasanalizade–Shen–Wong triples) and, for `L(s, χ)`, the
  Bennett–Martin–O'Bryant–Rechnitzer count with error `0.22737 ℓ + 2 log(1 + ℓ) − 0.5`.
- `gap:explicit-zero-density` (target 19): Kadiri's `N(17/20, T) ≤ 0.5561 T + 0.7586 log T −
  268 658` for `T ≥ 3.061·10¹⁰`, Ramaré's two bounds, and Kadiri–Lumley–Ng's
  `N(0.9, T) ≤ 1.5 T^{4/15} log^{16/5} T + 3.2 log² T`.
- `gap:lehman-weighted-zero-sum` (target 10): Lehman's weighted sum over ordinates,
  `∑_{T₁ < γ ≤ T₂} φ(γ) = (1/2π) ∫ φ(t) log(t/2π) dt + O*(4 φ(T₁) log T₁ + 2 ∫ φ(t) dt/t)`.

### Gaps: what ExplicitCharacterSumsAndSieves must provide

- `gap:explicit-brun-titchmarsh` (ExplicitCharacterSumsAndSieves target 21): for `x, y > 0`, `k ≥ 1`,
  `ℓ` coprime to `k` and `y > k`, `π(x + y; k, ℓ) − π(x; k, ℓ) ≤ 2y/(φ(k) log(y/k))`.

## How to read the build

Layer 0 builds the carriers that the library lacks (`li`, `ψ̃`, `C(q, a)`) and the exact transfer
identities between `ψ`, `θ`, `π` and `Li`, so that every later bound for one of the four functions
converts into bounds for the others by a theorem rather than by a repeated argument. Layer 1 states
every computational input once: the bounded-height hypotheses, the finite-range verifications, the
tables of constants, the maximal prime-gap table and the two decimal enclosures. Layer 2 proves the
bounds that hold under the Riemann hypothesis and under the Riemann hypothesis to a height, from
the explicit formula. Layer 3 proves the general unconditional scheme in its three shapes (a region
alone; a region with a verified height and a zero-counting error; those with a zero density) and
specialises it to the published constants for `ψ` and `θ`, then transfers to `π`. Layers 4 and 5
derive sums over primes and bounds for the `n`-th prime by partial summation and inversion of the
Layer 3 bounds. Layer 6 repeats the scheme for a residue class modulo `q` with the zero data of the
characters as parameters, and Layer 7 derives the unconditional short-interval theorems from the
smoothed explicit formula and the Layer 3 bounds. Each layer ends with its examples and its
dependencies; a `*Needs:*` line lists what a statement and its route use, item by item.

## Layer 0: carriers and transfer identities

### 0.1 The unoffset logarithmic integral

Define *liTwo* as the Cauchy principal value `lim_{ε → 0⁺} (∫₀^{1−ε} dt/log t + ∫_{1+ε}^2 dt/log t)`,
and *li* `x = TauCeti.Real.logIntegral x + liTwo`. The limit exists because near `t = 1` the integrand
is `1/(t − 1) − 1/2 + O(t − 1)` and the two logarithmic divergences `log ε` cancel; the ordinary
Lebesgue integral `∫₀² dt/log t` does not exist.

- `li x − Li x = liTwo` for every real `x`, so every identity of §0.4 for `Li` holds for `li` with the
  constant shifted by `liTwo`; `li 2 = liTwo`.
- *li* is differentiable on `(1, ∞)` with derivative `1/log x`, and `li x → −∞` as `x → 1⁺`.
- `liTwo = γ + log log 2 + ∑_{n ≥ 1} (log 2)^n/(n · n!)`, by differentiating `u ↦ li(eᵘ)` and comparing
  with the exponential integral; the series converges absolutely (Deléglise–Nicolas use the same
  series, `deleglise-nicolas-2019-landau` lines 600–608).
- Under *EulerGammaEnclosure* (§1.7), `1.0451 < liTwo < 1.0452`.
- `li x − x/log x ∼ x/log² x` and `li x ∼ Li x ∼ x/log x` (ZerosOfLFunctions §8.9 for `Li`).

*Needs:* Tau Ceti `TauCeti.Real.logIntegral`, `TauCeti.Real.logIntegral_two`; Mathlib
`Real.eulerMascheroniConstant`, `intervalIntegral` calculus; ZerosOfLFunctions §8.9; §1.7.

**Checks.**

- From the pin's enclosure `1/2 < γ < 2/3` alone, the series gives `0.96 < liTwo < 1.14`: the
  first four terms are `0.6931 + 0.1201 + 0.0185 + 0.0024`, the tail is below `0.0003`, and
  `log log 2 = −0.3665`. In particular `liTwo ≠ 0`, so `li ≠ Li`: the offset normalisation
  `Li 2 = 0` is not `li`.
- `Li e = ∫₂ᵉ dt/log t` lies between `(e − 2)/1` and `(e − 2)/log 2`, so `li e` lies in
  `(1.76, 2.08)` once `1.045 < liTwo < 1.046`; the true value is `1.895`.
- `li 1.4 < 0 < li 2`: `Li 1.4 = −∫_{1.4}^2 dt/log t`, and the lower Riemann sum of `1/log t` on the
  three pieces `[1.4, 1.6]`, `[1.6, 1.8]`, `[1.8, 2]` is `0.2 · (2.128 + 1.701 + 1.443) = 1.054`,
  which exceeds `liTwo < 1.0452`; so `li` changes sign in `(1.4, 2)` (at Soldner's constant
  `1.4513…`, a value not asserted).
- A definition by the total interval integral `∫ t in 0..2, (log t)⁻¹` would return the junk value
  `0` for a non-integrable integrand and give `li = Li`; the principal value excludes it.

### 0.2 The logarithmic progression sum and its Mertens constant

Define *logPsiAP* `q a x = ∑_{n ∈ Ioc 0 ⌊x⌋₊, (n : ZMod q) = a} Λ(n)/n` for a modulus `q : ℕ`, a
residue `a : ZMod q` and real `x`: the sum `ψ̃(x; q, a)` of Ramaré and of Platt–Ramaré.

- *logPsiAP* `q a x = 0` for `x < 2`; it is monotone in `x` and nonnegative.
- Level one: *logPsiAP* `1 0 x = ∑_{n ≤ x} Λ(n)/n`; for `q ≥ 1` the sum over all `a : ZMod q` is
  *logPsiAP* `1 0 x`.
- Abel summation: for `x ≥ 1`, *logPsiAP* `q a x = ψ(x; q, a)/x + ∫₁ˣ ψ(t; q, a)/t² dt`, with
  `ψ(·; q, a) = psiAP q a` of AnalyticNumberTheoryPartI §0.2.

Define *mertensProgressionConstant* `q a`, written `C(q, a)`, as `limUnder atTop` of
`x ↦ logPsiAP q a x − log x/φ(q)`.

- Existence: for `q ≥ 1` and `a` a unit of `ZMod q`, the limit exists and equals
  `1/φ(q) + ∫₁^∞ (ψ(t; q, a) − t/φ(q))/t² dt`, the integral converging absolutely because
  Siegel–Walfisz (AnalyticNumberTheoryPartI §0.32, `ψ` form, at `A = 2` and fixed `q`) gives
  `ψ(t; q, a) − t/φ(q) = O(t/log² t)`. Hence for every `x ≥ 1`
  `logPsiAP q a x − log x/φ(q) − C(q, a) = E(x)/x − ∫ₓ^∞ E(t)/t² dt` with
  `E(t) = ψ(t; q, a) − t/φ(q)`: the exact transfer identity of §0.7.
- Closed form (Ramaré, `ramare-2002` lines 74–86, Corollaire 1): for `q ≥ 1` and `a` a unit,
  `C(q, a) = −(1/φ(q)) (γ + ∑_{p | q} log p/(p − 1) + ∑_{χ ≠ χ₀} conj χ(a) (L'/L)(1, χ))`, the
  last sum over the nonprincipal characters modulo `q`. Route: orthogonality of characters writes
  *logPsiAP* `q a x = φ(q)⁻¹ ∑_χ conj χ(a) ∑_{n ≤ x} χ(n) Λ(n)/n`; for `χ ≠ χ₀` the inner sum tends
  to `−(L'/L)(1, χ)` by Abel summation from `ψ(x, χ) = O(x exp(−c √log x))` (ZerosOfLFunctions
  §8.6 at `K = ℚ` through §0.30 of AnalyticNumberTheoryPartI) and the identity
  `−(L'/L)(s, χ) = s ∫₁^∞ ψ(t, χ) t^{−s−1} dt` on `Re s > 1` continued to `s = 1` by `L(1, χ) ≠ 0`;
  for `χ₀` the inner sum is `∑_{n ≤ x} Λ(n)/n − ∑_{p | q} ∑_{p^k ≤ x} log p/p^k`, and
  `∑_{n ≤ x} Λ(n)/n = log x − γ + o(1)` because `−ζ'/ζ(s) − s/(s − 1) = s ∫₁^∞ (ψ(t) − t) t^{−s−1} dt`
  tends to `−γ − 1` as `s → 1⁺` (the Laurent expansion `ζ(s) = 1/(s − 1) + γ + O(s − 1)`) while the
  integral tends to `∫₁^∞ (ψ(t) − t)/t² dt` by dominated convergence under
  `ψ(t) − t = O(t/log² t)` (ZerosOfLFunctions §8.5 at `K = ℚ`).
- The non-unit classes: for `a` not a unit, *logPsiAP* `q a x` is bounded in `x` (only prime powers
  dividing a power of `q` contribute), so no constant exists and the limit is junk; the existence
  theorem carries the unit hypothesis.

*Needs:* Mathlib `ArithmeticFunction.vonMangoldt`, `ZMod`, `DirichletCharacter.LFunction`,
`DirichletCharacter.sum_char_inv_mul_char_eq`, the Laurent coefficient of `riemannZeta` at `1`
(`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean`), `Real.eulerMascheroniConstant`, Abel summation
`sum_mul_eq_sub_sub_integral_mul`; AnalyticNumberTheoryPartI §0.2 `psiAP`, §0.30, §0.32;
ZerosOfLFunctions §§8.5, 8.6; LFunctions Layer 7 `L(1, χ) ≠ 0`.

**Checks.**

- `C(1, 0) = −γ`: the closed form has no prime factor and no nonprincipal character. A definition
  that forgot the `−1` of the Abel boundary term would give `1 − γ`.
- `C(2, 1) = −γ − log 2`: `φ(2) = 1`, the prime `2` contributes `log 2/(2 − 1)`, and there is no
  nonprincipal character. Directly, `∑_{n ≤ x, n odd} Λ(n)/n = ∑_{n ≤ x} Λ(n)/n − ∑_{2^k ≤ x} log 2/2^k`
  and the subtracted sum tends to `log 2 · ∑_{k ≥ 1} 2^{−k} = log 2`.
- `C(4, 3) − C(4, 1) = (L'/L)(1, χ₄)` for the nontrivial character `χ₄` modulo `4`: in the closed
  form the character sum is `−(1/2)(χ₄(3) − χ₄(1)) (L'/L)(1, χ₄) = (L'/L)(1, χ₄)`. A definition
  through the full sum `∑_{n ≤ x} Λ(n)/n` would make the two classes equal. Also
  `C(4, 1) + C(4, 3) = −γ − log 2 = C(2, 1)`, since the odd integers are the union of the two classes.
- For `q = 2`, `a = 0`: *logPsiAP* `2 0 x = ∑_{2^k ≤ x} log 2/2^k ≤ log 2`, so
  `logPsiAP 2 0 x − log x/φ(2) → −∞`; the unit hypothesis of the existence theorem cannot be dropped.

### 0.3 The difference ψ − θ

For `x ≥ 2`, `ψ(x) − θ(x) = ∑_{k=2}^{K} θ(x^{1/k})` with `K = ⌊log x/log 2⌋`
(`Chebyshev.psi_eq_theta_add_sum_theta`); the terms with `k ≥ 3` are at most `(K − 2)⁺ · θ(x^{1/3})`.

- Unconditional bound: for `x ≥ 1`, `0 ≤ ψ(x) − θ(x) ≤ (log 4)(√x + (log x/log 2 − 2)⁺ x^{1/3})`,
  from `Chebyshev.theta_le_log4_mul_x` termwise (`schoenfeld-1976` line 672 displays the same
  decomposition).
- Transfer from a `θ`-bound: let `c ≥ 0` with `θ(y) ≤ c y` for all `y > 0`, and `y₀ ≥ 1`, `ε ≥ 0`
  with `|θ(y) − y| ≤ ε y` for all `y ≥ y₀`. Then for every `x ≥ max(4, y₀²)`,
  `(1 − ε)√x ≤ ψ(x) − θ(x) ≤ (1 + ε)√x + c (log x/log 2 − 2) x^{1/3}`.
  The lower bound uses only the lower `θ`-bound at `√x ≥ y₀`.
- Consequently, from a `ψ`-bound `|ψ(y) − y| ≤ ε(y) y` on `[y₀, ∞)` one gets
  `|θ(x) − x| ≤ ε(x) x + (log 4)(√x + (log x/log 2 − 2)⁺ x^{1/3})` for `x ≥ y₀`, and from a `θ`-bound
  the corresponding `ψ`-bound with the same correction; these are the conversions used throughout.

*Needs:* Mathlib `Chebyshev.psi_eq_theta_add_sum_theta`, `Chebyshev.theta_le_log4_mul_x`,
`Chebyshev.theta_nonneg`, `Chebyshev.theta_mono`.

**Checks.**

- `x = 8`: `K = 3`, `ψ(8) − θ(8) = Λ(4) + Λ(8) = 2 log 2`, and `θ(√8) + θ(8^{1/3}) = θ(2.83) + θ(2)
  = 2 log 2`. Keeping only `θ(√x)` gives `log 2`, so the terms `k ≥ 3` are needed.
- `x = 121`: `ψ(121) − θ(121) = θ(11) + θ(4.95) + θ(3.32) + θ(2.61) + θ(2.22) + θ(1.98)
  = log 2310 + log 6 + log 6 + log 2 + log 2 + 0 = log 332 640 = 12.715`; the unconditional bound
  gives `1.3863 · (11 + 4.918 · 4.946) = 48.98`.
- `x = 120.9`: now `√x < 11` and `ψ(x) − θ(x) = log 210 + log 6 + log 6 + log 2 + log 2 = log 30 240
  = 10.317`, while `0.998697 √x = 10.98`: the lower bound `(1 − ε)√x` with `ε = 0.001303` fails at
  `x = 120.9` although it holds at `x = 121` (`12.715 ≥ 10.986`). The transfer theorem asks
  `x ≥ y₀²` with `y₀` the threshold of the `θ`-bound; Schoenfeld's threshold `x > 121` for his
  (5.4*) comes from a separate finite check (§3.2), not from this transfer.
- `x = 3`: `K = 1`, the sum is empty and `ψ(3) = θ(3) = log 6`; the bound `(log 4)(√3 + 0)` is
  `2.40 ≥ 0`.

### 0.4 The exact remainder between π and Li

For `x ≥ 2`,

```text
π(x) − Li x = (θ(x) − x)/log x + ∫₂ˣ (θ(t) − t)/(t log² t) dt + 2/log 2,
```

from `Chebyshev.primeCounting_eq_theta_div_log_add_integral` and
`TauCeti.Real.logIntegral_eq_div_log_sub_add`, the latter supplying
`Li x = x/log x − 2/log 2 + ∫₂ˣ dt/log² t`; the identity is the rational instance (`δ = 1`) of Tau
Ceti's `primeCount_sub_mul_logIntegral_eq` after the adapter of EffectiveClassNumbers §4.4.
The reverse direction is Mathlib's `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`.

- Difference form: for `2 ≤ x₀ ≤ x`,
  `(π(x) − Li x) − (π(x₀) − Li x₀) = (θ(x) − x)/log x − (θ(x₀) − x₀)/log x₀ + ∫_{x₀}^x (θ(t) − t)/(t log² t) dt`.
- Transfer of a `θ`-bound to `π`: if `|θ(t) − t| ≤ t ε(t)` for all `t ∈ [x₀, x]`, then
  `|π(x) − Li x| ≤ |π(x₀) − Li x₀| + x ε(x)/log x + x₀ ε(x₀)/log x₀ + ∫_{x₀}^x ε(t)/log² t dt`,
  and the same with `li` on both sides.
- For constant `ε(t) = ε`, `∫_{x₀}^x ε/log² t dt = ε (Li x − x/log x − Li x₀ + x₀/log x₀)`.

*Needs:* Mathlib `Chebyshev.primeCounting_eq_theta_div_log_add_integral`,
`Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`,
`Chebyshev.integrableOn_theta_div_id_mul_log_sq`; Tau Ceti `TauCeti.Real.logIntegral_eq_div_log_sub_add`,
`TauCeti.Real.intervalIntegrable_div_mul_log_sq`; §0.1 for the `li` form.

**Checks.**

- `x = 2`: `π(2) = 1`, `Li 2 = 0`, and the right side is `(log 2 − 2)/log 2 + 0 + 2/log 2 = 1`.
- `x = 3`: `π(3) = 2`; `θ(t) = log 2` on `[2, 3)`, `θ(3) = log 6`; the right side is
  `(log 6 − 3)/log 3 + log 2 (1/log 2 − 1/log 3) − ∫₂³ dt/log² t + 2/log 2 + Li 3
  = −1.0998 + 0.3691 − 1.279 + 2.8854 + 1.1184 = 1.994` (Simpson's rule on the two integrals;
  the exact value is `2`).
- Dropping the constant `2/log 2 = 2.885` (a plausible wrong identity) fails already at `x = 2`.
- With `li` in place of `Li` the constant becomes `2/log 2 − liTwo = 1.840`.

### 0.5 From a ψ-bound to θ- and π-bounds with an explicit error function

Let `y₀ ≥ 2` and `ε : ℝ → ℝ` with `|ψ(y) − y| ≤ ε(y) y` for all `y ≥ y₀`. Then

- for `x ≥ y₀`, `|θ(x) − x| ≤ (ε(x) + (log 4)(x^{−1/2} + (log x/log 2 − 2)⁺ x^{−2/3})) x`, and, when a
  bound `θ(y) ≤ c y` for all `y > 0` is available, `log 4` may be replaced by `c` (§0.3);
- for `x ≥ x₀ ≥ y₀`, `|π(x) − Li x| ≤ |π(x₀) − Li x₀| + x ε₁(x)/log x + x₀ ε₁(x₀)/log x₀ +
  ∫_{x₀}^x ε₁(t)/log² t dt` with `ε₁` the `θ`-error of the previous item (§0.4).

This is the scheme of Rosser–Schoenfeld's Theorem 11 (`rosser-schoenfeld-1962` lines 334–343) and
Schoenfeld's Theorem 11 (`schoenfeld-1976` lines 201–206), stated for an arbitrary error function.

*Needs:* §0.3, §0.4.

**Checks.**

- Schoenfeld's `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}`, `X = √(log x/R)`, `R = 9.645908801`: at
  `x = e¹⁰⁰`, `X = 3.2197`, `√(8/(17π)) = 0.38703`, `X^{1/2} = 1.7944`, `e^{−X} = 0.03999`, so
  `ε₀(e¹⁰⁰) = 0.02777`; `ε₀` is decreasing in `x` for `X > 1/2`, that is `x > e^{R/4} = 11.2`.
- With `ε ≡ 0` (the hypothetical `ψ = x` on `[y₀, ∞)`) the `θ`-error is `(log 4) x^{−1/2}` plus the
  cube-root term, not `0`: the prime powers are a genuine correction.
- The `π` transfer at `x₀ = x` reduces to `|π(x) − Li x| ≤ |π(x) − Li x| + 2 x ε₁(x)/log x`, a
  tautology; the content is in `x₀ < x`.

### 0.6 Agreement lemmas and the bridges to AnalyticNumberTheoryPartI

- `psiAP 1 0 x = ψ(x)` and `theta_ap.level_one`; for `q ≥ 1` and `a : ZMod q`,
  `primeCountAP q a x = SieveDistribution.primeCountAP x q a.val` (SieveMethodsAndPrimePatterns
  §3.1 counts `p ≤ ⌊x⌋` with `p ≡ a.val (mod q)`); for `a` a unit, *rayClassPsi* of
  ZerosOfLFunctions §8.7 at `K = ℚ`, `𝔪 = (q)∞` and the class of `a` equals `psiAP q a x`, since
  every `n ≡ a (mod q)` is then prime to `q`.
- *SchoenfeldFiniteRangeInput* (AnalyticNumberTheoryPartI §0.3: `θ(x) < 1.000081 x` for
  `0 < x < exp 10000`) follows from §3.2's unconditional `θ(x) < 1.000081 x` for all `x > 0`, under
  that theorem's hypotheses (`RH(545 439 823)`, *Schoenfeld1976Range*, *ButheVerified*, the table
  propositions it names).
- *RosserSchoenfeldFiniteRangeInput* (§0.5 there: the pair of strict inequalities for
  `59 ≤ x < exp 10000`) follows from §3.5's Rosser–Schoenfeld Theorem 1 under its hypotheses.
- *PrimeProductFiniteInput* (§0.25 there: `∑_{p ≤ x} 1/p ≤ log log x + 0.27 + 5/log x` for
  `10⁸ ≤ x < exp 10000`) follows from §0.19 there (`|∑_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)`
  for `x ≥ 286`) and *MeisselMertensEnclosure* (§1.7, `B < 0.2615`), since
  `0.2615 + 1/(2 log² 10⁸) < 0.27`.
- The theta clause of *ModEightFiniteInput* (§0.16 there: `|θ(x; 8, a) − x/4| ≤ 0.002811 x/4` for
  `a ∈ {3, 5}` and `10¹⁰ ≤ x < exp 10000`) follows from §6.1 at the row `(k, ε, x₀) = (8, 0.002811, 10¹⁰)`
  of Ramaré–Rumely's Table 1 (`ramare-rumely-1996` line 1385), under `GRH(8, 10 000)` and the
  table proposition *RamareRumelyTable1*.

*Needs:* AnalyticNumberTheoryPartI §§0.2, 0.3, 0.5, 0.16, 0.19, 0.25; SieveMethodsAndPrimePatterns
§3.1; ZerosOfLFunctions §8.7; EffectiveClassNumbers §4.4; §§1.7, 3.2, 3.5, 6.1.

**Checks.**

- `primeCountAP 4 3 3 = 1 = SieveDistribution.primeCountAP 3 4 3`; at `q = 0` the sieve carrier
  compares by equality and the `ZMod 0` carrier by equality in `ℤ`, so the two agree there too,
  but the agreement lemma is stated for `q ≥ 1`.
- `0.2615 + 1/(2 · 18.42²) = 0.2615 + 0.0015 = 0.2630 < 0.27`, with `log 10⁸ = 18.42`.
- At `q = 2`, `a = 0`, `psiAP 2 0 x = ∑_{2^k ≤ x} log 2 ≠ rayClassPsi`, which is `0` for a non-unit
  class: the ray-class agreement needs the unit hypothesis.

### 0.7 The exact transfer for the logarithmic progression sum

For `q ≥ 1`, `a` a unit of `ZMod q`, and `x ≥ 1`, with `E(t) = ψ(t; q, a) − t/φ(q)`,

```text
logPsiAP q a x − log x/φ(q) − C(q, a) − E(x)/x = −∫ₓ^∞ E(t)/t² dt,
```

and hence, if `|E(t)| ≤ ε(t) t/φ(q)` for all `t ≥ x`, then
`|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ |E(x)|/x + φ(q)⁻¹ ∫ₓ^∞ ε(t)/t dt`. At `q = 1` this is
the transfer from `ψ` to `∑_{n ≤ x} Λ(n)/n` used in §4.2.

*Needs:* §0.2 (existence of `C(q, a)` and the Abel identity).

**Checks.**

- With Ramaré–Rumely's row `(k, ε, x₀) = (1, 0.000213, 10¹⁰)` (`ramare-rumely-1996` line 67) the
  tail bound at `x = 10¹⁰` is `0.000213 · ∫_{10¹⁰}^∞ dt/t`, which diverges: a constant `ε` says
  nothing about the tail, and the instances of §4.2 use error functions that decay at least like
  `1/log² t`.
- With `ε(t) = η/log² t` on `[x, ∞)`, `∫ₓ^∞ ε(t)/t dt = η/log x`.
- The identity at `x = 1`: `logPsiAP q a 1 = 0`, `E(1) = −1/φ(q)` for a unit class, and
  `C(q, a) = 1/φ(q) + ∫₁^∞ E/t²`, so both sides equal `−∫₁^∞ E(t)/t² dt`.

### Examples

- `liTwo = 1.0451637…`, `li e = 1.8951…`, `li 10 = 6.1656…` (consistent with `π(10) = 4`).
- `C(1, 0) = −γ = −0.5772…`, `C(2, 1) = −γ − log 2 = −1.2704…`.
- `ψ(113)/113 = 1.03882…`: `θ(113) = 107.069` and the prime powers `4, 8, 16, 32, 64, 9, 27, 81,
  25, 49` add `10.317`.

### Dependencies

Mathlib `Chebyshev`, `Nat.primeCounting`, `ArithmeticFunction.vonMangoldt`, Abel summation; Tau
Ceti `TauCeti.Real.logIntegral` and `mertensConstant`; AnalyticNumberTheoryPartI §§0.2, 0.3, 0.5,
0.16, 0.19, 0.25, 0.30, 0.32; ZerosOfLFunctions §§8.5–8.7, 8.9; SieveMethodsAndPrimePatterns §3.1;
EffectiveClassNumbers §4.4; Layer 1 (§1.7) and Layers 3, 6 for the bridges of §0.6.

## Layer 1: hypotheses

Every proposition of this layer is a `Prop` with its data in the statement. None is proved here;
each theorem that uses one carries it as an explicit hypothesis. The propositions of §§1.1–1.2 are
the `Suggested.lean` forms of the bounded-height hypotheses whose library forms are
ExplicitZetaBounds Layer 8 (`gap:rh-up-to-height`, `gap:grh-up-to-height`); the roadmap's theorems
are stated against the library forms once they exist, and §1.1 records the agreement.

### 1.1 The Riemann hypothesis to a height

Define *RiemannHypothesisUpTo* `H`, written `RH(H)`, for real `H`, as: every `s : ℂ` with
`riemannZeta s = 0`, `0 < Re s < 1` and `|Im s| ≤ H` has `Re s = 1/2`.

- Antitone: `RH(H)` implies `RH(H')` for `H' ≤ H`.
- `RiemannHypothesis` implies `RH(H)` for every `H`; conversely `∀ H, RH(H)` implies
  `RiemannHypothesis`, because every zero of `riemannZeta` that is neither trivial nor `s = 1` lies
  in the open strip (`riemannZeta_ne_zero_of_one_le_re` on the right, the functional equation on
  the left).
- Agreement with the library form: `RH(H)` holds iff *AllOnCriticalLine* `zetaEntireCompletion
  univ (Icc 0 1 ×ℂ Icc (−H) H)` (ZerosOfLFunctions Layer 9), since a point of positive divisor of
  the entire completion in the closed rectangle is a zero of `riemannZeta` in the open strip (the
  edges `Re s ∈ {0, 1}` carry no zero).
- The named instances, each the conclusion of a published computation and each a hypothesis in
  this roadmap: `RH(545 439 823)` (`van-de-lune-te-riele-winter-1986` lines 13–14, the first
  `1 500 000 001` zeros, up to ordinate `545 439 823.215`); `RH(30 610 046 000)` (`platt-2017`
  lines 485–486, Theorem 5.1); `RH(3 000 175 332 800)` (`platt-trudgian-2021-rh` lines 48–49,
  Theorem 1). Each implies the earlier ones by antitonicity, and implies every lower height a
  paper used (Lehmer's, Rosser–Yohe–Schoenfeld's `1 894 438.5`, Wedeniwski's `3.3·10⁹`, Gourdon's
  `2.445·10¹²`, Büthe's `10¹¹`).

*Needs:* Mathlib `riemannZeta`, `RiemannHypothesis`, `riemannZeta_ne_zero_of_one_le_re`;
ZerosOfLFunctions Layer 0 `zetaEntireCompletion`, Layer 9 *AllOnCriticalLine*; `gap:rh-up-to-height`.

**Checks.**

- `RH(0)` is not vacuous: it says that `ζ` has no real zero in `(0, 1)`, which is true. A definition
  with the strict inequality `|Im s| < H` would make `RH(0)` vacuous.
- `RH(14)` holds because the first zero has ordinate `14.1347…`, while `RH(15)` is the statement
  that this first zero (and no other below height `15`) lies on the line.
- A definition quantifying over every zero of `riemannZeta`, trivial zeros included, is false for
  every `H ≥ 0`: `riemannZeta (−2) = 0` and `Re(−2) ≠ 1/2`. The strip condition excludes them.
- `RH(545 439 823)` and `RH(3·10¹²)` are consistent with each other (antitonicity) and each is
  implied by `RiemannHypothesis`; none of the three instances implies `RiemannHypothesis`.

### 1.2 The generalised Riemann hypothesis to a height

Define *DirichletGRHUpTo* `q H`, written `GRH(q, H)`, for `q : ℕ` with `q ≥ 1` and real `H`, as:
for every Dirichlet character `χ` modulo `q` and every `s` with `DirichletCharacter.LFunction χ s = 0`,
`0 < Re s < 1` and `|Im s| ≤ H`, one has `Re s = 1/2`.

- `GRH(1, H) ↔ RH(H)`; antitone in `H`; `GRH(q, H)` implies `GRH(f, H)` for every `f ∣ q`, since a
  character modulo `f` lifts to a character modulo `q` with the same zeros in the open strip (the
  deleted Euler factors vanish only on `Re s = 0`).
- `DirichletGRH χ` for every `χ` modulo `q` (AnalyticNumberTheoryPartI §1.6) implies `GRH(q, H)` for
  every `H`, and `∀ H, GRH(q, H)` implies `DirichletGRH χ` for every `χ` modulo `q`.
- Bridge from ComputationalNumberTheory §4.22: for `q ≤ 400 000`, `GRH(q, 10⁸/q)`; each `χ` modulo
  `q` is induced by a primitive `χ₀` of conductor `f ∣ q`, `platt_bounded_height` applies to `χ₀`
  with `H(f) ≥ 10⁸/f ≥ 10⁸/q`, and the strip zeros of `χ` and `χ₀` coincide.
- Rumely's instances (`rumely-1993` lines 29–32): `GRH(q, 10 000)` for `q ≤ 13`; `GRH(q, 2500)` for
  `q ≤ 72`, for composite `q ≤ 112`, and for the further moduli of Rumely's list, which this roadmap
  records as the list printed in `ramare-2002` lines 155–159; Rumely's statement is for primitive
  characters, and the lifting law extends it to all characters modulo `q` once every conductor
  dividing `q` is covered, which holds for `q ≤ 72` and composite `q ≤ 112` because their divisors
  are at most `72` or composite at most `112` or prime at most `72`.

*Needs:* Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.IsPrimitive`;
AnalyticNumberTheoryPartI §1.6; ComputationalNumberTheory §4.22; `gap:grh-up-to-height`.

**Checks.**

- The principal character modulo `2` has `L(s, χ₀) = (1 − 2^{−s}) ζ(s)`, which vanishes at
  `s = 2πi/log 2` with real part `0`; `GRH(2, 10)` ignores it because of the strict `0 < Re s`.
- `GRH(1, H)` is `RH(H)` by `DirichletCharacter.LFunction` of the trivial character modulo `1`
  being `riemannZeta`.
- For `q = 8`, `GRH(8, 10 000)` is the bounded-zero clause of *ModEightFiniteInput*
  (AnalyticNumberTheoryPartI §0.16): the primitive conductors dividing `8` are `1, 4, 8`.
- A definition over all `s` with `L(s, χ) = 0` would be refuted by the trivial zeros at the
  nonpositive integers of the appropriate parity.

### 1.3 Finite-range verifications for the Chebyshev functions

One proposition per published computation, each stating the inequality the paper checked on the
range it checked.

- *ButheVerified* (`buthe-2018` lines 73–85, Theorem 2): `|ψ(x) − x| ≤ 0.94 √x` for
  `11 < x ≤ 10¹⁹`; `x − θ(x) ≤ 1.95 √x` for `1423 ≤ x ≤ 10¹⁹`; `x − θ(x) > 0.05 √x` for
  `1 ≤ x ≤ 10¹⁹`; `0 < li x − π(x) ≤ (√x/log x)(1.95 + 3.9/log x + 19.5/log² x)` for `2 ≤ x ≤ 10¹⁹`.
  The paper obtained these with the zeros of `ζ` up to height `10¹¹`; the proposition records the
  inequalities.
- *RosserSchoenfeld1962Range* (`rosser-schoenfeld-1962` lines 213–216, Lehmer's table of primes to
  `10 006 721`): the inequalities of Theorems 1–4, 9, 11 and Corollaries 1–3 of §§3.2, 3.5 hold for
  every real `x ≤ 10⁷` of their ranges, and those of Theorem 3 for every `p_n ≤ 10⁷`.
- *Schoenfeld1976Range* (`schoenfeld-1976` lines 96, 113–118, 1293): `θ(x) < 1.000081 x` and
  `(5.1*)–(5.4*)` of Theorem 6* for `0 < x ≤ 10⁸`; the inequalities of Theorem 10 for
  `73.2 < x ≤ 1075` and of Corollary 1 for `2657 < x ≤ 5·10⁷`; the interval of Theorem 12 for
  `2 010 759.9 < x ≤ 10⁸`.
- *DusartThesisRange* (`dusart-1998-thesis` lines 863–864, 924–925, 1279; `dusart-1999-mc` line
  118): `|θ(x) − x| ≤ 0.006788 x/log x` for `10 544 111 < x ≤ e²²`; `|θ(x) − x| ≤ 0.2 x/log² x` for
  `3 594 641 < x ≤ 1.04·10⁷` and `≤ 3.9648085 x/log² x` for `1 < x ≤ 1.04·10⁷`; the `π` bounds of
  Théorème 1.10 for `x ≤ 10⁸`; `p_k ≥ k(log k + log log k − 1)` for `3 ≤ p_k ≤ 10¹¹` (Robin's range)
  and `p_k ≤ k(log k + log log k − 0.9484)` for `39 017 ≤ k ≤ 170 367`.
- *Dusart2018Range* (`dusart-2018`, uncertified, cited by its Theorem 4.2 as quoted in
  `deleglise-nicolas-2019-landau` lines 387–388): `|θ(x) − x| ≤ x/log³ x` for `89 967 803 ≤ x ≤ 10¹⁹`
  and `≤ 0.5 x/log³ x` for `767 135 587 ≤ x ≤ 10¹⁹`.
- *TrudgianRange*, *PlattTrudgianRange*, *JohnstonYangRange*, *FaberKadiriRange*: for each of
  §3.4's theorems, the stated inequality on `[2, e^{X}]` with `X` the smallest row of the paper's
  table (`trudgian-2016`: `x < e³⁵`; `platt-trudgian-2021-error`: `log x < 1000`;
  `johnston-yang-2023`: `log x < X₁` for the first row of its Table 1; `faber-kadiri-2015`: `x < e²⁰`).

*Needs:* the carriers of Layer 0.

**Checks.**

- `ψ(113)/113 = 1.03882…`, `θ(113)/113 = 0.9475` (§0 Examples): *RosserSchoenfeld1962Range* is
  consistent with `ψ(x) < 1.03883 x` attaining its supremum ratio at `113`.
- *ButheVerified* at `x = 10⁴`: `π(10⁴) = 1229`, `li 10⁴ = 1246.14`, so `li − π = 17.1`, within
  `(100/9.21)(1.95 + 0.42 + 0.23) = 28.2`; at `x = 10⁹`: `π = 50 847 534`, `li = 50 849 235`,
  difference `1701` within `(31 623/20.72)(1.95 + 0.19 + 0.05) = 3341`.
- *ButheVerified* is consistent with §0.3: for `x > 121`, `x − θ(x) = (x − ψ(x)) + (ψ(x) − θ(x))
  ≥ −0.94 √x + 0.998697 √x = 0.0587 √x > 0.05 √x`.
- `x = 10 544 111` is a prime and the threshold of Dusart's `θ` bound; the proposition includes
  the open range above it, as the source states it.

### 1.4 The maximal prime-gap table

Define *MaximalPrimeGapTable* as: for the list of record pairs `(P_i, g_i)` of
`oliveira-e-silva-herzog-pardi-2014` Table 8 (lines 1795–1821; the last row is
`P = 1 425 172 824 437 699 411`, `g = 1476`), every prime `p < 4·10¹⁸` with next prime `p⁺` has
`p⁺ − p ≤ 1476`, and for every row every prime `p < P_i` has `p⁺ − p < g_i`.

- Consequence (`carneiro-milinovich-soundararajan-2019` lines 269–273, (1.15)): `p⁺ − p < log² p`
  for every prime `11 ≤ p ≤ 4·10¹⁸`. Between consecutive rows the gap is below `g_{i+1}` and
  `log² p ≥ log² P_i`, so the finite check `g_{i+1} ≤ log² P_i` over the rows suffices; below the
  first rows it is the list of small primes.
- Nicely's search to `10¹⁵` (`nicely-1999` lines 11–14, 182) is the initial segment of the same
  table, with largest gap `906` after `218 209 405 436 543`.

*Needs:* Mathlib `Nat.nth Nat.Prime`, `Nat.prime_nth_prime`.

**Checks.**

- `p = 7`: the gap to `11` is `4 ≥ log² 7 = 3.79`, so the bound `p⁺ − p < log² p` fails at `7`; the
  threshold `11` is sharp.
- `p = 113`: gap `14 < log² 113 = 22.4`; `p = 1327`: gap `34 < 51.7`; last row: `1476 < log²
  (1.425·10¹⁸) = 41.80² = 1747`.
- The row `(1 693 182 318 746 371, 1132)`: `1132 < log² P = 35.07² = 1230`, the tightest ratio of the
  table (`0.92`).

### 1.5 Progression tabulations

- *RamareRumelyTabulation* (`ramare-rumely-1996` lines 77–84, Theorem 2): for every modulus `k` of
  Ramaré–Rumely's Table 1, every `l` prime to `k`, and `1 ≤ x ≤ 10¹⁰`:
  `max_{1 ≤ y ≤ x} |θ(y; k, l) − y/φ(k)| ≤ 2.072 √x` and `max_{1 ≤ y ≤ x} |ψ(y; k, l) − y/φ(k)| ≤ 1.745 √x`.
- *Ramare2002Tabulation* (`ramare-2002` lines 161–168, Théorème 2): for every `q` in Rumely's
  list, `max_{1 ≤ L ≤ 10⁵} max_{a unit} √L |logPsiAP q a L − log L/φ(q) − C(q, a)| ≤ 1`.

*Needs:* AnalyticNumberTheoryPartI §0.2; §0.2.

**Checks.**

- At `k = 1` the first tabulation says `|ψ(y) − y| ≤ 1.745 √x` for `y ≤ x ≤ 10¹⁰`, weaker than
  *ButheVerified* (`0.94 √x`) and consistent with it.
- At `q = 6`, `a = 1`, `L = 1`: `logPsiAP 6 1 1 = 0`, `log 1 = 0`, so the second tabulation asserts
  `|C(6, 1)| ≤ 1`; Ramaré's Corollaire 5 (lines 181–187) records the value `0.978…` attained there.
- The second tabulation at `q = 1` is not asserted (`1` is not in Rumely's list); at `q = 1` the
  analogue would be `√L |∑_{n ≤ L} Λ(n)/n − log L + γ| ≤ 1`, consistent with Ramaré's `1.31/√x`
  of §4.2.

### 1.6 Tables of constants

Each proposition below asserts that the explicit error function of the general theorem it belongs
to, evaluated at the parameters of one row of the published table, is at most the row's value, for
every row of the table. The rows are data in the statement.

- *DusartThesisTable* (`dusart-1998-thesis` lines 847–852, Table 1.1): the rows
  `(b, ε) = (22, 2.78652·10⁻⁴), (23, 1.8436·10⁻⁴), (30, 0.978·10⁻⁵), (600, 0.75·10⁻⁷),
  (2000, 1.64·10⁻³ log-relative)`, meaning `|ψ(x) − x| ≤ ε x` for `x > e^b`, as instances of §3.1(b)
  with `H = 545 439 823.215` and `R = 9.645908801`.
- *Dusart1999Row* (`dusart-1999-mc` lines 102–108, Theorem 2): `b = 50`, `δ = 0.947265625·10⁻⁸`,
  `m = 18`, `ε = 0.905·10⁻⁷`, with the same `H` and `R`.
- *FaberKadiriTable* (`faber-kadiri-2018-corrigendum` lines 96–98, Table 1, with Platt's
  `H = 30 610 046 000`): the rows `b₀ ↦ ε₀`, in particular `(20, 5.3688·10⁻⁴)`.
- *PlattTrudgianTable* (`platt-trudgian-2021-error` lines 81–92, Table 1, `R = 5.573412`): the rows
  `(X, σ, A, B, C, ε₀)`, in particular `(1000, 0.98, 461.9, 1.52, 1.89, 1.20·10⁻⁵)` and
  `(10 000, 0.99, 535.4, 1.51, 1.94, 6.78·10⁻²⁹)`.
- *JohnstonYangTable* (`johnston-yang-2023` line 59, Table 1): the rows `(X, A, B, C, ε₀)` of
  Theorem 1.1's second form.
- *TrudgianRow* (`trudgian-2016` lines 60–73): the Rosser–Schoenfeld-shape region with `R = 6.455`
  for `|t| ≥ 24`, derived from the classical shape with `R₀ = 5.69693` and `RH(3.0610046·10¹⁰)`, and
  the resulting `ε₀` of Theorem 1.
- *RamareRumelyTable1* (`ramare-rumely-1996` lines 58–74 and line 1385, Table 1): the rows
  `(k, ε, x₀)`, in particular `(1, 0.000213, 10¹⁰)`, `(8, 0.002811, 10¹⁰)`, and the uniform rows
  `k ≤ 13: (0.004560, 10¹⁰)`, `k ≤ 72: (0.023269, 10¹⁰)`.
- *Dusart2002Table* (`dusart-2002` lines 989–1012, Theorem 5 and its table): the rows `(k, ε, x₀)`.
- *BMORTables* (`bennett-martin-obryant-rechnitzer-2018` lines 165–167): for `3 ≤ q ≤ 10⁵`, the
  per-modulus constants `c_ψ(q), c_θ(q), c_π(q), x_ψ(q), x_θ(q), x_π(q)`, each at most the uniform
  `c₀(q)`, `x₀(q)` of §6.3.
- *Kadiri2008Table* (`kadiri-2008` lines 140–162, Table 1): the values `α(q₀, ε)`.
- *KadiriLumleyTable* (`kadiri-lumley-2014` lines 28–29 and Table 2): `x₀ ↦ Δ`, in particular
  `(e⁵⁹, 1 946 282 821)` (line 36) and `(4·10¹⁸, 1 966 196 911)` (line 52).
- *CullyHugillLeeTable* (`cully-hugill-lee-2022` lines 75–88, Theorem 1 and Tables 1–2, as corrected
  by `cully-hugill-lee-2024`): `log x₀ ↦ Δ`, in particular `(60, 7.69·10¹⁰)`, `(150, 2.07·10¹¹)`.
- *TrevinoTables* (`trevino-2012` lines 471–480 and 493–496): Table 1 `(a, c₁, c₂)` and Table 2
  `(a, k₁, k₂, C)`.
- *BroadbentRow* (`fiori-kadiri-swidinsky-2023` lines 151–154, quoting Broadbent, Kadiri, Lumley,
  Ng and Wilk): with `R = 5.5666305`, the admissible asymptotic bound for `ψ` with
  `(A_ψ, B, C, x₀) = (121.096, 3/2, 2, 2)`, in the shape of §3.1(c).

*Needs:* the general theorems of §§3.1, 4.5, 6.1, 6.3, 6.6, 7.3, whose error functions these
propositions evaluate.

**Checks.**

- The Platt–Trudgian row `X = 1000`: `A (X/R)^B exp(−C √(X/R)) = 461.9 · (179.4)^{1.52} ·
  exp(−1.89 · 13.39) = 461.9 · 2 670 · 1.03·10⁻¹¹ = 1.27·10⁻⁵`, within rounding of the printed
  `ε₀ = 1.20·10⁻⁵`.
- The Dusart row `b = 22`: `e²² = 3.58·10⁹`, and `2.78652·10⁻⁴ · 23 = 6.409·10⁻³`, the constant of
  Théorème 1.3 (`dusart-1998-thesis` line 848).
- The Faber–Kadiri row `b₀ = 20`: `e²⁰ = 485 165 195.4`, so the threshold `x ≥ 485 165 196` quoted
  for this row is the integer form of `x ≥ e²⁰`.
- Ramaré–Rumely's uniform row for `k ≤ 13` (`0.004560`) is weaker than the row for `k = 8`
  (`0.002811`); both are asserted.

### 1.7 Decimal enclosures of γ and of the Meissel–Mertens constant

Define *EulerGammaEnclosure* as `|γ − 0.5772156649| < 10⁻⁹` for `γ = Real.eulerMascheroniConstant`,
and *MeisselMertensEnclosure* as `|B − 0.2614972128| < 10⁻⁹` for `B = TauCeti.mertensConstant ℚ`.
These are stated here, once, for this roadmap and for ExplicitMultiplicativeFunctions, which is
later in the order of supply; ComputationalNumberTheory §4.17a's digamma remainders are one route
to a proof of the first, and `B = γ + ∑_p (log(1 − 1/p) + 1/p)` (Mertens) reduces the second to the
first and a convergent prime sum.

*Needs:* Mathlib `Real.eulerMascheroniConstant`; Tau Ceti `TauCeti.mertensConstant`.

**Checks.**

- Consistent with the pin: `1/2 < 0.5772 < 2/3`.
- `B < γ`, since every term `log(1 − 1/p) + 1/p` is negative; the enclosures are consistent
  (`0.2615 < 0.5772`).
- `B ≠ γ − 1/2 = 0.0772`: the Meissel–Mertens constant is not the fractional tail of `γ`.
- `B` is the constant of AnalyticNumberTheoryPartI §0.19 (`0.26149…`) and of Tau Ceti's
  `mertensConstant ℚ`: both are the limit of `∑_{p ≤ x} 1/p − log log x`.

### Examples

- `RH(545 439 823)` and `RH(3·10¹²)`; `GRH(8, 10 000)`; `GRH(q, 10⁸/q)` for `q ≤ 400 000` from
  ComputationalNumberTheory §4.22.
- The record gap `1476` after `1 425 172 824 437 699 411`.
- The Platt–Trudgian row `X = 1000`, `ε₀ = 1.20·10⁻⁵`.

### Dependencies

Mathlib `riemannZeta`, `RiemannHypothesis`, `DirichletCharacter.LFunction`,
`Real.eulerMascheroniConstant`, `Nat.nth`; Tau Ceti `mertensConstant`; ZerosOfLFunctions Layers 0
and 9; AnalyticNumberTheoryPartI §§0.2, 1.6; ComputationalNumberTheory §4.22; Layer 0.

## Layer 2: bounds under the Riemann hypothesis and under the Riemann hypothesis to a height

### 2.1 The smoothed explicit formula and the basic zero sums

The explicit inequalities of Layers 2, 3, 6 and 7 all start from the Weil explicit formula at
`K = ℚ` (ZerosOfLFunctions §8.4, `riemannZeta_weilExplicitFormula`), applied to a smoothing kernel
that is not infinitely differentiable, and from explicit bounds for sums over the zeros.

- Extension of the test class: the Weil formula holds for every `φ : ℝ → ℂ` of class `C^m`, `m ≥ 2`,
  with compact support in `(0, ∞)`, the zero side being absolutely convergent. Route: approximate
  `φ` in `C^m` by smooth functions with a common support; `|φ̃(ρ)| ≤ ‖(t d/dt)^m φ‖₁ /|ρ|^m` and
  `N(T) = O(T log T)` (ZerosOfLFunctions §4.5) make the zero side converge uniformly along the
  approximation, and the prime side is a finite sum.
- The kernels used later: Rosser–Schoenfeld's `w_m` built from `(4t(1 − t))^m` (as in
  `kadiri-lumley-2014` lines 503–509) and the Mellin-type kernel of
  `carneiro-milinovich-soundararajan-2019` Lemma 7 (lines 1185–1199) belong to this class or are
  limits of it.
- The sum over all zeros: `∑_ρ 1/(ρ(1 − ρ))`, summed over the zeros of the entire completion with
  multiplicity, equals `2 + γ − log 4π = 0.04619…`; it is twice the real part of `∑_ρ 1/ρ` in paired
  order, which is `1 + γ/2 − (log 4π)/2 = 0.02310…`, the constant of the Hadamard product
  (ZerosOfLFunctions §5.6, with `ξ'/ξ(0)` evaluated through `Λ'/Λ(0) = −Λ'/Λ(1)` and the Laurent
  expansion of `ζ` at `1`). Under `RH` this is `∑_ρ 1/|ρ|²`.
- Explicit partial sums under `RH(H)`: `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) + ∫ (remainder)`,
  with the remainder bounded through `gap:explicit-zero-count-error`: for `R(T) = a₁ log T +
  a₂ log log T + a₃`, `∑_{0 < γ ≤ T} 1/γ ≤ (1/4π) log²(T/2π) + (a₁ log T + a₂ log log T + a₃)/T +
  ∫₂ᵀ R(t)/t² dt + c₀` with `c₀` the contribution of the zeros below height `2`, which is `0`.
- Weighted sums over high zeros: for `φ` continuous, positive and decreasing on `[T₁, T₂]`,
  `T₁ ≥ 2πe`, `∑_{T₁ < γ ≤ T₂} φ(γ) ≤ (1/2π) ∫ φ(t) log(t/2π) dt + 4 φ(T₁) log T₁ + 2 ∫ φ(t) dt/t`
  (`gap:lehman-weighted-zero-sum`).

*Needs:* ZerosOfLFunctions §§4.5, 5.6, 8.4; Mathlib `mellin`; `gap:explicit-zero-count-error`;
`gap:lehman-weighted-zero-sum`.

**Checks.**

- `1 + γ/2 − (log 4π)/2 = 1 + 0.28861 − 1.26551 = 0.02310`. In paired order `∑_ρ 1/ρ =
  ∑_{γ > 0} 1/(1/4 + γ²)`; the first seven ordinates `14.1347, 21.0220, 25.0109, 30.4249, 32.9351,
  37.5862, 40.9187` contribute `0.00500 + 0.00226 + 0.00160 + 0.00108 + 0.00092 + 0.00071 + 0.00060
  = 0.01217`, and the tail above `41`, estimated with the density `(1/2π) log(t/2π)`, is about
  `0.011`, consistent with `0.02310`. Twice this, `0.04619 = 2 + γ − log 4π`, is `∑_ρ 1/(ρ(1 − ρ))`.
- `φ = 0` gives `0 = 0`; a test function supported in `(0, 1)` makes the prime side vanish and
  leaves `∑_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + A(φ)`.
- The Rosser–Schoenfeld kernel `(4t(1 − t))²` is `C¹` but not `C²` at the endpoints of its support
  after rescaling: the extension must cover `m = 2` with one-sided derivatives, and the design
  asks for `C^m` with `m ≥ 2` for the rescaled kernel `(4t(1 − t))^m` with `m ≥ 3`, which is `C^{m−1}`.

### 2.2 Schoenfeld's bounds under the Riemann hypothesis

Under `RiemannHypothesis` (`schoenfeld-1976` lines 20–28, Theorem 10; lines 98–100, Corollary 1):

- `|ψ(x) − x| < √x log² x/(8π)` for `x > 73.2`, and `ψ(x) − x > −√x log² x/(8π)` for `x > 59`;
- `|θ(x) − x| < √x log² x/(8π)` for `x > 599`, and `θ(x) − x < √x log² x/(8π)` for `x > 0`;
- `|ψ(x) − x|, |θ(x) − x| < (1/8π) √x (log x − 2) log x` for `x > 23·10⁸`;
- `|π(x) − li x| < √x log x/(8π)` for `x > 2657`, and `π(x) − li x < √x log x/(8π)` for `x > 3/2`.

Route: §2.1 with Rosser–Schoenfeld's kernel and `Re ρ = 1/2` for every zero; the sum over zeros
is bounded by `√x ∑_ρ 1/|ρ|` cut at `T = √x` with the explicit `∑ 1/γ` of §2.1 and
`gap:explicit-zero-count-error`; the small ranges (`73.2 < x ≤ 1075` for `ψ`, `599 < x`, `2657 < x ≤
5·10⁷`) are *Schoenfeld1976Range*; the passage to `π` is §0.4 with `li`.

*Needs:* §2.1, §0.3, §0.4; Mathlib `RiemannHypothesis`; `gap:explicit-zero-count-error`;
*Schoenfeld1976Range*.

**Checks.**

- `x = 100`: `ψ(100) = θ(100) + 10.317 = 83.728 + 10.317 = 94.045`, `|ψ(100) − 100| = 5.96`, and
  `√100 log² 100/(8π) = 10 · 21.21/25.13 = 8.44`: the `ψ` bound holds; `|θ(100) − 100| = 16.27 > 8.44`,
  so the two-sided `θ` bound fails at `100`, consistent with its threshold `599`.
- `x = 1000`: `θ(1000) = 956.25`, `ψ(1000) = 996.67`, bound `31.62 · 47.72/25.13 = 60.05`: both hold.
- `x = 10⁴`: `li 10⁴ − π(10⁴) = 1246.14 − 1229 = 17.1 < 100 · 9.21/25.13 = 36.65`.
- The one-sided bound `θ(x) − x < √x log² x/(8π)` for every `x > 0` is consistent with
  *ButheVerified* (`θ(x) < x` up to `10¹⁹`).

### 2.3 Büthe's bounds under the Riemann hypothesis to a height

Let `T > 0` with `RH(T)`. For every `x` with `4.92 √(x/log x) ≤ T` (`buthe-2016` lines 688–705,
Theorem 2):

- `|ψ(x) − x| ≤ √x log² x/(8π)` for `x > 59`;
- `|θ(x) − x| ≤ √x log² x/(8π)` for `x > 599`;
- `|π*(x) − li x| ≤ √x log x/(8π)` for `x > 59`, where `π*(x) = ∑_{k ≥ 1} π(x^{1/k})/k` is Riemann's
  weighted count, and `|π(x) − li x| ≤ √x log x/(8π)` for `x > 2657`.

Route: Büthe's Theorem 6.1 argument through §2.1: the zeros with `|γ| ≤ T` lie on the line by
hypothesis, and the zeros above `T` contribute, with a kernel of width tuned to `T`, less than the
margin `(log x − 2) log x` versus `log² x` leaves. The passage from `π*` to `π` uses
`π*(x) − π(x) = ∑_{k ≥ 2} π(x^{1/k})/k ≤ π(√x) + (log x/log 2) π(x^{1/3})/3` and
`Chebyshev.eventually_primeCounting_le`-type bounds made explicit by §3.5.

*Needs:* §2.1, §1.1, §0.3, §0.4, §3.5; `gap:explicit-zero-count-error`.

**Checks.**

- With `T = 3 000 175 332 800`: `x = 2.16·10²⁵` has `log x = 58.33`, `x/log x = 3.70·10²³`,
  `4.92 √(x/log x) = 2.99·10¹²`, so the bounds hold for every `x ≤ 2.16·10²⁵`.
- With `T = 545 439 823`: `x/log x ≤ (T/4.92)² = 1.229·10¹⁶`, so the bounds hold for `x ≤ 5·10¹⁷`.
- `π*(x) − π(x) ≥ π(√x)/2 > 0` for `x ≥ 4`, so the `π*` bound does not state the `π` bound.
- At `x = 60` the condition reads `4.92 √(60/4.094) = 18.8 ≤ T`, so `RH(18.8)`, which concerns the
  first zero only, suffices, and the bound is `|ψ(60) − 60| ≤ √60 log² 60/(8π) = 7.75 · 16.76/25.13
  = 5.17`; indeed `θ(60) = 49.008`, the prime powers `4, 8, 16, 32, 9, 27, 25, 49` add `8.525`,
  `ψ(60) = 57.53` and `|ψ(60) − 60| = 2.47`.

### 2.4 Consequences of Büthe's verified range

Under *ButheVerified* (§1.3):

- `ψ(x) ≤ x + 0.94 √x ≤ 1.03883 x` for `587 ≤ x ≤ 10¹⁹`, and `θ(x) < x` for `1 ≤ x ≤ 10¹⁹`;
- `0 < li x − π(x)` for `2 ≤ x ≤ 10¹⁹`, so `π(x) < li x` on that range; combined with §0.4,
  `π(x) < Li x + liTwo` there;
- the Deléglise–Nicolas input `θ(x) < x` for `x ≤ 10¹⁹` (`deleglise-nicolas-2019-landau` line 370).

*Needs:* §1.3, §0.4.

**Checks.**

- `0.94/√587 = 0.0388 ≤ 0.03883` while `0.94/√586 = 0.038831 > 0.03883`: the threshold `587`.
- `θ(10⁶) = 998 484.2 < 10⁶` and `x − θ(x) = 1515.8 ≥ 0.05 · 1000 = 50`.
- The statement is on `[1, 10¹⁹]` only: `θ(x) < x` for all `x` is false (Littlewood), and the
  proposition does not assert it.

### 2.5 Short intervals under the Riemann hypothesis

- Schoenfeld's corollary (from §2.2): under `RiemannHypothesis`, for every `x > 599` the interval
  `(x − √x log² x/(4π), x]` contains a prime: `θ(x) − θ(x − h) ≥ h − 2 √x log² x/(8π) > 0` for
  `h = √x log² x/(4π)`, using the lower bound at `x` and the one-sided upper bound at `x − h`.
- Dudek (`dudek-2015` lines 51–52, Theorem 2): under `RiemannHypothesis`, for every `x ≥ 2` the
  interval `(x − (4/π) √x log x, x]` contains a prime. Route: a weighted explicit formula (§2.1 with
  a kernel supported in `[x − h, x]`), `∑_ρ 1/|ρ|² = 2 + γ − log 4π` (§2.1) and the explicit zero
  count; the small range by *MaximalPrimeGapTable*.
- Ramaré–Saouter (`ramare-saouter-2003`, uncertified, Theorem 1 as quoted at `dudek-2015` line 48):
  under `RiemannHypothesis`, `(x − (8/5) √x log x, x]` contains a prime for every `x ≥ 2`; a
  corollary of Dudek's theorem since `4/π < 8/5`.
- Carneiro–Milinovich–Soundararajan (`carneiro-milinovich-soundararajan-2019` lines 261–262,
  Theorem 5): under `RiemannHypothesis`, for every `x ≥ 4` the interval `[x, x + (22/25) √x log x]`
  contains a prime; equivalently `p_{n+1} − p_n ≤ (22/25) √p_n log p_n` for `n ≥ 3` (line 259).
  Route (lines 1178–1199, 1367–1371): the Mellin-kernel explicit formula of their Lemma 7, the
  test function `H(x) = cos(2πx)/(1 − 16x²)` (line 167), the Brun–Titchmarsh inequality with the
  Montgomery–Vaughan constant (`gap:explicit-brun-titchmarsh`) to control prime powers and the
  edges, and *MaximalPrimeGapTable* through §1.4 for `4 ≤ x ≤ 4·10¹⁸` (lines 269–273).

*Needs:* §2.1, §2.2, §1.4; Mathlib `RiemannHypothesis`; `gap:explicit-brun-titchmarsh`;
`gap:explicit-zero-count-error`.

**Checks.**

- Schoenfeld at `x = 600`: `h = 24.49 · 40.92/12.566 = 79.75`, and `(520.25, 600]` contains `521`.
- Dudek at `x = 2`: `(2 − 1.273 · 1.414 · 0.693, 2] = (0.752, 2]` contains `2`; at `x = 100`:
  `(41.4, 100]`.
- Carneiro–Milinovich–Soundararajan at `x = 4`: `[4, 6.44]` contains `5`; at `x = 4·10¹⁸` the record
  gap `1476` is far below `0.88 · 2·10⁹ · 42.8 = 7.5·10¹⁰`.
- The three constants are ordered `22/25 = 0.88 < 4/π = 1.273 < 8/5 = 1.6`; the first interval lies
  above `x`, the other two below, so none implies another by inclusion alone.

### Examples

- `|ψ(1000) − 1000| = 3.33 < 60.05` and `|θ(1000) − 1000| = 43.75 < 60.05`.
- Büthe's range `x ≤ 2.16·10²⁵` from `RH(3·10¹²)`.
- The interval `(520.25, 600]` and the prime `521`.

### Dependencies

ZerosOfLFunctions §§4.5, 5.6, 8.4; Mathlib `RiemannHypothesis`; Layers 0, 1; §3.5 for the `π*`
transfer; the gaps `explicit-zero-count-error`, `lehman-weighted-zero-sum`,
`explicit-brun-titchmarsh`.

## Layer 3: unconditional bounds for ψ, θ and π

Every instance in §§3.2–3.5 is proved by one route, called the *standard route* below: for
`x ≤ 10¹⁹` the inequality follows from *ButheVerified* (§1.3) by §0.3 and §0.4, except on an
initial segment covered by the paper's own finite-range proposition; for `x > 10¹⁹` it follows
from the general scheme of §3.1 at the parameters of the paper's table proposition, under the
height `RH(H)` and the zero-free region constant the paper used. The hypotheses of each instance
are therefore: the named `RH(H)`, the region (`gap:classical-zero-free-constants`), the
zero-counting error (`gap:explicit-zero-count-error`), a zero density where the shape needs one
(`gap:explicit-zero-density`), the paper's table proposition, *ButheVerified*, and the paper's
finite-range proposition.

### 3.1 The general scheme

Three shapes, each a theorem whose conclusion is `|ψ(x) − x| ≤ ε x` on a stated range with `ε` an
explicit function of the parameters; the `θ` and `π` forms follow by §0.5.

- (a) *Region only* (`dusart-2016` lines 74–80, Theorem 1.1). Let `R > 0` and suppose `ζ` has no
  zero in the classical-shape region with constant `R`. Put `X = √(log x/R)` and
  `ε_R(x) = √(8/π) X^{1/2} e^{−X}`. Then `max(|θ(x) − x|, |ψ(x) − x|) < x ε_R(x)` whenever
  `X ≥ max(8.36, 8R)`. Route: §2.1 with the Rosser–Schoenfeld kernel, the region bounding `|x^ρ|`
  by `x exp(−log x/(R log γ))`, and `gap:lehman-weighted-zero-sum` for the sum over ordinates.
- (b) *Region, verified height and zero count* (`dusart-1999-mc` lines 61–99, Theorem 1, which is
  Theorem 4 of `rosser-schoenfeld-1975`; `rosser-schoenfeld-1975` lines 530–535, Theorem 2). Let
  `A > 0` with `RH(A)`, `R > 0` with the Rosser–Schoenfeld-shape region, and `R(T) = a₁ log T +
  a₂ log log T + a₃` with `|N(T) − M(T)| ≤ R(T)` for `T ≥ 2`. For `b > 1/2`, an integer `m ≥ 1`
  and `0 < δ < (1 − e^{−b})/m` with `T₁ ≥ 158.84998`, the quantity
  `ε(b, m, δ) = Ω₁ e^{−b/2} + Ω₂ δ^{−m} + mδ/2 + e^{−b} log 2π` of lines 71–97, where `Ω₁` depends on
  `(m, δ, T₁)` and `Ω₂` on `(m, δ, A, R, R(·))` through the kernels
  `K_ν(z, x) = (1/2) ∫ₓ^∞ t^{ν−1} exp(−(z/2)(t + 1/t)) dt`, satisfies `|ψ(x) − x| < ε x` for all
  `x ≥ e^b`. Rosser–Schoenfeld's Theorem 2 (lines 530–535) is the special case `m = 1`,
  `T₁ = T₂ = 0`, giving for `log x ≥ 105` the closed forms (3.19)–(3.20), the second with leading
  constant `0.110123`, the factor `(log x)^{3/8} exp(−√(log x/R))` and `R = 9.645908801`.
- (c) *With a zero density* (`faber-kadiri-2018-corrigendum` lines 20–45, Theorem 0.1;
  `platt-trudgian-2021-error` lines 58–62, Theorem 1; `johnston-yang-2023` lines 57–63, Theorem
  1.1). Let `H` with `RH(H)`, `R₀` with the classical-shape region, `R(T)` as in (b), `3/5 ≤ σ₀ < 1`
  and `c₁, c₂, c₃` with `N(σ₀, T) ≤ c₁ T + c₂ log T + c₃` for `T ≥ H`, `δ > 0`, an integer `m ≥ 2`,
  and `b₀ > 0` with `b₀ < m R₀ (log H)²`. Then `|ψ(x) − x| ≤ ε₀ x` for `x ≥ e^{b₀}`, with
  `ε₀ = max(ε(b₀, 1, 1 + δ, m, σ₀, T₁), ε(b₀, 1 − δ, 1, m, σ₀, T₁))` and `ε` the explicit function
  of the corrigendum's display (3.9). In the Platt–Trudgian and Johnston–Yang form the conclusion
  is `|ψ(x) − x| ≤ A (log x/R)^B exp(−C √(log x/R)) · x` for `log x ≥ X`, with `(X, A, B, C)` a
  function of the same parameters; each printed row is a *table proposition* asserting that the
  function at the row's parameters is at most the row's values.

*Needs:* §2.1; §1.1; `gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`;
`gap:explicit-zero-density`; `gap:lehman-weighted-zero-sum`; Mathlib `Real.exp`, `Real.sqrt`,
`Real.log`.

**Checks.**

- (a) with `R = 5.69693` at `log x = 10 000`: `X = 41.90`, `ε_R = 1.5958 · 6.473 · 6.4·10⁻¹⁹ =
  6.6·10⁻¹⁸`; the condition `X ≥ 8R = 45.6` fails there (`log x ≥ 11 840` is needed), so the row is
  outside (a)'s range and Dusart's Corollary 1.2 (§3.3) covers it by a separate argument.
- (b) at `b = 50` with Dusart's parameters `A = 545 439 823.215`, `m = 18`, `δ = 0.947265625·10⁻⁸`
  gives `ε = 0.905·10⁻⁷` (*Dusart1999Row*); the term `mδ/2 = 8.5·10⁻⁸` alone is of that size, so
  `δ` cannot be taken larger.
- (b) degenerate: `b ≤ 1/2` is excluded; for `b` just above `1/2` the term `e^{−b} log 2π = 1.1`
  makes `ε > 1`, a trivial bound; the scheme has content only for large `b`.
- (c) at the Platt–Trudgian row `X = 1000`: `461.9 · (1000/5.573412)^{1.52} exp(−1.89 √(1000/5.573412))
  = 1.27·10⁻⁵`, the printed `1.20·10⁻⁵` up to the rounding of `A, B, C`.
- With `R₀ = 5.70175` versus `5.573412` the exponent `√(log x/R)` at `log x = 10⁴` changes from
  `41.88` to `42.36`, a factor `e^{0.48} = 1.6` in the bound: the constant is a genuine parameter.

### 3.2 Rosser–Schoenfeld and Schoenfeld constants for ψ and θ

Each of the following holds under `RH(545 439 823)`, the Rosser–Schoenfeld-shape region with
`R = 9.645908801`, the zero-count error with Rosser's triple, *DusartThesisTable*,
*RosserSchoenfeld1962Range*, *Schoenfeld1976Range* and *ButheVerified*, by the standard route.

- `θ(x) < 1.01624 x` for `x > 0` (`rosser-schoenfeld-1962` line 328, Theorem 9).
- `ψ(x) < 1.03883 x` for `x > 0`, and `ψ(x)/x ≤ ψ(113)/113` for every `x > 0` (lines 341–342).
- `x(1 − 1/(2 log x)) < θ(x)` for `x ≥ 563` and `θ(x) < x(1 + 1/(2 log x))` for `x > 1` (lines
  252–253 with the ranges of lines 306–307, Theorem 4); `x(1 − 1/log x) < θ(x)` for `x ≥ 41`
  (its Corollary).
- `θ(x) < 1.001093 x` for `x > 0`; `0.998697 x < θ(x)` for `x > 1 155 901`;
  `ψ(x) − θ(x) < 1.001093 √x + 3 x^{1/3}` for `x > 0`; `0.998697 √x < ψ(x) − θ(x)` for `x > 121`
  (`schoenfeld-1976` lines 729–733, Theorem 6*). The last two follow from the first two by §0.3
  for `x ≥ 1 155 901²` and from *Schoenfeld1976Range* below.
- `θ(x) < 1.000081 x` for `x > 0` (`schoenfeld-1976` line 1293).
- Schoenfeld's Theorem 11 (lines 201–206): with `X = √(log x/R)`, `R = 9.645908801`,
  `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}`: `|ψ(x) − x| < x ε₀(x)` for `x > 17`,
  `|θ(x) − x| < x ε₀(x)` for `x > 101`. This instance of §3.1(b) uses `RH(1 894 438.5)`, implied
  by `RH(545 439 823)`.
- Rosser–Schoenfeld's `ε(x)` of their Theorem 11 (lines 334–342) with `R = 17.51631` is the
  older instance of the same scheme and is superseded; it is not restated.

*Needs:* §3.1(b); §0.3; §0.5; §1.1; §1.3; §1.6; `gap:classical-zero-free-constants`;
`gap:explicit-zero-count-error`.

**Checks.**

- `ψ(113)/113 = 1.03882…` (§0 Examples), below `1.03883`; `θ(113)/113 = 0.9475 < 1.01624`.
- Theorem 4 at `x = 100`: `100(1 − 1/(2 log 100)) = 89.14 > θ(100) = 83.73`, so the lower bound fails
  at `100`; at `x = 1000`: `927.6 < θ(1000) = 956.25 < 1072.4`.
- `θ(1000)/1000 = 0.956 < 1.000081`: the constant `1.000081` is a near-unit upper bound whose
  content is at the `x` where `θ(x)/x` is largest; it is consistent with *ButheVerified*
  (`θ(x) < x` up to `10¹⁹`), and the margin `0.000081` is what the analytic tail provides beyond.
- `ε₀(e¹⁰⁰) = 0.02777` (§0.5). At `x = 17`: `X = √(2.833/9.646) = 0.542`, `ε₀ = 0.38703 · 0.736 ·
  0.582 = 0.166`, so the `ψ` bound reads `|ψ(17) − 17| < 2.82`; `ψ(17) = θ(17) + 3 log 2 + log 3 =
  13.143 + 2.079 + 1.099 = 16.32` and `|16.32 − 17| = 0.68`.
- The `ψ − θ` lower bound at `x = 120.9` versus `121` (§0.3 Checks) explains the threshold `121`.

### 3.3 Dusart's bounds

Under `RH(545 439 823)`, the Rosser–Schoenfeld-shape region with `R = 9.645908801`, Rosser's
zero-count triple, *DusartThesisTable*, *Dusart1999Row*, *DusartThesisRange* and *ButheVerified*:

- `|ψ(x) − x| ≤ 0.006409 x/log x` for `x > e²²`; `|θ(x) − x| ≤ 0.006788 x/log x` for
  `x > 10 544 111` (`dusart-1998-thesis` lines 845–846, Théorème 1.3; the proof at lines 847–864
  is the standard route with Table 1.1).
- `|θ(x) − x| < η_k x/log^k x` for `x > 1` with `η₂ = 3.965`, `η₃ = 515`, `η₄ = 1 717 433`, and
  `|θ(x) − x| ≤ 0.2 x/log² x` for `x > 3 594 641` (lines 869–874, 924–925, Théorème 1.4).
- `|ψ(x) − x| ≤ 0.905·10⁻⁷ x` for `x ≥ e⁵⁰` (`dusart-1999-mc` lines 102–108, Theorem 2).
- Under the classical-shape region with `R₀ = 5.69693` instead (`dusart-2016` lines 84–90,
  Corollary 1.2): `max(|θ(x) − x|, |ψ(x) − x|) < √(8/π) R₀^{−1/4} x (log x)^{1/4} exp(−√(log x/R₀))`
  for `x ≥ 3`, from §3.1(a) for `X ≥ 8R₀` and the standard route below.
- Dusart's later bounds (`dusart-2018`, uncertified; Theorem 4.2 as quoted at
  `deleglise-nicolas-2019-landau` lines 387–388), under `RH(3·10¹²)`, the classical-shape region
  with `R₀ = 5.573412`, *Dusart2018Range* and the standard route: `|θ(x) − x| ≤ x/log³ x` for
  `x ≥ 89 967 803` and `|θ(x) − x| ≤ 0.5 x/log³ x` for `x ≥ 767 135 587`.

*Needs:* §3.1(a), (b); §0.3; §0.5; §1.1; §1.3; §1.6; `gap:classical-zero-free-constants`;
`gap:explicit-zero-count-error`.

**Checks.**

- Table row `b = 22`: `2.78652·10⁻⁴ · 23 = 6.409·10⁻³`, the constant of Théorème 1.3 (line 848);
  row `b = 30`: `0.978·10⁻⁵ · 600 = 5.87·10⁻³ < 6.409·10⁻³` (line 851).
- At `x = 10¹⁰` (within Büthe's range): `|ψ(10¹⁰) − 10¹⁰| = 42 119.8` (`deleglise-rivat-1998` line
  238) against `0.94 · 10⁵ = 94 000` and against `0.006409 · 10¹⁰/23.03 = 2.78·10⁶`.
- Théorème 1.4 with `η₂ = 3.965` at `x = 10⁴`: bound `3.965 · 10⁴/84.83 = 467`, actual
  `|θ(10⁴) − 10⁴| = 104`; the sharper `0.2` is excluded below `3 594 641` because at `x = p₁₇ = 59`
  the ratio `|θ(x) − x| log² x/x` is `3.9648…` (line 926).
- Dusart 2016 at `x = 3`: `√(8/π) · 0.6473 · 3 · 1.024 · e^{−0.439} = 2.04 ≥ |ψ(3) − 3| = 1.21`.
- The 2018 row `(1, 89 967 803)`: at `x = 10¹⁰`, `x/log³ x = 8.19·10⁵ ≥ 42 120`; at the Büthe edge
  `x = 10¹⁹`, `x/log³ x = 1.2·10¹⁴` while `0.94 √x = 3·10⁹`: the verified range gives far more
  than the row asks below `10¹⁹`, and above `10¹⁹` the row is a genuine analytic claim whose
  inputs (the 2018 paper's own tables) are *Dusart2018Range*.

### 3.4 Faber–Kadiri, Trudgian, Platt–Trudgian, Johnston–Yang and Fiori–Kadiri–Swidinsky

- Faber–Kadiri (`faber-kadiri-2015` line 43, Corollary 1.2, with the corrected table
  `faber-kadiri-2018-corrigendum` line 98): under `RH(30 610 046 000)`, the classical-shape region
  with `R₀ = 5.69693`, Rosser's zero-count triple, Kadiri's zero density at `σ₀ = 17/20`
  (`gap:explicit-zero-density`), *FaberKadiriTable* and *FaberKadiriRange*:
  `|ψ(x) − x| ≤ 5.3688·10⁻⁴ x` for `x ≥ e²⁰`, an instance of §3.1(c).
- Trudgian (`trudgian-2016` lines 66–73, Theorem 1; lines 132–140, Theorem 2): under
  `RH(30 610 046 000)`, the classical-shape region with `R₀ = 5.69693`, *TrudgianRow* (the derived
  Rosser–Schoenfeld-shape region with `R = 6.455` for `|t| ≥ 24`) and *TrudgianRange*: with
  `ε₀(x) = √(8/(17π)) X^{1/2} e^{−X}`, `X = √(log x/6.455)`, `|θ(x) − x| ≤ x ε₀(x)` for `x ≥ 149`
  and `|ψ(x) − x| ≤ x ε₀(x)` for `x ≥ 23`; and `|π(x) − li x| ≤ 0.2795 x (log x)^{3/4} exp(−√(log x/6.455))`
  for `x ≥ 229`, by §0.4.
- Platt–Trudgian (`platt-trudgian-2021-error` lines 58–69, Theorem 1 and Corollary 1; lines 76–77,
  Corollary 2): under `RH(3 000 175 332 800)`, the classical-shape region with `R = 5.573412`, the
  zero-count error, the Kadiri–Lumley–Ng density, *PlattTrudgianTable* and *PlattTrudgianRange*:
  for each row `(X, A, B, C, ε₀)`, `|ψ(x) − x| ≤ A (log x/R)^B exp(−C √(log x/R)) x` and
  `|ψ(x) − x| ≤ ε₀ x` for `log x ≥ X`; `|θ(x) − x| ≤ (A + 0.1)(log x/R)^B exp(−C √(log x/R)) x` on
  the same range, using `ψ(x) − θ(x) < (1 + 1.47·10⁻⁷) √x + 1.78 x^{1/3}` (line 69, an instance of
  §0.3 with Dusart's constants); and `|π(x) − li x| ≤ 235 x (log x)^{0.52} exp(−0.8 √log x)` for
  `log x ≥ 2000`.
- Johnston–Yang (`johnston-yang-2023` lines 57–72, Theorem 1.1, Corollaries 1.2–1.3): under
  `RH(3 000 175 332 800)`, the classical-shape region with `R = 5.573412`, the zero-count error,
  the Kadiri–Lumley–Ng density, *JohnstonYangTable* and *JohnstonYangRange*:
  `|ψ(x) − x| ≤ 9.39 x (log x)^{1.515} exp(−0.8274 √log x)` for `x ≥ 2`; the rows
  `|ψ(x) − x| ≤ A x (log x)^B exp(−C √log x)` and `≤ ε₀ x` for `log x ≥ X`;
  `|θ(x) − x| ≤ (A + 0.01) x (log x)^B exp(−C √log x)` on the row's range; and
  `|π(x) − li x| ≤ 9.59 x (log x)^{0.515} exp(−0.8274 √log x)` for `x ≥ 2`.
- Fiori–Kadiri–Swidinsky (`fiori-kadiri-swidinsky-2023` lines 159–182, Theorem 3; lines 712–725,
  Corollary 22): the general conversion of an admissible asymptotic `θ`-bound
  `|θ(x) − x| ≤ A_θ (log x/R)^B exp(−C √(log x/R)) x` on `[x₀, ∞)`, with `B ≥ max(3/2, 1 + C²/(16R))`,
  into the `π`-bound `|π(x) − Li x| ≤ (1 + ν)(1 + μ) A_θ (log x/R)^{B−1} exp(−C √(log x/R)) x` on
  `[x₁, ∞)` with the explicit `ν = ν(x₀)`, `μ = μ(x₀, x₁)` of their displays (27) and (9); and its
  instance under *BroadbentRow*, the classical-shape region with `R = 5.5666305` and `RH(3·10¹²)`:
  `|π(x) − Li x| ≤ 9.2211 x √(log x) exp(−0.84768363 √log x)` for `x ≥ 2`.

*Needs:* §3.1(b), (c); §0.3; §0.4; §0.5; §1.1; §1.3; §1.6; `gap:classical-zero-free-constants`;
`gap:explicit-zero-count-error`; `gap:explicit-zero-density`.

**Checks.**

- Faber–Kadiri at `x = 10¹⁰`: `5.3688·10⁻⁴ · 10¹⁰ = 5.4·10⁶ ≥ 42 120`.
- Trudgian at `x = 23`: `X = 0.697`, `ε₀ = 0.161`, bound `3.70 ≥ |ψ(23) − 23| = 0.60`
  (`ψ(23) = 19.223 + 2.079 + 1.099 = 22.40`). At `x = 149`: `ε₀ = 0.1506`, bound `22.4 ≥
  |θ(149) − 149| = 17.35` (`θ(149) = 131.647`); at `x = 126.99`, just below the prime `127`,
  `θ = θ(113) = 107.07`, `|107.07 − 126.99| = 19.92 > ε₀(126.99) · 126.99 = 19.24`: the `θ` bound
  fails there, which is why its threshold is `149` while the `ψ` threshold is `23`.
- Platt–Trudgian's Corollary 2 at `log x = 2000`: `235 · 2000^{0.52} · e^{−35.78} = 235 · 52.1 ·
  2.9·10⁻¹⁶ = 3.5·10⁻¹²` relative to `x`, consistent with (weaker than) the row `ε₀ = 8.35·10⁻¹⁰`
  divided by `log x`.
- Johnston–Yang's Theorem 1.1 at `x = 2`: bound `9.39 · 2 · 0.5738 · 0.5021 = 5.41 ≥ |ψ(2) − 2| =
  1.31`; the bound exceeds `x` itself for `log x ≤ 150` and equals `0.0053 x` at `log x = 400`:
  the theorem has content only for large `x`. With the exponent `1.51` in place of `1.515` the
  value at `log x = 400` would change by the factor `400^{0.005} = 1.03`; the paper's exponent is
  the one stated.
- Fiori–Kadiri–Swidinsky at `x = 2`: `9.2211 · 2 · 0.8326 · 0.4937 = 7.58 ≥ |π(2) − Li 2| = 1`; the
  bound is below `x/log x` once `9.2211 (log x)^{3/2} e^{−0.8477 √log x} < 1`, for instance at
  `log x = 300` where it is `0.02`.

### 3.5 Bounds for π(x)

- Rosser–Schoenfeld (`rosser-schoenfeld-1962` lines 195–212, Theorems 1–2 and Corollaries 1–3),
  under the hypotheses of §3.2 and *RosserSchoenfeld1962Range*:
  `(x/log x)(1 + 1/(2 log x)) < π(x)` for `x ≥ 59` and `π(x) < (x/log x)(1 + 3/(2 log x))` for
  `x > 1`; `x/(log x − 1/2) < π(x)` for `x ≥ 67` and `π(x) < x/(log x − 3/2)` for `x > e^{3/2}`;
  `x/log x < π(x)` for `x ≥ 17` and `π(x) < 1.25506 x/log x` for `x > 1`; `π(x) < 5x/(4 log x)` for
  `1 < x < 113` and for `x ≥ 113.6`; `3x/(5 log x) < π(2x) − π(x)` for `x ≥ 41/2` and
  `0 < π(2x) − π(x) < 7x/(5 log x)` for `x > 1`. The lower dyadic inequality is the statement
  `dyadicPrimeCount` of ClassicalArithmeticCompletion §6.34, which proves it independently; the
  two statements agree, and the two-sided form is the target here.
- Dusart (`dusart-1998-thesis` lines 1418–1445, Théorème 1.10), under the hypotheses of §3.3:
  `(x/log x)(1 + 1/log x) ≤ π(x)` for `x > 599`; `π(x) ≤ (x/log x)(1 + 1.2762/log x)` for `x > 1`;
  `π(x) ≤ (x/log x)(1 + 1.0992/log x)` for `x > 1.332·10¹⁰`; `π(x) ≤ x/(log x − 1.1)` for
  `x > 60 184`; `π(x) > x/(log x − 1)` for `x > 5393`;
  `(x/log x)(1 + 1/log x + 1.8/log² x) ≤ π(x)` for `x > 32 299`;
  `π(x) ≤ (x/log x)(1 + 1/log x + 2.51/log² x)` for `x > 355 991`.
- Axler (`axler-2016` lines 31–48, Theorems 1.1–1.4), under the hypotheses of §3.3 and Axler's
  finite-range proposition *AxlerRange* (the inequalities below their thresholds and up to `10¹⁹`,
  which the paper derives from Büthe's and Dusart's bounds): for `x > 1`,
  `π(x) < x/log x + x/log² x + 2x/log³ x + 6.35 x/log⁴ x + 24.35 x/log⁵ x + 121.75 x/log⁶ x +
  730.5 x/log⁷ x + 6801.4 x/log⁸ x`; for `x ≥ 1 332 450 001` the lower bound with coefficients
  `1, 1, 2, 5.65, 23.65, 118.25, 709.5, 4966.5`; for `x ≥ e^{3.804}`,
  `π(x) < x/(log x − 1 − 1/log x − 3.35/log² x − 12.65/log³ x − 71.7/log⁴ x − 466.1275/log⁵ x −
  3489.8225/log⁶ x)`; for `x ≥ 1 332 479 531` the lower bound with `2.65, 13.35, 70.3, 455.6275,
  3404.4225`.
- Panaitopol's expansion (`panaitopol-2000` lines 17–22, Theorem 1; lines 94–95, 100–118, Theorem
  3): with `k₁, …, k_n` defined by `k_m + 1! k_{m−1} + 2! k_{m−2} + ⋯ + (m − 1)! k₁ = m · m!`
  (`k₁ = 1, k₂ = 3, k₃ = 13, k₄ = 71, k₅ = 461, k₆ = 3441`),
  `π(x) = x/(log x − 1 − k₁/log x − ⋯ − k_n (1 + α_n(x))/logⁿ x)` with `α_n(x) → 0`; an asymptotic
  statement, proved from `π(x) = Li x + O(x exp(−c √log x))` (ZerosOfLFunctions §8.5 at `K = ℚ`)
  and the expansion of `Li` (§8.9 there); `k_m` is the displayed determinant.
- Every `π − li` bound of §3.4 is listed there with its `ψ` source.

*Needs:* §3.2; §3.3; §0.4; §1.3; ZerosOfLFunctions §§8.5, 8.9; ClassicalArithmeticCompletion §6.34.

**Checks.**

- Theorem 1 at `x = 59`: `π(59) = 17`, bounds `16.24 < 17 < 19.79`; at `x = 58` the lower bound is
  `16.04 > 16 = π(58)`: the threshold `59` is sharp.
- `π(x) log x/x` is largest at `x = 113`, where it equals `30 · 4.7273878/113 = 1.2550594…`, below
  `1.25506`; a constant `1.25505` would fail at `113`.
- Corollary 1 at `x = 10`: `10/log 10 = 4.34 > 4 = π(10)`, so `x/log x < π(x)` fails at `10`; it holds
  for `11 ≤ x ≤ 17` and the theorem states it from `17`.
- Corollary 3 at `x = 41/2`: `π(41) − π(20.5) = 13 − 8 = 5 > 61.5/15.10 = 4.07`; at `x = 20.4`:
  `π(40.8) − π(20.4) = 12 − 8 = 4 < 61.2/15.08 = 4.06`: the threshold `41/2` is sharp.
- Dusart's (5) at `x = 10⁴`: `10⁴/(9.2103 − 1) = 1218.0 < 1229 = π(10⁴)`; at `x = 100`:
  `100/(4.605 − 1) = 27.7 > 25 = π(100)`, so the threshold cannot be lowered to `100`.
- Axler's Theorem 1.1 at `x = 10⁴`: the eight terms are `1085.7, 117.9, 25.6, 8.82, 3.67, 1.99,
  1.30, 1.31`, sum `1246.3 > 1229`; Theorem 1.2 at `x = 10¹⁰`: the terms sum to `455 042 009 <
  455 052 511 = π(10¹⁰)`.
- Panaitopol: `k₂ = 3` from `k₂ + 1! k₁ = 2 · 2! = 4`; `k₃ = 13` from `k₃ + k₂ + 2 k₁ = 18`.

### 3.6 Bounds from a Vinogradov–Korobov region

Under `gap:vinogradov-korobov-constants` with Ford's region, `RH(3 000 175 332 800)`, the
zero-count error, the density of Kadiri–Lumley–Ng and *JohnstonYangTable* (`johnston-yang-2023`
lines 77–80, Theorem 1.4): for `x ≥ 23`,
`|ψ(x) − x| ≤ 0.026 x (log x)^{1.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})`,
`|θ(x) − x| ≤ 0.027 x (log x)^{1.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})`,
`|π(x) − li x| ≤ 0.028 x (log x)^{0.801} exp(−0.1853 (log x)^{3/5} (log log x)^{−1/5})` (the
paper's display prints `π(x) − x` for the last; the statement is the one with `li`).

*Needs:* §3.1(c) with the Vinogradov–Korobov region in place of the classical one;
`gap:vinogradov-korobov-constants`; §0.3; §0.4.

**Checks.**

- At `x = 23`: `0.026 · 23 · 7.83 · e^{−0.358} = 3.27 ≥ 0.60`.
- The bound is sharper than Theorem 1.1 of §3.4 only when
  `0.1853 (log x)^{3/5}(log log x)^{−1/5} > 0.8274 √log x`, that is for `log x` beyond about `10⁹`;
  at `log x = 10⁵` the exponents are `−113.7` and `−261.6`, so §3.4 is better there.
- A statement with `π(x) − x` on the left would be false at every large `x` (the difference is
  about `−x`).

### Examples

- `ψ(113)/113 = 1.03882…` and `π(113) log 113/113 = 1.25506…`: the two Rosser–Schoenfeld extremal
  points.
- `|ψ(10¹⁰) − 10¹⁰| = 42 119.8` against Büthe's `94 000`, Dusart's `2.78·10⁶` and Faber–Kadiri's
  `5.4·10⁶`.
- `ε₀(e¹⁰⁰) = 0.02777` (Schoenfeld), the Platt–Trudgian row `1.20·10⁻⁵` at `log x = 1000`.

### Dependencies

Layers 0–2; ZerosOfLFunctions §§4.5, 8.4, 8.5, 8.9; ClassicalArithmeticCompletion §6.34; the gaps
`classical-zero-free-constants`, `explicit-zero-count-error`, `explicit-zero-density`,
`lehman-weighted-zero-sum`, `vinogradov-korobov-constants`.

## Layer 4: sums over primes

### 4.1 One-sided Mertens sums of Rosser–Schoenfeld

The two-sided theorems with the constants `B` and `E` are AnalyticNumberTheoryPartI §0.19 and §0.8
and are not restated. Their one-sided corollaries on the full range (`rosser-schoenfeld-1962` lines
256–293 and the ranges at lines 304–322, Theorems 5–6 and Corollaries), under *RosserSchoenfeld1962Range*
for the initial segments:

- `log log x < ∑_{p ≤ x} 1/p` for `x > 1`, and `∑_{p ≤ x} 1/p < log log x + B + 1/log x` for `x > 1`;
- `∑_{p ≤ x} (log p)/p < log x` for `x > 1`, and `log x + E − 1/log x < ∑_{p ≤ x} (log p)/p` for
  `x ≥ 32`, with `E` the constant of §0.8 there.

*Needs:* AnalyticNumberTheoryPartI §§0.8, 0.19; §1.3.

**Checks.**

- `x = 2`: `log log 2 = −0.3665 < 1/2`; `x = 10`: `∑_{p ≤ 10} 1/p = 1.1762 < 0.8340 + 0.2615 + 0.4343
  = 1.5298`.
- `x = 10`: `∑_{p ≤ 10} (log p)/p = 0.3466 + 0.3662 + 0.3219 + 0.2780 = 1.3127 < log 10 = 2.3026`;
  `x = 2`: `0.3466 < 0.6931`.
- At `x = 1.5` all sums are empty and `log log 1.5 = −0.90 < 0`: the range `x > 1` includes points
  below `2`, where the statements are about the empty sum.

### 4.2 The sum ∑ Λ(n)/n

- Exact form (§0.7 at `q = 1`, `C(1, 0) = −γ`): for `x ≥ 1`,
  `∑_{n ≤ x} Λ(n)/n = log x − γ + (ψ(x) − x)/x − ∫ₓ^∞ (ψ(t) − t)/t² dt`.
- Ramaré (`ramare-2013` lines 82–104, Theorem 1.1): under `RH(3 000 175 332 800)`, for
  `x ≥ 8950`, `|∫ₓ^∞ (ψ(t) − t)/t² dt| ≤ 1/(2√x) + 1.75·10⁻¹²`; and under the classical-shape region
  with `R = 5.69693`, for `log x ≥ 9270`, `|∫ₓ^∞ (ψ(t) − t)/t² dt| ≤ 1/(2√x) + (1 + 2 √(log x/R))
  exp(−2 √(log x/R))/(2π)`. Route: the exact form and the explicit formula for the integral
  (`∫ₓ^∞ (ψ(t) − t)/t² dt = ∑_ρ x^{ρ−1}/(ρ(1 − ρ)) + …`, an absolutely convergent zero sum from
  §2.1), the zeros below the height contributing `x^{−1/2} ∑ 1/|ρ(1 − ρ)| ≤ x^{−1/2} · 0.04619/2`
  and the high zeros through the region and `gap:lehman-weighted-zero-sum`.
- Instances: `∑_{n ≤ x} Λ(n)/n = log x − γ + O*(1.833/log² x)` for `x > 1`; `O*(1.31/√x)` for
  `1 ≤ x ≤ 10¹⁰`; `O*(0.0067/log x)` for `x > e²²`. The first two are Ramaré's Corollary (lines
  105–107); the third is derived here from Theorem 1.1 and Dusart's `0.006409 x/log x` (§3.3), since
  `1/(2√x) + 1.75·10⁻¹² ≤ 0.000291/log x` for `x > e²²`; the printed threshold `x ≥ 23` of the
  corollary's third item (line 108) is not stated. The route for `1.833/log² x`: *Ramare2013Range*
  (the inequality for `1 < x < 8950` and the `1.31/√x` statement, both finite computations),
  then Theorem 1.1 with *ButheVerified* up to `10¹⁹`, Dusart's bound up to `e²⁸⁶`
  (`0.006409 log x ≤ 1.833`), Dusart's `0.905·10⁻⁷` up to `e⁴⁵⁰⁰`, the Platt–Trudgian rows up to
  `e^{10⁴}`, and the second form of Theorem 1.1 beyond.

*Needs:* §0.7; §2.1; §3.3; §3.4; §1.1; §1.3; `gap:classical-zero-free-constants`;
`gap:lehman-weighted-zero-sum`; ZerosOfLFunctions §5.6.

**Checks.**

- `x = 10`: `∑_{n ≤ 10} Λ(n)/n = log 2 (1/2 + 1/4 + 1/8) + log 3 (1/3 + 1/9) + log 5/5 + log 7/7 =
  0.6065 + 0.4883 + 0.3219 + 0.2780 = 1.6947`; `log 10 − γ = 1.7254`; the difference `0.0307` is
  below `1.833/log² 10 = 0.346` and below `1.31/√10 = 0.414`.
- `x = 1`: the sum is empty, `log 1 − γ = −0.5772`, and `1.31/√1 = 1.31 > 0.5772`, so the
  `1 ≤ x` form is consistent at its left end; `1.833/log² x` is unbounded as `x → 1⁺`.
- At `x = e²²`: `1/(2√x) = 8.35·10⁻⁶ < 0.000291/22 = 1.32·10⁻⁵`, so `0.006409 + 0.000291 = 0.0067`.
- A transfer with a constant `ε` has a divergent tail (§0.7 Checks); the instances use decaying
  error functions.

### 4.3 The sum ∑ 1/p and the Meissel–Mertens constant

- Exact form: for `x ≥ 2`, `∑_{p ≤ x} 1/p = θ(x)/(x log x) + ∫₂ˣ θ(t)(1 + log t)/(t² log² t) dt`
  (Abel summation against `1/(t log t)`, whose derivative is `−(1 + log t)/(t² log² t)`).
- The constant: `B = 1/log 2 − log log 2 + ∫₂^∞ (θ(t) − t)(1 + log t)/(t² log² t) dt`, the integral
  converging absolutely because `θ(t) − t = O(t/log² t)` (ZerosOfLFunctions §8.5 at `K = ℚ` with
  §0.3); and for `x ≥ 2`,
  `∑_{p ≤ x} 1/p − log log x − B = (θ(x) − x)/(x log x) − ∫ₓ^∞ (θ(t) − t)(1 + log t)/(t² log² t) dt`.
  Here `B` is `TauCeti.mertensConstant ℚ`: both are the limit of `∑_{p ≤ x} 1/p − log log x`.
- Transfer: if `|θ(t) − t| ≤ η t/log^k t` for all `t ≥ x`, with `k ≥ 2`, then
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ η (1/k + (k + 2)/((k + 1) log x))/log^k x`.
- Vanlalngaia's instances (`vanlalngaia-2017` lines 26–51, Corollary 1; lines 59–65, Corollary 2;
  the extraction's digits are transposed and were decoded, see the References), under the
  hypotheses of the Dusart 2018 row `(1, 89 967 803)` of §3.3, *VanlalngaiaRange* (the first
  three inequalities on `[2, 89 967 803]`) and *MeisselMertensEnclosure*:
  `|∑_{p ≤ x} 1/p − log log x − B| ≤ 4/log³ x` for `x ≥ 2`, `≤ 2.3/log³ x` for `x ≥ 1000`,
  `≤ 1/log³ x` for `x ≥ 24 284`; and, under the hypotheses of Dusart 2016's Corollary 1.2 (§3.3),
  `≤ 1.1 exp(−√(0.175 log x))/(log x)^{3/4}` for `log x ≥ 4635`. Route: the transfer with `k = 3`,
  `η = 1` gives `(1/3 + 5/(4 log x))/log³ x ≤ 0.41/log³ x` for `x ≥ 89 967 803`; the last instance
  uses `ε(t) = √(8/π) R₀^{−1/4} (log t)^{1/4} exp(−√(log t/R₀))` with `1/R₀ = 0.17553 > 0.175`.

*Needs:* §0.3; §3.3; §1.7; Tau Ceti `TauCeti.mertensConstant`,
`TauCeti.tendsto_primeSummatory_inv_absNorm_sub_log_log`; ZerosOfLFunctions §8.5; Mathlib Abel
summation; *VanlalngaiaRange*.

**Checks.**

- The exact form at `x = 3`: left side `1/2 + 1/3 = 0.8333`; right side `log 6/(3 log 3) + log 2 ·
  (1/(2 log 2) − 1/(3 log 3)) = 0.5436 + 0.6931 · 0.4179 = 0.8333`, using the antiderivative
  `−1/(t log t)`. Integrating against `1/(t² log² t)` without the factor `1 + log t` gives
  `0.5436 + 0.6931 · 0.0963 = 0.61`, wrong.
- `1/log 2 − log log 2 = 1.4427 + 0.3665 = 1.8092`, so the integral in the formula for `B` is
  `0.2615 − 1.8092 = −1.5477`, negative as `θ(t) < t` on most of the range.
- `x = 10`: `∑ 1/p = 1.1762`, `log log 10 + B = 1.0955`, difference `0.0807 < 4/log³ 10 = 0.3276`;
  `x = 1000`: `∑_{p ≤ 1000} 1/p = 2.1981`, `log log 1000 + B = 2.1942`, difference `0.0039 <
  2.3/log³ 1000 = 0.0070`.
- The transfer with `k = 1` (a bound `η t/log t`) gives a divergent integral `∫ dt/(t log t)`: a
  `θ`-bound with relative error `1/log t` does not determine `B`; `k ≥ 2` is needed.

### 4.4 Ramaré's weighted sums over primes

Let `P ≥ 2` and `f` be `C¹`, nonnegative and non-increasing on `[P, ∞)` with `t f(t) → 0`. Then,
with `θ(P⁻) = ∑_{p < P} log p`,

- `∑_{p ≥ P} f(p) log p = −f(P) θ(P⁻) − ∫_P^∞ θ(t) f'(t) dt` (Abel summation; the series converges
  because `θ(t) ≤ (log 4) t` and `t f(t) → 0`);
- if moreover `θ(t) ≤ (1 + ε) t` for all `t ≥ P`, then
  `∑_{p ≥ P} f(p) log p ≤ (1 + ε) ∫_P^∞ f(t) dt + f(P) ((1 + ε) P − θ(P⁻))`;
- Ramaré's form (`ramare-2016` lines 294–303, Lemma 3.2): with `ε = 1/914` and `P ≥ 3 600 000`,
  `∑_{p ≥ P} f(p) log p ≤ (1 + ε) ∫_P^∞ f + ε P f(P) + P f(P)/(5 log² P)`, from the previous item,
  Schoenfeld's `θ(t) < 1.001093 t` (§3.2; `0.001093 ≤ 1/914`) and Dusart's `θ(t) ≥ t − 0.2 t/log² t`
  for `t > 3 594 641` (§3.3) applied to `θ(P⁻)`; for `P ≥ 2`, the same with `1/5` replaced by `4`,
  from Dusart's `η₂ = 3.965 ≤ 4`. Both under the hypotheses of §§3.2–3.3.

*Needs:* §3.2; §3.3; Mathlib `Chebyshev.theta_le_log4_mul_x`, Abel summation, improper integrals.

**Checks.**

- `f(t) = t^{−2}`, `P = 2`, the `4` version: `∑_{p ≥ 2} (log p)/p² = 0.4931` (the first six primes give
  `0.1733 + 0.1221 + 0.0644 + 0.0397 + 0.0198 + 0.0152 = 0.4345`), and the bound is
  `(1 + ε)/2 + ε/2 + 4/(2 log² 2) = 0.5005 + 0.0005 + 4.16 = 4.66`.
- The exact Abel form at `f = 1_{[P, Q)}` is excluded (`f` is not `C¹`); with `f` a `C¹` cap of
  it, `∫ θ f'` concentrates at `Q` and the identity reduces to `θ(Q⁻) − θ(P⁻) = ∑_{P ≤ p < Q} log p`.
- `f(t) = 1/t` is excluded: `t f(t) → 1 ≠ 0` and the integral diverges, as does the series
  `∑ (log p)/p`.

### 4.5 Sums of primes (Treviño)

Let `a ≥ 2`, `k₁, k₂ ≥ 0` with `x − k₂ x/log x ≤ θ(x) ≤ x + k₁ x/log x` for all `x ≥ a`, and `C`
with `∫ₐˣ t/log³ t dt ≤ C x²/log² x` for all `x ≥ a`. Then there are explicit `c₁ = c₁(a, k₁, k₂, C)`
and `c₂ = c₂(a, k₁, k₂, C)`, given by Treviño's proof (`trevino-2012` lines 481–496 and the
following page), with
`x²/(2 log x) + c₁ x²/log² x ≤ ∑_{p ≤ x} p ≤ x²/(2 log x) + c₂ x²/log² x` for all `x ≥ a`
(Lemma 3.4, lines 466–470). Route: `∑_{p ≤ x} p = x θ(x)/log x − ∫₂ˣ θ(t)(log t − 1)/log² t dt`
(Abel summation against `t/log t`), the main term from `θ(t) = t`, and the two error integrals
bounded by `k₁, k₂, C`. The rows of Table 1 (`(a, c₁, c₂)`, lines 471–480) are the instances at the
rows of Table 2 (`(a, k₁, k₂, C)`, lines 493–496), under *TrevinoTables* and the `θ`-bounds of
§§3.2–3.3 at the rows' thresholds.

*Needs:* §3.2; §3.3; §1.6; Mathlib Abel summation.

**Checks.**

- The row `(315 437, 0.205448, 0.330479)` applied at `x = 10⁴` (below its threshold, as a
  plausibility check): `x²/(2 log x) = 5 428 681`, `x²/log² x = 1 178 823`, so the bracket is
  `[5 670 860, 5 818 254]`, and `∑_{p ≤ 10⁴} p = 5 736 396` lies inside.
- `c₁ < 1/4 < c₂` in every row: the second-order term of `∑_{p ≤ x} p` is `x²/(4 log² x)`, as the
  expansion of `∫ t/log t dt` shows, and the rows bracket `1/4`.
- With `k₁ = k₂ = 0` and `C = 0` (the hypothetical `θ(x) = x`) the proof gives
  `c₁ = c₂ = 1/4 − (lower-order correction)`, so the bracket collapses onto the main terms.

### 4.6 Sums of prime powers (Deléglise–Nicolas)

Write `π_r(x) = ∑_{p ≤ x} p^r` for real `r ≥ 0`.

- General bounds (`deleglise-nicolas-2019-landau` lines 613–705, Proposition 2.5): let
  `0 < α ≤ 1` and `x₁ ≥ 89 967 803` with `|θ(x) − x| < α x/log³ x` for `x ≥ x₁`. For `r ≥ 0.6` and
  `x ≥ x₁`,
  `π_r(x) ≤ C₀ + x^{r+1}/((r+1) log x) + x^{r+1}/((r+1)² log² x) + 2 x^{r+1}/((r+1)³ log³ x) +
  (α(51r⁴ + 176r³ + 222r² + 120r + 23) + 168) x^{r+1}/(24 (r+1)⁴ log⁴ x)`,
  with `C₀` the explicit constant of display (2.15) built from `π_r(x₁)`, `θ(x₁)` and `li(x₁^{r+1})`;
  for `0.06 ≤ r ≤ r₀(α)` the lower bound with the last term replaced by
  `−(α(2r⁴ + 7r³ + 9r² + 5r + 1) − 6) x^{r+1}/((r+1)⁴ log⁴ x)`, and for `r > r₀(α)` by
  `−(α(51r⁴ + 176r³ + 222r² + 120r + 23) − 168) x^{r+1}/(24(r+1)⁴ log⁴ x)`, where `r₀(α)` is the
  positive root of `3r⁴ + 8r³ + 6r² − 24/α − 1 = 0` (`r₀(1) = 1.1445`, `r₀(0.5) = 1.4377`,
  `r₀(0.15) = 2.1086`) and `C₀` is display (2.18). Route: Abel summation of `θ` against
  `t^r/log t` and the expansion of `li(x^{r+1})`.
- Instances (Corollaries 2.6–2.8, lines 706–767), under the Dusart 2018 rows of §3.3 (`α = 1`,
  `x₁ = 89 967 803`; `α = 0.15` with `x₁ = 19 035 709 163` from Axler's `π` bound, an instance of
  §3.5's Theorem 1.1 through §0.4) and the finite-range proposition *DelegliseNicolasRange* (the
  inequalities below `x₁`, checked prime by prime as at lines 729–731, 748–750):
  `π₁(x) ≤ x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 107 x²/(160 log⁴ x)` for `x ≥ 110 117 910`;
  `π₁(x) ≥ x²/(2 log x) + x²/(4 log² x) + x²/(4 log³ x) + 3 x²/(20 log⁴ x)` for `x ≥ 905 238 547`;
  `π₂(x) ≤ x³/(3 log x) + x³/(9 log² x) + 2x³/(27 log³ x) + 1181 x³/(648 log⁴ x)` for `x ≥ 60 173`;
  `π₂(x) ≤ (x³/(3 log x))(1 + 0.385/log x)` for `x ≥ 60 297`;
  `π₂(x) ≥ x³/(3 log x) + x³/(9 log² x) + 2x³/(27 log³ x) − 1069 x³/(648 log⁴ x)` for `x ≥ 1 091 239`;
  `π₂(x) ≥ ∑_{p < x} p² ≥ (x³/(3 log x))(1 + 0.248/log x)` for `x > 32 321`;
  `π₃(x) ≤ 0.271 x⁴/log x` for `x ≥ 664`, `π₄(x) ≤ 0.237 x⁵/log x` for `x ≥ 200`,
  `π₅(x) ≤ 0.226 x⁶/log x` for `x ≥ 44`; and `π_r(x) ≤ (log 3/3)(1 + (2/3)^r) x^{r+1}/log x` for
  `x > 1` and `r ≥ 5`.

*Needs:* §3.3; §3.5; §0.1; §0.4; §1.3; Mathlib Abel summation.

**Checks.**

- `r = 1`, `α = 0.15`: the fourth coefficient is `(0.15 · 592 + 168)/384 = 0.66875 = 107/160`, and the
  lower one `−(0.15 · 24 − 6)/16 = 3/20`: the displayed corollary for `π₁` is the general bound at
  these parameters.
- `r = 2`, `α = 1`: `r₀(1) = 1.1445 < 2`, so the second lower form applies:
  `(51·16 + 176·8 + 222·4 + 120·2 + 23 − 168)/(24 · 81) = 3207/1944 = 1069/648`, and the upper
  coefficient `(3375 + 168)/1944 = 1181/648`.
- `π₅(3) = 32 + 243 = 275 = (log 3/3)(1 + (2/3)⁵) · 3⁶/log 3`: equality at `x = 3`, the case that
  fixes the constant of the `r ≥ 5` bound (line 795).
- `π₃(t) log t/t⁴` crosses `0.271` at `t = 663.35` (lines 785–787), so `664` is the least integer
  threshold; at `x = 663` the bound fails.
- At `r = 0` the bound would be about `π(x)`, but `r ≥ 0.6` is required: the constant `C₀` and the
  fourth-order term are tuned for `r` bounded away from `0`.

### Examples

- `∑_{n ≤ 10} Λ(n)/n = 1.6947` against `log 10 − γ = 1.7254`.
- `∑_{p ≤ 1000} 1/p = 2.1981` against `log log 1000 + B = 2.1942`.
- `∑_{p ≤ 10⁴} p = 5 736 396`; `π₅(3) = 275`.

### Dependencies

Layers 0, 1, 3; AnalyticNumberTheoryPartI §§0.8, 0.19; ZerosOfLFunctions §§5.6, 8.5; Tau Ceti
`mertensConstant`; the gaps `classical-zero-free-constants`, `lehman-weighted-zero-sum`.

## Layer 5: the n-th prime

Throughout, `p_n = Nat.nth Nat.Prime (n − 1)` for `n ≥ 1`, so `p_1 = 2`, `π(p_n) = n`
(Tau Ceti `primeCounting_nth_prime`), and `θ(p_n) = ∑_{i=1}^n log p_i`.

### 5.1 Inversion of prime-counting bounds

- If `π(x) < x/(log x − c)` for all `x ≥ x₁`, then `p_n > n (log p_n − c)` for every `n` with
  `p_n ≥ x₁`; if `π(x) > x/(log x − c')` for all `x ≥ x₁`, then `p_n < n (log p_n − c')` for such `n`.
- Bootstrap: from `n(log p_n − c) < p_n < n(log p_n − c')` with `c' < log p_n`, one gets
  `log p_n > log n + log(log n − c)` and `log p_n < log n + log(log p_n − c')`, hence the explicit
  two-sided `n(log n + log(log n − c) − c) < p_n < n(log n + log(log n + log(log n − c) − c') − c')`.
- From `θ`: if `|θ(x) − x| ≤ κ x/log x` for `x ≥ a`, then for `p_n ≥ a`,
  `|∑_{i ≤ n} log p_i − p_n| ≤ κ p_n/log p_n`, the form Dusart's proof uses (`dusart-1999-mc` lines
  119–125).

*Needs:* Mathlib `Nat.nth`, `Nat.primeCounting'_nth_eq`, `Nat.prime_nth_prime`; Tau Ceti
`primeCounting_nth_prime`; §3.5.

**Checks.**

- Dusart's `c = 1` (`π(x) > x/(log x − 1)` for `x > 5393`) and `c' = 1.1` (`π(x) ≤ x/(log x − 1.1)`
  for `x > 60 184`) at `n = 10⁴`: `p_n = 104 729`, `log p_n = 11.559`, and
  `n(log p_n − 1.1) = 104 590 ≤ 104 729 < n(log p_n − 1) = 105 590`.
- The index shift: `Nat.nth Nat.Prime 0 = 2 = p_1`; a statement `p_n ≥ n log n` transported without
  the shift would assert `Nat.nth Nat.Prime n ≥ n log n`, true but weaker, while the shifted lower
  bounds below are sharp at small `n`.
- `n = 1`: `p_1 = 2`, `π(2) = 1`, `θ(2) = log 2`.

### 5.2 Rosser and Rosser–Schoenfeld

- `rosser-schoenfeld-1962` lines 224–241, Theorem 3 and its Corollary, under the hypotheses of §3.5
  and *RosserSchoenfeld1962Range*: `n(log n + log log n − 3/2) < p_n` for `n ≥ 2`;
  `p_n < n(log n + log log n − 1/2)` for `n ≥ 20`; `n log n < p_n` for `n ≥ 1`;
  `p_n < n(log n + log log n)` for `n ≥ 6`.
- Rosser (`rosser-1938`, uncertified, Theorems 1–2; `rosser-1941`, uncertified, Theorems 1–3): `p_n > n log n`
  for `n ≥ 1`; `n(log n + log log n − 10) < p_n < n(log n + log log n + 8)` for `n > 1`; and
  `n(log n + log log n − 4) < p_n < n(log n + log log n + 2)` for `n ≥ 55`. Each follows from the
  Rosser–Schoenfeld statements above for `n ≥ 20` and from the list of primes below.

*Needs:* §5.1; §3.5; §1.3.

**Checks.**

- `n = 6`: `p_6 = 13 < 6(log 6 + log log 6) = 6(1.7918 + 0.5832) = 14.25`; `n = 5`: `p_5 = 11 >
  5(1.6094 + 0.4759) = 10.43`: the threshold `6` is sharp.
- `n = 20`: `p_20 = 71 < 20(2.9957 + 1.0972 − 0.5) = 71.86`; `n = 19`: `p_19 = 67 > 19(2.9444 +
  1.0799 − 0.5) = 66.96`: the threshold `20` is sharp.
- `n = 2`: `2(0.6931 − 0.3665 − 1.5) = −2.35 < 3 = p_2`; `n = 1`: `1 · log 1 = 0 < 2`.
- Rosser 1941 at `n = 55`: `p_55 = 257` lies in `(76.7, 406.7)`.

### 5.3 Robin, Massias–Robin and Dusart

- Robin (`robin-1983` lines 81–84, Théorème 8 and the displayed consequences): under the hypotheses
  of §3.2 and *RosserSchoenfeld1962Range*: `p_k ≥ k(log k + log log k − 1.0072629)` for `k ≥ 2`;
  `p_k ≥ k(log k + log log k − 1)` for `k ≥ 2` with `p_k ≤ 10¹¹` (a finite statement, part of
  *DusartThesisRange*); `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`.
- Massias–Robin (`massias-robin-1996`, Théorème A; the extraction is a scan and the statement is
  cited by its theorem): the constant `1` is admissible in the lower bound for `p_k ≤ e⁵⁹⁸` and for
  `p_k ≥ e¹⁸⁰⁰`, the intermediate range being the one their method could not then close (lines
  163–166 describe the iteration over `[600, 1800]`).
- Dusart (`dusart-1999-mc` lines 116–125, Theorem 3; line 168): under `RH(545 439 823)`, the
  hypotheses of §3.3 and *DusartThesisRange*: `p_k ≥ k(log k + log log k − 1)` for every `k ≥ 2`;
  `p_k ≤ k(log k + log log k − 0.9484)` for `k ≥ 39 017`. Route for the first: Robin's finite
  statement for `p_k ≤ 10¹¹`; for `10¹¹ ≤ p_k ≤ e⁵⁰⁰`, §5.1 with Schoenfeld's `θ` bound
  (`θ(p_k) − p_k ≤ 0.0077629 p_k/log p_k` on that range, from §3.2's Theorem 11) and
  `p_k ≤ k log p_k`; beyond, Dusart's `0.905·10⁻⁷` of §3.3.

*Needs:* §5.1; §3.2; §3.3; §1.3.

**Checks.**

- `k = 2`: `2(0.6931 − 0.3665 − 1) = −1.35 ≤ 3`; `k = 10⁴`: `10⁴(9.2103 + 2.2203 − 1) = 104 306 ≤
  104 729`, and the upper `10⁴(9.2103 + 2.2203 − 0.9484) = 104 822 ≥ 104 729` (the upper bound's
  threshold `39 017` is not met at `10⁴`, where it happens to hold).
- The upper bound with `−0.9484` at `k = 10`: `10(2.3026 + 0.8340 − 0.9484) = 21.9 < 29 = p_10`: a
  threshold is necessary.
- `1.0072629 > 1 > 0.9484 > 0.9385`: the lower constants decrease toward `1` from above and the
  upper ones toward `1` from below, consistent with Cipolla's `−1`.

### 5.4 Cipolla's expansion

`cipolla-1902` (waived, Matematiche (Napoli) 3, pp. 132–166): as `n → ∞`,
`p_n = n (log n + log log n − 1 + (log log n − 2)/log n − ((log log n)² − 6 log log n + 11)/(2 log² n)
+ o(1/log² n))`. Route: invert `π(x) = Li x + O(x exp(−c √log x))` (ZerosOfLFunctions §8.5 at
`K = ℚ`) at `x = p_n`, using the expansion of `Li` (§8.9 there) and the bootstrap of §5.1.

*Needs:* ZerosOfLFunctions §§8.5, 8.9; §5.1.

**Checks.**

- `n = 10⁶`: `log n = 13.8155`, `log log n = 2.6258`; the four terms give `n(15.4413 + 0.04530 −
  0.005608) = 15 481 000`, against `p_{10⁶} = 15 485 863`: relative error `3·10⁻⁴`, below
  `1/log² n = 5.2·10⁻³`.
- Dropping the `−1` changes the estimate by `n = 10⁶`, far outside the error; the third term is
  positive since `log log n > 2` for `n > e^{e²} = 1619`.
- The expansion is asymptotic, not a bound: at `n = 10` it gives `10(2.3026 + 0.8340 − 1 − 0.5063 −
  0.1535) = 14.8` against `p_10 = 29`.

### 5.5 Sums of the first n primes

- Axler (`axler-2019` lines 145–150, Theorems 1.6–1.7; lines 159–166, Theorems 1.8–1.9), with
  `B_n = n p_n/2 − ∑_{k ≤ n} p_k` (line 337), under the hypotheses of §3.5 (Axler's `π` bounds) and
  *AxlerRange*:
  `B_n > n²/4 + n²/(4 log n) − n²(log log n − 2.9)/(4 log² n)` for `n ≥ 6 309 751`;
  `B_n < n²/4 + n²/(4 log n) − n²(log log n − 4.42)/(4 log² n)` for `n ≥ 256 376`;
  `∑_{k ≤ n} p_k < (n²/2)(log n + log log n − 3/2 + (log log n − 5/2)/log n −
  ((log log n)² − 7 log log n + 13.567)/(2 log² n))` for `n ≥ 1 897 700`;
  `∑_{k ≤ n} p_k > (n²/2)(log n + log log n − 3/2 + (log log n − 5/2)/log n −
  ((log log n)² − 7 log log n + 15.741)/(2 log² n))` for `n ≥ 2`.
  Route: `∑_{k ≤ n} p_k = n p_n − ∫₂^{p_n} π(t) dt` and `B_n = ∫₂^{p_n} π(t) dt − n p_n/2`, with the
  `π` bounds of §3.5 and the `p_n` bounds of §5.3.
- De Koninck–Letendre (`de-koninck-letendre-2020` lines 489–500, Lemma 4.8), under the hypotheses of
  §5.2: `∑_{i ≤ k} log p_i ≤ k(log k + log log k − 1/2)` for `k ≥ 5`, and
  `∑_{i ≤ k} log log p_i ≥ k(log log k + (log log k − 3/2)/log k)` for `k ≥ 6`.

*Needs:* §3.5; §5.2; §5.3; §1.3; Mathlib Abel summation.

**Checks.**

- `B_9 = 9 · 23/2 − 100 = 3.5 > 0` and `B_8 = 8 · 19/2 − 77 = −1`, consistent with `B_n > 0` for
  `n ≥ 9` (line 142).
- Theorem 1.9 at `n = 10`: the right side is `50 · (1.6366 − 0.7235 − 0.9996) = −4.3 < 129 =
  ∑_{k ≤ 10} p_k`; the lower bound is trivial for small `n` and sharp only for large `n`.
- De Koninck–Letendre at `k = 5`: `∑ log p_i = log 2310 = 7.745 ≤ 5(1.6094 + 0.4759 − 0.5) = 7.93`;
  at `k = 4`: `log 210 = 5.347 > 4(1.3863 + 0.3266 − 0.5) = 4.85`: the threshold `5` is sharp.
- The main term `(n²/2) log n` of `∑ p_k` is consistent with `p_k ∼ k log k`: `∑_{k ≤ n} k log k ∼
  (n²/2) log n`.

### Examples

- `p_{10⁴} = 104 729`, `p_{10⁶} = 15 485 863`.
- `∑_{k ≤ 10} p_k = 129`, `B_9 = 3.5`.
- The sharp thresholds `6`, `20`, `5`.

### Dependencies

Layers 0, 1, 3; ZerosOfLFunctions §§8.5, 8.9; Mathlib `Nat.nth`; Tau Ceti `primeCounting_nth_prime`.

## Layer 6: primes in arithmetic progressions

Throughout, `q ≥ 1`, `a : ZMod q`, and `ψ(x; q, a)`, `θ(x; q, a)`, `π(x; q, a)` are the carriers of
AnalyticNumberTheoryPartI §0.2; `φ` is `Nat.totient`.

### 6.1 The general theorem for a modulus

- *Shape of Ramaré–Rumely and Dusart* (`ramare-rumely-1996` lines 58–65, Theorem 1, and its
  Theorem 4.3.2; `dusart-2002` lines 989–1012, Theorem 5). Let `q > 1`, `H > 1000` with
  `GRH(q, H)`, and `R` with a zero-free region for the characters modulo `q` in McCurley's form
  (`mccurley-1984` lines 56–59, Theorem 1.1): no `L(s, χ)`, `χ` modulo `q`, vanishes at
  `s = σ + it` with `σ > 1 − 1/(R log max(q, q|t|, 10))`, except possibly one simple real zero of a
  real character, excluded here by hypothesis; and let `C₁(q)` be the constant of Dusart's display
  (3) bounding the zero count of the characters modulo `q`. Then with `X = √(log x/R)` and
  `ε(X)` the explicit function of Dusart's display (lines 999–1002), proportional to
  `√q X^{1/2} e^{−X}/(φ(q) C₁(q))`, for every `x` with `X > X₄(q, H)` (the explicit threshold of
  lines 992–998),
  `max_{1 ≤ y ≤ x} |ψ(y; q, a) − y/φ(q)| < x ε(X)` for every unit `a`; and the same for `θ` with
  the correction of §0.3 applied classwise. Each row `(q, ε, x₀)` of Ramaré–Rumely's Table 1 or of
  Dusart's table is a table proposition (§1.6) asserting that the function at the row's data is at
  most `ε` for `x ≥ x₀`, and the theorem at a row reads
  `max_{1 ≤ y ≤ x} |ψ(y; q, a) − y/φ(q)| ≤ ε x/φ(q)` and the same for `θ`, for `x ≥ x₀`.
- *Shape of McCurley* (`mccurley-1984` lines 56–62, Theorem 1.1; lines 122–130, Theorem 1.2): with
  `R = 9.645908801`, define *IsExceptionalModulus* `q` as: some real character `χ` modulo `q` has a
  real zero `β` with `β > 1 − 1/(R log q)`. For `q` not exceptional, `a` a unit, and `(ε, b)` a row
  of McCurley's Table 1 with its `c`, `|ψ(x; q, a) − x/φ(q)| < ε x/φ(q)` and
  `|θ(x; q, a) − x/φ(q)| < ε x/φ(q)` for `x ≥ exp(c log² q)` and `q` above the row's modulus bound;
  the rows are the table proposition *McCurleyTable* and the region is
  `gap:classical-zero-free-constants` in its Dirichlet form.
- Route for both: orthogonality `φ(q) ψ(x; q, a) = ∑_χ conj χ(a) ψ(x, χ)`, the smoothed explicit
  formula of §2.1 for each `ψ(x, χ)` (ZerosOfLFunctions §8.6 at `K = ℚ` through
  AnalyticNumberTheoryPartI §0.30, extended to the kernel class), `GRH(q, H)` for the low zeros,
  the region and `gap:lehman-weighted-zero-sum` for the high zeros, and
  `gap:explicit-zero-count-error` in the Dirichlet form for the counts.

*Needs:* §2.1; §0.3; §1.2; §1.6; AnalyticNumberTheoryPartI §§0.2, 0.30; ZerosOfLFunctions §8.6;
`gap:grh-up-to-height`; `gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`;
`gap:lehman-weighted-zero-sum`; Mathlib `Nat.totient`, `DirichletCharacter.sum_char_inv_mul_char_eq`.

**Checks.**

- The row `(1, 0.000213, 10¹⁰)` (`ramare-rumely-1996` line 67) at `x = 10¹⁰`: `0.000213 · 10¹⁰ =
  2.13·10⁶ ≥ |ψ(10¹⁰) − 10¹⁰| = 42 120`; the row `(8, 0.002811, 10¹⁰)` at `a = 3`, `x = 10¹⁰`:
  the bound is `0.002811 · 10¹⁰/4 = 7.0·10⁶` for a class holding about `2.5·10⁹` of the mass.
- `q = 1` is the `ψ` statement of Layer 3 with `GRH(1, H) = RH(H)`.
- For `a` not a unit the statement is false: `ψ(x; 2, 0) = ∑_{2^k ≤ x} log 2 ≈ log x` while
  `x/φ(2) = x`; the unit hypothesis is in every statement.
- The uniform rows `k ≤ 13: 0.004560` and `k ≤ 72: 0.023269` (lines 69–74) are weaker than the
  individual rows; both are asserted and no contradiction arises.

### 6.2 Ramaré–Rumely's tabulation and its consequences

Under *RamareRumelyTabulation* (§1.5): for `k` in Ramaré–Rumely's Table 1, `l` a unit modulo `k`,
and `x₀ ≤ x ≤ 10¹⁰`, `max_{1 ≤ y ≤ x} |θ(y; k, l) − y/φ(k)| ≤ 2.072 √x ≤ (2.072 φ(k)/√x₀) x/φ(k)`
(`ramare-rumely-1996` lines 85–87), so the row `(k, 2.072 φ(k)/√x₀, x₀)` is admissible on
`[x₀, 10¹⁰]`; for `k = 5` or `k ≥ 7` the constant `1.745` for `ψ` may be replaced by `1.000` (lines
88–90, a sharper tabulation proposition *RamareRumelyTabulationSharp*).

*Needs:* §1.5; AnalyticNumberTheoryPartI §0.2.

**Checks.**

- `k = 1`, `x₀ = 10⁶`: `2.072/10³ = 0.002072`, and `|θ(10⁶) − 10⁶| = 1516 ≤ 2.072 · 10³ = 2072`.
- `k = 8`, `x₀ = 10¹⁰`: `2.072 · 4/10⁵ = 8.3·10⁻⁵`, far below the analytic row `0.002811`: on
  `[10¹⁰, 10¹⁰]` the tabulation is the better bound, and the analytic row takes over above `10¹⁰`.
- At `x = 1` the maximum is over `y ∈ [1, 1]`, `θ(1; k, l) = 0` and `|0 − 1/φ(k)| ≤ 1 ≤ 2.072`.

### 6.3 Bennett–Martin–O'Bryant–Rechnitzer

Under `GRH(q, 10⁸/q)` for all `q ≤ 400 000` (§1.2's bridge from ComputationalNumberTheory §4.22),
no real zero in `(0, 1)` for conductors at most `400 000` (ComputationalNumberTheory §4.24),
Kadiri's region for `L(s, χ)` with `R = 6.4355` and its exceptional clause
(`gap:classical-zero-free-constants`), the Dirichlet zero count (`gap:explicit-zero-count-error`),
and *BMORTables* (`bennett-martin-obryant-rechnitzer-2018` lines 165–195, Theorems 1.1–1.3): for
`q ≥ 3` and `a` a unit modulo `q`, with
`c₀(q) = 1/840` for `3 ≤ q ≤ 10⁴` and `1/160` for `q > 10⁴`, and `x₀(q) = 8·10⁹` for `3 ≤ q ≤ 10⁵`
and `exp(0.03 √q log³ q)` for `q > 10⁵`:

- `|ψ(x; q, a) − x/φ(q)| < c_ψ(q) x/log x` for `x ≥ x_ψ(q)`, with `c_ψ(q) ≤ c₀(q)` and `x_ψ(q) ≤ x₀(q)`;
- `|θ(x; q, a) − x/φ(q)| < c_θ(q) x/log x` for `x ≥ x_θ(q)`, with the same bounds;
- `|π(x; q, a) − Li x/φ(q)| < c_π(q) x/log² x` for `x ≥ x_π(q)`, with the same bounds;

where for `3 ≤ q ≤ 10⁵` the constants are the rows of *BMORTables* and for `q > 10⁵` they are
`c₀(q), x₀(q)` themselves. Route: §6.1 in the McCurley shape with Kadiri's region, the explicit
formula with the paper's kernel, and, for `q ≤ 10⁵`, the finite computations recorded in
*BMORTables*; the `θ` form by §0.3 classwise, the `π` form by the progression analogue of §0.4
(Abel summation of `θ(·; q, a)`).

*Needs:* §6.1; §0.3; §0.4; §1.2; §1.6; ComputationalNumberTheory §§4.22, 4.24;
`gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`.

**Checks.**

- `q = 3`, `a = 1`, `x = 8·10⁹`: the bound is `8·10⁹/(840 · 22.8) = 4.2·10⁵` for a class of mass
  `4·10⁹`, a relative error `10⁻⁴`, consistent with Ramaré–Rumely's row for `k = 3` at `10¹⁰`.
- At `q = 10⁴ + 1` the constant jumps from `1/840` to `1/160` and at `q = 10⁵ + 1` the threshold
  from `8·10⁹` to `exp(0.03 √q log³ q) = exp(0.03 · 316.2 · 1527) = exp(14 490)`: the two regimes
  are the two cases of the paper, not a continuous function.
- `q = 2` is excluded (`q ≥ 3`): the only unit class modulo `2` is the odd numbers, for which the
  statement reduces to Layer 3 after removing the powers of `2`.
- The `π` bound uses `Li x/φ(q)`, not `li x/φ(q)`: the two differ by `liTwo/φ(q) ≈ 1/φ(q)`, which is
  below `c_π(q) x/log² x` for `x ≥ x_π(q)`, so either normalisation satisfies the inequality with
  the printed constants, and the statement follows the paper's `Li`.

### 6.4 Ramaré's Mertens theorem in progressions

Under `GRH(q, 2500)` for `q` in Rumely's list (§1.2), *RamareRumelyTabulation*, *RamareRumelyTable1*,
*Dusart2002Table* and *Ramare2002Tabulation* (§1.5): for every `q` in Rumely's list and every unit
`a` modulo `q`,

- `|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ 1` for every `x ≥ 1` (`ramare-2002` lines 181–187,
  Corollaire 5, whose maximum `0.978…` is attained at `q = 6`, `a = 1`, `x = 1`);
- with the per-modulus table *Ramare2002Tables* (the values `ε♯(q)` of the paper's final tables),
  `|logPsiAP q a x − log x/φ(q) − C(q, a)| ≤ ε♯(q) ≤ 2/9` for `x ≥ 182` (lines 174–180, Corollaire 4).

Route: for `x ≤ 10⁵` the tabulation gives `|…| ≤ 1/√x ≤ 1`; for `x > 10⁵` the exact transfer of
§0.7 with `|E(t)| ≤ 1.745 √t` on `[x, 10¹⁰]` (the tabulation), the rows of Ramaré–Rumely's Table 1
on `[10¹⁰, 10¹⁰⁰]` and Dusart's decaying `ε(X)` beyond; the tail integral is then
`≤ 1.745 (2/√x) + ∑_{rows} ε_i log(x_{i+1}/x_i)/φ(q) + (tail)`, below `1 − 1/√x` for `x > 10⁵`.

*Needs:* §0.2; §0.7; §6.1; §6.2; §1.2; §1.5; §1.6.

**Checks.**

- `q = 6`, `a = 1`, `x = 1`: `logPsiAP 6 1 1 = 0`, so the quantity is `|C(6, 1)|`, and the closed form
  gives `C(6, 1) = −(1/2)(γ + log 2 + log 3/2 + conj χ(1) (L'/L)(1, χ))` with `χ` the character
  modulo `6` induced from the one modulo `3`; its value `−0.978…` is the paper's extremum.
- `x = 10⁵`, `q = 6`: the tabulation gives `1/√(10⁵) = 0.0032`, and the transfer tail at `x = 10⁵`
  with `1.745 √t` on `[10⁵, 10¹⁰]` contributes at most `3.49/√(10⁵) = 0.011`.
- `q = 1` is not in Rumely's list and not asserted; its analogue is §4.2.

### 6.5 The least prime in a progression under the generalised Riemann hypothesis

- The cyclotomic discriminant: `|disc ℚ(ζ_q)| = q^{φ(q)}/∏_{p ∣ q} p^{φ(q)/(p − 1)}` for `q ≥ 3`
  (`bach-sorenson-1996` lines 926–927), from the conductor–discriminant formula
  `|disc| = ∏_χ f_χ` over the characters modulo `q` (LFunctions Layer 4 conductors); in particular
  `log |disc ℚ(ζ_q)| ≤ φ(q) log q` and `≥ (φ(q)/2) log(q/2)`.
- Bach–Sorenson's explicit Chebotarev bound at a cyclotomic field (lines 802–811, Theorem 5.1 at
  `E = ℚ(ζ_q)`, `K = ℚ`): under `DirichletGRH χ` for every `χ` modulo `q` (AnalyticNumberTheoryPartI
  §1.6), for every unit `m` modulo `q` there is a prime `p ≡ m (mod q)` with
  `p ≤ (4 log |disc ℚ(ζ_q)| + 2.5 φ(q) + 5)²`. Route: the weighted explicit formula of §2.1 for
  `∑_χ conj χ(m) ψ(x, χ)` with the Lagarias–Odlyzko kernel of the paper's §4, the zeros on the line
  by hypothesis, the Dirichlet zero count (`gap:explicit-zero-count-error`) summed over the
  characters through the discriminant, and the removal of prime powers; the Frobenius of `p` in
  `Gal(ℚ(ζ_q)/ℚ) = (ℤ/q)^×` is the class of `p`.
- The least prime (lines 921–928, Theorem 5.3): under the same hypothesis, for `q ≥ 2` and `m` a
  unit, some prime `p ≡ m (mod q)` satisfies `p < 2 (q log q)²`. Route: for `q ≥ 1000` the previous
  item with the sharper constants of the paper's Table 3 (the case `K = ℚ`), recorded as the table
  proposition *BachSorensonTable*, together with `log |disc| ≤ φ(q) log q` and `φ(q) > 170` (lines
  923–928); for `2 ≤ q < 1000` the finite-range proposition *BachSorensonRange*.

*Needs:* §2.1; §0.3; AnalyticNumberTheoryPartI §§0.2, 1.6; LFunctions Layer 4; Mathlib
`NumberField.discr`, `IsCyclotomicExtension`; `gap:explicit-zero-count-error`;
*BachSorensonTable*, *BachSorensonRange*.

**Checks.**

- `q = 3`: `|disc ℚ(ζ₃)| = 3 = 3²/3^{2/2}`; `q = 4`: `|disc| = 4 = 4²/2^{2/1}`; `q = 5`: `5³ = 5⁴/5^{4/4}`;
  `q = 12`: `12⁴/(2^{4/1} · 3^{4/2}) = 20736/144 = 144`.
- `q = 3`, `m = 2`: the bound `2 (3 log 3)² = 21.7` and the prime `2`; `m = 1`: the prime `7 < 21.7`.
- `q = 1` is excluded: the bound is `2 (log 1)² = 0`; `q = 2`, `m = 1`: the bound is `2 (2 log 2)² =
  3.84` and the prime `3` satisfies it.
- `q = 10⁴`: `2 (10⁴ · 9.21)² = 1.7·10¹⁰`, while the Linnik-type truth is about `q log² q ≈ 8.5·10⁵`
  for most classes; the bound is a worst-case statement over all `m`.
- Without the hypothesis the statement is open; with `m` not a unit it is false (no prime `≡ 0
  (mod 4)`), so the unit hypothesis is in the statement.

### 6.6 Kadiri's intervals in progressions

Under the McCurley shape of §6.1 (region, counts, *McCurleyTable* or Kadiri's own tables), for
`q ≥ 3` not exceptional (§6.1's *IsExceptionalModulus* with Kadiri's constant), `a` a unit modulo
`q`, and `ε > 0`, there is `α > 0` such that for every `x ≥ α log² q` the interval `[eˣ, e^{x+ε}]`
contains a prime `p ≡ a (mod q)` (`kadiri-2008` lines 128–131, Theorem 1.1). Route: with the bound
`|ψ(y; q, a) − y/φ(q)| < ε' y/φ(q)` for `y ≥ exp(c log² q)` (§6.1) and `ε' < (1 − e^{−ε})/(2 e^{ε})`,
`ψ(e^{x+ε}; q, a) − ψ(eˣ; q, a) > 0` for `x ≥ c log² q`, and the prime powers contribute less than
the margin once `eˣ` exceeds an explicit bound in `q`; so `α = max(c, c')` with `c'` from the
prime-power removal. The values `α(q₀, ε)` of Table 1 (*Kadiri2008Table*, lines 140–162) are the
quantitative instances: for `q ≥ q₀` and `x ≥ α(q₀, ε) log² q` the interval contains such a prime.

*Needs:* §6.1; §0.3; §1.6.

**Checks.**

- The row `(q₀, ε) = (5·10⁴, 1)`: `α = 6.9684`, so for `q = 10⁵` and `x ≥ 6.9684 · 132.5 = 923` the
  interval `[eˣ, e^{x+1}]` contains a prime `≡ a (mod q)`; the interval has length about `1.7 eˣ`
  and the expected number of such primes is `1.7 eˣ/(φ(q) x) > 1`, consistent.
- Along a row `α` decreases as `ε` grows (`19.228, 15.550, 12.245, 9.4357, 6.9684, 4.8430` at
  `q₀ = 5·10⁴`), as a longer interval needs a smaller `x`.
- `ε = 0` is excluded: the interval `[eˣ, eˣ]` contains a prime only if `eˣ` is one.
- For an exceptional modulus the theorem is not asserted; the exceptional zero would add a term
  `−x^β/(β φ(q))` that can cancel the main term for `x ≤ exp(c log² q)`.

### Examples

- The row `(8, 0.002811, 10¹⁰)` and the theta clause of *ModEightFiniteInput*.
- `C(6, 1) = −0.978…`, the extremum of Ramaré's Corollaire 5.
- `|disc ℚ(ζ₁₂)| = 144`.

### Dependencies

Layers 0–3; AnalyticNumberTheoryPartI §§0.2, 0.30, 1.6; ZerosOfLFunctions §8.6; LFunctions Layer 4;
ComputationalNumberTheory §§4.22, 4.24; the gaps `grh-up-to-height`, `classical-zero-free-constants`,
`explicit-zero-count-error`, `lehman-weighted-zero-sum`.

## Layer 7: short intervals containing a prime, unconditionally

### 7.1 Schoenfeld's interval

Under `RH(545 439 823)`, the Rosser–Schoenfeld-shape region with `R = 9.645908801`, Rosser's
zero-count triple, *DusartThesisTable*, *ButheVerified* and *Schoenfeld1976Range*: for every
`x > 2 010 759.9` the open interval `(x, x + x/16597)` contains a prime (`schoenfeld-1976` lines
668–669, Theorem 12). Route: `θ(x + h) − θ(x) ≥ h − ε(x) x − ε(x + h)(x + h) − (prime powers)`, with
`h = x/16597`; for `1.1·10⁹ ≤ x ≤ 10¹⁹` Büthe's `|θ(x) − x| ≤ 1.95 √x` and `h > 2 · 1.95 √x`; for
`x ≥ e³⁰` Dusart's row `0.978·10⁻⁵ < 1/(2 · 16597)`; the segment `2 010 759.9 < x < 1.1·10⁹` is the
paper's table check in *Schoenfeld1976Range*.

*Needs:* §3.2; §3.3; §0.3; §1.3; §1.6.

**Checks.**

- `x = 2 010 760`: `h = 121.2`, and the interval `(2 010 760, 2 010 881.2)` contains the prime
  `2 010 881`? The paper's threshold is where the gap after `2 010 733` (a maximal gap of `148`,
  `oliveira-e-silva-herzog-pardi-2014` Table 8) ends: `2 010 733 + 148 = 2 010 881`, and
  `x + x/16597 > 2 010 881` exactly for `x > 2 010 759.9`. Below the threshold, `x = 2 010 750` gives
  `(2 010 750, 2 010 871.1)`, which contains no prime.
- `x/16597 > 2 · 1.95 √x` iff `√x > 64 728`, i.e. `x > 4.19·10⁹`; with the `0.05 √x` lower bound in
  place of `1.95` on the left endpoint the crossover is `1.1·10⁹`.
- `1/(2 · 16597) = 3.01·10⁻⁵ > 0.978·10⁻⁵`: Dusart's row at `e³⁰` suffices, and `e³⁰ = 1.07·10¹³ <
  10¹⁹`, so the two ranges overlap.

### 7.2 Ramaré–Saouter's intervals

`ramare-saouter-2003` (uncertified, Theorems 1–3), under the heights stated and the Rosser–
Schoenfeld-shape region with `R = 9.645908801`, with the paper's numerical optimisation recorded
as the table proposition *RamareSaouterTable*: `(x(1 − 1/28 314 000), x]` contains a prime for
`x > 10 726 905 041` and `(x(1 − 1/204 879 661), x]` for `x ≥ e⁵³`, both from `RH(3.3·10⁹)` (implied by
`RH(3·10¹²)`); and `(x(1 − 1/14 500 755 538), x]` for `x ≥ e⁶⁰`, stated here from `RH(3·10¹²)` in
place of the unrefereed height the paper used. Route: the smoothing of §2.1 with the kernel
`(4t(1 − t))^m` over `[x(1 − Δ⁻¹), x]`, as in §7.3.

*Needs:* §7.3; §1.1; §1.6; `gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`.

**Checks.**

- At `x = e⁶⁰ = 1.14·10²⁶`, `x/Δ = 7.9·10¹⁵`, far above the largest known gap at that size (about
  `log² x = 3600`).
- `Δ = 28 314 000` at `x = 10 726 905 041`: interval length `379`, while the maximal gap below
  `1.1·10¹⁰` is `354` (after `4 652 353 957`, Table 8): consistent.
- The three rows are monotone: larger thresholds admit larger `Δ`.

### 7.3 The Kadiri–Lumley theorem and its tables

- General theorem (`kadiri-lumley-2014` lines 493–501, Theorem 2.7): let `T₀ < H` with `RH(H)`,
  `R₀` with the classical-shape region, `3/5 ≤ σ₀ < 1` with a density bound `N(σ₀, T) ≤ c₁ T + c₂
  log T + c₃`, the zero-count error, and parameters `m ≥ 1`, `u, δ, a > 0`, `Δ`, `X₀` satisfying
  the constraints (2.1). If the explicit quantity of display (2.64),
  `F₀ − B₀ X₀^{−1/2} − B₁ X₀^{−1/2} − B₂ X₀^{−1/2} − B₃(σ₀) X₀^{σ₀−1} − B₃(1 − σ₀) X₀^{−σ₀} − B₄₁ X₀^{−1/(R₀ log H)}
  − B₄₂ X₀^{−1 + 1/(R₀ log H)} − u²(eᵘ − 1) X₀^{−2} − ω(eᵘ − 1) X₀^{−1/2} − 2 ν(f, a)(1 + δ)‖f‖₁ log(eᵘ X₀ (1 + δ))/log(X₀(eᵘ − 1))`,
  is positive, then for every `x ≥ X₀` there is a prime in `(x(1 − Δ⁻¹), x)`. The `B`'s are the
  explicit functions of the parameters given in their §2, and `f = (4t(1 − t))^m` with
  `‖f‖₁ = 2^{2m} (m!)²/(2m + 1)!` (line 508).
- Kadiri–Lumley's rows (lines 28–29, Theorem 1.1; Table 2), under `RH(30 610 046 000)`, the
  classical-shape region with `R₀ = 5.69693`, Kadiri's density (`gap:explicit-zero-density`), the
  zero-count error and *KadiriLumleyTable*: for every `x₀ ≥ 4·10¹⁸` of the table and every `x > x₀`,
  `((1 − Δ(x₀)⁻¹) x, x)` contains a prime; in particular `Δ = 1 946 282 821` at `x₀ = e⁵⁹` and
  `Δ = 1 966 196 911` at `x₀ = 4·10¹⁸`.
- Cully-Hugill–Lee (`cully-hugill-lee-2022` lines 75–76, Theorem 1, with the corrected Table 2 of
  `cully-hugill-lee-2024`, uncertified), under `RH(3·10¹²)`, the region with `R = 5.573412`, the
  Kadiri–Lumley–Ng density, the zero-count error and *CullyHugillLeeTable*: for each pair `(Δ, x₀)`
  of the table, `(x(1 − Δ⁻¹), x]` contains a prime for all `x ≥ x₀`; in particular `Δ = 7.69·10¹⁰`
  at `log x₀ = 60` and `Δ = 2.07·10¹¹` at `log x₀ = 150`.

*Needs:* §2.1; §1.1; §1.6; `gap:classical-zero-free-constants`; `gap:explicit-zero-count-error`;
`gap:explicit-zero-density`; `gap:lehman-weighted-zero-sum`.

**Checks.**

- `‖f₁‖₁ = 4 · 1/6 = 2/3 = ∫₀¹ 4t(1 − t) dt`; `‖f₂‖₁ = 16 · 4/120 = 8/15`.
- At `x₀ = e⁶⁰` the three values `Δ = 2.09·10⁸` (Ramaré–Saouter's method, from the comparison table
  at `cully-hugill-lee-2022` line 85), `1.96·10⁹` (Kadiri–Lumley) and `7.69·10¹⁰` (Cully-Hugill–Lee)
  increase: the later theorems are stronger and mutually consistent.
- With `Δ ≤ 1` the interval `(x(1 − Δ⁻¹), x)` contains `(0, x)` and the statement is Bertrand-trivial;
  the constraints (2.1) force `Δ` large.
- `x₀ = 4·10¹⁸` is the verification limit of `oliveira-e-silva-herzog-pardi-2014`: below it the
  record gaps (at most `1476`) settle every such interval statement directly, which is why the
  tables start there.

### 7.4 Intervals from Chebyshev bounds

- General lemma: let `k ≥ 0`, `η ≥ 0`, `x₀ ≥ 2` with `|θ(t) − t| ≤ η t/log^k t` for all `t ≥ x₀`, and
  let `c > 0` satisfy `c (1 − η/log^k x₀) > 2η`. Then for every `x ≥ x₀` the interval
  `(x, x(1 + c/log^k x)]` contains a prime: with `y = x(1 + c/log^k x)`,
  `θ(y) − θ(x) ≥ (y − x) − η y/log^k y − η x/log^k x ≥ (c − η(2 + c/log^k x)) x/log^k x > 0`,
  using `log y ≥ log x`.
- Trudgian (`trudgian-2016` lines 229–236, Corollary 2 and Lemma 1), under the hypotheses of §3.4's
  Trudgian theorem, *FaberKadiriTable* and *TrudgianRange*: `|θ(x) − x| ≤ 0.0045 x/log² x` for
  `x ≥ e³⁵` (Faber–Kadiri's rows up to `e^{2330}`, then `ε₀`), hence `[x, x(1 + 1/(111 log² x))]`
  contains a prime for all `x ≥ 2 898 239`, the segment `2 898 239 ≤ x < e³⁵` being
  *TrudgianRange*.
- Axler (`axler-2016` lines 51–54, Theorem 1.5), under the hypotheses of §3.5's Axler theorems: for
  every `x ≥ 58 837` there is a prime in `(x, x(1 + 1.1817/log³ x)]`.
- Dusart's later intervals (`dusart-2018`, uncertified, Proposition 5.4 and Corollary 5.5, cited by
  locator): `[x, x(1 + 1/(5000 log² x))]` contains a prime for `x > 468 991 632`, and
  `[x, x(1 + 1/log³ x)]` for `x > 89 693`. Each is stated here as the instance of the lemma at
  `(c, k, x₀) = (1/5000, 2, 468 991 632)` and `(1, 3, 89 693)`, under the `θ`-bound hypothesis the
  lemma requires (`η` with `c(1 − η/log^k x₀) > 2η`); the `θ`-bounds behind them are the paper's
  and are not restated.

*Needs:* §3.3; §3.4; §3.5; §1.3; §1.6.

**Checks.**

- The lemma with Dusart's row `η = 0.2`, `k = 2`, `x₀ = 3 594 641`: the condition is `c > 0.4004`
  (`log² x₀ = 228.4`); with `c = 0.41` at `x = 10⁷` the interval `(10⁷, 10⁷(1 + 0.41/259.7)] =
  (10⁷, 10 015 787]` contains the prime `10 000 019`.
- Trudgian: at `x = 2 010 733`, the start of a maximal gap of `148`, the interval length
  `x/(111 log² x) = 2 010 733/(111 · 210.6) = 86 < 148`, so the corollary fails there and its
  threshold must exceed `2 010 795`; at `x = 4 652 353`, the start of the next maximal gap `154`,
  the length is `4 652 353/(111 · 235.7) = 178 > 154`. At the threshold `2 898 239` the length is
  `118`.
- `1/111 = 0.009009` and `2 · 0.0045 = 0.009`: the corollary is the lemma with `η = 0.0045`, `k = 2`,
  `c = 1/111`, and the condition `c(1 − η/log² x₀) = 0.0090089 > 0.009` holds with almost no margin,
  which is why the denominator is `111` and not `112`.
- Axler: at `x = 31 397`, the start of a maximal gap of `72`, the length `31 397 · 1.1817/log³ 31 397
  = 31 397 · 1.1817/1110 = 33.4 < 72`, so the statement fails there and the threshold exceeds
  `31 469`; at `x = 155 921` (maximal gap `86`) the length is `107.8 > 86`; at the threshold `58 837`
  it is `52.5`.
- Axler's `c = 1.1817` with `k = 3` requires `η < 0.59`, and Dusart's row `η = 1/2` satisfies the
  lemma's condition with `c = 1.1817` but not with `c = 1`: the interval `[x, x(1 + 1/log³ x)]` is
  not a consequence of the row `(1/2, 767 135 587)`.

### 7.5 Primes between consecutive powers

Under `gap:vinogradov-korobov-constants` (Ford's region), `RH(3·10¹²)`, Ramaré's density
(`gap:explicit-zero-density`) and the zero-count error:

- Dudek (`dudek-2016` line 63, Theorem 1.1, arXiv text; the journal version prints `33.3`): there is a
  prime between `n³` and `(n + 1)³` for every `n ≥ exp(exp(33.217))`.
- Cully-Hugill (`cully-hugill-2021` line 28, Theorem 1; line 662): there is a prime in
  `(n¹⁵⁵, (n + 1)¹⁵⁵)` for every `n ≥ 1`; and between `n³` and `(n + 1)³` for every
  `n ≥ exp(exp(33.990))`; consequently, for every real `x ≥ exp(exp(33.990))`, the interval
  `(x, x + 3(x + 1)^{2/3} + 1]` contains a prime (lines 662–664, with `X = ⌊x + 0.5⌋ + 0.5`).

*Needs:* §2.1; §3.6; §1.1; `gap:vinogradov-korobov-constants`; `gap:explicit-zero-density`;
`gap:explicit-zero-count-error`.

**Checks.**

- `exp(exp(33.217)) = exp(2.67·10¹⁴)`, so the cube statement is about integers with more than
  `10¹⁴` digits; the 155-th power statement, in contrast, holds for every `n ≥ 1` (at `n = 1`:
  `(1, 2¹⁵⁵)` contains `2`).
- A prime between `n³` and `(n + 1)³` for `n = 2`: `(8, 27)` contains `11`; the theorem does not
  claim small `n`, which are a finite check outside its scope.
- The `x`-form: `(x^{1/3} + 1)³ = x + 3x^{2/3} + 3x^{1/3} + 1`, so an interval `(x, x + 3x^{2/3}]`
  would require the prime to lie in the lower part of the cube interval; the stated form with
  `3(x + 1)^{2/3} + 1` is what the cube theorem gives.

### Examples

- Schoenfeld's threshold `2 010 759.9` from the maximal gap `148` after `2 010 733`.
- `Δ = 7.69·10¹⁰` at `x₀ = e⁶⁰`.
- `(10⁷, 10 015 400]` and the prime `10 000 019`.

### Dependencies

Layers 0–3; the gaps `classical-zero-free-constants`, `explicit-zero-count-error`,
`explicit-zero-density`, `lehman-weighted-zero-sum`, `vinogradov-korobov-constants`.

## Downstream consumers

- ExplicitMultiplicativeFunctions: Layers 3–4 (explicit `ψ`, `∑ Λ(n)/n`, `∑ 1/p`) for its explicit
  Mertens products and Möbius bounds, and the enclosures of §1.7.
- ExplicitNumberFields: Layers 3–6 (sums over primes, primes in progressions) for its least-
  primitive-root and class-number bounds.
- ErdosProgressionPowers: §0.6 proves the four finite-range inputs of AnalyticNumberTheoryPartI
  that its §0.9 declares as gaps (the Schoenfeld theta range, the Rosser–Schoenfeld prime-count
  range, the prime-product range and the theta clause of the mod-eight input), each under the
  hypotheses of §0.6.
- ClassicalArithmeticCompletion §6.34 and EffectiveClassNumbers §4.4: the two-sided dyadic bound of
  §3.5 and the explicit `p_n` bounds of Layer 5 refine their statements; nothing here depends on
  them beyond the adapter.
- Any consumer needing a prime in `(x, x(1 + δ)]`, an explicit Chebotarev or least-prime bound in a
  progression, or an explicit Mertens sum: Layers 4–7.

## Worked examples

- *The extremal point of `ψ(x)/x`.* `θ(113) = 107.069` is the sum of the logarithms of the thirty
  primes up to `113`; the prime powers `4, 8, 16, 32, 64` add `5 log 2 = 3.466`, `9, 27, 81` add
  `3 log 3 = 3.296`, `25` adds `1.609` and `49` adds `1.946`; so `ψ(113) = 117.386` and
  `ψ(113)/113 = 1.03882…`, the maximum that Rosser–Schoenfeld's `1.03883` just exceeds.
- *The remainder identity at `x = 3`.* With `θ = log 2` on `[2, 3)` and `θ(3) = log 6`, the right
  side of §0.4 is `−1.0998 + 0.3691 − 1.279 + 2.8854 + Li 3`, and `Li 3 = 1.1184`, total `1.994 ≈ 2 =
  π(3)` (Simpson's rule on `∫₂³ dt/log² t` and `∫₂³ dt/log t`).
- *A Platt–Trudgian row.* At `X = 1000`, `R = 5.573412`: `X/R = 179.4`, `(179.4)^{1.52} = 2670`,
  `exp(−1.89 √179.4) = exp(−25.32) = 1.0·10⁻¹¹`, and `461.9 · 2670 · 1.0·10⁻¹¹ = 1.2·10⁻⁵`, the row's
  `ε₀`.

## References

Every work is recorded with its status in the sources manifest; locators `<id> line N` refer to the
line-numbered texts held by the sources service.

- `rosser-schoenfeld-1962` J. B. Rosser, L. Schoenfeld, Approximate formulas for some functions of
  prime numbers, Illinois J. Math. 6 (1962).
- `rosser-schoenfeld-1975` J. B. Rosser, L. Schoenfeld, Sharper bounds for the Chebyshev functions
  θ(x) and ψ(x), Math. Comp. 29 (1975).
- `schoenfeld-1976` L. Schoenfeld, Sharper bounds for the Chebyshev functions θ(x) and ψ(x). II,
  Math. Comp. 30 (1976).
- `dusart-1998-thesis` P. Dusart, Autour de la fonction qui compte le nombre de nombres premiers,
  thèse, Limoges (1998); `dusart-1999-mc` The kth prime is greater than k(ln k + ln ln k − 1) for
  k ≥ 2, Math. Comp. 68 (1999); `dusart-1999-cr` (uncertified); `dusart-2002` Estimates of
  θ(x; k, l) for large values of x, Math. Comp. 71 (2002); `dusart-2016` Estimates of ψ, θ for large
  values of x without the Riemann hypothesis, Math. Comp. 85 (2016); `dusart-2018` Explicit
  estimates of some functions over primes, Ramanujan J. 45 (2018), uncertified.
- `faber-kadiri-2015` and `faber-kadiri-2018-corrigendum` L. Faber, H. Kadiri, New bounds for
  ψ(x), Math. Comp. 84 (2015) and its corrigendum, Math. Comp. 87 (2018).
- `trudgian-2016` T. Trudgian, Updating the error term in the prime number theorem, Ramanujan J.
  39 (2016), arXiv text.
- `platt-trudgian-2021-rh` D. Platt, T. Trudgian, The Riemann hypothesis is true up to 3·10¹²,
  Bull. LMS 53 (2021); `platt-trudgian-2021-error` The error term in the prime number theorem,
  Math. Comp. 90 (2021).
- `johnston-yang-2023` D. R. Johnston, A. Yang, Some explicit estimates for the error term in the
  prime number theorem, J. Math. Anal. Appl. 527 (2023); `fiori-kadiri-swidinsky-2023` A. Fiori,
  H. Kadiri, J. Swidinsky, Sharper bounds for the error term in the prime number theorem.
- `buthe-2016` J. Büthe, Estimating π(x) and related functions under partial RH assumptions, Math.
  Comp. 85 (2016); `buthe-2018` An analytic method for bounding ψ(x), Math. Comp. 87 (2018).
- `axler-2016` C. Axler, New bounds for the prime counting function, Integers 16 (2016);
  `axler-2019` New bounds for the sum of the first n prime numbers, J. Integer Seq. 22 (2019).
- `panaitopol-2000` L. Panaitopol, A formula for π(x) applied to a result of Koninck–Ivić, Nieuw
  Arch. Wiskd. 5/1 (2000).
- `ramare-2013` O. Ramaré, Explicit estimates for the summatory function of Λ(n)/n from the one of
  Λ(n), Acta Arith. 159 (2013), HAL text; `ramare-2016` An explicit density estimate for Dirichlet
  L-series, Math. Comp. 85 (2016); `ramare-2002` Sur un théorème de Mertens, Manuscripta Math.
  108 (2002); `ramare-rumely-1996` O. Ramaré, R. Rumely, Primes in arithmetic progressions, Math.
  Comp. 65 (1996); `ramare-saouter-2003` (uncertified); `platt-ramare-2017` (uncertified, not used).
- `vanlalngaia-2017` R. Vanlalngaia, Explicit Mertens sums, Integers 17 (2017), A11. The service's
  text of this paper has its digits mapped to letters by the font encoding (`]` for `0`, `a` for
  `1`, `b` for `2`, …, `i` for `9`); the constants cited were decoded with this map and agree with
  the published values.
- `trevino-2012` E. Treviño, The least inert prime in a real quadratic field, Math. Comp. 81 (2012).
- `deleglise-nicolas-2019-rh` and `deleglise-nicolas-2019-landau` M. Deléglise, J.-L. Nicolas, An
  arithmetic equivalence of the Riemann hypothesis, and The Landau function and the Riemann
  hypothesis, HAL texts.
- `de-koninck-letendre-2020` J.-M. De Koninck, P. Letendre, New upper bounds for the number of
  divisors function, arXiv text.
- `robin-1983` G. Robin, Estimation de la fonction de Tchebychef θ sur le k-ième nombre premier,
  Acta Arith. 42 (1983); `massias-robin-1996` J.-P. Massias, G. Robin, Bornes effectives pour
  certaines fonctions concernant les nombres premiers, J. Théor. Nombres Bordeaux 8 (1996);
  `rosser-1938`, `rosser-1941` (uncertified); `cipolla-1902` (waived).
- `mccurley-1984` K. S. McCurley, Explicit estimates for the error term in the prime number theorem
  for arithmetic progressions, Math. Comp. 42 (1984); `bennett-martin-obryant-rechnitzer-2018`
  M. A. Bennett, G. Martin, K. O'Bryant, A. Rechnitzer, Explicit bounds for primes in arithmetic
  progressions, Illinois J. Math. 62 (2018), arXiv text; `bach-sorenson-1996` E. Bach, J. Sorenson,
  Explicit bounds for primes in residue classes, Math. Comp. 65 (1996); `kadiri-2008` H. Kadiri,
  Short effective intervals containing primes in arithmetic progressions and the seven cubes
  problem, Math. Comp. 77 (2008).
- `kadiri-lumley-2014` H. Kadiri, A. Lumley, Short effective intervals containing primes, Integers
  14 (2014); `cully-hugill-lee-2022` M. Cully-Hugill, E. S. Lee, Explicit interval estimates for
  prime numbers, Math. Comp. 91 (2022), and `cully-hugill-lee-2024` its corrigendum (uncertified);
  `dudek-2015` A. W. Dudek, On the Riemann hypothesis and the difference between primes, Int. J.
  Number Theory 11 (2015); `dudek-2016` An explicit result for primes between cubes, Funct. Approx.
  55 (2016), arXiv text; `cully-hugill-2021` M. Cully-Hugill, Primes between consecutive powers;
  `carneiro-milinovich-soundararajan-2019` E. Carneiro, M. B. Milinovich, K. Soundararajan,
  Fourier optimization and prime gaps, Comment. Math. Helv. 94 (2019), arXiv text.
- `van-de-lune-te-riele-winter-1986`, `platt-2017`, `rumely-1993`, `platt-2011-thesis`: the
  verified-zero computations; `deleglise-rivat-1996`, `deleglise-rivat-1998`: the tables of `π` and
  `ψ`; `nicely-1999`, `young-potler-1989`, `oliveira-e-silva-herzog-pardi-2014`: prime gaps;
  `kadiri-2013-density`: the zero density used by Faber–Kadiri.
