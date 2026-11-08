# Review of ExplicitMultiplicativeFunctions (pull request #1946 at bb05bbe)

**Verdict:** needs changes

This is an incremental re-review of the 99 lines of `README.md` changed since `6490eee`. `Suggested.lean` is unchanged. Two P3 findings remain: one is new, in a Check the repair added, and one is the previous R05, which is not repaired. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. Below, `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`.

## R01 (P3) — The new Check at `y = 302 831` quotes values from the interval to its left

- **Location.** `README.md` lines 990–993, a Check of *PsiTildeDifferenceRangeVerified* (Layer 0.7): "at `y = 302 831` (on `[302 831, 302 832)`) `|r(y)| = 0.0012975`, so `√y |r(y)| = 0.714` … and `R(302 831) = −391.32` carries the cancellation".
- **Claim.** `302 831` is prime, so `ψ` and `ψ̃` jump there. The three numbers quoted are the limits as `y → 302 831⁻`, which belong to `[302 830, 302 831)`. They are not the values on the interval the Check names.
- **Witness.** I computed the values twice, once in C with long double and once in Python with `fsum`. On `[302 830, 302 831)`, as `y → 302 831⁻`: `R = −391.324`, `r = −0.0012975`, `√y|r| = 0.7140`. At `y = 302 831`: `R = −378.703`, `r = −0.0012558`, `√y|r| = 0.6911`.
- **Repair.** Keep the point and correct the values: "`|r(y)| = 0.0012558`, so `√y |r(y)| = 0.691` … and `R(302 831) = −378.70`".
  - Alternatively, keep the values and write "as `y → 302 831⁻` (on `[302 830, 302 831)`)", with `R(y) → −391.32`.
  - Tested at `y = 302 831`: `√y (r(y) − R(y)/y) = −0.00290`. So the difference stays far inside `0.052` while `r` alone exceeds it, and the Check's conclusion stands.

## R02 (P3) — The description still does not name ExplicitCharacterSumsAndSieves as a supplier

- **Location.** The pull-request description.
  - Its "Depends on" block lists four roadmaps: AnalyticNumberTheoryPartI, ExplicitPrimeCounting, ExplicitZetaBounds and SieveMethodsAndPrimePatterns.
  - Its merge-order chain ends "… (ExplicitZetaBounds) → … (ExplicitPrimeCounting) → **this pull request**".
- **Claim.** `README.md` consumes ExplicitCharacterSumsAndSieves §5.1, which is still an open pull request and not on main, in three places:
  - the contract heading at line 448;
  - the *Needs:* line of 7.2 at line 2809, "ExplicitCharacterSumsAndSieves §5.1 (the carrier `selbergDiagonal` of `G₁`)";
  - Layer 7's *Dependencies* at line 3203.

  The description names this roadmap nowhere. Its sentence "everything else named in the README is a consumer, not a prerequisite" is false for it. This is the previous R05, unchanged.
- **Witness.** `ORDER.txt` line 272 places ExplicitCharacterSumsAndSieves directly before this roadmap (line 273). The content repository's main has no ExplicitCharacterSumsAndSieves folder.
- **Repair.** Add ExplicitCharacterSumsAndSieves to the "Depends on" list. Add it to the merge-order chain between ExplicitPrimeCounting and this pull request. No README change and no reordering is needed.

## Previous findings

These are the findings of the review of `6490eee`.

- R01 — repaired: 1.10 (lines 1655–1665) uses field (iv) on `[1.8·10^9, 2.1·10^{10}]`, then Lemma 6.1, fed by *PsiTildeDifferenceRangeVerified* `0.052` on `[144 913, 394 385]` (0.7, lines 809–820) and `gap:psi-tilde-difference` from `394 385`; a new Check is at lines 1687–1694.
- R02 — repaired: 2.3, line 1822: "`0.0144` for `x ≥ 96 955` (line 138, which allows `0.0144` in place of `1/69`; it implies the `1/69` row…)"; the Check is at lines 1878–1880.
- R03 — repaired: 9.4 (line 3616) cites `nicolas2008` lines 23–26. 8.1 (lines 3221–3223) cites `ivic1977` line 52 for "the fourth, the upper bound of the second quotient".
- R04 — repaired: (a) line 1246 "the second and the fourth"; (b) line 1635 "about `5200`", with a new Check at line 1645 (`5204.2`); (c) line 1685 `3 523`; (d) lines 1888–1890 `11.1159`, "`D ≈ 67 200`".
- R05 — not repaired: the description's "Depends on" list and merge-order chain still omit ExplicitCharacterSumsAndSieves. It is raised again as R02.

## Verified sound

**Gate, build, dependency check, scope of the change.**

- I ran the gate: every check is `0`, the result is `OK`, and the exit status is `0`.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` gives exactly 12 warnings, each `declaration uses 'sorry'`, at lines 169, 196, 201, 211, 226, 248, 273, 290, 313, 328, 340 and 351. There is nothing else.
- `git diff --stat 6490eee..HEAD` touches only `README.md`. The diff outside the folder against `origin/main` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The added lines contain no process words, pull-request numbers, LaTeX delimiters or `lemma`.

**Signatures.** I appended `#check @…` for all 25 declarations to a scratch copy and elaborated it once.

- All 25 elaborate.
- The file has no `variable` block, so no binder can drop.
- Each type matches its README statement, as in the previous review. Nothing changed.
- The tool's count of 27 declarations includes a stray `of`, which comes from the docstring.
- Padding probe: the file is unchanged, so the previous probe stands (all 12 theorems resist the one-tactic probe).

**The R01 repair, recomputed.** I sieved `ψ`, `ψ̃` and `m` to `5·10^5` in long double with compensated sums.

- On every `[N, N + 1)` I took `f(y) = ψ̃(N) + γ + 1 − log y − ψ(N)/y`. It is concave, increasing below `ψ(N)` and decreasing above. I evaluated `√y |f|` at both ends and at `ψ(N)`. This confirms the README's description of the finite computation.
- The largest value of `√y|r − R/y|` on `[144 913, 394 385]` is `0.022661`, on `[164 921, 164 922)` with `ψ(164 921) = 164 916.80`.
  - `√y f` has its maximum on that interval at `y = ψ(N) + f y/2 = 164 921.40`, so "near `164 921.4`" is exact.
  - The largest negative value is `0.019429`, at `319 439`.
  - `c = 0.02` fails, while `0.05` and `0.052` hold.
- Vanlalngaia's printed form (`vanlalngaia2017` lines 190–195, decoded: `0.047/√x + 1.884/x + 1.75·10^{−12}` for `x ≥ 2`) is at most `0.052/√y` exactly from `y = 141 978.28`. At `144 913` it is `1.364660·10^{−4}`, against `1.365997·10^{−4}`.
- `(1.884/0.003)² = 394 384`, and `√(2.1·10^{10}) = 144 913.767`.
- Lemma 6.1 in the form of 1.5 (lines 1336–1340) at `X = 2.1·10^{10}` has these terms:
  - the ψ̃-difference term `2.7320·10^{−4}`;
  - `0.64/y = 4.416·10^{−6}`;
  - `0.94 log X/√X = 1.5417·10^{−4}`;
  - the integral term `1.2974·10^{−5}`;
  - `(1 + 2γ)/X = 1.0·10^{−10}`, which the Check omits harmlessly.

  With `0.010` for `R₄`, the total is `0.0104448 ≤ 0.011`. Every term decreases in `X`, so this is the worst point.
- With ExplicitPrimeCounting §4.2's form instead, the total is `0.0127985` at `2.1·10^{10}` and `0.0116602` at `X = 394 385²`. So the sharper input is needed exactly as the Check says.
- Field (iv) on `[1.8·10^9, 2.1·10^{10}]`: `1.93 log X/√X` is at most `9.6945·10^{−4}`, reached at `1.8·10^9`. The README's `9.7·10^{−4}` is right. The previous review's suggested `3.2·10^{−4}` was the value at the right end.
- This roadmap owns the new proposition, and it does not duplicate a supplier. ExplicitPrimeCounting §4.2 at `1ab1590` (lines 2342–2380) states only `|∫ₓ^∞ (ψ(t) − t)/t² dt| ≤ 1/(2√x) + 1.75·10^{−12}` from `8950`, which is the same quantity by its exact form, and Chirre–Helfgott's bound for `r` itself. It has no Theorem 9 form. Making the bounded range a Layer 0.7 hypothesis is consistent with the roadmap's convention, and it needs no new gap slug.

**The other changed passages.**

- R02 (2.3): `ramare2015mc` line 138 reads "replace 1/69 by 0.0144", and lines 129–137 give the rows with `1/69` from `96 955`. I computed `log(N + 1)|m(N)|`:
  - `N = 96 954` gives `0.0145113`, the last violation;
  - the maximum over `N ∈ [96 955, 463 420]` is `0.0143930`, reached at `N = 96 957, 96 959, 96 960`;
  - beyond `463 421`, Theorem 1.2 gives `0.0144 − 0.1/log x`.
- R03: `nicolas2008` lines 23–26 (OCR) attribute `n/φ(n) ≤ e^γ log log n + 2.50637/log log n` for `n ≥ 3` to Rosser–Schoenfeld. `ivic1977` line 52 gives `∏_{p ≤ x} p/(p − 1) < e^γ log x (1 + log^{−2} x)` for `x > 1`. That is the fourth inequality of 8.1's display (lines 3225–3226).
- R04 (a): `bordelles2015` line 65 quotes Théorème 2 (`0.10917`, `x ≥ 685`) and line 66 quotes `362.7 x/log² x` (`x > 1`), the second and fourth bounds of 1.4's list.
- R04 (b): the root of `33.56 L e^{−√(L/5.56)} = 4.88346 L^{−2.35}` is `L = 5204.17`. At that `L`, the `2.35` row (`9.02·10^{−9}`) is the smallest of 1.4's rows; for comparison, `2.91890/L² = 1.08·10^{−7}` and `0.430429/L^{31/16} = 2.71·10^{−8}`.
- R04 (c): `3523.39` and `2648.18` at `X = 10^7`.
- R04 (d): `log D = 11.11594`, `D = 67 234.5`.

**Cross-roadmap citations of the changed passages, resolved at the current heads.**

- ExplicitPrimeCounting at `1ab1590`:
  - §1.3 *ButheVerified* (line 932, `0.94 √x` for `11 < x ≤ 10^{19}`);
  - §3.2 (line 1773, `ψ(x) < 1.03883 x`);
  - §3.3 (line 1825, `0.006409 x/log x` for `x > e^{22}`);
  - §4.2 (line 2342).
- ExplicitCharacterSumsAndSieves at `3fa29b0`: §5.1 at README line 1343, `selbergDiagonal` at `Suggested.lean` line 65. Its README does not cite this roadmap, so there is no cycle.
- ExplicitZetaBounds at `3e44c3f`: §6.1 at line 1682.
- ExplicitNumberFields at `4198f62` cites §§2.3, 2.5, 7.1, 8.1, 9.1 and 9.4 of this roadmap; all exist. No other roadmap mentions the moved `0.0144` row (`roadmaps grep --fixed 0.0144`).
- `overlaps.md` lists no pull request that changes this roadmap and no dropped id. I confirmed both.
- The change adds no gap slug. The `gap:psi-tilde-difference` contract (lines 433–438) keeps the plan's `needs` sentence, and the README's slugs still match `plan.json`'s 17.

**Seeded sample.** 1.9 is the one sampled target the change touches. I recomputed its changed text above; `leeLeong2022` and `johnstonLeongTudzi2024` are uncertified. The other sampled targets (0.2, 1.3, 2.1, 3.1, 3.2, 4.1, 5.2, 5.4, 5.5, 6.1, 6.4, 7.1, 7.7, 8.3) are untouched by the diff.

**Adversarial table.** The rows for changed statements were computed in this review. The rows for untouched statements are carried from the review of `6490eee`, with the values computed there.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.7 *PsiTildeDifferenceRangeVerified* `0.052 144 913 394 385` (new) | every `[N, N + 1)` in range, at both ends and `ψ(N)` | max `√y|r − R/y| = 0.022661` (at `164 921.40`) `≤ 0.052` | sound | — |
| same, negative control | `c = 0.02`; `c = 0.05` | `0.022661 > 0.02` (fails); `≤ 0.05` (holds) | sound | — |
| same, wrong model (`r` alone) | `y = 302 831`; `y → 302 831⁻` | `√y|r| = 0.6911` / `0.7140` against `0.052`; `√y|r − R/y| = 0.0029` | Check mislabelled | R01 |
| same, from Vanlalngaia's printed form | `y = 141 978, 141 979, 144 913` | excess `+1.3·10^{−11}`, `−3.4·10^{−11}`; `1.364660·10^{−4} ≤ 1.365997·10^{−4}` | sound | — |
| `gap:psi-tilde-difference` contract | absorption point | `(1.884/0.003)² = 394 384` | sound | — |
| 1.10 ratio for `R₂*`, field (iv) | `X = 1.8·10^9`, `2.1·10^{10}` | `1.93 log X/√X = 9.6945·10^{−4}`, `3.1655·10^{−4}`, against `0.011` | sound | — |
| 1.10 ratio, Lemma 6.1 | `X = 2.1·10^{10}` | `2.732·10^{−4} + 4.42·10^{−6} + 1.542·10^{−4} + 1.30·10^{−5} + 0.010 = 0.010445 ≤ 0.011` | sound | — |
| 1.10, the weaker §4.2 input | `X = 2.1·10^{10}`; `394 385²` | `0.012798`; `0.011660`, both `> 0.011` | sound (the sharper input is needed) | — |
| 1.10 against 1.5 | `X = 10^7` | `2648.18` / `3523.39` | sound | — |
| 1.9 crossing with 1.4 | `L = 4589.2`; root | `5.133·10^{−8}` vs `1.212·10^{−8}`; `L = 5204.17` (both sides `9.022·10^{−9}`) | sound | — |
| 2.3 row `0.0144` from `96 955` | `N = 96 954`; `[96 955, 463 420]`; `x ≥ 463 421` | `0.0145113 > 0.0144`; max `0.0143930`; `0.0144 − 0.1/log x` | sound | — |
| 2.3 `1/65` crossing | `0.026 − 0.118/log D = 1/65` | `log D = 11.11594`, `D = 67 234.5` | sound | — |
| 1.4, 8.1, 9.4 quotations | `bordelles2015` 65–66; `ivic1977` 52; `nicolas2008` 23–26 | `0.10917`, `685` / `362.7`, `x > 1`; `(1 + log^{−2} x)`, `x > 1`; `2.50637`, `n ≥ 3` | sound | — |
| 0.2 coprime decomposition (carried) | `q = 2`, `x = 10` | `m₂(10) = 34/105 = 0.32381` both ways | sound | — |
| 0.2 semigroup (carried) | `S = {2, 3}`, `x = 6`; `S = ∅` | `1/3`; `m_∅ = 1` | sound | — |
| 0.5 squarefree remainder (carried) | `x = 176, 7, 8` | `R = −0.99517`; `1.74451 > 1.3229`; `1.13658 ≤ 1.4142` | sound | — |
| 0.5 `γ₁` (carried) | `N = 10`, `10^6` | `0.041228` vs `0.042313`; `−0.0728089`, `−0.0728158` | sound | — |
| 0.6 boundary (carried) | `h(p) = p^{s₀−1}/(log log p)²` | `H̄(s₀) < ∞`; the derivative series diverges | sound | — |
| 1.2 MacLeod (carried) | `[1, 1118]`; `[1119, 2.2·10^6]` | max `5.5125` at `199`; last `|M| > N/80` at `1118` | sound | — |
| 1.3 finite ranges (carried) | the two ranges | ratios `0.996743`, `0.999505` | sound | — |
| 1.4 Schoenfeld, route, thresholds (carried) | `[3, 2·10^7]`; `684/685`; `142 193/142 194` | min difference `0.822832`; `12 ≥ 11.4388`, `11 < 11.4530`; `123 > 122.5628` | sound | — |
| 1.5 threshold (headline, carried) | `1 078 852/1 078 853` | `350 > 349.9153`, `349`; `∫|M|/t = 301.9049` | sound | — |
| 1.7 corollary (carried) | `L = 10.07`; `L = 10` | `33.0622 ≥ 33`; `4 > 3.27` | sound | — |
| 2.1 Tao (headline, carried) | `S = ∅, {2}, {2, 3}` | `1`, `1/2`, `1/3` | sound | — |
| 2.2 Balazard (headline, carried) | `[1, 2·10^6]` | min slack `5.284·10^{−5}` at `1 911 028` | sound | — |
| 3.1 Ramaré (headline, carried) | `[1, 2·10^6]` | min slack `6.47·10^{−5}` | sound | — |
| 3.2, 3.3, 3.4 (carried) | `[1, 10^6]` | last violations `1, 6, 3161, 9548`; max `m̌ = 1.00302134`; `0.1653279` at `2.38986` | sound | — |
| 5.1 comparison (headline, carried) | `h = δ` | conclusion = hypothesis | sound | — |
| 5.2 constant term (headline, carried) | `t = 10^6`; `t = 0.01` | `0.478901` vs `0.478810`; `5.766 > 5.384`, `< 7.617` | sound | — |
| 5.5, 5.6, 6.5 (carried) | `g = δ`; `q = 2`, `X = 100`; `d = 6` | `B = 0`, `C = 1`; `3.13799` vs `3.14216 ± 1.0664`; factor `3` | sound | — |
| 6.3 Hall–Tenenbaum (headline, carried) | `f = 1` | `A + B + 1 = 4.3686` | sound | — |
| 6.4 (carried) | `f = μ²`, `τ` at `x = 2` | `2 > 1.5` (excluded); `3 ≤ 4` | sound | — |
| 7.1, 7.2 (carried) | `x = 351 115`; `X = 4/3` | `21.6756 > 21.591` (source issue); `1.0441` | sound | — |
| 8.1 Mertens product, Axler (headlines, carried) | `x = 24 284`; `392 686/392 687` | `1.01247·10^{−3} < 4.89185·10^{−3}`; margins `−5.85·10^{−12}`, `+4.70·10^{−13}` | sound | — |
| 8.2 (carried) | `ε = ±1` | `−0.31572 = B − γ`; `1.08276 = (6/π²)e^γ` | sound | — |
| 9.1 Robin, 9.2 Nicolas–Robin (headlines, carried) | `k = 8, 9`; `n = 6 983 776 800` | `9 ≤ 9.000567`; `1.537940 ≤ 1.538` | sound | — |
| 9.4 Rosser–Schoenfeld (headline, carried) | primorials to `3·10^6`; `n ≤ 10^6` | max `2.5063693` at `k = 9`; 0 violations | sound | — |

**Remarks on untouched text (no change asked).** None.

## Not verifiable

- These are settled as uncertified and cited by locator, so I did not request them:
  - `ramareZunigaAlterman2025`: the form of Lemma 6.1 and the fields of *RamareZunigaAltermanComputations* used in 1.10;
  - `leeLeong2022` and `johnstonLeongTudzi2024`: the two rows compared in 1.9;
  - `rosserSchoenfeld1962`: 8.1 and 9.4, now each beside a legible quotation.
- `vanlalngaia2017` is extracted in a font whose digits print as letters (`a … i` = `1 … 9`, `]` = `0`). My reading of Theorem 9 (lines 190–195) decodes it as in the previous review. Its consistency with `628² = 394 384` confirms the decoding.
- `nicolas2008` line 25 is OCR. The constant, the range and the attribution are legible; the inequality sign prints as `≤`.

## Source issues

- none
