# Review of GraphConnectivityAndFlows (pull request #2582 at 44f517c)

**Verdict:** accepted

**Summary.** Accepted. The folder is unchanged since the previous review, which accepted it; this round read the pull request's description against the head and the base, and every sentence checked agrees with them, including the wording on Layers 3, 4 and §§8.1–8.7 that the previous small correction asked for. No finding and no small correction; the two format notes of the previous review stand and do not block. Nothing is left for a human to decide.

## N01 — The order on strongly connected components cited in §4.4 is Tau Ceti's, and its module is not in the supplier contracts

§4.4 (line 1136) cites `Quiver.StronglyConnectedComponent.instPartialOrder` directly after "Mathlib's `Quiver.StronglyConnectedComponent`". At the pin the instance is declared in `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`, line 46, a module that no bullet under "From Tau Ceti" names. The minimum-cut bullet or the supporting-modules bullet would be the place.

## N02 — Four cited works have no theorem or page locator

Picard–Queyranne (§4.4, line 1156), Frank–Gyárfás (§8.8, line 1992), Gusfield and Korte–Vygen §8.6 (§9.1, lines 2069–2070) are cited by title or section only. Each stands beside a theorem the pinned library proves, so no target rests on them; a theorem number or page would let a reader find the statement.

## Previous findings

The previous review had no finding (no R item). Its other remarks:

- C01 — repaired: the description now reads "most of the flow theory of Layer 3", "most of Layer 4" and "the circulation theorems of §§8.1–8.7", and lists the corollaries, API items and §8.6 reductions that stay targets.
- N01 — not repaired: the folder is unchanged; restated above as a format note.
- N02 — not repaired: the folder is unchanged; restated above as a format note.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `isVertexConnected_two_iff_exists_isOpen_earDecomposition` (description: "with no size hypothesis") | `V` empty; `K₁`; `K₂`; `K₃`; path `a–b–c` | left needs `3 ≤ ENat.card V`: false, false, false, true, false; right needs a cycle start (`IsOpen` = cycle start and open ears): none, none, none, triangle, none | true; description agrees |
| `isEdgeConnected_two_iff_exists_earDecomposition` (description: start from a vertex, equivalent to the old cycle-or-vertex form) | one vertex; one edge; parallel pair; triangle | true / `EarStart.vertex`, no ears; false / none; true / vertex plus one closed two-edge ear; true / vertex plus one closed three-edge ear (a cycle start is such an ear) | true; description agrees |
| Description: "27 Checks in 22 sections" | count of Check bullets and of sections carrying them at the head | 27 bullets; 22 sections (§§1.1, 1.2, 1.3, 1.5, 2.1, 2.4, 2.5, 3.1, 4.1, 4.3, 4.4, 6.3, 6.7, 6.8, 6.9, 7.2, 7.3, 7.4, 8.1, 8.2, 8.8, 9.1) | agrees |
| Description: old `Suggested.lean` "about 2,500 lines", "34 sorry'd data definitions" | the base file | 2478 lines; 34 `def`/`instance` bodies with `sorry` (first `excessHom`, last `orientationEndpointEquiv`) | agrees |
| Description: new `Suggested.lean` contents | the head file | 11 theorems (2 block–cut, Kőnig, Hall, edge-colouring, 2 Whitney, ear/2-edge, 2 Robbins, `st`-numbering); 3 definitions with real bodies; 7 Tau Ceti imports; directed ears named not statable | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `44f517c`.

- Description sentences checked against the head or the base: the four headline theorems of the overview; the 39 subsections each with a *Needs:* line (43 lines); every layer ending in Examples and Dependencies; all 39 old k.n headings kept with their titles, and §9.1 new; the "Scope boundaries" sentence (line 2132) and the §8.1 name correspondence (lines 1810–1811); the eight sections whose targets carry no locator (§§3.2, 3.4, 4.1, 4.2, 6.4, 8.3, 8.8, 9.1); the old Whitney hypothesis (base README line 855) and the old "equipped with capacities" and "Recover `SimpleGraph.isAcyclic_iff_forall_isBridge`" sentences (base lines 262, 370); the Downstream consumers section (§§1.1, 1.3, 8.1); the supplier ZigzagPreprojective §0.2, cited on the base as Layer 0, so no supplier is added or dropped.
- Library declarations opened at the pins this round: 4 (`SimpleGraph.IsVertexConnected`, VertexConnectivity.lean:217; `Graph.EarStart` and `EarStart.IsCycle`, Ear/Basic.lean:199, 209; `Graph.EarDecomposition.IsOpen`, Ear/Basic.lean:302; `Quiver.StronglyConnectedComponent.instPartialOrder`, StronglyConnectedComponent.lean:46). The two module names the citation scan could not find exist: `Mathlib/Order/KonigLemma.lean` at the pin, and `SimpleGraph.EdgeColoring` is marked in the README (line 2426) as a Mathlib proposal's name.
- Cross-roadmap citations resolved this round: 1 (ZigzagPreprojective §0.2, heading at line 463 of its README on main).
- Source locators: none reopened (no passage changed); the 58 of the previous review stand, and so do its two source issues, already reported.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. No change outside the folder.
- Elaboration of `Suggested.lean`: eleven `sorry` warnings and nothing else.

Overlap check: read SpanningTreesAndShortestPaths, GraphColouring, HamiltonianCycles and MatroidOptimization (no roadmap on main is listed as close; no open pull request changes this roadmap or drops an id it cites); as in the previous review each cites this roadmap for what it uses, so the owner of every shared object is GraphConnectivityAndFlows.

Source independence: changed passages only: no passage of the folder changed, so 0 new passages compared; the previous comparison stands (12 passages with 5 sources, none shared; largest share Diestel-GraphTheory-6, 31 of 67 page locators; contents compared with Diestel-GraphTheory-6: independent).

Research link: Layer 9 is the Gomory–Hu theorem in the contraction-free form of Gusfield (1990), and §7.4 the `st`-numberings of Lempel, Even and Cederbaum as stated by Papamanthou–Tollis (2010); §§1.1, 1.3 and 8.1 are prerequisites of NeronModelsAndSemistableAbelianVarieties and FreeGroupsAndLimitGroups. Rests on the README's references and Downstream consumers section.

## Not verifiable

- Korte–Vygen, *Combinatorial Optimization*, §8.6: a paywalled book, no legal copy found; cited only for constructions the pinned library already proves.
- Gusfield, SIAM J. Comput. 19 (1990): paywalled at its DOI; cited only for the pinned cut-tree construction.
- Picard–Queyranne: the report itself was not read; cited without a locator, for the pinned §§4.2 and 4.4.
- The description's sentence that the old README wrote `TauCeti.OrientedQuiver`: the base README has the unqualified `OrientedQuiver` only (line 48); the head's name is the pin's.

## Source issues

- none

## For the human reviewers

- none
