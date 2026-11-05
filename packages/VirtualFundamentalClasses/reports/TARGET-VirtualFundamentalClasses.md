# Triage report: TARGET-VirtualFundamentalClasses

**Verdict: design.** New roadmap `VirtualFundamentalClasses`; brief at
`packages/VirtualFundamentalClasses/target.md`; manifest at
`packages/VirtualFundamentalClasses/sources.toml` (19 entries, 17 read from legal copies, 2
recorded `uncertified`). No missing-references file: every text the brief relies on was read.

## What was searched

1. **Open targets and designs on the board** (consolidation). Compared by object with every
   entry listed in the job: the only neighbours are DESIGN-StackPointsAndResidualGerbes (points,
   stabilisers, residual gerbes; its brief names "Chow groups of stacks (VirtualFundamentalClasses)"
   as a boundary and is a supplier of the degree formula), TARGET-QuasicoherentSheavesOnPrestacks
   (QCoh on prestacks; shares no statement), and DESIGN-DynamicalDegreesOfRationalMaps
   (intersection numbers on projective varieties, scheme-level). None plans cycles on DM stacks,
   cone stacks, obstruction theories or virtual classes, so no merge.
2. **Roadmaps on main and at the heads of the 449 open pull requests**, with `roadmaps grep`
   for: "virtual fundamental class", "intrinsic normal cone", "obstruction theory", "normal
   cone", "h¹/h⁰", "vector bundle stack", "residual gerbe", "Chow group", "Chow groups of
   (stacks|algebraic spaces|quotient stacks)", "Behrend", "Kresch", "Vistoli", "Edidin",
   "Gysin", "coarse moduli", "Gromov–Witten", "Li–Tian", "Deligne–Mumford stack", "cotangent
   complex of a morphism of stacks", "Kontsevich", "moduli stack of stable maps",
   "Fulton–Pandharipande", "prestable curves" with "Artin stack". Findings:
   - "virtual fundamental class" matches only ImplicitAtlases (PR #974), Pardon's topological
     engine; "intrinsic normal cone", "h¹/h⁰" and "vector bundle stack" match nothing.
   - "obstruction theory" matches only the Schlessinger-style theories of deformation functors
     (SchemeAndStackFoundations §4.5, AlgebraicModuliForArithmeticGeometry, DerivedModuleAlgebra
     §0.25) and unrelated uses; none is a Behrend–Fantechi obstruction theory.
   - "Chow group" matches SchemeAndStackFoundations Layer 5 (schemes over a field: §5.1 cycles,
     rational equivalence, `ChowGroup`; §5.2 pushforward, pullback, `deg`; §5.5 normal cones,
     deformation to the normal cone, refined Gysin maps) and consumers of it; the two open
     revisions of SchemeAndStackFoundations (#1276, #1656) have the same Layer 5 headers and no
     stack section. "Kresch" matches only EquivariantIntersectionTheory (#1685), whose scope
     statement excludes Chow groups of stacks that are not global quotients and of algebraic
     spaces. No roadmap defines Chow groups of DM stacks or of algebraic spaces.
   - "Behrend" on main is Behrend–Manin in StableReduction's references; "Gromov–Witten" is the
     symplectic theory (GromovWittenTheory #990, AnalyticStableMaps #987, FukayaTheory).
   - No roadmap owns the moduli stack of stable maps, the Artin stack of prestable curves or
     the cotangent complex of a morphism of algebraic stacks (DerivedModuleAlgebra §0.4 is for
     ring maps; EnhancedDerivedSheaves E5 enhances it; the Stacks Project chapter fetched stops
     at algebraic spaces).
3. **Board packages and designs** under `packages/`: read EquivariantIntersectionTheory's
   README at #1685 (Layers 0–3, scope and boundaries), StableReductionPartII's README (moduli
   geometry of stable curves: tricanonical frames, Torelli, Picard; no stable maps, no Chow
   groups of stacks), SchemeAndStackFoundationsPartII's design (flat cohomology),
   MotivicStructuresInModuliOfCurves' design (tautological rings; it cites the keys
   `SchemeAndStackFoundations:SF.5/stack-chow`, `SF.5/dm-gysin-ring`, `SF.5/dm-rational-degree`,
   which exist in no roadmap on main or at any head) and StackPointsAndResidualGerbes' brief.
   The index of packages under review lists no related package.
4. **Main-branch suppliers read in full where relevant**: SchemeAndStackFoundations §§1.19,
   1.20, 1.23, 4.5, 4.15, 5.1, 5.2, 5.5 and its Suggested.lean (names `ChowGroup`, `RatEquiv`,
   `cyclesOfDimension`, `StackInGroupoids`); StableReduction end goals, Layers 10–11 and its
   "Boundary: moduli spaces and properness" (it defines no moduli object for stable maps and
   names that as the next roadmap); DerivedModuleAlgebra scope, §0.4, §0.13, §0.25;
   EnhancedDerivedSheaves E5.
5. **Libraries at the pins**: Mathlib has `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`)
   and the naive cotangent module, no Chow groups, stacks or normal cones; Tau Ceti has Weil
   divisors on schemes only. Nothing owns the target.
6. **Merge order**: GromovWittenTheory, StableReductionPartII and MotivicStructuresInModuliOfCurves
   are in `merge-order/ORDER.txt`; EquivariantIntersectionTheory (another author's PR) and
   StackPointsAndResidualGerbes (board design) are not yet.

## Why the verdict

- Not `merge-into`: no open target or design plans the same theory; the one neighbour
  (StackPointsAndResidualGerbes) explicitly leaves Chow groups of stacks to this roadmap.
- Not `duplicate`: the objects (cycles and Chow groups of DM stacks, the coarse-space
  comparison, the degree of a zero-cycle on a stack, cone stacks, `h¹/h⁰`, the intrinsic normal
  cone, Behrend–Fantechi obstruction theories, the virtual class) appear in no roadmap, pull
  request, package or library. ImplicitAtlases and GromovWittenTheory build the topological and
  symplectic virtual classes, different objects with different inputs.
- Not `part-ii`: SchemeAndStackFoundations Layer 5 is the nearest base, but its Part II name is
  already used by a flat-cohomology design, and the target is a new theory on stacks with its
  own sources rather than a continuation in the same direction. The brief imports Layer 5 by
  section and builds on it.
- Name: the suggested `VirtualFundamentalClasses` is unused by any roadmap, pull request or
  package and fits.

## Corrections to the filed text

- StableReduction on main does not plan the moduli of stable maps or their properness; it
  stops at stable maps as objects and families and names the moduli stack as the next roadmap.
  The brief records this as the main risk and recommends filing that target.
- "DerivedModuleAlgebra supplies the cotangent complex": only for ring maps. The cotangent
  complex of a morphism of algebraic stacks has no owner; the brief has the design glue the
  truncation `τ^{≥−1} L_{M/𝔐}` on local embeddings, as Behrend–Fantechi do, and treats Olsson's
  stack cotangent complex as a Check.
- "Equal to `1/e_𝒱` in characteristic zero" is proved whenever the function field of the image
  is perfect (vistoli1989 (2.5)); characteristic zero becomes a Check.
- The Edidin–Graham comparison is stated under that roadmap's Edidin–Graham hypotheses and a
  quasi-projective coarse space (edidin-graham1998 Propositions 10–11); Kresch's unconditional
  version needs Chow groups of Artin stacks and is a boundary.

## Sources

Fetched through the sources service: Vistoli 1989 (GDZ scan, read by OCR; the volume landing
page gave no article link, the logical id LOG_0033 was found in the GDZ METS record), Kresch,
Edidin–Graham, Behrend–Fantechi, Behrend, Li–Tian, Keel–Mori, Graber–Pandharipande, Kiem–Li,
Fulton–Pandharipande, Behrend–Manin, Chang–Guo–Li (all arXiv), four Stacks Project chapters,
and Olsson 2007 from the link on the author's publications page (licence class author-page).
Fulton 1998 and Gillet 1984 resolved only to paywalled hosts and are recorded `uncertified`;
neither is needed for a statement. The manifest entries the service created without
bibliographic fields (the four Stacks chapters and Olsson) were completed by hand with
authors, title and year. One transient missing-references entry created by a failed retry of a
text that had already been fetched was removed, since the text is in the cache and certified.
No suspicious instructions were found in any fetched text.

## Open points for the design

1. File a target for the stacks of stable maps and algebraic Gromov–Witten invariants
   (Behrend–Manin, Fulton–Pandharipande, Behrend 1997 Theorem 6), consumer of T9–T10.
2. Re-point MotivicStructuresInModuliOfCurves' citations of `SF.5/stack-chow`,
   `SF.5/dm-gysin-ring` and `SF.5/dm-rational-degree` to this roadmap's T1–T5.
3. Decide how `τ^{≥−1} L_{M/𝔐}` and the étale-site derived category of a DM stack are set up
   (Risks in the brief).
