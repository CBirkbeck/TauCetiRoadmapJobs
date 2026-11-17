# Review of CircleMethodThreePrimes (pull request #1803 at b48dc9c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since b48dc9c; this round reads the rewritten pull request description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "…and the Ramanujan sum is identified with the Kloosterman value `S(n, 0; q)` of `AutomorphicSpectralTheory` §1.16 (#925)" and "This roadmap therefore merges after #1495 and #925."

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description and README 0.2: `ramanujanSum q n = S(n, 0; q)` of `AutomorphicSpectralTheory` §1.16 | `(q, n) = (5, 1), (5, 5), (4, 2), (1, 0)` | Unit sum `∑ e(nd/q)`: `−1, 4, −2 (= e(1/2) + e(3/2)), 1`; `∑_{d ∣ (n, q)} d μ(q/d)`: `μ(5) = −1, −1 + 5 = 4, μ(4) + 2μ(2) = −2, 1` | holds | none |
| Description: "Siegel-Walfisz from `AnalyticNumberTheoryPartI` §0.32 (on main, #1126)" | main's README and `Suggested.lean` | README line 849 "### 0.32 Siegel–Walfisz theorem"; `psiAP (q : ℕ) (a : ZMod q) (x : ℝ)` line 166, `siegel_walfisz` line 328 | holds | none |
| Description: "Vaughan's identity is consumed from `SieveMethodsAndPrimePatterns` §2.4 (#1495)" | that roadmap, now on main | README line 2041 "### 2.4 Vaughan's decomposition" under Layer 2 (line 1651); `theorem vaughan_identity (U V n : ℕ)` at its `Suggested.lean` line 363 | holds | none |
| Description: "Siegel-Walfisz is also stated as the proposition `SiegelWalfiszBound` … Layer 4.9 discharges it" | README lines 111–115, 423–428 | Line 115 states the proposition; line 423 "Prove `siegelWalfiszBound : SiegelWalfiszBound` from `siegel_walfisz`", *Needs* §0.32 and 4.8 | holds | none |

The rows for the other statements stand as in the previous review, of b48dc9c.

- Description sentences checked against the head, 11: the three files and `topic = "math.NT"`; the layer run 0.1 → 4.9 (43 headings added, none removed); "owns no sieve and no L-function" (README lines 10–11); the three suppliers with their sections (README lines 43, 45, 48); `SiegelWalfiszBound` and Layer 4.9; the merge order after #1495 and #925; `sorry` only (18 `sorry` warnings, 28 declarations, no sorried data, no `set_option`); "touches only its own directory" (the diff against main outside the folder is empty). All agree with the head. The title agrees: the roadmap is not on main and the pull request adds it.
- Remark, no change asked: `SieveMethodsAndPrimePatterns` is on main now, so of "merges after #1495 and #925" only #925 is still open; the generated depends-on block shows exactly that.
- Remark, no change asked: "all 448 open pull requests" is a dated count (449 open roadmap pull requests in the present index); the only other title with "circle method", `ExponentialSumsAndCircleMethodPartII`, shares no object with this roadmap.
- Cross-roadmap citations resolved, 3: `AnalyticNumberTheoryPartI` §0.32 (main), `SieveMethodsAndPrimePatterns` §2.4 (main), `AutomorphicSpectralTheory` §1.16 (open head 759fa5b, its README line 1233–1235: `S(m,n;c)` for `m, n ∈ ℤ`, `c ≥ 1`; no Kloosterman or Ramanujan declaration in its `Suggested.lean`). The `roadmaps resolve` lead `SieveVaughan.vaughan_identity` is found in the supplier's `Suggested.lean`.
- Overlap check: read ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI, ExplicitPrimeCounting; nothing shared (third list empty; no other-pull-request change, dropped id or second copy reported). No other roadmap, open or on main, declares `ramanujanSum`, `primeExpSum`, `singularSeries`, `threePrimeWeight`, `SiegelWalfiszBound`, `expTwoPiI` or `distInt`.
- Gate at b48dc9c with the job's merge order: every check 0, OK (run again with the configured order it reports only `NOT IN ORDER`, that order not listing the roadmap yet). Dependency check: `depcheck: 261 roadmaps, 2598 edges, 0 problem(s)`; no UPWARD or CYCLE line; the roadmap is at line 105 of the order, after `AnalyticNumberTheoryPartI` (54), `SieveMethodsAndPrimePatterns` (62) and `AutomorphicSpectralTheory` (104).
- Elaboration: `lake env lean` on `TauCetiRoadmap/CircleMethodThreePrimes/Suggested.lean`: 18 `declaration uses sorry` warnings, nothing else. The file is unchanged, so the 28 signatures compared earlier stand.
- Source independence: changed passages only; the folder has 0 changed passages, so none compared; largest share Davenport, *Multiplicative Number Theory*, 5 of 10 `Source:` locators; its text and contents could not be read (closed); arrangement not compared again, no layer being added, removed or reordered.
- Research link: the headline is Vinogradov's three-primes theorem (Vinogradov 1937), proved by the Hardy–Littlewood circle method with Vaughan's identity (Vaughan 1977) and Siegel–Walfisz, as in Davenport Chapters 25–26 and Helfgott 2015 on the ternary Goldbach problem; rests on the README's statement of purpose and its references.

## Not verifiable

- Davenport, *Multiplicative Number Theory*, 3rd ed., Chapters 25–26; Vaughan, *The Hardy–Littlewood Method*; Iwaniec–Kowalski §§13.5, 19.4; Vinogradov 1937; Vaughan 1977: closed or not online; no passage of the folder changed, so the seeded sample was not re-examined.
- "Closes #1802" and the count of 448 pull requests searched: outside the files this review reads.

## Source issues

- none

## For the human reviewers

- **Not tested.** Davenport (GTM 74), the source with the largest share of the locators (5 of 10 `Source:` lines of `TauCetiRoadmap/CircleMethodThreePrimes/README.md`), is closed: wording and arrangement were not compared with its text or table of contents.
- **Licence.** `TauCetiRoadmap/CircleMethodThreePrimes/README.md`, "Prior work", names the repository `sthubbar/lean-lab-ci` as a source from which material is taken and restated; its licence was not read.
