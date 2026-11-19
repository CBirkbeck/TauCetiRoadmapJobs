# Review of PlanarTopology (pull request #271 at a994be4)

**Verdict:** needs changes

**Summary.** Changes are needed: four findings, all P2. Three are about ownership: since this branch was cut, main has gained owners (and Tau Ceti, at main's pin, proofs) for Jordan separation, Schoenflies, Brouwer, invariance of domain, Radó, the two-dimensional Hauptvermutung and the smoothing theorems, and the open TeichmullerGeometry roadmap states the PL approximation, boundary-invariance and Epstein theorems under the same Lean names. The fourth is mathematical: the PL form of Alexander's trick is stated on the round circle, where it covers only isometries. There are four small corrections and three format notes; whether a second, elementary route to results main already owns is wanted is left to the human reviewers.

## R01 (P2) — Jordan separation, the Jordan-domain theorem, Schoenflies in the plane and on the sphere, no-retraction, Brouwer and invariance of domain are stated here as targets although main already owns them

After this pull request merges, an implementer would be asked to re-prove, by a second route, statements that roadmaps on main own and that Tau Ceti at main's pin already proves. The branch pins Tau Ceti `358314d` (7 October); main pins `2fd255d` (4 November), and the branch has not merged main since.

How I know. `Completed/ConformalMapping/README.md` §5.3 (lines 787–803) owns `jordan_separation` for every Jordan curve in `ℂ`: two components, the bounded one `filledHull C \ C` a Jordan domain, both frontiers `C`. At main's pin this is `TauCeti.IsJordanCurve.isJordanDomain_filledHull_sdiff` (`TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean:146`), the statement of `isJordanDomain_inside` here, and `TauCeti.IsJordanCurve.natCard_connectedComponents_compl_eq_two`, cited by `TauCetiRoadmap/MathematicalBilliards/README.md` line 63, the statement of `jordan_separation` here. `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere` (`Jordan/Schoenflies.lean:122`) gives `e '' sphere 0 1 = C` with `e '' closedBall 0 1 = filledHull C`, which is `schoenflies_plane` and, with the closure of the inside, `schoenflies_closure`; `exists_homeomorph_image_inner_eq_zero` (same file, line 142) is `schoenflies_sphere`. `TauCetiRoadmap/AlgebraicTopology/README.md` lines 97–99 records no-retraction and Brouwer as Tau Ceti's `TauCeti.noRetraction_diskBoundary` and `TauCeti.brouwerFixedPoint_closedBall`; `IsOpen.image_of_continuousOn_of_injOn` (`TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:160`) is invariance of domain. The same pin has `Polygon.IsSimple` and `Polygon.IsSimple.isJordanCurve_boundary` (`TauCeti/Geometry/Polygon/Simple.lean`, MathematicalBilliards line 61), the object of `PolygonalLoop.IsSimple` and `PolygonalLoop.isJordanCurve_carrier`. None of these is in Tau Ceti at the branch's pin, which is why the file elaborated when it was written. The README itself says, of Maehara's route, that "a second proof of a theorem is not a target".

Smallest change. Merge main; delete from `Suggested.lean` the declarations `isJordanDomain_inside`, `jordan_separation`, `schoenflies_plane`, `schoenflies_closure`, `schoenflies_sphere`, `no_retraction_disc_circle`, `brouwer_fixedPoint₂` and `invarianceOfDomain₂`, and cite the library names above under the Tau Ceti prerequisites; say in one clause how the polygon carrier differs from `Polygon.IsSimple` or use it. What stays as this roadmap's own: polygonal accessibility and joining, the crosscut theorems, `schoenflies_extend`, `image_boundary` (subject to R03), tameness. If the elementary proofs are wanted as proofs, they are a proof route for those library statements in the notes, not targets.

## R02 (P2) — Radó's theorem, the two-dimensional Hauptvermutung, the smoothing theorems and the smooth-isotopy comparison are owned by GeometricTopology Layer 11.2.1 on main, and the README says GeometricTopology consumes them from here

Two roadmaps would own the same theorems, and the sentence a reader relies on to tell which is false on main. The README says (line 81) "that roadmap consumes the new dimension-two theorems listed above", and its consumer table gives `GeometricTopology` layer 11 as a consumer of Radó and the Hauptvermutung.

How I know. `TauCetiRoadmap/GeometricTopology/README.md` on main, §11.2.1 (line 7817), proves by Hatcher's torus-trick route: item 1, existence of smooth structures; item 2, isotopy of homeomorphisms to diffeomorphisms and uniqueness of the smooth structure; item 3, Radó as `TauCeti.IsCombinatoriallyTriangulable M 2`, with `rado_triangulation` in its `Suggested.lean` (line 319); item 4, compatible smoothings of PL surfaces and the Hauptvermutung with isotopy to a PL homeomorphism; item 5, that topologically isotopic diffeomorphisms fixing the boundary are joined by a `TauCeti.Diffeotopy`. That text does not mention this roadmap. Here Layer 5 (Radó, `hauptvermutung₂`, isotopy to a PL homeomorphism) and Layer 8 (smoothing existence and uniqueness, isotopy to a diffeomorphism, the smooth isotopy comparison, the `PLGroupoid` bridge "stated here" whose proof is "the reconciliation that `GeometricTopology` layer 11 targets") state the same results. The docstring of `Suggested.lean` also says Radó's combinatorial form is not statable at the pin; it is, with `TauCeti.IsCombinatoriallyTriangulable` (`TauCeti/Topology/CombinatoriallyTriangulable.lean:44` at the branch's pin).

Smallest change. Cite GeometricTopology §11.2.1 items 1–5 for these statements and keep here only what it does not state: the combinatorial-surface carrier with the boundary as a subcomplex, the relative PL forms, Pachner, the invariants of Layer 6, the PL isotopy predicates. Drop `isTriangulable_of_compactSurface` (weaker than main's item 3) and the bridge theorem, and correct the consumer table and line 81 to what main says. If the triangulation-first route is meant to replace main's, that is a revision of GeometricTopology, not a target here.

## R03 (P2) — The PL approximation theorem, invariance of the boundary, orientations with the orientation double cover, and Epstein's theorems are also owned, with the same Lean names, by the open TeichmullerGeometry roadmap

Two open roadmaps each build these objects, so neither can cite the other and an implementer cannot tell which statement is the target.

How I know. TeichmullerGeometry (open pull request #1169), `Scope and ownership`, first bullet (README line 9), owns "the PL theory of compact surfaces on which Epstein's theorems rest"; its §0.0a states `exists_pl_approximation_open` and `exists_pl_approximation_halfPlane` (README line 120; `Suggested.lean` lines 91 and 105), §0.0b `image_boundary` (line 127), §0.0c the Euler characteristic and orientations, §0.0d the four curve and arc theorems and `isotopic_of_homotopic_closedSurface` and `isotopicRel_of_homotopicRel` (lines 168 and 179). The hypotheses agree with Layers 2, 4, 6 and 8 here down to the binder `hφ`. TeichmullerGeometry is earlier in the merge order than this roadmap.

Smallest change. One owner: either this roadmap cites TeichmullerGeometry §§0.0a–0.0d for these statements and keeps its additions (the compact and relative approximation forms on combinatorial surfaces, the simplicial orientation cover, the PL isotopy injections), or the authors agree that these sections move here and TeichmullerGeometry cites this roadmap; say which in the README's scope section. As the merge order stands it is the first.

## R04 (P2) — The PL form of Alexander's trick is stated for the round circle, where a piecewise-linear homeomorphism is an isometry, so it does not give the coning that Layers 4 and 5 use

Layer 0 states (lines 272–275) "coning a piecewise-linear homeomorphism of the circle … gives a piecewise-linear homeomorphism of the disc", with `h` a homeomorphism of `Metric.sphere 0 1`. Layer 4 uses it to fill triangles after correcting the 1-skeleton, where the boundary map is an arbitrary PL homeomorphism of a polygon.

How I know. `TauCeti.IsPLOn h s` (`TauCeti/Topology/PL/Map.lean:177`, with `IsPiecewiseAffineOn` at line 87) asks that near each point `h` agree with finitely many continuous affine maps on convex polyhedra. If `h` maps the unit circle to itself and equals `x ↦ Lx + b` on an arc, then `‖Lx + b‖² = 1` is a trigonometric polynomial identity on an arc, hence on the whole circle; the image ellipse lies in the unit circle, so `b = 0` and `L` is orthogonal (a singular `L` would make `h` constant on the arc). A homeomorphism of the circle cannot switch between a rotation and a reflection, so `h` is one orthogonal map. The statement is true and says only that the cone of an isometry is linear.

Smallest change. State the PL cone on the boundary of a convex polygon, or of a triangle, coned from an interior point: a PL homeomorphism of the boundary extends radially to a PL homeomorphism of the polygon that agrees with it on the boundary. The topological `coneExtend` on the round ball is unaffected.

## C01 — Sixteen declarations carry one name in `Suggested.lean` and another in the README

A prose statement cannot be matched to its formal one: the README has `polygonal_jordan`, `card_connectedComponents`, `brouwer₂`, `not_exists_retraction_closedBall_sphere`, `boundaryComponentCount_congr`, `schoenflies`, `isLocallyFlat_of_isEmbedding_circle`, `isSliceEmbedding_of_isEmbedding_unitInterval`, `isotopic_of_homotopic`, `exists_jordanCurve_volume_pos`, `exists_isSimple_of_isJordanCurve_carrier`, where the Lean file has `polygonal_jordan_separation`, `jordan_separation`, `brouwer_fixedPoint₂`, `no_retraction_disc_circle`, `boundaryComponentCount_homeomorph`, `schoenflies_plane`, `isLocallyFlat_circle`, `isSliceEmbedding_arc`, `isotopic_of_homotopic_closedSurface`, `exists_osgoodCurve`, `PolygonalLoop.exists_simple_presentation`; `HasMobiusNeighborhood.not_isBicollared`, `exists_boundaryless_transport` and `exists_coneExtension` appear in the README under no name. Use one name for each.

## C02 — The boundary-relative Epstein theorem is read from the proof of Theorem 6.3, not from its statement

The Layer 8 docstring says the compact relative case "specializes Theorem 6.3 (printed p. 99)". Theorem 6.3 (epstein1966 lines 533–535) takes a proper homotopy of pairs `(M, ∂M) → (M, ∂M)` and concludes an isotopy to the identity; it does not say the isotopy fixes `∂M`. That comes from the proof, which first makes the homotopy constant on `∂M` (lines 537–549) and then uses isotopies fixed on the boundary (lines 589–593). Cite "Theorem 6.3 and its proof, pp. 99–100".

## C03 — `exists_boundaryless_transport` asserts some half-space atlas with empty boundary, not that the composite atlas has one

The README's target is that the atlas obtained from the given Euclidean charts by `ChartedSpace.comp` has empty boundary. The Lean statement quantifies `∃ c : ChartedSpace (EuclideanHalfSpace 2) M` with no relation to the given charts, so it does not test the transport the conventions rely on. State it for the composite, or say in the docstring that it is the weaker existence form.

## C04 — Five declarations of `Suggested.lean` support no headline

`exists_spaceFillingCurve`, `exists_jordanCurve_not_rectifiable` and `exists_osgoodCurve` are, in the README's words, controls on hypotheses, and no layer uses them; `SmoothIsotopic` and `SmoothIsotopicRel` are definitions with no theorem stated about them (the README's `smoothIsotopic_of_isotopic` is not declared, and by R02 has an owner). Mark the three existence statements as sanity checks or keep them as README Checks, and state a theorem on the two definitions or drop them.

## N01 — Process and source-following wording

Line 843 "The repaired hypothesis excludes it"; line 564 "The order of development follows Thomassen" and the references' "Treat it as the primary route document" (a roadmap gives its own order and cites results); line 1249 points an interface at an unmerged Mathlib pull request; the provenance table records "contacted, agreed".

## N02 — Lean form

`exists_boundaryless_transport` has `letI` in its statement; `schoenflies_closure` concludes `Nonempty (… ≃ₜ …)` without a `nonempty_` name; `jordan_separation` leaves `J` unbound and relies on an auto-bound implicit; `invarianceOfDomain₂` states `IsOpen (Set.range f)` beside the `IsOpenMap f` that implies it.

## N03 — Headlines named neither in the file nor as not statable

Tameness of finite graphs and Pachner's theorem are summits of the README; the module docstring names Pachner as not statable but not finite-graph tameness.

## Questions for the author

- Layer 5 says two triangulations of a disc on the same vertex set are flip-connected, and that with boundary the bistellar moves are taken "relative to the boundary" together with boundary moves. Which statement of Pachner (1990) is meant? I could not read that paper.
- Does `jordan_separation` elaborate under the repository's options with `J` auto-bound? I could not elaborate the file on this worker.

## Verified sound

README and Lean mean `TauCetiRoadmap/PlanarTopology/README.md` and `Suggested.lean`. D is the open unit disc, S the unit circle.

| Statement | Instances tried, values on each side | Result | Change |
|---|---|---|---|
| PL cone on round circle (README 272–275) | affine `Lx+b` on an arc with norm 1: forces `b=0`, `L` orthogonal; rotation by θ: cone is rotation | true only for isometries | R04 |
| `exists_coneExtension` | n=0: sphere ∅, ball {0}, F=id; n=2, h=conj: F=conj, F(I)=−I=h(I) | pass | — |
| `isJordanDomain_inside`, `jordan_separation` | S: inside D, card 2; main pin `Domain.lean:146` same statement | true, owned | R01 |
| `schoenflies_plane/closure/sphere` | radius 2: h=z/2; main pin `Schoenflies.lean:122,142` | true, owned | R01 |
| `brouwer_fixedPoint₂`, `no_retraction_disc_circle` | z↦−z fixes {0}; `H s t = r((1−s)p t + s)`: s=0 gives p, s=1 gives 1 | true, owned | R01 |
| `invarianceOfDomain₂` | U=∅ vacuous; z↦2z open; second conjunct implies first | true, owned | R01, N02 |
| `isTriangulable_of_compactSurface` | empty M: empty complex; main states `IsCombinatoriallyTriangulable M 2` | weaker than owner | R02 |
| Half-open crossing rule (README 385, 392–398) | q=(0,−1/10): side 1 at x=9/10, count 1; q=(0,0): side 3 at x=2, count 1; q=(0,1/10): x=21/10, count 1 | pass | — |
| `PolygonalLoop.IsSimple` | triangle: 3 pairs, each meets in one vertex; collinear 0,1,2: side1∩side2=[1,2]≠{2}; doubled triangle: Nodup false | pass | — |
| `polygonal_jordan_separation`, `polygonal_schoenflies` | triangle: 2 components, h=affine; bow-tie excluded by IsSimple | pass | R01 on carrier |
| `IsCrosscut`, `IsPolygonalCrosscut` | diameter: endpoints ±1, interior in D; semicircle fails interior clause; parabola y=(1−x²)/2: x²+y²=(1+x²)²/4<1, not polygonal | pass | — |
| `closure_polygonallyAccessible`, `exists_approach_from` | S: every point radially accessible; thomassen1992 lines 282–290 | pass | — |
| `polygonal_crosscut`, `crosscut` | D with diameter: J₁∩J₂=P, J₁∪J₂=S∪P, half-discs disjoint, union D∖P; thomassen1992 308–311 | pass | — |
| Kulpa lemma (README 569–576) | X={0}, f=1: F≡1; kulpa1998 lines 44–47, 210–236 | pass | — |
| `image_boundary`, `boundaryComponentCount` | disc 1, annulus 2, sphere 0, empty 0; annulus inversion swaps circles | pass, also TeichmullerGeometry §0.0b | R03 |
| `exists_pl_approximation_open/halfPlane` | f=id: g=id, error 0<φ; φ=1/(1+‖x‖) admissible; φ=1/q control forces g=f | pass, same as TeichmullerGeometry | R03 |
| Euler characteristic (README 959–963, 1040) | tetrahedron: 15−50+60=25, with −24 gives 1; moves (1,3,2), (0,0,0), (1,2,1): Δχ=0 | pass | — |
| Orientation cover checks | disc: 2 discs; Möbius: annulus, boundary 1→2 circles; sphere: 2 spheres | pass | — |
| `HasMobiusNeighborhood`, `not_isBicollared` | `mk (neg) 0 (t+1) = mk (neg) 0 t` by `mk_vadd`; annulus core sign +1, Möbius −1 | pass | — |
| `isLocallyFlat_circle`, `isSliceEmbedding_arc` | slice `Ici 0 × {0}`: endpoint one branch, interior two; `IsSliceEmbedding` at `LocallyFlat/Basic.lean:365` | pass | — |
| `schoenflies_extend` | S→S conj extends to conj; thomassen1992 338–339 | pass | — |
| `isotopic_of_homotopic_closedSurface` | S²: rotation by π vs id isotopic; reflection degree −1 fails premise; empty M trivial | pass, same name in TeichmullerGeometry | R03 |
| `isotopicRel_of_homotopicRel_compactSurface` | disc: id vs conj, values at I differ, premise false; annulus twist not homotopic rel ∂; epstein1966 533–549 | pass | R03, C02 |
| Epstein inputs (README 1291–1318) | Thm 2.1 line 109 p.86; 3.1 line 214 p.89; 3.3 line 229 p.90; 4.1 line 267 p.91 excludes disc and Möbius band | locators agree | — |
| `SmoothIsotopic(Rel)` | Φ=refl: φ=ψ; `Diffeotopy.final` at `Diffeotopy/Basic.lean:186`; annulus full turn moves ∂ | consistent, unused | C04 |
| Joint regularity checks (1452–1459) | angle r²: slices PL, family not PL; angle |r−½|−½: 0 at r=0, not smooth at ½ | pass | — |
| `exists_boundaryless_transport` | any M: conclusion independent of given atlas | weak | C03 |
| Pinched-disc sentence (1513) | chord quotient has a cut point; text now says "need not itself be a disc" | pass | — |

- Source locators checked against text: 21 (Epstein 12, Thomassen 6, Kulpa 3); all agree with the printed pages.
- Library declarations opened at the branch's pin: 19 (among them `IsPLOn`, `IsSliceEmbedding`, `IsLocallyFlat`, `IsBicollared`, `MappingTorus.mk`, `Isotopy`, `Diffeotopy`, `IsTriangulable`, `IsCombinatoriallyTriangulable`, `IsJordanDomain`, `filledHull`, `boundary_closedBall`); 7 more at main's pin for R01.
- Cross-roadmap citations resolved: ConformalMapping §5.3 (main), AlgebraicTopology Layer 2 note (main; the old Stage 2 anchor is mapped there), GeometricTopology §11.2.1 (main), MathematicalBilliards supplier contracts (main), TeichmullerGeometry §§0.0a–0.0d (open), SurfaceTopology (this pull request).
- Earlier findings (review at 421e114): R01 repaired (line 1513); R02 repaired in the text (module header), build not rerun; R03 repaired (polygonal form in Layer 2, arbitrary form in Layer 7); R04 not repaired, now R01 and R02; R05 repaired (prerequisite table, lines 98–103); R06 repaired (`isotopicRel_of_homotopicRel_compactSurface`); R07 repaired (line 731, "or to an edge"); R08 repaired (two-sidedness, Möbius neighbourhood and isotopy predicates defined); R09 mostly repaired, remainder C04; R10 partly (Thomassen pages corrected, quotation removed; Pachner and smoothing locators still without theorem numbers); R11, R12 are matters of form and not raised; R13 repaired (manifest removed).
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Changes outside the two roadmap folders: none.
- Elaboration: not run. The package directory for the branch's pin is absent on this worker, so `lake env lean` stops before Lean starts; signatures were compared by reading the library at the pin. One-tactic probes were decided by reading.
- Overlap check: read TeichmullerGeometry (open), GeometricTopology (main; open revisions for context), ConformalMapping (Completed, main), MathematicalBilliards (main); shared objects and owners: Jordan separation and Jordan domains, ConformalMapping §5.3; Schoenflies, Brouwer, invariance of domain, Tau Ceti at main's pin; Radó, Hauptvermutung, smoothing, GeometricTopology §11.2.1; PL approximation, boundary invariance, orientations, Epstein, TeichmullerGeometry §§0.0a–0.0d (earlier in the merge order).
- Source independence: 9 passages compared with 3 sources (Epstein, Thomassen, Kulpa), none shared beyond standard names; largest share epstein1966, 12 of about 35 locators; contents compared with epstein1966 (§§1–6 and Appendix against Layers 0–8): independent; Moise's table of contents could not be read.
- Research link: the headline targets are Thomassen's (1992) Jordan–Schoenflies theorems, Radó's theorem and the Hauptvermutung as in Moise (1977), and Epstein's (1966) isotopy theorems, which the open TeichmullerGeometry roadmap uses for Dehn–Nielsen–Baer; rests on the README's references and on Epstein, Thomassen and Kulpa as read.

## Not verifiable

- Moise (1977), §§5, 6, 8, 21–22: paywalled; the approximation, Radó and Hauptvermutung locators and the remark attributed to him in Layer 5 were not checked.
- Pachner (1990), Rourke–Sanderson, Newman, Munkres (book and 1960 paper), Whitehead (1940), Kuiper (1965), Cannon: no readable legal text found.
- The blueprint `alonamaloh/jordan-schoenflies`: read only as a cached PDF for context; its statement index was not compared target by target.
- Elaboration of `Suggested.lean` at the branch's pin, and the author's reported builds: not reproducible on this worker (see above).

Automatic checks set aside as false positives: the build failure, which is a missing object file in the worker's shared package cache and not an error in the roadmap's file; the list of mentions of SurfaceTopology, which is the companion roadmap of the same pull request and is named as a consumer, not as a supplier.

## Source issues

- **Error** in epstein1966 at Theorem 6.4(a), printed p. 101: the source says a homeomorphism homotopic to the identity is isotopic to it, with orientation exceptions only for the plane and cylinders; it should also require orientation preservation on the closed disc, where reflection is homotopic to the identity; affects a stated result.

## For the human reviewers

- Scope: Layers 2, 5, 7 and 8 give second, elementary proofs of theorems that main already owns or Tau Ceti proves at main's pin (R01, R02). Whether a second route is wanted as roadmap targets is yours to decide.
- Ownership: this roadmap and TeichmullerGeometry (#1169) state the same PL and Epstein theorems under the same Lean names (R03); which roadmap owns them needs a decision.
- Licence: the provenance table (README lines 1534–1545) says code may be adapted from `mccorvie/classification-of-surfaces`, `alonamaloh/schoenflies-lean` and `rkirov/jordan_pick` (Apache-2.0, blueprint CC BY 4.0).
- Licence: Epstein and Thomassen were read from cached copies on a university archive and a personal academic page; I could not classify those hosts.
- Not tested: Moise's text and table of contents could not be read; the wording and arrangement checks were not made against it (8 locators).
