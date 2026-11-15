# Review of CircleMethodThreePrimes (pull request #1803 at b48dc9c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since b48dc9c; this round reads the pull request's title and description against the head.

## R01 (P3) — the description omits the supplier `AutomorphicSpectralTheory` §1.16 and its place in the merge order

**Location:** pull request description, third paragraph: "Vaughan's identity is consumed from `SieveMethodsAndPrimePatterns` §2.4 (#1495) and Siegel-Walfisz from `AnalyticNumberTheoryPartI` §0.32 (#1126). … This roadmap therefore merges after #1495 and #1126."

**Claim:** The prose names two suppliers and a merge order after those two. The head has a third supplier, added by commit b48dc9c, that the prose does not state; it is still an open pull request, so the stated merge order is incomplete.

**Witness:** `TauCetiRoadmap/CircleMethodThreePrimes/README.md` lines 48, 105–109, 198–199, 209 cite `AutomorphicSpectralTheory` §1.16 (0 occurrences at 237a60c, 6 at b48dc9c). The generated depends-on block lists #925 unmerged.

**Repair:** Replace the two sentences by: "Vaughan's identity is consumed from `SieveMethodsAndPrimePatterns` §2.4 (#1495), Siegel-Walfisz from `AnalyticNumberTheoryPartI` §0.32 (on main, #1126), and the Ramanujan sum is identified with the Kloosterman value `S(n, 0; q)` of `AutomorphicSpectralTheory` §1.16 (#925)." and "This roadmap therefore merges after #1495 and #925."

## Previous findings

- none: the previous review, of b48dc9c, had no finding.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.2 identification `ramanujanSum q n = S(n, 0; q)` with `AutomorphicSpectralTheory` §1.16 (the supplier R01 touches) | `q = 12`, `n = 1, 2, 3, 4, 6, 0`; `q = 1` | `∑_{d ∣ (n, 12)} d μ(12/d)`: `0, 2, 0, −2 (= 2μ(6) + 4μ(3)), −4 (= 2 − 6), 4 (= φ(12))`; README line 192: `0, 2, 0, −2, −4, 4`; `q = 1`: both `1` | holds | none |
| Description: "Siegel-Walfisz from `AnalyticNumberTheoryPartI` §0.32" | main's §0.32 and its `Suggested.lean` | main README line 849 "### 0.32 Siegel–Walfisz theorem", `psiAP (q : ℕ) (a : ZMod q) (x : ℝ)` at its `Suggested.lean` line 166; same argument order as here | holds | none |
| Description: "Vaughan's identity … `SieveMethodsAndPrimePatterns` §2.4" | head of that open roadmap | README line 2041 "### 2.4 Vaughan's decomposition"; `theorem vaughan_identity (U V n : ℕ)` at its `Suggested.lean` line 363 | holds | none |

The rows for the other statements stand as in the previous review, of b48dc9c.

- Description sentences checked against the head, 9: the three files and `topic = "math.NT"`; the layer run 0.1 → 4.9 (43 headings); "owns no sieve and no L-function" (README lines 10–11); `SiegelWalfiszBound` and Layer 4.9; `sorry` only (18 `sorry` warnings, 28 declarations, no sorried data); "touches only its own directory" (`git diff --stat origin/main...HEAD` outside the folder is empty). All agree with the head except the two of R01. The title agrees: the roadmap is not on main and the pull request adds it.
- Remark, no change asked: "A search of … all 448 open pull requests found no circle-method roadmap" is a dated count; the index now has 473 open roadmap pull requests, among them `ExponentialSumsAndCircleMethodPartII`, whose subject (the geometric circle method over `𝔽_q((T⁻¹))`) shares no object with this roadmap.
- Remark, no change asked: main's `AnalyticNumberTheoryPartI` §0.32 (line 853) now states Siegel–Walfisz with effective constant and threshold; README line 102 ("may be ineffective") consumes the weaker form, which it implies.
- Cross-roadmap citations resolved, 3: `AnalyticNumberTheoryPartI` §0.32 (main), `SieveMethodsAndPrimePatterns` §2.4 (open head 66e58fc), `AutomorphicSpectralTheory` §1.16 (open head 2920b0d, its README line 1233: `S(m,n;c)` for `c ≥ 1`; no Kloosterman or Ramanujan declaration in its `Suggested.lean`). `roadmaps resolve` lead `SieveVaughan.vaughan_identity`: found at the supplier's head.
- Overlap check: read SieveMethodsAndPrimePatterns, ExplicitCharacterSumsAndSieves, ExplicitPrimeCounting, AnalyticNumberTheoryPartIII, AnalyticNumberTheoryPartI, ExponentialSumsAndCircleMethodPartII; nothing shared (`AnalyticNumberTheoryPartIII` §13.2 owns finite Goldbach ranges `OddGoldbachUpTo H`, not the asymptotic theorem; `psiAP` is owned by `AnalyticNumberTheoryPartI`, as README line 101 says). No other open head declares `ramanujanSum`, `primeExpSum`, `singularSeries`, `threePrimeWeight`, `expTwoPiI`, `distInt` or `SiegelWalfiszBound`.
- Gate at b48dc9c with the job's merge order: every check 0, OK (the plain gate reports only `NOT IN ORDER`, the configured order not listing the roadmap yet). Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap is at line 99 of the order, after `AnalyticNumberTheoryPartI` (50), `SieveMethodsAndPrimePatterns` (57) and `AutomorphicSpectralTheory` (98).
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean`: 18 `declaration uses sorry` warnings, nothing else. The file is unchanged since the previous review, so the 28 signatures compared there stand.
- Source independence: changed passages only; 0 passages changed, so none compared; largest share Davenport, *Multiplicative Number Theory*, 5 of 10 `Source:` locators; its text and contents could not be read (closed), arrangement not compared again since no layer was added, removed or reordered.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, 3rd ed., Chapters 25–26; Vaughan, *The Hardy–Littlewood Method*; Iwaniec–Kowalski §§13.5, 19.4; Vinogradov 1937; Vaughan 1977: closed or not online; no passage changed, so the seeded sample was not re-examined.
- "Closes #1802" and the count of 448 pull requests searched: outside the files this review reads.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74), the source with the largest share of the locators (5 of 10 `Source:` lines of `TauCetiRoadmap/CircleMethodThreePrimes/README.md`), is closed: wording and arrangement were not compared with its text or table of contents.
- **Licence.** `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, "Prior work", names the repository `sthubbar/lean-lab-ci` as a source from which material is taken and restated; its licence was not read.
