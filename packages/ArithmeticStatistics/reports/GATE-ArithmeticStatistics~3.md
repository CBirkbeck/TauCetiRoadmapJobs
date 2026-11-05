# GATE-ArithmeticStatistics~3: answers to the review of `17ac1bb`

The review (rwst, 2026-10-28) makes eight distinct points: H01–H03 come from the status table (R01, R02, R05) and H04–H08 from S01–S03. The repairs are in commit `af2c1d12`, which touches only `TauCetiRoadmap/ArithmeticStatistics/README.md`.

## H01 (rwst) — applied differently
The README side is repaired. The PR body's dependency paragraph and merge-order block are outside the two files this repair may edit; the worker regenerates them on submission. The board merge order already puts this roadmap in the right place: `ArithmeticStatistics` is line 133 of `merge-order/ORDER.txt`, directly after PartI–PartVIII (lines 100, 103–106 and 130–132). The real defect on the page was that the dependency gate read only one of the eight parts as a supplier (see H06). The new `README.md:22` makes all eight visible, so the generated merge chain now contains every part and, through the parts, their own chains.

## H02 (rwst) — answered
Agreed: the duplicate Pell families are in the parts, not on this page. At the open heads, PartI's README has the negative-Pell radicand block near line 1920 and PartV has §3.31 at line 2131. This page no longer names either, and those folders can only be repaired in their own pull requests.

## H03 (rwst) — answered
The §§3.2–3.9 numbering collision between PartIV and PartV is in those two roadmaps. This page cites no section number of either (`README.md` has no `§`), so nothing here depends on it.

## H04 (rwst) — answered
This is correct about the PR body text, which is outside this job's edit scope. At `af2c1d12` the README names no other roadmap: every CamelCase roadmap name in it is one of ArithmeticStatisticsPartI–PartVIII. The regenerated body therefore lists only those eight parts and their chains.

## H05 (rwst) — answered
The merge chain in the body is the transitive closure of the README's supplier edges. At `17ac1bb` only the edge to PartI was read, so the chain could not contain the other parts' needs, and the 36 missing entries follow from that. With all eight edges present (H06), the closure includes PartVIII's chain, which covers the other parts. An entry such as the EnhancedDerivedSheaves amendment stays in the chain only if some part's supplier edges reach it.

## H06 (rwst) — applied differently
The claim is confirmed. At `17ac1bb`, the dependency check against a test order that puts this roadmap first reported one UPWARD edge, `ArithmeticStatistics -> ArithmeticStatisticsPartI at README lines [26]`. That edge came from the `### From TauCetiRoadmap.ArithmeticStatisticsPartI–PartVIII` heading: the markdown links on line 28 were not read, and "PartVIII" alone is not a roadmap name. The repair puts the dependency where the check reads it, rather than adding a caveat to the validation line. The new `README.md:22` begins "The prerequisites are the eight parts …". Against the same test order it gives eight UPWARD edges, PartI through PartVIII, all at line 22; the edge count rises from 1156 to 1163.

## H07 (rwst) — applied differently
`README.md:26–28` (the `###` subheading plus the "… so all eight parts precede this page" inference) → `README.md:22`: "The prerequisites are the eight parts [PartI]…[PartVIII]; this page uses no object from them." The subheading is dropped as asked. The proposed wording "This page needs [PartI]–[PartVIII]" was not used, for two reasons: tested in a scratch README, it produced zero supplier edges (0 problems against the test order), and a range link names only the two ends.

## H08 (rwst) — applied
The *Conventions* (old `:20–22`), *Downstream consumers* (old `:34–36`) and *References* (old `:38–40`) sections are deleted. `README.md:7` already says each part's README states its own conventions, supplier contracts and references. The page now has the summary, the parts table, the one-sentence supplier contract and *How to read the build*.

## Adversarial pass and checks

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Dependency claim, old `README.md:26–28` | merge order with this roadmap first | 1 UPWARD edge (PartI, line 26); 7 parts missing | defect (H06) | replaced |
| Dependency claim, the reviewer's wording | same order, scratch README | 0 edges, 0 problems | would hide every dependency | not used |
| Dependency claim, new `README.md:22` | same order; real `ORDER.txt` with `--movable` | 8 UPWARD (PartI–PartVIII, line 22); real order: 0 problems | correct | kept |
| `Suggested.lean` | — | declares nothing; there is no `#check` list to compare | unchanged | none |

The page states no mathematics of its own, so there are no degenerate cases to test. Ownership: the page owns no object; every target belongs to one of the eight parts. No other open roadmap pull request was relevant to this point.

## Build and gate

- `lake build TauCetiRoadmap.ArithmeticStatistics.Suggested`: `Build completed successfully (8976 jobs).`
- Gate at `af2c1d12`: `gate ArithmeticStatistics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`, board order): `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
