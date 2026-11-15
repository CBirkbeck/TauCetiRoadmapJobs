# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at a73dc0c)

**Verdict:** needs changes

:robot: Incremental AI re-review of 0 changed lines since a73dc0c; this round reads the pull request's title and description against the head. The folder's files need no change: both findings are P3 and are repaired by editing the description only.

## R01 (P3) — The description says the Lean states definitions and sorried theorems; it states none

**Location** Pull request description, the folder paragraph and the Validation paragraph: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim** Both sentences describe the first head. At this head `Suggested.lean` declares nothing, so a reader is told of Lean acceptance tests that do not exist.

**Witness** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:60–62`: an empty namespace; 0 declarations, 0 `sorry`; elaboration exits 0 with 0 warnings. Commit 4623561 had 16 declarations; d603998 removed them all.

**Repair** Replace the first sentence by “`Suggested.lean` states no declaration: none of the headline theorems is statable against the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers for each (README §§2.2–2.7, 3.1–3.9, 3.11, 4.1–4.3, 5.1a–5.3, 6.1–6.5, 7.1–7.2, 7.4); every target is in the README.” Replace the second by “the targeted Lake build succeeds with no warning”, and drop “Check labels missing from the Lean: 0”.

## R02 (P3) — Summary block: “the split archimedean case stays conjectural” is wider than the head

**Location** Pull request description, block `roadmap-summary`, last sentence: “The fixed-pair higher-codimension global statement remains a named proposition; the split archimedean case stays conjectural.”

**Claim** The adjacent split archimedean case is a theorem of the roadmap; only r > 0 at archimedean places is conjectural.

**Witness** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:913`: “m=1 if F is nonarchimedean, or if r=0 and F is archimedean”; line 883: “for archimedean r>0 it has no exported proof”.

**Repair** “The fixed-pair higher-codimension global statement remains a named proposition, proved in the literature, whose formal proof belongs to Part II; the split archimedean prediction in higher codimension (r > 0) stays conjectural.” The description's own second paragraph already says this correctly.

## Previous findings

- none: the review of a73dc0c listed no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Suggested.lean` at the head (cited by the description; R01) | Declaration count at each commit touching the file; direct elaboration | 4623561: 16 declarations, 1 `sorry`; d603998, db8ad41, a73dc0c: 0 and 0. Elaboration at a73dc0c: exit 0, 0 diagnostics | Description matches 4623561 only | R01 |
| §§3.10–3.11 split range (cited by the summary block; R02) | F=ℝ, r=0; F=ℝ, r=1; F=ℚ₂, r=1 | r=0 archimedean: theorem (§3.11); r=1 archimedean: proposition only (§3.10); nonarchimedean r=1: theorem (§3.11) | “the split archimedean case” includes a proved case | R02 |
| §7.4 `GGP.8` coefficient (cited by the summary block: “the period constant tracks the constituent count”) | Constituent counts (r_n, r_(n+1)) = (1,1), (2,1) | 2^(−(1+1)) = 1/4; 2^(−(2+1)) = 1/8; a fixed 1/4 would be wrong by a factor 2 at (2,1) | Description agrees with README line 1516 | none |
| §4.4 status (description: “proved under the stated hypotheses (its formal proof belongs to Part II)”) | README lines 3, 201, 1017, 1021 and the Lean docstring | All five say: named proposition, proved in the literature (bpc-bessel Theorems 1.3.3.1, 1.3.6.1), formal proof in Part II | Description agrees | none |

Rows for the statements of the folder stand as in the previous review, of `a73dc0c`.

- Description against the head: every sentence of the summary block and the prose read; 2 wrong (R01, R02). Confirmed at the head: characteristic ≠ 2 and quadratic étale E (Conventions, line 23); no quasi-split, CM, unramified, odd-residue or auxiliary-supercuspidal restriction (line 11, line 1470); `SignedHermitianSpace` and the split carrier (line 9); the three consumers and their sections (lines 1552–1554); Part II's scope (line 19); three files in the folder; the title (“roadmap”) fits a pull request that adds the folder (not on main; 1660 insertions, 0 deletions).
- Folder: 0 lines changed since a73dc0c; no file changed outside it (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Gate at a73dc0c: every counter 0, `build=0`, OK (worker's run); my run of the text and dependency checks gives the same line. Elaboration: exit 0, no warning.
- Dependency check: `depcheck: 242 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Cross-roadmap citations: the resolver lists 0 unresolved; overlap data lists no other open pull request changing this roadmap, no dropped id, no id defined only by an open revision. 3 citations of this roadmap by others resolved at their heads (TwistedAutomorphicDescents lines 12, 76; AutomorphicSpectralTheoryPartII line 1668): each names this roadmap as owner of the sections cited.
- Overlap check: read TwistedAutomorphicDescents, AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactorsPartII at their open heads, for what they say of this roadmap's objects; nothing shared (the first two cite unitary Bessel data and §§6.2a–6.4 as owned here; the third does not name this roadmap). The scopes of the other listed roadmaps were compared in the earlier full reviews and the folder has not changed since.
- Sources: no passage changed, so no locator of the seeded sample (§§1.3, 2.3, 2.5, 3.1, 3.2, 3.5, 3.6, 3.7, 3.10, 4.3, 4.4, 5.1a, 6.1, 6.2, 6.5) was re-read; the README flags none as unverified. The 34 declared gaps are untouched; an acceptance would be conditional on them.
- Source independence: changed passages only: 0 passages compared with 0 sources (the folder did not change); largest share ggp, 54 of 236 line locators (bpcz 50); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- xue-bessel is waived and cited by its recorded locator only.
- The description's “6 independent review rounds and 2 red-team rounds” is a statement about the job board, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** xue-bessel (Xue, Bessel models for unitary groups and Schwartz homology, 2025) is cited by locator with its text waived; wording was never compared with it in any round.
- **Not tested.** `Suggested.lean` states no declaration (lines 60–62): every headline is named as not statable at the pins, so the build tests no mathematics of this roadmap.
