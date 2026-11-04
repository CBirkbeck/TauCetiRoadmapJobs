# Review of AlgebraicTopology (pull request #1663 at e422e65)

**Verdict:** needs changes

This head repairs every finding of the previous review (the finding-by-finding record is below), the gate passes, the dependency check prints no UPWARD or CYCLE line, `Suggested.lean` elaborates with `sorry` as its only warning, and every statement I computed holds (table under *Verified sound*). One blocking defect remains: the two auxiliary theorems that 8.13 now owns are stated only for the three target manifolds its route needs, so a general library theorem that two downstream roadmaps already restate is replaced here by a special case. The rest is P3.

## R01 (P2) — the smoothing and transversality targets of 8.13 are route-specific special cases

Location: `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2330–2334 ("For a boundaryless sigma-compact Hausdorff second-countable smooth manifold M … a continuous map f:M→P, with P one of Circle, RP^N and CP^N") and 2355–2358 ("the closed submanifold Z⊂P equal to {1}, RP^(N−1) or CP^(N−1)").

Claim: Whitney approximation of a continuous map into a manifold, and the relative transversality homotopy theorem, are stated for three targets and three submanifolds only.

Witness: the sources cited at the claim state the general theorems: Lee, Theorems 6.26 and 6.36 are for an arbitrary smooth target manifold and an arbitrary closed embedded submanifold. The special statement bypasses the general route, whose only non-Mathlib input is on main: GeometricTopology Layer 1 owns the tubular neighbourhood theorem (`TauCetiRoadmap/GeometricTopology/README.md` lines 218–221, Hirsch Thm 6.3, Lee Thm 6.24), Mathlib at the pin has `exists_embedding_euclidean_of_compact` (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean` line 131) and `Continuous.exists_contMDiff_approx_and_eqOn` (`SmoothApprox.lean` line 81, σ-compact Hausdorff source, normed-space target). The general object is already built downstream twice: TangentialBordism B1.6 at its open head (lines 258–282: relative Whitney approximation into any N and facewise transversality, "using the finite-dimensional linear parameter family of a Euclidean embedding of N composed with GeometricTopology Layer1's tubular retraction") and DeRhamCohomologyAndDuality Layer 5 at its open head (lines 570 ff.). Both consume AlgebraicTopology (TangentialBordism cites it 22 times), so neither can be cited here and the notion sits in this roadmap by the move-down rule; stated as a special case it does not let them repoint. The mathematics of the three-target route is correct (table rows "8.13 smoothing" and "8.13 transversality"), including the point that where the cutoff β vanishes its derivative vanishes too, so the slice derivative is `df` there.

This refines the repair the previous review asked for (its R01 named the three targets); the binding principle is the general statement, however much more it costs.

Repair, tested on the three instances: (a) state *Smoothing of classifying maps* for an arbitrary compact boundaryless smooth manifold P (Lee 6.26): embed P by `exists_embedding_euclidean_of_compact`, take GeometricTopology Layer 1's tubular neighbourhood W of the image with its retraction r, approximate the composite within `ε(x) = dist(f(x), V ∖ W)` by `Continuous.exists_contMDiff_approx_and_eqOn`, and compose with r; (b) state *Relative transversality* for an arbitrary closed embedded submanifold Z of such a P (Lee 6.36): the parameter family `F(x,s) = r(f(x) + β(x)·s)`, s in a ball of the ambient space, is a submersion where β > 0 and equals f where β = 0, so Lee 6.35 with DifferentialGeometry 10.2's Sard applies as now. Keep the circle, real-projective and complex-projective retractions and the present Checks as Checks (for P a point the present ε is 0 under Mathlib's empty-set distance convention, so that case belongs with the Checks too). Name the general targets in the 8.13 dependency row and say in *Ownership* that TangentialBordism B1.6 and DeRhamCohomologyAndDuality Layer 5 consume them.

## R02 (P3) — 35 backticked names of this roadmap's own are declared nowhere

Location: `README.md` lines 637 (`diskBoundaryRelCW`), 671, 696, 713, 729, 745, 754, 765, 768, 796–797, 1365–1375, 1401, 1410, 1412, 1640, 1807, 1815, 1821, 1831–1832, 1839, 1929, 1934, 1937, 1952, 2043, 2091, 2170, 2209, 2214–2215, 2222, 2244, 2282.

Claim: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

Witness: none of `cwProductKelley`, `cwSubcomplexTowerUnion`, `relativeCWPushoutCWModel`, `homotopyPushoutGluingComparison`, `cofibrationTowerHomotopyEquivalence`, `basedHomotopyInverseOfEquivalence`, `compactTriadPoincareLefschetz`, `homotopyGroupKelleyProduct`, `kanCubicalHomotopyComparison`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`, `properWhiteheadSimplyConnectedCW`, `endComponents`, `ConnectedAtInfinity`, `stableFundamentalGroupAtEnd`, `mapsToGroupClassifyingSpaceEquiv`, `groupCohomologyCup`, `basedLoopCWType`, `ordinaryEMLoopComparison`, `ordinaryEMLoopComparison_pi`, `ordinaryCohomologySuspension`, `projectiveEMComparisons`, the two `ordinaryPairMappingCone…Comparison` names, `diskBoundaryRelCW`, `cwSubcomplexNeighborhoods`, `linearLocalGenerator_signDet`, `orderedSimplex_vertexSwap_neg`, `pathToIdentity_of_det_pos`, `localLinearization_puncturedHomotopy`, `localDiffeomorphism_localGenerator_signDet` is declared in `Suggested.lean` (scripted check of all 267 backticked README names against the file and the pins). Three were declared in `OrientationComparison.lean` on main, which this pull request deletes: `chartSimplexSupportClass_local_image` (line 1401), `pointGenerator_eq_rawChartCoefficient_at` (1410), `chartSimplexSupportClass_signed_local_image_pointGenerator` (1412). The others were undeclared on main too. The gate's `readme-ids-missing` check reports 0 here, so it does not see them.

Repair: write these in prose, as this pull request already did for `relativeCWPushout`, `relativeCylinderCW`, `simplicialRealizationCW` and the sphere homeomorphisms.

## R03 (P3) — "every locally compact space" is compactly generated only with Hausdorff

Location: `README.md` lines 870–872 ("every Hausdorff CW complex, every locally compact space, every first-countable space, every quotient and every disjoint union of compactly generated spaces is compactly generated (Hatcher, Appendix, pp. 523–524)").

Witness: Mathlib's carrier is coinduced by maps from compact Hausdorff spaces; at the pin `Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean` proves the locally compact case only for Hausdorff spaces (header line 27 "a Hausdorff `WeaklyLocallyCompactSpace`", `variable [T2Space X]` at line 323), and Hatcher's Appendix statements are for Hausdorff spaces (bebb3032 lines 22666–22669). The sequential, quotient and sum instances are unconditional (lines 181, 186, 199, 210).

Repair: "every locally compact Hausdorff space".

## R04 (P3) — the compact-generation interface now has two owners; record the move

Location: `README.md` lines 114–121 ("Stage 4 item 8 owns the compact-generation coreflection … HomotopySpheres consumes that item … nothing in this roadmap consumes HomotopySpheres") and item 8 at lines 856–915.

Witness: HomotopySpheres at its open head still owns "3A.1 Compact-generation adjunction" and "3A.2 Pointed cones and Puppe sequences" (`TauCetiRoadmap/HomotopySpheres/README.md` lines 663, 678) and consumes AlgebraicTopology Stage 4.5 and Stage 8 (line 680), and GeneralizedCohomology on main cites HomotopySpheres Stage 3A for the same objects (`TauCetiRoadmap/GeneralizedCohomology/README.md` line 37). The direction forces the object down into this roadmap, so the move is right; the previous HomotopySpheres citations were the dependency check's UPWARD line.

Repair: in *Ownership and dependencies* name the superseded sections ("replaces HomotopySpheres §3A.1–3A.2 as owner; HomotopySpheres and GeneralizedCohomology G2 consume item 8"), so that the two roadmaps repoint when they next revise. The exponential-law hypothesis "compactly generated weak Hausdorff Y" (line 886) is stronger than needed in the k-space category but harmless.

## R05 (P3) — 8.16 cites K7.1 for `CP¹≃S²`, which K7.1 does not supply

Location: `README.md` lines 2523–2524 ("ComplexKahlerGeometry K7.1's CP¹≃S² to construct the actual Hopf projection p:S³→S²").

Witness: K7.1 on main upgrades `OnePoint.equivProjectivization ℂ` to a biholomorphism `CP¹ ≃ OnePoint ℂ` (`TauCetiRoadmap/ComplexKahlerGeometry/README.md` lines 1431–1443); the homeomorphism `OnePoint ℂ ≃ S²` (stereographic) is stated neither there nor here, and Mathlib at the pin has the stereographic charts but no such homeomorphism.

Repair: name the stereographic identification `OnePoint ℂ ≃ S²` as the input (a small target of 8.16 on Mathlib's `stereographic`, or ComplexKahlerGeometry's Riemann-sphere section if it states it) and say the target sphere is the unit sphere of ℝ³ so that "degree +1" and `H₃` refer to Stage 2.5's reference class.

## R06 (P3) — generality and locator nits

- Line 1686: Theorem 3B.6 is cited at p. 276; its statement begins on p. 275 (bebb3032 line 11898, page marker 284) and runs onto p. 276.
- `Suggested.lean` line 195 cites Hatcher, Proposition 0.19 (p. 16) for `homotopyInversePairExtension_left`; 0.19 is the rel-A case (bebb3032 lines 867–869). The statement with prescribed one-sided data `g₀, H₀` on the subspace is the gluing theorem for homotopy equivalences, Brown, *Topology and Groupoids*, §7.4, already in the references; cite it at the claim.
- Line 943: "For a finite covering with connected base" versus `FiniteCover` and `finiteCover_transfer_exists`, which assume no connectedness (and are true without it; line 996 says the general statement is componentwise). Drop "connected" at line 943.
- Line 2197: "maps from a compact metric source into a metric ANR have metric ANR type" versus the headline `finiteSourceMappingCWType` for a compact Hausdorff source; the neighbourhood-retraction argument needs only compactness of the source (the mapping space is metrisable by the sup metric), so write "compact Hausdorff source" there too.

## R07 (P3) — two Lean nits

- `Suggested.lean` line 522: `hLowerBound : 2 ≤ cellLowerBound` is unused: for λ ≤ 1 no q satisfies `q + 1 < λ`, so the statement is vacuous there; drop it or keep it with a comment.
- `Suggested.lean` line 110: `isIso_singularHomologyMap_skeletonBasePairToComplex` shares its name with the pinned `TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex` (`TauCeti/AlgebraicTopology/Cellular/Comparison.lean`, under `variable [FiniteDimensional C]`), which proves the finite-dimensional case. The roadmap's theorem is the honest extension (no finite-dimensionality), but README line 527 should cite the pinned lemma by name so the new content is visible; a suffix such as `_of_infinite_dimension` would avoid the clash.

## R08 (P3) — `TopologicalGroupFundamentalGroup.lean` does not meet the Lean form (inherited)

Location: `TauCetiRoadmap/AlgebraicTopology/TopologicalGroupFundamentalGroup.lean` lines 1–4 (`import Mathlib.AlgebraicTopology.FundamentalGroupoid.FundamentalGroup` and three more submodule imports) and 6–8 ("Suggested forms accompany the definitive roadmap prose; they are not an exhaustive checklist").

Witness: the Lean form rules apply to each listed `.lean` file: a single `import Mathlib`, a docstring stating the mathematics. The file is byte-identical to main and elaborates with no warnings; its content (Eckmann–Hilton on `FundamentalGroup G 1`) is sound.

Repair: replace the imports by `import Mathlib` and the docstring by the statement (pointwise multiplication of based loop classes agrees with the native product and makes `FundamentalGroup G 1` commutative for any continuous unital multiplication).

## R09 (P3) — the branch's pins are older than main's; rebase before merge

Location: `lake-manifest.json` on the branch (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`) against main's (Tau Ceti `358314d4`, Mathlib `f6090c70`); the branch is based at `8587060`, and main changed `Suggested.lean` after that (two `simpa` lines of examples this pull request deletes, so no textual conflict).

Witness: this review's build and `#check` run are at the branch pins. The seven Tau Ceti declarations `Suggested.lean` uses exist at both pins, and neither pin has Whitehead, Hurewicz, Künneth or a relative homotopy-group carrier (the ones `STATUS.md` records are from a later Tau Ceti), so the module docstring's "not statable" list is true at both.

Repair: rebase onto main and re-run the gate; nothing else expected to change.

## Previous review (1fc6a4c): finding by finding

- **R01 (P1, unowned smoothing/transversality)** — repaired: two owned targets at lines 2330–2378 with Lee 6.26/6.35/6.36 locators, the dependency row names them; see R01 above for their generality.
- **R02 (P2, Čech route for `H^k(M;F_p)=0`)** — repaired: 6.3 states the untwisted topological forms (lines 1343–1349, Lemma 3.27(b) p. 236 and Proposition 3.29 p. 239, Hausdorff locally Euclidean, no smooth atlas) and 8.15 uses them with the universal-coefficient identification over `F_p` (lines 2497–2504).
- **R03 (P2, three statable headlines absent)** — repaired: `productBallImages_intersect` (line 438), `exists_transverse_circle_classifying_map` (617), `elementaryAbelianPair_sphere_action_has_stabilizer` (645) are in `Suggested.lean`; the three companion files are deleted and no README link remains.
- **R04 (P2, failing gate)** — repaired: gate `OK` on every check; the `set_option`, the 69 `sorry` data bodies and the companion files are gone; `depcheck: 205 roadmaps, 1708 edges, 0 problem(s)`; the HomotopySpheres citations are replaced by Stage 4 item 8 (R04 above).
- **R05 (P3, anchors)** — repaired: no `<a id` in the README.
- **R06 (P3, no locators)** — repaired: Exercises 13, 16, 17 at p. 390, 26 and 28 at p. 391, 34 at p. 392 all verified (bebb3032 lines 16895, 16908, 16911, 16974, 16980, 17020); Appendix Exercise 1 p. 529 (line 22952); Thom 1954 and Lee 2012 added to the references and the manifest records both as uncertified.
- **R07 (P3, `HS3C`)** — repaired: no occurrence.
- **R08 (P3, unstated prerequisites)** — repaired: lifted CW structures in 4.1 (lines 514–518), noncompact top-homology vanishing in 6.3, the dimension-m export of 8.7 (lines 2034–2036), "smooth closed connected surface" (line 2461).
- **R09 (P3, typography)** — repaired in the added text; the inherited instances in old text ("dimension0" line 371, "radius0" 399, "Stage3's"/"Lemma3.27" 1341–1342, "count0" 1194) remain and are not re-raised.
- **R10 (P3, five library names not at the pins)** — repaired: the `serreFibrations` names are replaced by prose pointing at DGFloer Layer 1 item 2 (lines 110–113, 988–993), and `Units.continuousConstSMul` exists at the pin (`Mathlib/Topology/Algebra/ConstMulAction.lean` line 200).

## Verified sound

**Scope.** Whole README (2677 lines, every passage), whole `Suggested.lean` (675 lines, 22 `sorry`'d theorems, 35 definitions and structures), `TopologicalGroupFundamentalGroup.lean`, the full diff against `origin/main` (five files changed plus six deleted; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty, so nothing outside the folder changed), `STATUS.md`, `PROGRESS.md` and `metadata.toml` unchanged.

**Gate and dependency check.** Worker's gate at e422e65: every check passed. My run:

```
depcheck: 205 roadmaps, 1708 edges, 0 problem(s)
```

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: exit 0 in 20 s, exactly 22 `declaration uses 'sorry'` warnings and the seven `#check` outputs, nothing else. A scratch copy with `#check @` of all 57 declarations elaborated; every binder of the README statements is present in the elaborated types: `[CompactSpace M] [T2Space M] [SecondCountableTopology M] [IsManifold …]` on `compactSupportTopClass_existsUnique` and `compactManifoldFiniteCWType`, `[I.Boundaryless] [CompactSpace M]` on `exists_transverse_circle_classifying_map`, `[T2Space X] [CompactSpace M]` and `p ≤ n` on `poincareDuality_of_fundamentalClass`, `IsClosed A` and both HEP hypotheses on the cofibration theorems, `[Fintype G]` on `regularCover_push_transfer`, `[LocallyCompactSpace X]` on the proper retraction, `[SimplyConnectedSpace X] [SimplyConnectedSpace Y]` on `homologicalWhitehead`, `[Nonempty X]` on the cup-length bound. Nothing changed. `TopologicalGroupFundamentalGroup.lean` elaborates with no output.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | rfl | (simp_all; done) | infer_instance | trivial | (aesop; done) | sorry`: all 22 declarations still report `sorry`, so none closes by one tactic. No pinned declaration closes any headline by `exact`: at the pin there is no Brouwer theorem in Mathlib (no file matches "rouwer" in `Mathlib/`), no Whitehead, Hurewicz, Künneth or universal-coefficient theorem in Tau Ceti (`grep` of `IsWeakHomotopyEquivalence`, `bijective_hurewicz`, `singularHomologyKunnethUnitSplitting`, `singularUniversalCoefficientEquiv`, `RelHomotopyGroup` over `TauCeti/` returns nothing at `a91d3aa` and at main's `358314d4`), and the pinned skeleton comparison is finite-dimensional only (R07). No declaration restates a definition, mirrors a Check or computes a value; the 35 definitions are the carriers the 22 statements need. No padding.

**Headline coverage.** README headlines statable at the pins and stated: Brouwer (2.7), arbitrary-dimensional cellular comparison (4.3), pair/quotient comparison and the two cofibration theorems (4.5), transfer and deck sum (5.3), compact-support classes with local coefficients (6.3), Poincaré duality for a fundamental class (6.4), cup-length bound (6.2 supplement), product-ball intersection (6.5), Euler-characteristic invariance (7.2), finite CW type of compact manifolds (8.7), relative CW connectivity (8.1), Whitehead and homological Whitehead (8.5), the nerve K(G,1) (8.8), proper strong deformation retraction (8.5), mapping-space CW type (8.11a), transverse circle classifying map (8.13), Smith non-freeness (8.15). Named as not statable in the module docstring, each with the missing carrier, and confirmed missing at the pin: Cartan–Leray, Serre and Wang sequences, Künneth with Tor, twisted Poincaré–Lefschetz, absolute and relative Hurewicz, Milnor sequence for skeletal towers, ordinary representability and the EM loop comparison, obstruction cochains. Milnor 1959 and the twisted dualities are the only headlines whose Lean statement is weaker than the README's (compact source instead of n-ads; untwisted closed form), and both are declared as such.

**Pinned declarations opened** (file and line at the pin). `Continuous.exists_contMDiff_approx_and_eqOn` (`Mathlib/Geometry/Manifold/SmoothApprox.lean` 81: σ-compact Hausdorff source, normed target, positive continuous ε, closed S with f smooth on a neighbourhood U, conclusion `EqOn g f S` and `dist (g x) (f x) < ε x`, as 8.13 describes); `exists_embedding_euclidean_of_compact` (`WhitneyEmbedding.lean` 131); `Circle`'s `ChartedSpace (EuclideanSpace ℝ (Fin 1))` and `IsManifold (𝓡 1) ω` instances (`Instances/Sphere.lean` 569, 572); `Units.continuousConstSMul` (`Topology/Algebra/ConstMulAction.lean` 200); the compactly generated instances (R03); `TauCeti.IsEilenbergMacLaneSpaceOne G X x := IsAspherical X x ∧ Nonempty (FundamentalGroup X x ≃* G)` with `IsAspherical := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_(n+2) X x)` (`EilenbergMacLane/Basic.lean` 59, 123), so `groupClassifyingSpace_isEMOne` asserts asphericity and an abstract isomorphism, as its docstring says; `TauCeti.HasHomotopyExtensionProperty` (`Topology/Homotopy/Extension/Basic.lean` 95, Y in the same universe); `TauCeti.skeletonBasePair C n` = `(skeletonLT C (n+1), skeletonLT C 0)` (`Cellular/Chains.lean` 109–116), so `skeletonBasePair univ (n+1)` is the (n+1)-skeleton relative to the base, matching the docstring; `TauCeti.isIso_singularHomologyMap_skeletonBasePairToComplex` and `cellularSingularHomologyIso` (`Cellular/Comparison.lean` 60–118, `[FiniteDimensional C]`); `TauCeti.map_fundamentalGroup_smul` (`FundamentalGroupAction.lean` 286); `HomotopyGroup.prodMulEquiv` (`[Nonempty N]`, so degrees ≥ 1, as 8.5 uses it for k ≥ 2); `isQuotientCoveringMap_iff_isCoveringMap_and` (Mathlib, as 5.3 cites it).

**Sources: seeded sample (15 targets, all at bebb3032, printed page = page marker − 9, verified).** Lemma 2.34(c) p. 137 (line 5968: iso for k < n, surjective for k = n; applied with the (n+1)-skeleton in degree n); Proposition 2.22 p. 124 (5456, good pairs; CW pairs are good); Proposition 0.19 p. 16 (867, rel-A case, R06); Lemma 3.27 p. 236 (10255: manifold of dimension n, compact A, (a) unique class with given local images, (b) `H_i(M|A)=0` for i>n; Hatcher's manifold is Hausdorff locally Euclidean with no second countability, as 6.3's topological form states); Proposition 3.29 p. 239 (10370, connected noncompact, `H_i=0` for i ≥ n); Theorem 3.30 p. 241 (10453, closed R-orientable with fundamental class; the Lean takes the class as datum, so orientability is not a separate hypothesis); Theorem 2.44 p. 146 (6380, finite CW); Theorem 4.5 p. 346 (15109, connected CW complexes; the Lean adds the component bijection for the disconnected case); Corollary 4.33 p. 367 (16001, simply connected CW); Example 1B.7 p. 89 (3844, the Δ-complex EG/BG); Proposition 4.1 p. 342 (14929) and the π₁-action on π_n p. 342 (14912); Proposition 4.48 p. 379 (16461, fibre bundles have HLP for CW pairs); Theorem A.6 p. 524 and Propositions A.15–A.16 p. 531 (22693, 23063, 23081, hypotheses as stated in item 8); Exercises 13, 16, 17 p. 390 and 26, 28 p. 391 and 34 p. 392 of §4.2 (16895–17023; Exercise 17's hypotheses "(n−1)-connected CW X, path-connected Y with π_i Y = 0 for i > n" match 8.14 ¶2; Exercise 28's outline "Z_p or 0 for H_(n+1)" matches 8.15's bound); Section 3.G p. 321 (14023–14031: τ sums the n lifts, π♯τ = n); Appendix Exercise 1 p. 529 (22952). Also Theorem 4.8 p. 349 (15205), Corollary 4.12 p. 351 (15308), Theorem 3.26 p. 236 (10237), Theorem 3B.6 p. 275–276 (11898), the RP² versus S²×RP∞ passage p. 348 (15168–15173).

**Cross-roadmap citations resolved on main (every one re-read now).** CharacteristicClasses C1.5 (lines 511–546: `H*(CP∞;Z)=Z[h]`, `H*(RP∞;F2)=F2[a]`, tautological O(−1) of class x = −h, finite models `ET_N=(S^(2N+1))^m`, `BT_N=(CP^N)^m`, so m = N = 1 is 8.16's S³→CP¹) and C2 (line 550 "Thom, Euler and Gysin theory", 667 embedding Gysin); ComplexKahlerGeometry K7.1 (1407–1443) and K7.2 (1444); GeneralizedCohomology G2.10 (`numerableFiberBundle_hurewicz`, line 651) and G2.1; GeometricTopology smoothing-and-triangulation item 1 (938–943, "Smooth implies PL", Whitehead's smooth triangulation) and Layer 1 tubular neighbourhoods (218–221); DifferentialGeometry 8.3 (836–844, smoothing of simplices, Lee 18.7), 10.2 Sard (884–885), 10.5 (Brouwer consumer); DGFloer Layer 1 item 2 (131, 221: Serre fibrations, LES and spectral sequences, with its note that the native `serreFibrations` is beyond the pin); UniversalCovers in `Completed/`; ClassifyingSpaces, TopologicalKTheory, MorseTheory M2/M4, RiemannianGeometry R3, HeegaardFloer, AffineMorseLefschetz, CStarClassification, SmoothBundlesConnections, BanachAlgebras A8 (open head cites `brouwerFixedPoint_compactConvex_finiteSpan` as this roadmap's) and ComplexManifolds all exist as cited. Supplier conventions agree: 8.13's `⟨h,[CP¹]⟩ = +1`, `O(−1) ↦ −h`, `a = w₁` match C1.5.

**Ownership against open work** (`roadmaps grep` over main and the 440 open heads). Product-ball intersection, the RP²×S³ versus S²×RP³ example and the Smith non-freeness are owned by no other roadmap. Brouwer: only consumers (DifferentialGeometry 10.5, BanachAlgebras A8, PlanarTopology's Jordan route). Lusternik–Schnirelmann: MorseTheory M4 consumes this roadmap's supplement. Transversality and Whitney approximation: TangentialBordism B1.6 and DeRhamCohomologyAndDuality Layer 5, both downstream (R01). Compact generation: HomotopySpheres §3A.1–3A.2 (R04). Pull request #1652 is a parallel revision of this same folder by the same author (its README is reshaped into the new form and also declares `brouwerFixedPoint_compactConvex`); the two will conflict in `README.md` and `Suggested.lean`, which is a merge matter rather than two owners of one object. Milnor's mapping-space theorem and the FTW proper Whitehead theorem are not stated elsewhere.

**Adversarial table** (values computed on both sides).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `brouwerFixedPoint_compactConvex` | C a point; C=[0,1]; C=open interval; C=annulus; C=unit ball of ℓ² | point: trivial; IVT on x−f(x); f(x)=x/2 on (0,1) has no fixed point (compactness needed); rotation of the annulus is fixed-point free (convexity needed); Kakutani's map on ℓ² (finite dimension needed) | holds, every hypothesis used |
| `_finiteSpan` | C ⊆ V, dim V = k inside infinite E | restrict to V and apply the first theorem | holds |
| `isIso_…_skeletonBasePairToComplex` | S² (cells 0,2), n=0,1; RP∞ with F₂, n=2: X³=RP³; D³ = S²∪e³, n=2 | H₀ iso, H₁ = 0 both; H₂(RP³;F₂)=F₂=H₂(RP∞;F₂); the 2-skeleton S² gives ℤ→0, the 3-skeleton D³ gives 0→0 | holds; the (n+1)-skeleton is needed |
| `ordinaryPairQuotientComparison` | B=∅; (D²,S¹); B=X | X/∅ = X⊔pt: H_n(X)→H_n(X⊔pt,pt)=H_n(X); H₂(D²,S¹)=ℤ→H̃₂(S²)=ℤ; X/X one point: 0→0 | holds |
| `closedCofibrationCylinderHomotopyExtension` | A=∅; A=X | ∂I×X ⊆ I×X is a closed cofibration; I×X ⊆ I×X trivial | holds |
| `homotopyInversePairExtension_left` | A=A'=∅; A=X, A'=X'; X=X'=D², A=A'=S¹, e=id, H₀ = full rotation of S¹ | left inverse of a homotopy equivalence; g=g₀, H=H₀, and g₀ is two-sided since e₀ is an equivalence; H prescribed on ∂(I×D²) ≅ S² extends into the contractible D² | holds |
| `finiteCover_transfer_exists` | B=∅; E=∅, B≠∅; identity cover | any `degree` admissible, all chains 0; degree forced 0, t=0; t=id, d=1 | holds |
| `regularCover_push_transfer` | trivial double cover B⊔B, G=ℤ/2 | p_*t(τ)=τ+swap(τ)=Σ_g g_*τ; a non-regular 3-sheeted cover of S¹∨S¹ is excluded by simple transitivity | holds |
| `compactSupportTopClass_existsUnique` | K=∅; K=M=S² with L=ℤ, canonical section; M=RP², L=ℤ; m=0 | H_m(M,M)=0, unique class 0; the fundamental class; only the zero section is locally represented and H₂(RP²;ℤ)=0; H₀(M,M∖K;L)=⊕_{x∈K}L_x | holds |
| `FundamentalClassDatum` (wrong models) | zero class; 2·generator over ℤ; any class over R with 2=0 on a closed manifold | span{0}=0≠⊤ unless R=0; span{2g}≠⊤; exists (Theorem 3.26) | the law excludes the wrong models |
| `poincareDuality_of_fundamentalClass` | n=0, M finite discrete; RP² with R=ℤ; RP² with R=F₂; R the zero ring | H⁰=R^M → H₀=R^M is multiplication by units u_x, bijective; no datum (H₂(RP²;ℤ)=0), vacuous; H¹(RP²;F₂)=F₂→H₁(RP²;F₂)=F₂ bijective; all modules 0 | holds |
| `capProduct` junk | p > q | excluded by `hpq`; `q − p` is never the junk 0 | holds |
| `lsCupLength_add_one_le_categoryCount` | point; S¹; T²; zero ring; no finite cover | 0+1 ≤ 1; cup length 1 (H¹=ℤ, H²=0), 1+1 ≤ 2 (two arcs), sharp; a∪b≠0 gives 2+1 ≤ 3; sSup ∅=0, 1 ≤ count ≥ 1 for nonempty X; ⊤+1 ≤ ⊤ | holds |
| `productBallImages_intersect` | p=q=0; p=1,q=0; p=0,q=1; p=q=1 without f's boundary law | both images {(0,0)}; f₁(±1)=±1 hits g(pt)=(c,0) by IVT; g₂ has degree 1 and hits f(pt); f≡(1,1), g(y)=(1−y²,y) are disjoint | holds; boundary law needed |
| 6.5 boundary-degree form | d_f·d_g≠0; f≡(a,0), g≡(0,b) | coefficient of F equals that of (f₁,−g₂) = (−1)^q d_f d_g ≠ 0, so F cannot factor through ℝ^{p+q}∖0; constants give d_f=d_g=0 and disjoint images | holds; README's negative control verified |
| 6.5 sign (−1)^q | (p,q)=(1,1),(2,0) | det diag(I_p,−I_q) = −1, +1 by 6.3's determinant-sign theorem | holds |
| `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` | S² with cells (0,2) and (0,0,1,1,2,2); D²≃pt; ∅ | 2 = 2−2+2; 1−1+1 = 1; 0 = 0 | holds |
| `compactManifoldFiniteCWType` | n=0; S¹ | finite discrete set; one 0-cell, one 1-cell | holds |
| `relativeCWConnectivityOfCellDimension` | (D^λ,S^{λ−1}), q ≤ λ−2; q = λ−1 | π_q(S^{λ−1})=0=π_q(D^λ); π_{λ−1}(S^{λ−1})=ℤ→0 not injective, excluded by `q+1<λ` | holds, bound sharp; `hLowerBound` unused (R07) |
| `whitehead_homotopyEquiv` | X two points, Y one point; Warsaw circle → point | `hinj` fails; non-CW source excluded | hypotheses needed |
| `homologicalWhitehead` | Hatcher's acyclic 2-complex → point; S²∨S⁴ vs CP² | homology iso, not an equivalence, excluded by simple connectivity; no map induces the iso, statement vacuous there | holds |
| `groupClassifyingSpace_isEMOne` | G trivial; G=ℤ | nerve = Δ⁰, realization a point; Bℤ ≃ S¹, π₁=ℤ | holds |
| `properStrongDeformationRetract_of_inverse` | A=X; A=∅, X≠∅ | r=id; no map X→∅, hypothesis unsatisfiable | holds |
| `finiteSourceMappingCWType` | X=pt; X=∅; X=S¹=Y; X=ℕ discrete, Y=S¹ | C(pt,Y)≅Y; a point; LS¹ ≃ S¹×ℤ; (S¹)^ℕ has π₁=ℤ^ℕ, not finitely generated, while a compact space of CW type is dominated by a finite complex, so not CW type | compactness of X needed; holds |
| `exists_transverse_circle_classifying_map` | M=S¹, a=±generator; a=0; M=T², a=(1,0); M=∅; M=point | f=z or z̄, derivative surjective; f≡−1, f⁻¹(1)=∅; first projection; vacuous; H¹=0 | holds; both generators admissible as the docstring says |
| `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; C_p acting freely on S¹ (negative control) | 4 elements on 2 points: a stabiliser of order ≥ 2; C_p is cyclic so the theorem's hypothesis excludes it | holds, hypothesis needed |
| 8.5 H₂ | Künneth | H₂(RP²×S³)=0⊗ℤ⊕ℤ/2⊗0⊕ℤ⊗0=0, Tor terms 0; H₂(S²×RP³)=ℤ⊗ℤ=ℤ | holds |
| 8.5 π₁-actions | deck maps | antipode on S² has degree (−1)³=−1, acts by −1 on π₂(X)=ℤ; deck of Y fixes S², acts by +1 | holds |
| 8.5 no inducing map | both directions | equivariance φ(−a)=φ(a) forces 2φ(a)=0, φ=0 on ℤ | holds |
| 8.13 smoothing | f smooth, A=M; M=P=Circle, f≡1 | returns g=f (approximation with S=M); any smooth g≃f has degree 0, never the identity; the ball of radius ε(x)=dist(f(x),V∖W) lies in W and is convex | holds; P a point gives ε≡0 (R01 Checks) |
| 8.13 transversality | β(x)=0; β(x)>0; M=Circle, f≡1, Z={1} | β ≥ 0 so dβ=0 at zeros and dF=df⊕0, transverse since x∈U; s↦exp(β s)·f(x) is a scaled diffeomorphism followed by a transitive orbit map, a submersion; slice e^{is}≠1 for s∉2πℤ, g⁻¹(1)=∅ | holds |
| 8.13 hyperplane adapter | RP¹, CP¹ | zero locus of v₀ is the single point [0:1], mod-2 count 1, complex count +1 = ⟨h,[CP¹]⟩ | matches C1.5 |
| 8.13 bordism sign | c=1,2 | (ν,∂_t,τ) = (−1)^c(∂_t,ν,τ); boundary +N₁ at t=1, −N₀ at t=0 | holds |
| 8.13 degrees | m=1 mod 2; m=2 integral codimension two; RP³ | H₀(M;F₂) by finite point sets; H₀(M;ℤ) by signed points, 0 = ∅; H₁(RP³;ℤ)=ℤ/2 torsion is codimension two | holds; "m ≥ 1", "m ≥ 2" avoid junk subtraction |
| 4.1 lifted CW structures | ℝ→S¹; universal cover of RP² | ℤ 0-cells and ℤ 1-cells, dimension 1; S² with two cells in each of dimensions 0,1,2 | holds |
| 6.3 topological forms | S^n compact; S^n ⊔ ℝ^n noncompact disconnected | H_n(S^n)=ℤ≠0 so noncompactness needed in 3.29; H_n=ℤ≠0 so connectedness needed | hypotheses necessary |
| 8.14 ¶1 | S²→S²×S³, n=2; n=0 | iso on π_i, i≤2, dim 5 > 2, H₃ differs; points | dimension bound needed |
| 8.14 ¶2 | X=Sⁿ; X=S¹∨S¹, Y=K(G,1); X=S², Y=RP∞×CP∞ | π_n(Y)=Hom(ℤ,π_nY); G²; ℤ with π₁Y=ℤ/2≠0 | holds; "no lower homotopy" disclaimer right |
| 8.14 ¶3 | torus, Klein bottle; S², RP² | ℝ² contractible; finite π₁, excluded | holds |
| 8.15 | d=0,1,2; X=RP²; n=0,1,>1 | dim 1,2,3 = d+1; RP² vs S²×RP∞; 4 > 2 points; cyclic deck group; dim H^{n+1}(K;F_p) ≤ 1 < n+2 | holds |
| 8.16 | f=p∘q; q constant | π_k(f)=0 (T³ aspherical, π₁S²=0), H̃_k(f)=0 (H₂ via H₂(S³)=0); a nullhomotopy lifts to a map into a fibre S¹ with H₃=0 against deg q=1; q constant makes f nullhomotopic | holds; degree needed |
| Stage 4 item 8 Checks | Lindelöfication; Dowker; S¹×S¹; ΣS⁰ | compact subsets finite so k-topology discrete, point not isolated; Hatcher pp. 524–525; locally compact factor; [S¹,Z]_*=π₀(ΩZ), both ℤ for Z=S¹ | hold |

**Declared gaps.** None (no readable `design/plan.json`; a revision of a main roadmap declares none).

## Not verifiable

- Thom 1954, Chapter II (representability theorems of 8.13): recorded `uncertified` in the manifest; cited by locator, not opened.
- Lee 2012, Theorems 6.26, 6.35, 6.36: recorded `uncertified`; cited by locator. Their general form is the basis of R01.
- Milnor 1959, Theorem 3 (8.11a): the README's URL is a university mirror; not in the manifest and not opened. The compact Hausdorff source generality was checked by the argument in the table instead.
- Farrell–Taylor–Wagoner 1973 (proper Whitehead, 8.5): not opened; inherited from main unchanged.

## Source issues

- none
