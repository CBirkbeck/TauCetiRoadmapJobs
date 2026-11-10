# Review of ZerosOfLFunctions (pull request #1907 at 7e9017d)

**Verdict:** accepted

This is an incremental re-review of the 11 lines changed since `0271be3`. All of them are in `TauCetiRoadmap/ZerosOfLFunctions/README.md`: one sentence of 7.5 (lines 1527–1528) and the Trudgian entry of the References (lines 1968–1974). `Suggested.lean` is unchanged. The previous finding is repaired and the repair introduces no new problem. There is no finding.

## Previous findings

- R01 — repaired: README:1527–1528 "Trudgian, Theorem 2 in the arXiv v4 text, states the same count"; README:1970–1973 "Theorem 2 in the arXiv v4 text (… the published constants, as Hasanalizade–Shen–Wong quote them in §1, p. 1, are `0.316`, `5.872`, `3.655`)".

## Verified sound

**Gate and build.**
- I re-ran the gate at `7e9017d`. Every counter is `0` and it ends `OK`; the worker's line at this head also has `build=0`.
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`: 19 warnings, all `declaration uses 'sorry'`, and no error.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- `git diff --stat 0271be3 HEAD` shows one file, `README.md`, 7 insertions and 4 deletions.

**Dependency check.** Output: `depcheck: 234 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff changes no `*Needs:*` line, supplier citation or backticked Lean name.

**Sources for the changed passages** (4 source passages read).
- `trudgian2015` line 5: the cached text is arXiv:1206.1844v4 (5 Dec 2013), so the label "arXiv v4" names the text the constants come from.
- `trudgian2015` lines 25–27, Theorem 2: `T ≥ 1`, main term `(T/π) log(d_K (T/2πe)^{n_K})`, error `0.317 (log d_K + n_K log T) + 6.333 n_K + 3.482`. The References entry now states all four items, and they agree.
- `hasanalizade2022` lines 37–39: the triple `(0.316, 5.872, 3.655)` attributed to the published paper. These lines precede the `=== page 2 ===` marker at line 47, so the locator "§1, p. 1" is right.
- `hasanalizade2022` lines 52–54 (Theorem 1.1, p. 2): the triple `0.22737`, `23.02528`, `4.51954` that the parenthetical in 7.5 compares against.
- No target of the seeded sample (1.6, 3.5, 4.4, 4.5, 4.6, 5.3, 5.5, 5.6, 6.3, 7.2, 7.3, 7.4, 8.7, 8.8, 8.9) falls in the changed passages. They are untouched text that earlier reports passed, and I did not re-read them.

**Lean signatures and padding.** `Suggested.lean` is byte-identical to `0271be3`, so none of its 24 declarations changed. The `#check` comparison and the one-tactic probe of the earlier reports stand; I re-ran neither. The headline list is unchanged.

**Ownership, overlaps and citations.**
- `overlaps.md` lists no dropped id and no id that only an open revision defines. The other open pull request on this folder is #1913, and the description's merge-order block orders it first.
- `citations.md` flags six `Grossencharacter.*` names at README:346–349. They are LFunctions roadmap names on main, in untouched text, as the previous report resolved.
- The diff adds no declaration and no object, so the ownership search of the earlier reports stands.

**Adversarial table: the changed passages** (values computed at this head).

| Statement | Instance | Left / claimed | Right / computed | Result |
|---|---|---|---|---|
| "Theorem 2 in the arXiv v4 text" has error `0.317 (log d_K + n log T) + 6.333 n + 3.482`, `T ≥ 1` | `trudgian2015` l. 5, 25–27 | README:1529, 1971 | v4: `0.317`, `6.333`, `3.482`, `T ≥ 1` | ✓ |
| "the published constants … are `0.316`, `5.872`, `3.655`" | `hasanalizade2022` l. 39, p. 1 | README:1972–1973 | `(0.316, 5.872, 3.655)` | ✓ |
| "a larger leading constant and smaller secondary ones", both triples | against `hasanalizade2022` l. 54 | `0.317`, `0.316` > `0.22737` | `6.333`, `5.872` < `23.02528`; `3.482`, `3.655` < `4.51954` | ✓ |
| References main term agrees with 7.5 | `K = ℚ`, `T = 100` | `(100/π) log(100/(2πe)) = 56.255` | same expression at README:1522 with `d = 1`, `n = 1` | ✓ |
| Trudgian's bound at `K = ℚ`, `T = 100` | count `58` | `abs(58 − 56.255) = 1.745` | `≤ 11.275` (v4); `≤ 10.982` (published triple) | ✓ |
| `C = 41` derivation in the same paragraph, unchanged by the edit | `23.02528 + 0.25 + 4.51954` | `27.795` | `0.22737 + 27.795/log 2 = 40.327 < 41` | ✓ |

**Adversarial table: untouched statements.** The diff touches none of the following, so their rows are carried forward:
- the 43 rows of PRREVIEW-ZerosOfLFunctions~40 (1.1, 1.2, 1.4, 3.1, 4.1, 4.3, 4.5, 5.1, 5.2, 5.4, 6.1, 6.2, 7.1, 7.6, 8.2–8.4, 8.6–8.8 and every headline theorem);
- the 12 rows of PRREVIEW-ZerosOfLFunctions~42 (6.4a and `finite_zero_sum_le_logDeriv` for non-real `χ`, `riemannVonMangoldt_dedekindZeta` at `K = ℚ` and `K = ℚ(i)`);
- the 11 rows of PRREVIEW-ZerosOfLFunctions~44 for the rest of the 7.5 sentence ("the same count", "without the term `r₁/4`", the Bennett–Martin–O'Bryant–Rechnitzer report, the coefficientwise comparison at `K = ℚ(i)`).

Headline values carried from them: `gammaLogDerivBound = 1 + ½ log π = 1.572365`; `N(100) = 29` against `28.127`; the quartic `χ` mod 5 at `σ = 2` gives a right side of at least `1.807`.

## Not verifiable

- The published text of Trudgian, Math. Comp. 84 (2015). No legal copy was found in the previous round. The README now attributes the published constants to Hasanalizade–Shen–Wong's quotation, which is what was read, so nothing in the folder depends on the published text.
- Davenport (`davenport2000`), Lang (`lang1994`) and Lagarias–Montgomery–Odlyzko (`lagarias1979`) are settled as uncertified. The changed passages cite none of them.

## Source issues

- **Gap** in trudgian2015 at Theorems 1 and 2, proofs §§4–5: the source treats one of the parameter inequalities of its argument as redundant; it should be verified, as Bennett–Martin–O'Bryant–Rechnitzer §1 and Hasanalizade–Shen–Wong §1 point out; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Dirichlet) and hasanalizade2022 Theorem 1.1 (Dedekind).
