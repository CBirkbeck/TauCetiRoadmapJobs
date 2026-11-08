# Triage report: TARGET-ExplicitMultiplicativeFunctions

Verdict: **design**, name `ExplicitMultiplicativeFunctions` (the suggested name fits and is unused).
Brief: `packages/ExplicitMultiplicativeFunctions/target.md`.

## 1. What was searched

### 1.1 Open targets and designs on the board (consolidation)

The four sibling explicit targets filed with this one (`TARGET-ExplicitCharacterSumsAndSieves`,
`TARGET-ExplicitNumberFields`, `TARGET-ExplicitPrimeCounting`, `TARGET-ExplicitZetaBounds`) were read
in full from their issue bodies and compared layer by layer. Their layers are:

| sibling | layers |
|---|---|
| ExplicitPrimeCounting | ψ, θ, π; RH/partial-RH bounds; unconditional ψ/θ/π; Mertens-type *sums* Σ 1/p, Σ log p/p, Σ Λ(n)/n; n-th prime; progressions; short intervals |
| ExplicitZetaBounds | Gamma; pointwise ζ, L; zero counting; Perron and means; large sieve; L(1,χ); zero-free regions; zero density; verified zeros |
| ExplicitCharacterSumsAndSieves | exponential sums; lattice points near curves; Pólya–Vinogradov; Burgess; sieve upper bounds (Brun–Titchmarsh, dimension two, Selberg density, rough numbers) |
| ExplicitNumberFields | ζ_K size, ideal counts, residue, class numbers, zeros, least primitive roots |

None of them plans a Möbius summatory bound, an average of a nonnegative multiplicative function,
a divisor-sum or squarefree-count remainder, an explicit Euler product over primes, or a pointwise
bound for ω, τ_k, σ. Two of them presuppose this roadmap: the character-sums target names
"the sibling roadmap on pointwise bounds" as the supplier of explicit bounds on d(q), 2^ω(q) and
q/φ(q) for its Burgess layer, and the prime-counting target names "the explicit Möbius and
multiplicative-function bounds" as a consumer of its Layers 2 and 3. The overlap is a supplier
relation, not shared theory, so no merge.

The other open designs (stacks, varifolds, Sobolev maps, Schatten classes, spectral sequences,
Lie groups, …) share no mathematical object with this target.

### 1.2 Roadmaps on main, open roadmap pull requests, board packages

`roadmaps grep` over main and all open heads for: Mertens function / summatory Möbius / M(D) /
μ(d)/d; Hall–Tenenbaum, Levin–Fainleib, Rankin, convolution method, Daboussi; superior highly
composite, Nicolas–Robin, Robin's inequality; divisor problem, squarefree numbers, 6/π², μ²(n);
Mertens product/theorem, Rosser–Schoenfeld, Dusart, Meissel; the authors MacLeod, Costa Pereira,
El Marraki, Balazard, Cohen–Dress, Kotnik, Hurst, Ramaré, Bordellès, Treviño, Cully-Hugill,
Trudgian; and pointwise bounds ω(n) ≤, τ(n) ≤, d(n) ≤, σ(n) ≤. Relevant hits, all read:

- **AnalyticNumberTheoryPartI** (pull request #1126, merge order 84). Plans the *asymptotic*
  versions of several objects here and a few Rosser–Schoenfeld numerics: §0.3 θ(x) < 1.000081 x and
  §0.5 the Rosser–Schoenfeld π bounds, each under a `…FiniteRangeInput` Prop; §0.19 the explicit
  reciprocal-prime estimate (Rosser–Schoenfeld Theorem 5, x ≥ 286); §0.25 ∏_{p≤x}(1+1/p) ≤ 2 log x
  for x ≥ 10⁸ under `PrimeProductFiniteInput`; §0.11, §0.21, §0.26, §0.31 Mertens' three theorems
  with O(1) remainders; §1.2 Davenport's uniform Möbius exponential-sum cancellation (ineffective);
  §3.1/§3.26 an explicit divisor subpower bound τ(n) ≤ C_ε n^ε; §3.7 the asymptotic maximal order
  τ(n) ≤ exp((log 2+ε) log n/log log n) for n ≥ K(ε); §3.9/§3.12 coprime Möbius sums weighted by
  log t/t and 1/t with O_A((log T)^{-A}) remainders; §3.22 Σ τ(n) = x log x + (2γ−1)x + O(√x);
  §3.35 Rankin's smooth-number bound. None carries the numerical constants and thresholds of this
  target; they are the qualitative predecessors and are cited, not re-planned.
- **SieveMethodsAndPrimePatterns** (pull request #1495, order 259). §0.5 weighted Rankin cutoff and
  tail bounds for sieve densities; §1.1 the Wirsing/Levin–Fainleib mean value in dimension κ as an
  asymptotic, and the GGPY Lemma 3 uniform form with an O(c_γ L) remainder whose implied constant
  depends on (A₁, A₂). The explicit Levin–Fainleib theorem of Ramaré 2009 (Theorem 21.1) with its
  explicit constant B refines §1.1 and is not planned there.
- **ProbabilisticAndMetricNumberTheory** (pull request #1421, order 260). Layer 3 has the
  Rankin-type bound Σ_{n≤x} f(n) ≤ x exp(Σ_{p≤x}(f(p)−1)/p) for f(p^ν) = f(p) ≥ 1 (its Lemma 7.2);
  Layer 1 Turán–Kubilius and Hardy–Ramanujan. Not the explicit general-f bounds of Layer 6 here.
- **ErdosProgressionPowers** (pull request #1336, order 187). Consumes the AnalyticNumberTheoryPartI
  numerics through named `…FiniteInput` Props and ComputationalNumberTheory §§4.22–4.24 for the
  zero-line clauses: this is the existing convention for computational hypotheses, which the
  brief adopts (see target.md, Scope).
- **ComputationalNumberTheory** (pull request #1408, order 185). Layer CN.4 validated numerics
  (interval arithmetic, L-value enclosures, Platt's finite-conductor theorems §4.22–4.24, explicit
  digamma remainders §4.17a) and Layer CN.5 "binding and replay of arithmetic datasets": the home
  for discharging the named hypotheses.
- **ZerosOfLFunctions** (main). Layer 9 defines *HasZerosInRects*, *AllOnCriticalLine* and GRH as
  Props: the shape of `RiemannZerosVerified(T)`. Layer 8 has `chebyshevPsi_explicitFormula`.
- **LFunctions** (main). Layer 4 Dirichlet L-functions and factorizations; Layer 8 Mertens' product
  for a number field, asymptotic only.
- **CharacterSumsOverFiniteFields** (pull request #1712). Its scope statement explicitly excludes
  incomplete sums (Pólya–Vinogradov, Burgess, Weyl differencing) and assigns them to the analytic
  number theory roadmaps; Layer 7 has complete sums modulo an integer only. The filed target's
  consumption "Pólya–Vinogradov from CharacterSumsOverFiniteFields Layer 7" is therefore wrong and
  is corrected in target.md: the explicit Pólya–Vinogradov constant belongs to the sibling
  ExplicitCharacterSumsAndSieves (Layer 3), and Layer 4 here takes it as a parameter.
- **ClassicalArithmeticCompletion** (main). Layer 4 has one explicit dyadic prime count
  π(2x) − π(x) > 3x/(5 log x) (Berrevoets); nothing on Möbius or divisor averages.
- Board packages index: `AnalyticNumberTheory` (#123) is an index of Part I and Part II; the other
  two packages (Lawrence–Venkatesh, logic) are unrelated.

No roadmap, pull request or package owns any statement of this target: the verdict is not
`duplicate` and not `part-ii` (no base roadmap owns explicit multiplicative estimates; the
asymptotic AnalyticNumberTheoryPartI is a different direction, qualitative and ineffective).

### 1.3 Libraries at the pins

Mathlib (`NumberTheory/`): `ArithmeticFunction` with μ, σ, ω, Ω, Λ, ζ, `IsMultiplicative`,
`prodPrimeFactors`, `IsMultiplicative.prodPrimeFactors_one_add_of_squarefree`,
`Nat.sum_divisors_filter_squarefree`; `Chebyshev.psi`, `Chebyshev.theta` with
`theta_le_log4_mul_x`, `psi_sub_theta_le`, `psi_le_const_mul_self`,
`primeCounting_eq_theta_div_log_add_integral`; `sum_mul_eq_sub_sub_integral_mul` (Abel summation);
`harmonic_le_one_add_log`, `log_add_one_le_harmonic`, `eulerMascheroniConstant` with only
`1/2 < γ < 2/3`; `smoothNumbers`; `SelbergSieve`; `DirichletCharacter.LFunction_apply_one_ne_zero`;
`hasSum_zeta_two`; `pi_gt_d6`, `exp_one_gt_d9`, `log_two_gt_d9`; `card_divisors_le_self`,
`sigma_le_pow_succ`. No explicit Möbius, divisor-sum, squarefree-count or Euler-product constant.

Tau Ceti: `NumberTheory/ArithmeticDirichletSeries/*` (ideal Abel summation
`summatory_mul_eq_sub_sub_integral_mul`, Euler products, Perron, Stieltjes summatory functions,
ideal Möbius function), `NumberTheory/AbelSummation.lean`, `NumberTheory/EffectiveBounds/*`
(class numbers, regulators), `NumberTheory/ArithmeticFunction/DivisorBounds.lean`
(`sum_divisors_pow_le`). Nothing explicit about M(D), m(D), Δ(x), R(x), ω, τ_k, σ.

PrimeNumberTheoremAnd (PNT+) is not a pinned dependency (`lake-manifest.json` lists only TauCeti
and mathlib); it is consulted for statement shape only, as the target says.

## 2. Why `design`

The target is a coherent new library: the explicit numerical layer of multiplicative number
theory, on Mathlib carriers, with every large computation isolated as a named Prop hypothesis. No
existing roadmap owns it or continues into it; its suppliers (ZerosOfLFunctions, LFunctions,
ComputationalNumberTheory, AnalyticNumberTheoryPartI for qualitative inputs, SieveMethods §0.5/§1.1
for statement shapes) all exist on main or earlier in the merge order; the sibling explicit
roadmaps are ordered around it without a cycle (see target.md, Suppliers: Layer 4 takes
Pólya–Vinogradov as a parameter so that ExplicitCharacterSumsAndSieves can consume Layer 9).

## 3. Generality decisions recorded in target.md

- Coprimality restrictions are stated for the multiplicative semigroup generated by an arbitrary
  set of primes (Tao 2010), with q/φ(q) read as ∏_{p∈S}(1−1/p)^{−1} over the finitely many excluded
  primes; the modulus-q form is the instance S = primes dividing q.
- Each numerical theorem is the instance of a general conversion theorem that the roadmap owns:
  Balazard's identities (bounds on M ⇒ bounds on m, m̌), Ramaré's prime-to-Möbius transfer (explicit
  ψ and Σ Λ(n)/n bounds of a given shape ⇒ Möbius bounds), the comparison theorem of the
  convolution method (any model k with a three-term expansion ⇒ expansion for h ⋆ k), the
  Levin–Fainleib theorem for arbitrary nonnegative multiplicative g.
- Computational inputs are Props with the verified range as data (`MoebiusTableVerified c H`,
  etc.), following the `…FiniteInput` convention of AnalyticNumberTheoryPartI and
  ErdosProgressionPowers; verified zeros use ZerosOfLFunctions Layer 9's *AllOnCriticalLine*.
- The enclosure of Euler's constant γ (Mathlib knows only 1/2 < γ < 2/3) is itself a named
  hypothesis or a theorem via ComputationalNumberTheory §4.17a; the design must decide.

## 4. Sources

All 55 works the target and the brief cite are in `packages/ExplicitMultiplicativeFunctions/sources.toml`
(`sources check`: no problems). 34 were fetched and read through the sources service from legal
hosts (arXiv, HAL, Numdam, Centre Mersenne, the IMPAN CC-BY archive, the AMS open archive, Cambridge
Core open back volumes, open-access journals, the author's page); their theorem locators were
verified in the extracted texts and are quoted as `<id> line N` in target.md. 21 are recorded
`uncertified`: 7 are open access but the hosts (Project Euclid, the EMIS mirrors) refused the
automated fetch during this run, 11 are paywalled papers or books, 3 are unpublished (a thesis and
two preprints). No `needs-references.toml` was left, since every unreadable work is settled as
`uncertified` by its locator.

Corrections to the filed statement found while reading the texts, carried into target.md:

- Ramaré 2015, Theorem 1.5 was replaced by the 2019 corrigendum: `|m̌(D) − 1| ≤ 0.00140/log D` for
  `D ≥ 9950` (and the simpler thresholds 0.213, 0.0203, 1/396, 1/714), not `0.00257/log D` for
  `D ≥ 3846`.
- Berkane–Bordellès–Ramaré, Theorem 1.2: `|Δ(x)| ≤ 0.764 x^{1/3} log x` holds for `x ≥ 9995`, not
  `x ≥ 5`; its Corollary 2.2 prints the constant term as `γ² − γ₁` where the filed text says `γ² − 2γ₁`,
  left to the design as a Check.
- Trudgian 2015: the `2^ω` bounds are Lemma 13, with `1.3949` (not `1.3948`).
- Ramaré 2013: Theorem 1.1 is `(0.0130/log D − 0.118/log² D) D` for `D ≥ 1 078 853`; the wiki's
  `0.013/log D` for `D ≥ 1 100 000` is a weakening.
- Costa Pereira's `x/1036` rests on a finite check over `120 727 ≤ x < 10^8`, so it takes a
  computational hypothesis like the other elementary bounds.
- Teo's results are in §§6.3–6.5 and Tables 14–15 of the arXiv v2 text; the filed §§6.1–6.2 and
  Tables 16–18 are the published numbering.
- Nicolas 2008, Théorème 2 holds for `n ≥ 2` with `2.59790…`.

## 5. Suspicious text

None of the fetched texts or issue bodies contained instructions; nothing to report.
