# Review of ArithmeticStatistics (pull request #1531 at af2c1d1)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since `af2c1d1`; this round reads the pull request's title and description against that head. 3 findings, all P3, all in the description; the folder's files need no change.

## R01 (P3) — Description promises shared contracts and numerical checks that the head no longer has

**Location:** pull request description, first prose paragraph after the summary block: "The shared supplier contracts and numerical convention checks keep these applications tied to the same objects, measures, weights and height orderings."
**Claim:** The roadmap at this head carries shared supplier contracts and numerical convention checks.
**Witness:** `TauCetiRoadmap/ArithmeticStatistics/README.md:22` ends "this page uses no object from them"; the README has 4 headings, 0 `**Checks.**`, no `## Conventions`. Each part states its own (README:7).
**Repair:** Replace the sentence with: "The page is an index: it states no contracts, conventions or checks of its own; each part's README states its targets, conventions, supplier contracts and references."

## R02 (P3) — Description says the Lean states definitions and theorems and that the README holds every target

**Location:** pull request description, third paragraph: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README."
**Claim:** `Suggested.lean` states definitions and theorems, and this README lists the targets.
**Witness:** `TauCetiRoadmap/ArithmeticStatistics/Suggested.lean:9`: "the series page itself has none, so this file declares nothing" (0 declarations, lines 12–13 an empty namespace). README:7 places targets in each part's README.
**Repair:** Replace with: "`Suggested.lean` declares nothing: the series page has no headline theorem of its own. The targets and headline theorems are in the README and `Suggested.lean` of each of ArithmeticStatisticsPartI–PartVIII."

## R03 (P3) — Validation line reports a `sorry` warning the build does not emit

**Location:** pull request description, Validation paragraph: "the targeted Lake build succeeds with `sorry` as the only warning".
**Claim:** The module builds with a `sorry` warning.
**Witness:** `lake env lean` on `TauCetiRoadmap/ArithmeticStatistics/Suggested.lean` at `af2c1d1`: exit 0, 0 diagnostics; the file has 0 `sorry` tokens.
**Repair:** Replace the clause with: "the targeted Lake build succeeds with no warning (the file declares nothing, so it contains no `sorry`)".

## Previous findings

- none: the previous report, of `af2c1d1`, had no findings.

## Verified sound

| Statement | Instance examined | Expected | Observed | Result; change |
| --- | --- | --- | --- | --- |
| README:22, the prerequisites are the eight parts and no object is used (cited by R01) | Each part's README at its open head, title line 2; merge-order positions | 8 parts resolve; all before the index | 8 of 8 titles match README:11–18; positions 111, 114, 115, 116, 56, 146, 147, 148 < 149 | Matches; none |
| Suggested.lean:9, the file declares nothing (R02, R03) | Whole module, elaborated | 0 declarations, 0 `sorry`, 0 warnings | 0 declarations, 0 `sorry`, exit 0 with 0 diagnostics | Matches the file; contradicts the description (R02, R03) |
| Description summary block, "built as a separate toolkit in Part IV before Part V uses it" | README:26; Part V README:8 and :79 at its open head | Part V consumes Part IV | README:26 says so; Part V line 79 requires Part IV targets | Matches; none |
| Description summary block, "introduces no objects"; "No later roadmap is yet listed as a consumer" | README headings; Suggested.lean | 0 objects; 0 consumer section | 4 headings, none `## Downstream consumers`; 0 declarations | Matches; none |
| Title "ArithmeticStatistics: roadmap" | `origin/main` | folder absent on main; added | absent; 3 files, 40 insertions, 0 deletions | Matches; none |

The rows for untouched statements stand as in the previous review, of `af2c1d1`.

- Source locators checked against the text: 0 (the folder has 0 targets, 0 locators; the seeded sample of 15 found none; `as-ref-056` and `as-ref-022` are not cited here).
- Library declarations opened: 0 (the folder consumes none).
- Cross-roadmap citations resolved: 8 of 8, each part read at its open head with `roadmaps show` (title and scope paragraph).
- Gate rerun at `af2c1d1`: every check 0, `OK`; outside-folder diff empty; worktree clean; folder holds README, `Suggested.lean`, `metadata.toml` only.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: exit 0, 0 diagnostics; 0 declarations, so no `#check @name` comparison and no one-tactic probe apply.
- Remark: the merge order now lists ArithmeticStatisticsPartV (position 56) before Parts I–IV (111–116), which Part V's README cites; that edge belongs to Part V's review, not to this folder.
- Overlap check: read ArithmeticStatisticsPartV, ArithmeticStatisticsPartVI, ArithmeticStatisticsPartVII, ArithmeticStatisticsPartVIII, RankZeroOneBSDPartII (no roadmap on main and none by results is listed); nothing shared: the index owns no object, and RankZeroOneBSDPartII cites Part VI as owner.

Source independence: changed passages only: 0 passages changed, 0 compared with 0 sources, none shared; the README has 0 source locators, so no source has a largest share; arrangement not compared again (the diff adds, removes or reorders no layer).

## Not verifiable

- The description's "AI assistance" sentence (the tools and the number of rounds): no record of it is in the folder or the review inputs.
- The generated `depends-on` and `merge-order` blocks are outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
