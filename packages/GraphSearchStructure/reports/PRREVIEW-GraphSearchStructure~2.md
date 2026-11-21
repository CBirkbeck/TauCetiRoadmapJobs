# Review of GraphSearchStructure (pull request #2950 at fea80d5)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the sentence in 4.2 on normal spanning trees of all connected graphs, is repaired, and the replacement text is true (recomputed below). The three smaller points are repaired as well, and every example the change adds was recomputed and holds. There is one small correction, to the pull request's description, and no format note; nothing blocks. The two sources still could not be opened here, so the locators the change adds (Erickson §5.2, p. 191; Diestel §1.1, p. 2, and Exercise 27, p. 31) are unchecked against the text; that and the placing of the subject are left to the human reviewers.

## C01 — The description's list of what was consulted stops short of the sources this head adds

The paragraph "Prior work" of the description lists the locators checked in Erickson's Chapter 6 and in Diestel's Chapter 1. The head now also cites Erickson's Chapter 5 (§5.2, p. 191, in 3.1), Diestel §1.1 (p. 2) and Exercise 27 (p. 31) in 4.2, and lists Tarjan (1972) and Sharir (1981) in the References as named for attribution and not consulted. A reader of the description cannot tell which of these were read. One added sentence would do, for example: "Also read: Erickson, Chapter 5, §5.2 (p. 191); Diestel, §1.1 (p. 2) and Exercise 27 (p. 31). Tarjan (1972) and Sharir (1981) are listed for attribution only and were not consulted."

## Questions for the author

- Diestel, sixth edition: are "Lemma 1.5.4", "Proposition 1.5.5", "Exercise 27 (p. 31)" and "Exercise 29 (p. 32)" the sixth edition's numbers, and does Proposition 1.5.5 there state the prescribed root itself or leave it to the exercise, as 4.2 now says? In the fifth edition the existence proposition is 1.5.6 and carries the prescribed root in its statement. The preview could not be read here (it asks for a password, and the sources service finds no other legal copy).
- Erickson, §5.2, p. 191: is the bound `E ≤ V(V − 1)` stated there for directed graphs as part of the definition, so that the sentence in 3.1 ("leaves no room for them") describes his convention? The chapter could not be obtained through the sources service, so neither this nor the wording of §6.2, p. 231, was compared.

## Previous findings

- R01 — repaired: 4.2 now reads "for finite connected graphs, a normal spanning tree", attributes finiteness to Diestel's convention (§1.1, p. 2), and adds the uncountable complete graph as the reason finiteness cannot be dropped; the argument is correct.
- C01 — repaired: the attribution to Hopcroft and Tarjan is gone from 4.4; 3.4 and 3.5 say the names follow Erickson (pp. 240, 242); the References list Tarjan (1972) and Sharir (1981), marked as not consulted.
- N01 — repaired: the remark of 1.2 is the six interval assignments of one arc, and the Layer 5 Example is the 5-cycle; both recomputed below. The scope sentence was changed to match ("recorded only for one arc, in the remark of 1.2").
- N02 — repaired: the `*Needs:*` lines of 4.2 and 4.4 now list 2.1.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 Remark, one arc `a → b`, times 0–3 | all 6 assignments of two intervals | `a=[0,2],b=[1,3]`: (D3) needs 3<2; `a=[1,3],b=[0,2]`: (D3) needs 3<2; `a=[0,1],b=[2,3]`: (D6) needs 2<1 | three excluded as stated | none |
| 1.2 Remark, continued | `b=[0,3],a=[1,2]`; `a=[0,3],b=[1,2]`; `b=[0,1],a=[2,3]` | first: (D4) forces `parent a = some b`, (D5) needs arc `b → a`, absent; second and third: all six axioms hold (D6: 1<3, 0<3) | exactly two forests | none |
| 1.2 Remark against Checks and Layer 1 Examples | the two surviving forests | Check: `a=[0,3], b=[1,2]`, `parent b = some a`; Example: `b=[0,1], a=[2,3]`, two roots; same data | consistent | none |
| 3.1, sentence on loops | loop `u ⟶ u` | "some edge with `post u < post v`" reads `post u < post u`, false; "every arrow `post v < post u`" fails at the loop, so not acyclic | sentence true as mathematics; source wording unread | question |
| 3.1, bound `E ≤ V(V − 1)` | V = 1, 2 | without loops at most 0 and 2 arcs; with loops 1 and 4 = V² | bound excludes loops | none |
| 4.2, uncountable complete graph | `K_κ`, κ uncountable; `K_ℕ` | normal tree of a complete graph: all pairs comparable, a chain from the root; finite ancestor sets give at most countably many vertices; `K_ℕ` has the ray | no normal spanning tree for κ uncountable | R01 repaired |
| 4.2 `isTree_fromRel` (statement cited by the changed text) | path `a – b – c` from `b`; two isolated vertices | one root, 2 tree edges on 3 vertices, connected; two roots, 0 edges, not connected | holds; unchanged | none |
| 4.2 and 4.4 `*Needs:*` | routes of 4.2, 4.4 | both use (L3) (ancestors of a descendant), which rests on 2.1; 2.1 now listed in both | agree with routes | none |
| 5 Example, 5-cycle from `s = 0` | cycle `0–1–2–3–4–0`; edge `2–3` deleted | distances 0,1,2,2,1; `dist 0 2 = dist 0 3 = 2` on an edge; after deletion path `2–1–0–4–3`, same distances, classes `{0,2,3}`, `{1,4}`, each edge crosses | agrees with 5.1 in both directions | none |

The rows for the statements the change does not touch stand as in the previous review, of `950242d`.

- Source locators checked against the text: 0. The change adds five (Erickson §5.2 p. 191, pp. 240 and 242 for the credits; Diestel §1.1 p. 2, Exercise 27 p. 31); none could be opened. See Not verifiable.
- Library declarations: the change names no new one; `Suggested.lean` is unchanged since `950242d`.
- Cross-roadmap citations resolved again: GraphConnectivityAndFlows Layer 2 (2.1–2.4) and Layer 7 (7.1–7.4) at its open revision, SpanningTreesAndShortestPaths Layer 3 (3.1, 3.6) at its open head; subjects as cited, neither consumed.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 169 roadmaps, 1975 edges, 0 problem(s)`. No file changed outside the roadmap folder.
- `Suggested.lean` elaborates: 15 `sorry` warnings and nothing else.
- Duplication by object, repeated for depth-first forests, normal spanning trees and low points over main and the open heads: no other owner.
- The pull request's text: title and summary agree with the head (new roadmap, 15 theorems, four definitions, one structure); the source list is incomplete (C01).

Overlap check: read GraphConnectivityAndFlows (main and its open revision), SpanningTreesAndShortestPaths, GraphColouring; nothing shared (cut vertices, bridges, blocks and ear decompositions stay with GraphConnectivityAndFlows, weighted distances with SpanningTreesAndShortestPaths).

Source independence: changed passages only; 0 passages compared with 0 sources, because neither Erickson nor Diestel could be read; largest share Erickson; contents not compared (the change adds, removes and reorders no layer). The added passages are a worked example, a counterexample and bibliographic data, all in the roadmap's own form.

Research link: the README presents the classical structure theorems behind the strong-component algorithms of Kosaraju and Sharir (1981) and Tarjan (1972), after Erickson (2019, Ch. 6), and normal spanning trees after Diestel (2025, §1.5); it rests on the README alone, and names no current research that uses them.

## Not verifiable

- Erickson, *Algorithms*, Chapter 5 (§5.2, p. 191) and Chapter 6 (the credits on pp. 240 and 242, and the wording of §6.2, p. 231): the sources service does not accept the author's host for this work and finds no other legal copy; no page was read.
- Diestel, *Graph Theory*, sixth edition, Chapter 1 (§1.1, p. 2; Proposition 1.5.5; Exercise 27, p. 31): the preview asks for a password and the sources service finds no legal copy; no page was read.
- The bibliographic data of Tarjan (1972) and Sharir (1981) were not compared with the publishers' records.

## Source issues

- none

## For the human reviewers

- **Scope.** The two sources read by the author are a textbook of algorithms (Erickson 2019, Chs. 5–6) and Chapter 1 of Diestel; the headline theorems are classical (1970s). The References now list Tarjan (1972) and Sharir (1981), marked as not consulted.
- **Licence.** Erickson's chapters are cited from the author's site as CC-BY 4.0 (README, References); the sources service did not classify that host. Diestel's preview PDF is password-protected.
- **Not tested.** Erickson has the largest share of the locators; its text and table of contents could not be read, so wording and arrangement were not compared with it, nor with Diestel, in either round.
