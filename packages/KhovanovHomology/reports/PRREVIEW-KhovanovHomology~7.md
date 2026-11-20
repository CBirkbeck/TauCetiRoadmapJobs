# Review of KhovanovHomology (pull request #2600 at 86c2866)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. This is an incremental re-review of 0 changed lines since `86c2866`: the folder is unchanged, and this round read the pull request's description against the head. The description now agrees with the head, including the sentence on the anchors before Layers 2, 3 and 8 that the previous review asked for, so the one earlier small correction is repaired. There are no small corrections and no format notes; one question to the author is repeated, one misprint in a source is recorded, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands

## Questions for the author

- In §8.3, which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are "the first slot `0` west and the second slot `1` west"? The pinned constructor carries no plane frame, so the dictionary to its orientation bit could not be checked. (Repeated from the previous reviews; the passage is unchanged.)

## Previous findings

The previous review, of `86c2866`, raised no finding (no R-numbered point). Its one small correction:

- C01 (previous) — repaired: the description now reads "Before the headings of Layers 2, 3 and 8 the README keeps anchors carrying the old heading ids of K2, K3 and G", which is what lines 382, 600 and 852 of the README hold.

The repair touched the description only; it introduced no new problem.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "eight layers with 62 numbered sections, each with a *Needs:* line", `Examples` and `Dependencies` in every layer | counts in the README at this head | 8 layer headings, 62 numbered `###` sections, 62 *Needs:* lines, 8 `Examples`, 8 `Dependencies` / 8, 62, 62, 8, 8 claimed | agrees | none |
| Description: "53 Checks in 40 sections" | count of Check bullets and Check blocks | 53 bullets in 40 blocks / 53 in 40 claimed | agrees | none |
| Description: anchors before Layers 2, 3, 8 and the mapping of the former numbering | README lines 71–72, 382, 600, 852; citing roadmaps on main and the open CombinatorialHeegaardFloer | ids `k2-…`, `k3-…`, `g-…` present; K1–K7 → Layers 1–7, G → Layer 8 stated; citations found: Foams K1, K2, K3, G; DiagrammaticCoherence G; SpectralSequences… K5; DerivedModuleAlgebra K5; CombinatorialHeegaardFloer K7 | all map | none |
| Description: `Suggested.lean` "imports `Mathlib` and six Tau Ceti modules", five headlines, three definitions, three headlines named as not statable | the file at this head | 1 + 6 import lines; 5 `sorry`'d theorems, 3 definitions; docstring names smooth-link invariance, cobordism functoriality, the reduced theory / same | agrees | none |
| Description: suppliers, with DerivedModuleAlgebra new | supplier contracts at the head against the README on main | head: GeometricTopology, DifferentialGeometry, ConformalMapping, DGAInfinity, DerivedModuleAlgebra, AlgebraicTopology; main's README links the same minus DerivedModuleAlgebra / description names the same six and says §0.2 is new | agrees | none |
| Description and §5.5: Khovanov's Proposition 28 should read `H^{i−2l, j−6l}` | his (45) `C(D) = C̄(D)[x]{2x − y}` and (134) `x(D₀) = x − 2l`, `y(D₀) = y + 2l`; the Hopf link, `l = 1` | `H^{i,j}(D₀) = H̄^{i+x−2l, j+2x−y−6l} = H^{i−2l, j−6l}(D)` / printed `H^{i+2l, j+2l}`; Hopf `(0,0),(0,2),(2,4),(2,6)` minus `(2,6)` gives `(−2,−6),(−2,−4),(0,−2),(0,0)`, the mirror's support; `(2l,2l)` would give `(−2,−2)`, empty | README and description right, source misprinted | none |
| Description and §5.6: value `2^c` at `q = 1` through `q = −1` and `V(1) = (−2)^(μ−1)` | unknot (`c = 1`), positive Hopf link (`c = 2`) | unknot `q + q⁻¹`: `2 = 2¹` at 1, `−2 = −2·V(1) = −2·1` at −1; Hopf `1 + q² + q⁴ + q⁶`: `4 = 2²` at 1, `4 = −2·(−2)` at −1; `(−1)^c E(1)` matches both | holds | none |
| Description: "one reference added" (Bar-Natan 2002) and the conventions table "kept row for row" | references and conventions on main against the head | main cites Bar-Natan 2005 only, head both; 15 table rows on main, the same 15 at the head | agrees | none |

The rows of the previous reviews for the statements this round does not touch stand as in the previous review, of `86c2866`.

- Source locators checked against the text this round: 3 (Kho99 line 697, equation (45); Kho99 line 1303, equation (134); Kho99 lines 1595–1596, Proposition 28). The seeded sample falls in no changed passage: the folder did not change.
- Library declarations opened at the pins: none new; no statement changed.
- Cross-roadmap citations resolved: the citations of this roadmap's former ids by Foams, DiagrammaticCoherence, SpectralSequencesAndConvergencePartII and DerivedModuleAlgebra on main and by the open CombinatorialHeegaardFloer; each former id is mapped by the README's sentence on the former numbering.
- Automatic checks: all passed on this head. Dependency check, rerun: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings (lines 57, 70, 81, 112, 143) and nothing else; the file is unchanged, so the eight elaborated signatures and the one-tactic probes of the earlier reviews stand.
- Headlines and padding: no statement changed.
- Description against the head: every sentence checked above agrees; no section, declaration or supplier is added or dropped that it leaves unstated.

Overlap check: read Foams, DiagrammaticCoherence and CombinatorialHeegaardFloer (their citations of this roadmap); GeometricTopology's scope was read in the earlier reviews and not again; link cobordisms, §7.1 here and §6.5 of GeometricTopology's open revision (D01); nothing else shared.

Source independence: changed passages only; the folder did not change, so 0 passages were compared with 0 sources, none shared; largest share Kho99, 9 of 19 parenthetical locators in the layers, as in the previous review; no layer was added, removed or reordered, so the contents were not compared again (previous result: independent).

Research link: Reidemeister invariance and functoriality (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) are what Rasmussen's invariant (2010) is built on; GeometricTopology on main names that invariant, built on this roadmap, for Piccirillo's theorem that the Conway knot is not slice. Rests on the README's references and GeometricTopology's README on main.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 and Ch. 5 (§8.6): books outside the manifest; not opened; unchanged text.
- Carter–Saito 1993, Roseman and Carter–Rieger–Saito (§7.5): paywalled articles outside the manifest; unchanged text.
- The clasp frame of §8.3: the pin has no plane data to check it against (see the question).

## Source issues

- **Misprint** in Kho99 at Proposition 28 (§7.2, equation (155), page 41 of the arXiv copy): the source says reversing one component shifts both degrees up by `2l`; it should be `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`, as its equations (45) and (134) give; affects nothing.

## For the human reviewers

- none
