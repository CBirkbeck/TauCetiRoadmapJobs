# Review of ExplicitZetaBounds (pull request #1954 at 11dd87b)

**Verdict:** accepted

This is an incremental re-review of the 7 lines changed since `0889de2`. All of them are in `TauCetiRoadmap/ExplicitZetaBounds/README.md`: the first item of 7.5, lines 2762–2763 and 2777, and the `kadiri2002thesis` entry under References, line 3497. `Suggested.lean` is unchanged, and the change touches nothing outside the folder. The one previous finding is repaired, and the repair adds no new problem. There are no findings, and the gate passes.

## Previous findings

- R01 — repaired: README 2762–2763 now reads "(Kadiri, Théorème 11.1, `kadiri2002thesis` lines 1976–1980, English form (115) at lines 2063–2068; the clause on the zero in the chapter's introduction, line 1964, English line 2054)". Line 2777 adds "English line 2049" to the `q ≥ 2` citation.

## Verified sound

**The repair, read at the source** (`kadiri2002thesis`, the OCR extraction recorded in the manifest).
- Line 1964 (PDF page 58, printed p. 55) says that such a zero, if it exists, is real and simple and comes from a real non-principal character.
- Line 2054 (PDF page 61) says the same in the English part, adding "modulo q".
- Line 1960 has "lorsque q ≥ 2" and line 2049 has "for q ≥ 2". Both sit in the introductions of the same two parts, so "the chapter's introduction" names the right place.
- Lines 1976–1980 are still Théorème 11.1 with (111) (`R1 = 6.4355`, `c = 1.7367`), and lines 2063–2068 are still Théorème 12.1 with (115).
- Every line number in the changed item and in the References entry (1964, 2054, 1960, 2049, 1976–1980, 2063–2068) points to the text attributed to it.
- The References entry's new clause ("real, simple and of a real non-principal character (lines 1964 and 2054)") matches those two lines.

**What depends on the changed item.** I ran `roadmaps grep --fixed '6.4355'`, which finds the only outside consumer: ExplicitPrimeCounting (#1945), README line 500, `gap:dirichlet-zero-free-constants`. It asks for the narrower form for `q ≥ 2` with the exceptional clause. The repair changed only locators, so README 2769–2778 still supplies exactly that.

The changed item also relies on the `5.558691` region of 7.3, which is a seeded target. Its locator `mty2024` lines 96–97 is Theorem 1.3, "no zeros for `|t| ≥ 2` and `σ ≥ 1 − 1/(5.558691 log|t|)`", as README 2553 states. None of the other seeded targets (1.2, 2.4, 2.5, 3.4, 4.7, 4.8, 5.1, 6.1, 6.1a, 6.4, 7.4, 8.1, 8.5, 9.1) falls in the changed lines. Earlier reviews checked them.

**Gate, build and dependencies, run here at `11dd87b`.**
- `gate … ExplicitZetaBounds --base origin/main`: every check is `0`, including `latex`, `tex`, `prnum`, `statement-hygiene`, `readme-ids-missing`, `stray-files`, `outside-folder`, `depcheck` and `source-material`, and it ends `OK`. The worker's `gate.md` agrees and reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ExplicitZetaBounds'` prints nothing. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The dependency check prints `depcheck: 237 roadmaps, 2423 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the merge order, ExplicitZetaBounds is at line 267, after ZerosOfLFunctions (48), AnalyticNumberTheoryPartI (49), AnalyticNumberTheoryPartII (50) and SieveMethodsAndPrimePatterns (56), and before ExplicitPrimeCounting (269).
- `lake env lean TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` exits 0 with 37 warnings, all ``declaration uses `sorry` ``, and no other message.
- I copied the file to scratch and appended `#check @name` for all 63 declarations. It elaborates with exit 0, no error, 63 `#check` results and the same 37 `sorry` warnings. `git diff 0889de2..HEAD -- …/Suggested.lean` is empty, so no signature changed. The file has no `variable` block, so no binder can be lost.

**Overlaps and citations.** `overlaps.md` lists no other pull request changing this roadmap and no dropped ids. The three Lean names in `citations.md` are on untouched lines (README 359, 375, 376), and earlier reviews resolved them.

**Headline theorems and padding.** These are unchanged since `0889de2`. There are 37 theorems, and the module docstring (`Suggested.lean` lines 65–68) names the one headline that is not statable: Rademacher's bound (3.2) for a general finite-order record, which needs the record `AnalyticLFunctionData` of the L-functions roadmap. The previous one-tactic probe still holds.

**Adversarial table.** The row for the changed item was computed here. Untouched statements carry the rows of PRREVIEW-ExplicitZetaBounds~9 (7.5 first item, 6.3a, 7.3a, 0.4b, 8.3a) and of PRREVIEW-ExplicitZetaBounds~8, table "Adversarial table".

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 7.5 first item, source form (`q ≥ 3`), locators changed | `q = 3, 4`, `t = 0` | boundary `0.715732`, `0.813752`; `log(3/1.7367) = 0.546626` | ✓ |
| 7.5 source form inside 7.3's `5.558691` region | `q = 3`, `\|t\| = 2`; `10`; `10⁶` | `0.874664 ≥ 0.740461`; `0.945463 ≥ 0.921871`; `0.989181 ≥ 0.986979` | ✓ |
| 7.5 narrower form (`q ≥ 2`) | `q = 2, 3, 4`, `t = 0`; `q = 2`, `\|t\| = 2` | `0.775822`, `0.858560`, `0.887911`; `0.887911 ≥ 0.740461` | ✓ |
| 7.5 source form at `q = 2` (line 2777, now with English line 2049) | `t = 0` | boundary `−0.100791`, which contains `s = 0`, where `(1 − 2⁰) ζ(0) = 0` (principal character), so the README is right to state only the narrower form at `q = 2` | ✓ |
| 7.5 exceptional clause (locator now lines 1964, 2054) | the source's text at those lines | real, simple, real non-principal character (French and English) = the README's clause | ✓ |
| 7.3 `5.558691` region, the input of the item | `mty2024` lines 96–97 | Theorem 1.3, `\|t\| ≥ 2`, `σ ≥ 1 − 1/(5.558691 log\|t\|)`; at `\|t\| = 2` the boundary is `0.740461` (README 2589) | ✓ |
| 6.3a, 7.3a, 0.4b, 8.3a, and every other statement | as in reports ~9 and ~8 | untouched | carried |

**Remarks (no change asked).**
- The board manifest's `kadiri2002thesis` locator reads "lines 1958–1980; English form (115) (lines 2063–2068)". That range covers line 1964 but not line 2054. The manifest is not part of this folder.

## Not verifiable

- `chirrehelfgott2025`, `leong2026`, `leeLeong2022`, `hoffstein1981`: the cache has image-only scans and this worker has no OCR. None of their locators changed.
- The uncertified and waived works the manifest settles. None of their locators changed.

## Source issues

- none
