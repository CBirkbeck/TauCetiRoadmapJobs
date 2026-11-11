# Maintainer notes: VirtualFundamentalClassPartII

## Ownership (the maintainer's decision)

The roadmap VirtualFundamentalClass, in an open pull request of the roadmap repository, owns the
Behrend–Fantechi construction: stack dimension, cones and normal cones, the rational Chow theory
of separated Deligne–Mumford stacks with its Gysin and bivariant operations, the full relative
cotangent complex, cone stacks and h¹/h⁰, the intrinsic normal sheaf and cone, obstruction
theories, the virtual class, compatible pullback, functoriality and the relative class. The
roadmap AlgebraicGromovWittenTheory, also in an open pull request, owns the moduli stack of stable
maps and its virtual class.

This roadmap is a second part. It states only what is strictly more general than those two texts,
or absent from them, and it imports everything else by roadmap name and section. This decision is
settled and is not a finding to raise again. A statement here that VirtualFundamentalClass states
in the same or greater generality is a duplicate and should be removed, not moved.

An earlier board package, VirtualFundamentalClasses, planned the shared core a second time and was
stopped. Its text may be reused for the items of this roadmap only.

## Claims to check, not findings

These come from a comparison of the earlier package with the two owners. Passages are named by
section because the heads move.

1. Words. VirtualFundamentalClass uses "local embedding" for a chart pair and "local immersion"
   for the class of morphisms. The earlier package used "local embedding" for the class of
   morphisms, following Vistoli. This roadmap should use the owner's words and say once how they
   correspond to Vistoli's.
2. Cotangent complex. The earlier package mapped obstruction theories to a truncated complex
   built from local embeddings. The owner uses the full relative cotangent complex. This roadmap
   should define no truncated complex, and should state its obstruction theories, relative
   theories and compatibility data in the owner's sense. The obstruction theory of a space of maps
   from curves then has to be built into the full complex.
3. Integral and rational groups. The owner's groups are rational on purpose. The integral groups
   are this roadmap's own. One comparison statement should identify their rationalisation with
   the owner's group for separated stacks, compatibly with the owner's operations, so that every
   rational statement here is about the owner's groups.
4. Invariance of the rational equivalence. Behrend–Fantechi Proposition 3.5 claims invariance
   under the whole ambient tangent bundle. The errata register records this as an error, with the
   restricted statement of Kresch. This roadmap states the restricted invariance and the
   counterexample. The owner's text names no acting group.
5. Functoriality. The owner plans the reduction through the graph and a projection. The earlier
   package recorded a doubt about one compatibility in that reduction, with a conic in the plane
   as the example. This roadmap does not restate the absolute theorem; if its own functoriality
   statements use the reduction, the step should be checked.
6. Suppliers. With the owner supplying cones, the cotangent complex and cone stacks, the earlier
   package's inputs from AlgebraicVectorBundles and EllipticCohomology should no longer be needed.
   The remaining suppliers are expected to be SchemeAndStackFoundations,
   EquivariantIntersectionTheory, StableReduction, DerivedModuleAlgebra and
   EnhancedDerivedSheaves, each to be cited by section for what the text takes from it.
