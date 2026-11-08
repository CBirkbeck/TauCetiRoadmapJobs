# Review of ExplicitMultiplicativeFunctions (pull request #1946 at bca454b)

**Verdict:** needs changes

This is an incremental re-review of the 7 lines of `README.md` changed since `bb05bbe` (4 insertions, 3 deletions, all in the 0.7 Check at `y = 302 831`). `Suggested.lean` is unchanged. The repair is correct: every number in the new Check agrees with my own sieve. One P3 finding remains, carried from the previous two reviews: the pull-request description still does not name ExplicitCharacterSumsAndSieves as a supplier. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. Below, `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` and `TauCetiRoadmap/ExplicitMultiplicativeFunctions/Suggested.lean`.

## R01 (P3) — The description still does not name ExplicitCharacterSumsAndSieves as a supplier

- **Location.** The pull-request description.
  - Its "Depends on" block lists four roadmaps: AnalyticNumberTheoryPartI, ExplicitPrimeCounting, ExplicitZetaBounds and SieveMethodsAndPrimePatterns.
  - Its merge-order chain ends "… (ExplicitZetaBounds) → … (ExplicitPrimeCounting) → **this pull request**".
  - Its list "In open pull requests of ours: …" does not contain ExplicitCharacterSumsAndSieves either, and it says "everything else named in the README is a consumer, not a prerequisite".
- **Claim.** `README.md` consumes ExplicitCharacterSumsAndSieves §5.1, an open pull request that is not on main, as a supplier in three places: the contract heading at line 448 (`### From TauCetiRoadmap.ExplicitCharacterSumsAndSieves`); the *Needs:* line of 7.2 at line 2810 ("ExplicitCharacterSumsAndSieves §5.1 (the carrier `selbergDiagonal` of `G₁`)"); and Layer 7's *Dependencies* at line 3204. Line 3691 even says "ExplicitCharacterSumsAndSieves itself precedes this roadmap in the merge order". The description contradicts the README. This is the previous review's R02 (and the review before it's R05), unchanged; the repair commit touched only `README.md`.
- **Witness.** `ORDER.txt` lines 270–273: ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions. The content repository's main has no `TauCetiRoadmap/ExplicitCharacterSumsAndSieves` folder. At its open head `3fa29b0`, its `README.md` line 1343 is `### 5.1 explicit bounds for Selberg diagonal sums` and its `Suggested.lean` line 65 declares `selbergDiagonal`, so the citation itself is sound.
- **Repair.** Add ExplicitCharacterSumsAndSieves to the "Depends on" list. Add it to the merge-order chain between ExplicitPrimeCounting and this pull request. No README change and no reordering is needed.

## Previous findings

These are the findings of the review of `bb05bbe`.

- R01 — repaired: `README.md` lines 990–994 now read "at `y = 302 831` (on `[302 831, 302 832)`, `302 831` being prime) `|r(y)| = 0.0012558`, so `√y |r(y)| = 0.691` … `R(302 831) = −378.70` … (`√y (r(y) − R(y)/y) = −0.00290`). As `y → 302 831⁻` the same quantities tend to `0.0012975`, `0.714` and `R → −391.32`." Every value agrees with my recomputation below; the repair introduced no new problem.
- R02 — not repaired: the description's "Depends on" list and merge-order chain still omit ExplicitCharacterSumsAndSieves. It is raised again as R01.

## Verified sound

**Gate, build, dependency check, scope of the change.**

- I ran the gate on this head: every check is `0`, the result is `OK`, and the exit status is `0`.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` gives exactly 12 warnings, each `declaration uses 'sorry'`, at lines 169, 196, 201, 211, 226, 248, 273, 290, 313, 328, 340 and 351. Nothing else is printed.
- `git diff --stat bb05bbe..HEAD` touches only `README.md` (7 lines). The diff outside the folder against `origin/main` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The added lines contain no process words, pull-request numbers, LaTeX delimiters or `lemma`; they name no Lean counterpart.

**Signatures.** I elaborated the worker's `#check @…` file once more. All 25 declarations of `Suggested.lean` print their types; the tool's count of 27 includes a stray `of` and a stray backtick taken from the docstring, which fail as unknown identifiers and are not declarations. The file has no `variable` block, so no binder can drop. `Suggested.lean` is byte-for-byte the file the previous review read, so its type comparison with the README and its one-tactic padding probe (all 12 theorems resist) stand.

**The repaired Check, recomputed.** I sieved `Λ` to `302 832`, took `ψ(N) = Σ_{n ≤ N} Λ(n)` and `ψ̃(N) = Σ_{n ≤ N} Λ(n)/n` with compensated sums, and evaluated `r(y) = ψ̃(y) − log y + γ`, `R(y) = ψ(y) − y` at `y = 302 831`.

- `302 831` is prime (the sieve marks it so), so `ψ` and `ψ̃` jump there and the interval `[302 831, 302 832)` differs from the one to its left.
- On `[302 831, 302 832)`: `ψ = 302 452.2974`, `ψ̃ = 12.042458701`, `r = −0.0012558`, `√y |r| = 0.6911`, `R = −378.703`, `√y (r − R/y) = −0.00290`. The README's `0.0012558`, `0.691`, `−378.70`, `−0.00290` are these values.
- As `y → 302 831⁻` (on `[302 830, 302 831)`): `ψ = 302 439.6765`, `ψ̃ = 12.042417024`, `r = −0.0012975`, `√y |r| = 0.7140`, `R = −391.324`. The README's `0.0012975`, `0.714`, `−391.32` are these limits.
- The Check's point stands on both intervals: `r` alone exceeds `0.052/√y` by a factor above `13`, while `|r − R/y| √y = 0.0029` sits far inside `0.052`.

**What depends on the changed passage.** The Check illustrates *PsiTildeDifferenceRangeVerified* `0.052 144 913 394 385` (0.7, lines 809–820), consumed by 1.10 (lines 1655–1665) and the `gap:psi-tilde-difference` contract (lines 433–438). Neither statement changed, and the Check's values at `y = 302 831` are an instance of the proposition on its range (`144 913 ≤ 302 831 ≤ 394 385`, `0.0029 ≤ 0.052`), consistent with the previous review's maximum `0.022661` over the whole range.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitCharacterSumsAndSieves at `3fa29b0`: §5.1 at `README.md` line 1343; `selbergDiagonal` at `Suggested.lean` line 65. Its README does not cite this roadmap, so there is no cycle.
- `ORDER.txt` lines 270–273 place ExplicitZetaBounds, ExplicitPrimeCounting and ExplicitCharacterSumsAndSieves directly before this roadmap.
- `overlaps.md` lists no pull request that changes this roadmap, no dropped id and no id only an open revision defines; `citations.md` lists nothing found nowhere. The change adds no citation and no gap slug.

**Seeded sample.** 1.10 is the one sampled target the change touches (through the 0.7 proposition it consumes); its use of the instance is recomputed above and in the previous review. The other sampled targets (0.2, 1.1, 1.7, 2.1, 2.5, 2.6, 3.1, 3.3, 6.2, 6.3, 7.1, 7.8, 9.2, 9.4) are untouched by the diff and were passed by the reviews of `6490eee` and `bb05bbe`.

**Adversarial table.** The row for the changed statement was computed in this review. The other rows are carried from the review of `bb05bbe` (which itself carried the rows of the review of `6490eee`), with the values computed there.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.7 Check at `y = 302 831`, wrong model (`r` alone) — changed | `y = 302 831` on `[302 831, 302 832)`; `y → 302 831⁻` | `√y|r| = 0.6911` / `0.7140` against `0.052`; `R = −378.703` / `−391.324`; `√y|r − R/y| = 0.00290` | sound (values now on the named interval) | — |
| 0.7 *PsiTildeDifferenceRangeVerified* `0.052 144 913 394 385` (carried) | every `[N, N + 1)` in range, at both ends and `ψ(N)` | max `√y|r − R/y| = 0.022661` (at `164 921.40`) `≤ 0.052` | sound | — |
| same, negative control (carried) | `c = 0.02`; `c = 0.05` | `0.022661 > 0.02` (fails); `≤ 0.05` (holds) | sound | — |
| same, from Vanlalngaia's printed form (carried) | `y = 141 978, 141 979, 144 913` | excess `+1.3·10^{−11}`, `−3.4·10^{−11}`; `1.364660·10^{−4} ≤ 1.365997·10^{−4}` | sound | — |
| `gap:psi-tilde-difference` contract (carried) | absorption point | `(1.884/0.003)² = 394 384` | sound | — |
| 1.10 ratio for `R₂*`, field (iv) (carried) | `X = 1.8·10^9`, `2.1·10^{10}` | `1.93 log X/√X = 9.6945·10^{−4}`, `3.1655·10^{−4}`, against `0.011` | sound | — |
| 1.10 ratio, Lemma 6.1 (carried) | `X = 2.1·10^{10}` | `2.732·10^{−4} + 4.42·10^{−6} + 1.542·10^{−4} + 1.30·10^{−5} + 0.010 = 0.010445 ≤ 0.011` | sound | — |
| 1.10, the weaker §4.2 input (carried) | `X = 2.1·10^{10}`; `394 385²` | `0.012798`; `0.011660`, both `> 0.011` | sound (the sharper input is needed) | — |
| 1.10 against 1.5 (carried) | `X = 10^7` | `2648.18` / `3523.39` | sound | — |
| 1.9 crossing with 1.4 (carried) | `L = 4589.2`; root | `5.133·10^{−8}` vs `1.212·10^{−8}`; `L = 5204.17` (both sides `9.022·10^{−9}`) | sound | — |
| 2.3 row `0.0144` from `96 955` (carried) | `N = 96 954`; `[96 955, 463 420]`; `x ≥ 463 421` | `0.0145113 > 0.0144`; max `0.0143930`; `0.0144 − 0.1/log x` | sound | — |
| 2.3 `1/65` crossing (carried) | `0.026 − 0.118/log D = 1/65` | `log D = 11.11594`, `D = 67 234.5` | sound | — |
| 1.4, 8.1, 9.4 quotations (carried) | `bordelles2015` 65–66; `ivic1977` 52; `nicolas2008` 23–26 | `0.10917`, `685` / `362.7`, `x > 1`; `(1 + log^{−2} x)`, `x > 1`; `2.50637`, `n ≥ 3` | sound | — |
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

- The changed lines cite no source: they are a finite computation, which I repeated.
- As in the previous review, these settled uncertified texts are cited by locator and were not requested: `ramareZunigaAlterman2025` (the form of Lemma 6.1 and the fields used in 1.10), `leeLeong2022` and `johnstonLeongTudzi2024` (1.9), `rosserSchoenfeld1962` (8.1, 9.4).
- `vanlalngaia2017` lines 190–195 (Theorem 9) are extracted in a font whose digits print as letters; the previous reviews' decoding is confirmed by `628² = 394 384` and is unchanged by this diff.

## Source issues

- none
