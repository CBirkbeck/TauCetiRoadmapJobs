# TARGET-SurfaceGroupCharacterVarieties: triage report

Verdict: **design**, name `SurfaceGroupCharacterVarieties` (the suggested name; no roadmap, pull
request or board package uses it). Brief: `packages/SurfaceGroupCharacterVarieties/target.md`.
Manifest: `packages/SurfaceGroupCharacterVarieties/sources.toml`. No `needs-references.toml` was
written: every text the brief needs is either readable, already settled (waived) by a human, or
recorded as uncertified by the service.

## What was searched

- **Open targets and designs on the board** (the list in the brief): compared by object. The only
  one sharing objects is `DESIGN-LieGroupsPartII` (#6276, filed as
  `packages/RealReductiveGroupsStructure/target.md`): it owns the structure theory of real
  reductive groups (conjugacy of Cartan involutions, parabolics, Bruhat), which this target
  consumes for real forms and `H^ℝ`; it plans no representation spaces, no character varieties and
  no surfaces. A shared supplier, not an overlap. No other listed target or design touches mapping
  class groups, outer actions or character varieties.
- **Board packages** (`packages/`): `MappingClassGroupsAndCanonicalRepresentations` (design README
  and its REV-PKG review), `SurfaceTopology`, `TeichmullerGeometry`, `GroupActionsOnRiemannSurfaces`,
  `GrothendieckTeichmuller` (reports only), `TopologicalMirrorSymmetryForHitchinSystems` (design).
  The board index lists only `AnalyticNumberTheory`, `LawrenceVenkateshMethod` and
  `LogicAndDefinabilityInNumberTheory` as packages under review on other branches.
- **Roadmaps on main and at the 478 open heads**, by `roadmaps grep` on: character variety,
  mapping class group, Dehn–Nielsen, Birman, pure mapping class, `Out(π`, outer action,
  Richardson / reductive representation / completely reducible, Cartan involution, real form, GIT
  / affine / categorical quotient, Haboush / geometrically reductive / Hilbert–Mumford,
  `Hom(π₁` / representation variety / conjugacy classes of representations, `betti-framed`.
  `roadmaps overlaps MordellLawrenceVenkatesh` (no shared ids dropped; nearest vocabulary:
  TeichmullerGeometry, InverseGaloisAndArithmeticFundamentalGroups).
- **Pinned libraries**: Tau Ceti has `TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`,
  `TauCeti.Diffeotopy` and `TauCeti.Diffeotopy.joined_one_final`
  (`TauCeti/Geometry/Diffeomorphism/`), knot-theory isotopy, `Representation.IsRealForm` (real
  forms of representations, not of groups) and Clifford real forms; no mapping class group, no
  `Out`, no surface carrier, no character variety, no reductive group. Mathlib has `MulAut`,
  `MulAut.conj`, `ConjAct`, `FundamentalGroup`, `ZerothHomotopy`, `Matrix.GeneralLinearGroup`,
  `PresentedGroup`; no `Out`, no mapping class group.
- **Merge order** (`merge-order/ORDER.txt`): ArithmeticGaloisRepresentations 46,
  ArithmeticLocallySymmetricSpaces 68, MordellLawrenceVenkatesh 156, TeichmullerGeometry 285,
  MappingClassGroupsAndCanonicalRepresentations 289, StableReductionPartII 316;
  SurfaceTopology/PlanarTopology (#271) are not in the order (another author's roadmap).

## What was found

**Layer 1 of the filed target (mapping class groups of punctured surfaces) is mostly planned.**
`MordellLawrenceVenkatesh` Layer LV.5 (#1231) defines surfaces `Σ ∖ P` with boundary (§5.1),
`Mod(S)` with punctures permutable and `Mod(S*)` with a marked point (§5.9, including the action
on conjugacy classes of homomorphisms `π₁(S) → G` through `Out(π₁ S)` as a construction remark),
the evaluation fibration (§5.17), Hamstrom (§5.18), point pushing (§5.19), the Birman sequence for
`χ < 0` (§5.20), capping and forgetting (§5.21) and the configuration fibration (§5.23).
`SurfaceTopology` Layer 9 (#271) owns the compact topological groups `MappingClassGroupFull`,
`MappingClassGroupPlus`, `MappingClassGroupRel`, the PL/smooth comparisons and the base cases
(disc, annulus, sphere, torus). `TeichmullerGeometry` (#1169) owns `Diff(Σ)`, smooth isotopy
versus paths (§0.2), `Mod± = π₀ Diff` with the comparison to SurfaceTopology (§3.1) and the smooth
Dehn–Nielsen–Baer theorem for closed surfaces (§§5.1–5.4). `GeometricTopology` at #903 restates
compact mapping class groups and Dehn twists in §1.7.2. Not planned anywhere: the
punctured-versus-marked-point extension theorem, the permutation sequence with `PMod_{g,n}` of
index `n!`, the pure Birman sequence (requested from LV.5's owner by the
`MappingClassGroupsAndCanonicalRepresentations` design, R1, and recorded there as not yet
planned), the smooth model for punctured surfaces, and independence of `(Σ_g, P)` up to inner
automorphisms.

**Layer 2 (outer action) is planned in outline only.** LV.5 §5.9 asserts the action through
`Out(π₁ S)`; `GroupActionsOnRiemannSurfaces` (#1728) and the MCG design consume it by that node id.
The explicit `f_δ` with its laws, the basepoint canonicity of `Ψ`, the general `Out(Γ)`-action on
`Hom(Γ, H)/H`, and the "classes, not representations" statement (`LandesmanLitt2024` lines 41–50)
are nowhere. Dehn–Nielsen–Baer for punctured surfaces is nowhere; the closed smooth case is
TeichmullerGeometry §5.2–5.4.

**Layer 3 (character varieties of real forms) is planned nowhere.** The nearest owners are:
`ArithmeticGaloisRepresentations` §1.7 (#856), which plans the affine quotient of an affine
variety by a connected reductive group over fields and DVRs (finite generation, unique closed orbit
per fibre) and `G`-complete reducibility with Richardson's closed-orbit criterion for tuples over
an algebraically closed field; `HodgeStructuresPartII` H.1 (`betti-framed`, `betti-coarse`), cited
by five board designs for the `GL_r` representation scheme and its GIT quotient but with no README
on main, at any open head, or in the board index; `SymplecticGeometry/HamiltonianReduction` R5
(main), which compares flat `K`-connections with `Hom(π₁Σ, K)/K` for compact `K`;
`PainleveEquations` (#1955), whose character varieties are wild ones of Boalch; `GeometricTopology`
(#903), which names Culler–Shalen theory at ideal points of the character variety as Part II work
and defines no character variety. Real forms: `ReductiveGroups` on main has no real-form section
(the filed supplier is wrong); real forms and complexification are `LieGroups` Layer 7, Cartan
involutions and `K` are Layer 9, the algebraic Cartan involution of `𝐇(ℝ)` is
`ArithmeticLocallySymmetricSpaces` ALS.0.1, and conjugacy of Cartan data is `LieGroupsPartII`.
Reductive representations into real forms, the Richardson–Slodowy real closed-orbit theorem, the
Hausdorffness of `Hom^red(Γ, G^ℝ)/G^ℝ`, the comparison with the complex affine quotient, and the
`Out(Γ)`/`Mod_{g,n}` action on the character variety are new.

**Sources.** Fetched and certified: `LandesmanLitt2024` (arXiv 2205.15352v4), `BCGGO2024`
(arXiv 2101.09377v2), `Sikora2012` (arXiv 0902.2589v3); locators are quoted in the brief by line.
`Goldman1984`: the service resolves the DOI only to a paywalled page and recorded it as
uncertified; nothing in the brief rests on it. `Richardson1988`: the manifest records it as
certified from Project Euclid, but the cached extraction is a five-line access-denied page; the
entry was settled by a human answer, so it is not requested again and the brief cites Theorem 3.6
by locator, as `Sikora2012` line 586 does. `RichardsonSlodowy1990`, `FarbMargalit2012`,
`Knapp2002`: waived, cited by section. The Farb–Margalit Chapter 10–12 Teichmüller material that
the MCG design lists as an unverified gap is not needed here.

## Why the verdict

- Not `merge-into`: no open target or design on the board plans mapping class groups, the outer
  action or character varieties; `LieGroupsPartII` is a supplier only.
- Not `duplicate`: the roadmap's main content (targets 3–9 of the brief) has no owner; what is
  owned (LV.5, SurfaceTopology Layer 9, TeichmullerGeometry, FreeGroupsAndLimitGroups §6.1,
  ArithmeticGaloisRepresentations §1.7) is imported by name and section in the brief, and target 1
  is written as comparisons between the existing owners plus the unplanned pure-group and
  marked-point statements.
- Not `part-ii`: it does not continue one roadmap in its own direction. It completes LV.5's
  surface layer (a service layer inside a Mordell roadmap, which the MCG design records as pending
  transfer), extends SurfaceTopology Layer 9 to punctures, and adds the representation-theoretic
  side that TeichmullerGeometry treats only for `PSL₂(ℝ)`. The centre of gravity, character
  varieties of real reductive groups for arbitrary finitely generated `Γ`, is a new library.
- Generality: the filed closed-surface, genus `≥ 2` statement of layer 3 is made the instance of a
  statement for any finitely generated `Γ` and any real form `G^ℝ` of a connected complex reductive
  group (possibly disconnected), which the free-group (punctured) case, the Culler–Shalen use and
  the Landesman–Litt use all need; layers 1–2 are stated for all `g, n ≥ 0`.

## Notes for the worker and the design author

- The MCG design's R1 request to LV.5's owner (pure mapping class group, pure Birman sequence) is
  answered by this roadmap's target 1; that design should cite `SurfaceGroupCharacterVarieties`
  for those items once it exists. The merge-order slot after TeichmullerGeometry (285) and before
  MappingClassGroupsAndCanonicalRepresentations (289) makes this a supplier of the latter.
- LV.5's surface layer is "pending transfer to topology owners" (MCG design, Conventions and R1).
  This roadmap is a candidate host, but the brief imports LV.5 by section and leaves the transfer
  to a human decision.
- The filed supplier "real forms of ReductiveGroups (main)" is corrected in the brief to
  `LieGroups` Layers 7 and 9, `ArithmeticLocallySymmetricSpaces` ALS.0.1 and `LieGroupsPartII`.
- `HodgeStructuresPartII` has no README anywhere the worker can read, although five board designs
  cite its H.1 nodes; the brief records this as a risk and limits this roadmap to a comparison with
  H.1 for `GL_r`.
- The `Richardson1988` cache should be refreshed if a legal copy becomes available; until then it
  is a locator-only citation despite its `certified` status.

No suspicious instructions were found in any fetched text, issue text or roadmap.
