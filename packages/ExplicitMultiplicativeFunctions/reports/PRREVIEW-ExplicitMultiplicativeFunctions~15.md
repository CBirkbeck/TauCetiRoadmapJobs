# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 7f06557)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/` at `7f06557`. The previous review read `2ab0898`; since then 214 lines of the folder changed.

- **What changed.** The new commit adds:
  - citations of `primeNumberTheoremAnd` and `ieantn` labels throughout;
  - the general threshold form of 9.3a with its step lemmas;
  - one new theorem in `Suggested.lean`, `not_isHighlyAbundant_lcmUpto_of_primeGap`.
- **Findings.** There are five, all P3, and none blocking.
  - The mathematics of the new threshold form is sound: every constant it states reproduces.
  - The findings are a false Check in 0.5, a set of misattributed labels in 9.3a, two sources missing from the manifest, one padding declaration and one locator in 6.2.
- **Checks run.**
  - The gate passes.
  - The dependency check reports 0 problems.
  - `Suggested.lean` elaborates with `sorry` warnings only.

## R01 (P3) — Rogers' squarefree bound is quoted for real `x`, where it is false

- **Location.** `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md`, 0.5, Checks, line 764: "(`Q(176) = 106 = (53/88)·176`: Rogers' `Q(x) ≥ (53/88) x` with equality only at `x = 176`, `moserMacLeod1966` line 9)".
- **Claim.** Under the Conventions every argument is real, so the Check asserts `Q(x) ≥ 53x/88` for every real `x`.
- **Witness.** `Q(1.9) = 1 < (53/88)·1.9 = 1.144`. The bound fails just below the right end of 17 unit intervals below `389`: those starting at `1, 4, 9, 28, 29, 54, 56, 64, 172, 176, …, 388`. At the integers of `[1, 2·10⁵]` the minimum of `Q(n)/n` is `53/88`, at `n = 176` only.
- **Repair.** Replace the parenthesis by: "(`Q(176) = 106 = (53/88)·176`: Rogers' `Q(N) ≥ (53/88) N` for every natural `N ≥ 1`, with equality only at `N = 176`, `moserMacLeod1966` line 9; at real arguments it fails, `Q(1.9) = 1 < 1.144`)". Tested: no integer violation on `[1, 2·10⁵]`, and `Q(1.9) = 1`.

## R02 (P3) — Four `primeNumberTheoremAnd` labels in 9.3a do not state the constants they are cited for

- **Location.** README 9.3a, "Route for the threshold form", lines 4292–4296: "with `ε ≤ 1/125` and `n^{−1/2} ≤ e^{−5}` (`primeNumberTheoremAnd` `lem:eps-bounds`) … `1 + 3.0484/n` … `1 + 3.2322/n` … (`lem:poly-ineq`, `lem:final-comparison`, `prop:ineq-holds-large-n`)".
- **Claim.** These labels are cited for the general threshold `log X₀ ≥ 5`.
- **Witness.** `IEANTN/Lcm.lean` (PrimeNumberTheoremAnd, main branch) fixes `X₀ := 89693` at line 988.
  - `lem:eps-bounds` states `1/log³√n ≤ 0.000675` for `n ≥ 89693²` (lines 1403–1416).
  - `lem:poly-ineq` states the constants `3.01` and `3.36683` (lines 1484–1501).
  - Nothing in the file mentions `1/125`, `e^{−5}`, `3.0484` or `3.2322`.
- **Second part.** The step labels `lem:choose-pi`, `lem:choose-qi`, `lem:qi-product`, `lem:pi-product` and `lem:pq-ratio` (lines 4288–4292) are stated there only for `n ≥ 89 693²`, with Dusart's input.
- **Repair.**
  - Move the four labels to the closing sentence: "At `X₀ = 89 693`, where `ε ≤ 6.75·10^{−4}` and `n^{−1/2} ≤ 1.115·10^{−5}`, the two are `1 + 3.0041/n` and `1 + 3.3668/n` (`primeNumberTheoremAnd` `lem:eps-bounds`, `lem:poly-ineq`, `lem:final-comparison`, `prop:ineq-holds-large-n` state this case with `0.000675`, `3.01` and `3.36683`)."
  - Write the five step labels as "(the same steps for `n ≥ 89 693²`: …)".
  - The general constants then rest on the route's own computation. Recomputed: at `ε = 1/125`, `n = e^{10}` the left side gives `3.048397 ≤ 3.0484` and the right side `3.232200 ≥ 3.2322`. `ieantn` `Lcm/v2`, whose statement is the threshold form, stays the source of the statement.

## R03 (P3) — `primeNumberTheoremAnd` and `ieantn` are cited without a revision and are not in `sources.toml`

- **Location.** README References, lines 4501–4504 (`ieantn`) and 4546–4559 (`primeNumberTheoremAnd`). They are cited in 0.1, 0.5, 1.4, 2.1, 2.3, 7.1a, 8.1, 8.1a, 9.2 and 9.3a.
- **Claim.** Each label is an exact locator.
- **Witness.**
  - Both entries give only a repository URL. A label in a moving repository is not a fixed locator.
  - `packages/ExplicitMultiplicativeFunctions/sources.toml` has 84 entries; every other reference id of the README is among them, and these two are not.
  - Other roadmaps pin this repository: ExplicitNumberFields' `pntplus` is at revision `9ecc1b6…`.
- **Repair.**
  - Fetch both works through the sources service at a fixed commit (raw URLs with the commit hash, `--licence-class open-repository`). The files are `PrimeNumberTheoremAnd/{Consequences,IwaniecKowalskiCh1}.lean` and `PrimeNumberTheoremAnd/IEANTN/{MobiusLemma,Mertens,Dusart,Lcm}.lean`; for `ieantn`, `IEANTN/Nodes/Lcm/v{1,2}/Conclusions.lean`.
  - Record the commits in the manifest and in the two References entries ("at revision …").
  - All 40 labels exist on the current main branches, so pinning today's commits loses nothing.

## R04 (P3) — `not_isHighlyAbundant_lcmUpto` is padding beside the new threshold theorem

- **Location.** `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`, lines 404–413; module docstring line 32 ("and its instance `n ≥ 89 693²`").
- **Claim.** The instance is a separate acceptance test.
- **Witness.** On a scratch copy the instance closes from `not_isHighlyAbundant_lcmUpto_of_primeGap` with no error:

  ```lean
  refine not_isHighlyAbundant_lcmUpto_of_primeGap 89693 ?_ hD n (by exact_mod_cast hn)
  rw [Real.le_log_iff_exp_le (by norm_num)]
  calc Real.exp 5 ≤ 3 ^ 5 := by
        rw [show (5 : ℝ) = ((5 : ℕ) : ℝ) by norm_num, ← Real.exp_one_pow]
        gcongr; exact Real.exp_one_lt_d9.le.trans (by norm_num)
    _ ≤ 89693 := by norm_num
  ```

  It is the special case `X₀ = 89 693` of a theorem in the same file.
- **Repair.**
  - Delete `not_isHighlyAbundant_lcmUpto` from `Suggested.lean`.
  - Drop "and its instance `n ≥ 89 693²`" from the docstring's headline list.
  - In README 9.3a (line 4243) remove the backticked name `not_isHighlyAbundant_lcmUpto`, since every backticked own name must be declared in the Lean file. Keep the instance in prose with its locators.

## R05 (P3) — 6.2 attributes the `K(7)` simplification to source lines that print a weaker form

- **Location.** README 6.2, line 2973: "and for `log y ≥ 7S` the simplified forms with `K` replaced by `K(7) = log 7 − 1 + 1/7` (lines 336–360)".
- **Claim.** `daboussiRivat2001` lines 336–360 state the `K(7)` form.
- **Witness.**
  - Lines 336–360 print the exponent `−log y/log z`, that is, `K` replaced by `1`.
  - Line 362 justifies it by `K(t) ≥ K(7) ≥ 1` for `t ≥ 7`.
  - The README's form is true, because `K'(t) = (t − 1)/t² ≥ 0` and `K(7) = 1.088767`, but it is not the one printed.
- **Repair.** Write: "and for `log y ≥ 7S` the simplified forms with `K` replaced by `K(7) = log 7 − 1 + 1/7 = 1.0888…`, which follow from the general forms since `K` increases on `[1, ∞)`. The source prints them at lines 336–360 with `K` replaced by `1`, from `K(t) ≥ K(7) ≥ 1` (line 362)." Tested at `log y/log z = 10`: `exp(−10.888) ≤ exp(−10)`.

## Verified sound

### Previous findings

The previous review (of `2ab0898`) had no findings and accepted the folder. There is nothing to carry over.

### Gate, order, elaboration

- **Gate.** I ran it on this head; it printed `gate ExplicitMultiplicativeFunctions: set_option=0 … outside-folder=0 source-material=0 OK` and exited with 0. The worker's `gate.md` adds `build=0`.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).
- **Dependency check.** `gate --depcheck … --movable` printed `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`; there is no UPWARD, CYCLE or `moved:` line.
- **Merge order.** The positions in `ORDER.txt`:

  | Roadmap | Position |
  |---|---|
  | ZerosOfLFunctions | 48 |
  | AnalyticNumberTheoryPartI | 49 |
  | SieveMethodsAndPrimePatterns | 55 |
  | ProbabilisticAndMetricNumberTheory | 60 |
  | ExplicitZetaBounds | 265 |
  | ExplicitPrimeCounting | 267 |
  | ExplicitCharacterSumsAndSieves | 268 |
  | this roadmap | 269 |
  | ExplicitNumberFields (consumer) | 270 |

- **Elaboration.** `lake env lean` on `Suggested.lean` printed exactly 17 warnings, `declaration uses sorry`, at lines 166, 198, 205, 210, 220, 235, 256, 274, 291, 314, 332, 358, 369, 385, 398, 409 and 420, and nothing else. The extra warning compared with the previous review is the new theorem at line 398.
- **Signatures.**
  - I appended `#check @…` for all 31 declarations to a scratch copy and elaborated it. Every type printed. The new theorem elaborates as `∀ X₀, 5 ≤ log X₀ → (∀ y, X₀ ≤ y → ∃ p, Nat.Prime p ∧ y < ↑p ∧ ↑p ≤ y * (1 + 1 / log y ^ 3)) → ∀ n, X₀ ^ 2 ≤ ↑n → ¬IsHighlyAbundant n.lcmUpto`, which is README 9.3a's statement at the same generality.
  - The other 30 types are unchanged from the previous review's comparison.
- **Probes.**
  - The one-tactic probe on the new theorem (`simp`, `simp [IsHighlyAbundant]`, `decide`, `omega`) leaves the goal `0 < n.lcmUpto → ∃ x < n.lcmUpto, σ₁(n.lcmUpto) ≤ σ₁(x)` open, so the theorem is not padding.
  - The instance probe is R04.
- **Headlines.** Every headline in the README summary is stated, except the three groups the docstring names with their reasons (1.10, Robin's `0.6483`, the preprint statements).

### Seeded sample (15 targets)

| Target | Locator checked | Result |
|---|---|---|
| 0.4 | `ramare2016mc` lines 540–565, Lemma 4.3: `X ≥ 0`, `c ∈ [1, 2]`, proof splits at `√(2N)` | matches |
| 0.5 | `primeNumberTheoremAnd` `Q-def`, MobiusLemma line 31; `moserMacLeod1966` line 9; `berkaneBordellesRamare2012` lines 64–68 | matches; Rogers quoted wrongly (R01) |
| 0.6 | `ramare1995` lines 364–379, p. 658: `h` read off a zeta quotient | matches |
| 1.1 | `balazard2012` lines 81–84, 92–109, 146–149, 180–200, 303–320, 321–328, 424–440, 454–470; `ramare2015mc` lines 450–458; `ramare2013aa` lines 696–704, 734–746 | matches |
| 3.1 | `ramare2015corr` lines 76–93, 119 (p. 2384); `ramare2015mc` lines 155–163, 652–689 | matches |
| 3.2 | `ramare2015corr` lines 20–32, 237–239; `ramare2015mc` lines 169–190 | matches |
| 3.4 | `daval2025` uncertified; extremal value recomputed | matches |
| 6.1 | Mathlib `summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` (EulerProduct/Basic.lean:142) | matches |
| 6.2 | `daboussiRivat2001` lines 302–362, Lemma 4: hypotheses `z ≥ 2`, `f ≥ 0`, `S > 0`, `log y ≥ S` | matches; simplified form misdescribed (R05) |
| 6.5 | `ramare1995` lines 334–337, Lemma 3.1, p. 656: hypotheses only | partly (see Not verifiable) |
| 7.1a | `primeNumberTheoremAnd` `mobius-lemma-1-sub`, `mobius-lemma-1`, `mobius-lemma-2`, `-sub-1`, `-sub-2` (MobiusLemma lines 164–176, 374–390, 406–449, 496–511) | matches |
| 7.5 | `cullyHugillTrudgian2021` lines 60–72, 124–135, 236–242 | matches; `bordelles2002`, `bordelles2006` uncertified |
| 8.1a | `dusart2018` uncertified; `primeNumberTheoremAnd` `Dusart_thm_5_9a/b` (Dusart.lean lines 607–629) | matches |
| 8.2 | `vanlalngaia2017` Theorem 4 at lines 90–108 and Theorem 5 on p. 3 (line 118, `\|ε\| < 2`); the extraction is font-garbled, so the constant `0.841` is not legible | locators match; transfer recomputed |
| 8.3 | `bordelles2005` and `languascoZaccagnini2009` uncertified; transfer recomputed | matches |

Notes on the sample:

- `berkaneBordellesRamare2012` line 68 gives `5559` as a witness, which fails. The README notes this, and the slip is under Source issues.
- 6.2's general form matches exactly. 6.5's legible hypotheses are a nonnegative multiplicative `f`, a positive integer `d` and `x ≥ 0`.

### The new citations

- **`primeNumberTheoremAnd` labels.** All 40 cited labels exist on the main branch in the files the References name (`Consequences.lean`, `IwaniecKowalskiCh1.lean`, `IEANTN/MobiusLemma.lean`, `IEANTN/Mertens.lean`, `IEANTN/Dusart.lean`, `IEANTN/Lcm.lean`). Their content:
  - `mun` is `|Σ_{n ≤ x} μ(n)/n| ≤ 1` (line 1581).
  - `mu-pnt` (1928) and `mu-pnt-alt` (2376) are `M(x) = o(x)` and `m(x) = o(1)`.
  - `two_pow_omega_le_sigma_zero` is `2^{ω(n)} ≤ σ₀(n)` for `n ≠ 0` (875). `d_apply_prime_pow` is `d_k(p^a) = C(a + k − 1, k − 1)` for `k ≥ 1` (312).
  - `Meissel-Mertens-eq` is `M = γ + Σ_p (log(1 − 1/p) + 1/p)` (2252). `Mertens-third-theorem-error` is `∏(1 − 1/p) = e^{−γ} exp(E₃)/log x` (2270).
  - `highlyabundant-def` (Lcm line 30) has no `N ≥ 1`. It agrees with `IsHighlyAbundant` at every `n ≥ 1` and differs only at `0`, where it holds vacuously. The README says this.
  - The misattributions are R02.
- **`ieantn` nodes.**
  - `Lcm/v1` states `∀ n ≥ 89693², ¬ HighlyAbundant (lcmUpto n)`.
  - `Lcm/v2` states `∀ c X₀, 5 ≤ c → c ≤ log X₀ → HasPrimeInInterval.logPower X₀ 3 → ∀ n, X₀² ≤ n → …`. Its vocabulary, `IEANTN/Vocabulary/PrimeGaps.lean` line 36, defines the interval as `(x, x + x/(log x)^k]`.
  - This is the README's threshold form; its docstring's "`c > 4.12`" matches the README's Check.

### Adversarial table

All values were computed in this review in double precision (`math.fsum` where noted), with sieves to `10⁶` for `μ` and `τ` and to `3.5·10⁶` for the primes.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 9.3a threshold form (new headline) | `ε = 1/125`, `n = e^{10}` | left `3.048397 ≤ 3.0484`; right `3.232200 ≥ 3.2322` | sound | — |
| 9.3a threshold, room | `c = 4.1, 4.11, 4.12, 4.13` | left/right `3.08877/3.08376`, `3.08811/3.08622`, `3.08745/3.08867`, `3.08680/3.09108`: separate from `4.12` | sound | — |
| 9.3a threshold, monotonicity | `n = 3·10⁴, 10⁶, 89693²`, linked `ε` | right `3.2474, 3.3318, 3.36685`; left decreasing | sound | — |
| 9.3a instance | `X₀ = 89 693` | `log X₀ = 11.40415`; `ε = 6.7424·10⁻⁴`; left/right `3.004048/3.366846` | sound | padding (R04) |
| 9.3a `p₃ < q₁` | `ε = 1/125` | `(1.008)⁶ = 1.048970 < 1.05 < e⁵` | sound | — |
| 9.3a hypothesis not vacuous / not implied | `X₀ = 150`, `y = 155`; `X₀ ≤ 1` | `(155, 156.2082]` contains no prime (`151`, `157`); at `y = 1`, `1/log³ 1 = 0` in Lean, so `p ≤ 1`, impossible | sound | — |
| 9.3a steps | `n = 10⁴`, `(101, 103, 107)`, `(9949, 9967, 9973)` | `P = 1 113 121`; `Q = 988 939 464 559`; `m = 222 109`; `r = 2 695 803`; `ℓ/M − 1 = 2.72596·10⁻⁶ < 4.50230·10⁻⁶`; `Nat.log 2 10⁴ = 13`; `4.57792·10⁻⁵ > 3.75·10⁻⁵` | sound | — |
| 9.3a `IsHighlyAbundant` vs `highlyabundant-def` | `n = 0`; `n ≥ 1` | ours false (`0 < n`), theirs vacuously true; identical for `n ≥ 1` | sound | — |
| 9.2 `k^{ω} ≤ τ_k ≤ k^{Ω}` | `n = 12` (`k = 2, 3`); `k = 0`; `n = 0` | `4 ≤ 6 ≤ 8`; `9 ≤ 18 ≤ 27`; `τ₀(6) = 0 = 0^{ω(6)}`; `τ_k(0) = 0 < 1 = k^{ω(0)}`; strict for `a ≥ 2`, `k ≥ 2`: `k(k + 1)/2` lies strictly between `k` and `k²` | sound | — |
| 0.4 | `X = 1, c = 1`; `X = 0.5, c = 3`; `X = 2.999` | `1 = 1`; `1/8 > 1/16` (fails, as stated); `1.497 ≤ 1.4995` | sound | — |
| 0.5 `R`, `Δ`, `γ₁` | `x = 1, 4, 176`; `Δ` at `1, 4, 1980, 5460, 5559`; `N = 10, 10⁶` | `R = 0.392073, 0.568292, −0.995170`; `Δ = 0.845569, 1.837097, 22.33876 > 22.24860, 31.39072 > 29.55673, −0.70533`; `0.041228` vs `0.042313`; `−0.0728089`; `τ/n` constant `0.478901` vs `γ² − 2γ₁ = 0.478810` | sound | — |
| 0.5 Rogers (Check) | real `x = 1.9`; integers `≤ 2·10⁵` | `Q(1.9) = 1 < 1.144`; integer min `53/88` at `176` | false at real `x` | R01 |
| 0.6 | `h = μ(n)/n²` | `ζ(5/3)/ζ(10/3) = 1.850797`; `H'(0) = 0.346495` | sound | — |
| 1.1 identities | `ε₁(1.5)`; `ε₁'(1.5)`; Balazard at `x = 2`; Lemma 8.1 sign; El Marraki at `D = 3` | `17/162 = 0.104938` (`t⁴`: `0.106996`); derivative `0.012346 = 1/81`; `5/12 + 1/12 = 1/2`; `0.79248 + 0.20752 = 1` (`−` gives `0.58496`); `2 log 1.5 + log(4/3) = 1.098612 = log 3` | sound | — |
| 1.2–1.4 values | `M` at `199, 684, 685, 1109, 1118, 10⁶, 142 193/4, 617 972/3, 2 160 534/5` | `−8, −12, −11, −15, −14, 212, −123/−122, −262/−261, −498/−497`; `max(\|M\| − x/80) = 5.5125` at `199`; no violation of `x/80`, `0.10917`, `0.002969` up to `2.2·10⁶`; ratios `0.996743`, `0.999505`; Corollaire `0.6437752` at `5` | sound | — |
| 1.5 headline hypotheses | squarefree inputs on `[1, 10⁶]` | `max \|R(x)\|/√x = 0.67909 < 0.7`; `Σ μ²/d − (6/π²) log y ∈ [0.57862, 1.16546] ⊂ [0.578, 1.166]` | satisfiable | — |
| 2.2 headline; `I(1)` | `x = 1, 2`; quadrature of `ε₁'(t)/t` | `1 ≤ 11/3`; `1/2 ≤ 19/12`; `I(1) = 0.1727846` vs `3/4 − γ = 0.1727843` (Balazard's `271/360 − γ = 0.17556` is wrong) | sound | — |
| 2.6 example | `m_6(30)` | `0.299894`; `3·0.784/log 5 = 1.4614` | sound | — |
| 3.1 identity / Theorem 1.4 | `x = 1`, `2`; minimum of `x`·polynomial | `−1`; `−0.36549`, integral term `0.05864`; `−1.07115` at `1.1711`; limit `0.46078` | sound | — |
| 3.2 rows | integers and interior critical points `≤ 10⁶` | last violations `6, 3161, 9548` (`0.0203`, `1/396`, `1/714`), `6, 43, 221` (Corollary 1.6); `0.00140` fails on `[9549, 9549.02]` only (`0.00140005` at `9549`, `0.00139800` at `9550`) | sound | — |
| 3.4 extremal value | sweep to `10⁶` | sup `0.16532795` at `2.389861` `= 2(2 − log 2)³/27`; on `[3, 10⁶]` max `0.126373` at `3.1547 < 0.162` | sound | — |
| 6.1 | `f = 1`, `y = 2, 3`; `f(n) = n`, `y = 4` | `3/2 = 3/2`; `11/6 ≤ 2`; `4 ≤ 6` | sound | — |
| 6.2 | `f ≡ 1`, `z = 2`, `y = 2`; `K(7)` | `S = 0.346574`; `K(2) = 0.193147`; bound `1.648721`; lower `0.351279`; `K(7) = 1.088767` | sound | R05 (locator) |
| 6.5 | `f = 1`, `d = 2`, `x = 4`; `d = 4`; without `μ²` | `3 ≤ 4 ≤ 6`; `11`; `8 > 4` (fails, as stated) | sound | — |
| 7.1a midpoint form | `x = 10.7`, `K = 2, 11`; `Q(10)` | `0.4951800` both, against `R(10.7) = 0.4951800`; term `k = 11`: `0.2`; `−1 + 0 + 8 = 7` | sound | — |
| 7.5 | `S₃(12), S₃(13)`; `S₄(6), S₄(12)`; thresholds; constants | `74 > 72.87`, `77 ≤ 82.6`; `39 ≤ 54.5`, `133 ≤ 180.4`; last failures `192`, `432`, `6`; `C₃ = 0.981468`; `1 − C₄ = 0.727222`; `F₁ = 4.472908`; `ζ(3/2)/ζ(3) = 2.1733` | sound | — |
| 8.1 headline | `x = 2, 3, 11, 283, 293`; `x = 24 284` | `0.6173, 0.6522, 0.8874, 0.9833, 0.9860` inside the windows; `9.7129·10⁻⁴ + 4.1181·10⁻⁵` vs `4.8919·10⁻³` | sound | — |
| 8.1a headline | `x = 2 278 381/2/3`, `3 445 943` | `0.200054/0.200067`, `0.199960/0.199973`, `0.199866/0.199879`, `0.198397/0.198409`; `log log` step `2.99821·10⁻⁸` vs room `2.55010·10⁻⁸`; `0.199933 < 0.2` | sound | — |
| 8.2 | `ε = ±1`; tail bound | `γ(−1) = −0.31572`, `γ(1) = −0.18198`, `e^{γ(1) + B} = 1.08277 = (6/π²)e^γ`; `2(p − \|ε\|) ≥ (2 − \|ε\|)p` for `p ≥ 2` | sound | — |
| 8.3 | `q = 1`, `X₀ = 286`; `q = 2`; `q = 4`, `x = 5`; `η` | `C = 1.83675`; `0.89054`; `0.98531`; Abel tail `c/log x + c/(2 log² x) + c/log² x` | sound | — |
| 9.1 headline | `k = 9` | `9 log 19.2231/19.2231 = 1.384013 ≤ 1.3841` | sound | — |
| 5.1, 5.2 headlines | `h = δ`; threshold | `Σ_{n ≤ 10⁶} τ(n) = 13 970 034`; `(3·0.961/1.16)⁶ = 235.68 ≤ 236` | sound | — |

### Library declarations opened at the pin

- **Mathlib:**
  - `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` (`NumberTheory/EulerProduct/Basic.lean:142`) and `eulerProduct_hasProd` (`:175`);
  - `Nat.equivProdNatFactoredNumbers` (`NumberTheory/SmoothNumbers.lean:197`);
  - `Nat.sum_divisors_filter_squarefree` (`Data/Nat/Squarefree.lean:298`);
  - `Nat.lcmUpto` (`NumberTheory/Chebyshev.lean:211`), `Nat.factorization_lcmUpto` (`:220`), `Chebyshev.psi_eq_log_lcmUpto` (`:311`);
  - `Nat.primesLE` (`NumberTheory/PrimeCounting.lean:133`);
  - `Finset.sum_range_id_mul_two` (`Algebra/BigOperators/Intervals.lean:175`);
  - `hasDerivAt_tsum` (`Analysis/Calculus/SmoothSeries.lean:133`).
- **Absent from both pinned libraries.** Mathlib and Tau Ceti have no `HighlyAbundant`, no `2^{ω(n)} ≤ σ₀(n)` and no `M(x) = o(x)`.

### Citations, ownership, overlaps

- **Supplier heads.** Five suppliers moved since the previous review. I re-resolved every cited section at the current heads:
  - ExplicitPrimeCounting `cac820b`: §§0.1, 1.1, 1.3, 1.6, 1.7, 3.1, 3.2, 3.3, 3.5, 4.2, 4.3, 4.7, 5.3, 6.1, 6.3, 7.4, including Büthe's `58/√u` in §0.1 and Dusart's interval from `89 693` in §7.4. Every cited constant was found.
  - AnalyticNumberTheoryPartI `ecf6111`: §§0.11, 0.19, 0.21, 0.26, 0.34, 1.2, 3.1, 3.7, 3.9, 3.11, 3.12, 3.22, 3.22a, 3.22b, 3.23a (with `BBRFiniteInput`, `0.764`, `0.475`), 3.35, 3.35a.
  - SieveMethodsAndPrimePatterns `66e58fc`: §0.5 and §1.1, with the majorants `(1 + log Z)^k` at line 1145.
  - ProbabilisticAndMetricNumberTheory `d311ebe`: §3.7's Rankin-type bound.
  - ExplicitZetaBounds `4478804`: §§0.2, 0.4, 0.4b, 4.1, 4.8, 4.10, 6.1, 7.3, 7.10, with `1237`, `e^{146}`, `29.388`, `30.812` and `5.558691`.
- **Unchanged supplier.** ExplicitCharacterSumsAndSieves `b701b75`: §5.1 `selbergDiagonal`.
- **Declared gaps.** The 17 slugs of `plan.json` include the 6 the README names.
- **Overlaps.** `overlaps.md` and `citations.md` list nothing. `roadmaps grep` finds highly abundant numbers and `lcmUpto` only in this roadmap, and no other roadmap states `k^{ω(n)} ≤ τ_k(n)` or `M(x) = o(x)` as a target. SieveMethodsAndPrimePatterns §1.1 uses `3^{ω(n)} ≤ τ₃(n)` in passing, not as a target.
- **Text scan.** Process words, pull-request numbers, LaTeX delimiters and `lemma` were searched for in both files: none found.

## Not verifiable

- **6.5.**
  - The displayed inequality of `ramare1995` Lemma 3.1 (p. 656) is missing from the extraction (lines 334–337 keep only the hypotheses), and `vanLintRichert1965` lines 55–92 are garbled OCR.
  - The README's two-sided inequality was proved here independently: unique factorisation `n = gcd(n, d)·m`, with an injective reverse map. It was also checked on the instances of the table.
- **Uncertified, cited by locator.** `daval2025` (3.4), `bordelles2002` and `bordelles2006` (7.5), `dusart2018` (8.1a), `bordelles2005` and `languascoZaccagnini2009` (8.3), and `rieselVaughan1983` (5.2). Their quoted numbers were recomputed where the table shows them.
- **3.2's `J`.** The constant `J = ∫_1^∞ |h'(t)| dt/t = 0.16137` was not recomputed. It needs `ε_{6,0}` of `ramare2015mc` Lemma 3.1; its product `0.0130 J = 0.002098` was checked.
- **`leong2026` (1.9).** Image-only on this worker; its `[[missing]]` entry stands.
- **Ownership against open pull requests.** Checked through `roadmaps grep`, `overlaps.md` and the supplier checkouts above, not by reading every sibling checkout.

## Source issues

- **Misprint** in ramare2015mc at (2.1), §2, printed p. 1366: the source says the cubic term is `4(1 − 1/x)³/(3x²)` (line 450); it should be `4(1 − 1/x)³/(3x)`, as the paper itself re-quotes it at lines 665 and 847 and the corrigendum at line 89; affects nothing.
- **Error** in ramare2015corr at Theorem 1.5, printed p. 2383: the source says `|m̌(x) − 1| log x ≤ 0.213` for `x ≥ 1` (line 28); it should say `x ≥ 2`, since at `x = √e` the product is `1/4`; affects a stated result.
- **Misprint** in ramare2015corr at Theorem 1.5, printed p. 2383: the source says the `0.00140/log x` bound starts at `x ≥ 9950` (line 22); its proof checks from `9550` (line 238), and the bound holds from `9550` (it fails at `9549`); affects nothing.
- **Misprint** in ramare2015corr at the proof of Lemma 3.2, printed p. 2384: the source says the identity carries the term `−(1/2 − γ) M(x)/x` (line 93); it should have no such term, since the `M(x)/x` terms cancel and the statement (line 78) omits it; affects nothing.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, p. 1: the source says `|Δ(x)| > 0.4 √x` at `x = 5559` (line 68); it should give a true witness such as `x = 5460` (`Δ = 31.39 > 29.56`), since `Δ(5559) = −0.705`; affects nothing.
- **Error** in balazard2012 at §7, printed p. 10: the source says `∫_1^∞ ε₁(t) dt/t² = 271/360 − γ = 0.1755` (line 482); it should be `3/4 − γ = 0.17278`, numerically `0.1727846`; affects a stated result (the limsup constant).
- **Gap** in moserMacLeod1966 at its first page: the source says Rogers' `Q(x) ≥ 53x/88` holds for all `x` (line 9); it should say for every natural `x ≥ 1`, since it fails at `x = 1.9`; affects nothing.
- **Misprint** in primeNumberTheoremAnd at `mobius-lemma-2-sub-2` (`IEANTN/MobiusLemma.lean`, proof text): the source says `M(√(x/u)) = 0` for `x > u`; it should say for `u > x`; affects nothing.
