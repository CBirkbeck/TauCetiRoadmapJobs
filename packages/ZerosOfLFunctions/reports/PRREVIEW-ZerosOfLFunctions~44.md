# Review of ZerosOfLFunctions (pull request #1907 at 0271be3)

**Verdict:** needs changes

This is an incremental re-review of the 8 lines changed since `facf136`. All of them are in one sentence of 7.5 in `README.md`, and `Suggested.lean` is unchanged. The previous finding is repaired. The repair adds one P3 finding: the newly quoted constants are not labelled with the version they come from. The gate passes, and `Suggested.lean` elaborates with `sorry` as its only warning. There is no blocking finding.

## R01 (P3) — Trudgian's quoted error term is from arXiv v4, but the cited published Theorem 2 has different constants

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`:1527–1530: "Trudgian, Theorem 2, states the same count, without the term `r₁/4`, with the error `0.317 (log |d_K| + n log T) + 6.333 n + 3.482` for `T ≥ 1`". README:1968–1971 (References) cites "Math. Comp. 84 (2015); arXiv:1206.1844 — Theorem 2" without a version.

**Claim.** These are the constants of Theorem 2 in the cited work. The published version is named first.

**Witness.** `trudgian2015` line 27 (arXiv v4, the last arXiv version) has 0.317, 6.333 and 3.482. `hasanalizade2022` lines 37–39 cite the Math. Comp. 84 paper (line 786) and quote its Theorem 2 as (0.316, 5.872, 3.655). Their line 73 quotes the row (0.247, 8.851, 3.024), where v4 at line 67 has (0.248, 9.270, 3.005).

**Repair.** Label the version that was read, as the README already does for the other two counting papers:

- At README:1527, write "Trudgian, Theorem 2 in the arXiv v4 text, states the same count, …".
- In the References entry, replace "Theorem 2" by "Theorem 2 in the arXiv v4 text (the published constants, as Hasanalizade–Shen–Wong quote them in §1, p. 1, are `0.316`, `5.872`, `3.655`)".

Tested on both triples, the parenthetical "a larger leading constant and smaller secondary ones" stays true. Against Hasanalizade–Shen–Wong's `0.22737`, `23.02528`, `4.51954`: `0.317` and `0.316` are both larger; `6.333` and `5.872` are both smaller than `23.02528`; `3.482` and `3.655` are both smaller than `4.51954`. Nothing else in 7.5 or in `Suggested.lean` changes.

## Previous findings

- R01 — repaired: README:1527–1530 "states the same count, without the term `r₁/4`, with the error `0.317 (log |d_K| + n log T) + 6.333 n + 3.482` for `T ≥ 1` (a larger leading constant and smaller secondary ones)". The new sentence has no version label; that is R01 of this report.

## Verified sound

**Gate and build.**
- I re-ran the gate at `0271be3`. Every counter is `0` and it ends `OK`; the worker's line at this head also has `build=0`.
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`: 19 warnings, all `declaration uses 'sorry'`, and no error.
- Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- `git diff facf136 HEAD` shows a single file changed: `README.md`, 5 insertions and 3 deletions.

**Dependency check.** Output: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff changes no `*Needs:*` line, supplier citation or backticked name.

**Lean signatures and padding.** `Suggested.lean` is byte-identical to `facf136` (`git diff` is empty), so none of its 24 declarations changed.
- The previous report's `#check` comparison still holds. It covered `finite_zero_sum_le_logDeriv`, `riemannVonMangoldt_dedekindZeta` (`C` chosen before `K`) and `riemannVonMangoldt_heckeLFunction` (`∀ n, ∃ C, ∀ K`).
- So does its one-tactic probe. I re-ran neither, because no statement changed.
- The headline theorems in the file are unchanged:
  - `dirichletLFunction_convexity`, `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard`
  - the four zero-free regions
  - `completed_orderLE_one`, `finite_zero_sum_le_logDeriv`
  - the four Riemann–von Mangoldt statements
  - `chebyshevPsi_explicitFormula`, `riemannZeta_weilExplicitFormula`
  - the four effective prime counts

**Sources for the changed passage.**
- `trudgian2015`, Theorem 2 (arXiv v4, 5 Dec 2013, line 5):
  - lines 16–17: the count is of zeros of `ζ_K` with `0 < β < 1` and `|γ| ≤ T`, the same count as the README's `N±_K(T)`;
  - lines 25–27: `T ≥ 1`, any number field, the main term `(T/π) log(d_K (T/2πe)^{n_K})` with no `r₁` term, and the constants `0.317`, `6.333`, `3.482`.
- The arXiv abstract page lists v4 as the last version. For the published version, see R01 and "Not verifiable".
- `bennett2021` lines 73–76 (§1, p. 2): Trudgian's proof is incomplete because one parameter inequality was wrongly argued to be redundant, and the same problem recurs in his Theorem 2. This supports "the proofs of Trudgian's Theorems 1 and 2 are incomplete (a parameter inequality is wrongly treated as redundant)".
- `hasanalizade2022`:
  - lines 40–41 and 49–50 (§1, pp. 1–2) and lines 84–85 (p. 2): the error and its repair in the Dedekind case;
  - lines 52–54: Theorem 1.1 on p. 2, `T ≥ 1`, the term `+ r₁/4`, and the three constants. I re-read these because the sentence compares against them.
- Seeded sample:
  - 7.5 is the only target in the diff, and it is checked as above.
  - 3.1, 3.4, 3.5, 4.2, 4.5, 5.4, 6.3, 6.4a, 7.2, 7.3, 8.2, 8.4, 8.6 and 8.7 are untouched text that earlier reports passed. I did not re-read them.

**Ownership, overlaps and citations.**
- `overlaps.md` lists no dropped id and no id that only an open revision defines.
- The other open pull request on this folder is #1913. The description's merge-order block orders it first. This diff adds no declaration, so the ownership search of the earlier reports still holds.
- `citations.md` flags six names at README:346–349. They are LFunctions roadmap names on main (that roadmap's `README.md` lines 1026, 1029 and 1266), in untouched text.

**Adversarial table: the changed statement** (values computed at this head).

| Statement | Instance | Left / claimed | Right / computed | Result |
|---|---|---|---|---|
| "a larger leading constant and smaller secondary ones" (v4) | `trudgian2015` l. 27 against `hasanalizade2022` l. 54 | `0.317`, `6.333`, `3.482` | `0.22737`, `23.02528`, `4.51954`: larger, smaller, smaller | ✓ |
| same, published triple | `hasanalizade2022` l. 39 | `0.316`, `5.872`, `3.655` | larger, smaller, smaller | ✓ (version label: R01) |
| "without the term `r₁/4`" | `K = ℚ`, `r₁ = 1` | Trudgian's left side has no `r₁` (l. 27) | Hasanalizade–Shen–Wong add `¼` (l. 54) | ✓ |
| "the same count" | `trudgian2015` l. 16–17 | `0 < β < 1`, `abs γ ≤ T` | README `0 < Re ρ < 1`, `abs (Im ρ) ≤ T`, with multiplicity | ✓ |
| "for `T ≥ 1`" | `trudgian2015` l. 25 | `T ≥ 1` | `T ≥ 1` | ✓ |
| Trudgian's bound, `K = ℚ`, `T = 100` | count `58`, main `(100/π) log(100/17.080) = 56.255` | `abs(58 − 56.255) = 1.745` | `≤ 11.275` (v4); `≤ 10.982` (published triple) | ✓ |
| same, `K = ℚ`, `T = 1` | count `0`, main `(1/π) log(1/17.080) = −0.903` | `0.903` | `≤ 9.815` | ✓ |
| Hasanalizade–Shen–Wong, `K = ℚ`, `T = 100` | `+ r₁/4 = 0.25` | `abs(58 − 56.255 + 0.25) = 1.995` | `≤ 0.22737 · log(102/2π) + 27.545 = 28.179` | ✓ |
| coefficientwise reading, `K = ℚ(i)`, `T = 100` | `d = 4`, `n = 2`, main `156.636` | Trudgian `19.507` | Hasanalizade–Shen–Wong `52.153`: the secondary terms dominate here, as the parenthetical says | ✓ |
| no overall-size claim | `n = 1`, `d = 1` | the v4 bound exceeds Hasanalizade–Shen–Wong's from `log₁₀ T = 83.88` (published triple: `86.24`) | at `T = 10¹⁰⁰`: `82.81` against `79.48`; the sentence claims neither bound is smaller overall | ✓ |
| Bennett–Martin–O'Bryant–Rechnitzer report | `bennett2021` l. 73–76, p. 2 | incomplete proof; one inequality wrongly argued redundant; recurs in Theorem 2 | README:1530–1532 says the same | ✓ |

**Adversarial table: untouched statements.** The diff touches none of the following, so their rows are carried forward:
- the 43 rows of PRREVIEW-ZerosOfLFunctions~40 (1.1, 1.2, 1.4, 3.1, 4.1, 4.3, 4.5, 5.1, 5.2, 5.4, 6.1, 6.2, 7.1, 7.6, 8.2–8.4, 8.6–8.8 and every headline above);
- the 12 ✓ rows of PRREVIEW-ZerosOfLFunctions~42 (6.4a and `finite_zero_sum_le_logDeriv` for non-real `χ`, the derivation of `C = 41`, `riemannVonMangoldt_dedekindZeta` at `K = ℚ`, `T = 2, 100` and at `K = ℚ(i)`).

Headline values carried from them:
- `gammaLogDerivBound = 1 + ½ log π = 1.572365`;
- `N(100) = 29` against `28.127`;
- `0.22737 + 27.795/log 2 = 40.327 < 41`;
- the quartic `χ` mod 5 at `σ = 2` gives a right side of at least `1.807`.

**Remark on untouched text** (no change asked of this folder). The board manifest records the `venue` of `trudgian2015` as Math. Comp. 84 no. 294, pp. 2047–2058, which is the arXiv journal reference. `hasanalizade2022` line 786, `bennett2021` line 1150 and the DOI's resolution (`pubs.ams.org/journals/mcom/2015-84-293/…`) all give no. 293, pp. 1439–1450.

## Not verifiable

- The published text of Trudgian, Math. Comp. 84 (2015), DOI 10.1090/S0025-5718-2014-02898-6. The sources service found no legal source: the DOI's landing page is on a host with no licence class. A direct read of the AMS page returned 403. R01 therefore rests on Hasanalizade–Shen–Wong's quotation of that version, with Bennett et al. line 72 ("all pairs have `C₁ ≥ 0.247`", where v4 Table 1 starts at `0.248`) as corroboration. The repair, labelling the version that was read, is right whatever the published text says.
- Davenport (`davenport2000`), Lang (`lang1994`), Titchmarsh, Lagarias–Odlyzko and Iwaniec–Kowalski are settled as uncertified or cited by locator. The changed passage cites none of them.

## Source issues

- **Gap** in trudgian2015 at Theorems 1 and 2, proofs §§4–5: the source treats one of the parameter inequalities of its argument as redundant; it should be verified, as Bennett–Martin–O'Bryant–Rechnitzer §1 and Hasanalizade–Shen–Wong §1 point out; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Dirichlet) and hasanalizade2022 Theorem 1.1 (Dedekind).
- **Misprint** in hasanalizade2022 at §1, p. 2 (the note after Corollary 1.2): the source spells the word "value" as "vlaue"; it should be "value"; affects nothing.
