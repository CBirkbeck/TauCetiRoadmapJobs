# FIX-DESIGN-QuasiregularMaps~3

Repair round on the review `REV-DESIGN-QuasiregularMaps~2` (one P3 finding). Files edited:
`packages/QuasiregularMaps/design/README.md` and `packages/QuasiregularMaps/design/plan.json`.
`packages/QuasiregularMaps/sources.toml` is unchanged: no locator was added or changed.

## F01 (P3) — applied

Verified. On main, `TauCetiRoadmap/DifferentialGeometry/README.md` has Layers 6–9 (de Rham
complex, Mayer–Vietoris, de Rham theorem, Poincaré duality) at lines 782–862. At the head of the
open DifferentialGeometry revision (a565de6) the layers run 0–5, 5.6, 12. Its "Relation to
sibling roadmaps" hands de Rham cohomology, the de Rham theorem, Poincaré duality, Sard and the
degree to DeRhamCohomologyAndDuality. At that roadmap's own head (d5b0c05), its Scope imports the
same objects back as "DifferentialGeometry layers 6–10". So the numbers break whichever revision
merges, and the object has to be named instead.

Downstream consumers, Part III: "consumes Part II, DifferentialGeometry Layers 6–9 and
SobolevDifferentialForms" → "consumes Part II, de Rham cohomology with the de Rham theorem and
Poincaré duality, and SobolevDifferentialForms".

**Pattern.** The same open revision also drops DifferentialGeometry 10.2 (Sard, with
`IsNullSet` through charts). This README cited 10.2 for chartwise null sets in two places, and the
overlaps lead did not list it. What this roadmap uses is `TauCeti.IsNullSet` and its two lemmas,
which exist at the pin (`TauCeti/Geometry/Manifold/Measure.lean` lines 36, 72, 89) and are already
in the README's "From Tau Ceti" contract. The changes:
- Scope bullet: "chartwise null sets (10.2)" is removed from DifferentialGeometry's list. In its
  place: "Chartwise null sets are already in Tau Ceti (`TauCeti.IsNullSet`) and are consumed from
  there."
- "From TauCetiRoadmap.DifferentialGeometry": the bullet "Layer 10.2: chartwise null sets" is
  deleted.
- `plan.json` suppliers, DifferentialGeometry: "Layer 10.2" is removed from `sections`, and
  `what` now says that null sets come from Tau Ceti.

No statement, hypothesis, Check or dependency changes: every `*Needs:*` line already cites the
Tau Ceti names (§2.5, §2.7, §6.1, §6.3).

The other DifferentialGeometry ids this README cites (2.1, 2.2, 12.1, 12.4, Layer 2) are present
at main, at a565de6 (2.1 "Orientations", 2.2 "Preserving maps and top forms", 12.1 with `Opens`
metrics, 12.4 with `TauCeti.riemannianVolume`) and at 66ed0d4 (a Tau Ceti bump that keeps the
main numbering). The draft DifferentialGeometry head (a01a8ad) is the exception: see the notes
for the maintainer. The other
cited ids are present at every open head of their roadmaps: GeometricTopology Layer 11 (heads
of four open pull requests), RiemannianGeometry R4 item 7 (three heads) and TeichmullerGeometry
§7.4.

## Adversarial pass (changed passages)

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| Part III consumer sentence | main DG (Layers 6–9 at 782–862); DG head a565de6 (layers 0–5, 5.6, 12); DeRhamCohomologyAndDuality head d5b0c05 (imports DG 6–10) | old ids: 4 present on main, 0 at a565de6; new sentence: 0 numbered ids | old breaks if a565de6 merges; new holds at every copy | applied |
| Null sets owned by Tau Ceti | `TauCeti.IsNullSet` at the pin: every chart image is null for every Haar measure on the model. Test `M = ℝ`, `s = {0}` and `s = (0,1)`; `M = ∅` | `{0}`: Lebesgue measure `0` in every chart, so null; `(0,1)`: measure `1 ≠ 0`, not null, interior `(0,1) ≠ ∅`, consistent with `interior_eq_empty`; `∅`: vacuously null | matches README "From Tau Ceti" (closed under countable unions by `IsNullSet.iUnion` :72; empty interior with `[FiniteDimensional ℝ E]` :89) | applied |
| Remaining DG citations 2.1, 2.2, 12.1, 12.4 | main; a565de6; 66ed0d4 | present: 4/4 on main, 4/4 at a565de6 (lines 478, 487, 1210, 1241), 4/4 at 66ed0d4 | hold | none |

## Checks

Dependency check (the gate command of the brief), run after the edits:

```
candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that resolves
  nowhere.
- `plan.json` parses.
- `roadmaps overlaps QuasiregularMaps` cannot run on a board package ("no roadmap
  QuasiregularMaps on main or in an open roadmap pull request"). The open heads above were read
  directly with `roadmaps show --pr`.
- No `Suggested.lean` at the design stage, so there was no `#check` comparison and no
  elaboration.

## Notes for the maintainer

- No name that other roadmaps cite changed. This design drops no id.
- No id here is one that only an open revision defines.
- The two numbered citations that had broken (DG 6–9 and 10.2) are gone, so this roadmap does
  not depend on how the DifferentialGeometry and DeRhamCohomologyAndDuality pull requests settle
  ownership of de Rham theory between them.
- The draft DifferentialGeometry pull request (head a01a8ad, "Differential Forms & Smooth
  Flows") is an older complete rewrite. It is numbered by sections 1–13 and has no Layer 2 or
  Layer 12. Its "What this roadmap does not own" (its §2) excludes Riemannian geometry. If it
  merged, it would break every DifferentialGeometry layer citation in the repository, and here
  2.1, 2.2, 12.1 and 12.4. The overlaps lead does not list it, and nothing was changed for it.
  Every object this roadmap takes from DifferentialGeometry is implemented by a Tau Ceti
  declaration at the pin that the README already names (`TauCeti.Manifold.Orientation*`,
  `TauCeti.riemannianVolume`). Only the attribution would move; no statement would.
- `packages/QuasiregularMaps/target.md` still cites "DifferentialGeometry Layers 2, 6–8, 10, 12".
  That file is not editable in this job, and it is an input, not the roadmap.
- Ownership against open pull requests: checked with the tools over the open heads, for the
  objects these edits touch.
