# Review of AnalyticToricGeometryPartII (pull request #1647 at de81660)

**Verdict:** accepted

Incremental re-review: the folder has 0 changed lines since `13894ce` (the head only merges main), so this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now says “`Suggested.lean` declares nothing … none of them is statable at the pinned Mathlib and Tau Ceti” and “The file has no declaration and therefore no `sorry`; the build's only warning is the toolchain's suggestion to add `module`”.

The repair introduced no new problem: both sentences agree with the head (see the counts below).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: “hypersurface approximation [needs] a complete regular fan, and only complete intersections assume projectivity” | README §5.3 (line 641), §6.4 (line 727); SCH12 lines 2458, 2496 | §5.3: Σ complete and regular, no projectivity; §6.4: Σ smooth projective. Source: 8.7 proper smooth, 8.8 projective and smooth. | agree | none |
| Description: “analytification needs only completeness” | README §1.2 (line 284); ℙ¹ fan versus the positive ray alone | ℙ¹: the two cones cover ℝ, unit fibre is all of (ℙ¹)ᵃⁿ. Ray: support ℝ≥0 ≠ ℝ, unit disc ≠ (𝔸¹)ᵃⁿ; README asserts no equality there. | agree | none |
| Description: “divisor modules allow any coefficient ring” (worked example, README line 758) | ℙ¹, rays ±1, D=D₋, any ring A | Weights: u≥0 and −u≥−1, so W(D)={0,1}; sections A⊕At, rank 2 = h⁰(O(1)); no condition on A used. | agree | none |
| Description: “intersection degrees … independent of the field” (worked example, README line 760) | ℙ¹×ℙ¹: O(1,1)², O(2,0)·O(1,1), O(1,0)² | ad+bc gives 2, 2, 0; balance rows (1,0,−1,0), (0,1,0,−1): (1,0,1,0) ↦ (0,0), (1,0,0,0) ↦ (1,0). Integers, no field enters. | agree | none |
| Description: “lists the eight groups of headline theorems, from … Layer 0 to … Corollary 8.8 in Layer 6” | `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean` lines 12–41 | 8 bullets; the first names Layer 0 divisor sections, the last Scholze Corollary 8.8 (Layer 6); 0 declarations between `namespace` and `end`. | agree | none |

The rows for the untouched statements stand as in the previous review, of `13894ce`.

- Folder change since `13894ce`: 0 lines (`git diff --stat` empty); the folder holds `README.md`, `Suggested.lean`, `metadata.toml`, as the description says. Outside-folder diff against the merge base: 0 paths, as the description says.
- Description read against the head, sentence by sentence: the summary block (five comparisons of Theorem 8.5; Propositions 8.6, 8.7, Corollary 8.8; affine-line comparison §3.7; operational Chow and Minkowski weights §6.1), the two consumers (README lines 752, 754), “K° need not be noetherian” (line 570), the ℙ¹ tower of PerfectoidTowers as a Check (line 13), the imported carriers (line 9): no sentence contradicted. The pull request adds the roadmap; no section, declaration or supplier is removed, so nothing is left unstated.
- Source locators checked against the text: 5 (SCH12 lines 91, 2414, 2446, 2458, 2496 carry Theorems 1.5, 8.5, Proposition 8.6, 8.7, Corollary 8.8). The seeded sample falls in no changed passage.
- Gate at `de81660`: every counter 0, OK. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean`: exit 0, no message. Targeted build: succeeds, its only warning the `module` suggestion for `import Mathlib`, as the description says. Zero declarations: the signature sweep and the one-tactic probe have no candidate.
- Cross-roadmap citations: the resolver finds none missing at main `1a19c9f` and the open heads; no open pull request changes this roadmap or drops an id it cites. The three backticked names it lists (README lines 77, 714) are supplier-roadmap names in untouched text the previous reviews passed.
- Overlap check: read DeligneWeightsAndPurityPartII, WeilConjectures, PerfectoidShimuraVarieties, ClassicalAdicEtaleCohomology, FarguesFontaineDiamonds, AnalyticToricGeometry, PerfectoidTowers, PerfectoidSpaces (lists unchanged; scope as in the previous reviews); smooth complete Chow ring: WeilConjectures §6.3; nonprojective threefold: WeilConjectures §6.4; ℙ¹ Frobenius tower: PerfectoidTowers P8.15, P8.19; nothing else shared.
- Source independence: 0 passages compared with 0 sources (changed passages only: the folder did not change); largest share SCH12, 145 of 184 locators, as counted in the previous review; contents not compared again, since no layer is added, removed or reordered.

## Not verifiable

- The description's sentence on the number of earlier review and red-team rounds: not a statement about the head; not checked.

## Source issues

- none

## For the human reviewers

- none
