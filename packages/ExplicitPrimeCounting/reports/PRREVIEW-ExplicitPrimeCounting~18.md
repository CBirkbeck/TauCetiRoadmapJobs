# Review of ExplicitPrimeCounting (pull request #1945 at 62095a2)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since `62095a2`: the folder is the one the previous review read; this round read the pull request's title and description against the head.

## Previous findings

- The previous review (of `62095a2`) was an acceptance with no finding: there is nothing to account for.

## Verified sound

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| `brun_titchmarsh` (§0.1), cited by the description ("Brun–Titchmarsh with constant 2") | `(x, y, k, l) = (0.5, 10, 1, 0)`; `(1, 20, 2, 1)`; `(1, 3.1, 3, 1)` | counts `4`, `7`, `0`; right sides `20/log 10 = 8.69`, `40/log 10 = 17.37`, `6.2/(2 log 1.0333) = 94.5` | holds; `y > k` keeps `log(y/k) > 0` | none |
| `lamzouri_li_soundararajan` (§6.5), cited by the summary ("least primes in reduced residue classes") | `q = 4`, `q = 5`; control `q = 3` | `q = 4`: least primes `5, 3 ≤ 7.69`; `q = 5`: `11, 2, 3, 19 ≤ 41.45`; `q = 3`: class `1` has `7 > 4.83` | holds for `q > 3`; fails at `q = 3`, which the hypothesis excludes | none |
| Primes between consecutive `140`-th powers (§7.5), cited by the summary | `n = 1`, `n = 2` | `1 < 4·10¹⁸ < 2¹⁴⁰ = 1.394·10⁴²`; `2 ∈ (1, 2¹⁴⁰)`; `n¹⁴⁰ + 140 n¹³⁹ < (n + 1)¹⁴⁰` by the binomial expansion | the reduction to `x ≥ 4·10¹⁸` is right | none |

The diff changes no statement; the rows for the untouched statements stand as in the previous review, of `62095a2`.

- Pull request text, read sentence by sentence against the head: the title ("ExplicitPrimeCounting: roadmap") and the folder's change (5534 insertions, 0 deletions, the roadmap not on main) agree that the pull request adds the roadmap; no heading or Lean declaration is removed.
- Summary block: each of its 11 claims is at the head (README Summary lines 3–31; Lee–Nosal and Schoenfeld §2.2; verified heights §§2.3, 2.6; §§4.1–4.3, Layer 5, §6.5, Layer 7, the `140`-th powers at lines 4679–4682; the weighted sieve removing the factor of the unweighted one at lines 672–674; density-free schemes as special cases at lines 9–12).
- Consumers named in the description: ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions, EffectiveClassNumbers and ExplicitNumberFields each have their bullet under "Downstream consumers" (README lines 4792–4814) with the objects the description names; EffectiveClassNumbers at its open head cites §0.3b for the adapter and `p_n ∼ n log n` (its README lines 125–130).
- Suppliers: the description's list (ExplicitZetaBounds, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI) is the README's supplier sections that are or were open; ZerosOfLFunctions, LFunctions and ClassFieldTheory are on main.
- Gate: the worker's gate at `62095a2` and my rerun report every check `0`, "OK"; no file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ExplicitPrimeCounting/Suggested.lean` gives 16 "declaration uses `sorry`" warnings and nothing else.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Remark: the README calls EffectiveClassNumbers "later in the order of supply" (line 4792), and that roadmap consumes §0.3b, while the merge-order file lists it one line above this roadmap; the dependency check reports no problem.

Overlap check: read ExplicitZetaBounds, ExplicitMultiplicativeFunctions, ExplicitNumberFields (as in the previous review; nothing changed in the folder and `scratch/overlaps.md` lists no dropped id and no other pull request changing it); nothing shared.

Source independence: changed passages only; the folder changed by 0 lines, so 0 passages were compared with 0 sources and the arrangement was not compared again; the comparisons of the previous reviews stand. The text of `fiori-kadiri-swidinsky-2023-psi` could not be read.

## Not verifiable

- The items of the previous report's `## Not verifiable` stand unchanged (`fiori-kadiri-swidinsky-2023-psi` Tables 7–7′, settled as uncertified and cited by locator).
- The seeded sample fell in no changed passage (there is none), so no source locator was read again this round.

## Source issues

- none

## For the human reviewers

- **Licence.** *ButheFinerRange*, *Buthe2016Table1/2*, *FioriKadiriSwidinskyPiTables* and *FioriKadiriSwidinskyDensity* assert source tables by locator and row count without printing them (`TauCetiRoadmap/ExplicitPrimeCounting/README.md` lines 1407–1422, 1997–1999, 2809–2819, 2930–2935): whether that form suits the project is yours to decide.
- **Scope.** Sections 2.6 and 3.8 and several instances rest on sources marked *(preprint)* in the README (`chirre-helfgott-2025`, `fiori-jaskari-2026`, `banks-2026`; lines 1666–1667, 2087, 3173, 3313).
