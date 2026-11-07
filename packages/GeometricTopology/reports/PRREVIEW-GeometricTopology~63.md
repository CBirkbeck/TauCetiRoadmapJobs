# Review of GeometricTopology (pull request #903 at bbf8ce8)

**Verdict:** needs changes

This is a full review of the repaired head. Since `8cba9b0` the folder changed by 203 lines, all in `README.md`; `Suggested.lean` is byte-identical (md5 `1f4337fb`). My own gate run on this head prints every counter `0` and `OK`. The dependency check prints `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` finds no citation and no Lean name that exists nowhere, and nothing changed outside the folder.

The previous review's cycle with SurfaceTopology is broken: this roadmap now owns the smooth classification of surfaces (Layer 1.7) and the surface mapping class groups (new Layer 1.7.2). That is the right direction. The new text, however, introduces one unowned prerequisite, two statements that are false without an orientation hypothesis, and a three-way ownership of Dehn twists with opposite sign conventions. The sampled knot-theory sections recompute correctly; the table below gives the values.

## R01 (P1) — Layer 1.7's classification route takes Morse functions from DifferentialGeometry, which has none

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:788–791` ("by induction on the saddles of a Morse function; the route through a smooth triangulation, Layer 11.3, and Radó's theorem is the alternative") and `:826–828` ("*Needs:* … DifferentialGeometry (Morse functions on compact manifolds); Mathlib singular homology").

**Claim:** The route now chosen for the smooth classification (Hirsch, Chapter 9) needs a Morse function on a compact surface whose boundary circles are regular levels.
- **DifferentialGeometry has no Morse content.** Its README on main (Layers 0–12: forms, flows, Frobenius, integration, de Rham, degree, metrics) never mentions Morse functions, and neither does its open revision.
- **The roadmaps that do own Morse functions consume this one, so they cannot supply it.** MorseTheory M3 owns Morse approximation but takes "GeometricTopology Layer 1 for collars". HomotopySpheres builds on Layers 1.3 and 1.5.
- **Tau Ceti has only local results at the pin.** It has the predicate `TauCeti.IsMorse` (`Geometry/Manifold/Morse/Basic.lean:178`) and local genericity (`TauCeti.dense_setOfPred_hasNondegenerateCriticalPointsOn_sub`, `Analysis/Calculus/Morse/Generic.lean:197`), but no existence theorem on a compact manifold.
- **The alternative route is not owned upstream either.** The route through Layer 11.3 and Radó needs a combinatorial normal form for triangulated surfaces. That is SurfaceTopology Layer 8, which this head deliberately no longer consumes.

The classification is a premise of 1.7.2, 4.3.2, 4.10.5, 8.3.1, 8.4 and 9.1, so this gap sits under six targets.

**Witness:** `grep -ci morse` on DifferentialGeometry's README gives `0` on main and `0` at #886's head. MorseTheory `README.md:20` on main reads "GeometricTopology Layer 1 for collars".

**Repair:** State the input as a target of 1.7 and replace the *Needs:* item. Suggested wording: "A compact smooth surface `F` carries a smooth `f : F → [0, 1]` whose critical points are nondegenerate, interior and at distinct values, with `∂F ⊆ f⁻¹{0, 1}` a union of regular levels (Hirsch, Chapter 6 §1; Milnor, *Lectures on the h-cobordism theorem*, §2)". Build it from `TauCeti.IsMorse`, `TauCeti.dense_setOfPred_hasNondegenerateCriticalPointsOn_sub`, Layer 1.1's collars and `SmoothPartitionOfUnity.exists_isSubordinate`.

Add two Checks:
- On `D²`, `f = |x|²` has one critical point, of index 0, and `∂D² = f⁻¹{1}`.
- On the annulus `1 ≤ |x| ≤ 2`, `f = |x| − 1` has none, and both boundary circles are levels.

Retest: `grep -n 'DifferentialGeometry (Morse' README.md` returns nothing.

## R02 (P2) — 1.7.2's conjugation law and tube-independence drop the orientation hypothesis

**Location:** `README.md:1021–1024` ("does not depend on the tube, on `φ` or on the orientation of `c`, … and satisfies `f T_c f⁻¹ = T_{f(c)}` for every diffeomorphism `f` fixing `∂F`").

**Claim:**
- **Orientation-reversing `f`.** For closed `F`, `Mod(F)` contains orientation-reversing classes; the section's own Check says "For the closed torus the swap shows the two groups differ". Conjugating by such an `f` replaces the orientation of `F` by its opposite. The same bullet says reversing the orientation inverts the twist, so in fact `f T_c f⁻¹ = T_{f(c)}⁻¹`.
- **Non-orientable `F`.** The definition fixes the twist's direction only "when `F` is oriented". Otherwise the class depends on the orientation of the tube, so "does not depend on the tube" is false.

**Witness:** Use the section's own matrices: swap `S = [[0,1],[1,0]]` and `T_a = [[1,1],[0,1]]`. Then `S T_a S⁻¹ = [[1,0],[1,1]] = T_b⁻¹`, which is not `T_b = [[1,0],[−1,1]]`, although `S(a) = b`. The homology map `Mod(T²) → GL₂(ℤ)` is injective, so the classes differ.

**Repair:** Replace the first clause with: "For `F` oriented, the class of `T_c` does not depend on the oriented tube, on `φ` or on the orientation of `c`, and depends on `c` only through its isotopy class. `f T_c f⁻¹ = T_{f(c)}` for orientation-preserving `f`, and `f T_c f⁻¹ = T_{f(c)}⁻¹` for orientation-reversing `f`. On a non-orientable `F` a twist needs a choice of orientation of the tube, and the two choices give mutually inverse classes." Add the swap computation as a Check. Retest: the new law predicts `T_b⁻¹ = [[1,0],[1,1]]` for the swap, which matches the matrix product.

## R03 (P2) — 1.7.2's rule for cutting along an arc with both ends on one circle fails on non-orientable surfaces

**Location:** `README.md:1041–1044` ("`χ = χ(F) + 1`, with one boundary circle fewer when the endpoints lie on distinct boundary circles and one more when they lie on the same one").

**Claim:** 1.7.2 covers every compact connected surface. When both ends of the arc lie on one circle `C`, the two arcs of `C` and the two copies of `a` close up into two circles only if the band around `a` is untwisted relative to `C`. That is automatic when `F` is orientable. Otherwise they close up into a single circle and the boundary count does not change.

**Witness:** Take the Möbius band `[0,1]²/(0,y)∼(1,1−y)` and the arc `{1/2}×[0,1]`, whose ends both lie on its single boundary circle. Cutting gives one rectangle: `χ = 1 = 0 + 1`, as stated, but one boundary circle, not two.

**Repair:** Replace the last clause with: "… and, when the endpoints lie on the same circle, one more if a regular neighbourhood of that circle together with `a` is orientable (always when `F` is orientable), and the same number if it is a punctured Möbius band". Add the Möbius-band arc as a Check beside the chord. Retest: Möbius band gives `b = 1`, disc chord gives `b = 2`.

## R04 (P2) — Surface mapping class groups, Dehn twists and Lickorish's theorem are now planned by three roadmaps, with opposite twist signs

**Location:** `README.md:127–131` (Scope: "This roadmap owns … the mapping class groups of compact surfaces with their Dehn twists, including Lickorish's twist theorem (Layer 1.7.2)"), `:1004–1091` (1.7.2) and `:12986–13018` (*Downstream consumers*).

**Claim:** Moving these objects into this roadmap fixes the cycle, but two open pull requests that add new roadmaps still plan the same objects. This README does not mention either one:
- **SurfaceTopology Layer 9** (#271 at `421e114`, `README.md:1256–1445`) plans Dehn twists, the annulus and torus mapping class groups, and the Dehn–Lickorish theorem. Its consumer table (`:38–39`) hands "surface mapping classes" to this roadmap's Layer 9.
- **MordellLawrenceVenkatesh LV.5 §§5.9–5.12** (#1231 at `3756140`, `README.md:1816–1872`) plans the mapping class group, Dehn twists and their action on homology. The MappingClassGroupsAndCanonicalRepresentations design on the board imports these objects from LV.5 "pending transfer to topology owners".

Both of those roadmaps consume this one (SurfaceTopology uses Layer 11.1 at `:89, :1010, :1144`; MordellLawrenceVenkatesh uses Layer 1 at `:320`), so this roadmap is the earlier owner and they should cite it. The plans already disagree on the sign: MordellLawrenceVenkatesh's positive twist is 1.7.2's inverse.

**Witness:** MordellLawrenceVenkatesh `README.md:1869` at #1231 gives, for `î(a,b) = 1`, `T_a = [[1,−1],[0,1]]` and `T_b = [[1,0],[1,1]]`. Its model annulus is oriented by `dt∧dθ` with twist `θ ↦ θ + 2πt`. This README (`:1059–1061`) and SurfaceTopology (`:1277`) give `T_a = [[1,1],[0,1]]` and `T_b = [[1,0],[−1,1]]`.

**Repair:**
1. Extend the Scope bullet at `:127–131`: "SurfaceTopology Layer 9 and MordellLawrenceVenkatesh LV.5 §§5.9–5.12 consume Layer 1.7.2. Their topological mapping class groups are 1.7.2's through PlanarTopology Layer 8 (`exists_isotopic_diffeomorph`, `smoothIsotopic_of_isotopic`), and they do not plan Dehn twists or Lickorish's theorem again."
2. Add both roadmaps to *Downstream consumers* with those items, including SurfaceTopology's use of Layer 11.1's ordered-simplex complex and CW structure.
3. Add a 1.7.2 Check that pins the other model. In coordinates `θ' = −θ/2π` the map `θ ↦ θ + 2πt` on the `dt∧dθ`-oriented annulus becomes `θ' ↦ θ' − t`, which is `T_c⁻¹`. Its torus matrices are therefore `[[1,−1],[0,1]]` and `[[1,0],[1,1]]`.
4. Say in the pull request description (not the README) that #271 and #1231 are to be rebased to cite 1.7.2.

Retest: the inverses of the matrices at `:1060` are the Check's matrices.

## R05 (P3) — 4.2.3 and 4.5.5 judge "the source" without naming it

**Location:**
- `README.md:1764–1765` ("Thus the source's unqualified 6₁ answer uses a mirror-insensitive label") and `:1774` ("The two proposed answers for 6₃").
- `:5805–5819`: the four rows "compared with their tabulated values", including "the coefficient of t is overwritten".
- `:5829`, `:5892` ("no value of c repairs the source's 9₄₂ row"), `:5903`.

**Claim:** Both sections assess a table and exercise answers from a text that is identified nowhere: neither the sections nor *References* give an author, title, page or table number. A reader therefore cannot check the claims about it: that its 9₄₁ row is `E`, that a 9₄₂ coefficient is overwritten, what the "two proposed answers" were. Every one of these claims lacks a locator. Review 61 repaired the same pattern for "problem N"; these lines remain. The mathematics in both sections is sound (see the table).

**Witness:** *References* (`:13019–13225`) has no text with a four-row Jones table or exercises on 6₁ and 6₃. `grep -n 'the source' README.md` returns 47 lines, including those above.

**Repair:** Do one of the following:
- Name the text in each section, with page, table and exercise locators, add it to *References* and to `sources.toml`.
- Or delete the remarks about the text and keep only the mathematics: `F`, `E = V(T(2,−9))`, `G`, the scalars of `R_c`, `V_z = V_S(t⁻¹)`, and the exclusion of `u` by `|V(−1)| = 5`.

Then check the other "the source" lines the same way.

## R06 (P3) — 4.2.6's plane/sphere count holds only after forgetting orientations

**Location:** `README.md:2423–2425` ("With `B = 0` and `μ = 2` there are two plane classes, two nested circles and two side-by-side circles, but one spherical class").

**Claim:** The carrier keeps orientations: "Keep fixed component labels and orientations" (`:2342–2343`), and "component directions … are finite data" (`:2349`). An orientation-preserving isotopy of the plane preserves each circle's winding sign. On `S²` it preserves which side of each circle, the disc side or the annulus side, lies to its left.

**Witness:** Count oriented, unlabelled diagrams with `B = 0`, `μ = 2`:
- In the plane: side by side `{+,+}, {+,−}, {−,−}` gives 3 classes, and nested with inner and outer signs gives 4, so 7 plane classes.
- On `S²`: the number of circles with the disc side on their left is `0, 1` or `2`, so 3 classes.

**Repair:** Use this wording: "With `B = 0` and `μ = 2`, after forgetting orientations, there are two plane classes … and one spherical class. With orientations kept there are 7 plane and 3 spherical classes, and forgetting the point at infinity maps the 7 onto the 3." Retest: (inner `+`, outer `+`) maps to the mixed spherical class, (`+`, `−`) to the disc-disc class, and (`−`, `+`) to the annulus-annulus class.

## R07 (P3) — The dropped "smoothing-and-triangulation comparison" anchor has no old → new line

**Location:** `README.md:485–488`: the anchor map lists only Layer 1 and Layer 4.

**Claim:** Main's heading `## The smoothing-and-triangulation comparison (far horizon)` (main `GeometricTopology/README.md:930`) does not exist at this head. Its three items moved as follows:
- item 1, Whitehead's smooth triangulation, is now Layer 11.3 (`:12875–12879`);
- item 2 is Layer 1.6 with `TauCeti.PLGroupoid_le_continuousGroupoid`;
- item 3 belongs to GeometricTopology, Part II.

IndexTheory cites the anchor at its open head. Two roadmaps on main cite the same section under the bare anchor, which already fails to resolve on main.

**Witness:**
- IndexTheory `README.md:66` at #1077: "…#the-smoothing-and-triangulation-comparison-far-horizon), item 1".
- GeneralizedCohomology `README.md:1392` and RiemannianGeometry `README.md:514` on main use `#the-smoothing-and-triangulation-comparison`.

**Repair:** Add to `:485–488`: "`#the-smoothing-and-triangulation-comparison-far-horizon` and `#the-smoothing-and-triangulation-comparison` → Layer 11.3 (item 1, smooth triangulations); item 2 is Layer 1.6 and item 3 GeometricTopology, Part II." Retest: the third dropped id in the overlap index is then mapped.

## R08 (P3) — The build paragraph and two *Dependencies* lists miss the edges added for 1.7.2 and 5.2

**Location:** `README.md:470–477` ("Four groups of targets are built before the layer numbering suggests … With these edges the graph of targets is acyclic"), `:1101–1107` (Layer 1 *Dependencies*), `:11342–11346` (Layer 5 *Dependencies*).

**Claim:** Two new early edges are not recorded:
- 1.7.2 needs Layers 3.1, 3.3 and 3.4 (`:1087–1089`), so Layers 3.1 and 3.4 are built before part of Layer 1.
- 5.2 now needs Layers 1.7.2 and 9.1 (`:11013`), so 9.1 is built before Layer 5.

The paragraph still lists four groups and omits both. Layer 1's *Dependencies* name Layer 3.3 only for 1.4, and Layer 5's name neither 1.7.2 nor 9.1. The target graph is still acyclic (3.4 → 3.1, 3.3 → 1.5; 9.1 → 1.3, 1.7, 1.7.2, 11.2), so only the documentation is wrong.

**Witness:** Compare `:11013` ("*Needs:* Layer 1.3, Layer 1.7.2, Layer 5.1, Layer 9.1") with `:11344–11346` ("Layer 1.3 (gluing), Layer 1.5 (tubes), Layer 3.3 (isotopy extension), Layer 4 (links), Layer 8 …").

**Repair:**
- In `:470–477`, add "Layers 3.1–3.4 precede Layer 1.7.2, and Layer 9.1 precedes Layer 5.2", and change "Four" to "Six".
- Add "Layers 3.1 and 3.4 for Layer 1.7.2" to `:1101–1107`.
- Add "Layer 1.7.2 (Dehn twists) and Layer 9.1 (Heegaard splittings), for the Lickorish–Wallace theorem" to `:11344–11346`.

## R09 (P3) — Three open pull requests change this folder and no order is stated (previous R02, not repaired)

**Location:** the pull request description (`scratch/pull-request.md`, data).

**Claim:** As before, #1517 (`2559c13`), #1791 (`fcad6f1`, draft) and #1797 (`84818d4`) conflict with this head in `README.md`; #1517 and #1797 also conflict in `Suggested.lean`. The description still names none of them. Two of them now matter more:
- **#1791** adds SurfaceTopology citations to this folder (its `README.md:754`, "classification for the splitting surface from [Surface Topology]"). This head removes them on purpose; merging #1791 after it would recreate the cycle.
- **#1797** still replaces the folder by a 3343-line, twelve-layer README with "Layer 12: the smoothing-and-triangulation comparison" (its `:3114`). That is the content R07 maps to Layer 11.3.

**Witness:** `grep -o -E '#[0-9]{3,4}' scratch/pull-request.md` finds only `#903`. The overlap index lists the three conflicting heads.

**Repair:** Add one sentence to the description, not the README. It should say that #1517's change is subsumed by this head's Conventions, that #1791's SurfaceTopology links are not to be merged (they reintroduce the cycle), and whether #1797 is rebased onto this head or this head onto #1797. In the latter case, name which of #1797's section ids this README keeps.

## Previous findings

- **R01 (P2, SurfaceTopology cycle): repaired.** No SurfaceTopology supplier citation remains; `grep -n SurfaceTopology README.md` gives only the Scope sentence at `:130`. The classification is 1.7's and the mapping classes are 1.7.2's. The move gives rise to R01 and R04 above.
- **R02 (P3, order of #1517/#1791/#1797): not repaired.** It is raised again as R09; no repair report marks it as not actionable.
- **R03 (P3, Kindred title): repaired.** `:13093–13094` reads "*A geometric proof of the flyping theorem*, arXiv 2008.06490, §2.2, Definition 2.11 and footnote 11".
- **R04 (P3, interval collar): repaired.**
  - `:521–525` gives `{0,1} × [0,1) → [0,1]` with `(0,t) ↦ t/2` and `(1,t) ↦ 1 − t/2`, image `[0,1/2) ∪ (1/2,1]`. At `t = 1/2` the two values are `1/4` and `3/4`, now distinct.
  - The bullet at `:510–512` now composes the restriction with the rescaling `(x,t) ↦ (x,εt)`.

## Verified sound

**Gate and tools (my runs).**
- **Gate:** `gate … --base origin/main` prints every counter `0` and `OK`.
- **Dependency check:** `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`.
- **Citations:** `roadmaps resolve` finds no citation and no Lean name that exists nowhere.
- **Folder:** nothing outside it changed. It holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `STATUS.md` and `PROGRESS.md`.

**Suggested.lean.** md5 `1f4337fb`, unchanged.
- **Elaboration:** `lake env lean` gives 17 `declaration uses sorry` warnings and nothing else, exit 0.
- **Signatures:** a scratch copy with `#check @` for all 17 declarations prints each type with the README's hypotheses. There is no `variable` block, so no binder can be lost. `sphere_theorem` and `waldhausen_theorem` carry `TauCeti.Orientable (𝓡 3) ∞`; the Poincaré statement is at `IsManifold (𝓡 3) 0` with `CompactSpace`, `T2Space`, `SecondCountableTopology` and `SimplyConnectedSpace`; `manolescu_triangulation_conjecture_false` needs `5 ≤ n`.
- **Padding probe:** the one-tactic probe (`first | rfl | simp | infer_instance | decide | trivial | aesop`) fails at all 17 declarations (lines 73–201), so nothing is padding.
- **Headlines:** the docstring's count (fourteen Kirby-list theorems plus Moise, the sphere theorem and Waldhausen) matches the 17 declarations. The headlines that cannot be stated at the pins (Li, Weeks, Property P/R and cyclic surgery, Kondo, Cerf's orientation-preserving form, Kneser–Milnor, Novikov–Rosenberg, Zeeman) are named in the module docstring, each with its missing carrier. 1.7.2 adds no headline that could be stated at the pins: Lickorish's theorem has no mapping-class carrier there.

**Library declarations opened at the pins (24).**

Tau Ceti:
- `TauCeti.TemperleyLieb.markovTrace`, normalized `markovTrace_one = δ ^ n` with `δ = −(q + q⁻¹)` (`Algebra/TemperleyLieb/MarkovTrace.lean:452, 462`);
- `jonesDelta a = −(a² + a⁻²)` and `jonesUnit = a + a⁻¹ e_i` (`KnotTheory/TemperleyLieb.lean:85, 105`). With `a² = −u⁻¹`, `jonesDelta = u + u⁻¹` and `jonesUnit = (−a/u)(u²E − u)`, exactly as 4.5.6 says;
- `ArtinGroup.exponentSum` (`GroupTheory/Coxeter/Artin.lean:226`);
- `permHom` and `pureSubgroup = (permHom n).ker` (`GroupTheory/SpecificGroups/Braid/Basic.lean:304, 394`);
- `PDCode.IsPlanar` (`KnotTheory/PDCode/Planar.lean:350`), `BraidWord.closure` (`KnotTheory/BraidWord/PDCode.lean:354`), `MarkovEquiv` (`KnotTheory/Markov.lean:203`), `HasReidemeisterThreeTriangle` (`KnotTheory/PDCode/Reidemeister/Three/Basic.lean:164`) and `isPlanar_insertClasp_iff` (`KnotTheory/PDCode/ClaspInsertion.lean:1042`);
- `Matrix.signature_add_transpose` and `Matrix.signature_eq_of_congr_diagonal` (`LinearAlgebra/Matrix/Signature.lean:136, 178`), `signature_enlargeColumn` (`KnotTheory/Signature.lean:103`), `tristramLevineForm` (`KnotTheory/TristramLevine/Basic.lean:76`);
- `IsSphereBoundsBall` (`Geometry/Manifold/Irreducible.lean:42`), `FramedBoundaryTorus.slopeEquiv` (`LowDimTopology/DehnSurgery/Slope.lean`), `triangulationConjecture_zero` (`Topology/TriangulationConjecture.lean:97`);
- `Diffeomorph.isTopologicalGroup` (`Geometry/Diffeomorphism/Inversion.lean:241`);
- `TauCeti.IsMorse` (`Geometry/Manifold/Morse/Basic.lean:178`) and the generic-perturbation theorems of `Analysis/Calculus/Morse/Generic.lean`. A search for a global existence theorem for Morse functions found none (R01).

Mathlib: `CoxeterMatrix.A` (`GroupTheory/Coxeter/Matrix.lean:107`), `ContractingWith.fixedPoint` (`Topology/MetricSpace/Contracting.lean:275`), `Matrix.SpecialLinearGroup` (`LinearAlgebra/Matrix/SpecialLinearGroup.lean`).

**Cross-roadmap citations resolved (7).**
- PlanarTopology Layers 5, 7 and 8 at #271's head. Layer 8 has `exists_isotopic_diffeomorph`, `exists_isotopicRel_diffeomorph` and `smoothIsotopic_of_isotopic`, which back the widened contract at `:431–434`.
- DifferentialGeometry Layers 3, 4, 5 and 12 on main exist; its Morse functions do not (R01).
- Layer 3.4 proves `Diff(S²) ≃ O(3)` (`:1411–1414`), as 1.7.2 cites it.
- SurfaceTopology and MordellLawrenceVenkatesh at their heads, read for R04.
- IndexTheory at #1077, read for R07.
- ComplexCurveModuli on main (`README.md:17, 27`) cites "GeometricTopology Layer 1's … finite smooth handle decompositions … `smoothElementaryMorseCobordismHandleComparison`". That resolves neither on main nor here. This head names HomotopySpheres §§1.2–1.6 as the owner of handle theory, so it is a correction for ComplexCurveModuli, not a finding for this folder.

**Target-level acyclicity of the new edges.** 1.7.2 → 1.5, 1.7, 3.1, 3.3, 3.4; 3.4 → 3.1, 3.3; 3.3 → 1.5; 5.2 → 1.3, 1.7.2, 5.1, 9.1; 9.1 → 1.3, 1.7, 1.7.2, 11.2; 11.2 → 1.6, 11.1. No edge returns into Layer 5 or 9.

**Sources at their locators (seeded sample).**
- **§1.2:** Hirsch Chapter 4, Theorem 6.1, cited by locator only (`hirsch1976`, settled as uncertified). The Checks are recomputed in the table.
- **§4.2:** Lickorish Chapter 1, Proposition 16.10 and Burde–Zieschang Chapter 1, by locator (see Not verifiable). The Checks are recomputed by state sum.
- **§4.2.1:** Birman–Brendle §1 by locator. Every algebraic claim is recomputed.
- **§§4.2.3, 4.5.5:** the mathematics is recomputed. The unnamed source is R05. The Knot Atlas 9₄₁ PD rows give exactly `F`.
- **§4.2.4:** the Checks are recomputed. Burde–Zieschang by locator.
- **§4.2.6:** Burton et al., arXiv 2104.14076v1, §1.1 (lines 42–103: diagrams in `S²`, the plane footnote at lines 82–84, extra crossings `m(D) = Top(D) − cr(D)` at line 103) and §1.2 (line 110), as cited. See R06 for the Check.
- **§4.4.4:** every identity is recomputed exactly.
- **§4.5.6:** Jones, Bull. AMS 12 (1985), printed p. 106 (AMS open archive, lines 135–157): Theorem 8 (`k > 3`), Corollary 9 (gcd of exponents), Theorem 10 (`k = 3, 4, …`) and Corollary 11 (transcendental `t`), as cited.
- **§4.11.2:** the matrices and the table are recomputed.
- **§4.15:** all nine PD inputs and every orientation mask are recomputed.
- **§5.4.1:** Taylor, arXiv 0806.1572v2, Theorem 5.12, printed p. 31 (lines 1123–1130). The hypotheses are as the README restates them (distance `d ≥ 1`; `Lα` a knot or `∂W − ∂α` incompressible; `Lα` split or without a minimal-genus Seifert surface disjoint from the arc). The conclusion `|Q ∩ β̄|(d − 1) ≤ |∂Q| − 2` also matches. Corollary 5.13 is at lines 1141–1159; see Source issues.
- **§8.1:** Hatcher's `3Mfds.pdf`, the edition the README declares (`:13031–13036`): Theorem 1.1 (line 57), Proposition 1.4 (line 200), Proposition 1.13 (line 811, irreducibility of Seifert-fibred manifolds), Theorem 3.1 (line 2003), Corollary 3.2 (line 2114) and Theorem 3.8 (line 2219). The remark at lines 2225–2230 gives `S¹ × ℝP²` irreducible "by Proposition 1.13", as the Check cites it. The cached `3M.pdf` numbers the latter Proposition 1.12, as the README's note says.
- **§8.5.2:** Whitten 1987 and Friedl's notes, see Not verifiable. The Checks are recomputed.
- **§11.4:** Manolescu, JAMS 29 (2016) (arXiv 1303.2354v4, cache `cad3ace3`): Corollary 1.3 at line 72; triangulability of orientable 5-manifolds at lines 78–80; non-orientable `M⁵`, `M⁵ × Tⁿ⁻⁵` and the orientable examples from dimension 6 at lines 80–86. Lectures (`manolescu2016`): Theorem 1.1 at line 15; lines 257–258 agree.

**Adversarial table.** It covers the sampled targets, the headline theorems and every target a finding touches, with values computed this round. The Jones polynomials come from a Kauffman-bracket state sum (`σ_i ↦ A + A⁻¹e_i`, `t = A⁻⁴`), calibrated by `σ₁³ ↦ t + t³ − t⁴`. The 4.15 values come from the README's own PD tuples, its orientation-mask rule and its arc relations, with determinants interpolated exactly.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §1.1 interval collar (repaired) | `t = 1/2`; `t → 1` | `(0,1/2) ↦ 1/4`, `(1,1/2) ↦ 3/4`; image `[0,1/2) ∪ (1/2,1]`, open; the old formulas both give `1/2` | right |
| §1.1 restriction bullet | `ε = 1/2` | `c(x, t/2)` on `∂M × [0,1)`, image `c(∂M × [0,1/2))`, open | right |
| §1.2 complements | `n = 1`, `M = ℝ`; `S¹`; `Sⁿ` minus two balls; `ℝⁿ` minus `B°` | two components; interval with `∂ = S⁰`; `Sⁿ⁻¹ × [0,1]`; `x ↦ (x/\|x\|, \|x\|)` onto `Sⁿ⁻¹ × [1,∞)` | right |
| §1.7 genus and rank | `T²`, `S²`, `T²∖D`, `D²`, annulus, Möbius | `χ = 0, 2, −1, 1, 0, 0`; `g = 1, 0, 1, 0, 0`; Möbius `k = 1`; rank `H₁ = 2, 0, 2, 0, 1`; `(rank − b + 1)/2` gives `3/2` for `T²` and `1/2` for `S²` | right |
| §1.7 disjoint circles and Möbius bands | genus `g`, `k` cuts | cutting `k` two-sided circles keeps `χ` and adds `2k` circles, genus `g − k ≥ 0`; removing `k` Möbius bands keeps `χ`, adds `k` circles, crosscaps `0` left | right (Hirsch by locator) |
| §1.7 Morse route | DifferentialGeometry on main and at #886; Tau Ceti pin | 0 occurrences of "Morse"; only `IsMorse` and local genericity | R01 |
| §1.7.2 twist well defined | change of tube coordinates `(θ,t) ↦ (−θ, 1−t)` and `(−θ, t)` | first preserves `dθ∧dt` and gives `θ' + ψ(t')`, `ψ(t) = 1 − φ(1−t)`: same twist; second reverses it and gives `θ' − φ(t)`: inverse | right for oriented `F` |
| §1.7.2 conjugation | torus swap `S` | `S T_a S⁻¹ = [[1,0],[1,1]] = T_b⁻¹`, `S(a) = b` | R02 |
| §1.7.2 `Mod = Mod⁺` with boundary | `df` at a fixed boundary point | `[[1, *], [0, c]]`, `c > 0`, so det `> 0` | right |
| §1.7.2 annulus | `Tⁿ` on the radial arc | lift ends at `nφ(1) = n` | right |
| §1.7.2 torus | `a·b = +1` | `T_a[b] = b + a`, `T_b[a] = a − b`; `T_aT_b[a] = −b`, `T_bT_a[a] = a − b`; `[[1,1],[0,1]]` and `[[1,0],[−1,1]]` generate `SL₂(ℤ)`; `3g − 1 = 2` | right |
| §1.7.2 homology sign | core `c` (`+θ`), radial `x` (`+t`), `dθ∧dt` | `c·x = +1`, `T[x] = x + c` | right |
| §1.7.2 cutting | `T²` along a nonseparating circle; annulus along a radial arc; disc along a chord; Möbius band along a transverse arc | `(χ, b) = (0,2), (1,1), (2,2), (1,1)` | R03 (Möbius) |
| §1.7.2 versus the `dt∧dθ` model | `θ ↦ θ + 2πt`, `θ' = −θ/2π` | `θ' ↦ θ' − t = T⁻¹`; matrices `[[1,−1],[0,1]]`, `[[1,0],[1,1]]` | R04 |
| §4.2 Checks | `σ₁³`, `σ₁`, `σ₁²`; Gauss `1212`, `1122` | `V = t + t³ − t⁴`, `V(−1) = −3`; 1 and 2 components; `1212` has one symbol between its two 1s (Gauss parity fails); `1122` is two curls | right |
| §4.2.1 square quotients | `B₂ ≅ ℤ`; `B₃`, `b = σ₀σ₁` | `N_gen = N_all = 2ℤ`; `perm(b²)` is a 3-cycle, so `b² ∉ N_gen` but `b² ∈ N_all`; `\|S₃\| = 6` against `\|C₂\| = 2`; `sign ∘ perm = (−1)^e` | right |
| §4.2.3 `w` | `σ₁σ₂σ₃σ₂⁻¹σ₄σ₁⁻¹` | equals `(σ₁σ₂)(σ₃σ₄)(σ₁σ₂)⁻¹`; permutation one 3-cycle and two fixed points; `V = t⁻¹ + 2 + t`, the 3-component unlink | right |
| §4.2.3 `z` | `(σ₁⁻¹σ₂σ₃⁻¹)²σ₃³` | exponent sum `1`; 4-cycle `1→3→2→4`; `V = t⁻² − t⁻¹ + 2 − 2t + t² − t³ + t⁴ = V_S(t⁻¹)`; `V(−1) = 9`; `Δ(−1) = 9` | right |
| §4.2.3 `u`, `v` | `a⁻²b⁻²a⁻¹b⁻¹`; `b⁻²ab⁻¹a²` and its `Δ`-conjugate | `V_u = −t⁻⁷ + t⁻⁶ − t⁻⁵ + t⁻⁴ + t⁻²`, `\|V(−1)\| = 5`; `V_v = −t⁻³ + 2t⁻² − 2t⁻¹ + 3 − 2t + 2t² − t³` for both, `13` | right |
| §4.2.3 cyclic closures | `(n,m) = (3,2), (2,2), (n,0)` | `gcd = 1, 2, n` | right |
| §4.2.4 contraction | `u(x) = −x`, `−x/2` | `F₁ = 0`; `‖F_t x − F_t y‖ ≥ ‖x − y‖/2` | right |
| §4.2.6 counts | `B = 0`, `μ = 2` | unoriented 2 plane / 1 sphere; oriented 7 / 3 | R06 |
| §4.2.6 kink | one-crossing curl | peak `max(1,0) = 1`, extra `0` | right |
| §4.4.4 | `V` as displayed | `Vᵀ − V = J ⊕ J`, det `1`; `det V = 64`; `D(2), D(3), D(−1), D(5) = 36, 841, 1089, 15129`, equal to the formula and to `(8t² − 17t + 8)²`; `det P = 1`; `PSPᵀ = diag(4, −41/4, 180/41, −121/20)`; `det S = 1089`; inertia `(2,2)` | right |
| §4.5.5 `F` | `b41` closure; Atlas PD rows | both give `F` exactly (writhes `−2`, `−3`); `F(1) = 1`, `F(−1) = 49`; support `[−6, 3]` | right |
| §4.5.5 `E` | `σ₁⁻⁹` | `V = E`; `E(−1) = 9`; support `[−13, −4]` | right |
| §4.5.5 `R_c`, `G` | `c` general, `c = −2` | `R_c(1) = 3 + c`, `R_c′(1) = 2 + c`, `R_c(−1) = 15 − c`, `R_{−2}(−1) = 17`; `G(1) = 1`, `G(−1) = −7` = Conway-normalized `Δ_{9₄₂}(−1)` (`1 − 2z² − z⁴` at `z² = −4`) | right |
| §4.5.5 `V(−1) = Δ(−1)` | `3₁`, `4₁` | `−3 = −3`, `5 = 5` | right |
| §4.5.6 traces | `g = u²E − u` | `tr g = −1/δ`; Hopf `−u − u⁵` (state sum `−t^{1/2} − t^{5/2}`); trefoil `−u⁸ + u⁶ + u² = t + t³ − t⁴`; `T_n(1) = δⁿ` at the pin | right |
| §4.5.6 common exponent | `u = e^{πi/2d}`, `d` odd | eigenvalues `−u`, `u³`; `(−u)^d = u^{3d} = −i` | right |
| §4.5.6 `k = 3` | `σ₁σ₂`, `δ = 1` | value `1 = (−1)²`, braid index `1` | right |
| §4.11.2 | general `ε`, `m`; `ω = −1`; `(+,−1)`, `(+,1)` | `S V Sᵀ = [[−ε,1],[0,m]]`; `C(−Vᵀ)Cᵀ = V_{(−ε,−m)}`; `det H = −c(1 + εmc)`; at `c = 4`: `−4(4εm + 1)`; roots `c = 1`, `ω = e^{±πi/3}`; `Q V Qᵀ = [[1,1],[0,−1]]`; `d = 3, 1, 5, 9, 13, 11` | right |
| §4.15 links | 9 PD rows × all masks (48 cases) | every `A` and every Fox factor list as tabulated; two different minors agree; Q: `z⁴ + 3z²` and `−z²`; P: `3z²` and `−(z⁴ + z²)` (spanning-tree linking sums `3`, `−1`) | right |
| §4.15 knots | `6₁` against `T#T` | `ℤ/9` against `(ℤ/3)²`; mod-3 dimensions `1`, `2` | right |
| §5.4.1 | `n = 1`; `k = 0` | `i = n·2² = 4`, `d = 2` (crossing change); `0`; tubed surface `χ = −1`, `g = 1`; `χ₋` of disc, annulus, punctured torus `0, 0, 1` | right |
| §8.1 | `S¹ × ℝP²`; `S² × S¹`; granny, square | `π₂ = ℤ` and irreducible (`3Mfds` Proposition 1.13); `π₂ ≠ 0`; signatures `−4`, `0` | right |
| §8.5.2 | granny and square groups | `⟨a,b,c \| aba = bab, aca = cac⟩`; `\|σ\| = 4, 0` | right |
| §11.4 | `n = 5` orientable; `n ≥ 6` | triangulable (JAMS lines 78–80); orientable counterexamples from 6 (lines 82–86) | right |
| Headlines | 17 declarations | `#check` types as in the README; probe fails at all 17 | right |

**Degenerate cases checked without a defect:**
- `∂F = ∅` and `D²` (`Mod` trivial) in 1.7.2;
- `n = 0, 1` (trivial braid groups, `C₂` only from `n ≥ 2`) in 4.2.1;
- `m = 0` and `n = 1` in 4.2.3's cyclic closures;
- `n = 3` (vacuous discriminants) in 4.2.4;
- `μ = 0` and the empty diagram in 4.2.6;
- `m = 0` (`Δ = 1`, `d = 1`) and `ω = 1` (nullity 2) in 4.11.2;
- the empty link and split unions (order 0) in 4.15;
- `k = 0` in 5.4.1;
- `n = 0` in 11.4.

## Not verifiable

- **Hirsch, *Differential Topology*** (Chapter 9, Theorems 3.5–3.7, 3.10, 3.11 and Lemmas 3.8–3.9 in 1.7; Chapter 4, Theorem 6.1 in 1.1–1.2): settled as uncertified (`hirsch1976`), cited by locator. The surface arithmetic was recomputed instead.
- **Farb–Margalit and Lickorish (1.7.2):** Farb–Margalit Lemma 2.1, Proposition 2.4, Theorem 2.5 and Theorem 4.1 are settled as uncertified. Lickorish 1962 ("the twist theorem") and 1964 ("its main theorem") are also settled as uncertified, and these two locators give no theorem number.
- **Lickorish GTM 175, Burde–Zieschang Chapter 1, Birman Chapter 2 (4.2, 4.2.4):** paywalled, not fetched.
- **The text behind 4.2.3 and 4.5.5:** unnamed (R05), so neither its table nor its answers could be read.
- **Whitten, Topology 26 (1987) (8.5.2):** not fetched.
- **Friedl's knot-theory notes (8.5.2):** the author-page PDF had not finished downloading by the time of writing, so Theorem 16.11, footnote 115 and Lemma 7.3 were not read.
- **Gordon–Luecke, JAMS 1989 (8.1):** not reread.
- **Hoste–Thistlethwaite–Weeks and Rolfsen's table (4.15):** settled as uncertified. The 4.15 values were recomputed from the README's own PD rows.
- **Ownership against open pull requests:** checked through `roadmaps grep` for "Lickorish" and "Dehn twist" over the 466 open heads and main, and by reading SurfaceTopology and PlanarTopology at #271, MordellLawrenceVenkatesh at #1231, IndexTheory at #1077, the three conflicting versions of this folder, and the MappingClassGroupsAndCanonicalRepresentations design on the board. No other sibling checkout was reopened.

## Source issues

- **Gap** in Taylor, *Adding 2-handles to sutured manifolds*, arXiv 0806.1572v2, at Corollary 5.13, proof, printed p. 32: the proof applies Theorem 5.12 to the unknot `Lα` without checking its hypothesis that `Lα` has no minimal-genus Seifert surface disjoint from the arc; it should treat a spanning disc missing the arc separately, since tubing it gives genus at most one, impossible for a composite knot; affects the proof.
