# Roadmap: explicit exponential sums, character sums and sieve bounds

**Summary.** This roadmap builds the numerically explicit inequalities of analytic number theory
that the later explicit roadmaps quote as tools: the derivative tests for exponential sums
`Σ e(f(n))` of a real function, from the Kusmin–Landau lemma through the second, third, fourth
and fifth derivative tests and the iterated van der Corput inequality; counts of integers `n` at
which `f(n)` lies within `δ` of an integer; explicit Pólya–Vinogradov inequalities for Dirichlet
characters, from the Gauss-sum expansion to Pomerance's and Lapkova's constants; explicit Burgess
inequalities for characters to a prime modulus with the constants of Treviño and McGown;
and explicit sieve upper bounds: the Montgomery–Vaughan Brun–Titchmarsh inequality with constant
`2`, Büthe's weighted forms, the Ramaré–Viswanadham prime-power sums, Greaves's lower bound for
Selberg's density sum and Fan's bound for integers free of small prime factors. Everything rests
on Mathlib's Dirichlet characters, Gauss sums, Selberg-sieve carrier and Fourier character, Tau
Ceti's Gauss-sum norm and partial-sum lemmas, the forbidden-residue large sieve of
SieveMethodsAndPrimePatterns, Weil's bound from CharacterSumsOverFiniteFields and the explicit
prime-number estimates of AnalyticNumberTheoryPartI. Every result that rests on a table or on a
finite verification takes that verification as a named hypothesis (Layer 6), and the analytic
argument is proved from it.

## Scope and ownership

**Owned here.** The van der Corput finite inequality for complex sequences (Layer 0), the
derivative tests for exponential sums with explicit constants (Layer 1), the explicit counts of
integer points near a curve by the first and second derivative and by exponential sums (Layer 2),
the explicit Pólya–Vinogradov inequalities and the elementary character-sum identities they use
(Layers 0 and 3), the explicit Burgess inequalities for a prime modulus together with Burgess's
moment bound and multiplicative-energy count (Layer 4), the explicit sieve upper bounds and the
explicit lower bounds for Selberg diagonal sums they use (Layer 5), and the named computational
hypotheses (Layer 6).

**The van der Corput inequality.** ProbabilisticAndMetricNumberTheory §2.5 states the same finite
lag inequality inside its proof of van der Corput's difference theorem. That roadmap comes later
in the merge order, so the inequality is owned here at the generality of arbitrary complex
coefficients (§0.3), and its exponential-sum specialisations are corollaries.

**Consumed, not restated.** Mathlib supplies Dirichlet characters with conductor, primitivity,
parity and primitive character, Gauss sums of multiplicative characters and their shift identity
for primitive characters, the native `BoundingSieve` and `SelbergSieve` carriers, the von
Mangoldt function, prime counting, totient, Möbius function and `Real.fourierChar`; Tau Ceti
supplies the norm of a primitive Gauss sum and the vanishing of a nonprincipal character over a
full period. SieveMethodsAndPrimePatterns §2.9 owns the large sieve for forbidden residues
`J(Q)|Σ aₙ|² ≤ (H − 1 + Q²)Σ|aₙ|²`, consumed by the Brun–Titchmarsh and Fan bounds, and
§1.3 owns Selberg's optimal weights on the native carrier, consumed by Büthe's weighted sieve.
CharacterSumsOverFiniteFields §4.7 owns Weil's bound `|Σ_x χ(f(x))| ≤ (m − 1)√q`, consumed by
Burgess's moment bound. AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19 and 0.20 own the explicit
Rosser–Schoenfeld estimates for `π(x)`, `Σ log p/p` and `Σ 1/p`, consumed by Fan's bound. No
large-sieve constant, Selberg weight, Gauss-sum evaluation or Weil bound is proved a second time.

**Not owned here.** The qualitative Brun–Titchmarsh bound with an unspecified constant and the
qualitative twin-prime and Goldbach upper bounds are SieveMethodsAndPrimePatterns §1.6; the
linear-sieve functions `F`, `f` and the Rosser–Iwaniec linear sieve with an unspecified error
constant are SieveMethodsAndPrimePatterns §5.2; the weighted finite Hilbert inequality with
constant `3π/2` is AnalyticNumberTheoryPartI §1.5a; the explicit Erdős–Turán inequality is
ProbabilisticAndMetricNumberTheory §2.7. Outside this roadmap and its Part II are: bounds for
`L(1, χ)` and class numbers; the least `k`-th power non-residue, primitive roots and
norm-Euclidean fields; Vinogradov's mean value theorem; every algorithm and every proof of a table.
None of the results here depends on zeros of `L`-functions, so the exclusion of Landau–Siegel
zeros (AnalyticNumberTheoryPartI §0.34) is not used.

**ExplicitCharacterSumsAndSieves, Part II.** The following explicit results are the subject of
ExplicitCharacterSumsAndSieves, Part II, a later roadmap that consumes Layers 0–6 of this one. This
roadmap stops at the derivative tests of Layer 1, the first and second derivative counts of Layer
2, the Pólya–Vinogradov inequalities of Layer 3, the Burgess inequalities for a prime modulus of
Layer 4 and the sieve bounds of Layer 5.

- The B-process of van der Corput: the explicit truncated Poisson formula and the explicit
  stationary-phase estimates (patelyang2024 Lemmas 2.1–2.3, lines 266, 475 and 667), which take
  the place of the stationary-phase formula attributed to Karatsuba–Korolëv.
- The explicit `k`-th derivative test (`k ≥ 3`) for integer points near a curve: Bordellès's
  explicit form of the theorem of Huxley and Sargos (bordelles2012 Theorem 5.12; the qualitative
  form is huxleysargos1995 Théorème 1, line 39), with the correction of the major-arc lemma and the
  corrected constants of zhao2024 Theorem 2.1 (line 84).
- Bachman–Rachakonda's bound `(1/(3 log 3))√q log q + 6.5√q` for nonprincipal characters of every
  modulus (bachmanrachakonda2001 Theorem 1); §3.5 implies it for primitive characters and §3.6
  for `q ≥ 1000`.
- Explicit partial Gaussian sums and the Pólya–Vinogradov bounds with leading constant reduced by
  them: Bordignon–Kerr for squarefree moduli (bordignonkerr2020 Theorem 2, Corollary 1 and
  Theorem 5, lines 156–220) and Bordignon for primitive characters of every large modulus
  (bordignon2022partial Theorem 1.1, lines 69–75, with its Tables 1–3, and the Burgess-type bound
  for twisted characters it uses, Theorem 1.3, lines 123–126).
- Booker's Burgess inequality for the quadratic character of a prime `d > 10²⁰` with
  `d ≡ 1 (mod 4)`, with its table of `α(r)` and `β(r)` (booker2006 Proposition 2 and Table 1,
  lines 350–379).
- Burgess inequalities for composite moduli (jainsharmakhaleliu2021 Theorem 1.1 and
  Corollary 1.2, lines 86–91).
- Francis's refined Burgess constants for a prime modulus (francis2021 Theorem 1.8, Tables 3
  and 6, lines 127–145 and 810).
- The dimension-two sieve bounds: Siebert's bound with leading constant `16C₂` for the primes `p`
  with `ap + b` prime, `C₂ = ∏_{p > 2}(1 − (p − 1)⁻²)` the twin-prime constant (siebert1976;
  tmeemt-art14 line 119), Riesel–Vaughan's Lemma 4 with its table of pairs `(L, A)`
  (rieselvaughan1983; tmeemt-art14 lines 126–155), the enclosure `0.66016 ≤ C₂ ≤ 0.66017`
  (platttrudgian2018 line 163 encloses `2C₂`), Platt–Trudgian's upper bound for the twin-prime
  count (platttrudgian2018 display (11), line 188), and the Montgomery–Vaughan weighted large
  sieve they rest on (platttrudgian2018 Theorem 2, line 131; montgomeryvaughan1973).
- The explicit linear sieve of Bordignon–Johnston–Starichkova (bordignonjohnstonstarichkova2022
  Theorem 6, line 147).
- Yamada's Brun–Titchmarsh inequality with `log(y/k) + 0.8601` in place of `log(y/k)` (yamada2023
  Theorem 2, lines 104–106).

**Sources stated at second hand.** The Montgomery–Vaughan Brun–Titchmarsh inequality (5.5), the
Frolenkov–Soundararajan corollary for nonprincipal characters (3.6), the integer-point first and
second derivative tests (2.2, 2.3) and Greaves's density-sum bound (5.2) are stated from the
TME-EMT pages, which quote the primary statements; the primary texts are cited by locator. For
2.2, 5.2 and the diagonal bound 5.1 the proof route given here is complete in itself.

## Conventions

- `e(x) = exp(2πix)`, the complex value of Mathlib's `Real.fourierChar x` (which lands in
  `Circle`); `e(1/4) = i` and `e(1/2) = −1`.
- For real `a ≤ b` and `f : ℝ → ℝ`, the **interval exponential sum** is
  `S_f[a, b] = Σ_{n ∈ ℤ, a ≤ n ≤ b} e(f(n))`, a finite sum over `Finset.Icc ⌈a⌉ ⌊b⌋`. The
  half-open form `Σ_{X < n ≤ X+Y}` of several sources is the case `a = ⌊X⌋ + 1`, `b = X + Y`, and
  the block `Σ_{n=N+1}^{N+L}` with integers `N`, `L ≥ 1` is `a = N + 1`, `b = N + L`.
- "`f` has `k` continuous derivatives on `[a, b]`" means `ContDiffOn ℝ k f (Set.Icc a b)`, and the
  derivatives in hypotheses are the derivatives within `[a, b]` (one-sided at the endpoints).
- `‖x‖` is the distance from `x` to the nearest integer, Mathlib's norm on `UnitAddCircle`:
  `‖(x : UnitAddCircle)‖ = |x − round x|` (`UnitAddCircle.norm_eq`).
- For real `a`, real `N ≥ 0`, `δ > 0` and `f : ℝ → ℝ`, the **near-integer count** `R(f, a, N, δ)`
  is the number of integers `n` with `a ≤ n ≤ a + N` and `‖f(n)‖ < δ` (strict inequality). The
  TME-EMT count on `[N, 2N]` is `R(f, N, N, δ)`.
- Characters: `χ : DirichletCharacter ℂ q` with `q ≥ 1`. For `M ∈ ℤ` and `N ∈ ℕ` the
  **character interval sum** is `S_χ(M, N) = Σ_{M < n ≤ M+N} χ(n)`, each integer cast to
  `ZMod q`. The **maximal interval sum** is `M_χ = max_{0 ≤ M < q, 0 ≤ N ≤ q} |S_χ(M, N)|`, a
  finite maximum; for `χ ≠ 1` it bounds `|S_χ(M, N)|` for all `M` and `N` (§0.4), and it equals
  Pomerance's `S(χ)` and Lapkova's `M_χ`. "Primitive", "even" and "odd" are Mathlib's
  `DirichletCharacter.IsPrimitive`, `Even` (`χ(−1) = 1`) and `Odd` (`χ(−1) = −1`).
- `ω(n)` is the number of distinct prime factors (`ArithmeticFunction.cardDistinctFactors`),
  `d(n)` the number of divisors, `φ` the totient, `μ` the Möbius function, `Λ` the von Mangoldt
  function, `γ` Euler's constant (`Real.eulerMascheroniConstant`).
- `π(x; k, ℓ)` is the number of primes `p ≤ x` with `p ≡ ℓ (mod k)`; `Φ(x, z)` is the number of
  integers `1 ≤ n ≤ x` with no prime factor `p ≤ z` (so `1` is counted);
  `S(z) = Σ_{1 ≤ n ≤ z} μ²(n)/φ(n)` and `S_k(z) = Σ_{1 ≤ n ≤ z, (n, k) = 1} μ²(n)/φ(n)` are the
  Selberg diagonal sums.
- Real logarithms are natural; `log` of a nonpositive number never occurs in a stated bound
  (each statement carries the hypothesis making its arguments positive). Division by zero does not
  occur: every denominator in a stated bound is positive under the stated hypotheses.
- A table or finite verification enters only as a named hypothesis of Layer 6. A theorem that
  consumes AnalyticNumberTheoryPartI §0.5 carries that section's named input
  `RosserSchoenfeldFiniteRangeInput`.

## Exact supplier contracts

### From Mathlib

At the pinned commit `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:

- `Real.fourierChar : AddChar ℝ Circle` and `Real.fourierChar_apply`
  (`Mathlib/Analysis/Complex/Circle.lean`, lines 221 and 232): `e(x) = exp(2πix)`.
- `UnitAddCircle.norm_eq` (`Mathlib/Analysis/Normed/Group/AddCircle.lean`, line 223):
  `‖(x : UnitAddCircle)‖ = |x − round x|`.
- `DirichletCharacter.conductor`, `DirichletCharacter.IsPrimitive`,
  `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.primitiveCharacter_isPrimitive`,
  `DirichletCharacter.changeLevel_primitiveCharacter`, `DirichletCharacter.Even`,
  `DirichletCharacter.Odd`, `DirichletCharacter.Even.eval_neg`, `DirichletCharacter.Odd.eval_neg`
  (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean`, lines 245–327 and 537–572);
  `DirichletCharacter.norm_le_one` (`.../Bounds.lean`, line 44).
- `gaussSum` (`Mathlib/NumberTheory/GaussSum.lean`, line 72), `gaussSum_mulShift_of_isPrimitive`
  (`Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean`, line 59): for primitive `χ` and every
  `a`, including non-units, `gaussSum χ (e.mulShift a) = χ⁻¹(a) gaussSum χ e`; `ZMod.stdAddChar`
  and `ZMod.isPrimitive_stdAddChar`
  (`Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean`).
- `BoundingSieve`, `SelbergSieve`, `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`,
  `BoundingSieve.upperMoebius_lambdaSquared` (`Mathlib/NumberTheory/SelbergSieve.lean`).
  The carrier records a finite weighted support, a squarefree prime product, a multiplicative
  density with `0 < ν(p) < 1` and an approximation `X`; it carries no remainder estimate.
- `quadraticChar_ne_one` (`Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`,
  line 207), for the nonprincipality of the Legendre character.
- `Nat.primeCounting`, `ArithmeticFunction.vonMangoldt`, `ArithmeticFunction.moebius`,
  `Nat.totient`, `ArithmeticFunction.cardDistinctFactors`, `ArithmeticFunction.sigma`,
  `Real.eulerMascheroniConstant`, `harmonic_le_one_add_log` and `log_add_one_le_harmonic`
  (`Mathlib/NumberTheory/Harmonic/Bounds.lean`, lines 25 and 34), `Real.cot` with
  `Real.cot_eq_cos_div_sin` (`Mathlib/Analysis/Complex/Trigonometric.lean`, line 644).
- `ContDiffOn`, `exists_deriv_eq_slope` (`Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`,
  line 155), `AbsolutelyContinuousOnInterval`
  (`Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean`, line 155) and
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  (`Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`, line 227).
- `ConvexOn.map_integral_le` (`Mathlib/Analysis/Convex/Integral.lean`, line 196), Jensen's
  inequality for a probability measure, used in the tuple count of 4.1.

The pin has no Kusmin–Landau lemma, no derivative test, no Pólya–Vinogradov or Burgess
inequality, no Brun–Titchmarsh inequality and no large sieve.

### From Tau Ceti

At the pinned commit `2fd255d997f47c0b5d834ee416c7015d55444ce5`:

- `DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` and
  `DirichletCharacter.IsPrimitive.norm_gaussSum`
  (`TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`, lines 43 and 82): for primitive `χ`
  of level `n` and a primitive additive character `e`, `‖gaussSum χ e‖ = √n`.
- `DirichletCharacter.sum_range_level_eq_zero`, `DirichletCharacter.sum_range_eq_sum_range_mod`
  and `DirichletCharacter.norm_sum_Icc_le_level`
  (`TauCeti/NumberTheory/DirichletCharacter/PartialSum.lean`, lines 30, 37 and 49): a
  nonprincipal character sums to zero over a full period, its partial sums depend on the endpoint
  modulo the level, and they are bounded by the level.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

- §2.9, "Large sieve for forbidden residues": for a finite prime set with forbidden residue sets
  `Ω_p`, `|Ω_p| < p`, and coefficients supported on `H ≥ 1` consecutive integers avoiding every
  forbidden residue, `J(Q)|Σ aₙ|² ≤ (H − 1 + Q²)Σ|aₙ|²` for `Q ≥ 1`, where
  `J(Q) = Σ_{d ≤ Q} μ²(d)∏_{p | d}|Ω_p|/(p − |Ω_p|)` over squarefree `d` composed of sieving
  primes. Consumed in 5.5 (one forbidden class at each sieving prime) and 5.6 (the class `0`).
- §1.3, "Selberg optimal weights" and "Selberg upper-bound sieve": the optimal weights `λ_z` on a
  native `BoundingSieve` with `λ_z(1) = 1`, `|λ_z(d)| ≤ 1` and main term `1/G(s, z)`. Consumed in
  5.3.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

- §4.7, `weil_mulChar_sum_bound`: for a finite field `F` with `q` elements, `χ ≠ 1` of order `d`
  and `f ∈ F[X]` nonzero, not of the form `c·h^d`, with `m` distinct roots in `F̄`,
  `|Σ_{x ∈ F} χ(f(x))| ≤ (m − 1)√q`. Consumed at `F = ZMod p` in 4.1.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.5: under `RosserSchoenfeldFiniteRangeInput`, for `x ≥ 59`,
  `(x/log x)(1 + 1/(2 log x)) < π(x) < (x/log x)(1 + 3/(2 log x))`.
- §0.8: an absolute constant `E` with
  `log x + E − 1/(2 log x) < Σ_{p ≤ x} log p/p < log x + E + 1/(2 log x)` for `x ≥ 319`, and
  §0.20, its interval form for `x ≥ y ≥ 319`.
- §0.19: `|Σ_{p ≤ x} 1/p − log log x − B| < 1/(2 log² x)` for `x ≥ 286`.

All four are consumed in 5.6, at arguments at least `319`; smaller arguments are covered by the
finite-range hypothesis of Layer 6. §0.5 is consumed also in 4.4, for the lower bound
`π(A) > A/log A` at integers `A ≥ 59`, so the theorems of 4.4 carry
`RosserSchoenfeldFiniteRangeInput`.

## How to read the build

Layer 0 fixes the carriers (the exponential sum over the integers of an interval, the distance to
the nearest integer and the near-integer count, the character interval sum and its maximum),
proves van der Corput's finite inequality and the elementary identities for character sums
(periodicity, the symmetry of even characters, the reduction to the primitive character). Layer
1 proves the derivative tests: Kusmin–Landau in Landau's sharp form and its asymmetric variant,
the second derivative test by cutting the interval where `f′` is near an integer, and the third,
fourth and fifth derivative tests by iterating van der Corput's inequality, ending with Arias de
Reyna's iterated inequality. Layer 2 counts integer points near curves by the mean value theorem,
by Huxley's reduction and by Fejér's kernel. Layer 3 expands character sums in Gauss sums and
proves the explicit Pólya–Vinogradov inequalities. Layer 4 proves Burgess's moment bound from
Weil's bound, the multiplicative-energy count and Burgess's amplification inequality, and derives
the tabulated Burgess constants from the Layer 6 certificates. Layer 5 proves the explicit lower
bounds for Selberg diagonal sums and the explicit sieve upper bounds. Layer 6 names the
computational hypotheses: numerical inequalities over explicitly bounded ranges, and, for
Treviño's two tables, inequalities between explicit functions of `p ≥ p₀`; none is a statement
about characters or primes in general. Read each claim with its hypotheses and its *Needs:* line.

## Layer 0: carriers, van der Corput's inequality and character-sum identities

### 0.1 the exponential sum over the integers of an interval

Define the interval exponential sum `S_f[a, b] = Σ_{n ∈ ℤ, a ≤ n ≤ b} e(f(n))` for `f : ℝ → ℝ` and
real `a`, `b`, as a finite sum over `Finset.Icc ⌈a⌉ ⌊b⌋`, with `e(x)` the complex value of
`Real.fourierChar x`.

- If `[a, b]` contains no integer (in particular if `b < a`), the sum is `0`.
- Adding a real constant to `f` multiplies the sum by a unit complex number; adding `k·x` with
  `k ∈ ℤ` leaves every term unchanged; replacing `f` by `−f` conjugates the sum.
- For an integer `c` with `a ≤ c < b`, `S_f[a, b] = S_f[a, c] + S_f[c + 1, b]`.
- `|S_f[a, b]| ≤ ⌊b⌋ − ⌈a⌉ + 1 ≤ b − a + 1` when `[a, b]` contains an integer.
- For real `X` and `Y ≥ 0`, `Σ_{X < n ≤ X+Y} e(f(n)) = S_f[⌊X⌋ + 1, X + Y]`.

**Checks.**

- `f ≡ 0` on `[0, 2]` gives `3`; on `[0.2, 0.8]` the sum is empty and equals `0`; a definition
  over the real interval's length instead of its integers would give a nonzero value here.
- `f(x) = x/2` on `[0, 3]` gives `1 − 1 + 1 − 1 = 0`, and on `[0, 2]` gives `1`; this pins
  `e(1/2) = −1`, which a convention `e(x) = exp(ix)` would fail.
- `f(x) = x` on `[0, 2]` equals the sum for `f ≡ 0`, namely `3`: integer slopes are invisible.
- The half-open sum over `0.5 < n ≤ 2.5` is `S_f[1, 2.5]`, with the two terms `n = 1, 2`.

*Needs:* Mathlib `Real.fourierChar`, `Int.ceil`, `Int.floor`, `Finset.Icc`.

### 0.2 the distance to the nearest integer and the near-integer count

The distance to the nearest integer is Mathlib's norm on `UnitAddCircle`, consumed through
`UnitAddCircle.norm_eq`. Define the near-integer count `R(f, a, N, δ)` as the number of integers
`n` with `a ≤ n ≤ a + N` and `‖f(n)‖ < δ`, for real `a`, `N ≥ 0` and `δ > 0` (for `N = 0` the count
is `1` or `0` according as `a` is an integer with `‖f(a)‖ < δ` or not).

- `R(f, a, N, δ) ≤ N + 1`, and `R` is monotone in `δ` and in the interval.
- `R(f + k, a, N, δ) = R(f, a, N, δ)` for every integer `k`, and `R(−f, a, N, δ) = R(f, a, N, δ)`.
- If `δ > 1/2` every integer of the interval is counted.

**Checks.**

- `‖2.3‖ = 0.3`, `‖2.5‖ = 0.5`, `‖−0.2‖ = 0.2`; the fractional part would give `0.8` at `−0.2`.
- `f(x) = x/3`, `a = 0`, `N = 6`, `δ = 0.1`: the counted integers are `0, 3, 6`, so `R = 3`.
- Strictness: `f(x) = x/3`, `a = N = 1`, `δ = 1/3` does not count `n = 1`, since `‖1/3‖ = 1/3`;
  a non-strict count would.
- Length zero: `R(x/3, 3, 0, 0.1) = 1` (`‖1‖ = 0`) and `R(x/3, 2.5, 0, 0.5) = 0` (no integer);
  §2.3 evaluates `R` at length `N − h = 0` when `h = A = N`, so the domain includes `N = 0`.

*Needs:* Mathlib `UnitAddCircle.norm_eq`, `round`.

### 0.3 van der Corput's finite inequality

Let `N ≥ 1` and `H ≥ 1` be integers and `b_1, …, b_N` complex numbers; put
`C(h) = Σ_{n=1}^{N−h} b_{n+h} · conj(b_n)` for `1 ≤ h < N` and `C(h) = 0` for `h ≥ N`. Prove

    H² |Σ_{n=1}^{N} b_n|² ≤ (N + H − 1) · (H Σ_{n=1}^{N} |b_n|² + 2 Re Σ_{h=1}^{H−1} (H − h) C(h)).

Corollaries: the same bound with `2 Σ_{h<H} (H − h)|C(h)|` in place of the real part; for
integers `N`, `L ≥ 1`, `q ≥ 1` and `f : ℝ → ℝ`, with `g_r(x) = f(x + r) − f(x)`,

    |S_f[N+1, N+L]|² ≤ (L + q − 1) (L/q + (2/q) Σ_{r=1}^{q−1} (1 − r/q) |S_{g_r}[N+1, N+L−r]|);

and, for real `X`, `Y ≥ 1`, a natural number `1 ≤ H ≤ Y` and coefficients `|b_n| ≤ 1` on the
integers of `(X, X + Y]`,

    |Y⁻¹ Σ_{X<n≤X+Y} b_n|² ≤ 4/H + (4/(HY)) Σ_{h=1}^{H−1} |Σ_{X<n, n+h≤X+Y} b_{n+h} conj(b_n)|,

because there are at most `Y + 1` such integers, so `N + H − 1 ≤ 2Y` and `H(Y + 1) ≤ 2HY`
(yang2024 Lemma 2.3, lines 324–339; hiarypatelyang2024 Lemma 2.4, lines 96–108; the last form is
the one used in the proof of ariasdereyna2024 Theorem 7, lines 405–415). ariasdereyna2024 Lemma 6
(lines 224–227) states the last form with `Re(H⁻¹ Σ_{a=1}^{H−1}(H − a) C(a))` in place of the sum
of `|C(h)|`; replacing the factor `N + H − 1` of a real part by the larger `2Y` is an upper bound
only when the real part is nonnegative, so that form is not a corollary of the inequality above
and is not used here. Proof: extend `b` by zero, write
`H Σ_n b_n = Σ_m Σ_{j=0}^{H−1} b_{m−j}` over the `N + H − 1` values of `m` for which the inner sum
can be nonzero, apply Cauchy–Schwarz in `m`, and expand the square: the diagonal gives
`H Σ|b_n|²` and each lag `h` occurs `H − h` times with its conjugate.

**Checks.**

- `N = 1`: both sides equal `H²|b_1|²`; `H = 1`: the inequality is Cauchy–Schwarz
  `|Σ b_n|² ≤ N Σ|b_n|²`.
- `b = (1, 1)`, `H = 2`: the left side is `4 · 4 = 16`, the right side `3 · (2 · 2 + 2 · 1) = 18`.
  With the factor `N` in place of `N + H − 1` the right side would be `12 < 16`.
- `b = (1, −1)`, `H = 2`: left `0`, right `3 · (4 − 2) = 6`; the real part of `C(1) = −1` enters
  with its sign.
- `H > N`: lags `h ≥ N` contribute `C(h) = 0`, and `b = (1)`, `H = 3` gives `9 ≤ 3 · 3 = 9`.
- The normalised corollary at `b = (1, 1, 1)` on `(0, 3]`, `H = 2`: `|Σ b_n/3|² = 1`, against
  `4/2 + (4/6)|C(1)| = 2 + (4/6) · 2 = 3.33`. At `b = (1, −1)` on `(0, 2]`, `H = 2`, the real-part
  term of the main inequality is `(N + H − 1) · 2 Re C(1) = 3 · 2 · (−1) = −6`, and with `2Y = 4` in
  place of `N + H − 1` it would be `−8`: enlarging the factor lowers the bound when the real part is
  negative, which is why the normalised form carries `|C(h)|`.

*Needs:* Mathlib `Finset.sum_mul_sq_le_sq_mul_sq` (finite Cauchy–Schwarz), `norm_sum_le`,
`Complex.normSq`.

### 0.4 the character interval sum and its maximum

For `χ : DirichletCharacter ℂ q`, `q ≥ 1`, define `S_χ(M, N) = Σ_{M < n ≤ M+N} χ(n)` for
`M ∈ ℤ`, `N ∈ ℕ`, and `M_χ = max_{0 ≤ M < q, 0 ≤ N ≤ q} |S_χ(M, N)|`.

- `S_χ(M + q, N) = S_χ(M, N)` and `S_χ(M, N + N′) = S_χ(M, N) + S_χ(M + N, N′)`.
- For `χ ≠ 1`, `S_χ(M, q) = 0` for every `M` (Tau Ceti `DirichletCharacter.sum_range_level_eq_zero`),
  hence `S_χ(M, N)` depends only on `M` and `N` modulo `q`, and `|S_χ(M, N)| ≤ M_χ` for all
  `M ∈ ℤ`, `N ∈ ℕ`.
- `|S_χ(M, N)| ≤ min(N, q)` for `χ ≠ 1` (Tau Ceti `DirichletCharacter.norm_sum_Icc_le_level`);
  `M_χ = M_{χ⁻¹}`, since `χ⁻¹(n)` is the complex conjugate of `χ(n)`.
- For `χ ≠ 1`, `M_χ = max_{M ∈ ℤ, N ∈ ℕ} |Σ_{M ≤ n ≤ M+N} χ(n)|`, the maximum of Pomerance and
  Lapkova over closed intervals.

**Checks.**

- The quadratic character modulo `3` has values `1, −1, 0` at `1, 2, 3`: `S(0, 1) = 1`,
  `S(0, 2) = 0`, `S(0, 3) = 0`, and `M_χ = 1`.
- The quadratic character modulo `5` has values `1, −1, −1, 1, 0`: `S(1, 2) = −2`, and `M_χ = 2`.
- The principal character modulo `3`: `M_χ = 2` (attained at `N = 3`), but `S(0, 6) = 4 > M_χ`;
  the bound `|S_χ(M, N)| ≤ M_χ` needs `χ ≠ 1`.

*Needs:* Tau Ceti `DirichletCharacter.sum_range_level_eq_zero`,
`DirichletCharacter.sum_range_eq_sum_range_mod`, `DirichletCharacter.norm_sum_Icc_le_level`;
Mathlib `DirichletCharacter.norm_le_one`.

### 0.5 symmetry of even characters

Let `χ ≠ 1` be an even character modulo `q`. Prove
`Σ_{n=1}^{q−1−N} χ(n) = −Σ_{n=1}^{N} χ(n)` for `0 ≤ N ≤ q − 1`, and hence
`M_χ = 2 max_{0 ≤ N < q} |Σ_{n=1}^{N} χ(n)|` (pomerance2011 lines 89–95; tmeemt-art15
lines 126–129; frolenkov2011 lines 22–27, equation (1)). For every `χ ≠ 1`,
`M_χ ≤ 2 max_N |Σ_{n=1}^{N} χ(n)|`. Proof: substitute `n ↦ q − n`, use `χ(−n) = χ(n)` and the
vanishing of the full period sum; an interval from a point where the initial sum is `−A` to one
where it is `A` realises `2A`.

**Checks.**

- The quadratic character modulo `5` (even): initial sums `1, 0, −1, 0`, maximum `1`, and
  `M_χ = 2 = 2 · 1`, as in 0.4.
- The character `χ₄` modulo `4` (odd): initial sums `1, 1, 0`, maximum `1`, but `M_χ = 1 < 2`;
  the identity needs evenness.
- The principal character modulo `5` is even but satisfies `Σ_{n ≤ 4−N} = φ(5) − Σ_{n ≤ N}`
  instead; nonprincipality is needed.

*Needs:* Mathlib `DirichletCharacter.Even.eval_neg`; §0.4.

### 0.6 reduction to the primitive character

Let `χ` be a character modulo `q ≥ 1` with conductor `q*` and primitive character `χ*`
(Mathlib `DirichletCharacter.primitiveCharacter`), and let `r` be the product of the primes
dividing `q` but not `q*`. Prove that for `M ∈ ℤ`, `N ∈ ℕ`,

    S_χ(M, N) = Σ_{d | r} μ(d) χ*(d) Σ_{M/d < m ≤ (M+N)/d} χ*(m),

and hence `M_χ ≤ 2^{ω(r)} M_{χ*}` when `χ ≠ 1` (montgomeryvaughan2007 §9.4). Proof: `χ(n)`
equals `χ*(n)` when `gcd(n, r) = 1` and `0` otherwise (Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`, using that `χ*(n) = 0` when
`gcd(n, q*) > 1`), and `1_{gcd(n, r) = 1} = Σ_{d | gcd(n, r)} μ(d)`.

**Checks.**

- The principal character modulo `6` (`q* = 1`, `r = 6`): `S(0, 6) = 2`, and the formula gives
  `6 − 3 − 2 + 1 = 2`.
- The character modulo `12` induced by `χ₄` (`r = 3`): `S(0, 5) = χ₄(1) + χ₄(5) = 2`, and the
  formula gives `S_{χ₄}(0, 5) − χ₄(3) S_{χ₄}(0, 1) = 1 + 1 = 2`. Omitting the factor `χ*(d)`
  would give `0`.
- A primitive `χ` has `r = 1` and the identity is trivial; `r` is squarefree by definition, so
  `μ(d) ≠ 0` for every `d | r`.

*Needs:* Mathlib `DirichletCharacter.primitiveCharacter`,
`DirichletCharacter.changeLevel_primitiveCharacter`, `ArithmeticFunction.moebius`,
`ArithmeticFunction.cardDistinctFactors`; §0.4.

### Examples

The quadratic character modulo `5` has `M_χ = 2` and initial-sum maximum `1`; van der Corput's
inequality with `b = (1, 1)`, `H = 2` reads `16 ≤ 18`; `R(x/3, 0, 6, 0.1) = 3`.

### Dependencies

Mathlib: `Real.fourierChar`, `UnitAddCircle.norm_eq`, Dirichlet characters, primitive characters,
Möbius function. Tau Ceti: the partial-sum lemmas of `TauCeti/NumberTheory/DirichletCharacter/PartialSum.lean`.

## Layer 1: exponential sums under derivative conditions

### 1.1 the Kusmin–Landau lemma

Let `a ≤ b`, let `f` have a continuous, monotone derivative on `[a, b]`, and suppose there are
`θ ∈ (0, 1/2]` and an integer `k` with `θ ≤ f′(x) − k ≤ 1 − θ` on `[a, b]`. Prove
`|S_f[a, b]| ≤ cot(πθ/2) ≤ 2/(πθ)` (ariasdereyna2024 Lemma 1 and Remark 2, lines 90–104;
patel2022 Lemma 2.1, lines 78–81, with the corrected argument at lines 93–124;
granville-ramare-1996 Lemma 8.4, lines 903–908; tmeemt-art05 lines 84–89; Landau's constant).
Proof route (Patel's corrected form of the Cheng–Graham argument, patel2022 displays (12)–(19)):
with `g(n) = f(n + 1) − f(n) − k ∈ [θ, 1 − θ]` (mean value theorem), express each term through
`e(f(n)) = (e(f(n + 1)) − e(f(n)))/(e(g(n)) − 1)` and sum by parts; `cot(πg(n))` is monotone
because `f′` is, the interior terms telescope, and the two boundary terms are at most
`(1/2)cot(πθ/2)` and `(1/2)tan(π(1 − θ)/2) = (1/2)cot(πθ/2)`; finally `cot x ≤ 1/x` on
`(0, π/2)`.

**Checks.**

- `θ = 1/2`, `f(x) = x/2` on `[0, 2]`: the sum is `1 − 1 + 1 = 1 = cot(π/4)`; the bound is
  attained. Cheng–Graham's constant `1/(πθ) = 2/π < 1` is refuted by this example.
- `f(x) = x/3` on `[0, 1]`: `|1 + e(1/3)| = 1 ≤ cot(π/6) = √3`; on `[0, 2]` the sum is `0`.
- `θ → 0` is excluded: for `f ≡ 0` the sum over `[0, n]` is `n + 1`, unbounded.

*Needs:* Mathlib `exists_deriv_eq_slope`, `Real.cot`, `Real.cot_eq_cos_div_sin`; §0.1.

### 1.2 the asymmetric Kusmin–Landau lemma

Let `f` have a continuous, monotone derivative on `[a, b]` and suppose there are an integer `ℓ`
and reals `U, V > 1` with `ℓ + 1/U ≤ f′(x) ≤ ℓ + 1 − 1/V` on `[a, b]`. Prove
`|S_f[a, b]| ≤ (U + V)/π` (hiarypatelyang2024 Lemma 2.3, lines 86–92, stated there for the sum
over `a ≤ n < b`, which is the case `b ↦ ⌈b⌉ − 1` of the closed form). Proof: the argument of
1.1, where the two boundary terms are now `(1/2)cot(π/(2U)) ≤ U/π` and
`(1/2)tan(π(1 − 1/V)/2) = (1/2)cot(π/(2V)) ≤ V/π`.

**Checks.**

- `U = V = 1/θ` gives `2/(πθ)`, the second bound of 1.1.
- `f(x) = x/3` on `[0, 1]`: `ℓ = 0`, `U = 3`, `V = 3/2`; the bound `4.5/π ≈ 1.43` exceeds the
  value `|1 + e(1/3)| = 1`.
- `U = 1` is excluded: it would allow `f′ ≡ ℓ + 1` on the boundary, where `f ≡ (ℓ + 1)x` gives
  an unbounded sum.

*Needs:* §1.1 route; Mathlib `exists_deriv_eq_slope`.

### 1.3 the second derivative test

Let `a ≤ b`, let `f` have two continuous derivatives on `[a, b]`, and suppose
`0 < λ ≤ |f″(x)| ≤ Λ` there. Prove

    |S_f[a, b]| ≤ (Λ(b − a) + 2)(1 + 4/√(πλ)) + 1,

and, when moreover `b − a ≥ 1`, `|S_f[a, b]| ≤ A λ^{−1/2}(Λ(b − a) + 2)` with
`A = (2/√π)(1 + √(1 + 3π/8)) = 2.79368…` (ariasdereyna2024 Lemma 4, lines 109–114, proof
lines 115–181, and Lemma 5, lines 183–189, both stated on `(X, X + Y]`). As a corollary, for
integers `N` and `L ≥ 1` and reals `V < W` with `W > 1` and `1/W ≤ |f″| ≤ 1/V` on
`[N + 1, N + L]`, `|S_f[N + 1, N + L]| ≤ 2(L/V + 2)(2√(W/π) + 1)` (patel2022 Lemma 2.3,
lines 140–144; tmeemt-art05 lines 98–104 with `λ = W/V`), and the sharper form
`2((L − 1)/V + 2)(2√(W/π) + 1/2) + 1` (patel2022 line 157), which is the first bound above.
Proof route of Arias de Reyna: `f″` has constant sign (replace `f` by `−f` otherwise), the image
of `f′` lies in an interval of length `Λ(b − a)` between consecutive integers `a₀ < b₀` with
`b₀ − a₀ ≤ Λ(b − a) + 2`; for `θ ∈ (0, 1/2)` the integers `n` with `f′(n)` within `θ` of an
integer form at most `b₀ − a₀ + 1` runs of at most `1 + 2θ/λ` terms (mean value theorem), and on
each remaining stretch 1.1 gives `cot(πθ/2) ≤ 2/(πθ)`; take `θ = √(λ/π)` when `λ ≤ π/4` and the
trivial bound otherwise.

**Checks.**

- With `λ = 1/W`, `Λ = 1/V` and `b − a = L − 1` the first bound is Patel's sharper form exactly,
  and Patel's form `2(L/V + 2)(2√(W/π) + 1)` exceeds it by `L/V + 1 + (4√(W/π) + 1)/V > 0`; at
  `L = 10`, `V = 2`, `W = 3` the excess is `6 + 2.454 = 8.454`, where a difference of `L/V + 1`
  alone would be `6`.
- `A = 1.12838… · (1 + 1.47584…) = 2.79368…`, the positive root of `1/β = 1.5β + 4/√π` inverted.
- `f(x) = x²/200` on `[0, 10]` (`λ = Λ = 1/100`): the first bound is `2.1 · (1 + 22.57) + 1 ≈ 50.5`,
  above the trivial bound `11`; the test is designed for long intervals.
- `λ = 0` is excluded: a linear `f` with slope `1/2` gives `|S_f[0, 2m]| = 1` but slope `0` gives
  `2m + 1`.

*Needs:* §1.1; §0.1; Mathlib `exists_deriv_eq_slope`, `ContDiffOn`.

### 1.4 the third derivative test

Let `N` and `L ≥ 1` be integers and let `f` have three continuous derivatives on
`[N + 1, N + L]`, with `W₃ > 1`, `λ₃ ≥ 1` and `1/W₃ ≤ |f‴(x)| ≤ λ₃/W₃` there. For every
`η₃ > 0`,

    |S_f[N+1, N+L]|² ≤ (L W₃^{−1/3} + η₃)(α₃ L + β₃ W₃^{2/3}),
    α₃ = 1/η₃ + (32λ₃/(15√π)) √(η₃ + W₃^{−1/3}) + 2λ₃η₃ W₃^{−1/3} + 2λ₃ W₃^{−2/3},
    β₃ = 64/(3√π √η₃) + 4 W₃^{−1/3}

(patel2022 Lemma 2.5, lines 160–164, with proof lines 175–181; it corrects hiary2016zeta
Lemma 1.2, whose constants rest on Cheng–Graham's flawed second derivative test). Proof route: §0.3
with `q = M = ⌈η₃ W₃^{1/3}⌉`; for each lag `m < L`, `g_m(x) = f(x + m) − f(x)` satisfies
`m/W₃ ≤ |g_m″| ≤ mλ₃/W₃` (mean value theorem for `f″`), so the corollary of §1.3 with
`W = W₃/m`, `V = W₃/(mλ₃)` gives
`|S_{g_m}| ≤ 4λ₃L√m/√(πW₃) + 2λ₃Lm/W₃ + 8√(W₃/m)/√π + 4` when `W₃/m > 1`; when `W₃/m ≤ 1` the
trivial bound `L` is smaller than the terms it replaces. Sum the lags with
`Σ_{m ≤ M}(1 − m/M) m^s ≤ M^{s+1}/((s + 1)(s + 2))` for `−1 < s < 1` (patel2022 display (32),
line 232).

**Checks.**

- The source's hypothesis reads "four continuous derivatives"; the proof uses `f‴` only through
  the mean value theorem for `f″`, and Hiary's Lemma 1.2 assumes three. The statement here
  assumes three.
- At `W₃ = 1` (the limit), `λ₃ = η₃ = 1`: `α₃ = 5 + (32/(15√π))√2 = 6.702…` and
  `β₃ = 64/(3√π) + 4 = 16.036…`; Hiary's uncorrected `β = 64/15 + 3 = 7.27` is smaller and is not
  a valid constant. The TME-EMT page prints `65/15` for Hiary's `64/15`.
- The bound is decreasing in `W₃` at fixed `η₃, λ₃, L`, so the values at `W₃ = 1` bound every
  admissible case (patel2022 line 185, `α̃₃`, `β̃₃`).

*Needs:* §0.3; §1.3; Mathlib `exists_deriv_eq_slope`, `Int.ceil`.

### 1.5 the fourth and fifth derivative tests

Let `α̃₃ = 1/η₃ + 32λ/(15√π)√(η₃ + 1) + 2λη₃ + 2λ` and `β̃₃ = 64/(3√π√η₃) + 4` be the values of
1.4 at `W₃ = 1` with `λ₃ = λ` (patel2022 line 185).

*Fourth derivative.* Let `f` have four continuous derivatives on `[N + 1, N + L]` with `W₄ > 1`,
`λ₄ ≥ 1` and `1/W₄ ≤ |f⁽⁴⁾| ≤ λ₄/W₄`. For `η₃, η₄ > 0`, with `α̃₃, β̃₃` taken at `λ = λ₄`,

    |S_f[N+1, N+L]|² ≤ (L W₄^{−1/7} + η₄)(α₄ L + γ₄ √L W₄^{2/7} + β₄ W₄^{3/7}),
    α₄ = 1/η₄ + (72/91) √α̃₃ (η₄ + W₄^{−1/7})^{1/6},
    γ₄ = (72/55) √β̃₃ η₄^{−1/6} + √(η₃ α̃₃) W₄^{−1/7},
    β₄ = (9/5) √(β̃₃ η₃) η₄^{−1/3}

(patel2022 Lemma 3.1, lines 191–196, proof displays (27)–(36), lines 197–264).

*Fifth derivative.* Let `f` have five continuous derivatives with `W₅ > 1`, `λ₅ ≥ 1` and
`1/W₅ ≤ |f⁽⁵⁾| ≤ λ₅/W₅`. For `η₃, η₄, η₅ > 0`, with `α̃₄ = 1/η₄ + (72/91)√α̃₃(η₄ + 1)^{1/6}`,
`γ̃₄ = (72/55)√β̃₃ η₄^{−1/6} + √(η₃α̃₃)` and `β₄` as above (all at `λ = λ₅`),

    |S_f[N+1, N+L]|² ≤ (L W₅^{−1/15} + η₅)(α₅ L + τ₅ L^{3/4} W₅^{2/15} + γ₅ √L W₅^{3/15}
                                            + ω₅ L^{1/4} W₅^{1/5} + β₅ W₅^{4/15}),
    α₅ = 1/η₅ + (392/435) √α̃₄ (η₅ + W₅^{−1/15})^{1/14},   τ₅ = (392/351) √γ̃₄ η₅^{−1/14},
    γ₅ = (98/78) √β₄ η₅^{−1/7} + √(η₄ α̃₄) W₅^{−2/15},       ω₅ = (98/78) √(η₄ γ̃₄) η₅^{−1/7},
    β₅ = (392/275) √(η₄ β₄) η₅^{−3/14}

(patel2022 Lemma 3.2, lines 266–270, proof displays (37)–(42), lines 271–308). Proof route for
both: §0.3 with `M = ⌈η_k W_k^{1/(2^{k−1}−1)}⌉`, the previous test applied to `g_m` with
`W = W_k/m` (`m/W_k ≤ |g_m^{(k−1)}| ≤ mλ_k/W_k`), the replacements `α ≤ α̃`, `γ ≤ γ̃`, the
subadditivity of the square root, and the lag sum of 1.4. When `W_k/m ≤ 1` the previous test
does not apply to `g_m`, but then the first term of the lag bound, `√α̃₃ · L (m/W₄)^{1/6}` for `k = 4` and
`√α̃₄ · L (m/W₅)^{1/14}` for `k = 5`, is at least `√α̃ · L` and already exceeds the trivial bound
`L`, because `α̃₃ ≥ 2 + 2√2` and
`α̃₄ ≥ (72/91)√(2 + 2√2) > 1`.

**Checks.**

- The rational coefficients come from the lag sum: `2/((7/6)(13/6)) = 72/91`,
  `2/((5/6)(11/6)) = 72/55`, `2/((2/3)(5/3)) = 9/5`, `2/((15/14)(29/14)) = 392/435`,
  `2/((13/14)(27/14)) = 392/351`, `2/((6/7)(13/7)) = 98/78`, `2/((11/14)(25/14)) = 392/275`.
- The printed statement of Lemma 3.1 gives `β₄` with the factor `18/20`; its proof (displays (33)
  and (35), lines 241 and 264) produces `18/10 = 9/5`, which is the value stated here. The
  smaller printed factor is not established by the proof.
- Exponents: `W₄^{−1/6+1/42} = W₄^{−1/7}` (the `α₄` term) and `W₄^{1/7+1/6−1/42} = W₄^{2/7}`
  (the `γ₄` term), which fixes the normalisation `M ≈ η₄ W₄^{1/7}`.

*Needs:* §0.3; §1.4.

### 1.6 the iterated van der Corput inequality

Let `X` be real, `Y > 0`, `f : ℝ → ℝ`, `d ≥ 1`, and let `H₁, …, H_d ≥ 1` be integers with
`H₁ + ⋯ + H_d ≤ Y`. For `a = (a₁, …, a_d)` with `1 ≤ a_r ≤ H_r − 1` let
`f_a(x) = Σ_{J ⊆ {1,…,d}} (−1)^{d−|J|} f(x + Σ_{j ∈ J} a_j)` be the iterated forward difference,
defined on `(X, X + Y − Σ_r a_r]`, and let
`T_d = (Y H₁ ⋯ H_d)⁻¹ Σ_a |Σ_{X < n ≤ X+Y−Σa_r} e(f_a(n))|`. With `B = 2 + 2√2`, prove

    |Y⁻¹ Σ_{X < n ≤ X+Y} e(f(n))| ≤ B · max(H₁^{−1/2}, H₂^{−1/4}, …, H_d^{−1/2^d}, B^{−1/2^d} T_d^{1/2^d})

(ariasdereyna2024 Theorem 7, lines 398–404, with the constant `B` and its property
`4/H + 4T ≤ max(B²/H, BT)` at lines 384–391). Proof route: induction on `d` from the normalised
corollary of §0.3 with `b_n = e(f(n))`, which gives `|Y⁻¹ Σ e(f(n))|² ≤ 4/H₁ + 4T₁` (the form used
at ariasdereyna2024 lines 405–415), applying the induction hypothesis to each `f_{a₁}` and
Hölder's inequality to the average over `a₁`.

**Checks.**

- The property `4/H + 4T ≤ max(B²/H, BT)` at `H = 1`, `T = 6`: `28 ≤ max(23.31, 28.97)` for
  `B = 2 + 2√2`, while `B = 4.5` gives `28 > max(20.25, 27)`. The property holds for all
  `H ≥ 1`, `T ≥ 0` exactly when `(B² − 4)(B − 4) ≥ 16`, and `2 + 2√2` is the least such `B > 4`.
- `d = 1`, `H₁ = 1`: the range of `a` is empty, `T₁ = 0`, and the bound reads `B = 4.83…`,
  weaker than the trivial bound `(Y + 1)/Y ≤ 2` for `Y ≥ 1`.
- `f(x) = x²`, `a = (1)`: `f_a(x) = 2x + 1`; `a = (1, 1)`: `f_a ≡ 2`, so for `d = 2` every inner
  sum is a sum of `e(2) = 1`.

*Needs:* §0.3; Mathlib `Real.sqrt`, Hölder's inequality for finite sums
(`Real.inner_le_Lp_mul_Lq_of_nonneg`).

### Examples

`f(x) = x/2` on `[0, 2]` attains the Kusmin–Landau bound `cot(π/4) = 1`. The second derivative
test at `λ = 1/W`, `Λ = 1/V`, `b − a = L − 1` reproduces Patel's sharper form. The third
derivative constants at `W₃ = η₃ = λ₃ = 1` are `α₃ = 6.702…`, `β₃ = 16.036…`.

### Dependencies

Layer 0 (§§0.1, 0.3). Mathlib: mean value theorem, `ContDiffOn`, `Real.cot`, finite Hölder and
Cauchy–Schwarz inequalities.

## Layer 2: integer points near smooth curves

### 2.1 reduction to exponential sums

Let `a` be real, `N ≥ 1`, `δ ∈ (0, 1/4)`, `K = ⌊(8δ)⁻¹⌋ + 1`, and `1 ≤ H ≤ K` an integer. For
every `f : ℝ → ℝ`,

    R(f, a, N, δ) ≤ 4N/H + (4/H) Σ_{h=1}^{H} |S_{hf}[a, a + N]|

(tmeemt-art11 lines 183–186; filaseta1990, stated there on `[N, 2N]`). Proof route: for `H = 1`
the right side is at least `4N ≥ N + 1`. For `H ≥ 2` we have `δ ≤ 1/8` and `Hδ ≤ 1/4`. The Fejér
kernel `F_H(x) = Σ_{|h| < H}(1 − |h|/H) e(hx) = H⁻¹ |Σ_{j=0}^{H−1} e(jx)|²` is nonnegative, and
for `‖x‖ < δ` it is at least `H (sin(π/4)/(π/4))² > 0.81 H` (from `sin t ≥ t sin(π/4)/(π/4)` on
`[0, π/4]`, a consequence of the concavity of `sin` on `[0, π]`, and `|sin πx| ≤ π‖x‖`). Summing `1_{‖f(n)‖ < δ} ≤ F_H(f(n))/(0.81H)` over the at most
`N + 1 ≤ 2N` integers gives
`R ≤ (1/(0.81H))(2N + 2Σ_{h=1}^{H−1} |S_{hf}|)`, which is below the stated bound.

**Checks.**

- `f ≡ 0`, `a = 0`, `N = 4`, `δ = 0.1` (`K = 2`), `H = 2`: `R = 5 ≤ 8/2 + 2(5 + 5) = 24`.
- `f(x) = x/2`, same data: `R = 3` (`n = 0, 2, 4`), `S_f = 1`, `S_{2f} = 5`, and
  `3 ≤ 4 + 2(1 + 5) = 16`.
- `δ = 0.2` gives `K = ⌊0.625⌋ + 1 = 1`: only `H = 1` is allowed. The TME-EMT form on `[N, 2N]`
  is the case `a = N`.

*Needs:* §0.1; §0.2; Mathlib `Real.sin_le`, `strictConcaveOn_sin_Icc`, `Complex.normSq`.
Jordan's inequality `Real.mul_le_sin` (constant `2/π`) is too weak here: it gives `4.93N/H`.

### 2.2 the first derivative test

Let `a` be real, `N ≥ 0`, `δ > 0`, and let `f` have a continuous derivative on `[a, a + N]` with
`λ₁ ≤ |f′(x)| ≤ c₁λ₁` there, `λ₁ > 0`, `c₁ ≥ 1`. Prove

    R(f, a, N, δ) ≤ 2c₁Nλ₁ + 4c₁Nδ + 2δ/λ₁ + 1

(tmeemt-art11 lines 114–119; zhao2024 Theorem 2.5, lines 211–216; bordelles2012 Theorem 5.6,
stated on `[N, 2N]`). Proof route: if `δ ≥ 1/4` the right side is at least `N + 1`. Otherwise
`f′` has constant sign, the image of `f` is an interval of length at most `c₁λ₁N`, and the
integers `m` with `‖f(x) − m‖ < δ` for some `x` number at most `c₁λ₁N + 2δ + 1`; for each such `m`
the set `{x : |f(x) − m| < δ}` is an interval of length at most `2δ/λ₁` (mean value theorem),
containing at most `2δ/λ₁ + 1` integers. If only one `m` occurs this gives `2δ/λ₁ + 1`; if two
occur then `c₁λ₁N ≥ 1 − 2δ > 1/2`, so `1/λ₁ < 2c₁N`, and the product
`(c₁λ₁N + 2δ + 1)(2δ/λ₁ + 1)` is at most the stated bound because `4δ²/λ₁ ≤ 8c₁Nδ² ≤ 2c₁Nδ` and
`2δ ≤ c₁λ₁N`.

**Checks.**

- `f(x) = x/10`, `a = 0`, `N = 20`, `λ₁ = 1/10`, `c₁ = 1`, `δ = 0.05`: `R = 3` (`n = 0, 10, 20`)
  and the bound is `4 + 4 + 1 + 1 = 10`.
- `δ = 0.49`, any data: every integer may count, `R ≤ N + 1`, and `4c₁Nδ + 1 ≥ 1.96N + 1`.
- A constant `f` violates `λ₁ > 0`; with `f ≡ 0`, `R = N + 1` for integer `a, N` and no bound
  independent of `N` and `δ` can hold.

*Needs:* §0.2; Mathlib `exists_deriv_eq_slope`, `Nat.card` of integer points in an interval.

### 2.3 Huxley's reduction and the second derivative test

*Reduction.* For any `f`, real `a`, `N ≥ 1`, `δ > 0` and real `1 ≤ A ≤ N`, with
`Δ_h f(x) = f(x + h) − f(x)`,

    R(f, a, N, δ) ≤ N/A + Σ_{1 ≤ h ≤ A} R(Δ_h f, a, N − h, 2δ) + 1

(zhao2024 Lemma 2.6, lines 284–319; bordelles2012 Lemma 5.7). Proof: list the counted integers
`n₁ < ⋯ < n_k`; consecutive gaps `h = n_{j+1} − n_j` sum to at most `N`, so at most `N/A` gaps
exceed `A`, and a gap `h ≤ A` starting at `n_j` gives `‖Δ_h f(n_j)‖ < 2δ`.

*Second derivative test.* Let `f` have two continuous derivatives on `[a, a + N]`, `N ≥ 1`, with
`λ₂ ≤ |f″| ≤ c₂λ₂`, `λ₂ > 0`, `c₂ ≥ 1` and `Nλ₂ ≥ c₂⁻¹`, and let `δ ∈ (0, 1/2)`. Prove

    R(f, a, N, δ) ≤ 6((3c₂)^{1/3} N λ₂^{1/3} + (12c₂)^{1/2} N δ^{1/2} + 1)

(tmeemt-art11 lines 130–137; zhao2024 Theorem 2.7, lines 324–330; bordelles2012 Theorem 5.8,
stated on `[N, 2N]`). Proof route (zhao2024 lines 320–322 and the proof following line 330): the
mean value theorem gives `hλ₂ ≤ |(Δ_h f)′| ≤ c₂hλ₂` on `[a, a + N − h]`; apply §2.2 to each
`Δ_h f` with `λ₁ = hλ₂`, `c₁ = c₂` and `2δ` in place of `δ`, sum over `h ≤ A` using
`Σ_{h ≤ A} 1/h ≤ 1 + log A`, and choose `A` as in the source's proof; the hypothesis
`Nλ₂ ≥ c₂⁻¹` keeps the chosen `A` in `[1, N]`.

**Checks.**

- Reduction with `f(x) = x/2`, `δ = 0.1`, `a = 0`, `N = 4`, `A = 2`: `R = 3`; `Δ₁f ≡ 1/2`
  counts nothing at `2δ = 0.2`, `Δ₂f ≡ 1` counts all three points of `[0, 2]`, and the right side
  is `2 + 0 + 3 + 1 = 6 ≥ 3`. Using `δ` instead of `2δ` in the differenced count would be false in
  general: `‖f(n + h) − f(n)‖` can be as large as `‖f(n + h)‖ + ‖f(n)‖`.
- `f(x) = x²/100` has `f″ ≡ 1/50`; with `c₂ = 1` and `N = 10`, `Nλ₂ = 0.2 < 1` violates the
  hypothesis, while `N = 50` satisfies it and the bound is
  `6(3^{1/3} · 50 · (1/50)^{1/3} + √12 · 50 · √δ + 1) ≈ 6(19.57 + 173.2√δ + 1)`.
- The TME-EMT statements on `[N, 2N]` are the case `a = N`; the proofs use only the length `N`.

*Needs:* §2.2; §0.2; Mathlib `exists_deriv_eq_slope`.

### Examples

`R(x/3, 0, 6, 0.1) = 3`; the first derivative test for `f(x) = x/10` on `[0, 20]` at `δ = 0.05`
gives `3 ≤ 10`; the exponential-sum reduction for `f(x) = x/2` on `[0, 4]` gives `3 ≤ 16`.

### Dependencies

Layer 0 (§§0.1, 0.2). Mathlib: mean value theorem, Jordan's inequality.

## Layer 3: explicit Pólya–Vinogradov inequalities

Throughout, `χ : DirichletCharacter ℂ q`, `q ≥ 2`, `ψ_q = ZMod.stdAddChar` (so `ψ_q(b) = e(b/q)`),
and `τ(χ) = gaussSum χ ψ_q`. A primitive character of level `q ≥ 2` has `q ≥ 3`, since no
character of level `2` is primitive.

### 3.1 the Gauss-sum expansion of a character interval sum

Let `χ` be primitive modulo `q ≥ 2`. Prove that for every integer `n`,
`χ(n) τ(χ⁻¹) = Σ_{b mod q} χ⁻¹(b) e(bn/q)`, and hence for `M ∈ ℤ`, `N ∈ ℕ`,

    S_χ(M, N) = τ(χ⁻¹)⁻¹ Σ_{b=1}^{q−1} χ⁻¹(b) Σ_{M < n ≤ M+N} e(bn/q),
    |S_χ(M, N)| ≤ q^{−1/2} Σ_{b=1}^{q−1} min(N, 1/sin(πb/q))

(pomerance2011 lines 229–240, displays (7)–(10); montgomeryvaughan2007 §9.4). Proof: Mathlib
`gaussSum_mulShift_of_isPrimitive` applied to the primitive character `χ⁻¹`
(`DirichletCharacter.IsPrimitive.inv`) gives the first identity, including non-units `n`, where
both sides vanish; `τ(χ⁻¹) ≠ 0` and `|τ(χ⁻¹)| = √q` by Tau Ceti
`DirichletCharacter.IsPrimitive.norm_gaussSum` with the primitive additive character `ψ_q`
(`ZMod.isPrimitive_stdAddChar`); the inner geometric sum has modulus
`|sin(πbN/q)|/sin(πb/q)` for `1 ≤ b ≤ q − 1`. For even `χ` only the cosine parts survive and for
odd `χ` only the sine parts (pomerance2011 displays (8)–(10)).

**Checks.**

- The quadratic character modulo `3`: `τ(χ) = e(1/3) − e(2/3) = i√3`, `|τ(χ)| = √3`, and
  `χ(1) τ(χ⁻¹) = χ(1)τ(χ) = i√3` matches `Σ_b χ(b) e(b/3)` (here `χ⁻¹ = χ`).
- `q = 3`, `M = 0`, `N = 1`: the right side is
  `(i√3)⁻¹(e(1/3) − e(2/3)) = 1 = χ(1)`; a version with `τ(χ)` in place of `τ(χ⁻¹)` agrees here
  because `χ` is real, but for the quartic character modulo `5` the two differ by the factor
  `χ(−1) = −1` (CharacterSumsOverFiniteFields §7.1 checks).
- The principal character modulo `4` is not primitive and its Gauss sum is `0`; the expansion
  needs primitivity.

*Needs:* Mathlib `gaussSum_mulShift_of_isPrimitive`, `DirichletCharacter.IsPrimitive.inv`,
`ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`; Tau Ceti
`DirichletCharacter.IsPrimitive.norm_gaussSum`; §0.4.

### 3.2 the classical explicit Pólya–Vinogradov inequality

For `q ≥ 2`, `Σ_{b=1}^{q−1} 1/sin(πb/q) < (2q/π)(log q + log(4/π) + π²/(12q²))` (pomerance2011
proof of Lemma 4, displays (4)–(5), lines 183–203: convexity of `csc` on `(0, π)` and
`∫ csc = log cot`). Consequently, for primitive `χ` modulo `q ≥ 2`,

    M_χ < (2/π) √q (log q + log(4/π) + π²/(12q²)),

and for every nonprincipal `χ` modulo `q` with conductor `q*` and `r` as in §0.6,
`M_χ < 2^{ω(r)}(2/π)√q* (log q* + log(4/π) + π²/(12q*²))` (montgomeryvaughan2007 §9.4).
In particular `|S_χ(M, N)| ≤ √p log p` for every nonprincipal `χ` modulo a prime `p ≥ 3`
(modulo `2` every character is principal).

**Checks.**

- `q = 3`: `Σ csc = 2 · 2/√3`, so `M_χ ≤ (1/√3)(4/√3) = 4/3`, against `M_χ = 1` for the quadratic
  character and the closed form `(2√3/π)(1.0986 + 0.2416 + 0.0914) ≈ 1.579`.
- `q = 5`: `Σ csc = 2(1.7013 + 1.0515) = 5.506`, so `M_χ ≤ 2.462`, against `M_χ = 2` for the
  quadratic character (§0.4).
- `√p log p` dominates for `p ≥ 3`: at `p = 3`,
  `(2/π)(1.0986 + 0.2416 + 0.0914) = 0.911 ≤ 1.0986`; at `p = 2` the left side `0.726` exceeds
  `log 2 = 0.693`, but there is no nonprincipal character modulo `2`. The nonprincipal hypothesis
  is needed: the principal character has `S(0, N)` of size about `N(1 − 1/p)`, unbounded in `N`.

*Needs:* §3.1; §0.6; Mathlib `ConvexOn` for `csc` on `(0, π)` (from the second derivative),
`intervalIntegral`, `DirichletCharacter.eq_one_iff_conductor_eq_one`.

### 3.3 trigonometric series and Pomerance's lemmas

- *Closed forms.* For `0 < x < 2π`, `Σ_{j ≥ 1} sin(jx)/j = (π − x)/2` and
  `Σ_{j ≥ 1} cos(jx)/j = −log(2 sin(x/2))`, the series converging (not absolutely), and the tail
  `R_n(x) = Σ_{j > n} sin(jx)/j` satisfies `|R_n(x)| ≤ 1/((n + 1) sin(x/2))` for `0 < x ≤ π`
  (pomerance2011 proof of Lemma 4, line 180). Proof: the series converge by Dirichlet's test, and
  Abel's limit theorem (Mathlib `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`) applied
  to `Σ zʲ/j = −log(1 − z)` (Mathlib `Complex.hasSum_taylorSeries_neg_log`) at `z = e^{ix}` gives
  both closed forms; the tail bound is summation by parts against
  `|Σ_{j=a}^{b} e^{ijx}| ≤ 1/sin(x/2)`.
- *Lemma 2.* For all real `x` and integers `n ≥ 1`, `C_n(x) = Σ_{j=1}^{n} cos(jx)/j > −log 2 − 2/n`
  (pomerance2011 Lemma 2, lines 112–134). Proof route of the source: the minimum of `C_n` on
  `[0, π]` is at `x_n = ⌊(n + 1)/2⌋ · 2π/(n + 1)` (Young); an alternative route through the
  closed form and the same tail bound for the cosine series:
  `C_n(x) ≥ −log(2 sin(x/2)) − 1/((n + 1) sin(x/2))` for `0 < x ≤ π`, which is at
  least `−log 2 − 2/(n + 1)` for `x ≥ π/3`, while for `x ≤ π/(2n)` every term is nonnegative and
  for `π/(2n) ≤ x ≤ π/3` the function `−log(2s) − 1/((n + 1)s)` of `s = sin(x/2) ∈ [1/(2n), 1/2]`
  increases up to `s = 1/(n + 1)` and decreases after it, so it is at least its smaller endpoint
  value `min(log n − 2n/(n + 1), −2/(n + 1)) > −2/n`.
- *Lemma 3.* For all real `x` and `n ≥ 1`,
  `Σ_{j=1}^{n} |sin jx|/j < (2/π) log n + (2/π)(γ + log 2 + 3/n)` (pomerance2011 Lemma 3,
  lines 147–161). Proof: the absolutely convergent expansion
  `|sin θ| = 2/π − (4/π) Σ_{m ≥ 1} cos(2mθ)/(4m² − 1)` (Mathlib `hasSum_fourier_series_of_summable`
  after computing the Fourier coefficients of `|sin|`), Lemma 2 at `2mx`, `Σ 1/(4m² − 1) = 1/2`,
  and `H_n < log n + γ + 1/n`.
- *Lemma 4.* For `q ≥ 2` and `n ≥ 1`,
  `Σ_{a=1}^{q−1} |R_n(2πa/q)| < (2/π)(q/(n + 1))(log q + log(4/π) + π²/(12q²))`
  (pomerance2011 Lemma 4, lines 172–204), from the tail bound and §3.2's cosecant sum.

**Checks.**

- `C_1(π) = −1 > −log 2 − 2 = −2.69`; `C_3(π) = −1 + 1/2 − 1/3 = −5/6 > −log 2 − 2/3 = −1.36`;
  the limit `−log 2` is sharp as `n → ∞` (`C_n(π) → −log 2`).
- At `x = π/2`, `Σ sin(jx)/j = 1 − 1/3 + 1/5 − ⋯ = π/4 = (π − π/2)/2`, and
  `Σ cos(jx)/j = −1/2 + 1/4 − ⋯ = −(log 2)/2 = −log(2 sin(π/4))`.
- `n = 1`, `x = π/2`: `|sin x| = 1 < (2/π)(0 + 0.5772 + 0.6931 + 3) = 2.72`; Lemma 3's bound
  fails without the constant term: `(2/π) log 1 = 0 < 1`.
- The alternative route at `n = 2`: on `s ∈ [1/4, 1/2]` the endpoint values of
  `−log(2s) − 1/(3s)` are `log 2 − 4/3 = −0.640` and `−2/3 = −0.667`, so the minimum is at the right
  endpoint, below the left-endpoint value; both exceed `−2/n = −1`.

*Needs:* §3.2; Mathlib `Complex.hasSum_taylorSeries_neg_log`,
`Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`, `hasSum_fourier_series_of_summable`,
`Real.eulerMascheroniConstant`, `harmonic_le_one_add_log`.

### 3.4 Pomerance's explicit Pólya–Vinogradov inequality

For `χ` primitive modulo `q > 1`,

    M_χ ≤ (2/π²)√q log q + (4/π²)√q log log q + (3/2)√q   (χ even),
    M_χ ≤ (1/(2π))√q log q + (1/π)√q log log q + √q       (χ odd)

(pomerance2011 Theorem 1, lines 78–86; proof §§3–4, lines 263–438). Proof route (the
Landau–Bateman argument): for an initial interval `[0, N]`, write `Σ_{a=0}^{N} χ(a)` as
`χ(N)/2 + Σ_a χ(a)Φ(2πa/q)` with `Φ` the indicator of `(0, 2πN/q)` taking the value `1/2` at the
endpoints, expand `Φ` in its Fourier series (pointwise convergent at the points `2πa/q` by the
closed forms of §3.3), truncate at `n`, evaluate the main part with §3.1's parity forms, bound it
by Lemma 3 and the tail by Lemma 4, and choose `n`; for even `χ` double by §0.5, for odd `χ` use
`M_χ ≤ 2 max_N |Σ_{a ≤ N} χ(a)|` and the sharper odd main term.

**Checks.**

- `q = 3` (odd quadratic character, `M_χ = 1`): the odd bound is
  `0.1592 · 1.732 · 1.0986 + 0.3183 · 1.732 · 0.0940 + 1.732 = 2.08 ≥ 1`.
- `q = 5` (even, `M_χ = 2`): `0.2026 · 2.236 · 1.609 + 0.4053 · 2.236 · 0.4759 + 3.354 = 4.51 ≥ 2`.
- `log log q` is defined and positive for `q ≥ 3`, the least primitive level above `1`; at
  `q = 2` (no primitive character) `log log 2 < 0`.

*Needs:* §§0.5, 3.1, 3.3; Mathlib `DirichletCharacter.Even`, `DirichletCharacter.Odd`.

### 3.5 Lapkova's constants and the rounded Frolenkov–Soundararajan forms

For `χ` primitive modulo `q > 1`,

    M_χ ≤ (2/π²)√q log q + 0.9467√q + 1.668    (χ even),
    M_χ ≤ (1/(2π))√q log q + 0.8204√q + 1.0285  (χ odd)

(lapkova2018 Lemma 3A, lines 245–282, proof lines 291–408). Consequently
`M_χ ≤ (2/π²)√q log q + √q` for even `χ` and `q ≥ 980`, and `M_χ ≤ (1/(2π))√q log q + √q` for odd
`χ` and `q ≥ 33` (tmeemt-art15 lines 114–118 and hunter2016 Theorem 1.3, lines 680–684, quote
Frolenkov–Soundararajan's Theorem 2 with the ranges `q ≥ 1200` and `q ≥ 40`, which these
contain). Proof route: for `q > 25`, the argument of frolenkovsoundararajan2013's proof of
Theorem 2, a Fejér-smoothed form of the expansion of §3.1, with the parameter
`L = ⌊π²√q/4 + 9.15⌋` (even) or `L = ⌊π√q + 9.15⌋` (odd), which satisfies `1 ≤ L ≤ q` for
`q > 25`, the split used in lapkova2018's proof of Lemma 3A (the inequality `L ≤ q` in fact holds
from `q = 19` for even and from `q = 24` for odd `χ`); for `q ≤ 25` the Layer 6 hypothesis
`LapkovaSmallModuliVerified` (the maximum over primitive characters of level at most `25`).
The rounded forms follow from `1.668 ≤ 0.0533√q` (`q ≥ 980`) and `1.0285 ≤ 0.1796√q` (`q ≥ 33`).

**Checks.**

- Even, `q = 980`: `0.9467√980 + 1.668 = 29.637 + 1.668 = 31.305 ≤ √980 = 31.305`; at `q = 979`
  the rounded form does not follow from Lemma 3A.
- Odd, `q = 33`: `0.8204 · 5.745 + 1.0285 = 5.742 ≤ 5.745`; at `q = 32` it fails (`5.669 > 5.657`).
- The parameter `L` of the proof: for even `χ`, `q = 19` gives `π²√19/4 + 9.15 = 19.90` and
  `L = 19 ≤ 19`, while `q = 18` gives `L = 19 > 18`; for odd `χ`, `q = 24` gives
  `π√24 + 9.15 = 24.54` and `L = 24 ≤ 24`, while `q = 23` gives `L = 24 > 23`. The split at
  `q = 25` is sufficient, not the exact range of `1 ≤ L ≤ q`.
- Against §3.4 at `q = 10⁶`: beyond the common term `(2/π²)√q log q`, Pomerance's even bound adds
  `(4/π²)√q log log q + (3/2)√q ≈ 1064 + 1500`, Lapkova's adds `0.9467√q + 1.668 ≈ 948`.

*Needs:* §3.1; §0.5; Layer 6 `LapkovaSmallModuliVerified`.

### 3.6 the Frolenkov–Soundararajan bound for nonprincipal characters

For every nonprincipal `χ` modulo `q ≥ 1000` and all `M ∈ ℤ`, `N ∈ ℕ`,
`|S_χ(M, N)| ≤ (1/(π√2))√q(log q + 6) + √q` (tmeemt-art15 lines 106–109;
frolenkovsoundararajan2013 Corollary 1; hunter2016 Theorem 1.2, lines 651–664, quotes the same
constant for initial sums and `q > 100`). Proof route: frolenkovsoundararajan2013 Theorem 1, a
Pólya–Vinogradov bound for sums of a periodic function against a smoothed interval weight, applied
to `χ` and specialised as in their Corollary 1. The leading constant `1/(π√2) = 0.2251` is
Landau's for imprimitive characters; for primitive `χ` and `q ≥ 1000`, §3.5 is stronger.

**Checks.**

- `q = 1000`: the bound is `0.2251 · 31.62 · 12.908 + 31.62 = 123.5`, against the trivial
  `φ(1000)/2 = 200`.
- For primitive even `χ`, `q = 10⁴`: §3.5 gives `0.2026 · 100 · 9.21 + 94.67 + 1.67 = 283`, and
  this bound gives `0.2251 · 100 · 15.21 + 100 = 442`.
- The crude route `M_χ ≤ 2^{ω(r)} M_{χ*}` of §0.6 with §3.5 does not reach this constant: for
  `q = 6q*` with `χ*` even the factor `4 · (2/π²)/√6 = 0.331 > 0.2251`.

*Needs:* §0.4; the cited corollary of frolenkovsoundararajan2013.

### Examples

For the quadratic character modulo `5`: `M_χ = 2`, the classical bound `2.462`, Pomerance's even
bound `4.51`. The rounded Frolenkov–Soundararajan even form starts at `q = 980` from Lemma 3A.

### Dependencies

Layer 0 (§§0.4–0.6). Mathlib: Gauss sums, primitive characters, Abel's limit theorem, Fourier
series of continuous periodic functions. Tau Ceti: the primitive Gauss-sum norm. Layer 6:
`LapkovaSmallModuliVerified`.

## Layer 4: explicit Burgess inequalities for a prime modulus

Throughout, `p` is prime, `χ ≠ 1` is a character modulo `p` (hence primitive), and for `r ≥ 1`
the double factorial is `(2r − 1)!! = 1 · 3 ⋯ (2r − 1)`.

### 4.1 Burgess's moment bound

*Degenerate tuples.* For integers `H ≥ 1`, `r ≥ 1` and `d ≥ 2`, call a tuple
`(b₁, …, b_{2r}) ∈ {1, …, H}^{2r}` `d`-degenerate when, for every value `v`, the number of `i ≤ r`
with `b_i = v` is congruent modulo `d` to the number of `i > r` with `b_i = v`. Prove that there
are at most `(2r − 1)!! H^r` `d`-degenerate tuples (the count behind trevino2015kth Theorem 1.2;
booker2006 lines 506–507 for `d = 2`). Proof route: the number of `d`-degenerate tuples equals the
moment `E|Z₁ + ⋯ + Z_H|^{2r}` for independent uniformly distributed `d`-th roots of unity `Z_v`,
because `E Z^a conj(Z)^c` is `1` when `d | a − c` and `0` otherwise. For even `d` every value
occurs an even number of times, and each such tuple arises from one of the `(2r − 1)!!` perfect
matchings of the `2r` positions and a value for each matched pair. For `d > r` the congruences
force equal counts, so the second half is a rearrangement of the first: at most
`r! H^r ≤ (2r − 1)!! H^r` tuples. For odd `d` with `3 ≤ d ≤ r`, rotating each `Z_v` by an
independent uniform angle in `[0, 2π/d)` makes it uniform on the circle, whose moment counts the
rearrangements, and Jensen's inequality bounds the count by `(π/(d sin(π/d)))^{2r} r! H^r`; the
factor is largest at `d = 3`, where it is `1.4622^r`, and `1.4622^r r! ≤ (2r − 1)!!` for `r ≥ 5`;
the two cases left, `d = 3` with `r = 3` or `4`, have the exact counts `6H³ − 8H² + 3H ≤ 15H³` and
`24H⁴ − 56H³ + 42H² − 9H ≤ 105H⁴`.

*Moment bound.* For every real `B > 0` and integer `r ≥ 1`,

    Σ_{x mod p} |Σ_{1 ≤ b ≤ B} χ(x + b)|^{2r} ≤ (2r − 1)!! B^r p + (2r − 1) B^{2r} √p

(trevino2015 Theorem A, lines 57–63, stated there under `r ≤ 9B` and proved in trevino2015kth
Theorem 1.2; for quadratic `χ`, booker2006 displays (28)–(30), lines 494–510). Proof: a full
period of `χ` sums to zero, so the inner sum is unchanged when `⌊B⌋` is replaced by its residue
modulo `p`, and it suffices to take `H = ⌊B⌋` with `1 ≤ H < p` (for `H = 0` the left side is `0`).
Expand the `2r`-th power; with `d` the order of `χ`, the term of a tuple is `Σ_x χ(f(x))` with
`f(X) = ∏_{i ≤ r}(X + b_i) · ∏_{i > r}(X + b_i)^{d−1}` (because `conj χ(y) = χ(y^{d−1})` for every
`y`, both sides vanishing at `y = 0`). Since `H < p`, distinct `b_i` give distinct roots, and `f`
is a constant times a `d`-th power exactly when the tuple is `d`-degenerate; these tuples
contribute at most `p` each. For the others CharacterSumsOverFiniteFields §4.7 at `F = ZMod p`
bounds the inner sum by `(m − 1)√p ≤ (2r − 1)√p`, `m ≤ 2r` being the number of distinct `b_i`.
The source's hypothesis `r ≤ 9B` is not used.

**Checks.**

- `r = 1`, `B < p`: `Σ_x |Σ_{b ≤ B} χ(x + b)|² = ⌊B⌋p − ⌊B⌋²` exactly (for `b ≠ b′` the cross
  sum `Σ_x χ(x + b) conj χ(x + b′)` is `−1`), below `Bp + B²√p`.
- `r = 2`, `H = 2`: for even `d` the degenerate tuples in `{1, 2}⁴` are the `2` constant tuples and
  the `6` with two of each, `8 ≤ 3 · 4 = 12`; for `d ≥ 3` they are the `6` tuples whose second half
  rearranges the first. With `H = 1` the count is `1 ≤ 3`.
- Odd multiplicities occur for odd `d`: at `d = 3`, `r = 3` the tuple `(1, 1, 1, 2, 2, 2)` is
  degenerate (`f = (X + 1)³(X + 2)⁶` is a cube) although no value occurs an even number of times;
  the exact count `6H³ − 8H² + 3H` is `22 ≤ 120` at `H = 2`.
- The larger set of tuples in which every value occurs at least twice contains every degenerate
  tuple but is too large: at `r = 6`, `H = 100` it has `1.0672 · 10¹⁶` elements, more than
  `11!! · 100⁶ = 1.0395 · 10¹⁶`, while the `2`-degenerate tuples number `9.398 · 10¹⁵`.
- `(2r − 1)!! = (2r)!/(2^r r!)`: `r = 3` gives `15 = 720/(8 · 6)`; the factor `(2r)!/r!` in its
  place would be `120`.

*Needs:* CharacterSumsOverFiniteFields §4.7; Tau Ceti `DirichletCharacter.sum_range_level_eq_zero`;
Mathlib `Polynomial`, `ZMod`, `MulChar`, `ConvexOn.map_integral_le` (Jensen's inequality).

### 4.2 the multiplicative energy count

For an integer `1 ≤ A < p`, a nonempty set `𝒜` of integers in `[1, A]` (the multipliers),
`M ∈ ℤ` and `N ≥ 1`, let `v(x) = #{(a, n) : a ∈ 𝒜, M < n ≤ M + N, n ≡ a x (mod p)}` for
`x ∈ ZMod p`, `V₁ = Σ_x v(x) = |𝒜|N` and `V₂ = Σ_x v(x)²`. Prove, for `𝒜` the set of all integers
in `[1, A]`:

- if `N < p` and `28 ≤ A < N/12`, then `V₂ ≤ 2AN(AN/p + log(1.85A))` (trevino2015 Lemma 1,
  lines 210–219, proof lines 462–622);
- if `A ≥ 30`, `N > 7A` and `2AN < p`, then `V₂ ≤ 2AN log(1.85A)` (trevino2015 Lemma 6,
  lines 1088–1093);

and, for `𝒜` the set of primes in `[1, A]` with `A ≥ 2`:

- if `2AN ≤ p`, then
  `V₂ ≤ π(A)N + 2N Σ_{a ∈ 𝒜} (π(a) − 1)/a + 2 Σ_{a ∈ 𝒜} (π(a) − 1)` (mcgown2012 Lemma A.7,
  lines 1130–1142, with Lemma A.6, lines 1119–1129).

Proof route: `V₂` counts quadruples with `a₁n₂ ≡ a₂n₁ (mod p)`; the diagonal `a₁ = a₂` gives
`|𝒜|N` (for `N < p`); for `a₁ ≠ a₂` the pairs with `a₁n₂ − a₂n₁ = kp` number at most
`N gcd(a₁, a₂)/max(a₁, a₂) + 1` (trevino2015 Lemma 5, lines 419–423), and the resulting sums over
`a₁, a₂` are bounded by Treviño's explicit estimates for `Σ φ(d)/d` and `Σ log` (Lemmas 2–4,
lines 223–418); when `2AN ≤ p`, `k` is determined by `(a₁, a₂)` (it lies within
`(a₁ + a₂)N/(2p) < 1/2` of `(a₁ − a₂)(M + N/2)/p`), and for distinct primes the count is at most
`N/max(a₁, a₂) + 1`, which summed over the `π(a₂) − 1` primes `a₁ < a₂` gives McGown's bound.

**Checks.**

- `V₁ = |𝒜|N` because each pair `(a, n)` has exactly one `x = n a⁻¹` (`a < p` is invertible).
- `A = 28`, `N = 400`, `p = 10⁷`: Lemma 1 gives `V₂ ≤ 22400(0.00112 + 3.9474) = 88,447`
  (`log 51.8 = 3.94739`), while the trivial bound `v(x) ≤ A` gives `V₂ ≤ A · V₁ = 313,600`.
- The hypothesis `A < N/12` excludes `A = 28`, `N = 300` (`300/12 = 25`).
- Prime multipliers `𝒜 = {2, 3, 5}`, `M = 0`, `N = 100`, `p = 1009` (`2AN = 1000 ≤ p`): the
  quadruples are the `300` diagonal ones and, for each ordered pair of distinct primes, the
  solutions of `a₁n₂ = a₂n₁` with `n₁, n₂ ≤ 100`, namely `33`, `20` and `20` for `{2, 3}`, `{2, 5}`
  and `{3, 5}`; so `V₂ = 300 + 2 · 73 = 446`, below McGown's bound
  `300 + 200(0 + 1/3 + 2/5) + 2(0 + 1 + 2) = 452.7`.

*Needs:* Mathlib `ZMod`, `Nat.totient`, `Nat.gcd`, `Nat.primeCounting`.

### 4.3 Burgess's amplification inequality

Let `M ∈ ℤ`, `N ≥ 1`, `r ≥ 1`, reals `1 ≤ A < p` and `B ≥ 1`, and a nonempty set `𝒜` of integers
in `[1, A]`; put `H = |𝒜|⌊B⌋`, `E(h) = max_{K ∈ ℤ} |S_χ(K, h)|` and
`W = Σ_{x mod p} |Σ_{1 ≤ b ≤ B} χ(x + b)|^{2r}`. Prove

    |S_χ(M, N)| ≤ H⁻¹ V₁^{1−1/r} V₂^{1/(2r)} W^{1/(2r)} + (2/H) Σ_{a ∈ 𝒜, b ≤ B} E(ab)

with `v`, `V₁`, `V₂` as in §4.2 for `𝒜` and `⌊A⌋` (trevino2015 displays (26)–(29),
lines 643–700, where `𝒜` is the set of all integers in `[1, A]`; mcgown2012 Lemma A.5,
lines 1083–1118, where `𝒜` is the set of primes in `[1, A]`). Proof: for every `h ≥ 0`,
`S_χ(M, N) − Σ_{M<n≤M+N} χ(n + h) = S_χ(M, h) − S_χ(M + N, h)`, of modulus at most `2E(h)`; average
over `h = ab` with `a ∈ 𝒜` and `1 ≤ b ≤ B`; since `χ(n + ab) = χ(a)χ(a⁻¹n + b)`, the main part is
at most `Σ_x v(x)|Σ_b χ(x + b)|`; apply Hölder's inequality with exponents `(1 − 1/r)⁻¹`, `2r`,
`2r`.

**Checks.**

- `A = B = 1`, `N < p`: `𝒜 = {1}`, `H = 1`, `v` is the indicator of the residues of
  `(M, M + N]`, `V₁ = V₂ = N`, and with `r = 1`, `W = p − 1` the inequality reads
  `|S| ≤ √(N(p − 1)) + 2E(1)`, weaker than the trivial bound `N` whenever `N < p − 1`.
- Prime multipliers need `A ≥ 2`: for `1 ≤ A < 2` the set of primes in `[1, A]` is empty and
  `H = 0`, which the hypothesis that `𝒜` is nonempty excludes; at `A = 5`, `B = 3` it is
  `{2, 3, 5}` and `H = 9`, against `H = 15` for all multipliers.
- The shift identity at `h = N` gives `S(M, N) − S(M + N, N) = S(M, N) − S(M + N, N)`, a tautology;
  the identity holds for every `h`, not only `h < N`.
- `A ≥ p` is excluded: `a = p` is not invertible and `χ(n + pb) = χ(n)` gives no averaging.

*Needs:* §0.4; §4.2 (definitions); Mathlib `Real.inner_le_Lp_mul_Lq_of_nonneg` (three-factor
Hölder by iteration), `ZMod.unitOfCoprime`.

### 4.4 McGown's parametric Burgess inequality and his table

*Parametric form.* Let `p` be an odd prime, `r ≥ 2`, and reals `d > 4`, `C ≥ 1`, `p₀ ≥ 2` with

    (A.1)  C^r p₀^{1/4 − 1/(4r)} (log p₀)^{1/2} ≥ 4d(d + 1)r,
    (A.2)  C ≥ ((d + 1)(2r − 1)(4r − 1))^{1/(2r)} / (1 − 2 d^{−(1 − 1/r)}).

Then, under AnalyticNumberTheoryPartI's `RosserSchoenfeldFiniteRangeInput`, for `p ≥ p₀`, every
integer `N₀` and every integer `1 ≤ H ≤ √(rd) · p^{1/2 + 1/(4r)}`,
`|Σ_{N₀ < n ≤ N₀+H} χ(n)| ≤ C H^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` (mcgown2012
Theorem A.9, lines 1209–1233; the statement there allows `H` up to a coefficient times
`p^{1/2+1/(4r)}` that is at least `√(rd)`). Proof route (mcgown2012 lines 1234–1432): induction
on `H`, with the trivial bound for `H < C^r p^{1/4+1/(4r)}(log p)^{1/2}`; write `H₀ = AB` with
`H/(d + 1) < H₀ ≤ H/d` and `B = ⌊4r p^{1/(2r)}⌋ ≥ 4r`; apply §4.3 with `𝒜` the primes in
`[1, A]` (McGown's Lemma A.5) and the induction hypothesis in the error term; bound `W` by §4.1,
which with `(2r − 1)!! ≤ (4r)^r/4` and `B + 1 > 4r p^{1/(2r)}` gives `W ≤ (2r − 1/2)B^{2r}√p`;
bound `V₂ ≤ 2π(A)H` by the prime-multiplier count of §4.2 (`2AH ≤ p` holds by the choice of `A`),
using `Σ_{a prime ≤ X} (π(a) − 1)/a < π(X)/3` for every `X ≥ 2` (McGown's Lemma A.8,
lines 1192–1204: direct evaluation for `X ≤ 100`, and `π(n) − 1 ≤ n/3` for `n ≥ 100` because the
primes above `5` lie in the eight classes prime to `30`) and `π(A) ≤ (A + 1)/2 ≤ H/(2dB) + 1/2`;
and bound `H/π(A)` by `π(A) ≥ A/(1 + log A)` for integers `A ≥ 3`, which is AnalyticNumberTheoryPartI
§0.5 for `A ≥ 59` and a direct count of primes for `3 ≤ A ≤ 58`. The closing inequality is (A.5),
equivalent to (A.2).

*Table.* Under `RosserSchoenfeldFiniteRangeInput`, for primes `p ≥ 2 · 10⁴`, `2 ≤ r ≤ 15` and
`1 ≤ H ≤ 4p^{1/2+1/(4r)}`,
`|Σ_{N₀ < n ≤ N₀+H} χ(n)| < C(r) H^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` with
`C(2) = 10.0366`, `C(3) = 4.9539`, `C(4) = 3.6493`, `C(5) = 3.0356`, `C(6) = 2.6765`,
`C(7) = 2.4400`, `C(8) = 2.2721`, `C(9) = 2.1467`, `C(10) = 2.0492`, `C(11) = 1.9712`,
`C(12) = 1.9073`, `C(13) = 1.8540`, `C(14) = 1.8088`, `C(15) = 1.7700` (mcgown2012 Theorem A.1,
lines 1030–1050; trevino2015 Theorem C, lines 113–128; tmeemt-art15 lines 291–338). Proof: the
parametric form at `d = 11`, `p₀ = 2 · 10⁴` (mcgown2012 line 1433) with `C = C₀(r)`, the right
side of (A.2), using the Layer 6 hypothesis `McGownTableCertificate`; since `√(11r) ≥ 4` the range
of `H` is covered, and `C₀(r) < C(r)` gives the strict inequality.

**Checks.**

- `r = 2`, `d = 11`: `C₀(2) = (12 · 3 · 7)^{1/4}/(1 − 2/√11) = 3.9843/0.39698 = 10.0365…`,
  rounded up to the tabulated `10.0366`; `r = 3`:
  `660^{1/6}/(1 − 2 · 11^{−2/3}) = 2.95067/0.59564 = 4.9538…`, rounded up to `4.9539`.
- (A.1) at `r = 2`, `C = C₀(2)`, `p₀ = 2 · 10⁴`: `100.73 · 3.448 · 3.147 = 1093 ≥ 528 · 2 = 1056`.
- `d = 4` is excluded: `1 − 2 · 4^{−1/2} = 0` makes (A.2) undefined.
- The prime-count lower bound is the one with `1 + log A`: at `A = 4`, `π(4) = 2 ≥ 4/(1 + log 4)
  = 1.676`, while the bound `A/log A = 2.885` would fail there.

*Needs:* §§4.1, 4.2, 4.3; AnalyticNumberTheoryPartI §0.5; Mathlib `Real.rpow`, `Real.log`,
`Nat.primeCounting`; Layer 6 `McGownTableCertificate`.

### 4.5 Treviño's uniform and tabulated Burgess inequalities

*Theorem 1.* For `2 ≤ r ≤ 10`, `p₀ ∈ {10⁷, 10¹⁰, 10²⁰}`, primes `p ≥ p₀`, `M ≥ 0` and `N ≥ 1`,
`|S_χ(M, N)| ≤ c₁(r, p₀) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` with `c₁` from Table 1: for
`p₀ = 10⁷`: `2.7381, 2.0197, 1.7308, 1.6107, 1.5482, 1.5052, 1.4703, 1.4411, 1.4160`
(`r = 2, …, 10`); for `10¹⁰`: `2.5173, 1.7385, 1.5151, 1.4572, 1.4274, 1.4042, 1.3846, 1.3662,
1.3495`; for `10²⁰`: `2.3549, 1.3695, 1.3104, 1.2987, 1.2901, 1.2813, 1.2729, 1.2641, 1.2562`
(trevino2015 Theorem 1, lines 83–88, Table 1, lines 97–107).

*Corollary 1.* For primes `p ≥ 10⁷` and every `r ≥ 1`,
`|S_χ(M, N)| ≤ 2.74 N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/r}` (trevino2015 Corollary 1,
lines 91–94; tmeemt-art15 lines 154–157).

*Theorem 2 and Corollary 2.* For `2 ≤ r ≤ 10`, `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}`, primes `p ≥ p₀` and
`1 ≤ N ≤ 2p^{1/2+1/(4r)}`,
`|S_χ(M, N)| < c₂(r, p₀) N^{1−1/r} p^{(r+1)/(4r²)} (log p)^{1/(2r)}` with `c₂` from Table 3: for
`p₀ = 10¹⁰`: `3.6529, 2.5888, 2.1914, 1.9841, 1.8508, 1.7586, 1.6869, 1.6283, 1.5794`; for
`10¹⁵`: `3.5851, 2.5144, 2.1258, 1.9231, 1.7959, 1.7066, 1.6384, 1.5857, 1.5410`; for `10²⁰`:
`3.5751, 2.4945, 2.1078, 1.9043, 1.7757, 1.6854, 1.6187, 1.5654, 1.5216` (trevino2015
Theorem 2, lines 134–141, Table 3, lines 145–155); for `r ≥ 3` and `p ≥ 10¹⁰` the restriction on
`N` is not needed (Corollary 2, lines 156–161).

Proof route (trevino2015 §§3–4, lines 637–1025 and 1094–1323): induction on `N`; the trivial
bound and an upper bound on `N` (from §3.2's `|S| ≤ √p log p` for `r = 2`, from the case `r − 1`
for `r ≥ 3`, with the parameter `s` of display (36)) reduce to the ranges (37)–(38) (Theorem 1)
or (52)–(53) (Theorem 2); §4.3 with `𝒜` the set of all integers in `[1, A]`,
`B = ((2r − 3)!!(r − 1))^{1/r} p^{1/(2r)}` (display (33)) and `A = kN/B`, §4.1 for `W`, §4.2
(Lemma 1, resp. Lemma 6) for `V₂`, and the induction hypothesis in the error term (display (43))
give the closing inequality (46)/(47), resp. (58)/(59). The Layer 6 hypotheses
`TrevinoTable1Certificate` and `TrevinoTable3Certificate` assert that these closing inequalities
hold at the tabulated constants with the parameters of Tables 5 and 7 for every `p ≥ p₀`; the
source evaluates them at `p = p₀` (lines 1008–1012 and 1288–1310). Corollary 1: `r = 1` from §3.2, `2 ≤ r ≤ 10` from
Theorem 1 at `p₀ = 10⁷` (`c₁ ≤ 2.7381`), and `r ≥ 11` from (47) with `s = 1` and
`c₁(r) = c₁(r − 1) = 2.74`, an inequality in closed form for every `r ≥ 11` and `p ≥ 10⁷`
(trevino2015 lines 1026–1085). Corollary 2: Theorem 2 together with Theorem 1 at `r = 2`, which
gives `|S_χ(M, N)| ≤ 2.6N^{1/2}p^{3/16}(log p)^{1/2}` for `p ≥ 10¹⁰` and removes the range
restriction (lines 1324–1334).

**Checks.**

- The arXiv text tabulates `c₂` for `p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}`; the TME-EMT page prints a column
  `p₀ = 10⁷` with values `3.7451, …, 1.5210` (tmeemt-art15 lines 236–284) that matches neither
  heading nor values; at `r = 2`, `p₀ = 10²⁰` the page's `3.5341` is smaller than the arXiv
  `3.5751`. The table stated here is the arXiv one.
- Table 1 at `r = 2`, `p = 10⁷`: the bound is `2.7381 · p^{3/16}(log p)^{1/2}√N = 225.8√N`,
  below the trivial bound `N` exactly when `N > 5.1 · 10⁴`; this is the lower end
  `c₁(2)² p^{3/8} log p ≈ 5.1 · 10⁴` of the range (37) in which the induction works.
- Corollary 1 at `r = 1` reads `|S| ≤ 2.74√p log p`, implied by §3.2.

*Needs:* §§3.2, 4.1, 4.2, 4.3; Layer 6 `TrevinoTable1Certificate`, `TrevinoTable3Certificate`.

### Examples

McGown's constant at `r = 2` is the closed form `(252)^{1/4}/(1 − 2/√11) = 10.0365…`. Burgess's
moment bound at `r = 1` is the orthogonality identity `⌊B⌋p − ⌊B⌋²`.

### Dependencies

Layer 0 (§0.4), Layer 3 (§3.2). CharacterSumsOverFiniteFields §4.7; AnalyticNumberTheoryPartI
§0.5 (for §4.4). Tau Ceti: `DirichletCharacter.sum_range_level_eq_zero`. Mathlib: Jensen's
inequality, `Nat.primeCounting`. Layer 6: `McGownTableCertificate`, `TrevinoTable1Certificate`,
`TrevinoTable3Certificate`.

## Layer 5: explicit sieve upper bounds

### 5.1 explicit bounds for Selberg diagonal sums

- *Kernel identity and the logarithm.* For real `z ≥ 1`,
  `S(z) = Σ_{m ≥ 1, rad(m) ≤ z} 1/m`, the sum over positive integers whose squarefree kernel is at
  most `z`; hence `S(z) ≥ Σ_{m ≤ z} 1/m ≥ log(⌊z⌋ + 1) > log z`. Proof:
  `μ²(n)/φ(n) = n⁻¹ Σ_{rad(j) | n} 1/j` for squarefree `n`, and `m = n j` with `n = rad(m)` is the
  unique such factorisation.
- *Coprime comparison.* For integers `k ≥ 1` and real `z ≥ 1`,
  `S_k(z) ≥ (φ(k)/k) S(z)` (vanlintrichert1965, the inequality used in buthe2014 lines 226–236).
  Proof: `S(z) = Σ_{e | k} μ²(e)/φ(e) · S_k(z/e) ≤ S_k(z) Σ_{e | k} μ²(e)/φ(e)` and
  `Σ_{e | k} μ²(e)/φ(e) = k/φ(k)`.
- *Explicit asymptotics.* `H₁(z) = Σ_{n ≤ z} μ²(n)σ(n)/φ(n) = (15/π²) z + θ · 47√z` with `|θ| ≤ 1`
  for `z ≥ 1`, and `S(z) = log z + γ + Σ_p log p/(p(p − 1)) + θ · 58/√z` with `|θ| ≤ 1` for
  `z ≥ 10⁹` (buthe2014 Lemma 4.4, lines 365–367, and Lemma 4.5, lines 462–468; proofs by Dirichlet
  convolution with `μ²(n)n/φ(n) = Σ_{d | n} c_d` and explicit Euler products, lines 368–600).
- *The Montgomery–Vaughan diagonal bound.* For real `z ≥ 6`, `S(z) ≥ log z + 1.07`, and for real
  `z ≥ 3`, `S(z) ≥ log z + 0.89` (montgomeryvaughan1973 Lemma 7, as quoted in fan2022
  lines 185–187). Proof: for `z ≥ 10⁹` the explicit asymptotic, since
  `γ + Σ_{p < 1000} log p/(p(p − 1)) − 58/√z ≥ 1.32` (buthe2014 lines 609–616); for
  `6 ≤ z < 10⁹` the Layer 6 hypothesis `MVDiagonalFiniteRange`; for `3 ≤ z < 6` direct evaluation
  (`S(z) = 2.5` on `[3, 5)` and `2.75` on `[5, 6)`).

**Checks.**

- `S(6) = 1 + 1 + 1/2 + 1/4 + 1/2 = 3.25 ≥ log 6 + 1.07 = 2.862`; `S(10) = 3.667 ≥ 3.373`.
- Just below `6`, `S = 2.75 < log 5.99 + 1.07 = 2.860`: the threshold `z ≥ 6` is sharp. On
  `[3, 5)`, `S = 2.5 ≥ log 4.99 + 0.89 = 2.497`, so the constant `0.89` is what extends the bound
  down to `3`; just below `3`, `S = 2 < log 2.99 + 1.07 = 2.165`.
- `k = 6`, `z = 7`: `S_6(7) = 1 + 1/4 + 1/6 = 1.4167 ≥ (1/3) S(7) = (1/3)(3.4167) = 1.139`.
- The constant: `γ + Σ_p log p/(p(p − 1)) = 0.5772 + 0.7554 = 1.3326`; a bound with `1.4` in place
  of `1.07` would contradict the asymptotic for large `z`.

*Needs:* Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `ArithmeticFunction.sigma`,
`log_add_one_le_harmonic`, `Real.eulerMascheroniConstant`; Layer 6 `MVDiagonalFiniteRange`.

### 5.2 Greaves's lower bound for Selberg's density sum

Let `κ ≥ 0` be a function on the primes with `κ(p) < p`, let `z ≥ 2` and `B > 0` with
`Σ_{p < z} κ(p) log p/p ≤ B log z`, and let `s ≥ 2B`. With `P(z) = ∏_{p < z} p`,

    Σ_{d | P(z), d ≤ z^{s/2}} ∏_{p | d} κ(p)/(p − κ(p))
        ≥ (1 − exp(−((s/2) log(s/(2B)) − s/2 + B))) ∏_{p < z} (1 − κ(p)/p)⁻¹

(tmeemt-art14 lines 159–170; greaves2001 Theorem 1, p. 52). The TME-EMT form, summing over every
squarefree `d ≤ z^{s/2}`, follows because the added terms are nonnegative. Proof (Rankin's
method): with `g(p) = κ(p)/(p − κ(p))` and `G = Σ_{d | P(z)} g(d) = ∏_{p<z}(1 − κ(p)/p)⁻¹`, for
`σ ≥ 0`, `Σ_{d | P(z), d > y} g(d) ≤ y^{−σ} ∏_{p<z}(1 + g(p)p^σ)`, and
`∏_{p<z}(1 + g(p)p^σ)/(1 + g(p)) = ∏_{p<z}(1 + (κ(p)/p)(p^σ − 1)) ≤ exp(B(z^σ − 1))` because
`(p^σ − 1)/log p ≤ (z^σ − 1)/log z` for `p < z`; take `y = z^{s/2}` and `z^σ = s/(2B)`.

**Checks.**

- `s = 2B`: the exponent is `0` and the bound is `0`, the trivial case.
- `κ ≡ 1`, `z = 3`, `B = log 2/(2 log 3) = 0.3155`, `s = 2`: the factor is
  `1 − exp(−(log(1/0.3155) − 1 + 0.3155)) = 1 − e^{−0.469} = 0.374`, the right side `0.748`, and
  the left side `1 + 1 = 2`.
- `B = 0` is excluded: `log(s/(2B))` is undefined; for `κ ≡ 0` on `p < z` both sides are `1` and
  the statement is trivial.

*Needs:* Mathlib `Real.exp`, `Real.log`, `Real.rpow`, `ArithmeticFunction.moebius`.

### 5.3 Büthe's weighted sieves

Let `I = [x, x + y] ⊂ [0, ∞)`, let `f` be absolutely continuous on `I`
(`AbsolutelyContinuousOnInterval f x (x + y)`), and write `‖f‖₁ = ∫_I |f|`,
`‖f‖_∞ = max_I |f|`, `‖f′‖₁ = ∫_I |f′|`; for coprime positive integers `k`, `ℓ` put
`A = I ∩ (ℓ + kℤ)` and `P(z, k) = ∏_{p ≤ z, p ∤ k} p`.

- *Remainder.* For `d ≥ 1` coprime to `k`,
  `|(kd)⁻¹ ∫_I f − Σ_{n ∈ A, d | n} f(n)| ≤ ‖f‖_∞ + ‖f′‖₁` (buthe2014 Lemma 3.1, lines 69–73;
  proof lines 74–136 by the mean-value identity for absolutely continuous functions on unit
  intervals).
- *Weighted Selberg sieve.* For `f ≥ 0` and `z ≥ 1`, with
  `H_k(z) = Σ_{n ≤ z, (n,k) = 1} μ²(n)σ(n)/φ(n)`,
  `Σ_{n ∈ A, (n, P(z,k)) = 1} f(n) ≤ ‖f‖₁/(k S_k(z)) + (‖f‖_∞ + ‖f′‖₁) H_k(z)²/S_k(z)²`
  (buthe2014 Proposition 3.2, lines 139–158). Proof: realise the weighted progression as a native
  `BoundingSieve` with total mass `‖f‖₁/k`, density `1/d` on divisors of `P(z, k)` and remainders
  bounded by the remainder lemma; apply `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`
  to Selberg's optimal weights at level `⌊z⌋ + 1/2` (SieveMethodsAndPrimePatterns §1.3, whose
  cutoff is strict; the density `1/d` makes its diagonal `Σ μ²(d)/φ(d)`), whose main term is
  `1/S_k(z)` and whose absolute sum is `Σ |λ_n| = H_k(z)/S_k(z)` (van Lint–Richert's evaluation,
  buthe2014 lines 226–236).
- *Weighted Eratosthenes sieve.* For `f ≥ 0` and `z ≥ 1`,
  `Σ_{n ∈ A, (n, P(z,k)) = 1} f(n) ≤ (‖f‖₁/k) ∏_{p ≤ z, p ∤ k}(1 − 1/p) + (‖f‖_∞ + ‖f′‖₁) 2^{π(z)}`
  (buthe2014 Proposition 3.3, lines 237–284), by Möbius inversion over the divisors of `P(z, k)`.

**Checks.**

- `f ≡ 1` on `I`: `‖f‖₁ = y`, `‖f‖_∞ = 1`, `‖f′‖₁ = 0`; the remainder lemma reduces to
  `|y/(kd) − #{n ∈ A : d | n}| ≤ 1`, the classical count of a progression in an interval.
- `k = 1`, `z = 1`: `S₁(1) = H₁(1) = 1`, `P(1, 1) = 1`, and the Selberg form reads
  `Σ_{n ∈ I} f(n) ≤ ‖f‖₁ + ‖f‖_∞ + ‖f′‖₁`, the remainder lemma at `d = 1`.
- Absolute continuity is needed: the step function equal to `1` within `ε` of each integer and
  `0` elsewhere on `I = [0, 3]` has `∫_I f = 6ε`, `Σ_{n ∈ I} f(n) = 4`, `‖f‖_∞ = 1` and almost
  everywhere derivative `0`, so the remainder bound would claim `|6ε − 4| ≤ 1`, which is false.

*Needs:* Mathlib `AbsolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `BoundingSieve`,
`BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`; SieveMethodsAndPrimePatterns §1.3;
§5.1.

### 5.4 weighted Brun–Titchmarsh inequalities

With the notation of §5.3 define `ρ_I(f) = ‖f‖₁/(‖f‖_∞ + ‖f′‖₁)` for `f ≠ 0` and `ρ_I(0) = 0`
(buthe2014 Definition 4.1, lines 291–295).

- `ρ_I(cf) = ρ_I(f)` for every real `c ≠ 0`, since all three norms scale by `|c|`.
- `ρ_I(f) ≤ y` for every `f`, since `‖f‖₁ ≤ y ‖f‖_∞`; and `ρ_I(1) = y` for the constant `1`.
- `ρ_I(f) > 0` exactly when `f ≠ 0` on `I`.

- *General modulus.* For coprime positive integers `k`, `ℓ` and every nonnegative absolutely
  continuous `f` with `ρ_I(f) > k`,
  `Σ_{p ∈ I, p ≡ ℓ (k)} f(p) < (2‖f‖₁/(φ(k) log(ρ_I(f)/k)))(1 + 8/log(ρ_I(f)/k))` and
  `Σ_{p ∈ I, p ≡ ℓ (k)} f(p) < 3‖f‖₁/(φ(k) log(ρ_I(f)/k))` (buthe2014 Theorem 4.2, lines 298–314).
  Proof route: normalise to `g = f/(‖f‖_∞ + ‖f′‖₁)`, pass to the odd progression modulo
  `k₁ = lcm(k, 2)` at the cost of `1`, apply the weighted Selberg sieve of §5.3 and choose `z` as
  in vanlintrichert1965 (buthe2014 lines 315–348).
- *Modulus one.* For every nonnegative absolutely continuous `f` with `ρ_I(f) > 1`,
  `Σ_{p ∈ I} f(p) < 2‖f‖₁/log ρ_I(f)` (buthe2014 Theorem 4.3, lines 354–362). Proof route
  (lines 602–700): for `Y = ρ_I(f) > 4 · 10^18`, §5.3's Selberg form with `z = √Y/2`, §5.1's
  asymptotics and `π(z) ≤ z`; for `1 < Y < 20000`, §5.3's Eratosthenes form and the Layer 6
  hypothesis `ButheSmallRangeVerified`; for `20000 ≤ Y ≤ 4 · 10^18`, the Layer 6 hypothesis
  `ButheMediumRangeVerified`.
- *Corollary.* For real `x ≥ 0` and `y > 1`, the number of primes in `[x, x + y]` is less than
  `2y/log y` (take `f ≡ 1`, so `ρ_I(f) = y`).

**Checks.**

- `f ≡ 1` on `I`: `ρ_I(f) = y`, and the general-modulus form is the van Lint–Richert inequality
  `π(x + y; k, ℓ) − π(x; k, ℓ) < (2y/(φ(k) log(y/k)))(1 + 8/log(y/k))` (buthe2014 lines 349–353),
  weaker than §5.5 by the factor `1 + 8/log(y/k)`.
- `I = [0, 10]`, `f ≡ 1`: the corollary gives `π(10) = 4 < 20/log 10 = 8.69`.
- The tent `f(t) = min(t − x, x + y − t)` on `I`: `‖f‖₁ = y²/4`, `‖f‖_∞ = y/2`, `‖f′‖₁ = y`,
  so `ρ_I(f) = y/6`; the weight costs a factor `6` inside the logarithm compared with `f ≡ 1`.

*Needs:* §§5.1, 5.3; Layer 6 `ButheSmallRangeVerified`, `ButheMediumRangeVerified`.

### 5.5 the Montgomery–Vaughan Brun–Titchmarsh inequality and the Ramaré–Viswanadham sums

*Sifted form.* For coprime positive integers `k`, `ℓ` and reals `x ≥ 0`, `y > k`, there is a real
`z ≥ 1` such that the number of integers `n ∈ (x, x + y]` with `n ≡ ℓ (mod k)` and no prime factor
`p ≤ z`, `p ∤ k`, plus `π(z)`, is at most `2y/(φ(k) log(y/k))` (montgomeryvaughan1973 proof of
Theorem 2, display (3.3) and Lemma 10, as described in ramareviswanadham2021 lines 660–666).
Proof route: for large `y/k`, SieveMethodsAndPrimePatterns §2.9 with one forbidden class (that of
`−ℓk⁻¹`) at each prime `p ≤ Q`, `p ∤ k`, on the at most `⌊y/k⌋ + 1` consecutive values of
`(n − ℓ)/k`, so that `J(Q) = S_k(Q) ≥ (φ(k)/k)(log Q + 1.07)` for `Q ≥ 6` (§5.1), with `z = Q`
chosen as in montgomeryvaughan1973 §3; for small `y/k`, the Eratosthenes count of
montgomeryvaughan1973 Lemma 10.

*Corollaries.*

- *Brun–Titchmarsh* (Montgomery–Vaughan): `π(x + y; k, ℓ) − π(x; k, ℓ) ≤ 2y/(φ(k) log(y/k))`
  for coprime `k, ℓ ≥ 1` and reals `x, y > 0` with `y > k` (tmeemt-art14 lines 79–87;
  montgomeryvaughan1973 Theorem 2). Primes above `z` survive the sieve; primes up to `z` are
  counted by `π(z)`.
- *Prime powers* (ramareviswanadham2021 Lemma 14, lines 650–666; tmeemt-art14 lines 97–104):
  for reals `A ≥ B > d ≥ 1` with `d` an integer and `a` coprime to `d`,
  `Σ_{A < m ≤ A+B, m ≡ a (d)} Λ(m)/log m ≤ 2B/(φ(d) log(B/d))`. Since `A ≥ B`, each prime has at
  most one power in `(A, A + B] ⊂ (A, 2A]`, and `Λ(m)/log m ≤ 1`; the hypothesis `A ≥ B` is needed
  for this and is absent from Montgomery–Vaughan's statement.
- *Dyadic von Mangoldt sums* (ramareviswanadham2021 Lemma 15, lines 667–679; tmeemt-art14
  lines 106–111): for `q ≥ 1`, `a` coprime to `q` and real `M ≥ max(121, q³)`,
  `Σ_{M < m ≤ 2M, m ≡ a (q)} Λ(m) ≤ 3(1 + log 2/log M) M/φ(q) ≤ (7/2) M/φ(q)`, which contains the
  source's `(9/2) M/φ(q)`. Proof: the prime-power corollary with `A = B = M`, `d = q` (`M > q`),
  `Λ(m) ≤ log(2M) · Λ(m)/log m`, and `log(M/q) ≥ (2/3) log M` from `q ≤ M^{1/3}`; then
  `log 2/log 121 = 0.1445`.

**Checks.**

- `k = 1`, `x = 0`, `y = 10`: `π(10) = 4 ≤ 20/log 10 = 8.69`; `k = 3`, `ℓ = 1`, `x = 0`, `y = 30`:
  primes `≡ 1 (mod 3)` up to `30` are `7, 13, 19`, and `3 ≤ 60/(2 log 10) = 13.03`.
- `M = 121`, `q = 1`: `3(1 + 0.1445) = 3.434 ≤ 3.5 ≤ 4.5`; `q = 5` needs `M ≥ 125`.
- Without `A ≥ B`: for `A = 1`, `B = 7`, `d = 1`, the interval `(1, 8]` contains `2, 4, 8`, three
  powers of one prime, so the reduction to one power per prime fails (the inequality happens to
  hold there, `4.83 ≤ 7.19`); the corollary is not claimed outside `A ≥ B`.

*Needs:* SieveMethodsAndPrimePatterns §2.9; §5.1; Mathlib `ArithmeticFunction.vonMangoldt`,
`Nat.primeCounting`, `Nat.totient`.

### 5.6 integers free of small prime factors

For reals `1 < z ≤ x`, `Φ(x, z) < x/log z`; for `z ≥ max(3, √x)`,
`Φ(x, z) < x/log z − x/(2 log² z)`; and for `max(2, x^{2/5}) ≤ z ≤ √x`,
`Φ(x, z) < 2x/(3 log z)` (fan2022 Theorem, inequalities (4)–(6), lines 157–163; tmeemt-art14
lines 181–191 state (4)). Proof route (fan2022 lines 164–330): for `3 ≤ z ≤ x^{2/5}`,
SieveMethodsAndPrimePatterns §2.9 with the class `0` forbidden at every prime `p ≤ z` gives
`Φ(x, z) ≤ (x + z²)/S(z)`, and §5.1 gives `S(z) ≥ log z + 0.89`; for `z ≥ x^{2/5}`,
`Φ(x, z) = 1 + π(x) − π(z) + #{pq ≤ x : z < p ≤ q}` (and its analogue for (6)) bounded with
AnalyticNumberTheoryPartI §0.5 for `π`, §0.19 for `Σ 1/p` and §0.20 for `Σ log p/p`, all at
arguments at least `319` when `x ≥ 2 · 10⁶`; for `x < 2 · 10⁶` the Layer 6 hypothesis
`FanFiniteRange`; for `1 < z < 3` direct counting. The theorem carries
AnalyticNumberTheoryPartI's `RosserSchoenfeldFiniteRangeInput`.

**Checks.**

- `x = 9`, `z = 3`: `Φ = 3` (`1, 5, 7`), `x/log z = 8.19`, and (5) gives `8.19 − 3.73 = 4.46`.
- `x = 32`, `z = 4`: `Φ = 11` (the integers coprime to `6` up to `32`) `< 64/(3 log 4) = 15.4`.
- `x = z = 1.5`: `Φ = 1 < 1.5/log 1.5 = 3.70`; at `z = 1` the bound `x/log 1` is undefined, which
  the hypothesis `z > 1` excludes.

*Needs:* SieveMethodsAndPrimePatterns §2.9; AnalyticNumberTheoryPartI §§0.5, 0.19, 0.20; §5.1;
Layer 6 `FanFiniteRange`.

### Examples

`S(6) = 3.25`; Greaves at `κ ≡ 1`, `z = 3`, `s = 2` gives `2 ≥ 0.748`; `π(10) = 4` against the
Montgomery–Vaughan bound `8.69`; `Φ(32, 4) = 11 < 15.4`.

### Dependencies

Layer 0 is not needed. SieveMethodsAndPrimePatterns §§1.3, 2.9; AnalyticNumberTheoryPartI
§§0.5, 0.19, 0.20; Mathlib `BoundingSieve`, absolutely continuous functions. Layer 6:
`MVDiagonalFiniteRange`, `ButheSmallRangeVerified`, `ButheMediumRangeVerified`, `FanFiniteRange`.

## Layer 6: computational hypotheses

Each item is a `Prop` with no proof obligation in this roadmap. Items 6.1–6.6 are numerical
statements about explicitly given real numbers, or about integers and characters in an explicitly
bounded range. Items 6.7 and 6.8 are, for each of finitely many table rows, an inequality between
explicit elementary functions of one real variable `p` on the half-line `[p₀, ∞)`; they are not
finite verifications, and their Checks say why the value at `p = p₀` alone does not suffice. No
item mentions an unbounded family of characters or primes, and none contains the conclusion of the
theorem that consumes it.

### 6.1 small moduli in Lapkova's lemma

`LapkovaSmallModuliVerified`: for every `q` with `2 ≤ q ≤ 25` and every primitive character `χ`
modulo `q`, `M_χ` is at most the bound of §3.5 for the parity of `χ` (lapkova2018 lines 291–408,
the Bober–Goldmakher data).

**Checks.**

- `q = 3`, the odd quadratic character: `M_χ = 1 ≤ 0.303 + 1.421 + 1.029 = 2.75`.
- `q = 5`, the even quadratic character: `M_χ = 2 ≤ 0.729 + 2.117 + 1.668 = 4.51`; `q = 4`, the odd
  character `χ₄`: `M_χ = 1 ≤ 3.11`.
- The range stops at `25`: for `q > 25` §3.5 is proved analytically, and a version of the
  hypothesis claiming every `q` would contain the conclusion of §3.5.

### 6.2 the diagonal sum below `10⁹`

`MVDiagonalFiniteRange`: for every real `z` with `6 ≤ z < 10⁹`, `S(z) ≥ log z + 1.07`.

**Checks.**

- At `z = 6`: `S(6) = 3.25` and the margin is `3.25 − 2.862 = 0.388`.
- Just below `6` the inequality fails (`2.75 < 2.860`), so the lower end `6` is part of the
  statement, not a convenience.
- At `z = 10⁹` the analytic form of §5.1 takes over with `S(z) ≥ log z + 1.32`; since `S` is a step
  function and `log z + 1.07` is increasing, the hypothesis is equivalent to the inequality at the
  left limits of the squarefree jump points below `10⁹`.

### 6.3 Büthe's small range

`ButheSmallRangeVerified`: for every real `Y` with `1 < Y < 20000` there is a real `z ≥ 1` with
`Y ∏_{p ≤ z}(1 − 1/p) + 2^{π(z)} + π(z) < 2Y/log Y` (buthe2014 lines 633–649).

**Checks.**

- `Y = 100`, `z = 7`: `22.86 + 16 + 4 = 42.86 < 200/log 100 = 43.43`.
- `Y = 1.5`, `z = 1` (empty product, `π(1) = 0`): `1.5 + 1 + 0 = 2.5 < 3/log 1.5 = 7.40`.
- The witness depends on `Y`: `z = 7` fails at `Y = 20` (`4.57 + 20 = 24.57 > 40/log 20 = 13.35`),
  where `z = 1` gives `20 + 1 = 21 > 13.35` and `z = 2` gives `10 + 2 + 1 = 13 < 13.35`.

### 6.4 Büthe's medium range

`ButheMediumRangeVerified`: for every real `Y` with `20000 ≤ Y ≤ 4 · 10^18` there is a real
`z ≥ 1` with `Y/S(z) + H₁(z)²/S(z)² + π(z) < 2Y/log Y` (buthe2014 lines 650–700).

**Checks.**

- For fixed `z` the condition holds on `[Y₀, Y₁]` once it holds at both ends, because `t/log t`
  is concave for `t > e²` and the left side is affine in `Y`; the hypothesis is therefore a finite
  check.
- At `Y = 20000` the right side is `2 · 20000/log 20000 = 4039.0`; since `Y/S(z)` is close to
  `Y/(log z + 1.33)` and `H₁(z)²/S(z)²` close to `(15z/π²)²/log² z`, a witness must balance the two,
  which forces `z` of the order of `√Y/log Y`; `z = 1` gives `Y + 1 > 4039`.
- Above `4 · 10^18` the analytic argument of §5.4 applies; the hypothesis claims nothing there.

### 6.5 Fan's finite range

`FanFiniteRange`: inequalities (4), (5) and (6) of §5.6 for every real `x < 2 · 10⁶` and every `z`
in the respective ranges (fan2022 lines 290–292 and its other direct verifications).

**Checks.**

- `x = 9`, `z = 3`: `Φ = 3 < 4.46` (inequality (5)).
- `x = 32`, `z = 4`: `Φ = 11 < 15.4` (inequality (6)).
- `Φ(x, z)` is constant in `z` between consecutive primes and the right sides decrease in `z`,
  so for each `x` only finitely many `z` need checking.

### 6.6 McGown's table

`McGownTableCertificate`: for each `r ∈ {2, …, 15}`, with
`C₀(r) = (12(2r − 1)(4r − 1))^{1/(2r)}/(1 − 2 · 11^{−(1 − 1/r)})`, one has `C₀(r) < C(r)` for the
value `C(r)` of §4.4 and `C₀(r)^r (2 · 10⁴)^{1/4 − 1/(4r)} (log(2 · 10⁴))^{1/2} ≥ 528r`.

**Checks.**

- `C₀(2) = 252^{1/4}/(1 − 2/√11) = 3.98428/0.396977 = 10.03655 < 10.0366`.
- `C₀(3) = 660^{1/6}/(1 − 2 · 11^{−2/3}) = 4.95382 < 4.9539`; the tightest row is `r = 8`, where
  `C₀(8) = 2.272099 < 2.2721`, a margin of about `10⁻⁶`.
- The second inequality at `r = 2`: `10.0365² · 3.448 · 3.147 = 1093 ≥ 1056`; at `r = 15`,
  `1.77^{15} · (2 · 10⁴)^{7/30} · 3.147 ≈ 1.66 · 10⁵ ≥ 7920`.

### 6.7 Treviño's Table 1

`TrevinoTable1Certificate`: for each row `(r, p₀, c₁)` of Table 1 (trevino2015 lines 97–107) with
`(k, c′₁)` from Table 5 (lines 1013–1024), and every real `p ≥ p₀`: with
`B = ((2r − 3)!!(r − 1))^{1/r} p^{1/(2r)}`,
`A = k c′₁^r p^{1/4 − 1/(4r)} log p / ((2r − 3)!!(r − 1))^{1/r}` and, for `r ≥ 3`, `s` the least
real with `c₁(r − 1) ≤ s^{1/(r(r−1))} c′₁`, one has `A ≥ 29`, `c′₁ < c₁`, a positive denominator in
display (46) (`r = 2`, lines 889–903) or (47) (`r ≥ 3`, lines 905–941), and the right side of that
display at these values is at most `c₁`.

**Checks.**

- Table 4 (lines 996–1007) lists the least `c₁` compatible with `A ≥ 29`: `2.68289` at `r = 2`,
  `p₀ = 10⁷`, below the tabulated `2.7381`.
- At `r = 2` the factor `((2r − 3)!!(r − 1))^{1/r}` is `1`, so `B = p^{1/4}` and
  `A = k c′₁² p^{1/8} log p`; at `p = 10⁷`, `k = 2/45`, `c′₁ = 2.738`: `A = 0.0444 · 7.497 · 7.50 ·
  16.12 = 40.3 ≥ 29`.
- The right sides of (46) and (47) decrease in `A` and `B`, so the values at the least admissible
  `A` and at the stated `B` bound every case of the induction.
- At `r = 2`, `p = p₀ = 10⁷` the right side of (46) is `2.73807 ≤ 2.7381`. For `r = 2` the
  quantifier over `p` reduces to `p = p₀`: the bracket `1 + 3/(8ku) + log(1.85ku)/(ku²)` of (46),
  `u = log p`, has derivative `(1 − 3u/8 − 2 log(1.85ku))/(ku³)`, which is negative for `u ≥ 16`
  and `k ≥ 1/30` (at `u = log 10⁷`, `k = 1/30` the numerator is `−5.03`), and `A`, `B` increase
  with `p`.

### 6.8 Treviño's Table 3

`TrevinoTable3Certificate`: the analogue of 6.7 for Table 3 (lines 145–155) with `(k, c′₂)` from
Table 7 (lines 1311–1322), the closing displays (58) and (59) (lines 1218–1265) and the condition
`⌊A⌋ ≥ 30` from Lemma 6.

**Checks.**

- Table 6 (lines 1296–1307) lists the least `c₂` compatible with `⌊A⌋ ≥ 30`: `2.78392` at `r = 2`,
  `p₀ = 10¹⁰`, below the tabulated `3.6529`.
- Table 7 uses `k = 0.124` at `r = 2` for every `p₀`, inside the admissible interval
  `[3/64, ((2r − 3)!!(r − 1))^{1/r}/8)` of the source (line 1289).
- The certificate concerns the range `N ≤ 2p^{1/2+1/(4r)}`; Corollary 2's extension to all `N`
  for `r ≥ 3` uses Theorem 1 at `r = 2`, not this certificate.
- The value at `p = p₀` does not by itself bound larger `p`. At `r = 10`, `p₀ = 10¹⁰` (`k = 0.054`,
  `c′₂ = 1.579`, `s = (1.6283/1.579)^{90} = 15.91`) the bracket of (59) is
  `log(c√u)/(ku) + 1/(4k) + 1/(360k)` with `c = 1.85sk/(17!! · 9)^{1/10} = 0.2250` and `u = log p`;
  it increases while `c√u < √e`, and `c√(log 10¹⁰) = 1.080 < 1.649`, so it grows from `4.7426` at
  `p = 10¹⁰` to `4.8535` at `p = 10^{23.3}`. The whole right side of (59) still falls, from
  `1.57930` to `1.51537`, because `A/(A − 1) · B/(B − 1)` falls from `1.0485` to `1.0097`; that is a
  property of the row, not of the display, so the certificate is stated for every `p ≥ p₀`.

### Examples

`McGownTableCertificate` at `r = 2` is the pair `10.03655 < 10.0366`, `1093 ≥ 1056`;
`ButheSmallRangeVerified` at `Y = 100` is witnessed by `z = 7`.

### Dependencies

None: Layer 6 states numerical facts. Its consumers are §§3.5, 4.4, 4.5, 5.1, 5.4 and 5.6.

## Downstream consumers

- **ExplicitZetaBounds**: the derivative tests of Layer 1 for explicit bounds on
  `ζ(1/2 + it)`, `ζ(1 + it)` and `L(1/2 + it, χ)`, and the Pólya–Vinogradov constants of Layer 3
  for `L(1, χ)`. The B-process is not supplied here: it belongs to this roadmap's Part II (Scope
  and ownership).
- **ExplicitPrimeCounting**: the Brun–Titchmarsh inequalities of §§5.4–5.5 and the
  Ramaré–Viswanadham sums.
- **ExplicitNumberFields**: the Burgess inequalities of Layer 4 and the
  Pólya–Vinogradov inequalities of Layer 3, for least primitive roots and norm-Euclidean fields.
- **ExplicitMultiplicativeFunctions**: Fan's bound (§5.6) and Greaves's density-sum
  bound (§5.2) for Rankin-type averages.
- **ProbabilisticAndMetricNumberTheory** §2.5: van der Corput's difference theorem, whose finite
  lag inequality is §0.3.

## References

- **ariasdereyna2024** — J. Arias de Reyna, *Explicit van der Corput's d-th derivative estimate*,
  arXiv:2407.02094 (2024): Lemmas 1, 4, 5, 6, Theorem 7.
- **bachmanrachakonda2001** — G. Bachman, L. Rachakonda, *On a problem of Dobrowolski and Williams
  and the Pólya–Vinogradov inequality*, Ramanujan J. 5 (2001): Theorem 1.
- **booker2006** — A. R. Booker, *Quadratic class numbers and character sums*, Math. Comp. 75
  (2006), 1481–1492: displays (28)–(30), the quadratic case of Burgess's moment bound;
  Proposition 2 and Table 1.
- **bordelles2012** — O. Bordellès, *Arithmetic Tales*, Universitext, 2012: Lemma 5.7,
  Theorems 5.6, 5.8 and 5.12.
- **bordignon2022partial** — M. Bordignon, *Partial Gaussian sums and the Pólya–Vinogradov
  inequality for primitive characters*, Rev. Mat. Iberoam. 38 (2022), 1101–1127: Theorems 1.1,
  1.3, Tables 1–3.
- **bordignonjohnstonstarichkova2022** — M. Bordignon, D. R. Johnston, V. Starichkova, *An explicit
  version of Chen's theorem and the linear sieve*, arXiv:2207.09452: Theorem 6.
- **bordignonkerr2020** — M. Bordignon, B. Kerr, *An explicit Pólya–Vinogradov inequality via
  partial Gaussian sums*, arXiv:1909.01052: Theorems 2, 5, Corollary 1.
- **buthe2014** — J. Büthe, *A Brun–Titchmarsh inequality for weighted sums over prime numbers*,
  Acta Arith. 166 (2014), 289–299; arXiv:1410.7561: Lemmas 3.1, 4.4, 4.5, Propositions 3.2, 3.3,
  Definition 4.1, Theorems 4.2, 4.3.
- **fan2022** — K. Fan, *An inequality for the distribution of numbers free of small prime
  factors*, Integers 22 (2022), A26: the Theorem, (4)–(6).
- **filaseta1990** — M. Filaseta, *Short interval results for squarefree numbers*, J. Number Theory
  35 (1990), 128–149: the reduction to exponential sums.
- **francis2021** — F. J. Francis, *An investigation into several explicit versions of Burgess'
  bound*, arXiv:1910.13669: Theorem 1.8, Tables 3 and 6.
- **frolenkov2011** — D. A. Frolenkov, *Numerically explicit version of the Pólya–Vinogradov
  inequality*, arXiv:1107.0381: equation (1).
- **frolenkovsoundararajan2013** — D. A. Frolenkov, K. Soundararajan, *A generalization of the
  Pólya–Vinogradov inequality*, Ramanujan J. 31 (2013), 271–279: Theorems 1, 2, Corollary 1.
- **granville-ramare-1996** — A. Granville, O. Ramaré, *Explicit bounds on exponential sums and
  the scarcity of squarefree binomial coefficients*, Mathematika 43 (1996), 73–107: Lemma 8.4.
- **greaves2001** — G. Greaves, *Sieves in Number Theory*, Springer, 2001: Theorem 1, p. 52.
- **hiary2016zeta** — G. A. Hiary, *An explicit van der Corput estimate for ζ(1/2 + it)*, Indag.
  Math. 27 (2016), 524–533: Lemma 1.2.
- **hiarypatelyang2024** — G. A. Hiary, D. Patel, A. Yang, *An improved explicit estimate for
  ζ(1/2 + it)*, J. Number Theory 256 (2024), 195–217; arXiv:2207.02366: Lemmas 2.3, 2.4.
- **hunter2016** — K. Hunter, *The least square-free primitive root modulo a prime*,
  arXiv:1701.05980: Theorems 1.2, 1.3 (quotations of Frolenkov–Soundararajan).
- **huxleysargos1995** — M. N. Huxley, P. Sargos, *Points entiers au voisinage d'une courbe plane
  de classe C^n*, Acta Arith. 69 (1995), 359–366: Théorème 1.
- **jainsharmakhaleliu2021** — N. Jain-Sharma, T. Khale, M. Liu, *Explicit Burgess bound for
  composite moduli*, Int. J. Number Theory 17 (2021), 2207–2219; arXiv:2010.09530: Theorem 1.1,
  Corollary 1.2.
- **lapkova2018** — K. Lapkova, *Correction to: Explicit upper bound for the average number of
  divisors of irreducible quadratic polynomials*, Monatsh. Math. 186 (2018), 675–678: Lemma 3A.
- **mcgown2012** — K. J. McGown, *Norm-Euclidean cyclic fields of prime degree*, Int. J. Number
  Theory 8 (2012), 227–254; arXiv:1011.4501 ("Norm-Euclidean Galois fields"): Theorems A.1, A.9,
  Lemmas A.5–A.8.
- **montgomeryvaughan1973** — H. L. Montgomery, R. C. Vaughan, *The large sieve*, Mathematika 20
  (1973), 119–134: Theorem 2, Lemmas 7 and 10, display (3.3).
- **montgomeryvaughan2007** — H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I*,
  Cambridge, 2007: §9.4.
- **patel2022** — D. Patel, *An explicit upper bound for |ζ(1 + it)|*, Indag. Math. 33 (2022),
  1012–1032; arXiv:2009.00769: Lemmas 2.1, 2.3, 2.5, 3.1, 3.2.
- **patelyang2024** — D. Patel, A. Yang, *An explicit sub-Weyl bound for ζ(1/2 + it)*,
  arXiv:2302.13444: Lemmas 2.1–2.3.
- **platttrudgian2018** — D. Platt, T. Trudgian, *Improved bounds on Brun's constant*,
  arXiv:1803.01925: Theorem 2, display (11).
- **pomerance2011** — C. Pomerance, *Remarks on the Pólya–Vinogradov inequality*, Integers 11
  (2011), 531–542: Lemmas 2–4, Theorem 1.
- **ramareviswanadham2021** — O. Ramaré, G. K. Viswanadham, *Modular ternary additive problems
  with irregular or prime numbers*, Proc. Steklov Inst. Math. 314 (2021), 203–237: Lemmas 14, 15.
- **rieselvaughan1983** — H. Riesel, R. C. Vaughan, *On sums of primes*, Ark. Mat. 21 (1983),
  45–74: Lemma 4.
- **siebert1976** — H. Siebert, *Montgomery's weighted sieve for dimension two*, Monatsh. Math.
  82 (1976), 327–336.
- **tmeemt-art05**, **tmeemt-art11**, **tmeemt-art14**, **tmeemt-art15** — A. de Camargo,
  O. Ramaré, D. Benielli (eds.), TME-EMT wiki pages on exponential sums, integer points near
  curves, sieve bounds and character sums.
- **trevino2015** — E. Treviño, *The Burgess inequality and the least k-th power non-residue*, Int.
  J. Number Theory 11 (2015), 1653–1678; arXiv:1412.3062v2: Theorem A, Theorems 1, 2, Corollaries
  1, 2, Theorem C, Lemmas 1–6, Tables 1–7.
- **trevino2015kth** — E. Treviño, *The least k-th power non-residue*, J. Number Theory 149
  (2015), 201–224: Theorem 1.2 and its combinatorial count.
- **vanlintrichert1965** — J. H. van Lint, H.-E. Richert, *On primes in arithmetic progressions*,
  Acta Arith. 11 (1965), 209–216: the coprime comparison and the choice of `z`.
- **yamada2023** — T. Yamada, *Explicit improvements of the Brun–Titchmarsh theorem for arbitrary
  intervals*, arXiv:2312.16090: Theorem 2.
- **yang2024** — A. Yang, *Explicit bounds on ζ(s) in the critical strip and a zero-free region*,
  J. Math. Anal. Appl. 534 (2024), 128124; arXiv:2301.03165: Lemma 2.3.
- **zhao2024** — Z. Zhao, *Integral points close to smooth plane curves*, arXiv:2407.01778:
  Theorems 2.1, 2.5, Lemma 2.6, Theorem 2.7.
