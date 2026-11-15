# Review of OverconvergentAutomorphicForms (pull request #1422 at beb4bd7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since beb4bd7; this round reads the pull request's title and description against the head. Both findings concern the description only; the folder's files need no change.

## R01 (P3) — The description calls the eigenvariety Cohen–Macaulay; the head proves that of its coefficient sheaf

**Location:** pull request description, `<!-- roadmap-summary -->` block, first paragraph: "Locally analytic Jacquet modules also give a definite unitary eigenvariety that is equidimensional, Cohen–Macaulay and reduced."

**Claim:** The head does not state that the eigenvariety is Cohen–Macaulay. `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md` line 425 states: "it is equidimensional, its coefficient sheaf is Cohen–Macaulay, and it is reduced".

**Witness:** `ding line 2961` (Proposition 4.14(2), p.67): the coherent sheaf is Cohen–Macaulay over the eigenvariety. The two differ: `k[[s⁴,s³t,st³,t⁴]]` has depth 1, yet its faithful module `k[[s⁴,s³t,s²t²,st³,t⁴]]` is free over `k[[s⁴,t⁴]]`.

**Repair:** Replace the sentence by: "Locally analytic Jacquet modules also give a definite unitary eigenvariety that is equidimensional of dimension `n[K:ℚₚ]` and reduced, with a Cohen–Macaulay coefficient sheaf."

## R02 (P3) — The description does not say that `Suggested.lean` states nothing

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader concludes that the Lean file states theorems with `sorry`. At this head it declares nothing: its module docstring lists every headline theorem as not statable at the pins, and elaboration emits no warning.

**Witness:** `TauCetiRoadmap/OverconvergentAutomorphicForms/Suggested.lean` lines 45–47: the namespace opens and closes with no declaration between. `lake env lean` on it prints nothing (0 warnings, 0 `sorry`). The worker's change summary: "Lean declarations: 0 removed, 0 added".

**Repair:** Replace the first sentence by: "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each one with the carriers it lacks; every target is in the README." Replace the second by: "the targeted Lake build succeeds with no warning (the file contains no `sorry`)".

## Previous findings

- The previous report, of `beb4bd7`, accepted and lists no finding of its own; the three findings it accounted for (R01–R03 of the review of `bc53e3c`) were recorded there as repaired, and the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.7 unitary dimension, Cohen–Macaulay and reducedness theorems (README line 425), against the description | `B = k[[s⁴,s³t,st³,t⁴]]`, `M = k[[s⁴,s³t,s²t²,st³,t⁴]]`, `A = k[[s⁴,t⁴]]` | `M` free of rank 4 over `A` (basis 1, s³t, s²t², st³), so Cohen–Macaulay; `B` reduced, dimension 2, depth 1 (s²t² ∉ B, s⁴·s²t², t⁴·s²t² ∈ B) | README and `ding line 2960`–`2962` agree; the description's wording is stronger | R01 |
| `Suggested.lean` as acceptance test, against the description | Elaboration at the pins; declaration count at each of the four commits of the pull request | Output empty, 0 warnings; 0 declarations at `5eb7d1bb`, `51a8ad2d`, `bc53e3c0`, `beb4bd76`; docstring names 8 groups of non-statable headlines | File is consistent with the README (line 81); the description is not | R02 |
| Weight convention `κ(x) = w(x)² t(N_p(x))⁻¹` (README line 35), cited by the description's "Hilbert" summary | `F = ℚ`, `w = x^a`, `t = x^b`; then `a = 1, b = 2` | Inverse norm: `κ = x^(2a−b)`, so `x⁰ = 1`; direct norm would give `x^(2a+b) = x⁴` | Description states no convention; nothing contradicted | none |

The rows of the previous review for untouched statements stand as in the previous review, of `beb4bd7`.

- Description sentences read against the head: 14 (summary block and prose); 12 agree with README lines 3, 7, 13–19, 23, 30, 38, 81, 425, 1512, 1548–1550; 2 are R01 and R02. The title agrees (the pull request adds the folder; 0 headings and 0 declarations removed).
- Suppliers: the `depends-on` block's ten roadmaps are the ten open or formerly open suppliers the README names; `AlgebraicVectorBundles`, `AdicSpacesPartII`–`PartIV`, `PadicMeasuresIwasawaAlgebras` and `PerfectoidTowers` are on main. No supplier is unstated.
- Cross-roadmap citation lead resolved: `AutomorphicBundles` B3.Hilbert.1–3 (README lines 15, 65, 1321) is valid at that roadmap's open head, whose README lines 219–220 map `B3.Hilbert.n = 7.(n+2)`; not a finding.
- Source locators checked against the text this round: 1 (`ding line 2960`–`2962`, Proposition 4.14, p.67, behind README line 425).
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate rerun at `beb4bd7`: every check 0, `OK`; no change outside the folder; worktree clean.
- Elaboration of `Suggested.lean` with `lake env lean`: no output (no error, no warning).
- Remark (untouched text, no change asked): the `Suggested.lean` docstring's "Cohen–Macaulay property" of the eigenvariety is read with README line 425 as the property of its coefficient sheaf.

Overlap check: read HigherHidaAndColemanTheory, PerfectoidShimuraVarieties, PadicFamiliesPartII; nothing shared (HigherHidaAndColemanTheory cites this roadmap's §§0.4, 8.6–8.7 as owner of analytic induction and the Bruhat families; PerfectoidShimuraVarieties is a supplier; PadicFamiliesPartII owns none of this roadmap's objects).

Source independence: changed passages only, and none changed; 1 passage compared with 1 source (`ding line 2960`), none shared; largest share bhw, 43 of about 146 source citations; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's sentence on AI assistance ("0 independent review rounds and 2 red-team rounds on the job board") describes the board's history, which the head does not record.
- The description's `merge-order` block is generated and outside the check of the text; its chain was not recomputed.

## Source issues

- none

## For the human reviewers

- none
