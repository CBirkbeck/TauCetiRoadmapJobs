# Maintainer notes: SurfaceGroupCharacterVarieties

These notes come from a comparison of the design with the roadmaps it names as suppliers, read at
the heads of open pull requests #1231 (MordellLawrenceVenkatesh), #1169 (TeichmullerGeometry) and
#1728 (GroupActionsOnRiemannSurfaces) and on main (GeometricTopology). They are claims to check,
not findings. Passages are named by section; no line number is given because the heads move.

## Supplier citations that may not say what the design takes from them

1. The supplier contract assumes that the isotopy relation of MordellLawrenceVenkatesh §5.9 is
   ambient isotopy. §5.9 does not say which isotopy relation it uses, and the identification in 2.2
   rests on the assumption.
2. The scope, the contract and `plan.json` say that §5.9 gives the action on conjugacy classes of
   homomorphisms through Out(π₁ S), by precomposition with (f⁻¹)_*. §5.9 attaches Out and (f⁻¹)_*
   to finite coverings only, and does not quantify the target group.
3. Two symbols clash with the suppliers. Ψ is the outer action here and the symplectic
   representation in §5.9. Mod^±(X) is topological and defined for any space here; in
   TeichmullerGeometry §3.1 Mod±(Σ) is π₀ of the diffeomorphism group of a closed smooth surface.
4. The lists of supplier sections disagree with one another. The scope paragraph lists
   MordellLawrenceVenkatesh §§5.9–5.12 and §§5.15–5.23. The contract omits §§5.10–5.12, 5.18, 5.21
   and 5.22, and `plan.json` omits §§5.10–5.12, 5.18 and 5.21. §5.22 is used (for Mod_{1,0}) but is
   not in the contract. TeichmullerGeometry §0.0d is in the scope but in neither the contract nor
   `plan.json`.
5. "Mod_{1,0} ≅ SL₂(ℤ)" is cited to MordellLawrenceVenkatesh §5.22. §5.22 states surjectivity of
   the symplectic representation; the isomorphism is only a Check there. TeichmullerGeometry §5.4a
   and GeometricTopology 1.7 state it as a result.
6. §5.4 is cited for a standard 4g-gon model with n marked points. The statement of §5.4 is the
   connected-sum form with the (g, b, n) criterion; a polygon appears only in its proof sketch.
7. "§5.23 is the case n = 1": §5.23 is stated for genus at least 1 only.
8. TeichmullerGeometry §0.0f is cited for "genus and orientability, both invariant under
   homeomorphisms". There "both" refers to the number of boundary components and orientability;
   invariance of the genus is not stated as such.
9. TeichmullerGeometry §4.3 is cited for a CW structure, for core curves meeting in one point and
   for a reflection r, for every g ≥ 1 (every g in 2.4). §4.3 works on the smooth surface of genus
   g ≥ 2 under that roadmap's conventions, has no reflection, and mentions the core curves only
   inside one computation.
10. The consumers list says GroupActionsOnRiemannSurfaces takes 1.3 and 3.3 from this roadmap. At
    its head that roadmap takes the outer action from MordellLawrenceVenkatesh §5.9 and does not
    name this one.

## Statements that may restate a supplier's target

11. 2.1 defines the group of homeomorphisms modulo ambient isotopy for an arbitrary space.
    TeichmullerGeometry §0.0h defines `MappingClassGroupFull` for an arbitrary space by isotopy
    through homeomorphisms. 2.1 itself proves that the two relations agree on compact connected
    manifolds, so on closed surfaces it is a second definition of the same group. Check that 2.1
    owns only what is new (the noncompact case) and takes the compact case from its owner.
    GeometricTopology 1.7.2 declares itself the single owner of the mapping class group of a
    compact surface: check that the comparison in 2.1 names it.
12. 3.4 states that the image of Mod(Σ) in Out is the index-two subgroup acting trivially on H₂.
    TeichmullerGeometry §5.4 asserts Mod⁺(Σ) ≃ Out⁺(Π) for closed surfaces without defining Out⁺.
    One of the two should own the statement and the other cite it.
13. 3.3 ("sends Push(α) to conjugation by [α]") and its Check restate MordellLawrenceVenkatesh
    §5.19.

## What the comparison found in order

For the record, so that it is not reopened without a witness. The mapping class group of a
punctured surface is taken from MordellLawrenceVenkatesh §5.9 and not redefined. Out of an
arbitrary group is taken from TeichmullerGeometry §4.2. The design is the more general text, and
so the owner, for: the extension of homeomorphisms over punctures (2.2); the group with
orientation reversal allowed; the outer map for a path-connected space, a homeomorphism and a path
(3.1–3.3); and the action on Hom(Γ, H)/H for arbitrary Γ and H (1.2–1.3, 3.5).
