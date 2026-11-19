# Review of GraphColouring (pull request #2559 at 2eda8fd)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, every locator of the sample was read in Bondy–Murty and in Diestel and supports the statement as written, and `Suggested.lean` elaborates with `sorry` as its only warning and states all fourteen headline theorems. There are one small correction (a wrong section number in the References) and two format notes, none blocking. Two matters are left to the human reviewers: the scope (classical textbook results, six of them located at textbook exercises) and how closely the proof routes of 2.1 and 5.1 track Diestel's proofs.

## C01 — The References place Theorem 10.1 of Bondy–Murty in §10.1; it is in §10.2

A reader who opens §10.1 (the definitions of digraphs, pp. 171–173) finds neither the theorem of Gallai and Roy nor the tournament corollary. In the scan, §10.2 "Directed paths" begins on p. 173 (BondyMurty10 line 108), Theorem 10.1 and the remark on its sharpness are on p. 174 (lines 118 and 138) and Corollary 10.1 on p. 175 (line 155). The citations inside 3.1 and 3.2 give the theorem number and page and are right; only the entry in the References, line 590, "Chapter 10, §10.1, pp. 174–175", needs "§10.2".

## N01 — The Check `χ'(K_(m, n)) = max(m, n)` in 5.1 needs `m, n ≥ 1`

With `n = 0` the graph has no edge and chromatic index `0`, not `m`. The four instances listed (line 434) are right: recomputed as `5, 3, 3, 4`. The README states such ranges elsewhere (`n ≥ 1`, `m ≥ 2`), so adding "for `m, n ≥ 1`" would match it.

## N02 — Several Checks report an exhaustive computation rather than a test a reader can redo

"The theorem holds on every connected labelled graph with at most seven vertices" (2.1, 2.2), and the like in 3.1, 4.2, 5.1 and the Examples of Layer 1, say that the statement was not refuted; they do not tell a wrong definition from the right one. They could be dropped or replaced by the single count that pins something (the `26703` graphs of 2.1 is one such: it is the `26704` connected labelled graphs on six vertices less the complete one). Two lines exceed 100 characters (426 and 505).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 degeneracy bound | `K₄` + pendant; `K_(1,5)`; `k = 0`; empty `V` | δ = 1, χ = 4, least k = 3; k = 1, χ = 2; hypothesis ⇔ no edge; vacuous, `Colorable 1` | true; BM Ex. 8.1.5 p. 121, Diestel Prop. 5.2.2 p. 127 |
| 1.1 `χ ≤ Δ + 1` | `Kₙ`, odd cycles, empty `V` | n = (n−1)+1; 3 = 2+1; `Colorable 1` | true; BM Cor. 8.1.2 p. 118 |
| 1.2 `n ≤ χ·α` | `C₅`, `C₇`, Petersen, `Kₙ`, empty | 5 ≤ 3·2; 7 ≤ 3·3; 10 ≤ 3·4; n = n·1; 0 ≤ 0·0 | true; Diestel Ex. 52 p. 152 |
| 1.3 sum | `Kₙ`, `C₅`, `C₇`, empty, one vertex | n+1; 3+3 = 6; 3+4 = 7 ≤ 8; 0 ≤ 1; 2 = 2 | true; BM Ex. 8.1.4(b) p. 121 |
| 1.3 product | `C₅`, `C₇`, empty | 9 ≥ 5; 12 ≥ 7; 0 ≤ 0; route α = ω(Gᶜ) ≤ χ(Gᶜ) | true; own derivation from 1.2 |
| 2.1 Brooks | `K₁`, `K₂` (excluded as `⊤`), `P₃`, `C₄`, Petersen, `K_(3,3)`, triangle + isolated vertex | Δ = 2, χ = 2; χ = 3 = Δ; χ = 2 ≤ 3; disconnected: χ = 3 > 2 | true; BM Thm 8.4 p. 122, Diestel Thm 5.2.4 p. 127 |
| 2.2 iff | `K₁`, `K₂`, `C₃`, `C₅`, `C₄`; both directions | 1 = 0+1; 2 = 1+1; 3 = 2+1; `C₄`: 2 ≠ 3 and neither side | true; BM p. 122, Diestel p. 127 |
| 2.1 count | connected labelled graphs on 6 vertices | 26704, less `K₆`, = 26703 | Check true |
| 3.1 Gallai–Roy–Vitaver | `k = 0`; cyclic triangle; `C₅`; complete graph on `ℕ` | nil path has length 0, hypothesis fails; nodup paths ≤ 2 arcs, χ = 3; hypothesis fails for all k | true; BM Thm 10.1 p. 174, Diestel Ex. 18 p. 149 |
| 3.2 sharpness | `C₅` coloured 1,2,1,2,3; `k = 0`; Bool colouring | longest path 3 vertices; empty `V`; darts with target `true` = `sourceSink` carrier | true; BM p. 174, Diestel Ex. 18 |
| 4.1 Mycielskian | `K₂`, `C₅`, `K₁`, empty; shadow–shadow, shadow–own vertex | 5 vertices 5 edges; 11, 20; 3 vertices 1 edge; 1 vertex; `fromRel` gives no such edge | definition is the intended graph; BM p. 129 |
| 4.2 `χ(M(G)) = χ(G) + 1`, triangle-free | iterates of `K₂`; `K₁`; empty; `χ = ⊤` | (n, m, χ) = (2,1,2), (5,5,3), (11,20,4), (23,71,5), no triangle; 2; 1; ⊤ = ⊤ | true; BM pp. 129–130 |
| 4.3 Mycielski | `k = 0, 1, 2, 3, 4` | `Fin 0`; `K₁`; `K₂`; `C₅`; Grötzsch | true; BM Thm 8.7 p. 129 (k ≥ 1), Diestel Ex. 22 p. 149 |
| 5.1 Vizing | `K₃..K₇`, `C₄, C₆, C₅, C₇`, Petersen, four `K_(m,n)`, edgeless, empty | χ' = 3,3,5,5,7; 2,2,3,3; 4; 5,3,3,4; 0; 0 ≤ 0 ≤ 1 | true; BM Thm 6.2 p. 93, Diestel Thm 5.3.2 p. 132 |
| 5.2 regular, odd order | `d = 0` on 3 vertices; `K₄`, `K₆`; `K₅`, `K₇`, odd cycles | χ' = 0 ≠ 1 (so `d ≥ 1` needed); 3, 5 = Δ; 5, 7, 3 = d+1 | true; BM Ex. 6.2.2 p. 96 |
| Lean coercions | 1.2, 1.3, 2.2, 5.1, 5.2 | elaborated as `↑(card V)`, `↑G.indepNum`, `↑G.maxDegree + 1` in `ℕ∞` | agree with README |
| C01 | BondyMurty10 | §10.2 heading line 108; Thm 10.1 line 118; Cor. 10.1 line 155 | section number wrong, pages right |

- Source locators checked against the text: 21 (Bondy–Murty chapters 6, 8, 10 in the archived scans; Diestel chapter 5 preview), all at the stated theorem and page; one section number wrong in the References (C01).
- Library declarations opened at the pins: 33 Mathlib (among them `Finsubgraph.lean:157`, `Coloring/Vertex.lean:121, 219, 308, 323, 445, 553, 632`, `Coloring/Constructions.lean:134`, `Clique.lean:1044, 1046, 1052`, `Finite.lean:389, 500, 505, 543, 670`, `LineGraph.lean:34`, `Basic.lean:135`, `Quiver/Path/Vertices.lean:37, 61`) and 6 Tau Ceti (`Zigzag/Orientation.lean:76, 107, 134, 153, 571`, `Acyclic/Basic.lean:40`); every name and stated hypothesis matches.
- Duplication by object: no degeneracy bound, `Δ + 1` bound, `n ≤ χ·α`, Brooks, Mycielskian, chromatic index or Vizing statement in the pinned Mathlib or Tau Ceti; the three open Mathlib proposals named in the scope section were opened and are open and as described.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows §6.9 and its Conventions (lines 139–140, 798–815, 1116 of its README on main), ZigzagPreprojective (README lines 204–205); all as cited.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 14 `sorry` warnings and nothing else; one import of `Mathlib` and one Tau Ceti module; no `set_option`, no sorried data. The 16 elaborated signatures were compared with the README; none lost a binder.
- One-tactic probe on a scratch copy (`rfl`, `simp_all`, `infer_instance`, `exact?`): all 14 theorems remain open; nothing is padding.
- Pull request text read against the head: 14 theorems and 2 definitions, the import list, the suppliers and the exclusions all agree.

Overlap check: read HamiltonianCycles, RamseyNumbers, SpanningTreesAndShortestPaths, GraphConnectivityAndFlows, ZigzagPreprojective; nothing shared. HamiltonianCycles owns Rédei's theorem on spanning paths of tournaments, which this roadmap mentions only in a Check of 3.1; GraphConnectivityAndFlows owns Kőnig's edge-colouring theorem and excludes general-graph edge colouring; RamseyNumbers colours edges without a properness condition.

Source independence: 14 passages compared with 2 sources (4 files), none shared, longest common run about 5 words; largest share Bondy–Murty, 18 of 29 locators; contents compared with Bondy–Murty (Layers 1, 2, 3, 4, 5 draw on §8.1, §8.2, §10.2, §8.5, §§6.1–6.2, not its order, and Layer 1 is assembled from exercises and Diestel): independent.

Research link: Vizing's two classes are the setting of Csaba, Kühn, Lo, Osthus and Treglown (2016), and triangle-free graphs of large chromatic number that of Scott and Seymour (2016) on χ-boundedness; this rests on Diestel §5.3 and §5.6, not on the README, which names no later research.

## Not verifiable

- The years attached to the original papers (Brooks 1941 and Vizing 1964 excepted, which the books print at the theorems): the papers were not read, as the README itself says.
- The date "June 2024" of Diestel's chapter file and the edition year: the page footers did not survive text extraction.
- The claims that every statement holds on all labelled graphs with at most seven (or six, or five) vertices: not rerun at that size; the individual values in the Checks were recomputed.

## Source issues

- none

## For the human reviewers

- Scope: the only sources read are two textbooks; six targets (1.1, 1.2, 1.3 sum, 3.1–3.2, 4.3 in Diestel, 5.2) are located at textbook exercises (Bondy–Murty 8.1.4, 8.1.5, 6.2.2; Diestel Ch. 5 Ex. 18, 22, 52).
- Licence: the route sketches of 2.1 and 5.1 (README lines 195–206, 417–427) follow the steps of Diestel's proofs (pp. 128–129, 132–133) in the same order, compressed and reworded; 3.1 and 4.2 likewise follow Bondy–Murty's proofs.
- Licence: Diestel's preview chapter on the author's university page is a copy-restricted PDF; the Bondy–Murty chapters are Internet Archive captures of an author's page that is no longer live.
