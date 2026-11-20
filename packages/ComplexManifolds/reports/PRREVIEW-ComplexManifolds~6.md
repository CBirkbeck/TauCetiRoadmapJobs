# Review of ComplexManifolds (pull request #2549 at fc445b9)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review, which left no finding open, and this round read the pull request's description against the head and against the README on main. The description is accurate except for one omission: §6.3 (connectedness of a glued space) became an equivalence with a nonemptiness hypothesis, which the list of changed statements does not mention. That is the one small correction; there is no format note. For the human reviewers: seven of the eight cited textbooks cannot be read legally here.

## C01 — The description says no statement changed beyond its list, but §6.3 is now an equivalence over a nonempty index type

A reader who relies on "No other statement changed: every definition, statement and target of the old README is in the new one with the same hypotheses and conclusion" would not learn that the connectedness statement was strengthened, in the same way as §6.1 and §6.4, which the description does list. On main, item 3 of Milestone 6 (line 304 of `TauCetiRoadmap/ComplexManifolds/README.md` there) is an implication: connectedness follows from connected pieces whose nonempty-overlap graph is connected. At this head §6.3 (lines 672–675) says the glued space of nonempty connected pieces, over a nonempty index type, is connected exactly when the overlap graph is connected, which is the pinned `TopCat.GlueData.connectedSpace_iff_reflTransGen` (`TauCeti/Topology/Category/TopCat/GlueData.lean:249`, with `[Nonempty D.J]`). The new hypothesis is needed (over an empty index type the graph condition holds vacuously and the glued space is empty), and the converse is new. In the same way §4.4 gained the pinned converse `TauCeti.MulAction.compactSpace_orbitRelQuotient_iff_exists_isCompact` beside the old sufficiency statement.

A line under "Statements whose content changed" would make the text right, for instance: "Milestone 6.3 asked for connectedness from connected pieces with a connected overlap graph; §6.3 states the pinned equivalence, for nonempty connected pieces over a nonempty index type, and §4.4 adds the pinned converse of the compact-fundamental-domain criterion."

## Questions for the author

- Carried from the previous review, the text being unchanged: the contract for SmoothBundlesConnections §B2.1 assumes its tensor and exterior-power carriers are "generic over the field", while §B2.1 on main discusses complex bundles only over a real base. Is the generic-field form agreed with that roadmap? Its text alone does not settle it.

## Previous findings

- none: the previous report (of `fc445b9`) raised no finding. Its one small correction (C01, the description's sentence on MorseTheory's link) is repaired: the description now reads "the README keeps that anchor in front of the Layer 1 heading, so the link resolves unchanged", and line 104 of the README carries the id.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
|---|---|---|---|---|
| §6.3 connectedness, which C01 touches | two copies of `ℂ`, empty overlap; doubled origin; empty index type; two empty pieces | no edge, `ℂ ⊔ ℂ` disconnected: false/false; edge, connected: true/true; empty index: graph condition true, glued space empty, excluded by "nonempty index"; empty pieces excluded by "nonempty connected" | holds; agrees with pin line 249 | none in the README; description, C01 |
| §4.4 compact quotients (C01) | `ℤ + ℤi` on `ℂ` with the unit square; `ℤ` on `ℂ` | square meets every orbit, torus compact / translations fix `Im z`, no compact set meets every orbit, cylinder not compact | both directions consistent with the pinned equivalence (`Topology/Algebra/GroupAction/Quotient.lean:132`) | none |
| §6.2 Hausdorff criterion, both forms, as the description states it | doubled origin; two copies of `ℂ` glued by `z ↦ 1/z` | `chartRel 0 1 = {(z, z) : z ≠ 0}`, closure contains `(0,0)`: not closed, not Hausdorff / `{(z, w) : zw = 1}` closed in `ℂ × ℂ`, sphere Hausdorff | holds; pins `GlueData.lean:71, 82`, Mathlib `Hausdorff.lean:171`, no hypothesis on pieces | none |
| §2.3 factor interchange, "+1" in the description | `m = m' = 1` | `(x₁,y₁,x₂,y₂) ↦ (x₂,y₂,x₁,y₁)` is two transpositions, sign `+1` / `(−1)^(2·2) = +1`; `(−1)^(mm') = −1` rejected | holds | none |
| Kept anchor (line 104), as the description states it | MorseTheory's link on main (line 1216) | id `milestone-1-restriction-of-scalars-and-atlas-transport` / link fragment: the same string | resolves | none |
| Description's counts | Checks; removed imports; removed declarations | 30 Check bullets in 25 lists / "30 Checks"; old file: 7 Mathlib submodule and 3 Tau Ceti imports / "seven … and three"; 13 named declarations and 2 examples removed / all 13 named | agree | none |

The rows for untouched statements stand as in the previous review, of `fc445b9`.

- Source locators checked against a text: 0; the folder did not change and the seeded sample falls in no changed passage. The description's four Demailly locators are the README's (lines 831–832, 856, 872, 1175), verified in earlier rounds.
- Library declarations opened at the pins: 26 named in the description or the module docstring were located, among them Tau Ceti `Topology/Category/TopCat/GlueData.lean:71, 82, 227, 249`, `Geometry/Manifold/ModelWithCorners/LinearEquiv.lean:47, 81`, `Geometry/Manifold/Algebra/SMul.lean:105`, `Geometry/Manifold/Complex/Orientation.lean:216`, `Topology/Maps/Proper/LocalAtTarget.lean:39`; Mathlib `Topology/Separation/Hausdorff.lean:171`, `Geometry/Manifold/ChartedSpace.lean:590`.
- Cross-roadmap citations resolved: 1 (MorseTheory's link into this README, on main).
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: run again on this head, all passed. `Suggested.lean` (`import Mathlib` and a module docstring) elaborates with no output; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- The description against the old README on main: Milestones 1–7 read item by item against Layers 1–7. The listed changes (Layer 7 introduction, §2.3, §6.1, §6.2, §6.4, the ConformalMapping sentence) are as described; §7.6's explicit Hausdorff hypothesis was already Milestone 4's standing `T2Space M`; the one unlisted change is C01.
- Nothing changed outside the folder.
- The lead that `MulAction.isManifold_quotient_of_contMDiffConstSMul` (line 1189) is found nowhere at the pins: the reference list names it as a declaration of the cited Mathlib pull request, not as a pinned one.

Overlap check: read ComplexTori, ComplexKahlerGeometry, SmoothBundlesConnections, DifferentialGeometry; nothing shared beyond what the previous reviews recorded (quotients, gluing, §7.4 and §7.6 owned here; tensor and exterior-power carriers owned by SmoothBundlesConnections §B2.1; the orientation carrier by DifferentialGeometry Layer 2), and no ownership moved.

Source independence: changed passages only; the folder has 0 changed lines, so 0 passages were there to compare with the 2 readable sources; largest share demailly-agbook, 4 of 15 in-text locators; no layer added, removed or reordered, so the contents comparison stands: independent. The seven other texts could not be read.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7; Layer 7's divisor, normal and canonical bundles are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. Rests on the README and demailly-agbook.

## Not verifiable

- That the hosting site's Markdown renderer turns an inline `<a id="…">` into a working link target: checked only against its documented behaviour, not in a rendered page.
- The chapter-level locators of the seeded sample (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Bourbaki, Steenrod) are in untouched text and remain unread: the texts are paywalled and not in the sources cache.
- The part of the description after the generated blocks, if any was cut from the quoted text, was not read.

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here; wording and arrangement were compared only with demailly-agbook (4 locators) and mathlib4-pr-40727.
