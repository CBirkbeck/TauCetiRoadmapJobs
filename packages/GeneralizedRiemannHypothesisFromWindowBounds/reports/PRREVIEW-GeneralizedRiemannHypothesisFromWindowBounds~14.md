# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at 094da69)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of 0 changed lines since `3b77a6a`. The one finding of the previous review, the removal of Layer 6 (§§6.1–6.32) and §§5.4–5.6, is settled by a decision of the human reviewers; I checked that the head does exactly what the decision allows and nothing beyond it, that the supplier citations still resolve at this head, and that the file still elaborates. There are no findings, no small corrections and no format notes. The scope and licence questions of the previous review remain for the human reviewers.

## Previous findings

- R01 — repaired: settled by a decision of the human reviewers. Checked at this head: the 35 moved sections stand in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions at the numbers the description lists, with the four declarations of 5.4, 5.5, 5.6 and 6.5.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 values and strip (headline; cited by the Downstream consumers paragraph) | `s = 1`, `N = 1`; principal character mod 2; `s = −2` | `(γ − log 4π)/2 = (0.5772157 − 2.5310242)/2 = −0.9769 ≠ 0`; zeros of `1 − 2^{−s}` at `9.0647k·i`, `Re = 0`, outside `0 < Re s`; `Re(−2) < 0` | true; Checks true | none |
| The move allowed by the decision | merge-base headings against head headings; description's table against the new roadmap's headings | removed: 5.4–5.6, 6.1–6.32 (35 sections), 8 supplier-contract subsections used only by them, 4 declarations; all 35 found at the listed numbers (0.1–0.8, 1.1–1.6, 2.1–2.9, 3.1–3.5, 4.1–4.7); new §0.9 as the description says | as decided, nothing beyond | none |

The rows for the untouched statements stand as in the previous review, of `3b77a6a`.

- Folder diff since `3b77a6a`: 0 lines. Of the files changed outside the folder since then, this README and `Suggested.lean` cite none (0 mentions of the 14 roadmaps concerned); the suppliers it cites and the new roadmap of consequences are unchanged since `3b77a6a`.
- Merge base (`74a09b7`) against head: Layers 0–5.3 keep every heading; the only headings removed are those the decision names and the supplier contracts that served them; `## Downstream consumers` is added and names the new roadmap and its §§0.1–0.3.
- `Suggested.lean`: the seven kept theorems and the structure `PrimitiveDirichletCharacter` are present; the four moved theorems are in `TauCetiRoadmap/ConsequencesOfTheRiemannHypothesisForDirichletLFunctions/Suggested.lean` (lines 102, 113, 128, 240).
- Cross-roadmap citations: none found nowhere at this head; no open pull request drops a cited id or changes this folder.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only (lines 83, 143, 161, 171, 178, 188, 197).
- Pull request's text against this head: the title, part 3 of the description and its old → new table agree with the head (35 pairs checked against the new roadmap's headings); the family index entry describes Layers 0–5 as they stand. Nothing changes outside the folders the pull request owns.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels, RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions and AnalyticNumberTheoryPartI; each shared object has one owner, cited here, as in the previous review: the one-character remainder and the predicates (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.5), Landau's theorem (ArithmeticDirichletSeriesPartII §0.1b; PositivityOfDirichletSeriesWithKernels Layer 6), the explicit formula (ZerosOfLFunctions §8.6a), primitive induction (AnalyticNumberTheoryPartI §1.6).

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources in this round; largest share FormalProof, 31 of about 55 locators; contents compared with FormalProof: not readable (as in the previous review). No layer is added, removed or reordered since `3b77a6a`.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 put the Landau (1905) and Ingham (1932) equivalences in windowed form; the README names Pintz (1980) and Kaczorowski (1984) as nearest published results.

## Not verifiable

- FormalProof: its 31 file and declaration locators and every `*Method of the formal proof:*` label; the archive parts and the repository are not readable through the sources service (not attempted again: no passage changed).
- Landau (1905), Pintz (1980), Kaczorowski (1984), Ihara–Murty–Shimura (2009), Ihara (2006): not read in the previous round (network trouble) and not fetched again in this one.
- Ingham (1932), Davenport (2000), Montgomery–Vaughan (2007): books with no legal open copy. Knapowski–Turán (1962): publisher paywall.

## Source issues

- none

## For the human reviewers

- Decision applied: the move of Layer 6 (§§6.1–6.32) and §§5.4–5.6 to ConsequencesOfTheRiemannHypothesisForDirichletLFunctions Layers 0–4 was not raised; the head removes those sections, their supplier contracts and four declarations, and nothing else.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13). No refereed source states it, and this review did not read the formal proof.
- Licence: the README cites about 31 file and declaration locators of an external Lean formalisation (FormalProof: archives on the author's site, a GitHub repository), and `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: FormalProof, the source with the largest share of locators, could not be read, so wording and arrangement were not checked against it.
