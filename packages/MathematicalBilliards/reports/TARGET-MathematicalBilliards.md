# TARGET-MathematicalBilliards: triage report

Verdict: `design`, name `MathematicalBilliards`, no base. The triage file is
`packages/MathematicalBilliards/target.md`.

## What was searched

- **Open roadmap pull requests and main**, with `roadmaps grep -i` over READMEs and
  `Suggested.lean`: `billiard`; `twist map`, `monotone twist`, `area-preserving`;
  `translation surface`, `flat structure`, `flat surface`, `straight-line flow`, `linear flow`,
  `interval exchange`, `half-translation`, `Veech`, `Masur`; `Liouville measure`;
  `rotation number`; `weak(ly)? mixing`; `Birkhoff`; `caustic`, `Aubry`, `Mather set`,
  `invariant curve`, `invariant circle`, `Poincaré–Birkhoff`, `Poncelet`;
  `measure-preserving flow`, `measurable flow`, `suspension flow`, `special flow`.
  `roadmaps show` for TeichmullerGeometry (#1169) and HamiltonianSystems (#480), read by outline
  and by the same keywords.
- **The board**: every `packages/*/target.md` and `packages/*/design/README.md` for the same
  objects; the three packages of the under-review index (AnalyticNumberTheory,
  LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory: unrelated by subject); the merge
  order.
- **The pinned libraries**: `billiard`, weak mixing, `translationNumber`, flows, polygons, Jordan
  curves, plane-curve curvature and rotation index, joint measurability of actions.
- The list of open targets in the brief was truncated after its first entry
  (`TARGET-EllipticCurveModularityTotallyReal`, unrelated). Step 0 was therefore carried out on
  what the board checkout holds, the package folders of the open targets and designs, and not on
  the issue list itself.

## What was found

1. **SymplecticGeometry, CotangentLagrangian C3.1 (main) already plans the smooth convex billiard
   map.** Its paragraph "Convex planar billiards"
   (`TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`, lines 527–581) covers the
   next-collision map on the strip in the coordinates `(s, v = cos δ)`, existence, uniqueness,
   smoothness and inverse, the generating function `−‖χ(t) − χ(s)‖` with its two derivative
   formulas, the mixed-derivative twist inequality, preservation of `ds ∧ dv` and of the product
   measure, critical inscribed polygons with `exists_billiard_periodic_reflection`
   (`Suggested.lean`, line 246), and the circle. Its `Suggested.lean` (lines 128–131) records
   that the twist and area theorems are README targets with no carrier at the pins. This is the
   only overlap, and it covers about a third of the convex half of the filed statement, for
   `C^∞` tables only.
2. **IntegrableSystems I5 (main)** proves the Poincaré–Birkhoff theorem for smooth area-preserving
   diffeomorphisms of the closed annulus and uses `CircleDeg1Lift` on boundary lifts. It defines
   no twist map of the open annulus and no invariant curve.
3. **No owner anywhere** for: finite-regularity tables, the phase cylinder in `(s, δ)`, the
   extension to the closed cylinder, monotone twist maps as a class, rotational invariant curves,
   Birkhoff's Lipschitz-graph theorem, Birkhoff `(p, q)` orbits; and nothing at all of the
   polygonal half (phase space, singular set, billiard flow, Liouville measure, rational
   polygons, the Katok–Zemlyakov surface). `translation surface` occurs only in UnboundedOperators
   (#1027) as a single counterexample surface of Nelson. TeichmullerGeometry (#1169) is the
   Teichmüller space of closed surfaces through complex structures; it uses quadratic
   differentials in examples and does not define translation or flat structures. HamiltonianSystems
   (#480) excludes cotangent bundles, integrable systems, KAM and the Liouville measure (its
   Boundaries section).
4. **Weak mixing** appears only in FactorRigidity §8.2 (main), for trace-preserving group actions
   on von Neumann algebras by matrix coefficients; not for measure-preserving flows. Neither
   library has it.
5. **Board neighbours.** HardSphereDynamicsAndKineticLimits (design under review) and
   HyperbolicDynamicsAndThermodynamicFormalism (target triaged) both mention this target in their
   own files, as sharing no object and as a co-supplier of a future dispersing-billiards roadmap.
   I checked both claims against their scope sections and agree. HardSphere's risk on
   almost-everywhere flows is the same design question as T9 here; it is recorded as a shared
   risk, not an overlap.
6. **Libraries.** No declaration mentions billiards. Present and usable: Mathlib's
   `CircleDeg1Lift.translationNumber`, `MeasurePreserving`, `Ergodic`, `MeasurableVAdd₂`,
   `Polygon`; Tau Ceti's `SimplePolygon`, `Polygon.IsSimple`, `IsJordanCurve` with the plane
   Jordan and Schoenflies theorems, continuous flows. Absent: signed curvature and rotation index
   of plane curves, weak mixing, any almost-everywhere flow.

## Why the verdict

- **Not `merge-into`.** No open target or design plans these objects; the two that mention
  billiards exclude them.
- **Not `duplicate`.** C3.1 owns the smooth map and its area form, not the filed target: no
  finite regularity, no closed cylinder, no invariant curves, no polygons.
- **Not `part-ii`.** The target does not continue SymplecticGeometry in its direction (symplectic
  and contact geometry, reduction, toric convexity); it is plane dynamics and ergodic theory that
  uses one subsection of it. It imports C3.1 and I5 by name and section.
- **`design`**, with the ownership line drawn in `target.md`: the convex map is owned here at
  `C^k`, identified with C3.1's map when smooth, and C3.1's smooth theorems are not restated.

## Changes to the filed statement

- **Generality.** Positive curvature became a theorem (T1(a)) about the general carrier, a
  strictly convex table of class `C^k`; the diffeomorphism and twist statements do not need
  positive curvature. A single simple polygon became a polygonal table with holes, which the
  filed statement mentioned last. Rationality is defined by finiteness of the reflection group,
  which is the correct notion once there are holes; the angle condition is the simple-polygon
  case.
- **Birkhoff's theorem** was filed as "state"; it is a target to prove, since a roadmap proves its
  headlines. Birkhoff periodic orbits of type `(p, q)` were added as the content of "periodic
  orbits" that the cited sources support and that C3.1 does not give (C3.1 has no winding number).
- **Weak mixing** was filed as "record"; it is a definition with three first properties (T11),
  chosen so that the two consumer theorems can be stated.
- **Left out on purpose**: caustics and the ellipse, Aubry–Mather and KAM, the general theory of
  translation surfaces, and ergodicity in almost every direction. They are consumers.

## Sources

- All seven works already in the manifest are settled; none was requested again. No
  `needs-references.toml` was written: nothing this triage states depends on a text that could
  not be read.
- Added through the sources service: `BialyMironov2022` (arXiv 2008.03566v4, certified, read:
  lines 96–119, 149–185, 244–270), `ChaikaForni2026` (arXiv 2003.00890v2, certified, read: lines
  6–30, 86–120; partly OCR), `MasurTabachnikov2002` (paywalled, recorded uncertified, cited by
  locator). I added the authors of `MasurTabachnikov2002` and the `cited_for` labels by hand.
- **`Birkhoff1927` is recorded as certified but its cached text is not the article.** The
  extraction is five lines long and consists of a refusal message from the host
  ("Request unsuccessful. Incapsula incident ID: …"). I did not ask for it again (the job has
  asked twice) and quote no line of it; T6 cites it by section together with
  KatokHasselblatt1995. A human should correct the manifest entry or supply the text before the
  design relies on it.
- **The 2026 Annals article** is identified as Chaika–Forni from a web search: the journal lists
  the title and the arXiv abstract matches the filed description. The volume and issue numbers
  were not confirmed.
- Locators into KatokHasselblatt1995 (Section 9.3, Chapter 13), Tabachnikov2005 and
  ChernovMarkarian2006 are chapter-level and from general knowledge of those books; the texts are
  waived and were not read. The formulas of T2–T4 and T7 and the genus counts in the Checks were
  derived directly, not taken from them.

## Not done

- No Lean was written or run (triage writes none).
- The second `(p, q)` orbit of T6 and the proof of Birkhoff's theorem are stated as targets
  without a checked route; `target.md` lists both under Risks.

## Suspicious text

None. No fetched page or file contained an instruction.
