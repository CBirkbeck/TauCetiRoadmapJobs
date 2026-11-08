# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 2ab0898)

**Verdict:** accepted

This is an incremental re-review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` at `2ab0898`. The previous review read `3288be4`.

- **What changed.** 93 lines of the README changed (64 insertions, 29 deletions). `Suggested.lean` is unchanged, and nothing outside the folder changed.
- **Previous findings.** All four are repaired, and no repair introduced a new problem.
- **Checks run.**
  - The gate passes.
  - The dependency check reports no problem.
  - `Suggested.lean` elaborates with exactly 16 `sorry` warnings and nothing else.
- **Suppliers.** Every supplier is at the head the previous review resolved, so no citation drifted.
- **Findings.** This review has none.

## Previous findings

- R01 — repaired: README 3.3, lines 2455–2458: "Balazard's theorem is proved here in two halves. The lower half `m̌(y) ≥ 0` is the first row `|m̌(y) − 1| ≤ 1` of Corollary 1.6 (3.2). The upper half is *MoebiusLogUpperRangeVerified* `(m̌(30)) 1 44` (Layer 0.7) on `[1, 44]`…"
- R02 — repaired: README 8.1a, Checks, lines 3869–3871: "The smallest margin is at `x = 2 278 382` (the Check above). … Beyond the prime gap `[2 278 379, 2 278 421)` the smallest margin is at the prime `3 445 943`…"
- R03 — repaired:
  - (a) Scope, lines 166–170: "a remainder for `Σ_{p ≤ x} 1/p` in terms of `θ(x) − x` (`vanlalngaia2017` lines 90–108, …), which no section of ExplicitPrimeCounting states".
  - (b) 8.2, line 3896: "`z ≤ |ε|(1 + 3·10^{−6})/log³ x ≤ 1.000003/10 648`".
- R04 — repaired:
  - 7.6, lines 3550–3551: "the fourth form, with *DivisorPowerRangeVerified* `7560² (6·10^5)`".
  - Layer 5 Dependencies, line 2916: "for the third and fourth forms of 5.2".
  - 5.5, lines 2796 and 2820: "`log log X + mertensConstant ℚ + o(1)`".

## Verified sound

### Gate, order, elaboration

- **Gate.** I ran the gate on this head. It printed `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 … outside-folder=0 source-material=0 OK` and exited with 0. The worker's `gate.md` adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable` printed `depcheck: 230 roadmaps, 2323 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Merge order.** The positions in `ORDER.txt` are:

  | Roadmap | Position |
  |---|---|
  | ZerosOfLFunctions | 48 |
  | AnalyticNumberTheoryPartI | 49 |
  | SieveMethodsAndPrimePatterns | 56 |
  | ProbabilisticAndMetricNumberTheory | 61 |
  | ExplicitZetaBounds | 267 |
  | ExplicitPrimeCounting | 269 |
  | ExplicitCharacterSumsAndSieves | 270 |
  | this roadmap | 271 |
  | ExplicitNumberFields (consumer) | 272 |

- **Elaboration.** `lake env lean` on `Suggested.lean` printed 16 warnings, each `declaration uses sorry`, at lines 165, 197, 204, 209, 219, 234, 255, 273, 290, 313, 331, 357, 368, 384, 397 and 408. It printed nothing else.
- **Signatures.**
  - I appended `#check @…` for all 30 declarations to a scratch copy and elaborated it. It exited with 0, and the types are those the previous review compared with the README; for example, `mertens_product_dusart` still carries the `η_A` lower hypothesis with `TauCeti.LFunctions.mertensConstant ℚ`.
  - `signatures.md` counts 31 declarations because it reads the word "instance" in a docstring, and its line-427 errors come from that tool's appended footer, not from the file.
  - `Suggested.lean` is unchanged, so the headline list, the one-tactic probe (16 failures out of 16) and the binder comparison of the previous review carry over.

### The changed passages, recomputed

All values below were computed in this review, in long double. The sieves ran to `2·10⁷` for `μ` and to `4.7·10⁷` for the primes. `m̌` is continuous and linear in `log x` on each `[N, N + 1]`, because the term entering at `x = N` is `μ(N) log 1/N = 0`. So its values at the integers decide every bound below.

- **Layer 0.7, *MoebiusLogUpperRangeVerified* (new).**
  - The instance `(m̌(30), 1, 44)` holds. The maximum over `[1, 44]` is `m̌(30) = 1.0030213`.
  - The negative controls fail as the Checks say. With `1.0030` the instance fails at `30`. The two-sided `(m̌(30) − 1, 1, 44)` fails at `1`, where `|m̌(1) − 1| = 1`.
  - Over `[44, 2·10⁷]` the maximum is `1.0017953`, at `44`. With `43` in place of `44` the bound `1.002` fails, since `m̌(43) = 1.0022775`.
  - The monotonicity argument of the Check, linearity in `log x` on each unit interval, is the one stated in the Checks of 3.2.
  - The Layer 0.7 preamble still holds for the new proposition: it is antitone in its range and monotone in its constant.
- **3.3, the route of Corollary 1.10.**
  - **Lower half.** The row `|m̌ − 1| ≤ 1` from `1` gives `m̌ ≥ 0`, and the minimum is `m̌(1) = 0`.
  - **Upper half.** `1 + 1/500 = 1.002 < m̌(30)`.
  - **Values quoted in the text.** `|m̌(7) − 1| = 0.0045066` and `0.0218/√30 = 0.0039801`.
  - **The intervals where `m̌` exceeds `1.002`.** These are exactly parts of `[16, 20)`, `[28, 32)` and `[41, 44)`:
    - `m̌(17), m̌(18), m̌(19) = 1.00211, 1.00222, 1.00232`;
    - `m̌(29) = 1.00292` and `m̌(31) = 1.00202`;
    - `m̌(42) = 1.00222` and `m̌(43) = 1.00228`.
  - **The theorem itself.** I evaluated `m̌_q` at every integer of `[1, 2·10⁶]`. The largest values of `m̌_q(x) φ(q)/q` are:

    | `q` | largest value | at `x =` |
    |---|---|---|
    | 1 | `1.0030213` | 30 |
    | 2 | `1.0000079` | 321 827 |
    | 3 | `1.0000143` | 324 305 |
    | 6 | `0.9999945` | 2·10⁶ (end of range) |
    | 30 | `0.9999714` | 2·10⁶ (end of range) |
    | 210 | `0.9999165` | 2·10⁶ (end of range) |

    For every `q` the smallest value of `m̌_q` is `0`, at `x = 1`.
  - **Locators.**
    - `balazard2012` line 717 is the footnote on printed p. 13 (line 718): it gives the optimal bounds `0` and `Σ_{n ≤ 30} μ(n) log(30/n)/n = 1.00302…` in place of those of (18), lines 703–707.
    - `ramare2015mc` lines 278–285 contain Corollary 1.10 and the remark crediting Balazard, and lines 264–265 contain Lemma 1.9 for `m̌`.
  - **Needs line.** The new *Needs:* line (0.2; 2.1; 3.2; Layer 0.7) stays inside Layers 0, 2 and 3, as Layer 3's Dependencies list.
- **8.1a, the margin Check.** I evaluated both quotients at both ends of every prime gap meeting `[2 278 382, 46 909 074]`.
  - There are no violations.
  - `(1 − Q₁) log³ x` and `(Q₂ − 1) log³ x` fall from the left end to the right end on every gap, with 0 exceptions. Analytically, with `u = log x` and `Q₁ = c u`:
    - the derivative of `u³ − c u⁴` is `u²(3 − 4Q₁)`;
    - the derivative of `u²/c − u³` is `(u/c)(2 − 3Q₁)`;
    - both are negative since `Q₁ > 3/4`.
  - At `2 278 382` the values are `0.199960` and `0.199973`; at the right end of that gap they are `0.196293` and `0.196305`.
  - `2 278 379`, `2 278 421` and `3 445 943` are prime, and `2 278 379` and `2 278 421` are consecutive.
  - Over the gaps that start at primes `≥ 2 278 421`, both maxima are at `3 445 943`: `0.198397` and `0.198409`. Since `0.198409 > 0.1984`, the negative control holds.
- **8.2, the instance.**
  - `1/(e²² − 1) = 2.789468·10⁻¹⁰ ≤ 3·10⁻⁶/10 648 = 2.817431·10⁻¹⁰`, and `(log³ x)/(x − 1)` decreases beyond `e²²`.
  - `|ε|²/(2 − |ε|) ≤ |ε|` holds exactly when `|ε| ≤ 1` (equality at `|ε| = 1`; `0.1667 ≤ 0.5` at `|ε| = 1/2`).
  - `1.000003·e^{1.000003/10 648} = 1.0000969 ≤ 1.0001`.
  - The Check's values: `z = 9.391463·10⁻⁵`, `1/10 648 = 9.391435·10⁻⁵`, `z e^z = 9.392345·10⁻⁵ ≤ 1.0001/10 648 = 9.392374·10⁻⁵`.
- **Scope and 8.2, Vanlalngaia's Theorem 4.**
  - `vanlalngaia2017` lines 90–108 state it with the glyph `#`. Line 218, `ψ(x) − #(x)`, identifies `#` as `θ`. Line 92 reads `P(x) = log log x + B + (θ(x) − x)/(x log x) + O*(…)`.
  - Lines 423–429 open its proof with the Stieltjes integration against `θ` that the parenthetical cites; the proof runs to line 593, before the proof of Theorem 5 at line 594.
  - ExplicitPrimeCounting at `832c4bf`, §4.3 (lines 3141–3190), names Theorem 4 at lines 3164 and 3173–3175. Both are inside routes: the source's own route for the cubic instance, which the supplier replaces by its transfer, and the route of Corollary 3. No target states it, so "no section … states" holds.
- **5.5 notation.** Both occurrences now read `mertensConstant ℚ`. The declaration is at `TauCeti/NumberTheory/LFunctions/Mertens.lean` line 545 of the Tau Ceti pin, and `tendsto_primeSummatory_inv_absNorm_sub_log_log` at line 564. No `M` for the constant remains in 5.5.
- **The *Needs:* lines of 7.6, 7.9 and the Layer 5 Dependencies.**
  - 5.2 (lines 2666–2668) proves the third form for `t ≥ 6·10⁵` and from *DivisorPowerRangeVerified* on `[2, 6·10⁵)`, and the fourth from the third on `[2, ∞)`. So 7.6, which uses the fourth, and 7.9, which uses the third, both need *DivisorPowerRangeVerified* `7560² (6·10^5)`, as they now say.
  - The instance's locator, `cullyHugillTrudgian2021` lines 197–199 ((14), `c = 1.001` from `6·10⁵`, checked on `[2, 6·10⁵)`) and 240–242 (`5560²`), holds.

### Seeded sample

- Of the sampled targets, only 8.1a falls in a changed passage, through its Check. `dusart2018` is uncertified and cited by its locator; the Check's numbers were recomputed above.
- The other sampled targets are untouched by the diff: 0.1, 0.2, 0.6, 1.5, 1.6a, 2.2, 2.4, 5.1, 6.4, 7.1a, 7.4, 7.5, 8.1 and 9.1. Their verification by the previous reviews is not repeated, as the incremental brief directs.

### Citations, ownership, overlaps

- **Supplier heads.** They are unchanged since the previous review:

  | Roadmap | Head |
  |---|---|
  | ExplicitPrimeCounting | `832c4bf` |
  | AnalyticNumberTheoryPartI | `979e68c` |
  | SieveMethodsAndPrimePatterns | `f07c3fe` |
  | ProbabilisticAndMetricNumberTheory | `9c6663c` |
  | ExplicitZetaBounds | `11dd87b` |
  | ExplicitCharacterSumsAndSieves | `b701b75` |
  | ExplicitNumberFields (consumer) | `016bb4a` |

  The citations the previous review resolved therefore stand. The one citation the diff adds, ExplicitPrimeCounting §4.3, is resolved above.
- **The new proposition.** `roadmaps grep 'MoebiusLogUpperRangeVerified|MoebiusLogRangeVerified'` over main and the open heads finds only this roadmap. It is italic everywhere and not declared in `Suggested.lean`, consistent with the Layer 0.7 preamble.
- **Overlaps.** `citations.md` and `overlaps.md` list nothing. The diff renames no heading and drops no id.

### Adversarial table

- Rows marked (r13) carry forward unchanged from the review of `3288be4` for statements this diff leaves untouched.
- The other rows were computed in this review.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.7 *MoebiusLogUpperRangeVerified* `(m̌(30), 1, 44)` (new) | `[1, 44]`; `c = 1.0030`; two-sided form; `c = −0.1`, `a = 1` | max `m̌(30) = 1.0030213`; `1.0030213 > 1.0030`; `|m̌(1) − 1| = 1 > 0.0030213`; `m̌(1) = 0 > −0.1` (fails, as it should) | sound | — |
| 0.7 Check `1.002 44 (2·10⁷)` (new) | `[44, 2·10⁷]`; `a = 43` | max `1.0017953` at `44`; `m̌(43) = 1.0022775 > 1.002` | sound | — |
| 3.3 Corollary 1.10, Balazard route (changed) | `q ∈ {1, 2, 3, 6, 30, 210}`, `x ≤ 2·10⁶`; `y = 7`, `30` | `max m̌_q φ(q)/q`: `1.0030213`, `1.0000079`, `1.0000143`, `0.9999945`, `0.9999714`, `0.9999165`; `min m̌_q = 0`; `|m̌(7) − 1| = 0.0045066`; `0.0218/√30 = 0.0039801`; `1.002 < 1.0030213` | sound | — |
| 3.3 Check, intervals above `1.002` (changed) | integers `16–44` | `m̌(17..19) = 1.00211, 1.00222, 1.00232`; `m̌(29) = 1.00292`, `m̌(31) = 1.00202`; `m̌(42) = 1.00222`, `m̌(43) = 1.00228`; `m̌(16) = 0.99843`, `m̌(20) = 0.99972`, `m̌(32) = 1.00003` | sound | — |
| 8.1a margin Check (changed) | all prime gaps in `[2 278 382, 46 909 074]` | 0 violations; 0 non-decreasing gaps; `0.199960`/`0.199973` at `2 278 382` (right end `0.196293`/`0.196305`); `0.198397`/`0.198409` at `3 445 943` (right end `0.197083`/`0.197094`) | sound | — |
| 8.2 instance `1.0001 |ε|/log³ x` (changed) | `|ε| = 1`, `1/2`; `x = e²²` | `2.789468·10⁻¹⁰ ≤ 2.817431·10⁻¹⁰`; `1 ≤ 1`, `0.1667 ≤ 0.5`; `1.0000969 ≤ 1.0001`; `z e^z = 9.392345·10⁻⁵ ≤ 9.392374·10⁻⁵` | sound | — |
| Scope / 8.2, Theorem 4 in `θ` (changed) | `vanlalngaia2017` lines 92, 218, 423–429; ExplicitPrimeCounting §4.3 | `#` = `θ` (line 218 `ψ − #`); §4.3 names Theorem 4 only inside routes (lines 3164, 3173) | sound | — |
| 5.5 constant notation (changed) | lines 2796, 2820 | `mertensConstant ℚ` at Tau Ceti `Mertens.lean` 545; no `M` left in 5.5 | sound | — |
| 7.6, 7.9 *Needs:*; Layer 5 Dependencies (changed) | 5.2 forms 3 and 4 | third form on `[2, 6·10⁵)` is *DivisorPowerRangeVerified*; fourth from third on `[2, ∞)`; `cullyHugillTrudgian2021` lines 197–199, 240–242 | sound | — |
| 0.2 decomposition (r13) | `q = 2`, `x = 10`; `S = {2, 3}`, `x = 6` | `34/105`; `1/3` | sound | — |
| 1.5 `abs_moebiusSum_le_ramare` (r13) | `[1 078 853, 2.5·10⁷]` | largest ratio `0.997384` at `1 078 853` | sound | — |
| 1.6a `liouvilleSum_isLittleO` (r13) | `n ≤ 10⁶` | `max |L| log x/x = 0.64983` at `32` | sound | — |
| 1.9 thresholds (r13) | `log x = 4589.2` | `c₁ = 33.55163` | sound | — |
| 1.10 `R₂*` ratio (r13) | `X = 2.1·10¹⁰` | `0.01045`; `R₄ ≤ 0.004115 X` | sound | — |
| 2.1 `abs_moebiusDivSumIn_le_one` (r13) | `S = ∅`; `{2, 3}` at `6`; all primes at `13` | `1`; `1/3`; `−2323/30030` | sound | — |
| 2.2 `abs_moebiusDivSum_le_balazard` (r13) | `x = 1, 2` | `1 ≤ 11/3`; `1/2 ≤ 0 + 1/4 + 4/3` | sound | — |
| 2.5 rational steps (r13) | `2 ≤ N ≤ 28` | smallest margin `0.013276` | sound | — |
| 3.1 `abs_moebiusLogSum_sub_one_le` (r13) | `x = 1, 2` | `1 ≤ 2`; `0.3069 ≤ 1.293` | sound | — |
| 3.2 rows (r13) | real `x ≤ 10⁶` | last violations `1`, `6`, `3161`, `9548`, `9549`; Corollary 1.6: `6`, `43`, `221` | sound | — |
| 5.1 `norm_sum_mul_sub_le_comparison` (r13) | `h = δ`; `H̄` | `ζ(4/3)/ζ(8/3) = 2.80405`; `ζ(6/5)/ζ(12/5) = 4.04208` | sound | — |
| 5.2 `sum_tau_div_model` (r13) | `t = 236`; `[1, 236]` | `1.159736 ≤ 1.16`; max `0.65418` | sound | — |
| 5.3 second model (r13) | `h = δ`; `h = μ`, `c = 2` | error `0.760 t²` against main `0.304 t²` | sound | — |
| 5.5 Levin–Fainleib (r13) | `g(p_k) = 2/p_k`, odd `k`; `g(p²) = 1/p` | `C = 0.63834`; truncated `0.304263` against `0.303964` | sound | — |
| 6.3 `sum_le_hall_tenenbaum` (r13) | `f = 1`; `x ∈ (1, 2)` | `A + B + 1 = 4.3686` | sound | — |
| 7.1 (r13) | `x = 7, 8`; `x → 2⁻` | `R(7) = 1.7445`; `R(8) = 1.1366`; `−0.15263` | sound | — |
| 7.3 constants (r13) | Euler products to `10⁸` | `H(0) = 0.7573901`; `1.641·251.01/u = 1087.7` | sound | — |
| 7.4 smoothed (r13) | `[1, 7)` | max `0.09330` at `2`; bound `0.246669` | sound | — |
| 7.9 `0.173` rows (r13) | `[6·10⁵, 6·10⁶]` | `−181.3582` at `1 081 080⁻`; integer max `0.172001` | sound | — |
| 8.1 `mertens_product_explicit`, `mertens_product_axler` (r13) | thresholds | `9.713·10⁻⁴ + 4.12·10⁻⁵ < 4.892·10⁻³` | sound | — |
| 8.1a `mertens_product_dusart` (r13, theorem) | `x = 2 278 381`, `2 278 382` | `0.200054`/`0.200067`; `0.199960`/`0.199973` | sound | — |
| 8.3 progressions (r13) | `q = 1, 2, 4` | `C = 1.83675`; `0.98531` | sound | — |
| 9.1 `cardDistinctFactors_le_robin` (r13) | `3 ≤ k ≤ 30` | max `1.384013` at `k = 9` | sound | — |
| 9.2 `sigma_zero_le_nicolasRobin` (r13) | `6 983 776 800` | `2304.70 ≥ 2304` | sound | — |
| 9.3 (r13) | odd `n ≤ 1.1·10⁶` | Eum–Koo fails at `3, 5, 7, 9, 15, 21` only | sound | — |
| 9.3a (r13) | `n = 10⁴`, `70` | `3.01145·10⁻⁴` vs `3.09989·10⁻⁴` | sound | — |
| 9.4 `div_totient_lt_rosserSchoenfeld` (r13) | `30 030`, `6` | `2.955038`; `3.652786` | sound | — |

## Not verifiable

- `dusart2018` (8.1a) is uncertified and cited by its locator. The Check's numbers were recomputed (table).
- `leong2026` (1.9, untouched) is image-only on this worker; its `[[missing]]` entry stands.
- The other uncertified sources the previous review lists are in untouched sections.
- Ownership against the open roadmap pull requests was checked through `roadmaps grep` and `overlaps.md`, not by reading each sibling checkout.

## Source issues

- none
