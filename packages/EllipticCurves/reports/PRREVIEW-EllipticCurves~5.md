# Review of EllipticCurves (pull request #3181 at a37cbe8)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 48 changed lines since `13a2ad8`. The new definition of the Layer 7 cohomology (Mathlib's `continuousCohomology` on `TauCeti.ofDiscreteModule ℤ G (TauCeti.ForcedDiscrete M)`) was checked against the pins and elaborates, and the cited ProfiniteCohomology layers resolve on main; one finding remains: the changed Layer 7 notes still say that this layer builds the finite-level comparison and inflation–restriction, which the changed head of the layer gives to ProfiniteCohomology. There are three small corrections (two on untouched text) and two format notes, none blocking; one licence question, carried over, is left to a human.

## R01 (P2) — The Layer 7 notes still make this layer the builder of the finite-level comparison and of inflation–restriction, which the new head of the layer assigns to ProfiniteCohomology

An implementer who reads the Layer 7 note of `Suggested.lean` is told to build again what ProfiniteCohomology on main owns and the pinned Tau Ceti already has, and the two changed passages contradict each other. The head of Layer 7 (`README.md` lines 1278–1281) now says the "finite-Galois-quotient colimit" is "API of this object, supplied by ProfiniteCohomology Layers 2, 3, 4 and 10". But the note this pull request rewrote in `Suggested.lean` (lines 1011–1014) says "What the layer builds is the **Galois-specific packaging** on top: profinite Galois modules with the finite-level comparison, … inflation–restriction there"; on main that sentence began "What gates this layer", a prerequisite, not a claim to build. The dependency note of the README (lines 1363–1367, the sentence the change re-flowed) likewise lists, as packaging "none of it upstream yet", the "finite-level comparison (`H¹` as the colimit over finite Galois quotients)" and "inflation–restriction in that continuous setting", and ends "The layer is stated against that packaging once it exists" (lines 1376–1377).

ProfiniteCohomology on main owns each: the colimit over open normal subgroups in its Layer 4 and §10.1, its reading as the system of finite Galois subextensions in §9.4, inflation–restriction in §5.4. At the pin they exist: `TauCeti.ContCohomology.continuousFiniteQuotientColimit` (`TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/AllDegreeColimit.lean:402`) and `explicitInfRes_exact` (`…/ContCohomology/Inflation/Basic.lean:353`).

The smallest change: in the `Suggested.lean` note, say that the finite-level comparison and inflation–restriction are ProfiniteCohomology's (Layers 4 and 10, §9.4, §5.4) and that what this layer builds on top is the elliptic part: `E[m]` and `E(Kˢᵉᵖ)` as such coefficient modules, the Kummer connecting map for `[m]`, and the local conditions at the places of `K`. In the README's dependency note, move the same two items out of the list of what is missing, with the same citation.

## C01 — The description does not say how this change is ordered against the other open revision of this roadmap

Pull request #2483 also revises `TauCetiRoadmap/EllipticCurves/README.md` and `Suggested.lean`, and the two heads conflict in both files; at its head the Layer 7 passages still carry the old wording ("the **first named milestone of this layer is the constructor**", "Mathlib does not have this constructor"). Whichever merges second must be rebased, and if #2483 merges second without care it restores the constructor this change removes. One sentence in the description saying which is rebased on which would settle it; since this change is 48 lines, rebasing it on #2483 is the cheaper order.

## C02 — Untouched text: `Suggested.lean` has eleven definitions whose body is `sorry`

For a separate pull request. `baseChange` (line 220), `comp` (243), `toPointHom` (276), `frobeniusIsogeny` (295), `weilPairing` (347), `obstructionExponentAt` (575), `minimalDiscriminantIdeal` (610), `weierstrassDefectClass` (624), `globalMinimalityClass` (640), `quadraticTwist` (934) and `quadraticTwistPointEquiv` (954) are data with body `sorry`, so every theorem that mentions them states nothing definite. This change does not touch them, and the other open revision of this roadmap replaces the file.

## C03 — Untouched text: the README's Mathlib pin and its remark on the height file are out of date

For a separate pull request. `README.md` lines 287–289 say `Height/EllipticCurve.lean` "is **newer than this roadmap's Mathlib pin** `9caeba10` and so is not consumable"; the pinned Mathlib is `1b1ccf4` and has `Mathlib/NumberTheory/Height/EllipticCurve.lean`. In the same way the pinned Tau Ceti now has much of Layer 7's elliptic packaging (`TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/`, with `Coefficients.lean`, `Restriction.lean`, `Unramified.lean`, `Selmer/`), which the layer's items could name on `*In Tau Ceti:*` lines.

## N01 — The credit for Mathlib's continuous cohomology was dropped with the path

Main's line read "(`Mathlib/Algebra/Category/ContinuousCohomology/`, R. Hill and A. Yang)"; the corrected path at line 299 has no names. The file at the pin lists Richard Hill, Andrew Yang and Edison Xie; the credit would fit after the new path.

## N02 — Untouched text: points of form

`README.md` lines 1190 and 1742 carry a pull-request number ("#1088"); the name `weierstrassClass_eq_inv_weierstrassDefectClass` at line 994 is in code font but declared nowhere, so a reader cannot tell it is a proposed name.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `H^i(G, M)` is `continuousCohomology i (TauCeti.ofDiscreteModule ℤ G (TauCeti.ForcedDiscrete M))` (README 1271–1273) | a one-off probe file with `[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [AddCommGroup M] [DistribMulAction G M]`; `G = 1` | elaborates, type `TopModuleCat ℤ`; `G = 1`: invariants of the resolution give `M, M, …` with differentials `0, id, 0, …`, so `H⁰ = M`, `Hⁱ = 0` | well-typed at the pins | none |
| "`ForcedDiscrete M` is the type synonym of `M` carrying the topology `⊥`" (1274) | pin `TauCeti/Topology/Algebra/GroupAction/ForcedDiscrete.lean:69, 77` | `@[expose] def ForcedDiscrete M := M`; `instance : TopologicalSpace (ForcedDiscrete M) := ⊥`; a `def`, so the `p`-adic topology of `K̄ˣ` is not found by instance search | true | none |
| `continuousSMul_iff` "turns open stabilisers into continuity" (1277) | `#check` at the pin (line 110); trivial action; index-2 non-open stabiliser | `ContinuousSMul G (ForcedDiscrete M) ↔ ∀ x, IsOpen (stabilizer G x)`, needs `IsTopologicalGroup G`; trivial action: stabiliser `G`, open, both sides true; non-open stabiliser: both false | an iff, both directions | none |
| Open stabilisers is a prose hypothesis, not forced by the expression | signature of `TauCeti.ofDiscreteModule` (`SmoothDiscrete/Basic.lean:211–223`) | no `ContinuousSMul G M` binder; the object exists for a discontinuous action and is then not smooth (file docstring) | README states the hypothesis in the sentence (1271–1272); consistent | none |
| Mathlib path (README 298–299) | pinned Mathlib `1b1ccf4` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` declares `_root_.continuousCohomology`; `Mathlib/Algebra/Category/ContinuousCohomology/` does not exist | new path right, old one wrong | none |
| "supplied by ProfiniteCohomology Layers 2, 3, 4 and 10" (1279–1280) | ProfiniteCohomology README on main | Layer 2 explicit `C¹, C², Z, B, H` (line 601); §3.2 inhomogeneous against canonical, degrees 0, 1, 2 (734); Layer 4 colimit in degrees 0, 1, 2 (872); §10.1 all degrees (2201) | each layer says what is cited | none |
| Finite-level comparison and inflation–restriction: who builds them (R01) | `Suggested.lean` 1011–1014, README 1363–1367 against README 1278–1281; main's wording of the same sentences | head of layer: supplied by ProfiniteCohomology; notes: "the layer builds", "none of it upstream yet"; main had "What gates this layer" | two owners in the changed text | R01 |
| The record: Layer 7's first milestone | README at `13a2ad8` lines 1269–1276 against head 1270–1281 | 12 layers at base, 12 at head, no heading changed; the statement (open stabilisers, bare group, discrete topology imposed, `K̄ˣ` case, locally constant cochains, finite-quotient colimit) is kept and now names the declarations that realise it | item kept with its statement | none |

- Source locators checked against a text: 0; the changed passages cite no source, and no target of the seeded sample (Weil pairing, Hasse bound, function field, no schemes, out of scope, complex uniformisation, pinned sources) falls in changed or affected text.
- Library declarations opened at the pin: Mathlib `ContCohomology/Basic.lean:131`; Tau Ceti `ForcedDiscrete.lean:69, 77, 110`, `SmoothDiscrete/Basic.lean:211–223`, `FiniteQuotient/AllDegreeColimit.lean:402`, `Inflation/Basic.lean:353`.
- Cross-roadmap citations resolved: 1 (ProfiniteCohomology Layers 2, 3, 4, 10, on main); ProfiniteCohomology's README does not cite EllipticCurves, so no cycle.
- Dependency check: `depcheck: 94 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: `sorry` warnings only (50); no declaration added, removed or restated by the change, so no signature changed and no one-tactic probe was due.
- Outside the folder the pull request changes only `TauCetiRoadmap/GlobalGaloisDeformations/README.md`, its own.
- Pull-request text against the head: title and the EllipticCurves paragraph agree with the diff (definition replaced, other mentions follow, path corrected, ProfiniteCohomology named); only the order against #2483 is unstated (C01).
- Previous review: of pull request #2483 at `2af7515`, accepted with no finding; nothing to repair here.

Overlap check: read HyperellipticCurves, EllipticCurvePeriodsAndModularParametrizations, EffectiveDiophantineMethods (main), NeronModelsAndSemistableAbelianVarieties (open), and ProfiniteCohomology (main) as the cited supplier; continuous cohomology of a profinite group on a discrete module, its finite-quotient colimit and inflation–restriction: ProfiniteCohomology owns, this roadmap consumes (R01 for the two notes that still say otherwise); nothing else shared by the change.

Source independence: changed passages only: 5 passages (`README.md` 298–301, 1183, 1270–1281, 1361–1363, 1374–1376; `Suggested.lean` 1009–1015) compared with 0 sources, since they cite none; the nearest text is the pinned Tau Ceti docstring of `ForcedDiscrete`, 5 consecutive words shared; largest share AEC, text not read; no layer added, removed or reordered, so the contents were not compared.

Research link: Layers 6 and 7 state the Mordell–Weil theorem, Selmer groups and `Ш` (Silverman 2009), with Selmer structures after Rubin (2000) and Cassels' isogeny invariance of the Birch–Swinnerton-Dyer quotient (Cassels 1965); Layer 8 follows Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016). Rests on the README's statement of purpose and its references.

## Not verifiable

- Rubin, *Euler Systems* I.§1–2, cited in the untouched sentence before the changed passage of Layer 7: not in the sources cache; the change does not rest on it.
- AEC, the source with the largest share of locators: not in the sources cache; no changed passage cites it.

Automatic checks set aside as false positives: the four hits on the word "TODO" (README lines 292, 1212, 1218, 1848) describe a Mathlib file's own list, not this roadmap's process; the TeX-subscript hit at README line 739 lies inside a code span that runs over two lines.

## Source issues

- none

## For the human reviewers

- Licence: carried over from the previous review, untouched here: the README takes the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; the same structure is in pinned Tau Ceti (`Isogeny/Basic.lean:139`).
- Not tested: AEC holds the largest share of the README's locators and could not be read; no changed passage cites it.
