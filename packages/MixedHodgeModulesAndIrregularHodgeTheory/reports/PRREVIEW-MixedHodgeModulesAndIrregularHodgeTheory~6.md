# Review of MixedHodgeModulesAndIrregularHodgeTheory (pull request #2279 at 55c249b)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `55c249b`; this round reads the pull request's title and description against the head. No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: the summary block now reads "polarizable pure ones on smooth complex varieties and graded-polarizable mixed ones on every complex algebraic variety"; the prose reads "mixed Hodge modules on every variety, through local embeddings into smooth varieties" and "at output infinity (Layer 2)".

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| 10.6 `twistedDeRham_concentration_finrank`, the statement the description cites | `n = 0`, `φ = c`; `φ = x + y` on `(G_m)²`; `φ = x + y + 1/(xy)` | `dim H⁰ = 1` (complex is `ℂ` in degree 0); `dim H² = 1·1 = 1` (Künneth of two `(G_m, x)`); `3` (10.8 Check) | `0!·vol(pt ⊂ ℝ⁰) = 1`; `2!·(1/2) = 1`; `2!·(3/2) = 3` (triangle `(1,0)`, `(0,1)`, `(−1,−1)`, determinant 3) | Equal; no change |
| Description: "requests six results from its suppliers, each … under a gap slug" | Distinct `gap:` slugs in the README | 6 named in the description, with 4 suppliers | README: holonomic-specializability, regular-holonomic-stability, rational-complex-local-system-dictionary, toric-normal-fan, toric-rounded-vanishing, normal-semigroup-cohen-macaulay; suppliers as named | Agree |
| Description: "in ten layers", with the contents of Layers 1–10 | README `## Layer k` headings and the Scope bullets | 10 layers; Layer 2 "formal stationary phase of a regular input at output infinity" | 10 headings (lines 181–1040); Scope bullet for Layer 2 has the same clause | Agree |
| Description: "without assuming convenience" (Newton comparison) | 10.6, 10.7 hypotheses; 10.8 | Full-dimensional and Newton-nondegenerate only | 10.6 and 10.7 state exactly these; convenience is a hypothesis of 10.8 alone, which the description does not claim otherwise | Agree |
| Description: "Roadmaps on main are cited by name" | The README suppliers absent from the generated depends-on list | ResolutionOfSingularitiesCharacteristicZero, EtaleCohomologyFoundations, EnhancedDerivedSheaves, SchemeAndStackFoundations, GroebnerGeometry, AnalyticToricGeometry | First five under `TauCetiRoadmap/` on main, the last under `Completed/` | Agree |

The rows for the statements of the folder stand as in the previous review, of `55c249b`.

- Title and description read sentence by sentence against the head: the folder is added (1381 insertions, 0 deletions, 89 headings, 13 Lean declarations); no section, headline or supplier is removed; `Suggested.lean` states 10.6 and its docstring names the headlines that are not statable; the three consumers named in the summary block are the README's `## Downstream consumers` entries. No sentence is contradicted and no change is left unstated.
- Gate rerun at `55c249b`: every scanner 0, `OK`; 0 paths changed outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`: one warning, `declaration uses sorry` at line 155; no declaration changed, so the 13 signatures and the padding probe stand.
- Citation resolver: 0 cross-roadmap citations and 0 Lean names unresolved. Overlaps: no open pull request changes this folder, no cited id is dropped, no second copy on main.
- Seeded sample: no sampled target falls in a changed passage (the folder's diff is empty); source locators reread this round: 0.
- Overlap check: searched the open heads and main by object (mixed Hodge modules, exponential mixed Hodge structures, irregular Hodge filtration); read the matching passages of SheafConvolutionOnAbelianVarieties, TopologicalMirrorSymmetryForHitchinSystems and MappingClassGroupsAndCanonicalRepresentations, which consume these objects and construct none; KloostermanMomentsAndPotentialAutomorphy, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves and EtaleCohomologyFoundations stand as read in the earlier reviews; nothing shared beyond `D^b_c(X^an, ℂ)`, owner this roadmap (1.2, 1.3).
- Source independence: changed passages only — 0 passages compared (the folder's diff is empty), none shared; largest share FSY, as in the earlier reviews; no layer added, removed or reordered, so the contents comparison with FSY stands.

## Not verifiable

- SZ Theorem 4.20 (cited in 5.6, untouched) is recorded uncertified; its text was not read.
- The description's sentence on AI assistance and later red-team passes describes process, not the head; it was not checked.

## Source issues

- none

## For the human reviewers

- Licence: `packages/MixedHodgeModulesAndIrregularHodgeTheory/sources.toml` records Sai88, Sai90, Kash86 and AS with `licence_class = "answered-by:CBirkbeck"`; AS is hosted by Cambridge. Their legal status rests on the operator's answer.
- Licence: FSY cites for Theorem A.24 a work listed as "in preparation" (FSY line 3317); the roadmap does not cite it.
- Scope: nothing to flag; the main sources are refereed papers or the arXiv versions of refereed papers.
- Conditional: the acceptance rests on the six supplier gaps the README states; the board's `design/plan.json` declares four of them (deferred finding D01, settled outside this folder).
