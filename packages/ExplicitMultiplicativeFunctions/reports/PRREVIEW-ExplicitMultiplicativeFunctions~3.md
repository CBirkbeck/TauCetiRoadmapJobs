# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 6490eee)

**Verdict:** needs changes

This head repairs all seven findings of the review of `ca8f6c8` (statuses under Verified sound). Five findings remain: one P2 and four P3. The push gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as the only warning. Below, `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`.

## R01 (P2) — Layer 1.10's ratio bound for `R₂*` uses the ψ̃-difference below the range of `gap:psi-tilde-difference`

- **Location.** `README.md` lines 1625–1631: "Lemma 6.1 of 1.5 with `gap:psi-tilde-difference` (`|r(y) − R(y)/y| ≤ 0.05/√y + 1.75·10^{−12}` for `y ≥ 394 385`) … giving … `|R₂*(X)| ≤ 0.011 X` for `X ≥ 1.8·10^9`". Also the contract at lines 433–436.
- **Claim.** Lemma 6.1 bounds `R₂*(X)` through `r` at `y = √X`. The gap covers `y ≥ 394 385`, that is `X ≥ 1.5554·10^{11}`.
  - Field (iv) of *RamareZunigaAltermanComputations* (`1.93 √X log X`) stops at `2.1·10^{10}`.
  - So for `X ∈ [2.1·10^{10}, 1.5554·10^{11})` the route needs `r(y) − R(y)/y` at `y ∈ [144 914, 394 385)`.
  - No declared input covers that range. ExplicitPrimeCounting §4.2 has only `1/(2√y) + 1.75·10^{−12}` from `8950`, ten times weaker there.
- **Witness.** At `X = 2.1·10^{10}`, `y = 144 914`, the §4.2 form gives `2ε = 0.00263`. With `2|R₄| ≤ 0.010` (the route's own `0.005 X`) and `η(X) log X = 0.00062`, the total is `0.0132 > 0.011`.
- **Repair.**
  - Declare a gap with a new slug at the package stage, because the plan's `needs` sentence for `gap:psi-tilde-difference` is fixed. Supplier: ExplicitPrimeCounting §4.2.
  - Its content is Vanlalngaia's Theorem 9, second part, for every real `x ≥ 2`: `|r(x) − (ψ(x) − x)/x| ≤ 0.047/√x + 1.884/x + 1.75·10^{−12}` (`vanlalngaia2017` lines 193–195).
  - The existing gap is this form with the `1/x` term absorbed, which happens exactly from `(1.884/0.003)² = 628² = 394 384`.
  - If you prefer a minimal contract, `0.052/√y + 1.75·10^{−12}` for every `y ≥ 144 914` suffices, and the source's form implies it.
  - Cite the new gap in 1.10's route and *Needs:* line. Say that field (iv) gives the ratio on `[1.8·10^9, 2.1·10^{10}]` (`1.93 log X/√X ≤ 3.2·10^{−4}` there) and the analytic argument covers the rest.
  - Tested at the refuting instance: `2ε = 2(0.047/380.68 + 1.884/144 914) = 0.00027`, so the total is `≈ 0.0109 ≤ 0.011`.

## R02 (P3) — Layer 2.3 states the `0.0144` row from `463 421`, a narrower range than its source supports

- **Location.** `README.md` line 1779: "`1/69` for `x ≥ 96 955`, `0.0144` for `x ≥ 463 421`".
- **Claim.** `ramare2015mc` line 138 allows `0.0144` in place of `1/69`. So the source's row is `(log x)|m(x)| ≤ 0.0144` from `x ≥ 96 955`, and the README cuts its range by a factor of almost five.
- **Witness.** On `[1, 1.2·10^6]` the last unit interval with `log(N + 1)|m(N)| > 0.0144` starts at `N = 96 954`, the same as for `1/69`. Beyond `463 421`, Theorem 1.2 gives `(log x)|m(x)| ≤ 0.0144 − 0.1/log x`.
- **Repair.** State `0.0144` for `x ≥ 96 955`, with locator line 138. Prove it as the conjunction of Theorem 1.2 beyond `463 421` and *MoebiusDivRangeVerified* on `[96 955, 463 421]`, the scheme this paragraph already uses for its other rows.

## R03 (P3) — Two uncertified Rosser–Schoenfeld statements lack the quotation the Conventions ask for

- **Location.**
  - 9.4, lines 3565–3570: "(`rosserSchoenfeld1962` pp. 71–72, (3.40)–(3.42))".
  - 8.1, lines 3172–3176: "(`rosserSchoenfeld1962` p. 70, Theorems 7–8, (3.26)–(3.30) …)".
  - Conventions, lines 232–235: "where a statement taken from it is also quoted by another source, that quotation is cited beside it".
- **Claim.** `rosserSchoenfeld1962` is uncertified. Two legible texts in the cache restate these results, and 8.1 and 9.4 cite neither.
  - `nicolas2008` lines 23–26 restate the headline of 9.4, `n/φ(n) ≤ e^γ log log n + 2.50637/log log n` for `n ≥ 3`.
  - `ivic1977` line 52 restates `∏_{p ≤ x} p/(p − 1) < e^γ log x (1 + 1/log² x)` for `x > 1`, the fourth inequality of 8.1. 9.3 already cites that line, for Ivić's own use.
- **Witness.** `nicolas2008` lines 24–25 (OCR) show the constant `2.50637`, the range `n ≥ 3`, and the attribution to Rosser–Schoenfeld. `ivic1977` lines 48–52 attribute their (3)–(5) to Rosser–Schoenfeld; (5) is the product bound, quoted with `x > 1`.
- **Repair.** In 9.4, cite `nicolas2008` lines 23–26 beside `rosserSchoenfeld1962`. In 8.1, cite `ivic1977` line 52 beside it, for the upper bound of the second quotient.

## R04 (P3) — Numerical and locator slips in 1.4, 1.9, 1.10 and 2.3

- **(a)** 1.4, line 1220: "the three are also quoted at `bordelles2015` lines 64–66". Those lines quote two bounds: Théorème 2 (`0.10917`, `x ≥ 685`, line 65) and Théorème 3 (`362.7`, `x > 1`, line 66). Neither Théorème 1 nor the Corollaire appears there. Repair: "the second and the fourth are also quoted at `bordelles2015` lines 64–66".
- **(b)** 1.9, lines 1607–1608: "once `log x` exceeds about `5500`". The equation `33.56 L e^{−√(L/5.56)} = 4.88346 L^{−2.35}` has its root at `L = 5204.2`. Repair: "about `5200`".
- **(c)** 1.10, line 1650: "`= 3 524`". In fact `(0.0130/16.1181 − 0.118/259.793)·10^7 = 3 523.4`. Repair: `3 523`.
- **(d)** 2.3, line 1841: "exceeds `1/65` from `D ≈ 66 900`". The quantity `(0.026/log D − 0.118/log² D) log D = 1/65` at `log D = 0.118/(0.026 − 1/65) = 11.1159`, that is `D = 67 235`. Repair: "`≈ 67 200`".

## R05 (P3) — The description does not name ExplicitCharacterSumsAndSieves as a supplier

- **Location.** The pull-request description:
  - its "Depends on" list names four roadmaps: AnalyticNumberTheoryPartI, ExplicitPrimeCounting, ExplicitZetaBounds and SieveMethodsAndPrimePatterns;
  - its merge-order chain ends "… (ExplicitZetaBounds) → … (ExplicitPrimeCounting) → this pull request".
- **Claim.** The README now consumes ExplicitCharacterSumsAndSieves §5.1, a roadmap that is still in its own open pull request. It does so in the contract (lines 446–453), the *Needs:* line of 7.2 (line 2760) and Layer 7's *Dependencies* (line 3154).
  - The description names it in neither paragraph.
  - Its sentence "everything else named in the README is a consumer, not a prerequisite" no longer holds for it.
- **Witness.** `ORDER.txt` line 272 places ExplicitCharacterSumsAndSieves directly before this roadmap (line 273). README line 2760 reads "ExplicitCharacterSumsAndSieves §5.1 (the carrier `selbergDiagonal` of `G₁`)".
- **Repair.** Add ExplicitCharacterSumsAndSieves to the "Depends on" list, and to the merge-order chain between ExplicitPrimeCounting and this pull request. No reordering is needed.

## Verified sound

**The previous review (of `ca8f6c8`), finding by finding.**

| Id | Then | At this head | Status |
|---|---|---|---|
| R01 (P1) | 5.6's third display consumed the odd squarefree form that had moved to Part II | 5.6 (lines 2406–2416) keeps only the two `X^{−1/3}` displays. The odd form and its `2.169/√X` consequence are in the Part II list (lines 150–156). The Euler-product field is gone from *ArithmeticalConstantsEnclosure* (lines 869–873). New Check at `q = 2`, `X = 100`, recomputed (table). | repaired |
| R02 (P2) | 1.7's corollary was false for `1 < L < 10.06` | line 1530: "for every real `L` with `10.07 ≤ L ≤ 8.7·10^6`", with the non-example Check at lines 1550–1553 | repaired |
| R03 (P3) | ExplicitCharacterSumsAndSieves §5.1 not cited | Now cited in the Scope (lines 115–122, 130–132), the contract (446–453), 6.5 (2587–2590), 7.2 (2746–2749, 2760) and Downstream (3637–3639), each with how the kept statement differs. | repaired; the description lags (R05) |
| R04 (P3) | 1.9's Perron formula had no owner | route lines 1599–1603 and *Needs:* lines 1610–1612; Mathlib contract lines 278–280; Tau Ceti contract lines 315–320; ExplicitZetaBounds contract lines 457–459 | repaired |
| R05 (P3) | Summary listed Robin's `σ` bound as an end theorem | lines 29–32: "stated by its locator beside Nicolas' proved bounds for `σ(n)/n` (9.3), not as an end theorem" | repaired |
| R06 (P3) | 0.6 claimed derivatives at `s = s₀` | lines 683–689 split the claims into `s ≥ s₀` and `s > s₀`; new boundary Check at lines 712–718 | repaired |
| R07 (P3) | three slips | line 1204 `0.591065`; lines 1255–1257 `2.00913`, `0.8228`; line 3410 `9.0006`, `8.02`, least constant `1.384013` | repaired |

**Gate, build, dependency check.**

- I ran the gate. Every check is `0` and the result is `OK`.
- `gate --depcheck … --movable` prints `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` gives exactly 12 `declaration uses 'sorry'` warnings (lines 169–351) and nothing else.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- No process words (grep for review, repair, round, pull-request numbers, `lemma`). Every layer ends with `### Examples` and `### Dependencies`.

**Signatures and padding.** `Suggested.lean` is unchanged since `ca8f6c8`.

- I appended `#check @name` for all 25 declarations to a scratch copy. Each elaborated type matches its README statement, and none depends on a section `variable`.
- Padding probe: I replaced each `sorry` by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | exact le_rfl | (intro _; simp; done) | (constructor <;> simp; done)`. All 12 theorems fail.
- Headlines: the Summary's end theorems are each stated (1.5, 2.1, 2.2, 3.1, 5.1, 5.2, 6.3, 8.1 twice, 9.1, 9.2, 9.4). The docstring names the ones not stated: 1.10, Robin's `σ`, and the preprint rows.

**Library declarations at the pins.**

- 91 Mathlib and Tau Ceti names from the contracts and *Needs:* lines resolve by `#check`. The exception is the short form `prodPrimeFactors_one_sub` (line 560), which abbreviates the contract's full name.
- Mathlib `ArithmeticFunction.LSeriesSummable_moebius_iff` (`NumberTheory/LSeries/Dirichlet.lean:69`); root-namespace `LSeries_one_eq_riemannZeta` (`:312`) and `LSeries_one_mul_Lseries_moebius` (`:322`).
- Tau Ceti names whose modules have no build, read in the source:
  - `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` (`ArithmeticDirichletSeries/Perron/Formula.lean:229`): hypotheses `0 < x`, `0 < c`, `0 < T`, `f n ≠ 0 → x ≠ n`, `LSeriesSummable f c`; bound `Σ' ‖f n‖ (x/n)^c/(πT|log(x/n)|)` against `Σ_{n ∈ Ico 1 ⌈x⌉₊}`, as the contract says;
  - `perronIntegrand` (`Perron/Basic.lean:75`, `x^{c+it}/(c+it)`);
  - `TauCeti.sigma_le_rpow_mul_tsum` (`DivisorBounds.lean:52`), `Nat.primeCounting_nth_prime` (`PrimeCounting.lean:90`), `Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop` (`SumPrimeReciprocals.lean:57`).

**Cross-roadmap citations, resolved at the stated heads.**

- ExplicitCharacterSumsAndSieves at `0655dd7`, §5.1 (lines 1365–1403): `selbergDiagonal` (`Suggested.lean:71`), the coprime comparison for integers `k ≥ 1` and real `z ≥ 1`, and `58/√z` from `10^9` with the constant `γ + Σ_p log p/(p(p − 1)) = c₀`. Its README does not cite this roadmap, so there is no cycle.
- ExplicitZetaBounds at `d7f47a1`, §6.1 (lines 1538–1566): the smoothed truncated Perron formula, finite at integers. Its line 2313 lists this roadmap as the consumer of §6.1.
- ExplicitPrimeCounting at `65f9a25`, §4.2 (lines 2250–2290): `1/(2√x) + 1.75·10^{−12}` from `8950`, `0.0067/log x` from `1.52·10^6`, `1/(4 log x)` from `115`. Previous review's other 13 sections: same head.
- AnalyticNumberTheoryPartI (`roadmaps show`): all 16 sections resolve: §§0.8, 0.11, 0.19, 0.21, 0.26, 0.34, 3.1, 3.7, 3.9, 3.12, 3.22, 3.22a, 3.22b, 3.23a (with `BBRFiniteInput`), 3.35, 3.35a.
- SieveMethodsAndPrimePatterns at `39cf901`: §0.5 (*HasLogSieveDimension*, line 489) and §1.1 (line 991 onward).
- ExplicitNumberFields at `0990742` cites §§2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4 of this roadmap; all exist.

**Declared gaps.**

- The 17 slugs of the brief are precise.
- The six README contracts (`psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference`, `psi-log-power`, `zeta-reciprocal-bounds`) carry the plan's slugs. The other eleven are cited as supplied and match ExplicitPrimeCounting at `65f9a25`.
- None asks for something already provided. `psi-tilde-difference` is ten times sharper than §4.2's form; ExplicitZetaBounds `d7f47a1` has no `1237`, `30.812` or `e^{146}` bound.
- R01 concerns the range of `psi-tilde-difference`, not its precision.
- The plan's `needs` for `zeta-reciprocal-bounds` still mentions "companions". The README contract (lines 461–466) gives three precise bounds, and the companions are in Part II (lines 159–161). This is not a finding, because the plan sentence is fixed.

**Overlap and ownership.** Ownership was searched by object in the open pull requests given with checkouts.

- `overlaps.md` lists no other pull request changing this roadmap and no dropped id; I confirmed both.
- `roadmaps grep` for Levin–Fainleib, Hall–Tenenbaum, Nicolas–Robin and superior highly composite numbers, the Stieltjes constant, `def …moebius…`/`mertens…` carriers, `selbergRemainder` and `2.50637` finds:
  - only this roadmap, SieveMethodsAndPrimePatterns (cited for the Levin–Fainleib shape), AnalyticNumberTheoryPartI's `divisorError` (consumed), and ExplicitNumberFields as a consumer of 9.4;
  - no other roadmap defines `γ₁`. The Stieltjes hits in AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, ArithmeticDirichletSeriesPartII and EffectiveClassNumbers are Stieltjes integrals and transforms.

**Sources sampled.** The README flags no locator as unverified.

| Target | Lines read | Result |
|---|---|---|
| 0.2 | `ramare2015mc` 224–230 ((1.5)), 248–274 (Lemma 1.9), 329 | match; `31/105` misprint confirmed |
| 0.5 | `moserMacLeod1966` 8–14; `berkaneBordellesRamare2012` 64–68, 182–189 | match |
| 1.4 | `schoenfeld1969` 52–57 and 110–115 (OCR: Lemma 2, (10), the check on `(1, 32)`); `elMarraki1995` 231–264; `bordelles2015` 64–66 | match; R04 (a) |
| 1.9 | Tau Ceti and Mathlib declarations above; ExplicitZetaBounds §6.1 | owners match; `leeLeong2022` uncertified |
| 1.10 | `vanlalngaia2017` 186–195 (Theorem 9) | R01; `ramareZunigaAlterman2025` uncertified |
| 2.1 | `tao2010` 111–142; `balazard2012` 100–108; `ramare2013facm` 21–51 | match |
| 2.3 | `ramare2015mc` 116–152; `ramare2013aa` 50–65 and 726–759; `bordelles2015` 69–77 | corrected rows confirmed; R02 |
| 3.2 | `ramare2015corr` 13–32; `ramare2015mc` 169–190 | match; the range correction to `x ≥ 2` confirmed |
| 3.3 | `ramare2015mc` 264–285; `ramare2013facm` 54–66 | match |
| 3.4 | — (`daval2025` uncertified) | extremal value recomputed |
| 5.5 | SieveMethodsAndPrimePatterns §§0.5, 1.1 | shape matches; `ramare2009` uncertified |
| 6.3 | — (`hallTenenbaum1988`, `bordelles2024` uncertified) | both routes re-derived |
| 6.4 | — (`bordelles2012` uncertified) | route and local-factor identity re-derived |
| 8.2 | `vanlalngaia2017` 91–108 (Theorem 4), 118–131 (Theorem 5, p. 3: `|ε| < 2`, `x ≥ e^{22}`, `0.841`) | match |
| 9.4 | `nicolas2008` 23–49 (Théorème 1, OCR) | match; R03 |

**Adversarial table.** Computed in C (sieves to `2.2·10^7`) and Python. "Ends" means both ends of every unit interval.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.2 coprime decomposition | `q = 2`, `x = 10` | `m₂(10) = 34/105 = 0.32381`; `m(10) + m(5)/2 + m(2)/4 + m(1)/8 = 0.090476 − 0.016667 + 0.125 + 0.125` | sound | — |
| 0.2 semigroup | `S = {2, 3}`, `x = 6`; `S = ∅` | `1/3`; `m_∅ = 1` | sound | — |
| 0.5 squarefree remainder | `x = 176, 7, 8` | `Q(176) = 106`, `R = −0.99517`; `R(7) = 1.74451 > 1.3229`; `R(8) = 1.13658 ≤ 1.4142` | sound | — |
| 0.5 `γ₁` | `N = 10`, `10^6` | `0.041228` vs `γ₁ + log 10/20 = 0.042313`; `−0.0728089`, `−0.0728158` after `log N/(2N)` | sound | — |
| 5.2 constant term (headline) | `t = 10^6`; `t = 0.01` | `0.478901` vs `γ² − 2γ₁ = 0.478810` (`γ² − γ₁ = 0.40599`); `|P| = 5.766 > 5.384`, `< 7.617` | sound | — |
| 0.6 boundary (new Check) | `h(p) = p^{s₀−1}/(log log p)²` | `H̄(s₀) = ∏(1 + 1/(p(log log p)²)) < ∞`; `Σ log p/(p(log log p)²) ~ log x/(log log x)² → ∞` | sound | — |
| 1.4 Schoenfeld | integers of `[3, 2·10^7]`; `(1, 3)` | minimum difference `0.822832` at `3` (`1.186297 / 2.009129`); left side `1`, `1.153426` against `≥ 2` | sound | — |
| 1.4 route | `x ≥ 286` | `B > 2.009442 − 1.748345 = 0.261097`; prime powers `0.5910648`; margin `1.3201`; limit `1.45560` | sound | — |
| 1.4 thresholds | `684 / 685`; `142 193 / 142 194`; `(1, 3000]` | `12 ≥ 11.4388`, `11 < 11.4530`; `123 > 122.5628`, `122`; last violations `684`, `142 193` on `[2, 2.2·10^6]`; max `0.64377516` at `5` | sound | — |
| 1.2 MacLeod | `[1, 1118]`; `[1119, 2.2·10^6]` | max `|M(N)| − N/80 = 5.5125` at `199`; last `|M| > N/80` at `1118` | sound | — |
| 1.3 finite ranges | the two ranges | ratios `0.996743`, `0.999505`; `M(617 972) = −262`, `M(2 160 534) = −498` | sound | — |
| 1.5 threshold (headline) | `1 078 852 / 1 078 853`; `[1 078 853, 2.2·10^6]` | `350 > 349.9153`, `349`; 0 violations; `∫_1^{1 078 853} |M|/t = 301.9049` | sound | — |
| 1.7 corollary (repaired) | `L = 10.07`; `L = 10`, `x = 32.7`; `x = 10^{16}` | `33.0622 ≥ 33`, `3 ≤ 3.2832`; `4 > 3.27`; `1.139955·10^{−7} < 1.149425·10^{−7}` | sound | — |
| 1.9 | `log x = 4589.2`; crossing | `5.133·10^{−8}` vs `1.212·10^{−8}`; misreading `0.787`; crossing at `5204.2` | slip | R04 (b) |
| 1.10 | `X = 10^7`; `X = 2.1·10^{10}` | `2648.2` vs `3523.4`; ratio total `0.0132` (declared inputs) vs `0.0109` (Theorem 9, all ranges), against `0.011` | input range missing | R01, R04 (c) |
| 2.1 Tao (headline) | `S = ∅, {2}, {2, 3}`; all primes at `13` | `1`, `1/2`, `1/3`, `−0.077356` | sound | — |
| 2.2 Balazard (headline) | `[1, 2·10^6]`, right ends (where the bound is least) | minimum slack `5.284·10^{−5}` at `1 911 028` | sound | — |
| 2.3 rows | `[1, 1.2·10^6]` | last violating intervals `686, 3354, 3461, 24 269, 96 017, 96 954, 96 954` (`1/12 … 1/69, 0.0144`); `|m|` rows `6, 40, 1418`; Cor. 1.2, Thm 1.2, Bordellès: 0 violations | sound | R02 |
| 2.3 `1/65` crossing | `0.026 − 0.118/log D = 1/65` | `D = 67 235` | slip | R04 (d) |
| 3.1 Ramaré (headline) | `[1, 2·10^6]`, 9 points per interval; polynomial part | minimum slack `6.47·10^{−5}`; range `[−1.07115` at `1.1711`, `0.46076)` | sound | — |
| 3.2 rows | `[1, 10^6]`, ends and interior extremum | last violating intervals `1, 6, 3161, 9548` and `6, 43, 221`; `(1 − log 2) log 2 = 0.21269`; failure set `(1.3602, 1.9984)` | sound | — |
| 3.3 | `m̌` on `[1, 10^6]` | max `1.00302134` at `30`; min `0` at `1` | sound | — |
| 3.4 extremal value | `[1, 10^6]`; `[3, 10^6]` | `0.1653279` at `2.38986` (`= 2(2 − log 2)³/27`); `0.126373` at `3.155 ≤ 0.162` | sound | — |
| 5.1 comparison (headline) | `h = δ`; `n = 0` term | conclusion = hypothesis; `0^α = 0` for `α > 0` | sound | — |
| 5.5 Levin–Fainleib | `g = δ`, `κ = 0`; `g = μ²/n` | `B = 0`, `C = 1`; `A = 0.49309`, `C = 6/π²` | sound | — |
| 5.6 (changed) | `q = 2`, `X = 100`; `X → 1⁻` | `3.13799` vs `3.14216 ± 1.0664`; no factor: `6.28433`; `A₂ = 0.67252`; `q = 1`: `1.3326 ≤ 7.36` | sound | — |
| 6.3 Hall–Tenenbaum (headline) | `f = 1` | `B = 1.98233` (`1.0397, 0.4578, 0.1811, 0.1004`); `A + B + 1 = 4.3686` | sound | — |
| 6.4 | `f = μ²`, `x = 2`; `f = τ`, `x = 2` | `2 > 1.5` (excluded); `3 ≤ 4` | sound | — |
| 6.5 (changed) | `f = 1/φ`, `d = 6` | factor `3 = 6/φ(6)`; supplier Check `S₆(7) = 1.4167 ≥ 1.139` | sound | — |
| 7.1 Cipu's rows | `x = 351 115`; `x = 1.9` | `R = 21.6756 > 21.591`; `R = −0.15506 < −0.14229` | README correct | source issues |
| 7.2 Zuniga Alterman's form | `X → 1⁻`; `X = 4/3` | `(6/π²) C₂ = 1.04389`; `0.56/√log(4/3) = 1.0441` | sound | — |
| 8.1 Mertens product (headline) | `x = 24 284`; `x = 2, 3, 11, 100, 283, 293` | `1.01247·10^{−3} < 4.89185·10^{−3}`; quotients `0.6173, 0.6522, 0.8874, 0.9869, 0.9833, 0.9860` in their windows | sound | — |
| 8.1 Axler (headline) | `x = 392 687, 392 686`; `46 909 074` | margin `+4.70·10^{−13}`, `−5.85·10^{−12}` (threshold exact); `0.060732` | sound | — |
| 8.2 tilted products | `ε = ±1`; `x = e^{22}` | `γ(−1) = −0.31572 = B − γ`, `e^{γ(1)+B} = 1.08276 = (6/π²)e^γ`; `2.79·10^{−10} ≤ 2.82·10^{−10}` | sound | — |
| 9.1 Robin (headline) | `k = 8, 9`; step for `k ≥ 27` | `8 ≤ 8.0153`, `9 ≤ 9.000567` (least `1.384013`); shortfall max `1.203374` at `31`; last failure `26` (`1.385245`) | sound | — |
| 9.2 Nicolas–Robin (headline) | `n = 6 983 776 800` | `f₂ = 1.537940 ≤ 1.538` | sound | — |
| 9.4 Rosser–Schoenfeld (headline) | primorials to `3·10^6`; `n ∈ [3, 10^6]`; `ω ≤ 2` | max `2.5063693` at `k = 9`; 0 violations (max `2.468674` at `30 030`); `4.22565 > 3`; increasing from `26.44` | sound | R03 |
| 9.4 Nicolas' forms | `n ≤ 10^6` | `3.652786` at `6`; last failure of `3 log log φ` at `210`; `2.955038` at `30 030` | sound | — |

## Not verifiable

- These are settled as uncertified, so I cite them by locator and did not request them:
  - `ramareZunigaAlterman2025` (1.10, 2.6) and `ramareZunigaAlterman2026` (1.4);
  - `leeLeong2022` (1.9), `johnstonLeongTudzi2024` (1.4), `daval2025` (2.3, 3.4);
  - `ramare2009` (5.5), `hallTenenbaum1988` and `bordelles2024` (6.3), `bordelles2012` (6.4);
  - `rosserSchoenfeld1962`, `axler2018`, `axler2022` (8.1, 9.4), `robin1984` and `axlerNicolas2023` (9.3, 9.4).
- `vanlalngaia2017` is extracted in a font whose digits print as letters (`a … i` = `1 … 9`, `]` = `0`). My reading of Theorem 9 (R01) and Theorem 5 (8.2) decodes it. The decoding fits Corollary 1's range `24 284`, which the README quotes, and the identity `628² = 394 384`.
- The displays of `elMarraki1995` are missing from its extraction. The OCR of `schoenfeld1969` and `nicolas2008` is legible only in part.
- I could not check field (ii) of `RamareTransferComputations` beyond `2·10^8`, or `MoebiusTableVerified 0.571 10^{16}` beyond `2.2·10^6`.

## Source issues

- **Misprint** in ramare2015mc at (1.7), printed p. 1363: the source says `|m₂(10)| = 31/105`; it should be `34/105`, since `31/105 = 0.2952` lies below the bound `0.3231` printed beside it; affects nothing.
- **Error** in ramare2015mc at Theorem 1.2 and Corollary 1.3, printed p. 1361: the source says the rows `1/20` hold from `1426`, `1/65` from `60 298`, and `|m| ≤ 1/100` from `694`; they hold from `3355`, `96 018` and `1419` (last failures `3354`, `96 017`, `1418`); affects a stated result.
- **Error** in ramare2015corr at Theorem 1.5, printed p. 2383, repeating ramare2015mc Theorem 1.5: the source says `|m̌(x) − 1| log x ≤ 0.213` for `x ≥ 1`; it should be `x ≥ 2`, since the value is `1/4` at `x = √e`; affects a stated result.
- **Error** in ramare2013aa at Lemma 4.5, p. 6 of the author's copy: the source says the `0.0067/log x` bound holds from `x ≥ 23`; it should be from `x ≥ 1.52·10^6` (at `23`: `0.0529` against `0.0021`); affects the proof of Lemma 6.1.
- **Error** in ramare2013aa at Lemma 6.4, p. 11 of the author's copy: the source says the integral of `(ψ(t) − t)/t` over `[1, 10^8]` is `−129.559`; it is `−147.768`; affects the proof only through a term below `10^{−10}`.
- **Error** in ramare2013aa at the proof of Corollary 1.2, p. 15 of the author's copy: the source bounds `∫_1^{1 078 853} |M(t)| dt/t` by `301`; the integral is `301.905`, so `302`; affects the proof (the margin absorbs it).
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁` (the sum at `10^6` gives `0.478901`, against `0.478810`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, printed p. 4: the source says the `1.16 t^{−1/3}` bound holds for all `t > 0`; it holds for `t ≥ 1` only (`|P(0.01)| = 5.766 > 5.384`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.1, printed p. 1: the source says `0.397` holds from `5560`, with sharpness witness `5559`; for real `x` it holds from `7560` (`Δ(7560⁻) = −35.037`), and the integer witness is `5460` (`Δ(5559) = −0.705`); affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Theorem 1.2, printed p. 2: the source says sharpness is shown at `9994`; it should be withdrawn, since `Δ(9994) = −2.530`; affects nothing.
- **Error** in trudgian2015 at Lemma 14, p. 10 of arXiv v1: the source says the divisor model with `1.16` holds for all `t > 0`; it holds for `t ≥ 1`, and `1.641` is needed on `t > 0`; affects a stated result (Lemma 13's constants).
- **Error** in cipu2015 at Lemma 4.2(c), printed p. 214: the source says `|P(x)| ≤ 0.036438 √x` from `x ≥ 82 005`; it fails at `x = 351 115` (`21.676 > 21.591`); affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(a), printed p. 214: the source says the lower constant `−0.103229` holds for real `x ≥ 1`; it holds only at integers, and the real constant is `−0.152632`; affects a stated result.
