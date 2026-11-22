# Review of HeightsForLogSingularMetrics (pull request #2894 at 1648df6)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeightsForLogSingularMetrics/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 3 lines changed since `46d8e6e`: the Conventions sentence now lists 0.4 (b) "apart from its comparison of two models", which is exactly the one clause of 0.4 (b) that names the formal proof, so the sentence is true of every target it lists. The title and description were read against this head: one small correction (the paragraph comparing this pull request with #2954 and with the other family pull requests describes heads that have since moved: #2954 now carries this folder with identical files, and its family index is no longer identical to this one) and one format note, none blocking. Left for a human: the scope and licence questions of the earlier rounds, and which of #2894 and #2954 merges this folder, since this pull request now adds nothing to the folder that #2954 lacks.

## C01 — The description's comparison with #2954 and with the other family pull requests no longer holds at their heads

A reader deciding the merge order relies on three sentences of the description that the present heads contradict.

"The three index files are identical to those at the head of #2954": at #2954's head `e79a6cb`, `Suggested.lean` and `metadata.toml` of the family index are identical to this head's, but the index `README.md` differs in two places (7 diff lines): #2954 adds "under its directory `src/`" to the sentence on where the formal proof's files are looked up (line 19), and words one sub-roadmap's entry differently (lines 150–152).

"a README that differs from this one in one sentence of Conventions": #2954's copy of this folder now has the same `README.md` and the same `Suggested.lean` as this head (identical blobs), so "this pull request then adds to main only what its folder has that #2954's does not" now means it adds nothing to the folder.

"identical to these at all but two of their heads": of the 18 other open pull requests of the family that add a single sub-roadmap, 7 carry this head's index `README.md` (#2888, #2889, #2890, #2901, #2907, #2918, #2919) and 11 carry another (#2892, #2893, #2896, #2899, #2913, #2915, #2916, #2921, #2922, #2923, #2924).

Text that would be right: "#2954 carries this folder with the same `README.md` and `Suggested.lean`, and the family's other sub-roadmaps, among them the three family suppliers this README cites. Its index `Suggested.lean` and `metadata.toml` are identical to these; its index `README.md` differs in two sentences, and whichever pull request merges later takes the index as it is on main." Or bring the index `README.md` here to #2954's, and say "identical". The count of sibling heads is best dropped, since it changes with every push.

## N01 — The generated merge-order block contradicts the prose beside it

The `merge-order` block says "No open pull request must merge before this one", while the paragraph above it says, correctly, that this pull request merges after #2954, which carries SingularHermitianMetricsAndL2Methods, SlopesOfHermitianVectorBundles and ChowFormsAndHeightsOfSubvarieties (none is on main). The `depends-on` block is headed "suppliers still open" and lists #1833 and #1017, both merged. The blocks are refreshed by their tool; the author's prose needs no change here.

## Previous findings

The previous report (of `46d8e6e`) had no finding; its two small corrections and its format note are accounted for here.

- C01 (Conventions listed 0.4 (b) among targets naming no formal-proof statement) — repaired: "for instance 0.4 (a), 14.1 (a), (b) and 14.2 (a)–(c), and 0.4 (b) apart from its comparison of two models, but not 4.3b (a)".
- C02 (description's family-index paragraph described closed pull requests and did not say #2954 carries this folder) — partly repaired: the paragraph now names #2954, the closed suppliers and the merge order; its comparisons of heads are out of date again, C01 above.
- N01 (generated supplier blocks named closed pull requests) — partly repaired: the closed pull requests are gone from the blocks; the merge-order block now contradicts the prose, N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions sentence, instance list (README lines 22–26) | 0.4 (a), (b); 14.1 (a), (b); 14.2 (a)–(c); 4.3b (a) | [FormalProof] occurs in 0.4 only at lines 45 (inside the two-model clause of (b)) and 47 ((c)); in 14.1 only at (c), line 139; in 14.2 only at (d), line 156 | true for each listed target | none |
| 0.4 (b), comparison of two models (line 45), the clause the changed text cites | `f_1 = f_2 = id`; `f_1` of degree 2 with `L^{(2)} = f_1^*L^{(1)}`; `Spec ℤ` with lattices `ℤ`, `2ℤ`, same metric | `1·I − 1·I = 0`; `1·(f^*L)^d = 2·L^d` by the projection formula of (b); degrees `0 ≠ −log 2`, and multiplication by 2 is no isometry, so the hypothesis fails as it must | consistent with the third Check and with "apart from its comparison of two models" | none |
| 4.3b (a) as excluded by the sentence | ChowFormsAndHeightsOfSubvarieties §6.2 (a7) at #2954's head `e79a6cb` | README there, line 307: (a7) the whole space; line 521: this roadmap's 4.3b (a) is (a7) for `J̄ = Ē^∨`; supplier contract here, line 265, gives the same value `deĝ_n(J̄) + ½·Σ_{m=1}^{N−1}H_m` | citation resolves, both sides agree | none |
| Description against the heads | #2954 at `e79a6cb`; 18 other open family pull requests | folder `README.md` and `Suggested.lean`: identical blobs; index `README.md`: 7 differing lines; 7 sibling heads identical in the index README, 11 not | three sentences out of date | C01 |

The rows for the statements the change does not touch stand as in the previous review, of `46d8e6e`.

- Source locators checked against the text: none new; the change adds no locator. The seeded sample meets the changed sentence at 0.4, 14.1, 14.2 and 4.3b, where the sentence's claim (which targets name [FormalProof]) was checked against each target's text.
- Library declarations opened at the pins: none; the changed text names no Mathlib or Tau Ceti declaration.
- Cross-roadmap citations resolved: ChowFormsAndHeightsOfSubvarieties §§5.1, 6.2 (a7) at #2954's head; the eight suppliers the description lists as on main each have a folder on main.
- Dependency check: `depcheck: 133 roadmaps, 1480 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged, declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: unchanged, (1) 0.4 (b)–(c); (2) 4.3b (b); (3) 14.1 (a), (c); (4) 16.1 (a); none statable at the pins, each named in the docstring with what it lacks.
- Changes outside the folder: only the three files of the family index, the pull request's own. The worker's automatic checks all passed at this head.
- Pull request text: title and every paragraph read against this head (the summary, the paragraphs on 16.1, 14.1 (c), 0.4 (c)(iii) and 4.3b (a), the count of 41 sub-roadmaps, the index's opening paragraph and its section "When a roadmap is wrong", the section lists of the suppliers); all agree except the paragraph of C01 and the block of N01.

Overlap check: read ChowFormsAndHeightsOfSubvarieties (at the head of #2954), ArakelovGeometryAndAbelianHeightsPartII and ArakelovGeometryAndAbelianHeights (on main) for the changed passage; the height of the projective space of a Hermitian vector bundle: owner ChowFormsAndHeightsOfSubvarieties §6.2 (a7), cited here; nothing owned twice. #2954 carries this same folder with identical files: the same text, not a second plan.

Source independence: changed passages only: 1 passage compared (the Conventions clause, which lists this roadmap's own target ids and has no counterpart in a source), none shared; largest share [FormalProof], 46 of 53 locators as counted in the previous review; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Layer 4 extends Moriwaki's generalised Hodge index theorem (2009) and Zhang's theorem of successive minima (1995) to log-log singular metrics; Layer 16 complements Bost's linear slope bound (1996) using Moret-Bailly's key formula (1990); Layers 0, 14, 16 are inputs of Alpöge's formal proof (2026). Rests on the README and the sources read.

## Not verifiable

- [FormalProof] was not reopened in this round: the change adds no locator into it. The locators of 0.4 (c), 4.3a (d), 4.3b, 14.2 (d), 16.1 (b) and most of References were not compared in the incremental rounds.
- 16.1 (a) with an absolute constant: the two questions of the earlier reviews on step (3) of the route are untouched by this change and remain open.
- #2954 and the family's supplier roadmaps are not in the index of open roadmap pull requests used by the citation tools; their files were read from the repository at #2954's head. Ownership against the other 40 sub-roadmaps of #2954 was not searched.

## Source issues

- none

## For the human reviewers

- Scope: 16.1 (a) is "not attributed to a published source" (README line 221); by Conventions (lines 22–26) 0.4 (a), 14.1 (a), (b), 14.2 (a)–(c) and most of 0.4 (b) claim no source; the Announcement says no written account of the proof exists yet.
- Licence: the family index (lines 12–19) reports that the repository of [FormalProof] says the proof was published without a licence and is mirrored for verification only; this README names about 40 of its file paths with declaration names.
- Licence: the Announcement is recorded as read from its author's own page (`alpo.ge`); please confirm the host.
- Not tested: [FormalProof] carries 46 of 53 locators; only four were compared with it, in the previous round (operator's local copy at `e50d098`); its arrangement and the origin of the ids 0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1 were not compared.
- Pull requests: #2954 (open, draft, head `e79a6cb`) carries this folder with files identical to this head and the three family suppliers; its family index README differs from this one in 7 lines. Which of the two merges this folder is to be decided.
- Policy: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, section "When a roadmap is wrong", from line 45) states how reviews of contributions that depart from these roadmaps should proceed; whether a roadmap index sets review policy is a project decision.
