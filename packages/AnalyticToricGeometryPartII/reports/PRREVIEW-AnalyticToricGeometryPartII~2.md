# Review of AnalyticToricGeometryPartII (pull request #1647 at 13894ce)

**Verdict:** needs changes

Incremental re-review of the 48 lines changed since `4c15f2e`, and the first check of the pull request's title and description against the head.

## R01 (P3) — The description says the Lean file states definitions and theorems; it states none

**Location:** pull request description, prose paragraphs 2 and 4: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti” and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** Both sentences describe a `Suggested.lean` with declarations. At this head the file has none, so no headline theorem is tested and no `sorry` occurs; a reader of the description cannot tell.

**Witness:** `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean:46-48`: the namespace opens and closes with nothing between; lines 9–10 say none of the headline theorems is statable at the pins. Elaboration exits 0 with no warning.

**Repair:** Replace the two sentences by: “`Suggested.lean` declares nothing: none of the eight groups of headline theorems is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each with the construction it lacks; every target is in the README.” and “Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`); …”, the rest of that sentence unchanged.

## Previous findings

- R01 — repaired: “§0.1 and §§0.4–0.5 supply the face projections … §0.9 supplies face open immersions … §0.17 supplies the properness criterion”; no `C0.` remains in the README, and line 286 now cites §0.17.
- R02 — repaired: “WeilConjectures §6.3 owns the integral Chow ring of every regular complete split fan over every field … no second smooth Chow ring is constructed” (README lines 11 and 109); the fixture is cited as §6.4.

Neither repair introduced a new problem: the 24 changed lines alter locators and the two ownership sentences only; no statement, hypothesis, Check, heading or Lean line changed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Lines 11, 109: §6.1 weights versus WeilConjectures §6.3 ring, on the smooth overlap | ℙ¹, rays ±1 | §6.3: ℤ[x₊,x₋]/(x₊x₋,x₊−x₋)=ℤ[h]/(h²), ranks (1,1). §6.1: codim 0 gives ℤ; codim 1 balance c₊−c₋=0, rank 1. | agree | none |
| Lines 11, 109: “including singular fans” is a real addition | ℙ(1,1,2), rays (1,0),(0,1),(−1,−2) | Balance c₁−c₃=0, c₂−2c₃=0: kernel ℤ·(1,2,1). Cl=ℤg with D₂=2g Cartier; D₂·D₁=1, D₂·D₂=2, D₂·D₃=1. §6.3 does not apply (cone (v₃,v₁) has determinant 2). | agree; outside §6.3 | none |
| Line 286: properness from ShimuraCompactifications §0.17 | ℙ¹ fan; positive ray alone, target the zero fan in rank 0 | ℙ¹: preimage of {0} is ℝ = union of the two cones, proper. Ray: preimage ℝ ≠ ℝ≥0, not proper (𝔸¹). | agree with §1.2's Checks | none |
| Line 55: smoothness from §0.10 with §0.9, §0.16 | positive ray (r=n=1); zero cone (r=0,n=1) | R[x] and R[y^(±1)], both smooth over every R including K°. | agree | none |

The rows for the untouched statements stand as in the previous review, of `4c15f2e`.

- Cross-roadmap citations resolved at the open heads: ShimuraCompactifications §§0.1, 0.4–0.7, 0.9, 0.10, 0.16, 0.17, 0.18 (its README lines 408, 466, 482, 503, 518, 570, 589, 746, 773, 796) and WeilConjectures §§6.3, 6.4 (lines 1419, 1473); every changed locator names an existing heading with the cited content.
- WeilConjectures §6.3 read against the new ownership sentence: regular complete finite fan, any field, integral ring, product and field-extension compatibility in its API; the sentence claims no more.
- `gap:toric-field-fibres`: same slug and `needs`; only its locator changed, to §0.16.
- Gate at `13894ce`, rerun: every counter 0, OK. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean`: exit 0, no warning; zero declarations, so the signature sweep and the one-tactic probe have no candidate. No file changed outside the folder.
- Title and description read against the head: the summary block, the three prose claims on generality (completeness for §1.2, complete regular for §5.3, projectivity only in §§6.3–6.4) and the consumers named agree with the README; R01 is the only disagreement. The change since `4c15f2e` alters nothing the description states.
- Overlap check: read DeligneWeightsAndPurityPartII, WeilConjectures, PerfectoidShimuraVarieties, ClassicalAdicEtaleCohomology, FarguesFontaineDiamonds, AnalyticToricGeometry, PerfectoidTowers, PerfectoidSpaces (scope as in the previous review; WeilConjectures §§6.3–6.4 reread); smooth complete Chow ring: WeilConjectures §6.3; nonprojective threefold: WeilConjectures §6.4; nothing else shared. No open pull request changes this roadmap or drops an id it cites.
- Source independence: 2 passages compared with 1 source (changed passages only: README lines 11 and 109 against FS94 lines 19–62 and 187–199), none shared beyond standard names; largest share SCH12, 145 of 184 locators; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- The description's sentence on the number of earlier review and red-team rounds: not a statement about the head; not checked.

## Source issues

- none

## For the human reviewers

- none
