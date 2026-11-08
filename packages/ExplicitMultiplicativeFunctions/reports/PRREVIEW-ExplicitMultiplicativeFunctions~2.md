# Review of ExplicitMultiplicativeFunctions (pull request #1946 at ca8f6c8)

**Verdict:** needs changes

This head repairs all eight findings of the review of `fa74009` (statuses are under Verified sound). Seven findings remain: one P1, one P2 and five P3. The P1 follows from the R04 repair: moving the odd squarefree form to Part II left Layer 5.6 consuming it. The push gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as the only warning. Below, `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`.

## R01 (P1) — Layer 5.6's third instance consumes the odd squarefree form that the Scope moves to Part II

- **Location.** `README.md` lines 2349–2354: "Prove its instances (Corollary 3.4 and Lemma 4.7 at `q = 2`) … `Σ_{ℓ ≤ X, ℓ odd} μ²(ℓ)/φ(ℓ) = ½(log X + a_2) + O*(2.169/√X)`". Also the Check at lines 2373–2375 and the Scope at lines 140–147.
- **Claim.** The third display is 5.1 at exponent `1/2`. Its model is `Σ_{d ≤ X, d odd} μ²(d)/d = (4/π²)(log X + C₂ + (log 2)/3) + O*(0.79/√X)` (`zunigaAlterman2022` Lemma 4.1, second part). The Scope now places that form in Part II, because its input, Helfgott's count of odd squarefree integers, has no owner. 5.6's *Needs:* line does not list it. So no layer, supplier or pinned declaration provides an input that the third display uses.
- **Witness.** `2.169 = 0.79 × ∏_{p>2}(1 + 1/((p − 1)(√p − 1))) = 0.79 × 2.745954 = 2.16930`, computed. `0.78957 = (4/π²)(C₂ + (log 2)/3)` is the odd form's constant (line 141).
- **Repair.** Choose one of two:
  - Move the third display to Part II together with its Check on `2.169` and the sentence comparing it with Akhilesh–Ramaré's `4.956/√X`. The first two displays need only 5.1 at `α = 1/3` and the constants of 7.2.
  - Keep it, and state the odd form as a target of 7.2, with the count of odd squarefree integers as a named Layer 0.7 proposition or a gap with an owner. Then list both in 5.6's *Needs:*.

## R02 (P2) — The linear-bound corollary of 1.7 is false for `1 < L < 10.06`

- **Location.** `README.md` lines 1487–1489: "for every real `L` with `1 ≤ L ≤ 8.7·10^6`, `|M(x)| ≤ x/L` for every real `x ≥ (0.571 L)²`, on `[(0.571 L)², 10^{16}]` by the table".
- **Claim.** `MoebiusTableVerified` covers only `x ≥ 33`. When `(0.571 L)² < 33`, that is `L < √33/0.571 = 10.061`, nothing covers `[(0.571 L)², 33)`, and the bound fails there.
- **Witness.** `L = 10`, `x = 32.7 ≥ 5.71² = 32.604`: `|M(32.7)| = |M(32)| = 4 > 3.27`. Also `L = 2`, `x = 1.5`: `1 > 0.75`.
- **Repair.** State the corollary for `10.07 ≤ L ≤ 8.7·10^6`. At `L = 10.07`, `(0.571 L)² = 33.06 ≥ 33`, so the table applies from the threshold. Add `L = 10`, `x = 32.7` as a negative-control Check.

## R03 (P3) — ExplicitCharacterSumsAndSieves §5.1 already has `Σ μ²(n)/φ(n)` and the `1/φ` case of 6.5, and this roadmap does not cite it

- **Location.** `README.md` line 122: "nothing is consumed from that roadmap". Also 6.5 (lines 2516–2523) and 7.2's Theorem 3.1 (lines 2675–2690).
- **Claim.** ExplicitCharacterSumsAndSieves precedes this roadmap in the merge order (`ORDER.txt` lines 272 and 273). Its §5.1 contains:
  - the carrier `selbergDiagonal`, `S(z) = Σ_{n ≤ z} μ²(n)/φ(n)`;
  - the van Lint–Richert comparison `S_k(z) ≥ (φ(k)/k) S(z)`, which is 6.5's first inequality at `f = 1/φ`;
  - Büthe's explicit asymptotic for `S(z)`.

  6.5 restates that comparison as a special case, and 7.2 proves other explicit forms of `S(z)`. Neither section, nor the Scope, records the relation.
- **Witness.** At `0655dd7`: ExplicitCharacterSumsAndSieves `README.md` lines 1367–1381 and `Suggested.lean` line 71 (`def selbergDiagonal`). 6.5 at `f = 1/φ` reads `Σ_{n ≤ x} μ²(n)/φ(n) ≤ (d/φ(d)) Σ_{n ≤ x, (n, d) = 1} μ²(n)/φ(n)`.
- **Repair.**
  - Cite ExplicitCharacterSumsAndSieves §5.1 in the Scope ("Consumed"), in 6.5 and in 7.2, for the carrier and for the `f = 1/φ` comparison.
  - Say in one clause how each statement kept here differs. 6.5 holds for every nonnegative multiplicative `f` and adds the upper inequality with `x·rad(d)`. 7.2 gives Ramaré's `2.44/√D` from `D ≥ 1` and the coprime form of Akhilesh–Ramaré, where Büthe gives `58/√z` from `10^9`.
  - Replace "nothing is consumed from that roadmap".

## R04 (P3) — The route of 1.9 uses a truncated Perron formula without naming an owner

- **Location.** `README.md` lines 1550–1556: "a truncated Perron formula for `M` and the three bounds for `1/ζ` …"; and "*Needs:* `gap:zeta-reciprocal-bounds`."
- **Claim.** The route uses a truncated Perron formula but names no owner for it. The pinned Tau Ceti has one. ExplicitZetaBounds §6.1, earlier in the order, owns the smoothed form and lists this roadmap as its consumer.
- **Witness.** `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` at `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean:229` (pin). ExplicitZetaBounds `README.md` line 2313 at `d7f47a1`: "`ExplicitMultiplicativeFunctions` takes 3.4 …, 6.1 (Perron)".
- **Repair.** Name the pinned declaration, or ExplicitZetaBounds §6.1, in the route and the *Needs:* line of 1.9. Add it to the matching supplier contract.

## R05 (P3) — The Summary still lists Robin's `σ(n)/n` bound as an end theorem

- **Location.** `README.md` lines 16 and 28–29: "The end theorems are … Robin's `σ(n)/n < e^γ log log n + 0.6483/log log n`".
- **Claim.** 9.3 now records this bound by its locator, with inputs "fixed only in the source". `Suggested.lean` (lines 35–38) leaves it unstated for that reason. Listing it as an end theorem overclaims what the roadmap delivers.
- **Witness.** `README.md` lines 3449–3451: "the exact forms of both inputs are fixed only in the source … the statement is therefore not one of the acceptance tests".
- **Repair.** Drop it from the Summary's end theorems and mention it with the statements recorded by locator; or move it to Part II beside Nicolas' Théorème 3.

## R06 (P3) — 0.6 claims the derivative formulas at `s = s₀`, where the series can diverge

- **Location.** `README.md` lines 645–652: "prove, for `s ≥ s₀`: … `H'(s) = H(s) Σ_p ℓ_p'(s)/ℓ_p(s)` … (termwise differentiation under absolute convergence on `s > s₀`)".
- **Claim.** `H̄(s₀) < ∞` does not make `Σ |h(n)| (log n) n^{−s₀}` finite, so `H'(s₀)` need not exist.
- **Witness.** Take `h` multiplicative with `h(p) = p^{s₀}/(p (log log p)²)` for `p ≥ 3` and `h = 0` on every other `n > 1`. Then `H̄(s₀) = 1 + Σ_p 1/(p (log log p)²) < ∞`, but `Σ_p log p/(p (log log p)²) = ∞`.
- **Repair.** State the product formula for `s ≥ s₀` and the two derivative formulas for `s > s₀`. Layer 5.1 uses only `s = 0 > s₀`.

## R07 (P3) — Numerical slips in 1.4 and 9.1

- **Location and witness.**
  - (a) Line 1161: "whose total is `0.591062`". The sum `Σ_{p^k ≤ 286, k ≥ 2} min(log p, 1)/p^k` is `0.5910648`.
  - (b) Line 1212: "`2 log 3 − 2 log log 3 = 2.00900`". The value is `2.009129`. So the difference at line 1214 is `2.009129 − 1.186297 = 0.822832`, not `0.8227`.
  - (c) Line 3342: "`n = 223 092 870`: `9 ≤ 9.0004`". In fact `1.3841·19.223108/2.956113 = 9.000567`.
- **Repair.** Write `0.591065`, `2.00913`, `0.8228` and `9.0006`. The first value only enters as a lower bound, so the margin of 1.4's route is unchanged.

## Verified sound

**The previous review (of `fa74009`), finding by finding.**

| Id | Then | At this head | Status |
|---|---|---|---|
| R01 (P1) | 2013 transfer chain did not close | 1.5 (lines 1292–1313) replaces the single-`ρ` scheme by one that splits the arguments `y` of `R₂*` at `Y₀ = 1.1·10^8` and `Y = 1.8·10^9`. It adds the lower bound `0.578` (hypothesis `hQ''`), runs field (ii) to `2.3104·10^{12} = 1 520 000²`, and handles `[K·X_A, (K + 1)·X_A)` with the table. I re-derived the scheme by Abel summation: its error part `(c₊ − c₋)(g(K + 1) + J) + c₊ρ` dominates the exact `(c₊ − c₋)(g(K + 1) + J − g(Y)) + c₊ρ`. Values are in the table below. | repaired |
| R02 (P1) | `ε₁` mistranscribed | line 998: "`(4/3)({t}³ − (3/2){t}² + (1/2){t})/t² − (1/3)({t}⁴ − 2{t}³ + {t}²)/t³`", with Checks at `2⁻` and `1.5` | repaired |
| R03 (P1) | Lemma 8.1 sign | line 1025: "`… + k ∫_{D₀}^D M_k(f, t) dt/(t log^{k+1} t)`", with the Check `f = 1_{n=3}` | repaired |
| R04 (P1) | four unowned inputs | El Marraki's (3.1) is now Schoenfeld's inequality, a target of 1.4 with route and *LambdaDeviationRangeVerified*. Helfgott's inputs, the source's Lemma 5.4, Palojärvi–Tudzi and the checks `X < 47` and `[1, 1573]` moved to Part II (lines 135–147). | repaired; the move causes R01 |
| R05 (P2) | Robin `σ` headline without hypotheses | deleted from `Suggested.lean`; the docstring (lines 35–38) gives the reason | repaired; the Summary is R05 |
| R06 (P2) | Rankin-type bound with two owners | Downstream bullet (lines 3562–3565): "this roadmap precedes that one … and owns the bound, so §3.7 is a consumer of 6.1". ProbabilisticAndMetricNumberTheory at `e4c4e53` still proves it (its line 4002); that repair belongs to its own pull request (ORDER.txt line 275 > 273). | repaired here |
| R07 (P2) | vague, compound `zeta-reciprocal-bounds` | the contract (lines 425–430) now gives three bounds, each with constant, region and range. The companions moved to Part II. The plan's `needs` sentence, outside this pull request, still names the companions. | repaired in the README |
| R08 (P3) | four slips | (a) line 1506 now `1.5708·10^{−7}`, `6.37·10^6`; (b) removed with old 2.6; (c) line 1890 `0.2999…`; (d) line 2201 `235.7` | repaired |

**Gate, build, dependency check.**
- I ran the gate: every check is 0 and the result is OK.
- `gate --depcheck … --movable` prints `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` gives exactly 12 `sorry` warnings (lines 169–351) and nothing else.
- `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Signatures and padding.**
- I appended `#check @name` for all 25 declarations to a scratch copy of `Suggested.lean`. Each elaborated type matches its README statement. No declaration depends on a section `variable`. The new hypothesis `hQ''` is the 7.1 lower bound, which holds for every real `y ≥ 1`: its minimum is `0.578617`, as `y → 2⁻`.
- Padding probe: I replaced each `sorry` by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | exact le_rfl | (intro _; simp; done)`. All 12 fail.
- Every definition is used by a headline. Each headline the Summary names is stated, or named in the docstring as not stated (1.10, Robin `σ`, the preprint rows).

**Library declarations at the pins.** 81 Mathlib and Tau Ceti names from the supplier contracts resolve by `#check`. Three Tau Ceti names sit in modules with no build, so I read them in the source:
- `TauCeti.sigma_le_rpow_mul_tsum` (`ArithmeticFunction/DivisorBounds.lean:52`);
- `Nat.primeCounting_nth_prime` (`PrimeCounting.lean:90`);
- `Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop` (`SumPrimeReciprocals.lean:57`).

I also opened `truncatedPerronKernel` (`Perron/Basic.lean:142`), `truncatedPerronKernel_one` (`:204`), `truncatedPerron_LSeries` (`Perron/Formula.lean:130`) and `norm_truncatedPerron_LSeries_sub_sum_le` (`:229`).

**Cross-roadmap citations resolved, at the stated heads.**
- ExplicitPrimeCounting at `65f9a25`, 14 sections:
  - §1.1 (`RH(H)`, line 758), §1.3 (`ButheVerified`, 849), §1.6 (1095–1096), §1.7 (1125, 1135);
  - §3.2 (1688–1689), §3.3 (1738), §3.5 (1942);
  - §4.2 (`0.0067/log x` from `1.52·10^6` and `1/(4 log x)` from `115`, 2262–2265; the second is newly cited);
  - §4.3 (2337–2340, 2357–2359), §4.7 (2548), §5.3 (2661–2675), §6.1 (2880), §6.3 (2941).
- AnalyticNumberTheoryPartI at its open head, 17 sections: §§0.8, 0.11, 0.19 (newly used by 1.4: `x ≥ 286`, line 566), 0.21, 0.26, 0.34, 3.1, 3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a (`BBRFiniteInput` conjuncts 1 and 4 at line 2385), 3.35, 3.35a.
- SieveMethodsAndPrimePatterns at `39cf901`: §0.5 (487–489) and §1.1 (991).
- ZerosOfLFunctions Layer 9 on main `3b3f7ef` (*AllOnCriticalLine*, line 1619).

**Declared gaps.**
- None of the six contract gaps is provided at ExplicitPrimeCounting `65f9a25` or ExplicitZetaBounds `d7f47a1`. I searched for `0.8 √x`, `3/(16 log`, `2.58843`, `0.05/√x`, `8.96237`, `30.812`, `1237` and `e^{146}`. ExplicitZetaBounds §7.10 has only `431.7 log t/log log t` on the line `σ = 1`.
- Each README contract has the same slug as the plan.
- The eleven other slugs are cited as supplied, and each matches the ExplicitPrimeCounting section above.

**Overlap.**
- `overlaps.md` lists no other pull request changing this roadmap and no dropped ids. I confirmed both.
- The only roadmap citing ids of this one is ExplicitNumberFields (via `roadmaps show`). It cites §§2.3, 2.5, 7.1, 7.5, 7.9, 9.1 and 9.4, all present after the renumbering 2.7 → 2.6.
- Ownership against the open pull requests listed in the brief was searched by object: Levin–Fainleib, Hall–Tenenbaum, Nicolas–Robin, the Stieltjes constant, Möbius tables, `μ²/φ`, van Lint–Richert, Mertens products, Schoenfeld's `Σ |Λ(n) − 1|/n` and `4345`. The new owners found are R03 and R04.
- For information: ExplicitNumberFields declares `gap:rh-mertens-product` on §8.1, asking for the RH lower bound from `x ≥ 23.8`, while 8.1 gives it from `24.4`. It holds on `[23.8, 24.4)`: `0.163588 ≥ 0.163397`.

**Sources sampled.** Each target was checked at its locator for the theorem number, the hypotheses and that the source supports the statement as written.

| Target | Lines read | Result |
|---|---|---|
| 0.1 | (definitions only) | values recomputed (table) |
| 0.6 | `ramare1995` 367–379 | description consistent; displays missing in the Numdam text |
| 1.1 | `balazard2012` 78–109, 140–152, 176–202, 298–330, 416–472; `ramare2015mc` 444–462, 650–692 | identity (2.1), (2.3) and Proposition 6 match the README; misprints recorded |
| 1.3 | `ramare2013aa` 259–265 | (4.5)–(4.7) match |
| 1.4 (new) | `schoenfeld1969` 103–122 (Lemma 2, (10), `x ≥ 32` and the check on `(1, 32)`); `elMarraki1995` 96–132, 228–246 | consistent; (3.1) itself is not legible |
| 2.6 | — | uncertified (below) |
| 3.1 | `ramare2015mc` 150–165, 574–600, 650–692; `ramare2015corr` 8–34 | I re-derived the coefficient `5 − 4γ` from line 661 and (2.1) |
| 5.2 | `berkaneBordellesRamare2012` 60–78, 180–198, 1120–1162; `trudgian2015` 413–452; `cullyHugillTrudgian2021` 188–202 | match |
| 5.5 | — | `ramare2009` uncertified; SieveMethodsAndPrimePatterns §§0.5, 1.1 resolved |
| 6.1 | — | own route, re-derived (table) |
| 6.4 | — | `bordelles2012` uncertified; route re-derived |
| 6.5 | `vanLintRichert1965` 55–95 | OCR too garbled to read the inequality; route re-derived |
| 7.4 | `berkaneBordellesRamare2012` 64–75, 192–197 | match |
| 8.1, 8.3 | — | uncertified sources; transfers re-derived |
| 9.4 | `nicolas2008` 25–70 | Théorème 1 (2)–(4) consistent; the threshold `211` of (3) confirmed numerically |

The README flags no locator as unverified.

**Adversarial table.** "Ends" means both ends of every unit interval.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.5 `abs_moebiusSum_le_ramare` (headline): split scheme | `D = K·2 160 535`, `2.3104·10^{12}`, `10^{13}`, `10^{14}` | `0.21191 + 1.34·10^{−5}` / `0.21520`; `0.22275` / `0.22609`; `0.24173` / `0.24514`; `0.27154` / `0.27507`. Terms `g(K + 1) = 0.034515`, `J = 0.000230`, `0.020430`, `0.047418`, slope `0.012949` | sound | — |
| 1.5 Abel step | weighted sum at `D = K·2 160 535` | `0.15150` / `0.17452` | sound | — |
| 1.5 single-`ρ` control | same `D` | `0.25110` / `0.21520` | Check correct | — |
| 1.5 `R₂*` ratios | `[462 849, 1 435 319]`; `[1 435 319, 2·10^8]` | max `0.021093` at 463 206; `0.012308` | Checks correct | — |
| `RamareTransferComputations` (i), (iv)–(vii) | integers to `2·10^8`, ends | (i) `1.365813` at 36 917 058 ≤ 1.80, `1.451911` at 110 102 617 ≤ 1.93; (iv) `161.66 ≤ 162.46`; (v) `−3.48518`; (vi) slack `191.75` at 2 161 205; (vii) `0.006499` at 1 514 928 ≤ 0.0065 | hold | — |
| 1.5 `ρ(D)` | `D = 2.3104·10^{12}` | `0.000941 + 0.000913 + 0.0065 + 0.009846 + 0.000213 + 2·10^{−7} = 0.018414` / `0.0213` | sound | — |
| 1.5 threshold | `D = 1 078 852`, `1 078 853`; `[1 078 853, 2.2·10^6]` | `350 > 349.915`, `349 ≤ 349.915`; 0 violations | sound | — |
| 1.1 `ε₁` | `t = 1.5`, `2⁻` | `17/162 = 0.104938`; `φ₃ = 1/3`, `φ₄ = 4/27`; `1/6 = ε₁(2)`; `t⁴` variant `0.106996` | sound | — |
| 1.1 Lemma 8.1 | `f = 1_{n=3}`, `k = 1`, `D₀ = 2`, `D = 4` | `0.79248 + 0.20752 = 1` | sound | — |
| 1.1 identity (2.1) | `x = 2` | `0 + 1/2 − 1/12 + 1/12 = 1/2`; with `3x²` in the cubic term `0.5417` | sound | source issue |
| 1.4 Schoenfeld | `x = 3`; integers to `2·10^7`; `x ≥ 286` | `1.186297` / `2.009129`; minimum difference `0.822832` at 3; actual minimum `1.404141` at 286, route margin `1.3201`; limit `1.45560` | sound | R07 (a), (b) |
| 1.4 inputs | `B > 0.261097`; `Σ_{p≤286} 1/p` | `2.009442 − 1.748345`; prime-power sum `0.5910648` | sound | R07 (a) |
| 1.7 corollary on `x/L` | `L = 10`, `x = 32.7`; `L = 2`, `x = 1.5` | `4 > 3.27`; `1 > 0.75` | false | R02 |
| 1.3 thresholds | 617 972; 2 160 534 | `262 > 261.85`, `498 > 497.25`; ratios `0.996743`, `0.999505` | sound | — |
| 0.1 carriers | `M`, `m`, `m̌` | `M(5) = −2`, `M(13) = −3`, `m(5) = −1/30`, `m(30) = −0.030475`, `m̌(30) = 1.003021`, `m̌(1.5) = 0.405465` | sound | — |
| 0.6 | `h = μ/n²`; `s = s₀` | `ζ(5/3)/ζ(10/3) = 1.850797`, `H'(0) = 0.346495`; `h(p) = p^{s₀}/(p (log log p)²)`: `H̄(s₀) < ∞`, `H'(s₀)` diverges | boundary false | R06 |
| 2.1 Tao (headline) | `S = ∅`, `{2}`, `{2, 3}` at `x = 6` | `1`, `1/2`, `1/3` (all ≤ 1) | sound | — |
| 2.2 Balazard (headline) | `x = 1`, `2`; `[1, 2·10^6]`, ends and midpoints | `1 ≤ 3.667`; `0.5 ≤ 1.583`; min slack `5.28·10^{−5}` | sound | — |
| 2.6 RZA Corollary 1.2 | `X = 617 990` | `4.329·10^{−4}` against `5.176·10^{−4}` (Ramaré) and `9.755·10^{−4}` (Daval) | sound | — |
| 3.1 `m̌` (headline) | `x·`poly on `[1, 21]`; `x = 1`; `[1, 2·10^6]` | range `[−1.071149, 0.4608)`, minimum at 1.17115; `−1` (printed `6 − 4γ` gives `−2`); min slack `6.47·10^{−5}` | sound | — |
| 5.1 comparison (headline) | `h = δ`; `H̄(−α)` for `h(d²) = μ(d)/d²` | `H = 1`, `H' = H'' = 0`; `2.804053` (`α = 1/3`), `4.042080` (`α = 2/5`) | sound | — |
| 5.2 model (headline) | `γ² − 2γ₁`; `sup_{(0,1)}`; `t = 0.01` | `0.478810` vs `0.405994`; `1.640819` at `e^{−7.2163}`, `1.050286` at `e^{−6.2284}`; `5.76625 > 5.38424`, `< 7.61685` | sound | — |
| 5.5 Levin–Fainleib | `g = δ`; `g = μ²/n` | `L = A = B = 0`, `C = 1`, sum `1`; `A = 0.49309`, `C = 6/π²` | sound | — |
| 5.6 third display | `0.79·2.745954`; `0.78957·2.745954` | `2.16930`; `2.16812`; `(4/π²)(C₂ + (log 2)/3) = 0.789570` | input unowned | R01 |
| 6.1 product bound | `f = 1` at `y = 2`, `3`; `f = τ` | `3/2 = 3/2`; `11/6 ≤ 2`; loss `2e^{2γ} = 6.34` | sound | — |
| 6.3 Hall–Tenenbaum (headline) | `f = 1`; signs of `A`, `B` | `1.3863 + 1.98233 + 1 = 4.3686`; `hA` at `y = 1` and `hB` at `N = 0` force `A, B ≥ 0` | sound | — |
| 6.4 Bordellès | `f = τ`, `x = 2`; `f = μ²`, `x = 2` | `3 ≤ 4`; `2 > 1.5` (hypothesis needed) | sound | — |
| 6.5 van Lint–Richert | `f = 1`, `d = 2`, `x = 4`; without `μ²` | `3 ≤ 4 ≤ 6`; `8 > 4` | sound | R03 |
| 7.4 divisor remainder | `[1, 2·10^5]`, ends; 1980, 5460, 5559, 9994; left limits at 5760, 6720, 7560, 9995 | max `0.960695` at 12; `22.3388 > 22.249`, `31.3907 > 29.557`, `−0.7053`, `−2.5302`; `−30.5947`, `−33.0864`, `−35.0370` (against `30.1302`, `32.5443`, `34.5185`), `−12.8944` | sound | — |
| 8.1 Mertens product (headline) | `x = 2`, `3`, `11`; tail at 2; `x = 24 284` | `0.617271`; `0.652235 ∈ [0.171, 1.414]`; `0.887446 ∈ [0.826, 1.087]`; tail `0.122596 > 0`; `1.0125·10^{−3}` / `4.892·10^{−3}` | sound | — |
| 8.1 Axler (headline) | `x = 46 909 074` | `(η_A + 1/(x − 1)) log³ x = 0.060732 < 0.07` | sound | — |
| 8.3 progression transfer | `η` re-derived; `q = 1`; `q = 2`; `q = 4`, `x = 5` | `c/log x + 3c/(2 log² x)`; `C = 1.83675` at `X₀ = 286`; `e^γ/2 = 0.890536`; `C ≥ 0.98531` | sound | — |
| 9.1 Robin `ω` (headline) | `n = 223 092 870`; `1.38` | `9 ≤ 9.000567`; `8.9739 < 9` | sound | R07 (c) |
| 9.2 Nicolas–Robin (headline) | `n = 6 983 776 800`; `43 243 200` | `f₂ = 1.537940`; `f₃ = 1.591409` | sound | — |
| 9.4 Rosser–Schoenfeld (headline) | `n = 223 092 870`; `ω ≤ 2` | `6.112911`, constant `2.506369`; `2√(2.50637 e^γ) = 4.225649 > 3`; monotone from `y ≥ 26.44` | sound | — |
| 9.4 Nicolas' forms | `n ≤ 10^6` | last failure of `3 log log φ(n)` at 210; `3.652786` at 6; `2.955038` at 30 030 | sound | — |

## Not verifiable

These are settled as uncertified, so they are cited by locator only and I did not request them:
- `ramareZunigaAlterman2025` (2.6, 1.10), `ramareZunigaAlterman2026` (1.4 companion);
- `ramare2009` (5.5), `bordelles2012` (6.4), `hallTenenbaum1988` (6.3);
- `rosserSchoenfeld1962` and `axler2018` (8.1, 9.4), `bordelles2005` and `languascoZaccagnini2009` (8.3);
- `robin1984` and `axlerNicolas2023` (9.3, 9.4), `plattTrudgian2018` and `rieselVaughan1983` (5.2);
- `leeLeong2022` (the three `1/ζ` bounds of the gap), `zunigaAlterman2022` (5.6, 7.2).

Other items I could not check:
- The displays of `ramare1995` Lemmas 3.1–3.3 and of `elMarraki1995` (3.1) are missing from their text extractions.
- The OCR of `vanLintRichert1965` §1 is too garbled to read the inequality.
- Field (ii) of `RamareTransferComputations` beyond `2·10^8`.
- `MoebiusTableVerified 0.571 10^{16}` beyond `2.2·10^6`.

## Source issues

- **Misprint** in ramare2015mc at (2.3), printed p. 1366: the source says the last term of `ε₁` has denominator `t⁴`; it should be `t³`, as in Balazard (gives `ε₁(1.5) = 0.104938`, not `0.106996`); affects nothing.
- **Misprint** in ramare2015mc at (2.1), printed p. 1366: the source says the cubic term is `4(1 − 1/x)³/(3x²)`; it should be `/(3x)`, as restated on p. 1369 (at `x = 2` the printed form gives `0.5417 ≠ 1/2`); affects nothing.
- **Misprint** in ramare2015mc at Lemma 3.2, printed p. 1369: the source says the `1/x²` coefficient is `6 − 4γ`; it should be `5 − 4γ`, from its own intermediate identity (`−2` against `−1` at `x = 1`); affects nothing.
- **Error** in ramare2013aa at Lemma 4.5, printed p. 6: the source says the `0.0067/log x` bound holds from `x ≥ 23`; it should be from `x ≥ 1.52·10^6` (at 23: `0.053 > 0.0021`); affects the proof of Lemma 6.1.
- **Error** in ramare2013aa at the proof of Lemma 7.2, printed p. 12: the source says one ratio `0.0213` closes the scheme for `D/K ≥ 2 160 535`; it fails there (`0.2511` against `0.2152`), and a split scheme closes it; affects the proof of Theorem 1.1.
- **Misprint** in ramare2013aa at Lemma 8.1, printed p. 13: the source says the integral enters with `− k ∫`; it should be `+ k ∫` (`f = 1_{n=3}`, `k = 1`: `0.585` against `1`); affects nothing.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁` (`0.478810`; the sum at `10^6` gives `0.47890`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says `1.16 t^{−1/3}` holds for all `t > 0`; it holds for `t ≥ 1` only (`|P(0.01)| = 5.766 > 5.384`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, printed p. 1: the source says `0.397` from `x ≥ 5560` with witness 5559; it should be real `x ≥ 7560` (`Δ(7560⁻) = −35.037`), integer witness 5460 (`Δ(5559) = −0.705`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.2, printed p. 2: the source says `|Δ(9994)| > 0.80·9994^{1/3} log 9994` shows sharpness; it should be withdrawn, since `Δ(9994) = −2.530`; affects nothing.
- **Error** in trudgian2015 at Lemma 14, printed p. 10: the source says the divisor model with `1.16` holds for all `t > 0`; it should be `1.641` on `t > 0` (`5.766 > 5.384` at `t = 0.01`); affects a stated result (Lemma 13's constants).
