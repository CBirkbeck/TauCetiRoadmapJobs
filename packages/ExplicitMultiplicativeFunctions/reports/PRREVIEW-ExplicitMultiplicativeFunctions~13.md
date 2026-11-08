# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 3288be4)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4507 lines) and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean` (419 lines; 30 declarations: 14 definitions and 16 theorems) at `3288be4`.

- The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with 16 `sorry` warnings and nothing else.
- Both findings of the previous review (at `9e50e8c`) are repaired.
- Five suppliers moved since that review:
  - ExplicitPrimeCounting is now at `832c4bf`;
  - AnalyticNumberTheoryPartI at `979e68c`;
  - SieveMethodsAndPrimePatterns at `f07c3fe`;
  - ProbabilisticAndMetricNumberTheory at `9c6663c`;
  - the consumer ExplicitNumberFields at `016bb4a`.
  
  I re-resolved every citation into them, and every one holds.
- There are four findings:
  - R01 (P2): one finite computation in the sampled section 3.3 is named nowhere, and the route credits it to a proposition that cannot express it.
  - R02, R03 and R04 (P3): a Check of 8.1a that disagrees with the Check above it, two inaccurate statements around 8.2, and two `*Needs:*` lines plus one symbol left inconsistent by the repair of 5.2.

## R01 (P2) — 3.3: the bound `m̌(y) ≤ m̌(30)` on `[1, 44)` is a finite verification that no proposition states

- **Location.** README 3.3:
  - lines 2439–2441: "Balazard's theorem `0 ≤ m̌(x) ≤ m̌(30)` for `x ≥ 1`, cited at lines 284–285 and proved here from Theorem 1.4 beyond the source's `D₀` and *MoebiusLogRangeVerified* below";
  - the *Needs:* line, lines 2448–2449: "beyond `x₀` and *MoebiusLogRangeVerified* below".
- **Claim.**
  - The upper half of Corollary 1.10, `m̌_q(x) ≤ 1.00303 q/φ(q)`, rests on `m̌(y) ≤ 1.00303` for every `y ≥ 1`.
  - *MoebiusLogRangeVerified* `ε a b` is two-sided about `1`: it says `|m̌(x) − 1| ≤ ε(x)`. It therefore gives `m̌ ≤ 1.00303` only where `ε ≤ 0.00303`. Any instance whose range contains `1` needs `ε(1) ≥ 1`, because `m̌(1) = 0`.
  - Below `44`, none of the inputs this README lists gives the upper bound:
    - `1/√x` from `1`;
    - `0.0218/√x` from `11`, which is `0.00398` at `x = 30`;
    - Corollary 1.6's `1/125` from `7`.
    
    From `44` on, Corollary 1.6's `1/500` row gives `m̌ ≤ 1.002`.
  - Theorem 1.4 with the trivial bound `|M(t)| ≤ t` gives only `|m̌(x) − 1| ≤ 0.59 + 2/x`. Neither `D₀` nor `x₀` is defined in 3.3.
  - The step on `[1, 44)` is a check of `m̌` interval by interval with logarithms of primes, which no library enclosure settles. By the Conventions it is a named proposition, and here it has none.
- **Witness.**
  - I computed `m̌` at both ends of every unit interval of `[1, 10⁶]`, and at the interior extremum where one exists.
  - Its maximum is `m̌(30) = 1.0030213`, and `m̌(1) = 0`.
  - `m̌` exceeds `1.002` on parts of `[16, 19)`, `[28, 31)` and `[41, 44)`.
  - The last interval violating `|m̌ − 1| ≤ 1/500` starts at `43`.
- **Repair.**
  - In Layer 0.7, add *MoebiusLogUpperRangeVerified* `c a b`: `m̌(x) ≤ c` for every real `x ∈ [a, b]`. Its instance is `(m̌(30), 1, 44)`, the computation behind `balazard2012` line 717 (the footnote, printed p. 13) and `ramare2015mc` lines 284–285.
  - In 3.3, write: "`m̌(y) ≥ 0` is the first row of Corollary 1.6 (3.2). `m̌(y) ≤ m̌(30)` is *MoebiusLogUpperRangeVerified* `(m̌(30)) 1 44` on `[1, 44]` and the `1/500` row of Corollary 1.6 beyond."
  - In the *Needs:* line, replace "3.1 (… beyond `x₀` …)" by "3.2 (Corollary 1.6); Layer 0.7 (*MoebiusLogUpperRangeVerified*)".
  - Add a Check: the instance holds with equality at `x = 30`, and `(1.0030, 1, 44)` fails there.
  - Tested on the instance that refuted the route:
    - on `[44, 10⁶]` no interval violates `1/500`, so `m̌ ≤ 1.002 < m̌(30)` there;
    - on `[1, 44]` the maximum is `m̌(30)` itself.

## R02 (P3) — 8.1a: a Check puts the smallest margin at the wrong point

- **Location.** README 8.1a, Checks, lines 3842–3843: "At both ends of every interval between consecutive primes in `[2 278 382, 46 909 074]` both inequalities hold; the smallest margin is at the prime `3 445 943`".
- **Claim.**
  - `x = 2 278 382` lies in that range. The Check just above it (lines 3835–3836) gives the two quotients there as `1 − 0.199960/log³ x` and `1 + 0.199973/log³ x`.
  - Those margins are smaller than the `0.198397` and `0.198409` quoted for `3 445 943`.
  - The two Checks of one section therefore contradict each other. `3 445 943` is the point of smallest margin only from the prime `2 278 421` on.
- **Witness.** I computed both quotients, in long double, at both ends of every prime gap in `[2 278 382, 46 909 074]`:
  - the largest value of `(1 − Q₁) log³ x` is `0.199960`, at `x = 2 278 382`;
  - over the gaps that start at primes `≥ 2 278 421`, it is `0.198397` at `3 445 943`, and `(Q₂ − 1) log³ x` is `0.198409` there.
- **Repair.** Replace the clause with: "the smallest margin is at `x = 2 278 382` (the Check above); beyond the prime gap `[2 278 379, 2 278 421)` it is at the prime `3 445 943`, where …". The same computation confirms both values.

## R03 (P3) — 8.2 and its deferral under Scope: two inaccurate statements

- **(a) Location.** Scope, lines 165–167: "its input is that paper's Theorem 4, a remainder for `Σ_{p ≤ x} 1/p` in terms of `ψ(x) − x`".
  - **Claim.** Vanlalngaia's Theorem 4 is stated with the term `(θ(x) − x)/(x log x)`, not with `ψ(x) − x`.
  - **Witness.**
    - `vanlalngaia2017` lines 91–92 state the theorem.
    - Lines 427–429 prove it by Abel summation against `dθ`; there the glyph `#` is `θ`, and line 218 separates it from `ψ`.
    - ExplicitPrimeCounting §4.3 at `832c4bf` describes it the same way and uses it only inside the route of Vanlalngaia's Corollary 3.
  - **Repair.** Write: "in terms of `θ(x) − x`, which no section of ExplicitPrimeCounting states (its §4.3 uses it only inside the route of Vanlalngaia's Corollary 3)". The reason for the deferral then still holds.
- **(b) Location.** 8.2, line 3866: "since there `1/(x − 1) ≤ 3·10^{−6}/log³ x` and `z ≤ 1/10 648`".
  - **Claim.** The second inequality is false at the edge of the stated range.
  - **Witness.** At `|ε| = 1` and `x = e^{22}`, `z = 1/10 648 + 1/(e^{22} − 1) = 9.391463·10^{−5}`, which exceeds `1/10 648 = 9.391435·10^{−5}`.
  - The conclusion still holds there: `z e^z = 9.392345·10^{−5} ≤ 1.0001/10 648 = 9.392374·10^{−5}`.
  - **Repair.** Write: "`z ≤ |ε|(1 + 3·10^{−6})/log³ x ≤ 1.000003/10 648` (using `|ε|²/(2 − |ε|) ≤ |ε|` for `|ε| ≤ 1`), so `z e^z ≤ 1.0001 |ε|/log³ x`". I tested it at `|ε| = 1`, `x = e^{22}`.

## R04 (P3) — after the repair of 5.2: two *Needs:* lines and one symbol

- **Location and claim, 7.6.**
  - The *Needs:* line (lines 3525–3526) reads "5.2 (the second and fourth forms, with *DivisorHarmonicRangeVerified* `1.16 1 236`)".
  - 7.6's two sharper forms use the fourth form of 5.2, which carries *DivisorPowerRangeVerified* `7560² (6·10^5)`. 5.2 says so twice: "The fourth is proved from the third on `[2, ∞)`" (line 2628), and in its *Needs:* line, "*DivisorPowerRangeVerified*, for the third and fourth forms".
  - 7.6 lists one proposition explicitly and omits this one.
- **Location and claim, Layer 5 Dependencies.** Lines 2890–2891 give *DivisorPowerRangeVerified* "for the third form of 5.2" only.
- **Location and claim, 5.5.**
  - Lines 2771 and 2795 write the Meissel–Mertens constant as `M`: "`Σ_{p ≤ X} 1/p = log log X + M + o(1)`".
  - Throughout the roadmap `M` is the Mertens function `M(x)`, and the constant is `B = mertensConstant ℚ` (8.1). Inside 5.5 the letter `B` is already taken by the error constant.
- **Repair.**
  - 7.6 *Needs:* "5.2 (the second form, with *DivisorHarmonicRangeVerified* `1.16 1 236`; the fourth form, with *DivisorPowerRangeVerified* `7560² (6·10^5)`)".
  - Layer 5 Dependencies: "for the third and fourth forms of 5.2".
  - 5.5: write "`log log X + mertensConstant ℚ + o(1)`" (or a fresh letter such as `B_M`) at both places.

## Previous findings (review of `9e50e8c`)

- **R01 (P2), 5.5: the Euler product need not converge absolutely, and the route's Dirichlet series was shifted** — repaired.
  - Lines 2765–2767 now define `C` with truncated local factors: "`C = Γ(κ + 1)^{−1} lim_{X → ∞} ∏_{p ≤ X} (Σ_{ν ≥ 0, p^ν ≤ X} g(p^ν)) (1 − 1/p)^κ`". Lines 2767–2776 prove that the limit exists.
  - Lines 2782–2789 identify `C` through `Σ g(d) d^{−s} = ζ(1 + s)^κ Φ(s)`, with `Γ(κ + 1) C = lim_{s→0⁺} Φ(s)` and Abel's theorem.
  - The repair also proves the truncation necessary: the Check at lines 2820–2831 takes `g(p²) = 1/p`.
  - I checked each step:
    - `Σ_p (Σ_ν g(p^ν))² ≤ A/log 2` follows from the second hypothesis because `g ≥ 0` and `log p^ν ≥ log 2`;
    - `Φ` converges absolutely for `s > 0`;
    - Abel's theorem applies to the convergent series `Σ_{p^ν ≤ X} g(p^ν) − κ Σ_{p ≤ X} 1/p`.
  - I recomputed both Checks (table).
- **R02 (P3), 5.2 folded a finite check into a headline** — repaired along option (a).
  - `sum_tau_div_model` is now stated for `t ≥ 236` (`Suggested.lean` lines 255–264).
  - *DivisorHarmonicRangeVerified* (lines 950–953) and *DivisorSmoothedRangeVerified* (lines 954–956) are new propositions, and the Conventions name both (lines 262–264).
  - 5.2 (lines 2618–2624 and 2645–2659) and 7.4 (lines 3364–3374) state the full ranges as conjunctions.
  - The docstring's sentence (lines 18–21) now holds for every headline.

## Verified sound

**Gate, build, order.**

- The gate on this head printed `gate ExplicitMultiplicativeFunctions: set_option=0 … source-material=0 OK` and exited with 0. The worker's `gate.md` adds `build=0`.
- The dependency check (`gate --depcheck … --movable`) printed `depcheck: 235 roadmaps, 2425 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Positions in `ORDER.txt`: ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ProbabilisticAndMetricNumberTheory 61, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, this roadmap 271, ExplicitNumberFields 272. Every supplier comes earlier.
- `lake env lean` on `Suggested.lean` printed exactly 16 warnings, each `declaration uses sorry`, at lines 165, 197, 204, 209, 219, 234, 255, 273, 290, 313, 331, 357, 368, 384, 397 and 408.
- The pull request changes nothing outside the folder.

**Signatures and padding.**

- I appended `#check @name` for all 30 declarations to a scratch copy and elaborated it.
  - Each type matches its README statement. The file has no `variable` block.
  - `sum_tau_div_model` elaborates as `236 ≤ t → |…| ≤ 1.16 * t ^ (-(1 / 3))` with a real exponent.
  - `signatures.md` counts 31 because it reads the word "instance" in a docstring.
- One-tactic probe: I replaced each `sorry` with `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega | (aesop; done)`. The probe failed with exactly 16 errors, one per theorem.
- Headlines: the Summary's 16 end theorems are stated, in README order. The docstring names the three groups it does not state (1.10, Robin's `σ(n)/n` bound, the preprint statements), with the reason for each.
- The Layer 0.7 propositions that `Suggested.lean` declares are the five that line 827 names. *StieltjesGammaOneEnclosure* is now italic everywhere, and `roadmaps grep` finds no other roadmap that cites it.

**Seeded sample: the locators I opened.**

- **0.2.** `ramare2015mc` lines 224–230 ((1.5), `g_q`), 248–274 (Lemma 1.9) and 329 ((1.7), the printed `31/105`).
- **1.9.**
  - `leong2026` is image-only (under Not verifiable), and `leeLeong2022` is uncertified.
  - I recomputed every number of the section's Checks: `log H₀ = 28.729692`, `5.56 log² H₀ = 4589.197`, and `c₁ = 5.43656 + 27.92999 + 0.18507`; the boundaries `0.9973225` and `0.9937382`; and `e^{10.175/13} = 2.18735`.
  - I resolved ExplicitZetaBounds §§0.2, 0.4, 0.4b, 4.1, 4.3, 4.8, 4.10, 6.1, 7.3 and 7.10 at `11dd87b` (`1237`, `e^{146}`, `29.388`, `30.812`, `5.558691`, `7.59·10³¹`).
- **1.10.**
  - `ramareZunigaAlterman2025` is uncertified.
  - `vanlalngaia2017` lines 193–195 give Theorem 9's second part, `0.047/√x + 1.884/x + 1.75·10^{−12}` for `x ≥ 2` (the extraction maps digits to letters).
  - I recomputed the ratio terms of the Check at `X = 2.1·10^{10}`, which total `0.01045`.
  - `Σ_{d ≤ √D} Λ(d)·bound(D/d)/D` with the listed Chebyshev inputs is `0.004115` at `2.1·10^{10}` and decreases (`0.001228` at `2.3·10^{12}`), so `|R₄| ≤ 0.005 X` is supported.
- **3.2.**
  - `ramare2015corr` lines 20–31 (Theorem 1.5 from `9950`), 122–125 (Lemma 4.1, `0.310`), 207–236 (with `15 512 101` at line 215) and 237–239 (the check `9550 ≤ x ≤ 18 100`).
  - `ramare2015mc` lines 169–178 (the superseded rows), 179–190 (Corollary 1.6), 734–744 (Lemma 4.2) and 1157–1164 (Lemma 10.2: `0.0192`, `0.0218` and `1` on `[·, 1.2·10^7]`).
- **3.3.** `ramare2015mc` lines 264–265 and 278–285; `ramare2013facm` lines 54–62 (Theorem 1.2, `0 ≤ ε ≤ 1.38`); `balazard2012` line 717. See R01.
- **5.3.** `ramare2016mc` lines 539–565 (Lemma 4.3 and its proof). I re-derived the route, including `d^{c−2} ≤ t^{c−2}` for `d > t`.
- **6.3.** `hallTenenbaum1988` and `bordelles2024` are uncertified. I re-derived both routes: `f(mp^ν) = f(m) f(p^ν)` for `p ∤ m`, with `log t ≤ t`, respectively `log t ≤ t − 1`.
- **7.1.** `moserMacLeod1966` lines 8–14 and 81–88 (note: its `Q(x)` counts `n < x`); `ramare2013aa` lines 265–276 (Lemma 4.6); `cipu2015` lines 621–626; `ramare2016mc` lines 450–461 (Lemma 3.4 and its proof identity).
- **7.3.** `rieselVaughan1983` and `plattTrudgian2018` are uncertified. I recomputed the constants (table).
- **7.9.** `tudzi2025` is uncertified. I re-derived `P₃` from the Laurent expansion and recomputed the `0.173` rows (table).
- **8.1a.** `dusart2018` is uncertified. I recomputed the numbers (table, and R02).
- **8.2.** `vanlalngaia2017` lines 118–131 give Theorem 5 on p. 3: `|ε| < 2`, `x ≥ e^{22}`, `0.841`. Lines 91–108 and 423–429 give Theorem 4. See R03.
- **8.3.** `bordelles2005` and `languascoZaccagnini2009` are uncertified. I re-derived `η = c/log x + 3c/(2 log² x)` and the product identity `∏_a C(q, a) = e^{−γ} q/φ(q)`.
- **9.3.** `nicolas2008` lines 56–68 (Théorème 2, with `e^γ` on both iterated logarithms in (7)), 232–236 (Définition 1), 399 (Lemme 7) and 437–443 (Lemme 9, with `15 985` and `166 000`); `ivic1977` lines 19–24 and 48–52.
- **9.4.** `nicolas2008` lines 23–26 (Rosser–Schoenfeld's (1) with `2.50637`) and 38–49 (Théorème 1: (2) with `3.65278…`, (4) with `2.95503…` and equality at `30 030`; the equality at `6` recomputed, table).

**Adversarial table.**

- Every value below was computed in this review, in long double.
- Sieves:
  - `μ` and `λ` to `2.5·10⁷`;
  - `τ` to `6·10⁶`;
  - `σ` to `1.1·10⁶`;
  - the primes to `10⁸`.
- Carriers that are constant on unit intervals or on prime gaps were evaluated at both ends, and at the interior extremum where the weight has one.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.2 decomposition | `q = 2`, `x = 10`; `S = {2, 3}`, `x = 6` | `19/210 − 1/60 + 1/8 + 1/8 = 34/105`; `1/3`, against `−2/3` without `n = 1`; `0.260·2/log 5 = 0.32309` lies between `31/105` and `34/105` | sound | — |
| 1.5 `abs_moebiusSum_le_ramare` | `[1 078 853, 2.5·10⁷]` | last violation `1 078 852`; largest ratio `0.997384` at `1 078 853` | sound | — |
| 1.6a `liouvilleSum_isLittleO` | `n ≤ 10⁶` | `L(10^k) = 0, −2, −14, −94, −288, −530`; `max |L| log x/x = 0.64983` at `32` | sound | — |
| 1.9 thresholds | `log x = 4589.2` | `c₁ = 33.55163`; `5.13·10^{−8}` against `1.21·10^{−8}` | sound | — |
| 1.10 `R₂*` ratio | `X = 2.1·10^{10}` | `2.73·10^{−4} + 4.4·10^{−6} + 1.54·10^{−4} + 1.3·10^{−5} + 0.010 = 0.01045`; `R₄` bound `0.004115 X` | sound | — |
| 2.1 `abs_moebiusDivSumIn_le_one` | `S = ∅`; `{2, 3}` at `6`; all primes at `13` | `1`; `1/3`; `−2323/30030` | sound | — |
| 2.2 `abs_moebiusDivSum_le_balazard` | `x = 1, 2` | `1 ≤ 11/3`; `1/2 ≤ 0 + 1/4 + 4/3` | sound | — |
| 2.5 rational steps | `N = 1, 2, 3`; `2 ≤ N ≤ 28` | tails `−0.392073`, `−0.142073`, `−0.030962` against `1/2`, `1/3`, `1/4`; smallest margin `0.013276` (`N = 28`), far above the `3.9·10^{−7}` that `Real.pi_gt_d6`/`Real.pi_lt_d6` leave in `6/π²` | sound | — |
| 3.1 `abs_moebiusLogSum_sub_one_le` | `x = 1, 2` | `1 ≤ 2`; `0.3069 ≤ 1.293` | sound | — |
| 3.2 rows | real `x ≤ 10⁶` | last violating intervals start at `1` (`0.213`), `6`, `3161`, `9548` (`1/714`), `9549` (`0.00140`); the largest value on `[9550, 9950)` is `0.001398` at `9550`, so the instance from `9550` holds; Corollary 1.6: `6`, `43`, `221` | sound | — |
| 3.3 Corollary 1.10 | `m̌` on `[1, 50]`; `m̌_2(4)` | `m̌(30) = 1.0030213` (the maximum); `m̌(1) = 0`; `m̌_2(4) = 1.290400` | route gap | R01 |
| 5.1 `norm_sum_mul_sub_le_comparison` | `h = δ`; `H̄` | conclusion = hypothesis; `ζ(4/3)/ζ(8/3) = 2.80405`; `ζ(6/5)/ζ(12/5) = 4.04208` | sound | — |
| 5.2 `sum_tau_div_model` | `t = 236`; `[1, 236]`; `(0, 1)` | `3·0.961·236^{−1/6} = 1.159736 ≤ 1.16`; largest value `0.65418` (as `t → 2⁻`), and `0.59401` at `t = 1` with `γ² − γ₁`; `sup |P| t^{1/3} = 1.64082` at `t = 0.000735` | sound | — |
| 5.3 second model | `h = δ`; `h = μ`, `c = 2`; `t = 1/2` | Layer 0.4 itself; error `0.760 t²` against main `0.304 t²`; `H̄(2)/8 ≤ H̄(c)/2^{c+1}` | sound | — |
| 5.5 Levin–Fainleib, conditional Check | `g(p_k) = 2/p_k` for odd `k` | deviation `1.20020` (`Q ≤ 5·10⁶`); `A = 1.15835`; `Σ|f − 1| = 2.3720`; log partial products `−0.449220`, `−0.448895`, `−0.448891` (and `−0.448891` at `10⁸`); `C = 0.63834` | sound | — |
| 5.5 truncation Check | `g(p²) = 1/p` | deviation `2.6446` (`Q ≤ 9·10⁶`); `A = 0.98618`; differences `1.04298`, `1.04420`, `1.04389`; truncated product `0.304263` at `10⁷`, against `3/π² = 0.303964` | sound | — |
| 6.3 `sum_le_hall_tenenbaum` | `f = 1`; `x ∈ (1, 2)` | `B = 1.98233`, `A + B + 1 = 4.3686`; `1 ≤ (A + B + 1) x/log x` with `B ≥ 0` (from `hB` at `N = 0`) and `A ≥ 0` (from `hA` at `y = 2`) | sound | — |
| 7.1 | `x = 7, 8`; `x → 2⁻` | `R(7) = 1.7445 > 1.3229`; `R(8) = 1.1366 < 1.4142`; `(1 − 12/π²)/√2 = −0.15263` | sound | — |
| 7.3 constants | Euler products to `10⁸` | `H(0) = 0.7573901`, `u = 0.3786950`, `H'/H = 1.8573068`, `A₃ = −6.0234762`, `A₄ = −1.114075`; `H̄(−1/3) = 250.78` to `10⁸`, `251.01` with the tail; `1.641·251.01/u = 1087.7` | sound | — |
| 7.4 smoothed | `[1, 7)` | `max |Δ − xδ − 1/4| = 0.09330` at `x = 2`; `1/8 + 0.316/√7 + 1/448 = 0.246669` | sound | — |
| 7.9 `0.173` rows | `[6·10⁵, 6·10⁶]` | `Δ(1 081 080⁻) = −181.3582` against `179.8767` (the only real violation); integer maximum `0.172001` at `652 080`; rows `0.961`, `0.482`, `0.397`: 0 violations; `x = 4.55·10^{12}`: `x^{1/6}/log x = 4.4167 ≥ 0.764/0.173` | sound | — |
| 8.1 `mertens_product_explicit`, `mertens_product_axler` | thresholds | `9.713·10^{−4} + 4.12·10^{−5} < 4.892·10^{−3}`; Axler's margin as in the previous table | sound | — |
| 8.1a `mertens_product_dusart` | `x = 2 278 381`, `2 278 382`; `[2 278 382, 46 909 074]` | `0.200054`, `0.200067`; `0.199960`, `0.199973`; beyond `2 278 421` the maximum is `0.198397`/`0.198409` at `3 445 943` | theorem sound, Check misplaced | R02 |
| 8.2 instance | `|ε| = 1`, `x = e^{22}` | `z = 9.391463·10^{−5} > 1/10 648`; `z e^z = 9.392345·10^{−5} ≤ 9.392374·10^{−5}`; `e^{γ(1) + B} = 1.0828 = (6/π²) e^γ` | conclusion sound, step false | R03 |
| 8.3 progressions | `q = 1, 2, 4`; `X₀ = 286` | `C = 1.83675`; `e^γ/2 = 0.89054`; `1.25/1.26864 = 0.98531` | sound | — |
| 9.1 `cardDistinctFactors_le_robin` | `3 ≤ k ≤ 30` | maximum `1.384013` at `k = 9`; `1.318852` at `k = 26` | sound | — |
| 9.2 `sigma_zero_le_nicolasRobin` | `6 983 776 800` | `f₂ = 1.537940`; `n^{1.538 log 2/log log n} = 2304.70 ≥ 2304` | sound | — |
| 9.3 | odd `n ≤ 1.1·10⁶`; `[3, 10⁵]`; `n ≤ 1.1·10⁶` | Eum–Koo fails exactly at `3, 5, 7, 9, 15, 21`; Robin `0.6483`: 0 violations; Ivić `2.59`: last failure `6`; `σ(21) = 32 > 31.2314` | sound | — |
| 9.3a criterion and theorem | `n = 10⁴`, `70` | `3.01145·10^{−4}` against `3.09989·10^{−4}`; `1.0490 > 0.9807` | sound | — |
| 9.4 `div_totient_lt_rosserSchoenfeld` and Nicolas' forms | `30 030`, `6`; `ω(n) ≤ 2` | `2.955038`; `3.652786`; `2√(2.50637 e^γ) = 4.22566 > 3` | sound | — |

**Library declarations opened at the pins.**

- Unchanged pins; the list of the previous review stands.
- I re-grepped both pins for the roadmap's objects:
  - neither has a Stieltjes constant (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Stieltjes.lean` is about Stieltjes measures);
  - neither has a summatory Möbius or Liouville function, or highly abundant or highly composite numbers;
  - Tau Ceti's `ArithmeticDirichletSeries/Moebius.lean` (lines 101–342) has the ideal Möbius function with no summatory bound.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting (`832c4bf`):
  - §0.1 (line 590; `S(u)` 593, `58/√u` 616);
  - §1.1 (1189);
  - §1.3 (1301: *ButheVerified*; *ButheFinerRange* still gives `0.81 √x`, so the second clause of `gap:psi-initial-range` stays unmet);
  - §1.6 (1494–1501); §1.7 (1525–1545);
  - §3.1 (`1.93378`); §3.2 (2309: `1.03883`, `563`); §3.3 (2369, `0.006409`); §3.5 (2703, `x/log x` from `17`);
  - §4.2 (3088: `0.0067` from `1.52·10⁶`, `1/(4 log x)` from `115`, `1/(2√x) + 1.75·10^{−12}` from `8950`);
  - §4.3 (3141: `24 284`, `1 757 126 630 797`, the row `(0.19992, 2 278 383)` at line 3205);
  - §4.7 (3367, `24.4`); §5.3 (3466); §6.1 (*RamareRumelyTable1* 3672); §6.3 (3724: `1/840`, `8·10⁹`); §7.4 (4168; Dusart's interval from `89 693` at 4230–4236).
  - The contract gaps are still unmet at this head: `η_A`, `2.58843`, `8·10^{−5}`, `0.05/√x` and `8.96237` are absent.
- AnalyticNumberTheoryPartI (`979e68c`):
  - §§0.11, 0.19 (`286`), 0.21, 0.26, 0.34 (`landau_siegel_exclusion`), 1.2 (`davenport_moebius`), 3.1, 3.7, 3.9, 3.11, 3.12, 3.22, 3.35;
  - the bold subsections §3.22a (2561), §3.22b (2567), §3.23a (2594, `divisorError`; `BBRFiniteInput` in its `Suggested.lean` lines 948–959) and §3.35a (3146).
- SieveMethodsAndPrimePatterns (`f07c3fe`): §0.5 (521, *HasLogSieveDimension* at 523) and §1.1 (1074).
- ProbabilisticAndMetricNumberTheory (`9c6663c`): §3.7, with the Rankin-type bound at lines 4136–4142 (the constant is `1`).
- ExplicitZetaBounds (`11dd87b`, unchanged): the sections listed under 1.9.
- ExplicitCharacterSumsAndSieves (`b701b75`, unchanged): §5.1 (1275), `selbergDiagonal`.
- ZerosOfLFunctions on main: Layer 9, *AllOnCriticalLine*, unchanged.
- ExplicitNumberFields (`016bb4a`) cites §§2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4 and Layer 0.7 propositions, and every one exists here.
- `citations.md` and `overlaps.md` list nothing: no open pull request changes this roadmap or drops an id it cites.

**Ownership, duplication, gaps.**

- `roadmaps grep` over main and the open heads (`--lean-only` and `--readme-only`) finds no second owner of:
  - the real-argument Möbius and Liouville carriers;
  - the first Stieltjes constant;
  - highly abundant or superior highly composite numbers;
  - the Hall–Tenenbaum or Levin–Fainleib theorems.
- The `γ₁` matches belong to unrelated notation in other roadmaps.
- `design/plan.json` has the 17 gap slugs of the brief. The README states the five unmet ones as contracts, under the same slugs. The other twelve resolve to the supplier sections above, and `gap:zeta-reciprocal-bounds` to ExplicitZetaBounds §7.10, as line 557 says.

## Not verifiable

- `leong2026` (1.9, items (a) and (b)): the cached text is image-only and OCR is unavailable on this worker. The `[[missing]]` entry stands. The section's numbers were recomputed.
- Uncertified sources, cited by locator, with their numbers recomputed where possible (table):
  - `leeLeong2022` (1.9);
  - `ramareZunigaAlterman2025` (1.10);
  - `hallTenenbaum1988` and `bordelles2024` (6.3);
  - `rieselVaughan1983` and `plattTrudgian2018` (5.2, 7.3);
  - `tudzi2025` (7.9);
  - `dusart2018` (8.1a);
  - `bordelles2005` and `languascoZaccagnini2009` (8.3);
  - `rosserSchoenfeld1962` (8.1, 9.4);
  - `robin1984` and `eumKoo2015` (9.3).
- `vanlalngaia2017` and `nicolas2008` Théorème 1 (3): the extractions garble symbols. In the first, digits are rendered as letters and were decoded from known values (Theorem 5's `|ε| < 2`, `e^{22}`); in the second, the threshold `n ≥ 211` of (3) could not be read.
- Ownership was checked against every open roadmap pull request through `roadmaps grep`, not by reading each sibling checkout.

## Source issues

- **Misprint** in ramare2015corr at Theorem 1.5, p. 2383 (line 22): the source says the bound holds for `x ≥ 9950`; it should say `x ≥ 9550`, the range its own check covers (p. 2387, line 238) and from which the bound holds (last violating interval `[9549, 9550)`); affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 (line 186): the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁`; affects a stated result; corrected in print at `trudgian2015` p. 10, Lemma 14 (line 430).
- **Error** in berkaneBordellesRamare2012 at the proof of Corollary 2.2, p. 19 (lines 1148–1150): the source says the remainder times `t^{1/3}` is at most `0.60` on `[1, 2]` and `1.16` on `[0, 1]`; it should be `0.6542` and `1.6408`; affects nothing.
- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`; affects nothing.
- **Error** in cipu2015 at Lemma 4.2(a), p. 214 (line 623): the source says `−0.103229 √x ≤ P(x)` for real `x ≥ 1`; it should be stated at integers, since the ratio tends to `−0.152632` as `x → 2⁻`; affects a stated result.
