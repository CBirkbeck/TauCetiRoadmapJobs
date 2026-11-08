# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 22518c0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4405 lines) and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean` (500 lines, 40 declarations) at `22518c0`.

- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 25 `sorry` warnings and nothing else.
- Of the previous review's five findings, four are repaired and one (R03) is only partly repaired.
- This round's new material is mathematically sound. I re-derived the six-prime criterion and the threshold `89 693²` of 9.3a, Dusart's two-sided form of 8.1a, and the identities of 1.6a and 7.1a. I also recomputed every number in the sampled sections.
- There are four findings, all P3:
  - The `Suggested.lean` docstring and the README Summary disagree on which theorems are headlines (R01).
  - Section 9.3a has no source locator (R02).
  - One citation dropped a supplier's hypothesis (R03).
  - One proof route in 7.8 leaves a small range uncovered (R04).

## R01 (P3) — `Suggested.lean` calls thirteen declarations headlines that the README's list of end theorems omits

- **Location.**
  - `Suggested.lean` lines 23–33: "Headline theorems stated here, in README order: … the identities between the Liouville summatory function and `M`, the transfer of bounds from `M` to it and its `o(x)` (Layer 1.6a); …".
  - README lines 17–31: "The end theorems are Ramaré's transfer theorem …".
- **Claim.** The new declarations are named as headlines in the docstring but not in the README Summary's end-theorem list, so the two files disagree about what the acceptance test is. They fall into two groups:
  - Nine are elementary identities or bounds. They are API, not the deep results `Suggested.lean` is for:
    - `liouvilleSum_eq_sum_moebiusSum`, `moebiusSum_eq_sum_liouvilleSum`, `abs_liouvilleSum_le_of_abs_moebiusSum_le`;
    - `squarefreeCount_eq_sum_moebiusSum`, `integral_moebiusSum_sqrt_div`, `squarefreeRemainder_eq_midpoint`;
    - `pow_cardDistinctFactors_le_zeta_pow_apply`, `zeta_pow_apply_le_pow_cardFactors`;
    - `setOf_isHighlyAbundant_infinite`.
  - Four are genuine headlines but are missing from the Summary: `liouvilleSum_isLittleO`, `mertens_product_dusart`, `not_isHighlyAbundant_lcmUpto` and `not_isHighlyAbundant_lcmUpto_of_criterion`.
- **Witness.**
  - The Summary's end-theorem list (README lines 17–31) names none of 1.6a, 7.1a, 8.1a, the `τ_k` bounds of 9.2, or 9.3a.
  - Two of the nine are proved in the README by a one-line regrouping of sums. Section 7.1a, line 3075: "the pairs `(k, d)`, `k d² ≤ x`, grouped by `k` instead of by `d`". Section 1.6a, lines 1620–1621 give the same kind of argument.
- **Repair.**
  - Add the four deep statements to the Summary's end theorems: `L_λ(x) = o(x)`, Dusart's two-sided cubic Mertens product, the six-prime criterion, and the theorem that `lcm(1, …, n)` is not highly abundant for `n ≥ 89 693²`.
  - Delete the nine elementary declarations from `Suggested.lean`; the README keeps them as targets.
  - Remove the backticks from their names in README 1.6a, 7.1a, 9.2 and 9.3a, since the gate checks every backticked name of this roadmap's own.
  - Rewrite the docstring's headline sentence to match.
  - This was checked on the current file: the remaining four depend only on `liouvilleSum`, `IsHighlyAbundant` and the Mathlib declarations, all of which stay.

## R02 (P3) — 9.3a states the six-prime criterion and the `lcm(1, …, n)` theorem with no source

- **Location.** README lines 4081–4114 ("the six-prime criterion … Route for the criterion … Route for the theorem"). The References (lines 4226–4405) have no entry for this material.
- **Claim.** The criterion and the theorem are taken from existing work: the PrimeNumberTheoremAnd blueprint's treatment of whether `lcm(1, …, n)` is highly abundant, which credits a MathOverflow answer. Yet 9.3a cites no source anywhere. 9.3a is in the seeded sample, and there is no locator to verify it against. The Conventions (lines 260–263) require a locator for every cited claim.
- **Witness.**
  - `grep -n 'blueprint\|MathOverflow\|PrimeNumberTheoremAnd' README.md` gives 0 hits.
  - The six-prime criterion with the factor `(1 + 3/(8n))(1 − 4P/Q)` and the input `p_i ≤ x(1 + 1/log³ x)^i` appear in the PrimeNumberTheoremAnd blueprint. I found it by web search; its text was not read here (Not verifiable).
- **Repair.**
  - Cite the source by section and statement label: the blueprint chapter, and the MathOverflow answer it credits.
  - Add both to References and to the manifest.
  - Check the threshold against that source; the search snippet I saw printed `89 683²`, which may be a transcription slip for the `89 693` of Dusart's interval.
  - The mathematics needs no change. The criterion's route was re-derived and the theorem's constants recomputed (table).

## R03 (P3) — the Banks instance of *RealZeroGap* is cited without its hypothesis `LuZamanZhaoRecord` (previous R03, partly repaired)

- **Location.**
  - README lines 436–439: "and *RealZeroGap* `(3.0·10^{−3}) ∞`, Banks's instance (a preprint), which a statement that uses it takes as a hypothesis".
  - The same at lines 560–563 and line 3826.
- **Claim.**
  - The invented names *LuZamanZhaoSweep* and *BanksGap* are gone, as the previous review asked.
  - But the second instance is now cited without the record under which the supplier states it. The first instance carries "given `LuZamanZhaoRecord`" at all three places.
  - No theorem here is proved from it, so this is a citation defect only.
- **Witness.** ExplicitPrimeCounting at its current head, §1.7, states the second instance as "*RealZeroGap* `(3.0·10⁻³) ∞`, given *LuZamanZhaoRecord*, Banks's instance there", and says both instances are "each given the record *LuZamanZhaoRecord*".
- **Repair.** At lines 438, 562 and 3826 write "*RealZeroGap* `(3.0·10^{−3}) ∞` given `LuZamanZhaoRecord` (Banks's instance, a preprint)".

## R04 (P3) — 7.8: *SquarefreeGapVerified* `10^{18} 18` does not cover Kumchev et al.'s statement for `2 ≤ x < 3.77`

- **Location.** README lines 3509–3510: "for every real `x ≥ 2`, the interval `(x, x + 11 x^{1/5} log x]` contains a squarefree integer; for `x ≤ 10^{18}` this is *SquarefreeGapVerified* `10^{18} 18`".
- **Claim.**
  - A bound of 18 on runs of consecutive non-squarefree integers forces a squarefree integer into `(x, x + L]` only when the interval holds at least 19 consecutive integers, that is when `L ≥ 19`.
  - `11 x^{1/5} log x < 19` for `x < 3.762`, so the proposition does not give the statement there.
- **Witness.** At `x = 3`, `11·3^{1/5}·log 3 = 15.05`; at `x = 2` it is `8.76`. The statement is still true there, since `5` is squarefree and lies in both intervals, but not "by" the proposition.
- **Repair.** Replace "for `x ≤ 10^{18}` this is *SquarefreeGapVerified* `10^{18} 18`" with "for `3.77 ≤ x ≤ 10^{18}` this is *SquarefreeGapVerified* `10^{18} 18` (there `11 x^{1/5} log x ≥ 19`), and on `[2, 3.77)` the interval contains `5`". At `x = 3.77`, `11·3.77^{1/5}·log 3.77 = 19.04`.

## Previous findings (review of `ce19e66`)

- **R01 (P2), the Rankin-type bound** — repaired.
  - README lines 191–195 now list it under "Not owned here" as "ProbabilisticAndMetricNumberTheory §3.7, which precedes this roadmap in the order of supply".
  - The 6.4 Check (lines 2940–2946) derives it as a special case, with the `f = 2^ω`, `x = 10` values `23 ≤ 27.43 ≤ 32.42`.
  - The Downstream consumers bullet is gone.
  - No proof here consumes the bound, so no supplier contract is needed.
  - ProbabilisticAndMetricNumberTheory at `4cea849` still states it at its line 4149 (§3.7).
- **R02 (P2), the records of ExplicitZetaBounds** — repaired.
  - Lines 526–537 state §7.3 "given `RH(3·10¹²)` and `BrentPlattTrudgianRecord`". They state §7.10 "each given `RH(H₀)` and `BrentPlattTrudgianRecord`, and the second and third also given `LeongRecord`".
  - That matches ExplicitZetaBounds §7.10 at its current head: Leong's items need all three; Lee–Leong's `1237 (log t)^{11/12}` needs `RH(H₀)` and the Brent–Platt–Trudgian record; the `e^{146} log t` bound needs "the hypotheses of the second item".
  - Items (a) and (b) of 1.9 (lines 1789–1801), the *Needs:* line (1836–1844) and the Dependencies (1944–1950) name the records.
  - §7.10's new first item (Hiary–Leong–Yang, under `RH(30 610 046 000)`) is not used here.
- **R03 (P3), the invented instance names** — partly repaired (R03 above).
- **R04 (P3), the corrigendum locator** — repaired. Line 2286 cites "`ramare2015corr` lines 76–82, Lemma 3.2 as corrected, p. 2384". I opened those lines: `5 − 4γ₀`, `+(1/x)∫ M(x/t) h'(t) dt`, `h' = (3/2 − γ₀)ε₁' − g'`, `0 ≤ t²|h'| ≤ 7/4 − γ₀` at line 81, `g` at line 87 and `|t²g'| ≤ 1/4` at line 119.
- **R05 (P3), a line locator into an uncertified source** — repaired. `axlerNicolas2023` is now cited only by equation numbers and §1 (lines 981, 4025, 4031, 4034, 4171–4172).

## Verified sound

**Gate, build, order.**

- I ran the gate on this head. Output: `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit status 0. The worker's `gate.md` adds `build=0`.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 237 roadmaps, 2425 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Positions in `ORDER.txt`: ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ProbabilisticAndMetricNumberTheory 61, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, this roadmap 271, ExplicitNumberFields 272. Every supplier is earlier.
- `lake env lean` on `Suggested.lean` printed exactly 25 warnings, all `declaration uses 'sorry'`, at lines 172, 203, 209, 217, 225, 232, 237, 247, 262, 284, 309, 322, 329, 337, 354, 377, 395, 421, 432, 441, 448, 459, 466, 478 and 489.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`), and the diff outside the folder against `origin/main` is empty.

**Signatures and padding.**

- I appended `#check @name` for all 40 declarations (15 definitions, 25 theorems) to a scratch copy and elaborated it.
  - Every elaborated type matches its README statement, and there is no `variable` block.
  - `x ^ (3 / 4 : ℝ)` in `abs_liouvilleSum_le_of_abs_moebiusSum_le` is `Real.rpow`, not ℕ-division.
  - `(ArithmeticFunction.zeta ^ k : ArithmeticFunction ℕ) n` is `τ_k`, with `τ_0 = δ`.
  - `1 - 4 * (∏ p) / ∏ q` parses as `1 − (4P)/Q`.
- One-tactic probe: in a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega | (aesop; done)`.
  - It fails with exactly 25 errors (lines 193, 205, 212, 220, 226, 233, 240, 251, 275, 300, 316, 325, 331, 344, 369, 385, 414, 427, 436, 444, 451, 460, 473, 482, 498).
  - Nothing closes mechanically. R01 concerns what is called a headline, not the probe.
- Headlines:
  - Every end theorem of the Summary is stated.
  - The module docstring names the groups it does not state (1.10, Robin's `σ(n)/n`, the preprint targets) and says why.
  - Every hypothesis of every headline is a true statement where I could test it (table), so none is vacuous.

**Seeded sample: each locator opened at the cited lines** (or recomputed where the source is uncertified).

- **0.5.**
  - `moserMacLeod1966` line 9 (Rogers' `53/88`, equality at `176`).
  - `berkaneBordellesRamare2012` lines 64–68 (Theorem 1.1 and the witnesses `1 980`, `5 559`), line 75 (the `9 994` claim) and lines 182–189 (Corollary 2.2 with `γ² − γ₁`, "for all `t > 0`", (2.2) for `γ₁`).
  - AnalyticNumberTheoryPartI §3.23a (`divisorError`, `BBRFiniteInput` with first conjunct `0.961√x` on `[1, 10^{10}]` and fourth `0.475√x` from `4033`).
- **1.6.** `ramare2015mc`:
  - lines 407–432 (Theorems 1.18–1.19, first row of 1.19 printed `1`, `39/400` from `48 645`);
  - 1441–1453 ((16.1)); 1455–1470 ((16.2)–(16.4));
  - 1504–1512 (Lemma 16.4) and 1546–1554 (Lemma 16.6, printed `1`).
  - `deCamargo2025` is uncertified.
- **2.2.**
  - `ramare2015mc` lines 91–95 (Theorem 1.1) and 100–107 ((1.4), `3/2`).
  - `balazard2012` lines 345–356 ((12), `2α`), 426 (`ε₁`), 444–448 (Proposition 7), 473–482 ((14) and the value `271/360 − γ`; Source issues).
  - `ramare2013aa` lines 728–747 (Lemma 9.1) and 750–759.
  - `daval2025` is uncertified.
- **2.3.** Each locator holds:
  - `ramare2015mc` lines 116–152 (Theorem 1.2 and Corollary 1.3 as printed), 461–478 (Lemmas 2.2–2.3: `58 909 800 + 54 647 032 = 113 556 832`), 545–554 (the chain at line 546 and the check from `619 000`);
  - `ramare2013aa` lines 56–65 (Corollaries 1.2–1.4);
  - `bordelles2015` lines 64–69 and 76–77.
- **2.4.** Each locator holds:
  - `ramare2015mc` lines 248–274 (Lemma 1.9), 297–307 (`0.78`, `5/16` from `687`, `17/125` from `24 233`), 314–325, 329 (`31/105`), 1020–1025 (Lemma 7.4, `0.779`), 1083–1089 (Lemma 8.3), 1104–1109 ((9.1));
  - `ramare2014aa` lines 74–81;
  - `bordelles2015` lines 86–100 (`⌈C₁⌉ = 12 555`, `⌈C₁₀⌉ = 6723`).
- **2.5.**
  - `moserMacLeod1966` line 76 ((8); the OCR is garbled).
  - `trevino2015ijnt` lines 276–278 (the same bound, "for `x ≥ 2`").
  - `trevino2015jnt` is uncertified.
- **2.6.** `ramareZunigaAlterman2025` is uncertified; the constants were recomputed (table).
- **3.3.**
  - `ramare2015mc` lines 264–265 and 278–285 (Corollary 1.10, `1.00303`, optimal `m̌(30)`).
  - `ramare2013facm` lines 21–38 (Theorem 1.1, `−(11/15)(1 + ε)`) and 54–63 (Theorem 1.2, `0 ≤ ε ≤ 1.38`).
- **3.4.** `daval2025` is uncertified; the extremal value was re-derived (table).
- **5.2.**
  - `berkaneBordellesRamare2012` lines 182–189.
  - `cullyHugillTrudgian2021` lines 193–199 (`1.16 → 1.641`, (14) with `c = 1.001` from `6·10^5`) and 238–242 (`F₁`, `x₀ = 5560`).
  - `ramare1995` lines 356–366 (Lemma 3.3, `0.9105`).
  - `trudgian2015` lines 426–432 (Lemma 14 "for all `t > 0`").
- **5.4.** `akhileshRamare2017` lines 135–167 (Theorem 1.3 and `ℛ`, as stated), 202–224 (Theorem 1.4, `6/11` at `η = 1`) and 319–339 (Lemma 2.1, the definition of `R`).
- **7.1.** Each locator holds:
  - `moserMacLeod1966` lines 8–14 and 81;
  - `ramare2013aa` lines 261–276 ((4.5)–(4.7), Lemma 4.6);
  - `cipu2015` lines 621–626 (Lemma 4.2, (a) for real `x ≥ 1`);
  - `ramare2016mc` lines 450–461 (Lemma 3.4 and the `O*(3/N^{1/3})` identity);
  - `ramare2019bcp` lines 84–88.
- **7.1a.** No source is cited; the identities were re-derived (table).
- **7.8.** `chirreHelfgott2025`, `kumchevEtAl2023` and `mossinghoffOliveiraESilvaTrudgian2021` are uncertified; the numbers were recomputed (R04, table).
- **9.3a.** No source is cited (R02); the mathematics was re-derived (table).
- **Also opened:** `ramare2015corr` lines 74–90 and 116–120 (R04 of the previous review).

**Adversarial table.** Every value below was computed in this review, in long double:

- sieves of `μ`, `Ω` and the squarefree count to `2.2·10⁷`;
- `τ` to `1.1·10⁶`;
- the primes to `4.7·10⁷`;
- `σ` to `12 252 241`.

On each `[N, N + 1)` the carriers are constant, so the real-argument extremes were taken at both ends. The interior critical point was added where the weight makes one possible: `u|au − b|` and `u²|au − b|` for `m̌`, and a fine grid for `Σ τ(n)/n − P(t)` below `1000`.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.5 carriers, `γ₁`, `Δ` | `R(1)`, `R(176)`, `R(0.5)`; `γ₁` at `N = 10, 10⁶`; `Δ` at `1, 4, 12, 1980, 5460, 5559` | `0.3921`, `106 − 106.995 = −0.9952`, `−3/π²`; `0.04123` against `γ₁ + log 10/20 = 0.04231`, `−0.072809`; `0.8456, 1.8371, 3.3279, 22.3388 > 22.249, 31.3907 > 29.557, −0.7053`; `Σ_{≤10⁶} τ/n − ½log² − 2γ log = 0.478901` against `γ² − 2γ₁ = 0.4788096` (`γ² − γ₁ = 0.405994`, `γ² + 2γ₁ = 0.187546`) | sound | — |
| 1.5 `abs_moebiusSum_le_ramare` | `D = 2 161 205`; `[1 078 853, 2.2·10⁷]` | `|M| = 466 ≤ 727.53`; largest `|M|/bound = 0.9974` at `1 078 853` (`349 ≤ 349.915`); last violation `1 078 852` (`350`) | sound | — |
| 1.6 Theorems 1.18–1.19 | `2 ≤ q ≤ 400`, `x ≤ 2·10⁴`; `q = 1`, `x = 5` | `(φ(q)/q)(1 + log(x/q))|M_q|/x ≤ 0.4418` (at `q = 2`, `x = 13`), `0.5891` with `∏(1 + 1/p)^{−1}`; `1.0438 > 1` (printed row); `max log x|M|/x` on `(1, 3000]` `= 0.6437752` at `5` | sound | — |
| 1.6a identities, transfer, `o(x)` | `x = 31`, `10⁶`; `n ≤ 10⁶`; `ε < 0` | `−4 − 2 − 1 + 1 + 1 = −5 = L(31)`, `−5 + 1 + 1 − 1 = −4 = M(31)`; `Σ_{w≤1000} M(10⁶/w²) = −530 = L(10⁶)`, `Σ|·| = 1838`; `L(10^k) = 0, −2, −14, −94, −288, −530`; no `L(n) > 0` on `[2, 10⁶]`; `max |L| log x/x = 6 log 32/32 = 0.64983`; `(π²/6)·0.026 = 0.042768`, `2x^{3/4} ≤ 0.049 x/log x` from `1.75·10¹²` (ratio `40.80`); `ε < 0` makes the hypothesis false | sound | R01 |
| 2.1 `abs_moebiusDivSumIn_le_one` | `S = ∅`, `{2}`, `{2, 3}` at `6`, all primes at `13` | `1`, `1/2`, `1/3`, `−0.07736` | sound | — |
| 2.2 `abs_moebiusDivSum_le_balazard`; `I(1)` | `x = 1, 2`; numerical `∫ ε₁'(t) dt/t` | `1 ≤ 11/3`; `1/2 ≤ 1/4 + 4/3`; `0.172784 = 3/4 − γ`, against Balazard's `271/360 − γ = 0.175562` | sound | — |
| 2.3 thresholds | real `x ≤ 2.2·10⁷` | last violating intervals: `1/12` at `686`, `1/20` at `3354`, `1/25` at `3461`, `1/40` at `24 269`, `1/65` at `96 017`, `1/69` and `0.0144` at `96 954` (`0.0145113` as `x → 96 955⁻`; max `0.0143930` on `[96 955, 463 421]` as `x → 96 961⁻`); `|m| > 1/10, 1/20, 1/100` last at `6, 40, 1418`; Daval: `m(120 560) = 0.001118763`, `0.013089`, twelve integers in `[119 543, 120 559]`, `0.012992` at `120 561`, none on `[120 561, 1.3·10⁶]`; Theorem 1.2 and Corollary 1.2 (2013): no violation to `2.2·10⁷`; `|m(32)| = 0.06273 > 0.05482` | sound | — |
| 2.4 Theorems 1.12–1.13 | `q = 1`; Lemma 7.4 at `y → 11⁻`; `m₆(30)` | `sup = log 2` (`x → 2⁻`), `0.5493` beyond; `0.32659·log 11 = 0.78312 > 0.779`, `0.75201` at `10`; `0.299894 ≤ 3·0.784/log 5 = 1.4614`; `C₁ = 12 554.9` | sound | — |
| 2.5 tails | worst points of `[1, 5000]`; `[2, 2.2·10⁶]`; switch point | `0` violations of `1/D`; `0` of `1/(3D) + 8/(3D²)`; `3/(80D) + 11.025/D² ≤` it iff `D ≥ 28.254`; tail at `28` `= −0.001389` against `0.01467` | sound | — |
| 2.6 Corollary 1.2 (RZA) | `X = 617 990` | `1.5·0.006688 = 0.010032`; `4.33·10⁻⁴` against `5.18·10⁻⁴` (Ramaré) and `9.75·10⁻⁴` (Daval) | sound | — |
| 3.1 `abs_moebiusLogSum_sub_one_le` | `x = 1, 2` | polynomial part at `1`: `−1` (`−2` with the printed `6 − 4γ`); at `2`: `0.3069 ≤ 1.293` | sound | — |
| 3.2 rows | real `x ≤ 2.2·10⁷` | last violating intervals: `0.0203` at `6`, `1/396` at `3161`, `1/714` at `9548`, `0.00140/log x` at `9549` (stated from `9950`), `0.213` none from `2`; Corollary 1.6 at `6, 43, 221` | sound | — |
| 3.3 Corollary 1.10 | `m̌` on `[1, 2.2·10⁷]`; `q = 2`, `x = 4` | max `1.0030213` at `x = 30`, min `0` at `1`; `m̌₂(4) = 1.2904 ≤ 2.006` | sound | — |
| 3.4 extremal value | `[2, 3)`; `[3, 2.2·10⁷]` | `u = 2(2 − log 2)/3 = 0.871235`, value `2(2 − log 2)³/27 = 0.165328`; `sup (log² x)|m̌ − 1| = 0.126373 < 0.162` | sound | — |
| 5.1 `norm_sum_mul_sub_le_comparison` | `h = δ`; weighted factor | conclusion `=` hypothesis; `Σ_{≤10⁶} τ = 13 970 034` (`U = 2A H(0)`); `2.5` at `1/3`, `8/3` at `2/5` | sound | — |
| 5.2 `sum_tau_div_model` | `[1, 6·10⁵]`; `(0, 1)`; `t = 0.01`; other forms | `0.65418` (`t → 2⁻`) `≤ 1.16`; `1.640819` at `log t = −7.2163` `≤ 1.641`; `5.7663 > 5.3842`; `t^{1/2}`: `0.87813` at `24⁻`; `t^{2/5}`: `1.050286` at `0.0019727`, `0.68762` at `6⁻`; `(2.883/1.16)⁶ = 235.68` | sound | — |
| 5.4 Theorems 1.3–1.4 | `g = δ`; `g = μ` | `G♯ ≡ 0`, `ℛ = 6/(11D)`; main term `(log D + γ)·0 + 1 = 1`, `G♯ = −m` | sound | — |
| 6.3 `sum_le_hall_tenenbaum` | `f = 1`, `x = 10` | `10 ≤ 4.3686·(10/log 10)·H₁₀ = 55.57` | sound | — |
| 7.1 squarefree | `[1, 2.2·10⁷]` | `R(n)/√n ∈ [−0.1032287 (380), 0.6790902 (3)]`; real inf `−0.1526320` (`x → 2⁻`); `R(351 115) = 21.6756 > 21.5913`; `0.02767`: last integer `437 780`, last real interval `[441 352, 441 353)`; `0.1333` last at `1663`; `0.5√x` last on `[7, 8)`; `1.06√(x/log x)`: none on `(1, 1.1·10⁶]`; `R/x^{1/4} ∈ [−0.86845, 1.11652]` on `(1, 3·10⁶]`; `Σ μ²/n − (6/π²) log N ∈ [0.57862, 1.16546]`, `[1.04049, 1.04707]` from `1000` | sound | — |
| 7.1a three identities | `x = 10, 100, 1000`; `x = 10.7`; `K = 0`, `K > ⌊x⌋ + 1` | `Q = 7 = −1 + 0 + 8`, `61`, `608`; `∫₀ˣ M(√(x/u)) du = x Σ μ(d)/d²` (Fubini, integrand `≤ √(x/u)`); at `K = 2`: `−1 + 1.52017 − (−0.175 + 0.2) = 0.49517 = R(10.7)`; both degenerate cases reduce to `Q(x) − ∫₀^∞` | sound | R01 |
| 7.8 Chirre–Helfgott, Kumchev et al. | `(0, 2.2·10⁷]`; crossing; `x = 2, 3` | `sup |R|/x^{2/5} = 0.80100` (at `7`) `≤ 0.845`; at `5.16·10¹⁰`: `48 457` against `48 480`; `11x^{1/5} log x = 8.76, 15.05 < 19` | gap below `3.77` | R04 |
| 8.1 `mertens_product_explicit` | `[24 284, 4.7·10⁷]`, both ends of every prime gap | hypothesis `|E| ≤ 1/L³`: 0 violations; four inequalities: 0 violations | sound | — |
| 8.1 `mertens_product_axler` | `(1, 4.7·10⁷]`; `(1, 392 687)` | `min (E + η_A) = 1.32·10⁻⁵ > 0` (at `36 917 071`); `(Q₁ − 1)L³ < 0` throughout; the lower form holds from the prime `46 909 033` (stated from `46 909 038`) | sound | — |
| 8.1a `mertens_product_dusart` | `x = 2 278 379 … 2 278 383`; `[2 278 382, 46 909 074]` | at `2 278 382`: `(Q₁ − 1)L³ = −0.199960`, `(Q₂ − 1)L³ = 0.199973`; failures up to `2 278 381.5756` and `2 278 381.7111`; `E·L³ = 0.200011` at `2 278 382`, `≈ 0.199917 ≤ 0.19992` at `2 278 383`; min margins at `3 445 943`: `−0.198397`, `0.198409`; 0 violations; `0.19992 e^{0.19992/3137.13} = 0.199933 < 0.2`; route re-derived from the two hypotheses | sound | R01 |
| 9.1 `cardDistinctFactors_le_robin` | primorials `k = 3 … 11` | `k log θ/θ = 1.079732, 1.254178, …, 1.384013 (k = 9), 1.380022, 1.377530` | sound | — |
| 9.2 `sigma_zero_le_nicolasRobin` | `6 983 776 800`; `5040` | `f₂ = 1.537940 ≤ 1.538` (`> 1.5379`); `1.484851` | sound | — |
| 9.2 `k^ω ≤ τ_k ≤ k^Ω` | `n = 12`, `30`; `k = 0, 1`; `n = 0` | `4 ≤ 6 ≤ 8`, `9 ≤ 18 ≤ 27`; `27 = 27 = 27`; `k = 0`: `δ(n)` on all three sides; `k = 1`: `1 = 1 = 1`; `τ_k(0) = 0 < 1 = k^{ω(0)}`, so `n ≠ 0` is needed | sound | R01 |
| 9.3a criterion and theorem | `n ≤ 30`; `ℓ_n`, `n ≤ 18`; `n = 10⁴, 10⁶, 70`; `n = 89 693²` | highly abundant `≤ 30`: `1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30`; every `ℓ_n` (`n ≤ 18`) is highly abundant; `3.01145` against `3.09989` (`·10⁻⁴`); `3.00008` against `3.28775` (`·10⁻⁶`; without the `4`: `2.91588`); `1.0490 > 0.9807`; `ε = 6.7424·10⁻⁴`, `(lhs − 1)n ≤ 3.00405 < 3.36685 ≤ (rhs − 1)n`; 2-adic factor `1 + 3/(2^{j+3} − 4) > 1 + 3/(8n)`; `Q` odd since `p₁ ≥ 3` | sound | R01, R02 |
| 9.4 `div_totient_lt_rosserSchoenfeld` | primorials `k = 3 … 11` | `(N_k/φ − e^γ log log N_k) log log N_k = 1.921562, …, 2.506369 (k = 9), 2.427590, 2.404171` | sound | — |
| §1.7 contract | ExplicitPrimeCounting §1.7 | Banks instance "given *LuZamanZhaoRecord*" there, missing here | citation | R03 |

**Library declarations opened at the pins.**

- Mathlib:
  - `Nat.lcmUpto` (`NumberTheory/Chebyshev.lean` line 211), `Nat.factorization_lcmUpto` (220), `Chebyshev.psi_eq_log_lcmUpto` (311);
  - `ArithmeticFunction.liouville` (`NumberTheory/ArithmeticFunction/Liouville.lean` line 31: ℤ-valued, `0` at `0`, `(−1)^{Ω(n)}` otherwise) and `isMultiplicative_liouville` (51);
  - `isMultiplicative_zeta` (`ArithmeticFunction/Zeta.lean` 193), `IsMultiplicative.pow` (`ArithmeticFunction/Defs.lean` 651);
  - `hasSum_zeta_two` (`NumberTheory/ZetaValues.lean` 453), `Nat.primesLE` (`NumberTheory/PrimeCounting.lean` 133).
- Neither pin has a Liouville-convolution identity, a highly abundant number, a bound `k^ω ≤ τ_k`, or a squarefree count through `M`. The Tau Ceti hits for "liouville" are Liouville numbers only.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting (#1945, `866c1b0`):
  - §0.1 (line 542, `S(u)` and Büthe's `58/√u`);
  - §1.1 (947); §1.3 (1042, *ButheVerified*); §1.6 (1178–1180); §1.7 (1185–1203);
  - §3.2 (1815–1816); §3.3 (1872); §3.5 (2083);
  - §4.2 (2367–2368, `0.0067` from `1.52·10⁶`, `1/(4 log x)` from `115`);
  - §4.3 (2423, 2461–2468, including the row `(0.19992, 2 278 383)`);
  - §4.7 (2619); §5.3 (2711–2713); §6.1 (2900); §6.3 (2962–2966);
  - §7.4 (Dusart: a prime in `(x, x(1 + 1/log³ x)]` for every `x ≥ 89 693`).
- ExplicitZetaBounds (#1954, `faca04c`): §0.2 (437), §0.4 (538), §0.4b (581, `LeongRecord`, `BrentPlattTrudgianRecord`), §4.1 (1304), §4.3 (1373), §4.8 (1730), §4.10 (1860), §6.1 (2148), §7.3 (2504, 2554), §7.10 (2975–3010).
- ExplicitCharacterSumsAndSieves (#1948, `b701b75`): §5.1 (1275–1277, `selbergDiagonal`).
- AnalyticNumberTheoryPartI (#1126, `e22e67a`):
  - §§0.11 (299), 0.19 (572), 0.21 (592), 0.26 (667), 0.34 (847);
  - §1.2 (911, `davenport_moebius`, `y ≥ 2`, sup over `α`);
  - §§3.1 (2154), 3.7 (2241), 3.9 (2283), 3.11 (2305), 3.12 (2315), 3.22 (2528);
  - §3.22a (2540), §3.22b (2546), §3.23a (2573–2597), §3.35 (3113).
- SieveMethodsAndPrimePatterns (#1495, `a0ce011`): §0.5 (517–519), §1.1 (1070, dimension `κ` asymptotic).
- ProbabilisticAndMetricNumberTheory (#1421, `4cea849`): §3.7 (4131, 4149).
- ZerosOfLFunctions on main: Layer 9 (1586), *AllOnCriticalLine* (1619).
- ExplicitNumberFields (#1944, `e163ff8`) cites §§1.2, 2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4 and two Layer 0.7 propositions of this roadmap; all exist at this head.
- `citations.md` and `overlaps.md` list nothing.

**Ownership and duplication.** I ran `roadmaps grep` over main and the open heads for the new objects. No other roadmap owns them:

- the Liouville summatory function (only an erratum line in SieveMethodsAndPrimePatterns);
- highly abundant numbers and `lcmUpto`;
- the squarefree count through `M` (AnalyticNumberTheoryPartI's `restrictedSquarefreeCount` is a different object);
- `k^ω ≤ τ_k` (ProbabilisticAndMetricNumberTheory proves only that `k^ω` is multiplicative);
- Dusart's cubic product (ExplicitPrimeCounting states only the reciprocal sums).

**Declared gaps.** The plan has 17 slugs.

- Five are stated as contracts under their slugs (lines 471–499). ExplicitPrimeCounting at its head still does not state `0.8 √x`, `η_A`, `2.58843`, `0.05/√x` or `8.96237`, so these remain genuine gaps.
- The first clause of `gap:psi-initial-range` (`√x` on `[8, 10^{10}]`) follows from *ButheVerified*. README lines 429–431 say so, and that roadmap's consumers paragraph agrees.
- `gap:zeta-reciprocal-bounds` is met by ExplicitZetaBounds §7.10, as lines 544–552 say.
- The other eleven resolve to the ExplicitPrimeCounting sections above.

## Not verifiable

- `leong2026`: the cached text is image-only and OCR is not available on this worker. Items (a) and (b) of 1.9 were not re-read. The `[[missing]]` entry already in `needs-references.toml` stands.
- The 9.3a source: the PrimeNumberTheoremAnd blueprint section and the MathOverflow answer it credits were located by web search but not read. One fetch returned a different chapter and another a 404. Its threshold (a search snippet shows `89 683²`) could not be checked.
- Uncertified sources, cited by locator. Their numbers were recomputed where possible (table):
  - `daval2025`, `daval2023` (1.8, 2.3, 3.4);
  - `deCamargo2025` (1.6, 2.4);
  - `trevino2015jnt` (2.5);
  - `ramareZunigaAlterman2025` (1.10, 2.6);
  - `chirreHelfgott2025`, `kumchevEtAl2023`, `mossinghoffOliveiraESilvaTrudgian2021` (7.8);
  - `dusart2018`, `axler2018` (8.1, 8.1a, 9.3a input);
  - `plattTrudgian2018`, `rieselVaughan1983` (5.2);
  - `cohenDressElMarraki2007` (1.3, 7.1);
  - `robin1984`, `axlerNicolas2023` (9.3, 9.4).

## Source issues

- **Error** in balazard2012 at §7 after Proposition 7, (14), p. 10 (line 482): the source says the integral of `ε₁(t)/t²` over `[1, ∞)` equals `271/360 − γ = 0.1755`; it should be `3/4 − γ = 0.172784` (numerically `0.172784`; the periodic `B₄` adds `1/360`); affects a stated result.
- **Error** in ramare2015mc at Theorem 1.2, p. 1361 (lines 130, 136): the source says `(log x)|m(x)| ≤ 1/65` from `60 298` and `≤ 1/20` from `1426`; they fail up to `96 017` and `3354`, so the thresholds should be `96 018` and `3355`; affects a stated result.
- **Error** in ramare2015mc at Corollary 1.3, p. 1361 (line 152): the source says `|m(x)| ≤ 1/100` from `694`; `|m(1109)| = 0.011657`, last violation `1418`; the threshold should be `1419`; affects a stated result.
- **Error** in ramare2015mc at Theorem 1.19 and Lemma 16.6, pp. 1365 and 1385 (lines 428, 1554): the source says the first row holds with `1` for `x/q > 1`; at `q = 1`, `x = 5` the left side is `1.0438`; it should be `1.566` (the star-sum maximum); affects a stated result.
- **Error** in ramare2015mc at Lemma 7.4, p. 1376 (line 1025): the source says `0.779/log x` for every `x > 1`; as `y → 11⁻` the sum times `log y` tends to `0.78312`; it should be `0.784`; affects the proof.
- **Gap** in ramare2015mc at Theorems 1.12–1.13, pp. 1363–1364 (lines 305, 323–324): the source says `5/16` from `687`, `5/38` from `882`, `1/7` from `11 811`; its proof gives `0.320`, `0.320`, `0.143` (lines 1087, 1108); affects the proof.
- **Gap** in ramare2015mc at the proof of Theorem 1.2, p. 1367 (lines 541–548): the source says the part `t ≥ x/D₀` is at most `58 909 800/x²`; that is the integral of `M` over `{M ≥ 0}` only; it should use `113 556 832`; affects the proof.
- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`; affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 of the text read (line 186): the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁` (`0.478901` at `10⁶` against `0.4788096`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2 (line 182): the source says it holds for all `t > 0`; at `t = 0.01`, `|P| = 5.7663 > 5.3842`; it should be `t ≥ 1`; affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, p. 1 (lines 66–68): the source says `0.397√x` from `5560` with witness `5559`; for real `x` it fails as `x → 7560⁻` (`−35.037` against `34.518`), and `Δ(5559) = −0.7053`; it should be `x ≥ 7560` (integers from `5461`), witness `5460`; affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.2, p. 2 (line 75): the source says `|Δ(9994)| > 0.80·9994^{1/3} log 9994`; `Δ(9994) = −2.530`; it should name no such witness; affects nothing.
- **Gap** in cullyHugillTrudgian2021 at Theorem 1, p. 6 (line 240): the source says it uses `α = 0.397` at real arguments from `x₀ = 5560`; that row fails below `5760`, `6720` and `7560`; it should take `x₀ = 7560` (`F₁ = 4.473 ≤ 4.48`); affects the proof.
- **Error** in trudgian2015 at Lemma 14, p. 10 (lines 426–430): the source says the `1.16` model holds for all `t > 0`; `sup_{(0,1)} |P(t)| t^{1/3} = 1.640819`; it should be `t ≥ 1`, or `1.641` on `t > 0`; affects a stated result (Lemma 13).
- **Error** in cipu2015 at Lemma 4.2(a), p. 214 (line 623): the source says `R(x) ≥ −0.103229√x` for real `x ≥ 1`; as `x → 2⁻` the ratio tends to `−0.152632`; it should be stated at integers; affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(c), p. 214 (line 625): the source says `|R(x)| ≤ 0.036438√x` from `82 005`; `R(351 115) = 21.6756 > 21.5913`; it should exclude that point or raise the constant; affects a stated result.
- **Error** in daval2025 at Théorème 2 (as quoted; the text was not opened): the source says `(log x)|m(x)| ≤ 0.0130073` from `97 603` (arXiv `97 063`); it is `0.013089` at `120 560`; it should be `x ≥ 120 561`; affects a stated result.
