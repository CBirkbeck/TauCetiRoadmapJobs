# GATE-AlgebraicTopology~3: answers to human review

Head reviewed: `08deda5`. New head: `8029fe9`. One unanswered comment (roed-math, cross-PR overlap check of 2026-11-06), seven points, numbered H01–H07 in the comment's order.

## H01 (roed-math) — answered

#1652 is rebased onto this pull request, not the reverse. This pull request keeps main's "Stage N item M" ids, which nine open roadmap pull requests cite (H05). #1652's three ownership moves are each settled the other way (H02, H03, H04). #1652 also replaces most Lean names (`ordinaryWhitehead`, `cellularSingularComparison`, `finiteCoverTransfer_exists`, …). On that rebase #1652 keeps only what this pull request does not have, under Stage numbering: the relative cup modules and excisive relative cup products, compact-support cochains of CW pairs, two-torsion-coefficient duality, and the Euler-characteristic product and cover statements. This pull request does not restate them.

## H02 (roed-math) — answered

No change: Stage 6 item 0 stays "the shared generic tower API" (`TauCetiRoadmap/AlgebraicTopology/README.md` line 1127). On main, DerivedModuleAlgebra §1.T.1 (its supplier row, line 29) also plans the same towers, `lim`/`lim¹` and Milnor sequences, so main has two owners. #1701 at `712f383` (README lines 18–24) deletes §1.T.1's generic part and cites AlgebraicTopology Stage 6 item 0, which leaves one owner here. #1652's assignment to DerivedModuleAlgebra is dropped on its rebase (H01).

## H03 (roed-math) — applied

Stage 4 item 8 stays the single owner of compact generation and the pointed suspension–loop adjunction. The reason is now stated in the ownership paragraph (README lines 127–141): HomotopySpheres 3A.2 consumes Stages 4.5 and 8 (#1287 at `52ebd6f`, line 681), while Stage 4 items 4–5 and Stage 8 items 10–11 consume this interface, so an owner in HomotopySpheres would make the two roadmaps depend on each other.

The boundary is also sharpened. Old: "in place of HomotopySpheres 3A.1–3A.2". New: "in place of HomotopySpheres 3A.1 and of those four constructions [reduced suspension, based loops, smash, suspension–loop adjunction] in HomotopySpheres 3A.2", with mapping cones, Puppe sequences, the co-H structure and James constructions staying in HomotopySpheres.

The counterpart edits are not in this pull request:
- #1287 deletes its 3A.1 construction and the four duplicated constructions of 3A.2, and cites Stage 4 item 8.
- GeneralizedCohomology on main (line 37) cites "HomotopySpheres Stage 3A" through a pull-request link for these objects. It should cite AlgebraicTopology Stage 4 item 8.

## H04 (roed-math) — applied differently

The Serre-fibration predicate is attributed to neither DGFloer nor a new Stage 5.0: it is pinned Tau Ceti's `TauCeti.TopCat.serreFibrations`, which is in `TauCeti/Topology/Homotopy/SerreFibration/Basic.lean` (line 107) at the pin of the content repository's manifest. DGFloer on main (README lines 140 and 490–495) and at #1798's head `a3913c8` (lines 89–100 and 341–356) both consume this predicate from Tau Ceti; DGFloer Layer 1 item 2 owns only the fibration homotopy LES and the Serre spectral sequences.

Changes:
- **Stage 5.5 (README line 1043).** Old: "Consume DGFloer Layer 1 item 2's Serre-fibration class … and its pullbacks". New: consume `TauCeti.TopCat.serreFibrations` with `TauCeti.TopCat.mem_serreFibrations_iff_cube`, `TauCeti.TopCat.mem_serreFibrations_pullbackFst`, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and `TauCeti.TopCat.mem_serreFibrations_proj`. It adds the convention witness that the empty map to a point is a Serre fibration.
- **Ownership paragraph (lines 119–123).** It now says that DGFloer's LES and spectral sequences are built on that predicate.
- **Supplier bullet (line 287).** It lists the five declarations.
- **Suggested.lean docstring (lines 41–43).** The Serre spectral sequences are no longer listed among this roadmap's own unstatable headlines; they are DGFloer's.

## H05 (roed-math) — answered

No change: this pull request keeps main's "Stage N item M" ids throughout, so the citations in #1694, #1287, #990, #974, #987, #942, #1045, #1645 and #1798 resolve unchanged. The overlap tool finds no id of this roadmap dropped by this pull request. #1652's "Layer N.M" renumbering is undone on its rebase (H01).

## H06 (roed-math) — answered

No change in this round.

**Why the two names went.** On main (`TauCetiRoadmap/AlgebraicTopology/Suggested.lean`), both statements were stated over sorry'd data:
- `poincareDualityMap_isIso` was about the `def poincareDualityMap … := by sorry` (lines 955–967).
- `relativeHurewicz_isIso` was about `def relativeHurewicz … := by sorry` and `def relativeHomotopyGroup … := by sorry` (lines 1055–1140).

**What replaced them.**
- `poincareDuality_of_fundamentalClass` states duality with the native cap product `TopCat.singularCap`, for compact Hausdorff topological manifolds; smoothness and second countability are dropped.
- Relative Hurewicz is README Stage 8 item 4.

**Who cites them.** No roadmap on main cites either name: a search of `TauCetiRoadmap/` and `Completed/` on main finds them only in AlgebraicTopology. The only citer is #1287 (lines 73 and 350). It switches to `poincareDuality_of_fundamentalClass` and to Stage 8 item 4.

**Evidence the docstring will need.** The branch builds against Tau Ceti `358314d`. The content repository's pin (`2fd255d`, main after #1800) already has the relative carrier and map:
- `TauCeti.RelHomotopyGroup` and `TauCeti.RelHomotopyGroup.hurewicz` (`TauCeti/AlgebraicTopology/Homotopy/Relative/Basic.lean` line 302, `Relative/Hurewicz.lean` line 324);
- the isomorphism when both `A` and `X` are `(n−1)`-connected, `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` (`Homotopy/Hurewicz/Relative.lean` line 282).

The case where `A` is only simply connected and `n ≥ 3` is still open there. So once this branch takes main's pin, the docstring's "relative Hurewicz (no relative homotopy-group carrier)" becomes false. The repair is to restate the theorem on `TauCeti.RelHomotopyGroup`, which can carry the main name #1287 cites. That needs the pin merge described under "Pin" below.

## H07 (roed-math) — applied differently

There is one owner, as suggested, but in the other direction, and the README now records it. At its current head `07ee23a`, TangentialBordism B1.6 consumes AlgebraicTopology 8.13 for boundaryless sources: README lines 68–77, the supplier row at line 172 and the *Needs:* line at 414. It keeps only the extension to sources with corners and its own unequal-dimension Sard theorem with corners. The reviewer's first option (8.13 consumes B1.6) would create a cycle, since TangentialBordism also consumes AlgebraicTopology Layers 2–4, 6 and 8. The second option (move both to GeometricTopology Layer 1) edits a folder outside this pull request.

**Ownership text.** README lines 68–76 and 2401–2408 change. Old: "TangentialBordism B1.6 states the corner-source extension … and consumes nothing here". New: 8.13 owns smoothing, the parametric transversality theorem and relative transversality for boundaryless sigma-compact Hausdorff second-countable sources, and "TangentialBordism B1.6 consumes these three for boundaryless sources and extends them to sources with corners".

**Defect found in the same statements.** 8.13's parametric step cited "Sard (DifferentialGeometry 10.2)", but the projection `F⁻¹(Z) → S` has source dimension `dim M + dim S − codim Z`. The pinned `TauCeti.isNullSet_image_criticalPoints` needs `finrank ℝ E = finrank ℝ E'` (`TauCeti/Geometry/Manifold/Sard/EqualDimension.lean` line 105). The repair (lines 2457–2472):
- slice charts from `HasStrictFDerivAt.exists_isSliceChart_preimage_zero` (`TauCeti/Analysis/Calculus/ImplicitFunctionTheorem.lean` line 407);
- the flat Morse–Sard theorem `TauCeti.addHaar_image_criticalPoints_eq_zero`, which has no dimension relation (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean` line 347);
- a countable union over the slice charts.

The *Needs:* line, a new negative Check (line 2487) and the dependency table row (line 2704) follow.

## Changes

Commit `8029fe9`, "AlgebraicTopology: review repairs (8.13 Sard input, TangentialBordism consumes 8.13, Serre predicate from Tau Ceti)". It touches only `TauCetiRoadmap/AlgebraicTopology/README.md` and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (docstring only, no declaration changed).

## Other open pull requests that change this roadmap

These are from `scratch/overlaps.md`; each was checked at its head.
- **#1652:** rebased onto this pull request (H01).
- **#1797:** its AlgebraicTopology part (folding `TopologicalGroupFundamentalGroup.lean` into one `Suggested.lean`) is already in this pull request (commit `d4d77c6`). On rebase it drops its AlgebraicTopology files.
- **#1807, #1808, #1854 (the cross-roadmap dependency-loop cuts):**
  - They edit `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`, which this pull request deletes.
  - They move the fibration LES, the Serre spectral sequences, the abelian `K(A,n)` family and Serre-class Hurewicz from DGFloer into this roadmap (#1854's README, "The ordinary Serre and Eilenberg–MacLane machinery is owned here").
  - That reverses the DGFloer attribution this pull request keeps from main. It is a substantive conflict with #1798's head, which keeps those in DGFloer.
  - Whichever of #1854 and this pull request merges second is rebased onto the other and keeps the other's text. This pull request does not restate #1854's ownership moves. If #1854 merges first, the H04 sentence "its Layer 1 item 2 owns the fibration homotopy LES and the ordinary Serre spectral sequences" is replaced by #1854's Stage 5.5 ownership on that rebase.
- **#1187 (Tau Ceti pin bump to `ab00ba392`):** conflicts only through `Suggested.lean` and `lake-manifest.json`, and is rebased after whichever lands first.

## Pin

The branch's `lake-manifest.json` pins Tau Ceti `358314d` and Mathlib `f6090c7`. Main and the content repository's manifest pin Tau Ceti `2fd255d` and Mathlib `1b1ccf4` (#1800). The branch has not merged that bump, and `lake-manifest.json` is outside the files this job may edit, so the build below is at `358314d`.

All 14 `TauCeti.*` modules that `Suggested.lean` imports exist at both pins. The new README citations were checked at `2fd255d`. At `358314d`, the five `serreFibrations` declarations and `TauCeti.isNullSet_image_criticalPoints` do not exist; the two other Tau Ceti names used in 8.13 do.

At `2fd255d`, Tau Ceti also proves several Stage 8 results this roadmap still plans:
- Whitehead for CW-type spaces, `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` (`TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` line 243). This is the content of `whitehead_homotopyEquiv`.
- The cell-dimension connectivity theorems `TauCeti.surjective_homotopyGroupMap_of_isEmpty_cell` and `TauCeti.injective_homotopyGroupMap_of_isEmpty_cell` (`Homotopy/Relative/CellDimension.lean` lines 77 and 90). These are the content of `relativeCWConnectivityOfCellDimension`.
- Absolute Hurewicz, `HomotopyGroup.bijective_hurewicz` (`Homotopy/Hurewicz/Absolute.lean` line 161).
- The relative Hurewicz carrier and partial theorem (H06).

When the worker merges `origin/main`, those two headlines are deleted and cited, Stage 8 items 1, 3, 4 and 5 consume the library, and relative Hurewicz is restated. None of this could be built at the branch's pin in this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.13 parametric transversality, bad set = critical values of `π : F⁻¹(Z) → S`, null by flat Morse–Sard | M = point, P = Circle, Z = {1}, S = (−π, π), F(pt,s) = exp(is) | dim F⁻¹(Z) = 0+1−1 = 0; F⁻¹(Z) = {(pt,0)}; π has critical value 0; F(−,0) has derivative 0 at a point of Z, not transverse; F(−,s), s ≠ 0, misses Z; bad set {0}: null, nonempty; equal-dimension Sard inapplicable (0 ≠ 1) | holds; old citation of DifferentialGeometry 10.2 refuted | route repaired, Check added |
| same | M = Circle, S = (−π, π), F(x,s) = x·exp(is), Z = {1} | dim F⁻¹(Z) = 1+1−1 = 1 = dim S; F⁻¹(Z) = {(exp(−is), s)} ≅ S, π a diffeomorphism, no critical values; every F(−,s) is a rotation, transverse | holds (equal-dimension case) | none |
| same, degenerate | Z = P; Z = ∅; dim S = 0 (S = ℝ⁰) | Z = P: π = projection M×S → S is a submersion, bad set ∅, every slice transverse. Z = ∅: F⁻¹(Z) = ∅, bad set ∅. ℝ⁰: Haar measure is a Dirac mass, so null means empty; F ⋔ Z with S a point means F(−,0) ⋔ Z, so the bad set is empty | holds | none |
| relative transversality uses only one good s | P a point, V = ℝ⁰, S = ℝ⁰ | Z ∈ {∅, P}; f : M → pt is transverse to both, so s = 0 is good | holds | none |
| 8.13 / B1.6 ownership | B1.6 at `07ee23a` | B1.6 consumes 8.13 (lines 75, 172, 414); 8.13 cites nothing of TangentialBordism (grep: 0 hits outside the ownership sentences) | one direction | text fixed |
| Stage 5.5 Serre predicate, "no surjectivity" witness | ∅ → pt | a lifting square needs a map Dⁿ → ∅ with Dⁿ nonempty for all n ≥ 0, so none exists and the lifting property holds vacuously | ∅ → pt is a Serre fibration | witness added |
| Stage 5.5 locally trivial instance, "no paracompactness" | product projection L × F → L over the long line L (not paracompact) | `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` with the single global trivialization applies; the Huebsch–Hurewicz theorem (all spaces) would need a paracompact base | holds | none |
| Stage 4 item 8 vs HomotopySpheres 3A, direction | #1287 `52ebd6f` line 681; README line 127 | HomotopySpheres 3A.2 needs AT 4.5 and 8; AT 4.4, 4.5, 8.10, 8.11 need item 8; owner in HomotopySpheres gives AT → HS → AT | AT owner is the only acyclic choice | reason stated, boundary narrowed to 3A.1 plus four constructions of 3A.2 |
| Suggested.lean docstring, Serre spectral sequences | Stage 5.5 text | Stage 5.5 consumes `arbitraryCWSerreSpectralSequence` and `arbitraryBaseSerreSpectralSequence` from DGFloer Layer 1 item 2 | not this roadmap's headline | removed from its unstatable list |

## Signatures

`#check @name` was appended to `Suggested.lean` for every declaration of the file (55 names) and for the nine library `#check` lines. The file was built once and the 64 elaborated types were compared with the README statements. The file was then restored. No declaration changed this round, and every elaborated type, including the binders of `exists_transverse_circle_classifying_map`, `poincareDuality_of_fundamentalClass` and `compactSupportTopClass_existsUnique`, matches its README statement.

## Ownership and citations

- **Checked at their heads:** #942 `07ee23a`, #1287 `52ebd6f`, #1652 `61ee7a2`, #1701 `712f383`, #1797 `b3badcf`, #1798 `a3913c8`, #1807 `2110869`, #1808 `beeacfb`, #1854 `5c83375`.
- **Checked on main `eaf17b1`:** DGFloer, DerivedModuleAlgebra, DifferentialGeometry 10.2, GeneralizedCohomology.
- **New library names:** each one in the README checked at Tau Ceti `2fd255d` with file and line (above).
- **Ownership:** this round added no target, so it raises no new ownership question.

## Sources

No source was fetched. Hatcher, Proposition 4.48, was checked at `hatcher` line 16461 (PDF page 388, printed page 379). Lee, Theorems 6.26, 6.30, 6.35 and 6.36, are cited by locator under the settled `uncertified` key `lee`. No suspicious instruction was found in the review text.

## Build

`lake build TauCetiRoadmap.AlgebraicTopology.Suggested` (at the branch's pin): `Build completed successfully (9063 jobs).` The only warnings are `declaration uses 'sorry'` on the headline theorems.

## Gate

`gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency direction

`depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line for AlgebraicTopology.
