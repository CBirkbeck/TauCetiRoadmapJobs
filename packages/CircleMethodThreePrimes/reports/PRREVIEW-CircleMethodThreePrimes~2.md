# Review of CircleMethodThreePrimes (pull request #1803 at 237a60c)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CircleMethodThreePrimes/README.md` and `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` at 237a60c, after checking the eleven findings of the previous review finding by finding. The gate passes at this head (every check 0, build OK), the dependency check is clean, and the mathematics of the plan holds under the adversarial table below. Two P3 repairs remain: one ownership citation and one shape item.

## The previous review's findings at this head

- **R01 (2Q² < N)**: repaired. README line 327 now reads "take `N` so large that `2Q³ < N`", line 330 gives the disjointness reason (`Q⁻² > 2Q/N`), and lines 332–335 handle the Dirichlet step: the fraction `0/1` is excluded because `α ≥ Q/N`, and a reduced fraction with denominator at most `Q` puts `α` on a major arc. Checked at `Q = 10`, `N = 2001`: `2Q/N = 0.009995 < 1/Q² = 0.01`.
- **R02 (`set_option`)**: repaired; the line is gone (gate `set_option=0`).
- **R03 (module header)**: repaired; `Suggested.lean` lines 1–3 and 27 (`module`, `public import Mathlib`, `@[expose] public section`), gate `build=0`.
- **R04 (TeX outside a code span)**: repaired; the 4.6 display is a fenced `text` block (lines 375–377).
- **R05 (admitted examples)**: repaired; the `WorkedExamples` section is deleted, the three examples live in the README's Examples lists.
- **R06 (`expTwoPiI_eq_fourierChar`)**: repaired; deleted from the Lean file, kept as an API bullet of 0.1 (line 154) and the export contract no longer names it (line 133).
- **R07 (`psiAP` ownership)**: repaired. README lines 44–45 and 97 name `AnalyticNumberTheoryPartI` §0.32 as the owner, the export contract (line 137) no longer lists `psiAP`, 3.1 reads "With `ψ(x; q, a)` the supplier's `psiAP`", and the local `def psiAP (q : ℕ) (a : ZMod q) (x : ℝ)` (Lean line 130) has the supplier's argument order and body, as checked below.
- **R08 (locators)**: repaired in substance. Every target now carries a source (0.2, 1.1, 1.2, 2.1, 3.2 individually; 4.1–4.8 through line 309), the Iwaniec–Kowalski reference line is corrected to §§13.4–13.5 and §19.4, and Helfgott Chapter 1 is cited for the ineffective threshold. Theorem numbers and pages were not added; since Davenport, Vaughan and Iwaniec–Kowalski are closed texts and the Iwaniec–Kowalski section pages are confirmed by the cached contents (below), this is not re-raised.
- **R09 (shape)**: repaired except for one definition (R02 below). Checks: `expTwoPiI` 3, `distInt` 3, `ramanujanSum` 3, `primeExpSum` 3, `psiAP` 3, `threePrimeWeight` 3, `threePrimeCount` 4, `singularSeries` 3, `SiegelWalfiszBound` 2. Per-target `*Needs:*`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers` are present.
- **R10 (unnamed Lean declarations)**: repaired; `integral_expTwoPiI_intCast` at line 156 and `integral_geomSum_cube` at line 366, both in the export contract.
- **R11 (constant in 2.2)**: repaired; line 248 states `(log 4 + 4) N log N` from `vonMangoldt_le_log` and `psi_le_const_mul_self`, which is what the pin supplies (`Mathlib/NumberTheory/Chebyshev.lean` line 453: `ψ x ≤ (log 4 + 4) * x` for `0 ≤ x`).

## R01 (P3) — the Ramanujan sum is `AutomorphicSpectralTheory` §1.16's `S(n, 0; q)`, and is not cited

**Location.** `README.md` lines 27 ("Ramanujan sums" under Owned here) and 169–175 (0.2: "Define `ramanujanSum q n = ∑_{0 ≤ b < q, gcd(b, q) = 1} e(bn/q)` … Prove `c_q(n) = ∑_{d ∣ q, d ∣ n} d μ(q/d)` …").

**Claim.** The README owns the Ramanujan sum outright and names no earlier roadmap for it.

**Witness.** `AutomorphicSpectralTheory` §1.16 (an earlier roadmap in the merge order, line 82 against this roadmap's 260) defines `S(m, n; c) = ∑_{d ∈ (ℤ/cℤ)^×} e((md + n d̄)/c)` for `c ≥ 1` and states as Checks `S(0, 0; c) = φ(c)`, `S(m, 0; p) = p − 1` or `−1`, and `S(m, 0; c) = ∑_{d ∣ (m, c)} μ(c/d) d`. `CharacterSumsOverFiniteFields` §7.3 already defers the integer-modulus sum to that section. So `c_q(n) = S(n, 0; q)` is an object an earlier roadmap states, and the divisor formula of 0.2 is one of its Checks. (`AutomorphicSpectralTheory`'s `Suggested.lean` declares no Kloosterman sum, so the Lean carrier `ramanujanSum` clashes with no declaration.)

**Repair.** Under "Consumed, not redefined" add: the Ramanujan sum is the value `S(n, 0; q)` of `AutomorphicSpectralTheory` §1.16's Kloosterman sum, with its divisor formula and the values `S(0, 0; q) = φ(q)`, `S(n, 0; p)`. In 0.2 say in one clause how the kept carrier differs: `ramanujanSum` is that specialisation on native carriers (`q : ℕ`, `n : ℤ`, `ℂ`-valued), kept here because the circle method needs its multiplicativity in `q`, the bound `|c_q(n)| ≤ gcd(n, q)` and the vanishing `c_{p^k}(n) = 0`, none of which §1.16 states; and add the identification `ramanujanSum q n = S(n, 0; q)` as an API bullet of 0.2. Tested on the instance: with `q = 12` both sides give `0, 2, 0, −2, −4, 4` at `n = 1, 2, 3, 4, 6, 0` (recomputed from the unit sum and from the divisor formula).

## R02 (P3) — `SiegelWalfiszBound` has two Checks; Layer 3's Dependencies omit a supplier

**Location.** `README.md` lines 277–278 (the two Checks of `SiegelWalfiszBound`) and line 303 ("`SiegelWalfiszBound`, Layers 0.2 and 2.1").

**Claim.** The shape rule is at least three discriminating Checks per definition; `SiegelWalfiszBound` (a `def … : Prop`, Lean line 136) has two. Layer 3's `### Dependencies` lists neither 0.1 nor `AnalyticNumberTheoryPartI` §0.32, although 3.1's `*Needs:*` (line 280) cites both.

**Witness.** Count of Checks at lines 277–278: `q = 1` (the prime number theorem with a logarithmic saving) and `q = 2, a = 0` (excluded, `ψ(x; 2, 0) = O(log x)`). Line 303 against line 280.

**Repair.** Add a third Check that discriminates the main term: at `q = 2`, `a = 1`, `φ(2) = 1` and `ψ(x; 2, 1) = ψ(x) − log 2 · ⌊log₂ x⌋`, so the proposition asserts `|ψ(x; 2, 1) − x| ≤ C x (log x)^{−A}`; a definition with `x/q` in place of `x/φ(q)` would assert `|ψ(x; 2, 1) − x/2| ≤ C x (log x)^{−A}`, false since `ψ(x; 2, 1) ∼ x`. (Computed: `ψ(10; 2, 1) = ψ(10) − 3 log 2 = 7.8320 − 2.0794 = 5.7526` against `x/φ(2) = 10` and `x/2 = 5`; the discriminating behaviour is the asymptotic one.) Extend line 303 to "`SiegelWalfiszBound`, Layers 0.1, 0.2 and 2.1; `AnalyticNumberTheoryPartI` §0.32 for `ψ(x; q, a)`".

## Verified sound

**Gate and dependency check.** The worker's gate at 237a60c: every check 0, `build=0`, OK. Run by me:

```
depcheck: 236 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists `CircleMethodThreePrimes` at line 260, after `SieveMethodsAndPrimePatterns` (259) and `AnalyticNumberTheoryPartI` (84); `AutomorphicSpectralTheory` is at line 82. The entry `ExponentialSumsAndCircleMethodPartII` (line 375) matches no roadmap on main, on the board index (three packages: AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) or in any open pull request, so it raises no ownership question. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.NT"`).

**Suppliers resolved at their heads, this round.** `AnalyticNumberTheoryPartI` (pull request #1126, head a4886b9): §0.32 "Siegel–Walfisz theorem" exists; `psiAP (q : ℕ) (a : ZMod q) (x : ℝ) : ℝ := ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n : ℕ => (n : ZMod q) = a), ArithmeticFunction.vonMangoldt n` (its `Suggested.lean` line 43) is this roadmap's `psiAP` (Lean line 130) argument for argument and term for term, so the identification in 4.9 is definitional as the README says; `siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) : ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B → ∀ a : ZMod q, IsUnit a → |psiAP q a x − x / q.totient| ≤ C * x * Real.log x ^ (−A)` (line 51) is README line 98; §1.2 "Davenport uniform Möbius exponential cancellation" exists with the Möbius-specialised interfaces `mobius_type_I_bound`, `mobius_type_II_bound` (its README line 743), so the arbitrary-coefficient bounds of Layer 1 are not stated there. `SieveMethodsAndPrimePatterns` (pull request #1495, head 5244d2f): §2.4 "Vaughan's decomposition" (README line 1930) with `λ_V(n) = ∑_{d ∣ n, V < d} Λ(d)` and `0 ≤ λ_V(n) ≤ log n` (lines 1934–1945), the energies `∑_{ℓ ∈ Ioc(L, M)} λ_V(ℓ)² ≤ (M − L)(log M)²` for `L ≤ M` (line 2041), and `SieveVaughan.vaughan_identity (U V n : ℕ)` (its `Suggested.lean` line 289) stating exactly README line 89 (for all `n`, so "`n ≥ 1`" in the contract is a harmless restriction). The 4.9 adapter from the eventual statement to all `x ≥ 2` is sound: on `2 ≤ x ≤ x₀`, `|ψ(x; q, a) − x/φ(q)| ≤ ψ(x) + x ≤ (log 4 + 5) x ≤ (log 4 + 5)(log x₀)^A · x (log x)^{−A}`. The non-owners `ImaginaryQuadraticClassNumber`, `ZerosOfLFunctions`, `ContourIntegration` exist on main; none is cited as a `*Needs:*`.

**Mathlib at the pin (f6090c7).** `Chebyshev.psi x = ∑ n ∈ Ioc 0 ⌊x⌋₊, Λ n` (`NumberTheory/Chebyshev.lean` 70), `psi_le_const_mul_self : 0 ≤ x → ψ x ≤ (log 4 + 4) * x` (453); `vonMangoldt_nonneg` (80) and `vonMangoldt_le_log : Λ n ≤ Real.log n` (151) in `NumberTheory/ArithmeticFunction/VonMangoldt.lean`; `Real.exists_int_int_abs_mul_sub_le (ξ : ℝ) {n : ℕ} (0 < n) : ∃ j k : ℤ, 0 < k ∧ k ≤ n ∧ |k * ξ − j| ≤ 1 / (n + 1)` (`NumberTheory/DiophantineApproximation/Basic.lean` 93), as README line 80 states it; `sum_mul_eq_sub_sub_integral_mul` (`NumberTheory/AbelSummation.lean` 129); `Real.fourierChar` and `fourierChar_apply : 𝐞 x = Complex.exp (↑(2 * π * x) * Complex.I)` (`Analysis/Complex/Circle.lean` 221, 232); `HasProd` (`Topology/Algebra/InfiniteSum/Defs.lean` 106); `Nat.Primes` (`Data/Nat/Prime/Defs.lean` 438); `abs_sub_round` (`Algebra/Order/Round.lean` 193). No Ramanujan sum, additive character `e` beyond `fourierChar`, or circle-method material in Mathlib or Tau Ceti at the pins (search for "Ramanujan sum", "circle method", "three primes", "singular series": the only hits are a combinatorics file and three Tau Ceti files about primes over 2 in number fields).

**Ownership against open pull requests** (index of 2026-11-05, 452 pull requests) with `roadmaps grep` for "Ramanujan sum", "three-primes theorem", "circle method", "singular series", "Vinogradov's theorem/bound": outside this folder the hits are the Kloosterman Checks `S(m, 0; 12)` of `CharacterSumsOverFiniteFields` (#1712, which defers the integer-modulus sum to `AutomorphicSpectralTheory` §1.16: R01), Browning–Sawin's geometric circle method as a reference in `AlgebraicTopologyPartII`, and unrelated uses of "Ramanujan". No open pull request plans the type I/II additive bounds, Vinogradov's minor-arc bound, the major-arc approximation, the singular series or the three-primes theorem; this roadmap is their owner.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` at head: 18 `declaration uses sorry` warnings, nothing else (10 s). The worker's elaborated signatures of all 28 declarations were compared with the README: no `variable` block exists, so no binder is lost; `norm_primeExpSum_le` and README 2.1 both take `N ≥ 2`, `q ≥ 1`, `gcd(a, q) = 1`, `|α − a/q| ≤ q⁻²` with an absolute `C`; `primeExpSum_majorArc` and README 3.2 quantify `C` after `A, B` and before `N, q, a, β`; `threePrimeWeight_asymptotic` and README 4.7 take `N ≥ 2`; `ramanujanSum_eq_sum_divisors` and README 0.2 take `q ≥ 1`; `integral_geomSum_cube` and README 4.5 take `N ≥ 1`. Every backticked Lean name of the README is declared and every declaration is named in the README (gate `readme-ids-missing=0`). The hypotheses `1 ≤ q` of `ramanujanSum_eq_sum_divisors` and `1 ≤ N` of `integral_geomSum_cube` are unused (at `q = 0` both sides are `0`; at `N = 0` both sides are `0`): a note, not a finding.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | (simp [all nine definitions]; done) | (norm_num [...]; done) | (positivity; done) | exact …`; all 18 sorried theorems failed every alternative, so none closes in one tactic. No declaration restates a definition, mirrors a Check or computes a value.

**Headline theorems.** From the README: Vinogradov's three-primes theorem (`vinogradov_threePrimes_unconditional`, and its conditional form), the weighted asymptotic `r(N) = ½𝔖(N)N² + O_A(N²(log N)^{−A})` (`threePrimeWeight_asymptotic`), the count asymptotic (`threePrimeCount_asymptotic`), Vinogradov's minor-arc bound (`norm_primeExpSum_le`), the major-arc approximation (`primeExpSum_majorArc`), the Euler product and bounds of the singular series. All are statable at the pins and all are stated; the docstring says so.

**Sources.** `helfgott2015` lines 362–371 (Chapter 1, printed p. 4): Vinogradov's first proof gives an undetermined constant `C` with every odd `n > C` a sum of three primes, as README line 395–396 says. The cached Iwaniec–Kowalski table of contents (sources cache text ebcb8686, lines 131–132, 178) places §13.4 Vaughan's identity at p. 344, §13.5 Exponential sums over primes at p. 345 and §19.4 Proof of Vinogradov's three primes theorem at p. 447, matching README lines 455–457. Library catalogue records of Davenport, 3rd ed. (GTM 74, 2000) list Chapter 24 Further Prime Number Sums, Chapter 25 An Exponential Sum Formed with Primes, Chapter 26 Sums of Three Primes, matching lines 458–459.

**Adversarial table.** One row per statement, values computed on each side (Checks recomputed numerically this round).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `expTwoPiI` Checks | `α = 0, 1/2, 1/4` | `1`, `−1`, `i` | holds | none |
| 0.1 `distInt` Checks | `1/2, −0.3, 7` | `round(1/2) = ⌊1⌋ = 1` so `1/2`; `round(−0.3) = ⌊0.2⌋ = 0` so `0.3`; `0` | holds | none |
| 0.1 geometric bound with the `if` | `β = 0, N = 5`; `β = 1/2, N = 5`; `N = 0` | `5 ≤ 5`; `1 ≤ min(5, 1)`; `0 ≤ 0` | holds (`|∑| ≤ 1/|sin πβ| ≤ 1/(2‖β‖)`) | none |
| 0.1 orthogonality | `m = 0, 1, −2` | `1`; `0`; `0` | holds | none |
| 0.2 `ramanujanSum` Checks and divisor formula | `c₁(5)`, `c₂(1)`, `c₆(0)`, `c₄(2)`, `c₁₂(n)` for `n = 1, 2, 3, 4, 6, 0` | unit sum: `1, −1, 2, −2`, `0, 2, 0, −2, −4, 4`; divisor sum: the same values; `φ(6) = 2` | holds; the `c₁₂` row is also `AutomorphicSpectralTheory` §1.16's Check | R01 (citation only) |
| 0.2 multiplicativity, prime-power vanishing, `gcd` bound | `c₆(1) = c₂(1)c₃(1)`; `c₉(1)`, `c₄(1)`; `q = 4, n = 2` | `1 = (−1)(−1)`; `0`, `0`; `|−2| ≤ 2` | holds (`c_q(n) = μ(q/g)φ(q)/φ(q/g)`, `g = gcd(q, n)`) | none |
| 0.2 junk modulus | `q = 0` | `range 0 = ∅` so `c₀ = 0`; divisor sum over `Nat.divisors 0 = ∅` is `0`; `Coprime 0 1` so `c₀ = 0 · c₁` | consistent, `1 ≤ q` unused | none |
| 1.1 type I bound | first block `m ≤ q` with `ma ≡ ±1 (mod q)`; `α = 0, q = 1`; `q > MX` | `‖mα‖ ≥ (q − m)/q²`, so `min(X/m, 1/‖mα‖) ≤ 2q + 2X/q`; LHS `= X ∑ 1/m ≤ X(1 + log M)` vs `C(X + M + 1) log 2M`; LHS `≤ X(1 + log M)` vs `C q log 2` | holds in each regime with `C ≥ 2`; the `if` is what makes `α = 0` true | none |
| 1.2 type II bound | `M = N`; `q > N`; general | inner sums empty, LHS `0`; Cauchy–Schwarz gives `‖a‖₂² ‖b‖₂² max_h ∑_{|h| ≤ N/M} min(M, 1/‖αh‖) ≪ (M + N/q + q + N/M) log(2Nq)` | holds, the four terms are the standard ones | none |
| 2.1 `primeExpSum` Checks | `α = 0`; `N = 1`; `N = 2` | `ψ(N)`; `Λ(1) = 0`; `(log 2) e(2α)` | holds | none |
| 2.1 the `N q^{−1/2}` term | `α = 1/2`, `N = 100` | `∑ Λ(n)(−1)ⁿ = −85.7275`; `−ψ(100) + 2 log 2 · 6 = −85.7275` | the term is needed | none |
| 2.1 at `q > N` | `q = 2N` | `|S| ≤ ψ(N) ≤ (log 4 + 4)N ≤ (log 4 + 4)√(Nq)` | holds | none |
| 2.2 Parseval and the constant | `N = 2`; `N = 113` | `(log 2)² = 0.480 = ∫|S|²`; `ψ(113) = 117.39 > 113` so constant `1` is indeed unavailable from `ψ ≤ x`; `∑Λ² ≤ log N · ψ(N) ≤ (log 4 + 4) N log N` | holds | none |
| 3.1 prime powers sharing a factor with `q` | `q = 1`; `q = 6, x = 10` | `0 ≤ 0`; `3 log 2 + 2 log 3 = 4.2767 ≤ log 6 · log 10/log 2 = 5.9521` | holds (`ω(q) log x ≤ log q log x/log 2`) | none |
| 3.1 `psiAP` Checks | `(1, 0)`; `(10; 2, 0)`; monotonicity | `ψ(x)`; `3 log 2 = 2.0794` (terms `2, 4, 8`); `Λ ≥ 0` | holds | none |
| `SiegelWalfiszBound` Checks | `q = 1`; `q = 2, a = 0`; `q = 2, a = 1` | PNT with log saving; `ψ(x; 2, 0) = log 2 ⌊log₂ x⌋`; `ψ(x; 2, 1) ∼ x = x/φ(2)`, not `x/2` | holds; third Check missing | R02 |
| 3.2 major-arc form | `q ≤ (log N)^B`, `√N ≤ t ≤ N` | `(log N)^B ≤ (log t)^{B+1}` once `log N ≥ 2^{B+1}`; error `φ(q) C t (log t)^{−A−B} ≤ 2^{A+B} C N (log N)^{−A}`; `∑_{b unit} e(ab/q) = c_q(a) = μ(q)`; Abel summation costs `1 + 2π|β|N` | holds; `N = 2` is vacuous (`(log 2)^B < 1`), bounded `N` absorbed into `C` | none |
| 4.1 `threePrimeWeight` and `threePrimeCount` Checks | `r(3), r(6), r(7)`; `R(5), R(6), R(7), R(9)` | `0`, `0.333025 = (log 2)³`, `1.583495 = 3(log 2)² log 3`; `0, 1, 3, 4` | holds; the guard `n₁ + n₂ < N` makes `N − n₁ − n₂ ≥ 1` exact | none |
| 4.1 integral representation | `N = 0, 1, 6` | `0 = 0`; `0 = ∫ 0`; `(log 2)³` both sides | holds | none |
| 4.2 disjointness and Dirichlet step | `Q = 10, N = 2001`; `α = Q/N`; reduced `a/q`, `q ≤ Q` | `2Q/N = 0.009995 < Q⁻² = 0.01`; `0/1` gives `α < Q/N`, excluded; `a/q ∈ [1/Q, 1]` since `a/q < 1 + 2Q/N < 1 + 1/Q`; for `q > Q`: `|α − a/q| < Q/(qN) ≤ q⁻²` as `q ≤ ⌊N/Q⌋` | holds | none |
| 4.3 minor arcs | `Q < q ≤ N/Q` | `Nq^{−1/2}, (Nq)^{1/2} ≤ NQ^{−1/2}`; `N^{4/5} ≤ NQ^{−1/2}` once `Q ≤ N^{2/5}`; `∫_𝔪|S|³ ≤ sup|S| · ∫|S|² ≤ C N² (log N)^{5 − B/2}` | holds | none |
| 4.4 Euler factor and `singularSeries_hasProd` | `p ∣ N`; `p ∤ N`; `p = 2`, `N` odd; `N = 0` | `1 − (p−1)/(p−1)³ = 1 − (p−1)⁻²`; `1 + (p−1)⁻³`; factor `2`; every `p ∣ 0`, factor at `2` is `0` and `𝔖(0) = ∏_p(1 − (p−1)⁻²) = 0` | consistent; `HasProd … 0` holds since partial products containing `2` vanish | none |
| 4.4 `singularSeries` Checks and numerics | `𝔖(0)`; `𝔖(1)`; truncation at `Q = 1`; `𝔖(1)` by product to `p < 2000` vs sum to `q ≤ 200` | `0`; `2∏_{p ≥ 3}(1 + (p−1)⁻³) = 2.30096`; `1`; `2.30096` vs `2.3009` | holds | none |
| 4.4 lower bound, even `N`, negative `N` | `N = 3`; `N = −3`; `N = 6` | `𝔖(3) = 1.53397 ≥ c = 2∏_{p ≥ 3}(1 − (p−1)⁻²) > 0`; `c_q(−3) = c_q(3)` so `𝔖(−3) = 𝔖(3)`; `𝔖(6) = 0` | holds for all odd `N : ℤ` | none |
| 4.4 truncation | tail | `∑_{q > Q} φ(q)⁻² ≤ c⁻² ∑_{q > Q} q^{−3/2} ≤ 2c⁻² Q^{−1/2}`, `φ(q) ≥ 0.52 q^{3/4}` (factor `p^{1/4}(1 − 1/p) ≥ 1` for `p ≥ 5`) | holds | none |
| 4.5 `integral_geomSum_cube` with natural subtraction | `N = 0, 1, 2, 3, 5` | counts `0, 0, 0, 1, 6`; `(N−1)(N−2)/2` in `ℕ`: `0, 0, 0, 1, 6`; indexing from `0` would give `21 = binom(7, 2)` at `N = 5` | holds; `1 ≤ N` unused | none |
| 4.5 tail | | `2∫_{Q/N}^{1/2}(2β)⁻³ dβ ≤ N²/(8Q²)` | holds | none |
| 4.6 major arcs | per arc, `≤ Q²` arcs | error per arc `≪ Q N² (log N)^{−A'}`, total `≪ N² (log N)^{3B − A'}`; main term `∑_{q ≤ Q} μ(q)c_q(N)/φ(q)³ (N²/2 + O(N²Q⁻² + N))` with `c_q(−N) = c_q(N)` | holds with `A' = A + 4B` | none |
| 4.7 choice of `B` | `B = 2A + 10` | minor arcs `(log N)^{5 − B/2} = (log N)^{−A−5}`; truncation `(log N)^{−B/2}`; tail `(log N)^{−2B}` | holds | none |
| 4.8 prime powers and weights; even `N` | proper prime powers `≤ N`; even `N > 6` | `O(√N)` of them, total `O(N^{3/2}(log N)³)`; a sum of three primes is even only with a `2` among them, `R(N) ≤ 3π(N)`, so `R(N)(log N)³/N² → 0 = ½𝔖(N)` | `threePrimeCount_asymptotic` holds over all `N` | none |
| 4.9 adapter | `2 ≤ x ≤ x₀` | `|ψ(x; q, a) − x/φ(q)| ≤ (log 4 + 5) x ≤ (log 4 + 5)(log x₀)^A x (log x)^{−A}`; `psiAP` here and at the supplier are the same term | holds | none |

**Policy.** No `set_option`, no `lemma`, no `#eval`/`#print`, no sorry'd data (every `def` has a real body), no `Mathlib.<submodule>` import, no pull-request numbers in the README or docstrings, no LaTeX delimiters, no process narrative beyond "None at present" under Downstream consumers. No source passage is copied.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, 3rd ed. (Springer): closed; only the chapter titles were checked, from library catalogue records. The statements of Chapters 25–26 (Vinogradov's bound with `(log N)⁴`, the three-primes theorem) were not read.
- Vaughan, *The Hardy–Littlewood Method*, 2nd ed. (CUP): closed and not in the cache; "Lemma 2.2" for 1.1 was not matched to a statement (a web search for open papers quoting it found none).
- Iwaniec–Kowalski, *Analytic Number Theory*: only the table of contents and a Chapter 11 excerpt from Kowalski's page are in the cache; §13.5 and §19.4 themselves were not read.
- Vinogradov, Dokl. Akad. Nauk SSSR 15 (1937): not online; its content is taken from Helfgott's description.
- Vaughan, C. R. Acad. Sci. Paris 285 (1977): closed; it appears only as bibliography item [Va] in the cached Iwaniec–Kowalski excerpt (line 3049).

## Source issues

- none
