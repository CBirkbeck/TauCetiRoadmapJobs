# Review of ExplicitPrimeCounting (pull request #1945 at 11fa2ff)

**Verdict:** needs changes

Seven findings: five P2 and two P3.

- **R01:** the suppliers changed since `15ec8a1`. ExplicitZetaBounds no longer states the modulus form of Ramaré–Rumely's region, and hands it back to this roadmap.
- **R02–R04:** this head re-owns three objects that earlier or open roadmaps already state.
- **R05:** the ExplicitZetaBounds contracts omit hypotheses that the supplier needs.
- **R06–R07:** two Checks are wrong.

The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` warnings only.

## R01 (P2) — *RamareRumelyRegion* is taken from a form ExplicitZetaBounds no longer states; the supplier hands it back

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 2810–2822 (§6.1): "The region of the first shape is ExplicitZetaBounds §7.5's form for a modulus … For `q ≥ 1` and `H ≥ 1000` the supplier gives *RamareRumelyRegion* `q H C₁(q)`". The same citation appears at:

- lines 165–169 (Consumed) and 416–420 (contract preamble);
- the end of the `gap:dirichlet-zero-free-constants` contract (line 476), "and its form for a modulus: …";
- lines 2790–2791, 2834, 2846 and 2849–2850 (§6.1);
- lines 3169–3170 (Layer 6 Dependencies).

**Claim.** At ExplicitZetaBounds' head `c6ba511`, the fifth item of §7.5 ends with the conductor form. That is the bound with `k|γ|/C₁(k, H)` and the remark on imprimitive characters; the form for a modulus is gone. The supplier's "Not owned here" now names this roadmap's §6.1 as the owner of the passage to a modulus.

Each roadmap now hands the object to the other, and neither proves it. The previous review's R01 asked for this citation. The supplier moved the statement back after that review.

**Witness.** ExplicitZetaBounds README (`c6ba511`):

- lines 155–157: "The passage from it to a modulus `q` … (Dusart's), is `ExplicitPrimeCounting`'s (its §6.1, *RamareRumelyRegion*)";
- §7.5 fifth item, lines 2298–2309: the conductor form only.

**Repair.** Own the passage here, as the supplier now says.

1. In §6.1, replace "For `q ≥ 1` and `H ≥ 1000` the supplier gives … from there" (lines 2819–2821) by a target. Prove *RamareRumelyRegion* `q H C` for `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k, H)` for the conductor `k` of every character modulo `q`. The route:
   - the zeros of `L(s, χ)` with `0 < β < 1` are those of its primitive character, since the Euler factors vanish only on `Re s = 0`;
   - `k ≤ q` and `C ≤ C₁(k, H)` give `log(k|γ|/C₁(k, H)) ≤ log(q|γ|/C)`;
   - then apply the conductor form of ExplicitZetaBounds §7.5, fifth item.
2. At Dusart's `C₁(q)` this is the region the first shape uses.
3. Delete "and its form for a modulus: …" from the contract (line 476), and the modulus clause from lines 165–169 and 416–420.
4. Rewrite lines 2790–2791, 2834, 2846, 2849–2850 and 3169–3170 to cite the conductor form plus this target.

Tested at `q = 6`, `k = 3`, `|γ| = 10⁴`, `C = 20.92`:

- the conductor form, with `20.92 ≤ C₁(3, 10⁴)`, gives at least `1/(9.645908801 log(3·10⁴/20.92)) = 0.014264`;
- the modulus form gives `1/(9.645908801 log(6·10⁴/20.92)) = 0.013022 ≤ 0.014264`, as the passage asserts.

## R02 (P2) — `li` and its API are owned twice: §0.3a and SpecialFunctionsEiLiErfIncompleteGamma §8.2

**Location.**

- README lines 99–101 (Owned here: "The unoffset logarithmic integral `li` … (§0.3a)");
- §0.3a, lines 710–760;
- `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` lines 101–159: `li`, `liTwo`, and ten theorems from `hasDerivAt_li` to `li_isBigO`, listed as "Headline theorems" at lines 22–28.

**Claim.** SpecialFunctionsEiLiErfIncompleteGamma is an open pull request adding a new roadmap folder by another author, so it is an admissible supplier. It defines `li` as `TauCeti.Real.principalLogIntegral = Ei(log x)`, the same function. It owns every item of §0.3a:

- the derivative `1/ln x` and `li(0⁺) = 0`;
- the principal value (DLMF 6.2.8);
- `Li x = li x − li 2` for `x > 1`;
- the monotonicity of `Ei` on each half-line, hence that of `li`;
- the unique positive zero `x₀` of `Ei`, which gives Soldner's `μ = e^{x₀}` and `li > 0` from `3/2`, since `log 1.5 = 0.4055 > x₀ = 0.3725`;
- the expansion of `li`.

The head `15ec8a1` cited §§8.2–8.4 there. This head restates all of it as owned here, with no mention of that roadmap.

Separately, the ten theorems are carrier API. None is among the end theorems the README lists at lines 31–59, so `Suggested.lean` is cataloguing API rather than stating headlines.

**Witness.** SpecialFunctionsEiLiErfIncompleteGamma at its head `7a75a23`:

- README line 1003: "`li` is `TauCeti.Real.principalLogIntegral`";
- lines 1005–1024: derivative, `li(x) → 0`, 6.2.8, `logIntegral_eq_principalLogIntegral_sub`;
- `Suggested.lean` line 440 declares that theorem;
- its §8.2 Check gives `li(2) ∈ (1.0451637801, 1.0451637802)`, and the series of `Suggested.lean` gives `1.0451637801`.

**Repair.**

1. Delete the Owned-here bullet (lines 99–101) and the targets of §0.3a.
2. Add "From TauCetiRoadmap.SpecialFunctionsEiLiErfIncompleteGamma", citing:
   - §8.2: `principalLogIntegral`, derivative, limit at `0`, 6.2.8, `logIntegral_eq_principalLogIntegral_sub`;
   - §8.4: the expansion of `li`;
   - §8.5: the positive zero of `Ei` with its enclosure, which gives Soldner's constant and `li x > 0` for `x ≥ 3/2`.
3. Cite these at §0.4, §2.2 and §4.6.
4. In `Suggested.lean`:
   - keep `li` and `liTwo`, with a docstring saying `li` is a copy of that roadmap's `principalLogIntegral` (as for `RiemannHypothesisUpTo`);
   - delete the ten theorems and their docstring entry;
   - unbacktick their names in the README.
5. Add that pull request to this one's depends-on list.

Tested: `li(1.5) = 0.125065 > 0`, matching `Ei(0.405465) > 0` because `0.405465 > x₀ = 0.372507`; Soldner's `μ = 1.45136923 = e^{0.372507}`.

## R03 (P2) — §0.3b re-owns EffectiveClassNumbers §4.4: the rational adapter and `p_n ∼ n log n`

**Location.**

- README lines 102–103 (Owned here);
- lines 761–785 (§0.3b), 493 and 2774;
- `Suggested.lean` lines 161–170 (`primeCount_rat_eq_primeCounting`, `nth_prime_isEquivalent`).

**Claim.** EffectiveClassNumbers comes before this roadmap in the merge order (248 against 271). Its §4.4 proves both statements, by the same route through `Rat.HeightOneSpectrum.primesEquiv` and `TauCeti.primeCount_univ_isEquivalent_div_log`. The head `15ec8a1` cited it. Now two roadmaps own both objects.

**Witness.** EffectiveClassNumbers README (head `28521c8`):

- line 950: "Prove the rational-prime counting adapter: for every real x, `TauCeti.primeCount ℚ Set.univ x = (Nat.primeCounting ⌊x⌋₊ : ℝ)`";
- line 952: "Prove the n-th-prime asymptotic: p_n ∼ n log n".

**Repair.**

1. Delete §0.3b and its Owned-here bullet.
2. Restore "From TauCetiRoadmap.EffectiveClassNumbers" (§4.4, both statements), and cite it at §0.4 (the rational instance), at line 493 and in the Layer 5 Examples (line 2774).
3. Delete both theorems from `Suggested.lean`; no headline uses them.
4. Add that pull request to the depends-on list.

Tested at `x = 2`: both sides are `1`, which is that roadmap's own Check (line 956).

## R04 (P2) — §6.2a restates ExplicitZetaBounds §0.3 and ComputationalNumberTheory §4.24; its Lean lemma is a four-line consequence of its hypotheses

**Location.**

- README lines 120–122 (Owned here) and 2871–2907 (§6.2a), in particular lines 2893–2895: "this section owns the form for one character at any height `H ≥ 0` … and the conductor `1`";
- `Suggested.lean` lines 521–532 (`LFunction_ofReal_ne_zero_of_criticalLineUpTo`).

**Claim.** ExplicitZetaBounds §0.3 (`LFunction_ne_zero_of_platt`) proves, given *PlattRecord* and *PlattCentralRecord*, that `L(s, χ) ≠ 0` for real `0 < s < 1` and every primitive `χ` modulo `q ≤ 400 000`. That includes `q = 1`, where `ζ(s) < 0` is proved without any record.

- Its §7.9 states the trivial case: *HasLandauSiegelGap* `c Q` for every `c` when `Q ≤ 400 000`.
- ComputationalNumberTheory §4.24 (merge order 193) states the same nonvanishing.

So the instance of §6.2a, its conductor-`1` case and its *RealZeroGap* consequence all have earlier owners.

What remains is the step "a real zero lies at height `0`, so it is `1/2`". That is one line of the supplier's proof and closes in Lean in four lines, so it is not a headline.

**Witness.**

- ExplicitZetaBounds README (`c6ba511`) lines 480–484: "given also `PlattCentralRecord` (0.4b), that for `χ` primitive modulo `q ≤ 400 000` and real `0 < s < 1`, `L(s, χ) ≠ 0` (`LFunction_ne_zero_of_platt`) … For `q = 1` … no record is used".
- ComputationalNumberTheory README (`ed098d61`) line 2510.
- On a scratch copy of `Suggested.lean`, `intro h`, `hline β h …` (giving `Re β = 1/2`), `Complex.ext` and `hhalf (h2 ▸ h)` close the lemma, leaving 27 `sorry` warnings.

**Repair.**

1. Delete §6.2a, its Owned-here clause (lines 120–122) and the Layer 6 Example at lines 3157–3158.
2. In §6.3 (lines 2912–2913) and in §1.7, cite ExplicitZetaBounds §0.3 `LFunction_ne_zero_of_platt` and its §7.9 trivial case.
3. Delete `LFunction_ofReal_ne_zero_of_criticalLineUpTo` and its docstring entry (lines 50–52) from `Suggested.lean`.

Tested: the four-line proof above compiles.

## R05 (P2) — The ExplicitZetaBounds contracts omit the records the supplier proves under, and state Brent–Platt–Trudgian below its range

**Location.**

- README lines 444–450 and 1239–1243 (Brent–Platt–Trudgian);
- the gap contracts at lines 474, 476, 480 and 486;
- line 207 (Vinogradov–Korobov, "given `RH(3·10¹²)`");
- lines 1168–1171 (§1.7).

**Claim.** Each item asks for more than the supplier states. Composing an instance with the supplier would therefore add records that no theorem here names. The Summary (lines 23–29) promises the opposite: every computational fact is an explicit hypothesis.

- **Brent–Platt–Trudgian (§5.4).** The contract and §2.1 read `2π ≤ T₀`. The supplier states `168π < T₀` and calls the range from `2π` "not a target here". Line 450's "reaches down to `T₁ = 2π`" is therefore unsupplied.
- **Kadiri's `6.4355` region (§7.5).** The supplier needs `RH(3·10¹²)`, *BrentPlattTrudgianRecord* and *PlattRecord*. The contract says only "Given `RH(3·10¹²)`".
- **McCurley's region and Thorner–Zaman's `β₁` bound.** The supplier needs *PlattRecord*, plus *BordignonRecord* for `β₁ ≤ 1 − 100/(√q₁ log² q₁)`. The contract names neither.
- **Lu–Zaman–Zhao Corollary 1.2.** The supplier needs *LuZamanZhaoRecord*. The contract omits it.
- **Classical and Vinogradov–Korobov regions.** The `5.573412` and `5.5666305` regions (§7.3) and the `57.54` region (§7.6) need *BrentPlattTrudgianRecord*. The contracts at lines 474 and 480, and line 207, omit it.
- **Kadiri–Lumley–Ng (§8.3).** The supplier needs *HiaryPatelYangRecord*. The contract (line 486) omits it.
- **§1.7.** It says *LuZamanZhaoSweep* and *BanksGap* are "named in ExplicitZetaBounds §7.9". The supplier names `LuZamanZhaoRecord` and `hasLandauSiegelGap_one_fifth`, and neither of these two names.

**Witness.** ExplicitZetaBounds README (`c6ba511`):

- line 1794: "`168π < T₀ ≤ T₁ ≤ T₂`";
- line 2275: "given `RH(3·10¹²)`, `BrentPlattTrudgianRecord` and `PlattRecord`, for `q ≥ 2`";
- lines 2286, 2295, 2297, 2348 and 2576: the records named above.

**Repair.**

1. In the contracts at lines 444–450, 474, 476, 480 and 486, and at line 207, add each record exactly as the supplier states it.
2. Write `168π < T₀` at lines 445 and 1240.
3. Replace "Brent–Platt–Trudgian's reaches down to `T₁ = 2π`, below the first ordinate" (line 450) by: "Brent–Platt–Trudgian's starts at `168π`; below it Lehman's form, from `2πe`, and Rosser–Schoenfeld's Lemma 7 serve".
4. Reword the Check at lines 1284–1289 as a statement about the source's form, since the supplier's form does not reach `T₁ = 14`.
5. In §1.7, name the supplier's `LuZamanZhaoRecord`, `hasLandauSiegelGap_one_fifth` and its Banks instance.
6. Carry the records in the hypothesis lists of the instances that rest on these items: §§3.4, 3.6, 3.7, 6.1, 6.3, 6.6, 6.7, 7.3 and 7.5.

Tested: under the supplier's three hypotheses, Kadiri's region at `q = 10⁵`, `t = 0` gives `1 − σ ≤ 1/(6.4355 log 10⁵) = 0.013497`, the value of the §6.6 Check.

## R06 (P3) — A §4.3 Check says the `1/p` transfer diverges at `k = 1`; it converges

**Location.** README lines 2438–2439: "The transfer with `k = 1` (a bound `η t/log t`) gives a divergent integral `∫ dt/(t log t)` … `k ≥ 2` is needed."

**Claim.** With `|θ(t) − t| ≤ η t/log t`, the integrand of the exact form (line 2361) is `η(1 + log t)/(t log³ t) = η/(t log³ t) + η/(t log² t)`, which is integrable on `[x, ∞)`.

- The transfer formula of line 2365 holds for every real `k > 0`.
- The divergence `∫ dt/(t log t)` occurs at `k = 0`.
- The hypothesis `k ≥ 2` at line 2364 is not needed.
- The companion Check (lines 2444–2445, for `E`) is right: that integrand has no extra `1/log t`.

**Witness.** At `k = 1`, `η = 1`, `log x = 10`:

- the formula gives `(1 + 3/20)/10 = 0.11500`;
- directly, the boundary term `0.01` plus the integrals `0.005 + 0.1` gives `0.11500`.

**Repair.**

1. Write "with `k > 0`" at line 2364.
2. Replace the Check by: "With `k = 0` (a constant relative error) the integrand is `η(1 + log t)/(t log² t) ≥ η/(t log t)`, whose integral diverges, so `B` is not determined. At `k = 1` the bound is `η(1 + 3/(2 log x))/log x`, finite."

Tested at `k = 1`, `log x = 10`: `0.11500`.

## R07 (P3) — The §6.3 Check prints the threshold exponent as `14 490`; it is `14 477`

**Location.** README lines 2956–2958: "`exp(0.03 √q log³ q) = exp(0.03 · 316.2 · 1527) = exp(14 490)`".

**Claim.** At `q = 10⁵ + 1`, `log³ q = 1526.01`, not `1527`, and `0.03 · 316.229 · 1526.01 = 14 477.1`. The printed exponent is `13` too large, a factor `e¹³` in the threshold.

**Witness.** `log 100 001 = 11.512935`, whose cube is `1526.01`; `√100 001 = 316.229`.

**Repair.** Write "`exp(0.03 · 316.23 · 1526.0) = exp(14 477)`". Tested: `14 477.10`.

## Verified sound

### Gate, build, signatures, probe, dependency check

- **Gate**, rerun at `11fa2ff`: every check `0`, "OK", exit 0; the worktree is clean.
- **Dependency check:** "depcheck: 238 roadmaps, 2430 edges, 0 problem(s)", with no UPWARD, CYCLE or moved line.
- **Merge order:** ExplicitPrimeCounting is at 271, after ExplicitZetaBounds (270), SieveMethodsAndPrimePatterns (269), EffectiveClassNumbers (248), ComputationalNumberTheory (193) and AnalyticNumberTheoryPartI (90).
- **Outside the folder:** the diff is empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 28 "declaration uses `sorry`" warnings and nothing else, exit 0.
- **Signatures:**
  - a scratch copy with `#check @name` for all 52 declarations (24 definitions, 28 theorems) elaborates;
  - every elaborated type matches its README statement;
  - every hypothesis is in the theorem's own signature, and no binder is lost;
  - nothing was changed.
- **One-tactic probe:** each of the 28 theorems was given `first | (simp; done) | rfl | (norm_num; done) | infer_instance | exact?`. All 28 fail with "`exact?` could not close the goal". The §6.2a lemma closes in four lines (R04).

### Headlines (README lines 31–59)

- **Stated in `Suggested.lean`:**
  - `leeNosal_of_riemannHypothesis` and `leeNosal_theta_of_riemannHypothesis`;
  - `schoenfeld_of_riemannHypothesis` (with `π − li`);
  - `carneiro_milinovich_soundararajan`;
  - `buthe_of_riemannHypothesisUpTo` and `johnston_of_riemannHypothesisUpTo`;
  - `dusart_of_zeroFreeRegion` and `axler_primeCounting_upper`;
  - `brun_titchmarsh`;
  - `vanlalngaia_sum_inv_prime` and `dusart_nth_prime_lower`;
  - `lamzouri_li_soundararajan`;
  - `schoenfeld_interval`, `trudgian_interval` and `axler_interval`.
- **Not statable, named in the module docstring (lines 61–90) with the table proposition each lacks:** Rosser–Schoenfeld's `1.03883`, Broadbent–Kadiri–Lumley–Ng–Wilk's `θ` bound, Fiori–Kadiri–Swidinsky, and Bennett–Martin–O'Bryant–Rechnitzer.
- **Not headlines:** the twelve Layer 0 carrier theorems (R02, R03) and the §6.2a lemma (R04).

### Adversarial table

Values come from:

- sieves to `3·10⁶`;
- the exponential-integral series for `li`, summed to machine precision;
- direct evaluation in double precision.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` | every `k ≤ 60`, every unit `l`, every window with `y/k ≤ 60` among primes `≤ 2·10⁵` | worst bound/count `1.50006`: `k = 1`, primes `2,…,19`, count `8` against `2·17/log 17 = 12.0005` | holds | none |
| §0.1, `t ≥ 2·10⁴` | `N = 20 001`; `N = 10⁸`, `10²⁰` | `c(N) = 0.07603`, sides `4038.98` and `4018.57` (difference `20.41`); difference `1.97·10⁵` and `3.26·10¹⁶` against `0.70 N/log² N = 2.06·10⁵` and `3.30·10¹⁶` | holds | none |
| §0.1, constant and negative control | `log 6 + c − log 12 + ½ log(2/3)` | `0.17412` at `c = 1.07`; `−0.31866` at `c = γ` | as stated | none |
| §0.1, Büthe's asymptotic | primes `2, 3, 5, 7`; `u = 10⁹` | `0.65648 + 0.5 − 58/√10⁹ = 1.1546 ≥ 1.15` | holds | none |
| `li` (`Suggested.lean`) | `x = 3/2`, `2`, `e`, `1/2`; Soldner; `x = 1` | `0.125065`, `1.0451637801`, `1.8951178164 = Ei(1)`, `−0.378671`; `μ = 1.45136923`; junk value `γ` (`log 0 = 0`) | true; same function as SpecialFunctionsEiLiErfIncompleteGamma's | R02 |
| `logIntegral_eq_li_sub_liTwo` | `x = 1.5 < 2` | `li(1.5) − li 2 = −0.920099 = −∫_{1.5}^2 dt/log t` | holds | R02 |
| §0.4 | `x = 2` | `(log 2 − 2)/log 2 + 2/log 2 = 1.000000 = π(2)` | holds | none |
| §0.3 | `x = 8`; `x = 3` | `2 log 2` on both sides; `ψ = θ = log 6`, bound `2.40` | holds | none |
| §0.2, `C(q, a)` | `C(1, 0)`; `C(4,3) − C(4,1)` | `−γ`; `(L′/L)(1, χ₄)`; `C(4,1) + C(4,3) = C(2,1) = −γ − log 2` | holds | none |
| §4.3, transfer | `k = 1`, `η = 1`, `log x = 10`; `k = 3`, `x = 89 967 803` | formula `0.11500` equals direct `0.11500`; `1/3 + 5/(4 · 18.315) = 0.4016 ≤ 0.41` | `k = 1` converges | R06 |
| §4.3, exact form | `x = 3` | `0.8333` on both sides | holds | none |
| §3.2, upper bound for `ψ − θ` | `∑_{k≥3} x^{1/k}/x^{1/3}` on `[10⁸, e²⁰⁰]`, including every `2^k` jump | maximum `1.53390` at `10⁸`; `1.001093 · 1.534 = 1.5357 ≤ 1.536` | holds | none |
| §3.2, lower bound for `ψ − θ` | `(10⁸, 1 155 901²]` | minimum ratio `1.007538` (at `1.34·10¹²`) against `1.0088 · 0.998697 = 1.007486` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` | `8/R = 1.4043`; `X = 8.36` at `log x = 398.16`; `8R` would need `log x = 11 833`; `M(9.6769) = 0`, while the source's `M(17.8478) = 1.0000` (`dusart-2016` line 534) | holds; the README's `T₀` is a valid alternative | none |
| §3.1(b) | `D = 158.84998`; `b ↓ 1/2` | `C(D) = 2.82004 ≥ 2.82`; `e^{−1/2} log 2π = 1.1147` | holds | none |
| §2.2, Lee–Nosal | crossovers | `ButheVerified` gives `ψ` from `337.09` and `θ` from `3381.63`; Theorem 1.1 is sharper iff `log x > 30 369.58` | holds | none |
| §2.3, ranges | `T = 3 000 175 332 800` | Büthe `x ≤ 2.169·10²⁵`; Johnston `x ≤ 1.102·10²⁶` (stated `1.101·10²⁶`); crossover `547.72`; *JohnstonTable* at `a = 1` gives `2.166·10³⁰` (stated `2.165·10³⁰`) and at `a = 10⁷` `7.376·10⁴⁴` (stated `7.375·10⁴⁴`) | holds | none |
| §2.5, Lemma 9 of Carneiro–Milinovich–Soundararajan from Rosser | maximum of `0.443 log L − 0.013 L` | `1.1202` at `L = 34.08`, `≤ 1.412` | holds | none |
| §2.6 | `T = 3·10¹² + 1 + π/3` | `C_T = 113.669 ≤ 113.67` | holds | none |
| `axler_primeCounting_upper` | `x = 48`, `10¹⁹`, `10²⁶` | `896.15 ≥ 15`; bound − `li` `= 6.82·10¹⁰` against `√x log x/8π = 5.51·10⁹`; `1.93·10¹⁷` against `2.38·10¹³` | holds | none |
| `schoenfeld_interval` | `x = e³⁰` | `4.348·10⁸` against `2√(x+h) log(x+h) = 1.961·10⁸` | holds | none |
| `trudgian_interval` | lemma at `e³⁵`; `x = 2 898 240`, `2 898 242` | `0.00900898 > 0.009`; ends `2 898 357.93` and `2 898 359.93`, next prime `2 898 359` | holds; threshold `2 898 242` needed | none |
| `axler_interval` | switch points | `2.1482·10⁻⁸` serves to `log x ≤ 104.24`; `1.1344·10⁻⁹` to `277.85`; margin `6.41·10⁻¹²` at `e²⁵⁰`; switch must lie beyond `log x₀ = 243.3` | holds | none |
| §6.1, *RamareRumelyRegion* | `q = 6`, `k = 3`, `|γ| = 10⁴`, `C = 20.92` | `0.013022 ≤ 0.014264` | true; no supplier states it | R01 |
| §6.2a lemma | four-line proof | compiles, leaving 27 `sorry` warnings | already owned by two suppliers | R04 |
| §6.3, Check | `q = 10⁵ + 1` | `0.03 · 316.229 · 1526.01 = 14 477.1` against the printed `14 490` | slip | R07 |
| §6.5, discriminant bounds | every `q ≤ 5000`; `q = 12` | no failure; `144` | holds | none |
| `lamzouri_li_soundararajan` | `q = 4` | least primes `5` and `3`, both `≤ (2 log 4)² = 7.69` | holds | none |
| §6.6, Check | `q = 10⁵` | `0.013363` and `0.013497` | holds | none |
| §6.7(a) | `c = 1/5` | `0.2 > 1/9.645908801 = 0.10367` and `> 1/6.5 = 0.15385` | holds | none |
| §5.1, negative control | `n = 61`, `p₆₁ = 283` | `277.27 < 283 < 283.37`; substitution gives `277.49 < 283`; `L = 5.82003` gives `285.70 ≥ 283` | holds | none |
| `dusart_nth_prime_lower` | `p_k = e⁵⁰⁰`; `log k = 1792.5` | `1.0004 · 0.0077629 = 0.007766 ≤ 0.00821`; `1.7177·10⁷ > 1.6571·10⁷` | holds | none |
| §1.6 | decimal values | `|γ − 0.5772156649| = 1.5·10⁻¹¹`; `|B − 0.2614972128| = 4.8·10⁻¹¹` (`B` from `rosser-schoenfeld-1962` line 81) | holds | none |
| §2.2, `π` from `ButheVerified` | `x = 3834` | `1.95 + 3.9/L + 19.5/L² = 2.709 = L²/8π` | holds | none |

### Sampled locators verified against the text

- **§0.3a:** no source locator. Values were computed (table), and SpecialFunctionsEiLiErfIncompleteGamma §8.2 was compared (R02).
- **§0.7:** `ramare-rumely-1996` line 67, the row `(1, 0.000213, 10¹⁰)`.
- **§1.6:**
  - `ramare-rumely-1996` line 294 (`γ`);
  - `rosser-schoenfeld-1962` line 81, (2.10) (`B`).
- **§2.3:**
  - `buthe-2016`: lines 567–577 (Theorem 1, whose `E₁` already carries `e^{αε} − 1` in this text), 688–705 (Theorem 2), 709–712, 754–755 and 845–873;
  - `broadbent-kadiri-lumley-ng-wilk-2021`: lines 1354–1369 (Theorem 16 and its footnote) and 1378–1412 (Table 8 at `H₀ = 2 445 999 556 030`; every quoted row);
  - `johnston-2022` is uncertified (below).
- **§2.5:**
  - `dudek-2015` lines 47–52;
  - `carneiro-milinovich-soundararajan-2019` lines 167, 259–273, 1185–1189, 1309–1319 and 1367–1371.
- **§3.1:**
  - `dusart-2016` lines 74–90, 104–112, 140–151, 186–196, 440–475, 528–535 and 570–580;
  - `dusart-1999-mc` lines 61–108.
- **§3.2:**
  - `rosser-schoenfeld-1962` lines 248–328 and 338–357. The extraction drops superscripts; the README reads (3.18) and (3.20) correctly.
  - `schoenfeld-1976` lines 198–206, 725–772 and 1280–1294.
- **§4.1:** `rosser-schoenfeld-1962` lines 256–322, with the ranges at lines 304–322.
- **§5.3:**
  - `robin-1983` lines 55–90 and 376–382;
  - `dusart-1999-mc` lines 25–35, 116–130 and 160–172;
  - `schoenfeld-1976` lines 767–772 and 1280–1283.
- **§6.2:** `ramare-rumely-1996` lines 77–92.
- **§6.3:** `bennett-martin-obryant-rechnitzer-2018`:
  - lines 105–113: `Li = ∫₂ˣ`;
  - lines 160–195: `c₀`, `x₀`, `x/log² x`.
- **§7.3:**
  - `kadiri-lumley-2014` lines 24–34, 280–296, 378–388, 428–440, 490–512, 578–606 and 686–712;
  - `cully-hugill-lee-2022` lines 72–90, 148–182 and 596–616.
- **§7.4:**
  - `trudgian-2016` lines 224–240;
  - `broadbent-kadiri-lumley-ng-wilk-2021` Table 14 (lines 1660–1676) and Table 15 (lines 1718–1732);
  - `axler-2016` lines 49–56.
- **Outside the sample:**
  - `tmeemt-art14` lines 79–87 (Montgomery–Vaughan's hypotheses `x, y > 0`, `y > k`);
  - `buthe-2014` lines 60–66, 139–146 and 462–469;
  - `buthe-2018` lines 72–85 (*ButheVerified* matches (1.5)–(1.10)).
- **Unverified flags:** the README flags no locator as unverified.

### Library declarations opened at the pins

- **Elaborated:** 59 Mathlib and Tau Ceti names cited by the README elaborated with `#check` at the pins, among them:
  - `Chebyshev.psi_eq_theta_add_sum_theta` (`Mathlib/NumberTheory/Chebyshev.lean:429`);
  - `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log` (`:442`);
  - `Chebyshev.primeCounting_eq_theta_div_log_add_integral` (`:668`);
  - `Chebyshev.theta_le_log4_mul_x` (`:191`);
  - `IsCyclotomicExtension.Rat.natAbs_discr` (`Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:728`);
  - `Rat.HeightOneSpectrum.primesEquiv` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:109`);
  - `DirichletCharacter.LFunction_modOne_eq` and `Real.eulerMascheroniConstant_eq_neg_integral_log`.
- **Found by search** (their modules are not imported):
  - `TauCeti.primeCount_sub_mul_logIntegral_eq` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Transfer.lean:76`);
  - `TauCeti.primeCount_univ_isEquivalent_div_log` (`…/Prime/PrimeIdealTheorem.lean:46`);
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`);
  - `Nat.primesLE_eq_image_nth` and `Nat.primeCounting_nth_prime` (`TauCeti/NumberTheory/PrimeCounting.lean:70`, `:90`).
- **Read:** `TauCeti.Real.logIntegral` (`TauCeti/Analysis/SpecialFunctions/LogIntegral.lean:141`, integral from `2`), and `TauCeti.primeCount` (`…/ArithmeticDirichletSeries/Counting.lean:630`, `:648`).
- **Absent:** neither library has `li` or `p_n ∼ n log n` at the pins.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds** (`c6ba511`):
  - §§0.2, 0.3, 0.4 and 0.4b (records named as cited);
  - §3.4 (Delange);
  - §5.2 (Rosser for `T ≥ 2`, Bellotti–Wong, Trudgian's `3.385`, the `9.3675` form);
  - §5.3, which matches `gap:dirichlet-zero-count-error`;
  - §§6.1 and 6.5;
  - §7.2 (the `log 0.618` form, valid from `|t| ≥ 3`, contains the contract);
  - §§7.3, 7.6, 7.9, 8.1 and 8.3, and "Not owned here".
  - The drift found is R01 (§7.5) and R05.
- **AnalyticNumberTheoryPartI** (`ead4cdb`):
  - §§0.2 (`psiAP q a x`, `theta_ap.level_one`, `theta_ap.sum_classes`), 0.3, 0.5, 0.8, 0.16, 0.19, 0.25, 0.30, 0.32 and 0.34;
  - §1.5a (the `3π/2` Hilbert inequality), §§1.6 and 1.9.
- **SieveMethodsAndPrimePatterns** (`eecdf1d`): §2.9 (forbidden-residue large sieve) and §3.1 (`SieveDistribution.primeCountAP x q a`, `p ≡ a [MOD q]`, which is equality at `q = 0`).
- **On main:**
  - ZerosOfLFunctions §§4.1, 4.5, 5.6, 6.2–6.4, 7.3, 7.4, 8.3–8.9 and Layer 9;
  - LFunctions Layer 4 (`dirichletData`);
  - ClassFieldTheory Layer 13 (conductor–discriminant);
  - ClassicalArithmeticCompletion §6.34 (`dyadicPrimeCount`).
- **ProbabilisticAndMetricNumberTheory** Layer 5, at its open head.
- **The two leads in the worker's citation list** (`SieveDistribution.primeCountAP`, `theta_ap.sum_classes`) are roadmap names. They resolve in those roadmaps.

### Ownership

Searched by object with `roadmaps grep` and `roadmaps show` (main and every open head) for:

- `li` and Soldner's constant;
- the rational adapter and `p_n ∼ n log n`;
- the real zeros of small conductor;
- Brun–Titchmarsh with the constant `2`;
- `∑ Λ(n)/n` in progressions and `C(q, a)`;
- `π*`;
- the decimal enclosures of `γ` and `B`.

Second owners were found only for R02, R03 and R04. Brun–Titchmarsh, the diagonal bound, the enclosures and the progression sums are owned only here, and their later consumers cite them here: ExplicitCharacterSumsAndSieves README line 85, and ExplicitMultiplicativeFunctions README lines 402–403. The overlap tool reports no dropped id.

The repairs of R02 and R03 add SpecialFunctionsEiLiErfIncompleteGamma and EffectiveClassNumbers as suppliers. The pull request's depends-on and merge-order paragraphs should then name them.

## Not verifiable

These are recorded as uncertified or waived in the manifest, and were cited by locator only.

- **Sampled targets:**
  - §5.6: `axler-2019-nth-prime`;
  - §6.7: `lu-zaman-zhao-2026`, `thorner-zaman-2024` and `banks-2026`. Compared instead with ExplicitZetaBounds §§7.5 and 7.9 (R05);
  - the Johnston part of §2.3: `johnston-2022`. Its ranges were recomputed (table).
- **Not in the sample:**
  - `chirre-helfgott-2025`, `lee-nosal-2026`, `fiori-jaskari-2026`;
  - `axler-2018`, `axler-2024`, `dusart-2018`, `dusart-1999-cr`, `platt-ramare-2017`;
  - `bhattacharjee-2024`, `zhang-xiong-2025`, `ramare-2023-corrigendum`, `fiori-kadiri-swidinsky-2023-psi`;
  - `broadbent-fiori-kadiri-ng-wilk-2026`, `bellotti-trudgian-yang-2026`, `brent-platt-trudgian-2021`, `platt-2016`;
  - `lamzouri-li-soundararajan-2015`, `openai-2026-siegel`, `cully-hugill-johnston-2025`;
  - `lee-2026`, `visser-2025`, `johnston-sorenson-thomas-webster-2026`;
  - `montgomery-vaughan-1973`, `rosser-1938`, `rosser-1941`, `ramare-saouter-2003`, `cully-hugill-lee-2024`;
  - `cipolla-1902` (waived).

## Source issues

- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 (line 701): the source states the `π*` bound for `x > 59`; it fails at `x = 96.9` (`|π* − li| = 1.9174 > 1.7914`), so it should hold for `x ≥ 97`; affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 (line 75): the source states `x − θ(x) ≤ 1.95 √x` from `1423`; at `x = 1426.9` it gives `74.077 > 73.660`, so it should start at `1427`; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23) (lines 84 and 378): the source states the `−0.9385` upper bound for `k ≥ 7022`; it fails at `k = 7022` (`70 919 > 70 918.61`) and `k = 8601`, so it should be `k ≥ 8602`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval from `2 898 239`; at `x = 2 898 240` it ends at `2 898 357.93`, before the next prime `2 898 359`, so it should start at `2 898 242`; affects a stated result.
- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source requires `X ≥ max(8.36, 8R)`, while its proof (lines 445, 471, 531) uses `X ≥ 8/R`; it should read `max(8.36, 8/R)`; affects a stated result (Corollary 1.2 from `log x = 400`).
