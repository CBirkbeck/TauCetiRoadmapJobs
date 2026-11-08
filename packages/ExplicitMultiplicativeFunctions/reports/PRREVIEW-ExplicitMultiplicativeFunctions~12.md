# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 9e50e8c)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4428 lines) and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean` (433 lines; 31 declarations, 15 definitions and 16 theorems) at `9e50e8c`.

- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 16 `sorry` warnings and nothing else.
- All four findings of the previous review (at `22518c0`) are repaired.
- Two suppliers moved since that review: ExplicitPrimeCounting is now at `bb08e9e` and ExplicitZetaBounds at `11dd87b`. I re-resolved every citation of both at their new heads, and every one holds.
- There are two findings:
  - R01 (P2): one claim in the sampled section 5.5 is false.
  - R02 (P3): the headline `sum_tau_div_model` breaks the roadmap's own convention on finite computations.

## R01 (P2) — 5.5: the Euler product defining `C` need not converge absolutely, and the route's Dirichlet series is shifted

- **Location.** README 5.5:
  - lines 2738–2740: "`C = Γ(κ + 1)^{−1} ∏_p (Σ_{ν ≥ 0} g(p^ν)) (1 − 1/p)^κ`, the product converging absolutely under the two hypotheses";
  - lines 2743–2744: "the Dirichlet series `Σ g(d) d^{−s} = ζ(s)^κ · (holomorphic at 1)`".
- **Claim.**
  - The two hypotheses control `Σ g(p^ν) log p^ν` only on average. So `g(p)` may oscillate around `κ/p`, every local factor then differs from `1` by about `1/p`, and the product converges only as the limit of its partial products over `p ≤ X`.
  - This matters for formalisation. If `C` were taken as an unconditional product, as "absolutely" invites (Mathlib's `tprod`, which returns `1` when the product is not multipliable), the theorem would be false for such `g`.
  - The route has a second slip. For `g` of size `κ/p` the series `Σ g(d) d^{−s}` behaves like `ζ(1 + s)^κ` and is singular at `s = 0`, not `s = 1`. The hypotheses also give no holomorphy there.
- **Witness.**
  - Take `κ = 1` and `g` multiplicative on squarefree `d`, with `g(p_k) = 2/p_k` for odd `k` and `0` for even `k`.
  - Both hypotheses hold. I computed `|Σ_{p ≤ Q} g(p) log p − log Q| ≤ 1.2002` for `Q ≤ 5·10⁶`, bounded in general by an alternating series, and `A = 1.158`.
  - Yet `Σ_{p ≤ 4.26·10⁶} |factor_p − 1| = 2.372`, growing like `log log`, while the log of the partial products converges to `−0.448891`.
  - The section's own Check `g = μ²/d` gives `Σ g(d) d^{−s} = ζ(1 + s)/ζ(2 + 2s)`.
- **Repair.**
  - Replace the clause with: "the product taken as the limit of its partial products over `p ≤ X`, which exists under the two hypotheses (the first by partial summation, the second bounding `Σ_p (Σ_{ν ≥ 1} g(p^ν))²` by `A/log 2`); it need not converge absolutely".
  - Add the witness as a Check.
  - In the route write: "`Σ g(d) d^{−s} = ζ(1 + s)^κ G(s)` for `s > 0`, with `Γ(κ + 1) C = lim_{s→0⁺} G(s)`".
  - Tested on the witness: the partial products converge, so `C = e^{−0.448891} = 0.6384` is well defined, while `Σ|factor_p − 1|` diverges.
  - Since `ramare2009` is uncertified, I could not check whether Theorem 21.1 carries an extra hypothesis that forces absolute convergence. If it does, state that hypothesis instead.

## R02 (P3) — 5.2 folds the source's finite check on `[1, 236]` into the proof of a headline, against the Conventions and the `Suggested.lean` docstring

- **Location.**
  - README 5.2, lines 2630–2633: "on `[1, 236]` the step function `Σ_{n ≤ N} τ(n)/n` is compared with `P(t)` on each `[N, N + 1)`, at both ends and at the interior extremum …, with the two enclosures".
  - Conventions, lines 254–261.
  - `Suggested.lean` lines 18–21: "where the README completes a theorem by checking its own inequality on an initial interval, the theorem is stated here beyond that interval".
- **Claim.**
  - The check on `[1, 236]` is the theorem's own inequality on an initial interval, and it is a computation the source relies on. The Conventions therefore make it a named Layer 0.7 proposition, with the theorem proved beyond it.
  - `sum_tau_div_model` is instead stated for every `t ≥ 1` and every `t > 0` with no such proposition, so the docstring's sentence is false for it.
  - The source's routine cannot stand in as the record either, because its printed table was computed with the misprinted constant.
  - 7.4 does the same at a smaller scale, with a check of each `[m, m + 1)`, `1 ≤ m < 7`, at lines 3296–3297.
- **Witness.**
  - `berkaneBordellesRamare2012` lines 1146–1147: the remainder is below `1.16` only for `t` larger than `236`, and "a routine" completes the proof.
  - Its table (line 1150) gives `0.60` on `[1, 2]`. The true supremum there is `0.65418` as `t → 2⁻`, and the value with `γ² − γ₁` is `0.594`.
- **Repair.** Either of the following.
  - (a) Keep the uniform convention:
    - In Layer 0.7, add the proposition *DivisorHarmonicRangeVerified* `c a b`: `|Σ_{n ≤ t} τ(n)/n − P(t)| ≤ c t^{−1/3}` for every real `t ∈ [a, b]`. Its instance is `(1.16, 1, 236)`, with that locator and a note that the printed table uses `γ² − γ₁`.
    - State the first conjunct of `sum_tau_div_model` for every real `t ≥ 236`, and the second for every real `t` with `0 < t < 1` or `t ≥ 236`.
    - Record the forms for `t ≥ 1` and `t > 0` in 5.2 as conjunctions with the proposition. On `[1, 236]` the second form follows from the first, since `1.16 ≤ 1.641`.
    - Treat the check in 7.4 the same way.
  - (b) Name both checks as explicit exceptions in the Conventions and in the docstring's second paragraph.
  - Tested: on `[1, 237)` the largest value of `|Σ_{n ≤ t} τ(n)/n − P(t)| t^{1/3}` is `0.65418 ≤ 1.16`. So the proposition is true, and the conjunction recovers the current statement.

## Previous findings (review of `22518c0`)

- **R01 (P3), the headlines in the docstring against the Summary** — repaired.
  - The Summary (lines 20–22 and 31–39) now names `L_λ(x) = o(x)`, Dusart's two-sided cubic form, the six-prime criterion and the theorem for `n ≥ 89 693²`.
  - The docstring (lines 23–32) lists the same 16 headlines in README order.
  - The nine elementary declarations are deleted, and their names are unbackticked in 1.6a (lines 1626–1632), 7.1a (lines 3080–3094), 9.2 (line 3941) and 9.3a (line 4097).
  - `roadmaps grep` finds no roadmap citing any of the nine names.
- **R02 (P3), 9.3a without a source** — repaired.
  - Lines 4103–4108 and the References (4407–4410) cite `tao2025mo`. I opened it:
    - lines 233–238 hold the Theorem, with `√n < p₁ < … < q₃ < n` and the factor `(1 + 3/(8n))(1 − 4P/Q)`;
    - lines 240–261 hold the proof, with the competitor `4Pm L'` and the `2`-adic factor `1 + 3/(2^{k+3} − 4)`;
    - line 265 uses Dusart's Proposition 5.4 from `89 693`, and lines 281–297 give the range `n ≥ 89 693²` with `0.000675`.
  - The dates (answered 5 October 2025, edited 20 January 2026) match. The threshold is `89 693`: the `89 683²` of the earlier search snippet was a transcription slip.
- **R03 (P3), Banks's instance without `LuZamanZhaoRecord`** — repaired. Lines 444–447, 570–572 and 3843–3846 now read "given `LuZamanZhaoRecord` (Banks's instance, a preprint)", which matches ExplicitPrimeCounting §1.7, line 1523 at `bb08e9e`.
- **R04 (P3), 7.8 below `3.77`** — repaired.
  - Lines 3517–3524 split the range at `3.77`, use `5` on `[2, 3.77)`, and use `10¹⁸ + 1` at the top.
  - I verified `10¹⁸ + 1 = 101·9901·999 999 000 001`, with all three factors prime by deterministic Miller–Rabin.
  - `11x^{1/5} log x` equals `19` at `x = 3.76270`, is `19.035` at `3.77`, and is `1.815·10⁶` at `10¹⁸`, so `10¹⁸ + 1` lies in every interval for `x ≥ 10¹⁸ − 19`.

## Verified sound

**Gate, build, order.**

- I ran the gate on this head. Output: `gate ExplicitMultiplicativeFunctions: set_option=0 … source-material=0 OK`, exit 0; the worker's `gate.md` adds `build=0`.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 237 roadmaps, 2426 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Positions in `ORDER.txt`: ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SieveMethodsAndPrimePatterns 56, ProbabilisticAndMetricNumberTheory 61, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, this roadmap 271, ExplicitNumberFields 272. Every supplier is earlier.
- `lake env lean` on `Suggested.lean` printed exactly 16 warnings, all `declaration uses sorry`, at lines 171, 203, 210, 215, 225, 240, 262, 287, 304, 327, 345, 371, 382, 398, 411 and 422.
- There is no change outside the folder.

**Signatures and padding.**

- I appended `#check @name` for all 31 declarations to a scratch copy and elaborated it.
  - Every type matches its README statement, and the file has no `variable` block.
  - `1 - 4 * (∏ p) / ∏ q` elaborates as `1 − (4P)/Q`.
  - `t ^ (-(1 / 3))` and `n ^ (1.538 * log 2 / log (log n))` are `Real.rpow`.
  - `signatures.md` lists 32 declarations, but its "instance, line 92" is the word "instance" in a docstring, an artefact of the tool.
- One-tactic probe: each `sorry` was replaced by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega | (aesop; done)`. It fails with exactly 16 errors, one per theorem.
- Headlines: every end theorem of the Summary is stated, and the docstring names the three groups it does not state, with the reason for each.

**Seeded sample: the locators I opened.**

- **0.3.**
  - `akhileshRamare2017` lines 319–338 (Lemma 2.1: `6/(11X)` for `X ≥ 1`, `γ/X` for `X > 0`).
  - `ramare1995` lines 356–366 (Lemma 3.3, `a = 3 exp(−1 − γ/3) ≈ 0.9105`, pp. 657–658).
- **1.3.**
  - `ramare2013aa` lines 261, 263 and 265 ((4.5)–(4.7)).
  - `elMarraki1995` lines 231–244 (input (1.1) `x/4345` from `2 160 535`, cut `T = 166.42`, check from `142 194`).
- **1.8.** `daval2023` is uncertified. I re-derived Lemme 1 from `μ·log = −μ⋆Λ` and the hyperbola split.
- **2.1.**
  - `tao2010` lines 111–135 (Theorem 1.1 and its proof).
  - `balazard2012` line 108 (`x m(x) ∈ [2 − x, x]`).
  - `ramare2013facm` lines 21–38 (Theorem 1.1, `−(11/15)(1 + ε)`) and lines 46–51 (the question about `−2323/30030`).
- **2.4.**
  - `ramare2015mc`: lines 248–274 (Lemma 1.9); 297–307 (Theorem 1.12); 314–325 (Theorem 1.13); 329 ((1.7)); 1023–1025 (Lemma 7.4); 1086–1089 (Lemma 8.3); 1108 ((9.1)).
  - `ramare2014aa` lines 74–81.
  - `bordelles2015` lines 88–100 (`C_m = 1100(1 + 4e^{−1}√ζ(m + 1/2))²`, `⌈C₁⌉ = 12 555`).
- **3.4.** `daval2025` is uncertified. I re-derived the extremal value (table).
- **5.1.**
  - `ramare1995` lines 339–354 (Lemma 3.2; the OCR loses the formulas).
  - `trudgian2015` lines 433–450 (Lemma 15, with `U = 2AH(0)` and the noted misprint).
- **5.3.** `ramare2016mc` lines 540–565 (Lemma 4.3 and its proof) and line 589 (its use together with the convolution).
- **5.5.** `ramare2009` is uncertified. The statement is refuted as written (R01).
- **6.1.** `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` exists at `Mathlib/NumberTheory/EulerProduct/Basic.lean` line 142.
- **6.5.**
  - `vanLintRichert1965` lines 69–78 (the definitions of `H(x)` and `S_k(z)`, and Lemma 1; the OCR is garbled).
  - `ramare1995` lines 334–337 (Lemma 3.1, whose formula the OCR loses).
  - I verified the two inequalities directly.
- **7.1.**
  - `moserMacLeod1966` lines 8–14, 81 and 88.
  - `ramare2013aa` lines 267–276 (Lemma 4.6).
  - `cipu2015` lines 621–626.
  - `ramare2016mc` lines 450–466.
  - `ramare2019bcp` lines 83–88.
- **8.1a.** `dusart2018` is uncertified. I recomputed the numbers (table).
- **8.3.** `bordelles2005` and `languascoZaccagnini2009` are uncertified. I re-derived the transfer `η = c/log x + 3c/(2 log² x)` by Abel summation.
- **9.1.** `robin1983aa` lines 29 (Théorème 6), 43 (Théorème 8), 44–48 (Théorème 11) and 445–464 (the maximum at `k = 9`, `1.38401`).
- **Also opened.** `berkaneBordellesRamare2012` lines 182–189 and 1125–1159.

**Adversarial table.**

- Every value below was computed in this review in long double.
- Sieves:
  - `μ`, `λ` and the squarefree count to `2.5·10⁷`;
  - the primes and `ψ` to `4.7·10⁷`.
- Method:
  - Carriers constant on unit intervals or on gaps between primes were evaluated at both ends.
  - Where the weight allows an interior extremum, it was added.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 0.3 `R₁` | `X = 1`, `X → 2⁻`, `t = e^{−3−γ}` | `0.4228`; `X|R₁| = 0.540726 < 0.5454`; `3` against `0.9105·3.29502 = 3.00012` | sound | — |
| 1.2–1.3 thresholds | `x ≤ 2.5·10⁷` | last violations `1118`, `617 972`, `2 160 534`; ratios `0.996743`, `0.999505`; `max(|M| − x/80) = 5.5125` at `199` | sound | — |
| 1.5 `abs_moebiusSum_le_ramare` | `[1 078 853, 2.5·10⁷]`; hypotheses | last violation `1 078 852`; max ratio `0.997384` at `1 078 853`; `ψ/x ≤ 1.038821` (at `113`); `|ψ − x|/√x ≤ 0.75090` on `[1500, 4.7·10⁷]`; field (vii) `≤ 0.006499`; `hψ₅` `≤ 0.005764` on `[1.52·10⁶, 4.7·10⁷]` | sound | — |
| 1.6, 2.4 star sums | `y ≤ 10⁵`, real | `M`: `1.56566` (at `5`), `0.99696` (`31`), `0.42856`, `0.19804`, `0.09141`, `0.49732`, `0.19711`, `0.09736`; `m`: `0.78312` (`[10, 11)`), `0.30134`, `0.12950`, `1.69315`, `0.47253`, `0.31853`, `0.14157` | sound | — |
| 1.6a `liouvilleSum_isLittleO` | `(1, 10⁶]` | `max |L| log x/x = 0.64983` at `32`; `L(10^k) = 0, −2, −14, −94, −288, −530`; no `L(n) > 0`; `x^{1/4}/log x = 40.80` at `1.75·10¹²` | sound | — |
| 1.8 identity | `x = y = 1` | `0 = 0`; `(0.571·160 383)² = 8.3867·10⁹`; cap `98 483` | sound | — |
| 2.1 `abs_moebiusDivSumIn_le_one` | `S = ∅`, `{2, 3}` at `6`, all primes at `13` | `1`, `1/3`, `−0.0773560 = −2323/30030` | sound | — |
| 2.2 `abs_moebiusDivSum_le_balazard` | `x = 1, 2` | `1 ≤ 11/3`; `0.5 ≤ 1.583` | sound | — |
| 2.3 rows | real `x ≤ 2.5·10⁷` | last violations `6`, `40`, `1418`; log rows `686`, `3354`, `3461`, `24 269`, `96 017`, `96 954`, `96 954`; `0.0130894` at `120 560`, `0.0129924` at `120 561` | sound | — |
| 2.4 values | `q = 2`; `q = 6` | `m₂(10) = 34/105`, `0.2606`; `x → 5⁻`: `0.305430`; `m₆(30) = 0.299894`; `C₁ = 12 554.9` | sound | — |
| 3.1 `abs_moebiusLogSum_sub_one_le` | `x = 1, 1.5, 2` | `1 ≤ 2`; `0.595 ≤ 1.594`; `0.3069 ≤ 1.293` | sound | — |
| 3.4 extremal value | `[2, 3)`; `[3, 2.5·10⁷]` | `u = 0.871235`, value `0.165328`; `sup = 0.126373 < 0.162` | sound | — |
| 5.1 `norm_sum_mul_sub_le_comparison` | `h = δ`; `H̄`; weighted form | conclusion = hypothesis; `H̄(−1/3) = 2.804053`, `H̄(−2/5) = 4.042080`; `tS(t) − ∫₀ᵗS = 2ut log t + (v − 2u)t` exactly (no `W`) | sound | — |
| 5.2 `sum_tau_div_model` | `t = 1`, `2⁻`, `0.01`, `1/2`; `[1, 237)` | `0.521 ≤ 1.16`; `0.65418`; `5.766 > 5.384`, `≤ 7.617`; `0.081 ≤ 2.07`; `(3·0.961/1.16)⁶ = 235.68` | sound | R02 |
| 5.3 second model | `h = δ`, `t = 1/2` | reduces to 0.4; `H(2)/8 ≤ H̄(c)/2^{c+1}` for `c ≤ 2` | sound | — |
| 5.5 Levin–Fainleib | `κ = 1`, `g = 2/p` on odd-index primes | hypothesis 1 within `1.2002`; `A = 1.158`; `Σ|f_p − 1| = 2.372` at `4.26·10⁶`, diverging; log partial product `→ −0.448891` | absolute-convergence claim false | R01 |
| 6.1 product bound | `f = 1`, `y = 2, 3`; `f = n`, `y = 4` | `3/2 = 3/2`; `11/6 ≤ 2`; `4 ≤ 6` | sound | — |
| 6.3 `sum_le_hall_tenenbaum` | `f = 1`; `f = δ` | `B = 1.982335`, `A + B + 1 = 4.368630`; `A, B ≥ 0` forced and `1 ≤ (A + B + 1)x/log x` | sound | — |
| 6.4–6.5 | `f = 2^ω`, `x = 10`; `f = 1`, `d = 2`, `x = 4` | `23 ≤ 27.43 ≤ 32.42`; `3 ≤ 4 ≤ 6`; without `μ²`: `8 > 4` | sound | — |
| 7.1 squarefree | `[1, 2.5·10⁷]` | `R(n)/√n ∈ [−0.1032287 (380), 0.6790902 (3)]`; real inf `−0.152632` (`2⁻`); last `0.5` violation on `[7, 8)`; `0.1333`: last `1663`; `0.02767`: last integer `437 780`, last real interval `[441 352, 441 353)`; `Σμ²/n − (6/π²) log N ∈ [0.57862, 1.16546]`, `[1.04049, 1.04707]` from `1000`; hand-offs `14 830.6` and `4.5709·10⁸ ≤ 4.58·10⁸`; `R(351 115) = 21.6756 > 21.5913` | sound | — |
| 7.8 Kumchev et al. | `x = 2, 3, 3.77, 10¹⁸` | `8.758`, `15.054`, `19.035`, `1.815·10⁶`; root `3.76270`; `10¹⁸ + 1` has three distinct prime factors | sound | — |
| 8.1 `mertens_product_explicit` | `[24 284, 4.7·10⁷]` | hypothesis and four conclusions: 0 violations | sound | — |
| 8.1 `mertens_product_axler` | `(1, 4.7·10⁷]`; threshold | `E ≥ −η_A` and conclusion: 0 violations; `η_A + 1/(x − 1) ≤ log(1 + 0.07/L³)` from `392 687.000` (margin `4.70·10⁻¹³`; fails at `392 686` by `5.85·10⁻¹²`) | sound | — |
| 8.1a `mertens_product_dusart` | near `2 278 382`; `[2 278 382, 4.7·10⁷]` | `(1 − Q₁)L³ = 0.199960`, `(Q₂ − 1)L³ = 0.199973` at `2 278 382`; failures up to `2 278 381.5756` and `2 278 381.7111`; next prime after `2 278 379` is `2 278 421`; minimum margins at `3 445 943` (`0.198397`, `0.198409`); `E ≤ 0.19992/L³` from `2 278 383`: 0 violations | sound | — |
| 8.3 progressions | `q = 2`, `4` | `e^γ/2 = 0.89054`; `0.98531` at `x = 5`; `∏_a C(4, a) = 2e^{−γ}` | sound | — |
| 9.1 `cardDistinctFactors_le_robin` | `k = 3 … 30`; step | `1.079732`, `1.384013` (`9`), `1.355023` (`16`), `1.318852` (`26`); deficit max `1.203374` at `k = 31` on `[27, 2·10⁸]`; last failure of `log(kℓ)/ℓ ≤ 1.3841` at `26` (`1.38525`) | sound | — |
| 9.2 `sigma_zero_le_nicolasRobin` | `6 983 776 800` | `f₂ = 1.537940`; `2304 ≤ n^{0.341603} = 2304.6` | sound | — |
| 9.3a criterion and theorem | `n = 10⁴, 10⁶, 70, 89 693²` | `(3.01145, 3.09989)·10⁻⁴`; `3.00008` against `3.28775` (`·10⁻⁶`); `1.04905 > 0.98066`; `3.00405 < 3.36685` with `ε = 6.7424·10⁻⁴` | sound | — |
| 9.4 `div_totient_lt_rosserSchoenfeld` | primorials `p_k ≤ 3·10⁶`; boundary | max `2.5063693` at `k = 9`; at `p_k = 24 284`: `18.0025 < 18.1436`; `hθ`: no violation on `[563, 4.7·10⁷]` | sound | — |

**Library declarations opened at the pins.**

- Mathlib:
  - `Nat.lcmUpto`, `Nat.factorization_lcmUpto` and `Chebyshev.psi_eq_log_lcmUpto` (`NumberTheory/Chebyshev.lean` 211, 220, 311);
  - `Chebyshev.theta_le_log4_mul_x` (191), `psi_eq_theta_add_sum_theta` (429), `abs_psi_sub_theta_le_sqrt_mul_log` (442), `psi_le_const_mul_self` (485);
  - `ArithmeticFunction.liouville` and `isMultiplicative_liouville` (`ArithmeticFunction/Liouville.lean` 31, 51);
  - `Nat.primesLE` (`PrimeCounting.lean` 133);
  - `Complex.borelCaratheodory` (`Analysis/Complex/BorelCaratheodory.lean` 109);
  - `LSeriesSummable_moebius_iff`, `LSeries_one_eq_riemannZeta` and `LSeries_one_mul_Lseries_moebius` (`LSeries/Dirichlet.lean` 69, 312, 322);
  - `LFunction_ne_zero_of_one_le_re` and `LFunction_apply_one_ne_zero` (`LSeries/Nonvanishing.lean` 404, 412);
  - `eulerProduct_hasProd` and `eulerProduct_completely_multiplicative` (`EulerProduct/Basic.lean` 175, 367);
  - `sum_mul_eq_sub_integral_mul₀` (`AbelSummation.lean` 210);
  - `Nat.card_divisors` (`ArithmeticFunction/Misc.lean` 225);
  - `eulerMascheroniSeq_lt_eulerMascheroniConstant`, `eulerMascheroniConstant_lt_eulerMascheroniSeq'`, `one_half_lt_eulerMascheroniConstant` and `eulerMascheroniConstant_lt_two_thirds` (`Harmonic/EulerMascheroni.lean` 159–174);
  - `hasSum_zeta_two` (`ZetaValues.lean` 453);
  - `pi_gt_d6` and `pi_lt_d6` (`Pi/Bounds.lean` 178, 184);
  - and the others of the Mathlib contract (`Nat.sum_divisors_filter_squarefree`, `IsMultiplicative.prodPrimeFactors_one_sub`, `Nat.equivProdNatFactoredNumbers`, `hasDerivAt_tsum`, …).
- Tau Ceti:
  - every name of the contract, at `AbelSummation.lean` 252 and 279, `ArithmeticDirichletSeries/AbelSummation.lean` 129–372, `LFunctions/Mertens.lean` 545–564, `ArithmeticFunction/DivisorBounds.lean` 52, `EulerProduct/Basic.lean` 144–494, `PrimeCounting.lean` 90, `SumPrimeReciprocals.lean` 57 and `Perron/Formula.lean` 229;
  - `mertensConstant` is the `limUnder` of `Σ_{N𝔭 ≤ x} 1/N𝔭 − log log x`.
- Neither pin has a summatory Möbius or Liouville function, a Stieltjes constant, or highly abundant or highly composite numbers.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting (`bb08e9e`):
  - §0.1 (line 578, now titled "The Brun–Titchmarsh inequality"; `S(u)` at 581 and Büthe's `58/√u` at 604);
  - §1.1 (1184); §1.3 (1285, *ButheVerified*; *ButheFinerRange* gives only `0.81√x`, so the second clause of `gap:psi-initial-range` is still unmet);
  - §1.6 (1481, 1483); §1.7 (1521, 1523);
  - §3.1 (2241, `ε(40) = 1.93378·10⁻⁸`); §3.2 (2295–2296); §3.3 (2334); §3.5 (2685);
  - §4.2 (3066, 3075–3076); §4.3 (3131, 3169, 3176); §4.7 (3345);
  - §5.3 (3444); §6.1 (3646); §6.3 (3694–3750, where the exceptional clause enters for `q > 10⁵`); §7.4 (4207).
- ExplicitZetaBounds (`11dd87b`): §0.2 (437); §0.4 (538–548); §0.4b (606–612: `LeongRecord`, `BrentPlattTrudgianRecord`, `LuZamanZhaoRecord`); §4.1 (1304); §4.3 (1373); §4.8 (1730); §4.10 (1860); §6.1 (2148); §7.3 (2548–2560); §7.10 (2990–3025, whose items and records match lines 539–545 and 552–556).
- ExplicitCharacterSumsAndSieves (`b701b75`): §5.1 (1275–1277).
- AnalyticNumberTheoryPartI (`e22e67a`): §0.19 (572), §0.34 (847), §1.2 (911–913), and §3.23a's `BBRFiniteInput` (2595).
- SieveMethodsAndPrimePatterns (`a0ce011`): §0.5 (517–519) and §1.1 (1070).
- ProbabilisticAndMetricNumberTheory (`4cea849`): §3.7 (4148–4150).
- ZerosOfLFunctions on main: Layer 9 (1586) and *AllOnCriticalLine* (1619).
- ExplicitNumberFields (`4620ad9`) cites only §§1.2, 2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4 and Layer 0.7 propositions; all exist here.
- `citations.md` and `overlaps.md` list nothing.

**Ownership, duplication, gaps.**

- `roadmaps grep` over main and the open heads finds no second owner of the Liouville summatory function, highly abundant numbers, the explicit Mertens products, Hall–Tenenbaum or Levin–Fainleib. SieveMethodsAndPrimePatterns §1.1 is cited for the asymptotic form.
- `plan.json` has 17 gap slugs.
  - The five stated as contracts (lines 479–507) are still unmet at `bb08e9e`: `η_A`, `2.58843`, `0.05/√x`, `8.96237` and the `0.8√x` clause are absent.
  - The other twelve resolve to the supplier sections above.
- The sources cited for 9.3a, 5.1 and 7.1 are open texts.

## Not verifiable

- `leong2026` (1.9 items (a) and (b)): the cached text is image-only, and OCR is unavailable on this worker. The `[[missing]]` entry stands.
- The 6.5 locators `vanLintRichert1965` lines 60–90 and `ramare1995` Lemma 3.1, and the 5.1 locator `ramare1995` Lemma 3.2: the OCR keeps the lemma headings and loses the displayed formulas. The mathematics of 5.1 and 6.5 was verified directly.
- Uncertified sources, cited by locator, with their numbers recomputed where possible (table):
  - `ramare2009` (5.5), which is why R01 offers the alternative of stating a missing hypothesis;
  - `daval2023` and `daval2025` (1.8, 2.3, 3.4);
  - `dusart2018` and `axler2018` (8.1, 8.1a);
  - `bordelles2005` and `languascoZaccagnini2009` (8.3);
  - `dressElMarraki1993` and `cohenDressElMarraki2007` (1.3);
  - `deCamargo2025` (1.6, 2.4);
  - `mossinghoffOliveiraESilvaTrudgian2021` (the instance `10¹⁸ 18` of *SquarefreeGapVerified*);
  - `granvilleRamare1996` and `davenport1937` (2.1);
  - `plattTrudgian2018` and `rieselVaughan1983` (5.1, 5.2).
- Ownership was checked against every open roadmap pull request through `roadmaps grep`, not by reading each sibling checkout.

## Source issues

- **Error** in berkaneBordellesRamare2012 at §13, proof of Corollary 2.2, p. 19 (lines 1148–1159): the source says the remainder times `t^{1/3}` is at most `0.60` on `[1, 2]` and `0.57` on `[2, 3]`; it should be `0.6542` and `0.6057`, and the printed rows on `[5, 10]` match the constant `γ² − γ₁`; affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 (line 186): the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁`; affects a stated result; corrected in print at `trudgian2015` p. 10, footnote 1.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 (line 182): the source says it holds for all `t > 0`; it should say `t ≥ 1` (at `t = 0.01`, `5.766 > 5.384`); affects a stated result.
- **Error** in trudgian2015 at Lemma 14, p. 10 (line 426): the source says the `1.16` model holds for all `t > 0`; it should say `t ≥ 1`, or use `1.641` on `t > 0`; affects a stated result (Lemma 13).
- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`; affects nothing.
- **Error** in ramare2015mc at Theorem 1.2, p. 1361 (lines 130, 136): the source says `1/65` from `60 298` and `1/20` from `1426`; it should be `96 018` and `3355` (last violations `96 017` and `3354`); affects a stated result.
- **Error** in ramare2015mc at Corollary 1.3, p. 1361 (line 152): the source says `|m(x)| ≤ 1/100` from `694`; it should be from `1419` (`|m(1109)| = 0.011657`); affects a stated result.
- **Error** in ramare2015mc at Theorem 1.19, p. 1365 (line 428): the source says the first row holds with `1`; it should be `1.566`, since at `q = 1`, `x = 5` the value is `1.0438`; affects a stated result.
- **Error** in ramare2015mc at Lemma 7.4, p. 1376 (line 1025): the source says `0.779/log x` for every `x > 1`; it should be `0.784` at real arguments (`0.78312` as `y → 11⁻`); affects the proof.
- **Gap** in ramare2015mc at Theorems 1.12–1.13, pp. 1363–1364 (lines 304–305, 323–324): the source says `0.78`, `5/16` from `687`, `5/38` from `882` and `1/7` from `11 811`; its proof gives `0.784`, `0.320`, `0.320` and `0.143` (lines 1086–1087, 1108); affects the proof.
- **Error** in cipu2015 at Lemma 4.2(a), p. 214 (line 623): the source says `−0.103229√x ≤ P(x)` for real `x ≥ 1`; it should be stated at integers, since the ratio tends to `−0.152632` as `x → 2⁻`; affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(c), p. 214 (line 625): the source says `|P(x)| ≤ 0.036438√x` from `82 005`; it fails at `351 115` (`21.6756 > 21.5913`), so it should exclude that point or raise the constant; affects a stated result.
