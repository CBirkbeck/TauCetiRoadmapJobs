# Maintainer notes: MathematicalBilliards

These notes come from a comparison of the package with SymplecticGeometry/CotangentLagrangian C3.1
on main. They are claims to check, not findings. Passages are named by section; no line number is
given because the head moves.

## Supplier citations that may not say what the package takes from them

1. The scope says that only the smooth cases of 3.2 and 3.3 restate C3.1. Sections 2.1, 2.2, 3.1,
   6.2 (the billiard case of the chain dictionary) and 6.3 also contain statements of C3.1 as their
   smooth special cases. Each should say which statement of C3.1 it specialises to, through the
   conjugacy of 2.5 between the two coordinate systems.
2. The supplier contract gives the circle criterion as "periodic exactly when arccos(v)/π is
   rational". C3.1 names a rational-rotation periodicity criterion without that formula.
3. 4.4 attributes a recurrence result to C3.1 with a second-countability hypothesis. C3.1's
   neighbourhood-return form has no such hypothesis, and the step to non-wandering points is this
   roadmap's own.
4. `plan.json` cites a section 4.4.1; the text has 4.4 only.
5. 6.3 with (p, q) = (1, N) gives C3.1's periodic-reflection theorem for C¹ tables, except that
   the table carrier here requires positive orientation, while C3.1 says orientation plays no role.
   The comparison should state the difference.

## What the comparison found in order

For the record, so that it is not reopened without a witness. C3.1 states the smooth convex
billiard map in the coordinates (s, v) inside a theorem, with no named table carrier. The package
is the more general text, and so the owner, for: the table carrier of class C^k; the billiard map
in (s, δ) for k ≥ 1 and its regularity for k ≥ 2; the generating function and twist for k ≥ 2; the
invariant measure; tangent states; and rotational invariant curves with their rotation numbers,
which C3.1 does not treat.
