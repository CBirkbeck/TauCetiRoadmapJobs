# Review of ComplexCurveModuli (pull request #2548 at a105758)

**Verdict:** accepted

**Summary.** Accepted: the five changed lines repair the one small correction of the previous review (the Dependencies list of Layer 0 now names RiemannianManifoldsWithConvexBoundary §1.4) and add an anchor before the Layer 0 heading that keeps the old fragment `#d0-smooth-curves-finite-type-and-the-classification-floor`, so ConformalMappingPartII's link resolves again without a change there. No statement changed and there is no finding. There is one small correction (the description still says that this link breaks and that an anchor cannot be used) and one carried question about the cited version of Wendl's notes; neither blocks. Nothing is left for the human reviewers to decide.

## C01 — The description says that ConformalMappingPartII's link breaks and that an anchor tag cannot be used, and the head now has that anchor

A reader of the description would go and repoint a link that no longer needs it. The description says: "One link breaks: ConformalMappingPartII (README line 25) links to the old heading anchor `#d0-smooth-curves-finite-type-and-the-classification-floor`. The project gate refuses HTML anchor tags in a README, so the link has to be repointed in ConformalMappingPartII". At this head README line 127 is `<a id="d0-smooth-curves-finite-type-and-the-classification-floor"></a>`, directly before "## Layer 0: smooth surfaces, compact Riemann surfaces and uniformization" (line 129); its id is, character for character, the fragment of the link at ConformalMappingPartII README line 25 on main, and the project's checks pass on this head with the anchor in place.

The paragraph would be right as: "No link breaks: ConformalMappingPartII (README line 25) links to the old heading anchor `#d0-smooth-curves-finite-type-and-the-classification-floor`, and an anchor line with that id stands before the Layer 0 heading, so the link still lands on Layer 0."

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2; there the offset map `Diff^(k+1,p) × T → J^(k,p)` is in the proof of Theorem 4.30 (Wendl lines 5743–5761). Does version 3.3 keep this numbering? Version 3.3 could not be read; if it cannot be checked, citing version 3.2 (arXiv v2) would make the locator verifiable. (Carried from the earlier reviews; the passage is unchanged.)

## Previous findings

- The previous review raised no finding. Its small correction C01 is repaired: the Dependencies of Layer 0 now read "PDE §§1.1, 1.4, 1.7; RiemannianManifoldsWithConvexBoundary §1.4 (the second fundamental form of the boundary, for §0.4); DifferentialGeometry Layer 3".

## Deferred findings

- D01 — resolved: README line 127 carries an anchor with the old Layer 0 fragment as its id, so ConformalMappingPartII's link at its line 25 resolves unchanged.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4, cited by the changed Dependencies clause: acceleration of a unit-speed boundary curve has inward normal component `II(γ′, γ′)` | closed unit disc, γ = (cos t, sin t); flat cylinder `S¹ × [0, 1]` | disc: γ″ = −γ = ν_in, component 1; supplier §1.4 gives `II = ⟨∇_X Y, ν_in⟩ = ⟨X, Y⟩` = 1. Cylinder: γ″ = 0, II = 0 | true; sign agrees with the supplier's ball Check | none |
| Layer 0 Dependencies clause "RiemannianManifoldsWithConvexBoundary §1.4 (the second fundamental form of the boundary, for §0.4)" | the five places that name this supplier | lines 321, 346, 419, 1808, 2031 all name §1.4; the supplier's README on main has "### 1.4 The second fundamental form" at line 563 | the list is complete and the citation resolves | none |
| Anchor line before the Layer 0 heading | the old heading "D0. Smooth curves, finite type and the classification floor" slugged; the link on main | slug `d0-smooth-curves-finite-type-and-the-classification-floor` = the anchor's id = the fragment at ConformalMappingPartII line 25 (main and its open head, line 1097) | the link lands on Layer 0 | C01 (description only) |

The rows for the untouched statements stand as in the previous review, of `539eb83`.

- Changed passages: two (the anchor line at README line 127, the Dependencies clause at lines 419–420); `Suggested.lean` is unchanged. No source locator was added or changed, and none of the seeded sample's targets falls in the changed passages.
- Cross-roadmap citation resolved on main: RiemannianManifoldsWithConvexBoundary §1.4 (README line 563, Conventions line 179 for the sign); the roadmap is on main and is line 14 of the merge order. Links into this README with a fragment, searched on main and at the open heads: one, from ConformalMappingPartII, to the Layer 0 anchor; no other old heading anchor is linked.
- Dependency check output: `depcheck: 182 roadmaps, 2073 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/ComplexCurveModuli/`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else.
- Pull-request description against the head: one paragraph out of date (C01); the supplier list in it already names RiemannianManifoldsWithConvexBoundary; the remaining sentences are as checked in the previous review and the change touches none of them.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and HeegaardFloer (main and open heads) and TeichmullerGeometry (main), as in the previous review; nothing shared, and the change adds no object. The overlap listing shows no open pull request changing this roadmap, no cited id dropped and no id dropped here that others cite.

Source independence: changed passages only; 2 passages compared (the anchor line and the Dependencies clause, against RiemannianManifoldsWithConvexBoundary §1.4, no source text involved), none shared; largest share RobbinSalamon2006, 21 of 24 body locators, unchanged; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; not read. The changed passages do not cite it.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read in an earlier review (see the question above).
- That the hosting site scrolls to an `<a id>` anchor of a rendered README was not tested on the site; the id was compared with the link's fragment.

## Source issues

- none

## For the human reviewers

- none
