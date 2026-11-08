# Review of ExplicitPrimeCounting (pull request #1945 at 3630d41)

**Verdict:** needs changes

Five findings: three P2 and two P3. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with `sorry` as its only warning. All seven findings of the previous review are repaired (table under Verified sound). R01 and R02 are new instances of the class the previous R01 fixed: a zero input of one source attributed to a supplier section that does not state it.

## R01 (P2) — Cully-Hugill–Lee's density at height 3·10¹² is cited to a section that fixes H₀ = 3.06·10¹⁰

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 3622–3624 (§7.3): "the density bounds of Kadiri–Lumley–Ng's shape for `N°(σ, T)` with the closed forms recomputed at the height `3·10¹²` (`cully-hugill-lee-2022` lines 157–166; ExplicitZetaBounds §8.3, `gap:explicit-zero-density`)". The contract at line 447 asks only "given `RH(H₀)` with `H₀ = 3.0610046·10¹⁰`".

**Claim.** No supplier states this input. ExplicitZetaBounds §8.3 (head `3e44c3f`) is Kadiri–Lumley–Ng's Theorem 1.1 at the fixed height `H₀ = 3.0610046·10¹⁰`, with `H ∈ [1002, H₀)` and `k ≥ 10⁹/H₀`. The source states it only at that height (`kadiri-lumley-ng-2018` lines 24–25, 74–76 and 461). Cully-Hugill–Lee re-evaluate (4.72)–(4.73) at Platt–Trudgian's height `3·10¹²`, which is a different instance. The README already treats Johnston–Yang's recomputation at `3·10¹²` as a zero input of its own (line 2119: "not ExplicitZetaBounds §8.3's closed forms at any parameters"), but it does not do the same here.

**Witness.** ExplicitZetaBounds README lines 2346–2352: "Let `H₀ = 3.0610046·10¹⁰` … Given `RH(H₀)`, prove: for every `T ≥ H₀`". `cully-hugill-lee-2022` lines 164–166: the constants are recalculated "with Platt and Trudgian's Riemann height H … we use these constants".

**Repair.** Choose one:

- Widen `gap:explicit-zero-density` to Kadiri–Lumley–Ng's theorem for every `H₀ ≥ 3.0610046·10¹⁰` given `RH(H₀)`, with the same closed forms and with `k ≥ 10⁹/H₀`, `H ∈ [1002, H₀)` and `σ > 1/2 + d/log H₀`. Cite §8.3 for it only once ExplicitZetaBounds states it in that form.
- Or state the recomputed bound as a zero input of §7.3, *CullyHugillLeeDensity*. It would say: for each `σ` of the rows and every `T ≥ 3·10¹²`, `N°(σ, T) ≤ (C₁/2πd)(log kT)^{2σ}(log T)^{5−4σ}T^{8(1−σ)/3} + (C₂/2πd) log² T`, with (4.72)–(4.73) evaluated at `H₀ = 3·10¹²`. Add it to the instance's hypotheses, to Owned here and to the Layer 7 Dependencies.

Tested: the other users of this density take the `3.06·10¹⁰` constants and are unaffected:

- Platt–Trudgian (`platt-trudgian-2021-error` lines 136–138);
- Broadbent–Kadiri–Lumley–Ng–Wilk (Table 7 at `σ = 0.90`: `11.499`, `3.186`, line 1191);
- Cully-Hugill 2021 (`cully-hugill-2021` lines 116–118, `H₀ = H_p`).

## R02 (P2) — Johnston–Yang's instances carry the wrong region and the wrong density

**Location.** README §3.4, lines 2070–2072: "under `RH(3 000 175 332 800)`, the classical-shape region with `R = 5.573412`, the zero-count error, the zero input *JohnstonYangDensityTable*". Lines 2083–2084: "The rows with `X ≥ 3000` are §3.1(c) at *JohnstonYangTable*". §3.6, lines 2327–2328: "the density bounds of `gap:explicit-zero-density` and *JohnstonYangTable*".

**Claim.** The source's inputs differ from the stated ones in three places:

1. **Region constant.** Every row of the source uses `R₀ = 5.5666305`. That region is stronger than the `5.573412` region assumed here, so the stated hypotheses do not support the rows.
2. **Large rows.** The rows with `X ≥ 10⁵` use the Ford-type region `ν₂` of the source's Lemma 2.9, not the classical shape of §3.1(c).
3. **Density in §3.6.** Theorem 1.4 repeats the source's §3.3 argument with the Vinogradov–Korobov region. Its density is therefore Table 3 of Lemma 2.6, that is *JohnstonYangDensityTable*, not `gap:explicit-zero-density`.

**Witness.** `johnston-yang-2023`:

- lines 221–235: Lemma 2.7, with `R₀ = 5.5666305`;
- line 284: the proof "set[s] `T = exp(2√(log x/R₀))` where `R₀ = 5.5666305`";
- lines 453–460: "Proof of Theorem 1.1 for `X ≥ 10⁵` … we use the zero-free region" `ν₂`;
- line 385: the density of Lemma 2.6;
- lines 638–640: "Proof of Theorem 1.4 … Section 3.3 except we use the Vinogradov–Korobov zero-free region".

**Repair.**

1. In §3.4, state the instance under the classical-shape region with `R = 5.5666305`, which `gap:classical-zero-free-constants` already contains.
2. For the rows with `X ≥ 10⁵`, add the source's `ν₂` region and call these rows §3.1(c) with that region. It follows from two pieces:
   - ExplicitZetaBounds §7.2, Ford's region in its `log 0.618` form for `t ≥ 1.88·10¹⁴`. This contains the source's Lemma 2.8 form with `log 0.77`, because a smaller `J` gives a wider region, and the source uses that form only from `t ≥ exp(91.29)`.
   - ExplicitZetaBounds §7.3 at `5.5666305` below that height.

   Cite §7.2 in the contracts and in the *Needs* line.
3. In §3.6, replace `gap:explicit-zero-density` by *JohnstonYangDensityTable* and add the `5.5666305` and `ν₂` regions.

Tested against the source: the first row (`X = log 2`, `C = 0.8274`) and the Table 3 parameters (`H₀ = 3 000 175 332 800`, `k = 1`, `μ = 1.23623`, lines 1049–1051) are the ones the repaired statement names.

## R03 (P2) — The truncated explicit formula behind the "Pintz form" rows has no owner

**Location.**

- README line 141: "the explicit Perron formula are the business of ExplicitZetaBounds and are listed as gaps in the supplier contracts".
- Line 2096: "Route: the standard route with §3.1(c) in its Pintz form".
- §3.1(c), lines 1768–1790.

**Claim.** No contract, gap or target of this README states either the explicit Perron formula or a truncated explicit formula with explicit error. "Perron" occurs only at line 141.

§3.1(c) defines its error function as Faber–Kadiri's smoothed display (3.9). The rows of *PlattTrudgianTable* and *JohnstonYangTable*, and the Fiori–Kadiri–Swidinsky `ψ` bound, come instead from Pintz's argument on the sharp truncated formula:

- **Platt–Trudgian**, Lemma 1: Dudek's theorem, `ψ(x) = x − Σ_{|γ|<T} x^ρ/ρ + O*(2x log² x/T)` for `x > e⁶⁰` half an odd integer and `50 < T < x`.
- **Johnston–Yang**, Lemma 2.4: Cully-Hugill–Johnston's formula, with error `4.3128/(T log^{0.6} x)` at some `T* ∈ [T/1.8, T]`.

Their table propositions therefore assert an error function that no section defines, built on an input no section owns. ExplicitZetaBounds lists "6.1–6.2 (Perron)" as consumed by this roadmap, but this README contracts neither section.

**Witness.**

- `dudek-2016` lines 115–125 (its Theorem 2.1);
- `platt-trudgian-2021-error` lines 101–112;
- `johnston-yang-2023` lines 165–187;
- ExplicitZetaBounds README line 2552: "6.1–6.2 (Perron)".

**Repair.**

1. Add a contract "From ExplicitZetaBounds §§6.1–6.2" (the smoothed truncated Perron formula and the averaged formula).
2. Add a §2.1 target: the truncated explicit formula with explicit error, in Dudek's form (hypotheses as above) and in Cully-Hugill–Johnston's form. Prove it from those Perron formulas, the zero count of ExplicitZetaBounds §5.2 and the weighted sums of §5.4.
3. State the Pintz form of §3.1(c) as its own general theorem. Its parameters are `R₀`, `H`, a split point `σ`, the density constants `C₁(σ)`, `C₂(σ)` and `T = exp(2√(log x/R₀))`. Its conclusion is `A(log x/R)^B exp(−C√(log x/R)) x` with an explicit `(A, B, C)`.
4. Point *PlattTrudgianTable*, *JohnstonYangTable*, *FioriKadiriSwidinskyPsiRow* and the `b ≥ 2500` rows of *BKLNWPsiTable* at that theorem. Those rows are "computed as in Theorem 13 using the method of Platt-Trudgian", `broadbent-kadiri-lumley-ng-wilk-2021` lines 1381–1383.
5. Correct line 141.

## R04 (P3) — The *RamareRevisedDensity* Check misquotes the value at `H₀`

**Location.** README lines 3833–3834: "it gives `N°(0.9, H₀) < 2.15·10¹⁰` (`kadiri-lumley-ng-2018` line 72)".

**Claim.** The bound evaluates to more than `2.15·10¹⁰`; the source prints `< 2.1529·10¹⁰`.

**Witness.** At `H₀ = 3.0610046·10¹⁰`:

- `965 · (3H₀)^{4/15} · (log H₀)^{3.2} + 51.5 log² H₀ = 965 · 838.42 · 26 608.7 + 30 022.5`, which is `2.15285·10¹⁰`;
- `kadiri-lumley-ng-2018` line 72 prints `N(0.90, H₀) < 2.1529·10¹⁰`.

**Repair.** Write `N°(0.9, H₀) < 2.1529·10¹⁰`.

## R05 (P3) — Faber–Kadiri's rows use Kadiri's density at `σ₀ = 0.89`, not at `17/20`

**Location.** README line 2029 (§3.4, Faber–Kadiri): "Rosser's zero-count triple, the density `N(17/20, T)` bound of `kadiri-2013-density` (`gap:explicit-zero-density`)".

**Claim.** The corrigendum takes the constants `c_i` from Faber–Kadiri's Table 2 at each row's `σ₀`:

- `σ₀ = 0.89` for `b₀ = 20` and `25`;
- `σ₀ = 0.90` for `b₀ = 30`.

The bound at `17/20` implies a bound at `0.89` (`N(0.89, T) ≤ N(17/20, T)`), but only with the weaker constants of the `17/20` row. The printed `ε₀ = 5.3688·10⁻⁴` is not established from those constants.

**Witness.** `faber-kadiri-2018-corrigendum`:

- lines 90–93: "For the zero density estimate for N(σ₀, T), we use values for cᵢ's from [2, Table 2]";
- line 98: the row `b₀ = 20` has `σ₀ = 0.89`.

**Repair.** Replace the passage by: "Kadiri's bound `N(σ₀, T) ≤ c₁T + c₂ log T + c₃` at the `σ₀` of each row (`0.89` at `b₀ = 20`), from the general form of `gap:explicit-zero-density` (ExplicitZetaBounds §8.1) with the constants of `faber-kadiri-2015` Table 2 (line 136)". Make the same change where Trudgian's route and §7.4 reuse *FaberKadiriTable*.

## Verified sound

### Repairs of the previous review

| Finding | Status | Where in this head |
|---|---|---|
| R01: five gap items handed back by ExplicitZetaBounds | Repaired for the five items | Each is now a named zero input owned here: *RamareRumelyRegion* (§6.1), *LiuWangFourZeros* (§6.6), *RamareRevisedDensity* (§7.5), *JohnstonYangDensityTable* (§3.4), and `ZetaZeroCountLowRange` with *ZeroCountBound* (§§1.1, 3.1). Owned here is at lines 80–89. The contracts are narrowed to ExplicitZetaBounds §§5.2, 7.5, 8.1 and 8.3 (lines 437–447). None of the items is in both this README's contracts and ExplicitZetaBounds' "Not owned here" (its lines 141–158). R01 and R02 above are further instances of the same class |
| R02: misprinted `9.3675` | Repaired | The second branch is Bellotti–Wong + `7/8` = `8.95844` (lines 1432–1433 and 1441–1450). The contract is at line 443 |
| R03: §3.2 `ψ − θ` route | Repaired | Lines 1891–1907 use the termwise decomposition, `ButheVerified` and the Corollary of Theorem 4. *Needs* lists `ButheVerified` (line 1928). Values are in the table below |
| R04: §4.6 `π₁` gap below `1.9·10¹⁰` | Repaired | (2.20) is Axler's Theorem 1.2, and (2.19) is Axler's Theorem 1.1 with the new clause of *DelegliseNicolasRange* on `[110 117 910, 110 118 925]` (lines 1073–1075 and 2759–2769). Recomputed below |
| R05: diagonal bound with two owners | Repaired | Lines 75–78 here. ExplicitCharacterSumsAndSieves at `5aa1cf51` now cites §0.1 at its lines 86–90, 197–199, 342–359 and 1250–1278 |
| R06: `ε₀(e¹⁰⁰)` | Repaired | `0.02775` at lines 783, 1941 and 2454; no `0.02777` remains |
| R07: Ramaré's second clause | Repaired | The clause is restricted to `[182, 261]` (line 1222). The Check (lines 3327–3331) and the route (lines 3307–3309) cite `ramare-2002` line 1231 |

### Gate, build and supplier order

- **Gate**, rerun at `3630d41`: every check `0`, "OK".
- **Diff outside the folder:** `git diff --stat origin/main...HEAD` is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings and nothing else; exit 0.
- **Dependency check:** `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Merge order:** this roadmap is at 271, after its suppliers:
  - ExplicitZetaBounds (270);
  - SieveMethodsAndPrimePatterns (269);
  - EffectiveClassNumbers (248);
  - ComputationalNumberTheory (193);
  - AnalyticNumberTheoryPartI (90).

  SpecialFunctionsEiLiErfIncompleteGamma is a new-roadmap pull request by another author, and the description names it.

### Signatures

All 32 declarations were checked with `#check @name` in a scratch copy: 17 definitions and 15 theorems.

- Each elaborated type matches its README statement, and no binder is lost.
- The new `ZetaZeroCountLowRange` elaborates to the README's statement: multiplicity `analyticOrderNatAt`, `M(T)` with `7/8`, and the range `2π ≤ T ≤ 10⁹`.
- It is a hypothesis of both Lee–Nosal theorems, as §2.2 says.

### Headlines and padding

The README's end theorems (lines 31–58) are stated, except those the module docstring names as resting on table propositions:

- Rosser–Schoenfeld;
- Broadbent–Kadiri–Lumley–Ng–Wilk;
- Fiori–Kadiri–Swidinsky;
- Bennett–Martin–O'Bryant–Rechnitzer.

No theorem closes by one tactic; this was decided by reading the finite hypotheses against the conclusions, which are unchanged since the last review. The one new definition is used by two theorems. There is no padding.

### Adversarial table

Values were computed in Python:

- sieves to `2.2·10⁷` and to `1.102·10⁸`;
- `Decimal` arithmetic at 40 digits for `π₁`;
- the first 29 ordinates of `ζ` for `N(T)`.

| Statement | Instances | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | 20 000 random cases (`k ≤ 60`, `x ≤ 2·10⁵`, `k < y ≤ 50k`); `k = 1`, `x = 1.9`, `y = 3.2` | worst count/bound `0.4165`; `3 ≤ 5.502` | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`, `x → 101⁻` | `2.340 ≤ 5.695`; `6.955 > 5.695` | sharp | none |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657`, `2656` | `89.863 ≤ 94.119`; `96.748 > 94.092` | sharp | none |
| `ZetaZeroCountLowRange` | `T = 2π`; just below and at each of the first 29 ordinates; `T = 100`; the first zero without `7/8` | `0.125 ≤ 0.515`; worst ratio `0.7426` at `14.1347` (`0.551` against `0.742`); ratio `0.0018` at `100`; `1.426 > 0.742` | holds; the `7/8` is needed | none |
| §1.1, Rosser against `0.28 log T` | `L = log T`; `T = 8100` | `0.143L − 0.443 log L − 1.588 = 0` at `L = 20.455` (`T = 7.65·10⁸`); `0.28 log 8100 = 2.51989 ≥ 2.5167 + 8.2·10⁻⁷` | holds | none |
| §2.2, zero-count branches | crossings with `0.28 log T` | `55.46` (Bellotti–Wong + `7/8`), `59.12` (printed), `64.93` (corrected + `7/8`); Bellotti–Wong + `7/8` is below the printed form by at least `0.412` for `L ≥ 1` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `x = 73.3`, `600`, and `θ` at `100` | `1.795 < 6.283`; `37.02 < 39.88`; `16.27 > 8.44` (so `599` is needed) | holds | none |
| §2.5, CMS Lemma 9 from Rosser | maximum of `0.443 log L − 0.013 L` | `1.1202` at `L = 34.08`, below `1.412` | holds | none |
| `carneiro_milinovich_soundararajan` | `x = 4`, `7.5`, `11`, `30` | primes `5`, `11`, `11`, `31`, against ends `6.440`, `12.356`, `17.999`, `46.394` | holds | none |
| §2.6, `N(T) ≤ (T/2π) log(T/2π)` | `T = 21`, `22` (Rosser); `T = 9.4`, `9.5`, `9.6`; `T = 10` | margins `−0.031`, `+0.115`; `−0.006`, `+0.007`, `+0.020`; `M(10) + 0.28 log 10 = 0.668 < 1` | holds from `22` and from `9.5` | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693`, `log x = 400` | `X = 8.3793 ≥ 8.36`; `ε = 1.0604·10⁻³` | holds | none |
| §0.5, `ε₀(e¹⁰⁰)` | `x = e¹⁰⁰` | `X = 3.219797`, `e^{−X} = 0.039963`, `ε₀ = 0.027754` | matches `0.02775` | none |
| §3.2, upper `ψ − θ` | `Σ_{k≥3, x^{1/k}≥2} x^{1/k}/x^{1/3}` on `log₁₀ x ∈ [8, 60]` in steps of `0.001` | maximum `1.53390`, at `10⁸` | holds | none |
| §3.2, lower `ψ − θ` | `(10⁸, 1 155 901²]`, `log₁₀ x` in steps of `10⁻⁴` | least ratio `1.008852`, at the right end (`1 153 804.5 + 10 809.4`); `1.0207` at `10⁸` | holds | none |
| §3.3, `ψ − θ` beyond `10²⁴` | `x = 10²⁴` | `(K − 3) x^{−1/12} = 76/100 = 0.760` | holds, with equality | none |
| `axler_primeCounting_upper` | `x = 47`, `48`, `10⁴`, `10⁷` | `U(47) = −1197` (negative denominator); `896.2 ≥ 15`; `1246.02 ≥ 1229`; `664 912 ≥ 664 579` | threshold `48` is needed | none |
| `vanlalngaia_sum_inv_prime` | `x = 2`, `10`, `1000`, `24 284` | `0.605 ≤ 12.01`; `0.0807 ≤ 0.328`; `0.00394 ≤ 0.00698` (constant `2.3`); `0.000971 ≤ 0.000971` (ratio `0.99944`) | holds; sharp at `24 284` | none |
| §4.6, (2.19) | sieve to `1.102·10⁸` | fails on `[110 117 899, 110 117 909.22)`; on `[110 117 910, 110 118 925]` the least margin is `4.62·10⁶`, at `110 117 910` | as stated | none |
| §4.6, Axler's Theorem 1.1 | the same sieve | fails up to `110 118 924.88`; no failure at a prime in `[110 118 925, 1.102·10⁸]` | as stated | none |
| `dusart_nth_prime_lower` | every `2 ≤ k ≤ 10⁶` | least margin `4.148`, at `k = 4` | holds | none |
| `lamzouri_li_soundararajan` | `q = 3`, `4`, `5`, `6`, `7`, `8`, `12` | `q = 3`: `7 > 4.83` (excluded); worst ratios `0.650`, `0.458`, `0.545`, `0.213`, `0.246`, `0.132` | holds | none |
| `schoenfeld_interval` | `x = 2 010 759.91`, `2 010 760`, `2 010 750` | ends `2 010 881.06` and `2 010 881.15`, past the prime `2 010 881`; end `2 010 871.15`, with no prime | sharp | none |
| `trudgian_interval` | `x = 2 898 240`, `2 898 242` | end `2 898 357.93 < 2 898 359`; end `2 898 359.93` | sharp | none |
| `axler_interval` | `x = 17 051 707.2`, `17 051 708` | end `17 051 886.93 < 17 051 887`; end `17 051 887.73` | sharp | none |
| *RamareRumelyRegion* | `q = 1`, `H = 1000`, `C = 38.31`, `|γ| = 1000` | `1/(R log 26.10) = 0.0318` | holds | none |
| *LiuWangFourZeros* | `x = 8·10⁹`, `q = 1` | `1 − 1/(3.82 log 8·10⁹) = 0.98852` | matches | none |
| *RamareRevisedDensity* | `σ = 0.9`, `T = H₀` | `2.15285·10¹⁰`, above the stated `2.15·10¹⁰` | value wrong | R04 |
| §7.5, Dudek's zero count from Rosser | `T = 10`, `15` | margins `1.369`, `3.500` | holds | none |
| §6.6, nested exceptional notions | `q = 10⁵` | `0.986637` against `0.986503` | holds | none |
| Johnston–Yang, §3.4 | the source's region and rows | `R₀ = 5.5666305` (lines 224 and 284) against `5.573412`; the rows `X ≥ 10⁵` use `ν₂` (lines 453–460) | hypotheses do not match | R02 |
| Cully-Hugill–Lee, §7.3 | density height | `3·10¹²` (lines 164–166) against `H₀ = 3.0610046·10¹⁰` in §8.3 | not supplied | R01 |
| Faber–Kadiri, §3.4 | the row `b₀ = 20` | `σ₀ = 0.89` (corrigendum line 98) against `17/20` | mislabelled | R05 |

### Sampled locators verified against the text

All fifteen sampled targets verify at the stated lines:

- **§0.1:**
  - `tmeemt-art14` lines 82–87;
  - `buthe-2014` lines 65–66, 141–146, 462–469 and 609–616;
  - `montgomery-1978` lines 377–388, 482–497 and 517–528.
- **§0.4:** `rosser-schoenfeld-1962` line 460; `schoenfeld-1976` lines 101–102; `trudgian-2016` lines 124–125.
- **§0.6:** AnalyticNumberTheoryPartI §0.2 (lines 207–223 at `2b9b7af`); SieveMethodsAndPrimePatterns `primeCountAP` (Lean line 314 at `39cf901`); ZerosOfLFunctions §8.7, *rayClassPsi* (main, line 1436).
- **§0.7:** `ramare-rumely-1996` line 67.
- **§1.1:** `van-de-lune-te-riele-winter-1986` lines 13–14; `platt-2017` lines 485–486; `platt-trudgian-2021-rh` lines 48–49.
- **§2.5:**
  - `dudek-2015` lines 47–48 and 51–52;
  - `carneiro-milinovich-soundararajan-2019` lines 167, 259–262, 269–273, 1185–1199, 1309–1319 (Lemma 9, derived from Trudgian's bound) and 1367–1371.
- **§3.2:** `rosser-schoenfeld-1962` lines 252–253, 306–308, 328, 341–342 and 349–357; `schoenfeld-1976` lines 201–206, 729–733 and 767–779; `rosser-schoenfeld-1975` lines 770–771.
- **§3.4:**
  - `faber-kadiri-2015` line 43; `faber-kadiri-2018-corrigendum` lines 86 and 90–98 (R05);
  - `trudgian-2016` lines 49–61, 66–73 and 132–140;
  - `platt-trudgian-2021-error` lines 58–69 and 76–77;
  - `johnston-yang-2023` lines 57–72, 204–217, 272–279, 441–445 and 1049–1073;
  - `fiori-kadiri-swidinsky-2023` lines 29–30, 149–176, 415–418 and 700–726.
- **§3.6:** `johnston-yang-2023` lines 77–80; the display prints `π(x) − x`, as the README says.
- **§4.1:** `rosser-schoenfeld-1962` lines 256–293 and 304–322.
- **§5.1:** `dusart-1999-mc` lines 116–126.
- **§5.5:** `axler-2019` lines 142, 145–150, 159–166 and 337; `de-koninck-letendre-2020` lines 489–500.
- **§6.6:** `kadiri-2008` lines 100–137 (Theorem 1.1; `α = 7.281` and `4.401`), 140–162 and 327–342.
- **§7.2:** `dudek-2016` line 815; `oliveira-e-silva-herzog-pardi-2014` lines 1795–1821 (`10 726 904 659 + 382`); `cully-hugill-lee-2022` line 85.
- **§7.4:** `trudgian-2016` lines 229–236; `broadbent-kadiri-lumley-ng-wilk-2021` lines 1669, 1672 and 1727; `axler-2016` lines 51–54.

The README flags no locator as unverified.

### Library declarations opened at the pins (19)

- **Mathlib:**
  - `NumberTheory/Chebyshev.lean` 70 (`psi`), 77 (`theta`), 191 (`theta_le_log4_mul_x`), 429 (`psi_eq_theta_add_sum_theta`), 433 (`theta_le_psi`), 442 (`abs_psi_sub_theta_le_sqrt_mul_log`) and 668 (`primeCounting_eq_theta_div_log_add_integral`);
  - `NumberTheory/LSeries/RiemannZeta.lean` 185 (`RiemannHypothesis`, which excludes the trivial zeros and `1`);
  - `Analysis/Analytic/Order.lean` 63 (`analyticOrderNatAt`, the `toNat` of the order);
  - `NumberTheory/LSeries/Nonvanishing.lean` 404 and 412;
  - `NumberTheory/Bertrand.lean` 225;
  - `NumberTheory/PrimeCounting.lean` 133 (`primesLE`).
- **Tau Ceti:**
  - `Analysis/SpecialFunctions/LogIntegral.lean` 141 and 180;
  - `NumberTheory/LFunctions/Mertens.lean` 545;
  - `NumberTheory/PrimeCounting.lean` 70 and 90;
  - `NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean` 50.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds** (`3e44c3f`, the same head as the last review):
  - §0.4, including `|S(T)| ≤ 2.5167` on `[0, 30 610 046 000]` (lines 489–526);
  - §5.2 (Rosser, Bellotti–Wong, and Trudgian at `3.385`), §6.5, §7.2, §7.5 (all four items match the new contract), §7.6 (`57.54` given `RH(3·10¹²)`), §7.9;
  - §8.1, §8.2 (Ramaré's `ζ` density is not a target there), §8.3 (R01);
  - "Not owned here", lines 141–158, which matches Owned here;
  - Downstream consumers, lines 2548–2560 (R03).
- **ExplicitCharacterSumsAndSieves** (`5aa1cf51`): see R05 of the previous review.
- **ExplicitMultiplicativeFunctions** (`bca454b3`) and **ExplicitNumberFields** (`4198f620`): every section of this roadmap they cite exists. Their §4.7 citations say "the other inputs of its §2.2", which covers the new `ZetaZeroCountLowRange`.
- **ZerosOfLFunctions** on main: §§4.1, 4.5, 7.3 (`S(T)`), 7.4, 8.6, 8.7 and 8.9.
- **Leads of the citation tool:** the three leads (`SieveDistribution.primeCountAP`, `principalLogIntegral`, `theta_ap.sum_classes`) are all found at the supplier heads.

### Ownership and gaps

- **New zero inputs.** `roadmaps grep` for `3.82 log`, `C₁(χ, H)`, `0.28 log T`, `965 (3T)` and `16.281` finds these objects only here and in ExplicitZetaBounds' "Not owned here", so they have a single owner. Compared by object with ExplicitZetaBounds, ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions, ExplicitNumberFields and AnalyticNumberTheoryPartI. The overlaps tool reports no dropped ids.
- **Gap slugs.** The README's 10 supplier contracts all appear in `plan.json`.
- **`gap:dirichlet-four-zero-region`** is still in `plan.json` but no longer in the README, which now owns the item as *LiuWangFourZeros*. The intake would announce it to ExplicitZetaBounds although nothing asks for it. This is recorded for the intake, not as a finding.
- **`gap:explicit-brun-titchmarsh`** (supplier `none`) is this roadmap's own §0.1 headline.

## Not verifiable

These texts are uncertified or waived in the manifest, so I cited them by locator and did not read them.

- `lee-nosal-2026`: display (8) (the source of `0.28 log T` and the printed `9.3675`), display (10) and §§3.2–3.3.
- `fiori-kadiri-swidinsky-2023-psi`: whether its density constants are the `3.06·10¹⁰` ones or a recomputation at `3·10¹²`, which is the question of R01.
- `montgomery-vaughan-1973`, `cully-hugill-lee-2024`, `ramare-saouter-2003`, `dusart-2018`, `axler-2018`, `axler-2019-nth-prime`, `axler-2024`, `johnston-2022`, `chirre-helfgott-2025`, `brent-platt-trudgian-2021`, `platt-2016`.
- `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `openai-2026-siegel`.
- `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`, `johnston-sorenson-thomas-webster-2026`, `zhang-xiong-2025`.
- `rosser-1938`, `rosser-1941`; `cipolla-1902`, which is waived.
- `kadiri-lumley-2014`'s density `σ₀`: the cached text does not display it.

## Source issues

- **Misprint** in johnston-yang-2023 at §3.3 and Lemmas A.1–A.3, pp. 9 and 17–18 of the text: the source refers to "Lemma 2.3" for the regions `ν₂` and `ν₃`; it should be Lemma 2.9 (respectively 2.10), where they are defined; affects nothing.
- **Error** in cully-hugill-2021 at §2, display (3), pp. 3–4 of the text: the source quotes Hasanalizade–Shen–Wong against `N(T) − (T/2π) log(T/2πe) − 7/8` with `a₃ = 9.3675`; it should be against `(T/2π) log(T/2πe)` without `7/8`, with `9.4925` (per Bellotti–Wong); affects the proof.
- **Error** in trudgian-2016 at Corollary 2, p. 7 of the text: the source says the interval holds for `x ≥ 2 898 239`; it should be `x ≥ 2 898 242`, since at `x = 2 898 240` the interval ends at `2 898 357.93`, before the next prime `2 898 359`; affects a stated result.
