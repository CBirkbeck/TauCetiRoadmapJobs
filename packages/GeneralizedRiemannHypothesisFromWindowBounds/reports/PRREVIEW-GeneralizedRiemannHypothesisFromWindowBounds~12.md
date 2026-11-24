# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at 7c341e7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** This is an incremental re-review of the 13 lines changed since `c832fa9`. The three small corrections of the previous review are all repaired:
- 4.2's method label no longer reads as saying that a cyclic family has no real odd member.
- Layer 3's Dependencies and the ZerosOfLFunctions contract now name the sections from which 3.4 and 0.6 are deduced.
- The description now states the move of §§5.4–5.6 and Layer 6, with the former numbers.

The one finding is carried over and still blocks. The revision still removes Layer 6 and §§5.4–5.6 of the README on `main` instead of keeping them under their ids. There are no new small corrections and no format notes. Three points are left for the human reviewers. The first is whether the family owner's decision, which the description now reports, waives R01.

## R01 (P1) — The revision still removes Layer 6 and §§5.4–5.6 of the README on `main` instead of keeping them under their ids

This roadmap's record (the structure page and any `STATUS.md` generated from it) is keyed by the layer and section ids of the README on `main`. After the merge, "Layer 6" and items 5.4–5.6 no longer exist here. Their 35 sections are restated in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under other numbers. At the merge base the README has 5.4 (line 891), 5.5 (line 908), 5.6 (line 935) and Layer 6, which has 32 sections (§§6.1–6.32) and runs from line 1024 to line 2365. At this head, Layer 5 ends with "### 5.3 Values and the critical strip" (line 1085) and is followed by `## Downstream consumers` (line 1134). `Suggested.lean` still lacks four declarations:
- `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`
- `meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`
- `meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois`
- `psiAP_isBigO`

The change since the previous review leaves the README and `Suggested.lean` as they were on this point. Only the description changed: it now gives the old → new numbering and says that the family's owner decided the move. A numbering table does not replace the ids. Whether that decision waives the rule is a question for the human reviewers (below); this review cannot waive it. No roadmap on `main`, and none at an open head, cites the removed ids, so no citation breaks. The loss is to this roadmap's record.

The smallest repair has not changed. Restore §§5.4–5.6 and Layer 6 here under their ids and with their statements, together with the conventions, supplier contracts and four declarations they use. ConsequencesOfTheRiemannHypothesisForDirichletLFunctions would then cite them by these ids. If the human reviewers accept the owner's decision, this finding lapses.

## Previous findings

- R01 — not repaired: Layer 5 still ends with "### 5.3 Values and the critical strip" (line 1085), followed by `## Downstream consumers` (line 1134). There are no §§5.4–5.6 and no Layer 6, and the four declarations are still absent from `Suggested.lean`.
- C01 — repaired: line 969 now reads "member; applied to a cyclic family, no member is distinguished)".
- C02 — repaired: description part 2 now reads "Section numbers are unchanged … the one exception is the move of part 3". Part 3 names §§5.4–5.6 and Layer 6 and lists each former number with its new one (5.4 → 0.1, …, 6.32 → 1.6).
- C03 — repaired: Layer 3 Dependencies (line 920) add "AnalyticNumberTheoryPartI §1.6, for the deduction of 3.4". The ZerosOfLFunctions §8.6a item (lines 1251–1252) adds "and for the deduction of 0.6".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2 method label (changed), line 966–972 | `ψ = χ₋₄` | `𝒦(χ₋₄) = {1, χ₋₄}`, `o = 2`, weights `1`, `1/7`; `χ₋₄(−1) = −1`, real odd member exists | new wording says no member is *distinguished*, true | none |
| 4.2 label, set hypotheses | `ψ` cubic mod `7` | `𝒦 = {1, ψ, ψ²}`, `ψ⁻¹ = ψ²`, contains `1`; weights `1, 1/10, 1/10` | matches "contains `1`, closed under inversion" (0.2, line 212) | none |
| 3.4 deduced from AnalyticNumberTheoryPartI §1.6 (Dependencies changed) | `χ` mod `12` induced by `χ₋₄` | extra factor `1 + 3^{−s}`, zeros `iπ(2k+1)/log 3`, step `2.8596i`, `Re = 0` | outside `Re s > 0`; primitive induction applies | none |
| 3.4, Euler factor bound | principal `χ` mod `2`, `σ = 1/2` | zeros `9.0647k·i`; `|1 − 2^{−s}| ≥ 1 − 0.70711 = 0.29289` | nonvanishing on `Re s > 0` | none |
| Layer 3 Dependencies vs 3.4 and contract | lines 853, 920, 1344–1347 | all name §1.6; §1.6 at this head line 982, at its other open head line 966, on `main` line 959 | consistent, resolves | none |
| 0.6 deduced from ZerosOfLFunctions §8.6a (contract changed) | `K = ℚ`, trivial character, `x = 2` | `EK+1 = 1.5772157`, `F₁(2) = 1.9095425`; zero sum needed `−0.0707028`; `G(2) = 1.8388397 + Σ = 1.7681370 = 2(1+γ−log 2)` | normalisation consistent | none |
| 0.6, zero sum | `Σ_ρ 1/|ρ|²` | `2 + γ − log 4π = 0.0461914`; with `Σ 2^ρ/(ρ(1−ρ)) ≈ −0.02215` (30 zeros) total `−0.06834`, gap `0.00236` within tail | consistent | none |
| R01 removed items | merge-base lines 891, 908, 935, 1024–2365 vs head lines 1085, 1134 | 3 + 32 sections and 4 declarations absent at head | record broken | R01 |

The rows for the statements the change leaves untouched stand as in the previous review, of `c832fa9`.

- Change since `c832fa9`: 13 lines of the README (Layer 3 Dependencies, 4.2 method label, ZerosOfLFunctions contract); `Suggested.lean` unchanged.
- Supplier sections resolved: AnalyticNumberTheoryPartI §1.6 (this head line 982; its other open revision line 966; `main` line 959); ZerosOfLFunctions §§6.5, 7.5, 7.6, 8.6a (this head lines 1628, 1797, 1851, 2286).
- Outside the folder: the diff against the merge base, with this pull request's own folders and the two family indexes excluded, is empty.
- Automatic checks: all passed except the check for changes outside the folder, set aside below. Dependency check: `depcheck: 131 roadmaps, 1463 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only (lines 83, 143, 161, 171, 178, 188, 197). The file is unchanged, so the previous `#check @name` comparison stands.
- Seeded sample: of its targets, 3.4 and 4.2 fall in the changed passages; their locators (Davenport chapter 5, FormalProof) are not readable (below).
- Overlap check: read ZerosOfLFunctions and AnalyticNumberTheoryPartI (open revisions) and RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels and RieszSumsOverPrimesAndExceptionalZeros (on `main`), where the change bears on them. The change moves no ownership: primitive induction is owned by AnalyticNumberTheoryPartI §1.6, and the explicit formula by ZerosOfLFunctions §8.6a. No open pull request drops a cited id.
- The family's owner decision, reported in the description, could not be verified; the merge-base folder on `main` has `README.md` and `Suggested.lean` only (no `STATUS.md`), as the description says.

Source independence: changed passages only. Three passages were compared: the Layer 3 Dependencies line, the 4.2 method label and the ZerosOfLFunctions contract item. Each is this roadmap's own bookkeeping or a description of FormalProof, which is not readable; none paraphrases a source. The largest share of locators is FormalProof's, 31 of about 55, as before. No layer was added, removed or reordered since `c832fa9`, so the contents were not compared again.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 restate the Landau–Ingham equivalences (Landau 1905; Ingham 1932) in windowed form, whose nearest published relatives are Pintz (1980) and Kaczorowski (1984), read in an earlier review.

## Not verifiable

- FormalProof: its file and declaration locators and every `*Method of the formal proof:*` label, including the changed label of 4.2. The archive parts and the repository could not be read through the sources service (as before).
- Davenport (2000), chapter 5 (Origin of 3.4); Ingham (1932); Montgomery–Vaughan (2007): books with no legal open copy. Knapowski–Turán (1962): publisher paywall (as before).
- Ihara–Murty–Shimura (2009), Ihara (2006), Landau (1905): no open copy read (as before).
- The family owner's decision reported in description part 3: a statement in the pull request's text, not checkable from the repository.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the folder under review was run on this folder alone. It lists 119 files, every one in another roadmap folder that this pull request adds or revises and that has its own review. The same diff with those folders excluded is empty.

## Source issues

- none

## For the human reviewers

- Record rule (R01): description part 3 now says the family's owner decided to move Layer 6 and §§5.4–5.6 to ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under new numbers, and gives the old → new table. You decide whether this waives the rule; if so, R01 lapses.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13, 45–49). No refereed source states it, and this review did not read the formal proof.
- Licence: the README cites about 31 file and declaration locators of an external Lean formalisation (FormalProof: archives on the author's site, a GitHub repository). `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: FormalProof, the source with the largest share of locators, could not be read, so wording and arrangement were not checked against it.
