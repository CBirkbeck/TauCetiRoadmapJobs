# Review of EllipticCurves (pull request #3181 at bd50e0d)

**Verdict:** accepted

**Summary.** An incremental re-review of the 24 lines changed since `a37cbe8`. The one finding of the previous review is repaired: both Layer 7 notes now give the finite-level comparison and inflation–restriction to ProfiniteCohomology, and the citation (Layers 4 and 10, §9.4, §5.4) resolves on main and at the pinned Tau Ceti. No finding remains; there are two small corrections and one format note, all carried over on text this change does not own, none blocking. One licence question, carried over, is left to a human.

## C01 — `Suggested.lean` has eleven definitions whose body is `sorry` (carried over, untouched text)

For a separate pull request. `baseChange` (line 220), `comp` (243), `toPointHom` (276), `frobeniusIsogeny` (295), `weilPairing` (347), `obstructionExponentAt` (575), `minimalDiscriminantIdeal` (610), `weierstrassDefectClass` (624), `globalMinimalityClass` (640), `quadraticTwist` (934) and `quadraticTwistPointEquiv` (954) are data with body `sorry`, so every theorem that mentions them states nothing definite. This change does not touch them, and the other open revision of this roadmap (#2483) replaces the file.

## C02 — The README's remarks on what the pinned libraries have are out of date (carried over)

`README.md` lines 287–289 say `Height/EllipticCurve.lean` "is **newer than this roadmap's Mathlib pin** `9caeba10` and so is not consumable"; the pinned Mathlib is `1b1ccf4` and has `Mathlib/NumberTheory/Height/EllipticCurve.lean`. In the Layer 7 dependency note, the sentence this change re-flowed still says of the Galois packaging "none of it upstream yet: profinite Galois groups acting continuously on discrete modules such as `E(Kˢᵉᵖ)`" (lines 1366–1367); the pinned Tau Ceti has that module (`WeierstrassCurve.PointCoeff`, `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Coefficients.lean:118`) and files `Restriction.lean`, `Unramified.lean`, `Selmer/` beside it. Naming them on `*In Tau Ceti:*` lines in the Layer 7 items, and dropping "none of it upstream yet", would make the note true at the pin; it can go with the other revision.

## N01 — Points of form in untouched text (carried over)

`README.md` lines 1191 and 1743 carry a pull-request number ("#1088"); the name `weierstrassClass_eq_inv_weierstrassDefectClass` at line 995 is in code font but declared nowhere, so a reader cannot tell it is a proposed name.

## Previous findings

- R01 — repaired: "The finite-level comparison (`H¹` as the colimit over finite Galois quotients) and inflation–restriction … are ProfiniteCohomology's (Layers 4 and 10, §9.4, §5.4)" in `README.md` 1364–1366 and `Suggested.lean` 1011–1012; the layer keeps the elliptic part.
- C01 — repaired: the description now says "Whichever merges second is rebased on the other and keeps this change's Layer 7 (no new cohomology constructor)".
- C02 — not repaired (untouched text): the eleven `sorry`-bodied definitions stand; written again as C01.
- C03 — not repaired: the pin `9caeba10` and "none of it upstream yet" stand; written again as C02.
- N01 — repaired: line 299–300 now reads "`Mathlib/RepresentationTheory/Homological/ContCohomology/`, R. Hill, A. Yang and E. Xie", the authors of `Basic.lean` at the pin.
- N02 — not repaired (untouched text): written again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Finite-level comparison is ProfiniteCohomology's, Layer 4, §10.1, §9.4 (`README.md` 1364–1366; `Suggested.lean` 1011–1012) | ProfiniteCohomology on main, lines 872, 1976, 2201; pin `FiniteQuotient/AllDegreeColimit.lean:402`; `G` finite discrete | Layer 4: colimit over open normal subgroups; §9.4: same system indexed by finite Galois subextensions; `G` finite: `U = 1` is terminal, colimit is `Hⁱ(G, M)` | citation says what is cited | none |
| Inflation–restriction is ProfiniteCohomology's §5.4 (same lines) | main line 1141; pin `Inflation/Basic.lean:353`; `G = N = ℤ/2`, `M = ℤ/2` trivial | `0 → H¹(1, M) = 0 → H¹(G, M) = ℤ/2 → H¹(N, M) = ℤ/2`, restriction the identity, kernel `0` = image of inflation | exact; citation resolves | none |
| The two notes against the head of Layer 7 (1278–1281) | head of layer; README 1364–1368; `Suggested.lean` 1009–1016 | all three: colimit and inflation–restriction supplied by ProfiniteCohomology; this layer: coefficient modules, Kummer map, local conditions | consistent | none |
| Credit for Mathlib's continuous cohomology (299–300) | pinned Mathlib `1b1ccf4`, `ContCohomology/Basic.lean:4`, `LowDegree.lean:4` | "Authors: Richard Hill, Andrew Yang, Edison Xie" in both | credit right | none |

The rows of the previous review, of `a37cbe8`, for the untouched statements stand as written there.

- Source locators checked against a text: 0; the changed passages cite no source, and no target of the seeded sample falls in changed or affected text.
- Library declarations opened at the pin: Mathlib `ContCohomology/Basic.lean:4`; Tau Ceti `FiniteQuotient/AllDegreeColimit.lean:402`, `Inflation/Basic.lean:353`, `EllipticCurve/GaloisCohomology/Coefficients.lean:118`.
- Cross-roadmap citations resolved: 1 (ProfiniteCohomology Layers 4, 10, §9.4, §5.4, on main); ProfiniteCohomology's README does not cite EllipticCurves, so no cycle.
- Dependency check: `depcheck: 2 roadmaps, 6 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: `sorry` warnings only (50); the change touches one comment, no declaration, so no signature changed and no one-tactic probe was due.
- Outside the folder the pull request changes only `TauCetiRoadmap/GlobalGaloisDeformations/README.md`, its own.
- Pull-request text against the head: the title and the EllipticCurves paragraph agree with the diff, including the new sentence on the two notes, the authors, and the order against #2483.
- The record: 12 layers at the merge base, 12 at the head, no heading or declaration removed.

Overlap check: read HyperellipticCurves, EllipticCurvePeriodsAndModularParametrizations, EffectiveDiophantineMethods (main), NeronModelsAndSemistableAbelianVarieties (open), and ProfiniteCohomology (main) as the cited supplier; the finite-quotient colimit and inflation–restriction of continuous cohomology: ProfiniteCohomology owns, this roadmap consumes, and now says so everywhere; nothing else shared by the change. The other open revision of this roadmap (#2483) conflicts in both files; the description states the order.

Source independence: changed passages only: 3 passages (`README.md` 298–301, 1364–1369; `Suggested.lean` 1011–1016) compared with 0 sources, since they cite none; largest share AEC, text not read; no layer added, removed or reordered, so the contents were not compared.

Research link: Layers 6 and 7 state the Mordell–Weil theorem, Selmer groups and `Ш` (Silverman 2009), with Selmer structures after Rubin (2000) and Cassels' isogeny invariance of the Birch–Swinnerton-Dyer quotient (Cassels 1965); Layer 8 follows Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016). Rests on the README's statement of purpose and its references.

## Not verifiable

- AEC, the source with the largest share of locators: not in the sources cache; no changed passage cites it.

Automatic checks set aside as false positives: the four hits on the word "TODO" (README lines 292, 1213, 1219, 1849) describe a Mathlib file's own list, not this roadmap's process; the TeX-subscript hit at README line 740 lies inside a code span that runs over two lines; the hits on a `Nonempty` conclusion and on a chosen datum in `Suggested.lean` (lines 336, 1082) are untouched statements the earlier reviews passed.

## Source issues

- none

## For the human reviewers

- Licence: carried over, untouched here: the README takes the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; the same structure is in pinned Tau Ceti (`Isogeny/Basic.lean:139`).
- Not tested: AEC holds the largest share of the README's locators and could not be read; no changed passage cites it.
