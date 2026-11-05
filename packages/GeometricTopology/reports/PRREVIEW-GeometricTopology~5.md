# Review of GeometricTopology (pull request #903 at 585080b)

**Verdict:** needs changes

The ownership repair asked for last round is done: the proofs of Cerf's theorem, the Smale conjecture, Mostow rigidity, the Gordon–Luecke theorem and the JSJ theorem are now GeometricTopology, Part II's, and this folder states them. Twenty of the twenty-five previous findings are repaired. One P1 (seven consumed declarations that do not exist at the pin) and three P2 findings (the companion files, the concordance kernel, and a new missing hypothesis in the two-bridge classification) remain, with one new P2 on self-contradicting ownership of the cyclic surgery theorem's proof.

## Disposition of the previous review

Locations are in `TauCetiRoadmap/GeometricTopology/README.md` unless specified.

| Previous finding | Current passage and disposition |
|---|---|
| R01, Part II ownership | **Repaired.** Lines 108–115: Part II "starts where this roadmap stops … and owns their proofs that this roadmap does not: Cerf's theorem and Hatcher's proof of the Smale conjecture …, Mostow rigidity …, the Gordon–Luecke theorem …, and the JSJ theorem". Lines 1018–1027, 1948–1961, 2093–2098 and 2250–2256 say the same at each theorem; `Suggested.lean:23–31` agrees. The Layer 3, 7 and 8 scope bullets (lines 35–39, 58–64) now say "statement". |
| R02, seven missing declarations | **Not repaired.** Lines 220, 241–245, 288, 306, 592, 673, 692, 1264, 1294, 1574 and 1609 still consume the seven names. See R01 below. |
| R03, smooth currying | **Repaired.** Lines 937–946: "No continuity of the inverse is claimed"; the Check at 956–960 computes the oscillating family. |
| R04, taut-foliation corollary | **Repaired.** Lines 2476–2481 carry closed, connected, orientable, transversely oriented and "not finitely covered by `S² × S¹`"; the Check at 2494–2497 keeps `S² × S¹` as the negative control. |
| R05, suspension of the Poincaré sphere | **Repaired.** Lines 2617–2624: `ΣP` is not a manifold; `Σ²P ≅ S⁵` carries a non-combinatorial triangulation; `E8 × S¹` is the triangulable non-PL example (lines 2601–2607). |
| R06, link of a face | **Repaired.** Lines 2530–2535 state the join law `∂σ ∗ Lk(σ)`; the edge Check at 2546–2549 gives `S⁰`. |
| R07, alternating Jones span | **Repaired.** Lines 1348–1356: `span V_L = c(L) + s − 1`; the unlink Checks at 1382–1384 compute `1 = 0 + 2 − 1` and `2 = 0 + 3 − 1`. |
| R08, raw versus averaged signature | **Repaired.** Lines 1785–1808 define `σ̄`, restrict the raw bound to `S¹_!` and attribute the averaged bound to Powell; the Check at 1819–1822 gives the slice example. |
| R09, Hatcher's essential surfaces | **Repaired.** Lines 2208–2214 state the essential-surface hypothesis with Hatcher's definitions; the `T³` sphere Check at 2228–2233. |
| R10, third reducible exception | **Repaired.** Line 2215 lists `ℝP³ # ℝP³`; Check at 2224–2227. |
| R11, Seifert invariants | **Repaired.** Lines 2197–2206 include base orientability, the fibre orientation character and `b`; Check at 2233–2238. |
| R12, Kneser finiteness | **Repaired.** Lines 2124–2134 state both finiteness theorems with the punctured-sphere and no-product conditions; Checks at 2150–2156. |
| R13, composite Fox colourings | **Repaired.** Lines 1300–1310: `n · ∏ gcd(n, d_i)`; Check at 1324–1327 gives 18 six-colourings of the trefoil. |
| R14, surgery hypotheses | **Repaired.** Lines 1683–1691: "distance at most one", `|r|, |s| ≥ 2`, the unknot excluded; Checks at 1703–1707. |
| R15, forgetful topology in dimension zero | **Repaired.** Lines 893–898; the `S⁰` Check at 909–911. |
| R16, doubling | **Repaired.** Lines 507–508; Check at 514–517. |
| R17, connected sum | **Repaired.** Lines 545–556; Checks at 566–571. |
| R18, Klein-bottle cusps | **Repaired.** Lines 1978–1984 and 1997–1999; the Gieseking and empty-manifold Checks at 2006–2011. |
| R19, genus-one lens spaces | **Repaired.** Lines 2374–2376; Check at 2391–2392. |
| R20, duplicate Diff targets | **Repaired.** Lines 884–890 and 931–933 consume `Diffeomorph.isTopologicalGroup`; lines 781–786 consume `TauCeti.SmoothEmbedding.isLocallyFlat`; line 2191 consumes `nonempty_homeomorph_circle`. |
| R21, companions contradict scope | **Not repaired.** `FiniteVolumeExtension.lean:157` still admits `finiteVolumeMostowPrasad`; `LeeFrobenius.lean:7–15` still says "GT6 owns the deformation". See R05 below. |
| R22, companion form | **Not repaired.** No companion file changed since `8f2bcb3`. See R06 below. |
| R23, two Checks | **Not repaired.** Lines 612–613 and 1178–1179 are unchanged. See R07 below. |
| R24, locators and edges | **Partly repaired.** The reciprocal edges 5.1/8.1, 4.8/4.10 and 4.9/5.4 are split; Seifert uniqueness now cites Hatcher's Theorem 2.3 with its exception list (lines 2216–2221). Layers 1.2, 3.2 and 11.1 still carry no locator. See R08 below. |
| R25, concordance kernel | **Not repaired.** Line 1751 is unchanged. See R04 below. |

No finding was marked "not actionable in this package".

## R01 (P1) — Seven consumed declarations still do not exist at the pin

Re-raised: r4 R02.

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:220`: "Every declaration below exists at the pinned Tau Ceti and is consumed as it stands"; lines 241–245, 288, 306, 592, 673, 692, 1264, 1294, 1574, 1609.

**Claim:** `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`, `normalTubeOfRadius`, `TauCeti.normalFiberBundle`, `TauCeti.normalVectorBundle`, `TauCeti.normalContMDiffVectorBundle`, `TauCeti.knotExterior`, `TauCeti.KnotTheory.homflySpecialization` and `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact` are supplied.

**Witness:** A whole-source search of Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` (every `.lean` file, by short name) finds none of the eight. What does exist: `TauCeti.normalTube` and `TauCeti.exists_isOpenEmbedding_normalTube` (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean:273`, `359`, compact source only), `normalDiscBundle`, `normalSphereBundle` (`DiscSphere.lean:42`, `47`) and `normalBundleHomeomorphTube` (`WholeBundle.lean:52`); `LowDimTopology/SolidTorusNeighborhood/` contains only `Basic.lean` and `Sphere.lean`. The folder's own generated `STATUS.md` links `TauCeti.knotExterior` in a module `SolidTorusNeighborhood/Exterior` that is absent at the pin: the name belongs to a later Tau Ceti than the one pinned.

**Repair and retest:** For each name, either cite its actual pinned equivalent (the compact-source tube theorem; the Temperley–Lieb Markov trace for the HOMFLY specialization, if that is what is meant), or make the construction a target of this roadmap with hypotheses (the radius-function tube in Layer 1.5, the normal bundle instances, the compact exterior in Layer 5.1 built from the tube and the complement of Layer 1.2, the PL inverse in Layer 1.7), or declare a supplier gap. Delete line 220's blanket assertion or make it true. Retest: the eight-name search returns zero hits at the pin; every remaining backticked `TauCeti.*` name resolves.

## R02 (P2) — The oriented two-bridge classification drops its parity hypothesis

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1424–1428`: "for oriented knots iff `p = p'` and `q' ≡ q^{±1} (mod 2p)`".

**Claim:** The oriented Schubert criterion holds for every pair of fractions with `p, p' > 0`.

**Witness:** Kauffman–Lambropoulou Theorem 3 (cached text lines 103–109) assumes `q, q'` odd (orientation-compatible tangles). Instance: `K(3/1)` and `K(3/4)`. Since `4 ≡ 1 (mod 3)`, Theorem 2 makes them the same unoriented knot, the trefoil; the trefoil is invertible, so they are isotopic as oriented knots with any orientations. The README's criterion: `4 ≢ 1` and `4 · 1 ≢ 1 (mod 6)`, so it declares them non-isotopic.

**Repair and retest:** State the oriented clause for `q, q'` odd (equivalently, for numerator closures whose orientations are compatible), or normalise every fraction to odd denominator first and say so. Retest: `3/1` versus `3/7` gives `7 ≡ 1 (mod 6)`, isotopic; `3/1` versus `3/5` gives `5 ≢ 1, 5 · 1 ≢ 1 (mod 6)`, and `5 ≡ −1 (mod 3)` makes `K(3/5)` the mirror trefoil, not isotopic; the even-denominator pair above is no longer an instance.

## R03 (P2) — Ownership of the cyclic surgery theorem's proof contradicts itself

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:45–47`: Layer 5 owns "the statements of Property P, Property R and the cyclic surgery theorem"; line 1683: "State and own the proof of the cyclic surgery theorem"; lines 108–112: Part II owns the Gordon–Luecke proof "from Layers 5 and 8.1"; lines 2096–2098: that proof goes "through the cyclic surgery theorem of Layer 5.4".

**Claim:** The scope section and Layer 5.4 assign the proof of Culler–Gordon–Luecke–Shalen to different owners, and the Part II boundary for Gordon–Luecke depends on which is meant.

**Witness:** The two quoted sentences. The Kanenobu–Murakami criterion (line 1694) and the `8₃` Check (lines 1713–1716) are proved "by … the cyclic surgery theorem", so the theorem is consumed as proved inside this roadmap while the scope says it is only stated. The Layer 8 scope bullet (lines 62–64) likewise omits Waldhausen's theorem, the Haken hierarchy and normal surfaces, all of which Layer 8.3 (lines 2165–2173) says it proves.

**Repair and retest:** Decide once. Either the proof of the cyclic surgery theorem is this roadmap's (then say so in the Layer 5 scope bullet and keep 5.4), or it is Part II's like Gordon–Luecke (then 5.4 states it, the Kanenobu–Murakami criterion and the `8₃` Check are marked as consuming a stated theorem, and the Part II paragraph names it). Add Waldhausen's theorem, the hierarchy and normal surfaces to the Layer 8 bullet. Retest: every "prove" in Layers 5 and 8 appears in its scope bullet and every "state" has its owner named.

## R04 (P2) — The concordance kernel includes the smoothly slice classes

Re-raised: r4 R25.

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1750–1751`: "the topological concordance group `C_top` receives `C` by a surjection whose kernel is the smoothly non-slice topologically slice knots".

**Claim:** This describes the kernel of `C → C_top`.

**Witness:** The kernel is a subgroup, so it contains the class of the unknot, which is smoothly slice. The stated set excludes it.

**Repair and retest:** The kernel is the set of smooth concordance classes of topologically slice knots; its nonzero elements are the classes of smoothly non-slice topologically slice knots. Retest: the unknot lies in the kernel; the untwisted Whitehead double of the trefoil (lines 1872–1875) is a nonzero kernel element.

## R05 (P2) — Companion files admit targets the README gives to Part II

Re-raised: r4 R21.

**Location:** `TauCetiRoadmap/GeometricTopology/FiniteVolumeExtension.lean:157`: `theorem finiteVolumeMostowPrasad … := by sorry`; `LeeFrobenius.lean:14–15`: "GT6 owns the deformation and its filtered comparison".

**Claim:** This folder's acceptance files contain the finite-volume Mostow–Prasad theorem and the Lee deformation as targets.

**Witness:** `README.md:116–121` assigns "the Lee deformation of Khovanov homology and Rasmussen's invariant" and "the finite-volume Mostow–Prasad theorem with its Kleinian-group inputs" to Part II; `README.md:1984–1989` repeats the latter. No companion file changed between `8f2bcb3` and this head.

**Repair and retest:** Delete `finiteVolumeMostowPrasad`, `finiteVolume_eq_of_piOne_equiv` and the Lee file from this folder, or move them to the Part II folder when it exists. Retest: no admitted declaration in the folder states a theorem the README's scope assigns elsewhere.

## R06 (P3) — The 25 companions still violate the Lean form rules

Re-raised: r4 R22.

**Location:** `ExchangeFamily.lean:92–103`, `RealAlgebraicRealization.lean:53–57`, `SimplicialLinks.lean:88–94` (`#print axioms`, 24 lines); `BrunnianBraidTargets.lean:2–4`, `LeeFrobenius.lean:1–4`, `TorusKnotTargets.lean:1–4` and nine other files (`import Mathlib.<submodule>` lines); `ExchangeFamily.lean:8`, `FiniteVolumeExtension.lean:19`, `RealAlgebraicRealization.lean:12` (namespaces outside `TauCetiRoadmap.GeometricTopology`); `CrossingChangeTargets.lean:9`, `KnotMixedCycleTargets.lean:5`, `TorusKnotTargets.lean:143` (process labels "GT6", "GT4", "GT1").

**Claim:** The Lean form rules apply to every listed file; these files are API catalogues and calculation certificates (84 admitted declarations across them, `TorusKnotTargets.lean` alone 16) whose statements have no README counterpart.

**Witness:** The commands and imports quoted above; `README.md` names none of the 262 companion declarations.

**Repair and retest:** Delete the companion files from the folder; keep any mathematics worth keeping as README targets or Checks. For padding, delete it, never prove it in place. Retest: the folder contains `README.md`, `Suggested.lean` and the generated status files only, and the gate's import and command scanners, run on every `.lean` file, report zero.

## R07 (P3) — Two Checks compute the wrong value

Re-raised: r4 R23.

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:612–613`: "at `ε = 1` the tube map fails to be injective at the origin"; lines 1178–1179: "the `1 × 1` matrix `[−1]` or `[1]` according to the orientation of the core".

**Claim:** These values distinguish the open-tube and Seifert-form conventions.

**Witness:** The pinned `TauCeti.normalTube` (`Euclidean.lean:273–274`) is `{p | p.2 ∈ normalSubspace ∧ ‖p.2‖ < ε}`, strict. For the unit circle at `ε = 1` the image is `{0 < |z| < 2}` and `x ↦ x(1 − s)`, `0 ≤ s < 1`, is injective; the inward vectors of length 1 reaching `0` are excluded. For the annulus, bilinearity gives `θ(−x, −x) = θ(x, x)`: replacing the core by its reverse leaves the matrix unchanged. The sign is that of the Hopf link: under the stated convention the positive Hopf band has entry `−1`, as the diagonal of the trefoil matrix `[[−1, 1], [0, −1]]` shows.

**Repair and retest:** Use `ε > 1` for the failure, or say "closed tube". Say the annulus entry is `−1` for the positive Hopf link and `+1` for the negative one. Retest: `ε = 2` reaches `0` from every point of the circle; reversing the core leaves `[−1]`.

## R08 (P3) — Locators still missing at three targets; Palmeira absent from References

Partly re-raised: r4 R24.

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:454–485` (Layer 1.2), 937–946 (Layer 3.2), 2523–2538 (Layer 11.1): no source locator at any claim; line 2480 cites Palmeira, Ann. of Math. 108 (1978), which the References (lines 2716–2836) do not list.

**Claim:** Every theorem has an exact locator and every cited work is in the References.

**Witness:** The three sections cite nothing; `grep -n Palmeira` returns only line 2480.

**Repair and retest:** Add locators (for 1.2 the radial-coordinate collar is Hirsch, Chapter 4, Theorem 6.1's construction; for 11.1 the join law is Rourke–Sanderson, Chapter 2) and add Palmeira to the References, or cite Calegari, Theorem 4.38, which the cached text carries at lines 6916–6919. Retest: no `###` section without a parenthesised locator at its first theorem.

## Verified sound

Read: the whole README (2836 lines), all 26 Lean files, the previous review's 25 findings, the change set and `PROGRESS.md`/`STATUS.md`/`metadata.toml` (unchanged from main). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` is empty: no change outside the folder.

**Gate and elaboration.** The worker's gate at this head reports every check zero and `OK`. Independently, `lake env lean` on `Suggested.lean` exits 0 in 3 s with exactly the 14 `declaration uses sorry` warnings at lines 62, 69, 74, 81, 88, 93, 98, 104, 110, 121, 132, 138, 142, 153. A scratch copy with every `sorry` replaced by `first | simp | rfl | infer_instance | exact?` leaves all 14 goals open (12 `exact?` failures, 2 unsolved goals): no headline is padding. A scratch copy with `#check @name` for the 14 declarations printed signatures agreeing with the README statements; no binder is dropped (`poincare_conjecture` keeps `CompactSpace`, `T2Space`, `SecondCountableTopology`, `SimplyConnectedSpace`; `gordon_luecke` and `smoothAmbientIsotopic_unknot_of_knotGroup` keep their embeddings and basepoints).

The dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1456 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. Target-level: the `*Needs:*` graph was walked by hand; the previous reciprocal edges are gone, the early edges 1.4→3.3→1.5, 4.4→5.1→4.1→3.3, 1.8→11.3→1.7 and 8.x→11.2 are acyclic.

**Pins.** `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Every backticked library name in the README was extracted mechanically and searched at both pins; all resolve except the eight of R01. Full-name spot checks (file:line at the pin): `orthogonalToDiffSphere_injective` `Geometry/Diffeomorphism/Sphere.lean:299`; `t2Space_weakWhitney` `Topology.lean:115`; `continuousEval_weakWhitney` `Evaluation.lean:37`; `isClosed_fixingSubgroup` `FixingSubgroup/Topology.lean:41`; `Diffeotopy.toPath` `Diffeotopy/Path.lean:63`; `IsSeifertFibration.nonempty_homeomorph_circle` `LowDimTopology/SeifertFibration.lean:117`; `isSeifertFibered_prod_circle` `:283`; `JSJTheorem.card_eq` `JSJDecomposition.lean:294`; `isJSJDecomposition_of_isEmpty` `:234`; `hypVolumeOfMetric_eq_of_mostow` `Hyperbolic/Volume.lean:104`; `hasFiniteVolume_of_compactSpace` `FiniteVolume.lean:82`; `hasGeometricStructure_quotient` `GeometricStructure/Basic.lean:84`; `edist_riemannianExp_le` `Geodesic/Completeness.lean:94`; `isLocalDiffeomorphAt_of_mfderiv_eq` `LocalDiffeomorph.lean:269`; `IsLocallyFlat.comp` `LocallyFlat/Basic.lean:690`; `SmoothAmbientIsotopic.nonempty_complementHomeomorph` `SmoothLink/AmbientIsotopy.lean:279`; `jonesPolynomial_mirror` `PDCode/Jones.lean:240`; `tristramLevineForm_neg_one` `TristramLevine/Basic.lean:102`; `signature_trefoilSeifertMatrix` `Signature.lean:149`; `isSmoothlySlice_unknot` `Slice/Basic.lean:250`; `isTopologicallySlice_unknot` `:405`; `hasPerfectCommutatorSubgroup_unknot` `KnotGroup.lean:255`; `coboundAnnulus_smul_coe_sphere` `Annulus.lean:147`; `doubleRight_mem_PLGroupoid` `PLGroupoid.lean:172`; `isCombinatorialManifold_simplexBoundary` `CombinatorialManifold.lean:232`; `triangulationConjecture_zero` `TriangulationConjecture.lean:97`.

Headline carriers opened at the pin: `IsSphereBoundsBall` (`Irreducible.lean:42`: every locally flat closed embedding of `S²` extends over `D³`); `IsIncompressible` (`Incompressible.lean:42`: embedding and `π₁`-injectivity at every basepoint, no sphere exclusion, as the README's Checks say); `IsFiniteVolumeHyperbolic` (`FiniteVolume.lean:97`: a finite-volume hyperbolic metric exists, no orientability or connectedness); `TriangulationConjecture` (`:74`: compact Hausdorff charted `n`-manifolds); `JSJTheorem` (`:248`) and `GeometrizationConjecture` (`:144`): compact connected orientable smooth with `IsSphereBoundsBall`; `MostowRigidity` (`:72`); `SmaleConjecture` (`:46`: homotopy equivalence with underlying map the continuous inclusion); `FreedmanSliceTheorem` (`:64`); `AnnulusConjecture` (`:105`: inner sphere inside the filled hull minus the outer sphere); `VirtualFiberingConjecture` (`:62`), `VirtualHakenConjecture` (`:65`): closed connected hyperbolic; `WatanabeTheorem` (`:77`: an infinite-order element of `π₁(DiscDiff 4)`).

**Cross-roadmap citations.** DifferentialGeometry (boundary and corners, Layers 3, 4, 5, 12), HopfRinow (Layers 1–3), SurfaceTopology (Layers 8, 9), PlanarTopology (Layers 5, 7, 8), TypeAHeckeAlgebras (H1, H2) resolve on main as last round; the worker's citation check found nothing missing and this review found nothing new. Ownership by object (Diff topology, local flatness, connected sum, Mostow, Seifert fibrations, triangulations, foliations) was searched in the roadmaps on main and in the sibling checkouts named in the brief; no other readable roadmap declares the headline names or plans the same objects. Ownership against open pull requests without readable files was not checked. The revised base still owns proofs of several classical theorems that main's roadmap never planned (Dehn's lemma, the sphere theorem, Kneser–Milnor, the Margulis lemma, Novikov's theorem, Moise's and Whitehead's triangulation theorems, Waldhausen's theorem); the previous review drew the Part II line at the end theorems, and that line is respected.

**Headline coverage.** The README's fourteen statable headlines (annulus, Smale, Watanabe, Freedman, Mostow, virtual fibering, virtual Haken, Alexander, knot-group, Gordon–Luecke, JSJ, geometrization, Poincaré, Manolescu) are all in `Suggested.lean`. The docstring names Li, Weeks, Property P, Property R, the cyclic surgery theorem, Kondo, Cerf, Kneser–Milnor and Novikov–Rosenberg as not statable with the missing carrier, and Zeeman as open; searches at the pin confirm no Dehn filling, Heegaard genus, Weeks manifold, geometric Alexander polynomial or transverse orientation.

**Adversarial values.** One row per sampled target, headline or finding; "consistent" is not "proved".

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| 1.1 collars | `[0,1]`; disc; `S¹`; constant map | images `[0,½) ∪ (½,1]`, `0 < |z| ≤ 1` open in the disc; `∂S¹ = ∅` so vacuous; `(x,t) ↦ x` has non-open image | Consistent |
| 1.2 complements | `ℝ ∖ (−1,1)`; `ℝ² ∖` open disc | 2 components vs 1; boundary `S⁰` vs `S¹` | Consistent; no locator (R08) |
| 1.3 double | `[0,1]`; `[0,∞)` | `S¹` closed; `ℝ` boundaryless, noncompact | Repaired |
| 1.4 connected sum | `ℝ # ℝ`, `S¹ # S¹`, `T² # T²` | 2 components, 1 component; `χ = 0 + 0 − 2 = −2`; `χ(S¹#S¹) = 0 + 0 − 0` | Repaired |
| 1.5 tube at `ε = 1` | unit circle, pinned strict tube | image `0 < |z| < 2`; `x(1−s)`, `0 ≤ s < 1`, injective; `ε = 2` reaches `0` | R07 |
| 2.1 composition | axis then `ℝ² ⊂ ℝ³`; rotated axis | slice charts `id` and rotation × `id`; transverse rank 2 | Consistent |
| 2.2–2.3 annulus headline | `n = 0`, points `±1`, `±2` | region `[−2,−1] ∪ [1,2] = S⁰ × I`; concentric spheres pinned at `Annulus.lean:147` | Consistent |
| 3.1 topologies | `S⁰`; `f_k(θ) = θ + k⁻² sin kθ` | 2 diffeos, 4 maps, discrete; `sup|f_k − id| = k⁻²`, `sup|f_k' − 1| = k⁻¹`, `sup|f_k''| = 1` | Repaired |
| 3.2 families | `F_k(θ,z) = e^{i sin(kθ)/k} z`; reflection in `O(2)` | angle `≤ 1/k → 0`; `∂_θ F_k(0,z) = iz`, norm 1; conjugation has degree `−1` | Repaired; no inverse continuity claimed |
| 3.4 / Smale headline | `O(4)` | `π₀ O(4) = C₂`, `π₁ SO(4) = C₂`; `−I ∈ SO(4)` | Statement only; proof Part II |
| Watanabe headline | `A₁ = 0`, `A₂ = ℚ` | first nonzero class in degree 2; identity has order 1 | Consistent with cached Theorem 1.1 |
| 4.1 knot types | square vs granny; trefoil vs mirror | `Δ = (t − 1 + t⁻¹)²` both; `σ = 0, −4`; `V = t + t³ − t⁴` vs `t⁻¹ + t⁻³ − t⁻⁴` | Consistent |
| 4.3 Hopf annulus | core `x` vs `−x` | `θ(−x,−x) = θ(x,x)`; positive band entry `−1` (trefoil diagonal) | R07 |
| 4.4 Alexander | `T(2,n)`, `n = 0..3`; `Δ(−1)` parity | `F_n = 0, 1, 1−t, 1−t+t²`; `F_n(−1) = n`; `det(V+Vᵀ) ≡ det(V−Vᵀ) = 1 (mod 2)` | Consistent |
| 4.5 Jones | trefoil, Hopf at `t = 1`; `T(3,4)` | `1 = (−2)⁰`, `−2 = (−2)¹`; `t³ + t⁵ − t⁸` span 5 vs `c = 8` | Consistent |
| 4.6 HOMFLY | trefoil skein; specializations | `P(T) = v² + vz P(H) = 2v² − v⁴ + v²z²`; `v = 1, z = t^½ − t^−½` gives `t − 1 + t⁻¹`; `P_H(1,−1,w) = −w` | Consistent |
| 4.7 colourings | trefoil mod `1, 2, 3, 6, 7` | counts `1, 2, 9, 18, 7`; nonconstant `0, 0, 6, 12, 0`; `6·gcd(6,1)·gcd(6,3) = 18` | Repaired |
| 4.8 Jones span | `U₂`, `U₃`; `T # T` band diagram | spans `1 = 0+2−1`, `2 = 0+3−1`; span 6 = `c`, `g_T = 0` | Repaired |
| 4.10 oriented two-bridge | `3/1` vs `3/4`; `5/2` vs `5/3`; `7/2` vs `7/3` | `4 ≡ 1 (mod 3)` same unoriented trefoil, invertible; README mod-6 test fails; `2·3 ≡ 1 (mod 5)`; `3 ≢ 2^{±1} (mod 7)` | R02 |
| 4.11 torus knots | `T(1,q)`, `T(2,3)`, `(σ₁σ₂)⁴` | unknot; genus 1, `Δ = t − 1 + t⁻¹`; braid index 3 | Consistent |
| 4.12 Garside | `σ₁σ₂⁻¹` | `σ₂⁻¹ = Δ₃⁻¹σ₂σ₁`, `σ₁Δ₃⁻¹ = Δ₃⁻¹σ₂`, so `Δ₃⁻¹ · σ₂ · σ₂σ₁`, left-weighted | Consistent |
| 4.13 Kondo | `Δ_k = 1 + (−1)^{k−1}(t + t⁻¹ − 2)^k` | symmetric, `Δ_k(1) = 1`, span `2k ≤ 2g` | Consistent; Kondo uncertified |
| 4.14 counting | `n = 3..7` | bound `1/6, 1/2, 7/6, 5/2, 31/6` vs `1, 1, 2, 3, 7` | Consistent |
| 5.2 Hopf surgery | framings `(0,0), (0,n), (1,1), (3,2)` | `ab − 1 = −1, −1, 0, 5`: `S³, S³, S¹×S², L(5,2)` | Consistent |
| 5.3 Mathieu | `k = 0` | slopes `9/1, 9/2`; new fibre multiplicities `|9−6| = 3`, `|9−12| = 3`; `H₁ = ℤ/9` | Consistent |
| 5.4 Moser | `T(1,2)` at 5; trefoil `5, 7, 6` | `|5 − 2| = 3` yet `L(5,1)`; `|p − 6q| = 1, 1, 0`; `L(5,9) = L(5,4)`, `L(7,9) = L(7,2)` | Repaired; ownership R03 |
| 6.1 kernel | unknot; Whitehead double of trefoil | unknot in kernel, smoothly slice; double nonzero in kernel | R04 |
| 6.2 signatures | trefoil, figure-eight; `ω = e^{iπ/3}`; `−1` | `V+Vᵀ = [[−2,1],[1,−2]]`, `σ = −2`; `det = −5`, `σ = 0`; `Δ(ω) = 2cos(π/3) − 1 = 0`; `p(−1) ≡ p(1) (mod 2)` so `−1 ∈ S¹_!` | Repaired |
| Freedman headline | unknot; trefoil | perfect commutator, slice; `Δ ≠ 1`, `σ = −2` not slice | Consistent |
| Mostow headline / 7.2 | genus-2 surface | `6g − 6 = 6` dimensions of metrics; pinned statement is metric rigidity | Statement only; proof Part II |
| 7.3 finite volume | Gieseking; empty manifold | volume `v₃ = 1.0149…`, Klein-bottle cusp, nonabelian cusp group; volume 0 | Repaired |
| 7.4 Weeks | `(5,1),(5,2)` filling | `0.9427… < 1.0149… < 2.0298…`; `H₁ = (ℤ/5)²` | GMM Theorem 1.1 cached lines 52–56 |
| Virtual fibering / Haken headlines | Agol 9.2 (hyperbolic), 9.1 (aspherical) | hyperbolic `⊂` aspherical, so both apply to the pinned closed hyperbolic hypothesis | Consistent |
| Alexander / knot-group / Gordon–Luecke headlines | equatorial `S²`; unknot vs trefoil; granny vs square | two balls; `ℤ` vs `⟨x,y ∣ xyx = yxy⟩` with `S₃` quotient; equal groups, `σ = −4, 0`, complements not homeomorphic | Consistent |
| 8.2 finiteness | `N` fibres `S² × {t_i}`; balls in `T³` | all parallel, complements `S² × [0,1]` punctured spheres; spheres `π₁`-injective but excluded | Repaired; Basic Fact at Hatcher lines 233–236 |
| 8.4 Seifert | `ℝP³ # ℝP³`; sphere in `T³`; `T³` vs `K × S¹` | `π₁ = C₂ ∗ C₂`; `χ = 2 ≠ 0`; orientation characters `0` vs nonzero | Repaired; Hatcher Prop. 1.13 lines 811–812, Theorem 2.3 lines 1260–1266 |
| 8.5 JSJ headline | `T³`; Anosov bundle; two trefoil exteriors glued `μ ↔ λ` | 0 tori; 1 torus; fibre slopes `6` and `1/6` differ, torus essential | Consistent |
| 8.6 geometrization / Poincaré headlines | `S³`; Poincaré sphere; Anosov bundle | empty decomposition; `|π₁| = 120`; `Sol` whole vs 1 torus | Consistent |
| 9.2 genus | `L(1,q)`; Poincaré sphere | genus 0; `g = 2 = rank` | Repaired |
| 10.1 Reeb stability | leaf with finite `π₁`; Reeb foliation of `S³` | orientable closed surface with finite `π₁` has `χ = 2`, is `S²`; torus leaf compressible | Consistent with Calegari Theorem 4.5 |
| 10.2 asphericity | `S² × S¹` | `π₁ = ℤ` infinite; universal cover `S² × ℝ`, `π₂ = ℤ` | Repaired |
| 11.1 join law | one edge `e` | `Lk(e) = ∅`, `∂e ∗ ∅ = S⁰`, two points | Repaired |
| 11.3 triangulations | `ΣP`; `Σ²P`; `E8 × S¹` | punctured-vertex `π₁` of order 120; `≅ S⁵`; triangulable, non-PL | Repaired; Manolescu diagram lines 262–270 |
| 11.4 Manolescu headline | `n = 5, 6` | dimension-5 examples nonorientable, `P⁶` orientable | Cached lines 257–260 |
| 11.5 collapse | triangle boundary; dunce hat | no free face, `χ = 0`; contractible, no free face | Consistent |

**Seeded locator audit (15 targets).** Cached texts are cited by their first eight hex characters.

| Sample | Text at locator and outcome |
|---|---|
| 1.1 collars | Hirsch (`3d4722b4`) Chapter 4 Theorem 6.1 at line 4560 ("∂M has a collar"); Lee 9.25/9.26 uncertified. Supports the existence claim. |
| 2.1 closure beyond pin | Pinned `IsLocallyFlat.comp` (`Basic.lean:690`) has the compatibility premise the README derives; Brown 1962 not readable. Composition construction checked by hand. |
| 3.2 families | No locator (R08); the bijection claim is tautological from `ofSmoothFamily` (`Topology.lean`); `orthogonalToDiffSphere_injective` at `Sphere.lean:299`. |
| 4.1 knot types | Lickorish Chapter 2 uncertified; the Checks were recomputed. |
| 4.4 Alexander | Lickorish Theorems 6.5, 8.6 uncertified; identities recomputed above. |
| 4.5 Jones | Lickorish Theorem 3.5, Proposition 3.7 uncertified; the pinned `jonesPolynomial_mirror` exists. |
| 4.10 rational knots | Kauffman–Lambropoulou (`de77c7cf`) Theorem 1 line 64, Theorem 2 lines 84–90, Theorem 3 lines 103–109: Theorem 3 assumes `q, q'` odd (R02). |
| 4.11 torus knots | Schubert 1954 not readable; the coordinate isotopies were checked by hand. |
| 6.1 concordance | Livingston (`e7d9e5eb`) Theorem 2.2 present; the kernel description is the README's own (R04). |
| 6.2 signatures | Conway (`5e09eca4`) Proposition 2.3 line 108, Proposition 2.7 line 191, `S¹_!` line 239, Theorem 2.9 lines 242–243, Cha–Livingston lines 244–245, Theorem 2.12 lines 282–284, averaged signature and Powell lines 290–298; Cha–Livingston (`f066dad7`) abstract lines 23–24. All support the repaired text. |
| 7.4 Weeks, Agol | GMM Mom (`c6dc414e`) Theorem 1.1 lines 52–56; Agol (`ea8c7f39`) Theorems 9.1–9.2 lines 27–30. |
| 8.4 Seifert fibred spaces | Hatcher 3Mfds (`c8add1a8`) Proposition 1.12 lines 707–709, Proposition 1.13 lines 811–812, essential surfaces lines 650–651, Theorem 2.3 lines 1260–1266; Scott (`369fa395`) §3 invariants lines 1518–1548. The README's switch from `3M.pdf` to `3Mfds.pdf` renumbers correctly: the older cached text (`f3781c43`) has the vertical/horizontal result as Proposition 1.11 and irreducibility as 1.12. |
| 8.5 JSJ | Hatcher 3Mfds Theorem 1.9 lines 628–631, Proposition 1.14 line 837, Corollary 1.15 line 880, Lemmas 1.16–1.18 lines 884–928. |
| 10.1 foliations | Calegari (`4827ccaf`) Theorem 4.5 lines 5900–5902; Theorem 4.35 lines 6702–6707; Palmeira as Theorem 4.38 lines 6916–6919; Lickorish 1965 not readable. |
| 11.4 Manolescu | Pin(2) paper (`cad3ace3`) Corollary 1.3 lines 72–73; lectures (`d17456df`) Example 2.2 lines 127–132, dimension remarks lines 257–260, diagram lines 262–270. |

Also checked: Hirsch Chapter 4 Theorems 5.3 and 6.6 (lines 4503, 4670) and Chapter 8 Theorems 1.3 and 3.1 (lines 7042, 7250–7254); Moser (`8af39754`) Propositions 3.1, 3.2 and 4 (lines 152, 189, 246); Morgan–Tian (`267c8382`) Corollary 0.2 lines 189–191; Watanabe (`07d3cd2f`) Theorem 1.1 lines 32–38; Scharlemann (`a5efa71a`) §2.1 line 88, Theorem 3.4 lines 375–377, Theorem 3.7 lines 425–426; Melikhov (`9815cde7`) Theorem 1.1 lines 26–28.

## Not verifiable

Paywalled or unlocated texts, cited by locator only, as last round: Lee (both books), Lickorish, Burde–Zieschang, Rolfsen, Birman, Moise, Munkres, Rourke–Sanderson, Ratcliffe, Brown 1960/1962, Kirby 1969 (cached author copy not re-read), Quinn, Smale 1959, Cerf 1968, Schubert 1954/1956, Hashizume, Garside, Epstein et al., Elrifai–Morton, Kondo, Scharlemann 1985, Kanenobu–Murakami, Ernst–Sumners, Gabai 1987, Mathieu, Culler–Gordon–Luecke–Shalen, Gordon–Luecke, Freedman 1982, Mostow, Prasad, Papakyriakopoulos, Milnor 1962, Waldhausen (both), Jaco–Shalen, Johannson, Perelman, Novikov, Lickorish 1965, Zeeman, Palmeira. No manifest was edited; no source was copied.

## Source issues

- none
