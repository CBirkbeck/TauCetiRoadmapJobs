# Review of ExplicitPrimeCounting (pull request #1945 at f4317fd)

**Verdict:** needs changes

Five findings: one P1, three P2 and one P3.

- **R01 (P1).** *RecordGapBound* `(1.1817, 3, 58 837)` is false, so the Axler 2016 item of §7.4, which assumes it, is vacuous.
- **R02 (P2).** §7.5 omits Cully-Hugill–Johnston's prime between consecutive `140`-th powers, although its route is §7.5's own route on §7.5's own inputs. The Not-owned bullet excludes it with a reason that applies only to `k = 90` and to the preprints.
- **R03 (P2).** §7.5 states `c_{9.7} = 33.217`, but its own Check computes `33.219`, so the statement claims a range its route does not reach.
- **R04 (P2).** Six of Treviño's eight rows (§4.5) take their lower `θ`-bound from Schoenfeld's Corollary 2*, which no section states.
- **R05 (P3).** `ClassicalZeroFreeRegion` and *ZeroCountBound* restate the predicates of ExplicitZetaBounds §§7.3a and 5.2a without citing them.

The mechanical checks pass:

- The gate gives every check `0` ("OK").
- The dependency check reports 0 problems.
- `Suggested.lean` elaborates with exactly 15 `sorry` warnings and nothing else.
- No theorem closes in one tactic.
- All three findings of review 11 are repaired.

## Status of review 11's findings

- **R01 (§7.5 without the explicit formula and its hypotheses): repaired.**
  - Lines 4262–4266 now read: "Each statement of this section is proved from the truncated explicit formula of §2.1, applied at `x` and at `x + h`, and holds under that section's hypotheses". The list that follows includes the `5.5666305` region, Ford's region and *PsiThetaUpper*.
  - The Needs line (lines 4367–4374) now lists `gap:classical-zero-free-constants` and §3.7.
  - Lines 4291–4293 say that the real-`x` form is this route's, while the sources state it at half odd integers.
  - The repair took a different route from the one I proposed. Instead of pointwise `ψ − θ` inputs, it uses Mathlib's `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log` and shows that the error saving exceeds `2 √(x + h) log(x + h)`. I checked that argument against the texts:
    - Cully-Hugill's error is `K G(x, h)/T`, with `G` at `cully-hugill-2021` line 566. Per unit of `x log x/T` and per endpoint it is at least `K log log x`: `84.29` against `6.431` for cubes, and `29.46` against `0.6651` for `m = 155`.
    - Dudek's error is `4(x + h) log²(x + h)/T` (`dudek-2016` line 626). The saving is `1.09·10⁴` times `2 √(x + h) log(x + h)` at `x = e⁴⁰`, `T = x^{3/8}`.
    - In both sources the `ψ − θ` terms subtract a positive quantity (`dudek-2016` line 639; `cully-hugill-2021` line 646).
  - The Check that the repair added on Dudek's threshold gives rise to R03.
- **R02 (inputs of the `n⁹⁰`, `n⁸⁶` and Visser items): repaired by cutting them.**
  - The three items now sit under Not owned here (lines 233–245).
  - Their stated reason is that `C₂(3/5)` is printed nowhere. I verified it: `johnston-yang-2023` Table 3 starts at `σ = 0.980` (lines 1052–1073).
  - The bullet, however, cuts "every `k` below the `155`", which is wider than its reason covers. This gives rise to R02.
- **R03 (two AnalyticNumberTheoryPartI Lean names): repaired.**
  - Lines 433–435 and 1047–1048 now cite, in prose, the level-one identity and the sum over the classes.
  - At `979e68c`, AnalyticNumberTheoryPartI §0.2 states both: "`θ(x;0,1)=Chebyshev.theta x`", and that summing over all residue classes gives `Chebyshev.theta x`.

## R01 (P1) — *RecordGapBound* `(1.1817, 3, 58 837)` is false; the Axler 2016 item of §7.4 is vacuous

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- Line 1454: "`p⁺ − p ≤ c p/log^k p` for consecutive primes with `p⁺ ≥ P`".
- Line 1456, the instance "`(1.1817, 3, 58 837)`".
- Lines 4240–4243: "under the tables of §3.7 and *RecordGapBound* at `(1.1817, 3, 58 837)` … Route: the *RecordGapBound* instance up to `4·10¹⁸`".

**Claim.**

- The proposition fails at the prime `58 831`. Its successor `58 889` satisfies `p⁺ ≥ 58 837`, but the gap `58` exceeds `1.1817 · 58 831/log³ 58 831 = 52.483`.
- A theorem with a false hypothesis is vacuous. Here the theorem is Axler's prime in `(x, x(1 + 1.1817/log³ x)]` for `x ≥ 58 837`.
- The theorem itself is true. Axler handles the range `58 837 ≤ x < 58 889` separately, and the gap condition is needed only from `p = 58 889` on.

**Witness.** `axler-2016` lines 354–364: the source checks the gap bound "for every π(58889) ≤ n ≤ π(2898239) + 1". It then treats `58 837 ≤ x < 58 889` directly, where `π(x) = 5949`. The prime 58 831 is followed by 58 889 (trial division).

**Repair.**

1. In line 1456 and line 4241, replace the instance by *RecordGapBound* `(1.1817, 3, 58 890)`.
2. Add to the route of the Axler 2016 item: "for `58 837 ≤ x < 58 889` the prime `58 889` lies in the interval, since `58 837 (1 + 1.1817/log³ 58 837) = 58 889.49` and `x(1 + 1.1817/log³ x)` increases (`axler-2016` lines 361–364)".

**Tested.**

- With `P = 58 890` the prime 58 831 no longer qualifies (`p⁺ = 58 889 < P`).
- A sieve to `10⁸` finds no other prime that violates any of the seven instances.
- Above `10⁸`, I checked each record of `oliveira-e-silva-herzog-pardi-2014` Table 8 at the least prime it governs. The instance `(1.1817, 3, ·)` keeps a least relative margin of `84.9`.

## R02 (P2) — §7.5 omits Cully-Hugill–Johnston's `n¹⁴⁰`, whose route and inputs are §7.5's own

**Location.** README lines 233–236: "Primes between consecutive `k`-th powers for every `n ≥ 1` with `k` below the `155` of §7.5: Cully-Hugill–Johnston's `k = 90` …". Line 245: "None of them is stated here."

**Claim.**

- The bullet's reason concerns `k = 90` (CHJ's sequel: an averaged formula, and the unprinted `C₂(3/5)`) and the preprints. It does not cover `k = 140`.
- `cully-hugill-johnston-2021`, the paper whose Theorem 1.2 is §2.1's formula, proves its Theorem 1.3 (`k = 140`) from:
  - that formula at Table 4's row `(10³, 1/100, 1.80, 0.6651)`;
  - Cully-Hugill's `F(x)` (*CullyHugillDensity* at `σ₁ = 0.6`);
  - the region `ν` of its §3, which is `RH(3·10¹²)` with the classical, Ford and Vinogradov–Korobov regions;
  - Cully-Hugill–Lee's rows at `4·10¹⁸` and `e⁶⁰⁰`.
- These are exactly the inputs of §7.5's `155` item. So §7.5 states less than its own sources support.

**Witness.**

- `cully-hugill-johnston-2021` lines 95–96 (Theorem 1.3) and lines 920–926: "`µ = 0.0080155` … (6.2) hold for all log x ≥ 4242 … verify … log(4·10¹⁸) ≤ log x ≤ 4367".
- Lines 370–376 give the region `ν`.

**Repair.**

1. Add to §7.5, beside Cully-Hugill's `155` (which is kept), the following item:

   > Cully-Hugill–Johnston (`cully-hugill-johnston-2021` lines 95–96, Theorem 1.3; lines 902–926), under the inputs of the `155` item at the row `(10³, 1/100, 1.80, 0.6651)`: there is a prime in `(n¹⁴⁰, (n + 1)¹⁴⁰)` for every `n ≥ 1`.

   Its route:
   - the common route at `T = x^{0.0080155}`, from `log x ≥ 4243`;
   - the rows `x₀ = 4·10¹⁸` and `log x₀ = 600` of *CullyHugillLeeTable*, on `4·10¹⁸ ≤ x ≤ e^{3139.2}` and `e⁶⁰⁰ ≤ x ≤ e^{4367.1}`;
   - below `4·10¹⁸`, only `n = 1`, and `2 ∈ (1, 2¹⁴⁰)`.

   The threshold is `4243` rather than the source's `4242` for this reason. At `log x = 4242` the error term `2M log x/(m x^{µ − 1/m})` equals `0.9947`, and it falls by `6.3·10⁻⁴` per unit of `log x`. That is far more than the `2 √(x + h) log(x + h)/h < e^{−2000}` that the common route's Mathlib `ψ − θ` bound costs in place of the source's (8)–(9). With those source bounds (Costa Pereira's comparison in Mathlib and *PsiThetaUpper*), `4242` itself stands.
2. Change line 233 to "with `k` below `140`".
3. Name `140` in the docstring item of `Suggested.lean` (lines 82–86).
4. Add the coverage to the Checks.

**Tested.**

- Coverage: `140 log(140(Δ − 1))` is `3139.25` at `Δ = 3.90970·10⁷` and `4367.18` at `Δ = 2.51949·10¹¹`. The latter is `≥ 4243`.
- At `log x = 4243`, `T = e^{34.01}` lies in `(4243, e^{41.74})`.
- `2¹⁴⁰ = 1.39·10⁴² > 4·10¹⁸`.

## R03 (P2) — §7.5: `c_{9.7} = 33.217` contradicts the section's own Check

**Location.** README:

- Line 4303: "and `c_{9.7} = 33.217`, where (24) is the later of the two to hold".
- Line 4308: "the threshold `exp(exp(33.217))` is therefore stated only under the hypothesis with `A = 9.7`".

**Claim.**

- `c_A` is defined as the threshold from which (24) and (25) both hold.
- The Check at lines 4384–4387 computes that (24) holds only from `y = 8.01·10¹⁴`, so `c_{9.7} = 33.219`.
- The identity at line 4303 is therefore false by the roadmap's own definition. The statement claims `8·10¹⁴ ≤ log x < 8.0127·10¹⁴`, where the route does not apply.
- The Conventions (lines 252–255) require such a statement to start at the least point where it holds.

**Witness.** Take (24) with `(log y)^{1/3}` dividing, as the bound at `dudek-2016` line 754 requires, and `A = 9.7`, `c = 57.54`, `k = 0.9359`.

- At `y = 8·10¹⁴` the left side exceeds the right by `0.0387`.
- The root is `y = 8.0127·10¹⁴`, so `log(y/3) = 33.2186`.
- (25) holds from `7.705·10¹⁴`.

**Repair.**

- At line 4303, write `c_{9.7} = 33.219`, with the note: (`log(8.0127·10¹⁴/3) = 33.2186`; the arXiv text prints `33.217 = log(8·10¹⁴/3)`, where (24) fails, and the journal prints `33.3`).
- At line 4308, write `exp(exp(33.219))`.
- At line 4399, write `3 e^{33.219}`.

**Tested.** At `y = 3e^{33.219} = 8.0159·10¹⁴`, (24) gives left minus right `= −0.0096 < 0`, and (25) holds. At `A = 965`, (24) holds from `9.626·10¹⁴`. So `c_{965} = 33.402 > c_{9.7}`, consistent with line 4311.

## R04 (P2) — §4.5: Treviño's rows take Schoenfeld's Corollary 2*, which no section states

**Location.** README lines 3316–3318: "The rows of Table 1 … are the instances at the rows of Table 2 …, under *TrevinoTables* and the `θ`-bounds of §§3.2–3.3 at the rows' thresholds."

**Claim.**

- Six rows of Table 2, at `a = 315 437, 468 577, 486 377, 644 123, 678 407, 758 231`, use `k₂ = 1/29, 1/35, 1/37, 1/39, 1/40, 1/41`. That is the bound `θ(x) > x − x/(c log x)` for `x ≥ d`, Schoenfeld's Corollary 2*.
- Neither §3.2 nor §3.3 states it. The README contains no "Corollary 2*" and no such bound.
- These six instances therefore rest on an input that no layer provides. The upper bound `0.0201384` is (5.6a*), which is in §3.2.

**Witness.** `trevino-2012` lines 496–501 give the `k₂` column. `schoenfeld-1976` lines 1229–1233 give (9.8) with the pairs `(41, 758 231)`, `(40, 678 407)`, `(39, 644 123)`, `(37, 486 377)`, `(35, 468 577)`, `(29, 315 437)`.

**Repair.**

1. Add to §3.2: "Schoenfeld's Corollary 2* (`schoenfeld-1976` lines 1229–1240, (9.8)): `x − x/(c log x) < θ(x)` for `x ≥ d` at the pairs above".
2. State its route:
   - for `x > 758 711` it follows from (5.6*), since `0.0239922 < 1/41 = 0.0243902`;
   - on `[d, 758 711]` it is a finite-range proposition of §1.3, which the source checks with the tables of Appel–Rosser, Lehmer and Rosser–Walker (lines 1226–1228).
3. Cite it in §4.5.

**Tested.** I sieved to `10⁷` and checked `θ(p⁻) − (p − p/(c log p))` at every prime. The least margins are `0.052` (`c = 29`, `p = 315 449`), `1.50` (`35`), `8.62` (`37`), `0.773` (`39`), `3.43` (`40`) and `4.41` (`41`). There is no failure.

## R05 (P3) — Two ExplicitZetaBounds predicates restated without citation

**Location.**

- `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` lines 161–164, `def ClassicalZeroFreeRegion (R t₀ : ℝ)`, and README line 2083.
- README lines 2289–2290: "Define *ZeroCountBound* `a₁ a₂ a₃ a₄ T₀` (a zero input) as: for every `T ≥ T₀`, `|N(T) − M(T)| ≤ a₁ log T + a₂ log log T + a₃ + a₄/T`".

**Claim.**

- ExplicitZetaBounds, which is earlier in the order of supply, defines both predicates:
  - §7.3a *ClassicalZeroFreeRegion* `R t₀`, with the same body, its monotonicity and its instances;
  - §5.2a `ZetaZeroCountBound κ a₁ a₂ a₃ a₄ T₀`. *ZeroCountBound* is its case `κ = 7/8`, since `M(T) = (T/2π) log(T/(2πe)) + 7/8`.
- Neither predicate is cited. The module docstring of `Suggested.lean` names only `RiemannHypothesisUpTo` and the three records as copies.

**Witness.**

- ExplicitZetaBounds at `11dd87b`, §7.3a: "Define *ClassicalZeroFreeRegion* `R t₀` … every `s` with `riemannZeta s = 0` and `|Im s| ≥ t₀` has `Re s < 1 − 1/(R log |Im s|)`".
- Its `Suggested.lean`, line 503: `def ZetaZeroCountBound (κ a₁ a₂ a₃ a₄ T₀ : ℝ)`.

**Repair.**

- In the `Suggested.lean` docstrings (module docstring, lines 17–19, and lines 161–162), say that `ClassicalZeroFreeRegion` is the predicate of ExplicitZetaBounds §7.3a, copied verbatim.
- Add §§7.3a and 5.2a to Consumed, not redefined (lines 162–172) and to the ExplicitZetaBounds contract.
- At line 2289, write: "Write *ZeroCountBound* `a₁ a₂ a₃ a₄ T₀` for ExplicitZetaBounds §5.2a's `ZetaZeroCountBound (7/8) a₁ a₂ a₃ a₄ T₀`; its instances at Trudgian's and Platt–Trudgian's triples are the zero inputs owned here". Adjust lines 85–86 to match.

**Tested.** The two bodies coincide clause by clause. `(T/2π) log(T/2π) − T/2π + 7/8 = (T/2π) log(T/(2πe)) + 7/8`. The supplier's §5.2a lists Trudgian's triple only without the `7/8` (constant `3.385`) and has no Platt–Trudgian triple, so those two remain zero inputs here.

## Verified sound

### Gate, dependency check, build, signatures and probe

- **Gate**, rerun at `f4317fd`: every check `0`, "OK", exit 0. The worker's run also shows `build=0`. The diff outside the folder is empty.
- **Dependency check:** `depcheck: 230 roadmaps, 2322 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Merge order:** LFunctions 27, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ExplicitZetaBounds 267, **ExplicitPrimeCounting 269**.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings and nothing else, exit 0.
- **Signatures:**
  - A scratch copy with `#check @name` for all 41 declarations (15 theorems, 26 definitions) elaborates with no error.
  - There is no `variable` block.
  - Each elaborated type matches its README statement; I made no change. For example, `leeNosal_theta_of_riemannHypothesis` keeps `t ^ ((1 : ℝ) / 3)` as a real power. `lamzouri_li_soundararajan` excludes `s = 1` only for `χ = 1`.
- **One-tactic probe:**
  - With `simp`, `rfl`, `norm_num`, `infer_instance`, `positivity` and `intros; linarith`, all 15 theorems fail.
  - With `exact?`, 7 report "could not close the goal" and 8 hit the heartbeat limit.
  - Every one of the 26 definitions occurs in a theorem statement.
- **Headline coverage:**
  - Every end theorem of README lines 32–60 is either stated or named in the docstring.
  - The docstring names Rosser–Schoenfeld, Broadbent–Kadiri–Lumley–Ng–Wilk, Fiori–Kadiri–Swidinsky and Bennett–Martin–O'Bryant–Rechnitzer, with what they lack (table propositions).

### Adversarial table

Values come from these computations:

- double precision;
- sieves to `10⁸` (gaps, intervals, Robin) and to `10⁷` (Vanlalngaia, Axler, Corollary 2*, least primes), with step functions tested at both one-sided limits;
- the series of `li`;
- Table 8 of `oliveira-e-silva-herzog-pardi-2014`, parsed from the text, with every `p` and `p + g` confirmed prime (Miller–Rabin).

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | `k = 1`, `x = 1.5`, `y = 2` | 2 primes in `(1.5, 3.5]` ≤ `4/log 2 = 5.771` | holds | none |
| `brun_titchmarsh`, `y = k` | `k = 1`, `(1.5, 2.5]` | Lean right side `2/(1 · 0) = 0` < count `1` | `y > k` needed (Check) | none |
| `MVDiagonalFiniteRange` | `u ∈ [6, 2·10⁶)` | least `S(⌊u⌋) − log u = 1.1141` (at `u → 10⁻`) ≥ `1.07`; `S(6) − log 6 = 1.458` | holds | none |
| `BrunTitchmarshFiniteRange` | every `25 ≤ n ≤ 3000`, then every 13th to `2·10⁴` | tightest `n = 25`, `Q = 3`: `15.5105 ≤ 15.5334`; `n = 26`: `15.9141 ≤ 15.9602` | holds | none |
| §0.1 Abel summation | `Q = √(2N/3)` | `(3/2)qQ/N = q/Q`; `NL = (log 6 + 1.07)/(1 + 6/Q) + log(1 + 6/Q) + log(Q/12)`; `6/Q = 9Q/N = 7.348/√N`; `c(20 001) = 0.0760` | as stated | none |
| §0.1 large `t` | `N = 20 001` | `4018.6 ≤ 2(N − 1)/log(N − 1) = 4038.98` | holds | none |
| §0.1 Büthe constant | primes `2, 3, 5, 7` | `0.65647 > 0.656`; `0.5 + 0.656 − 58/√10⁹ = 1.1542 ≥ 1.15` | holds | none |
| §0.3b adapter | `x = 2` | `π(2) = 1`; a strict cutoff gives `0` | holds | none |
| §0.4 identity | `x = 2` | `(log 2 − 2)/log 2 + 2/log 2 = 1 = π(2) − Li 2` | holds | none |
| §0.4 general weight | `f = 1/t` | `∫₂ˣ dt/(t log t) = log log x − log log 2`, so `B = L_f − log log 2` | holds | none |
| §0.7 identity | `x = 1` | left side `−C(q, a) + 1/φ(q) = −∫₁^∞ E/t²` | holds | none |
| §0.7 tail | `ε = η/log² t` | `∫ₓ^∞ η/(t log² t) dt = η/log x` | holds | none |
| §1.4 *MaximalGapTable* | Table 8 | 75 rows; first `(2,1),(3,2),(7,4),(23,6),(89,8)`; last `(…669, 1442)`, `(…411, 1476)`; `log²(4·10¹⁸) = 1834.65` | as stated | none |
| *RecordGapBound* `(1.1817, 3, 58 837)` | `p = 58 831` | `p⁺ = 58 889 ≥ 58 837`; gap `58 > 52.483` | false | R01 |
| other gap propositions | all `p ≤ 10⁸`; Table 8 above | no failure; `AxlerGapBound` tightest `210 ≤ 211.84` (at `20 831 323`); least relative margins above `10⁸`: `11.07` (Trudgian), `2.54` (Axler), `0.651` (`(1/5000, 2, 10⁹)`: `282 ≤ 465.7`) | holds | none |
| record-pair interval lemma | cases `p′ < p`, `p′ = p` | `p′⁺ ≤ p′ + g′ < x + g`; `x = p` gives `x + g` | holds | none |
| §1.7 passage to a modulus | `χ₋₃` modulo `6` | `log 6 > log 3`: weaker | holds | none |
| `leeNosal_of_riemannHypothesis` | `ButheVerified` switch | `L(L − log L) = 23.6247` at `337.09` vs `8π · 0.94 = 23.6248` | holds | none |
| `leeNosal_theta_of_riemannHypothesis` | switch | `49.008` at `3381.6` vs `8π · 1.95 = 49.009` | holds | none |
| Lee–Nosal 1.1 vs 1.2 | `L = 30 369.58` | `(3/8π) log L + 1.465 log L/L = 1.23200 + 0.00050 = 1.2325` | holds | none |
| zero-count branches | `L = 20.455`; `L = 55.46` | `0.143L − 0.443 log L − 1.588 = −0.00001`; both branches `15.5288` | holds | none |
| printed vs used branch | `T ≥ e` | difference `0.00304 L + 0.0127 log L + 0.409 > 0` | holds | none |
| second `ψ` bound | `x = 11` | factor `1.5691 > 0.94`; `|ψ(11) − 11| = 0.770` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `129.1`; `3834`; `3/2 < x < 2` | `log² x = 23.62 = 8π · 0.94`; `2.70903 < 2.70920`; `π = 0 < li(1.5) = 0.125` | holds | none |
| §2.6 instance | `T = 3·10¹² + 1 + π/3` | `π/(T − 1) + π²/(3T²) − π/A = −(π²/A³)(2/3 + π/9) < 0`; `C_T = 115.096 − 1.427 = 113.669` | holds | none |
| §2.6 zero count | `T = 10`, `9.6`, `22` | `0.6678 < 0.67`; `1.5279 ≥ 1.5083`; `3.5014 ≥ 3.3864` | holds | none |
| §2.6 Check | `T = 10⁷` | `π²/(3T²) = 3.29·10⁻¹⁴` | holds | none |
| `dusart_nth_prime_lower` | `p_k ≤ 10⁸`; `k = 3` | `RobinNthPrimeRange`: no failure (least margin `4.15`, `k = 4`); Robin's `θ(p₃) = 3.401 ≥ −5.02` | holds | none |
| `vanlalngaia_sum_inv_prime` | `x ≤ 10⁷`, both limits | least margins `9.4·10⁻⁴` (`4`), `1.44·10⁻⁴` at `1327` (`2.3`), `6.4·10⁻⁵` at `24 421` (`1`) | holds | none |
| `axler_primeCounting_upper` | primes in `[48, 10⁷]` | denominator `0.05356` at `48`, right side `896 > 15`; least margin `8.69` at `1627` | holds | none |
| `lamzouri_li_soundararajan` | `3 < q ≤ 2000` | tightest `q = 4`: least primes `5`, `3` vs `7.687` | holds | none |
| §6.5 elementary bounds | `20 000 < q ≤ 3·10⁶` | least `φ(q) = 4320` (`q = 20 790`) ≥ `4156`; `φ(q) ≥ q^{5/6}` and `2^{ω(q)} ≤ q^{3/7}` never fail | holds | none |
| §6.5 discriminant | `q = 1`, `2` | `−0.347 ≤ 0 ≤ 0`; `0 ≤ 0 ≤ log 2` | holds | none |
| §6.5 Bach–Sorenson form | `q = 2`, `3` | `3 < 3.84`; `7 < 21.72` | holds | none |
| §6.1 Checks | `q = 6`, `|γ| = 10⁴` | `0.014263`, `0.013022`, `0.010829`; `R log(1000/C₁) = 52.853` | holds | none |
| §6.6 Check | `q = 10⁵` | `0.013363` vs `0.013497` | holds | none |
| `schoenfeld_interval` | `x = e³⁰`; left end | `4.348·10⁸ > 1.961·10⁸`; `2 010 881 < 2 010 881.05`; no failure to `10⁸` | holds | none |
| `trudgian_interval` | `2 898 241`, `2 898 242` | `2 898 358.93 < 2 898 359 ≤ 2 898 359.93` | `2 898 242` right | none |
| `axler_interval` | left end | `17 051 887 ≤ 17 051 887.73`; range no failure | holds | none |
| §7.5 Dudek `c_A` | `A = 9.7`, `1`, `965` | (24) from `8.0127·10¹⁴`, `7.291·10¹⁴`, `9.626·10¹⁴`; (25) from `7.705·10¹⁴` | `33.217` false | R03 |
| §7.5 comparison | cubes, `m = 155`, Dudek | `84.29 > 6.431`; `29.46 > 0.6651`; ratio `1.09·10⁴` | holds | none |
| §7.5 coverage, `m = 155` | both rows | `155 log(155(Δ − 1)) = 3491.37`, `4850.87 ≥ 4810` | holds | none |
| §7.5 Check, parity | `x = 7.5` | `7.5 + 3 · 7.5^{2/3} = 18.9946` | as stated | none |
| omitted `m = 140` | both rows | `3139.25`, `4367.18 ≥ 4242` | statable, absent | R02 |
| Schoenfeld Cor. 2* (Treviño's `k₂`) | six pairs, to `10⁷` | least margins `0.052` … `8.62` | true, unstated | R04 |
| `ClassicalZeroFreeRegion`, *ZeroCountBound* | bodies | identical to ExplicitZetaBounds §§7.3a, 5.2a (`κ = 7/8`) | duplicated | R05 |

### Library declarations at the pins

- **Elaborated:** 88 names cited in the README, in one scratch file, with no error. Among them:
  - all `Chebyshev.*` names of the contracts, including `abs_psi_sub_theta_le_sqrt_mul_log`, `psi_sub_theta_le_psi_add_psi_add_psi` and `psi_sub_theta_ge_psi_add_psi_add_psi`;
  - `IsCyclotomicExtension.Rat.natAbs_discr`, `Rat.HeightOneSpectrum.primesEquiv`;
  - `TauCeti.Real.logIntegral_eq_div_log_sub_add`, `TauCeti.primeCount_sub_mul_logIntegral_eq`, `TauCeti.primeCount_univ_isEquivalent_div_log`;
  - `TauCeti.LFunctions.mertensConstant`.
- **Read at the source** (modules not built):
  - `Nat.primeCounting_nth_prime`: `TauCeti/NumberTheory/PrimeCounting.lean:90`;
  - `Nat.primesLE_eq_image_nth`: same file, `:70`;
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`: `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`;
  - `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`: `TauCeti/Analysis/Contour/Cycle/Residue.lean:138`, namespace at line 83.
- **Not in either pin:** a lemma `Nat.nth Nat.Prime n ∼ n log n` (grep). So §0.3b owns it.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds (`11dd87b`):**
  - §0.2: `RiemannHypothesisUpTo` and `DirichletGRHUpTo`, its `Suggested.lean` lines 103 and 109.
  - §0.3: `LFunction_ne_zero_of_platt`, line 136.
  - §0.4b: the records. `HiaryRecord`, `PatelRecord` and `YangRecord` (lines 167, 174, 182) agree token for token with the copies here, up to `Complex.I`.
  - §3.4 (Delange), §5.2, §5.2a, §5.4 (Lehman's form and Brent–Platt–Trudgian's), §6.1 (free cut-off, matching contract lines 523–529), §6.3a, §6.5.
  - §7.2: Ford's region in the `log 0.618` form, which needs only `RH(545 439 823)` from `5.45·10⁸` on.
  - §7.3a, §7.5, §7.6 (`57.54`), §7.9 (*HasLandauSiegelGap*), §8.3, §8.3a (*ZetaZeroDensityBound*).
  - Its Not owned here, lines 165–200, leaves Liu–Wang, Ramaré's revised density and `0.28 log T` to this roadmap.
- **AnalyticNumberTheoryPartI (`979e68c`):**
  - §§0.2, 0.3, 0.5, 0.7, 0.8, 0.11d, 0.16, 0.19–0.21, 0.25, 0.26a, 0.30, 0.32, 0.34, 1.5a, 1.6 and 1.9.
  - The names `quadratic_real_zero_le_of_bmor`, `BMORFiniteInput`, `BMORClassNumberInput`, the four finite inputs, `log_floor_factorial_eq_sum_vonMangoldt`, `mertens_vonMangoldt_eulerGamma`, `siegel_walfisz`, `psi_sub_self_isBigO_of_riemannHypothesis`, `psiAP_isBigO_of_dirichletGRH`, and `psiAP`, `primeCountAP`, `thetaAP` (its `Suggested.lean` lines 164, 168, 172).
- **SieveMethodsAndPrimePatterns (`06aae1f`):**
  - §2.9, the forbidden-residue large sieve.
  - §3.1 `SieveDistribution.primeCountAP (x : ℝ) (q a : ℕ)`, inclusive (its `Suggested.lean` line 394). Its README states `primeCountAP(5,0,5)=1`, as the §0.6 Check uses.
- **On main:**
  - ZerosOfLFunctions §§4.1, 4.5, 5.6, 6.2–6.4, 7.4; §8.3 `chebyshevPsi_explicitFormula`; §8.4 `riemannZeta_weilExplicitFormula`; §8.5 `primeIdealCount_effective`; §§8.6, 8.7 (*rayClassPsi*, `primeCounting_progression_effective`); §8.9; Layer 9 *AllOnCriticalLine*.
  - LFunctions `dirichletData`.
  - ClassFieldTheory Layer 13: heading at line 1799, the conductor–discriminant formula at line 1839.
  - ClassicalArithmeticCompletion §6.34 `dyadicPrimeCount`.
- **Consumers:** EffectiveClassNumbers, ExplicitNumberFields, ExplicitMultiplicativeFunctions and ExplicitCharacterSumsAndSieves cite §§0.1, 0.3, 0.3b, 1.1, 1.3, 1.6, 1.7, 2.2, 3.1–3.3, 4.2, 4.3, 4.7, 5.3, 6.1, 6.3 and 7.4. All of these exist, and none cites the items cut from §7.5. ExplicitZetaBounds names this roadmap only in its Not owned here and Downstream consumers.

### Ownership and gaps

- **Ownership:** I searched main and the open heads for primes between consecutive powers, Cully-Hugill–Johnston, Brun–Titchmarsh and the zero-count predicates.
  - No second owner exists for §2.1's truncated formula, the powers results or `brun_titchmarsh`. ExplicitZetaBounds uses Cully-Hugill–Johnston only for its Perron formulas, §§6.1–6.2. ExplicitNumberFields owns Debaene's Chebotarev form, which is a different object.
  - The search turned up R05.
- **Gaps:**
  - The nine slugs that the README uses match `plan.json`, and each contract names an existing ExplicitZetaBounds section.
  - `plan.json` also lists three slugs that the README no longer uses: `explicit-brun-titchmarsh` (supplier `none`), `lehman-weighted-zero-sum` and `dirichlet-four-zero-region`.
    - The first is §0.1's own `brun_titchmarsh`.
    - The second is consumed as ExplicitZetaBounds §5.4 by section.
    - The third is replaced by the zero input *LiuWangFourZeros*, which ExplicitZetaBounds leaves to this roadmap (its lines 165–168).
  - No statement depends on these three slugs, and a package cannot remove plan entries.

### Sampled locators read against the text

- **§0.1:** `tmeemt-art14` lines 82–87; `montgomery-1978` lines 377–388, 482–497, 515–528; `buthe-2014` lines 65–66, 139–148, 462–469.
- **§0.3b:** the Tau Ceti and Mathlib names above.
- **§0.4:** `rosser-schoenfeld-1962` line 460, (4.17); `schoenfeld-1976` lines 98–102; `trudgian-2016` lines 120–125.
- **§0.7:** `ramare-rumely-1996` line 67.
- **§1.4:** `oliveira-e-silva-herzog-pardi-2014` lines 1795–1821; `carneiro-milinovich-soundararajan-2019` lines 269–273.
- **§1.7:** ExplicitZetaBounds §§0.3, 7.9.
- **§2.2:** `schoenfeld-1976` lines 20–28, 98–100.
- **§2.6:** the arithmetic only (preprint).
- **§3.2:** `rosser-schoenfeld-1962` lines 244–255, 305–310, 328, 341–342, 349–357; `schoenfeld-1976` lines 201–206, 729–733, 767–772.
- **§4.5:** `trevino-2012` lines 466–510; `schoenfeld-1976` lines 1229–1240 (R04).
- **§5.3:** `robin-1983` lines 59–66, 81–84; `dusart-1999-mc` lines 26–34, 112–128, 164–170; `schoenfeld-1976` lines 772, 1280–1283.
- **§6.1:** `ramare-rumely-1996` lines 58–65, 846; `dusart-2002` lines 100–112, 700–707, 989–1022; `mccurley-1984` lines 54–66, 120–132.
- **§6.5:** `bach-sorenson-1996` lines 802–811, 921–937.
- **§6.6:** `kadiri-2008` lines 100–165, 327–343.
- **§7.4:**
  - `trudgian-2016` lines 229–236;
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 1669, 1672, 1727;
  - `axler-2016` lines 51–54, 354–364 (R01).
- **§7.5 and §2.1:**
  - `dudek-2016` lines 63, 115–125, 619–828;
  - `cully-hugill-2021` lines 23–28, 95–200, 540–566, 599–687;
  - `cully-hugill-johnston-2021` lines 83–96, 370–376, 884–926, 1064–1074;
  - `cully-hugill-lee-2022` lines 638–652;
  - `johnston-yang-2023` lines 1049–1073.
- **Flags:** the README flags no locator as unverified.

## Not verifiable

These are recorded as uncertified or waived in the manifest, and are cited by locator only:

- `montgomery-vaughan-1973`, read through `tmeemt-art14` lines 82–87;
- `lee-nosal-2026` (§2.2);
- `chirre-helfgott-2025` (§2.6), whose arithmetic I recomputed;
- `lamzouri-li-soundararajan-2015` (§6.5), whose finite range I tested to `q = 2000`;
- `massias-robin-1996`, whose ranges I read through `dusart-1999-mc` lines 30–32;
- `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`: the claims of the Not-owned bullet about them;
- `ramare-saouter-2003`, `dusart-2018`, `axler-2018`, `axler-2024`;
- `lu-zaman-zhao-2026`, `banks-2026`, `platt-2016`;
- `cipolla-1902` (waived);
- `mertens-1874`: image-only and already in the worker's needs file. No sampled target depends on it.

## Source issues

- **Error** in dudek-2016 at §3.3, (24) and the sentence after it, pp. 20–21 (lines 796–828): the source says (24) and (25) both hold for `y > 8·10¹⁴`, giving `exp(exp(33.217))`; it should be `y ≥ 8.0127·10¹⁴`, threshold `exp(exp(33.2186))`, with `(log y)^{1/3}` dividing as line 754 derives; affects a stated result.
- **Misprint** in cully-hugill-johnston-2021 at Theorem 1.2, p. 2 (lines 92–93): the source says admissible triples `(40, 1/2, 5.03)` and `(10³, 1/100, 0.5597)`; it should agree with its Table 4 (lines 1067, 1073), which gives `M = 6.431` and `0.6651` there; affects nothing.
- **Misprint** in cully-hugill-2021 at §4, p. 14 (line 683): the source says (21) holds for all `log x ≥ e^{4810}`; it should read `x ≥ e^{4810}`, as the next sentence's range up to `e^{4850}` requires; affects nothing.
- **Error** in trudgian-2016 at Corollary 2, p. 7 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`; it should start at `2 898 242`; affects a stated result.
