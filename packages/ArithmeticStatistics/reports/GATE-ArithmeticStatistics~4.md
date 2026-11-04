# GATE-ArithmeticStatistics~4: answers to human review at `af2c1d1`

The one comment (rwst, 2026-10-28T15:09:09Z) confirms S02 and S03 fixed and that the README is final; it raises no point about `TauCetiRoadmap/ArithmeticStatistics/README.md` or `Suggested.lean`. Each remaining point concerns the pull-request body or the merge settings, which this job cannot edit, so all are answered rather than applied. No file was changed and nothing was committed.

## H01 (rwst) — answered
Correct as a statement about the body: its dependency paragraph should name only ArithmeticStatisticsPartI–PartVIII, matching `README.md:22`, which cites no other roadmap (the 32 other names are stale). The README already says this, and no README edit can change the body. The correction falls to whoever writes the PR text, at the next submission.

## H02 (rwst) — answered
Correct for the body's `merge-order` block. The board merge order has the right chain: ArithmeticStatisticsPartI–V on lines 100–106, PartVI–VIII on lines 130–132, and ArithmeticStatistics on line 133, directly after PartVIII. So the body should be regenerated from that chain, ending "… → ArithmeticStatisticsPartVIII → this pull request". #1630 is not cited by this README and should be dropped unless a part needs it. The remark that "none of the parts comes before this PR" in the real order does not hold for the board order: all eight come before it.

## H03 (rwst) — answered
Agreed that the gate is no evidence about the body: its dependency check compares the suppliers the README names against the board merge order, not against the body text. On that comparison it is real evidence. With the order above it reports `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)` and no UPWARD line, because PartI–PartVIII all precede ArithmeticStatistics. The stale body is a separate defect from the order, as H01 and H02 describe.

## H04 (rwst) — answered
Agreed on the risk: none of ArithmeticStatisticsPartI–PartVIII is on `origin/main` (`git ls-tree origin/main TauCetiRoadmap/` lists no ArithmeticStatistics folder), so if this page merged first its eight links would dangle. Auto-merge and the merge itself are outside this job and the README. Disarming auto-merge until the eight parts have merged, or until the body is corrected, is the human's decision.

## Build and gate

- `lake build TauCetiRoadmap.ArithmeticStatistics.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate ArithmeticStatistics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`--movable`): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

Notes: `Suggested.lean` declares nothing, so there were no signatures to check with `#check` and no statement needed an adversarial-pass row; no edits were made. No new citation or ownership claim was introduced, so ownership against open pull requests needed no recheck. The review contains no suspicious instructions.
