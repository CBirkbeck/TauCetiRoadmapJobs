# Review of GeometricTopology (pull request #903 at 778c5a5)

**Verdict:** needs changes

Full review of the roadmap folder at this head (the pull request revises the roadmap already on main; the diff is +5354/−270 README lines, 25 new companion `.lean` files and a rewritten `Suggested.lean`). The previous AI review (of the folder at 238d5da, which is the content now on main) is checked finding by finding first.

## Status of the previous review's findings

| Previous | Status at 778c5a5 | Evidence |
|---|---|---|
| R01 foliation headline reversed | repaired | Layer 10 states Thurston's inequality via the norm and Yazdi's non-realizability as a class (README 4512–4730). |
| R02 PL embeddings locally flat | repaired | README 946–955 keeps the trefoil-cone counterexample and a separate local-standard-pair hypothesis. |
| R03 JSJ without minimality | repaired | README 4113–4135 defines `IsMinimalJSJ` and names T³'s empty system. |
| R04 Smale as homeomorphism | repaired | README 1083, 1103: homotopy equivalence. |
| R05 Cerf without orientation | repaired | README 5898: `π₀(Diff⁺ S³) = 0`. |
| R06 concordance to the mirror | **not repaired** | README 3252 still displays `boundary Σ = K ⊔ K'.mirror`; see R06 below. |
| R07 Zeeman finiteness | repaired | README 4851–4866: finite complex, finite subdivision. |
| R08 link recursion at n = 0 | repaired | README 4830–4845: pattern match on dimension. |
| R09 smooth-link carrier | partly | prose fixed (README 1185–1188); the Lean sketch at 1454 still reads `{ f : C^∞(circle, M) // IsEmbedding f }`. |
| R10 free action / interiors | repaired | README 4096–4104. |
| R11 boundary model of flatness | partly | README 946–948 mentions half-space pair charts; no boundary model is defined. |
| R12 Heegaard existence scope | **not repaired** | README 4455 still says "Every closed 3-manifold"; see R05 below. |
| R13 Conway route through τ | **not repaired** | README 1486–1487 still routes Problem 1.41 "jointly with … `τ`"; see R07 below. |
| R14 two-way dependency with CombinatorialHeegaardFloer | **not repaired, widened** | see R01 below. |
| R15 unsupplied internal suppliers | partly | prime decomposition is now owned (README 4078–4093); Layer 9 still consumes "Layer 1's handlebodies" (README 4460) that Layer 1 never defines (grep of 215–908 finds no handlebody construction). |
| R16 replanning native objects | partly | Layer 4 now lists the native knot substrate (README 1145–1157); Layers 2, 3, 5, 8, 9, 11 still replan native carriers; see R08 below. |
| R17 statable headlines absent | **not repaired** | see R03 below. |
| R18 narrowed headlines (Li, Manolescu) | **not repaired** | README 4487, 4887; see R04 below. |
| R19 executable algorithms | repaired in Layer 4's opening, **re-introduced** at README 2244–2247; see R09 below. |
| R20 milestones without contracts | partly | Watanabe (README 1120–1124), cosmetic surgery (3157), Levine (3430), Weeks (3496) still have no quantified contract; see R10 below. |
| R21 locators | partly | Freedman–Quinn now cited as Theorem 11.11 (5927–5928); Kirby 4.34 (1127, 5902), Property R 1.82 (3161, 5939) and the Gabai–Yazdi credit (5992) remain; see R15 below. |
| R22 conventions | repaired | `Δ_K(1)=1` (1267), averaged signatures with the parity proof (3355–3380), trefoil Jones value (2232). |
| R23 README shape | **not repaired** | see R12 below. |
| R24 residue gate | **not repaired** | gate `residue=15`; see R13 below. |
| R25 stray files | **not repaired** | gate `stray-files=2`; see R14 below. |

## R01 (P1) — The new supplier table creates two-way dependencies with eight roadmaps on main

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:46–78` (table "Cross-roadmap interfaces"), 884, 2585, 3390–3400, 4522–4526. **Claim:** AlgebraicTopology, CharacteristicClasses, GeneralizedCohomology, TopologicalKTheory, MorseTheory, RiemannianGeometry, KhovanovHomology and CombinatorialHeegaardFloer are suppliers of this roadmap. **Witness:** on main each of them consumes this roadmap: `AlgebraicTopology/README.md:834, 1813` (consumes Layer 11), `CharacteristicClasses/README.md:107` (Layers 1, 3, 10), `GeneralizedCohomology/README.md:43, 1525` (Layer 1 tubes), `TopologicalKTheory/README.md:122, 958` (Layer 1), `MorseTheory/README.md:20, 68, 456` (Layer 1), `RiemannianGeometry/README.md:72, 1280` (Layer 1), `KhovanovHomology/README.md:21–22, 412` (Layer 4 and Layer 1), `CombinatorialHeegaardFloer/README.md:227` (Layer 4). The main README cited only CombinatorialHeegaardFloer, DifferentialGeometry and HopfRinow; this head adds 22 supplier roadmaps, eight of which already sit downstream.

**Repair:** this roadmap is the foundation those roadmaps build on, so it may not consume them. Delete the eight rows from the table and every "consume" sentence pointing at them (TopK T1.1–4 at 878, Morse M1/M2 at 882, HS4A/DGF1.2 at 880, CC C1.1/C2 at 884, AlgebraicTopology Stage6/4.7/8.5 at 4522–4524 and 4780, KhovanovHomology G/K1–K7 and CombinatorialHeegaardFloer G6/G10/G13 at 3390–3430, RiemannianGeometry R4.3/R4.4/R4.7 at 4049–4052 and 3516–3524). Targets that genuinely need them (the Lee/`s` package, the grid-`τ` adapter, the Euler-class comparison, the Bott/clutching LES stage, the Haken hyperbolization's model inputs) move to a `GeometricTopology, Part II` roadmap placed after those suppliers; this roadmap keeps the foundational layers only. Re-raised: R14 of the previous review. The mechanical check cannot see these edges: the README contains no `*Needs:*` line at all (grep count 0), so `depcheck` reports 0 problems trivially.

## R02 (P2, blocking) — `set_option` in a roadmap Lean file

**Location:** `TauCetiRoadmap/GeometricTopology/FiniteVolumeExtension.lean:18–19`: `set_option linter.unusedVariables false`, `set_option linter.overlappingInstances false`. **Witness:** the brief's principles make any `set_option` in a roadmap `.lean` file a blocking finding; the gate's `set_option=0` scans `Suggested.lean` only. **Repair:** delete both lines and restate anything that then fails (an unused binder is removed or used; an overlapping instance is made `local` or dropped).

## R03 (P2) — No headline theorem is stated although nine are statable at the pins

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:9–82, 100–428`. **Claim:** the docstring says only the smooth tubular theorem and CW transport are not statable, then states 15 Layer 1 tube lemmas, a `Microbundle` structure and a `topGroup` carrier. **Witness:** two scratch probes against the pinned Tau Ceti elaborated with only `sorry` warnings: `theorem smale : TauCeti.SmaleConjecture`, a Manolescu statement (`IsManifold (𝓡 n) 0 M`, compact, T2, second countable, `¬ TauCeti.IsTriangulable M`, every `n ≥ 5`), a Poincaré statement (`SimplyConnectedSpace M → Nonempty (M ≃ₜ sphere)`), `TauCeti.JSJTheorem`, `TauCeti.GeometrizationConjecture`, `TauCeti.FreedmanSliceTheorem`, `TauCeti.AnnulusConjecture n`, `TauCeti.MostowRigidity`, `TauCeti.VirtualFiberingConjecture` (`TauCeti/Geometry/Diffeomorphism/Smale.lean:46`, `Topology/Triangulable.lean:40`, `LowDimTopology/JSJDecomposition.lean:248`, `LowDimTopology/Geometrization.lean:144`, `KnotTheory/Slice/Freedman.lean:64`, `Geometry/Manifold/LocallyFlat/Annulus.lean:105`, `Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:72`, `VirtualFibering.lean:62`). None is in `Suggested.lean`.

**Repair:** state those nine headlines (and the Euler-class-one counterexample, Weeks minimality, Property P and Kondo's theorem are named in the docstring as not statable, each with the missing carrier: a `Foliation`/Euler-class carrier, `weeksManifold`, Dehn surgery, the unknotting number of a geometric knot). Move the 15 tube lemmas, `NormalModel`, `quotientNormal`, the two topology instances, `normalRadiusTube`, `normalExponential`, `normalExpDomain`, `Microbundle`, `microbundleNeighborhoodFiber`, `topGroup`, `topGroupCompactOpenPair`, `topGroupTopology` and the `example` to the README as Layer 1 targets: they are API, and the two instances are data (`TopologicalSpace.coinduced`/`induced`) that a headline does not need. Delete the "As the prerequisite types land … state each layer's milestones here" paragraph and the commented signatures (lines 46–82): process narrative. Re-raised: R17.

## R04 (P2) — Two headlines are narrowed below the cited theorems

**Location:** `README.md:4487`: `waldhausen_false : ∃ M, groupRank (FundamentalGroup M) < heegaardGenus M`; `README.md:4887`: `manolescu_not_triangulable : ∃ M : ClosedTopological5Manifold, ¬ IsTriangulable M`. **Witness:** Li's theorem gives, for every `k`, closed orientable hyperbolic examples with `g(M) − rank π₁(M) ≥ k` (`li-rank-genus` lines 48–68 as read in the previous round); Manolescu's Corollary 1.3 gives non-triangulable closed manifolds in every dimension `n ≥ 5`, non-orientable in dimension 5 and orientable above (`manolescu` lines 60–90). The scratch probe shows the `∀ n ≥ 5` form elaborates at the pin. **Repair:** state `∀ k, ∃ M, rank π₁ M + k ≤ g(M)` and `∀ n ≥ 5, ∃ M …` with the orientation qualifications; keep gap 1 and `n = 5` as Checks. Re-raised: R18.

## R05 (P2) — Heegaard existence is still asserted for every closed 3-manifold with orientable handlebodies

**Location:** `README.md:4455`: "Every closed 3-manifold splits into two handlebodies"; `4472–4475`: handlebodies glued by a boundary diffeomorphism reversing induced orientations. **Witness:** `ℝP² × S¹` is closed and non-orientable; a union of two orientable handlebodies along a connected boundary with compatible orientations is orientable. The Lean sketch (4486) already says `ClosedOrientable3`. **Repair:** state the theorem for connected closed orientable 3-manifolds, or add the non-orientable handlebody (solid Klein bottle summands) as a separate carrier. Also replace "Layer 1's handlebodies" (4460) by the Layer 9 construction itself, since Layer 1 builds handles, not handlebodies. Re-raised: R12, R15.

## R06 (P1) — The displayed concordance definition still asks for a concordance to the mirror

**Location:** `README.md:3252`: `def Concordant (K K' …) : Prop := ∃ Σ : Annulus (sphere 3 ×ₘ I), boundary Σ = K ⊔ K'.mirror`. **Witness:** the product annulus on a right-handed trefoil is a concordance from the trefoil to itself; under the displayed condition it would have to end at the mirror, whose signature is `+2` against `−2`. The pinned `TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:93–101` uses the two endpoint embeddings with no reflection. **Repair:** define concordance with the two endpoints as in the native `Concordance` structure and put the reverse mirror only in the group inverse (as the prose at 3220 already says); delete or correct the displayed definition. Re-raised: R06.

## R07 (P2) — Problem 1.41 is still routed through `τ`

**Location:** `README.md:1486–1487`: "`0`-shake genus vs slice genus, `[Kir97, Problem 1.41]` (Piccirillo, via the Conway knot, jointly with the combinatorial Heegaard Floer roadmap's `τ`)". **Witness:** Piccirillo's obstruction uses Rasmussen's `s` on the trace-sibling knot and notes `τ(K′) = 0` there (`piccirillo2020` lines 93–104 as read in the previous round), so `|τ| ≤ g₄` gives only `0 ≤ g₄`. GT6 now owns `s` (3388–3425), so the fix is one sentence. **Repair:** route the unlock through GT6's `s` and the trace-equivalence target, not `τ`. Re-raised: R13.

## R08 (P2) — Layers 2, 3, 5, 8, 9 and 11 replan objects that exist at the pin

**Location and witnesses** (pin `a91d3aa`):
- `README.md:922, 977–979` plan `IsLocallyFlat`, its restriction/product API, `bicollared_of_locallyFlat_sphere` and `annulus_conjecture`; the pin has `TauCeti.IsLocallyFlat` (`Geometry/Manifold/LocallyFlat/Basic.lean:376`), `CoboundAnnulus`/`AnnulusConjecture` (`Annulus.lean:91, 105`) and `brownBicollaring` (`Brown.lean:39`).
- `README.md:1023, 1032–1041, 1080–1082`: "Mathlib has the `Diffeomorph` type but no group object and no topology on it", then plans `Diff(M)`, its C^∞ topology and `smale_conjecture`; the pin has `TauCeti.Diff` (`Geometry/Diffeomorphism/Group.lean:178`), its topology (`Topology.lean`) and `TauCeti.SmaleConjecture` (`Smale.lean:46`).
- `README.md:3127–3137, 3143–3144`: plans `Slope`, `FramedBoundaryTorus`, `slopeEquiv`; the pin has `TauCeti.Slope`, `slopeValue`, `slopeOfValue` (`LowDimTopology/DehnSurgery/Slope.lean:122, 221, 253`).
- `README.md:4113–4135, 4160–4175`: plans `IsMinimalJSJ`, `JSJDecomposition`, `jsj_exists`, Seifert fibrations and `geometrization_piece`; the pin has `IsJSJDecomposition`, `JSJTheorem` (`JSJDecomposition.lean:210, 248`), `IsSeifertFibration`/`IsSeifertFibered` (`SeifertFibration.lean:194, 206`), `IsGeometricTorusDecomposition`, `GeometrizationConjecture` (`Geometrization.lean:107, 144`).
- `README.md:3464–3478, 3485–3489`: plans `HyperbolicMetric`, `hypVolumeOfMetric`, `hypVolume_indep`; the pin has `hypVolumeOfMetric`, `hypVolumeOfMetric_eq_of_mostow`, `hypVolume` (`Hyperbolic/Volume.lean:50, 104, 122`), `IsMostowRigid`, `MostowRigidity` (`Mostow.lean:40, 72`), `HasFiniteVolume`, `IsFiniteVolumeHyperbolic` (`FiniteVolume.lean:63, 97`), `VirtualFiberingConjecture`, `VirtualHakenConjecture`.
- `README.md:4795, 4829–4845, 4880–4890`: plans `IsTriangulable`, `IsCombinatorialManifold`, `ZeemanConjecture`; the pin has `TauCeti.IsTriangulable` (`Topology/Triangulable.lean:40`), `IsCombinatorialBall/Sphere/Manifold` (`SimplicialComplex/CombinatorialManifold.lean:80–193`, with the dimension-0 split at 193–205), `Contractible2Complex`, `ZeemanConjecture` (`Zeeman.lean:62, 124`).

**Repair:** cite each native declaration by name and file in a supplier-contract section, delete the duplicate definitions, and keep only what the pin lacks (the proofs, Dehn filling, the Seifert fibration API beyond the predicate, the realization-level comparisons), saying in one clause how each kept variant differs. The "Inventory" at 135–196 and its closing claim that everything beyond the tangent bundle "is missing from Mathlib" (190–195) must be rewritten against Tau Ceti, not Mathlib alone. Re-raised: R16.

## R09 (P2) — Executable procedures are again deliverables

**Location:** `README.md:2244–2247`: "Prove existence, uniqueness and executable multiplication/inversion/reduction; thus decide equality of finite braid words … an effective terminating procedure finding one … The algorithm decides conjugacy iff the two complete finite reachable sets intersect, returning an actual conjugator on success and an exhaustive certificate on failure." Also 3352: "Give finite rational row-reduction procedures … with verifiable kernel/image certificates." **Witness:** the principles exclude computational algorithms; the mathematics (Garside normal forms exist and are unique; super-summit sets are finite, nonempty and connected under simple conjugations) is statable without an executable decision procedure. **Repair:** keep the Garside and super-summit theorems as mathematics and delete the executability, procedure and certificate clauses. Re-raised: R19.

## R10 (P2) — Four milestones still have no mathematical contract

**Location:** `README.md:1120–1124` (Watanabe: "a specific element of `π_k(Diff(D⁴, ∂))` … is nonzero"), `3157–3158` (cosmetic surgery: no slope pair, orientation or conclusion), `3250` and `3430–3431` (Levine: "needs the knot type generalized to ambient homology spheres … note it as a dependency"), `3496–3497` (Weeks: "pick one" of two constructions), `3246–3247` (mutation "by a `(±1)`-tangle replacement"). **Witness:** Watanabe's Theorem 1.1 is a surjection from `π_k BDiff(D⁴,∂) ⊗ ℚ` onto a graph-homology space, nonzero already for `k = 2` (`watanabe2018` lines 59–101, previous round); Levine's statement needs an annulus in an integral homology cobordism (`levine2016` lines 135–143); Conway mutation is the marked four-punctured-sphere involution, and a general `±1` tangle replacement changes the knot type arbitrarily. **Repair:** give each its objects, quantifiers and locator: Watanabe's degree and boundary convention; "chirally cosmetic": two slopes `r ≠ r'` on the same exterior with orientation-reversing homeomorphic fillings, conclusion for which knots; Levine's homology-cobordism concordance as a target with the ambient-sphere knot carrier; the Weeks manifold as one fixed construction (the `(5,1)`, `(5,2)` fillings of the Whitehead link or the dodecahedral face pairing); mutation as the marked Conway-sphere involution. Re-raised: R20.

## R11 (P2) — GT7's finite-volume Mostow–Prasad target drops the dimension of the second manifold

**Location:** `TauCetiRoadmap/GeometricTopology/FiniteVolumeExtension.lean:159–172`. **Claim:** for finite-volume hyperbolic `M`, `N` modelled on the same `E` with `3 ≤ finrank E` and `π₁ M ≃* π₁ N`, there is an isometry inducing the isomorphism. **Witness:** the statement is true as written because both manifolds are modelled on the same `E`; but `hdim` is the only dimension hypothesis and the README (3524–3528, "closed Mostow theorem remains an actual theorem target in every n≥3") never says the finite-volume version is stated against `IsFiniteVolumeHyperbolic` rather than compactness. This is fine; the defect is that `finiteVolume_eq_of_piOne_equiv` (174–183) is proved from the hard target, so the file contains a theorem whose proof body depends on a `sorry` and the gate counts that as a proved consequence. **Repair:** keep `finiteVolumeMostowPrasad` as the single admitted target and either delete the corollary or state it with `sorry` as well; a proof whose only input is an admitted theorem should not be presented as discharged. (P2 because the PR text claims "Hasse/volume consequences proved".)

## R12 (P3) — The README is not in TauCetiRoadmap form

**Location:** `README.md:1–215, 5806–6033`. **Witness:** the headings are `## Relationship to …`, `## Cross-roadmap interfaces`, `## Principles`, `## Encoding conventions`, `## Inventory`, `## The layers …`, `## Acceptance criteria`, `## How to drive it`, `## Acknowledgements`; there is no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, no `### k.n` subsections, no `**Checks.**` lists (zero occurrences), no `*Needs:*` lines (zero), no `### Examples`/`### Dependencies` closers. Definitions therefore have no discriminating Checks (for example `IsMinimalJSJ`, `thurstonPolar`, `Microbundle`, `topGroup`, the Heegaard genus) and theorems have no per-target needs. **Repair:** restructure to the required shape; convert the convention tables and acceptance criteria into Checks on the definitions they test; give each target a `*Needs:*` line so the dependency check sees the real edges (see R01). Re-raised: R23.

## R13 (P3) — The residue gate fails and process narrative remains

**Location:** `README.md:1401, 1525, 1613, 1632, 1997, 2076, 2165, 2207, 2289, 2462, 2508, 2543, 2915, 3306, 4428` (fifteen `<a id=…>` anchors); `3535` ("Precise prerequisite handoffs"); `884` ("remains a Luna-glyph hold if the Markdown does not establish its vertices"); `880` ("Installed native Serre modules and public720bf fibration sources have different epochs"); `914, 1023, 1321` ("lean-eval already carries", "lean-eval currently dodges", "lean-eval monstrosities"); `973–974` ("The earlier draft instead assumed … which is circular"); `4505–4506` ("⚠ Confirm the rank invariant exists … Mathlib may not provide exactly `Group.rank`", although `Group.rank` is at `Mathlib/GroupTheory/Rank.lean:33`); `4800–4801` (two Mathlib pull-request links); `1591–1603` (sha256 "source identity" strings, "KM-P073-B004" paragraph identifiers, "current source-input boundaries", "input holds"). **Witness:** gate `residue=15`, overall `FAIL`. **Repair:** number subsections `### k.n Title` instead of anchors; replace process wording by the mathematics or delete it; cite Mathlib declarations, not pull requests. Re-raised: R24.

## R14 (P3) — Stray files, and sources that cannot be read

**Location:** `TauCetiRoadmap/GeometricTopology/references/` (22 extract files; `references/kirby-problems.md:7` says each problem "is transcribed verbatim") and `TauCetiRoadmap/GeometricTopology/source-inputs.md`. **Witness:** gate `stray-files=2`; 48 README links into `references/`, 8 into `source-inputs.md`. The verbatim transcriptions are copied passages, which the source policy forbids. Separately, the Layer 4 targets at 1526–1605, 1786–1800, 2208–2232, 2377–2460, 2543–2580 and 3307–3320 are built on *Knot Theory.pdf* and *Knot Theory - problems.pdf*, identified only by sha256 and "physical pages"; neither text is in the sources cache, in the operator's local source directory, or at any legal URL the README gives, so none of those locators can be verified by anyone (see Not verifiable). **Repair:** delete both stray files and the extracts (cite the books by theorem and page); for the course notes either name a legal copy and record it in `sources.toml`, or restate those targets against published sources (Lickorish, Burde–Zieschang, Kondo, Conway) and drop the page-identity apparatus. Re-raised: R25.

## R15 (P3) — Source locators and credits

**Location:** `README.md:1127, 5902`: Hatcher's theorem cited as `[Kir97, Problem 4.34]`; `3161, 5939`: Property R as `[Kir97, 1.82]`; `5992`: "D. Gabai, M. Yazdi, *On Thurston's Euler class-one conjecture*". **Witness:** Problem 4.34 is the four-dimensional question `Diff(S⁴) ≃ O(5)?`: Watanabe cites it for his disproof (cached text line 30: "conjecture [Kir, Problem 4.34, 4.126]"; line 61: "Diff(S⁴) ≄ O5 (cf. [Kir, Problem 4.34, 4.126 …])"); ordinary Property R is Kirby's 1.16 and 1.82 concerns framed links (previous round, `kirby1997` lines 425, 1638); the arXiv 1603.03822 paper has the single author Mehdi Yazdi (`yazdi2016` line 6) and the joint fully-marked-surface paper is arXiv 2008.07223. **Repair:** cite Hatcher's paper without a Kirby number (or 3.? of the list's Smale-conjecture entry), Property R as 1.16, and credit Yazdi alone at 5992. Re-raised: R21.

## R16 (P3) — Lean form of the companion files

**Location and witnesses:**
- `Mathlib.<submodule>` imports instead of `import Mathlib`: `CompositeKnotGeneratorTargets.lean:1–2`, `TrefoilMirrorTargets.lean:1`, `IndexedDoublingTargets.lean:1–3`, `KnotMixedCycleTargets.lean:1–2`, `LeeFrobenius.lean:1–4`, `KnotGrowthTargets.lean:1–5`, `JonesCyclotomicTargets.lean:1–2`, `TorusKnotTargets.lean:1–4`, `MarkedAlexanderMinorTargets.lean:1–3`, `TwoTangleSkeinTargets.lean:2–3`, `BrunnianBraidTargets.lean:2–4`, `FiniteVolumeExtension.lean:9`, `SimplicialLinks.lean:8–10`, `RealAlgebraicRealization.lean:7–8`.
- `#print axioms`: `SimplicialLinks.lean:88–94`, `ExchangeFamily.lean:92–103`, `RealAlgebraicRealization.lean:53–57`.
- Namespaces outside `TauCetiRoadmap.GeometricTopology`: `GT7FiniteVolume` (`FiniteVolumeExtension.lean:21`), `GT7RealAlgebraic` (`RealAlgebraicRealization.lean:12`), `TauCetiRoadmap.GT4Exchange` (`ExchangeFamily.lean:8`).
- Padding (one-tactic or small-value computations, Checks in Lean): `KnotGrowthTargets.lean:57–65` (`orientedCodeBound`: `2·2^n·4^{4n} = 2·512^n`), `:73–76`, `:85–96` (`pretzel_minus3_5_7_alexander`, `pretzel_3_5_minus7_symmetric`), `FiniteVolumeExtension.lean:188–193` (`enclosure_implies_truncation`), `FiveOneTargets.lean:66–69` (`symmetric_normalization`), `MarkedAlexanderMinorTargets.lean:33–47`, `Problem20FoxTargets.lean` (all four theorems are `decide` computations), `DowkerExerciseTargets.lean:52–55`, `KnotMixedCycleTargets.lean:19–20` (`example`s), `IndexedDoublingTargets.lean:64–72`, `Suggested.lean:206–209` (an `example` restating the instance just declared).
- Missing docstrings: `Suggested.lean:224, 271, 413, 420`, `FiveTwoColoringTargets.lean:16–24`, `FourBandSeifertTargets.lean:12–18`, `TrefoilMirrorTargets.lean:16–26`, `TwoStrandAlexanderTargets.lean:15–20`, `TorusKnotTargets.lean` (nine theorems).
- Process text in docstrings: "physical pages102–103 of the course notes" (`CrossingChangeTargets.lean:7`), "The source's initial KT run remains qualified separately" (`JonesMutantTableTargets.lean:7`), "comparison3b"/"comparison3c" (`Suggested.lean:356, 382, 416`).
**Repair:** `import Mathlib` plus the `TauCeti.*` modules used; delete `#print axioms`; one namespace `TauCetiRoadmap.GeometricTopology`; delete the padding (the README keeps the values as Checks); add docstrings; replace course-note page references by the README section.

## R17 (P3) — Lean names absent from the README

**Location:** `Suggested.lean:163–296, 348–426`. **Witness:** `NormalModel`, `quotientNormal`, `quotientNormalTopology`, `smoothEmbeddingTangentPullbackContMDiffVectorBundle`, `normalBundleTopology`, `normalRadiusTube`, `normalExponential`, `normalExpDomain`, `isOpen_normalExpDomain`, `orthogonalNormal_map_eq_normalSubspace`, `isOpenEmbedding_normalTube_of_injOn`, `exists_uniform_unique_nearestPoint`, `nearestPointDomain`, `Microbundle`, `microbundleNeighborhoodFiber`, `microbundle_exists_fiberBundleNeighborhood`, `topGroup`, `topGroupCompactOpenPair`, `topGroupTopology`, `topGroup_isTopologicalGroup`, `topGroup_continuous_eval` occur nowhere in the README (grep); the README instead names the native `exists_isOpenEmbedding_normalTube` (606) for the compact case. **Repair:** after R03, every surviving Lean declaration is named once in the README at its target.

## Verified sound

**Gate and build.** Gate at this head: `FAIL` with `residue=15`, `stray-files=2`; all other counters 0 (`build=0`, `depcheck=0`, `sorry-data=0`, `imports=0`). `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` from the worktree root: exit 0, exactly 15 `declaration uses sorry` warnings (lines 102, 111, 121, 139, 153, 271, 286, 300, 308, 325, 335, 344, 383, 417, 420), no error. A scratch copy with `#check @name` for all 31 declarations elaborated; every `def`/`instance` keeps only the section variables its type mentions (`orthogonalNormal` drops `[IsManifold J 1 M]`, harmless since `mfderiv` needs none; `nearestPointDomain` drops every manifold instance, harmless). The one-tactic probe (`first | rfl | simp | infer_instance | exact le_rfl | aesop` in place of each `sorry`) failed on all 15 theorems: none is padding by that test. `SimplicialLinks.lean` elaborates (exit 0); `FiniteVolumeExtension.lean` could not be elaborated here because its Tau Ceti import's object file is not built in this worktree. Outside-folder diff against `origin/main`: empty.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 200 roadmaps, 1322 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. This is not evidence of acyclicity: the README has no `*Needs:*` line, so the checker reads no edge from it (R01).

**Headline probes.** Two scratch files elaborated with only `sorry` warnings: `TauCeti.SmaleConjecture`; Manolescu for every `n ≥ 5` on `IsManifold (𝓡 n) 0 M`; Poincaré on `SimplyConnectedSpace`; `TauCeti.JSJTheorem`; `TauCeti.GeometrizationConjecture`; `TauCeti.FreedmanSliceTheorem`; `TauCeti.AnnulusConjecture n`; `TauCeti.MostowRigidity`; `TauCeti.VirtualFiberingConjecture` (the last six after `lake build` of their modules, 34 s).

**Adversarial calculations.** Values computed on both sides; numerical rows were run in a scratch script with exact rational arithmetic.

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 1 | `5₂` kernel formula (README 1557, `FiveTwoColoringTargets.lean:37`) | rows 1–5 at `v=(c,c+a,c−a,c−2a,c−4a)` | row sums `0,0,0,−7a,7a`; with `7a=0` all 0; `Q·(0,0,0,a,c)` = that vector | correct for every commutative ring |
| 2 | Smith certificate, cofactors | `P A Q`; all 25 signed cofactors | `diag(1,1,1,7,0)`, `det P=−1`, `det Q=1`; every signed cofactor `−7` | correct |
| 3 | colouring counts | `m=1,7,14` | `m·gcd(m,7)=1,49,28`; nonconstant `0,42,14` | matches 49/42 |
| 4 | Seifert family determinant (README 1788, `SeifertFamilyTargets.lean:38`) | `k=1,2` by hand; `k=1..4` at `t=2,3,−1,5` | `k=1`: `(1−X)²+X`; `k=2`: `−(1−X)⁴+X²`; all numeric points equal `(−1)^{k−1}(1−X)^{2k}+X^k` | correct |
| 5 | extreme coefficients, degree | `k≥1` | constant and top coefficients `(−1)^{k−1}`, degree `2k` | correct |
| 6 | native comparison | even size `2k` | `det(TV−Vᵀ)=det(−(V−TVᵀ)ᵀ)=(−1)^{2k}det(V−TVᵀ)`; native `alexander` = `T^{−⌊n/2⌋}·det` (`Alexander.lean:378`) | correct |
| 7 | symmetric power form | `k` | `T^{−k}(1−T)^{2k}=(T+T^{−1}−2)^k` | correct; `≠1` since the power is nonzero |
| 8 | Kondo reconstruction (`SeifertFamilyTargets.lean:98`) | `n=1`, `n=2` | `n=1`: `a₁=1−2a₀`, RHS `a₀X²+(1−2a₀)X+a₀`; `n=2`: `X²` coefficient `1−2a₀−2a₁=a₂` | correct |
| 9 | two-strand continuants (`TwoStrandAlexanderTargets.lean`) | `r=0,1,2,3` | `1, 1−X, 1−X+X², 1−X+X²−X³` = `raw(r+1)` | correct |
| 10 | division-free identity, `F_n(−1)` | `n`; `X=−1` | `(1+X)Σ(−X)^j=1−(−X)^n`; `F_n(−1)=n` | correct |
| 11 | normalized recurrence | `n=0,1` | `N₂=T^{−1}−T=0−(T−T^{−1})·1`; `N₃=T²−1+T^{−2}=1−(T−T^{−1})(T^{−1}−T)` | correct |
| 12 | cinquefoil Fox row (`FiveOneTargets.lean:48`) | word `xyxyx(yxyxy)^{−1}` | exponents `0,2,4` positive, `−T³,−T¹` negative: `T⁴−T³+T²−T+1` | correct (also closed by `norm_num`) |
| 13 | cinquefoil presentation isomorphism | `a=xyxyx`, `b=xy` | `a²=(xyxyx)(yxyxy)=(xy)⁵=b⁵`; `b^{−2}a=x`, `a^{−1}b³=y` | correct |
| 14 | trefoil reflection (`TrefoilMirrorTargets.lean`) | `x↦x^{−1}`, `y↦y^{−1}` | relator maps to a conjugate of its inverse; `(x^{−1}y^{−1})³=((yx)³)^{−1}=((xy)³)^{−1}` by centrality; `λ₊=zx^{−6}↦z^{−1}x⁶=λ₋` | correct |
| 15 | composite needs 3 generators (`CompositeKnotGeneratorTargets.lean`) | `Dih(C₃²)`, order 18 | two reflections generate ≤ 6 elements, reflection+translation ≤ 6, two translations ≤ 9 | not 2-generated; correct |
| 16 | indexed doubling relation (`IndexedDoublingTargets.lean:34`) | `s=(012)`, `t=(234)` in `S₅` | `ststs=(03)(14)=tstst` | correct; transposition tree generates `S_{2k+3}` |
| 17 | mixed-cycle labels | `a=(34)(012)`, `b=(24)(013)` | `ab=(0 2 3 1 4)` five-cycle, `a³=(34)` | generate `S₅` (proved in file) |
| 18 | torus-knot signature (README 3277–3300) | `T(2,3)`, `T(2,5)` | pairs with `1/2<i/P+j/Q<3/2`: 2 of 2, 4 of 4; `N_out−N_mid=−2,−4` | matches native trefoil value `−2` at `−1` |
| 19 | crossing-change bound (`CrossingChangeTargets.lean`) | rank-one Hermitian perturbation; TL form | `(1−ω)+(1−ω̄)=2(1−Re ω)` real, so the difference is `c'vvᵀ` Hermitian; signature change ≤ 2; at `ω=−1` native `tristramLevineSignature_neg_one` (`TristramLevine/Basic.lean:184`) | correct |
| 20 | averaged signature parity | off roots | form nonsingular of size `2g`, signature even; `σ₊+σ₋` even; at a trefoil root one-sided values `0,2`, average `1` | correct as stated (odd at roots allowed) |
| 21 | Jones at a cube root (README 2377–2383) | positive Hopf, 2-unlink, trefoil with `t^{1/2}=e^{πi/3}` | `−e^{πi/3}−e^{5πi/3}=−1`; `−2cos(π/3)=−1`; `t+t³−t⁴` at `ω`: `ω+1−ω=1` | `(−1)^{μ−1}` correct |
| 22 | `P_L(ω)` for even `μ` | `V=uP`, `u=e^{πi/3}` | `P(ω)=−1/u=e^{2πi/3}=ω` | `Φ₃ \| P−t` correct |
| 23 | sixth-root congruence | `ζ=e^{πi/3}` | `Φ₃(ζ)=ζ²+ζ+1=2ζ`; `ℤ[ζ]` Eisenstein; 2-unlink `−2cos(π/6)=−√3∉ℤ[ζ]` | correct |
| 24 | 3-braid Jones formula (README 2401) | `σ₁σ₂` (`e=2`), `σ₁³σ₂` (`e=4`) | `t(t+t^{−1}+1+t²−(1+t+t²))=1`; `t²(t+t^{−1}+1+t⁴−(t⁴+t²+1))=t+t³−t⁴` | correct |
| 25 | Table 2 identity (`JonesMutantTableTargets.lean:36`) | expand `(1−T²)(1−T⁶)W` | `T^{−8}−2T^{−6}+2T^{−4}−2T^{−2}+1−T⁴+2T⁶−2T⁸+2T^{10}−T^{12}=1−V` | correct; `V(1)=1`; `W(ζ)=0` so `V(ζ)=1` |
| 26 | KT/Conway words | permutation, exponent sum | both closures are 4-cycles `(1234)`; exponent sums `1,1` | consistent with knots; named-knot identity is a target, not checked |
| 27 | TL₂ coordinates (`TwoTangleSkeinTargets.lean`) | `e²=δe` (`TemperleyLieb/Basic.lean:20`) | product formula; cleared identity expands to `(1−μ²)(μs₀t₀+s₀t₁+s₁t₀+μs₁t₁)` on both sides; kernel `v=(a,−μa)`, `(1−μ²)a=0`; Gram det `μ(−l^{−1}m−l^{−2}μ)−1=l^{−2}(1−μ²)` | all correct |
| 28 | four-band form (`FourBandSeifertTargets.lean`) | `det V`, `det(V+Vᵀ)`, `Δ(1)`, `Δ(−1)`, inertia | `64`, `1089`, `1`, `1089`; leading minors `4,−41,−180,1089` give signature 0 | correct |
| 29 | marked cofactor (`MarkedAlexanderMinorTargets.lean:30`) | 40 integer points `(t,z)` | `det = Q(t)+z(−2t⁴+3t⁵−2t⁶)` at all 40; at `t=−1`: `45−7z` | correct |
| 30 | pretzel forms (`KnotGrowthTargets.lean`) | `P(p,q,r)`, `(−3,5,7)`, `(3,5,−7)` | `det(V−tVᵀ)=((pq+pr+qr+1)/4)(1−t)²+t`; `−15−21+35+1=0` gives `t`; `V+Vᵀ=[[8,5],[5,−2]]` | correct |
| 31 | universal counts | `m=0..4` | odd-numerator counts `0,2,2,6,10`; `3O_m=2^{m+1}−2(−1)^m` gives `0,6,6,18,30`; adjacent sums `2,4,8,16` | correct |
| 32 | Turaev-genus span bound (README 2110–2122) | `n,s_A,s_B` | `span_A ≤ 2n+2(s_A+s_B)−4 = 4n−4g_T`; `V_L(1)=(−2)^{μ−1}` from `(−T−T^{−1})^{μ−1}` at `T=1` | correct |
| 33 | shrinking family (`ShrinkingKnotTargets.lean`) | `‖t·a(s/t)−(s,0,0)‖` | `≤ t·C`; derivative `a'(s/t)` equals `a'(u₀)` at `s=tu₀`, `|s|<t` | correct |
| 34 | Euclidean tube statements (`Suggested.lean:100–160`) | parabola `y=x²`, unit circle | normals from `±x` meet at distance `√(1+4x²)/2>1/2`, so the tube is injective for `ε≤1/2`; circle injective for `ε<1`; README 657–663 proves `I−A_v≥(1−1/t)I>0` on an injective tube, so the inverse is smooth | statements consistent; invariance of domain gives the open embedding |
| 35 | chart Hessian / normal pairing (`Suggested.lean:300–316`) | `g=id`; `g(x)=(x,x²)`, `η=(−2x,1)` | `D²‖z−(u+n)‖²=2⟨h,k⟩`; `⟨Dη h,Dg k⟩=−2hk=−⟨η,D²g(h,k)⟩` | correct |
| 36 | Euler class parity (README 4546) | oriented closed 3-manifold | `TF⊕ℝ≅TM`, `e(TF)≡w₂(TM)=0 (mod 2)` since `TM` is trivial | correct |
| 37 | Yazdi norm data (README 4642–4650) | `e=2b`, `⟨b,[S]⟩=1−g` | `x(a[S]+b[F])=(2g−2)|a|+2|b|`; `x*(e)=max((2g−2)/(2g−2),0)=1` | consistent with `yazdi2016` Lemma 5.1 (line 1142) |
| 38 | JSJ of `T³` | empty family vs one coordinate torus | both admissible; minimality keeps only the empty family | README 4126–4128 correct |
| 39 | E8 plumbing (README 3180–3190) | rank `2k` bundles | dual handle indices `2k`, `4k`; `π₁` iso from boundary needs `2k≥3`, i.e. `k≥2` | correct; `k=1` excluded as stated |
| 40 | lens space homology | `L(p,q)` cell model | `d₂=p`: `H₀=H₃=ℤ`, `H₁=ℤ/p`, `H₂=0` | correct |
| 41 | Heegaard existence | `ℝP²×S¹` | non-orientable; union of two orientable handlebodies orientable | R05 |
| 42 | concordance definition | cylinder on the right trefoil | endpoints equal; displayed condition needs mirror, signatures `−2` vs `+2` | R06 |
| 43 | Li / Manolescu generality | gap `k=1,2`; `n=5,6` | sources give every gap and every `n≥5`; README existentials cover gap `>0` and `n=5` only | R04 |
| 44 | Conway/KT obstruction | `τ(K′)` | `0 ≤ g₄`, no obstruction; `s` nonzero | R07 |
| 45 | finite-volume Mostow–Prasad (`FiniteVolumeExtension.lean:143`) | same model `E`, `3≤finrank E` | both manifolds modelled on `E`, so equal dimension; isometry exists by Mostow–Prasad | statement sound; R11 is about the derived corollary |

**Library declarations opened at the pins** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`; paths library-relative): `KnotTheory/PDCode/Jones.lean:110, 240, 287, 304` (`jonesPolynomial`, mirror, unknot, right trefoil `t+t³−t⁴` in `T=t^{1/2}`); `KnotTheory/Markov.lean:100, 186, 203`; `KnotTheory/Alexander.lean:92, 378` (`alexanderMatrix`, `alexander = T^{−⌊n/2⌋}·det`); `KnotTheory/SeifertMatrix/SEquivalence.lean:45` (`IntegralSquareMatrix`); `KnotTheory/TristramLevine/Basic.lean:76, 166, 184`; `KnotTheory/SmoothLink/Basic.lean:61`; `SmoothLink/AmbientIsotopy.lean:62`; `KnotTheory/Slice/Basic.lean:142, 277`; `Slice/Freedman.lean:64`; `KnotTheory/KnotGroup.lean:93, 102`; `PDCode/Oriented/Reidemeister/Equivalence.lean:95, 130, 290`; `Algebra/TemperleyLieb/Basic.lean:20`; `LowDimTopology/JSJDecomposition.lean:100, 140, 194, 210, 248`; `LowDimTopology/Geometrization.lean:107, 144`; `LowDimTopology/SeifertFibration.lean:168, 194, 206`; `LowDimTopology/DehnSurgery/Slope.lean:122, 221, 253`; `Geometry/Diffeomorphism/Group.lean:178`; `Geometry/Diffeomorphism/Smale.lean:46`; `AlgebraicTopology/SimplicialComplex/Zeeman.lean:62, 124`; `CombinatorialManifold.lean:80, 86, 193`; `Topology/Triangulable.lean:40`; `Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:40, 72`, `Volume.lean:50, 104, 122`, `FiniteVolume.lean:63, 97`, `VirtualFibering.lean:62`; `Geometry/Manifold/SmoothEmbedding/Concordance.lean:93, 101`; `Geometry/Manifold/LocallyFlat/Annulus.lean:91, 105`, `Brown.lean:39`, `Basic.lean:376`; `LowDimTopology/SolidTorusNeighborhood/Basic.lean:34` (`exists_isOpenEmbedding_normalTube`); `Mathlib/GroupTheory/Rank.lean:33`. All 16 `TauCeti.*` modules imported by the companion files exist at the pin.

**Cross-roadmap resolution.** `roadmaps resolve` found no missing cross-roadmap citation; its three Lean leads (`IsolatedRealRoots`, `hasCoveringDimensionLE_of`, `HasOrderLE`) are names this roadmap proposes, not claimed library declarations. Every roadmap named in the supplier table exists on main or as a new-roadmap pull request (SurfaceTopology and PlanarTopology in #271, FourManifolds #936, TangentialBordism #942, AlgebraicKTheory #1142, HomotopySpheres #284/#1287, LieGroupoidsPoisson #1050, TemperleyLieb #58, TemperleyLiebOperatorAlgebras #867, IndexTheory #1077, TeichmullerGeometry #1169, StableHomotopyKTheory #1227, GeneralAlgebraicKTheory #1212, GeometryOfNumbersAndQuadraticArithmetic #851, RealAlgebraicGeometry and SpinGeometry on main) except `CoveringDimensionCore` (README 5104 area: not on main, not in any open pull request, not on the board). Reverse edges from main are listed under R01; `HopfRinow/README.md:22` is one-way (consumed here only) and sound. Ownership against the open pull requests whose files the brief lists was checked by object for knots, JSJ, Heegaard and foliations: none of them builds these objects. GT is not in the merge order; placement after its last supplier is consistent except for the cycles of R01.

**Seeded sample.** "Finite-dimensional immersion and embedding criterion" (892–906): cites `TauCeti.isImmersion_iff_forall_isImmersionAt` in `Geometry/Manifold/Immersion.lean`, present at the pin; the inverse-function-theorem route is standard. "From Mathlib / earlier layers" (nine occurrences): every Mathlib file named exists at the pin; the Tau Ceti omissions are R08. "The complete `5₂` colouring calculation": algebra verified (rows 1–3); the source pages are not readable (R14). "GT4.KondoRealization": `kondo1979` line 269 (Theorem 3, printed p. 558–559), line 258 (equation (8), p. 558), line 266 (the `2a_{n−1}+2n−1` correction), consistent with the README's shift term; the equation's symbols are lost in the extraction. "Trefoils, peripheral signs and prime-knot groups": algebra verified (row 14); Friedl's notes could not be fetched in time (see Not verifiable). "Cube- and sixth-root phases": rows 21–25. "What to build" (twelve occurrences) and "What to build, in this order": read in full for Layers 2, 3, 5, 6, 8, 9, 10, 11; findings R05–R10. "Torus knots and chirality": row 18. "Precise prerequisite handoffs" (3535): consumes Layer 3's isotopy extension and item 3g; wording is process residue (R13). "Unlocks" (eleven occurrences): the Kirby numbers of R15; the rest consistent with the list as read last round. "References": R14, R15. `conway2019`: §2.3 at line 168, §2.4 at line 227, Theorem 2.9 (raw signature concordance-invariant exactly off the roots) at line 242, Proposition 2.7 (crossing change) at line 191, as the README uses them. `yazdi2016`: Main Theorem line 111; Lemma 4.1 (genus 3 or `g ≥ 6`) line 964; Lemmas 5.1, 5.2, 5.4, 5.5 at lines 1142, 1274, 1397, 1437. `whitten1987`: paywalled, recorded uncertified.

## Not verifiable

- *Knot Theory.pdf* and *Knot Theory - problems.pdf* (sha256-identified course notes; README 1526–1605, 1786, 2208, 2377, 2543, 3307, `source-inputs.md`): not in the sources cache, not in the operator's local source directory, no legal URL given. Every "physical page" locator and every claim that a source assertion is false (for example "the printed ≥ n" at 1582) is unverified.
- `friedl2024` (Lemma 7.3, Theorem 16.11): the author-page fetch timed out twice.
- `whitten1987` (Topology 26): paywalled; uncertified by locator.
- `kirby1997`: no legal text found this round; the 4.34 and 1.82 checks rest on Watanabe's citation and on last round's reading.
- `FiniteVolumeExtension.lean`: not elaborated (its Tau Ceti import is unbuilt in this worktree); its `module`/`public import` form was not tested.
- The 25 companion files were read, not built, except `SimplicialLinks.lean`.
- Named-knot identification of the two four-strand words (KT, Conway) and of the Dowker reference rows.

## Source issues

- none
