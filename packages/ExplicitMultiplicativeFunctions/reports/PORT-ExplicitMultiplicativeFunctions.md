# PORT-ExplicitMultiplicativeFunctions: port report

Branch `roadmap/explicit-multiplicative-functions`, head commit
`fa74009e36a9d9822562f2f5ba38d87a151fe9be` (one commit on `eaf17b1`), adding only
`TauCetiRoadmap/ExplicitMultiplicativeFunctions/{README.md,Suggested.lean,metadata.toml}`.

## Build and gate

- `lake build TauCetiRoadmap.ExplicitMultiplicativeFunctions.Suggested`:
  `Build completed successfully (18650 jobs).` with **13 warnings, all `declaration uses
  'sorry'`** (one per headline theorem), no error, no other message.
- Gate on the committed branch:
  `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`), full output:

      depcheck: 240 roadmaps, 2435 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. Suppliers named: Mathlib, Tau Ceti, ZerosOfLFunctions (main),
  AnalyticNumberTheoryPartI, SieveMethodsAndPrimePatterns, ExplicitZetaBounds,
  ExplicitPrimeCounting, all earlier in the merge order.

## Draft pull request body

This roadmap builds the numerically explicit layer of multiplicative number theory on Mathlib's
`ArithmeticFunction`: explicit bounds with stated constants and thresholds for the summatory
functions of the Möbius function `M(x)`, `m(x) = Σ μ(n)/n` and `m̌(x) = Σ μ(n) log(x/n)/n` (with
coprimality restrictions and character twists), the conversion theorems that produce those
numbers (Meissel's, MacLeod's and Balazard's identities, Ramaré's transfer from explicit prime
estimates to Möbius estimates, the comparison theorem of the convolution method, an explicit
Levin–Fainleib theorem), explicit upper bounds for averages of nonnegative multiplicative
functions (Hall–Tenenbaum, Daboussi–Rivat, van Lint–Richert), the explicit averages of `μ²`,
`μ²/φ`, `τ`, `τ_k`, `τ²`, `2^ω` and `φ`, explicit Mertens products, and the pointwise maximal
orders of `ω`, `τ_k`, `σ` and `n/φ(n)` (Robin, Nicolas–Robin, Rosser–Schoenfeld). Every result is
proved once in a general form whose analytic inputs (a Chebyshev bound of a given shape, a Möbius
table, a finite verification) are explicit hypotheses, so the published constants are instances
and no statement depends on another roadmap's final constants; every finite computation a source
relies on is a named proposition. It is the consumer of ExplicitPrimeCounting's explicit prime
estimates and the supplier of the pointwise and average bounds that explicit class-number,
character-sum and sieve work needs. `Suggested.lean` states the thirteen headline theorems
(Ramaré's 2013 instance of the transfer, Tao's `|m_S(x)| ≤ 1`, Balazard's inequality, Ramaré's
`m̌` bound, the comparison theorem for a general exponent, the Dirichlet-divisor model with
constant `γ² − 2γ₁`, Hall–Tenenbaum, the Rosser–Schoenfeld and Axler Mertens products, and the
four pointwise bounds) with the six finite-verification propositions and seven carriers they
need.

## Roadmaps this one depends on that are still pull requests

- AnalyticNumberTheoryPartI (open roadmap pull request; §§0.8, 0.11, 0.19, 0.21, 0.26, 0.34, 3.1,
  3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a, 3.35, 3.35a and its declarations `divisorError`,
  `BBRFiniteInput`, `landau_siegel_exclusion`, all checked at its head).
- SieveMethodsAndPrimePatterns (open roadmap pull request; §0.5 *HasLogSieveDimension*, §1.1
  Selberg denominator in dimension `κ`, checked at its head).
- ExplicitPrimeCounting and ExplicitZetaBounds are earlier in the merge order but not yet on main
  or in a pull request: every ExplicitPrimeCounting section cited (§§1.1, 1.3, 1.6, 1.7, 3.1, 3.2,
  3.3, 3.5, 4.2, 4.3, 4.7, 5.3, 6.1, 6.3) was checked against the board package
  `packages/ExplicitPrimeCounting/README.md` (its present numbering; each cited statement is there:
  `RH(H)`, `ButheVerified` `0.94 √x` on `(11, 10¹⁹]`, *EulerGammaEnclosure*,
  *MeisselMertensEnclosure*, *RealZeroGap*/*LuZamanZhaoSweep*/*BanksGap*, *BKLNWPsiTable*,
  `1.03883` and `θ(x) > x(1 − 1/(2 log x))` from `563`, Dusart's `0.006409` from `e²²`,
  `π(x) > x/log x` from `17`, `0.0067/log x` from `1.52·10⁶`, Vanlalngaia's `1/log³ x` from
  `24 284` and Axler's `f(x)` from `1 757 126 630 797`, the RH Mertens sums from `24.4` with the
  product forms left to this roadmap, `p_k ≥ k(log k + log log k − 1)`, the Ramaré–Rumely row
  `(1, 0.000213, 10¹⁰)`, Bennett–Martin–O'Bryant–Rechnitzer). ExplicitZetaBounds is cited only for
  the supplier gap `gap:zeta-reciprocal-bounds`. The citation resolver's one lead
  ("ExplicitPrimeCounting §§1.1: no roadmap ExplicitPrimeCounting on main or in an open pull
  request") is this board-stage status, not a broken citation.

Overlaps (`roadmaps overlaps`): no other open pull request changes this roadmap, no cited id is
dropped by an open revision, and none of this roadmap's ids is cited elsewhere.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the form (one docstring, single `import
Mathlib` plus `TauCeti.NumberTheory.LFunctions.Mertens`, no `set_option`, no sorry'd data, no
section variables, only definitions a headline needs, thirteen headline theorems, every
headline of the Summary that is statable at the pins stated). The only Lean change is the value
in field (iii) of `RamareTransferComputations` and its docstring (below). The `module` header
line was kept (the gate accepts it; 30 roadmaps on main use it).

Mechanical `#check`: a temporary block of `#check @name` for all 26 declarations was appended,
elaborated once with the build command, compared with the README statements, and removed. All 26
match their README statements (no binder lost; the sums parse as `(∑ …) − …`); nothing changed
except field (iii). A second temporary block checked all 82 backticked Mathlib names of the README
and the three `TauCeti.LFunctions` names at the pins (all elaborate); the other Tau Ceti names
(`TauCeti.sum_Icc_rpow_mul_eq`, `TauCeti.tendsto_rpow_inv_mul_sum_Icc_rpow_mul`, the four
`TauCeti.summatory_…`/`tsum_…` Abel lemmas, `TauCeti.sigma_le_rpow_mul_tsum`, the three
`TauCeti.IdealArithmeticFunction` names, `Nat.primeCounting_nth_prime`,
`Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop`) were found in the pinned
sources with those namespaces. `TauCeti.LFunctions.mertensConstant` is defined over
`HeightOneSpectrum` (nonzero primes), so at `K = ℚ` it is the Meissel–Mertens constant the
hypotheses assume.

## Supplier replacements and duplication removals

No new removal was needed. Sweep by object on main, at the heads of the open roadmap pull
requests and in the board packages: no other roadmap owns the real-argument Möbius summatory
functions, the Selberg remainder, the first Stieltjes constant, superior highly composite
numbers, Balazard's or Tao's bounds, Hall–Tenenbaum, the explicit Mertens products or the
explicit maximal orders. Recorded in "Scope and ownership" (Not owned here), with how this
roadmap's statement differs:

- SieveMethodsAndPrimePatterns §1.1 states the ordered-divisor majorants
  `Σ_{n ≤ Z} τ_k(n) ≤ Z(1 + log Z)^{k−1}`; Layer 7.5's Bordellès bound has `γ + 1/x` in place of
  `1` (smaller for `x > 2.365`).
- AnalyticNumberTheoryPartI §§3.7 and 3.11 state the qualitative maximal orders of `τ` and
  `n/φ(n)`; Layer 9 gives the explicit forms. (§3.23a's route uses `|Δ(u)| ≤ 0.475 √u` from `4033`
  internally; Layer 7.4 owns the named rows `0.961`, `0.482`, `0.397`, as the README already said.)
- ProbabilisticAndMetricNumberTheory §3.7 (later in the merge order) states the Rankin-type bound
  `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x}(f(p) − 1)/p)` as its own target; it is the instance of this
  roadmap's 6.1, so the owner is this roadmap and that roadmap should cite 6.1. The Downstream
  consumers entry now names its §3.7. That roadmap's file was not edited (outside this job).

Ownership against open pull requests was checked for every sibling checkout the brief lists that
is close in vocabulary (AnalyticNumberTheoryPartI via `roadmaps show`, SieveMethodsAndPrimePatterns,
ProbabilisticAndMetricNumberTheory and Part II, CircleMethodThreePrimes, ErdosProgressionPowers by
grep): no further overlap.

## Fixes made as an upstream reviewer (README and Lean)

1. **Field (iii) of `RamareTransferComputations` was false (P1).** The package stated, after
   `ramare2013aa` line 565 (Lemma 6.4), `∫_1^{10⁸} (ψ(t) − t) dt/t = −129.559 + O*(0.01)`. The
   integral is `−147.7678`: computed as `Σ_{p^k ≤ 10⁸} log p · log(10⁸/p^k) − (10⁸ − 1)` (sieve to
   `10⁸`, long double, compensated sum) and independently by integrating the step function `ψ`
   over every `[n, n + 1)` (both `−147.767767`; at `10⁶` both and a pure-Python sum give
   `−16.392527`). With the printed value the hypothesis `hR` of `abs_moebiusSum_le_ramare` was
   false and the headline vacuous. Now `|∫ + 147.768| ≤ 0.01` in Lean and in 0.7; the route's
   `I₀` is `147.778`; a Check records the printed value as a negative control. The value enters
   the analytic argument only as `I₀/D ≤ 6.4·10⁻¹¹` at `D ≥ 2.31·10¹²`, so Theorem 1.1 and every
   constant downstream are unchanged.
2. **`H̄(−1/3)` enclosure inconsistent (P2).** 0.7 said `H̄(−1/3) ≤ 251.08`, 7.3 used `≤ 251.07`.
   Computed: `H̄(−1/3) = 251.013` (product over primes to `10⁹` plus the prime-density tail),
   `u = 0.37869503`, so `1.641 H̄/u = 1087.71`; with `251.07` the constant is `1087.96 ≤ 1088`,
   with `251.08` it is `1088.006 > 1088`. 0.7 now says `251.07`.
3. 0.7 said "the four" propositions declared in `Suggested.lean` and listed six: now "six".
4. 0.7's general sentence "monotone in its range and antitone in its constant" contradicted the
   stated laws (`MoebiusTableVerified c H` antitone in `H`, monotone in `c`): restated as antitone
   in the range, monotone in the constant, with a second instance.
5. 4.1, Check at `q = 4`: the garbled "`4/3 − 1/5·…`" replaced by the partial sums `1`, `4/3`,
   `17/15` with the signs `μ(3)χ(3) = 1`, `μ(5)χ(5) = −1` (recomputed).
6. "uncertified" was used 50 times without definition: Conventions now defines it (cited by its
   published locator only), matching the usage of FlagVarieties on main; "not all legible in the
   certified text" (Scope, Nicolas' Théorème 3) reworded without process wording.
7. Scope: the applications line now says ExplicitCharacterSumsAndSieves and ExplicitZetaBounds use
   this roadmap only in their Part II (both precede it), consistent with Downstream consumers.
8. Summary: the Ramaré instance "for `D ≥ 1 078 853`" now says analytic from `2 161 205`, direct
   verification below, matching the Lean statement and the Conventions' conjunction rule.

## Adversarial pass (computed)

C sieves (long double) to `10⁸` (`1.1·10⁸` for `R₂*`), Python for tables; values computed on both
ends of every unit interval or prime gap where the function is a step function.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `RamareTransferComputations` (iii) | `∫_1^{10⁸}`; `10⁶`, `10⁷` | `−147.767767` (two methods); `−16.392527`, `−5.703187` | printed `−129.559` false | value corrected (Lean, 0.7, 1.5, Check) |
| (i) first clause | every integer `3 ≤ D ≤ 1.1·10⁸` | max `|R₂*|/(1.80 √D log D) = 0.75878` at `36 917 058` | holds | none |
| (iv) | `K = 462 848` | `161.64332 + 0.01702 = 161.66035 ≤ 162.45955` | holds | none |
| (v) | `D₀ = 2 161 205` | `M = −466`, `M₂ = −98 403.0549`, value `−3.485180`; `3.48` fails, `3.49` holds | holds | none |
| (vi) | integers of `[2 161 205, 8 613 000]` | max ratio `0.998055` at `2 161 205` | holds | none |
| (vii) | both ends, `[1 514 928, 3 430 190]` | max ratio `0.999778` at `1 514 928` | holds | none |
| `R₂*` values | `D = 1, 2, 3, 4, 10, 30` | `1.1544, 1.8284, 1.7759, 2.4499, 5.0664, 0.5688` | as README | none |
| `hψ₁` | `[1, 10⁸]` | max `ψ(x)/x = 1.03882058` at `113` | holds | none |
| `hψ₂` | both ends, `[1500, 10⁸]` | max `|ψ − x|/(0.8√x) = 0.938628` at `36 917 098` | holds | none |
| `hψ₅` | both ends, `[1.4·10⁶, 10⁸]` | last failure on `[1 514 844, 1 514 845)`; max ratio from `1.52·10⁶`: `0.860` | holds | none |
| `hM` (`0.571`) | integers `[33, 10⁸]`; `31`, `32` | max `0.567105` at `199`; `M(31) = M(32) = −4` (`0.7184`, `0.7071`) | holds; `33` needed | none |
| `h4345` | `[2 160 535, 10⁸]` | max ratio `0.999505` at `2 160 535`; `|M(2 160 534)| = 498` | holds, threshold exact | none |
| Ramaré conclusion | integers `≥ 1 078 000` to `10⁸` | last failure `1 078 852` (`|M| = 350 > 349.915`) | holds from `1 078 853` | none |
| `hQ` (`0.7√x`) | both ends, `[1, 10⁸]` | max `0.679090` at `3` | holds | none |
| `hQ'` (`1.166`) | integers `[1, 10⁸]` | max `1.165457` at `3` | holds | none |
| `hΔ` (`0.961`) | both ends, `[1, 10⁸]` | max `0.960695` at `12` | holds | none |
| `sum_tau_div_model` | `[1, 10⁷]` (17 points per interval); `(0, 1)` | max `0.654185` as `t → 2⁻`; `sup |P| t^{1/3} = 1.6408192` at `u = 7.21631` | both forms hold | none |
| `StieltjesGammaOneEnclosure` | Euler–Maclaurin at `N = 2000`, 5 terms | `−0.07281584548367672486058637587490131913771…` | agrees to `10⁻⁴⁰` | none |
| `abs_moebiusDivSum_le_balazard` | 41 points per `[N, N+1)`, `N ≤ 3000` | max(lhs − rhs) `= −0.001717` | holds | none |
| `abs_moebiusLogSum_sub_one_le` | same | max(lhs − rhs) `= −0.002476` | holds | none |
| `mertens_product_explicit` hyp. | both ends, `[24 000, 10⁸]` | last failure `[24 283, 24 284)`; max ratio `0.99944` at `24 284` | holds | none |
| RS Theorems 7–8 (conclusion) | both ends of every prime gap `≤ 10⁸` | no violation in either pair | holds | none |
| `mertens_product_axler` hyp. | right ends, `(1, 10⁸]` | min margin `1.22·10⁻⁵` at `93 798 766` | holds | none |
| Axler conclusion | right ends, `[392 687, 10⁸]` | max `(Q − 1) log³ x = −0.0091` | holds | none |
| `hθ` | `[563, 10⁸]` | no violation | holds | none |
| `hp` (`p_k` lower) | `p_k ≤ 10⁷` | no violation | holds | none |
| `PrimorialTableVerified 26` | `k = 3…26` | max `1.38401274` at `k = 9`; `1.31885` at `26` | holds | none |
| `PrimorialTotientTableVerified 24284` | `p_k < 24 284` | max `2.5063692797` at `k = 9` | holds (margin `7·10⁻⁷`) | none |
| `SuperiorTableVerified 2 0.1950 0.3466 1.538` | all 15 maximisers over the interval (ties included) | max `f₂ = 1.5379399` at `6 983 776 800` | holds; `1.5379` fails | none |
| 9.1 step | `27 ≤ k ≤ π(10⁷)` | `θ(p_k) ≥ k(log k + log log k − 1.25)` everywhere; true deficit max `1.07687 k` at `66` | holds | none |
| four pointwise headlines | `3 ≤ n ≤ 2·10⁶` | max ratios `0.99120` (`ω`, `510 510`), `0.99337` (`τ`, `1 441 440`), `0.99987` (`σ`, `12`), `0.98496` (`n/φ`, `30 030`) | hold | none |
| 7.3 constant | product to `10⁹` + tail | `H̄(−1/3) = 251.013`, `u = 0.378695`, `1087.71`; `251.08 → 1088.006` | 0.7 inconsistent | `251.07` |
| 4.1 examples | `q = 3, 4, 5` | `L(1, χ₃) = 0.60460`, bound `4.962`; `L(1, χ₄) = 0.785398`; `|L(1, χ₅)| = 0.888576`, bound `4.3085` | as README | garbled Check fixed |
| Layer 1 Checks | `M` at 5, 13, 30, 199, 684, 685, 1000, 1109, 1118, 10⁴, 10⁵, 142 193/4, 617 972/3, 10⁶, 1 078 852/3, 2 160 534/5, 10⁷ | `−2, −3, −3, −8, −12, −11, 2, −15, −14, −23, −48, −123/−122, −262/−261, 212, 350/349, −498/−497, 1037`; `max |M| − x/80 = 5.5125` at `199` | as README | none |
| 1.5 arithmetic | `ρ₄`, `ρ(D)` terms, absorption | `0.0049231`; `0.000941 + 0.000913 + 0.0065 + 0.009846 + 0.000213 = 0.0184 ≤ 0.0213`; `2α D₁/log² D₁ = 264.11`; `462 848 × 2 160 535 = 999 999 303 680` | as README | none |

The package report's pass (sources, degenerate cases, generality of 5.1, the 7.1 counterexample
at `351 115`, etc.) was not redone where the statements did not change.

## Unresolved

- Field (ii) of `RamareTransferComputations` (`|R₂*(D)| ≤ 0.0213 D` on `[1.8·10⁹, 2.31·10¹²]`) and
  the second clause of field (i) (`1.93 √D log D` on `[1.1·10⁸, 1.8·10⁹]`) are beyond what was
  computed here; (ii) is a verification no source performed. At `1.8·10⁹` field (i) gives
  `|R₂*| ≤ 1.75·10⁶` against `0.0213 D = 3.8·10⁷`, so (ii) is very likely true, but unverified.
- 9.3: `sigma_one_div_lt_robin` is stated with no hypothesis, and the README's route names no
  finite verification or prime input for it (the source, `robin1984`, is uncertified and not
  available here), unlike the other three pointwise headlines. The statement is true (Robin 1984;
  checked here on `[3, 2·10⁶]`); pinning its inputs needs the source.
- The `0.8 √x` clause of `gap:psi-initial-range` (`hψ₂`) is checked here only to `10⁸`; the
  source's range is `10¹⁰`.
- ExplicitPrimeCounting and ExplicitZetaBounds are read from the board; if their numbering changes
  before they reach a pull request, the cited sections must be rechecked.

No `review.json` exists in the package; the accepted review is
`reports/REV-DESIGN-ExplicitMultiplicativeFunctions.md`, whose decisions the package report applied
(its one open note, F17, was done at packaging). No fetched text, review or roadmap contained
instructions; nothing suspicious to quote.


Pull request: #1946 (roadmap/explicit-multiplicative-functions at fa74009)
