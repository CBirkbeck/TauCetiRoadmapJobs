# Review of ExplicitPrimeCounting (pull request #1945 at c4b8ff9)

**Verdict:** accepted

This is an incremental re-review of the 42 lines changed since `9c3144e`, all in §6.6 of `TauCetiRoadmap/ExplicitPrimeCounting/README.md`.

I found nothing to fix:

- Review 13's single finding is repaired.
- The repair introduces no new problem.
- The gate passes.

## Previous findings

- R01 — repaired: lines 4019 and 4025 now read "every `q ≥ max(q₀, 8·10⁹)` … The row `q₀ = 5·10⁴` is therefore asserted only from `q = 8·10⁹` on". The existence route at lines 3999–4011 now runs "for `q ≥ 8·10⁹`" and "for the finitely many moduli `3 ≤ q < 8·10⁹`".

## Verified sound

### The R01 repair against the source

All five repair items requested by review 13 are present:

1. **Quantitative instances.** Line 4019 restricts them to `q ≥ max(q₀, 8·10⁹)`. Lines 4025–4029 state the restriction of the row `q₀ = 5·10⁴` and the paper's own overreach.
2. **Existence route.** Lines 3999–4011 apply Kadiri's bound for `q ≥ 8·10⁹` and the prime number theorem in progressions, modulus by modulus, for `3 ≤ q < 8·10⁹`.
3. **§6.7(a) range.** Line 4033 now reads `max(q₀, 8·10⁹) ≤ q ≤ 10¹⁰`.
4. **Liu–Wang's hypothesis.** Line 3991 adds that `x ≥ 8·10⁹` allows `x = q` only for `q ≥ 8·10⁹`.
5. **Negative control.** The new Check at lines 4050–4055 covers `q = 5·10⁴`.

*Kadiri2008Table* (lines 4036–4040) is restricted the same way.

I read each cited locator against `kadiri-2008`:

- **Theorem 2.2** (lines 337–341) requires `1 ≤ q ≤ x` and `x ≥ 8·10⁹`. It bounds the zeros with `|ℑs| ≤ x/q` and `σ ≥ 1 − 1/(R₁ log x)`, with `R₁ = 3.82`.
- **Line 342** applies Theorem 2.2 at `x = q` and at `x = qH`.
- **Lines 633–639** split off the zeros with `|γ_k| ≤ 1` and `1 − 1/(R₁ log q) ≤ β_k ≤ 1 − 1/(R log q)` (with `R = 6.50`), and those with `|γ_k| ≤ H` at `log(qH)`.
- **Table 1** (lines 140–162) has the rows `5·10⁴, 10¹⁰, 10¹⁵, …`.
- **Theorem 1.1** is at lines 128–131, and the lower bound at lines 102–125.

The supplier says the same. ExplicitZetaBounds at its head `11dd87b` (README lines 165–170) states the four-zero bound with the same `x ≥ 8·10⁹`. It leaves the bound to this roadmap, as line 3992 says.

I searched every open roadmap and main (`roadmaps grep` for `LiuWangFourZeros`, `Kadiri2008Table` and §6.6 of this roadmap). Nothing outside this pull request cites §6.6, so the narrowed range breaks no consumer.

### Gate, dependency check, build, signatures and probe

- **Gate, rerun at `c4b8ff9`:** every check `0`, `OK`, exit 0. The worker's gate (`gate.md`) also gives `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check:** `depcheck: 238 roadmaps, 2347 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
  - Merge-order positions: AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ExplicitZetaBounds 265, EffectiveClassNumbers 266, ExplicitPrimeCounting 267.
  - Supplier heads are unchanged since review 13: ExplicitZetaBounds `11dd87b`, AnalyticNumberTheoryPartI `979e68c`, SieveMethodsAndPrimePatterns `06aae1f`.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` gives exactly 15 "declaration uses `sorry`" warnings, nothing else, exit 0.
  - `Suggested.lean` is unchanged since `9c3144e`.
  - It has a single `import Mathlib` and three `TauCeti.*` modules. There is no `set_option`, `lemma`, `variable`, `include` or `#eval`.
- **Signatures:** I made a scratch copy with `#check @name` for all 42 declarations (27 definitions, 15 theorems). It elaborates with no error.
  - The worker's own check file carried a stray line `#check @TauCetiRoadmap.ExplicitPrimeCounting.*,`, taken from a docstring. It does not parse, so I dropped it.
  - The elaborated types are the ones review 13 compared with the README. §6.6 has no Lean declaration; the docstring names its intervals as resting on table propositions (lines 76–78). Nothing changed.
- **One-tactic probe:** I ran `first | (rfl; done) | (simp; done) | (norm_num; done) | (positivity; done) | (infer_instance; done) | (intros; linarith) | (intros; exact le_rfl) | (simp_all; done)` on all 15 theorems. All 15 fail, so none is padding.

### Adversarial table

**New rows, for the changed statements.** Values were computed in double precision. The thresholds `α_q` come from a sieve to `2·10⁷`: the last pair of consecutive primes `p < p′` in a class with `p′/p > e^ε` gives `X_q = log p′ − ε`.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| *LiuWangFourZeros* at `x = q` (line 3991) | `q = 5·10⁴`; `q = 8·10⁹` | `x = 5·10⁴ < 8·10⁹`, not admissible; `x = 8·10⁹ ≥ 8·10⁹` and `1 ≤ q ≤ x`, admissible | as stated | none |
| *LiuWangFourZeros* at `x = qH` | `q = 8·10⁹, H = 1`; `q = 5·10⁴` | `x = 8·10⁹`, admissible; `qH ≥ 8·10⁹ ⇔ H ≥ 1.6·10⁵` | as stated | none |
| Quantitative instances, row `q₀ = 5·10⁴` (line 4019) | `q = 8·10⁹`, `ε = 10⁻⁴` | band of lines 634–636 is `[0.988520, 0.993253]`, `|γ| ≤ 1`; the Liu–Wang strip at `x = q` is `σ ≥ 0.988520`, `|ℑs| ≤ 1`; `x ≥ 19.228 · 22.8027² = 9997.6` | holds | none |
| Same, the next row (line 4026) | `q = 10¹⁰` | `α(10¹⁰, 10⁻⁴) = 9.8356 < α(5·10⁴, 10⁻⁴) = 19.228` (lines 149, 156) | "below the next row" right | none |
| New Check (line 4050) | `q = 5·10⁴` | `1 − 1/(3.82 · 10.8198) = 0.9758054`; `1 − 1/(6.50 · 10.8198) = 0.9857810`; `1 − 1/(3.82 · 22.8027) = 0.9885198`; `8·10⁹/5·10⁴ = 1.6·10⁵` | matches `0.975805`, `0.985781`, `0.988520`, `1.6·10⁵` | none |
| "No input stated here bounds the number of zeros" (line 4028) | `q = 5·10⁴`, region of constant `6.4355` | it starts at `1 − 1/(6.4355 · 10.8198) = 0.985638`, so it covers only `[0.985638, 0.985781]` of the band (at most one zero); nothing stated bounds `[0.975805, 0.985638)` by four | holds | none |
| Existence route below `8·10⁹` (line 4006) | `q = 3, ε = 0.1` | last empty window from primes `241, 271 ≡ 1 (mod 3)`, ratio `1.12448 > e^{0.1} = 1.10517`; `X₃ = 5.5021`, `α₃ = 5.5021/log² 3 = 4.5587` | finite threshold | none |
| Same | `q = 3, ε = 0.01`; `q = 5, ε = 0.01` | `7349, 7433 ≡ 2 (mod 3)`, `α₃ = 7.377`; `27 283, 27 583 ≡ 3 (mod 5)`, `α₅ = 3.9436` | finite threshold | none |
| *Kadiri2008Table* range (line 4038) | `q₀ = 5·10⁴`; `q₀ = 10¹⁰` | `{q ≥ 8·10⁹} ⊂ {q ≥ 5·10⁴}`, so the hypothesis is weaker than the printed claim; `max(10¹⁰, 8·10⁹) = 10¹⁰`, unchanged | holds | none |
| §6.7(a) range (line 4033) | `q₀ = 5·10⁴`, `10¹⁰`, `10¹⁵` | `[8·10⁹, 10¹⁰]`; `{10¹⁰}`; empty, and line 4034 leaves `q > 10¹⁰` as a hypothesis | consistent | none |

**Rows carried from review 13, for statements the diff leaves untouched.** Each row cites `PRREVIEW-ExplicitPrimeCounting_r13`.

| Statement | Instance | Values (each side) | Result |
|---|---|---|---|
| `brun_titchmarsh` (review 13) | every window, `k ≤ 40`, primes `< 6000` | least margin `2.213`: count `4` vs `2·5/log 5 = 6.213` | holds |
| `brun_titchmarsh`, `y = k` (review 13) | `k = 1`, `(1.5, 2.5]` | right side `2/(1·0) = 0` vs count `1` | `y > k` needed |
| §0.2 `C(q, a)` (review 13) | `ramare-2002` line 81 | `C(1,0) = −γ`; `C(2,1) = −γ − log 2` | as stated |
| §0.3b adapter (review 13) | `x = 2` | `primeCount ℚ univ 2 = 1 = π(2)` | holds |
| §0.3a `li` (review 13) | `li 2`, `li 1.5` | `1.045164`; `0.12506 > 0.04` | holds |
| §0.3 prime powers (review 13) | `max L² e^{−L/2}` | `16/e² = 2.165`, `/log 2 = 3.124 < 3.13` | holds |
| §0.3 BKLNW `f` (review 13) | `n = 8, 9` | `3.167 < 3.212` | holds |
| §0.8 (review 13) | `x = 11 723` | `41.85 ≤ 43.37` | holds |
| §1.2 heights (review 13) | `q ≤ 13`, `q ≤ 40 000` | `7.7·10⁶ ≥ 10⁴`; `2500` | holds |
| `ButheVerified` (review 13) | `buthe-2018` lines 74–85 | six clauses identical | holds |
| `Buthe2016Range`, `π*` (review 13) | `x → 97⁻`; `x = 97` | `1.939 > 1.793`; `0.939 ≤ 1.793` | `97` right |
| *SchoenfeldTheorem7Range* (review 13) | sieve to `2·10⁶` | least margins `133.6`, `59.6`, `49.3`, `4.02` | holds |
| Corollary 2* (review 13) | six pairs | least margin `0.0523` at `c = 29` | holds |
| §3.2 switch to Büthe (review 13) | `x = 2·10⁶` | `97.47` vs `42.6`, `81.3` | holds |
| §3.2 `ψ − θ` (review 13) | `x = 10⁸` | `1.53568 ≤ 1.536` | holds |
| `schoenfeld_of_riemannHypothesis` (review 13) | `3/2 < x < 2`; `x = 3834` | `0 < 0.125`; `2.7090 < 2.7093` | holds |
| `leeNosal_of_riemannHypothesis` (review 13) | switch `337.09` | `0.940` | holds |
| `johnston_of_riemannHypothesisUpTo` (review 13) | crossover | `exp(exp(9.06/4.92)) = 547.7` | as stated |
| `carneiro_milinovich_soundararajan` (review 13) | `x = 4` | `[4, 6.44] ∋ 5`; `1.120 ≤ 1.412` | holds |
| `dusart_of_zeroFreeRegion` (review 13) | `R = 5.69693` | `log x ≥ 398.16`; `M(9.6769) = −2·10⁻⁵` | holds |
| §3.3 `ψ − θ` (review 13) | `x = 10²⁴`, `10¹⁶` | `0.76 x^{1/3}`; `225 443 > 20 405` | holds |
| §3.4 Trudgian's region (review 13) | crossings | `23.17`; `3.0014·10¹⁰ < 3.061·10¹⁰` | holds |
| §3.5 Panaitopol (review 13) | recurrence | `k = 1, 3, 13, 71, 461, 3447` | holds |
| §3.5 Dusart 1.10 (review 13) | `x = 10⁸` | `5 761 455 > 5 752 190` | holds |
| `axler_primeCounting_upper` (review 13) | perturbed `k_m` | `η = 0.024334` | as stated |
| `vanlalngaia_sum_inv_prime` (review 13) | `x = 89 967 803` | `0.4016 ≤ 0.41` | holds |
| Vanlalngaia Cor. 2 (review 13) | `R = 5.5666305` | `4531.24 ≤ 4635`; `0.17964 ≥ 0.175` | holds |
| `RobinNthPrimeRange`, `dusart_nth_prime_lower` (review 13) | `2 ≤ k ≤ 39 017` | no failure; ratio `1.66·10⁻⁶ ≥ 9.05·10⁻⁸` | holds |
| *Robin1983Range* (review 13) | `7022 ≤ k < 39 017` | fails at `7022`, `8581–8601`; none from `8602` | `8602` right |
| §6.1 Checks (review 13) | `q = 6`, `|γ| = 10⁴` | `0.014264`, `0.013022`, `0.010829` | holds |
| §6.3 (review 13) | `q = 10⁵ + 1`; `939 839` | `exp(14 477)`; `2.1813·10⁻⁴` | holds |
| §6.5 Bach–Sorenson (review 13) | `q = 2, 3` | `3 < 3.84`; `7 < 21.73` | holds |
| §6.6 nesting (review 13) | `q = 10⁵` | `0.013363` vs `0.013497` | holds |
| `schoenfeld_interval` (review 13) | `x = e³⁰` | `4.348·10⁸ > 1.961·10⁸` | holds |
| `trudgian_interval`, `TrudgianGapBound` (review 13) | `p = 4 652 353` | gap `154 ≤ 177.82` | holds |
| `axler_interval` (review 13) | switch | margin `6.4·10⁻¹²` at `e²⁵⁰` | holds |
| Axler 2016 gap instance (review 13) | `58 831` | gap `58 > 52.483` | holds |
| CHJ `140` (review 13) | `log x = 4242` | `0.99474`; `e^{−2086.6}` | holds |
| `ZetaZeroCubeSum` (review 13) | first ten zeros and tail | `7.3·10⁻⁴ ≤ 8.35·10⁻⁴` | consistent |
| `ZetaZeroCountLowRange` (review 13) | `T = 2π`; `T → 14.13⁺` | `0.125 ≤ 0.515`; `0.551 ≤ 0.742` | consistent |

### Library declarations opened at the pins

The pins match `lake-manifest.json`: Tau Ceti `2fd255d`, Mathlib `1b1ccf4`.

- `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50`, namespace at :42).
  - It takes `(m a : ℕ) [NeZero m] (ha : IsUnit (a : ZMod m))`.
  - It states that the primes of `𝓞 ℚ` with norm `≡ a (mod m)` number `∼[atTop] (1/φ(m)) · Li(x)`.
  - This is what lines 4007–4010 use, modulus by modulus, for `3 ≤ q < 8·10⁹`.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds `11dd87b`:** README lines 165–170 decline Liu–Wang's bound to this roadmap with `x ≥ 8·10⁹`. §7.5 is at line 2741.
- **The worker's one citation lead** was `SieveDistribution.primeCountAP` at README line 469, which is untouched text. It is a false lead: SieveMethodsAndPrimePatterns `06aae1f` defines `primeCountAP (x : ℝ) (q a : ℕ)` in namespace `SieveDistribution` (`Suggested.lean:387`, :393), and its §3.1 (README :2561, :2573) names it.

### Scope of the re-review

- **Seeded sample:** none of the 15 sampled sections (0.3a, 0.4, 1.1, 1.4, 1.7, 2.2, 2.6, 3.3, 3.4, 3.7, 3.8, 4.2, 6.1, 6.2, 6.4) falls in the changed passages. The hunks are README lines 3991–4055, all inside §6.6. The sampled sections stand as reviewed before.
- **Passages that depend on §6.6, re-read:** §6.7(a) (lines 4065–4097), the Layer 6 Dependencies (line 4127), the summary entry for *LiuWangFourZeros* (lines 91–92), the contract paragraph at line 477 and the `Suggested.lean` docstring (lines 76–78). None states a range for §6.6, so none needed a change.
- **Remark on untouched text (no change asked):** `plan.json` still declares `gap:dirichlet-four-zero-region` with ExplicitZetaBounds as supplier. The README instead owns *LiuWangFourZeros* as a hypothesis, which agrees with ExplicitZetaBounds lines 165–170. Review 13 recorded this gap and `explicit-brun-titchmarsh` (supplier `none`) as unused by any statement.

## Not verifiable

- **Liu–Wang's Theorem 1:** the paper is not in the manifest. It was read only as quoted at `kadiri-2008` lines 337–341. Whether the original states a wider range than `x ≥ 8·10⁹` is unchecked; the README asserts nothing beyond the quotation.
- **Sources settled as uncertified or waived:** these are cited by locator only, as recorded in review 13 (`platt-2016`, `lee-nosal-2026`, `axler-2019-nth-prime`, `rosser-1938`, `rosser-1941` and the others listed there). None is cited by the changed passages.

## Source issues

- **Gap** in kadiri-2008 at §2, Theorem 2.2 and its use for Table 1, pp. 1735–1740 (lines 140–148, 337–342, 633–639): the source says it applies Liu–Wang's four-zero theorem at `x = q` for every `q ≥ 5·10⁴`; it should restrict to `q ≥ 8·10⁹`, the theorem's hypothesis `x ≥ 8·10⁹`; affects a stated result.
