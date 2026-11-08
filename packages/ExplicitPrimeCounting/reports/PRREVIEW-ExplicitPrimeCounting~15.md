# Review of ExplicitPrimeCounting (pull request #1945 at 08b5094)

**Verdict:** needs changes

Three findings, all P3; none is blocking. The gate passes, `Suggested.lean` elaborates with exactly 16 `sorry` warnings, the dependency check reports 0 problems, and every locator of the 15 sampled sections matches its source.

## Previous findings

Review 14 (at `c4b8ff9`) raised no finding, so nothing was due for repair. This head also repairs a latent defect that reviews 13–14 missed:

- `ButheVerified` (README line 1394, `Suggested.lean` line 176) now starts its second clause at `1427`. It used to start at the printed `1423`.
- The printed clause is false. `θ` is constant on `[1423, 1427)`, and `x − θ(x) > 1.95 √x` on `(1426.4716, 1427)`: at `x = 1426.9`, `74.077 > 73.660`.
- So the old proposition was false, and every headline that assumes it was vacuous.

## R01 (P3) — Three new citation keys are not in the manifest; `pnt-plus` and `ieantn` have no locators

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- References, lines 5013–5018: "`pnt-plus` PrimeNumberTheoremAnd, <https://github.com/…>; cited for §§0.1, 0.3, …".
- Line 1399: "IEANTN (`ieantn`) states the second clause from `1423` as well, which fails on `(1426.47…, 1427)`". The same kind of remark is at lines 1086 and 1964–1966.
- Lines 1524 and 2697: "`mossinghoff-trudgian-2015` §7, Corollary 1".
- Lines 3157–3158: "(its (8)–(9) at the parameter `a = 3130` of its footnote 1)".

**Claim.**

- This head adds 171 citations under three keys that the roadmap's `sources.toml` does not record: `pnt-plus` (113), `ieantn` (55) and `mossinghoff-trudgian-2015` (3).
- `pnt-plus` and `ieantn` are GitHub repositories cited with no commit, file or declaration. No use of them can be checked.
- Three passages assert what IEANTN states. No reader can check those assertions, and they go out of date when that project changes.
- The Dudek–Platt pair at `e^{9400}` cites a footnote that the text recorded for `dudek-platt-2015` does not contain.

**Witness.**

- The `id =` lines of `packages/ExplicitPrimeCounting/sources.toml` include none of the three keys.
- `dudek-platt-2015` (arXiv 1407.1901v1) has only `a = 3223`, `x_a = exp(9656.8)` (lines 268–271). It has no footnote 1, no `a = 3130` and no `9400`.

**Repair.**

1. Record `mossinghoff-trudgian-2015` in `sources.toml`: arXiv 1410.3926, J. Number Theory 157 (2015), locator §7, Corollary 1.
2. For `pnt-plus` and `ieantn`, do one of the following:
   - record each with a pinned commit and cite the file and declaration at each use; or
   - drop the citations. Every statement already carries its primary locator.
3. Rewrite lines 1086, 1399–1401 and 1964–1966 to keep only the mathematics. Keep the corrected thresholds `1427` and `97` and the principal-value reading of `li`. Drop the sentences about what IEANTN states.
4. For the Dudek–Platt pair at `e^{9400}`, do one of the following:
   - cite the version and page that has footnote 1; or
   - drop that pair. The `a = 3223` pair and the five-term bound already imply it.
5. While editing, replace the time-bound "the latest arXiv text (v3)" (lines 2761, 2764) with "the arXiv text v3". Replace "the current version" (line 2804) with "arXiv 2111.10001v5".

**Tested.**

- Every passage that cites `pnt-plus` or `ieantn` also cites a primary source with a locator, so dropping the two keys loses no locator.
- The `a = 3223` pair `(−3103.33, 3343.48)` from `e^{9656.8}` is implied by the five-term bound, since `−3103.33 < −1194` and `3343.48 > 1426`.

## R02 (P3) — The new headline `ramanujan_largest_counterexample` is missing from the README's end theorems

**Location.**

- `TauCetiRoadmap/ExplicitPrimeCounting/README.md`, lines 32–60, "The end theorems are:". No bullet mentions Ramanujan's inequality.
- `Suggested.lean`, lines 42–43: "Dudek–Platt's largest counterexample to Ramanujan's inequality under the Riemann hypothesis … (`ramanujan_largest_counterexample`, `DudekPlattRange`)". The theorem is at line 472.

**Claim.** The Lean file declares this theorem as a headline, and README §3.5 (line 3160) states it as a target. The summary's list of end theorems omits it. So the README and the acceptance test disagree about the headline set.

**Witness.** `grep -n 'Ramanujan\|38 358 837 682'` finds no hit in README lines 1–67, while `Suggested.lean` line 42 lists the theorem.

**Repair.** Add to the "under the Riemann hypothesis" bullet of the summary: "Dudek–Platt's `π(n)² < (e n/log n) π(n/e)` for every integer `n > 38 358 837 682`, the largest integer at which it fails".

**Tested.** The §3.5 route supports exactly this statement:

- `g(10¹⁶) = 2.80·10²¹`, `g(1.15·10¹⁶) = −3.2110·10¹⁹` and `g(10¹⁹) = −1.82·10²⁸`.
- `g` is decreasing on 301 log-spaced points of `[10¹⁶, 10¹⁹]`.

## R03 (P3) — A false value in a §0.4 Check, two rounding slips in §3.4, and an unrecorded correction of a source

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- (a) Line 1072: "on which `(t − θ(t))/√t = 1.5244…`, so `c = 0` and any `C ≥ 1.5245` are admissible".
- (b) Line 2670: "`|t| > 17 e^{2/6.455} = 23.18`".
- (c) Line 2708: "`exp(6.315 log 17/(6.315 − 5.573412)) = 3.006·10¹⁰`".
- (d) Lines 1444–1446: "`|θ(x) − x| ≤ (1 − (log 2)/3) x` for every real `2 ≤ x ≤ 599` (`platt-trudgian-2021-error` (18), its first range".

**Claim.**

- (a) The range `[10⁷, 10⁷ + 1]` has no prime; the next prime is `10 000 019`. On it the ratio rises from `1.52443` to `4821.68/√(10⁷ + 1) = 1.52475`, so `C = 1.5245` is not admissible.
- (b) `17 e^{0.309837} = 23.1740`, which rounds to `23.17`. The "exactly for" claim is therefore false on `(23.174, 23.18]`.
- (c) `exp(24.12623) = 3.0054·10¹⁰`, not `3.006·10¹⁰`.
- (d) The README's value is the correct one, but (18) prints `(2 − log 2)/2` (`platt-trudgian-2021-error` lines 488–489). `(x − θ(x))/x` exceeds that value on all of `(2, 3)`. The provenance does not record the printed value, although the Conventions (lines 262–264) require this for a printed threshold that fails.

**Witness.** `θ(10⁷) = 9 995 179.318`, so `10⁷ + 1 − θ = 4821.68`. At `x = 2.5`, `(2.5 − log 2)/2.5 = 0.7227 > 0.6534 = (2 − log 2)/2`.

**Repair.**

- (a) Write "any `C ≥ 1.5248`".
- (b) Write `23.17`.
- (c) Write `3.005·10¹⁰`.
- (d) After "its first range", add "which prints `(2 − log 2)/2`, exceeded by `(x − θ(x))/x` on `(2, 3)`".

**Tested.**

- With `C = 2`, which is admissible, the negative control of line 1076 still holds: `1.3189 + 0.1626 · 2 = 1.6441 < 1.7299`.
- Both corrected crossings stay below `30 610 046 000`: `3.0014·10¹⁰` and `3.0054·10¹⁰`.

## Verified sound

### Gate, build, dependency check, signatures, probe

- **Gate.** The worker's gate (`gate.md`) and my rerun at `08b5094` both report every check `0` and "OK", exit 0. The diff outside the folder is empty.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` gives 16 "declaration uses `sorry`" warnings, one per theorem, and nothing else.
  - The file has `import Mathlib` plus three `TauCeti.*` modules.
  - It has no `set_option`, `lemma`, `variable`, `include` or `#eval`.
- **Dependency check.** `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Merge-order positions:

  | Roadmap | Position |
  |---|---|
  | LFunctions | 27 |
  | ZerosOfLFunctions | 48 |
  | AnalyticNumberTheoryPartI | 49 |
  | SieveMethodsAndPrimePatterns | 55 |
  | ExplicitZetaBounds | 265 |
  | EffectiveClassNumbers | 266 |
  | ExplicitPrimeCounting | 267 |
  | ExplicitCharacterSumsAndSieves | 268 |
  | ExplicitMultiplicativeFunctions | 269 |
  | ExplicitNumberFields | 270 |

  EffectiveClassNumbers consumes §0.3b and is handled by its own `moved:` line, as review 11 recorded.
- **Signatures.**
  - I built a scratch copy with `#check @name` for all 43 declarations (27 definitions, 16 theorems). It elaborates with 0 errors. The worker's `signatures.md` reports a parse error, which comes from a stray docstring token in its own check file.
  - With no `variable` block, no binder can be lost.
  - I compared the two new declarations with §§1.3 and 3.5. `DudekPlattRange` covers the failure at `38 358 837 682` and the integers in `(38 358 837 682, 1.15·10¹⁶]`. `ramanujan_largest_counterexample` assumes `RiemannHypothesis`, `ButheVerified`, `Schoenfeld1976Range` and `DudekPlattRange`. Both agree with the README word for word.
- **One-tactic probe.** On a scratch copy I ran `first | (rfl; done) | (simp; done) | (norm_num; done) | (positivity; done) | (infer_instance; done) | (intros; linarith) | (intros; exact le_rfl) | (simp_all; done) | (intros; nlinarith)` on all 16 theorems. All 16 fail.
  - For `ramanujan_largest_counterexample`, `simp` hits the recursion limit.
  - That theorem's conclusion for `n > 1.15·10¹⁶` is in no hypothesis, so it is not padding.
- **Headlines.** Every end theorem of README lines 32–60 is one of the following:
  - stated: 16 theorems; or
  - named in the docstring, lines 56–90, with what it lacks: the table propositions of §§3.1, 6.x, 7.3 and 7.5.

  The one mismatch is R02.

### The seeded sample against the sources

Every locator below was read in the cached text.

- **§0.7.** The row `(1, 0.000213, 10¹⁰)` is at `ramare-rumely-1996` line 67. The closed form for `C(q, a)` is at `ramare-2002` lines 74–86.
- **§0.8.** `chebyshev-1852` §IV gives `A = 0.92129202` (line 291). §V gives `ψ(x) > Ax − (5/2) log x − 1` and `ψ(x) < (6/5)Ax + (5/(4 log 6)) log² x + (5/2) log x + 1` (lines 312, 341, 355–356). `rosser-schoenfeld-1962` lines 341–342 give the maximum of `ψ(x)/x` at `113`.
- **§1.1.** All of the following match:
  - `van-de-lune-te-riele-winter-1986` lines 13–14;
  - `platt-2017` lines 485–486 (Theorem 5.1, `3.0610046·10¹⁰`);
  - `platt-trudgian-2021-rh` lines 48–49;
  - `rosser-schoenfeld-1975` lines 50–55 (`A = 1 894 438.51224`, `N(A) = 3 502 500`) and 683–687 (`D = 158.84998`, 57 zeros, `S < 0.8113925`);
  - `dusart-1999-mc` lines 64–69;
  - `kadiri-lumley-2014` lines 582–586;
  - `cully-hugill-lee-2022` lines 600–602;
  - `dusart-2016` line 460 (`0.00167`).
- **§1.4.**
  - `carneiro-milinovich-soundararajan-2019` lines 269–273 give (1.15) for `11 ≤ p_n ≤ 4·10¹⁸`.
  - `oliveira-e-silva-herzog-pardi-2014` Table 8 (lines 1795–1821) starts at `(2, 1)` and ends at `(1 425 172 824 437 699 411, 1476)`, with `(4 652 353, 154)`.
  - Table 9 (lines 1842–1885) gives records of `P(g)`, the last being `(1306, 3 278 018 069 102 480 227)` and `1346 > 4·10¹⁸`. So the README's "every smaller `g′` has `P₁(g′) < Q`" is the source's "record-breaking".
  - `axler-2016` lines 354–364 check the gaps from `58 889` and treat `[58 837, 58 889)` directly.
- **§1.5.**
  - `ramare-rumely-1996` lines 77–92: `2.072 √x`, `1.745 √x`, and `1.000` for `k = 5` and `k ≥ 7`, `√2` for `k = 1`.
  - `ramare-2002` lines 161–169: Théorème 2 with `v♯(q) ≤ 1`.
  - Lines 1229–1232: `y = 261`.
  - Lines 152–159: Rumely's list, largest `486`.
- **§2.3.**
  - `buthe-2016` lines 688–705, Theorem 2: criterion `4.92`, thresholds `59`, `599`, `59` (π*) and `2657`.
  - Lines 567–577: Theorem 1 with `(e^{αε} − 1)` in `E₁`.
  - Table 1 (lines 587–601, 12 rows) and Table 2 (lines 636–651, 13 rows): every `(b, T, δ₀)` of the README matches.
- **§3.2.** All of the following match:
  - `rosser-schoenfeld-1962` line 328 (`1.01624`), lines 252–255 with 306–308 (ranges `563`, `1`, `41`);
  - `schoenfeld-1976` lines 729–733 (Theorem 6*), 767–772 (Theorem 7*, all five clauses), 1229–1233 (the six pairs of Corollary 2*), 201–206 (Theorem 11, `17` and `101`) and 1288–1294 (`1.000081` announced without proof).
- **§3.3.**
  - `dusart-1998-thesis` lines 845–852 (Théorème 1.3 and the rows of Table 1.1), 869–874 (`η₂, η₃, η₄`, and `0.2` from `3 594 641`) and 921–926.
  - `dusart-1999-mc` lines 102–108.
  - `dusart-2016` lines 74–90. Line 79 prints `8R`, while lines 471 and 531 use `8/R`.
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 950–975 (Corollary 11.2) and 186–191; `deleglise-nicolas-2019-landau` lines 387–389.
- **§3.4.** All of the following match:
  - `faber-kadiri-2015` line 43;
  - `faber-kadiri-2018-corrigendum` lines 85–98, including the row `(20, 0.89, 4, 1.363·10⁻⁵, 1132491, 5.3688·10⁻⁴)` and `s₀ = 11.637732`;
  - `trudgian-2016` lines 47–73 and 132–140;
  - `platt-trudgian-2021-error` lines 58–92 (Theorem 1, Corollaries 1–2, Table 1, (5)) and 129–141;
  - `johnston-yang-2023` lines 57–113 (Theorem 1.1, Corollaries 1.2–1.3, Theorem 1.4, Table 1), 163–260 (Lemmas 2.4–2.9) and 643–729;
  - `fiori-kadiri-swidinsky-2023` lines 151–176 (Remark 2, Theorem 3), 700–733 (Corollaries 21–22) and 751–752 (Corollary 26).
- **§3.4a.**
  - `fiori-kadiri-swidinsky-2023` lines 29–30 and 149 (normalisation), 298–329 (Lemma 10; its third case is reversed against its proof), 433–462 (Corollary 14: `121.0961`, `ν ≤ 6.3376·10⁻⁷`, `2.6271`; Remark 15) and 563–582 (Proposition 17).
  - Table 4 (lines 1103–1317) has 208 rows, including `(44, 1.7893e-8)`, `(100, 2.0339e-12)`, `(2000, 1.5701e-12)` and `(10⁷, 1.0364e-1153)`.
  - Table 5 has 21 rows. Tables 6–7 (lines 1347–1384) match row for row.
  - `broadbent-kadiri-lumley-ng-wilk-2021` line 559 (Lemma 6) prints `log(4(c₂+k)²/c₃²)`, as the README says.
- **§3.6.** `johnston-yang-2023` lines 77–84 and 643–729 give `σ = 0.9999932`, `exp(2.8·10¹⁰)`, `[59, e⁵⁹)` from Lemma 2.2 and Table 8, and `A₂ ≤ 0.028`.
- **§3.7.** `broadbent-kadiri-lumley-ng-wilk-2021`:
  - Corollary 2.1 (lines 156–159);
  - Corollary 5.1 and (2.12) (lines 489–503);
  - the `a₂` table (lines 509–512);
  - Lemma 9 (lines 685–700);
  - Corollary 11.1 (lines 927–940);
  - Table 8 (lines 1378–1442), with `ε(19 log 10)` read off the row `b = 40` as at line 506;
  - Table 14 (lines 1669–1672: rows `40`, `19 log 10`, `50`);
  - Table 15 (lines 1721, 1727, 1732: `57.184`, `0.024334`, `9.3023·10⁻⁵`).
- **§4.6.**
  - `deleglise-nicolas-2019-landau` lines 613–705 (Proposition 2.5, both lower forms, and `r₀(1), r₀(0.5), r₀(0.15)`), 706–720 ((2.19)–(2.24)) and 763–767 ((2.25)–(2.28)).
  - `axler-2019` lines 46–53.
- **§5.1.** `dusart-1999-mc` lines 116–126.
- **§6.3.** `bennett-martin-obryant-rechnitzer-2018`:
  - lines 109–113 (`Li = ∫₂ˣ`);
  - lines 169–195 (Theorems 1.1–1.3, `c₀`, `x₀`);
  - lines 377–379 (Proposition 1.11);
  - lines 1163–1169 (Hypothesis Z);
  - lines 2784–2803 (Proposition 4.34, `R = 5.6`, `H₂`);
  - lines 3825–3834 and 3992–4010;
  - line 5158 (reference [17], Kadiri, Mathematika 64).
- **Also checked outside the sample.** These are the source corrections this head records:
  - `buthe-2018` lines 73–85 (Theorem 2, `1423`) and 753–860 (Lemmas 2–3 with `+A log x/√x`; `Θ(16/α²)` at line 832 against the remainder `32/α³` of lines 820–828; `> 0.1` at line 856);
  - `dudek-platt-2015` lines 95–114 (Lemma 2.1, `ε_M` as stated) and 276–296 (Lemma 3.2, `g(1.15·10¹⁶) ≈ −3.211·10¹⁹`).

### Adversarial table

Values are in double precision, `li` comes from its series in 60-digit decimals, and `θ`, `ψ` come from a sieve to `10⁷ + 100`. Step functions were tested at both one-sided limits.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| §0.4 Büthe's transfer, corrected sign | `a = x = 10⁷` | `(li − π) log x/√x = 1.72994` (`li − π = 339.405`); `(x − θ)/√x − A log x/√x = 1.52443 + 0.20551` with `A(10⁷) = −40.320` | equality, as stated | none |
| §0.4 Check on `C` | `[10⁷, 10⁷ + 1]` (no prime) | ratio `1.52443 → 1.52475` | `1.5245` not admissible | R03(a) |
| §0.4 factor `1 + κ/log x` | `J(12,10⁷)/G₈`, `J(12,10¹⁵)/G₅`, `J(1500,10⁸)/G₅` | `0.97179`, `0.99830`, `1.03749` | `κ = 8` from `10⁷`, `κ = 5` from `10¹⁵`; printed `5` from `10⁷` fails | none |
| §0.4 positivity transfer | `li 2, 3, 5, 7` vs `π`; `A(10)` | `1.04516 > 1`, `2.16359 > 2`, `3.63459 > 3`, `4.75705 > 4`; `A(10) = 6.02073 − 6.16560 = −0.14487` | holds; source's `> 0.1` false | none |
| §0.4 Check with offset `Li` | `x = 10` | `4 − 5.12044 + 2.02073 = 0.90029 > 0.1` | holds | none |
| §0.3 `f(2ⁿ)` | `n = 8, 9, 10`; route sum | `3.16698 < 3.21081 > 3.18883`; `∑_{k=4}^{9} = 2.22160 > 2.12` | `9` sharp | none |
| §0.7 Check | RR row `k = 1` | `0.000213 ∫_{10¹⁰}^∞ dt/t = ∞` | as stated | none |
| §0.8 range and step | `(0, 30]`; `x = 11 723` | `ψ(19)/19 = 1.01397 ≤ 1.015`; `41.85 ≤ 43.38`; `1 − log 900 = −5.80 ≤ −5` | holds | none |
| §1.1 `YangRecord` edge | `t = 0` | `0.73018 ≤ 0.618 · 1.99815 · 0.59333 = 0.73268`; with `0.61`: `0.72319` | tight, as stated | none |
| §1.3 `ButheVerified` clause 2 | `[1423, 1427)` | at `1426.9`, `74.077 > 73.660`; crossing `1426.4716` | `1427` right | none |
| §1.3 *ButheLemma3Constant* | `a = 1500` | `π(1500) = 239`, `A(1500) = −3.63561` | holds | none |
| §1.3 *MossinghoffTrudgianRange* | `θ` on `[149, 1427]` | least margin `3.074` at `163⁻`; at `149⁻`: `22.3564 > 22.3395` | holds, `149` sharp | none |
| §1.3 *TrudgianRange* | `θ` on `[149, 1427]`; `ψ` on `[23, 36]` | margins `3.179`, `0.742` | holds | none |
| §1.3 *ChirreHelfgottRange* | `[69 997, 10⁶]` | least margin `6.88`; at `69 997⁻`: `155.771 > 155.484` | `69 997` right | none |
| §1.3 *JohnstonYangRange* | `ψ` on `[23, 59)`; `θ` on `[59, 599]`; `θ` at `29⁻` | `0.750`; `2.037`; `−4.957` | `59` right | none |
| §1.4 `TrudgianGapBound` | `4 652 353`; `2 010 733` | `154 ≤ 177.82`; `148 > 86.0` | threshold right | none |
| §1.4 `AxlerGapBound` | `(20 831 323, 210)` | `210 ≤ 211.8` | holds | none |
| §1.6 `E₁`, `B` | crude bounds | `0.3466 + 1.0627 ≤ 1.6164`; `B ∈ (−3.851, 9.137)` | holds | none |
| §2.1 reciprocal sum | `T = 32.94`; `4πe` | `0.22153 > 0.21843`; `0.22812 ≥ 0.22153` | as stated | none |
| §2.2 Lee–Nosal switches | — | `0.9400` at `337.09`; `1.9500` at `3381.6`; `log x = 30 369.58`; `L = 20.455`; `15.5288` at `L = 55.46` | holds | none |
| §2.3 ranges | `T = 3 000 175 332 800` | Büthe `2.1693·10²⁵`; Johnston `1.10198·10²⁶`; switch `547.72` | as stated | none |
| §2.3 *JohnstonTable* | 8 rows | `2.1663·10³⁰ … 7.3761·10⁴⁴`, each ≥ the README's value | conservative | none |
| §2.3 `π*` from `97` | `96.9`; `97` | `1.918 > 1.791`; `0.940 ≤ 1.793` | `97` right | none |
| §2.6 instance | `T = 3·10¹² + 1 + π/3` | `C_T = 113.6689 ≤ 113.67`; `π/(T−1) + π²/(3T²) − π/(3·10¹²) = −2.0·10⁻²⁸` | holds | none |
| §3.2 route for (5.3*) | `x ≥ 10⁸` | maximum ratio `1.53390` at `10⁸` (grid and every jump to `10⁶⁰`); `1.534 · 1.001093 = 1.53568` | holds | none |
| §3.2 route for (5.4*) | `x = 1 155 901²` | `≥ 1.00885 · 0.998697 √x` | holds | none |
| §3.3 `ψ − θ` routes | `10²⁴`; `10¹⁶` | `76·10⁶ = 0.76·10⁸`; `225 443 > 20 405` | holds | none |
| §3.4 regions | Trudgian; Mossinghoff–Trudgian | `23.174`, `3.0014·10¹⁰`; `23.334`, `3.0054·10¹⁰` | holds | R03(b), (c) |
| §3.4 Johnston–Yang via FKS | ratio at `x = 2`; `π` clause | `1.03008`; crossing `4.421` | holds | none |
| §3.1 FKS `ψ`, two forms | `R = 5.5666305` | `121.096/R^{3/2} = 9.2202183`; `2/√R = 0.84768363` | the `121.096` form is the stronger | none |
| §3.1 FKS Lemma 5.2 | `x = 2` | `1.3069 > 1.1397`; crossing `2.2905` | `2.3` right | none |
| §3.4a Corollary 14 below `e³⁰` | `x = 2`; `log x = 30` | `2.6271 ≥ 1 ≥ E_θ`; `14.59` | holds | none |
| §3.4a `0.4298` | shape maximum; `[2, e)` | `0.35426`; `1/e = 0.3679` | holds | none |
| §3.4a monotonicity | `ε_{121.107}` | `2.627` at `2`; maximum `20.35` at `log x = 12.52` | as stated | none |
| §3.5 five-term bound | `a(e³⁹¹⁴)`, `a(e³⁹¹⁵)`, FKS | `1310.35`, `1304.16`, `≤ 19.27`; `120 + 1304.16 + 1 < 1426` | holds | none |
| §3.5 criterion | `ε_{1426} − ε′_{−1194}` at `e³⁹¹⁵` | `2924.76 + 989.74 = 3914.5 < 3915` | holds | none |
| `ramanujan_largest_counterexample` | `g` on `[10¹⁶, 10¹⁹]` | `2.80·10²¹`, `−3.2110·10¹⁹`, `−1.82·10²⁸`; decreasing | holds | R02 |
| §3.6 Theorem 1.4 at `23` | `θ`, `π`, `ψ` | `3.777 > 3.399`; `1.884 > 1.124`; `0.599 ≤ 3.273` | `59`, `71` right | none |
| §3.7 `a₂(b)` | 12 points | `1.42630`, `1.21959`, `1.12106`, `1.0708607`, `1.04320`, `1.03252`, `1.01718`; `b = 200`: `7.7118·10⁻⁸`; `b = 300`: `1.93517·10⁻⁸` | printed `1.07086` too low; others hold | none |
| §3.7 `𝒞_{b,k}` | `b = 20`, block 1; `b = 25`, block 2 | `1.68427·10⁻³ ≤ 1.68440·10⁻³`; `1.75003·10⁻⁴` (block 1: `1.70331·10⁻⁴`) | as stated | none |
| §3.7 `B_k(20, 21)` | `k = 1, 5`; closed form | `1.8076·10⁻³`; `291.6`; `326.9` | as stated | none |
| §3.8 switch | `L = 2394.19` | `9.22022 L^{5.5} e^{−0.8476836√L} = 34.4067 ≤ 34.409` (`34.448` at `2394.0`) | holds | none |
| §4.2 routes | — | `1.663·10⁸`; tail `1.18·10⁻³⁴`; `0.006409 · 286 = 1.83297 ≤ 1.833` | holds | none |
| `vanlalngaia_sum_inv_prime` | `x = 89 967 803` | `1/3 + 5/(4 log x) = 0.40158 ≤ 0.41` | holds | none |
| §4.3 Corollary 2 | `R = 5.5666305` | `814R = 4531.24`; `1.6 R^{−1/4} = 1.04166`; `1/R = 0.17964` | holds | none |
| §4.6 `r₀` and Checks | quartic at `1.1445`, `1.4377`, `2.1086` | `25.000`, `48.99`, `160.98`; `760/384 = 1.979`; `−18/16`; `π₅(3) = 275` (equality) | as stated | none |
| §5.1 Check | `n = 61`, `p₆₁ = 283` | `277.27 < 283 < 283.37`; `277.49`; `285.70` | as stated | none |
| `dusart_nth_prime_lower` | `p_k = e⁵⁰⁰`; `log k = 1792.5` | `0.008216 ≥ 0.007766`; `1.71769·10⁷ > 1.6571·10⁷` | holds | none |
| §6.3 | `q = 10⁵ + 1`; the two regions; `ζ`; meet point | `exp(14 477)`; `0.0096941` vs `0.0084355`; `0.0073959` vs `0.0074312` / `0.0072701`; `2.1813·10⁻⁴` at `939 839` | holds | none |
| `lamzouri_li_soundararajan`, Bach–Sorenson | `q = 2, 3` | `3 < 3.844`; `7 < 21.725` | holds | none |
| `schoenfeld_of_riemannHypothesis` | `ButheVerified` switches | `129.093`; `3833.04` | match `129.1`, `3834` | none |
| `carneiro_milinovich_soundararajan` | Rosser vs Lemma 9 | `max(0.443 log L − 0.013 L) = 1.12018 < 1.412`; `2/e = 0.7358 < 0.88` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693` | `X ≥ 8.36 ⇔ log x ≥ 398.16`; printed `8R`: `11 833.2` | `8/R` right | none |
| `trudgian_interval` | `p = 4 652 353` | `154 ≤ 177.82` | holds | none |
| `axler_interval` | switches | `log x ≤ 104.24`, `277.8`; spare `6.4·10⁻¹²`; `243.31` | holds | none |
| `schoenfeld_interval` | `x = e³⁰` | `4.348·10⁸ > 1.961·10⁸` | holds | none |
| `axler_primeCounting_upper` | coefficients | `3 + η = 3.024334`, `13 − η = 12.975666`, `71 + 2η = 71.048668` | as stated | none |
| `brun_titchmarsh` | carried from review 13 (statement unchanged) | least margin `2.213` (`k ≤ 40`, primes `< 6000`); at `y = k` the junk value is `0` | holds | none |
| §7.5 | cubes; `155`-th powers | `exp(33.990 − 1.0986) = exp(32.8914)`; `3491.4`, `4850.9` | match | none |
| §2.4 | `ψ ≤ 1.03883 x` | from `x = 586.0` | `587` holds | none |

### Library declarations opened at the pins

The pins are Mathlib and Tau Ceti as in `lake-manifest.json`. Every name was grepped as a declaration:

- **Abel summation:** `_root_.sum_mul_eq_sub_sub_integral_mul` (`Mathlib/NumberTheory/AbelSummation.lean:128`).
- **Fourier transform:** `Real.fourier_real_eq` (`Mathlib/Analysis/Fourier/FourierTransform.lean:483`, namespace `Real` from line 368).
- **Height-one primes:** `Rat.HeightOneSpectrum.primesEquiv` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:109`).
- **Factorial bounds:** `Real.sum_log_le` and `Real.le_sum_log` (`Mathlib/Analysis/SpecialFunctions/Log/Sum.lean:49`, `:67`, with exactly the bounds §0.8 consumes).
- **Chebyshev functions** (`Mathlib/NumberTheory/Chebyshev.lean`):
  - `Chebyshev.psi_sub_theta_le_psi_add_psi_add_psi` and `…_ge_…`;
  - `Chebyshev.pi_le_log4_mul_div`;
  - `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`;
  - `Chebyshev.psi_le_const_mul_self`;
  - `Chebyshev.theta_le_log4_mul_x`;
  - `Chebyshev.primeCounting_eq_theta_div_log_add_integral`, `Chebyshev.theta_eq_primeCounting_mul_log_sub_integral`, `Chebyshev.integrableOn_theta_div_id_mul_log_sq` and `Chebyshev.psi_eq_theta_add_sum_theta`.
- **Euler's constant:** `Real.eulerMascheroniConstant_eq_neg_integral_log` (`Mathlib/NumberTheory/Harmonic/GammaDeriv.lean`).
- **L-functions and discriminants:**
  - `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `LFunction_apply_one_ne_zero` (`…/LSeries/Nonvanishing.lean`);
  - `riemannZeta_one_sub`;
  - `IsCyclotomicExtension.Rat.natAbs_discr`;
  - `DirichletCharacter.conductor_dvd_level`, `sum_char_inv_mul_char_eq`.
- **Tau Ceti:**
  - `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (`TauCeti/Analysis/Contour/Cycle/Residue.lean:138`, namespace from line 83);
  - `TauCeti.Real.intervalIntegrable_inv_log_pow`, `logIntegral_eq_div_log_sub_add`, `logIntegral_isEquivalent_div_log`;
  - `TauCeti.primeCount_sub_mul_logIntegral_eq`, `primeCount_univ_isEquivalent_div_log`, `primeCount_eq_card`;
  - `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`;
  - `Nat.primeCounting_nth_prime`, `Nat.primesLE_eq_image_nth`;
  - the two `mertensConstant` lemmas.

### Cross-roadmap citations resolved

Each was read at the current head:

- **ExplicitZetaBounds `1a57053`** (moved since review 14's `11dd87b`):
  - §§0.2 (line 437), 0.3 (`LFunction_ne_zero_of_platt`, line 507), 0.4 (line 539) and 0.4b (the eight records named here, lines 594–657);
  - §3.4 (Delange, line 1272) and §4.7 (`0.618` given `HiaryRecord` from `t = 3`, line 1760);
  - §5.2 (Trudgian's bound only with `3.385`, lines 2056 and 2145), §5.2a (line 2127) and §5.4 (`168π`, line 2235);
  - §6.1 (`θ′ = 2/(√(π² + 4) + π)`, line 2293), §6.3a (line 2395) and §6.5 (`c = 3/2`, line 2530);
  - §7.2 (`log 0.618`, `1.88·10¹⁴`), §7.3a, §7.5 (fifth item, `C₁ = 4.171838431`, line 3018) and §7.9 (*HasLandauSiegelGap*, line 3148);
  - §§8.1, 8.3 (`10⁹/H₀ ≤ k ≤ 1`, line 3312) and 8.3a.
  - Its Not owned here (lines 167–208) leaves to this roadmap Liu–Wang's four zeros, Ramaré's revised density, Johnston–Yang's recomputed density and the `0.28 log T` count on `[2π, 8008]`. That matches the contracts at README lines 475–490.
- **AnalyticNumberTheoryPartI `3667daa`:**
  - §0.2 (line 193), §0.3 (line 216), §0.5 (line 238) and §0.7 (`quadratic_real_zero_le_of_bmor`, line 266);
  - §0.8 (line 279), §0.11d (`log_floor_factorial_eq_sum_vonMangoldt`, line 440, which consumes Mathlib's bounds) and §0.16 (line 557);
  - §§0.19–0.21, §0.25 (line 680), §0.26a (`mertens_vonMangoldt_eulerGamma`, line 702), §0.30, §0.32 and §0.34;
  - §1.5a (`3π/2`, line 1061), §1.6 (line 1071) and §1.9 (line 1164);
  - the six Lean names, which occur in its `Suggested.lean`.
- **SieveMethodsAndPrimePatterns `593232d`:** §2.9 (line 2404, the forbidden-residue sieve with `H − 1 + Q²`). §3.1 `SieveDistribution.primeCountAP` is at `Suggested.lean` line 383 in namespace `TauCetiRoadmap.SieveMethodsAndPrimePatterns`. The worker's one citation lead is therefore false.
- **Headings and ids.** README headings are unchanged since `c4b8ff9`, and the Lean names were only added (`DudekPlattRange`, `ramanujan_largest_counterexample`). So no id that ExplicitMultiplicativeFunctions, ExplicitNumberFields, ExplicitCharacterSumsAndSieves, EffectiveClassNumbers or AnalyticNumberTheoryPartIII cites is dropped. `roadmaps overlaps` reports none either way.

### Duplication and ownership

I ran `roadmaps grep` for the objects this head adds or changes:

- **Ramanujan's inequality, maximal and first-occurrence gaps, Chebyshev's weights (`0.92129`), Mandl's lemma.** They occur only here.
- **`log 4 + 4`.** In ExplicitMultiplicativeFunctions, CircleMethodThreePrimes and ClassicalSerreModularity it appears only as Mathlib's `Chebyshev.psi_le_const_mul_self`.
- **Brun–Titchmarsh.** The owner of record is §0.1 here; ExplicitCharacterSumsAndSieves, later in the order, cites it.
- **Dawson's function.** It also appears in SpecialFunctionsEiLiErfIncompleteGamma (#1924, another author, not in the merge order). The decision review 11 settled for `li` covers it: this cluster depends only on Mathlib, main and itself.

### Declared gaps

The nine gaps the README states are declared in `plan.json` with the same slugs: `rh-up-to-height`, `grh-up-to-height`, `classical-zero-free-constants`, `dirichlet-zero-free-constants`, `real-zero-gap`, `vinogradov-korobov-constants`, `explicit-zero-count-error`, `dirichlet-zero-count-error` and `explicit-zero-density`. Each names its location in ExplicitZetaBounds.

The remaining plan entries are not findings:

- `dirichlet-four-zero-region` and `lehman-weighted-zero-sum` are not cited. The first is declined by the supplier and owned here as *LiuWangFourZeros*. The second is consumed as ExplicitZetaBounds §5.4.
- `explicit-brun-titchmarsh` has supplier `none`, but its own `needs` names §0.1 of this roadmap, which states and owns it. Nothing is unowned.

## Not verifiable

- **Sources settled as uncertified or waived, cited by locator only:** `lee-nosal-2026`, `johnston-2022`, `chirre-helfgott-2025`, `fiori-kadiri-swidinsky-2023-psi`, `dusart-2018`, `axler-2018`, `axler-2024`, `axler-2019-nth-prime`, `zhang-xiong-2025`, `ramare-2023-corrigendum`, `broadbent-fiori-kadiri-ng-wilk-2026`, `fiori-jaskari-2026`, `platt-2016`, `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`, `montgomery-vaughan-1973`, `rosser-1938`, `rosser-1941`, `cipolla-1902`, `ramare-saouter-2003`, `cully-hugill-lee-2024`, `bhattacharjee-2024`, `brent-platt-trudgian-2021`, `lamzouri-li-soundararajan-2015`.
  - In particular, Remark 3.3 of `fiori-kadiri-swidinsky-2023-psi` and the Fiori–Kadiri–Swidinsky density tables (§3.4) are unread.
  - So are the arXiv abstract constants `9.22106` and `4.47·10⁻¹⁵`.
  - The new target *DudekExplicitFormula* (§2.1) therefore rests on its own route. Its order `x log x log log x/T` against `2 x log² x/T` is plausible from the Perron error with Brun–Titchmarsh, but no source proof of the full range was read.
- **`mertens-1874`:** the cached copy is image-only and OCR is not installed.
- **`pnt-plus`, `ieantn`:** no commit or declaration is given, so nothing about them was checked (R01). The same holds for `mossinghoff-trudgian-2015`, which is not in the manifest; its region was checked only through the arithmetic of §3.4.
- **`dusart-2018` rows quoted by BKLNW.** `broadbent-kadiri-lumley-ng-wilk-2021` lines 959–961 quote that paper's Theorem 4.2 with `112 568 683` and `7 713 113 853`. The README, citing the arXiv copy (not read), has `122 568 683` and `7 713 133 853`.
  - The README's thresholds are the larger ones, so its statements are the weaker in either reading.
  - The misprint is in one of the two texts; which one was not settled.
- **`Dusart2018ThetaValues`** (`θ(10¹⁰)` … `θ(10¹⁵)`) and the rows of *ButheFinerRange*: these exceed what a review-time sieve reaches.

## Source issues

- **Error** in buthe-2018 at Theorem 2, (1.6), arXiv p. 2: the source says `x − θ(x) ≤ 1.95√x` from `x = 1423`; it should be from `1427`, as it fails on `(1426.47, 1427)`; affects a stated result.
- **Error** in buthe-2018 at Lemmas 2 and 3, arXiv pp. 15–17: the source says both bounds carry `+A log x/√x`; it should be `−A log x/√x`, as (6.13) and (6.17) give; affects a stated result.
- **Error** in buthe-2018 at the proof of Lemma 2, after (6.15), arXiv p. 16: the source says the remainder is `Θ(16/α²)`, giving `1 + 5/log x` from `10⁷`; it should be `Θ(16/α)`, and `1 + 5/log x` fails at `a = 1500`, `x = 10⁸`; affects a stated result.
- **Misprint** in buthe-2018 at the proof of Lemma 3, second part, arXiv p. 17: the source says `π(10) − li(10) + (10 − θ(10))/log 10 > 0.1`; it should be the negative of that quantity, `0.1449 > 0.1`; affects the proof.
- **Error** in buthe-2016 at Theorem 2, (7.1), arXiv p. 13: the source says the `π*` bound holds for `x > 59`; it should be `x ≥ 97`, as it fails on `(96.28, 97)` (`1.918 > 1.791` at `96.9`); affects a stated result.
- **Error** in broadbent-kadiri-lumley-ng-wilk-2021 at Lemma 6, arXiv v2 p. 10: the source says `b ≥ max(log c₄, log(4(c₂+k)²/c₃²))`; it should be `b ≥ max(log c₄, 4(c₂+k)²/c₃²)`, the turning point being in `log x`; affects a stated result.
- **Misprint** in fiori-kadiri-swidinsky-2023 at Lemma 10, third case, arXiv p. 6: the source says `g(0, b, c, ·)` decreases for `√log x > −2b/c`; it should be `√log x < −2b/c`, as its proof shows; affects a stated result.
- **Misprint** in fiori-kadiri-swidinsky-2023 after (19), arXiv p. 7: the source says Dawson's function peaks near `0.942`; it should be near `0.924`; affects nothing.
- **Error** in johnston-yang-2023 at Theorem 1.4, (1.8)–(1.9), arXiv p. 2: the source says both hold for all `x ≥ 23` and writes `π(x) − x`; it should be from `59` and `71`, with `π(x) − li(x)`; affects a stated result.
- **Gap** in dudek-platt-2015 at the proof of Lemma 3.2, arXiv p. 8: the source says `π(x) < li(x)` to `1.2·10¹⁷` gives `f < g < 0` for all `x ≥ 1.15·10¹⁶`; it should cover `(1.2·10¹⁷, 1.387·10¹⁷)`, below Hassani's threshold; affects the proof.
- **Error** in platt-trudgian-2021-error at (18), first range, arXiv p. 10: the source says `a(x)/log⁵ x = (2 − log 2)/2` on `2 < x ≤ 599`; it should be `1 − (log 2)/3`, since `(x − θ(x))/x` exceeds it on `(2, 3)`; affects the proof.
- **Misprint** in dusart-2016 at Theorem 1.1 (line 79): the source says `X ≥ max(8.36, 8R)`; it should be `X ≥ max(8.36, 8/R)`, as its Lemma 3.4 and proof use; affects a stated result.
- **Misprint** in bennett-martin-obryant-rechnitzer-2018 at the proof of Lemma 6.8, arXiv p. 72: the source says `β₀ ≤ 1 − 40/(√q log³ q)` by Proposition 1.11; it should be `log² q`, as that proposition states; affects nothing.
