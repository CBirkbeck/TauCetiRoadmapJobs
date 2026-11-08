# Review of CircleMethodThreePrimes (pull request #1803 at fe1154f)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CircleMethodThreePrimes/README.md` and `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean` at fe1154f. The mathematics of the plan is sound end to end (adversarial table below); the one blocking item is a false threshold in the major-arc construction, and the rest are gate failures, padding, ownership and shape repairs. The gate fails (`set_option`, `tex`, `sorry-examples`, `build`), so no acceptance this round.

## R01 (P2) — 4.2: the major arcs are not pairwise disjoint under `2Q² < N`

**Location.** `README.md` line 211: "the major arcs `𝔐` are their union, pairwise disjoint once `2Q² < N`".

**Claim.** With `𝔐(q, a) = {α ∈ I : |α − a/q| ≤ Q/N}` for `1 ≤ q ≤ Q`, the arcs are disjoint as soon as `2Q² < N`.

**Witness.** Take `Q = 10`, `N = 201` (so `B = log 10 / log log 201 ≈ 1.38` and `2Q² = 200 < 201`). The arcs `𝔐(10, 1)` and `𝔐(9, 1)` have centres `1/10` and `1/9`, distance `1/90 ≈ 0.0111`, and each has half-width `Q/N = 10/201 ≈ 0.0498`, so the two arcs overlap on an interval of length about `0.088`. In general two distinct reduced fractions with denominators `≤ Q` are at distance `≥ 1/Q²`, and the arcs have total width `2Q/N`; the disjointness condition is `2Q/N < 1/Q²`, that is `2Q³ < N`. The same example shows `2Q² < N` is also not enough for the remark at line 213 that the Dirichlet approximation of a minor-arc point has `q > Q`: the point `α = Q/N` lies in `I` but in no `𝔐(q, a)` with `1 ≤ a ≤ q ≤ Q` (every such `a/q ≥ 1/Q > 2Q/N`), yet `Real.exists_int_int_abs_mul_sub_le` with `n = ⌊N/Q⌋` may return `j/k = 0/1`, which has `q = 1 ≤ Q`.

**Repair.** Replace `2Q² < N` by `2Q³ < N` (true for `N` large since `Q = (log N)^B`), and in the Dirichlet step either allow `0 ≤ a ≤ q` with `𝔐(1, 0)` identified with `𝔐(1, 1)` modulo `1`, or treat the returned fraction `0/1` separately: at `α = Q/N` the fraction `1/⌊N/Q⌋` is reduced, has `Q < ⌊N/Q⌋ ≤ N/Q` once `N > Q(Q + 1)`, and satisfies `|α − 1/q| = (N − Qq)/(Nq) < Q/(Nq) ≤ 1/q²`. Tested on the instance above: with `2Q³ = 2000 > 201` the corrected hypothesis excludes it, and at `N = 2001`, `Q = 10` (`2Q³ = 2000 < 2001`) one has `2Q/N = 0.009995 < 1/Q² = 0.01`, so every pair of arcs is disjoint.

## R02 (P3) — `set_option` in `Suggested.lean`

**Location.** `Suggested.lean` line 23: `set_option autoImplicit false`.

**Claim.** The gate rule is "no `set_option` in the code of Suggested.lean" (gate: `set_option=1`).

**Repair.** Delete the line. No declaration in the file uses an auto-bound implicit, so nothing else changes (checked by elaborating the file as it stands: every binder is explicit).

## R03 (P3) — build: the file is not a module-system file

**Location.** `Suggested.lean` line 1: `import Mathlib`.

**Claim.** The gate's targeted build reports the Lake warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" and counts it as `build=1 FAIL`.

**Repair.** Use the header Mathlib itself uses: line 1 `module`, blank line, `public import Mathlib`, the module docstring, then `public section` before the `noncomputable section`/namespace. `module` alone makes every declaration private to importers; `public import` plus `public section` keeps them visible. While touching the docstring, make it say what the brief asks of it: that the roadmap is `README.md`, that this file states the headline theorems against the pinned APIs, and that every headline is statable at the pins (so none is missing).

## R04 (P3) — TeX-only syntax outside a code span at README line 232

**Location.** `README.md` lines 231–232: the display `∫_𝔐 primeExpSum N α ³ e(−Nα) dα = (∑_{q ≤ Q} μ(q) c_q(N)/φ(q)³) · (N²/2) + O(N² (log N)^{−A})` is one backtick span broken over two lines, so the scanner sees `∑_{q ≤ Q}` and `^{−A}` outside a code span (gate: `tex=2`).

**Repair.** Put the whole formula on one line inside one code span, or set it as an indented code block.

## R05 (P3) — three admitted `example`s (gate `sorry-examples=3`, and padding)

**Location.** `Suggested.lean` lines 234, 238, 244.

**Claim.** An admitted example tests nothing; all three mirror README worked examples 1, 3 and 4. The third closes in one tactic: `example (N : ℕ) : ‖∑ n ∈ Finset.Icc 1 N, expTwoPiI (n * 0)‖ = N := by simp [expTwoPiI]` elaborates (probe on a scratch copy against the built module, 0 errors on that declaration).

**Repair.** Delete the `WorkedExamples` section from `Suggested.lean`; the README keeps the three worked examples.

## R06 (P3) — padding: `expTwoPiI_eq_fourierChar` closes in one tactic

**Location.** `Suggested.lean` line 41.

**Claim.** `theorem expTwoPiI_eq_fourierChar (α : ℝ) : expTwoPiI α = (Real.fourierChar α : ℂ)` is the definition-level comparison with `Real.fourierChar_apply` (`Mathlib/Analysis/Complex/Circle.lean` line 234 at the pin: `𝐞 x = Complex.exp (↑(2 * π * x) * Complex.I)`, by `rfl`). On a scratch copy, `by simp [expTwoPiI, Real.fourierChar_apply, mul_comm, mul_left_comm]` closes it (and so does `rw [Real.fourierChar_apply, expTwoPiI]; push_cast; ring_nf`).

**Repair.** Delete it from `Suggested.lean`; the README keeps the comparison as an API bullet of 0.1 and drops the name from the export contract (line 130).

## R07 (P3) — `ψ(x; q, a)` is AnalyticNumberTheoryPartI's object, not this roadmap's

**Location.** `README.md` line 134 (export contract: `psiAP` as a required declaration of Layer 3) and line 189 ("Define `psiAP x q a`"); `Suggested.lean` line 128.

**Claim.** `AnalyticNumberTheoryPartI` at its open head already defines the same object, `TauCetiRoadmap.AnalyticNumberTheoryPartI.psiAP (q : ℕ) (a : ZMod q) (x : ℝ) := ∑ n ∈ (Finset.Ioc 0 ⌊x⌋₊).filter (fun n => (n : ZMod q) = a), vonMangoldt n` (its `Suggested.lean` line 43), and `siegel_walfisz` (line 51) is stated with it. Two roadmaps would own `ψ(x; q, a)`, and 4.9 would have to identify the two definitions before it can apply `siegel_walfisz`.

**Repair.** In "Consumed, not redefined" and the supplier table, say that `ψ(x; q, a)` is `AnalyticNumberTheoryPartI` §0.32's `psiAP`; remove `psiAP` from this roadmap's export contract and reword 3.1 as "with `ψ(x; q, a)` the supplier's `psiAP`". In `Suggested.lean`, keep the local definition only because the supplier is not importable at the pins, say so in its docstring, and give it the supplier's argument order `(q : ℕ) (a : ZMod q) (x : ℝ)` so that the identification in 4.9 is definitional.

## R08 (P3) — no target carries a locator, and the three-primes theorem is not in Iwaniec–Kowalski Chapter 13

**Location.** `README.md` lines 144–247 (every target) and line 300–301 ("Chapter 13 (Vaughan's identity, Theorem 13.6, and the three-primes theorem)").

**Claim.** The targets 1.1, 1.2, 2.1, 3.1, 3.2 and 4.4–4.8 state theorems with exact hypotheses but no theorem number or page at the claim; the References section gives chapters only. The cached table of contents of Iwaniec–Kowalski (sources cache text sha ebcb8686, lines 127–133 and 174–178) places Vaughan's identity at §13.4 p. 344 and exponential sums over primes at §13.5 p. 345, but the three-primes theorem at Chapter 19 "The Goldbach Problem", §19.4 "Proof of Vinogradov's three primes theorem", p. 447.

**Repair.** Put a locator in parentheses at each claim: for 1.1 the type I lemma (Vaughan, *The Hardy–Littlewood Method*, Lemma 2.2, with its page); for 1.2 and 2.1 Iwaniec–Kowalski §13.5 (the theorem number and page of the bound `(N q^{−1/2} + N^{4/5} + (Nq)^{1/2}) (log N)^4`) or Davenport's chapter "An exponential sum formed with primes" with its theorem number; for 3.2 and 4.4–4.8 Iwaniec–Kowalski §19.4 pp. 447–448 or Davenport's chapter "Sums of three primes"; and for the ineffective-threshold form of Vinogradov's theorem, Helfgott, *The ternary Goldbach problem* (arXiv 1501.05438), Chapter 1 p. 4 (helfgott2015 lines 362–371), which records that Vinogradov's 1937 proof gives an undetermined constant `C` with every odd `n > C` a sum of three primes. Correct the Iwaniec–Kowalski reference line to "Chapter 13 §§13.4–13.5 (Vaughan's identity, exponential sums over primes) and Chapter 19 §19.4 (the three-primes theorem)".

## R09 (P3) — shape: definitions without Checks, one `*Needs:*` line per layer, no per-layer Examples/Dependencies

**Location.** `README.md` lines 140–250.

**Claim.** The nine definitions (`expTwoPiI`, `distInt`, `ramanujanSum`, `primeExpSum`, `psiAP`, `SiegelWalfiszBound`, `threePrimeWeight`, `threePrimeCount`, `singularSeries`) carry no `**Checks.**` list; the six global worked examples cover `ramanujanSum` (one), `singularSeries` (one), the geometric sum (two) and `primeExpSum` (one), and `distInt`, `psiAP`, `threePrimeWeight`, `threePrimeCount` have none. Each layer has one `*Needs:*` line for all its targets (line 185 covers 2.1 and 2.2, line 249 covers 4.1–4.9), there is no `### Examples`/`### Dependencies` per layer and no `## Downstream consumers`. Compare `TauCetiRoadmap/CoboundaryExpansion/README.md` and `TauCetiRoadmap/SmoothBundlesConnections/README.md` on main (36 and 33 `**Checks.**` lists, per-target `*Needs:*`, per-layer Examples and Dependencies).

**Repair.** Give each definition at least three discriminating Checks, for instance: `distInt (1/2) = 1/2` (Mathlib's `round` rounds half up to `1`), `distInt (−0.3) = 0.3`, `distInt 7 = 0`; `ψ(x; 1, 0) = ψ(x)`, `ψ(10; 2, 0) = 3 log 2` (the terms `n = 2, 4, 8`), `ψ(x; q, a) ≤ ψ(x)`; `R(5) = 0`, `R(6) = 1`, `R(7) = 3`, `R(9) = 4` (`(2, 2, 5)` in three orders and `(3, 3, 3)`); `r(3) = Λ(1)³ = 0`, `r(6) = (log 2)³` (only `(2, 2, 2)`), `r(7) = 3 (log 2)² log 3` (the three orders of `(2, 2, 3)`); `𝔖(0) = 0`, `𝔖(1) = 2 ∏_{p ≥ 3} (1 + (p − 1)⁻³)`, truncation at `Q = 1` gives `1`. Split each layer's `*Needs:*` by target, and end each layer with `### Examples` and `### Dependencies`; add `## Downstream consumers` (none at present is a fine answer).

## R10 (P3) — Lean names the README never mentions

**Location.** `Suggested.lean` lines 45 (`integral_expTwoPiI_intCast`) and 191 (`integral_geomSum_cube`).

**Claim.** Both statements appear in the README (0.1 orthogonality, 4.5 singular integral) but without these names, so the README does not say which of its statements `Suggested.lean` declares.

**Repair.** Name them in 0.1 and 4.5 and in the export contract, or remove the names from the Lean file (the README keeps the statements).

## R11 (P3) — 2.2: the constant `1` in `∑_{n ≤ N} Λ(n)² ≤ N log N` is not supplied by the cited input

**Location.** `README.md` line 182, with `*Needs:*` line 185 citing `Chebyshev.psi_le_const_mul_self`.

**Claim.** At the pin `Chebyshev.psi_le_const_mul_self` (`Mathlib/NumberTheory/Chebyshev.lean` line 453) gives `ψ x ≤ (log 4 + 4) x`, and `∑ Λ(n)² ≤ log N · ψ(N)` with `ψ(N) ≤ N` is unavailable (`ψ(113) > 113`). The inequality with constant `1` is true as far as I computed (ratio `∑_{n ≤ N} Λ(n)² / (N log N)` at most `0.927`, attained near `N = 926707`, over `2 ≤ N ≤ 10⁶`), but its proof needs `∑ Λ(n)² ≤ ψ(N) log N − ∫₁^N ψ(t)/t dt` with a lower bound on `ψ`, which no target or Needs supplies. 4.3 uses only `≤ C N log N`.

**Repair.** Write `∑_{n ≤ N} Λ(n)² ≤ (log 4 + 4) N log N` (from `vonMangoldt_le_log` and `psi_le_const_mul_self`), or keep constant `1` and add the route and its input.

## Verified sound

**Gate and depcheck.** The worker's gate at fe1154f: `set_option=1`, `tex=2`, `sorry-examples=3`, `build=1` (R02–R05, R03), all other checks 0. Depcheck run by me:

```
depcheck: 236 roadmaps, 2074 edges, 0 problem(s)
```

The merge order lists `CircleMethodThreePrimes` at line 258, directly after `SieveMethodsAndPrimePatterns` (257); `AnalyticNumberTheoryPartI` is at line 83. No UPWARD or CYCLE line. The entry `ExponentialSumsAndCircleMethodPartII` at line 373 of the merge order matches no roadmap on main, on the board index, or in any open pull request, so it raises no ownership conflict.

**Suppliers resolved at their heads.** `SieveMethodsAndPrimePatterns` (pull request #1495, head 5244d2f): §2.4 "Vaughan's decomposition" exists; `TauCetiRoadmap.SieveMethodsAndPrimePatterns.SieveVaughan.vaughan_identity (U V n : ℕ)` at its `Suggested.lean` line 289 states `Λ n = (if n ≤ V then Λ n else 0) + ∑_{b ∣ n, b ≤ U} μ(b) log(n/b) − ∑_{b ∣ n, b ≤ U} μ(b) ∑_{c ∣ n/b, c ≤ V} Λ(c) + ∑_{b ∣ n, U < b} μ(b) ∑_{c ∣ n/b, V < c} Λ(c)`, exactly the README's line 87; the incomplete logarithm `λ_V(n) = ∑_{d ∣ n, V < d} Λ(d)` with `0 ≤ λ_V(n) ≤ log n` and the energy `∑_{ℓ ∈ Ioc(L, M)} λ_V(ℓ)² ≤ (M − L)(log M)²` are stated in §2.4 as the README's lines 88–89 say. `AnalyticNumberTheoryPartI` (pull request #1126): §0.32 "Siegel–Walfisz theorem" exists; `siegel_walfisz (A B : ℝ) (hA : 0 < A) (hB : 0 < B) : ∃ C > 0, ∀ᶠ x in atTop, ∀ q : ℕ, 0 < q → (q : ℝ) ≤ Real.log x ^ B → ∀ a : ZMod q, IsUnit a → |psiAP q a x − x / q.totient| ≤ C * x * Real.log x ^ (−A)` (its `Suggested.lean` line 51) is the README's line 95 verbatim in content; §1.2 "Davenport uniform Möbius exponential cancellation" exists and its named interfaces (`mobius_type_I_bound`, `mobius_type_II_bound`) are Möbius-specialised, so this roadmap's arbitrary-coefficient type I/II bounds (1.1, 1.2) are not stated there. The 4.9 adapter from the eventual statement to all `x ≥ 2` is sound: on `2 ≤ x ≤ x₀` one has `|ψ(x; q, a) − x/φ(q)| ≤ ψ(x) + x ≤ (log 4 + 5) x ≤ (log 4 + 5)(log x₀)^A · x (log x)^{−A}`. `ImaginaryQuadraticClassNumber` is on main, `ContourIntegration` under `Completed/`, `ZerosOfLFunctions` is open pull request #253; all three are named only as non-owners, never as `*Needs:*`.

**Mathlib at the pin (f6090c70).** `Real.fourierChar : AddChar ℝ Circle` with `toFun z := Circle.exp (2 * π * z)` and `fourierChar_apply : 𝐞 x = Complex.exp (↑(2 * π * x) * Complex.I)` (`Analysis/Complex/Circle.lean` 221, 234); `Chebyshev.psi x = ∑ n ∈ Ioc 0 ⌊x⌋₊, Λ n` (`NumberTheory/Chebyshev.lean` 70), the Pinned cutoff; `psi_le_const_mul_self : 0 ≤ x → ψ x ≤ (log 4 + 4) * x` (line 453); `Real.exists_int_int_abs_mul_sub_le (ξ : ℝ) {n : ℕ} (0 < n)` (`NumberTheory/DiophantineApproximation/Basic.lean` 93); `sum_mul_eq_sub_sub_integral_mul` (`NumberTheory/AbelSummation.lean` 129); `ArithmeticFunction.vonMangoldt` (`NumberTheory/ArithmeticFunction/VonMangoldt.lean` 65) with `vonMangoldt_nonneg` (80) and `vonMangoldt_le_log` (151); `HasProd (f : β → α) (a : α) (L := unconditional β)` (`Topology/Algebra/InfiniteSum/Defs.lean` 106); `Nat.Primes` (`Data/Nat/Prime/Defs.lean` 438); `abs_sub_round : |x − round x| ≤ 1/2` (`Algebra/Order/Round.lean` 193). Mathlib has no Ramanujan sum (the only matches for "Ramanujan" are the modular-form formula, the `Derivative` file and the Chudnovsky `π` file), no additive character `e(α)` as a `ℂ`-valued function beyond `fourierChar`, and no circle-method material, so Layer 0.2 and Layers 1–4 are owned here. Ownership against the 458 open pull requests (index of 2026-11-05) was checked with `roadmaps grep` for "Ramanujan sum", "three primes", "Vinogradov's theorem", "circle method", "singular series" and "Goldbach": the only hits outside this folder are Kloosterman-sum Checks in `CharacterSumsOverFiniteFields` (`S(m, 0; 12)` values), sieve upper bounds for Goldbach and Chen's theorem in `SieveMethodsAndPrimePatterns` (different objects), and a Browning–Sawin reference in `AlgebraicTopologyPartII`.

**Signatures.** All 29 declarations of `Suggested.lean` were elaborated with `#check @name` from a scratch importer of the built module (5 s); each elaborated type matches its README statement, no section binder is lost (no `variable` block is used), and `#print axioms vinogradov_threePrimes_unconditional` gives `propext, sorryAx, Classical.choice, Quot.sound`. Generality matches in both directions: README 2.1 and Lean `norm_primeExpSum_le` both take `N ≥ 2`, `q ≥ 1`, `gcd(a, q) = 1`, `|α − a/q| ≤ q⁻²`, with `C` absolute; README 3.2 and `primeExpSum_majorArc` both quantify `C` after `A, B` and before `N, q, a, β`; README 4.7 and `threePrimeWeight_asymptotic` both take `N ≥ 2`.

**Adversarial table.** One row per statement, with the values computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `distInt α = |α − round α|` | `α = 1/2, −0.3, 7` | `round (1/2) = 1`, distance `1/2`; `0.3`; `0` | correct nearest-integer distance, half rounds up harmlessly | none |
| 0.1 geometric bound `‖∑_{1}^{N} e(nβ)‖ ≤ if ‖β‖ = 0 then N else min(N, 1/(2‖β‖))` | `β = 0, N = 5`; `β = 1/2, N = 5`; `N = 0` | LHS `5`, RHS `5`; LHS `|−1+1−1+1−1| = 1`, RHS `min(5, 1) = 1`; LHS `0`, RHS `0` | holds, including the `if` branch at integers (with Lean's `1/0 = 0` the RHS at `β = 0` would be `0`) | none |
| 0.1 orthogonality `∫₀¹ e(mα) dα = 1_{m = 0}` | `m = 0, 1, −2` | `1`; `(e(1) − 1)/(2πi) = 0`; `0` | holds | none |
| 0.2 `c_q(n) = ∑_{d ∣ (q, n)} d μ(q/d)` | `q = 4, n = 2`; `q = 1`; `q = 6, n = 0` | `e(1/2) + e(3/2) = −2` vs `1·μ(4) + 2·μ(2) = 0 − 2 = −2` (numerically `−2 + 5·10⁻¹⁶ i`); `1 = μ(1)`; `φ(6) = 2` vs `1·μ(6) + 2μ(3) + 3μ(2) + 6μ(1) = 1 − 2 − 3 + 6 = 2` | holds | none |
| 0.2 `|c_q(n)| ≤ gcd(n, q)`, `c_{p^k}(n) = 0` for `k ≥ 2, p ∤ n` | `q = 4, n = 2`; `q = 4, n = 1`; `q = 9, n = 1` | `2 ≤ 2`; `c_4(1) = μ(4) = 0`; `c_9(1) = 0` | holds (`c_q(n) = μ(q/g) φ(q)/φ(q/g)` and `φ(q) ≤ g φ(q/g)`) | none |
| 0.2 multiplicativity in `q` | `q₁ = 2, q₂ = 3, n = 1`; `q₁ = 0, q₂ = 1` | `c_6(1) = μ(6) = 1 = (−1)(−1)`; `c_0 = 0 = 0·c_1` | holds, including the junk modulus `0` (empty `range`) | none |
| 1.1 type I bound | `q > M X` (large `q`); `q = 1, α = 0` | LHS `≤ X ∑ 1/m ≤ X(1 + log M)`, RHS `≥ C q log 2`; `α = 0` puts every `‖mα‖ = 0` so LHS `= X ∑ 1/m ≤ X(1 + log M)` vs `C(X + M + 1) log(2M)` | holds for `C ≥ 2` in both regimes; the `if` branch is what makes `α = 0` true | none |
| 1.2 type II bound | `M = N` (empty inner sums); `q > N` | LHS `0`; LHS `≤ ‖a‖₂‖b‖₂ √M √(N/M) = √N ‖a‖₂‖b‖₂ ≤ √q ‖a‖₂‖b‖₂` | holds trivially off the main range | none |
| 2.1 Vinogradov bound, the `N q^{−1/2}` term | `α = 1/2`, `N = 100` | `S(1/2) = ∑ Λ(n)(−1)ⁿ = −85.7275`; `−ψ(100) + 2 log 2 · ⌊log₂ 100⌋ = −85.7275` (worked example 6 recomputed) | the term is needed; bound `≥ C N/√2 (log N)⁴` covers it | none |
| 2.1 at `q > N` | `q = 2N` | trivial `|S| ≤ ψ(N) ≤ (log 4 + 4) N ≤ (log 4 + 4)(Nq)^{1/2}` | holds with the existential `C` | none |
| 2.2 Parseval `∫₀¹ |S|² = ∑ Λ(n)²` and `≤ N log N` | `N = 2`; `2 ≤ N ≤ 10⁶` | `(log 2)² = 0.480 ≤ 2 log 2 = 1.386`; max ratio `0.927` at `N = 926707`, no violation | equality by orthogonality; the constant-`1` bound is true on the range but unsupplied | R11 |
| 3.1 non-coprime prime powers | `q = 1`; `q = 6, x = 10` | difference `0 ≤ 0`; terms `n = 2, 3, 4, 8, 9` give `3 log 2 + 2 log 3 = 4.28 ≤ log 6 · log 10 / log 2 = 5.95` | holds (`∑_{p ∣ q} ⌊log x/log p⌋ log p ≤ ω(q) log x ≤ log q log x / log 2`) | none |
| 3.2 major-arc form from `SiegelWalfiszBound` at `t ∈ [√N, N]` with `(A + B, B + 1)` | `q ≤ (log N)^B` | `(log N)^B ≤ (2 log t)^B ≤ (log t)^{B+1}` once `log t ≥ 2^B`; error `φ(q) · C t (log t)^{−A−B} ≤ 2^{A+B} C N (log N)^{−A}`; 3.1 adds `O((log N)²)`; Abel summation in `β` costs the factor `1 + 2π|β|N` | holds; constants quantified before `N, q, a, β` | none |
| 4.1 `r(N) = ∫₀¹ S³ e(−Nα)` and `threePrimeWeight` body | `N = 6`; `N = 3`; `N = 2` | `r(6) = Λ(2)³ = (log 2)³` (only `(2, 2, 2)`); `r(3) = Λ(1)³ = 0`; `r(2) = 0` (no `n₁ + n₂ < 2` with `n_i ≥ 1`) | the guard `n₁ + n₂ < N` makes the natural subtraction exact | none |
| 4.2 disjointness and minor-arc approximation | `Q = 10, N = 201`; `α = Q/N` | overlap of `𝔐(10, 1)`, `𝔐(9, 1)`; Dirichlet may return `0/1` | false as stated | R01 |
| 4.3 minor-arc bounds | `Q < q ≤ N/Q` | `N q^{−1/2} ≤ N Q^{−1/2}`, `(Nq)^{1/2} ≤ N Q^{−1/2}`, `N^{4/5} ≤ N Q^{−1/2}` for `N` large; times `(log N)⁴` gives `N (log N)^{4 − B/2}`; `∫_𝔪 |S|³ ≤ sup |S| · ∫₀¹ |S|² ≤ C N² (log N)^{5 − B/2}` | holds | none |
| 4.4 term bound `|μ(q) c_q(N)| / φ(q)³ ≤ φ(q)⁻²` | squarefree `q`, `g = gcd(q, N)` | `c_q(N) = μ(q/g) φ(g)`, `φ(g) ≤ φ(q)` | holds; `∑ φ(q)⁻² < ∞` by `φ(q) ≥ c q^{3/4}` | none |
| 4.4 Euler factor | `p ∣ N`; `p ∤ N`; `p = 2`, `N` odd | `1 + μ(p) c_p(N)/(p − 1)³ = 1 − (p − 1)/(p − 1)³ = 1 − (p − 1)⁻²`; `1 + (p − 1)⁻³`; factor `2` | matches `singularSeries_hasProd` | none |
| 4.4 `𝔖(N) = 0` for even `N`, including `N = 0` | `N = 0` | factor at `2` is `1 − 1 = 0`; `∑_q μ(q) φ(q)/φ(q)³ = ∏_p (1 − (p − 1)⁻²) = 0`; `HasProd` to `0` holds since partial products containing `p = 2` vanish | consistent on both sides | none |
| 4.4 lower bound on odd `N`, negative `N` | `N = 1`; `N = −3` | `𝔖(1) = 2 ∏_{p ≥ 3}(1 + (p − 1)⁻³) > 0`; `c_q(−N) = c_q(N)` so `𝔖(−3) = 𝔖(3)` | `c = 2 ∏_{p ≥ 3}(1 − (p − 1)⁻²) > 0` works for all odd `N : ℤ` | none |
| 4.4 truncation `|∑_{q ≤ Q} − 𝔖| ≤ C Q^{−1/2}` | tail | `∑_{q > Q} φ(q)⁻² ≤ c⁻² ∑_{q > Q} q^{−3/2} ≤ 2c⁻² Q^{−1/2}` | holds | none |
| 4.5 `∫₀¹ T³ e(−Nβ) = (N − 1)(N − 2)/2` with natural subtraction | `N = 1, 2, 3, 5` | counts `0, 0, 1, 6`; `(0·0)/2, (1·0)/2, (2·1)/2, (4·3)/2 = 0, 0, 1, 6` (the Lean `ℕ` expression; at `N = 0` it gives `0` too) | holds; indexing from `0` would give `21 = binom(7, 2)` at `N = 5` | none |
| 4.5 tail `∫_{Q/N < |β| ≤ 1/2} |T|³ ≤ C N² Q⁻²` | | `2 ∫_{Q/N}^{1/2} (2β)⁻³ dβ ≤ N²/(8 Q²)` | holds | none |
| 4.6 major-arc integral | per arc, `≤ Q²` arcs | error per arc `≪ N² · ∫_{|β| ≤ Q/N} (1 + |β| N) dβ · N (log N)^{−A'} ≪ N² Q² (log N)^{−A'}`; total `N² (log N)^{4B − A'}`; `A' = A + 4B` gives `N² (log N)^{−A}`; main term `∑_{q ≤ Q} μ(q) c_q(−N)/φ(q)³ · (N²/2 + O(N² Q⁻² + N))` with `c_q(−N) = c_q(N)` | holds | none |
| 4.7 choice of `B` | `B = 2A + 10` | minor arcs `(log N)^{5 − B/2} = (log N)^{−A − 5}`, truncation `(log N)^{−B/2} = (log N)^{−A − 5}` | holds | none |
| 4.8 prime powers and weights | proper prime powers `≤ N` | `O(√N)` of them, each contributes `≤ log N · ∑ Λ Λ ≤ log N · N (log N)²`, total `O(N^{3/2} (log N)³)`; triples with a prime `≤ N^{1−ε}` number `O(N^{2−ε})` | `R(N)(log N)³/N² − ½𝔖(N) → 0` over all `N` (even `N`: `R(N) ≤ 3π(N)` since a sum of three odd primes is odd, and `𝔖(N) = 0`) | none |
| 4.9 adapter | `2 ≤ x ≤ x₀` | `|ψ(x; q, a) − x/φ(q)| ≤ (log 4 + 5) x ≤ (log 4 + 5)(log x₀)^A x (log x)^{−A}` | holds | none |
| `SiegelWalfiszBound` at `q = 1` | `a = 0 : ZMod 1` (a unit), `φ(1) = 1` | `|ψ(x) − x| ≤ C x (log x)^{−A}` | the prime number theorem with logarithmic saving, part of the supplier's statement | none |
| `threePrimeCount` | `N = 5, 6, 7, 9` | `0, 1, 3, 4` ordered triples | the filter `p₁ + p₂ < N ∧ (N − p₁ − p₂).Prime` is exact | none |

**Headline theorems.** From the README: Vinogradov's three-primes theorem (stated unconditionally as `vinogradov_threePrimes_unconditional`), the weighted asymptotic `r(N) = ½𝔖(N)N² + O_A(N² (log N)^{−A})` (`threePrimeWeight_asymptotic`), the count asymptotic (`threePrimeCount_asymptotic`), Vinogradov's minor-arc bound (`norm_primeExpSum_le`), the major-arc approximation (`primeExpSum_majorArc`), the Euler product and bounds of the singular series. All are statable at the pins and all are stated; the conditional forms with `hSW : SiegelWalfiszBound` compose with `siegelWalfiszBound` exactly as line 225 does for the three-primes theorem, so no headline is weakened. One-tactic probes on a scratch copy against the built module (`simp`, `norm_num`, `rw; push_cast; ring_nf`) closed only `expTwoPiI_eq_fourierChar` (R06) and the `n * 0` example (R05); `ramanujanSum 4 2 = −2`, `singularSeries_eq_zero_of_even`, Parseval and the geometric-sum bound did not close.

**Policy.** No pull-request numbers, no `lemma`, no `#eval`, no sorry'd data (every `def` has a real body), no edit outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty), `metadata.toml` has `topic = "math.NT"`. No source passage is copied. The "Prior work" section names an external Lean repository as a cited source with its author's agreement, which is the repository README's porting rule.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, 3rd ed. (Springer): not open and not in the sources cache; the chapter range "24–26" and the theorem numbers for Vinogradov's bound and the three-primes theorem were not checked.
- Vaughan, *The Hardy–Littlewood Method*, 2nd ed. (CUP): not open and not in the cache; "Lemma 2.2" for the type I sum was not checked.
- Iwaniec–Kowalski, *Analytic Number Theory*: only the table of contents is in the cache (an institutional catalogue excerpt); the section and page numbers above come from it, but "Theorem 13.6" could not be matched to a statement.
- Vinogradov, Dokl. Akad. Nauk SSSR 15 (1937): not online; the content of the theorem (ineffective threshold) was taken from Helfgott's description (helfgott2015 lines 362–371).
- Vaughan, C. R. Acad. Sci. Paris 285 (1977): not open; it appears only as bibliography item [Va] in Kowalski's exponential-sums excerpt (sources cache sha b4c346a8 line 3049).

## Source issues

- none
