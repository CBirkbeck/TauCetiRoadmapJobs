# Review of SuperconnectionsAndMathaiQuillenForms (pull request #2297 at 5125255)

**Verdict:** needs changes

## R01 (P3) — 6.1 and 6.2 cite a review identifier; 4.4 (b) has a section but no statement number

**Location:** TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms/README.md:1057–1058 and :1108–1109: “as stated in its review Zbl 0671.57013” (twice); :820: “Berline–Getzler–Vergne, §9.1, in Ch. 9, pp. 263–310, for (b)”.
**Claim:** Not repaired from the previous review (its R01). The two Quillen 1988 locators locate nothing inside the paper, and 4.4 (b) gives a 48-page chapter range instead of a statement number and page.
**Witness:** `git diff ca0f42b 5125255 -- TauCetiRoadmap/SuperconnectionsAndMathaiQuillenForms` is empty; the three passages read as quoted.
**Repair:** At :1057 and :1108 replace “as stated in its review Zbl 0671.57013” by the section and page of Quillen 1988 for the correspondence and for each of `γ_(2k)`, `γ_(2k−1)`; at :820 give the statement number and its page inside §9.1. Both texts stay uncertified and are not requested again; this needs a reader with access to them.

## Previous findings

- R01 — not repaired: “as stated in its review Zbl 0671.57013” (README.md:1058, :1109); “Berline–Getzler–Vergne, §9.1, in Ch. 9, pp. 263–310, for (b)” (:820). Written again as R01.
- R02 — repaired: the description now reads “the theorem number and page in Berline–Getzler–Vergne, §9.1, of the finite-dimensional limit theorem of 4.4 (b)” and, under Sources, “Ch. 9, pp. 263–310, which contains §9.1”.

## Verified sound

| Statement | Instances | Left side computed | Right side computed | Result | Change |
|---|---|---|---|---|---|
| 6.1 `grading_mul_cayley_mul_grading`, and `W = (1 − X)E⁺` (touched by R01) | `m = n = 1`, `T = t` real, `X = [[0, −t], [t, 0]]` | `g = (1+t²)⁻¹[[1−t², −2t], [2t, 1−t²]]`; `εgε = (1+t²)⁻¹[[1−t², 2t], [−2t, 1−t²]]` | `g⁻¹ = gᵀ`, the same matrix; `εg(1, −t) = (1, −t)`, so `W = span(1, −t)`, the graph of `−T` | agrees | — |
| 6.1 `cayley_cayleyInv` (touched by R01) | `g = [[0, −1], [1, 0]]` (`t = 1`); negative control `g = −1` | `(g − 1)(g + 1)⁻¹ = ½[[−1, −1], [1, −1]][[1, 1], [−1, 1]] = [[0, −1], [1, 0]]`, odd and skew | `X` at `t = 1`; for `g = −1`: `(g+1)⁻¹ = 0` (junk), `cayleyInv g = 0`, `cayley 0 = 1 ≠ −1`, excluded by `IsUnit (g + 1)` | agrees; hypothesis needed and present | — |

The rows of the untouched statements stand as in the previous review, of `ca0f42b`; the folder is byte-identical to that head (the new commit merges main).

- Folder diff since `ca0f42b`: 0 lines. Diff against the base outside the folder: empty (`git diff --stat origin/main...HEAD` with the folder excluded prints nothing); the files listed as changed since `ca0f42b` come from the merge of main.
- Description against the head: pins `1b1ccf4` (Mathlib) and `2fd255d` (Tau Ceti) match `lake-manifest.json` after the merge; `Suggested.lean` is unchanged since `0c22c1ff`; “Nothing outside the folder changes” holds; 16 sorried theorems.
- Cross-roadmap citation resolved again on main (`8a42212`): GeneralizedCohomology G4.0b (README.md:939, :958 there), so the overlap lead “only an open revision defines it” does not hold. No id dropped by an open pull request; no other open pull request changes this roadmap.
- Gate: every worker check passed (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `OK`). Dependency check: `depcheck: 244 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins: 16 `sorry` warnings, nothing else. The file is unchanged, so the signature comparison and the padding probe of the earlier reviews stand.
- Source locators: none added or changed; no seeded target falls in a changed passage.
- Remark: the description's “Review” section says “Three points need checking” and lists four.

Overlap check: read RationalHomotopyModels, SpinGeometry, CalibratedGeometry, IndexTheory at the earlier reviews; no object added since, and ownership stands as recorded there (Clifford modules: SpinGeometry; real skew normal form: CalibratedGeometry §4.2; index formulas: IndexTheory; real Pfaffians: RandomMatrices §8.5); nothing shared with RationalHomotopyModels.

Source independence: changed passages only: 0 passages changed, so none compared; largest share Wu2006, 23 of 55 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent. The texts of BGV1992 and Quillen1988 could not be read.

## Not verifiable

- BGV1992 §1.4 (4.1) and §9.1 (4.4 (b)): settled uncertified, text not read.
- Quillen1988 for 6.1 and 6.2: settled uncertified, text not read.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGV1992 (15 of 55 locators) and Quillen1988 were not readable: wording and arrangement were not compared with them, and the locators R01 asks for need someone with access to both texts.
- **Licence.** README.md:1245 and :1250 cite Knuth (arXiv:math/9503234) and Harvey–Lawson (arXiv:math/9407216), both read from arXiv; the package's `sources.toml` has no entry for either.
