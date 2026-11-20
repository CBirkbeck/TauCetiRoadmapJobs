# Review of KhovanovHomology (pull request #2600 at 86c2866)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. This is an incremental re-review of the 2 lines changed since `ff26ea1`: the head adds, before the heading of Layer 2, an anchor carrying the old heading id of K2, so all four links of Foams and DiagrammaticCoherence into this README now land on their layers and nothing in those roadmaps needs to change. One small correction remains, not blocking: the description still says Foams' link to the old K2 heading lands at the top of the README and must be repointed. There are no format notes, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands
- D02 — resolved: the head keeps an anchor with the old K2 heading id before Layer 2 (line 382), so Foams' reference link lands there unchanged.

## C01 — The description says Foams' link to the old K2 heading misses and must be repointed; at this head it lands on Layer 2

The description says: "Foams' link to the old heading of K2 lands at the top of the README and needs to be pointed at the heading of Layer 2", and gives as the reason that an anchor with an old id is kept "only for a link written inline". At this head the README carries the anchor `k2-the-rank-two-frobenius-object-and-circle-tensors` directly before the heading of Layer 2 (line 382), and that id is, character for character, the fragment of Foams' reference definition (Foams on main, line 2887). A reader of Foams is therefore told to do work that is no longer needed, and the sentence before it names only two of the three anchors.

Text that would be right, replacing both sentences: "Before the headings of Layers 2, 3 and 8 the README keeps anchors carrying the old heading ids of K2, K3 and G, so the links of Foams and DiagrammaticCoherence to those old headings still land on those layers."

## Questions for the author

- In §8.3, which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are "the first slot `0` west and the second slot `1` west"? The pinned constructor carries no plane frame, so the dictionary to its orientation bit could not be checked. (Repeated from the previous reviews; the passage is unchanged.)

## Previous findings

The previous review, of `ff26ea1`, raised no finding (no R-numbered point). Its two small corrections:

- C01 (previous) — repaired: an anchor with the id `k2-the-rank-two-frobenius-object-and-circle-tensors` stands on its own line before "## Layer 2: the rank-two Frobenius object, circle tensors and the formal surface category" (lines 382–384).
- C02 (previous) — partly repaired: the description now names the anchors before Layers 3 and 8, but still says the K2 link "lands at the top of the README"; written again as C01 above.

The repair introduced no new problem: the added lines are an anchor and a blank line, no statement, name, section number or supplier changes, and the automatic checks accept the anchor.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Anchors before Layers 2, 3, 8 against the links into this README | the four links on main (Foams 2723, 2887, 2888; DiagrammaticCoherence 49); a search of the open heads | ids at lines 382, 600, 852 / fragments `k2-…circle-tensors`, `k3-…euler-characteristic`, `g-…smooth-link-comparison` (twice): equal strings; the one open pull request carrying those two files has the same four links, no others | four of four resolve | none |
| The added id against the heading it precedes | Layer 2 heading, line 384 | generated id of the heading begins `layer-2-the-rank-two-…`, the anchor's begins `k2-…`: distinct, no duplicate id; the old-to-new sentence (lines 71–72) maps K2 to Layer 2 | consistent | none |
| §2.1 (the section the anchor lands on): the Frobenius structure on `R[ε]` | basis `1, X`; the wrong counit `ε(1) = 1, ε(X) = 0`; `2 = 0` | `mΔ(1) = 1·X + X·1 = 2X`, `mΔ(X) = X² = 0`; torus `ε(2X) = 2`, sphere `ε(1) = 0`; `Δm(X⊗1) = X⊗X = (m⊗id)(X⊗Δ1)`; wrong counit: `ε(X·1) = ε(X·X) = 0`, degenerate; in characteristic 2 the torus is `0`, as the formula `2` says | Checks true | none |
| §2.1 neck cutting `a = ε(Xa)·1 + ε(a)·X` | `a = 1`, `a = X`, `a = 0` | `ε(X)·1 + ε(1)·X = 1`; `ε(0)·1 + ε(X)·X = X`; `0 = 0` | holds | none |
| Description, the K2 sentence | the head | "lands at the top of the README" / an anchor with that id at line 382 | contradicted | C01 |

The rows of the previous review for the statements this change does not touch stand as in the previous review, of `ff26ea1`.

- Source locators checked against the text this round: 0; the diff adds no locator and no prose, and the seeded sample (§§1.2, 1.6, 1.7, 2.2, 2.5, 2.6, 8.5, 4.2, 5.5, 5.11, 6.2, 7.4–7.7) falls in no changed passage.
- Library declarations opened at the pins: none new; the change names none.
- Cross-roadmap citations resolved: the four links of Foams and DiagrammaticCoherence on main into this README, and a search of every open head for links into it (the same four, in the one open pull request that carries Foams and DiagrammaticCoherence).
- Automatic checks: all passed on a rerun, every count zero. Dependency check output: `depcheck: 178 roadmaps, 2027 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings (lines 57, 70, 81, 112, 143) and nothing else; the file is unchanged since `ff26ea1`, so the eight elaborated signatures and the one-tactic probes of the earlier reviews stand.
- Headlines and padding: no statement changed.
- Description against the head: two adjacent sentences out of date (C01); the rest stands; no section, declaration or supplier is added or dropped by the change.

Overlap check: read Foams and DiagrammaticCoherence (their links into this README, on main and at the one open head that carries them); GeometricTopology's scope was read in the previous review, of `ff26ea1`, and not again; link cobordisms, §7.1 here and §6.5 of GeometricTopology's open revision (D01); nothing shared by the changed passage.

Source independence: changed passages only; the diff adds one anchor line and no prose, so 0 passages were compared with 0 sources, none shared; largest share Kho99, 9 of 19 parenthetical locators in the layers, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Reidemeister invariance and functoriality (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) are what Rasmussen's invariant (2010) is built on; GeometricTopology on main names that invariant, built on this roadmap, for Piccirillo's theorem that the Conway knot is not slice. Rests on the README's references and GeometricTopology's README on main.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 and Ch. 5 (§8.6): books outside the manifest; not opened; unchanged text.
- Carter–Saito 1993, Roseman and Carter–Rieger–Saito (§7.5): paywalled articles outside the manifest; unchanged text.
- The clasp frame of §8.3: the pin has no plane data to check it against (see the question).

## Source issues

- none

## For the human reviewers

- none
