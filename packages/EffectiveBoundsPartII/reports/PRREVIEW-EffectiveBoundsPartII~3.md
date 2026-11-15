# Review of EffectiveBoundsPartII (pull request #1516 at 0ef98e6)
**Verdict:** accepted

No finding.

## Previous findings

- R01 — repaired: the description now reads “The point bounds are valid over any algebraically closed field, for later roadmaps counting isolated or nonsingular zeros without multiplicity”; `TauCetiRoadmap/EffectiveBoundsPartII/README.md:731` no longer names ArithmeticStatisticsPartV §3.28. No new problem introduced.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §5.5 `isolatedAffinePoints_ncard_le_pow` (cited by the changed sentence at README line 731) | r=0; r=1, d=0, E=(c) with c≠0 and c=0; r=1, d=3, E=X²(X−1) | r=0: ideal ⊥ in a field, one point, 1≤d⁰=1. c≠0: unit ideal, no minimal prime, 0≤0. c=0: only minimal prime ⊥, no point ideal, 0≤0. Cubic: points {0,1}, 2≤3 | Holds; none |
| §5.5 `jacobianOpen_points_finite_ncard_le` (cited by the changed sentence) | Same instances | r=0: empty determinant 1≠0, one point, 1≤1. c≠0: no zero, 0≤0. c=0: derivative 0, 0≤0. Cubic: J=3X²−2X, J(0)=0, J(1)=1, count 1≤3 | Holds; none |
| Changed sentence: “without multiplicity; a multiplicity-weighted … bound is a separate, stronger statement” | E=X²(X−1), r=1, d=3 | Distinct isolated points 2; multiplicity-weighted count 2+1=3=d¹; Jacobian-open points 1. Weighted bound 3≤3 implies 2≤3, not conversely | Sentence agrees with §5.5; none |
| Description, “Why Tau Ceti wants it”, against README line 731 and the merge order | Consumers of the two point bounds at the open heads and on main | `roadmaps grep` for both names and for this roadmap's name: hits in this folder only (README lines 678, 682, 731; Lean lines 152, 163); no roadmap is named as consumer | Description agrees with the head |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `31c0eb1`.

- Incremental re-review of 2 changed lines since `31c0eb1`: one sentence of “Downstream consumers” (README line 731); `Suggested.lean` and `metadata.toml` unchanged; the diff against the base outside the folder is empty.
- Pull-request text: the title and the 14 prose sentences of the description (summary block included) read against the head: all agree (adds a new roadmap of three files, 13 declarations, suppliers as the README names them, point bounds offered to later roadmaps with no named consumer).
- Gate at this head: every check passed (`depcheck=0`, `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`; the worker's run also `build=0`).
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/EffectiveBoundsPartII/Suggested.lean`: eight `sorry` warnings (lines 31, 42, 115, 135, 152, 163, 175, 190), nothing else.
- Cross-roadmap citations in the changed passage: 0 (the one citation it carried, ArithmeticStatisticsPartV §3.28, is removed; no remaining mention of that roadmap in the folder). Overlap tool: no other pull request changes this roadmap, no dropped id, no second copy.
- Seeded sample: none of its targets falls in the changed passage; the changed sentence carries no source locator.
- Remark on untouched text: the design's `gap:isolated-affine-bezout` (multiplicity-weighted) is not stated in the README, which derives its distinct-point bounds from SchemeAndStackFoundations §5.12 as on main and does not use the gap.

Overlap check: read GenericDoublePointInterpolation, NumberFieldEnumeration, SuccessiveMinima (scope sections); nothing shared (Bézout stays with SchemeAndStackFoundations §5.12, Hunter-type enumeration with NumberFieldEnumeration, successive minima and Gram determinants with SuccessiveMinima).

Source independence: changed passages only; 1 passage compared with 1 source (the changed sentence against COU20 line 429), none shared beyond a two-word standard term; largest share COU20, the only source cited; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's account of its own history (“1 independent review round and 2 red-team rounds”) was not checked against the board.
- Ownership against open pull requests was checked through the `roadmaps` tools at their heads, not in sibling checkouts.

## Source issues

- none

## For the human reviewers

- none
