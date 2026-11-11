# Triage report: TARGET-VirtualFundamentalClassPartII

**Verdict: `part-ii`** of VirtualFundamentalClass (roadmap pull request 1996), under the name
VirtualFundamentalClassPartII. Deliverables: `packages/VirtualFundamentalClassPartII/target.md`
and `packages/VirtualFundamentalClassPartII/sources.toml` (13 entries, `sources check`: 0
problems). No text is missing, so no `needs-references.toml` was written.

## What I searched

- **The base and its sibling, at their heads.** VirtualFundamentalClass at `676f128` (read with
  `roadmaps show VirtualFundamentalClass --pr 1996`, 1272 lines) and AlgebraicGromovWittenTheory at
  `1949322` (`--pr 1998`). Plain `roadmaps show VirtualFundamentalClass` printed an older 1030-line
  copy that lacks §2.5's Kresch material. The section numbers in the filed target (§§2.1–2.5, 3.3,
  3.5, 6.1, 6.3, 7.4, 7.7, 8.4, 9.2, 9.4, 9.5) all exist at the head with the meaning the target
  gives them.
- **Ownership by mathematical object**, with `roadmaps grep` over main and all open roadmap pull
  requests: Vistoli; Chow groups of stacks or Deligne–Mumford stacks; integral Chow; proper covers;
  Edidin–Graham; Kresch; perfect and relative obstruction theories; virtual classes and cycles;
  deformation invariance of virtual counts; `Rπ_*` obstruction complexes; coarse-space Chow
  comparisons; intersection products on stacks; `Q`-varieties; residual-gerbe degrees; quotient-stack
  Chow groups; prestable families. `roadmaps overlaps VirtualFundamentalClass` (closest:
  AlgebraicGromovWittenTheory 0.23, then SchemeAndStackFoundations, SchemeKTheoryOperations,
  StableReductionPartII at about 0.10).
- **Board packages**: grep of every `README.md`, `target.md` and `design/README.md` under `packages/`
  for stack Chow groups, Vistoli and the stopped package's name; the packages index (three imported
  packages, none related); the merge order.
- **Main**: EquivariantIntersectionTheory (scope, Conventions, Layers 2–3), SchemeAndStackFoundations
  (§§1.10, 1.18–1.23, 2.19–2.20, 3.3, 4.1, 4.5, Layer 5), StableReduction (Layers 2–3),
  EnhancedDerivedSheaves (§0.3, E1.4, E1.8), DerivedModuleAlgebra (§0.25).
- **Pinned libraries**: Mathlib has no algebraic stacks, Chow groups or obstruction theories; Tau Ceti
  has scheme-level `Chow`, `PrestableFamily` (`TauCeti/AlgebraicGeometry/Curves/Prestable.lean`) and
  stable-map families, and no stacks.
- **The stopped package** VirtualFundamentalClasses (target, README, design, reports, manifest) and
  the maintainer notes in this package's `reports/`, read as data.
- **Sources**, fetched through the sources service and read at the cited lines: vistoli1989 (OCR of the
  GDZ scan; §§1–3, 5–6 and the Appendix definition), behrend-fantechi1997 (§§4–7), kresch1999b
  (Theorem 3.1 and the remarks), behrend1997 (Propositions 2, 4, 5 and the dimension count),
  li-tian1998 (Theorems 4.2–4.3), edidin-graham1998 (§3.3, Propositions 10–11 and the remarks before
  them), kresch1999 (Theorems 2.1.12 and 6.2.1), deligne-mumford1969 (Theorem 4.12), keel-mori1997
  (Theorem 1.1, Corollary 1.3), stacks-chow-spaces (Situation 2.1, Definition 15.1), stacks-chow
  (Example 7.2, Definition 19.1). gillet1984 and fulton1998 resolve only to paywalled pages and are
  recorded `uncertified`.

## What I found

- **No second owner.** Nothing on main, in an open pull request or on the board plans integral or
  non-separated Chow groups of stacks, the moduli-space comparison, the Deligne–Mumford quotient
  comparison, intersection rings of smooth stacks, the point-degree formula, independence of the
  global resolution without the resolution property, relative obstruction classes, the relative
  formulas over non-smooth bases, reduced-base pullback and functoriality, deformation invariance of
  virtual counts, or the obstruction theory of general spaces of maps from curves.
  EquivariantIntersectionTheory does not compare its groups with Vistoli's. Its out-of-scope list
  names Chow groups of stacks that are not global quotients (Kresch). The symplectic
  roadmaps (GromovWittenTheory, ImplicitAtlases, AnalyticStableMaps) treat a different virtual class.
- **No consolidation.** The brief lists no open target or design. My search found one related board
  design, StackPointsAndResidualGerbes (round 6, needs changes). It owns closed and reduced
  substacks, automorphism groups and residual gerbes, which this roadmap consumes; it is a supplier,
  not an overlap, and its scope already names the stopped package as its consumer for degrees of
  zero-dimensional substacks. MotivicStructuresInModuliOfCurves only cites Arsie–Vistoli.
- **One filed item is a duplicate of the base.** At its head, base §2.5 already states invariance of
  Vistoli's rational equivalence under the restricted action `T_{Y′}|_{X′}` of kresch1999b Theorem 3.1
  and has the plane counterexample as a negative check. The maintainer note says the owner names no
  acting group; that was true of the older copy, not of the head. Following the maintainer's rule, the
  target keeps only the strictly more general relative invariance over a reduced base (T13) and
  imports the plane example as a Check.
- **Overlap I could not remove.** AlgebraicGromovWittenTheory §§4.1–4.3 plan the special case of the
  maps-from-curves theorem (T16). The maintainer's decision accepts this. To keep a single direction of
  supply, this roadmap never imports AlgebraicGromovWittenTheory; that roadmap may later cite T16.
- **The filed generality checked against the sources:**
  - Behrend–Fantechi's §7 setting allows a pure-dimensional, not necessarily smooth, base
    (lines 1645–1647). Propositions 7.1–7.2 assume smooth bases (line 1668), Proposition 7.3 does
    not, and Proposition 7.5 needs either a smooth `v` or `Z, Z′` smooth over the base. So T12 is the
    source's stated generality. The base's smooth-base §9.4 is narrower.
  - The reduced-base versions in T14 come from Vistoli Lemma 3.16, which needs a reduced
    equidimensional ambient (lines 1172–1173).
  - Behrend–Fantechi allow "separated, or Vistoli's condition" for the virtual class
    (lines 1261–1262), so the virtual-class targets are stated for stacks with a proper cover.
  - Vistoli's Chow theory (§3) assumes only a proper cover (lines 887–890), not separatedness; this
    is the non-separated generality of T1–T5.
  - Vistoli's (6.1) is stated for moduli spaces that are schemes. The target states it for
    algebraic spaces, so that Keel–Mori coarse spaces are covered.
  - Edidin–Graham Proposition 10 assumes a quasi-projective moduli scheme. Their remark
    (lines 758–768) names homotopy invariance as the missing input for the general case, and the
    base's §2.3 supplies it, so T8 drops the moduli-scheme hypothesis and keeps Proposition 10 as a
    Check.
  - The sources assume stacks with quasi-compact separated diagonal (vistoli1989 (7.14)). The
    filed "quasi-separated" is read in that sense, and the target says so.
- **The claims in the maintainer notes, checked:**
  1. Words: Vistoli's "local embedding" (lines 485–500) is the base's "local immersion". The
     target uses the base's words and states the correspondence once.
  2. Cotangent complex: no truncated complex is defined. For `E` perfect in `[−1, 0]`, maps to `L`
     and to `τ^{≥−1}L` correspond, so the sources' constructions land in the base's full complex.
  3. Integral and rational: T2 identifies the rationalised integral groups with the base's §2.1
     group, compatibly with its operations.
  4. Invariance: the only change is the base's head (see above).
  5. Functoriality: recorded as a risk. T14 must use a route that needs compatibility only over `v`.
  6. Suppliers: AlgebraicVectorBundles and EllipticCohomology are not needed. The suppliers are
     SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction,
     DerivedModuleAlgebra and EnhancedDerivedSheaves, each cited by section, plus
     StackPointsAndResidualGerbes.
- **Errors and gaps in the sources** (recorded in the target's Risks): behrend-fantechi1997
  Proposition 3.5 (line 889) is wrong (kresch1999b lines 41–47, 340–343). The proof of
  Proposition 5.3 assumes that both resolutions map to `E` by morphisms of complexes
  (lines 1303–1305). Line 1609 takes an Ext group over the curve where it should be over the test
  scheme. In vistoli1989 the OCR loses the end of Definition 1.11 and the displayed formula of (1.15).

## Why `part-ii`

The target continues VirtualFundamentalClass in the same direction. It uses the base's stacks, Chow
groups, cotangent complex, cones, obstruction theories and virtual class, and widens the hypotheses
of named base sections: integral coefficients, non-separated stacks, no resolution property, and
non-smooth or reduced bases. It also adds statements the base lacks: comparisons, the intersection
ring, the point degree, deformation invariance and spaces of maps. The base is existing work and
must not be re-planned, so a Part II is the right form. The suggested name fits and is used by no
roadmap, pull request or other package.

## Merge order

This roadmap must come after VirtualFundamentalClass, which is not yet in `merge-order/ORDER.txt`,
and after StackPointsAndResidualGerbes, also not yet there. Its main suppliers are already on main.
AlgebraicGromovWittenTheory does not supply it. If a later revision of AlgebraicGromovWittenTheory
cites T16, it must be ordered after this roadmap.

## Suspicious text

None. No fetched source, pull-request text or package file asked for any action outside this job.
The maintainer notes were treated as claims to check (above), not as instructions.
