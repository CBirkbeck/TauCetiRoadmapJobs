# Review of ComplexManifolds (pull request #2549 at fc445b9)

**Verdict:** accepted

**Summary.** Accepted: the two added lines put an explicit anchor with the old Milestone 1 fragment in front of the Layer 1 heading, so the one link another roadmap makes into this README (MorseTheory) resolves again without a change there; no statement, hypothesis or supplier is touched, and the previous review left no finding open. There is one small correction (a sentence of the pull request's description now says the opposite of the head) and no format note. For the human reviewers: seven of the eight cited textbooks cannot be read legally here.

## C01 — The description still says MorseTheory's link is broken until MorseTheory changes, but the head keeps the old anchor

A reader of the description would conclude that merging this pull request breaks a link on main and that MorseTheory must be edited first or after. The description says: "with the heading renamed, that link resolves only once MorseTheory points it at `#layer-1-restriction-of-scalars-and-atlas-transport`". At this head, line 104 of `TauCetiRoadmap/ComplexManifolds/README.md` is `<a id="milestone-1-restriction-of-scalars-and-atlas-transport"></a>`, directly before `## Layer 1: restriction of scalars and atlas transport`; the fragment of MorseTheory's link (`TauCetiRoadmap/MorseTheory/README.md` line 1216 on main, line 833 in its open revision) is that id, character for character, and it is the only fragment by which any roadmap, on main or in an open pull request, links into this README.

The sentence would be right as: "MorseTheory links the old heading anchor `#milestone-1-restriction-of-scalars-and-atlas-transport`; the README keeps that anchor in front of the Layer 1 heading, so the link resolves unchanged."

## Questions for the author

- Carried from the previous review, the text being unchanged: the contract for SmoothBundlesConnections §B2.1 assumes its tensor and exterior-power carriers are "generic over the field", while §B2.1 on main discusses complex bundles only over a real base. Is the generic-field form agreed with that roadmap? Its text alone does not settle it.

## Previous findings

- none: the previous report (of `d33ec3d`) raised no finding, small correction or format note; its three repaired points (the Hausdorff hypothesis of §7.6, the by-definition status of §1.4 and §4.5, the second Check of §7.4) are in text this change does not touch.

## Deferred findings

- D01 — resolved: README line 104 keeps the id `milestone-1-restriction-of-scalars-and-atlas-transport` before the Layer 1 heading, so MorseTheory's link resolves without a change there.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
|---|---|---|---|---|
| The kept anchor (line 104) | MorseTheory's link on main (line 1216) and in its open revision (line 833) | id `milestone-1-restriction-of-scalars-and-atlas-transport` / link fragment: the same string; slug of the old heading "Milestone 1: restriction of scalars and atlas transport": the same | holds | none |
| "Milestone `k` is Layer `k`" (line 56), which the anchor serves | `k = 1` | anchor sits directly before `## Layer 1: restriction of scalars and atlas transport`, same title after the first word / old heading `## Milestone 1: …` | agree | none |
| Coverage of "the section anchors other roadmaps use" | all `ComplexManifolds/README.md#…` links on main and at the open heads | fragments found: 1 distinct (the Milestone 1 one, twice: main and one open head) / anchors kept: 1 | complete | none |
| §1.1 Check (first statement after the anchor) | `z ↦ z̄` on `ℂ` | real Jacobian `diag(1, −1)`, invertible, `C^∞` / `∂z̄/∂z̄ = 1 ≠ 0`, not holomorphic; so the real groupoid is strictly larger | holds | none |
| §1.2 realification of maps, cited by the Layer 1 introduction | pinned Tau Ceti | README: `ContMDiffAt/On/ContMDiff.restrictScalars` / `Geometry/Manifold/ContMDiff/RestrictScalars.lean:61, 67, 73` | present | none |

The rows for untouched statements stand as in the previous review, of `d33ec3d`.

- Source locators checked against a text: 0; the change adds no mathematical text and no locator, and the seeded sample does not fall in it.
- Library declarations opened at the pins: Tau Ceti `Geometry/Manifold/ContMDiff/RestrictScalars.lean:53–73`, `Geometry/Manifold/Diffeomorph/RestrictScalars.lean:60`.
- Cross-roadmap citations resolved: 1 (MorseTheory's link, on main and at its open head); a search of main and of the open heads finds no other link fragment into this README.
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: run again on this head, all passed. `Suggested.lean` (unchanged: `import Mathlib` and a module docstring) elaborates with no output; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- Nothing changed outside the folder. The diff against `d33ec3d` is the two inserted lines only.
- The lead that `MulAction.isManifold_quotient_of_contMDiffConstSMul` (line 1189) is found nowhere at the pins: the reference list names it as a declaration of the cited Mathlib pull request, not as a pinned one; no claim about the pins is made.
- The pull request's description read against the head: one sentence contradicted (C01); the rest stands as in the previous review.

Overlap check: read ComplexTori (main and its open revision), ComplexKahlerGeometry (main and its open revision), SmoothBundlesConnections, DifferentialGeometry; nothing shared beyond what the previous review recorded (quotients, gluing, §7.4 and §7.6 owned here; tensor and exterior-power carriers owned by SmoothBundlesConnections §B2.1), and the change moves no ownership.

Source independence: changed passages only; the two added lines are an HTML anchor and a blank line, so 0 passages of prose were there to compare with the 2 readable sources; largest share demailly-agbook, 4 of 15 in-text locators; the change adds, removes or reorders no layer, so the contents comparison stands: independent. The seven other texts could not be read.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7; Layer 7's divisor, normal and canonical bundles are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. Rests on the README and demailly-agbook.

## Not verifiable

- That the hosting site's Markdown renderer turns an inline `<a id="…">` into a working link target: checked only against its documented behaviour and the two roadmaps on main that already use explicit anchors, not in a rendered page.
- The chapter-level locators of the seeded sample (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Bourbaki, Steenrod) are in untouched text and remain unread, as in the previous review: the texts are paywalled and not in the sources cache.

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here; wording and arrangement were compared only with demailly-agbook (4 locators) and mathlib4-pr-40727.
