# Review of EffectiveBoundsPartII (pull request #1516 at 31c0eb1)
**Verdict:** needs changes

## R01 (P3) — The description says the point bounds feed ArithmeticStatisticsPartV; no such edge exists

**Location:** pull request description, summary block, “Why Tau Ceti wants it”: “The point bounds, valid over every algebraically closed field, feed the finite-fibre target of ArithmeticStatisticsPartV.”

**Claim:** At this head nothing consumes the two point bounds. `TauCetiRoadmap/EffectiveBoundsPartII/README.md:731` only calls them “available to any consumer”, and ArithmeticStatisticsPartV neither cites this roadmap nor could: it is earlier in the merge order.

**Witness:** ArithmeticStatisticsPartV at its open head, §3.28 “Mixed trace finite fibres”, README line 1860: its `*Needs:*` names Mathlib and GenericDoublePointInterpolation §§1.4, 4.8 only; its route (line 1856) uses a multiplicity-weighted bound by `∏deg(f_i)`, not `d^r` distinct points. Merge order: PartV line 56, this roadmap line 112.

**Repair:** Replace the sentence with: “The point bounds hold over every algebraically closed field and are available to any later roadmap that counts isolated or nonsingular zeros without multiplicity; no roadmap consumes them yet (ArithmeticStatisticsPartV §3.28 proves its own multiplicity-weighted finite-fibre bound).”

## Previous findings

- none: the review of `31c0eb1` accepted the folder with no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §5.5 `jacobianOpen_points_finite_ncard_le` (cited by the description) | E=(X²−1,Y²−1), r=d=2, characteristic ≠2; same E in characteristic 2; E=(XY,XY) | 4 zeros, J=4XY=±4≠0: count 4=2². Characteristic 2: J=0, count 0≤4. Third: J=0, count 0≤4 | Holds; none |
| §5.5 `isolatedAffinePoints_ncard_le_pow` (cited by the description) | Same three systems | 4≤4; characteristic 2: one point (1,1), minimal prime (X−1,Y−1) over ((X−1)²,(Y−1)²), 1≤4; two axes, no isolated point, 0≤4 | Holds; none |
| Description: “every characteristic … without a proper-intersection hypothesis” against §5.5 and the SchemeAndStackFoundations contract | X(X−1),XY; X²−X over an algebraic closure of 𝔽₂ | One isolated point (1,0) beside the line X=0, 1≤4; two Jacobian-open points, 2=2¹ | Description agrees with the head |
| Description: bound `n^(Qn(log n)³)·H^(Q(log n)³)` against §5.6 and `discriminant_field_class_bound` | H=1, n>Q≥3 | No field with absolute discriminant ≤1 in degree >1, so m=0; right side n^(Qn(log n)³)·1>0 | Description agrees, read with n>Q |
| R01: PartV §3.28 finite-fibre target against the two point bounds | f=x², N=1; F=(x,xy) | PartV bound: ≤2=deg f points per fibre, by multiplicities; fibre over (0,0) a line. This roadmap: d^r=2 distinct isolated points, no multiplicity | Different statements, no citation: R01 |

The rows of the previous review for the untouched statements stand as in the previous review, of `31c0eb1`.

- Incremental re-review of 0 changed lines since `31c0eb1`: the folder is unchanged, no file changed outside it, HEAD verified as `31c0eb1189ff3d2cb751936c45cf488b4edc4d6e`.
- Pull-request text: the title and 14 prose sentences of the description read against the head; 13 agree (adds a new roadmap, three files, 13 declarations of which 5 definitions with real bodies and 8 theorems, single `import Mathlib`, the suppliers named in the README), 1 is R01.
- Gate at this head: every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`).
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/EffectiveBoundsPartII/Suggested.lean`: eight `sorry` warnings (lines 31, 42, 115, 135, 152, 163, 175, 190), nothing else.
- Cross-roadmap citations resolved this round: 1 (ArithmeticStatisticsPartV §3.28 at its open head, README lines 1814, 1850–1860); overlap tool: no other pull request changes this roadmap, no dropped id, no second copy.
- Remark on untouched text: `TauCetiRoadmap/EffectiveBoundsPartII/README.md:731` offers the point bounds to ArithmeticStatisticsPartV §3.28 as a possible consumer only (“available to … such as”), which is weaker than the description's “feed”.
- Remark on untouched text: the design's `gap:isolated-affine-bezout` (multiplicity-weighted) is not stated in the README, which derives distinct-point bounds from SchemeAndStackFoundations §5.12 as it is on main and does not use the gap.

Overlap check: read GenericDoublePointInterpolation, ArithmeticStatisticsPartV, SuccessiveMinima (scope as cited here; the full audit is the previous review's); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); largest share COU20, the only source cited; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Ownership against open pull requests was checked through the `roadmaps` tools at their heads only; ArithmeticStatisticsPartV has no checkout among the listed sibling directories.

## Source issues

- none

## For the human reviewers

- none
